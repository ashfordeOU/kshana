// SPDX-License-Identifier: AGPL-3.0-only
//! Units and provenance for every emitted field — the shared vocabulary, the path
//! grammar and the audit that turn the per-report `units` blocks into one enforceable
//! contract.
//!
//! ## The contract
//!
//! Every scenario result document may carry a top-level `units` object mapping an
//! emitted field's **path** to `{"unit": …, "provenance": …, "note": …}`. That shape
//! predates this module — [`crate::linkbudget`], [`crate::lunar_jamming`],
//! [`crate::aperture_duty`], [`crate::hybrid_integrity`], [`crate::lunar_vlbi_fim`],
//! [`crate::tracking_loop`], [`crate::araim_reference`] and
//! [`crate::realtime_frame_eop`] all publish it already. This module adopts that shape
//! verbatim and adds the three things it was missing: a **closed provenance
//! vocabulary** ([`ProvenanceClass`]), a **stated path grammar** (see below), and an
//! **audit** ([`audit_document`]) any caller — or a global test — can run over a whole
//! result document.
//!
//! ## The path grammar
//!
//! A path is dot-separated segments naming the walk from the document root to a numeric
//! leaf. An array contributes one segment, suffixed `[]`, and every element of the array
//! shares that one path — a units entry describes the *column*, not the row. So
//! `sessions[].aos_s` names the `aos_s` field of every row of the top-level `sessions`
//! array, and `schedule.epochs[].elevation_deg` the same one level down.
//!
//! Two relaxations keep the grammar compatible with the blocks that predate it:
//!
//! * **The `[]` suffix is optional.** Several existing blocks spell the same column
//!   `sessions.aos_s`. Both spellings match the same leaf. New entries should carry the
//!   suffix, because only the suffixed form distinguishes an array of rows from a nested
//!   object.
//! * **A `*` segment is a single-segment wildcard**, for objects whose keys are *data*
//!   rather than schema — `table5….rows[].*.rms_native`, where the `*` stands for each
//!   quantity name the row happens to carry. A `*` may not be the first or the last
//!   segment: a wildcard that could stand alone, or that could swallow the field name
//!   itself, would let one entry claim coverage of anything.
//!
//! ## Unit spellings
//!
//! The `unit` string is free text — a closed unit vocabulary would be a second ratchet
//! and is not what this module enforces — but there is one house spelling, and new
//! entries use it:
//!
//! * SI symbols, ASCII, with `^` for powers and `*` / `/` for products and quotients:
//!   `m`, `km`, `m/s`, `m/s^2`, `m^2`, `s`, `ms`, `ns`, `ps`, `us`, `Hz`, `Hz/s`, `rad`,
//!   `rad/s`, `deg`, `arcsec`, `mas`, `K`, `dB`, `dBW`, `dBi`, `dB-Hz`, `N*m`, `kg/m^3`.
//! * `count` for a cardinality.
//! * **`1` for anything dimensionless** — a fraction, a ratio, a probability, an ordinal
//!   index — with the definition saying which it is.
//!
//! Entries that predate this module spell the dimensionless case several other ways
//! (`dimensionless`, `fraction`, `probability`, `fraction (dimensionless)`,
//! `ratio (dimensionless)`, `cycle (dimensionless)`, `sigma multiplier (dimensionless)`,
//! `probability per approach (dimensionless)`, `chip/chip (dimensionless)`), and
//! `crate::lunar_jamming` spells an index `index`. Those are released documents, so —
//! adding a units entry is additive, rewriting one is not — they keep their spelling; a
//! document can therefore carry both `1` and `dimensionless`. Two further spellings are
//! deliberate and not typos: `mixed - see note`, for one array column whose rows carry
//! genuinely different units, and ``see the sibling `unit` field``, for a row whose unit
//! is *data* and is emitted beside the value.
//!
//! ## Provenance versus evidence
//!
//! [`ProvenanceClass`] answers *where this number came from* — an input, a computation,
//! a published table, a closed form. That is not the same question as *how strong the
//! evidence behind it is*, which is the crate's Validated / Modelled honesty axis
//! ([`crate::verification`]). [`EvidenceTier`] states the mapping between the two, and
//! is explicit about the two classes where no honest per-field mapping exists: a
//! `computed` (or `derived`) number is exactly as strong as the model that produced it,
//! so its tier is [`EvidenceTier::InheritsScenarioLabel`] — read the report's own
//! `label`; and `measured-or-input` is a disjunction, so its tier is
//! [`EvidenceTier::DependsOnInput`].

