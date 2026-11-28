// SPDX-License-Identifier: AGPL-3.0-only
//! The open space evidence pack profile, `kshana.space-evidence-pack/1`
//! (`kshana evidence space-pack`, docs/SPACE-EVIDENCE-PACK.md).
//!
//! One directory format for the evidence a space operator, a manufacturer or an administration
//! collects about sensor data, cyber controls and interference, so that each kind does not need
//! its own format. A pack is a directory holding `space-evidence.json` (the manifest: the pack's
//! identity and a list of items) and the files the items name. Every item has the same common
//! fields (an id, a kind, a title, a creation time, a producer, an evidence label, and its files
//! with their SHA-256 and size) and a `body` whose fields depend on its kind:
//!
//! | kind | content |
//! |---|---|
//! | `sensor-record` | a sensor's data over a time window, optionally as an embedded signed `kshana-evidence/1` pack |
//! | `interference-event` | an interference event: the affected link, the window, the measured degradation, an optional geolocation ellipse, the method and the confidence |
//! | `cyber-control` | the artefacts (configuration, cryptographic settings, test results, SBOM) collected as evidence for one control of a named framework |
//! | `anomaly-report` | a spacecraft anomaly: symptoms, timeline, hypotheses and closure status |
//! | `acceptance-record` | a unit's factory acceptance: parts and lots, tests and results, deviations and sign-offs |
//! | `hbom` | a hardware bill of materials as a CycloneDX JSON file, with `kshana:hbom:` properties for the distributor class, lot or date code and export classification |
//!
//! **Labels.** Each item carries one of the evidence tiers the engine's ledger uses
//! (`VALIDATED`, `MODELLED`, `PARTNER`); a `VALIDATED` item must name the external `oracle` it
//! was checked against. The pack's label is the weakest of its items, as for a run's evidence
//! label ([`crate::evidence_label`]), and `validate` checks that the manifest says so.
//!
//! **Signing.** The profile reuses the signed-directory format (`signature.json`,
//! `kshana-dossier-signature/1`, [`super::signed_dir`]): an Ed25519 statement over the SHA-256 of
//! every file in the pack, the manifest included. `validate` checks such a signature when it is
//! present and says whether the key is one the caller trusts; it does not sign. A
//! `sensor-record` may embed a `kshana-evidence/1` pack, which `validate` checks with
//! [`super::verify_bundle`].
//!
//! `validate` checks the format of what a pack states: that every file is present with its hash,
//! that the fields of each kind are present and in range, that the labels are consistent. It
//! does not check that the evidence is true, and a valid pack is not an assessment, an
//! attestation or a statement that any requirement is met. Its report is labelled MODELLED.

use std::collections::{BTreeMap, BTreeSet};
use std::path::Path;

use serde::Serialize;
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

/// The profile identifier, the manifest's `format`.
pub const FORMAT: &str = "kshana.space-evidence-pack/1";
/// The manifest's file name at the pack root.
pub const MANIFEST: &str = "space-evidence.json";
/// The validation report's format.
pub const REPORT_FORMAT: &str = "kshana.space-evidence-validate/1";
/// The JSON Schema of the manifest.
pub const SCHEMA: &str =
    include_str!("../../data/space-evidence/kshana-space-evidence-pack-1.schema.json");
/// The item kinds.
pub const KINDS: &[&str] = &[
    "sensor-record",
    "interference-event",
    "cyber-control",
    "anomaly-report",
    "acceptance-record",
    "hbom",
];
/// The evidence tiers, weakest last ([`crate::evidence_label`] orders them the same way).
pub const LABELS: &[&str] = &["VALIDATED", "MODELLED", "PARTNER"];
/// Words a pack's text must not use about itself: a pack records evidence, it does not certify.
pub const ASSERTION_WORDS: &[&str] = &["certified", "compliant", "conformant"];
/// The statement every manifest carries.
pub const DISCLAIMER: &str = "A space evidence pack records what its producer collected and states, with hashes so that a change can be detected. It is not an assessment, a certification or an attestation that any requirement is met, and a valid pack is not evidence that its content is true.";
/// Cap on the files one pack may list.
pub const MAX_FILES: usize = 10_000;

/// One problem.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct Problem {
    /// A stable code.
    pub code: &'static str,
    /// The item it concerns, when it concerns one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub item: Option<String>,
    /// Where in the manifest.
    pub at: String,
    /// What is wrong.
    pub message: String,
}

/// One item, as summarised.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct ItemSummary {
    /// The item id.
    pub id: String,
    /// The kind.
    pub kind: String,
    /// The label.
    pub label: String,
    /// Files listed.
    pub files: usize,
}

/// An embedded `kshana-evidence/1` pack, as checked.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct EmbeddedPack {
    /// The item that embeds it.
    pub item: String,
    /// Its directory, relative to the pack.
    pub dir: String,
    /// No check failed (signature checked against the key the pack names: not pinned).
    pub ok: bool,
    /// Failure codes.
    pub failures: Vec<String>,
}

