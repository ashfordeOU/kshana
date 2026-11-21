// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana register-products verify|show|diff`: the public register of scored products
//! ([`crate::product_register`], `kshana.register/1`) checked against the signed evidence packs
//! its entries name, read against a published revocation list of JSON lines, and compared
//! version to version for the append-only rule (docs/PRODUCT-REGISTER.md).
//!
//! * **verify**: for every entry with an `evidence_sha256`, the evidence pack (a directory
//!   `<packs>/<entry id>/`) is read; the SHA-256 of its signed `manifest.json` must equal the
//!   entry's digest, and the pack must pass [`crate::evidence::verify::verify_bundle`] (its
//!   files, hashes and Ed25519 signature; against `--pack-key` when given).
//! * **show**: the register at a date with a revocation list given as a file or an `http(s)` URL
//!   the user names (fetched with the system `curl`, read only). The list is JSON lines, one
//!   object per revocation: `{"serial": <entry id>, "revoked_at": "YYYY-MM-DD", "reason": "..."}`.
//!   A revoked entry shows as `REVOKED`; with no list, revocation is `unknown`. (A signed
//!   `kshana.register-crl/1` list is read by `kshana register view`.)
//! * **diff**: two versions of a register: an entry present in the older must be present,
//!   unchanged, in the newer, and the newer must not be issued earlier. Anything else breaks
//!   the append-only rule and is listed; added entries are listed too.
//!
//! An entry states that a product version was scored under a method version on a scenario set,
//! with the outcome the scorer states; it is no statement about the product beyond that score.

use crate::product_register::{self as pr, Crl, Register, Revoked};
use serde::{Deserialize, Serialize};

/// One line of a published revocation list.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RevocationLine {
    /// The register entry id.
    pub serial: String,
    /// From when (YYYY-MM-DD).
    pub revoked_at: String,
    /// Why, as the issuer states it.
    pub reason: String,
}

/// Read a JSON-lines revocation list.
pub fn parse_revocations(text: &str) -> Result<Vec<RevocationLine>, String> {
    let mut out = Vec::new();
    for (n, l) in text.lines().enumerate() {
        let l = l.trim();
        if l.is_empty() || l.starts_with('#') {
            continue;
        }
        let r: RevocationLine = serde_json::from_str(l)
            .map_err(|_| crate::terr!("e-register-products-bad-revocation", line = n + 1))?;
        if !pr::is_date(&r.revoked_at) {
            return Err(crate::terr!(
                "e-register-products-bad-revocation",
                line = n + 1
            ));
        }
        out.push(r);
    }
    Ok(out)
}

/// Fetch a revocation list from a URL with the system `curl` (GET only).
pub fn fetch(url: &str) -> Result<String, String> {
    if !(url.starts_with("https://") || url.starts_with("http://")) {
        return Err(crate::terr!(
            "e-register-products-cannot-fetch",
            url = url,
            e = "scheme"
        ));
    }
    let out = std::process::Command::new("curl")
        .args(["-fsSL", "--max-time", "30", "--proto", "=http,https", url])
        .output()
        .map_err(|e| crate::terr!("e-register-products-cannot-fetch", url = url, e = e))?;
    if !out.status.success() {
        return Err(crate::terr!(
            "e-register-products-cannot-fetch",
            url = url,
            e = String::from_utf8_lossy(&out.stderr).trim().to_string()
        ));
    }
    Ok(String::from_utf8_lossy(&out.stdout).into_owned())
}

/// The list as an (unsigned) [`Crl`] for [`pr::view`], current at `date`.
pub fn as_crl(lines: &[RevocationLine], date: &str, source: &str) -> Crl {
    Crl {
        schema: pr::CRL_SCHEMA.to_string(),
        issuer: source.to_string(),
        issued: date.to_string(),
        next_update: date.to_string(),
        revoked: lines
            .iter()
            .map(|l| Revoked {
                id: l.serial.clone(),
                revoked: l.revoked_at.clone(),
                reason: l.reason.clone(),
            })
            .collect(),
        signer: String::new(),
        signature: String::new(),
    }
}

