// SPDX-License-Identifier: AGPL-3.0-only
//! Geostationary (GEO) and inclined geosynchronous (IGSO, QZO, QGEO) slots for `kshana gnss-sim`,
//! beside the Walker shell of the scenario's `constellation`, so that regional and mixed systems
//! (NavIC, the BeiDou GEO, QZSS) can be expressed.
//!
//! A slot is a geosynchronous Keplerian orbit (two-body, no perturbations) placed on the Earth by
//! a longitude: a GEO by its sub-satellite longitude, an IGSO by its equatorial crossing longitude
//! (the ascending node) or by the centre longitude of its ground track (the mean longitude over
//! one revolution, as the QZSS performance standard states it). The semi-major axis is the
//! geosynchronous radius for the sidereal rate of the frame the simulation rotates to the Earth
//! with ([`crate::sgp4::gstime`]), so a slot's ground track does not drift. `phase_deg` is the mean
//! anomaly (the argument of latitude for a circular slot) at the simulation epoch.
//!
//! The nominal slots of each system come from data files (`data/gnss-slots/*.toml`, compiled in),
//! each slot with the published source of its values and each file stating what its sources leave
//! out. A value no source states (for example a satellite's position along a shared ground track)
//! is an assumption and says so in `phase_source`. MODELLED: nominal slots, not broadcast orbits.

use serde::{Deserialize, Serialize};

use crate::frames::Vec3;
use crate::orbit::{Orbit, MU_EARTH};
use crate::portable_math::PortableFloat;

/// The compiled-in slot sets: name and TOML text.
pub const SLOT_SETS: [(&str, &str); 5] = [
    ("navic", include_str!("../data/gnss-slots/navic.toml")),
    (
        "beidou-geo",
        include_str!("../data/gnss-slots/beidou-geo.toml"),
    ),
    (
        "beidou-2-geo",
        include_str!("../data/gnss-slots/beidou-2-geo.toml"),
    ),
    (
        "qzss-ps-005",
        include_str!("../data/gnss-slots/qzss-ps-005.toml"),
    ),
    (
        "qzss-six-satellite",
        include_str!("../data/gnss-slots/qzss-six-satellite.toml"),
    ),
];

/// The kind of a slot.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum SlotKind {
    /// Geostationary: a fixed sub-satellite longitude.
    Geo,
    /// Inclined geosynchronous (IGSO, QZO, QGEO).
    Igso,
}

/// One slot.
#[derive(Clone, Debug, PartialEq, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Slot {
    /// The slot's label within its set (for example `GEO 32.5E`), reported in the result.
    pub id: String,
    /// GEO (fixed sub-satellite longitude) or IGSO (inclined geosynchronous).
    pub kind: SlotKind,
    /// GEO: the sub-satellite longitude, degrees east.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub lon_deg: Option<f64>,
    /// IGSO: the inclination, degrees (GEO: 0).
    #[serde(default)]
    pub inclination_deg: f64,
    /// Orbital eccentricity, dimensionless, checked to lie in `0.0..0.5`; 0 (circular) by default.
    #[serde(default)]
    pub eccentricity: f64,
    /// Argument of perigee, degrees (the QZO apogee is over the north at 270°).
    #[serde(default)]
    pub argp_deg: f64,
    /// IGSO: the longitude of the ascending equatorial crossing, degrees east.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub crossing_lon_deg: Option<f64>,
    /// IGSO: the centre longitude of the ground track (mean over one revolution), degrees east.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub center_lon_deg: Option<f64>,
    /// Mean anomaly at the simulation epoch, degrees.
    #[serde(default)]
    pub phase_deg: f64,
    /// Where the values come from.
    pub source: String,
    /// Where the phase comes from, when not from `source` (an assumption says so).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub phase_source: Option<String>,
}

/// A slot-set data file.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SlotSet {
    /// The set's name, as used in `slot_sets` (for example `navic`).
    pub name: String,
    /// A one-line human-readable title of the set.
    pub title: String,
    /// The published sources of the set's values, one string each.
    pub sources: Vec<String>,
    /// What the sources leave out, and what stands in for it.
    pub omitted: Vec<String>,
    /// The slots of the set, in file order (`[[slot]]` tables).
    pub slot: Vec<Slot>,
}

