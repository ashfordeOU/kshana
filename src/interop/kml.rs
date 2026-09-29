// SPDX-License-Identifier: AGPL-3.0-only
//! **KML writer** — Keyhole Markup Language 2.2, the Open Geospatial Consortium (OGC)
//! standard (<https://www.ogc.org/standard/kml/>, schema namespace
//! `http://www.opengis.net/kml/2.2`), with the Google extension namespace
//! `http://www.google.com/kml/ext/2.2` for time-tagged tracks.
//!
//! * The root is `<kml>` holding one `<Document>`, with one `<Folder>` per object class.
//! * A moving object is a `<Placemark>` with a `<gx:Track>`: one `<when>` (ISO 8601 UTC)
//!   per sample, then one `<gx:coord>` per sample, `longitude latitude height`.
//! * A fixed site is a `<Placemark>` with a `<Point>`; a jammer footprint a `<Polygon>`
//!   whose outer ring is closed and counter-clockwise; an untimed track a `<LineString>`
//!   clamped to the ground.
//! * Coordinates are WGS 84 longitude and latitude in decimal degrees. Heights are
//!   metres above the WGS 84 ellipsoid, written with `altitudeMode` `absolute`, which KML
//!   reads as height above mean sea level: the geoid undulation (within about ±110 m) is
//!   not applied, and each document says so in its description.

use super::fmt_dp;
use super::scene::Scene;

/// Escape the characters XML text and attribute values cannot hold literally.
pub fn xml_escape(s: &str) -> String {
    let mut o = String::with_capacity(s.len());
    for c in s.chars() {
        match c {
            '&' => o.push_str("&amp;"),
            '<' => o.push_str("&lt;"),
            '>' => o.push_str("&gt;"),
            '"' => o.push_str("&quot;"),
            '\'' => o.push_str("&apos;"),
            _ => o.push(c),
        }
    }
    o
}

fn coord(lon: f64, lat: f64, h: f64, sep: char) -> String {
    format!(
        "{}{sep}{}{sep}{}",
        fmt_dp(lon, 9),
        fmt_dp(lat, 9),
        fmt_dp(h, 3)
    )
}

fn style(id: &str, abgr: &str, line_abgr: &str) -> String {
    format!(
        "    <Style id=\"{id}\">\n      <IconStyle><color>{abgr}</color><scale>0.8</scale></IconStyle>\n      <LineStyle><color>{line_abgr}</color><width>2</width></LineStyle>\n      <PolyStyle><color>{line_abgr}</color></PolyStyle>\n    </Style>\n"
    )
}

