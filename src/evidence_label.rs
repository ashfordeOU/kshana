// SPDX-License-Identifier: AGPL-3.0-only
//! **The evidence label every run output carries.**
//!
//! Each figure and table a run writes (the result JSON, the chart SVG, the CSV table) names the evidence tier of the
//! verification-matrix rows behind it, and the ids of those rows. Nothing here is typed: the rows are the ones the
//! run's advanced report lists ([`crate::advanced_report::exercised_requirements`], from
//! [`crate::advanced_report::KIND_CAPABILITIES`] and the matrix), the status of a row is read from
//! [`crate::verification::verification_matrix`], and a row's id is computed from its requirement text.
//!
//! **Tier.** The headline tier is the *weakest* of the rows (`PARTNER` below `MODELLED` below `VALIDATED`): a run that
//! leans on one modelled row is labelled MODELLED however many validated rows sit beside it. The label can therefore
//! never claim more than its weakest row; it states what the ledger says, it upgrades nothing.
//!
//! **Row id.** Each matrix row has a stable, explicit `id` ([`crate::verification::VerificationItem::id`], rendered as the
//! `ID` column of `docs/VERIFICATION-MATRIX.md`): `VM-` and eight hex digits, seeded once from the SHA-256 of the
//! requirement text as it stood in 0.40 ([`seed_id`]) and never recomputed, so rewording a requirement keeps its id. The
//! test `evidence_labels_doc_sync` reads ids and statuses from the markdown ledger independently, and
//! `tests/fixtures/evidence_ids.txt` freezes every id ever issued.
//!
//! **Placement.** JSON: a top-level `evidence` key, inserted before the trailing `figure_tiers` block when there is one
//! (so that block stays the last key) and appended otherwise; [`strip_json`] removes it, byte for byte. SVG: a
//! `<metadata id="kshana-evidence">` element and a visible line in a strip added under the chart; [`strip_svg`] removes
//! both. CSV: leading `# evidence: ...` comment lines (read with `comment='#'`); [`strip_csv`] removes them.

use crate::palette::chart::{BG, FONT_SANS, MUTED};
use crate::verification::{verification_matrix, VerificationStatus};
use serde::Serialize;
use sha2::{Digest, Sha256};

/// The top-level key of the label in a result document.
pub const EVIDENCE_KEY: &str = "evidence";
/// The `id` of the SVG metadata element.
pub const SVG_METADATA_ID: &str = "kshana-evidence";
/// The prefix of every CSV label line.
pub const CSV_PREFIX: &str = "# evidence:";
/// How a row id is made, as the label itself states it.
pub const ID_RULE: &str =
    "VM- and the first 8 hex digits of the SHA-256 of the row's requirement text";
/// Height of the strip added under an SVG, px.
const STRIP: f64 = 16.0;

/// One ledger row behind a figure.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct EvidenceRow {
    /// `VM-` and eight hex digits ([`row_id`]).
    pub id: String,
    /// The matrix `requirement` text.
    pub requirement: String,
    /// `VALIDATED`, `MODELLED` or `PARTNER`.
    pub status: String,
}

/// The evidence label of a run.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct EvidenceLabel {
    /// The weakest tier of [`EvidenceLabel::rows`].
    pub tier: String,
    /// Where the rows come from.
    pub matrix: String,
    /// How the ids are made.
    pub id_rule: String,
    /// The rows, in matrix order.
    pub rows: Vec<EvidenceRow>,
}

/// The seed of a row id: `VM-` and the first eight hex digits of the SHA-256 of the requirement text. Used once, to issue
/// the ids in `src/verification.rs`; a row's id is its `id` field, not this function of its current wording.
pub fn seed_id(requirement: &str) -> String {
    let h = Sha256::digest(requirement.as_bytes());
    format!("VM-{}", hex::encode(&h[..4]))
}

/// The stable id of the matrix row whose requirement text is `requirement`.
pub fn row_id(requirement: &str) -> Option<&'static str> {
    verification_matrix()
        .into_iter()
        .find(|r| r.requirement == requirement)
        .map(|r| r.id)
}

