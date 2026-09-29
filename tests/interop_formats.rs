// SPDX-License-Identifier: AGPL-3.0-only
//! **Interoperability exports, held to their published specifications.**
//!
//! Every export `--export` writes is parsed here by a validator written from the format's
//! specification, not by the writer's own code:
//!
//! * CZML (Cesium Language), from the CZML guide
//!   <https://github.com/AnalyticalGraphicsInc/czml-writer/wiki/CZML-Structure>: a JSON
//!   array whose first packet is the document packet (`"id": "document"`, `"version"`),
//!   unique packet ids, sampled positions `[t, x, y, z, ...]` with an ISO 8601 epoch and a
//!   stated `referenceFrame` of `FIXED` or `INERTIAL`.
//! * KML (Keyhole Markup Language) 2.2, from the Open Geospatial Consortium standard
//!   <https://www.ogc.org/standard/kml/>: a well-formed XML document in the
//!   `http://www.opengis.net/kml/2.2` namespace, one root feature, the element order the
//!   schema gives a Placemark, at most one geometry per Placemark, closed linear rings of
//!   four or more positions, `lon,lat[,alt]` tuples in range, and a `gx:Track` with as many
//!   `<when>` as `<gx:coord>`.
//! * GeoJSON, from RFC 7946 <https://www.rfc-editor.org/rfc/rfc7946>: longitude first and
//!   in [-180, 180], latitude in [-90, 90], two or three numbers per position, line strings
//!   of two or more positions, closed counter-clockwise exterior rings, no segment across
//!   the antimeridian, no `crs` member.
//! * STK (Systems Tool Kit) ephemeris `.e`, from the Ansys STK help
//!   <https://help.agi.com/stk/#stk/importfiles-02.htm>: the `stk.v.` version line, a
//!   `BEGIN Ephemeris` / `END Ephemeris` block with `ScenarioEpoch`, `CentralBody`,
//!   `CoordinateSystem`, `DistanceUnit`, `EphemerisTimePosVel`, and a
//!   `NumberOfEphemerisPoints` equal to the number of data rows.
//! * SigMF (Signal Metadata Format), from <https://github.com/sigmf/SigMF>: `global` with
//!   `core:datatype` and `core:version`, `captures` and `annotations` arrays, every capture
//!   with `core:sample_start`, and a data file whose length is a whole number of samples.
//!
//! Beyond structure: a satellite exported to CZML and to STK is compared with the engine's
//! own propagated state, after the same frame reduction, to 1 mm; the GeoJSON route import
//! and the SigMF export round-trip; every export is byte-deterministic; and every bundled
//! scenario either exports each format and passes its validator, or states why the format
//! does not apply, in the table `docs/INTEROP.md` carries.

use kshana::interop::{self, scene, ExportError, Format};
use serde_json::Value;
use std::path::{Path, PathBuf};

fn repo() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn scenario(name: &str) -> String {
    std::fs::read_to_string(repo().join("scenarios").join(name)).expect("read scenario")
}

fn one(src: &str, fmt: Format) -> String {
    let files = interop::export(src, fmt).expect("export");
    assert_eq!(files.len(), 1, "{fmt:?} writes one file here");
    String::from_utf8(files[0].bytes.clone()).expect("UTF-8")
}

// ------------------------------------------------------------------------------------
// ISO 8601
// ------------------------------------------------------------------------------------