/// The signature, as checked.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SignatureCheck {
    /// The statement's signer, as written.
    pub signer: String,
    /// The key id.
    pub key_id: String,
    /// The signature verifies.
    pub signature_valid: bool,
    /// The key is one given with `--trust`.
    pub trusted: bool,
    /// Mismatches between the directory and the statement.
    pub problems: Vec<String>,
}

/// The validation report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// [`REPORT_FORMAT`].
    pub format: &'static str,
    /// `MODELLED`: a check of what the pack states.
    pub label: &'static str,
    /// The profile checked against.
    pub profile: &'static str,
    /// No error.
    pub valid: bool,
    /// The pack id, when readable.
    pub pack_id: Option<String>,
    /// The label the manifest states.
    pub pack_label: Option<String>,
    /// The weakest item label.
    pub computed_label: Option<String>,
    /// Items.
    pub items: Vec<ItemSummary>,
    /// Errors.
    pub errors: Vec<Problem>,
    /// Warnings.
    pub warnings: Vec<Problem>,
    /// The signature, when `signature.json` is present.
    pub signature: Option<SignatureCheck>,
    /// Embedded evidence packs.
    pub embedded_packs: Vec<EmbeddedPack>,
}

struct Ctx {
    errors: Vec<Problem>,
    warnings: Vec<Problem>,
}

impl Ctx {
    fn err(&mut self, code: &'static str, item: Option<&str>, at: &str, message: String) {
        self.errors.push(Problem {
            code,
            item: item.map(str::to_string),
            at: at.to_string(),
            message,
        });
    }
    fn warn(&mut self, code: &'static str, item: Option<&str>, at: &str, message: String) {
        self.warnings.push(Problem {
            code,
            item: item.map(str::to_string),
            at: at.to_string(),
            message,
        });
    }
}

/// Whether `s` is an RFC 3339 UTC time (`YYYY-MM-DDThh:mm:ss[.fff]Z`).
pub fn is_utc(s: &str) -> bool {
    utc_seconds(s).is_some()
}

fn utc_seconds(s: &str) -> Option<f64> {
    let s = s.strip_suffix('Z')?;
    let (d, t) = s.split_once('T')?;
    let day = crate::utc_readiness::parse_date(d)?;
    if crate::utc_readiness::civil_from_days(day) != d || t.len() < 8 {
        return None;
    }
    let mut it = t.splitn(3, ':');
    let h: u32 = it.next()?.parse().ok()?;
    let m: u32 = it.next()?.parse().ok()?;
    let sec: f64 = it.next()?.parse().ok()?;
    (h < 24 && m < 60 && (0.0..61.0).contains(&sec))
        .then(|| day as f64 * 86_400.0 + f64::from(h * 3600 + m * 60) + sec)
}

/// Whether `p` is a safe relative path inside the pack: `/`-separated, no `..`, `.`, empty
/// segment, leading `/`, backslash or drive letter.
pub fn safe_rel(p: &str) -> bool {
    !p.is_empty()
        && !p.starts_with('/')
        && !p.contains('\\')
        && !p.contains(':')
        && p.split('/').all(|s| !s.is_empty() && s != "." && s != "..")
}

fn weakest<'a>(labels: impl Iterator<Item = &'a str>) -> Option<&'a str> {
    labels.max_by_key(|l| LABELS.iter().position(|x| x == l).unwrap_or(LABELS.len()))
}

fn text_of(v: &Value, out: &mut Vec<String>) {
    match v {
        Value::String(s) => out.push(s.to_ascii_lowercase()),
        Value::Array(a) => a.iter().for_each(|x| text_of(x, out)),
        Value::Object(o) => o.values().for_each(|x| text_of(x, out)),
        _ => {}
    }
}

fn need_str<'a>(
    c: &mut Ctx,
    v: &'a Value,
    k: &str,
    item: Option<&str>,
    at: &str,
) -> Option<&'a str> {
    match v.get(k).and_then(Value::as_str) {
        Some(s) if !s.trim().is_empty() => Some(s),
        _ => {
            c.err(
                "missing-field",
                item,
                &format!("{at}.{k}"),
                format!("{k} must be a non-empty string"),
            );
            None
        }
    }
}

fn need_utc(c: &mut Ctx, v: &Value, k: &str, item: Option<&str>, at: &str) -> Option<f64> {
    let s = need_str(c, v, k, item, at)?;
    let t = utc_seconds(s);
    if t.is_none() {
        c.err(
            "bad-time",
            item,
            &format!("{at}.{k}"),
            format!("{s:?} is not an RFC 3339 UTC time ending in Z"),
        );
    }
    t
}

fn opt_num(
    c: &mut Ctx,
    v: &Value,
    k: &str,
    item: Option<&str>,
    at: &str,
    lo: f64,
    hi: f64,
) -> Option<f64> {
    let x = v.get(k)?;
    match x.as_f64() {
        Some(n) if n.is_finite() && (lo..=hi).contains(&n) => Some(n),
        _ => {
            c.err(
                "out-of-range",
                item,
                &format!("{at}.{k}"),
                format!("{k} must be a number in [{lo}, {hi}]"),
            );
            None
        }
    }
}

