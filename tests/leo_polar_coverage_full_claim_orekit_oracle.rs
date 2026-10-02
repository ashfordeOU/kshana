// SPDX-License-Identifier: AGPL-3.0-only
//! LEO (low Earth orbit) coverage and dilution of precision (DOP) for polar and Arctic users
//! against MEO (medium Earth orbit) GNSS (global navigation satellite systems), FULL CLAIM:
//! the `leo-pvt` polar sweep from the scenario's element sets to the reported figures, with the
//! orbits propagated by SGP4/SDP4 (Simplified General Perturbations 4 / Simplified Deep-space
//! Perturbations 4) and carried to the Earth-fixed frame by the IAU (International
//! Astronomical Union) 2006/2000A chain. Verification-matrix row M131 (row 218). Package D8.
//!
//! This replaces nothing: the round-2 comparison on tabulated states
//! (`tests/leo_polar_coverage_orekit_oracle.rs`) stays as the geometry-only check. This file
//! is a fresh comparison whose oracle also propagates the orbits.
//!
//! QUANTITY: for every latitude of the sweep and each of the three groups (MEO GNSS systems
//! alone, LEO systems alone, every system), the mean number of satellites in view, the median
//! position, horizontal and vertical DOP (PDOP, HDOP, VDOP) over the samples with a fix, and
//! the availability (fraction of samples with a fix and PDOP at or below the threshold), as
//! `leo_fusion::polar::latitude_sweep_at` reports them; per sample (latitude, longitude,
//! epoch) the number of satellites of each system above that system's own elevation mask;
//! and the Earth-fixed position of every satellite at every epoch.
//!
//! ENGINE PATH UNDER TEST: each system's element sets (the constellation-design convention:
//! semi-major axis, eccentricity, inclination, Earth-fixed longitude of the ascending node at
//! the epoch, argument of perigee, mean anomaly) become SGP4 mean element sets at the sweep
//! epoch: Kozai mean motion `sqrt(mu / a^3)` with the WGS-72 (World Geodetic System 1972)
//! constants SGP4 is defined with, B* drag term zero, and the node's right ascension in TEME
//! (true equator, mean equinox) equal to the Earth-fixed node longitude plus the Greenwich
//! mean sidereal time of the epoch (the TEME-to-pseudo-Earth-fixed angle). `kshana::sgp4`
//! propagates them; `nutation::teme_to_gcrs` and `cio::gcrs_to_itrs` (IAU 2006/2000A, with
//! no Earth orientation parameters: UT1 = UTC and zero polar motion) give ITRS (International
//! Terrestrial Reference System) positions. The element sets the engine builds are exported to
//! the fixture and the test asserts the engine builds exactly those (bit for bit) from the
//! scenario, so the oracle receives the same element sets the polar mode runs.
//!
//! INPUTS: two configurations. A is the bundled scenario `scenarios/polar-arctic-leo-coverage.toml`
//! unchanged (GPS, Galileo and Iridium, every mask 10 deg, every clock estimated; latitudes
//! 0 to 80 deg by 10 and 89.9 deg, 8 longitudes, 13 epochs over two hours, PDOP threshold 6) at
//! the polar mode's reference epoch 2026-01-01T00:00:00 UTC. B is the round-2 variant
//! `tests/fixtures/leo_polar_coverage_orekit_oracle/variant_masks_clocks.toml` (masks 5, 15 and
//! 8 deg, Galileo on a known clock offset, 12 longitudes, 25 epochs) at the epoch
//! 2024-03-20T12:00:00 UTC.
//!
//! ORACLE (Library, with P2 for the multi-clock groups): Orekit 13.1.8 with Hipparchus 4.0.3
//! (Apache-2.0), run as a separate program. Each satellite an Orekit `TLE` built from the
//! committed element set in double precision (B* and the mean-motion derivatives zero),
//! propagated by `TLEPropagator.selectExtrapolator` (Orekit's own SGP4/SDP4 choice and WGS-72
//! constants); states transformed from TEME to `FramesFactory.getITRF(IERSConventions.IERS_2010,
//! true)` with no Earth orientation parameter files loaded (UT1 = UTC, zero pole offsets: the
//! engine's stated assumption). Sites on a WGS-84 `OneAxisEllipsoid`; visibility from
//! `TopocentricFrame.getElevation` against each system's mask; line-of-sight unit vectors in
//! the site's east-north-zenith frame. A group with one clock unknown: Orekit
//! `org.orekit.gnss.DOPComputer`. A group with several clock unknowns: NumPy 2.4.6
//! (BSD-3-Clause) `numpy.linalg.inv` of the normal matrix of the geometry matrix stacked from
//! Orekit's line-of-sight vectors with one clock column per clock unknown, a fix existing when
//! `numpy.linalg.matrix_rank` is full (P2 in docs/VALIDATION.md). The mean, median and
//! availability aggregation in the oracle script is plain counting and sorting.
//!
//! TOLERANCE (fixed before the first comparison, 2026-10-02):
//! * T1, propagation and frame: every satellite at every epoch within 2 m of Orekit's ITRF
//!   position. Derivation: SGP4 implementation floor (Kshana 4.12 mm worst on the 666 AIAA
//!   (American Institute of Aeronautics and Astronautics) vectors; Orekit is checked against
//!   the same vectors) of order 1 cm between two implementations, plus the TEME-to-ITRF
//!   convention difference between the engine (IAU 2000B nutation in the equation of the
//!   equinoxes with the two 1994 complementary terms, IAU 2006/2000A CIO (Celestial
//!   Intermediate Origin) chain) and Orekit (IERS 2010 conventions, equation of the equinoxes
//!   without those terms) bounded by 10 milliarcseconds, which is 1.5 m at the Galileo radius
//!   of 29 600 km; 2 m is the rounded sum.
//! * T2, in view: per-sample in-view counts per system identical on at least 99.5 % of the
//!   samples of each configuration, and every differing sample an elevation-boundary tie: some
//!   satellite within 1e-5 rad of its system's mask in Orekit's elevation (2 m seen from any
//!   slant range of 200 km or more).
//! * T3, the reported figures: per latitude and group, mean in view within 0.01; median PDOP,
//!   HDOP and VDOP within 1e-3 relative (and present on both sides or on neither);
//!   availability within 0.005 (the round-2 route's bars, unchanged).
//!
//! VERDICT (2026-10-02, first and only run): FINDING, no promotion. T1 FAILS: worst ITRF
//! gap 66.98 m (A) and 66.80 m (B) against the 2 m bar. T2 holds: in-view counts per system
//! identical on 1040/1040 (A) and 3000/3000 (B) samples. T3 holds: mean in view, availability
//! and the presence of a fix identical on every latitude and group, worst median DOP 9.3e-7
//! (A) and 1.6e-6 (B) relative. Oracle self-check: Orekit DOPComputer and the NumPy inverse
//! agree to 2.1e-11 relative on the single-clock samples. Diagnosis (after the failure, not a
//! pre-registered oracle; see `the_full_claim_finding_is_pinned`): the deep-space gap (GPS and
//! Galileo, up to 67 m) is Orekit 13.1.8's SDP4 departing from the reference SGP4 for these
//! circular (e = 0) orbits: the engine matches python-sgp4 2.24 (D. Vallado's reference code)
//! to 5e-8 m, and with e = 1e-3 all three agree. The near-Earth gap (Iridium, up to 2.7 m)
//! is a TEME convention difference of about 72 milliarcseconds between Orekit's TEME and the
//! engine's IAU 2006/2000A chain (Orekit's TEME positions match the engine's to 6e-6 m there);
//! the pre-registration's 10 milliarcsecond bound was wrong. The bar is not loosened and the
//! row is not promoted; a fresh pre-registration is proposed in `.fold/feat-dom-d8-rows.md`.
//! Deliberate mutation: the node's right ascension without the sidereal time of the epoch
//! (6102 failures; in view identical on 172/1040 and 2151/3000 samples; median DOP off by up to
//! 7.0e-2 relative). Pre-registration commit e947e69d.

