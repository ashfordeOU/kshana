// SPDX-License-Identifier: AGPL-3.0-only
//! Handover rules: how the carried state is passed from one phase to the next.
//!
//! A handover never resets a covariance. `Carry` passes it on unchanged. `Inflate` adds the
//! covariance of white acceleration noise over a stated gap on a straight-line (constant
//! velocity) model, and says so in the budget. `Reacquire` dead-reckons for a stated time first,
//! and then lets the acquired source set an axis only where the source's floor is smaller than
//! the dead-reckoned sigma; the result on an axis is never below that floor when the source sets
//! it.
//!
//! The straight-line model is for short gaps; a phase with real dynamics propagates its own
//! covariance and uses `Carry`.

// Dense 6x6 kernels index several arrays by one loop variable, as the crate's other matrix code does.
#![allow(clippy::needless_range_loop)]

use super::budget::BudgetRow;
use super::phase::{HandoverRule, NavState, N};

/// The constant-velocity transition over `dt` and the covariance of white acceleration noise of
/// power spectral density `q` over `dt`, applied to `p`: `Phi P Phi^T + Q`.
fn inflate_cov(p: &[[f64; N]; N], q: f64, dt: f64) -> [[f64; N]; N] {
    // Phi = [[I, dt I], [0, I]] acting on each axis pair (i, i + 3).
    let mut out = [[0.0; N]; N];
    let mut phi = [[0.0; N]; N];
    for i in 0..N {
        phi[i][i] = 1.0;
    }
    for i in 0..3 {
        phi[i][i + 3] = dt;
    }
    let mut tmp = [[0.0; N]; N];
    for i in 0..N {
        for j in 0..N {
            for k in 0..N {
                tmp[i][j] += phi[i][k] * p[k][j];
            }
        }
    }
    for i in 0..N {
        for j in 0..N {
            for k in 0..N {
                out[i][j] += tmp[i][k] * phi[j][k];
            }
        }
    }
    for i in 0..3 {
        out[i][i] += q * dt.powi(3) / 3.0;
        out[i][i + 3] += q * dt.powi(2) / 2.0;
        out[i + 3][i] += q * dt.powi(2) / 2.0;
        out[i + 3][i + 3] += q * dt;
    }
    out
}

fn check_nonneg(name: &str, v: f64) -> Result<(), String> {
    if v.is_finite() && v >= 0.0 {
        Ok(())
    } else {
        Err(crate::terr!(
            "e-mission-thread-handover-handover-must-be-finite-number",
            name = name,
            v = crate::i18n::num_plain(v)
        ))
    }
}

/// Applies a handover rule to the state a phase exited with, returning the state the next phase
/// enters with and the budget lines the handover adds. The clock bias covariance grows by the
/// drift covariance over the gap on the same straight-line model.
pub fn apply_handover(
    rule: &HandoverRule,
    exit: &NavState,
) -> Result<(NavState, Vec<BudgetRow>), String> {
    match *rule {
        HandoverRule::Carry => Ok((exit.clone(), Vec::new())),
        HandoverRule::Inflate { q_acc, gap_s } => {
            check_nonneg("q_acc", q_acc)?;
            check_nonneg("gap_s", gap_s)?;
            let mut s = exit.clone();
            advance(&mut s, q_acc, gap_s);
            let rows = vec![
                BudgetRow {
                    source: format!(
                        "handover: inflate, white acceleration noise {q_acc:e} (m/s^2)^2/Hz over {gap_s} s"
                    ),
                    sigma: s.sigma_pos_m(),
                    unit: "m".into(),
                    label: super::phase::EvidenceLabel::modelled(),
                },
                BudgetRow {
                    source: "handover: inflate, time".into(),
                    sigma: s.sigma_time_s(),
                    unit: "s".into(),
                    label: super::phase::EvidenceLabel::modelled(),
                },
            ];
            Ok((s, rows))
        }
        HandoverRule::Reacquire {
            acquire_s,
            q_acc,
            floor_pos_m,
            floor_vel_mps,
            floor_time_s,
        } => {
            check_nonneg("acquire_s", acquire_s)?;
            check_nonneg("q_acc", q_acc)?;
            check_nonneg("floor_pos_m", floor_pos_m)?;
            check_nonneg("floor_vel_mps", floor_vel_mps)?;
            check_nonneg("floor_time_s", floor_time_s)?;
            let mut s = exit.clone();
            advance(&mut s, q_acc, acquire_s);
            // The acquired source sets an axis to its floor only where the dead-reckoned sigma
            // is larger; correlations of a set axis are dropped.
            for i in 0..N {
                let floor = if i < 3 { floor_pos_m } else { floor_vel_mps };
                let sigma = s.p[i][i].max(0.0).sqrt();
                if sigma > floor {
                    for j in 0..N {
                        s.p[i][j] = 0.0;
                        s.p[j][i] = 0.0;
                    }
                    s.p[i][i] = floor * floor;
                }
            }
            let tfloor = floor_time_s * floor_time_s;
            if s.clock.cov[0][0] > tfloor {
                s.clock.cov[0][0] = tfloor;
                s.clock.cov[0][1] = 0.0;
                s.clock.cov[1][0] = 0.0;
            }
            let rows = vec![
                BudgetRow {
                    source: format!(
                        "handover: reacquire after {acquire_s} s dead reckoning, floor {floor_pos_m} m"
                    ),
                    sigma: s.sigma_pos_m(),
                    unit: "m".into(),
                    label: super::phase::EvidenceLabel::modelled(),
                },
                BudgetRow {
                    source: format!("handover: reacquire, floor {floor_time_s} s"),
                    sigma: s.sigma_time_s(),
                    unit: "s".into(),
                    label: super::phase::EvidenceLabel::modelled(),
                },
            ];
            Ok((s, rows))
        }
    }
}

