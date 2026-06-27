// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar differential PNT reference test (external oracle: RTKLIB relative/DGPS kernel).
//!
//! kshana's `lunar_dpnt` single-difference residual + WLS position solve is checked
//! against **RTKLIB** (tomojitakasu/RTKLIB, library version "2.4.2", git tag v2.4.2-p13,
//! commit 71db0ff; the 2.4.3 line shares this `rtkcmn.c` kernel verbatim — T. Takasu,
//! BSD 2-Clause). The oracle is compiled from `src/rtkcmn.c` with `-ULAPACK` (the pure-C
//! `matmul`/`matinv`/`ludcmp`/`lubksb` path, no BLAS/LAPACK linked) and uses RTKLIB's own
//! `dot()`/`norm()` for the line-of-sight vectors and `lsq()` (`x = (A·Aᵀ)⁻¹·A·y`, the
//! same normal-equations solver `pntpos.c::estpos()` drives) for the position fix.
//!
//! For each of 14 cases (baselines {0,1,10,50,100,250,500} km × seeds {42,7}, 8 sats),
//! the fixture carries the IDENTICAL injected geometry kshana's deterministic
//! `LunarDpntScenario` produces; this test reconstructs the inputs from the fixture,
//! calls the kshana public functions on them, and asserts agreement with the RTKLIB
//! outputs to:
//!   * per-satellite single-difference corrected residual  |Δ| < 1e-9 m, and
//!   * 3-D user position-error magnitude                    |Δ| < 1e-6 m
//! (relative, with a small absolute floor for the zero-baseline exact-cancellation case).
//!
//! HONEST SCOPE / INDEPENDENCE: the geometry (Keplerian sat positions, selenographic→MCMF,
//! injected orbit+clock errors) is kshana's own and is fed to the oracle as given numeric
//! inputs — it is NOT re-derived in C. What is independent is the COMPUTATION on it:
//! RTKLIB's compiled-C `dot`/`norm` for the LOS-difference residual and RTKLIB's
//! `lsq()`/`matinv()` LU inverse for the position solve, versus kshana's hand-rolled
//! `invert4`. Both implement the SAME first-order LOS-difference + (GᵀG)⁻¹Gᵀ WLS algebra,
//! so this is an internal-consistency / shared-algorithm cross-check between two
//! independent code bases and two independent 4×4 inverters. It catches algebra / indexing
//! / conditioning bugs on either side; it does NOT validate the modelling assumptions of
//! lunar differential PNT (those are MODELLED — see the module docs).

use kshana::lunar_dpnt::{
    corrected_user_range_errors, differential_corrections, user_position_error_m,
};

type Vec3 = [f64; 3];

const FIXTURE: &str = include_str!("fixtures/lunar_differential_pnt/lunar_differential_pnt_reference.txt");

/// Per-satellite single-difference residual tolerance (m).
const TOL_SD_M: f64 = 1e-9;
/// 3-D position-error magnitude tolerance (m), with a small absolute floor.
const TOL_POS_M: f64 = 1e-6;

struct Case {
    seed: u64,
    baseline_km: f64,
    n: usize,
    oracle_poserr_m: f64,
    oracle_sd_m: Vec<f64>,
    ref_mcmf: Vec3,
    user_mcmf: Vec3,
    sats: Vec<Vec3>,
    orbit_err: Vec<Vec3>,
    clock_err: Vec<f64>,
}

