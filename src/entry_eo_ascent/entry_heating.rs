// SPDX-License-Identifier: AGPL-3.0-only
//! 3-DoF point-mass atmospheric entry with stagnation-point convective heating —
//! the `entry-heating` scenario kind.
//!
//! State (planet-fixed, rotating frame): radius `r`, longitude `θ`, latitude `φ`,
//! planet-relative speed `V`, flight-path angle `γ` (positive up) and heading `ψ`
//! (clockwise from north). With drag and lift accelerations `D = ρV²/(2B)`,
//! `L = (L/D)·D`, bank angle `σ`, gravity `g = μ/r²` and spin rate `ω`, the
//! standard rotating-spherical-planet point-mass equations are
//!
//! ```text
//! r' = V sinγ
//! θ' = V cosγ sinψ / (r cosφ)
//! φ' = V cosγ cosψ / r
//! V' = −D − g sinγ + ω² r cosφ (sinγ cosφ − cosγ sinφ cosψ)
//! Vγ' = L cosσ + (V² − g r) cosγ / r + 2ωV cosφ sinψ
//!       + ω² r cosφ (cosγ cosφ + sinγ cosψ sinφ)
//! Vψ' = L sinσ / cosγ + V² cosγ sinψ tanφ / r − 2ωV (tanγ cosψ cosφ − sinφ)
//!       + ω² r sinψ sinφ cosφ / cosγ
//! ```
//!
//! integrated with fixed-step fourth-order Runge–Kutta. The stagnation-point
//! convective heat flux is `q = k·√(ρ/R_n)·V³` (NASA TR R-376 (1971), with
//! `k = 1.7415e-4 kg^0.5/m` for Earth air and `1.9027e-4 kg^0.5/m` for the Mars
//! CO₂–N₂ mixture), integrated over time into the heat load.
//!
//! Two internal checks ride along: the rotating-frame specific energy
//! `E = V²/2 − μ/r − ω²r²cos²φ/2` must fall by exactly the drag work `∫D·V dt` (lift
//! and Coriolis do no work), and the integrated peak deceleration is reported beside
//! the ballistic closed form of NACA Report 1381 (1958) ([`crate::reentry`]).
//!
//! HONEST SCOPE (MODELLED): point mass (no attitude dynamics — 6-DoF is out of
//! scope), spherical planet with a central inverse-square field (no J2, no
//! oblateness), co-rotating atmosphere with no winds, constant `C_D`, `L/D` and bank
//! (no guidance), convective stagnation-point heating only (no radiative heating,
//! no wall-temperature / catalycity correction, no TPS response).

use crate::forces::EARTH_ROTATION_RATE;
use crate::mars_atmos::{mars_density, MARS_RE, MARS_ROTATION_RATE};
use crate::orbit::{MU_EARTH, R_EARTH_EQUATORIAL_M};
use crate::reentry::{altitude_at_peak_deceleration, peak_deceleration, us76_density, G0};
use serde::Deserialize;

/// Stagnation-point heating constant for Earth air (kg^0.5/m), NASA TR R-376 (1971).
pub const K_HEAT_EARTH: f64 = 1.7415e-4;
/// Stagnation-point heating constant for the Mars atmosphere (kg^0.5/m), NASA TR R-376 (1971).
pub const K_HEAT_MARS: f64 = 1.9027e-4;
/// Mars gravitational parameter (m³/s²), matching [`crate::body::Body::mars`].
pub const MU_MARS: f64 = 4.282_837e13;

/// Stagnation-point convective heat flux (W/m²): `k·√(ρ/R_n)·V³`.
pub fn stagnation_heat_flux(k: f64, rho_kg_m3: f64, nose_radius_m: f64, speed_m_s: f64) -> f64 {
    k * (rho_kg_m3.max(0.0) / nose_radius_m).sqrt() * speed_m_s.powi(3)
}

/// Which atmosphere density model the entry uses.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Atmosphere {
    /// US Standard Atmosphere 1976 ([`us76_density`]).
    Us76,
    /// `ρ0·exp(−h/H)`.
    Exponential { rho0: f64, scale_height_m: f64 },
    /// The Mars piecewise-exponential model ([`mars_density`]).
    Mars,
}

impl Atmosphere {
    /// Density (kg/m³) at geometric altitude `h` (m).
    pub fn density(&self, h: f64) -> f64 {
        match *self {
            Atmosphere::Us76 => us76_density(h),
            Atmosphere::Exponential {
                rho0,
                scale_height_m,
            } => rho0 * (-h / scale_height_m).exp(),
            Atmosphere::Mars => mars_density(h),
        }
    }
}

/// Planet constants for the entry integration.
#[derive(Clone, Copy, Debug)]
pub struct Planet {
    pub mu_m3_s2: f64,
    pub radius_m: f64,
    pub spin_rad_s: f64,
    pub heat_k: f64,
}

/// Entry-interface state (planet-relative) and vehicle.
#[derive(Clone, Copy, Debug)]
pub struct EntryCase {
    pub planet: Planet,
    pub atmosphere: Atmosphere,
    pub interface_altitude_m: f64,
    pub latitude_rad: f64,
    pub longitude_rad: f64,
    /// Planet-relative speed (m/s).
    pub speed_m_s: f64,
    /// Planet-relative flight-path angle (rad, positive up; negative for entry).
    pub gamma_rad: f64,
    /// Planet-relative heading (rad, clockwise from north).
    pub heading_rad: f64,
    pub ballistic_coeff_kg_m2: f64,
    pub lift_to_drag: f64,
    pub bank_rad: f64,
    pub nose_radius_m: f64,
    pub step_s: f64,
    pub terminal_altitude_m: f64,
    pub max_time_s: f64,
}

/// One instant of a peak (time, altitude, speed).
#[derive(Clone, Copy, Debug, Default)]
pub struct PeakAt {
    pub value: f64,
    pub time_s: f64,
    pub altitude_m: f64,
    pub speed_m_s: f64,
}

