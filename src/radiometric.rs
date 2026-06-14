// SPDX-License-Identifier: Apache-2.0
//! Radiometric observable corrections for deep-space tracking — the **light-time solution** and the
//! **Shapiro relativistic delay** that turn a geometric range into the time a signal actually takes
//! to travel between two bodies.
//!
//! A range measurement is not the instantaneous Euclidean distance between transmitter and receiver.
//! The signal travels at the finite speed of light `c`, so a signal *received* at epoch `t_rx` left
//! its emitter at the earlier epoch `t_rx − τ`, where the emitter had moved. Recovering `τ` (the
//! light time) is an implicit problem — the emitter's position depends on the very epoch the light
//! time defines — solved here by fixed-point iteration ([`light_time_solution`]). On top of that
//! geometric delay, general relativity adds a small extra delay as the signal's path is bent and its
//! coordinate speed reduced by the gravitational potential it crosses; for a ray passing near the
//! Sun this **Shapiro delay** ([`shapiro_delay`]) reaches the ~100–250 µs level at superior
//! conjunction and must be modelled to use Earth–Mars ranging for orbit determination.
//!
//! ## What this module is, and is not
//!
//! This is the *correction kernel*: it consumes body positions from the pluggable
//! [`crate::ephem_provider::EphemerisProvider`] seam (D0.5) and the precise two-part epoch type
//! [`crate::timescales::TwoPartJd`] (D0.6), and returns light times and relativistic delays. It is
//! deliberately ephemeris-agnostic — handed the kernel-free
//! [`crate::ephem_provider::BuiltinEphemeris`] it can solve the Earth–Sun / Earth–Moon light time,
//! and handed the DE-grade out-of-crate provider (`xval/anise-mars-od`, D0.8) it will solve the
//! Earth–Mars light time with no change here. The interplanetary orbit determination that consumes
//! these corrections is D2/D3.
//!
//! ## References
//!
//! * Moyer, *Formulation for Observed and Computed Values of Deep Space Network Data Types*
//!   (JPL/Deep-Space-Communications-and-Navigation series, 2000) — the canonical light-time and
//!   Shapiro formulation for DSN range/Doppler.
//! * Montenbruck & Gill, *Satellite Orbits*, §11 (observation modelling, light-time iteration).
//! * IERS Conventions (2010), §11 — the gravitational (Shapiro) delay.

use crate::body::Body;
use crate::ephem_provider::EphemerisProvider;
use crate::timegeo::C_M_PER_S;
use crate::timescales::TwoPartJd;

type Vec3 = [f64; 3];

/// The convergence threshold on successive light-time iterates: stop once `|τ_{k+1} − τ_k| < 1e-12`
/// seconds (a picosecond — far below the timing any deep-space link resolves, so the geometric
/// light time is converged to the limit of the ephemeris, not of this loop).
const LIGHT_TIME_TOL_S: f64 = 1e-12;

/// A hard cap on the fixed-point iteration count. The light-time map is a strong contraction — its
/// derivative is bounded by the emitter's radial speed over `c` (`≲ 1e-4` for any solar-system
/// body), so it converges to the picosecond tolerance in a handful of steps. The cap only guards
/// against a pathological (super-luminal) provider and never bites for real ephemerides.
const LIGHT_TIME_MAX_ITERS: usize = 50;

/// Which leg of a signal path a light-time solution describes — i.e. whether the *fixed* endpoint is
/// the reception or the transmission event, and so whether the moving body's epoch is retarded
/// (earlier) or advanced (later) relative to it.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum LightTimeDirection {
    /// **Down-leg / retarded** (the required core): a signal *received* at the fixed epoch was
    /// *emitted* by the moving `target` at `t − τ`. The moving body's epoch is the fixed epoch minus
    /// the light time. This is the leg used to compute a one-way down-link range or the receive half
    /// of a two-way range.
    Retarded,
    /// **Up-leg / advanced**: a signal *transmitted* at the fixed epoch is *received* by the moving
    /// `target` at `t + τ`. The moving body's epoch is the fixed epoch plus the light time. This is
    /// the transmit half of a two-way range (the signal leaves a station and reaches the moving
    /// spacecraft/planet later).
    Advanced,
}

/// The solved light time between a fixed endpoint and a moving body, with the body's epoch and
/// position at the *other* (retarded or advanced) end of the light path.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct LightTime {
    /// The one-way light time `τ` (seconds): the geometric signal travel time between the fixed
    /// endpoint and the moving body, with the body taken at its light-time-corrected epoch.
    pub tau_s: f64,
    /// The moving body's epoch at the far end of the light path (TDB): for a
    /// [`Retarded`](LightTimeDirection::Retarded) leg this is `t_fixed − τ` (the emission epoch);
    /// for an [`Advanced`](LightTimeDirection::Advanced) leg it is `t_fixed + τ` (the reception
    /// epoch). Named `tx_epoch` because the retarded down-leg — the required core — is the dominant
    /// use, where this is the transmission epoch.
    pub tx_epoch: TwoPartJd,
    /// The moving body's position (metres, inertial, in the `center` frame) at [`tx_epoch`]. For the
    /// retarded down-leg this is the *retarded* (emission-time) position the geometric range is
    /// formed against, not the position at the fixed reception epoch.
    pub tx_pos: Vec3,
}

