// SPDX-License-Identifier: AGPL-3.0-only
//! Frame and time transform receipts (`kshana transform-receipt`, docs/TRANSFORM-RECEIPTS.md).
//!
//! Every boundary between two systems changes a reference frame or a time scale, and the
//! change is usually made silently inside code: which leap-second table, which TT − TDB series,
//! which Earth-orientation values, which precession-nutation model. A **transform receipt**
//! writes it down. It records the input (an epoch in a named time scale and, optionally, a
//! position in a named frame), the chain of steps from that input to the outputs with the model
//! of each step and its parameters (the Earth-orientation source, its file hash and the values
//! used), the outputs (the epoch in TAI, UTC, TT, TDB, GPST, BDT and UT1; the position in the
//! other frame), and a SHA-256 hash of its own canonical form. An open verifier recomputes the
//! outputs from the recorded input and parameters and checks the hash.
//!
//! The format is `kshana.transform-receipt/1`. A receipt may carry an Ed25519 signature over the
//! same canonical bytes the hash covers; this module verifies such a signature (against a key
//! the caller trusts) but does not make one: a receipt can also be placed in a signed
//! `kshana evidence` pack.
//!
//! # Models (the identifiers written in each step)
//!
//! | step | model |
//! |---|---|
//! | UTC ↔ TAI | the engine's leap-second table (IERS Bulletin C), SOFA `iauUtctai` / `iauTaiutc` conventions ([`crate::jd2`]) |
//! | TAI → TT | TT = TAI + 32.184 s |
//! | TAI → GPST, BDT | GPST = TAI − 19 s; BDT = TAI − 33 s (GST is GPST) |
//! | TT → TDB | the two-term series of [`crate::timescales::tdb_minus_tt`] (good to tens of microseconds) |
//! | UTC → UT1 | UT1 − UTC from the recorded Earth-orientation values |
//! | ITRS ↔ GCRS | IAU 2006/2000A, CIO based ([`crate::cio::gcrs_to_itrs_matrix_jd2`]), with polar motion; celestial pole offsets dX, dY are not applied |
//!
//! **Evidence: MODELLED.** A receipt records what was computed and with which models; it does
//! not make the models more accurate than they are. The TDB series and the omitted pole offsets
//! limit the result (tens of microseconds in TDB; centimetres to decimetres in the frame
//! transform without dX, dY), and a transform without Earth-orientation values is an
//! approximation the receipt marks as such.

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

use crate::jd2::{self, Jd2};
use crate::timescales::{self, SECONDS_PER_DAY};

/// The receipt format.
pub const FORMAT: &str = "kshana.transform-receipt/1";
/// The request format.
pub const REQUEST_FORMAT: &str = "kshana.transform-request/1";
/// The evidence label.
pub const LABEL: &str = "MODELLED";
/// The tolerance on a recomputed position, metres.
pub const TOL_POSITION_M: f64 = 1e-6;
/// The tolerance on a recomputed time offset, seconds.
pub const TOL_TIME_S: f64 = 1e-9;

/// The time scales a request may name.
pub const SCALES: &[&str] = &["UTC", "TAI", "TT", "TDB", "GPST", "GST", "BDT"];

/// The model identifier of each step kind. Written into every receipt; a verifier built with
/// different identifiers reports the difference.
pub mod models {
    /// UTC and TAI.
    pub const LEAP: &str = "leap-second table (IERS Bulletin C) as built into the engine; SOFA iauUtctai/iauTaiutc conventions";
    /// TT from TAI.
    pub const TT: &str = "TT = TAI + 32.184 s";
    /// GPST from TAI.
    pub const GPST: &str = "GPST = TAI - 19 s (GST = GPST)";
    /// BDT from TAI.
    pub const BDT: &str = "BDT = TAI - 33 s";
    /// TDB from TT.
    pub const TDB: &str =
        "TDB - TT = 0.001657 sin g + 0.000022 sin 2g s, g = 357.53 + 0.98560028 (JD_TT - 2451545) deg";
    /// UT1 from UTC.
    pub const UT1: &str = "UT1 = UTC + (UT1 - UTC), the recorded Earth-orientation value";
    /// GCRS and ITRS.
    pub const CIO: &str = "IAU 2006/2000A CIO-based GCRS-ITRS (IERS Conventions 2010 ch. 5), polar motion from the recorded values; dX, dY not applied";
}

