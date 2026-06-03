// SPDX-License-Identifier: Apache-2.0
//! GLONASS broadcast ephemeris: a PZ-90 state-vector model with RK4 propagation.
//!
//! GLONASS does not broadcast Keplerian elements like GPS/Galileo/BeiDou. Each
//! navigation message carries, at a half-hourly reference epoch, the satellite's
//! Earth-fixed (PZ-90) **state vector** — position, velocity, and the slowly
//! varying luni-solar acceleration — and the user obtains the position at an
//! arbitrary time by numerically integrating the GLONASS ICD equations of motion
//! (central gravity + the `J2` oblateness term + Earth-rotation Coriolis/centrifugal
//! terms + the broadcast acceleration held constant) with a 4th-order Runge–Kutta
//! step. The ephemeris is valid for ±15 minutes around its reference epoch.
//!
//! This module parses the RINEX 3 GLONASS (`R`) records into a
//! [`GlonassEphemeris`] and propagates them in the PZ-90 Earth-fixed frame; the
//! result is exposed to the rest of the engine as a [`crate::orbit::Propagator`].
//! Scope: the broadcast (operational) ephemeris. The clock/frequency parameters
//! are parsed but not yet applied; the frame is treated as ECEF-equivalent for the
//! TEME rotation, consistent with the GMST-only frame model elsewhere.

use crate::rinex::{col, orbit_fields, parse_d, EpochUtc};
use serde::Serialize;

/// PZ-90.11 gravitational constant `μ` (km³/s²).
const MU: f64 = 398600.4418;
/// PZ-90.11 Earth equatorial radius `aₑ` (km).
const A_E: f64 = 6378.136;
/// Second zonal harmonic `C̄₂₀ = −J₂` (dimensionless), GLONASS ICD.
const C20: f64 = -1.08262575e-3;
/// Earth rotation rate `ω` (rad/s), GLONASS ICD (PZ-90).
const OMEGA: f64 = 7.292115e-5;
/// Cap on the RK4 integration step (s); the interval is split into steps no
/// longer than this. 60 s is the GLONASS-standard maximum.
const MAX_STEP_S: f64 = 60.0;

/// A GLONASS broadcast ephemeris parsed from one RINEX 3 navigation record: the
/// PZ-90 Earth-fixed state vector at the reference epoch plus the clock/frequency
/// parameters. Distances are stored in metres (RINEX gives kilometres).
#[derive(Clone, Copy, Debug, Serialize)]
pub struct GlonassEphemeris {
    /// PRN (slot number) within GLONASS.
    pub prn: u8,
    /// Message reference epoch (UTC); the state vector is given at this instant.
    pub epoch: EpochUtc,
    /// SV clock bias field as written in RINEX (`−τₙ`, s).
    pub minus_tau_n: f64,
    /// Relative frequency bias `+γₙ` (dimensionless).
    pub gamma_n: f64,
    /// Message frame time (s of day).
    pub message_time_s: f64,
    /// PZ-90 ECEF position at the epoch (m).
    pub pos_m: [f64; 3],
    /// PZ-90 ECEF velocity at the epoch (m/s).
    pub vel_m_s: [f64; 3],
    /// Luni-solar acceleration (m/s²), held constant over the integration.
    pub acc_m_s2: [f64; 3],
    /// Health flag (`Bₙ`; 0 = healthy).
    pub health: f64,
    /// Frequency channel number `Hₙ`.
    pub freq_channel: f64,
    /// Age of the operational information (days).
    pub age_days: f64,
}

