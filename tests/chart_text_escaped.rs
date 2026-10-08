// SPDX-License-Identifier: AGPL-3.0-only
//! Text a scenario carries into a chart is written as text, never as markup.
//!
//! A chart's labels come partly from the scenario that was run (a clock's id, a parameter's
//! name, a title). Chart markup is shown in the Studio and written to `*.chart.svg`, so a
//! string with `<`, `>`, `&` or a quote in it must come out escaped. For every bundled
//! scenario this test finds the string literals whose text reaches the chart, puts markup
//! into them, runs the scenario again and requires the chart to contain that markup only as
//! escaped text. All of a scenario's reaching literals are changed in one run; when the engine
//! rejects the run (a name it looks up, an enum) or the markup shows, the set is split in two
//! and each half run, so a rejected literal is dropped and an offending one is named.
//!
//! To fix a failure: write the string with `kshana::chart::esc` (or pass it to a `chart::`
//! helper that escapes, such as `frame_open`, `y_axis` and `panel_axes`).

use kshana::api::run_toml;
use std::collections::BTreeSet;
use std::path::Path;

/// Markup that would draw an element and run a handler if it reached a chart unescaped. It is
/// written inside a TOML basic string, hence the `\"`.
const MARKUP: &str = r#"</text><image href=\"x\" onerror=\"x\"/><text>"#;
/// What the same markup looks like once it is in the chart as written (no `\`).
const RAW: &str = r#"<image href="x" onerror="x"/>"#;

/// The basic-string literals of a scenario (no escapes, one line) with at least one letter.
fn literals(src: &str) -> BTreeSet<String> {
    let mut out = BTreeSet::new();
    for line in src.lines() {
        let line = line.split('#').next().unwrap_or("");
        let mut parts = line.split('"');
        parts.next();
        while let (Some(inside), Some(_)) = (parts.next(), parts.next()) {
            if inside.chars().any(|c| c.is_ascii_alphabetic())
                && inside.len() <= 120
                && !inside.contains('\\')
                && inside != "x"
            {
                out.insert(inside.to_string());
            }
        }
    }
    out
}

/// The `kind` a scenario declares (its first `kind = "..."`), or "" when it has none.
fn kind_of(src: &str) -> String {
    src.lines()
        .filter_map(|l| l.trim().strip_prefix("kind"))
        .filter_map(|r| r.trim_start().strip_prefix('='))
        .filter_map(|r| r.trim().strip_prefix('"').and_then(|r| r.split('"').next()))
        .next()
        .unwrap_or("")
        .to_string()
}

/// Put markup into each of `lits` in `src`, run it, and record every literal whose markup shows
/// in the chart. `probed` counts the literals that ran to a chart.
fn probe(src: &str, lits: &[String], probed: &mut usize, offenders: &mut Vec<String>) {
    if lits.is_empty() {
        return;
    }
    let mut changed = src.to_string();
    for lit in lits {
        changed = changed.replace(&format!("\"{lit}\""), &format!("\"{lit}{MARKUP}\""));
    }
    // Rejected: the engine refused the run (so some literal is a name it looks up).
    // Shows: it ran and the markup is in the chart. Clean: it ran and the markup is not.
    let (rejected, shows) = match run_toml(&changed) {
        Ok(out) => {
            *probed += lits.len();
            (false, out.svg.contains(RAW))
        }
        Err(_) => (true, false),
    };
    if !rejected && !shows {
        return;
    }
    if let [only] = lits {
        if shows {
            offenders.push(only.clone());
        }
        return;
    }
    let (a, b) = lits.split_at(lits.len() / 2);
    probe(src, a, probed, offenders);
    probe(src, b, probed, offenders);
}

#[test]
fn scenario_text_reaches_charts_only_as_escaped_text() {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("scenarios");
    let mut files: Vec<_> = std::fs::read_dir(&dir)
        .expect("scenarios/")
        .filter_map(Result::ok)
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .collect();
    files.sort();

    let (mut ran, mut probed) = (0usize, 0usize);
    let mut seen: BTreeSet<(String, String)> = BTreeSet::new();
    let mut offenders = Vec::new();
    for path in &files {
        let name = path.file_name().unwrap().to_string_lossy().to_string();
        if SKIPPED.contains(&name.as_str()) {
            continue;
        }
        let src = std::fs::read_to_string(path).expect("scenario text");
        let Ok(base) = run_toml(&src) else { continue };
        ran += 1;
        // The same text under the same kind goes through the same code: probe it once.
        let kind = kind_of(&src);
        let lits: Vec<String> = literals(&src)
            .into_iter()
            .filter(|l| base.svg.contains(l.as_str()) && seen.insert((kind.clone(), l.clone())))
            .collect();
        let mut bad = Vec::new();
        probe(&src, &lits, &mut probed, &mut bad);
        offenders.extend(
            bad.into_iter()
                .map(|l| format!("{name}: the text {l:?} reaches the chart unescaped")),
        );
    }
    assert!(ran > 100, "the bundled scenarios ran ({ran})");
    assert!(
        probed > 40,
        "text reached charts often enough to be tested ({probed})"
    );
    assert!(
        offenders.is_empty(),
        "scenario text is written into chart markup without escaping:\n  {}",
        offenders.join("\n  ")
    );
}

/// Scenarios that take more than a few seconds in a debug build (measured), left out to keep this
/// test to a few minutes. Their charts are written by the same helpers (`chart::frame_open`,
/// `y_axis`, `panel_axes`, `esc`) as the quicker scenarios of their family.
const SKIPPED: &[&str] = &[
    "campaign-monte-carlo-clock-holdover.toml",
    "cislunar-arc-recovery.toml",
    "cislunar-observability.toml",
    "hybrid-ukf.toml",
    "leo-focus-ppp-altitude.toml",
    "leo-navmsg-celeste-iod.toml",
    "leo-navmsg-fit-interval-trade.toml",
    "leo-navmsg-midpass-update.toml",
    "leo-navmsg-model-comparison.toml",
    "mars-pnt-transfer.toml",
];
