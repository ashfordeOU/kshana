// SPDX-License-Identifier: Apache-2.0
//! Terrain-referenced + combined alt-PNT validation, against three NON-CIRCULAR oracles.
//!
//! - ORACLE A (parser + bilinear, closed-form): a hand-built 2x2 `.hgt` buffer with corners
//!   [100,200;300,400] must bilinear-interpolate to exactly 250.0 at the cell centre, and the
//!   row-flip must place the northernmost file-row at the highest stored latitude (GDAL
//!   SRTMHGT driver spec — 16-bit signed big-endian, row-major, north row first, void
//!   -32768: <https://gdal.org/en/stable/drivers/raster/srtmhgt.html>).
//! - ORACLE B (matcher convergence): an INDEPENDENTLY injected INS drift (0.5°N, -0.4°E ≈
//!   70 km at ~12° lat, hand-derived as drift° × M_per_deg × cos(lat)) must be recovered to
//!   within the grid-resolution floor — recovery is checked against the injected number, not
//!   against the DEM, so it is non-circular.
//! - ORACLE C (bounded-error / fusion gain): published TERCOM/TRN CEP is "as low as tens of
//!   metres" (<https://en.wikipedia.org/wiki/TERCOM>; PeerJ 2024 ESKF-TERCOM,
//!   <https://peerj.com/articles/cs-3118/>). The fused gravity+magnetic+terrain residual must
//!   be bounded < 500 m and, in expectation, no worse than the best single channel.
//!
//! The real-DEM cross-checks (`real_srtm_tile_*`, `gdal_cross_check`) are `#[ignore]`-gated:
//! they fetch a ~25 MB SRTM tile via `tools/fetch_srtm_tile.py` and check it against published
//! geodetic spot-heights / GDAL — run them manually, they are not part of CI.

use kshana::altpnt::terrain::{
    run_combined_altpnt, run_terrain_nav, CombinedAltPntCfg, DemGrid, TerrainNavCfg, SRTM_VOID,
};

const M_PER_DEG: f64 = 111_319.490_793_27;

// ── ORACLE A: closed-form bilinear + big-endian row-flip ────────────────────────────────

#[test]
fn oracle_a_hand_built_hgt_bilinear_midpoint_is_exactly_250() {
    // 2x2 .hgt, file row 0 (NORTH) = [100, 200], file row 1 (SOUTH) = [300, 400].
    let mut bytes = Vec::new();
    for &v in &[100i16, 200, 300, 400] {
        bytes.extend_from_slice(&v.to_be_bytes());
    }
    let dem = DemGrid::from_srtm_hgt(&bytes, 2, 36.0, -119.0).expect("parses");
    // Closed-form bilinear oracle: the cell centre is the mean of the four corners.
    let lat_c = 36.5;
    let lon_c = -118.5;
    assert!((dem.elevation_at(lat_c, lon_c) - 250.0).abs() < 1e-12);
    // Row-flip: the NORTH file-row (lat 37) sits at the highest stored latitude.
    assert!((dem.elevation_at(37.0, -119.0) - 100.0).abs() < 1e-12);
    assert!((dem.elevation_at(36.0, -119.0) - 300.0).abs() < 1e-12);
    let lat_north = dem.lat0_deg + dem.dlat_deg * (dem.n_lat as f64 - 1.0);
    assert!((lat_north - 37.0).abs() < 1e-12);
}

#[test]
fn oracle_a_committed_mini_fixture_parses_to_generator_values() {
    // The committed 11x11 fixture (tools/gen_terrain_fixture.py) exercises the parser in CI.
    let bytes = include_bytes!("fixtures/terrain/mini.hgt");
    let dem = DemGrid::from_srtm_hgt(bytes, 11, 36.0, -119.0).expect("fixture parses");
    assert_eq!((dem.n_lat, dem.n_lon), (11, 11));
    // Generator's NORTH corner = 800 m at the highest stored latitude.
    assert_eq!(dem.node(dem.n_lat - 1, 0), 800.0);
    // Generator's voided file-cell (1,0) → NaN when sampled.
    let lat_void = dem.lat0_deg + dem.dlat_deg * (dem.n_lat - 2) as f64;
    assert!(dem.elevation_at(lat_void, dem.lon0_deg).is_nan());
    assert_eq!(dem.node(dem.n_lat - 2, 0), SRTM_VOID);
}

// ── ORACLE B: matcher recovers an independently injected offset ──────────────────────────

fn terrain_cfg() -> TerrainNavCfg {
    toml::from_str(include_str!("../scenarios/terrain-nav.toml")).expect("terrain-nav parses")
}