fn rank(status: &str) -> u8 {
    match status {
        "PARTNER" => 0,
        "MODELLED" => 1,
        _ => 2,
    }
}

impl EvidenceLabel {
    /// The label of a set of `(requirement, status)` pairs; `None` for no rows.
    pub fn from_rows(rows: &[(String, VerificationStatus)]) -> Option<Self> {
        if rows.is_empty() {
            return None;
        }
        let matrix = verification_matrix();
        let rows: Vec<EvidenceRow> = rows
            .iter()
            .map(|(req, st)| EvidenceRow {
                // A requirement the matrix does not hold has no id; the id field then says so, and the doc-sync test
                // fails on it (the report only ever passes matrix rows).
                id: matrix
                    .iter()
                    .find(|m| &m.requirement == req)
                    .map_or("VM-unknown", |m| m.id)
                    .to_string(),
                requirement: req.clone(),
                status: st.tag().to_string(),
            })
            .collect();
        let tier = rows
            .iter()
            .map(|r| r.status.as_str())
            .min_by_key(|s| rank(s))
            .unwrap_or("MODELLED")
            .to_string();
        Some(Self {
            tier,
            matrix: "docs/VERIFICATION-MATRIX.md".to_string(),
            id_rule: ID_RULE.to_string(),
            rows,
        })
    }

    /// The label of the run of `src` that produced `json`, from the rows its advanced report lists.
    pub fn for_run(src: &str, json: &str) -> Result<Self, String> {
        let rows = crate::advanced_report::exercised_requirements(src, json)?;
        Self::from_rows(&rows)
            .ok_or_else(|| "the run exercised no verification-matrix row".to_string())
    }

    /// The row ids, space separated.
    pub fn ids(&self) -> String {
        self.rows
            .iter()
            .map(|r| r.id.as_str())
            .collect::<Vec<_>>()
            .join(" ")
    }

    /// The one-line form shown under a chart: the tier and up to three ids.
    pub fn line(&self) -> String {
        let n = self.rows.len();
        let shown: Vec<&str> = self.rows.iter().take(3).map(|r| r.id.as_str()).collect();
        let more = if n > 3 {
            format!(" +{} more", n - 3)
        } else {
            String::new()
        };
        format!(
            "Evidence: {} \u{00b7} {} ledger row{} {}{}",
            self.tier,
            n,
            if n == 1 { "" } else { "s" },
            shown.join(" "),
            more
        )
    }

    /// The CSV comment lines.
    pub fn csv_header(&self) -> String {
        format!(
            "{CSV_PREFIX} {} rows {}\n# evidence-matrix: {} ({})\n",
            self.tier,
            self.ids().replace(' ', ";"),
            self.matrix,
            self.id_rule
        )
    }

    /// `json` with the label as the top-level `evidence` key: before a trailing `figure_tiers` block, else last.
    pub fn apply_json(&self, json: &str) -> Result<String, String> {
        if json.contains(&format!("\"{EVIDENCE_KEY}\":")) && strip_json(json).is_some() {
            return Err("the result document already carries an `evidence` key".to_string());
        }
        let block = serde_json::to_value(self).map_err(|e| e.to_string())?;
        let body = json.trim_end();
        let tail = &json[body.len()..];
        let ft_pretty = format!(",\n  \"{}\": ", crate::api::FIGURE_TIERS_KEY);
        let ft_compact = format!(",\"{}\":", crate::api::FIGURE_TIERS_KEY);
        let pretty = body.ends_with("\n}");
        let (insert_at, entry) = if pretty {
            let rendered = serde_json::to_string_pretty(&block).map_err(|e| e.to_string())?;
            let nested = rendered.replace('\n', "\n  ");
            let entry = format!(",\n  \"{EVIDENCE_KEY}\": {nested}");
            match body.rfind(&ft_pretty).filter(|_| body.contains(&ft_pretty)) {
                Some(at) => (at, entry),
                None => (body.len() - 2, entry),
            }
        } else if body.ends_with('}') && body.starts_with('{') {
            let rendered = serde_json::to_string(&block).map_err(|e| e.to_string())?;
            let entry = format!(",\"{EVIDENCE_KEY}\":{rendered}");
            match body.rfind(&ft_compact) {
                Some(at) => (at, entry),
                None => (body.len() - 1, entry),
            }
        } else {
            return Err("the result document is not a JSON object".to_string());
        };
        let mut out = String::with_capacity(json.len() + entry.len());
        out.push_str(&body[..insert_at]);
        out.push_str(&entry);
        out.push_str(&body[insert_at..]);
        out.push_str(tail);
        Ok(out)
    }

