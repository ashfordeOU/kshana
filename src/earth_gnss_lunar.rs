// SPDX-License-Identifier: AGPL-3.0-only
//! Earth-GNSS reception at lunar distance: the weak-signal layer P7's Table 1 names and
//! the engine had no model for.
//!
//! # The physics, and why it is not just a long link
//!
//! A GNSS satellite points its antenna at the Earth. A receiver on or near the Moon sits
//! roughly 385,000 km away — about fifteen times the GNSS orbital radius — so it is far
//! outside the service volume the constellation was designed for, and three things happen
//! at once:
//!
//! 1. **The Earth is in the way.** From a satellite at 26,560 km the Earth subtends a
//!    half-angle of about 13.9°, so any ray reaching the Moon must leave the transmitter
//!    at least that far off nadir or it is simply blocked. That single geometric fact
//!    removes the boresight of the beam from consideration before any power is computed.
//! 2. **What is left is the main-lobe edge and the sidelobes.** The usable rays sit in a
//!    narrow annulus just outside the limb, where the transmit gain is already falling.
//!    This is the regime the LuGRE payload operated in when it tracked GNSS in lunar orbit
//!    and on the surface in 2025.
//! 3. **The path loss is about 208 dB at L1.** Roughly 25 dB more than a terrestrial user
//!    pays, which is the whole difficulty: the budget closes only with a high-gain
//!    receiving antenna and a long integration, and it closes with little to spare.
//!
//! The report therefore computes, per satellite: the off-boresight angle, whether the
//! Earth occults the path, the transmit gain at that angle, the range and its free-space
//! loss, the received power, and the resulting carrier-to-noise density — then aggregates
//! only the links that clear the stated tracking threshold into a geometry.
//!
//! # The geometry is nearly degenerate, and that is a result
//!
//! Every visible satellite lies within a couple of degrees of the Earth's direction as
//! seen from the Moon. The line-of-sight unit vectors are therefore almost parallel, the
//! design matrix is ill-conditioned, and the dilution of precision is enormous — an
//! Earth-GNSS fix at lunar distance is a *timing-grade* observation far more than a
//! position-grade one. The report emits the DOP rather than hiding it, because that
//! conditioning is the layer's defining property.
//!
//! # Honesty scope (load-bearing)
//!
//! **MODELLED, and the transmit pattern is the reason.** The gain at angle is a uniformly
//! illuminated circular aperture — the Airy pattern of [`crate::antenna::pattern_gain_dbi`].
//! A real GPS L1 antenna is a twelve-element helical array whose measured pattern has a
//! shaped main lobe (deliberately peaked off-boresight to equalise power across the Earth
//! disc) and a sidelobe structure that is *not* Airy. Published measured patterns exist —
//! the GPS Antenna Characterization Experiment is the usual source — and this module does
//! not use them, because they are not vendored here. So every per-satellite gain, and
//! therefore every C/N₀, is a first-principles stand-in rather than a reproduction of a
//! measured beam. The ORDERING and the ORDER OF MAGNITUDE are meaningful; an individual
//! satellite's dB is not.
//!
//! What would upgrade this row to Validated is a measured pattern plus LuGRE normal points
//! to check against. Neither is in the repository, and neither is invented here.
//!
//! Also deliberately absent, each of which makes this model OPTIMISTIC:
//! * no ionospheric or tropospheric loss on the limb-grazing rays, which do pass through
//!   the upper atmosphere at small clearance angles;
//! * no polarisation mismatch, no pointing loss, no receiver implementation loss;
//! * a spherical Earth at the equatorial radius for the occultation test, with no
//!   refractive extension.
//!
//! The Moon's position is an **input** — a range and an inertial direction — not an
//! ephemeris lookup. The quantity under test here is the link and the beam geometry; the
//! engine models the lunar ephemeris elsewhere and nothing is gained by coupling them.

use crate::antenna::{boresight_gain_dbi, pattern_gain_dbi, GainPattern2D};
use crate::jamming::{free_space_path_loss_db, nominal_cn0_dbhz, L1_HZ};
use crate::orbit::{dop, Dop, R_EARTH_EQUATORIAL_M};
use crate::walker::WalkerSgp4;
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

/// Mean Earth–Moon distance (m). Used when a scenario states no range of its own.
pub const MEAN_LUNAR_DISTANCE_M: f64 = 384_400_000.0;

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn unit(v: Vec3) -> Option<Vec3> {
    let n = norm(v);
    if n <= 0.0 {
        None
    } else {
        Some([v[0] / n, v[1] / n, v[2] / n])
    }
}

/// Does the straight segment `a → b` pass within `radius` of the origin?
///
/// The closest approach of the infinite line is projected back onto the segment, so a
/// body that lies *behind* the transmitter or *beyond* the receiver does not occult. With
/// a spherical Earth and no refraction this is exact rather than approximate.
pub fn segment_blocked_by_sphere(a: Vec3, b: Vec3, radius: f64) -> bool {
    let d = sub(b, a);
    let dd = dot(d, d);
    if dd <= 0.0 {
        return norm(a) < radius;
    }
    // Parameter of closest approach to the origin, clamped to the segment.
    let t = (-dot(a, d) / dd).clamp(0.0, 1.0);
    let closest = [a[0] + t * d[0], a[1] + t * d[1], a[2] + t * d[2]];
    norm(closest) < radius
}

/// One transmitter-to-lunar-receiver link at one epoch.
#[derive(Clone, Debug, Serialize)]
pub struct LunarGnssLink {
    /// Index of the satellite in the constellation, in generation order.
    pub sat_index: usize,
    /// Angle between the satellite's nadir (Earth-centre) direction and the receiver,
    /// in degrees. The transmit beam is referenced to nadir.
    pub off_boresight_deg: f64,
    /// Whether the Earth blocks the straight path.
    pub earth_occulted: bool,
    /// Whether the receiver lies BEHIND the transmit aperture (off-boresight > 90 deg).
    /// Reported because the Airy expression is only valid in the forward hemisphere.
    pub behind_antenna: bool,
    /// Slant range, metres.
    pub range_m: f64,
    /// Free-space path loss at the carrier, dB.
    pub path_loss_db: f64,
    /// Transmit gain toward the receiver at this off-boresight angle, dBi.
    pub tx_gain_dbi: f64,
    /// Isotropic received power, dBW: `tx_power + tx_gain - path_loss`.
    pub received_power_dbw: f64,
    /// Carrier-to-noise density with the receiving antenna's gain applied, dB-Hz.
    pub cn0_dbhz: f64,
    /// Whether `cn0_dbhz` clears the tracking threshold.
    pub trackable: bool,
}

/// The computed picture at one epoch.
#[derive(Clone, Debug, Serialize)]
pub struct EarthGnssLunarReport {
    /// Every link, in satellite order, occulted ones included so the geometry is visible.
    pub links: Vec<LunarGnssLink>,
    /// Satellites in the constellation.
    pub n_satellites: usize,
    /// Satellites whose path the Earth does not block.
    pub n_geometrically_visible: usize,
    /// Satellites that additionally clear the tracking threshold.
    pub n_trackable: usize,
    /// Half-angle of the Earth as seen from a satellite at the constellation radius, deg —
    /// the minimum off-boresight angle any lunar-bound ray must exceed.
    pub earth_limb_half_angle_deg: f64,
    /// Angular radius of the cone containing every trackable line of sight as seen from
    /// the receiver, deg. Small means an ill-conditioned geometry.
    pub los_cone_half_angle_deg: Option<f64>,
    /// Dilution of precision over the trackable set, or `None` with fewer than four.
    pub dop: Option<Dop>,
    /// Best carrier-to-noise density over the trackable set, dB-Hz.
    pub best_cn0_dbhz: Option<f64>,
    /// Transmit boresight gain the pattern is referenced to, dBi.
    pub tx_boresight_gain_dbi: f64,
    /// Tracking threshold applied, dB-Hz.
    pub tracking_threshold_dbhz: f64,
    /// Receiver range from Earth centre, metres.
    pub receiver_range_m: f64,
    /// The epoch sweep: what this layer looks like over time rather than at one instant.
    pub sweep: EpochSweep,
}

