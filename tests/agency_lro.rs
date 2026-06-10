// SPDX-License-Identifier: Apache-2.0
//! NASA LRO lunar-orbit validation (P4 Wave 4b) — truth foundation.
//!
//! The third reference-grade agency dataset is a real NASA/JPL reconstructed trajectory of
//! the **Lunar Reconnaissance Orbiter** (NAIF id −85, `LRO_merged`), taken from the JPL
//! Horizons ephemeris service as geometric Moon-centered state vectors in the ICRF
//! (= J2000 to ~0.02″), 2022-01-01, ~98 km altitude. Horizons text vectors avoid any SPK
//! reader / SPICE dependency: the same definitive reconstructed orbit, in a frame Kshana's
//! force model can use directly.
//!
//! This first wave establishes and geometry-checks the truth, and quantifies the
//! perturbation signal a Moon point-mass model leaves unmodelled — the motivation for the
//! Moon-central force model (lunar GRGM field via the lunar body-fixed frame + Earth/Sun
//! third body + SRP) and the OD fit that the following waves add. The post-fit residual is
//! reported there.
//!
//! Fixture (provenance + SHA-256 in `tests/fixtures/agency/NOTICE.md`):
//!   lro/LRO_2022001_Moon_ICRF_4h.csv   574e3518…d100f0

use kshana::integrator::{integrate_dopri, Tolerance};
use kshana::lunar::{MOON_GM_M3_S2, R_MOON_M};

const LRO: &str = include_str!("fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv");

/// One Horizons state: TDB Julian Date and Moon-centered ICRF position (m) and velocity
/// (m/s). The fixture stores km / km/s; this converts to SI.
struct State {
    jd_tdb: f64,
    pos: [f64; 3],
    vel: [f64; 3],
}

/// Parse the vendored Horizons CSV (`JDTDB,X,Y,Z,VX,VY,VZ` in km / km·s⁻¹, `#` comments).
fn parse_lro_csv(text: &str) -> Vec<State> {
    let mut out = Vec::new();
    for line in text.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let f: Vec<f64> = line
            .split(',')
            .map(|t| t.trim().parse::<f64>().unwrap())
            .collect();
        assert_eq!(f.len(), 7, "expected 7 columns, got {}: {line:?}", f.len());
        out.push(State {
            jd_tdb: f[0],
            pos: [f[1] * 1000.0, f[2] * 1000.0, f[3] * 1000.0],
            vel: [f[4] * 1000.0, f[5] * 1000.0, f[6] * 1000.0],
        });
    }
    out
}

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

#[test]
fn lro_truth_geometry_is_sane() {
    let s = parse_lro_csv(LRO);
    assert_eq!(s.len(), 241, "expected 241 one-minute epochs over 4 h");

    // Time strictly increases by ~60 s (1-minute step, in days).
    for w in s.windows(2) {
        let dt_s = (w[1].jd_tdb - w[0].jd_tdb) * 86_400.0;
        assert!((dt_s - 60.0).abs() < 1e-3, "step {dt_s} s not ~60 s");
    }

    // Altitude band (~98 km mapping/extended orbit) and orbital speed (~1.6 km/s).
    for st in &s {
        let alt_km = (norm(st.pos) - R_MOON_M) / 1000.0;
        assert!(
            (70.0..130.0).contains(&alt_km),
            "altitude {alt_km} km off LRO orbit"
        );
        let spd = norm(st.vel);
        assert!(
            (1400.0..1800.0).contains(&spd),
            "speed {spd} m/s off LRO orbit"
        );
    }

    // The arc sweeps multiple revolutions: accumulate the angle between successive radius
    // vectors. LRO's period at ~98 km is ~118 min, so 4 h is ~2 revs (> 4π/… ≥ 1 full rev).
    let mut swept = 0.0;
    for w in s.windows(2) {
        let (a, b) = (w[0].pos, w[1].pos);
        let dot = (0..3).map(|k| a[k] * b[k]).sum::<f64>() / (norm(a) * norm(b));
        swept += dot.clamp(-1.0, 1.0).acos();
    }
    assert!(
        swept > 2.0 * std::f64::consts::PI,
        "arc swept only {swept} rad (< 1 rev)"
    );
}

#[test]
fn lro_two_body_overlap_shows_perturbation_signal() {
    let s = parse_lro_csv(LRO);
    let t0 = s[0].jd_tdb;

    // Moon point-mass two-body field: a = −μ·r/|r|³.
    let f = |_t: f64, y: &[f64]| -> Vec<f64> {
        let r = [y[0], y[1], y[2]];
        let rn = norm(r);
        let k = -MOON_GM_M3_S2 / (rn * rn * rn);
        vec![y[3], y[4], y[5], k * r[0], k * r[1], k * r[2]]
    };
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-6,
        ..Default::default()
    };

    // March the seed state through every epoch, comparing two-body to truth.
    let mut y = vec![
        s[0].pos[0],
        s[0].pos[1],
        s[0].pos[2],
        s[0].vel[0],
        s[0].vel[1],
        s[0].vel[2],
    ];
    let mut t_prev = 0.0;
    let mut sumsq = 0.0;
    let mut max_d = 0.0_f64;
    for st in s.iter().skip(1) {
        let t = (st.jd_tdb - t0) * 86_400.0;
        let sol = integrate_dopri(&f, t_prev, &y, t, (t - t_prev).min(10.0), &tol);
        y = sol.y;
        t_prev = t;
        let d =
            ((y[0] - st.pos[0]).powi(2) + (y[1] - st.pos[1]).powi(2) + (y[2] - st.pos[2]).powi(2))
                .sqrt();
        sumsq += d * d;
        max_d = max_d.max(d);
    }
    let rms = (sumsq / (s.len() - 1) as f64).sqrt();
    eprintln!(
        "LRO (−85) 2022-001, Moon point-mass two-body vs JPL Horizons truth over 4 h: \
         3D RMS {:.1} m, max {:.1} m — the lunar non-spherical field + Earth/Sun third body \
         left unmodelled (the W4b force-model target).",
        rms, max_d
    );
    // Real signal: the perturbations push two-body well off truth (sanity floor), but the
    // integration stays finite and bounded (no blow-up) — the data and pipeline are sound.
    assert!(
        rms > 100.0,
        "two-body RMS {rms} m unexpectedly small — fixture/units suspect"
    );
    assert!(
        rms < 1.0e6,
        "two-body RMS {rms} m unbounded — integration/parse broken"
    );
    assert!(max_d.is_finite());
}
