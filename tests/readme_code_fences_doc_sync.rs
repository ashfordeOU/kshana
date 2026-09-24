//! The code fences on the registry front pages are copied verbatim into strangers' editors,
//! and until this file no test read a single one of them. An ES import of an export that
//! did not exist and a Rust example that did not compile both shipped to their registries
//! that way. Two checks, each over the fence as it is actually published:
//!
//! 1. Every name imported from `"kshana"` in a JavaScript fence is a `#[wasm_bindgen]`
//!    function in `src/wasm.rs` (the `default` export is wasm-bindgen's `init`).
//! 2. The Rust fence in `README.crates.md` is byte-identical to `readme_crates_example`
//!    below, which this test binary compiles. A README edit that stops compiling therefore
//!    fails here as a mismatch, and an API change that breaks the example fails the build.
//!    The example is compiled, never called: running it would write a result file into the
//!    working directory on every `cargo test`.

fn fences<'a>(doc: &'a str, lang: &str) -> Vec<Vec<&'a str>> {
    let open = format!("```{lang}");
    let mut out = Vec::new();
    let mut cur: Option<Vec<&str>> = None;
    for line in doc.lines() {
        match cur.as_mut() {
            None if line.trim_end() == open => cur = Some(Vec::new()),
            Some(body) if line.trim_end() == "```" => {
                out.push(std::mem::take(body));
                cur = None;
            }
            Some(body) => body.push(line),
            None => {}
        }
    }
    out
}

fn wasm_exports() -> std::collections::BTreeSet<String> {
    let src = include_str!("../src/wasm.rs");
    let lines: Vec<&str> = src.lines().collect();
    let mut names = std::collections::BTreeSet::new();
    for (i, l) in lines.iter().enumerate() {
        if !l.trim_start().starts_with("#[wasm_bindgen") {
            continue;
        }
        // The attribute may be followed by doc comments or further attributes.
        if let Some(sig) = lines[i + 1..]
            .iter()
            .map(|s| s.trim_start())
            .find(|s| s.starts_with("pub fn "))
        {
            let name = sig["pub fn ".len()..]
                .split(['(', '<'])
                .next()
                .unwrap()
                .to_string();
            names.insert(name);
        }
    }
    names
}

#[test]
fn every_js_import_from_kshana_is_a_real_wasm_export() {
    let exports = wasm_exports();
    assert!(
        exports.contains("run") && exports.len() >= 5,
        "found only {exports:?} in src/wasm.rs — the export scan is broken, not the README"
    );
    let surfaces = [
        ("README.npm.md", include_str!("../README.npm.md")),
        ("README.md", include_str!("../README.md")),
    ];
    let mut checked = 0;
    let mut bad = Vec::new();
    for (name, doc) in surfaces {
        for fence in fences(doc, "js")
            .into_iter()
            .chain(fences(doc, "javascript"))
        {
            for line in fence {
                let l = line.trim();
                if !(l.starts_with("import ")
                    && (l.contains("from \"kshana\"") || l.contains("from 'kshana'")))
                {
                    continue;
                }
                let (Some(a), Some(b)) = (l.find('{'), l.find('}')) else {
                    continue;
                };
                if b < a {
                    continue;
                }
                for imp in l[a + 1..b].split(',') {
                    // `x as y` imports the export `x`.
                    let imp = imp.split(" as ").next().unwrap().trim();
                    if imp.is_empty() {
                        continue;
                    }
                    checked += 1;
                    if !exports.contains(imp) {
                        bad.push(format!(
                            "{name}: imports `{imp}`, which src/wasm.rs does not export"
                        ));
                    }
                }
            }
        }
    }
    assert!(
        checked > 0,
        "no `import {{ … }} from \"kshana\"` line found in any JS fence — the gate is grading nothing"
    );
    assert!(bad.is_empty(), "{}", bad.join("\n"));
}

#[test]
fn every_site_import_from_the_wasm_package_is_a_real_export() {
    // The playground and its smoke test import from the generated `./pkg/kshana.js`. An
    // ES module that imports a name the package does not export fails to LINK, so one
    // stale name blanks the whole page — not just the feature that used it.
    let exports = wasm_exports();
    let files = [
        ("web/app.js", include_str!("../web/app.js")),
        ("web/smoke.mjs", include_str!("../web/smoke.mjs")),
        (
            "web/engine-worker.mjs",
            include_str!("../web/engine-worker.mjs"),
        ),
    ];
    let mut checked = 0;
    let mut bad = Vec::new();
    for (name, src) in files {
        // Imports may span lines; join the statement up to its `from`.
        let flat = src.replace('\n', " ");
        let mut rest = flat.as_str();
        while let Some(i) = rest.find("import ") {
            rest = &rest[i + "import ".len()..];
            let Some(from) = rest.find(" from ") else {
                break;
            };
            let (clause, after) = rest.split_at(from);
            if !after[" from ".len()..]
                .trim_start()
                .get(1..)
                .unwrap_or("")
                .starts_with("./pkg/kshana.js")
            {
                continue;
            }
            let (Some(a), Some(b)) = (clause.find('{'), clause.find('}')) else {
                continue;
            };
            if b < a {
                continue;
            }
            for imp in clause[a + 1..b].split(',') {
                let imp = imp.split(" as ").next().unwrap().trim();
                if imp.is_empty() {
                    continue;
                }
                checked += 1;
                if !exports.contains(imp) {
                    bad.push(format!(
                        "{name}: imports `{imp}`, which src/wasm.rs does not export"
                    ));
                }
            }
        }
    }
    assert!(
        checked >= 3,
        "found only {checked} imported names from ./pkg/kshana.js — the scan is broken"
    );
    assert!(bad.is_empty(), "{}", bad.join("\n"));
}

// ---- README.crates.md example: the region between the markers is compared to the fence.
#[allow(dead_code)]
#[rustfmt::skip] // the body must stay byte-identical to the published fence
fn readme_crates_example() -> Result<(), Box<dyn std::error::Error>> {
    // README-EXAMPLE-BEGIN
use kshana::api;

// Run any scenario TOML through the engine; get a reproducible result back.
let toml = std::fs::read_to_string("scenarios/clock-holdover.toml")?;
let out = api::run_toml(&toml)?;    // RunOutput { json, svg, summary, csv }
println!("{}", out.summary);        // the one-line result string
std::fs::write("clock-holdover.result.json", &out.json)?;
    // README-EXAMPLE-END
    Ok(())
}

#[test]
fn readme_crates_rust_fence_is_the_compiled_example() {
    let me = include_str!("readme_code_fences_doc_sync.rs");
    let begin = me.find("// README-EXAMPLE-BEGIN\n").expect("begin marker")
        + "// README-EXAMPLE-BEGIN\n".len();
    let end = me[begin..]
        .find("    // README-EXAMPLE-END")
        .expect("end marker")
        + begin;
    let compiled: Vec<&str> = me[begin..end].lines().collect();

    let rust = fences(include_str!("../README.crates.md"), "rust");
    assert_eq!(
        rust.len(),
        1,
        "README.crates.md should carry exactly one ```rust fence"
    );
    // Lines starting `# ` are rustdoc-hidden scaffolding (the `Ok::<…>` tail); the function
    // above supplies its own.
    let published: Vec<&str> = rust[0]
        .iter()
        .copied()
        .filter(|l| !l.starts_with("# "))
        .collect();
    assert_eq!(
        published, compiled,
        "README.crates.md's Rust example no longer matches the compiled copy in \
         tests/readme_code_fences_doc_sync.rs — edit both together"
    );
}