/// One epoch of the sweep.
#[derive(Clone, Debug, Serialize)]
pub struct SweepEpoch {
    /// Seconds after the constellation epoch.
    pub t_s: f64,
    /// Links clearing the tracking threshold in the forward hemisphere, un-occulted.
    pub n_trackable: usize,
    /// Strongest trackable link, dB-Hz, or `None` when none clears the threshold.
    pub best_cn0_dbhz: Option<f64>,
    /// Position dilution of precision over the trackable set, or `None` below four links.
    pub pdop: Option<f64>,
}

/// What the layer looks like across the sweep — the shape a resilience prior needs.
#[derive(Clone, Debug, Serialize)]
pub struct EpochSweep {
    /// Every sampled epoch.
    pub epochs: Vec<SweepEpoch>,
    /// Span covered, seconds.
    pub span_s: f64,
    /// Fraction of epochs with at least one trackable link. This is a SIGNAL-availability,
    /// not a fix-availability: one link is a timing observation, not a position.
    pub signal_availability: f64,
    /// Fraction of epochs with at least four trackable links, the minimum for a
    /// four-state fix. This is the number a resilience layer prior should use.
    pub fix_availability: f64,
    /// Largest trackable count over the sweep.
    pub max_trackable: usize,
    /// Mean trackable count over the sweep.
    pub mean_trackable: f64,
    /// Best carrier-to-noise density seen anywhere in the sweep, dB-Hz.
    pub best_cn0_dbhz: Option<f64>,
    /// Best (smallest) PDOP seen anywhere in the sweep, over epochs that admit one.
    pub best_pdop: Option<f64>,
}

/// Earth-GNSS reception at lunar distance.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct EarthGnssLunarScenario {
    /// Scenario kind tag, ignored by the computation.
    #[serde(default)]
    pub kind: Option<String>,
    /// Constellation altitude (km). Default 20180, the GPS MEO altitude.
    #[serde(default)]
    pub altitude_km: Option<f64>,
    /// Constellation inclination (deg). Default 55.
    #[serde(default)]
    pub inclination_deg: Option<f64>,
    /// Orbital planes. Default 6.
    #[serde(default)]
    pub planes: Option<usize>,
    /// Satellites per plane. Default 4, giving the 24-satellite baseline.
    #[serde(default)]
    pub sats_per_plane: Option<usize>,
    /// Walker inter-plane phasing. Default 2.
    #[serde(default)]
    pub phasing_f: Option<f64>,
    /// Seconds after the shared constellation epoch. Default 0.
    #[serde(default)]
    pub epoch_s: Option<f64>,
    /// Receiver distance from the Earth's centre (m). Default the mean lunar distance.
    #[serde(default)]
    pub receiver_range_m: Option<f64>,
    /// Inertial direction to the receiver as a right ascension (deg). Default 0.
    #[serde(default)]
    pub receiver_ra_deg: Option<f64>,
    /// Inertial direction to the receiver as a declination (deg). Default 0.
    #[serde(default)]
    pub receiver_dec_deg: Option<f64>,
    /// Transmitter power into the antenna (dBW). Default 13.4, about 27 W.
    #[serde(default)]
    pub tx_power_dbw: Option<f64>,
    /// Equivalent aperture diameter of the transmit antenna (m). Default 0.35, chosen so
    /// the boresight gain lands near the 13 dBi a GPS L1 antenna is usually quoted at.
    #[serde(default)]
    pub tx_diameter_m: Option<f64>,
    /// Aperture efficiency of the transmit model. Default 0.6.
    #[serde(default)]
    pub tx_efficiency: Option<f64>,
    /// Carrier frequency (Hz). Default L1.
    #[serde(default)]
    pub freq_hz: Option<f64>,
    /// Receiving antenna gain (dBi). Default 12.0, a modest high-gain lunar antenna.
    #[serde(default)]
    pub rx_gain_dbi: Option<f64>,
    /// Receiver system noise temperature (K). Default 290.
    #[serde(default)]
    pub system_temp_k: Option<f64>,
    /// Tracking threshold (dB-Hz). Default 25, the engine's shared figure.
    #[serde(default)]
    pub tracking_threshold_dbhz: Option<f64>,
    /// How far below boresight the transmit gain is taken to be BEHIND the aperture (dB).
    /// Default 25. A flat floor, not a pattern: see the note at the gain computation.
    #[serde(default)]
    pub back_lobe_suppression_db: Option<f64>,
    /// Epochs to sample across the sweep span. Default 64. One snapshot is the wrong shape
    /// for this question: whether a satellite lands in the thin usable annulus just outside
    /// the Earth limb is a matter of where the constellation happens to be, so the useful
    /// answer is a distribution, not a sample.
    #[serde(default)]
    pub epochs: Option<usize>,
    /// Span the epochs cover (s). Default 43082, one GPS orbital period, so the sweep walks
    /// the constellation through a full revolution relative to the receiver direction.
    #[serde(default)]
    pub span_s: Option<f64>,
}

