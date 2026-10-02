// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison for the whole `moonlight-service-volume` sweep on real, retrieved
//! constellation geometry (row "Lunar service volume from real, retrieved constellation
//! geometry"): coverage, DOP, the protection-level envelope and the sigma_URE requirement it
//! implies, as the scenario report emits them, against an oracle that computes every one of
//! them with library code.
//!
//! ## Why a new oracle (round 2 amendment, 2026-10-02)
//!
//! `tests/lunar_service_volume_orekit_oracle.rs` compared positions (Orekit propagation) and 30
//! coverage and DOP statistics, but its driver computed visibility, the geometry matrix and the
//! statistics with project-written Java, and nothing external computed the protection levels or
//! the sigma_URE requirement, the quantity this row is about. Here the oracle takes visibility
//! and DOP from Orekit's own `DOPComputer` and `TopocentricFrame`, the protection levels from
//! Hipparchus linear algebra, special functions and root solvers, and solves the requirement
//! directly (per sample, without the engine's linear-scaling identity), on geometry Orekit
//! propagates or interpolates itself.
//!
//! ## Pre-registration (written before the driver below was run and before the engine's
//! report was computed for any of these configurations)
//!
//! * Quantities, per run, from the scenario report (`kshana::api::run_toml`, kind
//!   `moonlight-service-volume`): `coverage_pct`, `n_samples`, `min_sats`, `max_sats`,
//!   `pdop_min`, `pdop_mean`, `pdop_max`, `n_pl_samples`, `hpl_min_m`, `hpl_max_m`,
//!   `vpl_min_m`, `vpl_max_m`, `pl_availability_pct`, and from `ephemeris_comparison.ephemeris`
//!   `hpl_p95_m`, `sigma_required_m`, `sigma_required_p95_m`.
//! * Geometries (all five retrieved inputs the row names): LNCSS cases A, B and C
//!   (`tests/fixtures/lunar_ephemeris/lncss_case_{a,b,c}_navi613.csv`) on the OP-frame
//!   ephemeris-grade path (`planetary_kernel_path` = the cut DE440 kernel of the Orekit
//!   comparison, `epoch_utc` = 2025-11-09T00:00:00); the LANS demonstration constellation
//!   (`lans_demo_ntrs20250009447.csv`, ICRF elements, two-body); the four real lunar orbiters
//!   (`horizons_lunar_orbiters_2023001_12h.csv`, tabulated JPL Horizons states).
//! * Configurations (both with `elev_mask_deg` 5, `pdop_threshold` 6, `alert_limit_m` 50,
//!   `p_hmi` 1e-4, `sigma_ure_m` 30, `horizon_hours` 12): S, the bundled scenario's grid
//!   (latitude -90 to -60 step 10, longitude -180 to 180 step 60, `step_min` 60); D, a dense
//!   south-polar grid (latitude -90 to -80 step 1, longitude -180 to 180 step 15, `step_min`
//!   10). Ten runs.
//! * Oracle (Library): Orekit 12.2 with Hipparchus 3.1 (Apache-2.0), run as a separate program,
//!   `xval/orekit-lunar-service/LunarServiceRequirementOracle.java`, output committed as
//!   `tests/fixtures/lunar_service_requirement_orekit_oracle/orekit_requirement.csv`.
//!   - Geometry: LNCSS by Orekit's NumericalPropagator exactly as in the Orekit comparison
//!     (OP frame at the epoch, J2 + C22 in Orekit's IAU Moon frame, Earth and Sun from Orekit's
//!     DE440, Moon-centred ICRF axes); LANS by Orekit's KeplerianPropagator from the ICRF
//!     elements (true anomaly) at the stated TDB epoch with the engine's lunar GM
//!     4.902800118e12 m^3/s^2 (an input); the orbiters by Orekit's Hermite interpolator on
//!     positions only (nine nodes, the engine's Lagrange order 8) of the same table, TDB epoch
//!     from the file. Moon-fixed frame: Orekit's IAU Moon body frame.
//!   - Users: the engine's grid rule (inclusive latitude steps; longitudes without the
//!     duplicated wrap meridian) on Orekit's `OneAxisEllipsoid` of radius 1737.4 km and
//!     flattening 0.
//!   - Visibility and DOP: `DOPComputer.create(moon, point).withMinElevation(5 deg)` for the
//!     visible count and PDOP; the protection-level satellites from
//!     `TopocentricFrame.getElevation` at or above the mask, their line-of-sight in the
//!     topocentric (east, north, zenith) frame Orekit builds. The driver aborts if the two
//!     visible counts differ.
//!   - Protection levels: for six or more visible satellites, the single-fault MHSS bound with
//!     zero nominal bias, per-satellite prior 1e-4, false-alert 1e-5 split two-sided over the
//!     n hypotheses, budget p_hmi / 2 per axis: `(G^T G)^-1` by Hipparchus `LUDecomposition`
//!     for the all-in-view and each exclusion sub-geometry (a singular sub-geometry drops its
//!     mode, a singular all-in-view drops the sample); vertical variance the zenith entry,
//!     horizontal the east plus north entries; `K_fa` from Hipparchus `Erf.erfcInv`; tails
//!     from `Erf.erfc`; each protection level by Hipparchus `BracketingNthOrderBrentSolver`.
//!     The FORM of this bound is transcribed from the same published equation the engine
//!     implements, as in the validated "Lunar ARAIM protection-level kernel" row: the oracle
//!     checks the evaluation and the assembly over the service volume, not the choice of
//!     equation.
//!   - The requirement: for each protection-level sample, the sigma at which its HPL equals the
//!     alert limit, by Brent's method on sigma (re-solving the protection level at each trial
//!     sigma, so the engine's linear-scaling identity is not assumed); `sigma_required` is the
//!     smallest of them; `sigma_required_p95` the sigma at which the nearest-rank 95th
//!     percentile HPL equals the alert limit (the same order statistic taken over the
//!     per-sample sigmas). Absent when no sample admits a protection level.
//! * Tolerances (fixed now): `n_samples` equal; `min_sats`, `max_sats` within 1; coverage and
//!   protection-level availability within **2 percentage points** (the plan's coverage bar);
//!   `pdop_min`, `pdop_mean`, `pdop_max` within **5 %** (the plan's PDOP bar); `n_pl_samples`
//!   within 1 % (and zero on both sides or on neither); `hpl_min_m`, `hpl_max_m`,
//!   `vpl_min_m`, `vpl_max_m`, `hpl_p95_m`, `sigma_required_m`, `sigma_required_p95_m` within
//!   **1 %** relative, each present on both sides or on neither (where no sample admits a DOP
//!   or a protection level, both sides give the report's documented sentinel 0 for the PDOP
//!   and envelope fields and leave the two sigma requirements absent). The 1 % bar comes from the
//!   pre-registered position bar of the Orekit comparison: 100 m at the closest user range
//!   (about 720 km) turns a line of sight by at most 1.4e-4 rad, and a protection level, a
//!   sigma times a dilution factor, moves by that times the geometry's conditioning, below 1 %
//!   for conditioning under about 70. PROMOTE only if every value of all ten runs passes.
//! * Mutations to show the comparison discriminates (each must turn the strict test red,
//!   then be reverted by editing the file back): the Earth third body removed from
//!   `EphemerisForceModel::de440`; the requirement taken at the 95th-percentile HPL instead of
//!   the worst sample in `sigma_required_m`'s caller.
//! * Disclosed before running: the Orekit comparison's positions (worst 4.633 m) and its 30
//!   statistics; the row's own recorded facts that LANS admits no protection level and the
//!   four orbiters give 0 % coverage (from the engine's lib tests and the round-1 record); the
//!   engine lib test that runs LNCSS case A on the OP path for 2 h and checks only the report's
//!   structure. No value of these ten runs has been computed.
//!
//! ## Result (2026-10-02, first run, nothing tuned): FAILS on one of ten runs; a FINDING
//!
//! * The oracle's self-check against the RTKLIB + SciPy protection-level fixture: worst
//!   1.5e-8 m over its seven cases.
//! * 155 of 160 values within their bars. All sixteen values agree for LNCSS A and C in both
//!   configurations (for example the dense-grid requirement, case A 3.879072208 m both sides,
//!   case C 8.500303972 / 8.500303973 m; worst HPL case A 386.690404161 / 386.690404186 m),
//!   for LNCSS B on the bundled grid, and for LANS and the orbiters (no protection-level sample
//!   on either side, requirement absent on both, coverage 23.61 / 24.15 % and 0 % equal).
//! * Outside, all on LNCSS B, dense grid, all worst-sample statistics of near-singular
//!   geometries (PDOP up to about 1e6): `pdop_mean` 275.16 vs 373.62, `pdop_max` 1.154e6 vs
//!   1.873e6, `hpl_max_m` 1.626e6 vs 0.993e6, `vpl_max_m` 1.347e8 vs 0.352e8,
//!   `sigma_required_m` 0.000923 vs 0.001511 m (Kshana vs Orekit). The robust companions agree
//!   on the same run: `hpl_p95_m` 917.81 vs 917.01, `sigma_required_p95_m` 1.6343 vs 1.6357 m,
//!   `pdop_min`, `hpl_min_m` to 1e-9; `n_pl_samples` 19 007 vs 19 006 (the engine admits one
//!   geometry Hipparchus's LU calls singular). On geometry this degenerate the metre-level
//!   position agreement (worst 4.6 m) is amplified past any fixed bar: the pre-registered 1 %
//!   argument assumed conditioning below about 70. The worst-sample requirement the row emits
//!   is then a property of numerical degeneracy, not of the constellation; a conditioning
//!   guard in the engine would change the emitted quantity and needs its own pre-registration
//!   and a founder decision. The strict test stays ignored; `lncss_b_dense_finding_is_unchanged`
//!   pins the five gaps and the eleven agreements of that run.
//! * Mutations (reverted by editing back): the Earth third body removed: besides LNCSS B, case
//!   A's dense-grid `pdop_mean` (590.4 vs 54.8) and `pdop_max` move outside; the requirements
//!   stay inside (over 12 h the Earth's pull moves these orbits far less than over the
//!   15-day position comparison), so this mutation discriminates weakly here. The requirement
//!   taken at the 95th-percentile HPL instead of the worst sample: `sigma_required_m` outside
//!   on LNCSS A (both grids), B (bundled) and C (both grids), for example A dense 4.532 vs
//!   3.879 m.

