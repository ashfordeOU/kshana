// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana tlog`: an offline verifier for an RFC 6962 / RFC 9162 transparency log of evidence
//! records, its signed statements, its daily roots anchored by RFC 3161 timestamps, and the
//! history of its signing keys.
//!
//! Nothing here contacts a network or names a hosted service: every input is a file the user
//! supplies, and the `format` and `service` strings of the statements are opaque (a caller can
//! require an exact `format` with `--format`). Public keys and timestamp authority roots are
//! supplied by the user. Format details that are not in an RFC are documented in
//! `docs/TLOG.md`, with the encodings.
//!
//! * Leaves: the compact JSON of an entry with its keys in the order `pack_sha256`, `kind`,
//!   `signer_key_id`, `logged_utc` and, when present, `class`, whatever order the entry was
//!   served in. `leaf_hash(d) = SHA-256(0x00 || d)`, `node(l, r) = SHA-256(0x01 || l || r)`,
//!   `MTH([]) = SHA-256("")`, split at the largest power of two below n (RFC 9162 section 2.1.1).
//! * The hash chain: `chain(-1)` is 32 zero bytes and
//!   `chain(i) = SHA-256(0x02 || chain(i-1) || leaf_hash(i))`; the chain head of size n is
//!   `chain(n-1)`.
//! * Inclusion and consistency proofs: verified by the algorithms of RFC 9162 sections 2.1.3.2
//!   and 2.1.4.2.
//! * Signed statements: `{service, method, evidence_class, utc, key_id, verdict, verdict_sha256,
//!   signature}`. The body is the canonical JSON (keys sorted at every depth, no whitespace) of
//!   `{evidence_class, key_id, method, service, utc, verdict}`, `verdict_sha256` its SHA-256 and
//!   `signature` an Ed25519 signature over it (hex).

use crate::evidence::bundle::public_key_hex;
use serde::Serialize;
use serde_json::{Map, Value};
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;

/// A 32-byte hash.
pub type Hash = [u8; 32];

/// Schema of the `--json` report.
pub const SCHEMA: &str = "kshana.tlog-verify/1";

/// The kind of an entry that is a revocation record when it has no `class`.
pub const REVOCATION_KIND: &str = "crl-revocation/1";

fn sha256(parts: &[&[u8]]) -> Hash {
    let mut h = Sha256::new();
    for p in parts {
        h.update(p);
    }
    h.finalize().into()
}

/// `SHA-256(0x00 || d)`.
pub fn leaf_hash(d: &[u8]) -> Hash {
    sha256(&[&[0x00], d])
}

/// `SHA-256(0x01 || l || r)`.
pub fn node_hash(l: &Hash, r: &Hash) -> Hash {
    sha256(&[&[0x01], l, r])
}

/// The Merkle tree hash of a list of leaf hashes (RFC 9162 section 2.1.1).
pub fn mth(leaves: &[Hash]) -> Hash {
    match leaves.len() {
        0 => sha256(&[b""]),
        1 => leaves[0],
        n => {
            let k = largest_power_of_two_below(n);
            node_hash(&mth(&leaves[..k]), &mth(&leaves[k..]))
        }
    }
}

fn largest_power_of_two_below(n: usize) -> usize {
    let mut k = 1;
    while k * 2 < n {
        k *= 2;
    }
    k
}

/// The chain head of a list of leaf hashes: `chain(n-1)`, or 32 zero bytes for none.
pub fn chain_head(leaves: &[Hash]) -> Hash {
    leaves
        .iter()
        .fold([0u8; 32], |c, l| sha256(&[&[0x02], &c, l]))
}

/// RFC 9162 section 2.1.3.2: the root an inclusion proof gives for `leaf` at `index` in a tree
/// of `size`, or an error naming the step that failed.
pub fn root_from_inclusion(
    index: u64,
    size: u64,
    leaf: &Hash,
    path: &[Hash],
) -> Result<Hash, &'static str> {
    if index >= size {
        return Err("index-not-below-size");
    }
    let (mut fn_, mut sn) = (index, size - 1);
    let mut r = *leaf;
    for p in path {
        if sn == 0 {
            return Err("path-too-long");
        }
        if fn_ & 1 == 1 || fn_ == sn {
            r = node_hash(p, &r);
            if fn_ & 1 == 0 {
                while fn_ & 1 == 0 && fn_ != 0 {
                    fn_ >>= 1;
                    sn >>= 1;
                }
            }
        } else {
            r = node_hash(&r, p);
        }
        fn_ >>= 1;
        sn >>= 1;
    }
    if sn != 0 {
        return Err("path-too-short");
    }
    Ok(r)
}

/// RFC 9162 section 2.1.4.2: check that `path` proves the tree of size `m` with root
/// `first` is a prefix of the tree of size `n` with root `second`. `m == n` needs an empty path
/// and equal roots.
pub fn verify_consistency(
    m: u64,
    n: u64,
    first: &Hash,
    second: &Hash,
    path: &[Hash],
) -> Result<(), &'static str> {
    if m == 0 || m > n {
        return Err("sizes-out-of-order");
    }
    if m == n {
        if !path.is_empty() {
            return Err("path-not-empty-for-equal-sizes");
        }
        return if first == second {
            Ok(())
        } else {
            Err("roots-differ-for-equal-sizes")
        };
    }
    let mut p: Vec<Hash> = path.to_vec();
    if m.is_power_of_two() {
        p.insert(0, *first);
    }
    if p.is_empty() {
        return Err("path-empty");
    }
    let (mut fn_, mut sn) = (m - 1, n - 1);
    while fn_ & 1 == 1 {
        fn_ >>= 1;
        sn >>= 1;
    }
    let (mut fr, mut sr) = (p[0], p[0]);
    for c in &p[1..] {
        if sn == 0 {
            return Err("path-too-long");
        }
        if fn_ & 1 == 1 || fn_ == sn {
            fr = node_hash(c, &fr);
            sr = node_hash(c, &sr);
            if fn_ & 1 == 0 {
                while fn_ & 1 == 0 && fn_ != 0 {
                    fn_ >>= 1;
                    sn >>= 1;
                }
            }
        } else {
            sr = node_hash(&sr, c);
        }
        fn_ >>= 1;
        sn >>= 1;
    }
    if sn != 0 {
        return Err("path-too-short");
    }
    if &fr != first {
        return Err("first-root-mismatch");
    }
    if &sr != second {
        return Err("second-root-mismatch");
    }
    Ok(())
}

