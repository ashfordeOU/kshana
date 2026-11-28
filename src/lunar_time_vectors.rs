// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar time-scale test vectors for mission software, and a runner (`kshana lunar-time-vectors`,
//! docs/LUNAR-TIME-VECTORS.md).
//!
//! The vectors live in `data/conformance/lunar-time/*.json` (format
//! `kshana.lunar-time-vectors/1`). Their expected values come from an independent generator
//! (`data/conformance/lunar-time/gen_lunar_time_vectors.py`, Python standard library, exact
//! rational arithmetic on the defining constants), and **every vector cites the published text
//! its value comes from** and carries a status:
//!
//! * `defined`: follows from a defining resolution: IAU 2024 Resolution II (the Lunar Celestial
//!   Reference System and Lunar Coordinate Time, TCL, with its origin at 1977 January 1,
//!   0h 0m 32.184s TCB at the centre of the Moon), IAU 2000 Resolution B1.9 (TT, `L_G`),
//!   IAU 2006 Resolution B3 (TDB, `L_B`, `TDB0`), and the leap seconds of IERS Bulletin C;
//! * `published-model`: a published numerical result of a model (the LTE440 lunar time
//!   ephemeris rates), not a definition;
//! * `provisional`: the quantity has no published definition. **Coordinated Lunar Time (LTC)
//!   has none** as of 2026-11-28: IAU 2024 Resolution III leaves the relation between a lunar
//!   reference time scale and UTC to agreement among international organisations, and NASA
//!   describes LTC as an ensemble of lunar clocks traceable to UTC, still to be established.
//!   A provisional vector must say why (`status_reason`).
//!
//! The runner checks kshana's own implementation ([`crate::lunar_timescale`],
//! [`crate::lunar_time`], [`crate::gnss_time`]) against the vectors. Another project can run the
//! same files: each vector is an operation, an input and an expected object.
//!
//! **Evidence: MODELLED.** A pass means kshana's arithmetic reproduces the cited values within the
//! stated tolerance; it says nothing about any other software and does not define LTC.

use serde_json::{Map, Value};

use crate::lunar_timescale::{self as lts, Epoch, Scale};

/// The format tag every vector file carries.
pub const FORMAT: &str = "kshana.lunar-time-vectors/1";

/// The vector files shipped with kshana, as (file name, text).
pub const BUILTIN: &[(&str, &str)] = &[(
    "lunar-time.json",
    include_str!("../data/conformance/lunar-time/lunar-time.json"),
)];

/// The statuses a vector may carry.
pub const STATUSES: [&str; 3] = ["defined", "published-model", "provisional"];

/// Which published text defines a time-scale tag (kshana's registry; `None` for a tag with no
/// published definition).
pub fn scale_tag_definition(tag: &str) -> Option<&'static str> {
    Some(match tag {
        "TT" => "IAU 2000 Resolution B1.9",
        "TCG" | "TCB" => "IAU 2000 Resolution B1.3",
        "TDB" => "IAU 2006 Resolution B3",
        "TCL" => "IAU 2024 Resolution II",
        _ => return None,
    })
}

/// The outcome of one vector.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct Outcome {
    /// The file the vector came from.
    pub file: String,
    /// The vector's id.
    pub id: String,
    /// The operation.
    pub op: String,
    /// `defined`, `published-model` or `provisional`.
    pub status: String,
    /// The cited source's title.
    pub source: String,
    /// Whether every expected field matched.
    pub pass: bool,
    /// For a failure, what differed (`field: want != got`) or the error.
    pub detail: String,
}

fn num(input: &Map<String, Value>, k: &str) -> Result<f64, String> {
    input
        .get(k)
        .and_then(Value::as_f64)
        .ok_or_else(|| crate::terr!("e-lunar-time-vectors-missing-input", key = k))
}

fn epoch(scale: Scale, input: &Map<String, Value>) -> Result<Epoch, String> {
    Ok(Epoch {
        scale,
        jd0: num(input, "jd0")?,
        s: num(input, "s")?,
    })
}

/// Seconds from `a` to `b` (both epochs as day + seconds).
fn diff_s(a: &Epoch, b: &Epoch) -> f64 {
    (b.jd0 - a.jd0) * 86_400.0 + (b.s - a.s)
}

fn out_of_span() -> String {
    crate::terr!("e-lunar-time-vectors-out-of-span")
}

