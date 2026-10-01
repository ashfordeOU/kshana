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

/// Tolerance (m) on the slope-based HPL and VPL.
pub const TOL_SLOPE_PL_M: f64 = 1e-6;
/// Probability of false alarm (RTKLIB's chi-squared table is alpha = 0.001).
pub const P_FA: f64 = 1e-3;
/// Probability of missed detection used for the slope protection levels.
pub const P_MD: f64 = 1e-3;
/// The uniform pseudorange variance (m^2) the harness forces on RTKLIB.
pub const SIGMA2_M2: f64 = 35.09;

#[test]
#[ignore = "pre-registered; not yet run"]
fn snapshot_raim_decisions_and_slope_levels_match_rtklib() {
    unimplemented!("pre-registered; the comparison body lands with the fixture");
}