/// Seconds since 1970 of an ISO 8601 UTC date-time `YYYY-MM-DDTHH:MM:SS[.f]Z`.
fn parse_iso(s: &str) -> Result<f64, String> {
    let b = s.as_bytes();
    if b.len() < 20
        || b[4] != b'-'
        || b[7] != b'-'
        || b[10] != b'T'
        || b[13] != b':'
        || b[16] != b':'
    {
        return Err(format!("not ISO 8601 date-time: {s}"));
    }
    if !s.ends_with('Z') {
        return Err(format!("not UTC (no Z): {s}"));
    }
    let num = |a: usize, z: usize| -> Result<i64, String> {
        s[a..z]
            .parse::<i64>()
            .map_err(|_| format!("bad field in {s}"))
    };
    let (y, mo, d, h, mi) = (
        num(0, 4)?,
        num(5, 7)?,
        num(8, 10)?,
        num(11, 13)?,
        num(14, 16)?,
    );
    let sec: f64 = s[17..s.len() - 1]
        .parse()
        .map_err(|_| format!("bad seconds in {s}"))?;
    if !(1..=12).contains(&mo)
        || !(1..=31).contains(&d)
        || h > 23
        || mi > 59
        || !(0.0..60.0).contains(&sec)
    {
        return Err(format!("field out of range in {s}"));
    }
    let yy = if mo <= 2 { y - 1 } else { y };
    let era = if yy >= 0 { yy } else { yy - 399 } / 400;
    let yoe = yy - era * 400;
    let mp = (mo + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    let days = era * 146_097 + doe - 719_468;
    Ok(days as f64 * 86_400.0 + (h * 3600 + mi * 60) as f64 + sec)
}

// ------------------------------------------------------------------------------------
// CZML
// ------------------------------------------------------------------------------------

#[derive(Debug)]
struct CzmlSampled {
    epoch_s: f64,
    frame: String,
    samples: Vec<[f64; 4]>,
}

/// Validate a CZML document; return its sampled positions by packet id.
fn validate_czml(text: &str) -> Result<Vec<(String, CzmlSampled)>, String> {
    let v: Value = serde_json::from_str(text).map_err(|e| format!("CZML is not JSON: {e}"))?;
    let arr = v.as_array().ok_or("CZML must be a JSON array of packets")?;
    let first = arr.first().ok_or("CZML has no packets")?;
    if first.get("id").and_then(|i| i.as_str()) != Some("document") {
        return Err("the first CZML packet must be the document packet (id \"document\")".into());
    }
    if first.get("version").and_then(|i| i.as_str()).is_none() {
        return Err("the document packet must carry a version".into());
    }
    if first.get("position").is_some() {
        return Err("the document packet carries no position".into());
    }
    if let Some(clock) = first.get("clock") {
        let iv = clock["interval"]
            .as_str()
            .ok_or("clock.interval must be a string")?;
        let (a, b) = iv
            .split_once('/')
            .ok_or("clock.interval must be start/stop")?;
        if parse_iso(a)? > parse_iso(b)? {
            return Err("clock interval runs backwards".into());
        }
        parse_iso(clock["currentTime"].as_str().ok_or("clock.currentTime")?)?;
    }
    let mut ids = std::collections::BTreeSet::new();
    let mut out = Vec::new();
    for (k, p) in arr.iter().enumerate() {
        let id = p
            .get("id")
            .and_then(|i| i.as_str())
            .ok_or(format!("packet {k} has no id"))?;
        if !ids.insert(id.to_string()) {
            return Err(format!("duplicate packet id {id}"));
        }
        if k > 0 && id == "document" {
            return Err("only the first packet may be the document packet".into());
        }
        if let Some(iv) = p.get("availability") {
            let iv = iv
                .as_str()
                .ok_or("availability must be an interval string")?;
            let (a, b) = iv
                .split_once('/')
                .ok_or("availability must be start/stop")?;
            parse_iso(a)?;
            parse_iso(b)?;
        }
        if let Some(pos) = p.get("position") {
            let frame = pos
                .get("referenceFrame")
                .and_then(|f| f.as_str())
                .ok_or(format!("{id}: position must state its referenceFrame"))?;
            if frame != "FIXED" && frame != "INERTIAL" {
                return Err(format!(
                    "{id}: referenceFrame {frame} is neither FIXED nor INERTIAL"
                ));
            }
            let cart = pos["cartesian"]
                .as_array()
                .ok_or(format!("{id}: cartesian array"))?;
            let nums: Vec<f64> = cart
                .iter()
                .map(|x| x.as_f64().ok_or(format!("{id}: non-number in cartesian")))
                .collect::<Result<_, _>>()?;
            match pos.get("epoch") {
                Some(e) => {
                    let epoch_s = parse_iso(e.as_str().ok_or("epoch string")?)?;
                    if nums.len() % 4 != 0 || nums.is_empty() {
                        return Err(format!("{id}: sampled cartesian must be [t, x, y, z, ...]"));
                    }
                    let samples: Vec<[f64; 4]> =
                        nums.chunks(4).map(|c| [c[0], c[1], c[2], c[3]]).collect();
                    for w in samples.windows(2) {
                        if w[1][0] <= w[0][0] {
                            return Err(format!("{id}: sample times must increase"));
                        }
                    }
                    for s in &samples {
                        let r = (s[1] * s[1] + s[2] * s[2] + s[3] * s[3]).sqrt();
                        if r < 6.0e6 {
                            return Err(format!(
                                "{id}: |r| = {r} m is inside the Earth: not metres?"
                            ));
                        }
                    }
                    out.push((
                        id.to_string(),
                        CzmlSampled {
                            epoch_s,
                            frame: frame.to_string(),
                            samples,
                        },
                    ));
                }
                None => {
                    if nums.len() != 3 {
                        return Err(format!("{id}: a constant cartesian is [x, y, z]"));
                    }
                    let r = (nums[0] * nums[0] + nums[1] * nums[1] + nums[2] * nums[2]).sqrt();
                    if !(6.3e6..6.5e6).contains(&r) {
                        return Err(format!(
                            "{id}: fixed site at |r| = {r} m is not on the Earth"
                        ));
                    }
                }
            }
        }
        if let Some(e) = p.get("ellipse") {
            let a = e["semiMajorAxis"].as_f64().ok_or("ellipse semiMajorAxis")?;
            let b = e["semiMinorAxis"].as_f64().ok_or("ellipse semiMinorAxis")?;
            if !(a > 0.0 && b > 0.0 && b <= a) {
                return Err(format!(
                    "{id}: ellipse axes must be positive with minor <= major"
                ));
            }
            if p.get("position").is_none() {
                return Err(format!("{id}: an ellipse needs a position"));
            }
        }
        if let Some(pl) = p.get("polyline") {
            let deg = pl["positions"]["cartographicDegrees"]
                .as_array()
                .ok_or(format!("{id}: polyline positions"))?;
            if deg.len() % 3 != 0 || deg.len() < 6 {
                return Err(format!(
                    "{id}: cartographicDegrees must be [lon, lat, h, ...] x2+"
                ));
            }
            for c in deg.chunks(3) {
                let (lon, lat) = (
                    c[0].as_f64().unwrap_or(999.0),
                    c[1].as_f64().unwrap_or(999.0),
                );
                if !(-180.0..=180.0).contains(&lon) || !(-90.0..=90.0).contains(&lat) {
                    return Err(format!("{id}: polyline position out of range"));
                }
            }
        }
    }
    Ok(out)
}

// ------------------------------------------------------------------------------------
// XML and KML
// ------------------------------------------------------------------------------------

#[derive(Debug)]
struct El {
    name: String,
    attrs: Vec<(String, String)>,
    children: Vec<El>,
    text: String,
}

impl El {
    fn attr(&self, k: &str) -> Option<&str> {
        self.attrs
            .iter()
            .find(|(a, _)| a == k)
            .map(|(_, v)| v.as_str())
    }
    fn kids<'a>(&'a self, name: &'a str) -> impl Iterator<Item = &'a El> + 'a {
        self.children.iter().filter(move |c| c.name == name)
    }
    fn walk<'a>(&'a self, out: &mut Vec<&'a El>) {
        out.push(self);
        for c in &self.children {
            c.walk(out);
        }
    }
}

fn decode_entities(s: &str) -> Result<String, String> {
    let mut o = String::new();
    let mut rest = s;
    while let Some(i) = rest.find('&') {
        o.push_str(&rest[..i]);
        let semi = rest[i..].find(';').ok_or("bare & in XML text")?;
        let ent = &rest[i + 1..i + semi];
        o.push(match ent {
            "amp" => '&',
            "lt" => '<',
            "gt" => '>',
            "quot" => '"',
            "apos" => '\'',
            other => return Err(format!("unknown XML entity &{other};")),
        });
        rest = &rest[i + semi + 1..];
    }
    o.push_str(rest);
    Ok(o)
}

