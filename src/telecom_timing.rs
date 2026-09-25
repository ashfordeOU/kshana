// SPDX-License-Identifier: AGPL-3.0-only
//! Telecom timing: time error, maximum time interval error (MTIE) and time deviation
//! (TDEV) checked against the International Telecommunication Union Telecommunication
//! Standardization Sector (ITU-T) masks, with a PASS or FAIL and a margin per mask.
//!
//! The `telecom-timing` scenario kind takes one of two inputs:
//!
//! * **a synthetic holdover** — an oscillator preset, the time the Global Navigation
//!   Satellite System (GNSS) reference is lost, a record length and a sample interval.
//!   Before the loss the clock is disciplined and its time error is a small white
//!   phase noise; from the loss on it free-runs with white frequency noise, flicker
//!   frequency noise, random-walk frequency noise where the datasheet fit needs it,
//!   linear frequency aging and a sinusoidal temperature term;
//! * **an ingested series** of `(time_s, time_error_ns)` pairs, given inline in the
//!   scenario (the WebAssembly build has no filesystem) or, on native builds only,
//!   read from a comma-separated values (CSV) file.
//!
//! From the series it reports the maximum absolute time error, the MTIE and TDEV
//! curves, a PASS or FAIL with a margin against every selected mask, and the time to
//! exceed each time-error budget.
//!
//! ## Sources
//!
//! Every limit in [`MASKS`], in [`eprtc_a_holdover_limit_ns`] and in the default
//! budgets is transcribed from a freely downloadable ITU-T Recommendation, named with
//! its edition and table or clause beside the number. `docs/TELECOM-TIMING.md` lists
//! them all, and lists what was *not* transcribed: every entry the Recommendations
//! mark "for further study" is absent here, never filled in.
//!
//! The oscillator presets in [`PRESETS`] carry the stability, aging and temperature
//! figures of four named public datasheets. How those figures become a noise model is
//! this module's choice and is labelled MODELLED in every report.
//!
//! ## What the estimators are
//!
//! MTIE is the largest peak-to-peak time error in any window of `m + 1` samples,
//! exactly [`crate::allan::mtie`]; [`mtie_sliding`] computes the same number with a
//! monotonic-queue sliding window so a day of one-second samples stays fast, and a
//! unit test holds the two equal. TDEV is [`crate::allan::time_deviation`] unchanged.
//! Both are checked against the third-party `allantools` package on a committed
//! holdover series in `tests/telecom_timing_reference.rs`.

use crate::field_schema::FieldUnit;
use crate::models::{ClockModel, ErrorModel};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

// ---------------------------------------------------------------------------------------
// Masks
// ---------------------------------------------------------------------------------------

/// One piece of a piecewise mask: on the observation interval between `lo_s` and `hi_s`
/// (each end open or closed exactly as the source table states it) the limit is
/// `slope_ns_per_s · τ + intercept_ns`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Segment {
    pub lo_s: f64,
    pub lo_inclusive: bool,
    pub hi_s: f64,
    pub hi_inclusive: bool,
    pub slope_ns_per_s: f64,
    pub intercept_ns: f64,
}

impl Segment {
    /// Whether `tau_s` lies in this piece's interval.
    pub fn contains(&self, tau_s: f64) -> bool {
        let above = if self.lo_inclusive {
            tau_s >= self.lo_s
        } else {
            tau_s > self.lo_s
        };
        let below = if self.hi_inclusive {
            tau_s <= self.hi_s
        } else {
            tau_s < self.hi_s
        };
        above && below
    }

    /// The limit at `tau_s`, in nanoseconds (meaningful only inside the interval).
    pub fn limit_ns(&self, tau_s: f64) -> f64 {
        self.slope_ns_per_s * tau_s + self.intercept_ns
    }
}

const fn seg(
    lo_s: f64,
    lo_inclusive: bool,
    hi_s: f64,
    hi_inclusive: bool,
    slope_ns_per_s: f64,
    intercept_ns: f64,
) -> Segment {
    Segment {
        lo_s,
        lo_inclusive,
        hi_s,
        hi_inclusive,
        slope_ns_per_s,
        intercept_ns,
    }
}

/// The mask limit at `tau_s`, or `None` where the source defines no limit (outside the
/// tabulated range, or in a gap the table leaves between two rows).
pub fn limit_at(segments: &[Segment], tau_s: f64) -> Option<f64> {
    segments
        .iter()
        .find(|s| s.contains(tau_s))
        .map(|s| s.limit_ns(tau_s))
}

/// A piecewise MTIE or TDEV mask with the table it is transcribed from.
#[derive(Clone, Copy, Debug)]
pub struct CurveMask {
    pub segments: &'static [Segment],
    pub source: &'static str,
}

/// A single time-error limit with the table or clause it is transcribed from.
#[derive(Clone, Copy, Debug)]
pub struct Limit {
    pub value_ns: f64,
    pub source: &'static str,
}

/// The measurement filter a mask is defined through.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MeasurementFilter {
    /// No filter: the time error is compared as sampled (the one pulse per second case
    /// of ITU-T G.8272 and G.8272.1).
    None,
    /// A first-order low-pass filter with a 0.1 Hz bandwidth, as ITU-T G.8273.2 and
    /// G.8271.1 state for the low-pass-filtered time error.
    LowPass0p1Hz,
}

impl MeasurementFilter {
    pub fn as_str(self) -> &'static str {
        match self {
            MeasurementFilter::None => "none",
            MeasurementFilter::LowPass0p1Hz => "first-order low-pass, 0.1 Hz",
        }
    }
}

/// The operating condition a mask is written for.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MaskCondition {
    Locked,
    Holdover,
}

impl MaskCondition {
    pub fn as_str(self) -> &'static str {
        match self {
            MaskCondition::Locked => "locked",
            MaskCondition::Holdover => "holdover",
        }
    }
}

/// One selectable mask: everything a Recommendation states for one clock type or one
/// reference point, and nothing it leaves for further study.
#[derive(Clone, Copy, Debug)]
pub struct TimingMask {
    pub id: &'static str,
    pub title: &'static str,
    pub recommendation: &'static str,
    pub condition: MaskCondition,
    pub filter: MeasurementFilter,
    /// Maximum absolute time error (after the filter, when there is one).
    pub max_abs_te: Option<Limit>,
    /// Permissible range of constant time error, ± this value.
    pub cte: Option<Limit>,
    pub mtie: Option<CurveMask>,
    pub tdev: Option<CurveMask>,
    /// Whether the ITU-T G.8272.1 ePRTC-A holdover time-error envelope applies.
    pub holdover_envelope: bool,
    /// What the Recommendation leaves for further study for this clock or point, so a
    /// reader sees what is absent rather than assuming it was checked.
    pub not_specified: &'static str,
}

const G8272: &str = "ITU-T G.8272/Y.1367 (07/2025)";
const G8272_1: &str = "ITU-T G.8272.1/Y.1367.1 (2024) Amd. 1 (07/2025)";
const G8273_2: &str = "ITU-T G.8273.2/Y.1368.2 (2023) Amd. 2 (11/2025)";
const G8271_1: &str = "ITU-T G.8271.1/Y.1366.1 (2022) Amd. 3 (05/2025)";

const INF: f64 = f64::INFINITY;

// ITU-T G.8272 (07/2025) Table 1: 0.275e-3·τ + 0.025 µs for 0.1 < τ ≤ 273 s, 0.10 µs above.
const PRTC_A_MTIE: &[Segment] = &[
    seg(0.1, false, 273.0, true, 0.275, 25.0),
    seg(273.0, false, INF, false, 0.0, 100.0),
];
// ITU-T G.8272 (07/2025) Table 2: 0.275e-3·τ + 0.025 µs for 0.1 < τ ≤ 54.5 s, 0.04 µs above.
const PRTC_B_MTIE: &[Segment] = &[
    seg(0.1, false, 54.5, true, 0.275, 25.0),
    seg(54.5, false, INF, false, 0.0, 40.0),
];
// ITU-T G.8272 (07/2025) Table 3.
const PRTC_A_TDEV: &[Segment] = &[
    seg(0.1, false, 100.0, true, 0.0, 3.0),
    seg(100.0, false, 1000.0, true, 0.03, 0.0),
    seg(1000.0, false, 10_000.0, false, 0.0, 30.0),
];
// ITU-T G.8272 (07/2025) Table 4.
const PRTC_B_TDEV: &[Segment] = &[
    seg(0.1, false, 100.0, true, 0.0, 1.0),
    seg(100.0, false, 500.0, true, 0.01, 0.0),
    seg(500.0, false, 100_000.0, false, 0.0, 5.0),
];
// ITU-T G.8272.1 (2024) Amd. 1 (07/2025) Table 1 (locked mode).
const EPRTC_MTIE: &[Segment] = &[
    seg(0.1, false, 1.0, true, 0.0, 4.0),
    seg(1.0, false, 100.0, true, 0.11114, 3.89),
    seg(100.0, false, 400_000.0, true, 0.0375e-3, 15.0),
    seg(400_000.0, false, INF, false, 0.0, 30.0),
];
// ITU-T G.8272.1 (2024) Amd. 1 (07/2025) Table 2 (locked mode).
const EPRTC_TDEV: &[Segment] = &[
    seg(0.1, false, 30_000.0, true, 0.0, 1.0),
    seg(30_000.0, false, 300_000.0, true, 3.33333e-5, 0.0),
    seg(300_000.0, false, 1_000_000.0, false, 0.0, 10.0),
];
// ITU-T G.8272.1 (2024) Amd. 1 (07/2025) Table 4 (ePRTC-A holdover). Longer observation
// intervals are for further study (Note 1 under the table).
const EPRTC_A_HOLDOVER_MTIE: &[Segment] = &[
    seg(0.1, false, 1.0, true, 0.0, 4.0),
    seg(1.0, false, 100.0, true, 0.11114, 3.89),
    seg(100.0, false, 10_000.0, true, 0.0375e-3, 15.0),
];
// ITU-T G.8272.1 (2024) Amd. 1 (07/2025) Table 5 (ePRTC-A holdover).
const EPRTC_A_HOLDOVER_TDEV: &[Segment] = &[seg(0.1, false, 10_000.0, true, 0.0, 1.0)];
// ITU-T G.8273.2 Amd. 2 Table 7-4 (dTE_L MTIE, constant temperature): m ≤ τ ≤ 1 000 s,
// with m = 1 s for a one pulse per second output (the table's note).
const TBC_AB_MTIE: &[Segment] = &[seg(1.0, true, 1000.0, true, 0.0, 40.0)];
const TBC_C_MTIE: &[Segment] = &[seg(1.0, true, 1000.0, true, 0.0, 10.0)];
// ITU-T G.8273.2 Amd. 2 Table 7-5 (dTE_L TDEV, constant temperature): classes A and B
// are written m < τ ≤ 1 000 s, class C m ≤ τ ≤ 1 000 s.
const TBC_AB_TDEV: &[Segment] = &[seg(1.0, false, 1000.0, true, 0.0, 4.0)];
const TBC_C_TDEV: &[Segment] = &[seg(1.0, true, 1000.0, true, 0.0, 2.0)];
// ITU-T G.8271.1 Amd. 3 Table 7-1 (reference point C, clause 7.3.1).
const POINT_C_MTIE: &[Segment] = &[
    seg(1.3, false, 2.4, true, 75.0, 100.0),
    seg(2.4, false, 275.0, true, 1.1, 277.0),
    seg(275.0, false, 10_000.0, true, 0.0, 580.0),
];
// ITU-T G.8271.1 Amd. 3 Table 7-2 (enhanced network limits, clause 7.3.2).
const POINT_C_ENHANCED_MTIE: &[Segment] = &[
    seg(1.3, false, 2.4, true, 9.7, 37.39),
    seg(2.4, false, 20.2, true, 2.25, 55.27),
    seg(20.2, false, 211.11, true, 0.52, 90.22),
    seg(211.11, false, 10_000.0, true, 0.0, 200.0),
];
// ITU-T G.8271.1 Amd. 3 Table 7-3 (PRTC in the access network, clause 7.3.3). The table
// writes "1 < τ < 400" and "400 < τ ≤ 10 000", so τ = 400 s exactly carries no limit.
const POINT_C_ACCESS_MTIE: &[Segment] = &[
    seg(1.0, false, 400.0, false, 0.0475, 25.0),
    seg(400.0, false, 10_000.0, true, 0.0, 44.0),
];

