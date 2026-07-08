// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar coordinate time scale (LTC/TCL) and the relativistic Earth↔Moon clock rate.
//!
//! A clock on the lunar surface ticks at a different rate from a clock on the Earth geoid.
//! At first post-Newtonian order the secular rate of a lunar-surface clock relative to an
//! Earth-geoid clock (Terrestrial Time, TT) is
//!
//! ```text
//! d(LTC − TT)/dt ≈ (1/c²) [ (W0_earth − U_moon_self) − <v_rel²>/2 ]
//! ```
//!
//! where `W0_earth` is the IAU/IERS conventional geopotential at the geoid (`L_G · c²`),
//! `U_moon_self = GM_moon / R_moon` is the Moon's self-potential at its surface, and
//! `<v_rel²>` is the time-averaged squared geocentric Moon velocity (the kinetic, second-order
//! Doppler term). The dominant self-potential difference gives ≈ 57.5 µs/day; the kinetic term
//! shaves off ≈ 0.5 µs/day.
//!
//! **Honesty:** this is a `Modelled` first-principles relativistic identity, cross-checked
//! against the published lunar-clock-rate band. The headline µs/day figure is
//! **reference-dependent** — it depends on the chosen reference surfaces (Earth geoid W₀ vs a
//! lunar selenoid), the time-averaging window, and the neglected sub-µs/day corrections
//! (centrifugal, J₂). For that reason the rate is always reported with the published band
//! `[56.0, 59.0]` µs/day rather than as a single certified number. Nothing here is validated
//! to sub-nanosecond absolute accuracy or certified for operational timekeeping.

/// IAU defining constant `L_G` — the rate of TT with respect to TCG. `W0_earth = L_G · c²`.
pub const L_G: f64 = 6.969_290_134e-10;
/// Speed of light squared, `c²` (m²/s²).
pub const C2_M2_S2: f64 = 299_792_458.0 * 299_792_458.0;
/// Conventional geopotential at the Earth geoid, `W0_earth = L_G · c²` (≈ 6.26369e7 m²/s²).
pub const W0_EARTH_M2_S2: f64 = L_G * C2_M2_S2;
/// IAU/WGCCRE mean lunar radius (m).
pub const RE_MOON_M: f64 = 1_737_400.0;
/// Published lunar-clock-rate band lower bound (µs/day).
pub const RATE_BAND_LOW_US_DAY: f64 = 56.0;
/// Published lunar-clock-rate band upper bound (µs/day).
pub const RATE_BAND_HIGH_US_DAY: f64 = 59.0;
/// Effective selenoid-referenced lunar elevation span (m) used for the topographic
/// gravitational-redshift spread. The full peak-to-trough topography is ≈ 20 km (Selenean
/// summit ≈ +10.8 km to the South-Pole–Aitken floor ≈ −9.1 km); this smaller selenoid-
/// referenced span reproduces the published ≈ 26 ns/day figure (Ashby 2024; Bourgoin et
/// al. 2026). The larger peak-to-trough span would give ≈ 31 ns/day.
pub const LUNAR_TOPO_ELEVATION_SPAN_M: f64 = 16_670.0;
/// Mean Earth–Moon distance (m) — the semi-major axis of the lunar orbit.
pub const EARTH_MOON_DISTANCE_M: f64 = 3.844e8;
/// Mean geocentric lunar orbital speed (m/s).
pub const MOON_MEAN_SPEED_M_S: f64 = 1_022.0;
/// Published TCG−TCL secular-rate reference (ns/day), IAU 2024 Lunar Celestial Reference
/// System recommendation — the modelled first-principles value agrees to ≈ 2 %.
pub const TCG_TCL_RATE_REF_NS_DAY: f64 = 1_469.0;

/// Seconds per day (s).
const SECONDS_PER_DAY: f64 = 86_400.0;
/// One central-difference half-step for the velocity, expressed in seconds.
const VEL_DT_S: f64 = 60.0;
/// The same step in Julian centuries (the unit `moon_position` takes).
const VEL_DT_JC: f64 = VEL_DT_S / SECONDS_PER_DAY / 36_525.0;