/// The 6-state ECEF derivative `[ẋ, ẏ, ż, v̇ₓ, v̇ᵧ, v̇_z]` (km, s) for the GLONASS
/// equations of motion, with the broadcast luni-solar acceleration `acc` (km/s²).
fn derivative(s: &[f64; 6], acc: [f64; 3]) -> [f64; 6] {
    let (x, y, z, vx, vy, vz) = (s[0], s[1], s[2], s[3], s[4], s[5]);
    let r2 = x * x + y * y + z * z;
    let r = r2.sqrt();
    let r3 = r2 * r;
    let r5 = r3 * r2;
    let j2 = 1.5 * C20 * MU * A_E * A_E / r5;
    let z2r2 = z * z / r2;
    let w2 = OMEGA * OMEGA;
    [
        vx,
        vy,
        vz,
        -MU * x / r3 + j2 * x * (1.0 - 5.0 * z2r2) + w2 * x + 2.0 * OMEGA * vy + acc[0],
        -MU * y / r3 + j2 * y * (1.0 - 5.0 * z2r2) + w2 * y - 2.0 * OMEGA * vx + acc[1],
        -MU * z / r3 + j2 * z * (3.0 - 5.0 * z2r2) + acc[2],
    ]
}

/// One classical 4th-order Runge–Kutta step of size `h` (s).
fn rk4_step(s: &[f64; 6], h: f64, acc: [f64; 3]) -> [f64; 6] {
    let advance = |base: &[f64; 6], k: &[f64; 6], f: f64| {
        let mut o = [0.0; 6];
        for i in 0..6 {
            o[i] = base[i] + k[i] * f;
        }
        o
    };
    let k1 = derivative(s, acc);
    let k2 = derivative(&advance(s, &k1, h * 0.5), acc);
    let k3 = derivative(&advance(s, &k2, h * 0.5), acc);
    let k4 = derivative(&advance(s, &k3, h), acc);
    let mut out = [0.0; 6];
    for i in 0..6 {
        out[i] = s[i] + h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]);
    }
    out
}

impl GlonassEphemeris {
    /// The full PZ-90 Earth-fixed state — position (m) and velocity (m/s) — at
    /// `t_offset_s` seconds from the ephemeris reference epoch, by RK4 integration
    /// of the GLONASS equations of motion (the interval is split into steps
    /// ≤ [`MAX_STEP_S`]). `t_offset_s = 0` returns the broadcast state exactly.
    pub fn propagate(&self, t_offset_s: f64) -> ([f64; 3], [f64; 3]) {
        // Integrate in kilometres (the constants' native units).
        let mut s = [
            self.pos_m[0] / 1000.0,
            self.pos_m[1] / 1000.0,
            self.pos_m[2] / 1000.0,
            self.vel_m_s[0] / 1000.0,
            self.vel_m_s[1] / 1000.0,
            self.vel_m_s[2] / 1000.0,
        ];
        let acc = [
            self.acc_m_s2[0] / 1000.0,
            self.acc_m_s2[1] / 1000.0,
            self.acc_m_s2[2] / 1000.0,
        ];
        let n = (t_offset_s.abs() / MAX_STEP_S).ceil().max(1.0) as usize;
        let h = t_offset_s / n as f64;
        for _ in 0..n {
            s = rk4_step(&s, h, acc);
        }
        (
            [s[0] * 1000.0, s[1] * 1000.0, s[2] * 1000.0],
            [s[3] * 1000.0, s[4] * 1000.0, s[5] * 1000.0],
        )
    }

    /// The PZ-90 Earth-fixed (ECEF) position (m) at `t_offset_s` seconds from the
    /// reference epoch. `t_offset_s = 0` returns the broadcast position exactly.
    pub fn position_ecef(&self, t_offset_s: f64) -> [f64; 3] {
        self.propagate(t_offset_s).0
    }

    /// The UT1 Julian Date at `t_offset_s` from the reference epoch. The GLONASS
    /// broadcast epoch is already UTC (unlike the GPS time scale), and UT1 ≈ UTC,
    /// consistent with the GMST-only frame rotation.
    pub fn jd_ut1(&self, t_offset_s: f64) -> f64 {
        crate::timescales::julian_date(
            self.epoch.year,
            self.epoch.month,
            self.epoch.day,
            self.epoch.hour,
            self.epoch.minute,
            self.epoch.second,
        ) + t_offset_s / 86_400.0
    }

