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
    let c = concat!("generated with [", "claude");
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
