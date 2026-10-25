// SPDX-License-Identifier: AGPL-3.0-only
//! The descriptions of the built-in scenario kinds are in the catalogue.
//!
//! * every kind of `list_scenario_kinds()` has a table entry, and the table names no other kind;
//! * the English catalogue text equals the constant `ScenarioMeta::description`, byte for byte;
//! * `list_scenario_kinds_json_lang("en")` is `list_scenario_kinds_json()` byte for byte, and the
//!   pseudo-locale changes only the descriptions.
use kshana::api::{
    kind_description_in, list_scenario_kinds, list_scenario_kinds_json,
    list_scenario_kinds_json_lang, KIND_DESCRIPTION_IDS,
};
use kshana::i18n::Lang;
use std::collections::BTreeSet;

#[test]
fn every_kind_has_a_catalogue_entry_and_the_table_names_no_other() {
    let kinds: Vec<&str> = list_scenario_kinds().iter().map(|m| m.name).collect();
    let table: Vec<&str> = KIND_DESCRIPTION_IDS.iter().map(|(k, _, _)| *k).collect();
    assert_eq!(kinds, table, "the table follows the registry, in its order");
    let ids: BTreeSet<&str> = KIND_DESCRIPTION_IDS.iter().map(|(_, i, _)| *i).collect();
    assert_eq!(ids.len(), kinds.len(), "one message per kind");
    for (k, id, _) in KIND_DESCRIPTION_IDS {
        assert_eq!(*id, format!("kind-{k}-description"));
    }
}

#[test]
fn english_catalogue_text_equals_the_constant() {
    let en = Lang::english();
    for m in list_scenario_kinds() {
        assert_eq!(
            kind_description_in(&en, m.name).as_deref(),
            Some(m.description),
            "{}",
            m.name
        );
    }
    assert_eq!(kind_description_in(&en, "no-such-kind"), None);
}

#[test]
fn the_english_document_is_the_machine_document() {
    let want = list_scenario_kinds_json();
    for tag in ["en", "en-US", "C", ""] {
        assert_eq!(list_scenario_kinds_json_lang(tag).unwrap(), want, "{tag:?}");
    }
    assert!(list_scenario_kinds_json_lang("xx-nonsense").is_err());
}

#[test]
fn the_pseudo_locale_changes_only_the_descriptions() {
    let en: serde_json::Value = serde_json::from_str(&list_scenario_kinds_json()).unwrap();
    let xa: serde_json::Value =
        serde_json::from_str(&list_scenario_kinds_json_lang("en-XA").unwrap()).unwrap();
    let (en, xa) = (en.as_array().unwrap(), xa.as_array().unwrap());
    assert_eq!(en.len(), xa.len());
    for (a, b) in en.iter().zip(xa) {
        let name = a["name"].as_str().unwrap();
        assert_eq!(a["name"], b["name"]);
        assert_eq!(a["required_fields"], b["required_fields"], "{name}");
        assert_eq!(a["optional_fields"], b["optional_fields"], "{name}");
        let d = b["description"].as_str().unwrap();
        assert!(d.starts_with('[') && d.ends_with(']'), "{name}: {d}");
        assert_ne!(a["description"], b["description"], "{name}");
        assert!(!d.is_ascii(), "{name}: accented text expected: {d}");
    }
}