    /// `svg` with the metadata element and the visible strip; unchanged if it has no closing `</svg>`.
    pub fn apply_svg(&self, svg: String) -> String {
        let Some(end) = svg.rfind("</svg>") else {
            return svg;
        };
        let Some(root_end) = svg.find('>') else {
            return svg;
        };
        let root = &svg[..root_end];
        let from_attrs = (
            attr_value(root, "width").and_then(|v| v.parse::<f64>().ok()),
            attr_value(root, "height").and_then(|v| v.parse::<f64>().ok()),
        );
        let from_box = attr_value(root, "viewBox").and_then(|v| {
            let p: Vec<f64> = v
                .split_whitespace()
                .filter_map(|x| x.parse().ok())
                .collect();
            (p.len() == 4).then(|| (p[2], p[3]))
        });
        let (Some(w), Some(h)) = (
            from_attrs.0.or(from_box.map(|b| b.0)),
            from_attrs.1.or(from_box.map(|b| b.1)),
        ) else {
            // Dimensions unknown: carry the machine-readable element only.
            let mut s = svg;
            s.insert_str(end, &self.metadata_element());
            return s;
        };
        let mut s = svg;
        let strip = format!(
            "{}<rect x=\"0\" y=\"{h:.0}\" width=\"{w:.0}\" height=\"{STRIP:.0}\" fill=\"{BG}\"/><text x=\"8\" y=\"{:.0}\" fill=\"{MUTED}\" font-size=\"10\" font-family=\"{FONT_SANS}\">{}</text>",
            self.metadata_element(),
            h + STRIP - 5.0,
            xml_escape(&self.line()),
        );
        s.insert_str(end, &strip);
        let new_root = resize_root(&s[..root_end], STRIP);
        s.replace_range(..root_end, &new_root);
        s
    }

    fn metadata_element(&self) -> String {
        let rows: Vec<String> = self
            .rows
            .iter()
            .map(|r| format!("{} {} {}", r.id, r.status, r.requirement))
            .collect();
        format!(
            "<metadata id=\"{SVG_METADATA_ID}\" data-tier=\"{}\" data-rows=\"{}\">{}</metadata>",
            self.tier,
            self.ids().replace(' ', ";"),
            xml_escape(&rows.join(" | "))
        )
    }

    /// `csv` with the comment lines in front.
    pub fn apply_csv(&self, csv: &str) -> String {
        format!("{}{csv}", self.csv_header())
    }
}

fn xml_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}

/// The span (start, end) of attribute `name`'s value in a root tag, and its quote character. The name must follow
/// whitespace, so `width` does not match `stroke-width`.
fn attr_span(root: &str, name: &str) -> Option<(usize, usize, char)> {
    for q in ['"', '\''] {
        let needle = format!("{name}={q}");
        let mut from = 0;
        while let Some(i) = root[from..].find(&needle) {
            let at = from + i;
            if root[..at].ends_with(char::is_whitespace) {
                let start = at + needle.len();
                let end = start + root[start..].find(q)?;
                return Some((start, end, q));
            }
            from = at + needle.len();
        }
    }
    None
}

fn attr_value<'a>(root: &'a str, name: &str) -> Option<&'a str> {
    attr_span(root, name).map(|(a, b, _)| &root[a..b])
}

