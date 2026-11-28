// SPDX-License-Identifier: AGPL-3.0-only
//! Roughtime (RFC 10049) packet checks, test vectors and an optional client
//! (`kshana roughtime`, docs/ROUGHTIME.md).
//!
//! **Source.** RFC 10049, *Roughtime: A Protocol for Rough Time Synchronization*, W. Ladd and
//! M. Dansarie, Experimental, October 2026 (<https://www.rfc-editor.org/rfc/rfc10049.html>,
//! fetched 2026-11-28; it was draft-ietf-ntp-roughtime-19). Erratum 9238 (Technical, status
//! Reported, <https://www.rfc-editor.org/errata/eid9238>) reports that the Appendix B example is
//! signed with the pre-RFC context strings `RoughTime v1 ...` and that its first response, not
//! the third, is the inconsistent one, and gives a replacement.
//!
//! What is checked, by section of the RFC:
//!
//! * the packet (Section 5): the `ROUGHTIM` magic and the message length;
//! * the message (4.2): header size, offsets that are multiples of four, ascending and in range,
//!   tags strictly ascending by their uint32 value (so no tag twice), tag octets (4.1.3);
//! * a request (5.1): VER, NONC and TYPE present; TYPE 0; a 32-byte nonce; one to 32 versions,
//!   ascending without repeats; SRV = H(0xff || key) when a key is given; ZZZZ all zero; a
//!   warning below 1024 bytes over UDP and without SRV (both SHOULD);
//! * a response (5.2-5.4, 9.7): every mandatory tag, TYPE 1, the request's nonce, PATH a multiple
//!   of 32 bytes and at most 32 hashes, RADI not zero, VER in VERS, VERS ascending, the
//!   delegation signature with the long-term key and the response signature with the delegated
//!   key (context strings of 5.2.1 and 5.2.6), MINT <= MIDP <= MAXT, the Merkle root from the
//!   request, PATH and INDX (5.3.1), and a response no larger than its request;
//! * a malfeasance report (8.2, 8.4.1): every response, the nonce chain
//!   NONC_i = H(response_{i-1} || rand_i), and the pairs (i, j), i before j, with
//!   MIDP_i − RADI_i > MIDP_j + RADI_j.
//!
//! H is SHA-512 truncated to 32 bytes. Undefined tags are ignored (Section 7).
//!
//! **Evidence: MODELLED.** A check says whether the bytes given satisfy the rules above; it does
//! not say that an implementation is correct in general, and a valid response proves only what
//! Section 5.4 says it proves.

use std::collections::BTreeSet;

use ed25519_dalek::{Signature, Verifier, VerifyingKey};
use serde_json::{json, Value};
use sha2::{Digest, Sha512};

/// The vector format tag.
pub const FORMAT: &str = "kshana.roughtime-vectors/1";
/// The check-result format tag.
pub const RESULT_FORMAT: &str = "kshana.roughtime-check/1";
/// The source.
pub const SOURCE_URL: &str = "https://www.rfc-editor.org/rfc/rfc10049.html";
/// When it was read.
pub const SOURCE_FETCHED: &str = "2026-11-28";
/// The vectors shipped with kshana.
pub const BUILTIN: &[(&str, &str)] = &[(
    "roughtime-vectors.json",
    include_str!("../data/conformance/roughtime/roughtime-vectors.json"),
)];
/// The packet magic, "ROUGHTIM".
pub const MAGIC: &[u8; 8] = b"ROUGHTIM";
/// Context string of the response signature (5.2.1), with its terminating zero byte.
pub const CTX_RESPONSE: &[u8] = b"Roughtime v1 response signature\0";
/// Context string of the delegation signature (5.2.6), with its terminating zero byte.
pub const CTX_DELEGATION: &[u8] = b"Roughtime v1 delegation signature\0";
/// The pre-RFC context strings the Appendix B example is signed with (erratum 9238); used only
/// for a diagnostic, never for validity.
pub const LEGACY_CTX_RESPONSE: &[u8] = b"RoughTime v1 response signature\0";
/// See [`LEGACY_CTX_RESPONSE`].
pub const LEGACY_CTX_DELEGATION: &[u8] = b"RoughTime v1 delegation signature\0";
/// The IANA port (12.1).
pub const PORT: u16 = 5319;

/// H(x): SHA-512 truncated to 32 bytes.
pub fn h(parts: &[&[u8]]) -> [u8; 32] {
    let mut d = Sha512::new();
    for p in parts {
        d.update(p);
    }
    let full = d.finalize();
    std::array::from_fn(|i| full[i])
}

/// A tag's uint32 value from its ASCII name (padded with zero octets).
pub fn tag(name: &str) -> u32 {
    let mut b = [0u8; 4];
    for (i, c) in name.bytes().take(4).enumerate() {
        b[i] = c;
    }
    u32::from_le_bytes(b)
}