fn need_num(
    c: &mut Ctx,
    v: &Value,
    k: &str,
    item: Option<&str>,
    at: &str,
    lo: f64,
    hi: f64,
) -> Option<f64> {
    if v.get(k).is_none() {
        c.err(
            "missing-field",
            item,
            &format!("{at}.{k}"),
            format!("{k} is required"),
        );
        return None;
    }
    opt_num(c, v, k, item, at, lo, hi)
}

fn need_enum(c: &mut Ctx, v: &Value, k: &str, allowed: &[&str], item: Option<&str>, at: &str) {
    if let Some(s) = need_str(c, v, k, item, at) {
        if !allowed.contains(&s) {
            c.err(
                "bad-value",
                item,
                &format!("{at}.{k}"),
                format!("{s:?} is not one of {allowed:?}"),
            );
        }
    }
}

fn need_array<'a>(
    c: &mut Ctx,
    v: &'a Value,
    k: &str,
    item: Option<&str>,
    at: &str,
    min: usize,
) -> &'a [Value] {
    match v.get(k).and_then(Value::as_array) {
        Some(a) if a.len() >= min => a,
        _ => {
            c.err(
                "missing-field",
                item,
                &format!("{at}.{k}"),
                format!("{k} must be an array of at least {min}"),
            );
            &[]
        }
    }
}

fn window(c: &mut Ctx, b: &Value, id: Option<&str>, at: &str) {
    if let (Some(s), Some(e)) = (
        need_utc(c, b, "start_utc", id, at),
        need_utc(c, b, "end_utc", id, at),
    ) {
        if e < s {
            c.err("bad-window", id, at, "end_utc is before start_utc".into());
        }
    }
}