/// Render a scene as a KML 2.2 document.
pub fn write(scene: &Scene) -> String {
    let mut o = String::new();
    o.push_str("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
    o.push_str("<kml xmlns=\"http://www.opengis.net/kml/2.2\" xmlns:gx=\"http://www.google.com/kml/ext/2.2\">\n");
    o.push_str("  <Document>\n");
    o.push_str(&format!(
        "    <name>{}</name>\n",
        xml_escape(&scene.title())
    ));
    o.push_str(&format!(
        "    <description>{}</description>\n",
        xml_escape(&format!(
            "Kshana {} export. Epoch: {}. Coordinates: WGS 84 longitude, latitude (deg) and height above the WGS 84 ellipsoid (m); altitudeMode absolute reads the height as above mean sea level, and the geoid undulation is not applied.",
            env!("CARGO_PKG_VERSION"),
            scene.epoch_note
        ))
    ));
    o.push_str(&style("satellite", "ff00c4ff", "8000c4ff"));
    o.push_str(&style("user", "ffffc800", "80ffc800"));
    o.push_str(&style("site", "ffffc800", "ffffc800"));
    o.push_str(&style("jammer", "ff1e1edc", "501e1edc"));
    o.push_str(&style("route", "ffffc800", "ffffc800"));

    if let Some(e) = scene.epoch {
        if !scene.movers.is_empty() {
            o.push_str("    <Folder>\n      <name>Moving objects</name>\n");
            for m in &scene.movers {
                o.push_str("      <Placemark>\n");
                o.push_str(&format!("        <name>{}</name>\n", xml_escape(&m.id)));
                o.push_str(&format!(
                    "        <description>{}</description>\n",
                    xml_escape(&format!("{} ({})", m.description, m.role.as_str()))
                ));
                o.push_str(&format!(
                    "        <styleUrl>#{}</styleUrl>\n",
                    m.role.as_str()
                ));
                o.push_str("        <gx:Track>\n          <altitudeMode>absolute</altitudeMode>\n");
                for &t in &scene.times_s {
                    o.push_str(&format!("          <when>{}</when>\n", e.iso(t)));
                }
                for i in 0..scene.times_s.len() {
                    let (lat, lon, h) = m.geodetic(i);
                    o.push_str(&format!(
                        "          <gx:coord>{}</gx:coord>\n",
                        coord(lon, lat, h, ' ')
                    ));
                }
                o.push_str("        </gx:Track>\n      </Placemark>\n");
            }
            o.push_str("    </Folder>\n");
        }
    }

    if !scene.sites.is_empty() {
        o.push_str("    <Folder>\n      <name>Sites</name>\n");
        for s in &scene.sites {
            let st = if s.role == super::scene::SiteRole::Jammer {
                "jammer"
            } else {
                "site"
            };
            o.push_str("      <Placemark>\n");
            o.push_str(&format!("        <name>{}</name>\n", xml_escape(&s.id)));
            o.push_str(&format!(
                "        <description>{}</description>\n",
                xml_escape(&format!("{} ({})", s.description, s.role.as_str()))
            ));
            o.push_str(&format!("        <styleUrl>#{st}</styleUrl>\n"));
            o.push_str(&format!(
                "        <Point>\n          <altitudeMode>absolute</altitudeMode>\n          <coordinates>{}</coordinates>\n        </Point>\n",
                coord(s.lon_deg, s.lat_deg, s.h_m, ',')
            ));
            o.push_str("      </Placemark>\n");
        }
        o.push_str("    </Folder>\n");
    }

    if !scene.footprints.is_empty() {
        o.push_str("    <Folder>\n      <name>Jammer footprints</name>\n");
        for f in &scene.footprints {
            o.push_str("      <Placemark>\n");
            o.push_str(&format!("        <name>{}</name>\n", xml_escape(&f.id)));
            o.push_str(&format!(
                "        <description>{}</description>\n",
                xml_escape(&format!(
                    "{}. Radius {} m along the ground.",
                    f.description, f.radius_m
                ))
            ));
            o.push_str("        <styleUrl>#jammer</styleUrl>\n");
            o.push_str("        <Polygon>\n          <altitudeMode>clampToGround</altitudeMode>\n          <outerBoundaryIs>\n            <LinearRing>\n              <coordinates>");
            let pts: Vec<String> = f.ring.iter().map(|p| coord(p[1], p[0], 0.0, ',')).collect();
            o.push_str(&pts.join(" "));
            o.push_str("</coordinates>\n            </LinearRing>\n          </outerBoundaryIs>\n        </Polygon>\n      </Placemark>\n");
        }
        o.push_str("    </Folder>\n");
    }

    if !scene.routes.is_empty() {
        o.push_str("    <Folder>\n      <name>Tracks</name>\n");
        for r in &scene.routes {
            o.push_str("      <Placemark>\n");
            o.push_str(&format!("        <name>{}</name>\n", xml_escape(&r.id)));
            o.push_str(&format!(
                "        <description>{}</description>\n",
                xml_escape(&format!("{} (untimed)", r.description))
            ));
            o.push_str("        <styleUrl>#route</styleUrl>\n");
            o.push_str("        <LineString>\n          <altitudeMode>clampToGround</altitudeMode>\n          <coordinates>");
            let pts: Vec<String> = r
                .points
                .iter()
                .map(|p| coord(p[1], p[0], 0.0, ','))
                .collect();
            o.push_str(&pts.join(" "));
            o.push_str("</coordinates>\n        </LineString>\n      </Placemark>\n");
        }
        o.push_str("    </Folder>\n");
    }

    o.push_str("  </Document>\n</kml>\n");
    o
}
