//! The short in-memory scene -> acquire -> track run behind the WebAssembly `iq_run_short`.
//! Native and wasm32 call the same function, so these pin its answers; a wasm32 build in CI
//! proves it compiles there, and the browser smoke test compares the same request's JSON.

use kshana::iq::short::{run_short, signals_json, ShortRequest, MAX_SATELLITES};

fn req() -> ShortRequest {
    ShortRequest {
        fs_hz: 2.046e6,
        duration_s: 0.1,
        signal: "gps-l1ca".into(),
        ids: vec![3, 11],
        dopplers: vec![1200.0, -800.0],
        cn0_dbhz: Some(45.0),
        seed: 7,
    }
}

#[test]
fn acquires_and_tracks_the_scene_it_built() {
    let v = run_short(&req()).unwrap();
    let acq = v["acquisition"].as_array().unwrap();
    assert_eq!(acq.len(), 2);
    for (a, want) in acq.iter().zip([1200.0, -800.0]) {
        assert_eq!(a["acquired"], true, "{a}");
        let d = a["doppler_hz"].as_f64().unwrap();
        assert!((d - want).abs() < 500.0, "doppler {d} vs {want}");
    }
    let tr = v["tracking"].as_array().unwrap();
    assert_eq!(tr.len(), 2);
    assert!(tr.iter().all(|t| t["epochs"].as_u64().unwrap() > 10));
}

#[test]
fn the_same_request_gives_byte_identical_json() {
    assert_eq!(
        run_short(&req()).unwrap().to_string(),
        run_short(&req()).unwrap().to_string()
    );
}

#[test]
fn sizes_are_capped() {
    let mut r = req();
    r.duration_s = 1.0;
    assert!(run_short(&r).is_err());
    let mut r = req();
    r.fs_hz = 1.0e8;
    assert!(run_short(&r).is_err());
    let mut r = req();
    r.ids = (1..=(MAX_SATELLITES as i64 + 1)).collect();
    assert!(run_short(&r).is_err());
    let mut r = req();
    r.signal = "nope".into();
    assert!(run_short(&r).is_err());
}

#[test]
fn lists_the_signals() {
    assert!(signals_json()
        .as_array()
        .unwrap()
        .iter()
        .any(|s| s == "gps-l1ca"));
}

/// The one request the native test and `web/smoke.mjs` (through the wasm build) both run;
/// both must give exactly this JSON. `KSHANA_BLESS=1` rewrites it.
#[test]
fn matches_the_golden_the_wasm_smoke_test_also_checks() {
    let path = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/iq_short_golden.json"
    );
    let got = run_short(&req()).unwrap().to_string();
    if std::env::var_os("KSHANA_BLESS").is_some() {
        std::fs::write(path, format!("{got}\n")).unwrap();
    }
    let want = std::fs::read_to_string(path).expect("golden present");
    assert_eq!(got, want.trim_end());
}
