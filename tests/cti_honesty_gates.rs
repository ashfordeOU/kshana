//! CI honesty firewall for the CTI integrity modules. Scans the integrity
//! sources + fixtures for firewall violations, and asserts the required
//! citations are present.

use std::fs;
use std::path::PathBuf;

fn read_all(rel: &[&str]) -> String {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let mut s = String::new();
    for r in rel {
        s.push_str(&fs::read_to_string(root.join(r)).unwrap_or_default());
        s.push('\n');
    }
    s
}

const INTEGRITY_SRC: &[&str] = &[
    "src/integrity/mod.rs",
    "src/integrity/kir.rs",
    "src/integrity/tpl_scalar.rs",
    "src/integrity/composed_pl.rs",
    "src/integrity/lil_envelope.rs",
];

#[test]
fn no_forbidden_overclaim_phrases() {
    let body = read_all(INTEGRITY_SRC).to_lowercase();
    for bad in [
        "worst-case holdover",
        "worst case holdover",
        "formally verified",
        "formal verification",
        "certified",
        "do-178",
        "ecss conformance",
        "trl ",
    ] {
        assert!(
            !body.contains(bad),
            "forbidden overclaim phrase present: {bad}"
        );
    }
}

#[test]
fn validated_never_co_located_with_composition_words() {
    // The word "validated" must not appear alongside system/composition claims
    // in the integrity sources (composition is Modelled, not Validated).
    let body = read_all(INTEGRITY_SRC).to_lowercase();
    for line in body.lines() {
        if line.contains("validated") {
            for w in [
                "composition",
                "composed",
                "heterogeneous",
                "end-to-end",
                "system-level",
            ] {
                assert!(
                    !line.contains(w),
                    "\"validated\" co-located with composition word `{w}`: {line}"
                );
            }
        }
    }
}

#[test]
fn no_disallowed_attribution_tokens() {
    let body = read_all(INTEGRITY_SRC).to_lowercase();
    // Tokens are assembled from fragments so this guard file itself stays
    // marker-clean (mirrors scripts/check-no-attribution.sh); the assertion
    // still scans the integrity sources for the reconstructed tokens.
    for tok in [
        concat!("cla", "ude"),
        concat!("anthro", "pic"),
        concat!("enterprise", "hq"),
        concat!("co-auth", "ored"),
    ] {
        assert!(!body.contains(tok), "disallowed attribution token: {tok}");
    }
}

#[test]
fn required_citations_are_present() {
    let body = read_all(INTEGRITY_SRC);
    assert!(
        body.contains("Blanch") && body.contains("Joerger"),
        "MHSS must cite Blanch + Joerger"
    );
    assert!(body.contains("2606.24210"), "must cite the Baweja N=1 seam");
}
