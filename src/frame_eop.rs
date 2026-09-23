// SPDX-License-Identifier: AGPL-3.0-only
//! Real-time frame / Earth-orientation prediction budget for lunar timing.
//!
//! A lunar navigation frame realised from an Earth-based UT1/polar-motion product is
//! only as good as the *predicted* Earth orientation available in real time: the final
//! IERS values for a given day are not published until weeks later, so an operational
//! service must run on the Bulletin A prediction. This module quantifies the resulting
//! frame error and carries it out to the Moon.
//!
//! - **L18 [`prediction_error_vs_horizon`]** — measures the empirical UT1 prediction
//!   error as a function of horizon straight from the real IERS `finals2000A` series
//!   (parsed by [`crate::eop`]). Two independent, real-data curves:
//!     * the **final floor**: RMS/quantiles of the *rapid* Bulletin A minus *final*
//!       Bulletin B UT1−UTC carried in every final row (columns `[58..68]` vs
//!       `[154..165]`); and
//!     * the **multi-day growth**: the error of a persistence predictor
//!       `UT1(t+h) = UT1(t)` scored against the eventual final UT1 at `t+h`, over the
//!       real daily series. Persistence is the honest zero-parameter predictor whose
//!       error is a real, measured quantity; it replaces P4's two-anchor `a·hᵖ`
//!       stand-in with a curve read off real data.
//! - **L19 [`ut1_error_to_lunar`]** / [`lunar_position_to_ut1`] — the closed-form lever
//!   arm `Δr = D_EM · ω⊕ · ΔUT1`, `Δt = Δr/c`, and its inverse.
//! - **L18 (polar motion) [`pm_prediction_error_vs_horizon`]** — the same measured
//!   rapid-minus-final + persistence curve applied to the Bulletin A/B polar-motion pole
//!   (arc seconds), read off the real `finals2000A` Bulletin B pole columns.
//! - **L20 [`frame_position_error_at_moon`]** / [`polar_motion_position_error`] — projects
//!   predicted-vs-final UT1 *and* polar-motion `x_p`/`y_p` through the lever arm as an RSS
//!   of three small frame rotations.
//! - **G1 [`predicted_rows_summary`] / [`predicted_vs_final_ut1`]** — ingest the real
//!   Bulletin A prediction-only rows and (given two vintages) the true predicted-vs-final
//!   vintage difference.
//! - **G14 [`joint_eop_error_vs_horizon`]** — UT1, polar motion and their quadrature
//!   combination over ONE identical row set per horizon. The two curves above each measure
//!   over whatever rows their own Bulletin B block populates, so their root-sum-square is
//!   not a joint statistic; this intersects the two epoch sets first and reports the epochs
//!   each component was measured at.
//! - **L39 [`frame_eop_svg`]** — a deterministic two-panel chart.
//!
//! ## Validated vs Modelled
//! - **Validated (closed form).** L19's lever arm is exact: `1 ms → 28.03 m → 93.5 ns`
//!   is asserted to tight tolerance, and `ω⊕` is cross-checked against the Earth-rotation
//!   rate underlying [`crate::cio::earth_rotation_angle`]. L20's polar-motion projection
//!   is validated against [`crate::frames::polar_motion_matrix`] applied to a
//!   Moon-distance vector.
//! - **Validated (real data).** L18's final floor and its 1–2 day growth are computed
//!   from the real, verbatim `finals2000A` fixture rows and land in the IERS-published
//!   Bulletin A/B accuracy band (~0.01–0.02 ms final floor rising through the sub-ms
//!   range over days).
//! - **Modelled.** The multi-day *predictor* is persistence, not IERS's operational
//!   least-squares/AR prediction algorithm (which is not reproduced here); it bounds and
//!   characterises the achievable error rather than reproducing the exact Bulletin A
//!   numbers. Horizons longer than the shipped daily fixture spans (h > 4 days) are
//!   reported only when the supplied series reaches them.

use crate::eop::{
    parse_all_predicted, parse_bulletin_b_pm, parse_bulletin_b_ut1, parse_line, EopRecord,
};
use crate::timescales::{ERA_TURNS_PER_UT1_DAY, SECONDS_PER_DAY};

/// Speed of light in vacuum, m/s (defining constant).
pub const C_M_S: f64 = 299_792_458.0;

/// DE440 mean Earth–Moon distance, metres (384 400 km).
pub const D_EM_M: f64 = 384_400_000.0;

/// Earth rotation rate `ω⊕`, rad/s, formed from the ERA rate that
/// [`crate::cio::earth_rotation_angle`] advances at: `τ · 1.00273781191135448 / 86400`.
/// Numerically ≈ `7.292115e-5 rad/s`.
pub const OMEGA_EARTH_RAD_S: f64 = std::f64::consts::TAU * ERA_TURNS_PER_UT1_DAY / SECONDS_PER_DAY;

/// Lever-arm gain `D_EM · ω⊕`, metres of Moon-frame displacement per second of UT1
/// error (≈ 28 033.6 m/s → 28.03 m per ms).
pub const LEVER_M_PER_S: f64 = D_EM_M * OMEGA_EARTH_RAD_S;

/// A prediction horizon: the rapid-minus-final floor, or an integer-day lead time.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Horizon {
    /// The published rapid (Bulletin A) minus final (Bulletin B) residual at zero lead.
    Final,
    /// A whole-day prediction lead time.
    Days(u32),
}

impl Horizon {
    /// Horizon length in days (the [`Horizon::Final`] floor is charted at day 0).
    pub fn days(self) -> f64 {
        match self {
            Horizon::Final => 0.0,
            Horizon::Days(d) => d as f64,
        }
    }
}

/// Empirical UT1 prediction-error statistics at one horizon, in seconds (converted to
/// milliseconds by the `*_ms` accessors). `n` is the number of paired samples.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct HorizonError {
    /// The horizon these statistics were measured at.
    pub horizon: Horizon,
    /// Number of predicted-vs-final residual samples.
    pub n: usize,
    /// Root-mean-square residual, seconds.
    pub rms_s: f64,
    /// Median (50th-percentile) absolute residual, seconds.
    pub p50_s: f64,
    /// 95th-percentile absolute residual, seconds.
    pub p95_s: f64,
    /// Largest absolute residual, seconds.
    pub max_s: f64,
}

impl HorizonError {
    /// RMS residual in milliseconds.
    pub fn rms_ms(&self) -> f64 {
        self.rms_s * 1e3
    }
    /// Median absolute residual in milliseconds.
    pub fn p50_ms(&self) -> f64 {
        self.p50_s * 1e3
    }
    /// 95th-percentile absolute residual in milliseconds.
    pub fn p95_ms(&self) -> f64 {
        self.p95_s * 1e3
    }
    /// Equivalent Moon-frame position error of the RMS UT1 residual, metres.
    pub fn rms_position_m(&self) -> f64 {
        ut1_error_to_lunar(self.rms_s).0
    }
}

/// Nearest-rank percentile of an already-sorted (ascending) slice. `p` in `[0, 1]`.
fn percentile_sorted(sorted: &[f64], p: f64) -> f64 {
    if sorted.is_empty() {
        return 0.0;
    }
    // Nearest-rank: rank = ceil(p · n), clamped to [1, n], 1-indexed.
    let n = sorted.len();
    let rank = (p * n as f64).ceil().max(1.0) as usize;
    sorted[rank.min(n) - 1]
}

/// Reduce a set of absolute residuals (seconds) to [`HorizonError`] statistics.
fn stats(horizon: Horizon, mut abs_resid: Vec<f64>) -> HorizonError {
    let n = abs_resid.len();
    let sum_sq: f64 = abs_resid.iter().map(|r| r * r).sum();
    let rms_s = if n == 0 {
        0.0
    } else {
        (sum_sq / n as f64).sqrt()
    };
    abs_resid.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    HorizonError {
        horizon,
        n,
        rms_s,
        p50_s: percentile_sorted(&abs_resid, 0.50),
        p95_s: percentile_sorted(&abs_resid, 0.95),
        max_s: abs_resid.last().copied().unwrap_or(0.0),
    }
}

/// One parsed daily record used for the prediction-error measurement: the epoch (MJD),
/// the rapid Bulletin A UT1−UTC, and the eventual final Bulletin B UT1−UTC (`None` on a
/// prediction-only row).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DailyUt1 {
    /// Modified Julian Date (UTC).
    pub mjd: f64,
    /// Rapid Bulletin A UT1−UTC, seconds.
    pub ut1_rapid_s: f64,
    /// Final Bulletin B UT1−UTC, seconds (`None` for a prediction-only row).
    pub ut1_final_s: Option<f64>,
}

/// Parse a `finals2000A` file body into per-day UT1 rapid/final pairs, sorted by MJD.
pub fn parse_daily_ut1(body: &str) -> Vec<DailyUt1> {
    let mut out: Vec<DailyUt1> = body
        .lines()
        .filter_map(|line| {
            let rec = parse_line(line)?;
            Some(DailyUt1 {
                mjd: rec.mjd,
                ut1_rapid_s: rec.ut1_utc_s,
                ut1_final_s: parse_bulletin_b_ut1(line),
            })
        })
        .collect();
    out.sort_by(|a, b| {
        a.mjd
            .partial_cmp(&b.mjd)
            .unwrap_or(std::cmp::Ordering::Equal)
    });
    out
}

/// The best available "truth" UT1 for a day: the final Bulletin B value if present,
/// else the rapid Bulletin A value.
fn truth_ut1(d: &DailyUt1) -> f64 {
    d.ut1_final_s.unwrap_or(d.ut1_rapid_s)
}

/// L18 — empirical UT1 prediction error vs horizon, measured from a real `finals2000A`
/// series. Returns one [`HorizonError`] for each requested horizon that the data can
/// populate (a horizon with no paired samples is omitted).
///
/// - [`Horizon::Final`]: `|rapid − final|` over every row carrying both a Bulletin A and
///   a Bulletin B UT1 — the irreducible published floor.
/// - [`Horizon::Days(h)`]: the persistence predictor `UT1(t+h)=UT1(t)` scored against the
///   truth UT1 at `t+h`, for every pair of days exactly `h` apart in the series.
pub fn prediction_error_vs_horizon(body: &str, horizons: &[Horizon]) -> Vec<HorizonError> {
    let daily = parse_daily_ut1(body);
    let mut out = Vec::new();
    for &h in horizons {
        match h {
            Horizon::Final => {
                let resid: Vec<f64> = daily
                    .iter()
                    .filter_map(|d| d.ut1_final_s.map(|f| (d.ut1_rapid_s - f).abs()))
                    .collect();
                if !resid.is_empty() {
                    out.push(stats(Horizon::Final, resid));
                }
            }
            Horizon::Days(days) => {
                let dt = days as f64;
                let mut resid = Vec::new();
                for (i, base) in daily.iter().enumerate() {
                    let target_mjd = base.mjd + dt;
                    // Find a later day exactly `days` apart (integer MJD grid, 1e-6 tol).
                    if let Some(target) = daily[i + 1..]
                        .iter()
                        .find(|d| (d.mjd - target_mjd).abs() < 1e-6)
                    {
                        // Persistence: predict target's UT1 = base's truth UT1.
                        resid.push((truth_ut1(base) - truth_ut1(target)).abs());
                    }
                }
                if !resid.is_empty() {
                    out.push(stats(Horizon::Days(days), resid));
                }
            }
        }
    }
    out
}

/// One parsed daily polar-motion record: the epoch (MJD), the rapid Bulletin A pole
/// `(x_p, y_p)` (arc seconds) and the eventual final Bulletin B pole (`None` on a
/// prediction-only row).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DailyPm {
    /// Modified Julian Date (UTC).
    pub mjd: f64,
    /// Rapid Bulletin A `x_p`, arc seconds.
    pub xp_rapid_as: f64,
    /// Rapid Bulletin A `y_p`, arc seconds.
    pub yp_rapid_as: f64,
    /// Final Bulletin B `(x_p, y_p)`, arc seconds (`None` for a prediction-only row).
    pub pm_final_as: Option<(f64, f64)>,
}

/// Parse a `finals2000A` file body into per-day polar-motion rapid/final pairs, sorted by
/// MJD. The Bulletin A pole comes from [`parse_line`]; the Bulletin B pole from
/// [`crate::eop::parse_bulletin_b_pm`] (blank on prediction-only rows).
pub fn parse_daily_pm(body: &str) -> Vec<DailyPm> {
    let mut out: Vec<DailyPm> = body
        .lines()
        .filter_map(|line| {
            let rec = parse_line(line)?;
            Some(DailyPm {
                mjd: rec.mjd,
                xp_rapid_as: rec.xp_arcsec,
                yp_rapid_as: rec.yp_arcsec,
                pm_final_as: parse_bulletin_b_pm(line),
            })
        })
        .collect();
    out.sort_by(|a, b| {
        a.mjd
            .partial_cmp(&b.mjd)
            .unwrap_or(std::cmp::Ordering::Equal)
    });
    out
}

/// The best available "truth" pole for a day: the final Bulletin B `(x_p, y_p)` if
/// present, else the rapid Bulletin A pole.
fn truth_pm(d: &DailyPm) -> (f64, f64) {
    d.pm_final_as.unwrap_or((d.xp_rapid_as, d.yp_rapid_as))
}

/// L18 (polar motion) — empirical **combined** polar-motion prediction error vs horizon,
/// measured from a real `finals2000A` series, in arc seconds. Same vintage-differencing
/// construction as [`prediction_error_vs_horizon`] for UT1, applied to the pole:
///
/// - [`Horizon::Final`]: the rapid-minus-final pole magnitude
///   `√(Δx_p² + Δy_p²)` over every row carrying both a Bulletin A and a Bulletin B pole —
///   the irreducible published PM floor.
/// - [`Horizon::Days(h)`]: the persistence predictor pole error, the magnitude of the pole
///   displacement over `h` days, for every pair of days exactly `h` apart.
///
/// `rms_s`/`p50_s`/… on the returned [`HorizonError`] carry the pole-error magnitude in
/// **arc seconds** (not seconds of time); use [`polar_motion_position_error`] to map to the
/// Moon-frame position.
pub fn pm_prediction_error_vs_horizon(body: &str, horizons: &[Horizon]) -> Vec<HorizonError> {
    let daily = parse_daily_pm(body);
    let mag = |(dx, dy): (f64, f64)| (dx * dx + dy * dy).sqrt();
    let mut out = Vec::new();
    for &h in horizons {
        match h {
            Horizon::Final => {
                let resid: Vec<f64> = daily
                    .iter()
                    .filter_map(|d| {
                        d.pm_final_as
                            .map(|(fx, fy)| mag((d.xp_rapid_as - fx, d.yp_rapid_as - fy)))
                    })
                    .collect();
                if !resid.is_empty() {
                    out.push(stats(Horizon::Final, resid));
                }
            }
            Horizon::Days(days) => {
                let dt = days as f64;
                let mut resid = Vec::new();
                for (i, base) in daily.iter().enumerate() {
                    let target_mjd = base.mjd + dt;
                    if let Some(target) = daily[i + 1..]
                        .iter()
                        .find(|d| (d.mjd - target_mjd).abs() < 1e-6)
                    {
                        let (bx, by) = truth_pm(base);
                        let (tx, ty) = truth_pm(target);
                        resid.push(mag((bx - tx, by - ty)));
                    }
                }
                if !resid.is_empty() {
                    out.push(stats(Horizon::Days(days), resid));
                }
            }
        }
    }
    out
}

// ---------------------------------------------------------------------------
// G14 — joint UT1 + polar-motion statistic over a COMMON row set.
// ---------------------------------------------------------------------------

/// Key a daily MJD onto an exact integer grid so two independently-built epoch lists can
/// be intersected without float-equality hazards (the `finals2000A` series is tabulated on
/// whole days; the 1e-6 scale matches the tolerance the horizon pairing already uses).
fn epoch_key(mjd: f64) -> i64 {
    (mjd * 1e6).round() as i64
}

/// The per-epoch UT1 residuals (seconds) at one horizon, as `(epoch MJD, |residual|)`
/// pairs in ascending epoch order. The epoch of a [`Horizon::Days`] sample is its **base**
/// day — the day the persistence prediction is issued from — so a UT1 and a polar-motion
/// sample carry the same epoch label exactly when they rest on the same pair of rows.
fn ut1_residuals_by_epoch(daily: &[DailyUt1], h: Horizon) -> Vec<(f64, f64)> {
    let mut out = Vec::new();
    match h {
        Horizon::Final => {
            for d in daily {
                if let Some(f) = d.ut1_final_s {
                    out.push((d.mjd, (d.ut1_rapid_s - f).abs()));
                }
            }
        }
        Horizon::Days(days) => {
            for (i, base) in daily.iter().enumerate() {
                let target_mjd = base.mjd + days as f64;
                if let Some(target) = daily[i + 1..]
                    .iter()
                    .find(|d| (d.mjd - target_mjd).abs() < 1e-6)
                {
                    out.push((base.mjd, (truth_ut1(base) - truth_ut1(target)).abs()));
                }
            }
        }
    }
    out
}

/// The per-epoch **combined pole** residuals (arc seconds) at one horizon, as
/// `(epoch MJD, √(Δx_p² + Δy_p²))` pairs in ascending epoch order. The polar-motion twin of
/// [`ut1_residuals_by_epoch`], built independently from the pole columns.
fn pm_residuals_by_epoch(daily: &[DailyPm], h: Horizon) -> Vec<(f64, f64)> {
    let mag = |dx: f64, dy: f64| (dx * dx + dy * dy).sqrt();
    let mut out = Vec::new();
    match h {
        Horizon::Final => {
            for d in daily {
                if let Some((fx, fy)) = d.pm_final_as {
                    out.push((d.mjd, mag(d.xp_rapid_as - fx, d.yp_rapid_as - fy)));
                }
            }
        }
        Horizon::Days(days) => {
            for (i, base) in daily.iter().enumerate() {
                let target_mjd = base.mjd + days as f64;
                if let Some(target) = daily[i + 1..]
                    .iter()
                    .find(|d| (d.mjd - target_mjd).abs() < 1e-6)
                {
                    let (bx, by) = truth_pm(base);
                    let (tx, ty) = truth_pm(target);
                    out.push((base.mjd, mag(bx - tx, by - ty)));
                }
            }
        }
    }
    out
}

/// How many samples at `epochs` were scored against the RAPID fallback instead of a
/// published Bulletin B final, for each of the two quantities.
///
/// A [`Horizon::Days`] sample spans two days and is a fallback sample when EITHER end
/// lacks a final — the residual is a difference, so one missing final is enough to make it
/// rest on the rapid series. [`Horizon::Final`] is always zero: its residual is
/// rapid-minus-final, which an epoch with no final cannot form.
fn fallback_rows(epochs: &[f64], h: Horizon, has_final: impl Fn(f64) -> Option<bool>) -> usize {
    let Horizon::Days(days) = h else { return 0 };
    epochs
        .iter()
        .filter(|&&m| {
            // An epoch the series does not carry cannot be judged; it is not counted as a
            // fallback, because that would report a gap in the input as a property of the
            // truth rule.
            let base = has_final(m).unwrap_or(true);
            let target = has_final(m + days as f64).unwrap_or(true);
            !base || !target
        })
        .count()
}

