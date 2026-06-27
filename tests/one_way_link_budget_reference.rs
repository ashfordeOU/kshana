// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the one-way deep-space **link budget** against published
//! design-control-table (DCT) vectors — a **published-vectors** oracle, the same
//! pattern the Klobuchar test uses against pinned RTKLIB outputs.
//!
//! Two oracles, both transcribed from the literature (no Kshana code produced
//! the reference numbers):
//!
//! 1. **DESCANSO / JPL Galileo X-band Table 1-1** — J. H. Yuen (ed.), *Deep
//!    Space Telecommunications Systems Engineering* (DESCANSO, JPL Publication
//!    82-76), Table 1-1: the Galileo X-band (8420.43 MHz) downlink at 6.37 AU
//!    (R = 9.529e8 km). The table's **published totals** are free-space loss
//!    `L_fs = 290.54 dB` and received carrier-to-noise density
//!    `Pr/N0 = 54.6 dB-Hz`. These are real totals computed by JPL telecom
//!    engineers — the genuine external authority for the link-equation assembly
//!    `C/N0 = EIRP - L_fs - L_other + G/T - k`. The DCT's component line items
//!    (Pt, Gt, Gr, Tsys, pointing, polarisation, data rate) are re-grouped into
//!    the EIRP / G/T / lumped-loss inputs `link_budget` takes; the assembly is
//!    what is under test.
//!
//! 2. **ITU-R P.525-4** *Calculation of free-space attenuation* — the published
//!    free-space-loss equation `L_fs = 32.45 + 20log10(d_km) + 20log10(f_MHz)`
//!    (published constant 32.45 dB). Kshana's `free_space_loss_db` is checked to
//!    reproduce the ITU-R-form value across the CCSDS-401 / DSN-810-005 S/X/Ka
//!    downlink band centres at canonical deep-space geometries.
//!
//! ## Tolerance
//! * FSPL: `<= 0.05 dB` (absorbs the DESCANSO table's 0.01 dB print rounding).
//! * C/N0 (Pr/N0) and Eb/N0: `<= 0.2 dB` (absorbs the table's 0.1 dB rounding
//!   and the 8420.43 MHz channel vs 8.420 GHz band-centre frequency split).
//!
//! ## Honest scope
//! The Galileo case is a genuine **independent end-to-end published total** (FSL
//! and Pr/N0) and is the load-bearing external check on the link-equation
//! assembly. The ITU-R cases validate `free_space_loss_db` against the published
//! ITU-R free-space-loss formula (a different, citable analytic form with a
//! published constant); because both reduce to the inverse-square spreading law
//! with the SI-fixed speed of light, that part is an analytic-form / published-
//! constant check, not an independent physical measurement. This does **not**
//! validate the engineering-default EIRP/G/T/loss values in
//! `linkbudget::default_params` (those stay honestly MODELLED), nor any
//! atmospheric / coding / modulation model beyond the lumped-loss term.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/one_way_link_budget/`.

use kshana::linkbudget::{free_space_loss_db, link_budget, LinkParams};
use kshana::radiometric::Band;

const REF: &str = include_str!("fixtures/one_way_link_budget/one_way_link_budget_reference.txt");

/// Free-space-loss tolerance (dB): absorbs the published table's print rounding.
const FSL_TOL_DB: f64 = 0.05;
/// Carrier-figure tolerance (dB) for C/N0 and Eb/N0: absorbs the table's 0.1 dB
/// rounding plus the 8420.43 MHz channel vs 8.420 GHz band-centre split.
const CARRIER_TOL_DB: f64 = 0.2;

fn f(s: &str) -> f64 {
    s.trim()
        .parse()
        .unwrap_or_else(|_| panic!("not a float: '{s}'"))
}

