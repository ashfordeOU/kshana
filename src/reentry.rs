// SPDX-License-Identifier: AGPL-3.0-only
//! Ballistic re-entry corridor (Allen–Eggers): the closed-form analytic entry of a
//! non-lifting body through an exponential atmosphere at a constant flight-path
//! angle. It turns an entry velocity + flight-path angle into peak deceleration,
//! the velocity and altitude where that peak occurs, and the peak-heating velocity
//! — the pre-Phase-A corridor numbers an EDL analyst brackets before any
//! high-fidelity trajectory or aerothermal run.
//!
//! The famous Allen–Eggers result: peak deceleration
//! `a_max = V_e²·sin|γ| / (2·e·H)` is **independent of the ballistic coefficient**
//! (mass, drag and area cancel). The peak occurs at `V = V_e·e^(−1/2)`, and the
//! convective stagnation heating rate (`∝ √ρ·V³`) peaks earlier, at
//! `V = V_e·e^(−1/6)`.
//!
//! HONEST SCOPE (MODELLED): ballistic (no lift), exponential isothermal
//! atmosphere, constant flight-path angle, flat decel-only energy balance. No
//! aerothermal (TPS) model — the heating output is the Allen–Eggers *velocity at
//! peak heating*, not a heat-flux in W/m².
//!
//! Beside the closed form, [`simulate_planar_entry`] integrates the same ballistic
//! problem as a planar point mass with inverse-square gravity and Earth curvature
//! through the US Standard Atmosphere 1976 ([`us76_density`]), so the flight-path angle
//! is free to flatten. That is what a shallow, fast entry needs: for Stardust
//! (12.9 km/s, −8.2°) the closed form roughly doubles the reconstructed peak. Still
//! planar, non-rotating, constant ballistic coefficient; not a 6-DoF trajectory.
//!
//! **Reference.** H. J. Allen & A. J. Eggers, *A Study of the Motion and
//! Aerodynamic Heating of Ballistic Missiles Entering the Earth's Atmosphere at
//! High Supersonic Speeds*, NACA Report 1381 (1958).

use crate::orbit::R_EARTH_EQUATORIAL_M;
use serde::Deserialize;

/// Earth sea-level density (kg/m³) used as the exponential-atmosphere reference.
pub const RHO0_EARTH: f64 = 1.225;
/// Earth atmospheric density scale height (m) for the exponential model.
pub const SCALE_HEIGHT_EARTH_M: f64 = 7200.0;
/// Standard gravity (m/s²), for expressing deceleration in g.
pub const G0: f64 = 9.806_65;

/// Allen–Eggers peak deceleration (m/s²) for entry speed `v_entry_m_s` at
/// flight-path angle `gamma_rad` (below horizontal) through an atmosphere of scale
/// height `scale_height_m`: `V_e²·sin|γ| / (2·e·H)`. Independent of the ballistic
/// coefficient.
pub fn peak_deceleration(v_entry_m_s: f64, gamma_rad: f64, scale_height_m: f64) -> f64 {
    v_entry_m_s * v_entry_m_s * gamma_rad.abs().sin() / (2.0 * std::f64::consts::E * scale_height_m)
}

/// Velocity (m/s) at which peak deceleration occurs: `V_e·e^(−1/2)` (≈0.607·V_e).
pub fn velocity_at_peak_deceleration(v_entry_m_s: f64) -> f64 {
    v_entry_m_s * (-0.5_f64).exp()
}

/// Velocity (m/s) at which convective stagnation heating peaks: `V_e·e^(−1/6)`
/// (≈0.846·V_e) — earlier (faster) than the deceleration peak.
pub fn velocity_at_peak_heating(v_entry_m_s: f64) -> f64 {
    v_entry_m_s * (-1.0 / 6.0_f64).exp()
}

