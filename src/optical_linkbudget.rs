// SPDX-License-Identifier: AGPL-3.0-only
//! **Optical (1550 nm) two-way link budget** — the photonic companion to the RF
//! [`crate::linkbudget`] module. Where the RF budget turns EIRP / `G/T` / range into a
//! carrier-to-noise density, the optical budget turns transmit power, aperture, range and
//! detection efficiency into a **detected-photon rate**, and from that photon count into a
//! **photon-limited ranging precision** and a **diffraction-limited beam footprint**. This
//! is the optical column of the P5 heterogeneous-PNT table.
//!
//! ## What it computes
//!
//! * **Photon energy** `E = hc/λ` ([`photon_energy_j`]) — the SI-2019 closed form.
//! * **Diffraction divergence** `θ = λ/D` ([`diffraction_divergence_rad`]) and the
//!   far-field **beam footprint** `d = θ·L = (λ/D)·L` ([`diffraction_footprint_m`]). At a
//!   lunar range (`L ≈ 3.84×10⁸ m`) a `D ≈ 0.85 m` transmit aperture at 1550 nm spreads to
//!   `≈ 0.7 km` — the P5 headline. The Airy first-null variant `1.22·λ/D·L`
//!   ([`airy_footprint_m`]) is provided for a filled circular aperture.
//! * **Photon-limited ranging CRLB.** For a signal pulse of RMS width `σ_τ` detected as
//!   `N` photons, the Cramér–Rao lower bound on the time-of-arrival estimate is
//!   `σ_ToA = σ_τ/√N` ([`photon_limited_toa_crlb_s`]) and the range bound is `c·σ_ToA`
//!   one-way, `(c/2)·σ_ToA` for a two-way (round-trip) measurement
//!   ([`photon_limited_range_crlb_m`]). This is the same shot-noise `1/√N` scaling the
//!   entanglement time-transfer link in [`crate::quantum_devices`] uses; the two agree
//!   exactly when the detected-photon count and detector jitter are matched (asserted in
//!   the tests).
//! * **The link budget itself** ([`optical_link_budget`]): the far-field geometric capture
//!   fraction `(D_rx/d_beam)²`, the lumped atmospheric / pointing loss allocation, the
//!   received optical power and the detected-photon rate.
//!
//! ## Validated vs Modelled
//!
//! - **Validated (closed form).** The photon energy `hc/λ`, the diffraction footprint
//!   `(λ/D)·L`, and the photon-limited ToA/range CRLB `σ_τ/√N` are exact analytic
//!   identities, checked to machine precision against independently-computed hand values.
//! - **Modelled.** The atmospheric-transmission and pointing-loss *allocations* (dB) are
//!   representative 1550 nm ground-terminal values, and the top-hat geometric-capture
//!   fraction is a first-order (uniform-beam) approximation of a Gaussian intensity
//!   profile. These set the received-power magnitude but not the CRLB *formula*.
//!
//! ## References
//!
//! * Degnan, *Millimeter Accuracy Satellite Laser Ranging: A Review* (AGU Geodynamics 25,
//!   1993) — single-photon ranging precision and the `σ_τ/√N` timing bound.
//! * Goodman, *Introduction to Fourier Optics* — the `λ/D` diffraction divergence.
//! * Kaushal & Kaddoum, *Optical Communication in Space* (IEEE Access, 2017) — 1550 nm
//!   free-space link-budget conventions and atmospheric-loss allocations.

use crate::timegeo::C_M_PER_S;

/// **Planck's constant** `h = 6.626 070 15×10⁻³⁴ J·s`, the SI-2019 fixed value. The photon
/// energy `E = hν = hc/λ` is built from it and the crate speed of light [`C_M_PER_S`].
pub const PLANCK_J_S: f64 = 6.626_070_15e-34;

/// The **1550 nm** telecom C-band wavelength (m) the optical PNT link is specified at — the
/// low-atmospheric-loss, eye-safe, mature-component band used for free-space optical links.
pub const WAVELENGTH_1550_NM_M: f64 = 1.55e-6;