/// Every selectable mask.
pub const MASKS: &[TimingMask] = &[
    TimingMask {
        id: "prtc-a",
        title: "Primary reference time clock, class A (PRTC-A)",
        recommendation: G8272,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::None,
        max_abs_te: Some(Limit {
            value_ns: 100.0,
            source: "G.8272 clause 6.1",
        }),
        cte: None,
        mtie: Some(CurveMask {
            segments: PRTC_A_MTIE,
            source: "G.8272 Table 1",
        }),
        tdev: Some(CurveMask {
            segments: PRTC_A_TDEV,
            source: "G.8272 Table 3",
        }),
        holdover_envelope: false,
        not_specified: "G.8272 states no holdover requirement for a PRTC",
    },
    TimingMask {
        id: "prtc-b",
        title: "Primary reference time clock, class B (PRTC-B)",
        recommendation: G8272,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::None,
        max_abs_te: Some(Limit {
            value_ns: 40.0,
            source: "G.8272 clause 6.1",
        }),
        cte: None,
        mtie: Some(CurveMask {
            segments: PRTC_B_MTIE,
            source: "G.8272 Table 2",
        }),
        tdev: Some(CurveMask {
            segments: PRTC_B_TDEV,
            source: "G.8272 Table 4",
        }),
        holdover_envelope: false,
        not_specified: "G.8272 states no holdover requirement for a PRTC",
    },
    TimingMask {
        id: "eprtc",
        title: "Enhanced primary reference time clock (ePRTC), locked mode",
        recommendation: G8272_1,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::None,
        max_abs_te: Some(Limit {
            value_ns: 30.0,
            source: "G.8272.1 clause 6.1",
        }),
        cte: None,
        mtie: Some(CurveMask {
            segments: EPRTC_MTIE,
            source: "G.8272.1 Table 1",
        }),
        tdev: Some(CurveMask {
            segments: EPRTC_TDEV,
            source: "G.8272.1 Table 2",
        }),
        holdover_envelope: false,
        not_specified: "phase discontinuity (clause 7) is for further study",
    },
    TimingMask {
        id: "eprtc-a-holdover",
        title: "Enhanced primary reference time clock, class A (ePRTC-A), holdover",
        recommendation: G8272_1,
        condition: MaskCondition::Holdover,
        filter: MeasurementFilter::None,
        max_abs_te: None,
        cte: None,
        mtie: Some(CurveMask {
            segments: EPRTC_A_HOLDOVER_MTIE,
            source: "G.8272.1 Table 4",
        }),
        tdev: Some(CurveMask {
            segments: EPRTC_A_HOLDOVER_TDEV,
            source: "G.8272.1 Table 5",
        }),
        holdover_envelope: true,
        not_specified: "MTIE and TDEV beyond 10 000 s in holdover, and every ePRTC-B \
                        holdover requirement, are for further study",
    },
    TimingMask {
        id: "t-bc-class-a",
        title: "Telecom boundary clock / telecom time slave clock (T-BC/T-TSC), class A",
        recommendation: G8273_2,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::LowPass0p1Hz,
        max_abs_te: Some(Limit {
            value_ns: 100.0,
            source: "G.8273.2 Table 7-1 (unfiltered)",
        }),
        cte: Some(Limit {
            value_ns: 50.0,
            source: "G.8273.2 Table 7-3",
        }),
        mtie: Some(CurveMask {
            segments: TBC_AB_MTIE,
            source: "G.8273.2 Table 7-4",
        }),
        tdev: Some(CurveMask {
            segments: TBC_AB_TDEV,
            source: "G.8273.2 Table 7-5",
        }),
        holdover_envelope: false,
        not_specified: "phase/time holdover with both inputs lost is for further study",
    },
    TimingMask {
        id: "t-bc-class-b",
        title: "Telecom boundary clock / telecom time slave clock (T-BC/T-TSC), class B",
        recommendation: G8273_2,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::LowPass0p1Hz,
        max_abs_te: Some(Limit {
            value_ns: 70.0,
            source: "G.8273.2 Table 7-1 (unfiltered)",
        }),
        cte: Some(Limit {
            value_ns: 20.0,
            source: "G.8273.2 Table 7-3",
        }),
        mtie: Some(CurveMask {
            segments: TBC_AB_MTIE,
            source: "G.8273.2 Table 7-4",
        }),
        tdev: Some(CurveMask {
            segments: TBC_AB_TDEV,
            source: "G.8273.2 Table 7-5",
        }),
        holdover_envelope: false,
        not_specified: "phase/time holdover with both inputs lost is for further study",
    },
    TimingMask {
        id: "t-bc-class-c",
        title: "Telecom boundary clock / telecom time slave clock (T-BC/T-TSC), class C",
        recommendation: G8273_2,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::LowPass0p1Hz,
        max_abs_te: Some(Limit {
            value_ns: 30.0,
            source: "G.8273.2 Table 7-1 (unfiltered)",
        }),
        cte: Some(Limit {
            value_ns: 10.0,
            source: "G.8273.2 Table 7-3",
        }),
        mtie: Some(CurveMask {
            segments: TBC_C_MTIE,
            source: "G.8273.2 Table 7-4",
        }),
        tdev: Some(CurveMask {
            segments: TBC_C_TDEV,
            source: "G.8273.2 Table 7-5",
        }),
        holdover_envelope: false,
        not_specified: "phase/time holdover with both inputs lost is for further study",
    },
    TimingMask {
        id: "t-bc-class-d",
        title: "Telecom boundary clock / telecom time slave clock (T-BC/T-TSC), class D",
        recommendation: G8273_2,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::LowPass0p1Hz,
        max_abs_te: Some(Limit {
            value_ns: 5.0,
            source: "G.8273.2 Table 7-2 (max|TE_L|, 0.1 Hz low-pass)",
        }),
        cte: None,
        mtie: None,
        tdev: None,
        holdover_envelope: false,
        not_specified: "class D unfiltered max|TE|, constant time error, dTE_L MTIE and \
                        TDEV, dTE_H and holdover are all for further study",
    },
    TimingMask {
        id: "g8271-1-point-c",
        title: "Network limit at reference point C, deployment case 1 (class 4 applications)",
        recommendation: G8271_1,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::LowPass0p1Hz,
        max_abs_te: Some(Limit {
            value_ns: 1100.0,
            source: "G.8271.1 clause 7.3.1 (max|TE_L|)",
        }),
        cte: None,
        mtie: Some(CurveMask {
            segments: POINT_C_MTIE,
            source: "G.8271.1 Table 7-1",
        }),
        tdev: None,
        holdover_envelope: false,
        not_specified: "the TDEV network limit is for further study; limits exclude \
                        rearrangements and long holdover",
    },
    TimingMask {
        id: "g8271-1-point-c-enhanced",
        title: "Enhanced network limit at reference point C, deployment case 1",
        recommendation: G8271_1,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::LowPass0p1Hz,
        max_abs_te: Some(Limit {
            value_ns: 600.0,
            source: "G.8271.1 clause 7.3.2 (max|TE_L|)",
        }),
        cte: None,
        mtie: Some(CurveMask {
            segments: POINT_C_ENHANCED_MTIE,
            source: "G.8271.1 Table 7-2",
        }),
        tdev: None,
        holdover_envelope: false,
        not_specified: "the TDEV network limit is for further study",
    },
    TimingMask {
        id: "g8271-1-point-c-access",
        title: "Network limit at reference point C with the PRTC in the access network",
        recommendation: G8271_1,
        condition: MaskCondition::Locked,
        filter: MeasurementFilter::LowPass0p1Hz,
        max_abs_te: Some(Limit {
            value_ns: 100.0,
            source: "G.8271.1 clause 7.3.3 (max|TE_L|)",
        }),
        cte: None,
        mtie: Some(CurveMask {
            segments: POINT_C_ACCESS_MTIE,
            source: "G.8271.1 Table 7-3",
        }),
        tdev: None,
        holdover_envelope: false,
        not_specified: "the TDEV network limit is for further study",
    },
];

/// The mask with this id.
pub fn mask_by_id(id: &str) -> Option<&'static TimingMask> {
    MASKS.iter().find(|m| m.id == id)
}

/// The ePRTC-A holdover period `H` (seconds) for a locked-mode duration of
/// `locked_days` before the loss: ITU-T G.8272.1 (2024) Amd. 1 (07/2025) clause 8.2.1
/// and Table 3.
pub fn eprtc_a_holdover_period_s(locked_days: f64) -> f64 {
    if locked_days < 6.0 {
        70_000.0
    } else if locked_days <= 40.0 {
        locked_days * 86_400.0
    } else {
        3_456_000.0
    }
}

/// The ePRTC-A holdover time-error limit `|Δx(t)|` (ns) at `t_s` seconds after the
/// start of holdover, for a locked-mode duration of `locked_days` — ITU-T G.8272.1
/// (2024) Amd. 1 (07/2025) Table 3. `None` outside `0 < t ≤ H`, where the table states
/// nothing.
pub fn eprtc_a_holdover_limit_ns(locked_days: f64, t_s: f64) -> Option<f64> {
    let h = eprtc_a_holdover_period_s(locked_days);
    if !(t_s > 0.0 && t_s <= h) {
        return None;
    }
    Some(if locked_days < 6.0 {
        30.0 + 1.000e-3 * t_s
    } else if locked_days <= 40.0 {
        30.0 + 70.0 * t_s / (locked_days * 86_400.0)
    } else {
        30.0 + 2.025463e-5 * t_s
    })
}

/// A maximum-absolute-time-error budget the report measures the time to exceed.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
pub struct Budget {
    pub name: String,
    pub max_abs_te_ns: f64,
    #[serde(default)]
    pub source: String,
}

/// The default budgets: each is a number an ITU-T Recommendation states, named with
/// its clause or table.
pub fn default_budgets() -> Vec<Budget> {
    vec![
        Budget {
            name: "ePRTC default max|TE_HO|".into(),
            max_abs_te_ns: 100.0,
            source: "ITU-T G.8272.1 (2024) Amd. 1 (07/2025) clause 8.3.1: default maximum \
                     holdover time error"
                .into(),
        },
        Budget {
            name: "network holdover allocation, short GNSS interruption".into(),
            max_abs_te_ns: 400.0,
            source: "ITU-T G.8271.1 (2022) Amd. 3 (05/2025) Table V.1, failure scenario \
                     (b): rearrangements and holdover in the network (an example \
                     allocation, not a requirement)"
                .into(),
        },
        Budget {
            name: "network limit at reference point C".into(),
            max_abs_te_ns: 1100.0,
            source: "ITU-T G.8271.1 (2022) Amd. 3 (05/2025) clause 7.3.1: max|TE_L| at \
                     reference point C (a filtered quantity; compared here unfiltered)"
                .into(),
        },
        Budget {
            name: "end application, accuracy class 4".into(),
            max_abs_te_ns: 1500.0,
            source: "ITU-T G.8271 (03/2020) Amd. 1 (08/2024) Table 1, class 4: 1.5 \
                     microseconds"
                .into(),
        },
    ]
}

// ---------------------------------------------------------------------------------------
// Oscillator presets
// ---------------------------------------------------------------------------------------

/// A named oscillator with the figures of one public datasheet.
#[derive(Clone, Copy, Debug)]
pub struct OscillatorPreset {
    pub id: &'static str,
    pub class: &'static str,
    pub model: &'static str,
    pub document: &'static str,
    pub url: &'static str,
    /// Datasheet Allan deviation `(τ in s, σ_y)` points (maximum values), τ ≥ 1 s.
    pub adev_points: &'static [(f64, f64)],
    /// Linear fractional-frequency aging per day, as stated or converted as noted.
    pub aging_per_day: f64,
    pub aging_note: &'static str,
    /// Stated fractional-frequency change over the operating temperature range (±).
    pub temperature_bound: f64,
    pub temperature_min_c: f64,
    pub temperature_max_c: f64,
    pub temperature_note: &'static str,
}

impl OscillatorPreset {
    /// Fractional frequency per kelvin: the stated bound over half the operating span.
    /// A linear reading of a bound the datasheet states over the whole range, so a
    /// MODELLED worst case rather than a measured coefficient.
    pub fn temperature_coeff_per_k(&self) -> f64 {
        let half_span = 0.5 * (self.temperature_max_c - self.temperature_min_c);
        self.temperature_bound / half_span
    }
}

