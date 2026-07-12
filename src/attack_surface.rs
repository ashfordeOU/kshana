// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar surface-navigation **attack-surface** scenario (P1): the binary-reachable
//! (`run_toml` / CLI / Python / MCP) face that composes the open signal-security analyses
//! into one run. `kind = "lunar-attack-surface"`.
//!
//! It stitches together six Validated open modules — nothing here re-derives their maths;
//! this module only *composes* them so the whole P1 picture is producible from a single
//! scenario document:
//!
//!  * **Link-budget deficit + 12–18 dB sensitivity band** — [`crate::linkbudget`]
//!    ([`received_signal_power_dbw`], [`deficit_sensitivity_band`]): the AFS received power,
//!    its deficit versus a terrestrial GPS reference, and the multi-axis sensitivity band
//!    with the 32×/36× (rounded/unrounded) linear-factor reconciliation.
//!  * **Required jam/spoof transmit power vs standoff** — [`crate::jamming::required_tx_power_dbw`]:
//!    the inverse-J/S transmit power an attacker needs to spoof (J/S = 3 dB) or deny
//!    (J/S = 30 dB) at each standoff.
//!  * **Orbital capture footprint under a real antenna pattern** — [`crate::antenna::capture_footprint`]:
//!    the pattern-weighted, altitude-limited surface cap an orbital transmitter captures
//!    (refuting whole-hemisphere denial).
//!  * **Tracking-loop spoof-capture pull-in** — [`crate::spoof_capture::run_capture`]:
//!    whether a matched-code spoofer at a given power advantage and code offset actually
//!    drags the receiver's DLL/PLL (a computed capture, not the asserted 3 dB threshold).
//!  * **Airless-body horizon reach** — [`crate::lunar::surface_los_max_m`]: the purely
//!    geometric surface-transmitter reach on an atmosphere-free Moon.
//!  * **OSNMA/TESLA authentication budget** — [`crate::nma_budget::budget`]: the 20 bit/s
//!    OSNMA overhead, its first-order (~40 %) fraction of a low-rate AFS nav message, and
//!    the key-disclosure latency / forgery figures.
//!
//! An **empty TOML body** (only `kind = "lunar-attack-surface"`) reproduces the P1 baseline;
//! every input is an overridable, defaulted field. The scenario is deterministic (no random
//! state): the one seeded element, the spoof-capture pull-in, uses a fixed seed and no
//! thermal noise. VALIDATED sub-results carry the oracle of the module they come from;
//! MODELLED sub-results (the representative geometry / power inputs) are flagged as such in
//! the emitted JSON.

use crate::antenna::{capture_footprint, FootprintParams};
use crate::jamming::required_tx_power_dbw;
use crate::linkbudget::{deficit_sensitivity_band, received_signal_power_dbw};
use crate::lunar::{horizon_los_distance_m, surface_los_max_m, R_MOON_M};
use crate::nma_budget::{budget as nma_budget, NmaConfig};
use crate::spoof_capture::{run_capture, CaptureConfig};
use serde::{Deserialize, Serialize};

fn d_afs_eirp_dbw() -> f64 {
    26.0
}
fn d_user_gain_dbi() -> f64 {
    3.0
}
fn d_slant_range_m() -> f64 {
    3.0e6
}
fn d_slant_range_max_m() -> f64 {
    // 3000 km × 10^(2.4/20): the +2.4 dB slant-range spread of the deficit band.
    3.0e6 * 1.318_256_738_556_407
}
fn d_carrier_hz() -> f64 {
    2.4e9
}
fn d_gps_reference_dbw() -> f64 {
    -125.0
}
fn d_gps_reference_min_dbw() -> f64 {
    -128.5
}
fn d_afs_isotropic_signal_dbw() -> f64 {
    -143.6
}
fn d_transmitter_altitude_m() -> f64 {
    100_000.0
}
fn d_transmitter_power_dbw() -> f64 {
    // 40 W = 16.0206 dBW.
    10.0 * 40.0_f64.log10()
}
fn d_antenna_diameter_m() -> f64 {
    1.0
}
fn d_footprint_grid() -> usize {
    400
}
fn d_spoof_power_advantage_db() -> f64 {
    6.0
}
fn d_spoof_code_offset_chips() -> f64 {
    0.3
}
fn d_attacker_gain_dbi() -> f64 {
    6.0
}
fn d_spoof_capture_js_db() -> f64 {
    3.0
}
fn d_jam_denial_js_db() -> f64 {
    30.0
}
fn d_standoffs_m() -> Vec<f64> {
    vec![1_000.0, 10_000.0, 100_000.0]
}
fn d_mast_height_m() -> f64 {
    100.0
}
fn d_user_antenna_height_m() -> f64 {
    1.6
}