use serde_json::Value;

const FIXTURE: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lunar_service_requirement_orekit_oracle/orekit_requirement.csv"
);
const PP_TOL: f64 = 2.0;
const DOP_REL_TOL: f64 = 0.05;
const PL_REL_TOL: f64 = 0.01;

/// (run label, ephemeris file, OP-frame path?)
const GEOMETRIES: [(&str, &str, bool); 5] = [
    ("lncss_a", "lncss_case_a_navi613.csv", true),
    ("lncss_b", "lncss_case_b_navi613.csv", true),
    ("lncss_c", "lncss_case_c_navi613.csv", true),
    ("lans", "lans_demo_ntrs20250009447.csv", false),
    ("orbiters", "horizons_lunar_orbiters_2023001_12h.csv", false),
];

/// (config label, TOML grid and sampling lines)
const CONFIGS: [(&str, &str); 2] = [
    (
        "S",
        "lat_min_deg = -90.0\nlat_max_deg = -60.0\nlat_step_deg = 10.0\nlon_min_deg = -180.0\n\
         lon_max_deg = 180.0\nlon_step_deg = 60.0\nstep_min = 60.0\n",
    ),
    (
        "D",
        "lat_min_deg = -90.0\nlat_max_deg = -80.0\nlat_step_deg = 1.0\nlon_min_deg = -180.0\n\
         lon_max_deg = 180.0\nlon_step_deg = 15.0\nstep_min = 10.0\n",
    ),
];

