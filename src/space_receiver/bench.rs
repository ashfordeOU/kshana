// SPDX-License-Identifier: AGPL-3.0-only
//! The upper-SSV benchmark: a fixed, versioned set of trajectory cases a space receiver design is
//! run through, so two designs (or two versions of one) are compared on the same ground.
//!
//! Each case is a user orbit, a duration and a step. For a receiver profile (C/N0 threshold,
//! receive antennas, oscillator class, Doppler and Doppler-rate limits, a time-error budget) every
//! case reports
//!
//! * availability of one and of four signals and the longest outages, from the `gnss-ssv`
//!   trajectory sweep ([`crate::ssv::sweep::run_trajectory`]) with the booklet's link budget and
//!   transmit pattern (main lobe only, so the figures are comparable with the booklet's);
//! * the Doppler and Doppler-rate envelope of the signals in view ([`super::dynamics`]);
//! * the free-run time error of the oscillator over the longest four-signal outage
//!   ([`super::clock::holdover`]), the time the receiver has to hold without a time solution;
//! * three checks: Doppler within the limit, Doppler rate within the limit, time error within the
//!   budget. A check with no limit given is `not_checked`.
//!
//! With `sidelobes` the transmit pattern is the parametric shaped beam with a sidelobe floor 25 dB
//! down (representative), so the side-lobe tracking a weak-signal receiver can do is counted.
//!
//! The case list is `upper-ssv-bench/1`; any change to it is a new version, never an edit, so a
//! result names the cases it was scored on.
//!
//! MODELLED: the cases are synthetic two-body orbits through the booklet constellations; the
//! benchmark compares designs against each other, it does not predict flight performance.

use super::clock::{self, Oscillator};
use super::dynamics::{self, Limits};
use crate::ssv::constellations::{Band, Constellation};
use crate::ssv::pattern::{Axis, NamedAntenna, TxPattern, UserAntenna};
use crate::ssv::sweep::{run_trajectory, NoEffects, TrajectoryConfig, UserOrbit};
use serde::Serialize;

/// The honesty label of every benchmark report.
pub const LABEL: &str = "MODELLED: synthetic two-body cases through the ICG booklet's constellations, link budget \
and main-lobe transmit pattern; representative oscillator classes. A comparison between designs on fixed ground, not a \
prediction of flight performance.";

/// The benchmark version.
pub const VERSION: &str = "upper-ssv-bench/1";

/// One benchmark case.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Case {
    /// Case id.
    pub id: &'static str,
    /// The orbit preset ([`dynamics::preset`]).
    pub preset: &'static str,
    /// Duration, minutes.
    pub duration_min: f64,
    /// Availability step, minutes.
    pub step_min: f64,
    /// Dynamics step, s.
    pub dynamics_step_s: f64,
}

/// The cases of [`VERSION`].
pub const CASES: [Case; 6] = [
    Case {
        id: "meo-8000",
        preset: "meo",
        duration_min: 1440.0,
        step_min: 5.0,
        dynamics_step_s: 120.0,
    },
    Case {
        id: "geo",
        preset: "geo",
        duration_min: 1440.0,
        step_min: 5.0,
        dynamics_step_s: 600.0,
    },
    Case {
        id: "gto",
        preset: "gto",
        duration_min: 640.0,
        step_min: 2.0,
        dynamics_step_s: 30.0,
    },
    Case {
        id: "heo",
        preset: "heo",
        duration_min: 1430.0,
        step_min: 5.0,
        dynamics_step_s: 60.0,
    },
    Case {
        id: "mms-2b",
        preset: "mms-2b",
        duration_min: 4020.0,
        step_min: 10.0,
        dynamics_step_s: 300.0,
    },
    Case {
        id: "lunar-transfer",
        preset: "lunar-transfer",
        duration_min: 4.0 * 1440.0,
        step_min: 15.0,
        dynamics_step_s: 600.0,
    },
];

