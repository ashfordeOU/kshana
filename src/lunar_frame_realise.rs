// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar reference-frame *realisation* — estimate a frame datum from a network of points.
//!
//! Where [`crate::lunar_frame`] *applies* the IAU 2015 WGCCRE rotation (a forward model of the
//! lunar body orientation), this module *estimates* (realises) a lunar reference frame from a
//! network of estimated point coordinates tied to a datum. The estimation core is a classic
//! **7-parameter similarity (Helmert) transform** — three translations, three small-angle
//! rotations and one scale — fit by weighted least squares, plus a small orientation-tie that
//! expresses the realised small rotation about the ICRF axes (relative to the IAU-modelled
//! orientation).
//!
//! ## The 7-parameter model
//!
//! For points `p_i` in the estimated frame and `q_i` in the datum frame:
//!
//! ```text
//! q_i = t + (1 + s) · R(θ) · p_i
//! ```
//!
//! with translation `t = [tx, ty, tz]` (m), scale `s` (dimensionless, ~1e-6 level) and the
//! small rotation `R(θ) = rz(θz)·ry(θy)·rx(θx)` built from
//! [`crate::precession::{rx, ry, rz, matmul, mat_vec}`]. The seven parameters
//! `[tx, ty, tz, θx, θy, θz, s]` are estimated from ≥ 3 non-collinear point pairs by weighted
//! least squares through [`crate::batch_ls::gauss_newton`]: the forward model predicts every
//! `q_i` from its `p_i`, all three components of all points are flattened into the observable
//! vector, the observed (datum) coordinates form `z`, the weights are `1/σ²`, and the solve
//! starts from `x0 = zeros`.
//!
//! ## Honesty / scope (MODELLED — recovers an injected transform)
//!
//! This is a **self-consistency** capability: a known Helmert transform is *injected* into a
//! synthetic point network (a well-spread set of selenographic points mapped to MCMF), seeded
//! Gaussian noise is added, and the fit must recover the injected parameters. The oracle is
//! therefore the recovery of that injected 7-parameter similarity transform (to ~machine
//! precision on noiseless data) plus the algebraic round-trip identity of [`apply_helmert`] — it
//! is **NOT** a realisation of the lunar reference frame against real tracking / VLBI data, and
//! it carries no claim of absolute frame accuracy. No TRL, flight heritage or agency endorsement
//! is implied. The ICRF orientation tie is a deliberately simple composition (documented on
//! [`icrf_orientation_tie`]) reporting the realised small rotation about the ICRF axes.

use crate::batch_ls::gauss_newton;
use crate::precession::{mat_vec, matmul, rx, ry, rz, transpose, Mat3};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

type Vec3 = [f64; 3];

/// Parts-per-billion → dimensionless scale factor.
const PPB: f64 = 1.0e-9;

// ---------------------------------------------------------------------------
// Core 7-parameter similarity (Helmert) transform.
// ---------------------------------------------------------------------------

/// A realised frame datum: the 7 parameters of a similarity transform mapping the estimated
/// frame to the datum frame, `q = t + (1 + s)·R(θ)·p`.
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize)]
pub struct FrameDatum {
    /// Translation `[tx, ty, tz]` (m).
    pub translation_m: [f64; 3],
    /// Small rotation angles `[θx, θy, θz]` (rad), applied as `R = rz(θz)·ry(θy)·rx(θx)`.
    pub rotation_rad: [f64; 3],
    /// Scale offset stored in parts-per-billion for readability (`s = scale_ppb · 1e-9`).
    pub scale_ppb: f64,
}

/// The rotation matrix `R(θ) = rz(θz)·ry(θy)·rx(θx)` for the small angles `θ = [θx, θy, θz]`.
fn rotation(theta: [f64; 3]) -> Mat3 {
    matmul(&matmul(&rz(theta[2]), &ry(theta[1])), &rx(theta[0]))
}

/// Apply a realised datum to a single point: `q = t + (1 + s)·R(θ)·p`.
pub fn apply_helmert(d: &FrameDatum, p: Vec3) -> Vec3 {
    let r = rotation(d.rotation_rad);
    let rp = mat_vec(&r, p);
    let s = 1.0 + d.scale_ppb * PPB;
    [
        d.translation_m[0] + s * rp[0],
        d.translation_m[1] + s * rp[1],
        d.translation_m[2] + s * rp[2],
    ]
}

