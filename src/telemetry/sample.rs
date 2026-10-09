// SPDX-License-Identifier: AGPL-3.0-only
//! The one place that knows the shape of the per-epoch trust stream.
//!
//! The telemetry sinks never read a trust record directly: they read a [`TrustSample`],
//! and this file turns the engine's records into samples. If the live stream's line format
//! changes, [`parse_live_line`] is the only function that has to change.
//!
//! Two sources feed it:
//! * the live stream, one JSON object per line (`score` 0-100, `band`, `reasons`), parsed
//!   tolerantly by [`parse_live_line`];
//! * the batch result of `kshana receiver-trust`, whose per-epoch records carry a trust
//!   state and the monitors that alarmed but no numeric score ([`from_epoch_trust`]).
//!   A score is never invented for them: the sample's `score` is `None`.

use crate::receiver_trust::monitors::{EpochTrust, TrustState};
use serde_json::Value;

/// The trust band of one epoch.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub enum Band {
    /// Inside the calibration window: the baseline is still being formed.
    Calibrating,
    /// No monitor alarmed.
    Nominal,
    /// The environment is degraded but the fix is not shown wrong.
    Degraded,
    /// The fix itself should not be trusted.
    Untrusted,
    /// The source named a band this build does not know.
    Unknown,
}

impl Band {
    /// Every band, in the order metrics list them.
    pub const ALL: [Band; 5] = [
        Band::Calibrating,
        Band::Nominal,
        Band::Degraded,
        Band::Untrusted,
        Band::Unknown,
    ];

    /// The lower-case label used in metric labels and event fields.
    pub fn label(self) -> &'static str {
        match self {
            Band::Calibrating => "calibrating",
            Band::Nominal => "nominal",
            Band::Degraded => "degraded",
            Band::Untrusted => "untrusted",
            Band::Unknown => "unknown",
        }
    }

    /// Parse a band name, case-insensitively; anything unrecognised is [`Band::Unknown`].
    pub fn parse(s: &str) -> Band {
        match s.trim().to_ascii_lowercase().as_str() {
            "calibrating" | "calibration" => Band::Calibrating,
            "nominal" | "trusted" | "ok" => Band::Nominal,
            "degraded" | "warning" => Band::Degraded,
            "untrusted" | "critical" => Band::Untrusted,
            _ => Band::Unknown,
        }
    }

    /// Index into [`Band::ALL`].
    pub fn index(self) -> usize {
        Band::ALL.iter().position(|b| *b == self).unwrap_or(4)
    }
}

/// One epoch of the trust stream, as the sinks see it.
#[derive(Clone, Debug, PartialEq)]
pub struct TrustSample {
    /// Seconds since the first epoch of the log or session.
    pub t_s: f64,
    /// The epoch's time as the source states it, where it does.
    pub time_label: Option<String>,
    /// Trust score 0 (no trust) to 100 (full trust), where the source computes one.
    pub score: Option<f64>,
    /// The trust band.
    pub band: Band,
    /// Why the epoch is not nominal: monitor or reason names, in the source's order.
    pub reasons: Vec<String>,
}

/// Parse one line of the live stream.
///
/// Accepted keys: `t_s` (or `t`) seconds; `score` number in 0..=100; `band` string;
/// `reasons` array of strings (objects are read through their `monitor`, `name` or
/// `reason` string); `time_label` (or `time`) string. Missing `band` is an error: a
/// sample with no verdict says nothing. Out-of-range or non-finite numbers are errors
/// rather than being clamped, so a format change is noticed instead of hidden.
pub fn parse_live_line(line: &str) -> Result<TrustSample, String> {
    let v: Value = serde_json::from_str(line.trim()).map_err(|e| format!("not JSON: {e}"))?;
    let obj = v.as_object().ok_or("not a JSON object")?;
    let num = |keys: &[&str]| -> Result<Option<f64>, String> {
        for k in keys {
            if let Some(x) = obj.get(*k) {
                if x.is_null() {
                    return Ok(None);
                }
                let f = x.as_f64().ok_or_else(|| format!("`{k}` is not a number"))?;
                if !f.is_finite() {
                    return Err(format!("`{k}` is not finite"));
                }
                return Ok(Some(f));
            }
        }
        Ok(None)
    };
    let t_s = num(&["t_s", "t"])?.ok_or("missing `t_s`")?;
    let score = num(&["score"])?;
    if let Some(s) = score {
        if !(0.0..=100.0).contains(&s) {
            return Err(format!("`score` {s} outside 0..=100"));
        }
    }
    let band = Band::parse(
        obj.get("band")
            .and_then(Value::as_str)
            .ok_or("missing `band`")?,
    );
    let mut reasons = Vec::new();
    if let Some(r) = obj.get("reasons") {
        for item in r.as_array().ok_or("`reasons` is not an array")? {
            let name = match item {
                Value::String(s) => Some(s.as_str()),
                Value::Object(o) => ["monitor", "name", "reason"]
                    .iter()
                    .find_map(|k| o.get(*k).and_then(Value::as_str)),
                _ => None,
            };
            reasons.push(name.ok_or("a `reasons` entry has no name")?.to_string());
        }
    }
    let time_label = ["time_label", "time"]
        .iter()
        .find_map(|k| obj.get(*k).and_then(Value::as_str))
        .map(str::to_string);
    Ok(TrustSample {
        t_s,
        time_label,
        score,
        band,
        reasons,
    })
}

