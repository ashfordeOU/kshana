// SPDX-License-Identifier: AGPL-3.0-only
//! The one colour and type palette every generated graphic draws from.
//!
//! Kshana's site theme is "Observatory" (`web/theme.css`). Every graphic the engine
//! writes (the `*.chart.svg` of every scenario kind, the run report HTML, the timeline
//! animation, and through `docs/assets/palette.json` the docs figures, diagrams and
//! README art) takes its colours from this module, so the outputs follow the site rather
//! than each carrying its own hex literals. `tests/palette_sync.rs` parses
//! `web/theme.css` and fails if any value here drifts from it, and a source guard fails if
//! a hex colour literal reappears in `src/` outside this file.
//!
//! Charts are drawn "instrument-dark" only ([`chart`] re-exports [`dark`]); pages that
//! carry their own CSS (the run report, the animation player) follow the viewer's
//! light/dark preference with [`light`] and [`dark`].
//!
//! The theme's translucent line tokens (`--line`, `--line-2`, `--line-3`) cannot be used
//! as SVG paint without changing how overlapping strokes look, so [`dark::GRID`],
//! [`dark::RULE`] and [`dark::AXIS`] (and their [`light`] twins) are those tokens
//! pre-composited over the theme's `--bg`, rounded to the nearest 8-bit channel. The
//! sync test re-derives the composites from the CSS.

/// The dark Observatory theme (`web/theme.css`, `prefers-color-scheme: dark`).
pub mod dark {
    /// `--bg`: the page and chart ground.
    pub const BG: &str = "#060A14";
    /// `--bg-2`.
    pub const BG_2: &str = "#0A1122";
    /// `--bg-3`.
    pub const BG_3: &str = "#0E1730";
    /// `--panel-solid` / `--surface`: a card or plot-panel fill one step above the ground.
    pub const PANEL: &str = "#0D1528";
    /// `--surface-2`: an alternate band one step above [`PANEL`].
    pub const PANEL_2: &str = "#111B33";
    /// `--line` composited over [`BG`]: gridlines.
    pub const GRID: &str = "#161C2B";
    /// `--line-2` composited over [`BG`]: rules and secondary strokes.
    pub const RULE: &str = "#232B3E";
    /// `--line-3` composited over [`BG`]: axes and outlines.
    pub const AXIS: &str = "#343F57";
    /// `--ink`: titles and the strongest text.
    pub const INK: &str = "#EAF0FF";
    /// `--ink-2`: body text and labels.
    pub const INK_2: &str = "#A7B4D2";
    /// `--ink-3`: muted text (ticks, captions, subtitles).
    pub const INK_3: &str = "#8190B0";
    /// `--ink-4`: faint non-text strokes (reference lines). Not for text.
    pub const INK_4: &str = "#56637F";
    /// `--cyan`: the primary accent and the orbit domain.
    pub const CYAN: &str = "#3DDCF7";
    /// `--magenta`: the spoofing domain.
    pub const MAGENTA: &str = "#F45CCB";
    /// `--lime`: the integrity domain and "ok / validated".
    pub const LIME: &str = "#A8EE5E";
    /// `--amber`: the navigation domain and "warning / modelled".
    pub const AMBER: &str = "#FFB547";
    /// `--coral`: the interference domain and "fault / threshold".
    pub const CORAL: &str = "#FF6A5C";
    /// `--tim`: the timing-domain blue (the theme has five accents for six domains, so
    /// timing takes this sixth hue).
    pub const BLUE: &str = "#6A98FF";
    /// The colour of the translucent `--line` tokens, for art that flattens them over
    /// surfaces other than [`BG`].
    pub const LINE_RGB: &str = "#96AFE6";
    /// The alphas of `--line`, `--line-2` and `--line-3`.
    pub const LINE_ALPHA: [f64; 3] = [0.11, 0.2, 0.32];
}

