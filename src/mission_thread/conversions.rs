// SPDX-License-Identifier: AGPL-3.0-only
//! Frame and timescale conversions the thread performs at a handover, each returning the budget
//! lines it adds.
//!
//! **Frames.** `Gcrf <-> Mci` shifts the origin by the Moon's geocentric state. With a kernel on
//! the context ([`ThreadCtx::with_moon_kernel`]) that covers the epoch, the state is the kernel's
//! (DE440-grade) and the line states the kernel's SHA-256 and a 5 m and 1 mm/s stand-in for its
//! own error, which the engine has not validated in absolute terms (the reader matches SPICE to
//! 2 mm; the tests here compare the kernel with pinned JPL Horizons values). Where no kernel
//! covers the epoch the state is the engine's analytic lunar series
//! ([`crate::ephem::moon_icrf`]), and the line says it is the fallback and carries the series'
//! measured error against Horizons (195.7 km RMS, `tests/lunar_llr_real_data.rs`), which
//! dominates any lunar handover made that way. `Mci <-> Mcmf` is the mean sidereal rotation (27.321661 d) about the
//! lunar spin axis with the axes aligned at the thread epoch and **no libration**; a rotation
//! preserves the covariance trace, so the line reports 0 m and says what is left out. `Itrf` and
//! `Lvlh` are not converted here and fail loudly.
//!
//! **Timescales.** The pivot is TT. `Utc <-> Tt` is the exact leap-second offset and changes
//! nothing but the tag. `Tdb <-> Tt` uses the engine's two-term periodic series and adds the size
//! of the next-largest term of the Fairhead-Bretagnon series (about 14 microseconds, IERS
//! Conventions 2010, section 10.1) as a 1-sigma stand-in for what the series leaves out.
//! `Tt <-> Ltc` applies the secular rate of the lunar clock against TT from
//! [`crate::lunar_time`], with the origin of Ltc at the thread epoch (Ltc equals TT there), and
//! adds the variance of an uncertain rate (uniform over the published 56 to 59 microsecond per day
//! band). Bias `b` in the old scale becomes `b -/+ r t` and the drift `d` becomes `d -/+ r`.

// Dense 3x3 and 6x6 kernels index several arrays by one loop variable, as the crate's other matrix
// code does.
#![allow(clippy::needless_range_loop)]

use super::budget::BudgetRow;
use super::phase::{ClockState, EvidenceLabel, Frame, NavState, Timescale, N};
use super::ThreadCtx;
use crate::interop::UtcEpoch;
use crate::lunar::{lunar_rotation_angle, LUNAR_SIDEREAL_DAY_S};

use std::f64::consts::TAU;

/// The measured RMS vector error of the analytic lunar series against JPL Horizons, metres: 12
/// weekly geocentric states in 2015 (`tests/lunar_llr_real_data.rs`; the worst epoch is 360 km).
pub const MOON_SERIES_MEASURED_RMS_M: f64 = 195_655.0;

/// The conservative 1-sigma position stand-in for a DE440-grade kernel's own error, metres: about
/// twice the worst difference measured against pinned Horizons values (2.6 m, DE440s against the
/// DE441 Horizons uses; see the test).
pub const KERNEL_MOON_SIGMA_M: f64 = 5.0;

/// The conservative 1-sigma velocity stand-in for a DE440-grade kernel's own error, m/s.
pub const KERNEL_MOON_SIGMA_MPS: f64 = 1.0e-3;

/// The next-largest periodic term of TDB minus TT beyond the two the engine carries, seconds.
pub const TDB_TT_NEXT_TERM_S: f64 = 14.0e-6;

const SECONDS_PER_DAY: f64 = 86_400.0;

fn row(source: String, sigma: f64, unit: &str) -> BudgetRow {
    BudgetRow {
        source,
        sigma,
        unit: unit.to_string(),
        label: EvidenceLabel::modelled(),
    }
}

/// The 1-sigma position error of the analytic lunar series, metres: its measured RMS against
/// Horizons.
pub fn moon_series_sigma_m() -> f64 {
    MOON_SERIES_MEASURED_RMS_M
}

