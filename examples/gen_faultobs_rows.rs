// SPDX-License-Identifier: AGPL-3.0-only
//! Generator: emit the frozen fault-observability fixtures consumed by
//! `tests/lunar_faultobs_reference.rs` and the independent numpy/scipy oracle
//! `scripts/gen_faultobs_ref.py`.
//!
//! Builds the real-DE440 per-node measurement network of `lunar_faultobs` — the same
//! representative constellation exercised in that module's tests — and writes
//! `tests/fixtures/faultobs/network.json`: the `n × state_dim` measurement Jacobian
//! `G` (one differential inter-node one-way range row per (pair, elapsed-window)),
//! the per-measurement `σ` (unequal, so `W ≠ I`), the fault vectors for the
//! detectability test, the MDB fault directions, and the peer coalitions for the
//! Byzantine block-spark bound. Every row / vector float is rounded to 6 dp before
//! writing so the oracle reads the identical IEEE-754 doubles.
//!
//! ## Network
//! `M = 8` nodes (five near-side reflectors + three relay nodes in distinct octants),
//! `state_dim = 5·M = 40`, `C(8,2) = 28` pairs × 3 elapsed windows = **84 rows**.
//! The eight-dimensional datum⊕timescale gauge is the entire null space, so
//! `rank(G) = 32` and the parity space is `84 − 32 = 52`-dimensional.
//!
//! ## Real DE440 ingredient
//! Each inter-node line of sight `û_ab` is formed from the **real DE440 Moon PA-frame
//! orientation** at epoch `T0` (via
//! `lunar_orientation::de440_moon_pa_body_to_inertial`), so the physical libration is
//! baked into `G`. The node geometry itself is Modelled (documented, deterministic).
//!
//! Run: `cargo run --example gen_faultobs_rows`

use kshana::lunar_faultobs::{pernode_range_row, NetworkLayout};
use kshana::lunar_gauge::T_BASE_S;
use kshana::lunar_llr_geometry::Vec3;
use kshana::lunar_orientation::de440_moon_pa_body_to_inertial;

/// Round to 6 decimal places for byte-consistency with the numpy/scipy oracle.
fn round6(v: f64) -> f64 {
    (v * 1_000_000.0).round() / 1_000_000.0
}

/// 2024-01-01 TT (JD 2460310.5), inside the DE440 fixture window. Matches `T0`
/// in the `lunar_faultobs` module tests.
const T0: f64 = (2_460_310.5 - 2_451_545.0) / 36_525.0;

/// Distinct clock-integration windows (seconds), matching `PERNODE_ELAPSED_S`.
const ELAPSED_S: [f64; 3] = [21_600.0, 43_200.0, 86_400.0];

/// Unequal per-measurement sigmas (cycled by row index) so `W ≠ I`: this is what
/// makes `cᵀWP⊥c` distinguishable from the wrong double-`P⊥` form, and exercises the
/// weighted parity projector.
const SIGMAS: [f64; 3] = [0.5, 1.0, 2.0];

/// The representative per-node network body-frame positions (PA metres): five near-side
/// reflectors plus three relay nodes. Matches `pernode_body_nodes` in the module tests.
fn body_nodes() -> Vec<Vec3> {
    let mut nodes: Vec<Vec3> = kshana::lunar_llr_geometry::reflectors()
        .iter()
        .map(|r| r.pa_body_m)
        .collect();
    nodes.push([1_600_000.0, 700_000.0, 900_000.0]);
    nodes.push([-1_200_000.0, 1_000_000.0, -800_000.0]);
    nodes.push([300_000.0, -1_500_000.0, 1_100_000.0]);
    nodes
}

