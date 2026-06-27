// SPDX-License-Identifier: AGPL-3.0-only
//! Externally anchor the **CAI cited error-model parameter sheet**
//! (`inertial::cai_params` / `inertial::quantum_imu::CaiAccelerometer`) against the
//! PUBLISHED single-instrument sensitivity figures of three named, real cold-atom
//! interferometers, plus the textbook interferometer geometry.
//!
//! Two distinct external claims are checked, with two DIFFERENT honest strengths:
//!
//! * **(A) Exact geometry (tight, <1e-9 rel).** For each instrument's published
//!   config `(λ, T, N, C, T_c)`, kshana's phase→acceleration scale factor
//!   `k_eff·T²` ([`CaiAccelerometer::scale_factor`]) and the single-fringe (`2π`)
//!   ambiguity-limited acceleration `2π/(k_eff·T²)` must reproduce the **independent
//!   algebraic identity** `2π/((4π/λ)·T²) = λ/(2·T²)`. kshana forms `4π/λ` then
//!   `2π/scale`; the oracle forms `λ/(2T²)` directly — a genuinely different
//!   reduction, so agreement is a real cross-check of the geometry, not a tautology.
//!   (Kasevich & Chu, PRL 67, 181 (1991); Peters, Chung & Chu, Metrologia 38, 25
//!   (2001).)
//!
//! * **(B) Shot-noise floor (one-sided bracket).** kshana's shot-noise- (standard-
//!   quantum-) limited acceleration ASD `n_a` ([`CaiAccelerometer::accel_asd`]) for
//!   each published config is compared **one-sided** against that instrument's
//!   PUBLISHED achieved short-term sensitivity: a real device is technical-/
//!   vibration-noise-limited and so sits ABOVE its quantum-projection-noise floor.
//!   The physically-correct relation is `kshana_SQL_floor ≤ published_achieved`,
//!   and within ~2 orders (same physical sensor, not at the SQL). This is a
//!   **bracket**, not parity — the capability is therefore **MODELLED**.
//!
//! Named instruments (primary sources transcribed in the fixture generator):
//!   1. Freier 2016 "GAIN" mobile gravimeter — J. Phys.: Conf. Ser. 723, 012050
//!      (2016), arXiv:1512.05660 — 96 nm/s²/√Hz short-term noise.
//!   2. Exail/Muquans AQG-B — Ménoret et al., Sci. Rep. 8, 12300 (2018),
//!      arXiv:1809.04908 — 500 nm/s²/√Hz at a quiet site, T=60 ms, 2 Hz, C=40%.
//!   3. CARIOQA-PMP space CAI — HosseiniArani et al., arXiv:2404.10471 (2024),
//!      Table 1 SOA-in-space: 2T=5 s, N=5e5, ~5e-10 m/s²/√Hz (PMP target 1e-10).
//!
//! HONEST SCOPE — what this DOES anchor: the exact interferometer geometry (scale
//! factor + fringe ambiguity) for three real published configs to <1e-9 rel, and
//! that kshana's modelled shot-noise floor lies below + within ~2 orders of each
//! published achieved sensitivity. What it does NOT do: claim parity with any
//! device's achieved noise (published devices sit ~8×–60× above their SQL floor),
//! nor model their vibration/wavefront/fringe-ambiguity systematics, nor imply
//! flight heritage. Hence MODELLED, not Validated.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/cai_cited_error_model_sheet/`.

use kshana::inertial::quantum_imu::CaiAccelerometer;

const REF: &str =
    include_str!("fixtures/cai_cited_error_model_sheet/cai_cited_error_model_sheet_reference.txt");

/// Exact-geometry relative tolerance for the scale factor and the fringe-ambiguity
/// acceleration. Both are pure `f64` arithmetic of the same closed form reached two
/// different ways, so the residual is float round-off only.
const GEOM_REL: f64 = 1e-9;
/// Upper end of the "same physical sensor" band: a published achieved sensitivity
/// must lie below 200× the modelled SQL floor (i.e. within ~2 orders) — otherwise
/// the floor is implausibly far below the device and the bracket is meaningless.
/// Mirrors the existing inline `freier_2016_*` bound in `quantum_imu.rs`.
const WITHIN_ORDERS_FACTOR: f64 = 200.0;

fn parse(s: &str) -> f64 {
    s.trim()
        .parse()
        .unwrap_or_else(|_| panic!("not a float: '{s}'"))
}

