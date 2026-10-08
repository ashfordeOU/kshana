// SPDX-License-Identifier: AGPL-3.0-only
//! Every generated graphic follows the site theme, and nothing can quietly drift from it.
//!
//! The engine's charts, run reports and animations, the docs figures and diagrams, and
//! the README art all take their colours from `src/palette.rs`. These checks hold that
//! single source to the live site theme and keep it single:
//!
//! * every palette constant equals its token in `web/theme.css`, in both themes (the
//!   solid grid/rule/axis colours are re-derived from the theme's translucent line tokens
//!   composited over its ground);
//! * `docs/assets/palette.json` (read by the Python figure tools) and
//!   `docs/diagrams/mermaid-config.json` (read by mermaid-cli) are exactly what the
//!   module generates;
//! * no hex colour literal appears in `src/` outside `src/palette.rs`, and the figure
//!   tools read `palette.json` instead of carrying their own colours.
//!
//! To regenerate the two JSON files after changing the palette:
//! `cargo test --test palette_sync -- --ignored write_palette_files`.

use std::collections::BTreeMap;
use std::fs;
use std::path::{Path, PathBuf};

use kshana::palette::{self, dark, light};

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn read(rel: &str) -> String {
    fs::read_to_string(root().join(rel)).unwrap_or_else(|e| panic!("cannot read {rel}: {e}"))
}

/// The custom properties declared in the first block that starts with `selector{`.
fn block(css: &str, selector: &str) -> BTreeMap<String, String> {
    let at = css
        .find(&format!("{selector}{{"))
        .unwrap_or_else(|| panic!("web/theme.css has no `{selector}{{` block"));
    let body_start = at + selector.len() + 1;
    let body_end = body_start + css[body_start..].find('}').expect("block closes");
    css[body_start..body_end]
        .split(';')
        .filter_map(|decl| {
            let decl = decl.split("*/").last()?.trim();
            let (k, v) = decl.split_once(':')?;
            let k = k.trim();
            k.starts_with("--")
                .then(|| (k.to_string(), v.trim().to_string()))
        })
        .collect()
}

fn hex(c: &str) -> [f64; 3] {
    let c = c.trim_start_matches('#');
    assert_eq!(c.len(), 6, "not a six-digit colour: {c}");
    [0, 2, 4].map(|i| f64::from(u8::from_str_radix(&c[i..i + 2], 16).expect("hex")))
}

/// `rgba(r,g,b,a)` composited over `ground`, rounded per channel.
fn composite(rgba: &str, ground: &str) -> String {
    let inner = rgba
        .trim()
        .strip_prefix("rgba(")
        .and_then(|s| s.strip_suffix(')'))
        .unwrap_or_else(|| panic!("not rgba(): {rgba}"));
    let v: Vec<f64> = inner
        .split(',')
        .map(|x| x.trim().parse().expect("number"))
        .collect();
    let g = hex(ground);
    let c: Vec<u8> = (0..3)
        .map(|k| (g[k] + v[3] * (v[k] - g[k])).round() as u8)
        .collect();
    format!("#{:02X}{:02X}{:02X}", c[0], c[1], c[2])
}

struct Theme {
    name: &'static str,
    selector: &'static str,
    consts: [(&'static str, &'static str); 18],
}

fn themes() -> [Theme; 2] {
    [
        Theme {
            name: "light",
            selector: ":root",
            consts: [
                ("--bg", light::BG),
                ("--bg-2", light::BG_2),
                ("--bg-3", light::BG_3),
                ("--panel-solid", light::PANEL),
                ("--surface-2", light::PANEL_2),
                ("--line", light::GRID),
                ("--line-2", light::RULE),
                ("--line-3", light::AXIS),
                ("--ink", light::INK),
                ("--ink-2", light::INK_2),
                ("--ink-3", light::INK_3),
                ("--ink-4", light::INK_4),
                ("--cyan", light::CYAN),
                ("--magenta", light::MAGENTA),
                ("--lime", light::LIME),
                ("--amber", light::AMBER),
                ("--coral", light::CORAL),
                ("--tim", light::BLUE),
            ],
        },
        Theme {
            name: "dark",
            selector: ":root[data-theme=\"dark\"]",
            consts: [
                ("--bg", dark::BG),
                ("--bg-2", dark::BG_2),
                ("--bg-3", dark::BG_3),
                ("--panel-solid", dark::PANEL),
                ("--surface-2", dark::PANEL_2),
                ("--line", dark::GRID),
                ("--line-2", dark::RULE),
                ("--line-3", dark::AXIS),
                ("--ink", dark::INK),
                ("--ink-2", dark::INK_2),
                ("--ink-3", dark::INK_3),
                ("--ink-4", dark::INK_4),
                ("--cyan", dark::CYAN),
                ("--magenta", dark::MAGENTA),
                ("--lime", dark::LIME),
                ("--amber", dark::AMBER),
                ("--coral", dark::CORAL),
                ("--tim", dark::BLUE),
            ],
        },
    ]
}

#[test]
fn every_palette_constant_is_its_site_theme_token() {
    let css = read("web/theme.css");
    for t in themes() {
        let vars = block(&css, t.selector);
        let ground = vars.get("--bg").expect("--bg");
        for (token, ours) in t.consts {
            let theirs = vars
                .get(token)
                .unwrap_or_else(|| panic!("web/theme.css {} has no {token}", t.name));
            let want = if theirs.starts_with("rgba(") {
                composite(theirs, ground)
            } else {
                theirs.to_ascii_uppercase()
            };
            assert_eq!(
                ours, want,
                "src/palette.rs {} {token} is {ours}, but web/theme.css says {theirs} ({want}). \
                 The site theme is the source: update src/palette.rs, then run \
                 `cargo test --test palette_sync -- --ignored write_palette_files` and \
                 re-render the graphics.",
                t.name
            );
        }
    }
}

