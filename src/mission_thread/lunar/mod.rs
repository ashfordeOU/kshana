// SPDX-License-Identifier: AGPL-3.0-only
//! The lunar segment of the mission thread: four phase kinds, each also a standalone scenario kind.
//!
//! * `lunar-orbit-rendezvous`: relative navigation to docking in low lunar orbit or an elliptical polar
//!   orbit ([`crate::lunar_rendezvous`]);
//! * `lunar-descent`: the landing-dispersion budget at a south-polar site ([`crate::lunar_landing`]);
//! * `lunar-surface`: positioning and timing availability by site and season ([`crate::lunar_surface_map`]);
//! * `lunar-ascent`: the ascent to the rendezvous orbit and the covariance carried back to orbit
//!   ([`crate::lunar_ascent`]).
//!
//! A phase here is a thin wrapper: the kind's `[phase.model]` table is the standalone scenario's own table,
//! the core runs on the entry [`NavState`] and returns the exit state, and the wrapper turns the result into a
//! [`PhaseOutcome`]. The core never converts a frame or a timescale (the thread does, at the handover) and
//! never resets a covariance. A phase's length is its model's own (`arc_s`, `descent_s`, `stay_days`,
//! `ascent_s`); the thread's `duration_s` is not passed in, so a document states the length once, in the
//! model, and the exit state's mission time is the entry's plus it. The seed is derived from the thread's
//! seed and the kind, so a phase run on its own with the thread's seed returns the numbers it returns inside
//! the thread. Everything is MODELLED; none of it rests on an external oracle.
//!
//! Advisory software, not certified navigation equipment.

use crate::lunar_ascent::{LunarAscentScenario, KIND as ASCENT};
use crate::lunar_landing::{LunarLandingScenario, KIND as DESCENT};
use crate::lunar_phase::age_clock;
use crate::lunar_rendezvous::{LunarRendezvousScenario, KIND as RENDEZVOUS};
use crate::lunar_surface_map::{LunarSurfaceMapScenario, KIND as SURFACE};
use crate::mission_thread::budget::{BudgetRow, PhaseBudget};
use crate::mission_thread::phase::{
    Event, EvidenceLabel, NavSource, NavState, PhaseOutcome, Sample, TimeSource,
};
use crate::mission_thread::{MissionPhase, ThreadCtx};
use serde_json::Value;

/// The keys each phase kind's model table may hold: the standalone scenario's own fields. A misspelt key is
/// refused, not ignored.
const RENDEZVOUS_KEYS: &[&str] = &[
    "orbit",
    "sma_km",
    "eccentricity",
    "inc_deg",
    "argp_deg",
    "mean_anomaly_deg",
    "separation_m",
    "arc_s",
    "step_s",
    "n_relays",
    "afs_cn0_dbhz",
    "isl_cn0_dbhz",
    "integration_s",
    "sis_ure_m",
    "common_mode_fraction",
    "target_pos_sigma_m",
    "target_vel_sigma_m_s",
    "carried_pos_sigma_m",
    "carried_vel_sigma_m_s",
    "filter_model",
    "n_trials",
    "seed",
    "conv_threshold_m",
    "gravity_table_path",
    "gravity_degree",
];
const DESCENT_KEYS: &[&str] = &[
    "site_lat_deg",
    "site_lon_deg",
    "more_site_lats_deg",
    "descent_s",
    "specific_force_m_s2",
    "horizontal_speed_m_s",
    "accel_bias_ug",
    "align_arcmin",
    "gyro_bias_deg_per_hr",
    "carried_pos_sigma_m",
    "carried_vel_sigma_m_s",
    "guidance_sigma_m",
    "afs_mode",
    "n_relays",
    "mask_deg",
    "afs_cn0_dbhz",
    "sis_ure_m",
    "afs_first_fix_s",
    "afs_interval_s",
    "baseline_km",
    "trn_source",
    "trn_fix_time_s",
    "trn_altimeter_sigma_m",
    "trn_map_sigma_m",
    "dem_descriptor",
    "trn_window_m",
    "trn_height_sigma_m",
    "trn_registration_sigma_m",
    "lunar_time_mode",
    "time_since_sync_days",
    "n_trials",
    "seed",
];
const SURFACE_KEYS: &[&str] = &[
    "sites",
    "season_dates",
    "window_days",
    "step_min",
    "stay_days",
    "timing_floor_s",
    "n_sats",
    "sma_km",
    "eccentricity",
    "inc_deg",
    "argp_deg",
    "mask_deg",
    "pdop_threshold",
    "earth_mask_deg",
    "sun_mask_deg",
    "terrain",
];
const ASCENT_KEYS: &[&str] = &[
    "site_lat_deg",
    "site_lon_deg",
    "ascent_s",
    "specific_force_m_s2",
    "insertion_altitude_km",
    "accel_bias_ug",
    "align_arcmin",
    "gyro_bias_deg_per_hr",
    "surface_pos_sigma_m",
    "surface_vel_sigma_m_s",
    "cutoff_sigma_m_s",
    "afs_mode",
    "n_relays",
    "mask_deg",
    "afs_cn0_dbhz",
    "sis_ure_m",
    "afs_first_fix_s",
    "afs_interval_s",
    "baseline_km",
    "lunar_time_mode",
    "time_since_sync_days",
];

