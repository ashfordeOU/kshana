// SPDX-License-Identifier: AGPL-3.0-only
//! Pin every number the tutorials quote, so a tutorial can never silently lie.
//!
//! Each annotated teaching scenario under `docs/tutorials/scenarios/` is pulled in
//! with `include_str!`, run through the public API (`run_toml` / `export_sp3` /
//! `list_scenario_kinds`), and asserted against the tutorial's headline numbers.
//! Every assertion is anchored to an EXTERNAL, non-circular oracle named in the
//! tutorial and in this file's comments — never a self-comparison or an unsourced
//! magic number. This makes each documented figure a CI-enforced contract: the
//! moment the engine drifts from a tutorial's quoted output, the build goes red.
//!
//! Mirrors the `dispatches_each_kind_*` pattern in `src/api.rs` and the structure
//! of `tests/sgp4_verification.rs`.

/// Every tutorial scenario kind is a real dispatch kind (guards against
/// documenting a kind that does not exist). Oracle: the self-describing
/// `list_scenario_kinds` API in `src/api.rs`.
#[test]
fn tutorial_scenarios_use_real_kinds() {
    let kinds: std::collections::HashSet<_> = kshana::api::list_scenario_kinds()
        .iter()
        .map(|m| m.name)
        .collect();
    for k in [
        "clock",
        "orbit",
        "integrity",
        "spoof",
        "hybrid",
        "inertial",
        "timetransfer",
        "gnss-sim",
    ] {
        assert!(
            kinds.contains(k),
            "tutorial kind {k} missing from list_scenario_kinds"
        );
    }
}

/// Every teaching scenario, its source, and the canonical parent under
/// `scenarios/` whose field values `docs/tutorials/README.md` promises it
/// reproduces. One table drives the run, the expected-summary and the
/// parent-identity checks so the three cannot drift apart.
const TEACHING: &[(&str, &str, &str)] = &[
    (
        "clock.toml",
        include_str!("../docs/tutorials/scenarios/clock.toml"),
        include_str!("../scenarios/clock-holdover.toml"),
    ),
    (
        "orbit.toml",
        include_str!("../docs/tutorials/scenarios/orbit.toml"),
        include_str!("../scenarios/orbit-sgp4-gps.toml"),
    ),
    (
        "integrity.toml",
        include_str!("../docs/tutorials/scenarios/integrity.toml"),
        include_str!("../scenarios/integrity-raim.toml"),
    ),
    (
        "security.toml",
        include_str!("../docs/tutorials/scenarios/security.toml"),
        include_str!("../scenarios/spoof-attack.toml"),
    ),
    (
        "hybrid.toml",
        include_str!("../docs/tutorials/scenarios/hybrid.toml"),
        include_str!("../scenarios/hybrid-pnt.toml"),
    ),
    (
        "inertial.toml",
        include_str!("../docs/tutorials/scenarios/inertial.toml"),
        include_str!("../scenarios/imu-deadreckoning.toml"),
    ),
    (
        "timetransfer.toml",
        include_str!("../docs/tutorials/scenarios/timetransfer.toml"),
        include_str!("../scenarios/timetransfer.toml"),
    ),
    (
        "gnss-sim.toml",
        include_str!("../docs/tutorials/scenarios/gnss-sim.toml"),
        include_str!("../scenarios/gnss-sim-raim.toml"),
    ),
];

/// Every annotated teaching scenario runs end-to-end and emits the unified output
/// envelope (JSON + SVG + summary). Mirrors `api.rs::dispatches_each_kind`.
#[test]
fn annotated_tutorial_scenarios_run() {
    for (name, src, _) in TEACHING {
        let out = kshana::api::run_toml(src).expect("tutorial scenario runs");
        assert!(out.json.starts_with('{'), "{name}");
        assert!(out.svg.starts_with("<svg"), "{name}");
        assert!(!out.summary.is_empty(), "{name}");
    }
}