/// The four presets. Every figure below is read from the document named beside it.
pub const PRESETS: &[OscillatorPreset] = &[
    OscillatorPreset {
        id: "ocxo",
        class: "oven-controlled crystal oscillator (OCXO)",
        model: "Microchip OX-208, 10 MHz",
        document: "Microchip (Vectron) OX-208 Oven Controlled Crystal Oscillator \
                   datasheet, Rev 12-1-2021",
        url: "https://ww1.microchip.com/downloads/aemDocuments/documents/VOP/\
              ProductDocuments/DataSheets/OX-208.pdf",
        adev_points: &[(1.0, 5e-12), (10.0, 8e-12), (100.0, 1e-11), (1000.0, 5e-11)],
        aging_per_day: 0.15e-9,
        aging_note: "±0.15 ppb per day after 72 hours of operation (f ≤ 10 MHz)",
        temperature_bound: 0.4e-9,
        temperature_min_c: 0.0,
        temperature_max_c: 70.0,
        temperature_note: "±0.4 ppb over 0 °C to +70 °C, referenced to +25 °C",
    },
    OscillatorPreset {
        id: "rubidium",
        class: "rubidium frequency standard",
        model: "Microchip 8040C, standard performance",
        document: "Microchip 8040C Rubidium Frequency Standard datasheet, DS00003047A \
                   (2/20)",
        url: "https://ww1.microchip.com/downloads/en/DeviceDoc/00003047A.pdf",
        // The datasheet's 10 s row prints "<1.0 x 10^11", a misprinted exponent, so it
        // is left out rather than corrected by guesswork.
        adev_points: &[(1.0, 3.0e-11), (100.0, 3.0e-12)],
        aging_per_day: 5e-11 / 30.0,
        aging_note: "<5e-11 per month after 30 days of operation, converted at 30 days \
                     per month",
        temperature_bound: 3e-10,
        temperature_min_c: 0.0,
        temperature_max_c: 50.0,
        temperature_note: "temperature coefficient <3E-10 over the 0 °C to 50 °C \
                           operating range, read as a ± bound over that range",
    },
    OscillatorPreset {
        id: "caesium",
        class: "caesium beam primary frequency standard",
        model: "Microchip 5071A, high-performance tube",
        document: "Microchip 5071A Primary Frequency Standard datasheet, DS00002980D \
                   (5/25)",
        url: "https://ww1.microchip.com/downloads/aemDocuments/documents/FTD/\
              ProductDocuments/Brochures/5071A-Sell-Sheet-00002980.pdf",
        adev_points: &[
            (1.0, 5.0e-12),
            (10.0, 3.5e-12),
            (100.0, 8.5e-13),
            (1000.0, 2.7e-13),
            (10_000.0, 8.5e-14),
            (100_000.0, 2.7e-14),
            (432_000.0, 1.0e-14),
            (2_592_000.0, 1.0e-14),
        ],
        aging_per_day: 0.0,
        aging_note: "no aging rate is published; the datasheet bounds the lifetime \
                     change at 5.0e-14, which is not converted into a rate",
        temperature_bound: 8.0e-14,
        temperature_min_c: 0.0,
        temperature_max_c: 50.0,
        temperature_note: "±8.0e-14 frequency change versus environment (0 °C to 50 °C, \
                           humidity, magnetic field, shock), attributed wholly to \
                           temperature",
    },
    OscillatorPreset {
        id: "csac",
        class: "chip-scale atomic clock (CSAC)",
        model: "Microchip SA.45s CSAC, options 001 and 003",
        document: "Microchip SA.45s CSAC Options 001 and 003 datasheet, DS00002985D \
                   (5/23)",
        url: "https://ww1.microchip.com/downloads/aemDocuments/documents/FTD/\
              ProductDocuments/Brochures/SA.45s-CSAC-Options-001-and-003-00002985.pdf",
        adev_points: &[(1.0, 3e-10), (10.0, 1e-10), (100.0, 3e-11), (1000.0, 1e-11)],
        aging_per_day: 9e-10 / 30.0,
        aging_note: "<9e-10 per month after 30 days of continuous operation, converted \
                     at 30 days per month",
        temperature_bound: 5e-10,
        temperature_min_c: -10.0,
        temperature_max_c: 70.0,
        temperature_note: "±5e-10 maximum frequency change over −10 °C to 70 °C",
    },
];

/// The preset with this id.
pub fn preset_by_id(id: &str) -> Option<&'static OscillatorPreset> {
    PRESETS.iter().find(|p| p.id == id)
}

/// Power-law noise levels as Allan variances: `σ_y²(τ) = white/τ + flicker + rw·τ`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct NoiseFit {
    /// White frequency noise: the Allan variance at τ = 1 s from this term (s·1).
    pub white: f64,
    /// Flicker frequency noise: the flat Allan-variance floor.
    pub flicker: f64,
    /// Random-walk frequency noise: the Allan variance slope per second.
    pub random_walk: f64,
    /// The factor every term's Allan deviation was scaled up by so the model is at or
    /// above every datasheet point (1 when the fit already was).
    pub envelope_scale: f64,
}

impl NoiseFit {
    /// The model Allan deviation at `tau_s`.
    pub fn adev(&self, tau_s: f64) -> f64 {
        (self.white / tau_s + self.flicker + self.random_walk * tau_s).sqrt()
    }
}

/// Fit the three power-law levels to datasheet Allan-deviation points.
///
/// Least squares on the relative Allan-variance residual `model/spec² − 1`, which is
/// linear in the three non-negative levels; the non-negativity is enforced by trying
/// every subset of active terms and keeping the best feasible one. The fit is then
/// scaled up, if needed, until the model is at or above every point: the datasheet
/// figures are maxima, so the model is an envelope of them, not a median through them.
pub fn fit_noise(points: &[(f64, f64)]) -> NoiseFit {
    let rows: Vec<[f64; 3]> = points
        .iter()
        .map(|&(t, s)| {
            let v = s * s;
            [1.0 / (t * v), 1.0 / v, t / v]
        })
        .collect();
    let mut best: Option<([f64; 3], f64)> = None;
    for mask in 1u8..8 {
        let active: Vec<usize> = (0..3).filter(|i| mask & (1 << i) != 0).collect();
        let k = active.len();
        let mut ata = vec![vec![0.0; k]; k];
        let mut atb = vec![0.0; k];
        for r in &rows {
            for (a, &i) in active.iter().enumerate() {
                atb[a] += r[i];
                for (b, &j) in active.iter().enumerate() {
                    ata[a][b] += r[i] * r[j];
                }
            }
        }
        let Some(sol) = solve_small(ata, atb) else {
            continue;
        };
        if sol.iter().any(|&x| x.is_nan() || x < 0.0 || !x.is_finite()) {
            continue;
        }
        let mut coef = [0.0; 3];
        for (a, &i) in active.iter().enumerate() {
            coef[i] = sol[a];
        }
        let res: f64 = rows
            .iter()
            .map(|r| {
                let m = r[0] * coef[0] + r[1] * coef[1] + r[2] * coef[2];
                (m - 1.0) * (m - 1.0)
            })
            .sum();
        if best.as_ref().is_none_or(|(_, b)| res < *b) {
            best = Some((coef, res));
        }
    }
    let coef = best.map(|(c, _)| c).unwrap_or([0.0; 3]);
    let raw = NoiseFit {
        white: coef[0],
        flicker: coef[1],
        random_walk: coef[2],
        envelope_scale: 1.0,
    };
    let scale = points
        .iter()
        .map(|&(t, s)| s / raw.adev(t))
        .fold(1.0_f64, f64::max);
    let s2 = scale * scale;
    NoiseFit {
        white: raw.white * s2,
        flicker: raw.flicker * s2,
        random_walk: raw.random_walk * s2,
        envelope_scale: scale,
    }
}

/// Solve a small dense linear system by Gaussian elimination with partial pivoting.
fn solve_small(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    for col in 0..n {
        let piv = (col..n).max_by(|&i, &j| a[i][col].abs().total_cmp(&a[j][col].abs()))?;
        if a[piv][col].abs() < 1e-300 {
            return None;
        }
        a.swap(col, piv);
        b.swap(col, piv);
        for row in col + 1..n {
            let f = a[row][col] / a[col][col];
            let pivot_row = a[col].clone();
            for (dst, src) in a[row].iter_mut().zip(pivot_row.iter()).skip(col) {
                *dst -= f * src;
            }
            b[row] -= f * b[col];
        }
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let s: f64 = (i + 1..n).map(|j| a[i][j] * x[j]).sum();
        x[i] = (b[i] - s) / a[i][i];
    }
    Some(x)
}

// ---------------------------------------------------------------------------------------
// Estimators
// ---------------------------------------------------------------------------------------

/// MTIE over windows of `m + 1` samples: the same number as [`crate::allan::mtie`],
/// computed with monotonic-queue sliding minimum and maximum in O(n).
pub fn mtie_sliding(x: &[f64], m: usize) -> f64 {
    assert!(m >= 1, "m must be >= 1");
    let win = m + 1;
    assert!(x.len() >= win, "need at least m+1 samples for MTIE");
    let mut maxq: std::collections::VecDeque<usize> = std::collections::VecDeque::new();
    let mut minq: std::collections::VecDeque<usize> = std::collections::VecDeque::new();
    let mut worst = 0.0_f64;
    for (i, &v) in x.iter().enumerate() {
        while maxq.back().is_some_and(|&j| x[j] <= v) {
            maxq.pop_back();
        }
        maxq.push_back(i);
        while minq.back().is_some_and(|&j| x[j] >= v) {
            minq.pop_back();
        }
        minq.push_back(i);
        if i + 1 >= win {
            let start = i + 1 - win;
            while maxq.front().is_some_and(|&j| j < start) {
                maxq.pop_front();
            }
            while minq.front().is_some_and(|&j| j < start) {
                minq.pop_front();
            }
            let (hi, lo) = (x[maxq[0]], x[minq[0]]);
            worst = worst.max(hi - lo);
        }
    }
    worst
}

/// Averaging factors on a roughly logarithmic grid (1, 2, 3, 5, 7 per decade) up to
/// `max_m`, with `max_m` itself appended.
pub fn tau_grid(max_m: usize) -> Vec<usize> {
    let mut out = Vec::new();
    let mut decade = 1usize;
    'outer: loop {
        for k in [1usize, 2, 3, 5, 7] {
            let m = k.saturating_mul(decade);
            if m > max_m {
                break 'outer;
            }
            out.push(m);
        }
        decade = match decade.checked_mul(10) {
            Some(d) => d,
            None => break,
        };
    }
    if max_m >= 1 && out.last() != Some(&max_m) {
        out.push(max_m);
    }
    out
}

/// One point of a curve: observation interval and value, both as reported.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct CurvePoint {
    pub tau_s: f64,
    pub value_ns: f64,
}

/// The MTIE curve of `te_ns` (sample interval `dt_s`) on [`tau_grid`] up to the whole
/// record.
pub fn mtie_curve_ns(te_ns: &[f64], dt_s: f64) -> Vec<CurvePoint> {
    if te_ns.len() < 2 {
        return Vec::new();
    }
    tau_grid(te_ns.len() - 1)
        .into_iter()
        .map(|m| CurvePoint {
            tau_s: m as f64 * dt_s,
            value_ns: mtie_sliding(te_ns, m),
        })
        .collect()
}

/// The TDEV curve of `te_ns`, only at averaging times the record supports: the record
/// must be at least twelve times τ long (the minimum measurement period ITU-T G.8272
/// clause 6.2 and G.8272.1 clause 6.2 state for TDEV), and the estimator needs more
/// than `3m` samples.
pub fn tdev_curve_ns(te_ns: &[f64], dt_s: f64) -> Vec<CurvePoint> {
    let n = te_ns.len();
    if n < 13 {
        return Vec::new();
    }
    let max_m = (n - 1) / 12;
    tau_grid(max_m)
        .into_iter()
        .filter(|&m| n > 3 * m)
        .map(|m| CurvePoint {
            tau_s: m as f64 * dt_s,
            value_ns: crate::allan::time_deviation(te_ns, dt_s, m),
        })
        .collect()
}

/// A first-order low-pass filter with a 0.1 Hz bandwidth, as the discrete exponential
/// smoother `y_k = y_{k-1} + α (x_k − y_{k-1})` with `α = 1 − exp(−2π·0.1·dt)`, started
/// at the first sample. An approximation of the test equipment's filter, not a copy of
/// any instrument's implementation.
pub fn low_pass_0p1hz(x: &[f64], dt_s: f64) -> Vec<f64> {
    let alpha = 1.0 - (-2.0 * std::f64::consts::PI * 0.1 * dt_s).exp();
    let mut out = Vec::with_capacity(x.len());
    let mut y = match x.first() {
        Some(&v) => v,
        None => return out,
    };
    for &v in x {
        y += alpha * (v - y);
        out.push(y);
    }
    out
}

/// The largest sample interval the 0.1 Hz filter is applied at: one second, the one
/// pulse per second sampling the masks are written for. Coarser records are reported
/// NOT-EVALUATED against a filtered mask rather than filtered badly.
pub const MAX_FILTER_DT_S: f64 = 1.0;

// ---------------------------------------------------------------------------------------
// Scenario
// ---------------------------------------------------------------------------------------

fn d_seed() -> u64 {
    20_260_925
}
fn d_masks() -> Vec<String> {
    vec!["eprtc-a-holdover".into(), "prtc-a".into()]
}
fn d_oscillator() -> String {
    "rubidium".into()
}
fn d_loss() -> f64 {
    3600.0
}
fn d_duration() -> f64 {
    90_000.0
}
fn d_dt() -> f64 {
    1.0
}
fn d_locked_sigma() -> f64 {
    1.0
}
fn d_temp_amp() -> f64 {
    2.0
}
fn d_temp_period() -> f64 {
    86_400.0
}
fn d_locked_days() -> f64 {
    5.0
}