/// The epoch of a request.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Epoch {
    /// One of [`SCALES`].
    pub scale: String,
    /// `YYYY-MM-DDTHH:MM:SS[.fraction]`.
    pub time: String,
}

/// Earth-orientation values as recorded.
#[derive(Clone, Debug, Default, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Eop {
    /// Where they come from (a file name, a bulletin, or `none`).
    pub source: String,
    /// SHA-256 of the source file, when there is one.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub sha256: Option<String>,
    /// UT1 − UTC, seconds.
    pub ut1_minus_utc_s: f64,
    /// Pole x, arcseconds.
    pub xp_arcsec: f64,
    /// Pole y, arcseconds.
    pub yp_arcsec: f64,
}

/// A transform request (`kshana.transform-request/1`).
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Request {
    /// Always [`REQUEST_FORMAT`].
    pub format: String,
    /// The epoch.
    pub epoch: Epoch,
    /// The position's frame: `ITRS` (or an `ITRF...` label) or `GCRS`.
    #[serde(default)]
    pub frame: Option<String>,
    /// The position, metres.
    #[serde(default)]
    pub position_m: Option<[f64; 3]>,
    /// Earth-orientation values (else from `--eop`, else none).
    #[serde(default)]
    pub eop: Option<Eop>,
}

fn bad(msg: String) -> String {
    crate::terr!("e-transform-receipt-request", e = msg)
}

/// Parse `YYYY-MM-DDTHH:MM:SS[.f]` (a trailing `Z` is accepted).
fn parse_time(s: &str) -> Result<(i32, u32, u32, u32, u32, f64), String> {
    let s = s.trim().trim_end_matches('Z');
    let (date, time) = s
        .split_once('T')
        .ok_or_else(|| bad(format!("time {s:?} is not YYYY-MM-DDTHH:MM:SS")))?;
    let d: Vec<&str> = date.split('-').collect();
    let t: Vec<&str> = time.split(':').collect();
    if d.len() != 3 || t.len() != 3 {
        return Err(bad(format!("time {s:?} is not YYYY-MM-DDTHH:MM:SS")));
    }
    let n = |x: &str| {
        x.parse::<u32>()
            .map_err(|_| bad(format!("time {s:?} is not YYYY-MM-DDTHH:MM:SS")))
    };
    let year: i32 = d[0]
        .parse()
        .map_err(|_| bad(format!("time {s:?} is not YYYY-MM-DDTHH:MM:SS")))?;
    let sec: f64 = t[2]
        .parse()
        .map_err(|_| bad(format!("time {s:?} is not YYYY-MM-DDTHH:MM:SS")))?;
    Ok((year, n(d[1])?, n(d[2])?, n(t[0])?, n(t[1])?, sec))
}

/// A uniform-scale calendar time as a two-part Julian date.
fn uniform_jd2(y: i32, mo: u32, d: u32, h: u32, mi: u32, s: f64) -> Result<Jd2, String> {
    if !(1..=12).contains(&mo) || d == 0 || d > 31 || h > 23 || mi > 59 || !(0.0..60.0).contains(&s)
    {
        return Err(bad(format!(
            "{y:04}-{mo:02}-{d:02}T{h:02}:{mi:02}:{s} is out of range"
        )));
    }
    let jd0 = timescales::julian_date(y, mo, d, 0, 0, 0.0); // N + 0.5
    let (cy, cm, cd) = calendar_of(jd0 - 0.5, 0.5);
    if (cy, cm, cd) != (y, mo, d) {
        return Err(bad(format!("{y:04}-{mo:02}-{d:02} is not a calendar date")));
    }
    let sod = 3600.0 * h as f64 + 60.0 * mi as f64 + s;
    Ok(Jd2::from_parts(jd0 - 0.5, 0.5 + sod / SECONDS_PER_DAY))
}