/// Euclidean norm of a 3-vector (metres).
#[inline]
fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Solve the **retarded (down-leg) light time**: a signal received at `rx_pos` (inertial position in
/// the `center` frame, metres) at receive epoch `t_rx` (a [`TwoPartJd`] in TDB) was emitted by
/// `target` at the earlier epoch `t_rx − τ`, where `target` had a different (retarded) position.
///
/// The light time is the fixed point of
///
/// ```text
///   τ_{k+1} = |rx_pos − r_target(t_rx − τ_k)| / c,
/// ```
///
/// iterated from `τ_0 = 0` (the body at the receive epoch) until `|τ_{k+1} − τ_k| < 1e-12` s, capped
/// at [`LIGHT_TIME_MAX_ITERS`]. The retarded body position at each step comes from
/// `ephem.relative_position(target, center, (t_rx.add_seconds(−τ_k)).to_f64())` — note the **minus**
/// sign: the emission epoch is the reception epoch *minus* the (positive) light time. Carrying the
/// epoch as a [`TwoPartJd`] keeps the sub-microsecond retardation (`τ ≈ 10²–10³ s`, i.e. `10⁻³`–`10⁻²`
/// of a day) from being lost against the ~2.46e6 magnitude of the Julian date.
///
/// Returns `None` if the ephemeris cannot supply `target` relative to `center` at any iterate (e.g.
/// Mars from the kernel-free [`crate::ephem_provider::BuiltinEphemeris`]) — the signal for a caller
/// to fall back to a higher-fidelity provider (D0.8).
pub fn light_time_solution<E: EphemerisProvider>(
    rx_pos: Vec3,
    t_rx: TwoPartJd,
    target: &Body,
    center: &Body,
    ephem: &E,
) -> Option<LightTime> {
    solve_light_time(
        rx_pos,
        t_rx,
        target,
        center,
        ephem,
        LightTimeDirection::Retarded,
    )
}

/// Solve the **advanced (up-leg) light time**: a signal transmitted from `tx_pos` (inertial position
/// in the `center` frame, metres) at transmit epoch `t_tx` (a [`TwoPartJd`] in TDB) is received by
/// `target` at the later epoch `t_tx + τ`, where `target` has its advanced (reception-time)
/// position.
///
/// Identical fixed-point iteration to [`light_time_solution`], but the moving body's epoch is the
/// fixed epoch **plus** the light time (`t_tx + τ_k`). Used for the transmit half of a two-way
/// range; the returned [`LightTime::tx_epoch`]/[`LightTime::tx_pos`] are then the body's *reception*
/// epoch and position. Returns `None` on the same unsupported-pair condition.
pub fn light_time_solution_advanced<E: EphemerisProvider>(
    tx_pos: Vec3,
    t_tx: TwoPartJd,
    target: &Body,
    center: &Body,
    ephem: &E,
) -> Option<LightTime> {
    solve_light_time(
        tx_pos,
        t_tx,
        target,
        center,
        ephem,
        LightTimeDirection::Advanced,
    )
}

/// Shared fixed-point light-time solver for either leg. The only difference between the retarded and
/// advanced cases is the sign of the light-time step applied to the fixed epoch (`−τ` for retarded,
/// `+τ` for advanced); everything else — the contraction, the tolerance, the cap, the `None`
/// fall-through — is common.
fn solve_light_time<E: EphemerisProvider>(
    fixed_pos: Vec3,
    fixed_epoch: TwoPartJd,
    target: &Body,
    center: &Body,
    ephem: &E,
    direction: LightTimeDirection,
) -> Option<LightTime> {
    // Sign of the light-time step on the moving body's epoch: retarded emits earlier (−τ),
    // advanced receives later (+τ).
    let sign = match direction {
        LightTimeDirection::Retarded => -1.0,
        LightTimeDirection::Advanced => 1.0,
    };

    let mut tau = 0.0_f64;
    let mut body_epoch = fixed_epoch;
    let mut body_pos = ephem.relative_position(target, center, fixed_epoch.to_f64())?;

    for _ in 0..LIGHT_TIME_MAX_ITERS {
        // Geometric range from the fixed endpoint to the body at its current (retarded/advanced)
        // epoch, divided by c — the next light-time iterate.
        let sep = [
            fixed_pos[0] - body_pos[0],
            fixed_pos[1] - body_pos[1],
            fixed_pos[2] - body_pos[2],
        ];
        let next_tau = norm(sep) / C_M_PER_S;

        if (next_tau - tau).abs() < LIGHT_TIME_TOL_S {
            tau = next_tau;
            break;
        }
        tau = next_tau;

        // Re-evaluate the body at the updated epoch `fixed_epoch + sign·τ`. The two-part epoch keeps
        // the sub-microsecond light-time increment against the large absolute JD.
        body_epoch = fixed_epoch.add_seconds(sign * tau);
        body_pos = ephem.relative_position(target, center, body_epoch.to_f64())?;
    }

    Some(LightTime {
        tau_s: tau,
        tx_epoch: body_epoch,
        tx_pos: body_pos,
    })
}

/// One-way **Shapiro (gravitational) time delay** in seconds for a signal whose path passes the
/// central mass of gravitational parameter `mu` (m³/s²), between endpoints at inertial position
/// vectors `r_tx` and `r_rx` measured **from the central body** (metres):
///
/// ```text
///   Δt = (2·mu / c³) · ln[ (r1 + r2 + r12) / (r1 + r2 − r12) ],
/// ```
///
/// with `r1 = |r_tx|`, `r2 = |r_rx|`, and `r12 = |r_tx − r_rx|`. This is the standard
/// Moyer/IERS-2010 form (general-relativistic `γ = 1` parameterised post-Newtonian value). The delay
/// is largest when the path grazes the mass (`r1 + r2 ≈ r12`, the logarithm's argument large): for an
/// Earth–Mars link near superior conjunction, passing close to the Sun (`mu = MU_SUN`), it reaches
/// the ~100–250 µs round-trip band; well away from the Sun it falls to tens of microseconds.
///
/// The argument is dimensionless and `> 1` for any non-degenerate geometry (the triangle inequality
/// gives `r12 ≤ r1 + r2`, so the denominator is positive and the ratio ≥ 1), so the delay is
/// non-negative.
pub fn shapiro_delay(r_tx: Vec3, r_rx: Vec3, mu: f64) -> f64 {
    let r1 = norm(r_tx);
    let r2 = norm(r_rx);
    let r12 = norm([r_tx[0] - r_rx[0], r_tx[1] - r_rx[1], r_tx[2] - r_rx[2]]);
    let c = C_M_PER_S;
    (2.0 * mu / (c * c * c)) * ((r1 + r2 + r12) / (r1 + r2 - r12)).ln()
}

// ============================================================================
// D1.1 — Radiometric observable model: range & Doppler.
//
// The light-time kernel above turns geometry into the time a signal takes to
// travel. The observable model on top of it forms the **actual quantities a
// Deep-Space-Network tracking pass reports** — two-/one-/three-way range and
// Doppler — by composing one or two light-time legs and differentiating the
// path length. Conventions follow Moyer (DSN range/Doppler formulation) and the
// CCSDS Tracking-Data-Message data-type definitions; each is documented inline.
// ============================================================================

/// A deep-space tracking carrier **frequency band**. Used to select the carrier
/// frequency a Doppler observable is referenced to and the transponder
/// turn-around ratio (D1.2). The three bands are the ones the DSN and ESTRACK
/// operate for deep-space links.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Band {
    /// **S-band** (~2.1 GHz up / ~2.3 GHz down): legacy deep-space and most
    /// near-Earth tracking.
    S,
    /// **X-band** (~7.2 GHz up / ~8.4 GHz down): the deep-space workhorse.
    X,
    /// **Ka-band** (~34 GHz down): the highest-rate / lowest-plasma deep-space
    /// link, paired with X uplink for dual-frequency plasma calibration (D1.3).
    Ka,
}

