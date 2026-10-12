// SPDX-License-Identifier: AGPL-3.0-only
//! The optional solution modes of the `lunar-station-coverage` kind (LRS-06): a height
//! constraint, a three-satellite minimum with it, and a static-user window over epochs.
//!
//! The kind's default is the snapshot least-squares solve of
//! [`crate::lunar_dpnt::position_error_vector_from_range_errors`]: four or more satellites,
//! one epoch, a position and a clock. The published simulations of a lunar reference station
//! used a filter, a height constraint and "at least 3 satellites in common view"
//! (`docs/LUNAR-REFERENCE-STATION.md`, sources S2 and S3). This module gives the kind those
//! three ingredients, each stated and each off unless asked for:
//!
//! * **Height constraint.** A surface user knows its height from a map: one pseudo-measurement
//!   row `up . dx = e_h` of 1-sigma `height_sigma_m`, weighted against range rows of 1-sigma
//!   `range_sigma_m` (weighted least squares).
//! * **Three satellites.** With the height row, three ranges and the height determine a
//!   position and a clock, so `min_satellites = 3` is allowed (and only then).
//! * **Window.** A static user's position is shared by the last `window_epochs` epochs; each
//!   epoch keeps its own clock. The estimate at an epoch is the weighted least-squares
//!   solution over the window, which is what a Kalman filter for a static position with no
//!   process noise and a white clock returns over the same data. It treats the epochs' errors
//!   as independent, which the kind's per-epoch draws are; real errors correlated in time
//!   would average down less.
//!
//! The solve returns the position error `dx = (H^T W H)^-1 H^T W e` for the stated errors `e`,
//! the quantity the kind reports. MODELLED.

use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

fn d_height_sigma() -> f64 {
    1.0
}
fn d_min_sats() -> usize {
    4
}
fn d_window() -> usize {
    1
}

/// The `[solution]` section.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct SolutionCfg {
    /// Add the height pseudo-measurement.
    #[serde(default)]
    pub height_aided: bool,
    /// 1-sigma of the known surface height (m).
    #[serde(default = "d_height_sigma")]
    pub height_sigma_m: f64,
    /// 1-sigma of a range row (m) in the weighting; default the scenario's
    /// `residual_sigma_m`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub range_sigma_m: Option<f64>,
    /// Fewest satellites in view for a solution: 4, or 3 with `height_aided`.
    #[serde(default = "d_min_sats")]
    pub min_satellites: usize,
    /// Epochs sharing the static user's position (1 = snapshot).
    #[serde(default = "d_window")]
    pub window_epochs: usize,
}

impl SolutionCfg {
    /// Check the section.
    pub fn validate(&self) -> Result<(), String> {
        if !(self.height_sigma_m.is_finite() && self.height_sigma_m > 0.0) {
            return Err("solution: height_sigma_m must be finite and positive".into());
        }
        if let Some(r) = self.range_sigma_m {
            if !(r.is_finite() && r > 0.0) {
                return Err("solution: range_sigma_m must be finite and positive".into());
            }
        }
        match (self.min_satellites, self.height_aided) {
            (4, _) | (3, true) => {}
            (3, false) => {
                return Err("solution: min_satellites = 3 needs height_aided = true".into())
            }
            (n, _) => return Err(format!("solution: min_satellites must be 3 or 4, got {n}")),
        }
        if !(1..=144).contains(&self.window_epochs) {
            return Err("solution: window_epochs must be 1 to 144".into());
        }
        Ok(())
    }
}

/// One epoch's rows: the unit lines of sight from the user to each satellite, and the range
/// error on each.
#[derive(Clone, Debug, PartialEq)]
pub struct EpochRows {
    /// Unit vectors from the user toward each satellite.
    pub los: Vec<Vec3>,
    /// Range error per satellite (m).
    pub err: Vec<f64>,
}

/// The position error (m, Moon-fixed axes) of the weighted least-squares solution over
/// `epochs` (a shared position, one clock per epoch), with an optional height row
/// `(up, error_m, sigma_m)`. Range rows are `[-los, 1 at the epoch's clock]`, weight
/// `1 / range_sigma_m^2`. `None` when the normal matrix is singular.
pub fn position_error(
    epochs: &[EpochRows],
    height: Option<(Vec3, f64, f64)>,
    range_sigma_m: f64,
) -> Option<Vec3> {
    let n = 3 + epochs.len();
    let mut a = vec![vec![0.0; n]; n];
    let mut b = vec![0.0; n];
    let wr = 1.0 / (range_sigma_m * range_sigma_m);
    for (e, ep) in epochs.iter().enumerate() {
        for (u, &err) in ep.los.iter().zip(&ep.err) {
            let mut h = vec![0.0; n];
            h[0] = -u[0];
            h[1] = -u[1];
            h[2] = -u[2];
            h[3 + e] = 1.0;
            for r in 0..n {
                if h[r] == 0.0 {
                    continue;
                }
                b[r] += wr * h[r] * err;
                for c in 0..n {
                    a[r][c] += wr * h[r] * h[c];
                }
            }
        }
    }
    if let Some((up, err, sigma)) = height {
        let w = 1.0 / (sigma * sigma);
        for r in 0..3 {
            b[r] += w * up[r] * err;
            for c in 0..3 {
                a[r][c] += w * up[r] * up[c];
            }
        }
    }
    let x = solve(a, b)?;
    Some([x[0], x[1], x[2]])
}

