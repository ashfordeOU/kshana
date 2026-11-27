// SPDX-License-Identifier: AGPL-3.0-only
//! PNT Bill of Materials (PBOM): a machine-readable list of what a system's positioning,
//! navigation and timing depend on, written as a CycloneDX BOM with a property profile
//! (`kshana pbom`, docs/PBOM.md).
//!
//! A software bill of materials lists the code a product contains. A PBOM lists the PNT
//! supply chain a system relies on: the constellations and signals it tracks, its receivers,
//! antennas and their firmware, its oscillators and time references, augmentation and
//! correction feeds, network time distribution, alternative (GNSS-independent) sources and
//! the fallbacks that take over when something is lost. It is written as an ordinary
//! CycloneDX JSON document (`bomFormat`, `specVersion`, `components`, `dependencies`), so
//! existing BOM tooling reads it; the PNT meaning is carried by CycloneDX `properties` in the
//! `kshana:pbom:` namespace (the profile `kshana.pbom/1`, schema `data/pbom/kshana-pbom-1.schema.json`).
//!
//! | property | where | meaning |
//! |---|---|---|
//! | `kshana:pbom:profile` | metadata | always `kshana.pbom/1` |
//! | `kshana:pbom:source` | metadata | how the document was made (optional) |
//! | `kshana:pbom:role` | component | one of [`ROLES`] (required, once) |
//! | `kshana:pbom:provides` | component | a function the element itself supplies, one of [`FUNCTIONS`] (repeatable) |
//! | `kshana:pbom:any-of` | component, metadata | a `dependsOn` reference that is one of several alternatives (repeatable) |
//! | `kshana:pbom:fallback-for` | component | a reference this element takes over from when it is lost (repeatable) |
//! | `kshana:pbom:constellation` | component | GPS, Galileo, GLONASS, BeiDou, QZSS, NavIC, SBAS, GNSS, LEO, eLoran, other |
//! | `kshana:pbom:signal` | component | the signal, for example `L1 C/A`, `E1 OS`, `L5` |
//! | `kshana:pbom:time-scale` | component | the time scale delivered, for example `UTC(PTB)`, `GPST`, `TAI` |
//! | `kshana:pbom:holdover-s` | component | the holdover the element is stated to give, seconds |
//! | `kshana:pbom:authenticated` | component | `true` when the source is cryptographically authenticated (for example OSNMA) |
//! | `kshana:pbom:gnss-independent` | component | `true` when the element works without any GNSS |
//! | `kshana:pbom:endpoint` | component | where a feed or a network time service is reached |
//! | `kshana:pbom:jurisdiction` | component | the country or region whose operator controls the element |
//!
//! `dependsOn` lists everything an element needs. By default every entry is required; the
//! entries also named by `kshana:pbom:any-of` are alternatives, of which one is enough (a
//! receiver that tracks GPS L1 and Galileo E1 needs either). `kshana:pbom:fallback-for`
//! states that an element takes over from another (an oscillator in holdover for a receiver,
//! an eLoran receiver for a GNSS receiver).
//!
//! # What `validate` reports
//!
//! The structural CycloneDX checks the profile needs, the profile rules, and, for a valid
//! document, an analysis of the declared structure per function: whether the system root
//! reaches a provider, the single points of failure (the elements whose loss alone cuts the
//! function), whether the function survives the loss of every GNSS signal and augmentation,
//! whether an authenticated provider is reachable, and the supplier and jurisdiction spread of
//! the receivers. It is an analysis of what the document declares, not of the system: it is
//! labelled MODELLED and says nothing about whether any element performs as stated.

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet};

/// The profile identifier carried in `metadata.properties`.
pub const PROFILE: &str = "kshana.pbom/1";
/// The property namespace of the profile.
pub const NS: &str = "kshana:pbom:";
/// The configuration format `kshana pbom generate` reads.
pub const CONFIG_FORMAT: &str = "kshana.pbom-config/1";
/// The evidence label of the analysis.
pub const LABEL: &str = "MODELLED";
/// The bom-ref of the system root that a generated PBOM uses.
pub const ROOT_REF: &str = "system";
/// The profile's JSON schema (also printed by `kshana pbom schema`).
pub const SCHEMA: &str = include_str!("../data/pbom/kshana-pbom-1.schema.json");

/// The roles an element can have.
pub const ROLES: &[&str] = &[
    "constellation-signal",
    "receiver",
    "antenna",
    "firmware",
    "oscillator",
    "time-reference",
    "augmentation",
    "correction-feed",
    "network-time",
    "alternative-source",
    "fallback",
];

/// The functions an element can provide.
pub const FUNCTIONS: &[&str] = &["position", "velocity", "time", "frequency"];

/// The constellation names the profile knows; another value is a warning, not an error.
pub const CONSTELLATIONS: &[&str] = &[
    "GPS", "Galileo", "GLONASS", "BeiDou", "QZSS", "NavIC", "SBAS", "GNSS", "LEO", "eLoran",
    "other",
];

/// The constellation names treated as GNSS for the "loss of every GNSS" test.
pub const GNSS: &[&str] = &[
    "GPS", "Galileo", "GLONASS", "BeiDou", "QZSS", "NavIC", "SBAS", "GNSS",
];

/// The CycloneDX 1.5 component types.
pub const COMPONENT_TYPES: &[&str] = &[
    "application",
    "framework",
    "library",
    "container",
    "platform",
    "operating-system",
    "device",
    "device-driver",
    "firmware",
    "file",
    "machine-learning-model",
    "data",
];

/// The CycloneDX specification versions accepted.
pub const SPEC_VERSIONS: &[&str] = &["1.4", "1.5", "1.6"];

/// Properties that may appear once per component.
const SINGLE: &[&str] = &[
    "role",
    "constellation",
    "signal",
    "time-scale",
    "holdover-s",
    "authenticated",
    "gnss-independent",
    "endpoint",
    "jurisdiction",
];
/// Properties that may repeat.
const REPEAT: &[&str] = &["provides", "any-of", "fallback-for"];

// ---------------------------------------------------------------------------------------------
// Configuration (the input of `generate`)
// ---------------------------------------------------------------------------------------------