/// What the integration found.
#[derive(Clone, Debug)]
pub struct EntryResult {
    pub peak_deceleration_m_s2: PeakAt,
    pub peak_heat_flux_w_m2: PeakAt,
    pub peak_dynamic_pressure_pa: PeakAt,
    pub heat_load_j_m2: f64,
    pub end_time_s: f64,
    pub end_altitude_m: f64,
    pub end_speed_m_s: f64,
    pub end_gamma_rad: f64,
    pub end_latitude_rad: f64,
    pub end_longitude_rad: f64,
    pub downrange_m: f64,
    /// `(E_end − E_0 + W_drag) / (V_0²/2)` — zero up to integration error.
    pub energy_residual: f64,
    /// `"terminal-altitude"`, `"skip-out"` or `"time-limit"`.
    pub outcome: &'static str,
}

/// Convert an inertial speed / flight-path angle / heading at latitude `lat` and radius
/// `r` to the planet-relative triple by removing the surface rotation velocity `ω·r·cosφ`
/// (due east).
pub fn inertial_to_relative(
    v: f64,
    gamma: f64,
    heading: f64,
    lat: f64,
    r: f64,
    omega: f64,
) -> (f64, f64, f64) {
    let east = v * gamma.cos() * heading.sin() - omega * r * lat.cos();
    let north = v * gamma.cos() * heading.cos();
    let up = v * gamma.sin();
    let vr = (east * east + north * north + up * up).sqrt();
    (vr, (up / vr).asin(), east.atan2(north))
}

/// Integrate one 3-DoF entry. State: `[r, θ, φ, V, γ, ψ, heat load, drag work]`.
pub fn simulate_entry(c: &EntryCase) -> EntryResult {
    let p = c.planet;
    let b = c.ballistic_coeff_kg_m2;
    let w = p.spin_rad_s;
    let aux = |s: &[f64; 8]| -> (f64, f64, f64, f64) {
        let rho = c.atmosphere.density(s[0] - p.radius_m);
        let v = s[3];
        let d = rho * v * v / (2.0 * b);
        let q = stagnation_heat_flux(p.heat_k, rho, c.nose_radius_m, v);
        (rho, d, q, 0.5 * rho * v * v)
    };
    let f = |s: &[f64; 8]| -> [f64; 8] {
        let (r, _th, phi, v, gam, psi) = (s[0], s[1], s[2], s[3], s[4], s[5]);
        let (_rho, d, q, _qd) = aux(s);
        let l = c.lift_to_drag * d;
        let g = p.mu_m3_s2 / (r * r);
        let (sg, cg) = gam.sin_cos();
        let cg = if cg.abs() < 1e-9 { 1e-9 } else { cg };
        let (sp, cp) = psi.sin_cos();
        let (sf, cf) = phi.sin_cos();
        let v_safe = v.max(1e-3);
        let (ss, cs) = c.bank_rad.sin_cos();
        [
            v * sg,
            v * cg * sp / (r * cf),
            v * cg * cp / r,
            -d - g * sg + w * w * r * cf * (sg * cf - cg * sf * cp),
            (l * cs
                + (v * v - g * r) * cg / r
                + 2.0 * w * v * cf * sp
                + w * w * r * cf * (cg * cf + sg * cp * sf))
                / v_safe,
            (l * ss / cg + v * v * cg * sp * sf / cf / r
                - 2.0 * w * v * (sg / cg * cp * cf - sf)
                + w * w * r * sp * sf * cf / cg)
                / v_safe,
            q,
            d * v,
        ]
    };
    let energy = |s: &[f64; 8]| {
        0.5 * s[3] * s[3]
            - p.mu_m3_s2 / s[0]
            - 0.5 * w * w * s[0] * s[0] * s[2].cos() * s[2].cos()
    };
    let mut s = [
        p.radius_m + c.interface_altitude_m,
        c.longitude_rad,
        c.latitude_rad,
        c.speed_m_s,
        c.gamma_rad,
        c.heading_rad,
        0.0,
        0.0,
    ];
    let e0 = energy(&s);
    let mut t = 0.0;
    let mk = |val: f64, t: f64, s: &[f64; 8]| PeakAt {
        value: val,
        time_s: t,
        altitude_m: s[0] - p.radius_m,
        speed_m_s: s[3],
    };
    let (_, d0, q0, qd0) = aux(&s);
    let mut pk_d = mk(d0, 0.0, &s);
    let mut pk_q = mk(q0, 0.0, &s);
    let mut pk_qd = mk(qd0, 0.0, &s);
    let mut outcome = "time-limit";
    let n_max = (c.max_time_s / c.step_s).ceil() as usize;
    for _ in 0..n_max {
        s = super::rk4_step(&s, c.step_s, &f);
        t += c.step_s;
        if !s.iter().all(|x| x.is_finite()) {
            outcome = "non-finite-state";
            break;
        }
        let (_, d, q, qd) = aux(&s);
        if d > pk_d.value {
            pk_d = mk(d, t, &s);
        }
        if q > pk_q.value {
            pk_q = mk(q, t, &s);
        }
        if qd > pk_qd.value {
            pk_qd = mk(qd, t, &s);
        }
        let h = s[0] - p.radius_m;
        if h <= c.terminal_altitude_m {
            outcome = "terminal-altitude";
            break;
        }
        if h > c.interface_altitude_m + 1000.0 && s[4] > 0.0 {
            outcome = "skip-out";
            break;
        }
    }
    // Great-circle downrange from the interface point.
    let (la0, lo0, la1, lo1) = (c.latitude_rad, c.longitude_rad, s[2], s[1]);
    let cosc = (la0.sin() * la1.sin() + la0.cos() * la1.cos() * (lo1 - lo0).cos()).clamp(-1.0, 1.0);
    EntryResult {
        peak_deceleration_m_s2: pk_d,
        peak_heat_flux_w_m2: pk_q,
        peak_dynamic_pressure_pa: pk_qd,
        heat_load_j_m2: s[6],
        end_time_s: t,
        end_altitude_m: s[0] - p.radius_m,
        end_speed_m_s: s[3],
        end_gamma_rad: s[4],
        end_latitude_rad: s[2],
        end_longitude_rad: s[1],
        downrange_m: p.radius_m * cosc.acos(),
        energy_residual: (energy(&s) - e0 + s[7]) / (0.5 * c.speed_m_s * c.speed_m_s),
        outcome,
    }
}