/// A minimal well-formedness parser: declaration, comments, elements, attributes, text.
fn parse_xml(s: &str) -> Result<El, String> {
    let mut i = 0usize;
    let b = s.as_bytes();
    let mut stack: Vec<El> = vec![El {
        name: "#root".into(),
        attrs: vec![],
        children: vec![],
        text: String::new(),
    }];
    while i < b.len() {
        if b[i] == b'<' {
            if s[i..].starts_with("<?") {
                i += s[i..].find("?>").ok_or("unterminated declaration")? + 2;
            } else if s[i..].starts_with("<!--") {
                i += s[i..].find("-->").ok_or("unterminated comment")? + 3;
            } else if s[i..].starts_with("</") {
                let end = i + s[i..].find('>').ok_or("unterminated end tag")?;
                let name = s[i + 2..end].trim();
                let el = stack.pop().ok_or("unbalanced end tag")?;
                if el.name != name {
                    return Err(format!("end tag </{name}> closes <{}>", el.name));
                }
                stack.last_mut().ok_or("end tag at root")?.children.push(el);
                i = end + 1;
            } else {
                let end = i + s[i..].find('>').ok_or("unterminated start tag")?;
                let mut inner = &s[i + 1..end];
                let self_close = inner.ends_with('/');
                if self_close {
                    inner = &inner[..inner.len() - 1];
                }
                let mut parts = inner.splitn(2, char::is_whitespace);
                let name = parts.next().ok_or("empty tag")?.to_string();
                if name.is_empty() || name.contains('"') {
                    return Err(format!("bad element name {name:?}"));
                }
                let mut attrs = Vec::new();
                let mut rest = parts.next().unwrap_or("").trim();
                while !rest.is_empty() {
                    let eq = rest
                        .find('=')
                        .ok_or(format!("attribute without value in <{name}>"))?;
                    let key = rest[..eq].trim().to_string();
                    let r2 = rest[eq + 1..].trim_start();
                    let q = r2.chars().next().ok_or("attribute value missing")?;
                    if q != '"' && q != '\'' {
                        return Err("attribute value must be quoted".into());
                    }
                    let close = r2[1..].find(q).ok_or("unterminated attribute value")?;
                    if attrs.iter().any(|(k, _): &(String, String)| *k == key) {
                        return Err(format!("duplicate attribute {key}"));
                    }
                    attrs.push((key, decode_entities(&r2[1..1 + close])?));
                    rest = r2[close + 2..].trim_start();
                }
                let el = El {
                    name,
                    attrs,
                    children: vec![],
                    text: String::new(),
                };
                if self_close {
                    stack.last_mut().ok_or("no parent")?.children.push(el);
                } else {
                    stack.push(el);
                }
                i = end + 1;
            }
        } else {
            let next = s[i..].find('<').map(|k| i + k).unwrap_or(b.len());
            let text = decode_entities(&s[i..next])?;
            let top = stack.last_mut().ok_or("text outside the document")?;
            if top.name == "#root" && !text.trim().is_empty() {
                return Err("text outside the root element".into());
            }
            top.text.push_str(&text);
            i = next;
        }
    }
    if stack.len() != 1 {
        return Err(format!(
            "unclosed element <{}>",
            stack.last().map(|e| e.name.as_str()).unwrap_or("?")
        ));
    }
    let mut root = stack.pop().ok_or("empty")?;
    if root.children.len() != 1 {
        return Err("an XML document has exactly one root element".into());
    }
    Ok(root.children.remove(0))
}

fn check_coord_tuple(t: &str, sep: char) -> Result<[f64; 3], String> {
    let f: Vec<&str> = t.split(sep).collect();
    if f.len() != 2 && f.len() != 3 {
        return Err(format!(
            "coordinate tuple {t:?} is not lon{sep}lat[{sep}alt]"
        ));
    }
    let n: Vec<f64> = f
        .iter()
        .map(|x| x.parse::<f64>().map_err(|_| format!("non-number in {t:?}")))
        .collect::<Result<_, _>>()?;
    if !(-180.0..=180.0).contains(&n[0]) || !(-90.0..=90.0).contains(&n[1]) {
        return Err(format!("coordinate {t:?} out of range (longitude first)"));
    }
    Ok([n[0], n[1], *n.get(2).unwrap_or(&0.0)])
}

/// Validate a KML 2.2 document; return (placemark name, track times, track coords).
#[allow(clippy::type_complexity)]
fn validate_kml(text: &str) -> Result<Vec<(String, Vec<f64>, Vec<[f64; 3]>)>, String> {
    let root = parse_xml(text)?;
    if root.name != "kml" {
        return Err("the root element must be <kml>".into());
    }
    if root.attr("xmlns") != Some("http://www.opengis.net/kml/2.2") {
        return Err("<kml> must declare the OGC KML 2.2 namespace".into());
    }
    let features: Vec<&El> = root
        .children
        .iter()
        .filter(|c| matches!(c.name.as_str(), "Document" | "Folder" | "Placemark"))
        .collect();
    if features.len() != 1 {
        return Err("<kml> holds at most one root feature".into());
    }
    let mut all = Vec::new();
    root.walk(&mut all);
    let style_ids: Vec<&str> = all
        .iter()
        .filter(|e| e.name == "Style")
        .filter_map(|e| e.attr("id"))
        .collect();
    let uses_gx = all.iter().any(|e| e.name.starts_with("gx:"));
    if uses_gx && root.attr("xmlns:gx") != Some("http://www.google.com/kml/ext/2.2") {
        return Err("gx: elements need the Google extension namespace declared".into());
    }
    // Element order the schema gives a Placemark (the members this validator knows):
    // name, description, styleUrl, then the geometry.
    let rank = |n: &str| match n {
        "name" => Some(0),
        "description" => Some(1),
        "styleUrl" => Some(2),
        "Point" | "LineString" | "Polygon" | "gx:Track" | "MultiGeometry" => Some(3),
        _ => None,
    };
    let geoms = [
        "Point",
        "LineString",
        "Polygon",
        "gx:Track",
        "MultiGeometry",
    ];
    let mut tracks = Vec::new();
    for e in &all {
        match e.name.as_str() {
            "Placemark" => {
                let mut last = 0;
                for c in &e.children {
                    let r = rank(&c.name).ok_or(format!("unexpected <{}> in Placemark", c.name))?;
                    if r < last {
                        return Err(format!("<{}> out of schema order in Placemark", c.name));
                    }
                    last = r;
                }
                let ng = e
                    .children
                    .iter()
                    .filter(|c| geoms.contains(&c.name.as_str()))
                    .count();
                if ng > 1 {
                    return Err("a Placemark holds at most one geometry".into());
                }
                if let Some(t) = e.kids("gx:Track").next() {
                    let whens: Vec<f64> = t
                        .kids("when")
                        .map(|w| parse_iso(w.text.trim()))
                        .collect::<Result<_, _>>()?;
                    let coords: Vec<[f64; 3]> = t
                        .kids("gx:coord")
                        .map(|c| {
                            check_coord_tuple(
                                &c.text.split_whitespace().collect::<Vec<_>>().join(","),
                                ',',
                            )
                        })
                        .collect::<Result<_, _>>()?;
                    if whens.len() != coords.len() || whens.is_empty() {
                        return Err(
                            "gx:Track needs as many <when> as <gx:coord>, at least one".into()
                        );
                    }
                    for w in whens.windows(2) {
                        if w[1] < w[0] {
                            return Err("gx:Track times must not run backwards".into());
                        }
                    }
                    let name = e
                        .kids("name")
                        .next()
                        .map(|n| n.text.clone())
                        .unwrap_or_default();
                    tracks.push((name, whens, coords));
                }
            }
            "altitudeMode" => {
                if !matches!(
                    e.text.trim(),
                    "clampToGround" | "relativeToGround" | "absolute"
                ) {
                    return Err(format!("altitudeMode {:?} is not a KML value", e.text));
                }
            }
            "coordinates" => {
                let tuples: Vec<[f64; 3]> = e
                    .text
                    .split_whitespace()
                    .map(|t| check_coord_tuple(t, ','))
                    .collect::<Result<_, _>>()?;
                if tuples.is_empty() {
                    return Err("empty <coordinates>".into());
                }
            }
            "LinearRing" => {
                let c = e
                    .kids("coordinates")
                    .next()
                    .ok_or("LinearRing without coordinates")?;
                let t: Vec<&str> = c.text.split_whitespace().collect();
                if t.len() < 4 || t.first() != t.last() {
                    return Err("a LinearRing is closed and has four or more positions".into());
                }
            }
            "LineString" => {
                let c = e
                    .kids("coordinates")
                    .next()
                    .ok_or("LineString without coordinates")?;
                if c.text.split_whitespace().count() < 2 {
                    return Err("a LineString has two or more positions".into());
                }
            }
            "Polygon" => {
                if e.kids("outerBoundaryIs").count() != 1 {
                    return Err("a Polygon has exactly one outerBoundaryIs".into());
                }
            }
            "styleUrl" => {
                let id = e
                    .text
                    .trim()
                    .strip_prefix('#')
                    .ok_or("local styleUrl starts with #")?;
                if !style_ids.contains(&id) {
                    return Err(format!("styleUrl #{id} names no Style"));
                }
            }
            _ => {}
        }
    }
    Ok(tracks)
}