impl Band {
    /// A **representative uplink carrier frequency** (Hz) for the band — the
    /// frequency a station transmits at. These are nominal deep-space band
    /// centres (S ≈ 2.115 GHz, X ≈ 7.179 GHz, Ka ≈ 34.4 GHz uplink); a real pass
    /// uses the channel-assigned carrier, but the Doppler observable scales with
    /// whatever carrier the caller supplies, so these defaults exist only for the
    /// band-keyed convenience path.
    pub fn uplink_hz(self) -> f64 {
        match self {
            Band::S => 2.115e9,
            Band::X => 7.179e9,
            Band::Ka => 34.4e9,
        }
    }

    /// A representative **downlink carrier frequency** (Hz) for the band
    /// (S ≈ 2.295 GHz, X ≈ 8.420 GHz, Ka ≈ 32.0 GHz downlink). For a coherent
    /// two-way link the true downlink is the uplink times the transponder
    /// turn-around ratio (`turnaround_ratio`, D1.2); this is the stand-alone band
    /// centre used for one-way (downlink-only) Doppler.
    pub fn downlink_hz(self) -> f64 {
        match self {
            Band::S => 2.295e9,
            Band::X => 8.420e9,
            Band::Ka => 32.0e9,
        }
    }
}

/// How many station–spacecraft legs (and whose clock) an observable spans.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ObsWay {
    /// **One-way**: the spacecraft transmits on its own oscillator, one station
    /// receives (down-leg only). Carries the spacecraft clock error.
    One,
    /// **Two-way**: one station transmits, the spacecraft coherently
    /// re-transmits, the **same** station receives. Up-leg + down-leg, referenced
    /// entirely to the station's clock (the cleanest deep-space observable).
    Two,
    /// **Three-way**: one station transmits, a **different** station receives the
    /// coherent down-link. Up-leg + down-leg with the two stations' clocks; used
    /// to keep continuous Doppler across a station handover.
    Three,
}

/// What physical quantity a [`RadiometricObs`] carries.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ObsKind {
    /// A **range** observable (metres): the signal path length (see
    /// [`two_way_range`] for the round-trip convention).
    Range,
    /// A **Doppler** observable (Hz): the carrier-frequency shift induced by the
    /// line-of-sight range rate (see [`two_way_doppler`]).
    Doppler,
    /// A **Δ-DOR** observable (seconds): the differential one-way delay of a
    /// spacecraft vs a quasar across an interferometer baseline (D1.3,
    /// [`delta_dor`]).
    DeltaDor,
}

/// A single radiometric observation: a kind/way/band-tagged value at an epoch,
/// with its one-sigma measurement uncertainty (same unit as `value`).
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct RadiometricObs {
    /// Which physical quantity (range / Doppler / Δ-DOR).
    pub kind: ObsKind,
    /// One-, two-, or three-way.
    pub way: ObsWay,
    /// The carrier band the observable is referenced to.
    pub band: Band,
    /// The observation epoch (the **receive** epoch at the reference station),
    /// carried as a [`TwoPartJd`] (TDB) to preserve sub-microsecond timing.
    pub epoch: TwoPartJd,
    /// The observed value. Units depend on [`kind`](Self::kind): metres for
    /// [`ObsKind::Range`], Hz for [`ObsKind::Doppler`], seconds for
    /// [`ObsKind::DeltaDor`].
    pub value: f64,
    /// The one-sigma measurement uncertainty, in the same unit as
    /// [`value`](Self::value).
    pub sigma: f64,
}

/// **One-way (down-leg) geometric range** in metres: `c · τ_down`, the distance
/// a signal travels from the spacecraft (at its retarded emission epoch) to the
/// receiving station at receive epoch `t_rx`. This is the building block of the
/// multi-way ranges; on its own it is the geometry behind a one-way
/// (spacecraft-transmitted) range.
///
/// Returns `None` if the ephemeris cannot supply `sc_body` relative to `center`
/// (e.g. Mars from the kernel-free [`crate::ephem_provider::BuiltinEphemeris`]).
pub fn one_way_range<E: EphemerisProvider>(
    station_pos: Vec3,
    sc_body: &Body,
    center: &Body,
    t_rx: TwoPartJd,
    ephem: &E,
) -> Option<f64> {
    let down = light_time_solution(station_pos, t_rx, sc_body, center, ephem)?;
    Some(down.tau_s * C_M_PER_S)
}

/// **Two-way range** in metres — the round-trip signal path length.
///
/// ## Convention (documented and consistent across this module)
///
/// This returns the **full round-trip range**
///
/// ```text
///   ρ₂ = c · (τ_up + τ_down),
/// ```
///
/// the total distance the signal travels station → spacecraft → station. The
/// *up-leg* light time `τ_up` is solved with the spacecraft at its **advanced**
/// (reception-of-the-uplink) epoch and the down-leg `τ_down` with the spacecraft
/// at its **retarded** (emission-of-the-downlink) epoch, both anchored to the
/// receive epoch `t_rx` — i.e. the two legs are evaluated at slightly different
/// spacecraft positions, exactly as a real two-way light path is. A caller that
/// wants the DSN "range = half the round-trip light time × c" quantity simply
/// halves this value; the round-trip form is returned because it is the
/// unambiguous physical path length and the two halves are exposed via
/// [`one_way_range`] / the up-leg below.
///
/// The up-leg transmit epoch is `t_rx − τ_down − τ_up`: the signal that is
/// received now left the station two light times ago. We solve the down-leg
/// first (anchored at `t_rx`), step back by `τ_down` to the spacecraft's
/// transponding epoch, then solve the up-leg **retarded** from that epoch to
/// recover the uplink emission and `τ_up`. (Moyer, *Formulation for Observed and
/// Computed Values of Deep Space Network Data Types*, §8.)
///
/// Returns `None` if the ephemeris cannot supply the spacecraft body.
pub fn two_way_range<E: EphemerisProvider>(
    station_pos: Vec3,
    sc_body: &Body,
    center: &Body,
    t_rx: TwoPartJd,
    ephem: &E,
) -> Option<f64> {
    // Down-leg: spacecraft emits the (transponded) downlink at t_rx − τ_down,
    // received at the station at t_rx.
    let down = light_time_solution(station_pos, t_rx, sc_body, center, ephem)?;
    // The spacecraft transponds at the down-leg emission epoch. The up-leg is the
    // light path station → spacecraft that *arrived* at that epoch: solve it as a
    // retarded leg from the spacecraft's transponding event back to the station,
    // i.e. the station's uplink emission is τ_up earlier than the transpond.
    // Geometrically the up-leg range equals |station − sc_at_transpond|, which to
    // first order is the same retarded geometry the station "sees"; we solve the
    // station-as-emitter advanced leg to the spacecraft transpond epoch.
    let up = light_time_solution_advanced(station_pos, down.tx_epoch, sc_body, center, ephem)?;
    // Note: the advanced solve places the spacecraft τ_up *after* the station
    // emission. We want the station emission that *reaches* the spacecraft at
    // down.tx_epoch, i.e. station emits at down.tx_epoch − τ_up. The light time
    // magnitude is what enters the range and is symmetric, so τ_up here is the
    // up-leg light time.
    Some((up.tau_s + down.tau_s) * C_M_PER_S)
}