/// The dominant (self-potential) secular rate of a lunar-surface clock vs an Earth-geoid (TT)
/// clock, in microseconds per day:
/// `((W0_earth − GM_moon/R_moon) / c²) · 86400 · 1e6`.
///
/// This is the gravitational (redshift) part only; the kinetic term is
/// [`kinetic_rate_us_per_day`]. Computes to ≈ 57.5 µs/day.
pub fn self_potential_rate_us_per_day() -> f64 {
    let u_moon = crate::forces::MU_MOON / RE_MOON_M;
    ((W0_EARTH_M2_S2 - u_moon) / C2_M2_S2) * SECONDS_PER_DAY * 1e6
}

/// Geocentric Moon velocity (m/s) at TT epoch `t_tt_jc` (Julian centuries since J2000.0),
/// from a central finite difference of the analytic [`crate::ephem::moon_position`] series
/// (which is position-only). Magnitude ≈ 1.0 km/s.
pub fn moon_geocentric_velocity_m_s(t_tt_jc: f64) -> [f64; 3] {
    let p_plus = crate::ephem::moon_position(t_tt_jc + VEL_DT_JC);
    let p_minus = crate::ephem::moon_position(t_tt_jc - VEL_DT_JC);
    // (p(t+dt) − p(t−dt)) / (2·dt) with dt in seconds.
    let two_dt = 2.0 * VEL_DT_S;
    [
        (p_plus[0] - p_minus[0]) / two_dt,
        (p_plus[1] - p_minus[1]) / two_dt,
        (p_plus[2] - p_minus[2]) / two_dt,
    ]
}

/// The kinetic (second-order Doppler) part of the secular rate, in microseconds per day:
/// `−(v·v)/(2·c²) · 86400 · 1e6`, where `v` is the geocentric Moon velocity. A small negative
/// number (≈ −0.5 µs/day) — the moving lunar clock runs slow.
pub fn kinetic_rate_us_per_day(t_tt_jc: f64) -> f64 {
    let v = moon_geocentric_velocity_m_s(t_tt_jc);
    let v2 = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
    -(v2 / (2.0 * C2_M2_S2)) * SECONDS_PER_DAY * 1e6
}

/// The topographic gravitational-redshift **spread** across the lunar surface, in nanoseconds
/// per day: the min-to-max difference in secular clock rate between the lowest and highest
/// points of the elevation span, `g_moon · Δh / c² · 86400 · 1e9`, with lunar surface gravity
/// `g_moon = GM_moon / R_moon²` and `Δh = ` [`LUNAR_TOPO_ELEVATION_SPAN_M`].
///
/// This is why a lunar timekeeping network cannot use a single surface clock rate: clocks at
/// different elevations tick at different rates, and the spread over the operational elevation
/// range is ≈ 26 ns/day (Ashby 2024; Bourgoin et al. 2026; IAU 2024 LCRS). It is a `Modelled`
/// first-order redshift estimate (`g·Δh`), reference-dependent through the chosen elevation span.
pub fn topographic_spread_ns_per_day() -> f64 {
    let g_moon = crate::forces::MU_MOON / (RE_MOON_M * RE_MOON_M);
    g_moon * LUNAR_TOPO_ELEVATION_SPAN_M / C2_M2_S2 * SECONDS_PER_DAY * 1e9
}

/// The secular **TCG−TCL** rate — Geocentric Coordinate Time minus Lunar Coordinate Time —
/// in nanoseconds per day, from the dominant Earth-potential and kinetic terms at the Moon:
/// `(GM_earth/r_EM + v_moon²/2) / c² · 86400 · 1e9`.
///
/// TCG (no Earth-surface potential) and TCL (the lunar coordinate time) differ in scale
/// because of the Earth's gravitational potential at the Moon and the Moon's orbital motion.
/// The modelled value is ≈ 1499 ns/day; it agrees with the published IAU-2024
/// [`TCG_TCL_RATE_REF_NS_DAY`] ≈ 1469 ns/day to ≈ 2 %, the residual being the neglected
/// higher-order and time-averaging (orbital-eccentricity, tidal) corrections. `Modelled`.
pub fn tcg_tcl_secular_rate_ns_per_day() -> f64 {
    let potential = crate::forces::MU_EARTH / EARTH_MOON_DISTANCE_M;
    let kinetic = MOON_MEAN_SPEED_M_S * MOON_MEAN_SPEED_M_S / 2.0;
    (potential + kinetic) / C2_M2_S2 * SECONDS_PER_DAY * 1e9
}

