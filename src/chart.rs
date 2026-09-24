// SPDX-License-Identifier: AGPL-3.0-only
//! Shared SVG charting helpers used by the per-pack chart renderers.

/// Format a y-axis tick value at a precision sensible for its magnitude.
fn fmt_tick(v: f64) -> String {
    let a = v.abs();
    if a == 0.0 {
        "0".to_string()
    } else if a >= 10.0 {
        format!("{v:.0}")
    } else if a >= 1.0 {
        format!("{v:.1}")
    } else {
        format!("{v:.2}")
    }
}

/// SVG for a labelled y-axis: five horizontal gridlines from 0 to `y_max` with
/// numeric tick labels, plus a rotated axis title. The plot area starts at
/// (`ml`, `mt`) and spans `pw` × `ph` pixels. Emit this after the background and
/// before the data polylines so the gridlines sit behind the data.
pub fn y_axis(ml: f64, mt: f64, pw: f64, ph: f64, y_max: f64, title: &str) -> String {
    let mut s = String::new();
    let ticks = 4;
    for i in 0..=ticks {
        let frac = i as f64 / ticks as f64;
        let y = mt + ph - frac * ph;
        let val = y_max * frac;
        s.push_str(&format!(
            "<line x1=\"{ml:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"#262019\"/>",
            ml + pw
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#8c8273\" font-size=\"11\">{}</text>",
            ml - 6.0,
            y + 4.0,
            fmt_tick(val)
        ));
    }
    let yc = mt + ph / 2.0;
    s.push_str(&format!(
        "<text x=\"16\" y=\"{yc:.1}\" text-anchor=\"middle\" fill=\"#8c8273\" font-size=\"12\" transform=\"rotate(-90 16 {yc:.1})\">{title}</text>"
    ));
    s
}

/// Opening of a dark two-panel chart: the `<svg>` element, its background, a bold title
/// and a one-line subtitle. Both strings are written verbatim, so any markup in them must
/// already be escaped.
pub fn frame_open(w: f64, h: f64, title: &str, subtitle: &str) -> String {
    format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">\
         <rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>\
         <text x=\"24\" y=\"24\" font-size=\"15\" font-weight=\"bold\">{title}</text>\
         <text x=\"24\" y=\"40\" font-size=\"11\" fill=\"#8a8172\">{subtitle}</text>"
    )
}

/// A panel's caption, set 8 px above its top-left corner, and its left and bottom axis
/// lines. The panel's left edge is `x`, it spans `width`, and its axes run from `top`
/// down to `bottom`.
pub fn panel_axes(x: f64, top: f64, width: f64, bottom: f64, caption: &str) -> String {
    format!(
        "<text x=\"{x:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">{caption}</text>\
         <line x1=\"{x:.0}\" y1=\"{top:.0}\" x2=\"{x:.0}\" y2=\"{bottom:.0}\" stroke=\"#342c21\"/>\
         <line x1=\"{x:.0}\" y1=\"{bottom:.0}\" x2=\"{:.0}\" y2=\"{bottom:.0}\" stroke=\"#342c21\"/>",
        top - 8.0,
        x + width
    )
}