use serde_json::{Map, Value};

/// Where an emitted number came from — the closed vocabulary a `units` entry's
/// `provenance` field may use.
///
/// The variants are exactly the strings already in use across the crate's `units`
/// blocks; this enum makes that set closed and checkable rather than free text.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Hash, PartialOrd, Ord)]
pub enum ProvenanceClass {
    /// Echoed straight back from the scenario input (or its documented default).
    Input,
    /// A scenario default that is a *modelled allocation* rather than a measurement —
    /// a budget line the caller may override but which nothing measured.
    ModelledInput,
    /// Derived by the engine from other fields of the same run.
    Computed,
    /// Evaluated from a closed-form expression that can be checked analytically.
    ClosedForm,
    /// A published device or system specification (a manufacturer's or an agency's
    /// stated number), reproduced here.
    Spec,
    /// A figure quoted from a published reference, carried so the engine's own value
    /// can be compared against it.
    Published,
    /// A defined physical or mathematical constant.
    Constant,
    /// The output of a model whose magnitude is an assumption, not a measurement.
    Modelled,
    /// A ratio or residual whose only job is to check the run against itself — an
    /// identity whose expected value is known before the run.
    InternalConsistency,
    /// Read from, or a statistic over, a real observed series supplied as input (an IERS
    /// EOP product, a RINEX file). Not a model output: an observation.
    Measured,
    /// **Compatibility only — do not use in new entries.** A disjunction rather than a
    /// class: the field is a measured floor unless the caller overrides it, and then it
    /// is that override. Released documents already carry it, so the vocabulary must
    /// still accept it.
    MeasuredOrInput,
    /// **Compatibility only — do not use in new entries.** A released-document synonym
    /// of [`ProvenanceClass::Computed`].
    Derived,
}

impl ProvenanceClass {
    /// Every class, in declaration order.
    pub const ALL: &'static [ProvenanceClass] = &[
        ProvenanceClass::Input,
        ProvenanceClass::ModelledInput,
        ProvenanceClass::Computed,
        ProvenanceClass::ClosedForm,
        ProvenanceClass::Spec,
        ProvenanceClass::Published,
        ProvenanceClass::Constant,
        ProvenanceClass::Modelled,
        ProvenanceClass::InternalConsistency,
        ProvenanceClass::Measured,
        ProvenanceClass::MeasuredOrInput,
        ProvenanceClass::Derived,
    ];

    /// The wire string written into a `units` entry.
    pub fn as_str(&self) -> &'static str {
        match self {
            ProvenanceClass::Input => "input",
            ProvenanceClass::ModelledInput => "modelled-input",
            ProvenanceClass::Computed => "computed",
            ProvenanceClass::ClosedForm => "closed-form",
            ProvenanceClass::Spec => "spec",
            ProvenanceClass::Published => "published",
            ProvenanceClass::Constant => "constant",
            ProvenanceClass::Modelled => "modelled",
            ProvenanceClass::InternalConsistency => "internal-consistency",
            ProvenanceClass::Measured => "measured",
            ProvenanceClass::MeasuredOrInput => "measured-or-input",
            ProvenanceClass::Derived => "derived",
        }
    }

    /// Parse a wire string. `None` for anything outside the vocabulary — an unknown
    /// class is a gate failure, never a silently accepted new category.
    pub fn parse(s: &str) -> Option<ProvenanceClass> {
        ProvenanceClass::ALL
            .iter()
            .copied()
            .find(|c| c.as_str() == s)
    }

    /// The evidence tier this class implies. See [`EvidenceTier`] for why `Computed`
    /// does not get one of its own.
    pub fn evidence_tier(&self) -> EvidenceTier {
        match self {
            // Checkable against something outside the run: a published number, a
            // stated device spec, algebra, or an identity with a known answer.
            ProvenanceClass::Published
            | ProvenanceClass::Spec
            | ProvenanceClass::ClosedForm
            | ProvenanceClass::Constant
            | ProvenanceClass::Measured
            | ProvenanceClass::InternalConsistency => EvidenceTier::Validated,
            // An allocation or a model magnitude: documented, defensible, unmeasured.
            ProvenanceClass::Modelled | ProvenanceClass::ModelledInput => EvidenceTier::Modelled,
            // Whatever the caller supplied. At the defaults a report runs at, that is
            // the scenario's illustrative example value.
            ProvenanceClass::Input => EvidenceTier::Illustrative,
            // A computed number is exactly as strong as the model behind it.
            ProvenanceClass::Computed | ProvenanceClass::Derived => {
                EvidenceTier::InheritsScenarioLabel
            }
            // A disjunction, so the tier is one too — the report's own value decides.
            ProvenanceClass::MeasuredOrInput => EvidenceTier::DependsOnInput,
        }
    }
}

