// SPDX-License-Identifier: AGPL-3.0-only
//! **STK ephemeris writer** — the Ansys Systems Tool Kit (STK) `.e` format, time,
//! position and velocity form (`EphemerisTimePosVel`), as documented at
//! <https://help.agi.com/stk/#stk/importfiles-02.htm>.
//!
//! One `.e` file describes one vehicle, so a scene with several moving objects is
//! written as one file per object. Each file is:
//!
//! ```text
//! stk.v.11.0
//! # comments: what the object is, where the epoch comes from, the frame
//! BEGIN Ephemeris
//!     NumberOfEphemerisPoints  <N, the number of data rows>
//!     ScenarioEpoch            <d Mon yyyy hh:mm:ss.ssssss, UTC>
//!     InterpolationMethod      Lagrange
//!     InterpolationSamplesM1   5
//!     CentralBody              Earth
//!     CoordinateSystem         ICRF
//!     DistanceUnit             Meters
//!     EphemerisTimePosVel
//! <t> <x> <y> <z> <vx> <vy> <vz>     (s after ScenarioEpoch; m; m/s)
//! END Ephemeris
//! ```
//!
//! The states are the scene's Geocentric Celestial Reference System (GCRS) states. STK's
//! `ICRF` coordinate system for the Earth central body has the International Celestial
//! Reference Frame axes, which the GCRS shares. `DistanceUnit Meters` is written
//! explicitly (it is also STK's default), so no reader has to assume kilometres.

use super::fmt_dp;
use super::scene::Scene;
use super::{ExportError, ExportFile};

/// `Ok(())` when the scene has a vehicle to write, the reason otherwise.
pub fn applicability(scene: &Scene) -> Result<(), String> {
    if scene.epoch.is_some() && !scene.movers.is_empty() {
        Ok(())
    } else {
        Err(
            "an STK ephemeris describes a vehicle's position and velocity against time; this \
             scene has only fixed points or untimed tracks (a fixed point is an STK Facility, not \
             an ephemeris)"
                .into(),
        )
    }
}

/// Render one moving object of the scene as an STK `.e` file.
pub fn write_one(scene: &Scene, index: usize) -> Result<String, ExportError> {
    applicability(scene).map_err(ExportError::NotApplicable)?;
    let m = scene
        .movers
        .get(index)
        .ok_or_else(|| ExportError::Failed(format!("no moving object {index}")))?;
    let e = scene
        .epoch
        .ok_or_else(|| ExportError::Failed("scene has no epoch".into()))?;
    let mut o = String::new();
    o.push_str("stk.v.11.0\n");
    o.push_str(&format!(
        "# Kshana {} export: {}, object {} ({})\n",
        env!("CARGO_PKG_VERSION"),
        scene.title(),
        m.id,
        m.role.as_str()
    ));
    o.push_str(&format!("# {}\n", m.description.replace('\n', " ")));
    o.push_str(&format!(
        "# Epoch: {}\n",
        scene.epoch_note.replace('\n', " ")
    ));
    o.push_str("# Frame: GCRS (International Celestial Reference Frame axes), metres and metres per second\n\n");
    o.push_str("BEGIN Ephemeris\n\n");
    o.push_str(&format!(
        "    NumberOfEphemerisPoints  {}\n",
        scene.times_s.len()
    ));
    o.push_str(&format!("    ScenarioEpoch            {}\n", e.stk(0.0)));
    o.push_str("    InterpolationMethod      Lagrange\n");
    o.push_str("    InterpolationSamplesM1   5\n");
    o.push_str("    CentralBody              Earth\n");
    o.push_str("    CoordinateSystem         ICRF\n");
    o.push_str("    DistanceUnit             Meters\n\n");
    o.push_str("    EphemerisTimePosVel\n\n");
    for (i, &t) in scene.times_s.iter().enumerate() {
        let r = m.gcrs_r_m[i];
        let v = m.gcrs_v_m_s[i];
        o.push_str(&format!(
            "{} {} {} {} {} {} {}\n",
            fmt_dp(t, 6),
            fmt_dp(r[0], 4),
            fmt_dp(r[1], 4),
            fmt_dp(r[2], 4),
            fmt_dp(v[0], 7),
            fmt_dp(v[1], 7),
            fmt_dp(v[2], 7)
        ));
    }
    o.push_str("\nEND Ephemeris\n");
    Ok(o)
}

/// Every moving object of the scene as an STK `.e` file: suffix `.e` when there is one,
/// `.<id>.e` for each when there are several.
pub fn write_all(scene: &Scene) -> Result<Vec<ExportFile>, ExportError> {
    applicability(scene).map_err(ExportError::NotApplicable)?;
    let single = scene.movers.len() == 1;
    (0..scene.movers.len())
        .map(|i| {
            let suffix = if single {
                ".e".to_string()
            } else {
                format!(".{}.e", scene.movers[i].id)
            };
            Ok(ExportFile {
                suffix,
                bytes: write_one(scene, i)?.into_bytes(),
            })
        })
        .collect()
}
