// SPDX-License-Identifier: AGPL-3.0-only
//! **Multi-Attribute Utility Theory (MAUT).**
//!
//! Where the weighted-sum model ([`super::wsm`]) treats preference as linear in the
//! normalised attribute value, MAUT lets each attribute carry a *utility curve* that
//! encodes the decision-maker's **risk attitude**: diminishing returns near the
//! good end (risk-averse, concave), increasing returns (risk-seeking, convex), or
//! the linear neutral case. Each single-attribute utility `u_j(·)` maps a raw value
//! to `[0, 1]`, and the overall utility is the additive aggregation
//! `U(x) = Σ_j k_j · u_j(x_j)` with scaling constants `k_j` summing to one.
//!
//! The utility curve is the standard normalised **exponential (constant
//! absolute-risk-aversion) utility**
//! `u(t) = (1 − e^{−ρ t}) / (1 − e^{−ρ})` on the min–max-scaled value `t ∈ [0, 1]`,
//! with risk coefficient `ρ`: `ρ > 0` concave/averse, `ρ < 0` convex/seeking, and
//! the linear limit `u(t) = t` as `ρ → 0`. Closed-form and property/known-value
//! tested — honestly *Modelled*.

use super::wsm::Direction;

/// Risk attitude shorthand, mapping to a default exponential risk coefficient `ρ`.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub enum RiskAttitude {
    /// Concave utility — diminishing marginal value (ρ = +2).
    Averse,
    /// Linear utility — value proportional to the normalised attribute (ρ = 0).
    Neutral,
    /// Convex utility — increasing marginal value (ρ = −2).
    Seeking,
}

impl RiskAttitude {
    /// The default exponential risk coefficient for this attitude.
    pub fn rho(self) -> f64 {
        match self {
            RiskAttitude::Averse => 2.0,
            RiskAttitude::Neutral => 0.0,
            RiskAttitude::Seeking => -2.0,
        }
    }
}

/// One attribute's utility function: a measurement range, a benefit/cost direction,
/// and an exponential risk coefficient `rho`.
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct Attribute {
    /// Worst-case raw value defining one end of the scale.
    pub min: f64,
    /// Best-case raw value defining the other end of the scale.
    pub max: f64,
    /// Whether higher (benefit) or lower (cost) raw values are preferred.
    pub direction: Direction,
    /// Exponential risk coefficient: `> 0` risk-averse (concave), `< 0` risk-seeking
    /// (convex), `≈ 0` risk-neutral (linear).
    pub rho: f64,
}

impl Attribute {
    /// A benefit attribute over `[min, max]` with the given risk attitude.
    pub fn benefit(min: f64, max: f64, attitude: RiskAttitude) -> Self {
        Self {
            min,
            max,
            direction: Direction::Benefit,
            rho: attitude.rho(),
        }
    }

    /// A cost attribute over `[min, max]` with the given risk attitude.
    pub fn cost(min: f64, max: f64, attitude: RiskAttitude) -> Self {
        Self {
            min,
            max,
            direction: Direction::Cost,
            rho: attitude.rho(),
        }
    }

    /// The single-attribute utility of raw value `x`, in `[0, 1]`. The value is
    /// min–max scaled (and oriented by [`Direction`]) to `t ∈ [0, 1]`, then passed
    /// through the normalised exponential utility curve. Values outside `[min, max]`
    /// are clamped.
    pub fn utility(&self, x: f64) -> f64 {
        let range = self.max - self.min;
        let t = if range == 0.0 {
            1.0 // degenerate range: every value is the best
        } else {
            let raw = (x - self.min) / range;
            let oriented = match self.direction {
                Direction::Benefit => raw,
                Direction::Cost => 1.0 - raw,
            };
            oriented.clamp(0.0, 1.0)
        };
        exp_utility(t, self.rho)
    }
}