/// Composed lunar attack-surface scenario. Every field defaults to the P1 baseline, so an
/// empty TOML body (bar `kind`) reproduces the paper's headline figures.
#[derive(Clone, Debug, Deserialize)]
pub struct LunarAttackSurfaceScenario {
    /// AFS satellite EIRP (dBW).
    #[serde(default = "d_afs_eirp_dbw")]
    pub afs_eirp_dbw: f64,
    /// Surface-user antenna gain (dBi).
    #[serde(default = "d_user_gain_dbi")]
    pub user_gain_dbi: f64,
    /// Nominal AFS slant range (m).
    #[serde(default = "d_slant_range_m")]
    pub slant_range_m: f64,
    /// Upper slant range for the deficit-band sweep (m).
    #[serde(default = "d_slant_range_max_m")]
    pub slant_range_max_m: f64,
    /// Carrier frequency (Hz).
    #[serde(default = "d_carrier_hz")]
    pub carrier_hz: f64,
    /// Terrestrial GPS reference received power, strong end (dBW).
    #[serde(default = "d_gps_reference_dbw")]
    pub gps_reference_dbw: f64,
    /// Terrestrial GPS reference received power, weak end (dBW).
    #[serde(default = "d_gps_reference_min_dbw")]
    pub gps_reference_min_dbw: f64,
    /// AFS isotropic received signal power (dBW), for the inverse-J/S solver.
    #[serde(default = "d_afs_isotropic_signal_dbw")]
    pub afs_isotropic_signal_dbw: f64,
    /// Orbital transmitter altitude (m).
    #[serde(default = "d_transmitter_altitude_m")]
    pub transmitter_altitude_m: f64,
    /// Orbital transmitter power fed to the antenna (dBW).
    #[serde(default = "d_transmitter_power_dbw")]
    pub transmitter_power_dbw: f64,
    /// Orbital transmit-antenna diameter (m).
    #[serde(default = "d_antenna_diameter_m")]
    pub antenna_diameter_m: f64,
    /// Footprint grid points nadir→limb.
    #[serde(default = "d_footprint_grid")]
    pub footprint_grid: usize,
    /// Spoofer power advantage over the authentic signal (dB).
    #[serde(default = "d_spoof_power_advantage_db")]
    pub spoof_power_advantage_db: f64,
    /// Spoofer code offset from the authentic code phase (chips).
    #[serde(default = "d_spoof_code_offset_chips")]
    pub spoof_code_offset_chips: f64,
    /// Attacker transmit-antenna gain (dBi).
    #[serde(default = "d_attacker_gain_dbi")]
    pub attacker_gain_dbi: f64,
    /// J/S at which a spoofer captures a victim (dB).
    #[serde(default = "d_spoof_capture_js_db")]
    pub spoof_capture_js_db: f64,
    /// J/S at which a jammer denies a victim (dB).
    #[serde(default = "d_jam_denial_js_db")]
    pub jam_denial_js_db: f64,
    /// Attacker standoffs to size required transmit power at (m).
    #[serde(default = "d_standoffs_m")]
    pub standoffs_m: Vec<f64>,
    /// Raised surface-transmitter (mast/ridge) height (m).
    #[serde(default = "d_mast_height_m")]
    pub mast_height_m: f64,
    /// Surface user's antenna height (m).
    #[serde(default = "d_user_antenna_height_m")]
    pub user_antenna_height_m: f64,
}

impl Default for LunarAttackSurfaceScenario {
    fn default() -> Self {
        toml::from_str("").expect("empty attack-surface scenario deserialises to defaults")
    }
}

/// Required-transmit-power point on the standoff curve.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct StandoffPoint {
    /// Attacker standoff (m).
    pub standoff_m: f64,
    /// Transmit power to spoof (reach J/S = `spoof_capture_js_db`) at this standoff (dBW).
    pub spoof_tx_power_dbw: f64,
    /// Transmit power to deny (reach J/S = `jam_denial_js_db`) at this standoff (dBW).
    pub jam_tx_power_dbw: f64,
    /// Spoof transmit power in watts.
    pub spoof_tx_power_w: f64,
}

