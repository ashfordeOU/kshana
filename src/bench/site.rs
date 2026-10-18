// SPDX-License-Identifier: AGPL-3.0-only
//! The static leaderboard page of kshana-bench: result files in, one self-contained HTML page
//! out. No script, no network request; the colours are the site tokens (`web/tokens.css`) so the
//! page can be ported into the site as it is.

use std::collections::BTreeMap;

use serde_json::Value;

use super::{validate_result, BenchError, NOTICE, SPEC_VERSION};

/// Escape text for an HTML text or attribute position.
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

fn num(v: Option<&Value>, digits: usize) -> String {
    match v.and_then(Value::as_f64) {
        Some(x) => format!("{x:.digits$}"),
        None => "n/a".into(),
    }
}

const TITLES: [(&str, &str); 4] = [
    ("a", "Task (a): detection on receiver logs"),
    ("b", "Task (b): detection on IQ"),
    ("c", "Task (c): timing holdover prediction"),
    ("d", "Task (d): out-of-distribution optimism gap"),
];

fn sort_key(task: &str, r: &Value) -> f64 {
    let m = &r["metrics"];
    let f = |p: &str| m.pointer(p).and_then(Value::as_f64).unwrap_or(f64::NAN);
    let k = match task {
        "c" => f("/primary_rmse_3600_ns"),
        "d" => -f("/auc_out"),
        _ => -f("/auc"),
    };
    if k.is_nan() {
        f64::INFINITY
    } else {
        k
    }
}

fn columns(task: &str) -> &'static [&'static str] {
    match task {
        "c" => &["RMSE 3600 s (ns)", "RMSE 300 s (ns)", "RMSE 7200 s (ns)"],
        "d" => &["AUC in", "AUC out", "Optimism gap", "Flag"],
        _ => &["AUC", "P_d at P_fa cap (upper bound)"],
    }
}

fn cells(task: &str, r: &Value) -> Vec<String> {
    let m = &r["metrics"];
    match task {
        "c" => {
            let at = |h: u64| {
                m.get("per_horizon")
                    .and_then(Value::as_array)
                    .and_then(|a| a.iter().find(|x| x["horizon_s"].as_u64() == Some(h)))
                    .and_then(|x| x.get("rmse_ns"))
            };
            vec![
                num(m.get("primary_rmse_3600_ns"), 3),
                num(at(300), 3),
                num(at(7200), 3),
            ]
        }
        "d" => vec![
            num(m.get("auc_in"), 3),
            num(m.get("auc_out"), 3),
            num(m.get("optimism_gap"), 3),
            match m.get("optimistic").and_then(Value::as_bool) {
                Some(true) => "optimistic".into(),
                Some(false) => "within tolerance".into(),
                None => "n/a".into(),
            },
        ],
        _ => vec![num(m.get("auc"), 3), num(m.get("pd_at_pfa_cap"), 3)],
    }
}