/// Check the kind-specific `body` of an item.
fn check_body(
    c: &mut Ctx,
    kind: &str,
    b: &Value,
    id: Option<&str>,
    files: &[Value],
    root: Option<&Path>,
    emb: &mut Vec<EmbeddedPack>,
) {
    let at = "body";
    if !b.is_object() {
        c.err("missing-field", id, at, "body must be an object".into());
        return;
    }
    match kind {
        "sensor-record" => {
            need_str(c, b, "sensor", id, at);
            need_str(c, b, "quantity", id, at);
            window(c, b, id, at);
            if let Some(d) = b.get("evidence_pack") {
                match d.as_str() {
                    Some(d) if safe_rel(d) => {
                        if let Some(root) = root {
                            let dir = root.join(d);
                            match super::cli::read_dir(&dir) {
                                Ok(f) => {
                                    let r =
                                        super::verify_bundle(&f, &super::VerifyOptions::default());
                                    let failures: Vec<String> = r
                                        .failures
                                        .iter()
                                        .map(|x| {
                                            serde_json::to_value(x)
                                                .ok()
                                                .and_then(|v| {
                                                    v.get("code")
                                                        .and_then(Value::as_str)
                                                        .map(str::to_string)
                                                })
                                                .unwrap_or_default()
                                        })
                                        .collect();
                                    if !r.ok {
                                        c.err(
                                            "embedded-pack-failed",
                                            id,
                                            "body.evidence_pack",
                                            format!("{d}: {}", failures.join(", ")),
                                        );
                                    }
                                    emb.push(EmbeddedPack {
                                        item: id.unwrap_or_default().to_string(),
                                        dir: d.to_string(),
                                        ok: r.ok,
                                        failures,
                                    });
                                }
                                Err(e) => c.err(
                                    "file-missing",
                                    id,
                                    "body.evidence_pack",
                                    format!("{d}: {e}"),
                                ),
                            }
                        }
                    }
                    _ => c.err(
                        "unsafe-path",
                        id,
                        "body.evidence_pack",
                        "evidence_pack must be a relative path inside the pack".into(),
                    ),
                }
            } else if files.is_empty() {
                c.err(
                    "no-evidence",
                    id,
                    "files",
                    "a sensor-record needs files or an evidence_pack".into(),
                );
            }
        }
        "interference-event" => {
            need_str(c, b, "affected", id, at);
            window(c, b, id, at);
            need_str(c, b, "method", id, at);
            need_num(c, b, "confidence", id, at, 0.0, 1.0);
            opt_num(c, b, "carrier_frequency_mhz", id, at, 0.0, 3.0e6);
            opt_num(c, b, "bandwidth_khz", id, at, 0.0, 1.0e7);
            opt_num(c, b, "cn_drop_db", id, at, 0.0, 200.0);
            if let Some(g) = b.get("geolocation") {
                let a = "body.geolocation";
                need_num(c, g, "lat_deg", id, a, -90.0, 90.0);
                need_num(c, g, "lon_deg", id, a, -180.0, 180.0);
                let maj = need_num(c, g, "semi_major_km", id, a, 0.0, 40_000.0);
                let min = need_num(c, g, "semi_minor_km", id, a, 0.0, 40_000.0);
                need_num(c, g, "orientation_deg", id, a, 0.0, 180.0);
                need_num(c, g, "probability", id, a, 0.0, 1.0);
                if let (Some(maj), Some(min)) = (maj, min) {
                    if min > maj {
                        c.err(
                            "bad-value",
                            id,
                            a,
                            "semi_minor_km is larger than semi_major_km".into(),
                        );
                    }
                }
            }
        }
        "cyber-control" => {
            need_str(c, b, "framework", id, at);
            need_str(c, b, "control_id", id, at);
            need_enum(
                c,
                b,
                "evidence_status",
                &["provided", "partial", "not-provided"],
                id,
                at,
            );
            let provided = b.get("evidence_status").and_then(Value::as_str) == Some("provided");
            if provided && files.is_empty() {
                c.err(
                    "no-evidence",
                    id,
                    "files",
                    "evidence_status is provided but no file is listed".into(),
                );
            }
            for (i, f) in files.iter().enumerate() {
                if f.get("role").is_none() {
                    c.warn("no-role", id, &format!("files[{i}]"), "a cyber-control artefact should state its role (configuration, crypto-settings, test-result, sbom, other)".into());
                }
            }
        }
        "anomaly-report" => {
            need_str(c, b, "spacecraft", id, at);
            need_utc(c, b, "detected_utc", id, at);
            need_array(c, b, "symptoms", id, at, 1);
            for (i, e) in need_array(c, b, "timeline", id, at, 1).iter().enumerate() {
                let a = format!("body.timeline[{i}]");
                need_utc(c, e, "utc", id, &a);
                need_str(c, e, "event", id, &a);
            }
            for (i, h) in b
                .get("hypotheses")
                .and_then(Value::as_array)
                .map(Vec::as_slice)
                .unwrap_or(&[])
                .iter()
                .enumerate()
            {
                let a = format!("body.hypotheses[{i}]");
                need_str(c, h, "text", id, &a);
                need_enum(c, h, "status", &["open", "supported", "rejected"], id, &a);
            }
            need_enum(c, b, "closure", &["open", "monitoring", "closed"], id, at);
        }
        "acceptance-record" => {
            need_str(c, b, "unit", id, at);
            need_str(c, b, "serial", id, at);
            for (i, p) in b
                .get("parts")
                .and_then(Value::as_array)
                .map(Vec::as_slice)
                .unwrap_or(&[])
                .iter()
                .enumerate()
            {
                let a = format!("body.parts[{i}]");
                need_str(c, p, "part", id, &a);
                need_str(c, p, "lot", id, &a);
            }
            for (i, t) in need_array(c, b, "tests", id, at, 1).iter().enumerate() {
                let a = format!("body.tests[{i}]");
                need_str(c, t, "test", id, &a);
                need_enum(
                    c,
                    t,
                    "result",
                    &["pass", "fail", "waived", "not-run"],
                    id,
                    &a,
                );
                need_utc(c, t, "utc", id, &a);
            }
            for (i, s) in b
                .get("signoffs")
                .and_then(Value::as_array)
                .map(Vec::as_slice)
                .unwrap_or(&[])
                .iter()
                .enumerate()
            {
                let a = format!("body.signoffs[{i}]");
                need_str(c, s, "role", id, &a);
                need_str(c, s, "name", id, &a);
                need_utc(c, s, "utc", id, &a);
            }
        }
        "hbom" => {
            let bom: Vec<&str> = files
                .iter()
                .filter(|f| f.get("role").and_then(Value::as_str) == Some("cyclonedx"))
                .filter_map(|f| f.get("path").and_then(Value::as_str))
                .collect();
            if bom.len() != 1 {
                c.err(
                    "hbom-file",
                    id,
                    "files",
                    "an hbom item lists exactly one file with role cyclonedx".into(),
                );
                return;
            }
            let Some(root) = root else { return };
            let Some(p) = bom.first().filter(|p| safe_rel(p)) else {
                return;
            };
            let doc = std::fs::read(root.join(p))
                .ok()
                .and_then(|b| serde_json::from_slice::<Value>(&b).ok());
            let Some(doc) = doc else {
                c.err(
                    "hbom-file",
                    id,
                    "files",
                    format!("{p} is not readable JSON"),
                );
                return;
            };
            if doc.get("bomFormat").and_then(Value::as_str) != Some("CycloneDX") {
                c.err(
                    "hbom-file",
                    id,
                    "files",
                    format!("{p} is not a CycloneDX document (bomFormat)"),
                );
                return;
            }
            let comps = doc
                .get("components")
                .and_then(Value::as_array)
                .map(Vec::as_slice)
                .unwrap_or(&[]);
            if comps.is_empty() {
                c.err("hbom-file", id, "files", format!("{p} lists no components"));
            }
            for (i, comp) in comps.iter().enumerate() {
                let props: BTreeMap<&str, &str> = comp
                    .get("properties")
                    .and_then(Value::as_array)
                    .map(Vec::as_slice)
                    .unwrap_or(&[])
                    .iter()
                    .filter_map(|p| Some((p.get("name")?.as_str()?, p.get("value")?.as_str()?)))
                    .collect();
                let a = format!("{p}:components[{i}]");
                match props.get("kshana:hbom:distributor-class") {
                    Some(v) if ["ocm", "authorised", "independent", "unknown"].contains(v) => {
                        if *v == "independent" || *v == "unknown" {
                            c.warn("non-authorised-source", id, &a, format!("distributor class {v}: a part not bought from the manufacturer or an authorised distributor"));
                        }
                    }
                    Some(v) => c.err("bad-value", id, &a, format!("kshana:hbom:distributor-class {v:?} is not ocm, authorised, independent or unknown")),
                    None => c.warn("no-distributor-class", id, &a, "no kshana:hbom:distributor-class".into()),
                }
                if !props.contains_key("kshana:hbom:lot")
                    && !props.contains_key("kshana:hbom:date-code")
                {
                    c.warn(
                        "no-lot",
                        id,
                        &a,
                        "no kshana:hbom:lot or kshana:hbom:date-code".into(),
                    );
                }
            }
        }
        _ => {}
    }
}

