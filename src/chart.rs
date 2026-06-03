// SPDX-License-Identifier: Apache-2.0
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
            "<line x1=\"{ml:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"#1e2733\"/>",
            ml + pw
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#8593a3\" font-size=\"11\">{}</text>",
            ml - 6.0,
            y + 4.0,
            fmt_tick(val)
        ));
    }
    let yc = mt + ph / 2.0;
    s.push_str(&format!(
        "<text x=\"16\" y=\"{yc:.1}\" text-anchor=\"middle\" fill=\"#8593a3\" font-size=\"12\" transform=\"rotate(-90 16 {yc:.1})\">{title}</text>"
    ));
    s
}
