// SPDX-License-Identifier: AGPL-3.0-only
//! The human-readable summary: one self-contained HTML file, no scripts, no external
//! resources. Every value that came from outside is escaped.

use super::bundle::{LogRecord, SignerRecord, Window, DISCLAIMER};
use serde_json::Value;
use std::collections::BTreeMap;
use std::fmt::Write;

/// Rows of the per-epoch table before the rest is left to `epochs.json`.
const MAX_ROWS: usize = 2000;

/// What the summary is drawn from.
pub struct SummaryInput<'a> {
    /// Title.
    pub title: &'a str,
    /// Engine version.
    pub engine_version: &'a str,
    /// Creation time, if any.
    pub created_utc: Option<&'a str>,
    /// Window.
    pub window: Window,
    /// Log record.
    pub log: &'a LogRecord,
    /// Signer record.
    pub signer: &'a SignerRecord,
    /// Configuration.
    pub config: &'a Value,
    /// Per-epoch results.
    pub epochs: &'a [Value],
}

/// Escape text for HTML element and attribute content.
pub fn esc(s: &str) -> String {
    let mut o = String::with_capacity(s.len());
    for c in s.chars() {
        match c {
            '&' => o.push_str("&amp;"),
            '<' => o.push_str("&lt;"),
            '>' => o.push_str("&gt;"),
            '"' => o.push_str("&quot;"),
            '\'' => o.push_str("&#39;"),
            c => o.push(c),
        }
    }
    o
}

fn scalar(v: &Value) -> String {
    match v {
        Value::Null => "none".into(),
        Value::String(s) => s.clone(),
        other => other.to_string(),
    }
}

fn names(v: Option<&Value>) -> Vec<String> {
    v.and_then(Value::as_array)
        .map(|a| a.iter().map(scalar).collect())
        .unwrap_or_default()
}

