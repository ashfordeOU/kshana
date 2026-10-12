// SPDX-License-Identifier: AGPL-3.0-only
//! Instrumentation of the 1e-9 pseudo-inverse fallback of `lunar-frame-campaign`, on the six
//! scenarios of `tests/lunar_vlbi_campaign_spice_oracle.rs`.
//!
//! ## Why
//!
//! The engine inverts four matrices on the way to the datum covariance, each through
//! `fim::crlb` with the scenario's relative eigenvalue threshold (`rel_tol`, default 1e-9): the
//! station block `F_ss` of the joint information matrix (stations estimated only), the
//! marginal beacon information `S` (the Schur complement), the block-diagonal covariance of the
//! independence-discarded comparison, and the 7 x 7 Helmert information `H`. When a matrix has
//! an eigenvalue at or below `rel_tol` times its largest, `crlb` silently returns the
//! Moore-Penrose pseudo-inverse instead of the inverse (only `station_block_full_rank` and the
//! beacon sigmas' nulls report it). The P2 (NumPy) miss on `stations_estimated` (6.8e-6 against
//! a 1e-9 bar) left open whether that fallback took part. This file rules it in or out.
//!
//! ## How
//!
//! The pipeline is rebuilt here from the engine's public pieces (`schedule`,
//! `campaign_jacobian_row`, `fim::information_matrix`, `fim::crlb`, `helmert_design`) in the
//! engine's own operation order, and the rebuilt datum sigmas are first shown to equal the
//! engine's emitted ones to 1e-15 relative, so the matrices inspected are the engine's. For each
//! inverted matrix it records the smallest eigenvalue over the largest and asserts:
//!
//! * full-rank scenarios: every inverted matrix keeps every eigenvalue (rank = dimension, so the
//!   inverse and not the pseudo-inverse is used), with at least a factor 2 margin above
//!   `rel_tol`;
//! * `collinear_beacons`: the fallback is taken only where the design is defective (the Helmert
//!   matrix, defect 2), and nowhere upstream.
//!
//! ## Result (2026-10-12)
//!
//! The fallback does not trigger on any of the six scenarios upstream of the Helmert matrix, and
//! on the Helmert matrix only for `collinear_beacons` (its stated design defect). The tightest
//! margin is the Helmert matrix of `stations_estimated`: smallest eigenvalue 4.7e-9 of the
//! largest (condition 2.1e8), a factor 4.7 above the 1e-9 threshold. The station block there has
//! smallest-over-largest 3.3e-5 and the Schur complement 4.6e-7. So the 6.8e-6 NumPy gap is not
//! a pseudo-inverse truncation; it is rounding in the explicit spectral inverse of the
//! ill-conditioned joint problem (as the 50-digit oracle,
//! `tests/lunar_frame_campaign_mpmath_oracle.rs`, separately found).

use kshana::fim::{crlb, information_matrix};
use kshana::lunar_frame_campaign::{
    campaign_jacobian_row, helmert_design, BeaconInput, LunarFrameCampaignScenario,
};

type J = serde_json::Value;
type Mat = Vec<Vec<f64>>;

/// The six scenarios of `tests/lunar_vlbi_campaign_spice_oracle.rs`, by the same names.
fn scenarios() -> Vec<(&'static str, LunarFrameCampaignScenario)> {
    let b = |n: &str, alt: f64| BeaconInput {
        name: Some(n.to_string()),
        lat_deg: 0.0,
        lon_deg: 0.0,
        alt_m: Some(alt),
    };
    let d = LunarFrameCampaignScenario::default;
    vec![
        ("default", d()),
        (
            "arc_16h",
            LunarFrameCampaignScenario {
                arc_hours: Some(16.0),
                ..d()
            },
        ),
        (
            "arc_48h",
            LunarFrameCampaignScenario {
                arc_hours: Some(48.0),
                ..d()
            },
        ),
        (
            "stations_estimated",
            LunarFrameCampaignScenario {
                station_datum: Some("estimated-anchor-first".to_string()),
                ..d()
            },
        ),
        (
            "delay_sigma_3x",
            LunarFrameCampaignScenario {
                delay_sigma_s: Some(3.0e-11),
                ..d()
            },
        ),
        (
            "collinear_beacons",
            LunarFrameCampaignScenario {
                beacons: Some(vec![b("a", 0.0), b("b", 1000.0), b("c", 2000.0)]),
                ..d()
            },
        ),
    ]
}

