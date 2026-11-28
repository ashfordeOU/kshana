// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana transform-receipt`: frame and time transform receipts and their open verifier
//! (src/transform_receipt.rs, docs/TRANSFORM-RECEIPTS.md). The time offsets are checked against
//! values worked out by hand from the leap-second table (TAI − UTC = 37 s since 2017-01-01)
//! and the fixed offsets; the frame step against the engine's SOFA-checked CIO chain.

use ed25519_dalek::{Signer, SigningKey};
use kshana::transform_receipt as tr;
use serde_json::{json, Value};
use std::path::PathBuf;
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn request(name: &str) -> tr::Request {
    serde_json::from_str(
        &std::fs::read_to_string(root().join("examples/transform-receipt").join(name)).unwrap(),
    )
    .unwrap()
}

const EOP: &str = "tests/fixtures/agency/eop/finals2000A_20260930.txt";

fn eop_bytes() -> Vec<u8> {
    std::fs::read(root().join(EOP)).unwrap()
}

fn offset(r: &Value, from: &str, to: &str) -> f64 {
    r["chain"]
        .as_array()
        .unwrap()
        .iter()
        .find(|s| s["from"] == from && s["to"] == to)
        .unwrap()["offset_s"]
        .as_f64()
        .unwrap()
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-transform-receipt-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

#[test]
fn the_time_chain_has_the_offsets_worked_out_by_hand() {
    let r = tr::make(&request("station-itrf-to-gcrs.json"), None).unwrap();
    assert_eq!(offset(&r, "UTC", "TAI"), 37.0);
    assert_eq!(offset(&r, "TAI", "UTC"), -37.0);
    assert_eq!(offset(&r, "TAI", "TT"), 32.184);
    assert_eq!(offset(&r, "TAI", "GPST"), -19.0);
    assert_eq!(offset(&r, "TAI", "BDT"), -33.0);
    let tdb = offset(&r, "TT", "TDB");
    assert!(tdb.abs() < 1.7e-3, "{tdb}");
    let e = &r["output"]["epochs"];
    assert_eq!(e["UTC"]["iso"], "2026-09-01T12:00:00.000000000");
    assert_eq!(e["TAI"]["iso"], "2026-09-01T12:00:37.000000000");
    assert_eq!(e["TT"]["iso"], "2026-09-01T12:01:09.184000000");
    assert_eq!(e["GPST"]["iso"], "2026-09-01T12:00:18.000000000");
    assert_eq!(e["BDT"]["iso"], "2026-09-01T12:00:04.000000000");
    assert_eq!(
        e["UT1"]["iso"], "2026-09-01T12:00:00.000000000",
        "no EOP: UT1 = UTC"
    );
    assert_eq!(r["label"], "MODELLED");
    assert!(r["warnings"][0]
        .as_str()
        .unwrap()
        .contains("no Earth-orientation values"));
}

#[test]
fn a_leap_second_epoch_is_carried_through() {
    let r = tr::make(&request("leap-second-epoch.json"), None).unwrap();
    let e = &r["output"]["epochs"];
    // 2016-12-31T23:59:60.5 UTC: TAI − UTC was 36 s that day, so TAI is 2017-01-01T00:00:36.5
    assert_eq!(e["UTC"]["iso"], "2016-12-31T23:59:60.500000000");
    assert_eq!(e["TAI"]["iso"], "2017-01-01T00:00:36.500000000");
    assert_eq!(offset(&r, "UTC", "TAI"), 36.0);
    assert!(r["output"].get("position_m").is_none());
}

#[test]
fn a_gpst_input_reaches_the_same_instant_as_its_utc() {
    // 12:00:18 GPST is 12:00:00 UTC in September 2026 (GPST − UTC = 18 s)
    let r = tr::make(&request("gpst-epoch-with-eop.json"), None).unwrap();
    assert_eq!(
        r["output"]["epochs"]["UTC"]["iso"],
        "2026-09-01T12:00:00.000000000"
    );
    assert_eq!(offset(&r, "GPST", "TAI"), 19.0);
    assert_eq!(
        r["output"]["epochs"]["UT1"]["iso"],
        "2026-09-01T12:00:00.012300000"
    );
    assert_eq!(r["output"]["frame"], "ITRS");
}

#[test]
fn the_frame_step_is_the_cio_chain_and_round_trips() {
    let req = request("station-itrf-to-gcrs.json");
    let r = tr::make(&req, Some((EOP, &eop_bytes()))).unwrap();
    assert!(r["eop"]["sha256"].as_str().unwrap().len() == 64);
    assert!(r["warnings"].as_array().unwrap().is_empty());
    let out: [f64; 3] = serde_json::from_value(r["output"]["position_m"].clone()).unwrap();
    let p = req.position_m.unwrap();
    let norm = |v: [f64; 3]| (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    assert!(
        (norm(out) - norm(p)).abs() < 1e-6,
        "a rotation keeps the length"
    );
    // the same instant through the engine's single-f64 CIO functions agrees to the f64 floor
    let tt = r["output"]["epochs"]["TT"]["jd"].clone();
    let ut1 = r["output"]["epochs"]["UT1"]["jd"].clone();
    let total = |v: &Value| v["jd_day"].as_f64().unwrap() + v["jd_frac"].as_f64().unwrap();
    let xp = kshana::frames::arcsec(r["eop"]["xp_arcsec"].as_f64().unwrap());
    let yp = kshana::frames::arcsec(r["eop"]["yp_arcsec"].as_f64().unwrap());
    let direct = kshana::cio::itrs_to_gcrs(p, total(&tt), total(&ut1), xp, yp);
    for k in 0..3 {
        assert!(
            (direct[k] - out[k]).abs() < 0.05,
            "{k}: {} vs {}",
            direct[k],
            out[k]
        );
    }
    // and back
    let back = tr::make(
        &tr::Request {
            format: tr::REQUEST_FORMAT.into(),
            epoch: req.epoch.clone(),
            frame: Some("GCRS".into()),
            position_m: Some(out),
            eop: serde_json::from_value(r["eop"].clone()).unwrap(),
        },
        None,
    )
    .unwrap();
    let b: [f64; 3] = serde_json::from_value(back["output"]["position_m"].clone()).unwrap();
    for k in 0..3 {
        assert!((b[k] - p[k]).abs() < 1e-6);
    }
    // the EOP values are the file's, at MJD 61284.5: UT1 − UTC is a few tens of ms
    let dut1 = r["eop"]["ut1_minus_utc_s"].as_f64().unwrap();
    assert!(dut1.abs() < 0.9 && dut1 != 0.0);
}

#[test]
fn verification_passes_and_catches_each_kind_of_change() {
    let r = tr::make(
        &request("station-itrf-to-gcrs.json"),
        Some((EOP, &eop_bytes())),
    )
    .unwrap();
    let rep = tr::verify(&r, Some((EOP, &eop_bytes())), &[]);
    assert!(rep.valid, "{:?}", rep.checks);
    let names: Vec<&str> = rep.checks.iter().map(|c| c.check.as_str()).collect();
    assert_eq!(
        names,
        [
            "format",
            "hash",
            "models",
            "time",
            "position",
            "eop-file",
            "eop-values"
        ]
    );

    let failed = |v: &Value| -> Vec<String> {
        tr::verify(v, None, &[])
            .checks
            .into_iter()
            .filter(|c| !c.ok)
            .map(|c| c.check)
            .collect()
    };
    let rehash = |mut v: Value| {
        let h = hex::encode(<sha2::Sha256 as sha2::Digest>::digest(tr::canonical_bytes(
            &v,
        )));
        v["hash"]["value"] = json!(h);
        v
    };

    // an edited output with the old hash: the hash fails, and the recomputation too
    let mut v = r.clone();
    v["output"]["position_m"][0] = json!(v["output"]["position_m"][0].as_f64().unwrap() + 1.0);
    assert_eq!(failed(&v), ["hash", "position"]);
    // re-hashed: the recomputation still catches it
    assert_eq!(failed(&rehash(v)), ["position"]);
    // a different UT1 − UTC recorded and re-hashed: the outputs no longer follow from it
    let mut v = r.clone();
    v["eop"]["ut1_minus_utc_s"] = json!(0.5);
    assert_eq!(failed(&rehash(v.clone())), ["time", "position"]);
    // and checked against the file, the recorded values differ from it
    let rep = tr::verify(&rehash(v), Some((EOP, &eop_bytes())), &[]);
    assert!(rep.checks.iter().any(|c| c.check == "eop-values" && !c.ok));
    // a different model identifier
    let mut v = r.clone();
    v["chain"][0]["model"] = json!("another table");
    assert_eq!(failed(&rehash(v)), ["models"]);
    // a wrong EOP file
    let rep = tr::verify(&r, Some(("other", b"not finals")), &[]);
    assert!(rep.checks.iter().any(|c| c.check == "eop-file" && !c.ok));
}

#[test]
fn a_signature_over_the_canonical_bytes_is_verified() {
    let r = tr::make(&request("leap-second-epoch.json"), None).unwrap();
    let key = SigningKey::from_bytes(&[7u8; 32]);
    let pk = key.verifying_key().to_bytes();
    let sig = key.sign(&tr::canonical_bytes(&r));
    let mut signed = r.clone();
    signed["signature"] = json!({
        "alg": "ed25519",
        "public_key": hex::encode(pk),
        "value": hex::encode(sig.to_bytes()),
    });
    // the signature is not part of the hashed bytes
    assert_eq!(tr::canonical_bytes(&signed), tr::canonical_bytes(&r));
    assert!(tr::verify(&signed, None, &[pk]).valid);
    let other = SigningKey::from_bytes(&[8u8; 32])
        .verifying_key()
        .to_bytes();
    let rep = tr::verify(&signed, None, &[other]);
    assert!(!rep.valid);
    assert!(rep.checks.iter().any(|c| c.check == "signer" && !c.ok));
    let mut bad = signed.clone();
    bad["signature"]["value"] = json!(hex::encode([0u8; 64]));
    assert!(!tr::verify(&bad, None, &[]).valid);
    // trusted keys but no signature
    assert!(!tr::verify(&r, None, &[pk]).valid);
}

#[test]
fn bad_requests_are_refused() {
    let mut q = request("leap-second-epoch.json");
    q.epoch.scale = "LST".into();
    assert!(tr::make(&q, None).is_err());
    let mut q = request("leap-second-epoch.json");
    q.epoch.time = "2017-01-01T23:59:60.5".into(); // not a leap-second day
    assert!(tr::make(&q, None).is_err());
    let mut q = request("station-itrf-to-gcrs.json");
    q.frame = Some("ICRF".into());
    assert!(tr::make(&q, None).is_err());
    let mut q = request("station-itrf-to-gcrs.json");
    q.position_m = None;
    assert!(tr::make(&q, None).is_err());
    let mut q = request("leap-second-epoch.json");
    q.epoch.scale = "TAI".into();
    q.epoch.time = "2026-02-30T00:00:00".into();
    assert!(tr::make(&q, None).is_err());
}

#[test]
fn the_cli_makes_and_verifies() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let dir = unique_dir("cli");
    let out = dir.join("r.json");
    let st = Command::new(bin)
        .args(["transform-receipt", "make"])
        .arg(root().join("examples/transform-receipt/station-itrf-to-gcrs.json"))
        .arg("--eop")
        .arg(root().join(EOP))
        .arg("--out")
        .arg(&out)
        .status()
        .unwrap();
    assert!(st.success());
    let v = Command::new(bin)
        .args(["transform-receipt", "verify"])
        .arg(&out)
        .arg("--eop")
        .arg(root().join(EOP))
        .output()
        .unwrap();
    assert!(v.status.success(), "{}", String::from_utf8_lossy(&v.stdout));
    let mut r: Value = serde_json::from_str(&std::fs::read_to_string(&out).unwrap()).unwrap();
    r["output"]["epochs"]["TT"]["iso"] = json!("x");
    std::fs::write(&out, r.to_string()).unwrap();
    let v = Command::new(bin)
        .args(["transform-receipt", "verify"])
        .arg(&out)
        .output()
        .unwrap();
    assert!(!v.status.success());
    let rep: Value = serde_json::from_slice(&v.stdout).unwrap();
    assert_eq!(rep["valid"], false);
    let k = Command::new(bin)
        .args(["transform-receipt", "verify"])
        .arg(&out)
        .args(["--trusted-key", "zz"])
        .output()
        .unwrap();
    assert!(!k.status.success());
    let _ = std::fs::remove_dir_all(&dir);
}