/// Render the summary.
pub fn render(i: &SummaryInput<'_>) -> String {
    let mut h = String::new();
    let _ = writeln!(
        h,
        "<!doctype html>\n<html lang=\"en\"><head><meta charset=\"utf-8\">\n\
<meta http-equiv=\"Content-Security-Policy\" content=\"default-src 'none'; style-src 'unsafe-inline'\">\n\
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n\
<title>{t}</title>\n<style>\n\
body{{font:15px/1.5 system-ui,sans-serif;max-width:60rem;margin:2rem auto;padding:0 1rem;color:#1b1f24;background:#fff}}\n\
h1{{font-size:1.5rem}}h2{{font-size:1.1rem;margin-top:2rem}}\n\
.box{{border:2px solid #8a5a00;background:#fff7e6;padding:.75rem 1rem;border-radius:6px}}\n\
table{{border-collapse:collapse;width:100%}}td,th{{border-bottom:1px solid #d0d7de;padding:.25rem .5rem;text-align:left;vertical-align:top}}\n\
code{{font:13px ui-monospace,monospace;word-break:break-all}}\n\
.s-untrusted{{color:#b42318;font-weight:600}}.s-degraded{{color:#8a5a00;font-weight:600}}\n\
@media (prefers-color-scheme:dark){{body{{background:#0d1117;color:#e6edf3}}.box{{background:#2b2110;border-color:#d29922}}td,th{{border-color:#30363d}}.s-untrusted{{color:#ff7b72}}.s-degraded{{color:#e3b341}}}}\n\
</style></head><body>",
        t = esc(i.title)
    );
    let _ = writeln!(h, "<h1>{}</h1>", esc(i.title));
    let _ = writeln!(
        h,
        "<p class=\"box\"><strong>Technical record, not a legal opinion.</strong> {}</p>",
        esc(DISCLAIMER)
    );

    if let Some(a) = i.config.get("advisory").and_then(Value::as_str) {
        let _ = writeln!(
            h,
            "<p class=\"box\"><strong>Advisory.</strong> {}</p>",
            esc(a)
        );
    }
    h.push_str("<h2>Identification</h2>\n<table>\n");
    let mut row = |k: &str, v: &str| {
        let _ = writeln!(
            h,
            "<tr><th>{}</th><td><code>{}</code></td></tr>",
            esc(k),
            esc(v)
        );
    };
    row("Engine version", i.engine_version);
    row("Created (UTC)", i.created_utc.unwrap_or("not stated"));
    row(
        "Window",
        &format!(
            "{} s to {} s after the first epoch of the log",
            i.window.from_s, i.window.to_s
        ),
    );
    row(
        "First epoch of the log",
        i.log
            .start_label
            .as_deref()
            .unwrap_or("not stated by the log"),
    );
    row("Log format", &i.log.format);
    row("Log file name", &i.log.file_name);
    row("Full log SHA-256", &i.log.full_sha256);
    row("Full log size (bytes)", &i.log.full_bytes.to_string());
    row(
        "Log slice in this pack",
        &format!(
            "{:?}, bytes {} to {}",
            i.log.slice.kind, i.log.slice.start, i.log.slice.end
        ),
    );
    row("Log slice SHA-256", &i.log.slice.sha256);
    row("Signer (Ed25519) fingerprint", &i.signer.fingerprint);
    row("Signer public key", &i.signer.public_key);
    h.push_str("</table>\n");
    let _ = writeln!(
        h,
        "<p>A slice of kind <code>WholeLog</code> means the source could not give a byte range \
for the window, so the whole log is bundled and the window limits only which epochs are \
reported. A timestamp token, if one is attached later, is not part of this page; \
its time is shown only by <code>kshana evidence verify</code>, and <strong>timestamp authority \
signature not verified by Kshana</strong>: check it with <code>openssl ts -verify</code>. \
Check this pack with <code>kshana evidence verify</code>; compare the signer \
fingerprint with one you obtained from the signer by another route.</p>"
    );

    // Epoch statistics
    let mut by_state: BTreeMap<String, usize> = BTreeMap::new();
    let mut by_monitor: BTreeMap<String, usize> = BTreeMap::new();
    let mut first_bad: Option<(f64, String)> = None;
    for e in i.epochs {
        let state = e
            .get("state")
            .map(scalar)
            .unwrap_or_else(|| "unknown".into());
        *by_state.entry(state.clone()).or_insert(0) += 1;
        for m in names(e.get("alarms")) {
            *by_monitor.entry(m).or_insert(0) += 1;
        }
        if first_bad.is_none() && (state == "degraded" || state == "untrusted") {
            first_bad = Some((
                e.get("t_s").and_then(Value::as_f64).unwrap_or(f64::NAN),
                state,
            ));
        }
    }
    let _ = writeln!(
        h,
        "<h2>Results in the window</h2>\n<p>{} epochs.</p>\n<table>",
        i.epochs.len()
    );
    for (s, n) in &by_state {
        let _ = writeln!(h, "<tr><th>{}</th><td>{n} epochs</td></tr>", esc(s));
    }
    h.push_str("</table>\n");
    match &first_bad {
        Some((t, s)) => {
            let _ = writeln!(
                h,
                "<p>First epoch not nominal in the window: <code>{}</code> s, state <code>{}</code>.</p>",
                esc(&t.to_string()),
                esc(s)
            );
        }
        None => h.push_str("<p>No epoch in the window was degraded or untrusted.</p>\n"),
    }
    if !by_monitor.is_empty() {
        h.push_str("<h3>Reasons (monitors that alarmed), epochs each</h3>\n<table>\n");
        for (m, n) in &by_monitor {
            let _ = writeln!(h, "<tr><th>{}</th><td>{n}</td></tr>", esc(m));
        }
        h.push_str("</table>\n");
    }

    // Configuration
    h.push_str("<h2>Configuration and thresholds</h2>\n<p>Complete in <code>config.json</code>; the values below are the run's own.</p>\n");
    let mut flat: Vec<(String, String)> = Vec::new();
    fn walk(prefix: &str, v: &Value, out: &mut Vec<(String, String)>) {
        match v {
            Value::Object(o) => {
                for (k, x) in o {
                    let p = if prefix.is_empty() {
                        k.clone()
                    } else {
                        format!("{prefix}.{k}")
                    };
                    walk(&p, x, out);
                }
            }
            other => out.push((prefix.to_string(), scalar(other))),
        }
    }
    walk("", i.config, &mut flat);
    h.push_str("<table>\n");
    for (k, v) in &flat {
        let _ = writeln!(
            h,
            "<tr><th>{}</th><td><code>{}</code></td></tr>",
            esc(k),
            esc(v)
        );
    }
    h.push_str("</table>\n");

    // Per-epoch table
    h.push_str("<h2>Per-epoch results</h2>\n<table>\n<tr><th>t (s)</th><th>state</th><th>score</th><th>reasons</th><th>reported position (lat, lon, height m)</th></tr>\n");
    for e in i.epochs.iter().take(MAX_ROWS) {
        let state = e.get("state").map(scalar).unwrap_or_default();
        let score = e
            .get("score")
            .filter(|v| !v.is_null())
            .map(scalar)
            .unwrap_or_else(|| "-".into());
        let pos = match e.get("position") {
            Some(Value::Object(p)) => ["lat_deg", "lon_deg", "height_m"]
                .iter()
                .map(|k| p.get(*k).map(scalar).unwrap_or_else(|| "-".into()))
                .collect::<Vec<_>>()
                .join(", "),
            _ => "-".into(),
        };
        let _ = writeln!(
            h,
            "<tr><td>{}</td><td class=\"s-{}\">{}</td><td>{}</td><td>{}</td><td>{}</td></tr>",
            esc(&e.get("t_s").map(scalar).unwrap_or_default()),
            esc(&state
                .chars()
                .filter(|c| c.is_ascii_alphanumeric())
                .collect::<String>()),
            esc(&state),
            esc(&score),
            esc(&names(e.get("alarms")).join(", ")),
            esc(&pos)
        );
    }
    h.push_str("</table>\n");
    if i.epochs.len() > MAX_ROWS {
        let _ = writeln!(
            h,
            "<p>{} further epochs are in <code>epochs.json</code>.</p>",
            i.epochs.len() - MAX_ROWS
        );
    }
    h.push_str("<h2>Limits of this record</h2>\n<p>It shows what the engine computed from the stated log bytes under the stated configuration. It does not say what caused any event, who was responsible, or whether any obligation was met. It cannot show that the log reflects what the receiver actually received. Integrity and authorship are checked with <code>kshana evidence verify</code>, not by reading this page.</p>\n</body></html>\n");
    h
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn escapes_everything_external() {
        assert_eq!(
            esc("<a href=\"x\">&'"),
            "&lt;a href=&quot;x&quot;&gt;&amp;&#39;"
        );
    }
}
