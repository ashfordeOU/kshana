// SPDX-License-Identifier: AGPL-3.0-only
//! Inter-satellite range / range-rate observables and their planar measurement
//! Jacobians — the per-link measurement model for cislunar observability analysis.
//!
//! Two spacecraft in the planar circular restricted three-body problem carry the
//! reduced planar state `s = [x, y, ẋ, ẏ]` (rotating-frame position and velocity, in
//! the normalised Earth–Moon units of [`crate::cr3bp`]). A one-way inter-satellite
//! link measures the scalar **range** `ρ = |r_a − r_b|` and, with a Doppler tone, the
//! **range rate** `ρ̇ = û·(v_a − v_b)` (`û` the line-of-sight unit vector). This module
//! returns each observable together with the row of the measurement Jacobian
//! `∂h/∂s_a` with respect to the *self* spacecraft's four-state.
//!
//! The two rows encode the observability lever this analysis turns on:
//!
//! * a **range** row has the LOS unit vector in the two position columns and **zeros in
//!   the two velocity columns** — a single range snapshot sees position along one LOS
//!   and nothing of velocity;
//! * a **range-rate** row has **non-zero velocity columns** (`∂ρ̇/∂v_a = û`) — Doppler
//!   makes velocity instantaneously visible.
//!
//! ## Validated vs Modelled
//! Both Jacobian rows are the exact analytic partials of the geometry, and each is
//! **Validated** against an independent central finite-difference of its own observable
//! (to ~1e-6) and, for the range-rate row, against the crate's own
//! finite-difference-validated 3-D [`crate::deepspace_od::range_rate_observable`] in the
//! `z = 0` planar embedding. The geometry itself (which spacecraft, which links) is a
//! Modelled scenario input, not a measurement.

/// A planar CR3BP state `[x, y, ẋ, ẏ]` in the rotating frame (normalised units).
pub type PlanarState = [f64; 4];

/// Inter-satellite **range** `ρ = |r_a − r_b|` (normalised distance units) between two
/// planar states (position components only).
pub fn intersat_range(a: &PlanarState, b: &PlanarState) -> f64 {
    let dx = a[0] - b[0];
    let dy = a[1] - b[1];
    (dx * dx + dy * dy).sqrt()
}

/// Inter-satellite **range rate** `ρ̇ = û·(v_a − v_b)` (normalised velocity units): the
/// line-of-sight closing rate of the two planar states.
pub fn intersat_range_rate(a: &PlanarState, b: &PlanarState) -> f64 {
    let dx = a[0] - b[0];
    let dy = a[1] - b[1];
    let rho = (dx * dx + dy * dy).sqrt();
    if rho <= 0.0 {
        return 0.0;
    }
    let (ux, uy) = (dx / rho, dy / rho);
    let (dvx, dvy) = (a[2] - b[2], a[3] - b[3]);
    ux * dvx + uy * dvy
}

/// The **range** observable and its four-state Jacobian **row** `∂ρ/∂s_a`.
///
/// Returns `(ρ, [û_x, û_y, 0, 0])`: the LOS unit vector `û = (r_a − r_b)/ρ` occupies the
/// two position columns and the two velocity columns are exactly zero — a range snapshot
/// is instantaneously blind to velocity. For a coincident pair (`ρ = 0`, LOS undefined)
/// the row is all-zero.
pub fn range_row(a: &PlanarState, b: &PlanarState) -> (f64, PlanarState) {
    let dx = a[0] - b[0];
    let dy = a[1] - b[1];
    let rho = (dx * dx + dy * dy).sqrt();
    if rho <= 0.0 {
        return (0.0, [0.0; 4]);
    }
    let (ux, uy) = (dx / rho, dy / rho);
    (rho, [ux, uy, 0.0, 0.0])
}

