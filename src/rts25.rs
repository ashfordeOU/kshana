// SPDX-License-Identifier: AGPL-3.0-only
//! Business-clock divergence from UTC against the EU limits for trading (roadmap A2c, finance).
//!
//! Commission Delegated Regulation (EU) 2017/574 ("RTS 25", under MiFID II) sets a maximum divergence
//! from UTC and a timestamp granularity for the business clocks of trading venues (Annex, Table 1, by
//! gateway-to-gateway latency) and of their members and participants (Table 2, by trading activity).
//! This module takes a measured series of the clock's offset from UTC (any clock log Kshana reads,
//! [`crate::clock_log`]) and reports the largest divergence, how often and for how long it was beyond
//! the limit, and the gaps in the record.
//!
//! What it does not do: it does not show traceability to UTC (the documentation of the time source and
//! its chain, which the Regulation also requires), and it does not measure timestamp granularity, a
//! property of the venue's own records. The output describes a measured record against a stated limit;
//! it is not a regulatory assessment.
//!
//! MODELLED: arithmetic checked on synthetic series (`tests/rts25.rs`); the limits are copied from the
//! Regulation's Annex and pinned in a test.
use serde::Serialize;

/// The activity the clock serves, as named in the Regulation's Annex.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Activity {
    /// Table 1: venue with gateway-to-gateway latency above 1 ms.
    VenueLatencyAbove1ms,
    /// Table 1: venue with gateway-to-gateway latency of 1 ms or less.
    VenueLatencyAtMost1ms,
    /// Table 2: high-frequency algorithmic trading technique.
    HighFrequency,
    /// Table 2: voice trading systems.
    Voice,
    /// Table 2: request-for-quote systems where the response needs human intervention, or where the
    /// system does not allow algorithmic trading.
    RequestForQuoteHuman,
    /// Table 2: concluding negotiated transactions.
    NegotiatedTransactions,
    /// Table 2: any other trading activity.
    OtherTrading,
}

/// Activity names accepted on input.
pub const ACTIVITY_NAMES: [&str; 7] = [
    "venue-latency-above-1ms",
    "venue-latency-at-most-1ms",
    "high-frequency",
    "voice",
    "request-for-quote-human",
    "negotiated-transactions",
    "other-trading",
];

impl Activity {
    /// Parse an activity name.
    pub fn from_name(s: &str) -> Option<Self> {
        use Activity::*;
        [
            VenueLatencyAbove1ms,
            VenueLatencyAtMost1ms,
            HighFrequency,
            Voice,
            RequestForQuoteHuman,
            NegotiatedTransactions,
            OtherTrading,
        ]
        .into_iter()
        .zip(ACTIVITY_NAMES)
        .find_map(|(a, n)| (n == s).then_some(a))
    }

    /// Maximum divergence from UTC and timestamp granularity (s), from the Regulation's Annex.
    pub fn limits_s(self) -> (f64, f64) {
        use Activity::*;
        match self {
            VenueLatencyAbove1ms => (1e-3, 1e-3),
            VenueLatencyAtMost1ms => (100e-6, 1e-6),
            HighFrequency => (100e-6, 1e-6),
            Voice | RequestForQuoteHuman | NegotiatedTransactions => (1.0, 1.0),
            OtherTrading => (1e-3, 1e-3),
        }
    }
}

/// One stretch in which the divergence exceeded the limit.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Excursion {
    /// First sample beyond the limit (s from the series start).
    pub from_s: f64,
    /// Last sample beyond the limit (s).
    pub to_s: f64,
    /// Largest divergence in the stretch (s, signed).
    pub peak_s: f64,
}

/// What the record shows against the limit.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// The activity.
    pub activity: Activity,
    /// Maximum divergence limit (s).
    pub limit_s: f64,
    /// Timestamp granularity the Regulation asks for (s); not measured here.
    pub granularity_s: f64,
    /// Samples in the record.
    pub samples: usize,
    /// Largest |offset| (s).
    pub max_abs_divergence_s: f64,
    /// Samples beyond the limit.
    pub samples_beyond: usize,
    /// Stretches beyond the limit, in time order.
    pub excursions: Vec<Excursion>,
    /// Gaps longer than `max_gap_s` between samples: (start s, length s).
    pub gaps: Vec<(f64, f64)>,
    /// `within limit`, `beyond limit` or `not assessable` (no samples, or a gap longer than `max_gap_s`,
    /// during which the divergence is unknown).
    pub outcome: &'static str,
}

/// Assess an offset-from-UTC series (`time_s` and `offset_s` of equal length, time increasing).
/// `max_gap_s` is the longest interval between samples that still counts as observed.
pub fn assess(activity: Activity, time_s: &[f64], offset_s: &[f64], max_gap_s: f64) -> Report {
    let (limit_s, granularity_s) = activity.limits_s();
    let mut excursions: Vec<Excursion> = Vec::new();
    let mut gaps = Vec::new();
    let mut max_abs: f64 = 0.0;
    let mut beyond = 0;
    let mut open = false;
    for (i, (&t, &x)) in time_s.iter().zip(offset_s).enumerate() {
        if !x.is_finite() {
            continue;
        }
        if i > 0 && t - time_s[i - 1] > max_gap_s {
            gaps.push((time_s[i - 1], t - time_s[i - 1]));
        }
        max_abs = max_abs.max(x.abs());
        if x.abs() > limit_s {
            beyond += 1;
            match excursions.last_mut() {
                Some(e) if open => {
                    e.to_s = t;
                    if x.abs() > e.peak_s.abs() {
                        e.peak_s = x;
                    }
                }
                _ => excursions.push(Excursion {
                    from_s: t,
                    to_s: t,
                    peak_s: x,
                }),
            }
            open = true;
        } else {
            open = false;
        }
    }
    let n = offset_s.iter().filter(|x| x.is_finite()).count();
    let outcome = if n == 0 || !gaps.is_empty() {
        if beyond > 0 {
            "beyond limit"
        } else {
            "not assessable"
        }
    } else if beyond > 0 {
        "beyond limit"
    } else {
        "within limit"
    };
    Report {
        activity,
        limit_s,
        granularity_s,
        samples: n,
        max_abs_divergence_s: max_abs,
        samples_beyond: beyond,
        excursions,
        gaps,
        outcome,
    }
}