/// Canonical JSON: keys sorted at every depth, no whitespace, strings and numbers as
/// `serde_json` writes them.
pub fn canonical_json(v: &Value) -> String {
    match v {
        Value::Object(m) => {
            let sorted: BTreeMap<&String, &Value> = m.iter().collect();
            let parts: Vec<String> = sorted
                .iter()
                .map(|(k, v)| format!("{}:{}", Value::String((*k).clone()), canonical_json(v)))
                .collect();
            format!("{{{}}}", parts.join(","))
        }
        Value::Array(a) => format!(
            "[{}]",
            a.iter().map(canonical_json).collect::<Vec<_>>().join(",")
        ),
        other => other.to_string(),
    }
}

/// The class of a log entry.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum EntryClass {
    /// An evidence pack record: `class` `evidence_pack`, or no `class` and a kind other than
    /// [`REVOCATION_KIND`].
    EvidencePack,
    /// A calibration record: `class` `calibration_record`.
    CalibrationRecord,
    /// A revocation record: no `class` and kind [`REVOCATION_KIND`].
    Revocation,
}

/// The leaf bytes of an entry: its fields in the leaf order, compact, whatever order it was
/// served in. Other fields of the entry are not part of the leaf.
pub fn leaf_bytes(entry: &Value) -> Result<(Vec<u8>, EntryClass), String> {
    let o = entry
        .as_object()
        .ok_or_else(|| crate::terr!("e-tlog-entry-not-object"))?;
    let need = |k: &str| {
        o.get(k)
            .cloned()
            .ok_or_else(|| crate::terr!("e-tlog-entry-missing-field", field = k.to_string()))
    };
    let pack = need("pack_sha256")?;
    let kind = need("kind")?;
    let signer = need("signer_key_id")?;
    let logged = need("logged_utc")?;
    let bad = |k: &str| crate::terr!("e-tlog-entry-bad-field", field = k.to_string());
    if !pack.as_str().is_some_and(is_hex64) {
        return Err(bad("pack_sha256"));
    }
    let kind_s = kind.as_str().ok_or_else(|| bad("kind"))?.to_string();
    if !(signer.is_string() || signer.is_null()) {
        return Err(bad("signer_key_id"));
    }
    if !logged.as_str().is_some_and(is_utc) {
        return Err(bad("logged_utc"));
    }
    let mut m = Map::new();
    m.insert("pack_sha256".into(), pack);
    m.insert("kind".into(), kind);
    m.insert("signer_key_id".into(), signer);
    m.insert("logged_utc".into(), logged);
    let class = match o.get("class") {
        None => {
            if kind_s == REVOCATION_KIND {
                EntryClass::Revocation
            } else {
                EntryClass::EvidencePack
            }
        }
        Some(c) => {
            let class = match c.as_str() {
                Some("evidence_pack") => EntryClass::EvidencePack,
                Some("calibration_record") => EntryClass::CalibrationRecord,
                _ => return Err(bad("class")),
            };
            m.insert("class".into(), c.clone());
            class
        }
    };
    // serde_json's map keeps insertion order only with `preserve_order`; write it by hand.
    let mut s = String::from("{");
    for (i, (k, v)) in [
        "pack_sha256",
        "kind",
        "signer_key_id",
        "logged_utc",
        "class",
    ]
    .iter()
    .filter_map(|k| m.get(*k).map(|v| (k, v)))
    .enumerate()
    {
        if i > 0 {
            s.push(',');
        }
        s.push_str(&Value::String((*k).to_string()).to_string());
        s.push(':');
        s.push_str(&v.to_string());
    }
    s.push('}');
    Ok((s.into_bytes(), class))
}

fn is_hex64(s: &str) -> bool {
    s.len() == 64 && s.bytes().all(|b| b.is_ascii_hexdigit())
}

/// `YYYY-MM-DDTHH:MM:SSZ`.
pub fn is_utc(s: &str) -> bool {
    let b = s.as_bytes();
    b.len() == 20
        && b.iter().enumerate().all(|(i, c)| match i {
            4 | 7 => *c == b'-',
            10 => *c == b'T',
            13 | 16 => *c == b':',
            19 => *c == b'Z',
            _ => c.is_ascii_digit(),
        })
}

fn hash_of(v: &Value) -> Option<Hash> {
    let s = v.as_str()?;
    if !is_hex64(s) {
        return None;
    }
    let mut h = [0u8; 32];
    hex::decode_to_slice(s, &mut h).ok()?;
    Some(h)
}

fn hashes_of(v: &Value) -> Option<Vec<Hash>> {
    v.as_array()?.iter().map(hash_of).collect()
}

/// A public key from 64 hex characters.
pub fn key_of_hex(s: &str) -> Result<[u8; 32], String> {
    let mut k = [0u8; 32];
    if s.len() != 64 || hex::decode_to_slice(s, &mut k).is_err() {
        return Err(crate::terr!("e-tlog-bad-key"));
    }
    Ok(k)
}

// ── checks and the report ─────────────────────────────────────────────────────

/// One check: a stable id (documented in docs/TLOG.md), its outcome, and the values compared.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Check {
    /// Stable check id, prefixed by what it checks (for example `sth.signature`).
    pub id: String,
    /// True when the check passed.
    pub pass: bool,
    /// The values compared (typically `got / expected`), for the reader.
    pub detail: String,
}

