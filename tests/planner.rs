// SPDX-License-Identifier: AGPL-3.0-only
//! B1a part 1 (0.41): the monitoring-network planner against its pre-registered internal bars
//! (`docs/design/evidence/b1a-planner/PREREGISTRATION.md`, readings in `xval/planner/README.md`).
//!
//! * P1: the maps against the independent oracle (`xval/planner/oracle.py`, output committed before the
//!   planner code). Detection within 1e-12, identical "not locatable" cells, DRMS within 1e-9 relative.
//!   NOT MET: 4 cells of the line layout, all on its own axis (the degenerate case), differ by up to
//!   2.6e-9 relative. The test pins that miss; square and circle meet the bar on every cell.
//! * P2: the bound is attained by the surface solver in the near-linear regime (Monte Carlo). NOT MET
//!   at 2 of 54 barred cells (pinned).
//! * P3: detection by simulation inside the 99.9 % binomial interval.
//! * P4: the exhaustive placement equals the oracle's optimum (met). The greedy subset does not beat the
//!   best of 1 000 random subsets (NOT MET, pinned).
//! * P5: the command line, the text surface and a second run give the same bytes, and they equal the
//!   committed engine output of the circle layout on every platform CI runs on.
//!
//! PIN-SCOPE:    the map bytes of `xval/planner/layout_circle.json` (`engine_circle.json.gz`, written by
//!               `kshana planner map` when this test was added); the oracle's figures in P1
//! PIN-EXCLUDES: any other layout's bytes; a deliberate change to the map format or the planner's
//!               arithmetic regenerates the fixture with the CLI and is recorded in RESULTS.md

use flate2::read::GzDecoder;
use kshana::frames::{geodetic_to_ecef, Geodetic, Vec3};
use kshana::planner::{map, objective_of, place, run_json, solve_tdoa_on_sphere, Mode, PlanSpec};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha20Rng;
use rand_distr::{Distribution, Normal};
use std::io::Read;
use std::path::PathBuf;

const LAYOUTS: [&str; 3] = ["square", "line", "circle"];
const C: f64 = 299_792_458.0;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn spec(name: &str) -> PlanSpec {
    serde_json::from_str(
        &std::fs::read_to_string(root().join(format!("xval/planner/{name}.json"))).unwrap(),
    )
    .unwrap()
}

fn expected(name: &str) -> serde_json::Value {
    let mut s = String::new();
    GzDecoder::new(
        std::fs::File::open(root().join(format!("tests/fixtures/planner/expected_{name}.json.gz")))
            .unwrap(),
    )
    .read_to_string(&mut s)
    .unwrap();
    serde_json::from_str(&s).unwrap()
}

#[test]
fn p1_maps_against_the_oracle() {
    let mut misses = Vec::new();
    for l in LAYOUTS {
        let got = map(&spec(&format!("layout_{l}"))).unwrap();
        let exp = expected(l);
        let exp = exp["cells"].as_array().unwrap();
        assert_eq!(got.cells.len(), exp.len());
        let (mut worst_p, mut locatable) = (0f64, 0);
        for (g, e) in got.cells.iter().zip(exp) {
            for (a, b) in g.p_d.iter().zip(e["p_d"].as_array().unwrap()) {
                worst_p = worst_p.max((a - b.as_f64().unwrap()).abs());
            }
            worst_p = worst_p.max((g.p_any - e["p_any"].as_f64().unwrap()).abs());
            worst_p = worst_p.max((g.p_k - e["p_k"].as_f64().unwrap()).abs());
            assert_eq!(
                g.drms_m.is_some(),
                !e["drms_m"].is_null(),
                "{l}: locatable cells differ"
            );
            if let Some(d) = g.drms_m {
                locatable += 1;
                let x = e["drms_m"].as_f64().unwrap();
                let rel = (d - x).abs() / x;
                if rel > 1e-9 {
                    misses.push((l, g.lat_deg, g.lon_deg, x, rel));
                }
                let (ea, eb) = (g.ellipse_m.unwrap(), &e["ellipse_m"]);
                assert!(
                    (ea[0] - eb[0].as_f64().unwrap()).abs()
                        <= 1e-6 * eb[0].as_f64().unwrap() + 1e-9
                );
            }
        }
        assert!(worst_p <= 1e-12, "{l}: detection differs by {worst_p}");
        println!("P1 {l}: {locatable} locatable cells, detection within {worst_p:.1e}");
    }
    // The pinned miss: four cells, all on the line layout's own axis (latitude 45°).
    for m in &misses {
        println!("P1 miss: {m:?}");
    }
    assert_eq!(misses.len(), 4, "{misses:?}");
    assert!(misses
        .iter()
        .all(|m| m.0 == "line" && (m.1 - 45.0).abs() < 1e-9 && m.4 < 3e-9));
}

