// SPDX-License-Identifier: AGPL-3.0-only
//! **Joint availability / precision / integrity figure of merit** for a heterogeneous
//! optical + RF PNT service (P5), plus the `hybrid-optical-rf` scenario that drives it
//! end-to-end.
//!
//! [`crate::hybrid`]`::pnt_availability` already fuses *availability × precision*
//! epoch-by-epoch. This module adds the third P5 factor — **integrity-assured** — and
//! composes all three into `P(available ∧ precision-grade ∧ integrity-assured)`, with an
//! explicit correlation term, exposed as a single scored FoM ([`joint_fom`]).
//!
//! The `hybrid-optical-rf` scenario wires the Phase-7 pieces into one analysis:
//!
//! * **L26 optical link budget** ([`crate::optical_linkbudget`]) → the tight optical ranging
//!   / timing precision from the detected-photon count (two-way, photon-limited CRLB).
//! * **L24 optical availability** ([`crate::optical_availability`]) → the weather-limited
//!   `N`-station network availability `A` (the binding constraint on the high-grade service).
//! * **L22 cross-modality RAIM** ([`crate::cross_raim`]) → the position and timing protection
//!   levels from fusing the loose RF and tight optical solutions, and whether they sit inside
//!   the alert limits (integrity-assured).
//! * **L23 optical↔RF handoff** ([`crate::handoff`]) → the no-jump (mean-continuity) +
//!   NEES-in-gate consistency check across a modality switch.
//! * **L25 joint FoM** (this module) → the composed availability/precision/integrity score.
//!
//! ## What the integrity monitor can detect (G15)
//!
//! A monitor that only ever reports a fault-free statistic has demonstrated nothing about
//! its detection power. This module therefore also injects **bias** faults, per axis, into
//! the cross-modality monitor and reports what it can catch:
//!
//! * the **minimum detectable bias** per axis at the scenario's stated `P_fa` / `P_md`,
//!   obtained by inverting the non-central χ² tail on the non-centrality
//!   ([`crate::raim::pbias`]) against the threshold the monitor itself applied, then
//!   de-normalising by the axis separation σ — closed-form, reproducible bit-for-bit;
//! * the **detection-power curve** `P_d(λ) = 1 − F_{χ'²}(T; dof, λ)` either side of it,
//!   whose zero-fault end is `P_fa` and whose MDB end is `1 − P_md`;
//! * the statistic the **real monitor** returns when a bias of a given size is actually
//!   written into the RF estimate and [`crate::cross_raim::run_cross_raim`] is re-run.
//!
//! A **ramp** fault is reported only as far as the structure honestly allows: the monitor
//! is a single-epoch snapshot test and this scenario carries no epoch grid for it, so the
//! reported time-to-detect is a rate conversion `MDB/rate`, labelled as such on the report,
//! and no cumulative multi-epoch detection probability is claimed.
//!
//! ## How long a handover buys you (G17)
//!
//! After a modality handover the delivered state is continuous but the covariance is
//! inflated and then re-grows under process noise with no measurement to check it. The
//! report propagates the post-handover covariance forward as a per-axis random walk —
//! `P_ii(t) = P_ii(0) + q_i·t`, the only process-noise model the existing 4-state
//! position+clock diagonal filter can express — and states how long the coverage-scaled
//! solution stays inside each alert limit, which limit binds first, and the variance
//! doubling time constant. The PSDs, the coverage factor and the alert limits are all
//! inputs with documented defaults.
//!
//! ## Validated vs Modelled
//!
//! - **Validated (closed form).** The photon-energy / diffraction-footprint / photon-limited
//!   ranging CRLB (L26), the χ² cross-modality protection-level quantile (L22), the
//!   independent-union availability combinatorics (L24), the handoff mean-continuity
//!   invariant and NEES χ² gate bounds (L23), the joint-FoM independent product (L25), the
//!   non-central χ² minimum-detectable-bias inversion and detection-power curve (G15), and
//!   the random-walk variance-crossing solution (G17) are exact analytic identities,
//!   checked to machine precision against hand values.
//! - **Modelled.** The optical link loss allocations, the RF/optical 1σ magnitudes, the
//!   cloud-climatology inputs and spatial correlation, the FoM correlation, the
//!   integrity-risk budget `P_HMI`, the fault ramp rates (G15) and the process-noise PSDs
//!   (G17) are representative inputs — they set the numbers, not the formulas. Not a
//!   certified availability/integrity product.

use crate::cross_raim::{run_cross_raim, AxisRole, CrossAxis, CrossRaimResult};
use crate::handoff::{optical_rf_handoff, rf_optical_handoff, HandoffOutcome, HandoffState};
use crate::jamming::{
    lock_status, LockStatus, CA_CHIP_RATE_HZ, DEFAULT_DEGRADED_MARGIN_DB,
    DEFAULT_TRACKING_THRESHOLD_DBHZ,
};
use crate::linkbudget::{band_frequency_hz, link_budget, LinkParams};
use crate::navsignal::dll_code_jitter_chips;
use crate::optical_availability::{
    default_network, run_optical_availability, OpticalAvailabilityResult,
};
use crate::optical_linkbudget::{
    detected_photons, optical_link_budget, photon_limited_range_crlb_m, photon_limited_toa_crlb_s,
    OpticalLinkParams, OpticalLinkResult,
};
use crate::radiometric::Band;
use crate::raim::{chi2_cdf, noncentral_chi2_cdf, normal_quantile, pbias};
use crate::timegeo::C_M_PER_S;
use serde::{Deserialize, Serialize};

/// The honesty label carried on the result document.
const LABEL: &str = "Heterogeneous optical + RF PNT joint availability / precision / \
integrity figure of merit (P5). VALIDATED closed form: the photon-limited ranging CRLB \
(σ_τ/√N) and diffraction footprint (λ/D·range), the χ² cross-modality protection-level \
quantile, the N-station independent-union availability (1 − Π(1−a_i)), the optical↔RF \
handoff mean-continuity (bit-for-bit no-jump) invariant and NEES χ² gate, and the joint-FoM \
independent product. MODELLED: the optical loss allocations, the RF/optical 1σ magnitudes, \
the cloud-climatology inputs and spatial correlation, the FoM correlation, and the \
integrity-risk budget P_HMI are representative inputs. Not a certified availability/integrity \
product.";

/// How the G15 fault-injection figures were obtained, stated on the report itself.
const FAULT_METHOD: &str = "Analytic, not sampled. The monitor is a chi-square separation \
test, so a bias b on one axis makes the statistic non-central chi-square with \
lambda = b^2/(sigma_rf^2 + sigma_opt^2). The minimum detectable bias inverts the non-central \
chi-square tail on lambda by bisection (raim::pbias) at the stated P_md against the \
threshold the monitor itself applied, then de-normalises by the axis separation sigma. The \
detection-power curve is 1 - F_noncentral_chi2(T; dof, lambda) on that same closed form \
(raim::noncentral_chi2_cdf). No Monte-Carlo sampling enters the report, so every figure here \
is reproducible bit-for-bit. The `injected` entries are NOT analytic: a bias of that size is \
written into the RF estimate of the axis and the real monitor is re-run, so the realised \
statistic is the one the monitor computed.";

/// What the ramp figure is, and what this scenario cannot support.
const FAULT_RAMP_NOTE: &str = "The cross-modality monitor is a single-epoch snapshot test. \
This scenario carries no epoch time series for the monitor and none is invented here, so \
`ramp_time_to_detect_s` is a rate conversion of the minimum detectable bias, MDB/rate: the \
time at which a continuously re-evaluated snapshot monitor first attains 1 - P_md power \
against a bias growing at the stated rate. It is NOT a time-series simulation. A cumulative \
multi-epoch detection probability is deliberately NOT reported: that needs a monitor cadence \
and an inter-epoch measurement-noise correlation model, and this engine has neither.";

/// The post-handover process-noise model, stated in full on the report.
const COAST_MODEL: &str = "Per-axis random walk on the existing 4-state (east, north, up, \
clock) diagonal handoff filter: P_ii(t) = P_ii(0) + q_i*t, starting from the covariance \
immediately after the modality handover (mean carried bit-for-bit, covariance inflated) and \
coasting with no measurement from either modality. Horizontal variance is the sum of two \
independent axes, so it grows at 2*q_pos. The random walk is the only process-noise model \
this state vector can express: the filter carries no velocity state, so a white-noise- \
acceleration model (position variance growing as t^3) would need extra states and would \
change the NEES degrees of freedom the handoff gate is stated at.";

/// What the coast bound does and does not claim.
const COAST_CAVEAT: &str = "A covariance-growth bound, not a protection level. During a \
single-modality coast the cross-modality monitor has nothing to compare against, so no \
solution-separation protection level exists; the coast bound k*sigma(t) is compared against \
the same alert limits the cross-modality block uses. The process-noise PSDs are MODELLED \
representative inputs and the crossing times scale directly with them - halving q_pos \
doubles the horizontal coast time - so quote the PSD alongside any coast time.";

/// The RF-availability composition rule, stated in full on the report (G16).
const RF_AVAILABILITY_RULE: &str = "A_rf = I_closure * I_track, a product of two \
deterministic indicators read off engine quantities, NOT a probability. I_closure is 1 \
when the one-way CCSDS-401 / DSN-810-005 link budget closes at the scenario's own range - \
linkbudget::link_budget(...).closes, i.e. Eb/N0 margin >= 0 - and 0 otherwise. I_track is 1 \
when the same budget's C/N0 is at or above the tracking threshold - \
jamming::lock_status(C/N0, tracking_threshold_dbhz, degraded_margin_db) is LOCKED or \
DEGRADED rather than LOST - and 0 otherwise. Both indicators come from the SAME link \
budget, so the two can never be stated at different operating points. The continuous \
figures beside them are the closed-form range inversions of the same budget: the only \
range-dependent term is the free-space loss 20*log10(R), so the range at which each margin \
reaches zero is range_km * 10^(margin_db/20), and max_range_km is the smaller of the two.";

/// What the RF availability figure is, what it is not, and how it differs from the
/// optical one — stated on the report so the two can never be read as the same kind of
/// number just because both are called an availability (G16).
const RF_VS_OPTICAL_AVAILABILITY: &str = "OPTICAL availability \
(optical_availability.correlated_union) and RF availability (rf_availability.availability) \
are NOT the same kind of quantity and must never be quoted as a pair of comparable \
percentages. The optical figure is WEATHER/CLIMATOLOGY-LIMITED: a probability in [0,1] \
built from published per-site clear-night fractions (Cavazzani et al. 2011, GOES12) times a \
modelled pointing/acquisition factor, combined over an N-site network by the union \
combinatorics, so it takes values strictly between 0 and 1 and moves when the site list or \
the spatial correlation moves. The RF figure is MARGIN/GEOMETRY-LIMITED and DETERMINISTIC: \
it is the product of two 0/1 indicators evaluated once, at one range, on one link budget, \
so it can only ever be 0 or 1 and it moves only when the link configuration crosses a \
threshold. It carries no distribution, no ensemble and no time base. To make the RF figure \
a probability comparable with the optical one this engine would need an input it does not \
have and does not invent: an RF link-outage distribution at this band and geometry - a rain \
/ scintillation fade climatology, or an epoch grid of the RF geometry - named in \
rf_availability.factors_not_included.";

/// How the like-for-like ranging comparison is set up, and why the released two-way
/// optical figure is not its numerator (G16).
const RANGING_COMPARISON_METHOD: &str = "A ratio of two ranging sigmas measured at \
different operating points is not a comparison. Both legs here are therefore evaluated at \
ONE common configuration, emitted beside the ratio: the same one-way path at the same \
range_km, and the same accumulation time integration_s. The optical leg is the engine's \
photon-limited two-way-capable ToA CRLB (optical_linkbudget::photon_limited_range_crlb_m) \
evaluated ONE-WAY, i.e. on the one-way photon count photon_rate_hz * integration_s. The RF \
leg is the engine's DLL early-late thermal code-tracking jitter \
(navsignal::dll_code_jitter_chips, Kaplan & Hegarty eq. 8.90) at the C/N0 the engine's own \
link budget returns for the same one-way range, converted to metres through the chip rate. \
The loop noise bandwidth is NOT a free knob here: a single-sided loop noise bandwidth B_L \
averages over 1/(2*B_L) seconds, so B_L defaults to 1/(2*integration_s), which puts the RF \
leg at exactly the optical leg's accumulation time. If a caller overrides \
rf_dll_bandwidth_hz so the two averaging times no longer agree, the ratio is REFUSED \
(null, with the reason stated) rather than quoted at mismatched operating points. What the \
two legs do NOT share is the estimator family - photon counting against a correlator - \
because that difference IS the comparison; both are thermal/shot-noise bounds and both \
exclude media delay, clock error, ambiguity and every other systematic, so the exclusion is \
the same on each side. The scenario's two_way flag is deliberately not applied here: the \
optical two-way path charges the beam-spreading capture loss a second time and no RF return \
path is modelled, so honouring the flag on one leg only would be exactly the operating-point \
mismatch this object exists to prevent. released_two_way_optical_sigma_m and \
two_way_penalty_factor carry the exact bridge back to the released headline.";

/// Why no ratio is formed against the scenario's chosen RF 1σ input (G16).
const RF_SIGMA_RATIO_REFUSAL: &str = "No ratio is formed against \
optical_link.rf_position_sigma_m. That field is a CHOSEN parametric 1 sigma - a \
representative Paper-5 Table-1 magnitude the scenario takes as an input - and it carries no \
configuration at all: no band, no EIRP, no figure of merit, no range and no integration \
time. Dividing a computed optical CRLB at a stated operating point by a number that has no \
operating point would produce a figure that looks like a measurement and is not one. The \
comparison therefore uses the forward-modelled RF leg above, and this ratio is refused.";

/// Convert a boolean condition to a 0/1 probability weight.
fn indicator(b: bool) -> f64 {
    if b {
        1.0
    } else {
        0.0
    }
}

/// The composed joint availability / precision / integrity figure of merit.
#[derive(Clone, Debug, Serialize)]
pub struct JointPntFoM {
    /// Availability factor `A` (weather-limited high-grade service uptime).
    pub availability: f64,
    /// Precision-grade factor `P` (probability the delivered precision meets grade).
    pub precision_grade: f64,
    /// Integrity-assured factor `I` (protected within the alert limit, to the risk budget).
    pub integrity_assured: f64,
    /// Naive independent product `A·P·I`.
    pub joint_independent: f64,
    /// Correlation-adjusted joint `A·P·I + ρ·(min(A,P,I) − A·P·I)`.
    pub joint_correlated: f64,
    /// The correlation `ρ ∈ [0, 1]` used for the correlated joint.
    pub correlation: f64,
    /// The headline score (the correlated joint).
    pub score: f64,
}

/// Compose the three P5 factors into the joint PNT figure of merit.
///
/// The naive product `A·P·I` assumes the three conditions are independent. Real conditions
/// are **positively correlated** (optical uptime drives both availability and precision), so
/// the correlated joint interpolates toward the co-occurrence upper bound `min(A,P,I)`:
///
/// ```text
///   joint_corr = A·P·I + ρ·( min(A,P,I) − A·P·I ),   ρ ∈ [0, 1].
/// ```
///
/// At `ρ = 0` this is exactly the independent product; at `ρ = 1` it is `min(A,P,I)` (the
/// three conditions co-occur perfectly, so the joint is the weakest factor). The score is the
/// correlated joint.
pub fn joint_fom(
    availability: f64,
    precision: f64,
    integrity: f64,
    correlation: f64,
) -> JointPntFoM {
    let a = availability.clamp(0.0, 1.0);
    let p = precision.clamp(0.0, 1.0);
    let i = integrity.clamp(0.0, 1.0);
    let rho = correlation.clamp(0.0, 1.0);
    let independent = a * p * i;
    let min_factor = a.min(p).min(i);
    let correlated = independent + rho * (min_factor - independent);
    JointPntFoM {
        availability: a,
        precision_grade: p,
        integrity_assured: i,
        joint_independent: independent,
        joint_correlated: correlated,
        correlation: rho,
        score: correlated,
    }
}

/// Detection power of the cross-modality χ² monitor against a fault that shifts the
/// separation statistic's non-centrality to `lambda`:
///
/// ```text
///   P_d(λ) = 1 − F_{χ'²}(T; dof, λ),
/// ```
///
/// with `T` the monitor's own detection threshold (`χ²_{1−P_fa}(dof)`). At `λ = 0` this
/// collapses to `1 − F_{χ²}(T; dof)`, i.e. **exactly the false-alarm probability** — the
/// zero-fault end of a detection-power curve is `P_fa`, not zero. Uses the engine's
/// existing [`crate::raim::noncentral_chi2_cdf`] / [`crate::raim::chi2_cdf`].
pub fn chi2_detection_power(threshold: f64, dof: f64, lambda: f64) -> f64 {
    if !threshold.is_finite() || !dof.is_finite() || dof <= 0.0 {
        return f64::NAN;
    }
    let cdf = if lambda.is_finite() && lambda > 0.0 {
        noncentral_chi2_cdf(threshold, dof, lambda)
    } else {
        chi2_cdf(threshold, dof)
    };
    (1.0 - cdf).clamp(0.0, 1.0)
}

/// The non-centrality a **bias fault** of size `bias` on one monitored axis injects into
/// the cross-modality separation statistic: `λ = bias² / (σ_rf² + σ_opt²)`.
///
/// This is exact, not an approximation: the axis term of the statistic is
/// `Δ²/(σ_rf² + σ_opt²)` and a bias shifts the mean of `Δ` by exactly `bias`, so the
/// noise-free statistic *is* `λ` and the noisy statistic is χ'²(dof, λ).
pub fn bias_noncentrality(bias: f64, sigma_separation: f64) -> f64 {
    let s = sigma_separation.abs().max(f64::MIN_POSITIVE);
    let n = bias / s;
    n * n
}

/// The **minimum detectable bias** on one monitored axis: the bias whose non-centrality
/// makes the monitor's missed-detection probability exactly `p_md` at threshold
/// `threshold` with `dof` degrees of freedom.
///
/// Found by inverting the non-central χ² tail on the non-centrality parameter — the
/// engine's existing [`crate::raim::pbias`] bisection, which returns `√λ*`. The bias then
/// follows by de-normalising with the axis separation σ: `MDB = √λ* · √(σ_rf² + σ_opt²)`.
/// Closed-form and reproducible bit-for-bit; no sampling is involved.
pub fn minimum_detectable_bias(sigma_separation: f64, threshold: f64, dof: f64, p_md: f64) -> f64 {
    pbias(threshold, dof, p_md) * sigma_separation.abs()
}

/// The time at which a random-walk-propagated variance `P(t) = p0 + q·t` first drives the
/// coverage bound `k·√P(t)` past `limit`.
///
/// * `Some(0.0)` — the bound is already outside the limit at `t = 0`.
/// * `Some(t)`   — the crossing time.
/// * `None`      — the bound never reaches the limit (`q ≤ 0`), or an input is not finite.
///   `None` means *no crossing*, which is **not** the same as a crossing at zero.
pub fn random_walk_time_to_limit(p0: f64, q: f64, k: f64, limit: f64) -> Option<f64> {
    if !(p0.is_finite() && q.is_finite() && k.is_finite() && limit.is_finite()) {
        return None;
    }
    if k <= 0.0 || limit <= 0.0 {
        return Some(0.0);
    }
    let p_limit = (limit / k).powi(2);
    if p0 >= p_limit {
        return Some(0.0);
    }
    if q <= 0.0 {
        return None;
    }
    Some((p_limit - p0) / q)
}

// =====================================================================================
// G16 — the RF leg: link availability, and the like-for-like ranging comparison.
// =====================================================================================

/// The resolved RF link leg — every value an INPUT after defaults, echoed so a paper can
/// state the RF configuration it ran at instead of reading a default out of the source.
/// The optical counterpart is the `link_configuration` block.
#[derive(Clone, Debug, Serialize)]
pub struct RfLinkConfiguration {
    /// Carrier band label (`s` / `x` / `ka`).
    pub band: &'static str,
    /// The band's downlink centre frequency (Hz), the frequency the free-space loss used.
    pub carrier_hz: f64,
    /// Transmit effective isotropic radiated power (dBW).
    pub eirp_dbw: f64,
    /// Receive figure of merit `G/T` (dB/K).
    pub g_over_t_db: f64,
    /// Lumped non-free-space loss (dB).
    pub other_losses_db: f64,
    /// Information bit rate the `Eb/N0` is formed at (bit/s).
    pub data_rate_bps: f64,
    /// Required `Eb/N0` (dB) the margin is taken over.
    pub required_eb_n0_db: f64,
    /// The one-way range the RF budget was evaluated at (km) — the scenario's own
    /// `range_km`, so the RF leg cannot sit at a different range from the optical one.
    pub range_km: f64,
    /// Spreading-code chip rate (chip/s).
    pub chip_rate_hz: f64,
    /// Early-late correlator spacing (chip).
    pub correlator_spacing_chips: f64,
    /// DLL single-sided loop noise bandwidth (Hz).
    pub dll_bandwidth_hz: f64,
    /// Where the loop bandwidth came from.
    pub dll_bandwidth_source: &'static str,
    /// Coherent predetection integration time (s) — the scenario's `integration_s`.
    pub predetection_integration_s: f64,
    /// Tracking-loop loss-of-lock threshold (dB-Hz).
    pub tracking_threshold_dbhz: f64,
    /// Extra margin (dB) above the threshold below which the link is `DEGRADED`.
    pub degraded_margin_db: f64,
}

/// One factor of the RF-availability product, carrying the provenance of its own input.
#[derive(Clone, Debug, Serialize)]
pub struct RfAvailabilityFactor {
    /// The factor's name in the composition rule.
    pub name: &'static str,
    /// Its value — 0 or 1; these are indicators, not probabilities.
    pub value: f64,
    /// The engine quantity the indicator was read off.
    pub source: &'static str,
    /// The provenance class of that quantity, carried through to this output.
    pub provenance: &'static str,
    /// The condition the indicator tests.
    pub condition: &'static str,
}

/// A factor that is deliberately NOT in the product, and why. Named rather than omitted:
/// a composition that silently drops a term reads as a complete one.
#[derive(Clone, Debug, Serialize)]
pub struct OmittedFactor {
    /// What is missing.
    pub name: &'static str,
    /// Why this scenario cannot supply it, and where it does exist if it does.
    pub reason: &'static str,
}

/// **RF link availability** (G16) — margin- and tracking-limited, deterministic, and
/// explicitly not the same kind of number as the weather-limited optical availability.
#[derive(Clone, Debug, Serialize)]
pub struct RfAvailability {
    /// The composition rule, stated in full.
    pub rule: &'static str,
    /// One-word basis, so the kind of figure is machine-readable.
    pub basis: &'static str,
    /// Always `false`: this is an indicator product, not a probability.
    pub is_a_probability: bool,
    /// Always `false`: see `differs_from_optical`.
    pub comparable_to_optical_availability: bool,
    /// How this figure differs from `optical_availability`, in full.
    pub differs_from_optical: &'static str,
    /// Free-space path loss at the band centre over `range_km` (dB).
    pub fsl_db: f64,
    /// Carrier-to-noise density (dB-Hz).
    pub cn0_dbhz: f64,
    /// Energy-per-bit to noise density (dB).
    pub eb_n0_db: f64,
    /// `Eb/N0` margin over the requirement (dB).
    pub link_margin_db: f64,
    /// Whether the budget closes (`margin_db >= 0`).
    pub closes: bool,
    /// `C/N0 − tracking_threshold_dbhz` (dB).
    pub cn0_margin_db: f64,
    /// The tracking-loop verdict: `LOCKED`, `DEGRADED` or `LOST`.
    pub lock_status: &'static str,
    /// Whether the loop holds lock at all (`LOCKED` or `DEGRADED`).
    pub tracking_ok: bool,
    /// `I_closure` — 0 or 1.
    pub closure_indicator: f64,
    /// `I_track` — 0 or 1.
    pub tracking_indicator: f64,
    /// **The headline**: `A_rf = I_closure · I_track`, 0 or 1.
    pub availability: f64,
    /// Range at which the `Eb/N0` margin reaches zero (km).
    pub closure_range_km: f64,
    /// Range at which `C/N0` reaches the tracking threshold (km).
    pub tracking_range_km: f64,
    /// The smaller of the two — the range beyond which `A_rf` becomes 0 (km).
    pub max_range_km: f64,
    /// `range_km / max_range_km`: below 1 the link is inside both constraints.
    pub range_utilisation: f64,
    /// Which constraint binds first (`eb_n0_closure` / `tracking_threshold`).
    pub binding_constraint: &'static str,
    /// The factors in the product, each with its input's provenance.
    pub factors: Vec<RfAvailabilityFactor>,
    /// The factors deliberately not in it, each with the reason.
    pub factors_not_included: Vec<OmittedFactor>,
    /// `A·[optical meets grade] + (1−A)·A_rf·[RF meets grade]` — the precision-grade
    /// factor with the RF fallback's own availability applied. The released
    /// `joint_fom.precision_grade` assumes the RF fallback is always there (`A_rf = 1`)
    /// and is NOT changed by this figure; the two agree exactly whenever `A_rf = 1`.
    pub precision_grade_with_rf_availability: f64,
}

/// The optical leg of the like-for-like ranging comparison.
#[derive(Clone, Debug, Serialize)]
pub struct OpticalRangingLeg {
    /// 1σ one-way ranging precision (m).
    pub sigma_range_m: f64,
    /// 1σ one-way time-of-arrival precision (s); `sigma_range_m = c · sigma_time_s`.
    pub sigma_time_s: f64,
    /// Detected photons over the accumulation time on the ONE-WAY path.
    pub detected_photons_one_way: f64,
    /// RMS signal-pulse width (s).
    pub pulse_rms_s: f64,
    /// What estimator bound this is.
    pub estimator: &'static str,
}

/// The RF leg of the like-for-like ranging comparison.
#[derive(Clone, Debug, Serialize)]
pub struct RfRangingLeg {
    /// 1σ one-way ranging precision (m).
    pub sigma_range_m: f64,
    /// 1σ one-way code-phase timing precision (s); `sigma_range_m = c · sigma_time_s`.
    pub sigma_time_s: f64,
    /// Carrier-to-noise density the jitter was evaluated at (dB-Hz).
    pub cn0_dbhz: f64,
    /// DLL code-tracking jitter (chip).
    pub code_jitter_chips: f64,
    /// The chip rate the jitter was converted to metres through (chip/s).
    pub chip_rate_hz: f64,
    /// The loop noise bandwidth used (Hz).
    pub dll_bandwidth_hz: f64,
    /// What estimator bound this is.
    pub estimator: &'static str,
}