fn fmt_dim(v: f64) -> String {
    if v.fract() == 0.0 {
        format!("{v:.0}")
    } else {
        format!("{v}")
    }
}

/// The root tag with its `height` and `viewBox` height changed by `delta`.
fn resize_root(root: &str, delta: f64) -> String {
    let mut out = root.to_string();
    // The viewBox first: it comes after or before `height` in the tag, and the spans move when one is rewritten.
    if let Some((a, b, _)) = attr_span(&out, "viewBox") {
        let parts: Vec<String> = out[a..b].split_whitespace().map(str::to_string).collect();
        if parts.len() == 4 {
            if let Ok(vh) = parts[3].parse::<f64>() {
                let new = format!(
                    "{} {} {} {}",
                    parts[0],
                    parts[1],
                    parts[2],
                    fmt_dim(vh + delta)
                );
                out.replace_range(a..b, &new);
            }
        }
    }
    if let Some((a, b, _)) = attr_span(&out, "height") {
        if let Ok(h) = out[a..b].parse::<f64>() {
            let new = fmt_dim(h + delta);
            out.replace_range(a..b, &new);
        }
    }
    out
}

/// `json` without its `evidence` key (the document as it was before the label), byte for byte; `None` if it has none.
pub fn strip_json(json: &str) -> Option<String> {
    let body = json.trim_end();
    let tail = &json[body.len()..];
    let doc: serde_json::Value = serde_json::from_str(json).ok()?;
    doc.get(EVIDENCE_KEY)?;
    let pretty = body.ends_with("\n}");
    let marker = if pretty {
        format!(",\n  \"{EVIDENCE_KEY}\": ")
    } else {
        format!(",\"{EVIDENCE_KEY}\":")
    };
    let at = body.rfind(&marker)?;
    // The block runs to the next top-level key (`,\n  "` pretty, `,"` compact) or to the closing brace.
    let after = &body[at + marker.len()..];
    let mut depth = 0i32;
    let mut in_str = false;
    let mut esc = false;
    let mut end = None;
    for (i, c) in after.char_indices() {
        if in_str {
            if esc {
                esc = false;
            } else if c == '\\' {
                esc = true;
            } else if c == '"' {
                in_str = false;
            }
            continue;
        }
        match c {
            '"' => in_str = true,
            '{' | '[' => depth += 1,
            '}' | ']' => {
                depth -= 1;
                if depth == 0 {
                    end = Some(i + 1);
                    break;
                }
            }
            _ => {}
        }
    }
    let end = end?;
    let mut out = String::with_capacity(json.len());
    out.push_str(&body[..at]);
    out.push_str(&after[end..]);
    out.push_str(tail);
    Some(out)
}

/// `svg` without the label (metadata element, strip and the grown canvas), byte for byte; `None` if it has none.
pub fn strip_svg(svg: &str) -> Option<String> {
    let m0 = svg.find(&format!("<metadata id=\"{SVG_METADATA_ID}\""))?;
    let m1 = m0 + svg[m0..].find("</metadata>")? + "</metadata>".len();
    let mut s = String::with_capacity(svg.len());
    s.push_str(&svg[..m0]);
    let rest = &svg[m1..];
    // The visible strip: a rect and a text that follow the metadata element.
    let rest = if rest.starts_with("<rect ") {
        let t_end = rest.find("</text>").map(|i| i + "</text>".len())?;
        &rest[t_end..]
    } else {
        rest
    };
    s.push_str(rest);
    // Shrink the canvas back.
    let root_end = s.find('>')?;
    let new_root = resize_root(&s[..root_end], -STRIP);
    s.replace_range(..root_end, &new_root);
    Some(s)
}

/// `csv` without its leading label lines; `None` if it has none.
pub fn strip_csv(csv: &str) -> Option<String> {
    if !csv.starts_with(CSV_PREFIX) {
        return None;
    }
    let mut lines = csv.splitn(3, '\n');
    lines.next()?;
    let second = lines.next()?;
    if !second.starts_with("# evidence-matrix:") {
        return None;
    }
    Some(lines.next().unwrap_or("").to_string())
}

