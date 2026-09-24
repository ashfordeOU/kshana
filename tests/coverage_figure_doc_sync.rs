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
    let badge = format!("badge/coverage-~{n}%25%20line");
    let surfaces: [(&str, &str, String); 6] = [
        (
            "README.md badge",
            include_str!("../README.md"),
            badge.clone(),
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
        (
            "web/index.html hero",
            include_str!("../web/index.html"),
            format!("<b>~{n}%</b><span>line coverage</span>"),
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
}