/// The 1-sigma velocity error of the analytic lunar series, metres per second: the position error
/// moving at the Moon's orbital angular rate.
pub fn moon_series_sigma_mps() -> f64 {
    MOON_SERIES_MEASURED_RMS_M * TAU / LUNAR_SIDEREAL_DAY_S
}

/// Where the Moon's state came from for one conversion.
struct MoonState {
    pos: [f64; 3],
    vel: [f64; 3],
    sigma_m: f64,
    sigma_mps: f64,
    /// The text that goes in the budget line.
    what: String,
}

/// The Moon's geocentric state at mission time `t_s`: the context's kernel where it covers the
/// epoch, otherwise the analytic series (and the line says why).
fn moon_state(ctx: &ThreadCtx, t_s: f64) -> Result<MoonState, String> {
    let jd = jd_tdb(ctx, t_s)?;
    let mut why_not = String::new();
    if let Some(k) = &ctx.moon_kernel {
        use crate::ephem_provider::naif_code::{EARTH, MOON};
        match k.state(MOON, EARTH, crate::jd2::Jd2::new(jd)) {
            Ok(st) => {
                return Ok(MoonState {
                    pos: st[0],
                    vel: st[1],
                    sigma_m: KERNEL_MOON_SIGMA_M,
                    sigma_mps: KERNEL_MOON_SIGMA_MPS,
                    what: format!(
                        "DE440-grade SPK kernel sha256 {}, covers this epoch; 5 m and 1 mm/s conservative stand-in for its own error (worst measured against Horizons 2.6 m), its absolute accuracy not claimed",
                        &k.kernel_sha256()[..16]
                    ),
                });
            }
            Err(e) => {
                why_not = format!("the kernel does not cover this epoch ({e}); ");
            }
        }
    }
    Ok(MoonState {
        pos: crate::ephem::moon_icrf(jd),
        vel: crate::ephem::moon_icrf_velocity(jd),
        sigma_m: moon_series_sigma_m(),
        sigma_mps: moon_series_sigma_mps(),
        what: format!(
            "analytic series FALLBACK, {why_not}measured {:.1} km RMS against JPL Horizons (tests/lunar_llr_real_data.rs), added to the covariance",
            MOON_SERIES_MEASURED_RMS_M / 1e3
        ),
    })
}

fn jd_tdb(ctx: &ThreadCtx, t_s: f64) -> Result<f64, String> {
    let epoch = UtcEpoch::parse_iso(&ctx.epoch_utc)?;
    let jd_utc = epoch.jd_utc(t_s);
    let jd_tt = crate::timescales::utc_to_tt(jd_utc);
    Ok(crate::timescales::tt_to_tdb(jd_tt))
}

/// `P' = T P T^T` for a 6x6 `T`.
fn congruence(t: &[[f64; N]; N], p: &[[f64; N]; N]) -> [[f64; N]; N] {
    let mut tp = [[0.0; N]; N];
    for i in 0..N {
        for j in 0..N {
            for k in 0..N {
                tp[i][j] += t[i][k] * p[k][j];
            }
        }
    }
    let mut out = [[0.0; N]; N];
    for i in 0..N {
        for j in 0..N {
            for k in 0..N {
                out[i][j] += tp[i][k] * t[j][k];
            }
        }
    }
    out
}

