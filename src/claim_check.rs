// SPDX-License-Identifier: AGPL-3.0-only
//! Constellation-claim verification datasets: public claims about a navigation constellation,
//! each with its source, checked where kshana can compute the same quantity.
//!
//! A dataset (`kshana.claims/1`, JSON) is a list of claims. Every claim names its subject, the
//! claim in words, the value (a number or a `[low, high]` range) and unit, and its evidence: the
//! source URL (`https`), the date the source was read, a short verbatim quote and where in the
//! source it stands. **A claim without all four is refused**: it is listed with verdict `refused`
//! and never checked, so nothing unsourced reaches a verdict.
//!
//! A claim may carry a check. The kinds:
//!
//! | `check.kind` | what kshana computes | verdict |
//! |---|---|---|
//! | `consistent_with` | nothing: compares with another claim (`check.other`) of the same unit | the values or ranges agree within `check.tolerance` |
//! | `quasi_polar` | the sun-synchronous inclination at the claimed altitude (or range), J2 | consistent when it lies within `check.tolerance_deg` (10) of 90° |
//! | `orbit_period` | the two-body period at the altitude in `check.altitude_km` | the claimed period (min) agrees within `check.tolerance` |
//! | `max_doppler` | the largest line-of-sight Doppler a ground user sees from a circular orbit at `check.altitude_km` on `check.frequency_hz` (Earth rotation neglected) | the claimed Doppler (Hz) agrees within `check.tolerance` |
//! | `link_cn0` | C/N0 from `check.eirp_dbw`, `check.frequency_hz`, `check.range_km`, `check.rx_gain_dbi`, `check.noise_temp_k` | the claimed C/N0 (dB-Hz) agrees within `check.tolerance` |
//!
//! Without a check the verdict is `recorded` (sourced, not checkable here). Every verdict names
//! the sources it rests on, the computed value when there is one, and the label. The shipped
//! dataset (`data/claims/celeste.json`) holds only claims quoted from public pages; for anything
//! else `data/claims/template.json` gives the shape to fill.
//!
//! MODELLED: the computations are two-body and J2 closed forms; a `consistent` verdict says a
//! claim agrees with that model, not that the claim is true.

use crate::portable_math::PortableFloat;
use serde::Serialize;
use serde_json::Value;

/// The honesty label.
pub const LABEL: &str = "MODELLED: claims checked against closed-form two-body, J2 and free-space link models; a \
consistent verdict means agreement with the model, not proof of the claim. Unsourced claims are refused.";

/// The format tag.
pub const FORMAT: &str = "kshana.claims/1";

/// The shipped dataset.
pub const BUILTIN: &str = include_str!("../data/claims/celeste.json");
/// The template.
pub const TEMPLATE: &str = include_str!("../data/claims/template.json");

const MU: f64 = 3.986_004_418e14;
const RE_M: f64 = 6_378_137.0;
const J2: f64 = 1.082_626_68e-3;
const C: f64 = 299_792_458.0;
/// Mean motion of the mean Sun, rad/s (360° per 365.2422 days).
const SUN_RATE: f64 = 2.0 * std::f64::consts::PI / (365.242_2 * 86_400.0);

/// The sun-synchronous inclination (deg) of a circular orbit at `alt_km`.
pub fn sso_inclination_deg(alt_km: f64) -> f64 {
    let a = RE_M + alt_km * 1000.0;
    let n = (MU / (a * a * a)).sqrt();
    let cos_i = -SUN_RATE / (1.5 * n * J2 * (RE_M / a).powi(2));
    cos_i.clamp(-1.0, 1.0).pacos().to_degrees()
}

/// The two-body period (min) of a circular orbit at `alt_km`.
pub fn period_min(alt_km: f64) -> f64 {
    let a = RE_M + alt_km * 1000.0;
    2.0 * std::f64::consts::PI * (a * a * a / MU).sqrt() / 60.0
}