/// The Gregorian calendar date of the two-part Julian date `day + frac` (day boundary at 0h).
fn calendar_of(day: f64, frac: f64) -> (i32, u32, u32) {
    calendar_of_jdn((day + (frac + 0.5).floor()) as i64)
}

/// The Gregorian calendar date of a Julian day number.
fn calendar_of_jdn(jdn: i64) -> (i32, u32, u32) {
    // Fliegel and Van Flandern (1968)
    let l = jdn + 68569;
    let n = 4 * l / 146097;
    let l = l - (146097 * n + 3) / 4;
    let i = 4000 * (l + 1) / 1461001;
    let l = l - 1461 * i / 4 + 31;
    let j = 80 * l / 2447;
    let d = l - 2447 * j / 80;
    let l = j / 11;
    let m = j + 2 - 12 * l;
    let y = 100 * (n - 49) + i + l;
    (y as i32, m as u32, d as u32)
}

/// A uniform-scale two-part Julian date as `YYYY-MM-DDTHH:MM:SS.fffffffff`.
pub fn iso(t: Jd2) -> String {
    // nanoseconds of the day, rounded, with the carry into the next day
    let x = t.frac + 0.5;
    let mut day = t.day + x.floor();
    let mut ns = ((x - x.floor()) * SECONDS_PER_DAY * 1e9).round() as i64;
    if ns >= 86_400_000_000_000 {
        ns -= 86_400_000_000_000;
        day += 1.0;
    }
    let (y, m, d) = calendar_of_jdn(day as i64);
    let s = ns / 1_000_000_000;
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}.{:09}",
        s / 3600,
        (s / 60) % 60,
        s % 60,
        ns % 1_000_000_000
    )
}

/// A UTC quasi Julian date (the [`Jd2::from_utc_calendar`] convention) as an ISO time, with
/// `23:59:60.x` inside a leap second.
pub fn utc_iso(utc: Jd2) -> String {
    let (y, m, d) = calendar_of(utc.day, utc.frac);
    let (ny, nm, nd) = calendar_of(utc.day + 1.0, utc.frac);
    let len = SECONDS_PER_DAY + timescales::tai_minus_utc_on_date(ny, nm, nd, 0.0)
        - timescales::tai_minus_utc_on_date(y, m, d, 0.0);
    let x = utc.frac + 0.5;
    let ns = ((x - x.floor()) * len * 1e9).round() as i64;
    let s = ns / 1_000_000_000;
    let (h, mi, sec) = if s >= 86_400 {
        (23, 59, s - 86_340)
    } else {
        (s / 3600, (s / 60) % 60, s % 60)
    };
    format!(
        "{y:04}-{m:02}-{d:02}T{h:02}:{mi:02}:{sec:02}.{:09}",
        ns % 1_000_000_000
    )
}

fn jd2_json(t: Jd2) -> Value {
    json!({ "jd_day": t.day, "jd_frac": t.frac })
}

/// Read a frame name: `Some(true)` for the terrestrial frame, `Some(false)` for the GCRS.
fn terrestrial(frame: &str) -> Option<bool> {
    let f = frame.trim().to_ascii_uppercase();
    if f == "GCRS" {
        Some(false)
    } else if f == "ITRS" || f.starts_with("ITRF") {
        Some(true)
    } else {
        None
    }
}

/// The Earth-orientation values of a finals2000A file at a UTC epoch.
pub fn eop_from_finals(name: &str, body: &[u8], utc: Jd2) -> Eop {
    let text = String::from_utf8_lossy(body);
    let series = crate::eop::EopSeries::from_finals2000a(&text);
    let mjd = (utc.day - 2_400_000.0) + (utc.frac - 0.5);
    let (dut1, xp, yp) = series.interp_utc_mjd(mjd);
    Eop {
        source: format!("finals2000A file {name}, linear interpolation at MJD(UTC) {mjd:.6}"),
        sha256: Some(hex::encode(Sha256::digest(body))),
        ut1_minus_utc_s: dut1,
        xp_arcsec: xp,
        yp_arcsec: yp,
    }
}

