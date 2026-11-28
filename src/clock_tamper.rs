// SPDX-License-Identifier: AGPL-3.0-only
//! Independent clock-tamper detector (`kshana clock-tamper`, docs/CLOCK-TAMPER.md).
//!
//! An audit trail records each event with the time of the computer's own clock, so a person who
//! can set that clock back can make a later run look earlier. This module checks the OS clock of
//! one computer against readings that do not come from it: offsets measured against two or more
//! independent time references (for example an authenticated NTS server, a local
//! GNSS-disciplined NTP server) and RFC 3161 timestamp tokens from a time-stamping authority.
//! It reads a sample file a collector wrote and reports, per UTC day:
//!
//! * **steps**: the OS clock moved by more than `step_s` against the monotonic clock between two
//!   samples (`step-back` when it went back, `step-forward` otherwise), with whether the
//!   references saw the same jump and whether the OS logged a clock change near it;
//! * **logged clock changes**: the clock-change events the collector copied from the OS log
//!   (for example Windows Security event 4616, a systemd "Time has been changed" entry), with any
//!   that no step explains;
//! * **offset**: the median reference offset beyond `max_offset_s`;
//! * **drift**: the slope of the median reference offset against the monotonic clock, between
//!   steps, beyond `max_drift_ppm`;
//! * **references**: fewer than `min_agreeing_references` references within
//!   `reference_agreement_s` of their median;
//! * **timestamp tokens**: a token's `genTime` minus the OS time at the request, beyond
//!   `max_offset_s + tsa_tolerance_s`.
//!
//! Sign convention: an offset is reference time minus OS time (s), so a clock set back by 3600 s
//! shows a reference offset that jumps by +3600 s.
//!
//! The report records the SHA-256 of every input. It is **not signed** here; it can be placed in
//! a signed `kshana evidence` pack. The tokens' `genTime` and imprint are read
//! ([`crate::evidence::tsr::parse_token`]); the authority's signature on them is not verified
//! by this command (verify it with `openssl ts -verify` against the authority's certificate).
//!
//! **Evidence: MODELLED.** The verdicts are only as independent as the readings: offsets
//! measured on the same computer by software an administrator controls can be falsified with
//! it. A finding is a pointer for a person to examine, not proof of intent or of a record's
//! falsification, and "no findings" is not proof that the clock was never changed.

use std::collections::BTreeMap;

use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// Sample-file format tag.
pub const INPUT_FORMAT: &str = "kshana.clock-samples/1";
/// Report format tag.
pub const FORMAT: &str = "kshana.clock-tamper-report/1";
/// What the report is not.
pub const DISCLAIMER: &str = "MODELLED: a comparison of the OS clock with the reference readings and timestamp tokens in the input. A finding is a pointer for a person to examine, not proof of intent or of a falsified record; no findings is not proof that the clock was never changed. The readings are only as independent as the way they were collected. Unsigned; place it in a signed evidence pack to protect it.";

/// Thresholds (inputs; each has a stated default).
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Thresholds {
    /// A jump of the OS clock against the monotonic clock larger than this is a step (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// A median reference offset larger than this is a finding (s).
    #[serde(default = "d_offset")]
    pub max_offset_s: f64,
    /// A drift larger than this is a finding (ppm).
    #[serde(default = "d_drift")]
    pub max_drift_ppm: f64,
    /// References within this of their median agree (s).
    #[serde(default = "d_agree")]
    pub reference_agreement_s: f64,
    /// At least this many references must agree in each sample.
    #[serde(default = "d_min_refs")]
    pub min_agreeing_references: usize,
    /// Added to `max_offset_s` for timestamp tokens (the authority's stated accuracy) (s).
    #[serde(default = "d_tsa")]
    pub tsa_tolerance_s: f64,
    /// A logged clock change within this of a step explains it (s).
    #[serde(default = "d_event")]
    pub event_window_s: f64,
    /// Drift is fitted only over spans of at least this long (s).
    #[serde(default = "d_span")]
    pub min_drift_span_s: f64,
}

fn d_step() -> f64 {
    0.5
}
fn d_offset() -> f64 {
    1.0
}
fn d_drift() -> f64 {
    50.0
}
fn d_agree() -> f64 {
    0.1
}
fn d_min_refs() -> usize {
    2
}
fn d_tsa() -> f64 {
    1.0
}
fn d_event() -> f64 {
    300.0
}
fn d_span() -> f64 {
    3600.0
}