fn parse_cases() -> Vec<Case> {
    let mut cases = Vec::new();
    let mut lines = FIXTURE
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .peekable();

    while let Some(line) = lines.next() {
        let mut it = line.split_whitespace();
        let tag = it.next().unwrap();
        assert_eq!(tag, "CASE", "expected CASE header, got: {line}");
        let seed: u64 = it.next().unwrap().parse().unwrap();
        let baseline_km: f64 = it.next().unwrap().parse().unwrap();
        let n: usize = it.next().unwrap().parse().unwrap();

        // ORACLE seed baseline n poserr maxsd sd_0..sd_{n-1}
        let oline = lines.next().expect("ORACLE line");
        let mut o = oline.split_whitespace();
        assert_eq!(o.next().unwrap(), "ORACLE");
        let _oseed: u64 = o.next().unwrap().parse().unwrap();
        let _obase: f64 = o.next().unwrap().parse().unwrap();
        let _on: usize = o.next().unwrap().parse().unwrap();
        let oracle_poserr_m: f64 = o.next().unwrap().parse().unwrap();
        let _omax: f64 = o.next().unwrap().parse().unwrap();
        let oracle_sd_m: Vec<f64> = (0..n).map(|_| o.next().unwrap().parse().unwrap()).collect();

        let ref_mcmf = parse_vec3(lines.next().unwrap(), "REF");
        let user_mcmf = parse_vec3(lines.next().unwrap(), "USER");

        let mut sats = Vec::with_capacity(n);
        let mut orbit_err = Vec::with_capacity(n);
        let mut clock_err = Vec::with_capacity(n);
        for _ in 0..n {
            let sl = lines.next().unwrap();
            let mut s = sl.split_whitespace();
            assert_eq!(s.next().unwrap(), "SAT");
            let sx = [
                s.next().unwrap().parse().unwrap(),
                s.next().unwrap().parse().unwrap(),
                s.next().unwrap().parse().unwrap(),
            ];
            assert_eq!(s.next().unwrap(), "OE");
            let oe = [
                s.next().unwrap().parse().unwrap(),
                s.next().unwrap().parse().unwrap(),
                s.next().unwrap().parse().unwrap(),
            ];
            assert_eq!(s.next().unwrap(), "CE");
            let c: f64 = s.next().unwrap().parse().unwrap();
            sats.push(sx);
            orbit_err.push(oe);
            clock_err.push(c);
        }

        cases.push(Case {
            seed,
            baseline_km,
            n,
            oracle_poserr_m,
            oracle_sd_m,
            ref_mcmf,
            user_mcmf,
            sats,
            orbit_err,
            clock_err,
        });
    }
    cases
}

fn parse_vec3(line: &str, tag: &str) -> Vec3 {
    let mut it = line.split_whitespace();
    assert_eq!(it.next().unwrap(), tag, "expected {tag} line, got: {line}");
    [
        it.next().unwrap().parse().unwrap(),
        it.next().unwrap().parse().unwrap(),
        it.next().unwrap().parse().unwrap(),
    ]
}

#[test]
fn lunar_dpnt_matches_rtklib_relative_kernel() {
    let cases = parse_cases();
    assert!(
        cases.len() >= 8,
        "need >= 8 cases (planned grid), got {}",
        cases.len()
    );

    let mut worst_sd = 0.0_f64;
    let mut worst_pos = 0.0_f64;

    for c in &cases {
        // --- (1) per-satellite single-difference corrected residuals ---
        // kshana: differential_corrections (reference-station residual) then
        // corrected_user_range_errors (user raw minus correction). With noise-free
        // corrections this is exactly -e_i.(u_user - u_ref) -- the same SD the oracle forms.
        let corr = differential_corrections(c.ref_mcmf, &c.sats, &c.orbit_err, &c.clock_err);
        let sd = corrected_user_range_errors(
            c.user_mcmf,
            c.ref_mcmf,
            &c.sats,
            &c.orbit_err,
            &c.clock_err,
            &corr,
        );
        assert_eq!(sd.len(), c.n);
        for (i, (&k, &o)) in sd.iter().zip(&c.oracle_sd_m).enumerate() {
            let d = (k - o).abs();
            worst_sd = worst_sd.max(d);
            assert!(
                d < TOL_SD_M,
                "seed {} baseline {} km sat {i}: kshana SD {k:.17e} m vs RTKLIB {o:.17e} m (|Δ|={d:.3e} > {TOL_SD_M:.0e})",
                c.seed,
                c.baseline_km
            );
        }

        // --- (2) 3-D user position-error magnitude (corrected) ---
        let pos = user_position_error_m(
            c.user_mcmf,
            c.ref_mcmf,
            &c.sats,
            &c.orbit_err,
            &c.clock_err,
            true,
        )
        .expect("kshana position solve");
        let dp = (pos - c.oracle_poserr_m).abs();
        worst_pos = worst_pos.max(dp);
        assert!(
            dp < TOL_POS_M,
            "seed {} baseline {} km: kshana poserr {pos:.17e} m vs RTKLIB lsq() {:.17e} m (|Δ|={dp:.3e} > {TOL_POS_M:.0e})",
            c.seed,
            c.baseline_km,
            c.oracle_poserr_m
        );
    }

    eprintln!(
        "lunar_dpnt vs RTKLIB: {} cases | worst SD residual |Δ|={worst_sd:.3e} m (tol {TOL_SD_M:.0e}) | worst position |Δ|={worst_pos:.3e} m (tol {TOL_POS_M:.0e})",
        cases.len()
    );
}