fn d_body() -> String {
    "earth".into()
}
fn d_frame() -> String {
    "inertial".into()
}
fn d_ei() -> f64 {
    125_000.0
}
fn d_v() -> f64 {
    12_900.0
}
fn d_fpa() -> f64 {
    8.2
}
fn d_heading() -> f64 {
    90.0
}
fn d_mass() -> f64 {
    46.0
}
fn d_cd() -> f64 {
    1.4828
}
fn d_area() -> f64 {
    std::f64::consts::PI * 0.8128 * 0.8128 / 4.0
}
fn d_rn() -> f64 {
    0.2202
}
fn d_true() -> bool {
    true
}
fn d_step() -> f64 {
    0.05
}
fn d_term() -> f64 {
    10_000.0
}
fn d_tmax() -> f64 {
    3_000.0
}

/// Unit and provenance class for every numeric field the `entry-heating` report emits.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "inputs.entry_interface_altitude_m",
            unit: "m",
            provenance: Input,
            definition: "entry-interface altitude above the spherical planet where the integration starts",
        },
        FieldUnit {
            path: "inputs.entry_speed_m_s",
            unit: "m/s",
            provenance: Input,
            definition: "entry-interface speed as supplied, in the frame named by velocity_frame",
        },
        FieldUnit {
            path: "inputs.flight_path_angle_deg",
            unit: "deg",
            provenance: Input,
            definition: "entry flight-path angle below the local horizontal as supplied, positive downward",
        },
        FieldUnit {
            path: "inputs.heading_deg",
            unit: "deg",
            provenance: Input,
            definition: "entry heading as supplied, clockwise from north",
        },
        FieldUnit {
            path: "inputs.latitude_deg",
            unit: "deg",
            provenance: Input,
            definition: "geocentric latitude of the entry-interface point",
        },
        FieldUnit {
            path: "inputs.longitude_deg",
            unit: "deg",
            provenance: Input,
            definition: "planet-fixed longitude of the entry-interface point",
        },
        FieldUnit {
            path: "inputs.mass_kg",
            unit: "kg",
            provenance: Input,
            definition: "vehicle mass, constant over the entry (no ablation mass loss)",
        },
        FieldUnit {
            path: "inputs.drag_coefficient",
            unit: "1",
            provenance: Input,
            definition: "constant drag coefficient C_D referenced to reference_area_m2",
        },
        FieldUnit {
            path: "inputs.reference_area_m2",
            unit: "m^2",
            provenance: Input,
            definition: "aerodynamic reference area A",
        },
        FieldUnit {
            path: "inputs.nose_radius_m",
            unit: "m",
            provenance: Input,
            definition: "effective stagnation-point nose radius R_n used in the heating relation",
        },
        FieldUnit {
            path: "inputs.lift_to_drag",
            unit: "1",
            provenance: Input,
            definition: "constant lift-to-drag ratio L/D (0 = ballistic)",
        },
        FieldUnit {
            path: "inputs.bank_angle_deg",
            unit: "deg",
            provenance: Input,
            definition: "constant bank angle sigma of the lift vector about the velocity vector",
        },
        FieldUnit {
            path: "inputs.step_s",
            unit: "s",
            provenance: Input,
            definition: "fixed RK4 integration step",
        },
        FieldUnit {
            path: "inputs.terminal_altitude_m",
            unit: "m",
            provenance: Input,
            definition: "the integration stops when the altitude falls to this value",
        },
        FieldUnit {
            path: "ballistic_coefficient_kg_m2",
            unit: "kg/m^2",
            provenance: Computed,
            definition: "ballistic coefficient B = m / (C_D * A)",
        },
        FieldUnit {
            path: "heating_constant_kg05_m",
            unit: "kg^0.5/m",
            provenance: Constant,
            definition: "stagnation-point heating constant k of NASA TR R-376 (1971): 1.7415e-4 for Earth, 1.9027e-4 for Mars",
        },
        FieldUnit {
            path: "relative_entry.speed_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "planet-relative entry speed after removing the surface rotation velocity (equal to the input when velocity_frame = relative or the planet does not rotate)",
        },
        FieldUnit {
            path: "relative_entry.flight_path_angle_deg",
            unit: "deg",
            provenance: Computed,
            definition: "planet-relative entry flight-path angle below the horizontal, positive downward",
        },
        FieldUnit {
            path: "relative_entry.heading_deg",
            unit: "deg",
            provenance: Computed,
            definition: "planet-relative entry heading, clockwise from north",
        },
        FieldUnit {
            path: "peak_deceleration.g",
            unit: "1",
            provenance: Computed,
            definition: "peak sensed aerodynamic (drag plus lift) deceleration in units of g_0 = 9.80665 m/s^2",
        },
        FieldUnit {
            path: "peak_deceleration.m_s2",
            unit: "m/s^2",
            provenance: Computed,
            definition: "peak drag deceleration D = rho V^2 / (2 B)",
        },
        FieldUnit {
            path: "peak_deceleration.time_s",
            unit: "s",
            provenance: Computed,
            definition: "time from the entry interface to the deceleration peak",
        },
        FieldUnit {
            path: "peak_deceleration.altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude at the deceleration peak",
        },
        FieldUnit {
            path: "peak_deceleration.speed_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "planet-relative speed at the deceleration peak",
        },
        FieldUnit {
            path: "peak_heat_flux.w_m2",
            unit: "W/m^2",
            provenance: Computed,
            definition: "peak stagnation-point convective heat flux k sqrt(rho / R_n) V^3 (cold wall, no radiative term)",
        },
        FieldUnit {
            path: "peak_heat_flux.w_cm2",
            unit: "W/cm^2",
            provenance: Computed,
            definition: "the same peak heat flux in W/cm^2",
        },
        FieldUnit {
            path: "peak_heat_flux.time_s",
            unit: "s",
            provenance: Computed,
            definition: "time from the entry interface to the heat-flux peak",
        },
        FieldUnit {
            path: "peak_heat_flux.altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude at the heat-flux peak",
        },
        FieldUnit {
            path: "peak_heat_flux.speed_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "planet-relative speed at the heat-flux peak",
        },
        FieldUnit {
            path: "heat_load_j_m2",
            unit: "J/m^2",
            provenance: Computed,
            definition: "integrated stagnation-point heat load, the time integral of the heat flux to the end of the run",
        },
        FieldUnit {
            path: "heat_load_j_cm2",
            unit: "J/cm^2",
            provenance: Computed,
            definition: "the same heat load in J/cm^2",
        },
        FieldUnit {
            path: "peak_dynamic_pressure.pa",
            unit: "Pa",
            provenance: Computed,
            definition: "peak dynamic pressure rho V^2 / 2",
        },
        FieldUnit {
            path: "peak_dynamic_pressure.time_s",
            unit: "s",
            provenance: Computed,
            definition: "time from the entry interface to the dynamic-pressure peak",
        },
        FieldUnit {
            path: "peak_dynamic_pressure.altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude at the dynamic-pressure peak",
        },
        FieldUnit {
            path: "peak_dynamic_pressure.speed_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "planet-relative speed at the dynamic-pressure peak",
        },
        FieldUnit {
            path: "terminal.time_s",
            unit: "s",
            provenance: Computed,
            definition: "time from the entry interface to the end of the run",
        },
        FieldUnit {
            path: "terminal.altitude_m",
            unit: "m",
            provenance: Computed,
            definition: "altitude at the end of the run",
        },
        FieldUnit {
            path: "terminal.speed_m_s",
            unit: "m/s",
            provenance: Computed,
            definition: "planet-relative speed at the end of the run",
        },
        FieldUnit {
            path: "terminal.flight_path_angle_deg",
            unit: "deg",
            provenance: Computed,
            definition: "flight-path angle at the end of the run, positive up",
        },
        FieldUnit {
            path: "terminal.latitude_deg",
            unit: "deg",
            provenance: Computed,
            definition: "geocentric latitude at the end of the run",
        },
        FieldUnit {
            path: "terminal.longitude_deg",
            unit: "deg",
            provenance: Computed,
            definition: "planet-fixed longitude at the end of the run",
        },
        FieldUnit {
            path: "terminal.downrange_km",
            unit: "km",
            provenance: Computed,
            definition: "great-circle surface distance from the entry-interface point to the end point",
        },
        FieldUnit {
            path: "closed_form_check.scale_height_m",
            unit: "m",
            provenance: Input,
            definition: "exponential-atmosphere scale height used by the closed form (Earth 7200 m, Mars 11100 m unless the exponential atmosphere is chosen)",
        },
        FieldUnit {
            path: "closed_form_check.rho0_kg_m3",
            unit: "kg/m^3",
            provenance: Input,
            definition: "exponential-atmosphere surface density used by the closed form",
        },
        FieldUnit {
            path: "closed_form_check.peak_deceleration_g",
            unit: "1",
            provenance: ClosedForm,
            definition: "NACA Report 1381 (1958) ballistic peak deceleration V_e^2 sin|gamma| / (2 e H) over g_0, from the planet-relative entry state",
        },
        FieldUnit {
            path: "closed_form_check.altitude_at_peak_m",
            unit: "m",
            provenance: ClosedForm,
            definition: "NACA Report 1381 (1958) altitude of peak deceleration H ln(rho0 H / (B sin|gamma|))",
        },
        FieldUnit {
            path: "closed_form_check.integrated_over_closed_form",
            unit: "1",
            provenance: InternalConsistency,
            definition: "integrated peak deceleration divided by the closed form; near 1 only for a steep, ballistic entry through an exponential atmosphere",
        },
        FieldUnit {
            path: "energy_check.residual",
            unit: "1",
            provenance: InternalConsistency,
            definition: "(E_end - E_0 + integral of D V dt) / (V_0^2 / 2) with E = V^2/2 - mu/r - omega^2 r^2 cos^2(phi)/2; zero up to integration error",
        },
        FieldUnit {
            path: "step_check.half_step_peak_heat_flux_rel_change",
            unit: "1",
            provenance: InternalConsistency,
            definition: "relative change in peak heat flux when the run is repeated at half the step",
        },
        FieldUnit {
            path: "step_check.half_step_peak_deceleration_rel_change",
            unit: "1",
            provenance: InternalConsistency,
            definition: "relative change in peak deceleration when the run is repeated at half the step",
        },
    ]
};