/// The report of one `tlog` command.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Report {
    /// The report schema, [`SCHEMA`].
    pub schema: &'static str,
    /// The `tlog` command that produced the report.
    pub command: String,
    /// True when every check passed.
    pub pass: bool,
    /// The checks, in the order they were run.
    pub checks: Vec<Check>,
    /// Facts read from the inputs (sizes, roots, key ids, classes), not checks.
    pub facts: BTreeMap<String, Value>,
}

impl Report {
    fn new(command: &str) -> Self {
        Report {
            schema: SCHEMA,
            command: command.into(),
            pass: true,
            checks: Vec::new(),
            facts: BTreeMap::new(),
        }
    }

    fn check(&mut self, id: impl Into<String>, pass: bool, detail: impl Into<String>) -> bool {
        self.pass &= pass;
        self.checks.push(Check {
            id: id.into(),
            pass,
            detail: detail.into(),
        });
        pass
    }

    fn fact(&mut self, k: &str, v: impl Into<Value>) {
        self.facts.insert(k.into(), v.into());
    }

    /// The text form: one line per check, then the facts.
    pub fn to_text(&self) -> String {
        let mut out = String::new();
        for c in &self.checks {
            let line = if c.pass {
                crate::t!(
                    "tlog-check-pass",
                    id = c.id.clone(),
                    detail = c.detail.clone()
                )
            } else {
                crate::t!(
                    "tlog-check-fail",
                    id = c.id.clone(),
                    detail = c.detail.clone()
                )
            };
            out.push_str(&line);
            out.push('\n');
        }
        for (k, v) in &self.facts {
            out.push_str("  ");
            out.push_str(&crate::t!(
                "tlog-fact",
                key = k.clone(),
                value = match v {
                    Value::String(s) => s.clone(),
                    o => o.to_string(),
                }
            ));
            out.push('\n');
        }
        out.push_str(&if self.pass {
            crate::t!("tlog-verdict-pass", command = self.command.clone())
        } else {
            crate::t!(
                "tlog-verdict-fail",
                command = self.command.clone(),
                n = self.checks.iter().filter(|c| !c.pass).count()
            )
        });
        out
    }
}

// ── signed statements ─────────────────────────────────────────────────────────

/// The fields of a signed statement around its `verdict` payload.
#[derive(Clone, Debug)]
pub struct Signed {
    /// The `service` string, opaque; part of the signed body.
    pub service: Value,
    /// The `method` field, as served; part of the signed body.
    pub method: Value,
    /// The `evidence_class` field, as served; part of the signed body.
    pub evidence_class: Value,
    /// The signing time, checked to be a UTC timestamp; part of the signed body.
    pub utc: Value,
    /// Id of the signing key, used to pick a key from a key history; part of the body.
    pub key_id: Value,
    /// The signed payload (an STH, a daily root, ...).
    pub verdict: Value,
    /// SHA-256 of the canonical body, hex, as served (compared case-insensitively).
    pub verdict_sha256: String,
    /// Ed25519 signature over the canonical body, 128 hex characters.
    pub signature: String,
}

/// True when a document looks like a signed statement (has `verdict` and `signature`).
pub fn is_signed(doc: &Value) -> bool {
    doc.get("verdict").is_some() && doc.get("signature").is_some()
}

impl Signed {
    /// Read the fields from a document; errors name a missing field, or a non-string
    /// `verdict_sha256` or `signature`.
    pub fn parse(doc: &Value) -> Result<Self, String> {
        let get = |k: &str| {
            doc.get(k)
                .cloned()
                .ok_or_else(|| crate::terr!("e-tlog-missing-field", field = k.to_string()))
        };
        let s = |k: &str| -> Result<String, String> {
            get(k)?
                .as_str()
                .map(str::to_string)
                .ok_or_else(|| crate::terr!("e-tlog-bad-field", field = k.to_string()))
        };
        Ok(Signed {
            service: get("service")?,
            method: get("method")?,
            evidence_class: get("evidence_class")?,
            utc: get("utc")?,
            key_id: get("key_id")?,
            verdict: get("verdict")?,
            verdict_sha256: s("verdict_sha256")?,
            signature: s("signature")?,
        })
    }

    /// The canonical body the signature covers.
    pub fn body(&self) -> String {
        let mut m = Map::new();
        m.insert("evidence_class".into(), self.evidence_class.clone());
        m.insert("key_id".into(), self.key_id.clone());
        m.insert("method".into(), self.method.clone());
        m.insert("service".into(), self.service.clone());
        m.insert("utc".into(), self.utc.clone());
        m.insert("verdict".into(), self.verdict.clone());
        canonical_json(&Value::Object(m))
    }

    /// Check `verdict_sha256` and the signature with `key`, under `prefix`.
    fn check_into(&self, r: &mut Report, prefix: &str, key: &[u8; 32]) {
        let body = self.body();
        let digest = hex::encode(sha256(&[body.as_bytes()]));
        r.check(
            format!("{prefix}.verdict-sha256"),
            digest == self.verdict_sha256.to_ascii_lowercase(),
            format!("{} / {}", self.verdict_sha256, digest),
        );
        let ok = verify_sig(key, body.as_bytes(), &self.signature);
        r.check(
            format!("{prefix}.signature"),
            ok,
            format!(
                "ed25519 {} key {}",
                self.key_id.as_str().unwrap_or("?"),
                hex::encode(key)
            ),
        );
        r.check(
            format!("{prefix}.utc"),
            self.utc.as_str().is_some_and(is_utc),
            self.utc.to_string(),
        );
    }
}

fn verify_sig(key: &[u8; 32], msg: &[u8], sig_hex: &str) -> bool {
    let mut sig = [0u8; 64];
    if sig_hex.len() != 128 || hex::decode_to_slice(sig_hex, &mut sig).is_err() {
        return false;
    }
    crate::evidence::verify::verify_detached(key, msg, &sig).unwrap_or(false)
}

