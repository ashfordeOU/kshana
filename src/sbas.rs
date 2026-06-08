// SPDX-License-Identifier: Apache-2.0
//! SBAS / DO-229E integrity: weighted-least-squares **protection levels**, the L1/L5
//! dual-frequency **ionosphere-free** combination, and a **DO-316/DO-229E compliance map**.
//!
//! This complements the snapshot/solution-separation/ARAIM machinery of [`crate::raim`] with the
//! position-domain protection-level formulation used by satellite-based augmentation systems
//! (WAAS/EGNOS). [`sbas_protection_level`] forms the weighted geometry matrix from each
//! satellite's elevation/azimuth and error budget, inverts the normal matrix
//! ([`crate::orbit::invert4`], shared with RAIM), and projects the per-satellite variances into
//! the horizontal error-ellipse major axis and the vertical standard deviation, scaled by the
//! DO-229E K-factors into HPL and VPL.
//!
//! ## Honest scope
//!
//! This **implements the DO-229E protection-level algorithm**; it is **not a certified
//! conformance statement**. The in-repo tests pin the algorithm against closed-form constants,
//! the IS-GPS-705 carrier frequencies, the independent ionospheric-delay physics, and a
//! numpy-derived reference geometry. Reproducing a published WAAS/EGNOS protection level from a
//! real RINEX-OBS + augmentation-message epoch (as RTKLIB / ESA gLAB do) is the founder-gated
//! external validation tracked in `docs/COMPLIANCE.md`.

use crate::timetransfer_adv::{F_L1, F_L5};
use serde::Serialize;

// ─────────────────────────────────────────────────────────────────────────────
// DO-229E K-factors
// ─────────────────────────────────────────────────────────────────────────────

/// Horizontal K-factor for **Precision Approach** (DO-229E): the MOPS uses the rounded
/// constant `6.0` (the exact two-sided `Φ⁻¹(1 − 1e-9/2) = 6.109`; the rounding is documented in
/// `docs/COMPLIANCE.md`).
pub const K_H_PA: f64 = 6.0;

/// Vertical K-factor for Precision Approach: `Φ⁻¹(1 − 1e-7/2) ≈ 5.327`, derived from the same
/// [`crate::raim::normal_quantile`] the RAIM stack uses (a non-circular cross-check).
pub fn k_v_pa() -> f64 {
    crate::raim::normal_quantile(1.0 - 5e-8)
}

/// Horizontal K-factor for **En-route through NPA** (horizontal-only): the Rayleigh quantile
/// `√(−2·ln(5e-9)) ≈ 6.183`.
pub fn k_h_npa() -> f64 {
    (-2.0 * (5e-9_f64).ln()).sqrt()
}

// ─────────────────────────────────────────────────────────────────────────────
// L1/L5 ionosphere-free combination (IS-GPS-705)
// ─────────────────────────────────────────────────────────────────────────────

/// `γ₁₅ = (f₁/f₅)² ≈ 1.79327` for the GPS L1/L5 pair.
pub const GAMMA_L1L5: f64 = (F_L1 / F_L5) * (F_L1 / F_L5);

/// The `(c₁, c₅)` coefficients of the L1/L5 ionosphere-free combination
/// `ρ_IF = c₁·ρ₁ + c₅·ρ₅`, with `c₁ = f₁²/(f₁²−f₅²)` and `c₅ = −f₅²/(f₁²−f₅²)`.
/// They satisfy the unit-gain invariant `c₁ + c₅ = 1`.
pub fn iono_free_l1l5_coeffs() -> (f64, f64) {
    let (f1sq, f5sq) = (F_L1 * F_L1, F_L5 * F_L5);
    let denom = f1sq - f5sq;
    (f1sq / denom, -f5sq / denom)
}

/// L1/L5 ionosphere-free pseudorange (m): `(f₁²·ρ₁ − f₅²·ρ₅)/(f₁² − f₅²)`. The first-order
/// ionospheric delay (∝ 1/f²) cancels exactly.
pub fn iono_free_l1l5(rho1_m: f64, rho5_m: f64) -> f64 {
    let (c1, c5) = iono_free_l1l5_coeffs();
    c1 * rho1_m + c5 * rho5_m
}