impl Default for Thresholds {
    fn default() -> Self {
        Self {
            step_s: d_step(),
            max_offset_s: d_offset(),
            max_drift_ppm: d_drift(),
            reference_agreement_s: d_agree(),
            min_agreeing_references: d_min_refs(),
            tsa_tolerance_s: d_tsa(),
            event_window_s: d_event(),
            min_drift_span_s: d_span(),
        }
    }
}

/// One reference reading.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Reading {
    /// Reference id (`nts:ptb`, `gnss-lab`).
    pub id: String,
    /// `nts`, `ntp`, `ntp-gnss`, `ptp`, `gnss`, `other`.
    pub kind: String,
    /// Reference time minus OS time (s).
    pub offset_s: f64,
    /// Whether the exchange was authenticated (NTS, symmetric key); as the collector stated it.
    #[serde(default)]
    pub authenticated: bool,
}

/// One sample: the OS time, the monotonic clock and the reference readings at that moment.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Sample {
    /// OS wall-clock time, RFC 3339 UTC.
    pub os_utc: String,
    /// Monotonic clock (s since an arbitrary origin; must not decrease). Optional.
    #[serde(default)]
    pub monotonic_s: Option<f64>,
    /// Boot identifier: the monotonic clock restarts when it changes.
    #[serde(default)]
    pub boot_id: Option<String>,
    /// Reference readings.
    #[serde(default)]
    pub references: Vec<Reading>,
}

/// A clock-change event copied from the OS log.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Event {
    /// OS time of the event, RFC 3339 UTC (as logged, i.e. by the clock being checked).
    pub os_utc: String,
    /// What it is (`clock-set`, `timezone-change`, `time-service-stopped`).
    pub kind: String,
    /// Account, source and event id, as logged.
    #[serde(default)]
    pub detail: String,
}

/// A timestamp token and the OS time at which it was requested.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct TokenRef {
    /// DER token file (`.tsr`), relative to the sample file.
    pub token: String,
    /// OS time when the request was sent, RFC 3339 UTC.
    pub os_utc_at_request: String,
}

/// The sample file.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Samples {
    /// [`INPUT_FORMAT`].
    pub format: String,
    /// The computer, as named by the collector.
    pub host: String,
    /// Thresholds.
    #[serde(default)]
    pub thresholds: Thresholds,
    /// Samples (any order; sorted by OS time within a boot, by monotonic time where given).
    pub samples: Vec<Sample>,
    /// Clock-change events from the OS log.
    #[serde(default)]
    pub events: Vec<Event>,
    /// Timestamp tokens.
    #[serde(default)]
    pub timestamp_tokens: Vec<TokenRef>,
}

/// One input and its hash.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct InputHash {
    /// Name as given.
    pub input: String,
    /// SHA-256 of the bytes read.
    pub sha256: String,
}

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// `step-back`, `step-forward`, `unexplained-clock-change`, `offset`, `drift`,
    /// `references-disagree`, `token-offset`.
    pub kind: &'static str,
    /// OS time it was found at (RFC 3339 UTC).
    pub os_utc: String,
    /// Size: the step (s), offset (s), drift (ppm) or number of agreeing references.
    pub value: f64,
    /// The threshold it was compared with.
    pub threshold: f64,
    /// What was seen.
    pub detail: String,
}

/// One UTC day.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Day {
    /// `YYYY-MM-DD` (OS time).
    pub date: String,
    /// Samples that day.
    pub samples: usize,
    /// Distinct reference ids seen.
    pub references: Vec<String>,
    /// Of those, the ones read with authentication.
    pub authenticated_references: Vec<String>,
    /// Largest |median offset| (s).
    pub max_abs_offset_s: Option<f64>,
    /// Largest |drift| fitted over a span of the day (ppm).
    pub max_abs_drift_ppm: Option<f64>,
    /// Logged clock changes.
    pub clock_change_events: usize,
    /// Timestamp tokens.
    pub tokens: usize,
    /// Findings, in time order.
    pub findings: Vec<Finding>,
    /// `no-findings` or `findings`.
    pub verdict: &'static str,
}