/// Rotation of the state about +z by the lunar rotation angle at mission time `t_s`
/// (MCI to MCMF) or its inverse, with the transport term of a rotating frame on the velocity.
fn rotate_lunar(state: &NavState, to_fixed: bool) -> NavState {
    let theta = lunar_rotation_angle(state.t_s);
    let omega = TAU / LUNAR_SIDEREAL_DAY_S;
    let (s, c) = theta.sin_cos();
    // R takes MCI to MCMF: [[c, s, 0], [-s, c, 0], [0, 0, 1]].
    let r = [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]];
    let mut out = state.clone();
    let mul = |m: &[[f64; 3]; 3], v: [f64; 3]| -> [f64; 3] {
        [
            m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
            m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
            m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
        ]
    };
    let rt = [
        [r[0][0], r[1][0], r[2][0]],
        [r[0][1], r[1][1], r[2][1]],
        [r[0][2], r[1][2], r[2][2]],
    ];
    let pos = [state.x[0], state.x[1], state.x[2]];
    let vel = [state.x[3], state.x[4], state.x[5]];
    // omega x r with omega along +z.
    let w_cross = |v: [f64; 3]| [-omega * v[1], omega * v[0], 0.0];
    let (new_pos, new_vel, t6) = if to_fixed {
        // r_f = R r ; v_f = R (v - w x r).
        let wr = w_cross(pos);
        let rel = [vel[0] - wr[0], vel[1] - wr[1], vel[2] - wr[2]];
        let mut t6 = [[0.0; N]; N];
        // d(v_f)/d(r) = -R [w]x ; [w]x r = w x r.
        let wx = [[0.0, -omega, 0.0], [omega, 0.0, 0.0], [0.0, 0.0, 0.0]];
        for i in 0..3 {
            for j in 0..3 {
                t6[i][j] = r[i][j];
                t6[i + 3][j + 3] = r[i][j];
                let mut v = 0.0;
                for k in 0..3 {
                    v += r[i][k] * wx[k][j];
                }
                t6[i + 3][j] = -v;
            }
        }
        (mul(&r, pos), mul(&r, rel), t6)
    } else {
        // r = R^T r_f ; v = R^T v_f + w x r.
        let p_i = mul(&rt, pos);
        let wr = w_cross(p_i);
        let v_i = mul(&rt, vel);
        let mut t6 = [[0.0; N]; N];
        let wx = [[0.0, -omega, 0.0], [omega, 0.0, 0.0], [0.0, 0.0, 0.0]];
        for i in 0..3 {
            for j in 0..3 {
                t6[i][j] = rt[i][j];
                t6[i + 3][j + 3] = rt[i][j];
                let mut v = 0.0;
                for k in 0..3 {
                    v += wx[i][k] * rt[k][j];
                }
                t6[i + 3][j] = v;
            }
        }
        (p_i, [v_i[0] + wr[0], v_i[1] + wr[1], v_i[2] + wr[2]], t6)
    };
    out.x = [
        new_pos[0], new_pos[1], new_pos[2], new_vel[0], new_vel[1], new_vel[2],
    ];
    out.p = congruence(&t6, &state.p);
    out.frame = if to_fixed { Frame::Mcmf } else { Frame::Mci };
    out
}

/// Converts a state to another frame. See the module notes for what each pair adds.
pub fn convert_frame(
    ctx: &ThreadCtx,
    state: &NavState,
    to: Frame,
) -> Result<(NavState, Vec<BudgetRow>), String> {
    if state.frame == to {
        return Ok((state.clone(), Vec::new()));
    }
    match (state.frame, to) {
        (Frame::Gcrf, Frame::Mci) | (Frame::Mci, Frame::Gcrf) => {
            let m = moon_state(ctx, state.t_s)?;
            let sign = if state.frame == Frame::Gcrf {
                -1.0
            } else {
                1.0
            };
            let mut out = state.clone();
            for i in 0..3 {
                out.x[i] += sign * m.pos[i];
                out.x[i + 3] += sign * m.vel[i];
            }
            for i in 0..3 {
                out.p[i][i] += m.sigma_m * m.sigma_m;
                out.p[i + 3][i + 3] += m.sigma_mps * m.sigma_mps;
            }
            out.frame = to;
            let from_n = if state.frame == Frame::Gcrf {
                "GCRF"
            } else {
                "MCI"
            };
            let to_n = if to == Frame::Gcrf { "GCRF" } else { "MCI" };
            Ok((
                out,
                vec![
                    row(
                        format!("conversion: {from_n} -> {to_n} ({}), position", m.what),
                        m.sigma_m,
                        "m",
                    ),
                    row(
                        format!("conversion: {from_n} -> {to_n} ({}), velocity", m.what),
                        m.sigma_mps,
                        "m/s",
                    ),
                ],
            ))
        }
        (Frame::Mci, Frame::Mcmf) | (Frame::Mcmf, Frame::Mci) => {
            let to_fixed = to == Frame::Mcmf;
            let out = rotate_lunar(state, to_fixed);
            let (a, b) = if to_fixed {
                ("MCI", "MCMF")
            } else {
                ("MCMF", "MCI")
            };
            Ok((
                out,
                vec![row(
                    format!(
                        "conversion: {a} -> {b} (mean sidereal rotation 27.321661 d, axes aligned at the thread epoch, no libration; \
                         a rotation adds 0 m and the neglected libration is not bounded here)"
                    ),
                    0.0,
                    "m",
                )],
            ))
        }
        (Frame::Gcrf, Frame::Mcmf) | (Frame::Mcmf, Frame::Gcrf) => {
            let mid = Frame::Mci;
            let (s1, mut r1) = convert_frame(ctx, state, mid)?;
            let (s2, r2) = convert_frame(ctx, &s1, to)?;
            r1.extend(r2);
            Ok((s2, r1))
        }
        (a, b) => Err(format!(
            "frame conversion {a:?} -> {b:?} is not available (only Gcrf, Mci and Mcmf convert)"
        )),
    }
}

