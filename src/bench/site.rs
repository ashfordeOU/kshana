// SPDX-License-Identifier: AGPL-3.0-only
//! The static leaderboard page of kshana-bench: result files in, one self-contained HTML page
//! out. No script, no network request; the colours are the site tokens (`web/tokens.css`) so the
//! page can be ported into the site as it is.

use std::collections::BTreeMap;

use serde_json::Value;

use super::{validate_result, BenchError, SPEC_VERSION};

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
        Some(x) => crate::i18n::num(x, digits),
        None => crate::t!("bench-site-not-available"),
    }
}

/// The tasks in page order.
const TASKS: [&str; 4] = ["a", "b", "c", "d"];

/// The heading of a task's section, in the current language.
fn task_title(task: &str) -> String {
    match task {
        "a" => crate::t!("bench-site-title-a"),
        "b" => crate::t!("bench-site-title-b"),
        "c" => crate::t!("bench-site-title-c"),
        "d" => crate::t!("bench-site-title-d"),
        other => other.to_string(),
    }
}

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

fn columns(task: &str) -> Vec<String> {
    match task {
        "c" => vec![
            crate::t!("bench-site-col-rmse-3600"),
            crate::t!("bench-site-col-rmse-300"),
            crate::t!("bench-site-col-rmse-7200"),
        ],
        "d" => vec![
            crate::t!("bench-site-col-auc-in"),
            crate::t!("bench-site-col-auc-out"),
            crate::t!("bench-site-col-optimism-gap"),
            crate::t!("bench-site-col-flag"),
        ],
        _ => vec![
            crate::t!("bench-site-col-auc"),
            crate::t!("bench-site-col-pd-at-pfa-cap"),
        ],
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
                Some(true) => crate::t!("bench-site-flag-optimistic"),
                Some(false) => crate::t!("bench-site-flag-within-tolerance"),
                None => crate::t!("bench-site-not-available"),
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
            return Err(BenchError(crate::t!(
                "bench-site-result-is-not-valid",
                v1 = i + 1,
                p = p.join("; ")
            )));
        }
        if r["split"] == "holdout" && r["task"] == "d" {
            match r["holdout_commitment"].as_str() {
                None => {
                    return Err(BenchError(crate::t!(
                        "bench-site-result-is-task-holdout-result",
                        v1 = i + 1
                    )))
                }
                Some(c) if super::is_exposed(c) => {
                    return Err(BenchError(crate::t!(
                        "bench-site-result-is-scored-on-provisional",
                        v1 = i + 1
                    )))
                }
                Some(_) => {}
            }
        }
        let v = r["spec_version"].as_str().unwrap_or("");
        if v.rsplit('/').next().and_then(|x| x.split('.').next()) != Some(major) {
            return Err(BenchError(crate::t!(
                "bench-site-result-was-scored-under-this",
                v1 = i + 1,
                v = v,
                SPEC_VERSION = SPEC_VERSION
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
        body.push_str(&format!(
            "<p class=\"kb-none\">{}</p>\n",
            esc(&crate::t!("bench-site-none-published"))
        ));
    }
    for task in TASKS {
        if results.is_empty() {
            break;
        }
        let title = task_title(task);
        let mine: Vec<_> = groups.iter().filter(|((t, _), _)| t == task).collect();
        body.push_str(&format!("<section><h3>{}</h3>\n", esc(&title)));
        if mine.is_empty() {
            body.push_str(&format!(
                "<p class=\"kb-none\">{}</p>\n</section>\n",
                esc(&crate::t!("bench-site-none-for-task"))
            ));
            continue;
        }
        for ((_, split), rows) in mine {
            let mut rows = rows.clone();
            rows.sort_by(|a, b| sort_key(task, a).total_cmp(&sort_key(task, b)));
            body.push_str(&format!(
                "<div class=\"kb-scroll\" tabindex=\"0\" role=\"region\" aria-label=\"{}\"><table><caption>{}</caption><thead><tr><th scope=\"col\">{}</th>",
                esc(&crate::t!(
                    "bench-site-region-label",
                    title = title,
                    split = split
                )),
                esc(&crate::t!("bench-site-caption-split", split = split)),
                esc(&crate::t!("bench-site-th-system"))
            ));
            for c in columns(task) {
                body.push_str(&format!(
                    "<th scope=\"col\" class=\"kb-n\">{}</th>",
                    esc(&c)
                ));
            }
            body.push_str(&format!(
                "<th scope=\"col\">{}</th><th scope=\"col\">{}</th></tr></thead><tbody>\n",
                esc(&crate::t!("bench-site-th-provenance")),
                esc(&crate::t!("bench-site-th-truth-sha256"))
            ));
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
                    Some("carried") => crate::t!(
                        "bench-site-provenance-carried",
                        note = r["provenance_note"].as_str().unwrap_or("")
                    ),
                    _ => crate::t!("bench-site-provenance-scored"),
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
        "<section class=\"kb-board\" aria-labelledby=\"kb-title\">\n<style>{css}</style>\n<h2 class=\"kb-h1\" id=\"kb-title\">{heading}</h2>\n<p class=\"kb-lede\">{lede}</p>\n<p class=\"kb-notice\">{notice}</p>\n{body}<p class=\"kb-foot\">{foot}</p>\n</section>\n",
        css = BOARD_CSS,
        heading = esc(&crate::t!("bench-site-heading")),
        lede = crate::t!("bench-site-lede", spec = esc(SPEC_VERSION)),
        notice = esc(&crate::t!("legal-bench-notice")),
        foot = esc(&crate::t!("bench-site-foot")),
        body = body
    );
    if fragment {
        return Ok(board);
    }
    Ok(format!(
        "<!doctype html>\n<html lang=\"{lang}\">\n<head>\n<meta charset=\"utf-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<title>{heading}</title>\n<meta name=\"description\" content=\"{description}\">\n<style>{page}</style>\n</head>\n<body>\n<main>\n{board}</main>\n</body>\n</html>\n",
        lang = esc(crate::i18n::current().tag()),
        heading = esc(&crate::t!("bench-site-heading")),
        description = esc(&crate::t!("bench-site-meta-description", spec = SPEC_VERSION)),
        page = PAGE_CSS,
        board = board
    ))
}

/// Styles of the page shell only; the board brings its own, scoped under `.kb-board`.
const PAGE_CSS: &str = include_str!("site_page.css");

/// The board's own styles, every selector under `.kb-board`, colours from the site tokens with
/// the token values as fallbacks so it also works outside the site.
const BOARD_CSS: &str = include_str!("site_board.css");

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
        other["spec_version"] = json!("kshana-bench/3.0.0");
        assert!(leaderboard_html(&[other]).unwrap_err().0.contains("3.0.0"));
    }
}
