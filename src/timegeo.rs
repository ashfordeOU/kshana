// SPDX-License-Identifier: Apache-2.0
//! Geometric time-transfer corrections: the Sagnac effect and GNSS common-view.
//!
//! [`crate::timetransfer`] models the *stochastic* error of a two-way link (jitter,
//! flicker, random walk). This module adds the two *deterministic* geometric effects a
//! real comparison must account for:
//!
//! - **Sagnac correction** — because the signal propagates over a rotating Earth, a path
//!   with an east–west component accrues an extra delay `Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)`
//!   (equivalently `2·A·ω_E/c²` for the equatorial-projected area `A` of the triangle
//!   Earth-centre–`r₁`–`r₂`). It is tens of nanoseconds for continental baselines and must
//!   be removed before two clocks can be compared.
//! - **GNSS common-view** — two ground stations observing the *same* satellite at the same
//!   instant difference their range-corrected pseudoranges; the satellite-clock error (and
//!   other common-mode errors) cancels exactly, leaving the inter-station clock offset.
//!
//! Both are exact closed forms. Scope (honest): a full TWSTFT transponder/hardware-delay
//! budget and a PPP ionosphere-free time-transfer solution are follow-ons (see `ROADMAP.md`).

/// Earth rotation rate (rad/s), IERS.
pub const OMEGA_EARTH: f64 = 7.292_115_9e-5;
/// Speed of light (m/s).
pub const C_M_PER_S: f64 = 299_792_458.0;

type Vec3 = [f64; 3];

/// Sagnac time correction (s) for a signal propagating from `r1` to `r2` (ECEF metres):
/// `Δt = (ω_E/c²)·(x₁·y₂ − x₂·y₁)`. Positive for an eastward-projected path; zero for a
/// purely radial or polar path. Antisymmetric in the path direction.
pub fn sagnac_correction(r1: Vec3, r2: Vec3) -> f64 {
    OMEGA_EARTH * (r1[0] * r2[1] - r2[0] * r1[1]) / (C_M_PER_S * C_M_PER_S)
}

/// Common-view single-difference estimate of the inter-station clock offset
/// `(clock_A − clock_B)` (s), from each station's pseudorange to the *same* satellite with
/// its computed geometric range removed: `[(ρ_A − R_A) − (ρ_B − R_B)] / c`. The satellite
/// clock error — common to both observations — cancels exactly.
pub fn common_view_offset(pr_a: f64, range_a: f64, pr_b: f64, range_b: f64) -> f64 {
    ((pr_a - range_a) - (pr_b - range_b)) / C_M_PER_S
}

#[cfg(test)]
mod tests {
    use super::*;

    const RE: f64 = 6_378_137.0;

    #[test]
    fn sagnac_equatorial_quarter_turn_is_about_33_ns() {
        // r1 on the +x equator, r2 on the +y equator (90° apart): x1·y2 − x2·y1 = Re².
        // Δt = ω_E·Re²/c² ≈ 33.0 ns.
        let dt = sagnac_correction([RE, 0.0, 0.0], [0.0, RE, 0.0]);
        assert!((dt - 3.3006e-8).abs() < 1e-11, "Δt = {} s", dt);
    }

    #[test]
    fn sagnac_is_antisymmetric_and_zero_for_radial_or_polar_paths() {
        let a = [RE, 1.0e6, 2.0e6];
        let b = [-2.0e6, RE, 5.0e5];
        assert!((sagnac_correction(a, b) + sagnac_correction(b, a)).abs() < 1e-20);
        // Purely radial path (same x,y direction): no east–west component ⇒ 0.
        assert_eq!(sagnac_correction([RE, 0.0, 0.0], [2.0 * RE, 0.0, 0.0]), 0.0);
        // Polar path (x = y = 0): 0.
        assert_eq!(sagnac_correction([0.0, 0.0, RE], [0.0, 0.0, 2.0 * RE]), 0.0);
    }

    #[test]
    fn common_view_cancels_the_satellite_clock_and_recovers_the_offset() {
        // True inter-station offset to recover.
        let dt_a = 1.0e-7; // station A clock (s)
        let dt_b = -3.0e-8; // station B clock (s)
        let range_a = 2.10e7;
        let range_b = 2.13e7;
        // Pseudorange = geometric range + c·(rx_clock − sv_clock).
        let pr = |range: f64, rx: f64, sv: f64| range + C_M_PER_S * (rx - sv);
        // The estimate must equal (dt_a − dt_b) regardless of the satellite clock error.
        for &sv in &[0.0, 1.0e-6, -5.0e-7] {
            let est = common_view_offset(
                pr(range_a, dt_a, sv),
                range_a,
                pr(range_b, dt_b, sv),
                range_b,
            );
            // Femtosecond tolerance: the residual is pure f64 roundoff of c·dt at the
            // ~2×10⁷ m pseudorange magnitude, far below any real clock measurement.
            assert!((est - (dt_a - dt_b)).abs() < 1e-15, "sv {sv}: est {est}");
        }
    }
}