/// The largest line-of-sight Doppler (Hz) a stationary ground user sees from a circular orbit at
/// `alt_km` on `freq_hz`: the range rate peaks at the horizon at `v·R/(R + h)`.
pub fn max_doppler_hz(alt_km: f64, freq_hz: f64) -> f64 {
    let a = RE_M + alt_km * 1000.0;
    let v = (MU / a).sqrt();
    v * RE_M / a * freq_hz / C
}

/// Free-space C/N0 (dB-Hz).
pub fn link_cn0(eirp_dbw: f64, freq_hz: f64, range_km: f64, rx_gain_dbi: f64, t_k: f64) -> f64 {
    let fspl = 20.0 * (4.0 * std::f64::consts::PI * range_km * 1000.0 * freq_hz / C).plog10();
    let k = 1.380_649e-23f64;
    eirp_dbw - fspl + rx_gain_dbi - 10.0 * (k * t_k).plog10()
}

/// One verdict.
#[derive(Clone, Debug, Serialize)]
pub struct Verdict {
    /// Claim id.
    pub id: String,
    /// Subject.
    pub subject: String,
    /// `consistent`, `inconsistent`, `recorded`, `refused` or `not_checkable`.
    pub verdict: &'static str,
    /// Why, in a word or two.
    pub reason: String,
    /// The computed value, when there is one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub computed: Option<Value>,
    /// The sources the verdict rests on.
    pub sources: Vec<String>,
    /// The label.
    pub label: &'static str,
}

/// The report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Dataset name.
    pub dataset: String,
    /// Verdicts, one per claim.
    pub verdicts: Vec<Verdict>,
    /// Counts.
    pub consistent: usize,
    /// Inconsistent.
    pub inconsistent: usize,
    /// Refused.
    pub refused: usize,
}

/// `(low, high)` of a value: a number or a two-number range.
fn range(v: &Value) -> Option<(f64, f64)> {
    if let Some(x) = v.as_f64() {
        return Some((x, x));
    }
    let a = v.as_array()?;
    if a.len() != 2 {
        return None;
    }
    let (l, h) = (a[0].as_f64()?, a[1].as_f64()?);
    (l <= h).then_some((l, h))
}

fn sourced(c: &Value) -> bool {
    let s = |k: &str| c[k].as_str().is_some_and(|x| !x.trim().is_empty());
    c["source_url"]
        .as_str()
        .is_some_and(|u| u.starts_with("https://"))
        && s("quote")
        && s("quote_location")
        && c["retrieved"]
            .as_str()
            .is_some_and(|d| d.len() == 10 && d.as_bytes()[4] == b'-' && d.as_bytes()[7] == b'-')
}

fn agree(claimed: (f64, f64), computed: (f64, f64), tol: f64) -> bool {
    claimed.0 <= computed.1 + tol && computed.0 <= claimed.1 + tol
}