fn parse_model<T: serde::de::DeserializeOwned>(
    kind: &str,
    keys: &[&str],
    t: &toml::Table,
) -> Result<T, String> {
    if let Some(bad) = t.keys().find(|k| !keys.contains(&k.as_str())) {
        return Err(format!(
            "{kind}: unknown model key `{bad}`; the keys are {}",
            keys.join(", ")
        ));
    }
    toml::Value::Table(t.clone())
        .try_into()
        .map_err(|e| format!("{kind}: {e}"))
}

/// The budget rows a core's `budget_rows` array holds (`source`, `sigma_m`), as thread rows in metres.
fn rows_of(report: &Value) -> Vec<BudgetRow> {
    report["budget_rows"]
        .as_array()
        .map(|a| {
            a.iter()
                .filter_map(|r| {
                    Some(BudgetRow {
                        source: r["source"].as_str()?.to_string(),
                        sigma: r["sigma_m"].as_f64()?,
                        unit: "m".to_string(),
                        label: EvidenceLabel::modelled(),
                    })
                })
                .collect()
        })
        .unwrap_or_default()
}

/// The largest of the first `n_components` rows, named: the source that limits the phase.
fn limiting(rows: &[BudgetRow], n_components: usize) -> Option<String> {
    rows.iter()
        .take(n_components)
        .max_by(|a, b| a.sigma.total_cmp(&b.sigma))
        .map(|r| r.source.clone())
}

/// A thread series from `(t since phase start, position sigma, velocity sigma)` and the entry clock.
fn samples(entry: &NavState, series: &[(f64, f64, f64)]) -> Vec<Sample> {
    series
        .iter()
        .map(|&(t, p, v)| Sample {
            t_s: entry.t_s + t,
            sigma_pos_m: p,
            sigma_vel_mps: v,
            sigma_time_s: age_clock(&entry.clock, t).sigma_bias_s(),
        })
        .collect()
}

#[allow(clippy::too_many_arguments)]
fn outcome(
    kind: &str,
    entry: &NavState,
    exit: NavState,
    rows: Vec<BudgetRow>,
    n_components: usize,
    series: Vec<Sample>,
    events: Vec<Event>,
    nav: Vec<NavSource>,
    time: TimeSource,
) -> PhaseOutcome {
    let peak =
        |f: fn(&Sample) -> f64, a: f64, b: f64| series.iter().map(f).fold(a.max(b), f64::max);
    let budget = PhaseBudget {
        // The thread overwrites the id with the document's; a phase run on its own is named by its kind.
        phase_id: kind.to_string(),
        kind: kind.to_string(),
        entry_sigma_pos_m: entry.sigma_pos_m(),
        entry_sigma_vel_mps: entry.sigma_vel_mps(),
        entry_sigma_time_s: entry.sigma_time_s(),
        exit_sigma_pos_m: exit.sigma_pos_m(),
        exit_sigma_vel_mps: exit.sigma_vel_mps(),
        exit_sigma_time_s: exit.sigma_time_s(),
        peak_sigma_pos_m: peak(|s| s.sigma_pos_m, entry.sigma_pos_m(), exit.sigma_pos_m()),
        peak_sigma_vel_mps: peak(
            |s| s.sigma_vel_mps,
            entry.sigma_vel_mps(),
            exit.sigma_vel_mps(),
        ),
        peak_sigma_time_s: peak(
            |s| s.sigma_time_s,
            entry.sigma_time_s(),
            exit.sigma_time_s(),
        ),
        nav_sources: nav,
        time_source: time,
        limiting_source: limiting(&rows, n_components),
        rows,
        label: EvidenceLabel::modelled(),
    };
    PhaseOutcome {
        exit,
        budget,
        series,
        events,
        label: EvidenceLabel::modelled(),
    }
}

fn ev(t_s: f64, what: impl Into<String>) -> Event {
    Event {
        t_s,
        what: what.into(),
    }
}

