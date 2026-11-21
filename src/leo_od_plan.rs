// SPDX-License-Identifier: AGPL-3.0-only
//! BeiDou–LEO interoperability planning and a LEO-aided orbit determination covariance study
//! (`kshana leo-od-plan`). A planning tool: it predicts geometry and formal covariance; it
//! processes no measurements and steers nothing.
//!
//! A LEO constellation whose satellites receive BeiDou signals can act as moving tracking
//! stations for the BeiDou satellites. This module answers two planning questions for a stated
//! LEO constellation and ground network:
//!
//! 1. **Interoperability geometry.** For each BeiDou satellite over an arc: the fraction of time it
//!    is tracked by at least one ground station and by at least one LEO receiver, and the mean
//!    number of each. A ground station sees a satellite above its elevation mask. A LEO receiver
//!    sees it when the line of sight clears the Earth by the stated grazing height, the receiver
//!    lies within the stated half-beamwidth of the BeiDou antenna (measured from the BeiDou nadir),
//!    and the satellite is above the receiver's own elevation mask (which may be negative).
//! 2. **LEO-aided orbit determination.** The formal covariance of each BeiDou satellite's epoch
//!    state from the range measurements those observers would make, ground-only and ground plus
//!    LEO: information J = Σ HᵀH/σ², with H = ∂ρ/∂x₀ through the two-body state transition
//!    (central differences), and the position standard deviation at the epoch from J⁻¹.
//!
//! Model limits, stated: two-body motion (no J2, drag or radiation pressure); observer positions
//! known exactly; one range per observer per step with the stated noise, uncorrelated; satellite
//! and receiver clocks not estimated (a range here is the clock-free geometric range, as from a
//! two-way link or with clocks known); the BeiDou constellation is the nominal one of
//! [`crate::constellation::beidou_slots`] (BDS-OS-PS-3.0, with the phases that standard does not
//! state chosen there). Every result is MODELLED.

use crate::constellation::{beidou_slots, Elements, WalkerPattern, WalkerSpec};
use serde::{Deserialize, Serialize};

/// Earth's gravitational parameter, m³/s² (WGS 84).
pub const MU: f64 = 3.986_004_418e14;
/// Earth's rotation rate, rad/s (WGS 84).
pub const OMEGA_E: f64 = 7.292_115e-5;
/// Earth's equatorial radius, m (WGS 84).
pub const RE: f64 = 6_378_137.0;

type V3 = [f64; 3];

fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: V3, b: V3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: V3) -> f64 {
    dot(a, a).sqrt()
}

/// A ground station.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Station {
    /// A name.
    pub name: String,
    /// Geodetic latitude, degrees (spherical Earth here).
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
}

/// The LEO constellation, as a Walker delta pattern.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LeoSpec {
    /// Satellites.
    pub total: usize,
    /// Planes.
    pub planes: usize,
    /// Walker phasing factor.
    pub phasing: usize,
    /// Altitude, km.
    pub altitude_km: f64,
    /// Inclination, degrees.
    pub inclination_deg: f64,
}

/// A plan.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Plan {
    /// The ground network.
    #[serde(rename = "station", default)]
    pub stations: Vec<Station>,
    /// The LEO constellation (absent: ground only).
    #[serde(default)]
    pub leo: Option<LeoSpec>,
    /// Arc length, hours.
    pub arc_hours: f64,
    /// Step, seconds.
    pub step_s: f64,
    /// Ground elevation mask, degrees.
    pub ground_mask_deg: f64,
    /// LEO receiver elevation mask, degrees (negative: below the receiver's horizontal).
    pub leo_mask_deg: f64,
    /// The lowest height the line of sight may graze, km.
    pub grazing_height_km: f64,
    /// The BeiDou antenna half-beamwidth used for LEO reception, degrees from nadir (a planning
    /// input: state the value and its source in the plan).
    pub bds_half_beamwidth_deg: f64,
    /// Ground range noise, m (1 sigma).
    pub ground_sigma_m: f64,
    /// LEO range noise, m (1 sigma).
    pub leo_sigma_m: f64,
    /// Include the BeiDou GEO and IGSO satellites (default false: MEO only).
    #[serde(default)]
    pub include_geo_igso: bool,
}

