// SPDX-License-Identifier: AGPL-3.0-only
//! Snapshot Receiver Autonomous Integrity Monitoring (RAIM): fault detection and exclusion
//! decisions against RTKLIB's `raim_fde`, and slope-based protection levels against an
//! independent evaluation with RTKLIB's matrix routines and SciPy's non-central chi-squared law.
//!
//! # Pre-registration (written and committed before the fixture is generated or the oracle run)
//!
//! **Oracle.** RTKLIB v2.4.2-p13 (<https://github.com/tomojitakasu/RTKLIB>, commit 71db0ffa,
//! BSD-2-Clause, copyright T. Takasu), built at `$RTKLIB`. A small C harness,
//! `xval/rtklib-raim/raim_harness.c`, compiles against RTKLIB's sources as a separate program
//! (it includes `pntpos.c` to reach the file-static `estpos`, `valsol` and `raim_fde`); no RTKLIB
//! code enters the crate. SciPy (the oracle Python environment `$ORACLE_PY`, BSD-3-Clause)
//! supplies the chi-squared quantile and the non-central chi-squared law.
//!
//! **Inputs.** The real observations already in the oracle data and the repository:
//! `tests/fixtures/joint_pvt_itrf_rtklib_oracle/abmf_2018133_300s_GE_C1C.rnx` (IGS station ABMF,
//! 2018-05-13, every 300 s) with the broadcast ephemerides `brdc_2018133_G_Einav.rnx`, GPS
//! satellites only, C1C pseudoranges, 10 degree elevation mask. Before RTKLIB sees them, the
//! pseudoranges are corrected by RTKLIB's own Klobuchar (`ionmodel`, the file's GPSA/GPSB) and
//! Saastamoinen (`tropmodel`) models evaluated at the station's ITRF2020 coordinate, and the
//! solver runs with ionosphere and troposphere options OFF.
//!
//! **Uniform weighting, stated.** Kshana's snapshot RAIM assumes one common measurement sigma.
//! RTKLIB weights each pseudorange by `varerr + vare + vmeas + vion + vtrp`; the harness makes
//! this uniform: `err = [1, 1, 0]` (so `varerr` = 1 m^2 at every elevation), the
//! ephemeris variance `vare` set to 0 for every satellite, `vmeas` = ERR_CBIAS^2 = 0.09 m^2,
//! `vion` = ERR_ION^2 = 25 m^2 and `vtrp` = ERR_TROP^2 = 9 m^2 (the OFF-option constants), so
//! sigma^2 = 35.09 m^2 for every satellite, and the same sigma is given to Kshana. The GDOP
//! validity check is disabled (`maxgdop` 1e9) so that only the chi-squared test decides.
//!
//! **Cases.** Every epoch with at least 6 GPS satellites above the mask: the fault-free case,
//! and six injected-bias cases with a bias of 10, 20, 30, 40, 60 and 100 m (signs alternating)
//! added to the pseudorange of one satellite chosen deterministically, index
//! `(7 * epoch + j) mod n` for the j-th magnitude.
//!
//! **Quantities and bars.**
//! 1. Detection: RTKLIB's all-in-view `estpos`/`valsol` chi-squared failure (its tabulated
//!    chi-squared at alpha = 0.001) against `kshana::raim::snapshot_raim(...).fault_detected` with
//!    P_fa = 0.001, given RTKLIB's converged all-in-view position, the satellites' transmit-time
//!    Earth-fixed positions RTKLIB used, RTKLIB's post-fit residuals and sigma. Bar: identical
//!    decisions on 100 % of cases.
//! 2. Exclusion: on detected cases, RTKLIB `raim_fde` (each single-satellite exclusion re-solved
//!    and accepted when its own chi-squared test passes; the accepted subset with the smallest
//!    residual root-mean-square wins; or no exclusion) against Kshana's snapshot exclusion on the
//!    same inputs. Bar: identical excluded satellite (or identical "none") on 100 % of cases.
//! 3. Slope protection levels on every fault-free case: Kshana `snapshot_raim` HPL and VPL with
//!    P_fa = 0.001 and P_md = 0.001 against the oracle HPL/VPL = max_i slope_i * sqrt(lambda) *
//!    sigma, with the slopes formed from RTKLIB's `matinv`/`matmul` on the unweighted geometry
//!    rotated by RTKLIB's `xyz2enu` (geodetic local level), and lambda from SciPy:
//!    `ncx2.cdf(chi2.ppf(1 - P_fa, n - 4), n - 4, lambda) = P_md` solved by `brentq`. Bar:
//!    |dHPL|, |dVPL| <= 1e-6 m on every case.
//!
//! **Pre-registered ambiguity band.** RTKLIB's chi-squared table is rounded to three or four
//! significant figures (for example 10.8 for one degree of freedom against the exact 10.828). A
//! decision whose RTKLIB test statistic lies between the table value and the exact quantile
//! (SciPy `chi2.ppf(0.999, dof)`) is decided by the rounding, not the algorithm; such cases are
//! listed, counted, and excluded from the 100 % bars. Every other case counts.
//!
//! **Caveat (stated).** For quantity 3 both sides evaluate the same closed form
//! (slope_i = ||S_pos,i|| / sqrt(1 - P_ii), Parkinson and Axelrad; Brown). The oracle checks
//! the implementation (geometry, local-level frame, matrix algebra and the non-central
//! chi-squared inversion) with independent code, not the choice of formula.