// ---------------------------------------------------------------------------------------------------------
// lunar-orbit-rendezvous
// ---------------------------------------------------------------------------------------------------------

/// The `lunar-orbit-rendezvous` phase.
pub struct OrbitRendezvousPhase(LunarRendezvousScenario);

/// Builds a `lunar-orbit-rendezvous` phase from its model table.
pub fn orbit_rendezvous_ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    Ok(Box::new(OrbitRendezvousPhase(parse_model(
        RENDEZVOUS,
        RENDEZVOUS_KEYS,
        t,
    )?)))
}

impl MissionPhase for OrbitRendezvousPhase {
    fn kind(&self) -> &'static str {
        RENDEZVOUS
    }

    fn run(&self, entry: &NavState, ctx: &ThreadCtx) -> Result<PhaseOutcome, String> {
        let out = self.0.run_phase(entry, ctx)?;
        let r = &out.report;
        let mut events = vec![ev(
            entry.t_s,
            "entry position and velocity vector not used: the phase flies its own nominal orbit; only the \
             covariance, frame and clock are taken",
        )];
        if let Some(t) = r["converged_at_s"].as_f64() {
            events.push(ev(
                entry.t_s + t,
                format!("formal relative position 1-sigma reaches the convergence threshold at {t:.0} s"),
            ));
        } else {
            events.push(ev(
                out.exit.t_s,
                "formal relative position 1-sigma did not reach the convergence threshold over the arc",
            ));
        }
        if r["observability_lost"] == true {
            events.push(ev(
                entry.t_s,
                "relay fixes almost never available: observability lost",
            ));
        }
        let rows = rows_of(r);
        let series = samples(entry, &out.abs_series);
        Ok(outcome(
            RENDEZVOUS,
            entry,
            out.exit,
            rows,
            3,
            series,
            events,
            vec![NavSource::Lunanet],
            TimeSource::LunarTime,
        ))
    }
}

// ---------------------------------------------------------------------------------------------------------
// lunar-descent
// ---------------------------------------------------------------------------------------------------------

/// The `lunar-descent` phase.
pub struct DescentPhase(LunarLandingScenario);

/// Builds a `lunar-descent` phase from its model table.
pub fn descent_ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    Ok(Box::new(DescentPhase(parse_model(
        DESCENT,
        DESCENT_KEYS,
        t,
    )?)))
}

impl MissionPhase for DescentPhase {
    fn kind(&self) -> &'static str {
        DESCENT
    }

    fn run(&self, entry: &NavState, ctx: &ThreadCtx) -> Result<PhaseOutcome, String> {
        let out = self.0.run_phase(entry, ctx)?;
        let r = &out.report;
        let mut events = vec![ev(entry.t_s, "powered descent starts")];
        if let Some(n) = r["aids"]["afs"]["fixes_used"].as_u64().filter(|&n| n > 0) {
            events.push(ev(
                entry.t_s,
                format!("{n} AFS position fixes taken during the descent"),
            ));
        }
        if let Some(t) = r["aids"]["terrain"]["fix_time_s"].as_f64() {
            if r["aids"]["terrain"]["fix_sigma_east_m"].is_number() {
                events.push(ev(entry.t_s + t, "terrain-relative fix"));
            }
        }
        if r["observability_lost"] == true {
            events.push(ev(
                entry.t_s,
                "no AFS or terrain-relative fix available: inertial only",
            ));
        }
        events.push(ev(out.exit.t_s, "touchdown"));
        let mut nav = vec![NavSource::Inertial];
        if r["aids"]["afs"]["fix_sigma_east_m"].is_number() {
            nav.push(NavSource::Lunanet);
        }
        if r["aids"]["terrain"]["fix_sigma_east_m"].is_number() {
            nav.push(NavSource::Trn);
        }
        let time = if r["lunar_time_mode"] == "off" {
            TimeSource::OnboardHoldover
        } else {
            TimeSource::LunarTime
        };
        let rows = rows_of(r);
        let series = samples(entry, &out.series);
        Ok(outcome(
            DESCENT, entry, out.exit, rows, 2, series, events, nav, time,
        ))
    }
}

// ---------------------------------------------------------------------------------------------------------
// lunar-surface
// ---------------------------------------------------------------------------------------------------------

/// The `lunar-surface` phase.
pub struct SurfacePhase(LunarSurfaceMapScenario);

/// Builds a `lunar-surface` phase from its model table.
pub fn surface_ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    Ok(Box::new(SurfacePhase(parse_model(
        SURFACE,
        SURFACE_KEYS,
        t,
    )?)))
}