/// Internal parameter packing. The seven solver parameters are stored in units chosen so the
/// finite-difference Jacobian in [`crate::batch_ls::gauss_newton`] is well-scaled at the
/// lunar-surface coordinate magnitude (~1.7e6 m).
///
/// `gauss_newton` perturbs each parameter by `1e-6·max(1, |x|)`. The point coordinates are
/// O(1.7e6 m), so a partial wrt translation is O(1) but a partial wrt a *rotation* angle is
/// O(coordinate)·δθ. To put the rotation/scale Jacobian columns on the same O(1) footing as the
/// translation columns (and so keep the normal matrix well-conditioned in f64), rotation angles
/// are estimated in **µrad** (× 1e-6) and scale in **ppb** (× 1e-9); a 1e-6 stored step is then
/// ~1 µrad of angle / 1 ppb of scale, large enough to register far above the f64 ULP of a
/// 1.7e6 m coordinate (~2e-10 m). Translations are estimated directly in metres.
const URAD: f64 = 1.0e-6;

fn datum_from_params(x: &[f64]) -> FrameDatum {
    FrameDatum {
        translation_m: [x[0], x[1], x[2]],
        rotation_rad: [x[3] * URAD, x[4] * URAD, x[5] * URAD],
        scale_ppb: x[6],
    }
}

/// Flatten the predicted `q_i = t + (1 + s)·R·p_i` over all points into the observable vector
/// (every point contributes its three components in order).
fn forward(p: &[Vec3], x: &[f64]) -> Vec<f64> {
    let d = datum_from_params(x);
    let mut z = Vec::with_capacity(p.len() * 3);
    for &pi in p {
        let qi = apply_helmert(&d, pi);
        z.push(qi[0]);
        z.push(qi[1]);
        z.push(qi[2]);
    }
    z
}

/// Centroid of a point set.
fn centroid(p: &[Vec3]) -> Vec3 {
    let n = p.len().max(1) as f64;
    let mut c = [0.0; 3];
    for &pi in p {
        c[0] += pi[0];
        c[1] += pi[1];
        c[2] += pi[2];
    }
    [c[0] / n, c[1] / n, c[2] / n]
}

/// The core fit, returning the datum together with the solver's genuine convergence flag (the
/// public [`helmert_fit`] drops the flag; [`realise_frame`] keeps it).
///
/// The seven parameters `[tx, ty, tz, θx, θy, θz, s]` are estimated by [`crate::batch_ls::gauss_newton`]
/// over the forward model `q = t + (1+s)·R(θ)·p` from `x0 = zeros`, exactly as specified. To keep
/// the normal matrix well-conditioned, the fit runs on **centroid-shifted** coordinates: both `p`
/// and `q` are shifted by the centroid `c = mean(p)` before the solve, so the coordinates the
/// rotation/scale Jacobian sees are O(network-extent) rather than O(1.7e6 m) — this decouples the
/// near-degenerate scale↔radial-translation combination that otherwise stalls the Gauss-Newton
/// step under noise. The recovered `θ, s` are frame-invariant under that shift; the translation is
/// reconstructed exactly via `t = t_c + c − (1+s)·R(θ)·c`.
fn helmert_fit_inner(p: &[Vec3], q: &[Vec3], sigma_m: f64) -> Option<(FrameDatum, bool)> {
    if p.len() != q.len() || p.len() < 3 {
        return None;
    }
    let c = centroid(p);
    let p_c: Vec<Vec3> = p.iter().map(|&pi| sub(pi, c)).collect();
    let q_c: Vec<Vec3> = q.iter().map(|&qi| sub(qi, c)).collect();

    // Flatten the (shifted) datum coordinates into z; weight every component equally.
    let z: Vec<f64> = q_c.iter().flat_map(|qi| [qi[0], qi[1], qi[2]]).collect();
    let sig = sigma_m.max(1e-9);
    let w = 1.0 / (sig * sig);
    let weights = vec![w; z.len()];
    let h = move |x: &[f64]| forward(&p_c, x);
    let x0 = vec![0.0; 7];
    // tol is the step norm in STORED units (1 unit ≈ 1 m / 1 µrad / 1 ppb). 1e-8 stored is a
    // sub-10-nm / sub-10-nrad / sub-1e-8-ppb step — far below any realistic noise-limited
    // resolution, and (with the centroid-shift conditioning) the floor the noiseless Gauss-Newton
    // step robustly collapses to across geometries; a tighter tol leaves the weakly-observed scale
    // column chasing the f64 ULP and the noiseless solve flagged non-converged. On NOISY data the
    // weakly-observed scale parameter holds the step above this floor (its resolution is only
    // ~hundreds of ppb), so `converged` is legitimately false there even though the estimate is
    // statistically correct — see the recovery-quality assertions in the tests.
    let r = gauss_newton(h, &z, &weights, &x0, 50, 1e-8)?;
    if !r.x.iter().all(|v| v.is_finite()) {
        return None;
    }
    // The recovered datum is for the shifted frame: q_c = t_c + (1+s)·R·p_c. Reconstruct the
    // un-shifted translation t = t_c + c − (1+s)·R·c.
    let mut d = datum_from_params(&r.x);
    let rot = rotation(d.rotation_rad);
    let rc = mat_vec(&rot, c);
    let s = 1.0 + d.scale_ppb * PPB;
    d.translation_m = [
        d.translation_m[0] + c[0] - s * rc[0],
        d.translation_m[1] + c[1] - s * rc[1],
        d.translation_m[2] + c[2] - s * rc[2],
    ];
    Some((d, r.converged))
}

