// SPDX-License-Identifier: Apache-2.0
//! **Deep-space communications link budget** — the Friis transmission account that turns transmit
//! power, antenna gains, range and noise temperature into the carrier-to-noise-density `C/N₀`, the
//! energy-per-bit-to-noise-density `Eb/N₀`, and the **link margin** over a required `Eb/N₀`. This is
//! the telecom-design half of a deep-space mission, the companion to the navigation observable model
//! in [`crate::radiometric`]: the navigation kernel says *where* the spacecraft is from the signal's
//! timing; the link budget says *whether the signal closes at all* across the same Earth–Mars range.
//!
//! ## What it computes
//!
//! For a one-way link (transmit EIRP, receive `G/T`) the standard deep-space account is
//!
//! ```text
//!   C/N₀ = EIRP − L_fs − L_other + G/T − k       [dB-Hz]
//!   Eb/N₀ = C/N₀ − 10·log10(R_b)                 [dB]
//!   margin = Eb/N₀ − (Eb/N₀)_required            [dB],   closes ⇔ margin ≥ 0
//! ```
//!
//! with `L_fs` the free-space path loss ([`free_space_loss_db`]), `L_other` the lumped
//! pointing/polarisation/atmosphere/implementation loss, `R_b` the information bit rate (bit/s), and
//! `k = −228.6 dBW/K/Hz` Boltzmann's constant in decibel form (`10·log10(1.380649e-23)`). This is
//! the CCSDS-401 / DSN-810-005 telecom-design-control-table convention; each band's carrier
//! frequency is taken from the DSN deep-space allocations ([`band_frequency_hz`]).
//!
//! ## What it is, and is not
//!
//! This is an **engineering link budget**, not a terminal datasheet. The per-(band, profile) defaults
//! in [`default_params`] are *cited order-of-magnitude* EIRP / `G/T` / loss values representative of a
//! MARCONI-class Mars relay link (a high-gain orbiter dish to a DSN 34 m station, a lower-gain
//! lander/surface terminal on the user end); they reproduce the published deep-space envelope but are
//! **not** the calibrated budget of any specific transponder. A real mission replaces them with its
//! own design-control table. The numbers' provenance (DSN 810-005 station `G/T`, typical deep-space
//! EIRP) is documented at each default.
//!
//! ## References
//!
//! * CCSDS 401.0-B, *Radio Frequency and Modulation Systems — Part 1* (deep-space band allocations,
//!   telecom design conventions).
//! * DSN 810-005, *Deep Space Network Telecommunications Link Design Handbook* (station `G/T`, EIRP,
//!   the design-control-table form of the link equation).
//! * Friis, *A Note on a Simple Transmission Formula* (Proc. IRE, 1946) — the free-space loss.

use crate::radiometric::Band;
use crate::timegeo::C_M_PER_S;
use std::f64::consts::PI;

/// **Boltzmann's constant in decibel form**, `k = 10·log10(1.380649e-23) = −228.599…` dBW/K/Hz. The
/// thermal-noise floor term in the link equation: a system of noise temperature `T` (K) over a
/// bandwidth `B` (Hz) carries noise power `N = k·T·B`, so `N₀ = k·T` is the noise spectral density
/// and `−k` (dB) enters `C/N₀` positively. The SI 2019 fixed value of `k` is used.
pub const BOLTZMANN_DBW_PER_K_PER_HZ: f64 = -228.599_1;

/// The **mission phase** of a link, which sets the antenna / EIRP / `G/T` / range regime the
/// [`default_params`] picks. The phases mirror the deep-space mission arc the rest of the deep-space
/// engine models (cf. [`crate::mars_pnt::UserKind`]): a cruising transfer vehicle, an orbiter, a
/// descending/landed vehicle, and a fixed surface user — each with a different antenna it can point
/// and a different geometry to the relay/station.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Profile {
    /// **Transfer / cruise**: a vehicle on the Earth–Mars transfer arc, carrying a deployed
    /// high-gain antenna and tracked directly by a DSN station over the full interplanetary range.
    Transfer,
    /// **Orbital**: a Mars orbiter (a MARCONI relay or a science orbiter) with a high-gain dish,
    /// either relaying to a DSN station or carrying the direct-to-Earth link.
    Orbital,
    /// **Lander**: a vehicle on descent or just landed, with a constrained medium-gain antenna,
    /// typically relaying through an orbiter (a short, high-elevation hop) rather than direct to
    /// Earth.
    Lander,
    /// **Surface**: a fixed surface user (a rover or static lander) with a small low-gain antenna,
    /// relaying through an overhead orbiter — the most power- and gain-constrained terminal.
    Surface,
}