/// One entry's pack check.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PackCheck {
    /// Entry id.
    pub id: String,
    /// `verified`, `digest-mismatch`, `pack-invalid`, `no-pack` or `no-digest`.
    pub result: &'static str,
    /// The manifest digest found, when the pack was read.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub found_sha256: Option<String>,
    /// The pack signer's fingerprint, when it parsed.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub signer_fingerprint: Option<String>,
}

/// Verify every entry against its pack under `packs`.
pub fn verify(reg: &Register, packs: &std::path::Path, key: Option<[u8; 32]>) -> Vec<PackCheck> {
    reg.entries
        .iter()
        .map(|e| {
            let mut c = PackCheck {
                id: e.id.clone(),
                result: "no-digest",
                found_sha256: None,
                signer_fingerprint: None,
            };
            let Some(want) = &e.evidence_sha256 else {
                return c;
            };
            let dir = packs.join(&e.id);
            let Ok(files) = crate::evidence::cli::read_dir(&dir) else {
                c.result = "no-pack";
                return c;
            };
            let Some(manifest) = files.get("manifest.json") else {
                c.result = "pack-invalid";
                return c;
            };
            let found = crate::advanced_report::sha256_hex(manifest);
            c.found_sha256 = Some(found.clone());
            let rep = crate::evidence::verify::verify_bundle(
                &files,
                &crate::evidence::verify::VerifyOptions {
                    expected_public_key: key,
                    ..Default::default()
                },
            );
            c.signer_fingerprint = rep.signer_fingerprint.clone();
            c.result = if !found.eq_ignore_ascii_case(want) {
                "digest-mismatch"
            } else if !rep.ok {
                "pack-invalid"
            } else {
                "verified"
            };
            c
        })
        .collect()
}

/// The append-only comparison of two versions.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Diff {
    /// Document schema.
    pub schema: &'static str,
    /// Issue dates, older then newer.
    pub issued: [String; 2],
    /// Entries in the newer only.
    pub added: Vec<String>,
    /// Entries of the older missing from the newer.
    pub removed: Vec<String>,
    /// Entries present in both with different content.
    pub changed: Vec<String>,
    /// Whether the newer is issued no earlier than the older.
    pub issued_in_order: bool,
    /// True when nothing was removed or changed and the dates are in order.
    pub append_only: bool,
}

/// Compare two versions of a register.
pub fn diff(old: &Register, new: &Register) -> Diff {
    let mut added = Vec::new();
    let mut removed = Vec::new();
    let mut changed = Vec::new();
    for o in &old.entries {
        match new.entries.iter().find(|n| n.id == o.id) {
            None => removed.push(o.id.clone()),
            Some(n) if n != o => changed.push(o.id.clone()),
            _ => {}
        }
    }
    for n in &new.entries {
        if !old.entries.iter().any(|o| o.id == n.id) {
            added.push(n.id.clone());
        }
    }
    let in_order = new.issued >= old.issued;
    Diff {
        schema: "kshana.register-diff/1",
        issued: [old.issued.clone(), new.issued.clone()],
        append_only: removed.is_empty() && changed.is_empty() && in_order,
        added,
        removed,
        changed,
        issued_in_order: in_order,
    }
}

// ───────────────────────────── command line ─────────────────────────────

/// `kshana register-products <verify|show|diff> ...`. Exit 0, 1 when a pack does not verify, an
/// entry is revoked (show) or the append-only rule is broken (diff), 2 on a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    match cli(args) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn key_hex(s: &str) -> Result<[u8; 32], String> {
    let v = hex::decode(s.trim()).map_err(|_| crate::terr!("e-register-products-bad-key"))?;
    <[u8; 32]>::try_from(v.as_slice()).map_err(|_| crate::terr!("e-register-products-bad-key"))
}