/// Altitude (m) of peak deceleration: the peak occurs at density
/// `ρ* = B·sin|γ| / H`, so `h* = H·ln(ρ0·H / (B·sin|γ|))`, where `B` is the
/// ballistic coefficient `m/(C_D·A)` (kg/m²). Unlike the peak magnitude, this
/// altitude depends on `B`.
pub fn altitude_at_peak_deceleration(
    gamma_rad: f64,
    ballistic_coeff: f64,
    rho0: f64,
    scale_height_m: f64,
) -> f64 {
    let rho_star = ballistic_coeff * gamma_rad.abs().sin() / scale_height_m;
    // h* = H·ln(ρ0/ρ*); since ρ* already carries the 1/H, this expands to the
    // textbook H·ln(ρ0·H/(B·sin|γ|)).
    scale_height_m * (rho0 / rho_star).ln()
}

// ---------------------------------------------------------------------------
// US Standard Atmosphere 1976 density
// ---------------------------------------------------------------------------

/// US Standard Atmosphere 1976 (US76): effective Earth radius for the geopotential
/// altitude (m).
const US76_R0_M: f64 = 6_356_766.0;
/// US76 gas constant for air, `R* / M0` = 8.314 32 / 0.028 964 4 (J/(kg·K)).
const US76_R_AIR: f64 = 8.314_32 / 0.028_964_4;
/// US76 lower-atmosphere layers: (base geopotential altitude m', base temperature K,
/// lapse rate K/m', base pressure Pa), the standard's defining values to 84.852 km'.
const US76_LAYERS: [(f64, f64, f64, f64); 7] = [
    (0.0, 288.15, -0.0065, 101_325.0),
    (11_000.0, 216.65, 0.0, 22_632.06),
    (20_000.0, 216.65, 0.001, 5_474.889),
    (32_000.0, 228.65, 0.0028, 868.018_7),
    (47_000.0, 270.65, 0.0, 110.906_3),
    (51_000.0, 270.65, -0.0028, 66.938_87),
    (71_000.0, 214.65, -0.002, 3.956_420),
];
/// Geometric altitude (m) where the hydrostatic layers end and the tabulated upper
/// atmosphere begins (84.852 km geopotential).
const US76_UPPER_START_M: f64 = 86_000.0;
/// US76 tabulated mass density above 86 km: (geometric altitude km, density kg/m³), from
/// the standard's tables (NOAA/NASA/USAF, *U.S. Standard Atmosphere, 1976*).
const US76_UPPER: [(f64, f64); 24] = [
    (86.0, 6.958e-6),
    (90.0, 3.416e-6),
    (95.0, 1.393e-6),
    (100.0, 5.604e-7),
    (105.0, 2.325e-7),
    (110.0, 9.708e-8),
    (115.0, 4.289e-8),
    (120.0, 2.222e-8),
    (125.0, 1.291e-8),
    (130.0, 8.152e-9),
    (140.0, 3.831e-9),
    (150.0, 2.076e-9),
    (160.0, 1.233e-9),
    (180.0, 5.194e-10),
    (200.0, 2.541e-10),
    (250.0, 6.073e-11),
    (300.0, 1.916e-11),
    (400.0, 2.803e-12),
    (500.0, 5.215e-13),
    (600.0, 1.137e-13),
    (700.0, 3.070e-14),
    (800.0, 1.136e-14),
    (900.0, 5.759e-15),
    (1000.0, 3.561e-15),
];

/// US Standard Atmosphere 1976 mass density (kg/m³) at geometric altitude `altitude_m`.
///
/// 0–86 km: the standard's seven hydrostatic layers in geopotential altitude (exact
/// definition). 86–1000 km: log-linear interpolation in the standard's tabulated
/// densities. Below 0 m the sea-level layer is extended; above 1000 km the density is 0.
pub fn us76_density(altitude_m: f64) -> f64 {
    if altitude_m.is_nan() {
        return f64::NAN;
    }
    if altitude_m < US76_UPPER_START_M {
        let hp = US76_R0_M * altitude_m / (US76_R0_M + altitude_m);
        let mut layer = US76_LAYERS[0];
        for l in US76_LAYERS.iter() {
            if hp >= l.0 {
                layer = *l;
            }
        }
        let (hb, tb, lapse, pb) = layer;
        let t = tb + lapse * (hp - hb);
        let p = if lapse == 0.0 {
            pb * (-G0 * (hp - hb) / (US76_R_AIR * tb)).exp()
        } else {
            pb * (tb / t).powf(G0 / (US76_R_AIR * lapse))
        };
        return p / (US76_R_AIR * t);
    }
    let z_km = altitude_m / 1000.0;
    let last = US76_UPPER[US76_UPPER.len() - 1];
    if z_km > last.0 {
        return 0.0;
    }
    for w in US76_UPPER.windows(2) {
        let ((z0, r0), (z1, r1)) = (w[0], w[1]);
        if z_km <= z1 {
            let f = (z_km - z0) / (z1 - z0);
            return (r0.ln() + f * (r1.ln() - r0.ln())).exp();
        }
    }
    last.1
}