/// A compiled-in slot set by name.
pub fn slot_set(name: &str) -> Result<SlotSet, String> {
    let text = SLOT_SETS
        .iter()
        .find(|(n, _)| *n == name)
        .map(|(_, t)| *t)
        .ok_or_else(|| {
            crate::terr!(
                "e-gnss-slots-unknown-set",
                name = name,
                sets = SLOT_SETS
                    .iter()
                    .map(|(n, _)| *n)
                    .collect::<Vec<_>>()
                    .join(", ")
            )
        })?;
    toml::from_str(text).map_err(|e| e.to_string())
}

/// The Earth's rotation rate in the simulation frame (rad/s): the rate of
/// [`crate::sgp4::gstime`], measured over one day at the simulation epoch.
pub fn sidereal_rate_rad_s() -> f64 {
    let jd = crate::walker::walker_epoch_jd();
    let d =
        (crate::sgp4::gstime(jd + 1.0) - crate::sgp4::gstime(jd)).rem_euclid(std::f64::consts::TAU);
    (std::f64::consts::TAU + d) / 86_400.0
}

/// The geosynchronous semi-major axis (m) for [`sidereal_rate_rad_s`].
pub fn geosynchronous_radius_m() -> f64 {
    (MU_EARTH / sidereal_rate_rad_s().ppowi(2)).ppowf(1.0 / 3.0)
}

/// The Earth-fixed position (m) of an inertial position at `t` seconds after the epoch.
fn ecef_at(r_inertial: Vec3, t: f64) -> Vec3 {
    crate::frames::teme_to_ecef(r_inertial, crate::walker::walker_epoch_jd() + t / 86_400.0)
}

fn lat_lon_deg(r: Vec3) -> (f64, f64) {
    let lon = r[1].patan2(r[0]).to_degrees();
    let lat = r[2].patan2((r[0] * r[0] + r[1] * r[1]).sqrt()).to_degrees();
    (lat, lon)
}

fn wrap180(x: f64) -> f64 {
    (x + 180.0).rem_euclid(360.0) - 180.0
}

const TRACK_SAMPLES: usize = 1440;

/// The ground-track longitude of an orbit by the slot's rule: the mean (unwrapped) longitude
/// over one revolution, or the longitude of the first ascending equatorial crossing.
fn track_longitude(o: &Orbit, crossing: bool) -> Option<f64> {
    let period = std::f64::consts::TAU / o.mean_motion();
    let pts: Vec<(f64, f64)> = (0..=TRACK_SAMPLES)
        .map(|k| {
            lat_lon_deg(ecef_at(
                o.position_eci(period * k as f64 / TRACK_SAMPLES as f64),
                period * k as f64 / TRACK_SAMPLES as f64,
            ))
        })
        .collect();
    let mut unwrapped = Vec::with_capacity(pts.len());
    let mut prev = pts[0].1;
    let mut acc = pts[0].1;
    for p in &pts {
        acc += wrap180(p.1 - prev);
        prev = p.1;
        unwrapped.push(acc);
    }
    if !crossing {
        let n = (unwrapped.len() - 1) as f64;
        return Some(unwrapped[..unwrapped.len() - 1].iter().sum::<f64>() / n);
    }
    for k in 0..pts.len() - 1 {
        let (a, b) = (pts[k].0, pts[k + 1].0);
        if a <= 0.0 && b > 0.0 {
            let f = -a / (b - a);
            return Some(unwrapped[k] + f * (unwrapped[k + 1] - unwrapped[k]));
        }
    }
    None
}