/// Noise amplification `√(c₁² + c₅²) ≈ 2.588` of the L1/L5 ionosphere-free combination for
/// equal-variance, uncorrelated inputs.
pub fn iono_free_l1l5_noise_factor() -> f64 {
    let (c1, c5) = iono_free_l1l5_coeffs();
    (c1 * c1 + c5 * c5).sqrt()
}

// ─────────────────────────────────────────────────────────────────────────────
// Weighted-least-squares protection levels (DO-229E Appendix J)
// ─────────────────────────────────────────────────────────────────────────────

/// The DO-229E per-satellite SBAS error budget (1-σ, metres). The total measurement variance is
/// the sum of squares.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct SbasErrorModel {
    /// Fast/long-term (UDRE-derived) residual.
    pub sigma_flt_m: f64,
    /// Residual ionospheric (GIVE-derived, UIRE).
    pub sigma_uire_m: f64,
    /// Airborne receiver + multipath.
    pub sigma_air_m: f64,
    /// Residual tropospheric.
    pub sigma_tropo_m: f64,
}

impl SbasErrorModel {
    /// A uniform 1-σ budget with all four contributions equal (test/convenience helper).
    pub fn uniform(sigma_m: f64) -> Self {
        Self {
            sigma_flt_m: sigma_m,
            sigma_uire_m: 0.0,
            sigma_air_m: 0.0,
            sigma_tropo_m: 0.0,
        }
    }
    /// Total measurement variance `σ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²`.
    pub fn variance(&self) -> f64 {
        self.sigma_flt_m.powi(2)
            + self.sigma_uire_m.powi(2)
            + self.sigma_air_m.powi(2)
            + self.sigma_tropo_m.powi(2)
    }
}

/// One satellite's local-level geometry (elevation/azimuth at the user) and error budget.
#[derive(Clone, Copy, Debug)]
pub struct SbasSat {
    /// Elevation angle at the user (rad).
    pub el_rad: f64,
    /// Azimuth angle at the user (rad, from North, clockwise).
    pub az_rad: f64,
    /// The satellite's SBAS error budget.
    pub err: SbasErrorModel,
}

/// DO-229E protection-level operating mode, selecting the K-factor pair.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum SbasMode {
    /// En-route through Non-Precision Approach: horizontal protection only (no VPL).
    EnRouteToNpa,
    /// Precision Approach (APV/CAT-I): both HPL and VPL.
    PrecisionApproach,
}

/// The DO-229E protection-level result for one epoch.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct SbasProtectionLevel {
    /// Number of satellites used.
    pub n_used: usize,
    /// Semi-major axis of the horizontal 1-σ position-error ellipse (m).
    pub d_major_m: f64,
    /// Vertical 1-σ position standard deviation (m).
    pub d_u_m: f64,
    /// Horizontal protection level `K_H · d_major` (m).
    pub hpl_m: f64,
    /// Vertical protection level `K_V · d_U` (m); `None` in [`SbasMode::EnRouteToNpa`].
    pub vpl_m: Option<f64>,
}

/// The ENU observation row `[−cos El·sin Az, −cos El·cos Az, −sin El, 1]` (East, North, Up,
/// clock) for one satellite (DO-229E Appendix J local-level convention).
pub fn geometry_row(s: &SbasSat) -> [f64; 4] {
    let (ce, se) = (s.el_rad.cos(), s.el_rad.sin());
    let (sa, ca) = (s.az_rad.sin(), s.az_rad.cos());
    [-ce * sa, -ce * ca, -se, 1.0]
}

