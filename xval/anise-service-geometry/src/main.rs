// SPDX-License-Identifier: AGPL-3.0-only
//! `service-geometry-xval` — independent cross-validation of kshana's lunar navigation
//! **service-volume geometry** against ANISE 0.10's Keplerian two-body orbit.
//!
//! ## What is validated
//!
//! kshana's [`kshana::lunar_service::LunarSat::position_mci`] is a hand-rolled
//! Newton-Raphson Kepler-equation propagator (solve `M = E − e sin E`, form the true
//! anomaly, rotate the perifocal vector by the 3-1-3 RAAN/inc/argp sequence). ANISE
//! ([`anise::astro::Orbit`], a.k.a. `CartesianState`) builds the same Keplerian elements
//! through GMAT's `StateConversionUtil::ComputeKeplToCart` algorithm and propagates with
//! `Orbit::at_epoch` — a **completely independent** code path: it converts to *equinoctial*
//! elements, advances the equinoctial mean longitude at the two-body mean motion, then
//! converts back through ANISE's own Kepler solver (`mean_anomaly_to_true_anomaly_rad`).
//! Two independent Kepler solvers, fed byte-identical elements + GM, must agree.
//!
//! We then derive, from the ANISE-propagated MCI states, the **topocentric elevation**
//! of every satellite at every selenographic grid point and epoch — applying the *same*
//! `mci_to_mcmf` mean-rotation reduction kshana uses (the frame reduction is a trivial
//! shared z-rotation; the load-bearing, independently-computed input to it is the ANISE
//! MCI position) — and the resulting **visible-satellite SET** above the 5° elevation
//! mask. This must match kshana's [`kshana::lunar_service::visible_sat_positions`]
//! visible count and set **exactly** at every (grid, epoch) sample.
//!
//! ## Honest scope
//!
//! This validates the **propagation + visibility geometry** of the service-volume method:
//! the orbital state of the illustrative LCNS-class constellation and the elevation-mask
//! visibility test built on it. It does NOT validate (and does not claim to): the DOP
//! kernel (separately validated vs gnss_lib_py — `tests/dop_reference.rs`), the LunaNet
//! LNIS σ_URE / ARAIM protection-level budget (published-parameter MODELLED composition),
//! or the constellation parameters themselves (illustrative, public-source; not the real
//! Moonlight/LCNS ephemeris). It is a genuine *external* check that kshana propagates the
//! Kepler orbit and computes visibility correctly — nothing more, nothing less.
//!
//! ## Oracle
//!
//! ANISE 0.10.2 — pure-Rust NAIF/SPICE reimplementation, Christopher Rabotin / Nyx Space
//! Foundation, MPL-2.0. `anise::astro::orbit::Orbit::try_keplerian_mean_anomaly` +
//! `Orbit::at_epoch`. No SPICE kernels are needed: this is pure two-body Kepler with the
//! Moon's GM supplied directly via `Frame::with_mu_km3_s2`.
//!
//! Reproduce: `cargo run --release` in this crate (own Cargo.lock; workspace-excluded).
//! Writes `report.json` + the committed fixture
//! `../../tests/fixtures/lunar_navigation_service_volume/service_geometry_reference.txt`.

use anise::constants::orientations::J2000;
use anise::frames::Frame;
use anise::prelude::Orbit;
use hifitime::Epoch;
use kshana::lunar::{mci_to_mcmf, selenographic_to_mcmf, Selenographic, MOON_GM_M3_S2, R_MOON_M};
use kshana::lunar_service::{visible_sat_positions, LunarSat};
use serde::Serialize;
use std::io::Write;

type Vec3 = [f64; 3];

/// NAIF id for the Moon (301). Only the *id* is used to tag the inertial frame; the
/// dynamics come entirely from the GM we attach below — no ephemeris is loaded.
const MOON_NAIF_ID: i32 = 301;

/// Default scenario constellation element template (matches `lunar_service::run` /
/// `LunarServiceScenario::default`): 8 satellites on a shared elliptical, south-favouring
/// orbit, phased evenly in RAAN and mean anomaly.
const N_SATS: usize = 8;
const SMA_KM: f64 = R_MOON_M / 1000.0 + 8_000.0;
const ECC: f64 = 0.6;
const INC_DEG: f64 = 57.7;
const ARGP_DEG: f64 = 90.0;
const ELEV_MASK_DEG: f64 = 5.0;