/// Check a dataset's text.
pub fn check(text: &str) -> Result<Report, String> {
    let doc: Value =
        serde_json::from_str(text).map_err(|e| crate::terr!("e-claim-check-bad-dataset", e = e))?;
    if doc["format"] != FORMAT {
        return Err(crate::terr!("e-claim-check-bad-dataset", e = FORMAT));
    }
    let claims = doc["claims"].as_array().cloned().unwrap_or_default();
    let by_id = |id: &str| claims.iter().find(|c| c["id"] == id);
    let mut out = Vec::new();
    for c in &claims {
        let id = c["id"].as_str().unwrap_or_default().to_string();
        let subject = c["subject"].as_str().unwrap_or_default().to_string();
        let src = c["source_url"].as_str().unwrap_or_default().to_string();
        let mut v = Verdict {
            id,
            subject,
            verdict: "recorded",
            reason: String::new(),
            computed: None,
            sources: vec![src],
            label: LABEL,
        };
        if !sourced(c) {
            v.verdict = "refused";
            v.reason = "no public source, quote, location and date".into();
            v.sources.clear();
            out.push(v);
            continue;
        }
        let chk = &c["check"];
        let Some(kind) = chk["kind"].as_str() else {
            v.reason = "sourced; no check applies".into();
            out.push(v);
            continue;
        };
        let value = range(&c["value"]);
        let tol = chk["tolerance"].as_f64().unwrap_or(0.0);
        let num = |k: &str| chk[k].as_f64();
        let result: Option<(bool, Value, String)> = match kind {
            "consistent_with" => {
                let other = chk["other"].as_str().and_then(by_id);
                match (other, value) {
                    (Some(o), Some(mine)) if sourced(o) && o["unit"] == c["unit"] => {
                        range(&o["value"]).map(|theirs| {
                            v.sources
                                .push(o["source_url"].as_str().unwrap_or_default().into());
                            (
                                agree(mine, theirs, tol),
                                o["value"].clone(),
                                format!("against claim {}", o["id"].as_str().unwrap_or_default()),
                            )
                        })
                    }
                    _ => None,
                }
            }
            "quasi_polar" => value.map(|(lo, hi)| {
                let (a, b) = (sso_inclination_deg(lo), sso_inclination_deg(hi));
                let tol_deg = chk["tolerance_deg"].as_f64().unwrap_or(10.0);
                let ok = (a - 90.0).abs() <= tol_deg && (b - 90.0).abs() <= tol_deg;
                (
                    ok,
                    serde_json::json!({"sso_inclination_deg": [a.min(b), a.max(b)]}),
                    "sun-synchronous inclination over the claimed altitudes".to_string(),
                )
            }),
            "orbit_period" => match (num("altitude_km"), value) {
                (Some(h), Some(claimed)) => {
                    let p = period_min(h);
                    Some((
                        agree(claimed, (p, p), tol),
                        serde_json::json!(p),
                        "two-body period".into(),
                    ))
                }
                _ => None,
            },
            "max_doppler" => match (num("altitude_km"), num("frequency_hz"), value) {
                (Some(h), Some(f), Some(claimed)) => {
                    let d = max_doppler_hz(h, f);
                    Some((
                        agree(claimed, (d, d), tol),
                        serde_json::json!(d),
                        "horizon range rate of a circular orbit".into(),
                    ))
                }
                _ => None,
            },
            "link_cn0" => match (
                num("eirp_dbw"),
                num("frequency_hz"),
                num("range_km"),
                num("rx_gain_dbi"),
                num("noise_temp_k"),
                value,
            ) {
                (Some(e), Some(f), Some(r), Some(g), Some(t), Some(claimed))
                    if r > 0.0 && t > 0.0 =>
                {
                    let x = link_cn0(e, f, r, g, t);
                    Some((
                        agree(claimed, (x, x), tol),
                        serde_json::json!(x),
                        "free-space link budget".into(),
                    ))
                }
                _ => None,
            },
            _ => None,
        };
        match result {
            Some((ok, computed, why)) => {
                v.verdict = if ok { "consistent" } else { "inconsistent" };
                v.computed = Some(computed);
                v.reason = why;
            }
            None => {
                v.verdict = "not_checkable";
                v.reason = "the check is unknown or its inputs are missing".into();
            }
        }
        out.push(v);
    }
    let count = |k: &str| out.iter().filter(|v| v.verdict == k).count();
    Ok(Report {
        schema: "kshana.claims-check/1",
        dataset: doc["name"].as_str().unwrap_or_default().to_string(),
        consistent: count("consistent"),
        inconsistent: count("inconsistent"),
        refused: count("refused"),
        verdicts: out,
    })
}

