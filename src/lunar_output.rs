// SPDX-License-Identifier: AGPL-3.0-only
//! A real-time output message profile for a lunar PNT receiver: `kshana.lunar-pnt-output/1`.
//!
//! One JSON object per line (JSON Lines), one line per solution epoch:
//!
//! | field | type | rule |
//! |---|---|---|
//! | `profile` | string | `kshana.lunar-pnt-output/1` |
//! | `seq` | integer | increases by one per message |
//! | `epoch` | object | `{"scale": TT\|TDB\|TCB\|TCG\|TCL\|LTC, "jd0": day (x.5), "s": seconds of the day}`, [`crate::lunar_timescale::Epoch`] |
//! | `frame` | string | `ICRF`, `MOON_PA_DE440`, `MOON_PA`, `MOON_ME` or `ILURF` ([`crate::lunar_frames::Frame`]); lunar-centred |
//! | `position_m` | 3 numbers | lunar-centred, magnitude 1,600 km to 1,000,000 km |
//! | `velocity_m_s` | 3 numbers, optional | magnitude under 20 km/s |
//! | `clock_bias_s`, `clock_drift` | numbers, optional | receiver clock against the epoch's scale |
//! | `covariance_upper` | 6 or 21 numbers, optional | upper triangle, row by row, of the position (m²) or position-velocity covariance; positive semi-definite |
//! | `sources` | array, optional | `{"node_id", "q_prn" (1-210), "cn0_dbhz" (0-60)}`, PRNs distinct |
//! | `solution` | string | `fix`, `float`, `propagated` or `none` |
//! | `integrity` | object, optional | `{"status": nominal\|degraded\|unmonitored, "hpl_m", "vpl_m"}`, levels positive |
//!
//! The epoch carries its scale, so a consumer that wants another scale re-expresses it
//! ([`reexpress`], through [`crate::lunar_timescale::convert`]); the position carries its frame,
//! re-expressed through [`crate::lunar_frames::transform`] (velocity rotated alike; the frames'
//! own rotation rate is not added, stated). The profile is kshana's own: no lunar output message
//! standard was read for it, and nothing here claims conformance to one.
//!
//! MODELLED: a message profile and its validator.

use crate::lunar_frames::{self, Frame};
use crate::lunar_timescale::{self as ts, Epoch, Scale};
use serde::Serialize;
use serde_json::{json, Value};

/// The profile id.
pub const PROFILE: &str = "kshana.lunar-pnt-output/1";

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// Line (1-based).
    pub line: usize,
    /// The field.
    pub field: &'static str,
    /// What is wrong.
    pub rule: &'static str,
}

/// The check report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// The profile checked against.
    pub profile: &'static str,
    /// Messages read.
    pub messages: usize,
    /// Findings.
    pub findings: Vec<Finding>,
    /// True when there are none.
    pub valid: bool,
}

fn scale_of(v: &Value) -> Option<Scale> {
    Scale::parse(v.as_str()?)
}

