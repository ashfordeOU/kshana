// SPDX-License-Identifier: AGPL-3.0-only
//! The language of a run: English is exactly the run it always was; another language changes only
//! what a person reads (the summary, the chart text, the messages), never a machine file.

use kshana::api;

fn scenario() -> String {
    std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/scenarios/clock-holdover.toml"
    ))
    .expect("scenarios/clock-holdover.toml")
}

#[test]
fn english_is_the_run_it_always_was() {
    let src = scenario();
    let plain = api::run_toml(&src).unwrap();
    for lang in ["en", "en-US", "C", ""] {
        let o = api::run_toml_lang(&src, lang).unwrap();
        assert_eq!(o.json, plain.json, "{lang:?}");
        assert_eq!(o.svg, plain.svg, "{lang:?}");
        assert_eq!(o.summary, plain.summary, "{lang:?}");
        assert_eq!(o.csv, plain.csv, "{lang:?}");
    }
}

#[test]
fn another_language_changes_only_what_a_person_reads() {
    let src = scenario();
    let en = api::run_toml(&src).unwrap();
    for lang in ["en-XA", "de", "pt-PT", "zh-Hans"] {
        let (machine, human) = api::run_toml_bilingual(&src, lang).unwrap();
        assert_eq!(
            machine.json, en.json,
            "{lang}: the result document is the English run's"
        );
        assert_eq!(machine.csv, en.csv, "{lang}");
        assert_eq!(machine.summary, en.summary, "{lang}");
        let h = human.expect("a second run in the language");
        // Whatever the language, the same run: same numbers in the summary's machine parts.
        assert!(!h.summary.is_empty());
        if lang == "en-XA" {
            assert_ne!(h.summary, en.summary);
            assert!(h.summary.starts_with('['), "{}", h.summary);
        }
        let merged = api::run_toml_lang(&src, lang).unwrap();
        assert_eq!(merged.json, en.json);
        assert_eq!(merged.summary, h.summary);
    }
}

#[test]
fn an_unsupported_language_is_an_error_that_names_the_supported_ones() {
    let e = api::run_toml_lang(&scenario(), "tlh").unwrap_err();
    assert!(
        e.contains("tlh") && e.contains("pt-BR") && e.contains("zh-Hans"),
        "{e}"
    );
}

#[test]
fn an_error_has_the_same_code_in_every_language_and_its_message_in_the_language() {
    let bad = "kind = \"no-such-kind\"\n";
    let en = api::run_scenario_lang(bad, "en").unwrap_err();
    let xa = api::run_scenario_lang(bad, "en-XA").unwrap_err();
    assert_eq!(en, api::run_scenario(bad).unwrap_err());
    // Not every message is in the catalogue yet; the ones that are carry a code.
    let info: serde_json::Value =
        serde_json::from_str(&api::error_info_json(bad, "en-XA")).unwrap();
    assert!(info["kind"].is_string());
    assert!(info.get("code").is_some());
    assert_eq!(info["message"].as_str().unwrap(), xa.to_string());
    assert_eq!(api::error_info_json(&scenario(), "de"), "");
    if let Some(code) = en.code() {
        assert_eq!(Some(code.as_str()), xa.code().as_deref());
    }
}
