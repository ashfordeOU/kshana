// SPDX-License-Identifier: AGPL-3.0-only
//! RFC 3161 timestamp-token verification: the authority's signature and its chain of trust.
//!
//! [`crate::evidence::tsr`] reads a token for its message imprint only. This module checks
//! the rest, the way `openssl ts -verify` does (and `openssl cms -verify -cades -purpose
//! timestampsign` for RSA-PSS tokens), so an evidence pack's timestamp can be verified
//! offline against a trusted anchor:
//!
//! 1. the token: a `TimeStampResp` (status granted or granted-with-modifications) or a bare
//!    `TimeStampToken`, a CMS `SignedData` whose encapsulated content is a `TSTInfo`;
//! 2. the signed attributes: `contentType` equal to the encapsulated type and `messageDigest`
//!    equal to the digest of the `TSTInfo`;
//! 3. the signer certificate, found among the token's certificates and the caller's untrusted
//!    ones by issuer and serial number (or subject key identifier);
//! 4. the signature over the DER of the signed attributes: RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA
//!    over P-256 or P-384;
//! 5. the ESS signing-certificate attribute (v1, SHA-1; or v2, any SHA-2): its first entry's
//!    hash names the signer certificate (RFC 2634, RFC 5035);
//! 6. the signer certificate's extended key usage: present, critical and only `timeStamping`
//!    (RFC 3161 section 2.3), and a key usage, if present, allowing signatures;
//! 7. the chain from the signer to a trusted, self-issued anchor: each certificate's signature
//!    by its issuer, each issuer a CA allowed to sign certificates, and every certificate valid
//!    at the token's `genTime` (the time the authority stated, as `openssl ... -attime`);
//! 8. the `TSTInfo` message imprint against the stamped data.
//!
//! Not checked: revocation (no CRL or OCSP), name constraints, policy constraints, the
//! token's nonce or policy. Verification uses public data only.

use crypto_bigint::modular::runtime_mod::{DynResidue, DynResidueParams};
use crypto_bigint::{Encoding, U4096};
use sha1::Sha1;
use sha2::{Digest, Sha256, Sha384, Sha512};

/// The outcome of a verification.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct TsaVerdict {
    /// True when every check passed.
    pub pass: bool,
    /// `-` on a pass, else the first check that failed.
    pub reason: String,
    /// The token's `genTime` as Unix seconds, when it could be read.
    pub gen_time_unix: Option<i64>,
}

// ── DER ───────────────────────────────────────────────────────────────────────

#[derive(Clone, Copy, Debug)]
struct Tlv<'a> {
    tag: u8,
    /// Header and content.
    full: &'a [u8],
    /// Content.
    body: &'a [u8],
}

fn read(b: &[u8]) -> Result<(Tlv<'_>, &[u8]), String> {
    let tag = *b.first().ok_or("truncated DER")?;
    let l0 = *b.get(1).ok_or("truncated DER")?;
    let (len, hdr) = if l0 < 0x80 {
        (l0 as usize, 2)
    } else {
        let n = (l0 & 0x7f) as usize;
        if n == 0 || n > 4 || b.len() < 2 + n {
            return Err("bad DER length".into());
        }
        let mut len = 0usize;
        for &x in &b[2..2 + n] {
            len = (len << 8) | x as usize;
        }
        (len, 2 + n)
    };
    if b.len() < hdr + len {
        return Err("truncated DER".into());
    }
    Ok((
        Tlv {
            tag,
            full: &b[..hdr + len],
            body: &b[hdr..hdr + len],
        },
        &b[hdr + len..],
    ))
}

fn items(mut b: &[u8]) -> Result<Vec<Tlv<'_>>, String> {
    let mut v = Vec::new();
    while !b.is_empty() {
        let (t, rest) = read(b)?;
        v.push(t);
        b = rest;
    }
    Ok(v)
}

fn expect<'a>(t: &Tlv<'a>, tag: u8, what: &str) -> Result<Vec<Tlv<'a>>, String> {
    if t.tag != tag {
        return Err(format!("{what}: unexpected DER tag {:#04x}", t.tag));
    }
    items(t.body)
}

/// Strip leading zero octets of a DER INTEGER's content.
fn unsigned(b: &[u8]) -> &[u8] {
    let mut i = 0;
    while i + 1 < b.len() && b[i] == 0 {
        i += 1;
    }
    &b[i..]
}