/// The one configuration both legs of the ranging comparison were evaluated at.
#[derive(Clone, Debug, Serialize)]
pub struct RangingCommonConfig {
    /// The one-way range both legs used (km).
    pub range_km: f64,
    /// The accumulation time both legs must average over (s).
    pub accumulation_time_s: f64,
    /// The propagation path convention — always `one-way` here.
    pub path: &'static str,
    /// The optical leg's accumulation time (s).
    pub optical_accumulation_s: f64,
    /// The RF leg's equivalent averaging time `1/(2·B_L)` (s).
    pub rf_equivalent_averaging_s: f64,
    /// Whether the two averaging times agree to 1e-9 relative. The ratio is refused
    /// when they do not.
    pub averaging_times_match: bool,
}

/// **Like-for-like optical-versus-RF ranging comparison** (G16): the same quantity, to
/// the same definition, at one common configuration emitted in this same object.
#[derive(Clone, Debug, Serialize)]
pub struct RangingComparison {
    /// How the comparison is set up and why, in full.
    pub method: &'static str,
    /// The configuration both legs were evaluated at.
    pub common_configuration: RangingCommonConfig,
    /// The optical leg.
    pub optical_leg: OpticalRangingLeg,
    /// The RF leg.
    pub rf_leg: RfRangingLeg,
    /// **The headline ratio** `sigma_optical / sigma_rf`; below 1 means optical is the
    /// tighter modality. `null` when the comparison is refused.
    pub optical_over_rf: Option<f64>,
    /// Its reciprocal, the factor by which optical beats RF. `null` when refused.
    pub rf_over_optical: Option<f64>,
    /// `20·log10(sigma_rf / sigma_optical)` — the same ratio in dB. `null` when refused.
    pub optical_advantage_db: Option<f64>,
    /// Whether the ratio was refused rather than quoted.
    pub refused: bool,
    /// Why, when it was. Empty when it was not.
    pub refusal_reason: String,
    /// The released headline `optical_link.optical_ranging_sigma_m` (m), carried so the
    /// comparison leg reconciles with it exactly.
    pub released_two_way_optical_sigma_m: f64,
    /// `released_two_way_optical_sigma_m / optical_leg.sigma_range_m` — exactly 1 when
    /// the scenario runs one-way, and the full two-way penalty otherwise.
    pub two_way_penalty_factor: f64,
    /// The scenario's CHOSEN RF 1σ input (m), carried only so the refusal below can name
    /// the number it declines to divide by.
    pub released_rf_position_sigma_m: f64,
    /// Why no ratio is formed against that chosen input.
    pub ratio_against_chosen_rf_sigma_refused: &'static str,
}

/// Resolved RF-leg inputs, grouped so the builders stay short.
struct RfInputs {
    band: Band,
    band_label: &'static str,
    eirp_dbw: f64,
    g_over_t_db: f64,
    other_losses_db: f64,
    data_rate_bps: f64,
    required_eb_n0_db: f64,
    range_m: f64,
    chip_rate_hz: f64,
    correlator_spacing_chips: f64,
    dll_bandwidth_hz: f64,
    dll_bandwidth_source: &'static str,
    integration_s: f64,
    tracking_threshold_dbhz: f64,
    degraded_margin_db: f64,
}

impl RfInputs {
    /// The one-way link budget both the availability and the ranging leg read from, so
    /// neither can be stated at an operating point the other did not see.
    fn link_params(&self) -> LinkParams {
        LinkParams {
            band: self.band,
            eirp_dbw: self.eirp_dbw,
            g_over_t_db: self.g_over_t_db,
            range_m: self.range_m,
            data_rate_bps: self.data_rate_bps,
            other_losses_db: self.other_losses_db,
        }
    }

    fn configuration(&self) -> RfLinkConfiguration {
        RfLinkConfiguration {
            band: self.band_label,
            carrier_hz: band_frequency_hz(self.band),
            eirp_dbw: self.eirp_dbw,
            g_over_t_db: self.g_over_t_db,
            other_losses_db: self.other_losses_db,
            data_rate_bps: self.data_rate_bps,
            required_eb_n0_db: self.required_eb_n0_db,
            range_km: self.range_m / 1000.0,
            chip_rate_hz: self.chip_rate_hz,
            correlator_spacing_chips: self.correlator_spacing_chips,
            dll_bandwidth_hz: self.dll_bandwidth_hz,
            dll_bandwidth_source: self.dll_bandwidth_source,
            predetection_integration_s: self.integration_s,
            tracking_threshold_dbhz: self.tracking_threshold_dbhz,
            degraded_margin_db: self.degraded_margin_db,
        }
    }
}

/// The range (m) at which a margin that is linear in `−20·log10(R)` reaches zero:
/// `R · 10^(margin/20)`. The free-space loss is the only range-dependent term in the link
/// equation, so this is exact, not a fit. Non-finite inputs give a non-finite answer
/// rather than a fabricated one.
pub fn margin_limited_range_m(range_m: f64, margin_db: f64) -> f64 {
    if !range_m.is_finite() || !margin_db.is_finite() || range_m <= 0.0 {
        return f64::NAN;
    }
    range_m * 10f64.powf(margin_db / 20.0)
}

/// Build the RF-availability block from the one-way link budget and the tracking
/// threshold. `precision_*` are the pieces the recomputed precision-grade factor needs:
/// the optical availability `a`, and whether each modality meets the stated grade.
fn build_rf_availability(
    inp: &RfInputs,
    a_optical: f64,
    opt_meets_grade: bool,
    rf_meets_grade: bool,
) -> RfAvailability {
    let params = inp.link_params();
    let lb = link_budget(&params, inp.required_eb_n0_db);
    let cn0_margin_db = lb.cn0_dbhz - inp.tracking_threshold_dbhz;
    let status = lock_status(
        lb.cn0_dbhz,
        inp.tracking_threshold_dbhz,
        inp.degraded_margin_db,
    );
    let status_label = match status {
        LockStatus::Locked => "LOCKED",
        LockStatus::Degraded => "DEGRADED",
        LockStatus::Lost => "LOST",
    };
    let tracking_ok = status != LockStatus::Lost;
    let i_closure = indicator(lb.closes);
    let i_track = indicator(tracking_ok);
    let availability = i_closure * i_track;

    let closure_range_m = margin_limited_range_m(inp.range_m, lb.margin_db);
    let tracking_range_m = margin_limited_range_m(inp.range_m, cn0_margin_db);
    let (max_range_m, binding_constraint) = if closure_range_m <= tracking_range_m {
        (closure_range_m, "eb_n0_closure")
    } else {
        (tracking_range_m, "tracking_threshold")
    };

    RfAvailability {
        rule: RF_AVAILABILITY_RULE,
        basis: "margin-and-tracking-threshold, deterministic indicator product",
        is_a_probability: false,
        comparable_to_optical_availability: false,
        differs_from_optical: RF_VS_OPTICAL_AVAILABILITY,
        fsl_db: lb.fsl_db,
        cn0_dbhz: lb.cn0_dbhz,
        eb_n0_db: lb.eb_n0_db,
        link_margin_db: lb.margin_db,
        closes: lb.closes,
        cn0_margin_db,
        lock_status: status_label,
        tracking_ok,
        closure_indicator: i_closure,
        tracking_indicator: i_track,
        availability,
        closure_range_km: closure_range_m / 1000.0,
        tracking_range_km: tracking_range_m / 1000.0,
        max_range_km: max_range_m / 1000.0,
        range_utilisation: inp.range_m / max_range_m,
        binding_constraint,
        factors: vec![
            RfAvailabilityFactor {
                name: "I_closure",
                value: i_closure,
                source: "linkbudget::link_budget(...).closes, over the CCSDS-401 / \
                         DSN-810-005 link equation at rf_link_configuration and the \
                         scenario's own range_km",
                provenance: "computed",
                condition: "Eb/N0 margin over required_eb_n0_db is >= 0 dB",
            },
            RfAvailabilityFactor {
                name: "I_track",
                value: i_track,
                source: "jamming::lock_status(C/N0, tracking_threshold_dbhz, \
                         degraded_margin_db), on the C/N0 the SAME link budget returned",
                provenance: "computed",
                condition: "the tracking loop holds lock (LOCKED or DEGRADED, not LOST)",
            },
        ],
        factors_not_included: vec![
            OmittedFactor {
                name: "geometric_visibility",
                reason: "this scenario carries no constellation, no site coordinates and \
                         no epoch grid: the RF link is one point-to-point path at one \
                         stated range. A visibility fraction needs an orbit and a site, \
                         neither of which this kind takes as input, and inventing them \
                         would put the RF leg at a geometry the optical leg is not at. \
                         The `lunar-jamming` kind computes per-(epoch, satellite) \
                         visibility over a lunar constellation and is the kind to run for \
                         it. The factor is named here rather than silently set to 1",
            },
            OmittedFactor {
                name: "interference_denial",
                reason: "no jammer is configured in this kind, so jamming::lock_status is \
                         evaluated against the clean-link C/N0 and no per-satellite denial \
                         status exists to compose. `lunar-jamming` emits that status per \
                         (epoch, satellite); it is not re-derived here",
            },
            OmittedFactor {
                name: "rf_outage_climatology",
                reason: "THE MISSING INPUT. Nothing in this engine measures an RF \
                         link-outage distribution at this band and geometry - no rain or \
                         scintillation fade statistics, no measured outage record. Without \
                         one there is no distribution to integrate the margin over, so the \
                         figure above is an indicator and not a probability. Supplying a \
                         fade climatology is the smallest change that would make the RF \
                         figure comparable with the optical one; it is named here rather \
                         than invented",
            },
        ],
        precision_grade_with_rf_availability: a_optical * indicator(opt_meets_grade)
            + (1.0 - a_optical) * availability * indicator(rf_meets_grade),
    }
}

/// Build the like-for-like ranging comparison. `optical` supplies the one-way photon
/// rate; `released_two_way_sigma_m` is the headline the comparison must reconcile with.
fn build_ranging_comparison(
    inp: &RfInputs,
    optical: &OpticalLinkResult,
    pulse_rms_s: f64,
    released_two_way_sigma_m: f64,
    released_rf_position_sigma_m: f64,
) -> RangingComparison {
    // --- optical leg, evaluated ONE-WAY at the common configuration ---
    let n_one_way = detected_photons(optical.photon_rate_hz, inp.integration_s);
    let opt_sigma_time_s = photon_limited_toa_crlb_s(pulse_rms_s, n_one_way);
    let opt_sigma_range_m = photon_limited_range_crlb_m(pulse_rms_s, n_one_way, false);

    // --- RF leg, evaluated ONE-WAY at the same range and accumulation time ---
    let lb = link_budget(&inp.link_params(), inp.required_eb_n0_db);
    let code_jitter_chips = dll_code_jitter_chips(
        lb.cn0_dbhz,
        inp.dll_bandwidth_hz,
        inp.correlator_spacing_chips,
        inp.integration_s,
    );
    let rf_sigma_time_s = code_jitter_chips / inp.chip_rate_hz;
    let rf_sigma_range_m = C_M_PER_S * rf_sigma_time_s;

    // --- the common-configuration gate ---
    let rf_equivalent_averaging_s = if inp.dll_bandwidth_hz > 0.0 {
        1.0 / (2.0 * inp.dll_bandwidth_hz)
    } else {
        f64::INFINITY
    };
    let scale = inp.integration_s.abs().max(rf_equivalent_averaging_s.abs());
    let averaging_times_match = rf_equivalent_averaging_s.is_finite()
        && (rf_equivalent_averaging_s - inp.integration_s).abs() <= 1e-9 * scale.max(1.0);

    let legs_usable = opt_sigma_range_m.is_finite()
        && opt_sigma_range_m > 0.0
        && rf_sigma_range_m.is_finite()
        && rf_sigma_range_m > 0.0;

    let refusal_reason = if !averaging_times_match {
        format!(
            "REFUSED: the two legs are not at a common averaging time. The optical leg \
             accumulates over integration_s = {} s; the RF leg's loop noise bandwidth \
             B_L = {} Hz averages over 1/(2*B_L) = {} s. A ratio of two sigmas taken at \
             different averaging times is not a comparison, so none is quoted. Remove the \
             rf_dll_bandwidth_hz override (it then defaults to 1/(2*integration_s)) or set \
             it to {} Hz.",
            inp.integration_s,
            inp.dll_bandwidth_hz,
            rf_equivalent_averaging_s,
            1.0 / (2.0 * inp.integration_s)
        )
    } else if !legs_usable {
        format!(
            "REFUSED: a leg is not a usable positive finite sigma (optical {opt_sigma_range_m} \
             m, RF {rf_sigma_range_m} m), so no ratio is formed."
        )
    } else {
        String::new()
    };
    let refused = !refusal_reason.is_empty();
    let ratio = if refused {
        None
    } else {
        Some(opt_sigma_range_m / rf_sigma_range_m)
    };

    RangingComparison {
        method: RANGING_COMPARISON_METHOD,
        common_configuration: RangingCommonConfig {
            range_km: inp.range_m / 1000.0,
            accumulation_time_s: inp.integration_s,
            path: "one-way",
            optical_accumulation_s: inp.integration_s,
            rf_equivalent_averaging_s,
            averaging_times_match,
        },
        optical_leg: OpticalRangingLeg {
            sigma_range_m: opt_sigma_range_m,
            sigma_time_s: opt_sigma_time_s,
            detected_photons_one_way: n_one_way,
            pulse_rms_s,
            estimator: "photon-limited time-of-arrival CRLB, sigma_tau = \
                        pulse_rms / sqrt(N_detected), range = c * sigma_tau on the one-way \
                        path (optical_linkbudget::photon_limited_range_crlb_m with \
                        two_way = false)",
        },
        rf_leg: RfRangingLeg {
            sigma_range_m: rf_sigma_range_m,
            sigma_time_s: rf_sigma_time_s,
            cn0_dbhz: lb.cn0_dbhz,
            code_jitter_chips,
            chip_rate_hz: inp.chip_rate_hz,
            dll_bandwidth_hz: inp.dll_bandwidth_hz,
            estimator: "DLL early-late coherent thermal code-tracking jitter (Kaplan & \
                        Hegarty eq. 8.90, navsignal::dll_code_jitter_chips) at the C/N0 \
                        linkbudget::link_budget returns for the same one-way range, \
                        converted to metres through the chip rate",
        },
        optical_over_rf: ratio,
        rf_over_optical: ratio.map(|r| 1.0 / r),
        optical_advantage_db: ratio.map(|r| -20.0 * r.log10()),
        refused,
        refusal_reason,
        released_two_way_optical_sigma_m: released_two_way_sigma_m,
        two_way_penalty_factor: released_two_way_sigma_m / opt_sigma_range_m,
        released_rf_position_sigma_m,
        ratio_against_chosen_rf_sigma_refused: RF_SIGMA_RATIO_REFUSAL,
    }
}

/// One point of the analytic detection-power curve for a bias fault on one axis.
#[derive(Clone, Debug, Serialize)]
pub struct FaultCurvePoint {
    /// Fault magnitude as a multiple of this axis' minimum detectable bias.
    pub fault_multiple_of_mdb: f64,
    /// Fault magnitude in the axis unit (m for position axes, s for the clock axis).
    pub fault_magnitude: f64,
    /// The non-centrality `λ = bias²/(σ_rf² + σ_opt²)` the fault injects.
    pub noncentrality: f64,
    /// `P_d = 1 − F_{χ'²}(T; dof, λ)`.
    pub p_detect: f64,
}

/// One **actually injected** bias fault: the monitor was re-run with the bias applied to
/// the RF estimate of the axis, and this is what it reported.
#[derive(Clone, Debug, Serialize)]
pub struct InjectedFault {
    /// Fault magnitude as a multiple of the axis MDB.
    pub fault_multiple_of_mdb: f64,
    /// The bias added to the RF estimate on this axis (axis unit).
    pub injected_bias: f64,
    /// The non-centrality the analytic model predicts for this bias.
    pub expected_noncentrality: f64,
    /// The χ² statistic the monitor actually reported with the bias injected.
    pub realised_chi2_statistic: f64,
    /// Whether the monitor raised the fault flag.
    pub fault_detected: bool,
}

/// Per-axis bias / ramp fault sensitivity of the cross-modality monitor.
#[derive(Clone, Debug, Serialize)]
pub struct AxisFaultStudy {
    /// The axis label (`east`, `north`, `up`, `clock`).
    pub name: String,
    /// The axis role, which picks the alert limit it is compared against.
    pub role: AxisRole,
    /// The unit this axis' magnitudes carry (`m` or `s`).
    pub unit: &'static str,
    /// `√(σ_rf² + σ_opt²)` — the 1σ of the fault-free separation on this axis.
    pub sigma_separation: f64,
    /// The minimum detectable bias at the scenario's `p_fa` / `p_md` (axis unit).
    pub minimum_detectable_bias: f64,
    /// The alert limit this axis is compared against (axis unit).
    pub alert_limit: f64,
    /// `MDB / alert_limit`. `None` when the alert limit is not positive.
    pub mdb_over_alert_limit: Option<f64>,
    /// `true` when the smallest bias the monitor can detect is already **larger** than the
    /// alert limit — i.e. a fault can sit inside the missed-detection budget while the
    /// solution is out of tolerance.
    pub mdb_exceeds_alert_limit: bool,
    /// The ramp rate used for the ramp treatment (axis unit per second).
    pub ramp_rate_per_s: f64,
    /// Time for the ramp to reach the MDB (s). `None` when the ramp rate is not positive.
    /// See `CrossMonitorFaultStudy::ramp_note` for exactly what this is and is not.
    pub ramp_time_to_detect_s: Option<f64>,
    /// The analytic detection-power curve over fault magnitude.
    pub detection_power_curve: Vec<FaultCurvePoint>,
    /// Faults actually injected through the monitor, and what it reported.
    pub injected: Vec<InjectedFault>,
}

/// Fault injection and detection power for the cross-modality χ² monitor (G15).
#[derive(Clone, Debug, Serialize)]
pub struct CrossMonitorFaultStudy {
    /// Monitor degrees of freedom (= number of monitored axes).
    pub dof: usize,
    /// The monitor's detection threshold `χ²_{1−P_fa}(dof)`.
    pub chi2_threshold: f64,
    /// False-alarm probability the threshold was set at.
    pub p_fa: f64,
    /// Missed-detection probability the MDB is stated at.
    pub p_md: f64,
    /// The fault-free statistic (the no-fault case the monitor already demonstrated).
    pub fault_free_chi2_statistic: f64,
    /// `λ*` — the non-centrality at which `P_md` is exactly met.
    pub noncentrality_at_mdb: f64,
    /// `√λ*` — the normalised minimum detectable bias, shared by every axis.
    pub pbias: f64,
    /// `P_d` at zero fault. Equals `p_fa` by construction.
    pub p_detect_at_zero_fault: f64,
    /// `P_d` at the MDB. Equals `1 − p_md` by construction.
    pub p_detect_at_mdb: f64,
    /// `√(T/λ*)` — the multiple of the MDB at which a **noise-free** bias first pushes the
    /// realised statistic over the threshold. Below 1 because the MDB is a statistical
    /// power point, not a deterministic crossing.
    pub deterministic_detection_multiple_of_mdb: f64,
    /// Headline: minimum detectable horizontal-axis bias (m). `null` when the monitor
    /// has no horizontal axis.
    pub mdb_horizontal_m: Option<f64>,
    /// Headline: minimum detectable vertical-axis bias (m). `null` when absent.
    pub mdb_vertical_m: Option<f64>,
    /// Headline: minimum detectable clock bias (s). `null` when absent.
    pub mdb_timing_s: Option<f64>,
    /// Per-axis detail.
    pub axes: Vec<AxisFaultStudy>,
    /// How the numbers were obtained.
    pub method: &'static str,
    /// What the ramp figure is, and what the scenario cannot support.
    pub ramp_note: &'static str,
}

/// One sample of the post-handover coast profile.
#[derive(Clone, Debug, Serialize)]
pub struct CoastSample {
    /// Time since the handover (s).
    pub t_s: f64,
    /// Horizontal 1σ `√(P_east + P_north)` (m).
    pub sigma_h_m: f64,
    /// `k·σ_h` (m) — what is compared against the horizontal alert limit.
    pub bound_h_m: f64,
    /// Vertical 1σ (m).
    pub sigma_v_m: f64,
    /// `k·σ_v` (m).
    pub bound_v_m: f64,
    /// Clock 1σ (s).
    pub sigma_t_s: f64,
    /// `k·σ_t` (s).
    pub bound_t_s: f64,
    /// Whether all three bounds are inside their alert limits at this time.
    pub inside_alert_limits: bool,
}

/// The post-handover covariance re-growth for one handoff direction (G17).
#[derive(Clone, Debug, Serialize)]
pub struct PostHandoverCoast {
    /// Which handoff this coast follows.
    pub direction: &'static str,
    /// Position-axis covariance trace immediately after the handover (m²). This is the
    /// position-only trace; `total_variance_after_handoff` is the whole diagonal
    /// (position in m² plus the clock term in s²), as the handoff report already emits it.
    pub position_variance_after_handoff_m2: f64,
    /// Clock variance immediately after the handover (s²).
    pub clock_variance_after_handoff_s2: f64,
    /// The whole-diagonal trace, for reconciliation with the `handoff` block.
    pub total_variance_after_handoff: f64,
    /// Horizontal 1σ at the handover (m).
    pub sigma_h_at_handover_m: f64,
    /// Vertical 1σ at the handover (m).
    pub sigma_v_at_handover_m: f64,
    /// Clock 1σ at the handover (s).
    pub sigma_t_at_handover_s: f64,
    /// `k·σ_h` at the handover (m).
    pub bound_h_at_handover_m: f64,
    /// `k·σ_v` at the handover (m).
    pub bound_v_at_handover_m: f64,
    /// `k·σ_t` at the handover (s).
    pub bound_t_at_handover_s: f64,
    /// Whether the coasting solution starts inside all three alert limits.
    pub inside_alert_limits_at_handover: bool,
    /// Time until `k·σ_h` reaches the horizontal alert limit (s); `null` = never.
    pub time_to_alert_limit_h_s: Option<f64>,
    /// Time until `k·σ_v` reaches the vertical alert limit (s); `null` = never.
    pub time_to_alert_limit_v_s: Option<f64>,
    /// Time until `k·σ_t` reaches the timing alert limit (s); `null` = never.
    pub time_to_alert_limit_t_s: Option<f64>,
    /// Which limit binds first (`horizontal` / `vertical` / `timing` / `none`).
    pub binding_limit: &'static str,
    /// **The headline**: how long the post-handover solution stays inside every alert
    /// limit (s). `null` when no limit is ever reached.
    pub time_inside_alert_limits_s: Option<f64>,
    /// The re-growth time constant of the horizontal variance: `P_h(0)/(2·q_pos)`, the
    /// time for the post-handover horizontal variance to double (s); `null` when
    /// `q_pos ≤ 0`.
    pub horizontal_variance_doubling_time_s: Option<f64>,
    /// The same time constant for the vertical variance, `P_v(0)/q_pos` (s).
    pub vertical_variance_doubling_time_s: Option<f64>,
    /// The same time constant for the clock variance, `P_t(0)/q_clock` (s).
    pub clock_variance_doubling_time_s: Option<f64>,
    /// A sampled coast profile out to 1.5× the binding crossing.
    pub profile: Vec<CoastSample>,
}

/// Post-handover variance re-growth against the alert limits (G17).
#[derive(Clone, Debug, Serialize)]
pub struct CoastStudy {
    /// The process-noise model, stated in full.
    pub model: &'static str,
    /// Position-axis process-noise PSD (m²/s).
    pub process_noise_position_psd_m2_s: f64,
    /// Clock-axis process-noise PSD (s²/s).
    pub process_noise_clock_psd_s2_s: f64,
    /// The coverage factor applied to the coasting 1σ.
    pub coverage_k: f64,
    /// Where the coverage factor came from.
    pub coverage_k_source: &'static str,
    /// Horizontal alert limit used (m) — the scenario's own `alert_limit_h_m`.
    pub alert_limit_h_m: f64,
    /// Vertical alert limit used (m).
    pub alert_limit_v_m: f64,
    /// Timing alert limit used (s).
    pub alert_limit_t_s: f64,
    /// Headline: coast time inside the alert limits after the optical→RF handover (s).
    pub time_inside_alert_limits_optical_to_rf_s: Option<f64>,
    /// Headline: coast time inside the alert limits after the RF→optical handover (s).
    pub time_inside_alert_limits_rf_to_optical_s: Option<f64>,
    /// Per-direction detail.
    pub directions: Vec<PostHandoverCoast>,
    /// What this model does and does not claim.
    pub caveat: &'static str,
}

/// Multiples of the minimum detectable bias at which the analytic detection-power curve
/// is sampled. The curve is axis-invariant in these units (`λ = m²·λ*`), so the shape is
/// shared and only the absolute magnitudes differ per axis.
const FAULT_CURVE_MULTIPLES: [f64; 12] = [
    0.0, 0.1, 0.25, 0.5, 0.65, 0.75, 0.9, 1.0, 1.1, 1.25, 1.5, 2.0,
];

/// Multiples of the minimum detectable bias at which a bias is **actually injected** into
/// the RF estimate and the real monitor re-run. Straddles the deterministic crossing
/// (`√(T/λ*)` ≈ 0.65) so the ladder shows a miss, a detection at the MDB, and a detection
/// well above it.
const FAULT_INJECTION_MULTIPLES: [f64; 3] = [0.5, 1.0, 2.0];

/// Number of samples in the emitted post-handover coast profile.
const COAST_PROFILE_SAMPLES: usize = 9;

/// Resolved inputs the fault study needs, grouped so the builder stays a 3-argument call.
struct FaultInputs {
    p_fa: f64,
    p_md: f64,
    alert_h: f64,
    alert_v: f64,
    alert_t: f64,
    ramp_pos: f64,
    ramp_clk: f64,
}

/// Resolved inputs the post-handover coast needs.
struct CoastInputs {
    q_pos: f64,
    q_clk: f64,
    k: f64,
    alert_h: f64,
    alert_v: f64,
    alert_t: f64,
}