/// The SHA-256 and size of every regular file under `root`, by `/`-separated relative path.
fn walk(root: &Path) -> Result<BTreeMap<String, (String, u64)>, String> {
    let mut out = BTreeMap::new();
    let mut stack = vec![(root.to_path_buf(), String::new())];
    while let Some((dir, rel)) = stack.pop() {
        let rd = std::fs::read_dir(&dir).map_err(|e| format!("{}: {e}", dir.display()))?;
        for e in rd {
            let e = e.map_err(|e| e.to_string())?;
            let name = e.file_name().to_string_lossy().to_string();
            let p = if rel.is_empty() {
                name
            } else {
                format!("{rel}/{name}")
            };
            let ty = e.file_type().map_err(|e| e.to_string())?;
            if ty.is_dir() {
                stack.push((e.path(), p));
            } else if ty.is_file() {
                let b = std::fs::read(e.path()).map_err(|err| format!("{p}: {err}"))?;
                out.insert(p, (hex::encode(Sha256::digest(&b)), b.len() as u64));
                if out.len() > MAX_FILES + 2 {
                    return Err(crate::terr!(
                        "e-evidence-space-pack-too-many-files",
                        n = MAX_FILES
                    ));
                }
            } else {
                out.insert(p, (String::new(), 0));
            }
        }
    }
    Ok(out)
}