/// A receiver profile.
#[derive(Clone, Debug, Serialize)]
pub struct Profile {
    /// C/N0 threshold, dB-Hz.
    pub cn0_min_dbhz: f64,
    /// Receive antennas (both on): a high-gain nadir and a patch zenith by default.
    pub antennas: Vec<&'static str>,
    /// Oscillator class.
    pub oscillator: Oscillator,
    /// Tracking limits.
    pub limits: Limits,
    /// Time-error budget over an outage, s.
    pub time_budget_s: Option<f64>,
    /// Count sidelobe signals: the parametric transmit pattern in place of the booklet's main lobe.
    pub sidelobes: bool,
}

impl Profile {
    /// The default profile with an oscillator.
    pub fn new(oscillator: Oscillator) -> Self {
        Self {
            cn0_min_dbhz: 20.0,
            antennas: vec!["booklet-high-gain-nadir", "booklet-patch-zenith"],
            oscillator,
            limits: Limits::default(),
            time_budget_s: None,
            sidelobes: false,
        }
    }
}

fn antenna(name: &str) -> UserAntenna {
    match name {
        "booklet-high-gain-nadir" => {
            UserAntenna::named(&NamedAntenna::BookletHighGain, Band::L1, Axis::Nadir)
        }
        "booklet-patch-zenith" => {
            UserAntenna::named(&NamedAntenna::BookletPatch, Band::L1, Axis::Zenith)
        }
        _ => UserAntenna::Omni,
    }
}

/// A check's outcome.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum Verdict {
    /// Within the limit.
    Pass,
    /// Beyond it.
    Fail,
    /// No limit given.
    NotChecked,
}

fn verdict(value: Option<f64>, limit: Option<f64>) -> Verdict {
    match (value, limit) {
        (Some(v), Some(l)) if v <= l => Verdict::Pass,
        (Some(_), Some(_)) => Verdict::Fail,
        (None, Some(_)) => Verdict::Pass,
        _ => Verdict::NotChecked,
    }
}

/// One case's result.
#[derive(Clone, Debug, Serialize)]
pub struct CaseResult {
    /// The case.
    pub case: Case,
    /// The orbit.
    pub orbit: UserOrbit,
    /// Percent of epochs with at least one signal (all constellations, L1).
    pub at_least_1_pct: f64,
    /// Percent with at least four.
    pub at_least_4_pct: f64,
    /// Longest outage of every signal, minutes.
    pub max_outage_1_min: f64,
    /// Longest stretch under four signals, minutes.
    pub max_outage_4_min: f64,
    /// Largest Doppler magnitude in view, Hz.
    pub max_doppler_hz: Option<f64>,
    /// Largest Doppler-rate magnitude in view, Hz/s.
    pub max_doppler_rate_hz_s: Option<f64>,
    /// Secular relativistic rate against TT, µs/day.
    pub relativity_us_per_day: f64,
    /// Free-run time error over the longest four-signal outage, s.
    pub holdover_time_error_s: f64,
    /// Doppler check.
    pub doppler: Verdict,
    /// Doppler-rate check.
    pub doppler_rate: Verdict,
    /// Time-error check.
    pub time_error: Verdict,
}

/// The benchmark report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Benchmark version.
    pub version: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// The profile.
    pub profile: Profile,
    /// One result per case.
    pub cases: Vec<CaseResult>,
    /// Checks passed, failed, not checked (over all cases).
    pub passed: usize,
    /// Failed checks.
    pub failed: usize,
    /// Checks without a limit.
    pub not_checked: usize,
}