/// Run one operation on its input, giving the output fields.
pub fn evaluate(op: &str, input: &Map<String, Value>) -> Result<Map<String, Value>, String> {
    let mut out = Map::new();
    match op {
        "tcg_minus_tt" => {
            let tt = epoch(Scale::Tt, input)?;
            let tcg = lts::convert(tt, Scale::Tcg).ok_or_else(out_of_span)?;
            out.insert("seconds".into(), Value::from(diff_s(&tt, &tcg)));
        }
        "tcb_minus_tdb" => {
            let tcb = epoch(Scale::Tcb, input)?;
            let tdb = lts::convert(tcb, Scale::Tdb).ok_or_else(out_of_span)?;
            out.insert("seconds".into(), Value::from(diff_s(&tdb, &tcb)));
        }
        "tcb_minus_tcl" => {
            let tcb = epoch(Scale::Tcb, input)?;
            let (d, _) = lts::tcb_tcl(tcb.jd()).ok_or_else(out_of_span)?;
            out.insert("seconds".into(), Value::from(d));
        }
        "tcl_mean_rate" => {
            let l = lts::mean_rate(
                lts::RateBody::Moon,
                num(input, "from_jd_tdb")?,
                num(input, "to_jd_tdb")?,
                1.0,
            )
            .ok_or_else(out_of_span)?;
            out.insert("l_tcb".into(), Value::from(l));
            out.insert(
                "dtcl_dtdb_minus_1".into(),
                Value::from((1.0 - l) / (1.0 - lts::L_B) - 1.0),
            );
        }
        "lunar_surface_rate" => {
            let b = crate::lunar_time::lunar_rate_breakdown(num(input, "t_tt_jc")?);
            out.insert("us_per_day".into(), Value::from(b.total_us_per_day));
        }
        "scale_tag" => {
            let tag = input
                .get("tag")
                .and_then(Value::as_str)
                .ok_or_else(|| crate::terr!("e-lunar-time-vectors-missing-input", key = "tag"))?;
            let def = scale_tag_definition(tag);
            out.insert("defined".into(), Value::Bool(def.is_some()));
            out.insert("defined_by".into(), Value::from(def.unwrap_or("")));
        }
        // The UTC side (leap seconds, TAI, TT) is the time-scale vector runner's.
        other => return crate::time_vectors::evaluate(other, input),
    }
    Ok(out)
}

fn matches(want: &Value, got: &Value, tol: f64) -> bool {
    match (want, got) {
        (Value::Number(a), Value::Number(b)) => match (a.as_f64(), b.as_f64()) {
            (Some(x), Some(y)) => (x - y).abs() <= tol.max(0.0),
            _ => false,
        },
        _ => want == got,
    }
}

/// Run one vector object. A vector without a source URL, with an unknown status, or provisional
/// without a reason, fails before it is run.
pub fn run_vector(file: &str, v: &Value) -> Outcome {
    let s = |k: &str| v[k].as_str().unwrap_or("").to_string();
    let status = s("status");
    let mk = |pass: bool, detail: String| Outcome {
        file: file.to_string(),
        id: s("id"),
        op: s("op"),
        status: status.clone(),
        source: v["source"]["title"].as_str().unwrap_or("").to_string(),
        pass,
        detail,
    };
    if v["source"]["url"].as_str().is_none_or(str::is_empty)
        || v["source"]["title"].as_str().is_none_or(str::is_empty)
    {
        return mk(false, crate::terr!("e-lunar-time-vectors-no-source"));
    }
    if !STATUSES.contains(&status.as_str()) {
        return mk(
            false,
            crate::terr!("e-lunar-time-vectors-bad-status", status = status.clone()),
        );
    }
    if status != "defined" && v["status_reason"].as_str().is_none_or(str::is_empty) {
        return mk(false, crate::terr!("e-lunar-time-vectors-no-reason"));
    }
    let empty = Map::new();
    let input = v["input"].as_object().unwrap_or(&empty);
    let Some(expect) = v["expect"].as_object() else {
        return mk(false, crate::terr!("e-lunar-time-vectors-no-expect"));
    };
    let tol = v["tolerance"].as_f64().unwrap_or(1e-9);
    match evaluate(&s("op"), input) {
        Err(e) => mk(false, e),
        Ok(got) => {
            let mut diffs = Vec::new();
            for (k, w) in expect {
                match got.get(k) {
                    Some(g) if matches(w, g, tol) => {}
                    Some(g) => diffs.push(format!("{k}: {w} != {g}")),
                    None => diffs.push(format!("{k}: {w} != -")),
                }
            }
            mk(diffs.is_empty(), diffs.join("; "))
        }
    }
}