/// A tag's ASCII name from its uint32 value.
pub fn tag_name(t: u32) -> String {
    t.to_le_bytes()
        .iter()
        .take_while(|b| **b != 0)
        .map(|b| *b as char)
        .collect()
}

/// A parsed message: (tag, value) pairs in wire order.
pub type Message<'a> = Vec<(u32, &'a [u8])>;

/// Parse a message (4.2). The error is a finding code.
pub fn parse_message(m: &[u8]) -> Result<Message<'_>, &'static str> {
    if m.len() < 4 {
        return Err("message.short");
    }
    let n = u32::from_le_bytes([m[0], m[1], m[2], m[3]]) as usize;
    if n == 0 {
        return Err("message.no-pairs");
    }
    let head = n.checked_mul(8).ok_or("message.short")?;
    if m.len() < head {
        return Err("message.short");
    }
    let rd = |i: usize| u32::from_le_bytes([m[i], m[i + 1], m[i + 2], m[i + 3]]);
    let mut offs = vec![0usize];
    for k in 0..n - 1 {
        offs.push(rd(4 + 4 * k) as usize);
    }
    let vals = &m[head..];
    if offs.iter().any(|o| !o.is_multiple_of(4)) {
        return Err("message.offset-alignment");
    }
    if offs.windows(2).any(|w| w[1] < w[0]) || offs.iter().any(|o| *o > vals.len()) {
        return Err("message.offset-range");
    }
    let tags: Vec<u32> = (0..n).map(|k| rd(4 * n + 4 * k)).collect();
    if tags.windows(2).any(|w| w[1] <= w[0]) {
        return Err("message.tags-not-ascending");
    }
    for t in &tags {
        let b = t.to_le_bytes();
        let letters = b.iter().take_while(|c| c.is_ascii_uppercase()).count();
        if letters == 0 || b[letters..].iter().any(|c| *c != 0) {
            return Err("message.tag-format");
        }
    }
    Ok((0..n)
        .map(|k| {
            let end = if k + 1 < n { offs[k + 1] } else { vals.len() };
            (tags[k], &vals[offs[k]..end])
        })
        .collect())
}

fn get<'a>(m: &Message<'a>, name: &str) -> Option<&'a [u8]> {
    let t = tag(name);
    m.iter().find(|(k, _)| *k == t).map(|(_, v)| *v)
}

/// Parse a packet (Section 5): the message inside.
pub fn parse_packet(p: &[u8]) -> Result<&[u8], &'static str> {
    if p.len() < 12 {
        return Err("packet.short");
    }
    if &p[..8] != MAGIC {
        return Err("packet.magic");
    }
    let len = u32::from_le_bytes([p[8], p[9], p[10], p[11]]) as usize;
    if len != p.len() - 12 {
        return Err("packet.length");
    }
    Ok(&p[12..])
}

fn need(v: Option<&[u8]>) -> &[u8] {
    v.unwrap_or_default()
}

fn u32_of(v: &[u8]) -> Option<u32> {
    <[u8; 4]>::try_from(v).ok().map(u32::from_le_bytes)
}

fn u64_of(v: &[u8]) -> Option<u64> {
    <[u8; 8]>::try_from(v).ok().map(u64::from_le_bytes)
}

fn versions(v: &[u8]) -> Option<Vec<u32>> {
    v.len()
        .is_multiple_of(4)
        .then(|| v.chunks(4).filter_map(u32_of).collect())
}

/// The transport a packet went over (the 1024-byte request size applies to UDP).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Transport {
    /// UDP datagrams.
    Udp,
    /// A TCP stream.
    Tcp,
}

/// What a check found.
#[derive(Clone, Debug, Default, serde::Serialize)]
pub struct Findings {
    /// Rule violations (codes, sorted).
    pub errors: BTreeSet<String>,
    /// SHOULD-level findings.
    pub warnings: BTreeSet<String>,
    /// The request nonce, hex.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub nonce: Option<String>,
    /// MIDP, seconds since 1970 (86400-second days).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub midp: Option<u64>,
    /// RADI, seconds.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub radi: Option<u32>,
    /// MINT and MAXT of the delegation.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub delegation: Option<[u64; 2]>,
    /// Whether both signatures verify with the pre-RFC context strings (diagnostic only).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub legacy_context_signatures: Option<bool>,
}

impl Findings {
    fn err(&mut self, c: impl Into<String>) {
        self.errors.insert(c.into());
    }
    /// No errors.
    pub fn valid(&self) -> bool {
        self.errors.is_empty()
    }
}

