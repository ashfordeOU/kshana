// SPDX-License-Identifier: AGPL-3.0-only
//! Modelled anchor: the common-mode split on a REAL inter-ephemeris disagreement,
//! reproduced against an independent numpy computation.
//!
//! The engine's parity-projection / least-squares linear algebra
//! ([`kshana::lunar_common_mode::common_mode_split`], built on
//! [`kshana::lunar_common_mode::geometry_from_los`]) is checked against
//! `tests/fixtures/common_mode/reference.json`, generated offline by
//! `scripts/gen_common_mode_ref.py` with numpy (`np.linalg.solve`).
//!
//! **What is checked (and what is not claimed).** The lunar constellation geometry is
//! **Modelled** (a fixed, documented user + 8 satellites — see the fixture NOTICE.md);
//! it is not an external oracle and carries no Validated claim. The thing CHECKED
//! is that the engine reproduces the independent numpy common-mode split to relative
//! error < 1e-3 AND absolute error < 1e-3 (metres / dimensionless), on a measurement
//! error derived from the REAL geocentric-Moon disagreement between authoritative
//! ephemerides (DE440 vs INPOP21a and DE440 vs EPM2021), read from
//! `tests/fixtures/inter_ephemeris/moon_geo.csv`.
//!
//! **The science it anchors.** Two providers disagree on the Moon position by
//! `Δs(t) = pos_A − pos_B` (real). A user mixing them sees a common-mode measurement
//! error `δyᵢ = eᵢ·Δs` on satellite `i`. Because the shift is common it lies exactly in
//! `range(G)` for the RAIM rows `gᵢ = [-eᵢ, 1]` (`δy = G·[-Δs; 0]`), so the parity
//! residual is ~zero (ARAIM-invisible) and the user absorbs ≈`Δs` as a position error —
//! the real inter-ephemeris floor is exactly the class ARAIM cannot see.
//!
//! **Consistency of oracle and fixtures.** Every position (user, satellites, each `Δs`)
//! is rounded to 6 decimals BEFORE being both written to the fixture and fed to the numpy
//! oracle; the derived per-satellite `δy` is stored and consumed verbatim by both sides.
//! This test reads the identical `user`, `sats`, and `delta_y` from `reference.json`, so
//! the only difference between engine and oracle is the 4×4 linear solver (Rust
//! Gauss-Jordan `invert4` vs numpy `solve`), which agrees far inside 1e-3. Fixtures are
//! baked in at compile time via `include_str!`; no runtime I/O occurs.

use kshana::lunar_common_mode::{common_mode_split, geometry_from_los};

const REFERENCE_JSON: &str = include_str!("fixtures/common_mode/reference.json");

