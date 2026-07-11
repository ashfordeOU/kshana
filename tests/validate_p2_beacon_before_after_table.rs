// SPDX-License-Identifier: AGPL-3.0-only
//! P2 — REPRODUCIBILITY drift guard for the beacon before/after GDOP table of the
//! surface-beacon-DOP service-volume paper (the -80 deg-user scenario).
//!
//! ## What this pins and what it does NOT
//! The paper's headline before/after magnitudes (median GDOP 16.2 -> 1.6, and the
//! 24-sat comparison 3.4) are outputs of a **specific illustrative geometry +ARE
//! budget assembled in the kshana-pro packaging harness** (per the paper program,
//! the paper's tables/figures are generated there, not in this public repo). Those
//! exact element/beacon choices are NOT present in the public engine, so this test
//! does NOT and CANNOT reproduce the literal 16.2 / 1.6 / 3.4 numbers from public
//! code — asserting them here would be dishonest. They are scenario outputs, not
//! physical constants.
//!
//! What the public engine *does* expose is the mechanism the paper's numbers
//! demonstrate: `dop_with_beacons` collapses the polar GDOP of a sparse orbital
//! set by adding surface-beacon ranging rows, and expanding the constellation is
//! an alternative route to the same end. This test therefore pins the
//! **public-engine reproduction of that before/after table** for a fully-specified
//! public scenario (a 6-sat `illustrative_lcns(6)` snapshot + three surveyed
//! beacons) as a committed golden, reproduced to a tight 1e-9 relative tolerance
//! (a GDOP's last ULPs are platform-dependent — see [`REPRO_REL_TOL`]), so the
//! beacon-augmentation pipeline cannot silently drift. It additionally asserts the qualitative facts
//! the paper's magnitudes illustrate: (a) the three beacons cut the 6-sat GDOP by
//! a large factor; (b) expanding to 24 satellites also drives the GDOP down; and
//! (c) both the beacon and the 24-sat GDOP land below the usable-geometry
//! threshold of 6 while the bare 6-sat geometry does not.
//!
//! The DOP arithmetic underneath every value here is externally validated against
//! gnss_lib_py (`tests/dop_reference.rs`); the beacon-visibility horizon against
//! the L01 closed form; only the *aggregate table for the chosen geometry* is the
//! drift-guarded object.
//!
//! Golden fixture + regenerator: `tests/fixtures/lunar_service/beacon_before_after_golden.csv`
//! and `examples/gen_p2_lunar_service_fixtures.rs`. The scenario below is
//! duplicated verbatim from that generator.

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_beacon::dop_with_beacons;
use kshana::lunar_service::{service_dop, sweep_over_n, LunarConstellation};

type Vec3 = [f64; 3];

const GOLDEN: &str = include_str!("fixtures/lunar_service/beacon_before_after_golden.csv");

fn mask_rad() -> f64 {
    5.0_f64.to_radians()
}

const PDOP_THRESHOLD: f64 = 6.0;

fn site(lat_deg: f64, lon_deg: f64, height_m: f64) -> Vec3 {
    selenographic_to_mcmf(Selenographic {
        lat_rad: lat_deg.to_radians(),
        lon_rad: lon_deg.to_radians(),
        alt_m: height_m,
    })
}

fn p2_user() -> Vec3 {
    site(-80.0, 0.0, 2.0)
}

fn p2_beacons() -> [Vec3; 3] {
    [
        site(-80.0, 0.0, 2_000.0),
        site(-79.0, 60.0, 2_000.0),
        site(-79.0, -60.0, 2_000.0),
    ]
}

fn p2_six_sat_mcmf_t0() -> Vec<Vec3> {
    LunarConstellation::illustrative_lcns(6).positions_mcmf(0.0)
}

fn p2_grid() -> Vec<Selenographic> {
    let lats = [-90.0_f64, -80.0, -70.0];
    let lons = [-120.0_f64, 0.0, 120.0];
    let mut pts = Vec::new();
    for &lat in &lats {
        for &lon in &lons {
            pts.push(Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 0.0,
            });
        }
    }
    pts
}

fn p2_times() -> Vec<f64> {
    (0..=12).map(|k| k as f64 * 3600.0).collect()
}

/// A parsed golden row: label + up to five DOP components (empty = None).
struct GoldenRow {
    label: String,
    gdop: Option<f64>,
    pdop: Option<f64>,
    hdop: Option<f64>,
    vdop: Option<f64>,
    tdop: Option<f64>,
}

fn opt(s: &str) -> Option<f64> {
    if s.is_empty() {
        None
    } else {
        Some(s.parse().unwrap())
    }
}

fn parse_golden() -> Vec<GoldenRow> {
    GOLDEN
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').collect();
            GoldenRow {
                label: c[0].to_string(),
                gdop: opt(c[1]),
                pdop: opt(c[2]),
                hdop: opt(c[3]),
                vdop: opt(c[4]),
                tdop: opt(c[5]),
            }
        })
        .collect()
}