/// The ledger rows behind the output of each tool that writes figures or tables outside `api::run_toml`, by stable row id.
/// This is a crosswalk, like [`crate::advanced_report::KIND_CAPABILITIES`]: it says which rows a tool leans on; the
/// status, wording and tier come from the matrix. `tests/evidence_labels_doc_sync.rs` checks every id exists.
pub const TOOL_ROWS: &[(&str, &[&str])] = &[
    // `kshana receiver-trust`, `receiver-trust live`, the MCP and Python receiver-log assessments.
    (
        "receiver-trust",
        &["VM-f220938a", "VM-834a5b4f", "VM-f7f6e62d", "VM-51f0c17d"],
    ),
    // `kshana jammertest score`.
    (
        "jammertest-score",
        &["VM-47968885", "VM-35257d18", "VM-f220938a", "VM-834a5b4f"],
    ),
    // `kshana interference-map route` exposure report.
    ("interference-map", &["VM-c7e45641"]),
    // `kshana iq acquire --json/--csv`.
    ("iq-acquire", &["VM-3ed8a076", "VM-0430afb5"]),
    // `kshana iq track --summary` and `kshana iq sweep --json/--csv`.
    ("iq-track", &["VM-3ed8a076", "VM-77d4bf93"]),
    // `kshana iq monitor --json`.
    ("iq-monitor", &["VM-59bb0091", "VM-6254a75d"]),
];

impl EvidenceLabel {
    /// The label of the rows with these stable ids; `None` if the list is empty or an id is not in the matrix.
    pub fn for_ids(ids: &[&str]) -> Option<Self> {
        let matrix = verification_matrix();
        let mut rows = Vec::new();
        for id in ids {
            let it = matrix.iter().find(|m| m.id == *id)?;
            rows.push((it.requirement.to_string(), it.status));
        }
        // Matrix order, as for a run's label.
        rows.sort_by_key(|(req, _)| matrix.iter().position(|m| m.requirement == req.as_str()));
        Self::from_rows(&rows)
    }

    /// The label of a tool's output ([`TOOL_ROWS`]); `None` for a tool not listed.
    pub fn for_tool(tool: &str) -> Option<Self> {
        let (_, ids) = TOOL_ROWS.iter().find(|(t, _)| *t == tool)?;
        Self::for_ids(ids)
    }
}

/// `json` labelled for `tool` ([`TOOL_ROWS`]); an error if the tool or its rows are not in the matrix.
pub fn label_json(tool: &str, json: &str) -> Result<String, String> {
    EvidenceLabel::for_tool(tool)
        .ok_or_else(|| format!("no evidence rows are listed for `{tool}`"))?
        .apply_json(json)
}

/// `csv` labelled for `tool`.
pub fn label_csv(tool: &str, csv: &str) -> Result<String, String> {
    Ok(EvidenceLabel::for_tool(tool)
        .ok_or_else(|| format!("no evidence rows are listed for `{tool}`"))?
        .apply_csv(csv))
}