// Object identifiers, as DER content octets.
const OID_SIGNED_DATA: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x07, 0x02];
const OID_TST_INFO: &[u8] = &[
    0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x09, 0x10, 0x01, 0x04,
];
const OID_CONTENT_TYPE: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x09, 0x03];
const OID_MESSAGE_DIGEST: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x09, 0x04];
const OID_SIGNING_CERT: &[u8] = &[
    0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x09, 0x10, 0x02, 0x0c,
];
const OID_SIGNING_CERT_V2: &[u8] = &[
    0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x09, 0x10, 0x02, 0x2f,
];
const OID_RSA: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01];
const OID_RSA_SHA1: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x05];
const OID_RSA_SHA256: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x0b];
const OID_RSA_SHA384: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x0c];
const OID_RSA_SHA512: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x0d];
const OID_RSA_PSS: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x0a];
const OID_MGF1: &[u8] = &[0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x08];
const OID_EC_PUBLIC_KEY: &[u8] = &[0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01];
const OID_P256: &[u8] = &[0x2a, 0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07];
const OID_P384: &[u8] = &[0x2b, 0x81, 0x04, 0x00, 0x22];
const OID_ECDSA_SHA256: &[u8] = &[0x2a, 0x86, 0x48, 0xce, 0x3d, 0x04, 0x03, 0x02];
const OID_ECDSA_SHA384: &[u8] = &[0x2a, 0x86, 0x48, 0xce, 0x3d, 0x04, 0x03, 0x03];
const OID_ECDSA_SHA512: &[u8] = &[0x2a, 0x86, 0x48, 0xce, 0x3d, 0x04, 0x03, 0x04];
const OID_SHA1: &[u8] = &[0x2b, 0x0e, 0x03, 0x02, 0x1a];
const OID_SHA256: &[u8] = &[0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01];
const OID_SHA384: &[u8] = &[0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02];
const OID_SHA512: &[u8] = &[0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x03];
const OID_BASIC_CONSTRAINTS: &[u8] = &[0x55, 0x1d, 0x13];
const OID_KEY_USAGE: &[u8] = &[0x55, 0x1d, 0x0f];
const OID_EXT_KEY_USAGE: &[u8] = &[0x55, 0x1d, 0x25];
const OID_SKI: &[u8] = &[0x55, 0x1d, 0x0e];
const OID_KP_TIMESTAMPING: &[u8] = &[0x2b, 0x06, 0x01, 0x05, 0x05, 0x07, 0x03, 0x08];

#[derive(Clone, Copy, Debug, PartialEq)]
enum Hash {
    Sha1,
    Sha256,
    Sha384,
    Sha512,
}

impl Hash {
    fn from_oid(oid: &[u8]) -> Option<Self> {
        match oid {
            OID_SHA1 => Some(Hash::Sha1),
            OID_SHA256 => Some(Hash::Sha256),
            OID_SHA384 => Some(Hash::Sha384),
            OID_SHA512 => Some(Hash::Sha512),
            _ => None,
        }
    }
    fn digest(self, m: &[u8]) -> Vec<u8> {
        match self {
            Hash::Sha1 => Sha1::digest(m).to_vec(),
            Hash::Sha256 => Sha256::digest(m).to_vec(),
            Hash::Sha384 => Sha384::digest(m).to_vec(),
            Hash::Sha512 => Sha512::digest(m).to_vec(),
        }
    }
    fn len(self) -> usize {
        match self {
            Hash::Sha1 => 20,
            Hash::Sha256 => 32,
            Hash::Sha384 => 48,
            Hash::Sha512 => 64,
        }
    }
    /// The DER prefix of a PKCS#1 v1.5 `DigestInfo` (with the NULL parameters).
    fn digest_info_prefix(self) -> &'static [u8] {
        match self {
            Hash::Sha1 => &[
                0x30, 0x21, 0x30, 0x09, 0x06, 0x05, 0x2b, 0x0e, 0x03, 0x02, 0x1a, 0x05, 0x00, 0x04,
                0x14,
            ],
            Hash::Sha256 => &[
                0x30, 0x31, 0x30, 0x0d, 0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02,
                0x01, 0x05, 0x00, 0x04, 0x20,
            ],
            Hash::Sha384 => &[
                0x30, 0x41, 0x30, 0x0d, 0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02,
                0x02, 0x05, 0x00, 0x04, 0x30,
            ],
            Hash::Sha512 => &[
                0x30, 0x51, 0x30, 0x0d, 0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02,
                0x03, 0x05, 0x00, 0x04, 0x40,
            ],
        }
    }
}

/// The hash named by an `AlgorithmIdentifier` (its first element, the OID).
fn alg_hash(alg: &Tlv) -> Result<Hash, String> {
    let a = expect(alg, 0x30, "AlgorithmIdentifier")?;
    let oid = a.first().ok_or("empty AlgorithmIdentifier")?;
    Hash::from_oid(oid.body).ok_or_else(|| "unsupported digest algorithm".to_string())
}

// ── time ──────────────────────────────────────────────────────────────────────

fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let mp = (m + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

fn digits(s: &[u8]) -> Option<i64> {
    let mut v = 0i64;
    for &c in s {
        if !c.is_ascii_digit() {
            return None;
        }
        v = v * 10 + (c - b'0') as i64;
    }
    Some(v)
}

/// A `UTCTime` (tag 0x17) or `GeneralizedTime` (0x18) as Unix seconds (fraction dropped).
fn time_of(t: &Tlv) -> Result<i64, String> {
    let s = t.body;
    let (y, rest) = match t.tag {
        0x17 if s.len() >= 13 => {
            let yy = digits(&s[0..2]).ok_or("bad UTCTime")?;
            (if yy < 50 { 2000 + yy } else { 1900 + yy }, &s[2..])
        }
        0x18 if s.len() >= 15 => (digits(&s[0..4]).ok_or("bad GeneralizedTime")?, &s[4..]),
        _ => return Err("bad time".into()),
    };
    if *s.last().unwrap_or(&0) != b'Z' {
        return Err("time not in UTC".into());
    }
    let f = |i: usize| digits(&rest[i..i + 2]).ok_or("bad time digits");
    let (mo, d, h, mi, se) = (f(0)?, f(2)?, f(4)?, f(6)?, f(8)?);
    Ok(days_from_civil(y, mo, d) * 86_400 + h * 3600 + mi * 60 + se)
}

// ── certificates ──────────────────────────────────────────────────────────────

#[derive(Clone, Debug)]
struct Cert<'a> {
    der: &'a [u8],
    tbs: &'a [u8],
    sig_alg: Tlv<'a>,
    sig: &'a [u8],
    serial: &'a [u8],
    issuer: &'a [u8],
    subject: &'a [u8],
    not_before: i64,
    not_after: i64,
    spki: Tlv<'a>,
    ca: bool,
    /// Key usage bits (bit 0 = digitalSignature ... bit 5 = keyCertSign), if present.
    key_usage: Option<u16>,
    /// Extended key usage: (critical, purposes), if present.
    eku: Option<(bool, Vec<&'a [u8]>)>,
    ski: Option<&'a [u8]>,
}

fn bit_string<'a>(t: &Tlv<'a>) -> Result<&'a [u8], String> {
    if t.tag != 0x03 || t.body.is_empty() {
        return Err("bad BIT STRING".into());
    }
    Ok(&t.body[1..])
}

fn parse_cert(der: &[u8]) -> Result<Cert<'_>, String> {
    let (c, _) = read(der)?;
    let top = expect(&c, 0x30, "Certificate")?;
    if top.len() != 3 {
        return Err("Certificate: three elements expected".into());
    }
    let tbs = expect(&top[0], 0x30, "TBSCertificate")?;
    let mut i = 0;
    if tbs.first().map(|t| t.tag) == Some(0xa0) {
        i = 1;
    }
    let get = |k: usize| tbs.get(k).copied().ok_or("TBSCertificate: too short");
    let serial = get(i)?;
    let issuer = get(i + 2)?;
    let validity = expect(&get(i + 3)?, 0x30, "Validity")?;
    let subject = get(i + 4)?;
    let spki = get(i + 5)?;
    let (mut ca, mut key_usage, mut eku, mut ski) = (false, None, None, None);
    for t in &tbs[i + 6..] {
        if t.tag != 0xa3 {
            continue;
        }
        let (exts, _) = read(t.body)?;
        for e in expect(&exts, 0x30, "Extensions")? {
            let f = expect(&e, 0x30, "Extension")?;
            let oid = f.first().ok_or("empty Extension")?.body;
            let critical = f.len() == 3 && f[1].tag == 0x01 && f[1].body.first() == Some(&0xff);
            let value = f.last().ok_or("empty Extension")?;
            if value.tag != 0x04 {
                return Err("Extension: value not an OCTET STRING".into());
            }
            match oid {
                OID_BASIC_CONSTRAINTS => {
                    let (bc, _) = read(value.body)?;
                    let b = expect(&bc, 0x30, "BasicConstraints")?;
                    ca = b
                        .first()
                        .is_some_and(|x| x.tag == 0x01 && x.body.first() == Some(&0xff));
                }
                OID_KEY_USAGE => {
                    let (ku, _) = read(value.body)?;
                    let bits = bit_string(&ku)?;
                    let b0 = *bits.first().unwrap_or(&0) as u16;
                    let b1 = *bits.get(1).unwrap_or(&0) as u16;
                    // DER bit 0 is the most significant bit of the first octet.
                    let mut v = 0u16;
                    for k in 0..9 {
                        let set = if k < 8 {
                            b0 >> (7 - k) & 1
                        } else {
                            b1 >> 7 & 1
                        };
                        v |= set << k;
                    }
                    key_usage = Some(v);
                }
                OID_EXT_KEY_USAGE => {
                    let (s, _) = read(value.body)?;
                    let purposes = expect(&s, 0x30, "ExtKeyUsage")?
                        .iter()
                        .map(|p| p.body)
                        .collect();
                    eku = Some((critical, purposes));
                }
                OID_SKI => {
                    let (k, _) = read(value.body)?;
                    ski = Some(k.body);
                }
                _ => {}
            }
        }
    }
    Ok(Cert {
        der: c.full,
        tbs: top[0].full,
        sig_alg: top[1],
        sig: bit_string(&top[2])?,
        serial: unsigned(serial.body),
        issuer: issuer.full,
        subject: subject.full,
        not_before: time_of(validity.first().ok_or("Validity: empty")?)?,
        not_after: time_of(validity.get(1).ok_or("Validity: short")?)?,
        spki,
        ca,
        key_usage,
        eku,
        ski,
    })
}

