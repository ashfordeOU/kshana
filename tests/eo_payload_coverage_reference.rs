// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's EO payload coverage geometry (module `eo_payload`)
//! against two INDEPENDENT third-party oracles, with byte-identical inputs.
//!
//! ORACLE A -- Equatorial ascending-node spacing.
//!   skyfield 1.54 + sgp4 2.26 (B. Rhodes, MIT). A real near-circular LEO TLE is
//!   propagated with the full SGP4 dynamical model (which INCLUDES the J2 nodal
//!   regression and the WGS-72 gravity field that kshana's analytic nodal formula
//!   omits), its WGS-84 ground track is sampled, and the equatorial ascending-node
//!   crossings are found. The mean great-circle longitude shift between >=5
//!   consecutive nodes times R_e is the SGP4 ground node spacing. The oracle ALSO
//!   measures the SGP4 nodal period and that IDENTICAL period is handed to kshana's
//!   `ground_track_spacing_equator(T) = R_e*omega*T`, so the test isolates exactly
//!   one thing: kshana's omission of the J2 nodal-regression term.
//!
//! ORACLE B -- Nadir-to-horizon limb angle and maximum ground range.
//!   A closed-form WGS-84 ray-to-ellipsoid tangent (a=6378137 m, f=1/298.257223563)
//!   computed in numpy -- NOT a re-derivation of kshana's sphere formula. kshana's
//!   spherical `earth_angular_radius(h) = asin(R_e/(R_e+h))` is compared to the
//!   exact ellipsoid limb angle, and kshana's max ground range `R_e*(pi/2 - rho)`
//!   (the horizon central angle) to the ellipsoid geocentric tangent arc.
//!
//! TOLERANCES (envelope -- the residual IS the physical sphere-vs-ellipsoid and
//! the omitted-regression difference, NOT a bug):
//!   - limb angle rho:        within 0.3 deg of the WGS-84 ellipsoid limb angle.
//!   - max ground range:      within 0.5% of the ellipsoid geocentric tangent arc.
//!   - node spacing (validate role, sun-sync EO orbits): within 1.0% of SGP4.
//!   - node spacing (ISS, characterise role, i=51.6 deg): EXPOSED, not hidden --
//!     kshana UNDER-estimates by 0.8..2.0% because the prograde J2 regression it
//!     drops adds to the relative spin; asserted as a directional CHARACTERISATION.
//!
//! HONEST SCOPE: validates the coverage GEOMETRY (limb angle, max ground range,
//! node spacing). It does NOT validate radiometry, MTF, atmospheric refraction,
//! pointing jitter or sun-glint -- kshana models none and neither does the oracle.
//! This is why the capability stays MODELLED: the spherical-Earth nodal model is
//! confirmed accurate for the EO (sun-synchronous) regime and its boundary of
//! validity (the ISS mid-inclination ~1.3% gap) is documented, not papered over.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/eo_payload_coverage_geometry/`.

use kshana::eo_payload::{earth_angular_radius, ground_range, ground_track_spacing_equator};

const REF: &str = include_str!(
    "fixtures/eo_payload_coverage_geometry/eo_payload_coverage_reference.txt"
);

// kshana orbit::R_EARTH_EQUATORIAL_M and forces::EARTH_ROTATION_RATE, mirrored
// here so the test re-derives kshana's node spacing from the oracle's period
// using kshana's OWN constants (the function `ground_track_spacing_equator`
// already bakes them in; this is only for the analytic cross-check display).
const R_EARTH_EQUATORIAL_M: f64 = 6_378_137.0;

const LIMB_DEG_TOL: f64 = 0.30; // deg, sphere-vs-ellipsoid limb envelope
const MAX_GR_REL_TOL: f64 = 0.005; // 0.5%, sphere-arc-vs-ellipsoid-arc envelope
const NODE_VALIDATE_REL_TOL: f64 = 0.010; // 1.0%, sun-sync EO regime
const ISS_GAP_LO: f64 = 0.008; // 0.8% lower bound of the documented regression gap
const ISS_GAP_HI: f64 = 0.020; // 2.0% upper bound