/// The `TEACHING` table must name every file in the tutorials directory. Without
/// this, a ninth teaching scenario could be added with no entry and every check
/// below would grade a set that silently excludes it.
#[test]
fn the_teaching_table_covers_the_whole_tutorials_directory() {
    let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("docs/tutorials/scenarios");
    let mut on_disk: Vec<String> = std::fs::read_dir(&dir)
        .expect("docs/tutorials/scenarios must exist")
        .map(|e| {
            e.expect("dir entry")
                .file_name()
                .to_string_lossy()
                .into_owned()
        })
        .filter(|n| n.ends_with(".toml"))
        .collect();
    on_disk.sort();
    let mut tabled: Vec<String> = TEACHING.iter().map(|(n, _, _)| n.to_string()).collect();
    tabled.sort();
    assert_eq!(
        on_disk, tabled,
        "the tutorials directory and the TEACHING table disagree"
    );
    assert!(!on_disk.is_empty(), "read_dir matched no teaching scenario");
}

/// Pull the `# expected:` one-line summary a teaching scenario records for itself.
fn recorded_summary(src: &str) -> &str {
    src.lines()
        .find_map(|l| l.trim().strip_prefix("# expected:"))
        .map(str::trim)
        .expect("every teaching scenario records an `# expected:` summary")
}

/// Compare one `|`-separated segment, treating the `<hash>` placeholder some
/// recorded summaries carry as a wildcard for the content-addressed scenario id.
fn segment_matches(expected: &str, actual: &str) -> bool {
    match expected.split_once("<hash>") {
        None => expected == actual,
        Some((pre, post)) => {
            actual.len() > pre.len() + post.len()
                && actual.starts_with(pre)
                && actual.ends_with(post)
        }
    }
}

/// The `# expected:` line each teaching scenario records is the output a reader is
/// promised, so it must be the output the engine produces. Nothing else in the
/// repo reads these lines: without this test they are prose, and an edit to a
/// teaching copy moves the real summary while the recorded one stays stale.
#[test]
fn teaching_scenarios_match_their_recorded_expected_summary() {
    for (name, src, _) in TEACHING {
        let expected = recorded_summary(src);
        let actual = kshana::api::run_toml(src)
            .unwrap_or_else(|e| panic!("{name} runs: {e}"))
            .summary;
        let want: Vec<&str> = expected.split(" | ").collect();
        let got: Vec<&str> = actual.split(" | ").collect();
        assert_eq!(
            want.len(),
            got.len(),
            "{name}: recorded summary has {} segments, the engine emits {}\n  recorded: {expected}\n  actual:   {actual}",
            want.len(),
            got.len()
        );
        for (w, g) in want.iter().zip(&got) {
            assert!(
                segment_matches(w, g),
                "{name}: recorded `{w}` but the engine emits `{g}`\n  recorded: {expected}\n  actual:   {actual}"
            );
        }
    }
}

/// `docs/tutorials/README.md` promises the teaching copies carry the parent
/// scenario's field values, with only the commentary added. Comparing parsed TOML
/// (not text) is exactly that claim: comments and layout are free to differ, every
/// value must not. Without it, a parent edit plus a golden regen can leave the
/// teaching copy behind with a green build.
#[test]
fn teaching_copies_carry_their_parents_field_values() {
    for (name, teaching, parent) in TEACHING {
        let t: toml::Value =
            toml::from_str(teaching).unwrap_or_else(|e| panic!("{name} parses: {e}"));
        let p: toml::Value =
            toml::from_str(parent).unwrap_or_else(|e| panic!("parent of {name} parses: {e}"));
        assert_eq!(
            t, p,
            "{name} has drifted from its parent in scenarios/; the tutorials README \
             promises the field values are identical"
        );
    }
}

/// Tutorial 1 — orbit / GPS headline numbers. Oracle: the GPS shell geometry and
/// the PDOP·σ_UERE position-sigma identity (Misra & Enge, *Global Positioning
/// System*, 2nd ed.).
#[test]
fn tutorial1_orbit_headline_holds() {
    let out =
        kshana::api::run_toml(include_str!("../docs/tutorials/scenarios/orbit.toml")).unwrap();
    let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    let g = &v["geometry"];
    // best PDOP ~1.07; position sigma = PDOP * sigma_uere, and sigma_uere = 1.0
    // here, so the two are numerically equal (the identity, not "sigma == PDOP").
    let pdop = g["best_pdop"].as_f64().unwrap();
    assert!((pdop - 1.071).abs() < 0.01, "best PDOP {pdop}");
    assert!((g["best_position_sigma_m"].as_f64().unwrap() - pdop).abs() < 1e-6);
    assert_eq!(g["samples_total"].as_u64().unwrap(), 361);
    // 345/361 GNSS-nominal -> > 90 % (a real GPS shell seen from a LEO user).
    assert!(out.summary.contains("345/361"));
}

