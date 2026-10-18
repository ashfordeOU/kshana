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
    render(results, false)
}

/// The same board as a fragment for embedding in a site page: no `<html>` or `<head>`, one wrapper
/// element, every class prefixed `kb-`, and its own inline `<style>` scoped to the wrapper. Numbers
/// come from the result files only; with no results it says so.
pub fn leaderboard_fragment(results: &[Value]) -> Result<String, BenchError> {
    render(results, true)
}

fn render(results: &[Value], fragment: bool) -> Result<String, BenchError> {
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
        if r["split"] == "holdout" && r["task"] == "d" {
            match r["holdout_commitment"].as_str() {
                None => {
                    return Err(BenchError(format!(
                        "result {} is a task (d) holdout result without a `holdout_commitment`",
                        i + 1
                    )))
                }
                Some(c) if super::is_exposed(c) => {
                    return Err(BenchError(format!(
                        "result {} is scored on a provisional, exposed holdout seed: not a release holdout",
                        i + 1
                    )))
                }
                Some(_) => {}
            }
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
    if results.is_empty() {
        body.push_str("<p class=\"kb-none\">No results published yet. A row appears here only when a result file is scored and added; nothing on this page is an estimate.</p>\n");
    }
    for (task, title) in TITLES {
        if results.is_empty() {
            break;
        }
        let mine: Vec<_> = groups.iter().filter(|((t, _), _)| t == task).collect();
        body.push_str(&format!("<section><h3>{}</h3>\n", esc(title)));
        if mine.is_empty() {
            body.push_str("<p class=\"kb-none\">No results yet for this task.</p>\n</section>\n");
            continue;
        }
        for ((_, split), rows) in mine {
            let mut rows = rows.clone();
            rows.sort_by(|a, b| sort_key(task, a).total_cmp(&sort_key(task, b)));
            body.push_str(&format!(
                "<div class=\"kb-scroll\" tabindex=\"0\" role=\"region\" aria-label=\"{} {} results\"><table><caption>Split: {}</caption><thead><tr><th scope=\"col\">System</th>",
                esc(title),
                esc(split),
                esc(split)
            ));
            for c in columns(task) {
                body.push_str(&format!("<th scope=\"col\" class=\"kb-n\">{}</th>", esc(c)));
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
                    "<tr><th scope=\"row\">{label} <span class=\"kb-v\">{}</span></th>",
                    esc(ver)
                ));
                for c in cells(task, r) {
                    body.push_str(&format!("<td class=\"kb-n\">{}</td>", esc(&c)));
                }
                let prov = match r["provenance"].as_str() {
                    Some("carried") => {
                        format!("carried: {}", r["provenance_note"].as_str().unwrap_or(""))
                    }
                    _ => "scored".into(),
                };
                let th = r["truth_sha256"].as_str().unwrap_or("");
                body.push_str(&format!(
                    "<td>{}</td><td class=\"kb-h\"><code>{}</code></td></tr>\n",
                    esc(&prov),
                    esc(th.get(..12).unwrap_or(th))
                ));
            }
            body.push_str("</tbody></table></div>\n");
        }
        body.push_str("</section>\n");
    }
    let board = format!(
        "<section class=\"kb-board\" aria-labelledby=\"kb-title\">\n<style>{css}</style>\n<h2 class=\"kb-h1\" id=\"kb-title\">kshana-bench leaderboard</h2>\n<p class=\"kb-lede\">Result files scored under <code>{spec}</code>. A row says this file scored this number on this split. It does not mean any product has been rated or approved by anyone, and no organisation is named as an endorser.</p>\n<p class=\"kb-notice\">{notice}</p>\n{body}<p class=\"kb-foot\">Every score is modelled unless a row says an external oracle agreed. Licence of the specification and manifests: CC-BY-4.0 / CC0 proposed, owner decision pending. The real-data holdout is not secret: see the specification, section 4.</p>\n</section>\n",
        css = BOARD_CSS,
        spec = esc(SPEC_VERSION),
        notice = esc(NOTICE),
        body = body
    );
    if fragment {
        return Ok(board);
    }
    Ok(format!(
        "<!doctype html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<title>kshana-bench leaderboard</title>\n<meta name=\"description\" content=\"Scores of submitted result files under kshana-bench {spec}. Advisory only.\">\n<style>{page}</style>\n</head>\n<body>\n<main>\n{board}</main>\n</body>\n</html>\n",
        spec = esc(SPEC_VERSION),
        page = PAGE_CSS,
        board = board
    ))
}