/// Render result files as the leaderboard page. Every file must pass [`validate_result`] and carry
/// the current spec version's major number, because results of different major versions are never
/// put in one table.
pub fn leaderboard_html(results: &[Value]) -> Result<String, BenchError> {
    let major = SPEC_VERSION
        .rsplit('/')
        .next()
        .and_then(|v| v.split('.').next())
        .unwrap_or("1");
    for (i, r) in results.iter().enumerate() {
        let p = validate_result(r);
        if !p.is_empty() {
            return Err(BenchError(format!(
                "result {} is not valid: {}",
                i + 1,
                p.join("; ")
            )));
        }
        let v = r["spec_version"].as_str().unwrap_or("");
        if v.rsplit('/').next().and_then(|x| x.split('.').next()) != Some(major) {
            return Err(BenchError(format!(
                "result {} was scored under {v}; this page is for {SPEC_VERSION}",
                i + 1
            )));
        }
    }
    let mut groups: BTreeMap<(String, String), Vec<&Value>> = BTreeMap::new();
    for r in results {
        groups
            .entry((
                r["task"].as_str().unwrap_or("").to_string(),
                r["split"].as_str().unwrap_or("").to_string(),
            ))
            .or_default()
            .push(r);
    }
    let mut body = String::new();
    for (task, title) in TITLES {
        let mine: Vec<_> = groups.iter().filter(|((t, _), _)| t == task).collect();
        body.push_str(&format!("<section><h2>{}</h2>\n", esc(title)));
        if mine.is_empty() {
            body.push_str("<p class=\"none\">No results yet for this task.</p>\n</section>\n");
            continue;
        }
        for ((_, split), rows) in mine {
            let mut rows = rows.clone();
            rows.sort_by(|a, b| sort_key(task, a).total_cmp(&sort_key(task, b)));
            body.push_str(&format!(
                "<div class=\"scroll\" tabindex=\"0\" role=\"region\" aria-label=\"{} {} results\"><table><caption>Split: {}</caption><thead><tr><th scope=\"col\">System</th>",
                esc(title),
                esc(split),
                esc(split)
            ));
            for c in columns(task) {
                body.push_str(&format!("<th scope=\"col\" class=\"n\">{}</th>", esc(c)));
            }
            body.push_str("<th scope=\"col\">Provenance</th><th scope=\"col\">Truth SHA-256</th></tr></thead><tbody>\n");
            for r in rows {
                let sys = &r["system"];
                let name = sys["name"].as_str().unwrap_or("");
                let ver = sys["version"].as_str().unwrap_or("");
                let label = match sys["url"].as_str() {
                    Some(u) if u.starts_with("https://") => {
                        format!("<a href=\"{}\" rel=\"noopener\">{}</a>", esc(u), esc(name))
                    }
                    _ => esc(name),
                };
                body.push_str(&format!(
                    "<tr><th scope=\"row\">{label} <span class=\"v\">{}</span></th>",
                    esc(ver)
                ));
                for c in cells(task, r) {
                    body.push_str(&format!("<td class=\"n\">{}</td>", esc(&c)));
                }
                let prov = match r["provenance"].as_str() {
                    Some("carried") => {
                        format!("carried: {}", r["provenance_note"].as_str().unwrap_or(""))
                    }
                    _ => "scored".into(),
                };
                let th = r["truth_sha256"].as_str().unwrap_or("");
                body.push_str(&format!(
                    "<td>{}</td><td class=\"h\"><code>{}</code></td></tr>\n",
                    esc(&prov),
                    esc(th.get(..12).unwrap_or(th))
                ));
            }
            body.push_str("</tbody></table></div>\n");
        }
        body.push_str("</section>\n");
    }
    Ok(format!(
        "<!doctype html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<title>kshana-bench leaderboard</title>\n<meta name=\"description\" content=\"Scores of submitted result files under kshana-bench {spec}. Advisory only.\">\n<style>{css}</style>\n</head>\n<body>\n<main>\n<h1>kshana-bench leaderboard</h1>\n<p class=\"lede\">Result files scored under <code>{spec}</code>. A row says this file scored this number on this split. It does not mean any product has been rated or approved by anyone.</p>\n<p class=\"notice\">{notice}</p>\n{body}<footer>\n<p>Licence of the specification and manifests: CC-BY-4.0 / CC0 proposed, owner decision pending. The real-data holdout is not secret: see the specification, section 4. Every score is modelled unless a row says an external oracle agreed.</p>\n</footer>\n</main>\n</body>\n</html>\n",
        spec = esc(SPEC_VERSION),
        css = CSS,
        notice = esc(NOTICE),
        body = body
    ))
}