/// The ECI position and velocity of Keplerian elements at time `t` (two-body), the elements'
/// node taken as inertial at t = 0.
pub fn kepler_state(el: &Elements, t: f64) -> (V3, V3) {
    let n = (MU / el.a_m.powi(3)).sqrt();
    let m = el.m0_rad + n * t;
    let e = el.e;
    let mut ea = m;
    for _ in 0..30 {
        ea -= (ea - e * ea.sin() - m) / (1.0 - e * ea.cos());
    }
    let (s, c) = ea.sin_cos();
    let r = el.a_m * (1.0 - e * c);
    let x_p = el.a_m * (c - e);
    let y_p = el.a_m * (1.0 - e * e).sqrt() * s;
    let rdot = (MU * el.a_m).sqrt() / r;
    let vx_p = -rdot * s;
    let vy_p = rdot * (1.0 - e * e).sqrt() * c;
    let (so, co) = el.raan_rad.sin_cos();
    let (si, ci) = el.i_rad.sin_cos();
    let (sw, cw) = el.argp_rad.sin_cos();
    let rot = |x: f64, y: f64| -> V3 {
        [
            (co * cw - so * sw * ci) * x + (-co * sw - so * cw * ci) * y,
            (so * cw + co * sw * ci) * x + (-so * sw + co * cw * ci) * y,
            (sw * si) * x + (cw * si) * y,
        ]
    };
    (rot(x_p, y_p), rot(vx_p, vy_p))
}

fn accel(r: V3) -> V3 {
    let d = norm(r);
    let k = -MU / (d * d * d);
    [k * r[0], k * r[1], k * r[2]]
}

/// Two-body RK4 from a Cartesian state, sampled every `step` for `n` steps (position only).
pub fn propagate(x0: [f64; 6], step: f64, n: usize) -> Vec<V3> {
    let mut s = x0;
    let mut out = Vec::with_capacity(n + 1);
    out.push([s[0], s[1], s[2]]);
    let sub_steps = 6;
    let h = step / sub_steps as f64;
    let f = |s: [f64; 6]| -> [f64; 6] {
        let a = accel([s[0], s[1], s[2]]);
        [s[3], s[4], s[5], a[0], a[1], a[2]]
    };
    for _ in 0..n {
        for _ in 0..sub_steps {
            let k1 = f(s);
            let add = |s: [f64; 6], k: [f64; 6], c: f64| {
                let mut o = s;
                for i in 0..6 {
                    o[i] += c * k[i];
                }
                o
            };
            let k2 = f(add(s, k1, h / 2.0));
            let k3 = f(add(s, k2, h / 2.0));
            let k4 = f(add(s, k3, h));
            for i in 0..6 {
                s[i] += h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]);
            }
        }
        out.push([s[0], s[1], s[2]]);
    }
    out
}

fn station_eci(st: &Station, t: f64) -> V3 {
    let lat = st.lat_deg.to_radians();
    let lon = st.lon_deg.to_radians() + OMEGA_E * t;
    [
        RE * lat.cos() * lon.cos(),
        RE * lat.cos() * lon.sin(),
        RE * lat.sin(),
    ]
}

fn elevation_deg(obs: V3, sat: V3) -> f64 {
    let d = sub(sat, obs);
    (dot(d, obs) / (norm(d) * norm(obs))).asin().to_degrees()
}

/// Whether the segment between `a` and `b` stays above the sphere of radius `rmin`.
pub fn clears(a: V3, b: V3, rmin: f64) -> bool {
    let d = sub(b, a);
    let t = (-dot(a, d) / dot(d, d)).clamp(0.0, 1.0);
    let p = [a[0] + t * d[0], a[1] + t * d[1], a[2] + t * d[2]];
    norm(p) >= rmin
}

/// The angle (degrees) at the BeiDou satellite between its nadir and the direction to `obs`.
pub fn off_nadir_deg(sat: V3, obs: V3) -> f64 {
    let to_obs = sub(obs, sat);
    let nadir = [-sat[0], -sat[1], -sat[2]];
    (dot(to_obs, nadir) / (norm(to_obs) * norm(nadir)))
        .clamp(-1.0, 1.0)
        .acos()
        .to_degrees()
}

/// One BeiDou satellite's planning result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SatResult {
    /// The slot name.
    pub slot: String,
    /// Fraction of steps tracked by at least one ground station.
    pub ground_coverage: f64,
    /// Fraction of steps tracked by at least one LEO receiver.
    pub leo_coverage: f64,
    /// Fraction tracked by either.
    pub combined_coverage: f64,
    /// Mean number of ground stations tracking.
    pub mean_ground: f64,
    /// Mean number of LEO receivers tracking.
    pub mean_leo: f64,
    /// Epoch position standard deviation, ground only, m (absent if unobservable).
    pub sigma_pos_ground_m: Option<f64>,
    /// Epoch position standard deviation, ground and LEO, m (absent if unobservable).
    pub sigma_pos_combined_m: Option<f64>,
}

