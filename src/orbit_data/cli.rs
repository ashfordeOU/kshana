// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana orbit-data ...`: the command line of [`crate::orbit_data`] (docs/ORBIT-DATA.md).
//! Every subcommand reads local files and prints to standard output; nothing is written to disk.
//!
//! Exit status: 0 when the result is clean (valid, nothing flagged, positive definite), 1 when it
//! is not, 2 on a usage or input error.

use super::covariance::{self, Cov6, Prediction};
use super::ephem::Profile;
use super::gp_quality::{self, AuditOpts, CompareOpts};
use super::{cdm, convert, ephem, Report};
use serde_json::{json, Value};
use std::collections::BTreeMap;

fn usage() -> String {
    crate::t!("orbit-data-usage")
}

fn read(path: &str) -> Result<String, String> {
    std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))
}

/// The message type of a CCSDS file: `CDM`, `OEM` or `OCM`, from the first keyword (KVN) or the
/// root element (XML).
pub fn detect(text: &str) -> Option<&'static str> {
    let t = text.trim_start_matches('\u{feff}').trim_start();
    if t.starts_with('<') {
        for (tag, kind) in [("<cdm", "CDM"), ("<oem", "OEM"), ("<ocm", "OCM")] {
            if t.contains(tag) {
                return Some(kind);
            }
        }
        return None;
    }
    let first = t
        .lines()
        .map(str::trim)
        .find(|l| !l.is_empty() && !l.starts_with("COMMENT"))?;
    let key = first.split('=').next()?.trim();
    match key {
        "CCSDS_CDM_VERS" => Some("CDM"),
        "CCSDS_OEM_VERS" => Some("OEM"),
        "CCSDS_OCM_VERS" => Some("OCM"),
        _ => None,
    }
}

/// Options shared by the subcommands: flags with a value, bare flags, and positionals.
struct Args {
    vals: BTreeMap<String, String>,
    flags: Vec<String>,
    pos: Vec<String>,
}

fn parse_args(args: &[String], with_value: &[&str], bare: &[&str]) -> Result<Args, String> {
    let mut a = Args {
        vals: BTreeMap::new(),
        flags: Vec::new(),
        pos: Vec::new(),
    };
    let mut i = 0;
    while i < args.len() {
        let x = &args[i];
        if with_value.contains(&x.as_str()) {
            let v = args.get(i + 1).ok_or_else(usage)?;
            a.vals.insert(x.clone(), v.clone());
            i += 2;
        } else if bare.contains(&x.as_str()) {
            a.flags.push(x.clone());
            i += 1;
        } else if x.starts_with("--") {
            return Err(usage());
        } else {
            a.pos.push(x.clone());
            i += 1;
        }
    }
    Ok(a)
}

impl Args {
    fn num(&self, k: &str, default: f64) -> Result<f64, String> {
        match self.vals.get(k) {
            None => Ok(default),
            Some(v) => v
                .parse::<f64>()
                .ok()
                .filter(|x| x.is_finite())
                .ok_or_else(|| crate::terr!("e-orbit-data-bad-flag", flag = k, value = v.as_str())),
        }
    }
    fn opt_num(&self, k: &str) -> Result<Option<f64>, String> {
        self.vals.get(k).map(|_| self.num(k, 0.0)).transpose()
    }
    fn json(&self) -> bool {
        self.flags.iter().any(|f| f == "--json")
    }
}

fn aliases(a: &Args) -> Result<BTreeMap<String, String>, String> {
    match a.vals.get("--aliases") {
        None => Ok(BTreeMap::new()),
        Some(p) => cdm::parse_aliases(&read(p)?).map_err(|e| format!("{p}: {e}")),
    }
}

fn print_report(rep: &Report, json: bool) -> Result<u8, String> {
    if json {
        println!(
            "{}",
            serde_json::to_string_pretty(rep).map_err(|e| e.to_string())?
        );
    } else {
        print!("{}", rep.to_text());
    }
    Ok(u8::from(!rep.valid))
}

fn check(args: &[String]) -> Result<u8, String> {
    let a = parse_args(
        args,
        &["--aliases", "--min-span-days", "--max-gap-s"],
        &["--json"],
    )?;
    let [path] = a.pos.as_slice() else {
        return Err(usage());
    };
    let text = read(path)?;
    let profile = Profile {
        min_span_days: a.opt_num("--min-span-days")?,
        max_gap_s: a.opt_num("--max-gap-s")?,
    };
    let rep = match detect(&text) {
        Some("CDM") => cdm::validate(&text, &aliases(&a)?).1,
        Some("OEM") if !text.trim_start().starts_with('<') => ephem::check_oem(&text, profile).1,
        Some("OCM") => ephem::check_ocm(&text, profile),
        _ => {
            return Err(crate::terr!(
                "e-orbit-data-unknown-message",
                path = path.as_str()
            ))
        }
    };
    print_report(&rep, a.json())
}