/// The normalised exponential (CARA) utility curve on `t ∈ [0, 1]`:
/// `(1 − e^{−ρ t}) / (1 − e^{−ρ})`, with the linear limit `t` for `ρ ≈ 0`. Always
/// satisfies `u(0) = 0`, `u(1) = 1`, and is monotone increasing in `t`.
pub fn exp_utility(t: f64, rho: f64) -> f64 {
    if rho.abs() < 1e-9 {
        return t.clamp(0.0, 1.0);
    }
    let t = t.clamp(0.0, 1.0);
    (1.0 - (-rho * t).exp()) / (1.0 - (-rho).exp())
}

/// An additive multi-attribute utility model: one [`Attribute`] per dimension and a
/// scaling constant (weight) per dimension.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct AdditiveUtility {
    pub attributes: Vec<Attribute>,
    /// Scaling constants `k_j`; normalised to sum to one at evaluation time.
    pub weights: Vec<f64>,
}

impl AdditiveUtility {
    /// Construct, validating that there is at least one attribute, the lengths match,
    /// and the weights are finite, non-negative, and have a positive sum.
    pub fn new(attributes: Vec<Attribute>, weights: Vec<f64>) -> Result<Self, String> {
        if attributes.is_empty() {
            return Err("additive utility has no attributes".into());
        }
        if attributes.len() != weights.len() {
            return Err(format!(
                "{} attributes but {} weights",
                attributes.len(),
                weights.len()
            ));
        }
        let mut sum = 0.0;
        for &w in &weights {
            if !w.is_finite() || w < 0.0 {
                return Err(format!("invalid scaling constant {w}"));
            }
            sum += w;
        }
        if sum <= 0.0 {
            return Err("scaling constants sum to zero".into());
        }
        Ok(Self {
            attributes,
            weights,
        })
    }

    /// The aggregate utility `U(x) = Σ_j k_j · u_j(x_j)` of an alternative described
    /// by one raw value per attribute. Errors on a length mismatch.
    pub fn evaluate(&self, x: &[f64]) -> Result<f64, String> {
        if x.len() != self.attributes.len() {
            return Err(format!(
                "{} attribute values expected, got {}",
                self.attributes.len(),
                x.len()
            ));
        }
        let wsum: f64 = self.weights.iter().sum();
        let u = self
            .attributes
            .iter()
            .zip(self.weights.iter())
            .zip(x.iter())
            .map(|((attr, &w), &xi)| (w / wsum) * attr.utility(xi))
            .sum();
        Ok(u)
    }