// ------------------------------------------------------------------------------------
// GeoJSON
// ------------------------------------------------------------------------------------

fn check_position(p: &Value) -> Result<[f64; 3], String> {
    let a = p.as_array().ok_or("a position is an array")?;
    if a.len() != 2 && a.len() != 3 {
        return Err("a position has two or three numbers".into());
    }
    let n: Vec<f64> = a
        .iter()
        .map(|x| x.as_f64().ok_or("position member is not a number"))
        .collect::<Result<_, _>>()?;
    if !(-180.0..=180.0).contains(&n[0]) {
        return Err(format!(
            "longitude {} out of range (longitude comes first)",
            n[0]
        ));
    }
    if !(-90.0..=90.0).contains(&n[1]) {
        return Err(format!("latitude {} out of range", n[1]));
    }
    Ok([n[0], n[1], *n.get(2).unwrap_or(&0.0)])
}

fn check_line(c: &Value) -> Result<Vec<[f64; 3]>, String> {
    let pts: Vec<[f64; 3]> = c
        .as_array()
        .ok_or("line coordinates")?
        .iter()
        .map(check_position)
        .collect::<Result<_, _>>()?;
    if pts.len() < 2 {
        return Err("a LineString has two or more positions".into());
    }
    for w in pts.windows(2) {
        if (w[1][0] - w[0][0]).abs() > 180.0 {
            return Err(
                "a segment crosses the antimeridian without being cut (RFC 7946 3.1.9)".into(),
            );
        }
    }
    Ok(pts)
}

fn validate_geojson(text: &str) -> Result<Vec<Value>, String> {
    let v: Value = serde_json::from_str(text).map_err(|e| format!("not JSON: {e}"))?;
    if v["type"] != "FeatureCollection" {
        return Err("expected a FeatureCollection".into());
    }
    if v.get("crs").is_some() {
        return Err("RFC 7946 removed the crs member".into());
    }
    let fs = v["features"].as_array().ok_or("features array")?;
    for f in fs {
        if f["type"] != "Feature" {
            return Err("every member of features is a Feature".into());
        }
        if f.get("properties").is_none() || f.get("geometry").is_none() {
            return Err("a Feature has geometry and properties members".into());
        }
        if f["properties"].get("units").is_none() {
            return Err("every exported feature names its units".into());
        }
        let g = &f["geometry"];
        match g["type"].as_str().ok_or("geometry type")? {
            "Point" => {
                check_position(&g["coordinates"])?;
            }
            "LineString" => {
                let pts = check_line(&g["coordinates"])?;
                if let Some(t) = f["properties"].get("times_utc") {
                    let t = t.as_array().ok_or("times_utc array")?;
                    if t.len() != pts.len() {
                        return Err("times_utc has one time per position".into());
                    }
                    for s in t {
                        parse_iso(s.as_str().ok_or("time string")?)?;
                    }
                }
            }
            "MultiLineString" => {
                for l in g["coordinates"].as_array().ok_or("multiline")? {
                    check_line(l)?;
                }
            }
            "Polygon" => {
                for (k, ring) in g["coordinates"]
                    .as_array()
                    .ok_or("rings")?
                    .iter()
                    .enumerate()
                {
                    let pts: Vec<[f64; 3]> = ring
                        .as_array()
                        .ok_or("ring")?
                        .iter()
                        .map(check_position)
                        .collect::<Result<_, _>>()?;
                    if pts.len() < 4 || pts.first() != pts.last() {
                        return Err("a linear ring is closed with four or more positions".into());
                    }
                    let area: f64 = pts
                        .windows(2)
                        .map(|w| w[0][0] * w[1][1] - w[1][0] * w[0][1])
                        .sum();
                    if k == 0 && area <= 0.0 {
                        return Err(
                            "the exterior ring must be counter-clockwise (RFC 7946 3.1.6)".into(),
                        );
                    }
                }
            }
            other => return Err(format!("unexpected geometry {other}")),
        }
    }
    Ok(fs.clone())
}

// ------------------------------------------------------------------------------------
// STK .e
// ------------------------------------------------------------------------------------

#[derive(Debug)]
struct StkFile {
    epoch_s: f64,
    frame: String,
    rows: Vec<[f64; 7]>,
}

fn parse_stk_epoch(s: &str) -> Result<f64, String> {
    // d Mon yyyy hh:mm:ss.s
    let f: Vec<&str> = s.split_whitespace().collect();
    if f.len() != 4 {
        return Err(format!("ScenarioEpoch {s:?} is not 'd Mon yyyy hh:mm:ss'"));
    }
    let months = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
    ];
    let mo = months.iter().position(|m| *m == f[1]).ok_or("bad month")? + 1;
    let d: u32 = f[0].parse().map_err(|_| "bad day")?;
    parse_iso(&format!("{}-{:02}-{:02}T{}Z", f[2], mo, d, f[3]))
}