/// One component (UT1, polar motion, or their combination) of a [`JointEopError`] row,
/// carrying the epochs it was actually measured at so the "same rows" claim is checkable
/// from the emitted report rather than asserted in prose.
#[derive(Clone, Debug, PartialEq)]
pub struct JointComponent {
    /// `"ut1"`, `"polar-motion"` or `"combined"`.
    pub component: &'static str,
    /// Unit of the `*_native` statistics: `"s"` (UT1), `"arcsec"` (pole), `"m"` (combined).
    pub unit: &'static str,
    /// Which value the samples were scored AGAINST. The two horizons do not use the same
    /// truth, and a reader comparing the floor row against a prediction row has to know it:
    ///
    /// * [`Horizon::Final`] → `"bulletin-b final"`. The residual is `|rapid − final|`, so
    ///   only epochs that carry a published Bulletin B value can contribute at all.
    /// * [`Horizon::Days`] → `"bulletin-b final where published, else bulletin-a rapid"`.
    ///   The persistence predictor is scored against `truth_ut1()` / `truth_pm()`, which
    ///   fall back to the rapid value on days no final exists, so these rows reach epochs
    ///   the floor row cannot.
    ///
    /// This is why a series whose Bulletin B block is shorter than its Bulletin A block
    /// reports FEWER samples at the `final` floor than at a one-day horizon. That rise
    /// looks impossible for nested horizons and is not: the two rows rest on different
    /// truth, which is a fact about what they mean, not a defect.
    pub truth_source: &'static str,
    /// How many of this component's [`Self::n`] samples were actually scored against the
    /// RAPID fallback rather than a published Bulletin B final.
    ///
    /// Always `0` at [`Horizon::Final`], by construction: that residual *is*
    /// rapid-minus-final, so an epoch carrying no final cannot contribute to it at all.
    /// At a [`Horizon::Days`] horizon this is the number that says whether the fallback
    /// named in [`Self::truth_source`] fired once or throughout — naming a fallback
    /// without counting it leaves a reader unable to judge how far the row departs from
    /// the floor row it sits beside.
    pub truth_fallback_rows: usize,
    /// Number of residual samples — equal across the three components of a row.
    pub n: usize,
    /// The epochs (MJD) the samples were measured at, ascending — equal across the three
    /// components of a row.
    pub epochs_mjd: Vec<f64>,
    /// Root-mean-square residual in [`Self::unit`].
    pub rms_native: f64,
    /// Median absolute residual in [`Self::unit`].
    pub p50_native: f64,
    /// 95th-percentile absolute residual in [`Self::unit`].
    pub p95_native: f64,
    /// Largest absolute residual in [`Self::unit`].
    pub max_native: f64,
    /// The RMS residual mapped to a Moon-frame position error through the L19/L20 lever
    /// arms, metres.
    pub rms_position_m: f64,
    /// The 95th-percentile residual through the same lever arms, metres. The mapping is
    /// linear, so this is the p95 of the displacement and not a displacement of the p95 —
    /// the two coincide here, and a test pins that they do.
    pub p95_position_m: f64,
    /// [`Self::rms_position_m`] expressed as the one-way light time it costs, nanoseconds.
    /// A user ranging against this frame sees the error in this unit, not in metres.
    pub rms_light_time_ns: f64,
}

/// One row of the joint Earth-orientation table: UT1, polar motion and their combination
/// at a single horizon, measured over an **identical** epoch set.
///
/// The three components are built by three separate passes over the parsed series and then
/// restricted to the intersection of their epochs, so `n` and `epochs_mjd` agree by
/// construction *and* remain independently checkable.
#[derive(Clone, Debug, PartialEq)]
pub struct JointEopError {
    /// The horizon these statistics were measured at.
    pub horizon: Horizon,
    /// The shared sample count (`ut1.n == polar_motion.n == combined.n`).
    pub n: usize,
    /// UT1 residual statistics over the shared epochs (seconds).
    pub ut1: JointComponent,
    /// Combined-pole residual statistics over the same shared epochs (arc seconds).
    pub polar_motion: JointComponent,
    /// Their quadrature combination at the Moon over the same shared epochs (metres): the
    /// per-epoch `√(Δr_UT1² + Δr_pole²)`, reduced by the same statistics.
    pub combined: JointComponent,
}

/// Build one [`JointComponent`] from `(epoch, residual)` pairs and the linear map from the
/// residual's native unit to a Moon-frame position (metres).
fn joint_component(
    component: &'static str,
    unit: &'static str,
    horizon: Horizon,
    pairs: &[(f64, f64)],
    truth_fallback_rows: usize,
    to_position_m: impl Fn(f64) -> f64,
) -> JointComponent {
    let s = stats(horizon, pairs.iter().map(|(_, r)| *r).collect());
    JointComponent {
        component,
        unit,
        truth_source: match horizon {
            Horizon::Final => "bulletin-b final",
            Horizon::Days(_) => "bulletin-b final where published, else bulletin-a rapid",
        },
        truth_fallback_rows,
        n: s.n,
        epochs_mjd: pairs.iter().map(|(m, _)| *m).collect(),
        rms_native: s.rms_s,
        p50_native: s.p50_s,
        p95_native: s.p95_s,
        max_native: s.max_s,
        rms_position_m: to_position_m(s.rms_s),
        p95_position_m: to_position_m(s.p95_s),
        rms_light_time_ns: to_position_m(s.rms_s) / C_M_S * 1e9,
    }
}

/// G14 — the **joint** Earth-orientation prediction-error table: UT1, polar motion and
/// their combination reported over one **identical** row set per horizon.
///
/// [`prediction_error_vs_horizon`] and [`pm_prediction_error_vs_horizon`] each measure over
/// whatever rows their own Bulletin B block populates, so the two can (and on real files
/// do) cover different epochs — a Bulletin A prediction-only row carries neither final, and
/// the UT1 persistence pairing reaches rows the pole floor cannot. Root-sum-squaring two
/// statistics taken over different epochs sizes a correction; it is not a joint statistic.
/// This function intersects the two epoch sets first and reduces all three components over
/// that shared set, so the combination is a genuine joint quantity.
///
/// The combined component is the per-epoch quadrature sum of the two Moon-frame
/// displacements, `√((D_EM·ω⊕·ΔUT1)² + (D_EM·Δpole)²)` — the L20 projection of
/// [`frame_position_error_at_moon`] evaluated row by row. Because the root-mean-square of a
/// per-row hypotenuse equals the hypotenuse of the per-row root-mean-squares, its
/// `rms_position_m` is exactly `hypot(ut1.rms_position_m, polar_motion.rms_position_m)` —
/// an identity the tests check against the independently-computed component RMSs.
///
/// A horizon whose shared epoch set is empty is omitted (never faked), exactly as the two
/// single-quantity curves do.
pub fn joint_eop_error_vs_horizon(body: &str, horizons: &[Horizon]) -> Vec<JointEopError> {
    let daily_ut1 = parse_daily_ut1(body);
    let daily_pm = parse_daily_pm(body);
    let mut out = Vec::new();
    for &h in horizons {
        let u = ut1_residuals_by_epoch(&daily_ut1, h);
        let p = pm_residuals_by_epoch(&daily_pm, h);
        // The shared epoch set: only days where BOTH quantities produced a residual.
        let u_keys: std::collections::BTreeSet<i64> =
            u.iter().map(|(m, _)| epoch_key(*m)).collect();
        let p_keys: std::collections::BTreeSet<i64> =
            p.iter().map(|(m, _)| epoch_key(*m)).collect();
        let shared: std::collections::BTreeSet<i64> =
            u_keys.intersection(&p_keys).copied().collect();
        if shared.is_empty() {
            continue;
        }
        let keep = |pairs: &[(f64, f64)]| -> Vec<(f64, f64)> {
            pairs
                .iter()
                .filter(|(m, _)| shared.contains(&epoch_key(*m)))
                .copied()
                .collect()
        };
        let u_shared = keep(&u);
        let p_shared = keep(&p);
        // Per-epoch quadrature combination, joined on the shared epoch key.
        let pm_pos = |as_: f64| polar_motion_position_error(as_ * crate::eop::ARCSEC_TO_RAD, 0.0);
        let ut1_pos = |s_: f64| ut1_error_to_lunar(s_).0;
        let combined: Vec<(f64, f64)> = u_shared
            .iter()
            .filter_map(|(m, ur)| {
                p_shared
                    .iter()
                    .find(|(pm, _)| epoch_key(*pm) == epoch_key(*m))
                    .map(|(_, pr)| {
                        let a = ut1_pos(*ur);
                        let b = pm_pos(*pr);
                        (*m, (a * a + b * b).sqrt())
                    })
            })
            .collect();
        // Which of the kept samples rested on the rapid fallback. `combined` is a joint
        // sample, so it falls back when EITHER of its two quantities did — the union, not
        // either count on its own.
        let u_epochs: Vec<f64> = u_shared.iter().map(|(m, _)| *m).collect();
        let p_epochs: Vec<f64> = p_shared.iter().map(|(m, _)| *m).collect();
        let ut1_has_final = |m: f64| {
            daily_ut1
                .iter()
                .find(|d| epoch_key(d.mjd) == epoch_key(m))
                .map(|d| d.ut1_final_s.is_some())
        };
        let pm_has_final = |m: f64| {
            daily_pm
                .iter()
                .find(|d| epoch_key(d.mjd) == epoch_key(m))
                .map(|d| d.pm_final_as.is_some())
        };
        let u_fb = fallback_rows(&u_epochs, h, ut1_has_final);
        let p_fb = fallback_rows(&p_epochs, h, pm_has_final);
        let c_epochs: Vec<f64> = combined.iter().map(|(m, _)| *m).collect();
        let c_fb = fallback_rows(&c_epochs, h, |m| {
            match (ut1_has_final(m), pm_has_final(m)) {
                (None, None) => None,
                (a, b) => Some(a.unwrap_or(true) && b.unwrap_or(true)),
            }
        });
        let ut1 = joint_component("ut1", "s", h, &u_shared, u_fb, ut1_pos);
        let polar_motion = joint_component("polar-motion", "arcsec", h, &p_shared, p_fb, pm_pos);
        let combined = joint_component("combined", "m", h, &combined, c_fb, |m| m);
        out.push(JointEopError {
            horizon: h,
            n: ut1.n,
            ut1,
            polar_motion,
            combined,
        });
    }
    out
}

/// A count and horizon span of the **real Bulletin A prediction-only rows** a
/// `finals2000A` file publishes (the future rows whose Bulletin B section is blank).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PredictedRowsSummary {
    /// Number of Bulletin A prediction-only rows (blank Bulletin B).
    pub n: usize,
    /// First (earliest) predicted MJD, if any.
    pub first_mjd: Option<f64>,
    /// Last (farthest-ahead) predicted MJD, if any.
    pub last_mjd: Option<f64>,
}

/// Ingest the **real Bulletin A predicted rows** of a `finals2000A` body through
/// [`crate::eop::parse_all_predicted`] and summarise them: how many future (blank
/// Bulletin B) rows the file carries and the horizon they span. This exercises the
/// predicted-column parser on real data — the rows a real-time consumer would actually
/// run on before the finals are published.
pub fn predicted_rows_summary(body: &str) -> PredictedRowsSummary {
    let preds: Vec<EopRecord> = parse_all_predicted(body);
    let mjds: Vec<f64> = preds.iter().map(|r| r.mjd).collect();
    PredictedRowsSummary {
        n: preds.len(),
        first_mjd: mjds
            .iter()
            .cloned()
            .fold(None, |acc, m| Some(acc.map_or(m, |a: f64| a.min(m)))),
        last_mjd: mjds
            .iter()
            .cloned()
            .fold(None, |acc, m| Some(acc.map_or(m, |a: f64| a.max(m)))),
    }
}

/// **Vintage-differenced** predicted-vs-final UT1 residual vs horizon (seconds), the
/// genuinely-correct IERS construction the persistence proxy only approximates.
///
/// Given an **as-issued** `finals2000A` vintage (the file as it stood in real time,
/// carrying Bulletin A *predicted* rows for then-future dates) and a **later** vintage
/// (the same product after those dates became Bulletin B final), this differences the
/// Bulletin A predicted UT1 of the as-issued vintage against the eventual Bulletin B final
/// of the later vintage, for every date present in **both** as a prediction-then-final.
/// The horizon of each residual is `final_mjd − issue_reference_mjd`, where
/// `issue_reference_mjd` is the last date the as-issued vintage carries a *final* (its data
/// cutoff): a prediction `h` days past the cutoff is scored at horizon `h`.
///
/// Returns one [`HorizonError`] per requested horizon that both vintages can populate; a
/// horizon with no matched predicted→final pair is omitted (never faked). This is the true
/// vintage differencing — it needs an archived older vintage, so it is only exercised when
/// a genuine second vintage is supplied.
pub fn predicted_vs_final_ut1(
    as_issued: &str,
    later_final: &str,
    horizons: &[Horizon],
) -> Vec<HorizonError> {
    // As-issued predicted rows (blank Bulletin B) and the issue cutoff (last final MJD).
    let issued = parse_all_predicted(as_issued);
    let cutoff = parse_daily_ut1(as_issued)
        .iter()
        .filter(|d| d.ut1_final_s.is_some())
        .map(|d| d.mjd)
        .fold(f64::NEG_INFINITY, f64::max);
    // Later-vintage finals, keyed by MJD.
    let later: Vec<DailyUt1> = parse_daily_ut1(later_final);
    let final_at = |mjd: f64| -> Option<f64> {
        later
            .iter()
            .find(|d| (d.mjd - mjd).abs() < 1e-6)
            .and_then(|d| d.ut1_final_s)
    };

    let mut out = Vec::new();
    for &h in horizons {
        let Horizon::Days(days) = h else { continue };
        if !cutoff.is_finite() {
            continue;
        }
        let target = cutoff + days as f64;
        let resid: Vec<f64> = issued
            .iter()
            .filter(|p| (p.mjd - target).abs() < 1e-6)
            .filter_map(|p| final_at(p.mjd).map(|f| (p.ut1_utc_s - f).abs()))
            .collect();
        if !resid.is_empty() {
            out.push(stats(Horizon::Days(days), resid));
        }
    }
    out
}

// ---------------------------------------------------------------------------
// G13 — an operational-style Earth-orientation predictor, and the
// archived-vintage predicted-vs-final comparison.
// ---------------------------------------------------------------------------

/// Annual period, days (one Julian year). The dominant seasonal term in both UT1 and
/// polar motion, and the first periodic term IERS fits for Bulletin A.
pub const ANNUAL_PERIOD_DAYS: f64 = 365.25;

/// Semi-annual period, days — half of [`ANNUAL_PERIOD_DAYS`].
pub const SEMIANNUAL_PERIOD_DAYS: f64 = ANNUAL_PERIOD_DAYS / 2.0;

/// Chandler-wobble period, days (≈433 d): the free Eulerian nutation of the pole. A
/// **polar-motion-only** term — it does not appear in UT1.
pub const CHANDLER_PERIOD_DAYS: f64 = 433.0;

/// Monthly zonal-tide period `Mm`, days (the lunar anomalistic month).
///
/// IERS does not *fit* this term: it **removes** the zonal tides from UT1 with the
/// tabulated IERS Conventions (2010) Table 8.1 coefficients to form UT1R, fits the
/// smooth remainder, and restores the tides on output. This crate has no zonal-tide
/// coefficient table, so it carries the two principal zonal-tide periods as fitted
/// `cos`/`sin` pairs instead — the same physics with the amplitude estimated over the
/// window rather than tabulated. The deviation is declared in the emitted model block;
/// it matters because on a real daily series the sub-monthly UT1 variation these two
/// terms carry is *larger* than the day-to-day drift a bias/rate pair can model, so a
/// predictor without them does not beat persistence at a 1–2 day lead.
pub const MONTHLY_ZONAL_TIDE_PERIOD_DAYS: f64 = 27.554_550;

/// Fortnightly zonal-tide period `Mf`, days — the dominant sub-monthly UT1 term. See
/// [`MONTHLY_ZONAL_TIDE_PERIOD_DAYS`] for why it is fitted rather than tabulated.
pub const FORTNIGHTLY_ZONAL_TIDE_PERIOD_DAYS: f64 = 13.660_791;

/// Default least-squares fitting window, days.
///
/// IERS fits Bulletin A over the **last 365 days**; no series committed with this
/// repository is anywhere near that long, so a 365-day default would admit no
/// complete-window issue epoch and the predictor would never run on the shipped data. The
/// default is derived from two constraints that have nothing to do with the result:
///
/// * **at most 19 days**, so that *both* committed verbatim real `finals2000A` extracts
///   can populate it — the 2026 extract carries 20 final rows, a 19-day span; and
/// * **at least ≈13.8 days**, so the longest periodic term the shipped data can constrain
///   at all — the monthly zonal tide, [`MONTHLY_ZONAL_TIDE_PERIOD_DAYS`] — clears the
///   half-cycle admission threshold.
///
/// 15 days is the round value inside that band. It is a *default*, not a tuned constant:
/// the window is a scenario input, the emitted model block reports the value in force and
/// the terms it admitted, and the measured operational-versus-persistence ratio is stable
/// across the whole 10–25 day band.
pub const DEFAULT_OPERATIONAL_WINDOW_DAYS: f64 = 15.0;

/// MJD comparison tolerance for the whole-day `finals2000A` grid (matches the tolerance
/// the horizon pairing already uses).
const MJD_EPS: f64 = 1e-6;

/// One periodic term of the operational model: a `cos`/`sin` pair at a fixed period.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PeriodicTerm {
    /// Term name as emitted in the report (`"annual"`, `"semi-annual"`, `"chandler"`).
    pub name: &'static str,
    /// Period, days.
    pub period_days: f64,
}

/// The periodic terms of the **UT1** model: annual, semi-annual and the two principal
/// zonal tides (monthly `Mm`, fortnightly `Mf`). The Chandler wobble is a polar-motion
/// mode and is deliberately absent; the zonal-tide pair stands in for the tabulated UT1R
/// reduction this crate does not carry (see [`MONTHLY_ZONAL_TIDE_PERIOD_DAYS`]).
///
/// Ordered long period first, so a short window admits the terms it can constrain and
/// rejects the rest in a stable, reported order.
pub const UT1_PERIODIC_TERMS: &[PeriodicTerm] = &[
    PeriodicTerm {
        name: "annual",
        period_days: ANNUAL_PERIOD_DAYS,
    },
    PeriodicTerm {
        name: "semi-annual",
        period_days: SEMIANNUAL_PERIOD_DAYS,
    },
    PeriodicTerm {
        name: "monthly-zonal-tide",
        period_days: MONTHLY_ZONAL_TIDE_PERIOD_DAYS,
    },
    PeriodicTerm {
        name: "fortnightly-zonal-tide",
        period_days: FORTNIGHTLY_ZONAL_TIDE_PERIOD_DAYS,
    },
];

