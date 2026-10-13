// SPDX-License-Identifier: AGPL-3.0-only
//! The 24 h **EGM2008 200×200** Cowell orbit against **Orekit 12.2** (FUT-07): the opt-in
//! `propagator::Geopotential` with the Holmes–Featherstone evaluator, against Orekit's
//! `HolmesFeatherstoneAttractionModel` + `DormandPrince853` over the same full ICGEM `EGM2008.gfc`,
//! both in an Earth-fixed frame rotated by the Earth rotation angle at UT1 = TT. Bars
//! pre-registered in `xval/cowell-tesseral-200-orekit/PREREGISTRATION.md` (0aa312a6); results in
//! `xval/cowell-tesseral-200-orekit/RESULTS.md`.
//!
//! **Data gate.** The full model (252 MB) is not bundled: fetch it with `scripts/fetch_egm2008.sh`
//! and point `KSHANA_EGM2008_GFC` at it. Without it the test prints a skip notice and passes; with
//! `KSHANA_REQUIRE_REALDATA=1` the skip is a failure.
//!
//! PIN-SCOPE:    the 145 Orekit states of tests/fixtures/high_degree_gravity/
//!               orekit_orbit_24h_egm2008_200.txt against the pre-registered |Δr| ≤ 0.5 m and
//!               |Δv| ≤ 5e-4 m/s bars, and the degree-70 sensitivity control, whose pre-registered
//!               > 1 m bar missed (0.726 m) and is pinned as a recorded miss.
//! PIN-EXCLUDES: every kshana report and scenario output; Earth-orientation fidelity; the default
//!               (non-tesseral) force model; degrees above 200 in an orbit.

use std::path::PathBuf;

use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::propagator::{propagate_dopri, FieldEvaluator, ForceModel, Geopotential};

const REF: &str = include_str!("fixtures/high_degree_gravity/orekit_orbit_24h_egm2008_200.txt");
const EPOCH_JD_TT: f64 = 2_460_311.0;
const POS_BAR_M: f64 = 0.5;
const VEL_BAR_M_S: f64 = 5.0e-4;
const CONTROL_MIN_MISS_M: f64 = 1.0;

type Vec3 = [f64; 3];

fn full_model() -> Option<PathBuf> {
    match std::env::var("KSHANA_EGM2008_GFC") {
        Ok(p) if std::path::Path::new(&p).is_file() => Some(PathBuf::from(p)),
        _ => {
            assert!(
                std::env::var("KSHANA_REQUIRE_REALDATA").as_deref() != Ok("1"),
                "KSHANA_REQUIRE_REALDATA=1 but KSHANA_EGM2008_GFC does not name a file"
            );
            println!(
                "SKIP: set KSHANA_EGM2008_GFC=/path/to/EGM2008.gfc (scripts/fetch_egm2008.sh) \
                 to run the 24 h 200x200 orbit comparison with Orekit"
            );
            None
        }
    }
}

fn reference() -> Vec<(f64, Vec3, Vec3)> {
    REF.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let v: Vec<f64> = l.split_whitespace().map(|x| x.parse().unwrap()).collect();
            (v[0], [v[1], v[2], v[3]], [v[4], v[5], v[6]])
        })
        .collect()
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// One integration continued in the reference's 600 s segments (pre-registered stepping).
fn run(gp: &Geopotential, refs: &[(f64, Vec3, Vec3)]) -> Vec<(Vec3, Vec3)> {
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let (mut r, mut v) = (refs[0].1, refs[0].2);
    let mut t_prev = 0.0;
    let mut out = Vec::with_capacity(refs.len());
    for &(t, _, _) in refs {
        if t > t_prev {
            let m = ForceModel::two_body()
                .with_geopotential(gp.clone())
                .third_body(false, false, EPOCH_JD_TT + t_prev / 86_400.0);
            (r, v) = propagate_dopri(r, v, t - t_prev, &m, &tol);
            t_prev = t;
        }
        out.push((r, v));
    }
    out
}

fn worst(refs: &[(f64, Vec3, Vec3)], ours: &[(Vec3, Vec3)]) -> (f64, f64) {
    refs.iter()
        .zip(ours)
        .fold((0.0_f64, 0.0_f64), |w, (&(_, ro, vo), &(r, v))| {
            (w.0.max(dist(ro, r)), w.1.max(dist(vo, v)))
        })
}

#[test]
fn egm2008_200_orbit_matches_orekit_over_24h() {
    let Some(path) = full_model() else { return };
    let refs = reference();
    assert_eq!(refs.len(), 145, "reference state count");
    let field = SphericalHarmonicField::from_gfc_file(&path, 200).expect("load EGM2008 to 200");
    assert_eq!(field.nmax, 200);
    let hf = Geopotential::new(field).with_evaluator(FieldEvaluator::HolmesFeatherstone);
    let ours = run(&hf, &refs);
    let (wr, wv) = worst(&refs, &ours);
    println!("HF 200x200: worst |dr| = {wr:.4} m, |dv| = {wv:.3e} m/s");

    // Reported, no bar: the classic evaluator on the same field.
    let classic = Geopotential {
        evaluator: FieldEvaluator::Classic,
        ..hf.clone()
    };
    let (cr, cv) = worst(&refs, &run(&classic, &refs));
    println!("classic 200x200 (reported): worst |dr| = {cr:.4} m, |dv| = {cv:.3e} m/s");

    // Sensitivity control: the degree-70 truncation must miss the 24 h state by > 1 m.
    let f70 = SphericalHarmonicField::from_gfc_file(&path, 70).expect("load EGM2008 to 70");
    let c70 = run(
        &Geopotential::new(f70).with_evaluator(FieldEvaluator::HolmesFeatherstone),
        &refs,
    );
    let miss70 = dist(c70.last().unwrap().0, refs.last().unwrap().1);
    println!("degree-70 control misses the 24 h state by {miss70:.3} m");

    assert!(wr <= POS_BAR_M, "|dr| {wr} m > {POS_BAR_M}");
    assert!(wv <= VEL_BAR_M_S, "|dv| {wv} m/s > {VEL_BAR_M_S}");
    // The pre-registered control MISSED on the first run (0.726 m, below 1 m): recorded in
    // RESULTS.md. Pin the miss so a change in its outcome forces the record to be updated.
    assert!(
        miss70 <= CONTROL_MIN_MISS_M,
        "degree-70 control now {miss70} m > {CONTROL_MIN_MISS_M} m: update RESULTS.md"
    );
}