/// Validate a manifest. With `root`, the files are checked on disk and a `signature.json` is
/// verified against `trusted`; without it only the manifest is checked.
pub fn validate_manifest(doc: &Value, root: Option<&Path>, trusted: &[[u8; 32]]) -> Report {
    let mut c = Ctx {
        errors: Vec::new(),
        warnings: Vec::new(),
    };
    let mut items = Vec::new();
    let mut emb = Vec::new();
    if doc.get("format").and_then(Value::as_str) != Some(FORMAT) {
        c.err(
            "format",
            None,
            "format",
            format!("format must be {FORMAT:?}"),
        );
    }
    let pack_id = need_str(&mut c, doc, "pack_id", None, "$").map(str::to_string);
    need_str(&mut c, doc, "title", None, "$");
    need_str(&mut c, doc, "producer", None, "$");
    need_utc(&mut c, doc, "created_utc", None, "$");
    if doc.get("disclaimer").and_then(Value::as_str) != Some(DISCLAIMER) {
        c.err(
            "disclaimer",
            None,
            "disclaimer",
            "the manifest must carry the profile's disclaimer word for word".into(),
        );
    }
    let pack_label = doc.get("label").and_then(Value::as_str).map(str::to_string);
    let raw_items = need_array(&mut c, doc, "items", None, "$", 1);
    let mut ids = BTreeSet::new();
    let mut listed: BTreeMap<String, (String, u64)> = BTreeMap::new();
    for (i, it) in raw_items.iter().enumerate() {
        let at = format!("items[{i}]");
        let id = need_str(&mut c, it, "id", None, &at).map(str::to_string);
        let idr = id.as_deref();
        if let Some(id) = &id {
            if !id
                .chars()
                .all(|ch| ch.is_ascii_alphanumeric() || "._-".contains(ch))
            {
                c.err(
                    "bad-id",
                    idr,
                    &at,
                    "an id uses letters, digits, '.', '_' and '-' only".into(),
                );
            }
            if !ids.insert(id.clone()) {
                c.err("duplicate-id", idr, &at, format!("id {id:?} is used twice"));
            }
        }
        let kind = it.get("kind").and_then(Value::as_str).unwrap_or("");
        if !KINDS.contains(&kind) {
            c.err(
                "bad-kind",
                idr,
                &format!("{at}.kind"),
                format!("{kind:?} is not one of {KINDS:?}"),
            );
        }
        need_str(&mut c, it, "title", idr, &at);
        need_str(&mut c, it, "producer", idr, &at);
        need_utc(&mut c, it, "created_utc", idr, &at);
        let label = it.get("label").and_then(Value::as_str).unwrap_or("");
        if !LABELS.contains(&label) {
            c.err(
                "bad-label",
                idr,
                &format!("{at}.label"),
                format!("{label:?} is not one of {LABELS:?}"),
            );
        }
        if label == "VALIDATED"
            && it
                .get("oracle")
                .and_then(Value::as_str)
                .is_none_or(|s| s.trim().is_empty())
        {
            c.err(
                "validated-without-oracle",
                idr,
                &format!("{at}.oracle"),
                "a VALIDATED item names the external oracle it was checked against".into(),
            );
        }
        let files = it
            .get("files")
            .and_then(Value::as_array)
            .map(Vec::as_slice)
            .unwrap_or(&[]);
        if it.get("files").is_some_and(|f| !f.is_array()) {
            c.err(
                "missing-field",
                idr,
                &format!("{at}.files"),
                "files must be an array".into(),
            );
        }
        for (k, f) in files.iter().enumerate() {
            let fa = format!("{at}.files[{k}]");
            let Some(p) = need_str(&mut c, f, "path", idr, &fa) else {
                continue;
            };
            if !safe_rel(p) || p == MANIFEST || p == super::signed_dir::SIGNATURE_FILE {
                c.err(
                    "unsafe-path",
                    idr,
                    &fa,
                    format!("{p:?} is not a relative path to a content file inside the pack"),
                );
                continue;
            }
            let sha = f.get("sha256").and_then(Value::as_str).unwrap_or("");
            if sha.len() != 64 || !sha.bytes().all(|b| b.is_ascii_hexdigit()) {
                c.err("bad-hash", idr, &fa, "sha256 must be 64 hex digits".into());
            }
            let Some(bytes) = f.get("bytes").and_then(Value::as_u64) else {
                c.err(
                    "missing-field",
                    idr,
                    &fa,
                    "bytes must be a non-negative integer".into(),
                );
                continue;
            };
            if let Some(prev) = listed.insert(p.to_string(), (sha.to_ascii_lowercase(), bytes)) {
                if prev != (sha.to_ascii_lowercase(), bytes) {
                    c.err(
                        "conflicting-file",
                        idr,
                        &fa,
                        format!("{p} is listed twice with different hashes or sizes"),
                    );
                }
            }
        }
        for (k, r) in it
            .get("related")
            .and_then(Value::as_array)
            .map(Vec::as_slice)
            .unwrap_or(&[])
            .iter()
            .enumerate()
        {
            if r.as_str().is_none() {
                c.err(
                    "bad-value",
                    idr,
                    &format!("{at}.related[{k}]"),
                    "related lists item ids".into(),
                );
            }
        }
        let body = it.get("body").cloned().unwrap_or(Value::Null);
        check_body(&mut c, kind, &body, idr, files, root, &mut emb);
        let mut words = Vec::new();
        text_of(it, &mut words);
        for w in ASSERTION_WORDS {
            if words.iter().any(|t| {
                t.split(|ch: char| !ch.is_ascii_alphanumeric())
                    .any(|x| x == *w)
            }) {
                c.warn("assertion-word", idr, &at, format!("the item's text uses {w:?}: a pack records evidence and makes no such claim"));
            }
        }
        items.push(ItemSummary {
            id: id.unwrap_or_default(),
            kind: kind.to_string(),
            label: label.to_string(),
            files: files.len(),
        });
    }
    for (i, it) in raw_items.iter().enumerate() {
        for r in it
            .get("related")
            .and_then(Value::as_array)
            .map(Vec::as_slice)
            .unwrap_or(&[])
            .iter()
            .filter_map(Value::as_str)
        {
            if !ids.contains(r) {
                c.err(
                    "unknown-related",
                    it.get("id").and_then(Value::as_str),
                    &format!("items[{i}].related"),
                    format!("{r:?} is not an item of this pack"),
                );
            }
        }
    }
    let computed = weakest(
        items
            .iter()
            .map(|i| i.label.as_str())
            .filter(|l| LABELS.contains(l)),
    )
    .map(str::to_string);
    match (&pack_label, &computed) {
        (Some(p), Some(w)) if p != w => c.err(
            "label-mismatch",
            None,
            "label",
            format!("the pack is labelled {p} but its weakest item is {w}"),
        ),
        (None, _) => c.err(
            "missing-field",
            None,
            "label",
            "label is required (the weakest item label)".into(),
        ),
        _ => {}
    }
    let mut signature = None;
    if let Some(root) = root {
        match walk(root) {
            Ok(found) => {
                for (p, (sha, bytes)) in &listed {
                    match found.get(p) {
                        None => c.err(
                            "file-missing",
                            None,
                            p,
                            format!("{p} is listed but not in the pack"),
                        ),
                        Some((fs, fb)) if fs != sha || fb != bytes => c.err(
                            "file-mismatch",
                            None,
                            p,
                            format!(
                                "{p}: listed sha256 {sha} ({bytes} bytes), found {fs} ({fb} bytes)"
                            ),
                        ),
                        _ => {}
                    }
                }
                let embedded: Vec<&str> = emb.iter().map(|e| e.dir.as_str()).collect();
                for (p, (sha, _)) in &found {
                    if sha.is_empty() {
                        c.err("not-regular", None, p, format!("{p} is not a regular file"));
                        continue;
                    }
                    let skip = p == MANIFEST
                        || p == super::signed_dir::SIGNATURE_FILE
                        || p == super::signed_dir::LONGTERM_FILE
                        || embedded.iter().any(|d| p.starts_with(&format!("{d}/")));
                    if !skip && !listed.contains_key(p) {
                        c.err(
                            "unlisted-file",
                            None,
                            p,
                            format!("{p} is in the pack but no item lists it"),
                        );
                    }
                }
            }
            Err(e) => c.err("file-missing", None, "$", e),
        }
        if root.join(super::signed_dir::SIGNATURE_FILE).is_file() {
            match super::signed_dir::verify_dir(root, trusted) {
                Ok(r) => {
                    let problems: Vec<String> = r
                        .problems
                        .iter()
                        .map(|p| serde_json::to_string(p).unwrap_or_default())
                        .collect();
                    if !r.signature_valid || !problems.is_empty() {
                        c.err(
                            "signature",
                            None,
                            super::signed_dir::SIGNATURE_FILE,
                            format!(
                                "signature valid: {}; problems: {}",
                                r.signature_valid,
                                problems.join(", ")
                            ),
                        );
                    } else if !r.trusted {
                        c.warn(
                            "signer-not-trusted",
                            None,
                            super::signed_dir::SIGNATURE_FILE,
                            format!("intact, but key {} is not one given with --trust", r.key_id),
                        );
                    }
                    signature = Some(SignatureCheck {
                        signer: r.signer,
                        key_id: r.key_id,
                        signature_valid: r.signature_valid,
                        trusted: r.trusted,
                        problems,
                    });
                }
                Err(e) => c.err("signature", None, super::signed_dir::SIGNATURE_FILE, e),
            }
        } else {
            c.warn(
                "unsigned",
                None,
                "$",
                "no signature.json: the pack's integrity rests on the hashes alone".into(),
            );
        }
    }
    Report {
        format: REPORT_FORMAT,
        label: "MODELLED",
        profile: FORMAT,
        valid: c.errors.is_empty(),
        pack_id,
        pack_label,
        computed_label: computed,
        items,
        errors: c.errors,
        warnings: c.warnings,
        signature,
        embedded_packs: emb,
    }
}