/// The secular rate of the lunar clock against TT at the thread epoch, seconds per second.
fn ltc_rate_s_per_s(ctx: &ThreadCtx) -> Result<f64, String> {
    let epoch = UtcEpoch::parse_iso(&ctx.epoch_utc)?;
    let jd_tt = crate::timescales::utc_to_tt(epoch.jd_utc(0.0));
    let t_jc = (jd_tt - crate::timescales::JD_J2000) / 36_525.0;
    Ok(crate::lunar_time::lunar_rate_breakdown(t_jc).total_us_per_day * 1e-6 / SECONDS_PER_DAY)
}

/// The 1-sigma of the lunar clock rate: the published band is uniform, so the width over the
/// square root of twelve, seconds per second.
fn ltc_rate_sigma_s_per_s() -> f64 {
    (crate::lunar_time::RATE_BAND_HIGH_US_DAY - crate::lunar_time::RATE_BAND_LOW_US_DAY) * 1e-6
        / SECONDS_PER_DAY
        / 12f64.sqrt()
}

fn add_bias_var(c: &mut ClockState, var: f64) {
    c.cov[0][0] += var;
}

/// One hop to or from the TT pivot.
fn hop(
    ctx: &ThreadCtx,
    state: &NavState,
    to: Timescale,
) -> Result<(NavState, Vec<BudgetRow>), String> {
    let from = state.clock.timescale;
    let mut out = state.clone();
    out.clock.timescale = to;
    let name = |t: Timescale| match t {
        Timescale::Tt => "TT",
        Timescale::Tdb => "TDB",
        Timescale::Utc => "UTC",
        Timescale::Ltc => "LTC",
    };
    let (a, b) = (name(from), name(to));
    match (from, to) {
        (Timescale::Utc, Timescale::Tt) | (Timescale::Tt, Timescale::Utc) => Ok((
            out,
            vec![row(
                format!(
                    "conversion: {a} -> {b} (TT - UTC from the leap-second table, an exact offset; changes the tag only)"
                ),
                0.0,
                "s",
            )],
        )),
        (Timescale::Tdb, Timescale::Tt) | (Timescale::Tt, Timescale::Tdb) => {
            add_bias_var(&mut out.clock, TDB_TT_NEXT_TERM_S * TDB_TT_NEXT_TERM_S);
            Ok((
                out,
                vec![row(
                    format!(
                        "conversion: {a} -> {b} (two-term periodic series; the next-largest term, about 14 us, stands in for what it leaves out)"
                    ),
                    TDB_TT_NEXT_TERM_S,
                    "s",
                )],
            ))
        }
        (Timescale::Tt, Timescale::Ltc) | (Timescale::Ltc, Timescale::Tt) => {
            let r = ltc_rate_s_per_s(ctx)?;
            let sr = ltc_rate_sigma_s_per_s();
            let t = state.t_s;
            let sign = if to == Timescale::Ltc { -1.0 } else { 1.0 };
            out.clock.bias_s += sign * r * t;
            out.clock.drift_s_per_s += sign * r;
            out.clock.cov[0][0] += sr * sr * t * t;
            out.clock.cov[0][1] += sr * sr * t;
            out.clock.cov[1][0] += sr * sr * t;
            out.clock.cov[1][1] += sr * sr;
            Ok((
                out,
                vec![row(
                    format!(
                        "conversion: {a} -> {b} (secular rate {:.3} us/day over {t} s from the thread epoch; rate uncertain over the 56 to 59 us/day band)",
                        r * SECONDS_PER_DAY * 1e6
                    ),
                    sr * t.abs(),
                    "s",
                )],
            ))
        }
        _ => Err(format!("timescale hop {a} -> {b} is not a pivot hop")),
    }
}