//!
//! # Implementation notes (fixed in the harness and the engine before the oracle was first run)
//!
//! - Kshana had no snapshot exclusion function; `kshana::raim::snapshot_raim_fde` was added
//!   with the rule stated above (exclusions linearised at the all-in-view position).
//! - `snapshot_raim` formed its protection levels on a geocentric (radial) local level; it now
//!   uses the geodetic (WGS-84 ellipsoid-normal) local level, the frame in which HPL and VPL are
//!   defined and the one RTKLIB's `xyz2enu` uses. Both changes were made before the harness was
//!   run. The geocentric frame, restored as a mutation, misses the slope bar by 0.31 m (HPL)
//!   and 0.14 m (VPL).
//! - Cases are indexed by the counted epochs (epochs with at least 6 GPS satellites used in the
//!   fault-free solution), and the j-th magnitude is j = 0..5 in the order listed. The
//!   satellite positions come from the recorded (unbiased) pseudoranges and are shared by the
//!   seven cases of an epoch; every case uses the satellites of the fault-free solution.
//!
//! # Result (2026-10-01)
//!
//! 288 epochs, 2016 cases. Detection: 2016/2016 identical (none in the ambiguity band).
//! Exclusion: 801/801 detected cases identical (none in the band). Slope protection levels on
//! the 288 fault-free cases: worst |dHPL| 2.7e-12 m, |dVPL| 2.5e-12 m against 1e-6 m.

/// Tolerance (m) on the slope-based HPL and VPL.
pub const TOL_SLOPE_PL_M: f64 = 1e-6;
/// Probability of false alarm (RTKLIB's chi-squared table is alpha = 0.001).
pub const P_FA: f64 = 1e-3;
/// Probability of missed detection used for the slope protection levels.
pub const P_MD: f64 = 1e-3;
/// The uniform pseudorange variance (m^2) the harness forces on RTKLIB.
pub const SIGMA2_M2: f64 = 35.09;

use kshana::raim::{snapshot_raim, snapshot_raim_fde};
use std::collections::BTreeMap;

const FIXTURE_DIR: &str = "tests/fixtures/integrity_snapshot_raim_rtklib_oracle";

/// One harness case: RTKLIB's all-in-view outcome and the inputs Kshana is given.
struct Case {
    n: usize,
    user: [f64; 3],
    rtklib_detected: bool,
    rtklib_other_failure: Option<String>,
    vv: f64,
    fde_excluded_prn: Option<usize>,
    sats: Vec<(usize, [f64; 3], f64)>,
}