/// How strong the evidence behind a number is — the crate's honesty axis, stated per
/// field instead of per capability.
///
/// Three of the five variants are the tiers a paper would quote. The other two exist
/// because inventing a per-field tier where the class does not determine one would be a
/// fabrication: a computed number carries the strength of the model that produced it
/// (already stated, once, in the report's `label`), and a disjunctive class carries a
/// disjunctive tier.
#[derive(Clone, Copy, PartialEq, Eq, Debug, Hash, PartialOrd, Ord)]
pub enum EvidenceTier {
    /// Checkable against an oracle outside the run: a published figure, a stated device
    /// spec, algebra, a defined constant, or a real observed series.
    Validated,
    /// A documented model or allocation, not a measurement.
    Modelled,
    /// An example value chosen to make the scenario runnable.
    Illustrative,
    /// Derived: read the tier off the report's own honesty `label`.
    InheritsScenarioLabel,
    /// The class is a disjunction ([`ProvenanceClass::MeasuredOrInput`]): the tier is
    /// Validated when the caller supplies no override and Illustrative when they do.
    DependsOnInput,
}

impl EvidenceTier {
    /// The wire string used in the emitted schema.
    pub fn as_str(&self) -> &'static str {
        match self {
            EvidenceTier::Validated => "validated",
            EvidenceTier::Modelled => "modelled",
            EvidenceTier::Illustrative => "illustrative",
            EvidenceTier::InheritsScenarioLabel => "inherits-scenario-label",
            EvidenceTier::DependsOnInput => "depends-on-input",
        }
    }
}

/// One row of a scenario's units table: the path it describes, the unit that path is
/// measured in, where the number came from, and what it means.
///
/// Scenario modules declare a `&[FieldUnit]` and render it with [`units_block`], so
/// every block in the crate has the same shape without each module re-implementing the
/// rendering.
#[derive(Clone, Copy, Debug)]
pub struct FieldUnit {
    /// The emitted field's path, in the grammar this module's documentation states.
    pub path: &'static str,
    /// The unit, as a symbol (`"m"`, `"s"`, `"dB-Hz"`) — `"1"` for a dimensionless
    /// quantity and `"count"` for a cardinality.
    pub unit: &'static str,
    /// Where the number came from.
    pub provenance: ProvenanceClass,
    /// What the quantity is, in one sentence. `""` for no definition.
    pub definition: &'static str,
}

/// Render a units table as the `units` object a result document carries: a map from
/// path to `{"unit", "provenance"}`, plus `"note"` when the row states a definition.
pub fn units_block(fields: &[FieldUnit]) -> Value {
    let mut m = Map::with_capacity(fields.len());
    for f in fields {
        let mut e = Map::new();
        e.insert("unit".to_string(), Value::from(f.unit));
        e.insert("provenance".to_string(), Value::from(f.provenance.as_str()));
        if !f.definition.is_empty() {
            e.insert("note".to_string(), Value::from(f.definition));
        }
        m.insert(f.path.to_string(), Value::Object(e));
    }
    Value::Object(m)
}