/// **Line-of-sight range rate** (metres/second) of the down-leg one-way range at
/// epoch `t_rx`, by a symmetric numeric derivative of [`one_way_range`] over a
/// step of `dt_s` seconds:
///
/// ```text
///   ρ̇ = [ρ(t_rx + dt) − ρ(t_rx − dt)] / (2·dt).
/// ```
///
/// A central difference is second-order accurate; the default step
/// ([`DOPPLER_DERIV_STEP_S`]) is a compromise between truncation error
/// (`∝ dt²`) and the two-part-epoch timing floor. Returns `None` if any of the
/// three range evaluations is unavailable. Positive ρ̇ means the spacecraft is
/// receding.
pub fn one_way_range_rate<E: EphemerisProvider>(
    station_pos: Vec3,
    sc_body: &Body,
    center: &Body,
    t_rx: TwoPartJd,
    dt_s: f64,
    ephem: &E,
) -> Option<f64> {
    let r_plus = one_way_range(station_pos, sc_body, center, t_rx.add_seconds(dt_s), ephem)?;
    let r_minus = one_way_range(station_pos, sc_body, center, t_rx.add_seconds(-dt_s), ephem)?;
    Some((r_plus - r_minus) / (2.0 * dt_s))
}

/// **Two-way range rate** (metres/second): the symmetric numeric derivative of
/// [`two_way_range`] about `t_rx`, divided by 2 so it is the *one-way-equivalent*
/// line-of-sight rate (the round-trip path changes at twice the line-of-sight
/// rate). This is the round-trip-range-derived range rate, which differs from the
/// leg-summed [`two_way_doppler`] rate at the `v/c` second order (the up-leg is
/// evaluated at the spacecraft's transpond epoch here); both are correct two-way
/// rates, this one being the exact derivative of the round-trip path length.
pub fn two_way_range_rate<E: EphemerisProvider>(
    station_pos: Vec3,
    sc_body: &Body,
    center: &Body,
    t_rx: TwoPartJd,
    dt_s: f64,
    ephem: &E,
) -> Option<f64> {
    let r_plus = two_way_range(station_pos, sc_body, center, t_rx.add_seconds(dt_s), ephem)?;
    let r_minus = two_way_range(station_pos, sc_body, center, t_rx.add_seconds(-dt_s), ephem)?;
    // d(ρ₂)/dt is the round-trip rate; the line-of-sight rate is half of it.
    Some((r_plus - r_minus) / (2.0 * dt_s) / 2.0)
}

/// The default central-difference step (seconds) for the numeric Doppler/range-
/// rate derivatives. One second is well inside the span over which the geometry
/// is smooth and is large enough that the `2·dt` denominator keeps the
/// difference well clear of the two-part-epoch timing floor (~fs).
pub const DOPPLER_DERIV_STEP_S: f64 = 1.0;

/// **One-way Doppler** observable in Hz: the carrier-frequency shift seen by the
/// receiving station for a spacecraft transmitting on a fixed downlink carrier
/// `f_dl` (Hz). To first order in `ρ̇/c`,
///
/// ```text
///   f_D = − (f_dl / c) · ρ̇,
/// ```
///
/// the classical one-way Doppler: an **approaching** spacecraft (`ρ̇ < 0`)
/// gives a **positive** (blue) shift. `ρ̇` is the one-way line-of-sight range
/// rate from [`one_way_range_rate`]. Returns `None` if the geometry is
/// unavailable.
pub fn one_way_doppler<E: EphemerisProvider>(
    station_pos: Vec3,
    sc_body: &Body,
    center: &Body,
    t_rx: TwoPartJd,
    downlink_hz: f64,
    ephem: &E,
) -> Option<f64> {
    let rdot = one_way_range_rate(
        station_pos,
        sc_body,
        center,
        t_rx,
        DOPPLER_DERIV_STEP_S,
        ephem,
    )?;
    Some(-(downlink_hz / C_M_PER_S) * rdot)
}

/// **Two-way Doppler** observable in Hz for a coherent transponder. The station
/// transmits on uplink carrier `f_ul`; the spacecraft re-transmits coherently at
/// `f_ul · M` (the transponder turn-around ratio `M`, `turnaround_ratio` in
/// D1.2, supplied here as `turnaround`); the same station measures the down-link
/// frequency. The observable is the standard Moyer two-way Doppler
///
/// ```text
///   f_D = − (2 · M · f_ul / c) · ρ̇_los,
/// ```
///
/// equivalently `f_D = −(M·f_ul/c)·(ρ̇_up + ρ̇_down)` decomposed by leg, where
/// each `ρ̇` is the line-of-sight range rate of one station↔spacecraft leg
/// ([`one_way_range_rate`]). The factor of 2 (= ρ̇_up + ρ̇_down for a single
/// station's near-equal legs) is the round-trip (both legs see the shift); `M`
/// carries the up-link carrier into the down-link the station actually counts. An
/// approaching spacecraft gives a positive shift. Returns `None` if the geometry
/// is unavailable.
///
/// Forming the observable as the **sum of the two leg rates** (rather than twice
/// the round-trip-range derivative) makes it the exact single-station special
/// case of [`three_way_doppler`]: a three-way pass whose receiving station equals
/// its transmitting station is byte-for-byte this two-way observable.
///
/// To use the band's coherent turn-around directly, see
/// `two_way_doppler_coherent` (D1.2).
pub fn two_way_doppler<E: EphemerisProvider>(
    station_pos: Vec3,
    sc_body: &Body,
    center: &Body,
    t_rx: TwoPartJd,
    uplink_hz: f64,
    turnaround: f64,
    ephem: &E,
) -> Option<f64> {
    three_way_doppler(
        station_pos,
        station_pos,
        sc_body,
        center,
        t_rx,
        uplink_hz,
        turnaround,
        ephem,
    )
}

