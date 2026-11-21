// SPDX-License-Identifier: AGPL-3.0-only
//! Feeder clients (`kshana feed`, src/feeder.rs): privacy-safe defaults, signed bundles that
//! validate as `kshana.obs/1`, receive-only spectrum snapshots and the leaderboard.

use kshana::feeder::{
    self, coarsen, fix_spread_m, leaderboard, pack, pseudonym, spectrum_snapshot, to_grid, verify,
    Bundle, Privacy, SpectrumParams, DEFAULT_GRID_DEG,
};
use kshana::obs::{self, Record, Station};
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicUsize, Ordering};

const SEED_A: [u8; 32] = [7u8; 32];
const SEED_B: [u8; 32] = [9u8; 32];
const CREATED: &str = "2026-11-20T00:00:00.000Z";

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn station() -> Station {
    Station {
        id: "home-of-a-person".into(),
        lat_deg: Some(59.231_234),
        lon_deg: Some(10.770_987),
        height_m: Some(40.0),
        antenna: Some("patch".into()),
        receiver: Some("example".into()),
        firmware: None,
        operator: Some("a named person".into()),
        partner_input: false,
    }
}

fn nmea_records() -> Vec<Record> {
    let bytes =
        std::fs::read(root().join("examples/receiver-trust/illustrative-jamming.nmea")).unwrap();
    obs::from_log("nmea", &bytes, &station()).unwrap()
}

fn nmea_file() -> (String, String) {
    (
        "site/000001.obs.jsonl".into(),
        obs::to_jsonl(&nmea_records()).unwrap(),
    )
}

fn payload_records(b: &Bundle) -> Vec<Record> {
    b.files
        .iter()
        .flat_map(|f| obs::check(&f.content).unwrap().0)
        .collect()
}

static SEQ: AtomicUsize = AtomicUsize::new(0);

#[test]
fn the_input_carries_what_the_public_mode_must_remove() {
    // Guard the fixture: the default test below proves removal only if the input has it.
    let recs = nmea_records();
    assert!(recs
        .iter()
        .any(|r| matches!(r, Record::Epoch(e) if e.epoch.fix.is_some())));
    assert!(recs
        .iter()
        .any(|r| matches!(r, Record::Epoch(e) if e.epoch.marine.is_some())));
}

#[test]
fn the_default_public_mode_is_gdpr_safe_and_validates_as_obs1() {
    let b = pack(
        &[nmea_file()],
        &SEED_A,
        Privacy::Public,
        DEFAULT_GRID_DEG,
        CREATED,
    )
    .unwrap();
    let (_, rep) = verify(&serde_json::to_string(&b).unwrap(), None).unwrap();
    assert_eq!(rep.privacy, Privacy::Public);
    assert!(rep.epochs > 0);
    // Pseudonymous id from the key, never the configured one.
    assert_eq!(b.station, pseudonym(&b.signer));
    assert!(b.station.starts_with("feeder-"));
    // The file name is generic; the local path is not published.
    assert_eq!(b.files[0].name, "part-001.obs.jsonl");
    let text = serde_json::to_string(&b).unwrap();
    for leaked in [
        "home-of-a-person",
        "a named person",
        "site/000001",
        "59.231234",
    ] {
        assert!(!text.contains(leaked), "the bundle leaks {leaked}");
    }
    for r in payload_records(&b) {
        match r {
            Record::Header(h) => {
                assert_eq!(h.station.lat_deg, Some(59.2));
                assert_eq!(h.station.lon_deg, Some(10.8));
                assert_eq!(h.station.height_m, None);
                assert_eq!(h.station.operator, None);
                assert!(!h.observables.iter().any(|o| o == "fix" || o == "marine"));
            }
            Record::Epoch(e) => {
                assert!(e.epoch.fix.is_none(), "a position fix was published");
                assert!(e.epoch.marine.is_none(), "a movement record was published");
                assert!(
                    !e.epoch.cn0.is_empty(),
                    "the observations themselves are kept"
                );
            }
            _ => {}
        }
    }
    for f in [
        "station.id",
        "station.operator",
        "station.height_m",
        "epoch.fix",
        "epoch.marine",
    ] {
        assert!(b.privacy.removed.iter().any(|x| x == f), "{f} not reported");
    }
}

#[test]
fn exact_mode_keeps_everything_and_must_be_asked_for() {
    let b = pack(
        &[nmea_file()],
        &SEED_A,
        Privacy::Exact,
        DEFAULT_GRID_DEG,
        CREATED,
    )
    .unwrap();
    verify(&serde_json::to_string(&b).unwrap(), None).unwrap();
    assert_eq!(b.station, "home-of-a-person");
    assert_eq!(b.files[0].name, "000001.obs.jsonl");
    assert!(payload_records(&b)
        .iter()
        .any(|r| matches!(r, Record::Epoch(e) if e.epoch.fix.is_some())));
    assert!(b.privacy.removed.is_empty());
}