/// Read every certificate of a PEM text.
pub fn pem_certificates(text: &str) -> Result<Vec<Vec<u8>>, String> {
    let mut out = Vec::new();
    let mut cur: Option<String> = None;
    for line in text.lines() {
        let l = line.trim();
        if l == "-----BEGIN CERTIFICATE-----" {
            cur = Some(String::new());
        } else if l == "-----END CERTIFICATE-----" {
            let b64 = cur.take().ok_or("PEM: END without BEGIN")?;
            out.push(base64_decode(&b64)?);
        } else if let Some(c) = cur.as_mut() {
            c.push_str(l);
        }
    }
    Ok(out)
}

/// Standard base64 (RFC 4648 section 4) with `=` padding, whitespace already removed.
fn base64_decode(s: &str) -> Result<Vec<u8>, String> {
    let val = |c: u8| -> Result<u32, String> {
        Ok(match c {
            b'A'..=b'Z' => (c - b'A') as u32,
            b'a'..=b'z' => (c - b'a' + 26) as u32,
            b'0'..=b'9' => (c - b'0' + 52) as u32,
            b'+' => 62,
            b'/' => 63,
            _ => return Err("PEM: bad base64".into()),
        })
    };
    let b = s.trim_end_matches('=').as_bytes();
    let mut out = Vec::with_capacity(b.len() * 3 / 4);
    for chunk in b.chunks(4) {
        let mut acc = 0u32;
        for (i, &c) in chunk.iter().enumerate() {
            acc |= val(c)? << (18 - 6 * i);
        }
        let n = match chunk.len() {
            4 => 3,
            3 => 2,
            2 => 1,
            _ => return Err("PEM: bad base64 length".into()),
        };
        out.extend_from_slice(&acc.to_be_bytes()[1..1 + n]);
    }
    Ok(out)
}

// ── signatures ────────────────────────────────────────────────────────────────

enum Key<'a> {
    Rsa { n: &'a [u8], e: &'a [u8] },
    P256(&'a [u8]),
    P384(&'a [u8]),
}

fn public_key<'a>(spki: &Tlv<'a>) -> Result<Key<'a>, String> {
    let s = expect(spki, 0x30, "SubjectPublicKeyInfo")?;
    let alg = expect(s.first().ok_or("SPKI: empty")?, 0x30, "SPKI algorithm")?;
    let oid = alg.first().ok_or("SPKI: no OID")?.body;
    let bits = bit_string(s.get(1).ok_or("SPKI: no key")?)?;
    match oid {
        OID_RSA | OID_RSA_PSS => {
            let (k, _) = read(bits)?;
            let ne = expect(&k, 0x30, "RSAPublicKey")?;
            if ne.len() != 2 {
                return Err("RSAPublicKey: two integers expected".into());
            }
            Ok(Key::Rsa {
                n: unsigned(ne[0].body),
                e: unsigned(ne[1].body),
            })
        }
        OID_EC_PUBLIC_KEY => match alg.get(1).map(|c| c.body) {
            Some(OID_P256) => Ok(Key::P256(bits)),
            Some(OID_P384) => Ok(Key::P384(bits)),
            _ => Err("unsupported elliptic curve".into()),
        },
        _ => Err("unsupported public-key algorithm".into()),
    }
}

/// `s^e mod n` for an RSA public key of at most 4096 bits, big-endian, left-padded to `n`'s
/// length.
fn rsa_public(n: &[u8], e: &[u8], s: &[u8]) -> Result<Vec<u8>, String> {
    let k = n.len();
    if k > 512 || e.len() > 512 || s.len() > k {
        return Err("RSA key or signature too large".into());
    }
    let pad = |b: &[u8]| {
        let mut v = vec![0u8; 512];
        v[512 - b.len()..].copy_from_slice(b);
        U4096::from_be_slice(&v)
    };
    let (nn, ee, ss) = (pad(n), pad(e), pad(s));
    if n.last().is_none_or(|b| b & 1 == 0) {
        return Err("RSA modulus not odd".into());
    }
    if ss >= nn {
        return Err("RSA signature out of range".into());
    }
    let params = DynResidueParams::new(&nn);
    let m = DynResidue::new(&ss, params).pow(&ee).retrieve();
    Ok(m.to_be_bytes()[512 - k..].to_vec())
}