/// Validate the pack directory at `root`.
pub fn validate_dir(root: &Path, trusted: &[[u8; 32]]) -> Result<Report, String> {
    let m = root.join(MANIFEST);
    let b = std::fs::read(&m).map_err(|e| format!("{}: {e}", m.display()))?;
    let doc: Value = serde_json::from_slice(&b).map_err(|e| format!("{}: {e}", m.display()))?;
    Ok(validate_manifest(&doc, Some(root), trusted))
}

/// The manifest with every listed file's `sha256` and `bytes` set from the files on disk.
pub fn fill_hashes(doc: &mut Value, root: &Path) -> Result<usize, String> {
    let mut n = 0;
    for it in doc
        .get_mut("items")
        .and_then(Value::as_array_mut)
        .into_iter()
        .flatten()
    {
        for f in it
            .get_mut("files")
            .and_then(Value::as_array_mut)
            .into_iter()
            .flatten()
        {
            let Some(p) = f.get("path").and_then(Value::as_str).map(str::to_string) else {
                continue;
            };
            if !safe_rel(&p) {
                return Err(crate::terr!(
                    "e-evidence-space-pack-unsafe-path",
                    p = format!("{p:?}")
                ));
            }
            let b = std::fs::read(root.join(&p)).map_err(|e| format!("{p}: {e}"))?;
            f["sha256"] = json!(hex::encode(Sha256::digest(&b)));
            f["bytes"] = json!(b.len());
            n += 1;
        }
    }
    Ok(n)
}

/// A manifest to start from (`kshana evidence space-pack template`).
pub fn template() -> Value {
    json!({
        "format": FORMAT,
        "pack_id": "example-pack-001",
        "title": "Example space evidence pack",
        "producer": "Example operator",
        "created_utc": "2026-11-27T00:00:00Z",
        "label": "MODELLED",
        "disclaimer": DISCLAIMER,
        "items": [
            {
                "id": "ifx-001",
                "kind": "interference-event",
                "title": "Uplink interference on transponder 12",
                "producer": "Example operator NOC",
                "created_utc": "2026-11-27T00:00:00Z",
                "label": "MODELLED",
                "files": [ { "path": "ifx-001/spectrum.csv", "sha256": "", "bytes": 0, "role": "measurement" } ],
                "body": {
                    "affected": "EXAMPLE-SAT-1 transponder 12 uplink",
                    "start_utc": "2026-11-20T10:00:00Z",
                    "end_utc": "2026-11-20T10:45:00Z",
                    "carrier_frequency_mhz": 14250.0,
                    "bandwidth_khz": 36000.0,
                    "cn_drop_db": 12.5,
                    "method": "spectrum monitoring at the operator's ground station",
                    "confidence": 0.8
                }
            }
        ]
    })
}