/// The report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// [`FORMAT`].
    pub format: &'static str,
    /// `MODELLED`.
    pub label: &'static str,
    /// `unsigned`.
    pub signature: &'static str,
    /// [`DISCLAIMER`].
    pub disclaimer: &'static str,
    /// The host.
    pub host: String,
    /// Inputs and hashes.
    pub inputs: Vec<InputHash>,
    /// Thresholds used.
    pub thresholds: Thresholds,
    /// Per day.
    pub days: Vec<Day>,
    /// Findings over all days.
    pub findings: usize,
}

/// Seconds since 1970 of an RFC 3339 UTC time (`Z` or `+00:00`; fractional seconds kept).
pub fn parse_utc(s: &str) -> Option<f64> {
    let s = s.trim();
    let s = s
        .strip_suffix('Z')
        .or_else(|| s.strip_suffix("+00:00"))
        .unwrap_or(s);
    let (date, time) = s.split_once(['T', ' '])?;
    let day = crate::utc_readiness::parse_date(date)?;
    if crate::utc_readiness::civil_from_days(day) != date {
        return None;
    }
    let mut it = time.splitn(3, ':');
    let h: f64 = it.next()?.parse().ok()?;
    let m: f64 = it.next()?.parse().ok()?;
    let sec: f64 = it.next()?.parse().ok()?;
    if !(0.0..24.0).contains(&h) || !(0.0..60.0).contains(&m) || !(0.0..61.0).contains(&sec) {
        return None;
    }
    Some(day as f64 * 86_400.0 + h * 3600.0 + m * 60.0 + sec)
}

/// RFC 3339 UTC text of seconds since 1970 (millisecond precision).
pub fn format_utc(t: f64) -> String {
    let ms = (t * 1000.0).round() as i64;
    let day = ms.div_euclid(86_400_000);
    let r = ms.rem_euclid(86_400_000);
    format!(
        "{}T{:02}:{:02}:{:02}.{:03}Z",
        crate::utc_readiness::civil_from_days(day),
        r / 3_600_000,
        r / 60_000 % 60,
        r / 1000 % 60,
        r % 1000
    )
}

fn median(v: &mut [f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        (v[n / 2 - 1] + v[n / 2]) / 2.0
    })
}

/// Least-squares slope of `y` on `x`.
pub fn slope(pts: &[(f64, f64)]) -> Option<f64> {
    if pts.len() < 2 {
        return None;
    }
    let n = pts.len() as f64;
    let mx = pts.iter().map(|p| p.0).sum::<f64>() / n;
    let my = pts.iter().map(|p| p.1).sum::<f64>() / n;
    let sxx: f64 = pts.iter().map(|p| (p.0 - mx).powi(2)).sum();
    let sxy: f64 = pts.iter().map(|p| (p.0 - mx) * (p.1 - my)).sum();
    (sxx > 0.0).then(|| sxy / sxx)
}

struct Pt {
    os: f64,
    mono: Option<f64>,
    boot: Option<String>,
    med: Option<f64>,
}

/// Parse a sample file.
pub fn parse_samples(text: &str) -> Result<Samples, String> {
    let s: Samples = serde_json::from_str(text).map_err(|e| e.to_string())?;
    if s.format != INPUT_FORMAT {
        return Err(crate::terr!(
            "e-clock-tamper-format",
            found = format!("{:?}", s.format),
            expected = INPUT_FORMAT
        ));
    }
    if s.samples.is_empty() {
        return Err("no samples".into());
    }
    let t = &s.thresholds;
    for (n, v) in [
        ("step_s", t.step_s),
        ("max_offset_s", t.max_offset_s),
        ("max_drift_ppm", t.max_drift_ppm),
        ("reference_agreement_s", t.reference_agreement_s),
        ("tsa_tolerance_s", t.tsa_tolerance_s),
        ("event_window_s", t.event_window_s),
        ("min_drift_span_s", t.min_drift_span_s),
    ] {
        if !(v.is_finite() && v >= 0.0) {
            return Err(crate::terr!("e-clock-tamper-threshold", name = n));
        }
    }
    for x in &s.samples {
        parse_utc(&x.os_utc).ok_or_else(|| {
            crate::terr!(
                "e-clock-tamper-bad-time",
                field = "os_utc",
                value = x.os_utc.clone()
            )
        })?;
        if x.references.iter().any(|r| !r.offset_s.is_finite())
            || x.monotonic_s.is_some_and(|m| !m.is_finite())
        {
            return Err(crate::terr!(
                "e-clock-tamper-non-finite",
                at = x.os_utc.clone()
            ));
        }
    }
    for e in &s.events {
        parse_utc(&e.os_utc).ok_or_else(|| {
            crate::terr!(
                "e-clock-tamper-bad-time",
                field = "events[].os_utc",
                value = e.os_utc.clone()
            )
        })?;
    }
    for k in &s.timestamp_tokens {
        parse_utc(&k.os_utc_at_request).ok_or_else(|| {
            crate::terr!(
                "e-clock-tamper-bad-time",
                field = "os_utc_at_request",
                value = k.os_utc_at_request.clone()
            )
        })?;
    }
    Ok(s)
}