/// The compared fields, in fixture column order after `run,config`.
const FIELDS: [&str; 16] = [
    "n_samples",
    "min_sats",
    "max_sats",
    "coverage_pct",
    "pdop_min",
    "pdop_mean",
    "pdop_max",
    "n_pl_samples",
    "hpl_min_m",
    "hpl_max_m",
    "vpl_min_m",
    "vpl_max_m",
    "pl_availability_pct",
    "hpl_p95_m",
    "sigma_required_m",
    "sigma_required_p95_m",
];

fn scenario_toml(file: &str, op: bool, config: &str) -> String {
    let dir = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/");
    let mut s = format!(
        "kind = \"moonlight-service-volume\"\nephemeris_path = \"{dir}lunar_ephemeris/{file}\"\n\
         horizon_hours = 12.0\nelev_mask_deg = 5.0\npdop_threshold = 6.0\n\
         alert_limit_m = 50.0\np_hmi = 1e-4\nsigma_ure_m = 30.0\n{config}"
    );
    if op {
        s.push_str(&format!(
            "planetary_kernel_path = \"{dir}lunar_service_volume_orekit_oracle/\
             de440s_2025-11-09_15d.bsp\"\nepoch_utc = \"2025-11-09T00:00:00\"\n"
        ));
    }
    s
}