/// The plan's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PlanResult {
    /// Always MODELLED.
    pub label: String,
    /// The plan.
    pub plan: Plan,
    /// Per BeiDou satellite.
    pub satellites: Vec<SatResult>,
    /// Median over satellites of the ground-only to combined sigma ratio (where both exist).
    pub median_improvement: Option<f64>,
}

fn invert6(m: [[f64; 6]; 6]) -> Option<[[f64; 6]; 6]> {
    let mut a = m;
    let mut inv = [[0.0; 6]; 6];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    let scale = (0..6).map(|i| m[i][i].abs()).fold(0.0, f64::max);
    if scale == 0.0 {
        return None;
    }
    for col in 0..6 {
        let piv = (col..6).max_by(|&x, &y| a[x][col].abs().total_cmp(&a[y][col].abs()))?;
        if a[piv][col].abs() < scale * 1e-14 {
            return None;
        }
        a.swap(col, piv);
        inv.swap(col, piv);
        let p = a[col][col];
        for k in 0..6 {
            a[col][k] /= p;
            inv[col][k] /= p;
        }
        for r in 0..6 {
            if r != col {
                let f = a[r][col];
                if f != 0.0 {
                    for k in 0..6 {
                        a[r][k] -= f * a[col][k];
                        inv[r][k] -= f * inv[col][k];
                    }
                }
            }
        }
    }
    Some(inv)
}

/// Check a plan's numbers.
pub fn check(p: &Plan) -> Result<(), String> {
    let pos = |v: f64| v.is_finite() && v > 0.0;
    let ok = pos(p.arc_hours)
        && pos(p.step_s)
        && p.arc_hours * 3600.0 / p.step_s <= 100_000.0
        && pos(p.ground_sigma_m)
        && pos(p.leo_sigma_m)
        && p.grazing_height_km.is_finite()
        && p.grazing_height_km >= 0.0
        && (0.0..=90.0).contains(&p.ground_mask_deg)
        && (-90.0..=90.0).contains(&p.leo_mask_deg)
        && p.bds_half_beamwidth_deg > 0.0
        && p.bds_half_beamwidth_deg <= 90.0
        && p.stations
            .iter()
            .all(|s| (-90.0..=90.0).contains(&s.lat_deg) && s.lon_deg.is_finite());
    let leo_ok = p.leo.as_ref().is_none_or(|l| {
        l.total > 0
            && l.planes > 0
            && l.total % l.planes == 0
            && l.phasing < l.planes
            && pos(l.altitude_km)
            && l.altitude_km < 20_000.0
            && (0.0..=180.0).contains(&l.inclination_deg)
    });
    if ok && leo_ok {
        Ok(())
    } else {
        Err(crate::terr!("e-leo-od-plan-bad-plan"))
    }
}

