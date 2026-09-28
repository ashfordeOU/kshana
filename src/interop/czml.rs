// SPDX-License-Identifier: AGPL-3.0-only
//! **CZML writer** — the Cesium Language, a JSON array of packets.
//!
//! Structure, per the CZML guide
//! (<https://github.com/AnalyticalGraphicsInc/czml-writer/wiki/CZML-Structure>):
//!
//! * The first packet is the document packet: `"id": "document"` and `"version": "1.0"`,
//!   with a `clock` spanning the scene's time grid when the scene has moving objects.
//! * Each moving object is one packet with a sampled `position`: `epoch` (ISO 8601 UTC),
//!   `referenceFrame` `"INERTIAL"`, and `cartesian` as `[t, x, y, z, t, x, y, z, ...]`,
//!   seconds after the epoch and metres in the Geocentric Celestial Reference System
//!   (GCRS). CesiumJS takes `INERTIAL` as the International Celestial Reference Frame
//!   (ICRF), whose axes the GCRS shares. Its `availability` is the sampled interval.
//! * Each fixed site is a packet with a constant `cartesian` position and
//!   `referenceFrame` `"FIXED"` (Earth-fixed, WGS 84).
//! * A jammer footprint is an `ellipse` whose two semi-axes are the footprint radius,
//!   centred on the jammer; an untimed track is a ground-clamped `polyline`.
//!
//! Every packet carries a `description` saying what it is and in which frame, so the
//! frame is stated in the file as well as in the format. Output is deterministic: keys are
//! written in sorted order and every number is rounded before it is serialised.

use super::round_dp;
use super::scene::{Scene, SiteRole};
use serde_json::{json, Value};

fn availability(scene: &Scene) -> Option<String> {
    let e = scene.epoch?;
    let last = *scene.times_s.last()?;
    Some(format!("{}/{}", e.iso(0.0), e.iso(last)))
}

/// Render a scene as a CZML document.
pub fn write(scene: &Scene) -> String {
    let mut packets: Vec<Value> = Vec::new();
    let mut doc = json!({
        "id": "document",
        "name": scene.title(),
        "version": "1.0",
        "description": format!(
            "Kshana {} export. Epoch: {}. Moving objects: GCRS (referenceFrame INERTIAL), metres, seconds after the epoch. Fixed sites: Earth-fixed WGS 84 (referenceFrame FIXED), metres.",
            env!("CARGO_PKG_VERSION"),
            scene.epoch_note
        ),
    });
    if let (Some(e), Some(iv)) = (scene.epoch, availability(scene)) {
        doc["clock"] = json!({
            "interval": iv,
            "currentTime": e.iso(0.0),
            "multiplier": 60,
            "range": "LOOP_STOP",
            "step": "SYSTEM_CLOCK_MULTIPLIER",
        });
    }
    packets.push(doc);

    if let (Some(e), Some(iv)) = (scene.epoch, availability(scene)) {
        for m in &scene.movers {
            let mut cart: Vec<Value> = Vec::with_capacity(4 * scene.times_s.len());
            for (i, &t) in scene.times_s.iter().enumerate() {
                let r = m.gcrs_r_m[i];
                cart.push(json!(round_dp(t, 6)));
                for c in r {
                    cart.push(json!(round_dp(c, 4)));
                }
            }
            let (colour, size) = match m.role {
                super::scene::MoverRole::Satellite => ([255, 196, 0, 255], 6),
                super::scene::MoverRole::User => ([0, 200, 255, 255], 8),
            };
            packets.push(json!({
                "id": format!("{}/{}", m.role.as_str(), m.id),
                "name": m.id,
                "description": format!("{} ({}). Position: GCRS, metres.", m.description, m.role.as_str()),
                "availability": iv,
                "position": {
                    "epoch": e.iso(0.0),
                    "referenceFrame": "INERTIAL",
                    "interpolationAlgorithm": "LAGRANGE",
                    "interpolationDegree": 5,
                    "cartesian": cart,
                },
                "point": {
                    "pixelSize": size,
                    "color": { "rgba": colour },
                },
                "path": {
                    "width": 1,
                    "leadTime": 0,
                    "material": { "solidColor": { "color": { "rgba": [colour[0], colour[1], colour[2], 128] } } },
                },
            }));
        }
    }

    for s in &scene.sites {
        let p = s.ecef_m();
        let colour = match s.role {
            SiteRole::Jammer => [220, 30, 30, 255],
            SiteRole::Station => [120, 220, 120, 255],
            _ => [0, 200, 255, 255],
        };
        packets.push(json!({
            "id": format!("site/{}", s.id),
            "name": s.id,
            "description": format!(
                "{} ({}). Latitude {} deg, longitude {} deg, height {} m above the WGS 84 ellipsoid. Position: Earth-fixed, metres.",
                s.description, s.role.as_str(), s.lat_deg, s.lon_deg, s.h_m
            ),
            "position": {
                "referenceFrame": "FIXED",
                "cartesian": [round_dp(p[0], 4), round_dp(p[1], 4), round_dp(p[2], 4)],
            },
            "point": { "pixelSize": 9, "color": { "rgba": colour } },
        }));
    }

    for f in &scene.footprints {
        let p = crate::frames::geodetic_to_ecef(crate::frames::Geodetic {
            lat_rad: f.centre_lat_deg.to_radians(),
            lon_rad: f.centre_lon_deg.to_radians(),
            alt_m: 0.0,
        });
        packets.push(json!({
            "id": f.id,
            "name": f.id,
            "description": format!("{}. Radius {} m along the ground.", f.description, f.radius_m),
            "position": {
                "referenceFrame": "FIXED",
                "cartesian": [round_dp(p[0], 4), round_dp(p[1], 4), round_dp(p[2], 4)],
            },
            "ellipse": {
                "semiMajorAxis": f.radius_m,
                "semiMinorAxis": f.radius_m,
                "height": 0,
                "fill": true,
                "material": { "solidColor": { "color": { "rgba": [220, 30, 30, 60] } } },
                "outline": true,
                "outlineColor": { "rgba": [220, 30, 30, 255] },
            },
        }));
    }

    for r in &scene.routes {
        let mut deg: Vec<Value> = Vec::with_capacity(3 * r.points.len());
        for p in &r.points {
            deg.push(json!(p[1]));
            deg.push(json!(p[0]));
            deg.push(json!(0));
        }
        packets.push(json!({
            "id": format!("route/{}", r.id),
            "name": r.id,
            "description": format!("{}. Untimed: WGS 84 longitude and latitude in degrees, clamped to the ground.", r.description),
            "polyline": {
                "positions": { "cartographicDegrees": deg },
                "clampToGround": true,
                "width": 2,
                "material": { "solidColor": { "color": { "rgba": [0, 200, 255, 255] } } },
            },
        }));
    }

    // One packet per line: small enough to diff, and a sampled position does not spread
    // over thousands of lines.
    let lines: Vec<String> = packets
        .iter()
        .map(|p| serde_json::to_string(p).unwrap_or_else(|_| "{}".into()))
        .collect();
    format!("[\n{}\n]\n", lines.join(",\n"))
}
