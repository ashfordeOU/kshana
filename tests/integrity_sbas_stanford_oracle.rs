// SPDX-License-Identifier: AGPL-3.0-only
//! Satellite-Based Augmentation System (SBAS) protection levels (RTCA DO-229E) against Stanford
//! MAAST (the MATLAB Algorithm Availability Simulation Tool) driven by real Wide Area
//! Augmentation System (WAAS) messages.
//!
//! # Pre-registration (written and committed before the fixture is generated or the oracle run)
//!
//! **Quantity.** For every (epoch, user) pair MAAST protects in precision-approach mode: the
//! Vertical Protection Level (VPL) and the Horizontal Protection Level (HPL) of the DO-229E
//! weighted-least-squares protection-level equations.
//!
//! **Oracle.** Stanford GPS Laboratory MAAST (<https://github.com/stanford-gps-lab/maast>,
//! commit 7d32b049; its files carry the notice "This script file may be distributed and used
//! freely, provided this copyright notice is always kept with it", copyright the Board of
//! Trustees of the Leland Stanford Junior University). It is run as a separate tool under GNU
//! Octave 8.4 by the headless driver `xval/sbas-maast/run_maast_sbas.m`; none of its code is
//! vendored. Only derived numbers are committed, under
//! `tests/fixtures/integrity_sbas_stanford_oracle/` with a `NOTICE.md`.
//!
//! **Inputs.** MAAST's own recorded real WAAS broadcast, `maast_messages_2019_365.mat` (GEO PRN
//! 131), replayed through MAAST's message decoder and user chain (`svmrunpub` ->
//! `read_in_sbas_messages` -> `usrprocess` -> `usr_vhpl`) exactly as MAAST's own execution test
//! configures it (start GPS week 2086, time of week 259200 s, almanac `alm01jan2020.txt`, GEO
//! data row 131, release 51 CY18 ionospheric grid mask, MOPS airborne accuracy designator
//! model `af_cnmp_mops`, MOPS troposphere `af_trpmops`), but in the L1 single-frequency
//! precision-approach mode (`dual_freq` 0, `pa_mode` 1, authentication off), so the real
//! broadcast User Differential Range Error (UDRE) and Grid Ionospheric Vertical Error (GIVE)
//! values and their degradation terms set the variances. Users: MAAST's North-America polygon
//! `usrn_america.txt` on a 5 degree latitude/longitude grid. Epochs: time of week 259200 + 600 s
//! to + 3600 s every 300 s (11 epochs). For each protected user the driver records, per
//! satellite used, MAAST's East-North-Up line of sight and the four variance components MAAST
//! sums inside `usrprocess` (fast/long-term sigma_flt^2 including the degradation terms,
//! sigma_UIRE^2, sigma_tropo^2, sigma_air^2), and MAAST's resulting VPL and HPL.
//!
//! **Kshana side.** `kshana::sbas::sbas_protection_level` in `SbasMode::PrecisionApproach`, fed
//! the same satellites with elevation and azimuth taken from MAAST's line of sight and the four
//! sigma components (square roots of MAAST's variances) in `SbasErrorModel`.
//!
//! **Stated K rescaling.** MAAST uses the rounded MOPS constants K_V,PA = 5.33 and
//! K_H,PA = 6.0. Kshana's K_H,PA is also 6.0; its K_V,PA is the unrounded normal quantile
//! Phi^-1(1 - 5e-8) = 5.3267... (`kshana::sbas::k_v_pa`). The compared Kshana VPL is therefore
//! VPL_Kshana * 5.33 / k_v_pa(); the HPL is compared unscaled.
//!
//! **Tolerance and its source.** |VPL - VPL_MAAST| <= 1e-4 m and |HPL - HPL_MAAST| <= 1e-4 m on
//! every (epoch, user) pair: both tools evaluate the same closed form (an inverse of a weighted
//! normal matrix) on the same inputs, so any difference is round-off; 1e-4 m leaves four orders
//! of magnitude of margin over double-precision round-off on metre-level levels while still
//! detecting any modelling difference (a missing variance term, a wrong weight, a different
//! ellipse axis) many times over. The set of (epoch, user) pairs both tools protect must also
//! be equal.

/// Tolerance (m) on VPL and HPL after the stated K rescaling.
pub const TOL_PL_M: f64 = 1e-4;
/// MAAST's rounded vertical precision-approach K-factor (`init_mops.m`, `MOPS_KV_PA`).
pub const MAAST_KV_PA: f64 = 5.33;

#[test]
#[ignore = "pre-registered; not yet run"]
fn sbas_protection_levels_match_stanford_maast_on_real_waas_messages() {
    unimplemented!("pre-registered; the comparison body lands with the fixture");
}