/// **Photon energy** `E = hc/λ` (J) at wavelength `wavelength_m` (m). Closed form from the
/// SI-2019 [`PLANCK_J_S`] and the crate speed of light [`C_M_PER_S`]; at 1550 nm it is
/// `≈ 1.28×10⁻¹⁹ J` (≈ 0.8 eV). Dividing a received optical power (W) by this gives the
/// photon arrival rate (Hz).
pub fn photon_energy_j(wavelength_m: f64) -> f64 {
    PLANCK_J_S * C_M_PER_S / wavelength_m
}

/// **Diffraction divergence half-angle** `θ = λ/D` (rad) for a transmit aperture of
/// diameter `aperture_diameter_m` (m) at wavelength `wavelength_m` (m). The characteristic
/// far-field spreading of a diffraction-limited beam; the Airy first-null of a filled
/// circular aperture is the `1.22×` multiple of this (see [`airy_footprint_m`]).
pub fn diffraction_divergence_rad(wavelength_m: f64, aperture_diameter_m: f64) -> f64 {
    wavelength_m / aperture_diameter_m
}

/// **Diffraction-limited beam footprint** diameter `d = (λ/D)·L` (m) at range `range_m` (m)
/// for a transmit aperture `aperture_diameter_m` (m) at wavelength `wavelength_m` (m). The
/// far-field product of the divergence [`diffraction_divergence_rad`] and the range: a
/// 1550 nm beam from a `D ≈ 0.85 m` aperture spreads to `≈ 0.7 km` at the ≈ 3.84×10⁸ m
/// Earth–Moon range — the P5 optical-column headline. Closed form, exact.
pub fn diffraction_footprint_m(wavelength_m: f64, aperture_diameter_m: f64, range_m: f64) -> f64 {
    diffraction_divergence_rad(wavelength_m, aperture_diameter_m) * range_m
}

/// **Airy first-null footprint** diameter `d = 1.22·(λ/D)·L` (m): the diameter of the
/// first dark ring of the Airy pattern of a filled circular aperture at range `range_m`.
/// The `1.22×` companion to the plain `λ/D` [`diffraction_footprint_m`], for when the
/// circular-aperture form factor is wanted.
pub fn airy_footprint_m(wavelength_m: f64, aperture_diameter_m: f64, range_m: f64) -> f64 {
    1.22 * diffraction_footprint_m(wavelength_m, aperture_diameter_m, range_m)
}

/// **Photon-limited time-of-arrival CRLB** `σ_ToA = σ_τ/√N` (s): the Cramér–Rao lower bound
/// on estimating the arrival time of a signal pulse of RMS temporal width
/// `pulse_rms_width_s` (s) from `detected_photons` independent detected photons. Each
/// photon carries Fisher information `1/σ_τ²` about the arrival time, so `N` photons give
/// `N/σ_τ²` and the bound is `σ_τ/√N`. This is the shot-noise `1/√N` scaling shared with
/// the [`crate::quantum_devices`] entanglement time-transfer link (with `σ_τ` the detector
/// jitter). Returns `+∞` for a non-positive photon count (no information).
pub fn photon_limited_toa_crlb_s(pulse_rms_width_s: f64, detected_photons: f64) -> f64 {
    if detected_photons <= 0.0 {
        return f64::INFINITY;
    }
    pulse_rms_width_s / detected_photons.sqrt()
}

/// **Photon-limited ranging CRLB** (m) from the time-of-arrival bound
/// [`photon_limited_toa_crlb_s`]: `σ_R = c·σ_ToA` for a one-way (transmit-time-tagged)
/// measurement, or `σ_R = (c/2)·σ_ToA` for a two-way / round-trip measurement (range is
/// `c·Δt/2`, so the range bound is half the round-trip-time bound). Uses the crate speed of
/// light [`C_M_PER_S`].
pub fn photon_limited_range_crlb_m(
    pulse_rms_width_s: f64,
    detected_photons: f64,
    two_way: bool,
) -> f64 {
    let toa = photon_limited_toa_crlb_s(pulse_rms_width_s, detected_photons);
    let scale = if two_way { 0.5 } else { 1.0 };
    scale * C_M_PER_S * toa
}