/// Converts a state's clock to another timescale through TT. See the module notes.
pub fn convert_timescale(
    ctx: &ThreadCtx,
    state: &NavState,
    to: Timescale,
) -> Result<(NavState, Vec<BudgetRow>), String> {
    let from = state.clock.timescale;
    if from == to {
        return Ok((state.clone(), Vec::new()));
    }
    let mut rows = Vec::new();
    let mut s = state.clone();
    if from != Timescale::Tt {
        let (n, r) = hop(ctx, &s, Timescale::Tt)?;
        s = n;
        rows.extend(r);
    }
    if to != Timescale::Tt {
        let (n, r) = hop(ctx, &s, to)?;
        s = n;
        rows.extend(r);
    }
    Ok((s, rows))
}

#[cfg(test)]
mod tests {
    use super::*;

    const EPOCH: &str = "2028-03-01T00:00:00Z";

    fn ctx() -> ThreadCtx {
        ThreadCtx::new(EPOCH, 7)
    }

    fn state(frame: Frame, x: [f64; 6], t_s: f64) -> NavState {
        NavState::diagonal(t_s, frame, x, 20.0, 0.02, Timescale::Tt, 1e-6, 1e-12)
    }

    #[test]
    fn mci_to_mcmf_matches_the_engines_rotation_and_a_body_at_rest_in_the_fixed_frame_stays_at_rest(
    ) {
        let omega = TAU / LUNAR_SIDEREAL_DAY_S;
        let t = 5.0 * 86_400.0;
        let r_f = [1.8e6, 0.4e6, 0.9e6];
        // Build the inertial state of a point at rest in MCMF at mission time t.
        let r_i = crate::lunar::mcmf_to_mci(r_f, t);
        let v_i = [-omega * r_i[1], omega * r_i[0], 0.0];
        let s = state(
            Frame::Mci,
            [r_i[0], r_i[1], r_i[2], v_i[0], v_i[1], v_i[2]],
            t,
        );
        let (f, rows) = convert_frame(&ctx(), &s, Frame::Mcmf).unwrap();
        for i in 0..3 {
            assert!(
                (f.x[i] - r_f[i]).abs() < 1e-6,
                "pos {i}: {} vs {}",
                f.x[i],
                r_f[i]
            );
            assert!(f.x[i + 3].abs() < 1e-9, "vel {i}: {}", f.x[i + 3]);
        }
        let want = crate::lunar::mci_to_mcmf(r_i, t);
        for i in 0..3 {
            assert!((f.x[i] - want[i]).abs() < 1e-6);
        }
        assert_eq!(rows.len(), 1);
        assert!(rows[0].source.contains("no libration"));
        assert_eq!(rows[0].sigma, 0.0);
        // A rotation preserves the position trace.
        assert!((f.sigma_pos_m() - s.sigma_pos_m()).abs() < 1e-9);
    }

    #[test]
    fn mci_mcmf_round_trip_returns_the_state_and_the_covariance() {
        let s = state(
            Frame::Mci,
            [1.9e6, -0.3e6, 0.6e6, 120.0, 1500.0, -40.0],
            3.3e5,
        );
        let (f, _) = convert_frame(&ctx(), &s, Frame::Mcmf).unwrap();
        let (b, _) = convert_frame(&ctx(), &f, Frame::Mci).unwrap();
        for i in 0..6 {
            assert!((b.x[i] - s.x[i]).abs() < 1e-6, "x[{i}]");
            for j in 0..6 {
                assert!(
                    (b.p[i][j] - s.p[i][j]).abs() < 1e-6,
                    "p[{i}][{j}]: {} vs {}",
                    b.p[i][j],
                    s.p[i][j]
                );
            }
        }
    }