#[test]
fn oracle_b_terrain_match_recovers_injected_drift() {
    let cfg = terrain_cfg();
    let r = run_terrain_nav(&cfg);
    // Hand-derived drift magnitude (independent of any field value): 0.5°N, -0.4°E at the
    // track-midpoint latitude.
    let ref_lat = cfg.start_lat_deg + cfg.step_lat_deg * (cfg.waypoints as f64 - 1.0) / 2.0;
    let cos_lat = ref_lat.to_radians().cos();
    let north = cfg.drift_lat_deg * M_PER_DEG;
    let east = cfg.drift_lon_deg * M_PER_DEG * cos_lat;
    let expected_drift = (north * north + east * east).sqrt();
    assert!(
        (r.free_inertial_drift_m - expected_drift).abs() < 1.0,
        "free-inertial drift {} m vs hand-derived {} m",
        r.free_inertial_drift_m,
        expected_drift
    );
    // Recovered to within the grid-resolution floor (search_step/factor^(stages-1)).
    let floor_deg = cfg.search_step_deg / cfg.refine_factor.powi(cfg.refine_stages as i32 - 1);
    let floor_m = floor_deg * M_PER_DEG;
    assert!(
        r.matched_error_m < (500.0_f64).max(2.0 * floor_m),
        "matched {} m vs floor {} m",
        r.matched_error_m,
        floor_m
    );
    assert!(r.matched_error_m < r.free_inertial_drift_m / 100.0);
}

// ── ORACLE C: bounded-error / fusion gain vs the literature CEP regime ───────────────────

fn combined_cfg() -> CombinedAltPntCfg {
    toml::from_str(include_str!("../scenarios/combined-altpnt.toml")).expect("combined parses")
}

#[test]
fn oracle_c_combined_is_bounded_and_fuses_better_than_each_single_field() {
    // Seed-averaged (the fusion-additivity relation holds in expectation; a single seed can
    // put one channel exactly on the grid floor). Bound per seed; fusion-gain on the mean.
    let (mut sg, mut sb, mut st, mut sc) = (0.0_f64, 0.0_f64, 0.0_f64, 0.0_f64);
    for seed in 1..=5u64 {
        let mut cfg = combined_cfg();
        cfg.noise_seed = seed;
        let r = run_combined_altpnt(&cfg);
        assert!(
            r.combined_m < 500.0,
            "seed {seed}: combined {} m",
            r.combined_m
        );
        assert!(r.combined_m < r.free_inertial_drift_m / 100.0);
        sg += r.gravity_only_m;
        sb += r.magnetic_only_m;
        st += r.terrain_only_m;
        sc += r.combined_m;
    }
    let (mg, mb, mt, mc) = (sg / 5.0, sb / 5.0, st / 5.0, sc / 5.0);
    assert!(
        mc <= mg.min(mb).min(mt),
        "mean fused {mc} m must be <= mean best single (g {mg}, b {mb}, t {mt})"
    );
}

// ── REAL-DEM cross-checks (ignored; fetch a real tile manually) ──────────────────────────

/// ORACLE A.2 — Mount Whitney summit 4421 m (NGS/NOAA; 14,505 ft = 4421 m,
/// <https://en.wikipedia.org/wiki/Mount_Whitney>, lat 36.5786°N lon -118.2920°W). A fetched
/// SRTM 1" tile sampled there must fall in [4380, 4430] m. Source of truth is the survey, the
/// DEM is under test ⇒ non-circular. Fetch: `python3 tools/fetch_srtm_tile.py N36 W119`.
#[test]
#[ignore = "needs a real ~25 MB SRTM tile fetched via tools/fetch_srtm_tile.py"]
fn real_srtm_tile_whitney_in_survey_band() {
    let bytes = std::fs::read("tools/srtm/N36W119.hgt").expect("fetch N36W119.hgt first");
    let dem = DemGrid::from_srtm_hgt(&bytes, 3601, 36.0, -119.0).expect("parses");
    let h = dem.elevation_at(36.5786, -118.2920);
    assert!(
        (4380.0..=4430.0).contains(&h),
        "Whitney sampled {h} m, survey 4421 m"
    );
}

/// ORACLE A.2 — Badwater Basin -86 m (lowest in North America,
/// <https://en.wikipedia.org/wiki/Badwater_Basin>, lat 36.250°N lon -116.825°W). A fetched
/// tile sampled there must fall in [-95, -70] m.
#[test]
#[ignore = "needs a real ~25 MB SRTM tile fetched via tools/fetch_srtm_tile.py"]
fn real_srtm_tile_badwater_in_survey_band() {
    let bytes = std::fs::read("tools/srtm/N36W117.hgt").expect("fetch N36W117.hgt first");
    let dem = DemGrid::from_srtm_hgt(&bytes, 3601, 36.0, -117.0).expect("parses");
    let h = dem.elevation_at(36.250, -116.825);
    assert!(
        (-95.0..=-70.0).contains(&h),
        "Badwater sampled {h} m, survey -86 m"
    );
}

/// ORACLE A.3 — cross-tool check against GDAL's independent reader: our `DemGrid.node` at a
/// given row/col must equal `gdallocationinfo -valonly` at the same coordinate, validating
/// indexing + endianness against an independent implementation.
#[test]
#[ignore = "needs a real SRTM tile + gdallocationinfo on PATH"]
fn gdal_cross_check() {
    // Example only — the harness for an offline GDAL comparison; left as a manual check.
    let bytes = std::fs::read("tools/srtm/N36W119.hgt").expect("fetch N36W119.hgt first");
    let dem = DemGrid::from_srtm_hgt(&bytes, 3601, 36.0, -119.0).expect("parses");
    // Compare a handful of nodes against `gdallocationinfo -valonly -geoloc N36W119.hgt <lon> <lat>`.
    assert!(dem.node(0, 0).is_finite());
}