/// Build the k-th default satellite exactly as `LunarServiceScenario::run` does.
fn nth_sat(k: usize, n: usize) -> LunarSat {
    LunarSat {
        sma_m: SMA_KM * 1000.0,
        eccentricity: ECC,
        inc_deg: INC_DEG,
        raan_deg: 360.0 * (k as f64) / (n as f64),
        argp_deg: ARGP_DEG,
        mean_anom_deg: 360.0 * (k as f64) / (n as f64),
    }
}

/// A denser service-volume grid than the default 4-lat sweep, to exercise the visibility
/// set agreement over a fuller southern service volume: 7 latitudes × 6 longitudes.
fn grid() -> Vec<Selenographic> {
    let lats: Vec<f64> = (0..7).map(|i| -90.0 + 10.0 * i as f64).collect(); // -90 .. -30
    let lons: Vec<f64> = (0..6).map(|j| -180.0 + 60.0 * j as f64).collect(); // -180 .. 120
    let mut g = Vec::new();
    for &lat in &lats {
        for &lon in &lons {
            g.push(Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 0.0,
            });
        }
    }
    g
}

/// 12 hourly epochs (seconds past the MCI/MCMF-aligned epoch), matching the default
/// 12-h horizon / 60-min step.
fn epochs() -> Vec<f64> {
    (0..12).map(|k| k as f64 * 3600.0).collect()
}

#[derive(Serialize)]
struct Report {
    oracle: String,
    oracle_version: String,
    oracle_license: String,
    quantity: String,
    n_sats: usize,
    n_grid_points: usize,
    n_epochs: usize,
    n_mci_comparisons: usize,
    n_visibility_samples: usize,
    worst_mci_abs_err_m: f64,
    worst_mci_rel_err: f64,
    visibility_set_mismatches: usize,
    visible_count_total_kshana: usize,
    visible_count_total_anise: usize,
}