#[test]
fn a_moving_station_publishes_no_position() {
    let mut recs = nmea_records();
    let mut k = 0.0;
    for r in &mut recs {
        if let Record::Epoch(e) = r {
            if let Some(f) = &mut e.epoch.fix {
                f.lat_deg += k; // 0.01 degree per epoch: about 1.1 km
                k += 0.01;
            }
        }
    }
    assert!(fix_spread_m(std::slice::from_ref(&recs)) > feeder::MOVING_SPREAD_M);
    let file = (
        "moving.obs.jsonl".to_string(),
        obs::to_jsonl(&recs).unwrap(),
    );
    let b = pack(&[file], &SEED_A, Privacy::Public, DEFAULT_GRID_DEG, CREATED).unwrap();
    assert!(b.privacy.moving);
    verify(&serde_json::to_string(&b).unwrap(), None).unwrap();
    let Record::Header(h) = &payload_records(&b)[0] else {
        panic!("no header")
    };
    assert_eq!((h.station.lat_deg, h.station.lon_deg), (None, None));
}

#[test]
fn the_grid_rounds_to_the_nearest_cell() {
    assert_eq!(to_grid(59.231_234, 0.1), 59.2);
    assert_eq!(to_grid(-0.06, 0.1), -0.1);
    assert_eq!(to_grid(10.77, 0.5), 11.0);
    let (_, rep) = coarsen(
        vec![nmea_records()],
        Privacy::Public,
        1.0,
        "feeder-000000000000",
    );
    assert_eq!(rep.grid_deg, Some(1.0));
}

#[test]
fn tampering_with_a_bundle_is_caught() {
    let b = pack(
        &[nmea_file()],
        &SEED_A,
        Privacy::Public,
        DEFAULT_GRID_DEG,
        CREATED,
    )
    .unwrap();
    // A changed payload fails its digest.
    let mut t = b.clone();
    t.files[0].content = t.files[0].content.replacen("cn0", "cn0 ", 1);
    assert!(verify(&serde_json::to_string(&t).unwrap(), None).is_err());
    // A changed field fails the signature.
    let mut t = b.clone();
    t.created = "2030-01-01T00:00:00.000Z".into();
    let e = verify(&serde_json::to_string(&t).unwrap(), None).unwrap_err();
    assert!(e.contains("signature"), "{e}");
    // The expected key is enforced.
    let other = kshana::evidence::bundle::public_key_hex(&SEED_B);
    assert!(verify(&serde_json::to_string(&b).unwrap(), Some(&other)).is_err());
    assert!(verify(&serde_json::to_string(&b).unwrap(), Some(&b.signer)).is_ok());
}

#[test]
fn a_bundle_that_claims_public_but_is_not_coarsened_is_rejected() {
    // Packed exact, then relabelled public and signed again by its own key: the signature is
    // good, the claim is not.
    let mut b = pack(
        &[nmea_file()],
        &SEED_A,
        Privacy::Exact,
        DEFAULT_GRID_DEG,
        CREATED,
    )
    .unwrap();
    b.privacy.mode = Privacy::Public;
    b.privacy.grid_deg = Some(DEFAULT_GRID_DEG);
    b.signature = hex::encode(kshana::evidence::bundle::sign_detached(
        &SEED_A,
        &feeder::signing_bytes(&b),
    ));
    let e = verify(&serde_json::to_string(&b).unwrap(), None).unwrap_err();
    assert!(e.contains("station.id"), "{e}");
}

#[test]
fn one_bundle_holds_one_station() {
    let mut other = station();
    other.id = "another".into();
    let bytes =
        std::fs::read(root().join("examples/receiver-trust/illustrative-jamming.nmea")).unwrap();
    let second = obs::to_jsonl(&obs::from_log("nmea", &bytes, &other).unwrap()).unwrap();
    let e = pack(
        &[nmea_file(), ("b.obs.jsonl".into(), second)],
        &SEED_A,
        Privacy::Public,
        DEFAULT_GRID_DEG,
        CREATED,
    )
    .unwrap_err();
    assert!(e.contains("another"), "{e}");
    assert!(pack(&[], &SEED_A, Privacy::Public, 0.1, CREATED).is_err());
    assert!(pack(&[nmea_file()], &SEED_A, Privacy::Public, 0.0, CREATED).is_err());
    assert!(pack(
        &[("bad.obs.jsonl".into(), "{}\n".into())],
        &SEED_A,
        Privacy::Public,
        0.1,
        CREATED
    )
    .is_err());
}

