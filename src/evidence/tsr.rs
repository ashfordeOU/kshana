// SPDX-License-Identifier: AGPL-3.0-only
//! Reading an RFC 3161 timestamp token far enough to bind it to a pack.
//!
//! What this checks: the token parses; it is a granted response (if given as a full
//! `TimeStampResp`); its message imprint names SHA-256, SHA-384 or SHA-512; and the
//! imprint equals that hash of `manifest.json`. It reports the time the authority stated.
//!
//! What it does **not** check: the authority's CMS signature and certificate chain. That
//! needs RSA/ECDSA and X.509 validation, which this build does not carry. The report says
//! so every time; verify the token with `openssl ts -verify` against the authority's
//! certificate (see `docs/EVIDENCE-PACKS.md`).

use serde::Serialize;
use sha2::{Digest, Sha256, Sha384, Sha512};

/// What the token states.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TokenInfo {
    /// Hash algorithm of the message imprint (`sha256`, `sha384`, `sha512`).
    pub hash_alg: String,
    /// The imprint, hex.
    pub imprint: String,
    /// The time the authority stated, RFC 3339 UTC.
    pub gen_time: String,
}

const OID_SHA256: &[u8] = &[0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01];
const OID_SHA384: &[u8] = &[0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02];
const OID_SHA512: &[u8] = &[0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x03];

/// One DER element: (tag, content, rest).
fn tlv(b: &[u8]) -> Result<(u8, &[u8], &[u8]), String> {
    let tag = *b.first().ok_or("truncated DER")?;
    let l0 = *b.get(1).ok_or("truncated DER")?;
    let (len, hdr) = match l0 {
        0x80 => return Err("indefinite-length BER is not supported".into()),
        n if n < 0x80 => (usize::from(n), 2),
        n => {
            let k = usize::from(n & 0x7f);
            if k == 0 || k > 4 || b.len() < 2 + k {
                return Err("bad DER length".into());
            }
            let mut v = 0usize;
            for x in &b[2..2 + k] {
                v = (v << 8) | usize::from(*x);
            }
            (v, 2 + k)
        }
    };
    let end = hdr.checked_add(len).ok_or("bad DER length")?;
    if b.len() < end {
        return Err("truncated DER".into());
    }
    Ok((tag, &b[hdr..end], &b[end..]))
}

fn expect<'a>(b: &'a [u8], tag: u8, what: &str) -> Result<(&'a [u8], &'a [u8]), String> {
    let (t, c, r) = tlv(b)?;
    if t != tag {
        return Err(format!("expected {what} (tag {tag:#04x}), found {t:#04x}"));
    }
    Ok((c, r))
}

/// Parse a token (a `TimeStampToken`, or a whole `TimeStampResp` as `openssl ts -reply`
/// writes it).
pub fn parse_token(der: &[u8]) -> Result<TokenInfo, String> {
    let (outer, _) = expect(der, 0x30, "SEQUENCE")?;
    let (first_tag, first, after) = tlv(outer)?;
    let content_info: &[u8] = if first_tag == 0x30 {
        // PKIStatusInfo { status INTEGER, ... } then the token.
        let (st, _, _) = tlv(first)?;
        if st != 0x02 {
            return Err("malformed PKIStatusInfo".into());
        }
        let (_, status, _) = tlv(first)?;
        if status.len() != 1 || status[0] > 1 {
            return Err("the timestamp response was not granted".into());
        }
        let (c, _) = expect(after, 0x30, "timeStampToken")?;
        c
    } else if first_tag == 0x06 {
        outer
    } else {
        return Err("not a timestamp token".into());
    };
    // ContentInfo: OID, [0] SignedData
    let (_, rest) = expect(content_info, 0x06, "contentType")?;
    let (wrapped, _) = expect(rest, 0xA0, "[0] content")?;
    let (signed, _) = expect(wrapped, 0x30, "SignedData")?;
    let (_, rest) = expect(signed, 0x02, "version")?;
    let (_, rest) = expect(rest, 0x31, "digestAlgorithms")?;
    let (encap, _) = expect(rest, 0x30, "encapContentInfo")?;
    let (_, rest) = expect(encap, 0x06, "eContentType")?;
    let (e0, _) = expect(rest, 0xA0, "[0] eContent")?;
    let (tst, _) = expect(e0, 0x04, "eContent OCTET STRING")?;
    // TSTInfo
    let (info, _) = expect(tst, 0x30, "TSTInfo")?;
    let (_, rest) = expect(info, 0x02, "TSTInfo version")?;
    let (_, rest) = expect(rest, 0x06, "policy")?;
    let (imprint, rest) = expect(rest, 0x30, "messageImprint")?;
    let (alg_seq, rest_imp) = expect(imprint, 0x30, "hashAlgorithm")?;
    let (oid, _) = expect(alg_seq, 0x06, "hash OID")?;
    let (digest, _) = expect(rest_imp, 0x04, "hashedMessage")?;
    let hash_alg = match oid {
        o if o == OID_SHA256 => "sha256",
        o if o == OID_SHA384 => "sha384",
        o if o == OID_SHA512 => "sha512",
        _ => return Err("message imprint uses an unsupported hash algorithm".into()),
    };
    let (_, rest) = expect(rest, 0x02, "serialNumber")?;
    let (gt, _) = expect(rest, 0x18, "genTime")?;
    Ok(TokenInfo {
        hash_alg: hash_alg.into(),
        imprint: hex::encode(digest),
        gen_time: general_time(gt)?,
    })
}

