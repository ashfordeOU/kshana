//! Cross-check: the crate's two 7-parameter Helmert fits must agree where both are valid.
//!
//! The crate deliberately carries two `helmert_fit` functions. They are not redundant, and
//! this test exists because a reader who greps the crate for `helmert_fit` finds two hits
//! and has no way to tell whether one is a stale duplicate.
//!
//! | | `lunar_frame_realise::helmert_fit` | `lunar_interop_budget::helmert_fit` |
//! |---|---|---|
//! | model    | exact `q = t + (1+s)·R(θ)·p`, iterated | single linearisation at the zero datum |
//! | solver   | Gauss–Newton                       | centred normal equations, Cholesky + Jacobi |
//! | weights  | isotropic σ (`1/σ²`)               | unweighted                          |
//! | scale    | `scale_ppb` (parts per billion)    | `scale` (dimensionless)             |
//! | failure  | `Option::None`                     | always returns a fit                |
//! | evidence | Validated vs an Umeyama-SVD oracle | this cross-check + analytic recovery |
//!
//! # Why they are comparable at all
//! `lunar_frame_realise::helmert_fit` takes a SINGLE isotropic σ, so its weights `1/σ²` are a
//! common factor of both the normal matrix and the right-hand side and cancel exactly: it
//! solves the same unweighted least-squares problem `lunar_interop_budget::helmert_fit` does.
//! They linearise to the same form but with OPPOSITE ROTATION SIGN. That is not a bug in
//! either one — it is an undocumented convention collision, and pinning it is the main thing
//! this test is for:
//!
//! - `lunar_frame_realise::apply_helmert` composes `R = rz·ry·rx` from
//!   `precession::{rx, ry, rz}`, which are the SOFA `iauRx/Ry/Rz` matrices — FRAME (passive)
//!   rotations, the transpose of the active ones. It linearises to `q − p ≈ t + s·p − θ×p`.
//! - `lunar_datum::apply_datum7` uses the textbook ACTIVE Rodrigues rotation, and
//!   `datum7_point_jacobian_body` uses columns `∂/∂θ_k = ê_k × p`. It linearises to
//!   `q − p ≈ t + s·p + θ×p`.
//!
//! Both modules document themselves only as `R(θ)·p`, which is why the collision is invisible
//! to a reader of either one alone. Each is internally self-consistent — each fit inverts its
//! own forward model — so no published number is wrong, and no file in the crate currently
//! mixes the two. What WOULD be wrong is code that took a `rotation_rad` from one and handed
//! it to the other as a `rot_rad`. [`as_frame_realise_theta`] does the conversion everywhere
//! below, and `the_two_modules_use_opposite_rotation_sign_conventions` pins the relationship
//! so that a later unilateral "fix" to either convention fails here rather than silently
//! flipping every datum that crosses between them.
//!
//! # Where they are NOT comparable — and why that is the point
//! The interop fit linearises ONCE. Its error is second order in the rotation, which is
//! negligible for the inter-ephemeris datums it exists to measure (nanoradians) and is NOT
//! negligible for a large rotation. `large_rotation_separates_the_exact_fit_from_the_linear_one`
//! pins that boundary rather than leaving it to be discovered: it asserts the exact fit still
//! recovers the truth there and the linear one measurably does not.

use kshana::lunar_frame_realise::{apply_helmert, helmert_fit as exact_fit, FrameDatum};
use kshana::lunar_interop_budget::helmert_fit as linear_fit;

type Vec3 = [f64; 3];

/// Isotropic σ handed to the exact fit. Any positive value gives the same answer (the weights
/// cancel); 1 m keeps the normal matrix numerically identical to the unweighted one.
const SIGMA_M: f64 = 1.0;

/// Convert an interop-budget rotation vector into `lunar_frame_realise`'s convention.
///
/// The two modules' rotation vectors are exact negatives of one another (SOFA frame rotation
/// vs active Rodrigues — see the module header). Everything that compares a rotation across
/// the two goes through here, so the conversion appears once and is named.
fn as_frame_realise_theta(rot_rad: Vec3) -> Vec3 {
    [-rot_rad[0], -rot_rad[1], -rot_rad[2]]
}

