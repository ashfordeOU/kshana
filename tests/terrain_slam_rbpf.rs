// SPDX-License-Identifier: AGPL-3.0-only
//! Joint map estimation (terrain SLAM, RBPF) against known-map SITAN on an erroneous map
//! (WP-10, RM-18). Settings, bars and prediction pre-registered in
//! `xval/terrain-slam-rbpf/PREREGISTRATION.md` before the filter was written or run; the
//! outcome is in `RESULTS.md` there. MODELLED: filter against filter on injected truth, no
//! external oracle.

use kshana::altpnt::maps::{correlated_error_field, GeoGrid};
use kshana::altpnt::sequential::{run_sequential_trn_on_map, MapSlamCfg, SequentialTrnCfg};

fn cfg() -> SequentialTrnCfg {
    toml::from_str(include_str!("../scenarios/terrain-slam.toml")).expect("scenario parses")
}

/// The pre-registered SLAM design constants.
fn slam() -> MapSlamCfg {
    MapSlamCfg {
        lat0_deg: 12.0,
        lon0_deg: 20.0,
        cell_deg: 0.02,
        n_lat: 25,
        n_lon: 25,
        prior_sigma_m: 15.0,
        residual_sigma_m: (8.0_f64 * 8.0 + 7.5 * 7.5).sqrt(),
    }
}

fn map_error(seed: u64) -> GeoGrid {
    correlated_error_field(12.0, 12.5, 20.0, 20.5, 0.005, 15.0, 0.03, seed).expect("error field")
}

/// (baseline RMS, SLAM RMS) per seed 1..=20, with or without the map error.
fn runs(with_error: bool) -> Vec<(f64, f64)> {
    let c = cfg();
    let s = slam();
    (1..=20u64)
        .map(|k| {
            let err = with_error.then(|| map_error(k));
            let seed = c.seed + k;
            let base = run_sequential_trn_on_map(&c, err.as_ref(), seed, None).matched_rms_m;
            let joint = run_sequential_trn_on_map(&c, err.as_ref(), seed, Some(&s)).matched_rms_m;
            (base, joint)
        })
        .collect()
}

fn mean(v: impl Iterator<Item = f64>) -> f64 {
    let x: Vec<f64> = v.collect();
    x.iter().sum::<f64>() / x.len() as f64
}

#[test]
fn slam_against_known_map_sitan_records_the_preregistered_outcome() {
    let r = runs(true);
    for (k, (b, j)) in r.iter().enumerate() {
        println!("seed {:2}: baseline {b:8.1} m  slam {j:8.1} m", k + 1);
    }
    let (mb, mj) = (mean(r.iter().map(|x| x.0)), mean(r.iter().map(|x| x.1)));
    let wins = r.iter().filter(|(b, j)| j < b).count();
    println!(
        "S1 mean baseline {mb:.1} m, mean slam {mj:.1} m, ratio {:.3}",
        mj / mb
    );
    println!("S2 slam better in {wins} of 20");
    // Recorded outcome (RESULTS.md): S1 NOT MET, mean 1236.6 m against 1255.4 m (ratio
    // 0.985, bar <= 0.9); S2 NOT MET, better in 10 of 20 (bar >= 12). Both misses are
    // asserted, so a change that flips either fails here and must be recorded.
    assert!(
        mj > 0.9 * mb,
        "S1 was recorded NOT MET (ratio 0.985); now {:.3}",
        mj / mb
    );
    assert!(
        wins < 12,
        "S2 was recorded NOT MET (10 of 20); now {wins} of 20"
    );
}

#[test]
fn slam_does_no_harm_on_a_perfect_map() {
    let r = runs(false);
    let (mb, mj) = (mean(r.iter().map(|x| x.0)), mean(r.iter().map(|x| x.1)));
    println!(
        "S3 mean baseline {mb:.1} m, mean slam {mj:.1} m, ratio {:.3}",
        mj / mb
    );
    // Recorded outcome: S3 MET, mean 1151.9 m against 1150.4 m (ratio 1.001, bar <= 1.1).
    assert!(mj <= 1.1 * mb, "S3: slam {mj} m vs 1.1 x baseline {mb} m");
}
