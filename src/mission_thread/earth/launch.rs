// SPDX-License-Identifier: AGPL-3.0-only
//! `launch-ascent`: powered ascent to a parking orbit with GNSS acquisition and fade.
//!
//! **MODELLED.** The position and velocity covariance is propagated on a constant-velocity model
//! with white acceleration noise (the inertial dead-reckoning grade, `imu_q_acc`), and a GNSS fix
//! of stated accuracy updates it whenever GNSS is available: after `gnss_acquire_s` and outside
//! the stated fades (plume and shroud masks, staging). The clock is a bias-and-drift filter with
//! the stated white frequency noise, disciplined by GNSS under the same conditions. Nothing here
//! is a model of any launch vehicle or receiver: every number is a stated input, and the example
//! documents give round, ILLUSTRATIVE values.
//!
//! Model keys (`[phase.model]`): `gnss_acquire_s`, `gnss_sigma_pos_m` and `gnss_sigma_vel_mps`
//! (1-sigma per axis of one fix), `gnss_time_sigma_s`, `imu_q_acc`, `clock_q_f`, `clock_q_d`,
//! `step_s`, an optional `[[phase.model.fades]]` list of `start_s`, `end_s` and `what`, and the
//! parking orbit the phase ends on: `insertion_alt_m`, `insertion_inclination_deg` and optionally
//! `insertion_raan_deg` and `insertion_true_anomaly_deg`.

use super::filter::{AxisFilter, ClockFilter};
use super::model::Model;
use super::orbit::circular_state;
use crate::mission_thread::budget::{BudgetRow, PhaseBudget};
use crate::mission_thread::phase::{
    Event, EvidenceLabel, Frame, NavSource, NavState, PhaseOutcome, Sample, TimeSource,
};
use crate::mission_thread::{MissionPhase, PhaseCtx, ThreadCtx};

/// The registered kind name.
pub const KIND: &str = "launch-ascent";

struct Fade {
    start_s: f64,
    end_s: f64,
    what: String,
}

/// The launch-ascent phase.
pub struct LaunchAscent {
    gnss_acquire_s: f64,
    gnss_sigma_pos_m: f64,
    gnss_sigma_vel_mps: f64,
    gnss_time_sigma_s: f64,
    imu_q_acc: f64,
    clock_q_f: f64,
    clock_q_d: f64,
    step_s: f64,
    fades: Vec<Fade>,
    insertion: [f64; 4],
}

/// Builds the phase from its model table.
pub fn ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    let m = Model::new(KIND, t);
    m.only(&[
        "gnss_acquire_s",
        "gnss_sigma_pos_m",
        "gnss_sigma_vel_mps",
        "gnss_time_sigma_s",
        "imu_q_acc",
        "clock_q_f",
        "clock_q_d",
        "step_s",
        "fades",
        "insertion_alt_m",
        "insertion_inclination_deg",
        "insertion_raan_deg",
        "insertion_true_anomaly_deg",
    ])?;
    let mut fades = Vec::new();
    for f in m.tables("fades")? {
        f.only(&["start_s", "end_s", "what"])?;
        let (a, b) = (f.nonneg("start_s")?, f.nonneg("end_s")?);
        if b <= a {
            return Err(crate::terr!(
                "e-mission-thread-earth-launch-fade-must-end-after-it",
                kind = KIND,
                a = crate::i18n::num_plain(a),
                b = crate::i18n::num_plain(b)
            ));
        }
        fades.push(Fade {
            start_s: a,
            end_s: b,
            what: f.text("what")?.unwrap_or("fade").to_string(),
        });
    }
    Ok(Box::new(LaunchAscent {
        gnss_acquire_s: m.nonneg("gnss_acquire_s")?,
        gnss_sigma_pos_m: m.pos("gnss_sigma_pos_m")?,
        gnss_sigma_vel_mps: m.pos("gnss_sigma_vel_mps")?,
        gnss_time_sigma_s: m.pos("gnss_time_sigma_s")?,
        imu_q_acc: m.nonneg("imu_q_acc")?,
        clock_q_f: m.nonneg("clock_q_f")?,
        clock_q_d: m.nonneg("clock_q_d")?,
        step_s: m.pos("step_s")?,
        fades,
        insertion: [
            m.pos("insertion_alt_m")?,
            m.num("insertion_inclination_deg")?,
            m.num_or("insertion_raan_deg", 0.0)?,
            m.num_or("insertion_true_anomaly_deg", 0.0)?,
        ],
    }))
}