/// Check a request packet; `key` is the long-term public key it is meant for, when known.
pub fn check_request(
    packet: &[u8],
    key: Option<&[u8]>,
    transport: Transport,
) -> (Findings, Option<Vec<u32>>) {
    let mut f = Findings::default();
    let msg = match parse_packet(packet) {
        Ok(m) => m,
        Err(e) => {
            f.err(e);
            return (f, None);
        }
    };
    let m = match parse_message(msg) {
        Ok(m) => m,
        Err(e) => {
            f.err(e);
            return (f, None);
        }
    };
    for t in ["VER", "NONC", "TYPE"] {
        if get(&m, t).is_none() {
            f.err(format!("request.missing-{t}"));
        }
    }
    let mut offered = None;
    if let Some(v) = get(&m, "VER") {
        match versions(v) {
            None => f.err("request.ver-length"),
            Some(vs) if vs.is_empty() || vs.len() > 32 => f.err("request.ver-count"),
            Some(vs) => {
                if vs.windows(2).any(|w| w[1] <= w[0]) {
                    f.err("request.ver-not-sorted");
                }
                offered = Some(vs);
            }
        }
    }
    if let Some(n) = get(&m, "NONC") {
        if n.len() == 32 {
            f.nonce = Some(hex::encode(n));
        } else {
            f.err("request.nonce-length");
        }
    }
    if let Some(t) = get(&m, "TYPE") {
        if u32_of(t) != Some(0) {
            f.err("request.type-not-zero");
        }
    }
    match get(&m, "SRV") {
        None => {
            f.warnings.insert("request.no-srv".into());
        }
        Some(s) if s.len() != 32 => f.err("request.srv-length"),
        Some(s) => {
            if let Some(k) = key {
                if s != h(&[&[0xff], k]) {
                    f.err("request.srv-not-key");
                }
            }
        }
    }
    if get(&m, "ZZZZ").is_some_and(|z| z.iter().any(|b| *b != 0)) {
        f.err("request.zzzz-not-zero");
    }
    if transport == Transport::Udp && msg.len() < 1024 {
        f.warnings.insert("request.shorter-than-1024".into());
    }
    (f, offered)
}

fn verify(key: &[u8], ctx: &[u8], msg: &[u8], sig: &[u8]) -> bool {
    let (Ok(k), Ok(s)) = (<[u8; 32]>::try_from(key), <[u8; 64]>::try_from(sig)) else {
        return false;
    };
    let Ok(vk) = VerifyingKey::from_bytes(&k) else {
        return false;
    };
    let mut data = ctx.to_vec();
    data.extend_from_slice(msg);
    vk.verify(&data, &Signature::from_bytes(&s)).is_ok()
}

/// The Merkle root from the request, PATH and INDX (5.3.1); `None` when INDX has bits left.
pub fn merkle_root(request: &[u8], path: &[u8], indx: u32) -> Option<[u8; 32]> {
    let mut hv = h(&[&[0x00], request]);
    let mut idx = indx;
    for node in path.chunks(32) {
        hv = if idx & 1 == 0 {
            h(&[&[0x01], &hv, node])
        } else {
            h(&[&[0x01], node, &hv])
        };
        idx >>= 1;
    }
    (idx == 0).then_some(hv)
}