/// The text form of a report.
pub fn to_text(r: &Report) -> String {
    let mut s = format!(
        "{} {} ({}): {}\n",
        r.profile,
        r.pack_id.as_deref().unwrap_or("?"),
        r.label,
        if r.valid { "VALID" } else { "INVALID" }
    );
    s.push_str(&format!(
        "pack label {} (weakest item {})\n",
        r.pack_label.as_deref().unwrap_or("-"),
        r.computed_label.as_deref().unwrap_or("-")
    ));
    for i in &r.items {
        s.push_str(&format!(
            "  item {} {} {} files={}\n",
            i.id, i.kind, i.label, i.files
        ));
    }
    if let Some(sig) = &r.signature {
        s.push_str(&format!(
            "signature: signer {} key {} valid={} trusted={}\n",
            sig.signer, sig.key_id, sig.signature_valid, sig.trusted
        ));
    }
    for e in &r.embedded_packs {
        s.push_str(&format!(
            "embedded pack {} ({}): ok={} {}\n",
            e.dir,
            e.item,
            e.ok,
            e.failures.join(",")
        ));
    }
    for p in &r.errors {
        s.push_str(&format!(
            "ERROR {} {} {}: {}\n",
            p.code,
            p.item.as_deref().unwrap_or("-"),
            p.at,
            p.message
        ));
    }
    for p in &r.warnings {
        s.push_str(&format!(
            "warning {} {} {}: {}\n",
            p.code,
            p.item.as_deref().unwrap_or("-"),
            p.at,
            p.message
        ));
    }
    s
}

/// `kshana evidence space-pack <validate <dir> [--trust <hex|file>]... [--json] | hash <dir> |
/// schema | template>`. Exit 0 valid, 1 invalid, 2 a usage or input error.
pub fn run(args: &[String]) -> i32 {
    let usage = || {
        eprintln!("{}", crate::t!("evidence-space-pack-usage"));
        2
    };
    match args.first().map(String::as_str) {
        Some("schema") if args.len() == 1 => {
            print!("{SCHEMA}");
            0
        }
        Some("template") if args.len() == 1 => {
            println!(
                "{}",
                serde_json::to_string_pretty(&template()).unwrap_or_default()
            );
            0
        }
        Some("hash") if args.len() == 2 => {
            let root = Path::new(&args[1]);
            let r = std::fs::read(root.join(MANIFEST))
                .map_err(|e| e.to_string())
                .and_then(|b| serde_json::from_slice::<Value>(&b).map_err(|e| e.to_string()))
                .and_then(|mut d| fill_hashes(&mut d, root).map(|_| d));
            match r {
                Ok(d) => {
                    println!("{}", serde_json::to_string_pretty(&d).unwrap_or_default());
                    0
                }
                Err(e) => {
                    eprintln!("{}", crate::terr!("e-evidence-space-pack-input", e = e));
                    2
                }
            }
        }
        Some("validate") => {
            let mut dir = None;
            let mut json = false;
            let mut trusted = Vec::new();
            let mut i = 1;
            while i < args.len() {
                match args[i].as_str() {
                    "--json" => json = true,
                    "--trust" => match args.get(i + 1).map(|a| super::cli::read_trusted_key(a)) {
                        Some(Ok(k)) => {
                            trusted.push(k);
                            i += 1;
                        }
                        Some(Err(e)) => {
                            eprintln!("{}", crate::terr!("e-evidence-space-pack-input", e = e));
                            return 2;
                        }
                        None => return usage(),
                    },
                    a if a.starts_with("--") || dir.is_some() => return usage(),
                    a => dir = Some(a.to_string()),
                }
                i += 1;
            }
            let Some(dir) = dir else { return usage() };
            match validate_dir(Path::new(&dir), &trusted) {
                Ok(r) => {
                    if json {
                        println!("{}", serde_json::to_string_pretty(&r).unwrap_or_default());
                    } else {
                        print!("{}", to_text(&r));
                    }
                    i32::from(!r.valid)
                }
                Err(e) => {
                    eprintln!("{}", crate::terr!("e-evidence-space-pack-input", e = e));
                    2
                }
            }
        }
        Some("--help" | "-h" | "help") => {
            println!("{}", crate::t!("evidence-space-pack-usage"));
            0
        }
        _ => usage(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn paths_and_times() {
        assert!(safe_rel("a/b.csv"));
        for p in ["", "/a", "a/../b", "./a", "a//b", "C:/a", "a\\b"] {
            assert!(!safe_rel(p), "{p}");
        }
        assert!(is_utc("2026-11-27T00:00:00Z"));
        assert!(!is_utc("2026-11-27T00:00:00+01:00"));
        assert!(!is_utc("2026-02-30T00:00:00Z"));
    }

    #[test]
    fn weakest_label() {
        assert_eq!(
            weakest(["VALIDATED", "MODELLED"].into_iter()),
            Some("MODELLED")
        );
        assert_eq!(
            weakest(["VALIDATED", "PARTNER", "MODELLED"].into_iter()),
            Some("PARTNER")
        );
        assert_eq!(weakest(["VALIDATED"].into_iter()), Some("VALIDATED"));
    }

    #[test]
    fn the_template_is_valid_apart_from_its_files() {
        let r = validate_manifest(&template(), None, &[]);
        assert_eq!(
            r.errors.iter().map(|e| e.code).collect::<Vec<_>>(),
            ["bad-hash"]
        );
    }

    #[test]
    fn the_schema_is_json() {
        let v: Value = serde_json::from_str(SCHEMA).unwrap();
        assert_eq!(v["properties"]["format"]["const"], FORMAT);
    }
}
