// SPDX-License-Identifier: AGPL-3.0-only
//! The product register (`kshana register`, src/product_register.rs): signed registers, signed
//! revocation lists, and the view that joins them at a date.

use kshana::product_register::{
    check_crl, check_register, is_date, sign, view, Crl, Entry, Register, Revocation, Revoked,
    Status, CRL_SCHEMA, REGISTER_SCHEMA,
};
use std::process::Command;
use std::sync::atomic::{AtomicUsize, Ordering};

const PUBLISHER: [u8; 32] = [11u8; 32];
const ISSUER: [u8; 32] = [12u8; 32];
static SEQ: AtomicUsize = AtomicUsize::new(0);

fn entry(id: &str, scored: &str, again: &str) -> Entry {
    Entry {
        id: id.into(),
        product: format!("Receiver {id}"),
        maker: "Example Maker".into(),
        version: "fw 1.2".into(),
        method: "example-method".into(),
        method_version: "1".into(),
        scored: scored.into(),
        revalidate_by: again.into(),
        outcome: "score 0.91".into(),
        evidence_sha256: Some("ab".repeat(32)),
        evidence_url: None,
    }
}

fn register() -> Register {
    let mut r = Register {
        schema: REGISTER_SCHEMA.into(),
        publisher: "Example publisher".into(),
        issued: "2026-11-01".into(),
        entries: vec![
            entry("rx-a", "2026-01-10", "2027-01-10"),
            entry("rx-b", "2025-03-01", "2026-03-01"),
            entry("rx-c", "2026-06-01", "2027-06-01"),
        ],
        signer: String::new(),
        signature: String::new(),
    };
    sign(&mut r, &PUBLISHER);
    r
}

fn crl(next: &str) -> Crl {
    let mut c = Crl {
        schema: CRL_SCHEMA.into(),
        issuer: "Example issuer".into(),
        issued: "2026-11-01".into(),
        next_update: next.into(),
        revoked: vec![
            Revoked {
                id: "rx-c".into(),
                revoked: "2026-10-01".into(),
                reason: "scored firmware withdrawn".into(),
            },
            Revoked {
                id: "not-here".into(),
                revoked: "2026-10-01".into(),
                reason: "another register".into(),
            },
        ],
        signer: String::new(),
        signature: String::new(),
    };
    sign(&mut c, &ISSUER);
    c
}

fn js<T: serde::Serialize>(v: &T) -> String {
    serde_json::to_string_pretty(v).unwrap()
}

fn issuer_key() -> String {
    kshana::evidence::bundle::public_key_hex(&ISSUER)
}

#[test]
fn a_signed_register_checks_and_a_changed_one_does_not() {
    let r = register();
    let back = check_register(&js(&r), None).unwrap();
    assert_eq!(back, r);
    let pk = kshana::evidence::bundle::public_key_hex(&PUBLISHER);
    assert!(check_register(&js(&r), Some(&pk)).is_ok());
    assert!(check_register(&js(&r), Some(&issuer_key())).is_err());
    let mut t = r.clone();
    t.entries[0].revalidate_by = "2030-01-10".into();
    let e = check_register(&js(&t), None).unwrap_err();
    assert!(e.contains("signature"), "{e}");
}

#[test]
fn register_contents_are_checked() {
    let bad = |f: &dyn Fn(&mut Register)| {
        let mut r = register();
        f(&mut r);
        sign(&mut r, &PUBLISHER);
        check_register(&js(&r), None).unwrap_err()
    };
    assert!(bad(&|r| r.entries[1].id = "rx-a".into()).contains("rx-a"));
    assert!(bad(&|r| r.entries[0].id = "has space".into()).contains("has space"));
    assert!(bad(&|r| r.entries[0].scored = "2026-02-30".into()).contains("2026-02-30"));
    assert!(bad(&|r| r.entries[0].revalidate_by = "2025-01-01".into()).contains("rx-a"));
    assert!(bad(&|r| r.entries[0].evidence_sha256 = Some("zz".into())).contains("rx-a"));
    assert!(bad(&|r| r.issued = "1 Nov 2026".into()).contains("1 Nov 2026"));
    let mut r = register();
    r.schema = "kshana.register/2".into();
    assert!(check_register(&js(&r), None).is_err());
    assert!(check_register("{}", None).is_err());
}

#[test]
fn dates_are_calendar_dates() {
    for d in ["2024-02-29", "2026-12-31", "2000-02-29"] {
        assert!(is_date(d), "{d}");
    }
    for d in [
        "2026-02-29",
        "1900-02-29",
        "2026-13-01",
        "2026-00-10",
        "2026-1-01",
        "+026-01-01",
        "",
    ] {
        assert!(!is_date(d), "{d}");
    }
}

#[test]
fn a_revocation_list_is_checked_against_the_issuer_key() {
    let c = crl("2026-12-01");
    assert!(check_crl(&js(&c), &issuer_key()).is_ok());
    // The publisher's key is not the issuer's.
    let pk = kshana::evidence::bundle::public_key_hex(&PUBLISHER);
    assert!(check_crl(&js(&c), &pk).is_err());
    // A list re-signed by someone else with the key fields swapped still fails the pin.
    let mut forged = c.clone();
    forged.revoked.clear();
    sign(&mut forged, &PUBLISHER);
    assert!(check_crl(&js(&forged), &issuer_key()).is_err());
    // An entry removed from a signed list breaks the signature.
    let mut t = c.clone();
    t.revoked.remove(0);
    assert!(check_crl(&js(&t), &issuer_key()).is_err());
    let mut t = crl("2026-10-01");
    t.next_update = "2026-10-01".into();
    sign(&mut t, &ISSUER);
    assert!(
        check_crl(&js(&t), &issuer_key()).is_err(),
        "next update before issue"
    );
}

