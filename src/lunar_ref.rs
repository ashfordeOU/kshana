// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana lunar-ref`: the lunar time scales ([`crate::lunar_timescale`]), the named lunar frames
//! with ILuRF ([`crate::lunar_frames`]), the terminology registry and the geodetic-model
//! provenance manifest (`data/lunar/terminology.json`, `data/lunar/geodetic-models.json`).
//! JSON to standard output or `--out`; exit 2 on a usage or input error, 1 when `models --check`
//! finds a file that does not match its manifest entry. See `docs/LUNAR-REF.md`.

use crate::lunar_frames::{self, Frame};
use crate::lunar_timescale::{self as ts, Epoch, Scale};
use serde_json::Value;

/// The terminology registry, embedded.
pub const TERMINOLOGY: &str = include_str!("../data/lunar/terminology.json");
/// The geodetic-model provenance manifest, embedded.
pub const GEODETIC_MODELS: &str = include_str!("../data/lunar/geodetic-models.json");

/// One manifest file check.
#[derive(Clone, Debug, serde::Serialize)]
pub struct FileCheck {
    /// Model id.
    pub id: String,
    /// File.
    pub file: String,
    /// Whether the file's SHA-256 matches.
    pub ok: bool,
    /// The SHA-256 found (empty when the file could not be read).
    pub found: String,
}

/// Check every manifest file under `root` against its SHA-256.
pub fn check_models(root: &std::path::Path) -> Vec<FileCheck> {
    let v: Value = serde_json::from_str(GEODETIC_MODELS).unwrap_or(Value::Null);
    let mut out = Vec::new();
    for m in v["models"].as_array().into_iter().flatten() {
        let (Some(f), Some(want)) = (m["file"].as_str(), m["sha256"].as_str()) else {
            continue;
        };
        let found = std::fs::read(root.join(f))
            .map(|b| crate::advanced_report::sha256_hex(&b))
            .unwrap_or_default();
        out.push(FileCheck {
            id: m["id"].as_str().unwrap_or_default().to_string(),
            file: f.to_string(),
            ok: found == want,
            found,
        });
    }
    out
}

/// Run the command; returns the exit code.
pub fn run_cli(args: &[String]) -> i32 {
    match run(args) {
        Ok(code) => code,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn opts(args: &[String], known: &[&str]) -> Result<Vec<(String, String)>, String> {
    let mut out = Vec::new();
    let mut it = args.iter();
    while let Some(a) = it.next() {
        if a == "--check" {
            out.push((a.clone(), String::new()));
            continue;
        }
        if !known.contains(&a.as_str()) {
            return Err(crate::terr!("e-lunar-ref-unknown-option", option = a));
        }
        let v = it
            .next()
            .ok_or_else(|| crate::terr!("e-lunar-ref-missing-value", option = a))?;
        out.push((a.clone(), v.clone()));
    }
    Ok(out)
}

fn get<'a>(o: &'a [(String, String)], k: &str) -> Option<&'a str> {
    o.iter().rev().find(|p| p.0 == k).map(|p| p.1.as_str())
}

fn num(o: &[(String, String)], k: &str) -> Result<Option<f64>, String> {
    get(o, k)
        .map(|v| {
            v.parse::<f64>()
                .ok()
                .filter(|x| x.is_finite())
                .ok_or_else(|| crate::terr!("e-lunar-ref-bad-number", option = k, value = v))
        })
        .transpose()
}

fn pair(o: &[(String, String)], k: &str, n: usize) -> Result<Option<Vec<f64>>, String> {
    get(o, k)
        .map(|v| {
            let p: Result<Vec<f64>, _> = v.split(',').map(|x| x.trim().parse::<f64>()).collect();
            match p {
                Ok(p) if p.len() == n && p.iter().all(|x| x.is_finite()) => Ok(p),
                _ => Err(crate::terr!(
                    "e-lunar-ref-bad-number",
                    option = k,
                    value = v
                )),
            }
        })
        .transpose()
}

fn unknown(name: &str, known: &[&str]) -> String {
    crate::terr!(
        "e-lunar-ref-unknown-name",
        name = name,
        known = known.join(", ")
    )
}

fn emit(v: &impl serde::Serialize, out: Option<&str>) -> Result<i32, String> {
    let text = serde_json::to_string_pretty(v).map_err(|e| e.to_string())?;
    match out {
        Some(p) => std::fs::write(p, text + "\n")
            .map_err(|e| crate::terr!("e-lunar-ref-cannot-write", path = p, e = e))?,
        None => println!("{text}"),
    }
    Ok(0)
}

const J2025: f64 = 2_460_676.5;

