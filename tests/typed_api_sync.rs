// SPDX-License-Identifier: AGPL-3.0-only
//! The typed Python and TypeScript vocabularies (CAP-34) are hand-written in
//! `kshana.pyi` and `src/wasm_types.d.ts`. This keeps their three closed lists equal,
//! in order, to the engine's own: the scenario kinds (`api::list_scenario_kinds`), the
//! error tags (`KshanaError::kind_tag`) and the provenance classes
//! (`field_schema::ProvenanceClass::ALL`). A kind added to the engine without a stub
//! entry fails here.

use kshana::api::KshanaError;
use kshana::field_schema::ProvenanceClass;

/// Every `"..."` string between the first `start` and the next `end` after it.
fn quoted_block(text: &str, start: &str, end: &str) -> Vec<String> {
    let at = text
        .find(start)
        .unwrap_or_else(|| panic!("`{start}` not found"));
    let rest = &text[at + start.len()..];
    let stop = rest
        .find(end)
        .unwrap_or_else(|| panic!("no `{end}` after `{start}`"));
    rest[..stop]
        .split('"')
        .skip(1)
        .step_by(2)
        .map(str::to_string)
        .collect()
}

fn engine_kinds() -> Vec<String> {
    kshana::api::list_scenario_kinds()
        .iter()
        .map(|k| k.name.to_string())
        .collect()
}

fn engine_error_tags() -> Vec<String> {
    let all = [
        KshanaError::InvalidInput(String::new()),
        KshanaError::NonConvergence(String::new()),
        KshanaError::Unsupported(String::new()),
        KshanaError::IoError(String::new()),
    ];
    // Exhaustive on purpose: a new variant stops this compiling until it is listed.
    for e in &all {
        match e {
            KshanaError::InvalidInput(_)
            | KshanaError::NonConvergence(_)
            | KshanaError::Unsupported(_)
            | KshanaError::IoError(_) => {}
        }
    }
    all.iter().map(|e| e.kind_tag().to_string()).collect()
}

fn engine_provenance() -> Vec<String> {
    ProvenanceClass::ALL
        .iter()
        .map(|c| c.as_str().to_string())
        .collect()
}

#[test]
fn python_stub_vocabulary_matches_the_engine() {
    let pyi = std::fs::read_to_string("kshana.pyi").unwrap();
    assert_eq!(
        quoted_block(&pyi, "ScenarioKind = Literal[", "\n]"),
        engine_kinds()
    );
    assert_eq!(
        quoted_block(&pyi, "ErrorKind = Literal[", "]"),
        engine_error_tags()
    );
    assert_eq!(
        quoted_block(&pyi, "ProvenanceClass = Literal[", "\n]"),
        engine_provenance()
    );
}

#[test]
fn typescript_vocabulary_matches_the_engine() {
    let ts = std::fs::read_to_string("src/wasm_types.d.ts").unwrap();
    assert_eq!(
        quoted_block(&ts, "export type ScenarioKind =", ";"),
        engine_kinds()
    );
    assert_eq!(
        quoted_block(&ts, "export type ErrorKind =", ";"),
        engine_error_tags()
    );
    assert_eq!(
        quoted_block(&ts, "export type ProvenanceClass =", ";"),
        engine_provenance()
    );
}

#[test]
fn the_typed_signatures_use_the_vocabulary() {
    let pyi = std::fs::read_to_string("kshana.pyi").unwrap();
    assert!(pyi.contains("def scenario_kinds() -> list[KindMeta]:"));
    assert!(pyi.contains("def error_kind(toml: str) -> Optional[ErrorKind]:"));
    let wasm = std::fs::read_to_string("src/wasm.rs").unwrap();
    assert!(wasm.contains("include_str!(\"wasm_types.d.ts\")"));
    assert!(wasm.contains("unchecked_return_type = \"KindMeta[]\""));
    assert!(wasm.contains("unchecked_return_type = \"RunOutput\""));
}