#[test]
fn cai_cited_error_model_sheet_matches_published_instruments() {
    let mut n = 0usize;
    let mut worst_scale_rel = 0.0_f64; // worst kshana-vs-oracle scale-factor rel err
    let mut worst_fringe_rel = 0.0_f64; // worst fringe-ambiguity rel err
    let mut worst_ratio = 0.0_f64; // worst (published / kshana-SQL) ratio across devices
    let mut min_margin = f64::INFINITY; // smallest published/SQL margin (must be >1)

    for line in REF.lines() {
        let rest = match line.strip_prefix("CAI ") {
            Some(r) => r,
            None => continue,
        };
        // CAI name | lambda_m | T_s | N | C | Tc | scale | fringe | sql_n_a | published | source
        let p: Vec<&str> = rest.split('|').collect();
        assert_eq!(p.len(), 11, "CAI row needs 11 |-fields: {line}");
        let name = p[0].trim();
        let lambda_m = parse(p[1]);
        let pulse_sep_t = parse(p[2]);
        let atom_number = parse(p[3]);
        let contrast = parse(p[4]);
        let cycle_time_s = parse(p[5]);
        let scale_oracle = parse(p[6]);
        let fringe_oracle = parse(p[7]);
        let sql_oracle = parse(p[8]);
        let published_asd = parse(p[9]);

        // Rebuild the IDENTICAL published instrument config in kshana.
        let cai = CaiAccelerometer {
            wavelength_m: lambda_m,
            pulse_sep_t,
            atom_number,
            contrast,
            cycle_time_s,
        };

        // ── (A) Exact geometry: scale factor k_eff·T² ─────────────────────────
        let scale_kshana = cai.scale_factor();
        let scale_rel = (scale_kshana - scale_oracle).abs() / scale_oracle.abs();
        worst_scale_rel = worst_scale_rel.max(scale_rel);
        assert!(
            scale_rel < GEOM_REL,
            "CAI {name}: kshana scale_factor {scale_kshana:.12e} vs oracle k_eff·T² \
             {scale_oracle:.12e} (rel {scale_rel:.2e} > {GEOM_REL:.0e})"
        );

        // ── (A) Exact geometry: fringe-ambiguity-limited accel 2π/(k_eff·T²) ──
        // kshana path: 2π / scale_factor() (k_eff = 4π/λ formed internally).
        // Oracle path: λ/(2T²), an independent algebraic reduction of the same.
        let fringe_kshana = 2.0 * std::f64::consts::PI / scale_kshana;
        let fringe_rel = (fringe_kshana - fringe_oracle).abs() / fringe_oracle.abs();
        worst_fringe_rel = worst_fringe_rel.max(fringe_rel);
        assert!(
            fringe_rel < GEOM_REL,
            "CAI {name}: kshana 2π/scale {fringe_kshana:.12e} vs oracle λ/(2T²) \
             {fringe_oracle:.12e} (rel {fringe_rel:.2e} > {GEOM_REL:.0e})"
        );

        // The fixture's emitted SQL value must equal kshana's accel_asd() (this also
        // re-checks the published-config arithmetic the bracket below relies on).
        let sql_kshana = cai.accel_asd();
        let sql_rel = (sql_kshana - sql_oracle).abs() / sql_oracle.abs();
        assert!(
            sql_rel < 1e-9,
            "CAI {name}: kshana accel_asd {sql_kshana:.12e} vs oracle SQL {sql_oracle:.12e} \
             (rel {sql_rel:.2e})"
        );

        // ── (B) One-sided shot-noise bracket vs PUBLISHED achieved sensitivity ─
        // The modelled quantum floor must lie BELOW the real device's achieved
        // noise (devices are technical-/vibration-limited above the SQL)…
        assert!(
            sql_kshana < published_asd,
            "CAI {name}: modelled SQL floor {sql_kshana:.3e} must be below published \
             achieved {published_asd:.3e} m/s²/√Hz (a real device cannot beat its own \
             quantum-projection-noise floor)"
        );
        // …and within ~2 orders of it (same physical sensor, not a different regime).
        let ratio = published_asd / sql_kshana;
        worst_ratio = worst_ratio.max(ratio);
        min_margin = min_margin.min(ratio);
        assert!(
            ratio < WITHIN_ORDERS_FACTOR,
            "CAI {name}: published achieved {published_asd:.3e} is {ratio:.1}× the modelled \
             SQL floor {sql_kshana:.3e} — implausibly far (> {WITHIN_ORDERS_FACTOR}×) above \
             it; the floor would not be a meaningful bracket for this device"
        );

        n += 1;
    }

    // Quantity gate: all three named instruments must be present.
    assert!(
        n >= 3,
        "expected >=3 named published CAI instruments, got {n}"
    );
    // The one-sided bracket is only meaningful if every device sits strictly above
    // its floor (margin > 1) — recorded so a regression that pushed kshana above a
    // device would be caught.
    assert!(
        min_margin > 1.0,
        "every published device must sit above the modelled SQL floor; min margin {min_margin:.2}"
    );

    eprintln!(
        "cai_cited_error_model_sheet: {n} published instruments \
         (Freier-2016 GAIN / Exail AQG-B / CARIOQA-PMP); \
         geometry worst scale-rel {worst_scale_rel:.2e}, fringe-rel {worst_fringe_rel:.2e} \
         (< {GEOM_REL:.0e}); one-sided shot-noise bracket: published/SQL margin \
         {min_margin:.1}×–{worst_ratio:.1}× (all > 1, all < {WITHIN_ORDERS_FACTOR}×)"
    );
}