/// The light Observatory theme (`web/theme.css`, bare `:root`).
pub mod light {
    /// `--bg`.
    pub const BG: &str = "#E8ECF3";
    /// `--bg-2`.
    pub const BG_2: &str = "#DEE4EE";
    /// `--bg-3`.
    pub const BG_3: &str = "#D3DBE8";
    /// `--panel-solid` / `--surface`.
    pub const PANEL: &str = "#F5F7FB";
    /// `--surface-2`.
    pub const PANEL_2: &str = "#EDF1F7";
    /// `--line` composited over [`BG`].
    pub const GRID: &str = "#D0D5E0";
    /// `--line-2` composited over [`BG`].
    pub const RULE: &str = "#BFC6D3";
    /// `--line-3` composited over [`BG`].
    pub const AXIS: &str = "#A7AFC0";
    /// `--ink`.
    pub const INK: &str = "#182033";
    /// `--ink-2`.
    pub const INK_2: &str = "#3A455E";
    /// `--ink-3`.
    pub const INK_3: &str = "#4E5971";
    /// `--ink-4`. Not for text.
    pub const INK_4: &str = "#66718A";
    /// `--cyan`.
    pub const CYAN: &str = "#066A86";
    /// `--magenta`.
    pub const MAGENTA: &str = "#A8247F";
    /// `--lime`.
    pub const LIME: &str = "#2F6E0A";
    /// `--amber`.
    pub const AMBER: &str = "#764600";
    /// `--coral`.
    pub const CORAL: &str = "#B42D1B";
    /// `--tim`: the timing-domain blue.
    pub const BLUE: &str = "#1C4FE0";
    /// The colour of the translucent `--line` tokens.
    pub const LINE_RGB: &str = "#1C2C54";
    /// The alphas of `--line`, `--line-2` and `--line-3`.
    pub const LINE_ALPHA: [f64; 3] = [0.12, 0.2, 0.32];
}

/// The print palette: generated pages print black on white whatever the screen theme.
pub mod print {
    /// The paper.
    pub const PAPER: &str = "#FFFFFF";
    /// Text and accents.
    pub const INK: &str = "#000000";
    /// Muted text.
    pub const MUTED: &str = "#444444";
    /// Rules and borders.
    pub const RULE: &str = "#999999";
    /// Card and table-header fill.
    pub const CARD: &str = "#F2F2F2";
}

/// Chart roles. Charts are instrument-dark, so these are the [`dark`] values under the
/// names chart code reaches for.
pub mod chart {
    pub use super::dark::*;

    /// Ordinary label and legend text.
    pub const TEXT: &str = super::dark::INK_2;
    /// Ticks, captions, subtitles, footers.
    pub const MUTED: &str = super::dark::INK_3;
    /// Chart titles.
    pub const TITLE: &str = super::dark::INK;
    /// A healthy / validated / within-bound state.
    pub const OK: &str = super::dark::LIME;
    /// A degraded / modelled / caution state.
    pub const WARN: &str = super::dark::AMBER;
    /// A fault, an alarm, or a threshold line.
    pub const FAULT: &str = super::dark::CORAL;
    /// Categorical series, in the order a chart should use them.
    pub const SERIES: [&str; 8] = [
        super::dark::CYAN,
        super::dark::AMBER,
        super::dark::MAGENTA,
        super::dark::LIME,
        super::dark::CORAL,
        super::dark::BLUE,
        super::dark::INK_2,
        super::dark::INK_3,
    ];
    /// The sans-serif stack (the site's Geist, falling back to the system face).
    pub const FONT_SANS: &str = "Geist, ui-sans-serif, system-ui, sans-serif";
    /// The monospace stack (the site's Geist Mono).
    pub const FONT_MONO: &str = "Geist Mono, ui-monospace, Menlo, Consolas, monospace";
}

/// The six failure domains, each with one fixed colour in every graphic.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Domain {
    /// RF interference and jamming.
    Interference,
    /// Spoofing and meaconing.
    Spoofing,
    /// Timing and holdover.
    Timing,
    /// Orbits and ephemerides.
    Orbit,
    /// Integrity and validation.
    Integrity,
    /// Navigation and positioning.
    Navigation,
}