/// Where the public key of a signed statement comes from.
pub enum KeySource<'a> {
    /// A key the user gives.
    Key([u8; 32]),
    /// A verified key history: the record whose `key_id` is the statement's and whose period
    /// contains the statement's `utc`.
    History(&'a KeyHistory),
}

impl KeySource<'_> {
    fn resolve(&self, s: &Signed, r: &mut Report, prefix: &str) -> Option<[u8; 32]> {
        match self {
            KeySource::Key(k) => Some(*k),
            KeySource::History(h) => {
                let kid = s.key_id.as_str().unwrap_or("");
                let utc = s.utc.as_str().unwrap_or("");
                match h.key_at(kid, utc) {
                    Some(k) => {
                        r.check(
                            format!("{prefix}.key-in-history"),
                            true,
                            format!("{kid} at {utc}"),
                        );
                        Some(k)
                    }
                    None => {
                        r.check(
                            format!("{prefix}.key-in-history"),
                            false,
                            format!("{kid} at {utc}"),
                        );
                        None
                    }
                }
            }
        }
    }
}

/// Verify a signed statement into `r`, returning its payload when it parses.
fn verify_signed(
    doc: &Value,
    keys: &KeySource,
    r: &mut Report,
    prefix: &str,
) -> Result<Signed, String> {
    let s = Signed::parse(doc)?;
    if let Some(k) = keys.resolve(&s, r, prefix) {
        s.check_into(r, prefix, &k);
    }
    r.fact(&format!("{prefix}.key_id"), s.key_id.clone());
    r.fact(&format!("{prefix}.method"), s.method.clone());
    r.fact(&format!("{prefix}.utc"), s.utc.clone());
    Ok(s)
}

fn require_format(r: &mut Report, prefix: &str, payload: &Value, want: Option<&str>) {
    let got = payload.get("format").and_then(Value::as_str);
    if let Some(g) = got {
        r.fact(&format!("{prefix}.format"), g);
    }
    if let Some(w) = want {
        r.check(
            format!("{prefix}.format"),
            got == Some(w),
            format!("{} / {w}", got.unwrap_or("-")),
        );
    }
}

fn field<'a>(v: &'a Value, k: &str) -> Result<&'a Value, String> {
    v.get(k)
        .ok_or_else(|| crate::terr!("e-tlog-missing-field", field = k.to_string()))
}

fn u64_field(v: &Value, k: &str) -> Result<u64, String> {
    field(v, k)?
        .as_u64()
        .ok_or_else(|| crate::terr!("e-tlog-bad-field", field = k.to_string()))
}

fn hash_field(v: &Value, k: &str) -> Result<Hash, String> {
    hash_of(field(v, k)?).ok_or_else(|| crate::terr!("e-tlog-bad-field", field = k.to_string()))
}

fn path_field(v: &Value, k: &str) -> Result<Vec<Hash>, String> {
    hashes_of(field(v, k)?).ok_or_else(|| crate::terr!("e-tlog-bad-field", field = k.to_string()))
}

// ── the commands ──────────────────────────────────────────────────────────────

/// Options shared by the commands.
#[derive(Default)]
pub struct Opts<'a> {
    /// Where the public keys of signed statements come from; `None` when none was given.
    pub keys: Option<KeySource<'a>>,
    /// The exact payload `format` to require (`--format`); `None` checks no format.
    pub format: Option<String>,
}

/// The payload of a proof document: the document itself when unsigned, else its verified
/// `verdict` (an unsigned proof binds only to the root the user trusts, which is noted).
fn payload_of(doc: &Value, opts: &Opts, r: &mut Report, prefix: &str) -> Result<Value, String> {
    if is_signed(doc) {
        let keys = opts
            .keys
            .as_ref()
            .ok_or_else(|| crate::terr!("e-tlog-needs-key"))?;
        Ok(verify_signed(doc, keys, r, prefix)?.verdict)
    } else {
        r.fact(&format!("{prefix}.signed"), false);
        Ok(doc.clone())
    }
}

/// `verify-inclusion`: an inclusion proof, optionally against the entry it proves and a signed
/// tree head of the same size.
pub fn verify_inclusion(
    proof: &Value,
    entry: Option<&Value>,
    sth: Option<&Value>,
    opts: &Opts,
) -> Result<Report, String> {
    let mut r = Report::new("verify-inclusion");
    let p = payload_of(proof, opts, &mut r, "proof")?;
    let index = u64_field(&p, "index")?;
    let size = u64_field(&p, "size")?;
    let leaf = hash_field(&p, "leaf_hash")?;
    let root = hash_field(&p, "root_hash")?;
    let path = path_field(&p, "path")?;
    r.fact("index", index);
    r.fact("size", size);
    match root_from_inclusion(index, size, &leaf, &path) {
        Ok(got) => r.check(
            "inclusion.root",
            got == root,
            format!("{} / {}", hex::encode(root), hex::encode(got)),
        ),
        Err(e) => r.check("inclusion.root", false, e),
    };
    if let Some(e) = entry {
        let (bytes, class) = leaf_bytes(e)?;
        let got = leaf_hash(&bytes);
        r.check(
            "inclusion.leaf-hash",
            got == leaf,
            format!("{} / {}", hex::encode(leaf), hex::encode(got)),
        );
        r.fact(
            "entry.class",
            serde_json::to_value(class).unwrap_or_default(),
        );
    }
    if let Some(s) = sth {
        let keys = opts
            .keys
            .as_ref()
            .ok_or_else(|| crate::terr!("e-tlog-needs-key"))?;
        let st = verify_signed(s, keys, &mut r, "sth")?;
        require_format(&mut r, "sth", &st.verdict, opts.format.as_deref());
        let ssize = u64_field(&st.verdict, "size")?;
        let sroot = hash_field(&st.verdict, "root_hash")?;
        r.check(
            "inclusion.sth-size",
            ssize == size,
            format!("{ssize} / {size}"),
        );
        r.check(
            "inclusion.sth-root",
            sroot == root,
            format!("{} / {}", hex::encode(sroot), hex::encode(root)),
        );
    }
    Ok(r)
}