/// Vector difference `a − b`.
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// The core 7-parameter Helmert fit: estimate the datum `[t, θ, s]` that best maps `p` (estimated
/// frame) onto `q` (datum frame) by weighted least squares, with a single isotropic
/// per-coordinate measurement σ `sigma_m` (weights `1/σ²`). Requires ≥ 3 point pairs of equal
/// length. Returns `None` on a length mismatch, too few points, or a singular (collinear)
/// geometry.
pub fn helmert_fit(p: &[Vec3], q: &[Vec3], sigma_m: f64) -> Option<FrameDatum> {
    helmert_fit_inner(p, q, sigma_m).map(|(d, _)| d)
}

// ---------------------------------------------------------------------------
// Frame realisation = fit + residuals.
// ---------------------------------------------------------------------------

/// A realised frame: the fitted datum plus the post-fit residual statistics.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct RealisedFrame {
    /// The fitted 7-parameter datum.
    pub datum: FrameDatum,
    /// RMS over all point components of the post-fit residual `q_i − apply_helmert(datum, p_i)` (m).
    pub rms_residual_m: f64,
    /// Number of point pairs used.
    pub n_points: usize,
    /// Whether the least-squares solve converged.
    pub converged: bool,
}

/// Realise a frame: fit the 7-parameter datum tying `estimated` to `datum_truth`, then compute the
/// post-fit RMS residual. Returns `None` if the fit fails (see [`helmert_fit`]).
pub fn realise_frame(
    estimated: &[Vec3],
    datum_truth: &[Vec3],
    sigma_m: f64,
) -> Option<RealisedFrame> {
    let (datum, converged) = helmert_fit_inner(estimated, datum_truth, sigma_m)?;
    let mut acc = 0.0;
    for (&p, &q) in estimated.iter().zip(datum_truth.iter()) {
        let pred = apply_helmert(&datum, p);
        for k in 0..3 {
            let r = q[k] - pred[k];
            acc += r * r;
        }
    }
    let n = (estimated.len() * 3) as f64;
    let rms_residual_m = if n > 0.0 { (acc / n).sqrt() } else { 0.0 };
    Some(RealisedFrame {
        datum,
        rms_residual_m,
        n_points: estimated.len(),
        converged,
    })
}

// ---------------------------------------------------------------------------
// ICRF orientation tie.
// ---------------------------------------------------------------------------

/// Compose the realised small rotation `R(θ_realised)` with the IAU body→ICRF orientation and
/// return the residual small-angle offset of the realised frame from the IAU-modelled
/// orientation, expressed as three small angles about the ICRF axes.
///
/// ## What this is (honest, deliberately simple)
///
/// The IAU body-fixed orientation at `jd_tdb` is `R_iau = icrf_to_iau_moon(jd_tdb)` (ICRF →
/// body); its transpose `B = transpose(R_iau)` is the body → ICRF rotation. The realisation
/// produced a small rotation `R_r = R(θ_realised)` *within the body-fixed coordinates* (the
/// estimated-frame → datum-frame tilt). Pushing that small rotation through to the ICRF axes
/// gives `M = B · R_r · Bᵀ`, a near-identity rotation whose three small angles (the antisymmetric
/// part of `M`, i.e. `θ_icrf = ½·[M₃₂ − M₂₃, M₁₃ − M₃₁, M₂₁ − M₁₂]`) are the realised frame's
/// orientation offset *about the ICRF axes*. For a zero realised rotation this returns
/// `[0, 0, 0]` (the realised frame coincides with the IAU-modelled orientation); the magnitude of
/// the returned vector equals the realised rotation magnitude (a similarity transform preserves
/// rotation angle). This is a frame-of-expression change, **not** an independent estimate of the
/// lunar pole — it does not tie the orientation to real VLBI and claims no absolute accuracy.
pub fn icrf_orientation_tie(jd_tdb: f64, realised_rotation_rad: [f64; 3]) -> [f64; 3] {
    let b = transpose(&crate::lunar_frame::icrf_to_iau_moon(jd_tdb)); // body → ICRF
    let r_r = rotation(realised_rotation_rad);
    // M = B · R_r · Bᵀ — the realised small rotation expressed about the ICRF axes.
    let m = matmul(&matmul(&b, &r_r), &transpose(&b));
    // Small-angle vector from the antisymmetric part of the near-identity rotation.
    [
        0.5 * (m[2][1] - m[1][2]),
        0.5 * (m[0][2] - m[2][0]),
        0.5 * (m[1][0] - m[0][1]),
    ]
}

