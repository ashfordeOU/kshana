// SPDX-License-Identifier: AGPL-3.0-only
//! The advisories, disclaimers and notices. Each is a constant in its own module (English, carried by
//! the machine files as it always was) and a message `engine-<id>` in the catalogue, which a
//! translator may translate; [`text`] gives the one a person reads, in the current language.
//! `tests/i18n_legal.rs` checks that every English message equals its constant.

/// Every legal text (the modules that are not built for WebAssembly contribute theirs only natively): the message id, then the constant it translates.
pub const LEGAL: &[(&str, &str)] = &[
    ("legal-compliance-statement", crate::compliance::STATEMENT),
    ("legal-bench-surface-notice", crate::surface::BENCH_NOTICE),
    #[cfg(not(target_arch = "wasm32"))]
    (
        "legal-iq-campaign-roc-statement",
        crate::iq::campaign::report::ROC_STATEMENT,
    ),
    (
        "legal-lunanet-afs-advisory",
        crate::iq::lunanet_afs::ADVISORY,
    ),
    #[cfg(not(target_arch = "wasm32"))]
    ("legal-iqfit-statement", crate::iq::labfit::iqfit::STATEMENT),
    #[cfg(not(target_arch = "wasm32"))]
    ("legal-iqfit-advisory", crate::iq::labfit::iqfit::ADVISORY),
    (
        "legal-lunar-time-lab-source-statement",
        crate::lunar_time_lab::SOURCE_STATEMENT,
    ),
    ("legal-standards-pack-notice", crate::standards_pack::NOTICE),
    (
        "legal-standards-pack-advisory",
        crate::standards_pack::ADVISORY,
    ),
    ("legal-geometry-statement", crate::geometry::STATEMENT),
    (
        "legal-resilience-disclaimer",
        crate::resilience::report::DISCLAIMER,
    ),
    (
        "legal-observatory-notice",
        crate::interference_map::observatory::NOTICE,
    ),
    (
        "legal-receiver-trust-advisory",
        crate::receiver_trust::ADVISORY,
    ),
    #[cfg(not(target_arch = "wasm32"))]
    (
        "legal-evidence-roundtrip-notice",
        crate::evidence::roundtrip::NOTICE,
    ),
    (
        "legal-evidence-bundle-disclaimer",
        crate::evidence::bundle::DISCLAIMER,
    ),
    ("legal-bench-notice", crate::bench::NOTICE),
    ("legal-osnma-advisory", crate::osnma::ADVISORY),
];

/// The legal text `id` in the current language (the English constant when it has no translation).
pub fn text(id: &str) -> String {
    crate::i18n::tr(id, &[])
}