/// The engine's dense product (same loop order, same zero skip).
fn matmul(a: &[Vec<f64>], b: &[Vec<f64>]) -> Mat {
    let n = a.len();
    let m = b.len();
    let k = if m > 0 { b[0].len() } else { 0 };
    let mut out = vec![vec![0.0; k]; n];
    for i in 0..n {
        for p in 0..m {
            let aip = a[i][p];
            if aip == 0.0 {
                continue;
            }
            for j in 0..k {
                out[i][j] += aip * b[p][j];
            }
        }
    }
    out
}

fn transpose(a: &[Vec<f64>]) -> Mat {
    let m = a.first().map_or(0, Vec::len);
    (0..m).map(|j| a.iter().map(|r| r[j]).collect()).collect()
}

fn block(a: &[Vec<f64>], r0: usize, c0: usize, rows: usize, cols: usize) -> Mat {
    (0..rows)
        .map(|i| (0..cols).map(|j| a[r0 + i][c0 + j]).collect())
        .collect()
}

/// One inverted matrix: (label, dimension, rank under rel_tol, smallest/largest eigenvalue).
type Probe = (&'static str, usize, usize, f64);

/// The (pseudo-)inverse `crlb` returns, and the probe of the matrix it inverted.
fn inverse(label: &'static str, a: &[Vec<f64>], rel_tol: f64, probes: &mut Vec<Probe>) -> Mat {
    let c = crlb(a, rel_tol);
    let lmax = c.eigenvalues.iter().cloned().fold(0.0_f64, f64::max);
    let lmin = c.eigenvalues.iter().cloned().fold(f64::INFINITY, f64::min);
    probes.push((label, c.n, c.rank, lmin / lmax));
    c.covariance.unwrap_or(c.pseudo_covariance)
}

/// Rebuild the engine's datum pipeline; returns the probes and the rebuilt datum sigmas.
fn pipeline(sc: &LunarFrameCampaignScenario, v: &J) -> (Vec<Probe>, Vec<f64>) {
    let rel_tol = sc.rel_tol.unwrap_or(1e-9);
    let sched = sc.schedule().expect("schedule");
    let n_sc = v["station_datum"]["n_station_columns"].as_u64().unwrap() as usize;
    let nb = 3 * sched.geoms.len();
    let dim = n_sc + nb;
    let jac: Mat = sched
        .observations
        .iter()
        .map(|&o| campaign_jacobian_row(&sched.geoms[o.beacon][o.epoch], n_sc, o, dim))
        .collect();
    let sigma_tau = v["campaign"]["delay_sigma_s"].as_f64().unwrap();
    let weights = vec![1.0 / (sigma_tau * sigma_tau); jac.len()];
    let joint = information_matrix(&jac, &weights);
    let mut probes = Vec::new();
    let m_bb = block(&joint, n_sc, n_sc, nb, nb);
    let info_b = if n_sc == 0 {
        m_bb
    } else {
        let m_ss = block(&joint, 0, 0, n_sc, n_sc);
        let m_sb = block(&joint, 0, n_sc, n_sc, nb);
        let m_ss_inv = inverse("station block F_ss", &m_ss, rel_tol, &mut probes);
        let corr = matmul(&matmul(&transpose(&m_sb), &m_ss_inv), &m_sb);
        m_bb.iter()
            .zip(&corr)
            .map(|(a, b)| a.iter().zip(b).map(|(x, y)| x - y).collect())
            .collect()
    };
    let cov_b = inverse("beacon information S", &info_b, rel_tol, &mut probes);
    let points: Vec<kshana::precession::Vec3> = v["campaign"]["beacons"]
        .as_array()
        .unwrap()
        .iter()
        .map(|b| {
            kshana::lunar::selenographic_to_mcmf(kshana::lunar::Selenographic {
                lat_rad: b["lat_deg"].as_f64().unwrap().to_radians(),
                lon_rad: b["lon_deg"].as_f64().unwrap().to_radians(),
                alt_m: b["alt_m"].as_f64().unwrap(),
            })
        })
        .collect();
    let a = helmert_design(&points);
    let h = matmul(&matmul(&transpose(&a), &info_b), &a);
    let c_h = inverse("Helmert information H", &h, rel_tol, &mut probes);
    let sigma: Vec<f64> = (0..7).map(|k| c_h[k][k].max(0.0).sqrt()).collect();
    let mut cov_ind = vec![vec![0.0; nb]; nb];
    for i in 0..nb {
        for j in 0..nb {
            if i / 3 == j / 3 {
                cov_ind[i][j] = cov_b[i][j];
            }
        }
    }
    let _ = inverse("independence-discarded covariance", &cov_ind, rel_tol, &mut probes);
    (probes, sigma)
}

fn engine_sigma(v: &J) -> Option<Vec<f64>> {
    let acc = &v["datum_accuracy"];
    let mut s: Vec<f64> = acc["translation_sigma_m"]
        .as_array()?
        .iter()
        .map(|x| x.as_f64())
        .collect::<Option<_>>()?;
    for x in acc["rotation_sigma_urad"].as_array()? {
        s.push(x.as_f64()?);
    }
    s.push(acc["scale_sigma_ppb"].as_f64()? / 1e3);
    Some(s)
}

#[test]
fn the_pseudo_inverse_fallback_does_not_trigger_upstream_of_a_stated_defect() {
    for (name, sc) in scenarios() {
        let (json, _) = sc.run_json().expect("scenario runs");
        let v: J = serde_json::from_str(&json).expect("json");
        let rel_tol = sc.rel_tol.unwrap_or(1e-9);
        let (probes, sigma) = pipeline(&sc, &v);
        for (label, n, rank, ratio) in &probes {
            eprintln!(
                "{name:<20} {label:<34} n {n:>2} rank {rank:>2} min/max eigenvalue {ratio:.3e} \
                 (threshold {rel_tol:.0e}){}",
                if rank < n { "  PSEUDO-INVERSE" } else { "" }
            );
        }
        let defective = name == "collinear_beacons";
        // The rebuilt pipeline is the engine's: its datum sigmas equal the emitted ones.
        match engine_sigma(&v) {
            Some(e) => {
                assert!(!defective);
                for (k, (a, b)) in e.iter().zip(&sigma).enumerate() {
                    assert!(
                        (a - b).abs() <= 1e-15 * a.abs(),
                        "{name}: rebuilt datum sigma {k} {b} differs from the engine's {a}"
                    );
                }
            }
            None => assert!(defective, "{name}: the engine published null datum sigmas"),
        }
        for (label, n, rank, ratio) in &probes {
            if defective && *label == "Helmert information H" {
                assert_eq!(n - rank, 2, "{name}: the collinear design's defect");
                continue;
            }
            assert_eq!(
                rank, n,
                "{name}: {label} fell back to the pseudo-inverse (min/max {ratio:.3e})"
            );
            assert!(
                *ratio > 2.0 * rel_tol,
                "{name}: {label} within a factor 2 of the threshold (min/max {ratio:.3e})"
            );
        }
        assert_eq!(
            v["station_datum"]["station_block_full_rank"].as_bool(),
            Some(true),
            "{name}: engine flag"
        );
    }
}