/// Run a plan.
pub fn run_plan(p: &Plan) -> Result<PlanResult, String> {
    check(p)?;
    let n = (p.arc_hours * 3600.0 / p.step_s).floor() as usize;
    let leo_tracks: Vec<Vec<V3>> = match &p.leo {
        None => Vec::new(),
        Some(l) => {
            let spec = WalkerSpec {
                pattern: WalkerPattern::Delta,
                total: l.total,
                planes: l.planes,
                phasing: l.phasing,
                a_m: RE + l.altitude_km * 1e3,
                e: 0.0,
                i_rad: l.inclination_deg.to_radians(),
                raan0_rad: 0.0,
                argp_rad: 0.0,
                m0_rad: 0.0,
            };
            spec.elements()?
                .iter()
                .map(|el| {
                    (0..=n)
                        .map(|k| kepler_state(el, k as f64 * p.step_s).0)
                        .collect()
                })
                .collect()
        }
    };
    let stations: Vec<Vec<V3>> = p
        .stations
        .iter()
        .map(|s| {
            (0..=n)
                .map(|k| station_eci(s, k as f64 * p.step_s))
                .collect()
        })
        .collect();
    let rmin = RE + p.grazing_height_km * 1e3;
    let mut sats = Vec::new();
    for (slot, el) in beidou_slots(p.include_geo_igso)? {
        let (r0, v0) = kepler_state(&el, 0.0);
        let x0 = [r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
        let nominal = propagate(x0, p.step_s, n);
        // Central-difference partials of position with respect to the epoch state.
        let mut partials: Vec<[Vec<V3>; 2]> = Vec::new();
        let deltas = [10.0, 10.0, 10.0, 0.01, 0.01, 0.01];
        for (i, d) in deltas.iter().enumerate() {
            let mut xp = x0;
            let mut xm = x0;
            xp[i] += d;
            xm[i] -= d;
            partials.push([propagate(xp, p.step_s, n), propagate(xm, p.step_s, n)]);
        }
        let dpos = |k: usize, i: usize| -> V3 {
            let (a, b) = (partials[i][0][k], partials[i][1][k]);
            let d = 2.0 * deltas[i];
            [(a[0] - b[0]) / d, (a[1] - b[1]) / d, (a[2] - b[2]) / d]
        };
        let mut jg = [[0.0; 6]; 6];
        let mut jl = [[0.0; 6]; 6];
        let (mut g_any, mut l_any, mut c_any, mut g_sum, mut l_sum) = (0, 0, 0, 0usize, 0usize);
        for k in 0..=n {
            let sp = nominal[k];
            let add = |obs: V3, sigma: f64, j: &mut [[f64; 6]; 6]| {
                let los = sub(sp, obs);
                let u = [los[0] / norm(los), los[1] / norm(los), los[2] / norm(los)];
                let h: Vec<f64> = (0..6).map(|i| dot(u, dpos(k, i))).collect();
                for a in 0..6 {
                    for b in 0..6 {
                        j[a][b] += h[a] * h[b] / (sigma * sigma);
                    }
                }
            };
            let mut ng = 0;
            for st in &stations {
                if elevation_deg(st[k], sp) >= p.ground_mask_deg {
                    ng += 1;
                    add(st[k], p.ground_sigma_m, &mut jg);
                }
            }
            let mut nl = 0;
            for lt in &leo_tracks {
                let o = lt[k];
                if clears(o, sp, rmin)
                    && off_nadir_deg(sp, o) <= p.bds_half_beamwidth_deg
                    && elevation_deg(o, sp) >= p.leo_mask_deg
                {
                    nl += 1;
                    add(o, p.leo_sigma_m, &mut jl);
                }
            }
            g_sum += ng;
            l_sum += nl;
            g_any += usize::from(ng > 0);
            l_any += usize::from(nl > 0);
            c_any += usize::from(ng + nl > 0);
        }
        let sigma = |j: [[f64; 6]; 6]| -> Option<f64> {
            let p = invert6(j)?;
            let v = p[0][0] + p[1][1] + p[2][2];
            (v.is_finite() && v > 0.0).then(|| round(v.sqrt(), 1e4))
        };
        let mut jc = jg;
        for a in 0..6 {
            for b in 0..6 {
                jc[a][b] += jl[a][b];
            }
        }
        let steps = (n + 1) as f64;
        sats.push(SatResult {
            slot,
            ground_coverage: round(g_any as f64 / steps, 1e4),
            leo_coverage: round(l_any as f64 / steps, 1e4),
            combined_coverage: round(c_any as f64 / steps, 1e4),
            mean_ground: round(g_sum as f64 / steps, 1e3),
            mean_leo: round(l_sum as f64 / steps, 1e3),
            sigma_pos_ground_m: sigma(jg),
            sigma_pos_combined_m: sigma(jc),
        });
    }
    let mut ratios: Vec<f64> = sats
        .iter()
        .filter_map(|s| Some(s.sigma_pos_ground_m? / s.sigma_pos_combined_m?))
        .collect();
    ratios.sort_by(f64::total_cmp);
    let median_improvement = (!ratios.is_empty()).then(|| round(ratios[ratios.len() / 2], 1e3));
    Ok(PlanResult {
        label: "MODELLED".to_string(),
        plan: p.clone(),
        satellites: sats,
        median_improvement,
    })
}

fn round(v: f64, k: f64) -> f64 {
    (v * k).round() / k
}

/// `kshana leo-od-plan <plan.toml>`: the result as JSON.
pub fn run(args: &[String]) -> Result<(), String> {
    let [path] = args else {
        return Err(crate::t!("leo-od-plan-usage"));
    };
    if path.starts_with("--") {
        return Err(crate::t!("leo-od-plan-usage"));
    }
    let text = std::fs::read_to_string(path).map_err(|e| {
        crate::terr!(
            "e-leo-od-plan-cannot-read",
            path = path.clone(),
            e = e.to_string()
        )
    })?;
    let plan: Plan = toml::from_str(&text).map_err(|e| {
        crate::terr!(
            "e-leo-od-plan-bad-file",
            path = path.clone(),
            e = e.to_string()
        )
    })?;
    let r = run_plan(&plan)?;
    println!(
        "{}",
        serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?
    );
    Ok(())
}