/// The `entry-heating` scenario. Every field is defaulted (a Stardust-like capsule
/// return); `kind = "entry-heating"` alone runs.
#[derive(Deserialize)]
pub struct EntryHeatingScenario {
    /// `"earth"` or `"mars"`.
    #[serde(default = "d_body")]
    pub body: String,
    /// `"us76"` (Earth only), `"exponential"` or `"mars"` (Mars only); defaults to
    /// `"us76"` on Earth and `"mars"` on Mars.
    #[serde(default)]
    pub atmosphere: Option<String>,
    /// Exponential-atmosphere surface density (kg/m³); also the closed-form check's ρ0.
    #[serde(default)]
    pub rho0_kg_m3: Option<f64>,
    /// Exponential-atmosphere scale height (m); also the closed-form check's H.
    #[serde(default)]
    pub scale_height_m: Option<f64>,
    /// Entry-interface altitude (m).
    #[serde(default = "d_ei")]
    pub entry_interface_altitude_m: f64,
    /// `"inertial"` or `"relative"`: the frame the entry speed/angle/heading are given in.
    #[serde(default = "d_frame")]
    pub velocity_frame: String,
    /// Entry speed (m/s).
    #[serde(default = "d_v")]
    pub entry_speed_m_s: f64,
    /// Entry flight-path angle below the horizontal (deg, positive down).
    #[serde(default = "d_fpa")]
    pub flight_path_angle_deg: f64,
    /// Heading (deg clockwise from north).
    #[serde(default = "d_heading")]
    pub heading_deg: f64,
    /// Entry-interface latitude (deg).
    #[serde(default)]
    pub latitude_deg: f64,
    /// Entry-interface longitude (deg).
    #[serde(default)]
    pub longitude_deg: f64,
    /// Vehicle mass (kg).
    #[serde(default = "d_mass")]
    pub mass_kg: f64,
    /// Drag coefficient.
    #[serde(default = "d_cd")]
    pub drag_coefficient: f64,
    /// Reference area (m²).
    #[serde(default = "d_area")]
    pub reference_area_m2: f64,
    /// Nose radius (m).
    #[serde(default = "d_rn")]
    pub nose_radius_m: f64,
    /// Lift-to-drag ratio.
    #[serde(default)]
    pub lift_to_drag: f64,
    /// Bank angle (deg).
    #[serde(default)]
    pub bank_angle_deg: f64,
    /// Whether the planet (and its atmosphere) rotates.
    #[serde(default = "d_true")]
    pub rotating_planet: bool,
    /// RK4 step (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// Stop altitude (m).
    #[serde(default = "d_term")]
    pub terminal_altitude_m: f64,
    /// Time limit (s).
    #[serde(default = "d_tmax")]
    pub max_time_s: f64,
}