fn convert_cmd(args: &[String]) -> Result<u8, String> {
    let a = parse_args(args, &["--to", "--aliases"], &[])?;
    let [path] = a.pos.as_slice() else {
        return Err(usage());
    };
    let text = read(path)?;
    let to = a.vals.get("--to").map(String::as_str).ok_or_else(usage)?;
    let out = match (detect(&text), to) {
        (Some("OEM"), "ocm") => convert::oem_to_ocm(&text)?,
        (Some("OCM"), "oem") => convert::ocm_to_oem(&text)?,
        (Some("CDM"), "cdm") => {
            let (m, rep) = cdm::parse(&text, &aliases(&a)?);
            if rep
                .findings
                .iter()
                .any(|f| f.code == "parse" || f.code == "xml-root")
            {
                return Err(rep.to_text());
            }
            m.to_kvn()
        }
        _ => {
            return Err(crate::terr!(
                "e-orbit-data-convert-pair",
                path = path.as_str(),
                to = to
            ))
        }
    };
    print!("{out}");
    Ok(0)
}

fn gp_compare(args: &[String]) -> Result<u8, String> {
    let a = parse_args(
        args,
        &["--hours", "--step-min", "--threshold-km"],
        &["--json"],
    )?;
    let [pa, pb] = a.pos.as_slice() else {
        return Err(usage());
    };
    let d = CompareOpts::default();
    let o = CompareOpts {
        hours: a.num("--hours", d.hours)?,
        step_min: a.num("--step-min", d.step_min)?,
        threshold_km: a.num("--threshold-km", d.threshold_km)?,
    };
    if o.hours < 0.0 || o.step_min <= 0.0 || o.hours / o.step_min > 1e6 {
        return Err(usage());
    }
    let sa = gp_quality::read_sets(&read(pa)?);
    let sb = gp_quality::read_sets(&read(pb)?);
    let r = gp_quality::compare(&sa, &sb, o);
    if a.json() {
        println!(
            "{}",
            serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?
        );
    } else {
        print!("{}", r.to_text());
    }
    Ok(u8::from(r.flagged > 0))
}

fn gp_audit(args: &[String]) -> Result<u8, String> {
    let a = parse_args(args, &["--at", "--stale-days", "--jump-km"], &["--json"])?;
    if a.pos.is_empty() {
        return Err(usage());
    }
    let d = AuditOpts::default();
    let reference_days = match a.vals.get("--at") {
        None => None,
        Some(v) => Some(crate::norad::epoch_days_1950(v).map_err(|_| {
            crate::terr!("e-orbit-data-bad-flag", flag = "--at", value = v.as_str())
        })?),
    };
    let o = AuditOpts {
        reference_days,
        stale_days: a.num("--stale-days", d.stale_days)?,
        jump_km: a.num("--jump-km", d.jump_km)?,
    };
    let mut sets = Vec::new();
    for p in &a.pos {
        sets.extend(gp_quality::read_sets(&read(p)?));
    }
    let r = gp_quality::audit(&sets, o);
    if a.json() {
        println!(
            "{}",
            serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?
        );
    } else {
        print!("{}", r.to_text());
    }
    Ok(u8::from(
        r.findings
            .iter()
            .any(|f| f.severity == super::Severity::Error),
    ))
}

fn vec6(v: &Value, key: &str, scale: f64) -> Result<[f64; 6], String> {
    let arr = v
        .get(key)
        .and_then(Value::as_array)
        .filter(|a| a.len() == 6)
        .ok_or_else(|| crate::terr!("e-orbit-data-cov-input", key = key))?;
    let mut x = [0.0; 6];
    for (i, e) in arr.iter().enumerate() {
        x[i] = e
            .as_f64()
            .ok_or_else(|| crate::terr!("e-orbit-data-cov-input", key = key))?
            * scale;
    }
    Ok(x)
}

/// Read `cov_km` (6x6 rows) or `cov_ltm_km` (21 lower-triangular values), in km, km/s units, into
/// m, m/s.
fn cov6(v: &Value) -> Result<Cov6, String> {
    let bad = || crate::terr!("e-orbit-data-cov-input", key = "cov_km");
    let vals: Vec<f64> = if let Some(rows) = v.get("cov_km").and_then(Value::as_array) {
        let mut out = Vec::new();
        for r in rows {
            let r = r.as_array().filter(|r| r.len() == 6).ok_or_else(bad)?;
            for e in r {
                out.push(e.as_f64().ok_or_else(bad)?);
            }
        }
        if out.len() != 36 {
            return Err(bad());
        }
        out
    } else if let Some(l) = v.get("cov_ltm_km").and_then(Value::as_array) {
        let ltm: Vec<f64> = l.iter().filter_map(Value::as_f64).collect();
        if ltm.len() != 21 {
            return Err(bad());
        }
        super::matrix_from_ordering(&ltm, "LTM")
            .ok_or_else(bad)?
            .into_iter()
            .flatten()
            .collect()
    } else {
        return Err(bad());
    };
    let mut p = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            // km² -> m² etc.: every term scales by 1e6.
            p[i][j] = vals[i * 6 + j] * 1e6;
        }
    }
    Ok(p)
}

fn km(p: &Cov6) -> Vec<Vec<f64>> {
    p.iter()
        .map(|r| r.iter().map(|x| x * 1e-6).collect())
        .collect()
}