fn validate_stk(text: &str) -> Result<StkFile, String> {
    let mut lines = text.lines();
    let first = lines.next().ok_or("empty file")?;
    if !first.starts_with("stk.v.") {
        return Err("an STK ephemeris starts with its stk.v. version line".into());
    }
    let body: Vec<&str> = text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .collect();
    let b = body
        .iter()
        .position(|l| *l == "BEGIN Ephemeris")
        .ok_or("no BEGIN Ephemeris")?;
    let e = body
        .iter()
        .position(|l| *l == "END Ephemeris")
        .ok_or("no END Ephemeris")?;
    if e <= b {
        return Err("END Ephemeris precedes BEGIN Ephemeris".into());
    }
    let mut kw = std::collections::BTreeMap::new();
    let mut data_at = None;
    for (k, l) in body[b + 1..e].iter().enumerate() {
        if *l == "EphemerisTimePosVel" {
            data_at = Some(b + 1 + k + 1);
            break;
        }
        let (key, val) = l
            .split_once(char::is_whitespace)
            .ok_or(format!("keyword line {l:?}"))?;
        kw.insert(key.to_string(), val.trim().to_string());
    }
    let data_at = data_at.ok_or("no EphemerisTimePosVel section")?;
    for req in [
        "NumberOfEphemerisPoints",
        "ScenarioEpoch",
        "CentralBody",
        "CoordinateSystem",
        "DistanceUnit",
    ] {
        if !kw.contains_key(req) {
            return Err(format!("missing keyword {req}"));
        }
    }
    if kw["DistanceUnit"] != "Meters" {
        return Err("DistanceUnit must be Meters".into());
    }
    let n: usize = kw["NumberOfEphemerisPoints"]
        .parse()
        .map_err(|_| "NumberOfEphemerisPoints not an integer")?;
    let rows: Vec<[f64; 7]> = body[data_at..e]
        .iter()
        .map(|l| {
            let v: Vec<f64> = l
                .split_whitespace()
                .map(|x| x.parse::<f64>().map_err(|_| format!("row {l:?}")))
                .collect::<Result<_, _>>()?;
            if v.len() != 7 {
                return Err(format!("EphemerisTimePosVel row has 7 numbers: {l:?}"));
            }
            Ok([v[0], v[1], v[2], v[3], v[4], v[5], v[6]])
        })
        .collect::<Result<_, String>>()?;
    if rows.len() != n {
        return Err(format!(
            "NumberOfEphemerisPoints {n} but {} data rows",
            rows.len()
        ));
    }
    for w in rows.windows(2) {
        if w[1][0] <= w[0][0] {
            return Err("ephemeris times must increase".into());
        }
    }
    for r in &rows {
        let rr = (r[1] * r[1] + r[2] * r[2] + r[3] * r[3]).sqrt();
        if rr < 6.0e6 {
            return Err(format!(
                "|r| = {rr}: positions are not metres from the Earth's centre"
            ));
        }
    }
    Ok(StkFile {
        epoch_s: parse_stk_epoch(&kw["ScenarioEpoch"])?,
        frame: kw["CoordinateSystem"].clone(),
        rows,
    })
}

// ------------------------------------------------------------------------------------
// SigMF
// ------------------------------------------------------------------------------------

fn validate_sigmf(meta: &str, data: &[u8]) -> Result<(), String> {
    let v: Value = serde_json::from_str(meta).map_err(|e| format!("meta not JSON: {e}"))?;
    let g = v.get("global").ok_or("no global object")?;
    let dt = g
        .get("core:datatype")
        .and_then(|d| d.as_str())
        .ok_or("global core:datatype is required")?;
    g.get("core:version")
        .and_then(|d| d.as_str())
        .ok_or("global core:version is required")?;
    let caps = v
        .get("captures")
        .and_then(|c| c.as_array())
        .ok_or("captures array is required")?;
    v.get("annotations")
        .and_then(|c| c.as_array())
        .ok_or("annotations array is required")?;
    for c in caps {
        c.get("core:sample_start")
            .and_then(|s| s.as_u64())
            .ok_or("each capture has core:sample_start")?;
    }
    let size = match dt {
        "cf32_le" => 8,
        "ci16_le" => 4,
        "ci8" => 2,
        other => return Err(format!("unexpected datatype {other}")),
    };
    if data.is_empty() || data.len() % size != 0 {
        return Err("the data file is a whole, non-zero number of samples".into());
    }
    Ok(())
}

/// Validate every file one export wrote.
fn validate(fmt: Format, files: &[interop::ExportFile]) -> Result<(), String> {
    let text = |i: usize| String::from_utf8(files[i].bytes.clone()).map_err(|e| e.to_string());
    match fmt {
        Format::Czml => validate_czml(&text(0)?).map(|_| ()),
        Format::Kml => validate_kml(&text(0)?).map(|_| ()),
        Format::GeoJson => validate_geojson(&text(0)?).map(|_| ()),
        Format::Stk => {
            for i in 0..files.len() {
                validate_stk(&text(i)?)?;
            }
            Ok(())
        }
        Format::Sigmf => validate_sigmf(&text(0)?, &files[1].bytes),
    }
}

// ------------------------------------------------------------------------------------
// Tests
// ------------------------------------------------------------------------------------

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

#[test]
fn ephemeris_export_equals_the_engines_own_states_to_a_millimetre() {
    let src = scenario("ephemeris.toml");
    let scn: kshana::ephemeris::EphemerisScenario = toml::from_str(&src).unwrap();
    let truth = kshana::ephemeris::run_ephemeris(&scn).unwrap();
    let epoch = kshana::interop::UtcEpoch::from_jd_utc(truth.jd_utc0);
    let epoch_unix = parse_iso(&epoch.iso(0.0)).unwrap();

    let czml = validate_czml(&one(&src, Format::Czml)).unwrap();
    let (_, sat) = czml
        .iter()
        .find(|(id, _)| id == "satellite/satellite")
        .unwrap();
    assert_eq!(sat.frame, "INERTIAL");
    assert!((sat.epoch_s - epoch_unix).abs() < 1e-6);
    assert_eq!(sat.samples.len(), truth.samples.len());
    let mut worst = 0.0f64;
    for (s, e) in sat.samples.iter().zip(&truth.samples) {
        assert!((s[0] - e.t_s).abs() < 1e-6);
        worst = worst.max(dist([s[1], s[2], s[3]], e.gcrs_r_m));
    }
    assert!(worst < 1e-3, "CZML vs engine GCRS: {worst} m");

    let stk = validate_stk(&one(&src, Format::Stk)).unwrap();
    assert_eq!(stk.frame, "ICRF");
    assert!((stk.epoch_s - epoch_unix).abs() < 1e-6);
    let (mut wr, mut wv) = (0.0f64, 0.0f64);
    for (r, e) in stk.rows.iter().zip(&truth.samples) {
        wr = wr.max(dist([r[1], r[2], r[3]], e.gcrs_r_m));
        wv = wv.max(dist([r[4], r[5], r[6]], e.gcrs_v_m_s));
    }
    assert!(wr < 1e-3, "STK position vs engine: {wr} m");
    assert!(wv < 1e-6, "STK velocity vs engine: {wv} m/s");

    // The Earth-fixed formats carry the engine's own geodetic track.
    let tracks = validate_kml(&one(&src, Format::Kml)).unwrap();
    let (_, times, coords) = &tracks[0];
    assert_eq!(coords.len(), truth.samples.len());
    for ((c, t), e) in coords.iter().zip(times).zip(&truth.samples) {
        assert!((t - epoch_unix - e.t_s).abs() < 1e-5);
        assert!((c[0] - e.lon_deg).abs() < 1e-8 && (c[1] - e.lat_deg).abs() < 1e-8);
        assert!((c[2] - e.alt_km * 1000.0).abs() < 2e-3);
    }
}

/// UTC Julian Date of a two-line element set's epoch, read straight from columns 19-32
/// of line 1 (two-digit year, day of year with fraction), not through the engine.
fn tle_epoch_jd_utc(line1: &str) -> f64 {
    let yy: i32 = line1[18..20].trim().parse().unwrap();
    let doy: f64 = line1[20..32].trim().parse().unwrap();
    let year = if yy < 57 { 2000 + yy } else { 1900 + yy };
    kshana::timescales::julian_date(year, 1, 1, 0, 0, 0.0) + doy - 1.0
}