/// `verify-consistency`: a consistency proof, optionally against signed tree heads of both sizes.
pub fn verify_consistency_doc(
    proof: &Value,
    sth_from: Option<&Value>,
    sth_to: Option<&Value>,
    opts: &Opts,
) -> Result<Report, String> {
    let mut r = Report::new("verify-consistency");
    let p = payload_of(proof, opts, &mut r, "proof")?;
    let from = u64_field(&p, "from")?;
    let to = u64_field(&p, "to")?;
    let from_root = hash_field(&p, "from_root")?;
    let to_root = hash_field(&p, "to_root")?;
    let path = path_field(&p, "path")?;
    r.fact("from", from);
    r.fact("to", to);
    let res = verify_consistency(from, to, &from_root, &to_root, &path);
    r.check(
        "consistency.path",
        res.is_ok(),
        res.err().unwrap_or("-").to_string(),
    );
    for (label, sth, size, root) in [
        ("sth-from", sth_from, from, from_root),
        ("sth-to", sth_to, to, to_root),
    ] {
        if let Some(s) = sth {
            let keys = opts
                .keys
                .as_ref()
                .ok_or_else(|| crate::terr!("e-tlog-needs-key"))?;
            let st = verify_signed(s, keys, &mut r, label)?;
            require_format(&mut r, label, &st.verdict, opts.format.as_deref());
            let ssize = u64_field(&st.verdict, "size")?;
            let sroot = hash_field(&st.verdict, "root_hash")?;
            r.check(
                format!("consistency.{label}-size"),
                ssize == size,
                format!("{ssize} / {size}"),
            );
            r.check(
                format!("consistency.{label}-root"),
                sroot == root,
                format!("{} / {}", hex::encode(sroot), hex::encode(root)),
            );
        }
    }
    Ok(r)
}

/// Read entries: JSON Lines (one entry per line, blank lines skipped) or a JSON array.
pub fn parse_entries(text: &str) -> Result<Vec<Value>, String> {
    let t = text.trim_start();
    if t.starts_with('[') {
        return serde_json::from_str::<Vec<Value>>(t)
            .map_err(|e| crate::terr!("e-tlog-bad-json", e = e.to_string()));
    }
    text.lines()
        .enumerate()
        .filter(|(_, l)| !l.trim().is_empty())
        .map(|(i, l)| {
            serde_json::from_str(l)
                .map_err(|e| crate::terr!("e-tlog-bad-json-line", line = i + 1, e = e.to_string()))
        })
        .collect()
}

/// `verify-sth`: a signed tree head, optionally recomputed from the log's entries.
pub fn verify_sth(sth: &Value, entries: Option<&[Value]>, opts: &Opts) -> Result<Report, String> {
    let mut r = Report::new("verify-sth");
    let keys = opts
        .keys
        .as_ref()
        .ok_or_else(|| crate::terr!("e-tlog-needs-key"))?;
    let st = verify_signed(sth, keys, &mut r, "sth")?;
    let v = &st.verdict;
    require_format(&mut r, "sth", v, opts.format.as_deref());
    let size = u64_field(v, "size")?;
    let root = hash_field(v, "root_hash")?;
    let head = hash_field(v, "chain_head")?;
    r.fact("size", size);
    r.fact("root_hash", hex::encode(root));
    r.fact("chain_head", hex::encode(head));
    if let Some(l) = v.get("log_key_id") {
        r.fact("log_key_id", l.clone());
    }
    if let Some(t) = v.get("timestamp_utc") {
        r.fact("timestamp_utc", t.clone());
    }
    if let Some(es) = entries {
        r.check(
            "sth.entries-count",
            es.len() as u64 >= size,
            format!("{} / {size}", es.len()),
        );
        let n = (size as usize).min(es.len());
        let mut leaves = Vec::with_capacity(n);
        let mut counts: BTreeMap<String, u64> = BTreeMap::new();
        for e in &es[..n] {
            let (b, class) = leaf_bytes(e)?;
            leaves.push(leaf_hash(&b));
            let c = serde_json::to_value(class)
                .ok()
                .and_then(|v| v.as_str().map(str::to_string))
                .unwrap_or_default();
            *counts.entry(c).or_default() += 1;
        }
        let got = mth(&leaves);
        r.check(
            "sth.root-from-entries",
            got == root,
            format!("{} / {}", hex::encode(root), hex::encode(got)),
        );
        let gh = chain_head(&leaves);
        r.check(
            "sth.chain-head-from-entries",
            gh == head,
            format!("{} / {}", hex::encode(head), hex::encode(gh)),
        );
        for (c, k) in counts {
            r.fact(&format!("entries.{c}"), k);
        }
    }
    Ok(r)
}

/// RFC 3161 inputs for `verify-daily-root`: trusted authority roots and extra certificates (DER).
#[derive(Default)]
pub struct TsaInputs {
    /// Trusted timestamp authority root certificates, DER; empty fails the RFC 3161 checks.
    pub anchors: Vec<Vec<u8>>,
    /// Extra (intermediate) certificates for building the chain, DER; not trusted.
    pub untrusted: Vec<Vec<u8>>,
}