/// Every numeric leaf of `doc`, as canonical paths, sorted and deduplicated.
///
/// The top-level `units` object is skipped — it describes the document, it is not part
/// of it. Arrays contribute a single `[]`-suffixed segment shared by every element, so
/// a thousand-row table yields one path per column, not one per cell.
pub fn numeric_leaf_paths(doc: &Value) -> Vec<String> {
    let mut out = Vec::new();
    walk(doc, "", true, &mut out);
    out.sort();
    out.dedup();
    out
}

fn walk(v: &Value, prefix: &str, at_root: bool, out: &mut Vec<String>) {
    match v {
        Value::Number(_) => out.push(prefix.to_string()),
        Value::Array(a) => {
            let p = format!("{prefix}[]");
            for e in a {
                walk(e, &p, false, out);
            }
        }
        Value::Object(m) => {
            for (k, val) in m {
                if at_root && k == "units" {
                    continue;
                }
                let p = if prefix.is_empty() {
                    k.clone()
                } else {
                    format!("{prefix}.{k}")
                };
                walk(val, &p, false, out);
            }
        }
        _ => {}
    }
}

/// Whether a units-block key is a legal path pattern: at least one segment, no empty
/// segment, and `*` neither first nor last (see the module documentation).
pub fn is_legal_pattern(key: &str) -> bool {
    let segs: Vec<&str> = key.split('.').collect();
    if segs.is_empty() || segs.iter().any(|s| s.is_empty()) {
        return false;
    }
    let wild = |s: &str| s == "*" || s == "*[]";
    !wild(segs[0]) && !wild(segs[segs.len() - 1])
}

/// Whether the units-block key `key` describes the emitted path `path`.
///
/// Segment-by-segment: a key segment matches a path segment when it is identical, when
/// it is the same name with the `[]` suffix dropped, or when it is the `*` wildcard.
pub fn pattern_matches(key: &str, path: &str) -> bool {
    let k: Vec<&str> = key.split('.').collect();
    let p: Vec<&str> = path.split('.').collect();
    if k.len() != p.len() {
        return false;
    }
    k.iter()
        .zip(p.iter())
        .all(|(ks, ps)| *ks == "*" || *ks == "*[]" || ks == ps || *ks == ps.trim_end_matches("[]"))
}

/// The units entry describing `path`, if the block has one. Tries the exact key first,
/// then falls back to a pattern scan so the legacy unsuffixed and wildcard spellings
/// resolve too.
pub fn lookup<'a>(units: &'a Map<String, Value>, path: &str) -> Option<(&'a str, &'a Value)> {
    if let Some((k, v)) = units.get_key_value(path) {
        return Some((k.as_str(), v));
    }
    units
        .iter()
        .find(|(k, _)| is_legal_pattern(k) && pattern_matches(k, path))
        .map(|(k, v)| (k.as_str(), v))
}

/// One audited field: the emitted path and the units entry that describes it.
#[derive(Clone, Debug)]
pub struct AuditedField {
    /// The emitted path, in canonical (`[]`-suffixed) spelling.
    pub path: String,
    /// The units-block key that matched it — the same string when the block spells the
    /// path canonically, a legacy or wildcard pattern otherwise.
    pub matched_by: String,
    /// The declared unit.
    pub unit: String,
    /// The declared provenance class.
    pub provenance: ProvenanceClass,
    /// The declared definition (`note`), if the entry carries one.
    pub definition: Option<String>,
}

/// A units entry that is present but not usable.
#[derive(Clone, Debug)]
pub struct MalformedEntry {
    /// The units-block key.
    pub key: String,
    /// Why it is not usable.
    pub reason: String,
}

/// The result of auditing one result document against its own `units` block.
#[derive(Clone, Debug, Default)]
pub struct DocumentAudit {
    /// Emitted numeric fields that carry both a unit and a valid provenance class.
    pub covered: Vec<AuditedField>,
    /// Emitted numeric fields with no usable units entry — the gap the gate fails on.
    pub missing: Vec<String>,
    /// Units entries that are malformed, whatever they describe.
    pub malformed: Vec<MalformedEntry>,
}