/// A PBOM configuration (`kshana.pbom-config/1`, TOML).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Config {
    /// Always [`CONFIG_FORMAT`].
    pub pbom: String,
    /// The system's name.
    pub system: String,
    /// The system's version.
    #[serde(default)]
    pub system_version: Option<String>,
    /// The CycloneDX type of the system root (default `device`).
    #[serde(default)]
    pub system_type: Option<String>,
    /// Who supplies the system.
    #[serde(default)]
    pub supplier: Option<String>,
    /// The document's timestamp (left out when not given, so the output is reproducible).
    #[serde(default)]
    pub timestamp: Option<String>,
    /// Elements the system needs, all of them.
    #[serde(default)]
    pub depends_on: Vec<String>,
    /// Elements of which the system needs one.
    #[serde(default)]
    pub any_of: Vec<String>,
    /// The elements.
    #[serde(default, rename = "element")]
    pub elements: Vec<Element>,
}

/// One element of a configuration.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Element {
    /// Its reference (the CycloneDX `bom-ref`).
    pub id: String,
    /// One of [`ROLES`].
    pub role: String,
    /// Its name.
    pub name: String,
    /// The CycloneDX component type (default by role).
    #[serde(default, rename = "type")]
    pub kind: Option<String>,
    /// Its version (firmware or model revision).
    #[serde(default)]
    pub version: Option<String>,
    /// Its supplier.
    #[serde(default)]
    pub supplier: Option<String>,
    /// A description.
    #[serde(default)]
    pub description: Option<String>,
    /// Elements it needs, all of them.
    #[serde(default)]
    pub depends_on: Vec<String>,
    /// Elements of which it needs one.
    #[serde(default)]
    pub any_of: Vec<String>,
    /// Elements it takes over from.
    #[serde(default)]
    pub fallback_for: Vec<String>,
    /// Functions it supplies itself.
    #[serde(default)]
    pub provides: Vec<String>,
    /// The constellation.
    #[serde(default)]
    pub constellation: Option<String>,
    /// The signal.
    #[serde(default)]
    pub signal: Option<String>,
    /// The time scale.
    #[serde(default)]
    pub time_scale: Option<String>,
    /// The stated holdover, seconds.
    #[serde(default)]
    pub holdover_s: Option<f64>,
    /// Whether the source is authenticated.
    #[serde(default)]
    pub authenticated: Option<bool>,
    /// Whether the element works without GNSS.
    #[serde(default)]
    pub gnss_independent: Option<bool>,
    /// Where it is reached.
    #[serde(default)]
    pub endpoint: Option<String>,
    /// The operator's country or region.
    #[serde(default)]
    pub jurisdiction: Option<String>,
}

fn default_type(role: &str) -> &'static str {
    match role {
        "firmware" => "firmware",
        "constellation-signal" | "augmentation" | "correction-feed" | "network-time" => "data",
        _ => "device",
    }
}

fn prop(name: &str, value: impl Into<String>) -> Value {
    json!({ "name": format!("{NS}{name}"), "value": value.into() })
}

fn element_properties(e: &Element) -> Vec<Value> {
    let mut p = vec![prop("role", e.role.clone())];
    for f in &e.provides {
        p.push(prop("provides", f.clone()));
    }
    for r in &e.any_of {
        p.push(prop("any-of", r.clone()));
    }
    for r in &e.fallback_for {
        p.push(prop("fallback-for", r.clone()));
    }
    let opt = [
        ("constellation", &e.constellation),
        ("signal", &e.signal),
        ("time-scale", &e.time_scale),
        ("endpoint", &e.endpoint),
        ("jurisdiction", &e.jurisdiction),
    ];
    for (k, v) in opt {
        if let Some(v) = v {
            p.push(prop(k, v.clone()));
        }
    }
    if let Some(h) = e.holdover_s {
        p.push(prop("holdover-s", format!("{h}")));
    }
    if let Some(b) = e.authenticated {
        p.push(prop("authenticated", b.to_string()));
    }
    if let Some(b) = e.gnss_independent {
        p.push(prop("gnss-independent", b.to_string()));
    }
    p
}

fn union(a: &[String], b: &[String]) -> Vec<String> {
    let mut out: Vec<String> = Vec::new();
    for r in a.iter().chain(b) {
        if !out.contains(r) {
            out.push(r.clone());
        }
    }
    out
}

/// A deterministic `urn:uuid:` serial number from the document's content (UUID version 8,
/// the content hash, so the same input gives the same document).
fn serial_from(content: &Value) -> String {
    let h = Sha256::digest(content.to_string().as_bytes());
    let mut b = [0u8; 16];
    b.copy_from_slice(&h[..16]);
    b[6] = (b[6] & 0x0f) | 0x80;
    b[8] = (b[8] & 0x3f) | 0x80;
    let x = hex::encode(b);
    format!(
        "urn:uuid:{}-{}-{}-{}-{}",
        &x[0..8],
        &x[8..12],
        &x[12..16],
        &x[16..20],
        &x[20..32]
    )
}

/// Build the CycloneDX PBOM of a configuration. The result is then checked with
/// [`validate`] by the CLI; this function only writes what the configuration says.
pub fn generate(cfg: &Config, source_note: Option<&str>) -> Result<Value, String> {
    if cfg.pbom != CONFIG_FORMAT {
        return Err(crate::terr!(
            "e-pbom-config-format",
            got = cfg.pbom.clone(),
            want = CONFIG_FORMAT
        ));
    }
    let mut root = json!({
        "type": cfg.system_type.clone().unwrap_or_else(|| "device".into()),
        "bom-ref": ROOT_REF,
        "name": cfg.system.clone(),
    });
    if let Some(v) = &cfg.system_version {
        root["version"] = json!(v);
    }
    if let Some(s) = &cfg.supplier {
        root["supplier"] = json!({ "name": s });
    }
    if !cfg.any_of.is_empty() {
        root["properties"] = Value::Array(
            cfg.any_of
                .iter()
                .map(|r| prop("any-of", r.clone()))
                .collect(),
        );
    }
    let mut meta_props = vec![prop("profile", PROFILE)];
    if let Some(n) = source_note {
        meta_props.push(prop("source", n));
    }
    let mut metadata = json!({ "component": root, "properties": meta_props });
    if let Some(t) = &cfg.timestamp {
        metadata["timestamp"] = json!(t);
    }
    let mut components = Vec::new();
    let mut deps = vec![json!({
        "ref": ROOT_REF,
        "dependsOn": union(&cfg.depends_on, &cfg.any_of),
    })];
    for e in &cfg.elements {
        let mut c = json!({
            "type": e.kind.clone().unwrap_or_else(|| default_type(&e.role).into()),
            "bom-ref": e.id.clone(),
            "name": e.name.clone(),
        });
        if let Some(v) = &e.version {
            c["version"] = json!(v);
        }
        if let Some(s) = &e.supplier {
            c["supplier"] = json!({ "name": s });
        }
        if let Some(d) = &e.description {
            c["description"] = json!(d);
        }
        c["properties"] = Value::Array(element_properties(e));
        components.push(c);
        deps.push(json!({ "ref": e.id.clone(), "dependsOn": union(&e.depends_on, &e.any_of) }));
    }
    let body = json!({ "metadata": metadata, "components": components, "dependencies": deps });
    let serial = serial_from(&body);
    Ok(json!({
        "bomFormat": "CycloneDX",
        "specVersion": "1.5",
        "serialNumber": serial,
        "version": 1,
        "metadata": body["metadata"],
        "components": body["components"],
        "dependencies": body["dependencies"],
    }))
}