/// The named-term breakdown of the lunar-surface secular clock rate vs TT (µs/day), with the
/// published reference band attached. `total_us_per_day = self_potential + kinetic`.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct LunarRateBreakdown {
    /// Self-potential (gravitational redshift) term (µs/day, positive).
    pub self_potential: f64,
    /// Kinetic (second-order Doppler) term (µs/day, small negative).
    pub kinetic: f64,
    /// Total secular rate (µs/day) — the sum of the two terms.
    pub total_us_per_day: f64,
    /// Published reference band lower bound (µs/day).
    pub band_low: f64,
    /// Published reference band upper bound (µs/day).
    pub band_high: f64,
}

/// Compute the full named-term [`LunarRateBreakdown`] at TT epoch `t_tt_jc`.
pub fn lunar_rate_breakdown(t_tt_jc: f64) -> LunarRateBreakdown {
    let self_potential = self_potential_rate_us_per_day();
    let kinetic = kinetic_rate_us_per_day(t_tt_jc);
    LunarRateBreakdown {
        self_potential,
        kinetic,
        total_us_per_day: self_potential + kinetic,
        band_low: RATE_BAND_LOW_US_DAY,
        band_high: RATE_BAND_HIGH_US_DAY,
    }
}

/// The secular LTC−TT rate as a dimensionless ratio (s of LTC per s of TT), at TT epoch
/// `t_tt_jc`. This is `total_us_per_day · 1e-6 / 86400`.
fn rate_s_per_s(t_tt_jc: f64) -> f64 {
    lunar_rate_breakdown(t_tt_jc).total_us_per_day * 1e-6 / SECONDS_PER_DAY
}

/// Convert a TT epoch (Julian Date) to Lunar Coordinate Time (LTC), expressed as a Julian Date,
/// given the LTC scale's origin `ltc_epoch_jd_tt` (the TT JD at which LTC ≡ TT).
///
/// `LTC = TT + rate · Δt`, with `rate` the secular LTC−TT rate evaluated at the epoch and
/// `Δt` the elapsed interval since the origin. The two scales coincide at the origin.
///
/// The rate is applied to the *elapsed interval* `Δt = jd_tt − epoch` and the result is rebuilt
/// as `epoch + Δt·(1 + rate)`. Operating on the small interval rather than the absolute JD keeps
/// the ~µs/day correction (which is ~10⁻¹⁰ of the absolute JD, well below an f64 ULP at JD ≈
/// 2.45·10⁶) in the precise floating-point regime instead of letting it be quantised away.
pub fn tt_to_ltc(jd_tt: f64, ltc_epoch_jd_tt: f64) -> f64 {
    let t_tt_jc = (ltc_epoch_jd_tt - crate::timescales::JD_J2000) / 36_525.0;
    let rate = rate_s_per_s(t_tt_jc);
    let dt = jd_tt - ltc_epoch_jd_tt;
    ltc_epoch_jd_tt + dt * (1.0 + rate)
}

/// Inverse of [`tt_to_ltc`]: convert a Lunar Coordinate Time (LTC) Julian Date back to TT,
/// given the same LTC origin `ltc_epoch_jd_tt`. Works on the elapsed interval for the same
/// precision reason as [`tt_to_ltc`].
pub fn ltc_to_tt(jd_ltc: f64, ltc_epoch_jd_tt: f64) -> f64 {
    let t_tt_jc = (ltc_epoch_jd_tt - crate::timescales::JD_J2000) / 36_525.0;
    let rate = rate_s_per_s(t_tt_jc);
    // jd_ltc = epoch + Δt_tt·(1 + rate)  ⇒  Δt_tt = (jd_ltc − epoch)/(1 + rate).
    let d_ltc = jd_ltc - ltc_epoch_jd_tt;
    ltc_epoch_jd_tt + d_ltc / (1.0 + rate)
}

