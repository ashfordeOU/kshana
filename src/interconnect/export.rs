// SPDX-License-Identifier: AGPL-3.0-only
//! Tracks with their trust attributes as GeoJSON, KML and CZML (roadmap 0.42 I6).
//!
//! The fixes of any reader are grouped into one track per `source` and `id`, in the order each first
//! appears. Every point keeps its time, height, quality class and every trust attribute, so a map can
//! colour a track by what the vessel, aircraft or vehicle itself reported.
//!
//! * **GeoJSON** (RFC 7946): a `FeatureCollection`; per track a `LineString` (two points or more) with
//!   the count of points in each class, then one `Point` per fix whose properties are `source`, `id`,
//!   `kind` (`fix`), `time` (ISO 8601 UTC) and `t_unix_s` when known, `alt_m`, `reported_quality`, every
//!   trust attribute as `quality_<name>` and every other field as `extra_<name>`. Flat properties, so
//!   QGIS and other GIS tools show them as columns. [`read_geojson`] reads the points back.
//! * **KML** 2.2: a `Folder` per track with its `LineString` and one `Placemark` per fix, styled by its
//!   class, with a `TimeStamp` and the same properties as `ExtendedData`.
//! * **CZML** (Cesium): a document packet, then per track with times a packet whose `position` samples
//!   the fixes (`cartographicDegrees`, seconds after the first fix), a `path`, a `point` coloured by class
//!   over time and `properties.reported_quality` and each trust attribute as intervals. A track without
//!   times is a `polyline`.
//!
//! Colours by class: `good` green, `intermediate` amber, `degraded` red, `unknown` grey. Nothing here
//! reads a clock: the same fixes give the same bytes.

use serde_json::{json, Map, Value};

use super::{iso, Fix, Quality};

fn tracks(fixes: &[Fix]) -> Vec<((String, String), Vec<&Fix>)> {
    let mut out: Vec<((String, String), Vec<&Fix>)> = Vec::new();
    for f in fixes {
        let key = (f.source.clone(), f.id.clone());
        match out.iter_mut().find(|(k, _)| *k == key) {
            Some((_, v)) => v.push(f),
            None => out.push((key, vec![f])),
        }
    }
    out
}

fn coords(f: &Fix) -> Value {
    match f.alt_m {
        Some(h) => json!([f.lon_deg, f.lat_deg, super::round_to(h, 1e3)]),
        None => json!([f.lon_deg, f.lat_deg]),
    }
}

fn classes(points: &[&Fix]) -> Map<String, Value> {
    let mut m = Map::new();
    for q in [
        Quality::Good,
        Quality::Intermediate,
        Quality::Degraded,
        Quality::Unknown,
    ] {
        let n = points.iter().filter(|f| f.reported_quality == q).count();
        m.insert(q.as_str().into(), n.into());
    }
    m
}

fn point_properties(f: &Fix) -> Map<String, Value> {
    let mut p = Map::new();
    p.insert("source".into(), f.source.clone().into());
    p.insert("id".into(), f.id.clone().into());
    p.insert("kind".into(), "fix".into());
    if let Some(t) = f.t_unix_s {
        p.insert("time".into(), iso(t).into());
        p.insert("t_unix_s".into(), t.into());
    }
    if let Some(h) = f.alt_m {
        p.insert("alt_m".into(), super::round_to(h, 1e3).into());
    }
    p.insert(
        "reported_quality".into(),
        f.reported_quality.as_str().into(),
    );
    for (k, v) in &f.quality {
        p.insert(format!("quality_{k}"), v.clone());
    }
    for (k, v) in &f.extra {
        p.insert(format!("extra_{k}"), v.clone());
    }
    p
}