fn cli(args: &[String]) -> Result<i32, String> {
    let Some(sub) = args.first() else {
        return Err(crate::t!("register-products-usage"));
    };
    if sub == "--help" || sub == "-h" || args.iter().any(|a| a == "--help") {
        println!("{}", crate::t!("register-products-usage"));
        return Ok(0);
    }
    let mut pos = Vec::new();
    let mut kv: Vec<(String, String)> = Vec::new();
    let mut json = false;
    let mut it = args[1..].iter();
    while let Some(a) = it.next() {
        if a == "--json" {
            json = true;
        } else if a.starts_with("--") {
            let v = it
                .next()
                .ok_or_else(|| crate::terr!("e-register-products-missing-value", option = a))?;
            kv.push((a.clone(), v.clone()));
        } else {
            pos.push(a.clone());
        }
    }
    let known: &[&str] = match sub.as_str() {
        "verify" => &["--packs", "--pin", "--pack-key"],
        "show" => &["--revocations", "--date", "--pin"],
        "diff" => &["--pin"],
        _ => return Err(crate::t!("register-products-usage")),
    };
    if let Some((k, _)) = kv.iter().find(|(k, _)| !known.contains(&k.as_str())) {
        return Err(crate::terr!(
            "e-register-products-unknown-option",
            option = k
        ));
    }
    let get = |k: &str| kv.iter().rev().find(|p| p.0 == k).map(|p| p.1.clone());
    let read = |p: &str| {
        std::fs::read_to_string(p)
            .map_err(|e| crate::terr!("e-register-products-cannot-read", path = p, e = e))
    };
    let pin = get("--pin");
    let load = |p: &str| pr::check_register(&read(p)?, pin.as_deref());
    let print = |v: &serde_json::Value| {
        println!("{}", serde_json::to_string_pretty(v).unwrap_or_default());
    };
    match sub.as_str() {
        "verify" => {
            let [p] = pos.as_slice() else {
                return Err(crate::t!("register-products-usage"));
            };
            let reg = load(p)?;
            let packs = get("--packs").unwrap_or_else(|| ".".into());
            let key = get("--pack-key").map(|k| key_hex(&k)).transpose()?;
            let checks = verify(&reg, std::path::Path::new(&packs), key);
            let bad = checks
                .iter()
                .any(|c| !matches!(c.result, "verified" | "no-digest"));
            if json {
                print(
                    &serde_json::json!({"schema": "kshana.register-verify/1", "checks": checks, "ok": !bad}),
                );
            } else {
                for c in &checks {
                    println!("{:<24} {}", c.id, c.result);
                }
            }
            Ok(i32::from(bad))
        }
        "show" => {
            let [p] = pos.as_slice() else {
                return Err(crate::t!("register-products-usage"));
            };
            let reg = load(p)?;
            let date = get("--date").unwrap_or_else(|| reg.issued.clone());
            let crl = match get("--revocations") {
                None => None,
                Some(src) => {
                    let text = if src.starts_with("http://") || src.starts_with("https://") {
                        fetch(&src)?
                    } else {
                        read(&src)?
                    };
                    Some(as_crl(&parse_revocations(&text)?, &date, &src))
                }
            };
            let v = pr::view(&reg, crl.as_ref(), &date)?;
            let revoked = v.rows.iter().any(|r| r.status == pr::Status::Revoked);
            if json {
                print(&serde_json::to_value(&v).map_err(|e| e.to_string())?);
            } else {
                for r in &v.rows {
                    let s = match r.status {
                        pr::Status::Revoked => "REVOKED",
                        pr::Status::Due => "due",
                        pr::Status::Current => "current",
                    };
                    println!(
                        "{:<8} {:<24} {} {} | {} {} | {}",
                        s,
                        r.entry.id,
                        r.entry.product,
                        r.entry.version,
                        r.entry.method,
                        r.entry.method_version,
                        r.entry.outcome
                    );
                }
            }
            Ok(i32::from(revoked))
        }
        "diff" => {
            let [a, b] = pos.as_slice() else {
                return Err(crate::t!("register-products-usage"));
            };
            let d = diff(&load(a)?, &load(b)?);
            print(&serde_json::to_value(&d).map_err(|e| e.to_string())?);
            Ok(i32::from(!d.append_only))
        }
        _ => unreachable!(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn reg(entries: &[(&str, &str)]) -> Register {
        Register {
            schema: pr::REGISTER_SCHEMA.into(),
            publisher: "test".into(),
            issued: "2026-11-01".into(),
            entries: entries
                .iter()
                .map(|(id, outcome)| pr::Entry {
                    id: id.to_string(),
                    product: "P".into(),
                    maker: "M".into(),
                    version: "1".into(),
                    method: "bench".into(),
                    method_version: "2.2.0".into(),
                    scored: "2026-10-01".into(),
                    revalidate_by: "2027-10-01".into(),
                    outcome: outcome.to_string(),
                    evidence_sha256: None,
                    evidence_url: None,
                    scenario_set: Some("bench-tasks".into()),
                    scenario_set_version: Some("2.2.0".into()),
                })
                .collect(),
            signer: String::new(),
            signature: String::new(),
        }
    }

    #[test]
    fn a_revoked_entry_shows_as_revoked() {
        let r = reg(&[("a1", "pass"), ("b2", "pass")]);
        let lines = parse_revocations(
            "# published list\n{\"serial\":\"b2\",\"revoked_at\":\"2026-11-10\",\"reason\":\"pack withdrawn\"}\n",
        )
        .unwrap();
        let v = pr::view(
            &r,
            Some(&as_crl(&lines, "2026-11-20", "test")),
            "2026-11-20",
        )
        .unwrap();
        assert_eq!(v.rows[0].status, pr::Status::Current);
        assert_eq!(v.rows[1].status, pr::Status::Revoked);
        // Before the revocation date it still stands.
        let v = pr::view(
            &r,
            Some(&as_crl(&lines, "2026-11-05", "test")),
            "2026-11-05",
        )
        .unwrap();
        assert_eq!(v.rows[1].status, pr::Status::Current);
        assert!(parse_revocations("{\"serial\":\"x\"}").is_err());
        assert!(
            parse_revocations("{\"serial\":\"x\",\"revoked_at\":\"soon\",\"reason\":\"r\"}")
                .is_err()
        );
    }

    #[test]
    fn append_only() {
        let old = reg(&[("a1", "pass")]);
        let mut new = reg(&[("a1", "pass"), ("b2", "pass")]);
        new.issued = "2026-11-15".into();
        let d = diff(&old, &new);
        assert!(d.append_only && d.added == ["b2"]);
        let changed = reg(&[("a1", "fail")]);
        assert!(!diff(&old, &changed).append_only);
        let removed = reg(&[]);
        assert_eq!(diff(&old, &removed).removed, ["a1"]);
        let mut earlier = reg(&[("a1", "pass")]);
        earlier.issued = "2026-10-01".into();
        assert!(!diff(&old, &earlier).append_only);
    }

    #[test]
    fn packs_are_checked_against_their_digest() {
        let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("tests/fixtures/evidence_pack_oracle/packs");
        let manifest = std::fs::read(root.join("static/manifest.json")).unwrap();
        let mut r = reg(&[("static", "pass"), ("whole", "pass"), ("missing", "pass")]);
        r.entries[0].evidence_sha256 = Some(crate::advanced_report::sha256_hex(&manifest));
        r.entries[1].evidence_sha256 = Some("0".repeat(64));
        r.entries[2].evidence_sha256 = Some("0".repeat(64));
        let c = verify(&r, &root, None);
        assert_eq!(c[0].result, "verified", "{c:?}");
        assert_eq!(c[1].result, "digest-mismatch");
        assert_eq!(c[2].result, "no-pack");
    }
}
