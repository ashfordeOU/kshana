// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's lunar navigation **service-volume geometry**
//! (`lunar_service`) against an **independent third-party authority**: ANISE 0.10.2's
//! Keplerian two-body orbit (`anise::astro::Orbit` — Christopher Rabotin / Nyx Space
//! Foundation, MPL-2.0).
//!
//! ## What this validates
//!
//! kshana's [`kshana::lunar_service::LunarSat::position_mci`] propagates an elliptical
//! lunar-orbit satellite by a hand-rolled Newton-Raphson solution of Kepler's equation
//! and a 3-1-3 perifocal rotation. ANISE builds the same Keplerian elements through
//! GMAT's `StateConversionUtil::ComputeKeplToCart` and propagates with `Orbit::at_epoch`,
//! a **completely independent** code path (equinoctial mean-longitude advance + ANISE's
//! own Kepler solver). Two independent Kepler solvers fed byte-identical elements + GM
//! must agree — this is a genuine external cross-check of kshana's MCI propagation, the
//! same library-vs-library kind of validation DOP gets against gnss_lib_py and Lambert
//! gets against lamberthub.
//!
//! On top of the MCI states we re-derive the **topocentric elevation** of every satellite
//! at every selenographic grid point / epoch (reducing the ANISE MCI states to MCMF with
//! kshana's own `mci_to_mcmf`, the trivial shared frame rotation) and require kshana's
//! [`kshana::lunar_service::visible_sat_positions`] to produce the **exact same
//! visible-satellite count and SET** as the one derived from ANISE — at every sample.
//!
//! ## Honest scope (the moat)
//!
//! This validates the **propagation + visibility geometry** of the service-volume method
//! and NOTHING ELSE. It does NOT validate: the DOP kernel (separately validated vs
//! gnss_lib_py — `tests/dop_reference.rs`); the LunaNet LNIS σ_URE / ARAIM
//! protection-level budget (a published-parameter MODELLED composition); or the
//! constellation parameters (illustrative, public-source — not the real Moonlight/LCNS
//! ephemeris). The fixture is the pinned ANISE output; the oracle generator lives in
//! `xval/anise-service-geometry/` (workspace-excluded, own Cargo.lock — so CI needs no
//! ANISE/MPL-2.0 dependency). Provenance + reproduce steps are in the fixture header.

use kshana::lunar::{mci_to_mcmf, selenographic_to_mcmf, Selenographic};
use kshana::lunar_service::{visible_sat_positions, LunarSat};

const REF: &str =
    include_str!("fixtures/lunar_navigation_service_volume/service_geometry_reference.txt");

type Vec3 = [f64; 3];

// --- Must mirror the fixture header / xval/anise-service-geometry generator exactly. ---
const N_SATS: usize = 8;
const SMA_KM: f64 = kshana::lunar::R_MOON_M / 1000.0 + 8_000.0;
const ECC: f64 = 0.6;
const INC_DEG: f64 = 57.7;
const ARGP_DEG: f64 = 90.0;
const ELEV_MASK_DEG: f64 = 5.0;

/// Per-satellite MCI position tolerance. Two independent Kepler solvers iterate to
/// machine precision, so the realised residual is sub-micron; the bound is a tight 1 mm
/// absolute floor (with a tiny relative term for the ~1.5e7 m apolune radius) — well
/// inside the planned 1 m, and tight enough to catch any real propagation bug.
const MCI_ABS_TOL_M: f64 = 1.0e-3;
const MCI_REL_TOL: f64 = 1.0e-9;

/// The k-th default satellite — byte-identical to `LunarServiceScenario::run`.
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

fn approx(got: f64, want: f64) -> bool {
    (got - want).abs() <= MCI_REL_TOL * want.abs() + MCI_ABS_TOL_M
}

