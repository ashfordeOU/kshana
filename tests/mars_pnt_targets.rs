// SPDX-License-Identifier: AGPL-3.0-only
//! **D3.4 — reproducing the MARCONI / LightShip accuracy targets in simulation.**
//!
//! The published MARCONI / LightShip programme goals for a Mars relay-broadcast PNT service are an
//! **orbiter position accuracy better than ~100 m** and a **surface/rover position accuracy better
//! than ~15 m**. This file reproduces both numbers with the shipped `mars-pnt` engine
//! (`src/mars_pnt.rs`, run through the D3.1 joint one-way + two-way fusion estimator) under a single,
//! fully-documented set of assumptions.
//!
//! ## What these numbers ARE and are NOT
//!
//! These are **simulated navigation figures of merit reproduced under the stated assumptions**, NOT
//! a flight claim and NOT a certified protection level. The run is a synthetic closed-loop: the
//! truth trajectory and the filter share the same Mars dynamics and the same geometric observable
//! model, plus injected Gaussian measurement noise. There is no fault-detection / integrity layer,
//! no certified fault model, and no real tracking data. The result validates that the estimator
//! *machinery* — the joint orbit + clock SRIF, the one-way/two-way fusion, the MARCONI geometry —
//! recovers a user to the MARCONI-class accuracy targets when fed MARCONI-class observations.
//!
//! ## The shared, documented assumptions (both scenarios)
//!
//! * **Constellation:** the shipped default MARCONI set — three areostationary relays (≈20 428 km
//!   radius, 120° apart, 5° inclined) plus two relays in a higher (1.4× areostationary) 60°-inclined
//!   circular orbit. Five relays total, a minimal but real broadcast-plus-relay geometry that keeps
//!   one or more relays in view of a low / surface user continuously.
//! * **Links:** every in-view relay contributes a one-way (clock-coupled) range + Doppler each
//!   epoch; a two-way (coherent, clock-free, orbit-pinning) pass to the deep-space tracking station
//!   recurs on the stated cadence (the calibrate-then-coast geometry).
//! * **Observation noise:** DSN-class — **range 1σ = 1 m**, **Doppler 1σ = 0.1 mm/s** (1.0e-4 m/s),
//!   the same floor used throughout the D1/D2 deep-space validation.
//! * **Estimator:** the reduced-dynamic joint orbit + 3-state clock fusion filter, seeded from a
//!   ~2.7 km / few-m·s⁻¹-perturbed a-priori state, reduced-dynamic tightness 0.1.
//! * **FoM:** the converged (back-half-of-arc) RMS of the 3-D position error against the synthetic
//!   truth.
//!
//! Per-scenario assumptions (clock class, cadence, two-way pass schedule, arc length) are documented
//! at each test. They are all physically reasonable for a MARCONI-class relay system (see the test
//! docs for why) and are NOT loosened to make a target pass.

use kshana::mars_pnt::{run_mars_pnt, ClockClassCfg, MarconiConstellation, MarsScenario, UserKind};

/// The published MARCONI / LightShip orbiter target (m).
const ORBITER_TARGET_M: f64 = 100.0;
/// The published MARCONI / LightShip surface / rover target (m).
const ROVER_TARGET_M: f64 = 15.0;

