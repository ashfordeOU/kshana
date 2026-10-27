// SPDX-License-Identifier: AGPL-3.0-only
//! The ground-network overlay of a mission thread: not a phase, but a coverage computation the
//! thread runs before any phase that lists `ground-tracking`, giving the fraction of the phase a
//! station can track the vehicle. That fraction scales the update rate of the phase's ground
//! tracking ([`crate::mission_thread::PhaseCtx::ground_duty`]).
//!
//! **MODELLED.** A station sees the vehicle when the vehicle is above the stated minimum
//! elevation at the station's geodetic horizon. Three geometries are stated per phase, and the
//! phase's row says which was used:
//!
//! * `entry-orbit`: the entry state flown two-body with J2 for the phase (right for low-Earth-orbit
//!   phases; it is not the phase's own trajectory, only a stand-in for its geometry);
//! * `moon-direction`: the vehicle at the Moon's geocentric position (from the thread's Moon kernel
//!   where it covers the epoch, else the analytic series), right for the cislunar cruise to
//!   within the vehicle's offset from the Moon;
//! * `stated`: a duty the document states, with no geometry computed.
//!
//! Earth rotation uses the mean sidereal angle with UTC standing in for UT1 (below a second of
//! time, 15 arcseconds). A station change loses `handover_gap_s` of tracking, so the duty is the
//! visible time less the handover losses, never below zero. Nothing here models a particular
//! network's antennas, schedules or availability.

use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::integrator::Tolerance;
use crate::jd2::{gmst82, Jd2};
use crate::mission_thread::budget::BudgetRow;
use crate::mission_thread::phase::{EvidenceLabel, Frame, NavState};
use crate::mission_thread::ThreadCtx;
use crate::propagator::{propagate_dop853, ForceModel};
use serde::Deserialize;

/// A ground station.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct StationDoc {
    /// A name unique within the network.
    pub id: String,
    /// Geodetic latitude, degrees.
    pub lat_deg: f64,
    /// Longitude, degrees east.
    pub lon_deg: f64,
    /// Height above the ellipsoid, metres.
    #[serde(default)]
    pub alt_m: f64,
}

/// How one phase's coverage is computed.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct GroundPhaseDoc {
    /// The phase id.
    pub phase: String,
    /// `entry-orbit`, `moon-direction` or `stated`.
    pub geometry: String,
    /// The duty a `stated` geometry states, in [0, 1].
    #[serde(default)]
    pub duty: Option<f64>,
}

/// The `[ground_network]` table of a thread document.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct GroundNetworkDoc {
    /// The lowest elevation at which a station tracks, degrees.
    pub min_elevation_deg: f64,
    /// Tracking lost at each change of station, seconds.
    #[serde(default)]
    pub handover_gap_s: f64,
    /// Sampling step of the geometry, seconds.
    #[serde(default = "default_step")]
    pub step_s: f64,
    /// The stations.
    pub stations: Vec<StationDoc>,
    /// Per-phase geometry.
    #[serde(default)]
    pub phases: Vec<GroundPhaseDoc>,
}

fn default_step() -> f64 {
    60.0
}

/// What the overlay finds for one phase.
#[derive(Clone, Debug, PartialEq)]
pub struct Coverage {
    /// The tracking duty after handover losses, in [0, 1].
    pub duty: f64,
    /// The fraction of the time at least one station sees the vehicle, before handover losses.
    pub visible_fraction: f64,
    /// Station changes while the vehicle stayed in view.
    pub handovers: usize,
    /// The longest interval with no station in view, seconds.
    pub longest_gap_s: f64,
    /// The geometry used.
    pub geometry: String,
}

