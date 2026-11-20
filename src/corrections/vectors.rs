// SPDX-License-Identifier: AGPL-3.0-only
//! Runner for the correction-decoder test vectors (`kshana.correction-vectors/1`,
//! `docs/CORRECTION-DECODERS.md`).
//!
//! A vector names a decoder, gives its input frames in hexadecimal and the part of the
//! decoder's JSON report it expects. Objects in `expect` are matched as subsets (the report may
//! hold more keys), arrays element by element with equal length, numbers within `tolerance`
//! (default `1e-9`), everything else exactly. The vector files are embedded in the binary.

use serde_json::{Map, Value};

/// The format tag every vector file carries.
pub const FORMAT: &str = "kshana.correction-vectors/1";

/// The vector files shipped with kshana, as (file name, text).
pub const BUILTIN: &[(&str, &str)] = &[
    (
        "has.json",
        include_str!("../../data/conformance/corrections/has.json"),
    ),
    (
        "b2b.json",
        include_str!("../../data/conformance/corrections/b2b.json"),
    ),
    (
        "l6.json",
        include_str!("../../data/conformance/corrections/l6.json"),
    ),
];

/// The outcome of one vector.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct Outcome {
    /// The file the vector came from.
    pub file: String,
    /// The vector's id.
    pub id: String,
    /// The decoder.
    pub decoder: String,
    /// Whether everything expected matched.
    pub pass: bool,
    /// For a failure, the first difference (`path: want != got`) or the error.
    pub detail: String,
}

/// Compare `want` (a subset) with `got`; `Err` names the first difference.
pub fn matches(want: &Value, got: &Value, tol: f64, path: &str) -> Result<(), String> {
    match (want, got) {
        (Value::Object(w), Value::Object(g)) => {
            for (k, wv) in w {
                let p = format!("{path}.{k}");
                let gv = g.get(k).ok_or_else(|| format!("{p}: missing"))?;
                matches(wv, gv, tol, &p)?;
            }
            Ok(())
        }
        (Value::Array(w), Value::Array(g)) => {
            if w.len() != g.len() {
                return Err(format!("{path}: {} items != {}", w.len(), g.len()));
            }
            for (i, (wv, gv)) in w.iter().zip(g).enumerate() {
                matches(wv, gv, tol, &format!("{path}[{i}]"))?;
            }
            Ok(())
        }
        (Value::Number(a), Value::Number(b)) => {
            let (x, y) = (
                a.as_f64().unwrap_or(f64::NAN),
                b.as_f64().unwrap_or(f64::NAN),
            );
            if (x - y).abs() <= tol {
                Ok(())
            } else {
                Err(format!("{path}: {x} != {y}"))
            }
        }
        _ if want == got => Ok(()),
        _ => Err(format!("{path}: {want} != {got}")),
    }
}

fn run_vector(file: &str, v: &Map<String, Value>) -> Outcome {
    let id = v
        .get("id")
        .and_then(Value::as_str)
        .unwrap_or("")
        .to_string();
    let decoder = v
        .get("decoder")
        .and_then(Value::as_str)
        .unwrap_or("")
        .to_string();
    let tol = v.get("tolerance").and_then(Value::as_f64).unwrap_or(1e-9);
    let result = (|| {
        let frames: Vec<super::Frame> = v
            .get("frames")
            .and_then(Value::as_array)
            .ok_or_else(|| crate::terr!("e-corrections-bad-vector", id = id))?
            .iter()
            .map(|f| {
                f.as_str()
                    .and_then(super::parse_hex)
                    .ok_or_else(|| crate::terr!("e-corrections-bad-vector", id = id))
            })
            .collect::<Result<_, _>>()?;
        let want = v
            .get("expect")
            .ok_or_else(|| crate::terr!("e-corrections-bad-vector", id = id))?;
        let got = super::decode(&decoder, &frames)?;
        matches(want, &got, tol, "$")
    })();
    Outcome {
        file: file.to_string(),
        id,
        decoder,
        pass: result.is_ok(),
        detail: result.err().unwrap_or_default(),
    }
}

