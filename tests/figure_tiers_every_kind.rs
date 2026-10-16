// SPDX-License-Identifier: AGPL-3.0-only
//! The RM-04 invariants pre-registered in tests/fixtures/figure_tiers/PREREGISTRATION.md:
//! every built-in kind is either tiered by its table entry, builds its own block, has a
//! frozen prediction, or is listed without a headline figure; every named row exists;
//! every path resolves in the kind's reference scenario; the appended block strips back to
//! the untiered document byte for byte; and a frozen-prediction kind gets no block.
use kshana::api::{list_scenario_kinds, run_toml, run_toml_untiered, without_figure_tiers};
use kshana::fom_label::{
    kind_figures, FROZEN_PREDICTION_KINDS, KINDS_EXCLUDED_FROM_FIGURE_TIERS,
    KINDS_WITH_INLINE_TIERS,
};
use kshana::verification::verification_matrix;
use serde_json::Value;
use std::collections::BTreeMap;

/// The first scenario under scenarios/ (sorted) of each kind.
fn reference_scenarios() -> BTreeMap<String, String> {
    let mut files: Vec<_> = std::fs::read_dir(concat!(env!("CARGO_MANIFEST_DIR"), "/scenarios"))
        .unwrap()
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .collect();
    files.sort();
    let mut out = BTreeMap::new();
    for p in files {
        let src = std::fs::read_to_string(&p).unwrap();
        if let Ok(k) = kshana::api::ScenarioKind::classify(&src) {
            out.entry(k.as_str().to_string()).or_insert(src);
        }
    }
    out
}

#[test]
fn every_kind_is_tiered_or_excluded_with_a_reason() {
    for meta in list_scenario_kinds() {
        let k = meta.name;
        let places = [
            kind_figures(k).is_some(),
            KINDS_WITH_INLINE_TIERS.contains(&k),
            FROZEN_PREDICTION_KINDS.contains(&k),
            KINDS_EXCLUDED_FROM_FIGURE_TIERS
                .iter()
                .any(|(n, _)| *n == k),
        ];
        assert_eq!(
            places.iter().filter(|b| **b).count(),
            1,
            "{k}: table {}, inline {}, frozen {}, no headline {}",
            places[0],
            places[1],
            places[2],
            places[3]
        );
    }
    for (k, why) in KINDS_EXCLUDED_FROM_FIGURE_TIERS {
        assert!(!why.is_empty(), "{k} is excluded without a reason");
    }
}

#[test]
fn every_named_row_exists_and_no_tier_is_written() {
    let reqs: Vec<&str> = verification_matrix()
        .iter()
        .map(|r| r.requirement)
        .collect();
    for meta in list_scenario_kinds() {
        for (path, req) in kind_figures(meta.name).unwrap_or(&[]) {
            assert!(
                req.is_empty() || reqs.contains(req),
                "{}: {path} names {req:?}, which is not a matrix row",
                meta.name
            );
        }
    }
}

/// One kind's checks; `Err` names the first failure.
fn check_kind(k: &str, src: &str) -> Result<(), String> {
    let tiered = run_toml(src).map_err(|e| format!("{k}: {e}"))?;
    let plain = run_toml_untiered(src).map_err(|e| format!("{k}: {e}"))?;
    let stripped = without_figure_tiers(&tiered.json);
    let excluded = FROZEN_PREDICTION_KINDS.contains(&k)
        || KINDS_EXCLUDED_FROM_FIGURE_TIERS
            .iter()
            .any(|(n, _)| *n == k);
    if excluded {
        if stripped.is_some() || tiered.json != plain.json {
            return Err(format!("{k} must not carry figure_tiers"));
        }
        return Ok(());
    }
    let stripped = stripped.ok_or_else(|| format!("{k}: no trailing figure_tiers"))?;
    if KINDS_WITH_INLINE_TIERS.contains(&k) {
        return if tiered.json == plain.json {
            Ok(())
        } else {
            Err(format!("{k}: the inline block is the kind's own"))
        };
    }
    if stripped != plain.json {
        return Err(format!(
            "{k}: stripping does not give the untiered document"
        ));
    }
    let doc: Value = serde_json::from_str(&tiered.json).map_err(|e| format!("{k}: {e}"))?;
    let block = &doc["figure_tiers"];
    let listed = block["figures"].as_array().map_or(0, Vec::len)
        + block
            .get("untiered")
            .and_then(Value::as_array)
            .map_or(0, Vec::len);
    let table = kind_figures(k).ok_or_else(|| format!("{k}: no table entry"))?;
    for (path, _) in table {
        let mut node = &doc;
        for seg in path.split('.') {
            node = node.get(seg).unwrap_or(&Value::Null);
        }
        if node.is_null() {
            return Err(format!("{k}: {path} does not resolve in its reference run"));
        }
    }
    if listed != table.len() {
        return Err(format!(
            "{k}: {listed} figures listed, {} in the table",
            table.len()
        ));
    }
    Ok(())
}

#[test]
fn every_kind_tiers_its_reference_run_and_strips_back_exactly() {
    let refs = reference_scenarios();
    let kinds: Vec<&'static str> = list_scenario_kinds().iter().map(|m| m.name).collect();
    for k in &kinds {
        assert!(
            refs.contains_key(*k),
            "{k} has no reference scenario under scenarios/"
        );
    }
    // Every kind runs twice (tiered and untiered); spread the kinds over the cores.
    let threads = std::thread::available_parallelism().map_or(4, |n| n.get());
    let next = std::sync::atomic::AtomicUsize::new(0);
    let failures = std::sync::Mutex::new(Vec::new());
    std::thread::scope(|scope| {
        for _ in 0..threads {
            scope.spawn(|| loop {
                let i = next.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
                let Some(k) = kinds.get(i) else { break };
                if let Err(e) = check_kind(k, &refs[*k]) {
                    failures.lock().unwrap().push(e);
                }
            });
        }
    });
    let failures = failures.into_inner().unwrap();
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}

#[test]
fn a_frozen_prediction_kind_never_gains_figure_tiers() {
    // PIN-SCOPE:    which kinds are frozen
    // PIN-EXCLUDES: everything else
    assert_eq!(FROZEN_PREDICTION_KINDS, ["lunar-station-coverage"]);
    for k in FROZEN_PREDICTION_KINDS {
        assert!(kind_figures(k).is_none(), "{k} must have no table entry");
        assert!(kshana::fom_label::kind_figure_tiers(k, &serde_json::json!({})).is_none());
    }
}
