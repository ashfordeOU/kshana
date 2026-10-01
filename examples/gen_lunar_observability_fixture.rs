// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the committed inputs of `tests/lunar_observability_numpy_oracle.rs`: for each named
//! lunar joint-solve configuration, the measurement Jacobian `H` and weights `W` that
//! `kshana::lunar_combination::lunar_observability` analyses. The NumPy/SciPy oracle
//! (`tests/fixtures/lunar_observability_numpy_oracle/gen_reference.py`) reads this file.
//!
//! Run: `cargo run --example gen_lunar_observability_fixture > tests/fixtures/lunar_observability_numpy_oracle/inputs.json`
//! (prints Kshana's own rank, defect and condition number per case on stderr).

use kshana::lunar_combination::{lunar_observability, observability_inputs, LunarNetworkConfig};

/// The configurations the row's claim is made on (the cases its unit tests use).
pub fn cases() -> Vec<(&'static str, LunarNetworkConfig)> {
    let d = LunarNetworkConfig::default();
    let elfo = |n_sat: usize, n_earth: usize, planes: usize| LunarNetworkConfig {
        n_sat,
        n_earth,
        orbit_radius_km: 9750.7,
        orbit_ecc: 0.6383,
        orbit_inc_deg: 57.7,
        orbit_argp_deg: 90.0,
        orbit_planes: planes,
        ..d
    };
    let c = |n_sat: usize, n_earth: usize, with_vlbi: bool| LunarNetworkConfig {
        n_sat,
        n_earth,
        with_vlbi,
        ..d
    };
    vec![
        ("default_without_vlbi", c(3, 6, false)),
        ("default_with_vlbi", c(3, 6, true)),
        ("default_two_stations", c(3, 2, true)),
        ("default_three_stations", c(3, 3, true)),
        ("default_four_stations", c(3, 4, true)),
        ("default_five_stations", c(3, 5, true)),
        ("ladder_six_sats_one_station", c(6, 1, true)),
        ("ladder_six_sats_two_stations", c(6, 2, true)),
        ("ladder_six_sats_three_stations", c(6, 3, true)),
        ("eight_sats_three_stations", c(8, 3, true)),
        ("rich_without_vlbi", c(6, 6, false)),
        ("rich_with_vlbi", c(6, 6, true)),
        ("elfo_one_station", elfo(6, 1, 3)),
        ("elfo_two_stations", elfo(6, 2, 3)),
        ("elfo_three_stations", elfo(6, 3, 3)),
        (
            "elfo_sparse_without_vlbi",
            LunarNetworkConfig {
                with_vlbi: false,
                ..elfo(3, 6, 1)
            },
        ),
        ("elfo_sparse_with_vlbi", elfo(3, 6, 1)),
    ]
}

fn main() {
    let mut out = Vec::new();
    for (name, cfg) in cases() {
        let inp = observability_inputs(&cfg);
        let o = lunar_observability(&cfg);
        let info = kshana::fim::information_matrix(&inp.jacobian, &inp.weights);
        let ev = kshana::fim::sym_eig(&info).values;
        let lmax = ev.iter().cloned().fold(0.0_f64, f64::max);
        let thr = 1e-9 * lmax;
        let below = ev
            .iter()
            .filter(|&&l| l <= thr)
            .fold(0.0_f64, |m, &l| m.max(l.abs()));
        let above = ev
            .iter()
            .filter(|&&l| l > thr)
            .fold(f64::INFINITY, |m, &l| m.min(l));
        eprintln!(
            "  {name}: largest |eig| at or below threshold / lmax = {:.3e}; smallest above / lmax = {:.3e}",
            below / lmax,
            above / lmax
        );
        eprintln!(
            "{name}: n={} m={} rank={} defect={} cond={:.3e} e_opt={:.3e} station_axes_null={:.3e} crlb={:?}",
            o.n_params,
            inp.jacobian.len(),
            o.rank,
            o.defect,
            o.condition,
            o.e_opt,
            o.station_pos_unobservable_axes,
            o.station_pos_crlb_m
        );
        out.push(serde_json::json!({
            "name": name,
            "config": {
                "n_sat": cfg.n_sat,
                "n_earth": cfg.n_earth,
                "with_vlbi": cfg.with_vlbi,
                "orbit_radius_km": cfg.orbit_radius_km,
                "orbit_ecc": cfg.orbit_ecc,
                "orbit_planes": cfg.orbit_planes,
            },
            "param_scale_m": inp.param_scale_m,
            "weights": inp.weights,
            "jacobian": inp.jacobian,
        }));
    }
    let doc = serde_json::json!({
        "generator": "examples/gen_lunar_observability_fixture.rs",
        "rel_tol": 1e-9,
        "cases": out,
    });
    println!("{}", serde_json::to_string(&doc).expect("serialise"));
}
