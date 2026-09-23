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
//!
//! That "three places" sentence is left standing verbatim because
//! `every_scenario_count_surface_matches_the_dispatcher` below quotes it as evidence — it
//! was wrong, and being able to read what the file used to claim is the point. The count is
//! now stated on fifteen sites across eleven surfaces, and this file guards them three
//! ways: presence checks that pin each known site, one absence scan that fails on ANY
//! stated kind count that is not the dispatcher's (so an unlisted site is caught the moment
//! it appears), and a check that the MCP server's published tool table lists exactly the
//! tools it serves. Prose surfaces are matched whitespace-collapsed, so a markdown re-flow
//! cannot silently stop a guard from firing.

#[test]
fn readme_dispatch_counts_match_the_api() {
    let n = kshana::api::list_scenario_kinds().len();
    // Prose re-flows. If a markdown line is re-wrapped between two words of a pinned
    // phrase the substring stops matching although no digit changed: the guard then reds
    // on a README that is correct, and the cheapest way to make it green again is to
    // loosen it. Collapsing runs of whitespace to one space first pins the words and not
    // the line breaks, so a re-wrap cannot silently stop a match from firing.
    let readme = collapse_ws(include_str!("../README.md"));
    // docs/ARCHITECTURE.md's §4 dispatch diagram states the count too; it previously
    // drifted to "20 kinds" while this README count stayed pinned at the true value, so
    // pin the architecture doc to the same source of truth.
    let arch = collapse_ws(include_str!("../docs/ARCHITECTURE.md"));

    // Collected rather than asserted one after another: three `assert!`s in sequence stop
    // at the first failure, so one stale site hides the two behind it and a mutation test
    // can only ever prove the first guard.
    let checks: Vec<(&str, &str, String)> = vec![
        (
            "README.md (the `api — run_toml` node in the architecture diagram)",
            &readme,
            format!("typed dispatch over {n} kinds"),
        ),
        (
            "README.md (the `typed dispatch (N kinds)` line in the repo-layout tree)",
            &readme,
            format!("({n} kinds)"),
        ),
        (
            "docs/ARCHITECTURE.md (the `ScenarioKind::classify … N kinds` node in §4)",
            &arch,
            format!("{n} kinds"),
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
         Update each listed site:\n{}",
        stale.join("\n")
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
    let names: Vec<String> = std::fs::read_dir(root.join("scenarios"))
        .expect("scenarios/ must exist")
        .filter_map(|e| e.ok())
        .map(|e| e.file_name().to_string_lossy().into_owned())
        .filter(|f| f.ends_with(".toml"))
        .collect();
    let n = names.iter().filter(|f| !f.ends_with(".suite.toml")).count();
    let suites = names.iter().filter(|f| f.ends_with(".suite.toml")).count();

    // A directory read that matched nothing would satisfy the assertion below vacuously
    // against a README that had also lost its number. Refuse the empty case outright.
    assert!(
        n > 50,
        "only {n} scenario .toml files found under scenarios/ — the directory walk is \
         probably wrong, and a count this low would make the README check meaningless"
    );
    assert!(
        suites >= 1,
        "no *.suite.toml manifest found under scenarios/ — the suite half of the README \
         claim below would then be pinned against nothing"
    );

    // The README sentence states THREE numbers — kinds, runnable files, suite manifests —
    // and only the middle one was pinned, by the substring "N scenario". That matches
    // anywhere in the file, so the kind count in front of it and the manifest count behind
    // it were free to drift while this test stayed green. Pin the whole sentence.
    //
    // The README wraps that sentence across two source lines, between "scenario" and
    // "`.toml`", so the claim only matches on whitespace-collapsed text — which is exactly
    // the property that makes a later re-wrap harmless instead of a spurious red.
    let kinds = kshana::api::list_scenario_kinds().len();
    let readme = collapse_ws(include_str!("../README.md"));
    // "manifest" is left unsuffixed so the claim still matches if a second suite lands and
    // the prose becomes "manifests"; the digit in front of it is what is being pinned.
    let claim = format!("({kinds} kinds, {n} scenario `.toml` files + {suites} suite manifest");
    assert!(
        readme.contains(&claim),
        "The README's `scenarios/` sentence is out of sync: the dispatcher has {kinds} kinds \
         and scenarios/ holds {n} runnable .toml files plus {suites} suite manifest(s). \
         Expected the whitespace-collapsed substring {claim:?}. Update the \"See `scenarios/` \
         for at least one worked example of every kind\" sentence in README.md."
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

    // Collapsed for the same reason as in `readme_dispatch_counts_match_the_api`: these
    // are prose surfaces, a re-wrap must not decide whether a count guard fires.
    let readme = collapse_ws(include_str!("../README.md"));
    let mmd = include_str!("../docs/diagrams/system-overview.mmd");
    let svg = include_str!("../docs/assets/diagrams/system-overview.svg");
    // The module map states the same count in its own words, and nothing watched it: it
    // read "44 kinds" while the dispatcher had 61 and every check here stayed green,
    // because this test only ever listed the hero diagram. A second diagram carrying the
    // same number is a second place it can go stale, so it is listed now.
    let map_mmd = include_str!("../docs/diagrams/module-map.mmd");
    let map_svg = include_str!("../docs/assets/diagrams/module-map.svg");
    let mcp = collapse_ws(include_str!("../mcp/kshana-mcp/README.md"));
    let scenarios = collapse_ws(include_str!("../docs/SCENARIOS.md"));
    // commands/kshana-run.md is the packaged slash command: it ships to an agent, states
    // the kind count in prose, and no test read it. A wrong count there is a wrong count
    // inside a distributed plugin, not only in a document a reader can cross-check — and
    // the sentence around it tells the agent to trust `list_scenario_kinds` instead, which
    // is precisely the kind of caveat that makes a stale figure survive unnoticed.
    let cmd = collapse_ws(include_str!("../commands/kshana-run.md"));
    // The tutorial index lists the common kinds and then says how many there are in total.
    // Round 1 corrected that figure from 44; nothing was watching it. The number is bolded
    // and the line wraps straight after it, so this only matches on collapsed text.
    let tut = collapse_ws(include_str!("../docs/tutorials/README.md"));

    // The SVG splits a label across one <tspan> per word, so the count and the words after
    // it are in different elements. Strip the markup and search the concatenated text.
    let svg_text = strip_xml_tags(svg);
    let map_svg_text = strip_xml_tags(map_svg);

    let checks: Vec<(&str, &str, String)> = vec![
        (
            "README.md (hero-image alt text)",
            &readme,
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
            &mcp,
            format!("The {n} built-in scenario kinds with descriptions"),
        ),
        (
            "docs/SCENARIOS.md (generated reference header)",
            &scenarios,
            format!("The {n} built-in scenario kinds that"),
        ),
        (
            "commands/kshana-run.md (the packaged /kshana-run slash command)",
            &cmd,
            format!("There are {n} built-in kinds"),
        ),
        (
            "docs/tutorials/README.md (the \"not the complete set\" note above the kind table)",
            &tut,
            format!("returns all **{n}** built-in kinds"),
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

/// The checks above are presence checks: they ask "is the right number here?". One
/// correct occurrence satisfies that, so a SECOND, stale occurrence of the same fact in
/// the same file keeps the guard green. That is not hypothetical here.
/// `docs/ARCHITECTURE.md` states the kind count in two diagrams (§4's dispatch flow and
/// the module graph above it) and `readme_dispatch_counts_match_the_api` reads
/// `arch.contains("N kinds")`: either site alone holds the assertion up while the other
/// rots. `README.md` states it in four places against one presence check each.
///
/// So this is the check written the other way round — the shape
/// `matrix_total_no_stale_count_doc_sync.rs` already uses for the matrix total. It finds
/// EVERY integer a surface states as a scenario-kind count, whatever the number is, and
/// requires each one to equal `api::list_scenario_kinds()`. A new site is caught the
/// moment it states a count, without anyone remembering to list it here.
///
/// A count is recognised by the words that FOLLOW the digits, not by the digits. If one of
/// these files ever needs to say "3 kinds" about something that is not the dispatcher —
/// kinds of oracle, kinds of noise — this guard will fail on it. Reword that sentence or
/// narrow the marker list; do not raise the expected number to make it pass.
#[test]
fn no_surface_states_a_stale_scenario_kind_count() {
    let n = kshana::api::list_scenario_kinds().len();

    let readme = collapse_ws(include_str!("../README.md"));
    let arch = collapse_ws(include_str!("../docs/ARCHITECTURE.md"));
    let scenarios = collapse_ws(include_str!("../docs/SCENARIOS.md"));
    let mcp = collapse_ws(include_str!("../mcp/kshana-mcp/README.md"));
    let cmd = collapse_ws(include_str!("../commands/kshana-run.md"));
    let tut = collapse_ws(include_str!("../docs/tutorials/README.md"));
    // The public capability cards state the kind count inside a coverage claim
    // ("N of M kinds"). Only the denominator is the dispatcher's; the numerator is a
    // measured coverage figure with its own source, so it is deliberately not pinned here.
    let cap = collapse_ws(include_str!("../web/capabilities.json"));
    let overview_mmd = include_str!("../docs/diagrams/system-overview.mmd");
    let map_mmd = include_str!("../docs/diagrams/module-map.mmd");
    let overview_svg = strip_xml_tags(include_str!("../docs/assets/diagrams/system-overview.svg"));
    let map_svg = strip_xml_tags(include_str!("../docs/assets/diagrams/module-map.svg"));
    // docs/VERIFICATION-MATRIX.md, docs/MODELLED-RATIONALE.md and the ledger JSON are
    // deliberately absent. They are generated from src/verification.rs and pinned
    // byte-for-byte by verification_artifacts_doc_sync.rs, and the matrix text records how
    // field-units coverage MOVED ("7 of 56 kinds to 60 of 61") — a history, not a live
    // claim. Scanning them would red on a number that is correct precisely because it is
    // old. Source files are out for the same reason.

    let surfaces: Vec<(&str, &str)> = vec![
        ("README.md", &readme),
        ("docs/ARCHITECTURE.md", &arch),
        ("docs/SCENARIOS.md", &scenarios),
        ("mcp/kshana-mcp/README.md", &mcp),
        ("commands/kshana-run.md", &cmd),
        ("docs/tutorials/README.md", &tut),
        ("web/capabilities.json", &cap),
        ("docs/diagrams/system-overview.mmd", overview_mmd),
        ("docs/diagrams/module-map.mmd", map_mmd),
        ("docs/assets/diagrams/system-overview.svg", &overview_svg),
        ("docs/assets/diagrams/module-map.svg", &map_svg),
    ];

    // The words that mark the digits in front of them as a dispatcher kind count. The
    // longer forms are separate markers so each site is counted exactly once: in "61
    // built-in scenario kinds" the character before " kinds" is a letter, so only the long
    // marker walks back onto a digit.
    const MARKERS: &[&str] = &[
        " kinds",
        " scenario kinds",
        " built-in kinds",
        // Markdown bold closes between the digits and the words: "**61** built-in kinds".
        "** built-in kinds",
        " built-in scenario kinds",
        " ScenarioKind variants",
    ];

    let mut problems: Vec<String> = Vec::new();
    let mut checked = 0usize;
    for (surface, body) in &surfaces {
        let mut hits = 0usize;
        for marker in MARKERS {
            for (found, ctx) in counts_before(body, marker) {
                hits += 1;
                checked += 1;
                if found != n {
                    problems.push(format!(
                        "  {surface}: states {found}, the dispatcher has {n}\n      {ctx}"
                    ));
                }
            }
        }
        // A surface that states no count at all is not clean, it is unwatched: the phrase
        // was reworded and this scan quietly stopped grading the file.
        if hits == 0 {
            problems.push(format!(
                "  {surface}: states no scenario-kind count at all — the phrase was reworded, \
                 so this guard silently stopped watching the file"
            ));
        }
    }

    assert!(
        problems.is_empty(),
        "A surface states a scenario-kind count that is not the dispatcher's \
         (api::list_scenario_kinds() = {n}):\n{}\n\n\
         Update the number at each site. If a diagram is listed, edit its .mmd and \
         re-render with `tools/render-diagram.sh <name>` — the README embeds the rendering, \
         so fixing only the source leaves the picture a reader sees stale.",
        problems.join("\n")
    );

    // A scanner that matched nothing would pass forever while every surface rotted, and
    // the per-surface check above only catches a file going silent, not every marker
    // going silent at once. Pin the floor.
    assert!(
        checked >= 15,
        "the scenario-kind scanner matched only {checked} stated counts across \
         {} surfaces; it read 15 when it was written. A phrase was probably reworded — \
         fix the marker list, do not lower this bound, or the guard becomes decorative.",
        surfaces.len()
    );
}

/// The published MCP-server README lists the served tools in a table, and that table is a
/// hand-maintained copy of a fact the server source already holds.
///
/// It drifted exactly the way a copy does: `export_oem` shipped in the core, the CLI, the
/// WASM bundle and the MCP server, and the README's table still listed five tools. The
/// server crate pins the SERVED set exactly (`serves_exactly_the_expected_tool_set`), but
/// that crate is workspace-excluded, so it does not run with this suite — and it grades the
/// protocol, never the README a reader installs against. An undocumented tool is a tool
/// nobody calls.
///
/// Both sides are read as TEXT: `mcp/kshana-mcp` is not a dependency of this crate and its
/// items cannot be enumerated from here.
#[test]
fn the_mcp_readme_lists_exactly_the_tools_the_server_serves() {
    let server = include_str!("../mcp/kshana-mcp/src/server.rs");
    let readme = include_str!("../mcp/kshana-mcp/README.md");

    // A tool is a `fn` carrying the `#[tool(...)]` attribute. The attribute spans several
    // lines (it holds the whole description), so take the first `fn` after each one.
    let mut served: Vec<&str> = Vec::new();
    let mut in_attr = false;
    for line in server.lines() {
        let t = line.trim_start();
        if t.starts_with("#[tool(") {
            in_attr = true;
        } else if in_attr {
            if let Some(rest) = t.strip_prefix("fn ") {
                served.push(rest.split('(').next().unwrap_or(rest));
                in_attr = false;
            }
        }
    }
    served.sort_unstable();
    // A scan that matched nothing would satisfy an equality against an empty table, so pin
    // the floor: run/list/validate plus the SP3 and OMM exports have shipped since v0.16.0.
    assert!(
        served.len() >= 5,
        "parsed only {served:?} from mcp/kshana-mcp/src/server.rs — the scan is broken, \
         not the server"
    );

    // The README's `## Tools` table: one row per tool, each opening "| `name` |". The
    // header and separator rows do not, so they fall out on their own.
    let start = readme.find("\n## Tools").expect(
        "mcp/kshana-mcp/README.md must keep its `## Tools` section, or this guard is \
             grading nothing",
    );
    let rest = &readme[start + 1..];
    let end = rest[1..].find("\n## ").map(|i| i + 1).unwrap_or(rest.len());
    let mut documented: Vec<&str> = rest[..end]
        .lines()
        .filter_map(|l| l.strip_prefix("| `"))
        .filter_map(|r| r.split('`').next())
        .collect();
    documented.sort_unstable();

    let undocumented: Vec<&&str> = served.iter().filter(|t| !documented.contains(t)).collect();
    let unserved: Vec<&&str> = documented.iter().filter(|t| !served.contains(t)).collect();
    assert!(
        undocumented.is_empty() && unserved.is_empty(),
        "mcp/kshana-mcp/README.md's Tools table is out of step with what \
         mcp/kshana-mcp/src/server.rs serves. Served but undocumented: {undocumented:?}. \
         Documented but not served: {unserved:?}. Add or remove the table row; the README \
         is what an agent operator reads to know what the server can do."
    );
}

/// Runs of whitespace collapsed to a single space.
///
/// Every pinned phrase below is matched against the collapsed form, so whether a markdown
/// paragraph happens to wrap between two of its words cannot decide whether the guard
/// fires. A count guard that a re-flow can silence is worse than no guard: it reads green.
fn collapse_ws(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    let mut last_was_ws = false;
    for c in s.chars() {
        if c.is_whitespace() {
            if !last_was_ws {
                out.push(' ');
            }
            last_was_ws = true;
        } else {
            out.push(c);
            last_was_ws = false;
        }
    }
    out
}

/// Every integer that immediately PRECEDES `marker`, e.g. `("typed dispatch over 61
/// kinds", " kinds")` yields `61`, together with an excerpt naming the site.
fn counts_before(body: &str, marker: &str) -> Vec<(usize, String)> {
    let bytes = body.as_bytes();
    let mut out = Vec::new();
    let mut from = 0usize;
    while let Some(rel) = body[from..].find(marker) {
        let at = from + rel;
        // Walk back over the digits that end at `at`. Digits are ASCII, so stepping a byte
        // at a time cannot land inside a multi-byte character.
        let mut start = at;
        while start > 0 && bytes[start - 1].is_ascii_digit() {
            start -= 1;
        }
        if start < at {
            if let Ok(v) = body[start..at].parse::<usize>() {
                out.push((v, excerpt(body, start, at + marker.len())));
            }
        }
        from = at + marker.len();
    }
    out
}

/// A short window of text around `[start, end)` for the failure message. The bodies are
/// whitespace-collapsed, so there are no lines left to quote.
fn excerpt(body: &str, start: usize, end: usize) -> String {
    let mut lo = start.saturating_sub(70);
    while lo > 0 && !body.is_char_boundary(lo) {
        lo -= 1;
    }
    let mut hi = (end + 30).min(body.len());
    while hi < body.len() && !body.is_char_boundary(hi) {
        hi += 1;
    }
    format!("…{}…", body[lo..hi].trim())
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