fn main() {
    let body = body_nodes();
    let m = body.len();
    let layout = NetworkLayout::new(m);
    let state_dim = layout.state_dim;

    // Real-DE440 Moon-relative inertial node positions at the reference epoch.
    let inertial: Vec<[f64; 3]> = body
        .iter()
        .map(|&b| de440_moon_pa_body_to_inertial(b, T0))
        .collect();

    // ── Measurement Jacobian G and per-measurement sigmas (row order: pair (a<b) then
    //    elapsed window; sigma cycles by global row index → W ≠ I) ────────────────────
    let mut rows: Vec<Vec<f64>> = Vec::new();
    let mut sigmas: Vec<f64> = Vec::new();
    let mut idx = 0usize;
    for a in 0..m {
        for b in (a + 1)..m {
            let d = [
                inertial[a][0] - inertial[b][0],
                inertial[a][1] - inertial[b][1],
                inertial[a][2] - inertial[b][2],
            ];
            let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            let u = [d[0] / n, d[1] / n, d[2] / n];
            for &elapsed in &ELAPSED_S {
                let row = pernode_range_row(&layout, a, b, u, elapsed);
                rows.push(row.into_iter().map(round6).collect());
                sigmas.push(SIGMAS[idx % SIGMAS.len()]);
                idx += 1;
            }
        }
    }
    let n_rows = rows.len();
    assert_eq!(n_rows, 84, "expected C(8,2)*3 = 84 rows, got {n_rows}");

    // ── Fault vectors for the detectability test ─────────────────────────────────────
    // In-range fault: b = G · e_{off(1)} (clock offset of node 1) → b ∈ range(G),
    // so P⊥b ≈ 0 (undetectable). This is column off_idx(1) of G.
    let off1 = layout.off_idx(1);
    let b_in_range: Vec<f64> = rows.iter().map(|r| round6(r[off1])).collect();
    // Generic measurement-space unit faults (not in range(G)) → detectable.
    let mut b_e0 = vec![0.0_f64; n_rows];
    b_e0[0] = 1.0;
    let mut b_e37 = vec![0.0_f64; n_rows];
    b_e37[37] = 1.0;

    // ── MDB fault directions (measurement space) + non-centrality λ₀ ─────────────────
    // λ₀ = 17.075 for P_fa=0.001, P_md=0.20 (Baarda 1968).
    const NCP: f64 = 17.075;
    let c_in_range_norm = {
        let nrm = (b_in_range.iter().map(|&v| v * v).sum::<f64>()).sqrt();
        b_in_range
            .iter()
            .map(|&v| round6(v / nrm))
            .collect::<Vec<f64>>()
    };

    // ── Peer coalitions for the Byzantine block-spark bound ──────────────────────────
    // Measurement indices incident to a node (same pair/window ordering as `rows`).
    let node_incidence = |k: usize| -> Vec<usize> {
        let mut inc = Vec::new();
        let mut i = 0usize;
        for a in 0..m {
            for b in (a + 1)..m {
                for _w in 0..ELAPSED_S.len() {
                    if a == k || b == k {
                        inc.push(i);
                    }
                    i += 1;
                }
            }
        }
        inc
    };
    let node2_inc = node_incidence(2);

    // ── JSON document ────────────────────────────────────────────────────────────────
    let jrow = |r: &Vec<f64>| serde_json::json!(r);
    let doc = serde_json::json!({
        "description": concat!(
            "Fault-observability fixtures for `tests/lunar_faultobs_reference.rs` and the ",
            "independent numpy/scipy oracle `scripts/gen_faultobs_ref.py`. `rows` is the ",
            "n x state_dim measurement Jacobian G of the real-DE440 per-node lunar network ",
            "(each row a differential inter-node one-way range built via ",
            "`lunar_faultobs::pernode_range_row` with a real DE440 Moon PA-frame line of ",
            "sight). Node geometry is Modelled; the DE440 orientation in the line of sight ",
            "is the external ingredient. All row/vector floats are rounded to 6 dp before ",
            "writing for byte-consistency with the oracle. sigma is per-measurement (W != I)."
        ),
        "R_MOON_M": kshana::lunar_time::RE_MOON_M,
        "T_BASE_S": T_BASE_S,
        "epoch_jc": T0,
        "round_decimals": 6,
        "rel_tol": 1e-9,
        "n_nodes": m,
        "state_dim": state_dim,
        "n_rows": n_rows,
        "elapsed_s": ELAPSED_S.to_vec(),
        "nodes_pa_body_m": body.iter().map(|b| serde_json::json!(b.to_vec())).collect::<Vec<_>>(),
        "nodes_inertial_m": inertial
            .iter()
            .map(|p| serde_json::json!(p.iter().map(|&v| round6(v)).collect::<Vec<f64>>()))
            .collect::<Vec<_>>(),
        "sigma": sigmas,
        "rows": rows.iter().map(jrow).collect::<Vec<_>>(),
        "fault_vectors": {
            "in_range_off1": b_in_range,
            "generic_e0": b_e0,
            "generic_e37": b_e37
        },
        "mdb_directions": [
            { "name": "mdb_e0", "c": b_e0, "ncp": NCP, "detectable": true },
            { "name": "mdb_e37", "c": b_e37, "ncp": NCP, "detectable": true },
            { "name": "mdb_in_range", "c": c_in_range_norm, "ncp": NCP, "detectable": false }
        ],
        "peer_coalitions": {
            "single_meas": [[0]],
            "uniform_bias_node2": [node2_inc],
            "six_independent": [[0], [12], [24], [37], [49], [61]]
        }
    });

    let dir = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/faultobs");
    std::fs::create_dir_all(dir).unwrap();
    let path = format!("{dir}/network.json");
    std::fs::write(&path, serde_json::to_string_pretty(&doc).unwrap()).unwrap();
    eprintln!(
        "wrote {path}  (n_rows={n_rows}, state_dim={state_dim}, rank(G)=32, parity_dim=52, W != I)"
    );
}