// ---------------------------------------------------------------------------
// Truth → recovery point network + injected transform.
// ---------------------------------------------------------------------------

/// Generate `n` well-spread 3-D points on/near the lunar surface (selenographic spread → MCMF),
/// with varied latitude/longitude and a few at altitude, so the set is non-collinear and spans
/// the Moon-fixed frame.
fn point_network(n: usize) -> Vec<Vec3> {
    let n = n.max(3);
    (0..n)
        .map(|k| {
            let f = k as f64 / n as f64;
            // Spread latitude over (−80°, +80°) and longitude over a full turn with a golden-ish
            // step so the points never fall on one great circle.
            let lat = (-80.0 + 160.0 * f).to_radians();
            let lon = ((k as f64) * 137.508).to_radians();
            // A few points at altitude (every third point lifted) so the set has radial spread.
            let alt = if k % 3 == 0 {
                0.0
            } else {
                50_000.0 * ((k % 5) as f64)
            };
            crate::lunar::selenographic_to_mcmf(crate::lunar::Selenographic {
                lat_rad: lat,
                lon_rad: lon,
                alt_m: alt,
            })
        })
        .collect()
}

// ---------------------------------------------------------------------------
// Scenario (TOML `kind = "lunar-frame-realisation"`).
// ---------------------------------------------------------------------------

fn d_n_points() -> usize {
    8
}
fn d_tx_m() -> f64 {
    25.0
}
fn d_ty_m() -> f64 {
    -40.0
}
fn d_tz_m() -> f64 {
    15.0
}
fn d_rot_x_urad() -> f64 {
    3.0
}
fn d_rot_y_urad() -> f64 {
    -2.0
}
fn d_rot_z_urad() -> f64 {
    5.0
}
fn d_scale_ppb() -> f64 {
    100.0 // 1e-7
}
fn d_noise_sigma_m() -> f64 {
    1.0
}
fn d_seed() -> u64 {
    42
}
fn d_epoch_year() -> i32 {
    2024
}
fn d_epoch_month() -> u32 {
    1
}
fn d_epoch_day() -> u32 {
    1
}

/// A runnable frame-realisation scenario: inject a known Helmert transform into a synthetic point
/// network, add seeded Gaussian noise, recover the datum with [`helmert_fit`], and report the
/// recovered datum, the recovery error vs the injected transform, and the post-fit RMS residual.
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct LunarFrameRealiseScenario {
    /// Number of selenographic network points (≥ 3).
    #[serde(default = "d_n_points")]
    pub n_points: usize,
    /// Injected translation x (m).
    #[serde(default = "d_tx_m")]
    pub tx_m: f64,
    /// Injected translation y (m).
    #[serde(default = "d_ty_m")]
    pub ty_m: f64,
    /// Injected translation z (m).
    #[serde(default = "d_tz_m")]
    pub tz_m: f64,
    /// Injected rotation about x (µrad).
    #[serde(default = "d_rot_x_urad")]
    pub rot_x_urad: f64,
    /// Injected rotation about y (µrad).
    #[serde(default = "d_rot_y_urad")]
    pub rot_y_urad: f64,
    /// Injected rotation about z (µrad).
    #[serde(default = "d_rot_z_urad")]
    pub rot_z_urad: f64,
    /// Injected scale (ppb).
    #[serde(default = "d_scale_ppb")]
    pub scale_ppb: f64,
    /// Per-coordinate measurement noise σ (m).
    #[serde(default = "d_noise_sigma_m")]
    pub noise_sigma_m: f64,
    /// RNG seed (deterministic noise).
    #[serde(default = "d_seed")]
    pub seed: u64,
    /// Epoch UTC year (for the ICRF orientation tie).
    #[serde(default = "d_epoch_year")]
    pub epoch_year: i32,
    /// Epoch UTC month (1–12).
    #[serde(default = "d_epoch_month")]
    pub epoch_month: u32,
    /// Epoch UTC day (1–31).
    #[serde(default = "d_epoch_day")]
    pub epoch_day: u32,
}