/// Run one case.
pub fn run_case(case: &Case, profile: &Profile) -> Result<CaseResult, String> {
    let orbit = dynamics::preset(case.preset)
        .ok_or_else(|| crate::terr!("e-ssv-scenario-unknown-preset"))?;
    let constellations = Constellation::ALL.to_vec();
    let cfg = TrajectoryConfig {
        orbit,
        duration_min: case.duration_min,
        step_min: case.step_min,
        cn0_min_dbhz: Some(profile.cn0_min_dbhz),
        constellations: constellations.clone(),
        bands: vec![Band::L1],
        antennas: vec![(
            Band::L1,
            profile.antennas.iter().map(|a| antenna(a)).collect(),
        )],
        tx: if profile.sidelobes {
            TxPattern::Parametric(crate::ssv::pattern::ParametricPattern::default())
        } else {
            TxPattern::Booklet
        },
        mrtp_reference_alt_km: 36000.0,
        series_every_epochs: 0,
        collect_limb: false,
        beam_override_deg: Vec::new(),
        ablation: Default::default(),
    };
    let r = run_trajectory(&cfg, &NoEffects)?;
    let comb = r
        .bands
        .first()
        .and_then(|b| b.groups.iter().find(|g| g.name == "combined"))
        .map(|g| g.availability.clone());
    let (a1, a4, o1, o4) = comb
        .map(|a| {
            (
                a.at_least_1_pct,
                a.at_least_4_pct,
                a.max_outage_1_min,
                a.max_outage_4_min,
            )
        })
        .unwrap_or((0.0, 0.0, case.duration_min, case.duration_min));
    let dy = dynamics::run(&dynamics::Config {
        orbit,
        duration_s: case.duration_min * 60.0,
        step_s: case.dynamics_step_s,
        constellations,
        band: Band::L1,
        max_off_boresight_deg: 90.0,
        limits: profile.limits,
    })?;
    let rel = clock::relativity(&orbit);
    let hold = clock::holdover(
        &profile.oscillator,
        o4 * 60.0,
        0.0,
        rel.period_s,
        rel.secular_rate,
    );
    let max_d = dy.doppler_hz.map(|e| e.max_abs);
    let max_r = dy.doppler_rate_hz_s.map(|e| e.max_abs);
    Ok(CaseResult {
        case: *case,
        orbit,
        at_least_1_pct: a1,
        at_least_4_pct: a4,
        max_outage_1_min: o1,
        max_outage_4_min: o4,
        max_doppler_hz: max_d,
        max_doppler_rate_hz_s: max_r,
        relativity_us_per_day: rel.secular_us_per_day,
        holdover_time_error_s: hold.total_s,
        doppler: verdict(max_d, profile.limits.max_doppler_hz),
        doppler_rate: verdict(max_r, profile.limits.max_doppler_rate_hz_s),
        time_error: verdict(Some(hold.total_s), profile.time_budget_s),
    })
}

/// Run the benchmark over the cases named (all when `only` is empty).
pub fn run(profile: Profile, only: &[String]) -> Result<Report, String> {
    let mut cases = Vec::new();
    for c in CASES.iter() {
        if only.is_empty() || only.iter().any(|o| o == c.id) {
            cases.push(run_case(c, &profile)?);
        }
    }
    let (mut p, mut f, mut n) = (0, 0, 0);
    for c in &cases {
        for v in [c.doppler, c.doppler_rate, c.time_error] {
            match v {
                Verdict::Pass => p += 1,
                Verdict::Fail => f += 1,
                Verdict::NotChecked => n += 1,
            }
        }
    }
    Ok(Report {
        schema: "kshana.space-receiver-bench/1",
        version: VERSION,
        label: LABEL,
        profile,
        cases,
        passed: p,
        failed: f,
        not_checked: n,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn case_ids_are_unique_and_presets_resolve() {
        let mut ids: Vec<_> = CASES.iter().map(|c| c.id).collect();
        ids.sort();
        ids.dedup();
        assert_eq!(ids.len(), CASES.len());
        for c in CASES {
            assert!(dynamics::preset(c.preset).is_some(), "{}", c.id);
        }
    }

    #[test]
    fn verdicts() {
        assert_eq!(verdict(Some(1.0), Some(2.0)), Verdict::Pass);
        assert_eq!(verdict(Some(3.0), Some(2.0)), Verdict::Fail);
        assert_eq!(verdict(Some(3.0), None), Verdict::NotChecked);
        assert_eq!(verdict(None, Some(2.0)), Verdict::Pass);
    }
}
