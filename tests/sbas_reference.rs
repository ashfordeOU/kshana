// SPDX-License-Identifier: AGPL-3.0-only
//! SBAS / DO-229E protection-level reference test (external oracle: the RTKLIB SBAS-PL
//! fork + ESA gLAB).
//!
//! kshana's `sbas_protection_level` (the DO-229E Appendix J weighted-least-squares HPL/VPL)
//! is checked against an **independent third-party implementation**: `waasprotlevels()` in
//! **zsiki/rtklib_ws** (commit 64d094c) — the RTKLIB 2.4.3 "protection level variant" by
//! Zoltán Siki (Siki & Takács 2017, *SBAS protection level in RTKLIB*), whose header reads
//! "Compute the WAAS protection levels as defined in Appendix J of the WAAS MOPS: RTCA
//! DO-229D." Its geometry row, weighting `W=1/σ²`, normal-matrix inverse `D=(GᵀWG)⁻¹`, the
//! horizontal error-ellipse `d_major` formula, and the K-factors all match kshana's exactly
//! (source diff in the provenance note below). The SAME formula is independently present in
//! ESA gLAB v6.0.0 (`core/filter.c`), the de-facto ESA reference SBAS tool.
//!
//! The fixtures are the oracle's **own** per-satellite (elevation, azimuth, total 1-σ) inputs
//! and its **own** reported (HPL, VPL), captured by an in-place print inside `waasprotlevels()`
//! while `rnx2rtkp -ws` processed **real EGNOS data** — GEO PRN120 broadcast messages
//! (`d51.ems`) + real BUTE/Budapest RINEX (2017-02-19, EUREF/BKG archive). The σ per satellite
//! is the oracle's full SBAS budget (UDRE fast/long-term + GIVE iono + tropo + airborne),
//! injected here as each satellite's total 1-σ. Reproducing this third-party tool's HPL on
//! real-data geometries makes the DO-229E protection level **externally validated**, not
//! merely self-consistent against our own linear algebra.
//!
//! **K_V convention (honest):** both the RTKLIB fork and gLAB hardcode the *rounded* MOPS
//! K_V = 5.33; kshana uses the exact K_V = Φ⁻¹(1−5e-8) = 5.326724 (≈0.06 % smaller). HPL is
//! unaffected (K_H = 6.0 on both sides), so HPL is matched directly. For the vertical we check
//! the **K-factor-free geometry** — kshana's `d_U` against the oracle's `VPL / 5.33` — so the
//! benign K_V rounding does not enter the comparison.

use kshana::sbas::{sbas_protection_level, SbasErrorModel, SbasMode, SbasSat};

const DEG: f64 = std::f64::consts::PI / 180.0;
/// The oracle's hardcoded (rounded) DO-229 vertical K-factor; see the module note.
const K_V_ORACLE: f64 = 5.33;

/// One satellite as the oracle saw it: (elevation°, azimuth°, total 1-σ [m]).
type SatRow = (f64, f64, f64);

/// zsiki/rtklib_ws rnx2rtkp -ws, BUTE 2017-02-19 23:01:30.000
const F0: &[SatRow] = &[
    (19.0651, 176.31, 1.958562),
    (42.6512, 148.8728, 1.430721),
    (77.5947, 62.7627, 1.24434),
    (63.7754, 218.5625, 1.281244),
    (31.3713, 292.354, 1.606398),
];
/// zsiki/rtklib_ws rnx2rtkp -ws, BUTE 2017-02-19 23:12:30.000
const F1: &[SatRow] = &[
    (5.0562, 335.6853, 2.748428),
    (23.7356, 175.5345, 1.799016),
    (62.5324, 278.6834, 1.299358),
    (46.8385, 145.1215, 1.391119),
    (32.845, 56.6363, 1.689508),
    (73.1207, 60.0882, 1.288052),
    (59.8705, 211.0886, 1.306134),
    (35.5422, 294.7292, 1.529274),
    (20.548, 100.8735, 2.150393),
];
/// zsiki/rtklib_ws rnx2rtkp -ws, BUTE 2017-02-19 23:22:00.000
const F2: &[SatRow] = &[
    (6.3949, 332.1993, 2.682291),
    (28.2861, 174.7634, 1.675249),
    (63.8174, 268.2769, 1.312994),
    (50.6037, 140.7646, 1.382604),
    (29.9138, 53.214, 1.763046),
    (68.8676, 59.6108, 1.304467),
    (55.7081, 205.8538, 1.330621),
    (39.6128, 296.877, 1.537565),
];
/// zsiki/rtklib_ws rnx2rtkp -ws, BUTE 2017-02-19 23:31:30.000
const F3: &[SatRow] = &[
    (7.3372, 328.7234, 2.636831),
    (7.3357, 293.9829, 2.636938),
    (32.6903, 173.9559, 1.580174),
    (63.9554, 257.653, 1.308954),
    (53.8829, 135.7406, 1.361231),
    (26.8787, 50.4996, 1.865814),
    (64.869, 60.0934, 1.322201),
    (51.5122, 202.1189, 1.353585),
    (43.5708, 298.7897, 1.491537),
];
/// zsiki/rtklib_ws rnx2rtkp -ws, BUTE 2017-02-19 23:41:00.000
const F4: &[SatRow] = &[
    (7.9414, 325.1194, 2.504675),
    (10.7601, 295.8398, 2.336865),
    (37.1603, 173.0195, 1.503573),
    (12.7886, 72.0872, 3.563409),
    (63.0106, 247.2949, 1.294534),
    (56.7567, 129.7, 1.345682),
    (23.6578, 48.2732, 2.142725),
    (60.9245, 61.1153, 1.343416),
    (47.1818, 199.2484, 1.384175),
    (47.618, 300.5469, 1.387714),
];
/// zsiki/rtklib_ws rnx2rtkp -ws, BUTE 2017-02-19 23:50:30.000
const F5: &[SatRow] = &[
    (8.1974, 321.4232, 2.487776),
    (14.2619, 297.5803, 2.16142),
    (41.6789, 171.8812, 1.442177),
    (6.8435, 38.0424, 3.296626),
    (14.0082, 68.136, 8.103587),
    (61.0932, 238.0224, 1.301565),
    (59.0907, 122.5603, 1.33531),
    (20.3001, 46.4943, 2.428854),
    (57.0403, 62.4908, 1.368582),
    (51.7535, 302.1054, 1.359535),
];

