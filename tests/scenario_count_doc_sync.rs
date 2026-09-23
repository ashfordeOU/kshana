//! Regression guard: the README's machine-readable scenario-kind counts must stay
//! in lock-step with the dispatcher.
//!
//! The README states the number of dispatchable scenario kinds in three places. Two of
//! them are digit-form ("typed dispatch over N kinds" in the architecture diagram and
//! "(N kinds)" in the repo-layout tree); this test pins both to the single source of
//! truth, `api::list_scenario_kinds()`. A previous audit found these counts had drifted
//! (the README said 21/32 while the dispatcher exposed 34) because the number was
//! hand-maintained — this guard makes that drift a build failure instead of a silent
//! documentation lie.
//!
//! If you add or remove a scenario kind, update the README counts; this test will tell
//! you exactly which sites are stale.

#[test]
fn readme_dispatch_counts_match_the_api() {
    let n = kshana::api::list_scenario_kinds().len();
    let readme = include_str!("../README.md");

    let mermaid = format!("typed dispatch over {n} kinds");
    assert!(
        readme.contains(&mermaid),
        "README architecture-diagram scenario count is out of sync with \
         api::list_scenario_kinds() (= {n}); expected the substring {mermaid:?}. \
         Update the `api — run_toml: typed dispatch over N kinds` node in README.md."
    );

    let layout = format!("({n} kinds)");
    assert!(
        readme.contains(&layout),
        "README repo-layout scenario count is out of sync with \
         api::list_scenario_kinds() (= {n}); expected the substring {layout:?}. \
         Update the `typed dispatch (N kinds)` line in README.md."
    );

    // docs/ARCHITECTURE.md's §4 dispatch diagram states the count too; it previously
    // drifted to "20 kinds" while this README count stayed pinned at the true value, so
    // pin the architecture doc to the same source of truth.
    let arch = include_str!("../docs/ARCHITECTURE.md");
    let arch_count = format!("{n} kinds");
    assert!(
        arch.contains(&arch_count),
        "docs/ARCHITECTURE.md scenario count is out of sync with \
         api::list_scenario_kinds() (= {n}); expected the substring {arch_count:?}. \
         Update the `ScenarioKind::classify … N kinds` node in the §4 dispatch diagram."
    );
}

/// The README also states how many scenario FILES ship, and nothing pinned that.
///
/// The kind count above is read from `api::list_scenario_kinds()`, so it cannot drift. The
/// file count was a hand-typed figure on a surface no test read, which is the same shape as
/// every drift this file already guards against — a number in prose is a copy of a fact, and
/// copies go stale silently. It was correct when written; that is not a reason to leave it
/// unpinned, it is the reason the drift would have been invisible.
///
/// "Scenario file" means a runnable `.toml` under `scenarios/`. The suite manifests are
/// excluded deliberately: `*.suite.toml` is a study that LISTS scenarios (it carries a
/// `scenarios = [...]` array and no scenario body of its own), so counting it would count a
/// table of contents as a chapter.
#[test]
fn readme_scenario_file_count_matches_the_directory() {
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut files: Vec<String> = std::fs::read_dir(root.join("scenarios"))
        .expect("scenarios/ must exist")
        .filter_map(|e| e.ok())
        .map(|e| e.file_name().to_string_lossy().into_owned())
        .filter(|n| n.ends_with(".toml") && !n.ends_with(".suite.toml"))
        .collect();
    files.sort();
    let n = files.len();

    // A directory read that matched nothing would satisfy the assertion below vacuously
    // against a README that had also lost its number. Refuse the empty case outright.
    assert!(
        n > 50,
        "only {n} scenario .toml files found under scenarios/ — the directory walk is          probably wrong, and a count this low would make the README check meaningless"
    );

    let readme = include_str!("../README.md");
    let claim = format!("{n} scenario");
    assert!(
        readme.contains(&claim),
        "README scenario-FILE count is out of sync with scenarios/ (= {n} runnable .toml          files, excluding *.suite.toml); expected the substring {claim:?}. Update the          \"(61 kinds, N scenario files)\" line in README.md."
    );
}