// --- Agreement tolerances -------------------------------------------------------------
// PINNED FROM MEASUREMENT, not chosen. Each bound sits about one decade above the worst
// value this test actually prints on this network, so a real regression in either solver
// trips it while f64 noise does not. Re-measure with
// `cargo test --test lunar_helmert_fit_cross_check -- --nocapture`.
//
//   measured worst, 2026-09-21, rustc 1.93.0, debug:
//     translation, either fit vs truth and vs each other ..... 8.615e-11 m
//     rotation,    either fit vs truth and vs each other ..... 3.387e-17 rad
//     scale,       the two fits vs each other ................ 2.972e-17
//     forward-model round trip under negation ................ 2.328e-10 m
const TOL_T_M: f64 = 1.0e-9;
const TOL_R_RAD: f64 = 5.0e-16;
const TOL_S: f64 = 5.0e-16;

/// Round-tripping a point through a fitted datum costs an extra rotation application, so it
/// carries more float noise than a parameter comparison and gets its own measured bound.
const TOL_ROUNDTRIP_M: f64 = 3.0e-9;

/// An asymmetric lunar-scale point network.
///
/// Asymmetry is load-bearing. A centrosymmetric or axis-aligned set lets a rotation be absorbed
/// by translation or leaves some `θ` component unconstrained, and then "the two fits agree"
/// would be true without either of them having recovered a rotation at all.
fn network() -> Vec<Vec3> {
    vec![
        [1_737_400.0, 0.0, 0.0],
        [-1_100_000.0, 1_200_000.0, 430_000.0],
        [310_000.0, -1_650_000.0, 220_000.0],
        [890_000.0, 740_000.0, -1_310_000.0],
        [-420_000.0, -390_000.0, 1_640_000.0],
        [1_210_000.0, -810_000.0, -770_000.0],
        [-1_580_000.0, 230_000.0, -640_000.0],
        [60_000.0, 1_490_000.0, 880_000.0],
    ]
}

fn transform(truth: &FrameDatum, from: &[Vec3]) -> Vec<Vec3> {
    from.iter().map(|&p| apply_helmert(truth, p)).collect()
}

fn max_abs(a: &[f64], b: &[f64]) -> f64 {
    a.iter()
        .zip(b.iter())
        .map(|(x, y)| (x - y).abs())
        .fold(0.0_f64, f64::max)
}

/// Both fits recover a small truth datum, and agree with each other, on the same network.
#[test]
fn both_helmert_fits_recover_the_same_small_datum() {
    // A datum of the size these functions exist for: metre-level origin offset, ppb-level
    // scale, nanoradian rotation — the scale of real inter-ephemeris disagreement.
    let truth = FrameDatum {
        translation_m: [0.83, -1.47, 0.62],
        rotation_rad: [3.1e-9, -1.7e-9, 2.4e-9],
        scale_ppb: 0.42,
    };
    let from = network();
    let to = transform(&truth, &from);

    let exact = exact_fit(&from, &to, SIGMA_M).expect("exact fit converges on a well-posed network");
    let linear = linear_fit(&from, &to);

    // Round-trip through the module's OWN forward model. This separates "the two fits use
    // different rotation sign conventions" from "the fit is inconsistent with its own
    // apply_datum7", which are very different defects.
    {
        let worst = from
            .iter()
            .zip(to.iter())
            .map(|(&p, &q)| {
                let r = kshana::lunar_datum::apply_datum7(&linear.datum, p);
                (0..3).map(|k| (r[k] - q[k]).abs()).fold(0.0_f64, f64::max)
            })
            .fold(0.0_f64, f64::max);
        println!("linear datum -> apply_datum7 vs target: worst |d| {worst:.3e} m");
        assert!(
            worst < TOL_ROUNDTRIP_M,
            "the linear fit no longer inverts its own forward model: {worst:e} m"
        );
        println!("truth  theta = {:?}", truth.rotation_rad);
        println!("exact  theta = {:?}", exact.rotation_rad);
        println!("linear theta = {:?}  (raw, interop convention)", linear.datum.rot_rad);
        println!(
            "linear theta = {:?}  (converted)",
            as_frame_realise_theta(linear.datum.rot_rad)
        );
    }

    // Put both into one parameterisation: metres, dimensionless scale, radians.
    let exact_p = [
        exact.translation_m[0],
        exact.translation_m[1],
        exact.translation_m[2],
        exact.scale_ppb * 1e-9,
        exact.rotation_rad[0],
        exact.rotation_rad[1],
        exact.rotation_rad[2],
    ];
    let linear_theta = as_frame_realise_theta(linear.datum.rot_rad);
    let linear_p = [
        linear.datum.t_m[0],
        linear.datum.t_m[1],
        linear.datum.t_m[2],
        linear.datum.scale,
        linear_theta[0],
        linear_theta[1],
        linear_theta[2],
    ];
    let truth_p = [
        truth.translation_m[0],
        truth.translation_m[1],
        truth.translation_m[2],
        truth.scale_ppb * 1e-9,
        truth.rotation_rad[0],
        truth.rotation_rad[1],
        truth.rotation_rad[2],
    ];

    let d_exact_t = max_abs(&exact_p[0..3], &truth_p[0..3]);
    let d_linear_t = max_abs(&linear_p[0..3], &truth_p[0..3]);
    let d_pair_t = max_abs(&exact_p[0..3], &linear_p[0..3]);
    let d_exact_r = max_abs(&exact_p[4..7], &truth_p[4..7]);
    let d_linear_r = max_abs(&linear_p[4..7], &truth_p[4..7]);
    let d_pair_r = max_abs(&exact_p[4..7], &linear_p[4..7]);
    let d_pair_s = (exact_p[3] - linear_p[3]).abs();

    // Measured, not guessed — these print on `-- --nocapture` and the bounds below were set
    // from them.
    println!("translation vs truth : exact {d_exact_t:.3e} m   linear {d_linear_t:.3e} m");
    println!("rotation    vs truth : exact {d_exact_r:.3e} rad linear {d_linear_r:.3e} rad");
    println!("pairwise             : t {d_pair_t:.3e} m  θ {d_pair_r:.3e} rad  s {d_pair_s:.3e}");
    println!("post-fit residual rms: linear {:.3e} m", linear.residual_rms_m);

    assert!(d_exact_t < TOL_T_M, "exact fit translation: {d_exact_t:e}");
    assert!(d_linear_t < TOL_T_M, "linear fit translation: {d_linear_t:e}");
    assert!(d_exact_r < TOL_R_RAD, "exact fit rotation: {d_exact_r:e}");
    assert!(d_linear_r < TOL_R_RAD, "linear fit rotation: {d_linear_r:e}");
    assert!(d_pair_t < TOL_T_M, "the two fits disagree on translation: {d_pair_t:e}");
    assert!(d_pair_r < TOL_R_RAD, "the two fits disagree on rotation: {d_pair_r:e}");
    assert!(d_pair_s < TOL_S, "the two fits disagree on scale: {d_pair_s:e}");
}

