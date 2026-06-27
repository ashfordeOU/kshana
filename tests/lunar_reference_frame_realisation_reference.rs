// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the lunar reference-frame *realisation* (7-parameter
//! Helmert / similarity-transform fit) against an **independent closed-form
//! oracle**: a weighted Umeyama (Horn) SVD similarity-transform solution
//! implemented from scratch in numpy/scipy (numpy 2.4.6, scipy 1.18.0).
//!
//! The fit problem -- given two point sets `p` (estimated frame) and `q` (datum
//! frame) related by `q = t + (1+s)*R(theta)*p`, recover the 7 parameters
//! `[tx,ty,tz, theta_x,theta_y,theta_z, s]` and the post-fit RMS residual -- has
//! a unique least-squares solution, so an independent estimator is a genuine
//! external oracle. The oracle uses a *closed-form SVD* (Umeyama 1991, eqns
//! 34-42 / Horn 1987): centroid-subtract, cross-covariance, SVD, proper-rotation
//! reflection fix, optimal scale `s = trace(D S)/var_p`, `t = mu_q - s R mu_p`.
//! kshana instead solves the same fit with an **iterative finite-difference
//! Gauss-Newton** over the explicit forward model with centroid-shift
//! conditioning. Two genuinely different algorithms, fed byte-identical point
//! networks, must agree -- the same library-vs-library validation the
//! lambert/scipy/klobuchar fixtures use.
//!
//! The oracle returns the rotation as an orthogonal matrix and converts it to
//! kshana's 3-angle `[theta_x,theta_y,theta_z]` parameterisation by inverting
//! the SOFA composition `R = rz(tz)*ry(ty)*rx(tx)` in closed form (verified
//! exact to ~1e-16 rad). Both p and q are committed in the fixture, so kshana is
//! fed the IDENTICAL points the oracle saw.
//!
//! HONEST SCOPE: this validates the *estimator* -- that kshana's iterative
//! Gauss-Newton Helmert fit recovers the same 7 parameters and post-fit RMS as
//! an independent closed-form SVD solution on identical synthetic noisy point
//! networks. It does NOT validate frame realisation against real lunar tracking
//! / VLBI data, and carries no claim of absolute lunar-frame accuracy.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/lunar_reference_frame_realisation/`.

use kshana::lunar_frame_realise::realise_frame;

const REF: &str = include_str!(
    "fixtures/lunar_reference_frame_realisation/lunar_reference_frame_realisation_reference.txt"
);

const PPB: f64 = 1.0e-9;

// --- tolerances ------------------------------------------------------------
// Noiseless: the two solvers must agree to near machine precision (kshana's
// Gauss-Newton step-norm floor is ~1e-8 stored units = ~10 nm / 10 nrad / 1e-8
// ppb, and the closed-form SVD is exact; both reproduce the injected transform).
const NL_TRANS_TOL_M: f64 = 1e-6;
const NL_ROT_TOL_RAD: f64 = 1e-9;
const NL_SCALE_TOL_PPB: f64 = 1e-3;
const NL_RMS_TOL_M: f64 = 1e-6;

// Noisy (sigma = 1 m): the two solvers see the SAME noisy data, so they must
// agree FAR tighter than the noise-limited recovery error. The only difference
// is iterative-GN-floor vs closed-form, so they agree to ~mm in translation,
// ~sub-nrad in rotation, ~sub-ppb in scale, and ~micron in post-fit RMS.
const N_TRANS_TOL_M: f64 = 1e-3;
const N_ROT_TOL_RAD: f64 = 1e-9;
const N_SCALE_TOL_PPB: f64 = 1.0;
const N_RMS_TOL_M: f64 = 1e-6;

fn parse_csv(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| x.trim().parse::<f64>().unwrap())
        .collect()
}

fn to_points(flat: &[f64]) -> Vec<[f64; 3]> {
    assert!(flat.len() % 3 == 0, "point flat len {} not /3", flat.len());
    flat.chunks_exact(3).map(|c| [c[0], c[1], c[2]]).collect()
}

#[derive(Default)]
struct CaseRow {
    n: usize,
    sigma_m: f64,
    t: [f64; 3],
    theta: [f64; 3],
    scale_ppb: f64,
    rms_m: f64,
    p: Vec<[f64; 3]>,
    q: Vec<[f64; 3]>,
}