/// The inputs to a one-way link budget: transmit EIRP, receive `G/T`, the geometry (range), the data
/// rate, and the lumped non-free-space loss. All decibel quantities are in their conventional units.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct LinkParams {
    /// The carrier band (sets the frequency the free-space loss is computed at, [`band_frequency_hz`]).
    pub band: Band,
    /// Transmit **effective isotropic radiated power** (dBW): transmit power plus transmit antenna
    /// gain minus transmit-side losses.
    pub eirp_dbw: f64,
    /// Receive **gain-to-noise-temperature ratio** `G/T` (dB/K): the receive antenna gain over the
    /// system noise temperature, the standard figure of merit of a receiving terminal.
    pub g_over_t_db: f64,
    /// One-way link range (metres) — the transmitter-to-receiver distance.
    pub range_m: f64,
    /// Information **bit rate** (bit/s) carried on the link.
    pub data_rate_bps: f64,
    /// Lumped **other losses** (dB ≥ 0): antenna pointing, polarisation mismatch, atmospheric /
    /// tropospheric attenuation on the ground segment, and modem implementation loss — every loss
    /// term that is not the free-space spreading loss.
    pub other_losses_db: f64,
}

/// The result of a link budget: the path loss, the two carrier figures, and the margin / closure
/// verdict over the required `Eb/N₀`.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct LinkResult {
    /// **Free-space path loss** (dB), [`free_space_loss_db`].
    pub fsl_db: f64,
    /// **Carrier-to-noise-density** `C/N₀` (dB-Hz).
    pub cn0_dbhz: f64,
    /// **Energy-per-bit to noise-density** `Eb/N₀` (dB).
    pub eb_n0_db: f64,
    /// **Link margin** (dB): `Eb/N₀ − (Eb/N₀)_required`.
    pub margin_db: f64,
    /// Whether the link closes, i.e. `margin_db ≥ 0`.
    pub closes: bool,
}

/// The **representative carrier frequency** (Hz) for a deep-space `band`, taken at the **downlink**
/// allocation — the leg that almost always limits a deep-space budget (the spacecraft's transmit
/// power is the scarce resource, and the highest data rate is on the downlink). These are the DSN
/// deep-space band centres (CCSDS 401 / DSN 810-005), the same downlink frequencies
/// [`Band::downlink_hz`] returns:
///
/// | band | downlink centre |
/// |------|-----------------|
/// | S    | ≈ 2.295 GHz     |
/// | X    | ≈ 8.420 GHz     |
/// | Ka   | ≈ 32.0 GHz      |
///
/// The DSN deep-space allocations are S ≈ 2.29–2.30 GHz, X ≈ 8.40–8.45 GHz, Ka ≈ 31.8–32.3 GHz on
/// the downlink (with the corresponding ≈ 2.11 / 7.15 / 34.4 GHz uplinks); the band-keyed budget here
/// uses the downlink centre. Delegates to [`Band::downlink_hz`] so there is a single source of truth
/// for the band frequencies across the navigation ([`crate::radiometric`]) and telecom modules.
pub fn band_frequency_hz(band: Band) -> f64 {
    band.downlink_hz()
}