fn none_eop() -> Eop {
    Eop {
        source: "none: UT1 = UTC and no polar motion".into(),
        sha256: None,
        ut1_minus_utc_s: 0.0,
        xp_arcsec: 0.0,
        yp_arcsec: 0.0,
    }
}

/// The TAI instant of a request's epoch, and the epoch's own two-part date in its scale.
fn tai_of(epoch: &Epoch) -> Result<(Jd2, Jd2), String> {
    let (y, mo, d, h, mi, s) = parse_time(&epoch.time)?;
    match epoch.scale.as_str() {
        "UTC" => {
            let utc = Jd2::from_utc_calendar(y, mo, d, h, mi, s).map_err(bad)?;
            Ok((jd2::utc_to_tai(utc), utc))
        }
        "TAI" => {
            let t = uniform_jd2(y, mo, d, h, mi, s)?;
            Ok((t, t))
        }
        "TT" => {
            let t = uniform_jd2(y, mo, d, h, mi, s)?;
            Ok((t.add_seconds(-timescales::TT_MINUS_TAI), t))
        }
        "TDB" => {
            let t = uniform_jd2(y, mo, d, h, mi, s)?;
            let tt = t.add_seconds(-timescales::tdb_minus_tt(t.total()));
            Ok((tt.add_seconds(-timescales::TT_MINUS_TAI), t))
        }
        "GPST" | "GST" => {
            let t = uniform_jd2(y, mo, d, h, mi, s)?;
            Ok((t.add_seconds(timescales::TAI_MINUS_GPS), t))
        }
        "BDT" => {
            let t = uniform_jd2(y, mo, d, h, mi, s)?;
            Ok((t.add_seconds(timescales::TAI_MINUS_GPS + 14.0), t))
        }
        other => Err(bad(format!(
            "time scale {other:?} is not one of {}",
            SCALES.join(", ")
        ))),
    }
}

fn step(from: &str, to: &str, model: &str, offset_s: f64) -> Value {
    json!({ "from": from, "to": to, "model": model, "offset_s": offset_s })
}