impl Domain {
    /// Every domain, in the site's order.
    pub const ALL: [Domain; 6] = [
        Domain::Interference,
        Domain::Spoofing,
        Domain::Timing,
        Domain::Orbit,
        Domain::Integrity,
        Domain::Navigation,
    ];

    /// The domain's short key, as the site's tokens name it.
    pub fn key(self) -> &'static str {
        match self {
            Domain::Interference => "int",
            Domain::Spoofing => "spf",
            Domain::Timing => "tim",
            Domain::Orbit => "orb",
            Domain::Integrity => "itg",
            Domain::Navigation => "nav",
        }
    }

    /// The domain's colour on the dark theme (and so in every chart).
    pub fn dark(self) -> &'static str {
        match self {
            Domain::Interference => dark::CORAL,
            Domain::Spoofing => dark::MAGENTA,
            Domain::Timing => dark::BLUE,
            Domain::Orbit => dark::CYAN,
            Domain::Integrity => dark::LIME,
            Domain::Navigation => dark::AMBER,
        }
    }

    /// The domain's colour on the light theme.
    pub fn light(self) -> &'static str {
        match self {
            Domain::Interference => light::CORAL,
            Domain::Spoofing => light::MAGENTA,
            Domain::Timing => light::BLUE,
            Domain::Orbit => light::CYAN,
            Domain::Integrity => light::LIME,
            Domain::Navigation => light::AMBER,
        }
    }
}

/// Colour for `u ∈ [0, 1]` on the sequential ramp used for heat maps and waterfalls.
///
/// The ramp is the perceptually ordered inferno sequence with its dark end anchored at
/// the chart ground ([`dark::BG`]), so the floor of a waterfall reads as empty sky.
pub fn ramp(u: f64) -> String {
    const STOPS: [(f64, [f64; 3]); 5] = [
        (0.0, [6.0, 10.0, 20.0]),
        (0.25, [66.0, 10.0, 104.0]),
        (0.5, [147.0, 38.0, 103.0]),
        (0.75, [221.0, 81.0, 58.0]),
        (1.0, [252.0, 255.0, 164.0]),
    ];
    let u = if u.is_nan() { 0.0 } else { u.clamp(0.0, 1.0) };
    let mut i = 0;
    while i + 1 < STOPS.len() - 1 && u > STOPS[i + 1].0 {
        i += 1;
    }
    let (a, ca) = STOPS[i];
    let (b, cb) = STOPS[i + 1];
    let t = ((u - a) / (b - a)).clamp(0.0, 1.0);
    let c: Vec<u8> = (0..3)
        .map(|k| (ca[k] + (cb[k] - ca[k]) * t).round().clamp(0.0, 255.0) as u8)
        .collect();
    format!("#{:02X}{:02X}{:02X}", c[0], c[1], c[2])
}