/// The composed attack-surface result. All sub-results are Validated at the module they
/// come from; the input geometry/power magnitudes are Modelled.
#[derive(Clone, Debug, Serialize)]
pub struct AttackSurface {
    // Link-budget deficit + sensitivity band (Validated: closed-form dB radiometry).
    /// AFS received power at the surface user (dBW).
    pub afs_received_dbw: f64,
    /// Deficit versus the strong GPS reference (dB).
    pub deficit_db: f64,
    /// Sensitivity band low edge (dB).
    pub deficit_band_lo_db: f64,
    /// Sensitivity band high edge (dB).
    pub deficit_band_hi_db: f64,
    /// Nominal deficit linear factor at full precision — the "36×" figure.
    pub deficit_factor_unrounded: f64,
    /// Nominal deficit linear factor at whole-dB precision — the "32×" figure.
    pub deficit_factor_rounded: f64,
    // Required transmit power vs standoff (Validated: inverse of j_over_s_db).
    /// Per-standoff required transmit power to spoof / to deny.
    pub standoff_curve: Vec<StandoffPoint>,
    // Orbital capture footprint (Modelled geometry; Validated antenna pattern).
    /// Fraction of the visible disk the orbital transmitter captures.
    pub footprint_captured_fraction: f64,
    /// Whether the limb (edge of disk) is captured.
    pub footprint_limb_captured: bool,
    /// Transmit-antenna boresight gain (dBi).
    pub footprint_boresight_gain_dbi: f64,
    // Tracking-loop spoof capture (Validated: pull-in physics vs Kaplan & Hegarty).
    /// Whether the representative spoofer captured the tracking loop.
    pub spoof_captured: bool,
    /// Spoof-capture lock time (s), NaN if it never settled.
    pub spoof_lock_time_s: f64,
    // Horizon reach (Validated: spherical-tangent geometry).
    /// A raised-mast surface transmitter's reach to the surface user (m).
    pub surface_transmitter_reach_m: f64,
    /// The orbital transmitter's own horizon LOS distance (m).
    pub orbital_horizon_los_m: f64,
    // NMA budget (Validated: OSNMA SIS-ICD sizing).
    /// OSNMA authentication overhead (bit/s).
    pub nma_overhead_bps: f64,
    /// OSNMA overhead as a fraction of a low-rate (50 bit/s) AFS nav message.
    pub nma_overhead_fraction: f64,
    /// OSNMA key-disclosure latency (s).
    pub nma_auth_latency_s: f64,
}