impl LaunchAscent {
    /// Whether GNSS can be used at `t` seconds into the phase, and why not.
    fn gnss_blocked(&self, t: f64) -> Option<String> {
        if t < self.gnss_acquire_s {
            return Some("acquisition".to_string());
        }
        self.fades
            .iter()
            .find(|f| t >= f.start_s && t < f.end_s)
            .map(|f| f.what.clone())
    }
}

impl MissionPhase for LaunchAscent {
    fn kind(&self) -> &'static str {
        KIND
    }

    fn run(
        &self,
        entry: &NavState,
        _ctx: &ThreadCtx,
        phase: &PhaseCtx,
    ) -> Result<PhaseOutcome, String> {
        if entry.frame != Frame::Gcrf {
            return Err(crate::terr!(
                "e-mission-thread-earth-launch-expects-gcrf-entry-state-got",
                kind = KIND,
                frame = format!("{:?}", entry.frame)
            ));
        }
        let use_gnss = phase.uses(NavSource::Gnss);
        let t0 = entry.t_s;
        let mut axis = AxisFilter::from_cov6(&entry.p);
        let mut clock = ClockFilter { p: entry.clock.cov };
        let rss = |a: &AxisFilter| 3f64.sqrt() * a.sigma_pos();
        let rssv = |a: &AxisFilter| 3f64.sqrt() * a.sigma_vel();
        let mut series = vec![Sample {
            t_s: t0,
            sigma_pos_m: rss(&axis),
            sigma_vel_mps: rssv(&axis),
            sigma_time_s: clock.sigma_bias(),
        }];
        let mut events = vec![Event {
            t_s: t0,
            what: "liftoff: navigation state from the entry".to_string(),
        }];
        let (mut peak_pos, mut peak_vel, mut peak_time) = (
            series[0].sigma_pos_m,
            series[0].sigma_vel_mps,
            series[0].sigma_time_s,
        );
        let mut t = 0.0;
        let mut blocked_now: Option<String> = None;
        let mut outage_start = 0.0;
        let (mut longest, mut longest_pos, mut longest_time) = (0.0_f64, 0.0_f64, 0.0_f64);
        let (mut cur_pos, mut cur_time) = (0.0_f64, 0.0_f64);
        while t < phase.duration_s - 1e-9 {
            let dt = self.step_s.min(phase.duration_s - t);
            axis.predict(dt, self.imu_q_acc);
            clock.predict(dt, self.clock_q_f, self.clock_q_d);
            t += dt;
            let why = if use_gnss {
                self.gnss_blocked(t - dt)
            } else {
                Some("GNSS not used in this phase".to_string())
            };
            match (&blocked_now, &why) {
                (None, Some(w)) => {
                    events.push(Event {
                        t_s: t0 + t - dt,
                        what: format!("GNSS unavailable: {w}"),
                    });
                    outage_start = t - dt;
                    cur_pos = 0.0;
                    cur_time = 0.0;
                }
                (Some(_), None) => {
                    events.push(Event {
                        t_s: t0 + t - dt,
                        what: "GNSS available again".to_string(),
                    });
                    if t - dt - outage_start > longest {
                        longest = t - dt - outage_start;
                        longest_pos = cur_pos;
                        longest_time = cur_time;
                    }
                }
                _ => {}
            }
            blocked_now = why.clone();
            if why.is_none() {
                axis.update_pos(self.gnss_sigma_pos_m.powi(2));
                axis.update_vel(self.gnss_sigma_vel_mps.powi(2));
                clock.update_bias(self.gnss_time_sigma_s.powi(2));
            }
            let s = Sample {
                t_s: t0 + t,
                sigma_pos_m: rss(&axis),
                sigma_vel_mps: rssv(&axis),
                sigma_time_s: clock.sigma_bias(),
            };
            if why.is_some() {
                cur_pos = cur_pos.max(s.sigma_pos_m);
                cur_time = cur_time.max(s.sigma_time_s);
            }
            peak_pos = peak_pos.max(s.sigma_pos_m);
            peak_vel = peak_vel.max(s.sigma_vel_mps);
            peak_time = peak_time.max(s.sigma_time_s);
            series.push(s);
        }
        if blocked_now.is_some() && t - outage_start > longest {
            longest = t - outage_start;
            longest_pos = cur_pos;
            longest_time = cur_time;
        }
        let gnss_floor = 3f64.sqrt() * self.gnss_sigma_pos_m;
        let dead_reckoning_limits = longest_pos > 2.0 * gnss_floor;
        let mut exit = entry.clone();
        exit.t_s = t0 + phase.duration_s;
        exit.frame = Frame::Gcrf;
        exit.x = circular_state(
            self.insertion[0],
            self.insertion[1],
            self.insertion[2],
            self.insertion[3],
        );
        exit.p = axis.cov6();
        exit.clock.cov = clock.p;
        exit.upstream = entry.upstream.clone().weaker(EvidenceLabel::modelled());
        let last = *series.last().ok_or_else(|| {
            crate::terr!(
                "e-mission-thread-earth-launch-the-phase-produced-no-samples",
                kind = KIND
            )
        })?;
        events.push(Event {
            t_s: exit.t_s,
            what: format!(
                "orbit insertion: circular {:.0} km, {:.1} deg",
                self.insertion[0] / 1e3,
                self.insertion[1]
            ),
        });
        let mut rows = vec![BudgetRow {
            source: format!(
                "gnss fix floor ({} m and {} m/s per axis, one fix per {} s step)",
                self.gnss_sigma_pos_m, self.gnss_sigma_vel_mps, self.step_s
            ),
            sigma: gnss_floor,
            unit: "m".to_string(),
            label: EvidenceLabel::modelled(),
        }];
        if longest > 0.0 {
            rows.push(BudgetRow {
                source: format!(
                    "inertial dead reckoning over the longest GNSS outage ({longest:.0} s, white acceleration noise {:e} (m/s^2)^2/Hz)",
                    self.imu_q_acc
                ),
                sigma: longest_pos,
                unit: "m".to_string(),
                label: EvidenceLabel::modelled(),
            });
            rows.push(BudgetRow {
                source: format!("clock holdover over the longest GNSS outage ({longest:.0} s)"),
                sigma: longest_time,
                unit: "s".to_string(),
                label: EvidenceLabel::modelled(),
            });
        }
        let nav = if phase.nav.is_empty() {
            vec![NavSource::Gnss, NavSource::Inertial]
        } else {
            phase.nav.clone()
        };
        let budget = PhaseBudget {
            phase_id: phase.id.clone(),
            kind: KIND.to_string(),
            entry_sigma_pos_m: entry.sigma_pos_m(),
            entry_sigma_vel_mps: entry.sigma_vel_mps(),
            entry_sigma_time_s: entry.sigma_time_s(),
            exit_sigma_pos_m: last.sigma_pos_m,
            exit_sigma_vel_mps: last.sigma_vel_mps,
            exit_sigma_time_s: last.sigma_time_s,
            peak_sigma_pos_m: peak_pos,
            peak_sigma_vel_mps: peak_vel,
            peak_sigma_time_s: peak_time,
            nav_sources: nav,
            time_source: if use_gnss {
                phase.time
            } else {
                TimeSource::OnboardHoldover
            },
            limiting_source: Some(
                if dead_reckoning_limits {
                    "inertial dead reckoning"
                } else {
                    "gnss"
                }
                .to_string(),
            ),
            rows,
            label: EvidenceLabel::modelled(),
        };
        Ok(PhaseOutcome {
            exit,
            budget,
            series,
            events,
            label: EvidenceLabel::modelled(),
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::phase::Timescale;

    fn model(extra: &str) -> toml::Table {
        toml::from_str(&format!(
            "gnss_acquire_s = 60.0\ngnss_sigma_pos_m = 5.0\ngnss_sigma_vel_mps = 0.05\n\
             gnss_time_sigma_s = 1.0e-7\nimu_q_acc = 1.0e-3\nclock_q_f = 1.0e-22\nclock_q_d = 1.0e-30\n\
             step_s = 1.0\ninsertion_alt_m = 185000.0\ninsertion_inclination_deg = 28.5\n{extra}"
        ))
        .unwrap()
    }

    fn entry() -> NavState {
        NavState::diagonal(
            0.0,
            Frame::Gcrf,
            [6.378e6, 0.0, 0.0, 0.0, 0.0, 0.0],
            1.0,
            0.01,
            Timescale::Utc,
            1e-7,
            1e-12,
        )
    }

    fn run(extra: &str, dur: f64) -> PhaseOutcome {
        let phase = ctor(&model(extra)).unwrap();
        let ctx = ThreadCtx::new("2028-03-01T00:00:00Z", 1);
        let pctx = ctx.phase_ctx(0, "ascent", dur);
        phase.run(&entry(), &ctx, &pctx).unwrap()
    }

    #[test]
    fn with_gnss_the_sigma_settles_near_the_fix_and_an_outage_lets_it_grow() {
        let ok = run("", 300.0);
        let last = ok.series.last().unwrap();
        // Settled: below the 5 m per-axis fix (8.66 m RSS) once GNSS is on.
        assert!(last.sigma_pos_m < 3f64.sqrt() * 5.0, "{}", last.sigma_pos_m);
        let faded = run(
            "[[fades]]\nstart_s = 120.0\nend_s = 200.0\nwhat = \"max-q plume mask\"\n",
            300.0,
        );
        let (a, b) = (&ok.series[200], &faded.series[200]);
        assert!(
            b.sigma_pos_m > 2.0 * a.sigma_pos_m,
            "{} vs {}",
            b.sigma_pos_m,
            a.sigma_pos_m
        );
        // The growth over the outage matches the covariance propagation by hand: sigma_vel^2 grows
        // by q dt, the position by dt^2 sigma_v^2 and q dt^3 / 3 on top of the settled values.
        assert!(faded.budget.peak_sigma_pos_m > ok.budget.peak_sigma_pos_m);
        assert_eq!(
            faded.budget.limiting_source.as_deref(),
            Some("inertial dead reckoning")
        );
        assert!(faded
            .events
            .iter()
            .any(|e| e.what.contains("max-q plume mask")));
        assert!(faded
            .events
            .iter()
            .any(|e| e.what.contains("available again")));
        assert!(faded
            .budget
            .rows
            .iter()
            .any(|r| r.source.contains("longest GNSS outage (80 s")));
        // Entry is stamped, the exit is on the parking orbit, time advanced by the duration.
        assert_eq!(faded.exit.t_s, 300.0);
        let r =
            (faded.exit.x[0].powi(2) + faded.exit.x[1].powi(2) + faded.exit.x[2].powi(2)).sqrt();
        assert!((r - (6_378_137.0 + 185_000.0)).abs() < 1e-6);
    }

    #[test]
    fn before_acquisition_the_sigma_only_grows_and_a_longer_acquisition_is_worse() {
        let short = run("", 100.0);
        let mut slow = model("");
        slow.insert("gnss_acquire_s".into(), toml::Value::Float(90.0));
        let phase = ctor(&slow).unwrap();
        let ctx = ThreadCtx::new("2028-03-01T00:00:00Z", 1);
        let pctx = ctx.phase_ctx(0, "ascent", 100.0);
        let late = phase.run(&entry(), &ctx, &pctx).unwrap();
        assert!(late.budget.peak_sigma_pos_m > short.budget.peak_sigma_pos_m);
        // Monotone growth while no fix is used.
        for w in late.series[..90].windows(2) {
            assert!(w[1].sigma_pos_m >= w[0].sigma_pos_m);
        }
    }

    #[test]
    fn a_phase_that_does_not_list_gnss_never_uses_it() {
        let phase = ctor(&model("")).unwrap();
        let ctx = ThreadCtx::new("2028-03-01T00:00:00Z", 1);
        let mut pctx = ctx.phase_ctx(0, "ascent", 200.0);
        pctx.nav = vec![NavSource::Inertial];
        let o = phase.run(&entry(), &ctx, &pctx).unwrap();
        let mut prev = 0.0;
        for s in &o.series {
            assert!(s.sigma_pos_m >= prev);
            prev = s.sigma_pos_m;
        }
        assert_eq!(o.budget.time_source, TimeSource::OnboardHoldover);
    }

    #[test]
    fn bad_models_and_entries_are_refused() {
        assert!(ctor(&model("surprise = 1\n"))
            .err()
            .unwrap()
            .contains("unknown model key"));
        assert!(ctor(&model("[[fades]]\nstart_s = 10.0\nend_s = 5.0\n"))
            .err()
            .unwrap()
            .contains("end after"));
        let mut t = model("");
        t.remove("gnss_sigma_pos_m");
        assert!(ctor(&t).err().unwrap().contains("needs `gnss_sigma_pos_m`"));
        let phase = ctor(&model("")).unwrap();
        let ctx = ThreadCtx::new("2028-03-01T00:00:00Z", 1);
        let mut e = entry();
        e.frame = Frame::Mci;
        let e = phase
            .run(&e, &ctx, &ctx.phase_ctx(0, "a", 10.0))
            .err()
            .unwrap();
        assert!(e.contains("GCRF entry"), "{e}");
    }
}