/// The inputs to a 1550 nm two-way optical link budget. All losses are in dB ≥ 0.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct OpticalLinkParams {
    /// Carrier wavelength (m). 1550 nm for the telecom-C-band optical PNT link.
    pub wavelength_m: f64,
    /// Transmit optical power (W).
    pub tx_power_w: f64,
    /// Transmit aperture diameter (m) — sets the diffraction footprint (`λ/D·L`).
    pub tx_aperture_m: f64,
    /// Receive aperture diameter (m) — sets the geometric capture fraction.
    pub rx_aperture_m: f64,
    /// One-way link range (m).
    pub range_m: f64,
    /// Combined transmit + receive optics throughput (0..1): a **Modelled** allocation.
    pub optics_efficiency: f64,
    /// Detector quantum efficiency (0..1): a **Modelled** allocation.
    pub detector_efficiency: f64,
    /// Lumped one-way **atmospheric** transmission loss (dB ≥ 0): a **Modelled** 1550 nm
    /// clear-sky allocation.
    pub atmospheric_loss_db: f64,
    /// Lumped **pointing / jitter** loss (dB ≥ 0): a **Modelled** terminal allocation.
    pub pointing_loss_db: f64,
}

impl Default for OpticalLinkParams {
    /// Representative 1550 nm Earth–Moon two-way optical-terminal parameters (illustrative,
    /// public-source): a 0.85 m aperture pair (`≈ 0.7 km` footprint at lunar range), 3 dB
    /// atmospheric and 3 dB pointing allocations. These set magnitudes, not the CRLB form.
    fn default() -> Self {
        OpticalLinkParams {
            wavelength_m: WAVELENGTH_1550_NM_M,
            tx_power_w: 1.0e-3, // 1 mW mean optical power (photon-starved lunar regime)
            tx_aperture_m: 0.85,
            rx_aperture_m: 0.85,
            range_m: 3.84e8, // mean Earth–Moon distance
            optics_efficiency: 0.5,
            detector_efficiency: 0.7,
            atmospheric_loss_db: 3.0,
            pointing_loss_db: 3.0,
        }
    }
}

/// The result of an optical link budget: the beam geometry, the loss account, the received
/// optical power and the detected-photon rate.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct OpticalLinkResult {
    /// Diffraction divergence half-angle `λ/D` (rad).
    pub divergence_rad: f64,
    /// Far-field beam footprint diameter `(λ/D)·L` (m).
    pub footprint_m: f64,
    /// Far-field geometric capture loss (dB): `−10·log10((D_rx/d_beam)²)`, ≥ 0.
    pub geometric_loss_db: f64,
    /// Total one-way loss (dB): geometric + atmospheric + pointing.
    pub total_loss_db: f64,
    /// Received optical power at the detector (W).
    pub received_power_w: f64,
    /// Photon energy `hc/λ` (J).
    pub photon_energy_j: f64,
    /// Detected-photon rate (Hz): `received_power / photon_energy × detector_efficiency`.
    pub photon_rate_hz: f64,
}

