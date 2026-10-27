// SPDX-License-Identifier: AGPL-3.0-only
//! `entry`: the return coast to the entry interface and what the interface covariance means for the
//! entry corridor and the landing footprint.
//!
//! **MODELLED, and every number is a stated input.** The coast is the `tli-and-cruise` coast with no
//! burn (the same Cowell propagation, finite-difference STM and updates, under this kind's name),
//! ending at the entry interface. At the interface the phase reads the state and covariance:
//!
//! * the flight-path angle `gamma` (below the local horizontal, positive down) and its 1-sigma from
//!   the full 6x6 covariance (a finite-difference gradient of `gamma(x)`; the perpendicular
//!   velocity sigma over the speed dominates it);
//! * the probability that `gamma` is inside the stated corridor, from a Gaussian with that sigma
//!   about the nominal value;
//! * the peak deceleration at the nominal and at both corridor edges from the engine's planar
//!   point-mass entry ([`crate::reentry::simulate_planar_entry`], US76 atmosphere, ballistic, no
//!   lift), beside the Allen-Eggers closed form, and a check against a stated limit;
//! * the landing footprint: downrange 1-sigma is the stated sensitivity (km of range per degree of
//!   flight-path angle) times the angle's sigma; crossrange is the interface position sigma across
//!   the orbit plane plus the velocity sigma across it times the stated flight time.
//!
//! Nothing here models a capsule's lift, guidance or heating: the planar ballistic run is a stand-in
//! for the corridor edges, and the footprint is a first-order mapping from the interface.
//!
//! Model keys (`[phase.model]`): the coast keys of `tli-and-cruise` without the burn (`step_s`,
//! `clock_q_f`, `clock_q_d`, `process_q_acc`, `ssv_*`, `ground_*`), and `interface_alt_m`,
//! `ballistic_coeff_kg_m2`, `corridor_min_deg` and `corridor_max_deg` (the flight-path-angle
//! corridor as positive angles below the horizontal, shallow to steep), `downrange_sensitivity_km_per_deg`,
//! `flight_time_s`, and optionally `max_decel_g`, `scale_height_m` and `start_state_gcrf` (six numbers:
//! the nominal return state at the start of the coast, in place of the incoming nominal state; the
//! covariance, the clock and the time still come from the thread).

// 6x6 covariance loops index several arrays by one variable.
#![allow(clippy::needless_range_loop)]

use super::model::Model;
use super::tli_cruise::{parse, TliCruise};
use crate::mission_thread::budget::BudgetRow;
use crate::mission_thread::phase::{Event, EvidenceLabel, NavState, PhaseOutcome};
use crate::mission_thread::{MissionPhase, PhaseCtx, ThreadCtx};
use crate::reentry::{
    peak_deceleration, simulate_planar_entry, PlanarEntry, G0, SCALE_HEIGHT_EARTH_M,
};

/// The registered kind name.
pub const KIND: &str = "entry";

const ENTRY_KEYS: &[&str] = &[
    "interface_alt_m",
    "ballistic_coeff_kg_m2",
    "corridor_min_deg",
    "corridor_max_deg",
    "downrange_sensitivity_km_per_deg",
    "flight_time_s",
    "max_decel_g",
    "scale_height_m",
];

/// The entry phase.
pub struct Entry {
    coast: TliCruise,
    interface_alt_m: f64,
    ballistic_coeff: f64,
    corridor_min_deg: f64,
    corridor_max_deg: f64,
    range_sens_km_per_deg: f64,
    flight_time_s: f64,
    max_decel_g: Option<f64>,
    scale_height_m: f64,
}

/// Builds the phase from its model table.
pub fn ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    let coast = parse(t, KIND, false, ENTRY_KEYS)?;
    let m = Model::new(KIND, t);
    let (lo, hi) = (m.pos("corridor_min_deg")?, m.pos("corridor_max_deg")?);
    if hi <= lo || hi >= 90.0 {
        return Err(format!(
            "{KIND}: the corridor must run from a shallow to a steeper angle below 90 degrees, got {lo} to {hi}"
        ));
    }
    let max_decel_g = if t.contains_key("max_decel_g") {
        Some(m.pos("max_decel_g")?)
    } else {
        None
    };
    Ok(Box::new(Entry {
        coast,
        interface_alt_m: m.pos("interface_alt_m")?,
        ballistic_coeff: m.pos("ballistic_coeff_kg_m2")?,
        corridor_min_deg: lo,
        corridor_max_deg: hi,
        range_sens_km_per_deg: m.nonneg("downrange_sensitivity_km_per_deg")?,
        flight_time_s: m.nonneg("flight_time_s")?,
        max_decel_g,
        scale_height_m: m.num_or("scale_height_m", SCALE_HEIGHT_EARTH_M)?,
    }))
}