/// The **range-rate** observable and its four-state Jacobian **row** `∂ρ̇/∂s_a`.
///
/// With `û = (r_a − r_b)/ρ` and `v_rel = v_a − v_b`:
/// * `∂ρ̇/∂r_a = (v_rel − ρ̇·û)/ρ` (the transverse component of the relative velocity —
///   rotating the LOS reprojects `v_rel`), the two **position** columns;
/// * `∂ρ̇/∂v_a = û`, the two **non-zero velocity** columns.
///
/// Returns `(ρ̇, [∂ρ̇/∂x, ∂ρ̇/∂y, û_x, û_y])`. For a coincident pair the row is all-zero.
pub fn range_rate_row(a: &PlanarState, b: &PlanarState) -> (f64, PlanarState) {
    let dx = a[0] - b[0];
    let dy = a[1] - b[1];
    let rho = (dx * dx + dy * dy).sqrt();
    if rho <= 0.0 {
        return (0.0, [0.0; 4]);
    }
    let (ux, uy) = (dx / rho, dy / rho);
    let (dvx, dvy) = (a[2] - b[2], a[3] - b[3]);
    let rho_dot = ux * dvx + uy * dvy;
    (
        rho_dot,
        [
            (dvx - rho_dot * ux) / rho,
            (dvy - rho_dot * uy) / rho,
            ux,
            uy,
        ],
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    // A representative, non-degenerate planar pair near the Moon.
    fn pair() -> (PlanarState, PlanarState) {
        ([1.10, 0.04, 0.12, -0.48], [1.02, -0.03, -0.07, -0.55])
    }

    /// ORACLE (Validated): the analytic range row equals a central finite-difference of
    /// the range function with respect to each self-state component to ~1e-6.
    #[test]
    fn range_row_matches_central_finite_difference() {
        let (a, b) = pair();
        let (_rho, row) = range_row(&a, &b);
        let eps = 1e-6;
        for j in 0..4 {
            let mut ap = a;
            let mut am = a;
            ap[j] += eps;
            am[j] -= eps;
            let fd = (intersat_range(&ap, &b) - intersat_range(&am, &b)) / (2.0 * eps);
            assert!(
                (row[j] - fd).abs() < 1e-6,
                "range row[{j}] = {} vs finite-diff {fd}",
                row[j]
            );
        }
        // The velocity columns are structurally zero (a range snapshot sees no velocity).
        assert_eq!(row[2], 0.0);
        assert_eq!(row[3], 0.0);
    }

    /// ORACLE (Validated): the analytic range-rate row equals a central finite-difference
    /// of the range-rate function to ~1e-6 — and its velocity columns are non-zero.
    #[test]
    fn range_rate_row_matches_central_finite_difference() {
        let (a, b) = pair();
        let (_rd, row) = range_rate_row(&a, &b);
        let eps = 1e-6;
        for j in 0..4 {
            let mut ap = a;
            let mut am = a;
            ap[j] += eps;
            am[j] -= eps;
            let fd = (intersat_range_rate(&ap, &b) - intersat_range_rate(&am, &b)) / (2.0 * eps);
            assert!(
                (row[j] - fd).abs() < 1e-6,
                "range-rate row[{j}] = {} vs finite-diff {fd}",
                row[j]
            );
        }
        // Doppler makes velocity instantaneously observable: the velocity columns are the
        // LOS unit vector, hence non-zero for a non-degenerate pair.
        assert!(row[2].hypot(row[3]) > 0.5);
    }

    /// ORACLE (Validated): the planar range-rate row agrees with the crate's own
    /// finite-difference-validated 3-D range-rate partials in the `z = 0` embedding,
    /// tying this module to [`crate::deepspace_od::range_rate_observable`].
    #[test]
    fn range_rate_row_matches_deepspace_od_in_planar_embedding() {
        let (a, b) = pair();
        let (rd, row) = range_rate_row(&a, &b);
        // Embed a as the "spacecraft" and b as the "station" (with its own velocity) in
        // the z = 0 plane; the 3-D observable's x/y position and ẋ/ẏ velocity partials
        // must equal the planar row exactly.
        let r_sc = [a[0], a[1], 0.0];
        let v_sc = [a[2], a[3], 0.0];
        let sta = [b[0], b[1], 0.0];
        let sv = [b[2], b[3], 0.0];
        let (rd3, h9) = crate::deepspace_od::range_rate_observable(r_sc, v_sc, sta, sv);
        assert!((rd - rd3).abs() < 1e-12, "range-rate {rd} vs 3-D {rd3}");
        assert!((row[0] - h9[0]).abs() < 1e-12);
        assert!((row[1] - h9[1]).abs() < 1e-12);
        assert!((row[2] - h9[3]).abs() < 1e-12);
        assert!((row[3] - h9[4]).abs() < 1e-12);
    }

    #[test]
    fn coincident_pair_is_degenerate() {
        let a = [1.0, 0.0, 0.1, 0.2];
        let (rho, row) = range_row(&a, &a);
        assert_eq!(rho, 0.0);
        assert_eq!(row, [0.0; 4]);
        let (rd, rr) = range_rate_row(&a, &a);
        assert_eq!(rd, 0.0);
        assert_eq!(rr, [0.0; 4]);
    }
}
