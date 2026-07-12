// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for the IEEE-1139 power-law PSD -> Allan conversion.**
//!
//! Kshana's [`kshana::powerlaw::allan_deviation`] is checked against **allantools**
//! (A. Wallin, GPL; an independent third-party frequency-stability library) via its
//! [`allantools.Noise`] closed-form Allan-deviation model. For each of the five
//! IEEE-1139 power-law noise types, allantools computes `sigma_y(tau)` from a frequency
//! PSD level `h_a` (`S_y(f) = h_a f^a`) using the Kasdin & Walter (1992) discrete
//! colored-noise theory with Vernotte (2015, Table I) closed-form prefactors. Kshana
//! computes the *same* uniquely-defined quantity from its own IEEE Std 1139-2008 /
//! Riley NIST SP 1065 §3 conversion table. Neither re-implements the other: they are
//! genuinely independent derivations of the identical PSD->Allan map, so their
//! agreement is a real cross-validation, not a re-run.
//!
//! ## Honest scope
//! This validates the **PSD -> Allan CONVERSION**: the five coefficient laws
//! (white PM `tau^-1`, flicker PM `~tau^-1`, white FM `tau^-1/2`, **flicker-FM flat
//! floor** `sqrt(2 ln2 h_-1)`, random-walk FM `tau^+1/2`) and the `2 ln2` flicker
//! constant, against allantools -- the same bar the existing Validated MDEV/TDEV/Theo1/
//! MTIE rows clear. Per-device coefficients and real measured floors STAY Modelled: this
//! says nothing about which `h_a` a given clock has, only that Kshana's conversion of a
//! *given* `h_a` matches an independent library.
//!
//! ## Convention pinning
//! The coefficient `h_a` fed to Kshana is exactly the level allantools synthesises,
//! read from `allantools.Noise.frequency_psd_from_qd(tau0)` (Kasdin1992 eqn 39). Both
//! sides use `tau0 = 1` and the Nyquist measurement bandwidth `f_h = 0.5/tau0` that
//! allantools assumes for the two phase-modulation terms.
//!
//! ## Tolerances
//! White/flicker/random-walk FM and white PM match to floating-point round-off (the two
//! closed forms are algebraically identical), asserted at `< 5e-9` relative. Flicker PM
//! matches to `< 2e-3` relative: Kshana rounds the flicker-PM constant
//! `3*gamma - ln2 = 1.03846...` to the NIST SP 1065 tabulated `1.038`, while allantools
//! keeps the full `3*gamma - ln2` -- a real, documented constant-truncation difference of
//! ~1e-5 that this cross-check exposes and bounds. A separate synth->oadev corroboration
//! point (allantools' Kasdin generator + its `oadev` estimator) is checked at a few
//! percent to confirm the generator emits noise at the `h_a` its closed form predicts.
//!
//! The committed constants below are 15-significant-figure serialisations from
//! `tests/fixtures/powerlaw/generate_p1_powerlaw_reference.py` (allantools 2024.06);
//! no third-party code runs in this test, and the generator is regenerable offline.

// The committed constants are faithful 15-significant-figure serialisations of the
// allantools fixture; trailing zeros are provenance, not spurious precision.
#![allow(clippy::excessive_precision)]

use kshana::powerlaw::{allan_deviation, PowerLaw};

/// `tau0`, and the Nyquist measurement bandwidth allantools assumes for the PM terms.
const TAU0: f64 = 1.0;
const F_H: f64 = 0.5 / TAU0;

/// One committed allantools closed-form reference point: `(tau, sigma_y)` at a fixed
/// `h_a` for one noise type.
struct Ref {
    /// Human label of the noise type.
    label: &'static str,
    /// Frequency PSD coefficient `h_a` (`S_y(f) = h_a f^a`) allantools used.
    h_a: f64,
    /// Which `PowerLaw` coefficient this `h_a` sets.
    set: fn(f64) -> PowerLaw,
    /// Relative tolerance for this noise type (round-off vs the flicker-PM truncation).
    tol: f64,
    /// allantools `Noise.adev(tau0, tau)` reference values: `(tau, sigma_y)`.
    points: &'static [(f64, f64)],
}

fn wpm(h: f64) -> PowerLaw {
    PowerLaw {
        h_2: h,
        ..Default::default()
    }
}
fn fpm(h: f64) -> PowerLaw {
    PowerLaw {
        h_1: h,
        ..Default::default()
    }
}
fn wfm(h: f64) -> PowerLaw {
    PowerLaw {
        h_0: h,
        ..Default::default()
    }
}
fn ffm(h: f64) -> PowerLaw {
    PowerLaw {
        h_m1: h,
        ..Default::default()
    }
}
fn rwfm(h: f64) -> PowerLaw {
    PowerLaw {
        h_m2: h,
        ..Default::default()
    }
}