fn verify_pkcs1(n: &[u8], e: &[u8], hash: Hash, msg: &[u8], sig: &[u8]) -> Result<(), String> {
    let em = rsa_public(n, e, sig)?;
    let h = hash.digest(msg);
    let prefix = hash.digest_info_prefix();
    let t_len = prefix.len() + h.len();
    if em.len() < t_len + 11 {
        return Err("RSA key too small".into());
    }
    let ps = em.len() - t_len - 3;
    let mut want = vec![0x00, 0x01];
    want.extend(std::iter::repeat_n(0xff, ps));
    want.push(0x00);
    want.extend_from_slice(prefix);
    want.extend_from_slice(&h);
    if em == want {
        Ok(())
    } else {
        Err("invalid padding".into())
    }
}

fn mgf1(hash: Hash, seed: &[u8], len: usize) -> Vec<u8> {
    let mut out = Vec::with_capacity(len + hash.len());
    let mut c: u32 = 0;
    while out.len() < len {
        let mut m = seed.to_vec();
        m.extend_from_slice(&c.to_be_bytes());
        out.extend(hash.digest(&m));
        c += 1;
    }
    out.truncate(len);
    out
}

/// RSASSA-PSS verification (RFC 8017 section 8.1.2 and EMSA-PSS-VERIFY, section 9.1.2).
fn verify_pss(
    n: &[u8],
    e: &[u8],
    hash: Hash,
    mgf_hash: Hash,
    salt_len: usize,
    msg: &[u8],
    sig: &[u8],
) -> Result<(), String> {
    let em_full = rsa_public(n, e, sig)?;
    let mod_bits = n.len() * 8 - n[0].leading_zeros() as usize;
    let em_bits = mod_bits - 1;
    let em_len = em_bits.div_ceil(8);
    let em = &em_full[em_full.len() - em_len..];
    if em_full.len() > em_len && em_full[..em_full.len() - em_len].iter().any(|&b| b != 0) {
        return Err("PSS: encoded message too long".into());
    }
    let h_len = hash.len();
    if em_len < h_len + salt_len + 2 || *em.last().unwrap_or(&0) != 0xbc {
        return Err("last octet invalid".into());
    }
    let (masked_db, rest) = em.split_at(em_len - h_len - 1);
    let h = &rest[..h_len];
    let top_bits = 8 * em_len - em_bits;
    if top_bits > 0 && masked_db[0] >> (8 - top_bits) != 0 {
        return Err("PSS: leftmost bits not zero".into());
    }
    let mask = mgf1(mgf_hash, h, masked_db.len());
    let mut db: Vec<u8> = masked_db.iter().zip(&mask).map(|(a, b)| a ^ b).collect();
    if top_bits > 0 {
        db[0] &= 0xff >> top_bits;
    }
    let ps = em_len - h_len - salt_len - 2;
    if db[..ps].iter().any(|&b| b != 0) || db[ps] != 0x01 {
        return Err("PSS: bad padding".into());
    }
    let salt = &db[db.len() - salt_len..];
    let mut m2 = vec![0u8; 8];
    m2.extend(hash.digest(msg));
    m2.extend_from_slice(salt);
    if hash.digest(&m2) == h {
        Ok(())
    } else {
        Err("PSS: signature mismatch".into())
    }
}

/// The PSS parameters of an `RSASSA-PSS-params` (defaults SHA-1, MGF1-SHA-1, salt 20).
fn pss_params(alg: &Tlv) -> Result<(Hash, Hash, usize), String> {
    let a = expect(alg, 0x30, "AlgorithmIdentifier")?;
    let (mut h, mut mh, mut salt) = (Hash::Sha1, Hash::Sha1, 20usize);
    if let Some(p) = a.get(1) {
        for f in expect(p, 0x30, "RSASSA-PSS-params")? {
            let (inner, _) = read(f.body)?;
            match f.tag {
                0xa0 => h = alg_hash(&inner)?,
                0xa1 => {
                    let m = expect(&inner, 0x30, "MaskGenAlgorithm")?;
                    if m.first().map(|o| o.body) != Some(OID_MGF1) {
                        return Err("unsupported mask generation function".into());
                    }
                    mh = alg_hash(m.get(1).ok_or("MGF1 without a hash")?)?;
                }
                0xa2 => {
                    if inner.tag != 0x02 {
                        return Err("bad PSS salt length".into());
                    }
                    salt = unsigned(inner.body)
                        .iter()
                        .fold(0usize, |v, &b| (v << 8) | b as usize);
                }
                _ => {}
            }
        }
    }
    Ok((h, mh, salt))
}