#[test]
fn eo_payload_coverage_matches_skyfield_sgp4_and_wgs84_ellipsoid() {
    let mut n_node_validate = 0usize;
    let mut n_node_char = 0usize;
    let mut n_limb = 0usize;
    let mut worst_limb_deg = 0.0_f64;
    let mut worst_gr_rel = 0.0_f64;
    let mut worst_node_validate_rel = 0.0_f64;

    for line in REF.lines() {
        let line = line.trim();
        if line.starts_with("NODE ") {
            // NODE name | nodal_period_s | sgp4_spacing_km | n_nodes | role
            let parts: Vec<&str> = line.splitn(5, '|').collect();
            assert_eq!(parts.len(), 5, "NODE row needs 5 |-fields: {line}");
            let name = parts[0].trim_start_matches("NODE").trim();
            let period_s: f64 = parts[1].trim().parse().unwrap();
            let sgp4_spacing_km: f64 = parts[2].trim().parse().unwrap();
            let n_nodes: usize = parts[3].trim().parse().unwrap();
            let role = parts[4].trim();

            assert!(
                n_nodes >= 5,
                "NODE {name}: need >=5 ascending nodes for a node-spacing case, got {n_nodes}"
            );

            // kshana's analytic node spacing fed the IDENTICAL SGP4 nodal period.
            let kshana_spacing_km = ground_track_spacing_equator(period_s) / 1000.0;
            let rel = (kshana_spacing_km - sgp4_spacing_km).abs() / sgp4_spacing_km;
            let signed_rel = (kshana_spacing_km - sgp4_spacing_km) / sgp4_spacing_km;

            match role {
                "validate" => {
                    worst_node_validate_rel = worst_node_validate_rel.max(rel);
                    assert!(
                        rel <= NODE_VALIDATE_REL_TOL,
                        "NODE {name}: kshana {kshana_spacing_km:.3} km vs SGP4 \
                         {sgp4_spacing_km:.3} km (rel {:.4}% > {:.1}%) -- sun-sync EO \
                         node spacing should match within {:.1}%",
                        100.0 * rel,
                        100.0 * NODE_VALIDATE_REL_TOL,
                        100.0 * NODE_VALIDATE_REL_TOL,
                    );
                    n_node_validate += 1;
                }
                "characterise" => {
                    // ISS: kshana UNDER-estimates (the dropped prograde J2 regression
                    // would have ADDED to the relative Earth spin). Assert the gap is
                    // present, directional, and within the documented 0.8..2.0% band.
                    assert!(
                        signed_rel < 0.0,
                        "ISS characterisation: expected kshana to UNDER-estimate the \
                         SGP4 node spacing (signed rel {:.4}%)",
                        100.0 * signed_rel,
                    );
                    assert!(
                        (ISS_GAP_LO..=ISS_GAP_HI).contains(&rel),
                        "ISS characterisation: regression gap {:.4}% outside the \
                         documented {:.1}..{:.1}% band (kshana {kshana_spacing_km:.3} \
                         km vs SGP4 {sgp4_spacing_km:.3} km)",
                        100.0 * rel,
                        100.0 * ISS_GAP_LO,
                        100.0 * ISS_GAP_HI,
                    );
                    n_node_char += 1;
                }
                other => panic!("NODE {name}: unknown role {other:?}"),
            }
        } else if line.starts_with("LIMB ") {
            // LIMB altitude_m | geometry | ellipsoid_limb_deg | ellipsoid_max_ground_range_km
            let parts: Vec<&str> = line.splitn(4, '|').collect();
            assert_eq!(parts.len(), 4, "LIMB row needs 4 |-fields: {line}");
            let alt_m: f64 = parts[0].trim_start_matches("LIMB").trim().parse().unwrap();
            let geometry = parts[1].trim();
            let ellip_limb_deg: f64 = parts[2].trim().parse().unwrap();
            let ellip_max_gr_km: f64 = parts[3].trim().parse().unwrap();

            // (b1) limb angle: kshana spherical rho vs WGS-84 ellipsoid limb angle.
            let kshana_rho_deg = earth_angular_radius(alt_m).to_degrees();
            let dlimb = (kshana_rho_deg - ellip_limb_deg).abs();
            worst_limb_deg = worst_limb_deg.max(dlimb);
            assert!(
                dlimb <= LIMB_DEG_TOL,
                "LIMB alt={:.0} km {geometry}: kshana rho={kshana_rho_deg:.4} deg vs \
                 WGS-84 ellipsoid limb {ellip_limb_deg:.4} deg (|d|={dlimb:.4} > {LIMB_DEG_TOL} deg)",
                alt_m / 1000.0,
            );

            // (b2) max ground range: kshana R_e*(pi/2 - rho) (horizon central angle,
            // eps=0) vs the ellipsoid geocentric tangent arc.
            let rho_rad = earth_angular_radius(alt_m);
            let kshana_max_gr_km =
                R_EARTH_EQUATORIAL_M * (std::f64::consts::FRAC_PI_2 - rho_rad) / 1000.0;
            // sanity: kshana's own ground_range at eta=rho equals this horizon arc.
            let gr_from_fn = ground_range(rho_rad, alt_m).unwrap() / 1000.0;
            assert!(
                (gr_from_fn - kshana_max_gr_km).abs() < 1.0,
                "LIMB alt={:.0} km {geometry}: kshana ground_range({rho_rad:.6}) \
                 {gr_from_fn:.3} km disagrees with R_e*(pi/2-rho) {kshana_max_gr_km:.3} km",
                alt_m / 1000.0,
            );
            let gr_rel = (kshana_max_gr_km - ellip_max_gr_km).abs() / ellip_max_gr_km;
            worst_gr_rel = worst_gr_rel.max(gr_rel);
            assert!(
                gr_rel <= MAX_GR_REL_TOL,
                "LIMB alt={:.0} km {geometry}: kshana max ground range \
                 {kshana_max_gr_km:.3} km vs WGS-84 ellipsoid {ellip_max_gr_km:.3} km \
                 (rel {:.4}% > {:.1}%)",
                alt_m / 1000.0,
                100.0 * gr_rel,
                100.0 * MAX_GR_REL_TOL,
            );
            n_limb += 1;
        }
    }

    assert!(
        n_node_validate >= 3,
        "expected >=3 sun-sync node-spacing validation cases, got {n_node_validate}"
    );
    assert!(
        n_node_char >= 1,
        "expected the ISS regression-gap characterisation case, got {n_node_char}"
    );
    assert!(
        n_limb >= 10,
        "expected >=10 WGS-84 limb-angle cases, got {n_limb}"
    );

    eprintln!(
        "eo_payload_coverage_reference: {n_node_validate} sun-sync node cases (worst {:.3}% vs SGP4, \
         tol {:.1}%), 1 ISS regression-gap characterisation, {n_limb} WGS-84 limb cases \
         (worst limb |d|={:.4} deg tol {LIMB_DEG_TOL}, worst max-GR {:.3}% tol {:.1}%)",
        100.0 * worst_node_validate_rel,
        100.0 * NODE_VALIDATE_REL_TOL,
        worst_limb_deg,
        100.0 * worst_gr_rel,
        100.0 * MAX_GR_REL_TOL,
    );
}