/// Flight-path angle below the local horizontal, degrees, positive down.
fn gamma_deg(x: &[f64; 6]) -> f64 {
    let rn = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
    let vn = (x[3] * x[3] + x[4] * x[4] + x[5] * x[5]).sqrt();
    let s = (x[0] * x[3] + x[1] * x[4] + x[2] * x[5]) / (rn * vn);
    -s.clamp(-1.0, 1.0).asin().to_degrees()
}

/// 1-sigma of `gamma` (degrees) from a 6x6 covariance by a finite-difference gradient.
fn gamma_sigma_deg(x: &[f64; 6], p: &[[f64; 6]; 6]) -> f64 {
    let g0 = gamma_deg(x);
    let mut grad = [0.0; 6];
    for j in 0..6 {
        let h = if j < 3 { 10.0 } else { 1.0e-3 };
        let mut y = *x;
        y[j] += h;
        grad[j] = (gamma_deg(&y) - g0) / h;
    }
    let mut v = 0.0;
    for i in 0..6 {
        for j in 0..6 {
            v += grad[i] * p[i][j] * grad[j];
        }
    }
    v.max(0.0).sqrt()
}

/// The probability that a Gaussian of mean `mu` and sigma `s` falls in `[lo, hi]`.
fn prob_between(mu: f64, s: f64, lo: f64, hi: f64) -> f64 {
    if s <= 0.0 {
        return if (lo..=hi).contains(&mu) { 1.0 } else { 0.0 };
    }
    let cdf = |v: f64| 0.5 * (1.0 + libm::erf((v - mu) / (s * std::f64::consts::SQRT_2)));
    (cdf(hi) - cdf(lo)).clamp(0.0, 1.0)
}