/// Run every vector of one file's text.
pub fn run_file(name: &str, text: &str) -> Result<Vec<Outcome>, String> {
    let doc: Value = serde_json::from_str(text).map_err(|e| format!("{name}: {e}"))?;
    let bad = || {
        crate::terr!(
            "e-lunar-time-vectors-bad-format",
            file = name,
            format = FORMAT
        )
    };
    if doc["format"].as_str() != Some(FORMAT) {
        return Err(bad());
    }
    let vectors = doc["vectors"].as_array().ok_or_else(bad)?;
    Ok(vectors.iter().map(|v| run_vector(name, v)).collect())
}

/// Run the built-in vector set.
pub fn run_builtin() -> Result<Vec<Outcome>, String> {
    let mut out = Vec::new();
    for (name, text) in BUILTIN {
        out.extend(run_file(name, text)?);
    }
    Ok(out)
}

/// The pass/fail table: one row per vector with its status, then a summary line.
pub fn table(outcomes: &[Outcome]) -> String {
    let wid = outcomes
        .iter()
        .map(|o| o.id.len())
        .max()
        .unwrap_or(2)
        .max(2);
    let wst = outcomes
        .iter()
        .map(|o| o.status.len())
        .max()
        .unwrap_or(6)
        .max(6);
    let mut s = format!("{:<wid$}  {:<wst$}  {}\n", "id", "status", "result");
    for o in outcomes {
        let r = if o.pass { "PASS" } else { "FAIL" };
        s.push_str(&format!("{:<wid$}  {:<wst$}  {r}", o.id, o.status));
        if !o.pass {
            s.push_str("  ");
            s.push_str(&o.detail);
        }
        s.push('\n');
    }
    let passed = outcomes.iter().filter(|o| o.pass).count();
    let provisional = outcomes
        .iter()
        .filter(|o| o.status == "provisional")
        .count();
    s.push_str(&crate::t!(
        "lunar-time-vectors-summary",
        n = outcomes.len(),
        passed = passed,
        failed = outcomes.len() - passed,
        provisional = provisional
    ));
    s.push('\n');
    s
}

/// `kshana lunar-time-vectors [--json] [<file|dir> ...]`. Exit 0 when every vector passes, 1 when
/// one fails, 2 on a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", crate::t!("lunar-time-vectors-usage"));
        return 0;
    }
    if args.iter().any(|a| a.starts_with("--") && a != "--json") {
        eprintln!("{}", crate::t!("lunar-time-vectors-usage"));
        return 2;
    }
    let json = args.iter().any(|a| a == "--json");
    let paths: Vec<&String> = args.iter().filter(|a| !a.starts_with("--")).collect();
    let run = || -> Result<Vec<Outcome>, String> {
        if paths.is_empty() {
            return run_builtin();
        }
        let mut files = Vec::new();
        for p in &paths {
            let path = std::path::Path::new(p.as_str());
            if path.is_dir() {
                let mut v: Vec<_> = std::fs::read_dir(path)
                    .map_err(|e| format!("{p}: {e}"))?
                    .filter_map(|e| e.ok().map(|e| e.path()))
                    .filter(|f| f.extension().is_some_and(|x| x == "json"))
                    .collect();
                v.sort();
                files.extend(v);
            } else {
                files.push(path.to_path_buf());
            }
        }
        let mut out = Vec::new();
        for f in files {
            let name = f.display().to_string();
            let text = std::fs::read_to_string(&f).map_err(|e| format!("{name}: {e}"))?;
            out.extend(run_file(&name, &text)?);
        }
        Ok(out)
    };
    let outcomes = match run() {
        Ok(o) => o,
        Err(e) => {
            eprintln!("{e}");
            return 2;
        }
    };
    if json {
        let v = serde_json::json!({
            "format": "kshana.lunar-time-vectors-result/1",
            "label": "MODELLED",
            "outcomes": outcomes,
        });
        println!("{}", serde_json::to_string_pretty(&v).unwrap_or_default());
    } else {
        print!("{}", table(&outcomes));
    }
    i32::from(!outcomes.iter().all(|o| o.pass))
}