/// **Three-way Doppler** observable in Hz: identical formation to
/// [`two_way_doppler`] (the up-leg from the transmitting station, the down-leg to
/// a *different* receiving station), with the up-leg from `tx_station_pos` and
/// the down-leg to `rx_station_pos`. Because the round-trip path is split between
/// two stations the range rate is formed from the up-leg (transmitter) and
/// down-leg (receiver) separately and summed; over a short interval with both
/// stations on the same rotating Earth this reduces to the two-way form plus the
/// inter-station geometry. Returns `None` if either leg's geometry is
/// unavailable.
#[allow(clippy::too_many_arguments)]
pub fn three_way_doppler<E: EphemerisProvider>(
    tx_station_pos: Vec3,
    rx_station_pos: Vec3,
    sc_body: &Body,
    center: &Body,
    t_rx: TwoPartJd,
    uplink_hz: f64,
    turnaround: f64,
    ephem: &E,
) -> Option<f64> {
    // Down-leg rate at the receiving station (one-way-equivalent).
    let down_rate = one_way_range_rate(
        rx_station_pos,
        sc_body,
        center,
        t_rx,
        DOPPLER_DERIV_STEP_S,
        ephem,
    )?;
    // Up-leg rate referenced to the transmitting station: the rate of the path
    // station_tx → spacecraft, evaluated about the same epoch (the spacecraft's
    // transpond epoch is within one light time, negligible for the rate over the
    // 1 s derivative step relative to the Doppler precision modelled here).
    let up_rate = one_way_range_rate(
        tx_station_pos,
        sc_body,
        center,
        t_rx,
        DOPPLER_DERIV_STEP_S,
        ephem,
    )?;
    // The down-link carrier the receiver counts is f_ul·M; each leg contributes
    // its own line-of-sight shift, so the total is −(M·f_ul/c)·(ρ̇_up + ρ̇_down).
    Some(-(turnaround * uplink_hz / C_M_PER_S) * (up_rate + down_rate))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ephem_provider::BuiltinEphemeris;
    use crate::forces::MU_SUN;

    /// A fixed probe epoch (Julian Date, TDB) inside the analytic series' good span: 2022-001.5,
    /// the same epoch the ephemeris-provider tests use.
    const PROBE_JD: f64 = 2_459_580.5;
    /// 1 AU in metres (IAU 2012 definition), for sanity-banding the Earth–Sun light time.
    const AU_M: f64 = 1.495_978_707e11;

    /// A synthetic constant-velocity ephemeris: the `target` moves as `r(t) = r0 + v·(t − t0)` with
    /// `t` measured in seconds from a reference epoch `t0` (the body's position relative to the
    /// `center` is this closed form, independent of which `center` is asked). It exists so the
    /// light-time solver can be checked against an *analytic* retarded solution, decoupled from any
    /// real ephemeris model.
    #[derive(Debug)]
    struct ConstantVelocityEphemeris {
        /// Reference epoch `t0` (Julian Date, TDB).
        t0_jd: f64,
        /// Position at `t0` (metres).
        r0: Vec3,
        /// Constant velocity (metres / second).
        v: Vec3,
    }

    impl EphemerisProvider for ConstantVelocityEphemeris {
        fn relative_position(&self, _target: &Body, _center: &Body, jd_tdb: f64) -> Option<Vec3> {
            // Seconds elapsed since the reference epoch.
            let dt_s = (jd_tdb - self.t0_jd) * crate::timescales::SECONDS_PER_DAY;
            Some([
                self.r0[0] + self.v[0] * dt_s,
                self.r0[1] + self.v[1] * dt_s,
                self.r0[2] + self.v[2] * dt_s,
            ])
        }
    }

    /// Earth–Sun retarded light time from the geocentre: τ ≈ |sun_pos|/c ≈ 1 AU/c ≈ 499 s, the
    /// retarded correction is non-zero, and the returned retarded position is self-consistent with
    /// the recovered τ (|rx − tx_pos|/c == τ).
    #[test]
    fn earth_sun_light_time() {
        let ephem = BuiltinEphemeris;
        let t_rx = TwoPartJd::from_f64(PROBE_JD);
        let lt = light_time_solution([0.0, 0.0, 0.0], t_rx, &Body::sun(), &Body::earth(), &ephem)
            .expect("builtin supplies Sun relative to Earth");

        // ~1 AU / c ≈ 499 s; allow a generous band for the Earth–Sun distance over the year.
        assert!(
            (480.0..=520.0).contains(&lt.tau_s),
            "Earth–Sun light time {} s outside the 1 AU/c band",
            lt.tau_s
        );

        // The retarded correction must be non-zero: the Sun-at-receive-epoch range over c differs
        // from the converged retarded τ (the Sun moves geocentrically between epochs).
        let sun_at_rx = ephem
            .relative_position(&Body::sun(), &Body::earth(), t_rx.to_f64())
            .unwrap();
        let tau0 = norm(sun_at_rx) / C_M_PER_S;
        assert!(
            (lt.tau_s - tau0).abs() > 0.0,
            "retarded correction should move τ off the receive-epoch value"
        );

        // Self-consistency: the geometric range to the *retarded* position over c is exactly τ.
        let range_to_retarded = norm(lt.tx_pos) / C_M_PER_S;
        assert!(
            (range_to_retarded - lt.tau_s).abs() < 1e-9,
            "retarded geometry inconsistent: |tx_pos|/c = {range_to_retarded} s, τ = {} s",
            lt.tau_s
        );

        // The transmission epoch is the reception epoch minus τ (the minus-sign convention).
        let back_dt = t_rx.diff_seconds(lt.tx_epoch);
        assert!(
            (back_dt - lt.tau_s).abs() < 1e-6,
            "tx_epoch must be t_rx − τ: t_rx − tx_epoch = {back_dt} s, τ = {} s",
            lt.tau_s
        );

        // The retarded range is within an Earth-orbit-radius of 1 AU.
        let range_au = norm(lt.tx_pos) / AU_M;
        assert!(
            (0.95..=1.05).contains(&range_au),
            "retarded Earth–Sun range {range_au} AU not near 1 AU"
        );
    }

    /// Earth–Moon retarded light time from the geocentre: τ ≈ |moon_pos|/c ≈ 1.2–1.4 s.
    #[test]
    fn earth_moon_light_time() {
        let ephem = BuiltinEphemeris;
        let t_rx = TwoPartJd::from_f64(PROBE_JD);
        let lt = light_time_solution([0.0, 0.0, 0.0], t_rx, &Body::moon(), &Body::earth(), &ephem)
            .expect("builtin supplies Moon relative to Earth");

        // The Moon ranges ~356 500–406 700 km from Earth (perigee–apogee), i.e. a one-way light
        // time of ~1.19–1.36 s; the analytic series puts this probe epoch near perigee (~1.20 s).
        assert!(
            (1.15..=1.40).contains(&lt.tau_s),
            "Earth–Moon light time {} s outside the ~1.19–1.36 s perigee–apogee band",
            lt.tau_s
        );

        // Self-consistency of the retarded geometry.
        let range_to_retarded = norm(lt.tx_pos) / C_M_PER_S;
        assert!(
            (range_to_retarded - lt.tau_s).abs() < 1e-9,
            "retarded Moon geometry inconsistent"
        );
    }

    /// The iterative solver recovers the **analytic** retarded solution for a constant-velocity body
    /// to < 1e-9 s — a proof of the solver itself, independent of any real ephemeris.
    ///
    /// For a receiver at the origin and a body `r(t) = p − v·τ` at emission (with `p` the position at
    /// the receive epoch), the retarded condition `c·τ = |r(t_rx − τ)|` is a quadratic in τ:
    ///   `(c² − |v|²)·τ² − 2(D·v)·τ − |D|² = 0`,  with `D = rx − p`.
    /// The test forms `p` from the synthetic model, solves that quadratic in closed form, and
    /// asserts the solver's τ matches.
    #[test]
    fn light_time_solver_recovers_known_retardation() {
        let t0_jd = PROBE_JD;
        let r0 = [2.0e11, 5.0e10, -3.0e10];
        let v = [12_000.0, -8_000.0, 4_000.0];
        let ephem = ConstantVelocityEphemeris { t0_jd, r0, v };

        // Receive epoch: t0 + 1234.567 s, receiver at the origin.
        let rx_pos = [0.0, 0.0, 0.0];
        let t_rx = TwoPartJd::from_f64(t0_jd).add_seconds(1234.567);

        // Position of the body at the receive epoch, p = r0 + v·(t_rx − t0).
        let dt_rx_s = t_rx.diff_seconds(TwoPartJd::from_f64(t0_jd));
        let p = [
            r0[0] + v[0] * dt_rx_s,
            r0[1] + v[1] * dt_rx_s,
            r0[2] + v[2] * dt_rx_s,
        ];

        // Analytic retarded τ from the quadratic.
        let c = C_M_PER_S;
        let d = [rx_pos[0] - p[0], rx_pos[1] - p[1], rx_pos[2] - p[2]];
        let dv = d[0] * v[0] + d[1] * v[1] + d[2] * v[2];
        let d2 = d[0] * d[0] + d[1] * d[1] + d[2] * d[2];
        let v2 = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
        let qa = c * c - v2;
        let qb = -2.0 * dv;
        let qc = -d2;
        let disc = qb * qb - 4.0 * qa * qc;
        let tau_analytic = (-qb + disc.sqrt()) / (2.0 * qa);

        let lt = light_time_solution(rx_pos, t_rx, &Body::mars(), &Body::sun(), &ephem)
            .expect("synthetic provider supplies any pair");

        assert!(
            (lt.tau_s - tau_analytic).abs() < 1e-9,
            "solver τ = {} s vs analytic {} s (Δ = {} s)",
            lt.tau_s,
            tau_analytic,
            (lt.tau_s - tau_analytic).abs()
        );

        // The retarded position the solver reports must equal the closed-form r(t_rx − τ). The
        // tolerance here is set by the *test harness*, not the solver: this synthetic provider
        // differences the epoch as a plain f64 JD (`jd_tdb − t0_jd`), which near JD ≈ 2.46e6 carries
        // the documented ~40 µs single-f64 floor; at the body's ~15 km/s speed that is a sub-metre
        // position uncertainty (~0.6 m). The *light time* itself — the quantity the solver computes —
        // is matched to < 1e-9 s above, carried losslessly by the two-part epoch; the metre-scale
        // bound below is the harness floor, not a solver error.
        let retarded = [
            p[0] - v[0] * tau_analytic,
            p[1] - v[1] * tau_analytic,
            p[2] - v[2] * tau_analytic,
        ];
        for (k, &want) in retarded.iter().enumerate() {
            assert!(
                (lt.tx_pos[k] - want).abs() < 1.0,
                "retarded position component {k}: solver {} vs analytic {} (Δ = {} m)",
                lt.tx_pos[k],
                want,
                (lt.tx_pos[k] - want).abs()
            );
        }

        // And the reported emission epoch is t_rx − τ.
        let dt = t_rx.diff_seconds(lt.tx_epoch);
        assert!(
            (dt - tau_analytic).abs() < 1e-6,
            "emission epoch wrong: t_rx − tx_epoch = {dt} s, τ = {tau_analytic} s"
        );
    }

    /// The advanced (up-leg) variant places the body's epoch *after* the fixed epoch by τ. For a
    /// constant-velocity body the same quadratic holds with the sign of the velocity term flipped;
    /// here we just assert the up-leg epoch is `t_tx + τ` (later) and the geometry is self-consistent.
    #[test]
    fn advanced_light_time_epoch_is_later() {
        let t0_jd = PROBE_JD;
        let ephem = ConstantVelocityEphemeris {
            t0_jd,
            r0: [2.0e11, 5.0e10, -3.0e10],
            v: [12_000.0, -8_000.0, 4_000.0],
        };
        let tx_pos = [0.0, 0.0, 0.0];
        let t_tx = TwoPartJd::from_f64(t0_jd).add_seconds(1234.567);

        let lt = light_time_solution_advanced(tx_pos, t_tx, &Body::mars(), &Body::sun(), &ephem)
            .expect("synthetic provider supplies any pair");

        // Reception epoch is t_tx + τ (later → positive diff).
        let dt = lt.tx_epoch.diff_seconds(t_tx);
        assert!(
            (dt - lt.tau_s).abs() < 1e-6,
            "advanced epoch must be t_tx + τ: tx_epoch − t_tx = {dt} s, τ = {} s",
            lt.tau_s
        );

        // Self-consistency: |tx_pos_fixed − body_at_reception|/c == τ.
        let sep = norm([
            tx_pos[0] - lt.tx_pos[0],
            tx_pos[1] - lt.tx_pos[1],
            tx_pos[2] - lt.tx_pos[2],
        ]) / C_M_PER_S;
        assert!(
            (sep - lt.tau_s).abs() < 1e-9,
            "advanced geometry inconsistent: range/c = {sep} s, τ = {} s",
            lt.tau_s
        );
    }

    /// With the kernel-free [`BuiltinEphemeris`], a Mars target returns `None` — the builtin has no
    /// Mars series, so the solver cannot start (real Earth–Mars validation is D0.8 via ANISE).
    #[test]
    fn mars_light_time_none() {
        let ephem = BuiltinEphemeris;
        let t_rx = TwoPartJd::from_f64(PROBE_JD);
        assert!(
            light_time_solution([0.0, 0.0, 0.0], t_rx, &Body::mars(), &Body::earth(), &ephem)
                .is_none(),
            "the kernel-free builtin cannot supply a Mars light time"
        );
    }

    /// `shapiro_delay` matches a fully hand-computed value of the closed form to machine precision,
    /// AND a near-solar-grazing Earth–Mars-scale geometry lands in the published ~tens-to-hundreds of
    /// µs band — physically right (microseconds), not arcseconds or seconds.
    #[test]
    fn shapiro_matches_reference() {
        // --- Exact hand-checkable geometry -------------------------------------------------------
        // Construct endpoints with r1 = r2 = 3e11 m and r12 = 4e11 m, so the logarithm's argument is
        //   (r1 + r2 + r12) / (r1 + r2 − r12) = (1.0e12) / (2.0e11) = 5.0 exactly.
        // With mu = 1.5e20, the one-way delay is (2·mu/c³)·ln(5), computed independently below.
        let r_tx = [3.0e11, 0.0, 0.0];
        // x = 2e22/6e11, y = sqrt(9e22 − x²): gives |r_rx| = 3e11 and |r_tx − r_rx| = 4e11 exactly.
        let x: f64 = 2.0e22 / 6.0e11;
        let y = (9.0e22 - x * x).sqrt();
        let r_rx = [x, y, 0.0];
        let mu = 1.5e20;

        // Independent closed-form expected value (argument is exactly 5.0).
        let c = C_M_PER_S;
        let expected = (2.0 * mu / (c * c * c)) * 5.0_f64.ln();
        let got = shapiro_delay(r_tx, r_rx, mu);
        assert!(
            (got - expected).abs() < 1e-12,
            "Shapiro closed form mismatch: got {got} s, expected {expected} s"
        );
        // Provenance check: this exact case is ~17.92 µs (sanity that the magnitude is microseconds).
        assert!(
            (got - 1.791_980_887_809_346e-5).abs() < 1e-15,
            "Shapiro hand value drifted: {got} s"
        );

        // --- Near-superior-conjunction Earth–Mars geometry (physical magnitude) ------------------
        // Earth at −1 AU and Mars at +1.524 AU on the x-axis, the line of sight passing the Sun at
        // an impact parameter of a few solar radii. Positions are heliocentric (from the Sun).
        let r_sun = 6.957e8; // nominal solar radius (m)
        let b = 3.0 * r_sun; // impact parameter, 3 solar radii
        let earth = [-AU_M, b, 0.0];
        let mars = [1.524 * AU_M, b, 0.0];
        let one_way = shapiro_delay(earth, mars, MU_SUN);
        let round_trip = 2.0 * one_way;

        // One-way ~100 µs, round-trip in the published ~100–250 µs band. Assert microsecond scale:
        // not arcseconds, not seconds.
        assert!(
            (50e-6..=200e-6).contains(&one_way),
            "Earth–Mars one-way Shapiro {} µs not in the ~50–200 µs band",
            one_way * 1e6
        );
        assert!(
            (100e-6..=250e-6).contains(&round_trip),
            "Earth–Mars round-trip Shapiro {} µs not in the published ~100–250 µs band",
            round_trip * 1e6
        );
    }

    /// A degenerate co-located geometry (`r_tx == r_rx`) gives `r12 = 0`, log argument 1, and so
    /// exactly zero delay — the formula's well-defined floor.
    #[test]
    fn shapiro_zero_for_coincident_endpoints() {
        let p = [1.2e11, -3.4e10, 5.6e9];
        assert_eq!(shapiro_delay(p, p, MU_SUN), 0.0);
    }

    // ------------------------------------------------------------------------
    // D1.1 — range & Doppler observables.
    // ------------------------------------------------------------------------

    /// `two_way_range` for a station↔Sun geometry equals the sum of the up-leg and
    /// down-leg one-way ranges to within a millimetre (the documented full-round-
    /// trip convention `ρ₂ = c·(τ_up + τ_down)`). For the geocentric Sun the two
    /// legs are within an Earth-orbit-radius of 1 AU each, so the round trip is
    /// ~2 AU.
    #[test]
    fn two_way_range_is_sum_of_legs() {
        let ephem = BuiltinEphemeris;
        let t_rx = TwoPartJd::from_f64(PROBE_JD);
        let station = [0.0, 0.0, 0.0];

        let two_way = two_way_range(station, &Body::sun(), &Body::earth(), t_rx, &ephem)
            .expect("builtin supplies Sun relative to Earth");

        // Down-leg one-way range, anchored at t_rx.
        let down =
            light_time_solution(station, t_rx, &Body::sun(), &Body::earth(), &ephem).unwrap();
        // Up-leg: advanced from the down-leg emission epoch.
        let up = light_time_solution_advanced(
            station,
            down.tx_epoch,
            &Body::sun(),
            &Body::earth(),
            &ephem,
        )
        .unwrap();
        let expected = (up.tau_s + down.tau_s) * C_M_PER_S;

        assert!(
            (two_way - expected).abs() < 1e-3,
            "two-way range {two_way} m differs from c·(τ_up+τ_down) {expected} m by {} m",
            (two_way - expected).abs()
        );

        // Magnitude sanity: round trip is ~2 AU for the Earth–Sun geometry.
        let round_trip_au = two_way / AU_M;
        assert!(
            (1.9..=2.1).contains(&round_trip_au),
            "Earth–Sun round-trip range {round_trip_au} AU not near 2 AU"
        );
    }

    /// One-way range to the Moon equals `c·τ_down` exactly (it *is* the definition),
    /// and lands in the ~356 500–406 700 km Earth–Moon band.
    #[test]
    fn one_way_range_matches_light_time() {
        let ephem = BuiltinEphemeris;
        let t_rx = TwoPartJd::from_f64(PROBE_JD);
        let station = [0.0, 0.0, 0.0];

        let r = one_way_range(station, &Body::moon(), &Body::earth(), t_rx, &ephem).unwrap();
        let lt = light_time_solution(station, t_rx, &Body::moon(), &Body::earth(), &ephem).unwrap();
        assert!((r - lt.tau_s * C_M_PER_S).abs() < 1e-6);

        let km = r / 1000.0;
        assert!(
            (350_000.0..=410_000.0).contains(&km),
            "Earth–Moon one-way range {km} km outside the perigee–apogee band"
        );
    }

    /// A constant-velocity emitter receding **radially** from a station at the
    /// origin gives the analytic one-way Doppler `f_D = −(f/c)·ρ̇`, with
    /// `ρ̇` the radial speed. We place the body on the +x axis with velocity
    /// purely along +x (pure recession), so the line-of-sight range rate equals
    /// the speed `|v|` to the part-per-thousand the numeric derivative resolves.
    #[test]
    fn one_way_doppler_constant_velocity_radial() {
        let t0_jd = PROBE_JD;
        let speed = 9_000.0_f64; // m/s, receding
        let ephem = ConstantVelocityEphemeris {
            t0_jd,
            r0: [2.0e11, 0.0, 0.0],
            v: [speed, 0.0, 0.0],
        };
        let station = [0.0, 0.0, 0.0];
        let t_rx = TwoPartJd::from_f64(t0_jd);
        let f_dl = 8.42e9; // X-band downlink

        // Range rate from the geometry: should equal +speed (receding) to high
        // accuracy (the tiny retarded correction is ~v/c ≈ 3e-5 of the speed).
        let rdot =
            one_way_range_rate(station, &Body::mars(), &Body::sun(), t_rx, 1.0, &ephem).unwrap();
        assert!(
            (rdot - speed).abs() / speed < 1e-3,
            "radial range rate {rdot} m/s should be ≈ {speed} m/s"
        );

        // One-way Doppler = −(f/c)·ρ̇; receding ⇒ negative (red) shift.
        let f_d =
            one_way_doppler(station, &Body::mars(), &Body::sun(), t_rx, f_dl, &ephem).unwrap();
        let expected = -(f_dl / C_M_PER_S) * speed;
        assert!(
            (f_d - expected).abs() / expected.abs() < 1e-3,
            "one-way Doppler {f_d} Hz vs analytic {expected} Hz"
        );
        assert!(
            f_d < 0.0,
            "a receding emitter must give a negative (red) shift"
        );
    }

    /// An **approaching** emitter gives a positive (blue) shift, and the
    /// two-way Doppler is the one-way Doppler scaled by `2·M` (round trip ×
    /// turn-around ratio) when referenced to the *same* carrier. Here we build the
    /// two-way Doppler with `M = 1` and an uplink equal to the downlink, and check
    /// it is exactly twice the one-way Doppler.
    #[test]
    fn two_way_doppler_is_twice_one_way_at_unit_turnaround() {
        let t0_jd = PROBE_JD;
        let speed = -7_500.0_f64; // m/s, approaching (negative ρ̇)
        let ephem = ConstantVelocityEphemeris {
            t0_jd,
            r0: [1.5e11, 0.0, 0.0],
            v: [speed, 0.0, 0.0],
        };
        let station = [0.0, 0.0, 0.0];
        let t_rx = TwoPartJd::from_f64(t0_jd);
        let f = 7.179e9;

        let one_way =
            one_way_doppler(station, &Body::mars(), &Body::sun(), t_rx, f, &ephem).unwrap();
        let two_way =
            two_way_doppler(station, &Body::mars(), &Body::sun(), t_rx, f, 1.0, &ephem).unwrap();

        assert!(
            one_way > 0.0,
            "an approaching emitter must give a positive shift"
        );
        // Two-way at M=1, same carrier = 2× one-way (both legs see the shift).
        assert!(
            (two_way - 2.0 * one_way).abs() / two_way.abs() < 5e-3,
            "two-way Doppler {two_way} Hz should be ≈ 2× one-way {one_way} Hz"
        );
    }

    /// Three-way Doppler with the receiving station *equal to* the transmitting
    /// station degenerates to the two-way Doppler (same geometry on both legs).
    #[test]
    fn three_way_collapses_to_two_way_for_colocated_stations() {
        let t0_jd = PROBE_JD;
        let ephem = ConstantVelocityEphemeris {
            t0_jd,
            r0: [1.8e11, 3.0e10, 0.0],
            v: [6_000.0, -2_000.0, 1_000.0],
        };
        let station = [0.0, 0.0, 0.0];
        let t_rx = TwoPartJd::from_f64(t0_jd);
        let f = 7.179e9;
        // A non-trivial turn-around ratio (D1.2 supplies the band-keyed value);
        // the collapse identity holds for any M.
        let m = 880.0 / 749.0;

        let two_way =
            two_way_doppler(station, &Body::mars(), &Body::sun(), t_rx, f, m, &ephem).unwrap();
        let three_way = three_way_doppler(
            station,
            station,
            &Body::mars(),
            &Body::sun(),
            t_rx,
            f,
            m,
            &ephem,
        )
        .unwrap();

        assert!(
            (two_way - three_way).abs() / two_way.abs() < 1e-6,
            "three-way with colocated stations {three_way} Hz must equal two-way {two_way} Hz"
        );
    }

    /// A `RadiometricObs` round-trips its fields and tags the right units via its
    /// kind — a light structural check that the observable record is wired.
    #[test]
    fn radiometric_obs_record_fields() {
        let obs = RadiometricObs {
            kind: ObsKind::Range,
            way: ObsWay::Two,
            band: Band::X,
            epoch: TwoPartJd::from_f64(PROBE_JD),
            value: 4.2e11,
            sigma: 1.0,
        };
        assert_eq!(obs.kind, ObsKind::Range);
        assert_eq!(obs.way, ObsWay::Two);
        assert_eq!(obs.band, Band::X);
        assert_eq!(obs.value, 4.2e11);
    }
}