/// The count above was pinned in three places. This test exists because that was not all
/// of them, and the docstring at the top of this file said so out loud — "the README
/// states the number ... in three places. **Two** of them are digit-form" — and then
/// pinned only those two plus the architecture doc. The unpinned places had drifted:
///
/// | surface | said | truth |
/// |---|---|---|
/// | `docs/diagrams/system-overview.mmd` (the hero diagram's SOURCE) | 44 | 59 |
/// | `docs/assets/diagrams/system-overview.svg` / `.png` (the rendered hero image) | 44 | 59 |
/// | `README.md` hero-image `alt` text | 50 | 59 |
/// | `mcp/kshana-mcp/README.md` (the published MCP-server README) | 50 | 59 |
///
/// Three different numbers for one quantity, across two artefacts and two alt-texts,
/// while every guarded site stayed green. Two lessons are encoded here. First, an `alt`
/// attribute is a published surface — a screen reader reads it aloud, an indexer indexes
/// it, and it is the only text a reader gets when the image does not load — so it is
/// pinned exactly like prose. Second, a count inside a *rendered image* cannot be read by
/// a test at all; the defence is to pin the image's text SOURCE (the `.mmd`) and the
/// rendered SVG's text content, and to bind the PNG to the SVG it came from (see
/// `each_rendered_png_was_rendered_from_the_committed_svg`).
#[test]
fn every_scenario_count_surface_matches_the_dispatcher() {
    let n = kshana::api::list_scenario_kinds().len();

    let readme = include_str!("../README.md");
    let mmd = include_str!("../docs/diagrams/system-overview.mmd");
    let svg = include_str!("../docs/assets/diagrams/system-overview.svg");
    // The module map states the same count in its own words, and nothing watched it: it
    // read "44 kinds" while the dispatcher had 61 and every check here stayed green,
    // because this test only ever listed the hero diagram. A second diagram carrying the
    // same number is a second place it can go stale, so it is listed now.
    let map_mmd = include_str!("../docs/diagrams/module-map.mmd");
    let map_svg = include_str!("../docs/assets/diagrams/module-map.svg");
    let mcp = include_str!("../mcp/kshana-mcp/README.md");
    let scenarios = include_str!("../docs/SCENARIOS.md");

    // The SVG splits a label across one <tspan> per word, so the count and the words after
    // it are in different elements. Strip the markup and search the concatenated text.
    let svg_text = strip_xml_tags(svg);
    let map_svg_text = strip_xml_tags(map_svg);

    let checks: Vec<(&str, &str, String)> = vec![
        (
            "README.md (hero-image alt text)",
            readme,
            format!("api::run_toml dispatch over {n} scenario kinds"),
        ),
        (
            "docs/diagrams/system-overview.mmd (the diagram's source)",
            mmd,
            format!("{n} ScenarioKind variants"),
        ),
        (
            "docs/assets/diagrams/system-overview.svg (rendered hero diagram)",
            &svg_text,
            format!("{n} ScenarioKind variants"),
        ),
        (
            "mcp/kshana-mcp/README.md (published MCP server README)",
            mcp,
            format!("The {n} built-in scenario kinds with descriptions"),
        ),
        (
            "docs/SCENARIOS.md (generated reference header)",
            scenarios,
            format!("The {n} built-in scenario kinds that"),
        ),
        (
            "docs/diagrams/module-map.mmd (the module map's source)",
            map_mmd,
            format!("typed dispatch over {n} kinds"),
        ),
        (
            "docs/assets/diagrams/module-map.svg (rendered module map)",
            &map_svg_text,
            format!("typed dispatch over {n} kinds"),
        ),
    ];

    let stale: Vec<String> = checks
        .iter()
        .filter(|(_, body, expected)| !body.contains(expected.as_str()))
        .map(|(name, _, expected)| format!("  {name}: expected substring {expected:?}"))
        .collect();

    assert!(
        stale.is_empty(),
        "Scenario-kind counts are out of sync with api::list_scenario_kinds() (= {n}). \
         Update each listed site. If the hero diagram is one of them, edit \
         docs/diagrams/system-overview.mmd and then re-render with \
         `tools/render-diagram.sh system-overview`, which rewrites the SVG's count, the \
         PNG, and the render record in one step:\n{}",
        stale.join("\n")
    );
}