#[test]
fn the_view_joins_register_and_list_at_a_date() {
    let r = register();
    let c = crl("2026-12-01");
    let v = view(&r, Some(&c), "2026-11-20").unwrap();
    let st: Vec<(String, Status)> = v
        .rows
        .iter()
        .map(|x| (x.entry.id.clone(), x.status))
        .collect();
    assert_eq!(
        st,
        vec![
            ("rx-a".into(), Status::Current),
            ("rx-b".into(), Status::Due),
            ("rx-c".into(), Status::Revoked),
        ]
    );
    assert!(v.rows.iter().all(|x| x.revocation == Revocation::Checked));
    assert_eq!(
        v.rows[2].revoked.as_ref().unwrap().reason,
        "scored firmware withdrawn"
    );
    assert_eq!(v.crl_unmatched, vec!["not-here".to_string()]);
    assert_eq!(v.counts["current"], 1);
    assert_eq!(v.counts["due"], 1);
    assert_eq!(v.counts["revoked"], 1);
}

#[test]
fn a_revocation_takes_effect_from_its_date() {
    let v = view(&register(), Some(&crl("2026-12-01")), "2026-09-30").unwrap();
    assert_eq!(v.rows[2].status, Status::Current);
}

#[test]
fn without_a_list_revocation_is_unknown_and_a_late_list_is_stale() {
    let r = register();
    let v = view(&r, None, "2026-11-20").unwrap();
    assert!(v.rows.iter().all(|x| x.revocation == Revocation::Unknown));
    assert_eq!(v.rows[2].status, Status::Current);
    let v = view(&r, Some(&crl("2026-11-10")), "2026-11-20").unwrap();
    assert!(v.rows.iter().all(|x| x.revocation == Revocation::Stale));
    assert_eq!(
        v.rows[2].status,
        Status::Revoked,
        "a stale list still revokes"
    );
    assert!(view(&r, None, "20 Nov").is_err());
}

#[test]
fn no_text_claims_more_than_a_score() {
    // The register states that a product was scored under a method; nothing more.
    let src = std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/src/product_register.rs"
    ))
    .unwrap();
    let doc = std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/docs/PRODUCT-REGISTER.md"
    ))
    .unwrap();
    for text in [&src, &doc] {
        let lower = text.to_lowercase();
        for word in ["certified", "validated", "compliant", "approved"] {
            assert!(!lower.contains(word), "the register text uses '{word}'");
        }
    }
}

#[test]
fn the_command_line_signs_checks_and_views() {
    let seq = SEQ.fetch_add(1, Ordering::SeqCst);
    let dir = std::env::temp_dir().join(format!("kshana-register-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let key = dir.join("pub.key");
    std::fs::write(&key, hex::encode(PUBLISHER)).unwrap();
    let ikey = dir.join("issuer.key");
    std::fs::write(&ikey, hex::encode(ISSUER)).unwrap();
    #[cfg(unix)]
    for k in [&key, &ikey] {
        use std::os::unix::fs::PermissionsExt;
        std::fs::set_permissions(k, std::fs::Permissions::from_mode(0o600)).unwrap();
    }
    let mut unsigned = register();
    unsigned.signer.clear();
    unsigned.signature.clear();
    std::fs::write(dir.join("reg.json"), js(&unsigned)).unwrap();
    let mut c = crl("2026-12-01");
    c.signer.clear();
    c.signature.clear();
    std::fs::write(dir.join("crl.json"), js(&c)).unwrap();
    let run = |args: &[&str]| {
        Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .current_dir(&dir)
            .output()
            .unwrap()
    };
    let ok = |o: &std::process::Output| {
        assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    };
    ok(&run(&[
        "register",
        "sign",
        "reg.json",
        "--key",
        "pub.key",
        "--out",
        "reg.signed.json",
    ]));
    ok(&run(&[
        "register",
        "sign",
        "crl.json",
        "--key",
        "issuer.key",
        "--out",
        "crl.signed.json",
    ]));
    ok(&run(&["register", "check", "reg.signed.json"]));
    ok(&run(&[
        "register",
        "crl-check",
        "crl.signed.json",
        "--key",
        &issuer_key(),
    ]));
    let o = run(&[
        "register",
        "view",
        "reg.signed.json",
        "--crl",
        "crl.signed.json",
        "--crl-key",
        &issuer_key(),
        "--date",
        "2026-11-20",
        "--json",
    ]);
    ok(&o);
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["rows"][2]["status"], "revoked");
    assert_eq!(v["rows"][1]["status"], "due");
    let o = run(&[
        "register",
        "view",
        "reg.signed.json",
        "--date",
        "2026-11-20",
    ]);
    ok(&o);
    let table = String::from_utf8_lossy(&o.stdout).to_string();
    assert!(
        table.lines().count() == 4 && table.contains("rx-b"),
        "{table}"
    );
    // A list without its key is refused; an unknown option exits 2.
    let o = run(&[
        "register",
        "view",
        "reg.signed.json",
        "--crl",
        "crl.signed.json",
    ]);
    assert_eq!(o.status.code(), Some(2));
    let o = run(&["register", "check", "reg.signed.json", "--bogus"]);
    assert_eq!(o.status.code(), Some(2));
    // The checked-in example signs and views.
    let ex = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/examples/register/register.json"
    );
    let o = run(&[
        "register", "sign", ex, "--key", "pub.key", "--out", "ex.json",
    ]);
    ok(&o);
    ok(&run(&[
        "register",
        "view",
        "ex.json",
        "--date",
        "2026-11-20",
    ]));
    std::fs::remove_dir_all(&dir).ok();
}