/// Build the G15 fault-injection / detection-power study for the cross-modality monitor.
///
/// `cross` supplies the threshold the monitor itself applied, so the MDB can never be
/// stated against a threshold the monitor does not use.
fn build_fault_study(
    axes: &[CrossAxis],
    cross: &CrossRaimResult,
    inp: &FaultInputs,
) -> CrossMonitorFaultStudy {
    let dof = axes.len().max(1) as f64;
    let threshold = cross.chi2_threshold;
    // Invert the non-central χ² tail on the non-centrality: λ* is the smallest λ whose
    // missed-detection probability is P_md. `pbias` returns √λ*.
    let root_lambda = pbias(threshold, dof, inp.p_md);
    let lambda_star = root_lambda * root_lambda;

    // P_d depends on the fault only through λ = m²·λ*, so the curve in MDB multiples is
    // identical on every axis. Evaluate the non-central tail once.
    let shared_curve: Vec<(f64, f64, f64)> = FAULT_CURVE_MULTIPLES
        .iter()
        .map(|&m| {
            let lambda = m * m * lambda_star;
            (m, lambda, chi2_detection_power(threshold, dof, lambda))
        })
        .collect();

    let mut out = Vec::with_capacity(axes.len());
    for (i, ax) in axes.iter().enumerate() {
        let sigma_separation = (ax.rf_sigma.powi(2) + ax.opt_sigma.powi(2)).sqrt();
        let mdb = root_lambda * sigma_separation;
        let (unit, alert_limit, ramp_rate_per_s) = match ax.role {
            AxisRole::Horizontal => ("m", inp.alert_h, inp.ramp_pos),
            AxisRole::Vertical => ("m", inp.alert_v, inp.ramp_pos),
            AxisRole::Timing => ("s", inp.alert_t, inp.ramp_clk),
        };
        let mdb_over_alert_limit = if alert_limit > 0.0 && alert_limit.is_finite() {
            Some(mdb / alert_limit)
        } else {
            None
        };
        let ramp_time_to_detect_s = if ramp_rate_per_s.is_finite() && ramp_rate_per_s > 0.0 {
            Some(mdb / ramp_rate_per_s)
        } else {
            None
        };
        let detection_power_curve = shared_curve
            .iter()
            .map(|&(m, lambda, p_detect)| FaultCurvePoint {
                fault_multiple_of_mdb: m,
                fault_magnitude: m * mdb,
                noncentrality: lambda,
                p_detect,
            })
            .collect();
        // Actually inject the bias and re-run the monitor. Nothing analytic here: the
        // statistic reported below is the one the monitor computed.
        let injected = FAULT_INJECTION_MULTIPLES
            .iter()
            .map(|&m| {
                let bias = m * mdb;
                let mut faulted: Vec<CrossAxis> = axes.to_vec();
                faulted[i].rf_value += bias;
                let r = run_cross_raim(&faulted, inp.p_fa, inp.p_md);
                InjectedFault {
                    fault_multiple_of_mdb: m,
                    injected_bias: bias,
                    expected_noncentrality: bias_noncentrality(bias, sigma_separation),
                    realised_chi2_statistic: r.chi2_statistic,
                    fault_detected: r.fault_detected,
                }
            })
            .collect();
        out.push(AxisFaultStudy {
            name: ax.name.clone(),
            role: ax.role,
            unit,
            sigma_separation,
            minimum_detectable_bias: mdb,
            alert_limit,
            mdb_over_alert_limit,
            mdb_exceeds_alert_limit: alert_limit > 0.0
                && alert_limit.is_finite()
                && mdb > alert_limit,
            ramp_rate_per_s,
            ramp_time_to_detect_s,
            detection_power_curve,
            injected,
        });
    }

    let first = |role: AxisRole| -> Option<f64> {
        out.iter()
            .find(|a| a.role == role)
            .map(|a| a.minimum_detectable_bias)
    };
    CrossMonitorFaultStudy {
        dof: axes.len(),
        chi2_threshold: threshold,
        p_fa: inp.p_fa,
        p_md: inp.p_md,
        fault_free_chi2_statistic: cross.chi2_statistic,
        noncentrality_at_mdb: lambda_star,
        pbias: root_lambda,
        p_detect_at_zero_fault: chi2_detection_power(threshold, dof, 0.0),
        p_detect_at_mdb: chi2_detection_power(threshold, dof, lambda_star),
        deterministic_detection_multiple_of_mdb: (threshold / lambda_star.max(f64::MIN_POSITIVE))
            .sqrt(),
        mdb_horizontal_m: first(AxisRole::Horizontal),
        mdb_vertical_m: first(AxisRole::Vertical),
        mdb_timing_s: first(AxisRole::Timing),
        axes: out,
        method: FAULT_METHOD,
        ramp_note: FAULT_RAMP_NOTE,
    }
}

/// Propagate one post-handover covariance forward and find the alert-limit crossings.
fn build_coast_direction(
    direction: &'static str,
    p_diag: &[f64],
    inp: &CoastInputs,
) -> PostHandoverCoast {
    let g = |i: usize| p_diag.get(i).copied().unwrap_or(0.0);
    let (p_e, p_n, p_u, p_c) = (g(0), g(1), g(2), g(3));
    let p_h0 = p_e + p_n;
    let p_v0 = p_u;
    let p_t0 = p_c;
    // Horizontal variance is the sum of two independent random-walk axes, so it grows at
    // twice the per-axis PSD.
    let q_h = 2.0 * inp.q_pos;
    let sigma_at = |p0: f64, q: f64, t: f64| (p0 + q * t).max(0.0).sqrt();

    let t_h = random_walk_time_to_limit(p_h0, q_h, inp.k, inp.alert_h);
    let t_v = random_walk_time_to_limit(p_v0, inp.q_pos, inp.k, inp.alert_v);
    let t_t = random_walk_time_to_limit(p_t0, inp.q_clk, inp.k, inp.alert_t);

    let mut binding_limit = "none";
    let mut earliest: Option<f64> = None;
    for (name, t) in [("horizontal", t_h), ("vertical", t_v), ("timing", t_t)] {
        if let Some(t) = t {
            match earliest {
                Some(e) if t >= e => {}
                _ => {
                    earliest = Some(t);
                    binding_limit = name;
                }
            }
        }
    }

    let bound_h0 = inp.k * sigma_at(p_h0, q_h, 0.0);
    let bound_v0 = inp.k * sigma_at(p_v0, inp.q_pos, 0.0);
    let bound_t0 = inp.k * sigma_at(p_t0, inp.q_clk, 0.0);
    let inside_at_0 = bound_h0 <= inp.alert_h && bound_v0 <= inp.alert_v && bound_t0 <= inp.alert_t;

    // Profile out to 1.5x the binding crossing, so the crossing is visible inside it.
    let horizon = match earliest {
        Some(t) if t.is_finite() && t > 0.0 => t * 1.5,
        _ => 1.0,
    };
    let profile = (0..COAST_PROFILE_SAMPLES)
        .map(|j| {
            let t = horizon * j as f64 / (COAST_PROFILE_SAMPLES - 1) as f64;
            let sh = sigma_at(p_h0, q_h, t);
            let sv = sigma_at(p_v0, inp.q_pos, t);
            let st = sigma_at(p_t0, inp.q_clk, t);
            let (bh, bv, bt) = (inp.k * sh, inp.k * sv, inp.k * st);
            CoastSample {
                t_s: t,
                sigma_h_m: sh,
                bound_h_m: bh,
                sigma_v_m: sv,
                bound_v_m: bv,
                sigma_t_s: st,
                bound_t_s: bt,
                inside_alert_limits: bh <= inp.alert_h && bv <= inp.alert_v && bt <= inp.alert_t,
            }
        })
        .collect();

    let doubling = |p0: f64, q: f64| if q > 0.0 { Some(p0 / q) } else { None };
    PostHandoverCoast {
        direction,
        position_variance_after_handoff_m2: p_e + p_n + p_u,
        clock_variance_after_handoff_s2: p_c,
        total_variance_after_handoff: p_diag.iter().sum(),
        sigma_h_at_handover_m: sigma_at(p_h0, q_h, 0.0),
        sigma_v_at_handover_m: sigma_at(p_v0, inp.q_pos, 0.0),
        sigma_t_at_handover_s: sigma_at(p_t0, inp.q_clk, 0.0),
        bound_h_at_handover_m: bound_h0,
        bound_v_at_handover_m: bound_v0,
        bound_t_at_handover_s: bound_t0,
        inside_alert_limits_at_handover: inside_at_0,
        time_to_alert_limit_h_s: t_h,
        time_to_alert_limit_v_s: t_v,
        time_to_alert_limit_t_s: t_t,
        binding_limit,
        time_inside_alert_limits_s: earliest,
        horizontal_variance_doubling_time_s: doubling(p_h0, q_h),
        vertical_variance_doubling_time_s: doubling(p_v0, inp.q_pos),
        clock_variance_doubling_time_s: doubling(p_t0, inp.q_clk),
        profile,
    }
}