    /// Position (m) in the shared TEME inertial frame at `t_offset_s`, by rotating
    /// the PZ-90 Earth-fixed position through GMST — what lets a GLONASS satellite
    /// drive the same geometry/visibility pipeline as the other propagators.
    pub fn position_teme(&self, t_offset_s: f64) -> [f64; 3] {
        crate::frames::ecef_to_teme(self.position_ecef(t_offset_s), self.jd_ut1(t_offset_s))
    }

    /// Approximate orbital period (s) from the broadcast radius, `2π·√(r³/μ⊕)`.
    pub fn orbital_period_s(&self) -> f64 {
        let r = (self.pos_m[0].powi(2) + self.pos_m[1].powi(2) + self.pos_m[2].powi(2)).sqrt();
        std::f64::consts::TAU * (r * r * r / crate::orbit::MU_EARTH).sqrt()
    }
}

/// Parse the GLONASS (`R`) broadcast ephemerides from a RINEX 3 navigation file.
/// Each record is four lines (the epoch/clock line plus three state-vector lines).
/// Records for other systems are skipped using their own line count, so a mixed
/// file still yields its GLONASS ephemerides.
pub fn parse_glonass_nav(text: &str) -> Result<Vec<GlonassEphemeris>, String> {
    let lines: Vec<&str> = text.lines().collect();
    let mut i = 0;
    while i < lines.len() {
        let done = lines[i].contains("END OF HEADER");
        i += 1;
        if done {
            break;
        }
    }
    let mut out = Vec::new();
    while i < lines.len() {
        let head = lines[i];
        if head.trim().is_empty() {
            i += 1;
            continue;
        }
        let system = head.chars().next().unwrap_or(' ');
        let nlines = if matches!(system, 'R' | 'S') { 4 } else { 8 };
        if i + nlines > lines.len() {
            break;
        }
        if system != 'R' {
            i += nlines;
            continue;
        }
        let prn: u8 = col(head, 1, 3)
            .trim()
            .parse()
            .map_err(|_| format!("bad GLONASS PRN in {head:?}"))?;
        let epoch = EpochUtc {
            year: col(head, 4, 8).trim().parse().map_err(|_| "bad year")?,
            month: col(head, 9, 11).trim().parse().map_err(|_| "bad month")?,
            day: col(head, 12, 14).trim().parse().map_err(|_| "bad day")?,
            hour: col(head, 15, 17).trim().parse().map_err(|_| "bad hour")?,
            minute: col(head, 18, 20).trim().parse().map_err(|_| "bad minute")?,
            second: parse_d(col(head, 21, 23))?,
        };
        let minus_tau_n = parse_d(col(head, 23, 42))?;
        let gamma_n = parse_d(col(head, 42, 61))?;
        let message_time_s = parse_d(col(head, 61, 80))?;
        let l1 = orbit_fields(lines[i + 1])?;
        let l2 = orbit_fields(lines[i + 2])?;
        let l3 = orbit_fields(lines[i + 3])?;
        // Each state-vector line carries one coordinate's position, velocity, and
        // acceleration (km, km/s, km/s²) plus a status field. Store in metres.
        out.push(GlonassEphemeris {
            prn,
            epoch,
            minus_tau_n,
            gamma_n,
            message_time_s,
            pos_m: [l1[0] * 1000.0, l2[0] * 1000.0, l3[0] * 1000.0],
            vel_m_s: [l1[1] * 1000.0, l2[1] * 1000.0, l3[1] * 1000.0],
            acc_m_s2: [l1[2] * 1000.0, l2[2] * 1000.0, l3[2] * 1000.0],
            health: l1[3],
            freq_channel: l2[3],
            age_days: l3[3],
        });
        i += nlines;
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    // A minimal RINEX 3 GLONASS navigation file: header + one record (epoch line
    // + three state-vector lines). The state vector is a representative GLONASS
    // satellite (~25 500 km orbit, ~3.95 km/s), near-circular for the test.
    const SAMPLE: &str = "\
     3.04           N: GNSS NAV DATA    R: GLONASS          RINEX VERSION / TYPE
                                                            END OF HEADER
R01 2023 01 01 00 15 00-1.234567890123D-04 0.000000000000D+00 9.000000000000D+02
     7.150123046875D+03 2.500000000000D+00 9.313225746155D-10 0.000000000000D+00
    -1.512345678901D+04 2.800000000000D+00 0.000000000000D+00 1.000000000000D+00
     1.890123456789D+04 1.300000000000D+00-1.862645149231D-09 0.000000000000D+00";

    #[test]
    fn parses_a_glonass_record() {
        let ephs = parse_glonass_nav(SAMPLE).expect("parses");
        assert_eq!(ephs.len(), 1);
        let e = &ephs[0];
        assert_eq!(e.prn, 1);
        assert_eq!(e.epoch.minute, 15);
        // Position fields (km → m).
        assert!((e.pos_m[0] - 7150123.046875).abs() < 1e-3);
        assert!((e.pos_m[1] - -15123456.78901).abs() < 1.0);
        assert!((e.pos_m[2] - 18901234.56789).abs() < 1.0);
        // Velocity (km/s → m/s).
        assert!((e.vel_m_s[0] - 2500.0).abs() < 1e-6);
        // The state is a GLONASS-altitude orbit (~25 500 km).
        let r = (e.pos_m[0].powi(2) + e.pos_m[1].powi(2) + e.pos_m[2].powi(2)).sqrt();
        assert!((r - 25_500_000.0).abs() < 1_000_000.0, "radius {r:.0} m");
    }

    #[test]
    fn position_at_epoch_is_the_broadcast_state() {
        let e = &parse_glonass_nav(SAMPLE).unwrap()[0];
        // t = 0 returns the broadcast position exactly (no integration).
        assert_eq!(e.position_ecef(0.0), e.pos_m);
    }

    #[test]
    fn integration_keeps_the_orbit_radius_physical() {
        let e = &parse_glonass_nav(SAMPLE).unwrap()[0];
        let r0 = (e.pos_m[0].powi(2) + e.pos_m[1].powi(2) + e.pos_m[2].powi(2)).sqrt();
        // Over a 5-minute propagation the radius stays within a few percent.
        let p = e.position_ecef(300.0);
        let r = (p[0].powi(2) + p[1].powi(2) + p[2].powi(2)).sqrt();
        assert!(
            (r - r0).abs() / r0 < 0.05,
            "radius drift {:.3}",
            (r - r0) / r0
        );
    }

    #[test]
    fn integration_is_reversible() {
        // Integrating the full state forward then back by the same interval
        // returns to the start, which validates the RK4 step and its sign
        // handling. Re-seeding uses the propagated velocity (not a finite
        // difference), so the round trip is tight.
        let e = &parse_glonass_nav(SAMPLE).unwrap()[0];
        let (p_fwd, v_fwd) = e.propagate(600.0);
        let mut forward = *e;
        forward.pos_m = p_fwd;
        forward.vel_m_s = v_fwd;
        let back = forward.position_ecef(-600.0);
        for (got, want) in back.iter().zip(e.pos_m.iter()) {
            assert!(
                (got - want).abs() < 1.0,
                "round-trip error {} m",
                got - want
            );
        }
    }

    #[test]
    fn skips_non_glonass_records() {
        // A GPS record (8 lines) before the GLONASS one is skipped by its own
        // length, so the GLONASS record still parses.
        let gps = "G01 2023 01 01 00 00 00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     0.0D+00 0.0D+00 0.0D+00 0.0D+00\n     \
0.0D+00 0.0D+00 0.0D+00 0.0D+00";
        let mixed = SAMPLE.replace(
            "R01 2023 01 01 00 15 00",
            &format!("{gps}\nR01 2023 01 01 00 15 00"),
        );
        let ephs = parse_glonass_nav(&mixed).expect("parses");
        assert_eq!(ephs.len(), 1);
        assert_eq!(ephs[0].prn, 1);
    }
}