/// The fixes as a GeoJSON `FeatureCollection`.
pub fn geojson(fixes: &[Fix]) -> String {
    let mut features = Vec::new();
    for ((source, id), pts) in tracks(fixes) {
        if pts.len() >= 2 {
            let mut p = Map::new();
            p.insert("source".into(), source.into());
            p.insert("id".into(), id.into());
            p.insert("kind".into(), "track".into());
            p.insert("points".into(), pts.len().into());
            p.insert("classes".into(), Value::Object(classes(&pts)));
            if let (Some(a), Some(b)) = (
                pts.iter().find_map(|f| f.t_unix_s),
                pts.iter().rev().find_map(|f| f.t_unix_s),
            ) {
                p.insert("first_time".into(), iso(a).into());
                p.insert("last_time".into(), iso(b).into());
            }
            features.push(json!({
                "type": "Feature",
                "geometry": {"type": "LineString", "coordinates": pts.iter().map(|f| coords(f)).collect::<Vec<_>>()},
                "properties": p,
            }));
        }
        for f in pts {
            features.push(json!({
                "type": "Feature",
                "geometry": {"type": "Point", "coordinates": coords(f)},
                "properties": point_properties(f),
            }));
        }
    }
    let doc = json!({"type": "FeatureCollection", "features": features});
    serde_json::to_string_pretty(&doc).unwrap_or_default() + "\n"
}

fn quality_of(s: &str) -> Quality {
    match s {
        "good" => Quality::Good,
        "intermediate" => Quality::Intermediate,
        "degraded" => Quality::Degraded,
        _ => Quality::Unknown,
    }
}

/// The fixes of a GeoJSON written by [`geojson`] (its `Point` features with `kind` `fix`).
pub fn read_geojson(text: &str) -> Result<Vec<Fix>, String> {
    let v: Value = serde_json::from_str(text)
        .map_err(|e| crate::terr!("e-interconnect-json", line = e.line(), e = e))?;
    let mut out = Vec::new();
    for f in v["features"].as_array().map(Vec::as_slice).unwrap_or(&[]) {
        let p = &f["properties"];
        if p["kind"] != "fix" {
            continue;
        }
        let c = &f["geometry"]["coordinates"];
        let (Some(lon), Some(lat)) = (c[0].as_f64(), c[1].as_f64()) else {
            continue;
        };
        let mut x = Fix::new(
            p["source"].as_str().unwrap_or_default(),
            p["id"].as_str().unwrap_or_default().to_string(),
            p["t_unix_s"].as_f64(),
            lat,
            lon,
        );
        x.alt_m = p["alt_m"].as_f64();
        x.reported_quality = quality_of(p["reported_quality"].as_str().unwrap_or_default());
        for (k, val) in p.as_object().into_iter().flatten() {
            if let Some(k) = k.strip_prefix("quality_") {
                x.quality.insert(k.into(), val.clone());
            } else if let Some(k) = k.strip_prefix("extra_") {
                x.extra.insert(k.into(), val.clone());
            }
        }
        out.push(x);
    }
    Ok(out)
}

fn xml(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}

fn kml_coords(f: &Fix) -> String {
    match f.alt_m {
        Some(h) => format!("{},{},{}", f.lon_deg, f.lat_deg, super::round_to(h, 1e3)),
        None => format!("{},{}", f.lon_deg, f.lat_deg),
    }
}

fn plain(v: &Value) -> String {
    match v {
        Value::String(s) => s.clone(),
        other => other.to_string(),
    }
}

/// KML colours (`aabbggrr`) of the four classes.
const KML_COLOURS: [(&str, &str); 4] = [
    ("good", "ff00aa00"),
    ("intermediate", "ff00a0e6"),
    ("degraded", "ff0000dc"),
    ("unknown", "ff808080"),
];