use kshana::jd2::Jd2;
use kshana::leo_fusion::joint_pvt::SystemClock;
use kshana::leo_fusion::polar::{
    element_sets, latitude_samples, latitude_sweep_at, latitude_sweep_on_states, polar_epoch,
    satellite_states_at, GroupStats, PolarRow,
};
use kshana::leo_fusion::system::{System, SystemCfg};
use serde_json::Value;
use std::fmt::Write as _;

const DIR: &str = "tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle";

const POSITION_M: f64 = 2.0;
const IN_VIEW_SAMPLE_FRACTION: f64 = 0.995;
const TIE_RAD: f64 = 1e-5;
const MEAN_IN_VIEW_ABS: f64 = 0.01;
const MEDIAN_DOP_REL: f64 = 1e-3;
const AVAILABILITY_ABS: f64 = 0.005;

/// One configuration: scenario source, systems, epoch and the polar mode's grid.
struct Config {
    name: &'static str,
    path: String,
    toml: String,
    systems: Vec<System>,
    epoch_civil: [f64; 6],
    epoch: Jd2,
    lats: Vec<f64>,
    lons: Vec<f64>,
    times: Vec<f64>,
    threshold: f64,
}

fn configs() -> Vec<Config> {
    vec![
        load(
            "A",
            "scenarios/polar-arctic-leo-coverage.toml",
            [2026.0, 1.0, 1.0, 0.0, 0.0, 0.0],
        ),
        load(
            "B",
            "tests/fixtures/leo_polar_coverage_orekit_oracle/variant_masks_clocks.toml",
            [2024.0, 3.0, 20.0, 12.0, 0.0, 0.0],
        ),
    ]
}