/// The synthetic-holdover input.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct HoldoverInput {
    /// One of `ocxo`, `rubidium`, `caesium`, `csac`.
    #[serde(default = "d_oscillator")]
    pub oscillator: String,
    /// Time of the GNSS loss from the start of the record (s).
    #[serde(default = "d_loss")]
    pub gnss_loss_s: f64,
    /// Record length (s).
    #[serde(default = "d_duration")]
    pub duration_s: f64,
    /// Sample interval (s).
    #[serde(default = "d_dt")]
    pub sample_interval_s: f64,
    /// White phase noise of the disciplined clock before the loss, 1 sigma (ns).
    #[serde(default = "d_locked_sigma")]
    pub locked_te_sigma_ns: f64,
    /// Residual fractional frequency offset at the moment of loss.
    #[serde(default)]
    pub initial_frequency_offset: f64,
    /// Peak temperature swing about the value at the loss (K).
    #[serde(default = "d_temp_amp")]
    pub temperature_amplitude_k: f64,
    /// Period of the temperature cycle (s).
    #[serde(default = "d_temp_period")]
    pub temperature_period_s: f64,
    /// Locked-mode duration before the loss (days), for the ePRTC-A holdover envelope.
    #[serde(default = "d_locked_days")]
    pub locked_duration_days: f64,
    /// Overrides of the preset's figures.
    #[serde(default)]
    pub aging_per_day: Option<f64>,
    #[serde(default)]
    pub temperature_coeff_per_k: Option<f64>,
}

impl Default for HoldoverInput {
    fn default() -> Self {
        toml::from_str("").expect("an empty holdover table takes every default")
    }
}

/// The ingested-series input.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SeriesInput {
    /// `[time_s, time_error_ns]` pairs, uniformly sampled.
    #[serde(default)]
    pub samples: Vec<[f64; 2]>,
    /// A CSV file of `time_s,time_error_ns` rows (native builds only; a header line and
    /// `#` comments are skipped).
    #[serde(default)]
    pub csv_path: Option<String>,
    /// Start of a holdover within the series (s), from which budgets and the ePRTC-A
    /// holdover envelope are timed. Absent: timed from the first sample, and the
    /// envelope is not evaluated.
    #[serde(default)]
    pub holdover_start_s: Option<f64>,
    /// Locked-mode duration before `holdover_start_s` (days), for the envelope.
    #[serde(default = "d_locked_days")]
    pub locked_duration_days: f64,
}

/// The `telecom-timing` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct TelecomTimingScenario {
    #[serde(default)]
    pub kind: String,
    #[serde(default = "d_seed")]
    pub seed: u64,
    /// Mask ids from [`MASKS`].
    #[serde(default = "d_masks")]
    pub masks: Vec<String>,
    /// Time-error budgets; the [`default_budgets`] when absent.
    #[serde(default)]
    pub budgets: Option<Vec<Budget>>,
    #[serde(default)]
    pub holdover: Option<HoldoverInput>,
    #[serde(default)]
    pub series: Option<SeriesInput>,
}

/// A time-error record: uniform samples starting at `t0_s`.
#[derive(Clone, Debug)]
pub struct TeRecord {
    pub t0_s: f64,
    pub dt_s: f64,
    pub te_ns: Vec<f64>,
}

/// The oscillator model a synthetic holdover ran with.
#[derive(Clone, Debug)]
pub struct HoldoverModel {
    pub preset: &'static OscillatorPreset,
    pub fit: NoiseFit,
    pub aging_per_day: f64,
    pub temperature_coeff_per_k: f64,
}

/// Build the oscillator model for `h` (preset, fitted noise, and any override).
pub fn holdover_model(h: &HoldoverInput) -> Result<HoldoverModel, String> {
    let preset = preset_by_id(&h.oscillator).ok_or_else(|| {
        format!(
            "unknown oscillator {:?}; expected one of {}",
            h.oscillator,
            PRESETS.iter().map(|p| p.id).collect::<Vec<_>>().join(", ")
        )
    })?;
    let aging = h.aging_per_day.unwrap_or(preset.aging_per_day);
    let tc = h
        .temperature_coeff_per_k
        .unwrap_or_else(|| preset.temperature_coeff_per_k());
    if !aging.is_finite() || !tc.is_finite() {
        return Err("aging_per_day and temperature_coeff_per_k must be finite".into());
    }
    Ok(HoldoverModel {
        preset,
        fit: with_flicker_floor(fit_noise(preset.adev_points), preset.adev_points),
        aging_per_day: aging,
        temperature_coeff_per_k: tc,
    })
}

/// The stated rule for the flicker floor: never below the datasheet's Allan deviation
/// at its longest listed averaging time. A datasheet stops listing where its maker
/// stops promising improvement, so the model does not let the clock keep improving
/// past that point on the strength of a white-noise extrapolation. A MODELLED
/// assumption that can only make the holdover worse, never better.
pub const FLICKER_FLOOR_RULE: &str = "flicker floor = max(least-squares fit, the datasheet \
                                      Allan deviation at its longest listed averaging time)";

/// Apply [`FLICKER_FLOOR_RULE`] to a fit.
pub fn with_flicker_floor(fit: NoiseFit, points: &[(f64, f64)]) -> NoiseFit {
    let last = points
        .iter()
        .max_by(|a, b| a.0.total_cmp(&b.0))
        .map(|&(_, s)| s * s)
        .unwrap_or(0.0);
    NoiseFit {
        flicker: fit.flicker.max(last),
        ..fit
    }
}

/// The temperature term's phase contribution (s) at `tau_s` after the loss:
/// `∫ k·A·sin(2πt/P) dt = k·A·P/(2π)·(1 − cos(2πτ/P))`.
pub fn temperature_phase_s(coeff_per_k: f64, amp_k: f64, period_s: f64, tau_s: f64) -> f64 {
    let w = 2.0 * std::f64::consts::PI / period_s;
    coeff_per_k * amp_k / w * (1.0 - (w * tau_s).cos())
}

/// Synthesise the time-error record of a GNSS loss followed by free-running holdover.
pub fn synthesize_holdover(
    h: &HoldoverInput,
    model: &HoldoverModel,
    seed: u64,
) -> Result<TeRecord, String> {
    let dt = h.sample_interval_s;
    if !(dt.is_finite() && dt > 0.0) {
        return Err("sample_interval_s must be finite and positive".into());
    }
    if !(h.duration_s.is_finite() && h.duration_s >= 12.0 * dt) {
        return Err("duration_s must be finite and at least twelve samples long".into());
    }
    if !(h.gnss_loss_s.is_finite() && h.gnss_loss_s >= 0.0 && h.gnss_loss_s < h.duration_s) {
        return Err("gnss_loss_s must lie in [0, duration_s)".into());
    }
    if !(h.locked_te_sigma_ns.is_finite() && h.locked_te_sigma_ns >= 0.0) {
        return Err("locked_te_sigma_ns must be finite and >= 0".into());
    }
    if !(h.temperature_period_s.is_finite()
        && h.temperature_period_s > 0.0
        && h.temperature_amplitude_k.is_finite()
        && h.initial_frequency_offset.is_finite())
    {
        return Err("temperature and frequency-offset inputs must be finite (period > 0)".into());
    }
    let n = (h.duration_s / dt).floor() as usize + 1;
    if n > 5_000_000 {
        return Err("the record would exceed 5 000 000 samples; raise sample_interval_s".into());
    }
    let hold_len = h.duration_s - h.gnss_loss_s;
    let mut clock = ClockModel::new(
        "telecom-holdover",
        model.preset.document,
        h.initial_frequency_offset,
        model.fit.white,
        3.0 * model.fit.random_walk,
    )
    .with_drift(model.aging_per_day / 86_400.0);
    if model.fit.flicker > 0.0 {
        clock = clock.with_flicker_band(model.fit.flicker.sqrt(), dt, hold_len.max(10.0 * dt), 4);
    }
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let locked = if h.locked_te_sigma_ns > 0.0 {
        Some(Normal::new(0.0, h.locked_te_sigma_ns).map_err(|e| e.to_string())?)
    } else {
        None
    };
    let mut te = Vec::with_capacity(n);
    for k in 0..n {
        let t = k as f64 * dt;
        if t < h.gnss_loss_s {
            te.push(locked.map(|d| d.sample(&mut rng)).unwrap_or(0.0));
        } else {
            let tau = t - h.gnss_loss_s;
            let x = clock.phase()
                + temperature_phase_s(
                    model.temperature_coeff_per_k,
                    h.temperature_amplitude_k,
                    h.temperature_period_s,
                    tau,
                );
            te.push(x * 1e9);
            clock.step(dt, &mut rng);
        }
    }
    Ok(TeRecord {
        t0_s: 0.0,
        dt_s: dt,
        te_ns: te,
    })
}

/// Build a record from `(time_s, time_error_ns)` pairs, requiring uniform sampling.
pub fn record_from_pairs(pairs: &[[f64; 2]]) -> Result<TeRecord, String> {
    if pairs.len() < 13 {
        return Err(format!(
            "a time-error series needs at least 13 samples, got {}",
            pairs.len()
        ));
    }
    if pairs.iter().any(|p| !p[0].is_finite() || !p[1].is_finite()) {
        return Err("every time_s and time_error_ns must be finite".into());
    }
    let dt = pairs[1][0] - pairs[0][0];
    if dt.is_nan() || dt <= 0.0 {
        return Err("time_s must increase".into());
    }
    for (i, w) in pairs.windows(2).enumerate() {
        let d = w[1][0] - w[0][0];
        if (d - dt).abs() > 1e-6 * dt.max(1.0) {
            return Err(format!(
                "the series must be uniformly sampled: step {} is {d} s, the first is {dt} s",
                i + 1
            ));
        }
    }
    Ok(TeRecord {
        t0_s: pairs[0][0],
        dt_s: dt,
        te_ns: pairs.iter().map(|p| p[1]).collect(),
    })
}

/// Parse CSV text of `time_s,time_error_ns` rows. The first non-comment line may be a
/// header that does not parse as numbers; blank lines and `#` comments are skipped.
pub fn parse_csv_pairs(text: &str) -> Result<Vec<[f64; 2]>, String> {
    let mut out = Vec::new();
    let mut header_seen = false;
    for (i, line) in text.lines().enumerate() {
        let l = line.trim();
        if l.is_empty() || l.starts_with('#') {
            continue;
        }
        let mut it = l.split(',').map(|s| s.trim().parse::<f64>());
        match (it.next(), it.next()) {
            (Some(Ok(t)), Some(Ok(v))) => out.push([t, v]),
            _ if out.is_empty() && !header_seen => header_seen = true,
            _ => return Err(format!("CSV line {} is not `time_s,time_error_ns`", i + 1)),
        }
    }
    Ok(out)
}

#[cfg(not(target_arch = "wasm32"))]
fn read_csv(path: &str) -> Result<Vec<[f64; 2]>, String> {
    let text =
        std::fs::read_to_string(path).map_err(|e| format!("cannot read csv_path {path:?}: {e}"))?;
    parse_csv_pairs(&text)
}

#[cfg(target_arch = "wasm32")]
fn read_csv(_path: &str) -> Result<Vec<[f64; 2]>, String> {
    Err(
        "csv_path is not available in the WebAssembly build; give the series inline as \
         `samples`"
            .into(),
    )
}

/// The outcome of one check.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct CheckResult {
    pub metric: &'static str,
    pub source: &'static str,
    pub verdict: &'static str,
    /// The limit at the binding point (ns); null when nothing was evaluated.
    pub limit_ns: Option<f64>,
    /// The measured value at the binding point (ns).
    pub value_ns: Option<f64>,
    /// `limit − value` at the binding point (ns); negative on a FAIL.
    pub margin_ns: Option<f64>,
    /// For a curve: the observation interval of the binding point (s).
    pub worst_tau_s: Option<f64>,
    /// For a curve: how many points of the curve fell inside the mask's range.
    pub points_evaluated: usize,
    pub note: String,
}

fn verdict(ok: bool) -> &'static str {
    if ok {
        "PASS"
    } else {
        "FAIL"
    }
}

fn not_evaluated(metric: &'static str, source: &'static str, note: String) -> CheckResult {
    CheckResult {
        metric,
        source,
        verdict: "NOT-EVALUATED",
        limit_ns: None,
        value_ns: None,
        margin_ns: None,
        worst_tau_s: None,
        points_evaluated: 0,
        note,
    }
}

/// Check a curve against a piecewise mask. The binding point is the one with the
/// smallest margin `limit − value`.
pub fn check_curve(metric: &'static str, curve: &[CurvePoint], mask: &CurveMask) -> CheckResult {
    let mut best: Option<(f64, f64, f64)> = None; // (margin, tau, limit)
    let mut n = 0usize;
    let mut value_at = 0.0;
    for p in curve {
        if let Some(lim) = limit_at(mask.segments, p.tau_s) {
            n += 1;
            let margin = lim - p.value_ns;
            if best.is_none_or(|(m, _, _)| margin < m) {
                best = Some((margin, p.tau_s, lim));
                value_at = p.value_ns;
            }
        }
    }
    match best {
        None => not_evaluated(
            metric,
            mask.source,
            "no point of the curve falls inside the mask's observation-interval range".into(),
        ),
        Some((margin, tau, lim)) => CheckResult {
            metric,
            source: mask.source,
            verdict: verdict(margin >= 0.0),
            limit_ns: Some(lim),
            value_ns: Some(value_at),
            margin_ns: Some(margin),
            worst_tau_s: Some(tau),
            points_evaluated: n,
            note: String::new(),
        },
    }
}

