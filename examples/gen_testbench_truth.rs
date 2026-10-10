// SPDX-License-Identifier: AGPL-3.0-only
//! Generator: the true attitude and north-east-down velocity that the test-bench export's
//! attitude and velocity columns come from, for the independent check in
//! `scripts/gen_testbench_ref.py` and `tests/testbench_reference.rs`.
//!
//! The export files carry heading, pitch, roll and an Earth-fixed velocity; they do not carry
//! the quaternion or the north-east-down velocity those were derived from. The oracle needs
//! both to check the derivation, so this writes them for every `STRIDE`-th sample of each
//! `gnss-ins` scenario into `tests/fixtures/testbench/truth.json`. Synthetic scenarios only.
//!
//! Run: `cargo run --release --example gen_testbench_truth`

use kshana::fusion::pack::{truth_trajectory, GnssInsScenario};
use serde_json::json;

/// Every `STRIDE`-th sample is written (always including the first and the last).
const STRIDE: usize = 10;

/// The scenarios the check covers, by file name under `scenarios/`.
const GNSS_INS: [&str; 2] = ["automotive-urban-canyon.toml", "gnss-ins.toml"];

fn main() {
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut scenarios = serde_json::Map::new();
    for name in GNSS_INS {
        let src = std::fs::read_to_string(root.join("scenarios").join(name)).expect("scenario");
        let scn: GnssInsScenario = toml::from_str(&src).expect("gnss-ins scenario");
        let truth = truth_trajectory(&scn);
        let last = truth.len() - 1;
        let rows: Vec<_> = truth
            .iter()
            .enumerate()
            .filter(|(i, _)| i % STRIDE == 0 || *i == last)
            .map(|(i, (t, s))| {
                json!({
                    "i": i,
                    "t_s": t,
                    "q_wxyz": [s.q.w, s.q.x, s.q.y, s.q.z],
                    "v_ned_m_s": s.v_ned,
                })
            })
            .collect();
        scenarios.insert(name.into(), json!({ "samples": truth.len(), "rows": rows }));
    }
    let doc = json!({
        "generated_by": "examples/gen_testbench_truth.rs",
        "stride": STRIDE,
        "note": "true body-to-NED quaternion (w,x,y,z) and NED velocity of every stride-th sample of each gnss-ins scenario; synthetic",
        "scenarios": scenarios,
    });
    let out = root.join("tests/fixtures/testbench/truth.json");
    std::fs::write(&out, serde_json::to_string_pretty(&doc).unwrap() + "\n").expect("write");
    println!("wrote {}", out.display());
}