#[test]
fn orbit_export_equals_an_independent_propagation_to_a_millimetre() {
    let src = scenario("orbit-sgp4-gps.toml");
    let scn: kshana::orbit::OrbitClockScenario = toml::from_str(&src).unwrap();
    assert!(
        scn.epoch.is_none(),
        "the scenario dates itself from its TLEs"
    );
    let sats = scn.all_satellites().unwrap();
    // Each satellite's t = 0 is its own TLE epoch, read from the scenario text.
    let v: toml::Value = toml::from_str(&src).unwrap();
    let tle = v["constellation"]["tle"].as_str().unwrap();
    let epochs: Vec<f64> = tle
        .lines()
        .filter(|l| l.starts_with("1 "))
        .map(tle_epoch_jd_utc)
        .collect();
    assert_eq!(epochs.len(), sats.len());
    let czml = validate_czml(&one(&src, Format::Czml)).unwrap();
    // The export's t = 0 is the earliest TLE epoch, not a placeholder date.
    let earliest = epochs.iter().copied().fold(f64::INFINITY, f64::min);
    let (_, c0) = czml.iter().find(|(i, _)| i == "satellite/G01").unwrap();
    let earliest_unix = (earliest - 2_440_587.5) * 86_400.0;
    assert!(
        (c0.epoch_s - earliest_unix).abs() < 1e-3,
        "CZML epoch {} s vs earliest TLE epoch {} s",
        c0.epoch_s,
        earliest_unix
    );
    let stk_files = interop::export(&src, Format::Stk).unwrap();
    assert_eq!(
        stk_files.len(),
        sats.len() + 1,
        "one .e per satellite plus the user"
    );
    let mut worst = 0.0f64;
    for (k, p) in sats.iter().enumerate().take(4) {
        let id = format!("G{:02}", k + 1);
        let (_, c) = czml
            .iter()
            .find(|(i, _)| *i == format!("satellite/{id}"))
            .unwrap();
        assert_eq!(c.frame, "INERTIAL");
        let stk_file = stk_files
            .iter()
            .find(|f| f.suffix == format!(".{id}.e"))
            .unwrap();
        let stk = validate_stk(std::str::from_utf8(&stk_file.bytes).unwrap()).unwrap();
        for (s, row) in c.samples.iter().zip(&stk.rows).step_by(7) {
            let t = s[0];
            let st = p.state_eci(t);
            // The TEME position belongs to the satellite's own instant: its TLE epoch
            // plus t.
            let jd_tt = kshana::timescales::utc_to_tt(epochs[k] + t / 86_400.0);
            let (r, v) = kshana::nutation::teme_to_gcrs(st.r_m, st.v_m_s, jd_tt);
            worst = worst.max(dist([s[1], s[2], s[3]], r));
            worst = worst.max(dist([row[1], row[2], row[3]], r));
            assert!(dist([row[4], row[5], row[6]], v) < 1e-5);
        }
    }
    assert!(worst < 1e-3, "export vs engine TEME->GCRS: {worst} m");
}

#[test]
fn sgp4_export_matches_an_external_erfa_reduction() {
    // External oracle: the first satellite of `orbit-sgp4-gps` (GPS PRN 13, TLE epoch
    // 2021-07-28T06:49:56.822 UTC) propagated by the `sgp4` 2.27 Python package (WGS 72),
    // and its TEME position reduced to the GCRS by ERFA 2.0.1.5 (pyerfa): TT from
    // `utctai`/`taitt`, then `pnm06a`ᵀ · R3(−`ee06a`), the IAU 2006/2000A equinox-based
    // chain. Seconds after the satellite's own TLE epoch, metres.
    const ERFA_GCRS_M: [(f64, [f64; 3]); 3] = [
        (0.0, [-25905790.1884, 5488874.7823, 53509.6931]),
        (3600.0, [-23867973.0030, -2668910.3051, 11046364.0900]),
        (21600.0, [26133517.8355, -5145761.3669, -617533.3208]),
    ];
    let src = scenario("orbit-sgp4-gps.toml");
    let czml = validate_czml(&one(&src, Format::Czml)).unwrap();
    let (_, g01) = czml.iter().find(|(i, _)| i == "satellite/G01").unwrap();
    for (t, want) in ERFA_GCRS_M {
        let s = g01
            .samples
            .iter()
            .find(|s| (s[0] - t).abs() < 1e-9)
            .unwrap();
        let d = dist([s[1], s[2], s[3]], want);
        // Measured 2.3 cm: the engine's equinox chain uses IAU 2000B nutation and the
        // two leading complementary terms of the equation of the equinoxes, ERFA the
        // full IAU 2000A. A wrong frame date (J2000 for a 2021 TLE) misses by 135 km,
        // a sign slip in the nutation matrix by 3.7 km.
        assert!(d < 0.1, "t = {t} s: CZML vs ERFA GCRS {d} m");
    }
}

#[test]
fn rinex_export_places_each_satellite_at_its_broadcast_earth_fixed_position() {
    // A broadcast ephemeris gives the satellite's Earth-fixed position directly
    // (IS-GPS-200). The export's Earth-fixed track must be that position, and its t = 0
    // the ephemeris's own date, not a placeholder.
    let src = scenario("orbit-rinex.toml");
    let scn: kshana::orbit::OrbitClockScenario = toml::from_str(&src).unwrap();
    let sats = scn.all_satellites().unwrap();
    let sc = scene::scene_of(&src).unwrap();
    let epoch = sc.epoch.unwrap();
    assert!(
        epoch.iso(0.0).starts_with("2023-"),
        "t = 0 is {}",
        epoch.iso(0.0)
    );
    let gj = validate_geojson(&one(&src, Format::GeoJson)).unwrap();
    let mut worst = 0.0f64;
    let mut worst_gj = 0.0f64;
    let mut n = 0;
    for (k, p) in sats.iter().enumerate() {
        let kshana::orbit::Propagator::Rinex(e) = p else {
            continue;
        };
        let id = format!("G{:02}", k + 1);
        let m = sc.movers.iter().find(|m| m.id == id).unwrap();
        let f = gj
            .iter()
            .find(|f| f["id"] == format!("satellite/{id}"))
            .unwrap();
        let coords = f["geometry"]["coordinates"].as_array().unwrap();
        for (i, &t) in sc.times_s.iter().enumerate() {
            let truth = e.sv_position_ecef(e.toe + t);
            worst = worst.max(dist(m.ecef_r_m[i], truth));
            if f["geometry"]["type"] == "LineString" {
                let c = &coords[i];
                let back = kshana::frames::geodetic_to_ecef(kshana::frames::Geodetic {
                    lat_rad: c[1].as_f64().unwrap().to_radians(),
                    lon_rad: c[0].as_f64().unwrap().to_radians(),
                    alt_m: c[2].as_f64().unwrap(),
                });
                worst_gj = worst_gj.max(dist(back, truth));
            }
        }
        n += 1;
    }
    assert!(n >= 4, "{n} broadcast satellites");
    assert!(worst < 1e-3, "scene Earth-fixed vs broadcast: {worst} m");
    assert!(worst_gj < 2e-3, "GeoJSON vs broadcast: {worst_gj} m");
}