/// The palette as JSON, the form the Python figure tools and the Mermaid config read.
///
/// Written to `docs/assets/palette.json`; `tests/palette_sync.rs` fails if the committed
/// file differs from this output.
pub fn palette_json() -> String {
    fn theme(
        out: &mut String,
        name: &str,
        v: &[(&str, &str)],
        line: (&str, [f64; 3]),
        domain: impl Fn(Domain) -> &'static str,
    ) {
        out.push_str(&format!("  \"{name}\": {{\n"));
        for (k, c) in v {
            out.push_str(&format!("    \"{k}\": \"{c}\",\n"));
        }
        out.push_str(&format!(
            "    \"line_rgb\": \"{}\",\n    \"line_alpha\": [{}, {}, {}],\n",
            line.0, line.1[0], line.1[1], line.1[2]
        ));
        out.push_str("    \"domain\": {\n");
        let n = Domain::ALL.len();
        for (i, d) in Domain::ALL.iter().enumerate() {
            let sep = if i + 1 < n { "," } else { "" };
            out.push_str(&format!("      \"{}\": \"{}\"{sep}\n", d.key(), domain(*d)));
        }
        out.push_str("    }\n  }");
    }
    let d = [
        ("bg", dark::BG),
        ("bg2", dark::BG_2),
        ("bg3", dark::BG_3),
        ("panel", dark::PANEL),
        ("panel2", dark::PANEL_2),
        ("grid", dark::GRID),
        ("rule", dark::RULE),
        ("axis", dark::AXIS),
        ("ink", dark::INK),
        ("ink2", dark::INK_2),
        ("ink3", dark::INK_3),
        ("ink4", dark::INK_4),
        ("cyan", dark::CYAN),
        ("magenta", dark::MAGENTA),
        ("lime", dark::LIME),
        ("amber", dark::AMBER),
        ("coral", dark::CORAL),
        ("blue", dark::BLUE),
    ];
    let l = [
        ("bg", light::BG),
        ("bg2", light::BG_2),
        ("bg3", light::BG_3),
        ("panel", light::PANEL),
        ("panel2", light::PANEL_2),
        ("grid", light::GRID),
        ("rule", light::RULE),
        ("axis", light::AXIS),
        ("ink", light::INK),
        ("ink2", light::INK_2),
        ("ink3", light::INK_3),
        ("ink4", light::INK_4),
        ("cyan", light::CYAN),
        ("magenta", light::MAGENTA),
        ("lime", light::LIME),
        ("amber", light::AMBER),
        ("coral", light::CORAL),
        ("blue", light::BLUE),
    ];
    let mut s = String::from("{\n");
    s.push_str("  \"note\": \"Generated from src/palette.rs (the Observatory theme of web/theme.css). Do not edit by hand: run `cargo test --test palette_sync -- --ignored write_palette_json`.\",\n");
    s.push_str(&format!(
        "  \"font_sans\": \"{}\",\n  \"font_mono\": \"{}\",\n",
        chart::FONT_SANS,
        chart::FONT_MONO
    ));
    theme(
        &mut s,
        "dark",
        &d,
        (dark::LINE_RGB, dark::LINE_ALPHA),
        Domain::dark,
    );
    s.push_str(",\n");
    theme(
        &mut s,
        "light",
        &l,
        (light::LINE_RGB, light::LINE_ALPHA),
        Domain::light,
    );
    s.push_str("\n}\n");
    s
}

/// The mermaid-cli configuration (`docs/diagrams/mermaid-config.json`) that draws the
/// docs diagrams instrument-dark on this palette. Render with
/// `mmdc -c docs/diagrams/mermaid-config.json -b <dark bg> -i docs/diagrams/<name>.mmd -o docs/assets/diagrams/<name>.svg`,
/// then `tools/render-diagram.sh <name>` for the PNG.
pub fn mermaid_config_json() -> String {
    use chart::*;
    let vars = [
        ("darkMode", "true"),
        ("background", BG),
        ("fontFamily", FONT_SANS),
        ("fontSize", "16px"),
        ("primaryColor", PANEL),
        ("primaryTextColor", INK),
        ("primaryBorderColor", AXIS),
        ("secondaryColor", PANEL_2),
        ("secondaryTextColor", INK),
        ("secondaryBorderColor", AXIS),
        ("tertiaryColor", BG_2),
        ("tertiaryTextColor", INK_2),
        ("tertiaryBorderColor", RULE),
        ("mainBkg", PANEL),
        ("nodeBorder", AXIS),
        ("nodeTextColor", INK),
        ("textColor", INK_2),
        ("lineColor", INK_3),
        ("clusterBkg", BG_2),
        ("clusterBorder", RULE),
        ("titleColor", CYAN),
        ("edgeLabelBackground", BG),
    ];
    let mut s = String::from("{\n  \"theme\": \"base\",\n  \"themeVariables\": {\n");
    for (i, (k, v)) in vars.iter().enumerate() {
        let sep = if i + 1 < vars.len() { "," } else { "" };
        if *v == "true" {
            s.push_str(&format!("    \"{k}\": {v}{sep}\n"));
        } else {
            s.push_str(&format!("    \"{k}\": \"{v}\"{sep}\n"));
        }
    }
    // Native SVG <text> labels (not HTML in <foreignObject>), so librsvg renders the PNG
    // with its labels and the doc-sync tests can read the text (tools/render-diagram.sh).
    s.push_str("  },\n  \"htmlLabels\": false,\n  \"flowchart\": { \"htmlLabels\": false, \"wrappingWidth\": 400 }\n}\n");
    s
}

