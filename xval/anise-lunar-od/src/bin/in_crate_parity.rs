// SPDX-License-Identifier: AGPL-3.0-only
//! The comparison of `docs/design/evidence/fut05-de440-lunar-env/PREREGISTRATION.md`: the
//! in-crate opt-in `kshana::lunar_od::De440LunarEnvironment` (embedded DE440 PA orientation and
//! the crate's own SPK reader) against the ANISE `AniseLunarEnvironment` of this crate, on the
//! same `de440s.bsp` and `moon_pa_de440_200625.bpc`, at the 241 epochs of the LRO arc, then the
//! same LRO fit with each.
//!
//! Bars (fixed in the pre-registration): orientation <= 2.0e-6 rad; geocentric Moon <= 0.1 m and
//! Sun <= 2 m; the raw overlap and each tier's 3-D RMS within 0.10 m, both fits converged.
//!
//!     KSHANA_ANISE_DE440S=/path/de440s.bsp KSHANA_ANISE_MOON_PA=/path/moon_pa_de440_200625.bpc \
//!       cargo run --release --bin in-crate-parity

use kshana::ephem_provider::KernelEphemeris;
use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::lunar_od::{De440LunarEnvironment, LunarEnvironment, LunarForceModel};
use kshana::precise_od::{fit, propagate_samples, EstimatedParams, FitConfig, Observation};
use kshana_anise_lunar_od::{kernel, truth, AniseLunarEnvironment};

const GRGM: &str = include_str!("../../../../tests/fixtures/agency/lro/GRGM660PRIM_to150.gfc");
const FIT_DEGREE: usize = 100;

type Mat3 = [[f64; 3]; 3];

/// Rotation angle (rad) between two rotation matrices, from the Frobenius norm of the difference.
fn angle(a: &Mat3, b: &Mat3) -> f64 {
    let mut s = 0.0;
    for i in 0..3 {
        for j in 0..3 {
            s += (a[i][j] - b[i][j]).powi(2);
        }
    }
    2.0 * (s.sqrt() / (2.0 * 2f64.sqrt())).min(1.0).asin()
}

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// (raw overlap, dynamic RMS, dynamic converged, reduced-dynamic RMS, reduced converged).
fn fits<E: LunarEnvironment>(env: E) -> (f64, f64, bool, f64, bool) {
    let (epoch, obs, v0) = truth::observations(truth::LRO_CSV);
    let field = SphericalHarmonicField::from_gfc(GRGM, FIT_DEGREE).expect("GRGM field loads");
    let tmpl = LunarForceModel::with_env(field, epoch, env);
    let tol = Tolerance {
        rtol: 1e-10,
        atol: 1e-6,
        ..Default::default()
    };
    let initial = || EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: None,
        empirical: None,
    };
    let times: Vec<f64> = obs.iter().map(|o: &Observation| o.t).collect();
    let pred = propagate_samples(&tmpl, obs[0].pos, v0, &times, &tol);
    let raw = (obs
        .iter()
        .zip(&pred)
        .map(|(o, r)| (0..3).map(|k| (r[k] - o.pos[k]).powi(2)).sum::<f64>())
        .sum::<f64>()
        / obs.len() as f64)
        .sqrt();
    let cfg = FitConfig {
        estimate_cr: false,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let d = fit(&tmpl, initial(), &obs, &cfg).expect("dynamic fit");
    let cfg2 = FitConfig {
        estimate_cr: false,
        estimate_empirical: true,
        estimate_empirical_2cpr: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let r = fit(&tmpl, initial(), &obs, &cfg2).expect("reduced-dynamic fit");
    (raw, d.rms_3d, d.converged, r.rms_3d, r.converged)
}

fn main() {
    let (spk, bpc) = kernel::resolve_all().expect("set KSHANA_ANISE_DE440S and KSHANA_ANISE_MOON_PA");
    let anise = AniseLunarEnvironment::load(spk.to_str().unwrap(), bpc.to_str().unwrap())
        .expect("ANISE environment loads");
    let in_crate = De440LunarEnvironment::new(KernelEphemeris::open(&spk).expect("SPK opens"));
    println!("SPK sha256 {}", in_crate.kernel_sha256().unwrap_or("?"));

    let (epoch, obs, _) = truth::observations(truth::LRO_CSV);
    let (mut w_rot, mut w_moon, mut w_sun) = (0.0_f64, 0.0_f64, 0.0_f64);
    for o in &obs {
        let jd = epoch + o.t / 86_400.0;
        let a = anise.try_icrf_to_moon_pa(jd).expect("ANISE rotation");
        let k = in_crate.try_icrf_to_moon_pa(jd).expect("in-crate rotation");
        w_rot = w_rot.max(angle(&a, &k));
        let (sa, ma) = anise.try_geocentric_sun_moon(jd).expect("ANISE ephemeris");
        let (sk, mk) = in_crate.try_geocentric_sun_moon(jd).expect("in-crate ephemeris");
        w_moon = w_moon.max(dist(ma, mk));
        w_sun = w_sun.max(dist(sa, sk));
    }
    let ok = |v: f64, bar: f64| if v <= bar { "holds" } else { "OUTSIDE" };
    println!("epochs {}", obs.len());
    println!("1 orientation worst {w_rot:.3e} rad (bar 2.0e-6) {}", ok(w_rot, 2.0e-6));
    println!("2 Moon worst {w_moon:.3e} m (bar 0.1) {}", ok(w_moon, 0.1));
    println!("2 Sun  worst {w_sun:.3e} m (bar 2) {}", ok(w_sun, 2.0));

    let fa = fits(anise);
    let fk = fits(in_crate);
    println!(
        "3 ANISE    raw {:.3} m  dynamic {:.3} m (conv {})  reduced {:.3} m (conv {})",
        fa.0, fa.1, fa.2, fa.3, fa.4
    );
    println!(
        "3 in-crate raw {:.3} m  dynamic {:.3} m (conv {})  reduced {:.3} m (conv {})",
        fk.0, fk.1, fk.2, fk.3, fk.4
    );
    let (dr, dd, drd) = ((fa.0 - fk.0).abs(), (fa.1 - fk.1).abs(), (fa.3 - fk.3).abs());
    println!("3 |delta| raw {dr:.4} m {}", ok(dr, 0.10));
    println!("3 |delta| dynamic {dd:.4} m {}", ok(dd, 0.10));
    println!("3 |delta| reduced {drd:.4} m {}", ok(drd, 0.10));
    println!(
        "3 all converged: {}",
        fa.2 && fa.4 && fk.2 && fk.4
    );
}