impl EarthGnssLunarScenario {
    /// Run and return `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        Ok((egl_json(&r)?, egl_summary(&r), egl_svg(&r)))
    }

    /// The per-satellite link table and its aggregates.
    pub fn compute(&self) -> Result<EarthGnssLunarReport, String> {
        let altitude_km = self.altitude_km.unwrap_or(20_180.0);
        if altitude_km <= 0.0 {
            return Err(format!("altitude_km must be positive; got {altitude_km}"));
        }
        let planes = self.planes.unwrap_or(6);
        let sats_per_plane = self.sats_per_plane.unwrap_or(4);
        if planes == 0 || sats_per_plane == 0 {
            return Err("planes and sats_per_plane must both be non-zero".to_string());
        }
        let freq_hz = self.freq_hz.unwrap_or(L1_HZ);
        if freq_hz <= 0.0 {
            return Err(format!("freq_hz must be positive; got {freq_hz}"));
        }
        let tx_diameter_m = self.tx_diameter_m.unwrap_or(0.35);
        let tx_efficiency = self.tx_efficiency.unwrap_or(0.6);
        if !(0.0..=1.0).contains(&tx_efficiency) || tx_efficiency <= 0.0 {
            return Err(format!(
                "tx_efficiency must be in (0, 1]; got {tx_efficiency}"
            ));
        }
        let tx_power_dbw = self.tx_power_dbw.unwrap_or(13.4);
        let rx_gain_dbi = self.rx_gain_dbi.unwrap_or(12.0);
        let temp_k = self.system_temp_k.unwrap_or(290.0);
        if temp_k <= 0.0 {
            return Err(format!("system_temp_k must be positive; got {temp_k}"));
        }
        let threshold = self.tracking_threshold_dbhz.unwrap_or(25.0);
        let epoch_s = self.epoch_s.unwrap_or(0.0);
        let back_lobe_suppression_db = self.back_lobe_suppression_db.unwrap_or(25.0);
        if back_lobe_suppression_db < 0.0 {
            return Err(format!(
                "back_lobe_suppression_db must be non-negative; got {back_lobe_suppression_db}"
            ));
        }

        let range_m = self.receiver_range_m.unwrap_or(MEAN_LUNAR_DISTANCE_M);
        if range_m <= R_EARTH_EQUATORIAL_M {
            return Err(format!(
                "receiver_range_m must be outside the Earth; got {range_m}"
            ));
        }
        let ra = self.receiver_ra_deg.unwrap_or(0.0).to_radians();
        let dec = self.receiver_dec_deg.unwrap_or(0.0).to_radians();
        let user: Vec3 = [
            range_m * dec.cos() * ra.cos(),
            range_m * dec.cos() * ra.sin(),
            range_m * dec.sin(),
        ];

        let constellation = WalkerSgp4 {
            altitude_km,
            inclination_deg: self.inclination_deg.unwrap_or(55.0),
            planes,
            sats_per_plane,
            phasing_f: self.phasing_f.unwrap_or(2.0),
        };
        let sats = constellation.satellites();
        let g0 = boresight_gain_dbi(tx_diameter_m, freq_hz, tx_efficiency);

        // One epoch, so the sweep below and the detail table share exactly one code path.
        let epoch_links = |t: f64| -> (Vec<LunarGnssLink>, Vec<Vec3>) {
            let mut links = Vec::with_capacity(sats.len());
            let mut trackable_positions: Vec<Vec3> = Vec::new();
            for (i, sat) in sats.iter().enumerate() {
                let r_sat = sat.position_eci(t);
                let to_user = sub(user, r_sat);
                let range = norm(to_user);

                // The transmit beam is referenced to nadir: the satellite points at the
                // Earth's centre, so nadir is the direction from the satellite to the origin.
                let off_boresight_rad =
                    match (unit(to_user), unit([-r_sat[0], -r_sat[1], -r_sat[2]])) {
                        (Some(u), Some(n)) => dot(u, n).clamp(-1.0, 1.0).acos(),
                        // A propagation failure returns the geocentre; treat it as no link rather
                        // than divide by zero.
                        _ => std::f64::consts::PI,
                    };

                let occulted = segment_blocked_by_sphere(r_sat, user, R_EARTH_EQUATORIAL_M);
                // The Airy expression is valid only in the FORWARD hemisphere. Its argument
                // is x = (pi*D/lambda)*sin(theta), and sin(theta) -> 0 as theta -> 180 deg, so
                // the formula wraps around and hands back the FULL boresight gain directly
                // behind the aperture. That is not a small error: on the first run of this
                // module the two strongest links in the whole report were satellites pointing
                // their antennas almost exactly away from the Moon, credited with 13.02 dBi,
                // and they were the only two clearing the tracking threshold. The physics was
                // backwards and the numbers looked entirely reasonable.
                //
                // Behind the aperture a real spacecraft radiates a back lobe dominated by
                // structure scattering, tens of dB below boresight. That is modelled here as a
                // flat suppression rather than a pattern, because a flat floor is honest about
                // being a bound while a fabricated back-lobe shape would not be.
                let behind = off_boresight_rad > std::f64::consts::FRAC_PI_2;
                let tx_gain = if behind {
                    g0 - back_lobe_suppression_db
                } else {
                    pattern_gain_dbi(tx_diameter_m, freq_hz, tx_efficiency, off_boresight_rad)
                };
                let path_loss = free_space_path_loss_db(range, freq_hz);
                let p_rx = tx_power_dbw + tx_gain - path_loss;
                let cn0 = nominal_cn0_dbhz(p_rx, rx_gain_dbi, temp_k);
                let trackable = !occulted && !behind && cn0 >= threshold;
                if trackable {
                    trackable_positions.push(r_sat);
                }
                links.push(LunarGnssLink {
                    sat_index: i,
                    off_boresight_deg: off_boresight_rad.to_degrees(),
                    earth_occulted: occulted,
                    range_m: range,
                    path_loss_db: path_loss,
                    tx_gain_dbi: tx_gain,
                    received_power_dbw: p_rx,
                    cn0_dbhz: cn0,
                    trackable,
                    behind_antenna: behind,
                });
            }
            (links, trackable_positions)
        };

        let (links, trackable_positions) = epoch_links(epoch_s);

        // The sweep. Whether a satellite lands in the thin usable annulus outside the
        // Earth limb depends on where the constellation happens to be, so a single epoch
        // answers a different question from the one a resilience prior asks.
        let n_epochs = self.epochs.unwrap_or(64).max(1);
        let span_s = self.span_s.unwrap_or(43_082.0);
        let mut sweep_epochs = Vec::with_capacity(n_epochs);
        for k in 0..n_epochs {
            let t = epoch_s
                + if n_epochs == 1 {
                    0.0
                } else {
                    span_s * k as f64 / n_epochs as f64
                };
            let (ls, pos) = epoch_links(t);
            let best = ls
                .iter()
                .filter(|l| l.trackable)
                .map(|l| l.cn0_dbhz)
                .fold(None::<f64>, |a, v| Some(a.map_or(v, |x: f64| x.max(v))));
            sweep_epochs.push(SweepEpoch {
                t_s: t,
                n_trackable: pos.len(),
                best_cn0_dbhz: best,
                pdop: dop(user, &pos).map(|d| d.pdop),
            });
        }
        let n = sweep_epochs.len() as f64;
        let sweep = EpochSweep {
            signal_availability: sweep_epochs.iter().filter(|e| e.n_trackable >= 1).count() as f64
                / n,
            fix_availability: sweep_epochs.iter().filter(|e| e.n_trackable >= 4).count() as f64 / n,
            max_trackable: sweep_epochs
                .iter()
                .map(|e| e.n_trackable)
                .max()
                .unwrap_or(0),
            mean_trackable: sweep_epochs
                .iter()
                .map(|e| e.n_trackable as f64)
                .sum::<f64>()
                / n,
            best_cn0_dbhz: sweep_epochs
                .iter()
                .filter_map(|e| e.best_cn0_dbhz)
                .fold(None::<f64>, |a, v| Some(a.map_or(v, |x: f64| x.max(v)))),
            best_pdop: sweep_epochs
                .iter()
                .filter_map(|e| e.pdop)
                .fold(None::<f64>, |a, v| Some(a.map_or(v, |x: f64| x.min(v)))),
            span_s,
            epochs: sweep_epochs,
        };

        let n_geometrically_visible = links.iter().filter(|l| !l.earth_occulted).count();
        let n_trackable = trackable_positions.len();
        let best_cn0 = links
            .iter()
            .filter(|l| l.trackable)
            .map(|l| l.cn0_dbhz)
            .fold(None::<f64>, |acc, v| Some(acc.map_or(v, |a| a.max(v))));

        // The angular spread of the trackable lines of sight, as seen from the receiver.
        // Half the maximum pairwise angle: a direct measure of how nearly parallel they are.
        let los_cone_half_angle_deg = if trackable_positions.len() >= 2 {
            let dirs: Vec<Vec3> = trackable_positions
                .iter()
                .filter_map(|&s| unit(sub(s, user)))
                .collect();
            let mut max_sep: f64 = 0.0;
            for (i, a) in dirs.iter().enumerate() {
                for b in dirs.iter().skip(i + 1) {
                    max_sep = max_sep.max(dot(*a, *b).clamp(-1.0, 1.0).acos());
                }
            }
            Some(max_sep.to_degrees() / 2.0)
        } else {
            None
        };

        let earth_limb_half_angle_deg = {
            let r_orbit = (R_EARTH_EQUATORIAL_M / 1000.0 + altitude_km) * 1000.0;
            (R_EARTH_EQUATORIAL_M / r_orbit)
                .clamp(-1.0, 1.0)
                .asin()
                .to_degrees()
        };

        Ok(EarthGnssLunarReport {
            links,
            n_satellites: sats.len(),
            n_geometrically_visible,
            n_trackable,
            earth_limb_half_angle_deg,
            los_cone_half_angle_deg,
            dop: dop(user, &trackable_positions),
            best_cn0_dbhz: best_cn0,
            tx_boresight_gain_dbi: g0,
            tracking_threshold_dbhz: threshold,
            receiver_range_m: range_m,
            sweep,
        })
    }
}