fn check_scalar(metric: &'static str, limit: &Limit, value_ns: f64) -> CheckResult {
    let margin = limit.value_ns - value_ns;
    CheckResult {
        metric,
        source: limit.source,
        verdict: verdict(margin >= 0.0),
        limit_ns: Some(limit.value_ns),
        value_ns: Some(value_ns),
        margin_ns: Some(margin),
        worst_tau_s: None,
        points_evaluated: 1,
        note: String::new(),
    }
}

/// The worst absolute mean of consecutive non-overlapping 1 000 s blocks: the
/// constant-time-error estimate ITU-T G.8273.2 Table 7-3 Note 1 describes ("averaging
/// the time error sequence over 1 000 s"), taken over every block of the record.
pub fn worst_cte_ns(te_ns: &[f64], dt_s: f64) -> Option<f64> {
    let per = (1000.0 / dt_s).round() as usize;
    if per == 0 || te_ns.len() < per {
        return None;
    }
    te_ns
        .chunks_exact(per)
        .map(|c| (c.iter().sum::<f64>() / c.len() as f64).abs())
        .reduce(f64::max)
}

/// The result of checking one mask.
#[derive(Clone, Debug, Serialize)]
pub struct MaskResult {
    pub id: &'static str,
    pub title: &'static str,
    pub recommendation: &'static str,
    pub condition: &'static str,
    pub measurement_filter: &'static str,
    pub verdict: &'static str,
    pub checks: Vec<CheckResult>,
    pub not_specified: &'static str,
}

fn overall(checks: &[CheckResult]) -> &'static str {
    if checks.iter().any(|c| c.verdict == "FAIL") {
        "FAIL"
    } else if checks.iter().any(|c| c.verdict == "INCOMPLETE") {
        "INCOMPLETE"
    } else if checks.iter().any(|c| c.verdict == "PASS") {
        "PASS"
    } else {
        "NOT-EVALUATED"
    }
}

/// The ePRTC-A holdover envelope check.
#[derive(Clone, Debug, Serialize)]
pub struct EnvelopeResult {
    pub source: &'static str,
    pub locked_duration_days: f64,
    pub holdover_period_s: f64,
    pub covers_holdover_period: bool,
    /// First time after the start of holdover at which `|TE|` is above the envelope (s).
    pub time_to_exceed_s: Option<f64>,
    /// Smallest `limit − |TE|` inside the holdover period (ns).
    pub min_margin_ns: Option<f64>,
    pub verdict: &'static str,
}

/// Check `|TE|` against the ePRTC-A holdover envelope from `start_s` on.
pub fn check_envelope(rec: &TeRecord, start_s: f64, locked_days: f64) -> EnvelopeResult {
    let h = eprtc_a_holdover_period_s(locked_days);
    let mut exceed = None;
    let mut min_margin: Option<f64> = None;
    let mut last_tau = 0.0_f64;
    for (k, &x) in rec.te_ns.iter().enumerate() {
        let tau = rec.t0_s + k as f64 * rec.dt_s - start_s;
        if let Some(lim) = eprtc_a_holdover_limit_ns(locked_days, tau) {
            last_tau = last_tau.max(tau);
            let m = lim - x.abs();
            if min_margin.is_none_or(|v| m < v) {
                min_margin = Some(m);
            }
            if m < 0.0 && exceed.is_none() {
                exceed = Some(tau);
            }
        }
    }
    let covers = last_tau + 0.5 * rec.dt_s >= h;
    let verdict = match (min_margin, exceed) {
        (None, _) => "NOT-EVALUATED",
        (_, Some(_)) => "FAIL",
        (Some(_), None) if covers => "PASS",
        _ => "INCOMPLETE",
    };
    EnvelopeResult {
        source: "G.8272.1 clause 8.2.1, Table 3",
        locked_duration_days: locked_days,
        holdover_period_s: h,
        covers_holdover_period: covers,
        time_to_exceed_s: exceed,
        min_margin_ns: min_margin,
        verdict,
    }
}

/// Time to exceed one budget.
#[derive(Clone, Debug, Serialize)]
pub struct BudgetResult {
    pub name: String,
    pub source: String,
    pub max_abs_te_ns: f64,
    /// First time after the start of holdover (or of the record) at which `|TE|` is
    /// above the budget (s); null when it never is.
    pub time_to_exceed_s: Option<f64>,
    pub exceeded: bool,
}

/// Time to exceed each budget, from `start_s` on, at the record's sample resolution.
pub fn budget_results(rec: &TeRecord, start_s: f64, budgets: &[Budget]) -> Vec<BudgetResult> {
    budgets
        .iter()
        .map(|b| {
            let t = rec.te_ns.iter().enumerate().find_map(|(k, &x)| {
                let tau = rec.t0_s + k as f64 * rec.dt_s - start_s;
                (tau >= 0.0 && x.abs() > b.max_abs_te_ns).then_some(tau)
            });
            BudgetResult {
                name: b.name.clone(),
                source: b.source.clone(),
                max_abs_te_ns: b.max_abs_te_ns,
                time_to_exceed_s: t,
                exceeded: t.is_some(),
            }
        })
        .collect()
}

/// Check the record against one mask.
pub fn check_mask(
    mask: &TimingMask,
    rec: &TeRecord,
    raw_mtie: &[CurvePoint],
    raw_tdev: &[CurvePoint],
    envelope: Option<&EnvelopeResult>,
) -> MaskResult {
    let mut checks = Vec::new();
    let filtered;
    let (series, mtie, tdev): (&[f64], Vec<CurvePoint>, Vec<CurvePoint>) = match mask.filter {
        MeasurementFilter::None => (&rec.te_ns, raw_mtie.to_vec(), raw_tdev.to_vec()),
        MeasurementFilter::LowPass0p1Hz => {
            if rec.dt_s > MAX_FILTER_DT_S {
                let note = format!(
                    "the mask is defined through a 0.1 Hz low-pass filter, which this \
                     engine applies only at sample intervals of {MAX_FILTER_DT_S} s or \
                     less; this record is sampled every {} s",
                    rec.dt_s
                );
                for (metric, present, source) in [
                    (
                        "max_abs_te",
                        mask.max_abs_te.is_some(),
                        mask.max_abs_te.map(|l| l.source),
                    ),
                    ("cte", mask.cte.is_some(), mask.cte.map(|l| l.source)),
                    ("mtie", mask.mtie.is_some(), mask.mtie.map(|c| c.source)),
                    ("tdev", mask.tdev.is_some(), mask.tdev.map(|c| c.source)),
                ] {
                    if present {
                        checks.push(not_evaluated(metric, source.unwrap_or(""), note.clone()));
                    }
                }
                return MaskResult {
                    id: mask.id,
                    title: mask.title,
                    recommendation: mask.recommendation,
                    condition: mask.condition.as_str(),
                    measurement_filter: mask.filter.as_str(),
                    verdict: overall(&checks),
                    checks,
                    not_specified: mask.not_specified,
                };
            }
            filtered = low_pass_0p1hz(&rec.te_ns, rec.dt_s);
            (
                &filtered,
                mtie_curve_ns(&filtered, rec.dt_s),
                tdev_curve_ns(&filtered, rec.dt_s),
            )
        }
    };
    if let Some(l) = &mask.max_abs_te {
        // G.8273.2 Table 7-1 is unfiltered even though the rest of the class is not.
        let unfiltered = l.source.contains("unfiltered");
        let src: &[f64] = if unfiltered { &rec.te_ns } else { series };
        let v = src.iter().fold(0.0_f64, |a, &x| a.max(x.abs()));
        checks.push(check_scalar("max_abs_te", l, v));
    }
    if let Some(l) = &mask.cte {
        match worst_cte_ns(series, rec.dt_s) {
            Some(v) => checks.push(check_scalar("cte", l, v)),
            None => checks.push(not_evaluated(
                "cte",
                l.source,
                "the record is shorter than the 1 000 s averaging the estimate needs".into(),
            )),
        }
    }
    if let Some(c) = &mask.mtie {
        checks.push(check_curve("mtie", &mtie, c));
    }
    if let Some(c) = &mask.tdev {
        checks.push(check_curve("tdev", &tdev, c));
    }
    if mask.holdover_envelope {
        match envelope {
            Some(e) => {
                let lim = e.min_margin_ns.map(|_| {
                    eprtc_a_holdover_limit_ns(e.locked_duration_days, e.holdover_period_s)
                });
                checks.push(CheckResult {
                    metric: "holdover_te_envelope",
                    source: e.source,
                    verdict: e.verdict,
                    limit_ns: lim.flatten(),
                    value_ns: None,
                    margin_ns: e.min_margin_ns,
                    worst_tau_s: e.time_to_exceed_s,
                    points_evaluated: usize::from(e.min_margin_ns.is_some()),
                    note: "limit_ns is the envelope at the end of the holdover period; \
                           margin_ns is the smallest margin inside it; worst_tau_s is the \
                           time to exceed, when the envelope is exceeded"
                        .into(),
                });
            }
            None => checks.push(not_evaluated(
                "holdover_te_envelope",
                "G.8272.1 clause 8.2.1, Table 3",
                "no holdover start is known for this record (set series.holdover_start_s)".into(),
            )),
        }
    }
    MaskResult {
        id: mask.id,
        title: mask.title,
        recommendation: mask.recommendation,
        condition: mask.condition.as_str(),
        measurement_filter: mask.filter.as_str(),
        verdict: overall(&checks),
        checks,
        not_specified: mask.not_specified,
    }
}

/// Everything a run computes, before it is rendered.
#[derive(Debug)]
pub struct TelecomRun {
    pub record: TeRecord,
    pub mtie: Vec<CurvePoint>,
    pub tdev: Vec<CurvePoint>,
    pub masks: Vec<MaskResult>,
    pub envelope: Option<EnvelopeResult>,
    pub budgets: Vec<BudgetResult>,
    pub holdover_start_s: Option<f64>,
    pub model: Option<HoldoverModel>,
}

/// SHA-256 of the time-error series, as little-endian IEEE-754 bytes.
pub fn series_sha256(te_ns: &[f64]) -> String {
    let mut h = Sha256::new();
    for x in te_ns {
        h.update(x.to_le_bytes());
    }
    hex::encode(h.finalize())
}

