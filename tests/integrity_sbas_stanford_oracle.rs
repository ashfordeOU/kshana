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

//!
//! # Amendment 1 (committed before any protection level was produced)
//!
//! The first driver run stopped inside MAAST's L1 message reader: `maast_messages_2019_365.mat`
//! holds only the L5 (dual-frequency) channel of GEO PRN 131 (its `sbas.band` is `L5`), so it
//! has no L1 messages. No protection level was computed. The inputs are amended as follows; the
//! quantity, the Kshana side, the K rescaling and the 1e-4 m bar are unchanged.
//! - Case L1 (DO-229E single frequency): MAAST's other recorded real broadcast,
//!   `sbas_messages_2020_001.mat` (15 GEO channels, L1, 2020-01-01), primary source GEO PRN 131
//!   (WAAS), `dual_freq` 0, epochs time of week 259200 + 600 s to + 3600 s every 300 s.
//! - Case L5 (dual-frequency L1/L5): `maast_messages_2019_365.mat` (GEO PRN 131, L5), exactly
//!   MAAST's execution-test configuration (`dual_freq` 1, release 51 CY18 mask) with
//!   authentication off, epochs time of week 259800 s to 262800 s every 300 s (the file spans
//!   258905 s to 263104 s and the reader needs up to 600 s of earlier messages). Here MAAST forms
//!   sigma^2 = sigma_flt^2 + sigma_UIRE^2 (its dual-frequency fixed term) + sigma_air^2 *
//!   (f1^4 + f5^4) / (f1^2 - f5^2)^2 + sigma_tropo^2. The driver records the four terms before
//!   that scaling; Kshana is fed sigma_air = sqrt(sigma_air^2) *
//!   `kshana::sbas::iono_free_l1l5_noise_factor()`, so its L1/L5 ionosphere-free noise factor
//!   is part of the comparison.

//!
//! # Amendment 2 (committed before any protection level was produced)
//!
//! Both amended runs again stopped inside MAAST's message readers, before any protection level:
//! - L1: MAAST's start-up check of the ionospheric grid mask (`init_read_sbas_L1msgs.m`) counts
//!   every stored type-18 (MT18) entry, including its three-deep per-band history, and demands
//!   that the count equal the broadcast number of bands (5 for WAAS on 2020-01-01). Any start
//!   time with a band received twice in the preceding 600 s therefore fails. The L1 case now
//!   starts one second after the fifth MT18 of the file (MT18 for bands 3, 2, 1, 0, 9 at time of
//!   week 258652, 258688, 258719, 258779, 258802 s), at t0 = 258803 s, epochs t0 + 300 k s for
//!   k = 0..10. The rule is fixed by the message times alone.
//! - L5: MAAST's L5 decoder dereferences the TESLA receiver object even with authentication
//!   off, so the L5 case uses MAAST's execution-test configuration unchanged, authentication
//!   included (`AUTHENTICATION_ENABLED` true, `SenderTESLA_AMAC36`/`ReceiverTESLA_AMAC36`,
//!   `TEST_TESLA_AUTH` true).
//!
//! Neither change touches the protection-level chain under comparison; quantity, Kshana side,
//! K rescaling and the 1e-4 m bar are unchanged.

/// Tolerance (m) on VPL and HPL after the stated K rescaling.
pub const TOL_PL_M: f64 = 1e-4;
/// MAAST's rounded vertical precision-approach K-factor (`init_mops.m`, `MOPS_KV_PA`).
pub const MAAST_KV_PA: f64 = 5.33;

#[test]
#[ignore = "pre-registered; not yet run"]
fn sbas_protection_levels_match_stanford_maast_on_real_waas_messages() {
    unimplemented!("pre-registered; the comparison body lands with the fixture");
}