/// Run the checks. `name`/`bytes` are the sample file; `tokens` are the token files' names and
/// bytes, in the order of `timestamp_tokens`.
pub fn analyse(name: &str, bytes: &[u8], tokens: &[(String, Vec<u8>)]) -> Result<Report, String> {
    let s = parse_samples(&String::from_utf8_lossy(bytes))?;
    let th = s.thresholds.clone();
    let sha = |b: &[u8]| hex::encode(Sha256::digest(b));
    let mut inputs = vec![InputHash {
        input: name.to_string(),
        sha256: sha(bytes),
    }];
    let mut days: BTreeMap<String, Day> = BTreeMap::new();
    let date_of = |t: f64| crate::utc_readiness::civil_from_days((t / 86_400.0).floor() as i64);
    fn get<'a>(days: &'a mut BTreeMap<String, Day>, d: &str) -> &'a mut Day {
        days.get_mut(d).expect("day inserted before use")
    }
    let ensure = |days: &mut BTreeMap<String, Day>, t: f64| -> String {
        let d = date_of(t);
        days.entry(d.clone()).or_insert_with(|| Day {
            date: d.clone(),
            samples: 0,
            references: Vec::new(),
            authenticated_references: Vec::new(),
            max_abs_offset_s: None,
            max_abs_drift_ppm: None,
            clock_change_events: 0,
            tokens: 0,
            findings: Vec::new(),
            verdict: "no-findings",
        });
        d
    };

    // Samples in collection order: by boot, then monotonic time where given, else OS time.
    let mut pts: Vec<Pt> = Vec::new();
    for x in &s.samples {
        let os = parse_utc(&x.os_utc).unwrap_or(0.0);
        let mut offs: Vec<f64> = x.references.iter().map(|r| r.offset_s).collect();
        let med = median(&mut offs);
        let d = ensure(&mut days, os);
        let dd = get(&mut days, &d);
        dd.samples += 1;
        for r in &x.references {
            if !dd.references.contains(&r.id) {
                dd.references.push(r.id.clone());
            }
            if r.authenticated && !dd.authenticated_references.contains(&r.id) {
                dd.authenticated_references.push(r.id.clone());
            }
        }
        if let Some(m) = med {
            let agreeing = x
                .references
                .iter()
                .filter(|r| (r.offset_s - m).abs() <= th.reference_agreement_s)
                .count();
            dd.max_abs_offset_s = Some(dd.max_abs_offset_s.unwrap_or(0.0).max(m.abs()));
            if agreeing < th.min_agreeing_references {
                dd.findings.push(Finding {
                    kind: "references-disagree",
                    os_utc: x.os_utc.clone(),
                    value: agreeing as f64,
                    threshold: th.min_agreeing_references as f64,
                    detail: format!(
                        "{agreeing} of {} references within {} s of the median offset {m:.6} s",
                        x.references.len(),
                        th.reference_agreement_s
                    ),
                });
            }
            if m.abs() > th.max_offset_s {
                dd.findings.push(Finding {
                    kind: "offset",
                    os_utc: x.os_utc.clone(),
                    value: m,
                    threshold: th.max_offset_s,
                    detail: format!("median reference offset {m:.6} s (reference minus OS time)"),
                });
            }
        } else {
            dd.findings.push(Finding {
                kind: "references-disagree",
                os_utc: x.os_utc.clone(),
                value: 0.0,
                threshold: th.min_agreeing_references as f64,
                detail: "no reference reading in this sample".into(),
            });
        }
        pts.push(Pt {
            os,
            mono: x.monotonic_s,
            boot: x.boot_id.clone(),
            med,
        });
    }
    let all_mono = pts.iter().all(|p| p.mono.is_some());
    if all_mono {
        pts.sort_by(|a, b| {
            a.boot
                .cmp(&b.boot)
                .then(a.mono.unwrap_or(0.0).total_cmp(&b.mono.unwrap_or(0.0)))
        });
    }
    // Steps and the spans between them.
    let events: Vec<(f64, &Event)> = s
        .events
        .iter()
        .map(|e| (parse_utc(&e.os_utc).unwrap_or(0.0), e))
        .collect();
    let mut explained = vec![false; events.len()];
    let mut spans: Vec<Vec<usize>> = vec![vec![0]];
    for i in 1..pts.len() {
        let (a, b) = (&pts[i - 1], &pts[i]);
        let same_boot = a.boot == b.boot;
        // The jump of the OS clock against an independent count of elapsed time: the monotonic
        // clock within a boot, else the references' own time.
        let jump = match (a.mono, b.mono, a.med, b.med) {
            (Some(ma), Some(mb), _, _) if same_boot => Some((b.os - a.os) - (mb - ma)),
            (_, _, Some(oa), Some(ob)) => Some(-(ob - oa)),
            _ => None,
        };
        let Some(jump) = jump.filter(|j| j.abs() > th.step_s) else {
            if same_boot {
                if let Some(s) = spans.last_mut() {
                    s.push(i);
                }
            } else {
                spans.push(vec![i]);
            }
            continue;
        };
        spans.push(vec![i]);
        let seen_by_refs = match (a.med, b.med) {
            (Some(oa), Some(ob)) => {
                if ((ob - oa) + jump).abs() <= th.step_s {
                    "the references saw the same jump"
                } else {
                    "the references did not see the same jump"
                }
            }
            _ => "no reference reading on both sides",
        };
        let mut near = Vec::new();
        for (k, (t, e)) in events.iter().enumerate() {
            // The event is logged on the clock being checked: near the step on either side.
            if (*t - b.os).abs() <= th.event_window_s || (*t - a.os).abs() <= th.event_window_s {
                explained[k] = true;
                near.push(
                    format!("{} {} {}", e.os_utc, e.kind, e.detail)
                        .trim()
                        .to_string(),
                );
            }
        }
        let logged = if near.is_empty() {
            "no clock change logged within the window".to_string()
        } else {
            format!("logged: {}", near.join("; "))
        };
        let d = ensure(&mut days, b.os);
        get(&mut days, &d).findings.push(Finding {
            kind: if jump < 0.0 { "step-back" } else { "step-forward" },
            os_utc: format_utc(b.os),
            value: jump,
            threshold: th.step_s,
            detail: format!(
                "OS clock moved {jump:+.3} s against {} between {} and {}; {seen_by_refs}; {logged}",
                if a.mono.is_some() && b.mono.is_some() && same_boot {
                    "the monotonic clock"
                } else {
                    "the references"
                },
                format_utc(a.os),
                format_utc(b.os)
            ),
        });
    }
    for (k, (t, e)) in events.iter().enumerate() {
        let d = ensure(&mut days, *t);
        let dd = get(&mut days, &d);
        dd.clock_change_events += 1;
        if !explained[k] {
            dd.findings.push(Finding {
                kind: "unexplained-clock-change",
                os_utc: e.os_utc.clone(),
                value: 0.0,
                threshold: th.event_window_s,
                detail: format!(
                    "logged {} ({}) with no step in the samples within {} s (no sample nearby, or a change smaller than step_s)",
                    e.kind, e.detail, th.event_window_s
                ),
            });
        }
    }
    // Drift over each span, per day.
    for span in &spans {
        let p: Vec<&Pt> = span.iter().map(|&i| &pts[i]).collect();
        let mut by_day: BTreeMap<String, Vec<(f64, f64, f64)>> = BTreeMap::new();
        for x in &p {
            if let Some(m) = x.med {
                by_day
                    .entry(date_of(x.os))
                    .or_default()
                    .push((x.mono.unwrap_or(x.os), m, x.os));
            }
        }
        for (d, v) in by_day {
            let span_s =
                v.last().map(|l| l.0).unwrap_or(0.0) - v.first().map(|f| f.0).unwrap_or(0.0);
            if span_s < th.min_drift_span_s {
                continue;
            }
            let xy: Vec<(f64, f64)> = v.iter().map(|q| (q.0, q.1)).collect();
            let Some(k) = slope(&xy) else { continue };
            // Offset = ref − OS grows when the OS clock runs slow; drift > 0 means OS runs fast.
            let ppm = -k * 1e6;
            let dd = get(&mut days, &d);
            dd.max_abs_drift_ppm = Some(dd.max_abs_drift_ppm.unwrap_or(0.0).max(ppm.abs()));
            if ppm.abs() > th.max_drift_ppm {
                dd.findings.push(Finding {
                    kind: "drift",
                    os_utc: format_utc(v.last().map(|l| l.2).unwrap_or(0.0)),
                    value: ppm,
                    threshold: th.max_drift_ppm,
                    detail: format!(
                        "OS clock rate {ppm:+.3} ppm against the references over {span_s:.0} s (positive: runs fast)"
                    ),
                });
            }
        }
    }
    // Timestamp tokens.
    for (k, tr) in s.timestamp_tokens.iter().enumerate() {
        let (tn, tb) = tokens
            .get(k)
            .ok_or_else(|| crate::terr!("e-clock-tamper-token-unread", token = tr.token.clone()))?;
        inputs.push(InputHash {
            input: tn.clone(),
            sha256: sha(tb),
        });
        let info = crate::evidence::tsr::parse_token(tb)
            .map_err(|e| crate::terr!("e-clock-tamper-token", token = tn.clone(), e = e))?;
        let gen = parse_utc(&info.gen_time).ok_or_else(|| {
            crate::terr!(
                "e-clock-tamper-gentime",
                token = tn.clone(),
                value = info.gen_time.clone()
            )
        })?;
        let req = parse_utc(&tr.os_utc_at_request).unwrap_or(0.0);
        let off = gen - req;
        let d = ensure(&mut days, req);
        let dd = get(&mut days, &d);
        dd.tokens += 1;
        let lim = th.max_offset_s + th.tsa_tolerance_s;
        if off.abs() > lim {
            dd.findings.push(Finding {
                kind: "token-offset",
                os_utc: tr.os_utc_at_request.clone(),
                value: off,
                threshold: lim,
                detail: format!(
                    "{tn}: genTime {} minus OS time at request {} = {off:+.3} s (token signature not verified here)",
                    info.gen_time, tr.os_utc_at_request
                ),
            });
        }
    }
    let mut total = 0;
    let days: Vec<Day> = days
        .into_values()
        .map(|mut d| {
            d.findings.sort_by(|a, b| {
                parse_utc(&a.os_utc)
                    .unwrap_or(0.0)
                    .total_cmp(&parse_utc(&b.os_utc).unwrap_or(0.0))
                    .then(a.kind.cmp(b.kind))
            });
            d.references.sort();
            d.authenticated_references.sort();
            if !d.findings.is_empty() {
                d.verdict = "findings";
            }
            total += d.findings.len();
            d
        })
        .collect();
    Ok(Report {
        format: FORMAT,
        label: "MODELLED",
        signature: "unsigned",
        disclaimer: DISCLAIMER,
        host: s.host,
        inputs,
        thresholds: th,
        days,
        findings: total,
    })
}