fn load(name: &'static str, path: &str, c: [f64; 6]) -> Config {
    let toml_src = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("{path}: {e}"));
    let doc: toml::Value = toml::from_str(&toml_src).unwrap();
    let systems: Vec<System> = doc["system"]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| {
            let cfg: SystemCfg = v.clone().try_into().unwrap();
            cfg.build().unwrap()
        })
        .collect();
    let f = |v: &toml::Value| v.as_float().unwrap();
    let (duration, step) = (f(&doc["duration_s"]), f(&doc["step_s"]));
    let p = &doc["polar"];
    let (ls, os, thr) = (
        f(&p["lat_step_deg"]),
        f(&p["lon_step_deg"]),
        f(&p["pdop_threshold"]),
    );
    // The polar mode's grid (leo_fusion::pvt_kind, mode "polar").
    let mut lats = Vec::new();
    let mut l: f64 = 0.0;
    while l <= 90.0 + 1e-9 {
        lats.push(l.min(89.9));
        l += ls;
    }
    let lons: Vec<f64> = (0..((360.0 / os).floor() as usize).max(1))
        .map(|k| -180.0 + k as f64 * os)
        .collect();
    let times: Vec<f64> = (0..=((duration / step).floor() as usize))
        .map(|k| k as f64 * step)
        .collect();
    let epoch = Jd2::from_utc_calendar(
        c[0] as i32,
        c[1] as u32,
        c[2] as u32,
        c[3] as u32,
        c[4] as u32,
        c[5],
    )
    .unwrap();
    Config {
        name,
        path: path.to_string(),
        toml: toml_src,
        systems,
        epoch_civil: c,
        epoch,
        lats,
        lons,
        times,
        threshold: thr,
    }
}

fn elements_csv(c: &Config) -> String {
    let mut csv = String::from(
        "# system_index,satellite_index,epoch_jd_day,epoch_jd_frac,no_kozai_rad_min,ecco,inclo_rad,nodeo_rad,argpo_rad,mo_rad,bstar\n",
    );
    let mut j = vec![0usize; c.systems.len()];
    for (set, k) in element_sets(&c.systems, c.epoch) {
        writeln!(
            csv,
            "{k},{},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?}",
            j[k],
            set.epoch_utc.day,
            set.epoch_utc.frac,
            set.no_kozai,
            set.ecco,
            set.inclo,
            set.nodeo,
            set.argpo,
            set.mo,
            set.bstar
        )
        .unwrap();
        j[k] += 1;
    }
    csv
}

fn inputs_json(c: &Config) -> String {
    let systems: Vec<Value> = c
        .systems
        .iter()
        .map(|s| {
            serde_json::json!({
                "name": s.name,
                "role": s.role,
                "mask_rad": s.mask_rad,
                "clock": match s.clock {
                    SystemClock::Estimated => "estimated",
                    SystemClock::Known(_) => "known",
                },
                "n_satellites": s.orbits.len(),
            })
        })
        .collect();
    serde_json::to_string_pretty(&serde_json::json!({
        "config": c.name,
        "scenario": c.path,
        "epoch_utc": c.epoch_civil,
        "lats_deg": c.lats,
        "lons_deg": c.lons,
        "times_s": c.times,
        "pdop_threshold": c.threshold,
        "site_height_m": 0.0,
        "systems": systems,
    }))
    .unwrap()
        + "\n"
}

/// Writes the comparison's inputs (the element sets and the grid); run by `generate.sh`.
#[test]
#[ignore = "fixture generator: run by tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/generate.sh"]
fn write_the_fixture_inputs() {
    std::fs::create_dir_all(DIR).unwrap();
    for c in configs() {
        std::fs::write(format!("{DIR}/inputs_{}.json", c.name), inputs_json(&c)).unwrap();
        std::fs::write(format!("{DIR}/elements_{}.csv", c.name), elements_csv(&c)).unwrap();
    }
}

