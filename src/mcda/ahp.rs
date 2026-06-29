// SPDX-License-Identifier: AGPL-3.0-only
//! **Analytic Hierarchy Process (AHP).**
//!
//! Saaty's pairwise-comparison method for deriving priority weights from
//! subjective judgements. The decision-maker fills a reciprocal `n × n` matrix `A`
//! whose entry `a_ij` is "how many times more important is criterion `i` than
//! criterion `j`" (on Saaty's 1–9 scale); `a_ji = 1/a_ij` and `a_ii = 1`. The
//! priority weights are the normalised principal (Perron) eigenvector of `A`,
//! obtained here by power iteration. Because the judgements are subjective and
//! never perfectly transitive, AHP also reports a **Consistency Ratio** — the
//! matrix's principal-eigenvalue excess over `n`, scaled by Saaty's Random Index —
//! and flags the judgements as acceptable when `CR < 0.10`.
//!
//! **Oracle.** The Random Index table is reproduced exactly from Saaty's canonical
//! values (n = 1..10, RI(5) = 1.12), and the priority vector + Consistency Ratio
//! reproduce the SciPy/LAPACK principal eigensolver to < 1e-9 on worked examples
//! (a perfectly consistent geometric matrix → λ_max = n exactly, CR = 0; and
//! inconsistent 3×3 / 4×4 matrices). See `tests/mcda_ahp_reference.rs`.
//!
//! References: T. L. Saaty, *The Analytic Hierarchy Process* (McGraw-Hill, 1980);
//! T. L. Saaty, "How to make a decision: the Analytic Hierarchy Process",
//! *European Journal of Operational Research* 48 (1990) 9–26.

/// Saaty's canonical **Random Index** RI(n) — the mean Consistency Index of a large
/// sample of randomly filled reciprocal `n × n` matrices — for `n = 1..=10`. These
/// are the published 1980 values (RI(3) = 0.58, RI(4) = 0.90, RI(5) = 1.12, …);
/// `None` outside the tabulated range, where the CR is undefined for this table.
pub fn saaty_random_index(n: usize) -> Option<f64> {
    // Index 0/1 are 0.0 (a 1×1 or 2×2 matrix is always consistent).
    const RI: [f64; 11] = [
        0.0,  // n = 0 (unused)
        0.0,  // n = 1
        0.0,  // n = 2
        0.58, // n = 3
        0.90, // n = 4
        1.12, // n = 5
        1.24, // n = 6
        1.32, // n = 7
        1.41, // n = 8
        1.45, // n = 9
        1.49, // n = 10
    ];
    RI.get(n).copied()
}

/// A square, positive, reciprocal pairwise-comparison matrix.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct PairwiseMatrix {
    /// Row-major `n × n` entries; `a[i][j] · a[j][i] = 1`, `a[i][i] = 1`.
    a: Vec<Vec<f64>>,
}

/// The outcome of an AHP analysis.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct AhpResult {
    /// Normalised priority weights (sum to one), in matrix row order.
    pub priorities: Vec<f64>,
    /// Principal eigenvalue estimate `λ_max` (≥ n for a positive reciprocal matrix).
    pub lambda_max: f64,
    /// Consistency Index `CI = (λ_max − n) / (n − 1)` (0 for n ≤ 2).
    pub consistency_index: f64,
    /// Consistency Ratio `CR = CI / RI(n)`; `None` when RI(n) is 0 / untabulated.
    pub consistency_ratio: Option<f64>,
    /// `true` iff `CR < threshold` (the judgements are acceptably consistent), and
    /// always `true` for n ≤ 2 (trivially consistent).
    pub acceptable: bool,
}

/// Tuning for the power-iteration eigensolver. The defaults converge the principal
/// eigenvector of any well-formed reciprocal matrix to machine precision.
#[derive(Clone, Copy, Debug)]
pub struct PowerIterCfg {
    pub max_iters: usize,
    /// Stop when the max component change between successive normalised iterates
    /// falls below this.
    pub tol: f64,
}

impl Default for PowerIterCfg {
    fn default() -> Self {
        Self {
            max_iters: 10_000,
            tol: 1e-15,
        }
    }
}

