// SPDX-License-Identifier: AGPL-3.0-only
//! A public register of products scored under a stated method, and its viewer (`kshana register`).
//!
//! A **register** (`kshana.register/1`) lists products that were scored under a named method:
//! the product, its maker and version, the method and its version, the date it was scored, the
//! date by which it is to be scored again (its revalidation date), a short outcome as the
//! scorer states it, and optionally the digest and address of the evidence. The publisher signs
//! the register with an Ed25519 key.
//!
//! A **revocation list** (`kshana.register-crl/1`) is a separate, signed file from the issuer
//! that runs the scoring service: the entry ids that no longer stand, each with a date and a
//! reason, and the date by which the issuer publishes the next list. This module reads and
//! checks such lists; issuing them is the issuer's business.
//!
//! The viewer joins the two at a date: each entry is `current`, `due` (its revalidation date has
//! passed) or `revoked`. Without a list, revocation is `unknown`; with a list past its next
//! update, the view says the list is stale. An entry says only that the product was scored
//! under the method; it is not a statement about the product beyond that score.
//! `docs/PRODUCT-REGISTER.md` describes the formats.

use serde::{Deserialize, Serialize};
use std::collections::{BTreeMap, BTreeSet};

/// The schema id of a register.
pub const REGISTER_SCHEMA: &str = "kshana.register/1";
/// The schema id of a revocation list.
pub const CRL_SCHEMA: &str = "kshana.register-crl/1";
/// The schema id of a view.
pub const VIEW_SCHEMA: &str = "kshana.register-view/1";

/// One product scored under a method.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Entry {
    /// A stable id, unique in the register: letters, digits, `.`, `-` and `_`.
    pub id: String,
    /// The product's name.
    pub product: String,
    /// Who makes it.
    pub maker: String,
    /// The product version (hardware, firmware or software) that was scored.
    pub version: String,
    /// The method's id.
    pub method: String,
    /// The method's version.
    pub method_version: String,
    /// When it was scored (YYYY-MM-DD).
    pub scored: String,
    /// When it is to be scored again (YYYY-MM-DD).
    pub revalidate_by: String,
    /// The outcome as the scorer states it (a score, a band).
    pub outcome: String,
    /// SHA-256 of the evidence, hex.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub evidence_sha256: Option<String>,
    /// Where the evidence can be read.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub evidence_url: Option<String>,
    /// The test scenario set the product was scored on.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub scenario_set: Option<String>,
    /// That set's version.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub scenario_set_version: Option<String>,
}

/// A signed register.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Register {
    /// Always [`REGISTER_SCHEMA`].
    pub schema: String,
    /// Who publishes it.
    pub publisher: String,
    /// When it was published (YYYY-MM-DD).
    pub issued: String,
    /// The entries.
    pub entries: Vec<Entry>,
    /// The publisher's Ed25519 public key, hex.
    #[serde(default)]
    pub signer: String,
    /// Ed25519 signature, hex, over [`signing_bytes`].
    #[serde(default)]
    pub signature: String,
}

/// One revoked entry.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Revoked {
    /// The entry id.
    pub id: String,
    /// From when (YYYY-MM-DD).
    pub revoked: String,
    /// Why, as the issuer states it.
    pub reason: String,
}

/// A signed revocation list.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Crl {
    /// Always [`CRL_SCHEMA`].
    pub schema: String,
    /// Who issues it.
    pub issuer: String,
    /// When it was issued (YYYY-MM-DD).
    pub issued: String,
    /// When the next list is due (YYYY-MM-DD); after it this list is stale.
    pub next_update: String,
    /// The revoked entries.
    pub revoked: Vec<Revoked>,
    /// The issuer's Ed25519 public key, hex.
    #[serde(default)]
    pub signer: String,
    /// Ed25519 signature, hex, over [`signing_bytes`].
    #[serde(default)]
    pub signature: String,
}

/// A document this module signs.
pub trait Signed: Serialize + Clone {
    /// The schema id, used as the signature's domain prefix.
    fn schema_id(&self) -> &'static str;
    /// The signature field.
    fn signature_mut(&mut self) -> &mut String;
    /// The signer field.
    fn signer_mut(&mut self) -> &mut String;
}