/// Compute a receipt body (without `hash`) for a request whose EOP is resolved.
fn compute(req: &Request, eop: &Eop) -> Result<Value, String> {
    if req.format != REQUEST_FORMAT {
        return Err(bad(format!(
            "format is {:?}, not {REQUEST_FORMAT}",
            req.format
        )));
    }
    let (tai, _) = tai_of(&req.epoch)?;
    let utc = jd2::tai_to_utc(tai);
    let tt = jd2::tai_to_tt(tai);
    let tdb_tt = timescales::tdb_minus_tt(tt.total());
    let tdb = tt.add_seconds(tdb_tt);
    let gpst = tai.add_seconds(-timescales::TAI_MINUS_GPS);
    let bdt = tai.add_seconds(-timescales::TAI_MINUS_GPS - 14.0);
    let ut1 = jd2::utc_to_ut1(utc, eop.ut1_minus_utc_s);
    // TAI − UTC as the leap-second table gives it for the UTC day
    let (uy, um, ud) = calendar_of(utc.day, utc.frac);
    let tai_utc = timescales::tai_minus_utc_on_date(uy, um, ud, 0.0);
    let mut chain = Vec::new();
    let input_scale = req.epoch.scale.as_str();
    if input_scale != "TAI" {
        let (model, off) = match input_scale {
            "UTC" => (models::LEAP, tai_utc),
            "TT" => (models::TT, -timescales::TT_MINUS_TAI),
            "TDB" => (models::TDB, -timescales::TT_MINUS_TAI - tdb_tt),
            "GPST" | "GST" => (models::GPST, timescales::TAI_MINUS_GPS),
            _ => (models::BDT, timescales::TAI_MINUS_GPS + 14.0),
        };
        chain.push(step(input_scale, "TAI", model, off));
    }
    chain.push(step("TAI", "UTC", models::LEAP, -tai_utc));
    chain.push(step("TAI", "TT", models::TT, timescales::TT_MINUS_TAI));
    chain.push(step("TT", "TDB", models::TDB, tdb_tt));
    chain.push(step(
        "TAI",
        "GPST",
        models::GPST,
        -timescales::TAI_MINUS_GPS,
    ));
    chain.push(step(
        "TAI",
        "BDT",
        models::BDT,
        -timescales::TAI_MINUS_GPS - 14.0,
    ));
    chain.push(step("UTC", "UT1", models::UT1, eop.ut1_minus_utc_s));
    let epochs = json!({
        "TAI": { "iso": iso(tai), "jd": jd2_json(tai) },
        "UTC": { "iso": utc_iso(utc), "jd": jd2_json(utc) },
        "TT": { "iso": iso(tt), "jd": jd2_json(tt) },
        "TDB": { "iso": iso(tdb), "jd": jd2_json(tdb) },
        "GPST": { "iso": iso(gpst), "jd": jd2_json(gpst) },
        "BDT": { "iso": iso(bdt), "jd": jd2_json(bdt) },
        "UT1": { "iso": iso(ut1), "jd": jd2_json(ut1) },
    });
    let mut output = json!({ "epochs": epochs });
    let mut warnings: Vec<String> = Vec::new();
    match (&req.frame, req.position_m) {
        (Some(frame), Some(p)) => {
            let from_itrs = terrestrial(frame)
                .ok_or_else(|| bad(format!("frame {frame:?} is not ITRS, ITRF... or GCRS")))?;
            if !p.iter().all(|v| v.is_finite()) {
                return Err(bad("position_m must be finite".into()));
            }
            let m = crate::cio::gcrs_to_itrs_matrix_jd2(
                tt,
                ut1,
                crate::frames::arcsec(eop.xp_arcsec),
                crate::frames::arcsec(eop.yp_arcsec),
            );
            let (to, out) = if from_itrs {
                let mt = [
                    [m[0][0], m[1][0], m[2][0]],
                    [m[0][1], m[1][1], m[2][1]],
                    [m[0][2], m[1][2], m[2][2]],
                ];
                ("GCRS", crate::precession::mat_vec(&mt, p))
            } else {
                ("ITRS", crate::precession::mat_vec(&m, p))
            };
            if frame.to_ascii_uppercase().starts_with("ITRF") {
                warnings.push(format!(
                    "{frame} is taken as the ITRS; no transformation between ITRF realisations is applied"
                ));
            }
            chain.push(json!({
                "from": if from_itrs { "ITRS" } else { "GCRS" },
                "to": to,
                "model": models::CIO,
                "parameters": {
                    "jd_tt": jd2_json(tt),
                    "jd_ut1": jd2_json(ut1),
                    "xp_arcsec": eop.xp_arcsec,
                    "yp_arcsec": eop.yp_arcsec,
                },
            }));
            output["frame"] = json!(to);
            output["position_m"] = json!(out);
        }
        (None, None) => {}
        _ => return Err(bad("frame and position_m go together".into())),
    }
    if eop.sha256.is_none() && eop.source.starts_with("none") {
        warnings.push(
            "no Earth-orientation values: UT1 is taken as UTC and polar motion as zero, so UT1 and any frame transform are approximate (UT1 - UTC can reach 0.9 s, about 400 m of rotation at the equator)"
                .into(),
        );
    }
    Ok(json!({
        "format": FORMAT,
        "label": LABEL,
        "engine": { "name": "kshana", "version": env!("CARGO_PKG_VERSION") },
        "input": {
            "epoch": req.epoch,
            "frame": req.frame,
            "position_m": req.position_m,
        },
        "eop": eop,
        "chain": chain,
        "output": output,
        "tolerance": { "position_m": TOL_POSITION_M, "time_s": TOL_TIME_S },
        "warnings": warnings,
    }))
}

/// The canonical bytes of a receipt: the receipt without `hash` and `signature`, as compact
/// JSON with object keys in byte order (serde_json's map is ordered) and numbers in serde_json's
/// shortest round-trip form.
pub fn canonical_bytes(receipt: &Value) -> Vec<u8> {
    let mut v = receipt.clone();
    if let Some(o) = v.as_object_mut() {
        o.remove("hash");
        o.remove("signature");
    }
    v.to_string().into_bytes()
}