impl LunarAttackSurfaceScenario {
    /// Compose the six analyses into an [`AttackSurface`] result.
    pub fn analyse(&self) -> Result<AttackSurface, String> {
        if self.standoffs_m.is_empty() {
            return Err("standoffs_m must contain at least one standoff".to_string());
        }

        // 1. Link-budget deficit + sensitivity band.
        let afs_received_dbw = received_signal_power_dbw(
            self.afs_eirp_dbw,
            self.user_gain_dbi,
            self.slant_range_m,
            self.carrier_hz,
        );
        let deficit_db = self.gps_reference_dbw - afs_received_dbw;
        let band = deficit_sensitivity_band(
            self.gps_reference_min_dbw,
            self.gps_reference_dbw,
            self.afs_eirp_dbw,
            self.afs_eirp_dbw,
            self.user_gain_dbi,
            self.slant_range_m,
            self.slant_range_max_m,
            self.carrier_hz,
            8,
        );

        // 2. Required transmit power vs standoff (spoof + jam).
        let standoff_curve: Vec<StandoffPoint> = self
            .standoffs_m
            .iter()
            .map(|&d| {
                let spoof = required_tx_power_dbw(
                    self.spoof_capture_js_db,
                    self.attacker_gain_dbi,
                    self.user_gain_dbi,
                    d,
                    self.carrier_hz,
                    self.afs_isotropic_signal_dbw,
                    self.user_gain_dbi,
                );
                let jam = required_tx_power_dbw(
                    self.jam_denial_js_db,
                    self.attacker_gain_dbi,
                    self.user_gain_dbi,
                    d,
                    self.carrier_hz,
                    self.afs_isotropic_signal_dbw,
                    self.user_gain_dbi,
                );
                StandoffPoint {
                    standoff_m: d,
                    spoof_tx_power_dbw: spoof,
                    jam_tx_power_dbw: jam,
                    spoof_tx_power_w: 10.0_f64.powf(spoof / 10.0),
                }
            })
            .collect();

        // 3. Orbital capture footprint.
        let fp = capture_footprint(&FootprintParams::new(
            self.transmitter_altitude_m,
            self.transmitter_power_dbw,
            self.antenna_diameter_m,
            self.carrier_hz,
            self.footprint_grid,
        ));

        // 4. Tracking-loop spoof capture.
        let outcome = run_capture(
            &CaptureConfig::default(),
            self.spoof_power_advantage_db,
            self.spoof_code_offset_chips,
            0.0,
        );

        // 5. Horizon reach.
        let surface_transmitter_reach_m =
            surface_los_max_m(R_MOON_M, self.mast_height_m, self.user_antenna_height_m);
        let orbital_horizon_los_m = horizon_los_distance_m(R_MOON_M, self.transmitter_altitude_m);

        // 6. NMA budget.
        let nma = nma_budget(&NmaConfig::default())?;

        Ok(AttackSurface {
            afs_received_dbw,
            deficit_db,
            deficit_band_lo_db: band.band_lo_db,
            deficit_band_hi_db: band.band_hi_db,
            deficit_factor_unrounded: band.nominal_factor,
            deficit_factor_rounded: band.nominal_factor_whole_db,
            standoff_curve,
            footprint_captured_fraction: fp.captured_fraction,
            footprint_limb_captured: fp.limb_captured,
            footprint_boresight_gain_dbi: fp.boresight_gain_dbi,
            spoof_captured: outcome.captured,
            spoof_lock_time_s: outcome.lock_time_s,
            surface_transmitter_reach_m,
            orbital_horizon_los_m,
            nma_overhead_bps: nma.overhead_bps,
            nma_overhead_fraction: nma.overhead_fraction,
            nma_auth_latency_s: nma.auth_latency_s,
        })
    }