fn main() {
    // The Moon-centred J2000 inertial frame, with the Moon's GM attached so ANISE's
    // Keplerian element conversion and two-body propagation use byte-identical dynamics
    // to kshana (kshana's mean motion n = sqrt(MOON_GM_M3_S2 / a^3)).
    let mu_km3_s2 = MOON_GM_M3_S2 / 1.0e9; // m^3/s^2 -> km^3/s^2
    let moon_j2000 = Frame::new(MOON_NAIF_ID, J2000).with_mu_km3_s2(mu_km3_s2);

    // Epoch 0 == kshana's t_s = 0 (the MCI/MCMF-aligned epoch). We use J2000 as the
    // absolute zero; only *offsets* (t_s) matter for two-body propagation.
    let epoch0 = Epoch::from_tdb_seconds(0.0);

    let sats: Vec<LunarSat> = (0..N_SATS).map(|k| nth_sat(k, N_SATS)).collect();

    // Build each ANISE orbit at epoch 0 from the SAME classical elements kshana uses.
    let anise0: Vec<Orbit> = sats
        .iter()
        .map(|s| {
            Orbit::try_keplerian_mean_anomaly(
                s.sma_m / 1000.0, // km
                s.eccentricity,
                s.inc_deg,
                s.raan_deg,
                s.argp_deg,
                s.mean_anom_deg,
                epoch0,
                moon_j2000,
            )
            .expect("ANISE Keplerian orbit construction")
        })
        .collect();

    let grid = grid();
    let times = epochs();
    let mask = ELEV_MASK_DEG.to_radians();
    let sin_mask = mask.sin();

    let mut worst_abs = 0.0_f64;
    let mut worst_rel = 0.0_f64;
    let mut n_mci = 0usize;
    let mut set_mismatch = 0usize;
    let mut vis_kshana_total = 0usize;
    let mut vis_anise_total = 0usize;
    let mut n_vis_samples = 0usize;

    // Fixture lines accumulate here.
    let mut fixture = String::new();

    for (ei, &t) in times.iter().enumerate() {
        // --- ANISE-propagated MCI states (the oracle) ---
        let anise_mci: Vec<Vec3> = anise0
            .iter()
            .map(|o| {
                let p = o
                    .at_epoch(epoch0 + hifitime::Duration::from_seconds(t))
                    .expect("ANISE two-body propagation")
                    .radius_km;
                [p[0] * 1000.0, p[1] * 1000.0, p[2] * 1000.0] // km -> m
            })
            .collect();

        // --- kshana-propagated MCI states (the model under test) ---
        let kshana_mci: Vec<Vec3> = sats.iter().map(|s| s.position_mci(t)).collect();

        // Per-satellite MCI position comparison and one fixture row per (sat, epoch).
        for (si, (k, a)) in kshana_mci.iter().zip(&anise_mci).enumerate() {
            let d = [a[0] - k[0], a[1] - k[1], a[2] - k[2]];
            let abs = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            let mag = (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt().max(1.0);
            worst_abs = worst_abs.max(abs);
            worst_rel = worst_rel.max(abs / mag);
            n_mci += 1;
            // MCI row: oracle (ANISE) state, so the Rust test can re-derive everything.
            fixture.push_str(&format!(
                "MCI {ei} {si} {t:.6} {:.9} {:.9} {:.9}\n",
                a[0], a[1], a[2]
            ));
        }

        // --- Visibility SET comparison on the grid, both built from the SAME oracle
        // MCI states reduced to MCMF, vs kshana built from its own MCI states reduced
        // to MCMF. (The mci_to_mcmf rotation is the trivial shared frame reduction; the
        // independently-computed input is the ANISE MCI position.) ---
        let anise_mcmf: Vec<Vec3> = anise_mci.iter().map(|&r| mci_to_mcmf(r, t)).collect();
        let kshana_mcmf: Vec<Vec3> = kshana_mci.iter().map(|&r| mci_to_mcmf(r, t)).collect();

        for (gi, &g) in grid.iter().enumerate() {
            let user = selenographic_to_mcmf(g);

            // Oracle visible set: indices of satellites whose elevation >= mask, from
            // the ANISE-derived MCMF positions, computed here independently of kshana.
            let mut anise_set: Vec<usize> = Vec::new();
            let up = {
                let n = (user[0] * user[0] + user[1] * user[1] + user[2] * user[2]).sqrt();
                [user[0] / n, user[1] / n, user[2] / n]
            };
            for (si, s) in anise_mcmf.iter().enumerate() {
                let dd = [s[0] - user[0], s[1] - user[1], s[2] - user[2]];
                let nn = (dd[0] * dd[0] + dd[1] * dd[1] + dd[2] * dd[2]).sqrt();
                if nn == 0.0 {
                    continue;
                }
                let e = [dd[0] / nn, dd[1] / nn, dd[2] / nn];
                let sin_el = e[0] * up[0] + e[1] * up[1] + e[2] * up[2];
                if sin_el >= sin_mask {
                    anise_set.push(si);
                }
            }

            // kshana visible set: same indices, via kshana's own visibility function on
            // kshana's own MCMF states. We recover the index set by matching positions.
            let kshana_vis = visible_sat_positions(user, &kshana_mcmf, mask);
            let mut kshana_set: Vec<usize> = Vec::new();
            for v in &kshana_vis {
                // Match by exact position identity (kshana returns the same Vec3 values).
                if let Some(idx) = kshana_mcmf.iter().position(|p| p == v) {
                    kshana_set.push(idx);
                }
            }
            kshana_set.sort_unstable();
            anise_set.sort_unstable();

            vis_kshana_total += kshana_set.len();
            vis_anise_total += anise_set.len();
            n_vis_samples += 1;
            if kshana_set != anise_set {
                set_mismatch += 1;
                eprintln!(
                    "VIS MISMATCH ei={ei} gi={gi} lat={:.1} lon={:.1}: kshana={:?} anise={:?}",
                    g.lat_rad.to_degrees(),
                    g.lon_rad.to_degrees(),
                    kshana_set,
                    anise_set
                );
            }

            // Fixture row: the oracle visible SET + count for this (epoch, grid point).
            let set_str = if anise_set.is_empty() {
                "-".to_string()
            } else {
                anise_set
                    .iter()
                    .map(|i| i.to_string())
                    .collect::<Vec<_>>()
                    .join(",")
            };
            fixture.push_str(&format!(
                "VIS {ei} {gi} {t:.6} {:.9} {:.9} {} {}\n",
                g.lat_rad.to_degrees(),
                g.lon_rad.to_degrees(),
                anise_set.len(),
                set_str
            ));
        }
    }

    let report = Report {
        oracle: "ANISE astro::Orbit Keplerian two-body (try_keplerian_mean_anomaly + at_epoch)".to_string(),
        oracle_version: "0.10.2".to_string(),
        oracle_license: "MPL-2.0 (Christopher Rabotin / Nyx Space Foundation)".to_string(),
        quantity: "per-satellite MCI position (m) + derived elevation/visible-set on the selenographic grid".to_string(),
        n_sats: N_SATS,
        n_grid_points: grid.len(),
        n_epochs: times.len(),
        n_mci_comparisons: n_mci,
        n_visibility_samples: n_vis_samples,
        worst_mci_abs_err_m: worst_abs,
        worst_mci_rel_err: worst_rel,
        visibility_set_mismatches: set_mismatch,
        visible_count_total_kshana: vis_kshana_total,
        visible_count_total_anise: vis_anise_total,
    };

    // Header for the committed fixture.
    let mu_str = format!("{mu_km3_s2:.9}");
    let header = format!(
        "# SPDX-License-Identifier: AGPL-3.0-only\n\
         # Reference geometry for kshana lunar navigation service volume (module lunar_service).\n\
         # Oracle: ANISE 0.10.2 astro::Orbit Keplerian two-body propagator\n\
         #         (try_keplerian_mean_anomaly + at_epoch, equinoctial two-body),\n\
         #         Christopher Rabotin / Nyx Space Foundation, MPL-2.0.\n\
         #         An INDEPENDENT Kepler solver (GMAT-derived element conversion +\n\
         #         equinoctial mean-longitude advance) vs kshana's Newton-Raphson Kepler.\n\
         # Generated by xval/anise-service-geometry (workspace-excluded; own Cargo.lock).\n\
         #   Reproduce: cargo run --release  (in that crate)\n\
         # Constellation (kshana default scenario template): {N_SATS} sats,\n\
         #   sma_km={SMA_KM}, ecc={ECC}, inc_deg={INC_DEG}, argp_deg={ARGP_DEG},\n\
         #   raan_deg = mean_anom_deg = 360*k/{N_SATS} for k=0..{N_SATS}.\n\
         # Moon GM (km^3/s^2) attached to the ANISE frame: {mu_str}\n\
         #   (= kshana MOON_GM_M3_S2 = {MOON_GM_M3_S2} m^3/s^2 / 1e9).\n\
         # R_MOON_M = {R_MOON_M}; elevation mask = {ELEV_MASK_DEG} deg.\n\
         # Grid: 7 lat (-90..-30 step 10) x 6 lon (-180..120 step 60) = {} pts;\n\
         #   12 epochs (0..39600 s, 3600 s step).\n\
         # Row formats:\n\
         #   MCI <ei> <si> <t_s> <x_m> <y_m> <z_m>   (ANISE MCI position of sat si at epoch ei)\n\
         #   VIS <ei> <gi> <t_s> <lat_deg> <lon_deg> <n_visible> <sat_indices|->\n\
         #     (ANISE-derived visible-satellite SET at grid point gi, epoch ei, above mask)\n\
         # Honest scope: validates the PROPAGATION + VISIBILITY GEOMETRY only. The DOP\n\
         #   kernel (vs gnss_lib_py) and the LunaNet LNIS ARAIM PL budget are validated /\n\
         #   modelled elsewhere; the constellation is illustrative public-source, not the\n\
         #   real Moonlight/LCNS ephemeris.\n",
        grid.len(),
    );

    let dir = env!("CARGO_MANIFEST_DIR");
    let fixture_path = format!(
        "{dir}/../../tests/fixtures/lunar_navigation_service_volume/service_geometry_reference.txt"
    );
    std::fs::create_dir_all(format!(
        "{dir}/../../tests/fixtures/lunar_navigation_service_volume"
    ))
    .expect("create fixture dir");
    {
        let mut f = std::fs::File::create(&fixture_path).expect("create fixture file");
        f.write_all(header.as_bytes()).unwrap();
        f.write_all(fixture.as_bytes()).unwrap();
    }

    std::fs::write(
        format!("{dir}/report.json"),
        serde_json::to_string_pretty(&report).expect("serialize report"),
    )
    .expect("write report.json");

    eprintln!(
        "service-geometry-xval: {} MCI comparisons (worst |Δ| = {:.3e} m, rel {:.3e}); \
         {} visibility samples, {} set mismatches (kshana visible total {}, anise {}).",
        report.n_mci_comparisons,
        report.worst_mci_abs_err_m,
        report.worst_mci_rel_err,
        report.n_visibility_samples,
        report.visibility_set_mismatches,
        report.visible_count_total_kshana,
        report.visible_count_total_anise,
    );

    // Fail loudly if the oracle and kshana disagree beyond a defensible tolerance.
    assert!(
        report.worst_mci_abs_err_m < 1.0,
        "MCI position disagreement {:.3e} m exceeds 1 m",
        report.worst_mci_abs_err_m
    );
    assert_eq!(
        report.visibility_set_mismatches, 0,
        "visible-satellite SET must match ANISE exactly at every (grid, epoch)"
    );
}