impl PairwiseMatrix {
    /// Build from an explicit `n × n` matrix, validating that it is square,
    /// strictly positive, finite, and reciprocal to a small tolerance (`a_ij ·
    /// a_ji ≈ 1`, `a_ii = 1`).
    pub fn new(a: Vec<Vec<f64>>) -> Result<Self, String> {
        let n = a.len();
        if n == 0 {
            return Err("pairwise matrix is empty".into());
        }
        for (i, row) in a.iter().enumerate() {
            if row.len() != n {
                return Err(format!("pairwise matrix is not square (row {i} has {} of {n})", row.len()));
            }
            for (j, &v) in row.iter().enumerate() {
                if !v.is_finite() || v <= 0.0 {
                    return Err(format!("entry a[{i}][{j}] = {v} must be finite and positive"));
                }
            }
        }
        for (i, row) in a.iter().enumerate() {
            if (row[i] - 1.0).abs() > 1e-9 {
                return Err(format!("diagonal a[{i}][{i}] = {} must be 1", row[i]));
            }
            for (j, &aij) in row.iter().enumerate().skip(i + 1) {
                let prod = aij * a[j][i];
                if (prod - 1.0).abs() > 1e-6 {
                    return Err(format!(
                        "entries a[{i}][{j}]·a[{j}][{i}] = {prod} must be reciprocal (≈ 1)"
                    ));
                }
            }
        }
        Ok(Self { a })
    }

    /// Build from the strictly upper triangle, filling the diagonal with 1 and the
    /// lower triangle with reciprocals. `upper[i]` lists `a[i][i+1..n]` (length
    /// `n-1-i`). This is the natural "fill in only the judgements you make" form.
    pub fn from_upper(upper: Vec<Vec<f64>>) -> Result<Self, String> {
        let n = upper.len() + 1;
        let mut a = vec![vec![1.0; n]; n];
        for (i, row) in upper.iter().enumerate() {
            if row.len() != n - 1 - i {
                return Err(format!(
                    "upper row {i} has {} entries, expected {}",
                    row.len(),
                    n - 1 - i
                ));
            }
            for (k, &v) in row.iter().enumerate() {
                let j = i + 1 + k;
                if !v.is_finite() || v <= 0.0 {
                    return Err(format!("upper entry ({i},{j}) = {v} must be finite and positive"));
                }
                a[i][j] = v;
                a[j][i] = 1.0 / v;
            }
        }
        Self::new(a)
    }

    /// The matrix dimension `n`.
    pub fn n(&self) -> usize {
        self.a.len()
    }

    /// Borrow the raw entries.
    pub fn entries(&self) -> &[Vec<f64>] {
        &self.a
    }

    /// Normalised principal eigenvector by power iteration (sum-to-one), using the
    /// default configuration.
    pub fn priority_vector(&self) -> Vec<f64> {
        self.priority_vector_cfg(PowerIterCfg::default())
    }

    /// Normalised principal eigenvector by power iteration with explicit tuning.
    pub fn priority_vector_cfg(&self, cfg: PowerIterCfg) -> Vec<f64> {
        let n = self.n();
        // Start from the uniform distribution; for a positive matrix Perron–Frobenius
        // guarantees a unique positive dominant eigenvector that power iteration
        // converges to from any positive start.
        let mut w = vec![1.0 / n as f64; n];
        for _ in 0..cfg.max_iters {
            let nw = self.normalise(self.mat_vec(&w));
            let delta = nw
                .iter()
                .zip(w.iter())
                .map(|(a, b)| (a - b).abs())
                .fold(0.0_f64, f64::max);
            w = nw;
            if delta < cfg.tol {
                break;
            }
        }
        w
    }

    /// Principal eigenvalue `λ_max` for a given (converged, sum-to-one) priority
    /// vector, via the standard average of the per-row ratios `(A·w)_i / w_i`.
    pub fn lambda_max(&self, w: &[f64]) -> f64 {
        let aw = self.mat_vec(w);
        let n = self.n();
        let mut acc = 0.0;
        for i in 0..n {
            acc += aw[i] / w[i];
        }
        acc / n as f64
    }

    /// Full AHP analysis with the default consistency threshold (`CR < 0.10`).
    pub fn analyse(&self) -> AhpResult {
        self.analyse_with(0.10, PowerIterCfg::default())
    }

    /// Full AHP analysis with an explicit CR `threshold` and power-iteration config.
    pub fn analyse_with(&self, threshold: f64, cfg: PowerIterCfg) -> AhpResult {
        let n = self.n();
        let priorities = self.priority_vector_cfg(cfg);
        let lambda_max = self.lambda_max(&priorities);
        let consistency_index = if n > 2 {
            (lambda_max - n as f64) / (n as f64 - 1.0)
        } else {
            0.0
        };
        let ri = saaty_random_index(n).filter(|&r| r > 0.0);
        let consistency_ratio = ri.map(|r| consistency_index / r);
        let acceptable = match consistency_ratio {
            Some(cr) => cr < threshold,
            None => true, // n ≤ 2 (or untabulated): trivially / undefined-consistent
        };
        AhpResult {
            priorities,
            lambda_max,
            consistency_index,
            consistency_ratio,
            acceptable,
        }
    }

    fn mat_vec(&self, w: &[f64]) -> Vec<f64> {
        self.a
            .iter()
            .map(|row| row.iter().zip(w.iter()).map(|(a, b)| a * b).sum())
            .collect()
    }

