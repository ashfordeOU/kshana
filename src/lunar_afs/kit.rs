// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana lunar-afs-kit`: the AFS receiver verification kit. Bit-true vectors
//! ([`super::vectors`]), the PRN and code allocation registry with its collision checker
//! ([`super::registry`]) and the real-time output message profile ([`crate::lunar_output`]).
//! JSON to standard output or `--out`. Exit 0 when everything checked passes, 1 when a vector
//! fails, a registry has an error or a message stream breaks the profile, 2 on a usage or input
//! error. See `docs/LUNAR-AFS-KIT.md`.

use super::{registry, vectors};
use crate::lunar_frames::Frame;
use crate::lunar_output;
use crate::lunar_timescale::Scale;

/// Run the command; returns the exit code.
pub fn run_cli(args: &[String]) -> i32 {
    match run(args) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

struct Opts {
    pos: Vec<String>,
    kv: Vec<(String, String)>,
    flags: Vec<String>,
}

fn opts(args: &[String], known: &[&str], flags: &[&str]) -> Result<Opts, String> {
    let mut o = Opts {
        pos: Vec::new(),
        kv: Vec::new(),
        flags: Vec::new(),
    };
    let mut it = args.iter();
    while let Some(a) = it.next() {
        if flags.contains(&a.as_str()) {
            o.flags.push(a.clone());
        } else if known.contains(&a.as_str()) {
            let v = it
                .next()
                .ok_or_else(|| crate::terr!("e-lunar-afs-kit-missing-value", option = a))?;
            o.kv.push((a.clone(), v.clone()));
        } else if a.starts_with("--") {
            return Err(crate::terr!("e-lunar-afs-kit-unknown-option", option = a));
        } else {
            o.pos.push(a.clone());
        }
    }
    Ok(o)
}

impl Opts {
    fn get(&self, k: &str) -> Option<&str> {
        self.kv
            .iter()
            .rev()
            .find(|p| p.0 == k)
            .map(|p| p.1.as_str())
    }
    fn num(&self, k: &str) -> Result<Option<f64>, String> {
        self.get(k)
            .map(|v| {
                v.parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite())
                    .ok_or_else(|| {
                        crate::terr!("e-lunar-afs-kit-bad-number", option = k, value = v)
                    })
            })
            .transpose()
    }
}

fn read(p: &str) -> Result<String, String> {
    std::fs::read_to_string(p)
        .map_err(|e| crate::terr!("e-lunar-afs-kit-cannot-read", path = p, e = e))
}

fn emit_text(text: String, out: Option<&str>) -> Result<(), String> {
    match out {
        Some(p) => std::fs::write(p, text)
            .map_err(|e| crate::terr!("e-lunar-afs-kit-cannot-write", path = p, e = e)),
        None => {
            print!("{text}");
            Ok(())
        }
    }
}

fn emit(v: &impl serde::Serialize, out: Option<&str>) -> Result<(), String> {
    emit_text(
        serde_json::to_string_pretty(v).map_err(|e| e.to_string())? + "\n",
        out,
    )
}

fn run(args: &[String]) -> Result<i32, String> {
    let Some(sub) = args.first() else {
        return Err(crate::t!("lunar-afs-kit-usage"));
    };
    if sub == "--help" || sub == "-h" || args.iter().any(|a| a == "--help") {
        println!("{}", crate::t!("lunar-afs-kit-usage"));
        return Ok(0);
    }
    let rest = &args[1..];
    match sub.as_str() {
        "vectors" => {
            let o = opts(rest, &["--out"], &[])?;
            let text = match o.pos.first() {
                Some(p) => read(p)?,
                None => vectors::BUILTIN.to_string(),
            };
            let r = vectors::run(&text)?;
            emit(&r, o.get("--out"))?;
            Ok(i32::from(!r.failures.is_empty()))
        }
        "registry" => {
            let o = opts(rest, &["--limit-db", "--out"], &["--no-correlation"])?;
            let reg = match o.pos.first() {
                Some(p) => registry::Registry::parse(&read(p)?)?,
                None => registry::Registry::interim(),
            };
            let r = registry::check(
                &reg,
                o.num("--limit-db")?.unwrap_or(-20.0),
                !o.flags.iter().any(|f| f == "--no-correlation"),
            );
            emit(&r, o.get("--out"))?;
            Ok(i32::from(!r.valid))
        }
        "output-check" => {
            let o = opts(rest, &["--out"], &[])?;
            let [p] = o.pos.as_slice() else {
                return Err(crate::t!("lunar-afs-kit-usage"));
            };
            let r = lunar_output::check(&read(p)?);
            emit(&r, o.get("--out"))?;
            Ok(i32::from(!r.valid))
        }
        "output-example" => {
            let o = opts(rest, &["--n", "--jd", "--out"], &[])?;
            let n = o.num("--n")?.unwrap_or(10.0);
            if !(1.0..=100_000.0).contains(&n) {
                return Err(crate::terr!(
                    "e-lunar-afs-kit-bad-number",
                    option = "--n",
                    value = n
                ));
            }
            let jd = o.num("--jd")?.unwrap_or(2_460_676.5);
            emit_text(lunar_output::example(n as usize, jd), o.get("--out"))?;
            Ok(0)
        }
        "output-reexpress" => {
            let o = opts(rest, &["--scale", "--frame", "--out"], &[])?;
            let [p] = o.pos.as_slice() else {
                return Err(crate::t!("lunar-afs-kit-usage"));
            };
            let sname = o.get("--scale").unwrap_or("tt");
            let scale = Scale::parse(sname).ok_or_else(|| {
                crate::terr!(
                    "e-lunar-afs-kit-unknown-name",
                    name = sname,
                    known = "tt, tdb, tcb, tcg, tcl, ltc"
                )
            })?;
            let fname = o.get("--frame").unwrap_or("ICRF");
            let frame = Frame::parse(fname).ok_or_else(|| {
                crate::terr!(
                    "e-lunar-afs-kit-unknown-name",
                    name = fname,
                    known = "ICRF, MOON_PA_DE440, MOON_PA, MOON_ME, ILURF"
                )
            })?;
            let mut out = String::new();
            for l in read(p)?.lines().filter(|l| !l.trim().is_empty()) {
                let v: serde_json::Value = serde_json::from_str(l)
                    .map_err(|_| crate::terr!("e-lunar-afs-kit-bad-message"))?;
                out.push_str(&lunar_output::reexpress(&v, scale, frame)?.to_string());
                out.push('\n');
            }
            emit_text(out, o.get("--out"))?;
            Ok(0)
        }
        _ => Err(crate::t!("lunar-afs-kit-usage")),
    }
}
