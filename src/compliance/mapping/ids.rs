// SPDX-License-Identifier: AGPL-3.0-only
//! The catalogue messages of the compliance mapping's human-readable text. Written by
//! `scripts/i18n_compliance.py` (do not edit by hand): tables of literal ids, so the catalogue test sees
//! every id. The data tables of `mapping.rs` stay English constants (the machine mapping); only the
//! Markdown renderers look these ids up.

/// `(framework id, message id of its title)`.
#[rustfmt::skip]
pub const FRAMEWORK_TITLE_IDS: &[(&str, &str)] = &[
    ("dhs-rpcf", "compliance-fw-dhs-rpcf-title"),
    ("imo-ships", "compliance-fw-imo-ships-title"),
    ("easa-aviation", "compliance-fw-easa-aviation-title"),
    ("nis2-art21", "compliance-fw-nis2-art21-title"),
    ("en-16803", "compliance-fw-en-16803-title"),
    ("nist-ir-8323r1", "compliance-fw-nist-ir-8323r1-title"),
];

/// `(title, version, checked)` message ids of each entry of `SOURCES`, in its order.
#[rustfmt::skip]
pub const SOURCE_IDS: &[(&str, &str, &str)] = &[
    ("compliance-source-dhs-rpcf-1-title", "compliance-source-dhs-rpcf-1-version", "compliance-source-dhs-rpcf-1-checked"),
    ("compliance-source-imo-ships-1-title", "compliance-source-imo-ships-1-version", "compliance-source-imo-ships-1-checked"),
    ("compliance-source-imo-ships-2-title", "compliance-source-imo-ships-2-version", "compliance-source-imo-ships-2-checked"),
    ("compliance-source-imo-ships-3-title", "compliance-source-imo-ships-3-version", "compliance-source-imo-ships-3-checked"),
    ("compliance-source-easa-aviation-1-title", "compliance-source-easa-aviation-1-version", "compliance-source-easa-aviation-1-checked"),
    ("compliance-source-nis2-art21-1-title", "compliance-source-nis2-art21-1-version", "compliance-source-nis2-art21-1-checked"),
    ("compliance-source-en-16803-1-title", "compliance-source-en-16803-1-version", "compliance-source-en-16803-1-checked"),
    ("compliance-source-en-16803-2-title", "compliance-source-en-16803-2-version", "compliance-source-en-16803-2-checked"),
    ("compliance-source-en-16803-3-title", "compliance-source-en-16803-3-version", "compliance-source-en-16803-3-checked"),
    ("compliance-source-nist-ir-8323r1-1-title", "compliance-source-nist-ir-8323r1-1-version", "compliance-source-nist-ir-8323r1-1-checked"),
];

/// `(capability id, name message id, output message id)`.
#[rustfmt::skip]
pub const CAPABILITY_IDS: &[(&str, &str, &str)] = &[
    ("receiver-log-trust", "compliance-cap-receiver-log-trust-name", "compliance-cap-receiver-log-trust-output"),
    ("jamming-effects", "compliance-cap-jamming-effects-name", "compliance-cap-jamming-effects-output"),
    ("spoofing-detection", "compliance-cap-spoofing-detection-name", "compliance-cap-spoofing-detection-output"),
    ("integrity-monitoring", "compliance-cap-integrity-monitoring-name", "compliance-cap-integrity-monitoring-output"),
    ("holdover", "compliance-cap-holdover-name", "compliance-cap-holdover-output"),
    ("source-diversity", "compliance-cap-source-diversity-name", "compliance-cap-source-diversity-output"),
    ("resilience-scoring", "compliance-cap-resilience-scoring-name", "compliance-cap-resilience-scoring-output"),
    ("run-provenance", "compliance-cap-run-provenance-name", "compliance-cap-run-provenance-output"),
];