/// Make a receipt. `eop_file` is `(name, bytes)` of a finals2000A file; it is used when the
/// request carries no `eop`.
pub fn make(req: &Request, eop_file: Option<(&str, &[u8])>) -> Result<Value, String> {
    let eop = match (&req.eop, eop_file) {
        (Some(e), _) => e.clone(),
        (None, Some((name, body))) => {
            let (tai, _) = tai_of(&req.epoch)?;
            eop_from_finals(name, body, jd2::tai_to_utc(tai))
        }
        (None, None) => none_eop(),
    };
    let mut body = compute(req, &eop)?;
    let h = hex::encode(Sha256::digest(canonical_bytes(&body)));
    body["hash"] = json!({ "alg": "sha256", "value": h });
    Ok(body)
}

/// One check of a verification.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Check {
    /// What was checked.
    pub check: String,
    /// Whether it passed.
    pub ok: bool,
    /// Details.
    pub detail: String,
}

/// The verification report.
#[derive(Clone, Debug, Serialize)]
pub struct VerifyReport {
    /// Every check passed.
    pub valid: bool,
    /// The checks.
    pub checks: Vec<Check>,
}

fn check(checks: &mut Vec<Check>, name: &str, ok: bool, detail: String) {
    checks.push(Check {
        check: name.into(),
        ok,
        detail,
    });
}

fn max_abs_diff(a: &Value, b: &Value, key: &str) -> Option<f64> {
    let x = a.get(key)?.as_array()?;
    let y = b.get(key)?.as_array()?;
    if x.len() != y.len() {
        return None;
    }
    x.iter()
        .zip(y)
        .map(|(p, q)| Some((p.as_f64()? - q.as_f64()?).abs()))
        .try_fold(0.0f64, |m, d| Some(m.max(d?)))
}