/// Unit and provenance class for every numeric leaf the report emits that the released
/// `units` literal in `HybridOpticalRfScenario::json` does not already name.
///
/// The released literal covers the headline scalars plus two subtree placeholders
/// (`fault_injection.axes`, `post_handover_coast.directions`) that describe a whole block in
/// prose. Neither placeholder is a leaf path, so under the path grammar of
/// [`crate::field_schema`] neither covers a field; both stay because they are part of a
/// released document, and the per-leaf entries below are merged in beside them.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "cross_modality_raim.alert_limit_h_m",
            unit: "m",
            provenance: Input,
            definition: "horizontal alert limit the horizontal protection level is compared \
                         against; the scenario's alert_limit_h_m after defaults (10 m)",
        },
        FieldUnit {
            path: "cross_modality_raim.alert_limit_v_m",
            unit: "m",
            provenance: Input,
            definition: "vertical alert limit the vertical protection level is compared against; \
                         the scenario's alert_limit_v_m after defaults (15 m)",
        },
        FieldUnit {
            path: "cross_modality_raim.alert_limit_t_s",
            unit: "s",
            provenance: Input,
            definition: "timing alert limit the timing protection level is compared against; the \
                         scenario's alert_limit_t_s after defaults (20 ns)",
        },
        FieldUnit {
            path: "cross_modality_raim.n_axes",
            unit: "count",
            provenance: Computed,
            definition: "number of monitored axes, which is also the degrees of freedom of the \
                         chi-square detector",
        },
        FieldUnit {
            path: "cross_modality_raim.chi2_statistic",
            unit: "1",
            provenance: Computed,
            definition: "the monitor statistic sum_axes (y_rf - y_opt)^2/(sigma_rf^2 + \
                         sigma_opt^2); chi-square with n_axes = 4 degrees of freedom under the \
                         fault-free hypothesis",
        },
        FieldUnit {
            path: "cross_modality_raim.chi2_threshold",
            unit: "1",
            provenance: ClosedForm,
            definition: "the detection threshold chi-square_{1-P_fa}(n_axes): the exact quantile \
                         at 4 degrees of freedom, the same value fault_injection.chi2_threshold \
                         reports",
        },
        FieldUnit {
            path: "cross_modality_raim.axes[].fused_value",
            unit: "mixed - see note",
            provenance: Computed,
            definition: "the inverse-variance (minimum-variance) fusion of the RF and optical \
                         estimates on this axis; metres on the east/north/up rows and seconds on \
                         the clock row, as the row's own `role` field says",
        },
        FieldUnit {
            path: "cross_modality_raim.axes[].fused_sigma",
            unit: "mixed - see note",
            provenance: Computed,
            definition:
                "1 sigma of that fusion, sqrt(1/(1/sigma_rf^2 + 1/sigma_opt^2)); metres on \
                         the east/north/up rows and seconds on the clock row, as the row's own \
                         `role` field says",
        },
        FieldUnit {
            path: "cross_modality_raim.axes[].separation_statistic",
            unit: "1",
            provenance: Computed,
            definition: "the axis term (y_rf - y_opt)^2/(sigma_rf^2 + sigma_opt^2) of the monitor \
                         statistic, chi-square with 1 degree of freedom under the fault-free \
                         hypothesis",
        },
        FieldUnit {
            path: "cross_modality_raim.axes[].protection_level",
            unit: "mixed - see note",
            provenance: Computed,
            definition: "the solution-separation protection level K_fa*sqrt(sigma_rf^2 + \
                         sigma_opt^2)*max(w_rf, w_opt) + K_md*sigma_fused on this axis; metres on \
                         the east/north/up rows and seconds on the clock row, as the row's own \
                         `role` field says",
        },
        FieldUnit {
            path: "fault_injection.dof",
            unit: "count",
            provenance: Computed,
            definition: "degrees of freedom of the monitor's chi-square statistic, the number of \
                         monitored axes",
        },
        FieldUnit {
            path: "fault_injection.p_fa",
            unit: "1",
            provenance: Input,
            definition: "false-alarm probability the detection threshold was set at (default 1e-5)",
        },
        FieldUnit {
            path: "fault_injection.p_md",
            unit: "1",
            provenance: Input,
            definition: "missed-detection probability the minimum detectable bias and the power \
                         curve are stated at (default 1e-3)",
        },
        FieldUnit {
            path: "fault_injection.axes[].sigma_separation",
            unit: "mixed - see note",
            provenance: Computed,
            definition: "sqrt(sigma_rf^2 + sigma_opt^2), the 1 sigma of the fault-free \
                         RF-minus-optical separation on this axis, in the unit the row's own \
                         `unit` field names (m on east/north/up, s on clock)",
        },
        FieldUnit {
            path: "fault_injection.axes[].minimum_detectable_bias",
            unit: "mixed - see note",
            provenance: Computed,
            definition: "the smallest bias on this axis the monitor detects with probability 1 - \
                         P_md, sqrt(lambda*)*sigma_separation, in the unit the row's own `unit` \
                         field names (m on east/north/up, s on clock)",
        },
        FieldUnit {
            path: "fault_injection.axes[].alert_limit",
            unit: "mixed - see note",
            provenance: Input,
            definition: "the alert limit this axis is compared against, selected from the \
                         scenario's alert limits by the axis role, in the unit the row's own \
                         `unit` field names (m on east/north/up, s on clock)",
        },
        FieldUnit {
            path: "fault_injection.axes[].mdb_over_alert_limit",
            unit: "1",
            provenance: Computed,
            definition: "minimum_detectable_bias / alert_limit; above 1 the smallest fault the \
                         monitor can catch is already outside tolerance",
        },
        FieldUnit {
            path: "fault_injection.axes[].ramp_rate_per_s",
            unit: "mixed - see note",
            provenance: ModelledInput,
            definition: "the ramp rate the ramp treatment uses, in the axis unit per second (m/s \
                         on the position axes, s/s on the clock axis); a representative modelled \
                         input, default 0.05 m/s and 1e-11 s/s",
        },
        FieldUnit {
            path: "fault_injection.axes[].ramp_time_to_detect_s",
            unit: "s",
            provenance: Computed,
            definition: "minimum_detectable_bias / ramp_rate_per_s, a rate conversion and not a \
                         time-series simulation; see fault_injection.ramp_note",
        },
        FieldUnit {
            path: "fault_injection.axes[].detection_power_curve[].fault_multiple_of_mdb",
            unit: "1",
            provenance: Computed,
            definition: "the bias magnitude of this curve point, expressed as a multiple of the \
                         axis minimum detectable bias",
        },
        FieldUnit {
            path: "fault_injection.axes[].detection_power_curve[].fault_magnitude",
            unit: "mixed - see note",
            provenance: Computed,
            definition: "the same bias magnitude in the axis unit, fault_multiple_of_mdb * \
                         minimum_detectable_bias, in the unit the row's own `unit` field names (m \
                         on east/north/up, s on clock)",
        },
        FieldUnit {
            path: "fault_injection.axes[].detection_power_curve[].noncentrality",
            unit: "1",
            provenance: ClosedForm,
            definition: "lambda = bias^2/(sigma_rf^2 + sigma_opt^2), the non-centrality that bias \
                         injects into the chi-square statistic",
        },
        FieldUnit {
            path: "fault_injection.axes[].detection_power_curve[].p_detect",
            unit: "1",
            provenance: ClosedForm,
            definition: "probability the monitor flags that bias, 1 - F_noncentral_chi2(T; dof, \
                         lambda); its zero-fault end equals P_fa",
        },
        FieldUnit {
            path: "fault_injection.axes[].injected[].fault_multiple_of_mdb",
            unit: "1",
            provenance: Computed,
            definition:
                "the size of the bias actually written into the RF estimate, as a multiple \
                         of the axis minimum detectable bias",
        },
        FieldUnit {
            path: "fault_injection.axes[].injected[].injected_bias",
            unit: "mixed - see note",
            provenance: Computed,
            definition: "the bias actually added to the RF estimate on this axis before the \
                         monitor was re-run, in the unit the row's own `unit` field names (m on \
                         east/north/up, s on clock)",
        },
        FieldUnit {
            path: "fault_injection.axes[].injected[].expected_noncentrality",
            unit: "1",
            provenance: ClosedForm,
            definition: "the non-centrality the analytic model predicts for that injected bias, \
                         bias^2/(sigma_rf^2 + sigma_opt^2)",
        },
        FieldUnit {
            path: "fault_injection.axes[].injected[].realised_chi2_statistic",
            unit: "1",
            provenance: Computed,
            definition: "the statistic the monitor itself returned with the bias injected, read \
                         back from the re-run rather than predicted",
        },
        FieldUnit {
            path: "handoff.dof",
            unit: "count",
            provenance: Computed,
            definition: "degrees of freedom of the NEES chi-square, the number of filter states \
                         (4: east, north, up, clock)",
        },
        FieldUnit {
            path: "handoff.nees_gate_lo",
            unit: "1",
            provenance: ClosedForm,
            definition: "lower bound of the two-sided NEES consistency gate, the chi-square 0.025 \
                         quantile at dof degrees of freedom",
        },
        FieldUnit {
            path: "handoff.nees_gate_hi",
            unit: "1",
            provenance: ClosedForm,
            definition: "upper bound of the two-sided NEES consistency gate, the chi-square 0.975 \
                         quantile at dof degrees of freedom",
        },
        FieldUnit {
            path: "handoff_reverse.dof",
            unit: "count",
            provenance: Computed,
            definition: "degrees of freedom of the reverse pass' NEES chi-square, the number of \
                         filter states (4)",
        },
        FieldUnit {
            path: "handoff_reverse.final_nees",
            unit: "1",
            provenance: Computed,
            definition: "normalised estimation error squared of the final estimate against truth \
                         after the RF->optical pass; chi-square with dof degrees of freedom when \
                         the filter is consistent, judged against the same handoff.nees_gate_lo/hi",
        },
        FieldUnit {
            path: "handoff_reverse.max_mean_jump",
            unit: "m",
            provenance: Computed,
            definition: "largest per-axis change in the state mean across the reverse switch; the \
                         maximum runs over the 4-state (east, north, up, clock) diagonal, so the \
                         metre spelling follows the three position axes, and the bit-for-bit \
                         mean-continuity invariant holds the value at exactly 0",
        },
        FieldUnit {
            path: "handoff_reverse.variance_after_rf_stage",
            unit: "m^2",
            provenance: Computed,
            definition: "covariance trace after the loose RF update that precedes the reverse \
                         handoff; the trace runs over the whole 4-state diagonal (three position \
                         axes in m^2 plus the clock axis in s^2, about 1e-17 of the total here), \
                         the quantity handoff.variance_after_optical reports for the forward pass",
        },
        FieldUnit {
            path: "handoff_reverse.variance_after_handoff",
            unit: "m^2",
            provenance: Computed,
            definition: "covariance trace immediately after the reverse handoff's covariance \
                         inflation, over the same whole 4-state diagonal as \
                         handoff.variance_after_handoff",
        },
        FieldUnit {
            path: "handoff_reverse.variance_after_optical_stage",
            unit: "m^2",
            provenance: Computed,
            definition: "covariance trace after the final tight optical update of the reverse \
                         pass, over the same whole 4-state diagonal as handoff.variance_after_rf",
        },
        FieldUnit {
            path: "joint_fom.availability",
            unit: "1",
            provenance: Computed,
            definition:
                "the availability factor A: the spatially-correlated union availability of \
                         the optical ground network",
        },
        FieldUnit {
            path: "joint_fom.precision_grade",
            unit: "1",
            provenance: Computed,
            definition: "the precision factor P: A*[optical meets the grade] + (1 - A)*[RF meets \
                         the grade], the probability the delivered precision meets grade_pos_m and \
                         grade_time_s",
        },
        FieldUnit {
            path: "joint_fom.integrity_assured",
            unit: "1",
            provenance: Computed,
            definition:
                "the integrity factor I: 1 - P_HMI when every protection level sits inside \
                         its alert limit, and 0 otherwise",
        },
        FieldUnit {
            path: "joint_fom.joint_independent",
            unit: "1",
            provenance: Computed,
            definition: "A*P*I, the joint probability under the independence assumption",
        },
        FieldUnit {
            path: "joint_fom.joint_correlated",
            unit: "1",
            provenance: Computed,
            definition: "A*P*I + rho*(min(A,P,I) - A*P*I), the correlation-adjusted joint \
                         probability",
        },
        FieldUnit {
            path: "joint_fom.correlation",
            unit: "1",
            provenance: Input,
            definition: "the correlation rho in [0,1] that interpolates the joint between the \
                         independent product and the co-occurrence bound (default 0.5)",
        },
        FieldUnit {
            path: "joint_fom.score",
            unit: "1",
            provenance: Computed,
            definition: "the headline figure of merit, equal to joint_correlated",
        },
        FieldUnit {
            path: "link_configuration.wavelength_nm",
            unit: "nm",
            provenance: Input,
            definition: "optical carrier wavelength as supplied (default 1550 nm), echoed in the \
                         unit it was given in rather than round-tripped through metres",
        },
        FieldUnit {
            path: "link_configuration.tx_power_w",
            unit: "W",
            provenance: Input,
            definition: "optical transmit power (default 1e-3 W)",
        },
        FieldUnit {
            path: "link_configuration.tx_aperture_m",
            unit: "m",
            provenance: Input,
            definition: "transmit aperture diameter (default 0.85 m)",
        },
        FieldUnit {
            path: "link_configuration.rx_aperture_m",
            unit: "m",
            provenance: Input,
            definition: "receive aperture diameter (default 0.85 m)",
        },
        FieldUnit {
            path: "link_configuration.range_km",
            unit: "km",
            provenance: Input,
            definition: "one-way link range as supplied (default 384000 km, the Earth-Moon \
                         distance)",
        },
        FieldUnit {
            path: "link_configuration.optics_efficiency",
            unit: "1",
            provenance: Input,
            definition: "optics throughput as a fraction in [0,1] (default 0.5)",
        },
        FieldUnit {
            path: "link_configuration.detector_efficiency",
            unit: "1",
            provenance: Input,
            definition: "detector quantum efficiency as a fraction in [0,1] (default 0.7)",
        },
        FieldUnit {
            path: "link_configuration.atmospheric_loss_db",
            unit: "dB",
            provenance: ModelledInput,
            definition: "one-way atmospheric loss allocation (default 3 dB): a modelled budget \
                         line, not a measurement",
        },
        FieldUnit {
            path: "link_configuration.pointing_loss_db",
            unit: "dB",
            provenance: ModelledInput,
            definition:
                "pointing / jitter loss allocation (default 3 dB): a modelled budget line, \
                         not a measurement",
        },
        FieldUnit {
            path: "link_configuration.pulse_rms_ps",
            unit: "ps",
            provenance: Input,
            definition: "RMS width of the signal pulse as supplied (default 50 ps)",
        },
        FieldUnit {
            path: "link_configuration.integration_s",
            unit: "s",
            provenance: Input,
            definition: "detector integration time over which photons are accumulated (default 1 \
                         s)",
        },
        FieldUnit {
            path: "optical_link.divergence_rad",
            unit: "rad",
            provenance: ClosedForm,
            definition: "diffraction divergence half-angle lambda/D of the transmit aperture",
        },
        FieldUnit {
            path: "optical_link.footprint_m",
            unit: "m",
            provenance: ClosedForm,
            definition: "far-field beam footprint diameter (lambda/D)*range",
        },
        FieldUnit {
            path: "optical_link.geometric_loss_db",
            unit: "dB",
            provenance: ClosedForm,
            definition: "far-field geometric capture loss -10*log10(min((D_rx/d_beam)^2, 1)), one \
                         way",
        },
        FieldUnit {
            path: "optical_link.total_loss_db",
            unit: "dB",
            provenance: Computed,
            definition: "one-way total loss: the geometric capture loss plus the atmospheric and \
                         pointing allocations",
        },
        FieldUnit {
            path: "optical_link.detected_photons",
            unit: "count",
            provenance: Computed,
            definition: "expected photon count over the integration time: the one-way \
                         photon_rate_hz reduced by the two-way return-path geometric loss, times \
                         integration_s; an expectation, so not an integer",
        },
        FieldUnit {
            path: "optical_availability.n_sites",
            unit: "count",
            provenance: Input,
            definition: "number of optical ground sites used: the scenario's n_optical_sites \
                         clamped to the bundled network (default 5)",
        },
        FieldUnit {
            path: "optical_availability.correlation",
            unit: "1",
            provenance: Input,
            definition: "spatial correlation rho in [0,1] of the site outages, used for the \
                         correlated union (default 0.15)",
        },
        FieldUnit {
            path: "optical_availability.per_site[].clear_sky_prob",
            unit: "1",
            provenance: Published,
            definition: "published satellite-derived fraction of clear nights at this site, read \
                         from the bundled climatology table (Cavazzani et al. 2011, MNRAS, GOES12 \
                         2007-2008 analysis)",
        },
        FieldUnit {
            path: "optical_availability.per_site[].pointing_acquisition_factor",
            unit: "1",
            provenance: ModelledInput,
            definition: "fraction of clear-sky time the optical terminal points and acquires the \
                         link: a modelled terminal allocation (0.90), kept separate from the \
                         published clear-sky column",
        },
        FieldUnit {
            path: "optical_availability.per_site[].availability",
            unit: "1",
            provenance: Computed,
            definition: "single-site availability, clear_sky_prob * pointing_acquisition_factor \
                         clamped to [0,1]",
        },
        FieldUnit {
            path: "optical_availability.diversity_curve[].n_sites",
            unit: "count",
            provenance: Computed,
            definition: "number of sites in this prefix of the network",
        },
        FieldUnit {
            path: "optical_availability.diversity_curve[].independent",
            unit: "1",
            provenance: Modelled,
            definition: "independent-union availability of that prefix, 1 - prod_i (1 - a_i)",
        },
        FieldUnit {
            path: "optical_availability.diversity_curve[].correlated",
            unit: "1",
            provenance: Modelled,
            definition: "spatially-correlated-union availability of that prefix, 1 - gbar^N_eff \
                         with N_eff = 1 + (n-1)(1-rho)",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].position_variance_after_handoff_m2",
            unit: "m^2",
            provenance: Computed,
            definition: "sum of the three position-axis variances immediately after the handover \
                         covariance inflation",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].clock_variance_after_handoff_s2",
            unit: "s^2",
            provenance: Computed,
            definition: "clock-axis variance immediately after the handover covariance inflation",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].total_variance_after_handoff",
            unit: "m^2",
            provenance: Computed,
            definition: "the whole 4-state diagonal trace immediately after the handover (three \
                         position axes in m^2 plus the clock axis in s^2), carried so it can be \
                         reconciled against handoff.variance_after_handoff",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].sigma_h_at_handover_m",
            unit: "m",
            provenance: Computed,
            definition: "horizontal 1 sigma sqrt(P_east + P_north) at the handover instant",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].sigma_v_at_handover_m",
            unit: "m",
            provenance: Computed,
            definition: "vertical 1 sigma at the handover instant",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].sigma_t_at_handover_s",
            unit: "s",
            provenance: Computed,
            definition: "clock 1 sigma at the handover instant",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].bound_h_at_handover_m",
            unit: "m",
            provenance: Computed,
            definition: "k*sigma_h at the handover instant, the quantity compared against \
                         alert_limit_h_m",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].bound_v_at_handover_m",
            unit: "m",
            provenance: Computed,
            definition: "k*sigma_v at the handover instant, compared against alert_limit_v_m",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].bound_t_at_handover_s",
            unit: "s",
            provenance: Computed,
            definition: "k*sigma_t at the handover instant, compared against alert_limit_t_s",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].time_to_alert_limit_h_s",
            unit: "s",
            provenance: Computed,
            definition: "time after the handover at which k*sigma_h(t) first reaches \
                         alert_limit_h_m; null means it never does",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].time_to_alert_limit_v_s",
            unit: "s",
            provenance: Computed,
            definition: "time after the handover at which k*sigma_v(t) first reaches \
                         alert_limit_v_m; null means it never does",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].time_to_alert_limit_t_s",
            unit: "s",
            provenance: Computed,
            definition: "time after the handover at which k*sigma_t(t) first reaches \
                         alert_limit_t_s; null means it never does",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].time_inside_alert_limits_s",
            unit: "s",
            provenance: Computed,
            definition: "how long this direction's coasting solution stays inside every alert \
                         limit, the earliest of the three crossing times; null when no limit is \
                         ever reached",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].horizontal_variance_doubling_time_s",
            unit: "s",
            provenance: Computed,
            definition: "P_h(0)/(2*q_pos), the time for the coasting horizontal variance to \
                         double; the horizontal axis sums two independent random walks, hence \
                         2*q_pos",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].vertical_variance_doubling_time_s",
            unit: "s",
            provenance: Computed,
            definition: "P_v(0)/q_pos, the time for the coasting vertical variance to double",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].clock_variance_doubling_time_s",
            unit: "s",
            provenance: Computed,
            definition: "P_t(0)/q_clock, the time for the coasting clock variance to double",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].profile[].t_s",
            unit: "s",
            provenance: Computed,
            definition: "time since the handover at this profile sample",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].profile[].sigma_h_m",
            unit: "m",
            provenance: Computed,
            definition: "horizontal 1 sigma sqrt(P_east(t) + P_north(t)) at this coast time",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].profile[].bound_h_m",
            unit: "m",
            provenance: Computed,
            definition: "k*sigma_h at this coast time",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].profile[].sigma_v_m",
            unit: "m",
            provenance: Computed,
            definition: "vertical 1 sigma at this coast time",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].profile[].bound_v_m",
            unit: "m",
            provenance: Computed,
            definition: "k*sigma_v at this coast time",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].profile[].sigma_t_s",
            unit: "s",
            provenance: Computed,
            definition: "clock 1 sigma at this coast time",
        },
        FieldUnit {
            path: "post_handover_coast.directions[].profile[].bound_t_s",
            unit: "s",
            provenance: Computed,
            definition: "k*sigma_t at this coast time",
        },
        // ----- G16: the RF link leg -----
        FieldUnit {
            path: "rf_link_configuration.carrier_hz",
            unit: "Hz",
            provenance: Spec,
            definition: "the downlink band centre the free-space loss was evaluated at, \
                         selected by rf_band from the CCSDS-401 / DSN-810-005 deep-space \
                         allocations (S 2.295 GHz, X 8.420 GHz, Ka 32.0 GHz)",
        },
        FieldUnit {
            path: "rf_link_configuration.eirp_dbw",
            unit: "dBW",
            provenance: ModelledInput,
            definition: "RF transmit effective isotropic radiated power (default 26 dBW, the \
                         lunar augmented-forward-signal EIRP this crate's lunar RF work \
                         already uses): a representative terminal allocation, not a datasheet",
        },
        FieldUnit {
            path: "rf_link_configuration.g_over_t_db",
            unit: "dB/K",
            provenance: ModelledInput,
            definition: "RF receive figure of merit G/T (default 53 dB/K, the DSN 34 m \
                         beam-waveguide X-band figure the link-budget kind defaults to): a \
                         representative station allocation",
        },
        FieldUnit {
            path: "rf_link_configuration.other_losses_db",
            unit: "dB",
            provenance: ModelledInput,
            definition: "lumped pointing / polarisation / atmosphere / implementation loss on \
                         the RF leg (default 3 dB): a modelled budget line, not a measurement",
        },
        FieldUnit {
            path: "rf_link_configuration.data_rate_bps",
            unit: "bit/s",
            provenance: Input,
            definition: "RF information bit rate the Eb/N0 is formed at (default 1e6); it \
                         moves Eb/N0 and the closure margin, and does not touch C/N0 or the \
                         ranging leg",
        },
        FieldUnit {
            path: "rf_link_configuration.required_eb_n0_db",
            unit: "dB",
            provenance: Input,
            definition: "the Eb/N0 the RF margin is taken over (default 4.5 dB)",
        },
        FieldUnit {
            path: "rf_link_configuration.range_km",
            unit: "km",
            provenance: Input,
            definition: "the one-way range the RF budget was evaluated at: the scenario's own \
                         range_km, so the RF leg cannot sit at a different range from the \
                         optical one",
        },
        FieldUnit {
            path: "rf_link_configuration.chip_rate_hz",
            unit: "chip/s",
            provenance: Input,
            definition: "spreading-code chip rate the code jitter is converted to metres \
                         through (default 1.023e6, the GPS C/A reference rate this crate \
                         already carries as jamming::CA_CHIP_RATE_HZ)",
        },
        FieldUnit {
            path: "rf_link_configuration.correlator_spacing_chips",
            unit: "chip",
            provenance: Input,
            definition: "early-late correlator spacing d (default 0.5, the half-chip \
                         correlator the DLL thermal bound is conventionally quoted at)",
        },
        FieldUnit {
            path: "rf_link_configuration.dll_bandwidth_hz",
            unit: "Hz",
            provenance: Computed,
            definition: "DLL single-sided loop noise bandwidth. Derived as 1/(2*integration_s) \
                         so the RF leg's equivalent averaging time is exactly the optical \
                         leg's accumulation time, unless the caller supplies \
                         rf_dll_bandwidth_hz - dll_bandwidth_source says which, and an \
                         override that breaks the match makes the ranging ratio refuse",
        },
        FieldUnit {
            path: "rf_link_configuration.predetection_integration_s",
            unit: "s",
            provenance: Input,
            definition: "coherent predetection integration time in the DLL squaring-loss term: \
                         the scenario's own integration_s, the same accumulation time the \
                         optical photon count uses",
        },
        FieldUnit {
            path: "rf_link_configuration.tracking_threshold_dbhz",
            unit: "dB-Hz",
            provenance: ModelledInput,
            definition: "C/N0 below which the tracking loop is taken to have lost lock \
                         (default 25 dB-Hz, jamming::DEFAULT_TRACKING_THRESHOLD_DBHZ): a \
                         modelled receiver allocation",
        },
        FieldUnit {
            path: "rf_link_configuration.degraded_margin_db",
            unit: "dB",
            provenance: ModelledInput,
            definition: "extra margin above the tracking threshold below which the loop is \
                         reported DEGRADED rather than LOCKED (default 6 dB, \
                         jamming::DEFAULT_DEGRADED_MARGIN_DB)",
        },
        // ----- G16: RF link availability -----
        FieldUnit {
            path: "rf_availability.fsl_db",
            unit: "dB",
            provenance: ClosedForm,
            definition: "free-space path loss 20*log10(4*pi*R*f/c) on the one-way RF leg at \
                         rf_link_configuration.carrier_hz and the scenario's range_km",
        },
        FieldUnit {
            path: "rf_availability.cn0_dbhz",
            unit: "dB-Hz",
            provenance: Computed,
            definition: "carrier-to-noise density EIRP - FSL - other losses + G/T - k on the \
                         one-way RF leg; the single C/N0 BOTH the tracking indicator and the \
                         ranging comparison's RF leg are evaluated at",
        },
        FieldUnit {
            path: "rf_availability.eb_n0_db",
            unit: "dB",
            provenance: Computed,
            definition: "energy-per-bit to noise density, C/N0 - 10*log10(data_rate_bps)",
        },
        FieldUnit {
            path: "rf_availability.link_margin_db",
            unit: "dB",
            provenance: Computed,
            definition: "Eb/N0 - required_eb_n0_db; the link closes when this is >= 0, which \
                         is the I_closure factor of the availability rule",
        },
        FieldUnit {
            path: "rf_availability.cn0_margin_db",
            unit: "dB",
            provenance: Computed,
            definition: "C/N0 - tracking_threshold_dbhz; the loop holds lock when this is >= 0, \
                         which is the I_track factor of the availability rule",
        },
        FieldUnit {
            path: "rf_availability.closure_indicator",
            unit: "1",
            provenance: Computed,
            definition: "I_closure: 1 when the Eb/N0 margin is non-negative, 0 otherwise. An \
                         indicator, not a probability",
        },
        FieldUnit {
            path: "rf_availability.tracking_indicator",
            unit: "1",
            provenance: Computed,
            definition: "I_track: 1 when jamming::lock_status on this C/N0 is LOCKED or \
                         DEGRADED, 0 when it is LOST. An indicator, not a probability",
        },
        FieldUnit {
            path: "rf_availability.availability",
            unit: "1",
            provenance: Computed,
            definition: "THE RF AVAILABILITY FIGURE: A_rf = I_closure * I_track, so it takes \
                         only the values 0 and 1. It is margin- and tracking-limited and \
                         DETERMINISTIC, unlike the weather-limited probability in \
                         optical_availability - see rf_availability.differs_from_optical \
                         before quoting the two together",
        },
        FieldUnit {
            path: "rf_availability.closure_range_km",
            unit: "km",
            provenance: ClosedForm,
            definition: "range_km * 10^(link_margin_db/20): the range at which the Eb/N0 margin \
                         reaches zero. Exact, because the free-space loss is the only \
                         range-dependent term in the link equation",
        },
        FieldUnit {
            path: "rf_availability.tracking_range_km",
            unit: "km",
            provenance: ClosedForm,
            definition: "range_km * 10^(cn0_margin_db/20): the range at which C/N0 reaches the \
                         tracking threshold, by the same exact inversion",
        },
        FieldUnit {
            path: "rf_availability.max_range_km",
            unit: "km",
            provenance: Computed,
            definition: "the smaller of closure_range_km and tracking_range_km - the range \
                         beyond which A_rf becomes 0; binding_constraint names which one it is",
        },
        FieldUnit {
            path: "rf_availability.range_utilisation",
            unit: "1",
            provenance: Computed,
            definition: "range_km / max_range_km: below 1 the link is inside both constraints, \
                         and the reciprocal is how much further it would still reach. The \
                         continuous figure to quote beside the 0/1 availability",
        },
        FieldUnit {
            path: "rf_availability.factors[].value",
            unit: "1",
            provenance: Computed,
            definition: "the value of this factor of the A_rf product - 0 or 1; the row's own \
                         `source`, `provenance` and `condition` fields carry where it came from",
        },
        FieldUnit {
            path: "rf_availability.precision_grade_with_rf_availability",
            unit: "1",
            provenance: Computed,
            definition: "A*[optical meets grade] + (1-A)*A_rf*[RF meets grade]: the \
                         precision-grade factor with the RF fallback's own availability \
                         applied. The released joint_fom.precision_grade assumes the RF \
                         fallback is always there (A_rf = 1) and is NOT changed by this \
                         figure; the two agree exactly whenever A_rf = 1",
        },
        // ----- G16: the like-for-like ranging comparison -----
        FieldUnit {
            path: "ranging_comparison.common_configuration.range_km",
            unit: "km",
            provenance: Input,
            definition: "the one-way range BOTH legs were evaluated at - the scenario's own \
                         range_km",
        },
        FieldUnit {
            path: "ranging_comparison.common_configuration.accumulation_time_s",
            unit: "s",
            provenance: Input,
            definition: "the accumulation time both legs must average over - the scenario's own \
                         integration_s",
        },
        FieldUnit {
            path: "ranging_comparison.common_configuration.optical_accumulation_s",
            unit: "s",
            provenance: Input,
            definition: "the optical leg's photon accumulation time; equal to \
                         accumulation_time_s by construction",
        },
        FieldUnit {
            path: "ranging_comparison.common_configuration.rf_equivalent_averaging_s",
            unit: "s",
            provenance: ClosedForm,
            definition: "1/(2*B_L), the equivalent averaging time of a single-sided loop noise \
                         bandwidth. The ratio is quoted only when this equals \
                         optical_accumulation_s, and refused otherwise",
        },
        FieldUnit {
            path: "ranging_comparison.optical_leg.sigma_range_m",
            unit: "m",
            provenance: ClosedForm,
            definition: "the optical leg of the ratio: 1 sigma ONE-WAY ranging precision \
                         c*pulse_rms/sqrt(N_one_way), the photon-limited CRLB at the common \
                         configuration. NOT optical_link.optical_ranging_sigma_m, which is the \
                         two-way headline - two_way_penalty_factor is the exact bridge",
        },
        FieldUnit {
            path: "ranging_comparison.optical_leg.sigma_time_s",
            unit: "s",
            provenance: ClosedForm,
            definition: "the same bound as a time of arrival, pulse_rms/sqrt(N_one_way); \
                         sigma_range_m = c * sigma_time_s exactly",
        },
        FieldUnit {
            path: "ranging_comparison.optical_leg.detected_photons_one_way",
            unit: "count",
            provenance: Computed,
            definition: "photon_rate_hz * integration_s: the ONE-WAY detected photon count, \
                         without the two-way return-path geometric loss that \
                         optical_link.detected_photons carries. An expectation, so not an \
                         integer",
        },
        FieldUnit {
            path: "ranging_comparison.optical_leg.pulse_rms_s",
            unit: "s",
            provenance: Input,
            definition: "RMS signal-pulse width, the scenario's pulse_rms_ps in seconds",
        },
        FieldUnit {
            path: "ranging_comparison.rf_leg.sigma_range_m",
            unit: "m",
            provenance: Computed,
            definition: "the RF leg of the ratio: 1 sigma ONE-WAY ranging precision from the \
                         DLL early-late thermal code-tracking jitter at the same range and the \
                         same averaging time. Thermal noise only - no media delay, clock or \
                         ambiguity error - exactly as the optical leg excludes its own \
                         systematics",
        },
        FieldUnit {
            path: "ranging_comparison.rf_leg.sigma_time_s",
            unit: "s",
            provenance: Computed,
            definition: "the same bound as a code-phase time error, code_jitter_chips / \
                         chip_rate_hz; sigma_range_m = c * sigma_time_s exactly",
        },
        FieldUnit {
            path: "ranging_comparison.rf_leg.cn0_dbhz",
            unit: "dB-Hz",
            provenance: Computed,
            definition: "the C/N0 the jitter was evaluated at - the same value \
                         rf_availability.cn0_dbhz reports, from the same single link budget, \
                         not a re-derivation",
        },
        FieldUnit {
            path: "ranging_comparison.rf_leg.code_jitter_chips",
            unit: "chip",
            provenance: ClosedForm,
            definition: "DLL coherent early-late thermal jitter sqrt((B_L*d/(2c))*(1 + \
                         2/((2-d)*T*c))) with c the linear C/N0 (Kaplan & Hegarty eq. 8.90, \
                         navsignal::dll_code_jitter_chips)",
        },
        FieldUnit {
            path: "ranging_comparison.rf_leg.chip_rate_hz",
            unit: "chip/s",
            provenance: Input,
            definition: "the chip rate the jitter was converted to metres through; the same \
                         value rf_link_configuration.chip_rate_hz reports",
        },
        FieldUnit {
            path: "ranging_comparison.rf_leg.dll_bandwidth_hz",
            unit: "Hz",
            provenance: Computed,
            definition: "the loop noise bandwidth used; the same value \
                         rf_link_configuration.dll_bandwidth_hz reports",
        },
        FieldUnit {
            path: "ranging_comparison.optical_over_rf",
            unit: "1",
            provenance: Computed,
            definition: "THE LIKE-FOR-LIKE RATIO: optical_leg.sigma_range_m / \
                         rf_leg.sigma_range_m, both at the one common configuration emitted in \
                         this same object. Below 1 means optical is the tighter modality. null \
                         when the comparison is refused - read refusal_reason",
        },
        FieldUnit {
            path: "ranging_comparison.rf_over_optical",
            unit: "1",
            provenance: Computed,
            definition: "the reciprocal: the factor by which the optical leg beats the RF leg \
                         at this configuration. null when the comparison is refused",
        },
        FieldUnit {
            path: "ranging_comparison.optical_advantage_db",
            unit: "dB",
            provenance: Computed,
            definition: "the same ratio in decibels, 20*log10(sigma_rf/sigma_optical); positive \
                         means optical is tighter. null when the comparison is refused",
        },
        FieldUnit {
            path: "ranging_comparison.released_two_way_optical_sigma_m",
            unit: "m",
            provenance: Computed,
            definition: "the released headline optical_link.optical_ranging_sigma_m, carried \
                         here so the one-way comparison leg reconciles with it exactly rather \
                         than looking like a second, disagreeing optical number",
        },
        FieldUnit {
            path: "ranging_comparison.two_way_penalty_factor",
            unit: "1",
            provenance: Computed,
            definition: "released_two_way_optical_sigma_m / optical_leg.sigma_range_m: exactly \
                         1 when the scenario runs one-way, and the full two-way penalty (the \
                         0.5 range-from-round-trip factor over the square root of the \
                         return-path geometric loss) otherwise",
        },
        FieldUnit {
            path: "ranging_comparison.released_rf_position_sigma_m",
            unit: "m",
            provenance: Input,
            definition: "the scenario's CHOSEN RF 1 sigma input \
                         optical_link.rf_position_sigma_m, carried only so the refusal beside \
                         it can name the number it declines to divide by - see \
                         ratio_against_chosen_rf_sigma_refused",
        },
    ]
};

/// The `hybrid-optical-rf` scenario: every field is optional, so a bare `kind =
/// "hybrid-optical-rf"` runs the representative P5 analysis.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct HybridOpticalRfScenario {
    /// Optical carrier wavelength (nm). Default 1550.
    pub wavelength_nm: Option<f64>,
    /// Optical transmit power (W). Default 1e-3.
    pub tx_power_w: Option<f64>,
    /// Transmit aperture diameter (m). Default 0.85 (≈ 0.7 km footprint at lunar range).
    pub tx_aperture_m: Option<f64>,
    /// Receive aperture diameter (m). Default 0.85.
    pub rx_aperture_m: Option<f64>,
    /// One-way link range (km). Default 384000 (Earth–Moon).
    pub range_km: Option<f64>,
    /// Signal-pulse RMS width (ps). Default 50.
    pub pulse_rms_ps: Option<f64>,
    /// Detector integration time (s). Default 1.0.
    pub integration_s: Option<f64>,
    /// One-way atmospheric loss (dB). Default 3.0 (Modelled).
    pub atmospheric_loss_db: Option<f64>,
    /// Pointing / jitter loss (dB). Default 3.0 (Modelled).
    pub pointing_loss_db: Option<f64>,
    /// Optics throughput (0..1). Default 0.5.
    pub optics_efficiency: Option<f64>,
    /// Detector quantum efficiency (0..1). Default 0.7.
    pub detector_efficiency: Option<f64>,
    /// Two-way (round-trip) ranging. Default true.
    pub two_way: Option<bool>,
    /// RF horizontal-position 1σ (m). Default 1.0 (loose).
    pub rf_pos_sigma_m: Option<f64>,
    /// RF vertical-position 1σ (m). Default 1.5× the horizontal.
    pub rf_vertical_sigma_m: Option<f64>,
    /// RF clock 1σ (s). Default 3e-9 (3 ns).
    pub rf_clock_sigma_s: Option<f64>,
    /// Cross-modality false-alarm probability. Default 1e-5.
    pub p_fa: Option<f64>,
    /// Cross-modality missed-detection probability. Default 1e-3.
    pub p_md: Option<f64>,
    /// Horizontal alert limit (m). Default 10.0.
    pub alert_limit_h_m: Option<f64>,
    /// Vertical alert limit (m). Default 15.0.
    pub alert_limit_v_m: Option<f64>,
    /// Timing alert limit (s). Default 20e-9 (20 ns).
    pub alert_limit_t_s: Option<f64>,
    /// Precision-grade position spec (m). Default 0.1 (10 cm).
    pub grade_pos_m: Option<f64>,
    /// Precision-grade timing spec (s). Default 1e-9 (1 ns).
    pub grade_time_s: Option<f64>,
    /// Number of optical ground sites (≤ the bundled network). Default 5.
    pub n_optical_sites: Option<usize>,
    /// Spatial correlation of the optical sites. Default 0.15.
    pub site_correlation: Option<f64>,
    /// Correlation of the joint-FoM factors. Default 0.5.
    pub fom_correlation: Option<f64>,
    /// Modality-transition covariance inflation at the handoff. Default 0.2.
    pub handoff_inflation: Option<f64>,
    /// Integrity-risk budget `P_HMI`. Default 1e-7.
    pub p_hmi: Option<f64>,
    // --- G15 fault injection ---
    /// Bias-fault ramp rate on the position axes (m/s), for the ramp treatment.
    /// Default 0.05 (Modelled representative input).
    pub fault_ramp_rate_pos_m_s: Option<f64>,
    /// Bias-fault ramp rate on the clock axis (s/s — a fractional frequency offset
    /// expressed as clock-error growth). Default 1e-11 (Modelled).
    pub fault_ramp_rate_clock_s_s: Option<f64>,
    // --- G17 post-handover coast ---
    /// Position-axis process-noise PSD for the post-handover coast (m^2/s). Default
    /// 1e-3 — i.e. 1 m (1σ) of unmodelled position growth per 1000 s of coast per axis
    /// (Modelled representative input).
    pub process_noise_pos_psd_m2_s: Option<f64>,
    /// Clock-axis process-noise PSD for the post-handover coast (s^2/s). Default 1e-22
    /// — white-FM phase random walk `q = τ·σ_y(τ)²` at `σ_y(1 s) = 1e-11`, a
    /// representative space USO (Modelled).
    pub process_noise_clock_psd_s2_s: Option<f64>,
    /// Coverage factor `k` applied to the coasting 1σ before the alert-limit comparison.
    /// Default `Φ⁻¹(1 − P_HMI/2)` — the two-sided normal coverage at the integrity-risk
    /// budget, so the coast bound is stated at the same risk as the rest of the report.
    pub coast_coverage_k: Option<f64>,
    // --- G16 RF link leg: availability, and the like-for-like ranging comparison ---
    /// RF carrier band, `s` / `x` / `ka`. Default `x` — the deep-space workhorse and the
    /// `link-budget` kind's own default band.
    pub rf_band: Option<String>,
    /// RF transmit EIRP (dBW). Default 26.0 — the lunar augmented-forward-signal EIRP
    /// the crate's lunar RF work already uses (`lunar-jamming` / `lunar-attack-surface`,
    /// P1). A representative terminal allocation, not a datasheet (Modelled).
    pub rf_eirp_dbw: Option<f64>,
    /// RF receive figure of merit `G/T` (dB/K). Default 53.0 — the DSN 34 m
    /// beam-waveguide station X-band figure of merit the `link-budget` kind defaults to
    /// (DSN 810-005 module 101/104). Modelled.
    pub rf_g_over_t_db: Option<f64>,
    /// Lumped non-free-space RF loss (dB). Default 3.0, the `link-budget` kind's default.
    pub rf_other_losses_db: Option<f64>,
    /// RF information bit rate (bit/s) the `Eb/N0` is formed at. Default 1e6.
    pub rf_data_rate_bps: Option<f64>,
    /// Required `Eb/N0` (dB) the RF margin is taken over. Default 4.5.
    pub rf_required_eb_n0_db: Option<f64>,
    /// Spreading-code chip rate (chip/s). Default `jamming::CA_CHIP_RATE_HZ` (1.023e6).
    pub rf_chip_rate_hz: Option<f64>,
    /// Early-late correlator spacing (chip). Default 0.5, the standard half-chip
    /// correlator the DLL bound is quoted at.
    pub rf_correlator_spacing_chips: Option<f64>,
    /// DLL single-sided loop noise bandwidth (Hz). Default `1/(2·integration_s)`, the
    /// bandwidth whose equivalent averaging time is exactly the optical leg's
    /// accumulation time. **Overriding this breaks the common configuration and the
    /// ranging ratio is then refused rather than quoted.**
    pub rf_dll_bandwidth_hz: Option<f64>,
    /// Tracking-loop loss-of-lock threshold (dB-Hz). Default
    /// `jamming::DEFAULT_TRACKING_THRESHOLD_DBHZ` (25.0).
    pub rf_tracking_threshold_dbhz: Option<f64>,
    /// Extra margin (dB) above the threshold below which the loop is `DEGRADED` rather
    /// than `LOCKED`. Default `jamming::DEFAULT_DEGRADED_MARGIN_DB` (6.0).
    pub rf_degraded_margin_db: Option<f64>,
}