    fn normalise(&self, v: Vec<f64>) -> Vec<f64> {
        let s: f64 = v.iter().sum();
        if s == 0.0 {
            return v;
        }
        v.into_iter().map(|x| x / s).collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    #[test]
    fn random_index_is_the_canonical_saaty_table() {
        let want = [
            (1, 0.0),
            (2, 0.0),
            (3, 0.58),
            (4, 0.90),
            (5, 1.12),
            (6, 1.24),
            (7, 1.32),
            (8, 1.41),
            (9, 1.45),
            (10, 1.49),
        ];
        for (n, ri) in want {
            assert_eq!(saaty_random_index(n), Some(ri), "RI({n})");
        }
        assert_eq!(saaty_random_index(11), None);
    }

    /// A perfectly consistent geometric matrix: priorities proportional to the
    /// first column, λ_max = n exactly, CI = CR = 0. (Saaty's consistency theorem.)
    #[test]
    fn consistent_matrix_recovers_exact_weights_and_zero_cr() {
        let a = PairwiseMatrix::new(vec![
            vec![1.0, 2.0, 4.0],
            vec![0.5, 1.0, 2.0],
            vec![0.25, 0.5, 1.0],
        ])
        .unwrap();
        let r = a.analyse();
        // priorities = [4/7, 2/7, 1/7]
        assert!(approx(r.priorities[0], 4.0 / 7.0, 1e-12));
        assert!(approx(r.priorities[1], 2.0 / 7.0, 1e-12));
        assert!(approx(r.priorities[2], 1.0 / 7.0, 1e-12));
        assert!(approx(r.lambda_max, 3.0, 1e-12));
        assert!(approx(r.consistency_index, 0.0, 1e-12));
        assert!(approx(r.consistency_ratio.unwrap(), 0.0, 1e-12));
        assert!(r.acceptable);
        // Priorities sum to one.
        assert!(approx(r.priorities.iter().sum::<f64>(), 1.0, 1e-15));
    }

    /// Inconsistent 4×4, cross-checked against SciPy/LAPACK (see the reference test):
    /// λ_max ≈ 4.16458, CR ≈ 0.06095 (< 0.10, acceptable).
    #[test]
    fn inconsistent_4x4_matches_lapack_oracle() {
        let a = PairwiseMatrix::new(vec![
            vec![1.0, 3.0, 7.0, 9.0],
            vec![1.0 / 3.0, 1.0, 5.0, 7.0],
            vec![1.0 / 7.0, 1.0 / 5.0, 1.0, 3.0],
            vec![1.0 / 9.0, 1.0 / 7.0, 1.0 / 3.0, 1.0],
        ])
        .unwrap();
        let r = a.analyse();
        assert!(approx(r.lambda_max, 4.164576705149029, 1e-9));
        let pv = [
            0.583088782744487,
            0.289529946821866,
            0.084896047730756,
            0.042485222702891,
        ];
        for (g, w) in r.priorities.iter().zip(pv) {
            assert!(approx(*g, w, 1e-9), "priority {g} != {w}");
        }
        assert!(approx(r.consistency_ratio.unwrap(), 0.060954335240381, 1e-9));
        assert!(r.acceptable);
    }

    /// An overly inconsistent matrix is rejected by the CR < 0.10 gate.
    #[test]
    fn highly_inconsistent_matrix_is_rejected() {
        let a = PairwiseMatrix::new(vec![
            vec![1.0, 9.0, 5.0],
            vec![1.0 / 9.0, 1.0, 3.0],
            vec![1.0 / 5.0, 1.0 / 3.0, 1.0],
        ])
        .unwrap();
        let r = a.analyse();
        assert!(r.consistency_ratio.unwrap() > 0.10);
        assert!(!r.acceptable);
    }

    #[test]
    fn from_upper_builds_a_reciprocal_matrix() {
        // Same consistent geometric matrix via the upper triangle.
        let a = PairwiseMatrix::from_upper(vec![vec![2.0, 4.0], vec![2.0]]).unwrap();
        let entries = a.entries();
        assert!(approx(entries[1][0], 0.5, 1e-15));
        assert!(approx(entries[2][0], 0.25, 1e-15));
        assert!(approx(entries[2][1], 0.5, 1e-15));
        let r = a.analyse();
        assert!(approx(r.lambda_max, 3.0, 1e-12));
    }

    #[test]
    fn construction_rejects_non_reciprocal_and_non_positive() {
        // Non-reciprocal.
        assert!(PairwiseMatrix::new(vec![vec![1.0, 2.0], vec![2.0, 1.0]]).is_err());
        // Non-positive.
        assert!(PairwiseMatrix::new(vec![vec![1.0, -2.0], vec![-0.5, 1.0]]).is_err());
        // Non-square.
        assert!(PairwiseMatrix::new(vec![vec![1.0, 2.0], vec![0.5]]).is_err());
    }
}
