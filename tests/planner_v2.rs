// SPDX-License-Identifier: AGPL-3.0-only
//! B1a v2 (`docs/design/evidence/b1a-planner/PREREGISTRATION-v2.md`, readings 13 to 19 of
//! `xval/planner/README.md`): the planner against its revised internal bars on new layouts.
//!
//! * P1: the v2 maps against the oracle's `map2` outputs (committed before the v2 code). Bars on cells
//!   with the oracle's condition number at most 1e8; others reported.
//! * P2: Monte Carlo at 20 cells per layout; barred where DRMS < 0.05 × mean distance and at least 4
//!   stations are used.
//! * P3: detection by simulation at the same cells.
//! * P4: greedy+exchange on the 40-candidate instance against the best of 1 000 random subsets: NOT MET,
//!   pinned (0.350982 against 0.353361).
//! * P5: the same bytes from every entry and the pinned bytes of the pentagon map.
//!
//! PIN-SCOPE:    the SHA-256 of the pentagon v2 map (`xval/planner/layout_pentagon_v2.json`) as written
//!               by `run_json("map", …)`
//! PIN-EXCLUDES: the other v2 layouts' bytes (checked against the oracle and for repeatability only)

use flate2::read::GzDecoder;
use kshana::frames::{geodetic_to_ecef, Geodetic, Vec3};
use kshana::planner::{map, objective_of, place, run_json, solve_tdoa_on_sphere, PlanSpec};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha20Rng;
use rand_distr::{Distribution, Normal};
use std::io::Read;
use std::path::PathBuf;

const LAYOUTS: [&str; 3] = ["pentagon", "mixed", "arc"];
const C: f64 = 299_792_458.0;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn text(name: &str) -> String {
    std::fs::read_to_string(root().join(format!("xval/planner/{name}.json"))).unwrap()
}

fn spec(name: &str) -> PlanSpec {
    serde_json::from_str(&text(name)).unwrap()
}

fn oracle(l: &str) -> Vec<serde_json::Value> {
    let mut s = String::new();
    GzDecoder::new(
        std::fs::File::open(root().join(format!("tests/fixtures/planner/v2/oracle_{l}.json.gz")))
            .unwrap(),
    )
    .read_to_string(&mut s)
    .unwrap();
    let v: serde_json::Value = serde_json::from_str(&s).unwrap();
    v["cells"].as_array().unwrap().clone()
}

fn ecef(lat: f64, lon: f64, h: f64) -> Vec3 {
    geodetic_to_ecef(Geodetic {
        lat_rad: lat.to_radians(),
        lon_rad: lon.to_radians(),
        alt_m: h,
    })
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn used(sp: &PlanSpec, p_d: &[f64]) -> Vec<Vec3> {
    sp.stations
        .iter()
        .zip(p_d)
        .filter(|(_, p)| **p >= sp.gate_pd)
        .map(|(s, _)| ecef(s.lat_deg, s.lon_deg, s.height_m))
        .collect()
}

/// The 20 drawn cells per layout (reading 14), from one stream across the layouts in order.
fn drawn() -> Vec<Vec<usize>> {
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1A5);
    LAYOUTS
        .iter()
        .map(|l| {
            let m = map(&spec(&format!("layout_{l}_v2"))).unwrap();
            let mut pool: Vec<usize> = (0..m.cells.len())
                .filter(|&i| m.cells[i].drms_m.is_some())
                .collect();
            (0..20)
                .map(|_| pool.remove(rng.gen_range(0..pool.len())))
                .collect()
        })
        .collect()
}