fn check(slot: &Slot) -> Result<(), String> {
    let bad = |field: &str| {
        crate::terr!(
            "e-gnss-slots-out-of-range",
            id = slot.id.as_str(),
            field = field
        )
    };
    let finite = |x: f64| x.is_finite();
    if !(finite(slot.inclination_deg) && (0.0..=180.0).contains(&slot.inclination_deg)) {
        return Err(bad("inclination_deg"));
    }
    if !(finite(slot.eccentricity) && (0.0..0.5).contains(&slot.eccentricity)) {
        return Err(bad("eccentricity"));
    }
    if !finite(slot.argp_deg) {
        return Err(bad("argp_deg"));
    }
    if !finite(slot.phase_deg) {
        return Err(bad("phase_deg"));
    }
    match slot.kind {
        SlotKind::Geo => {
            if !slot.lon_deg.is_some_and(finite) {
                return Err(crate::terr!(
                    "e-gnss-slots-geo-needs-lon",
                    id = slot.id.as_str()
                ));
            }
        }
        SlotKind::Igso => {
            let n = usize::from(slot.crossing_lon_deg.is_some_and(finite))
                + usize::from(slot.center_lon_deg.is_some_and(finite));
            if n != 1 || slot.inclination_deg == 0.0 {
                return Err(crate::terr!(
                    "e-gnss-slots-igso-needs-one-longitude",
                    id = slot.id.as_str()
                ));
            }
        }
    }
    Ok(())
}

/// The orbit of a slot: geosynchronous, rotated about the pole so that its longitude rule holds.
pub fn slot_orbit(slot: &Slot) -> Result<Orbit, String> {
    check(slot)?;
    let mut o = Orbit {
        radius_m: geosynchronous_radius_m(),
        eccentricity: slot.eccentricity,
        inclination_rad: slot.inclination_deg.to_radians(),
        raan_rad: 0.0,
        argp_rad: slot.argp_deg.to_radians(),
        u0_rad: slot.phase_deg.to_radians(),
        raan_dot: 0.0,
        argp_dot: 0.0,
    };
    let (target, crossing) = match slot.kind {
        SlotKind::Geo => (slot.lon_deg.unwrap_or(0.0), false),
        SlotKind::Igso => match (slot.crossing_lon_deg, slot.center_lon_deg) {
            (Some(c), _) => (c, true),
            (None, Some(c)) => (c, false),
            _ => unreachable!("check() requires one longitude"),
        },
    };
    let got = track_longitude(&o, crossing).ok_or_else(|| {
        crate::terr!(
            "e-gnss-slots-igso-needs-one-longitude",
            id = slot.id.as_str()
        )
    })?;
    // Turning the orbit about the pole turns its ground track by the same angle.
    o.raan_rad = wrap180(target - got).to_radians();
    Ok(o)
}

/// The slots of the named sets followed by the inline slots, each with its set name (`inline` for
/// the scenario's own), in order.
pub fn resolve(sets: &[String], inline: &[Slot]) -> Result<Vec<(String, Slot)>, String> {
    let mut out = Vec::new();
    for name in sets {
        for s in slot_set(name)?.slot {
            out.push((name.clone(), s));
        }
    }
    for s in inline {
        out.push(("inline".to_string(), s.clone()));
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_compiled_in_set_parses_cites_its_sources_and_builds() {
        for (name, _) in SLOT_SETS {
            let s = slot_set(name).unwrap();
            assert_eq!(s.name, name);
            assert!(!s.sources.is_empty() && !s.omitted.is_empty(), "{name}");
            for slot in &s.slot {
                assert!(!slot.source.trim().is_empty(), "{name} {}", slot.id);
                slot_orbit(slot).unwrap_or_else(|e| panic!("{name} {}: {e}", slot.id));
            }
        }
        assert!(slot_set("galileo-geo").is_err());
    }

    #[test]
    fn the_geosynchronous_radius_is_about_42164_km() {
        let a = geosynchronous_radius_m();
        assert!((a - 42_164_170.0).abs() < 200.0, "{a}");
    }

    #[test]
    fn a_slot_without_its_longitude_is_refused() {
        let s = Slot {
            id: "x".into(),
            kind: SlotKind::Igso,
            lon_deg: None,
            inclination_deg: 29.0,
            eccentricity: 0.0,
            argp_deg: 0.0,
            crossing_lon_deg: None,
            center_lon_deg: None,
            phase_deg: 0.0,
            source: "test".into(),
            phase_source: None,
        };
        assert!(slot_orbit(&s).is_err());
        let g = Slot {
            kind: SlotKind::Geo,
            inclination_deg: 0.0,
            ..s.clone()
        };
        assert!(slot_orbit(&g).is_err());
        let e = Slot {
            crossing_lon_deg: Some(55.0),
            eccentricity: 0.9,
            ..s
        };
        assert!(slot_orbit(&e).is_err());
    }
}