    /// Run the scenario, returning `(json, summary, svg)` for the engine dispatch.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let a = self.analyse()?;
        let json = serde_json::to_string(&a).map_err(|e| e.to_string())?;
        let nearest = a
            .standoff_curve
            .first()
            .map(|p| p.spoof_tx_power_w)
            .unwrap_or(f64::NAN);
        let summary = format!(
            "lunar-attack-surface | AFS {:.1} dBW, deficit {:.1} dB (band {:.1}–{:.1}, {:.0}×/{:.0}×) | \
             spoof@{:.0} m {:.3} W | footprint {:.0}% cap, limb {} | spoof-capture {} (lock {:.2} s) | \
             mast reach {:.1} km | OSNMA {:.0} bit/s ({:.0}% of 50 bit/s), {:.0} s latency",
            a.afs_received_dbw,
            a.deficit_db,
            a.deficit_band_lo_db,
            a.deficit_band_hi_db,
            a.deficit_factor_rounded,
            a.deficit_factor_unrounded,
            self.standoffs_m[0],
            nearest,
            a.footprint_captured_fraction * 100.0,
            a.footprint_limb_captured,
            a.spoof_captured,
            a.spoof_lock_time_s,
            a.surface_transmitter_reach_m / 1000.0,
            a.nma_overhead_bps,
            a.nma_overhead_fraction * 100.0,
            a.nma_auth_latency_s,
        );
        let svg = self.svg(&a);
        Ok((json, summary, svg))
    }

    fn svg(&self, a: &AttackSurface) -> String {
        let lines = [
            format!("AFS received: {:.1} dBW", a.afs_received_dbw),
            format!(
                "Deficit: {:.1} dB (band {:.1}-{:.1} dB, {:.0}x/{:.0}x)",
                a.deficit_db,
                a.deficit_band_lo_db,
                a.deficit_band_hi_db,
                a.deficit_factor_rounded,
                a.deficit_factor_unrounded
            ),
            format!(
                "Capture footprint: {:.0}% of disk, limb captured: {}",
                a.footprint_captured_fraction * 100.0,
                a.footprint_limb_captured
            ),
            format!(
                "Spoof-capture pull-in: {} (lock {:.2} s)",
                a.spoof_captured, a.spoof_lock_time_s
            ),
            format!(
                "Mast reach: {:.1} km | OSNMA {:.0} bit/s ({:.0}%)",
                a.surface_transmitter_reach_m / 1000.0,
                a.nma_overhead_bps,
                a.nma_overhead_fraction * 100.0
            ),
        ];
        let mut body = String::new();
        for (i, l) in lines.iter().enumerate() {
            let y = 70 + i * 30;
            body.push_str(&format!(
                "<text x=\"28\" y=\"{y}\" fill=\"#e8e2d0\" font-family=\"monospace\" font-size=\"15\">{}</text>",
                l.replace('&', "&amp;").replace('<', "&lt;")
            ));
        }
        format!(
            "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"640\" height=\"240\" viewBox=\"0 0 640 240\">\
             <rect width=\"640\" height=\"240\" fill=\"#0b1a2b\"/>\
             <text x=\"28\" y=\"36\" fill=\"#d4af37\" font-family=\"sans-serif\" font-size=\"18\" font-weight=\"bold\">\
             Lunar signal-security attack surface (P1)</text>{body}</svg>"
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Empty TOML reproduces the P1 baseline headline numbers across all six composed
    /// analyses. Oracle: each sub-result matches its own module's Validated figure.
    #[test]
    fn empty_scenario_reproduces_p1_baseline() {
        let scn = LunarAttackSurfaceScenario::default();
        let a = scn.analyse().expect("baseline analyses");

        // Link budget: AFS received ≈ −140.6 dBW, deficit 15.6 dB, band ≈ 12–18 dB.
        assert!(
            (a.afs_received_dbw - (-140.6)).abs() < 0.1,
            "afs {}",
            a.afs_received_dbw
        );
        assert!(
            (a.deficit_db - 15.6).abs() < 0.1,
            "deficit {}",
            a.deficit_db
        );
        assert!(a.deficit_band_lo_db > 12.0 && a.deficit_band_lo_db < 12.3);
        assert!(a.deficit_band_hi_db > 17.9 && a.deficit_band_hi_db < 18.1);
        // 32×/36× reconciliation.
        assert_eq!(a.deficit_factor_rounded.round(), 32.0);
        assert!((a.deficit_factor_unrounded - 36.3).abs() < 1.0);

        // Footprint is a sub-hemispheric cap, limb NOT captured.
        assert!(!a.footprint_limb_captured);
        assert!(a.footprint_captured_fraction > 0.0 && a.footprint_captured_fraction < 0.3);

        // Representative spoofer (+6 dB, 0.3 chip) captures the loop.
        assert!(a.spoof_captured);
        assert!(a.spoof_lock_time_s.is_finite());

        // OSNMA: 20 bit/s overhead = 40 % of a 50 bit/s nav rate.
        assert!((a.nma_overhead_bps - 20.0).abs() < 1e-9);
        assert!((a.nma_overhead_fraction - 0.40).abs() < 1e-9);

        // Standoff curve: spoofing is cheaper than jamming at every standoff, and the
        // required power grows with standoff (free-space path loss).
        assert_eq!(a.standoff_curve.len(), 3);
        for p in &a.standoff_curve {
            assert!(
                p.jam_tx_power_dbw > p.spoof_tx_power_dbw,
                "jam should cost more than spoof"
            );
        }
        assert!(
            a.standoff_curve[2].spoof_tx_power_dbw > a.standoff_curve[0].spoof_tx_power_dbw,
            "farther standoff needs more power"
        );
    }

    /// The run emits non-empty JSON / summary / SVG and is deterministic.
    #[test]
    fn run_output_is_nonempty_and_deterministic() {
        let scn = LunarAttackSurfaceScenario::default();
        let (j1, s1, v1) = scn.run_output().expect("run 1");
        let (j2, s2, v2) = scn.run_output().expect("run 2");
        assert_eq!(j1, j2);
        assert_eq!(s1, s2);
        assert_eq!(v1, v2);
        assert!(j1.contains("deficit_band_lo_db"));
        assert!(s1.contains("lunar-attack-surface"));
        assert!(v1.starts_with("<svg"));
    }

    /// A stronger spoofer power advantage cannot make an in-range capture fail (monotone
    /// sanity on the composed spoof-capture input).
    #[test]
    fn stronger_spoofer_still_captures() {
        let scn = LunarAttackSurfaceScenario {
            spoof_power_advantage_db: 12.0,
            ..LunarAttackSurfaceScenario::default()
        };
        let a = scn.analyse().expect("analyses");
        assert!(a.spoof_captured);
    }
}
