// SPDX-License-Identifier: AGPL-3.0-only
//! C2 procedure step 2 (`docs/mission-thread/PREREGISTRATION-C2.md`): the impulse support of the `tli-and-cruise`
//! phase and the detector, on synthetic data only. No Horizons state is read.
//!
//! - Without impulses, a run is bit-identical to a run with an empty `impulses` list (additivity).
//! - An impulse at the phase start equals adding its Δv to the start state.
//! - An impulse inside the phase equals stopping there, adding the Δv and continuing.
//! - On a synthetic trajectory with two known mid-hour steps, the detector finds exactly those hours, and the
//!   residuals of the other hours stay far below the threshold.
//! - Malformed `impulses` tables are refused.

use kshana::mission_thread::earth::tli_cruise;
use kshana::mission_thread::impulses::{detect, HourResidual, C2_THRESHOLD_MPS};
use kshana::mission_thread::phase::{Frame, NavSource, NavState, Timescale};
use kshana::mission_thread::ThreadCtx;

const EPOCH: &str = "2022-11-16T18:00:00Z";
// A synthetic cislunar coast state (GCRF, m and m/s); not an Artemis I state.
const X0: [f64; 6] = [2.0e8, 1.5e8, 3.0e7, -600.0, 450.0, 80.0];

fn model(impulses: &str) -> toml::Table {
    toml::from_str(&format!(
        "tli_dv_mps = 0.0\ntli_dv_sigma_fraction = 0.0\ntli_pointing_sigma_rad = 0.0\n\
         step_s = 3600.0\nprocess_q_acc = 0.0\nclock_q_f = 0.0\nclock_q_d = 0.0\n{impulses}"
    ))
    .unwrap()
}

fn run(
    ctx: &ThreadCtx,
    start: [f64; 6],
    start_s: f64,
    hours: f64,
    impulses: &str,
) -> Result<[f64; 6], String> {
    let phase = tli_cruise::ctor(&model(impulses))?;
    let entry = NavState::diagonal(
        start_s,
        Frame::Gcrf,
        start,
        1.0,
        1.0e-3,
        Timescale::Utc,
        1.0e-7,
        1.0e-12,
    );
    let mut pctx = ctx.phase_ctx(0, "c2", hours * 3600.0);
    pctx.nav = vec![NavSource::Inertial];
    Ok(phase.run(&entry, ctx, &pctx)?.exit.x)
}

fn dist(a: [f64; 6], b: [f64; 6], from: usize) -> f64 {
    (from..from + 3)
        .map(|i| (a[i] - b[i]).powi(2))
        .sum::<f64>()
        .sqrt()
}

#[test]
fn without_impulses_the_run_is_unchanged() {
    let ctx = ThreadCtx::new(EPOCH, 1);
    let a = run(&ctx, X0, 0.0, 6.0, "").unwrap();
    let b = run(&ctx, X0, 0.0, 6.0, "impulses = []\n").unwrap();
    for i in 0..6 {
        assert_eq!(a[i].to_bits(), b[i].to_bits());
    }
}

#[test]
fn an_impulse_at_the_start_is_a_change_of_start_velocity() {
    let ctx = ThreadCtx::new(EPOCH, 1);
    let dv = [0.1, -0.05, 0.02];
    let a = run(
        &ctx,
        X0,
        0.0,
        6.0,
        "[[impulses]]\nt_s = 0.0\ndv_mps = [0.1, -0.05, 0.02]\n",
    )
    .unwrap();
    let mut x = X0;
    for k in 0..3 {
        x[3 + k] += dv[k];
    }
    let b = run(&ctx, x, 0.0, 6.0, "").unwrap();
    for i in 0..6 {
        assert_eq!(a[i].to_bits(), b[i].to_bits(), "component {i}");
    }
}