/// A draft configuration from a kshana scenario file: the scenario's top-level `gnss`,
/// `clock*`, `holdover`, `imu*`, `accel*` and `ins*` tables are mapped to elements; every
/// other table is named in the note as not mapped. A scenario does not say which
/// constellations, receivers or suppliers a real system uses, so the draft says
/// `constellation = "GNSS"` and is meant to be completed by hand.
pub fn config_from_scenario(name: &str, scenario: &toml::Value) -> (Config, String) {
    let kind = scenario
        .get("kind")
        .and_then(|k| k.as_str())
        .unwrap_or("unspecified");
    let mut cfg = Config {
        pbom: CONFIG_FORMAT.into(),
        system: format!("{name} ({kind})"),
        system_version: None,
        system_type: None,
        supplier: None,
        timestamp: None,
        depends_on: Vec::new(),
        any_of: Vec::new(),
        elements: Vec::new(),
    };
    let mut mapped = Vec::new();
    let mut unmapped = Vec::new();
    let Some(table) = scenario.as_table() else {
        return (cfg, String::new());
    };
    let has_gnss = table.get("gnss").is_some_and(|v| v.is_table());
    let label = |v: &toml::Value, key: &str| {
        v.get("id")
            .and_then(|s| s.as_str())
            .map(|s| s.to_string())
            .unwrap_or_else(|| key.to_string())
    };
    let mut fallbacks = Vec::new();
    for (key, v) in table {
        if !v.is_table() {
            continue;
        }
        let k = key.as_str();
        if k == "gnss" {
            cfg.elements.push(Element {
                id: "gnss-signals".into(),
                role: "constellation-signal".into(),
                name: "GNSS signals (from the scenario's [gnss] table)".into(),
                provides: vec!["position".into(), "velocity".into(), "time".into()],
                constellation: Some("GNSS".into()),
                signal: Some("unspecified".into()),
                gnss_independent: Some(false),
                ..Element::default()
            });
            cfg.elements.push(Element {
                id: "gnss-receiver".into(),
                role: "receiver".into(),
                name: "GNSS receiver".into(),
                any_of: vec!["gnss-signals".into()],
                ..Element::default()
            });
            mapped.push(k.to_string());
        } else if k.starts_with("clock") || k == "holdover" {
            let holdover = v.get("holdover_s").and_then(|h| h.as_float());
            fallbacks.push(Element {
                id: k.replace('_', "-"),
                role: "oscillator".into(),
                name: label(v, k),
                provides: vec!["time".into(), "frequency".into()],
                holdover_s: holdover,
                gnss_independent: Some(true),
                ..Element::default()
            });
            mapped.push(k.to_string());
        } else if k.starts_with("imu") || k.starts_with("accel") || k.starts_with("ins") {
            fallbacks.push(Element {
                id: k.replace('_', "-"),
                role: "alternative-source".into(),
                name: label(v, k),
                provides: vec!["position".into(), "velocity".into()],
                gnss_independent: Some(true),
                ..Element::default()
            });
            mapped.push(k.to_string());
        } else {
            unmapped.push(k.to_string());
        }
    }
    if has_gnss {
        cfg.depends_on.push("gnss-receiver".into());
        for f in &mut fallbacks {
            f.fallback_for.push("gnss-receiver".into());
        }
    } else {
        cfg.any_of = fallbacks.iter().map(|f| f.id.clone()).collect();
    }
    cfg.elements.extend(fallbacks);
    let note = format!(
        "draft generated by kshana pbom generate from scenario {name}; tables mapped: [{}]; tables not mapped: [{}]",
        mapped.join(", "),
        unmapped.join(", ")
    );
    (cfg, note)
}

// ---------------------------------------------------------------------------------------------
// Reading a PBOM
// ---------------------------------------------------------------------------------------------

/// One problem found in a PBOM.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Problem {
    /// A JSON pointer-like path to the offending item.
    pub path: String,
    /// What is wrong.
    pub problem: String,
}

/// One element as read from a PBOM.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Node {
    /// The bom-ref.
    #[serde(rename = "ref")]
    pub reference: String,
    /// The CycloneDX type.
    #[serde(rename = "type")]
    pub kind: String,
    /// The name.
    pub name: String,
    /// The version.
    pub version: Option<String>,
    /// The supplier's name.
    pub supplier: Option<String>,
    /// The role (empty for the system root).
    pub role: String,
    /// Every dependsOn reference.
    pub depends_on: Vec<String>,
    /// The references that are alternatives.
    pub any_of: Vec<String>,
    /// The references it takes over from.
    pub fallback_for: Vec<String>,
    /// The functions it provides.
    pub provides: Vec<String>,
    /// The single-valued profile properties, by name without the namespace.
    pub attrs: BTreeMap<String, String>,
    /// Every property (profile or not) as `name=value`, sorted, for the diff.
    pub all_properties: Vec<String>,
}

/// A PBOM read into nodes: the root first, then the components in document order.
#[derive(Clone, Debug, Default)]
pub struct Model {
    /// The system root (`metadata.component`).
    pub root: Node,
    /// The components.
    pub nodes: Vec<Node>,
}

impl Model {
    fn all(&self) -> impl Iterator<Item = &Node> {
        std::iter::once(&self.root).chain(self.nodes.iter())
    }
    fn get(&self, r: &str) -> Option<&Node> {
        self.all().find(|n| n.reference == r)
    }
}