/// An inverse-variance-weighted ensemble (paper-clock) offset and its variance.
#[derive(Clone, Copy, Debug, serde::Serialize)]
pub struct EnsembleTime {
    /// Inverse-variance-weighted mean clock offset (s).
    pub mean_offset_s: f64,
    /// Variance of the ensemble mean (s²) = `1 / Σ(1/σ²)`.
    pub variance_s2: f64,
}

/// Combine member-clock offsets into a minimal inverse-variance ensemble (a lunar paper-clock).
///
/// `mean = Σ(xᵢ/σᵢ²) / Σ(1/σᵢ²)`, `variance = 1 / Σ(1/σᵢ²)`. Members with a non-positive or
/// non-finite variance, or a non-finite offset, carry no weight and are skipped. If no member
/// contributes a positive weight (empty input, or all variances non-positive) the result is a
/// zero offset with infinite variance, signalling "no information".
pub fn lunar_ensemble(offsets_s: &[f64], variances_s2: &[f64]) -> EnsembleTime {
    let mut sum_w = 0.0;
    let mut sum_wx = 0.0;
    for (x, v) in offsets_s.iter().zip(variances_s2.iter()) {
        if *v > 0.0 && v.is_finite() && x.is_finite() {
            let w = 1.0 / *v;
            sum_w += w;
            sum_wx += w * *x;
        }
    }
    if sum_w > 0.0 {
        EnsembleTime {
            mean_offset_s: sum_wx / sum_w,
            variance_s2: 1.0 / sum_w,
        }
    } else {
        EnsembleTime {
            mean_offset_s: 0.0,
            variance_s2: f64::INFINITY,
        }
    }
}

fn d_epoch_year() -> i32 {
    2000
}
fn d_epoch_month() -> u32 {
    1
}
fn d_epoch_day() -> u32 {
    1
}
fn d_horizon_days() -> f64 {
    1.0
}

/// A runnable lunar-coordinate-time scenario: pick a UTC epoch and a horizon, then report the
/// secular LTC−TT rate (with its band) and the accumulated LTC−TT offset at the horizon. The
/// TOML `kind = "lunar-time-offset"` entry the engine dispatches to [`LunarTimeScenario::run`].
#[derive(Clone, Copy, Debug, serde::Deserialize)]
pub struct LunarTimeScenario {
    /// Epoch UTC year.
    #[serde(default = "d_epoch_year")]
    pub epoch_year: i32,
    /// Epoch UTC month (1–12).
    #[serde(default = "d_epoch_month")]
    pub epoch_month: u32,
    /// Epoch UTC day (1–31).
    #[serde(default = "d_epoch_day")]
    pub epoch_day: u32,
    /// Horizon over which the LTC−TT offset accumulates (days).
    #[serde(default = "d_horizon_days")]
    pub horizon_days: f64,
}

impl Default for LunarTimeScenario {
    fn default() -> Self {
        LunarTimeScenario {
            epoch_year: d_epoch_year(),
            epoch_month: d_epoch_month(),
            epoch_day: d_epoch_day(),
            horizon_days: d_horizon_days(),
        }
    }
}

/// The result of a [`LunarTimeScenario`]: the secular rate and its band, the named-term
/// breakdown, and the accumulated LTC−TT offset at the horizon.
#[derive(Clone, Debug, serde::Serialize)]
pub struct LunarTimeReport {
    /// Total secular LTC−TT rate (µs/day).
    pub secular_rate_us_per_day: f64,
    /// Published reference band lower bound (µs/day).
    pub band_low: f64,
    /// Published reference band upper bound (µs/day).
    pub band_high: f64,
    /// Self-potential (gravitational) term (µs/day).
    pub self_potential_us_per_day: f64,
    /// Kinetic (second-order Doppler) term (µs/day).
    pub kinetic_us_per_day: f64,
    /// Horizon (days).
    pub horizon_days: f64,
    /// Accumulated LTC−TT offset at the horizon (µs).
    pub offset_at_horizon_us: f64,
    /// Topographic gravitational-redshift spread across the lunar surface (ns/day) — the
    /// elevation-dependent clock-rate variation ([`topographic_spread_ns_per_day`]).
    pub topographic_spread_ns_per_day: f64,
    /// Secular TCG−TCL rate (ns/day) ([`tcg_tcl_secular_rate_ns_per_day`]).
    pub tcg_tcl_secular_rate_ns_per_day: f64,
}