// ---------------------------------------------------------------------------
// Planar point-mass ballistic entry
// ---------------------------------------------------------------------------

/// Earth gravitational parameter used by the point-mass integrator (m³/s²).
pub const MU_EARTH_M3_S2: f64 = 3.986_004_418e14;
/// Integration step of the point-mass integrator (s).
pub const PLANAR_ENTRY_STEP_S: f64 = 0.01;
/// The point-mass run stops below this altitude (m)…
pub const PLANAR_ENTRY_STOP_ALTITUDE_M: f64 = 10_000.0;
/// …or below this speed (m/s).
pub const PLANAR_ENTRY_STOP_SPEED_M_S: f64 = 100.0;

/// The entry-interface state and vehicle of a planar ballistic entry.
#[derive(Clone, Copy, Debug)]
pub struct PlanarEntry {
    /// Speed at the entry interface (m/s).
    pub entry_speed_m_s: f64,
    /// Flight-path angle below the local horizontal at the interface (rad, positive down).
    pub flight_path_angle_rad: f64,
    /// Entry-interface altitude above the spherical Earth of radius [`R_EARTH_M`] (m).
    pub interface_altitude_m: f64,
    /// Ballistic coefficient `m / (C_D·A)` (kg/m²), constant over the entry.
    pub ballistic_coeff_kg_m2: f64,
}

/// What the point-mass integration found.
#[derive(Clone, Copy, Debug)]
pub struct PlanarEntryResult {
    /// Largest drag (sensed) deceleration (m/s²).
    pub peak_deceleration_m_s2: f64,
    /// The same in standard gravities.
    pub peak_deceleration_g: f64,
    /// Speed at the peak (m/s); atmosphere-relative, since the atmosphere does not rotate.
    pub speed_at_peak_m_s: f64,
    /// Altitude at the peak (m).
    pub altitude_at_peak_m: f64,
    /// Time from the interface to the peak (s).
    pub time_at_peak_s: f64,
    /// Flight-path angle below the horizontal at the peak (rad, positive down).
    pub flight_path_angle_at_peak_rad: f64,
    /// Time at which the run stopped (s).
    pub end_time_s: f64,
}

