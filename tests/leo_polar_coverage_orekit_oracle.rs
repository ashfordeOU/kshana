// SPDX-License-Identifier: AGPL-3.0-only
//! LEO (low Earth orbit) coverage and dilution of precision (DOP) for polar and Arctic users
//! against MEO (medium Earth orbit) GNSS (global navigation satellite systems): the
//! `leo-pvt` polar sweep against Orekit 12.2 and, for the multi-clock groups, NumPy/LAPACK.
//! Verification-matrix row M131 (row 218).
//!
//! QUANTITY: for every latitude of the sweep and each of the three groups (MEO GNSS systems
//! alone, LEO systems alone, every system), the mean number of satellites in view, the median
//! position, horizontal and vertical DOP (PDOP, HDOP, VDOP) over the samples with a fix, and
//! the availability (fraction of samples with a fix and PDOP at or below the threshold), as
//! `leo_fusion::polar::latitude_sweep` reports them in the `leo-pvt` polar mode; and, per
//! sample (latitude, longitude, epoch), the number of satellites of each system above that
//! system's own elevation mask.
//!
//! INPUTS: two configurations. A is the bundled scenario `scenarios/polar-arctic-leo-coverage.toml`
//! unchanged (GPS, Galileo and Iridium, every mask 10 deg, every clock estimated; latitudes
//! 0 to 80 deg by 10 and 89.9 deg, 8 longitudes, 13 epochs over two hours, PDOP threshold 6).
//! B is `tests/fixtures/leo_polar_coverage_orekit_oracle/variant_masks_clocks.toml`: the same
//! systems with masks of 5, 15 and 8 deg and Galileo on a known clock offset, 12 longitudes and
//! 25 epochs. Both sides use the SAME tabulated Earth-fixed satellite positions, exported from
//! the engine at each epoch and committed with the fixture (`states_A.csv`, `states_B.csv`).
//! Orbit propagation (two-body with secular J2 node and perigee drift, Earth rotation as a
//! plain rotation at the WGS 84 rate) is therefore OUT OF SCOPE of this comparison: the engine
//! does not match a reference propagator (it omits the J2 mean-anomaly rate and precession and
//! nutation), so what is compared is the sweep geometry on the given states. The test also
//! asserts that the engine's own propagation reproduces the committed states bit for bit and
//! that the polar mode's report equals the sweep on those states, so the compared sweep is the
//! one the scenario runs.
//!
//! ORACLE (Library, with P2 for the multi-clock groups): Orekit 12.2 (Apache-2.0). Site on a
//! WGS 84 `OneAxisEllipsoid` in ITRF (International Terrestrial Reference Frame); each
//! satellite an Orekit `Ephemeris` of its tabulated Earth-fixed states; visibility from
//! `TopocentricFrame.getElevation` against each system's own mask; line-of-sight unit vectors
//! in the topocentric (east, north, zenith) frame from Orekit. For a group whose clock model
//! leaves one clock unknown, the DOP is Orekit's `org.orekit.gnss.DOPComputer`. For a group
//! with several clock unknowns (one per estimated system in view; known-offset systems share
//! the reference clock), the DOP is NumPy 2.3.5 (BSD-3-Clause; LAPACK from OpenBLAS 0.3.30)
//! `numpy.linalg.inv` (LAPACK getrf/getri) of the normal matrix of the geometry matrix
//! stacked from Orekit's line-of-sight vectors with one clock column per clock unknown, in
//! the topocentric frame; a fix exists when the group has at least as many satellites as
//! unknowns and that matrix has full column rank (`numpy.linalg.matrix_rank`)
//! (P2 in docs/VALIDATION.md: the linear algebra on the committed inputs). The mean, median
//! and availability aggregation in the oracle script is plain counting and sorting, stated as
//! such; the validated claim is the sweep geometry on the given states.
//!
//! TOLERANCE (fixed before the first comparison, 2026-10-02, from the round-2 route for this
//! row; availability added here because the route left it unstated, at the route's own 0.5 %
//! sample-agreement fraction):
//! * per-sample in-view counts per system identical on at least 99.5 % of the samples of each
//!   configuration, and every differing sample an elevation-boundary tie (some satellite
//!   within 1e-9 rad of its system's mask in Orekit's elevation);
//! * per latitude and group: mean in view within 0.01; median PDOP, HDOP and VDOP within
//!   1e-3 relative (and present on both sides or on neither); availability within 0.005.
//!
//! VERDICT (2026-10-02): AGREES at the pre-registered tolerance, unchanged. In-view counts per
//! system identical on 1040/1040 samples (A) and 3000/3000 (B); mean in view, availability and
//! the presence of a fix identical on every latitude and group; worst median DOP difference
//! 4.6e-14 relative (A) and 1.9e-14 (B). Oracle self-checks: Orekit's interpolated states
//! reproduce the table to 7.0e-8 m; Orekit DOPComputer and the NumPy inverse agree to 1.9e-10
//! relative on the single-clock samples. Deliberate mutations turn this test red: every system
//! on the first system's mask (B: 2890 failures, in view identical on 223/3000 samples), and one
//! clock for every system (A and B: 90 failures, median DOP off by up to 8.3e-2 relative).
//! Pre-registration commit 3254d456. Validated: the sweep geometry on the given Earth-fixed
//! states; the propagation that produces those states is not part of this comparison.
//!
//! REVISION (package D8, 2026-10-02): the polar mode no longer runs the two-body plus
//! secular-J2 states committed here; it propagates by SGP4 and the IAU 2006/2000A chain. The
//! geometry comparison on these states is unchanged and still runs at its bars; the check that
//! the committed states are the engine's own propagation is replaced by a check that the polar
//! mode reports the sweep on its own states. The full claim, propagation included, is
//! pre-registered in `tests/leo_polar_coverage_full_claim_orekit_oracle.rs`.
//!
//! Fixture, drivers and provenance: `tests/fixtures/leo_polar_coverage_orekit_oracle/`.