fn run(args: &[String]) -> Result<i32, String> {
    let Some(sub) = args.first() else {
        return Err(crate::t!("lunar-ref-usage"));
    };
    if sub == "--help" || sub == "-h" || args.iter().any(|a| a == "--help") {
        println!("{}", crate::t!("lunar-ref-usage"));
        return Ok(0);
    }
    let rest = &args[1..];
    let span = || crate::terr!("e-lunar-ref-out-of-span");
    match sub.as_str() {
        "tcb-tcl" => {
            let o = opts(rest, &["--jd", "--window", "--out"])?;
            let jd = num(&o, "--jd")?.unwrap_or(J2025);
            let w = pair(&o, "--window", 2)?.unwrap_or(vec![2_456_658.5, 2_462_867.5]);
            let r = ts::report(jd, [w[0], w[1]]).ok_or_else(span)?;
            emit(&r, get(&o, "--out"))
        }
        "approx" => {
            let o = opts(rest, &["--window", "--grid-days", "--out"])?;
            let w = pair(&o, "--window", 2)?.unwrap_or(vec![2_456_658.5, 2_462_867.5]);
            let g = num(&o, "--grid-days")?.unwrap_or(1.0);
            if g <= 0.0 || g.is_nan() || (w[1] - w[0]) / g > 200_000.0 || w[1] <= w[0] {
                return Err(crate::terr!(
                    "e-lunar-ref-bad-number",
                    option = "--grid-days",
                    value = g
                ));
            }
            let a = ts::fit_approx(w[0], w[1], g).ok_or_else(span)?;
            emit(&a, get(&o, "--out"))
        }
        "convert" => {
            let o = opts(rest, &["--from", "--to", "--jd", "--out"])?;
            let names = ["tt", "tdb", "tcb", "tcg", "tcl", "ltc"];
            let scale = |k: &str| -> Result<Scale, String> {
                let v = get(&o, k).unwrap_or("tt");
                Scale::parse(v).ok_or_else(|| unknown(v, &names))
            };
            let (from, to) = (scale("--from")?, scale("--to")?);
            let jd = num(&o, "--jd")?.unwrap_or(J2025);
            let e = ts::convert(Epoch::from_jd(from, jd), to).ok_or_else(span)?;
            emit(
                &serde_json::json!({
                    "schema": "kshana.lunar-time-convert/1",
                    "label": ts::LABEL,
                    "input": Epoch::from_jd(from, jd),
                    "output": e,
                }),
                get(&o, "--out"),
            )
        }
        "transform" => {
            let o = opts(rest, &["--from", "--to", "--xyz", "--jd", "--out"])?;
            let names: Vec<&str> = lunar_frames::FRAMES.iter().map(|f| f.name()).collect();
            let frame = |k: &str| -> Result<Frame, String> {
                let v = get(&o, k).unwrap_or("MOON_ME");
                Frame::parse(v).ok_or_else(|| unknown(v, &names))
            };
            let (from, to) = (frame("--from")?, frame("--to")?);
            let p = pair(&o, "--xyz", 3)?.unwrap_or(vec![1_737_400.0, 0.0, 0.0]);
            let jd = num(&o, "--jd")?.unwrap_or(J2025);
            let t = lunar_frames::transform(
                from,
                to,
                [p[0], p[1], p[2]],
                jd,
                &lunar_frames::PLACEHOLDER,
            )?;
            emit(&t, get(&o, "--out"))
        }
        "terms" => {
            let o = opts(rest, &["--out"])?;
            let v: Value = serde_json::from_str(TERMINOLOGY).map_err(|e| e.to_string())?;
            emit(&v, get(&o, "--out"))
        }
        "models" => {
            let o = opts(rest, &["--root", "--out"])?;
            let mut v: Value = serde_json::from_str(GEODETIC_MODELS).map_err(|e| e.to_string())?;
            if o.iter().any(|p| p.0 == "--check") {
                let root = std::path::PathBuf::from(get(&o, "--root").unwrap_or("."));
                let checks = check_models(&root);
                let bad = checks.iter().any(|c| !c.ok);
                v["checks"] = serde_json::to_value(&checks).map_err(|e| e.to_string())?;
                emit(&v, get(&o, "--out"))?;
                return Ok(if bad { 1 } else { 0 });
            }
            emit(&v, get(&o, "--out"))
        }
        _ => Err(crate::t!("lunar-ref-usage")),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_manifest_files_match_and_its_modules_exist() {
        let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
        let checks = check_models(root);
        assert_eq!(checks.len(), 2);
        assert!(checks.iter().all(|c| c.ok), "{checks:?}");
        for doc in [GEODETIC_MODELS, TERMINOLOGY] {
            let v: Value = serde_json::from_str(doc).unwrap();
            let list = v["models"].as_array().or(v["terms"].as_array()).unwrap();
            for m in list {
                for u in m["used_by"].as_array().unwrap() {
                    let p = root.join(u.as_str().unwrap());
                    assert!(p.exists(), "{}", p.display());
                }
                assert!(m["source"].as_str().is_some_and(|s| !s.is_empty()));
            }
        }
    }

    #[test]
    fn every_registered_frame_and_scale_is_in_the_terminology() {
        let v: Value = serde_json::from_str(TERMINOLOGY).unwrap();
        let terms: Vec<String> = v["terms"]
            .as_array()
            .unwrap()
            .iter()
            .map(|t| t["term"].as_str().unwrap().to_ascii_uppercase())
            .collect();
        for want in [
            "TCB", "TCG", "TT", "TDB", "TCL", "LTC", "MOON_ME", "MOON_PA", "ILURF",
        ] {
            assert!(terms.iter().any(|t| t == want), "{want}");
        }
    }
}
