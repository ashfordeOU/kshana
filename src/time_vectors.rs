// SPDX-License-Identifier: AGPL-3.0-only
//! Time-scale conformance vectors: an open, versioned set of test vectors for the conversions
//! that keep breaking in navigation and timing software, and a runner that checks kshana's own
//! implementation ([`crate::gnss_time`], [`crate::norad`], [`crate::tle`]) against them.
//!
//! The vectors live in `data/conformance/time/*.json` (format `kshana.time-vectors/1`, written
//! up in `docs/TIME-VECTORS.md`), are embedded in the binary, and run with
//! `kshana time-vectors` (or on other files with `kshana time-vectors <file|dir>...`). The
//! expected values were computed by an independent generator
//! (`data/conformance/time/gen_time_vectors.py`, Python standard library only) from the
//! published definitions, so the runner checks this crate against a second implementation, not
//! against itself. Another project can run the same files: each vector is an operation name, an
//! input object and an expected object, with nothing kshana-specific in them.

use crate::gnss_time::{self as gt, Scale, YearConvention};
use serde_json::{Map, Value};

/// The format tag every vector file carries.
pub const FORMAT: &str = "kshana.time-vectors/1";

/// The vector files shipped with kshana, as (file name, text).
pub const BUILTIN: &[(&str, &str)] = &[
    (
        "leap-seconds.json",
        include_str!("../data/conformance/time/leap-seconds.json"),
    ),
    (
        "gnss-weeks.json",
        include_str!("../data/conformance/time/gnss-weeks.json"),
    ),
    (
        "gnss-systems.json",
        include_str!("../data/conformance/time/gnss-systems.json"),
    ),
    (
        "computer-eras.json",
        include_str!("../data/conformance/time/computer-eras.json"),
    ),
    (
        "two-digit-years.json",
        include_str!("../data/conformance/time/two-digit-years.json"),
    ),
    (
        "ut1-utc.json",
        include_str!("../data/conformance/time/ut1-utc.json"),
    ),
    (
        "norad-catalogue.json",
        include_str!("../data/conformance/time/norad-catalogue.json"),
    ),
];

/// The outcome of one vector.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct Outcome {
    /// The file the vector came from.
    pub file: String,
    /// The vector's id.
    pub id: String,
    /// The operation.
    pub op: String,
    /// Whether every expected field matched.
    pub pass: bool,
    /// For a failure, what differed (`field: want != got`, or the error).
    pub detail: String,
}

fn missing(k: &str) -> String {
    crate::terr!("e-time-vectors-missing-input", key = k)
}

fn field<'a>(input: &'a Map<String, Value>, k: &str) -> Result<&'a Value, String> {
    input.get(k).ok_or_else(|| missing(k))
}

fn s_in<'a>(input: &'a Map<String, Value>, k: &str) -> Result<&'a str, String> {
    field(input, k)?.as_str().ok_or_else(|| missing(k))
}

fn i_in(input: &Map<String, Value>, k: &str) -> Result<i64, String> {
    field(input, k)?.as_i64().ok_or_else(|| missing(k))
}

fn u32_in(input: &Map<String, Value>, k: &str) -> Result<u32, String> {
    u32::try_from(i_in(input, k)?).map_err(|_| missing(k))
}

fn f_in(input: &Map<String, Value>, k: &str) -> Result<f64, String> {
    field(input, k)?.as_f64().ok_or_else(|| missing(k))
}

