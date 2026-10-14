// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana::api::KIND_MODULES` names only kinds the dispatcher has and modules the matrix uses.

use kshana::api::{kind_modules_json, list_scenario_kinds, KIND_MODULES};
use kshana::verification::verification_matrix;
use std::collections::BTreeSet;

/// A whole module name inside a matrix row's `module` or `tests` text: not part of a longer
/// name and not a folder in a file path (the Studio's own matching rule).
fn names(text: &str, token: &str) -> bool {
    let b = text.as_bytes();
    text.match_indices(token).any(|(i, _)| {
        let before = i == 0 || !matches!(b[i - 1], b'A'..=b'Z' | b'a'..=b'z' | b'0'..=b'9' | b'_' | b'/' | b'.' | b'-');
        let j = i + token.len();
        let after = j >= b.len() || !matches!(b[j], b'A'..=b'Z' | b'a'..=b'z' | b'0'..=b'9' | b'_' | b'/' | b'-');
        before && after
    })
}

#[test]
fn every_kind_in_the_table_is_dispatchable_and_listed_once() {
    let kinds: BTreeSet<&str> = list_scenario_kinds().iter().map(|m| m.name).collect();
    let mut seen = BTreeSet::new();
    for (kind, modules) in KIND_MODULES {
        assert!(kinds.contains(kind), "`{kind}` is not a scenario kind");
        assert!(seen.insert(*kind), "`{kind}` is listed twice");
        assert!(!modules.is_empty(), "`{kind}` has no modules");
    }
}

#[test]
fn every_module_in_the_table_appears_in_a_matrix_row() {
    let rows = verification_matrix();
    for (kind, modules) in KIND_MODULES {
        for m in *modules {
            assert!(
                rows.iter().any(|r| names(r.module, m) || names(r.tests, m)),
                "module `{m}` (kind `{kind}`) is named by no verification-matrix row"
            );
        }
    }
}

#[test]
fn the_json_is_the_table() {
    let v: serde_json::Value = serde_json::from_str(&kind_modules_json()).unwrap();
    let o = v.as_object().unwrap();
    assert_eq!(o.len(), KIND_MODULES.len());
    for (kind, modules) in KIND_MODULES {
        let got: Vec<&str> = o[*kind]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_str().unwrap())
            .collect();
        assert_eq!(&got, modules);
    }
}