impl Default for LunarFrameRealiseScenario {
    fn default() -> Self {
        LunarFrameRealiseScenario {
            n_points: d_n_points(),
            tx_m: d_tx_m(),
            ty_m: d_ty_m(),
            tz_m: d_tz_m(),
            rot_x_urad: d_rot_x_urad(),
            rot_y_urad: d_rot_y_urad(),
            rot_z_urad: d_rot_z_urad(),
            scale_ppb: d_scale_ppb(),
            noise_sigma_m: d_noise_sigma_m(),
            seed: d_seed(),
            epoch_year: d_epoch_year(),
            epoch_month: d_epoch_month(),
            epoch_day: d_epoch_day(),
        }
    }
}

impl LunarFrameRealiseScenario {
    /// The injected (truth) datum from the scenario fields.
    fn injected(&self) -> FrameDatum {
        FrameDatum {
            translation_m: [self.tx_m, self.ty_m, self.tz_m],
            rotation_rad: [
                self.rot_x_urad * URAD,
                self.rot_y_urad * URAD,
                self.rot_z_urad * URAD,
            ],
            scale_ppb: self.scale_ppb,
        }
    }

    /// Run the realisation: build the network, apply the injected transform, add seeded noise,
    /// recover and compare.
    pub fn run(&self) -> LunarFrameRealiseReport {
        let injected = self.injected();
        let p = point_network(self.n_points);
        // Datum points: inject the known transform, then add seeded Gaussian noise.
        let mut rng = ChaCha8Rng::seed_from_u64(self.seed);
        // `Normal::new` (rand_distr 0.4) rejects only a non-finite std_dev; an `inf`
        // `noise_sigma_m` would survive the `.max(0.0)` floor, so coerce to a finite
        // value (0.0 ⇒ a degenerate, noise-free draw) first.
        let noise_sigma = {
            let s = self.noise_sigma_m.max(0.0);
            if s.is_finite() {
                s
            } else {
                0.0
            }
        };
        let noise = Normal::new(0.0, noise_sigma)
            .expect("noise_sigma is finite and non-negative, which Normal::new always accepts");
        let q: Vec<Vec3> = p
            .iter()
            .map(|&pi| {
                let qi = apply_helmert(&injected, pi);
                if self.noise_sigma_m > 0.0 {
                    [
                        qi[0] + noise.sample(&mut rng),
                        qi[1] + noise.sample(&mut rng),
                        qi[2] + noise.sample(&mut rng),
                    ]
                } else {
                    qi
                }
            })
            .collect();

        // Weight σ for the fit: the noise σ (floored), so weights reflect the measurement.
        let sigma_fit = self.noise_sigma_m.max(1e-3);
        let realised = realise_frame(&p, &q, sigma_fit).unwrap_or(RealisedFrame {
            datum: FrameDatum {
                translation_m: [f64::NAN; 3],
                rotation_rad: [f64::NAN; 3],
                scale_ppb: f64::NAN,
            },
            rms_residual_m: f64::NAN,
            n_points: p.len(),
            converged: false,
        });

        let rec = realised.datum;
        // Recovery errors (recovered − injected).
        let trans_err_m = [
            rec.translation_m[0] - injected.translation_m[0],
            rec.translation_m[1] - injected.translation_m[1],
            rec.translation_m[2] - injected.translation_m[2],
        ];
        let rot_err_rad = [
            rec.rotation_rad[0] - injected.rotation_rad[0],
            rec.rotation_rad[1] - injected.rotation_rad[1],
            rec.rotation_rad[2] - injected.rotation_rad[2],
        ];
        let scale_err_ppb = rec.scale_ppb - injected.scale_ppb;
        let trans_err_norm_m =
            (trans_err_m[0].powi(2) + trans_err_m[1].powi(2) + trans_err_m[2].powi(2)).sqrt();
        let rot_err_norm_rad =
            (rot_err_rad[0].powi(2) + rot_err_rad[1].powi(2) + rot_err_rad[2].powi(2)).sqrt();

        // ICRF orientation tie of the realised rotation.
        let jd_utc = crate::timescales::julian_date(
            self.epoch_year,
            self.epoch_month,
            self.epoch_day,
            0,
            0,
            0.0,
        );
        let jd_tt = crate::timescales::utc_to_tt(jd_utc);
        let icrf_tie_rad = icrf_orientation_tie(jd_tt, rec.rotation_rad);

        LunarFrameRealiseReport {
            injected,
            recovered: rec,
            trans_err_m,
            rot_err_rad,
            scale_err_ppb,
            trans_err_norm_m,
            rot_err_norm_rad,
            rms_residual_m: realised.rms_residual_m,
            icrf_tie_rad,
            n_points: realised.n_points,
            converged: realised.converged,
        }
    }
}