    #[test]
    fn gcrf_to_mci_puts_the_moon_at_the_origin_and_inflates_by_the_series_error() {
        let c = ctx();
        let epoch = UtcEpoch::parse_iso(EPOCH).unwrap();
        let jd = crate::timescales::tt_to_tdb(crate::timescales::utc_to_tt(epoch.jd_utc(0.0)));
        let m = crate::ephem::moon_icrf(jd);
        let mv = crate::ephem::moon_icrf_velocity(jd);
        let s = state(Frame::Gcrf, [m[0], m[1], m[2], mv[0], mv[1], mv[2]], 0.0);
        let (out, rows) = convert_frame(&c, &s, Frame::Mci).unwrap();
        for i in 0..6 {
            assert!(out.x[i].abs() < 1e-6, "x[{i}] = {}", out.x[i]);
        }
        let sm = moon_series_sigma_m();
        assert!((out.p[0][0] - (s.p[0][0] + sm * sm)).abs() < 1e-3);
        assert!(out.sigma_pos_m() > s.sigma_pos_m());
        assert_eq!(rows.len(), 2);
        assert_eq!(rows[0].unit, "m");
        assert_eq!(rows[1].unit, "m/s");
        // The measured 195.7 km RMS of the analytic series and its velocity at the orbital rate.
        assert!((sm - 195_655.0).abs() < 1.0, "{sm}");
        assert!((moon_series_sigma_mps() - 0.52).abs() < 0.02);
        assert!(rows[0].source.contains("FALLBACK"), "{}", rows[0].source);
        // Back to GCRF adds the same again and recovers the position.
        let (back, _) = convert_frame(&c, &out, Frame::Gcrf).unwrap();
        for i in 0..6 {
            assert!((back.x[i] - s.x[i]).abs() < 1e-6);
        }
    }

    #[test]
    fn gcrf_to_mcmf_goes_through_mci_and_logs_both_steps() {
        let s = state(
            Frame::Gcrf,
            [4.0e8, 1.0e7, 2.0e6, -300.0, 900.0, 10.0],
            7200.0,
        );
        let (out, rows) = convert_frame(&ctx(), &s, Frame::Mcmf).unwrap();
        assert_eq!(out.frame, Frame::Mcmf);
        assert_eq!(rows.len(), 3);
    }

    #[test]
    fn itrf_and_lvlh_are_refused_loudly() {
        let s = state(Frame::Gcrf, [0.0; 6], 0.0);
        assert!(convert_frame(&ctx(), &s, Frame::Itrf)
            .unwrap_err()
            .contains("not available"));
        let s = state(Frame::Lvlh, [0.0; 6], 0.0);
        assert!(convert_frame(&ctx(), &s, Frame::Mci).is_err());
    }

    #[test]
    fn tt_to_ltc_shifts_bias_and_drift_by_the_secular_rate_and_back() {
        let c = ctx();
        let t = 86_400.0;
        let s = state(Frame::Mci, [0.0; 6], t);
        let (l, rows) = convert_timescale(&c, &s, Timescale::Ltc).unwrap();
        // The lunar clock runs fast against TT by 56 to 59 us/day.
        let r = ltc_rate_s_per_s(&c).unwrap();
        assert!(r * SECONDS_PER_DAY * 1e6 > 56.0 && r * SECONDS_PER_DAY * 1e6 < 59.0);
        assert!((l.clock.bias_s + r * t).abs() < 1e-18);
        assert!((l.clock.drift_s_per_s + r).abs() < 1e-24);
        assert_eq!(l.clock.timescale, Timescale::Ltc);
        assert_eq!(rows.len(), 1);
        // Added variance grows with the elapsed time.
        assert!(l.sigma_time_s() > s.sigma_time_s());
        let (b, _) = convert_timescale(&c, &l, Timescale::Tt).unwrap();
        assert!(b.clock.bias_s.abs() < 1e-18);
        assert!(b.clock.drift_s_per_s.abs() < 1e-24);
    }