/// A complex tone at `f` hertz, `n` samples, as RTL-SDR offset-binary bytes.
fn cu8_tone(n: usize, fs: f64, f: f64) -> Vec<u8> {
    let mut out = Vec::with_capacity(2 * n);
    for k in 0..n {
        let ph = 2.0 * std::f64::consts::PI * f * k as f64 / fs;
        for v in [ph.cos(), ph.sin()] {
            out.push((127.5 + 100.0 * v).round() as u8);
        }
    }
    out
}

#[test]
fn a_spectrum_snapshot_finds_the_tone_and_validates_as_obs1() {
    let fs = 2.048e6;
    let p = SpectrumParams {
        sample_rate_hz: fs,
        centre_hz: 1_575.42e6,
        nfft: 1024,
        bins: 64,
        time_label: Some("2026-11-20T12:00:00Z".into()),
        ..SpectrumParams::default()
    };
    let bytes = cu8_tone(16_384, fs, fs / 4.0);
    let recs = spectrum_snapshot(&bytes, &p, &station()).unwrap();
    let text = obs::to_jsonl(&recs).unwrap();
    let (_, rep) = obs::check(&text).unwrap();
    assert_eq!(rep.spectra, 1);
    let Record::Spectrum(s) = &recs[1] else {
        panic!("no spectrum record")
    };
    assert_eq!(s.psd_dbfs_hz.len(), 64);
    assert_eq!(s.front_end, "rtl-sdr");
    assert_eq!(s.bin_hz, fs / 64.0);
    // Bins run from -fs/2: +fs/4 is bin 48 of 64.
    let peak = (0..64)
        .max_by(|&a, &b| s.psd_dbfs_hz[a].total_cmp(&s.psd_dbfs_hz[b]))
        .unwrap();
    assert_eq!(peak, 48);
    assert!(s.psd_dbfs_hz[48] - s.psd_dbfs_hz[16] > 30.0);
    // Packed like any other observation file, under the feeder's pseudonym.
    let b = pack(
        &[("spectrum.obs.jsonl".into(), text)],
        &SEED_A,
        Privacy::Public,
        DEFAULT_GRID_DEG,
        CREATED,
    )
    .unwrap();
    let (_, v) = verify(&serde_json::to_string(&b).unwrap(), None).unwrap();
    assert_eq!(v.spectra, 1);
}

#[test]
fn spectrum_inputs_are_checked() {
    let p = SpectrumParams::default();
    let short = cu8_tone(100, 2.048e6, 1e5);
    assert!(spectrum_snapshot(&short, &p, &station()).is_err());
    let long = cu8_tone(4096, 2.048e6, 1e5);
    let bad_fmt = SpectrumParams {
        format: "cf64".into(),
        ..p.clone()
    };
    assert!(spectrum_snapshot(&long, &bad_fmt, &station()).is_err());
    let bad_bins = SpectrumParams {
        bins: 3,
        ..p.clone()
    };
    assert!(spectrum_snapshot(&long, &bad_bins, &station()).is_err());
    let bad_rate = SpectrumParams {
        sample_rate_hz: 0.0,
        ..p
    };
    assert!(spectrum_snapshot(&long, &bad_rate, &station()).is_err());
}

#[test]
fn obs_check_rejects_a_spectrum_with_non_finite_levels() {
    let p = SpectrumParams::default();
    let recs = spectrum_snapshot(&cu8_tone(4096, 2.048e6, 1e5), &p, &station()).unwrap();
    let text = obs::to_jsonl(&recs).unwrap();
    let bad = text.replace("\"bin_hz\":8000.0", "\"bin_hz\":-1.0");
    assert_ne!(bad, text);
    assert!(obs::check(&bad).is_err());
}

#[test]
fn the_leaderboard_counts_verified_distinct_payloads_only() {
    let a = pack(&[nmea_file()], &SEED_A, Privacy::Public, 0.1, CREATED).unwrap();
    let a_again = pack(&[nmea_file()], &SEED_A, Privacy::Public, 0.1, "later").unwrap();
    let b = pack(
        &[("s.obs.jsonl".into(), {
            let p = SpectrumParams::default();
            obs::to_jsonl(
                &spectrum_snapshot(&cu8_tone(4096, 2.048e6, 1e5), &p, &station()).unwrap(),
            )
            .unwrap()
        })],
        &SEED_B,
        Privacy::Public,
        0.1,
        CREATED,
    )
    .unwrap();
    let mut forged = a.clone();
    forged.files[0].epochs += 1000;
    let s = |x: &Bundle| serde_json::to_string(x).unwrap();
    let lb = leaderboard(&[
        ("a".into(), s(&a)),
        ("a-again".into(), s(&a_again)),
        ("b".into(), s(&b)),
        ("forged".into(), s(&forged)),
    ]);
    assert_eq!(lb.schema, feeder::LEADERBOARD_SCHEMA);
    assert_eq!(lb.rows.len(), 2);
    assert_eq!(lb.rows[0].signer, a.signer);
    assert_eq!(lb.rows[0].rank, 1);
    assert_eq!(lb.rows[0].bundles, 2);
    assert_eq!(lb.rows[0].files, 1, "a resubmitted payload counts once");
    assert_eq!(lb.rows[0].epochs, a.files[0].epochs);
    assert_eq!(lb.duplicates, 1);
    assert_eq!(lb.rows[1].spectra, 1);
    assert_eq!(lb.rejected.len(), 1);
    assert_eq!(lb.rejected[0].name, "forged");
}