/// The report as text.
pub fn text(r: &Report) -> String {
    let mut s = format!(
        "{} ({}, {}) host {}\n",
        r.format, r.label, r.signature, r.host
    );
    for i in &r.inputs {
        s.push_str(&format!("input {} sha256 {}\n", i.input, i.sha256));
    }
    for d in &r.days {
        s.push_str(&format!(
            "\n{}  {}  samples={} references={} authenticated={} max|offset|={} max|drift|={} clock-changes={} tokens={}\n",
            d.date,
            d.verdict,
            d.samples,
            d.references.len(),
            d.authenticated_references.len(),
            d.max_abs_offset_s.map_or("-".into(), |v| format!("{v:.6} s")),
            d.max_abs_drift_ppm.map_or("-".into(), |v| format!("{v:.3} ppm")),
            d.clock_change_events,
            d.tokens
        ));
        for f in &d.findings {
            s.push_str(&format!("  {} {}: {}\n", f.os_utc, f.kind, f.detail));
        }
    }
    s.push_str(&format!("\nfindings: {}\n{}\n", r.findings, r.disclaimer));
    s
}

/// `kshana clock-tamper check <samples.json> [--json] [--out <report.json>]` and
/// `kshana clock-tamper template`. Exit 0 no findings, 1 findings, 2 a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    let usage = || {
        eprintln!("{}", crate::t!("clock-tamper-usage"));
        2
    };
    match args.first().map(String::as_str) {
        Some("--help" | "-h") => {
            println!("{}", crate::t!("clock-tamper-usage"));
            0
        }
        Some("template") if args.len() == 1 => {
            print!("{}", TEMPLATE);
            0
        }
        Some("check") => {
            let mut json = false;
            let mut out = None;
            let mut input = None;
            let mut i = 1;
            while i < args.len() {
                match args[i].as_str() {
                    "--json" => json = true,
                    "--out" => match args.get(i + 1) {
                        Some(p) => {
                            out = Some(p.clone());
                            i += 1;
                        }
                        None => return usage(),
                    },
                    a if a.starts_with("--") || input.is_some() => return usage(),
                    a => input = Some(a.to_string()),
                }
                i += 1;
            }
            let Some(input) = input else {
                return usage();
            };
            let read = |p: &str| {
                std::fs::read(p).map_err(|e| {
                    eprintln!(
                        "{}",
                        crate::terr!("e-clock-tamper-cannot-read", path = p, e = e.to_string())
                    );
                })
            };
            let Ok(bytes) = read(&input) else { return 2 };
            let parsed = match parse_samples(&String::from_utf8_lossy(&bytes)) {
                Ok(s) => s,
                Err(e) => {
                    eprintln!(
                        "{}",
                        crate::terr!("e-clock-tamper-bad-input", path = input, e = e)
                    );
                    return 2;
                }
            };
            let base = std::path::Path::new(&input)
                .parent()
                .map(std::path::Path::to_path_buf)
                .unwrap_or_default();
            let mut tokens = Vec::new();
            for t in &parsed.timestamp_tokens {
                let p = base.join(&t.token);
                let Ok(b) = read(&p.to_string_lossy()) else {
                    return 2;
                };
                tokens.push((t.token.clone(), b));
            }
            let r = match analyse(&input, &bytes, &tokens) {
                Ok(r) => r,
                Err(e) => {
                    eprintln!(
                        "{}",
                        crate::terr!("e-clock-tamper-bad-input", path = input, e = e)
                    );
                    return 2;
                }
            };
            let doc = serde_json::to_string_pretty(&r).unwrap_or_default() + "\n";
            if let Some(p) = &out {
                if let Err(e) = std::fs::write(p, doc.as_bytes()) {
                    eprintln!(
                        "{}",
                        crate::terr!("e-clock-tamper-cannot-write", path = p, e = e.to_string())
                    );
                    return 2;
                }
            }
            if json {
                print!("{doc}");
            } else {
                print!("{}", text(&r));
            }
            i32::from(r.findings > 0)
        }
        _ => usage(),
    }
}