/// Check a response packet against its request and the server's long-term key (5.2-5.4, 9.7).
/// The request's own findings are included.
pub fn check_response(
    request: &[u8],
    response: &[u8],
    key: &[u8],
    transport: Transport,
) -> Findings {
    let (mut f, offered) = check_request(request, Some(key), transport);
    let msg = match parse_packet(response) {
        Ok(m) => m,
        Err(e) => {
            f.err(format!("response.{e}"));
            return f;
        }
    };
    if response.len() > request.len() {
        f.err("response.larger-than-request");
    }
    let m = match parse_message(msg) {
        Ok(m) => m,
        Err(e) => {
            f.err(format!("response.{e}"));
            return f;
        }
    };
    let mut missing = false;
    for t in ["SIG", "NONC", "TYPE", "PATH", "SREP", "CERT", "INDX"] {
        if get(&m, t).is_none() {
            f.err(format!("response.missing-{t}"));
            missing = true;
        }
    }
    if missing {
        return f;
    }
    let (sig, nonc, typ, path, srep_b, cert_b, indx) = (
        need(get(&m, "SIG")),
        need(get(&m, "NONC")),
        need(get(&m, "TYPE")),
        need(get(&m, "PATH")),
        need(get(&m, "SREP")),
        need(get(&m, "CERT")),
        need(get(&m, "INDX")),
    );
    if u32_of(typ) != Some(1) {
        f.err("response.type-not-one");
    }
    if f.nonce.as_deref() != Some(hex::encode(nonc).as_str()) {
        f.err("response.nonce-mismatch");
    }
    let (srep, cert) = match (parse_message(srep_b), parse_message(cert_b)) {
        (Ok(s), Ok(c)) => (s, c),
        (s, c) => {
            if s.is_err() {
                f.err("response.malformed-SREP");
            }
            if c.is_err() {
                f.err("response.malformed-CERT");
            }
            return f;
        }
    };
    let mut nested_missing = false;
    for t in ["VER", "RADI", "MIDP", "VERS", "ROOT"] {
        if get(&srep, t).is_none() {
            f.err(format!("response.missing-SREP.{t}"));
            nested_missing = true;
        }
    }
    for t in ["SIG", "DELE"] {
        if get(&cert, t).is_none() {
            f.err(format!("response.missing-CERT.{t}"));
            nested_missing = true;
        }
    }
    if nested_missing {
        return f;
    }
    let dele_b = need(get(&cert, "DELE"));
    let Ok(dele) = parse_message(dele_b) else {
        f.err("response.malformed-DELE");
        return f;
    };
    for t in ["PUBK", "MINT", "MAXT"] {
        if get(&dele, t).is_none() {
            f.err(format!("response.missing-DELE.{t}"));
            nested_missing = true;
        }
    }
    if nested_missing {
        return f;
    }
    let pubk = need(get(&dele, "PUBK"));
    let cert_sig = need(get(&cert, "SIG"));
    // Signatures (5.4).
    let cert_ok = verify(key, CTX_DELEGATION, dele_b, cert_sig);
    let srep_ok = verify(pubk, CTX_RESPONSE, srep_b, sig);
    if !cert_ok {
        f.err("response.cert-signature");
    }
    if !srep_ok {
        f.err("response.srep-signature");
    }
    f.legacy_context_signatures = Some(
        verify(key, LEGACY_CTX_DELEGATION, dele_b, cert_sig)
            && verify(pubk, LEGACY_CTX_RESPONSE, srep_b, sig),
    );
    // Signed response fields (5.2.5).
    let radi = u32_of(need(get(&srep, "RADI")));
    let midp = u64_of(need(get(&srep, "MIDP")));
    let ver = u32_of(need(get(&srep, "VER")));
    let vers = versions(need(get(&srep, "VERS")));
    let (mint, maxt) = (
        u64_of(need(get(&dele, "MINT"))),
        u64_of(need(get(&dele, "MAXT"))),
    );
    let (Some(radi), Some(midp), Some(ver), Some(vers), Some(mint), Some(maxt)) =
        (radi, midp, ver, vers, mint, maxt)
    else {
        f.err("response.field-length");
        return f;
    };
    f.radi = Some(radi);
    f.midp = Some(midp);
    f.delegation = Some([mint, maxt]);
    if radi == 0 {
        f.err("response.radi-zero");
    }
    if vers.is_empty() || vers.len() > 32 || vers.windows(2).any(|w| w[1] <= w[0]) {
        f.err("response.vers-not-sorted");
    }
    if !vers.contains(&ver) {
        f.err("response.ver-not-in-vers");
    }
    if offered.as_ref().is_some_and(|o| !o.contains(&ver)) {
        f.warnings.insert("response.ver-not-offered".into());
    }
    if midp < mint || midp > maxt {
        f.err("response.midp-outside-delegation");
    }
    if pubk.len() != 32 {
        f.err("response.field-length");
    }
    // Merkle tree (5.2.4, 5.3.1).
    if !path.len().is_multiple_of(32) || path.len() > 32 * 32 {
        f.err("response.path-length");
    } else {
        let root = need(get(&srep, "ROOT"));
        let ok = u32_of(indx).and_then(|i| merkle_root(request, path, i));
        if ok.is_none_or(|r| r.as_slice() != root) {
            f.err("response.merkle-root");
        }
    }
    f
}

/// One response of a malfeasance report, checked.
#[derive(Clone, Debug, serde::Serialize)]
pub struct ReportEntry {
    /// The long-term key, base64.
    pub public_key: String,
    /// The response's findings.
    pub findings: Findings,
    /// Whether this request's nonce follows from the previous response and `rand` (8.2).
    pub chained: Option<bool>,
}

/// A checked malfeasance report (8.4.1).
#[derive(Clone, Debug, serde::Serialize)]
pub struct ReportCheck {
    /// Format tag.
    pub format: &'static str,
    /// Evidence label.
    pub label: &'static str,
    /// Report-level errors.
    pub errors: BTreeSet<String>,
    /// Each response.
    pub responses: Vec<ReportEntry>,
    /// Whether every nonce after the first follows from the previous response.
    pub nonce_chain: bool,
    /// Pairs (i, j), i received before j, with MIDP_i − RADI_i > MIDP_j + RADI_j.
    pub inconsistent_pairs: Vec<[usize; 2]>,
    /// Every response valid, the chain intact and at least one inconsistent pair.
    pub proves_inconsistency: bool,
    /// Per response: both signatures verify with the pre-RFC context strings.
    pub legacy_context_signatures: Vec<bool>,
}