/// `verify-daily-root`: a signed daily root and its RFC 3161 timestamps.
pub fn verify_daily_root(
    doc: &Value,
    tsa: Option<&TsaInputs>,
    opts: &Opts,
) -> Result<Report, String> {
    let mut r = Report::new("verify-daily-root");
    let keys = opts
        .keys
        .as_ref()
        .ok_or_else(|| crate::terr!("e-tlog-needs-key"))?;
    let st = verify_signed(doc, keys, &mut r, "statement")?;
    let v = &st.verdict;
    let daily = field(v, "daily_root")?;
    require_format(&mut r, "daily_root", daily, opts.format.as_deref());
    let stamped = canonical_json(daily);
    let digest = hex::encode(sha256(&[stamped.as_bytes()]));
    let claimed = field(v, "daily_root_sha256")?
        .as_str()
        .unwrap_or("")
        .to_ascii_lowercase();
    // PIN-SCOPE:    the daily root's stated SHA-256 against the hash of its canonical bytes.
    // PIN-EXCLUDES: any committed file; both sides come from the document being verified.
    r.check(
        "daily-root.sha256",
        digest == claimed,
        format!("{claimed} / {digest}"),
    );
    for k in ["date", "size", "root_hash", "chain_head", "log_key_id"] {
        if let Some(x) = daily.get(k) {
            r.fact(&format!("daily_root.{k}"), x.clone());
        }
    }
    if let Some(a) = v.get("anchoring") {
        r.fact("anchoring", a.clone());
    }
    let stamps = v
        .get("timestamps")
        .and_then(Value::as_array)
        .cloned()
        .unwrap_or_default();
    if stamps.is_empty() {
        r.fact("anchored", crate::t!("tlog-not-anchored"));
        return Ok(r);
    }
    for (i, t) in stamps.iter().enumerate() {
        let p = format!("timestamp[{i}]");
        if let Some(a) = t.get("authority") {
            r.fact(&format!("{p}.authority"), a.clone());
        }
        let status = t.get("status").and_then(Value::as_str).unwrap_or("");
        r.check(
            format!("{p}.status"),
            status == "granted",
            status.to_string(),
        );
        let der = match t
            .get("token_der_base64")
            .and_then(Value::as_str)
            .and_then(|b| crate::evidence::tsa::base64_decode_relaxed(b).ok())
        {
            Some(d) => d,
            None => {
                r.check(format!("{p}.token"), false, "token_der_base64");
                continue;
            }
        };
        let th = hex::encode(sha256(&[&der]));
        let claimed = t
            .get("token_sha256")
            .and_then(Value::as_str)
            .unwrap_or("")
            .to_ascii_lowercase();
        r.check(
            format!("{p}.token-sha256"),
            th == claimed,
            format!("{claimed} / {th}"),
        );
        match crate::evidence::tsr::parse_token(&der) {
            Ok(info) => {
                r.check(
                    format!("{p}.imprint-algorithm"),
                    info.hash_alg == "sha256",
                    info.hash_alg.clone(),
                );
                r.check(
                    format!("{p}.imprint"),
                    info.imprint == digest,
                    format!("{} / {digest}", info.imprint),
                );
                let claimed_time = t.get("gen_time_utc").and_then(Value::as_str).unwrap_or("");
                r.fact(&format!("{p}.gen_time"), info.gen_time.clone());
                if !claimed_time.is_empty() {
                    r.check(
                        format!("{p}.gen-time"),
                        claimed_time == info.gen_time,
                        format!("{claimed_time} / {}", info.gen_time),
                    );
                }
            }
            Err(e) => {
                r.check(format!("{p}.token"), false, e);
                continue;
            }
        }
        match tsa {
            Some(ti) if !ti.anchors.is_empty() => {
                let verdict = crate::evidence::tsa::verify_token(
                    &der,
                    stamped.as_bytes(),
                    &ti.anchors,
                    &ti.untrusted,
                );
                r.check(format!("{p}.rfc3161"), verdict.pass, verdict.reason);
            }
            _ => {
                r.check(
                    format!("{p}.rfc3161"),
                    false,
                    crate::t!("tlog-no-tsa-roots"),
                );
            }
        }
    }
    Ok(r)
}

// ── key history ───────────────────────────────────────────────────────────────

/// One verified key period.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct KeyPeriod {
    /// The record's `seq`, checked to equal its position in the history (from 0).
    pub seq: u64,
    /// The key's id, as named by the `key_id` of signed statements.
    pub key_id: String,
    /// The Ed25519 public key, 64 hex characters.
    pub public_key: String,
    /// UTC time from which the key is valid, later than the previous record's.
    pub not_before: String,
    /// The next record's `not_before`; `None` for the current key.
    pub not_after: Option<String>,
    /// True when the previous key's endorsement of this key verified (false for the first).
    pub endorsed_by_previous: bool,
}

/// A key history whose records all verified.
#[derive(Clone, Debug, Default)]
pub struct KeyHistory {
    /// The key periods, in record order (oldest first).
    pub periods: Vec<KeyPeriod>,
}

impl KeyHistory {
    /// The key with this id whose period contains `utc` (`not_before <= utc < not_after`).
    pub fn key_at(&self, key_id: &str, utc: &str) -> Option<[u8; 32]> {
        if !is_utc(utc) {
            return None;
        }
        self.periods
            .iter()
            .find(|p| {
                p.key_id == key_id
                    && p.not_before.as_str() <= utc
                    && p.not_after.as_deref().is_none_or(|a| utc < a)
            })
            .and_then(|p| key_of_hex(&p.public_key).ok())
    }
}