#[test]
fn link_budget_reproduces_published_dct_vectors() {
    let mut n_fsl = 0usize;
    let mut n_dct = 0usize;
    let mut worst_fsl = 0.0_f64;
    let mut worst_carrier = 0.0_f64;

    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }

        if let Some(rest) = line.strip_prefix("FSL ") {
            // FSL name | range_m | freq_hz | L_fs_db
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 4, "FSL row needs 4 |-fields: {line}");
            let name = p[0].trim();
            let range_m = f(p[1]);
            let freq_hz = f(p[2]);
            let want = f(p[3]);

            let got = free_space_loss_db(range_m, freq_hz);
            let d = (got - want).abs();
            worst_fsl = worst_fsl.max(d);
            assert!(
                d <= FSL_TOL_DB,
                "FSL {name}: kshana {got:.6} dB vs published {want:.6} dB \
                 (|Δ|={d:.2e} > {FSL_TOL_DB})",
            );
            n_fsl += 1;
        } else if let Some(rest) = line.strip_prefix("DCT ") {
            // DCT name | range_m | freq_hz | eirp | g_over_t | other | rate | req | fsl | cn0 | eb
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 11, "DCT row needs 11 |-fields: {line}");
            let name = p[0].trim();
            let range_m = f(p[1]);
            let freq_hz = f(p[2]);
            let eirp_dbw = f(p[3]);
            let g_over_t_db = f(p[4]);
            let other_losses_db = f(p[5]);
            let data_rate_bps = f(p[6]);
            let required_eb_n0_db = f(p[7]);
            let exp_fsl = f(p[8]);
            let exp_cn0 = f(p[9]);
            let exp_eb = f(p[10]);

            // (a) Free-space loss at the exact published channel frequency vs the
            //     DESCANSO table total. (X band: 8420.43 MHz.)
            let got_fsl = free_space_loss_db(range_m, freq_hz);
            let d_fsl = (got_fsl - exp_fsl).abs();
            worst_fsl = worst_fsl.max(d_fsl);
            assert!(
                d_fsl <= FSL_TOL_DB,
                "DCT {name}: FSL kshana {got_fsl:.4} dB vs published {exp_fsl:.4} dB \
                 (|Δ|={d_fsl:.2e} > {FSL_TOL_DB})",
            );

            // (b) Full link-equation assembly via link_budget. The band-keyed
            //     budget uses the X-band downlink centre (8.420 GHz); the channel
            //     vs centre split (~4e-4 dB in FSL) is well inside CARRIER_TOL_DB.
            let band = if (8.3e9..=8.5e9).contains(&freq_hz) {
                Band::X
            } else if (2.2e9..=2.4e9).contains(&freq_hz) {
                Band::S
            } else {
                Band::Ka
            };
            let params = LinkParams {
                band,
                eirp_dbw,
                g_over_t_db,
                range_m,
                data_rate_bps,
                other_losses_db,
            };
            let r = link_budget(&params, required_eb_n0_db);

            let d_cn0 = (r.cn0_dbhz - exp_cn0).abs();
            worst_carrier = worst_carrier.max(d_cn0);
            assert!(
                d_cn0 <= CARRIER_TOL_DB,
                "DCT {name}: C/N0 kshana {:.4} dB-Hz vs published Pr/N0 {exp_cn0:.4} dB-Hz \
                 (|Δ|={d_cn0:.2e} > {CARRIER_TOL_DB})",
                r.cn0_dbhz,
            );

            let d_eb = (r.eb_n0_db - exp_eb).abs();
            worst_carrier = worst_carrier.max(d_eb);
            assert!(
                d_eb <= CARRIER_TOL_DB,
                "DCT {name}: Eb/N0 kshana {:.4} dB vs published {exp_eb:.4} dB \
                 (|Δ|={d_eb:.2e} > {CARRIER_TOL_DB})",
                r.eb_n0_db,
            );

            // Margin / closure self-consistency against the published Eb/N0.
            let exp_margin = exp_eb - required_eb_n0_db;
            assert!(
                (r.margin_db - exp_margin).abs() <= CARRIER_TOL_DB,
                "DCT {name}: margin kshana {:.4} dB vs expected {exp_margin:.4} dB",
                r.margin_db,
            );
            assert_eq!(
                r.closes,
                r.margin_db >= 0.0,
                "DCT {name}: closure flag must agree with margin sign",
            );

            n_dct += 1;
        }
    }

    // >= 3 published DCT cases overall: the Galileo end-to-end DCT plus the
    // independent published free-space-loss vectors across the DSN bands.
    assert!(
        n_dct >= 1,
        "expected the published end-to-end DCT (Galileo Table 1-1), got {n_dct}"
    );
    let total = n_fsl + n_dct;
    assert!(
        total >= 3,
        "expected >= 3 published DCT/FSL reference cases, got {total} \
         ({n_fsl} FSL + {n_dct} end-to-end DCT)"
    );

    eprintln!(
        "one_way_link_budget_reference: {n_fsl} ITU-R/published FSL cases + \
         {n_dct} DESCANSO end-to-end DCT case(s); worst |ΔFSL| = {worst_fsl:.3e} dB, \
         worst |Δcarrier| = {worst_carrier:.3e} dB"
    );
}