/// **Free-space path loss** (dB) for a one-way link of range `range_m` (metres) at carrier frequency
/// `freq_hz` (Hz):
///
/// ```text
///   L_fs = 20·log10( 4π·R·f / c )       [dB],
/// ```
///
/// the Friis spreading loss written in range × frequency form (equivalently `20·log10(4πR/λ)` with
/// `λ = c/f`). It is the dominant term of any deep-space budget — at the Earth–Mars range it is
/// ≈ 270–290 dB — and grows by 6 dB per range doubling and 6 dB per frequency doubling (so Ka loses
/// ≈ 12 dB to X at the same range, recovered by Ka's far higher antenna gain). Uses the crate's
/// speed of light [`C_M_PER_S`] for consistency with the navigation kernel.
pub fn free_space_loss_db(range_m: f64, freq_hz: f64) -> f64 {
    20.0 * (4.0 * PI * range_m * freq_hz / C_M_PER_S).log10()
}

/// Compute the one-way **link budget** for `p` against a required `Eb/N₀` (`required_eb_n0_db`, dB).
///
/// Applies the deep-space link equation
///
/// ```text
///   C/N₀  = EIRP − L_fs − L_other + G/T − k       [dB-Hz]
///   Eb/N₀ = C/N₀ − 10·log10(R_b)                  [dB]
///   margin = Eb/N₀ − (Eb/N₀)_required             [dB]
/// ```
///
/// with `L_fs` from [`free_space_loss_db`] at the band frequency ([`band_frequency_hz`]),
/// `k = −228.6 dBW/K/Hz` ([`BOLTZMANN_DBW_PER_K_PER_HZ`]), and `R_b = p.data_rate_bps`. The link
/// **closes** when the margin is non-negative. (CCSDS 401 / DSN 810-005 telecom-design-control-table
/// form.)
pub fn link_budget(p: &LinkParams, required_eb_n0_db: f64) -> LinkResult {
    let freq_hz = band_frequency_hz(p.band);
    let fsl_db = free_space_loss_db(p.range_m, freq_hz);

    // C/N₀ = EIRP − FSL − other losses + G/T − k. Subtracting the (negative) Boltzmann term raises
    // C/N₀, i.e. −k = +228.6 dB.
    let cn0_dbhz =
        p.eirp_dbw - fsl_db - p.other_losses_db + p.g_over_t_db - BOLTZMANN_DBW_PER_K_PER_HZ;

    // Eb/N₀ = C/N₀ − 10·log10(data rate).
    let eb_n0_db = cn0_dbhz - 10.0 * p.data_rate_bps.log10();

    let margin_db = eb_n0_db - required_eb_n0_db;

    LinkResult {
        fsl_db,
        cn0_dbhz,
        eb_n0_db,
        margin_db,
        closes: margin_db >= 0.0,
    }
}