/// `verify-key-history`: the records' signatures, hashes, chain, order and endorsements.
/// `first_key`, when given, must be the key of record 0. The history is returned for use as
/// a key source only when every check passed.
pub fn verify_key_history(
    text: &str,
    first_key: Option<&[u8; 32]>,
    format: Option<&str>,
) -> Result<(Report, Option<KeyHistory>), String> {
    let mut r = Report::new("verify-key-history");
    let lines = parse_entries(text)?;
    let mut periods: Vec<KeyPeriod> = Vec::new();
    let mut prev: Option<(String, String, [u8; 32], String)> = None; // id, record sha, key, not_before
    for (i, line) in lines.iter().enumerate() {
        let p = format!("record[{i}]");
        let rec = field(line, "record")?;
        let canon = canonical_json(rec);
        let rsha = hex::encode(sha256(&[canon.as_bytes()]));
        let claimed = field(line, "record_sha256")?
            .as_str()
            .unwrap_or("")
            .to_ascii_lowercase();
        r.check(
            format!("{p}.record-sha256"),
            rsha == claimed,
            format!("{claimed} / {rsha}"),
        );
        let seq = u64_field(rec, "seq")?;
        r.check(format!("{p}.seq"), seq == i as u64, format!("{seq} / {i}"));
        if let Some(w) = format {
            let got = rec.get("format").and_then(Value::as_str).unwrap_or("-");
            r.check(format!("{p}.format"), got == w, format!("{got} / {w}"));
        }
        let alg = rec.get("algorithm").and_then(Value::as_str).unwrap_or("");
        r.check(
            format!("{p}.algorithm"),
            alg.eq_ignore_ascii_case("ed25519"),
            alg.to_string(),
        );
        let key_id = field(rec, "key_id")?
            .as_str()
            .ok_or_else(|| crate::terr!("e-tlog-bad-field", field = "key_id".to_string()))?
            .to_string();
        let pk_hex = field(rec, "public_key")?.as_str().unwrap_or("").to_string();
        let pk = key_of_hex(&pk_hex)?;
        let not_before = field(rec, "not_before")?.as_str().unwrap_or("").to_string();
        r.check(
            format!("{p}.not-before"),
            is_utc(&not_before),
            not_before.clone(),
        );
        let sig = field(line, "signature")?.as_str().unwrap_or("");
        r.check(
            format!("{p}.self-signature"),
            verify_sig(&pk, canon.as_bytes(), sig),
            key_id.clone(),
        );
        let prev_id = rec.get("previous_key_id").cloned().unwrap_or(Value::Null);
        let prev_sha = rec
            .get("previous_record_sha256")
            .and_then(Value::as_str)
            .unwrap_or("")
            .to_ascii_lowercase();
        let mut endorsed = false;
        match &prev {
            None => {
                r.check(
                    format!("{p}.previous-key-id"),
                    prev_id.is_null(),
                    prev_id.to_string(),
                );
                r.check(
                    format!("{p}.previous-record-sha256"),
                    prev_sha == "0".repeat(64),
                    prev_sha.clone(),
                );
                if let Some(k) = first_key {
                    r.check(
                        format!("{p}.first-key"),
                        &pk == k,
                        format!("{pk_hex} / {}", hex::encode(k)),
                    );
                }
            }
            Some((pid, psha, pkey, pnb)) => {
                r.check(
                    format!("{p}.previous-key-id"),
                    prev_id.as_str() == Some(pid.as_str()),
                    format!("{prev_id} / {pid}"),
                );
                r.check(
                    format!("{p}.previous-record-sha256"),
                    &prev_sha == psha,
                    format!("{prev_sha} / {psha}"),
                );
                r.check(
                    format!("{p}.not-before-order"),
                    not_before.as_str() > pnb.as_str(),
                    format!("{pnb} < {not_before}"),
                );
                match line.get("previous_key_endorsement") {
                    Some(Value::String(e)) => {
                        let mut m = Map::new();
                        m.insert(
                            "format".into(),
                            rec.get("format").cloned().unwrap_or(Value::Null),
                        );
                        m.insert("next_key_id".into(), Value::String(key_id.clone()));
                        m.insert("next_public_key".into(), Value::String(pk_hex.clone()));
                        m.insert("previous_key_id".into(), Value::String(pid.clone()));
                        let body = canonical_json(&Value::Object(m));
                        endorsed = verify_sig(pkey, body.as_bytes(), e);
                        r.check(format!("{p}.endorsement"), endorsed, pid.clone());
                    }
                    _ => r.fact(
                        &format!("{p}.endorsement"),
                        crate::t!("tlog-no-endorsement"),
                    ),
                }
                if let Some(last) = periods.last_mut() {
                    last.not_after = Some(not_before.clone());
                }
            }
        }
        periods.push(KeyPeriod {
            seq,
            key_id: key_id.clone(),
            public_key: pk_hex.clone(),
            not_before: not_before.clone(),
            not_after: None,
            endorsed_by_previous: endorsed,
        });
        prev = Some((key_id, rsha, pk, not_before));
    }
    r.check(
        "history.records",
        !periods.is_empty(),
        periods.len().to_string(),
    );
    for p in &periods {
        r.fact(
            &format!("key.{}", p.key_id),
            format!(
                "{} {} .. {}",
                p.public_key,
                p.not_before,
                p.not_after.as_deref().unwrap_or("-")
            ),
        );
    }
    let ok = r.pass;
    Ok((r, ok.then_some(KeyHistory { periods })))
}

/// The public key of a test seed, for documentation and tests.
pub fn test_key_hex(text: &str) -> String {
    public_key_hex(&sha256(&[text.as_bytes()]))
}

// ── command line ──────────────────────────────────────────────────────────────

fn flag(args: &[String], name: &str) -> Result<Option<String>, String> {
    match args.iter().position(|a| a == name) {
        None => Ok(None),
        Some(i) => args
            .get(i + 1)
            .cloned()
            .map(Some)
            .ok_or_else(|| crate::terr!("e-tlog-missing-value", option = name.to_string())),
    }
}

fn read(path: &str) -> Result<String, String> {
    std::fs::read_to_string(path).map_err(|e| {
        crate::terr!(
            "e-tlog-cannot-read",
            path = path.to_string(),
            e = e.to_string()
        )
    })
}

fn read_json(path: &str) -> Result<Value, String> {
    serde_json::from_str(&read(path)?).map_err(|e| {
        crate::terr!(
            "e-tlog-bad-json-file",
            path = path.to_string(),
            e = e.to_string()
        )
    })
}