/// Euclidean norm of a 3-vector.
fn norm3(v: &[f64]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Median of a slice (copies + sorts). Empty slices are impossible here.
fn median(xs: &[f64]) -> f64 {
    let mut v = xs.to_vec();
    v.sort_by(|a, b| a.partial_cmp(b).unwrap());
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

/// Parse a JSON array of f64.
fn as_f64_vec(v: &serde_json::Value) -> Vec<f64> {
    v.as_array()
        .expect("expected JSON array")
        .iter()
        .map(|x| x.as_f64().expect("expected float"))
        .collect()
}

#[test]
fn common_mode_split_matches_numpy_on_real_inter_ephemeris() {
    let root: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("reference.json must be valid JSON");

    // ── Modelled constellation (rebuilt into the engine's geometry) ────────────────────
    let cons = &root["constellation"];
    let user_v = as_f64_vec(&cons["user"]);
    let user: [f64; 3] = [user_v[0], user_v[1], user_v[2]];
    let sats: Vec<[f64; 3]> = cons["sats"]
        .as_array()
        .expect("sats must be an array")
        .iter()
        .map(|s| {
            let a = as_f64_vec(s);
            [a[0], a[1], a[2]]
        })
        .collect();
    let m = sats.len();
    assert!(
        m >= 6,
        "Modelled constellation must have >= 6 satellites; got {m}"
    );

    // The engine geometry under test: rows gᵢ = [-eᵢ, 1], eᵢ = unit(satᵢ − user).
    let g = geometry_from_los(user, &sats)
        .expect("Modelled constellation must yield a full-rank RAIM geometry");
    assert_eq!(g.len(), m, "one geometry row per satellite");
    // eᵢ recovered from the geometry row (gᵢ = [-eᵢ, 1]) for the δy cross-check below.
    let e_unit: Vec<[f64; 3]> = g.iter().map(|row| [-row[0], -row[1], -row[2]]).collect();

    // ── Tolerance: abs < 1e-3 always; rel < 1e-3 where the quantity is above the mm floor.
    //
    // Some quantities are structurally ~zero — the parity residual (`detectable_norm`) and
    // the clock component of `blind_dx` — because a common-mode translation lands exactly
    // in range(G). Their engine-vs-numpy difference is pure roundoff (~1e-13), far under
    // the 1e-3 absolute floor, but a *relative* error is meaningless there (0/0). So we
    // require the tight relative tolerance only where |exp| ≥ the absolute floor; the
    // absolute tolerance is enforced unconditionally on every quantity.
    const ABS_TOL: f64 = 1e-3;
    const REL_TOL: f64 = 1e-3;
    let check = |label: &str, pair: &str, day: f64, got: f64, exp: f64| {
        let abs = (got - exp).abs();
        assert!(
            abs < ABS_TOL,
            "pair={pair} day={day} {label}: absolute error {abs:.3e} >= {ABS_TOL:.0e} \
             (got={got:.8e} exp={exp:.8e})"
        );
        if exp.abs() >= ABS_TOL {
            let rel = abs / exp.abs();
            assert!(
                rel < REL_TOL,
                "pair={pair} day={day} {label}: relative error {rel:.3e} >= {REL_TOL:.0e} \
                 (got={got:.8e} exp={exp:.8e})"
            );
        }
    };

    // ── Walk every record ──────────────────────────────────────────────────────────────
    let records = root["records"]
        .as_array()
        .expect("records must be an array");
    assert!(!records.is_empty(), "reference must carry records");

    let mut n_checked = 0usize;
    let mut blind_fracs: Vec<f64> = Vec::new();
    let mut pos_errs: Vec<f64> = Vec::new();
    let mut det_norms: Vec<f64> = Vec::new();

    for rec in records {
        let pair = rec["pair"].as_str().expect("pair");
        let day = rec["day"].as_f64().expect("day");
        let delta_s = as_f64_vec(&rec["delta_s"]);
        let delta_y = as_f64_vec(&rec["delta_y"]);
        let exp_blind_dx = as_f64_vec(&rec["blind_dx"]);
        let exp_blind_fraction = rec["blind_fraction"].as_f64().expect("blind_fraction");
        let exp_detectable_norm = rec["detectable_norm"].as_f64().expect("detectable_norm");
        let exp_blind_norm = rec["blind_norm"].as_f64().expect("blind_norm");

        assert_eq!(delta_y.len(), m, "one δy per satellite");
        assert_eq!(exp_blind_dx.len(), 4, "blind_dx is 4-D (position+clock)");

        // Cross-check that the stored δy really is the LOS projection of the real Δs on
        // the engine's own geometry: δyᵢ = eᵢ·Δs. This ties the checked linear algebra
        // to the real inter-ephemeris data (not an arbitrary measurement vector).
        for (i, e) in e_unit.iter().enumerate() {
            let dy_i = e[0] * delta_s[0] + e[1] * delta_s[1] + e[2] * delta_s[2];
            let abs = (dy_i - delta_y[i]).abs();
            assert!(
                abs < 1e-6,
                "pair={pair} day={day} sat={i}: stored δy {:.8e} != eᵢ·Δs {:.8e} (Δ={abs:.3e})",
                delta_y[i],
                dy_i
            );
        }

        // The engine split under test.
        let split = common_mode_split(&g, &delta_y)
            .expect("nonzero real δy on a full-rank geometry must split");

        for (k, (&got, &exp)) in split.blind_dx.iter().zip(&exp_blind_dx).enumerate() {
            check(&format!("blind_dx[{k}]"), pair, day, got, exp);
        }
        check(
            "blind_fraction",
            pair,
            day,
            split.blind_fraction,
            exp_blind_fraction,
        );
        check(
            "detectable_norm",
            pair,
            day,
            split.detectable_norm,
            exp_detectable_norm,
        );
        check("blind_norm", pair, day, split.blind_norm, exp_blind_norm);

        blind_fracs.push(split.blind_fraction);
        pos_errs.push(norm3(&split.blind_dx[0..3]));
        det_norms.push(split.detectable_norm);
        n_checked += 1;
    }

    assert_eq!(
        n_checked,
        records.len(),
        "every record must be checked ({} total)",
        records.len()
    );
    assert!(
        n_checked >= 2 * 300,
        "expected the full two-pair record set (~732); got {n_checked}"
    );

    // ── Sanity anchors ─────────────────────────────────────────────────────────────────
    //
    // The load-bearing real-data fact is the ABSORBED-ERROR MAGNITUDE: it equals the ~metre
    // inter-ephemeris floor (|blind_dx_pos| ≈ ‖Δs‖, checked below to lie in 0.1–5 m). The
    // blind_fraction ≈ 1 and the ~0 parity residual are the analytic identity, guaranteed by
    // the common-shift construction (δy = G·[−Δs; 0] ∈ range(G)) — not an empirical finding;
    // they are asserted here only to confirm they hold at real magnitudes.
    let med_bf = median(&blind_fracs);
    let med_pos = median(&pos_errs);
    let med_det = median(&det_norms);
    let med_blind_norm_ref = median(
        &records
            .iter()
            .map(|r| r["blind_norm"].as_f64().unwrap())
            .collect::<Vec<_>>(),
    );

    println!(
        "\nreproduced {n_checked} real-data common-mode splits (2 pairs × 366 epochs)\n\
         median blind_fraction   = {med_bf:.9}\n\
         median |blind_dx_pos|   = {med_pos:.4} m   (the absorbed inter-ephemeris floor)\n\
         median detectable_norm  = {med_det:.3e} m   (parity residual — what ARAIM sees)\n"
    );

    assert!(
        med_bf > 0.99,
        "the common-mode translation must be ~fully blind: median blind_fraction = {med_bf}"
    );
    assert!(
        (0.1..=5.0).contains(&med_pos),
        "absorbed position error must be the ~metre inter-ephemeris floor (0.1–5 m); \
         median = {med_pos} m"
    );
    // The parity residual is structurally ~zero (range(G) error) — negligible next to the
    // several-metre blind position error it accompanies.
    assert!(
        med_det < 1e-6 * med_blind_norm_ref,
        "parity residual must be negligible (ARAIM-invisible): median detectable_norm = \
         {med_det:.3e} m vs median blind_norm = {med_blind_norm_ref:.3} m"
    );
}
