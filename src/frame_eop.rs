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

/// One component (UT1, polar motion, or their combination) of a [`JointEopError`] row,
/// carrying the epochs it was actually measured at so the "same rows" claim is checkable
/// from the emitted report rather than asserted in prose.
#[derive(Clone, Debug, PartialEq)]
pub struct JointComponent {
    /// `"ut1"`, `"polar-motion"` or `"combined"`.
    pub component: &'static str,
    /// Unit of the `*_native` statistics: `"s"` (UT1), `"arcsec"` (pole), `"m"` (combined).
    pub unit: &'static str,
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
    to_position_m: impl Fn(f64) -> f64,
) -> JointComponent {
    let s = stats(horizon, pairs.iter().map(|(_, r)| *r).collect());
    JointComponent {
        component,
        unit,
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
        let ut1 = joint_component("ut1", "s", h, &u_shared, ut1_pos);
        let polar_motion = joint_component("polar-motion", "arcsec", h, &p_shared, pm_pos);
        let combined = joint_component("combined", "m", h, &combined, |m| m);
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
}