/// Units and provenance for every numeric leaf. See [`crate::field_schema`].
const UNITS: &[(&str, &str, &str, &str)] = &[
    ("links[].sat_index", "1", "computed", "index in generation order"),
    (
        "links[].off_boresight_deg",
        "deg",
        "computed",
        "angle from the satellite's nadir direction to the receiver; the transmit beam is referenced to nadir",
    ),
    (
        "links[].range_m",
        "m",
        "computed",
        "straight-line transmitter-to-receiver distance",
    ),
    (
        "links[].path_loss_db",
        "dB",
        "closed-form",
        "free-space loss at the carrier; about 208 dB at L1 over the mean lunar distance",
    ),
    (
        "links[].tx_gain_dbi",
        "dBi",
        "modelled",
        "uniform-circular-aperture (Airy) gain at the off-boresight angle. A real GPS L1 antenna is a helical array with a shaped main lobe and non-Airy sidelobes, so this is a first-principles stand-in and not a measured beam",
    ),
    (
        "links[].received_power_dbw",
        "dBW",
        "computed",
        "tx_power + tx_gain - path_loss, isotropic at the receiver",
    ),
    (
        "links[].cn0_dbhz",
        "dB-Hz",
        "computed",
        "carrier-to-noise density with the receiving antenna gain applied; inherits the modelled transmit gain",
    ),
    (
        "links[].behind_antenna",
        "1",
        "computed",
        "boolean: the receiver lies behind the transmit aperture (off-boresight > 90 deg), where the Airy expression does not apply and a flat back-lobe floor is used instead",
    ),
    ("n_satellites", "count", "input", "constellation size"),
    (
        "n_geometrically_visible",
        "count",
        "computed",
        "satellites the Earth does not occult",
    ),
    (
        "n_trackable",
        "count",
        "computed",
        "of those, the ones clearing the tracking threshold",
    ),
    (
        "earth_limb_half_angle_deg",
        "deg",
        "closed-form",
        "asin(R_earth / r_orbit): the minimum off-boresight angle a lunar-bound ray must exceed to clear the Earth",
    ),
    (
        "los_cone_half_angle_deg",
        "deg",
        "computed",
        "half the largest pairwise angle between trackable lines of sight at the receiver; small means a nearly degenerate geometry",
    ),
    ("dop.gdop", "1", "computed", "geometric dilution of precision"),
    ("dop.pdop", "1", "computed", "position dilution of precision"),
    ("dop.hdop", "1", "computed", "horizontal dilution of precision"),
    ("dop.vdop", "1", "computed", "vertical dilution of precision"),
    ("dop.tdop", "1", "computed", "time dilution of precision"),
    (
        "best_cn0_dbhz",
        "dB-Hz",
        "computed",
        "strongest trackable link",
    ),
    (
        "tx_boresight_gain_dbi",
        "dBi",
        "modelled",
        "peak gain the pattern is referenced to",
    ),
    (
        "tracking_threshold_dbhz",
        "dB-Hz",
        "input",
        "carrier-to-noise density a link must reach to count as trackable",
    ),
    ("sweep.epochs[].t_s", "s", "computed", "seconds after the constellation epoch"),
    (
        "sweep.epochs[].n_trackable",
        "count",
        "computed",
        "links clearing the threshold in the forward hemisphere, un-occulted, at this epoch",
    ),
    (
        "sweep.epochs[].best_cn0_dbhz",
        "dB-Hz",
        "computed",
        "strongest trackable link at this epoch",
    ),
    (
        "sweep.epochs[].pdop",
        "1",
        "computed",
        "position dilution of precision at this epoch, absent below four links",
    ),
    ("sweep.span_s", "s", "input", "span the epochs cover"),
    (
        "sweep.signal_availability",
        "1",
        "computed",
        "fraction of epochs with at least ONE trackable link: a timing observation, not a fix",
    ),
    (
        "sweep.fix_availability",
        "1",
        "computed",
        "fraction of epochs with at least FOUR trackable links. This is the figure a layered-resilience prior should take from this scenario, not the signal availability",
    ),
    ("sweep.max_trackable", "count", "computed", "largest trackable count over the sweep"),
    ("sweep.mean_trackable", "count", "computed", "mean trackable count over the sweep"),
    (
        "sweep.best_cn0_dbhz",
        "dB-Hz",
        "computed",
        "best carrier-to-noise density anywhere in the sweep",
    ),
    (
        "sweep.best_pdop",
        "1",
        "computed",
        "smallest position dilution of precision anywhere in the sweep",
    ),
    (
        "receiver_range_m",
        "m",
        "input",
        "receiver distance from the Earth's centre; the Moon's position is an input here, not an ephemeris lookup",
    ),
];

fn units_block() -> serde_json::Value {
    let mut m = serde_json::Map::new();
    for (path, unit, provenance, note) in UNITS {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), serde_json::Value::String((*unit).into()));
        e.insert(
            "provenance".into(),
            serde_json::Value::String((*provenance).into()),
        );
        if !note.is_empty() {
            e.insert("note".into(), serde_json::Value::String((*note).into()));
        }
        m.insert((*path).into(), serde_json::Value::Object(e));
    }
    serde_json::Value::Object(m)
}

fn egl_json(r: &EarthGnssLunarReport) -> Result<String, String> {
    let mut doc = serde_json::to_value(r).map_err(|e| format!("serialising report: {e}"))?;
    match doc.as_object_mut() {
        Some(o) => {
            o.insert("units".into(), units_block());
        }
        None => return Err("the report must serialise to a JSON object".to_string()),
    }
    serde_json::to_string_pretty(&doc).map_err(|e| format!("serialising report: {e}"))
}