fn read_node(
    v: &Value,
    path: &str,
    is_root: bool,
    errors: &mut Vec<Problem>,
    warnings: &mut Vec<Problem>,
) -> Node {
    let mut err = |p: String, m: String| {
        errors.push(Problem {
            path: p,
            problem: m,
        })
    };
    let s = |k: &str| v.get(k).and_then(|x| x.as_str()).map(str::to_string);
    let mut n = Node {
        reference: s("bom-ref").unwrap_or_default(),
        kind: s("type").unwrap_or_default(),
        name: s("name").unwrap_or_default(),
        version: s("version"),
        supplier: v
            .get("supplier")
            .and_then(|x| x.get("name"))
            .and_then(|x| x.as_str())
            .map(str::to_string),
        ..Node::default()
    };
    if !v.is_object() {
        err(path.into(), "must be an object".into());
        return n;
    }
    if n.reference.is_empty() {
        err(format!("{path}/bom-ref"), "missing or empty".into());
    }
    if n.name.is_empty() {
        err(format!("{path}/name"), "missing or empty".into());
    }
    if !COMPONENT_TYPES.contains(&n.kind.as_str()) {
        err(
            format!("{path}/type"),
            format!("{:?} is not a CycloneDX component type", n.kind),
        );
    }
    let props = v.get("properties").and_then(|p| p.as_array());
    if v.get("properties").is_some() && props.is_none() {
        err(format!("{path}/properties"), "must be an array".into());
    }
    let mut seen: BTreeSet<String> = BTreeSet::new();
    for (i, p) in props.into_iter().flatten().enumerate() {
        let pp = format!("{path}/properties/{i}");
        let (Some(name), Some(value)) = (
            p.get("name").and_then(|x| x.as_str()),
            p.get("value").and_then(|x| x.as_str()),
        ) else {
            err(
                pp,
                "a property needs a string name and a string value".into(),
            );
            continue;
        };
        n.all_properties.push(format!("{name}={value}"));
        let Some(short) = name.strip_prefix(NS) else {
            continue;
        };
        let allowed_here = if is_root {
            short == "any-of"
        } else {
            SINGLE.contains(&short) || REPEAT.contains(&short)
        };
        if !allowed_here {
            err(
                pp,
                format!("{name} is not a property of the {PROFILE} profile here"),
            );
            continue;
        }
        if SINGLE.contains(&short) && !seen.insert(short.to_string()) {
            err(pp, format!("{name} appears more than once"));
            continue;
        }
        match short {
            "provides" => {
                if !FUNCTIONS.contains(&value) {
                    err(
                        pp,
                        format!("provides {value:?} is not one of {}", FUNCTIONS.join(", ")),
                    );
                } else if !n.provides.iter().any(|f| f == value) {
                    n.provides.push(value.to_string());
                }
            }
            "any-of" => n.any_of.push(value.to_string()),
            "fallback-for" => n.fallback_for.push(value.to_string()),
            "role" => {
                if !ROLES.contains(&value) {
                    err(
                        pp,
                        format!("role {value:?} is not one of {}", ROLES.join(", ")),
                    );
                }
                n.role = value.to_string();
            }
            "holdover-s" => {
                if !value
                    .parse::<f64>()
                    .is_ok_and(|h| h.is_finite() && h >= 0.0)
                {
                    err(
                        pp,
                        format!("holdover-s {value:?} is not a number of seconds at or above 0"),
                    );
                }
                n.attrs.insert(short.into(), value.into());
            }
            "authenticated" | "gnss-independent" => {
                if value != "true" && value != "false" {
                    err(pp, format!("{short} must be true or false, not {value:?}"));
                }
                n.attrs.insert(short.into(), value.into());
            }
            "constellation" => {
                if !CONSTELLATIONS.contains(&value) {
                    warnings.push(Problem {
                        path: pp,
                        problem: format!(
                            "constellation {value:?} is not one the profile knows ({})",
                            CONSTELLATIONS.join(", ")
                        ),
                    });
                }
                n.attrs.insert(short.into(), value.into());
            }
            _ => {
                n.attrs.insert(short.into(), value.into());
            }
        }
    }
    n.all_properties.sort();
    if !is_root && n.role.is_empty() && !seen.contains("role") {
        err(
            format!("{path}/properties"),
            format!("needs a {NS}role property"),
        );
    }
    n
}

fn role_rules(n: &Node, path: &str, errors: &mut Vec<Problem>, warnings: &mut Vec<Problem>) {
    let has = |k: &str| n.attrs.contains_key(k);
    let mut err = |m: &str| {
        errors.push(Problem {
            path: path.into(),
            problem: m.into(),
        })
    };
    match n.role.as_str() {
        "constellation-signal" => {
            if !has("constellation") || !has("signal") {
                err("a constellation-signal needs constellation and signal");
            }
            if n.provides.is_empty() {
                err("a constellation-signal needs at least one provides");
            }
        }
        "time-reference" => {
            if !has("time-scale") {
                err("a time-reference needs time-scale");
            }
            if !n.provides.iter().any(|f| f == "time" || f == "frequency") {
                err("a time-reference must provide time or frequency");
            }
        }
        "fallback" => {
            if n.fallback_for.is_empty() {
                err("a fallback needs at least one fallback-for");
            }
        }
        "alternative-source" => {
            if !has("gnss-independent") {
                warnings.push(Problem {
                    path: path.into(),
                    problem: "an alternative-source should state gnss-independent".into(),
                });
            }
        }
        "augmentation" | "correction-feed" => {
            if !has("constellation") {
                warnings.push(Problem {
                    path: path.into(),
                    problem: "should state the constellation it augments or corrects".into(),
                });
            }
        }
        _ => {}
    }
}

