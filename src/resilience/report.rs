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

fn row(name: &str, value: f64, tag: &str, basis: &str) -> String {
    format!("<tr><td>{name}</td><td>{value:.3}</td><td>{tag}</td><td>{basis}</td></tr>")
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
        rpcf_rows.push_str(&row(&format!("{c:?}"), d.value, d.status.tag(), &d.basis));
    }
    let mut rdrr_rows = String::new();
    for f in RdrrFunction::all() {
        let d = &profile.rdrr[&f];
        rdrr_rows.push_str(&row(&format!("{f:?}"), d.value, d.status.tag(), &d.basis));
    }
    let mut yang_rows = String::new();
    for y in YangCriterion::all() {
        let d = &profile.yang[&y];
        yang_rows.push_str(&row(&format!("{y:?}"), d.value, d.status.tag(), &d.basis));
    }
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
        ev = prov.engine_version,
        sc = prov.scenario,
        seed = prov.seed,
        level = profile.level,
        lb = profile.level_basis,
        rpcf = rpcf_rows,
        rdrr = rdrr_rows,
        yang = yang_rows,
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
