// SPDX-License-Identifier: AGPL-3.0-only
//! Auditable assurance report. The buyable, citable artifact: a deterministic
//! JSON/HTML resilience profile with a SHA-256 integrity hash, the
//! validated/modelled split on its face, and an explicit non-certification
//! disclaimer. The honesty discipline is the product, not a footnote, so the
//! report is forbidden (by test) from using certification language.

use crate::resilience::arch::{RdrrFunction, TechniqueCategory, YangCriterion};
use crate::resilience::score::ResilienceProfile;
use crate::verification::VerificationStatus;
use serde::Serialize;
use sha2::{Digest, Sha256};

/// The non-certification disclaimer carried on the face of every report. It is
/// deliberately phrased to avoid claiming certification, compliance, or
/// endorsement (the report tests forbid those tokens).
pub const DISCLAIMER: &str = "Simulation-derived self-assessment aligned to DHS RPCF v2.0. \
This is not a certification or accreditation, and it represents no authority approval \
(DHS, IEEE, or otherwise). Every sub-score is MODELLED unless explicitly tagged VALIDATED, \
and the scores are timing-domain and detection figures of merit, not position-domain accuracy.";

/// Reproducibility provenance for a report.
#[derive(Clone, Debug, Serialize)]
pub struct Provenance {
    pub engine_version: String,
    pub scenario: String,
    pub seed: u64,
    pub note: String,
}

#[derive(Serialize)]
struct ReportDoc<'a> {
    disclaimer: &'a str,
    provenance: &'a Provenance,
    profile: &'a ResilienceProfile,
    validated_count: usize,
    modelled_count: usize,
}

fn status_counts(profile: &ResilienceProfile) -> (usize, usize) {
    let all = profile
        .rpcf
        .values()
        .chain(profile.rdrr.values())
        .chain(profile.yang.values());
    let mut validated = 0;
    let mut modelled = 0;
    for d in all {
        match d.status {
            VerificationStatus::Validated => validated += 1,
            VerificationStatus::Modelled => modelled += 1,
            VerificationStatus::PartnerOwned => {}
        }
    }
    (validated, modelled)
}

/// Canonical JSON report (stable key order via the struct + BTreeMaps).
pub fn assurance_report_json(profile: &ResilienceProfile, prov: &Provenance) -> String {
    let (validated_count, modelled_count) = status_counts(profile);
    let doc = ReportDoc {
        disclaimer: DISCLAIMER,
        provenance: prov,
        profile,
        validated_count,
        modelled_count,
    };
    // `ReportDoc` is a `&str`, a `Provenance`, two `usize`s and a `&ResilienceProfile`.
    // The profile's only maps are keyed by unit enums (TechniqueCategory / RdrrFunction /
    // YangCriterion), which serialise to JSON string keys; there is no tuple/float-keyed
    // map and no fallible custom `Serialize`, so serialisation cannot fail.
    serde_json::to_string_pretty(&doc)
        .expect("ReportDoc's only maps are unit-enum-keyed (string keys), so it always serialises")
}

/// SHA-256 of arbitrary report bytes, lower-case hex.
pub fn integrity_hash(bytes: &[u8]) -> String {
    let mut h = Sha256::new();
    h.update(bytes);
    hex::encode(h.finalize())
}

fn row(name: &str, value: f64, status: VerificationStatus, basis: &str) -> String {
    let value = crate::i18n::num(value, 3);
    let tag = status_word(status);
    format!("<tr><td>{name}</td><td>{value}</td><td>{tag}</td><td>{basis}</td></tr>")
}

/// The status tag of a sub-score in the current language (the JSON report carries the English
/// tag).
fn status_word(status: VerificationStatus) -> String {
    match status {
        VerificationStatus::Validated => crate::t!("fom-verdict-validated"),
        VerificationStatus::Modelled => crate::t!("fom-verdict-modelled"),
        VerificationStatus::PartnerOwned => crate::t!("resilience-report-status-partner"),
    }
}

/// The header row of one table: `first` is the heading of its first column.
fn header_row(first: String) -> String {
    format!(
        "<tr><th>{first}</th><th>{}</th><th>{}</th><th>{}</th></tr>",
        crate::t!("resilience-report-th-subscore"),
        crate::t!("resilience-report-th-status"),
        crate::t!("resilience-report-th-basis")
    )
}