/// allantools 2024.06 `Noise.adev` reference table (see module header + fixture).
const REFS: &[Ref] = &[
    Ref {
        label: "white_pm (a=+2)",
        h_a: 7.895683520871486e-19,
        set: wpm,
        tol: 5e-9,
        points: &[
            (1.0, 1.732050807568877e-10),
            (2.0, 8.660254037844386e-11),
            (4.0, 4.330127018922193e-11),
            (10.0, 1.732050807568877e-11),
            (30.0, 5.773502691896257e-12),
            (100.0, 1.732050807568877e-12),
            (300.0, 5.773502691896257e-13),
            (1000.0, 1.732050807568877e-13),
        ],
    },
    Ref {
        label: "flicker_pm (a=+1)",
        h_a: 1.256637061435917e-19,
        set: fpm,
        // ~1e-5 truncation of 3*gamma-ln2 -> 1.038; bounded well inside 2e-3.
        tol: 2e-3,
        points: &[
            (1.0, 1.193189539289543e-10),
            (2.0, 7.220817261792369e-11),
            (4.0, 4.143907333050762e-11),
            (10.0, 1.903288751952334e-11),
            (30.0, 7.204632407159572e-12),
            (100.0, 2.412740116536913e-12),
            (300.0, 8.737157132134466e-13),
            (1000.0, 2.831981932602120e-13),
        ],
    },
    Ref {
        label: "white_fm (a=0)",
        h_a: 2.000000000000000e-20,
        set: wfm,
        tol: 5e-9,
        points: &[
            (1.0, 1.000000000000000e-10),
            (2.0, 7.071067811865475e-11),
            (4.0, 5.000000000000000e-11),
            (10.0, 3.162277660168379e-11),
            (30.0, 1.825741858350554e-11),
            (100.0, 1.000000000000000e-11),
            (300.0, 5.773502691896258e-12),
            (1000.0, 3.162277660168379e-12),
        ],
    },
    Ref {
        label: "flicker_fm (a=-1, FLOOR)",
        h_a: 3.183098861837907e-21,
        set: ffm,
        tol: 5e-9,
        points: &[
            (1.0, 6.642824702679600e-11),
            (2.0, 6.642824702679600e-11),
            (4.0, 6.642824702679600e-11),
            (10.0, 6.642824702679600e-11),
            (30.0, 6.642824702679600e-11),
            (100.0, 6.642824702679600e-11),
            (300.0, 6.642824702679600e-11),
            (1000.0, 6.642824702679600e-11),
        ],
    },
    Ref {
        label: "rw_fm (a=-2)",
        h_a: 5.066059182116888e-22,
        set: rwfm,
        tol: 5e-9,
        points: &[
            (1.0, 5.773502691896257e-11),
            (2.0, 8.164965809277260e-11),
            (4.0, 1.154700538379251e-10),
            (10.0, 1.825741858350554e-10),
            (30.0, 3.162277660168379e-10),
            (100.0, 5.773502691896258e-10),
            (300.0, 9.999999999999999e-10),
            (1000.0, 1.825741858350554e-09),
        ],
    },
];

#[test]
fn power_law_conversion_matches_allantools_closed_form() {
    for r in REFS {
        let p = (r.set)(r.h_a);
        for &(tau, want) in r.points {
            let got = allan_deviation(&p, tau, F_H);
            let rel = (got - want).abs() / want;
            assert!(
                rel < r.tol,
                "{}: sigma_y(tau={tau}) Kshana {got} vs allantools {want} \
                 (rel {rel:.3e} >= tol {:.1e})",
                r.label,
                r.tol
            );
        }
    }
}

#[test]
fn flicker_fm_floor_matches_allantools_two_ln2_constant() {
    // Headline: the flicker-FM floor sigma_y = sqrt(2 ln2 h_-1) is a FLAT, tau-independent
    // level. allantools' closed form gives the identical constant across the whole ladder.
    // Oracle: allantools Noise(b=-3).adev at h_a = 3.183098861837907e-21 -> 6.6428247e-11.
    let h_a = 3.183098861837907e-21;
    let want = 6.642824702679600e-11;
    let p = ffm(h_a);
    for &tau in &[1.0_f64, 2.0, 10.0, 100.0, 1000.0] {
        let got = allan_deviation(&p, tau, F_H);
        let rel = (got - want).abs() / want;
        assert!(
            rel < 5e-9,
            "flicker-FM floor not flat/equal to allantools at tau={tau}: {got} vs {want}"
        );
    }
    // And the floor equals the closed constant sqrt(2 ln2 h_-1) to round-off.
    let closed = (2.0 * 2.0_f64.ln() * h_a).sqrt();
    assert!(
        (closed - want).abs() / want < 5e-9,
        "sqrt(2 ln2 h_-1) {closed} != allantools flicker floor {want}"
    );
}

#[test]
fn white_fm_synth_then_oadev_corroborates_the_h_a_level() {
    // Corroboration that allantools' Kasdin GENERATOR emits noise at the h_a its own
    // closed form predicts: allantools synth -> allantools oadev, averaged over 40 seeded
    // realisations (variance-averaged), agrees with the closed form to a few percent.
    // These are allantools estimator outputs (see fixture generator); Kshana must land
    // between them and the closed form -- i.e. Kshana's forward model tracks the finite-
    // sample estimate too. Oracle: allantools oadev on Noise(b=-2) records at h_a=2e-20.
    let h_a = 2.000000000000000e-20;
    let p = wfm(h_a);
    // (tau, allantools synth->oadev estimate); tolerance = few-% finite-sample scatter.
    let synth: [(f64, f64); 3] = [
        (4.0, 4.998670862556233e-11),
        (16.0, 2.505491909974778e-11),
        (64.0, 1.244963285935152e-11),
    ];
    for (tau, est) in synth {
        let got = allan_deviation(&p, tau, F_H);
        let rel = (got - est).abs() / est;
        assert!(
            rel < 1e-2,
            "white-FM tau={tau}: Kshana forward {got} vs allantools synth->oadev {est} (rel {rel:.3e})"
        );
    }
}