fn csv(name: &str) -> Vec<Vec<String>> {
    std::fs::read_to_string(format!("{FIXTURE_DIR}/{name}"))
        .unwrap_or_else(|e| panic!("{name}: {e}"))
        .lines()
        .skip(1)
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

fn load_cases() -> BTreeMap<(usize, usize), Case> {
    let mut out = BTreeMap::new();
    for f in csv("rtklib_raim_cases.csv") {
        let p = |i: usize| f[i].parse::<f64>().unwrap();
        let ok = f[9] == "1";
        let chi = f[10].contains("chi-square");
        out.insert(
            (f[0].parse().unwrap(), f[1].parse().unwrap()),
            Case {
                n: f[3].parse().unwrap(),
                user: [p(6), p(7), p(8)],
                rtklib_detected: !ok && chi,
                rtklib_other_failure: (!ok && !chi).then(|| f[10].clone()),
                vv: p(11),
                fde_excluded_prn: (f[13] == "1").then(|| f[14].parse().unwrap()),
                sats: Vec::new(),
            },
        );
    }
    for f in csv("rtklib_raim_sats.csv") {
        let p = |i: usize| f[i].parse::<f64>().unwrap();
        out.get_mut(&(f[0].parse().unwrap(), f[1].parse().unwrap()))
            .expect("case of a satellite row")
            .sats
            .push((f[2].parse().unwrap(), [p(3), p(4), p(5)], p(6)));
    }
    out
}

/// The exact chi-squared quantile at 1 - P_FA per degree of freedom (SciPy).
fn exact_quantiles() -> BTreeMap<usize, f64> {
    csv("scipy_chi2_quantile.csv")
        .into_iter()
        .map(|f| (f[0].parse().unwrap(), f[1].parse().unwrap()))
        .collect()
}

/// RTKLIB's alpha = 0.001 table (`chisqr[]` in rtkcmn.c), degrees of freedom 1..=30.
const RTKLIB_CHISQR: [f64; 30] = [
    10.8, 13.8, 16.3, 18.5, 20.5, 22.5, 24.3, 26.1, 27.9, 29.6, 31.3, 32.9, 34.5, 36.1, 37.7, 39.3,
    40.8, 42.3, 43.8, 45.3, 46.8, 48.3, 49.7, 51.2, 52.6, 54.1, 55.5, 56.9, 58.3, 59.7,
];

/// True when a statistic lies between RTKLIB's rounded table value and the exact quantile.
fn in_band(vv: f64, dof: usize, exact: &BTreeMap<usize, f64>) -> bool {
    let (a, b) = (RTKLIB_CHISQR[dof - 1], exact[&dof]);
    vv > a.min(b) && vv <= a.max(b)
}

#[test]
fn snapshot_raim_decisions_and_slope_levels_match_rtklib() {
    let cases = load_cases();
    let exact = exact_quantiles();
    let subsets = csv("rtklib_raim_subsets.csv");
    let sigma = SIGMA2_M2.sqrt();
    let (mut det_n, mut det_band, mut exc_n, mut exc_band) = (0usize, 0usize, 0usize, 0usize);
    let (mut det_bad, mut exc_bad) = (Vec::new(), Vec::new());
    for (key, c) in &cases {
        assert!(
            c.rtklib_other_failure.is_none(),
            "{key:?}: RTKLIB estpos failed for a reason other than chi-squared: {:?}",
            c.rtklib_other_failure
        );
        assert_eq!(c.n, c.sats.len(), "{key:?}: satellite rows");
        let sats: Vec<[f64; 3]> = c.sats.iter().map(|s| s.1).collect();
        let resid: Vec<f64> = c.sats.iter().map(|s| s.2).collect();
        let k = snapshot_raim_fde(c.user, &sats, &resid, sigma, P_FA, P_MD)
            .unwrap_or_else(|| panic!("{key:?}: Kshana refused"));
        // 1. Detection.
        if in_band(c.vv, c.n - 4, &exact) {
            det_band += 1;
            continue;
        }
        det_n += 1;
        if k.all_in_view.fault_detected != c.rtklib_detected {
            det_bad.push(*key);
            continue;
        }
        // 2. Exclusion, on detected cases.
        if !c.rtklib_detected {
            continue;
        }
        let ambiguous = subsets.iter().any(|f| {
            f[0].parse::<usize>().unwrap() == key.0
                && f[1].parse::<usize>().unwrap() == key.1
                && f[4].parse::<usize>().unwrap() == c.n - 1
                && in_band(f[5].parse().unwrap(), c.n - 5, &exact)
        });
        if ambiguous {
            exc_band += 1;
            continue;
        }
        exc_n += 1;
        let kshana_prn = k.excluded.map(|i| c.sats[i].0);
        if kshana_prn != c.fde_excluded_prn {
            exc_bad.push((*key, kshana_prn, c.fde_excluded_prn));
        }
    }
    // 3. Slope protection levels on the fault-free cases.
    let (mut worst_h, mut worst_v, mut pl_n) = (0.0_f64, 0.0_f64, 0usize);
    for f in csv("scipy_slope_pl.csv") {
        let c = &cases[&(f[0].parse().unwrap(), 0)];
        let sats: Vec<[f64; 3]> = c.sats.iter().map(|s| s.1).collect();
        let resid: Vec<f64> = c.sats.iter().map(|s| s.2).collect();
        let r = snapshot_raim(c.user, &sats, &resid, sigma, P_FA, P_MD).expect("fault-free case");
        worst_h = worst_h.max((r.hpl_m - f[2].parse::<f64>().unwrap()).abs());
        worst_v = worst_v.max((r.vpl_m - f[3].parse::<f64>().unwrap()).abs());
        pl_n += 1;
    }
    eprintln!(
        "snapshot RAIM vs RTKLIB: detection {}/{det_n} agree ({det_band} in the ambiguity band); \
         exclusion {}/{exc_n} agree ({exc_band} in the band); slope PL on {pl_n} fault-free \
         cases: worst |dHPL| {worst_h:.3e} m, |dVPL| {worst_v:.3e} m",
        det_n - det_bad.len(),
        exc_n - exc_bad.len()
    );
    assert!(det_n > 0 && exc_n > 0 && pl_n > 0);
    assert!(det_bad.is_empty(), "detection differs at {det_bad:?}");
    assert!(
        exc_bad.is_empty(),
        "exclusion differs at (case, Kshana, RTKLIB) {exc_bad:?}"
    );
    assert!(
        worst_h <= TOL_SLOPE_PL_M && worst_v <= TOL_SLOPE_PL_M,
        "slope PL: worst |dHPL| {worst_h:.3e} m, |dVPL| {worst_v:.3e} m against {TOL_SLOPE_PL_M} m"
    );
}