/// `(row id, reference, asks, gap)` message ids. The `asks` text paraphrases or quotes the framework's
/// requirement: translators decide its wording.
#[rustfmt::skip]
pub const ROW_IDS: &[(&str, &str, &str, &str)] = &[
    ("DHS-S5.2", "compliance-req-dhs-s5-2-reference", "compliance-req-dhs-s5-2-asks", "compliance-req-dhs-s5-2-gap"),
    ("DHS-L1-R1", "compliance-req-dhs-l1-r1-reference", "compliance-req-dhs-l1-r1-asks", "compliance-req-dhs-l1-r1-gap"),
    ("DHS-L1-R2", "compliance-req-dhs-l1-r2-reference", "compliance-req-dhs-l1-r2-asks", "compliance-req-dhs-l1-r2-gap"),
    ("DHS-L1-R3", "compliance-req-dhs-l1-r3-reference", "compliance-req-dhs-l1-r3-asks", "compliance-req-dhs-l1-r3-gap"),
    ("DHS-L2-R4", "compliance-req-dhs-l2-r4-reference", "compliance-req-dhs-l2-r4-asks", "compliance-req-dhs-l2-r4-gap"),
    ("DHS-L2-R5", "compliance-req-dhs-l2-r5-reference", "compliance-req-dhs-l2-r5-asks", "compliance-req-dhs-l2-r5-gap"),
    ("DHS-L3-R6", "compliance-req-dhs-l3-r6-reference", "compliance-req-dhs-l3-r6-asks", "compliance-req-dhs-l3-r6-gap"),
    ("DHS-L3-R7", "compliance-req-dhs-l3-r7-reference", "compliance-req-dhs-l3-r7-asks", "compliance-req-dhs-l3-r7-gap"),
    ("DHS-L4-R8", "compliance-req-dhs-l4-r8-reference", "compliance-req-dhs-l4-r8-asks", "compliance-req-dhs-l4-r8-gap"),
    ("DHS-S5.5", "compliance-req-dhs-s5-5-reference", "compliance-req-dhs-s5-5-asks", "compliance-req-dhs-s5-5-gap"),
    ("DHS-S8.1-8.3", "compliance-req-dhs-s8-1-8-3-reference", "compliance-req-dhs-s8-1-8-3-asks", "compliance-req-dhs-s8-1-8-3-gap"),
    ("DHS-S8.6", "compliance-req-dhs-s8-6-reference", "compliance-req-dhs-s8-6-asks", "compliance-req-dhs-s8-6-gap"),
    ("IMO-1644-3", "compliance-req-imo-1644-3-reference", "compliance-req-imo-1644-3-asks", "compliance-req-imo-1644-3-gap"),
    ("IMO-1644-5", "compliance-req-imo-1644-5-reference", "compliance-req-imo-1644-5-asks", "compliance-req-imo-1644-5-gap"),
    ("IMO-A1046-3", "compliance-req-imo-a1046-3-reference", "compliance-req-imo-a1046-3-asks", "compliance-req-imo-a1046-3-gap"),
    ("IMO-A1046-2", "compliance-req-imo-a1046-2-reference", "compliance-req-imo-a1046-2-asks", "compliance-req-imo-a1046-2-gap"),
    ("IMO-401-3.1", "compliance-req-imo-401-3-1-reference", "compliance-req-imo-401-3-1-asks", "compliance-req-imo-401-3-1-gap"),
    ("IMO-401-3.11", "compliance-req-imo-401-3-11-reference", "compliance-req-imo-401-3-11-asks", "compliance-req-imo-401-3-11-gap"),
    ("IMO-401-3.16", "compliance-req-imo-401-3-16-reference", "compliance-req-imo-401-3-16-asks", "compliance-req-imo-401-3-16-gap"),
    ("IMO-401-4.2", "compliance-req-imo-401-4-2-reference", "compliance-req-imo-401-4-2-asks", "compliance-req-imo-401-4-2-gap"),
    ("EASA-DESC", "compliance-req-easa-desc-reference", "compliance-req-easa-desc-asks", "compliance-req-easa-desc-gap"),
    ("EASA-MFR", "compliance-req-easa-mfr-reference", "compliance-req-easa-mfr-asks", "compliance-req-easa-mfr-gap"),
    ("EASA-OPS-SPOOF", "compliance-req-easa-ops-spoof-reference", "compliance-req-easa-ops-spoof-asks", "compliance-req-easa-ops-spoof-gap"),
    ("EASA-ANSP", "compliance-req-easa-ansp-reference", "compliance-req-easa-ansp-asks", "compliance-req-easa-ansp-gap"),
    ("EASA-REPORT", "compliance-req-easa-report-reference", "compliance-req-easa-report-asks", "compliance-req-easa-report-gap"),
    ("NIS2-21-1", "compliance-req-nis2-21-1-reference", "compliance-req-nis2-21-1-asks", "compliance-req-nis2-21-1-gap"),
    ("NIS2-21-2-a", "compliance-req-nis2-21-2-a-reference", "compliance-req-nis2-21-2-a-asks", "compliance-req-nis2-21-2-a-gap"),
    ("NIS2-21-2-b", "compliance-req-nis2-21-2-b-reference", "compliance-req-nis2-21-2-b-asks", "compliance-req-nis2-21-2-b-gap"),
    ("NIS2-21-2-c", "compliance-req-nis2-21-2-c-reference", "compliance-req-nis2-21-2-c-asks", "compliance-req-nis2-21-2-c-gap"),
    ("NIS2-21-2-d", "compliance-req-nis2-21-2-d-reference", "compliance-req-nis2-21-2-d-asks", "compliance-req-nis2-21-2-d-gap"),
    ("NIS2-21-2-e", "compliance-req-nis2-21-2-e-reference", "compliance-req-nis2-21-2-e-asks", "compliance-req-nis2-21-2-e-gap"),
    ("NIS2-21-2-f", "compliance-req-nis2-21-2-f-reference", "compliance-req-nis2-21-2-f-asks", "compliance-req-nis2-21-2-f-gap"),
    ("NIS2-21-2-ghij", "compliance-req-nis2-21-2-ghij-reference", "compliance-req-nis2-21-2-ghij-asks", "compliance-req-nis2-21-2-ghij-gap"),
    ("NIS2-21-3", "compliance-req-nis2-21-3-reference", "compliance-req-nis2-21-3-asks", "compliance-req-nis2-21-3-gap"),
    ("EN16803-1", "compliance-req-en16803-1-reference", "compliance-req-en16803-1-asks", "compliance-req-en16803-1-gap"),
    ("EN16803-2", "compliance-req-en16803-2-reference", "compliance-req-en16803-2-asks", "compliance-req-en16803-2-gap"),
    ("EN16803-3-6", "compliance-req-en16803-3-6-reference", "compliance-req-en16803-3-6-asks", "compliance-req-en16803-3-6-gap"),
    ("EN16803-3-A", "compliance-req-en16803-3-a-reference", "compliance-req-en16803-3-a-asks", "compliance-req-en16803-3-a-gap"),
    ("NIST-ID.RA-1", "compliance-req-nist-id-ra-1-reference", "compliance-req-nist-id-ra-1-asks", "compliance-req-nist-id-ra-1-gap"),
    ("NIST-ID.RA-3", "compliance-req-nist-id-ra-3-reference", "compliance-req-nist-id-ra-3-asks", "compliance-req-nist-id-ra-3-gap"),
    ("NIST-ID.RA-4", "compliance-req-nist-id-ra-4-reference", "compliance-req-nist-id-ra-4-asks", "compliance-req-nist-id-ra-4-gap"),
    ("NIST-ID.RA-5", "compliance-req-nist-id-ra-5-reference", "compliance-req-nist-id-ra-5-asks", "compliance-req-nist-id-ra-5-gap"),
    ("NIST-PR.DS-6", "compliance-req-nist-pr-ds-6-reference", "compliance-req-nist-pr-ds-6-asks", "compliance-req-nist-pr-ds-6-gap"),
    ("NIST-PR.IP-10", "compliance-req-nist-pr-ip-10-reference", "compliance-req-nist-pr-ip-10-asks", "compliance-req-nist-pr-ip-10-gap"),
    ("NIST-PR.PT-5", "compliance-req-nist-pr-pt-5-reference", "compliance-req-nist-pr-pt-5-asks", "compliance-req-nist-pr-pt-5-gap"),
    ("NIST-DE.AE-2", "compliance-req-nist-de-ae-2-reference", "compliance-req-nist-de-ae-2-asks", "compliance-req-nist-de-ae-2-gap"),
    ("NIST-DE.AE-3", "compliance-req-nist-de-ae-3-reference", "compliance-req-nist-de-ae-3-asks", "compliance-req-nist-de-ae-3-gap"),
    ("NIST-DE.AE-4", "compliance-req-nist-de-ae-4-reference", "compliance-req-nist-de-ae-4-asks", "compliance-req-nist-de-ae-4-gap"),
    ("NIST-DE.AE-5", "compliance-req-nist-de-ae-5-reference", "compliance-req-nist-de-ae-5-asks", "compliance-req-nist-de-ae-5-gap"),
    ("NIST-DE.CM-1", "compliance-req-nist-de-cm-1-reference", "compliance-req-nist-de-cm-1-asks", "compliance-req-nist-de-cm-1-gap"),
    ("NIST-DE.DP-3", "compliance-req-nist-de-dp-3-reference", "compliance-req-nist-de-dp-3-asks", "compliance-req-nist-de-dp-3-gap"),
    ("NIST-RS.AN-5", "compliance-req-nist-rs-an-5-reference", "compliance-req-nist-rs-an-5-asks", "compliance-req-nist-rs-an-5-gap"),
    ("NIST-RS.MI-2", "compliance-req-nist-rs-mi-2-reference", "compliance-req-nist-rs-mi-2-asks", "compliance-req-nist-rs-mi-2-gap"),
];
