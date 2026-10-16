// SPDX-License-Identifier: AGPL-3.0-only
//! A property test of the chart helpers' text inputs, beyond the bundled scenarios.
//!
//! `chart_text_escaped.rs` puts markup into the string literals of every bundled scenario. It
//! cannot reach a string no bundled scenario carries. This test drives each text-taking helper in
//! `kshana::chart` with a fixed set of hostile strings and with seeded random strings built from
//! the characters that matter in markup, and requires that the hostile text adds no markup: the
//! output has exactly the `<` and `"` characters it has for a harmless string, and no raw `<`, `>`
//! or quote comes from the text itself.

use kshana::chart::{esc, frame_open, panel_axes, y_axis};

const HOSTILE: &[&str] = &[
    r#"</text><image href="x" onerror="x"/><text>"#,
    r#"<script>alert(1)</script>"#,
    r#"" onload="x"#,
    "' onload='x",
    "&lt;script&gt;",
    "&#60;b&#62;",
    "]]><svg/onload=x>",
    "<!-- x -->",
    "<?xml version=\"1.0\"?>",
    "a\u{0}b\u{1b}c<d",
    "\u{202e}<\u{2028}>",
    "javascript:alert(1)",
    "<a xlink:href=\"javascript:x\">t</a>",
];

/// A tiny seeded generator (no dependency, same strings on every run).
struct Lcg(u64);
impl Lcg {
    fn next(&mut self) -> u64 {
        self.0 = self
            .0
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        self.0 >> 33
    }
}

fn random_strings(n: usize) -> Vec<String> {
    const ALPHABET: &[&str] = &[
        "<",
        ">",
        "&",
        "\"",
        "'",
        "/",
        "=",
        " ",
        "a",
        "x",
        "script",
        "on",
        "error",
        "&amp;",
        "&#",
        ";",
        "\n",
        "\t",
        "\u{0}",
        "\u{7}",
        "é",
        "漢",
        "\u{1F600}",
        "\\",
        "{",
        "}",
        "%",
        "?",
        "!",
        "-",
    ];
    let mut g = Lcg(0x6b73_6861_6e61);
    (0..n)
        .map(|_| {
            let len = (g.next() % 40) as usize;
            (0..len)
                .map(|_| ALPHABET[(g.next() as usize) % ALPHABET.len()])
                .collect()
        })
        .collect()
}

fn inputs() -> Vec<String> {
    let mut v: Vec<String> = HOSTILE.iter().map(|s| s.to_string()).collect();
    v.extend(random_strings(4000));
    v.push(String::new());
    v
}

fn count(s: &str, c: char) -> usize {
    s.chars().filter(|&x| x == c).count()
}

/// Every `&` in `s` starts one of the five entities `esc` writes.
fn only_known_entities(s: &str) -> bool {
    s.match_indices('&').all(|(i, _)| {
        ["&amp;", "&lt;", "&gt;", "&quot;", "&#39;"]
            .iter()
            .any(|e| s[i..].starts_with(e))
    })
}

#[test]
fn esc_leaves_no_markup_character() {
    for s in inputs() {
        let e = esc(&s);
        assert!(!e.contains(['<', '>', '"', '\'']), "{s:?} -> {e:?}");
        assert!(only_known_entities(&e), "{s:?} -> {e:?}");
        assert!(
            !e.chars()
                .any(|c| c.is_control() && !matches!(c, '\t' | '\n' | '\r')),
            "{s:?} -> {e:?}"
        );
    }
}

/// Run `f` with each input and with a harmless one; the markup characters of the output must
/// match, so the text added none. `what` names the helper in a failure.
fn adds_no_markup(what: &str, f: impl Fn(&str) -> String) {
    let base = f("harmless text");
    let (lt, gt, dq) = (count(&base, '<'), count(&base, '>'), count(&base, '"'));
    for s in inputs() {
        let out = f(&s);
        assert_eq!(count(&out, '<'), lt, "{what}: extra `<` for {s:?}");
        assert_eq!(count(&out, '>'), gt, "{what}: extra `>` for {s:?}");
        assert_eq!(count(&out, '"'), dq, "{what}: extra quote for {s:?}");
        assert!(
            !out.contains("onerror=\"x\"/>"),
            "{what}: payload for {s:?}"
        );
    }
}

#[test]
fn y_axis_title_adds_no_markup() {
    adds_no_markup("y_axis", |s| y_axis(60.0, 20.0, 400.0, 200.0, 10.0, s));
}

#[test]
fn frame_open_title_and_subtitle_add_no_markup() {
    adds_no_markup("frame_open title", |s| frame_open(640.0, 360.0, s, "sub"));
    adds_no_markup("frame_open subtitle", |s| frame_open(640.0, 360.0, "t", s));
}

#[test]
fn panel_axes_caption_adds_no_markup() {
    adds_no_markup("panel_axes", |s| panel_axes(60.0, 50.0, 300.0, 250.0, s));
}