fn b64(v: &Value, k: &str) -> Option<Vec<u8>> {
    v.get(k)
        .and_then(Value::as_str)
        .and_then(crate::permalink::base64_decode)
}

/// Check a malfeasance report given as JSON.
pub fn check_report(report: &Value) -> ReportCheck {
    let mut errors = BTreeSet::new();
    let mut out = Vec::new();
    let mut chain_ok = true;
    let mut prev: Option<Vec<u8>> = None;
    let list = report["responses"].as_array().cloned().unwrap_or_default();
    if list.is_empty() {
        errors.insert("report.no-responses".to_string());
    }
    let mut times = Vec::new();
    for (i, r) in list.iter().enumerate() {
        let (Some(pk), Some(req), Some(resp)) =
            (b64(r, "publicKey"), b64(r, "request"), b64(r, "response"))
        else {
            errors.insert("report.missing-field".to_string());
            prev = None;
            continue;
        };
        let f = check_response(&req, &resp, &pk, Transport::Tcp);
        let chained = if i == 0 {
            None
        } else {
            let ok = match (b64(r, "rand"), &prev, &f.nonce) {
                (Some(rand), Some(p), Some(n)) if rand.len() == 32 => {
                    hex::encode(h(&[p, &rand])) == *n
                }
                _ => false,
            };
            chain_ok &= ok;
            Some(ok)
        };
        if !f.valid() {
            errors.insert("report.response-invalid".to_string());
        }
        times.push(f.midp.zip(f.radi));
        out.push(ReportEntry {
            public_key: r["publicKey"].as_str().unwrap_or("").to_string(),
            findings: f,
            chained,
        });
        prev = Some(resp);
    }
    if !chain_ok {
        errors.insert("report.nonce-chain".to_string());
    }
    let mut pairs = Vec::new();
    for i in 0..times.len() {
        for j in i + 1..times.len() {
            if let (Some((mi, ri)), Some((mj, rj))) = (times[i], times[j]) {
                if i128::from(mi) - i128::from(ri) > i128::from(mj) + i128::from(rj) {
                    pairs.push([i, j]);
                }
            }
        }
    }
    ReportCheck {
        format: RESULT_FORMAT,
        label: "MODELLED",
        proves_inconsistency: errors.is_empty() && !pairs.is_empty(),
        legacy_context_signatures: out
            .iter()
            .map(|e| e.findings.legacy_context_signatures == Some(true))
            .collect(),
        errors,
        responses: out,
        nonce_chain: chain_ok,
        inconsistent_pairs: pairs,
    }
}

/// Encode a message from (tag, value) pairs (sorted by tag here).
pub fn encode_message(pairs: &[(&str, Vec<u8>)]) -> Vec<u8> {
    let mut items: Vec<(u32, &Vec<u8>)> = pairs.iter().map(|(t, v)| (tag(t), v)).collect();
    items.sort_by_key(|(t, _)| *t);
    let mut out = (items.len() as u32).to_le_bytes().to_vec();
    let mut pos = 0u32;
    for (i, (_, v)) in items.iter().enumerate() {
        if i > 0 {
            out.extend_from_slice(&pos.to_le_bytes());
        }
        pos += v.len() as u32;
    }
    for (t, _) in &items {
        out.extend_from_slice(&t.to_le_bytes());
    }
    for (_, v) in &items {
        out.extend_from_slice(v);
    }
    out
}

/// Wrap a message in a packet.
pub fn encode_packet(msg: &[u8]) -> Vec<u8> {
    let mut p = MAGIC.to_vec();
    p.extend_from_slice(&(msg.len() as u32).to_le_bytes());
    p.extend_from_slice(msg);
    p
}

/// A version-1 request for `key` with `nonce`, padded with ZZZZ to a 1024-byte message.
pub fn build_request(key: &[u8], nonce: &[u8; 32]) -> Vec<u8> {
    let mut pairs = vec![
        ("VER", 1u32.to_le_bytes().to_vec()),
        ("NONC", nonce.to_vec()),
        ("TYPE", 0u32.to_le_bytes().to_vec()),
        ("SRV", h(&[&[0xff], key]).to_vec()),
        ("ZZZZ", Vec::new()),
    ];
    let base = encode_message(&pairs).len();
    pairs[4].1 = vec![0u8; 1024usize.saturating_sub(base)];
    encode_packet(&encode_message(&pairs))
}