/// Verify a receipt: its format and hash, a recomputation from its recorded input and
/// Earth-orientation values, optionally the recorded values against a finals2000A file, and a
/// signature when present (against `trusted` keys when given).
pub fn verify(
    receipt: &Value,
    eop_file: Option<(&str, &[u8])>,
    trusted: &[[u8; 32]],
) -> VerifyReport {
    let mut checks = Vec::new();
    let fmt_ok = receipt.get("format").and_then(|f| f.as_str()) == Some(FORMAT);
    check(
        &mut checks,
        "format",
        fmt_ok,
        format!("{}", receipt.get("format").unwrap_or(&Value::Null)),
    );
    let canon = canonical_bytes(receipt);
    let want = hex::encode(Sha256::digest(&canon));
    let got = receipt
        .pointer("/hash/value")
        .and_then(|v| v.as_str())
        .unwrap_or("");
    let alg_ok = receipt.pointer("/hash/alg").and_then(|v| v.as_str()) == Some("sha256");
    check(
        &mut checks,
        "hash",
        alg_ok && got == want,
        format!("recorded {got}, computed {want}"),
    );
    // recompute
    let input = receipt.get("input").cloned().unwrap_or(Value::Null);
    let eop: Result<Eop, _> =
        serde_json::from_value(receipt.get("eop").cloned().unwrap_or_default());
    let epoch: Result<Epoch, _> =
        serde_json::from_value(input.get("epoch").cloned().unwrap_or_default());
    let frame: Option<String> = input
        .get("frame")
        .and_then(|f| f.as_str())
        .map(str::to_string);
    let position: Option<[f64; 3]> = input
        .get("position_m")
        .and_then(|p| serde_json::from_value(p.clone()).ok());
    match (eop, epoch) {
        (Ok(eop), Ok(epoch)) => {
            let req = Request {
                format: REQUEST_FORMAT.into(),
                epoch,
                frame,
                position_m: position,
                eop: Some(eop.clone()),
            };
            match compute(&req, &eop) {
                Ok(again) => {
                    let mut worst_t: f64 = 0.0;
                    let (ca, cb) = (receipt.get("chain"), again.get("chain"));
                    let steps_a = ca.and_then(|c| c.as_array()).cloned().unwrap_or_default();
                    let steps_b = cb.and_then(|c| c.as_array()).cloned().unwrap_or_default();
                    let same_shape = steps_a.len() == steps_b.len();
                    let mut models_same = same_shape;
                    for (a, b) in steps_a.iter().zip(&steps_b) {
                        if a.get("model") != b.get("model")
                            || a.get("from") != b.get("from")
                            || a.get("to") != b.get("to")
                        {
                            models_same = false;
                        }
                        if let (Some(x), Some(y)) = (
                            a.get("offset_s").and_then(|v| v.as_f64()),
                            b.get("offset_s").and_then(|v| v.as_f64()),
                        ) {
                            worst_t = worst_t.max((x - y).abs());
                        }
                    }
                    check(
                        &mut checks,
                        "models",
                        models_same,
                        "the chain's steps and model identifiers match this verifier's".into(),
                    );
                    for scale in ["TAI", "UTC", "TT", "TDB", "GPST", "BDT", "UT1"] {
                        let jd = |v: &Value| -> Option<Jd2> {
                            let e = v.pointer(&format!("/output/epochs/{scale}/jd"))?;
                            Some(Jd2::from_parts(
                                e.get("jd_day")?.as_f64()?,
                                e.get("jd_frac")?.as_f64()?,
                            ))
                        };
                        match (jd(receipt), jd(&again)) {
                            (Some(a), Some(b)) => worst_t = worst_t.max(a.diff_seconds(b).abs()),
                            _ => worst_t = f64::INFINITY,
                        }
                    }
                    check(
                        &mut checks,
                        "time",
                        worst_t <= TOL_TIME_S,
                        format!("largest difference {worst_t:e} s (tolerance {TOL_TIME_S:e} s)"),
                    );
                    let ro = receipt.get("output").cloned().unwrap_or_default();
                    let ao = again.get("output").cloned().unwrap_or_default();
                    if ao.get("position_m").is_some() || ro.get("position_m").is_some() {
                        let d = max_abs_diff(&ro, &ao, "position_m").unwrap_or(f64::INFINITY);
                        let ok = d <= TOL_POSITION_M && ro.get("frame") == ao.get("frame");
                        check(
                            &mut checks,
                            "position",
                            ok,
                            format!("largest difference {d:e} m (tolerance {TOL_POSITION_M:e} m)"),
                        );
                    }
                }
                Err(e) => check(&mut checks, "recompute", false, e),
            }
            if let Some((name, body)) = eop_file {
                let sha = hex::encode(Sha256::digest(body));
                let sha_ok = eop.sha256.as_deref() == Some(sha.as_str());
                check(
                    &mut checks,
                    "eop-file",
                    sha_ok,
                    format!("{name}: SHA-256 {sha}, recorded {:?}", eop.sha256),
                );
                if let Ok((tai, _)) = tai_of(&req_epoch(receipt)) {
                    let e = eop_from_finals(name, body, jd2::tai_to_utc(tai));
                    let d = (e.ut1_minus_utc_s - eop.ut1_minus_utc_s)
                        .abs()
                        .max((e.xp_arcsec - eop.xp_arcsec).abs())
                        .max((e.yp_arcsec - eop.yp_arcsec).abs());
                    check(
                        &mut checks,
                        "eop-values",
                        d <= 1e-12,
                        format!("largest difference from the file's values {d:e}"),
                    );
                }
            }
        }
        _ => check(
            &mut checks,
            "recompute",
            false,
            "the receipt's input or eop cannot be read".into(),
        ),
    }
    // signature
    if let Some(sig) = receipt.get("signature") {
        let alg = sig.get("alg").and_then(|v| v.as_str()) == Some("ed25519");
        let pk = sig
            .get("public_key")
            .and_then(|v| v.as_str())
            .and_then(|h| hex::decode(h).ok())
            .and_then(|b| <[u8; 32]>::try_from(b.as_slice()).ok());
        let sv = sig
            .get("value")
            .and_then(|v| v.as_str())
            .and_then(|h| hex::decode(h).ok())
            .and_then(|b| <[u8; 64]>::try_from(b.as_slice()).ok());
        let ok = match (alg, pk, sv) {
            (true, Some(pk), Some(sv)) => {
                crate::evidence::verify::verify_detached(&pk, &canon, &sv).unwrap_or(false)
            }
            _ => false,
        };
        check(
            &mut checks,
            "signature",
            ok,
            "Ed25519 over the canonical bytes".into(),
        );
        if !trusted.is_empty() {
            let t = pk.is_some_and(|k| trusted.contains(&k));
            check(
                &mut checks,
                "signer",
                t,
                "the signing key is one of the trusted keys given".into(),
            );
        }
    } else if !trusted.is_empty() {
        check(
            &mut checks,
            "signature",
            false,
            "trusted keys were given but the receipt is not signed".into(),
        );
    }
    VerifyReport {
        valid: checks.iter().all(|c| c.ok),
        checks,
    }
}