/// Run every vector of one file.
pub fn run_file(name: &str, text: &str) -> Result<Vec<Outcome>, String> {
    let doc: Value = serde_json::from_str(text).map_err(|e| format!("{name}: {e}"))?;
    let bad = || crate::terr!("e-corrections-bad-file", file = name, format = FORMAT);
    if doc.get("format").and_then(Value::as_str) != Some(FORMAT) {
        return Err(bad());
    }
    let vs = doc
        .get("vectors")
        .and_then(Value::as_array)
        .ok_or_else(bad)?;
    Ok(vs
        .iter()
        .map(|v| match v.as_object() {
            Some(o) => run_vector(name, o),
            None => Outcome {
                file: name.to_string(),
                id: String::new(),
                decoder: String::new(),
                pass: false,
                detail: bad(),
            },
        })
        .collect())
}

/// Run the built-in vectors.
pub fn run_builtin() -> Result<Vec<Outcome>, String> {
    let mut out = Vec::new();
    for (name, text) in BUILTIN {
        out.extend(run_file(name, text)?);
    }
    Ok(out)
}

/// The pass/fail table.
pub fn table(outcomes: &[Outcome]) -> String {
    let wid = outcomes
        .iter()
        .map(|o| o.id.len())
        .max()
        .unwrap_or(2)
        .max(2);
    let mut s = String::new();
    for o in outcomes {
        let r = if o.pass { "PASS" } else { "FAIL" };
        s.push_str(&format!("{:<wid$}  {:<4}  {r}", o.id, o.decoder));
        if !o.pass {
            s.push_str("  ");
            s.push_str(&o.detail);
        }
        s.push('\n');
    }
    let passed = outcomes.iter().filter(|o| o.pass).count();
    s.push_str(&crate::t!(
        "corrections-summary",
        n = outcomes.len(),
        passed = passed,
        failed = outcomes.len() - passed
    ));
    s.push('\n');
    s
}

/// `kshana corrections vectors [--json] [<file|dir>...]`.
pub fn run_cli(args: &[String]) -> Result<bool, String> {
    if args.iter().any(|a| a.starts_with("--") && a != "--json") {
        return Err(crate::t!("corrections-usage"));
    }
    let json = args.iter().any(|a| a == "--json");
    let paths: Vec<&String> = args.iter().filter(|a| !a.starts_with("--")).collect();
    let outcomes = if paths.is_empty() {
        run_builtin()?
    } else {
        let mut files = Vec::new();
        for p in paths {
            let path = std::path::Path::new(p);
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
        out
    };
    if json {
        println!(
            "{}",
            serde_json::to_string_pretty(&outcomes).map_err(|e| e.to_string())?
        );
    } else {
        print!("{}", table(&outcomes));
    }
    Ok(outcomes.iter().all(|o| o.pass))
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn subset_matching() {
        let got = json!({"a": 1.0, "b": [1, {"c": null, "d": 2}], "e": "x"});
        assert!(matches(&json!({"b": [1, {"c": null}]}), &got, 1e-9, "$").is_ok());
        assert!(matches(&json!({"a": 1.0000000001}), &got, 1e-9, "$").is_ok());
        assert!(matches(&json!({"b": [1]}), &got, 1e-9, "$").is_err());
        assert!(matches(&json!({"z": 1}), &got, 1e-9, "$").is_err());
        assert!(matches(&json!({"e": "y"}), &got, 1e-9, "$").is_err());
    }

    #[test]
    fn every_builtin_vector_passes() {
        let out = run_builtin().unwrap();
        let failed: Vec<_> = out.iter().filter(|o| !o.pass).collect();
        assert!(failed.is_empty(), "{}", table(&out));
        assert!(out.len() >= 20, "{} vectors", out.len());
    }
}