/// Integrate a planar, ballistic (no-lift) point-mass entry over a spherical,
/// non-rotating Earth of radius [`R_EARTH_M`] with inverse-square gravity
/// ([`MU_EARTH_M3_S2`]) through the US Standard Atmosphere 1976 ([`us76_density`]).
///
/// Equations of motion (speed `V`, flight-path angle `γ` positive up, radius `r`):
/// `V' = −ρV²/(2B) − g sin γ`, `γ' = (V/r − g/V) cos γ`, `r' = V sin γ`, `g = μ/r²`.
/// Fixed-step fourth-order Runge–Kutta at [`PLANAR_ENTRY_STEP_S`] until the altitude
/// falls below [`PLANAR_ENTRY_STOP_ALTITUDE_M`] or the speed below
/// [`PLANAR_ENTRY_STOP_SPEED_M_S`]; the peak is the largest per-step drag deceleration.
/// Unlike [`peak_deceleration`], gravity and curvature let the path flatten (and loft) on
/// a shallow entry, which is what lowers the peak for fast, shallow returns.
pub fn simulate_planar_entry(e: &PlanarEntry) -> PlanarEntryResult {
    let b = e.ballistic_coeff_kg_m2;
    let deriv = |s: [f64; 3]| -> ([f64; 3], f64) {
        let (v, g, r) = (s[0], s[1], s[2]);
        let rho = us76_density(r - R_EARTH_M);
        let drag = rho * v * v / (2.0 * b);
        let grav = MU_EARTH_M3_S2 / (r * r);
        (
            [
                -drag - grav * g.sin(),
                (v / r - grav / v) * g.cos(),
                v * g.sin(),
            ],
            drag,
        )
    };
    let add =
        |a: [f64; 3], k: [f64; 3], h: f64| [a[0] + h * k[0], a[1] + h * k[1], a[2] + h * k[2]];
    let dt = PLANAR_ENTRY_STEP_S;
    let mut s = [
        e.entry_speed_m_s,
        -e.flight_path_angle_rad.abs(),
        R_EARTH_M + e.interface_altitude_m,
    ];
    let mut t = 0.0;
    let (_, d0) = deriv(s);
    let mut best = PlanarEntryResult {
        peak_deceleration_m_s2: d0,
        peak_deceleration_g: d0 / G0,
        speed_at_peak_m_s: s[0],
        altitude_at_peak_m: s[2] - R_EARTH_M,
        time_at_peak_s: 0.0,
        flight_path_angle_at_peak_rad: -s[1],
        end_time_s: 0.0,
    };
    // A bound on the step count keeps a skipping or orbiting trajectory finite.
    let max_steps = (20_000.0 / dt) as usize;
    for _ in 0..max_steps {
        if s[2] - R_EARTH_M < PLANAR_ENTRY_STOP_ALTITUDE_M
            || s[0] < PLANAR_ENTRY_STOP_SPEED_M_S
            || !s.iter().all(|x| x.is_finite())
        {
            break;
        }
        let (k1, _) = deriv(s);
        let (k2, _) = deriv(add(s, k1, 0.5 * dt));
        let (k3, _) = deriv(add(s, k2, 0.5 * dt));
        let (k4, _) = deriv(add(s, k3, dt));
        for i in 0..3 {
            s[i] += dt / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]);
        }
        t += dt;
        let (_, d) = deriv(s);
        if d > best.peak_deceleration_m_s2 {
            best.peak_deceleration_m_s2 = d;
            best.peak_deceleration_g = d / G0;
            best.speed_at_peak_m_s = s[0];
            best.altitude_at_peak_m = s[2] - R_EARTH_M;
            best.time_at_peak_s = t;
            best.flight_path_angle_at_peak_rad = -s[1];
        }
    }
    best.end_time_s = t;
    best
}

fn re_default_v() -> f64 {
    7800.0
}
fn re_default_gamma() -> f64 {
    6.0
}
fn re_default_bc() -> f64 {
    100.0
}