impl MissionPhase for SurfacePhase {
    fn kind(&self) -> &'static str {
        SURFACE
    }

    fn run(&self, entry: &NavState, ctx: &ThreadCtx) -> Result<PhaseOutcome, String> {
        let out = self.0.run_phase(entry, ctx)?;
        let r = &out.report;
        let cells = r["cells"].as_array().cloned().unwrap_or_default();
        let min_of = |k: &str| {
            cells
                .iter()
                .filter_map(|c| c[k].as_f64())
                .fold(f64::INFINITY, f64::min)
        };
        let gap_h = r["exit_state"]["longest_timing_gap_h"]
            .as_f64()
            .unwrap_or(0.0);
        let rows = vec![
            BudgetRow {
                source: "surface clock after discipline: timing floor, then holdover over the longest gap".into(),
                sigma: out.exit.sigma_time_s(),
                unit: "s".into(),
                label: EvidenceLabel::modelled(),
            },
            BudgetRow {
                source: "position and velocity: carried unchanged (no positioning filter in a map)".into(),
                sigma: out.exit.sigma_pos_m(),
                unit: "m".into(),
                label: EvidenceLabel::modelled(),
            },
        ];
        let mut events = vec![ev(
            entry.t_s,
            format!(
                "worst positioning availability {:.1}% and worst timing availability {:.1}% over {} sites and {} seasons",
                100.0 * min_of("position_availability"),
                100.0 * min_of("timing_availability"),
                r["n_sites"],
                r["n_seasons"]
            ),
        )];
        events.push(ev(
            entry.t_s,
            format!("longest stretch with no timing source: {gap_h:.1} h"),
        ));
        if r["observability_lost"] == true {
            events.push(ev(
                entry.t_s,
                "positioning almost never available at some site: observability lost",
            ));
        }
        let series = vec![
            Sample {
                t_s: entry.t_s,
                sigma_pos_m: entry.sigma_pos_m(),
                sigma_vel_mps: entry.sigma_vel_mps(),
                sigma_time_s: entry.sigma_time_s(),
            },
            Sample {
                t_s: out.exit.t_s,
                sigma_pos_m: out.exit.sigma_pos_m(),
                sigma_vel_mps: out.exit.sigma_vel_mps(),
                sigma_time_s: out.exit.sigma_time_s(),
            },
        ];
        Ok(outcome(
            SURFACE,
            entry,
            out.exit,
            rows,
            1,
            series,
            events,
            vec![NavSource::Lunanet],
            TimeSource::LunarTime,
        ))
    }
}

// ---------------------------------------------------------------------------------------------------------
// lunar-ascent
// ---------------------------------------------------------------------------------------------------------

/// The `lunar-ascent` phase.
pub struct AscentPhase(LunarAscentScenario);

/// Builds a `lunar-ascent` phase from its model table.
pub fn ascent_ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    Ok(Box::new(AscentPhase(parse_model(ASCENT, ASCENT_KEYS, t)?)))
}

