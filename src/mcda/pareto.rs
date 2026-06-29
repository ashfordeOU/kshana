// SPDX-License-Identifier: AGPL-3.0-only
//! **General Pareto (non-dominated) analysis over N objectives.**
//!
//! Where [`crate::walker::pareto_front`] is hard-wired to the four Walker-design
//! objectives, this is the domain-agnostic version: a list of points in objective
//! space, a per-objective [`Objective`] (independently minimised or maximised), and
//! the standard Pareto dominance relation. Point `a` *dominates* `b` when it is no
//! worse on every objective and strictly better on at least one; the non-dominated
//! set is every point no other point dominates.
//!
//! On top of the front it estimates the **knee point** — the non-dominated solution
//! offering the best "bang for the buck", where a small gain on one objective starts
//! costing a large sacrifice on another. The estimate is the maximum-distance-to-chord
//! construction of Branke et al. ("Finding Knees in Multi-objective Optimization",
//! PPSN VIII, 2004): in normalised objective space, the chord is the line joining the
//! two most widely separated front points, and the knee is the front point farthest
//! from it. (For a 2-D front this is exactly Branke's original; the diameter-chord
//! generalisation reduces to the two endpoints there.)
//!
//! Closed-form and property/known-answer tested — honestly *Modelled* (the dominance
//! relation is a definition, not an externally measured quantity).

use super::Objective;

/// `true` iff point `a` Pareto-dominates point `b` under `objectives` (one entry per
/// coordinate). Panics in debug if the lengths disagree; in release a length
/// mismatch simply compares the common prefix.
pub fn dominates(a: &[f64], b: &[f64], objectives: &[Objective]) -> bool {
    debug_assert!(a.len() == b.len() && a.len() == objectives.len());
    let mut strictly_better_somewhere = false;
    for ((&ai, &bi), &obj) in a.iter().zip(b.iter()).zip(objectives.iter()) {
        // Re-express as "smaller is better" so one comparison covers both senses.
        let (xa, xb) = (obj.min_sign() * ai, obj.min_sign() * bi);
        if xa > xb {
            return false; // a is worse on this objective -> cannot dominate
        }
        if xa < xb {
            strictly_better_somewhere = true;
        }
    }
    strictly_better_somewhere
}

/// Indices of the non-dominated (Pareto-optimal) `points` under `objectives`,
/// returned in ascending index order.
pub fn pareto_front(points: &[Vec<f64>], objectives: &[Objective]) -> Vec<usize> {
    (0..points.len())
        .filter(|&i| {
            !(0..points.len())
                .any(|j| j != i && dominates(&points[j], &points[i], objectives))
        })
        .collect()
}

/// A knee-point estimate on a Pareto front.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct KneePoint {
    /// Index into the *original* `points` slice of the knee solution.
    pub index: usize,
    /// Its normalised distance to the chord (0 for a degenerate front of ≤ 2 points).
    pub distance: f64,
    /// The indices (into `points`) of the two chord anchors (the front diameter).
    pub anchors: (usize, usize),
}

/// Estimate the knee point of the Pareto front of `points` (computed internally).
/// Returns `None` only when there are no points. For a 1- or 2-point front the knee
/// is ill-defined (no interior trade-off); the most-extreme point is returned with
/// `distance = 0`.
pub fn knee_point(points: &[Vec<f64>], objectives: &[Objective]) -> Option<KneePoint> {
    let front = pareto_front(points, objectives);
    knee_of_front(points, objectives, &front)
}