/// The network actually carries rotation information, so the agreement above is not vacuous.
///
/// Without this, a build in which both fits silently returned `θ = 0` — or in which the two
/// used opposite sign conventions on a set too symmetric to tell — would pass the test above.
#[test]
fn the_network_constrains_rotation_sign_in_both_fits() {
    let from = network();
    let theta: Vec3 = [4.0e-9, -2.5e-9, 1.8e-9];

    let pos = FrameDatum { translation_m: [0.0; 3], rotation_rad: theta, scale_ppb: 0.0 };
    let neg = FrameDatum {
        translation_m: [0.0; 3],
        rotation_rad: [-theta[0], -theta[1], -theta[2]],
        scale_ppb: 0.0,
    };

    let fit_pos_e = exact_fit(&from, &transform(&pos, &from), SIGMA_M).expect("converges");
    let fit_neg_e = exact_fit(&from, &transform(&neg, &from), SIGMA_M).expect("converges");
    let fit_pos_l = as_frame_realise_theta(linear_fit(&from, &transform(&pos, &from)).datum.rot_rad);
    let fit_neg_l = as_frame_realise_theta(linear_fit(&from, &transform(&neg, &from)).datum.rot_rad);

    for k in 0..3 {
        // Each component is recovered with the sign it was injected with, by BOTH fits.
        assert!(
            fit_pos_e.rotation_rad[k] * theta[k] > 0.0,
            "exact fit lost the sign of theta[{k}]"
        );
        assert!(
            fit_pos_l[k] * theta[k] > 0.0,
            "linear fit lost the sign of theta[{k}]"
        );
        // And negating the truth negates the estimate — a fit that returned a constant,
        // or that took |θ|, cannot satisfy this.
        assert!(
            fit_neg_e.rotation_rad[k] * fit_pos_e.rotation_rad[k] < 0.0,
            "exact fit did not follow the sign flip on theta[{k}]"
        );
        assert!(
            fit_neg_l[k] * fit_pos_l[k] < 0.0,
            "linear fit did not follow the sign flip on theta[{k}]"
        );
        // The magnitude really is the injected one, not merely nonzero.
        let rel = (fit_pos_l[k] - theta[k]).abs() / theta[k].abs();
        assert!(rel < 1e-6, "linear fit theta[{k}] off by rel {rel:e}");
    }
}

