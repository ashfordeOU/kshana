//! P2 honesty firewall gates: the R2/R3 source prose must not overclaim, must
//! state the correlated-bias and common-mode blind-spot honesty, and must carry
//! no authorship attribution. Token literals are concat!-fragmented so this
//! file does not trip the attribution scanner on itself.

use std::path::PathBuf;

fn read(rel: &str) -> String {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    std::fs::read_to_string(root.join(rel)).unwrap_or_else(|e| panic!("read {rel}: {e}"))
}

const SOURCES: [&str; 3] = [
    "src/integrity/hetero_budget.rs",
    "src/integrity/gls_commonmode.rs",
    "examples/hetero_gls_demo.rs",
];

#[test]
fn no_worst_case_or_cert_overclaim() {
    // Case-insensitive phrases that must only appear with an explicit negation.
    let phrases = [
        concat!("worst", "-case holdover"),
        concat!("worst", "-case bias"),
        "certified",
    ];
    // Acronyms matched CASE-SENSITIVELY (lowercasing would false-positive:
    // "TRL" ⊂ "control", "DO-178" is only a real hit in caps). These must be
    // wholly absent — we never make a cert/TRL claim, negated or not.
    let acronyms = ["TRL", "DO-178", "ECSS"];
    for f in SOURCES {
        let raw = read(f);
        let body = raw.to_lowercase();
        for bad in phrases {
            let needle = bad.to_lowercase();
            if body.contains(&needle) {
                let ok = body.contains(&format!("no {needle}"))
                    || body.contains(&format!("not {needle}"))
                    || body.contains(&format!("never {needle}"));
                assert!(ok, "{f}: forbidden overclaim '{bad}' without negation");
            }
        }
        for acr in acronyms {
            assert!(
                !raw.contains(acr),
                "{f}: forbidden cert/TRL acronym '{acr}'"
            );
        }
    }
}

#[test]
fn correlated_bias_and_blind_spot_are_stated() {
    let hb = read("src/integrity/hetero_budget.rs").to_lowercase();
    assert!(
        hb.contains("independence is violated"),
        "hetero_budget must state the correlated-bias hazard (independence-violated sentence)"
    );
    let gls = read("src/integrity/gls_commonmode.rs").to_lowercase();
    assert!(
        gls.contains("structurally blind"),
        "gls_commonmode must state that separation is structurally blind to common-mode"
    );
    assert!(
        gls.contains("outside the modelled")
            || gls.contains("outside `\u{03a9}`")
            || gls.contains("outside `omega`")
            || gls.contains("did not put into"),
        "gls_commonmode must state the residual-outside-Omega blind spot"
    );
}

#[test]
fn circular_t_notice_marks_cited_not_validated() {
    let notice = read("tests/fixtures/utc_k/NOTICE.md").to_lowercase();
    assert!(
        notice.contains("cited input"),
        "NOTICE must mark the series a Cited input"
    );
    assert!(
        notice.contains("not") && notice.contains("re-validated")
            || notice.contains("not re-validated"),
        "NOTICE must state the series is NOT re-validated (circularity guard)"
    );
}

#[test]
fn no_authorship_attribution_tokens() {
    let a = concat!("anthro", "pic");
    let b = concat!("co-", "authored");
    // Split INSIDE the vendor word, as the two tokens above are. Fragmenting at the
    // word boundary instead left "generated with [" and the name close enough on one
    // line for the pre-commit attribution guard to match the shape and block the
    // commit — the token this test hunts for, reconstructed by the test itself.
    let c = concat!("generated with [", "cla", "ude");
    for f in SOURCES
        .iter()
        .chain(["tests/fixtures/utc_k/NOTICE.md"].iter())
    {
        let body = read(f).to_lowercase();
        assert!(!body.contains(a), "{f}: attribution token");
        assert!(!body.contains(b), "{f}: attribution token");
        assert!(!body.contains(c), "{f}: attribution token");
    }
}

/// The lunar P2/P5 sources are deliberately NOT in [`SOURCES`]. That list bans "TRL",
/// "DO-178" and "ECSS" outright — negated or not — because those three files should
/// never raise the subject at all. The lunar files do raise it, in order to disclaim it
/// ("No certified standard, no TRL claim, no ESA endorsement"), so listing them there
/// would force deleting honest disclaimers to make the gate green. They get the
/// mirror-image rule instead: the disclaimer must be PRESENT.
#[test]
fn lunar_p2_p5_sources_carry_their_disclaimers() {
    // Doc-comment markers and hard wrapping must not hide a phrase that spans lines.
    fn prose(rel: &str) -> String {
        read(rel)
            .to_lowercase()
            .replace("//!", " ")
            .replace("///", " ")
            .split_whitespace()
            .collect::<Vec<_>>()
            .join(" ")
    }

    for f in [
        "src/lunar_interop_budget.rs",
        "examples/p2_cross_provider_interop.rs",
        "examples/p5_autonomous_fault_observability.rs",
    ] {
        assert!(
            prose(f).contains("no trl claim"),
            "{f}: must disclaim any TRL claim"
        );
    }

    let p5 = prose("examples/p5_autonomous_fault_observability.rs");
    assert!(
        p5.contains("not lnis-certified"),
        "p5 example: the hypothetical alert limit must be marked NOT LNIS-certified"
    );

    // The Validated carve-out is the whole reason the 7-parameter fit needs its own
    // cross-check. If a later edit widens the module doc back to a blanket Validated
    // claim, the matrix row it contradicts is the one that is right.
    let ib = prose("src/lunar_interop_budget.rs");
    assert!(
        ib.contains("not covered by that external check"),
        "lunar_interop_budget doc must carve the 7-parameter fit out of the Validated claim"
    );
}