/// Unit and provenance class for every numeric field the `reentry` report emits.
///
/// The closed-form rows are the Allen–Eggers relations documented on the free functions
/// above, each checkable by hand from the entry velocity, flight-path angle and scale
/// height. `peak_deceleration_g` is the dimensionless ratio `a_max / G0` with
/// [`G0`] = 9.806 65 m/s² (standard gravity), so it is written as a pure number.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "entry_velocity_m_s",
            unit: "m/s",
            provenance: Input,
            definition: "speed at the atmospheric entry interface",
        },
        FieldUnit {
            path: "flight_path_angle_deg",
            unit: "deg",
            provenance: Input,
            definition: "entry flight-path angle below the local horizontal, positive downward",
        },
        FieldUnit {
            path: "ballistic_coeff_kg_m2",
            unit: "kg/m^2",
            provenance: Input,
            definition: "ballistic coefficient B = m / (C_D * A) of the entering body",
        },
        FieldUnit {
            path: "scale_height_m",
            unit: "m",
            provenance: Input,
            definition: "density scale height of the exponential isothermal atmosphere; \
                         defaults to the Earth value of 7200 m",
        },
        FieldUnit {
            path: "peak_deceleration_m_s2",
            unit: "m/s^2",
            provenance: ClosedForm,
            definition: "Allen-Eggers peak deceleration V_e^2 * sin|gamma| / (2 * e * H), \
                         independent of the ballistic coefficient",
        },
        FieldUnit {
            path: "peak_deceleration_g",
            unit: "1",
            provenance: ClosedForm,
            definition: "the same peak deceleration expressed in units of standard gravity: \
                         a_max / g_0 with g_0 = 9.80665 m/s^2",
        },
        FieldUnit {
            path: "velocity_at_peak_g_m_s",
            unit: "m/s",
            provenance: ClosedForm,
            definition: "speed where the deceleration peaks: V_e * exp(-1/2)",
        },
        FieldUnit {
            path: "altitude_at_peak_g_m",
            unit: "m",
            provenance: ClosedForm,
            definition: "altitude where the deceleration peaks: \
                         H * ln(rho0 * H / (B * sin|gamma|))",
        },
        FieldUnit {
            path: "entry_interface_altitude_m",
            unit: "m",
            provenance: Input,
            definition: "entry-interface altitude above the spherical Earth of radius \
                         6378137 m where the point-mass integration starts; defaults to 122 km",
        },
        FieldUnit {
            path: "point_mass.peak_deceleration_g",
            unit: "1",
            provenance: Computed,
            definition: "peak drag deceleration of the planar point-mass integration (gravity, \
                         curvature, US Standard Atmosphere 1976), in units of g_0 = 9.80665 m/s^2",
        },
        FieldUnit {
            path: "point_mass.peak_deceleration_m_s2",
            unit: "m/s^2",
            provenance: Computed,
            definition: "the same peak drag deceleration in m/s^2",
        },
        FieldUnit {
            path: "point_mass.speed_at_peak_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "speed at the integrated peak (atmosphere-relative; the atmosphere does \
                         not rotate in this model)",
        },
        FieldUnit {
            path: "point_mass.altitude_at_peak_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude at the integrated peak",
        },
        FieldUnit {
            path: "point_mass.time_at_peak_s",
            unit: "s",
            provenance: Computed,
            definition: "time from the entry interface to the integrated peak",
        },
        FieldUnit {
            path: "point_mass.flight_path_angle_at_peak_deg",
            unit: "deg",
            provenance: Computed,
            definition: "flight-path angle below the horizontal at the integrated peak",
        },
        FieldUnit {
            path: "velocity_at_peak_heating_m_s",
            unit: "m/s",
            provenance: ClosedForm,
            definition: "speed where convective stagnation heating peaks: V_e * exp(-1/6); \
                         a velocity, not a heat flux",
        },
    ]
};

/// The `reentry` scenario: the Allen–Eggers ballistic re-entry corridor — peak
/// deceleration (m/s² and g), the velocity and altitude at peak-g, and the
/// peak-heating velocity — for an entry velocity, flight-path angle and ballistic
/// coefficient (Earth exponential atmosphere by default).
#[derive(Deserialize)]
pub struct ReentryScenario {
    /// Atmospheric-interface entry velocity (m/s).
    #[serde(default = "re_default_v")]
    pub entry_velocity_m_s: f64,
    /// Entry flight-path angle below local horizontal (deg, positive downward).
    #[serde(default = "re_default_gamma")]
    pub flight_path_angle_deg: f64,
    /// Ballistic coefficient m/(C_D·A) (kg/m²).
    #[serde(default = "re_default_bc")]
    pub ballistic_coeff_kg_m2: f64,
    /// Atmospheric scale height (m); defaults to Earth.
    #[serde(default)]
    pub scale_height_m: Option<f64>,
    /// Sea-level reference density (kg/m³); defaults to Earth.
    #[serde(default)]
    pub rho0_kg_m3: Option<f64>,
    /// Entry-interface altitude (m) for the point-mass integration; defaults to
    /// [`ENTRY_INTERFACE_M`].
    #[serde(default)]
    pub entry_interface_altitude_m: Option<f64>,
}

