// SPDX-License-Identifier: AGPL-3.0-only
//! P2 — **VALIDATION** of the beacon before/after GDOP table against an INDEPENDENT
//! numpy DOP oracle (upgrades `tests/validate_p2_beacon_before_after_table.rs` from
//! "Reproducible" to "Validated").
//!
//! ## What this validates and why it is non-circular
//! The paper's headline is that adding surface ranging beacons collapses the polar
//! GDOP of a sparse orbital set (its illustrative pro-harness scenario shows the
//! ~16.2 -> 1.6 magnitude). This test validates the *public-engine* before/after GDOP
//! table for the fully-specified public scenario (a -80 deg south-polar user, the
//! 6-sat `illustrative_lcns(6)` snapshot at t0, and three surveyed beacons):
//!
//! * The **geometry** — the satellites-only LOS set and the satellites+beacons
//!   augmented LOS set, plus the user's ENU basis — is reconstructed from Kshana's
//!   public API (`visible_sat_positions`, `visible_beacons`, `orbit::los_unit`) and
//!   asserted to match the committed fixture vectors (geometry stability).
//! * The **before GDOP, after GDOP, and their ratio** are checked against a committed
//!   reference computed FROM SCRATCH in numpy (`(HᵀH)⁻¹`; see
//!   `tests/fixtures/p2_independent_dop/gen_p2_independent_dop.py`) — a different code
//!   path from Kshana's Rust `orbit::dop` / `dop_with_beacons`.
//!
//! This validates the mechanism the paper's table demonstrates (beacons strictly cut
//! the polar GDOP, by the independently-computed factor) for the public geometry, and
//! is honest that the literal pro-harness magnitude is a separate scenario output.
//!
//! No Python at runtime: the numpy reference lives in the committed CSV.

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_beacon::{dop_with_beacons, visible_beacons};
use kshana::lunar_service::{service_dop, visible_sat_positions, LunarConstellation};
use kshana::orbit::{enu_basis, los_unit};

type Vec3 = [f64; 3];

const REF: &str = include_str!("fixtures/p2_independent_dop/beacon_before_after_reference.csv");

const REL_TOL: f64 = 1e-6;
const GEOM_TOL: f64 = 1e-12;

fn mask_rad() -> f64 {
    5.0_f64.to_radians()
}

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

fn rel_diff(got: f64, want: f64) -> f64 {
    (got - want).abs() / want.abs().max(1e-12)
}

fn parse_los(field: &str) -> Vec<Vec3> {
    field
        .split('|')
        .map(|tok| {
            let mut it = tok.split(':').map(|v| v.parse::<f64>().unwrap());
            [it.next().unwrap(), it.next().unwrap(), it.next().unwrap()]
        })
        .collect()
}

struct ConfigRef {
    label: String,
    n_src: usize,
    ref_gdop: f64,
    ref_hdop: f64,
    ref_vdop: f64,
    los: Vec<Vec3>,
}

fn parse_ref() -> Vec<ConfigRef> {
    REF.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').collect();
            ConfigRef {
                label: c[0].to_string(),
                n_src: c[1].parse().unwrap(),
                ref_gdop: c[2].parse().unwrap(),
                ref_hdop: c[3].parse().unwrap(),
                ref_vdop: c[4].parse().unwrap(),
                los: parse_los(c[5]),
            }
        })
        .collect()
}

fn assert_los_matches(label: &str, got: &[Vec3], want: &[Vec3]) {
    assert_eq!(
        got.len(),
        want.len(),
        "{label}: LOS count {} vs fixture {}",
        got.len(),
        want.len()
    );
    for (i, (g, w)) in got.iter().zip(want).enumerate() {
        for k in 0..3 {
            assert!(
                (g[k] - w[k]).abs() <= GEOM_TOL,
                "{label}: LOS[{i}][{k}] geometry drift {:.17e} vs fixture {:.17e}",
                g[k],
                w[k]
            );
        }
    }
}

#[test]
fn beacon_before_after_gdop_and_ratio_match_independent_numpy() {
    let user = p2_user();
    let mask = mask_rad();
    let sats = LunarConstellation::illustrative_lcns(6).positions_mcmf(0.0);
    let beacons = p2_beacons();
    let refs = parse_ref();
    assert_eq!(refs.len(), 2, "before + after rows");
    assert_eq!(refs[0].label, "sats_only");
    assert_eq!(refs[1].label, "sats_plus_beacons");

    // ------- Row 0: satellites only (before). -------
    let vis_sats = visible_sat_positions(user, &sats, mask);
    let los_before: Vec<Vec3> = vis_sats.iter().filter_map(|&s| los_unit(user, s)).collect();
    assert_eq!(los_before.len(), refs[0].n_src, "before: source count");
    assert_los_matches("before", &los_before, &refs[0].los);
    let before = service_dop(user, &sats, mask).expect("6-sat only admits a GDOP");

    // ------- Row 1: satellites + visible beacons (after). -------
    let vis_beacons = visible_beacons(user, &beacons);
    let mut sources = vis_sats.clone();
    sources.extend(vis_beacons.iter().copied());
    let los_after: Vec<Vec3> = sources.iter().filter_map(|&s| los_unit(user, s)).collect();
    assert_eq!(los_after.len(), refs[1].n_src, "after: source count");
    assert_los_matches("after", &los_after, &refs[1].los);
    let after =
        dop_with_beacons(user, &sats, &beacons, mask).expect("6-sat + beacons admits a GDOP");

    // (1) DOP number validation: before/after GDOP (and H/V) vs INDEPENDENT numpy.
    for (label, d, r) in [("before", before, &refs[0]), ("after", after, &refs[1])] {
        assert!(r.ref_gdop > 0.0, "{label}: trivial oracle");
        for (name, got, want) in [
            ("GDOP", d.gdop, r.ref_gdop),
            ("HDOP", d.hdop, r.ref_hdop),
            ("VDOP", d.vdop, r.ref_vdop),
        ] {
            let rd = rel_diff(got, want);
            assert!(
                rd <= REL_TOL,
                "{label}: {name} kshana {got:.9e} vs numpy {want:.9e} (rel {rd:.2e} > {REL_TOL:.0e})"
            );
        }
    }

    // (2) The before/after ratio (the "beacons collapse the polar GDOP" magnitude for
    //     the public geometry) matches the INDEPENDENT numpy ratio.
    let kshana_ratio = before.gdop / after.gdop;
    let numpy_ratio = refs[0].ref_gdop / refs[1].ref_gdop;
    let rd = rel_diff(kshana_ratio, numpy_ratio);
    assert!(
        rd <= REL_TOL,
        "before/after ratio kshana {kshana_ratio:.9} vs numpy {numpy_ratio:.9} (rel {rd:.2e})"
    );

    // (3) The mechanism is real: beacons strictly cut the GDOP (ratio > 1), for the
    //     public geometry, and the ENU basis is well-defined.
    assert!(
        numpy_ratio > 1.0,
        "beacon augmentation must reduce GDOP (independent ratio {numpy_ratio:.3} <= 1)"
    );
    assert!(
        enu_basis(user).is_some(),
        "ENU basis defined at the -80 deg user"
    );

    println!(
        "beacon before/after: GDOP kshana {:.6}->{:.6} (ratio {:.4}) == numpy {:.6}->{:.6} (ratio {:.4})",
        before.gdop, after.gdop, kshana_ratio, refs[0].ref_gdop, refs[1].ref_gdop, numpy_ratio
    );
}