// ---------------------------------------------------------------------------------------------
// Vectors
// ---------------------------------------------------------------------------------------------

/// The outcome of one vector.
#[derive(Clone, Debug, serde::Serialize)]
pub struct Outcome {
    /// File.
    pub file: String,
    /// Vector id.
    pub id: String,
    /// `request`, `response` or `report`.
    pub kind: String,
    /// `rfc-example`, `errata-reported` or `synthetic`.
    pub status: String,
    /// Whether the checker's result matched the vector.
    pub pass: bool,
    /// What differed.
    pub detail: String,
}

fn result_value(kind: &str, v: &Value) -> Result<Value, String> {
    let transport = if v["transport"].as_str() == Some("tcp") {
        Transport::Tcp
    } else {
        Transport::Udp
    };
    let bytes =
        |k: &str| b64(v, k).ok_or_else(|| crate::terr!("e-roughtime-vector-field", field = k));
    Ok(match kind {
        "request" => {
            let (f, _) = check_request(
                &bytes("request")?,
                b64(v, "public_key").as_deref(),
                transport,
            );
            json!({"valid": f.valid(), "errors": f.errors, "warnings": f.warnings})
        }
        "response" => {
            let f = check_response(
                &bytes("request")?,
                &bytes("response")?,
                &bytes("public_key")?,
                transport,
            );
            json!({"valid": f.valid(), "errors": f.errors, "warnings": f.warnings,
                   "midp": f.midp, "radi": f.radi})
        }
        "report" => {
            let r = check_report(&v["report"]);
            json!({"valid": r.errors.is_empty(), "errors": r.errors,
                   "legacy_context_signatures": r.legacy_context_signatures,
                   "inconsistent_pairs": r.inconsistent_pairs, "nonce_chain": r.nonce_chain,
                   "proves_inconsistency": r.proves_inconsistency})
        }
        other => return Err(crate::terr!("e-roughtime-vector-kind", kind = other)),
    })
}

/// Run one vector: every key of `expect` must equal the checker's value (`warnings` only when
/// the vector lists them).
pub fn run_vector(file: &str, v: &Value) -> Outcome {
    let s = |k: &str| v[k].as_str().unwrap_or("").to_string();
    let mk = |pass, detail| Outcome {
        file: file.to_string(),
        id: s("id"),
        kind: s("kind"),
        status: s("status"),
        pass,
        detail,
    };
    if v["source"]["url"].as_str().is_none_or(str::is_empty) {
        return mk(
            false,
            crate::terr!("e-roughtime-vector-field", field = "source.url"),
        );
    }
    let Some(expect) = v["expect"].as_object() else {
        return mk(
            false,
            crate::terr!("e-roughtime-vector-field", field = "expect"),
        );
    };
    match result_value(&s("kind"), v) {
        Err(e) => mk(false, e),
        Ok(got) => {
            let diffs: Vec<String> = expect
                .iter()
                .filter(|(k, w)| got.get(k.as_str()) != Some(*w))
                .map(|(k, w)| {
                    format!(
                        "{k}: {w} != {}",
                        got.get(k.as_str()).unwrap_or(&Value::Null)
                    )
                })
                .collect();
            mk(diffs.is_empty(), diffs.join("; "))
        }
    }
}

/// Run every vector of one file's text.
pub fn run_file(name: &str, text: &str) -> Result<Vec<Outcome>, String> {
    let doc: Value = serde_json::from_str(text).map_err(|e| format!("{name}: {e}"))?;
    if doc["format"].as_str() != Some(FORMAT) {
        return Err(crate::terr!(
            "e-roughtime-bad-format",
            file = name,
            format = FORMAT
        ));
    }
    Ok(doc["vectors"]
        .as_array()
        .map(|a| a.iter().map(|v| run_vector(name, v)).collect())
        .unwrap_or_default())
}

/// Run the built-in vectors.
pub fn run_builtin() -> Result<Vec<Outcome>, String> {
    let mut out = Vec::new();
    for (n, t) in BUILTIN {
        out.extend(run_file(n, t)?);
    }
    Ok(out)
}

// ---------------------------------------------------------------------------------------------
// Client
// ---------------------------------------------------------------------------------------------