impl GroundNetworkDoc {
    /// Checks the numbers before any phase runs.
    pub fn validate(&self) -> Result<(), String> {
        if !(self.min_elevation_deg.is_finite() && (0.0..90.0).contains(&self.min_elevation_deg)) {
            return Err(crate::terr!(
                "e-mission-thread-earth-ground-network-ground-network-min-elevation-deg",
                min_elevation_deg = crate::i18n::num_plain(self.min_elevation_deg)
            ));
        }
        if !(self.handover_gap_s.is_finite() && self.handover_gap_s >= 0.0) {
            return Err(crate::terr!(
                "e-mission-thread-earth-ground-network-ground-network-handover-gap-must"
            ));
        }
        if !(self.step_s.is_finite() && self.step_s > 0.0) {
            return Err(crate::terr!(
                "e-mission-thread-earth-ground-network-ground-network-step-must-be"
            ));
        }
        if self.stations.is_empty() {
            return Err(crate::terr!(
                "e-mission-thread-earth-ground-network-ground-network-needs-at-least"
            ));
        }
        for (i, s) in self.stations.iter().enumerate() {
            if !(s.lat_deg.is_finite() && s.lat_deg.abs() <= 90.0 && s.lon_deg.is_finite()) {
                return Err(crate::terr!(
                    "e-mission-thread-earth-ground-network-ground-network-station-has-an",
                    id = s.id
                ));
            }
            if self.stations[..i].iter().any(|o| o.id == s.id) {
                return Err(crate::terr!(
                    "e-mission-thread-earth-ground-network-ground-network-station-id-is",
                    id = s.id
                ));
            }
        }
        for p in &self.phases {
            match p.geometry.as_str() {
                "entry-orbit" | "moon-direction" => {}
                "stated" => {
                    let d = p.duty.ok_or_else(|| {
                        crate::terr!("e-mission-thread-earth-ground-network-ground-network-phase-has-geometry", phase = p.phase)
                    })?;
                    if !(0.0..=1.0).contains(&d) {
                        return Err(crate::terr!(
                            "e-mission-thread-earth-ground-network-ground-network-phase-duty-must",
                            phase = p.phase,
                            d = crate::i18n::num_plain(d)
                        ));
                    }
                }
                other => {
                    return Err(crate::terr!(
                        "e-mission-thread-earth-ground-network-ground-network-phase-has-unknown",
                        phase = p.phase,
                        other = other
                    ))
                }
            }
        }
        Ok(())
    }

    /// The geometry stated for a phase, if the overlay covers it.
    pub fn for_phase(&self, id: &str) -> Option<&GroundPhaseDoc> {
        self.phases.iter().find(|p| p.phase == id)
    }
}

/// A station's ECEF position and geodetic normal.
fn station_frame(s: &StationDoc) -> ([f64; 3], [f64; 3]) {
    let (lat, lon) = (s.lat_deg.to_radians(), s.lon_deg.to_radians());
    let p = geodetic_to_ecef(Geodetic {
        lat_rad: lat,
        lon_rad: lon,
        alt_m: s.alt_m,
    });
    let n = [lat.cos() * lon.cos(), lat.cos() * lon.sin(), lat.sin()];
    (p, n)
}

/// Rotates an ECEF vector into the inertial frame by the sidereal angle.
fn to_inertial(v: [f64; 3], gmst: f64) -> [f64; 3] {
    let (s, c) = gmst.sin_cos();
    [c * v[0] - s * v[1], s * v[0] + c * v[1], v[2]]
}

/// The vehicle's inertial positions at `0, step, 2 step, ...` over the duration, by the stated
/// geometry.
fn vehicle_positions(
    geometry: &str,
    ctx: &ThreadCtx,
    entry: &NavState,
    duration_s: f64,
    step_s: f64,
) -> Result<Vec<[f64; 3]>, String> {
    let n = (duration_s / step_s).floor() as usize + 1;
    let mut out = Vec::with_capacity(n);
    match geometry {
        "entry-orbit" => {
            let tol = Tolerance {
                rtol: 1e-10,
                atol: 1e-6,
                h_min: 1e-6,
                h_max: 60.0,
            };
            let model = ForceModel::with_j2();
            let mut r = [entry.x[0], entry.x[1], entry.x[2]];
            let mut v = [entry.x[3], entry.x[4], entry.x[5]];
            out.push(r);
            for _ in 1..n {
                let (r1, v1) = propagate_dop853(r, v, step_s, &model, &tol);
                if !r1.iter().all(|c| c.is_finite()) {
                    return Err(crate::terr!(
                        "e-mission-thread-earth-ground-network-ground-network-the-entry-orbit"
                    ));
                }
                r = r1;
                v = v1;
                out.push(r);
            }
        }
        "moon-direction" => {
            for k in 0..n {
                let jd = crate::lunar_phase::epoch_jd(ctx, entry.t_s + k as f64 * step_s)?;
                let from_kernel = ctx.moon_kernel.as_ref().and_then(|kern| {
                    use crate::ephem_provider::EphemerisProvider;
                    kern.relative_position(
                        &crate::body::Body::moon(),
                        &crate::body::Body::earth(),
                        jd,
                    )
                });
                out.push(from_kernel.unwrap_or_else(|| crate::ephem::moon_icrf(jd)));
            }
        }
        other => {
            return Err(crate::terr!(
                "e-mission-thread-earth-ground-network-ground-network-no-geometry-to",
                other = other
            ))
        }
    }
    Ok(out)
}