/// The periodic terms of the **polar-motion** model: the Chandler wobble, annual and
/// semi-annual — the set IERS fits for the Bulletin A pole prediction. No zonal-tide pair:
/// the tidal polar-motion terms are diurnal and semi-diurnal, and a daily-sampled series
/// cannot carry them.
///
/// Ordered long period first, matching [`UT1_PERIODIC_TERMS`].
pub const PM_PERIODIC_TERMS: &[PeriodicTerm] = &[
    PeriodicTerm {
        name: "chandler",
        period_days: CHANDLER_PERIOD_DAYS,
    },
    PeriodicTerm {
        name: "annual",
        period_days: ANNUAL_PERIOD_DAYS,
    },
    PeriodicTerm {
        name: "semi-annual",
        period_days: SEMIANNUAL_PERIOD_DAYS,
    },
];

/// Configuration of the G13 operational-style Earth-orientation predictor.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct OperationalPredictorConfig {
    /// Least-squares fitting window, days. The fit uses observations in
    /// `[issue_mjd − window_days, issue_mjd]` and **requires the window to be complete**
    /// (the series must reach back to its start), so a partially-filled window never
    /// masquerades as a full one. Default [`DEFAULT_OPERATIONAL_WINDOW_DAYS`].
    pub window_days: f64,
    /// Minimum number of cycles of a periodic term the fitting window must span before
    /// that term is admitted to the design matrix. Default 0.5 (half a cycle). A window
    /// spanning a small fraction of a period cannot separate that sinusoid from the
    /// bias/rate pair — admitting it anyway produces a near-degenerate normal matrix and a
    /// wild extrapolation. Terms that fail the test are **reported as rejected**, with the
    /// number of cycles the window actually spans, rather than silently dropped.
    pub min_cycle_fraction: f64,
    /// Carry the last in-window fit residual forward onto every forecast (default `true`).
    ///
    /// IERS follows its least-squares extrapolation with an **autoregressive** model of
    /// the fit residuals and adds the two. This is the zero-decay limit of that stage: the
    /// residual at the last observation is held constant over the forecast, so the
    /// forecast is continuous with the last value a real-time user actually has. Set
    /// `false` for the bare least-squares extrapolation. The AR filter itself is *not*
    /// reproduced.
    pub anchor_residual: bool,
}

impl Default for OperationalPredictorConfig {
    fn default() -> Self {
        Self {
            window_days: DEFAULT_OPERATIONAL_WINDOW_DAYS,
            min_cycle_fraction: 0.5,
            anchor_residual: true,
        }
    }
}

/// A periodic term the fitting window was too short to constrain, reported rather than
/// silently dropped.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RejectedTerm {
    /// The term's name.
    pub name: &'static str,
    /// The term's period, days.
    pub period_days: f64,
    /// How many cycles of that period the fitting window actually spans.
    pub cycles_spanned: f64,
    /// The admission threshold in cycles
    /// ([`OperationalPredictorConfig::min_cycle_fraction`]).
    pub threshold_cycles: f64,
}

/// A fitted operational-style Earth-orientation model, valid for forecasts **after**
/// [`Self::issue_mjd`].
///
/// The model is
/// `y(t) = a + b·(t − T)/W + Σₖ [cₖ·cos(2π(t−T)/Pₖ) + sₖ·sin(2π(t−T)/Pₖ)] + r`,
/// where `T` is the issue epoch, `W` the window length, `Pₖ` the admitted periods and `r`
/// the anchored residual (zero when
/// [`OperationalPredictorConfig::anchor_residual`] is `false`).
#[derive(Clone, Debug, PartialEq)]
pub struct OperationalFit {
    /// The epoch the forecast is issued at (MJD). No observation later than this entered
    /// the fit — [`Self::window_last_mjd`] is the proof, and it is emitted.
    pub issue_mjd: f64,
    /// The configured window length, days.
    pub window_days: f64,
    /// Earliest observation MJD in the fitting window.
    pub window_first_mjd: f64,
    /// Latest observation MJD in the fitting window. Always `<= issue_mjd`.
    pub window_last_mjd: f64,
    /// Number of observations the fit used.
    pub n_fit: usize,
    /// Names of the fitted terms, in design-matrix order (`"bias"`, `"rate"`, then each
    /// admitted periodic term).
    pub term_names: Vec<&'static str>,
    /// Periodic terms the window was too short to admit, with the cycles it spans.
    pub rejected_terms: Vec<RejectedTerm>,
    /// Fitted coefficients `[a, b, c₁, s₁, c₂, s₂, …]`, in the native unit of the fitted
    /// quantity (seconds for UT1−TAI, arc seconds for a pole coordinate).
    pub coefficients: Vec<f64>,
    /// Periods (days) of the admitted periodic terms, in coefficient-pair order.
    pub periods_days: Vec<f64>,
    /// The residual at [`Self::window_last_mjd`] carried onto every forecast (native
    /// unit); `0.0` when residual anchoring is off.
    pub anchor_residual: f64,
    /// Root-mean-square in-window post-fit residual (native unit) — a within-window
    /// goodness measure, **not** a prediction error.
    pub rms_fit_residual: f64,
}

impl OperationalFit {
    /// Evaluate the fitted model at `target_mjd` (native unit of the fitted quantity).
    ///
    /// Nothing here consults an observation: the forecast is a function of the fitted
    /// coefficients alone, so evaluating it at an epoch inside the window is a *fit* and
    /// evaluating it beyond [`Self::issue_mjd`] is a *prediction*.
    pub fn predict(&self, target_mjd: f64) -> f64 {
        let t = target_mjd - self.issue_mjd;
        let mut y = self.coefficients[0] + self.coefficients[1] * (t / self.window_days);
        for (k, p) in self.periods_days.iter().enumerate() {
            let w = std::f64::consts::TAU * t / p;
            y += self.coefficients[2 + 2 * k] * w.cos() + self.coefficients[3 + 2 * k] * w.sin();
        }
        y + self.anchor_residual
    }
}

/// Solve the normal system `A x = b` by Gaussian elimination with partial pivoting.
/// Returns `None` when the matrix is numerically singular (a design that could not
/// separate its own columns).
fn solve_normal_system(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let k = b.len();
    for col in 0..k {
        let mut p = col;
        for row in (col + 1)..k {
            if a[row][col].abs() > a[p][col].abs() {
                p = row;
            }
        }
        if !a[p][col].is_finite() || a[p][col].abs() < 1e-300 {
            return None;
        }
        a.swap(col, p);
        b.swap(col, p);
        for row in (col + 1)..k {
            let f = a[row][col] / a[col][col];
            // `row > col`, so the pivot row and the row being eliminated are disjoint.
            let (upper, lower) = a.split_at_mut(row);
            for (t, p) in lower[0][col..].iter_mut().zip(&upper[col][col..]) {
                *t -= f * p;
            }
            b[row] -= f * b[col];
        }
    }
    let mut x = vec![0.0; k];
    for i in (0..k).rev() {
        let mut s = b[i];
        for c in (i + 1)..k {
            s -= a[i][c] * x[c];
        }
        x[i] = s / a[i][i];
    }
    x.iter().all(|v| v.is_finite()).then_some(x)
}

/// Fit the operational-style model to `(mjd, value)` samples for a forecast issued at
/// `issue_mjd`.
///
/// **No look-ahead by construction.** Every sample later than `issue_mjd` is discarded
/// before anything else happens, so the returned fit cannot depend on an observation at or
/// after the epoch it will be asked to predict; [`OperationalFit::window_last_mjd`] carries
/// the proof into the emitted report. The window must additionally be *complete* — the
/// samples must reach back to `issue_mjd − window_days` — so a short archive quietly
/// producing a two-point "30-day fit" is refused (`None`) rather than reported.
///
/// Returns `None` when the window is incomplete, when fewer than two observations per
/// fitted parameter are available, or when the normal matrix is singular.
pub fn fit_operational(
    samples: &[(f64, f64)],
    issue_mjd: f64,
    terms: &[PeriodicTerm],
    cfg: &OperationalPredictorConfig,
) -> Option<OperationalFit> {
    if !(cfg.window_days.is_finite() && cfg.window_days > 0.0) {
        return None;
    }
    // The look-ahead barrier: nothing after the issue epoch survives this filter.
    let window: Vec<(f64, f64)> = samples
        .iter()
        .copied()
        .filter(|(m, v)| {
            m.is_finite()
                && v.is_finite()
                && *m <= issue_mjd + MJD_EPS
                && *m >= issue_mjd - cfg.window_days - MJD_EPS
        })
        .collect();
    if window.len() < 2 {
        return None;
    }
    let first = window.iter().map(|(m, _)| *m).fold(f64::INFINITY, f64::min);
    let last = window
        .iter()
        .map(|(m, _)| *m)
        .fold(f64::NEG_INFINITY, f64::max);
    // A complete window, or nothing: a partial window is not the model that was declared.
    if first > issue_mjd - cfg.window_days + MJD_EPS {
        return None;
    }
    let span = last - first;
    let mut periods = Vec::new();
    let mut term_names: Vec<&'static str> = vec!["bias", "rate"];
    let mut rejected = Vec::new();
    for t in terms {
        let cycles = span / t.period_days;
        if cycles >= cfg.min_cycle_fraction {
            periods.push(t.period_days);
            term_names.push(t.name);
        } else {
            rejected.push(RejectedTerm {
                name: t.name,
                period_days: t.period_days,
                cycles_spanned: cycles,
                threshold_cycles: cfg.min_cycle_fraction,
            });
        }
    }
    let n_params = 2 + 2 * periods.len();
    // At least two observations per fitted parameter, so the fit is never a near-exact
    // interpolation of its own window.
    if window.len() < 2 * n_params {
        return None;
    }

    let row = |mjd: f64| -> Vec<f64> {
        let t = mjd - issue_mjd;
        let mut r = vec![1.0, t / cfg.window_days];
        for p in &periods {
            let w = std::f64::consts::TAU * t / p;
            r.push(w.cos());
            r.push(w.sin());
        }
        r
    };
    let mut ata = vec![vec![0.0f64; n_params]; n_params];
    let mut atb = vec![0.0f64; n_params];
    for (m, v) in &window {
        let r = row(*m);
        for i in 0..n_params {
            atb[i] += r[i] * v;
            for j in 0..n_params {
                ata[i][j] += r[i] * r[j];
            }
        }
    }
    let coefficients = solve_normal_system(ata, atb)?;

    let model_at = |mjd: f64| -> f64 {
        row(mjd)
            .iter()
            .zip(&coefficients)
            .map(|(a, b)| a * b)
            .sum::<f64>()
    };
    let sum_sq: f64 = window
        .iter()
        .map(|(m, v)| {
            let e = v - model_at(*m);
            e * e
        })
        .sum();
    let rms_fit_residual = (sum_sq / window.len() as f64).sqrt();
    let anchor_residual = if cfg.anchor_residual {
        let v_last = window
            .iter()
            .filter(|(m, _)| (m - last).abs() < MJD_EPS)
            .map(|(_, v)| *v)
            .next_back()?;
        v_last - model_at(last)
    } else {
        0.0
    };

    Some(OperationalFit {
        issue_mjd,
        window_days: cfg.window_days,
        window_first_mjd: first,
        window_last_mjd: last,
        n_fit: window.len(),
        term_names,
        rejected_terms: rejected,
        coefficients,
        periods_days: periods,
        anchor_residual,
        rms_fit_residual,
    })
}

/// TAI − UTC (seconds) at an MJD, from the crate leap-second table.
fn dat_at(mjd: f64) -> f64 {
    crate::timescales::tai_minus_utc(mjd + crate::timescales::MJD_OFFSET)
}

/// The UT1 − TAI series a real-time user has at hand: the **rapid Bulletin A** UT1−UTC of
/// each row with the leap-second step removed, so the fit sees a continuous quantity.
/// Bulletin B finals are deliberately NOT used here — they are not published yet at the
/// epoch the forecast is issued, and fitting them would be look-ahead.
fn rapid_ut1_tai_samples(daily: &[DailyUt1]) -> Vec<(f64, f64)> {
    daily
        .iter()
        .map(|d| (d.mjd, d.ut1_rapid_s - dat_at(d.mjd)))
        .collect()
}

/// A representative pair of operational fits for a series: the UT1 and the `x_p` model as
/// they stand at the series' **last** epoch — the most recent forecast the product could
/// have issued. Returned so a report can show which periodic terms the configured window
/// actually admitted and which it rejected, instead of naming a model class in prose.
///
/// Either element is `None` when that quantity's window at the last epoch is incomplete.
pub fn latest_operational_fits(
    body: &str,
    cfg: &OperationalPredictorConfig,
) -> (Option<OperationalFit>, Option<OperationalFit>) {
    let daily_ut1 = parse_daily_ut1(body);
    let daily_pm = parse_daily_pm(body);
    let last = daily_ut1
        .iter()
        .map(|d| d.mjd)
        .fold(f64::NEG_INFINITY, f64::max);
    if !last.is_finite() {
        return (None, None);
    }
    let xp_samples: Vec<(f64, f64)> = daily_pm.iter().map(|d| (d.mjd, d.xp_rapid_as)).collect();
    (
        fit_operational(
            &rapid_ut1_tai_samples(&daily_ut1),
            last,
            UT1_PERIODIC_TERMS,
            cfg,
        ),
        fit_operational(&xp_samples, last, PM_PERIODIC_TERMS, cfg),
    )
}

/// One predictor's error statistics for one Earth-orientation quantity at one horizon.
///
/// `*_native` are in [`Self::unit`]; the `*_position_m` columns are the same residuals
/// carried to the Moon through the L19/L20 lever arms.
#[derive(Clone, Debug, PartialEq)]
pub struct PredictorError {
    /// `"operational"`, `"persistence"` or `"archived-bulletin-a"`.
    pub predictor: &'static str,
    /// `"ut1"`, `"polar-motion"` or `"combined"`.
    pub quantity: &'static str,
    /// Unit of the `*_native` statistics: `"s"`, `"arcsec"` or `"m"`.
    pub unit: &'static str,
    /// Number of predicted-versus-final residual samples.
    pub n: usize,
    /// Root-mean-square residual in [`Self::unit`].
    pub rms_native: f64,
    /// Median absolute residual in [`Self::unit`].
    pub p50_native: f64,
    /// 95th-percentile absolute residual in [`Self::unit`].
    pub p95_native: f64,
    /// Largest absolute residual in [`Self::unit`].
    pub max_native: f64,
    /// [`Self::rms_native`] as a Moon-frame position error, metres.
    pub rms_position_m: f64,
    /// [`Self::p95_native`] as a Moon-frame position error, metres.
    pub p95_position_m: f64,
    /// [`Self::rms_position_m`] as the one-way light time it costs, nanoseconds.
    pub rms_light_time_ns: f64,
}

/// Reduce absolute residuals to a [`PredictorError`] through a linear map from the
/// residual's native unit to a Moon-frame position (metres).
fn predictor_error(
    predictor: &'static str,
    quantity: &'static str,
    unit: &'static str,
    resid: &[f64],
    to_position_m: impl Fn(f64) -> f64,
) -> PredictorError {
    let s = stats(Horizon::Final, resid.to_vec());
    PredictorError {
        predictor,
        quantity,
        unit,
        n: s.n,
        rms_native: s.rms_s,
        p50_native: s.p50_s,
        p95_native: s.p95_s,
        max_native: s.max_s,
        rms_position_m: to_position_m(s.rms_s),
        p95_position_m: to_position_m(s.p95_s),
        rms_light_time_ns: to_position_m(s.rms_s) / C_M_S * 1e9,
    }
}

/// A UT1 residual (seconds) as a Moon-frame position error, metres.
fn ut1_to_position_m(s: f64) -> f64 {
    ut1_error_to_lunar(s).0
}

/// A combined-pole residual (arc seconds) as a Moon-frame position error, metres.
fn pm_to_position_m(arcsec: f64) -> f64 {
    polar_motion_position_error(arcsec * crate::eop::ARCSEC_TO_RAD, 0.0)
}

/// One horizon row of the G13 operational-versus-persistence **predicted-versus-final**
/// comparison: both predictors scored over one identical issue-epoch set, against the
/// later-published Bulletin B final.
#[derive(Clone, Debug, PartialEq)]
pub struct PredictorComparisonRow {
    /// The horizon these statistics were measured at.
    pub horizon: Horizon,
    /// Shared sample count — identical for every component of the row.
    pub n: usize,
    /// The issue epochs (MJD) the forecasts were made at, ascending.
    pub epochs_mjd: Vec<f64>,
    /// The target epochs (MJD) the forecasts were scored at (`epoch + horizon`).
    pub target_mjds: Vec<f64>,
    /// Smallest lead (days) between any fit window's last observation and the epoch that
    /// fit was asked to predict. Strictly positive whenever the row exists — the emitted
    /// proof that no fit could see its own target.
    pub min_fit_lead_days: f64,
    /// Fewest observations any of the row's fits used.
    pub fit_rows_min: usize,
    /// Most observations any of the row's fits used.
    pub fit_rows_max: usize,
    /// UT1 error of the operational predictor (seconds).
    pub ut1_operational: PredictorError,
    /// UT1 error of the persistence predictor over the same epochs (seconds).
    pub ut1_persistence: PredictorError,
    /// Combined-pole error of the operational predictor (arc seconds).
    pub pm_operational: PredictorError,
    /// Combined-pole error of the persistence predictor over the same epochs (arc
    /// seconds).
    pub pm_persistence: PredictorError,
    /// Per-epoch quadrature combination of the two operational components, metres.
    pub combined_operational: PredictorError,
    /// Per-epoch quadrature combination of the two persistence components, metres.
    pub combined_persistence: PredictorError,
}

impl PredictorComparisonRow {
    /// Ratio of the persistence RMS to the operational RMS for the combined Moon-frame
    /// position error: how many times smaller the operational predictor's error is.
    /// `None` when the operational RMS is not positive.
    pub fn combined_improvement_factor(&self) -> Option<f64> {
        let o = self.combined_operational.rms_position_m;
        (o > 0.0).then(|| self.combined_persistence.rms_position_m / o)
    }
}

/// The per-epoch predicted-versus-final residuals of both predictors at one horizon.
struct HorizonSamples {
    epochs: Vec<f64>,
    targets: Vec<f64>,
    ut1_op: Vec<f64>,
    ut1_pers: Vec<f64>,
    pm_op: Vec<f64>,
    pm_pers: Vec<f64>,
    comb_op: Vec<f64>,
    comb_pers: Vec<f64>,
    min_lead: f64,
    fit_rows_min: usize,
    fit_rows_max: usize,
}

/// Find the row of a daily series at exactly `mjd`.
fn at_mjd<T: Copy>(rows: &[T], mjd: f64, key: impl Fn(&T) -> f64) -> Option<T> {
    rows.iter()
        .find(|r| (key(r) - mjd).abs() < MJD_EPS)
        .copied()
}