/// (satellites, oracle HPL [m], oracle VPL [m]) — RTKLIB SBAS-PL fork on real EGNOS data.
const FIXTURES: &[(&[SatRow], f64, f64)] = &[
    (F0, 17.6549, 20.292),
    (F1, 7.485, 12.384),
    (F2, 7.5733, 14.3297),
    (F3, 7.1971, 13.5098),
    (F4, 7.0478, 13.3614),
    (F5, 8.5337, 14.351),
];

#[test]
fn sbas_protection_level_matches_rtklib_sbas_oracle() {
    for (fi, &(sat_rows, oracle_hpl, oracle_vpl)) in FIXTURES.iter().enumerate() {
        let sats: Vec<SbasSat> = sat_rows
            .iter()
            .map(|&(el_deg, az_deg, sigma_m)| SbasSat {
                el_rad: el_deg * DEG,
                az_rad: az_deg * DEG,
                // uniform() puts the whole budget in one term, so variance()=σ²: the
                // oracle's total per-satellite 1-σ goes in verbatim, W=1/σ² as on its side.
                err: SbasErrorModel::uniform(sigma_m),
            })
            .collect();
        let pl = sbas_protection_level(&sats, SbasMode::PrecisionApproach)
            .unwrap_or_else(|| panic!("fixture {fi}: protection level returned None"));

        // HPL — K_H = 6.0 identical on both sides, so compare to the oracle directly.
        let dh = (pl.hpl_m - oracle_hpl).abs();
        assert!(
            dh < 2e-3,
            "fixture {fi} HPL: kshana {:.6} m vs RTKLIB SBAS-PL {:.4} m (|Δ|={dh:.2e})",
            pl.hpl_m,
            oracle_hpl
        );

        // Vertical: compare the K-factor-free geometry (d_U vs oracle VPL / its K_V),
        // so the rounded-vs-exact K_V convention difference never enters.
        let du_oracle = oracle_vpl / K_V_ORACLE;
        let dv = (pl.d_u_m - du_oracle).abs();
        assert!(
            dv < 2e-3,
            "fixture {fi} d_U: kshana {:.6} m vs RTKLIB SBAS-PL VPL/K_V {:.6} m (|Δ|={dv:.2e})",
            pl.d_u_m,
            du_oracle
        );

        // kshana's own VPL uses the exact K_V; confirm it is the (slightly smaller)
        // exact-K_V counterpart of the oracle VPL — documents the convention, not an
        // external check.
        let vpl = pl.vpl_m.expect("PA mode yields a VPL");
        // kshana's exact K_V (5.326724) is ~0.06 % below the oracle's rounded 5.33, so its
        // VPL is a touch smaller while mapping the SAME externally-validated d_U.
        assert!(
            vpl <= oracle_vpl && vpl > 0.99 * oracle_vpl,
            "fixture {fi} VPL {:.6} not in (0.99·oracle, oracle] of {:.4}",
            vpl,
            oracle_vpl
        );
    }
}