fn verify_ecdsa(key: &Key, hash: Hash, msg: &[u8], sig: &[u8]) -> Result<(), String> {
    use p256::ecdsa::signature::hazmat::PrehashVerifier;
    let pre = hash.digest(msg);
    match key {
        Key::P256(pt) => {
            let vk = p256::ecdsa::VerifyingKey::from_sec1_bytes(pt).map_err(|_| "bad P-256 key")?;
            let s = p256::ecdsa::Signature::from_der(sig).map_err(|_| "bad ECDSA signature")?;
            vk.verify_prehash(&pre, &s)
                .map_err(|_| "signature failure".to_string())
        }
        Key::P384(pt) => {
            let vk = p384::ecdsa::VerifyingKey::from_sec1_bytes(pt).map_err(|_| "bad P-384 key")?;
            let s = p384::ecdsa::Signature::from_der(sig).map_err(|_| "bad ECDSA signature")?;
            vk.verify_prehash(&pre, &s)
                .map_err(|_| "signature failure".to_string())
        }
        Key::Rsa { .. } => Err("an ECDSA signature needs an EC key".into()),
    }
}

/// Verify `sig` over `msg` with `key` under the signature `AlgorithmIdentifier` `alg`;
/// `digest` is the CMS digest algorithm, used when `alg` names a bare key algorithm.
fn verify_sig(
    key: &Key,
    alg: &Tlv,
    digest: Option<Hash>,
    msg: &[u8],
    sig: &[u8],
) -> Result<(), String> {
    let a = expect(alg, 0x30, "AlgorithmIdentifier")?;
    let oid = a.first().ok_or("empty AlgorithmIdentifier")?.body;
    let rsa = |h: Hash| match key {
        Key::Rsa { n, e } => verify_pkcs1(n, e, h, msg, sig),
        _ => Err("an RSA signature needs an RSA key".to_string()),
    };
    match oid {
        OID_RSA_SHA1 => rsa(Hash::Sha1),
        OID_RSA_SHA256 => rsa(Hash::Sha256),
        OID_RSA_SHA384 => rsa(Hash::Sha384),
        OID_RSA_SHA512 => rsa(Hash::Sha512),
        OID_RSA => rsa(digest.ok_or("rsaEncryption without a digest algorithm")?),
        OID_RSA_PSS => {
            let (h, mh, salt) = pss_params(alg)?;
            match key {
                Key::Rsa { n, e } => verify_pss(n, e, h, mh, salt, msg, sig),
                _ => Err("an RSA-PSS signature needs an RSA key".into()),
            }
        }
        OID_ECDSA_SHA256 => verify_ecdsa(key, Hash::Sha256, msg, sig),
        OID_ECDSA_SHA384 => verify_ecdsa(key, Hash::Sha384, msg, sig),
        OID_ECDSA_SHA512 => verify_ecdsa(key, Hash::Sha512, msg, sig),
        OID_EC_PUBLIC_KEY => verify_ecdsa(
            key,
            digest.ok_or("id-ecPublicKey without a digest algorithm")?,
            msg,
            sig,
        ),
        _ => Err("unsupported signature algorithm".into()),
    }
}

// ── the token ─────────────────────────────────────────────────────────────────

/// Verify an RFC 3161 token (`TimeStampResp` or bare `TimeStampToken`, DER) over `data`
/// against the trusted `anchors` (DER certificates; a chain must end at a self-issued one),
/// with `untrusted` certificates (DER) available to find the signer and build the chain.
pub fn verify_token(
    token: &[u8],
    data: &[u8],
    anchors: &[Vec<u8>],
    untrusted: &[Vec<u8>],
) -> TsaVerdict {
    let mut gen_time = None;
    let r = check(token, data, anchors, untrusted, &mut gen_time);
    TsaVerdict {
        pass: r.is_ok(),
        reason: r.err().unwrap_or_else(|| "-".into()),
        gen_time_unix: gen_time,
    }
}