/// Read a PBOM document: structural CycloneDX checks, profile rules, references and cycles.
/// Returns the model (usable when `errors` is empty), the errors and the warnings.
pub fn read(doc: &Value) -> (Model, Vec<Problem>, Vec<Problem>) {
    let mut errors = Vec::new();
    let mut warnings = Vec::new();
    let mut e = |p: &str, m: String| {
        errors.push(Problem {
            path: p.into(),
            problem: m,
        })
    };
    if doc.get("bomFormat").and_then(|v| v.as_str()) != Some("CycloneDX") {
        e("/bomFormat", "must be \"CycloneDX\"".into());
    }
    match doc.get("specVersion").and_then(|v| v.as_str()) {
        Some(v) if SPEC_VERSIONS.contains(&v) => {}
        other => e(
            "/specVersion",
            format!("{other:?} is not one of {}", SPEC_VERSIONS.join(", ")),
        ),
    }
    if doc
        .get("version")
        .and_then(|v| v.as_u64())
        .is_none_or(|v| v < 1)
    {
        e("/version", "must be an integer of at least 1".into());
    }
    if let Some(sn) = doc.get("serialNumber") {
        let ok = sn.as_str().is_some_and(|s| {
            let u = s.strip_prefix("urn:uuid:").unwrap_or("");
            u.len() == 36
                && u.char_indices().all(|(i, c)| {
                    if [8, 13, 18, 23].contains(&i) {
                        c == '-'
                    } else {
                        c.is_ascii_hexdigit()
                    }
                })
        });
        if !ok {
            e("/serialNumber", "must be urn:uuid:<RFC 4122 UUID>".into());
        }
    }
    let meta_profile = doc
        .pointer("/metadata/properties")
        .and_then(|p| p.as_array())
        .into_iter()
        .flatten()
        .any(|p| {
            p.get("name").and_then(|x| x.as_str()) == Some("kshana:pbom:profile")
                && p.get("value").and_then(|x| x.as_str()) == Some(PROFILE)
        });
    if !meta_profile {
        e(
            "/metadata/properties",
            format!("needs {{\"name\": \"kshana:pbom:profile\", \"value\": \"{PROFILE}\"}}"),
        );
    }
    let mut model = Model::default();
    match doc.pointer("/metadata/component") {
        Some(c) => {
            model.root = read_node(c, "/metadata/component", true, &mut errors, &mut warnings)
        }
        None => errors.push(Problem {
            path: "/metadata/component".into(),
            problem: "the system root is missing".into(),
        }),
    }
    match doc.get("components").and_then(|c| c.as_array()) {
        Some(list) => {
            for (i, c) in list.iter().enumerate() {
                let path = format!("/components/{i}");
                let n = read_node(c, &path, false, &mut errors, &mut warnings);
                role_rules(&n, &path, &mut errors, &mut warnings);
                model.nodes.push(n);
            }
        }
        None => errors.push(Problem {
            path: "/components".into(),
            problem: "must be an array".into(),
        }),
    }
    // unique references
    let mut refs: BTreeSet<String> = BTreeSet::new();
    for (i, n) in model.all().enumerate() {
        if !n.reference.is_empty() && !refs.insert(n.reference.clone()) {
            let path = if i == 0 {
                "/metadata/component/bom-ref".to_string()
            } else {
                format!("/components/{}/bom-ref", i - 1)
            };
            errors.push(Problem {
                path,
                problem: format!("bom-ref {:?} is used more than once", n.reference),
            });
        }
    }
    // dependencies
    let mut seen_dep: BTreeSet<String> = BTreeSet::new();
    let mut dep_map: BTreeMap<String, Vec<String>> = BTreeMap::new();
    if let Some(d) = doc.get("dependencies") {
        match d.as_array() {
            None => errors.push(Problem {
                path: "/dependencies".into(),
                problem: "must be an array".into(),
            }),
            Some(list) => {
                for (i, dep) in list.iter().enumerate() {
                    let path = format!("/dependencies/{i}");
                    let Some(r) = dep.get("ref").and_then(|x| x.as_str()) else {
                        errors.push(Problem {
                            path,
                            problem: "needs a string ref".into(),
                        });
                        continue;
                    };
                    if !refs.contains(r) {
                        errors.push(Problem {
                            path: format!("{path}/ref"),
                            problem: format!("{r:?} names no component"),
                        });
                    }
                    if !seen_dep.insert(r.to_string()) {
                        errors.push(Problem {
                            path: format!("{path}/ref"),
                            problem: format!("{r:?} has more than one dependencies entry"),
                        });
                    }
                    let mut on = Vec::new();
                    for (j, t) in dep
                        .get("dependsOn")
                        .and_then(|x| x.as_array())
                        .into_iter()
                        .flatten()
                        .enumerate()
                    {
                        match t.as_str() {
                            Some(t) if refs.contains(t) => on.push(t.to_string()),
                            Some(t) => errors.push(Problem {
                                path: format!("{path}/dependsOn/{j}"),
                                problem: format!("{t:?} names no component"),
                            }),
                            None => errors.push(Problem {
                                path: format!("{path}/dependsOn/{j}"),
                                problem: "must be a string".into(),
                            }),
                        }
                    }
                    dep_map.insert(r.to_string(), on);
                }
            }
        }
    }
    let attach = |n: &mut Node| {
        if let Some(on) = dep_map.get(&n.reference) {
            n.depends_on = on.clone();
        }
    };
    attach(&mut model.root);
    for n in &mut model.nodes {
        attach(n);
    }
    // any-of must be in dependsOn; fallback-for must exist
    for (i, n) in model.all().enumerate() {
        let path = if i == 0 {
            "/metadata/component".to_string()
        } else {
            format!("/components/{}", i - 1)
        };
        for a in &n.any_of {
            if !n.depends_on.contains(a) {
                errors.push(Problem {
                    path: path.clone(),
                    problem: format!("any-of {a:?} is not in this element's dependsOn"),
                });
            }
        }
        for f in &n.fallback_for {
            if !refs.contains(f) {
                errors.push(Problem {
                    path: path.clone(),
                    problem: format!("fallback-for {f:?} names no component"),
                });
            } else if *f == n.reference {
                errors.push(Problem {
                    path: path.clone(),
                    problem: "an element cannot be its own fallback".into(),
                });
            }
        }
    }
    if errors.is_empty() {
        if let Some(cycle) = find_cycle(&model) {
            errors.push(Problem {
                path: "/dependencies".into(),
                problem: format!(
                    "the dependency and fallback graph has a cycle: {}",
                    cycle.join(" -> ")
                ),
            });
        }
    }
    if errors.is_empty() {
        let reach = reachable(&model);
        for (i, n) in model.nodes.iter().enumerate() {
            if !reach.contains(&n.reference) {
                warnings.push(Problem {
                    path: format!("/components/{i}"),
                    problem: format!(
                        "{:?} is not reached from the system root through dependsOn or a fallback",
                        n.reference
                    ),
                });
            }
        }
    }
    (model, errors, warnings)
}

/// The edges the analysis follows: dependsOn, and from an element to its fallbacks.
fn edges(model: &Model) -> BTreeMap<String, Vec<String>> {
    let mut out: BTreeMap<String, Vec<String>> = BTreeMap::new();
    for n in model.all() {
        out.entry(n.reference.clone())
            .or_default()
            .extend(n.depends_on.iter().cloned());
    }
    for n in model.all() {
        for f in &n.fallback_for {
            out.entry(f.clone()).or_default().push(n.reference.clone());
        }
    }
    out
}