/// Gaussian elimination with partial pivoting; `None` for a (numerically) singular matrix.
fn solve(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    // Singularity is judged per column against its own original diagonal, so a heavily
    // weighted row (a tight height constraint) does not make the rest look singular.
    let diag: Vec<f64> = (0..n).map(|c| a[c][c].abs()).collect();
    for col in 0..n {
        let piv = (col..n).max_by(|&i, &j| a[i][col].abs().total_cmp(&a[j][col].abs()))?;
        if !(a[piv][col].abs() > 1e-12 * diag[col]) {
            return None;
        }
        a.swap(col, piv);
        b.swap(col, piv);
        for r in col + 1..n {
            let f = a[r][col] / a[col][col];
            if f == 0.0 {
                continue;
            }
            for c in col..n {
                a[r][c] -= f * a[col][c];
            }
            b[r] -= f * b[col];
        }
    }
    let mut x = vec![0.0; n];
    for r in (0..n).rev() {
        let s: f64 = (r + 1..n).map(|c| a[r][c] * x[c]).sum();
        x[r] = (b[r] - s) / a[r][r];
    }
    Some(x)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn unit(v: Vec3) -> Vec3 {
        let n = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        [v[0] / n, v[1] / n, v[2] / n]
    }

    /// A user on the z axis, satellites spread over the sky.
    fn geometry() -> (Vec3, Vec<Vec3>) {
        let user = [0.0, 0.0, 1_737_400.0];
        let sats = vec![
            [3.0e6, 0.0, 5.0e6],
            [-2.0e6, 2.5e6, 6.0e6],
            [-1.0e6, -3.0e6, 4.5e6],
            [0.5e6, 0.2e6, 9.0e6],
            [2.0e6, -2.0e6, 7.0e6],
        ];
        (user, sats)
    }

    fn rows(user: Vec3, sats: &[Vec3], err: &[f64]) -> EpochRows {
        EpochRows {
            los: sats
                .iter()
                .map(|s| unit([s[0] - user[0], s[1] - user[1], s[2] - user[2]]))
                .collect(),
            err: err.to_vec(),
        }
    }

    /// One epoch, no height row: the snapshot solve of the kind's default path.
    #[test]
    fn one_epoch_without_height_is_the_snapshot_solve() {
        let (user, sats) = geometry();
        let err = [1.0, -2.0, 0.5, 3.0, -1.5];
        let ours = position_error(&[rows(user, &sats, &err)], None, 5.0).unwrap();
        let theirs =
            crate::lunar_dpnt::position_error_vector_from_range_errors(user, &sats, &err).unwrap();
        for a in 0..3 {
            assert!((ours[a] - theirs[a]).abs() < 1e-8, "{ours:?} vs {theirs:?}");
        }
        // A very loose height row changes nothing; a tight one pins the height error.
        let up = [0.0, 0.0, 1.0];
        let loose = position_error(&[rows(user, &sats, &err)], Some((up, 0.0, 1e9)), 5.0).unwrap();
        for a in 0..3 {
            assert!((loose[a] - theirs[a]).abs() < 1e-6);
        }
        let tight =
            position_error(&[rows(user, &sats, &err)], Some((up, 0.25, 1e-6)), 5.0).unwrap();
        assert!((tight[2] - 0.25).abs() < 1e-6, "{tight:?}");
    }

    /// Three satellites: singular without the height row, solved with it.
    #[test]
    fn three_satellites_need_the_height_row() {
        let (user, sats) = geometry();
        let r = rows(user, &sats[..3], &[1.0, 2.0, -1.0]);
        assert!(position_error(&[r.clone()], None, 5.0).is_none());
        assert!(position_error(&[r], Some(([0.0, 0.0, 1.0], 0.0, 1.0)), 5.0).is_some());
    }

    /// A window of identical epochs gives the single-epoch answer; independent errors over a
    /// window average down.
    #[test]
    fn a_window_shares_the_position() {
        let (user, sats) = geometry();
        let err = [1.0, -2.0, 0.5, 3.0, -1.5];
        let one = position_error(&[rows(user, &sats, &err)], None, 5.0).unwrap();
        let r = rows(user, &sats, &err);
        let three = position_error(&[r.clone(), r.clone(), r], None, 5.0).unwrap();
        for a in 0..3 {
            assert!((one[a] - three[a]).abs() < 1e-8);
        }
        // Opposite errors at two epochs cancel in the shared position.
        let neg: Vec<f64> = err.iter().map(|e| -e).collect();
        let pair = position_error(
            &[rows(user, &sats, &err), rows(user, &sats, &neg)],
            None,
            5.0,
        )
        .unwrap();
        assert!(pair.iter().all(|v| v.abs() < 1e-8), "{pair:?}");
    }

    #[test]
    fn bad_sections_are_refused() {
        for bad in [
            "min_satellites = 3",
            "min_satellites = 5",
            "height_sigma_m = 0.0",
            "window_epochs = 0",
        ] {
            let c: SolutionCfg = toml::from_str(bad).unwrap();
            assert!(c.validate().is_err(), "{bad}");
        }
        let ok: SolutionCfg = toml::from_str("height_aided = true\nmin_satellites = 3").unwrap();
        assert!(ok.validate().is_ok());
    }
}