fn egl_summary(r: &EarthGnssLunarReport) -> String {
    let mut s = String::new();
    s.push_str(&format!(
        "Earth-GNSS at lunar distance — {} satellites, receiver at {:.0} km\n",
        r.n_satellites,
        r.receiver_range_m / 1000.0
    ));
    s.push_str(&format!(
        "  Earth limb from the constellation: {:.2} deg off nadir — any lunar-bound ray \
         must exceed this\n",
        r.earth_limb_half_angle_deg
    ));
    s.push_str(&format!(
        "  {} of {} not occulted; {} clear the {:.1} dB-Hz tracking threshold\n",
        r.n_geometrically_visible, r.n_satellites, r.n_trackable, r.tracking_threshold_dbhz
    ));
    match r.best_cn0_dbhz {
        Some(c) => s.push_str(&format!("  best link {c:.2} dB-Hz\n")),
        None => s.push_str("  no link reaches the threshold\n"),
    }
    match r.los_cone_half_angle_deg {
        Some(a) => s.push_str(&format!(
            "  every trackable line of sight lies inside a {a:.3} deg half-cone — the \
             geometry is nearly degenerate\n"
        )),
        None => s.push_str("  fewer than two trackable links; no angular spread to report\n"),
    }
    match &r.dop {
        Some(d) => s.push_str(&format!(
            "  GDOP {:.1}  PDOP {:.1}  HDOP {:.1}  VDOP {:.1}  TDOP {:.3}\n",
            d.gdop, d.pdop, d.hdop, d.vdop, d.tdop
        )),
        None => s.push_str("  fewer than four trackable links, or a singular geometry: no DOP\n"),
    }
    let w = &r.sweep;
    s.push_str(&format!(
        "  SWEEP over {} epochs / {:.0} s: signal availability {:.3}, FIX availability {:.3}\n",
        w.epochs.len(),
        w.span_s,
        w.signal_availability,
        w.fix_availability
    ));
    s.push_str(&format!(
        "    trackable links mean {:.2}, max {}; best C/N0 {}; best PDOP {}\n",
        w.mean_trackable,
        w.max_trackable,
        w.best_cn0_dbhz
            .map_or("none".to_string(), |v| format!("{v:.2} dB-Hz")),
        w.best_pdop
            .map_or("none".to_string(), |v| format!("{v:.1}"))
    ));
    s.push_str(
        "    Take the FIX availability as this layer's prior, not the signal availability:\n\
         \x20   one link is a clock observation, four are a position.\n",
    );
    s.push_str(
        "  MODELLED: the transmit gain is a uniform-aperture (Airy) stand-in, not a measured\n  \
         GPS beam, and no atmospheric, polarisation or implementation loss is applied — so the\n  \
         budget here is optimistic. Orders of magnitude and orderings are meaningful; an\n  \
         individual satellite's dB is not.\n",
    );
    s
}

fn egl_svg(r: &EarthGnssLunarReport) -> String {
    let (w, h) = (900.0_f64, 420.0_f64);
    let mut s = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">\
         <rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>\
         <text x=\"24\" y=\"30\" font-size=\"15\" fill=\"#e8e0d0\">\
         Earth-GNSS at lunar distance — C/N0 against off-boresight angle</text>"
    );
    let (ml, mt, pw, ph) = (70.0_f64, 56.0_f64, w - 110.0, h - 110.0);
    let cn0s: Vec<f64> = r.links.iter().map(|l| l.cn0_dbhz).collect();
    let lo = cn0s
        .iter()
        .cloned()
        .fold(f64::INFINITY, f64::min)
        .min(r.tracking_threshold_dbhz)
        - 3.0;
    let hi = cn0s
        .iter()
        .cloned()
        .fold(f64::NEG_INFINITY, f64::max)
        .max(r.tracking_threshold_dbhz)
        + 3.0;
    let span = (hi - lo).max(1e-6);
    let max_ang = r
        .links
        .iter()
        .map(|l| l.off_boresight_deg)
        .fold(1.0_f64, f64::max);

    // Axes.
    s.push_str(&format!(
        "<line x1=\"{ml}\" y1=\"{}\" x2=\"{}\" y2=\"{}\" stroke=\"#3a352c\"/>\
         <line x1=\"{ml}\" y1=\"{mt}\" x2=\"{ml}\" y2=\"{}\" stroke=\"#3a352c\"/>",
        mt + ph,
        ml + pw,
        mt + ph,
        mt + ph
    ));
    // Threshold line.
    let ty = mt + ph - (r.tracking_threshold_dbhz - lo) / span * ph;
    s.push_str(&format!(
        "<line x1=\"{ml}\" y1=\"{ty:.1}\" x2=\"{:.1}\" y2=\"{ty:.1}\" stroke=\"#b4553c\" \
         stroke-dasharray=\"5,4\"/>\
         <text x=\"{:.1}\" y=\"{:.1}\" fill=\"#b4553c\">track {:.0} dB-Hz</text>",
        ml + pw,
        ml + pw - 96.0,
        ty - 5.0,
        r.tracking_threshold_dbhz
    ));
    // Earth-limb line.
    let lx = ml + (r.earth_limb_half_angle_deg / max_ang) * pw;
    s.push_str(&format!(
        "<line x1=\"{lx:.1}\" y1=\"{mt}\" x2=\"{lx:.1}\" y2=\"{:.1}\" stroke=\"#6f6858\" \
         stroke-dasharray=\"3,3\"/>\
         <text x=\"{:.1}\" y=\"{:.1}\" fill=\"#6f6858\">Earth limb {:.1}°</text>",
        mt + ph,
        lx + 6.0,
        mt + 14.0,
        r.earth_limb_half_angle_deg
    ));
    // One marker per link.
    for l in &r.links {
        let x = ml + (l.off_boresight_deg / max_ang) * pw;
        let y = mt + ph - (l.cn0_dbhz - lo) / span * ph;
        let (fill, rad) = if l.earth_occulted {
            ("#6f6858", 3.0)
        } else if l.trackable {
            ("#c9a227", 4.5)
        } else {
            ("#b4553c", 3.5)
        };
        s.push_str(&format!(
            "<circle cx=\"{x:.1}\" cy=\"{y:.1}\" r=\"{rad}\" fill=\"{fill}\"/>"
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" fill=\"#8d8577\">off-boresight angle (deg)</text>\
         <text x=\"20\" y=\"{:.0}\" fill=\"#8d8577\">C/N0 (dB-Hz)</text>\
         <text x=\"24\" y=\"{:.0}\" fill=\"#8d8577\">gold = trackable · red = too weak · \
         grey = Earth-occulted · MODELLED transmit pattern</text></svg>",
        ml + pw / 2.0 - 70.0,
        mt + ph + 34.0,
        mt - 12.0,
        h - 16.0
    ));
    s
}

// ---------------------------------------------------------------------------------------------
// Measured inputs: real satellite positions, per-satellite transmit power and tabulated gain
// patterns, in place of the Walker geometry and the Airy stand-in above.
// ---------------------------------------------------------------------------------------------

/// Boltzmann's constant in decibels, `−10 log10(1.380649e−23 J/K) = 228.6 dB(W/(Hz·K))⁻¹`.
pub const BOLTZMANN_DB: f64 = 228.599_166_3;

/// A tabulated antenna gain pattern: gain (dB) against off-boresight angle (deg), azimuth
/// averaged, linearly interpolated, and UNDEFINED outside the tabulated range (a link outside
/// it is reported, never extrapolated).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct GainTable {
    /// Off-boresight angles (deg), strictly increasing.
    pub angle_deg: Vec<f64>,
    /// Gain (dB, relative to isotropic) at each angle.
    pub gain_db: Vec<f64>,
}

impl GainTable {
    /// A table from `(angle_deg, gain_db)` pairs; `None` unless the angles strictly increase and
    /// there are at least two.
    pub fn new(points: &[(f64, f64)]) -> Option<Self> {
        if points.len() < 2 || points.windows(2).any(|w| w[1].0 <= w[0].0) {
            return None;
        }
        Some(Self {
            angle_deg: points.iter().map(|p| p.0).collect(),
            gain_db: points.iter().map(|p| p.1).collect(),
        })
    }