/// Representative [`LinkParams`] for a **MARCONI-class relay link** at the given `band` and mission
/// `profile`, parameterised by the link `range_m` and `data_rate_bps`.
///
/// The EIRP / `G/T` / loss figures are **engineering defaults**, cited to order of magnitude — *not*
/// the calibrated budget of any specific terminal. They are set so the relative regimes are sensible
/// (an orbiter's high-gain dish has more EIRP than a lander's medium-gain or a surface terminal's
/// low-gain antenna; the per-band antenna gain rises with frequency, partly recovering the higher
/// free-space loss) and the absolute numbers sit inside the published deep-space envelope:
///
/// * **EIRP** by profile is a typical deep-space spacecraft transmit EIRP (a few tens of dBW at a
///   few-metre high-gain dish, less for the constrained lander/surface antennas), plus a per-band
///   gain bump (≈ X +6 dB, Ka +14 dB over S, the `20·log10(f)` aperture-gain scaling for a fixed
///   dish size) — DSN 810-005 spacecraft-EIRP envelope.
/// * **G/T** is the receiving terminal figure of merit: for the orbiter/transfer direct-to-Earth
///   legs this is a DSN 34 m beam-waveguide station (`G/T` ≈ 53 dB/K at X-band, higher at Ka, lower
///   at S — DSN 810-005 module 101/104); for the lander/surface relay legs it is the lower `G/T` of
///   an overhead orbiter's relay receiver.
/// * **other_losses_db** is a lumped pointing + polarisation + atmosphere + implementation budget
///   (≈ 3–6 dB), larger for the constrained terminals.
///
/// These reproduce the right closure behaviour (an X-band orbiter link closes across the typical
/// Earth–Mars range and breaks near solar-conjunction maximum range) without claiming datasheet
/// fidelity.
pub fn default_params(
    band: Band,
    profile: Profile,
    range_m: f64,
    data_rate_bps: f64,
) -> LinkParams {
    // Per-band antenna-gain bump over S-band for a fixed dish: gain ∝ f², i.e. 20·log10(f/f_S) dB.
    // X ≈ +11 dB, Ka ≈ +23 dB over S in pure aperture terms; we use a damped, conservative version
    // (X +6, Ka +14) so the higher-band budgets stay representative rather than optimistic.
    let band_gain_db = match band {
        Band::S => 0.0,
        Band::X => 6.0,
        Band::Ka => 14.0,
    };

    // Base spacecraft transmit EIRP (S-band reference, dBW) and lumped loss by mission phase.
    let (eirp_base_dbw, other_losses_db) = match profile {
        // Cruise vehicle, deployed high-gain antenna, direct-to-Earth.
        Profile::Transfer => (55.0, 4.0),
        // Orbiter high-gain dish — the strongest terminal.
        Profile::Orbital => (60.0, 4.0),
        // Descent/landed medium-gain antenna, relaying through an orbiter.
        Profile::Lander => (42.0, 5.0),
        // Fixed surface low-gain antenna — the most constrained.
        Profile::Surface => (38.0, 6.0),
    };

    // Receive G/T (dB/K): the DSN-34 m direct-to-Earth legs see the big-station figure of merit;
    // the lander/surface relay legs are received by a lower-G/T overhead orbiter.
    let g_over_t_db = match profile {
        // DSN 34 m beam-waveguide station, X-band ≈ 53 dB/K; +Ka bump, −S deficit follow the band.
        Profile::Transfer | Profile::Orbital => 47.0 + band_gain_db,
        // Overhead-orbiter relay receiver — a far smaller aperture, lower G/T.
        Profile::Lander | Profile::Surface => 12.0 + band_gain_db,
    };

    LinkParams {
        band,
        eirp_dbw: eirp_base_dbw + band_gain_db,
        g_over_t_db,
        range_m,
        data_rate_bps,
        other_losses_db,
    }
}

fn lb_default_band() -> String {
    "x".to_string()
}
fn lb_default_eirp() -> f64 {
    55.0
}
fn lb_default_gt() -> f64 {
    53.0
}
fn lb_default_range_km() -> f64 {
    2000.0
}
fn lb_default_rate() -> f64 {
    1.0e6
}
fn lb_default_other() -> f64 {
    3.0
}
fn lb_default_req() -> f64 {
    4.5
}

/// The `link-budget` scenario: a one-way link budget (free-space loss, C/N₀,
/// Eb/N₀, margin and closure) over the CCSDS 401 / DSN 810-005 link equation, for a
/// transmit EIRP, receive G/T, range, data rate and band against a required Eb/N₀.
#[derive(serde::Deserialize)]
pub struct LinkBudgetScenario {
    /// Carrier band: `s`, `x` or `ka` (sets the free-space-loss frequency).
    #[serde(default = "lb_default_band")]
    pub band: String,
    /// Transmit EIRP (dBW).
    #[serde(default = "lb_default_eirp")]
    pub eirp_dbw: f64,
    /// Receive figure of merit G/T (dB/K).
    #[serde(default = "lb_default_gt")]
    pub g_over_t_db: f64,
    /// One-way link range (km).
    #[serde(default = "lb_default_range_km")]
    pub range_km: f64,
    /// Information bit rate (bit/s).
    #[serde(default = "lb_default_rate")]
    pub data_rate_bps: f64,
    /// Lumped non-free-space losses (dB ≥ 0).
    #[serde(default = "lb_default_other")]
    pub other_losses_db: f64,
    /// Required Eb/N₀ for closure (dB).
    #[serde(default = "lb_default_req")]
    pub required_eb_n0_db: f64,
}