    /// Rank a set of alternatives (each a raw-value row) by descending aggregate
    /// utility; ties broken by ascending index. Returns the alternative indices.
    pub fn rank(&self, alternatives: &[Vec<f64>]) -> Result<Vec<usize>, String> {
        let mut scored: Vec<(usize, f64)> = Vec::with_capacity(alternatives.len());
        for (i, row) in alternatives.iter().enumerate() {
            scored.push((i, self.evaluate(row)?));
        }
        scored.sort_by(|a, b| b.1.total_cmp(&a.1).then(a.0.cmp(&b.0)));
        Ok(scored.into_iter().map(|(i, _)| i).collect())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    #[test]
    fn exp_utility_endpoints_and_known_midpoint() {
        // Endpoints fixed regardless of rho.
        for rho in [-3.0, -1.0, 0.0, 1.0, 2.0, 5.0] {
            assert!(approx(exp_utility(0.0, rho), 0.0, 1e-12));
            assert!(approx(exp_utility(1.0, rho), 1.0, 1e-12));
        }
        // Closed-form known value: u(0.5; rho=2) = (1-e^-1)/(1-e^-2) = 0.7310585786.
        assert!(approx(exp_utility(0.5, 2.0), 0.731_058_578_630_005, 1e-12));
        // Neutral is exactly linear.
        assert!(approx(exp_utility(0.37, 0.0), 0.37, 1e-15));
    }

    #[test]
    fn risk_attitude_curvature_signs() {
        let mid = 0.5;
        // Averse (rho>0) is concave -> above the linear value at the midpoint.
        assert!(exp_utility(mid, RiskAttitude::Averse.rho()) > mid);
        // Seeking (rho<0) is convex -> below.
        assert!(exp_utility(mid, RiskAttitude::Seeking.rho()) < mid);
        // Neutral is exactly the value.
        assert!(approx(exp_utility(mid, RiskAttitude::Neutral.rho()), mid, 1e-15));
    }

    #[test]
    fn utility_is_monotone_increasing_in_preference() {
        let a = Attribute::benefit(0.0, 100.0, RiskAttitude::Averse);
        let mut last = -1.0;
        for i in 0..=100 {
            let u = a.utility(i as f64);
            assert!(u >= last - 1e-15, "non-monotone at {i}: {u} < {last}");
            last = u;
        }
        // A cost attribute inverts: the minimum raw value is the best (utility 1).
        let c = Attribute::cost(0.0, 100.0, RiskAttitude::Neutral);
        assert!(approx(c.utility(0.0), 1.0, 1e-12));
        assert!(approx(c.utility(100.0), 0.0, 1e-12));
        assert!(approx(c.utility(25.0), 0.75, 1e-12)); // neutral cost: 1 - 0.25
    }

    #[test]
    fn additive_aggregation_weights_and_ranks() {
        // Two attributes, both neutral benefits over [0,1]; weights 0.75 / 0.25.
        let au = AdditiveUtility::new(
            vec![
                Attribute::benefit(0.0, 1.0, RiskAttitude::Neutral),
                Attribute::benefit(0.0, 1.0, RiskAttitude::Neutral),
            ],
            vec![0.75, 0.25],
        )
        .unwrap();
        // U([1,0]) = 0.75; U([0,1]) = 0.25; U([0.5,0.5]) = 0.5.
        assert!(approx(au.evaluate(&[1.0, 0.0]).unwrap(), 0.75, 1e-12));
        assert!(approx(au.evaluate(&[0.0, 1.0]).unwrap(), 0.25, 1e-12));
        assert!(approx(au.evaluate(&[0.5, 0.5]).unwrap(), 0.5, 1e-12));
        // Ranking: [1,0] > [0.5,0.5] > [0,1].
        let r = au
            .rank(&[vec![1.0, 0.0], vec![0.0, 1.0], vec![0.5, 0.5]])
            .unwrap();
        assert_eq!(r, vec![0, 2, 1]);
    }

    #[test]
    fn risk_aversion_changes_the_winner() {
        // Alt A is a safe middling option; Alt B is extreme (great on attr0, poor on attr1).
        // Under strong risk aversion the safe option's concave utility wins; under
        // risk seeking the extreme option wins. Demonstrates attitude actually bites.
        let alts = [vec![0.5, 0.5], vec![1.0, 0.0]];
        let weights = vec![0.5, 0.5];

        let averse = AdditiveUtility::new(
            vec![
                Attribute::benefit(0.0, 1.0, RiskAttitude::Averse),
                Attribute::benefit(0.0, 1.0, RiskAttitude::Averse),
            ],
            weights.clone(),
        )
        .unwrap();
        assert_eq!(averse.rank(&alts).unwrap()[0], 0, "averse prefers the safe option");

        let seeking = AdditiveUtility::new(
            vec![
                Attribute::benefit(0.0, 1.0, RiskAttitude::Seeking),
                Attribute::benefit(0.0, 1.0, RiskAttitude::Seeking),
            ],
            weights,
        )
        .unwrap();
        assert_eq!(seeking.rank(&alts).unwrap()[0], 1, "seeking prefers the gamble");
    }

    #[test]
    fn construction_validates() {
        assert!(AdditiveUtility::new(vec![], vec![]).is_err());
        assert!(AdditiveUtility::new(
            vec![Attribute::benefit(0.0, 1.0, RiskAttitude::Neutral)],
            vec![1.0, 2.0]
        )
        .is_err());
    }
}