impl Signed for Register {
    fn schema_id(&self) -> &'static str {
        REGISTER_SCHEMA
    }
    fn signature_mut(&mut self) -> &mut String {
        &mut self.signature
    }
    fn signer_mut(&mut self) -> &mut String {
        &mut self.signer
    }
}

impl Signed for Crl {
    fn schema_id(&self) -> &'static str {
        CRL_SCHEMA
    }
    fn signature_mut(&mut self) -> &mut String {
        &mut self.signature
    }
    fn signer_mut(&mut self) -> &mut String {
        &mut self.signer
    }
}

/// The bytes a signature covers: the schema id and a newline, then the document's JSON with an
/// empty signature.
pub fn signing_bytes<T: Signed>(doc: &T) -> Vec<u8> {
    let mut d = doc.clone();
    d.signature_mut().clear();
    let mut out = format!("{}\n", doc.schema_id()).into_bytes();
    out.extend(serde_json::to_vec(&d).unwrap_or_default());
    out
}

/// Sign a document with the key whose seed is `seed`, setting its signer and signature.
pub fn sign<T: Signed>(doc: &mut T, seed: &[u8; 32]) {
    *doc.signer_mut() = crate::evidence::bundle::public_key_hex(seed);
    let sig = crate::evidence::bundle::sign_detached(seed, &signing_bytes(doc));
    *doc.signature_mut() = hex::encode(sig);
}

fn verify_sig<T: Signed>(
    doc: &T,
    signer: &str,
    signature: &str,
    pin: Option<&str>,
) -> Result<(), String> {
    if let Some(want) = pin {
        if !want.trim().eq_ignore_ascii_case(signer) {
            return Err(crate::terr!(
                "e-register-key-mismatch",
                found = signer.to_string(),
                expected = want.trim().to_string()
            ));
        }
    }
    let pk = hex::decode(signer)
        .ok()
        .and_then(|v| <[u8; 32]>::try_from(v.as_slice()).ok());
    let sig = hex::decode(signature)
        .ok()
        .and_then(|v| <[u8; 64]>::try_from(v.as_slice()).ok());
    let (Some(pk), Some(sig)) = (pk, sig) else {
        return Err(crate::terr!("e-register-bad-signature"));
    };
    if crate::evidence::verify::verify_detached(&pk, &signing_bytes(doc), &sig)? {
        Ok(())
    } else {
        Err(crate::terr!("e-register-bad-signature"))
    }
}