/// The fixes as KML 2.2.
pub fn kml(fixes: &[Fix]) -> String {
    let mut s = String::from("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
    s.push_str("<kml xmlns=\"http://www.opengis.net/kml/2.2\">\n<Document>\n");
    s.push_str(&format!("<name>{}</name>\n", super::SCHEMA));
    for (q, c) in KML_COLOURS {
        s.push_str(&format!(
            "<Style id=\"q-{q}\"><IconStyle><color>{c}</color><scale>0.6</scale></IconStyle><LineStyle><color>{c}</color><width>2</width></LineStyle></Style>\n"
        ));
    }
    for ((source, id), pts) in tracks(fixes) {
        s.push_str(&format!(
            "<Folder>\n<name>{}</name>\n",
            xml(&format!("{source} {id}"))
        ));
        if pts.len() >= 2 {
            let line: Vec<String> = pts.iter().map(|f| kml_coords(f)).collect();
            s.push_str(&format!(
                "<Placemark><name>{}</name><styleUrl>#q-unknown</styleUrl><LineString><tessellate>1</tessellate><coordinates>{}</coordinates></LineString></Placemark>\n",
                xml(&id),
                line.join(" ")
            ));
        }
        for f in pts {
            s.push_str(&format!(
                "<Placemark><styleUrl>#q-{}</styleUrl>",
                f.reported_quality.as_str()
            ));
            if let Some(t) = f.t_unix_s {
                s.push_str(&format!("<TimeStamp><when>{}</when></TimeStamp>", iso(t)));
            }
            s.push_str("<ExtendedData>");
            for (k, v) in point_properties(f) {
                s.push_str(&format!(
                    "<Data name=\"{}\"><value>{}</value></Data>",
                    xml(&k),
                    xml(&plain(&v))
                ));
            }
            s.push_str(&format!(
                "</ExtendedData><Point><coordinates>{}</coordinates></Point></Placemark>\n",
                kml_coords(f)
            ));
        }
        s.push_str("</Folder>\n");
    }
    s.push_str("</Document>\n</kml>\n");
    s
}

fn rgba(q: Quality) -> Value {
    match q {
        Quality::Good => json!([0, 170, 0, 255]),
        Quality::Intermediate => json!([230, 160, 0, 255]),
        Quality::Degraded => json!([220, 0, 0, 255]),
        Quality::Unknown => json!([128, 128, 128, 255]),
    }
}

/// Intervals from consecutive fixes: fix `k` holds from its time to the next fix's time (the last one to
/// `end`).
fn intervals<'a>(pts: &[&'a Fix], end: f64) -> Vec<(String, &'a Fix)> {
    let times: Vec<f64> = pts.iter().filter_map(|f| f.t_unix_s).collect();
    pts.iter()
        .enumerate()
        .map(|(k, f)| {
            let a = times[k];
            let b = times.get(k + 1).copied().unwrap_or(end);
            (format!("{}/{}", iso(a), iso(b)), *f)
        })
        .collect()
}

/// The fixes as CZML.
pub fn czml(fixes: &[Fix]) -> String {
    let timed: Vec<f64> = fixes.iter().filter_map(|f| f.t_unix_s).collect();
    let mut doc = json!({"id": "document", "name": super::SCHEMA, "version": "1.0"});
    let span = timed
        .iter()
        .copied()
        .fold(None, |a: Option<(f64, f64)>, t| {
            Some(a.map_or((t, t), |(lo, hi)| (lo.min(t), hi.max(t))))
        });
    if let Some((lo, hi)) = span {
        doc["clock"] = json!({
            "interval": format!("{}/{}", iso(lo), iso(hi)),
            "currentTime": iso(lo),
            "multiplier": 1,
        });
    }
    let mut packets = vec![doc];
    for ((source, id), pts) in tracks(fixes) {
        let pid = format!("{source}/{id}");
        let with_t: Vec<&Fix> = pts
            .iter()
            .copied()
            .filter(|f| f.t_unix_s.is_some())
            .collect();
        if with_t.is_empty() {
            let mut flat = Vec::new();
            for f in &pts {
                flat.extend([
                    json!(f.lon_deg),
                    json!(f.lat_deg),
                    json!(f.alt_m.unwrap_or(0.0)),
                ]);
            }
            packets.push(json!({
                "id": pid,
                "name": id,
                "polyline": {"positions": {"cartographicDegrees": flat}, "width": 2,
                              "material": {"solidColor": {"color": {"rgba": rgba(Quality::Unknown)}}}},
            }));
            continue;
        }
        let t0 = with_t[0].t_unix_s.unwrap_or(0.0);
        let end = with_t.last().and_then(|f| f.t_unix_s).unwrap_or(t0);
        let mut samples = Vec::new();
        for f in &with_t {
            let dt = super::round_to(f.t_unix_s.unwrap_or(t0) - t0, 1e3);
            samples.extend([
                json!(dt),
                json!(f.lon_deg),
                json!(f.lat_deg),
                json!(super::round_to(f.alt_m.unwrap_or(0.0), 1e3)),
            ]);
        }
        let iv = intervals(&with_t, end);
        let colours: Vec<Value> = iv
            .iter()
            .map(|(i, f)| json!({"interval": i, "rgba": rgba(f.reported_quality)}))
            .collect();
        let mut props = Map::new();
        props.insert(
            "reported_quality".into(),
            Value::Array(
                iv.iter()
                    .map(|(i, f)| json!({"interval": i, "string": f.reported_quality.as_str()}))
                    .collect(),
            ),
        );
        let mut keys: Vec<&String> = with_t.iter().flat_map(|f| f.quality.keys()).collect();
        keys.sort();
        keys.dedup();
        for k in keys {
            let list: Vec<Value> = iv
                .iter()
                .filter_map(|(i, f)| {
                    let v = f.quality.get(k)?;
                    Some(match v {
                        Value::Number(_) => json!({"interval": i, "number": v}),
                        _ => json!({"interval": i, "string": plain(v)}),
                    })
                })
                .collect();
            props.insert(k.clone(), Value::Array(list));
        }
        packets.push(json!({
            "id": pid,
            "name": id,
            "availability": format!("{}/{}", iso(t0), iso(end)),
            "position": {"epoch": iso(t0), "cartographicDegrees": samples},
            "path": {"width": 2, "leadTime": 0, "resolution": 1,
                     "material": {"solidColor": {"color": {"rgba": rgba(Quality::Unknown)}}}},
            "point": {"pixelSize": 7, "color": colours},
            "properties": props,
        }));
    }
    serde_json::to_string_pretty(&Value::Array(packets)).unwrap_or_default() + "\n"
}

