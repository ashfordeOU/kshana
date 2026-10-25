// SPDX-License-Identifier: AGPL-3.0-only
//! `leo-rendezvous`: relative navigation from a far-range approach to the docking envelope in low
//! Earth orbit, in legs of a stated sensor and range.
//!
//! **MODELLED.** The relative state of the chaser against the target is carried in the target's
//! LVLH axes, `[x radial, y along-track, z cross-track]` and their rates, with the closed-form
//! Clohessy-Wiltshire transition of [`crate::cw_dynamics`] (linear, circular target orbit) and a
//! 6x6 covariance. Each step adds a white acceleration noise of stated power spectral density and
//! then a position update whose variance, per axis, is the sensor's position variance at the
//! current range over three ([`crate::mission_thread::sensors`]). The range falls linearly over a
//! leg. The starting relative covariance is the chaser's absolute covariance from the entry state
//! plus the target's stated absolute sigmas, added as if independent: conservative, because errors
//! common to both vehicles would cancel.
//!
//! The budget carries the RELATIVE sigmas. The chaser's absolute covariance is handed on
//! unchanged, and a budget row says so: this phase measures the vehicles against each other, not
//! against the Earth. Nothing here models a particular sensor; the sensor parameters are the
//! ILLUSTRATIVE defaults of [`crate::mission_thread::sensors`]. Repeats are separate phases with
//! their own ids; a run is deterministic (covariances only, no sampling).
//!
//! Model keys (`[phase.model]`): `target_alt_m`, `target_abs_sigma_pos_m` and
//! `target_abs_sigma_vel_mps` (per axis), `capture_pos_m` and `capture_vel_mps` (the docking
//! envelope on the root-sum-square relative sigmas), `process_q_acc` (optional, default 1e-9
//! (m/s^2)^2/Hz), `min_window_s` (optional) and at least one `[[phase.model.legs]]` with
//! `range_m`, `end_range_m`, `duration_s`, `sensor` (`optical-camera`, `lidar` or `rf-ranging`)
//! and `interval_s`. The legs' durations must add to the phase's duration.

use super::model::Model;
use crate::cw_dynamics::{stm, Mat6};
use crate::forces::MU_EARTH;
use crate::mission_thread::budget::{BudgetRow, PhaseBudget};
use crate::mission_thread::phase::{
    Event, EvidenceLabel, Frame, NavSource, NavState, PhaseOutcome, Sample, TimeSource,
};
use crate::mission_thread::sensors::{sensor_sigma, RelNavSensor, SensorParams};
use crate::mission_thread::{MissionPhase, PhaseCtx, ThreadCtx};

/// The registered kind name.
pub const KIND: &str = "leo-rendezvous";

/// The most samples a phase's series keeps; the budget peaks use every step.
const MAX_SAMPLES: usize = 400;

/// One approach leg.
struct Leg {
    range_m: f64,
    end_range_m: f64,
    duration_s: f64,
    sensor: RelNavSensor,
    interval_s: f64,
}

/// The leo-rendezvous phase.
pub struct LeoRendezvous {
    target_alt_m: f64,
    target_abs_sigma_pos_m: f64,
    target_abs_sigma_vel_mps: f64,
    capture_pos_m: f64,
    capture_vel_mps: f64,
    process_q_acc: f64,
    min_window_s: Option<f64>,
    legs: Vec<Leg>,
}