/// The CSS custom properties of a self-contained HTML page (the run report, the
/// animation player): a light `:root`, the dark values under
/// `prefers-color-scheme: dark` unless `data-theme="light"` is forced, and
/// `data-theme="dark"` forcing dark. `vars` maps each property name to its
/// `(light, dark)` values.
pub fn theme_css(vars: &[(&str, &str, &str)]) -> String {
    let block = |dark: bool| {
        vars.iter()
            .map(|v| format!("--{}:{};", v.0, if dark { v.2 } else { v.1 }))
            .collect::<String>()
    };
    let l = block(false);
    let d = block(true);
    format!(
        ":root{{{l}color-scheme:light}}\n\
         @media (prefers-color-scheme:dark){{:root:not([data-theme=\"light\"]){{{d}color-scheme:dark}}}}\n\
         :root[data-theme=\"dark\"]{{{d}color-scheme:dark}}\n"
    )
}

/// The standard custom properties of a generated HTML page, for both themes:
/// `--bg --fg --muted --line --card --accent`, the six accents
/// (`--cyan --magenta --lime --amber --coral --blue`) and the evidence-tier colours
/// (`--val` validated, `--mod` modelled, `--par` partner).
pub fn page_css() -> String {
    theme_css(&[
        ("bg", light::BG, dark::BG),
        ("fg", light::INK, dark::INK),
        ("muted", light::INK_3, dark::INK_3),
        ("line", light::RULE, dark::RULE),
        ("card", light::PANEL, dark::PANEL),
        ("accent", light::CYAN, dark::CYAN),
        ("cyan", light::CYAN, dark::CYAN),
        ("magenta", light::MAGENTA, dark::MAGENTA),
        ("lime", light::LIME, dark::LIME),
        ("amber", light::AMBER, dark::AMBER),
        ("coral", light::CORAL, dark::CORAL),
        ("blue", light::BLUE, dark::BLUE),
        ("val", light::LIME, dark::LIME),
        ("mod", light::AMBER, dark::AMBER),
        ("par", light::MAGENTA, dark::MAGENTA),
    ])
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_ramp_starts_on_the_chart_ground_and_ends_bright() {
        assert_eq!(ramp(0.0), dark::BG);
        assert_eq!(ramp(f64::NAN), dark::BG);
        assert_eq!(ramp(1.0), "#FCFFA4");
        assert_eq!(ramp(2.0), "#FCFFA4");
    }

    #[test]
    fn every_domain_has_a_distinct_colour_in_each_theme() {
        for pick in [Domain::dark as fn(Domain) -> &'static str, Domain::light] {
            let mut seen: Vec<&str> = Domain::ALL.iter().map(|d| pick(*d)).collect();
            seen.sort_unstable();
            seen.dedup();
            assert_eq!(seen.len(), 6);
        }
    }

    #[test]
    fn the_series_are_distinct() {
        let mut s = chart::SERIES.to_vec();
        s.sort_unstable();
        s.dedup();
        assert_eq!(s.len(), chart::SERIES.len());
    }

    #[test]
    fn theme_css_emits_all_three_theme_states() {
        let css = theme_css(&[("bg", light::BG, dark::BG)]);
        assert!(css.contains(":root{--bg:#E8ECF3;color-scheme:light}"));
        assert!(css.contains("prefers-color-scheme:dark"));
        assert!(css.contains(":root[data-theme=\"dark\"]{--bg:#060A14;color-scheme:dark}"));
    }
}