impl Default for EntryHeatingScenario {
    fn default() -> Self {
        toml::from_str("").expect("all fields defaulted")
    }
}

fn finite_pos(name: &str, v: f64) -> Result<(), String> {
    if v.is_finite() && v > 0.0 {
        Ok(())
    } else {
        Err(format!("{name} must be finite and positive"))
    }
}

impl EntryHeatingScenario {
    /// Validate and build the integration case (and the closed-form ρ0, H).
    pub fn build(&self) -> Result<(EntryCase, f64, f64), String> {
        let (planet, default_atm, rho0_d, h_d) = match self.body.as_str() {
            "earth" => (
                Planet {
                    mu_m3_s2: MU_EARTH,
                    radius_m: R_EARTH_EQUATORIAL_M,
                    spin_rad_s: EARTH_ROTATION_RATE,
                    heat_k: K_HEAT_EARTH,
                },
                "us76",
                crate::reentry::RHO0_EARTH,
                crate::reentry::SCALE_HEIGHT_EARTH_M,
            ),
            "mars" => (
                Planet {
                    mu_m3_s2: MU_MARS,
                    radius_m: MARS_RE,
                    spin_rad_s: MARS_ROTATION_RATE,
                    heat_k: K_HEAT_MARS,
                },
                "mars",
                0.020,
                11_100.0,
            ),
            other => return Err(format!("body must be \"earth\" or \"mars\", got \"{other}\"")),
        };
        let rho0 = self.rho0_kg_m3.unwrap_or(rho0_d);
        let h = self.scale_height_m.unwrap_or(h_d);
        finite_pos("rho0_kg_m3", rho0)?;
        finite_pos("scale_height_m", h)?;
        let atm_name = self.atmosphere.as_deref().unwrap_or(default_atm);
        let atmosphere = match (atm_name, self.body.as_str()) {
            ("us76", "earth") => Atmosphere::Us76,
            ("mars", "mars") => Atmosphere::Mars,
            ("exponential", _) => Atmosphere::Exponential {
                rho0,
                scale_height_m: h,
            },
            (a, b) => {
                return Err(format!(
                    "atmosphere \"{a}\" is not available for body \"{b}\" \
                     (earth: us76|exponential, mars: mars|exponential)"
                ))
            }
        };
        let mut planet = planet;
        if !self.rotating_planet {
            planet.spin_rad_s = 0.0;
        }
        finite_pos("entry_speed_m_s", self.entry_speed_m_s)?;
        if !(self.flight_path_angle_deg > 0.0 && self.flight_path_angle_deg < 90.0) {
            return Err("flight_path_angle_deg must be in (0, 90) (positive downward)".into());
        }
        if !(self.entry_interface_altitude_m.is_finite()
            && (20_000.0..=1_000_000.0).contains(&self.entry_interface_altitude_m))
        {
            return Err("entry_interface_altitude_m must be in [20 km, 1000 km]".into());
        }
        if !(self.latitude_deg.is_finite() && self.latitude_deg.abs() < 89.0) {
            return Err("latitude_deg must be finite with |latitude| < 89 deg".into());
        }
        if !self.heading_deg.is_finite() || !self.longitude_deg.is_finite() {
            return Err("heading_deg and longitude_deg must be finite".into());
        }
        finite_pos("mass_kg", self.mass_kg)?;
        finite_pos("drag_coefficient", self.drag_coefficient)?;
        finite_pos("reference_area_m2", self.reference_area_m2)?;
        finite_pos("nose_radius_m", self.nose_radius_m)?;
        if !(self.lift_to_drag.is_finite() && (0.0..=3.0).contains(&self.lift_to_drag)) {
            return Err("lift_to_drag must be in [0, 3]".into());
        }
        if !self.bank_angle_deg.is_finite() {
            return Err("bank_angle_deg must be finite".into());
        }
        if !(self.step_s.is_finite() && self.step_s > 0.0 && self.step_s <= 1.0) {
            return Err("step_s must be in (0, 1] s".into());
        }
        if !(self.terminal_altitude_m.is_finite()
            && self.terminal_altitude_m >= 0.0
            && self.terminal_altitude_m < self.entry_interface_altitude_m)
        {
            return Err("terminal_altitude_m must be in [0, entry_interface_altitude_m)".into());
        }
        if !(self.max_time_s.is_finite() && self.max_time_s > 0.0 && self.max_time_s <= 20_000.0) {
            return Err("max_time_s must be in (0, 20000] s".into());
        }
        let lat = self.latitude_deg.to_radians();
        let r0 = planet.radius_m + self.entry_interface_altitude_m;
        let (v, g, psi) = match self.velocity_frame.as_str() {
            "relative" => (
                self.entry_speed_m_s,
                -self.flight_path_angle_deg.to_radians(),
                self.heading_deg.to_radians(),
            ),
            "inertial" => inertial_to_relative(
                self.entry_speed_m_s,
                -self.flight_path_angle_deg.to_radians(),
                self.heading_deg.to_radians(),
                lat,
                r0,
                planet.spin_rad_s,
            ),
            o => return Err(format!("velocity_frame must be inertial|relative, got \"{o}\"")),
        };
        Ok((
            EntryCase {
                planet,
                atmosphere,
                interface_altitude_m: self.entry_interface_altitude_m,
                latitude_rad: lat,
                longitude_rad: self.longitude_deg.to_radians(),
                speed_m_s: v,
                gamma_rad: g,
                heading_rad: psi,
                ballistic_coeff_kg_m2: self.mass_kg
                    / (self.drag_coefficient * self.reference_area_m2),
                lift_to_drag: self.lift_to_drag,
                bank_rad: self.bank_angle_deg.to_radians(),
                nose_radius_m: self.nose_radius_m,
                step_s: self.step_s,
                terminal_altitude_m: self.terminal_altitude_m,
                max_time_s: self.max_time_s,
            },
            rho0,
            h,
        ))
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let (case, rho0, hs) = self.build()?;
        let r = simulate_entry(&case);
        let mut half = case;
        half.step_s = case.step_s / 2.0;
        let rh = simulate_entry(&half);
        let rel = |a: f64, b: f64| if b != 0.0 { (a - b).abs() / b.abs() } else { 0.0 };
        let gam_abs = case.gamma_rad.abs();
        let b = case.ballistic_coeff_kg_m2;
        let cf_g = peak_deceleration(case.speed_m_s, gam_abs, hs) / G0;
        let cf_h = altitude_at_peak_deceleration(gam_abs, b, rho0, hs);
        // Sensed aerodynamic deceleration includes the lift component.
        let aero = (1.0 + case.lift_to_drag * case.lift_to_drag).sqrt();
        let pk_g = r.peak_deceleration_m_s2.value * aero / G0;
        let atm = match case.atmosphere {
            Atmosphere::Us76 => "US Standard Atmosphere 1976",
            Atmosphere::Exponential { .. } => "exponential rho0 exp(-h/H)",
            Atmosphere::Mars => "Mars piecewise-exponential (crate::mars_atmos)",
        };
        let pk = |p: &PeakAt| {
            serde_json::json!({
                "time_s": p.time_s, "altitude_m": p.altitude_m, "speed_m_s": p.speed_m_s,
            })
        };
        let mut pd = pk(&r.peak_deceleration_m_s2);
        pd["g"] = serde_json::json!(pk_g);
        pd["m_s2"] = serde_json::json!(r.peak_deceleration_m_s2.value);
        let mut pq = pk(&r.peak_heat_flux_w_m2);
        pq["w_m2"] = serde_json::json!(r.peak_heat_flux_w_m2.value);
        pq["w_cm2"] = serde_json::json!(r.peak_heat_flux_w_m2.value / 1e4);
        let mut pp = pk(&r.peak_dynamic_pressure_pa);
        pp["pa"] = serde_json::json!(r.peak_dynamic_pressure_pa.value);
        let json = serde_json::json!({
            "kind": "entry-heating",
            "label": "MODELLED — 3-DoF point-mass entry over a rotating spherical planet \
                      (central gravity, no J2), co-rotating windless atmosphere, constant C_D, \
                      L/D and bank, RK4; convective stagnation-point heating per NASA TR R-376 \
                      (1971), cold wall, NO radiative heating, NO TPS/ablation response, NOT 6-DoF",
            "units": crate::field_schema::units_block(UNITS),
            "body": self.body,
            "atmosphere": atm,
            "velocity_frame": self.velocity_frame,
            "outcome": r.outcome,
            "inputs": {
                "entry_interface_altitude_m": self.entry_interface_altitude_m,
                "entry_speed_m_s": self.entry_speed_m_s,
                "flight_path_angle_deg": self.flight_path_angle_deg,
                "heading_deg": self.heading_deg,
                "latitude_deg": self.latitude_deg,
                "longitude_deg": self.longitude_deg,
                "mass_kg": self.mass_kg,
                "drag_coefficient": self.drag_coefficient,
                "reference_area_m2": self.reference_area_m2,
                "nose_radius_m": self.nose_radius_m,
                "lift_to_drag": self.lift_to_drag,
                "bank_angle_deg": self.bank_angle_deg,
                "step_s": self.step_s,
                "terminal_altitude_m": self.terminal_altitude_m,
            },
            "ballistic_coefficient_kg_m2": b,
            "heating_constant_kg05_m": case.planet.heat_k,
            "relative_entry": {
                "speed_m_s": case.speed_m_s,
                "flight_path_angle_deg": gam_abs.to_degrees(),
                "heading_deg": case.heading_rad.to_degrees(),
            },
            "peak_deceleration": pd,
            "peak_heat_flux": pq,
            "heat_load_j_m2": r.heat_load_j_m2,
            "heat_load_j_cm2": r.heat_load_j_m2 / 1e4,
            "peak_dynamic_pressure": pp,
            "terminal": {
                "time_s": r.end_time_s,
                "altitude_m": r.end_altitude_m,
                "speed_m_s": r.end_speed_m_s,
                "flight_path_angle_deg": r.end_gamma_rad.to_degrees(),
                "latitude_deg": r.end_latitude_rad.to_degrees(),
                "longitude_deg": r.end_longitude_rad.to_degrees(),
                "downrange_km": r.downrange_m / 1000.0,
            },
            "closed_form_check": {
                "reference": "NACA Report 1381 (1958) ballistic constant-flight-path-angle closed form",
                "scale_height_m": hs,
                "rho0_kg_m3": rho0,
                "peak_deceleration_g": cf_g,
                "altitude_at_peak_m": cf_h,
                "integrated_over_closed_form": pk_g / cf_g,
            },
            "energy_check": { "residual": r.energy_residual },
            "step_check": {
                "half_step_peak_heat_flux_rel_change":
                    rel(rh.peak_heat_flux_w_m2.value, r.peak_heat_flux_w_m2.value),
                "half_step_peak_deceleration_rel_change":
                    rel(rh.peak_deceleration_m_s2.value, r.peak_deceleration_m_s2.value),
            },
        });
        let summary = format!(
            "entry-heating ({}): V_rel {:.0} m/s, γ {:.2}° -> peak {:.1} g at {:.1} km, peak q \
             {:.0} W/cm² at {:.1} km, heat load {:.0} J/cm², peak q_dyn {:.1} kPa; {} at {:.0} s \
             (closed form {:.1} g; MODELLED 3-DoF, no radiative/TPS)",
            self.body,
            case.speed_m_s,
            gam_abs.to_degrees(),
            pk_g,
            r.peak_deceleration_m_s2.altitude_m / 1000.0,
            r.peak_heat_flux_w_m2.value / 1e4,
            r.peak_heat_flux_w_m2.altitude_m / 1000.0,
            r.heat_load_j_m2 / 1e4,
            r.peak_dynamic_pressure_pa.value / 1000.0,
            r.outcome,
            r.end_time_s,
            cf_g,
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::reentry::{simulate_planar_entry, PlanarEntry};

    fn run(s: &EntryHeatingScenario) -> serde_json::Value {
        serde_json::from_str(&s.run_json().unwrap().0).unwrap()
    }

    #[test]
    fn heat_flux_relation_has_the_published_form_and_constants() {
        // q = k sqrt(rho/Rn) V^3: rho 1e-4, Rn 1, V 1e4 -> 1.7415e-4 * 1e-2 * 1e12.
        let q = stagnation_heat_flux(K_HEAT_EARTH, 1e-4, 1.0, 1e4);
        assert!((q - 1.7415e6).abs() < 1e-3);
        // Scaling: V^3, rho^0.5, Rn^-0.5.
        let q2 = stagnation_heat_flux(K_HEAT_EARTH, 4e-4, 4.0, 2e4);
        assert!((q2 / q - 8.0).abs() < 1e-12);
        assert!((K_HEAT_MARS / K_HEAT_EARTH - 1.9027 / 1.7415).abs() < 1e-12);
    }

    #[test]
    fn non_rotating_ballistic_matches_the_planar_point_mass_of_the_reentry_module() {
        let s = EntryHeatingScenario {
            velocity_frame: "relative".into(),
            entry_speed_m_s: 7800.0,
            flight_path_angle_deg: 6.0,
            entry_interface_altitude_m: 122_000.0,
            rotating_planet: false,
            mass_kg: 100.0,
            drag_coefficient: 1.0,
            reference_area_m2: 1.0,
            step_s: 0.01,
            ..Default::default()
        };
        let (case, _, _) = s.build().unwrap();
        let r = simulate_entry(&case);
        let pm = simulate_planar_entry(&PlanarEntry {
            entry_speed_m_s: 7800.0,
            flight_path_angle_rad: 6.0_f64.to_radians(),
            interface_altitude_m: 122_000.0,
            ballistic_coeff_kg_m2: 100.0,
        });
        let rel = (r.peak_deceleration_m_s2.value - pm.peak_deceleration_m_s2).abs()
            / pm.peak_deceleration_m_s2;
        assert!(rel < 1e-3, "3-DoF vs planar peak rel {rel}");
        assert!((r.peak_deceleration_m_s2.altitude_m - pm.altitude_at_peak_m).abs() < 200.0);
    }

    #[test]
    fn steep_ballistic_entry_in_an_exponential_atmosphere_approaches_the_closed_form() {
        let s = EntryHeatingScenario {
            velocity_frame: "relative".into(),
            atmosphere: Some("exponential".into()),
            entry_speed_m_s: 7000.0,
            flight_path_angle_deg: 45.0,
            rotating_planet: false,
            mass_kg: 2000.0,
            drag_coefficient: 1.0,
            reference_area_m2: 1.0,
            terminal_altitude_m: 1000.0,
            ..Default::default()
        };
        let v = run(&s);
        let ratio = v["closed_form_check"]["integrated_over_closed_form"]
            .as_f64()
            .unwrap();
        assert!((ratio - 1.0).abs() < 0.05, "integrated / closed form {ratio}");
        let h_int = v["peak_deceleration"]["altitude_m"].as_f64().unwrap();
        let h_cf = v["closed_form_check"]["altitude_at_peak_m"].as_f64().unwrap();
        assert!((h_int - h_cf).abs() < 1500.0, "{h_int} vs {h_cf}");
    }

    #[test]
    fn rotating_frame_energy_falls_by_exactly_the_drag_work() {
        // Lifting, banked, rotating, off-equator: lift and Coriolis do no work.
        let s = EntryHeatingScenario {
            lift_to_drag: 0.3,
            bank_angle_deg: 40.0,
            latitude_deg: 35.0,
            heading_deg: 60.0,
            entry_speed_m_s: 7600.0,
            flight_path_angle_deg: 1.5,
            mass_kg: 5000.0,
            drag_coefficient: 1.3,
            reference_area_m2: 12.0,
            nose_radius_m: 4.7,
            ..Default::default()
        };
        let v = run(&s);
        let res = v["energy_check"]["residual"].as_f64().unwrap();
        assert!(res.abs() < 1e-6, "energy residual {res}");
        assert_eq!(v["outcome"], "terminal-altitude");
    }

    #[test]
    fn vacuum_coast_conserves_the_jacobi_energy() {
        let (mut case, _, _) = EntryHeatingScenario {
            latitude_deg: 20.0,
            heading_deg: 30.0,
            ..Default::default()
        }
        .build()
        .unwrap();
        case.atmosphere = Atmosphere::Exponential {
            rho0: 0.0,
            scale_height_m: 7200.0,
        };
        case.max_time_s = 300.0;
        let r = simulate_entry(&case);
        assert!(r.energy_residual.abs() < 1e-9, "{}", r.energy_residual);
        assert_eq!(r.heat_load_j_m2, 0.0);
    }

    #[test]
    fn lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry() {
        let base = EntryHeatingScenario {
            entry_speed_m_s: 7800.0,
            flight_path_angle_deg: 2.0,
            mass_kg: 5000.0,
            drag_coefficient: 1.3,
            reference_area_m2: 12.0,
            nose_radius_m: 4.7,
            ..Default::default()
        };
        let lifting = EntryHeatingScenario {
            lift_to_drag: 0.3,
            bank_angle_deg: 0.0,
            ..base_clone(&base)
        };
        let b = run(&base);
        let l = run(&lifting);
        let g = |v: &serde_json::Value| v["peak_deceleration"]["g"].as_f64().unwrap();
        assert!(g(&l) < g(&b), "lifting {} vs ballistic {}", g(&l), g(&b));
        assert!(
            l["heat_load_j_m2"].as_f64().unwrap() > b["heat_load_j_m2"].as_f64().unwrap(),
            "a longer lifting entry integrates more heat"
        );
    }

    fn base_clone(b: &EntryHeatingScenario) -> EntryHeatingScenario {
        EntryHeatingScenario {
            body: b.body.clone(),
            atmosphere: b.atmosphere.clone(),
            velocity_frame: b.velocity_frame.clone(),
            ..*b
        }
    }

    #[test]
    fn stardust_like_default_case_is_in_a_loose_plausibility_band() {
        // MODELLED sanity only. Entry state and vehicle from AIAA 2008-1198 (NASA NTRS
        // 20080008567) and AIAA 97-2304 as already fixtured in tests/fixtures/
        // reentry_point_mass_reconstruction_oracle; the reconstructed peak (a trajectory
        // estimate, not a measurement) is 32.89 g. The heat-flux band is a broad physical
        // plausibility band (order 1 kW/cm^2 cold-wall convective), not a comparison.
        let v = run(&EntryHeatingScenario::default());
        let g = v["peak_deceleration"]["g"].as_f64().unwrap();
        assert!((25.0..45.0).contains(&g), "Stardust-like peak {g} g");
        let q = v["peak_heat_flux"]["w_cm2"].as_f64().unwrap();
        assert!((500.0..2000.0).contains(&q), "Stardust-like peak q {q} W/cm2");
        let hq = v["peak_heat_flux"]["altitude_m"].as_f64().unwrap();
        let hg = v["peak_deceleration"]["altitude_m"].as_f64().unwrap();
        assert!(hq > hg, "heating peaks above (before) the deceleration peak");
        assert!(v["step_check"]["half_step_peak_heat_flux_rel_change"].as_f64().unwrap() < 1e-3);
    }

    #[test]
    fn mars_entry_runs_with_the_mars_constants() {
        let v = run(&EntryHeatingScenario {
            body: "mars".into(),
            velocity_frame: "relative".into(),
            entry_interface_altitude_m: 125_000.0,
            entry_speed_m_s: 5500.0,
            flight_path_angle_deg: 15.0,
            mass_kg: 600.0,
            drag_coefficient: 1.6,
            reference_area_m2: 5.5,
            nose_radius_m: 0.66,
            terminal_altitude_m: 5000.0,
            ..Default::default()
        });
        assert_eq!(v["heating_constant_kg05_m"].as_f64().unwrap(), K_HEAT_MARS);
        let q = v["peak_heat_flux"]["w_cm2"].as_f64().unwrap();
        assert!((5.0..500.0).contains(&q), "Mars peak q {q} W/cm2");
        assert!(v["atmosphere"].as_str().unwrap().contains("Mars"));
    }

    #[test]
    fn inertial_to_relative_removes_the_eastward_surface_speed() {
        let r = 6_500_000.0;
        let (v, g, psi) = inertial_to_relative(8000.0, 0.0, 90f64.to_radians(), 0.0, r, 7.292e-5);
        assert!((v - (8000.0 - 7.292e-5 * r)).abs() < 1e-9);
        assert!(g.abs() < 1e-12);
        assert!((psi.to_degrees() - 90.0).abs() < 1e-9);
        let (v0, _, _) = inertial_to_relative(8000.0, -0.1, 0.3, 0.5, r, 0.0);
        assert!((v0 - 8000.0).abs() < 1e-9);
    }

    #[test]
    fn report_is_reproducible_modelled_and_fully_unit_described() {
        let s = EntryHeatingScenario::default();
        let (j1, sum) = s.run_json().unwrap();
        let (j2, _) = s.run_json().unwrap();
        assert_eq!(j1, j2);
        assert!(!j1.contains("VALIDATED"));
        assert!(sum.contains("MODELLED"));
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "entry-heating");
        assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));
        let audit = crate::field_schema::audit_document(&v);
        assert!(audit.is_complete(), "missing {:?} malformed {:?}", audit.missing, audit.malformed);
        for f in &audit.covered {
            assert!(f.definition.as_deref().is_some_and(|d| !d.is_empty()), "{}", f.path);
        }
    }

    #[test]
    fn bad_inputs_are_rejected() {
        let bad = |s: EntryHeatingScenario| assert!(s.run_json().is_err());
        bad(EntryHeatingScenario { body: "venus".into(), ..Default::default() });
        bad(EntryHeatingScenario { flight_path_angle_deg: 0.0, ..Default::default() });
        bad(EntryHeatingScenario { mass_kg: -1.0, ..Default::default() });
        bad(EntryHeatingScenario { nose_radius_m: 0.0, ..Default::default() });
        bad(EntryHeatingScenario { atmosphere: Some("mars".into()), ..Default::default() });
        bad(EntryHeatingScenario { velocity_frame: "body".into(), ..Default::default() });
        bad(EntryHeatingScenario { step_s: f64::NAN, ..Default::default() });
        bad(EntryHeatingScenario { lift_to_drag: -0.2, ..Default::default() });
        bad(EntryHeatingScenario { terminal_altitude_m: 200_000.0, ..Default::default() });
    }
}