fn cov_cmd(args: &[String]) -> Result<u8, String> {
    let Some((sub, rest)) = args.split_first() else {
        return Err(usage());
    };
    let a = parse_args(
        rest,
        &["--dt-s", "--step-s", "--samples", "--seed", "--sigma-rtn"],
        &["--full"],
    )?;
    let [path] = a.pos.as_slice() else {
        return Err(usage());
    };
    let v: Value = serde_json::from_str(&read(path)?).map_err(|e| format!("{path}: {e}"))?;
    let step = a.num("--step-s", 10.0)?;
    if step <= 0.0 {
        return Err(usage());
    }
    let (out, code) = match sub.as_str() {
        "check" => {
            let x = vec6(&v, "state_km", 1e3)?;
            let p = cov6(&v)?;
            let rtn = v.get("frame").and_then(Value::as_str) == Some("RTN");
            let (inertial, in_rtn) = if rtn {
                (covariance::from_rtn(&x, &p), p)
            } else {
                (p, covariance::to_rtn(&x, &p))
            };
            let c1 = covariance::check(&inertial);
            let c2 = covariance::check(&in_rtn);
            let ok = c1.positive_definite && c2.positive_definite;
            (
                json!({"inertial": c1, "rtn": c2, "rtn_cov_km": km(&in_rtn), "inertial_cov_km": km(&inertial)}),
                u8::from(!ok),
            )
        }
        "propagate" | "monte-carlo" => {
            let x = vec6(&v, "state_km", 1e3)?;
            let p = cov6(&v)?;
            let dt = a.num("--dt-s", f64::NAN)?;
            if !dt.is_finite() || dt.abs() / step > 1e7 {
                return Err(usage());
            }
            if sub == "propagate" {
                let (x1, p1) = covariance::propagate(&x, &p, dt, step);
                let c = covariance::check(&p1);
                let pd = c.positive_definite;
                (
                    json!({
                        "dt_s": dt,
                        "state_km": x1.iter().map(|q| q * 1e-3).collect::<Vec<_>>(),
                        "cov_km": km(&p1),
                        "rtn_cov_km": km(&covariance::to_rtn(&x1, &p1)),
                        "check": c,
                        "model": "two-body + J2, RK4",
                        "evidence": "MODELLED",
                    }),
                    u8::from(!pd),
                )
            } else {
                let n = a.num("--samples", 500.0)?;
                let seed = a.num("--seed", 1.0)?;
                if !(10.0..=100_000.0).contains(&n) || seed < 0.0 {
                    return Err(usage());
                }
                let mc = covariance::monte_carlo(&x, &p, dt, step, n as usize, seed as u64)
                    .ok_or_else(|| crate::terr!("e-orbit-data-cov-not-pd"))?;
                (serde_json::to_value(&mc).map_err(|e| e.to_string())?, 0)
            }
        }
        "synthetic" => {
            let x = vec6(&v, "state_km", 1e3)?;
            let s = a.vals.get("--sigma-rtn").ok_or_else(usage)?;
            let sig: Vec<f64> = s.split(',').filter_map(|t| t.trim().parse().ok()).collect();
            let sig: [f64; 6] = sig.try_into().map_err(|_| {
                crate::terr!(
                    "e-orbit-data-bad-flag",
                    flag = "--sigma-rtn",
                    value = s.as_str()
                )
            })?;
            let p = covariance::synthetic(&x, &sig);
            (
                json!({"cov_km": km(&p), "sigma_rtn_m": sig, "evidence": "MODELLED"}),
                0,
            )
        }
        "realism" => {
            let list = v
                .get("predictions")
                .and_then(Value::as_array)
                .ok_or_else(|| crate::terr!("e-orbit-data-cov-input", key = "predictions"))?;
            let mut preds = Vec::new();
            for p in list {
                preds.push(Prediction {
                    predicted: vec6(p, "predicted_km", 1e3)?,
                    cov: cov6(p)?,
                    reference: vec6(p, "reference_km", 1e3)?,
                });
            }
            let full = a.flags.iter().any(|f| f == "--full");
            (
                serde_json::to_value(covariance::realism(&preds, !full))
                    .map_err(|e| e.to_string())?,
                0,
            )
        }
        _ => return Err(usage()),
    };
    println!(
        "{}",
        serde_json::to_string_pretty(&out).map_err(|e| e.to_string())?
    );
    Ok(code)
}

/// Run `kshana orbit-data <args>`; returns the exit status (0 clean, 1 findings) or an error.
pub fn run(args: &[String]) -> Result<u8, String> {
    let Some((cmd, rest)) = args.split_first() else {
        return Err(usage());
    };
    if rest.iter().any(|a| a == "--help" || a == "-h") || cmd == "--help" || cmd == "-h" {
        println!("{}", usage());
        return Ok(0);
    }
    match cmd.as_str() {
        "check" => check(rest),
        "convert" => convert_cmd(rest),
        "gp-compare" => gp_compare(rest),
        "gp-audit" => gp_audit(rest),
        "cov" => cov_cmd(rest),
        _ => Err(usage()),
    }
}