/// Builds the phase from its model table.
pub fn ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    let m = Model::new(KIND, t);
    m.only(&[
        "target_alt_m",
        "target_abs_sigma_pos_m",
        "target_abs_sigma_vel_mps",
        "capture_pos_m",
        "capture_vel_mps",
        "process_q_acc",
        "min_window_s",
        "legs",
    ])?;
    let mut legs = Vec::new();
    for l in m.tables("legs")? {
        l.only(&[
            "range_m",
            "end_range_m",
            "duration_s",
            "sensor",
            "interval_s",
        ])?;
        let sensor = RelNavSensor::parse(
            l.text("sensor")?
                .ok_or_else(|| format!("{KIND}: a leg needs `sensor`"))?,
        )?;
        legs.push(Leg {
            range_m: l.pos("range_m")?,
            end_range_m: l.pos("end_range_m")?,
            duration_s: l.pos("duration_s")?,
            sensor,
            interval_s: l.pos("interval_s")?,
        });
    }
    if legs.is_empty() {
        return Err(format!(
            "{KIND}: the model needs at least one `[[phase.model.legs]]`"
        ));
    }
    let min_window_s = if t.contains_key("min_window_s") {
        Some(m.nonneg("min_window_s")?)
    } else {
        None
    };
    Ok(Box::new(LeoRendezvous {
        target_alt_m: m.pos("target_alt_m")?,
        target_abs_sigma_pos_m: m.nonneg("target_abs_sigma_pos_m")?,
        target_abs_sigma_vel_mps: m.nonneg("target_abs_sigma_vel_mps")?,
        capture_pos_m: m.pos("capture_pos_m")?,
        capture_vel_mps: m.pos("capture_vel_mps")?,
        process_q_acc: m.num_or("process_q_acc", 1.0e-9)?,
        min_window_s,
        legs,
    }))
}

pub(super) fn mul(a: &Mat6, b: &Mat6) -> Mat6 {
    let mut c = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            c[i][j] = (0..6).map(|k| a[i][k] * b[k][j]).sum();
        }
    }
    c
}

pub(super) fn transpose(a: &Mat6) -> Mat6 {
    let mut t = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            t[j][i] = a[i][j];
        }
    }
    t
}

/// `P = Phi P Phi^T + Q`, with `Q` the white acceleration noise `q` over `dt` on each axis.
fn predict(p: &Mat6, n: f64, dt: f64, q: f64) -> Mat6 {
    let phi = stm(n, dt);
    let mut out = mul(&mul(&phi, p), &transpose(&phi));
    for i in 0..3 {
        out[i][i] += q * dt.powi(3) / 3.0;
        out[i][i + 3] += q * dt * dt / 2.0;
        out[i + 3][i] += q * dt * dt / 2.0;
        out[i + 3][i + 3] += q * dt;
    }
    out
}

/// A position measurement of variance `r` on each of the three axes (`H = [I 0]`, so the gain
/// uses the position block only and the update is applied to the whole matrix).
fn update(p: &Mat6, r: f64) -> Mat6 {
    // P+ = P - P H^T (H P H^T + R)^-1 H P, with H P H^T the 3x3 position block.
    let mut s = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            s[i][j] = p[i][j] + if i == j { r } else { 0.0 };
        }
    }
    let inv = inv3(&s);
    let mut out = *p;
    for i in 0..6 {
        for j in 0..6 {
            let mut v = 0.0;
            for a in 0..3 {
                for b in 0..3 {
                    v += p[i][a] * inv[a][b] * p[b][j];
                }
            }
            out[i][j] -= v;
        }
    }
    out
}

fn inv3(m: &[[f64; 3]; 3]) -> [[f64; 3]; 3] {
    let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
        - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
        + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
    let c = |a: usize, b: usize, c: usize, d: usize| m[a][b] * m[c][d] - m[a][d] * m[c][b];
    [
        [
            c(1, 1, 2, 2) / det,
            -c(0, 1, 2, 2) / det,
            c(0, 1, 1, 2) / det,
        ],
        [
            -c(1, 0, 2, 2) / det,
            c(0, 0, 2, 2) / det,
            -c(0, 0, 1, 2) / det,
        ],
        [
            c(1, 0, 2, 1) / det,
            -c(0, 0, 2, 1) / det,
            c(0, 0, 1, 1) / det,
        ],
    ]
}

fn rss_pos(p: &Mat6) -> f64 {
    (p[0][0] + p[1][1] + p[2][2]).max(0.0).sqrt()
}

fn rss_vel(p: &Mat6) -> f64 {
    (p[3][3] + p[4][4] + p[5][5]).max(0.0).sqrt()
}