/// A sample file to start from (`kshana clock-tamper template`).
pub const TEMPLATE: &str = r#"{
  "format": "kshana.clock-samples/1",
  "host": "lab-pc-01",
  "thresholds": {
    "step_s": 0.5,
    "max_offset_s": 1.0,
    "max_drift_ppm": 50.0,
    "reference_agreement_s": 0.1,
    "min_agreeing_references": 2,
    "tsa_tolerance_s": 1.0,
    "event_window_s": 300.0,
    "min_drift_span_s": 3600.0
  },
  "samples": [
    {
      "os_utc": "2026-11-20T08:00:00.000Z",
      "monotonic_s": 1000.0,
      "boot_id": "boot-1",
      "references": [
        { "id": "nts-a", "kind": "nts", "offset_s": 0.004, "authenticated": true },
        { "id": "gnss-lab", "kind": "ntp-gnss", "offset_s": 0.003 }
      ]
    }
  ],
  "events": [],
  "timestamp_tokens": []
}
"#;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn times_round_trip() {
        let t = parse_utc("2026-11-20T08:00:00.250Z").unwrap();
        assert_eq!(format_utc(t), "2026-11-20T08:00:00.250Z");
        assert!(parse_utc("2026-02-30T00:00:00Z").is_none());
    }

    #[test]
    fn slope_of_a_line() {
        let s = slope(&[(0.0, 1.0), (10.0, 3.0), (20.0, 5.0)]).unwrap();
        assert!((s - 0.2).abs() < 1e-12);
    }

    #[test]
    fn the_template_parses() {
        assert!(parse_samples(TEMPLATE).is_ok());
    }
}