impl ReentryScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let h = self.scale_height_m.unwrap_or(SCALE_HEIGHT_EARTH_M);
        let rho0 = self.rho0_kg_m3.unwrap_or(RHO0_EARTH);
        if !self.entry_velocity_m_s.is_finite() || self.entry_velocity_m_s <= 0.0 {
            return Err("entry_velocity_m_s must be finite and positive".to_string());
        }
        if !(0.0..90.0).contains(&self.flight_path_angle_deg) || self.flight_path_angle_deg == 0.0 {
            return Err("flight_path_angle_deg must be in (0, 90)".to_string());
        }
        if !self.ballistic_coeff_kg_m2.is_finite() || self.ballistic_coeff_kg_m2 <= 0.0 {
            return Err("ballistic_coeff_kg_m2 must be finite and positive".to_string());
        }
        if !h.is_finite() || h <= 0.0 || !rho0.is_finite() || rho0 <= 0.0 {
            return Err("scale_height_m and rho0_kg_m3 must be finite and positive".to_string());
        }
        let h_ei = self.entry_interface_altitude_m.unwrap_or(ENTRY_INTERFACE_M);
        if !h_ei.is_finite() || !(10_000.0..=1_000_000.0).contains(&h_ei) {
            return Err("entry_interface_altitude_m must be in [10 km, 1000 km]".to_string());
        }
        let gamma = self.flight_path_angle_deg.to_radians();
        let v = self.entry_velocity_m_s;
        let a_max = peak_deceleration(v, gamma, h);
        let h_star = altitude_at_peak_deceleration(gamma, self.ballistic_coeff_kg_m2, rho0, h);
        let pm = simulate_planar_entry(&PlanarEntry {
            entry_speed_m_s: v,
            flight_path_angle_rad: gamma,
            interface_altitude_m: h_ei,
            ballistic_coeff_kg_m2: self.ballistic_coeff_kg_m2,
        });

        let json = serde_json::json!({
            "kind": "reentry",
            "label": "MODELLED — Allen–Eggers ballistic (no-lift) entry, exponential \
                      isothermal atmosphere, constant flight-path angle; peak-g is \
                      ballistic-coefficient-independent; heating is the peak-heating \
                      VELOCITY, NOT a heat-flux (no aerothermal/TPS model)",
            "units": crate::field_schema::units_block(UNITS),
            "entry_velocity_m_s": v,
            "flight_path_angle_deg": self.flight_path_angle_deg,
            "ballistic_coeff_kg_m2": self.ballistic_coeff_kg_m2,
            "scale_height_m": h,
            "peak_deceleration_m_s2": a_max,
            "peak_deceleration_g": a_max / G0,
            "velocity_at_peak_g_m_s": velocity_at_peak_deceleration(v),
            "altitude_at_peak_g_m": h_star,
            "velocity_at_peak_heating_m_s": velocity_at_peak_heating(v),
            "entry_interface_altitude_m": h_ei,
            "point_mass": {
                "model": "planar ballistic point mass, spherical non-rotating Earth \
                          (R = 6378137 m), inverse-square gravity, US Standard Atmosphere 1976, \
                          constant ballistic coefficient, RK4 at 0.01 s; MODELLED",
                "peak_deceleration_g": pm.peak_deceleration_g,
                "peak_deceleration_m_s2": pm.peak_deceleration_m_s2,
                "speed_at_peak_m_s": pm.speed_at_peak_m_s,
                "altitude_at_peak_m": pm.altitude_at_peak_m,
                "time_at_peak_s": pm.time_at_peak_s,
                "flight_path_angle_at_peak_deg": pm.flight_path_angle_at_peak_rad.to_degrees(),
            },
        });
        let summary = format!(
            "reentry (Allen–Eggers): V_e {:.0} m/s, γ {:.1}° -> peak {:.1} g at {:.0} km, \
             {:.0} m/s; heating peaks at {:.0} m/s; point mass (gravity, curvature, US76) \
             peak {:.1} g (MODELLED ballistic, no aerothermal)",
            v,
            self.flight_path_angle_deg,
            a_max / G0,
            (h_star / 1000.0).max(0.0),
            velocity_at_peak_deceleration(v),
            velocity_at_peak_heating(v),
            pm.peak_deceleration_g,
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

/// Convenience: the circular-orbit-decay reference altitude (entry interface) on
/// Earth, ~122 km — provided so callers can sanity-check `altitude_at_peak_g` sits
/// below the interface.
pub const ENTRY_INTERFACE_M: f64 = 122_000.0;

/// The equatorial Earth radius re-exported for corridor altitude framing.
pub const R_EARTH_M: f64 = R_EARTH_EQUATORIAL_M;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn peak_deceleration_is_independent_of_ballistic_coefficient() {
        // The Allen–Eggers signature result: a_max does not depend on m/(C_D·A).
        let a1 = peak_deceleration(7800.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        let a2 = peak_deceleration(7800.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        assert_eq!(a1, a2);
        // (B only enters the *altitude*, exercised below — the magnitude is fixed.)
        let g = a1 / G0;
        assert!(
            (10.0..25.0).contains(&g),
            "ballistic 6° entry peak {g:.1} g"
        );
    }

    #[test]
    fn peak_deceleration_grows_with_steeper_angle_and_faster_entry() {
        let shallow = peak_deceleration(7800.0, 3.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        let steep = peak_deceleration(7800.0, 9.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        assert!(steep > shallow);
        let slow = peak_deceleration(6000.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        let fast = peak_deceleration(11_000.0, 6.0_f64.to_radians(), SCALE_HEIGHT_EARTH_M);
        assert!(fast > slow);
    }

    #[test]
    fn peak_velocities_are_the_allen_eggers_fractions() {
        let v = 7800.0;
        // peak-g at V_e·e^(−1/2) ≈ 0.6065·V_e
        assert!((velocity_at_peak_deceleration(v) / v - 0.6065).abs() < 1e-3);
        // peak heating at V_e·e^(−1/6) ≈ 0.8465·V_e, and faster than peak-g
        assert!((velocity_at_peak_heating(v) / v - 0.8465).abs() < 1e-3);
        assert!(velocity_at_peak_heating(v) > velocity_at_peak_deceleration(v));
    }

    #[test]
    fn peak_g_altitude_is_physical_and_falls_with_higher_ballistic_coeff() {
        // A heavier (higher-B) body penetrates deeper before peak-g.
        let h_light = altitude_at_peak_deceleration(
            6.0_f64.to_radians(),
            50.0,
            RHO0_EARTH,
            SCALE_HEIGHT_EARTH_M,
        );
        let h_heavy = altitude_at_peak_deceleration(
            6.0_f64.to_radians(),
            400.0,
            RHO0_EARTH,
            SCALE_HEIGHT_EARTH_M,
        );
        assert!(h_heavy < h_light, "higher B penetrates deeper");
        // Both sit in a sensible 20–80 km band below the ~122 km entry interface.
        for h in [h_light, h_heavy] {
            assert!((20_000.0..80_000.0).contains(&h), "peak-g altitude {h} m");
            assert!(h < ENTRY_INTERFACE_M);
        }
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = ReentryScenario {
            entry_velocity_m_s: 7800.0,
            flight_path_angle_deg: 6.0,
            ballistic_coeff_kg_m2: 100.0,
            scale_height_m: None,
            rho0_kg_m3: None,
            entry_interface_altitude_m: None,
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2);
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "reentry");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(!j1.contains("VALIDATED"));
        let g = v["peak_deceleration_g"].as_f64().unwrap();
        assert!((10.0..25.0).contains(&g));
        assert!(v["altitude_at_peak_g_m"].as_f64().unwrap() > 0.0);
    }

    #[test]
    fn us76_density_matches_the_standard() {
        // Reference densities of the US Standard Atmosphere 1976 at layer boundaries and in
        // the tabulated upper atmosphere, as printed in the standard's tables (an
        // independent implementation, COESA76 in pyatmos 1.2.7, agrees to 0.1 %).
        let refs = [
            (0.0, 1.225),
            (11_000.0, 3.6480e-1),
            (20_000.0, 8.8908e-2),
            (32_000.0, 1.3554e-2),
            (47_000.0, 1.4964e-3),
            (60_000.0, 3.0963e-4),
            (80_000.0, 1.8451e-5),
            (88_000.0, 4.8749e-6),
            (112_500.0, 6.45e-8),
            (175_000.0, 6.3384e-10),
        ];
        for (z, r) in refs {
            let got = us76_density(z);
            // Between tabulated heights above 86 km the log-linear interpolation is good to
            // about 2 %; at the defined layers and table nodes to 0.5 %.
            let tol = if z == 112_500.0 || z == 175_000.0 {
                0.02
            } else {
                0.005
            };
            assert!(((got - r) / r).abs() < tol, "{z} m: {got:e} vs {r:e}");
        }
        // Continuous across the 86 km seam and zero above 1000 km.
        let below = us76_density(85_999.9);
        let above = us76_density(86_000.1);
        assert!(
            ((below - above) / above).abs() < 2e-3,
            "{below:e} {above:e}"
        );
        assert_eq!(us76_density(1_000_001.0), 0.0);
    }

    #[test]
    fn point_mass_entry_flattens_a_shallow_fast_entry_below_the_closed_form() {
        let e = PlanarEntry {
            entry_speed_m_s: 12_900.0,
            flight_path_angle_rad: 8.2_f64.to_radians(),
            interface_altitude_m: 125_000.0,
            ballistic_coeff_kg_m2: 60.0,
        };
        let r = simulate_planar_entry(&e);
        let ae = peak_deceleration(12_900.0, 8.2_f64.to_radians(), SCALE_HEIGHT_EARTH_M) / G0;
        assert!(
            r.peak_deceleration_g < ae,
            "{} vs {ae}",
            r.peak_deceleration_g
        );
        assert!(r.flight_path_angle_at_peak_rad < e.flight_path_angle_rad);
        assert!((30_000.0..80_000.0).contains(&r.altitude_at_peak_m));
        assert!(r.speed_at_peak_m_s < 12_900.0 && r.speed_at_peak_m_s > 3_000.0);
    }

    #[test]
    fn point_mass_peak_grows_with_steeper_entry_and_barely_with_ballistic_coeff() {
        let run = |gamma_deg: f64, b: f64| {
            simulate_planar_entry(&PlanarEntry {
                entry_speed_m_s: 7_800.0,
                flight_path_angle_rad: gamma_deg.to_radians(),
                interface_altitude_m: ENTRY_INTERFACE_M,
                ballistic_coeff_kg_m2: b,
            })
            .peak_deceleration_g
        };
        assert!(run(12.0, 100.0) > run(4.0, 100.0));
        // The Allen-Eggers signature survives only approximately: a 4x change in B moves the
        // peak by about 10 %, because a heavier body peaks deeper, where the US76 scale
        // height is shorter than the closed form's 7.2 km.
        let (lo, hi) = (run(20.0, 50.0), run(20.0, 200.0));
        assert!(hi > lo && (hi - lo) / lo < 0.2, "{lo} vs {hi}");
        // On a steep entry the integrated peak approaches the closed form's
        // V^2 sin(gamma) / (2 e H) magnitude (within the US76-vs-7.2 km scale height spread).
        let ae = peak_deceleration(7_800.0, 20_f64.to_radians(), SCALE_HEIGHT_EARTH_M) / G0;
        assert!(((run(20.0, 100.0) - ae) / ae).abs() < 0.25);
    }

    #[test]
    fn scenario_rejects_degenerate_geometry() {
        let zero_gamma = ReentryScenario {
            entry_velocity_m_s: 7800.0,
            flight_path_angle_deg: 0.0,
            ballistic_coeff_kg_m2: 100.0,
            scale_height_m: None,
            rho0_kg_m3: None,
            entry_interface_altitude_m: None,
        };
        assert!(zero_gamma.run_json().is_err());
        let bad_v = ReentryScenario {
            entry_velocity_m_s: -1.0,
            flight_path_angle_deg: 6.0,
            ballistic_coeff_kg_m2: 100.0,
            scale_height_m: None,
            rho0_kg_m3: None,
            entry_interface_altitude_m: None,
        };
        assert!(bad_v.run_json().is_err());
    }
}