fn check(
    token: &[u8],
    data: &[u8],
    anchors: &[Vec<u8>],
    untrusted: &[Vec<u8>],
    gen_time: &mut Option<i64>,
) -> Result<(), String> {
    // TimeStampResp or ContentInfo.
    let (outer, _) = read(token)?;
    let o = expect(&outer, 0x30, "token")?;
    let content_info = match o.first().map(|t| t.tag) {
        Some(0x30) => {
            let status = expect(&o[0], 0x30, "PKIStatusInfo")?;
            let s = status.first().ok_or("PKIStatusInfo: empty")?;
            if s.tag != 0x02 || !matches!(unsigned(s.body), [0] | [1]) {
                return Err("time-stamp request not granted".into());
            }
            *o.get(1).ok_or("no time-stamp token in the response")?
        }
        Some(0x06) => outer,
        _ => return Err("not a TimeStampResp or TimeStampToken".into()),
    };
    let ci = expect(&content_info, 0x30, "ContentInfo")?;
    if ci.first().map(|t| t.body) != Some(OID_SIGNED_DATA) {
        return Err("not CMS SignedData".into());
    }
    let wrapped = ci.get(1).ok_or("ContentInfo: no content")?;
    let (sd_tlv, _) = read(wrapped.body)?;
    let sd = expect(&sd_tlv, 0x30, "SignedData")?;
    let encap = expect(
        sd.get(2).ok_or("SignedData: short")?,
        0x30,
        "EncapsulatedContentInfo",
    )?;
    let e_type = encap.first().ok_or("EncapsulatedContentInfo: empty")?.body;
    if e_type != OID_TST_INFO {
        return Err("encapsulated content is not a TSTInfo".into());
    }
    let (e_octets, _) = read(encap.get(1).ok_or("no TSTInfo")?.body)?;
    if e_octets.tag != 0x04 {
        return Err("TSTInfo not in an OCTET STRING".into());
    }
    let tst_der = e_octets.body;
    let (tst_tlv, _) = read(tst_der)?;
    let tst = expect(&tst_tlv, 0x30, "TSTInfo")?;
    let imprint = expect(tst.get(2).ok_or("TSTInfo: short")?, 0x30, "MessageImprint")?;
    let gt = time_of(tst.get(4).ok_or("TSTInfo: no genTime")?)?;
    *gen_time = Some(gt);

    // Certificates and signer.
    let mut token_certs: Vec<&[u8]> = Vec::new();
    let mut idx = 3;
    while let Some(t) = sd.get(idx) {
        match t.tag {
            0xa0 => token_certs.extend(items(t.body)?.iter().map(|c| c.full)),
            0xa1 => {}
            _ => break,
        }
        idx += 1;
    }
    let signers = expect(
        sd.get(idx).ok_or("SignedData: no signerInfos")?,
        0x31,
        "signerInfos",
    )?;
    if signers.len() != 1 {
        return Err("exactly one SignerInfo expected".into());
    }
    let si = expect(&signers[0], 0x30, "SignerInfo")?;
    let sid = si.get(1).ok_or("SignerInfo: no sid")?;
    let digest = alg_hash(si.get(2).ok_or("SignerInfo: no digest algorithm")?)?;
    let attrs = si.get(3).ok_or("SignerInfo: short")?;
    if attrs.tag != 0xa0 {
        return Err("SignerInfo: no signed attributes".into());
    }
    let sig_alg = si.get(4).ok_or("SignerInfo: no signature algorithm")?;
    let sig = si.get(5).ok_or("SignerInfo: no signature")?;

    let pool_signer: Vec<Cert> = token_certs
        .iter()
        .copied()
        .chain(untrusted.iter().map(|c| c.as_slice()))
        .map(parse_cert)
        .collect::<Result<_, _>>()?;
    let signer = match sid.tag {
        0x30 => {
            let ias = expect(sid, 0x30, "IssuerAndSerialNumber")?;
            let (iss, ser) = (ias[0].full, unsigned(ias.get(1).ok_or("no serial")?.body));
            pool_signer
                .iter()
                .find(|c| c.issuer == iss && c.serial == ser)
        }
        0x80 => pool_signer.iter().find(|c| c.ski == Some(sid.body)),
        _ => None,
    }
    .ok_or("signer certificate not found")?
    .clone();

    // Signed attributes.
    let (mut ct, mut md, mut ess) = (None, None, None);
    for a in items(attrs.body)? {
        let f = expect(&a, 0x30, "Attribute")?;
        let oid = f.first().ok_or("Attribute: empty")?.body;
        let vals = expect(
            f.get(1).ok_or("Attribute: no values")?,
            0x31,
            "AttributeValues",
        )?;
        let v = *vals.first().ok_or("Attribute: no value")?;
        match oid {
            OID_CONTENT_TYPE => ct = Some(v.body),
            OID_MESSAGE_DIGEST => md = Some(v.body),
            OID_SIGNING_CERT => ess = Some((false, v)),
            OID_SIGNING_CERT_V2 => ess = Some((true, v)),
            _ => {}
        }
    }
    if ct != Some(OID_TST_INFO) {
        return Err("content-type attribute mismatch".into());
    }
    if md != Some(digest.digest(tst_der).as_slice()) {
        return Err("digest failure".into());
    }
    let mut signed = attrs.full.to_vec();
    signed[0] = 0x31;
    if sig.tag != 0x04 {
        return Err("signature not an OCTET STRING".into());
    }
    verify_sig(
        &public_key(&signer.spki)?,
        sig_alg,
        Some(digest),
        &signed,
        sig.body,
    )?;

    // ESS signing certificate.
    let (v2, ess_v) = ess.ok_or("ess signing certificate attribute missing")?;
    let s = expect(&ess_v, 0x30, "SigningCertificate")?;
    let ids = expect(
        s.first().ok_or("SigningCertificate: empty")?,
        0x30,
        "ESSCertIDs",
    )?;
    let first = expect(
        ids.first().ok_or("ess cert id not found")?,
        0x30,
        "ESSCertID",
    )?;
    let (h, hash) = if v2 && first.first().map(|t| t.tag) == Some(0x30) {
        (
            alg_hash(&first[0])?,
            first.get(1).ok_or("ESSCertIDv2: no hash")?.body,
        )
    } else if v2 {
        (Hash::Sha256, first[0].body)
    } else {
        (Hash::Sha1, first[0].body)
    };
    if h.digest(signer.der) != hash {
        return Err("ess cert id not found".into());
    }

    // Signer usage.
    match &signer.eku {
        Some((true, p)) if p.len() == 1 && p[0] == OID_KP_TIMESTAMPING => {}
        _ => return Err("unsuitable certificate purpose".into()),
    }
    if let Some(ku) = signer.key_usage {
        if ku & 0b11 == 0 {
            return Err("unsuitable certificate purpose".into());
        }
    }

    // Chain to a self-issued anchor, every certificate valid at genTime.
    let anchor_certs: Vec<Cert> = anchors
        .iter()
        .map(|c| parse_cert(c))
        .collect::<Result<_, _>>()?;
    let pool_chain: Vec<Cert> = pool_signer
        .iter()
        .cloned()
        .chain(anchor_certs.iter().cloned())
        .collect();
    let mut cur = signer;
    for _ in 0..10 {
        if gt < cur.not_before {
            return Err("certificate is not yet valid".into());
        }
        if gt > cur.not_after {
            return Err("certificate has expired".into());
        }
        let trusted = anchor_certs.iter().any(|a| a.der == cur.der);
        if trusted && cur.subject == cur.issuer {
            return check_imprint(&imprint, data);
        }
        let issuer = pool_chain
            .iter()
            .filter(|c| c.subject == cur.issuer && c.der != cur.der)
            .find(|c| {
                public_key(&c.spki)
                    .and_then(|k| verify_sig(&k, &cur.sig_alg, None, cur.tbs, cur.sig))
                    .is_ok()
            });
        let Some(issuer) = issuer else {
            let named = pool_chain.iter().any(|c| c.subject == cur.issuer);
            return Err(if named {
                "certificate signature failure"
            } else if trusted {
                "unable to get issuer certificate"
            } else {
                "unable to get local issuer certificate"
            }
            .into());
        };
        if !issuer.ca || issuer.key_usage.is_some_and(|k| k & (1 << 5) == 0) {
            return Err("invalid CA certificate".into());
        }
        cur = issuer.clone();
    }
    Err("certificate chain too long".into())
}