/// Styles of the page shell only; the board brings its own, scoped under `.kb-board`.
const PAGE_CSS: &str = r#"
:root{--bg:#E8ECF3;--ink:#182033}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--bg:#07080E;--ink:#F2F4FB;color-scheme:dark}}
:root[data-theme="dark"]{--bg:#07080E;--ink:#F2F4FB;color-scheme:dark}
*{box-sizing:border-box}
body{margin:0;background:var(--bg);color:var(--ink);font:400 16px/1.5 "Geist",ui-sans-serif,system-ui,-apple-system,"Segoe UI",sans-serif;-webkit-text-size-adjust:100%}
main{max-width:1200px;margin:0 auto;padding:clamp(32px,6vw,72px) clamp(16px,4vw,44px)}
"#;

/// The board's own styles, every selector under `.kb-board`, colours from the site tokens with
/// the token values as fallbacks so it also works outside the site.
const BOARD_CSS: &str = r#"
.kb-board{--kb-ink:var(--ink,#182033);--kb-ink-2:var(--ink-2,#3A455E);--kb-ink-3:var(--ink-3,#4E5971);--kb-surface:var(--surface,#F5F7FB);--kb-line:var(--line,rgba(28,44,84,.12));--kb-line-2:var(--line-2,rgba(28,44,84,.2));--kb-accent:var(--int,#B8262B);color:var(--kb-ink);font:400 16px/1.5 var(--f-text,"Geist",ui-sans-serif,system-ui,-apple-system,"Segoe UI",sans-serif);max-width:100%}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]) .kb-board{--kb-ink:var(--ink,#F2F4FB);--kb-ink-2:var(--ink-2,#A6ADC4);--kb-ink-3:var(--ink-3,#858CA6);--kb-surface:var(--surface,#12141F);--kb-line:var(--line,rgba(255,255,255,.07));--kb-line-2:var(--line-2,rgba(255,255,255,.14));--kb-accent:var(--int,#FF5B54)}}
:root[data-theme="dark"] .kb-board{--kb-ink:var(--ink,#F2F4FB);--kb-ink-2:var(--ink-2,#A6ADC4);--kb-ink-3:var(--ink-3,#858CA6);--kb-surface:var(--surface,#12141F);--kb-line:var(--line,rgba(255,255,255,.07));--kb-line-2:var(--line-2,rgba(255,255,255,.14));--kb-accent:var(--int,#FF5B54)}
.kb-board .kb-h1{font-size:clamp(1.6rem,4vw,2.4rem);line-height:1.1;margin:0 0 12px;letter-spacing:-.02em}
.kb-board h3{font-size:clamp(1.05rem,2vw,1.3rem);margin:32px 0 12px}
.kb-board .kb-lede{color:var(--kb-ink-2);max-width:60ch}
.kb-board .kb-notice{background:var(--kb-surface);border:1px solid var(--kb-line-2);border-radius:12px;padding:12px 16px;color:var(--kb-ink-2);font-size:14px}
.kb-board .kb-none{color:var(--kb-ink-3)}
.kb-board .kb-scroll{overflow-x:auto;background:var(--kb-surface);border:1px solid var(--kb-line);border-radius:16px;margin:0 0 16px}
.kb-board .kb-scroll:focus-visible{outline:2px solid var(--kb-accent);outline-offset:2px}
.kb-board table{border-collapse:collapse;width:100%;min-width:560px;font-size:14px}
.kb-board caption{text-align:left;padding:12px 16px;font:500 12px/1.2 var(--f-mono,"Geist Mono",ui-monospace,Menlo,monospace);text-transform:uppercase;letter-spacing:.07em;color:var(--kb-ink-3)}
.kb-board th,.kb-board td{padding:10px 16px;border-top:1px solid var(--kb-line);text-align:left;vertical-align:top}
.kb-board thead th{font:500 12px/1.3 var(--f-mono,"Geist Mono",ui-monospace,Menlo,monospace);text-transform:uppercase;letter-spacing:.06em;color:var(--kb-ink-3)}
.kb-board tbody th{font-weight:600}
.kb-board .kb-n{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
.kb-board .kb-v{font:400 12px var(--f-mono,"Geist Mono",ui-monospace,Menlo,monospace);color:var(--kb-ink-3)}
.kb-board code,.kb-board .kb-h{font-family:var(--f-mono,"Geist Mono",ui-monospace,Menlo,monospace);font-size:12px}
.kb-board a{color:var(--kb-accent)}
.kb-board .kb-foot{margin-top:24px;color:var(--kb-ink-3);font-size:13px;max-width:70ch}
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
    fn a_holdout_result_on_an_exposed_or_missing_commitment_is_refused() {
        let mut h = r("x", 0.5);
        h["task"] = json!("d");
        h["split"] = json!("holdout");
        assert!(leaderboard_html(&[h.clone()])
            .unwrap_err()
            .0
            .contains("without a `holdout_commitment`"));
        h["holdout_commitment"] = json!(crate::bench::EXPOSED_COMMITMENTS[0]);
        assert!(leaderboard_html(&[h.clone()])
            .unwrap_err()
            .0
            .contains("exposed"));
        h["holdout_commitment"] = json!("ab".repeat(32));
        assert!(leaderboard_html(&[h]).is_ok());
    }

    #[test]
    fn the_fragment_has_one_wrapper_only_kb_classes_its_own_style_and_the_advisory_statement() {
        let f = leaderboard_fragment(&[r("a", 0.7)]).unwrap();
        assert!(!f.contains("<html") && !f.contains("<head") && !f.contains("<body"));
        assert!(f.starts_with("<section class=\"kb-board\""));
        assert_eq!(f.matches("<style>").count(), 1);
        for chunk in f.split("class=\"").skip(1) {
            let v = chunk.split('"').next().unwrap();
            assert!(v.split(' ').all(|c| c.starts_with("kb-")), "{v}");
        }
        assert!(f.contains("Advisory:") && f.contains("rated or approved by anyone"));
        assert!(f.contains("0.700"));
    }

    #[test]
    fn with_no_results_the_board_says_so_and_invents_nothing() {
        let f = leaderboard_fragment(&[]).unwrap();
        assert!(f.contains("No results published yet"));
        assert!(!f.contains("<table"));
        assert!(leaderboard_html(&[])
            .unwrap()
            .contains("No results published yet"));
    }

    #[test]
    fn an_invalid_or_foreign_version_result_is_refused() {
        assert!(leaderboard_html(&[json!({"schema": "x"})]).is_err());
        let mut other = r("x", 0.5);
        other["spec_version"] = json!("kshana-bench/2.0.0");
        assert!(leaderboard_html(&[other]).unwrap_err().0.contains("2.0.0"));
    }
}