/// Run one operation on its input, giving the output fields.
pub fn evaluate(op: &str, input: &Map<String, Value>) -> Result<Map<String, Value>, String> {
    let mut out = Map::new();
    let mut put = |k: &str, v: Value| {
        out.insert(k.to_string(), v);
    };
    match op {
        "utc_valid" => {
            let c = gt::utc_valid(s_in(input, "utc")?)?;
            put("valid", Value::Bool(true));
            put("utc", Value::from(c.format()));
        }
        "tai_minus_utc" => {
            let c = gt::utc_valid(s_in(input, "utc")?)?;
            put(
                "seconds",
                Value::from(gt::tai_minus_utc_on_day(c.days()).unwrap_or(0)),
            );
        }
        "utc_day_length" => {
            let c = gt::Civil::parse(s_in(input, "date")?)?;
            put("seconds", Value::from(gt::utc_day_length_s(c.days())));
        }
        "utc_to_scale" => {
            let scale = Scale::from_name(s_in(input, "scale")?)?;
            put(
                "time",
                Value::from(gt::utc_to_scale(s_in(input, "utc")?, scale)?),
            );
        }
        "scale_offset" => {
            let from = Scale::from_name(s_in(input, "from")?)?;
            let to = Scale::from_name(s_in(input, "to")?)?;
            put(
                "seconds",
                Value::from(gt::scale_offset_s(from, to, s_in(input, "utc")?)?),
            );
        }
        "tai_to_utc" => {
            // A TAI label back to UTC, through the leap seconds.
            let c = gt::Civil::parse(s_in(input, "tai")?)?;
            let tai = i128::from(c.days()) * i128::from(gt::DAY_S) * gt::NS + c.ns_of_day;
            let u = gt::tai_ns_to_utc(tai)
                .ok_or_else(|| crate::terr!("e-gnss-time-before-1972", value = c.format()))?;
            put("utc", Value::from(u.format()));
        }
        "gnss_week_tow" => {
            let sys = Scale::from_name(s_in(input, "system")?)?;
            let (w, tow) = gt::gnss_week_tow(s_in(input, "utc")?, sys)?;
            let wu = u32::try_from(w).unwrap_or(0);
            put("week", Value::from(w));
            put("tow", Value::from(tow));
            put("week10", Value::from(gt::truncate_week(wu, 10)));
            put("week12", Value::from(gt::truncate_week(wu, 12)));
            put("week13", Value::from(gt::truncate_week(wu, 13)));
        }
        "gps_to_utc" => {
            put(
                "utc",
                Value::from(gt::gps_to_utc(i_in(input, "week")?, f_in(input, "tow")?)?),
            );
        }
        "gps_week_start" => {
            put(
                "gpst",
                Value::from(gt::gps_week_start(i_in(input, "week")?)),
            );
        }
        "week_resolve" => {
            let w = gt::resolve_week(
                u32_in(input, "truncated")?,
                u32_in(input, "bits")?,
                u32_in(input, "reference_week")?,
            )?;
            put("week", Value::from(w));
        }
        "glonass_day" => {
            let (n4, nt, moscow) = gt::glonass_day(s_in(input, "utc")?)?;
            put("n4", Value::from(n4));
            put("nt", Value::from(nt));
            put("moscow", Value::from(moscow));
        }
        "unix_to_ntp" => {
            let (era, s) = gt::unix_to_ntp(i_in(input, "unix")?);
            put("era", Value::from(era));
            put("seconds", Value::from(s));
        }
        "ntp_to_unix" => {
            let ntp = u32_in(input, "seconds")?;
            let (unix, era) = gt::ntp_to_unix(ntp, i_in(input, "pivot_unix")?);
            put("unix", Value::from(unix));
            put("era", Value::from(era));
            put("utc", Value::from(gt::unix_to_utc(unix)));
        }
        "unix_i32" => {
            let unix = i_in(input, "unix")?;
            let (w, fits) = gt::unix_i32_wrap(unix);
            put("fits", Value::Bool(fits));
            put("wrapped", Value::from(w));
            put("utc", Value::from(gt::unix_to_utc(unix)));
            put("wrapped_utc", Value::from(gt::unix_to_utc(w)));
        }
        "unix_u32_resolve" => {
            let t = gt::resolve_unix_u32(u32_in(input, "raw")?, i_in(input, "pivot_unix")?);
            put("unix", Value::from(t));
            put("utc", Value::from(gt::unix_to_utc(t)));
        }
        "two_digit_year" => {
            let conv = YearConvention::from_name(s_in(input, "convention")?)?;
            let reference = input
                .get("reference_year")
                .and_then(Value::as_i64)
                .unwrap_or(0);
            put(
                "year",
                Value::from(gt::two_digit_year(u32_in(input, "yy")?, conv, reference)?),
            );
        }
        "ut1_from_utc" => {
            // UT1 = UTC + DUT1, in integer milliseconds so the label is exact.
            let c = gt::utc_valid(s_in(input, "utc")?)?;
            let dut1 = f_in(input, "dut1_s")?;
            let ms = i128::from(c.days()) * 86_400_000
                + c.ns_of_day / 1_000_000
                + (dut1 * 1000.0).round() as i128;
            let secs = ms.div_euclid(1000) as i64;
            put(
                "ut1",
                Value::from(format!(
                    "{}.{:03}",
                    gt::unix_to_utc(secs),
                    ms.rem_euclid(1000)
                )),
            );
            // Earth rotation angle (IERS Conventions 2010, eq. 5.15), Du split into whole days
            // from J2000.0 and a fraction so the fraction keeps its precision.
            let day_ms = ms - 10_957 * 86_400_000 - 43_200_000;
            let du_int = day_ms.div_euclid(86_400_000) as f64;
            let du_frac = day_ms.rem_euclid(86_400_000) as f64 / 86_400_000.0;
            let turns = (crate::timescales::ERA_TURNS_AT_J2000
                + (crate::timescales::ERA_TURNS_PER_UT1_DAY - 1.0) * (du_int + du_frac)
                + du_frac)
                .rem_euclid(1.0);
            put("era_deg", Value::from(turns * 360.0));
            put("beyond_0_9_s", Value::Bool(dut1.abs() > 0.9));
            put(
                "era_error_if_clamped_arcsec",
                Value::from(
                    (dut1.abs() - 0.9).max(0.0) * crate::timescales::ERA_TURNS_PER_UT1_DAY * 15.0,
                ),
            );
        }
        "norad_encode" => {
            put(
                "field",
                Value::from(crate::norad::encode(u32_in(input, "number")?)?),
            );
        }
        "norad_decode" => {
            put(
                "number",
                Value::from(crate::norad::decode(s_in(input, "field")?)?),
            );
        }
        "tle_checksum" => {
            put(
                "checksum",
                Value::from(crate::tle::tle_checksum(s_in(input, "line")?)),
            );
        }
        "tle_identity" => {
            let id = crate::tle::parse_tle_identity(s_in(input, "line1")?)?;
            put("number", Value::from(id.norad_cat_id));
            put("designator", Value::from(id.intl_designator));
            put("epoch", Value::from(id.epoch_iso));
        }
        "omm_catalogue" => {
            let m = crate::odm::OmmMessage::parse(s_in(input, "omm")?)?;
            let (n, tle) = crate::norad::tle_from_omm(&m)?;
            put("number", Value::from(n));
            put("epoch_days_1950", Value::from(tle.epoch_days_1950));
            put(
                "alpha5",
                Value::from(crate::norad::encode(n).unwrap_or_default()),
            );
        }
        other => return Err(crate::terr!("e-time-vectors-unknown-op", op = other)),
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

/// Run one vector object.
pub fn run_vector(file: &str, v: &Value) -> Outcome {
    let id = v["id"].as_str().unwrap_or("").to_string();
    let op = v["op"].as_str().unwrap_or("").to_string();
    let mk = |pass: bool, detail: String| Outcome {
        file: file.to_string(),
        id: id.clone(),
        op: op.clone(),
        pass,
        detail,
    };
    let empty = Map::new();
    let input = v["input"].as_object().unwrap_or(&empty);
    let Some(expect) = v["expect"].as_object() else {
        return mk(false, crate::terr!("e-time-vectors-no-expect"));
    };
    let tol = v["tolerance"].as_f64().unwrap_or(1e-9);
    let want_error = expect.get("error").and_then(Value::as_bool) == Some(true);
    match evaluate(&op, input) {
        Err(e) if want_error => mk(true, e),
        Err(e) => mk(false, e),
        Ok(_) if want_error => mk(false, crate::terr!("e-time-vectors-expected-error")),
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

/// Run every vector of one file's text. A file that is not valid `kshana.time-vectors/1` JSON
/// is an error.
pub fn run_file(name: &str, text: &str) -> Result<Vec<Outcome>, String> {
    let doc: Value = serde_json::from_str(text).map_err(|e| format!("{name}: {e}"))?;
    let bad = || crate::terr!("e-time-vectors-bad-format", file = name, format = FORMAT);
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

/// The pass/fail table: one row per vector, then a summary line.
pub fn table(outcomes: &[Outcome]) -> String {
    let wid = outcomes
        .iter()
        .map(|o| o.id.len())
        .max()
        .unwrap_or(2)
        .max(2);
    let wop = outcomes
        .iter()
        .map(|o| o.op.len())
        .max()
        .unwrap_or(2)
        .max(2);
    let mut s = format!("{:<wid$}  {:<wop$}  {}\n", "id", "op", "result");
    for o in outcomes {
        let r = if o.pass { "PASS" } else { "FAIL" };
        s.push_str(&format!("{:<wid$}  {:<wop$}  {r}", o.id, o.op));
        if !o.pass {
            s.push_str("  ");
            s.push_str(&o.detail);
        }
        s.push('\n');
    }
    let passed = outcomes.iter().filter(|o| o.pass).count();
    s.push_str(&crate::t!(
        "time-vectors-summary",
        n = outcomes.len(),
        passed = passed,
        failed = outcomes.len() - passed
    ));
    s.push('\n');
    s
}

/// `kshana time-vectors [--json] [<file|dir> ...]`: run the built-in vectors, or the given
/// files (every `*.json` in a directory), print the table (or JSON). `Ok(false)` when any
/// vector fails.
pub fn run_cli(args: &[String]) -> Result<bool, String> {
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", crate::t!("time-vectors-usage"));
        return Ok(true);
    }
    if args.iter().any(|a| a.starts_with("--") && a != "--json") {
        return Err(crate::t!("time-vectors-usage"));
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

    #[test]
    fn every_builtin_vector_passes() {
        let out = run_builtin().unwrap();
        let failed: Vec<_> = out.iter().filter(|o| !o.pass).collect();
        assert!(failed.is_empty(), "{}", table(&out));
        assert!(out.len() > 200, "{} vectors", out.len());
    }
}
