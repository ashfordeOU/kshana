//! The coverage headline was the one hand-maintained headline number in the project: five
//! public surfaces said "~96%", nothing measured it, and it had already moved once (97 → 96)
//! without any surface noticing. docs/COVERAGE.md now records a dated, runner-produced
//! measurement; this test pins every surface to that record, rounded to a whole percent.

fn recorded_percent() -> f64 {
    let doc = include_str!("../docs/COVERAGE.md");
    let line = doc
        .lines()
        .find(|l| l.starts_with("| Measured |"))
        .expect("docs/COVERAGE.md has no `| Measured |` row");
    let start = line.find("**").expect("measured value is bold") + 2;
    let end = line[start..]
        .find(" %")
        .expect("measured value ends with ` %`")
        + start;
    line[start..end]
        .trim()
        .parse()
        .expect("measured value parses as a number")
}

#[test]
fn every_coverage_surface_states_the_recorded_measurement() {
    let pct = recorded_percent();
    assert!(
        (50.0..=100.0).contains(&pct),
        "recorded coverage {pct} is implausible — the parser read the wrong number"
    );
    let n = pct.round() as u32;
    // The badge reads "~N%": shields ends the message at the next `-`, so pin that too.
    let badge = format!("badge/coverage-~{n}%25-");
    let surfaces: [(&str, &str, String); 7] = [
        (
            "README.md badge",
            include_str!("../README.md"),
            badge.clone(),
        ),
        (
            "README.md Evidence section",
            include_str!("../README.md"),
            format!("near {n} % line coverage"),
        ),
        (
            "README.md CI table",
            include_str!("../README.md"),
            format!("**~{n} % line**"),
        ),
        (
            "README.crates.md badge",
            include_str!("../README.crates.md"),
            badge.clone(),
        ),
        (
            "README.pypi.md badge",
            include_str!("../README.pypi.md"),
            badge,
        ),
        (
            "paper/kshana-technical-report.md",
            include_str!("../paper/kshana-technical-report.md"),
            format!("near {n} % line coverage"),
        ),
        // The redesigned site states the measurement on its coverage page, which is built
        // from docs/COVERAGE.md; the home page no longer carries a coverage figure (the
        // check below keeps it that way unless it is the recorded one).
        (
            "web/docs/line-coverage.html",
            include_str!("../web/docs/line-coverage.html"),
            format!("{pct} %"),
        ),
    ];
    let stale: Vec<String> = surfaces
        .iter()
        .filter(|(_, text, want)| !text.contains(want.as_str()))
        .map(|(name, _, want)| format!("  {name}: expected {want:?}"))
        .collect();
    assert!(
        stale.is_empty(),
        "docs/COVERAGE.md records {pct} % (→ ~{n}%), but these surfaces do not say so:\n{}",
        stale.join("\n")
    );

    // The single-page site's hero said "~N% line coverage". The redesigned home page does
    // not state one; if a coverage figure comes back there, it must be the recorded one.
    let home = include_str!("../web/index.html");
    for (idx, _) in home.match_indices("line coverage") {
        let lo = home[..idx]
            .char_indices()
            .rev()
            .nth(40)
            .map(|(i, _)| i)
            .unwrap_or(0);
        let near = &home[lo..idx];
        if near.contains('%') {
            assert!(
                near.contains(&format!("{n}%")) || near.contains(&format!("{n} %")),
                "web/index.html states a line-coverage figure that is not ~{n}%: {near:?}"
            );
        }
    }
}