/// `kshana claim-check [<dataset.json>...] | --template` : JSON to standard output or `--out`.
/// Exit 0, 1 when a claim is inconsistent, 2 on a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    match cli(args) {
        Ok(c) => c,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn cli(args: &[String]) -> Result<i32, String> {
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", crate::t!("claim-check-usage"));
        return Ok(0);
    }
    let mut files = Vec::new();
    let mut out = None;
    let mut it = args.iter();
    while let Some(a) = it.next() {
        match a.as_str() {
            "--template" => {
                print!("{TEMPLATE}");
                return Ok(0);
            }
            "--out" => {
                out = Some(
                    it.next()
                        .ok_or_else(|| crate::terr!("e-claim-check-missing-value", option = a))?
                        .clone(),
                )
            }
            s if s.starts_with("--") => {
                return Err(crate::terr!("e-claim-check-unknown-option", option = s))
            }
            s => files.push(s.to_string()),
        }
    }
    let mut reports = Vec::new();
    if files.is_empty() {
        reports.push(check(BUILTIN)?);
    }
    for f in &files {
        let t = std::fs::read_to_string(f)
            .map_err(|e| crate::terr!("e-claim-check-cannot-read", path = f, e = e))?;
        reports.push(check(&t)?);
    }
    let bad = reports.iter().any(|r| r.inconsistent > 0);
    let text = serde_json::to_string_pretty(&reports).map_err(|e| e.to_string())? + "\n";
    match out {
        Some(p) => std::fs::write(&p, text)
            .map_err(|e| crate::terr!("e-claim-check-cannot-write", path = p, e = e))?,
        None => print!("{text}"),
    }
    Ok(i32::from(bad))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn closed_forms() {
        // SSO inclination at 500 km is about 97.4 degrees; at 800 km about 98.6.
        assert!(
            (sso_inclination_deg(500.0) - 97.4).abs() < 0.1,
            "{}",
            sso_inclination_deg(500.0)
        );
        assert!((sso_inclination_deg(800.0) - 98.6).abs() < 0.1);
        // ISS-like 400 km: about 92.6 minutes.
        assert!((period_min(400.0) - 92.6).abs() < 0.1);
        // GPS L1 from 550 km: under 40 kHz.
        let d = max_doppler_hz(550.0, 1_575.42e6);
        assert!(d > 30_000.0 && d < 40_000.0, "{d}");
        // 27 dBW EIRP at 20,200 km on L1, 0 dBi, 290 K: free-space loss 182.5 dB, kT -204.0
        // dBW/Hz, so 48.5 dB-Hz.
        let c = link_cn0(27.0, 1_575.42e6, 20_200.0, 0.0, 290.0);
        assert!((c - 48.5).abs() < 0.3, "{c}");
    }

    #[test]
    fn the_shipped_dataset_has_no_refusals_and_no_inconsistencies() {
        let r = check(BUILTIN).unwrap();
        assert_eq!(r.refused, 0, "{:?}", r.verdicts);
        assert_eq!(r.inconsistent, 0, "{:?}", r.verdicts);
        assert!(r.consistent >= 2);
        for v in &r.verdicts {
            assert!(!v.sources.is_empty() && v.sources.iter().all(|s| s.starts_with("https://")));
        }
    }

    #[test]
    fn the_template_refuses_until_filled_and_checks_once_filled() {
        let r = check(TEMPLATE).unwrap();
        assert!(
            r.verdicts.iter().all(|v| v.verdict == "refused"),
            "{:?}",
            r.verdicts
        );
        let filled = TEMPLATE
            .replace(
                "\"source_url\": \"\"",
                "\"source_url\": \"https://example.org/page\"",
            )
            .replace("\"retrieved\": \"\"", "\"retrieved\": \"2026-11-20\"")
            .replace("\"quote\": \"\"", "\"quote\": \"q\"")
            .replace("\"quote_location\": \"\"", "\"quote_location\": \"para 1\"");
        let r = check(&filled).unwrap();
        assert!(r.refused == 0, "{:?}", r.verdicts);
    }

    #[test]
    fn an_inconsistent_claim_is_flagged() {
        let t = r#"{"format":"kshana.claims/1","name":"t","claims":[
          {"id":"p","subject":"x","claim":"period","value":120.0,"unit":"min",
           "source_url":"https://example.org","retrieved":"2026-11-20","quote":"q","quote_location":"l",
           "check":{"kind":"orbit_period","altitude_km":550.0,"tolerance":1.0}},
          {"id":"u","subject":"x","claim":"unsourced","value":1.0,"unit":"min"}]}"#;
        let r = check(t).unwrap();
        assert_eq!(r.verdicts[0].verdict, "inconsistent");
        assert_eq!(r.verdicts[1].verdict, "refused");
        assert!(check("{}").is_err());
    }
}