#[test]
fn a_station_directory_leaves_out_the_file_being_written() {
    let seq = SEQ.fetch_add(1, Ordering::SeqCst);
    let dir = std::env::temp_dir().join(format!("kshana-feed-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let src = dir.join("ubx-1");
    std::fs::create_dir_all(&src).unwrap();
    let (_, text) = nmea_file();
    for n in ["000001", "000002", "000003"] {
        std::fs::write(src.join(format!("{n}.obs.jsonl")), &text).unwrap();
    }
    let got = feeder::collect_inputs(&dir, false).unwrap();
    assert_eq!(got.len(), 2);
    assert!(got.iter().all(|p| !p.ends_with("000003.obs.jsonl")));
    assert_eq!(feeder::collect_inputs(&dir, true).unwrap().len(), 3);
    std::fs::remove_dir_all(&dir).ok();
}

fn kshana(args: &[&str], dir: &Path) -> std::process::Output {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .current_dir(dir)
        .output()
        .unwrap()
}

#[test]
fn the_command_line_packs_verifies_and_ranks() {
    let seq = SEQ.fetch_add(1, Ordering::SeqCst);
    let dir = std::env::temp_dir().join(format!("kshana-feed-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let key = dir.join("feeder.key");
    std::fs::write(&key, hex::encode(SEED_A)).unwrap();
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        std::fs::set_permissions(&key, std::fs::Permissions::from_mode(0o600)).unwrap();
    }
    let (_, text) = nmea_file();
    std::fs::write(dir.join("a.obs.jsonl"), text).unwrap();
    let out = kshana(
        &[
            "feed",
            "pack",
            "a.obs.jsonl",
            "--key",
            "feeder.key",
            "--created",
            CREATED,
            "--out",
            "b.json",
        ],
        &dir,
    );
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let out = kshana(&["feed", "verify", "b.json", "--json"], &dir);
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["privacy"], "public");
    let out = kshana(&["feed", "leaderboard", "b.json", "--json"], &dir);
    assert!(out.status.success());
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["rows"][0]["rank"], 1);
    // The spectrum command writes a valid observation file.
    std::fs::write(dir.join("cap.cu8"), cu8_tone(8192, 2.048e6, 2e5)).unwrap();
    std::fs::write(
        dir.join("station.toml"),
        "id = \"sdr-1\"\nlat_deg = 59.43\nlon_deg = 24.75\n",
    )
    .unwrap();
    let out = kshana(
        &[
            "feed",
            "spectrum",
            "cap.cu8",
            "--format",
            "cu8",
            "--rate",
            "2048000",
            "--centre",
            "1575420000",
            "--station",
            "station.toml",
            "--out",
            "s.obs.jsonl",
        ],
        &dir,
    );
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let s = std::fs::read_to_string(dir.join("s.obs.jsonl")).unwrap();
    assert_eq!(obs::check(&s).unwrap().1.spectra, 1);
    // Usage errors exit 2 and name the command.
    let out = kshana(&["feed", "pack", "a.obs.jsonl", "--bogus"], &dir);
    assert_eq!(out.status.code(), Some(2));
    let out = kshana(&["feed"], &dir);
    assert!(String::from_utf8_lossy(&out.stderr).contains("kshana feed"));
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn the_json_schema_states_the_spectrum_record() {
    let schema: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root().join("docs/spec/obs-1.schema.json")).unwrap(),
    )
    .unwrap();
    let def = &schema["$defs"]["spectrum"];
    let p = SpectrumParams {
        time_label: Some("t".into()),
        ..SpectrumParams::default()
    };
    let recs = spectrum_snapshot(&cu8_tone(4096, 2.048e6, 1e5), &p, &station()).unwrap();
    let line: serde_json::Value = serde_json::to_value(&recs[1]).unwrap();
    for k in line.as_object().unwrap().keys() {
        assert!(
            def["properties"].get(k).is_some(),
            "schema lacks spectrum.{k}"
        );
    }
    for k in def["required"].as_array().unwrap() {
        assert!(line.get(k.as_str().unwrap()).is_some(), "record lacks {k}");
    }
}