    #[test]
    fn utc_and_tdb_reach_ltc_through_tt_one_line_per_hop() {
        let c = ctx();
        let mut s = state(Frame::Mci, [0.0; 6], 3600.0);
        s.clock.timescale = Timescale::Utc;
        let (l, rows) = convert_timescale(&c, &s, Timescale::Ltc).unwrap();
        assert_eq!(rows.len(), 2);
        assert!(rows[0].source.contains("UTC -> TT") && rows[1].source.contains("TT -> LTC"));
        assert_eq!(l.clock.timescale, Timescale::Ltc);
        let mut s = state(Frame::Mci, [0.0; 6], 3600.0);
        s.clock.timescale = Timescale::Tdb;
        let (l, rows) = convert_timescale(&c, &s, Timescale::Ltc).unwrap();
        assert_eq!(rows.len(), 2);
        // TDB -> TT adds about 14 us of bias sigma.
        assert!(l.sigma_time_s() >= TDB_TT_NEXT_TERM_S);
        let same = convert_timescale(&c, &s, Timescale::Tdb).unwrap();
        assert!(same.1.is_empty());
    }

    const KERNEL_2028: &[u8] =
        include_bytes!("../../tests/fixtures/mission_thread/de440s_moon_2028-01-01_2028-04-01.bsp");
    const KERNEL_2022: &[u8] =
        include_bytes!("../../tests/fixtures/mission_thread/de440s_moon_2022-11-16_2022-12-12.bsp");
    const HORIZONS_2028: &str =
        include_str!("../../tests/fixtures/mission_thread/horizons_moon_geocentric_2028.txt");
    const HORIZONS_2022: &str =
        include_str!("../../tests/fixtures/mission_thread/horizons_moon_geocentric_2022.txt");

    fn kernel(bytes: &[u8], name: &str) -> crate::ephem_provider::KernelEphemeris {
        crate::ephem_provider::KernelEphemeris::from_bytes(bytes.to_vec(), name.to_string())
            .expect("the committed kernel cut parses")
    }

    /// `(jd_tdb, [x, y, z] m, [vx, vy, vz] m/s)` rows of a pinned Horizons table.
    fn horizons(text: &str) -> Vec<(f64, [f64; 3], [f64; 3])> {
        let body = text
            .split("$$SOE")
            .nth(1)
            .and_then(|t| t.split("$$EOE").next())
            .expect("a Horizons vector table");
        body.lines()
            .filter(|l| !l.trim().is_empty())
            .map(|l| {
                let f: Vec<&str> = l.split(',').map(str::trim).collect();
                let n = |i: usize| f[i].parse::<f64>().unwrap();
                (
                    n(0),
                    [n(2) * 1e3, n(3) * 1e3, n(4) * 1e3],
                    [n(5) * 1e3, n(6) * 1e3, n(7) * 1e3],
                )
            })
            .collect()
    }

    /// The kernel cut against pinned JPL Horizons geocentric Moon states: both windows, five
    /// epochs each. Measured: worst 2.6 m and 7e-6 m/s. Horizons' centre body is sourced from DE441, the kernel is DE440s, so a few
    /// metres of disagreement is the two ephemerides, not the reader.
    #[test]
    fn the_committed_kernel_cuts_agree_with_pinned_horizons_values() {
        use crate::ephem_provider::naif_code::{EARTH, MOON};
        let mut worst_pos: f64 = 0.0;
        let mut worst_vel: f64 = 0.0;
        for (bytes, text) in [(KERNEL_2028, HORIZONS_2028), (KERNEL_2022, HORIZONS_2022)] {
            let k = kernel(bytes, "cut");
            let rows = horizons(text);
            assert_eq!(rows.len(), 5);
            for (jd, p, v) in rows {
                let st = k.state(MOON, EARTH, crate::jd2::Jd2::new(jd)).unwrap();
                let dp = (0..3)
                    .map(|i| (st[0][i] - p[i]).powi(2))
                    .sum::<f64>()
                    .sqrt();
                let dv = (0..3)
                    .map(|i| (st[1][i] - v[i]).powi(2))
                    .sum::<f64>()
                    .sqrt();
                worst_pos = worst_pos.max(dp);
                worst_vel = worst_vel.max(dv);
            }
        }
        eprintln!("kernel versus Horizons: worst position {worst_pos:.3} m, worst velocity {worst_vel:.3e} m/s");
        // The stand-in the conversion row states must cover what was measured.
        assert!(worst_pos < KERNEL_MOON_SIGMA_M, "position {worst_pos} m");
        assert!(
            worst_vel < KERNEL_MOON_SIGMA_MPS,
            "velocity {worst_vel} m/s"
        );
    }