/// Human-readable HTML report. `integrity` is the SHA-256 of the matching JSON
/// report, shown so a reader can verify the artifact has not been altered.
pub fn assurance_report_html(
    profile: &ResilienceProfile,
    prov: &Provenance,
    integrity: &str,
) -> String {
    let (validated, modelled) = status_counts(profile);
    let mut rpcf_rows = String::new();
    for c in TechniqueCategory::all() {
        let d = &profile.rpcf[&c];
        rpcf_rows.push_str(&row(&format!("{c:?}"), d.value, d.status, &d.basis));
    }
    let mut rdrr_rows = String::new();
    for f in RdrrFunction::all() {
        let d = &profile.rdrr[&f];
        rdrr_rows.push_str(&row(&format!("{f:?}"), d.value, d.status, &d.basis));
    }
    let mut yang_rows = String::new();
    for y in YangCriterion::all() {
        let d = &profile.yang[&y];
        yang_rows.push_str(&row(&format!("{y:?}"), d.value, d.status, &d.basis));
    }
    // English has always been `<html>` with no language attribute; another language states its tag.
    let lang = {
        let l = crate::i18n::current();
        if l.is_english() {
            String::new()
        } else {
            format!(" lang=\"{}\"", l.tag())
        }
    };
    let title = crate::t!("resilience-report-title");
    format!(
        "<!doctype html><html{lang}><head><meta charset=\"utf-8\">\
<title>{title}</title></head><body>\
<h1>{title}</h1>\
<p class=\"disclaimer\"><strong>{disclaimer}</strong></p>\
{summary}\
<h2>{h_rpcf}</h2><table>\
{th_rpcf}{rpcf}</table>\
<h2>{h_rdrr}</h2><table>\
{th_rdrr}{rdrr}</table>\
<h2>{h_yang}</h2><table>\
{th_yang}{yang}</table>\
{integrity_p}\
<p>{note}</p></body></html>",
        disclaimer = crate::t!("legal-resilience-disclaimer"),
        summary = crate::t!(
            "resilience-report-summary",
            engine = prov.engine_version,
            scenario = prov.scenario,
            seed = prov.seed,
            n_validated = validated,
            validated = crate::t!("fom-verdict-validated"),
            n_modelled = modelled,
            modelled = crate::t!("fom-verdict-modelled"),
            level = profile.level,
            level_basis = profile.level_basis
        ),
        h_rpcf = crate::t!("resilience-report-h-rpcf"),
        h_rdrr = crate::t!("resilience-report-h-rdrr"),
        h_yang = crate::t!("resilience-report-h-yang"),
        th_rpcf = header_row(crate::t!("resilience-report-th-category")),
        th_rdrr = header_row(crate::t!("resilience-report-th-function")),
        th_yang = header_row(crate::t!("resilience-report-th-criterion")),
        rpcf = rpcf_rows,
        rdrr = rdrr_rows,
        yang = yang_rows,
        integrity_p = crate::t!("resilience-report-integrity", integrity = integrity),
        note = prov.note,
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::resilience::arch::{PntArchitecture, PntSource, SourceKind};
    use crate::resilience::score::{score, SimSummary};

    fn profile() -> ResilienceProfile {
        let a = PntArchitecture::new(
            "demo",
            vec![PntSource::new(SourceKind::GnssMultiBand, 1, 1.0)],
            TechniqueCategory::all(),
        );
        score(
            &a,
            &SimSummary {
                holdover_s: 1800.0,
                availability: 0.8,
                detect_auc: 0.85,
                integrity: 0.7,
                security: 0.6,
                bounded: true,
            },
        )
    }

    fn prov() -> Provenance {
        Provenance {
            engine_version: "0.19.0".into(),
            scenario: "wideband-jam".into(),
            seed: 42,
            note: "modelled, synthetic".into(),
        }
    }

    /// PIN-SCOPE:    the SHA-256 implementation itself, against the published NIST test
    ///               vector for the input "abc".
    /// PIN-EXCLUDES: every kshana document. Nothing this repository emits can move this
    ///               digest — only a broken hash would.
    #[test]
    fn integrity_hash_matches_known_vector() {
        // SHA-256("abc") is a published NIST test vector.
        assert_eq!(
            integrity_hash(b"abc"),
            "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
        );
    }

    #[test]
    fn json_and_html_carry_disclaimer_and_status_tags() {
        let p = profile();
        let json = assurance_report_json(&p, &prov());
        let hash = integrity_hash(json.as_bytes());
        let html = assurance_report_html(&p, &prov(), &hash);
        for doc in [&json, &html] {
            assert!(doc.contains("self-assessment"), "missing disclaimer");
            assert!(doc.contains("MODELLED"), "missing status tag");
        }
        // Hash is deterministic for fixed inputs.
        assert_eq!(
            hash,
            integrity_hash(assurance_report_json(&p, &prov()).as_bytes())
        );
    }

    /// The page as it was written before its text moved to the catalogue (the rows are
    /// built the same way; the template is the original one).
    fn page_before_localisation(p: &ResilienceProfile, pv: &Provenance, integrity: &str) -> String {
        let (validated, modelled) = status_counts(p);
        let rows = |it: Vec<(String, f64, &str, &str)>| -> String {
            it.iter()
                .map(|(n, v, t, b)| {
                    format!("<tr><td>{n}</td><td>{v:.3}</td><td>{t}</td><td>{b}</td></tr>")
                })
                .collect()
        };
        let rpcf = rows(
            TechniqueCategory::all()
                .into_iter()
                .map(|c| {
                    let d = &p.rpcf[&c];
                    (format!("{c:?}"), d.value, d.status.tag(), d.basis.as_str())
                })
                .collect(),
        );
        let rdrr = rows(
            RdrrFunction::all()
                .into_iter()
                .map(|f| {
                    let d = &p.rdrr[&f];
                    (format!("{f:?}"), d.value, d.status.tag(), d.basis.as_str())
                })
                .collect(),
        );
        let yang = rows(
            YangCriterion::all()
                .into_iter()
                .map(|y| {
                    let d = &p.yang[&y];
                    (format!("{y:?}"), d.value, d.status.tag(), d.basis.as_str())
                })
                .collect(),
        );
        format!(
            "<!doctype html><html><head><meta charset=\"utf-8\">\
<title>PNT Resilience Self-Assessment</title></head><body>\
<h1>PNT Resilience Self-Assessment</h1>\
<p class=\"disclaimer\"><strong>{DISCLAIMER}</strong></p>\
<p>Engine {ev}, scenario {sc}, seed {seed}. Evidence split: \
{validated} VALIDATED / {modelled} MODELLED sub-scores. \
Tentative RPCF Level: {level} ({lb}).</p>\
<h2>DHS RPCF technique categories</h2><table>\
<tr><th>Category</th><th>Sub-score</th><th>Status</th><th>Basis</th></tr>{rpcf}</table>\
<h2>RethinkPNT functions</h2><table>\
<tr><th>Function</th><th>Sub-score</th><th>Status</th><th>Basis</th></tr>{rdrr}</table>\
<h2>Yang criteria</h2><table>\
<tr><th>Criterion</th><th>Sub-score</th><th>Status</th><th>Basis</th></tr>{yang}</table>\
<p>SHA-256 integrity: <code>{integrity}</code></p>\
<p>{note}</p></body></html>",
            ev = pv.engine_version,
            sc = pv.scenario,
            seed = pv.seed,
            level = p.level,
            lb = p.level_basis,
            note = pv.note,
        )
    }

    #[test]
    fn the_english_page_is_the_page_before_localisation_and_another_language_changes_only_text() {
        let p = profile();
        let hash = integrity_hash(assurance_report_json(&p, &prov()).as_bytes());
        let want = page_before_localisation(&p, &prov(), &hash);
        assert_eq!(assurance_report_html(&p, &prov(), &hash), want);
        // The JSON report, and so the integrity hash, does not depend on the language.
        let xa = crate::i18n::resolve("en-XA").unwrap();
        crate::i18n::with_lang(xa, || {
            assert_eq!(
                integrity_hash(assurance_report_json(&p, &prov()).as_bytes()),
                hash
            );
            let html = assurance_report_html(&p, &prov(), &hash);
            assert!(html.starts_with("<!doctype html><html lang=\"en-XA\">"));
            assert!(html.contains("[PÑT Réšílíéñçé"), "{html}");
            assert!(html.contains(&hash));
        });
    }

    #[test]
    fn reports_never_claim_certification() {
        let p = profile();
        let json = assurance_report_json(&p, &prov()).to_lowercase();
        let html = assurance_report_html(&p, &prov(), "deadbeef").to_lowercase();
        for banned in ["certified", "compliant", "endorsed"] {
            assert!(!json.contains(banned), "json claims '{banned}'");
            assert!(!html.contains(banned), "html claims '{banned}'");
        }
    }
}