#[test]
fn p1_v2_maps_against_the_oracle() {
    let (mut barred, mut reported, mut misses) = (0, 0, Vec::new());
    for l in LAYOUTS {
        let got = map(&spec(&format!("layout_{l}_v2"))).unwrap();
        let exp = oracle(l);
        assert_eq!(got.cells.len(), exp.len());
        let mut worst_p = 0f64;
        for (g, e) in got.cells.iter().zip(&exp) {
            for (a, b) in g.p_d.iter().zip(e["p_d"].as_array().unwrap()) {
                worst_p = worst_p.max((a - b.as_f64().unwrap()).abs());
            }
            worst_p = worst_p.max((g.p_any - e["p_any"].as_f64().unwrap()).abs());
            worst_p = worst_p.max((g.p_k - e["p_k"].as_f64().unwrap()).abs());
            assert_eq!(g.drms_m.is_some(), !e["drms_m"].is_null(), "{l}");
            if let Some(d) = g.drms_m {
                let x = e["drms_m"].as_f64().unwrap();
                let rel = (d - x).abs() / x;
                let in_scope = e["cond"].as_f64().is_some_and(|k| k <= 1e8);
                if in_scope {
                    barred += 1;
                    if rel > 1e-9 {
                        misses.push((l, g.lat_deg, g.lon_deg, rel));
                    }
                    let (ea, eb) = (g.ellipse_m.unwrap(), &e["ellipse_m"]);
                    assert!(
                        (ea[0] - eb[0].as_f64().unwrap()).abs()
                            <= 1e-6 * eb[0].as_f64().unwrap() + 1e-9
                    );
                } else {
                    reported += 1;
                    println!("P1 {l}: ill-conditioned cell, relative difference {rel:.2e}");
                }
            }
        }
        assert!(worst_p <= 1e-12, "{l}: detection differs by {worst_p}");
        println!("P1 {l}: detection within {worst_p:.1e}");
    }
    println!("P1 v2: {barred} barred cells, {reported} reported, misses {misses:?}");
    assert_eq!((barred, reported), (479 + 697 + 486, 0));
    assert!(misses.is_empty(), "{misses:?}");
}

#[test]
fn p2_v2_the_bound_is_attained_in_the_regime() {
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1A6);
    let (mut barred, mut reported, mut misses) = (0, 0, Vec::new());
    for (l, cells) in LAYOUTS.iter().zip(drawn()) {
        let sp = spec(&format!("layout_{l}_v2"));
        let m = map(&sp).unwrap();
        let noise = Normal::new(0.0, C * sp.sigma_tau_s).unwrap();
        for ci in cells {
            let c = &m.cells[ci];
            let x = ecef(c.lat_deg, c.lon_deg, sp.source.height_m);
            let rcv = used(&sp, &c.p_d);
            let d: Vec<f64> = rcv.iter().map(|r| dist(x, *r)).collect();
            let mean_d = d.iter().sum::<f64>() / d.len() as f64;
            let drms = c.drms_m.unwrap();
            let radius = dot(x, x).sqrt();
            let (sl, cl) = (c.lat_deg.to_radians().sin(), c.lat_deg.to_radians().cos());
            let (so, co) = (c.lon_deg.to_radians().sin(), c.lon_deg.to_radians().cos());
            let (east, north) = ([-so, co, 0.0], [-sl * co, -sl * so, cl]);
            let (mut sum2, mut ok) = (0.0, 0usize);
            for _ in 0..10_000 {
                let rd: Vec<f64> = (1..d.len())
                    .map(|i| d[i] - d[0] + noise.sample(&mut rng))
                    .collect();
                if let Some(e) = solve_tdoa_on_sphere(&rcv, &rd, radius, x) {
                    let v = [e[0] - x[0], e[1] - x[1], e[2] - x[2]];
                    let (de, dn) = (dot(v, east), dot(v, north));
                    sum2 += de * de + dn * dn;
                    ok += 1;
                }
            }
            let ratio = (sum2 / ok as f64).sqrt() / drms;
            let regime = drms < 0.05 * mean_d && rcv.len() >= 4;
            println!(
                "P2 {l} cell {ci}: DRMS {drms:.3} m, {} stations, ratio {ratio:.4}, solved {ok}/10000, {}",
                rcv.len(),
                if regime { "barred" } else { "reported" }
            );
            if regime {
                barred += 1;
                if (ratio - 1.0).abs() > 0.05 {
                    misses.push((*l, ci, ratio, ok));
                }
            } else {
                reported += 1;
            }
        }
    }
    println!("P2 v2: {barred} barred, {reported} reported, misses {misses:?}");
    assert!(misses.is_empty(), "{misses:?}");
}