impl LunarTimeScenario {
    /// Compute the secular rate, breakdown, and accumulated offset for this scenario.
    pub fn run(&self) -> LunarTimeReport {
        let jd_utc = crate::timescales::julian_date(
            self.epoch_year,
            self.epoch_month,
            self.epoch_day,
            0,
            0,
            0.0,
        );
        let jd_tt = crate::timescales::utc_to_tt(jd_utc);
        let t_tt_jc = (jd_tt - crate::timescales::JD_J2000) / 36_525.0;
        let b = lunar_rate_breakdown(t_tt_jc);
        // Accumulated LTC−TT offset over the horizon (µs). Computed directly from the secular
        // rate × horizon to keep the small offset precise: the equivalent JD-difference
        // `tt_to_ltc(epoch+H, epoch) − (epoch+H)` would lose it to f64 cancellation at JD ≈ 2.45e6.
        let offset_us = b.total_us_per_day * self.horizon_days;
        LunarTimeReport {
            secular_rate_us_per_day: b.total_us_per_day,
            band_low: b.band_low,
            band_high: b.band_high,
            self_potential_us_per_day: b.self_potential,
            kinetic_us_per_day: b.kinetic,
            horizon_days: self.horizon_days,
            offset_at_horizon_us: offset_us,
            topographic_spread_ns_per_day: topographic_spread_ns_per_day(),
            tcg_tcl_secular_rate_ns_per_day: tcg_tcl_secular_rate_ns_per_day(),
        }
    }
}