/// The coverage of one phase. `entry` must be in GCRF.
pub fn coverage(
    net: &GroundNetworkDoc,
    spec: &GroundPhaseDoc,
    ctx: &ThreadCtx,
    entry: &NavState,
    duration_s: f64,
) -> Result<Coverage, String> {
    if spec.geometry == "stated" {
        let d = spec.duty.unwrap_or(0.0);
        return Ok(Coverage {
            duty: d,
            visible_fraction: d,
            handovers: 0,
            longest_gap_s: 0.0,
            geometry: "stated".to_string(),
        });
    }
    if entry.frame != Frame::Gcrf {
        return Err(crate::terr!(
            "e-mission-thread-earth-ground-network-ground-network-phase-needs-gcrf",
            phase = spec.phase,
            frame = format!("{:?}", entry.frame)
        ));
    }
    let pos = vehicle_positions(&spec.geometry, ctx, entry, duration_s, net.step_s)?;
    let frames: Vec<([f64; 3], [f64; 3])> = net.stations.iter().map(station_frame).collect();
    let sin_min = net.min_elevation_deg.to_radians().sin();
    let (mut visible, mut handovers) = (0usize, 0usize);
    let (mut gap, mut longest_gap) = (0.0_f64, 0.0_f64);
    let mut last: Option<usize> = None;
    for (k, r) in pos.iter().enumerate() {
        let t = k as f64 * net.step_s;
        let jd = crate::lunar_phase::epoch_jd(ctx, entry.t_s + t)?;
        let gmst = gmst82(Jd2::new(jd));
        // The station with the highest elevation among those above the minimum.
        let mut best: Option<(usize, f64)> = None;
        for (i, (p, nrm)) in frames.iter().enumerate() {
            let sp = to_inertial(*p, gmst);
            let up = to_inertial(*nrm, gmst);
            let d = [r[0] - sp[0], r[1] - sp[1], r[2] - sp[2]];
            let dn = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            let s = (d[0] * up[0] + d[1] * up[1] + d[2] * up[2]) / dn;
            if s >= sin_min && best.is_none_or(|(_, b)| s > b) {
                best = Some((i, s));
            }
        }
        match best {
            Some((i, _)) => {
                visible += 1;
                if let Some(prev) = last {
                    if prev != i {
                        handovers += 1;
                    }
                }
                last = Some(i);
                longest_gap = longest_gap.max(gap);
                gap = 0.0;
            }
            None => {
                gap += net.step_s;
                last = None;
            }
        }
    }
    longest_gap = longest_gap.max(gap);
    let total = pos.len() as f64 * net.step_s;
    let visible_s = visible as f64 * net.step_s;
    let lost = handovers as f64 * net.handover_gap_s;
    Ok(Coverage {
        duty: ((visible_s - lost) / total).clamp(0.0, 1.0),
        visible_fraction: visible_s / total,
        handovers,
        longest_gap_s: longest_gap,
        geometry: spec.geometry.clone(),
    })
}