/// The weighted position-covariance `D = (GᵀWG)⁻¹` (ENU + clock) for the satellite set, with
/// `W = diag(1/σᵢ²)`. Returns `None` if fewer than four satellites or the geometry is singular.
pub fn wls_covariance(sats: &[SbasSat]) -> Option<[[f64; 4]; 4]> {
    if sats.len() < 4 {
        return None;
    }
    let mut a = [[0.0_f64; 4]; 4];
    for s in sats {
        // Reject non-finite geometry/variance up front: `NaN <= 0.0` is false, so a NaN σ, σ²,
        // elevation, or azimuth would otherwise slip the guards, poison the normal matrix, and
        // produce a non-finite "valid" protection level — a silent integrity failure.
        if !s.el_rad.is_finite() || !s.az_rad.is_finite() {
            return None;
        }
        let var = s.err.variance();
        if !var.is_finite() || var <= 0.0 {
            return None;
        }
        let w = 1.0 / var;
        let g = geometry_row(s);
        for i in 0..4 {
            for j in 0..4 {
                a[i][j] += w * g[i] * g[j];
            }
        }
    }
    let d = crate::orbit::invert4(a)?;
    // `invert4` uses an absolute pivot tolerance, so a near-singular geometry scaled up by large
    // weights (small σ) can pass it yet yield a negative or non-finite covariance diagonal. A
    // covariance diagonal must be finite and non-negative; otherwise the geometry is effectively
    // rank-deficient — reject it rather than return a √(negative)=NaN protection level.
    if d.iter().any(|row| row.iter().any(|x| !x.is_finite())) {
        return None;
    }
    if d[0][0] < 0.0 || d[1][1] < 0.0 || d[2][2] < 0.0 || d[3][3] < 0.0 {
        return None;
    }
    Some(d)
}

/// DO-229E weighted-least-squares protection levels for the satellite set and mode.
pub fn sbas_protection_level(sats: &[SbasSat], mode: SbasMode) -> Option<SbasProtectionLevel> {
    let d = wls_covariance(sats)?;
    let (de2, dn2, den, du2) = (d[0][0], d[1][1], d[0][1], d[2][2]);
    // Largest eigenvalue of the 2×2 EN covariance → horizontal error-ellipse major axis.
    let d_major = ((de2 + dn2) / 2.0 + (((de2 - dn2) / 2.0).powi(2) + den * den).sqrt()).sqrt();
    let d_u = du2.sqrt();
    let (k_h, k_v) = match mode {
        SbasMode::PrecisionApproach => (K_H_PA, Some(k_v_pa())),
        SbasMode::EnRouteToNpa => (k_h_npa(), None),
    };
    Some(SbasProtectionLevel {
        n_used: sats.len(),
        d_major_m: d_major,
        d_u_m: d_u,
        hpl_m: k_h * d_major,
        vpl_m: k_v.map(|k| k * d_u),
    })
}

// ─────────────────────────────────────────────────────────────────────────────
// DO-316 / DO-229E compliance map
// ─────────────────────────────────────────────────────────────────────────────

/// Implementation status of a mapped requirement.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum ComplianceStatus {
    /// Implemented and tested in-repo.
    Implemented,
    /// Partially implemented.
    Partial,
    /// Requires external certification / data (founder-gated).
    RoadmapExternal,
}

/// One row of the DO-316/DO-229E requirement → Kshana-step traceability map.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct ComplianceRow {
    /// The standard requirement identifier (e.g. `"DO-229E J.1"`).
    pub requirement_id: &'static str,
    /// Short requirement text.
    pub requirement: &'static str,
    /// The Kshana function/step that addresses it.
    pub kshana_step: &'static str,
    /// Implementation status.
    pub status: ComplianceStatus,
}