fn oracle(name: &str) -> Value {
    serde_json::from_str(
        &std::fs::read_to_string(format!("{DIR}/oracle_{name}.json")).unwrap_or_else(|e| {
            panic!("{DIR}/oracle_{name}.json: {e} (run generate.sh to rebuild the oracle)")
        }),
    )
    .unwrap()
}

/// The polar mode's report rows for a configuration, through the public dispatcher.
fn report_rows(c: &Config) -> Vec<PolarRow> {
    let out = kshana::api::run_toml(&c.toml).unwrap();
    let doc: Value = serde_json::from_str(&out.json).unwrap();
    let g = |v: &Value| GroupStats {
        mean_in_view: v["mean_in_view"].as_f64().unwrap(),
        median_pdop: v["median_pdop"].as_f64(),
        median_hdop: v["median_hdop"].as_f64(),
        median_vdop: v["median_vdop"].as_f64(),
        availability: v["availability"].as_f64().unwrap(),
    };
    doc["polar"]["rows"]
        .as_array()
        .unwrap()
        .iter()
        .map(|r| PolarRow {
            lat_deg: r["lat_deg"].as_f64().unwrap(),
            gnss: g(&r["gnss"]),
            leo: g(&r["leo"]),
            fused: g(&r["fused"]),
        })
        .collect()
}

/// The committed element sets and grids are the ones the engine builds from the scenarios,
/// and configuration A's report from the public `leo-pvt` dispatcher is the sweep at the
/// polar mode's epoch: what is compared below is what the scenario runs.
#[test]
fn the_committed_element_sets_and_grid_are_the_ones_the_polar_mode_runs() {
    let cs = configs();
    assert_eq!(cs[0].epoch, polar_epoch());
    for c in &cs {
        let committed = std::fs::read_to_string(format!("{DIR}/elements_{}.csv", c.name)).unwrap();
        assert_eq!(
            elements_csv(c),
            committed,
            "config {}: element sets",
            c.name
        );
        let inputs = std::fs::read_to_string(format!("{DIR}/inputs_{}.json", c.name)).unwrap();
        assert_eq!(inputs_json(c), inputs, "config {}: grid", c.name);
    }
    let a = &cs[0];
    let report = report_rows(a);
    let mine = latitude_sweep_at(&a.systems, a.epoch, &a.lats, &a.lons, &a.times, a.threshold);
    assert_eq!(
        report, mine,
        "the leo-pvt polar report is the sweep at the polar epoch"
    );
}

fn close_rel(x: Option<f64>, y: Option<f64>, rel: f64) -> bool {
    match (x, y) {
        (Some(x), Some(y)) => (x - y).abs() <= rel * y.abs(),
        (None, None) => true,
        _ => false,
    }
}