#[test]
fn jamming_export_places_satellites_where_the_engine_scores_them() {
    let src = scenario("jamming-demo.toml");
    let scn: kshana::jamming::JammingScenario = toml::from_str(&src).unwrap();
    let sats = scn.constellation.satellites();
    let gj = validate_geojson(&one(&src, Format::GeoJson)).unwrap();
    let g01 = gj.iter().find(|f| f["id"] == "satellite/G01").unwrap();
    let times = g01["properties"]["times_utc"].as_array().unwrap();
    let coords = g01["geometry"]["coordinates"].as_array().unwrap();
    assert_eq!(g01["geometry"]["type"], "LineString");
    for (k, c) in coords.iter().enumerate() {
        let t = k as f64 * scn.time.step_s;
        let ecef = kshana::frames::teme_to_ecef(
            sats[0].position_eci(t),
            kshana::walker::walker_epoch_jd() + t / 86_400.0,
        );
        let lon = c[0].as_f64().unwrap().to_radians();
        let lat = c[1].as_f64().unwrap().to_radians();
        let h = c[2].as_f64().unwrap();
        let back = kshana::frames::geodetic_to_ecef(kshana::frames::Geodetic {
            lat_rad: lat,
            lon_rad: lon,
            alt_m: h,
        });
        assert!(
            dist(back, ecef) < 5e-3,
            "sample {k}: {} m",
            dist(back, ecef)
        );
        let expect =
            kshana::interop::UtcEpoch::from_jd_utc(kshana::walker::walker_epoch_jd()).iso(t);
        assert_eq!(times[k].as_str().unwrap(), expect);
    }
    // The footprints are where the link equations put the threshold.
    let j = scn.jammer.as_ref().unwrap();
    for (el, id) in [
        (std::f64::consts::FRAC_PI_2, "footprint/denial"),
        (scn.mask_deg.to_radians(), "footprint/onset"),
    ] {
        let d = scene::jammer_denial_range_m(&scn, j, el).unwrap();
        let g = kshana::jamming::rx_antenna_gain_db(el);
        let js = kshana::jamming::j_over_s_db(
            j.power_dbw,
            j.gain_dbi,
            kshana::jamming::rx_antenna_gain_db(0.0),
            d,
            scn.freq_hz,
            scn.signal_power_dbw,
            g,
        );
        let cn0 = kshana::jamming::nominal_cn0_dbhz(scn.signal_power_dbw, g, scn.temp_k);
        let eff = kshana::jamming::effective_cn0_dbhz(
            cn0,
            js,
            kshana::jamming::q_factor(&j.jammer_type, j.q_override),
            scn.chip_rate_hz,
        );
        assert!(
            (eff - scn.tracking_threshold_dbhz).abs() < 1e-6,
            "{id}: {eff}"
        );
        let f = gj.iter().find(|f| f["id"] == id).unwrap();
        assert!((f["properties"]["radius_m"].as_f64().unwrap() - d).abs() < 1e-3);
    }
}

#[test]
fn geojson_route_round_trips_through_a_track_scenario() {
    let src = scenario("terrain-nav.toml");
    let exported = one(&src, Format::GeoJson);
    validate_geojson(&exported).unwrap();
    let route = interop::geojson::parse_route(&exported).unwrap();
    let original = scene::scene_of(&src).unwrap();
    assert_eq!(route.points.len(), original.routes[0].points.len());
    // Import the exported route into a scenario with a different track, and the track
    // comes back.
    let moved = src.replace("start_lat_deg = 12.05", "start_lat_deg = 40.0");
    assert_ne!(moved, src);
    let merged = interop::geojson::apply_route(&moved, &exported).unwrap();
    let back = scene::scene_of(&merged).unwrap();
    for (a, b) in back.routes[0].points.iter().zip(&original.routes[0].points) {
        assert!((a[0] - b[0]).abs() < 1e-9 && (a[1] - b[1]).abs() < 1e-9);
    }
    // The merged scenario still runs.
    kshana::api::run_toml(&merged).expect("merged scenario runs");
    // A route for a kind with no trajectory input is refused with the reason.
    let e = interop::geojson::apply_route(&scenario("clock-holdover.toml"), &exported).unwrap_err();
    assert!(e.contains("takes no trajectory input"), "{e}");
}

#[test]
fn sigmf_export_is_the_runs_own_recording_and_reads_back() {
    let src = scenario("l-band-waterfall-jamming.toml");
    let files = interop::export(&src, Format::Sigmf).unwrap();
    assert_eq!(files.len(), 2);
    assert_eq!(files[0].suffix, ".sigmf-meta");
    assert_eq!(files[1].suffix, ".sigmf-data");
    let meta = String::from_utf8(files[0].bytes.clone()).unwrap();
    validate_sigmf(&meta, &files[1].bytes).unwrap();
    // The run reports the same recording: same metadata, same byte count.
    let run: Value = serde_json::from_str(&kshana::api::run_toml(&src).unwrap().json).unwrap();
    let meta_v: Value = serde_json::from_str(&meta).unwrap();
    assert_eq!(run["iq"]["sigmf"]["meta"], meta_v);
    assert_eq!(
        run["iq"]["sigmf"]["data_bytes"].as_u64().unwrap() as usize,
        files[1].bytes.len()
    );
    // The import side reads it back, and re-writing gives the same bytes.
    let rec = kshana::sigmf::read(&meta, &files[1].bytes, 1.0).unwrap();
    let (meta2, bytes2, _) = kshana::sigmf::write(&rec, 1.0).unwrap();
    assert_eq!(meta2, meta);
    assert_eq!(bytes2, files[1].bytes);
}

#[test]
fn every_export_is_byte_deterministic() {
    for name in [
        "jamming-demo.toml",
        "ephemeris.toml",
        "terrain-nav.toml",
        "l-band-waterfall-jamming.toml",
    ] {
        let src = scenario(name);
        for (fmt, r) in interop::plan(&src) {
            if r.is_ok() {
                assert_eq!(
                    interop::export(&src, fmt).unwrap(),
                    interop::export(&src, fmt).unwrap(),
                    "{name} {fmt:?}"
                );
            }
        }
    }
}