/// Send `request` to `addr` and return the response packet.
pub fn exchange(
    addr: &str,
    request: &[u8],
    transport: Transport,
    timeout: std::time::Duration,
) -> std::io::Result<Vec<u8>> {
    use std::io::{Read, Write};
    match transport {
        Transport::Udp => {
            let target = std::net::ToSocketAddrs::to_socket_addrs(addr)?
                .next()
                .ok_or_else(|| std::io::Error::other(addr.to_string()))?;
            let bind = if target.is_ipv6() {
                "[::]:0"
            } else {
                "0.0.0.0:0"
            };
            let s = std::net::UdpSocket::bind(bind)?;
            s.set_read_timeout(Some(timeout))?;
            s.send_to(request, target)?;
            let mut buf = vec![0u8; 65_535];
            let (n, _) = s.recv_from(&mut buf)?;
            buf.truncate(n);
            Ok(buf)
        }
        Transport::Tcp => {
            let target = std::net::ToSocketAddrs::to_socket_addrs(addr)?
                .next()
                .ok_or_else(|| std::io::Error::other(addr.to_string()))?;
            let mut s = std::net::TcpStream::connect_timeout(&target, timeout)?;
            s.set_read_timeout(Some(timeout))?;
            s.write_all(request)?;
            let mut head = [0u8; 12];
            s.read_exact(&mut head)?;
            let len = u32::from_le_bytes([head[8], head[9], head[10], head[11]]) as usize;
            if len > 1 << 20 {
                return Err(std::io::Error::other("response length"));
            }
            let mut body = vec![0u8; len];
            s.read_exact(&mut body)?;
            let mut p = head.to_vec();
            p.extend_from_slice(&body);
            Ok(p)
        }
    }
}

fn unix_now() -> f64 {
    std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_secs_f64())
        .unwrap_or(0.0)
}

fn read_bytes(path: &str) -> Result<Vec<u8>, String> {
    let b = std::fs::read(path)
        .map_err(|e| crate::terr!("e-roughtime-cannot-read", path = path, e = e.to_string()))?;
    // A file of base64 text is decoded; anything else is taken as the raw packet.
    let text: String = String::from_utf8_lossy(&b).split_whitespace().collect();
    Ok(if b.starts_with(MAGIC) {
        b
    } else {
        crate::permalink::base64_decode(&text).unwrap_or(b)
    })
}