/// The matrix's status of the row with this requirement text, for a label check.
pub fn matrix_status(requirement: &str) -> Option<VerificationStatus> {
    verification_matrix()
        .into_iter()
        .find(|r| r.requirement == requirement)
        .map(|r| r.status)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn label() -> EvidenceLabel {
        EvidenceLabel::from_rows(&[
            ("Alpha".to_string(), VerificationStatus::Validated),
            ("Beta & <gamma>".to_string(), VerificationStatus::Modelled),
        ])
        .unwrap()
    }

    #[test]
    fn the_tier_is_the_weakest_row_and_never_stronger() {
        assert_eq!(label().tier, "MODELLED");
        let all_v =
            EvidenceLabel::from_rows(&[("A".into(), VerificationStatus::Validated)]).unwrap();
        assert_eq!(all_v.tier, "VALIDATED");
        let with_partner = EvidenceLabel::from_rows(&[
            ("A".into(), VerificationStatus::Validated),
            ("B".into(), VerificationStatus::Modelled),
            ("C".into(), VerificationStatus::PartnerOwned),
        ])
        .unwrap();
        assert_eq!(with_partner.tier, "PARTNER");
        assert!(EvidenceLabel::from_rows(&[]).is_none());
    }

    #[test]
    fn a_seed_id_is_computed_from_the_requirement_text_and_a_row_id_is_the_matrix_field() {
        let id = seed_id("Alpha");
        assert!(id.starts_with("VM-") && id.len() == 11);
        assert_eq!(id, seed_id("Alpha"));
        assert_ne!(id, seed_id("Alpha "));
        let first = verification_matrix().into_iter().next().unwrap();
        assert_eq!(row_id(first.requirement), Some(first.id));
        assert_eq!(row_id("not a row"), None);
    }

    #[test]
    fn json_label_goes_before_figure_tiers_and_strips_back_exactly() {
        let l = label();
        let plain = "{\n  \"a\": 1,\n  \"units\": {}\n}";
        let with = l.apply_json(plain).unwrap();
        assert!(with.contains("\"evidence\""));
        assert_eq!(strip_json(&with).as_deref(), Some(plain));
        let tiered = "{\n  \"a\": 1,\n  \"figure_tiers\": {\n    \"x\": true\n  }\n}";
        let with = l.apply_json(tiered).unwrap();
        assert!(with.find("\"evidence\"").unwrap() < with.find("\"figure_tiers\"").unwrap());
        assert_eq!(strip_json(&with).as_deref(), Some(tiered));
        let compact = "{\"a\":1,\"figure_tiers\":{\"x\":true}}";
        let with = l.apply_json(compact).unwrap();
        assert_eq!(strip_json(&with).as_deref(), Some(compact));
        let compact2 = "{\"a\":1}";
        assert_eq!(
            strip_json(&l.apply_json(compact2).unwrap()).as_deref(),
            Some(compact2)
        );
        assert!(l.apply_json(&l.apply_json(plain).unwrap()).is_err());
    }

    #[test]
    fn svg_label_adds_metadata_and_a_strip_and_strips_back_exactly() {
        let l = label();
        let svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"800\" height=\"420\" viewBox=\"0 0 800 420\"><rect width=\"800\" height=\"420\"/></svg>".to_string();
        let with = l.apply_svg(svg.clone());
        assert!(with.contains("id=\"kshana-evidence\""));
        assert!(with.contains("height=\"436\"") && with.contains("viewBox=\"0 0 800 436\""));
        assert!(with.contains("Evidence: MODELLED"));
        assert!(with.contains("Beta &amp; &lt;gamma&gt;"));
        assert_eq!(strip_svg(&with), Some(svg));
    }

    #[test]
    fn single_quoted_attributes_and_stroke_width_are_handled() {
        let l = label();
        let svg = "<svg xmlns='http://www.w3.org/2000/svg' stroke-width='2' width='320' height='220'><rect/></svg>".to_string();
        let with = l.apply_svg(svg.clone());
        assert!(with.contains("height='236'") && with.contains("Evidence: MODELLED"));
        assert!(with.contains("stroke-width='2'"));
        assert_eq!(strip_svg(&with), Some(svg));
    }

    #[test]
    fn a_viewbox_only_svg_gets_the_strip_through_its_viewbox() {
        let l = label();
        let svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 360\"><rect/></svg>"
            .to_string();
        let with = l.apply_svg(svg.clone());
        assert!(with.contains("viewBox=\"0 0 640 376\"") && with.contains("Evidence: MODELLED"));
        assert_eq!(strip_svg(&with), Some(svg));
    }

    #[test]
    fn csv_label_is_comment_lines_and_strips_back_exactly() {
        let l = label();
        let csv = "t,v\n1,2\n";
        let with = l.apply_csv(csv);
        assert!(with.starts_with("# evidence: MODELLED rows VM-"));
        assert_eq!(strip_csv(&with).as_deref(), Some(csv));
    }
}
