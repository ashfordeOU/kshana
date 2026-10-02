// SPDX-License-Identifier: AGPL-3.0-only
//! The opt-in square-root solver of the precise-OD batch fit (`precise_od::fit_srif`) against the
//! default normal-equation fit on synthetic arcs: a noisy state-only arc and an arc that estimates
//! the empirical-acceleration tier (whose a-priori constraint the square-root route carries as
//! pseudo-measurement rows). Both solvers see the same data; neither is an oracle for the other,
//! so the checks are agreement to a small fraction of the recovery scale and the same recovery
//! criteria the default fit is held to in `tests/precise_od_synth.rs`.

use kshana::integrator::Tolerance;
use kshana::precise_od::{
    fit, fit_srif, propagate, EmpiricalAccel, EstimatedParams, FitConfig, Observation,
    PreciseForceModel,
};
use kshana::timescales::JD_J2000;

struct Lcg(u64);
impl Lcg {
    fn next_u(&mut self) -> f64 {
        self.0 = self
            .0
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1);
        ((self.0 >> 11) as f64) / ((1u64 << 53) as f64)
    }
    fn gauss(&mut self) -> f64 {
        let u1 = self.next_u().max(1e-12);
        let u2 = self.next_u();
        (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

fn circular_leo() -> ([f64; 3], [f64; 3]) {
    let mu = 3.986_004_418e14_f64;
    let a = 7.0e6;
    let vc = (mu / a).sqrt();
    let inc = 51.6_f64.to_radians();
    ([a, 0.0, 0.0], [0.0, vc * inc.cos(), vc * inc.sin()])
}

fn tol() -> Tolerance {
    Tolerance {
        rtol: 1e-11,
        atol: 1e-9,
        ..Tolerance::default()
    }
}

#[allow(clippy::too_many_arguments)]
fn track(
    fm: &PreciseForceModel,
    r0: [f64; 3],
    v0: [f64; 3],
    n: usize,
    step: f64,
    sigma: f64,
    rng: &mut Lcg,
) -> Vec<Observation> {
    (1..=n)
        .map(|k| {
            let t = k as f64 * step;
            let (r, _v) = propagate(fm, r0, v0, t, &tol());
            let pos = if sigma > 0.0 {
                [
                    r[0] + sigma * rng.gauss(),
                    r[1] + sigma * rng.gauss(),
                    r[2] + sigma * rng.gauss(),
                ]
            } else {
                r
            };
            Observation {
                t,
                pos,
                sigma: sigma.max(1.0),
            }
        })
        .collect()
}

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

#[test]
fn the_srif_fit_matches_the_default_fit_on_a_noisy_arc() {
    let (r0t, v0t) = circular_leo();
    let fm = PreciseForceModel::egm2008(6, JD_J2000).third_body(true, true);
    let mut rng = Lcg(0x1234_5678);
    let obs = track(&fm, r0t, v0t, 90, 40.0, 5.0, &mut rng);
    let initial = EstimatedParams {
        r0: [r0t[0] + 80.0, r0t[1] + 60.0, r0t[2] - 40.0],
        v0: [v0t[0] - 0.05, v0t[1] + 0.07, v0t[2] - 0.03],
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        tol: tol(),
        ..FitConfig::default()
    };
    let a = fit(&fm, initial, &obs, &cfg).expect("default fit");
    let b = fit_srif(&fm, initial, &obs, &cfg).expect("srif fit");
    assert!(a.converged && b.converged);
    // The same recovery criteria as the default fit's test ...
    assert!((3.0..15.0).contains(&b.rms_3d), "rms {}", b.rms_3d);
    assert!(dist(b.params.r0, r0t) < 10.0);
    // ... and the same solution, to a millimetre on a metre-level recovery.
    assert!(
        dist(a.params.r0, b.params.r0) < 1e-3,
        "{:e} m",
        dist(a.params.r0, b.params.r0)
    );
    assert!(dist(a.params.v0, b.params.v0) < 1e-6);
    assert!((a.rms_3d - b.rms_3d).abs() < 1e-6);
}

#[test]
fn the_srif_fit_carries_the_empirical_a_priori_as_pseudo_measurements() {
    let (r0t, v0t) = circular_leo();
    let a_n = 3.0e-8;
    let emp_true = EmpiricalAccel {
        normal: [a_n, 0.0, 0.0],
        ..Default::default()
    };
    let fm_truth = PreciseForceModel::egm2008(4, JD_J2000)
        .third_body(true, false)
        .with_empirical(emp_true);
    let mut rng = Lcg(0xFEED_BEEF);
    let obs = track(&fm_truth, r0t, v0t, 70, 210.0, 0.0, &mut rng);
    let fm_fit = PreciseForceModel::egm2008(4, JD_J2000).third_body(true, false);
    let initial = EstimatedParams {
        r0: [r0t[0] + 40.0, r0t[1] - 20.0, r0t[2] + 15.0],
        v0: [v0t[0] + 0.02, v0t[1] - 0.015, v0t[2] + 0.01],
        cr: None,
        empirical: None,
    };
    for sigma in [1e-6, 1e-9] {
        // A loose prior (the data drives the estimate) and a tight one (the prior dominates and
        // the empirical tier is pulled to zero), so the pseudo-measurement weighting is exercised.
        let cfg = FitConfig {
            estimate_empirical: true,
            empirical_sigma: sigma,
            tol: tol(),
            ..FitConfig::default()
        };
        let a = fit(&fm_fit, initial, &obs, &cfg).expect("default fit");
        let b = fit_srif(&fm_fit, initial, &obs, &cfg).expect("srif fit");
        let ea = a.params.empirical.expect("empirical");
        let eb = b.params.empirical.expect("empirical");
        assert!(
            (ea.normal[0] - eb.normal[0]).abs() < 1e-3 * a_n,
            "sigma {sigma:e}: normal {:e} vs {:e}",
            ea.normal[0],
            eb.normal[0]
        );
        assert!(dist(a.params.r0, b.params.r0) < 1e-3);
        assert!((a.rms_3d - b.rms_3d).abs() < 1e-4 * a.rms_3d.max(1e-3));
    }
}