/// The export formats.
pub const EXPORTS: [&str; 3] = ["geojson", "kml", "czml"];

/// Write the fixes in one of [`EXPORTS`].
pub fn export(fixes: &[Fix], format: &str) -> Option<String> {
    Some(match format {
        "geojson" => geojson(fixes),
        "kml" => kml(fixes),
        "czml" => czml(fixes),
        _ => return None,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sample() -> Vec<Fix> {
        let mut out = Vec::new();
        for k in 0..3 {
            let mut f = Fix::new(
                "adsb",
                "4CA7B4".into(),
                Some(1_700_000_000.0 + k as f64),
                53.0 + k as f64 * 0.01,
                -6.0,
            );
            f.alt_m = Some(10_000.0);
            f.quality.insert("nic".into(), (8 - k * 2).into());
            f.quality.insert("nacp".into(), 9.into());
            f.reported_quality = Quality::of_adsb(Some(8 - k as u8 * 2), Some(9));
            f.extra.insert("callsign".into(), "RYR1AB".into());
            out.push(f);
        }
        let mut v = Fix::new("ais", "244123456".into(), None, 52.0, 4.0);
        v.quality.insert("raim".into(), 1.into());
        out.push(v);
        out
    }

    #[test]
    fn geojson_round_trip_keeps_every_attribute() {
        let fixes = sample();
        let text = geojson(&fixes);
        assert_eq!(read_geojson(&text).unwrap(), fixes);
        let v: Value = serde_json::from_str(&text).unwrap();
        assert_eq!(v["features"][0]["geometry"]["type"], "LineString");
        assert_eq!(v["features"][0]["properties"]["classes"]["degraded"], 1);
    }

    #[test]
    fn kml_and_czml_carry_classes_and_times() {
        let fixes = sample();
        let k = kml(&fixes);
        assert!(k.contains("<when>2023-11-14T22:13:20Z</when>"));
        assert!(k.contains("<Data name=\"quality_nic\"><value>4</value></Data>"));
        assert_eq!(k.matches("#q-degraded").count(), 1);
        let c: Value = serde_json::from_str(&czml(&fixes)).unwrap();
        assert_eq!(
            c[1]["position"]["cartographicDegrees"]
                .as_array()
                .unwrap()
                .len(),
            12
        );
        assert_eq!(
            c[1]["properties"]["reported_quality"][2]["string"],
            "degraded"
        );
        assert_eq!(c[1]["properties"]["nic"][1]["number"], 6);
        assert!(c[2]["polyline"].is_object());
    }
}
