// SPDX-License-Identifier: AGPL-3.0-only
//! B8 (0.41) bar V5: the environmental baseline gives the same bytes on every platform and surface. The
//! input is the scored run's site-hours (`tests/fixtures/env_baseline/site_hours.json.gz`), and the expected
//! bytes are what `kshana env-baseline` wrote for that run (`baseline.json.gz`). The Python and WebAssembly
//! surfaces compare with the same file in CI.
//!
//! PIN-SCOPE:    the baseline bytes of the scored B8 run (8 686 site-hours)
//! PIN-EXCLUDES: a deliberate change to EnvBaselineParams::v1 or the output format, which is a new
//!               pre-registration and regenerates the fixture

use flate2::read::GzDecoder;
use std::io::Read;
use std::path::PathBuf;

fn gunzip(name: &str) -> String {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/env_baseline")
        .join(name);
    let mut s = String::new();
    GzDecoder::new(std::fs::File::open(p).unwrap())
        .read_to_string(&mut s)
        .unwrap();
    s
}

#[test]
fn v5_the_scored_run_gives_the_same_bytes() {
    let input = gunzip("site_hours.json.gz");
    let want = gunzip("baseline.json.gz");
    let got = kshana::env_baseline::baseline_json(&input).unwrap();
    assert_eq!(format!("{got}\n"), want);
    assert_eq!(got, kshana::env_baseline::baseline_json(&input).unwrap());
}