fn ecef(lat: f64, lon: f64, h: f64) -> Vec3 {
    geodetic_to_ecef(Geodetic {
        lat_rad: lat.to_radians(),
        lon_rad: lon.to_radians(),
        alt_m: h,
    })
}

/// The used stations of a cell (P_d ≥ gate), as ECEF.
fn used(sp: &PlanSpec, p_d: &[f64]) -> Vec<Vec3> {
    sp.stations
        .iter()
        .zip(p_d)
        .filter(|(_, p)| **p >= sp.gate_pd)
        .map(|(s, _)| ecef(s.lat_deg, s.lon_deg, s.height_m))
        .collect()
}

#[test]
fn p2_the_bound_is_attained_in_the_near_linear_regime() {
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1A2);
    let (mut barred, mut reported) = (0, 0);
    let mut misses = Vec::new();
    for l in LAYOUTS {
        let sp = spec(&format!("layout_{l}"));
        assert_eq!(sp.mode, Mode::Surface);
        let m = map(&sp).unwrap();
        let loc: Vec<usize> = (0..m.cells.len())
            .filter(|&i| m.cells[i].drms_m.is_some())
            .collect();
        let mut pool = loc.clone();
        let cells: Vec<usize> = (0..20)
            .map(|_| pool.remove(rng.gen_range(0..pool.len())))
            .collect();
        let noise = Normal::new(0.0, C * sp.sigma_tau_s).unwrap();
        for ci in cells {
            let c = &m.cells[ci];
            let x = ecef(c.lat_deg, c.lon_deg, sp.source.height_m);
            let rcv = used(&sp, &c.p_d);
            let d: Vec<f64> = rcv.iter().map(|r| dist(x, *r)).collect();
            let mean_d = d.iter().sum::<f64>() / d.len() as f64;
            let drms = c.drms_m.unwrap();
            let radius = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
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
            let rms = (sum2 / ok as f64).sqrt();
            let ratio = rms / drms;
            let linear = drms < 0.05 * mean_d;
            println!(
                "P2 {l} cell {ci}: DRMS {drms:.3} m, MC RMS {rms:.3} m, ratio {ratio:.4}, solved {ok}/10000, {}",
                if linear { "near-linear (barred)" } else { "outside the regime (reported)" }
            );
            if linear {
                barred += 1;
                if (ratio - 1.0).abs() > 0.05 {
                    misses.push((l, ci, drms, ratio, ok));
                }
            } else {
                reported += 1;
            }
        }
    }
    println!("P2: {barred} cells barred, {reported} reported, misses {misses:?}");
    assert_eq!(barred, 54);
    // The pinned miss (RESULTS.md): two barred cells outside ±5 %, each with non-converged trials.
    assert_eq!(misses.len(), 2, "{misses:?}");
    assert!(misses[0].0 == "square" && misses[0].1 == 1293 && (misses[0].3 - 1.097).abs() < 0.001);
    assert!(misses[1].0 == "circle" && misses[1].1 == 1293 && (misses[1].3 - 0.717).abs() < 0.001);
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