    /// Gain (dB) at `angle_deg`, or `None` outside the table.
    pub fn gain_at(&self, angle_deg: f64) -> Option<f64> {
        let a = &self.angle_deg;
        if !(angle_deg >= a[0] && angle_deg <= a[a.len() - 1]) {
            return None;
        }
        let k = a.partition_point(|&x| x <= angle_deg).clamp(1, a.len() - 1);
        let (x0, x1) = (a[k - 1], a[k]);
        let (y0, y1) = (self.gain_db[k - 1], self.gain_db[k]);
        Some(y0 + (y1 - y0) * (angle_deg - x0) / (x1 - x0))
    }
}

/// One transmitter-to-receiver link evaluated from measured inputs.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct MeasuredLink {
    /// Transmit off-boresight angle: between the transmitter's nadir and the receiver (deg).
    pub theta_tx_deg: f64,
    /// Receive off-boresight angle: between the receiving antenna boresight and the
    /// transmitter (deg).
    pub z_rx_deg: f64,
    /// Slant range (m).
    pub range_m: f64,
    /// Free-space loss `20 log10(4π r / λ)` (dB).
    pub free_space_loss_db: f64,
    /// Whether the straight path passes through the occulting sphere.
    pub occulted: bool,
    /// Carrier-to-noise density (dB-Hz) by the link equation
    /// `P_T + G_T(θ) + G_R(z) − 20 log10(4π r/λ) + 228.6 − (T_eq + L_R)`; `None` when either
    /// angle lies outside its gain table.
    pub cn0_dbhz: Option<f64>,
}

/// Evaluate one link from measured inputs: transmitter position `tx_m` (its antenna boresight
/// is its nadir, toward the origin), transmit power `tx_power_dbw` and pattern `tx_pattern`;
/// receiver position `rx_m`, receiving-antenna boresight `rx_boresight` (any length) and
/// pattern `rx_pattern`; carrier `freq_hz`; the receiver noise factor `T_eq + L_R` in dB
/// (`noise_factor_db`); and a spherical occulting body of radius `occulting_radius_m` at the
/// origin. This is the link budget of Montenbruck et al. (2023, J. Geod. 97:96, Eq. 4).
#[allow(clippy::too_many_arguments)]
pub fn measured_link(
    tx_m: Vec3,
    tx_power_dbw: f64,
    tx_pattern: &GainTable,
    rx_m: Vec3,
    rx_boresight: Vec3,
    rx_pattern: &GainTable,
    freq_hz: f64,
    noise_factor_db: f64,
    occulting_radius_m: f64,
) -> Option<MeasuredLink> {
    let los = sub(rx_m, tx_m);
    let range_m = norm(los);
    let u = unit(los)?;
    let nadir = unit([-tx_m[0], -tx_m[1], -tx_m[2]])?;
    let b = unit(rx_boresight)?;
    let theta_tx_deg = dot(nadir, u).clamp(-1.0, 1.0).acos().to_degrees();
    let z_rx_deg = dot(b, [-u[0], -u[1], -u[2]])
        .clamp(-1.0, 1.0)
        .acos()
        .to_degrees();
    let free_space_loss_db = free_space_path_loss_db(range_m, freq_hz);
    let occulted = segment_blocked_by_sphere(tx_m, rx_m, occulting_radius_m);
    let cn0_dbhz = match (
        tx_pattern.gain_at(theta_tx_deg),
        rx_pattern.gain_at(z_rx_deg),
    ) {
        (Some(gt), Some(gr)) => {
            Some(tx_power_dbw + gt + gr - free_space_loss_db + BOLTZMANN_DB - noise_factor_db)
        }
        _ => None,
    };
    Some(MeasuredLink {
        theta_tx_deg,
        z_rx_deg,
        range_m,
        free_space_loss_db,
        occulted,
        cn0_dbhz,
    })
}

/// Acquisition-and-tracking state over an epoch series for one satellite: a signal not being
/// tracked is acquired when its C/N0 reaches `acquire_dbhz`; once tracked it is kept while the
/// C/N0 stays at or above `track_dbhz`. `None` (no usable link) drops the track.
pub fn track_with_hysteresis(
    cn0_dbhz: &[Option<f64>],
    acquire_dbhz: f64,
    track_dbhz: f64,
) -> Vec<bool> {
    let mut on = false;
    cn0_dbhz
        .iter()
        .map(|c| {
            on = match c {
                Some(v) if on => *v >= track_dbhz,
                Some(v) => *v >= acquire_dbhz,
                None => false,
            };
            on
        })
        .collect()
}

// ── Relative C/N0 with measured two-dimensional transmit patterns ───────────────────────

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// The nominal yaw-steering body axes `[x, y, z]` of a GNSS satellite at `sat_m` with the Sun
/// at `sun_m` (same frame and origin, the Earth's centre): `z` toward the Earth's centre, `y`
/// along `z × (Sun direction)`, normal to the plane of Earth, satellite and Sun, and `x`
/// completing the right-handed set, so that the Sun lies in the `+x` half of the `x`–`z`
/// plane. This is the nominal attitude of the IGS (International GNSS Service) convention;
/// eclipse-season yaw manoeuvres are not modelled. `None` when the Sun is collinear with the
/// nadir.
pub fn yaw_steering_axes(sat_m: Vec3, sun_m: Vec3) -> Option<[Vec3; 3]> {
    let z = unit([-sat_m[0], -sat_m[1], -sat_m[2]])?;
    let s = unit(sub(sun_m, sat_m))?;
    let y = unit(cross(z, s))?;
    let x = cross(y, z);
    Some([x, y, z])
}

/// Off-boresight (off-nadir) angle and azimuth (deg) of the receiver at `rx_m` in the
/// yaw-steering body frame of a transmitter at `tx_m`: azimuth measured in the body `x`–`y`
/// plane from `+x` toward `+y`, in `[0, 360)`.
pub fn transmit_angles(tx_m: Vec3, sun_m: Vec3, rx_m: Vec3) -> Option<(f64, f64)> {
    let [x, y, z] = yaw_steering_axes(tx_m, sun_m)?;
    let u = unit(sub(rx_m, tx_m))?;
    let theta = dot(u, z).clamp(-1.0, 1.0).acos().to_degrees();
    let az = dot(u, y).atan2(dot(u, x)).to_degrees().rem_euclid(360.0);
    Some((theta, az))
}