/// Compute the one-way **optical link budget** for `p`.
///
/// The far-field geometric capture fraction is `(D_rx / d_beam)²` (the receive aperture
/// area over the diffraction-spread beam area, a top-hat approximation, clamped ≤ 1). The
/// received power is `P_tx` times that fraction, the optics throughput, and the
/// atmospheric + pointing transmissions `10^(−L/10)`; the detected-photon rate is the
/// received power over the photon energy, scaled by the detector efficiency. The geometry
/// is exact far-field diffraction; the loss allocations are the Modelled inputs.
pub fn optical_link_budget(p: &OpticalLinkParams) -> OpticalLinkResult {
    let divergence_rad = diffraction_divergence_rad(p.wavelength_m, p.tx_aperture_m);
    let footprint_m = divergence_rad * p.range_m;
    // Top-hat geometric capture: receive area / beam area = (D_rx / d_beam)², capped at 1
    // (the receiver cannot capture more than the whole beam).
    let capture = ((p.rx_aperture_m / footprint_m.max(f64::MIN_POSITIVE)).powi(2)).min(1.0);
    let geometric_loss_db = -10.0 * capture.log10();
    let total_loss_db = geometric_loss_db + p.atmospheric_loss_db + p.pointing_loss_db;
    let transmission = 10f64.powf(-total_loss_db / 10.0);
    let received_power_w = p.tx_power_w * transmission * p.optics_efficiency;
    let e_photon = photon_energy_j(p.wavelength_m);
    let photon_rate_hz = received_power_w / e_photon * p.detector_efficiency;
    OpticalLinkResult {
        divergence_rad,
        footprint_m,
        geometric_loss_db,
        total_loss_db,
        received_power_w,
        photon_energy_j: e_photon,
        photon_rate_hz,
    }
}