#[test]
fn mci_position_matches_anise_keplerian() {
    let sats: Vec<LunarSat> = (0..N_SATS).map(|k| nth_sat(k, N_SATS)).collect();

    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        let line = line.trim();
        if !line.starts_with("MCI ") {
            continue;
        }
        // MCI <ei> <si> <t_s> <x_m> <y_m> <z_m>
        let f: Vec<&str> = line.split_whitespace().collect();
        assert_eq!(f.len(), 7, "MCI row needs 7 fields: {line}");
        let si: usize = f[2].parse().unwrap();
        let t_s: f64 = f[3].parse().unwrap();
        let want = [
            f[4].parse::<f64>().unwrap(),
            f[5].parse::<f64>().unwrap(),
            f[6].parse::<f64>().unwrap(),
        ];
        // Oracle must be a non-trivial position (guard against an all-zero fixture).
        let rmag = (want[0] * want[0] + want[1] * want[1] + want[2] * want[2]).sqrt();
        assert!(rmag > 1.0e6, "MCI si={si} t={t_s}: trivial oracle position");

        let got = sats[si].position_mci(t_s);
        for (axis, (g, w)) in [("x", 0usize), ("y", 1), ("z", 2)]
            .iter()
            .map(|(ax, i)| (*ax, (got[*i], want[*i])))
        {
            worst = worst.max((g - w).abs());
            assert!(
                approx(g, w),
                "MCI si={si} t={t_s}s {axis}: kshana {g:.6} vs ANISE {w:.6} \
                 (|Δ|={:.3e} m > {:.3e})",
                (g - w).abs(),
                MCI_REL_TOL * w.abs() + MCI_ABS_TOL_M
            );
        }
        n += 1;
    }

    assert_eq!(
        n,
        N_SATS * 12,
        "expected {} MCI comparisons (8 sats x 12 epochs), got {n}",
        N_SATS * 12
    );
    eprintln!(
        "lunar_navigation_service_volume MCI: {n} cases vs ANISE 0.10.2 Keplerian, \
         worst |Δ| = {worst:.3e} m"
    );
}

#[test]
fn visible_satellite_set_matches_anise_exactly() {
    let sats: Vec<LunarSat> = (0..N_SATS).map(|k| nth_sat(k, N_SATS)).collect();
    let mask = ELEV_MASK_DEG.to_radians();

    let mut n = 0usize;
    let mut total_visible = 0usize;
    let mut counts_seen = std::collections::BTreeSet::new();
    let mut sets_seen = std::collections::BTreeSet::new();
    for line in REF.lines() {
        let line = line.trim();
        if !line.starts_with("VIS ") {
            continue;
        }
        // VIS <ei> <gi> <t_s> <lat_deg> <lon_deg> <n_visible> <indices|->
        let f: Vec<&str> = line.split_whitespace().collect();
        assert_eq!(f.len(), 8, "VIS row needs 8 fields: {line}");
        let t_s: f64 = f[3].parse().unwrap();
        let lat_deg: f64 = f[4].parse().unwrap();
        let lon_deg: f64 = f[5].parse().unwrap();
        let want_n: usize = f[6].parse().unwrap();
        let want_set: Vec<usize> = if f[7] == "-" {
            Vec::new()
        } else {
            f[7].split(',').map(|x| x.parse().unwrap()).collect()
        };
        assert_eq!(want_set.len(), want_n, "VIS n != set len: {line}");

        // Reconstruct the constellation MCMF positions at this epoch with kshana's own
        // propagation + frame reduction, exactly as `coverage` / `run` do internally.
        let sats_mcmf: Vec<Vec3> = sats
            .iter()
            .map(|s| mci_to_mcmf(s.position_mci(t_s), t_s))
            .collect();

        let user = selenographic_to_mcmf(Selenographic {
            lat_rad: lat_deg.to_radians(),
            lon_rad: lon_deg.to_radians(),
            alt_m: 0.0,
        });

        // kshana's visible set, recovered as the index set (positions are identical).
        let vis = visible_sat_positions(user, &sats_mcmf, mask);
        let mut kshana_set: Vec<usize> = vis
            .iter()
            .filter_map(|v| sats_mcmf.iter().position(|p| p == v))
            .collect();
        kshana_set.sort_unstable();

        assert_eq!(
            kshana_set.len(),
            want_n,
            "VIS t={t_s}s lat={lat_deg} lon={lon_deg}: kshana visible count {} != ANISE {want_n}",
            kshana_set.len()
        );
        assert_eq!(
            kshana_set, want_set,
            "VIS t={t_s}s lat={lat_deg} lon={lon_deg}: kshana visible SET {:?} != ANISE {:?}",
            kshana_set, want_set
        );

        total_visible += want_n;
        counts_seen.insert(want_n);
        sets_seen.insert(f[7].to_string());
        n += 1;
    }

    assert_eq!(
        n,
        7 * 6 * 12,
        "expected {} visibility samples (7 lat x 6 lon x 12 epochs), got {n}",
        7 * 6 * 12
    );
    // The visibility test must be genuinely exercised: a real spread of counts and many
    // distinct sets, not a degenerate "all satellites always visible".
    assert!(
        counts_seen.len() >= 3,
        "visible-count spread too narrow ({} values) — set test not exercised",
        counts_seen.len()
    );
    assert!(
        sets_seen.len() >= 20,
        "too few distinct visible sets ({}) — set test not exercised",
        sets_seen.len()
    );
    eprintln!(
        "lunar_navigation_service_volume VIS: {n} (grid,epoch) samples vs ANISE 0.10.2, \
         {} total visible slots, counts {:?}, {} distinct sets — all match exactly",
        total_visible,
        counts_seen,
        sets_seen.len()
    );
}