#[test]
fn p3_detection_by_simulation() {
    let mut pick = ChaCha20Rng::seed_from_u64(0xB1A2);
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1A3);
    let n = 100_000usize;
    // The two-sided 99.9 % interval: z = Φ⁻¹(0.9995).
    let z = kshana::planner::phi_inv(0.9995);
    let mut checked = 0;
    for l in LAYOUTS {
        let sp = spec(&format!("layout_{l}"));
        let m = map(&sp).unwrap();
        let loc: Vec<usize> = (0..m.cells.len())
            .filter(|&i| m.cells[i].drms_m.is_some())
            .collect();
        let mut pool = loc.clone();
        let cells: Vec<usize> = (0..20)
            .map(|_| pool.remove(pick.gen_range(0..pool.len())))
            .collect();
        let rx = &sp.receiver;
        let sigma = 1.0 / (rx.bandwidth_hz * rx.integration_s).sqrt();
        let gamma = sigma * kshana::planner::phi_inv(1.0 - rx.p_fa / 2.0);
        for ci in cells {
            let c = &m.cells[ci];
            // μ_i from P_d: recompute from the link budget as the planner does.
            let x = ecef(c.lat_deg, c.lon_deg, sp.source.height_m);
            let noise_w =
                1.380_649e-23 * 290.0 * 10f64.powf(rx.noise_figure_db / 10.0) * rx.bandwidth_hz;
            let lambda = C / sp.source.freq_hz;
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
            for _ in 0..n {
                let det = mus
                    .iter()
                    .filter(|&&mu| {
                        (mu + sigma * Normal::new(0.0, 1.0).unwrap().sample(&mut rng)).abs() > gamma
                    })
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
    println!("P3: {checked} cells, P_D and P_k inside the 99.9 % interval");
}

#[test]
fn p4_placement() {
    let sp = spec("place_12");
    let got = place(&sp).unwrap();
    let exp: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root().join("tests/fixtures/planner/expected_place_12.json"))
            .unwrap(),
    )
    .unwrap();
    let want: Vec<usize> = exp["subset"]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_u64().unwrap() as usize)
        .collect();
    assert_eq!(got.subset, want, "P4: the exhaustive optimum");
    assert_eq!(got.method.as_deref(), Some("exhaustive"));
    assert!((got.objective - exp["objective"].as_f64().unwrap()).abs() < 1e-15);

    let sp = spec("place_30");
    let greedy = place(&sp).unwrap();
    assert_eq!(greedy.method.as_deref(), Some("greedy"));
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1A4);
    let mut best = 0f64;
    for _ in 0..1000 {
        let mut pool: Vec<usize> = (0..30).collect();
        let mut sub: Vec<usize> = (0..6)
            .map(|_| pool.remove(rng.gen_range(0..pool.len())))
            .collect();
        sub.sort_unstable();
        best = best.max(objective_of(&sp, &sub).0);
    }
    println!(
        "P4: 12 candidates, subset {:?} (objective {:.4}); 30 candidates, greedy {:?} objective {:.4}, best of 1000 random {best:.4}",
        got.subset, got.objective, greedy.subset, greedy.objective
    );
    // The pinned miss (RESULTS.md): the greedy subset scores below the best random subset.
    assert!(
        greedy.objective < best,
        "greedy {} >= random {best}",
        greedy.objective
    );
    assert!((greedy.objective - 0.275_431_290_898_274_8).abs() < 1e-12);
    assert!((best - 0.279_000_594_883_997_6).abs() < 1e-12);
}

#[test]
fn p5_the_same_bytes_from_every_entry() {
    for l in LAYOUTS {
        let text =
            std::fs::read_to_string(root().join(format!("xval/planner/layout_{l}.json"))).unwrap();
        let a = run_json("map", &text).unwrap();
        assert_eq!(a, run_json("map", &text).unwrap());
        assert_eq!(
            a,
            serde_json::to_string(&map(&spec(&format!("layout_{l}"))).unwrap()).unwrap()
        );
        // The 3-D mode is checked for determinism only (reading 7).
        let mut v: serde_json::Value = serde_json::from_str(&text).unwrap();
        v["mode"] = "3d".into();
        let t3 = v.to_string();
        assert_eq!(run_json("map", &t3).unwrap(), run_json("map", &t3).unwrap());
    }
    let mut want = String::new();
    GzDecoder::new(
        std::fs::File::open(root().join("tests/fixtures/planner/engine_circle.json.gz")).unwrap(),
    )
    .read_to_string(&mut want)
    .unwrap();
    let text = std::fs::read_to_string(root().join("xval/planner/layout_circle.json")).unwrap();
    assert_eq!(
        format!("{}\n", run_json("map", &text).unwrap()),
        want,
        "the committed engine bytes"
    );
    assert!(run_json("map", "{}").is_err());
    assert!(run_json("bogus", "{}").is_err());
}