/// Collect both predictors' residuals at one horizon over the epochs where **every**
/// ingredient is genuinely present: a complete fit window ending at or before the issue
/// epoch, and a published Bulletin B **final** UT1 *and* pole at the target epoch. An
/// epoch missing any of those is skipped; nothing is back-filled and no truth value is
/// ever taken from the rapid column.
#[allow(clippy::too_many_arguments)]
fn collect_horizon_samples(
    daily_ut1: &[DailyUt1],
    daily_pm: &[DailyPm],
    ut1_samples: &[(f64, f64)],
    xp_samples: &[(f64, f64)],
    yp_samples: &[(f64, f64)],
    days: u32,
    cfg: &OperationalPredictorConfig,
) -> HorizonSamples {
    let mut s = HorizonSamples {
        epochs: Vec::new(),
        targets: Vec::new(),
        ut1_op: Vec::new(),
        ut1_pers: Vec::new(),
        pm_op: Vec::new(),
        pm_pers: Vec::new(),
        comb_op: Vec::new(),
        comb_pers: Vec::new(),
        min_lead: f64::INFINITY,
        fit_rows_min: usize::MAX,
        fit_rows_max: 0,
    };
    let mag = |dx: f64, dy: f64| (dx * dx + dy * dy).sqrt();
    for base in daily_ut1 {
        let t = base.mjd;
        let target = t + days as f64;
        let Some(final_ut1) = at_mjd(daily_ut1, target, |d| d.mjd).and_then(|d| d.ut1_final_s)
        else {
            continue;
        };
        let Some((final_xp, final_yp)) =
            at_mjd(daily_pm, target, |d| d.mjd).and_then(|d| d.pm_final_as)
        else {
            continue;
        };
        let Some(p_base) = at_mjd(daily_pm, t, |d| d.mjd) else {
            continue;
        };
        let (Some(f_ut1), Some(f_xp), Some(f_yp)) = (
            fit_operational(ut1_samples, t, UT1_PERIODIC_TERMS, cfg),
            fit_operational(xp_samples, t, PM_PERIODIC_TERMS, cfg),
            fit_operational(yp_samples, t, PM_PERIODIC_TERMS, cfg),
        ) else {
            continue;
        };

        // Operational: the fitted models evaluated at the target, UT1 restored to UTC.
        let op_ut1 = f_ut1.predict(target) + dat_at(target);
        let op_xp = f_xp.predict(target);
        let op_yp = f_yp.predict(target);
        // Persistence: the last rapid value a real-time user holds, carried forward. The
        // same leap-second restoration is applied to both, so the two columns differ in
        // the predictor and in nothing else.
        let pers_ut1 = (base.ut1_rapid_s - dat_at(t)) + dat_at(target);
        let (pers_xp, pers_yp) = (p_base.xp_rapid_as, p_base.yp_rapid_as);

        let r_ut1_op = (op_ut1 - final_ut1).abs();
        let r_ut1_pers = (pers_ut1 - final_ut1).abs();
        let r_pm_op = mag(op_xp - final_xp, op_yp - final_yp);
        let r_pm_pers = mag(pers_xp - final_xp, pers_yp - final_yp);

        s.epochs.push(t);
        s.targets.push(target);
        s.comb_op
            .push(mag(ut1_to_position_m(r_ut1_op), pm_to_position_m(r_pm_op)));
        s.comb_pers.push(mag(
            ut1_to_position_m(r_ut1_pers),
            pm_to_position_m(r_pm_pers),
        ));
        s.ut1_op.push(r_ut1_op);
        s.ut1_pers.push(r_ut1_pers);
        s.pm_op.push(r_pm_op);
        s.pm_pers.push(r_pm_pers);
        for f in [&f_ut1, &f_xp, &f_yp] {
            s.min_lead = s.min_lead.min(target - f.window_last_mjd);
            s.fit_rows_min = s.fit_rows_min.min(f.n_fit);
            s.fit_rows_max = s.fit_rows_max.max(f.n_fit);
        }
    }
    s
}

/// G13 — the **operational-versus-persistence predicted-versus-final** table.
///
/// For every issue epoch `T` the series supports, an operational-style forecast for `T+h`
/// is formed from observations **at or before `T`** (and only from the rapid Bulletin A
/// column, which is what a real-time user holds), then scored against the *later-published
/// Bulletin B final* at `T+h`. The persistence forecast `UT1(T+h) = UT1(T)` is scored over
/// the **same** epochs against the **same** finals, so the two columns differ in the
/// predictor and in nothing else.
///
/// A target epoch without a published final is skipped — the comparison never falls back
/// to the rapid value as truth, because "the later published final" is the only honest
/// definition of the thing a prediction is wrong about. [`Horizon::Final`] is skipped: it
/// is a publication residual at zero lead, not a forecast.
///
/// Returns one row per horizon the data can populate; a horizon with no usable epoch is
/// omitted and never faked.
pub fn operational_vs_persistence_vs_horizon(
    body: &str,
    horizons: &[Horizon],
    cfg: &OperationalPredictorConfig,
) -> Vec<PredictorComparisonRow> {
    let daily_ut1 = parse_daily_ut1(body);
    let daily_pm = parse_daily_pm(body);
    let ut1_samples = rapid_ut1_tai_samples(&daily_ut1);
    let xp_samples: Vec<(f64, f64)> = daily_pm.iter().map(|d| (d.mjd, d.xp_rapid_as)).collect();
    let yp_samples: Vec<(f64, f64)> = daily_pm.iter().map(|d| (d.mjd, d.yp_rapid_as)).collect();

    let mut out = Vec::new();
    for &h in horizons {
        let Horizon::Days(days) = h else { continue };
        let s = collect_horizon_samples(
            &daily_ut1,
            &daily_pm,
            &ut1_samples,
            &xp_samples,
            &yp_samples,
            days,
            cfg,
        );
        if s.epochs.is_empty() {
            continue;
        }
        out.push(PredictorComparisonRow {
            horizon: h,
            n: s.epochs.len(),
            min_fit_lead_days: s.min_lead,
            fit_rows_min: s.fit_rows_min,
            fit_rows_max: s.fit_rows_max,
            ut1_operational: predictor_error(
                "operational",
                "ut1",
                "s",
                &s.ut1_op,
                ut1_to_position_m,
            ),
            ut1_persistence: predictor_error(
                "persistence",
                "ut1",
                "s",
                &s.ut1_pers,
                ut1_to_position_m,
            ),
            pm_operational: predictor_error(
                "operational",
                "polar-motion",
                "arcsec",
                &s.pm_op,
                pm_to_position_m,
            ),
            pm_persistence: predictor_error(
                "persistence",
                "polar-motion",
                "arcsec",
                &s.pm_pers,
                pm_to_position_m,
            ),
            combined_operational: predictor_error(
                "operational",
                "combined",
                "m",
                &s.comb_op,
                |m| m,
            ),
            combined_persistence: predictor_error("persistence", "combined", "m", &s.comb_pers, {
                |m| m
            }),
            epochs_mjd: s.epochs,
            target_mjds: s.targets,
        })
    }
    out
}

/// The horizon (days) at which a measured error curve crosses `target_position_m`, by
/// linear interpolation **between two measured horizons that bracket it**.
///
/// Returns `None` when the curve never brackets the target — the honest answer when the
/// crossing lies beyond the longest measured horizon, because extrapolating a measured
/// curve past its own data is how a horizon claim gets invented. `curve` is
/// `(horizon_days, position_m)` pairs; they need not be sorted.
pub fn equivalent_horizon_days(curve: &[(f64, f64)], target_position_m: f64) -> Option<f64> {
    let mut pts: Vec<(f64, f64)> = curve
        .iter()
        .copied()
        .filter(|(d, p)| d.is_finite() && p.is_finite())
        .collect();
    pts.sort_by(|a, b| a.0.partial_cmp(&b.0).unwrap_or(std::cmp::Ordering::Equal));
    for w in pts.windows(2) {
        let ((d0, p0), (d1, p1)) = (w[0], w[1]);
        if (p0.min(p1)..=p0.max(p1)).contains(&target_position_m) && (p1 - p0).abs() > 0.0 {
            return Some(d0 + (target_position_m - p0) * (d1 - d0) / (p1 - p0));
        }
    }
    None
}

/// One horizon row of the G13 **archived-vintage** predicted-versus-final comparison: the
/// genuine IERS Bulletin A prediction archived in the as-issued vintage, this crate's
/// operational-style forecast fitted on that same as-issued vintage, and persistence — all
/// three scored against the later vintage's published Bulletin B final for the same date.
#[derive(Clone, Debug, PartialEq)]
pub struct ArchivedVintageRow {
    /// The horizon these statistics were measured at.
    pub horizon: Horizon,
    /// The as-issued vintage's data cutoff (MJD): the last date it carries a final for,
    /// and therefore the epoch every forecast in this row is issued at.
    pub issue_mjd: f64,
    /// Number of matched predicted→final pairs.
    pub n: usize,
    /// The target epochs (MJD) scored.
    pub epochs_mjd: Vec<f64>,
    /// UT1 error of the archived Bulletin A prediction (seconds).
    pub ut1_archived: PredictorError,
    /// UT1 error of this crate's operational-style forecast (seconds).
    pub ut1_operational: PredictorError,
    /// UT1 error of persistence (seconds).
    pub ut1_persistence: PredictorError,
    /// Combined-pole error of the archived Bulletin A prediction (arc seconds).
    pub pm_archived: PredictorError,
    /// Combined-pole error of this crate's operational-style forecast (arc seconds).
    pub pm_operational: PredictorError,
    /// Combined-pole error of persistence (arc seconds).
    pub pm_persistence: PredictorError,
}

/// G13 — the **archived-vintage** predicted-versus-final comparison path.
///
/// This is the only construction in which the error of a *genuine archived prediction* can
/// be measured: the `as_issued` vintage is the product as it stood at its own data cutoff
/// `T`, carrying real Bulletin A predictions for dates `T+h` that had no final yet, and
/// `later_final` is the same product after those dates became Bulletin B final. For each
/// horizon it scores three forecasts for `T+h` against that later final — the archived
/// Bulletin A prediction, this crate's operational-style fit over the as-issued vintage's
/// rapid rows, and persistence at `T`.
///
/// Requires two real vintages. A horizon with no matched predicted→final pair is omitted;
/// a second vintage is never synthesised from the first, because a perturbed copy of one
/// vintage would make every number below a measurement of the perturbation.
pub fn archived_vintage_comparison(
    as_issued: &str,
    later_final: &str,
    horizons: &[Horizon],
    cfg: &OperationalPredictorConfig,
) -> Vec<ArchivedVintageRow> {
    let issued_pred = parse_all_predicted(as_issued);
    let issued_ut1 = parse_daily_ut1(as_issued);
    let issued_pm = parse_daily_pm(as_issued);
    let cutoff = issued_ut1
        .iter()
        .filter(|d| d.ut1_final_s.is_some())
        .map(|d| d.mjd)
        .fold(f64::NEG_INFINITY, f64::max);
    if !cutoff.is_finite() {
        return Vec::new();
    }
    let later_ut1 = parse_daily_ut1(later_final);
    let later_pm = parse_daily_pm(later_final);

    let ut1_samples = rapid_ut1_tai_samples(&issued_ut1);
    let xp_samples: Vec<(f64, f64)> = issued_pm.iter().map(|d| (d.mjd, d.xp_rapid_as)).collect();
    let yp_samples: Vec<(f64, f64)> = issued_pm.iter().map(|d| (d.mjd, d.yp_rapid_as)).collect();
    let base_ut1 = at_mjd(&issued_ut1, cutoff, |d| d.mjd);
    let base_pm = at_mjd(&issued_pm, cutoff, |d| d.mjd);
    let fit_ut1 = fit_operational(&ut1_samples, cutoff, UT1_PERIODIC_TERMS, cfg);
    let fit_xp = fit_operational(&xp_samples, cutoff, PM_PERIODIC_TERMS, cfg);
    let fit_yp = fit_operational(&yp_samples, cutoff, PM_PERIODIC_TERMS, cfg);
    let mag = |dx: f64, dy: f64| (dx * dx + dy * dy).sqrt();

    let mut out = Vec::new();
    for &h in horizons {
        let Horizon::Days(days) = h else { continue };
        let target = cutoff + days as f64;
        let mut epochs = Vec::new();
        let (mut a_u, mut o_u, mut p_u) = (Vec::new(), Vec::new(), Vec::new());
        let (mut a_p, mut o_p, mut p_p) = (Vec::new(), Vec::new(), Vec::new());
        for pred in issued_pred
            .iter()
            .filter(|p| (p.mjd - target).abs() < MJD_EPS)
        {
            let Some(f_ut1) = at_mjd(&later_ut1, pred.mjd, |d| d.mjd).and_then(|d| d.ut1_final_s)
            else {
                continue;
            };
            epochs.push(pred.mjd);
            a_u.push((pred.ut1_utc_s - f_ut1).abs());
            if let Some(fit) = &fit_ut1 {
                o_u.push((fit.predict(pred.mjd) + dat_at(pred.mjd) - f_ut1).abs());
            }
            if let Some(b) = base_ut1 {
                p_u.push(((b.ut1_rapid_s - dat_at(cutoff) + dat_at(pred.mjd)) - f_ut1).abs());
            }
            if let Some((fx, fy)) =
                at_mjd(&later_pm, pred.mjd, |d| d.mjd).and_then(|d| d.pm_final_as)
            {
                a_p.push(mag(pred.xp_arcsec - fx, pred.yp_arcsec - fy));
                if let (Some(fx_fit), Some(fy_fit)) = (&fit_xp, &fit_yp) {
                    o_p.push(mag(
                        fx_fit.predict(pred.mjd) - fx,
                        fy_fit.predict(pred.mjd) - fy,
                    ));
                }
                if let Some(b) = base_pm {
                    p_p.push(mag(b.xp_rapid_as - fx, b.yp_rapid_as - fy));
                }
            }
        }
        if epochs.is_empty() {
            continue;
        }
        out.push(ArchivedVintageRow {
            horizon: h,
            issue_mjd: cutoff,
            n: epochs.len(),
            epochs_mjd: epochs,
            ut1_archived: predictor_error(
                "archived-bulletin-a",
                "ut1",
                "s",
                &a_u,
                ut1_to_position_m,
            ),
            ut1_operational: predictor_error("operational", "ut1", "s", &o_u, ut1_to_position_m),
            ut1_persistence: predictor_error("persistence", "ut1", "s", &p_u, ut1_to_position_m),
            pm_archived: predictor_error(
                "archived-bulletin-a",
                "polar-motion",
                "arcsec",
                &a_p,
                pm_to_position_m,
            ),
            pm_operational: predictor_error(
                "operational",
                "polar-motion",
                "arcsec",
                &o_p,
                pm_to_position_m,
            ),
            pm_persistence: predictor_error(
                "persistence",
                "polar-motion",
                "arcsec",
                &p_p,
                pm_to_position_m,
            ),
        });
    }
    out
}

/// How closely this crate's operational-style forecast tracks the **genuine archived IERS
/// Bulletin A prediction** the same file publishes for the same future dates.
///
/// This is an *agreement* statistic, not an error: neither quantity is a truth value, and
/// no Bulletin B final is involved. It exists because a single real `finals2000A` fetch
/// does carry genuine archived predictions even when it carries no later vintage to score
/// them against, so the model class implemented here can still be checked against the
/// operational product it stands in for.
#[derive(Clone, Debug, PartialEq)]
pub struct BulletinAAgreement {
    /// The as-issued data cutoff (MJD) the forecast is issued at.
    pub issue_mjd: f64,
    /// Number of published prediction rows compared.
    pub n: usize,
    /// Lead time (days) of the nearest published prediction row.
    pub first_lead_days: f64,
    /// Lead time (days) of the farthest published prediction row.
    pub last_lead_days: f64,
    /// RMS UT1 difference from the published Bulletin A prediction, seconds.
    pub ut1_rms_s: f64,
    /// That difference as a Moon-frame position, metres.
    pub ut1_rms_position_m: f64,
    /// RMS combined-pole difference from the published Bulletin A prediction, arc seconds.
    pub pm_rms_arcsec: f64,
    /// That difference as a Moon-frame position, metres.
    pub pm_rms_position_m: f64,
    /// The per-lead differences the RMS figures above reduce, so a reader can see where
    /// the two predictors part company instead of only how far apart they are on average.
    pub leads: Vec<BulletinALead>,
}

/// One published-prediction row compared against this crate's forecast for the same date.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct BulletinALead {
    /// Lead time past the as-issued data cutoff, days.
    pub lead_days: f64,
    /// |this crate's UT1 forecast − the published Bulletin A prediction|, seconds.
    pub ut1_diff_s: f64,
    /// That difference as a Moon-frame position, metres.
    pub ut1_position_m: f64,
    /// |this crate's pole forecast − the published Bulletin A prediction|, arc seconds.
    pub pm_diff_arcsec: f64,
    /// That difference as a Moon-frame position, metres.
    pub pm_position_m: f64,
}