/// Whether `s` is a calendar date written YYYY-MM-DD.
pub fn is_date(s: &str) -> bool {
    let b = s.as_bytes();
    if b.len() != 10 || b[4] != b'-' || b[7] != b'-' {
        return false;
    }
    let num = |r: std::ops::Range<usize>| s[r].parse::<u32>().ok();
    let (Some(y), Some(m), Some(d)) = (num(0..4), num(5..7), num(8..10)) else {
        return false;
    };
    if !s[0..4].bytes().all(|c| c.is_ascii_digit()) {
        return false;
    }
    let leap = (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
    let days = match m {
        1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
        4 | 6 | 9 | 11 => 30,
        2 if leap => 29,
        2 => 28,
        _ => return false,
    };
    (1..=days).contains(&d)
}

fn need_date(field: &str, v: &str) -> Result<(), String> {
    if is_date(v) {
        Ok(())
    } else {
        Err(crate::terr!(
            "e-register-bad-date",
            field = field.to_string(),
            value = v.to_string()
        ))
    }
}

fn id_ok(s: &str) -> bool {
    !s.is_empty()
        && s.len() <= 128
        && s.bytes()
            .all(|c| c.is_ascii_alphanumeric() || matches!(c, b'.' | b'-' | b'_'))
}

/// Check a register's text: the schema, the signature (against `pin` when given), the dates,
/// unique well-formed ids, and that no entry is to be scored again before it was scored.
pub fn check_register(text: &str, pin: Option<&str>) -> Result<Register, String> {
    let r: Register = serde_json::from_str(text)
        .map_err(|e| crate::terr!("e-register-not-register", e = e.to_string()))?;
    if r.schema != REGISTER_SCHEMA {
        return Err(crate::terr!(
            "e-register-not-register",
            e = r.schema.clone()
        ));
    }
    verify_sig(&r, &r.signer, &r.signature, pin)?;
    need_date("issued", &r.issued)?;
    let mut ids = BTreeSet::new();
    for e in &r.entries {
        if !id_ok(&e.id) {
            return Err(crate::terr!("e-register-bad-id", id = e.id.clone()));
        }
        if !ids.insert(e.id.as_str()) {
            return Err(crate::terr!("e-register-duplicate-id", id = e.id.clone()));
        }
        need_date("scored", &e.scored)?;
        need_date("revalidate_by", &e.revalidate_by)?;
        if e.revalidate_by < e.scored {
            return Err(crate::terr!(
                "e-register-revalidate-before-scored",
                id = e.id.clone()
            ));
        }
        if let Some(h) = &e.evidence_sha256 {
            if h.len() != 64 || !h.bytes().all(|c| c.is_ascii_hexdigit()) {
                return Err(crate::terr!("e-register-bad-digest", id = e.id.clone()));
            }
        }
    }
    Ok(r)
}

/// Check a revocation list's text: the schema, the signature against the issuer key `pin`
/// (required: a list is only as good as the key it is checked against), and the dates.
pub fn check_crl(text: &str, pin: &str) -> Result<Crl, String> {
    let c: Crl = serde_json::from_str(text)
        .map_err(|e| crate::terr!("e-register-not-crl", e = e.to_string()))?;
    if c.schema != CRL_SCHEMA {
        return Err(crate::terr!("e-register-not-crl", e = c.schema.clone()));
    }
    verify_sig(&c, &c.signer, &c.signature, Some(pin))?;
    need_date("issued", &c.issued)?;
    need_date("next_update", &c.next_update)?;
    if c.next_update < c.issued {
        return Err(crate::terr!(
            "e-register-bad-date",
            field = "next_update".to_string(),
            value = c.next_update.clone()
        ));
    }
    for v in &c.revoked {
        need_date("revoked", &v.revoked)?;
    }
    Ok(c)
}

/// An entry's state at the view date.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Status {
    /// Scored, not revoked (or revocation unknown), revalidation date not passed.
    Current,
    /// The revalidation date has passed.
    Due,
    /// On the revocation list from a date at or before the view date.
    Revoked,
}

/// Whether the entry was checked against a revocation list.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Revocation {
    /// No list was given.
    Unknown,
    /// Checked against a list that was current at the view date.
    Checked,
    /// Checked against a list past its next update.
    Stale,
}

/// One line of a view.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ViewRow {
    /// The entry.
    #[serde(flatten)]
    pub entry: Entry,
    /// Its state at the view date.
    pub status: Status,
    /// How revocation was checked.
    pub revocation: Revocation,
    /// The revocation, when the entry is revoked.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub revoked: Option<Revoked>,
}

/// A register seen at a date.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct View {
    /// Always [`VIEW_SCHEMA`].
    pub schema: String,
    /// The view date.
    pub date: String,
    /// The publisher and its key.
    pub publisher: String,
    /// The register signer.
    pub register_signer: String,
    /// The list's issuer and key, when a list was given.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub crl_issuer: Option<String>,
    /// The list's next update, when a list was given.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub crl_next_update: Option<String>,
    /// Revocations naming no entry of this register.
    pub crl_unmatched: Vec<String>,
    /// The entries, in register order.
    pub rows: Vec<ViewRow>,
    /// Entries per status.
    pub counts: BTreeMap<String, usize>,
}