#[test]
fn lunar_frame_realise_matches_umeyama_svd() {
    use std::collections::HashMap;
    // First pass: collect CASE / PTS / QTS by name.
    let mut cases: HashMap<String, CaseRow> = HashMap::new();
    let mut order: Vec<String> = Vec::new();

    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("CASE ") {
            // name | n | sigma_m | tx,ty,tz | thx,thy,thz | scale_ppb | rms_m
            let parts: Vec<&str> = rest.splitn(7, '|').collect();
            assert_eq!(parts.len(), 7, "CASE row needs 7 fields: {line}");
            let name = parts[0].trim().to_string();
            let n: usize = parts[1].trim().parse().unwrap();
            let sigma_m: f64 = parts[2].trim().parse().unwrap();
            let t = parse_csv(parts[3]);
            let th = parse_csv(parts[4]);
            let scale_ppb: f64 = parts[5].trim().parse().unwrap();
            let rms_m: f64 = parts[6].trim().parse().unwrap();
            assert_eq!(t.len(), 3);
            assert_eq!(th.len(), 3);
            order.push(name.clone());
            cases.insert(
                name,
                CaseRow {
                    n,
                    sigma_m,
                    t: [t[0], t[1], t[2]],
                    theta: [th[0], th[1], th[2]],
                    scale_ppb,
                    rms_m,
                    ..Default::default()
                },
            );
        } else if let Some(rest) = line.strip_prefix("PTS ") {
            let parts: Vec<&str> = rest.splitn(2, '|').collect();
            assert_eq!(parts.len(), 2, "PTS row needs name|data: {line}");
            let name = parts[0].trim();
            let pts = to_points(&parse_csv(parts[1]));
            cases.get_mut(name).expect("PTS before CASE").p = pts;
        } else if let Some(rest) = line.strip_prefix("QTS ") {
            let parts: Vec<&str> = rest.splitn(2, '|').collect();
            assert_eq!(parts.len(), 2, "QTS row needs name|data: {line}");
            let name = parts[0].trim();
            let pts = to_points(&parse_csv(parts[1]));
            cases.get_mut(name).expect("QTS before CASE").q = pts;
        }
    }

    let mut n_cases = 0usize;
    let mut worst_trans = 0.0_f64;
    let mut worst_rot = 0.0_f64;
    let mut worst_scale = 0.0_f64;
    let mut worst_rms = 0.0_f64;

    for name in &order {
        let c = &cases[name];
        assert_eq!(c.p.len(), c.n, "{name}: PTS count != n");
        assert_eq!(c.q.len(), c.n, "{name}: QTS count != n");

        let noiseless = c.sigma_m == 0.0;
        let (trans_tol, rot_tol, scale_tol, rms_tol) = if noiseless {
            (
                NL_TRANS_TOL_M,
                NL_ROT_TOL_RAD,
                NL_SCALE_TOL_PPB,
                NL_RMS_TOL_M,
            )
        } else {
            (N_TRANS_TOL_M, N_ROT_TOL_RAD, N_SCALE_TOL_PPB, N_RMS_TOL_M)
        };

        // kshana fit on the IDENTICAL committed points. Use the noise sigma as
        // the per-coordinate measurement sigma (floored as kshana does); the
        // weighted normal equations with a single isotropic sigma reduce to the
        // ordinary-LS solution the oracle computes (weights cancel), so the
        // sigma choice does not change the recovered parameters.
        let sigma_fit = c.sigma_m.max(1e-3);
        let realised = realise_frame(&c.p, &c.q, sigma_fit)
            .unwrap_or_else(|| panic!("{name}: kshana realise_frame returned None"));
        let d = realised.datum;

        // Translation.
        for k in 0..3 {
            let dlt = (d.translation_m[k] - c.t[k]).abs();
            worst_trans = worst_trans.max(dlt);
            assert!(
                dlt <= trans_tol,
                "CASE {name}: t[{k}] kshana {:.6e} vs Umeyama {:.6e} (|Delta|={:.3e} > {:.1e} m)",
                d.translation_m[k],
                c.t[k],
                dlt,
                trans_tol
            );
        }
        // Rotation.
        for k in 0..3 {
            let dlt = (d.rotation_rad[k] - c.theta[k]).abs();
            worst_rot = worst_rot.max(dlt);
            assert!(
                dlt <= rot_tol,
                "CASE {name}: theta[{k}] kshana {:.6e} vs Umeyama {:.6e} (|Delta|={:.3e} > {:.1e} rad)",
                d.rotation_rad[k],
                c.theta[k],
                dlt,
                rot_tol
            );
        }
        // Scale (ppb).
        let dscale = (d.scale_ppb - c.scale_ppb).abs();
        worst_scale = worst_scale.max(dscale);
        assert!(
            dscale <= scale_tol,
            "CASE {name}: scale kshana {:.6e} ppb vs Umeyama {:.6e} ppb (|Delta|={:.3e} > {:.1e} ppb)",
            d.scale_ppb,
            c.scale_ppb,
            dscale,
            scale_tol
        );
        // Post-fit RMS residual (m).
        let drms = (realised.rms_residual_m - c.rms_m).abs();
        worst_rms = worst_rms.max(drms);
        assert!(
            drms <= rms_tol,
            "CASE {name}: rms kshana {:.9e} m vs Umeyama {:.9e} m (|Delta|={:.3e} > {:.1e} m)",
            realised.rms_residual_m,
            c.rms_m,
            drms,
            rms_tol
        );

        // Sanity: scale stored as ppb must round-trip to the dimensionless level.
        assert!(
            (d.scale_ppb * PPB).is_finite(),
            "CASE {name}: non-finite scale"
        );

        n_cases += 1;
    }

    assert!(
        n_cases >= 12,
        "expected >=12 frame-realisation cases, got {n_cases}"
    );
    eprintln!(
        "lunar_reference_frame_realisation: {n_cases} cases vs closed-form Umeyama SVD; \
         worst |Delta| trans={worst_trans:.3e} m, rot={worst_rot:.3e} rad, \
         scale={worst_scale:.3e} ppb, rms={worst_rms:.3e} m"
    );
}