fn check_imprint(imprint: &[Tlv], data: &[u8]) -> Result<(), String> {
    let h = alg_hash(imprint.first().ok_or("MessageImprint: empty")?)?;
    let want = imprint.get(1).ok_or("MessageImprint: no digest")?;
    if want.body == h.digest(data).as_slice() {
        Ok(())
    } else {
        Err("message imprint mismatch".into())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn civil_days_and_times() {
        assert_eq!(days_from_civil(1970, 1, 1), 0);
        assert_eq!(days_from_civil(2000, 3, 1), 11_017);
        let g = Tlv {
            tag: 0x18,
            full: b"",
            body: b"20260102030405.5Z",
        };
        assert_eq!(time_of(&g).unwrap(), 1_767_323_045);
        let u = Tlv {
            tag: 0x17,
            full: b"",
            body: b"491231235959Z",
        };
        assert_eq!(time_of(&u).unwrap(), 2_524_607_999);
    }

    #[test]
    fn base64_round_numbers() {
        assert_eq!(base64_decode("TWFu").unwrap(), b"Man");
        assert_eq!(base64_decode("TWE=").unwrap(), b"Ma");
        assert_eq!(base64_decode("TQ==").unwrap(), b"M");
        assert!(base64_decode("T").is_err());
    }

    /// RSA with e = 3 on a tiny modulus: 2^3 mod 33 = 8.
    #[test]
    fn rsa_public_operation() {
        assert_eq!(rsa_public(&[33], &[3], &[2]).unwrap(), vec![8]);
        assert!(rsa_public(&[33], &[3], &[40]).is_err());
    }
}