use kshana::leo_fusion::polar::{
    latitude_samples, latitude_sweep_on_states, satellite_states, GroupStats, PolarRow,
};
use kshana::leo_fusion::system::{System, SystemCfg};
use serde_json::Value;

const DIR: &str = "tests/fixtures/leo_polar_coverage_orekit_oracle";

const IN_VIEW_SAMPLE_FRACTION: f64 = 0.995;
const TIE_RAD: f64 = 1e-9;
const MEAN_IN_VIEW_ABS: f64 = 0.01;
const MEDIAN_DOP_REL: f64 = 1e-3;
const AVAILABILITY_ABS: f64 = 0.005;

/// One configuration: its scenario source, the systems, the grid and the tabulated states.
struct Config {
    name: &'static str,
    toml: String,
    systems: Vec<System>,
    lats: Vec<f64>,
    lons: Vec<f64>,
    times: Vec<f64>,
    threshold: f64,
    states: Vec<Vec<([f64; 3], usize)>>,
}

fn configs() -> Vec<Config> {
    [
        ("A", "scenarios/polar-arctic-leo-coverage.toml".to_string()),
        ("B", format!("{DIR}/variant_masks_clocks.toml")),
    ]
    .into_iter()
    .map(|(name, path)| load(name, &path))
    .collect()
}