/// `kshana roughtime ...`
pub fn run_cli(args: &[String]) -> i32 {
    let usage = || {
        eprintln!("{}", crate::t!("roughtime-usage"));
        2
    };
    let Some(sub) = args.first().map(String::as_str) else {
        return usage();
    };
    if matches!(sub, "--help" | "-h") {
        println!("{}", crate::t!("roughtime-usage"));
        return 0;
    }
    let mut json_out = false;
    let mut key: Option<String> = None;
    let mut out: Option<String> = None;
    let mut transport = Transport::Udp;
    let mut timeout_ms = 5000u64;
    let mut files = Vec::new();
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--json" => json_out = true,
            "--tcp" => transport = Transport::Tcp,
            "--public-key" | "--out" | "--timeout-ms" => {
                let Some(v) = args.get(i + 1) else {
                    return usage();
                };
                match args[i].as_str() {
                    "--public-key" => key = Some(v.clone()),
                    "--out" => out = Some(v.clone()),
                    _ => match v.parse() {
                        Ok(t) => timeout_ms = t,
                        Err(_) => return usage(),
                    },
                }
                i += 1;
            }
            a if a.starts_with("--") => return usage(),
            a => files.push(a.to_string()),
        }
        i += 1;
    }
    let key_bytes = || -> Result<Vec<u8>, i32> {
        key.as_deref()
            .and_then(crate::permalink::base64_decode)
            .filter(|k| k.len() == 32)
            .ok_or_else(|| {
                eprintln!("{}", crate::terr!("e-roughtime-bad-key"));
                2
            })
    };
    let fail = |e: String| {
        eprintln!("{e}");
        2
    };
    let print = |v: &Value| {
        let text = serde_json::to_string_pretty(v).unwrap_or_default();
        if let Some(p) = &out {
            if let Err(e) = std::fs::write(p, format!("{text}\n")) {
                eprintln!(
                    "{}",
                    crate::terr!("e-roughtime-cannot-write", path = p, e = e.to_string())
                );
                return 2;
            }
        }
        println!("{text}");
        0
    };
    match sub {
        "vectors" => {
            let outcomes = if files.is_empty() {
                run_builtin()
            } else {
                let mut all = Vec::new();
                for p in &files {
                    match std::fs::read_to_string(p) {
                        Ok(t) => match run_file(p, &t) {
                            Ok(o) => all.extend(o),
                            Err(e) => return fail(e),
                        },
                        Err(e) => {
                            return fail(crate::terr!(
                                "e-roughtime-cannot-read",
                                path = p.clone(),
                                e = e.to_string()
                            ))
                        }
                    }
                }
                Ok(all)
            };
            let outcomes = match outcomes {
                Ok(o) => o,
                Err(e) => return fail(e),
            };
            if json_out {
                println!(
                    "{}",
                    serde_json::to_string_pretty(
                        &json!({"format": "kshana.roughtime-vector-results/1",
                        "label": "MODELLED", "source": SOURCE_URL, "outcomes": outcomes})
                    )
                    .unwrap_or_default()
                );
            } else {
                for o in &outcomes {
                    let r = if o.pass { "PASS" } else { "FAIL" };
                    println!("{:<34} {:<16} {r} {}", o.id, o.status, o.detail);
                }
                let passed = outcomes.iter().filter(|o| o.pass).count();
                println!(
                    "{}",
                    crate::t!(
                        "roughtime-vectors-summary",
                        n = outcomes.len(),
                        passed = passed,
                        failed = outcomes.len() - passed
                    )
                );
            }
            i32::from(outcomes.iter().any(|o| !o.pass))
        }
        "check-request" if files.len() == 1 => {
            let req = match read_bytes(&files[0]) {
                Ok(b) => b,
                Err(e) => return fail(e),
            };
            let k = key.as_ref().map(|_| key_bytes());
            let k = match k {
                Some(Err(c)) => return c,
                Some(Ok(k)) => Some(k),
                None => None,
            };
            let (f, _) = check_request(&req, k.as_deref(), transport);
            let code = print(&json!({"format": RESULT_FORMAT, "label": "MODELLED",
                "source": SOURCE_URL, "kind": "request", "valid": f.valid(), "findings": f}));
            if code != 0 {
                return code;
            }
            i32::from(!f.valid())
        }
        "check-response" if files.len() == 2 => {
            let k = match key_bytes() {
                Ok(k) => k,
                Err(c) => return c,
            };
            let (req, resp) = match (read_bytes(&files[0]), read_bytes(&files[1])) {
                (Ok(a), Ok(b)) => (a, b),
                (Err(e), _) | (_, Err(e)) => return fail(e),
            };
            let f = check_response(&req, &resp, &k, transport);
            let code = print(&json!({"format": RESULT_FORMAT, "label": "MODELLED",
                "source": SOURCE_URL, "kind": "response", "valid": f.valid(), "findings": f}));
            if code != 0 {
                return code;
            }
            i32::from(!f.valid())
        }
        "check-report" if files.len() == 1 => {
            let v: Value = match std::fs::read_to_string(&files[0])
                .map_err(|e| e.to_string())
                .and_then(|t| serde_json::from_str(&t).map_err(|e| e.to_string()))
            {
                Ok(v) => v,
                Err(e) => {
                    return fail(crate::terr!(
                        "e-roughtime-cannot-read",
                        path = files[0].clone(),
                        e = e
                    ))
                }
            };
            let r = check_report(&v);
            let code = print(&serde_json::to_value(&r).unwrap_or_default());
            if code != 0 {
                return code;
            }
            i32::from(!r.errors.is_empty())
        }
        "query" if files.len() == 1 => {
            let k = match key_bytes() {
                Ok(k) => k,
                Err(c) => return c,
            };
            // A fresh random nonce from the thread's CSPRNG (seeded from the OS), Section 5.1.2.
            let nonce: [u8; 32] = rand::random();
            let req = build_request(&k, &nonce);
            let t0 = unix_now();
            let resp = match exchange(
                &files[0],
                &req,
                transport,
                std::time::Duration::from_millis(timeout_ms),
            ) {
                Ok(r) => r,
                Err(e) => {
                    return fail(crate::terr!(
                        "e-roughtime-exchange",
                        addr = files[0].clone(),
                        e = e.to_string()
                    ))
                }
            };
            let t1 = unix_now();
            let f = check_response(&req, &resp, &k, transport);
            let offset = f.midp.map(|m| m as f64 - (t0 + t1) / 2.0);
            let code = print(&json!({
                "format": RESULT_FORMAT, "label": "MODELLED", "source": SOURCE_URL,
                "kind": "query", "server": files[0],
                "transport": if transport == Transport::Tcp { "tcp" } else { "udp" },
                "valid": f.valid(), "findings": f,
                "local_send_unix_s": t0, "local_receive_unix_s": t1,
                "round_trip_s": t1 - t0, "midp_minus_local_midpoint_s": offset,
                "response_object": {
                    "publicKey": key, "request": crate::permalink::base64_encode(&req),
                    "response": crate::permalink::base64_encode(&resp)
                }
            }));
            if code != 0 {
                return code;
            }
            i32::from(!f.valid())
        }
        _ => usage(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn tags_match_the_iana_registry() {
        // RFC 10049 Section 4.1.3 and 12.3.
        assert_eq!(tag("NONC"), 0x434e_4f4e);
        assert_eq!(tag("VER"), 0x0052_4556);
        assert_eq!(tag("ZZZZ"), 0x5a5a_5a5a);
        assert_eq!(tag_name(0x5458_414d), "MAXT");
    }
}