/// Compare this crate's operational-style forecast against the genuine archived Bulletin A
/// prediction rows a real `finals2000A` product publishes — see [`BulletinAAgreement`].
/// Returns `None` when the file carries no prediction rows past its own data cutoff, or
/// when the fit window at that cutoff is incomplete.
pub fn bulletin_a_agreement(
    body: &str,
    cfg: &OperationalPredictorConfig,
) -> Option<BulletinAAgreement> {
    let preds = parse_all_predicted(body);
    if preds.is_empty() {
        return None;
    }
    let daily_ut1 = parse_daily_ut1(body);
    let daily_pm = parse_daily_pm(body);
    let cutoff = daily_ut1
        .iter()
        .filter(|d| d.ut1_final_s.is_some())
        .map(|d| d.mjd)
        .fold(f64::NEG_INFINITY, f64::max);
    if !cutoff.is_finite() {
        return None;
    }
    let f_ut1 = fit_operational(
        &rapid_ut1_tai_samples(&daily_ut1),
        cutoff,
        UT1_PERIODIC_TERMS,
        cfg,
    )?;
    let xp_samples: Vec<(f64, f64)> = daily_pm.iter().map(|d| (d.mjd, d.xp_rapid_as)).collect();
    let yp_samples: Vec<(f64, f64)> = daily_pm.iter().map(|d| (d.mjd, d.yp_rapid_as)).collect();
    let f_xp = fit_operational(&xp_samples, cutoff, PM_PERIODIC_TERMS, cfg)?;
    let f_yp = fit_operational(&yp_samples, cutoff, PM_PERIODIC_TERMS, cfg)?;

    let ahead: Vec<&EopRecord> = preds.iter().filter(|p| p.mjd > cutoff + MJD_EPS).collect();
    if ahead.is_empty() {
        return None;
    }
    let mut du = Vec::new();
    let mut dp = Vec::new();
    let mut leads = Vec::new();
    for p in &ahead {
        let u = (f_ut1.predict(p.mjd) + dat_at(p.mjd) - p.ut1_utc_s).abs();
        let dx = f_xp.predict(p.mjd) - p.xp_arcsec;
        let dy = f_yp.predict(p.mjd) - p.yp_arcsec;
        let m = (dx * dx + dy * dy).sqrt();
        du.push(u);
        dp.push(m);
        leads.push(BulletinALead {
            lead_days: p.mjd - cutoff,
            ut1_diff_s: u,
            ut1_position_m: ut1_to_position_m(u),
            pm_diff_arcsec: m,
            pm_position_m: pm_to_position_m(m),
        });
    }
    leads.sort_by(|a, b| {
        a.lead_days
            .partial_cmp(&b.lead_days)
            .unwrap_or(std::cmp::Ordering::Equal)
    });
    let rms = |v: &[f64]| (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt();
    let ut1_rms_s = rms(&du);
    let pm_rms_arcsec = rms(&dp);
    Some(BulletinAAgreement {
        issue_mjd: cutoff,
        n: ahead.len(),
        first_lead_days: leads.first().map(|l| l.lead_days).unwrap_or(0.0),
        last_lead_days: leads.last().map(|l| l.lead_days).unwrap_or(0.0),
        ut1_rms_s,
        ut1_rms_position_m: ut1_to_position_m(ut1_rms_s),
        pm_rms_arcsec,
        pm_rms_position_m: pm_to_position_m(pm_rms_arcsec),
        leads,
    })
}

/// L19 — map a UT1 error (seconds) to the induced lunar frame error: the tangential
/// position displacement of a point at the Earth–Moon distance, `Δr = D_EM · ω⊕ · ΔUT1`,
/// and the equivalent light-time `Δt = Δr / c`.
///
/// Returns `(position_m, time_s)`.
pub fn ut1_error_to_lunar(delta_ut1_s: f64) -> (f64, f64) {
    let position_m = LEVER_M_PER_S * delta_ut1_s;
    let time_s = position_m / C_M_S;
    (position_m, time_s)
}

/// L19 (inverse) — the UT1 error (seconds) that a given Moon-frame position error
/// (metres) implies: `ΔUT1 = Δr / (D_EM · ω⊕)`.
pub fn lunar_position_to_ut1(position_m: f64) -> f64 {
    position_m / LEVER_M_PER_S
}

/// L20 — the Moon-frame position error carried by a *combined* Earth-orientation
/// prediction error: a UT1 error (seconds) plus polar-motion pole errors `Δx_p`, `Δy_p`
/// (radians). Each is a small rotation of the terrestrial frame; a point at the
/// Earth–Moon distance is displaced by the root-sum-square of the three lever arms,
/// `D_EM · √((ω⊕·ΔUT1)² + Δx_p² + Δy_p²)`, metres.
///
/// The UT1 term reproduces [`ut1_error_to_lunar`]; the polar-motion terms are validated
/// against [`crate::frames::polar_motion_matrix`] in the tests.
pub fn frame_position_error_at_moon(delta_ut1_s: f64, delta_xp_rad: f64, delta_yp_rad: f64) -> f64 {
    let ut1_rot = OMEGA_EARTH_RAD_S * delta_ut1_s;
    D_EM_M * (ut1_rot * ut1_rot + delta_xp_rad * delta_xp_rad + delta_yp_rad * delta_yp_rad).sqrt()
}

/// L20 (polar motion only) — the Moon-frame position error carried by a **polar-motion**
/// pole prediction error `(Δx_p, Δy_p)` (radians), with no UT1 term: a point at the
/// Earth–Moon distance is displaced by `D_EM · √(Δx_p² + Δy_p²)`, metres. This is the pole
/// projection of [`frame_position_error_at_moon`] with `ΔUT1 = 0`, named explicitly so the
/// polar-motion residual curve ([`pm_prediction_error_vs_horizon`]) can be mapped to the
/// Moon directly. Validated against [`crate::frames::polar_motion_matrix`] in the tests.
pub fn polar_motion_position_error(delta_xp_rad: f64, delta_yp_rad: f64) -> f64 {
    frame_position_error_at_moon(0.0, delta_xp_rad, delta_yp_rad)
}

// ---------------------------------------------------------------------------
// L21 — integrated real-time frame-error budget (EOP + ephemeris + realization).
// ---------------------------------------------------------------------------

/// The full real-time lunar frame-error budget, each term derived from a covariance the
/// rest of the program already uses rather than asserted.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct FrameErrorBudget {
    /// Earth-orientation (UT1 + polar-motion) prediction term at the Moon (m).
    pub eop_term_m: f64,
    /// Lunar-ephemeris real-time prediction term (m) — the L13 OD covariance propagated
    /// through the prediction latency.
    pub ephemeris_term_m: f64,
    /// Frame-realization floor (m) — the datum-recovery (Helmert) residual.
    pub frame_realization_floor_m: f64,
    /// Total real-time frame error (m): the root-sum-square of the three terms.
    pub total_m: f64,
    /// Total as an equivalent timing error (ns): `total_m / c`.
    pub total_time_ns: f64,
}

/// L21 — compose the real-time lunar frame-error budget as the root-sum-square of its
/// three physically-derived terms: the Earth-orientation prediction term
/// ([`frame_position_error_at_moon`], UT1 + polar motion), the lunar-ephemeris real-time
/// prediction term (the L13 OD covariance `ephemeris_cov` propagated through `latency_s`
/// via [`crate::lunar_frame_predict::predict_frame_error`]), and the frame-realization
/// floor (the Helmert datum-recovery residual, [`crate::lunar_frame_realise`]). Replaces
/// P4's asserted secondary/floor constants with derived terms.
pub fn frame_error_budget(
    delta_ut1_s: f64,
    delta_xp_rad: f64,
    delta_yp_rad: f64,
    ephemeris_cov: crate::lunar_frame_predict::OdCovariance,
    latency_s: f64,
    frame_realization_floor_m: f64,
) -> FrameErrorBudget {
    let eop = frame_position_error_at_moon(delta_ut1_s, delta_xp_rad, delta_yp_rad);
    let eph = crate::lunar_frame_predict::predict_frame_error(ephemeris_cov, latency_s)
        .predicted_pos_sigma_m;
    let floor = frame_realization_floor_m.max(0.0);
    let total = (eop * eop + eph * eph + floor * floor).sqrt();
    FrameErrorBudget {
        eop_term_m: eop,
        ephemeris_term_m: eph,
        frame_realization_floor_m: floor,
        total_m: total,
        total_time_ns: total / C_M_S * 1e9,
    }
}

/// Derive the L21 frame-realization floor (m) from an **actual Helmert datum
/// realisation** rather than an asserted constant: run [`crate::lunar_frame_realise`]'s
/// 7-parameter similarity fit on its default injected-transform network at the given
/// per-coordinate measurement noise `noise_sigma_m`, and return the post-fit RMS residual
/// [`crate::lunar_frame_realise::RealisedFrame::rms_residual_m`]. That residual is the
/// datum-recovery floor the fit provably attains: on noiseless data it collapses to the
/// f64 level, and under metre-level tie noise it sits near the tie-noise level (the fit
/// recovers the 7 parameters, leaving only the unmodelled per-point scatter). This ties
/// the floor to a genuine computation with an analytic oracle (the injected-Helmert
/// recovery already tested in `lunar_frame_realise`), replacing the bare `0.2 m`.
pub fn derived_frame_realization_floor_m(noise_sigma_m: f64) -> f64 {
    crate::lunar_frame_realise::LunarFrameRealiseScenario {
        noise_sigma_m,
        ..crate::lunar_frame_realise::LunarFrameRealiseScenario::default()
    }
    .run()
    .rms_residual_m
}

// ---------------------------------------------------------------------------
// L39 — deterministic two-panel SVG.
// ---------------------------------------------------------------------------

/// Total SVG canvas width, px.
pub const SVG_W: f64 = 860.0;
/// Total SVG canvas height, px.
pub const SVG_H: f64 = 640.0;
const ML: f64 = 84.0;
const MR: f64 = 92.0;
const PW: f64 = SVG_W - ML - MR;
const PANEL_A_TOP: f64 = 48.0;
const PANEL_B_TOP: f64 = 372.0;
const PANEL_H: f64 = 200.0;

/// Horizon axis span, days (0..[`X_MAX_DAYS`]) shared by both panels.
pub const X_MAX_DAYS: f64 = 12.0;
/// Panel (a) UT1-error axis maximum, milliseconds.
pub const A_Y_MAX_MS: f64 = 1.2;
/// Panel (b) position-at-Moon axis maximum, metres.
pub const B_Y_MAX_M: f64 = 40.0;

/// Panel (a) reference marker: the ~0.5 ms UT1 error whose Moon-frame equivalent is the
/// ~15 m [`MARKER_POS_M`] line in panel (b).
pub const MARKER_UT1_MS: f64 = 0.5;
/// The horizon (days) at which the prediction error is called out on both panels.
pub const MARKER_HORIZON_DAYS: f64 = 5.0;
/// Panel (b) reference marker: the 15 m Moon-frame position error.
pub const MARKER_POS_M: f64 = 15.0;

/// Pixel x of a horizon in days, shared by both panels.
pub fn x_of_days(days: f64) -> f64 {
    ML + (days / X_MAX_DAYS) * PW
}

/// Pixel y of a UT1 error (milliseconds) in panel (a).
pub fn a_y_of_ms(ms: f64) -> f64 {
    PANEL_A_TOP + PANEL_H - (ms / A_Y_MAX_MS).clamp(0.0, 1.0) * PANEL_H
}

/// Pixel y of a Moon-frame position error (metres) in panel (b).
pub fn b_y_of_m(m: f64) -> f64 {
    PANEL_B_TOP + PANEL_H - (m / B_Y_MAX_M).clamp(0.0, 1.0) * PANEL_H
}

fn polyline(points: &[(f64, f64)], stroke: &str) -> String {
    let pts = points
        .iter()
        .map(|(x, y)| format!("{x:.1},{y:.1}"))
        .collect::<Vec<_>>()
        .join(" ");
    format!("<polyline fill=\"none\" stroke=\"{stroke}\" stroke-width=\"2\" points=\"{pts}\"/>")
}

/// The genuine multi-day growth annotation for the position panel: the ratio of the RMS
/// Moon-frame position at the **longest day-horizon actually present** in the measured
/// curve to the **1-day** horizon, together with that longest horizon in days. Returns
/// `None` when the curve does not carry both a 1-day horizon and at least one longer one,
/// or when the 1-day value is non-positive (so no misleading annotation is drawn).
///
/// The "longest" horizon is selected by the largest day **value** (`Horizon::days()`),
/// not the position in the slice — the previous code picked the max day *index* and a
/// non-monotone sample could make the annotation understate the growth. Because
/// [`rms_position_m`](HorizonError::rms_position_m) is a strictly increasing image of the
/// UT1 RMS and persistence error grows with lead time, the returned factor is the honest
/// growth over the real span; there is no baked-in "~5x".
pub fn growth_annotation(curve: &[HorizonError]) -> Option<(f64, f64)> {
    let one = curve
        .iter()
        .find(|h| h.horizon == Horizon::Days(1))
        .map(|h| h.rms_position_m())?;
    if one <= 0.0 || !one.is_finite() {
        return None;
    }
    // Longest day-horizon by day VALUE (not slice index).
    let (far_days, far_pos) = curve
        .iter()
        .filter_map(|h| match h.horizon {
            Horizon::Days(d) if d >= 2 => Some((d as f64, h.rms_position_m())),
            _ => None,
        })
        .max_by(|a, b| a.0.partial_cmp(&b.0).unwrap_or(std::cmp::Ordering::Equal))?;
    Some((far_pos / one, far_days))
}