/// Every pre-registered comparison of one configuration; returns the failures and a summary.
fn compare(c: &Config, o: &Value) -> (Vec<String>, String) {
    let mut fails = Vec::new();
    let states = satellite_states_at(&c.systems, c.epoch, &c.times);
    let n_sat: usize = c.systems.iter().map(|s| s.orbits.len()).sum();
    // T1: Earth-fixed positions.
    let pos = o["positions_m"].as_array().unwrap();
    assert_eq!(pos.len(), c.times.len(), "config {}: oracle epochs", c.name);
    let mut worst_pos = 0.0_f64;
    for (e, (mine, theirs)) in states.iter().zip(pos).enumerate() {
        let theirs = theirs.as_array().unwrap();
        assert_eq!(
            mine.len(),
            n_sat,
            "config {}: every satellite propagates",
            c.name
        );
        assert_eq!(theirs.len(), n_sat, "config {}: oracle satellites", c.name);
        for (k, ((r, _), q)) in mine.iter().zip(theirs).enumerate() {
            let q: Vec<f64> = q
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            let d = ((r[0] - q[0]).powi(2) + (r[1] - q[1]).powi(2) + (r[2] - q[2]).powi(2)).sqrt();
            worst_pos = worst_pos.max(d);
            if d > POSITION_M {
                fails.push(format!(
                    "config {} epoch {e} satellite {k}: position off by {d:.3} m",
                    c.name
                ));
            }
        }
    }
    // T2: per-sample in-view counts per system.
    let samples: std::collections::HashMap<(u64, u64, u64), &Value> = o["samples"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| {
            let k = |n: &str| x[n].as_u64().unwrap();
            ((k("lat_i"), k("lon_i"), k("epoch")), x)
        })
        .collect();
    let (mut n, mut same, mut worst_margin_of_diff) = (0usize, 0usize, 0.0_f64);
    for (li, &lat) in c.lats.iter().enumerate() {
        for s in latitude_samples(&c.systems, &states, lat, &c.lons) {
            let lon_i = c.lons.iter().position(|&x| x == s.lon_deg).unwrap();
            let os = samples
                .get(&(li as u64, lon_i as u64, s.epoch as u64))
                .unwrap_or_else(|| {
                    panic!(
                        "config {}: no oracle sample {li} {lon_i} {}",
                        c.name, s.epoch
                    )
                });
            let theirs: Vec<usize> = os["in_view_by_system"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_u64().unwrap() as usize)
                .collect();
            n += 1;
            if theirs == s.in_view_by_system {
                same += 1;
            } else {
                let margin = os["min_margin_rad"].as_f64().unwrap();
                worst_margin_of_diff = worst_margin_of_diff.max(margin);
                if margin > TIE_RAD {
                    fails.push(format!(
                        "config {} sample lat {lat} lon {} epoch {}: in view {:?} vs Orekit {theirs:?}, nearest mask margin {margin:.3e} rad",
                        c.name, s.lon_deg, s.epoch, s.in_view_by_system
                    ));
                }
            }
        }
    }
    if (same as f64) < IN_VIEW_SAMPLE_FRACTION * n as f64 {
        fails.push(format!(
            "config {}: in view identical on {same}/{n} samples",
            c.name
        ));
    }
    // T3: the reported figures.
    let mine = latitude_sweep_on_states(&c.systems, &states, &c.lats, &c.lons, c.threshold);
    let rows = o["rows"].as_array().unwrap();
    let mut worst_dop = 0.0_f64;
    for (r, orow) in mine.iter().zip(rows) {
        for (name, a) in [("gnss", &r.gnss), ("leo", &r.leo), ("fused", &r.fused)] {
            let b = &orow[name];
            let ok_mean =
                (a.mean_in_view - b["mean_in_view"].as_f64().unwrap()).abs() <= MEAN_IN_VIEW_ABS;
            let ok_avail =
                (a.availability - b["availability"].as_f64().unwrap()).abs() <= AVAILABILITY_ABS;
            let mut ok_dop = true;
            for (x, key) in [
                (a.median_pdop, "median_pdop"),
                (a.median_hdop, "median_hdop"),
                (a.median_vdop, "median_vdop"),
            ] {
                let y = b[key].as_f64();
                if let (Some(x), Some(y)) = (x, y) {
                    worst_dop = worst_dop.max((x - y).abs() / y.abs());
                }
                ok_dop &= close_rel(x, y, MEDIAN_DOP_REL);
            }
            if !(ok_mean && ok_avail && ok_dop) {
                fails.push(format!(
                    "config {} lat {} {name}: {a:?} vs Orekit {b}",
                    c.name, r.lat_deg
                ));
            }
        }
    }
    let summary = format!(
        "config {}: worst position {worst_pos:.3e} m; in view identical {same}/{n} (worst margin of a differing sample {worst_margin_of_diff:.3e} rad); worst median DOP {worst_dop:.3e} relative",
        c.name
    );
    (fails, summary)
}

#[test]
#[ignore = "FINDING 2026-10-02: T1 fails (worst ITRF gap 66.98 m in A, 66.80 m in B, bar 2 m: Orekit 13.1.8 SDP4 differs from the reference SGP4 at e = 0, and Orekit's TEME is about 72 mas from the IAU 2006/2000A chain); T2 identical 1040/1040 and 3000/3000; T3 worst median DOP 1.6e-6 relative. Pinned by the_full_claim_finding_is_pinned"]
fn the_polar_sweep_from_element_sets_agrees_with_orekit_propagation_and_dop() {
    let mut all = Vec::new();
    for c in configs() {
        let (fails, summary) = compare(&c, &oracle(c.name));
        println!("{summary}");
        all.extend(fails);
    }
    assert!(
        all.is_empty(),
        "{} failures:\n{}",
        all.len(),
        all.iter().take(40).cloned().collect::<Vec<_>>().join("\n")
    );
}