fn find_cycle(model: &Model) -> Option<Vec<String>> {
    let g = edges(model);
    // 0 = new, 1 = on the stack, 2 = done
    let mut state: BTreeMap<&str, u8> = BTreeMap::new();
    fn visit<'a>(
        v: &'a str,
        g: &'a BTreeMap<String, Vec<String>>,
        state: &mut BTreeMap<&'a str, u8>,
        stack: &mut Vec<&'a str>,
    ) -> Option<Vec<String>> {
        state.insert(v, 1);
        stack.push(v);
        for w in g.get(v).into_iter().flatten() {
            match state.get(w.as_str()).copied().unwrap_or(0) {
                1 => {
                    let start = stack.iter().position(|s| *s == w).unwrap_or(0);
                    let mut c: Vec<String> = stack[start..].iter().map(|s| s.to_string()).collect();
                    c.push(w.clone());
                    return Some(c);
                }
                0 => {
                    if let Some(c) = visit(w, g, state, stack) {
                        return Some(c);
                    }
                }
                _ => {}
            }
        }
        stack.pop();
        state.insert(v, 2);
        None
    }
    for k in g.keys() {
        if state.get(k.as_str()).copied().unwrap_or(0) == 0 {
            let mut stack = Vec::new();
            if let Some(c) = visit(k, &g, &mut state, &mut stack) {
                return Some(c);
            }
        }
    }
    None
}

fn reachable(model: &Model) -> BTreeSet<String> {
    let g = edges(model);
    let mut seen = BTreeSet::new();
    let mut todo = vec![model.root.reference.clone()];
    while let Some(v) = todo.pop() {
        if seen.insert(v.clone()) {
            todo.extend(g.get(&v).into_iter().flatten().cloned());
        }
    }
    seen
}

// ---------------------------------------------------------------------------------------------
// Analysis
// ---------------------------------------------------------------------------------------------

struct Eval<'a> {
    model: &'a Model,
    fallbacks: BTreeMap<&'a str, Vec<&'a str>>,
    removed: BTreeSet<&'a str>,
    ok_memo: std::cell::RefCell<BTreeMap<String, bool>>,
    delivers_memo: std::cell::RefCell<BTreeMap<String, Option<BTreeSet<String>>>>,
}

impl<'a> Eval<'a> {
    fn new(model: &'a Model) -> Self {
        let mut fallbacks: BTreeMap<&str, Vec<&str>> = BTreeMap::new();
        for n in model.all() {
            for f in &n.fallback_for {
                fallbacks
                    .entry(f.as_str())
                    .or_default()
                    .push(n.reference.as_str());
            }
        }
        Eval {
            model,
            fallbacks,
            removed: BTreeSet::new(),
            ok_memo: Default::default(),
            delivers_memo: Default::default(),
        }
    }

    /// Remove a set of elements (and forget what was worked out before).
    fn set_removed(&mut self, removed: BTreeSet<&'a str>) {
        self.removed = removed;
        self.ok_memo.borrow_mut().clear();
        self.delivers_memo.borrow_mut().clear();
    }

    fn own_ok(&self, r: &str) -> bool {
        if self.removed.contains(r) {
            return false;
        }
        let Some(n) = self.model.get(r) else {
            return false;
        };
        let mut required = n.depends_on.iter().filter(|d| !n.any_of.contains(d));
        required.all(|d| self.ok(d)) && (n.any_of.is_empty() || n.any_of.iter().any(|d| self.ok(d)))
    }

    fn ok(&self, r: &str) -> bool {
        if let Some(v) = self.ok_memo.borrow().get(r) {
            return *v;
        }
        let v = self.own_ok(r)
            || self
                .fallbacks
                .get(r)
                .into_iter()
                .flatten()
                .any(|f| self.ok(f));
        self.ok_memo.borrow_mut().insert(r.to_string(), v);
        v
    }

    /// The providers of `function` that `r` delivers through (`None`: not delivered).
    /// One evaluator serves one function: the memo is keyed by element only.
    fn delivers(&self, r: &str, function: &str) -> Option<BTreeSet<String>> {
        if let Some(v) = self.delivers_memo.borrow().get(r) {
            return v.clone();
        }
        let mut out = BTreeSet::new();
        let mut any = false;
        if self.own_ok(r) {
            if let Some(n) = self.model.get(r) {
                if n.provides.iter().any(|f| f == function) {
                    out.insert(n.reference.clone());
                    any = true;
                }
                for d in &n.depends_on {
                    if let Some(p) = self.delivers(d, function) {
                        out.extend(p);
                        any = true;
                    }
                }
            }
        }
        for f in self.fallbacks.get(r).into_iter().flatten() {
            if let Some(p) = self.delivers(f, function) {
                out.extend(p);
                any = true;
            }
        }
        let v = any.then_some(out);
        self.delivers_memo
            .borrow_mut()
            .insert(r.to_string(), v.clone());
        v
    }
}

/// A provider left after the loss of every GNSS signal.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Remaining {
    /// The provider's bom-ref.
    #[serde(rename = "ref")]
    pub reference: String,
    /// Its stated holdover, seconds, if any.
    pub holdover_s: Option<f64>,
}

/// The analysis of one function.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FunctionReport {
    /// The function.
    pub function: String,
    /// Whether the system root reaches a working provider.
    pub delivered: bool,
    /// The providers it reaches.
    pub providers: Vec<String>,
    /// Elements whose loss alone cuts the function.
    pub single_points_of_failure: Vec<String>,
    /// Whether the function is still delivered with every GNSS signal and augmentation lost.
    pub survives_gnss_loss: bool,
    /// The providers left after that loss, with their stated holdover.
    pub providers_without_gnss: Vec<Remaining>,
    /// Whether an authenticated provider is reached.
    pub authenticated_provider: bool,
}

/// The analysis of a valid PBOM.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Analysis {
    /// Elements per role.
    pub roles: BTreeMap<String, usize>,
    /// Constellations named by constellation-signal elements.
    pub constellations: Vec<String>,
    /// Per function that some element provides.
    pub functions: Vec<FunctionReport>,
    /// Distinct receiver suppliers.
    pub receiver_suppliers: Vec<String>,
    /// Receivers with no supplier stated.
    pub receivers_without_supplier: usize,
    /// Distinct jurisdictions stated.
    pub jurisdictions: Vec<String>,
}