/// The boundary: one linearisation is not enough for a large rotation, and the exact fit is.
///
/// This is the documented limit of `lunar_interop_budget::helmert_fit`, asserted rather than
/// assumed. The linear fit's error here is second order in |θ| over the network's lever arm.
#[test]
fn large_rotation_separates_the_exact_fit_from_the_linear_one() {
    let from = network();
    // 1 milliradian — far above any inter-ephemeris datum, chosen so the second-order term
    // (~|θ|²·|p|/2 ≈ 0.9 m over a lunar-radius lever arm) is unmistakable.
    let theta: Vec3 = [1.0e-3, -0.7e-3, 0.4e-3];
    let truth = FrameDatum { translation_m: [0.0; 3], rotation_rad: theta, scale_ppb: 0.0 };
    let to = transform(&truth, &from);

    let exact = exact_fit(&from, &to, SIGMA_M).expect("converges");
    let linear = linear_fit(&from, &to);

    let d_exact = max_abs(&exact.rotation_rad, &theta);
    let d_linear = max_abs(&as_frame_realise_theta(linear.datum.rot_rad), &theta);
    println!("large rotation: exact |Δθ| {d_exact:.3e} rad, linear |Δθ| {d_linear:.3e} rad");
    println!("large rotation: linear post-fit residual rms {:.3e} m", linear.residual_rms_m);

    // The exact, iterated fit still recovers the truth.
    assert!(d_exact < TOL_R_RAD, "exact fit should stay exact at 1 mrad: {d_exact:e}");
    // The single-linearisation fit measurably does not — that is its stated domain limit,
    // and if this assertion ever fails the module doc is wrong, not the test.
    assert!(
        d_linear > 100.0 * TOL_R_RAD,
        "linear fit unexpectedly exact at 1 mrad ({d_linear:e}) — re-check the module doc"
    );
}

/// Pin the convention collision itself, at the forward models, independent of either fit.
///
/// `lunar_frame_realise::apply_helmert` and `lunar_datum::apply_datum7` both document their
/// rotation only as `R(θ)·p`, but one is a SOFA frame rotation and the other an active
/// Rodrigues rotation, so their rotation vectors are negatives of each other. Nothing in the
/// crate currently crosses between them, which is exactly why the collision could sit here
/// unnoticed. If someone later "fixes" either convention, this test fails and says so, instead
/// of every datum that crosses the boundary silently flipping sign.
#[test]
fn the_two_modules_use_opposite_rotation_sign_conventions() {
    let theta: Vec3 = [3.1e-9, -1.7e-9, 2.4e-9];
    let from = network();

    let helmert = FrameDatum { translation_m: [0.0; 3], rotation_rad: theta, scale_ppb: 0.0 };
    let negated = kshana::lunar_datum::Datum7 {
        t_m: [0.0; 3],
        scale: 0.0,
        rot_rad: as_frame_realise_theta(theta),
    };
    let same = kshana::lunar_datum::Datum7 { t_m: [0.0; 3], scale: 0.0, rot_rad: theta };

    let mut worst_negated = 0.0_f64;
    let mut worst_same = 0.0_f64;
    for &p in &from {
        let h = apply_helmert(&helmert, p);
        let n = kshana::lunar_datum::apply_datum7(&negated, p);
        let s = kshana::lunar_datum::apply_datum7(&same, p);
        for k in 0..3 {
            worst_negated = worst_negated.max((h[k] - n[k]).abs());
            worst_same = worst_same.max((h[k] - s[k]).abs());
        }
    }
    println!("apply_helmert(θ) vs apply_datum7(−θ): worst |d| {worst_negated:.3e} m");
    println!("apply_helmert(θ) vs apply_datum7(+θ): worst |d| {worst_same:.3e} m");

    // Negating the rotation vector makes the two forward models agree ...
    assert!(
        worst_negated < TOL_ROUNDTRIP_M,
        "the two forward models no longer agree under negation ({worst_negated:e} m) — the \
         sign conventions have changed; every cross-module datum conversion must be re-checked"
    );
    // ... and NOT negating it does not. Without this half, a build in which both became the
    // same convention would still pass the line above.
    assert!(
        worst_same > 1.0e-3,
        "apply_datum7(+θ) now agrees with apply_helmert(θ) to {worst_same:e} m — a convention \
         was changed; see the module header and re-check as_frame_realise_theta"
    );
}