/// Cross-platform reproduction tolerance. The committed golden regenerates bit-for-bit
/// on its origin platform, but a GDOP is the square-root of a trace of the normal-equations
/// inverse `(HᵀH)⁻¹`, whose last ULPs depend on the platform's libm/FMA (x86 vs ARM), so the
/// drift guard compares to a tight *relative* tolerance rather than raw bit-equality. Observed
/// cross-platform jitter here is ~1e-14 relative; any *real* pipeline drift (a changed element
/// set, mask, or DOP formula) moves these values by many orders of magnitude more than this.
const REPRO_REL_TOL: f64 = 1e-9;

/// `a` reproduces `b` to the cross-platform drift-guard tolerance (exact bits, or within
/// [`REPRO_REL_TOL`] relative).
fn reproduces(a: f64, b: f64) -> bool {
    a == b || (a - b).abs() <= REPRO_REL_TOL * a.abs().max(b.abs())
}

fn assert_opt(name: &str, got: Option<f64>, want: Option<f64>) {
    match (got, want) {
        (Some(a), Some(b)) => assert!(reproduces(a, b), "{name} drift: {a:.17e} vs {b:.17e}"),
        (None, None) => {}
        (a, b) => panic!("{name} None/Some drift: {a:?} vs {b:?}"),
    }
}

#[test]
fn beacon_before_after_reproduces_committed_golden_exactly() {
    let user = p2_user();
    let sats = p2_six_sat_mcmf_t0();
    let beacons = p2_beacons();
    let mask = mask_rad();
    let golden = parse_golden();

    // Row 0: 6-sat only.
    let before = service_dop(user, &sats, mask);
    let g0 = &golden[0];
    assert_eq!(g0.label, "6sat_only");
    assert_opt("6sat gdop", before.map(|d| d.gdop), g0.gdop);
    assert_opt("6sat pdop", before.map(|d| d.pdop), g0.pdop);
    assert_opt("6sat hdop", before.map(|d| d.hdop), g0.hdop);
    assert_opt("6sat vdop", before.map(|d| d.vdop), g0.vdop);
    assert_opt("6sat tdop", before.map(|d| d.tdop), g0.tdop);

    // Row 1: 6-sat + 3 beacons.
    let after = dop_with_beacons(user, &sats, &beacons, mask);
    let g1 = &golden[1];
    assert_eq!(g1.label, "6sat_plus_3beacons");
    assert_opt("beacon gdop", after.map(|d| d.gdop), g1.gdop);
    assert_opt("beacon pdop", after.map(|d| d.pdop), g1.pdop);
    assert_opt("beacon hdop", after.map(|d| d.hdop), g1.hdop);
    assert_opt("beacon vdop", after.map(|d| d.vdop), g1.vdop);
    assert_opt("beacon tdop", after.map(|d| d.tdop), g1.tdop);

    // Row 2: 24-sat median GDOP over the P2 volume (alternative-to-beacons row).
    let grid = p2_grid();
    let times = p2_times();
    let sweep24 = sweep_over_n(24, 24, &grid, &times, mask, PDOP_THRESHOLD);
    let g2 = &golden[2];
    assert_eq!(g2.label, "24sat_median");
    assert_opt("24sat gdop_median", sweep24[0].gdop_median, g2.gdop);
}

#[test]
fn beacon_before_after_qualitative_mechanism_holds() {
    let user = p2_user();
    let sats = p2_six_sat_mcmf_t0();
    let beacons = p2_beacons();
    let mask = mask_rad();

    let before = service_dop(user, &sats, mask).expect("6-sat geometry admits a GDOP");
    let after =
        dop_with_beacons(user, &sats, &beacons, mask).expect("6-sat + 3 beacons admits a GDOP");

    // (a) Beacons cut the polar GDOP by a large factor (the P2 mechanism; the
    //     specific 16.2->1.6 magnitude is the pro-harness scenario, this is the
    //     public-engine analogue: a >2x collapse).
    assert!(
        after.gdop < before.gdop,
        "beacons must reduce GDOP: {} -> {}",
        before.gdop,
        after.gdop
    );
    assert!(
        after.gdop < 0.5 * before.gdop,
        "beacons should more than halve the GDOP: {} -> {}",
        before.gdop,
        after.gdop
    );

    // (b) The bare 6-sat geometry is unusable (GDOP > 6) while beacon-augmentation
    //     brings it below the usable threshold — the availability flip P2 reports.
    assert!(
        before.gdop > PDOP_THRESHOLD,
        "the sparse 6-sat geometry should be unusable (GDOP {} > 6)",
        before.gdop
    );
    assert!(
        after.gdop < PDOP_THRESHOLD,
        "beacon-augmented geometry should be usable (GDOP {} < 6)",
        after.gdop
    );

    // (c) Expanding the constellation to 24 sats is an alternative route below 6.
    let grid = p2_grid();
    let times = p2_times();
    let sweep24 = sweep_over_n(24, 24, &grid, &times, mask, PDOP_THRESHOLD);
    let g24 = sweep24[0].gdop_median.expect("24-sat median GDOP defined");
    assert!(
        g24 < PDOP_THRESHOLD,
        "24-sat median GDOP should be usable (got {g24})"
    );
    // And the DOP floor invariant: no reported GDOP is below 1.
    assert!(before.gdop >= 1.0 && after.gdop >= 1.0 && g24 >= 1.0);
}