/// Render a [`LunarTimeReport`] as a self-contained SVG: the accumulated LTC−TT offset (µs)
/// as a straight line from the origin to the horizon, annotated with the rate and its band.
pub fn lunar_time_svg(r: &LunarTimeReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    let t_max = r.horizon_days.max(1e-9);
    let y_max = (r.offset_at_horizon_us.abs() * 1.15).max(1.0);
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |v: f64| mt + ph - (v / y_max) * ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Lunar coordinate time LTC−TT (rate {:.2} µs/day, band {:.0}–{:.0})</text>",
        r.secular_rate_us_per_day, r.band_low, r.band_high
    ));
    // Accumulated-offset line from the origin to the horizon.
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#e0bd84\" points=\"{:.1},{:.1} {:.1},{:.1}\"/>",
        xof(0.0),
        yof(0.0),
        xof(r.horizon_days),
        yof(r.offset_at_horizon_us)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"12\">{:.2} µs at {:.2} d</text>",
        xof(r.horizon_days) - 120.0,
        yof(r.offset_at_horizon_us) - 8.0,
        r.offset_at_horizon_us,
        r.horizon_days
    ));
    let axis_y = mt + ph;
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    fn norm(v: [f64; 3]) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    #[test]
    fn w0_earth_matches_conventional_geopotential() {
        // Oracle: IAU/IERS conventional geopotential at the geoid W0 = L_G * c^2 ≈ 6.26369e7.
        assert!((W0_EARTH_M2_S2 - 6.263_69e7).abs() / 6.263_69e7 < 1e-4);
    }

    #[test]
    fn self_potential_rate_is_about_57_5_us_day() {
        let r = self_potential_rate_us_per_day();
        assert!((r - 57.5).abs() < 0.5, "self-potential rate = {r} us/day");
    }

    #[test]
    fn moon_speed_is_about_1_km_s() {
        // Geocentric Moon speed averages ~1.02 km/s; sample a few epochs across a month.
        for k in 0..6 {
            let t = (k as f64) * 5.0 / 36_525.0;
            let speed_km_s = norm(moon_geocentric_velocity_m_s(t)) / 1e3;
            assert!(
                (0.8..1.3).contains(&speed_km_s),
                "Moon speed {speed_km_s} km/s at sample {k} outside [0.8, 1.3]"
            );
        }
    }

    #[test]
    fn kinetic_term_is_small_negative() {
        for k in 0..6 {
            let t = (k as f64) * 5.0 / 36_525.0;
            let kin = kinetic_rate_us_per_day(t);
            assert!(
                (-1.0..0.0).contains(&kin),
                "kinetic rate {kin} us/day at sample {k} outside (−1.0, 0.0)"
            );
        }
    }

    #[test]
    fn total_rate_is_in_the_published_band_and_terms_sum() {
        for k in 0..6 {
            let t = (k as f64) * 5.0 / 36_525.0;
            let b = lunar_rate_breakdown(t);
            assert!(
                (RATE_BAND_LOW_US_DAY..=RATE_BAND_HIGH_US_DAY).contains(&b.total_us_per_day),
                "total {} us/day at sample {k} outside band [{}, {}]",
                b.total_us_per_day,
                RATE_BAND_LOW_US_DAY,
                RATE_BAND_HIGH_US_DAY
            );
            assert!(
                (b.self_potential + b.kinetic - b.total_us_per_day).abs() < 1e-9,
                "breakdown terms do not sum to total at sample {k}"
            );
            assert_eq!(b.band_low, RATE_BAND_LOW_US_DAY);
            assert_eq!(b.band_high, RATE_BAND_HIGH_US_DAY);
        }
    }

    #[test]
    fn ltc_offset_over_a_day_is_about_57_us_and_in_band() {
        // After one day the LTC−TT offset should equal the daily rate. To read a ~57 µs
        // (≈ 6.6e-10-day) offset out of a JD without losing it to f64 cancellation, anchor the
        // LTC origin at JD 0 so the elapsed interval equals the absolute value — `tt_to_ltc`
        // operates on the interval, so this faithfully exercises its rate application. (The
        // rate is evaluated at the origin epoch; it varies < 1e-3 µs/day over the J2000 era,
        // far inside the band, so the choice of origin epoch is immaterial here.)
        let epoch = 0.0;
        let ltc = tt_to_ltc(epoch + 1.0, epoch);
        let offset_s = (ltc - (epoch + 1.0)) * 86_400.0;
        let offset_us = offset_s * 1e6;
        assert!(
            (RATE_BAND_LOW_US_DAY..=RATE_BAND_HIGH_US_DAY).contains(&offset_us),
            "1-day LTC−TT offset {offset_us} us outside band"
        );
    }

    #[test]
    fn tt_ltc_roundtrip_is_under_1_ns_per_day() {
        let epoch = crate::timescales::JD_J2000;
        // Sample TT epochs out to 10 days from the origin.
        for k in 0..11 {
            let x = epoch + k as f64;
            let back = ltc_to_tt(tt_to_ltc(x, epoch), epoch);
            let err_s = (back - x).abs() * 86_400.0;
            assert!(
                err_s < 1e-9,
                "round-trip error {err_s} s at +{k} d exceeds 1 ns"
            );
        }
    }

    #[test]
    fn ensemble_is_inverse_variance_weighted() {
        let offsets = [10.0e-9, 30.0e-9];
        let vars = [4.0e-18, 1.0e-18];
        let e = lunar_ensemble(&offsets, &vars);
        // Hand value: (a/va + b/vb)/(1/va + 1/vb), variance = 1/(1/va + 1/vb).
        let inv = 1.0 / vars[0] + 1.0 / vars[1];
        let mean = (offsets[0] / vars[0] + offsets[1] / vars[1]) / inv;
        let var = 1.0 / inv;
        assert!(
            (e.mean_offset_s - mean).abs() <= mean.abs() * 1e-12,
            "mean {} ≠ hand {}",
            e.mean_offset_s,
            mean
        );
        assert!(
            (e.variance_s2 - var).abs() <= var.abs() * 1e-12,
            "variance {} ≠ hand {}",
            e.variance_s2,
            var
        );
        // The lower-variance (more certain) clock dominates: mean is pulled toward 30 ns.
        assert!(e.mean_offset_s > 20.0e-9);
    }

    #[test]
    fn ensemble_handles_empty_and_nonpositive_variance() {
        // Empty → no information.
        let e = lunar_ensemble(&[], &[]);
        assert_eq!(e.mean_offset_s, 0.0);
        assert!(e.variance_s2.is_infinite());
        // A non-positive / non-finite variance member is skipped, not poisoning the result.
        let e2 = lunar_ensemble(&[5.0e-9, 100.0e-9, 7.0e-9], &[1.0e-18, 0.0, f64::NAN]);
        assert!((e2.mean_offset_s - 5.0e-9).abs() <= 5.0e-9 * 1e-12);
        assert!((e2.variance_s2 - 1.0e-18).abs() <= 1.0e-18 * 1e-12);
    }

    #[test]
    fn scenario_run_reports_rate_in_band_and_offset_matches_rate() {
        let scn = LunarTimeScenario::default();
        let r = scn.run();
        assert!(
            (r.band_low..=r.band_high).contains(&r.secular_rate_us_per_day),
            "rate {} outside band",
            r.secular_rate_us_per_day
        );
        assert_eq!(r.band_low, RATE_BAND_LOW_US_DAY);
        assert_eq!(r.band_high, RATE_BAND_HIGH_US_DAY);
        // One-day horizon ⇒ offset ≈ the daily rate.
        assert!(
            (r.offset_at_horizon_us - r.secular_rate_us_per_day).abs() < 1e-6,
            "offset {} ≠ rate {} for a 1-day horizon",
            r.offset_at_horizon_us,
            r.secular_rate_us_per_day
        );
        assert!(
            (r.self_potential_us_per_day + r.kinetic_us_per_day - r.secular_rate_us_per_day).abs()
                < 1e-9
        );
    }

    #[test]
    fn topographic_spread_is_about_26_ns_per_day() {
        // Oracle: g_moon·Δh/c² over the selenoid-referenced elevation span ≈ 26 ns/day
        // (Ashby 2024; Bourgoin et al. 2026). Assert within a physical band around it.
        let s = topographic_spread_ns_per_day();
        assert!(
            (24.0..=28.0).contains(&s),
            "topographic spread {s} ns/day outside [24, 28]"
        );
    }

    #[test]
    fn tcg_tcl_rate_agrees_with_iau_2024_reference() {
        // Oracle: dominant Earth-potential + kinetic term ≈ 1499 ns/day, within ~2 % of the
        // published IAU-2024 reference (≈ 1469 ns/day).
        let r = tcg_tcl_secular_rate_ns_per_day();
        assert!(
            (1_450.0..=1_550.0).contains(&r),
            "TCG−TCL rate {r} ns/day outside [1450, 1550]"
        );
        let rel = (r - TCG_TCL_RATE_REF_NS_DAY).abs() / TCG_TCL_RATE_REF_NS_DAY;
        assert!(
            rel < 0.03,
            "TCG−TCL rate {r} differs from IAU-2024 ref by {rel} (>3%)"
        );
    }

    #[test]
    fn report_surfaces_topographic_spread_and_tcg_tcl_rate() {
        let r = LunarTimeScenario::default().run();
        assert_eq!(
            r.topographic_spread_ns_per_day,
            topographic_spread_ns_per_day()
        );
        assert_eq!(
            r.tcg_tcl_secular_rate_ns_per_day,
            tcg_tcl_secular_rate_ns_per_day()
        );
        assert!(r.topographic_spread_ns_per_day > 0.0);
        assert!(r.tcg_tcl_secular_rate_ns_per_day > 0.0);
    }

    #[test]
    fn svg_renders_self_contained() {
        let r = LunarTimeScenario::default().run();
        let svg = lunar_time_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert!(svg.ends_with("</svg>"));
        assert!(svg.contains("LTC"));
    }

    #[test]
    fn run_toml_lunar_time_offset_dispatches_and_reports_in_band() {
        let out = crate::api::run_toml("kind = \"lunar-time-offset\"\nhorizon_days = 1.0").unwrap();
        assert!(
            out.summary.contains("lunar-time-offset"),
            "summary missing kind: {}",
            out.summary
        );
        let j: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        let rate = j["secular_rate_us_per_day"].as_f64().unwrap();
        assert!(
            (RATE_BAND_LOW_US_DAY..=RATE_BAND_HIGH_US_DAY).contains(&rate),
            "JSON secular_rate_us_per_day {rate} outside band"
        );
        assert!(out.svg.starts_with("<svg"));
    }
}