/// Everything the analysis produces, computed once and reused by the emitters.
struct Computed {
    optical: OpticalLinkResult,
    /// The link parameters as RESOLVED (defaults applied). Retained so the report can
    /// state the configuration it was run at rather than leaving a reader to find the
    /// defaults in the source -- G16.
    link_params: OpticalLinkParams,
    /// Resolved integration time (s), for the same reason. The pulse width is echoed
    /// straight from the scenario input, so it is not carried here.
    integration_s: f64,
    detected_photons: f64,
    opt_pos_sigma_m: f64,
    opt_clock_sigma_s: f64,
    rf_pos_sigma_m: f64,
    rf_clock_sigma_s: f64,
    two_way: bool,
    cross: CrossRaimResult,
    protected: bool,
    availability: OpticalAvailabilityResult,
    handoff: HandoffOutcome,
    handoff_reverse: HandoffOutcome,
    fom: JointPntFoM,
    alert_h: f64,
    alert_v: f64,
    alert_t: f64,
    /// G15 - fault injection / detection power for the cross-modality monitor.
    fault_study: CrossMonitorFaultStudy,
    /// G17 - post-handover covariance re-growth against the alert limits.
    coast: CoastStudy,
    /// G16 - the resolved RF link leg, echoed like `link_configuration`.
    rf_config: RfLinkConfiguration,
    /// G16 - margin/tracking-limited RF link availability.
    rf_availability: RfAvailability,
    /// G16 - the like-for-like optical-versus-RF ranging comparison.
    ranging: RangingComparison,
}

impl HybridOpticalRfScenario {
    fn compute(&self) -> Result<Computed, String> {
        let wavelength_m = self.wavelength_nm.unwrap_or(1550.0) * 1e-9;
        let range_m = self.range_km.unwrap_or(384_000.0) * 1000.0;
        let integration_s = self.integration_s.unwrap_or(1.0);
        let pulse_rms_s = self.pulse_rms_ps.unwrap_or(50.0) * 1e-12;
        let two_way = self.two_way.unwrap_or(true);
        for (name, v) in [
            ("wavelength_nm", wavelength_m),
            ("range_km", range_m),
            ("integration_s", integration_s),
            ("pulse_rms_ps", pulse_rms_s),
        ] {
            if !v.is_finite() || v <= 0.0 {
                return Err(format!("{name} must be finite and positive"));
            }
        }

        let params = OpticalLinkParams {
            wavelength_m,
            tx_power_w: self.tx_power_w.unwrap_or(1.0e-3),
            tx_aperture_m: self.tx_aperture_m.unwrap_or(0.85),
            rx_aperture_m: self.rx_aperture_m.unwrap_or(0.85),
            range_m,
            optics_efficiency: self.optics_efficiency.unwrap_or(0.5),
            detector_efficiency: self.detector_efficiency.unwrap_or(0.7),
            atmospheric_loss_db: self.atmospheric_loss_db.unwrap_or(3.0),
            pointing_loss_db: self.pointing_loss_db.unwrap_or(3.0),
        };
        let optical = optical_link_budget(&params);
        let link_params = params;
        // A two-way ranging return path spreads the beam again (double-pass geometric loss).
        let return_factor = if two_way {
            10f64.powf(-optical.geometric_loss_db / 10.0)
        } else {
            1.0
        };
        let effective_rate = optical.photon_rate_hz * return_factor;
        let detected = detected_photons(effective_rate, integration_s);
        let opt_clock_sigma_s = photon_limited_toa_crlb_s(pulse_rms_s, detected);
        let opt_pos_sigma_m = photon_limited_range_crlb_m(pulse_rms_s, detected, two_way);
        // A finite, photon-starved link is required for a usable optical solution.
        if !opt_pos_sigma_m.is_finite() || !opt_clock_sigma_s.is_finite() {
            return Err(
                "optical link delivered no photons (infinite ranging CRLB); raise power / \
                 aperture / integration time"
                    .to_string(),
            );
        }

        let rf_pos_sigma_m = self.rf_pos_sigma_m.unwrap_or(1.0);
        let rf_vertical_sigma_m = self.rf_vertical_sigma_m.unwrap_or(rf_pos_sigma_m * 1.5);
        let rf_clock_sigma_s = self.rf_clock_sigma_s.unwrap_or(3.0e-9);
        let p_fa = self.p_fa.unwrap_or(1e-5);
        let p_md = self.p_md.unwrap_or(1e-3);

        // L22 — cross-modality RAIM over four nominal (fault-free) axes with disparate σ.
        let axis = |name: &str, role, rf_s, opt_s| CrossAxis {
            name: name.to_string(),
            role,
            rf_value: 0.0,
            rf_sigma: rf_s,
            opt_value: 0.0,
            opt_sigma: opt_s,
        };
        let axes = vec![
            axis(
                "east",
                AxisRole::Horizontal,
                rf_pos_sigma_m,
                opt_pos_sigma_m,
            ),
            axis(
                "north",
                AxisRole::Horizontal,
                rf_pos_sigma_m,
                opt_pos_sigma_m,
            ),
            axis(
                "up",
                AxisRole::Vertical,
                rf_vertical_sigma_m,
                opt_pos_sigma_m,
            ),
            axis(
                "clock",
                AxisRole::Timing,
                rf_clock_sigma_s,
                opt_clock_sigma_s,
            ),
        ];
        let cross = run_cross_raim(&axes, p_fa, p_md);

        let alert_h = self.alert_limit_h_m.unwrap_or(10.0);
        let alert_v = self.alert_limit_v_m.unwrap_or(15.0);
        let alert_t = self.alert_limit_t_s.unwrap_or(20.0e-9);
        let protected = cross.hpl_m <= alert_h && cross.vpl_m <= alert_v && cross.tpl_s <= alert_t;
        let p_hmi = self.p_hmi.unwrap_or(1e-7);
        let integrity_assured = if protected { 1.0 - p_hmi } else { 0.0 };

        // L24 — optical network availability.
        let network = default_network();
        let n = self
            .n_optical_sites
            .unwrap_or(network.len())
            .clamp(1, network.len());
        let site_correlation = self.site_correlation.unwrap_or(0.15);
        let availability = run_optical_availability(&network[..n], site_correlation);
        let a = availability.correlated_union;

        // Precision-grade probability: optical (tight) when the link is up, RF (loose) on
        // fallback. P = A·[optical meets grade] + (1−A)·[RF meets grade].
        let grade_pos = self.grade_pos_m.unwrap_or(0.1);
        let grade_time = self.grade_time_s.unwrap_or(1.0e-9);
        let opt_meets = opt_pos_sigma_m <= grade_pos && opt_clock_sigma_s <= grade_time;
        let rf_meets = rf_pos_sigma_m <= grade_pos && rf_clock_sigma_s <= grade_time;
        let precision = a * indicator(opt_meets) + (1.0 - a) * indicator(rf_meets);

        // L25 — the joint FoM.
        let fom = joint_fom(
            a,
            precision,
            integrity_assured,
            self.fom_correlation.unwrap_or(0.5),
        );

        // L23 — optical→RF handoff consistency probe (deterministic 1σ draw).
        let truth = vec![0.0_f64; 4];
        let p0 = vec![
            rf_pos_sigma_m.powi(2),
            rf_pos_sigma_m.powi(2),
            rf_vertical_sigma_m.powi(2),
            rf_clock_sigma_s.powi(2),
        ];
        let x0: Vec<f64> = p0.iter().map(|&p| p.sqrt()).collect(); // 1σ prior error
        let opt_r = [
            opt_pos_sigma_m.powi(2),
            opt_pos_sigma_m.powi(2),
            opt_pos_sigma_m.powi(2),
            opt_clock_sigma_s.powi(2),
        ];
        let optical_updates: Vec<(usize, f64, f64)> = (0..4)
            .map(|i| (i, truth[i] + opt_r[i].sqrt(), opt_r[i]))
            .collect();
        let rf_updates: Vec<(usize, f64, f64)> = (0..4)
            .map(|i| (i, truth[i] + p0[i].sqrt(), p0[i]))
            .collect();
        let inflation = self.handoff_inflation.unwrap_or(0.2);
        // G17 - the post-handover covariance DIAGONAL. `HandoffOutcome` reports only the
        // scalar trace, so each handover is replayed here from the same inputs to recover
        // the per-axis variances the coast propagates. A test pins the replayed trace to
        // the trace the handoff block reports, so the replay cannot silently drift.
        let post_handoff_diag = |updates: &[(usize, f64, f64)]| -> Vec<f64> {
            let mut st = HandoffState::new(x0.clone(), p0.clone());
            st.apply_updates(updates);
            st.handoff(inflation).p_diag
        };
        let coast_diag_fwd = post_handoff_diag(&optical_updates);
        let coast_diag_rev = post_handoff_diag(&rf_updates);
        let handoff = optical_rf_handoff(
            HandoffState::new(x0.clone(), p0.clone()),
            &truth,
            &optical_updates,
            &rf_updates,
            inflation,
        );
        // The reverse ("and back") RF→optical direction: loose RF first, then hand off, then
        // the tight optical update. The no-jump mean-continuity guarantee holds in either
        // direction; the reverse pass tightens (optical deflates) instead of loosening.
        let handoff_reverse = rf_optical_handoff(
            HandoffState::new(x0, p0),
            &truth,
            &rf_updates,
            &optical_updates,
            inflation,
        );

        // G15 - bias / ramp fault injection against the cross-modality monitor.
        let fault_study = build_fault_study(
            &axes,
            &cross,
            &FaultInputs {
                p_fa,
                p_md,
                alert_h,
                alert_v,
                alert_t,
                ramp_pos: self.fault_ramp_rate_pos_m_s.unwrap_or(0.05),
                ramp_clk: self.fault_ramp_rate_clock_s_s.unwrap_or(1.0e-11),
            },
        );

        // G17 - process-noise model and the post-handover coast.
        let q_pos = self.process_noise_pos_psd_m2_s.unwrap_or(1.0e-3);
        let q_pos = if q_pos.is_finite() && q_pos >= 0.0 {
            q_pos
        } else {
            0.0
        };
        let q_clk = self.process_noise_clock_psd_s2_s.unwrap_or(1.0e-22);
        let q_clk = if q_clk.is_finite() && q_clk >= 0.0 {
            q_clk
        } else {
            0.0
        };
        let default_k = {
            let k = normal_quantile(1.0 - p_hmi.clamp(1e-12, 0.5) / 2.0);
            if k.is_finite() && k > 0.0 {
                k
            } else {
                1.0
            }
        };
        let (coverage_k, coverage_k_source) = match self.coast_coverage_k {
            Some(k) if k.is_finite() && k > 0.0 => (k, "caller-supplied coast_coverage_k"),
            _ => (
                default_k,
                "Phi^-1(1 - P_HMI/2): the two-sided normal coverage factor at the \
                 integrity-risk budget, so the coast bound is stated at the same risk as \
                 the rest of the report",
            ),
        };
        let coast_inputs = CoastInputs {
            q_pos,
            q_clk,
            k: coverage_k,
            alert_h,
            alert_v,
            alert_t,
        };
        let coast_fwd = build_coast_direction("optical_to_rf", &coast_diag_fwd, &coast_inputs);
        let coast_rev = build_coast_direction("rf_to_optical", &coast_diag_rev, &coast_inputs);
        let coast = CoastStudy {
            model: COAST_MODEL,
            process_noise_position_psd_m2_s: q_pos,
            process_noise_clock_psd_s2_s: q_clk,
            coverage_k,
            coverage_k_source,
            alert_limit_h_m: alert_h,
            alert_limit_v_m: alert_v,
            alert_limit_t_s: alert_t,
            time_inside_alert_limits_optical_to_rf_s: coast_fwd.time_inside_alert_limits_s,
            time_inside_alert_limits_rf_to_optical_s: coast_rev.time_inside_alert_limits_s,
            directions: vec![coast_fwd, coast_rev],
            caveat: COAST_CAVEAT,
        };

        // G16 - the RF leg. Every input is resolved here, once, and the same resolved
        // set feeds BOTH the availability block and the ranging comparison, so the two
        // can never be stated at different operating points.
        let rf = self.resolve_rf_inputs(range_m, integration_s)?;
        let rf_config = rf.configuration();
        let rf_availability = build_rf_availability(&rf, a, opt_meets, rf_meets);
        let ranging =
            build_ranging_comparison(&rf, &optical, pulse_rms_s, opt_pos_sigma_m, rf_pos_sigma_m);

        Ok(Computed {
            optical,
            link_params,
            integration_s,
            detected_photons: detected,
            opt_pos_sigma_m,
            opt_clock_sigma_s,
            rf_pos_sigma_m,
            rf_clock_sigma_s,
            two_way,
            cross,
            protected,
            availability,
            handoff,
            handoff_reverse,
            fom,
            alert_h,
            alert_v,
            alert_t,
            fault_study,
            coast,
            rf_config,
            rf_availability,
            ranging,
        })
    }