impl DocumentAudit {
    /// Emitted numeric fields seen, covered or not.
    pub fn field_count(&self) -> usize {
        self.covered.len() + self.missing.len()
    }

    /// Whether every emitted numeric field is described and every entry is well formed.
    pub fn is_complete(&self) -> bool {
        self.missing.is_empty() && self.malformed.is_empty()
    }
}

/// Audit one result document: walk every numeric leaf and look each one up in the
/// document's own `units` block.
///
/// A units entry is usable only when its `unit` is a non-empty string and its
/// `provenance` names a [`ProvenanceClass`]. An entry failing either test is recorded
/// in [`DocumentAudit::malformed`] and does **not** cover the field it names, so a
/// placeholder cannot buy coverage.
pub fn audit_document(doc: &Value) -> DocumentAudit {
    let empty = Map::new();
    let units = doc
        .get("units")
        .and_then(|u| u.as_object())
        .unwrap_or(&empty);

    let mut audit = DocumentAudit::default();

    for (key, entry) in units {
        if !is_legal_pattern(key) {
            audit.malformed.push(MalformedEntry {
                key: key.clone(),
                reason: "not a legal path pattern (empty segment, or `*` first or last)"
                    .to_string(),
            });
            continue;
        }
        match entry_fields(entry) {
            Ok(_) => {}
            Err(reason) => audit.malformed.push(MalformedEntry {
                key: key.clone(),
                reason,
            }),
        }
    }

    for path in numeric_leaf_paths(doc) {
        match lookup(units, &path) {
            Some((key, entry)) => match entry_fields(entry) {
                Ok((unit, provenance, definition)) => audit.covered.push(AuditedField {
                    path,
                    matched_by: key.to_string(),
                    unit: unit.to_string(),
                    provenance,
                    definition: definition.map(str::to_string),
                }),
                Err(_) => audit.missing.push(path),
            },
            None => audit.missing.push(path),
        }
    }

    audit
}