impl TelecomTimingScenario {
    fn mode(&self) -> Result<&'static str, String> {
        match (&self.holdover, &self.series) {
            (Some(_), Some(_)) => Err("give either [holdover] or [series], not both".into()),
            (_, Some(_)) => Ok("ingested-series"),
            _ => Ok("synthetic-holdover"),
        }
    }

    /// The canonical scenario hash: SHA-256 of the scenario as parsed (defaults
    /// filled), so the seed and every input are inside it.
    pub fn scenario_hash(&self) -> String {
        let c = serde_json::to_string(self).unwrap_or_default();
        let mut h = Sha256::new();
        h.update(c.as_bytes());
        hex::encode(h.finalize())
    }

    /// Compute the run.
    pub fn run(&self) -> Result<TelecomRun, String> {
        let mode = self.mode()?;
        let mut masks = Vec::new();
        for id in &self.masks {
            masks.push(mask_by_id(id).ok_or_else(|| {
                format!(
                    "unknown mask {id:?}; expected one of {}",
                    MASKS.iter().map(|m| m.id).collect::<Vec<_>>().join(", ")
                )
            })?);
        }
        let budgets = self.budgets.clone().unwrap_or_else(default_budgets);
        if budgets
            .iter()
            .any(|b| !(b.max_abs_te_ns.is_finite() && b.max_abs_te_ns > 0.0))
        {
            return Err("every budget max_abs_te_ns must be finite and positive".into());
        }
        let (record, start, locked_days, model) = if mode == "synthetic-holdover" {
            let h = self.holdover.clone().unwrap_or_default();
            let model = holdover_model(&h)?;
            let rec = synthesize_holdover(&h, &model, self.seed)?;
            (
                rec,
                Some(h.gnss_loss_s),
                h.locked_duration_days,
                Some(model),
            )
        } else {
            let s = self.series.clone().unwrap_or_default();
            let pairs = match (&s.csv_path, s.samples.is_empty()) {
                (Some(_), false) => {
                    return Err("give either series.samples or series.csv_path, not both".into())
                }
                (Some(p), true) => read_csv(p)?,
                (None, _) => s.samples.clone(),
            };
            let rec = record_from_pairs(&pairs)?;
            (rec, s.holdover_start_s, s.locked_duration_days, None)
        };
        if !(locked_days.is_finite() && locked_days >= 0.0) {
            return Err("locked_duration_days must be finite and >= 0".into());
        }
        let mtie = mtie_curve_ns(&record.te_ns, record.dt_s);
        let tdev = tdev_curve_ns(&record.te_ns, record.dt_s);
        let envelope = start.map(|s| check_envelope(&record, s, locked_days));
        let checked = masks
            .iter()
            .map(|m| check_mask(m, &record, &mtie, &tdev, envelope.as_ref()))
            .collect();
        let budgets = budget_results(&record, start.unwrap_or(record.t0_s), &budgets);
        Ok(TelecomRun {
            record,
            mtie,
            tdev,
            masks: checked,
            envelope,
            budgets,
            holdover_start_s: start,
            model,
        })
    }

    /// Run and render `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.run()?;
        let json = self.to_json(&r)?;
        let summary = summary_line(&r);
        let svg = to_svg(&r);
        Ok((json, summary, svg))
    }

    /// Run and render the CSV table: one row per MTIE observation interval, with the
    /// TDEV where it was computed and every selected mask's limit there.
    pub fn to_csv(&self) -> Result<String, String> {
        let r = self.run()?;
        Ok(csv_table(&r))
    }

    /// Run once and render `(json, summary, svg, csv)`.
    pub fn run_all(&self) -> Result<(String, String, String, String), String> {
        let r = self.run()?;
        Ok((
            self.to_json(&r)?,
            summary_line(&r),
            to_svg(&r),
            csv_table(&r),
        ))
    }

    fn to_json(&self, r: &TelecomRun) -> Result<String, String> {
        let rec = &r.record;
        let n = rec.te_ns.len();
        let max_abs = rec.te_ns.iter().fold(0.0_f64, |a, &x| a.max(x.abs()));
        let mean = rec.te_ns.iter().sum::<f64>() / n as f64;
        let oscillator = r.model.as_ref().map(|m| {
            let p = m.preset;
            serde_json::json!({
                "preset": p.id,
                "class": p.class,
                "model": p.model,
                "datasheet": p.document,
                "datasheet_url": p.url,
                "evidence": "MODELLED",
                "provenance": "stability, aging and temperature figures from the named \
                               datasheet; the power-law fit, the 30-day month, the linear \
                               temperature reading and the sinusoidal temperature profile \
                               are this engine's modelling choices",
                "flicker_floor_rule": FLICKER_FLOOR_RULE,
                "aging_note": p.aging_note,
                "temperature_note": p.temperature_note,
                "datasheet_adev": p.adev_points.iter().map(|&(t, s)| serde_json::json!({
                    "tau_s": t,
                    "adev": s,
                    "model_adev": m.fit.adev(t),
                    "model_over_datasheet": m.fit.adev(t) / s,
                })).collect::<Vec<_>>(),
                "aging_per_day": m.aging_per_day,
                "temperature_bound": p.temperature_bound,
                "temperature_min_c": p.temperature_min_c,
                "temperature_max_c": p.temperature_max_c,
                "temperature_coeff_per_k": m.temperature_coeff_per_k,
                "fitted": {
                    "white_fm_adev_1s": m.fit.white.sqrt(),
                    "flicker_floor_adev": m.fit.flicker.sqrt(),
                    "random_walk_fm_adev_1s": m.fit.random_walk.sqrt(),
                    "envelope_scale": m.fit.envelope_scale,
                },
            })
        });
        let holdover = match (&self.holdover, &r.model) {
            (_, Some(m)) => {
                let h = self.holdover.clone().unwrap_or_default();
                let t_end = h.duration_s - h.gnss_loss_s;
                let aging = 0.5 * (m.aging_per_day / 86_400.0) * t_end * t_end * 1e9;
                let temp_peak = 2.0
                    * m.temperature_coeff_per_k
                    * h.temperature_amplitude_k.abs()
                    * h.temperature_period_s
                    / (2.0 * std::f64::consts::PI)
                    * 1e9;
                let det_end = (h.initial_frequency_offset * t_end
                    + 0.5 * (m.aging_per_day / 86_400.0) * t_end * t_end
                    + temperature_phase_s(
                        m.temperature_coeff_per_k,
                        h.temperature_amplitude_k,
                        h.temperature_period_s,
                        t_end,
                    ))
                    * 1e9;
                serde_json::json!({
                    "gnss_loss_s": h.gnss_loss_s,
                    "holdover_duration_s": t_end,
                    "initial_frequency_offset": h.initial_frequency_offset,
                    "locked_te_sigma_ns": h.locked_te_sigma_ns,
                    "temperature_amplitude_k": h.temperature_amplitude_k,
                    "temperature_period_s": h.temperature_period_s,
                    "aging_te_at_end_ns": aging,
                    "temperature_te_peak_ns": temp_peak,
                    "deterministic_te_at_end_ns": det_end,
                })
            }
            _ => serde_json::Value::Null,
        };
        let doc = serde_json::json!({
            "kind": "telecom-timing",
            "label": "MODELLED — time error, MTIE and TDEV checked against transcribed \
                      ITU-T masks. The estimators are validated against allantools; the \
                      mask tables are transcriptions of the named Recommendations; a \
                      synthetic holdover is a model built from public datasheet figures, \
                      not a measurement of any unit. Not a conformance test.",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "scenario_hash": self.scenario_hash(),
            "seed": self.seed,
            "mode": self.mode()?,
            "record": {
                "sample_interval_s": rec.dt_s,
                "n_samples": n,
                "record_length_s": (n - 1) as f64 * rec.dt_s,
                "start_s": rec.t0_s,
                "holdover_start_s": r.holdover_start_s,
                "series_sha256": series_sha256(&rec.te_ns),
            },
            "oscillator": oscillator,
            "holdover": holdover,
            "time_error": {
                "max_abs_te_ns": max_abs,
                "mean_te_ns": mean,
                "te_at_end_ns": rec.te_ns[n - 1],
            },
            "mtie": r.mtie.iter().map(|p| serde_json::json!({"tau_s": p.tau_s, "mtie_ns": p.value_ns})).collect::<Vec<_>>(),
            "tdev": r.tdev.iter().map(|p| serde_json::json!({"tau_s": p.tau_s, "tdev_ns": p.value_ns})).collect::<Vec<_>>(),
            "masks": r.masks,
            "holdover_envelope": r.envelope,
            "budgets": r.budgets,
            "not_implemented": NOT_IMPLEMENTED,
            "units": crate::field_schema::units_block(UNITS),
        });
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }
}

/// What a reader might expect here and will not find, stated in every report.
pub const NOT_IMPLEMENTED: &[&str] = &[
    "every requirement the Recommendations mark 'for further study' (class D beyond \
     max|TE_L|, ePRTC-B holdover, T-BC/T-TSC holdover with both inputs lost, TDEV \
     network limits, ePRTC-A holdover MTIE and TDEV beyond 10 000 s)",
    "high-pass-filtered dynamic time error (dTE_H, G.8273.2 Table 7-7 and G.8271.1 \
     clauses 7.3.2-7.3.3)",
    "the variable-temperature MTIE of G.8273.2 Table 7-6 and the physical-layer-assisted \
     holdover MTIE of G.8273.2 Table 7-10",
    "relative time error (cTE_R, dTE_R,L) between two outputs",
    "the moving-average packet filter G.8272 and G.8272.1 state for PTP interfaces: the \
     series is treated as one pulse per second time interval error",
];

fn summary_line(r: &TelecomRun) -> String {
    let max_abs = r.record.te_ns.iter().fold(0.0_f64, |a, &x| a.max(x.abs()));
    let masks: Vec<String> = r
        .masks
        .iter()
        .map(|m| format!("{} {}", m.id, m.verdict))
        .collect();
    let first_budget = r.budgets.first().map(|b| match b.time_to_exceed_s {
        Some(t) => format!(
            "; {:.0} ns budget exceeded after {:.0} s",
            b.max_abs_te_ns, t
        ),
        None => format!("; {:.0} ns budget never exceeded", b.max_abs_te_ns),
    });
    format!(
        "telecom-timing: max|TE| {:.1} ns over {:.0} s; {}{} (MODELLED)",
        max_abs,
        (r.record.te_ns.len() - 1) as f64 * r.record.dt_s,
        masks.join(", "),
        first_budget.unwrap_or_default()
    )
}

fn csv_table(r: &TelecomRun) -> String {
    let mut header = String::from("tau_s,mtie_ns,tdev_ns");
    let mut cols: Vec<(&'static [Segment], bool)> = Vec::new();
    for m in &r.masks {
        if let Some(mask) = mask_by_id(m.id) {
            if let Some(c) = mask.mtie {
                header.push_str(&format!(",{}_mtie_limit_ns", m.id));
                cols.push((c.segments, true));
            }
            if let Some(c) = mask.tdev {
                header.push_str(&format!(",{}_tdev_limit_ns", m.id));
                cols.push((c.segments, false));
            }
        }
    }
    let mut out = header;
    out.push('\n');
    for p in &r.mtie {
        let tdev = r
            .tdev
            .iter()
            .find(|q| q.tau_s == p.tau_s)
            .map(|q| format!("{:.6e}", q.value_ns))
            .unwrap_or_default();
        out.push_str(&format!("{},{:.6e},{}", p.tau_s, p.value_ns, tdev));
        for (segs, _) in &cols {
            match limit_at(segs, p.tau_s) {
                Some(v) => out.push_str(&format!(",{v:.6}")),
                None => out.push(','),
            }
        }
        out.push('\n');
    }
    out
}

// ---------------------------------------------------------------------------------------
// Chart
// ---------------------------------------------------------------------------------------

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

/// Two panels: |TE| against time with the budgets, and MTIE and TDEV on log-log axes
/// with the first selected mask's MTIE limit.
pub fn to_svg(r: &TelecomRun) -> String {
    let (w, h) = (1180.0, 460.0);
    let mut s = crate::chart::frame_open(
        w,
        h,
        "Telecom timing: time error, MTIE and TDEV",
        &esc(&summary_line(r)),
    );
    // Left panel: |TE| (ns) vs time (h).
    let (lx, top, pw, ph) = (80.0, 80.0, 470.0, 320.0);
    let rec = &r.record;
    let n = rec.te_ns.len();
    let mut y_max = rec.te_ns.iter().fold(0.0_f64, |a, &x| a.max(x.abs()));
    for b in &r.budgets {
        if b.max_abs_te_ns < 4.0 * y_max.max(1e-9) {
            y_max = y_max.max(b.max_abs_te_ns);
        }
    }
    let y_max = if y_max > 0.0 { y_max * 1.05 } else { 1.0 };
    s.push_str(&crate::chart::y_axis(
        lx,
        top,
        pw,
        ph,
        y_max,
        "|time error| (ns)",
    ));
    s.push_str(&crate::chart::panel_axes(
        lx,
        top,
        pw,
        top + ph,
        "absolute time error against the budgets",
    ));
    let t_span = ((n - 1) as f64 * rec.dt_s).max(1e-9);
    let stride = (n / 600).max(1);
    let pts: Vec<String> = (0..n)
        .step_by(stride)
        .map(|k| {
            let x = lx + pw * (k as f64 * rec.dt_s) / t_span;
            let y = top + ph - ph * (rec.te_ns[k].abs() / y_max).min(1.0);
            format!("{x:.1},{y:.1}")
        })
        .collect();
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#e0a458\" stroke-width=\"1.2\" points=\"{}\"/>",
        pts.join(" ")
    ));
    for b in &r.budgets {
        if b.max_abs_te_ns <= y_max {
            let y = top + ph - ph * b.max_abs_te_ns / y_max;
            s.push_str(&format!(
                "<line x1=\"{lx:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"#8c8273\" stroke-dasharray=\"4 3\"/>\
                 <text x=\"{:.0}\" y=\"{:.1}\" font-size=\"10\" fill=\"#8c8273\" text-anchor=\"end\">{:.0} ns</text>",
                lx + pw,
                lx + pw - 4.0,
                y - 3.0,
                b.max_abs_te_ns
            ));
        }
    }
    if let Some(t0) = r.holdover_start_s {
        let x = lx + pw * (t0 - rec.t0_s) / t_span;
        s.push_str(&format!(
            "<line x1=\"{x:.1}\" y1=\"{top:.0}\" x2=\"{x:.1}\" y2=\"{:.0}\" stroke=\"#5b8def\" stroke-dasharray=\"2 3\"/>\
             <text x=\"{:.1}\" y=\"{:.0}\" font-size=\"10\" fill=\"#5b8def\">holdover</text>",
            top + ph,
            x + 3.0,
            top + 12.0
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8c8273\">time ({:.1} h record)</text>",
        lx + pw / 2.0,
        top + ph + 28.0,
        t_span / 3600.0
    ));
    // Right panel: log-log MTIE / TDEV.
    let (rx, rw) = (660.0, 480.0);
    s.push_str(&crate::chart::panel_axes(
        rx,
        top,
        rw,
        top + ph,
        "MTIE (solid), TDEV (dashed), first MTIE mask (grey), ns",
    ));
    let mut vals: Vec<f64> = r
        .mtie
        .iter()
        .chain(r.tdev.iter())
        .map(|p| p.value_ns)
        .filter(|v| *v > 0.0)
        .collect();
    let mask_curve: Option<Vec<(f64, f64)>> = r
        .masks
        .iter()
        .filter_map(|m| mask_by_id(m.id).and_then(|mm| mm.mtie))
        .next()
        .map(|c| {
            r.mtie
                .iter()
                .filter_map(|p| limit_at(c.segments, p.tau_s).map(|l| (p.tau_s, l)))
                .collect()
        });
    if let Some(mc) = &mask_curve {
        vals.extend(mc.iter().map(|&(_, l)| l));
    }
    let taus: Vec<f64> = r.mtie.iter().map(|p| p.tau_s).collect();
    if !vals.is_empty() && !taus.is_empty() {
        let (vlo, vhi) = vals
            .iter()
            .fold((f64::INFINITY, 0.0_f64), |(a, b), &v| (a.min(v), b.max(v)));
        let (ylo, yhi) = (
            vlo.log10().floor(),
            vhi.log10().ceil().max(vlo.log10().floor() + 1.0),
        );
        let (tlo, thi) = (
            taus[0].log10().floor(),
            taus[taus.len() - 1]
                .log10()
                .ceil()
                .max(taus[0].log10().floor() + 1.0),
        );
        let px = |t: f64| rx + rw * (t.log10() - tlo) / (thi - tlo);
        let py = |v: f64| top + ph - ph * (v.max(10f64.powf(ylo)).log10() - ylo) / (yhi - ylo);
        let mut d = ylo as i32;
        while d <= yhi as i32 {
            let y = py(10f64.powi(d));
            s.push_str(&format!(
                "<line x1=\"{rx:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"#262019\"/>\
                 <text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#8c8273\" font-size=\"11\">1e{d}</text>",
                rx + rw,
                rx - 6.0,
                y + 4.0
            ));
            d += 1;
        }
        let mut e = tlo as i32;
        while e <= thi as i32 {
            let x = px(10f64.powi(e));
            s.push_str(&format!(
                "<text x=\"{x:.1}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8c8273\" font-size=\"11\">1e{e} s</text>",
                top + ph + 16.0
            ));
            e += 1;
        }
        let line = |pts: &[(f64, f64)], colour: &str, dash: &str| {
            let p: Vec<String> = pts
                .iter()
                .filter(|&&(_, v)| v > 0.0)
                .map(|&(t, v)| format!("{:.1},{:.1}", px(t), py(v)))
                .collect();
            format!(
                "<polyline fill=\"none\" stroke=\"{colour}\" stroke-width=\"1.5\"{dash} points=\"{}\"/>",
                p.join(" ")
            )
        };
        if let Some(mc) = &mask_curve {
            s.push_str(&line(mc, "#8c8273", ""));
        }
        let m: Vec<(f64, f64)> = r.mtie.iter().map(|p| (p.tau_s, p.value_ns)).collect();
        let t: Vec<(f64, f64)> = r.tdev.iter().map(|p| (p.tau_s, p.value_ns)).collect();
        s.push_str(&line(&m, "#e0a458", ""));
        s.push_str(&line(&t, "#5b8def", " stroke-dasharray=\"5 3\""));
    }
    s.push_str("</svg>");
    s
}