impl MissionPhase for LeoRendezvous {
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
            return Err(format!(
                "{KIND}: expects a GCRF entry state, got {:?}; state the entry in gcrf",
                entry.frame
            ));
        }
        let legs_total: f64 = self.legs.iter().map(|l| l.duration_s).sum();
        phase.require_duration("the legs' total duration", legs_total)?;
        let use_rel = phase.uses(NavSource::RelativeOptical);
        let n = (MU_EARTH / (6_378_137.0 + self.target_alt_m).powi(3)).sqrt();
        let t0 = entry.t_s;

        // Starting relative covariance: the chaser's absolute covariance (mean per-axis blocks, as
        // the other Earth phases take it) plus the target's stated sigmas, independent.
        let chaser = super::filter::AxisFilter::from_cov6(&entry.p);
        let mut p = [[0.0; 6]; 6];
        for i in 0..3 {
            p[i][i] = chaser.p[0][0] + self.target_abs_sigma_pos_m.powi(2);
            p[i][i + 3] = chaser.p[0][1];
            p[i + 3][i] = chaser.p[1][0];
            p[i + 3][i + 3] = chaser.p[1][1] + self.target_abs_sigma_vel_mps.powi(2);
        }

        let entry_pos = rss_pos(&p);
        let entry_vel = rss_vel(&p);
        let clock_sigma = entry.clock.sigma_bias_s();
        let mut all: Vec<Sample> = vec![Sample {
            t_s: t0,
            sigma_pos_m: entry_pos,
            sigma_vel_mps: entry_vel,
            sigma_time_s: clock_sigma,
        }];
        let mut events = vec![Event {
            t_s: t0,
            what: format!(
                "rendezvous begins at {:.0} m: relative sigma {:.2} m and {:.4} m/s",
                self.legs[0].range_m, entry_pos, entry_vel
            ),
        }];
        let mut rows: Vec<BudgetRow> = Vec::new();
        let mut t = 0.0;
        let mut inside_from: Option<f64> = None;
        for (li, leg) in self.legs.iter().enumerate() {
            let params = SensorParams::illustrative(leg.sensor);
            let (start_sigma, end_sigma) = (
                sensor_sigma(&params, leg.range_m)
                    .map_err(|e| format!("{KIND}: leg {} start: {e}", li + 1))?,
                sensor_sigma(&params, leg.end_range_m)
                    .map_err(|e| format!("{KIND}: leg {} end: {e}", li + 1))?,
            );
            events.push(Event {
                t_s: t0 + t,
                what: format!(
                    "leg {}: {} from {:.0} m to {:.0} m over {:.0} s",
                    li + 1,
                    leg.sensor.name(),
                    leg.range_m,
                    leg.end_range_m,
                    leg.duration_s
                ),
            });
            if use_rel {
                rows.push(BudgetRow {
                    source: format!(
                        "leg {} {} position sigma at {:.0} m",
                        li + 1,
                        leg.sensor.name(),
                        leg.range_m
                    ),
                    sigma: start_sigma.pos_sigma_m,
                    unit: "m".to_string(),
                    label: EvidenceLabel::modelled(),
                });
                rows.push(BudgetRow {
                    source: format!(
                        "leg {} {} position sigma at {:.0} m",
                        li + 1,
                        leg.sensor.name(),
                        leg.end_range_m
                    ),
                    sigma: end_sigma.pos_sigma_m,
                    unit: "m".to_string(),
                    label: EvidenceLabel::modelled(),
                });
            }
            let leg_end = t + leg.duration_s;
            let mut tl = 0.0;
            while tl < leg.duration_s - 1e-9 {
                let dt = leg.interval_s.min(leg.duration_s - tl);
                p = predict(&p, n, dt, self.process_q_acc);
                tl += dt;
                t += dt;
                if use_rel {
                    let frac = (tl / leg.duration_s).min(1.0);
                    let range = leg.range_m + (leg.end_range_m - leg.range_m) * frac;
                    let sig = sensor_sigma(&params, range)
                        .map_err(|e| format!("{KIND}: leg {}: {e}", li + 1))?;
                    p = update(&p, sig.pos_sigma_m.powi(2) / 3.0);
                }
                let s = Sample {
                    t_s: t0 + t,
                    sigma_pos_m: rss_pos(&p),
                    sigma_vel_mps: rss_vel(&p),
                    sigma_time_s: clock_sigma,
                };
                let ok =
                    s.sigma_pos_m < self.capture_pos_m && s.sigma_vel_mps < self.capture_vel_mps;
                match (ok, inside_from) {
                    (true, None) => inside_from = Some(t),
                    (false, Some(_)) => inside_from = None,
                    _ => {}
                }
                all.push(s);
            }
            t = leg_end;
        }
        let last = *all
            .last()
            .ok_or_else(|| format!("{KIND}: the phase produced no samples"))?;
        let peak_pos = all.iter().map(|s| s.sigma_pos_m).fold(0.0, f64::max);
        let peak_vel = all.iter().map(|s| s.sigma_vel_mps).fold(0.0, f64::max);
        let window = inside_from.map(|a| phase.duration_s - a).unwrap_or(0.0);
        match inside_from {
            Some(a) => events.push(Event {
                t_s: t0 + a,
                what: format!(
                    "relative sigma inside the capture envelope ({} m, {} m/s) from here to the end: window {:.0} s",
                    self.capture_pos_m, self.capture_vel_mps, window
                ),
            }),
            None => events.push(Event {
                t_s: t0 + phase.duration_s,
                what: format!(
                    "relative sigma not inside the capture envelope ({} m, {} m/s) at the end of the phase",
                    self.capture_pos_m, self.capture_vel_mps
                ),
            }),
        }
        if let Some(min) = self.min_window_s {
            if window < min {
                events.push(Event {
                    t_s: t0 + phase.duration_s,
                    what: format!(
                        "docking window {window:.0} s is shorter than the required {min:.0} s"
                    ),
                });
            }
        }
        rows.push(BudgetRow {
            source: "relative position sigma at the end of the phase".to_string(),
            sigma: last.sigma_pos_m,
            unit: "m".to_string(),
            label: EvidenceLabel::modelled(),
        });
        rows.push(BudgetRow {
            source: "relative velocity sigma at the end of the phase".to_string(),
            sigma: last.sigma_vel_mps,
            unit: "m/s".to_string(),
            label: EvidenceLabel::modelled(),
        });
        rows.push(BudgetRow {
            source: format!(
                "docking window (relative sigma inside {} m and {} m/s to the end of the phase)",
                self.capture_pos_m, self.capture_vel_mps
            ),
            sigma: window,
            unit: "s".to_string(),
            label: EvidenceLabel::modelled(),
        });
        rows.push(BudgetRow {
            source: "chaser absolute position covariance, carried unchanged (this phase measures the vehicles against each other, not against the Earth)".to_string(),
            sigma: entry.sigma_pos_m(),
            unit: "m".to_string(),
            label: EvidenceLabel::modelled(),
        });
        // Series: every step is used for the peaks; the series keeps at most MAX_SAMPLES of them
        // (the first and the last always).
        let series = thin(&all, MAX_SAMPLES);
        let mut exit = entry.clone();
        exit.t_s = t0 + phase.duration_s;
        exit.frame = Frame::Gcrf;
        exit.upstream = entry.upstream.clone().weaker(EvidenceLabel::modelled());
        let nav = if phase.nav.is_empty() {
            vec![NavSource::RelativeOptical]
        } else {
            phase.nav.clone()
        };
        let budget = PhaseBudget {
            phase_id: phase.id.clone(),
            kind: KIND.to_string(),
            entry_sigma_pos_m: entry_pos,
            entry_sigma_vel_mps: entry_vel,
            entry_sigma_time_s: clock_sigma,
            exit_sigma_pos_m: last.sigma_pos_m,
            exit_sigma_vel_mps: last.sigma_vel_mps,
            exit_sigma_time_s: last.sigma_time_s,
            peak_sigma_pos_m: peak_pos,
            peak_sigma_vel_mps: peak_vel,
            peak_sigma_time_s: clock_sigma,
            nav_sources: nav,
            time_source: if phase.uses(NavSource::Gnss) {
                phase.time
            } else {
                TimeSource::OnboardHoldover
            },
            limiting_source: Some(
                if use_rel {
                    "relative sensing"
                } else {
                    "initial relative uncertainty (no relative sensing)"
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

/// At most `max` samples of `all`, evenly strided, always keeping the first and the last.
fn thin(all: &[Sample], max: usize) -> Vec<Sample> {
    if all.len() <= max {
        return all.to_vec();
    }
    let stride = all.len().div_ceil(max);
    let mut out: Vec<Sample> = all.iter().copied().step_by(stride).collect();
    if let (Some(last), Some(kept)) = (all.last(), out.last()) {
        if kept.t_s != last.t_s {
            out.push(*last);
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::phase::Timescale;

    fn entry() -> NavState {
        NavState::diagonal(
            0.0,
            Frame::Gcrf,
            [6.778e6, 0.0, 0.0, 0.0, 7670.0, 0.0],
            5.0,
            0.005,
            Timescale::Utc,
            1e-7,
            1e-12,
        )
    }

    fn model(extra: &str) -> toml::Table {
        toml::from_str(&format!(
            "target_alt_m = 400000.0\ntarget_abs_sigma_pos_m = 5.0\ntarget_abs_sigma_vel_mps = 0.005\n\
             capture_pos_m = 0.5\ncapture_vel_mps = 0.02\n\
             [[legs]]\nrange_m = 20000.0\nend_range_m = 500.0\nduration_s = 1800.0\nsensor = \"rf-ranging\"\ninterval_s = 10.0\n\
             [[legs]]\nrange_m = 500.0\nend_range_m = 10.0\nduration_s = 900.0\nsensor = \"optical-camera\"\ninterval_s = 5.0\n\
             [[legs]]\nrange_m = 10.0\nend_range_m = 1.0\nduration_s = 300.0\nsensor = \"lidar\"\ninterval_s = 1.0\n{extra}"
        ))
        .unwrap()
    }

    fn run(extra: &str) -> PhaseOutcome {
        let phase = ctor(&model(extra)).unwrap();
        let ctx = ThreadCtx::new("2028-01-02T00:00:00Z", 1);
        phase
            .run(&entry(), &ctx, &ctx.phase_ctx(0, "rdv", 3000.0))
            .unwrap()
    }

    #[test]
    fn the_relative_sigma_falls_through_the_legs_and_opens_a_docking_window() {
        let o = run("");
        let b = &o.budget;
        assert!(b.exit_sigma_pos_m < b.entry_sigma_pos_m / 10.0, "{b:?}");
        assert!(
            b.exit_sigma_pos_m < 0.5 && b.exit_sigma_vel_mps < 0.02,
            "{b:?}"
        );
        let w = b
            .rows
            .iter()
            .find(|r| r.source.starts_with("docking window"))
            .unwrap();
        assert!(w.sigma > 0.0 && w.sigma <= 3000.0, "{}", w.sigma);
        assert!(o
            .events
            .iter()
            .any(|e| e.what.contains("inside the capture envelope")));
        assert!(b
            .rows
            .iter()
            .any(|r| r.source.contains("carried unchanged") && r.sigma == entry().sigma_pos_m()));
        // The absolute covariance is handed on untouched; time advanced by the duration.
        assert_eq!(o.exit.p, entry().p);
        assert_eq!(o.exit.t_s, 3000.0);
    }

    #[test]
    fn without_relative_sensing_the_sigma_only_grows_and_no_window_opens() {
        let phase = ctor(&model("")).unwrap();
        let ctx = ThreadCtx::new("2028-01-02T00:00:00Z", 1);
        let mut pctx = ctx.phase_ctx(0, "rdv", 3000.0);
        pctx.nav = vec![NavSource::Inertial];
        let o = phase.run(&entry(), &ctx, &pctx).unwrap();
        assert!(o.budget.exit_sigma_pos_m >= o.budget.entry_sigma_pos_m);
        assert!(o
            .events
            .iter()
            .any(|e| e.what.contains("not inside the capture envelope")));
        assert!(o
            .budget
            .limiting_source
            .unwrap()
            .contains("no relative sensing"));
    }

    #[test]
    fn the_covariance_recursion_matches_a_one_axis_hand_calculation() {
        // Along-track and radial coupling aside, the cross-track axis is a decoupled oscillator:
        // one predict and one update on it must equal the scalar formulas.
        let n = 1.1e-3;
        let (dt, q, r) = (10.0, 1e-9, 4.0);
        let mut p = [[0.0; 6]; 6];
        p[2][2] = 100.0;
        p[5][5] = 0.01;
        let pr = predict(&p, n, dt, q);
        let (s, c) = ((n * dt).sin(), (n * dt).cos());
        // z' = c z + (s/n) vz ; the covariance of z after the step, no correlation initially.
        let want_zz = c * c * 100.0 + (s / n).powi(2) * 0.01 + q * dt.powi(3) / 3.0;
        assert!(
            (pr[2][2] - want_zz).abs() < 1e-9 * want_zz,
            "{} {want_zz}",
            pr[2][2]
        );
        let up = update(&pr, r);
        let k = pr[2][2] / (pr[2][2] + r);
        assert!((up[2][2] - (1.0 - k) * pr[2][2]).abs() < 1e-9 * pr[2][2]);
        assert!(up[5][5] <= pr[5][5]);
    }

    #[test]
    fn bad_models_and_a_duration_mismatch_are_refused() {
        assert!(ctor(&model("surprise = 1\n"))
            .err()
            .unwrap()
            .contains("unknown model key"));
        let mut t = model("");
        t.remove("legs");
        assert!(ctor(&t).err().unwrap().contains("at least one"));
        let phase = ctor(&model("")).unwrap();
        let ctx = ThreadCtx::new("2028-01-02T00:00:00Z", 1);
        let e = phase
            .run(&entry(), &ctx, &ctx.phase_ctx(0, "rdv", 2000.0))
            .err()
            .unwrap();
        assert!(e.contains("legs' total duration"), "{e}");
        // A sensor range beyond its limit names the leg.
        let far = toml::from_str::<toml::Table>(
            "target_alt_m = 4e5\ntarget_abs_sigma_pos_m = 1.0\ntarget_abs_sigma_vel_mps = 0.001\n\
             capture_pos_m = 1.0\ncapture_vel_mps = 0.1\n[[legs]]\nrange_m = 90000.0\nend_range_m = 10.0\n\
             duration_s = 100.0\nsensor = \"lidar\"\ninterval_s = 1.0\n",
        )
        .unwrap();
        let e = ctor(&far)
            .unwrap()
            .run(&entry(), &ctx, &ctx.phase_ctx(0, "rdv", 100.0))
            .err()
            .unwrap();
        assert!(e.contains("leg 1") && e.contains("limit"), "{e}");
        let mut e = entry();
        e.frame = Frame::Mci;
        let msg = phase
            .run(&e, &ctx, &ctx.phase_ctx(0, "rdv", 3000.0))
            .err()
            .unwrap();
        assert!(msg.contains("GCRF entry"), "{msg}");
    }

    #[test]
    fn the_series_is_thinned_but_keeps_both_ends() {
        let all: Vec<Sample> = (0..1001)
            .map(|i| Sample {
                t_s: i as f64,
                sigma_pos_m: 1.0,
                sigma_vel_mps: 1.0,
                sigma_time_s: 1.0,
            })
            .collect();
        let t = thin(&all, 400);
        assert!(t.len() <= 402 && t[0].t_s == 0.0 && t.last().unwrap().t_s == 1000.0);
    }
}