    /// Resolve the G16 RF-leg inputs: defaults applied, validated, and pinned to the
    /// scenario's own range and integration time so the RF leg cannot drift to a
    /// different operating point from the optical one.
    fn resolve_rf_inputs(&self, range_m: f64, integration_s: f64) -> Result<RfInputs, String> {
        let raw = self.rf_band.clone().unwrap_or_else(|| "x".to_string());
        let (band, band_label) = match raw.to_ascii_lowercase().as_str() {
            "s" => (Band::S, "s"),
            "x" => (Band::X, "x"),
            "ka" => (Band::Ka, "ka"),
            other => return Err(format!("unknown rf_band '{other}' (expected s|x|ka)")),
        };
        let eirp_dbw = self.rf_eirp_dbw.unwrap_or(26.0);
        let g_over_t_db = self.rf_g_over_t_db.unwrap_or(53.0);
        let other_losses_db = self.rf_other_losses_db.unwrap_or(3.0);
        let data_rate_bps = self.rf_data_rate_bps.unwrap_or(1.0e6);
        let required_eb_n0_db = self.rf_required_eb_n0_db.unwrap_or(4.5);
        let chip_rate_hz = self.rf_chip_rate_hz.unwrap_or(CA_CHIP_RATE_HZ);
        let correlator_spacing_chips = self.rf_correlator_spacing_chips.unwrap_or(0.5);
        let tracking_threshold_dbhz = self
            .rf_tracking_threshold_dbhz
            .unwrap_or(DEFAULT_TRACKING_THRESHOLD_DBHZ);
        let degraded_margin_db = self
            .rf_degraded_margin_db
            .unwrap_or(DEFAULT_DEGRADED_MARGIN_DB);
        // The loop noise bandwidth is derived, not guessed: a single-sided B_L averages
        // over 1/(2·B_L) seconds, so this puts the RF leg at the optical accumulation
        // time exactly. A caller may override it, and the ranging ratio is then refused.
        let (dll_bandwidth_hz, dll_bandwidth_source) = match self.rf_dll_bandwidth_hz {
            Some(b) => (
                b,
                "caller-supplied rf_dll_bandwidth_hz (the ranging ratio is refused unless \
                 1/(2*B_L) equals integration_s)",
            ),
            None => (
                1.0 / (2.0 * integration_s),
                "1/(2*integration_s): the single-sided loop noise bandwidth whose \
                 equivalent averaging time is exactly the optical leg's accumulation time",
            ),
        };
        for (name, v) in [
            ("rf_eirp_dbw", eirp_dbw),
            ("rf_g_over_t_db", g_over_t_db),
            ("rf_required_eb_n0_db", required_eb_n0_db),
        ] {
            if !v.is_finite() {
                return Err(format!("{name} must be finite"));
            }
        }
        if !other_losses_db.is_finite() || other_losses_db < 0.0 {
            return Err("rf_other_losses_db must be finite and >= 0".to_string());
        }
        for (name, v) in [
            ("rf_data_rate_bps", data_rate_bps),
            ("rf_chip_rate_hz", chip_rate_hz),
            ("rf_correlator_spacing_chips", correlator_spacing_chips),
            ("rf_dll_bandwidth_hz", dll_bandwidth_hz),
        ] {
            if !v.is_finite() || v <= 0.0 {
                return Err(format!("{name} must be finite and positive"));
            }
        }
        if !tracking_threshold_dbhz.is_finite() || !degraded_margin_db.is_finite() {
            return Err(
                "rf_tracking_threshold_dbhz and rf_degraded_margin_db must be finite".to_string(),
            );
        }
        Ok(RfInputs {
            band,
            band_label,
            eirp_dbw,
            g_over_t_db,
            other_losses_db,
            data_rate_bps,
            required_eb_n0_db,
            range_m,
            chip_rate_hz,
            correlator_spacing_chips,
            dll_bandwidth_hz,
            dll_bandwidth_source,
            integration_s,
            tracking_threshold_dbhz,
            degraded_margin_db,
        })
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c)))
    }

    /// Run the scenario, returning `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c), self.svg(&c)))
    }

    fn json(&self, c: &Computed) -> Result<String, String> {
        // G16 / R3 — unit and provenance class for every quantity a paper is likely to
        // quote. The handoff variances are the reason this block exists: they were
        // emitted as bare "variance" and a manuscript had to infer square metres from
        // an internal consistency check. An inferred unit is an interface defect.
        let mut units = serde_json::json!({
            "handoff.variance_after_optical": {"unit": "m^2", "provenance": "computed", "note": "covariance trace over the position axes"},
            "handoff.variance_after_handoff": {"unit": "m^2", "provenance": "computed", "note": "covariance trace over the position axes"},
            "handoff.variance_after_rf": {"unit": "m^2", "provenance": "computed", "note": "covariance trace over the position axes"},
            "handoff.max_mean_jump": {"unit": "m", "provenance": "computed"},
            "handoff.final_nees": {"unit": "dimensionless", "provenance": "computed", "note": "chi-square with dof = number of states"},
            "optical_link.optical_ranging_sigma_m": {"unit": "m", "provenance": "computed"},
            "optical_link.optical_timing_sigma_s": {"unit": "s", "provenance": "computed"},
            "optical_link.rf_position_sigma_m": {"unit": "m", "provenance": "input", "note": "loose RF reference precision; a representative input, not a measurement"},
            "optical_link.rf_clock_sigma_s": {"unit": "s", "provenance": "input"},
            "optical_link.photon_rate_hz": {"unit": "Hz", "provenance": "computed"},
            "cross_modality_raim.hpl_m": {"unit": "m", "provenance": "computed"},
            "cross_modality_raim.vpl_m": {"unit": "m", "provenance": "computed"},
            "cross_modality_raim.tpl_s": {"unit": "s", "provenance": "computed"},
            "optical_availability.single_site_mean": {"unit": "fraction", "provenance": "modelled", "note": "weather-limited clear-sky climatology. The RF counterpart is rf_availability.availability, and it is NOT the same kind of number: this one is a probability built from a published clear-sky climatology and a modelled pointing factor, while the RF figure is a DETERMINISTIC 0/1 indicator product over an Eb/N0 link margin and a tracking threshold, evaluated once at one range on one link budget. It carries no distribution, so it can only be 0 or 1. Quoting the two side by side as comparable percentages is a category error; rf_availability.differs_from_optical states the difference in full and rf_availability.factors_not_included names the RF outage climatology that would be needed to make them comparable"},
            "optical_availability.independent_union": {"unit": "fraction", "provenance": "modelled"},
            "optical_availability.correlated_union": {"unit": "fraction", "provenance": "modelled"},
            // G15 - fault injection / detection power.
            "fault_injection.chi2_threshold": {"unit": "dimensionless", "provenance": "computed", "note": "chi-square_{1-P_fa}(dof); the same threshold cross_modality_raim.chi2_threshold reports, not a re-derivation"},
            "fault_injection.fault_free_chi2_statistic": {"unit": "dimensionless", "provenance": "computed"},
            "fault_injection.noncentrality_at_mdb": {"unit": "dimensionless", "provenance": "computed", "note": "lambda* = the non-centrality whose missed-detection probability is exactly P_md"},
            "fault_injection.pbias": {"unit": "dimensionless", "provenance": "computed", "note": "sqrt(lambda*): the minimum detectable bias in units of the axis separation sigma, shared by every axis"},
            "fault_injection.p_detect_at_zero_fault": {"unit": "probability", "provenance": "computed", "note": "equals P_fa by construction - the zero-fault end of a power curve is the false-alarm rate, not zero"},
            "fault_injection.p_detect_at_mdb": {"unit": "probability", "provenance": "computed", "note": "equals 1 - P_md by construction"},
            "fault_injection.deterministic_detection_multiple_of_mdb": {"unit": "dimensionless", "provenance": "computed", "note": "sqrt(T/lambda*): the noise-free bias multiple at which the realised statistic first crosses the threshold"},
            "fault_injection.mdb_horizontal_m": {"unit": "m", "provenance": "computed", "note": "minimum detectable bias on a horizontal axis at the stated P_fa/P_md"},
            "fault_injection.mdb_vertical_m": {"unit": "m", "provenance": "computed"},
            "fault_injection.mdb_timing_s": {"unit": "s", "provenance": "computed"},
            "fault_injection.axes": {"unit": "mixed - see note", "provenance": "computed", "note": "per element: sigma_separation, minimum_detectable_bias, alert_limit, injected_bias and fault_magnitude carry the element's own `unit` field (m for east/north/up, s for clock); ramp_rate_per_s is that unit per second; ramp_time_to_detect_s is seconds; noncentrality, p_detect and the chi-square statistics are dimensionless"},
            // G17 - post-handover coast.
            "post_handover_coast.process_noise_position_psd_m2_s": {"unit": "m^2/s", "provenance": "input", "note": "MODELLED representative position random-walk PSD; the 1e-3 default is 1 m (1 sigma) of unmodelled growth per 1000 s of coast, per axis"},
            "post_handover_coast.process_noise_clock_psd_s2_s": {"unit": "s^2/s", "provenance": "input", "note": "MODELLED: white-FM clock phase random walk, q = tau*sigma_y(tau)^2; the 1e-22 default is sigma_y(1 s) = 1e-11, a representative space USO"},
            "post_handover_coast.coverage_k": {"unit": "dimensionless", "provenance": "computed", "note": "coverage factor applied to the coasting 1 sigma before the alert-limit comparison; Phi^-1(1 - P_HMI/2) unless coast_coverage_k is given"},
            "post_handover_coast.alert_limit_h_m": {"unit": "m", "provenance": "input", "note": "the scenario's own alert_limit_h_m, reused so the coast is judged against the same limit as the cross-modality block"},
            "post_handover_coast.alert_limit_v_m": {"unit": "m", "provenance": "input"},
            "post_handover_coast.alert_limit_t_s": {"unit": "s", "provenance": "input"},
            "post_handover_coast.time_inside_alert_limits_optical_to_rf_s": {"unit": "s", "provenance": "computed", "note": "how long the coasting solution stays inside every alert limit after the optical->RF handover; null means no limit is ever reached"},
            "post_handover_coast.time_inside_alert_limits_rf_to_optical_s": {"unit": "s", "provenance": "computed"},
            "post_handover_coast.directions": {"unit": "mixed - see note", "provenance": "computed", "note": "per element: position_variance_after_handoff_m2 in m^2, clock_variance_after_handoff_s2 in s^2, total_variance_after_handoff the whole diagonal (m^2 position plus s^2 clock, matching handoff.variance_after_handoff), sigma_h/sigma_v and their bounds in m, sigma_t and its bound in s, and every *_time_s / time_to_* / time_inside_* in seconds"},
        });
        // …and one entry per remaining numeric leaf, in the `crate::field_schema` path
        // grammar, so the document describes every number it emits and not only the
        // headline ones. Merged, never overwritten: a key the literal above already
        // states wins, so no released entry can move.
        {
            let extra = crate::field_schema::units_block(UNITS);
            let obj = units.as_object_mut().expect("the units block is an object");
            for (path, meta) in extra.as_object().expect("units_block renders an object") {
                obj.entry(path.as_str()).or_insert_with(|| meta.clone());
            }
        }

        let doc = serde_json::json!({
            "kind": "hybrid-optical-rf",
            "label": LABEL,
            // G16 — the resolved link configuration. Every value here is an INPUT after
            // defaults have been applied, echoed so a paper can state the configuration it
            // ran at instead of quoting a default it read out of the source. Key names
            // carry the unit; `units` below carries the provenance class.
            "link_configuration": {
                "wavelength_nm": self.wavelength_nm.unwrap_or(1550.0),
                "tx_power_w": c.link_params.tx_power_w,
                "tx_aperture_m": c.link_params.tx_aperture_m,
                "rx_aperture_m": c.link_params.rx_aperture_m,
                "range_km": self.range_km.unwrap_or(384_000.0),
                "optics_efficiency": c.link_params.optics_efficiency,
                "detector_efficiency": c.link_params.detector_efficiency,
                "atmospheric_loss_db": c.link_params.atmospheric_loss_db,
                "pointing_loss_db": c.link_params.pointing_loss_db,
                "pulse_rms_ps": self.pulse_rms_ps.unwrap_or(50.0),
                "integration_s": c.integration_s,
            },
            // G16 — the resolved RF link leg, the same self-description the optical
            // `link_configuration` block gives. Both the RF availability and the ranging
            // comparison are evaluated from exactly these values, at the scenario's own
            // range and integration time.
            "rf_link_configuration": c.rf_config,
            "units": units,
            "optical_link": {
                "footprint_m": c.optical.footprint_m,
                "divergence_rad": c.optical.divergence_rad,
                "geometric_loss_db": c.optical.geometric_loss_db,
                "total_loss_db": c.optical.total_loss_db,
                "photon_rate_hz": c.optical.photon_rate_hz,
                "detected_photons": c.detected_photons,
                "two_way": c.two_way,
                "optical_ranging_sigma_m": c.opt_pos_sigma_m,
                "optical_timing_sigma_s": c.opt_clock_sigma_s,
                "rf_position_sigma_m": c.rf_pos_sigma_m,
                "rf_clock_sigma_s": c.rf_clock_sigma_s,
            },
            "cross_modality_raim": {
                "n_axes": c.cross.n_axes,
                "chi2_statistic": c.cross.chi2_statistic,
                "chi2_threshold": c.cross.chi2_threshold,
                "fault_detected": c.cross.fault_detected,
                "hpl_m": c.cross.hpl_m,
                "vpl_m": c.cross.vpl_m,
                "tpl_s": c.cross.tpl_s,
                "alert_limit_h_m": c.alert_h,
                "alert_limit_v_m": c.alert_v,
                "alert_limit_t_s": c.alert_t,
                "protected": c.protected,
                "axes": c.cross.axes,
            },
            "optical_availability": {
                "n_sites": c.availability.n_sites,
                "single_site_mean": c.availability.single_site_mean,
                "independent_union": c.availability.independent_union,
                "correlated_union": c.availability.correlated_union,
                "correlation": c.availability.correlation,
                "per_site": c.availability.per_site,
                "diversity_curve": c.availability.diversity_curve,
            },
            "handoff": {
                "mean_continuous": c.handoff.mean_continuous,
                "max_mean_jump": c.handoff.max_mean_jump,
                "variance_after_optical": c.handoff.variance_after_optical,
                "variance_after_handoff": c.handoff.variance_after_handoff,
                "variance_after_rf": c.handoff.variance_after_rf,
                "final_nees": c.handoff.final_nees,
                "nees_gate_lo": c.handoff.nees_gate.0,
                "nees_gate_hi": c.handoff.nees_gate.1,
                "nees_in_gate": c.handoff.nees_in_gate,
                "dof": c.handoff.dof,
            },
            "handoff_reverse": {
                "direction": "rf_to_optical",
                "mean_continuous": c.handoff_reverse.mean_continuous,
                "max_mean_jump": c.handoff_reverse.max_mean_jump,
                "variance_after_rf_stage": c.handoff_reverse.variance_after_optical,
                "variance_after_handoff": c.handoff_reverse.variance_after_handoff,
                "variance_after_optical_stage": c.handoff_reverse.variance_after_rf,
                "final_nees": c.handoff_reverse.final_nees,
                "nees_in_gate": c.handoff_reverse.nees_in_gate,
                "dof": c.handoff_reverse.dof,
            },
            "joint_fom": c.fom,
            // G15 - fault injection and detection power for the cross-modality monitor.
            // The no-fault case alone demonstrates nothing about detection: this block
            // states the smallest bias the monitor can catch, per axis, and the power
            // curve either side of it.
            "fault_injection": c.fault_study,
            // G17 - the post-handover covariance re-growth, and how long the coasting
            // solution stays inside the alert limits.
            "post_handover_coast": c.coast,
            // G16 - RF link availability. The engine used to compute optical
            // weather-limited availability and nothing on the RF side, and P5 had to drop
            // its RF availability figure. This block composes one from quantities the
            // engine already has - the link margin and the tracking threshold - states
            // the composition as a named rule, and says in full why it is NOT the same
            // kind of number as the optical availability beside it.
            "rf_availability": c.rf_availability,
            // G16 - the like-for-like optical-versus-RF ranging comparison: one quantity,
            // one definition, ONE configuration, emitted in this same object. A ratio at
            // two operating points would be worse than no ratio, so the block refuses
            // rather than quotes when the operating points do not match.
            "ranging_comparison": c.ranging,
        });
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }

    fn summary(&self, c: &Computed) -> String {
        format!(
            "hybrid-optical-rf | optical footprint {:.0} m, {:.0} photons -> ranging σ {:.3} mm, \
             timing σ {:.2} ps | cross-RAIM HPL {:.1} m / VPL {:.1} m / TPL {:.1} ns ({}) | \
             availability {:.1}% ({} sites) | handoff no-jump {} NEES {:.2}∈[{:.2},{:.2}] {} | \
             joint FoM {:.3} (A {:.3} · P {:.3} · I {:.3}) | Validated CRLB/χ²-PL/union/handoff, \
             Modelled σ/climatology",
            c.optical.footprint_m,
            c.detected_photons,
            c.opt_pos_sigma_m * 1e3,
            c.opt_clock_sigma_s * 1e12,
            c.cross.hpl_m,
            c.cross.vpl_m,
            c.cross.tpl_s * 1e9,
            if c.protected {
                "protected"
            } else {
                "UNPROTECTED"
            },
            c.availability.correlated_union * 100.0,
            c.availability.n_sites,
            if c.handoff.mean_continuous {
                "OK"
            } else {
                "JUMP"
            },
            c.handoff.final_nees,
            c.handoff.nees_gate.0,
            c.handoff.nees_gate.1,
            if c.handoff.nees_in_gate {
                "in-gate"
            } else {
                "OUT"
            },
            c.fom.score,
            c.fom.availability,
            c.fom.precision_grade,
            c.fom.integrity_assured,
        )
    }

    /// A deterministic bar chart of the joint-FoM factors and the composed scores.
    fn svg(&self, c: &Computed) -> String {
        let (w, h) = (820.0_f64, 420.0_f64);
        let (ml, mr, mt, mb) = (60.0_f64, 20.0_f64, 46.0_f64, 60.0_f64);
        let pw = w - ml - mr;
        let ph = h - mt - mb;
        let axis_y = mt + ph;
        let bars = [
            ("availability", c.fom.availability, "#5fb0c9"),
            ("precision", c.fom.precision_grade, "#d2925e"),
            ("integrity", c.fom.integrity_assured, "#8fbf6f"),
            ("joint (indep)", c.fom.joint_independent, "#9a8fd0"),
            ("joint (corr)", c.fom.joint_correlated, "#e0bd84"),
        ];
        let n = bars.len() as f64;
        let slot = pw / n;
        let bw = slot * 0.56;
        let yof = |v: f64| mt + ph - v.clamp(0.0, 1.0) * ph;
        let mut svg = String::new();
        svg.push_str(&format!(
            "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
             font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
        ));
        svg.push_str(&format!(
            "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
        ));
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"22\" font-size=\"15\" font-weight=\"bold\">Hybrid optical + RF PNT joint figure of merit</text>"
        ));
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"38\" font-size=\"11\" fill=\"#8a8172\">P(available AND precision-grade AND integrity-assured)</text>"
        ));
        // Axes and 0.25/0.5/0.75/1.0 gridlines.
        svg.push_str(&format!(
            "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
        ));
        svg.push_str(&format!(
            "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
            ml + pw
        ));
        for g in [0.25, 0.5, 0.75, 1.0] {
            let gy = yof(g);
            svg.push_str(&format!(
                "<line x1=\"{ml:.0}\" y1=\"{gy:.1}\" x2=\"{:.0}\" y2=\"{gy:.1}\" stroke=\"#241d15\" stroke-dasharray=\"3 4\"/>",
                ml + pw
            ));
            svg.push_str(&format!(
                "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#6b6355\">{g:.2}</text>",
                ml - 6.0,
                gy + 4.0
            ));
        }
        for (idx, (label, value, color)) in bars.iter().enumerate() {
            let cx = ml + slot * (idx as f64 + 0.5);
            let x = cx - bw / 2.0;
            let y = yof(*value);
            let bh = axis_y - y;
            svg.push_str(&format!(
                "<rect x=\"{x:.1}\" y=\"{y:.1}\" width=\"{bw:.1}\" height=\"{bh:.1}\" fill=\"{color}\"/>"
            ));
            svg.push_str(&format!(
                "<text x=\"{cx:.1}\" y=\"{:.1}\" text-anchor=\"middle\" fill=\"#e6ddcb\">{value:.3}</text>",
                y - 5.0
            ));
            svg.push_str(&format!(
                "<text x=\"{cx:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"11\">{label}</text>",
                axis_y + 18.0
            ));
        }
        svg.push_str("</svg>");
        svg
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::{Rng, SeedableRng};
    use rand_chacha::ChaCha8Rng;
    use serde_json::Value;

    /// The joint independent product is exact `A·P·I`; the correlated joint reduces to it at
    /// ρ = 0 and to min(A,P,I) at ρ = 1, is monotone in ρ, and is bounded in between. Oracle:
    /// the closed-form product and interpolation.
    #[test]
    fn joint_fom_product_and_correlation_bounds() {
        let (a, p, i) = (0.96, 0.90, 0.99);
        let indep = joint_fom(a, p, i, 0.0);
        assert!((indep.joint_independent - a * p * i).abs() < 1e-12);
        assert!(
            (indep.joint_correlated - a * p * i).abs() < 1e-12,
            "ρ=0 is the product"
        );
        let full = joint_fom(a, p, i, 1.0);
        assert!(
            (full.joint_correlated - a.min(p).min(i)).abs() < 1e-12,
            "ρ=1 is the min"
        );
        // Monotone in ρ, bounded in [product, min].
        let mid = joint_fom(a, p, i, 0.5).joint_correlated;
        assert!(indep.joint_correlated <= mid && mid <= full.joint_correlated);
        assert!(a * p * i <= mid && mid <= a.min(p).min(i));
    }

    /// **REDUCES-TO-MARGINAL (G4a).** The joint FoM reduces to each single marginal when the
    /// other two factors are 1: `joint_fom(A,1,1,ρ).score == A` and the two symmetric cases,
    /// for BOTH `ρ = 0` and `ρ > 0`. At any ρ, with two factors equal to 1 both the
    /// independent product `A·1·1` and the min `min(A,1,1) = A` equal A, so the interpolation
    /// collapses to A regardless of ρ. Oracle: the closed-form marginalisation identity.
    #[test]
    fn joint_fom_reduces_to_each_marginal() {
        for rho in [0.0, 0.3, 0.5, 1.0] {
            for x in [0.0, 0.25, 0.6, 0.9, 1.0] {
                // First slot is the marginal, other two = 1.
                assert!(
                    (joint_fom(x, 1.0, 1.0, rho).score - x).abs() < 1e-12,
                    "joint_fom({x},1,1,{rho}) must reduce to {x}"
                );
                // Second slot.
                assert!(
                    (joint_fom(1.0, x, 1.0, rho).score - x).abs() < 1e-12,
                    "joint_fom(1,{x},1,{rho}) must reduce to {x}"
                );
                // Third slot.
                assert!(
                    (joint_fom(1.0, 1.0, x, rho).score - x).abs() < 1e-12,
                    "joint_fom(1,1,{x},{rho}) must reduce to {x}"
                );
            }
        }
    }

    /// **MONTE-CARLO CROSS-CHECK (G4b).** Drawing an epoch sample series where each epoch is
    /// independently `available`, `precision-grade` and `PL-bounded` (integrity-assured) with
    /// probabilities `A`, `P`, `I`, the empirical fraction of epochs SIMULTANEOUSLY satisfying
    /// all three converges to the closed-form INDEPENDENT joint `A·P·I` (= `joint_fom(.,.,.,0)`).
    /// Oracle: a seeded Monte-Carlo epoch ensemble (in the spirit of `hybrid::score_hybrid`)
    /// vs the closed-form product — the same MC→closed-form pattern the P7 conflict_resilience
    /// module uses, genuinely independent of the algebraic `joint_fom` evaluation.
    #[test]
    fn joint_fom_monte_carlo_matches_independent_product() {
        let cases: [(f64, f64, f64); 3] =
            [(0.96, 0.90, 0.99), (0.80, 0.75, 0.995), (0.5, 0.5, 0.5)];
        let n = 400_000usize;
        for (a, p, i) in cases {
            let mut rng = ChaCha8Rng::seed_from_u64(0xC0FFEE ^ a.to_bits());
            let mut all_three: u64 = 0;
            for _ in 0..n {
                // Independent per-epoch Bernoulli draws for the three P5 conditions.
                let avail = rng.gen_range(0.0..1.0) < a;
                let precise = rng.gen_range(0.0..1.0) < p;
                let integ = rng.gen_range(0.0..1.0) < i;
                if avail && precise && integ {
                    all_three += 1;
                }
            }
            let empirical = all_three as f64 / n as f64;
            let closed_form = joint_fom(a, p, i, 0.0).joint_independent;
            assert!((closed_form - a * p * i).abs() < 1e-12, "product sanity");
            // MC standard error ~ √(q(1−q)/n); allow 4σ.
            let q = closed_form;
            let se = (q * (1.0 - q) / n as f64).sqrt();
            assert!(
                (empirical - closed_form).abs() < 4.0 * se + 1e-6,
                "empirical joint-available∧precise∧integrity {empirical} vs closed form \
                 {closed_form} (A={a}, P={p}, I={i}); 4σ = {}",
                4.0 * se
            );
        }
    }

    /// The default scenario runs end to end, carries the honesty label, and produces a
    /// finite, sensible joint FoM: the optical link is photon-limited (sub-mm ranging), the
    /// cross-modality solution is protected, the network availability is ≈ 99.5 %, the handoff
    /// is bit-continuous with an in-gate NEES, and the score is dominated by availability.
    #[test]
    fn default_scenario_runs_and_is_honest() {
        let (json, summary) = HybridOpticalRfScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "hybrid-optical-rf");
        let label = v["label"].as_str().unwrap();
        assert!(label.contains("VALIDATED") && label.contains("MODELLED"));

        // Optical: a sub-mm two-way ranging precision from a photon-starved link.
        let opt = &v["optical_link"];
        let ranging_mm = opt["optical_ranging_sigma_m"].as_f64().unwrap() * 1e3;
        assert!(
            ranging_mm.is_finite() && ranging_mm > 0.0 && ranging_mm < 10.0,
            "ranging {ranging_mm} mm"
        );
        assert!((650.0..750.0).contains(&opt["footprint_m"].as_f64().unwrap()));

        // Cross-modality integrity: protected within the alert limits.
        assert!(v["cross_modality_raim"]["protected"].as_bool().unwrap());
        assert!(!v["cross_modality_raim"]["fault_detected"]
            .as_bool()
            .unwrap());

        // Availability ≈ 99.5 % (five externally-sourced sites, correlated union).
        let a = v["optical_availability"]["correlated_union"]
            .as_f64()
            .unwrap();
        assert!((0.99..0.997).contains(&a), "availability {a}");

        // Handoff: bit-continuous, NEES in gate.
        assert!(v["handoff"]["mean_continuous"].as_bool().unwrap());
        assert_eq!(v["handoff"]["max_mean_jump"].as_f64().unwrap(), 0.0);
        assert!(v["handoff"]["nees_in_gate"].as_bool().unwrap());

        // Reverse ("and back") RF→optical handoff: also bit-continuous, and the final tight
        // optical stage deflates below the post-handoff (inflated) variance.
        let hr = &v["handoff_reverse"];
        assert_eq!(hr["direction"], "rf_to_optical");
        assert!(hr["mean_continuous"].as_bool().unwrap());
        assert_eq!(hr["max_mean_jump"].as_f64().unwrap(), 0.0);
        assert!(
            hr["variance_after_optical_stage"].as_f64().unwrap()
                < hr["variance_after_handoff"].as_f64().unwrap(),
            "reverse handoff final optical stage must tighten"
        );

        // Joint FoM: finite, availability-limited, in (0, 1).
        let score = v["joint_fom"]["score"].as_f64().unwrap();
        assert!((0.95..0.998).contains(&score), "joint score {score}");
        assert!(summary.contains("hybrid-optical-rf"));
    }

    /// The scenario is deterministic and its SVG is well-formed.
    #[test]
    fn scenario_is_deterministic_and_svg_well_formed() {
        let scn = HybridOpticalRfScenario::default();
        assert_eq!(scn.run_json().unwrap(), scn.run_json().unwrap());
        let (_j, _s, svg) = scn.run_output().unwrap();
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert!(svg.contains("joint figure of merit"));
    }

    /// **SCENARIO ↔ STUDY SHARED-QUANTITY PIN (G7, engine side).** The `hybrid-optical-rf`
    /// scenario emits its shared optical / FoM quantities DETERMINISTICALLY for the fixed
    /// default configuration. This test pins those shared values so the pro-side G5 study
    /// generator has a concrete, stable reconciliation target. These are exactly the shared
    /// inputs the pro G5 `OpticalRfHybridStudy` must match to reconcile: the default 1550 nm /
    /// 1 mW / 0.85 m-aperture / 1 s-integration / two-way link (with the two-way return-path
    /// double-pass geometric loss applied). The pro-side alignment is handled separately; this
    /// pins the kshana surface deterministically (the registry golden pins the summary string).
    #[test]
    fn scenario_emits_deterministic_shared_quantities_for_g5_reconciliation() {
        let (json, _s) = HybridOpticalRfScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let ol = &v["optical_link"];

        // Deterministic across repeated runs.
        let (json2, _s2) = HybridOpticalRfScenario::default().run_json().unwrap();
        assert_eq!(json, json2, "shared quantities must be deterministic");

        // The pinned shared quantities the pro G5 study must reconcile with (fixed default
        // config, two-way return-path handling ON). Tight tolerances — these are the contract.
        let footprint = ol["footprint_m"].as_f64().unwrap();
        assert!(
            (footprint - 700.2352941176471).abs() < 1e-6,
            "footprint {footprint}"
        );
        let photons = ol["detected_photons"].as_f64().unwrap();
        assert!(
            (photons - 1489.439014904476).abs() < 1e-6,
            "photons {photons}"
        );
        let ranging = ol["optical_ranging_sigma_m"].as_f64().unwrap();
        assert!(
            (ranging - 0.00019420005507534736).abs() < 1e-12,
            "ranging σ {ranging}"
        );
        let timing = ol["optical_timing_sigma_s"].as_f64().unwrap();
        assert!(
            (timing - 1.2955633131727907e-12).abs() < 1e-18,
            "timing σ {timing}"
        );
        assert!(ol["two_way"].as_bool().unwrap(), "two-way path ON");
        let geo_loss = ol["geometric_loss_db"].as_f64().unwrap();
        assert!(
            (geo_loss - 58.31650142218474).abs() < 1e-9,
            "geo loss {geo_loss}"
        );
        let score = v["joint_fom"]["score"].as_f64().unwrap();
        assert!(
            (score - 0.9926615252602455).abs() < 1e-12,
            "FoM score {score}"
        );
    }

    /// Tightening the optical link (more photons via a bigger aperture / more power) lowers
    /// the optical ranging σ, and a demanding precision grade the RF cannot meet ties the
    /// precision-grade factor to the optical availability.
    #[test]
    fn precision_grade_tracks_optical_availability_when_rf_is_too_loose() {
        let (json, _s) = HybridOpticalRfScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let a = v["optical_availability"]["correlated_union"]
            .as_f64()
            .unwrap();
        let p = v["joint_fom"]["precision_grade"].as_f64().unwrap();
        // RF (1 m, 3 ns) cannot meet the 10 cm / 1 ns grade, so P equals A.
        assert!(
            (p - a).abs() < 1e-9,
            "precision {p} should equal availability {a}"
        );
    }

    /// The report states the configuration it ran at, defaults included.
    ///
    /// G16. P5 had to quote the carrier wavelength and transmit aperture from the source
    /// defaults because the report never echoed them. A paper that reads a number out of
    /// an implementation instead of a result is not reproducible from the result.
    #[test]
    fn the_report_echoes_the_resolved_link_configuration() {
        let scn = HybridOpticalRfScenario::default();
        let (json, _, _) = scn.run_output().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let lc = &v["link_configuration"];
        // Defaults are resolved and echoed exactly, not round-tripped through metres.
        assert_eq!(lc["wavelength_nm"], 1550.0);
        assert_eq!(lc["tx_aperture_m"], 0.85);
        assert_eq!(lc["rx_aperture_m"], 0.85);
        assert_eq!(lc["range_km"], 384_000.0);
        assert_eq!(lc["pulse_rms_ps"], 50.0);

        // An override is echoed as given, so the block always describes THIS run.
        let scn = HybridOpticalRfScenario {
            wavelength_nm: Some(1064.0),
            tx_aperture_m: Some(0.3),
            ..HybridOpticalRfScenario::default()
        };
        let (json, _, _) = scn.run_output().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["link_configuration"]["wavelength_nm"], 1064.0);
        assert_eq!(v["link_configuration"]["tx_aperture_m"], 0.3);
    }

    /// Every quantity a paper is likely to quote carries a unit and a provenance class.
    ///
    /// R3. The handoff variances are the reason: they were emitted as a bare "variance"
    /// and a manuscript inferred square metres from an internal consistency check. The
    /// inference was right, which is exactly why it is a defect -- nothing would have
    /// caught it being wrong.
    #[test]
    fn every_quoted_quantity_carries_a_unit_and_a_provenance_class() {
        let scn = HybridOpticalRfScenario::default();
        let (json, _, _) = scn.run_output().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let units = v["units"].as_object().expect("a units block");
        assert!(!units.is_empty());
        for (field, meta) in units {
            assert!(meta["unit"].is_string(), "{field} has no unit");
            assert!(
                meta["provenance"].is_string(),
                "{field} has no provenance class"
            );
        }
        // The variance unit is stated, not left to be inferred.
        for f in [
            "handoff.variance_after_optical",
            "handoff.variance_after_handoff",
            "handoff.variance_after_rf",
        ] {
            assert_eq!(units[f]["unit"], "m^2", "{f} must state square metres");
        }
    }

    /// Resolve a units-block path against the emitted document, in the path grammar of
    /// [`crate::field_schema`]: an array contributes one `[]`-suffixed segment shared by
    /// every row, and a `*` segment stands for each key of a data-keyed object.
    fn units_path_resolves(v: &Value, segs: &[&str]) -> bool {
        let Some((seg, rest)) = segs.split_first() else {
            return !v.is_null();
        };
        // An array's rows all share the segment that named the array, so descend into
        // the rows without consuming another segment.
        if let Value::Array(rows) = v {
            return rows.iter().any(|row| units_path_resolves(row, segs));
        }
        let Value::Object(m) = v else {
            return false;
        };
        let name = seg.trim_end_matches("[]");
        if name == "*" {
            return m.values().any(|child| units_path_resolves(child, rest));
        }
        match m.get(name) {
            Some(child) => units_path_resolves(child, rest),
            None => false,
        }
    }

    /// Every field the units block describes must actually exist in the report.
    ///
    /// A units block that names a field nobody emits is worse than none: it reads as a
    /// guarantee and documents a ghost.
    #[test]
    fn the_units_block_describes_only_fields_that_exist() {
        let scn = HybridOpticalRfScenario::default();
        let (json, _, _) = scn.run_output().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        for field in v["units"].as_object().unwrap().keys() {
            let segs: Vec<&str> = field.split('.').collect();
            assert!(
                units_path_resolves(&v, &segs),
                "units names {field}, which the report does not emit"
            );
        }
    }

    /// …and the converse: every numeric leaf of the report is described by the block, so
    /// the document cannot grow a number nobody stated a unit for.
    #[test]
    fn every_numeric_leaf_of_the_report_is_described() {
        let scn = HybridOpticalRfScenario::default();
        let (json, _, _) = scn.run_output().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let audit = crate::field_schema::audit_document(&v);
        assert!(
            audit.missing.is_empty(),
            "{} numeric fields carry no units entry: {:?}",
            audit.missing.len(),
            audit.missing
        );
        assert!(
            audit.malformed.is_empty(),
            "malformed units entries: {:?}",
            audit.malformed
        );
        assert!(audit.field_count() >= 90, "{}", audit.field_count());
    }

    // ---------------------------------------------------------------------------------
    // G15 -- fault injection for the cross-modality monitor.
    // ---------------------------------------------------------------------------------

    /// Helper: the default scenario's report as a parsed value.
    fn default_report() -> Value {
        let (json, _s) = HybridOpticalRfScenario::default().run_json().unwrap();
        serde_json::from_str(&json).unwrap()
    }

    /// The zero-fault end of the detection-power curve is the FALSE-ALARM rate, and the
    /// minimum-detectable-bias end is exactly `1 − P_md`.
    ///
    /// G15. Before this, the reported statistic was 0.0 against a ~28.47 threshold: the
    /// monitor was demonstrated to pass a no-fault case and nothing else. A power curve
    /// that started at zero instead of `P_fa` would be the classic tell that the curve was
    /// drawn rather than computed, so both endpoints are pinned to the probabilities the
    /// monitor was configured with.
    #[test]
    fn the_detection_power_curve_runs_from_the_false_alarm_rate_to_one_minus_p_md() {
        let v = default_report();
        let f = &v["fault_injection"];
        let p_fa = f["p_fa"].as_f64().unwrap();
        let p_md = f["p_md"].as_f64().unwrap();
        assert_eq!(p_fa, 1e-5);
        assert_eq!(p_md, 1e-3);
        assert!(
            (f["p_detect_at_zero_fault"].as_f64().unwrap() - p_fa).abs() < 1e-9,
            "zero-fault detection power must be the false-alarm rate, got {}",
            f["p_detect_at_zero_fault"]
        );
        assert!(
            (f["p_detect_at_mdb"].as_f64().unwrap() - (1.0 - p_md)).abs() < 1e-9,
            "power at the MDB must be 1 - P_md, got {}",
            f["p_detect_at_mdb"]
        );
        // Every axis' curve carries the same two endpoints.
        for ax in f["axes"].as_array().unwrap() {
            let curve = ax["detection_power_curve"].as_array().unwrap();
            let first = &curve[0];
            assert_eq!(first["fault_multiple_of_mdb"].as_f64().unwrap(), 0.0);
            assert_eq!(first["fault_magnitude"].as_f64().unwrap(), 0.0);
            assert!((first["p_detect"].as_f64().unwrap() - p_fa).abs() < 1e-9);
            let at_mdb = curve
                .iter()
                .find(|p| p["fault_multiple_of_mdb"].as_f64().unwrap() == 1.0)
                .expect("the curve samples the MDB itself");
            assert!((at_mdb["p_detect"].as_f64().unwrap() - (1.0 - p_md)).abs() < 1e-9);
            assert!(
                (at_mdb["fault_magnitude"].as_f64().unwrap()
                    - ax["minimum_detectable_bias"].as_f64().unwrap())
                .abs()
                    < 1e-12
            );
        }
    }

    /// The minimum detectable bias really is the non-central χ² inversion: feeding its
    /// non-centrality back through `noncentral_chi2_cdf` at the monitor's own threshold
    /// returns `P_md`.
    ///
    /// This is the round-trip that makes the MDB a claim rather than a label. It uses the
    /// threshold the monitor applied (`cross_modality_raim.chi2_threshold`), so an MDB
    /// stated against some other threshold cannot pass.
    #[test]
    fn the_minimum_detectable_bias_inverts_the_noncentral_chi2_tail_at_the_monitors_threshold() {
        let v = default_report();
        let f = &v["fault_injection"];
        let threshold = f["chi2_threshold"].as_f64().unwrap();
        let dof = f["dof"].as_f64().unwrap();
        let p_md = f["p_md"].as_f64().unwrap();
        // The threshold is the monitor's, not a re-derivation.
        assert_eq!(
            threshold,
            v["cross_modality_raim"]["chi2_threshold"].as_f64().unwrap()
        );
        assert_eq!(dof, 4.0);

        let lambda_star = f["noncentrality_at_mdb"].as_f64().unwrap();
        let back = noncentral_chi2_cdf(threshold, dof, lambda_star);
        assert!(
            (back - p_md).abs() < 1e-9,
            "noncentral_chi2_cdf(T={threshold}, dof={dof}, λ*={lambda_star}) = {back}, must be \
             P_md = {p_md}"
        );
        assert!(
            (f["pbias"].as_f64().unwrap() - lambda_star.sqrt()).abs() < 1e-12,
            "pbias must be √λ*"
        );

        for ax in f["axes"].as_array().unwrap() {
            let sigma = ax["sigma_separation"].as_f64().unwrap();
            let mdb = ax["minimum_detectable_bias"].as_f64().unwrap();
            // De-normalisation is exact: MDB = √λ*·σ_separation.
            assert!(
                (mdb / sigma - lambda_star.sqrt()).abs() < 1e-9,
                "{}: MDB/σ = {} vs √λ* = {}",
                ax["name"],
                mdb / sigma,
                lambda_star.sqrt()
            );
            // And the public helper reproduces it from first principles.
            let helper = minimum_detectable_bias(sigma, threshold, dof, p_md);
            assert!(
                (helper - mdb).abs() <= 1e-9 * mdb.abs(),
                "{}: helper {helper} vs report {mdb}",
                ax["name"]
            );
        }
    }

    /// A bias ACTUALLY injected into the RF estimate moves the monitor's own statistic by
    /// exactly the analytic non-centrality `b²/(σ_rf² + σ_opt²)`.
    ///
    /// This is the physics check, not a restatement: the injected entries come from
    /// re-running `run_cross_raim` with the bias written into the axis, and the expected
    /// value is recomputed here from the axis σ the report states. A wrong non-centrality
    /// (a factor of two, a missing σ_opt term, the wrong axis) fails here.
    #[test]
    fn an_injected_bias_shifts_the_monitor_statistic_by_exactly_the_analytic_noncentrality() {
        let v = default_report();
        let f = &v["fault_injection"];
        let fault_free = f["fault_free_chi2_statistic"].as_f64().unwrap();
        assert_eq!(fault_free, 0.0, "the nominal case is still fault-free");
        for ax in f["axes"].as_array().unwrap() {
            let sigma = ax["sigma_separation"].as_f64().unwrap();
            for inj in ax["injected"].as_array().unwrap() {
                let bias = inj["injected_bias"].as_f64().unwrap();
                let hand = (bias / sigma).powi(2);
                let realised = inj["realised_chi2_statistic"].as_f64().unwrap();
                assert!(
                    (realised - hand).abs() <= 1e-9 * hand.abs().max(1.0),
                    "{} at {}×MDB: monitor reported χ² {realised}, hand value b²/(σ_rf²+σ_opt²) \
                     = {hand}",
                    ax["name"],
                    inj["fault_multiple_of_mdb"]
                );
                assert!(
                    (inj["expected_noncentrality"].as_f64().unwrap() - hand).abs()
                        <= 1e-9 * hand.abs().max(1.0)
                );
            }
        }
    }

    /// A noise-free bias is caught above `√(T/λ*)·MDB` and missed below it — the
    /// deterministic crossing sits BELOW the statistical minimum detectable bias, and the
    /// injected ladder straddles it.
    ///
    /// The two numbers answer different questions and a paper that conflated them would
    /// over- or under-state the monitor by ~35 %. Measured, not assumed: the injected
    /// flags are whatever the monitor returned.
    #[test]
    fn a_noise_free_bias_is_caught_above_the_deterministic_crossing_and_missed_below_it() {
        let v = default_report();
        let f = &v["fault_injection"];
        let threshold = f["chi2_threshold"].as_f64().unwrap();
        let lambda_star = f["noncentrality_at_mdb"].as_f64().unwrap();
        let crossing = f["deterministic_detection_multiple_of_mdb"]
            .as_f64()
            .unwrap();
        assert!(
            (crossing - (threshold / lambda_star).sqrt()).abs() < 1e-12,
            "the crossing must be √(T/λ*)"
        );
        // MEASURED: the crossing is strictly inside the ladder's 0.5 / 1.0 bracket.
        assert!(
            (0.5..1.0).contains(&crossing),
            "deterministic crossing {crossing} is outside the injected ladder's bracket; the \
             ladder no longer demonstrates a miss and a catch"
        );
        for ax in f["axes"].as_array().unwrap() {
            for inj in ax["injected"].as_array().unwrap() {
                let m = inj["fault_multiple_of_mdb"].as_f64().unwrap();
                let detected = inj["fault_detected"].as_bool().unwrap();
                assert_eq!(
                    detected,
                    m > crossing,
                    "{} at {m}×MDB: monitor said detected={detected}, but the noise-free \
                     statistic crosses the threshold at {crossing}×MDB",
                    ax["name"]
                );
            }
        }
    }

    /// Detection power is non-decreasing in fault magnitude, and the curve is identical on
    /// every axis when magnitude is measured in multiples of that axis' own MDB.
    ///
    /// The second half is the reason the MDB is the right normalisation to publish: the
    /// monitor's power depends on the fault only through `λ = (b/σ_sep)²`, so one curve
    /// describes all four axes. Measured across the emitted curves rather than asserted
    /// from the algebra.
    #[test]
    fn detection_power_is_monotone_in_fault_magnitude_and_axis_invariant_in_mdb_multiples() {
        let v = default_report();
        let axes = v["fault_injection"]["axes"].as_array().unwrap();
        let reference: Vec<(f64, f64)> = axes[0]["detection_power_curve"]
            .as_array()
            .unwrap()
            .iter()
            .map(|p| {
                (
                    p["fault_multiple_of_mdb"].as_f64().unwrap(),
                    p["p_detect"].as_f64().unwrap(),
                )
            })
            .collect();
        assert!(reference.len() >= 8, "a curve of at least 8 points");
        for w in reference.windows(2) {
            assert!(w[1].0 > w[0].0, "multiples must increase");
            assert!(
                w[1].1 >= w[0].1,
                "detection power fell from {} at {}×MDB to {} at {}×MDB",
                w[0].1,
                w[0].0,
                w[1].1,
                w[1].0
            );
        }
        for ax in axes {
            let curve = ax["detection_power_curve"].as_array().unwrap();
            assert_eq!(curve.len(), reference.len());
            for (pt, (m, pd)) in curve.iter().zip(reference.iter()) {
                assert_eq!(pt["fault_multiple_of_mdb"].as_f64().unwrap(), *m);
                assert!(
                    (pt["p_detect"].as_f64().unwrap() - pd).abs() < 1e-15,
                    "{} deviates from the shared power curve at {m}×MDB",
                    ax["name"]
                );
            }
        }
    }

    /// **MONTE-CARLO CROSS-CHECK of the detection power.** Sampling the monitor statistic
    /// under a bias fault — three central normals plus one shifted by `√λ`, squared and
    /// summed — the empirical fraction exceeding the threshold matches the analytic
    /// non-central χ² tail the report publishes.
    ///
    /// The sweep lives here and NOT in the scenario: a sampled estimate would make the
    /// report slower and would not be reproducible bit-for-bit, and the analytic value is
    /// the better number to publish. This test is the evidence that the analytic value is
    /// the same number a sampled sweep would have produced.
    #[test]
    fn the_analytic_detection_power_matches_a_seeded_monte_carlo_of_the_monitor_statistic() {
        let v = default_report();
        let f = &v["fault_injection"];
        let threshold = f["chi2_threshold"].as_f64().unwrap();
        let dof = f["dof"].as_u64().unwrap() as usize;
        let n = 200_000usize;
        // Sample across the interesting part of the curve: a near-miss, the half-power
        // region, and the MDB itself.
        for m in [0.0_f64, 0.5, 0.65, 1.0] {
            let lambda = m * m * f["noncentrality_at_mdb"].as_f64().unwrap();
            let analytic = chi2_detection_power(threshold, dof as f64, lambda);
            let mut rng = ChaCha8Rng::seed_from_u64(0x5EED_0F15 ^ m.to_bits());
            let shift = lambda.sqrt();
            let mut hits: u64 = 0;
            for _ in 0..n {
                let mut stat = 0.0_f64;
                for axis in 0..dof {
                    let z: f64 = rng.sample(rand_distr::StandardNormal);
                    // The fault sits on one axis; the rest are fault-free.
                    let t = if axis == 0 { z + shift } else { z };
                    stat += t * t;
                }
                if stat > threshold {
                    hits += 1;
                }
            }
            let empirical = hits as f64 / n as f64;
            let se = (analytic * (1.0 - analytic) / n as f64).sqrt();
            assert!(
                (empirical - analytic).abs() < 4.0 * se + 2.0 / n as f64,
                "at {m}×MDB (λ={lambda}): sampled P_d {empirical} vs analytic {analytic}; \
                 4σ = {}",
                4.0 * se
            );
        }
    }

    /// **The monitor cannot detect a clock fault smaller than its own timing alert limit.**
    ///
    /// Pinned because it is the sharpest thing the new analysis says, and it is a
    /// weakness, not a feature: at the default 1e-5 / 1e-3 risk allocation the timing MDB
    /// is 24.6 ns against a 20 ns timing alert limit, so a clock bias can sit inside the
    /// missed-detection budget while the delivered time is already out of tolerance. The
    /// position axes have margin (MDB is 0.82 of their alert limit) and the ratio is the
    /// same on both because the vertical σ and the vertical alert limit are both 1.5× the
    /// horizontal.
    #[test]
    fn the_timing_minimum_detectable_bias_exceeds_the_timing_alert_limit() {
        let v = default_report();
        let f = &v["fault_injection"];
        let mdb_t = f["mdb_timing_s"].as_f64().unwrap();
        let al_t = v["cross_modality_raim"]["alert_limit_t_s"]
            .as_f64()
            .unwrap();
        assert!(
            mdb_t > al_t,
            "timing MDB {mdb_t} s vs alert limit {al_t} s -- if this ever becomes false the \
             monitor got better and the paper's caveat must be rewritten, not deleted"
        );
        let by_name = |n: &str| {
            f["axes"]
                .as_array()
                .unwrap()
                .iter()
                .find(|a| a["name"] == n)
                .unwrap()
                .clone()
        };
        assert!(by_name("clock")["mdb_exceeds_alert_limit"]
            .as_bool()
            .unwrap());
        for n in ["east", "north", "up"] {
            let a = by_name(n);
            assert!(!a["mdb_exceeds_alert_limit"].as_bool().unwrap());
            let ratio = a["mdb_over_alert_limit"].as_f64().unwrap();
            assert!(
                (ratio - 0.8200248).abs() < 1e-6,
                "{n}: MDB/alert-limit {ratio}"
            );
        }
        assert!(
            (by_name("clock")["mdb_over_alert_limit"].as_f64().unwrap() - 1.2300374).abs() < 1e-6
        );
    }

    /// The Wilson–Hilferty χ² quantile is NOT the threshold the monitor applies, so it is
    /// not used to state the minimum detectable bias.
    ///
    /// `detection::chi2_inv_cdf` is a cube-root-normal approximation; the monitor's own
    /// threshold comes from the exact `raim::chi2_quantile`. At the monitor's operating
    /// point the two differ by ~4 %, which would move the MDB by the same factor under the
    /// square root. This test measures the disagreement so the choice is recorded as a
    /// number rather than an opinion.
    #[test]
    fn the_wilson_hilferty_quantile_is_not_the_threshold_the_monitor_applies() {
        let v = default_report();
        let f = &v["fault_injection"];
        let exact = f["chi2_threshold"].as_f64().unwrap();
        let approx = crate::detection::chi2_inv_cdf(1.0 - f["p_fa"].as_f64().unwrap(), 4.0);
        let rel = (approx - exact).abs() / exact;
        assert!(
            rel > 0.03,
            "Wilson-Hilferty {approx} vs exact {exact} now agree to {rel}; if the \
             approximation has become exact at this operating point, revisit the choice"
        );
        assert!(
            rel < 0.10,
            "Wilson-Hilferty {approx} vs exact {exact} disagree by {rel}, far more than the \
             ~4% measured -- one of the two implementations has changed"
        );
    }

    /// The ramp figure is exactly `MDB / rate` and scales inversely with the rate.
    ///
    /// It is reported as a rate conversion and nothing more: the monitor has no epoch
    /// grid in this scenario, so there is no time series to grow a ramp along. The report
    /// says so in `ramp_note`; this pins the arithmetic and the note.
    #[test]
    fn the_ramp_time_to_detect_is_the_minimum_detectable_bias_divided_by_the_ramp_rate() {
        let v = default_report();
        let f = &v["fault_injection"];
        assert!(
            f["ramp_note"]
                .as_str()
                .unwrap()
                .contains("no epoch time series"),
            "the ramp note must state that the monitor has no time axis here"
        );
        for ax in f["axes"].as_array().unwrap() {
            let mdb = ax["minimum_detectable_bias"].as_f64().unwrap();
            let rate = ax["ramp_rate_per_s"].as_f64().unwrap();
            let t = ax["ramp_time_to_detect_s"].as_f64().unwrap();
            assert!(
                (t - mdb / rate).abs() <= 1e-9 * t,
                "{}: {t} vs {}",
                ax["name"],
                mdb / rate
            );
        }
        // Halving every ramp rate exactly doubles every time-to-detect.
        let slow = HybridOpticalRfScenario {
            fault_ramp_rate_pos_m_s: Some(0.025),
            fault_ramp_rate_clock_s_s: Some(0.5e-11),
            ..HybridOpticalRfScenario::default()
        };
        let (json, _) = slow.run_json().unwrap();
        let w: Value = serde_json::from_str(&json).unwrap();
        for (a, b) in f["axes"]
            .as_array()
            .unwrap()
            .iter()
            .zip(w["fault_injection"]["axes"].as_array().unwrap())
        {
            let fast = a["ramp_time_to_detect_s"].as_f64().unwrap();
            let halved = b["ramp_time_to_detect_s"].as_f64().unwrap();
            assert!(
                (halved / fast - 2.0).abs() < 1e-9,
                "{}: halving the rate gave {halved} from {fast}",
                a["name"]
            );
        }
        // A non-positive rate has no time-to-detect, and says so rather than printing 0.
        let stalled = HybridOpticalRfScenario {
            fault_ramp_rate_pos_m_s: Some(0.0),
            ..HybridOpticalRfScenario::default()
        };
        let (json, _) = stalled.run_json().unwrap();
        let w: Value = serde_json::from_str(&json).unwrap();
        assert!(w["fault_injection"]["axes"][0]["ramp_time_to_detect_s"].is_null());
    }

    // ---------------------------------------------------------------------------------
    // G17 -- post-handover variance re-growth.
    // ---------------------------------------------------------------------------------

    /// The coast starts from the covariance the handoff block actually reported.
    ///
    /// `HandoffOutcome` publishes only the scalar trace, so the coast replays each
    /// handover to recover the per-axis diagonal. If the replay ever drifted from the
    /// reported handoff the coast would be propagating a covariance nobody else saw, so
    /// the replayed trace is pinned to the reported trace exactly (not to a tolerance).
    #[test]
    fn the_post_handover_coast_starts_from_the_covariance_the_handoff_block_reported() {
        let v = default_report();
        let dirs = v["post_handover_coast"]["directions"].as_array().unwrap();
        assert_eq!(dirs.len(), 2);
        assert_eq!(dirs[0]["direction"], "optical_to_rf");
        assert_eq!(dirs[1]["direction"], "rf_to_optical");
        assert_eq!(
            dirs[0]["total_variance_after_handoff"].as_f64().unwrap(),
            v["handoff"]["variance_after_handoff"].as_f64().unwrap(),
            "forward coast must start from the reported post-handoff covariance"
        );
        assert_eq!(
            dirs[1]["total_variance_after_handoff"].as_f64().unwrap(),
            v["handoff_reverse"]["variance_after_handoff"]
                .as_f64()
                .unwrap(),
            "reverse coast must start from the reported post-handoff covariance"
        );
        // The position-only trace is now stated separately from the whole diagonal.
        for d in dirs {
            let pos = d["position_variance_after_handoff_m2"].as_f64().unwrap();
            let clk = d["clock_variance_after_handoff_s2"].as_f64().unwrap();
            let total = d["total_variance_after_handoff"].as_f64().unwrap();
            assert!((pos + clk - total).abs() <= 1e-12 * total.abs().max(1.0));
            assert!(pos > 0.0 && clk > 0.0);
        }
    }

    /// The reported coast time is the moment the covariance bound reaches the alert limit:
    /// just inside it the solution is protected, just outside it is not.
    ///
    /// Recomputed from the report alone — the handover σ, the process-noise PSD and the
    /// coverage factor it publishes — so the crossing cannot be a number the emitter
    /// simply printed.
    #[test]
    fn the_post_handover_solution_leaves_the_alert_limit_at_the_reported_time() {
        let v = default_report();
        let c = &v["post_handover_coast"];
        let q_pos = c["process_noise_position_psd_m2_s"].as_f64().unwrap();
        let k = c["coverage_k"].as_f64().unwrap();
        let al_h = c["alert_limit_h_m"].as_f64().unwrap();
        for d in c["directions"].as_array().unwrap() {
            assert!(d["inside_alert_limits_at_handover"].as_bool().unwrap());
            assert_eq!(d["binding_limit"], "horizontal");
            let t = d["time_inside_alert_limits_s"].as_f64().unwrap();
            assert_eq!(t, d["time_to_alert_limit_h_s"].as_f64().unwrap());
            assert!(t > 0.0 && t.is_finite());
            // Independent recomputation of the bound either side of the crossing.
            let p_h0 = d["sigma_h_at_handover_m"].as_f64().unwrap().powi(2);
            let bound = |tt: f64| k * (p_h0 + 2.0 * q_pos * tt).sqrt();
            assert!(
                bound(t * 0.999) < al_h,
                "{}: bound {} at 0.999t already exceeds {al_h}",
                d["direction"],
                bound(t * 0.999)
            );
            assert!(
                bound(t * 1.001) > al_h,
                "{}: bound {} at 1.001t is still inside {al_h}",
                d["direction"],
                bound(t * 1.001)
            );
            assert!((bound(t) - al_h).abs() < 1e-6 * al_h, "{}", d["direction"]);
            // The vertical and timing limits are reached later, which is why horizontal binds.
            assert!(d["time_to_alert_limit_v_s"].as_f64().unwrap() > t);
            assert!(d["time_to_alert_limit_t_s"].as_f64().unwrap() > t);
        }
    }

    /// The coast time scales exactly inversely with the process-noise PSD, and shortens
    /// when the alert limit tightens.
    ///
    /// Both are properties of the model, so both are measured rather than assumed: the
    /// inverse scaling is exact for a random walk because the numerator (the variance
    /// budget left to the limit) does not depend on `q`.
    #[test]
    fn the_post_handover_coast_time_scales_inversely_with_the_process_noise_psd() {
        let base = default_report();
        let t0 = base["post_handover_coast"]["time_inside_alert_limits_optical_to_rf_s"]
            .as_f64()
            .unwrap();
        let t0_rev = base["post_handover_coast"]["time_inside_alert_limits_rf_to_optical_s"]
            .as_f64()
            .unwrap();

        let quiet = HybridOpticalRfScenario {
            process_noise_pos_psd_m2_s: Some(0.5e-3),
            ..HybridOpticalRfScenario::default()
        };
        let (json, _) = quiet.run_json().unwrap();
        let w: Value = serde_json::from_str(&json).unwrap();
        let t1 = w["post_handover_coast"]["time_inside_alert_limits_optical_to_rf_s"]
            .as_f64()
            .unwrap();
        let t1_rev = w["post_handover_coast"]["time_inside_alert_limits_rf_to_optical_s"]
            .as_f64()
            .unwrap();
        assert!(
            (t1 / t0 - 2.0).abs() < 1e-9,
            "halving q_pos gave {t1} from {t0}"
        );
        assert!(
            (t1_rev / t0_rev - 2.0).abs() < 1e-9,
            "halving q_pos gave {t1_rev} from {t0_rev} on the reverse handover"
        );

        // A tighter horizontal alert limit is reached sooner.
        let tight = HybridOpticalRfScenario {
            alert_limit_h_m: Some(5.0),
            ..HybridOpticalRfScenario::default()
        };
        let (json, _) = tight.run_json().unwrap();
        let w: Value = serde_json::from_str(&json).unwrap();
        let t2 = w["post_handover_coast"]["time_inside_alert_limits_optical_to_rf_s"]
            .as_f64()
            .unwrap();
        assert!(
            t2 < t0,
            "a 5 m alert limit gave {t2}, not shorter than {t0}"
        );
    }

    /// With no process noise the coast never leaves the alert limit, and the report says
    /// so with `null` — not with a zero that would read as "left immediately".
    ///
    /// "Unknown is not zero", and neither is "never".
    #[test]
    fn a_coast_with_no_process_noise_reports_no_crossing_rather_than_a_zero_time() {
        let frozen = HybridOpticalRfScenario {
            process_noise_pos_psd_m2_s: Some(0.0),
            process_noise_clock_psd_s2_s: Some(0.0),
            ..HybridOpticalRfScenario::default()
        };
        let (json, _) = frozen.run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let c = &v["post_handover_coast"];
        assert!(c["time_inside_alert_limits_optical_to_rf_s"].is_null());
        assert!(c["time_inside_alert_limits_rf_to_optical_s"].is_null());
        for d in c["directions"].as_array().unwrap() {
            assert_eq!(d["binding_limit"], "none");
            assert!(d["time_to_alert_limit_h_s"].is_null());
            assert!(d["horizontal_variance_doubling_time_s"].is_null());
            assert!(d["inside_alert_limits_at_handover"].as_bool().unwrap());
            for s in d["profile"].as_array().unwrap() {
                assert!(s["inside_alert_limits"].as_bool().unwrap());
            }
        }
    }

    /// The emitted coast profile brackets the reported crossing: it starts inside every
    /// alert limit, ends outside, and flips exactly once.
    #[test]
    fn the_coast_profile_crosses_the_alert_limit_exactly_once_around_the_reported_time() {
        let v = default_report();
        for d in v["post_handover_coast"]["directions"].as_array().unwrap() {
            let t_cross = d["time_inside_alert_limits_s"].as_f64().unwrap();
            let samples = d["profile"].as_array().unwrap();
            assert!(samples.len() >= 5);
            assert_eq!(samples[0]["t_s"].as_f64().unwrap(), 0.0);
            assert!(samples[0]["inside_alert_limits"].as_bool().unwrap());
            assert!(!samples[samples.len() - 1]["inside_alert_limits"]
                .as_bool()
                .unwrap());
            let flips = samples
                .windows(2)
                .filter(|w| {
                    w[0]["inside_alert_limits"].as_bool().unwrap()
                        != w[1]["inside_alert_limits"].as_bool().unwrap()
                })
                .count();
            assert_eq!(
                flips, 1,
                "{}: profile flipped {flips} times",
                d["direction"]
            );
            for w in samples.windows(2) {
                if w[0]["inside_alert_limits"].as_bool().unwrap()
                    && !w[1]["inside_alert_limits"].as_bool().unwrap()
                {
                    let (a, b) = (w[0]["t_s"].as_f64().unwrap(), w[1]["t_s"].as_f64().unwrap());
                    assert!(
                        a <= t_cross && t_cross <= b,
                        "{}: crossing {t_cross} not bracketed by [{a}, {b}]",
                        d["direction"]
                    );
                }
            }
        }
    }

    /// The post-handover **variance doubling time** and the **alert-limit crossing time**
    /// are different quantities, and the report states both.
    ///
    /// After the tight optical stage the covariance is so small that it doubles in tens of
    /// microseconds, yet it takes ~29 minutes to reach the horizontal alert limit. Quoting
    /// the doubling time as "the time constant the solution stays usable for" would be
    /// wrong by eight orders of magnitude, so the two are pinned apart here.
    #[test]
    fn the_variance_doubling_time_and_the_alert_limit_crossing_time_are_not_the_same_number() {
        let v = default_report();
        let dirs = v["post_handover_coast"]["directions"].as_array().unwrap();
        let fwd = &dirs[0];
        let doubling = fwd["horizontal_variance_doubling_time_s"].as_f64().unwrap();
        let crossing = fwd["time_inside_alert_limits_s"].as_f64().unwrap();
        // MEASURED: the optical-tightened covariance doubles essentially instantly.
        assert!(
            doubling < 1e-3,
            "forward doubling time {doubling} s is no longer sub-millisecond"
        );
        assert!(
            crossing / doubling > 1e6,
            "crossing {crossing} s vs doubling {doubling} s: ratio {}",
            crossing / doubling
        );
        // The reverse handover leaves a much looser covariance, so there the two are
        // within an order of magnitude of each other -- the gap is not a constant.
        let rev = &dirs[1];
        let d_rev = rev["horizontal_variance_doubling_time_s"].as_f64().unwrap();
        let c_rev = rev["time_inside_alert_limits_s"].as_f64().unwrap();
        assert!(
            (1.0..10.0).contains(&(c_rev / d_rev)),
            "reverse crossing/doubling ratio {} left the measured band",
            c_rev / d_rev
        );
        // And the doubling time is exactly P(0)/q for the horizontal pair.
        let q_pos = v["post_handover_coast"]["process_noise_position_psd_m2_s"]
            .as_f64()
            .unwrap();
        for d in dirs {
            let p_h0 = d["sigma_h_at_handover_m"].as_f64().unwrap().powi(2);
            let expected = p_h0 / (2.0 * q_pos);
            let got = d["horizontal_variance_doubling_time_s"].as_f64().unwrap();
            assert!((got - expected).abs() <= 1e-9 * expected.max(1e-12));
        }
    }

    /// The tight optical modality buys coast time: leaving optical, the solution stays
    /// inside the alert limits longer than it does leaving RF.
    ///
    /// This is the service-level statement the handover analysis exists to make, and it is
    /// measured from the two directions the report already computed rather than argued.
    #[test]
    fn leaving_the_optical_modality_buys_more_coast_time_than_leaving_the_rf_modality() {
        let v = default_report();
        let c = &v["post_handover_coast"];
        let fwd = c["time_inside_alert_limits_optical_to_rf_s"]
            .as_f64()
            .unwrap();
        let rev = c["time_inside_alert_limits_rf_to_optical_s"]
            .as_f64()
            .unwrap();
        assert!(
            fwd > rev,
            "optical->RF coast {fwd} s must exceed RF->optical coast {rev} s: the optical \
             stage deflates the covariance further, so more of the variance budget is left"
        );
        // The difference is the RF-stage covariance divided by the horizontal growth rate.
        let q_pos = c["process_noise_position_psd_m2_s"].as_f64().unwrap();
        let p_rev = c["directions"][1]["sigma_h_at_handover_m"]
            .as_f64()
            .unwrap()
            .powi(2);
        let p_fwd = c["directions"][0]["sigma_h_at_handover_m"]
            .as_f64()
            .unwrap()
            .powi(2);
        let expected = (p_rev - p_fwd) / (2.0 * q_pos);
        assert!(
            ((fwd - rev) - expected).abs() < 1e-6,
            "coast-time gap {} vs the covariance gap it should equal {expected}",
            fwd - rev
        );
    }

    /// Both new blocks are described by the units block, headline scalars included.
    ///
    /// The generic units tests above prove every named field exists and carries a unit;
    /// this one proves the new quantities a paper would quote were actually NAMED, which
    /// is the part a new block silently omits.
    #[test]
    fn the_new_fault_injection_and_coast_quantities_are_named_in_the_units_block() {
        let v = default_report();
        let units = v["units"].as_object().unwrap();
        for f in [
            "fault_injection.chi2_threshold",
            "fault_injection.noncentrality_at_mdb",
            "fault_injection.pbias",
            "fault_injection.p_detect_at_zero_fault",
            "fault_injection.p_detect_at_mdb",
            "fault_injection.mdb_horizontal_m",
            "fault_injection.mdb_vertical_m",
            "fault_injection.mdb_timing_s",
            "fault_injection.axes",
            "post_handover_coast.process_noise_position_psd_m2_s",
            "post_handover_coast.process_noise_clock_psd_s2_s",
            "post_handover_coast.coverage_k",
            "post_handover_coast.time_inside_alert_limits_optical_to_rf_s",
            "post_handover_coast.time_inside_alert_limits_rf_to_optical_s",
            "post_handover_coast.directions",
        ] {
            assert!(units.contains_key(f), "{f} is not described in units");
        }
        assert_eq!(units["fault_injection.mdb_horizontal_m"]["unit"], "m");
        assert_eq!(units["fault_injection.mdb_timing_s"]["unit"], "s");
        assert_eq!(
            units["post_handover_coast.process_noise_position_psd_m2_s"]["unit"],
            "m^2/s"
        );
        assert_eq!(
            units["post_handover_coast.time_inside_alert_limits_optical_to_rf_s"]["unit"],
            "s"
        );
    }

    /// `random_walk_time_to_limit` distinguishes "already outside", "crosses at t" and
    /// "never crosses", and never returns a crossing for a non-growing variance.
    #[test]
    fn the_random_walk_crossing_separates_never_from_immediately() {
        // Grows into the limit: k·√(1 + 1·t) = 10 at t = 99.
        assert!((random_walk_time_to_limit(1.0, 1.0, 1.0, 10.0).unwrap() - 99.0).abs() < 1e-12);
        // Already outside at t = 0.
        assert_eq!(random_walk_time_to_limit(400.0, 1.0, 1.0, 10.0), Some(0.0));
        // Inside and not growing: never, which is not zero.
        assert_eq!(random_walk_time_to_limit(1.0, 0.0, 1.0, 10.0), None);
        assert_eq!(random_walk_time_to_limit(1.0, -1.0, 1.0, 10.0), None);
        // The coverage factor scales the bound, so doubling k quarters the budget.
        let t1 = random_walk_time_to_limit(0.0, 1.0, 1.0, 10.0).unwrap();
        let t2 = random_walk_time_to_limit(0.0, 1.0, 2.0, 10.0).unwrap();
        assert!((t1 / t2 - 4.0).abs() < 1e-12);
        // Non-finite inputs give no crossing rather than a bogus one.
        assert_eq!(random_walk_time_to_limit(f64::NAN, 1.0, 1.0, 10.0), None);
    }

    // ---------------------------------------------------------------------------------
    // G16 -- RF link availability, and the like-for-like ranging comparison.
    // ---------------------------------------------------------------------------------

    /// Helper: the report of an arbitrary scenario.
    fn report_of(scn: &HybridOpticalRfScenario) -> Value {
        let (json, _s) = scn.run_json().expect("run");
        serde_json::from_str(&json).unwrap()
    }

    /// The RF availability figure is exactly the product of the two indicators its rule
    /// names, each recomputed from the report's own margins -- not a number the emitter
    /// asserted.
    ///
    /// G16. The engine computed optical weather-limited availability and nothing at all
    /// on the RF side, and P5 dropped its RF availability figure as a result.
    #[test]
    fn the_rf_availability_is_the_product_of_the_two_indicators_its_rule_names() {
        let v = default_report();
        let r = &v["rf_availability"];

        // Each indicator is recomputed from the report's own margin, not read back.
        let margin = r["link_margin_db"].as_f64().unwrap();
        let cn0_margin = r["cn0_margin_db"].as_f64().unwrap();
        let i_closure = if margin >= 0.0 { 1.0 } else { 0.0 };
        let i_track = if cn0_margin >= 0.0 { 1.0 } else { 0.0 };
        assert_eq!(r["closure_indicator"].as_f64().unwrap(), i_closure);
        assert_eq!(r["tracking_indicator"].as_f64().unwrap(), i_track);
        assert_eq!(r["availability"].as_f64().unwrap(), i_closure * i_track);

        // …and the margins themselves are reconstructible from the report's own terms.
        let cfg = &v["rf_link_configuration"];
        let cn0 = r["cn0_dbhz"].as_f64().unwrap();
        let hand_cn0 = cfg["eirp_dbw"].as_f64().unwrap()
            - r["fsl_db"].as_f64().unwrap()
            - cfg["other_losses_db"].as_f64().unwrap()
            + cfg["g_over_t_db"].as_f64().unwrap()
            - crate::linkbudget::BOLTZMANN_DBW_PER_K_PER_HZ;
        assert!((cn0 - hand_cn0).abs() < 1e-9, "{cn0} vs {hand_cn0}");
        let hand_ebn0 = cn0 - 10.0 * cfg["data_rate_bps"].as_f64().unwrap().log10();
        assert!((r["eb_n0_db"].as_f64().unwrap() - hand_ebn0).abs() < 1e-9);
        assert!((margin - (hand_ebn0 - cfg["required_eb_n0_db"].as_f64().unwrap())).abs() < 1e-9);
        assert!(
            (cn0_margin - (cn0 - cfg["tracking_threshold_dbhz"].as_f64().unwrap())).abs() < 1e-9
        );

        // The factor rows carry the same values and each names its input's provenance.
        let factors = r["factors"].as_array().unwrap();
        assert_eq!(factors.len(), 2);
        assert_eq!(factors[0]["name"], "I_closure");
        assert_eq!(factors[0]["value"].as_f64().unwrap(), i_closure);
        assert_eq!(factors[1]["name"], "I_track");
        assert_eq!(factors[1]["value"].as_f64().unwrap(), i_track);
        for f in factors {
            assert!(
                crate::field_schema::ProvenanceClass::parse(f["provenance"].as_str().unwrap())
                    .is_some(),
                "each factor carries a provenance class from the closed vocabulary"
            );
            assert!(!f["source"].as_str().unwrap().is_empty());
            assert!(!f["condition"].as_str().unwrap().is_empty());
        }

        // It is an indicator, and the report says so rather than leaving it to be read
        // as a percentage beside the optical figure.
        assert_eq!(r["is_a_probability"], false);
        assert_eq!(r["comparable_to_optical_availability"], false);
        let a = r["availability"].as_f64().unwrap();
        assert!(a == 0.0 || a == 1.0, "a deterministic indicator, got {a}");
        // …and the optical one, at the same run, is NOT 0 or 1: the two really are
        // different kinds of number, which is the whole point of the warning.
        let a_opt = v["optical_availability"]["correlated_union"]
            .as_f64()
            .unwrap();
        assert!(a_opt > 0.0 && a_opt < 1.0, "optical availability {a_opt}");
    }

    /// The report says, in the entry a reader most likely lands on, that the RF figure is
    /// not the same kind of number as the optical one -- and no longer says the opposite.
    ///
    /// G16. The units block used to carry "no RF-availability counterpart is computed by
    /// this engine". That sentence became false the moment the block above landed, and a
    /// stale honesty note is worse than none.
    #[test]
    fn the_units_block_no_longer_claims_there_is_no_rf_counterpart() {
        let v = default_report();
        let note = v["units"]["optical_availability.single_site_mean"]["note"]
            .as_str()
            .unwrap();
        assert!(
            !note.contains("no RF-availability counterpart"),
            "the superseded asymmetry note is still standing: {note}"
        );
        assert!(note.contains("rf_availability.availability"));
        assert!(note.contains("DETERMINISTIC"));
        // The full statement lives on the block itself and names the missing input.
        let d = v["rf_availability"]["differs_from_optical"]
            .as_str()
            .unwrap();
        assert!(d.contains("WEATHER/CLIMATOLOGY-LIMITED"));
        assert!(d.contains("MARGIN/GEOMETRY-LIMITED"));
        let omitted = v["rf_availability"]["factors_not_included"]
            .as_array()
            .unwrap();
        let names: Vec<&str> = omitted
            .iter()
            .map(|o| o["name"].as_str().unwrap())
            .collect();
        assert!(names.contains(&"rf_outage_climatology"), "{names:?}");
        assert!(names.contains(&"geometric_visibility"), "{names:?}");
        for o in omitted {
            assert!(
                o["reason"].as_str().unwrap().len() > 60,
                "an omitted factor must say why"
            );
        }
    }

    /// The reported closure range is the range at which the link budget's own margin
    /// reaches zero -- re-run the budget there and the margin vanishes.
    ///
    /// The free-space loss is the only range-dependent term, so the closure range is also
    /// INDEPENDENT of the range the scenario happened to run at. That is measured here,
    /// not asserted: two runs four orders of magnitude apart in range report the same
    /// closure range to float round-off.
    #[test]
    fn the_rf_closure_range_is_where_the_reported_margin_reaches_zero() {
        let v = default_report();
        let r = &v["rf_availability"];
        let cfg = &v["rf_link_configuration"];
        let p = crate::linkbudget::LinkParams {
            band: crate::radiometric::Band::X,
            eirp_dbw: cfg["eirp_dbw"].as_f64().unwrap(),
            g_over_t_db: cfg["g_over_t_db"].as_f64().unwrap(),
            range_m: r["closure_range_km"].as_f64().unwrap() * 1000.0,
            data_rate_bps: cfg["data_rate_bps"].as_f64().unwrap(),
            other_losses_db: cfg["other_losses_db"].as_f64().unwrap(),
        };
        let at_closure =
            crate::linkbudget::link_budget(&p, cfg["required_eb_n0_db"].as_f64().unwrap());
        assert!(
            at_closure.margin_db.abs() < 1e-9,
            "margin at the reported closure range is {} dB, not 0",
            at_closure.margin_db
        );

        // Range-independence, measured across four decades.
        let near = report_of(&HybridOpticalRfScenario {
            range_km: Some(40.0),
            ..HybridOpticalRfScenario::default()
        });
        let a = r["closure_range_km"].as_f64().unwrap();
        let b = near["rf_availability"]["closure_range_km"]
            .as_f64()
            .unwrap();
        assert!(
            (a - b).abs() / a < 1e-12,
            "the closure range must not depend on the range the run sat at: {a} vs {b}"
        );
        // …while the utilisation, which does depend on it, moves by exactly the range ratio.
        let ua = r["range_utilisation"].as_f64().unwrap();
        let ub = near["rf_availability"]["range_utilisation"]
            .as_f64()
            .unwrap();
        let want = 384_000.0 / 40.0;
        assert!((ua / ub - want).abs() / want < 1e-9);
        assert_eq!(r["binding_constraint"], "eb_n0_closure");
    }

    /// An RF link that does not close reports availability 0 -- not a fraction, and not a
    /// silently omitted field.
    #[test]
    fn an_rf_link_that_does_not_close_reports_zero_and_says_which_constraint_bound() {
        let v = report_of(&HybridOpticalRfScenario {
            rf_eirp_dbw: Some(-40.0),
            ..HybridOpticalRfScenario::default()
        });
        let r = &v["rf_availability"];
        assert_eq!(r["closes"], false);
        assert_eq!(r["lock_status"], "LOST");
        assert_eq!(r["tracking_ok"], false);
        assert_eq!(r["closure_indicator"].as_f64().unwrap(), 0.0);
        assert_eq!(r["tracking_indicator"].as_f64().unwrap(), 0.0);
        assert_eq!(r["availability"].as_f64().unwrap(), 0.0);
        // Beyond the link's reach, so the utilisation is above 1 -- the continuous figure
        // still says how far beyond.
        assert!(r["range_utilisation"].as_f64().unwrap() > 1.0);
        assert!(
            r["max_range_km"].as_f64().unwrap()
                < v["link_configuration"]["range_km"].as_f64().unwrap()
        );
        // With the default (too loose) RF sigma the recomputed precision factor and the
        // released one coincide, because the RF fallback never met the grade anyway.
        let with_rf = r["precision_grade_with_rf_availability"].as_f64().unwrap();
        let released = v["joint_fom"]["precision_grade"].as_f64().unwrap();
        assert!((with_rf - released).abs() < 1e-12);

        // Now a run where the RF fallback DOES meet the grade: the recomputed factor
        // drops to exactly the optical availability when that fallback is unavailable.
        let tight = HybridOpticalRfScenario {
            rf_pos_sigma_m: Some(0.01),
            rf_clock_sigma_s: Some(1.0e-10),
            ..HybridOpticalRfScenario::default()
        };
        let up = report_of(&tight);
        let down = report_of(&HybridOpticalRfScenario {
            rf_eirp_dbw: Some(-40.0),
            ..tight.clone()
        });
        let a = up["optical_availability"]["correlated_union"]
            .as_f64()
            .unwrap();
        assert!(
            (up["rf_availability"]["precision_grade_with_rf_availability"]
                .as_f64()
                .unwrap()
                - 1.0)
                .abs()
                < 1e-12,
            "with a grade-meeting RF fallback that is available, P is 1"
        );
        assert!(
            (down["rf_availability"]["precision_grade_with_rf_availability"]
                .as_f64()
                .unwrap()
                - a)
                .abs()
                < 1e-12,
            "…and exactly A when that fallback is unavailable"
        );
        // The released joint-FoM factor is NOT moved by any of this (R1).
        assert_eq!(
            up["joint_fom"]["precision_grade"],
            down["joint_fom"]["precision_grade"]
        );
    }

    /// The ranging ratio is the two legs divided, both evaluated at the one common
    /// configuration the same object emits -- and that configuration is the scenario's own.
    ///
    /// G16. A ratio of two sigmas measured at different operating points is the error this
    /// campaign has already been burned by, so the operating point is emitted beside the
    /// ratio and checked here rather than trusted.
    #[test]
    fn the_ranging_ratio_is_the_two_legs_at_one_common_configuration() {
        let v = default_report();
        let c = &v["ranging_comparison"];
        let cc = &c["common_configuration"];

        // The common configuration IS the scenario's own, on both legs.
        assert_eq!(cc["range_km"], v["link_configuration"]["range_km"]);
        assert_eq!(
            cc["accumulation_time_s"],
            v["link_configuration"]["integration_s"]
        );
        assert_eq!(cc["optical_accumulation_s"], cc["accumulation_time_s"]);
        assert_eq!(cc["path"], "one-way");
        assert_eq!(cc["averaging_times_match"], true);
        assert_eq!(
            v["rf_link_configuration"]["range_km"], v["link_configuration"]["range_km"],
            "the RF leg must sit at the optical leg's range"
        );
        // The RF equivalent averaging time is 1/(2·B_L) and equals the optical one.
        let bl = c["rf_leg"]["dll_bandwidth_hz"].as_f64().unwrap();
        let t = cc["accumulation_time_s"].as_f64().unwrap();
        assert!(
            (cc["rf_equivalent_averaging_s"].as_f64().unwrap() - 1.0 / (2.0 * bl)).abs() < 1e-15
        );
        assert!((1.0 / (2.0 * bl) - t).abs() < 1e-12);

        // Both legs are a range and a time related by exactly c.
        for leg in ["optical_leg", "rf_leg"] {
            let sr = c[leg]["sigma_range_m"].as_f64().unwrap();
            let st = c[leg]["sigma_time_s"].as_f64().unwrap();
            assert!(
                (sr - crate::timegeo::C_M_PER_S * st).abs() / sr < 1e-12,
                "{leg}: {sr} m vs c*{st} s"
            );
            assert!(sr.is_finite() && sr > 0.0);
        }

        // The ratio is those two legs, and nothing else.
        let so = c["optical_leg"]["sigma_range_m"].as_f64().unwrap();
        let sr = c["rf_leg"]["sigma_range_m"].as_f64().unwrap();
        let ratio = c["optical_over_rf"].as_f64().unwrap();
        assert!((ratio - so / sr).abs() / ratio < 1e-15);
        assert!(
            (c["rf_over_optical"].as_f64().unwrap() - 1.0 / ratio).abs() * ratio < 1e-12,
            "the reciprocal must be the reciprocal"
        );
        assert!(
            (c["optical_advantage_db"].as_f64().unwrap() - 20.0 * (sr / so).log10()).abs() < 1e-9
        );
        assert_eq!(c["refused"], false);
        assert_eq!(c["refusal_reason"], "");

        // The RF leg reads the SAME link budget the availability block does, bit for bit.
        assert_eq!(c["rf_leg"]["cn0_dbhz"], v["rf_availability"]["cn0_dbhz"]);
    }

    /// **The like-for-like property, measured.** Both legs average over the same time, so
    /// quadrupling that time must halve BOTH sigmas and leave the ratio where it was. A
    /// leg secretly averaging over something else would move the ratio.
    #[test]
    fn the_ranging_ratio_is_invariant_to_the_common_accumulation_time() {
        let one = default_report();
        let four = report_of(&HybridOpticalRfScenario {
            integration_s: Some(4.0),
            ..HybridOpticalRfScenario::default()
        });
        let (a, b) = (&one["ranging_comparison"], &four["ranging_comparison"]);

        // Each leg falls as 1/√T: a 4× longer accumulation halves it.
        let so = |v: &Value| v["optical_leg"]["sigma_range_m"].as_f64().unwrap();
        let sr = |v: &Value| v["rf_leg"]["sigma_range_m"].as_f64().unwrap();
        assert!(
            (so(a) / so(b) - 2.0).abs() < 1e-12,
            "optical {}",
            so(a) / so(b)
        );
        assert!(
            (sr(a) / sr(b) - 2.0).abs() < 1e-7,
            "RF {} (the residual is the DLL squaring-loss term, not a scaling error)",
            sr(a) / sr(b)
        );
        // …so the ratio is unchanged. Measured: 3.19e-9 relative at the default link.
        let (ra, rb) = (
            a["optical_over_rf"].as_f64().unwrap(),
            b["optical_over_rf"].as_f64().unwrap(),
        );
        assert!(
            (rb - ra).abs() / ra < 1e-7,
            "the ratio moved by {} relative when only the common accumulation time changed",
            (rb - ra).abs() / ra
        );
    }

    /// A ratio at two different operating points is refused, with the reason stated --
    /// shipping one would be worse than shipping nothing.
    #[test]
    fn the_ranging_ratio_is_refused_when_the_legs_are_not_at_a_common_averaging_time() {
        let v = report_of(&HybridOpticalRfScenario {
            integration_s: Some(1.0),
            rf_dll_bandwidth_hz: Some(2.0),
            ..HybridOpticalRfScenario::default()
        });
        let c = &v["ranging_comparison"];
        assert_eq!(c["refused"], true);
        assert!(c["optical_over_rf"].is_null());
        assert!(c["rf_over_optical"].is_null());
        assert!(c["optical_advantage_db"].is_null());
        assert_eq!(c["common_configuration"]["averaging_times_match"], false);
        // 1/(2·2) = 0.25 s against a 1 s optical accumulation.
        assert!(
            (c["common_configuration"]["rf_equivalent_averaging_s"]
                .as_f64()
                .unwrap()
                - 0.25)
                .abs()
                < 1e-15
        );
        let why = c["refusal_reason"].as_str().unwrap();
        assert!(why.starts_with("REFUSED:"), "{why}");
        assert!(
            why.contains("0.25"),
            "the reason must name both times: {why}"
        );
        assert!(why.contains("common averaging time"), "{why}");
        // Both legs are still emitted -- the refusal withholds the RATIO, not the inputs.
        assert!(c["optical_leg"]["sigma_range_m"].as_f64().unwrap() > 0.0);
        assert!(c["rf_leg"]["sigma_range_m"].as_f64().unwrap() > 0.0);
        // …and no ratio is ever formed against the CHOSEN parametric RF sigma.
        assert!(c["ratio_against_chosen_rf_sigma_refused"]
            .as_str()
            .unwrap()
            .contains("carries no configuration"));
        assert_eq!(
            c["released_rf_position_sigma_m"],
            v["optical_link"]["rf_position_sigma_m"]
        );
    }

    /// The one-way comparison leg reconciles with the released two-way headline exactly,
    /// so the report cannot be read as carrying two disagreeing optical sigmas.
    #[test]
    fn the_one_way_comparison_leg_reconciles_with_the_released_two_way_headline() {
        // One-way run: the comparison leg IS the headline, and the factor is exactly 1.
        let one_way = report_of(&HybridOpticalRfScenario {
            two_way: Some(false),
            ..HybridOpticalRfScenario::default()
        });
        let c = &one_way["ranging_comparison"];
        assert_eq!(
            c["optical_leg"]["sigma_range_m"],
            one_way["optical_link"]["optical_ranging_sigma_m"]
        );
        assert_eq!(c["two_way_penalty_factor"].as_f64().unwrap(), 1.0);
        assert_eq!(
            c["released_two_way_optical_sigma_m"],
            one_way["optical_link"]["optical_ranging_sigma_m"]
        );

        // Two-way run: the factor is 0.5 / √(return-path geometric loss), recomputed from
        // the report's own geometric_loss_db rather than from the emitter.
        let v = default_report();
        let c = &v["ranging_comparison"];
        let g_db = v["optical_link"]["geometric_loss_db"].as_f64().unwrap();
        let return_factor = 10f64.powf(-g_db / 10.0);
        let hand = 0.5 / return_factor.sqrt();
        let got = c["two_way_penalty_factor"].as_f64().unwrap();
        assert!(
            (got - hand).abs() / hand < 1e-12,
            "two-way penalty {got} vs hand {hand}"
        );
        assert!(got > 1.0, "the two-way path costs precision, not buys it");
        // The bridge closes: released = factor × one-way leg.
        let released = v["optical_link"]["optical_ranging_sigma_m"]
            .as_f64()
            .unwrap();
        let leg = c["optical_leg"]["sigma_range_m"].as_f64().unwrap();
        assert!((released - got * leg).abs() / released < 1e-12);
        // …and the one-way photon count is the two-way one divided by the return factor.
        let n_one = c["optical_leg"]["detected_photons_one_way"]
            .as_f64()
            .unwrap();
        let n_two = v["optical_link"]["detected_photons"].as_f64().unwrap();
        assert!((n_two / n_one - return_factor).abs() / return_factor < 1e-12);
    }

    /// Every field the RF and ranging blocks emit is named in the units block, with a unit
    /// and a provenance class -- checked at a NON-default configuration too, because a
    /// gate that only ever sees the defaults is a gate on the defaults.
    #[test]
    fn every_new_rf_and_ranging_field_carries_a_unit_and_a_provenance_class() {
        for scn in [
            HybridOpticalRfScenario::default(),
            HybridOpticalRfScenario {
                wavelength_nm: Some(1064.0),
                tx_aperture_m: Some(0.30),
                rx_aperture_m: Some(1.20),
                range_km: Some(4000.0),
                integration_s: Some(4.0),
                pulse_rms_ps: Some(20.0),
                two_way: Some(false),
                rf_band: Some("ka".to_string()),
                rf_eirp_dbw: Some(34.0),
                rf_g_over_t_db: Some(40.0),
                rf_chip_rate_hz: Some(10.23e6),
                n_optical_sites: Some(3),
                ..HybridOpticalRfScenario::default()
            },
        ] {
            let v = report_of(&scn);
            let audit = crate::field_schema::audit_document(&v);
            assert!(
                audit.missing.is_empty(),
                "{} numeric fields carry no units entry: {:?}",
                audit.missing.len(),
                audit.missing
            );
            assert!(audit.malformed.is_empty(), "{:?}", audit.malformed);
            // …and the new blocks are genuinely in the covered set, not merely absent.
            for want in [
                "rf_availability.availability",
                "rf_availability.link_margin_db",
                "rf_availability.cn0_dbhz",
                "rf_availability.closure_range_km",
                "rf_availability.factors[].value",
                "rf_availability.precision_grade_with_rf_availability",
                "ranging_comparison.optical_over_rf",
                "ranging_comparison.optical_leg.sigma_range_m",
                "ranging_comparison.rf_leg.sigma_range_m",
                "ranging_comparison.two_way_penalty_factor",
                "rf_link_configuration.eirp_dbw",
                "rf_link_configuration.dll_bandwidth_hz",
            ] {
                let f = audit
                    .covered
                    .iter()
                    .find(|f| f.path == want)
                    .unwrap_or_else(|| panic!("{want} is not a described emitted field"));
                assert!(!f.unit.is_empty(), "{want} has an empty unit");
                assert!(
                    f.definition.as_deref().is_some_and(|d| d.len() > 20),
                    "{want} must state what the quantity is"
                );
            }
            // The converse direction: every units key still resolves to an emitted field.
            for field in v["units"].as_object().unwrap().keys() {
                let segs: Vec<&str> = field.split('.').collect();
                assert!(
                    units_path_resolves(&v, &segs),
                    "units names {field}, which the report does not emit"
                );
            }
        }
    }

    /// A malformed RF input is refused, not clamped into a number the report then states
    /// as if it had been asked for.
    #[test]
    fn a_malformed_rf_input_is_refused_rather_than_clamped() {
        for scn in [
            HybridOpticalRfScenario {
                rf_band: Some("l".to_string()),
                ..HybridOpticalRfScenario::default()
            },
            HybridOpticalRfScenario {
                rf_chip_rate_hz: Some(0.0),
                ..HybridOpticalRfScenario::default()
            },
            HybridOpticalRfScenario {
                rf_dll_bandwidth_hz: Some(-1.0),
                ..HybridOpticalRfScenario::default()
            },
            HybridOpticalRfScenario {
                rf_other_losses_db: Some(-2.0),
                ..HybridOpticalRfScenario::default()
            },
        ] {
            assert!(scn.run_json().is_err(), "a bad RF input must be refused");
        }
        // …and a legal band spelling of any case is accepted, at the band's own carrier.
        for (b, want_hz) in [("s", Band::S), ("X", Band::X), ("Ka", Band::Ka)] {
            let v = report_of(&HybridOpticalRfScenario {
                rf_band: Some(b.to_string()),
                ..HybridOpticalRfScenario::default()
            });
            assert_eq!(
                v["rf_link_configuration"]["band"],
                b.to_ascii_lowercase().as_str()
            );
            assert_eq!(
                v["rf_link_configuration"]["carrier_hz"].as_f64().unwrap(),
                band_frequency_hz(want_hz)
            );
        }
    }
}