fn load(name: &'static str, path: &str) -> Config {
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
    let inputs: Value = serde_json::from_str(
        &std::fs::read_to_string(format!("{DIR}/inputs_{name}.json")).unwrap(),
    )
    .unwrap();
    let arr = |k: &str| -> Vec<f64> {
        inputs[k]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect()
    };
    let (lats, lons, times) = (arr("lats_deg"), arr("lons_deg"), arr("times_s"));
    let threshold = inputs["pdop_threshold"].as_f64().unwrap();
    let mut states: Vec<Vec<([f64; 3], usize)>> = vec![Vec::new(); times.len()];
    let csv = std::fs::read_to_string(format!("{DIR}/states_{name}.csv")).unwrap();
    for line in csv.lines().filter(|l| !l.starts_with('#') && !l.is_empty()) {
        let f: Vec<&str> = line.split(',').collect();
        let epoch: usize = f[0].parse().unwrap();
        let system: usize = f[2].parse().unwrap();
        let p = [
            f[4].parse().unwrap(),
            f[5].parse().unwrap(),
            f[6].parse().unwrap(),
        ];
        states[epoch].push((p, system));
    }
    Config {
        name,
        toml: toml_src,
        systems,
        lats,
        lons,
        times,
        threshold,
        states,
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

/// The polar mode's report is the sweep on the engine's own satellite states over the
/// committed grid. Revision (package D8): the polar mode now propagates by SGP4 and the IAU
/// 2006/2000A chain, so the committed round-2 states (two-body with secular J2) are no longer
/// the ones it runs; they stay the shared input of the geometry-only comparison below, and the
/// full claim from element sets is `tests/leo_polar_coverage_full_claim_orekit_oracle.rs`.
#[test]
fn the_polar_mode_reports_the_sweep_on_its_own_states_over_the_committed_grid() {
    for c in configs() {
        let mine = satellite_states(&c.systems, &c.times);
        assert_ne!(
            mine, c.states,
            "the round-2 states are retired from the polar mode"
        );
        let on_states = latitude_sweep_on_states(&c.systems, &mine, &c.lats, &c.lons, c.threshold);
        let report = report_rows(&c);
        assert_eq!(report.len(), on_states.len(), "config {}", c.name);
        for (r, s) in report.iter().zip(&on_states) {
            assert_eq!(r.lat_deg, s.lat_deg, "config {}", c.name);
            for (a, b) in [(&r.gnss, &s.gnss), (&r.leo, &s.leo), (&r.fused, &s.fused)] {
                let close = |x: Option<f64>, y: Option<f64>| match (x, y) {
                    (Some(x), Some(y)) => (x - y).abs() <= 1e-12 * y.abs().max(1.0),
                    (None, None) => true,
                    _ => false,
                };
                assert!(
                    (a.mean_in_view - b.mean_in_view).abs() < 1e-12
                        && close(a.median_pdop, b.median_pdop)
                        && close(a.median_hdop, b.median_hdop)
                        && close(a.median_vdop, b.median_vdop)
                        && (a.availability - b.availability).abs() < 1e-12,
                    "config {} lat {}: report {a:?} vs sweep on states {b:?}",
                    c.name,
                    r.lat_deg
                );
            }
        }
    }
}

/// Every pre-registered comparison of one configuration; returns the failures and a summary.
fn compare(c: &Config, o: &Value) -> (Vec<String>, String) {
    let mut fails = Vec::new();
    // Per-sample in-view counts per system.
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
        let mine = latitude_samples(&c.systems, &c.states, lat, &c.lons);
        for s in &mine {
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
                if margin >= TIE_RAD {
                    fails.push(format!(
                        "config {} lat {lat} lon {} epoch {}: in view {:?} vs Orekit {theirs:?}, \
                         nearest satellite {margin:e} rad from its mask (not a tie)",
                        c.name, s.lon_deg, s.epoch, s.in_view_by_system
                    ));
                }
            }
        }
    }
    let frac = same as f64 / n.max(1) as f64;
    if frac < IN_VIEW_SAMPLE_FRACTION {
        fails.push(format!(
            "config {}: in-view counts identical on {same}/{n} samples ({frac:.4}) < {IN_VIEW_SAMPLE_FRACTION}",
            c.name
        ));
    }
    // Per latitude and group.
    let rows = latitude_sweep_on_states(&c.systems, &c.states, &c.lats, &c.lons, c.threshold);
    let orows = o["rows"].as_array().unwrap();
    let (mut worst_mean, mut worst_rel, mut worst_av) = (0.0_f64, 0.0_f64, 0.0_f64);
    for (r, or) in rows.iter().zip(orows) {
        for (g, mine) in [("gnss", &r.gnss), ("leo", &r.leo), ("fused", &r.fused)] {
            let t = &or[g];
            let dm = (mine.mean_in_view - t["mean_in_view"].as_f64().unwrap()).abs();
            worst_mean = worst_mean.max(dm);
            if dm > MEAN_IN_VIEW_ABS {
                fails.push(format!(
                    "config {} lat {} {g}: mean in view off by {dm}",
                    c.name, r.lat_deg
                ));
            }
            for (k, v) in [
                ("median_pdop", mine.median_pdop),
                ("median_hdop", mine.median_hdop),
                ("median_vdop", mine.median_vdop),
            ] {
                match (v, t[k].as_f64()) {
                    (Some(a), Some(b)) => {
                        let rel = (a - b).abs() / b.abs();
                        worst_rel = worst_rel.max(rel);
                        if rel > MEDIAN_DOP_REL {
                            fails.push(format!(
                                "config {} lat {} {g} {k}: {a} vs oracle {b} (rel {rel:e})",
                                c.name, r.lat_deg
                            ));
                        }
                    }
                    (None, None) => {}
                    (a, b) => fails.push(format!(
                        "config {} lat {} {g} {k}: {a:?} vs oracle {b:?}",
                        c.name, r.lat_deg
                    )),
                }
            }
            let da = (mine.availability - t["availability"].as_f64().unwrap()).abs();
            worst_av = worst_av.max(da);
            if da > AVAILABILITY_ABS {
                fails.push(format!(
                    "config {} lat {} {g}: availability off by {da}",
                    c.name, r.lat_deg
                ));
            }
        }
    }
    assert_eq!(rows.len(), orows.len(), "config {}: latitude count", c.name);
    let summary = format!(
        "config {}: in view identical on {same}/{n} samples (largest mask margin among differing \
         samples {worst_margin_of_diff:e} rad); worst |mean in view| {worst_mean:e}, worst median \
         DOP rel {worst_rel:e}, worst |availability| {worst_av:e}",
        c.name
    );
    (fails, summary)
}

#[test]
fn the_polar_sweep_agrees_with_orekit_and_numpy_on_the_given_states() {
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
        all.join("\n")
    );
}