/// The sample for one epoch of a batch `receiver-trust` result. No score: the batch result
/// has a trust state, not a number.
pub fn from_epoch_trust(e: &EpochTrust) -> TrustSample {
    let band = match e.state {
        TrustState::Calibrating => Band::Calibrating,
        TrustState::Nominal => Band::Nominal,
        TrustState::Degraded => Band::Degraded,
        TrustState::Untrusted => Band::Untrusted,
    };
    TrustSample {
        t_s: e.t_s,
        time_label: None,
        score: None,
        band,
        reasons: e
            .alarms
            .iter()
            .map(|m| {
                serde_json::to_value(m)
                    .ok()
                    .and_then(|v| v.as_str().map(str::to_string))
                    .unwrap_or_else(|| format!("{m:?}"))
            })
            .collect(),
    }
}

/// The samples of a `receiver-trust` result document (`<stem>.result.json`).
pub fn from_result_json(json: &str) -> Result<Vec<TrustSample>, String> {
    let v: Value = serde_json::from_str(json).map_err(|e| format!("result is not JSON: {e}"))?;
    let epochs = v.get("epochs").ok_or("result has no `epochs`")?;
    let epochs: Vec<EpochTrust> =
        serde_json::from_value(epochs.clone()).map_err(|e| format!("bad `epochs`: {e}"))?;
    Ok(epochs.iter().map(from_epoch_trust).collect())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_a_full_line() {
        let s = parse_live_line(
            r#"{"t_s":12.5,"score":62.5,"band":"Degraded","reasons":["cn0-drop",{"monitor":"agc"}],"time_label":"2026-01-01T00:00:12Z"}"#,
        )
        .unwrap();
        assert_eq!(s.t_s, 12.5);
        assert_eq!(s.score, Some(62.5));
        assert_eq!(s.band, Band::Degraded);
        assert_eq!(s.reasons, ["cn0-drop", "agc"]);
        assert_eq!(s.time_label.as_deref(), Some("2026-01-01T00:00:12Z"));
    }

    #[test]
    fn rejects_format_drift_instead_of_hiding_it() {
        assert!(parse_live_line("garbage").is_err());
        assert!(parse_live_line(r#"{"t_s":1,"score":140,"band":"nominal"}"#).is_err());
        assert!(parse_live_line(r#"{"t_s":1,"score":50}"#).is_err());
        assert!(parse_live_line(r#"{"score":50,"band":"nominal"}"#).is_err());
        assert!(parse_live_line(r#"{"t_s":1,"band":"nominal","reasons":[3]}"#).is_err());
    }

    #[test]
    fn unknown_band_is_labelled_not_guessed() {
        let s = parse_live_line(r#"{"t_s":1,"band":"purple"}"#).unwrap();
        assert_eq!(s.band, Band::Unknown);
        assert_eq!(s.score, None);
    }

    #[test]
    fn batch_epoch_has_no_invented_score() {
        let e = EpochTrust {
            t_s: 70.0,
            n_sats: 8,
            cn0_mean_dbhz: None,
            cn0_drop_db: None,
            agc: None,
            agc_z: None,
            jam_ind: None,
            position_offset_m: None,
            raim_stat: None,
            raim_thr: None,
            clock_innov_ns: None,
            clock_bound_ns: None,
            alarms: vec![crate::receiver_trust::monitors::Monitor::Cn0Drop],
            state: TrustState::Degraded,
        };
        let s = from_epoch_trust(&e);
        assert_eq!(s.score, None);
        assert_eq!(s.band, Band::Degraded);
        assert_eq!(s.reasons, ["cn0-drop"]);
    }
}