/// A PNG cannot be text-searched, so the count inside the hero diagram is guarded one
/// step back: the SVG's text is pinned by the test above, and this test binds the PNG to
/// the exact SVG bytes it was rendered from. Editing an SVG and forgetting to re-render
/// its PNG — the failure that let the README's hero image show `44` while its own SVG
/// source was being corrected — is then a build failure rather than a silent mismatch
/// between the picture and the page around it.
///
/// `tools/render-diagram.sh` re-renders a PNG and updates the record together, so the two
/// cannot drift apart by hand.
#[test]
fn each_rendered_png_was_rendered_from_the_committed_svg() {
    use std::path::Path;

    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let record_path = root.join("docs/assets/diagrams/rendered-from.json");
    let record: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&record_path).expect("render record"))
            .expect("render record is valid JSON");

    let entries = record["rendered"]
        .as_object()
        .expect("`rendered` object in the render record");
    assert!(
        !entries.is_empty(),
        "the render record lists no diagrams; it must cover every PNG in docs/assets/diagrams"
    );

    // Every PNG in the directory must be covered — a new diagram cannot opt out by
    // simply not being listed.
    let mut on_disk: Vec<String> = std::fs::read_dir(root.join("docs/assets/diagrams"))
        .expect("diagrams dir")
        .filter_map(|e| e.ok())
        .map(|e| e.file_name().to_string_lossy().into_owned())
        .filter(|f| f.ends_with(".png"))
        .collect();
    on_disk.sort();
    let missing: Vec<&String> = on_disk
        .iter()
        .filter(|f| !entries.contains_key(*f))
        .collect();
    assert!(
        missing.is_empty(),
        "these rendered PNGs are not covered by docs/assets/diagrams/rendered-from.json, \
         so nothing checks they match their SVG: {missing:?}. Render them with \
         tools/render-diagram.sh, which adds the record entry."
    );

    let mut stale = Vec::new();
    for (png, meta) in entries {
        let svg_name = meta["svg"].as_str().expect("svg name");
        let recorded = meta["svg_sha256"].as_str().expect("svg_sha256");
        let svg_path = root.join("docs/assets/diagrams").join(svg_name);
        let bytes = std::fs::read(&svg_path).unwrap_or_else(|e| panic!("{svg_name}: {e}"));
        let actual = sha256_hex(&bytes);
        if actual != recorded {
            stale.push(format!(
                "  {png}: rendered from {svg_name}@{recorded:.12}…, but that SVG is now \
                 {actual:.12}… — the PNG is stale"
            ));
        }
    }

    assert!(
        stale.is_empty(),
        "A diagram SVG changed without its PNG being re-rendered, so the image the README \
         shows no longer matches its own source. Re-render with \
         `tools/render-diagram.sh <name>`:\n{}",
        stale.join("\n")
    );
}

/// Concatenated element text with all markup removed — enough to search a rendered SVG
/// for a label that the renderer split across sibling `<tspan>`s.
fn strip_xml_tags(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    let mut in_tag = false;
    for c in s.chars() {
        match c {
            '<' => in_tag = true,
            '>' => in_tag = false,
            _ if !in_tag => out.push(c),
            _ => {}
        }
    }
    out
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    let mut h = Sha256::new();
    h.update(bytes);
    h.finalize().iter().map(|b| format!("{b:02x}")).collect()
}