/// Knee point restricted to an already-computed `front` (indices into `points`).
pub fn knee_of_front(
    points: &[Vec<f64>],
    objectives: &[Objective],
    front: &[usize],
) -> Option<KneePoint> {
    if front.is_empty() {
        return None;
    }
    if front.len() == 1 {
        return Some(KneePoint {
            index: front[0],
            distance: 0.0,
            anchors: (front[0], front[0]),
        });
    }
    let m = objectives.len();

    // Normalise each objective to [0, 1] over the front, all as "smaller is better".
    let mut lo = vec![f64::INFINITY; m];
    let mut hi = vec![f64::NEG_INFINITY; m];
    for &idx in front {
        for k in 0..m {
            let x = objectives[k].min_sign() * points[idx][k];
            lo[k] = lo[k].min(x);
            hi[k] = hi[k].max(x);
        }
    }
    let norm = |idx: usize| -> Vec<f64> {
        (0..m)
            .map(|k| {
                let range = hi[k] - lo[k];
                if range <= 0.0 {
                    0.0
                } else {
                    (objectives[k].min_sign() * points[idx][k] - lo[k]) / range
                }
            })
            .collect()
    };
    let normed: Vec<Vec<f64>> = front.iter().map(|&i| norm(i)).collect();

    // Chord anchors = the two most widely separated front points (the diameter).
    let mut anchor_a = 0usize;
    let mut anchor_b = if front.len() > 1 { 1 } else { 0 };
    let mut best_d2 = -1.0;
    for i in 0..front.len() {
        for j in (i + 1)..front.len() {
            let d2: f64 = normed[i]
                .iter()
                .zip(normed[j].iter())
                .map(|(a, b)| (a - b) * (a - b))
                .sum();
            if d2 > best_d2 {
                best_d2 = d2;
                anchor_a = i;
                anchor_b = j;
            }
        }
    }

    // Perpendicular distance of each front point to the chord line through the anchors.
    let p0 = &normed[anchor_a];
    let p1 = &normed[anchor_b];
    let dir: Vec<f64> = p1.iter().zip(p0.iter()).map(|(b, a)| b - a).collect();
    let dir_norm = dir.iter().map(|x| x * x).sum::<f64>().sqrt();

    let mut best_idx = anchor_a;
    let mut best_dist = 0.0;
    for (local, q) in normed.iter().enumerate() {
        let dist = if dir_norm <= 0.0 {
            0.0
        } else {
            // ||(q - p0) - ((q - p0)·u) u||, u = dir / |dir|
            let qp: Vec<f64> = q.iter().zip(p0.iter()).map(|(a, b)| a - b).collect();
            let dot: f64 = qp.iter().zip(dir.iter()).map(|(a, b)| a * b).sum::<f64>() / dir_norm;
            let perp2: f64 = qp
                .iter()
                .zip(dir.iter())
                .map(|(a, b)| {
                    let proj = dot * (b / dir_norm);
                    (a - proj) * (a - proj)
                })
                .sum();
            perp2.max(0.0).sqrt()
        };
        if dist > best_dist {
            best_dist = dist;
            best_idx = local;
        }
    }

    Some(KneePoint {
        index: front[best_idx],
        distance: best_dist,
        anchors: (front[anchor_a], front[anchor_b]),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::Objective::{Max, Min};

    #[test]
    fn dominance_known_answers_min_min() {
        let o = [Min, Min];
        // (2,2) dominates (4,4); neither dominates a trade-off pair.
        assert!(dominates(&[2.0, 2.0], &[4.0, 4.0], &o));
        assert!(!dominates(&[4.0, 4.0], &[2.0, 2.0], &o));
        assert!(!dominates(&[1.0, 4.0], &[4.0, 1.0], &o)); // incomparable
        assert!(!dominates(&[2.0, 2.0], &[2.0, 2.0], &o)); // equal: not strict
        // Weak: equal on one, better on the other -> dominates.
        assert!(dominates(&[2.0, 1.0], &[2.0, 2.0], &o));
    }

    #[test]
    fn dominance_respects_per_objective_direction() {
        // obj0 maximise, obj1 minimise.
        let o = [Max, Min];
        assert!(dominates(&[5.0, 1.0], &[3.0, 2.0], &o)); // higher obj0, lower obj1
        assert!(!dominates(&[3.0, 2.0], &[5.0, 1.0], &o));
    }

    #[test]
    fn pareto_front_selects_the_non_dominated_set() {
        // Min-min set: index 3 (4,4) is dominated by index 1 (2,2).
        let pts = vec![
            vec![1.0, 4.0], // 0 non-dom
            vec![2.0, 2.0], // 1 non-dom
            vec![3.0, 1.0], // 2 non-dom
            vec![4.0, 4.0], // 3 dominated by 1
            vec![2.5, 3.0], // 4 dominated by 1 (2<2.5, 2<3)
        ];
        let o = [Min, Min];
        assert_eq!(pareto_front(&pts, &o), vec![0, 1, 2]);
    }

    #[test]
    fn pareto_front_all_non_dominated_when_strictly_trading_off() {
        let pts = vec![vec![0.0, 1.0], vec![0.5, 0.5], vec![1.0, 0.0]];
        let o = [Min, Min];
        assert_eq!(pareto_front(&pts, &o), vec![0, 1, 2]);
    }

    #[test]
    fn knee_point_is_the_corner_of_a_convex_front() {
        // Convex min-min front; the elbow is point 1 = (0.1, 0.2).
        let pts = vec![
            vec![0.0, 1.0], // 0 anchor
            vec![0.1, 0.2], // 1 knee (far from the (0,1)-(1,0) chord)
            vec![0.4, 0.1], // 2
            vec![1.0, 0.0], // 3 anchor
        ];
        let o = [Min, Min];
        let k = knee_point(&pts, &o).unwrap();
        assert_eq!(k.index, 1);
        assert_eq!(k.anchors, (0, 3));
        assert!(k.distance > 0.4 && k.distance < 0.6, "dist {}", k.distance);
    }

    #[test]
    fn knee_point_is_orientation_invariant_under_maximise() {
        // Same front mirrored to a max-max problem: knee index must be unchanged.
        let pts = vec![
            vec![1.0, 0.0],
            vec![0.9, 0.8], // mirror of (0.1,0.2)
            vec![0.6, 0.9],
            vec![0.0, 1.0],
        ];
        let o = [Max, Max];
        let k = knee_point(&pts, &o).unwrap();
        assert_eq!(k.index, 1);
    }

    #[test]
    fn knee_of_degenerate_fronts() {
        let o = [Min, Min];
        assert!(knee_point(&[], &o).is_none());
        let one = knee_point(&[vec![1.0, 2.0]], &o).unwrap();
        assert_eq!(one.index, 0);
        assert_eq!(one.distance, 0.0);
    }
}