/// The engine's values for one run, in `FIELDS` order (`None` = absent).
fn kshana_values(file: &str, op: bool, config: &str) -> Vec<Option<f64>> {
    let out = kshana::api::run_toml(&scenario_toml(file, op, config)).expect("scenario run");
    let j: Value = serde_json::from_str(&out.json).expect("report JSON");
    let row = &j["ephemeris_comparison"]["ephemeris"];
    FIELDS
        .iter()
        .map(|f| {
            let v = if j.get(*f).is_some() {
                &j[*f]
            } else {
                &row[*f]
            };
            v.as_f64()
        })
        .collect()
}

/// The oracle's rows: (run, config) -> values in `FIELDS` order (`NA` = absent).
fn oracle() -> Vec<(String, String, Vec<Option<f64>>)> {
    std::fs::read_to_string(FIXTURE)
        .expect("oracle fixture")
        .lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("run,") && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 2 + FIELDS.len(), "bad row: {l}");
            let vals = f[2..]
                .iter()
                .map(|x| (*x != "NA").then(|| x.parse::<f64>().expect("number")))
                .collect();
            (f[0].to_string(), f[1].to_string(), vals)
        })
        .collect()
}

/// Whether one field passes its pre-registered bar.
fn passes(field: &str, k: Option<f64>, o: Option<f64>) -> bool {
    match (k, o) {
        (None, None) => true,
        (Some(k), Some(o)) => match field {
            "n_samples" => k == o,
            "min_sats" | "max_sats" => (k - o).abs() <= 1.0,
            "coverage_pct" | "pl_availability_pct" => (k - o).abs() <= PP_TOL,
            "pdop_min" | "pdop_mean" | "pdop_max" => {
                (k == 0.0 && o == 0.0) || ((k - o) / o).abs() <= DOP_REL_TOL
            }
            "n_pl_samples" => {
                (k == 0.0 && o == 0.0) || (k > 0.0 && o > 0.0 && ((k - o) / o).abs() <= 0.01)
            }
            _ => (k == 0.0 && o == 0.0) || (o != 0.0 && ((k - o) / o).abs() <= PL_REL_TOL),
        },
        _ => false,
    }
}

/// The pre-registered comparison: every value of all ten runs within its bar.
#[test]
#[ignore = "fails: 155/160; LNCSS B dense grid pdop_mean, pdop_max, hpl_max_m, vpl_max_m, sigma_required_m outside on near-singular geometry; finding M076"]
fn service_volume_report_matches_the_library_oracle_on_all_retrieved_geometries() {
    let rows = oracle();
    assert_eq!(rows.len(), 10, "five geometries x two configurations");
    let mut failures = Vec::new();
    for (run, file, op) in GEOMETRIES {
        for (cfg, lines) in CONFIGS {
            let (_, _, o) = rows
                .iter()
                .find(|(r, c, _)| r == run && c == cfg)
                .unwrap_or_else(|| panic!("oracle row {run} {cfg}"));
            let k = kshana_values(file, op, lines);
            for (i, field) in FIELDS.iter().enumerate() {
                let ok = passes(field, k[i], o[i]);
                eprintln!(
                    "M076 {run:<8} {cfg} {field:<22} Kshana {:>16} Orekit {:>16} {}",
                    k[i].map_or("absent".into(), |v| format!("{v:.9}")),
                    o[i].map_or("absent".into(), |v| format!("{v:.9}")),
                    if ok { "ok" } else { "OUTSIDE" }
                );
                if !ok {
                    failures.push(format!("{run} {cfg} {field}"));
                }
            }
        }
    }
    assert!(
        failures.is_empty(),
        "outside the pre-registered bars: {failures:?}"
    );
}

/// Pins the finding: on LNCSS B, dense grid, exactly the five worst-sample statistics fall
/// outside their bars and the other eleven values agree.
#[test]
fn lncss_b_dense_finding_is_unchanged() {
    let rows = oracle();
    let (_, _, o) = rows
        .iter()
        .find(|(r, c, _)| r == "lncss_b" && c == "D")
        .expect("oracle row");
    let (_, file, op) = GEOMETRIES[1];
    let k = kshana_values(file, op, CONFIGS[1].1);
    let outside: Vec<&str> = FIELDS
        .iter()
        .enumerate()
        .filter(|(i, f)| !passes(f, k[*i], o[*i]))
        .map(|(_, f)| *f)
        .collect();
    assert_eq!(
        outside,
        [
            "pdop_mean",
            "pdop_max",
            "hpl_max_m",
            "vpl_max_m",
            "sigma_required_m"
        ],
        "the recorded LNCSS B dense-grid gaps moved"
    );
    let sr = k[14].expect("requirement");
    assert!(
        (0.0008..0.0011).contains(&sr),
        "the engine's worst-sample requirement was 0.000923 m, now {sr}"
    );
}