impl Coverage {
    /// The budget rows and the event text the thread adds to the phase.
    pub fn rows(&self, net: &GroundNetworkDoc) -> (Vec<BudgetRow>, String) {
        let rows = vec![BudgetRow {
            source: format!(
                "ground network ({} stations, {:.0} deg minimum elevation, geometry {}): longest interval with no station in view",
                net.stations.len(),
                net.min_elevation_deg,
                self.geometry
            ),
            sigma: self.longest_gap_s,
            unit: "s".to_string(),
            label: EvidenceLabel::modelled(),
        }];
        let text = format!(
            "ground network: tracking duty {:.1} % ({:.1} % in view, {} station handovers of {:.0} s each)",
            100.0 * self.duty,
            100.0 * self.visible_fraction,
            self.handovers,
            net.handover_gap_s
        );
        (rows, text)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::phase::Timescale;

    fn net(extra: &str) -> GroundNetworkDoc {
        toml::from_str(&format!(
            "min_elevation_deg = 10.0\nhandover_gap_s = 120.0\nstep_s = 60.0\n\
             [[stations]]\nid = \"west\"\nlat_deg = 35.4\nlon_deg = -116.9\n\
             [[stations]]\nid = \"east\"\nlat_deg = -35.4\nlon_deg = 148.98\n\
             [[stations]]\nid = \"mid\"\nlat_deg = 40.4\nlon_deg = -4.25\n{extra}"
        ))
        .unwrap()
    }

    fn leo_entry() -> NavState {
        let x = super::super::orbit::circular_state(400_000.0, 51.6, 0.0, 0.0);
        NavState::diagonal(0.0, Frame::Gcrf, x, 10.0, 0.01, Timescale::Utc, 1e-7, 1e-12)
    }

    fn spec(geometry: &str, duty: Option<f64>) -> GroundPhaseDoc {
        GroundPhaseDoc {
            phase: "p".to_string(),
            geometry: geometry.to_string(),
            duty,
        }
    }

    #[test]
    fn a_low_orbit_is_in_view_a_small_fraction_and_the_gaps_are_the_orbit_scale() {
        let ctx = ThreadCtx::new("2028-02-01T00:00:00Z", 1);
        let n = net("");
        n.validate().unwrap();
        let c = coverage(&n, &spec("entry-orbit", None), &ctx, &leo_entry(), 86_400.0).unwrap();
        assert!(
            c.visible_fraction > 0.02 && c.visible_fraction < 0.25,
            "{c:?}"
        );
        assert!(
            c.longest_gap_s > 1_000.0 && c.longest_gap_s < 43_200.0,
            "{c:?}"
        );
        assert!(c.duty <= c.visible_fraction);
        assert!(c.handovers <= 200);
    }

    #[test]
    fn the_moon_is_in_view_of_three_well_spread_stations_most_of_the_time() {
        let ctx = ThreadCtx::new("2028-02-01T00:00:00Z", 1);
        let n = net("");
        let c = coverage(
            &n,
            &spec("moon-direction", None),
            &ctx,
            &leo_entry(),
            3.0 * 86_400.0,
        )
        .unwrap();
        // Three stations 120 degrees apart in longitude keep a distant target in view nearly always.
        assert!(c.visible_fraction > 0.8, "{c:?}");
        // One station alone sees it about half of the time.
        let one = {
            let mut n1 = n.clone();
            n1.stations.truncate(1);
            coverage(
                &n1,
                &spec("moon-direction", None),
                &ctx,
                &leo_entry(),
                3.0 * 86_400.0,
            )
            .unwrap()
        };
        assert!(
            one.visible_fraction > 0.3 && one.visible_fraction < 0.7,
            "{one:?}"
        );
        assert!(c.visible_fraction > one.visible_fraction);
    }

    #[test]
    fn handover_losses_reduce_the_duty_and_never_below_zero() {
        let ctx = ThreadCtx::new("2028-02-01T00:00:00Z", 1);
        let mut n = net("");
        let a = coverage(
            &n,
            &spec("moon-direction", None),
            &ctx,
            &leo_entry(),
            86_400.0,
        )
        .unwrap();
        n.handover_gap_s = 1.0e6;
        let b = coverage(
            &n,
            &spec("moon-direction", None),
            &ctx,
            &leo_entry(),
            86_400.0,
        )
        .unwrap();
        assert!(b.duty < a.duty && b.duty >= 0.0);
        assert_eq!(a.visible_fraction, b.visible_fraction);
    }

    #[test]
    fn a_stated_duty_is_passed_through_and_bad_documents_are_refused() {
        let ctx = ThreadCtx::new("2028-02-01T00:00:00Z", 1);
        let n = net("");
        let c = coverage(&n, &spec("stated", Some(0.35)), &ctx, &leo_entry(), 100.0).unwrap();
        assert_eq!((c.duty, c.handovers), (0.35, 0));
        let bad = |extra: &str| net(extra).validate().err().unwrap();
        assert!(bad("[[phases]]\nphase = \"x\"\ngeometry = \"stated\"\n").contains("needs `duty`"));
        assert!(
            bad("[[phases]]\nphase = \"x\"\ngeometry = \"orbit\"\n").contains("unknown geometry")
        );
        let mut n2 = net("");
        n2.min_elevation_deg = 95.0;
        assert!(n2.validate().is_err());
        let mut e = leo_entry();
        e.frame = Frame::Mci;
        assert!(coverage(&n, &spec("entry-orbit", None), &ctx, &e, 100.0)
            .err()
            .unwrap()
            .contains("GCRF entry"));
        assert!(toml::from_str::<GroundNetworkDoc>("min_elevation_deg = 5.0\nsurprise = 1\n[[stations]]\nid=\"a\"\nlat_deg=0.0\nlon_deg=0.0\n").is_err());
    }

    #[test]
    fn a_vehicle_over_a_station_is_seen_and_one_on_the_other_side_of_the_earth_is_not() {
        let ctx = ThreadCtx::new("2028-02-01T00:00:00Z", 1);
        let n: GroundNetworkDoc = toml::from_str(
            "min_elevation_deg = 10.0\n[[stations]]\nid = \"only\"\nlat_deg = 0.0\nlon_deg = 0.0\n",
        )
        .unwrap();
        let jd = crate::lunar_phase::epoch_jd(&ctx, 0.0).unwrap();
        let gmst = gmst82(Jd2::new(jd));
        let (p, _) = station_frame(&n.stations[0]);
        let up = to_inertial(p, gmst);
        let mut e = leo_entry();
        e.x = [1.1 * up[0], 1.1 * up[1], 1.1 * up[2], 0.0, 0.0, 0.0];
        let seen = coverage(&n, &spec("entry-orbit", None), &ctx, &e, 0.0).unwrap();
        assert_eq!(seen.duty, 1.0);
        e.x = [-1.1 * up[0], -1.1 * up[1], -1.1 * up[2], 0.0, 0.0, 0.0];
        let hidden = coverage(&n, &spec("entry-orbit", None), &ctx, &e, 0.0).unwrap();
        assert_eq!(hidden.duty, 0.0);
    }
}