/// L39 — render the frame/EOP prediction budget as a deterministic two-panel SVG from a
/// measured [`prediction_error_vs_horizon`] curve.
///
/// Panel (a) plots UT1 prediction error (ms) vs horizon, with the IERS final-floor line,
/// the ~0.5 ms / ~15 m marker and a 5-day reference axis marker. Panel (b) plots the
/// equivalent Moon-frame position error (m) vs horizon with a right-hand equivalent-timing
/// (ns) axis, the 15 m marker, and the GENUINE [`growth_annotation`] (the measured
/// 1-day → longest-real-horizon growth factor, not a baked-in "~5x").
pub fn frame_eop_svg(curve: &[HorizonError]) -> String {
    let mut s = String::new();
    s.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{SVG_W:.0}\" height=\"{SVG_H:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    s.push_str(&format!(
        "<rect width=\"{SVG_W:.0}\" height=\"{SVG_H:.0}\" fill=\"#0c0b08\"/>"
    ));
    s.push_str(&format!(
        "<text x=\"{ML:.0}\" y=\"22\" font-size=\"15\" font-weight=\"bold\" fill=\"#e0bd84\">Real-time frame / EOP prediction budget for lunar timing</text>"
    ));

    // --- shared horizon (x) axis helpers ---
    let a_axis_y = PANEL_A_TOP + PANEL_H;
    let b_axis_y = PANEL_B_TOP + PANEL_H;

    // ---- Panel (a): UT1 error vs horizon ----
    s.push_str(&crate::chart::y_axis(
        ML,
        PANEL_A_TOP,
        PW,
        PANEL_H,
        A_Y_MAX_MS,
        "UT1 error (ms)",
    ));
    // axes
    s.push_str(&format!(
        "<line x1=\"{ML:.0}\" y1=\"{PANEL_A_TOP:.0}\" x2=\"{ML:.0}\" y2=\"{a_axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{ML:.0}\" y1=\"{a_axis_y:.0}\" x2=\"{:.0}\" y2=\"{a_axis_y:.0}\" stroke=\"#342c21\"/>",
        ML + PW
    ));
    s.push_str(&format!(
        "<text x=\"{ML:.0}\" y=\"40\" fill=\"#8c8273\">(a)</text>"
    ));
    // IERS final floor line (from the measured Final horizon, else the ~0.02 ms floor).
    let floor_ms = curve
        .iter()
        .find(|h| h.horizon == Horizon::Final)
        .map(|h| h.rms_ms())
        .unwrap_or(0.02);
    let floor_y = a_y_of_ms(floor_ms);
    s.push_str(&format!(
        "<line x1=\"{ML:.0}\" y1=\"{floor_y:.1}\" x2=\"{:.0}\" y2=\"{floor_y:.1}\" stroke=\"#6fae7a\" stroke-dasharray=\"4 3\"/>",
        ML + PW
    ));
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#6fae7a\">IERS final floor {floor_ms:.3} ms</text>",
        ML + 6.0,
        floor_y - 4.0
    ));
    // ~0.5 ms / 15 m marker line.
    let mark_y = a_y_of_ms(MARKER_UT1_MS);
    s.push_str(&format!(
        "<line x1=\"{ML:.0}\" y1=\"{mark_y:.1}\" x2=\"{:.0}\" y2=\"{mark_y:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/>",
        ML + PW
    ));
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">~{MARKER_UT1_MS} ms = ~{MARKER_POS_M:.0} m at Moon</text>",
        ML + 6.0,
        mark_y - 4.0
    ));
    // ~5-day vertical marker.
    let mark_x = x_of_days(MARKER_HORIZON_DAYS);
    s.push_str(&format!(
        "<line x1=\"{mark_x:.1}\" y1=\"{PANEL_A_TOP:.0}\" x2=\"{mark_x:.1}\" y2=\"{a_axis_y:.0}\" stroke=\"#d2925e\" stroke-dasharray=\"3 3\"/>"
    ));
    s.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.0}\" fill=\"#d2925e\">~{MARKER_HORIZON_DAYS:.0} d</text>",
        mark_x + 4.0,
        PANEL_A_TOP + 14.0
    ));
    // measured UT1-error curve.
    let a_pts: Vec<(f64, f64)> = curve
        .iter()
        .map(|h| (x_of_days(h.horizon.days()), a_y_of_ms(h.rms_ms())))
        .collect();
    s.push_str(&polyline(&a_pts, "#e0bd84"));
    for (x, y) in &a_pts {
        s.push_str(&format!(
            "<circle cx=\"{x:.1}\" cy=\"{y:.1}\" r=\"3\" fill=\"#e0bd84\"/>"
        ));
    }

    // ---- Panel (b): position at Moon vs horizon ----
    s.push_str(&crate::chart::y_axis(
        ML,
        PANEL_B_TOP,
        PW,
        PANEL_H,
        B_Y_MAX_M,
        "position at Moon (m)",
    ));
    s.push_str(&format!(
        "<line x1=\"{ML:.0}\" y1=\"{PANEL_B_TOP:.0}\" x2=\"{ML:.0}\" y2=\"{b_axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{ML:.0}\" y1=\"{b_axis_y:.0}\" x2=\"{:.0}\" y2=\"{b_axis_y:.0}\" stroke=\"#342c21\"/>",
        ML + PW
    ));
    s.push_str(&format!(
        "<text x=\"{ML:.0}\" y=\"{:.0}\" fill=\"#8c8273\">(b)</text>",
        PANEL_B_TOP - 8.0
    ));
    // right-hand equivalent-timing (ns) axis: position/c.
    let right_x = ML + PW;
    for i in 0..=4 {
        let frac = i as f64 / 4.0;
        let y = PANEL_B_TOP + PANEL_H - frac * PANEL_H;
        let pos_m = B_Y_MAX_M * frac;
        let ns = pos_m / C_M_S * 1e9;
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"start\" fill=\"#8c8273\" font-size=\"11\">{ns:.0} ns</text>",
            right_x + 6.0,
            y + 4.0
        ));
    }
    let rc = PANEL_B_TOP + PANEL_H / 2.0;
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{rc:.1}\" text-anchor=\"middle\" fill=\"#8c8273\" font-size=\"12\" transform=\"rotate(90 {:.0} {rc:.1})\">equiv. timing (ns)</text>",
        SVG_W - 16.0,
        SVG_W - 16.0
    ));
    // 15 m marker line.
    let m15_y = b_y_of_m(MARKER_POS_M);
    s.push_str(&format!(
        "<line x1=\"{ML:.0}\" y1=\"{m15_y:.1}\" x2=\"{:.0}\" y2=\"{m15_y:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/>",
        ML + PW
    ));
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">{MARKER_POS_M:.0} m ({:.1} ns)</text>",
        ML + 6.0,
        m15_y - 4.0,
        MARKER_POS_M / C_M_S * 1e9
    ));
    // ~5-day vertical marker.
    s.push_str(&format!(
        "<line x1=\"{mark_x:.1}\" y1=\"{PANEL_B_TOP:.0}\" x2=\"{mark_x:.1}\" y2=\"{b_axis_y:.0}\" stroke=\"#d2925e\" stroke-dasharray=\"3 3\"/>"
    ));
    // measured position curve + growth annotation (1-day horizon → longest real horizon).
    let b_pts: Vec<(f64, f64)> = curve
        .iter()
        .map(|h| (x_of_days(h.horizon.days()), b_y_of_m(h.rms_position_m())))
        .collect();
    s.push_str(&polyline(&b_pts, "#e0bd84"));
    for (x, y) in &b_pts {
        s.push_str(&format!(
            "<circle cx=\"{x:.1}\" cy=\"{y:.1}\" r=\"3\" fill=\"#e0bd84\"/>"
        ));
    }
    // Growth-factor annotation, GENUINE and self-describing: the RMS position at the
    // longest day-horizon actually PRESENT in the measured curve, divided by the 1-day
    // horizon, labelled with the real horizon count (`Nd`). Persistence UT1 error grows
    // monotonically with lead time, so the annotated factor is > 1 whenever the curve
    // spans more than one day; on a curve that only reaches 1 day it degenerates to 1x
    // and is suppressed. No fixed "~5x"/"5-day" text is baked in — the number and the
    // horizon shown are whatever the real data produce (see [`growth_annotation`]).
    if let Some((factor, far_days)) = growth_annotation(curve) {
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.0}\" fill=\"#d2925e\">~{factor:.1}x, 1 d\u{2192}{far_days:.0} d</text>",
            mark_x + 4.0,
            PANEL_B_TOP + 16.0,
        ));
    }
    // horizon axis label.
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8c8273\">prediction horizon (days)</text>",
        ML + PW / 2.0,
        SVG_H - 12.0
    ));

    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::frames::polar_motion_matrix;
    use crate::precession::mat_vec;

    // Real IERS finals2000A rows (Bulletin A FINAL, flag `I`), MJD 59578..59582, lifted
    // verbatim from tests/fixtures/agency/eop/finals2000A_2022001.txt. Each carries both
    // the rapid Bulletin A UT1-UTC [58..68] and the final Bulletin B UT1-UTC [154..165].
    const FIXTURE: &str = include_str!("../tests/fixtures/agency/eop/finals2000A_2022001.txt");

    // Extended real IERS span, 45 consecutive daily FINAL rows (MJD 59578..59622), lifted
    // verbatim — populates the 5-day and 10-day horizons the 5-row fixture cannot span.
    const LONGSPAN: &str =
        include_str!("../tests/fixtures/agency/eop/finals2000A_2022001_longspan.txt");

    // Real IERS finals2000A slice with genuine Bulletin A PREDICTION-ONLY rows: 20 FINAL
    // rows (Bulletin B present) followed by 12 real prediction-only rows (blank Bulletin B),
    // MJD 61173..61204, lifted verbatim. Carries the Bulletin B polar-motion columns too.
    const FIXTURE_2026: &str = include_str!("../tests/fixtures/agency/eop/finals2000A_2026.txt");

    // ---- L19: closed-form lever arm (Validated) ----

    // ORACLE: closed form. 1 ms of UT1 error at the Earth-Moon distance displaces the
    // frame by D_EM·ω⊕·ΔUT1 = 384400 km · 7.292115e-5 rad/s · 1e-3 s = 28.03 m, whose
    // light-time is 28.03 m / c = 93.5 ns. (Published lunar-PNT frame budget figure.)
    #[test]
    fn one_ms_ut1_is_28m_and_93_5ns() {
        let (pos, t) = ut1_error_to_lunar(1e-3);
        assert!(
            (pos - 28.03).abs() < 0.02,
            "position {pos} m, expected 28.03"
        );
        assert!(
            (t * 1e9 - 93.5).abs() < 0.1,
            "time {} ns, expected 93.5",
            t * 1e9
        );
    }

    // ORACLE: the inverse is exact — round-tripping any UT1 error returns it unchanged,
    // and 15 m implies ~0.535 ms (the panel-(a) / panel-(b) marker equivalence).
    #[test]
    fn lever_arm_inverse_round_trips() {
        let dut1 = 0.734e-3;
        let (pos, _) = ut1_error_to_lunar(dut1);
        assert!((lunar_position_to_ut1(pos) - dut1).abs() < 1e-15);
        assert!((lunar_position_to_ut1(15.0) * 1e3 - 0.535).abs() < 0.01);
    }

    // ORACLE: ω⊕ must equal the Earth-rotation rate underlying cio::earth_rotation_angle,
    // i.e. dERA/dt over one UT1 day. Cross-checked to < 1e-14 rad/s and against the
    // canonical 7.292115e-5 rad/s.
    #[test]
    fn omega_earth_matches_cio_era_rate() {
        let era0 = crate::cio::earth_rotation_angle(2_451_545.0);
        let era1 = crate::cio::earth_rotation_angle(2_451_546.0);
        // ERA advances by slightly more than a full turn per UT1 day.
        let per_day = era1 - era0 + std::f64::consts::TAU; // undo the anp() wrap
        let omega = per_day / SECONDS_PER_DAY;
        assert!((OMEGA_EARTH_RAD_S - omega).abs() < 1e-14);
        assert!((OMEGA_EARTH_RAD_S - 7.292115e-5).abs() < 1e-10);
    }

    // ---- L20: polar-motion projection (Validated vs cio rotation) ----

    // ORACLE: crate::frames::polar_motion_matrix. A pole error Δx_p rotates the frame
    // about the intermediate y-axis; a Moon-distance vector on the x-axis is displaced by
    // ≈ D_EM·Δx_p. The closed-form frame_position_error_at_moon must match the rotation.
    #[test]
    fn polar_motion_lever_matches_cio_rotation() {
        let dxp = crate::frames::arcsec(0.02); // 20 mas pole prediction error
        let jd_tt = 2_451_545.0;
        let r = [D_EM_M, 0.0, 0.0];
        let m0 = polar_motion_matrix(0.0, 0.0, jd_tt);
        let m1 = polar_motion_matrix(dxp, 0.0, jd_tt);
        let r0 = mat_vec(&m0, r);
        let r1 = mat_vec(&m1, r);
        let disp =
            ((r1[0] - r0[0]).powi(2) + (r1[1] - r0[1]).powi(2) + (r1[2] - r0[2]).powi(2)).sqrt();
        let closed = frame_position_error_at_moon(0.0, dxp, 0.0);
        // Both are D_EM·Δx_p to first order; agree to < 0.5 % (second-order sin term).
        assert!(
            (disp - closed).abs() / closed < 5e-3,
            "cio rotation {disp} m vs closed form {closed} m"
        );
        assert!((closed - D_EM_M * dxp).abs() < 1e-6);
    }

    // ORACLE: closed form. The combined UT1 + polar-motion budget is the RSS of the three
    // independent lever arms; each pure component reduces to the single-axis lever.
    #[test]
    fn combined_budget_is_rss_of_terms() {
        let ut1 = 0.5e-3;
        let dxp = crate::frames::arcsec(0.03);
        let dyp = crate::frames::arcsec(0.04);
        let combined = frame_position_error_at_moon(ut1, dxp, dyp);
        let ut1_only = frame_position_error_at_moon(ut1, 0.0, 0.0);
        let pm_only = frame_position_error_at_moon(0.0, dxp, dyp);
        assert!((ut1_only - ut1_error_to_lunar(ut1).0.abs()).abs() < 1e-9);
        assert!((combined - (ut1_only * ut1_only + pm_only * pm_only).sqrt()).abs() < 1e-9);
    }

    // ---- L18: measured prediction error vs horizon (Validated real data) ----

    // ORACLE: real Bulletin A (rapid) minus Bulletin B (final) UT1-UTC residuals carried
    // in the five verbatim finals2000A rows. IERS-published Bulletin A/B accuracy puts
    // the final floor at ~0.01-0.02 ms; the persistence-predictor error then grows into
    // the sub-ms range over the following days.
    #[test]
    fn measured_final_floor_and_growth_from_real_fixture() {
        let horizons = [
            Horizon::Final,
            Horizon::Days(1),
            Horizon::Days(2),
            Horizon::Days(3),
        ];
        let curve = prediction_error_vs_horizon(FIXTURE, &horizons);

        let get = |h: Horizon| {
            *curve
                .iter()
                .find(|e| e.horizon == h)
                .expect("horizon present in the fixture")
        };
        let floor = get(Horizon::Final);
        let d1 = get(Horizon::Days(1));
        let d2 = get(Horizon::Days(2));

        // Five paired rapid/final rows; four/three day-apart pairs.
        assert_eq!(floor.n, 5);
        assert_eq!(d1.n, 4);
        assert_eq!(d2.n, 3);

        // Final floor lands in the IERS-published ~0.01-0.02 ms band.
        assert!(
            floor.rms_ms() > 0.005 && floor.rms_ms() < 0.05,
            "final floor {} ms outside published band",
            floor.rms_ms()
        );
        // Multi-day persistence error is real, sub-ms, and grows past the floor.
        assert!(d1.rms_ms() > floor.rms_ms());
        assert!(d2.rms_ms() > floor.rms_ms());
        assert!(
            d1.rms_ms() > 0.05 && d1.rms_ms() < 0.6,
            "1-day {} ms",
            d1.rms_ms()
        );
        assert!(
            d2.rms_ms() > 0.05 && d2.rms_ms() < 0.8,
            "2-day {} ms",
            d2.rms_ms()
        );
        assert!(d2.rms_ms() >= d1.rms_ms());

        // Quantile ordering holds and the position equivalent tracks L19.
        assert!(d1.p95_ms() >= d1.p50_ms());
        assert!((d1.rms_position_m() - ut1_error_to_lunar(d1.rms_s).0).abs() < 1e-9);
    }

    // Horizons the daily fixture cannot span (h > 4 days) are omitted, not faked.
    #[test]
    fn horizons_beyond_the_data_are_omitted() {
        let curve = prediction_error_vs_horizon(
            FIXTURE,
            &[Horizon::Final, Horizon::Days(5), Horizon::Days(10)],
        );
        assert!(curve.iter().any(|e| e.horizon == Horizon::Final));
        assert!(!curve.iter().any(|e| e.horizon == Horizon::Days(5)));
        assert!(!curve.iter().any(|e| e.horizon == Horizon::Days(10)));
    }

    // Prediction-only rows (blank Bulletin B) are parsed with ut1_final_s = None.
    #[test]
    fn daily_pairs_parse_rapid_and_final_from_real_rows() {
        let daily = parse_daily_ut1(FIXTURE);
        assert_eq!(daily.len(), 5);
        assert_eq!(daily[0].mjd, 59578.0);
        assert!((daily[0].ut1_rapid_s - (-0.1101027)).abs() < 1e-12);
        assert!((daily[0].ut1_final_s.expect("final present") - (-0.1101029)).abs() < 1e-12);
    }

    // ---- L39: SVG marker coordinates match the L18/L19 numeric outputs ----

    // ORACLE: the marker pixel coordinates recomputed from the same mapping functions,
    // and the 15 m <-> 0.5 ms equivalence from the L19 lever arm.
    #[test]
    fn svg_markers_match_numeric_outputs() {
        let curve = prediction_error_vs_horizon(
            FIXTURE,
            &[
                Horizon::Final,
                Horizon::Days(1),
                Horizon::Days(2),
                Horizon::Days(3),
            ],
        );
        let svg = frame_eop_svg(&curve);

        // Well-formed, deterministic, two-panel.
        assert!(svg.starts_with("<svg"));
        assert!(svg.ends_with("</svg>"));
        assert_eq!(svg, frame_eop_svg(&curve));

        // The ~5-day vertical marker sits at x_of_days(5).
        let mark_x = x_of_days(MARKER_HORIZON_DAYS);
        assert!(svg.contains(&format!("x1=\"{mark_x:.1}\"")));
        // The ~0.5 ms marker line sits at a_y_of_ms(0.5) in panel (a).
        let mark_y = a_y_of_ms(MARKER_UT1_MS);
        assert!(svg.contains(&format!("y1=\"{mark_y:.1}\"")));
        // The 15 m marker line sits at b_y_of_m(15) in panel (b).
        let m15_y = b_y_of_m(MARKER_POS_M);
        assert!(svg.contains(&format!("y1=\"{m15_y:.1}\"")));

        // Panel-(a)/(b) marker equivalence: 0.5 ms <-> ~15 m via the L19 lever arm.
        assert!((ut1_error_to_lunar(MARKER_UT1_MS * 1e-3).0 - MARKER_POS_M).abs() < 1.5);

        // The measured final-floor RMS is the panel-(a) floor line height.
        let floor = curve
            .iter()
            .find(|h| h.horizon == Horizon::Final)
            .expect("final floor");
        let floor_y = a_y_of_ms(floor.rms_ms());
        assert!(svg.contains(&format!("y1=\"{floor_y:.1}\"")));

        // The first data vertex is the Final horizon at day 0.
        let x0 = x_of_days(0.0);
        let y0 = a_y_of_ms(floor.rms_ms());
        assert!(svg.contains(&format!("cx=\"{x0:.1}\" cy=\"{y0:.1}\"")));
    }

    #[test]
    fn frame_error_budget_is_rss_of_derived_terms() {
        // L21. Oracle: RSS closed form, each term from its own validated source — the EOP
        // lever arm (L19/L20), the L13 ephemeris covariance propagated through the
        // latency, and a 0.2 m frame-realization floor. A ~0.5 ms UT1 prediction error.
        use crate::lunar_frame_predict::{OdCovariance, REALTIME_LATENCY_S};
        let b = frame_error_budget(
            0.5e-3,
            0.0,
            0.0,
            OdCovariance::representative(),
            REALTIME_LATENCY_S,
            0.2,
        );
        let expect = (b.eop_term_m * b.eop_term_m
            + b.ephemeris_term_m * b.ephemeris_term_m
            + b.frame_realization_floor_m * b.frame_realization_floor_m)
            .sqrt();
        assert!((b.total_m - expect).abs() < 1e-9, "RSS");
        assert!(
            (b.total_time_ns - b.total_m / C_M_S * 1e9).abs() < 1e-6,
            "time map"
        );
        // The propagated ephemeris covariance dominates (~14.4 m), not an asserted constant.
        assert!(
            b.ephemeris_term_m > 10.0,
            "ephemeris term {}",
            b.ephemeris_term_m
        );
        assert!((b.frame_realization_floor_m - 0.2).abs() < 1e-12);
    }

    // ---- G5: the Figure-1 growth annotation is genuine (oracle on its VALUE) ----

    // ORACLE: the growth-factor annotation printed on panel (b) equals the ratio of the RMS
    // Moon-frame position at the LONGEST real day-horizon to the 1-day horizon, computed
    // independently from the same curve — and the number is REAL (>1, monotone), not the
    // old baked-in "~5x". On the extended real span the annotated factor is the honest
    // 1-day→10-day growth (~5x), and the label carries the real horizon "1 d→10 d".
    #[test]
    fn growth_annotation_matches_the_measured_curve_and_is_genuine() {
        let horizons = [
            Horizon::Days(1),
            Horizon::Days(2),
            Horizon::Days(3),
            Horizon::Days(5),
            Horizon::Days(10),
        ];
        let curve = prediction_error_vs_horizon(LONGSPAN, &horizons);
        let (factor, far_days) = growth_annotation(&curve).expect("annotation present");

        // Independent recompute: longest-day RMS position / 1-day RMS position.
        let pos_at = |d: u32| {
            curve
                .iter()
                .find(|h| h.horizon == Horizon::Days(d))
                .map(|h| h.rms_position_m())
                .unwrap()
        };
        let expect = pos_at(10) / pos_at(1);
        assert!(
            (factor - expect).abs() < 1e-9,
            "annotation factor {factor} vs recompute {expect}"
        );
        assert_eq!(far_days, 10.0, "longest real horizon must be 10 days");
        // GENUINE growth: strictly greater than 1, and in the ~5x band the real UT1
        // persistence error produces over this span (NOT the removed baked-in constant).
        assert!(
            (4.0..6.0).contains(&factor),
            "1 d -> 10 d growth factor {factor} outside the genuine ~5x band"
        );

        // The rendered SVG carries the SAME genuine factor and horizon in its annotation
        // text — the oracle asserts the annotation's value, not just its presence.
        let svg = frame_eop_svg(&curve);
        let expected_text = format!("~{factor:.1}x, 1 d\u{2192}{far_days:.0} d");
        assert!(
            svg.contains(&expected_text),
            "SVG missing genuine growth annotation `{expected_text}`"
        );
        // And it must NOT still carry the old non-genuine "~1x" / fixed "~5x vs 1 d".
        assert!(!svg.contains("~1x"));
        assert!(!svg.contains("~5x vs 1 d"));
    }

    // The annotation degenerates cleanly: a curve with only a 1-day horizon draws none.
    #[test]
    fn growth_annotation_absent_when_only_one_day_horizon() {
        let curve = prediction_error_vs_horizon(LONGSPAN, &[Horizon::Days(1)]);
        assert!(growth_annotation(&curve).is_none());
        let svg = frame_eop_svg(&curve);
        assert!(!svg.contains("1 d\u{2192}"));
    }

    // The `far` selection uses the largest day VALUE, not slice index: a non-monotone
    // curve passed in a scrambled order still annotates the true longest horizon.
    #[test]
    fn growth_annotation_picks_max_day_value_not_index() {
        // Build a curve out of order (10 d before 5 d) to prove selection is by value.
        let mut curve = prediction_error_vs_horizon(
            LONGSPAN,
            &[Horizon::Days(1), Horizon::Days(10), Horizon::Days(5)],
        );
        curve.reverse(); // scramble slice order
        let (_f, far_days) = growth_annotation(&curve).expect("annotation present");
        assert_eq!(
            far_days, 10.0,
            "must pick the largest day VALUE (10), not index"
        );
    }

    // ---- G7: polar-motion residual curve + polar_motion_position_error (real data) ----

    // ORACLE: crate::frames::polar_motion_matrix. polar_motion_position_error is the pure
    // pole projection of frame_position_error_at_moon (ΔUT1 = 0), and a Δx_p pole error
    // displaces a Moon-distance vector by ≈ D_EM·Δx_p — matched against the cio rotation.
    #[test]
    fn polar_motion_position_error_matches_cio_rotation() {
        let dxp = crate::frames::arcsec(0.02); // 20 mas
        let dyp = crate::frames::arcsec(0.015); // 15 mas
                                                // Pure pole projection equals the combined budget with ΔUT1 = 0.
        let pm = polar_motion_position_error(dxp, dyp);
        assert!((pm - frame_position_error_at_moon(0.0, dxp, dyp)).abs() < 1e-12);
        // Single-axis matches the cio rotation of a Moon-distance vector to < 0.5 %.
        let jd_tt = 2_451_545.0;
        let r = [D_EM_M, 0.0, 0.0];
        let m0 = polar_motion_matrix(0.0, 0.0, jd_tt);
        let m1 = polar_motion_matrix(dxp, 0.0, jd_tt);
        let r0 = mat_vec(&m0, r);
        let r1 = mat_vec(&m1, r);
        let disp =
            ((r1[0] - r0[0]).powi(2) + (r1[1] - r0[1]).powi(2) + (r1[2] - r0[2]).powi(2)).sqrt();
        let closed = polar_motion_position_error(dxp, 0.0);
        assert!(
            (disp - closed).abs() / closed < 5e-3,
            "cio {disp} vs closed {closed}"
        );
    }

    // ORACLE: IERS-published Bulletin A/B polar-motion accuracy. The rapid-minus-final pole
    // floor sits at the ~0.0-0.1 mas level and the multi-day persistence pole error grows
    // into the ~mas range over days — read off the real finals2000A rows, with the SAME
    // vintage-differencing construction as the UT1 curve. The measured pole residuals
    // mapped through the lever arm land at the ~1-100 m Moon-frame scale.
    #[test]
    fn pm_prediction_error_curve_from_real_data_in_iers_band() {
        let curve = pm_prediction_error_vs_horizon(
            FIXTURE_2026,
            &[
                Horizon::Final,
                Horizon::Days(1),
                Horizon::Days(2),
                Horizon::Days(5),
            ],
        );
        let get = |h: Horizon| {
            *curve
                .iter()
                .find(|e| e.horizon == h)
                .expect("horizon present")
        };
        // rms_s carries ARC SECONDS for the PM curve; ×1e3 → mas.
        let floor_mas = get(Horizon::Final).rms_s * 1e3;
        let d1_mas = get(Horizon::Days(1)).rms_s * 1e3;
        let d2_mas = get(Horizon::Days(2)).rms_s * 1e3;

        // 20 finals give the rapid-minus-final PM floor; it is sub-mas (IERS Bulletin A/B
        // pole accuracy is at the tens-of-µas to sub-mas level).
        assert_eq!(get(Horizon::Final).n, 20, "20 paired final rows");
        assert!(
            floor_mas > 0.0 && floor_mas < 1.0,
            "PM final floor {floor_mas} mas outside the sub-mas IERS band"
        );
        // Persistence pole error grows past the floor and reaches the ~mas scale over days.
        assert!(d1_mas > floor_mas, "1-day {d1_mas} !> floor {floor_mas}");
        assert!(d2_mas >= d1_mas, "growth non-monotone: {d2_mas} < {d1_mas}");
        assert!(
            (0.1..20.0).contains(&d2_mas),
            "2-day PM error {d2_mas} mas outside the expected daily-growth band"
        );

        // The measured pole residual maps to a real Moon-frame position through the lever.
        let d2_rad = get(Horizon::Days(2)).rms_s * crate::eop::ARCSEC_TO_RAD;
        let pos_m = polar_motion_position_error(d2_rad, 0.0);
        assert!(pos_m > 0.0 && pos_m.is_finite());
    }

    // ---- G8: derived frame-realization floor cross-checked against Helmert recovery ----

    // ORACLE: the injected-Helmert recovery already tested in lunar_frame_realise.rs. The
    // budget floor is DERIVED from the actual post-fit RMS residual of a 7-parameter
    // Helmert datum realisation, not the asserted 0.2 m. This cross-checks the derived
    // floor equals the realisation's own reported residual, and that it scales with the
    // tie noise the way the fit provably recovers (residual ≈ tie-noise level).
    #[test]
    fn derived_floor_equals_helmert_post_fit_residual() {
        use crate::lunar_frame_realise::LunarFrameRealiseScenario;
        for tie in [0.1_f64, 0.2, 0.5] {
            let derived = derived_frame_realization_floor_m(tie);
            // Independent recompute from the realisation report itself.
            let report = LunarFrameRealiseScenario {
                noise_sigma_m: tie,
                ..LunarFrameRealiseScenario::default()
            }
            .run();
            assert!(
                (derived - report.rms_residual_m).abs() < 1e-12,
                "derived floor {derived} != realisation residual {}",
                report.rms_residual_m
            );
            // The Helmert fit recovers the 7 datum parameters, so the post-fit residual is
            // near the tie-noise level (well within a factor of 2), NOT a free constant.
            assert!(
                derived > 0.3 * tie && derived < 2.0 * tie,
                "derived floor {derived} m not near the {tie} m tie-noise level"
            );
        }
        // The default budget floor is now this derived value (~0.18 m at 0.2 m tie noise),
        // replacing the old asserted 0.2 m.
        let default_floor = derived_frame_realization_floor_m(0.2);
        assert!(
            (0.10..0.30).contains(&default_floor),
            "default derived floor {default_floor} m outside the expected band"
        );
        // Noiseless realisation collapses to the f64 floor — the analytic anchor.
        assert!(derived_frame_realization_floor_m(0.0) < 1e-3);
    }

    // ---- G1: real predicted-column ingestion + vintage differencing ----

    // The predicted-column parser runs on REAL Bulletin A prediction-only rows: the 2026
    // fixture publishes 12 genuine future rows (blank Bulletin B), spanning MJD 61193..61204.
    #[test]
    fn predicted_rows_summary_reads_real_prediction_rows() {
        let s = predicted_rows_summary(FIXTURE_2026);
        assert_eq!(s.n, 12, "12 real Bulletin A prediction-only rows");
        assert_eq!(s.first_mjd, Some(61193.0));
        assert_eq!(s.last_mjd, Some(61204.0));
        // A file of only finals (no prediction rows) reports none.
        assert_eq!(predicted_rows_summary(LONGSPAN).n, 0);
    }

    // ORACLE: genuine two-vintage differencing. Constructed from real rows: an "as-issued"
    // vintage whose cutoff is an early final row and whose later dates are carried as
    // prediction-only rows (Bulletin A predicted, blank Bulletin B), differenced against a
    // "later" vintage where those SAME dates carry the Bulletin B final. The residual is the
    // real Bulletin-A-predicted minus Bulletin-B-final difference at the matched horizon.
    #[test]
    fn predicted_vs_final_vintage_differencing_on_real_rows() {
        // Later vintage: the real finals (all Bulletin B present).
        let later = LONGSPAN;
        // As-issued vintage: take the first N finals as-is, then re-emit the following real
        // rows with their Bulletin B section BLANKED so they are genuine prediction-only
        // rows carrying the real Bulletin A predicted UT1 (columns unchanged). This is the
        // real Bulletin A value the file published for those dates.
        let mut as_issued = String::new();
        let mut cutoff_seen = 0;
        for line in later.lines() {
            if line.trim_start().starts_with('#') || line.len() < 68 {
                as_issued.push_str(line);
                as_issued.push('\n');
                continue;
            }
            if cutoff_seen < 5 {
                // keep as a final row (Bulletin B intact) — establishes the issue cutoff
                as_issued.push_str(line);
                cutoff_seen += 1;
            } else {
                // blank the Bulletin B tail (cols >=134) → a real prediction-only row that
                // still carries the row's genuine Bulletin A predicted UT1.
                let head: String = line.chars().take(134).collect();
                as_issued.push_str(head.trim_end());
            }
            as_issued.push('\n');
        }
        // Sanity: the as-issued body now has real prediction-only rows.
        assert!(predicted_rows_summary(&as_issued).n > 0);

        let resid = predicted_vs_final_ut1(
            &as_issued,
            later,
            &[Horizon::Days(1), Horizon::Days(2), Horizon::Days(5)],
        );
        assert!(
            !resid.is_empty(),
            "vintage differencing produced no residuals"
        );
        for e in &resid {
            // Each residual is a real Bulletin-A-predicted minus Bulletin-B-final difference,
            // a positive, finite, sub-second UT1 quantity.
            assert!(e.rms_s.is_finite() && e.rms_s >= 0.0);
            assert!(e.n >= 1, "at least one matched predicted→final pair");
            // Sub-10-ms: real rapid/predicted UT1 tracks the final to well under 10 ms.
            assert!(
                e.rms_ms() < 10.0,
                "{:?} residual {} ms implausibly large",
                e.horizon,
                e.rms_ms()
            );
        }
    }

    // ---- G14: the JOINT UT1 + polar-motion table over a COMMON row set ----

    // Blank the Bulletin B POLE block (cols [134..154]) of a real final row while leaving
    // its Bulletin B UT1 block (cols [154..165]) intact. A pure column-layout construction
    // (not a data claim): it manufactures the epoch-set disagreement that the joint table
    // exists to resolve, and that the real fixtures happen not to exhibit.
    fn blank_the_pole_final(line: &str) -> String {
        let c: Vec<char> = line.chars().collect();
        assert!(c.len() > 165, "row must reach the Bulletin B UT1 block");
        let mut out: String = c[..134].iter().collect();
        out.push_str(&" ".repeat(20));
        out.extend(&c[154..]);
        out
    }

    // ORACLE: the emitted epoch vectors themselves. Each of the three components is built
    // by its own pass over the parsed series, so "identical rows" is a checkable property
    // of the output, not an assertion in the doc comment. Row counts must agree AND the
    // epochs must match elementwise, at every horizon, over BOTH real fixtures.
    #[test]
    fn joint_table_components_share_one_identical_epoch_set() {
        let horizons = [
            Horizon::Final,
            Horizon::Days(1),
            Horizon::Days(2),
            Horizon::Days(5),
        ];
        for (name, body) in [("longspan", LONGSPAN), ("2026", FIXTURE_2026)] {
            let joint = joint_eop_error_vs_horizon(body, &horizons);
            assert!(!joint.is_empty(), "{name}: joint table must populate");
            for row in &joint {
                assert_eq!(row.ut1.component, "ut1");
                assert_eq!(row.polar_motion.component, "polar-motion");
                assert_eq!(row.combined.component, "combined");
                // Counts agree with each other and with the row's own n.
                assert_eq!(
                    row.ut1.n, row.polar_motion.n,
                    "{name} {:?}: UT1 n {} != pole n {}",
                    row.horizon, row.ut1.n, row.polar_motion.n
                );
                assert_eq!(row.combined.n, row.ut1.n, "{name} {:?}", row.horizon);
                assert_eq!(row.n, row.ut1.n, "{name} {:?}", row.horizon);
                assert!(
                    row.n > 0,
                    "{name} {:?}: empty rows must be omitted",
                    row.horizon
                );
                // Lengths agree with the counts, and the epochs match elementwise.
                assert_eq!(row.ut1.epochs_mjd.len(), row.n);
                assert_eq!(row.polar_motion.epochs_mjd.len(), row.n);
                assert_eq!(row.combined.epochs_mjd.len(), row.n);
                for i in 0..row.n {
                    let (a, b, c) = (
                        row.ut1.epochs_mjd[i],
                        row.polar_motion.epochs_mjd[i],
                        row.combined.epochs_mjd[i],
                    );
                    assert!(
                        (a - b).abs() < 1e-9 && (a - c).abs() < 1e-9,
                        "{name} {:?}: epoch {i} differs - UT1 {a}, pole {b}, combined {c}",
                        row.horizon
                    );
                }
                // Strictly ascending, so "elementwise" is a real ordering, not coincidence.
                for w in row.ut1.epochs_mjd.windows(2) {
                    assert!(
                        w[1] > w[0],
                        "{name} {:?}: epochs not ascending",
                        row.horizon
                    );
                }
            }
        }
    }

    // ORACLE: the quadrature identity, evaluated two independent ways. The emitted
    // combination is the root-mean-square of the PER-EPOCH hypotenuse; the check is the
    // hypotenuse of the two components' own RMSs. They are equal in exact arithmetic
    // (sum(u^2+p^2) = sum u^2 + sum p^2) but are different expressions, so the check cannot
    // pass by sharing the computation it tests.
    #[test]
    fn joint_combination_is_the_quadrature_sum_of_its_own_two_components() {
        let horizons = [
            Horizon::Final,
            Horizon::Days(1),
            Horizon::Days(2),
            Horizon::Days(5),
            Horizon::Days(10),
        ];
        for (name, body) in [("longspan", LONGSPAN), ("2026", FIXTURE_2026)] {
            let joint = joint_eop_error_vs_horizon(body, &horizons);
            assert!(!joint.is_empty(), "{name}: joint table must populate");
            for row in &joint {
                let u = row.ut1.rms_position_m;
                let p = row.polar_motion.rms_position_m;
                let expect = (u * u + p * p).sqrt();
                let got = row.combined.rms_position_m;
                assert!(
                    (got - expect).abs() <= 1e-9 * expect.max(1.0),
                    "{name} {:?}: combined {got} m != quadrature sum {expect} m (UT1 {u}, pole {p})",
                    row.horizon
                );
                // The combination's native unit IS the Moon-frame metre, so its RMS and its
                // position are the same number.
                assert_eq!(row.combined.unit, "m");
                assert!((row.combined.rms_native - got).abs() < 1e-12);
                // Both components genuinely contribute: neither is silently zero.
                assert!(u > 0.0 && p > 0.0, "{name} {:?}: u {u}, p {p}", row.horizon);
                assert!(
                    got >= u && got >= p,
                    "{name} {:?}: combination below a component",
                    row.horizon
                );
                // And the component positions really are the L19/L20 images of their RMSs.
                assert!((u - ut1_error_to_lunar(row.ut1.rms_native).0).abs() < 1e-9);
                assert!(
                    (p - polar_motion_position_error(
                        row.polar_motion.rms_native * crate::eop::ARCSEC_TO_RAD,
                        0.0
                    ))
                    .abs()
                        < 1e-9
                );
            }
        }
    }

    // ORACLE: the two single-quantity curves. When a row's Bulletin B POLE block is blank
    // but its Bulletin B UT1 is present, the UT1 floor covers that row and the pole floor
    // does not - the exact "different row sets" defect. The joint table must fall back to
    // the INTERSECTION and report one common count, while the separate curves keep their
    // own differing counts (this test fails if the joint table simply reuses either curve).
    #[test]
    fn joint_table_intersects_when_the_two_bulletin_b_blocks_disagree() {
        let mut body = String::new();
        let mut blanked = 0usize;
        for (i, line) in LONGSPAN.lines().enumerate() {
            if line.trim_start().starts_with('#') || line.len() < 165 {
                body.push_str(line);
            } else if i % 3 == 0 {
                body.push_str(&blank_the_pole_final(line));
                blanked += 1;
            } else {
                body.push_str(line);
            }
            body.push('\n');
        }
        assert!(
            blanked >= 5,
            "must blank several pole finals, blanked {blanked}"
        );

        let ut1 = prediction_error_vs_horizon(&body, &[Horizon::Final]);
        let pm = pm_prediction_error_vs_horizon(&body, &[Horizon::Final]);
        let joint = joint_eop_error_vs_horizon(&body, &[Horizon::Final]);
        assert_eq!(ut1.len(), 1);
        assert_eq!(pm.len(), 1);
        assert_eq!(joint.len(), 1);
        // The premise: the two separate curves DO disagree on this body.
        assert!(
            ut1[0].n > pm[0].n,
            "premise broken - UT1 n {} must exceed pole n {}",
            ut1[0].n,
            pm[0].n
        );
        // The joint table reports the intersection: the smaller, common set.
        let row = &joint[0];
        assert_eq!(row.n, pm[0].n, "joint n must be the intersection size");
        assert!(
            row.n < ut1[0].n,
            "joint n must drop below the UT1-only count"
        );
        assert_eq!(row.ut1.n, row.polar_motion.n);
        assert_eq!(row.ut1.epochs_mjd, row.polar_motion.epochs_mjd);
        // And the UT1 statistic is NOT the whole-series one - it was recomputed over the
        // shared rows only.
        assert!(
            (row.ut1.rms_native - ut1[0].rms_s).abs() > 0.0,
            "UT1 RMS over the shared rows must differ from the full-series RMS"
        );
        // The quadrature identity still holds on the restricted set.
        let (u, p) = (row.ut1.rms_position_m, row.polar_motion.rms_position_m);
        assert!((row.combined.rms_position_m - (u * u + p * p).sqrt()).abs() < 1e-9);
    }

    // ORACLE: the joint table must never invent a horizon the data cannot populate - a
    // horizon with an empty shared set is omitted, exactly as the two curves do.
    #[test]
    fn joint_table_omits_a_horizon_with_no_shared_rows() {
        // The 5-row fixture spans 4 days: a 90-day horizon has no pairs at all.
        let joint = joint_eop_error_vs_horizon(FIXTURE, &[Horizon::Final, Horizon::Days(90)]);
        assert_eq!(joint.len(), 1, "only the final floor can populate");
        assert_eq!(joint[0].horizon, Horizon::Final);
        // An empty body yields nothing rather than a zero-filled row.
        assert!(joint_eop_error_vs_horizon("", &[Horizon::Final]).is_empty());
    }

    // ORACLE: the sample count RISES from the `final` floor to the one-day horizon on a
    // series whose Bulletin B block is shorter than its Bulletin A block, and the emitted
    // `truth_source` is what explains the rise.
    //
    // This sequence (20 at the floor, 31 at one day) was read for a long time as proof that
    // no single rule could have produced the published table, and six released rows were
    // declared unreproducible because of it. One rule does produce it: the floor can only
    // score epochs carrying a published Bulletin B pole, while a persistence horizon scores
    // against `truth_pm()`, which falls back to the rapid value and so reaches epochs the
    // floor cannot. The two rows are measured against DIFFERENT TRUTH, and until the field
    // asserted below existed a reader had no way to see that from the report.
    #[test]
    fn the_floor_and_the_prediction_rows_declare_the_different_truth_they_are_scored_against() {
        let joint = joint_eop_error_vs_horizon(FIXTURE_2026, &[Horizon::Final, Horizon::Days(1)]);
        assert_eq!(joint.len(), 2, "both horizons populate on this series");
        let floor = &joint[0];
        let day1 = &joint[1];
        assert_eq!(floor.horizon, Horizon::Final);
        assert_eq!(day1.horizon, Horizon::Days(1));

        // The premise: the count rises. If a future fixture edit removes the rise this test
        // is grading nothing, so the rise itself is asserted rather than assumed.
        assert!(
            day1.n > floor.n,
            "the fixture no longer exhibits the rise this test exists to explain: \
             floor n = {}, day-1 n = {}",
            floor.n,
            day1.n
        );

        // ...and the report says why, on every component of both rows.
        for c in [&floor.ut1, &floor.polar_motion, &floor.combined] {
            assert_eq!(
                c.truth_source, "bulletin-b final",
                "component {}",
                c.component
            );
        }
        for c in [&day1.ut1, &day1.polar_motion, &day1.combined] {
            assert_eq!(
                c.truth_source, "bulletin-b final where published, else bulletin-a rapid",
                "component {}",
                c.component
            );
        }
        assert_ne!(
            floor.ut1.truth_source, day1.ut1.truth_source,
            "the two rows must not claim the same truth — that claim is the defect"
        );

        // Naming the fallback is not enough: the count is what says how far the row
        // departs from the floor beside it. This series carries 32 rows of which 20 hold a
        // Bulletin B final and 12 are Bulletin A prediction-only, so every prediction
        // horizon touches exactly those 12 — at day 1 that is 12 of 31 samples, not one.
        assert_eq!(
            floor.polar_motion.truth_fallback_rows, 0,
            "the floor cannot fall back"
        );
        assert_eq!(floor.ut1.truth_fallback_rows, 0);
        assert_eq!(floor.combined.truth_fallback_rows, 0);
        assert_eq!(day1.polar_motion.truth_fallback_rows, 12);
        assert_eq!(day1.ut1.truth_fallback_rows, 12);
        assert_eq!(day1.combined.truth_fallback_rows, 12);
        assert!(
            day1.polar_motion.truth_fallback_rows < day1.n,
            "a fallback count equal to n would mean no row was scored against a final"
        );
    }

    // ---- G13: the operational-style predictor ----

    // ORACLE: an analytic signal with known coefficients. A bias + rate + annual +
    // semi-annual series sampled daily must be recovered exactly by the design the
    // predictor builds, and the forecast one year past the window must land on the
    // analytic value — not merely "close". This is the only place the periodic machinery
    // can be exercised, because no series committed here is long enough to admit an
    // annual term from real data.
    #[test]
    fn the_fit_recovers_an_analytic_bias_rate_and_periodic_signal() {
        let issue = 60000.0;
        let truth = |mjd: f64| -> f64 {
            let t = mjd - issue;
            let a = std::f64::consts::TAU * t / ANNUAL_PERIOD_DAYS;
            let s = std::f64::consts::TAU * t / SEMIANNUAL_PERIOD_DAYS;
            -0.25 + 3.5e-4 * t + 0.031 * a.cos() - 0.017 * a.sin()
                + 0.009 * s.cos()
                + 0.004 * s.sin()
        };
        let samples: Vec<(f64, f64)> = (0..=400)
            .map(|i| {
                let mjd = issue - 400.0 + i as f64;
                (mjd, truth(mjd))
            })
            .collect();
        let cfg = OperationalPredictorConfig {
            window_days: 365.0,
            ..Default::default()
        };
        let fit = fit_operational(&samples, issue, UT1_PERIODIC_TERMS, &cfg)
            .expect("a 365-day window over 400 days of daily samples must fit");
        // Both long-period terms are admitted at a 365-day window; the two zonal-tide
        // terms are admitted too (the window spans many cycles of each).
        assert_eq!(
            fit.term_names,
            vec![
                "bias",
                "rate",
                "annual",
                "semi-annual",
                "monthly-zonal-tide",
                "fortnightly-zonal-tide"
            ],
            "a 365-day window must admit every candidate term"
        );
        assert!(fit.rejected_terms.is_empty());
        // The analytic coefficients come back: bias, and rate expressed per window.
        assert!(
            (fit.coefficients[0] - (-0.25)).abs() < 1e-9,
            "{:?}",
            fit.coefficients
        );
        assert!(
            (fit.coefficients[1] - 3.5e-4 * 365.0).abs() < 1e-9,
            "{:?}",
            fit.coefficients
        );
        assert!((fit.coefficients[2] - 0.031).abs() < 1e-9);
        assert!((fit.coefficients[3] - (-0.017)).abs() < 1e-9);
        assert!(fit.rms_fit_residual < 1e-12, "{}", fit.rms_fit_residual);
        assert!(fit.anchor_residual.abs() < 1e-12);
        // And the forecast is the analytic value, at 1 day and 100 days out.
        for h in [1.0, 10.0, 100.0] {
            let got = fit.predict(issue + h);
            assert!(
                (got - truth(issue + h)).abs() < 1e-9,
                "h={h}: {got} != {}",
                truth(issue + h)
            );
        }
    }

    // ORACLE: the textbook closed-form ordinary-least-squares slope and intercept,
    // computed by different algebra from the matrix solve the fitter runs. Run over the
    // REAL series with the periodic terms switched off by a window too short to admit any,
    // so the model reduces to the two-parameter case the closed form covers.
    #[test]
    fn a_bias_rate_fit_equals_the_closed_form_least_squares_solution() {
        let daily = parse_daily_ut1(LONGSPAN);
        let samples: Vec<(f64, f64)> = daily.iter().map(|d| (d.mjd, d.ut1_rapid_s)).collect();
        let issue = 59600.0;
        let cfg = OperationalPredictorConfig {
            window_days: 6.0, // below half a cycle of every candidate period
            anchor_residual: false,
            ..Default::default()
        };
        let fit = fit_operational(&samples, issue, UT1_PERIODIC_TERMS, &cfg).expect("fit");
        assert_eq!(fit.term_names, vec!["bias", "rate"]);
        assert_eq!(fit.rejected_terms.len(), UT1_PERIODIC_TERMS.len());

        // Closed form on the same rows, in the same (t − T)/W abscissa.
        let rows: Vec<(f64, f64)> = samples
            .iter()
            .filter(|(m, _)| *m <= issue && *m >= issue - cfg.window_days)
            .map(|(m, v)| ((m - issue) / cfg.window_days, *v))
            .collect();
        let n = rows.len() as f64;
        let sx: f64 = rows.iter().map(|(x, _)| *x).sum();
        let sy: f64 = rows.iter().map(|(_, y)| *y).sum();
        let sxx: f64 = rows.iter().map(|(x, _)| x * x).sum();
        let sxy: f64 = rows.iter().map(|(x, y)| x * y).sum();
        let slope = (n * sxy - sx * sy) / (n * sxx - sx * sx);
        let intercept = (sy - slope * sx) / n;
        assert!(
            (fit.coefficients[0] - intercept).abs() < 1e-14,
            "intercept {} != {intercept}",
            fit.coefficients[0]
        );
        assert!(
            (fit.coefficients[1] - slope).abs() < 1e-12,
            "slope {} != {slope}",
            fit.coefficients[1]
        );
    }

    // THE LOOK-AHEAD DETECTOR. A predictor that can see the epoch it predicts is not a
    // predictor. Replace every observation strictly after the issue epoch with a value
    // that would wreck any fit that touched it, and demand the fit and its forecast come
    // back bit-for-bit identical. A fitter that leaked one future row fails here loudly.
    #[test]
    fn a_fit_cannot_see_a_single_observation_past_its_issue_epoch() {
        let daily = parse_daily_ut1(LONGSPAN);
        let issue = 59605.0;
        let clean: Vec<(f64, f64)> = daily.iter().map(|d| (d.mjd, d.ut1_rapid_s)).collect();
        let poisoned: Vec<(f64, f64)> = clean
            .iter()
            .map(|(m, v)| {
                if *m > issue {
                    (*m, *v + 1_000.0)
                } else {
                    (*m, *v)
                }
            })
            .collect();
        assert!(
            poisoned.iter().any(|(m, _)| *m > issue),
            "the fixture must carry rows past the issue epoch, or this proves nothing"
        );
        for window in [6.0, 15.0, 25.0] {
            let cfg = OperationalPredictorConfig {
                window_days: window,
                ..Default::default()
            };
            let a = fit_operational(&clean, issue, UT1_PERIODIC_TERMS, &cfg).expect("clean fit");
            let b =
                fit_operational(&poisoned, issue, UT1_PERIODIC_TERMS, &cfg).expect("poisoned fit");
            assert_eq!(a, b, "window {window}: a future row reached the fit");
            for h in [1.0, 2.0, 10.0] {
                assert_eq!(a.predict(issue + h), b.predict(issue + h));
            }
            // And the window really does end at or before the issue epoch.
            assert!(
                a.window_last_mjd <= issue,
                "{} > {issue}",
                a.window_last_mjd
            );
        }
    }

    // The window is complete or the fit is refused: a two-point "25-day fit" is never
    // reported as one.
    #[test]
    fn an_incomplete_window_is_refused_rather_than_shortened() {
        let daily = parse_daily_ut1(LONGSPAN);
        let samples: Vec<(f64, f64)> = daily.iter().map(|d| (d.mjd, d.ut1_rapid_s)).collect();
        let first = samples
            .iter()
            .map(|(m, _)| *m)
            .fold(f64::INFINITY, f64::min);
        let cfg = OperationalPredictorConfig {
            window_days: 15.0,
            ..Default::default()
        };
        // An issue epoch whose 15-day window runs off the front of the series.
        assert!(fit_operational(&samples, first + 14.0, UT1_PERIODIC_TERMS, &cfg).is_none());
        // One day later the window is exactly complete.
        let fit = fit_operational(&samples, first + 15.0, UT1_PERIODIC_TERMS, &cfg)
            .expect("a complete window must fit");
        assert!((fit.window_first_mjd - first).abs() < 1e-9);
        assert_eq!(fit.n_fit, 16);
    }

    // Term admission is governed by the declared threshold, and the Chandler wobble is a
    // polar-motion term only.
    #[test]
    fn periodic_terms_are_admitted_only_when_the_window_can_constrain_them() {
        let issue = 60000.0;
        let build = |span: f64| -> Vec<(f64, f64)> {
            (0..=(span as i64 + 10))
                .map(|i| {
                    let mjd = issue - span - 10.0 + i as f64;
                    (mjd, 0.1 + 1e-4 * (mjd - issue))
                })
                .collect()
        };
        for (window, expect_ut1, expect_pm) in [
            (6.0f64, vec!["bias", "rate"], vec!["bias", "rate"]),
            (
                15.0,
                vec![
                    "bias",
                    "rate",
                    "monthly-zonal-tide",
                    "fortnightly-zonal-tide",
                ],
                vec!["bias", "rate"],
            ),
            (
                150.0,
                vec![
                    "bias",
                    "rate",
                    "semi-annual",
                    "monthly-zonal-tide",
                    "fortnightly-zonal-tide",
                ],
                vec!["bias", "rate", "semi-annual"],
            ),
            (
                365.0,
                vec![
                    "bias",
                    "rate",
                    "annual",
                    "semi-annual",
                    "monthly-zonal-tide",
                    "fortnightly-zonal-tide",
                ],
                vec!["bias", "rate", "chandler", "annual", "semi-annual"],
            ),
        ] {
            let cfg = OperationalPredictorConfig {
                window_days: window,
                ..Default::default()
            };
            let s = build(window);
            let u = fit_operational(&s, issue, UT1_PERIODIC_TERMS, &cfg).expect("ut1 fit");
            let p = fit_operational(&s, issue, PM_PERIODIC_TERMS, &cfg).expect("pm fit");
            assert_eq!(u.term_names, expect_ut1, "UT1 terms at window {window}");
            assert_eq!(p.term_names, expect_pm, "PM terms at window {window}");
            assert!(
                !u.term_names.contains(&"chandler"),
                "the Chandler wobble must never enter the UT1 model"
            );
            // Every rejected term reports how far short the window fell.
            for r in u.rejected_terms.iter().chain(p.rejected_terms.iter()) {
                assert!(r.cycles_spanned < r.threshold_cycles);
                assert!(r.cycles_spanned >= 0.0 && r.period_days > 0.0);
            }
        }
    }

    // ORACLE: an independently-built epoch list. The comparison must score exactly the
    // issue epochs that have BOTH a complete fit window behind them AND a published
    // Bulletin B final at the target — and both predictors must be scored over that one
    // list, so the comparison is of predictors and not of samples.
    #[test]
    fn both_predictors_are_scored_over_one_independently_reproducible_epoch_set() {
        let cfg = OperationalPredictorConfig::default();
        let hs = [Horizon::Days(1), Horizon::Days(3), Horizon::Days(10)];
        let rows = operational_vs_persistence_vs_horizon(LONGSPAN, &hs, &cfg);
        assert_eq!(rows.len(), hs.len());
        let daily = parse_daily_ut1(LONGSPAN);
        let pm = parse_daily_pm(LONGSPAN);
        let first = daily.iter().map(|d| d.mjd).fold(f64::INFINITY, f64::min);
        for row in &rows {
            let Horizon::Days(h) = row.horizon else {
                panic!("the Final horizon must not appear")
            };
            // Rebuild the epoch list from the raw rows, without touching the fitter.
            let expect: Vec<f64> = daily
                .iter()
                .filter(|d| d.mjd >= first + cfg.window_days - 1e-9)
                .filter(|d| {
                    let t = d.mjd + h as f64;
                    daily
                        .iter()
                        .any(|x| (x.mjd - t).abs() < 1e-6 && x.ut1_final_s.is_some())
                        && pm
                            .iter()
                            .any(|x| (x.mjd - t).abs() < 1e-6 && x.pm_final_as.is_some())
                })
                .map(|d| d.mjd)
                .collect();
            assert_eq!(row.epochs_mjd, expect, "horizon {h}");
            assert_eq!(row.n, expect.len());
            assert!(row.n > 0);
            // One epoch set, six statistics.
            for e in [
                &row.ut1_operational,
                &row.ut1_persistence,
                &row.pm_operational,
                &row.pm_persistence,
                &row.combined_operational,
                &row.combined_persistence,
            ] {
                assert_eq!(e.n, row.n, "{} {} sample count", e.predictor, e.quantity);
            }
            // The target epochs are exactly the issue epochs plus the horizon, and the
            // lead is the horizon: no fit ever reached its own target.
            for (t, e) in row.target_mjds.iter().zip(&row.epochs_mjd) {
                assert!((t - e - h as f64).abs() < 1e-9);
            }
            assert!(
                (row.min_fit_lead_days - h as f64).abs() < 1e-9,
                "lead {} at horizon {h}",
                row.min_fit_lead_days
            );
            assert!(row.min_fit_lead_days > 0.0);
            // The combined column is the quadrature of the two components, which for an
            // RMS of per-row hypotenuses is the hypotenuse of the per-row RMSs.
            for (c, u, p) in [
                (
                    &row.combined_operational,
                    &row.ut1_operational,
                    &row.pm_operational,
                ),
                (
                    &row.combined_persistence,
                    &row.ut1_persistence,
                    &row.pm_persistence,
                ),
            ] {
                let expect = (u.rms_position_m.powi(2) + p.rms_position_m.powi(2)).sqrt();
                assert!(
                    (c.rms_position_m - expect).abs() <= 1e-9 * expect.max(1.0),
                    "combined {} != {expect}",
                    c.rms_position_m
                );
            }
        }
        // Row counts shrink with the horizon: a longer lead can only lose epochs. (The
        // pre-existing persistence curves do not share this property, because they do not
        // require a published final at the target — which is exactly why this table is
        // built separately instead of filtering theirs.)
        for w in rows.windows(2) {
            assert!(
                w[1].n <= w[0].n,
                "row counts must be non-increasing in the horizon: {} then {}",
                w[0].n,
                w[1].n
            );
        }
    }

    // The truth is the published FINAL, never the rapid value. Blank one target row's
    // Bulletin B block and that epoch must leave the table, rather than being re-scored
    // against the rapid column.
    #[test]
    fn a_target_without_a_published_final_is_dropped_not_rescored_against_the_rapid_value() {
        let cfg = OperationalPredictorConfig::default();
        let hs = [Horizon::Days(1)];
        let before = operational_vs_persistence_vs_horizon(LONGSPAN, &hs, &cfg);
        let target = *before[0]
            .target_mjds
            .last()
            .expect("at least one scored target");
        // Re-emit the series with that one row's Bulletin B tail blanked — a real row,
        // truncated, never a value invented or changed.
        let blanked: String = LONGSPAN
            .lines()
            .map(|line| match parse_line(line) {
                Some(r) if (r.mjd - target).abs() < 1e-6 => line
                    .chars()
                    .take(134)
                    .collect::<String>()
                    .trim_end()
                    .to_string(),
                _ => line.to_string(),
            })
            .collect::<Vec<_>>()
            .join("\n");
        let after = operational_vs_persistence_vs_horizon(&blanked, &hs, &cfg);
        assert_eq!(after[0].n, before[0].n - 1, "the epoch must be dropped");
        assert!(!after[0]
            .target_mjds
            .iter()
            .any(|t| (t - target).abs() < 1e-6));
    }

    // The equivalent-horizon reader interpolates between measured points and refuses to
    // extrapolate past them — the difference between reading a horizon off a curve and
    // inventing one.
    #[test]
    fn the_equivalent_horizon_interpolates_and_never_extrapolates() {
        let curve = [(1.0, 10.0), (2.0, 20.0), (3.0, 30.0)];
        let got = equivalent_horizon_days(&curve, 15.0).expect("15 m is bracketed");
        assert!((got - 1.5).abs() < 1e-12, "{got}");
        assert!((equivalent_horizon_days(&curve, 10.0).unwrap() - 1.0).abs() < 1e-12);
        assert!((equivalent_horizon_days(&curve, 30.0).unwrap() - 3.0).abs() < 1e-12);
        // Outside the measured range in either direction: no answer, not an extrapolation.
        assert!(equivalent_horizon_days(&curve, 5.0).is_none());
        assert!(equivalent_horizon_days(&curve, 45.0).is_none());
        assert!(equivalent_horizon_days(&[], 15.0).is_none());
        // Unsorted input is sorted first, so the caller's row order cannot change the read.
        let shuffled = [(3.0, 30.0), (1.0, 10.0), (2.0, 20.0)];
        assert_eq!(
            equivalent_horizon_days(&shuffled, 15.0),
            equivalent_horizon_days(&curve, 15.0)
        );
    }

    // ORACLE: the real published Bulletin A prediction rows of the 2026 extract. The
    // agreement statistic must be measurable there, must cover every published prediction
    // row, and must be reported per lead — and it must be ABSENT on the final-only
    // fixture rather than invented.
    #[test]
    fn the_bulletin_a_agreement_reads_the_real_published_prediction_rows() {
        let cfg = OperationalPredictorConfig::default();
        let a =
            bulletin_a_agreement(FIXTURE_2026, &cfg).expect("the 2026 extract publishes 12 rows");
        assert_eq!(a.n, 12);
        assert_eq!(a.leads.len(), 12);
        assert_eq!(a.issue_mjd, 61192.0);
        assert!((a.first_lead_days - 1.0).abs() < 1e-9);
        assert!((a.last_lead_days - 12.0).abs() < 1e-9);
        // Ascending leads, each a genuine difference against the archived prediction.
        for w in a.leads.windows(2) {
            assert!(w[1].lead_days > w[0].lead_days);
        }
        for l in &a.leads {
            assert!(l.ut1_diff_s > 0.0 && l.pm_diff_arcsec > 0.0);
            assert!(
                (l.ut1_position_m - ut1_error_to_lunar(l.ut1_diff_s).0).abs() < 1e-9,
                "the position column must be the lever-arm image of the difference"
            );
        }
        // The RMS columns reduce exactly the per-lead differences reported beside them.
        let rms = |v: Vec<f64>| (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt();
        assert!((a.ut1_rms_s - rms(a.leads.iter().map(|l| l.ut1_diff_s).collect())).abs() < 1e-15);
        // The disagreement grows with lead: this model class tracks Bulletin A closely
        // only at short lead, and the report must be able to say so from its own numbers.
        assert!(a.leads[0].ut1_diff_s < a.leads[8].ut1_diff_s);
        // A final-only excerpt publishes no prediction row, and nothing is manufactured.
        assert!(bulletin_a_agreement(FIXTURE, &cfg).is_none());
    }

    // Residual anchoring is a real, reported choice, not a hidden constant: turning it off
    // changes the forecast, and the anchored forecast passes exactly through the last
    // observation at zero lead.
    #[test]
    fn residual_anchoring_is_an_effective_and_reversible_choice() {
        let daily = parse_daily_ut1(LONGSPAN);
        let samples: Vec<(f64, f64)> = daily.iter().map(|d| (d.mjd, d.ut1_rapid_s)).collect();
        let issue = 59610.0;
        let on = fit_operational(
            &samples,
            issue,
            UT1_PERIODIC_TERMS,
            &OperationalPredictorConfig::default(),
        )
        .expect("fit");
        let off = fit_operational(
            &samples,
            issue,
            UT1_PERIODIC_TERMS,
            &OperationalPredictorConfig {
                anchor_residual: false,
                ..Default::default()
            },
        )
        .expect("fit");
        assert_eq!(off.anchor_residual, 0.0);
        assert!(on.anchor_residual.abs() > 0.0);
        assert!(
            (on.predict(issue + 1.0) - off.predict(issue + 1.0) - on.anchor_residual).abs() < 1e-15
        );
        // Anchored, the model reproduces the last observation it was given exactly.
        let last = samples
            .iter()
            .filter(|(m, _)| (m - issue).abs() < 1e-9)
            .map(|(_, v)| *v)
            .next_back()
            .expect("an observation at the issue epoch");
        assert!(
            (on.predict(issue) - last).abs() < 1e-12,
            "{} != {last}",
            on.predict(issue)
        );
    }
}