fn req_epoch(receipt: &Value) -> Epoch {
    receipt
        .pointer("/input/epoch")
        .and_then(|e| serde_json::from_value(e.clone()).ok())
        .unwrap_or(Epoch {
            scale: String::new(),
            time: String::new(),
        })
}

fn read(path: &str) -> Result<Vec<u8>, String> {
    std::fs::read(path)
        .map_err(|e| crate::terr!("e-transform-receipt-read", path = path, e = e.to_string()))
}

fn parse_json<T: serde::de::DeserializeOwned>(path: &str, b: &[u8]) -> Result<T, String> {
    serde_json::from_slice(b)
        .map_err(|e| crate::terr!("e-transform-receipt-read", path = path, e = e.to_string()))
}

/// `kshana transform-receipt make|verify ...`.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("transform-receipt-usage");
    let Some(cmd) = args.first().map(String::as_str) else {
        return Err(usage());
    };
    if matches!(cmd, "--help" | "-h" | "help") {
        println!("{}", usage());
        return Ok(());
    }
    let mut file: Option<&str> = None;
    let mut eop: Option<String> = None;
    let mut out: Option<String> = None;
    let mut trusted: Vec<[u8; 32]> = Vec::new();
    let mut i = 1;
    while i < args.len() {
        let a = args[i].as_str();
        let mut val = || {
            i += 1;
            args.get(i).cloned().ok_or_else(usage)
        };
        match a {
            "--eop" => eop = Some(val()?),
            "--out" if cmd == "make" => out = Some(val()?),
            "--trusted-key" if cmd == "verify" => {
                let h = val()?;
                let k = hex::decode(h.trim())
                    .ok()
                    .and_then(|b| <[u8; 32]>::try_from(b.as_slice()).ok())
                    .ok_or_else(|| crate::terr!("e-transform-receipt-key", key = h.clone()))?;
                trusted.push(k);
            }
            x if x.starts_with("--") => return Err(usage()),
            x if file.is_none() => file = Some(x),
            _ => return Err(usage()),
        }
        i += 1;
    }
    let file = file.ok_or_else(usage)?;
    let eop_bytes = match &eop {
        Some(p) => Some((p.as_str(), read(p)?)),
        None => None,
    };
    let eop_ref = eop_bytes.as_ref().map(|(n, b)| (*n, b.as_slice()));
    match cmd {
        "make" => {
            let req: Request = parse_json(file, &read(file)?)?;
            let r = make(&req, eop_ref)?;
            let text = serde_json::to_string_pretty(&r).map_err(|e| e.to_string())? + "\n";
            match out {
                Some(o) => std::fs::write(&o, text).map_err(|e| {
                    crate::terr!(
                        "e-transform-receipt-read",
                        path = o.clone(),
                        e = e.to_string()
                    )
                }),
                None => {
                    print!("{text}");
                    Ok(())
                }
            }
        }
        "verify" => {
            let receipt: Value = parse_json(file, &read(file)?)?;
            let rep = verify(&receipt, eop_ref, &trusted);
            println!(
                "{}",
                serde_json::to_string_pretty(&rep).map_err(|e| e.to_string())?
            );
            if rep.valid {
                Ok(())
            } else {
                Err(crate::terr!(
                    "e-transform-receipt-invalid",
                    n = rep.checks.iter().filter(|c| !c.ok).count()
                ))
            }
        }
        _ => Err(usage()),
    }
}