/// The number of detected photons over an integration time: `rate_hz · integration_s`
/// (the detector efficiency is already folded into the rate by [`optical_link_budget`]).
/// Clamped to ≥ 0.
pub fn detected_photons(photon_rate_hz: f64, integration_s: f64) -> f64 {
    (photon_rate_hz * integration_s.max(0.0)).max(0.0)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::quantum_devices::EntanglementTimeLink;

    /// Photon energy matches the independently-computed `hc/λ` hand value to machine
    /// precision, and is the right order of magnitude (≈ 1.28e-19 J ≈ 0.8 eV at 1550 nm).
    /// Oracle: the SI-2019 closed form `E = hc/λ`.
    #[test]
    fn photon_energy_matches_hc_over_lambda() {
        let lambda = WAVELENGTH_1550_NM_M;
        // Hand value from the raw constants, independent of the implementation.
        let hand = 6.626_070_15e-34 * 299_792_458.0 / lambda;
        let got = photon_energy_j(lambda);
        assert!((got - hand).abs() < 1e-30, "E = {got} J vs hand {hand} J");
        assert!(
            (1.2e-19..1.35e-19).contains(&got),
            "1550 nm photon energy {got} J not ≈ 1.28e-19 J"
        );
        // ≈ 0.8 eV (1 eV = 1.602176634e-19 J).
        let ev = got / 1.602_176_634e-19;
        assert!((0.75..0.85).contains(&ev), "photon {ev} eV not ≈ 0.8 eV");
    }

    /// The diffraction footprint equals `(λ/D)·range` to machine precision, and the P5
    /// headline holds: a 0.85 m aperture at 1550 nm spreads to ≈ 0.7 km at lunar range.
    /// Oracle: the closed-form far-field diffraction identity.
    #[test]
    fn diffraction_footprint_is_lambda_over_d_times_range() {
        let lambda = WAVELENGTH_1550_NM_M;
        let d = 0.85;
        let range = 3.84e8; // Earth–Moon
        let hand = lambda / d * range;
        let got = diffraction_footprint_m(lambda, d, range);
        assert!(
            (got - hand).abs() < 1e-9,
            "footprint {got} m vs hand {hand} m"
        );
        // P5 headline: ≈ 0.7 km.
        assert!(
            (650.0..750.0).contains(&got),
            "lunar footprint {got} m not ≈ 0.7 km"
        );
        // The Airy first-null is exactly 1.22× the plain λ/D footprint.
        assert!((airy_footprint_m(lambda, d, range) - 1.22 * got).abs() < 1e-9);
    }

    /// The photon-limited ranging CRLB matches the analytic `σ_τ/√N` timing bound (× c,
    /// halved for two-way) to machine precision, and improves as `1/√N`. Oracle: the
    /// closed-form Cramér–Rao lower bound for photon-limited time-of-arrival estimation.
    #[test]
    fn ranging_crlb_matches_the_analytic_photon_limited_bound() {
        let sigma_tau = 50e-12_f64; // 50 ps RMS pulse
        let n = 10_000.0_f64;
        // Hand ToA bound: σ_τ/√N.
        let toa_hand = sigma_tau / n.sqrt();
        assert!((photon_limited_toa_crlb_s(sigma_tau, n) - toa_hand).abs() < 1e-24);

        // One-way range bound = c·σ_ToA.
        let c = 299_792_458.0;
        let r1_hand = c * toa_hand;
        assert!((photon_limited_range_crlb_m(sigma_tau, n, false) - r1_hand).abs() < 1e-12);
        // Two-way range bound = (c/2)·σ_ToA — exactly half the one-way bound.
        let r2 = photon_limited_range_crlb_m(sigma_tau, n, true);
        assert!((r2 - 0.5 * r1_hand).abs() < 1e-12);
        assert!((photon_limited_range_crlb_m(sigma_tau, n, false) / r2 - 2.0).abs() < 1e-12);

        // 100× more photons → 10× tighter bound (the 1/√N law).
        let r_100x = photon_limited_range_crlb_m(sigma_tau, 100.0 * n, false);
        assert!((r1_hand / r_100x - 10.0).abs() < 1e-9);

        // Zero photons carry no information: the bound is infinite.
        assert!(photon_limited_toa_crlb_s(sigma_tau, 0.0).is_infinite());
    }

    /// The optical shot-noise timing bound is the SAME `jitter/√N` law the
    /// `quantum_devices` entanglement time-transfer link uses: with dark counts and the
    /// systematic floor removed and the detected-photon count matched, the two agree to
    /// machine precision. This is the shared-model cross-check that ties L26 to the
    /// quantum-device library.
    #[test]
    fn shot_bound_agrees_with_quantum_devices_link() {
        let jitter = 50e-12;
        let integration = 1.0;
        // A pure shot-limited entanglement link (no dark counts, no floor).
        let link = EntanglementTimeLink {
            single_photon_jitter_s: jitter,
            dark_rate_hz: 0.0,
            systematic_floor_s: 0.0,
            ..Default::default()
        };
        let n = link.detected_coincidence_rate_hz() * integration;
        let device = link.timing_precision_s(integration);
        let optical = photon_limited_toa_crlb_s(jitter, n);
        assert!(
            (device - optical).abs() < 1e-24,
            "quantum-devices {device} s vs optical CRLB {optical} s"
        );
    }

    /// The link budget is deterministic, finite, and physically ordered: a smaller
    /// transmit aperture spreads the beam more (bigger footprint, more geometric loss,
    /// fewer photons), and the footprint reproduces the P5 ≈ 0.7 km lunar figure. Oracle
    /// for the geometry; the loss allocations are the Modelled inputs.
    #[test]
    fn link_budget_is_deterministic_and_ordered() {
        let p = OpticalLinkParams::default();
        let a = optical_link_budget(&p);
        let b = optical_link_budget(&p);
        assert_eq!(a, b, "link budget must be deterministic");
        assert!(a.footprint_m.is_finite() && a.photon_rate_hz.is_finite());
        assert!(
            (650.0..750.0).contains(&a.footprint_m),
            "footprint {} m",
            a.footprint_m
        );
        // A smaller transmit aperture → larger footprint → more geometric loss.
        let wide = OpticalLinkParams {
            tx_aperture_m: 0.4,
            ..p
        };
        let w = optical_link_budget(&wide);
        assert!(w.footprint_m > a.footprint_m);
        assert!(w.geometric_loss_db > a.geometric_loss_db);
        assert!(w.photon_rate_hz < a.photon_rate_hz);

        // Detected photons scale linearly with integration time.
        let n1 = detected_photons(a.photon_rate_hz, 1.0);
        let n2 = detected_photons(a.photon_rate_hz, 2.0);
        assert!((n2 - 2.0 * n1).abs() < 1e-3 * n1.max(1.0));
        assert!(detected_photons(a.photon_rate_hz, -5.0) == 0.0);
    }
}