impl LinkBudgetScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let band = match self.band.to_ascii_lowercase().as_str() {
            "s" => Band::S,
            "x" => Band::X,
            "ka" => Band::Ka,
            other => return Err(format!("unknown band '{other}' (expected s|x|ka)")),
        };
        if !self.range_km.is_finite() || self.range_km <= 0.0 {
            return Err("range_km must be finite and positive".to_string());
        }
        if !self.data_rate_bps.is_finite() || self.data_rate_bps <= 0.0 {
            return Err("data_rate_bps must be finite and positive".to_string());
        }
        if !self.other_losses_db.is_finite() || self.other_losses_db < 0.0 {
            return Err("other_losses_db must be finite and >= 0".to_string());
        }
        let p = LinkParams {
            band,
            eirp_dbw: self.eirp_dbw,
            g_over_t_db: self.g_over_t_db,
            range_m: self.range_km * 1000.0,
            data_rate_bps: self.data_rate_bps,
            other_losses_db: self.other_losses_db,
        };
        let r = link_budget(&p, self.required_eb_n0_db);
        let json = serde_json::json!({
            "kind": "link-budget",
            "label": "One-way link budget over the CCSDS 401 / DSN 810-005 link \
                      equation (EIRP − FSPL − L_other + G/T − k); a deterministic \
                      engineering calculation from the supplied inputs, NOT a \
                      calibrated terminal datasheet",
            "band": self.band.to_ascii_lowercase(),
            "range_km": self.range_km,
            "data_rate_bps": self.data_rate_bps,
            "free_space_loss_db": r.fsl_db,
            "cn0_dbhz": r.cn0_dbhz,
            "eb_n0_db": r.eb_n0_db,
            "required_eb_n0_db": self.required_eb_n0_db,
            "margin_db": r.margin_db,
            "closes": r.closes,
        });
        let summary = format!(
            "link-budget: {}-band, {:.0} km, {:.0} bit/s -> FSPL {:.1} dB, Eb/N0 {:.1} dB, \
             margin {:.1} dB ({})",
            self.band.to_ascii_lowercase(),
            self.range_km,
            self.data_rate_bps,
            r.fsl_db,
            r.eb_n0_db,
            r.margin_db,
            if r.closes { "closes" } else { "does NOT close" }
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// 1 AU in metres (IAU 2012), for expressing Earth–Mars ranges.
    const AU_M: f64 = 1.495_978_707e11;

    /// The free-space loss matches the `20·log10(4π·R·f/c)` hand value, computed independently in the
    /// test, to better than 1e-6 dB. The reference point: R = 1.0e8 m, f = 8.42e9 Hz (X-band
    /// downlink). The hand value is formed from the raw constants, not from `free_space_loss_db`.
    #[test]
    fn free_space_loss_matches_hand_value() {
        let range_m = 1.0e8;
        let freq_hz = 8.42e9;

        // Hand value: 4π·R·f / c, then 20·log10.
        let c = 299_792_458.0_f64;
        let arg = 4.0 * std::f64::consts::PI * range_m * freq_hz / c;
        let hand_db = 20.0 * arg.log10();

        // Sanity: the literal magnitude is ≈ 211.0 dB at this geometry (a cross-check on the hand
        // value itself, independent of the implementation).
        assert!(
            (hand_db - 210.96).abs() < 0.05,
            "hand FSL {hand_db} dB not ≈ 211.0 dB at R=1e8 m, f=8.42 GHz"
        );

        let got = free_space_loss_db(range_m, freq_hz);
        assert!(
            (got - hand_db).abs() < 1e-6,
            "free_space_loss_db {got} dB vs hand {hand_db} dB (Δ = {} dB)",
            (got - hand_db).abs()
        );
    }

    /// External-oracle cross-check against a **published deep-space telemetry
    /// design-control table**: J. H. Yuen (ed.), *Deep Space Telecommunications
    /// Systems Engineering* (DESCANSO / JPL Publication 82-76), Table 1-1 — the
    /// Galileo X-band (8420.43 MHz) downlink at 6.37 AU (R = 9.529×10⁸ km). The
    /// CCSDS-401 / DSN-810-005 link equation reproduces the table's published
    /// free-space loss (−290.54 dB) and received carrier-to-noise density
    /// (Pr/N₀ = 54.6 dB-Hz). The DCT component values are converted to the
    /// EIRP / (G/T) / lumped-loss inputs the link equation takes; the link-budget
    /// assembly (C/N₀ = EIRP − FSL − L + G/T − k) is what is under test.
    #[test]
    fn link_equation_reproduces_descanso_galileo_dct() {
        let range_m = 9.529e11; // 9.529e8 km = 6.37 AU
        let freq_hz = 8.42043e9; // X-band downlink channel in the table

        // (a) Free-space loss: the table prints −290.54 dB.
        let fsl = free_space_loss_db(range_m, freq_hz);
        assert!(
            (fsl - 290.54).abs() < 0.05,
            "FSPL {fsl} dB vs published 290.54 dB"
        );

        // (b) Full carrier-to-noise-density chain. Table 1-1 components:
        //   EIRP = Pt(10.5 dBW) − circuit loss(0.2) + Gt(50.0)   = 60.3 dBW
        //   G/T  = Gr(71.7 dBi) − 10·log10(Tsys = 26.30 K)       = 57.50 dB/K
        //   other losses = Tx pointing(1.2) + polarisation(0.04) = 1.24 dB
        // The table prints received Pr/N₀ = 54.6 dB-Hz.
        let g_over_t = 71.7 - 10.0 * 26.30_f64.log10();
        let p = LinkParams {
            band: Band::X, // band centre 8.420 GHz ≈ the table's 8420.43 MHz channel
            eirp_dbw: 60.3,
            g_over_t_db: g_over_t,
            range_m,
            data_rate_bps: 134_400.0, // table line 19; affects Eb/N₀, not C/N₀
            other_losses_db: 1.24,
        };
        let r = link_budget(&p, 2.31); // required Eb/N₀, table line 25
        assert!(
            (r.cn0_dbhz - 54.6).abs() < 0.2,
            "C/N0 {} dB-Hz vs published 54.6 dB-Hz",
            r.cn0_dbhz
        );

        // The band frequencies sit inside the DSN/CCSDS-401 deep-space downlink
        // allocations (DSN 810-005 Module 201, Table 2): S 2290–2300, X 8400–8450,
        // Ka 31800–32300 MHz.
        assert!((2.290e9..=2.300e9).contains(&band_frequency_hz(Band::S)));
        assert!((8.400e9..=8.450e9).contains(&band_frequency_hz(Band::X)));
        assert!((31.800e9..=32.300e9).contains(&band_frequency_hz(Band::Ka)));
    }

    /// The band carrier frequencies are in the right DSN GHz bands: S ≈ 2.3 GHz, X ≈ 8.4 GHz,
    /// Ka ≈ 32 GHz (downlink centres), and strictly ordered S < X < Ka.
    #[test]
    fn band_frequencies_are_dsn() {
        let fs = band_frequency_hz(Band::S);
        let fx = band_frequency_hz(Band::X);
        let fka = band_frequency_hz(Band::Ka);

        assert!(
            (2.2e9..=2.4e9).contains(&fs),
            "S-band {fs} Hz not in the ~2.3 GHz DSN band"
        );
        assert!(
            (8.3e9..=8.5e9).contains(&fx),
            "X-band {fx} Hz not in the ~8.4 GHz DSN band"
        );
        assert!(
            (31.0e9..=33.0e9).contains(&fka),
            "Ka-band {fka} Hz not in the ~32 GHz DSN band"
        );
        assert!(
            fs < fx && fx < fka,
            "band frequencies must increase S < X < Ka"
        );
    }

    /// A nominal X-band orbital MARCONI link closes at a realistic Earth–Mars range, and goes
    /// negative beyond a documented long range (the link breaks near solar-conjunction maximum
    /// range). Both directions are asserted.
    ///
    /// Geometry: R = 1.67 AU ≈ 2.5e11 m (a mid-range Earth–Mars distance) vs R = 2.7 AU ≈ 4.0e11 m
    /// (near solar-conjunction maximum Earth–Mars range), at **1 Mbit/s** with a required
    /// Eb/N₀ = 2.0 dB (a strongly-coded turbo/LDPC threshold). The high-gain orbital default has
    /// comfortable margin at low rates, so the range-dependent break is exercised at the demanding
    /// 1 Mbit/s downlink: at the near range the link closes (margin ≈ +2.7 dB, Eb/N₀ ≈ 4.7 dB), and
    /// the ≈ +4.2 dB of extra free-space loss out at conjunction maximum drives the margin negative
    /// (margin ≈ −1.5 dB, Eb/N₀ ≈ 0.5 dB) — the link breaks. The exact figures are computed by the
    /// link equation; the test asserts the sign of the margin (close / break) in both regimes.
    #[test]
    fn x_band_orbital_link_closes() {
        let data_rate = 1.0e6; // 1 Mbit/s — a demanding deep-space downlink rate
        let required = 2.0; // dB, coded threshold

        // Mid-range Earth–Mars: closes.
        let near = 1.67 * AU_M; // ≈ 2.50e11 m
        let p_near = default_params(Band::X, Profile::Orbital, near, data_rate);
        let r_near = link_budget(&p_near, required);
        assert!(
            r_near.closes && r_near.margin_db > 0.0,
            "X-band orbital link must close at {near:.3e} m: margin {} dB, Eb/N0 {} dB, FSL {} dB",
            r_near.margin_db,
            r_near.eb_n0_db,
            r_near.fsl_db
        );

        // Near solar-conjunction maximum range: breaks.
        let far = 2.7 * AU_M; // ≈ 4.04e11 m
        let p_far = default_params(Band::X, Profile::Orbital, far, data_rate);
        let r_far = link_budget(&p_far, required);
        assert!(
            !r_far.closes && r_far.margin_db < 0.0,
            "X-band orbital link must break at {far:.3e} m: margin {} dB, Eb/N0 {} dB, FSL {} dB",
            r_far.margin_db,
            r_far.eb_n0_db,
            r_far.fsl_db
        );

        // The break is driven by the extra free-space loss of the longer range (≈ 6 dB per range
        // doubling): the far FSL exceeds the near FSL.
        assert!(
            r_far.fsl_db > r_near.fsl_db,
            "longer range must have larger FSL: far {} dB vs near {} dB",
            r_far.fsl_db,
            r_near.fsl_db
        );
    }

    /// At the same range Ka-band free-space loss exceeds X-band (higher frequency → more path loss):
    /// `L_fs ∝ 20·log10(f)`, so the ≈ 3.8× frequency ratio is ≈ 11.6 dB of extra loss. Ka recovers
    /// this (and more) through far higher antenna gain, but here we assert only the FSL ordering.
    #[test]
    fn ka_higher_loss_than_x_same_range() {
        let range_m = 2.0e11;
        let fsl_x = free_space_loss_db(range_m, band_frequency_hz(Band::X));
        let fsl_ka = free_space_loss_db(range_m, band_frequency_hz(Band::Ka));
        assert!(
            fsl_ka > fsl_x,
            "Ka FSL {fsl_ka} dB must exceed X FSL {fsl_x} dB at the same range"
        );

        // The gap is the 20·log10(f_Ka / f_X) dispersion difference, ≈ 11.6 dB.
        let expected_gap =
            20.0 * (band_frequency_hz(Band::Ka) / band_frequency_hz(Band::X)).log10();
        assert!(
            (fsl_ka - fsl_x - expected_gap).abs() < 1e-6,
            "FSL gap {} dB must equal 20·log10(f_Ka/f_X) = {} dB",
            fsl_ka - fsl_x,
            expected_gap
        );
    }

    /// Profile sanity: at the same band/range/rate, the orbiter (high-gain dish, big-station receive
    /// G/T) carries more EIRP and a stronger margin than the transfer cruise vehicle, which in turn
    /// beats the lander, which beats the surface terminal. The EIRP and margin orderings both hold,
    /// reflecting the constrained-antenna mission phases.
    #[test]
    fn profile_relative_eirp_and_margin() {
        let band = Band::X;
        let range_m = 1.5 * AU_M;
        let data_rate = 1.0e4; // 10 kbit/s, so the constrained terminals are still meaningful
        let required = 2.0;

        let mk = |prof| {
            let p = default_params(band, prof, range_m, data_rate);
            (p.eirp_dbw, link_budget(&p, required))
        };
        let (eirp_orb, r_orb) = mk(Profile::Orbital);
        let (eirp_xfer, r_xfer) = mk(Profile::Transfer);
        let (eirp_land, r_land) = mk(Profile::Lander);
        let (eirp_surf, r_surf) = mk(Profile::Surface);

        // EIRP ordering: orbiter ≥ transfer > lander > surface.
        assert!(
            eirp_orb >= eirp_xfer && eirp_xfer > eirp_land && eirp_land > eirp_surf,
            "EIRP must order orbital≥transfer>lander>surface: {eirp_orb}, {eirp_xfer}, {eirp_land}, {eirp_surf}"
        );

        // Margin ordering: the orbiter has the strongest link, the surface terminal the weakest.
        assert!(
            r_orb.margin_db >= r_xfer.margin_db
                && r_xfer.margin_db > r_land.margin_db
                && r_land.margin_db > r_surf.margin_db,
            "margin must order orbital≥transfer>lander>surface: {} {} {} {}",
            r_orb.margin_db,
            r_xfer.margin_db,
            r_land.margin_db,
            r_surf.margin_db
        );

        // The strong orbiter link closes; the most-constrained surface link is weaker by a wide
        // margin (the low-gain antenna + low relay-receiver G/T cost tens of dB).
        assert!(
            r_orb.closes,
            "orbital link should close at 1.5 AU / 10 kbit/s"
        );
        assert!(
            r_orb.margin_db - r_surf.margin_db > 20.0,
            "orbiter should beat surface by >20 dB: Δ = {} dB",
            r_orb.margin_db - r_surf.margin_db
        );
    }

    /// The carrier figures compose consistently: Eb/N₀ = C/N₀ − 10·log10(R_b), and the closure flag
    /// agrees with the sign of the margin. A direct check of the link equation wiring.
    #[test]
    fn carrier_figures_compose() {
        let p = LinkParams {
            band: Band::X,
            eirp_dbw: 60.0,
            g_over_t_db: 53.0,
            range_m: 2.0e11,
            data_rate_bps: 1.0e5,
            other_losses_db: 4.0,
        };
        let required = 2.0;
        let r = link_budget(&p, required);

        // Eb/N₀ = C/N₀ − 10·log10(data rate).
        let eb_hand = r.cn0_dbhz - 10.0 * p.data_rate_bps.log10();
        assert!(
            (r.eb_n0_db - eb_hand).abs() < 1e-9,
            "Eb/N0 {} dB vs C/N0 − 10log10(Rb) {} dB",
            r.eb_n0_db,
            eb_hand
        );

        // margin = Eb/N₀ − required, and closes ⇔ margin ≥ 0.
        assert!((r.margin_db - (r.eb_n0_db - required)).abs() < 1e-9);
        assert_eq!(r.closes, r.margin_db >= 0.0);

        // C/N₀ = EIRP − FSL − other + G/T − k, hand-recomposed.
        let cn0_hand =
            p.eirp_dbw - r.fsl_db - p.other_losses_db + p.g_over_t_db - BOLTZMANN_DBW_PER_K_PER_HZ;
        assert!(
            (r.cn0_dbhz - cn0_hand).abs() < 1e-9,
            "C/N0 {} dB vs hand {} dB",
            r.cn0_dbhz,
            cn0_hand
        );
    }
}