fn is_gnss_dependent_source(n: &Node) -> bool {
    matches!(n.role.as_str(), "constellation-signal" | "augmentation")
        && n.attrs
            .get("constellation")
            .is_some_and(|c| GNSS.contains(&c.as_str()))
}

/// Analyse a model read without errors.
pub fn analyse(model: &Model) -> Analysis {
    let mut roles: BTreeMap<String, usize> = BTreeMap::new();
    let mut constellations = BTreeSet::new();
    let mut suppliers = BTreeSet::new();
    let mut no_supplier = 0;
    let mut jurisdictions = BTreeSet::new();
    let mut functions_present = BTreeSet::new();
    for n in &model.nodes {
        *roles.entry(n.role.clone()).or_default() += 1;
        if n.role == "constellation-signal" {
            if let Some(c) = n.attrs.get("constellation") {
                constellations.insert(c.clone());
            }
        }
        if n.role == "receiver" {
            match &n.supplier {
                Some(s) => {
                    suppliers.insert(s.clone());
                }
                None => no_supplier += 1,
            }
        }
        if let Some(j) = n.attrs.get("jurisdiction") {
            jurisdictions.insert(j.clone());
        }
        for f in &n.provides {
            functions_present.insert(f.clone());
        }
    }
    let root = model.root.reference.as_str();
    let mut functions = Vec::new();
    for f in FUNCTIONS.iter().filter(|f| functions_present.contains(**f)) {
        let mut ev = Eval::new(model);
        let base = ev.delivers(root, f);
        let delivered = base.is_some();
        let providers = base.unwrap_or_default();
        let mut spof = Vec::new();
        if delivered {
            for n in &model.nodes {
                ev.set_removed(BTreeSet::from([n.reference.as_str()]));
                if ev.delivers(root, f).is_none() {
                    spof.push(n.reference.clone());
                }
            }
        }
        ev.set_removed(
            model
                .nodes
                .iter()
                .filter(|n| is_gnss_dependent_source(n))
                .map(|n| n.reference.as_str())
                .collect(),
        );
        let after = ev.delivers(root, f);
        let survives = after.is_some();
        let left = after.unwrap_or_default();
        let without: Vec<Remaining> = left
            .iter()
            .map(|r| Remaining {
                reference: r.clone(),
                holdover_s: model
                    .get(r)
                    .and_then(|n| n.attrs.get("holdover-s"))
                    .and_then(|h| h.parse::<f64>().ok()),
            })
            .collect();
        let authenticated = providers.iter().any(|r| {
            model
                .get(r)
                .and_then(|n| n.attrs.get("authenticated"))
                .is_some_and(|a| a == "true")
        });
        functions.push(FunctionReport {
            function: f.to_string(),
            delivered,
            providers: providers.into_iter().collect(),
            single_points_of_failure: spof,
            survives_gnss_loss: survives,
            providers_without_gnss: without,
            authenticated_provider: authenticated,
        });
    }
    Analysis {
        roles,
        constellations: constellations.into_iter().collect(),
        functions,
        receiver_suppliers: suppliers.into_iter().collect(),
        receivers_without_supplier: no_supplier,
        jurisdictions: jurisdictions.into_iter().collect(),
    }
}

/// The report `kshana pbom validate` prints.
#[derive(Clone, Debug, Serialize)]
pub struct ValidateReport {
    /// Always [`PROFILE`].
    pub profile: &'static str,
    /// Always [`LABEL`] (the analysis is of the declared structure).
    pub label: &'static str,
    /// No errors.
    pub valid: bool,
    /// The errors.
    pub errors: Vec<Problem>,
    /// The warnings.
    pub warnings: Vec<Problem>,
    /// The analysis, for a valid document.
    pub analysis: Option<Analysis>,
}

/// Validate a PBOM document.
pub fn validate(doc: &Value) -> ValidateReport {
    let (model, errors, warnings) = read(doc);
    let analysis = errors.is_empty().then(|| analyse(&model));
    ValidateReport {
        profile: PROFILE,
        label: LABEL,
        valid: errors.is_empty(),
        errors,
        warnings,
        analysis,
    }
}

// ---------------------------------------------------------------------------------------------
// Diff
// ---------------------------------------------------------------------------------------------

/// One element added or removed.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Entry {
    /// The bom-ref.
    #[serde(rename = "ref")]
    pub reference: String,
    /// The role.
    pub role: String,
    /// The name.
    pub name: String,
}

/// One field that changed.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FieldChange {
    /// The field.
    pub field: String,
    /// Before.
    pub before: Value,
    /// After.
    pub after: Value,
}

/// One element that changed.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Changed {
    /// The bom-ref.
    #[serde(rename = "ref")]
    pub reference: String,
    /// The changes.
    pub changes: Vec<FieldChange>,
}

/// A change in a function's analysis.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FunctionChange {
    /// The function.
    pub function: String,
    /// Delivered before and after.
    pub delivered: (bool, bool),
    /// Survives GNSS loss before and after.
    pub survives_gnss_loss: (bool, bool),
    /// Single points of failure that appeared.
    pub new_single_points_of_failure: Vec<String>,
    /// Single points of failure that went away.
    pub resolved_single_points_of_failure: Vec<String>,
}

/// The report `kshana pbom diff` prints.
#[derive(Clone, Debug, Serialize)]
pub struct DiffReport {
    /// Always [`LABEL`].
    pub label: &'static str,
    /// Elements only in the new document.
    pub added: Vec<Entry>,
    /// Elements only in the old document.
    pub removed: Vec<Entry>,
    /// Elements in both that differ.
    pub changed: Vec<Changed>,
    /// Functions whose analysis changed.
    pub functions: Vec<FunctionChange>,
}

fn entry(n: &Node) -> Entry {
    Entry {
        reference: n.reference.clone(),
        role: n.role.clone(),
        name: n.name.clone(),
    }
}

fn node_changes(a: &Node, b: &Node) -> Vec<FieldChange> {
    let mut out = Vec::new();
    let mut cmp = |field: &str, x: Value, y: Value| {
        if x != y {
            out.push(FieldChange {
                field: field.into(),
                before: x,
                after: y,
            });
        }
    };
    cmp("type", json!(a.kind), json!(b.kind));
    cmp("name", json!(a.name), json!(b.name));
    cmp("version", json!(a.version), json!(b.version));
    cmp("supplier", json!(a.supplier), json!(b.supplier));
    let mut da = a.depends_on.clone();
    let mut db = b.depends_on.clone();
    da.sort();
    db.sort();
    cmp("dependsOn", json!(da), json!(db));
    cmp(
        "properties",
        json!(a.all_properties),
        json!(b.all_properties),
    );
    out
}