    #[test]
    fn with_a_kernel_that_covers_the_epoch_the_row_states_the_kernel_and_a_5_m_floor() {
        let c =
            ThreadCtx::new("2028-01-10T00:00:00Z", 1).with_moon_kernel(kernel(KERNEL_2028, "cut"));
        let t = 86_400.0;
        let epoch = UtcEpoch::parse_iso("2028-01-10T00:00:00Z").unwrap();
        let jd = crate::timescales::tt_to_tdb(crate::timescales::utc_to_tt(epoch.jd_utc(t)));
        let k = kernel(KERNEL_2028, "cut");
        use crate::ephem_provider::naif_code::{EARTH, MOON};
        let st = k.state(MOON, EARTH, crate::jd2::Jd2::new(jd)).unwrap();
        let s = state(
            Frame::Gcrf,
            [st[0][0], st[0][1], st[0][2], st[1][0], st[1][1], st[1][2]],
            t,
        );
        let (out, rows) = convert_frame(&c, &s, Frame::Mci).unwrap();
        for i in 0..6 {
            assert!(out.x[i].abs() < 1e-6, "x[{i}] = {}", out.x[i]);
        }
        assert_eq!(rows[0].sigma, KERNEL_MOON_SIGMA_M);
        assert_eq!(rows[1].sigma, KERNEL_MOON_SIGMA_MPS);
        assert!(
            rows[0]
                .source
                .contains("SPK kernel sha256 3a845f1fdca6f442"),
            "{}",
            rows[0].source
        );
        assert!(!rows[0].source.contains("FALLBACK"));
        // The handover cost is the 5 m floor, not hundreds of kilometres.
        let added = (out.p[0][0] - s.p[0][0]).sqrt();
        assert!((added - 5.0).abs() < 1e-9, "{added}");
    }

    #[test]
    fn outside_the_kernel_the_analytic_series_is_the_fallback_and_the_row_says_so() {
        // The 2028 cut ends on 2028-04-01; a state in 2028-09 falls back.
        let c =
            ThreadCtx::new("2028-09-01T00:00:00Z", 1).with_moon_kernel(kernel(KERNEL_2028, "cut"));
        let s = state(Frame::Gcrf, [4.0e8, 0.0, 0.0, 0.0, 900.0, 0.0], 0.0);
        let (out, rows) = convert_frame(&c, &s, Frame::Mci).unwrap();
        assert!(rows[0].source.contains("FALLBACK"), "{}", rows[0].source);
        assert!(
            rows[0].source.contains("does not cover"),
            "{}",
            rows[0].source
        );
        assert!(
            rows[0].source.contains("195.7 km RMS"),
            "{}",
            rows[0].source
        );
        assert_eq!(rows[0].sigma, MOON_SERIES_MEASURED_RMS_M);
        assert!(out.sigma_pos_m() > s.sigma_pos_m());
    }

    /// The measured RMS the fallback quotes is the one the committed 2015 Horizons table gives.
    #[test]
    fn the_quoted_series_error_is_what_the_pinned_2015_table_gives() {
        let text = include_str!("../../tests/fixtures/lunar_llr/horizons_moon_geocentric_2015.csv");
        let mut n = 0;
        let mut sum_sq = 0.0;
        for line in text.lines() {
            let t = line.trim();
            if t.is_empty() || t.starts_with('#') || t.starts_with("jd_tt") {
                continue;
            }
            let f: Vec<f64> = t.split(',').map(|x| x.parse().unwrap()).collect();
            let t_jc = (f[0] - crate::timescales::JD_J2000) / 36_525.0;
            let r = crate::ephem::moon_position(t_jc);
            let d = [r[0] / 1e3 - f[1], r[1] / 1e3 - f[2], r[2] / 1e3 - f[3]];
            sum_sq += d.iter().map(|x| x * x).sum::<f64>();
            n += 1;
        }
        assert_eq!(n, 12);
        let rms_m = (sum_sq / n as f64).sqrt() * 1e3;
        assert!(
            (rms_m - MOON_SERIES_MEASURED_RMS_M).abs() < 0.01 * MOON_SERIES_MEASURED_RMS_M,
            "{rms_m} m"
        );
    }
}