/// Advances a state by `dt` on the straight-line model and adds the acceleration noise `q`; the
/// clock bias grows by drift times `dt` and its covariance by the same transition.
fn advance(s: &mut NavState, q: f64, dt: f64) {
    s.p = inflate_cov(&s.p, q, dt);
    for i in 0..3 {
        s.x[i] += s.x[i + 3] * dt;
    }
    s.t_s += dt;
    // Clock: bias' = bias + drift dt; cov' = Phi C Phi^T with Phi = [[1, dt], [0, 1]].
    let c = s.clock.cov;
    s.clock.bias_s += s.clock.drift_s_per_s * dt;
    s.clock.cov[0][0] = c[0][0] + 2.0 * dt * c[0][1] + dt * dt * c[1][1];
    s.clock.cov[0][1] = c[0][1] + dt * c[1][1];
    s.clock.cov[1][0] = s.clock.cov[0][1];
    s.clock.cov[1][1] = c[1][1];
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::phase::{Frame, Timescale};

    fn state() -> NavState {
        NavState::diagonal(
            100.0,
            Frame::Gcrf,
            [7.0e6, 0.0, 0.0, 0.0, 7.5e3, 0.0],
            10.0,
            0.1,
            Timescale::Utc,
            1e-7,
            1e-12,
        )
    }

    #[test]
    fn carry_changes_nothing() {
        let s = state();
        let (n, rows) = apply_handover(&HandoverRule::Carry, &s).unwrap();
        assert_eq!(n, s);
        assert!(rows.is_empty());
    }

    #[test]
    fn inflate_never_shrinks_a_sigma_and_matches_the_hand_calculation() {
        let s = state();
        let (n, rows) = apply_handover(
            &HandoverRule::Inflate {
                q_acc: 1e-6,
                gap_s: 60.0,
            },
            &s,
        )
        .unwrap();
        assert!(n.sigma_pos_m() > s.sigma_pos_m());
        assert!(n.sigma_vel_mps() > s.sigma_vel_mps());
        assert!(n.sigma_time_s() > s.sigma_time_s());
        // One axis: var_x = 10^2 + 60^2 * 0.1^2 + q 60^3/3.
        let want = 100.0 + 3600.0 * 0.01 + 1e-6 * 216000.0 / 3.0;
        assert!((n.p[0][0] - want).abs() < 1e-9, "{} vs {want}", n.p[0][0]);
        assert_eq!(n.t_s, 160.0);
        assert_eq!(rows.len(), 2);
        assert!(rows[0].source.contains("white acceleration noise"));
        assert!(rows[0].source.contains("60"));
    }

    #[test]
    fn reacquire_sets_an_axis_to_the_floor_only_where_the_floor_is_smaller() {
        let mut s = state();
        s.p[0][0] = 400.0 * 400.0; // 400 m: a floor of 5 m improves it
        s.p[1][1] = 2.0 * 2.0; // 2 m: a floor of 5 m must not worsen it
        let (n, _) = apply_handover(
            &HandoverRule::Reacquire {
                acquire_s: 0.0,
                q_acc: 0.0,
                floor_pos_m: 5.0,
                floor_vel_mps: 1.0,
                floor_time_s: 1e-6,
            },
            &s,
        )
        .unwrap();
        assert!((n.p[0][0] - 25.0).abs() < 1e-12);
        assert!((n.p[1][1] - 4.0).abs() < 1e-12);
        // Never below the floor where the source set it, and never above what it was.
        for i in 0..3 {
            let sg = n.p[i][i].sqrt();
            assert!(sg <= s.p[i][i].sqrt() + 1e-12);
        }
        // The clock sigma 1e-7 s is already below the 1e-6 s floor and stays.
        assert!((n.sigma_time_s() - 1e-7).abs() < 1e-18);
    }

    #[test]
    fn reacquire_dead_reckons_before_it_acquires() {
        let s = state();
        let (n, _) = apply_handover(
            &HandoverRule::Reacquire {
                acquire_s: 120.0,
                q_acc: 1e-4,
                floor_pos_m: 1000.0,
                floor_vel_mps: 10.0,
                floor_time_s: 1.0,
            },
            &s,
        )
        .unwrap();
        // The floors are larger than the dead-reckoned sigmas here, so nothing is set.
        assert!(n.sigma_pos_m() > s.sigma_pos_m());
        assert_eq!(n.t_s, 220.0);
        // The mean advances on the straight-line model: y moves by vy * 120 s.
        assert!((n.x[1] - 7.5e3 * 120.0).abs() < 1e-6);
        assert!((n.x[0] - 7.0e6).abs() < 1e-9);
    }

    #[test]
    fn a_negative_or_nan_input_is_refused() {
        let s = state();
        assert!(apply_handover(
            &HandoverRule::Inflate {
                q_acc: -1.0,
                gap_s: 1.0
            },
            &s
        )
        .is_err());
        assert!(apply_handover(
            &HandoverRule::Inflate {
                q_acc: 1.0,
                gap_s: f64::NAN
            },
            &s
        )
        .is_err());
    }
}
