// SPDX-License-Identifier: AGPL-3.0-only
//! Study `geodesy-sensitivity`: what lunar laser ranging, orbiter tracking, a surface gravimeter and
//! a surface clock each say about the Love numbers `h2`, `k2`, `l2` and the physical libration of
//! the Moon (Fisher information, Cramér-Rao bounds). The parameters are
//! `[h2, k2, l2, libration in longitude (arcsec), libration in latitude (arcsec)]`.
//!
//! The Earth's degree-2 tidal potential on the lunar surface is `W2 = A P2(cos ψ)` with
//! `A = GM_E R² / d³`, `ψ` the angle between the surface point and the Earth direction. Its
//! effects: a radial displacement `h2 W2 / g`, a horizontal one `l2 (−3 A cos ψ / g)(cos ψ r̂ − ê)`,
//! a tidal gravity change `−(2 W2 / R)(1 + h2 − 1.5 k2)`, a fractional clock rate
//! `(1 + k2 − h2) W2 / c²` (the lunar-time modules' constants), and the acceleration of an orbiter
//! by the degree-2 tide of [`crate::lunar_od::degree2_tide_accel`] (proportional to `k2`).
//!
//! The Earth direction `ê` and distance `d` follow the optical libration (amplitudes of the mean
//! lunar orbit and equator tilt) and the eccentricity of the orbit; the physical libration enters
//! the laser range as a rotation of the reflector, `θ = λ sin Ωt ẑ + φ cos Ω_d t ŷ`. Stated
//! simplifications: spherical Moon and Earth, no Sun tide, the orbit and the libration are
//! known except for the two amplitudes, the orbiter family sees the integral of the `k2`
//! acceleration along the line of sight after a constant and a linear trend are removed (the state
//! estimate absorbs them), and the gravimeter and the clock each carry an unknown constant bias
//! (their means are removed). `h2` and `l2` nominal values are linearisation points.

use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};

use super::frame::{surface_point, LlrSpec, OMEGA_REL, R_EARTH_M};
use super::orbit::{OrbitSpec, L_M};
use crate::cr3bp::EARTH_MOON_MU;
use crate::fim::crlb;
use crate::forces::{MU_EARTH, MU_MOON};
use crate::lunar_llr_geometry::{reflectors, stations};
use crate::lunar_od::degree2_tide_accel;
use crate::lunar_time::{C2_M2_S2, EARTH_MOON_DISTANCE_M, RE_MOON_M};
use crate::portable_math::PortableFloat;

/// Nominal Love numbers.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Nominal {
    /// `h2` (0.0424, linearisation point).
    pub h2: Option<f64>,
    /// `k2` (0.024116, Lemoine et al. 2014).
    pub k2: Option<f64>,
    /// `l2` (0.0106, linearisation point).
    pub l2: Option<f64>,
}

/// Orbiter-tracking section.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct OrbiterSpec {
    /// Range-rate 1-sigma, mm/s (0.05).
    pub sigma_mm_s: Option<f64>,
    /// Arc length, days (27.3).
    pub arc_days: Option<f64>,
    /// Sample interval, s (3600).
    pub sample_s: Option<f64>,
}

/// Surface-gravimeter section.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct GravimeterSpec {
    /// Gravity 1-sigma, nm/s² (10).
    pub sigma_nm_s2: Option<f64>,
    /// Epochs over one anomalistic month (1000).
    pub epochs: Option<usize>,
    /// Sites `[lat_deg, lon_deg]` ([[0, 0]]).
    pub stations: Option<Vec<[f64; 2]>>,
}

/// Surface-clock section.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ClockSpec {
    /// Fractional-rate 1-sigma per epoch (1e-16).
    pub sigma_fractional: Option<f64>,
    /// Epochs over one anomalistic month (100).
    pub epochs: Option<usize>,
    /// Site `[lat_deg, lon_deg]` ([0, 0]).
    pub station: Option<[f64; 2]>,
}