/// The DO-316/DO-229E requirement → Kshana-step traceability map. This is an engineering
/// traceability aid, **not** a certification artifact (see `docs/COMPLIANCE.md`).
pub fn do316_compliance_map() -> Vec<ComplianceRow> {
    use ComplianceStatus::*;
    vec![
        ComplianceRow {
            requirement_id: "DO-229E J.1",
            requirement: "Weighted-least-squares position solution and projection matrix",
            kshana_step: "sbas::wls_covariance",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-229E J.2",
            requirement: "Horizontal protection level HPL = K_H · d_major",
            kshana_step: "sbas::sbas_protection_level",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-229E J.3",
            requirement: "Vertical protection level VPL = K_V · d_U",
            kshana_step: "sbas::sbas_protection_level",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-229E 2.1.4",
            requirement: "L1/L5 dual-frequency ionosphere-free pseudorange",
            kshana_step: "sbas::iono_free_l1l5",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-316 2.3.11",
            requirement: "Solution-separation receiver autonomous integrity monitoring",
            kshana_step: "raim::solution_separation_raim",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-316 2.3.11.5",
            requirement: "Snapshot RAIM fault detection",
            kshana_step: "raim::snapshot_raim",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-316 App.R / EU ARAIM TR",
            requirement: "ARAIM all-in-view protection levels over fault modes",
            kshana_step: "raim::araim_protection_level",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-316 App.R",
            requirement: "ARAIM integrity-risk allocation across fault hypotheses",
            kshana_step: "raim::araim_integrity_risk",
            status: Implemented,
        },
        ComplianceRow {
            requirement_id: "DO-229E 2.1.1 / RTCA conformance",
            requirement: "Certified conformance against published WAAS/EGNOS PL on real RINEX+SBAS",
            kshana_step: "docs/COMPLIANCE.md (RTKLIB/gLAB cross-check)",
            status: RoadmapExternal,
        },
    ]
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::timetransfer_adv::iono_delay_m;

    #[test]
    fn k_factors_match_do229e_published_values() {
        assert!(
            (k_v_pa() - 5.33).abs() < 1e-2,
            "K_V,PA {} vs MOPS 5.33",
            k_v_pa()
        );
        assert!(
            (k_v_pa() - 5.326_723_886).abs() < 1e-3,
            "K_V,PA must equal Φ⁻¹(1−5e-8)"
        );
        assert_eq!(K_H_PA, 6.0);
        assert!(
            (k_h_npa() - 6.182_851_757).abs() < 1e-3,
            "K_H,NPA {} vs Rayleigh √(−2ln5e-9)=6.1829",
            k_h_npa()
        );
    }

    #[test]
    fn gamma_l1l5_matches_is_gps_705_frequencies() {
        assert!((GAMMA_L1L5 - (F_L1 / F_L5).powi(2)).abs() < 1e-12);
        assert!((GAMMA_L1L5 - 1.793_270).abs() < 1e-5, "γ₁₅ {GAMMA_L1L5}");
    }

    #[test]
    fn iono_free_l1l5_coefficients_sum_to_unity_and_match_oracle() {
        let (c1, c5) = iono_free_l1l5_coeffs();
        assert!((c1 - 2.260_604).abs() < 1e-5, "c1 {c1}");
        assert!((c5 - (-1.260_604)).abs() < 1e-5, "c5 {c5}");
        assert!((c1 + c5 - 1.0).abs() < 1e-12, "unit-gain invariant c1+c5=1");
    }

    #[test]
    fn iono_free_l1l5_cancels_first_order_iono() {
        // The defining physics: injecting the independent 40.3/f² ionospheric delay on each
        // band must leave the IF combination unchanged. Oracle = iono physics, not our PL code.
        let (rho1, rho5) = (22_000_000.0_f64, 22_000_000.0_f64);
        let clean = iono_free_l1l5(rho1, rho5);
        for tec in [0.0, 10.0, 50.0, 100.0] {
            let d1 = iono_delay_m(tec, F_L1);
            let d5 = iono_delay_m(tec, F_L5);
            let with_iono = iono_free_l1l5(rho1 + d1, rho5 + d5);
            assert!(
                (with_iono - clean).abs() < 1e-6,
                "IF must cancel first-order iono at {tec} TECU: Δ={}",
                with_iono - clean
            );
        }
    }

    #[test]
    fn iono_free_l1l5_noise_factor_is_2_588() {
        assert!(
            (iono_free_l1l5_noise_factor() - 2.5883).abs() < 1e-3,
            "noise factor {}",
            iono_free_l1l5_noise_factor()
        );
    }

    /// The 5-satellite worked example. Oracle = numpy `inv(GᵀG)` (independent linear algebra):
    /// d_east²=d_north²=0.535898384862, d_U²=2.275419682086, d_major=0.732050807569,
    /// d_U=1.508449429741, HPL=6.0·d_major=4.392304845413.
    #[test]
    fn wls_pl_matches_numpy_on_five_satellite_geometry() {
        let deg = std::f64::consts::PI / 180.0;
        let mk = |el: f64, az: f64| SbasSat {
            el_rad: el * deg,
            az_rad: az * deg,
            err: SbasErrorModel::uniform(1.0),
        };
        let sats = [
            mk(90.0, 0.0),
            mk(15.0, 0.0),
            mk(15.0, 90.0),
            mk(15.0, 180.0),
            mk(15.0, 270.0),
        ];
        let d = wls_covariance(&sats).expect("non-singular");
        assert!((d[0][0] - 0.535_898_384_862).abs() < 1e-9, "d_east²");
        assert!((d[1][1] - 0.535_898_384_862).abs() < 1e-9, "d_north²");
        assert!((d[2][2] - 2.275_419_682_086).abs() < 1e-9, "d_U²");
        let pl = sbas_protection_level(&sats, SbasMode::PrecisionApproach).unwrap();
        assert!(
            (pl.d_major_m - 0.732_050_807_569).abs() < 1e-9,
            "d_major {}",
            pl.d_major_m
        );
        assert!(
            (pl.d_u_m - 1.508_449_429_741).abs() < 1e-9,
            "d_U {}",
            pl.d_u_m
        );
        assert!(
            (pl.hpl_m - 4.392_304_845_413).abs() < 1e-9,
            "HPL {}",
            pl.hpl_m
        );
        assert!(
            (pl.vpl_m.unwrap() - k_v_pa() * pl.d_u_m).abs() < 1e-12,
            "VPL = K_V·d_U"
        );
    }

    #[test]
    fn wls_covariance_two_routes_agree() {
        // d_U² from the covariance D[2][2] must equal the projection route Σᵢ S_{U,i}²·σᵢ²
        // (DO-229E Navipedia Eq.3) — an algebraic identity of the BLUE.
        let deg = std::f64::consts::PI / 180.0;
        let sats = [
            SbasSat {
                el_rad: 80.0 * deg,
                az_rad: 10.0 * deg,
                err: SbasErrorModel::uniform(1.5),
            },
            SbasSat {
                el_rad: 30.0 * deg,
                az_rad: 120.0 * deg,
                err: SbasErrorModel::uniform(2.0),
            },
            SbasSat {
                el_rad: 45.0 * deg,
                az_rad: 200.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 20.0 * deg,
                az_rad: 300.0 * deg,
                err: SbasErrorModel::uniform(2.5),
            },
            SbasSat {
                el_rad: 60.0 * deg,
                az_rad: 45.0 * deg,
                err: SbasErrorModel::uniform(1.2),
            },
        ];
        let d = wls_covariance(&sats).unwrap();
        // S = D Gᵀ W ; route2 = Σᵢ S[2][i]² σᵢ² = Σᵢ S[2][i]²/wᵢ.
        let mut route2 = 0.0;
        for s in &sats {
            let g = geometry_row(s);
            let w = 1.0 / s.err.variance();
            // S[2][i] = Σ_k D[2][k]·g[k]·w
            let s_ui: f64 = (0..4).map(|k| d[2][k] * g[k] * w).sum();
            route2 += s_ui * s_ui / w;
        }
        assert!(
            (route2 - d[2][2]).abs() < 1e-12,
            "two-route d_U² mismatch {} vs {}",
            route2,
            d[2][2]
        );
    }

    #[test]
    fn wls_downweights_high_error_satellite() {
        let deg = std::f64::consts::PI / 180.0;
        let base = [
            SbasSat {
                el_rad: 80.0 * deg,
                az_rad: 10.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 30.0 * deg,
                az_rad: 120.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 45.0 * deg,
                az_rad: 200.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 20.0 * deg,
                az_rad: 300.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 15.0 * deg,
                az_rad: 60.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
        ];
        let pl_base = sbas_protection_level(&base, SbasMode::PrecisionApproach).unwrap();
        let mut worse = base;
        worse[4].err.sigma_uire_m = 5.0; // inflate the low-elevation sat's error
        let pl_worse = sbas_protection_level(&worse, SbasMode::PrecisionApproach).unwrap();
        assert!(
            pl_worse.hpl_m >= pl_base.hpl_m - 1e-9,
            "inflating a measurement's σ must not lower HPL"
        );
    }

    #[test]
    fn npa_mode_has_no_vpl_pa_mode_does() {
        let deg = std::f64::consts::PI / 180.0;
        let sats = [
            SbasSat {
                el_rad: 80.0 * deg,
                az_rad: 10.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 30.0 * deg,
                az_rad: 120.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 45.0 * deg,
                az_rad: 200.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 20.0 * deg,
                az_rad: 300.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
        ];
        assert!(sbas_protection_level(&sats, SbasMode::EnRouteToNpa)
            .unwrap()
            .vpl_m
            .is_none());
        assert!(sbas_protection_level(&sats, SbasMode::PrecisionApproach)
            .unwrap()
            .vpl_m
            .is_some());
    }

    #[test]
    fn fewer_than_four_satellites_returns_none() {
        let deg = std::f64::consts::PI / 180.0;
        let sats = [
            SbasSat {
                el_rad: 80.0 * deg,
                az_rad: 10.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 30.0 * deg,
                az_rad: 120.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
            SbasSat {
                el_rad: 45.0 * deg,
                az_rad: 200.0 * deg,
                err: SbasErrorModel::uniform(1.0),
            },
        ];
        assert!(sbas_protection_level(&sats, SbasMode::PrecisionApproach).is_none());
    }

    #[test]
    fn do316_compliance_map_is_complete_and_well_formed() {
        let map = do316_compliance_map();
        assert!(map.len() >= 8);
        for row in &map {
            assert!(
                row.requirement_id.starts_with("DO-"),
                "req id {}",
                row.requirement_id
            );
            assert!(!row.kshana_step.is_empty());
            assert!(!row.requirement.is_empty());
        }
        let steps: Vec<&str> = map.iter().map(|r| r.kshana_step).collect();
        for must in [
            "sbas::sbas_protection_level",
            "sbas::iono_free_l1l5",
            "raim::araim_protection_level",
        ] {
            assert!(steps.contains(&must), "compliance map missing {must}");
        }
        // Honesty: the certified-conformance row must be marked external, not implemented.
        assert!(map
            .iter()
            .any(|r| r.status == ComplianceStatus::RoadmapExternal));
    }

    #[test]
    fn compliance_map_serializes_to_json() {
        let map = do316_compliance_map();
        let json = serde_json::to_string(&map).expect("serialize");
        assert!(json.contains("requirement_id"));
        assert!(json.contains("Implemented"));
    }

    // --- Regression: a protection level must never be returned non-finite or absurd ---

    #[test]
    fn near_singular_geometry_at_small_sigma_returns_none_not_nan() {
        // A near-coplanar geometry scaled up by tiny σ (cm-level) once slipped invert4's
        // absolute pivot gate and yielded a NEGATIVE covariance diagonal → NaN VPL and a
        // ~10⁹ m HPL returned as a valid Some. It must be rejected as rank-deficient.
        let deg = std::f64::consts::PI / 180.0;
        let mk = |el: f64, az: f64| SbasSat {
            el_rad: el * deg,
            az_rad: az * deg,
            err: SbasErrorModel::uniform(1e-6),
        };
        let sats = [
            mk(89.999, 0.0),
            mk(89.9991, 0.001),
            mk(89.9992, 0.002),
            mk(89.9993, 0.003),
        ];
        let pl = sbas_protection_level(&sats, SbasMode::PrecisionApproach);
        assert!(
            pl.is_none(),
            "near-singular geometry must return None, got {pl:?}"
        );
    }

    #[test]
    fn non_finite_inputs_never_yield_a_protection_level() {
        let deg = std::f64::consts::PI / 180.0;
        let good = |el: f64, az: f64| SbasSat {
            el_rad: el * deg,
            az_rad: az * deg,
            err: SbasErrorModel::uniform(1.0),
        };
        let base = [
            good(80.0, 10.0),
            good(30.0, 120.0),
            good(45.0, 200.0),
            good(20.0, 300.0),
        ];
        // NaN variance.
        let mut nan_var = base;
        nan_var[0].err.sigma_flt_m = f64::NAN;
        assert!(sbas_protection_level(&nan_var, SbasMode::PrecisionApproach).is_none());
        // NaN elevation.
        let mut nan_el = base;
        nan_el[0].el_rad = f64::NAN;
        assert!(sbas_protection_level(&nan_el, SbasMode::PrecisionApproach).is_none());
        // NaN azimuth.
        let mut nan_az = base;
        nan_az[0].az_rad = f64::NAN;
        assert!(sbas_protection_level(&nan_az, SbasMode::PrecisionApproach).is_none());
    }
}
