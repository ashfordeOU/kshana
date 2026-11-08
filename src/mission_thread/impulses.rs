// SPDX-License-Identifier: AGPL-3.0-only
//! The C2 impulse detector (`docs/mission-thread/PREREGISTRATION-C2.md`, sections 3 and 4).
//!
//! Each tabulated state is carried one hour by the burn-free propagation and compared with the next tabulated state.
//! An hour whose 3-D velocity residual exceeds the threshold (0.01 m/s in C2) is an **event hour**; adjacent event
//! hours count as one **event**. Each event hour yields one impulse: its velocity residual vector, applied at the
//! midpoint of the hour. MODELLED; a step detected here is "modelled as an impulse", not shown to be a manoeuvre.

/// The C2 threshold on the hourly 3-D velocity residual (m/s), fixed in the pre-registration.
pub const C2_THRESHOLD_MPS: f64 = 0.01;

/// One hour's residual: the tabulated state at `start_s` carried one hour, minus the next tabulated state.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct HourResidual {
    /// Start of the hour (s from the window start).
    pub start_s: f64,
    /// Length of the hour (s), 3600 for an hourly table.
    pub length_s: f64,
    /// Next tabulated velocity minus the propagated velocity (m/s, GCRF): the step the propagation missed.
    pub dv_mps: [f64; 3],
}

/// The detector's output.
#[derive(Clone, Debug, PartialEq)]
pub struct Detection {
    /// The start times of the event hours, in order.
    pub event_hours_s: Vec<f64>,
    /// The events: runs of adjacent event hours, as (first hour start, last hour start).
    pub events: Vec<(f64, f64)>,
    /// One impulse per event hour: (time from the window start, Δv in GCRF m/s), at the hour's midpoint.
    pub impulses: Vec<(f64, [f64; 3])>,
}

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Detect the event hours and estimate their impulses from hourly residuals in time order.
pub fn detect(residuals: &[HourResidual], threshold_mps: f64) -> Detection {
    let mut out = Detection {
        event_hours_s: Vec::new(),
        events: Vec::new(),
        impulses: Vec::new(),
    };
    let mut prev_end: Option<f64> = None;
    for r in residuals {
        if norm(r.dv_mps) <= threshold_mps {
            continue;
        }
        out.event_hours_s.push(r.start_s);
        out.impulses.push((r.start_s + 0.5 * r.length_s, r.dv_mps));
        match (out.events.last_mut(), prev_end) {
            (Some(e), Some(end)) if (r.start_s - end).abs() < 1e-6 => e.1 = r.start_s,
            _ => out.events.push((r.start_s, r.start_s)),
        }
        prev_end = Some(r.start_s + r.length_s);
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    fn hr(h: f64, dv: [f64; 3]) -> HourResidual {
        HourResidual {
            start_s: h * 3600.0,
            length_s: 3600.0,
            dv_mps: dv,
        }
    }

    #[test]
    fn adjacent_event_hours_are_one_event_but_each_has_its_impulse() {
        let r = [
            hr(0.0, [0.0, 0.001, 0.0]),
            hr(1.0, [0.02, 0.0, 0.0]),
            hr(2.0, [0.0, -0.03, 0.0]),
            hr(3.0, [0.0, 0.0, 0.002]),
            hr(4.0, [0.0, 0.0, 0.2]),
        ];
        let d = detect(&r, C2_THRESHOLD_MPS);
        assert_eq!(d.event_hours_s, vec![3600.0, 7200.0, 14_400.0]);
        assert_eq!(d.events, vec![(3600.0, 7200.0), (14_400.0, 14_400.0)]);
        assert_eq!(d.impulses.len(), 3);
        assert_eq!(d.impulses[0], (5400.0, [0.02, 0.0, 0.0]));
        assert_eq!(d.impulses[2], (16_200.0, [0.0, 0.0, 0.2]));
    }

    #[test]
    fn a_residual_at_the_threshold_is_not_an_event() {
        let d = detect(&[hr(0.0, [0.01, 0.0, 0.0])], C2_THRESHOLD_MPS);
        assert!(d.event_hours_s.is_empty() && d.impulses.is_empty());
    }
}