impl MissionPhase for AscentPhase {
    fn kind(&self) -> &'static str {
        ASCENT
    }

    fn run(&self, entry: &NavState, ctx: &ThreadCtx) -> Result<PhaseOutcome, String> {
        let out = self.0.run_phase(entry, ctx)?;
        let r = &out.report;
        let mut events = vec![ev(entry.t_s, "liftoff")];
        if let Some(n) = r["aids"]["afs"]["fixes_used"].as_u64().filter(|&n| n > 0) {
            events.push(ev(
                entry.t_s,
                format!("{n} AFS position fixes taken during the ascent"),
            ));
        }
        if r["observability_lost"] == true {
            events.push(ev(entry.t_s, "no AFS fix available: inertial only"));
        }
        events.push(ev(
            out.exit.t_s,
            format!(
                "orbit insertion: cutoff dispersion {:.2} m/s (3-D, reported, not carried)",
                r["insertion"]["dispersion_velocity_m_s"]
                    .as_f64()
                    .unwrap_or(f64::NAN)
            ),
        ));
        let mut nav = vec![NavSource::Inertial];
        if r["aids"]["afs"]["fix_sigma_east_m"].is_number() {
            nav.push(NavSource::Lunanet);
        }
        let time = if r["lunar_time_mode"] == "off" {
            TimeSource::OnboardHoldover
        } else {
            TimeSource::LunarTime
        };
        let rows = rows_of(r);
        let series = samples(entry, &out.series);
        Ok(outcome(
            ASCENT, entry, out.exit, rows, 2, series, events, nav, time,
        ))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar_phase::{default_ctx, default_entry};
    use crate::mission_thread::phase::LabelTier;
    use crate::mission_thread::phase_kind;

    fn table(s: &str) -> toml::Table {
        s.parse::<toml::Table>().unwrap()
    }

    /// Fast model tables for each kind.
    fn quick(kind: &str) -> toml::Table {
        match kind {
            RENDEZVOUS => table("n_trials = 2\narc_s = 1800.0\nstep_s = 30.0"),
            DESCENT => table("n_trials = 100"),
            SURFACE => table("window_days = 3.0\nstep_min = 60.0\nseason_dates = [\"2028-01-01\"]"),
            _ => table(""),
        }
    }

    #[test]
    fn the_four_kinds_are_registered_implemented_and_build_from_their_tables() {
        for kind in [RENDEZVOUS, DESCENT, SURFACE, ASCENT] {
            let info = phase_kind(kind).unwrap();
            assert_eq!(info.segment, "lunar");
            let p = (info.ctor)(&quick(kind)).unwrap();
            assert_eq!(p.kind(), kind);
        }
    }

    #[test]
    fn a_misspelt_model_key_is_refused_not_ignored() {
        for kind in [RENDEZVOUS, DESCENT, SURFACE, ASCENT] {
            let info = phase_kind(kind).unwrap();
            let e = (info.ctor)(&table("arc_second = 5")).err().unwrap();
            assert!(e.contains("unknown model key `arc_second`"), "{e}");
        }
    }

    /// Every phase runs from the default entry, hands on a valid exit state later in mission time, labels
    /// itself MODELLED, names a limiting source and carries a budget in metres or seconds.
    #[test]
    fn every_phase_runs_and_returns_a_modelled_outcome() {
        for kind in [RENDEZVOUS, DESCENT, SURFACE, ASCENT] {
            let p = (phase_kind(kind).unwrap().ctor)(&quick(kind)).unwrap();
            let entry = default_entry();
            let o = p.run(&entry, &default_ctx()).unwrap();
            assert_eq!(o.label.tier, LabelTier::Modelled, "{kind}");
            assert!(crate::lunar_phase::cov_is_valid(&o.exit.p), "{kind}");
            assert!(o.exit.t_s > entry.t_s, "{kind}");
            assert_eq!(o.budget.kind, kind);
            assert!(
                !o.budget.rows.is_empty() && !o.series.is_empty() && !o.events.is_empty(),
                "{kind}"
            );
            assert!(
                o.budget.peak_sigma_pos_m >= o.budget.exit_sigma_pos_m - 1e-9,
                "{kind}"
            );
            assert!(o.budget.limiting_source.is_some(), "{kind}");
        }
    }

    /// A phase run on its own with the thread's seed returns what it returns inside the thread: the seed
    /// does not depend on the position in the chain, and a second run is identical.
    #[test]
    fn a_phase_is_reproducible_for_the_same_entry_and_context() {
        for kind in [RENDEZVOUS, DESCENT] {
            let p = (phase_kind(kind).unwrap().ctor)(&quick(kind)).unwrap();
            let a = p.run(&default_entry(), &default_ctx()).unwrap();
            let b = p.run(&default_entry(), &default_ctx()).unwrap();
            assert_eq!(a, b, "{kind}");
        }
    }

    /// Handing on through the chain keeps the covariance a covariance and never shrinks the clock below what it
    /// entered with (the phases use no clock measurement).
    #[test]
    fn a_descent_then_ascent_chain_hands_a_valid_state_on() {
        let d = (phase_kind(DESCENT).unwrap().ctor)(&quick(DESCENT)).unwrap();
        let a = (phase_kind(ASCENT).unwrap().ctor)(&quick(ASCENT)).unwrap();
        let ctx = default_ctx();
        let entry = default_entry();
        let landed = d.run(&entry, &ctx).unwrap();
        let up = a.run(&landed.exit, &ctx).unwrap();
        assert!(up.exit.t_s > landed.exit.t_s);
        assert!(crate::lunar_phase::cov_is_valid(&up.exit.p));
        assert!(up.exit.clock.cov[0][0] >= landed.exit.clock.cov[0][0]);
    }

    #[test]
    fn a_frame_or_timescale_the_phase_cannot_use_is_refused_with_the_reason() {
        let mut e = default_entry();
        e.frame = crate::lunar_phase::Frame::Gcrf;
        let p = (phase_kind(DESCENT).unwrap().ctor)(&quick(DESCENT)).unwrap();
        assert!(p
            .run(&e, &default_ctx())
            .unwrap_err()
            .contains("converts frames"));
        let mut e = default_entry();
        e.clock.timescale = crate::lunar_phase::Timescale::Utc;
        assert!(p
            .run(&e, &default_ctx())
            .unwrap_err()
            .contains("converts timescales"));
    }
}