/// Join a checked register and an optional checked list at `date` (YYYY-MM-DD).
pub fn view(reg: &Register, crl: Option<&Crl>, date: &str) -> Result<View, String> {
    need_date("date", date)?;
    let revocation = match crl {
        None => Revocation::Unknown,
        Some(c) if date > c.next_update.as_str() => Revocation::Stale,
        Some(_) => Revocation::Checked,
    };
    let by_id: BTreeMap<&str, &Revoked> = crl
        .map(|c| c.revoked.iter().map(|v| (v.id.as_str(), v)).collect())
        .unwrap_or_default();
    let mut counts = BTreeMap::new();
    let rows: Vec<ViewRow> = reg
        .entries
        .iter()
        .map(|e| {
            let rv = by_id
                .get(e.id.as_str())
                .filter(|v| v.revoked.as_str() <= date)
                .map(|v| (*v).clone());
            let status = if rv.is_some() {
                Status::Revoked
            } else if date > e.revalidate_by.as_str() {
                Status::Due
            } else {
                Status::Current
            };
            let key = match status {
                Status::Current => "current",
                Status::Due => "due",
                Status::Revoked => "revoked",
            };
            *counts.entry(key.to_string()).or_insert(0) += 1;
            ViewRow {
                entry: e.clone(),
                status,
                revocation,
                revoked: rv,
            }
        })
        .collect();
    let ids: BTreeSet<&str> = reg.entries.iter().map(|e| e.id.as_str()).collect();
    let crl_unmatched = crl
        .map(|c| {
            c.revoked
                .iter()
                .filter(|v| !ids.contains(v.id.as_str()))
                .map(|v| v.id.clone())
                .collect()
        })
        .unwrap_or_default();
    Ok(View {
        schema: VIEW_SCHEMA.to_string(),
        date: date.to_string(),
        publisher: reg.publisher.clone(),
        register_signer: reg.signer.clone(),
        crl_issuer: crl.map(|c| c.issuer.clone()),
        crl_next_update: crl.map(|c| c.next_update.clone()),
        crl_unmatched,
        rows,
        counts,
    })
}

fn flag(args: &[String], name: &str) -> Result<Option<String>, String> {
    match args.iter().position(|a| a == name) {
        None => Ok(None),
        Some(i) => args
            .get(i + 1)
            .cloned()
            .map(Some)
            .ok_or_else(|| crate::terr!("e-register-missing-value", option = name.to_string())),
    }
}

fn read(path: &str) -> Result<String, String> {
    std::fs::read_to_string(path).map_err(|e| {
        crate::terr!(
            "e-register-cannot-read",
            path = path.to_string(),
            e = e.to_string()
        )
    })
}

fn check_options(
    args: &[String],
    valued: &[&str],
    switches: &[&str],
) -> Result<Vec<String>, String> {
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
                return Err(crate::terr!(
                    "e-register-unknown-option",
                    option = a.clone()
                ));
            }
            pos.push(a.clone());
        }
        i += 1;
    }
    Ok(pos)
}