// ---------------------------------------------------------------------------------------
// Units
// ---------------------------------------------------------------------------------------

/// Unit and provenance class for every numeric field the report emits.
pub const UNITS: &[FieldUnit] = {
    use crate::field_schema::ProvenanceClass::*;
    &[
        FieldUnit {
            path: "seed",
            unit: "1",
            provenance: Input,
            definition: "seed of the ChaCha8 random-number generator the synthetic holdover \
                         draws its noise from",
        },
        FieldUnit {
            path: "record.sample_interval_s",
            unit: "s",
            provenance: Input,
            definition: "interval between consecutive time-error samples",
        },
        FieldUnit {
            path: "record.n_samples",
            unit: "count",
            provenance: Computed,
            definition: "number of time-error samples in the record",
        },
        FieldUnit {
            path: "record.record_length_s",
            unit: "s",
            provenance: Computed,
            definition: "time from the first to the last sample",
        },
        FieldUnit {
            path: "record.start_s",
            unit: "s",
            provenance: Input,
            definition: "time stamp of the first sample",
        },
        FieldUnit {
            path: "record.holdover_start_s",
            unit: "s",
            provenance: Input,
            definition: "time the holdover starts (the GNSS loss), from which budgets and \
                         the ePRTC-A holdover envelope are timed",
        },
        FieldUnit {
            path: "oscillator.datasheet_adev[].tau_s",
            unit: "s",
            provenance: Spec,
            definition: "averaging time of a datasheet Allan-deviation figure",
        },
        FieldUnit {
            path: "oscillator.datasheet_adev[].adev",
            unit: "1",
            provenance: Spec,
            definition: "the datasheet's maximum Allan deviation at that averaging time",
        },
        FieldUnit {
            path: "oscillator.datasheet_adev[].model_adev",
            unit: "1",
            provenance: Modelled,
            definition: "Allan deviation of the fitted white + flicker + random-walk \
                         frequency-noise model at that averaging time",
        },
        FieldUnit {
            path: "oscillator.datasheet_adev[].model_over_datasheet",
            unit: "1",
            provenance: Computed,
            definition: "model Allan deviation divided by the datasheet figure; at least 1 \
                         because the model is scaled to envelope the datasheet maxima",
        },
        FieldUnit {
            path: "oscillator.aging_per_day",
            unit: "1/d",
            provenance: Spec,
            definition: "linear fractional-frequency aging per day used for the holdover \
                         (the datasheet figure, converted as the aging note states, unless \
                         the scenario overrides it)",
        },
        FieldUnit {
            path: "oscillator.temperature_bound",
            unit: "1",
            provenance: Spec,
            definition: "the datasheet's fractional-frequency change bound (±) over its \
                         operating temperature range",
        },
        FieldUnit {
            path: "oscillator.temperature_min_c",
            unit: "degC",
            provenance: Spec,
            definition: "lower end of the datasheet operating temperature range",
        },
        FieldUnit {
            path: "oscillator.temperature_max_c",
            unit: "degC",
            provenance: Spec,
            definition: "upper end of the datasheet operating temperature range",
        },
        FieldUnit {
            path: "oscillator.temperature_coeff_per_k",
            unit: "1/K",
            provenance: Modelled,
            definition: "fractional frequency per kelvin: the stated bound over half the \
                         operating span, a linear worst-case reading",
        },
        FieldUnit {
            path: "oscillator.fitted.white_fm_adev_1s",
            unit: "1",
            provenance: Modelled,
            definition: "Allan deviation at 1 s of the fitted white frequency noise",
        },
        FieldUnit {
            path: "oscillator.fitted.flicker_floor_adev",
            unit: "1",
            provenance: Modelled,
            definition: "flat Allan-deviation floor of the fitted flicker frequency noise",
        },
        FieldUnit {
            path: "oscillator.fitted.random_walk_fm_adev_1s",
            unit: "1",
            provenance: Modelled,
            definition: "Allan deviation at 1 s of the fitted random-walk frequency noise \
                         (it grows as the square root of the averaging time)",
        },
        FieldUnit {
            path: "oscillator.fitted.envelope_scale",
            unit: "1",
            provenance: Computed,
            definition: "factor the least-squares fit was scaled up by so it lies at or \
                         above every datasheet point",
        },
        FieldUnit {
            path: "holdover.gnss_loss_s",
            unit: "s",
            provenance: Input,
            definition: "time of the GNSS loss from the start of the record",
        },
        FieldUnit {
            path: "holdover.holdover_duration_s",
            unit: "s",
            provenance: Computed,
            definition: "record length after the GNSS loss",
        },
        FieldUnit {
            path: "holdover.initial_frequency_offset",
            unit: "1",
            provenance: Input,
            definition: "residual fractional frequency offset at the moment of loss",
        },
        FieldUnit {
            path: "holdover.locked_te_sigma_ns",
            unit: "ns",
            provenance: Input,
            definition: "1 sigma white phase noise of the disciplined clock before the loss",
        },
        FieldUnit {
            path: "holdover.temperature_amplitude_k",
            unit: "K",
            provenance: Input,
            definition: "peak temperature swing of the sinusoidal profile about its value at \
                         the loss",
        },
        FieldUnit {
            path: "holdover.temperature_period_s",
            unit: "s",
            provenance: Input,
            definition: "period of the sinusoidal temperature profile",
        },
        FieldUnit {
            path: "holdover.aging_te_at_end_ns",
            unit: "ns",
            provenance: ClosedForm,
            definition: "time error the aging alone accumulates by the end of the record, \
                         (1/2)·D·t^2",
        },
        FieldUnit {
            path: "holdover.temperature_te_peak_ns",
            unit: "ns",
            provenance: ClosedForm,
            definition: "largest time error the temperature term alone reaches, \
                         k·A·P/pi",
        },
        FieldUnit {
            path: "holdover.deterministic_te_at_end_ns",
            unit: "ns",
            provenance: ClosedForm,
            definition: "time error of the deterministic terms (offset, aging, temperature) \
                         at the end of the record, without noise",
        },
        FieldUnit {
            path: "time_error.max_abs_te_ns",
            unit: "ns",
            provenance: Computed,
            definition: "largest absolute time error in the record, unfiltered",
        },
        FieldUnit {
            path: "time_error.mean_te_ns",
            unit: "ns",
            provenance: Computed,
            definition: "mean time error over the record",
        },
        FieldUnit {
            path: "time_error.te_at_end_ns",
            unit: "ns",
            provenance: Computed,
            definition: "time error of the last sample",
        },
        FieldUnit {
            path: "mtie[].tau_s",
            unit: "s",
            provenance: Computed,
            definition: "observation interval of an MTIE point, m times the sample interval",
        },
        FieldUnit {
            path: "mtie[].mtie_ns",
            unit: "ns",
            provenance: Computed,
            definition: "maximum time interval error: the largest peak-to-peak time error in \
                         any window of that length",
        },
        FieldUnit {
            path: "tdev[].tau_s",
            unit: "s",
            provenance: Computed,
            definition: "observation interval of a TDEV point; only intervals at most one \
                         twelfth of the record are reported",
        },
        FieldUnit {
            path: "tdev[].tdev_ns",
            unit: "ns",
            provenance: Computed,
            definition: "time deviation, tau/sqrt(3) times the modified Allan deviation",
        },
        FieldUnit {
            path: "masks[].checks[].limit_ns",
            unit: "ns",
            provenance: Published,
            definition: "the limit the transcribed ITU-T table or clause states at the \
                         binding point",
        },
        FieldUnit {
            path: "masks[].checks[].value_ns",
            unit: "ns",
            provenance: Computed,
            definition: "the measured quantity at the binding point (filtered where the mask \
                         says so)",
        },
        FieldUnit {
            path: "masks[].checks[].margin_ns",
            unit: "ns",
            provenance: Computed,
            definition: "limit minus value at the binding point, the smallest over the \
                         curve; negative on a FAIL",
        },
        FieldUnit {
            path: "masks[].checks[].worst_tau_s",
            unit: "s",
            provenance: Computed,
            definition: "observation interval of the binding point (for the holdover \
                         envelope, the time to exceed it)",
        },
        FieldUnit {
            path: "masks[].checks[].points_evaluated",
            unit: "count",
            provenance: Computed,
            definition: "curve points that fell inside the mask's observation-interval range",
        },
        FieldUnit {
            path: "holdover_envelope.locked_duration_days",
            unit: "d",
            provenance: Input,
            definition: "locked-mode duration before the loss, L in G.8272.1 Table 3",
        },
        FieldUnit {
            path: "holdover_envelope.holdover_period_s",
            unit: "s",
            provenance: Published,
            definition: "holdover period H G.8272.1 Table 3 assigns to that locked duration",
        },
        FieldUnit {
            path: "holdover_envelope.time_to_exceed_s",
            unit: "s",
            provenance: Computed,
            definition: "first time after the start of holdover at which |TE| is above the \
                         ePRTC-A envelope, at the sample resolution",
        },
        FieldUnit {
            path: "holdover_envelope.min_margin_ns",
            unit: "ns",
            provenance: Computed,
            definition: "smallest envelope minus |TE| inside the holdover period",
        },
        FieldUnit {
            path: "budgets[].max_abs_te_ns",
            unit: "ns",
            provenance: Published,
            definition: "the budget: a maximum absolute time error from the named source",
        },
        FieldUnit {
            path: "budgets[].time_to_exceed_s",
            unit: "s",
            provenance: Computed,
            definition: "first time after the start of holdover (or of the record) at which \
                         |TE| is above the budget, at the sample resolution",
        },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;

    fn scn(src: &str) -> TelecomTimingScenario {
        toml::from_str(src).expect("scenario parses")
    }

    #[test]
    fn mtie_sliding_equals_the_allan_reference_estimator() {
        let h = HoldoverInput {
            duration_s: 2000.0,
            gnss_loss_s: 100.0,
            ..HoldoverInput::default()
        };
        let model = holdover_model(&h).unwrap();
        let rec = synthesize_holdover(&h, &model, 7).unwrap();
        for m in [1usize, 2, 3, 7, 50, 333, 1999, 2000] {
            assert_eq!(
                mtie_sliding(&rec.te_ns, m),
                crate::allan::mtie(&rec.te_ns, m),
                "m = {m}"
            );
        }
    }

    #[test]
    fn mtie_hand_derived() {
        // x = [0, 3, 1, 4, 1, 5]: two-sample windows swing 3,2,3,3,4 -> 4; three-sample
        // windows {0,3,1}=3, {3,1,4}=3, {1,4,1}=3, {4,1,5}=4 -> 4; the whole record 5 - 0.
        let x = [0.0, 3.0, 1.0, 4.0, 1.0, 5.0];
        assert_eq!(mtie_sliding(&x, 1), 4.0);
        assert_eq!(mtie_sliding(&x, 2), 4.0);
        assert_eq!(mtie_sliding(&x, 5), 5.0);
    }

    #[test]
    fn tdev_hand_derived() {
        // x = [0, 1, 0, 1, 0, 1, 0], tau0 = 1, m = 1: every second difference is ±2, so
        // MVAR = 4 / (2·1·1) = 2, MDEV = sqrt(2), TDEV = 1/sqrt(3)·sqrt(2) = sqrt(2/3).
        let x = [0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0];
        let t = crate::allan::time_deviation(&x, 1.0, 1);
        assert!((t - (2.0f64 / 3.0).sqrt()).abs() < 1e-15, "{t}");
    }

    #[test]
    fn mtie_curve_is_monotone_non_decreasing() {
        let h = HoldoverInput {
            duration_s: 20_000.0,
            ..HoldoverInput::default()
        };
        let model = holdover_model(&h).unwrap();
        let rec = synthesize_holdover(&h, &model, 3).unwrap();
        let c = mtie_curve_ns(&rec.te_ns, rec.dt_s);
        assert!(c.len() > 10);
        for w in c.windows(2) {
            assert!(w[1].value_ns >= w[0].value_ns, "{w:?}");
        }
    }

    #[test]
    fn mask_boundaries_follow_the_tables_exactly() {
        // G.8272 Table 1, PRTC-A: 0.275e-3·τ + 0.025 µs up to and including 273 s.
        let a = PRTC_A_MTIE;
        assert_eq!(limit_at(a, 0.1), None, "0.1 s is excluded (0.1 < τ)");
        assert!((limit_at(a, 273.0).unwrap() - (0.275 * 273.0 + 25.0)).abs() < 1e-9);
        assert_eq!(limit_at(a, 273.0 + 1e-9), Some(100.0));
        // G.8272 Table 2, PRTC-B: 40 ns above 54.5 s.
        assert!((limit_at(PRTC_B_MTIE, 54.5).unwrap() - 39.9875).abs() < 1e-9);
        assert_eq!(limit_at(PRTC_B_MTIE, 54.6), Some(40.0));
        // G.8272 Table 3: 30 ns up to but excluding 10 000 s.
        assert_eq!(limit_at(PRTC_A_TDEV, 9999.0), Some(30.0));
        assert_eq!(limit_at(PRTC_A_TDEV, 10_000.0), None);
        // G.8272.1 Table 1 continuity at its breakpoints.
        assert!((limit_at(EPRTC_MTIE, 1.0).unwrap() - 4.0).abs() < 1e-12);
        assert!((limit_at(EPRTC_MTIE, 100.0).unwrap() - 15.004).abs() < 1e-9);
        assert!((limit_at(EPRTC_MTIE, 400_000.0).unwrap() - 30.0).abs() < 1e-9);
        // G.8271.1 Table 7-3 leaves τ = 400 s itself undefined.
        assert_eq!(limit_at(POINT_C_ACCESS_MTIE, 400.0), None);
        assert!(
            (limit_at(POINT_C_ACCESS_MTIE, 399.0).unwrap() - (0.0475 * 399.0 + 25.0)).abs() < 1e-9
        );
        // G.8271.1 Table 7-1 is continuous to rounding at 2.4 s and 275 s.
        assert!((limit_at(POINT_C_MTIE, 2.4).unwrap() - 280.0).abs() < 1e-9);
        assert!((limit_at(POINT_C_MTIE, 275.0).unwrap() - 579.5).abs() < 1e-9);
        // G.8273.2 Table 7-5: class A/B excludes τ = m, class C includes it.
        assert_eq!(limit_at(TBC_AB_TDEV, 1.0), None);
        assert_eq!(limit_at(TBC_C_TDEV, 1.0), Some(2.0));
    }

    #[test]
    fn a_curve_exactly_on_the_limit_passes_and_just_above_fails() {
        let mask = mask_by_id("prtc-a").unwrap().mtie.unwrap();
        let on = [CurvePoint {
            tau_s: 1000.0,
            value_ns: 100.0,
        }];
        let r = check_curve("mtie", &on, &mask);
        assert_eq!(r.verdict, "PASS");
        assert_eq!(r.margin_ns, Some(0.0));
        let above = [CurvePoint {
            tau_s: 1000.0,
            value_ns: 100.0 + 1e-9,
        }];
        assert_eq!(check_curve("mtie", &above, &mask).verdict, "FAIL");
        let outside = [CurvePoint {
            tau_s: 0.05,
            value_ns: 1e9,
        }];
        assert_eq!(
            check_curve("mtie", &outside, &mask).verdict,
            "NOT-EVALUATED"
        );
    }

    #[test]
    fn eprtc_a_holdover_envelope_follows_table_3() {
        // L < 6 days: H = 70 000 s, 30 ns + 1e-3 ns/s, so 100 ns at H.
        assert_eq!(eprtc_a_holdover_period_s(5.0), 70_000.0);
        assert!((eprtc_a_holdover_limit_ns(5.0, 70_000.0).unwrap() - 100.0).abs() < 1e-9);
        assert_eq!(eprtc_a_holdover_limit_ns(5.0, 70_001.0), None);
        assert_eq!(eprtc_a_holdover_limit_ns(5.0, 0.0), None);
        // 6 ≤ L ≤ 40: H = L days, 100 ns at H.
        assert!((eprtc_a_holdover_limit_ns(10.0, 864_000.0).unwrap() - 100.0).abs() < 1e-9);
        // L > 40: H = 40 days, 30 + 2.025463e-5·t reaches 100 ns (to the table's rounding).
        let end = eprtc_a_holdover_limit_ns(41.0, 3_456_000.0).unwrap();
        assert!((end - 100.0).abs() < 1e-3, "{end}");
    }

    #[test]
    fn every_preset_carries_a_named_datasheet_and_figures() {
        assert_eq!(PRESETS.len(), 4);
        for p in PRESETS {
            assert!(p.model.contains("Microchip"), "{}", p.id);
            assert!(p.document.contains("datasheet"), "{}", p.id);
            assert!(p.url.starts_with("https://"), "{}", p.id);
            assert!(!p.adev_points.is_empty());
            assert!(p.aging_per_day >= 0.0 && !p.aging_note.is_empty());
            assert!(p.temperature_bound > 0.0 && !p.temperature_note.is_empty());
            assert!(p.temperature_max_c > p.temperature_min_c);
        }
        for id in ["ocxo", "rubidium", "caesium", "csac"] {
            assert!(preset_by_id(id).is_some(), "{id}");
        }
    }

    #[test]
    fn the_noise_fit_envelopes_every_datasheet_point() {
        for p in PRESETS {
            let f = with_flicker_floor(fit_noise(p.adev_points), p.adev_points);
            assert!(f.envelope_scale >= 1.0);
            let last = p.adev_points.last().unwrap().1;
            assert!(
                f.flicker.sqrt() >= last * (1.0 - 1e-12),
                "{}: floor below rule",
                p.id
            );
            let raw = fit_noise(p.adev_points);
            for &(t, s) in p.adev_points {
                // The floored model envelopes every point ...
                let r = f.adev(t) / s;
                assert!(r >= 1.0 - 1e-12, "{}: model/datasheet {r} at {t} s", p.id);
                // ... and the least-squares fit alone stays close to the datasheet: the
                // floor rule is the only thing allowed to lift the model further.
                let r_raw = raw.adev(t) / s;
                assert!(
                    (1.0 - 1e-12..3.0).contains(&r_raw),
                    "{}: fit is {r_raw}x the datasheet at {t} s",
                    p.id
                );
            }
        }
        // A pure white-FM specification is fitted back exactly.
        let f = fit_noise(&[(1.0, 1e-11), (100.0, 1e-12), (10_000.0, 1e-13)]);
        assert!((f.white.sqrt() - 1e-11).abs() < 1e-20);
        assert!(f.flicker < 1e-40 && f.random_walk < 1e-40);
    }

    #[test]
    fn pure_aging_matches_its_closed_form() {
        // No noise and no temperature: the record is the discrete aging ramp
        // D·dt²·k(k−1)/2, within 0.1 % of (1/2)·D·t² at the end of a day.
        let h = HoldoverInput {
            gnss_loss_s: 0.0,
            duration_s: 86_400.0,
            sample_interval_s: 10.0,
            locked_te_sigma_ns: 0.0,
            temperature_amplitude_k: 0.0,
            ..HoldoverInput::default()
        };
        let mut model = holdover_model(&h).unwrap();
        model.fit = NoiseFit {
            white: 0.0,
            flicker: 0.0,
            random_walk: 0.0,
            envelope_scale: 1.0,
        };
        let rec = synthesize_holdover(&h, &model, 1).unwrap();
        let d = model.aging_per_day / 86_400.0;
        let want = 0.5 * d * 86_400.0f64.powi(2) * 1e9;
        let got = *rec.te_ns.last().unwrap();
        assert!((got / want - 1.0).abs() < 1e-3, "{got} vs {want}");
    }

    #[test]
    fn same_seed_same_series_and_hash_different_seed_different_series() {
        let a =
            scn("kind = \"telecom-timing\"\n[holdover]\nduration_s = 3000\ngnss_loss_s = 600\n");
        let ra = a.run().unwrap();
        let rb = a.run().unwrap();
        assert_eq!(
            series_sha256(&ra.record.te_ns),
            series_sha256(&rb.record.te_ns)
        );
        assert_eq!(a.scenario_hash(), a.scenario_hash());
        let c = scn("kind = \"telecom-timing\"\nseed = 2\n[holdover]\nduration_s = 3000\ngnss_loss_s = 600\n");
        assert_ne!(a.scenario_hash(), c.scenario_hash());
        assert_ne!(
            series_sha256(&ra.record.te_ns),
            series_sha256(&c.run().unwrap().record.te_ns)
        );
    }

    #[test]
    fn ingested_series_is_checked_and_non_uniform_sampling_is_refused() {
        let pairs: Vec<String> = (0..200)
            .map(|k| format!("[{k}.0, {:.3}]", 0.2 * ((k as f64) * 0.1).sin()))
            .collect();
        let src = format!(
            "kind = \"telecom-timing\"\nmasks = [\"prtc-b\", \"t-bc-class-c\"]\n[series]\nsamples = [{}]\n",
            pairs.join(", ")
        );
        let r = scn(&src).run().unwrap();
        assert_eq!(r.record.te_ns.len(), 200);
        assert_eq!(r.masks[0].verdict, "PASS");
        assert!(r.envelope.is_none());
        let bad = "kind = \"telecom-timing\"\n[series]\nsamples = [[0,0],[1,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0],[13,0]]\n";
        assert!(scn(bad).run().unwrap_err().contains("uniformly sampled"));
    }

    #[test]
    fn csv_text_parses_with_a_header_and_comments() {
        let p = parse_csv_pairs("time_s,time_error_ns\n# comment\n0,1.5\n1,2.5\n").unwrap();
        assert_eq!(p, vec![[0.0, 1.5], [1.0, 2.5]]);
        assert!(parse_csv_pairs("0,1\nx,y\n").is_err());
        assert!(
            parse_csv_pairs("a,b\nc,d\n0,1\n").is_err(),
            "one header only"
        );
    }

    #[test]
    fn an_unknown_mask_or_oscillator_is_refused() {
        let e = scn("kind = \"telecom-timing\"\nmasks = [\"prtc-c\"]\n").run();
        assert!(e.err().unwrap().contains("unknown mask"));
        let e = scn("kind = \"telecom-timing\"\n[holdover]\noscillator = \"maser\"\n").run();
        assert!(e.err().unwrap().contains("unknown oscillator"));
    }

    #[test]
    fn a_coarse_record_is_not_evaluated_against_a_filtered_mask() {
        let src = "kind = \"telecom-timing\"\nmasks = [\"t-bc-class-c\"]\n[holdover]\nduration_s = 20000\nsample_interval_s = 10\n";
        let r = scn(src).run().unwrap();
        assert_eq!(r.masks[0].verdict, "NOT-EVALUATED");
    }

    #[test]
    fn the_units_block_describes_every_emitted_field() {
        for src in [
            "kind = \"telecom-timing\"\n[holdover]\nduration_s = 4000\n",
            "kind = \"telecom-timing\"\nmasks = [\"prtc-a\", \"t-bc-class-a\", \"g8271-1-point-c\", \"eprtc-a-holdover\"]\n[series]\nholdover_start_s = 100\nsamples = [[0,1],[1,2],[2,1],[3,2],[4,1],[5,2],[6,1],[7,2],[8,1],[9,2],[10,1],[11,2],[12,1],[13,2]]\n",
        ] {
            let (json, _, _) = scn(src).run_output().unwrap();
            let doc: serde_json::Value = serde_json::from_str(&json).unwrap();
            let audit = crate::field_schema::audit_document(&doc);
            assert!(audit.missing.is_empty(), "{:?}", audit.missing);
            assert!(audit.malformed.is_empty(), "{:?}", audit.malformed);
        }
    }
}