/// Anomalistic month, s.
pub const ANOMALISTIC_S: f64 = 27.554_55 * 86_400.0;
/// Draconic month, s.
pub const DRACONIC_S: f64 = 27.212_22 * 86_400.0;
/// Eccentricity of the lunar orbit.
pub const ECC: f64 = 0.0549;
/// Optical libration amplitude in longitude (about `2e`), rad.
pub const LON_LIB_RAD: f64 = 2.0 * ECC;
/// Optical libration amplitude in latitude (tilt of the lunar equator to the orbit), rad.
pub const LAT_LIB_RAD: f64 = 6.69 * std::f64::consts::PI / 180.0;
/// One arcsecond, rad.
pub const ARCSEC: f64 = std::f64::consts::PI / 648_000.0;
const MIN_STATION_ELEVATION_DEG: f64 = 20.0;
const REL_TOL: f64 = 1e-10;
/// Parameter names.
pub const PARAMS: [&str; 5] = [
    "h2",
    "k2",
    "l2",
    "libration_longitude_arcsec",
    "libration_latitude_arcsec",
];
/// The observable families.
pub const FAMILIES: [&str; 4] = ["llr", "orbiter", "gravimeter", "clock"];

fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn cross(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn norm(a: [f64; 3]) -> f64 {
    dot(a, a).sqrt()
}
fn unit(a: [f64; 3]) -> [f64; 3] {
    let n = norm(a);
    [a[0] / n, a[1] / n, a[2] / n]
}

/// The Earth-Moon geometry at time `t` (seconds).
#[derive(Clone, Copy, Debug)]
pub struct Geom {
    /// Unit vector from the Moon to the Earth, lunar axes.
    pub e: [f64; 3],
    /// Earth-Moon distance, m.
    pub d: f64,
    /// `sin(Ω t)` of the anomalistic phase.
    pub sin_om: f64,
    /// `cos(Ω_d t)` of the draconic phase.
    pub cos_omd: f64,
}

/// The geometry at `t`.
pub fn geom(t: f64) -> Geom {
    let om = std::f64::consts::TAU * t / ANOMALISTIC_S;
    let omd = std::f64::consts::TAU * t / DRACONIC_S;
    let (l, b) = (LON_LIB_RAD * om.psin(), LAT_LIB_RAD * omd.psin());
    Geom {
        e: [b.pcos() * l.pcos(), b.pcos() * l.psin(), b.psin()],
        d: EARTH_MOON_DISTANCE_M * (1.0 - ECC * om.pcos()),
        sin_om: om.psin(),
        cos_omd: omd.pcos(),
    }
}

/// Degree-2 Legendre polynomial.
pub fn p2(c: f64) -> f64 {
    0.5 * (3.0 * c * c - 1.0)
}

/// Tidal potential scale `A = GM_E R² / d³`, m²/s².
pub fn tide_a(d: f64) -> f64 {
    MU_EARTH * RE_MOON_M * RE_MOON_M / (d * d * d)
}

/// Lunar surface gravity, m/s².
pub fn surface_gravity() -> f64 {
    MU_MOON / (RE_MOON_M * RE_MOON_M)
}

/// The amplitude of the tidal term of the surface-clock fractional rate, `GM_E R² / (d³ c²)`.
pub fn clock_tidal_amplitude(d: f64) -> f64 {
    tide_a(d) / C2_M2_S2
}

/// Sensitivities of the surface-clock fractional rate `(1 + k2 − h2) W2 / c²` to `(k2, h2)` at
/// `cos ψ`.
pub fn clock_rate_sensitivities(d: f64, cos_psi: f64) -> (f64, f64) {
    let w = clock_tidal_amplitude(d) * p2(cos_psi);
    (w, -w)
}

/// Laser-range change, m, of the reflector at `p` seen along `u` (station to reflector) for the
/// parameters `x = [h2, k2, l2, λ_arcsec, φ_arcsec]` (linear in `x`).
pub fn llr_forward(g: &Geom, u: [f64; 3], p: [f64; 3], x: &[f64; 5]) -> f64 {
    let r = unit(p);
    let c = dot(r, g.e);
    let a = tide_a(g.d);
    let gr = surface_gravity();
    let radial = x[0] * a * p2(c) / gr;
    let h = -3.0 * x[2] * a * c / gr;
    let hv = [c * r[0] - g.e[0], c * r[1] - g.e[1], c * r[2] - g.e[2]];
    let rot_l = cross([0.0, 0.0, x[3] * ARCSEC * g.sin_om], p);
    let rot_p = cross([0.0, x[4] * ARCSEC * g.cos_omd, 0.0], p);
    dot(u, r) * radial + h * dot(u, hv) + dot(u, rot_l) + dot(u, rot_p)
}

/// Analytic partials of [`llr_forward`].
pub fn llr_partials(g: &Geom, u: [f64; 3], p: [f64; 3]) -> [f64; 5] {
    let r = unit(p);
    let c = dot(r, g.e);
    let a = tide_a(g.d);
    let gr = surface_gravity();
    let hv = [c * r[0] - g.e[0], c * r[1] - g.e[1], c * r[2] - g.e[2]];
    [
        dot(u, r) * a * p2(c) / gr,
        0.0,
        -3.0 * a * c / gr * dot(u, hv),
        ARCSEC * g.sin_om * dot(u, cross([0.0, 0.0, 1.0], p)),
        ARCSEC * g.cos_omd * dot(u, cross([0.0, 1.0, 0.0], p)),
    ]
}

/// Tidal gravity change at a surface site (nm/s²) for `x`: `−(2 W2 / R)(1 + h2 − 1.5 k2)`.
pub fn grav_forward(g: &Geom, site: [f64; 3], x: &[f64; 5]) -> f64 {
    let c = dot(unit(site), g.e);
    let w2 = tide_a(g.d) * p2(c);
    -2.0 * w2 / RE_MOON_M * (1.0 + x[0] - 1.5 * x[1]) * 1e9
}

/// Partials of [`grav_forward`] (nm/s²).
pub fn grav_partials(g: &Geom, site: [f64; 3]) -> [f64; 5] {
    let c = dot(unit(site), g.e);
    let k = -2.0 * tide_a(g.d) * p2(c) / RE_MOON_M * 1e9;
    [k, -1.5 * k, 0.0, 0.0, 0.0]
}

/// Surface-clock fractional rate for `x`: `(1 + k2 − h2) W2 / c²`.
pub fn clock_forward(g: &Geom, site: [f64; 3], x: &[f64; 5]) -> f64 {
    let c = dot(unit(site), g.e);
    (1.0 + x[1] - x[0]) * clock_tidal_amplitude(g.d) * p2(c)
}

/// Partials of [`clock_forward`].
pub fn clock_partials(g: &Geom, site: [f64; 3]) -> [f64; 5] {
    let c = dot(unit(site), g.e);
    let (dk, dh) = clock_rate_sensitivities(g.d, c);
    [dh, dk, 0.0, 0.0, 0.0]
}

/// One weighted information row.
type Row = ([f64; 5], f64);

/// Earth-station laser-ranging rows over one anomalistic month, with the elevation and reflector
/// visibility gates.
pub fn llr_rows(epochs: usize, sigma: f64) -> Vec<Row> {
    let refl = reflectors();
    let sta = stations();
    let sin_min = MIN_STATION_ELEVATION_DEG.to_radians().psin();
    let mut rows = Vec::new();
    for k in 0..epochs {
        let t = ANOMALISTIC_S * (k as f64) / (epochs as f64);
        let g = geom(t);
        let a3 = unit(sub(
            [0.0, 0.0, 1.0],
            [g.e[2] * g.e[0], g.e[2] * g.e[1], g.e[2] * g.e[2]],
        ));
        let a2 = cross(a3, g.e);
        for s in &sta {
            let (phi, lam) = (s.lat_deg.to_radians(), s.lon_deg.to_radians());
            let al = lam + OMEGA_REL * t;
            let (ca, sa, cp, sp) = (al.pcos(), al.psin(), phi.pcos(), phi.psin());
            let off: [f64; 3] = std::array::from_fn(|i| {
                R_EARTH_M * (-cp * ca * g.e[i] + cp * sa * a2[i] + sp * a3[i])
            });
            let x: [f64; 3] = std::array::from_fn(|i| g.d * g.e[i] + off[i]);
            let zen = unit(off);
            for r in &refl {
                let p = r.pa_body_m;
                let dv = sub(p, x);
                let u = unit(dv);
                let up_el = dot(zen, u);
                let r_el = dot(unit(p), [-u[0], -u[1], -u[2]]);
                if up_el >= sin_min && r_el > 0.0 {
                    rows.push((llr_partials(&g, u, p), sigma));
                }
            }
        }
    }
    rows
}

/// Orbiter rows: the line-of-sight integral of the `k2` acceleration, detrended.
pub fn orbiter_rows(
    orbit: &OrbitSpec,
    arc_days: f64,
    sample_s: f64,
    sigma_m_s: f64,
) -> Result<Vec<Row>, String> {
    let mut o = orbit.clone();
    o.sample_s = Some(sample_s);
    let ro = o.build(arc_days)?;
    let (mut v, mut t, mut acc) = (Vec::new(), Vec::new(), [0.0f64; 3]);
    let mut prev: Option<([f64; 3], f64)> = None;
    for (k, s) in ro.x.iter().enumerate() {
        let tk = ro.t_s[k];
        let r = [
            -L_M * (s[0] - (1.0 - EARTH_MOON_MU)),
            -L_M * s[1],
            L_M * s[2],
        ];
        let g = geom(tk);
        let rj = [g.d * g.e[0], g.d * g.e[1], g.d * g.e[2]];
        let a = degree2_tide_accel(r, rj, MU_EARTH, 1.0, RE_MOON_M);
        if let Some((pa, pt)) = prev {
            // Trapezoid rule for the velocity change accumulated since the arc start.
            for i in 0..3 {
                acc[i] += 0.5 * (tk - pt) * (pa[i] + a[i]);
            }
        }
        prev = Some((a, tk));
        v.push(dot(g.e, acc));
        t.push(tk);
    }
    detrend_linear(&mut v, &t);
    Ok(v.into_iter()
        .map(|c| ([0.0, c, 0.0, 0.0, 0.0], sigma_m_s))
        .collect())
}

/// Remove the least-squares constant and linear trend from `v(t)`.
pub fn detrend_linear(v: &mut [f64], t: &[f64]) {
    let n = v.len() as f64;
    if v.len() < 3 {
        return;
    }
    let (mt, mv) = (t.iter().sum::<f64>() / n, v.iter().sum::<f64>() / n);
    let (mut stt, mut stv) = (0.0, 0.0);
    for i in 0..v.len() {
        stt += (t[i] - mt) * (t[i] - mt);
        stv += (t[i] - mt) * (v[i] - mv);
    }
    let slope = if stt > 0.0 { stv / stt } else { 0.0 };
    for i in 0..v.len() {
        v[i] -= mv + slope * (t[i] - mt);
    }
}

fn demean(rows: &mut [Row], col: usize) {
    if rows.is_empty() {
        return;
    }
    let m = rows.iter().map(|r| r.0[col]).sum::<f64>() / rows.len() as f64;
    for r in rows.iter_mut() {
        r.0[col] -= m;
    }
}

/// Gravimeter rows (constant bias removed).
pub fn grav_rows(epochs: usize, sites: &[[f64; 2]], sigma_nm_s2: f64) -> Vec<Row> {
    let mut rows = Vec::new();
    for st in sites {
        let site = surface_point(st[0], st[1]);
        let mut r: Vec<Row> = (0..epochs)
            .map(|k| {
                let g = geom(ANOMALISTIC_S * (k as f64) / (epochs as f64));
                (grav_partials(&g, site), sigma_nm_s2)
            })
            .collect();
        for c in 0..2 {
            demean(&mut r, c);
        }
        rows.extend(r);
    }
    rows
}

/// Clock rows (constant rate offset removed).
pub fn clock_rows(epochs: usize, st: [f64; 2], sigma: f64) -> Vec<Row> {
    let site = surface_point(st[0], st[1]);
    let mut r: Vec<Row> = (0..epochs)
        .map(|k| {
            let g = geom(ANOMALISTIC_S * (k as f64) / (epochs as f64));
            (clock_partials(&g, site), sigma)
        })
        .collect();
    for c in 0..2 {
        demean(&mut r, c);
    }
    r
}

/// Information matrix (5 x 5) of a set of families' rows.
pub fn information(fams: &[&[Row]]) -> Vec<Vec<f64>> {
    let mut m = vec![vec![0.0; 5]; 5];
    for rows in fams {
        for (h, s) in rows.iter() {
            let w = 1.0 / (s * s);
            for p in 0..5 {
                for q in 0..5 {
                    m[p][q] += w * h[p] * h[q];
                }
            }
        }
    }
    m
}

fn rms(rows: &[Row], col: usize) -> f64 {
    if rows.is_empty() {
        return 0.0;
    }
    (rows.iter().map(|r| r.0[col] * r.0[col]).sum::<f64>() / rows.len() as f64).sqrt()
}

fn trace_pinv(info: &[Vec<f64>]) -> (f64, f64, usize, Vec<f64>) {
    let c = crlb(info, REL_TOL);
    let tr: f64 = (0..5).map(|i| c.pseudo_covariance[i][i]).sum();
    (
        tr,
        c.eigenvalues.first().copied().unwrap_or(0.0),
        c.rank,
        c.crlb_std,
    )
}

/// Everything of a run: the four families' rows and the specs resolved.
pub struct Families {
    /// Laser ranging.
    pub llr: Vec<Row>,
    /// Orbiter.
    pub orbiter: Vec<Row>,
    /// Gravimeter.
    pub gravimeter: Vec<Row>,
    /// Clock.
    pub clock: Vec<Row>,
}

/// Resolve the specs and build the families' rows.
pub fn build(
    orbit: &OrbitSpec,
    llr: &LlrSpec,
    orb: &OrbiterSpec,
    grav: &GravimeterSpec,
    clock: &ClockSpec,
) -> Result<Families, String> {
    let ls = llr.sigma_m.unwrap_or(0.05);
    let os = orb.sigma_mm_s.unwrap_or(0.05) * 1e-3;
    let gs = grav.sigma_nm_s2.unwrap_or(10.0);
    let cs = clock.sigma_fractional.unwrap_or(1e-16);
    if !(ls > 0.0 && os > 0.0 && gs > 0.0 && cs > 0.0) {
        return Err(crate::terr!(
            "e-lunar-infra-geodesy-all-sigmas-must-be-positive"
        ));
    }
    Ok(Families {
        llr: llr_rows(llr.epochs.unwrap_or(400), ls),
        orbiter: orbiter_rows(
            orbit,
            orb.arc_days.unwrap_or(27.3),
            orb.sample_s.unwrap_or(3600.0),
            os,
        )?,
        gravimeter: grav_rows(
            grav.epochs.unwrap_or(1000),
            &grav.stations.clone().unwrap_or_else(|| vec![[0.0, 0.0]]),
            gs,
        ),
        clock: clock_rows(
            clock.epochs.unwrap_or(100),
            clock.station.unwrap_or([0.0, 0.0]),
            cs,
        ),
    })
}

/// Run the study.
pub fn run(
    orbit: &OrbitSpec,
    nominal: &Nominal,
    llr: &LlrSpec,
    orb: &OrbiterSpec,
    grav: &GravimeterSpec,
    clock: &ClockSpec,
) -> Result<Value, String> {
    let f = build(orbit, llr, orb, grav, clock)?;
    let fams: [&[Row]; 4] = [&f.llr, &f.orbiter, &f.gravimeter, &f.clock];
    let nom = [
        nominal.h2.unwrap_or(0.0424),
        nominal.k2.unwrap_or(0.024116),
        nominal.l2.unwrap_or(0.0106),
    ];
    let all = information(&fams);
    let (tr, lam, rank, sig) = trace_pinv(&all);
    let mut subsets = Vec::new();
    let (mut lam_ok, mut trace_ok, mut pairs) = (0usize, 0usize, 0usize);
    let mut results = vec![(0.0, 0.0); 16];
    for mask in 1usize..16 {
        let sel: Vec<&[Row]> = (0..4)
            .filter(|i| mask >> i & 1 == 1)
            .map(|i| fams[i])
            .collect();
        let info = information(&sel);
        let (t, l, r, s) = trace_pinv(&info);
        results[mask] = (t, l);
        subsets.push(json!({
            "families": (0..4).filter(|i| mask >> i & 1 == 1).map(|i| FAMILIES[i]).collect::<Vec<_>>(),
            "rank": r, "lambda_min": l, "crlb_trace": t, "crlb_sigma": s,
        }));
    }
    for mask in 1usize..16 {
        for i in 0..4 {
            if mask >> i & 1 == 0 {
                let m2 = mask | (1 << i);
                pairs += 1;
                lam_ok += usize::from(results[m2].1 >= results[mask].1 * (1.0 - 1e-12) - 1e-300);
                trace_ok += usize::from(results[m2].0 <= results[mask].0 * (1.0 + 1e-12));
            }
        }
    }
    let rel: Vec<Value> = (0..3).map(|i| json!(sig[i] / nom[i])).collect();
    Ok(json!({
        "parameters": PARAMS,
        "nominal": {"h2": nom[0], "k2": nom[1], "l2": nom[2]},
        "families": {
            "llr": {"rows": f.llr.len(), "rms_partial": (0..5).map(|c| rms(&f.llr, c)).collect::<Vec<_>>()},
            "orbiter": {"rows": f.orbiter.len(), "rms_partial": (0..5).map(|c| rms(&f.orbiter, c)).collect::<Vec<_>>()},
            "gravimeter": {"rows": f.gravimeter.len(), "rms_partial": (0..5).map(|c| rms(&f.gravimeter, c)).collect::<Vec<_>>()},
            "clock": {"rows": f.clock.len(), "rms_partial": (0..5).map(|c| rms(&f.clock, c)).collect::<Vec<_>>()},
        },
        "information": all,
        "rank": rank,
        "lambda_min": lam,
        "crlb_trace": tr,
        "crlb_sigma": sig,
        "crlb_sigma_over_nominal_h2_k2_l2": rel,
        "subsets": subsets,
        "adding_a_family": {"pairs_checked": pairs, "lambda_min_not_smaller": lam_ok, "trace_not_larger": trace_ok},
        "clock_tidal_amplitude": clock_tidal_amplitude(EARTH_MOON_DISTANCE_M),
        "surface_gravity_m_s2": surface_gravity(),
    }))
}

/// Primitives and the Rust information matrix for the independent numpy oracle (G2).
pub fn export(
    orbit: &OrbitSpec,
    nominal: &Nominal,
    llr: &LlrSpec,
    orb: &OrbiterSpec,
    grav: &GravimeterSpec,
    clock: &ClockSpec,
) -> Result<Value, String> {
    let _ = nominal;
    let f = build(orbit, llr, orb, grav, clock)?;
    let fams: [&[Row]; 4] = [&f.llr, &f.orbiter, &f.gravimeter, &f.clock];
    // The raw partial rows are not exported (the oracle rebuilds them from its own forward
    // models); the primitives are the geometry of each epoch.
    let ls = llr.sigma_m.unwrap_or(0.05);
    let n = llr.epochs.unwrap_or(400);
    let refl = reflectors();
    let sta = stations();
    let sin_min = MIN_STATION_ELEVATION_DEG.to_radians().psin();
    let mut llr_cases = Vec::new();
    for k in 0..n {
        let t = ANOMALISTIC_S * (k as f64) / (n as f64);
        let g = geom(t);
        let a3 = unit(sub(
            [0.0, 0.0, 1.0],
            [g.e[2] * g.e[0], g.e[2] * g.e[1], g.e[2] * g.e[2]],
        ));
        let a2 = cross(a3, g.e);
        for s in &sta {
            let (phi, lam) = (s.lat_deg.to_radians(), s.lon_deg.to_radians());
            let al = lam + OMEGA_REL * t;
            let off: [f64; 3] = std::array::from_fn(|i| {
                R_EARTH_M
                    * (-phi.pcos() * al.pcos() * g.e[i]
                        + phi.pcos() * al.psin() * a2[i]
                        + phi.psin() * a3[i])
            });
            let x: [f64; 3] = std::array::from_fn(|i| g.d * g.e[i] + off[i]);
            let zen = unit(off);
            for r in &refl {
                let p = r.pa_body_m;
                let u = unit(sub(p, x));
                if dot(zen, u) >= sin_min && dot(unit(p), [-u[0], -u[1], -u[2]]) > 0.0 {
                    llr_cases.push(json!({"e": g.e, "d": g.d, "sin_om": g.sin_om, "cos_omd": g.cos_omd, "u": u, "p": p}));
                }
            }
        }
    }
    let mut o = orbit.clone();
    o.sample_s = Some(orb.sample_s.unwrap_or(3600.0));
    let ro = o.build(orb.arc_days.unwrap_or(27.3))?;
    let orb_cases: Vec<Value> = ro
        .x
        .iter()
        .zip(&ro.t_s)
        .map(|(s, t)| {
            let g = geom(*t);
            json!({"t": t, "r": [-L_M * (s[0] - (1.0 - EARTH_MOON_MU)), -L_M * s[1], L_M * s[2]], "e": g.e, "d": g.d})
        })
        .collect();
    let gsites = grav.stations.clone().unwrap_or_else(|| vec![[0.0, 0.0]]);
    let ge = grav.epochs.unwrap_or(1000);
    let ce = clock.epochs.unwrap_or(100);
    let epoch_geoms = |m: usize| -> Vec<Value> {
        (0..m)
            .map(|k| {
                let g = geom(ANOMALISTIC_S * (k as f64) / (m as f64));
                json!({"e": g.e, "d": g.d})
            })
            .collect()
    };
    Ok(json!({
        "sigma": {
            "llr_m": ls,
            "orbiter_m_s": orb.sigma_mm_s.unwrap_or(0.05) * 1e-3,
            "gravimeter_nm_s2": grav.sigma_nm_s2.unwrap_or(10.0),
            "clock": clock.sigma_fractional.unwrap_or(1e-16),
        },
        "constants": {"mu_earth": MU_EARTH, "mu_moon": MU_MOON, "r_moon_m": RE_MOON_M, "c2": C2_M2_S2, "arcsec": ARCSEC, "d_nominal_m": EARTH_MOON_DISTANCE_M},
        "llr": llr_cases,
        "orbiter": orb_cases,
        "gravimeter": {"sites": gsites.iter().map(|s| surface_point(s[0], s[1])).collect::<Vec<_>>(), "epochs": epoch_geoms(ge)},
        "clock": {"site": surface_point(clock.station.unwrap_or([0.0, 0.0])[0], clock.station.unwrap_or([0.0, 0.0])[1]), "epochs": epoch_geoms(ce)},
        "rust_information": information(&fams),
    }))
}

/// Random geometries for the finite-difference check of the partials (G1 and its numpy twin):
/// `n` seeded random laser-ranging, gravimeter and clock cases.
pub fn random_cases(n: usize, seed: u64) -> Vec<(Geom, [f64; 3], [f64; 3])> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    (0..n)
        .map(|_| {
            let g = geom(rng.gen_range(0.0..ANOMALISTIC_S));
            let s: f64 = rng.gen_range(-1.0..1.0);
            let p = surface_point(s.pasin().to_degrees(), rng.gen_range(-180.0..180.0));
            let mut dir = [
                rng.gen_range(-1.0..1.0),
                rng.gen_range(-1.0..1.0),
                rng.gen_range(-1.0..1.0),
            ];
            dir = unit(dir);
            (g, dir, p)
        })
        .collect()
}