/// `kshana register <check|crl-check|view|sign> ...`.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("register-usage");
    let Some((cmd, rest)) = args.split_first() else {
        return Err(usage());
    };
    match cmd.as_str() {
        "check" => {
            let pos = check_options(rest, &["--key"], &[])?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let r = check_register(&read(path)?, flag(rest, "--key")?.as_deref())
                .map_err(|e| format!("{path}: {e}"))?;
            println!(
                "{}",
                crate::t!(
                    "register-check-ok",
                    path = path.clone(),
                    n = r.entries.len(),
                    publisher = r.publisher.clone(),
                    key = r.signer.clone()
                )
            );
            Ok(())
        }
        "crl-check" => {
            let pos = check_options(rest, &["--key"], &[])?;
            let ([path], Some(key)) = (pos.as_slice(), flag(rest, "--key")?) else {
                return Err(usage());
            };
            let c = check_crl(&read(path)?, &key).map_err(|e| format!("{path}: {e}"))?;
            println!(
                "{}",
                crate::t!(
                    "register-crl-check-ok",
                    path = path.clone(),
                    n = c.revoked.len(),
                    issuer = c.issuer.clone(),
                    next = c.next_update.clone()
                )
            );
            Ok(())
        }
        "view" => {
            let pos = check_options(
                rest,
                &["--key", "--crl", "--crl-key", "--date"],
                &["--json"],
            )?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let reg = check_register(&read(path)?, flag(rest, "--key")?.as_deref())
                .map_err(|e| format!("{path}: {e}"))?;
            let crl = match (flag(rest, "--crl")?, flag(rest, "--crl-key")?) {
                (None, None) => None,
                (Some(c), Some(k)) => {
                    Some(check_crl(&read(&c)?, &k).map_err(|e| format!("{c}: {e}"))?)
                }
                _ => return Err(crate::terr!("e-register-crl-needs-key")),
            };
            let date = flag(rest, "--date")?
                .unwrap_or_else(|| crate::iq::io::record::now_iso()[..10].to_string());
            let v = view(&reg, crl.as_ref(), &date)?;
            if rest.iter().any(|a| a == "--json") {
                println!(
                    "{}",
                    serde_json::to_string_pretty(&v).map_err(|e| e.to_string())?
                );
                return Ok(());
            }
            println!("id\tproduct\tmaker\tversion\tmethod\tscored\trevalidate_by\tstatus\toutcome");
            for r in &v.rows {
                let e = &r.entry;
                let status = match r.status {
                    Status::Current => "current",
                    Status::Due => "due",
                    Status::Revoked => "revoked",
                };
                println!(
                    "{}\t{}\t{}\t{}\t{} {}\t{}\t{}\t{}\t{}",
                    e.id,
                    e.product,
                    e.maker,
                    e.version,
                    e.method,
                    e.method_version,
                    e.scored,
                    e.revalidate_by,
                    status,
                    e.outcome
                );
            }
            let c = |k: &str| v.counts.get(k).copied().unwrap_or(0);
            eprintln!(
                "{}",
                crate::t!(
                    "register-view-summary",
                    date = v.date.clone(),
                    current = c("current"),
                    due = c("due"),
                    revoked = c("revoked")
                )
            );
            match &v.crl_next_update {
                None => eprintln!("{}", crate::t!("register-view-no-crl")),
                Some(next) if v.date.as_str() > next.as_str() => eprintln!(
                    "{}",
                    crate::t!("register-view-crl-stale", next = next.clone())
                ),
                Some(_) => {}
            }
            Ok(())
        }
        "sign" => {
            let pos = check_options(rest, &["--key", "--out"], &[])?;
            let ([path], Some(key)) = (pos.as_slice(), flag(rest, "--key")?) else {
                return Err(usage());
            };
            let text = read(path)?;
            let seed = crate::evidence::cli::read_seed(&key)?;
            let probe: serde_json::Value = serde_json::from_str(&text)
                .map_err(|e| crate::terr!("e-register-not-register", e = e.to_string()))?;
            let out = match probe.get("schema").and_then(|s| s.as_str()) {
                Some(REGISTER_SCHEMA) => {
                    let mut r: Register = serde_json::from_value(probe)
                        .map_err(|e| crate::terr!("e-register-not-register", e = e.to_string()))?;
                    sign(&mut r, &seed);
                    let t = serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?;
                    check_register(&t, None)?;
                    t
                }
                Some(CRL_SCHEMA) => {
                    let mut c: Crl = serde_json::from_value(probe)
                        .map_err(|e| crate::terr!("e-register-not-crl", e = e.to_string()))?;
                    sign(&mut c, &seed);
                    let t = serde_json::to_string_pretty(&c).map_err(|e| e.to_string())?;
                    check_crl(&t, &c.signer)?;
                    t
                }
                other => {
                    return Err(crate::terr!(
                        "e-register-not-register",
                        e = other.unwrap_or_default().to_string()
                    ))
                }
            };
            match flag(rest, "--out")? {
                Some(p) => std::fs::write(&p, out + "\n").map_err(|e| {
                    crate::terr!(
                        "e-register-cannot-write",
                        path = p.clone(),
                        e = e.to_string()
                    )
                }),
                None => {
                    println!("{out}");
                    Ok(())
                }
            }
        }
        _ => Err(usage()),
    }
}