/// **Orbiter target — < 100 m.** A Low-Mars-Orbit user (~400 km circular, 60° inclined) carries a
/// USO (ultra-stable quartz oscillator — a realistic, flight-proven orbiter clock class, less
/// capable than a deep-space atomic clock). It is tracked against the full five-relay MARCONI
/// constellation with a coherent two-way station pass every 30 min, at a 60 s observation cadence
/// over a ~2 h (≈ one-orbit) arc.
///
/// Assumptions and why they are fair for a MARCONI-class orbiter:
/// * **USO clock** — the *less* capable of the realistic onboard classes (a DSAC would only help);
///   we deliberately do not assume the best clock.
/// * **two-way pass / 30 min** — well within a routine relay-network contact schedule; an orbiter is
///   in view of the relay network often, and a half-hourly coherent pass is conservative.
/// * **60 s cadence, ~2 h arc** — a single orbit is enough for the reduced-dynamic filter to
///   converge; nothing here is unusually long or dense.
#[test]
fn orbiter_meets_the_100m_marconi_target() {
    let scn = MarsScenario {
        user: UserKind::Lmo,
        clock_class: ClockClassCfg::Uso,
        step_s: 60.0,
        duration_s: 7200.0,
        nmax: 4,
        range_sigma_m: 1.0,
        doppler_sigma_mps: 1.0e-4,
        dynamic_tightness: 0.1,
        two_way_period_s: 1800.0,
        seed: 0x4D_4152_C0DE,
    };
    let r = run_mars_pnt(&scn).expect("orbiter mars-pnt runs");

    println!(
        "[D3.4 ORBITER] LMO/USO: mean relays in view = {:.2}, converged position RMS = {:.3} m \
         (target < {:.0} m), formal 1σ = {:.3} m, epochs = {}",
        r.fom.mean_relays_in_view,
        r.fom.converged_pos_rms_m,
        ORBITER_TARGET_M,
        r.fom.converged_pos_sigma_m,
        r.fom.epochs
    );

    assert!(
        r.fom.covariance_pd_throughout,
        "[D3.4 ORBITER] factored covariance lost positive-definiteness"
    );
    assert!(
        r.fom.mean_relays_in_view >= 1.0,
        "[D3.4 ORBITER] the orbiter must see the relay network continuously (mean {:.2})",
        r.fom.mean_relays_in_view
    );
    assert!(
        r.fom.converged_pos_rms_m < ORBITER_TARGET_M,
        "[D3.4 ORBITER] converged RMS {:.3} m does NOT meet the < {:.0} m MARCONI orbiter target",
        r.fom.converged_pos_rms_m,
        ORBITER_TARGET_M
    );
}

/// **Rover / surface target — < 15 m.** A fixed surface user (equator, prime meridian, co-rotating
/// rigidly with Mars) carries a USO clock. It is tracked against the full five-relay MARCONI
/// constellation — the areostationary trio is essentially always overhead for an equatorial user,
/// and the inclined pair sweeps across to add cross-track geometry — with a coherent two-way station
/// pass every 30 min, at a tighter 30 s observation cadence (the inclined relays sweep overhead
/// quickly) over a ~2 h arc.
///
/// Assumptions and why they are fair for a MARCONI-class rover:
/// * **USO clock** — again the *less* capable realistic class, not the best.
/// * **two-way pass / 30 min** — same routine cadence as the orbiter.
/// * **30 s cadence** — a near-static surface point is observable only through the relays' overhead
///   motion, so a tighter cadence captures that geometric diversity; 30 s is routine telemetry rate.
/// * the surface user has **stronger** geometry than a generic orbiter (the areostationary relays
///   sit at high, stable elevation and the point is near-static), which is exactly why a tighter
///   sub-15 m target is reproducible.
#[test]
fn rover_meets_the_15m_marconi_target() {
    let scn = MarsScenario {
        user: UserKind::Surface,
        clock_class: ClockClassCfg::Uso,
        step_s: 30.0,
        duration_s: 7200.0,
        nmax: 4,
        range_sigma_m: 1.0,
        doppler_sigma_mps: 1.0e-4,
        dynamic_tightness: 0.1,
        two_way_period_s: 1800.0,
        seed: 0x4D_4152_C0DE,
    };
    let r = run_mars_pnt(&scn).expect("rover mars-pnt runs");

    println!(
        "[D3.4 ROVER] surface/USO: mean relays in view = {:.2}, converged position RMS = {:.3} m \
         (target < {:.0} m), formal 1σ = {:.3} m, epochs = {}",
        r.fom.mean_relays_in_view,
        r.fom.converged_pos_rms_m,
        ROVER_TARGET_M,
        r.fom.converged_pos_sigma_m,
        r.fom.epochs
    );

    assert!(
        r.fom.covariance_pd_throughout,
        "[D3.4 ROVER] factored covariance lost positive-definiteness"
    );
    assert!(
        r.fom.mean_relays_in_view >= 1.0,
        "[D3.4 ROVER] the rover must see relays sweeping overhead (mean {:.2})",
        r.fom.mean_relays_in_view
    );
    assert!(
        r.fom.converged_pos_rms_m < ROVER_TARGET_M,
        "[D3.4 ROVER] converged RMS {:.3} m does NOT meet the < {:.0} m MARCONI rover target",
        r.fom.converged_pos_rms_m,
        ROVER_TARGET_M
    );
}

/// A self-check on the documented constellation assumption: the shipped default MARCONI set is the
/// five-relay (areostationary trio + inclined pair) geometry the target reproduction assumes.
#[test]
fn target_assumptions_use_the_documented_constellation() {
    let c = MarconiConstellation::default_set(2_459_580.5);
    assert_eq!(
        c.relays.len(),
        5,
        "the documented MARCONI assumption is the five-relay default set"
    );
}