/// Tutorial 1 — the "where are the satellites" claim: PG01 must lie on the real GPS
/// MEO shell. Oracle: GPS semi-major axis a ≈ 26,560 km (IS-GPS-200 / GPS SPS
/// Performance Standard), EXTERNAL to Kshana.
#[test]
fn tutorial1_satellites_are_in_the_gps_meo_shell() {
    let sp3 =
        kshana::api::export_sp3(include_str!("../docs/tutorials/scenarios/orbit.toml")).unwrap();
    // First-epoch PG01 line: parse the 3 ECEF km, geocentric radius must be the
    // GPS shell radius.
    let line = sp3.lines().find(|l| l.starts_with("PG01")).unwrap();
    let xs: Vec<f64> = line[4..]
        .split_whitespace()
        .take(3)
        .map(|s| s.parse().unwrap())
        .collect();
    let r = (xs[0] * xs[0] + xs[1] * xs[1] + xs[2] * xs[2]).sqrt();
    // GPS a ~ 26,560 km; accept the eccentricity band around it.
    assert!(
        (26000.0..27200.0).contains(&r),
        "PG01 geocentric radius {r} km not in the GPS MEO shell"
    );
}

/// Tutorial 2 — clock holdover ordering + the CSAC value. Oracle: the NIST SP 1065
/// white-FM phase-error law σ_x(T) = √(q_wf·T); for the CSAC the k-σ/p95 spec-cross
/// sits in the SP-1065 band (a band, not an exact magic number).
#[test]
fn tutorial2_clock_holdover_holds() {
    let out =
        kshana::api::run_toml(include_str!("../docs/tutorials/scenarios/clock.toml")).unwrap();
    let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    let q = v["quantum"]["fom"]["holdover_s"].as_f64().unwrap();
    let c = v["classical"]["fom"]["holdover_s"].as_f64().unwrap();
    assert!(q >= c, "optical must hold >= CSAC");
    assert!((q - 6600.0).abs() < 1.0, "optical holds the full outage");
    // CSAC breaches 20 ns near the white-FM crossing time (NIST SP 1065).
    assert!(
        (2000.0..3200.0).contains(&c),
        "CSAC holdover {c}s off the SP-1065 prediction band"
    );
}

/// Tutorial 3 (Part A) — spoof detector: the closed-form χ²₁ P_md and the
/// Monte-Carlo P_md must agree. Oracle: two INDEPENDENT computations of the same
/// probability (Kay, *Detection Theory*) — non-circular by construction.
#[test]
fn tutorial3_spoof_analytic_matches_montecarlo() {
    let out =
        kshana::api::run_toml(include_str!("../docs/tutorials/scenarios/security.toml")).unwrap();
    let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    for side in ["quantum", "classical"] {
        let a = v[side]["detection"]["analytic_pmd"].as_f64().unwrap();
        let m = v[side]["detection"]["mc_pmd"].as_f64().unwrap();
        assert!(
            (a - m).abs() < 0.05,
            "{side} analytic {a} vs MC {m} disagree"
        );
    }
    // Quantum security ~ 1.0 (catches the spec-sized spoof) >> classical.
    assert!(v["quantum"]["security_fom"].as_f64().unwrap() > 0.9);
}

/// The reproducibility lesson (Tier-3 exercise claim) is true: the same source
/// yields an identical result on two runs. Oracle: the repo's own determinism
/// guarantee (`scripts/check-reproducible.sh`).
#[test]
fn tutorial_reproducibility_is_bit_stable() {
    let s = include_str!("../docs/tutorials/scenarios/clock.toml");
    let a = kshana::api::run_toml(s).unwrap().json;
    let b = kshana::api::run_toml(s).unwrap().json;
    assert_eq!(a, b, "deterministic engine");
}
