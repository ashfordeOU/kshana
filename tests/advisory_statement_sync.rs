//! Every API surface that returns a vessel trust score states what the software is and is not,
//! in the engine's own words (`kshana::receiver_trust::ADVISORY`), not only the word "advisory".
//! The text is compared after stripping comment markers and collapsing whitespace, so a line wrap
//! in a doc comment does not matter.

use kshana::receiver_trust::ADVISORY;

fn flat(path: &str) -> String {
    let text = std::fs::read_to_string(format!("{}/{path}", env!("CARGO_MANIFEST_DIR"))).unwrap();
    text.lines()
        .map(|l| {
            l.trim_start()
                .trim_start_matches("///")
                .trim_start_matches("//!")
        })
        .collect::<Vec<_>>()
        .join(" ")
        .split_whitespace()
        .collect::<Vec<_>>()
        .join(" ")
}

/// The doc comment of `item`: the text between the previous function and `item`.
fn section<'a>(flat: &'a str, item: &str) -> &'a str {
    let i = flat
        .find(item)
        .unwrap_or_else(|| panic!("`{item}` not found"));
    // From the previous function's signature to this one, so a neighbour's docs never count.
    let start = flat[..i].rfind(" fn ").unwrap_or(0);
    &flat[start..i]
}

#[test]
fn the_python_stub_and_binding_carry_the_full_statement_for_each_score_function() {
    let pyi = flat("kshana.pyi");
    for f in [
        "def receiver_trust(",
        "def receiver_trust_replay(",
        "def assess_vessel_log(",
    ] {
        let i = pyi.find(f).unwrap_or_else(|| panic!("{f}"));
        let tail = &pyi[i..(i + 2500).min(pyi.len())];
        let next = tail[f.len()..]
            .find("def ")
            .map_or(tail.len(), |n| n + f.len());
        assert!(
            tail[..next].contains(ADVISORY),
            "kshana.pyi {f} lacks the advisory statement"
        );
    }
    let py = flat("src/python.rs");
    for f in ["fn receiver_trust_replay", "fn assess_vessel_log"] {
        assert!(section(&py, f).contains(ADVISORY), "src/python.rs {f}");
    }
}

#[test]
fn the_wasm_exports_carry_the_full_statement() {
    let w = flat("src/wasm.rs");
    for f in ["pub fn receiver_trust_replay", "pub fn assess_vessel_log"] {
        assert!(section(&w, f).contains(ADVISORY), "src/wasm.rs {f}");
    }
}

#[test]
fn the_jetbrains_listing_and_readme_carry_the_full_statement() {
    for p in [
        "ide/jetbrains/src/main/resources/META-INF/plugin.xml",
        "ide/jetbrains/README.md",
    ] {
        assert!(flat(p).contains(ADVISORY), "{p}");
    }
}

#[test]
fn the_osnma_surfaces_carry_the_full_statement() {
    use kshana::osnma::ADVISORY as OSNMA;
    let py = flat("src/python.rs");
    assert!(
        section(&py, "fn osnma_verify").contains(OSNMA),
        "src/python.rs"
    );
    let w = flat("src/wasm.rs");
    assert!(
        section(&w, "pub fn osnma_verify").contains(OSNMA),
        "src/wasm.rs"
    );
    let pyi = flat("kshana.pyi");
    let i = pyi.find("def osnma_verify(").expect("kshana.pyi");
    assert!(
        pyi[i..(i + 2500).min(pyi.len())].contains(OSNMA),
        "kshana.pyi"
    );
}
