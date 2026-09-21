// SPDX-License-Identifier: AGPL-3.0-only
//! Generator: emit the frozen coupled-gauge row fixtures consumed by
//! `tests/lunar_coupled_gauge_reference.rs` and the numpy oracle
//! `scripts/gen_coupled_gauge_ref.py`.
//!
//! Builds two networks via the REAL row builders (real DE440 Moon PA orientation path
//! through `lunar_datum::orbiter_range_row_datum7`) and writes
//! `tests/fixtures/coupled_gauge/network.json` with every row entry rounded to 6 dp.
//!
//! ## Networks
//! - **`well_posed`**: 5 beacons × 6 orbiters × 4 epochs = 120 one-way rows; elapsed_s
//!   varies — full-rank Fisher (defect 0).
//! - **`single_epoch`**: same beacons × same orbiters × 1 epoch with `elapsed_s = 0.0`
//!   → rate column (idx 8) is EXACTLY zero → an exact rate defect (defect 1,
//!   `dim_temporal = 1`).
//!
//! Run: `cargo run --example gen_coupled_gauge_rows`

use kshana::lunar_datum::orbiter_position;
use kshana::lunar_gauge::{oneway_range_row, T_BASE_S};

/// Round to 6 decimal places for byte-consistency with the numpy oracle.
///
/// The JSON is written with serde_json (ryu shortest-form floats).  After rounding, the
/// value has ≤6 significant decimals, so ryu emits at most 6 dp for most values.  Both
/// serde_json (on write) and Python's `json.load` (on read) parse the decimal string to
/// the same IEEE-754 double — that shared double is the ONLY thing that matters.
fn round6(v: f64) -> f64 {
    (v * 1_000_000.0).round() / 1_000_000.0
}

fn round_row(row: [f64; 9]) -> [f64; 9] {
    row.map(round6)
}

/// Five near-side beacon PA-body positions (metres), from the plan's validated recipe.
const BEACONS: [[f64; 3]; 5] = [
    [1.5e6, 0.3e6, 0.2e6],
    [1.4e6, -0.4e6, 0.3e6],
    [1.55e6, 0.2e6, -0.35e6],
    [1.35e6, -0.25e6, -0.3e6],
    [1.6e6, 0.05e6, 0.1e6],
];

/// 2024-01-01 TT (JD 2460310.5), inside the DE440 fixture window.
const T_TASK4: f64 = (2_460_310.5 - 2_451_545.0) / 36_525.0;

fn main() {
    let epochs: [f64; 4] = std::array::from_fn(|k| T_TASK4 + (k as f64) * 2.0 / 36_525.0);

    // ── well_posed: 5 beacons × 6 orbiters × 4 epochs = 120 one-way rows ───────
    // Recipe matches `well_posed_oneway_rows(0.0)` in the lunar_gauge tests.
    // elapsed_s = 3600 × (ki+1) × (j+1) gives IDX_RATE = elapsed/T_BASE ∈ [0.042, 1.0].
    let mut well_posed: Vec<serde_json::Value> = Vec::with_capacity(120);
    for &beacon in &BEACONS {
        for (ki, &t) in epochs.iter().enumerate() {
            for j in 0..6_usize {
                let r_sat = orbiter_position(
                    2000.0,
                    20.0 + 10.0 * j as f64,
                    60.0 * j as f64,
                    40.0 * j as f64,
                    epochs[0],
                    t,
                );
                let elapsed = 3_600.0 * (ki as f64 + 1.0) * (j as f64 + 1.0);
                let row = round_row(oneway_range_row(r_sat, beacon, t, elapsed));
                well_posed.push(serde_json::json!(row.to_vec()));
            }
        }
    }
    assert_eq!(
        well_posed.len(),
        120,
        "well_posed must have exactly 120 rows"
    );

    // ── single_epoch: same beacons × same orbiters, one epoch, elapsed_s = 0 ─────
    // elapsed_s = 0 → IDX_RATE = 0/T_BASE_S = 0 EXACTLY for every row.
    // Column 8 of the design matrix is all-zero → exact rate-direction null defect = 1.
    let t0 = epochs[0];
    let mut single_epoch: Vec<serde_json::Value> = Vec::with_capacity(30);
    for &beacon in &BEACONS {
        for j in 0..6_usize {
            let r_sat = orbiter_position(
                2000.0,
                20.0 + 10.0 * j as f64,
                60.0 * j as f64,
                40.0 * j as f64,
                t0,
                t0,
            );
            let row = round_row(oneway_range_row(r_sat, beacon, t0, 0.0));
            // Verify the rate column is exactly 0 (elapsed_s=0 → elapsed/T_BASE_S = 0).
            assert_eq!(
                row[8], 0.0,
                "single_epoch IDX_RATE must be 0.0; got {}",
                row[8]
            );
            single_epoch.push(serde_json::json!(row.to_vec()));
        }
    }
    assert_eq!(
        single_epoch.len(),
        30,
        "single_epoch must have exactly 30 rows"
    );

    // ── write network.json ────────────────────────────────────────────────────────
    let doc = serde_json::json!({
        "description": concat!(
            "Coupled-gauge row fixtures for `tests/lunar_coupled_gauge_reference.rs` ",
            "and `scripts/gen_coupled_gauge_ref.py`. ",
            "Spatial columns 0..7 carry REAL DE440 Moon PA orientation (via ",
            "`lunar_datum::orbiter_range_row_datum7`). ",
            "Geometry (beacon positions, orbital elements) is Modelled. ",
            "All row floats rounded to 6 dp before writing for byte-consistency with ",
            "the numpy oracle."
        ),
        "R_MOON_M": kshana::lunar_time::RE_MOON_M,
        "T_BASE_S": T_BASE_S,
        "sigma": 1.0_f64,
        "round_decimals": 6,
        "beacons_pa_body_m": BEACONS.iter().map(|b| serde_json::json!(b.to_vec())).collect::<Vec<_>>(),
        "epochs_jc": epochs.iter().map(|&e| serde_json::json!(e)).collect::<Vec<_>>(),
        "networks": {
            "well_posed": {
                "description": "5 beacons × 6 orbiters × 4 epochs = 120 one-way rows; full-rank (defect 0)",
                "n_rows": 120,
                "rows": well_posed
            },
            "single_epoch": {
                "description": "5 beacons × 6 orbiters × 1 epoch (elapsed_s=0); exact rate defect (defect=1, dim_temporal=1)",
                "n_rows": 30,
                "rows": single_epoch
            }
        }
    });

    let dir = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/coupled_gauge");
    std::fs::create_dir_all(dir).unwrap();
    let path = format!("{dir}/network.json");
    std::fs::write(&path, serde_json::to_string_pretty(&doc).unwrap()).unwrap();
    eprintln!("wrote {path}  (well_posed=120 rows, single_epoch=30 rows, T_BASE_S={T_BASE_S})");
}