/// Engine TEME positions at the first and last epoch, keyed `(epoch index, satellite index)`.
fn engine_teme(c: &Config) -> std::collections::HashMap<(usize, usize), [f64; 3]> {
    let last = c.times.len() - 1;
    let mut out = std::collections::HashMap::new();
    for (k, (set, _)) in element_sets(&c.systems, c.epoch).into_iter().enumerate() {
        let o = kshana::sgp4::SgpOrbit::new(set);
        for ei in [0, last] {
            out.insert(
                (ei, k),
                o.teme_state(c.epoch.add_seconds(c.times[ei])).unwrap().0,
            );
        }
    }
    out
}

/// The pre-registered comparison failed its position bar (T1) while its in-view (T2) and
/// reported-figure (T3) bars held. This pins what was measured, so a change on either side
/// shows. The diagnosis below was done after the failure and is not a pre-registered oracle:
/// (1) the engine's SGP4/SDP4 reproduces the reference implementation (python-sgp4 2.24, D.
/// Vallado's C++ code behind the AIAA vectors) to the millimetre on every committed element set,
/// while Orekit 13.1.8's SDP4 differs for these circular (e = 0) deep-space orbits (with
/// e = 1e-3 the three agree, checked by hand on one GPS element set); (2) on the near-Earth
/// orbits, where Orekit's TEME positions match, the remaining 0.5 to 2.7 m ITRF gap is a TEME
/// convention difference of about 72 milliarcseconds between Orekit's TEME (built on the IAU
/// 1980 nutation) and the engine's IAU 2006/2000A chain, outside the 10 milliarcsecond bound
/// the pre-registration derived its 2 m bar from.
#[test]
fn the_full_claim_finding_is_pinned() {
    for c in configs() {
        // (1) The engine's SGP4 is the reference SGP4 on these element sets.
        let mine = engine_teme(&c);
        let reference =
            std::fs::read_to_string(format!("{DIR}/reference_sgp4_teme_{}.csv", c.name)).unwrap();
        let mut worst_ref = 0.0_f64;
        let mut n_ref = 0;
        for line in reference.lines().filter(|l| !l.starts_with('#')) {
            let f: Vec<f64> = line.split(',').map(|x| x.parse().unwrap()).collect();
            let r = mine[&(f[0] as usize, f[1] as usize)];
            let d = ((r[0] - f[2]).powi(2) + (r[1] - f[3]).powi(2) + (r[2] - f[4]).powi(2)).sqrt();
            worst_ref = worst_ref.max(d);
            n_ref += 1;
        }
        assert_eq!(n_ref, 2 * 114, "config {}", c.name);
        assert!(
            worst_ref < 1e-3,
            "config {}: engine vs reference SGP4 {worst_ref} m",
            c.name
        );
        // (2) Engine vs Orekit ITRF, split into near-Earth (SGP4) and deep-space (SDP4) orbits.
        let o = oracle(c.name);
        let states = satellite_states_at(&c.systems, c.epoch, &c.times);
        let sets = element_sets(&c.systems, c.epoch);
        let (mut near, mut deep) = (0.0_f64, 0.0_f64);
        for (mine_e, theirs_e) in states.iter().zip(o["positions_m"].as_array().unwrap()) {
            for (k, ((r, _), q)) in mine_e.iter().zip(theirs_e.as_array().unwrap()).enumerate() {
                let q: Vec<f64> = q
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|x| x.as_f64().unwrap())
                    .collect();
                let d =
                    ((r[0] - q[0]).powi(2) + (r[1] - q[1]).powi(2) + (r[2] - q[2]).powi(2)).sqrt();
                let period_min = std::f64::consts::TAU / sets[k].0.no_kozai;
                if period_min < 225.0 {
                    near = near.max(d);
                } else {
                    deep = deep.max(d);
                }
            }
        }
        println!("config {}: engine vs reference SGP4 {worst_ref:.2e} m; engine vs Orekit ITRF near-Earth {near:.3} m, deep-space {deep:.3} m", c.name);
        assert!(
            (0.5..3.0).contains(&near),
            "config {}: near-Earth gap {near} m",
            c.name
        );
        assert!(
            (20.0..70.0).contains(&deep),
            "config {}: deep-space gap {deep} m",
            c.name
        );
        // (3) The in-view (T2) and reported-figure (T3) bars hold: every failure is a position.
        let (fails, _) = compare(&c, &o);
        assert!(
            fails.iter().all(|f| f.contains("position off by")),
            "config {}: a non-position failure: {:?}",
            c.name,
            fails.iter().find(|f| !f.contains("position off by"))
        );
    }
}
