// SPDX-License-Identifier: AGPL-3.0-only
//! C3 procedure step 2 (`docs/design/evidence/c3-capstone-nrho-force-model/PREREGISTRATION.md`):
//! the M1 and M2 force models on synthetic data only. No CAPSTONE state and no kernel is read.
//!
//! - With the kernel switched off and nothing added, [`C3Model`] is the A2 model bit for bit,
//!   in its accelerations and in a propagation.
//! - The added point masses enter as the standard Moon-centred third-body terms.
//! - The radiation-pressure term matches its closed form in sunlight, and is zero in the
//!   umbra of the Earth and of the Moon.

use kshana::c3_force::{m2_srp_accel, AddedBodies, C3Model, MU_JUPITER_SYSTEM, MU_VENUS};
use kshana::ephem::AU_M;
use kshana::forces::{third_body_accel, SRP_PRESSURE_AU};
use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::lunar_od::{De440LunarEnvironment, LunarForceModel};
use kshana::precise_od::{propagate, ForceModel};

const TABLE: &str = "tests/fixtures/mission_thread_lunar/jggrx_0660b_sha_to150.tab";
// A synthetic epoch inside the embedded DE440 orientation span (2023-01-15 TDB).
const JD: f64 = 2_459_959.5;

fn field() -> SphericalHarmonicField {
    // Degree 8 keeps the test fast; the identity holds for any field.
    SphericalHarmonicField::from_shadr(&std::fs::read_to_string(TABLE).unwrap(), 8).unwrap()
}

// A synthetic NRHO-like state near apolune (m, m/s); not a CAPSTONE state.
const R0: [f64; 3] = [-1.2e7, 3.0e6, 6.5e7];
const V0: [f64; 3] = [120.0, -40.0, 15.0];

#[test]
fn with_the_kernel_off_the_model_is_a2_bit_for_bit() {
    let a2 = LunarForceModel::with_env(field(), JD, De440LunarEnvironment::orientation_only())
        .relativity();
    let c3 = C3Model::a2(field(), JD);
    for k in 0..24 {
        let t = 3_600.0 * k as f64;
        let r = [R0[0] + 1e5 * k as f64, R0[1], R0[2] - 2e5 * k as f64];
        let (x, y) = (a2.accel_rv(t, r, V0), c3.accel_rv(t, r, V0));
        for i in 0..3 {
            assert_eq!(x[i].to_bits(), y[i].to_bits(), "t {t} axis {i}");
        }
    }
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        h_min: 1e-3,
        h_max: 60.0,
    };
    let (ra, va) = propagate(&a2, R0, V0, 6.0 * 3_600.0, &tol);
    let (rc, vc) = propagate(&c3, R0, V0, 6.0 * 3_600.0, &tol);
    for i in 0..3 {
        assert_eq!(ra[i].to_bits(), rc[i].to_bits());
        assert_eq!(va[i].to_bits(), vc[i].to_bits());
    }
}

#[derive(Debug)]
struct Fixed([[f64; 3]; 2]);
impl AddedBodies for Fixed {
    fn moon_centred(&self, _jd: f64) -> [[f64; 3]; 2] {
        self.0
    }
}

#[test]
fn the_added_bodies_are_moon_centred_third_body_terms() {
    let venus = [1.0e11, -4.0e10, 2.0e10];
    let jup = [-6.0e11, 3.5e11, 1.5e11];
    let base = C3Model::a2(field(), JD);
    let mut m1 = base.clone();
    m1.added = Some(std::sync::Arc::new(Fixed([venus, jup])));
    let a0 = base.accel_rv(0.0, R0, V0);
    let a1 = m1.accel_rv(0.0, R0, V0);
    let (tv, tj) = (
        third_body_accel(R0, venus, MU_VENUS),
        third_body_accel(R0, jup, MU_JUPITER_SYSTEM),
    );
    for i in 0..3 {
        assert_eq!(a1[i].to_bits(), ((a0[i] + tv[i]) + tj[i]).to_bits());
    }
    // Sizes: tidal terms of order GM·r/d³ (about 1e-11 m/s² for Venus here), small but not zero.
    let n = |x: [f64; 3]| (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
    assert!(n(tv) > 0.0 && n(tv) < 1e-10, "{}", n(tv));
    assert!(n(tj) > 0.0 && n(tj) < 1e-10, "{}", n(tj));
}

#[test]
fn radiation_pressure_matches_its_closed_form_in_sunlight() {
    let k = 0.02; // m²/kg
    let sun = [AU_M, 0.0, 0.0];
    let earth = [0.0, 3.844e8, 0.0];
    let r = [0.0, -5.0e7, 1.0e7];
    let a = m2_srp_accel(r, sun, earth, k);
    let d = [r[0] - sun[0], r[1] - sun[1], r[2] - sun[2]];
    let dn = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
    let mag = SRP_PRESSURE_AU * k * (AU_M / dn).powi(2);
    for i in 0..3 {
        let want = mag * d[i] / dn;
        assert!(
            (a[i] - want).abs() <= 1e-13 * mag,
            "axis {i}: {} vs {want}",
            a[i]
        );
    }
    // About 1361/c · 0.02 = 9.08e-8 m/s² at 1 au.
    assert!((mag - 1361.0 / 299_792_458.0 * k).abs() < 1e-3 * mag);
}

#[test]
fn radiation_pressure_is_zero_in_the_umbra_of_the_earth_and_of_the_moon() {
    let k = 0.02;
    let sun = [0.0, AU_M, 0.0];
    let earth = [-3.844e8, 0.0, 0.0];
    // 10 000 km behind the Earth from the Sun.
    let behind_earth = [earth[0], earth[1] - 1.0e7, 0.0];
    assert_eq!(m2_srp_accel(behind_earth, sun, earth, k), [0.0; 3]);
    // 5 000 km behind the Moon.
    assert_eq!(m2_srp_accel([0.0, -5.0e6, 0.0], sun, earth, k), [0.0; 3]);
    // Sunward of the Moon at the same distance: lit.
    assert_ne!(m2_srp_accel([0.0, 5.0e6, 0.0], sun, earth, k), [0.0; 3]);
}

#[test]
fn m2_adds_only_the_radiation_term_to_its_base() {
    let base = C3Model::a2(field(), JD);
    let m2 = base.clone().with_srp(0.01);
    let (a0, a2) = (base.accel_rv(0.0, R0, V0), m2.accel_rv(0.0, R0, V0));
    let d: Vec<f64> = (0..3).map(|i| a2[i] - a0[i]).collect();
    let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
    // Of order 1361/c · 0.01 ≈ 4.5e-8 m/s² (lit), or zero in shadow.
    assert!(n == 0.0 || (n > 3e-8 && n < 6e-8), "{n}");
}