/// Compare two PBOMs. Both must read without errors.
pub fn diff(old: &Value, new: &Value) -> Result<DiffReport, String> {
    let (ma, ea, _) = read(old);
    let (mb, eb, _) = read(new);
    for (which, e) in [("old", &ea), ("new", &eb)] {
        if let Some(p) = e.first() {
            return Err(crate::terr!(
                "e-pbom-diff-invalid",
                which = which,
                n = e.len(),
                first = format!("{} {}", p.path, p.problem)
            ));
        }
    }
    let ra: BTreeMap<&str, &Node> = ma.all().map(|n| (n.reference.as_str(), n)).collect();
    let rb: BTreeMap<&str, &Node> = mb.all().map(|n| (n.reference.as_str(), n)).collect();
    let added = mb
        .all()
        .filter(|n| !ra.contains_key(n.reference.as_str()))
        .map(entry)
        .collect();
    let removed = ma
        .all()
        .filter(|n| !rb.contains_key(n.reference.as_str()))
        .map(entry)
        .collect();
    let mut changed = Vec::new();
    for n in ma.all() {
        if let Some(m) = rb.get(n.reference.as_str()) {
            let c = node_changes(n, m);
            if !c.is_empty() {
                changed.push(Changed {
                    reference: n.reference.clone(),
                    changes: c,
                });
            }
        }
    }
    let fa = analyse(&ma).functions;
    let fb = analyse(&mb).functions;
    let mut names: BTreeSet<String> = fa.iter().map(|f| f.function.clone()).collect();
    names.extend(fb.iter().map(|f| f.function.clone()));
    let mut functions = Vec::new();
    for name in FUNCTIONS.iter().filter(|f| names.contains(**f)) {
        let get = |v: &[FunctionReport]| v.iter().find(|f| f.function == *name).cloned();
        let (a, b) = (get(&fa), get(&fb));
        let spof = |r: &Option<FunctionReport>| -> BTreeSet<String> {
            r.as_ref()
                .map(|r| r.single_points_of_failure.iter().cloned().collect())
                .unwrap_or_default()
        };
        let (sa, sb) = (spof(&a), spof(&b));
        let fc = FunctionChange {
            function: name.to_string(),
            delivered: (
                a.as_ref().is_some_and(|r| r.delivered),
                b.as_ref().is_some_and(|r| r.delivered),
            ),
            survives_gnss_loss: (
                a.as_ref().is_some_and(|r| r.survives_gnss_loss),
                b.as_ref().is_some_and(|r| r.survives_gnss_loss),
            ),
            new_single_points_of_failure: sb.difference(&sa).cloned().collect(),
            resolved_single_points_of_failure: sa.difference(&sb).cloned().collect(),
        };
        if fc.delivered.0 != fc.delivered.1
            || fc.survives_gnss_loss.0 != fc.survives_gnss_loss.1
            || !fc.new_single_points_of_failure.is_empty()
            || !fc.resolved_single_points_of_failure.is_empty()
        {
            functions.push(fc);
        }
    }
    Ok(DiffReport {
        label: LABEL,
        added,
        removed,
        changed,
        functions,
    })
}

// ---------------------------------------------------------------------------------------------
// CLI
// ---------------------------------------------------------------------------------------------

fn read_json(path: &str) -> Result<Value, String> {
    let text = std::fs::read_to_string(path)
        .map_err(|e| crate::terr!("e-pbom-read", path = path, e = e.to_string()))?;
    serde_json::from_str(&text)
        .map_err(|e| crate::terr!("e-pbom-read", path = path, e = e.to_string()))
}

/// Generate a PBOM from a configuration or a scenario file's text. A text whose top-level
/// `pbom` key names [`CONFIG_FORMAT`] is a configuration; any other TOML is read as a scenario.
pub fn generate_from_text(name: &str, text: &str) -> Result<Value, String> {
    let v: toml::Value = toml::from_str(text)
        .map_err(|e| crate::terr!("e-pbom-read", path = name, e = e.to_string()))?;
    if v.get("pbom").is_some() {
        let cfg: Config = toml::from_str(text)
            .map_err(|e| crate::terr!("e-pbom-read", path = name, e = e.to_string()))?;
        generate(&cfg, None)
    } else {
        let stem = std::path::Path::new(name)
            .file_stem()
            .and_then(|s| s.to_str())
            .unwrap_or(name);
        let (cfg, note) = config_from_scenario(stem, &v);
        generate(&cfg, Some(&note))
    }
}

fn pretty(v: &impl Serialize) -> Result<String, String> {
    serde_json::to_string_pretty(v).map_err(|e| e.to_string())
}

/// `kshana pbom validate|generate|diff|schema ...`.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("pbom-usage");
    match args.first().map(String::as_str) {
        Some("validate") if args.len() == 2 => {
            let report = validate(&read_json(&args[1])?);
            println!("{}", pretty(&report)?);
            if report.valid {
                Ok(())
            } else {
                Err(crate::terr!("e-pbom-invalid", n = report.errors.len()))
            }
        }
        Some("generate") if args.len() == 2 || (args.len() == 4 && args[2] == "--out") => {
            let path = &args[1];
            let text = std::fs::read_to_string(path)
                .map_err(|e| crate::terr!("e-pbom-read", path = path.clone(), e = e.to_string()))?;
            let doc = generate_from_text(path, &text)?;
            let report = validate(&doc);
            if !report.valid {
                eprintln!("{}", pretty(&report)?);
                return Err(crate::terr!("e-pbom-invalid", n = report.errors.len()));
            }
            let out = pretty(&doc)? + "\n";
            match args.get(3) {
                Some(o) => std::fs::write(o, out)
                    .map_err(|e| crate::terr!("e-pbom-read", path = o.clone(), e = e.to_string())),
                None => {
                    print!("{out}");
                    Ok(())
                }
            }
        }
        Some("diff") if args.len() == 3 => {
            let report = diff(&read_json(&args[1])?, &read_json(&args[2])?)?;
            println!("{}", pretty(&report)?);
            Ok(())
        }
        Some("schema") if args.len() == 1 => {
            print!("{SCHEMA}");
            Ok(())
        }
        Some("--help" | "-h" | "help") => {
            println!("{}", usage());
            Ok(())
        }
        _ => Err(usage()),
    }
}