/// Pull `(unit, provenance, note)` out of a units entry, or say why it is not usable.
fn entry_fields(entry: &Value) -> Result<(&str, ProvenanceClass, Option<&str>), String> {
    let obj = entry
        .as_object()
        .ok_or_else(|| "entry is not an object".to_string())?;
    let unit = obj
        .get("unit")
        .and_then(|u| u.as_str())
        .ok_or_else(|| "no `unit` string".to_string())?;
    if unit.is_empty() {
        return Err("`unit` is the empty string".to_string());
    }
    let prov_str = obj
        .get("provenance")
        .and_then(|p| p.as_str())
        .ok_or_else(|| "no `provenance` string".to_string())?;
    let provenance = ProvenanceClass::parse(prov_str)
        .ok_or_else(|| format!("`provenance` {prov_str:?} is outside the vocabulary"))?;
    let note = obj.get("note").and_then(|n| n.as_str());
    Ok((unit, provenance, note))
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn the_provenance_vocabulary_round_trips() {
        for c in ProvenanceClass::ALL {
            assert_eq!(ProvenanceClass::parse(c.as_str()), Some(*c));
        }
        assert_eq!(ProvenanceClass::parse("guessed"), None);
        assert_eq!(ProvenanceClass::parse(""), None);
    }

    #[test]
    fn every_provenance_class_states_an_evidence_tier() {
        // The mapping is total, and only the two derived classes defer to the label.
        for c in ProvenanceClass::ALL {
            let t = c.evidence_tier();
            if matches!(c, ProvenanceClass::Computed | ProvenanceClass::Derived) {
                assert_eq!(t, EvidenceTier::InheritsScenarioLabel, "{c:?}");
            } else {
                assert_ne!(t, EvidenceTier::InheritsScenarioLabel, "{c:?}");
            }
        }
        // The vocabulary is exactly the set of spellings released documents carry.
        let spellings: Vec<&str> = ProvenanceClass::ALL.iter().map(|c| c.as_str()).collect();
        let mut sorted = spellings.clone();
        sorted.sort_unstable();
        sorted.dedup();
        assert_eq!(
            sorted.len(),
            spellings.len(),
            "duplicate provenance spelling"
        );
    }

    #[test]
    fn arrays_contribute_one_suffixed_segment_shared_by_every_row() {
        let doc = json!({
            "a": 1,
            "rows": [ {"x": 1.0, "y": 2}, {"x": 3.0, "y": 4} ],
            "nested": {"deep": [[1, 2], [3]]},
            "text": "not a number",
            "units": {"a": {"unit": "m", "provenance": "input"}},
        });
        assert_eq!(
            numeric_leaf_paths(&doc),
            vec![
                "a".to_string(),
                "nested.deep[][]".to_string(),
                "rows[].x".to_string(),
                "rows[].y".to_string(),
            ]
        );
    }

    #[test]
    fn both_array_spellings_and_the_wildcard_resolve_to_the_same_leaf() {
        assert!(pattern_matches("rows[].x", "rows[].x"));
        assert!(pattern_matches("rows.x", "rows[].x"));
        assert!(pattern_matches("t.rows[].*.rms", "t.rows[].ut1.rms"));
        assert!(!pattern_matches("rows[].x", "rows[].y"));
        assert!(!pattern_matches("rows[].x", "other[].x"));
        assert!(!pattern_matches("rows[].x", "a.rows[].x"));
    }

    #[test]
    fn a_wildcard_may_not_stand_alone_or_swallow_the_field_name() {
        assert!(is_legal_pattern("a.*.b"));
        assert!(!is_legal_pattern("*"));
        assert!(!is_legal_pattern("*.b"));
        assert!(!is_legal_pattern("a.*"));
        assert!(!is_legal_pattern("a..b"));
        // …and an illegal pattern never covers anything, even if it would match.
        let doc = json!({"a": {"b": 1}, "units": {"*.b": {"unit": "m", "provenance": "input"}}});
        let audit = audit_document(&doc);
        assert_eq!(audit.missing, vec!["a.b".to_string()]);
        assert_eq!(audit.malformed.len(), 1);
    }

    #[test]
    fn a_placeholder_entry_does_not_buy_coverage() {
        for bad in [
            json!({"provenance": "input"}),
            json!({"unit": "m"}),
            json!({"unit": "", "provenance": "input"}),
            json!({"unit": "m", "provenance": "vibes"}),
            json!("m"),
        ] {
            let doc = json!({"a": 1.0, "units": {"a": bad}});
            let audit = audit_document(&doc);
            assert_eq!(audit.missing, vec!["a".to_string()], "{doc}");
            assert_eq!(audit.malformed.len(), 1, "{doc}");
            assert!(!audit.is_complete());
        }
    }

    #[test]
    fn a_complete_block_covers_every_leaf_and_carries_the_definitions() {
        let doc = json!({
            "a": 1.0,
            "rows": [{"x": 2.0}],
            "units": {
                "a": {"unit": "m", "provenance": "input", "note": "the a"},
                "rows[].x": {"unit": "s", "provenance": "computed"},
            },
        });
        let audit = audit_document(&doc);
        assert!(audit.is_complete(), "{:?}", audit);
        assert_eq!(audit.field_count(), 2);
        assert_eq!(audit.covered[0].definition.as_deref(), Some("the a"));
        assert_eq!(audit.covered[1].definition, None);
        assert_eq!(audit.covered[1].provenance, ProvenanceClass::Computed);
    }

    #[test]
    fn the_renderer_emits_the_shape_the_audit_reads() {
        let block = units_block(&[
            FieldUnit {
                path: "a",
                unit: "m",
                provenance: ProvenanceClass::Input,
                definition: "the a",
            },
            FieldUnit {
                path: "b",
                unit: "s",
                provenance: ProvenanceClass::Computed,
                definition: "",
            },
        ]);
        assert_eq!(block["a"]["unit"], "m");
        assert_eq!(block["a"]["provenance"], "input");
        assert_eq!(block["a"]["note"], "the a");
        assert!(block["b"].get("note").is_none());

        let doc = json!({"a": 1.0, "b": 2.0, "units": block});
        assert!(audit_document(&doc).is_complete());
    }
}