/// The result of a [`LunarFrameRealiseScenario`]: the injected vs recovered datum, the recovery
/// errors, the post-fit residual and the realised-rotation ICRF orientation tie.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct LunarFrameRealiseReport {
    /// The injected (truth) datum.
    pub injected: FrameDatum,
    /// The recovered datum.
    pub recovered: FrameDatum,
    /// Per-axis translation recovery error (recovered − injected), m.
    pub trans_err_m: [f64; 3],
    /// Per-axis rotation recovery error (recovered − injected), rad.
    pub rot_err_rad: [f64; 3],
    /// Scale recovery error (recovered − injected), ppb.
    pub scale_err_ppb: f64,
    /// Norm of the translation recovery error (m).
    pub trans_err_norm_m: f64,
    /// Norm of the rotation recovery error (rad).
    pub rot_err_norm_rad: f64,
    /// Post-fit RMS residual (m).
    pub rms_residual_m: f64,
    /// The realised rotation expressed about the ICRF axes (rad) — the orientation tie.
    pub icrf_tie_rad: [f64; 3],
    /// Number of network points.
    pub n_points: usize,
    /// Whether the fit converged.
    pub converged: bool,
}

/// Render a [`LunarFrameRealiseReport`] as a self-contained SVG: injected-vs-recovered parameter
/// bars (translation, rotation, scale) with the recovery errors annotated.
pub fn lunar_frame_realise_svg(r: &LunarFrameRealiseReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let ml = 70.0_f64;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"22\" font-size=\"15\" font-weight=\"bold\">Lunar reference-frame realisation — 7-parameter Helmert recovery</text>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"40\" font-size=\"11\">{} points · RMS residual {:.3} m · converged {}</text>",
        r.n_points, r.rms_residual_m, r.converged
    ));

    // A simple row layout: each parameter on its own line, injected vs recovered + error.
    let rows: [(&str, f64, f64, &str); 7] = [
        (
            "tx (m)",
            r.injected.translation_m[0],
            r.recovered.translation_m[0],
            "m",
        ),
        (
            "ty (m)",
            r.injected.translation_m[1],
            r.recovered.translation_m[1],
            "m",
        ),
        (
            "tz (m)",
            r.injected.translation_m[2],
            r.recovered.translation_m[2],
            "m",
        ),
        (
            "θx (µrad)",
            r.injected.rotation_rad[0] / URAD,
            r.recovered.rotation_rad[0] / URAD,
            "µrad",
        ),
        (
            "θy (µrad)",
            r.injected.rotation_rad[1] / URAD,
            r.recovered.rotation_rad[1] / URAD,
            "µrad",
        ),
        (
            "θz (µrad)",
            r.injected.rotation_rad[2] / URAD,
            r.recovered.rotation_rad[2] / URAD,
            "µrad",
        ),
        (
            "scale (ppb)",
            r.injected.scale_ppb,
            r.recovered.scale_ppb,
            "ppb",
        ),
    ];
    let y0 = 70.0_f64;
    let dy = 38.0_f64;
    for (i, (label, inj, rec, unit)) in rows.iter().enumerate() {
        let y = y0 + i as f64 * dy;
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"{y:.0}\" font-size=\"12\">{label}: injected {inj:.4} {unit} · recovered {rec:.4} {unit} · err {:.3e}</text>",
            rec - inj
        ));
        // A thin bar whose length encodes |recovered| relative to |injected| (visual cue only).
        let bar = ((rec.abs() / inj.abs().max(1e-9)).min(2.0)) * 120.0;
        svg.push_str(&format!(
            "<rect x=\"{:.0}\" y=\"{:.0}\" width=\"{bar:.1}\" height=\"6\" fill=\"#7fbf7f\"/>",
            ml + 560.0,
            y - 9.0,
        ));
    }
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A representative well-spread network for the algebraic tests.
    fn net(n: usize) -> Vec<Vec3> {
        point_network(n)
    }

    #[test]
    fn apply_then_fit_recovers_identity_noiseless() {
        // Inject a known Helmert transform, build noiseless datum points, recover the 7 params.
        // Helmert is linear in t/s and near-linear in the small angles, so recovery is near-exact.
        let injected = FrameDatum {
            translation_m: [25.0, -40.0, 15.0],
            rotation_rad: [3.0 * URAD, -2.0 * URAD, 5.0 * URAD],
            scale_ppb: 100.0, // 1e-7
        };
        let p = net(8);
        let q: Vec<Vec3> = p.iter().map(|&pi| apply_helmert(&injected, pi)).collect();
        let rec = helmert_fit(&p, &q, 1.0).expect("fit");

        // Translation < 1e-6 m.
        for k in 0..3 {
            assert!(
                (rec.translation_m[k] - injected.translation_m[k]).abs() < 1e-6,
                "tx[{k}] err = {} m",
                rec.translation_m[k] - injected.translation_m[k]
            );
        }
        // Rotation < 1e-9 rad.
        for k in 0..3 {
            assert!(
                (rec.rotation_rad[k] - injected.rotation_rad[k]).abs() < 1e-9,
                "θ[{k}] err = {} rad",
                rec.rotation_rad[k] - injected.rotation_rad[k]
            );
        }
        // Scale < 1e-12 (dimensionless) ⇒ ppb error < 1e-3.
        assert!(
            (rec.scale_ppb - injected.scale_ppb).abs() * PPB < 1e-12,
            "scale err = {} (dimensionless)",
            (rec.scale_ppb - injected.scale_ppb).abs() * PPB
        );
    }

    #[test]
    fn recovers_with_noise() {
        // With metre-level noise the recovered params land within a few × the formal σ and the
        // post-fit RMS residual sits near the noise level. Recovery quality — not the strict
        // step-norm `converged` flag — is the criterion here: scale is the weakly-observed
        // parameter on a near-spherical point cloud (it resolves only to ~hundreds of ppb under
        // 1 m noise), so its Gauss-Newton step at the noisy optimum stays above the tight tol and
        // the strict flag is legitimately false; the estimate is still statistically correct.
        let r = LunarFrameRealiseScenario {
            noise_sigma_m: 1.0,
            ..LunarFrameRealiseScenario::default()
        }
        .run();
        // Translation error: a metre-level network with ~1 m noise recovers translation to a few m.
        assert!(
            r.trans_err_norm_m < 5.0,
            "translation error {} m too large with 1 m noise",
            r.trans_err_norm_m
        );
        // Rotation error: 1 m noise over a ~1.7e6 m arm ⇒ ~6e-7 rad per point; with 8 points the
        // fitted angle error is well under 1 µrad.
        assert!(
            r.rot_err_norm_rad < 1.0e-6,
            "rotation error {} rad too large with 1 m noise",
            r.rot_err_norm_rad
        );
        // Scale resolves to ~hundreds of ppb (a few × the formal σ of ~117 ppb for this geometry).
        assert!(
            r.scale_err_ppb.abs() < 2000.0,
            "scale error {} ppb too large with 1 m noise",
            r.scale_err_ppb
        );
        // RMS residual near the noise level (within ~3×).
        assert!(
            r.rms_residual_m > 0.1 && r.rms_residual_m < 3.0,
            "rms residual {} m not near the 1 m noise level",
            r.rms_residual_m
        );
        // The reported numbers are all finite (NaN/inf guard).
        assert!(r.trans_err_norm_m.is_finite() && r.scale_err_ppb.is_finite());
    }

    #[test]
    fn apply_helmert_roundtrips() {
        // Apply a datum p→q, then fit the inverse q→p; the inverse datum maps q back to p, and
        // applying the inverse to q recovers the originals to ~machine precision (noiseless).
        let d = FrameDatum {
            translation_m: [12.0, 7.0, -9.0],
            rotation_rad: [-4.0 * URAD, 6.0 * URAD, 2.0 * URAD],
            scale_ppb: 50.0,
        };
        let p = net(8);
        let q: Vec<Vec3> = p.iter().map(|&pi| apply_helmert(&d, pi)).collect();
        // Fit the inverse transform q→p.
        let inv = helmert_fit(&q, &p, 1.0).expect("inverse fit");
        for (&pi, &qi) in p.iter().zip(q.iter()) {
            let back = apply_helmert(&inv, qi);
            for k in 0..3 {
                assert!(
                    (back[k] - pi[k]).abs() < 1e-4,
                    "roundtrip[{k}] = {} vs {}",
                    back[k],
                    pi[k]
                );
            }
        }
    }

    #[test]
    fn deterministic_same_seed() {
        let a = LunarFrameRealiseScenario::default().run();
        let b = LunarFrameRealiseScenario::default().run();
        // Identical seed ⇒ bit-identical recovery.
        assert_eq!(a.trans_err_norm_m, b.trans_err_norm_m);
        assert_eq!(a.rot_err_norm_rad, b.rot_err_norm_rad);
        assert_eq!(a.scale_err_ppb, b.scale_err_ppb);
        assert_eq!(a.rms_residual_m, b.rms_residual_m);

        // Different seed ⇒ a different (but still recovered) outcome.
        let c = LunarFrameRealiseScenario {
            seed: 7,
            ..LunarFrameRealiseScenario::default()
        }
        .run();
        assert_ne!(a.rms_residual_m, c.rms_residual_m);
        // Still a good recovery (the strict step-norm `converged` flag is noise-limited via the
        // weakly-observed scale parameter — see `recovers_with_noise` — so quality is the check).
        assert!(c.trans_err_norm_m < 5.0 && c.rot_err_norm_rad < 1.0e-6);
    }

    #[test]
    fn realise_frame_residual_is_machine_small_noiseless() {
        // Noiseless realisation: the post-fit residual is at machine level.
        let injected = FrameDatum {
            translation_m: [10.0, -20.0, 30.0],
            rotation_rad: [1.0 * URAD, 2.0 * URAD, -3.0 * URAD],
            scale_ppb: 80.0,
        };
        let p = net(10);
        let q: Vec<Vec3> = p.iter().map(|&pi| apply_helmert(&injected, pi)).collect();
        let realised = realise_frame(&p, &q, 1.0).expect("realise");
        assert!(realised.converged, "noiseless realisation did not converge");
        // The machine-small criterion is the post-fit RMS residual, which collapses to the f64
        // floor on noiseless data (the recovered transform reproduces every datum point).
        assert!(
            realised.rms_residual_m < 1e-4,
            "noiseless RMS residual {} m not machine-small",
            realised.rms_residual_m
        );
        assert!(realised.n_points == 10);
    }

    #[test]
    fn rejects_degenerate_input() {
        // Too few points.
        let p = net(2);
        let q = p.clone();
        assert!(helmert_fit(&p[..2], &q[..2], 1.0).is_none());
        // Length mismatch.
        let p3 = net(3);
        let q4 = net(4);
        assert!(helmert_fit(&p3, &q4, 1.0).is_none());
    }

    #[test]
    fn icrf_tie_zero_rotation_is_zero() {
        // A zero realised rotation ⇒ the realised frame coincides with the IAU orientation.
        let jd =
            crate::timescales::utc_to_tt(crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0));
        let tie = icrf_orientation_tie(jd, [0.0, 0.0, 0.0]);
        for (k, &t) in tie.iter().enumerate() {
            assert!(t.abs() < 1e-15, "tie[{k}] = {t} not zero");
        }
    }

    #[test]
    fn icrf_tie_preserves_rotation_magnitude() {
        // A similarity (orthogonal) change of expression preserves the rotation angle: the ICRF
        // tie vector's magnitude equals the realised small-rotation magnitude.
        let jd =
            crate::timescales::utc_to_tt(crate::timescales::julian_date(2024, 1, 1, 0, 0, 0.0));
        let theta = [3.0 * URAD, -2.0 * URAD, 5.0 * URAD];
        let tie = icrf_orientation_tie(jd, theta);
        let in_mag = (theta[0].powi(2) + theta[1].powi(2) + theta[2].powi(2)).sqrt();
        let tie_mag = (tie[0].powi(2) + tie[1].powi(2) + tie[2].powi(2)).sqrt();
        assert!(
            (in_mag - tie_mag).abs() / in_mag < 1e-6,
            "rotation magnitude not preserved: in {in_mag} tie {tie_mag}"
        );
    }

    #[test]
    fn svg_is_self_contained() {
        let r = LunarFrameRealiseScenario::default().run();
        let svg = lunar_frame_realise_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert!(svg.ends_with("</svg>"));
        assert!(svg.contains("Lunar reference-frame realisation"));
    }

    #[test]
    fn run_toml_lunar_frame_realise_dispatches() {
        let out = crate::api::run_toml("kind=\"lunar-frame-realisation\"\n").unwrap();
        assert!(
            out.summary.contains("lunar-frame-realisation"),
            "summary missing kind: {}",
            out.summary
        );
        let j: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        assert!(j["rms_residual_m"].as_f64().unwrap().is_finite());
        assert!(out.svg.starts_with("<svg"));
    }
}