#[test]
fn an_impulse_inside_the_phase_equals_stopping_adding_and_continuing() {
    let ctx = ThreadCtx::new(EPOCH, 1);
    // At 2.5 h: off the 1 h step grid, so the step is shortened to land on it.
    let a = run(
        &ctx,
        X0,
        0.0,
        6.0,
        "[[impulses]]\nt_s = 9000.0\ndv_mps = [0.0, 0.2, 0.0]\n",
    )
    .unwrap();
    let mid = run(&ctx, X0, 0.0, 2.5, "").unwrap();
    let mut x = mid;
    x[4] += 0.2;
    let b = run(&ctx, x, 9000.0, 3.5, "").unwrap();
    assert!(dist(a, b, 0) < 1e-3, "{} m", dist(a, b, 0));
    assert!(dist(a, b, 3) < 1e-9, "{} m/s", dist(a, b, 3));
    // And the impulse moved the end state by about 0.2 m/s x 3.5 h.
    let none = run(&ctx, X0, 0.0, 6.0, "").unwrap();
    let shift = dist(a, none, 0);
    assert!(
        (shift - 0.2 * 3.5 * 3600.0).abs() < 0.1 * 2520.0,
        "{shift} m"
    );
}

#[test]
fn the_detector_finds_known_mid_hour_steps_on_a_synthetic_trajectory() {
    let ctx = ThreadCtx::new(EPOCH, 1);
    // Truth: steps of 0.12 and 0.09 m/s at the midpoints of hours 3 and 7 (each run lists the steps it reaches).
    let truth = |h: f64| {
        let mut t = String::new();
        if h * 3600.0 >= 12_600.0 {
            t += "[[impulses]]\nt_s = 12600.0\ndv_mps = [0.12, 0.0, 0.0]\n";
        }
        if h * 3600.0 >= 27_000.0 {
            t += "[[impulses]]\nt_s = 27000.0\ndv_mps = [0.0, 0.0, -0.09]\n";
        }
        t
    };
    let hours = 10;
    let mut tab = vec![X0];
    for h in 1..=hours {
        tab.push(run(&ctx, X0, 0.0, f64::from(h), &truth(f64::from(h))).unwrap());
    }
    let mut res = Vec::new();
    for h in 0..hours as usize {
        let p = run(&ctx, tab[h], 3600.0 * h as f64, 1.0, "").unwrap();
        res.push(HourResidual {
            start_s: 3600.0 * h as f64,
            length_s: 3600.0,
            dv_mps: [
                tab[h + 1][3] - p[3],
                tab[h + 1][4] - p[4],
                tab[h + 1][5] - p[5],
            ],
        });
    }
    let d = detect(&res, C2_THRESHOLD_MPS);
    assert_eq!(d.event_hours_s, vec![3.0 * 3600.0, 7.0 * 3600.0]);
    assert_eq!(d.impulses[0].0, 12_600.0);
    assert!(
        (d.impulses[0].1[0] - 0.12).abs() < 1e-3,
        "{:?}",
        d.impulses[0]
    );
    assert!(
        (d.impulses[1].1[2] + 0.09).abs() < 1e-3,
        "{:?}",
        d.impulses[1]
    );
    let quiet = res
        .iter()
        .filter(|r| !d.event_hours_s.contains(&r.start_s))
        .map(|r| r.dv_mps.iter().map(|x| x * x).sum::<f64>().sqrt())
        .fold(0.0f64, f64::max);
    assert!(quiet < 1e-6, "{quiet}");
}

#[test]
fn malformed_impulses_are_refused() {
    let ctx = ThreadCtx::new(EPOCH, 1);
    for bad in [
        "impulses = 3\n",
        "impulses = [1.0]\n",
        "[[impulses]]\nt_s = 0.0\ndv_mps = [0.0, 0.0, 0.0]\nextra = 1\n",
        "[[impulses]]\nt_s = -1.0\ndv_mps = [0.0, 0.0, 0.0]\n",
        "[[impulses]]\nt_s = 0.0\ndv_mps = [0.0, 0.0]\n",
    ] {
        assert!(tli_cruise::ctor(&model(bad)).is_err(), "{bad}");
    }
    // After the end of the phase: refused at run time.
    assert!(run(
        &ctx,
        X0,
        0.0,
        2.0,
        "[[impulses]]\nt_s = 9000.0\ndv_mps = [0.0, 0.0, 0.0]\n"
    )
    .is_err());
}