fn positional(args: &[String], valued: &[&str], switches: &[&str]) -> Result<Vec<String>, String> {
    let mut pos = Vec::new();
    let mut i = 0;
    while i < args.len() {
        let a = &args[i];
        if valued.contains(&a.as_str()) {
            i += 2;
            continue;
        }
        if !switches.contains(&a.as_str()) {
            if a.starts_with("--") {
                return Err(crate::terr!("e-tlog-unknown-option", option = a.clone()));
            }
            pos.push(a.clone());
        }
        i += 1;
    }
    Ok(pos)
}

/// `kshana tlog <command> ...`. A failed verification prints its report and returns an error.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("tlog-usage");
    let Some((cmd, rest)) = args.split_first() else {
        return Err(usage());
    };
    let key_opts = ["--key", "--key-history", "--format"];
    let history_holder;
    let mut opts = Opts {
        keys: None,
        format: flag(rest, "--format")?,
    };
    if cmd != "verify-key-history" {
        match (flag(rest, "--key")?, flag(rest, "--key-history")?) {
            (Some(_), Some(_)) => return Err(crate::terr!("e-tlog-key-and-history")),
            (Some(k), None) => opts.keys = Some(KeySource::Key(key_of_hex(&k)?)),
            (None, Some(h)) => {
                let (hr, hist) = verify_key_history(&read(&h)?, None, None)?;
                match hist {
                    Some(hh) => history_holder = hh,
                    None => {
                        eprintln!("{}", hr.to_text());
                        return Err(crate::terr!("e-tlog-history-failed", path = h));
                    }
                }
                opts.keys = Some(KeySource::History(&history_holder));
            }
            (None, None) => {}
        }
    }
    let json = rest.iter().any(|a| a == "--json");
    let report = match cmd.as_str() {
        "verify-inclusion" => {
            let mut v = key_opts.to_vec();
            v.extend(["--entry", "--sth"]);
            let pos = positional(rest, &v, &["--json"])?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let entry = flag(rest, "--entry")?.map(|p| read_json(&p)).transpose()?;
            let sth = flag(rest, "--sth")?.map(|p| read_json(&p)).transpose()?;
            verify_inclusion(&read_json(path)?, entry.as_ref(), sth.as_ref(), &opts)?
        }
        "verify-consistency" => {
            let mut v = key_opts.to_vec();
            v.extend(["--sth-from", "--sth-to"]);
            let pos = positional(rest, &v, &["--json"])?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let a = flag(rest, "--sth-from")?
                .map(|p| read_json(&p))
                .transpose()?;
            let b = flag(rest, "--sth-to")?.map(|p| read_json(&p)).transpose()?;
            verify_consistency_doc(&read_json(path)?, a.as_ref(), b.as_ref(), &opts)?
        }
        "verify-sth" => {
            let mut v = key_opts.to_vec();
            v.push("--entries");
            let pos = positional(rest, &v, &["--json"])?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let entries = flag(rest, "--entries")?
                .map(|p| read(&p).and_then(|t| parse_entries(&t)))
                .transpose()?;
            verify_sth(&read_json(path)?, entries.as_deref(), &opts)?
        }
        "verify-daily-root" => {
            let mut v = key_opts.to_vec();
            v.extend(["--tsa-ca", "--tsa-certs"]);
            let pos = positional(rest, &v, &["--json"])?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let tsa = match flag(rest, "--tsa-ca")? {
                None => None,
                Some(ca) => Some(TsaInputs {
                    anchors: crate::evidence::tsa::pem_certificates(&read(&ca)?)?,
                    untrusted: match flag(rest, "--tsa-certs")? {
                        Some(c) => crate::evidence::tsa::pem_certificates(&read(&c)?)?,
                        None => Vec::new(),
                    },
                }),
            };
            verify_daily_root(&read_json(path)?, tsa.as_ref(), &opts)?
        }
        "verify-key-history" => {
            let pos = positional(rest, &["--first-key", "--format"], &["--json"])?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let first = flag(rest, "--first-key")?
                .map(|k| key_of_hex(&k))
                .transpose()?;
            verify_key_history(&read(path)?, first.as_ref(), opts.format.as_deref())?.0
        }
        _ => return Err(usage()),
    };
    if json {
        println!(
            "{}",
            serde_json::to_string_pretty(&report).map_err(|e| e.to_string())?
        );
    } else {
        println!("{}", report.to_text());
    }
    if report.pass {
        Ok(())
    } else {
        Err(crate::terr!(
            "e-tlog-verification-failed",
            command = report.command.clone()
        ))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn canonical_json_sorts_at_every_depth() {
        let v: Value =
            serde_json::from_str(r#"{"b":1,"a":{"d":[1,{"z":0,"y":null}],"c":"x"}}"#).unwrap();
        assert_eq!(
            canonical_json(&v),
            r#"{"a":{"c":"x","d":[1,{"y":null,"z":0}]},"b":1}"#
        );
    }

    #[test]
    fn leaf_bytes_rebuild_the_order_and_read_the_class() {
        let pack = "ab".repeat(32);
        let e: Value = serde_json::from_str(&format!(
            r#"{{"signer_key_id":null,"pack_sha256":"{pack}","logged_utc":"2026-11-20T00:00:00Z","kind":"crl-revocation/1"}}"#
        ))
        .unwrap();
        let (b, c) = leaf_bytes(&e).unwrap();
        assert_eq!(
            String::from_utf8(b).unwrap(),
            format!(
                r#"{{"pack_sha256":"{pack}","kind":"crl-revocation/1","signer_key_id":null,"logged_utc":"2026-11-20T00:00:00Z"}}"#
            )
        );
        assert_eq!(c, EntryClass::Revocation);
        let mut bad = e.clone();
        bad["class"] = Value::String("other".into());
        assert!(leaf_bytes(&bad).is_err());
    }

    #[test]
    fn utc_shape() {
        assert!(is_utc("2026-11-20T04:30:00Z"));
        assert!(!is_utc("2026-11-20 04:30:00Z"));
        assert!(!is_utc("2026-11-20T04:30:00+00:00"));
    }
}