fn vec3(v: &Value) -> Option<[f64; 3]> {
    let a = v.as_array()?;
    if a.len() != 3 {
        return None;
    }
    let mut out = [0.0; 3];
    for (o, x) in out.iter_mut().zip(a) {
        *o = x.as_f64().filter(|f| f.is_finite())?;
    }
    Some(out)
}

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Whether the upper triangle `u` of an `n × n` matrix is positive semi-definite (an LDLᵀ with a
/// small tolerance).
fn psd_upper(u: &[f64], n: usize) -> bool {
    let mut a = vec![vec![0.0; n]; n];
    let mut idx = (0..n).flat_map(|i| (i..n).map(move |j| (i, j)));
    for &x in u {
        let Some((i, j)) = idx.next() else { break };
        a[i][j] = x;
        a[j][i] = x;
    }
    let scale = (0..n)
        .map(|i| a[i][i].abs())
        .fold(0.0, f64::max)
        .max(1e-300);
    for i in 0..n {
        let d = a[i][i];
        if d < -1e-12 * scale {
            return false;
        }
        if d.abs() <= 1e-12 * scale {
            if (i + 1..n).any(|r| a[r][i].abs() > 1e-9 * scale) {
                return false;
            }
            continue;
        }
        let col: Vec<f64> = (0..n).map(|r| a[r][i]).collect();
        for r in i + 1..n {
            for c in i + 1..n {
                a[r][c] -= col[r] * col[c] / d;
            }
        }
    }
    true
}

/// Check one message.
pub fn check_message(v: &Value, line: usize, prev: Option<(i64, Epoch)>, out: &mut Vec<Finding>) {
    let mut bad = |field: &'static str, rule: &'static str| out.push(Finding { line, field, rule });
    if v["profile"] != PROFILE {
        bad("profile", "must be kshana.lunar-pnt-output/1");
    }
    match v["seq"].as_i64() {
        None => bad("seq", "must be an integer"),
        Some(s) => {
            if let Some((p, _)) = prev {
                if s != p + 1 {
                    bad("seq", "must increase by one");
                }
            }
        }
    }
    let e = &v["epoch"];
    match (scale_of(&e["scale"]), e["jd0"].as_f64(), e["s"].as_f64()) {
        (Some(sc), Some(jd0), Some(s)) => {
            if (jd0 - 0.5).fract() != 0.0 {
                bad("epoch.jd0", "must be a whole day plus one half");
            }
            if !(0.0..86_400.0).contains(&s) {
                bad("epoch.s", "must be in [0, 86400)");
            }
            if let Some((_, pe)) = prev {
                let here = Epoch { scale: sc, jd0, s };
                if pe.scale == sc && (here.jd0 - pe.jd0) * 86_400.0 + here.s - pe.s <= 0.0 {
                    bad("epoch", "must increase");
                }
            }
        }
        _ => bad("epoch", "needs a known scale, jd0 and s"),
    }
    if v["frame"].as_str().and_then(Frame::parse).is_none() {
        bad("frame", "must be a known lunar frame");
    }
    match vec3(&v["position_m"]) {
        None => bad("position_m", "must be three finite numbers"),
        Some(p) => {
            let r = norm(p);
            if !(1.6e6..=1.0e9).contains(&r) {
                bad("position_m", "magnitude must be 1,600 km to 1,000,000 km");
            }
        }
    }
    if !v["velocity_m_s"].is_null() {
        match vec3(&v["velocity_m_s"]) {
            Some(u) if norm(u) < 20_000.0 => {}
            _ => bad("velocity_m_s", "must be three finite numbers under 20 km/s"),
        }
    }
    for f in ["clock_bias_s", "clock_drift"] {
        if !v[f].is_null() && v[f].as_f64().is_none_or(|x| !x.is_finite()) {
            bad(
                if f == "clock_bias_s" {
                    "clock_bias_s"
                } else {
                    "clock_drift"
                },
                "must be a finite number",
            );
        }
    }
    if !v["covariance_upper"].is_null() {
        let c: Option<Vec<f64>> = v["covariance_upper"].as_array().and_then(|a| {
            a.iter()
                .map(|x| x.as_f64().filter(|f| f.is_finite()))
                .collect()
        });
        match c {
            Some(c) if c.len() == 6 || c.len() == 21 => {
                if !psd_upper(&c, if c.len() == 6 { 3 } else { 6 }) {
                    bad("covariance_upper", "must be positive semi-definite");
                }
            }
            _ => bad("covariance_upper", "must be 6 or 21 finite numbers"),
        }
    }
    if !v["sources"].is_null() {
        match v["sources"].as_array() {
            None => bad("sources", "must be an array"),
            Some(a) => {
                let mut seen = Vec::new();
                for s in a {
                    let prn = s["q_prn"].as_u64().unwrap_or(0);
                    if !(1..=210).contains(&prn) {
                        bad("sources.q_prn", "must be 1 to 210");
                    } else if seen.contains(&prn) {
                        bad("sources.q_prn", "must be distinct");
                    }
                    seen.push(prn);
                    if s["node_id"].as_u64().is_none() {
                        bad("sources.node_id", "must be an integer");
                    }
                    if !s["cn0_dbhz"].is_null()
                        && !s["cn0_dbhz"]
                            .as_f64()
                            .is_some_and(|c| (0.0..=60.0).contains(&c))
                    {
                        bad("sources.cn0_dbhz", "must be 0 to 60");
                    }
                }
            }
        }
    }
    if !matches!(
        v["solution"].as_str(),
        Some("fix" | "float" | "propagated" | "none")
    ) {
        bad("solution", "must be fix, float, propagated or none");
    }
    let i = &v["integrity"];
    if !i.is_null() {
        if !matches!(
            i["status"].as_str(),
            Some("nominal" | "degraded" | "unmonitored")
        ) {
            bad(
                "integrity.status",
                "must be nominal, degraded or unmonitored",
            );
        }
        for f in ["hpl_m", "vpl_m"] {
            if !i[f].is_null() && !i[f].as_f64().is_some_and(|x| x > 0.0 && x.is_finite()) {
                bad(
                    if f == "hpl_m" {
                        "integrity.hpl_m"
                    } else {
                        "integrity.vpl_m"
                    },
                    "must be positive",
                );
            }
        }
    }
}

/// Check a JSON Lines stream.
pub fn check(text: &str) -> Report {
    let mut findings = Vec::new();
    let mut prev: Option<(i64, Epoch)> = None;
    let mut n = 0usize;
    for (k, l) in text.lines().enumerate() {
        if l.trim().is_empty() {
            continue;
        }
        n += 1;
        let line = k + 1;
        let Ok(v) = serde_json::from_str::<Value>(l) else {
            findings.push(Finding {
                line,
                field: "message",
                rule: "must be one JSON object",
            });
            continue;
        };
        check_message(&v, line, prev, &mut findings);
        if let (Some(s), Some(sc), Some(jd0), Some(sec)) = (
            v["seq"].as_i64(),
            scale_of(&v["epoch"]["scale"]),
            v["epoch"]["jd0"].as_f64(),
            v["epoch"]["s"].as_f64(),
        ) {
            prev = Some((
                s,
                Epoch {
                    scale: sc,
                    jd0,
                    s: sec,
                },
            ));
        }
    }
    Report {
        schema: "kshana.lunar-pnt-output-check/1",
        profile: PROFILE,
        messages: n,
        valid: findings.is_empty(),
        findings,
    }
}

/// An example stream: a user at rest on the lunar surface (in `MOON_ME`), `n` messages one
/// second apart from `jd0` in TCL. Synthetic, for testing decoders and validators.
pub fn example(n: usize, jd0: f64) -> String {
    let mut out = String::new();
    for k in 0..n {
        let e = Epoch::from_jd(Scale::Tcl, jd0 + k as f64 / 86_400.0);
        let m = json!({
            "profile": PROFILE,
            "seq": k,
            "epoch": {"scale": "TCL", "jd0": e.jd0, "s": e.s},
            "frame": "MOON_ME",
            "position_m": [1_737_400.0, 0.0, 0.0],
            "velocity_m_s": [0.0, 0.0, 0.0],
            "clock_bias_s": 1.0e-6 + 1.0e-9 * k as f64,
            "clock_drift": 1.0e-9,
            "covariance_upper": [25.0, 0.0, 0.0, 25.0, 0.0, 100.0],
            "sources": [
                {"node_id": 1, "q_prn": 1, "cn0_dbhz": 41.0},
                {"node_id": 2, "q_prn": 2, "cn0_dbhz": 39.5},
                {"node_id": 3, "q_prn": 3, "cn0_dbhz": 37.0},
                {"node_id": 4, "q_prn": 4, "cn0_dbhz": 35.5}
            ],
            "solution": "fix",
            "integrity": {"status": "unmonitored"},
            "label": "synthetic example (kshana lunar-afs-kit output-example), not a receiver's output"
        });
        out.push_str(&m.to_string());
        out.push('\n');
    }
    out
}

/// Re-express a message in another scale and frame: the epoch through
/// [`crate::lunar_timescale::convert`], the position and velocity through
/// [`crate::lunar_frames::transform`] at the epoch's TDB date (the zero-datum ILuRF placeholder).
pub fn reexpress(v: &Value, scale: Scale, frame: Frame) -> Result<Value, String> {
    let span = || crate::terr!("e-lunar-ref-out-of-span");
    let bad = || crate::terr!("e-lunar-afs-kit-bad-message");
    let sc = scale_of(&v["epoch"]["scale"]).ok_or_else(bad)?;
    let e = Epoch {
        scale: sc,
        jd0: v["epoch"]["jd0"].as_f64().ok_or_else(bad)?,
        s: v["epoch"]["s"].as_f64().ok_or_else(bad)?,
    };
    let from = v["frame"].as_str().and_then(Frame::parse).ok_or_else(bad)?;
    let out_e = ts::convert(e, scale).ok_or_else(span)?;
    let tdb = ts::convert(e, Scale::Tdb).ok_or_else(span)?;
    let p = vec3(&v["position_m"]).ok_or_else(bad)?;
    let tp = lunar_frames::transform(from, frame, p, tdb.jd(), &lunar_frames::PLACEHOLDER)?;
    let mut m = v.clone();
    m["epoch"] = json!({"scale": scale.name(), "jd0": out_e.jd0, "s": out_e.s});
    m["frame"] = json!(frame.name());
    m["position_m"] = json!(tp.output_m);
    if let Some(u) = vec3(&v["velocity_m_s"]) {
        let tv = lunar_frames::transform(from, frame, u, tdb.jd(), &lunar_frames::PLACEHOLDER)?;
        m["velocity_m_s"] = json!(tv.output_m);
    }
    if m.get("covariance_upper").is_some() && from != frame {
        // A rotated covariance needs the full matrix; drop it rather than carry it unrotated.
        m.as_object_mut().map(|o| o.remove("covariance_upper"));
    }
    Ok(m)
}

#[cfg(test)]
mod tests {
    use super::*;

    const JD: f64 = 2_460_676.5;

    #[test]
    fn the_example_stream_is_valid() {
        let r = check(&example(5, JD));
        assert_eq!(r.messages, 5);
        assert!(r.valid, "{:?}", r.findings);
    }

    #[test]
    fn broken_messages_are_named() {
        let mut lines: Vec<Value> = example(3, JD)
            .lines()
            .map(|l| serde_json::from_str(l).unwrap())
            .collect();
        lines[1]["seq"] = json!(7);
        lines[1]["frame"] = json!("MOON_XY");
        lines[2]["covariance_upper"] = json!([1.0, 5.0, 0.0, 1.0, 0.0, 1.0]);
        lines[2]["sources"][1]["q_prn"] = json!(1);
        lines[2]["epoch"]["s"] = json!(90_000.0);
        let text: String = lines
            .iter()
            .map(|v| v.to_string() + "\n")
            .collect::<String>()
            + "not json\n";
        let r = check(&text);
        let got: Vec<(usize, &str)> = r.findings.iter().map(|f| (f.line, f.field)).collect();
        for want in [
            (2, "seq"),
            (2, "frame"),
            (3, "covariance_upper"),
            (3, "sources.q_prn"),
            (3, "epoch.s"),
            (4, "message"),
        ] {
            assert!(got.contains(&want), "{want:?} not in {got:?}");
        }
        assert!(!r.valid);
    }

    #[test]
    fn reexpressing_round_trips() {
        let v: Value = serde_json::from_str(example(1, JD).lines().next().unwrap()).unwrap();
        let a = reexpress(&v, Scale::Tt, Frame::Icrf).unwrap();
        assert_eq!(a["epoch"]["scale"], "TT");
        assert_eq!(a["frame"], "ICRF");
        assert!(a.get("covariance_upper").is_none());
        let b = reexpress(&a, Scale::Tcl, Frame::MoonMe).unwrap();
        let p = vec3(&b["position_m"]).unwrap();
        assert!((p[0] - 1_737_400.0).abs() < 1e-3 && p[1].abs() < 1e-3);
        let ds = (b["epoch"]["jd0"].as_f64().unwrap() - JD) * 86_400.0
            + b["epoch"]["s"].as_f64().unwrap();
        assert!(ds.abs() < 2e-6, "{ds}");
        // TCL runs (L_B - L_CL) ≈ 6.8e-9 faster than TT on average: about a second by 2025.
        let dt = (a["epoch"]["jd0"].as_f64().unwrap() - JD) * 86_400.0
            + a["epoch"]["s"].as_f64().unwrap();
        assert!(dt.abs() > 0.5 && dt.abs() < 2.0, "{dt}");
    }

    #[test]
    fn psd_check() {
        assert!(psd_upper(&[4.0, 0.0, 0.0, 9.0, 0.0, 1.0], 3));
        assert!(!psd_upper(&[1.0, 5.0, 0.0, 1.0, 0.0, 1.0], 3));
        assert!(psd_upper(&[0.0, 0.0, 0.0, 1.0, 0.0, 1.0], 3));
    }
}