impl MissionPhase for Entry {
    fn kind(&self) -> &'static str {
        KIND
    }

    fn run(
        &self,
        entry: &NavState,
        ctx: &ThreadCtx,
        phase: &PhaseCtx,
    ) -> Result<PhaseOutcome, String> {
        let mut o = self.coast.coast(KIND, false, entry, ctx, phase)?;
        let (x, p) = (o.exit.x, o.exit.p);
        let speed = (x[3] * x[3] + x[4] * x[4] + x[5] * x[5]).sqrt();
        let gamma = gamma_deg(&x);
        let sg = gamma_sigma_deg(&x, &p);
        let in_corridor = (self.corridor_min_deg..=self.corridor_max_deg).contains(&gamma);
        let prob = prob_between(gamma, sg, self.corridor_min_deg, self.corridor_max_deg);
        let t_end = o.exit.t_s;
        o.events.push(Event {
            t_s: t_end,
            what: format!(
                "entry interface at {:.0} km: speed {:.0} m/s, flight-path angle {:.2} deg below the horizontal (1-sigma {:.2e} deg)",
                self.interface_alt_m / 1e3,
                speed,
                gamma,
                sg
            ),
        });
        o.events.push(Event {
            t_s: t_end,
            what: format!(
                "corridor {:.2} to {:.2} deg: the nominal angle is {}; {:.1} % of the dispersed angles are inside",
                self.corridor_min_deg,
                self.corridor_max_deg,
                if in_corridor { "inside" } else { "OUTSIDE" },
                100.0 * prob
            ),
        });
        // Peak deceleration at the nominal angle and at both corridor edges. A run that is still going
        // near the integrator's bound skips out of the atmosphere (ballistic, no lift) and has no peak.
        let peak = |g_deg: f64| {
            let r = simulate_planar_entry(&PlanarEntry {
                entry_speed_m_s: speed,
                flight_path_angle_rad: g_deg.to_radians(),
                interface_altitude_m: self.interface_alt_m,
                ballistic_coeff_kg_m2: self.ballistic_coeff,
            });
            (r.peak_deceleration_g, r.end_time_s > 15_000.0)
        };
        let show = |(g, skipped): (f64, bool)| {
            if skipped {
                "skips out of the atmosphere".to_string()
            } else {
                format!("{g:.1} g")
            }
        };
        let (nom, lo, hi) = (
            peak(gamma.max(0.1)),
            peak(self.corridor_min_deg),
            peak(self.corridor_max_deg),
        );
        let ae = peak_deceleration(
            speed,
            self.corridor_max_deg.to_radians(),
            self.scale_height_m,
        ) / G0;
        o.events.push(Event {
            t_s: t_end,
            what: format!(
                "peak deceleration, planar ballistic point mass: {} at the nominal angle, {} at the shallow edge, {} at the steep edge (Allen-Eggers closed form at the steep edge: {ae:.1} g)",
                show(nom),
                show(lo),
                show(hi)
            ),
        });
        if lo.1 {
            o.events.push(Event {
                t_s: t_end,
                what: "the shallow edge of the corridor skips out for this ballistic coefficient (no lift is modelled)".to_string(),
            });
        }
        if let Some(limit) = self.max_decel_g {
            for (what, (g, skipped)) in [("nominal angle", nom), ("steep edge", hi)] {
                if !skipped && g > limit {
                    o.events.push(Event {
                        t_s: t_end,
                        what: format!(
                            "the {what} peaks at {g:.1} g, above the stated limit of {limit:.1} g"
                        ),
                    });
                }
            }
        }
        // The footprint: downrange from the angle's sigma, crossrange across the orbit plane.
        let (r, v) = ([x[0], x[1], x[2]], [x[3], x[4], x[5]]);
        let h = [
            r[1] * v[2] - r[2] * v[1],
            r[2] * v[0] - r[0] * v[2],
            r[0] * v[1] - r[1] * v[0],
        ];
        let hn = (h[0] * h[0] + h[1] * h[1] + h[2] * h[2]).sqrt();
        let hh = [h[0] / hn, h[1] / hn, h[2] / hn];
        let across = |off: usize| {
            let mut s = 0.0;
            for i in 0..3 {
                for j in 0..3 {
                    s += hh[i] * p[off + i][off + j] * hh[j];
                }
            }
            s.max(0.0).sqrt()
        };
        let downrange_m = 1e3 * self.range_sens_km_per_deg * sg;
        let crossrange_m = across(0).hypot(across(3) * self.flight_time_s);
        let label = EvidenceLabel::modelled();
        o.budget.rows.push(BudgetRow {
            source: "flight-path angle at the entry interface".to_string(),
            sigma: sg,
            unit: "deg".to_string(),
            label: label.clone(),
        });
        o.budget.rows.push(BudgetRow {
            source: format!(
                "landing footprint downrange ({} km per degree of flight-path angle, stated)",
                self.range_sens_km_per_deg
            ),
            sigma: downrange_m,
            unit: "m".to_string(),
            label: label.clone(),
        });
        o.budget.rows.push(BudgetRow {
            source: format!(
                "landing footprint crossrange (interface position and velocity across the orbit plane, {:.0} s flight, stated)",
                self.flight_time_s
            ),
            sigma: crossrange_m,
            unit: "m".to_string(),
            label,
        });
        if prob < 0.99 {
            o.budget.limiting_source = Some("entry-interface flight-path angle".to_string());
        }
        Ok(o)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::phase::{Frame, NavSource, Timescale};

    /// A return state 50 000 km out, falling towards the Earth, then coasted to the interface.
    fn entry_state() -> NavState {
        // Perigee radius from the interface altitude and a 6 deg descent at 11 km/s: start the
        // coast close to the interface so the test runs quickly.
        let r = 6_378_137.0 + 121_920.0 + 2.0e6;
        let g = 6.0f64.to_radians();
        let v = 10_900.0;
        let x = [r, 0.0, 0.0, -v * g.sin(), v * g.cos(), 0.0];
        NavState::diagonal(0.0, Frame::Gcrf, x, 500.0, 0.2, Timescale::Utc, 1e-7, 1e-12)
    }

    fn model(extra: &str) -> toml::Table {
        toml::from_str(&format!(
            "step_s = 60.0\nclock_q_f = 1e-22\nclock_q_d = 1e-30\n\
             interface_alt_m = 121920.0\nballistic_coeff_kg_m2 = 350.0\n\
             corridor_min_deg = 5.0\ncorridor_max_deg = 7.0\n\
             downrange_sensitivity_km_per_deg = 400.0\nflight_time_s = 900.0\n{extra}"
        ))
        .unwrap()
    }

    fn run(extra: &str, dur: f64) -> PhaseOutcome {
        let phase = ctor(&model(extra)).unwrap();
        let ctx = ThreadCtx::new("2028-03-01T00:00:00Z", 9);
        let mut pctx = ctx.phase_ctx(0, "entry", dur);
        pctx.nav = vec![NavSource::Inertial];
        phase.run(&entry_state(), &ctx, &pctx).unwrap()
    }

    #[test]
    fn the_flight_path_angle_and_its_sigma_follow_the_velocity_error_over_the_speed() {
        // A pure perpendicular velocity error of 1 m/s at 11 km/s is 0.0052 deg.
        let x = [7.0e6, 0.0, 0.0, 0.0, 11_000.0, 0.0];
        let mut p = [[0.0; 6]; 6];
        p[3][3] = 1.0;
        let s = gamma_sigma_deg(&x, &p);
        assert!((s - (1.0f64 / 11_000.0).to_degrees()).abs() < 1e-6, "{s}");
        assert!(gamma_deg(&x).abs() < 1e-12);
        // A position error along the track turns the local horizontal: 1 km at 7000 km is 1/7000 rad.
        let mut q = [[0.0; 6]; 6];
        q[1][1] = 1.0e6;
        let want = (1.0e3f64 / 7.0e6).to_degrees();
        assert!((gamma_sigma_deg(&x, &q) - want).abs() < 1e-4 * want);
    }

    #[test]
    fn the_corridor_probability_is_the_gaussian_mass_inside() {
        assert!((prob_between(6.0, 0.5, 5.0, 7.0) - 0.9545).abs() < 1e-3);
        // The mean on the lower edge and the upper edge four sigma away: half the mass.
        assert!((prob_between(5.0, 0.5, 5.0, 7.0) - 0.5).abs() < 1e-4);
        assert_eq!(prob_between(8.0, 0.0, 5.0, 7.0), 0.0);
        assert_eq!(prob_between(6.0, 0.0, 5.0, 7.0), 1.0);
    }

    #[test]
    fn the_phase_reports_the_interface_the_corridor_the_peaks_and_the_footprint() {
        let o = run("", 600.0);
        let ev = |s: &str| o.events.iter().any(|e| e.what.contains(s));
        assert!(ev("entry interface at 122 km"));
        assert!(ev("corridor 5.00 to 7.00 deg"));
        assert!(ev("peak deceleration, planar ballistic point mass"));
        let rows = &o.budget.rows;
        let fp = rows
            .iter()
            .find(|r| r.source.starts_with("flight-path angle"))
            .unwrap();
        let dr = rows
            .iter()
            .find(|r| r.source.contains("downrange"))
            .unwrap();
        // Downrange is the stated sensitivity times the angle sigma.
        assert!((dr.sigma - 400.0e3 * fp.sigma).abs() < 1e-6 * dr.sigma.max(1.0));
        assert!(rows.iter().any(|r| r.source.contains("crossrange")));
        assert_eq!(fp.unit, "deg");
        // The coast has no burn row.
        assert!(!rows.iter().any(|r| r.source.starts_with("TLI burn")));
        assert_eq!(o.budget.kind, "entry");
    }

    #[test]
    fn the_steep_edge_peaks_higher_and_a_limit_below_it_is_flagged() {
        let o = run("max_decel_g = 1.0\n", 600.0);
        assert!(o
            .events
            .iter()
            .any(|e| e.what.contains("above the stated limit of 1.0 g")));
        let text = o
            .events
            .iter()
            .find(|e| e.what.starts_with("peak deceleration"))
            .unwrap()
            .what
            .clone();
        let num = |tag: &str| -> f64 {
            let i = text.find(tag).unwrap();
            text[..i].rsplit(' ').next().unwrap().parse().unwrap()
        };
        assert!(num(" g at the steep edge") > num(" g at the shallow edge"));
    }

    #[test]
    fn bad_corridors_unknown_keys_and_burn_keys_are_refused() {
        let bad = |extra: &str| ctor(&model(extra)).err().unwrap();
        assert!(bad("surprise = 1\n").contains("unknown model key"));
        assert!(bad("tli_dv_mps = 100.0\n").contains("unknown model key"));
        let mut t = model("");
        t.insert("corridor_max_deg".into(), toml::Value::Float(4.0));
        assert!(ctor(&t).err().unwrap().contains("corridor must run"));
        let mut u = model("");
        u.remove("ballistic_coeff_kg_m2");
        assert!(ctor(&u)
            .err()
            .unwrap()
            .contains("needs `ballistic_coeff_kg_m2`"));
    }

    #[test]
    fn a_stated_start_state_replaces_the_nominal_but_not_the_covariance() {
        let plain = run("", 600.0);
        let mut t = model("");
        t.insert(
            "start_state_gcrf".into(),
            toml::Value::Array(
                [7.0e6, 0.0, 0.0, 0.0, 7546.0, 0.0]
                    .iter()
                    .map(|v| toml::Value::Float(*v))
                    .collect(),
            ),
        );
        let phase = ctor(&t).unwrap();
        let ctx = ThreadCtx::new("2028-03-01T00:00:00Z", 9);
        let mut pctx = ctx.phase_ctx(0, "entry", 600.0);
        pctx.nav = vec![NavSource::Inertial];
        let stated = phase.run(&entry_state(), &ctx, &pctx).unwrap();
        assert_ne!(stated.exit.x, plain.exit.x);
        assert_eq!(
            stated.budget.entry_sigma_pos_m,
            plain.budget.entry_sigma_pos_m
        );
    }
}