/// `YYYYMMDDHHMMSS[.f+]Z` to RFC 3339.
fn general_time(b: &[u8]) -> Result<String, String> {
    let s = std::str::from_utf8(b).map_err(|_| "genTime is not text")?;
    let s = s.strip_suffix('Z').ok_or("genTime is not UTC")?;
    let (main, frac) = match s.split_once('.') {
        Some((m, f)) => (m, Some(f)),
        None => (s, None),
    };
    if main.len() != 14 || !main.bytes().all(|c| c.is_ascii_digit()) {
        return Err("malformed genTime".into());
    }
    let mut o = format!(
        "{}-{}-{}T{}:{}:{}",
        &main[0..4],
        &main[4..6],
        &main[6..8],
        &main[8..10],
        &main[10..12],
        &main[12..14]
    );
    if let Some(f) = frac {
        if f.is_empty() || !f.bytes().all(|c| c.is_ascii_digit()) {
            return Err("malformed genTime".into());
        }
        o.push('.');
        o.push_str(f);
    }
    o.push('Z');
    Ok(o)
}

/// The hash of `data` in the algorithm a token's imprint names.
pub fn imprint_of(hash_alg: &str, data: &[u8]) -> Option<String> {
    match hash_alg {
        "sha256" => Some(hex::encode(Sha256::digest(data))),
        "sha384" => Some(hex::encode(Sha384::digest(data))),
        "sha512" => Some(hex::encode(Sha512::digest(data))),
        _ => None,
    }
}

#[cfg(test)]
pub(crate) mod test_token {
    //! Builds an unsigned, synthetic token for tests. Not a real authority's output.
    fn enc(tag: u8, content: &[u8]) -> Vec<u8> {
        let mut o = vec![tag];
        if content.len() < 0x80 {
            o.push(content.len() as u8);
        } else {
            o.extend([0x82, (content.len() >> 8) as u8, content.len() as u8]);
        }
        o.extend(content);
        o
    }

    pub fn token(digest: &[u8], gen_time: &str, wrap_resp: bool) -> Vec<u8> {
        let oid_sha256 = enc(0x06, super::OID_SHA256);
        let alg = enc(0x30, &oid_sha256);
        let imprint = enc(0x30, &[alg, enc(0x04, digest)].concat());
        let tst = enc(
            0x30,
            &[
                enc(0x02, &[1]),
                enc(0x06, &[0x2a, 0x03]),
                imprint,
                enc(0x02, &[7]),
                enc(0x18, gen_time.as_bytes()),
            ]
            .concat(),
        );
        let encap = enc(
            0x30,
            &[enc(0x06, &[0x2a, 0x04]), enc(0xA0, &enc(0x04, &tst))].concat(),
        );
        let signed = enc(0x30, &[enc(0x02, &[3]), enc(0x31, &[]), encap].concat());
        let ci = [enc(0x06, &[0x2a, 0x05]), enc(0xA0, &signed)].concat();
        if wrap_resp {
            let status = enc(0x30, &enc(0x02, &[0]));
            enc(0x30, &[status, enc(0x30, &ci)].concat())
        } else {
            enc(0x30, &ci)
        }
    }
}

#[cfg(test)]
mod tests {
    use super::test_token::token;
    use super::*;

    #[test]
    fn parses_token_and_response_forms() {
        let d = [7u8; 32];
        for wrap in [false, true] {
            let t = parse_token(&token(&d, "20260102030405.25Z", wrap)).unwrap();
            assert_eq!(t.hash_alg, "sha256");
            assert_eq!(t.imprint, hex::encode(d));
            assert_eq!(t.gen_time, "2026-01-02T03:04:05.25Z");
        }
    }

    #[test]
    fn rejects_garbage_and_truncation() {
        assert!(parse_token(b"").is_err());
        assert!(parse_token(b"hello").is_err());
        let t = token(&[1u8; 32], "20260102030405Z", true);
        for n in [1, 5, t.len() / 2, t.len() - 1] {
            assert!(parse_token(&t[..n]).is_err(), "prefix {n}");
        }
    }

    #[test]
    fn rejects_non_granted_response() {
        let mut t = token(&[1u8; 32], "20260102030405Z", true);
        // status INTEGER value sits at a fixed place in this builder's output.
        let pos = t.windows(3).position(|w| w == [0x02, 0x01, 0x00]).unwrap();
        t[pos + 2] = 2;
        assert!(parse_token(&t).unwrap_err().contains("not granted"));
    }
}