/// The transmitter-dependent part of the link budget (dB): transmit power plus the
/// tabulated transmit gain toward the receiver minus the free-space loss,
/// `P_T + G_T(φ, θ) − 20 log10(4π r / λ)`. Everything that is common to the satellites a
/// receiver tracks at one instant (its own gain toward a common direction, its noise, any
/// common implementation loss) is left out, so the DIFFERENCE of two of these values at the
/// same epoch is the predicted difference of their carrier-to-noise densities. `None` when
/// the angle is outside the pattern or the path is blocked by a sphere of
/// `occulting_radius_m` at the origin.
pub fn transmit_side_db(
    tx_m: Vec3,
    sun_m: Vec3,
    rx_m: Vec3,
    tx_power_dbw: f64,
    pattern: &GainPattern2D,
    freq_hz: f64,
    occulting_radius_m: f64,
) -> Option<f64> {
    if segment_blocked_by_sphere(tx_m, rx_m, occulting_radius_m) {
        return None;
    }
    let (theta, az) = transmit_angles(tx_m, sun_m, rx_m)?;
    let g = pattern.gain_at(az, theta)?;
    Some(tx_power_dbw + g - free_space_path_loss_db(norm(sub(rx_m, tx_m)), freq_hz))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gain_table_interpolates_and_refuses_to_extrapolate() {
        let t = GainTable::new(&[(0.0, 10.0), (10.0, 14.0), (20.0, 4.0)]).expect("table");
        assert_eq!(t.gain_at(5.0), Some(12.0));
        assert_eq!(t.gain_at(20.0), Some(4.0));
        assert_eq!(t.gain_at(20.1), None);
        assert_eq!(t.gain_at(-0.1), None);
        assert!(GainTable::new(&[(0.0, 1.0), (0.0, 2.0)]).is_none());
    }

    #[test]
    fn measured_link_matches_a_hand_budget() {
        // Transmitter on the +x axis at GPS radius, receiver below it on the same axis with a
        // zenith-pointing antenna: both off-boresight angles are zero.
        let tx = [26_560e3, 0.0, 0.0];
        let rx = [7_000e3, 0.0, 0.0];
        let flat = GainTable::new(&[(0.0, 3.0), (180.0, 3.0)]).expect("table");
        let l = measured_link(
            tx,
            14.5,
            &flat,
            rx,
            [1.0, 0.0, 0.0],
            &flat,
            L1_HZ,
            28.5,
            6_378e3,
        )
        .expect("link");
        assert!(l.theta_tx_deg.abs() < 1e-5 && l.z_rx_deg.abs() < 1e-5);
        assert!(!l.occulted);
        let lambda = 299_792_458.0 / L1_HZ;
        let fsl = 20.0 * (4.0 * std::f64::consts::PI * 19_560e3 / lambda).log10();
        let want = 14.5 + 3.0 + 3.0 - fsl + BOLTZMANN_DB - 28.5;
        assert!((l.cn0_dbhz.expect("cn0") - want).abs() < 1e-9);
        // A receiver on the far side of the Earth is occulted.
        let far = measured_link(
            tx,
            14.5,
            &flat,
            [-7_000e3, 0.0, 0.0],
            [1.0, 0.0, 0.0],
            &flat,
            L1_HZ,
            28.5,
            6_378e3,
        )
        .expect("link");
        assert!(far.occulted);
    }

    #[test]
    fn hysteresis_acquires_high_and_keeps_low() {
        let c = [
            Some(27.0),
            Some(31.0),
            Some(26.0),
            Some(24.9),
            Some(26.0),
            Some(30.0),
            None,
            Some(29.0),
        ];
        let t = track_with_hysteresis(&c, 30.0, 25.0);
        assert_eq!(t, vec![false, true, true, false, false, true, false, false]);
    }

    fn scn() -> EarthGnssLunarScenario {
        EarthGnssLunarScenario {
            kind: None,
            altitude_km: None,
            inclination_deg: None,
            planes: None,
            sats_per_plane: None,
            phasing_f: None,
            epoch_s: None,
            receiver_range_m: None,
            receiver_ra_deg: None,
            receiver_dec_deg: None,
            tx_power_dbw: None,
            tx_diameter_m: None,
            tx_efficiency: None,
            freq_hz: None,
            rx_gain_dbi: None,
            system_temp_k: None,
            tracking_threshold_dbhz: None,
            back_lobe_suppression_db: None,
            epochs: None,
            span_s: None,
        }
    }

    #[test]
    fn the_earth_occults_the_near_side_and_not_the_far_side() {
        let r = R_EARTH_EQUATORIAL_M;
        // A satellite on the +x side, a receiver on the -x side: the Earth is between them.
        assert!(segment_blocked_by_sphere(
            [2.0 * r, 0.0, 0.0],
            [-40.0 * r, 0.0, 0.0],
            r
        ));
        // Both on the same side, well clear of the disc: nothing in the way.
        assert!(!segment_blocked_by_sphere(
            [2.0 * r, 0.0, 0.0],
            [40.0 * r, 0.1 * r, 0.0],
            r
        ));
        // A body BEHIND the transmitter must not occult: the closest approach of the
        // infinite line is inside the Earth, but not inside the segment.
        assert!(!segment_blocked_by_sphere(
            [2.0 * r, 0.0, 0.0],
            [40.0 * r, 0.0, 0.0],
            r
        ));
    }

    #[test]
    fn the_limb_angle_is_the_closed_form_and_bounds_every_usable_ray() {
        let rep = scn().compute().expect("default scenario runs");
        // asin(R_earth / (R_earth + 20180 km)) = 13.9 deg or so.
        let want = (R_EARTH_EQUATORIAL_M / (R_EARTH_EQUATORIAL_M + 20_180_000.0))
            .asin()
            .to_degrees();
        assert!(
            (rep.earth_limb_half_angle_deg - want).abs() < 1e-9,
            "limb angle {} vs closed form {want}",
            rep.earth_limb_half_angle_deg
        );
        // Physics, not bookkeeping: every un-occulted link must lie outside the limb cone.
        for l in rep.links.iter().filter(|l| !l.earth_occulted) {
            assert!(
                l.off_boresight_deg >= rep.earth_limb_half_angle_deg - 1e-6,
                "sat {} is not occulted yet sits {:.4} deg off nadir, inside the {:.4} deg \
                 limb cone — the occultation test and the limb angle disagree",
                l.sat_index,
                l.off_boresight_deg,
                rep.earth_limb_half_angle_deg
            );
        }
    }

    #[test]
    fn the_path_loss_is_about_208_db_at_l1_over_the_lunar_distance() {
        let rep = scn().compute().expect("runs");
        for l in &rep.links {
            assert!(
                (200.0..215.0).contains(&l.path_loss_db),
                "sat {} path loss {:.2} dB is outside the plausible lunar-range band",
                l.sat_index,
                l.path_loss_db
            );
            // Every satellite is within one constellation diameter of the Earth, so the
            // range must sit close to the receiver's own distance.
            assert!(
                (l.range_m - MEAN_LUNAR_DISTANCE_M).abs() < 60_000_000.0,
                "sat {} range {:.0} m is implausible for a lunar receiver",
                l.sat_index,
                l.range_m
            );
        }
    }

    #[test]
    fn the_geometry_is_nearly_degenerate_and_the_report_says_so() {
        let rep = scn().compute().expect("runs");
        if let Some(cone) = rep.los_cone_half_angle_deg {
            assert!(
                cone < 5.0,
                "the trackable lines of sight span a {cone:.3} deg half-cone; from lunar \
                 distance the whole constellation subtends a couple of degrees, so a larger \
                 spread means the geometry is wrong"
            );
        }
        // If a DOP exists at all it must be enormous — that is the layer's defining property.
        if let Some(d) = &rep.dop {
            assert!(
                d.pdop > 50.0,
                "PDOP {:.2} is far too good for a source set confined to a two-degree cone; \
                 a plausible-looking PDOP here means the geometry is not what it should be",
                d.pdop
            );
        }
    }

    #[test]
    fn occulted_links_never_count_as_trackable() {
        let rep = scn().compute().expect("runs");
        for l in &rep.links {
            if l.earth_occulted {
                assert!(
                    !l.trackable,
                    "sat {} is Earth-occulted and yet marked trackable",
                    l.sat_index
                );
            }
        }
        assert_eq!(
            rep.n_trackable,
            rep.links.iter().filter(|l| l.trackable).count(),
            "the trackable count must equal the rows marked trackable"
        );
        assert!(
            rep.n_trackable <= rep.n_geometrically_visible,
            "a link cannot be trackable without being geometrically visible"
        );
    }

    #[test]
    fn a_bigger_receiving_antenna_helps_and_a_higher_bar_hurts() {
        let base = scn().compute().expect("runs");
        let mut better = scn();
        better.rx_gain_dbi = Some(24.0);
        let b = better.compute().expect("runs");
        assert!(
            b.n_trackable >= base.n_trackable,
            "12 dB more receiving gain must not reduce the trackable count ({} -> {})",
            base.n_trackable,
            b.n_trackable
        );
        let mut stricter = scn();
        stricter.tracking_threshold_dbhz = Some(45.0);
        let s = stricter.compute().expect("runs");
        assert!(
            s.n_trackable <= base.n_trackable,
            "a 20 dB stricter threshold must not increase the trackable count"
        );
    }

    #[test]
    fn the_transmit_gain_falls_away_from_boresight() {
        let rep = scn().compute().expect("runs");
        let g0 = rep.tx_boresight_gain_dbi;
        for l in &rep.links {
            assert!(
                l.tx_gain_dbi <= g0 + 1e-9,
                "sat {} reports {:.3} dBi off boresight, above the {:.3} dBi peak",
                l.sat_index,
                l.tx_gain_dbi,
                g0
            );
        }
    }

    #[test]
    fn a_receiver_inside_the_earth_is_refused() {
        let mut s = scn();
        s.receiver_range_m = Some(1000.0);
        let err = s
            .compute()
            .expect_err("a receiver inside the Earth must be refused");
        assert!(err.contains("outside the Earth"), "unhelpful error: {err}");
    }

    /// The sweep must actually sweep.
    ///
    /// This exists because it did not. The per-epoch closure took a time argument and its
    /// body still called `position_eci(epoch_s)`, so all 64 epochs recomputed the identical
    /// snapshot. The result looked entirely plausible — a clean 0.000 availability — and it
    /// was wrong: running the same scenario by hand at t = 30000 s gives a 30 dB-Hz link.
    /// A frozen sweep is invisible in aggregates, so assert the variation directly.
    #[test]
    fn the_sweep_actually_varies_with_epoch() {
        let rep = scn().compute().expect("runs");
        let w = &rep.sweep;
        assert!(w.epochs.len() > 8, "too few epochs to judge variation");

        // The sampled times must differ.
        let t0 = w.epochs[0].t_s;
        assert!(
            w.epochs.iter().any(|e| (e.t_s - t0).abs() > 1.0),
            "every sweep epoch carries the same timestamp"
        );

        // And so must the geometry they produce. If every epoch reports an identical
        // trackable count AND an identical best C/N0, the constellation is not moving.
        let counts: std::collections::BTreeSet<usize> =
            w.epochs.iter().map(|e| e.n_trackable).collect();
        let cn0_spread = {
            let vals: Vec<f64> = w.epochs.iter().filter_map(|e| e.best_cn0_dbhz).collect();
            match (
                vals.iter()
                    .cloned()
                    .fold(None::<f64>, |a, v| Some(a.map_or(v, |x: f64| x.min(v)))),
                vals.iter()
                    .cloned()
                    .fold(None::<f64>, |a, v| Some(a.map_or(v, |x: f64| x.max(v)))),
            ) {
                (Some(lo), Some(hi)) => hi - lo,
                _ => 0.0,
            }
        };
        assert!(
            counts.len() > 1 || cn0_spread > 0.1,
            "the sweep produced one trackable count ({counts:?}) and a C/N0 spread of \
             {cn0_spread:.4} dB across {} epochs — the constellation is not being \
             propagated, the epoch argument is being ignored somewhere",
            w.epochs.len()
        );
    }

    /// What the sweep is FOR: a layer prior. Signal availability and fix availability are
    /// different questions and the report must not let them be confused.
    #[test]
    fn signal_availability_and_fix_availability_are_distinct_and_ordered() {
        let rep = scn().compute().expect("runs");
        let w = &rep.sweep;
        assert!(
            (0.0..=1.0).contains(&w.signal_availability)
                && (0.0..=1.0).contains(&w.fix_availability),
            "availabilities must be fractions"
        );
        assert!(
            w.fix_availability <= w.signal_availability,
            "four links cannot be available more often than one: fix {:.3} > signal {:.3}",
            w.fix_availability,
            w.signal_availability
        );
        // Four links are the minimum for a four-state fix; the sweep must agree with itself.
        let epochs_with_four = w.epochs.iter().filter(|e| e.n_trackable >= 4).count();
        assert!(
            (w.fix_availability * w.epochs.len() as f64 - epochs_with_four as f64).abs() < 1e-9,
            "fix_availability disagrees with the per-epoch rows"
        );
        for e in &w.epochs {
            if e.n_trackable < 4 {
                assert!(
                    e.pdop.is_none(),
                    "epoch {} reports a PDOP from {} links; four is the minimum",
                    e.t_s,
                    e.n_trackable
                );
            }
        }
    }

    #[test]
    fn every_numeric_leaf_the_report_emits_carries_a_units_entry() {
        let (json, _, _) = scn().run_output().expect("runs");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        let units = v["units"].as_object().expect("a units block");
        assert_eq!(
            units.len(),
            UNITS.len(),
            "the emitted units block must carry every declared entry"
        );
        for (path, _, _, _) in UNITS {
            assert!(units.contains_key(*path), "{path} missing from the block");
        }
    }

    #[test]
    fn yaw_steering_frame_is_right_handed_with_the_sun_toward_plus_x() {
        let sat = [26_560e3, 0.0, 0.0];
        let sun = [1.0e11, 1.0e11, 2.0e10];
        let [x, y, z] = yaw_steering_axes(sat, sun).unwrap();
        assert!((dot(cross(x, y), z) - 1.0).abs() < 1e-12);
        assert!((z[0] + 1.0).abs() < 1e-12);
        let s = unit(sub(sun, sat)).unwrap();
        assert!(dot(s, x) > 0.0 && dot(s, y).abs() < 1e-12);
        // A receiver straight below is at zero off-nadir.
        let (th, _) = transmit_angles(sat, sun, [0.0, 0.0, 0.0]).unwrap();
        assert!(th.abs() < 1e-9);
        // A receiver displaced toward +y of the body frame is at azimuth 90.
        let rx = [0.0, 0.0, 0.0];
        let rx = [rx[0] + 1e6 * y[0], rx[1] + 1e6 * y[1], rx[2] + 1e6 * y[2]];
        let (_, az) = transmit_angles(sat, sun, rx).unwrap();
        assert!((az - 90.0).abs() < 1e-9, "{az}");
    }

    #[test]
    fn transmit_side_differences_follow_gain_and_range() {
        let p = GainPattern2D::new(
            vec![0.0, 180.0],
            vec![0.0, 30.0],
            vec![vec![10.0, 4.0], vec![10.0, 4.0]],
        )
        .unwrap();
        let sun = [1.5e11, 0.0, 0.0];
        let tx = [0.0, 26_560e3, 0.0];
        let near = [0.0, 6_378e3 + 400e3, 0.0];
        let a = transmit_side_db(tx, sun, near, 14.5, &p, L1_HZ, 6_378e3).unwrap();
        let fspl = free_space_path_loss_db(26_560e3 - 6_778e3, L1_HZ);
        assert!((a - (14.5 + 10.0 - fspl)).abs() < 1e-9);
        // Behind the Earth: occulted.
        assert!(
            transmit_side_db(tx, sun, [0.0, -7_000e3, 0.0], 14.5, &p, L1_HZ, 6_378e3).is_none()
        );
    }
}