#[test]
fn validators_reject_what_the_specifications_forbid() {
    // Latitude first in GeoJSON.
    let bad = r#"{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"Point","coordinates":[52.0,190.0]},"properties":{"units":{}}}]}"#;
    assert!(validate_geojson(bad).is_err());
    // A clockwise exterior ring.
    let cw = r#"{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"Polygon","coordinates":[[[0,0],[0,1],[1,1],[1,0],[0,0]]]},"properties":{"units":{}}}]}"#;
    assert!(validate_geojson(cw)
        .unwrap_err()
        .contains("counter-clockwise"));
    // CZML without the document packet first.
    assert!(validate_czml(r#"[{"id":"x"},{"id":"document","version":"1.0"}]"#).is_err());
    // STK with a wrong point count.
    let stk = one(&scenario("ephemeris.toml"), Format::Stk);
    let broken = stk.replacen("NumberOfEphemerisPoints  ", "NumberOfEphemerisPoints  1", 1);
    assert!(validate_stk(&broken)
        .unwrap_err()
        .contains("NumberOfEphemerisPoints"));
    // STK in kilometres.
    assert!(validate_stk(&stk.replace("Meters", "Kilometers")).is_err());
    // KML with an unclosed ring and a gx:Track short of a coordinate.
    let kml = one(&scenario("jamming-demo.toml"), Format::Kml);
    let first_coord = kml.find("<gx:coord>").unwrap();
    let end = kml[first_coord..].find('\n').unwrap() + first_coord + 1;
    let short = format!("{}{}", &kml[..first_coord], &kml[end..]);
    assert!(validate_kml(&short).is_err());
    assert!(validate_kml("<kml xmlns=\"http://www.opengis.net/kml/2.2\"><Document>").is_err());
}

fn scenario_files() -> Vec<(String, String)> {
    let dir = repo().join("scenarios");
    let mut v: Vec<(String, String)> = std::fs::read_dir(&dir)
        .unwrap()
        .map(|e| e.unwrap().path())
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .filter(|p| !p.to_string_lossy().ends_with(".suite.toml"))
        .map(|p| {
            (
                p.file_name().unwrap().to_string_lossy().into_owned(),
                std::fs::read_to_string(&p).unwrap(),
            )
        })
        .collect();
    v.sort();
    v
}

#[test]
fn every_bundled_scenario_exports_each_format_or_says_why_not() {
    let files = scenario_files();
    let mut exported = std::collections::BTreeMap::<Format, usize>::new();
    for (name, src) in &files {
        let sc = scene::scene_of(src);
        for fmt in Format::ALL {
            let r = match (fmt, &sc) {
                (Format::Sigmf, _) => interop::export(src, fmt),
                (_, Ok(s)) => interop::export_scene(s, fmt),
                (_, Err(e)) => Err(e.clone()),
            };
            match r {
                Ok(fs) => {
                    validate(fmt, &fs).unwrap_or_else(|e| panic!("{name} {fmt:?}: {e}"));
                    *exported.entry(fmt).or_default() += 1;
                }
                Err(ExportError::NotApplicable(why)) => {
                    assert!(
                        why.len() > 40,
                        "{name} {fmt:?}: the reason must say why: {why:?}"
                    )
                }
                Err(ExportError::Failed(e)) => panic!("{name} {fmt:?} failed: {e}"),
            }
        }
    }
    // The applicable set is not empty for any format.
    for fmt in Format::ALL {
        assert!(
            exported.get(&fmt).copied().unwrap_or(0) > 0,
            "{fmt:?} exported nowhere"
        );
    }
}

#[test]
fn the_interop_doc_table_is_current() {
    let doc = std::fs::read_to_string(repo().join("docs/INTEROP.md")).expect("docs/INTEROP.md");
    let start = "<!-- interop-table:start -->\n";
    let end = "<!-- interop-table:end -->";
    let a = doc.find(start).expect("table start marker") + start.len();
    let b = doc.find(end).expect("table end marker");
    // A release that withholds the Celeste IOD preset deletes its scenario files; the
    // committed table still lists them (and numbers its footnotes with them), so there the
    // check is that every present scenario keeps its row.
    const WITHHOLDABLE: &[&str] = &[
        "celeste-iod-classical-pilot-signals.toml",
        "celeste-iod-end-to-end.toml",
        "celeste-iod-fused-pvt.toml",
        "leo-navmsg-celeste-iod.toml",
        "leo-pass-celeste-iod-multiband.toml",
    ];
    let files = scenario_files();
    if WITHHOLDABLE
        .iter()
        .any(|w| !files.iter().any(|(n, _)| n == w))
    {
        for (n, _) in &files {
            assert!(
                doc[a..b].contains(&format!("| `{n}` |")),
                "docs/INTEROP.md's table has no row for {n}"
            );
        }
        eprintln!("the Celeste IOD preset is withheld: checked the present rows only");
        return;
    }
    let want = interop::scenario_table_md(&files);
    assert!(
        doc[a..b] == want,
        "docs/INTEROP.md's table is stale; regenerate with `cargo run --bin gen_validation_artifacts`"
    );
}

// ------------------------------------------------------------------------------------
// Command line
// ------------------------------------------------------------------------------------

fn temp_workdir(label: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-{label}-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

fn copy_into(dir: &Path, name: &str) -> PathBuf {
    let p = dir.join(name);
    std::fs::write(&p, scenario(name)).unwrap();
    p
}

#[test]
fn cli_export_writes_every_applicable_format_and_names_the_rest() {
    let dir = temp_workdir("interop-cli");
    let scn = copy_into(&dir, "jamming-demo.toml");
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .args(["--export", "all"])
        .output()
        .unwrap();
    let so = String::from_utf8_lossy(&out.stdout);
    assert!(
        out.status.success(),
        "{so}\n{}",
        String::from_utf8_lossy(&out.stderr)
    );
    for f in [
        "jamming-demo.czml",
        "jamming-demo.kml",
        "jamming-demo.geojson",
        "jamming-demo.G01.e",
        "jamming-demo.G24.e",
    ] {
        assert!(dir.join(f).exists(), "{f} missing:\n{so}");
    }
    assert!(so.contains("skipped sigmf:"), "{so}");
    // An explicitly named format that does not apply fails with its reason.
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .args(["--export", "sigmf"])
        .output()
        .unwrap();
    assert!(!out.status.success());
    assert!(String::from_utf8_lossy(&out.stderr).contains("not applicable"));
    // `list` reports without running.
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .args(["--export", "list"])
        .output()
        .unwrap();
    let so = String::from_utf8_lossy(&out.stdout);
    assert!(
        so.contains("czml: applies") && so.contains("sigmf: does not apply"),
        "{so}"
    );
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn cli_imports_a_route_before_the_run() {
    let dir = temp_workdir("interop-route");
    let scn = copy_into(&dir, "terrain-nav.toml");
    let route = dir.join("route.geojson");
    std::fs::write(&route, r#"{"type":"Feature","properties":{},"geometry":{"type":"LineString","coordinates":[[20.05,12.05],[20.2,12.1]]}}"#).unwrap();
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg(&scn)
        .arg("--import-route")
        .arg(&route)
        .args(["--export", "geojson"])
        .output()
        .unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let gj = std::fs::read_to_string(dir.join("terrain-nav.geojson")).unwrap();
    let back = interop::geojson::parse_route(&gj).unwrap();
    let last = back.points.last().unwrap();
    assert!(
        (last[0] - 12.1).abs() < 1e-9 && (last[1] - 20.2).abs() < 1e-9,
        "{last:?}"
    );
    std::fs::remove_dir_all(&dir).ok();
}