#[test]
fn p3_v2_detection_by_simulation() {
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1A8);
    let n = 100_000usize;
    let z = kshana::planner::phi_inv(0.9995);
    let mut checked = 0;
    for (l, cells) in LAYOUTS.iter().zip(drawn()) {
        let sp = spec(&format!("layout_{l}_v2"));
        let m = map(&sp).unwrap();
        let rx = &sp.receiver;
        let sigma = 1.0 / (rx.bandwidth_hz * rx.integration_s).sqrt();
        let gamma = sigma * kshana::planner::phi_inv(1.0 - rx.p_fa / 2.0);
        let noise_w =
            1.380_649e-23 * 290.0 * 10f64.powf(rx.noise_figure_db / 10.0) * rx.bandwidth_hz;
        let lambda = C / sp.source.freq_hz;
        for ci in cells {
            let c = &m.cells[ci];
            let x = ecef(c.lat_deg, c.lon_deg, sp.source.height_m);
            let mus: Vec<f64> = sp
                .stations
                .iter()
                .map(|s| {
                    let d = dist(x, ecef(s.lat_deg, s.lon_deg, s.height_m));
                    let p = sp.source.eirp_dbw
                        - 20.0 * (4.0 * std::f64::consts::PI * d / lambda).log10()
                        + s.gain_dbi;
                    10f64.powf(p / 10.0) / noise_w
                })
                .collect();
            let k = sp.mode.k();
            let (mut any, mut atk) = (0usize, 0usize);
            let unit = Normal::new(0.0, 1.0).unwrap();
            for _ in 0..n {
                let det = mus
                    .iter()
                    .filter(|&&mu| (mu + sigma * unit.sample(&mut rng)).abs() > gamma)
                    .count();
                any += usize::from(det >= 1);
                atk += usize::from(det >= k);
            }
            for (name, hits, p) in [("P_D", any, c.p_any), ("P_k", atk, c.p_k)] {
                let half = z * (p * (1.0 - p) / n as f64).sqrt() + 0.5 / n as f64;
                let emp = hits as f64 / n as f64;
                assert!(
                    (emp - p).abs() <= half,
                    "{l} cell {ci} {name}: {emp} vs {p} ± {half}"
                );
            }
            checked += 1;
        }
    }
    println!("P3 v2: {checked} cells inside the 99.9 % interval");
    assert_eq!(checked, 60);
}

#[test]
fn p4_v2_greedy_exchange_against_random_subsets() {
    let sp = spec("place_40_v2");
    let got = place(&sp).unwrap();
    assert_eq!(got.method.as_deref(), Some("greedy+exchange"));
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1A7);
    let mut best = 0f64;
    for _ in 0..1000 {
        let mut pool: Vec<usize> = (0..40).collect();
        let mut sub: Vec<usize> = (0..7)
            .map(|_| pool.remove(rng.gen_range(0..pool.len())))
            .collect();
        sub.sort_unstable();
        best = best.max(objective_of(&sp, &sub).0);
    }
    println!(
        "P4 v2: greedy+exchange {:?} objective {:.6} (median DRMS {:?}); best of 1000 random {best:.6}",
        got.subset, got.objective, got.median_drms_m
    );
    // NOT MET, pinned (RESULTS-v2.md): greedy+exchange 0.350982 below the best random subset 0.353361.
    assert!(got.objective < best, "{} >= {best}", got.objective);
    assert_eq!(got.subset, vec![0, 2, 9, 11, 12, 14, 21]);
    assert!((got.objective - 0.350_981_558_596_073_8).abs() < 1e-12);
    assert!((best - 0.353_361_094_586_555_6).abs() < 1e-12);
}

#[test]
fn p5_v2_the_same_bytes_from_every_entry() {
    for l in LAYOUTS {
        let t = text(&format!("layout_{l}_v2"));
        let a = run_json("map", &t).unwrap();
        assert_eq!(a, run_json("map", &t).unwrap());
        assert_eq!(
            a,
            serde_json::to_string(&map(&spec(&format!("layout_{l}_v2"))).unwrap()).unwrap()
        );
    }
    let a = run_json("map", &text("layout_pentagon_v2")).unwrap();
    let h = kshana::bench::sha256_hex(format!("{a}\n").as_bytes());
    println!("P5 v2 pentagon: {h}");
    assert_eq!(h, PENTAGON_SHA256);
}

const PENTAGON_SHA256: &str = "a279b6595a08721f5bd4f67ec721f26b05f364ae708ae5acba3cbf8256ce7283";