#[test]
fn the_line_colour_and_alphas_are_the_site_line_tokens() {
    let css = read("web/theme.css");
    for (sel, rgb, alpha) in [
        (":root", light::LINE_RGB, light::LINE_ALPHA),
        (
            ":root[data-theme=\"dark\"]",
            dark::LINE_RGB,
            dark::LINE_ALPHA,
        ),
    ] {
        let vars = block(&css, sel);
        for (token, a) in ["--line", "--line-2", "--line-3"].iter().zip(alpha) {
            let v = &vars[*token];
            let inner = &v["rgba(".len()..v.len() - 1];
            let p: Vec<f64> = inner
                .split(',')
                .map(|x| x.trim().parse().expect("num"))
                .collect();
            let want = format!("#{:02X}{:02X}{:02X}", p[0] as u8, p[1] as u8, p[2] as u8);
            assert_eq!(rgb, want, "{sel} {token} colour");
            assert!(
                (a - p[3]).abs() < 1e-12,
                "{sel} {token} alpha {a} vs {}",
                p[3]
            );
        }
    }
}

#[test]
fn the_dark_theme_is_declared_the_same_way_in_both_dark_selectors() {
    // theme.css repeats the dark tokens under prefers-color-scheme and data-theme="dark";
    // the palette mirrors one, so the two must agree.
    let css = read("web/theme.css");
    let forced = block(&css, ":root[data-theme=\"dark\"]");
    let media = block(&css, ":root:not([data-theme=\"light\"])");
    for (k, v) in &media {
        assert_eq!(
            forced.get(k),
            Some(v),
            "{k} differs between the two dark blocks"
        );
    }
}

#[test]
fn the_committed_palette_json_is_what_the_module_generates() {
    assert_eq!(
        read("docs/assets/palette.json"),
        palette::palette_json(),
        "docs/assets/palette.json is stale: run \
         `cargo test --test palette_sync -- --ignored write_palette_files`"
    );
}

#[test]
fn the_committed_mermaid_config_is_what_the_module_generates() {
    assert_eq!(
        read("docs/diagrams/mermaid-config.json"),
        palette::mermaid_config_json(),
        "docs/diagrams/mermaid-config.json is stale: run \
         `cargo test --test palette_sync -- --ignored write_palette_files`"
    );
}

/// Write `docs/assets/palette.json` and `docs/diagrams/mermaid-config.json`.
#[test]
#[ignore = "writer: run explicitly after changing src/palette.rs"]
fn write_palette_files() {
    fs::write(
        root().join("docs/assets/palette.json"),
        palette::palette_json(),
    )
    .expect("write palette.json");
    fs::write(
        root().join("docs/diagrams/mermaid-config.json"),
        palette::mermaid_config_json(),
    )
    .expect("write mermaid-config.json");
}

fn rust_files(dir: &Path, out: &mut Vec<PathBuf>) {
    for e in fs::read_dir(dir).expect("read_dir") {
        let p = e.expect("entry").path();
        if p.is_dir() {
            rust_files(&p, out);
        } else if p.extension().is_some_and(|x| x == "rs") {
            out.push(p);
        }
    }
}

/// Six-digit `#rrggbb` literals in `text` (not seven or more hex digits).
fn colour_literals(text: &str) -> Vec<String> {
    let b = text.as_bytes();
    let mut found = Vec::new();
    for i in 0..b.len() {
        if b[i] == b'#'
            && i + 7 <= b.len()
            && b[i + 1..i + 7].iter().all(u8::is_ascii_hexdigit)
            && !b.get(i + 7).is_some_and(u8::is_ascii_hexdigit)
        {
            found.push(text[i..i + 7].to_string());
        }
    }
    found
}

/// Files still allowed their own colours, each with the reason. Shrink, never grow.
const NOT_YET_ON_THE_PALETTE: &[(&str, &str)] = &[];

#[test]
fn no_colour_literal_lives_outside_the_palette() {
    let mut files = Vec::new();
    rust_files(&root().join("src"), &mut files);
    let mut offenders = Vec::new();
    for f in files {
        let rel = f
            .strip_prefix(root())
            .expect("under root")
            .to_string_lossy()
            .replace('\\', "/");
        if rel == "src/palette.rs" || NOT_YET_ON_THE_PALETTE.iter().any(|(p, _)| *p == rel) {
            continue;
        }
        let lits = colour_literals(&fs::read_to_string(&f).expect("read"));
        if !lits.is_empty() {
            offenders.push(format!("{rel}: {}", lits.join(", ")));
        }
    }
    assert!(
        offenders.is_empty(),
        "hex colours outside src/palette.rs; use a palette constant instead:\n{}",
        offenders.join("\n")
    );
}

#[test]
fn the_figure_tools_read_the_palette_instead_of_carrying_their_own() {
    for tool in [
        "tools/gen_validation_figures.py",
        "tools/gen_readme_assets.py",
    ] {
        assert!(
            read(tool).contains("palette.json"),
            "{tool} must take its theme colours from docs/assets/palette.json"
        );
    }
    let figures = read("tools/gen_validation_figures.py");
    assert!(
        colour_literals(&figures).is_empty(),
        "tools/gen_validation_figures.py carries its own colours: {:?}",
        colour_literals(&figures)
    );
}