const CSS: &str = r#"
:root{--bg:#E8ECF3;--surface:#F5F7FB;--ink:#182033;--ink-2:#3A455E;--ink-3:#4E5971;--line:rgba(28,44,84,.12);--line-2:rgba(28,44,84,.2);--int:#B8262B;--f-text:"Geist",ui-sans-serif,system-ui,-apple-system,"Segoe UI",sans-serif;--f-mono:"Geist Mono",ui-monospace,"SF Mono",Menlo,monospace;--gut:clamp(16px,4vw,44px);--r-card:28px}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--bg:#07080E;--surface:#12141F;--ink:#F2F4FB;--ink-2:#A6ADC4;--ink-3:#858CA6;--line:rgba(255,255,255,.07);--line-2:rgba(255,255,255,.14);--int:#FF5B54;color-scheme:dark}}
:root[data-theme="dark"]{--bg:#07080E;--surface:#12141F;--ink:#F2F4FB;--ink-2:#A6ADC4;--ink-3:#858CA6;--line:rgba(255,255,255,.07);--line-2:rgba(255,255,255,.14);--int:#FF5B54;color-scheme:dark}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--ink);font:400 16px/1.5 var(--f-text);-webkit-text-size-adjust:100%}
main{max-width:1200px;margin:0 auto;padding:clamp(32px,6vw,72px) var(--gut)}
h1{font-size:clamp(2rem,5vw,3.2rem);line-height:1.05;margin:0 0 12px;letter-spacing:-.02em}
h2{font-size:clamp(1.15rem,2.2vw,1.5rem);margin:40px 0 12px;letter-spacing:-.01em}
.lede{color:var(--ink-2);max-width:60ch}
.notice{background:var(--surface);border:1px solid var(--line-2);border-radius:12px;padding:12px 16px;color:var(--ink-2);font-size:14px}
.none{color:var(--ink-3)}
.scroll{overflow-x:auto;background:var(--surface);border:1px solid var(--line);border-radius:16px;margin:0 0 16px}
.scroll:focus-visible{outline:2px solid var(--int);outline-offset:2px}
table{border-collapse:collapse;width:100%;min-width:560px;font-size:14px}
caption{text-align:left;padding:12px 16px;font:500 12px/1.2 var(--f-mono);text-transform:uppercase;letter-spacing:.07em;color:var(--ink-3)}
th,td{padding:10px 16px;border-top:1px solid var(--line);text-align:left;vertical-align:top}
thead th{font:500 12px/1.3 var(--f-mono);text-transform:uppercase;letter-spacing:.06em;color:var(--ink-3)}
tbody th{font-weight:600}
.n{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
.v{font:400 12px var(--f-mono);color:var(--ink-3)}
code,.h{font-family:var(--f-mono);font-size:12px}
a{color:var(--int)}
footer{margin-top:48px;color:var(--ink-3);font-size:13px;max-width:70ch}
"#;

#[cfg(test)]
mod tests {
    use super::*;
    use crate::bench::{result_json, System};
    use serde_json::json;

    fn r(name: &str, auc: f64) -> Value {
        result_json(
            "a",
            "test",
            &System {
                name: name.into(),
                version: "1".into(),
                url: None,
            },
            "scored",
            None,
            &"a".repeat(64),
            &"b".repeat(64),
            json!({"auc": auc, "pd_at_pfa_cap": 0.5}),
            "MODELLED",
        )
    }

    #[test]
    fn rows_are_sorted_escaped_and_the_advisory_statement_is_present() {
        let html = leaderboard_html(&[r("low", 0.6), r("<script>x</script>", 0.9)]).unwrap();
        assert!(html.contains("&lt;script&gt;x&lt;/script&gt;"));
        assert!(!html.contains("<script>"));
        assert!(html.find("&lt;script&gt;").unwrap() < html.find(">low<").unwrap_or(usize::MAX));
        assert!(html.contains("Advisory:"));
        assert!(html.contains("CC-BY-4.0 / CC0 proposed, owner decision pending"));
        assert!(html.contains("No results yet for this task."));
    }

    #[test]
    fn an_invalid_or_foreign_version_result_is_refused() {
        assert!(leaderboard_html(&[json!({"schema": "x"})]).is_err());
        let mut other = r("x", 0.5);
        other["spec_version"] = json!("kshana-bench/2.0.0");
        assert!(leaderboard_html(&[other]).unwrap_err().0.contains("2.0.0"));
    }
}
