// SPDX-License-Identifier: Apache-2.0
//! Frugal-engineering cost-per-coverage / ROI layer over constellation sizing.
//!
//! Constellation sizing ([`crate::walker`]) answers *how many satellites* a design
//! needs for a coverage/PDOP target. This module adds the **frugal** question a
//! programme office actually asks: *what does each percentage-point of coverage
//! cost, and how does a small efficient design compare to a larger incumbent
//! baseline?* It is a thin benefit-framing layer — it adds **no** new physics and
//! invents **no** prices.
//!
//! ### Honesty discipline
//! - **No fabricated point prices.** A per-satellite cost is supplied as an
//!   explicit **bracket** ([`CostBracket`]: low / nominal / high) the caller sources
//!   from clearly-cited public LEO-smallsat figures. Every output carries the whole
//!   bracket, never a single spuriously-precise number.
//! - **Ranges in, ranges out.** Cost-per-coverage and ROI are reported as
//!   low/nominal/high triples derived from the bracket, so the uncertainty is on the
//!   artifact face.
//! - This is a **modelled** economic framing of a **modelled** coverage figure — not
//!   a quote, not a validated cost model.

use serde::Serialize;

/// A per-satellite recurring-cost **bracket** in millions of euro (M€). The caller
/// supplies low/nominal/high from publicly-citable LEO-smallsat cost ranges — this
/// module never bakes in a price of its own.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CostBracket {
    /// Optimistic per-satellite recurring cost (M€).
    pub low_meur: f64,
    /// Nominal per-satellite recurring cost (M€).
    pub nominal_meur: f64,
    /// Conservative per-satellite recurring cost (M€).
    pub high_meur: f64,
    /// Free-text provenance for the bracket (the citation/source). Required so a
    /// reviewer can trace where the numbers came from.
    pub source: String,
}

impl CostBracket {
    /// Validate the bracket: all finite, non-negative, and ordered low ≤ nominal ≤ high.
    pub fn is_valid(&self) -> bool {
        self.low_meur.is_finite()
            && self.nominal_meur.is_finite()
            && self.high_meur.is_finite()
            && self.low_meur >= 0.0
            && self.low_meur <= self.nominal_meur
            && self.nominal_meur <= self.high_meur
            && !self.source.trim().is_empty()
    }
}

/// A low/nominal/high triple — the canonical "range, not a point" output shape.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Range {
    pub low: f64,
    pub nominal: f64,
    pub high: f64,
}

/// The frugal benefit framing for one candidate constellation design.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FrugalCase {
    /// Design label (e.g. `"Walker 24/3/1 @ 1200 km"`).
    pub label: String,
    /// Total satellites in the design.
    pub total_satellites: usize,
    /// Coverage fraction in `[0, 1]` (from the sizing run).
    pub coverage_fraction: f64,
    /// Availability fraction in `[0, 1]` (from the sizing/FoM run).
    pub availability: f64,
    /// Coverage **percentage points delivered per satellite** — the frugal headline
    /// (higher = more coverage per unit fleet).
    pub coverage_pct_per_sat: f64,
    /// Programme recurring cost range (M€) = total_satellites × cost bracket.
    pub fleet_cost_meur: Range,
    /// Euro-cost (M€) per **percentage point** of coverage = fleet cost / (coverage% ).
    /// `None` when coverage is zero (no coverage to cost).
    pub meur_per_coverage_pct: Option<Range>,
    /// The cost bracket used (echoed for provenance).
    pub cost: CostBracket,
    /// On-artifact caveat.
    pub caveat: String,
}

/// Compute the frugal benefit framing for one design. `coverage_fraction` and
/// `availability` come from a sizing/FoM run (e.g. [`crate::walker::SweepCell`]);
/// `cost` is a caller-supplied, sourced bracket.
pub fn frugal_case(
    label: &str,
    total_satellites: usize,
    coverage_fraction: f64,
    availability: f64,
    cost: &CostBracket,
) -> Result<FrugalCase, String> {
    if !cost.is_valid() {
        return Err("cost bracket must be finite, non-negative, ordered low≤nominal≤high, and carry a source".into());
    }
    if !(0.0..=1.0).contains(&coverage_fraction) || !(0.0..=1.0).contains(&availability) {
        return Err("coverage_fraction and availability must be fractions in [0, 1]".into());
    }
    let n = total_satellites as f64;
    let coverage_pct = coverage_fraction * 100.0;
    let coverage_pct_per_sat = if total_satellites > 0 {
        coverage_pct / n
    } else {
        0.0
    };
    let fleet_cost = Range {
        low: n * cost.low_meur,
        nominal: n * cost.nominal_meur,
        high: n * cost.high_meur,
    };
    let meur_per_coverage_pct = if coverage_pct > 0.0 {
        Some(Range {
            low: fleet_cost.low / coverage_pct,
            nominal: fleet_cost.nominal / coverage_pct,
            high: fleet_cost.high / coverage_pct,
        })
    } else {
        None
    };
    Ok(FrugalCase {
        label: label.to_string(),
        total_satellites,
        coverage_fraction,
        availability,
        coverage_pct_per_sat,
        fleet_cost_meur: fleet_cost,
        meur_per_coverage_pct,
        cost: cost.clone(),
        caveat: "MODELLED economic framing of a modelled coverage figure; costs are a \
                 caller-supplied sourced bracket (range, not a quote), not a validated cost model."
            .into(),
    })
}

/// Relative ROI of a `candidate` design versus a (typically larger, incumbent)
/// `baseline`, on the nominal cost. `> 1` means the candidate delivers more coverage
/// per euro than the baseline.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FrugalComparison {
    pub candidate: String,
    pub baseline: String,
    /// candidate coverage-per-euro ÷ baseline coverage-per-euro, at nominal cost.
    /// `None` if either side has zero coverage or zero cost.
    pub coverage_per_euro_ratio: Option<f64>,
    /// Satellites saved by the candidate vs the baseline (can be negative).
    pub satellites_delta: i64,
    pub caveat: String,
}

/// Compare two frugal cases on coverage-per-euro (nominal). Both must already be
/// computed (so the comparison can't game the inputs).
pub fn compare(candidate: &FrugalCase, baseline: &FrugalCase) -> FrugalComparison {
    // coverage-per-euro = coverage% / nominal fleet cost.
    let cov_per_euro = |c: &FrugalCase| -> Option<f64> {
        let cost = c.fleet_cost_meur.nominal;
        let cov = c.coverage_fraction * 100.0;
        if cost > 0.0 && cov > 0.0 {
            Some(cov / cost)
        } else {
            None
        }
    };
    let ratio = match (cov_per_euro(candidate), cov_per_euro(baseline)) {
        (Some(c), Some(b)) if b > 0.0 => Some(c / b),
        _ => None,
    };
    FrugalComparison {
        candidate: candidate.label.clone(),
        baseline: baseline.label.clone(),
        coverage_per_euro_ratio: ratio,
        satellites_delta: candidate.total_satellites as i64 - baseline.total_satellites as i64,
        caveat: "Ratio compares modelled coverage-per-euro at nominal cost; both sides use \
                 caller-sourced cost brackets. A modelled framing, not a procurement quote."
            .into(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn bracket() -> CostBracket {
        CostBracket {
            low_meur: 1.0,
            nominal_meur: 2.0,
            high_meur: 4.0,
            source: "illustrative public LEO-smallsat recurring-cost range".into(),
        }
    }

    #[test]
    fn bracket_validation_rejects_disordered_or_unsourced() {
        assert!(bracket().is_valid());
        let mut b = bracket();
        b.source = "  ".into();
        assert!(!b.is_valid(), "empty source must be rejected");
        let disordered = CostBracket {
            low_meur: 5.0,
            nominal_meur: 2.0,
            high_meur: 4.0,
            source: "x".into(),
        };
        assert!(!disordered.is_valid(), "low>nominal must be rejected");
    }

    #[test]
    fn frugal_case_hand_derived() {
        // 24 sats, 96% coverage, nominal €2M/sat.
        let c = frugal_case("Walker 24/3/1", 24, 0.96, 0.99, &bracket()).unwrap();
        // coverage% per sat = 96 / 24 = 4.0
        assert!((c.coverage_pct_per_sat - 4.0).abs() < 1e-9);
        // fleet nominal cost = 24 × 2 = 48 M€
        assert!((c.fleet_cost_meur.nominal - 48.0).abs() < 1e-9);
        assert!((c.fleet_cost_meur.low - 24.0).abs() < 1e-9);
        assert!((c.fleet_cost_meur.high - 96.0).abs() < 1e-9);
        // M€ per coverage% nominal = 48 / 96 = 0.5
        let per = c.meur_per_coverage_pct.unwrap();
        assert!((per.nominal - 0.5).abs() < 1e-9);
        assert!((per.low - 0.25).abs() < 1e-9);
        assert!((per.high - 1.0).abs() < 1e-9);
        assert!(c.caveat.contains("MODELLED"));
    }

    #[test]
    fn zero_coverage_yields_no_cost_per_coverage() {
        let c = frugal_case("dead", 10, 0.0, 0.0, &bracket()).unwrap();
        assert!(c.meur_per_coverage_pct.is_none());
        assert_eq!(c.coverage_pct_per_sat, 0.0);
    }

    #[test]
    fn invalid_inputs_error() {
        assert!(frugal_case("x", 10, 1.5, 0.9, &bracket()).is_err()); // coverage>1
        let mut bad = bracket();
        bad.low_meur = -1.0;
        assert!(frugal_case("x", 10, 0.9, 0.9, &bad).is_err());
    }

    #[test]
    fn comparison_favours_the_more_efficient_design() {
        // Small efficient: 24 sats, 96% → 48 M€ nominal → 2.0 cov/M€.
        let small = frugal_case("small-24", 24, 0.96, 0.99, &bracket()).unwrap();
        // Large incumbent: 66 sats, 99% → 132 M€ nominal → 0.75 cov/M€.
        let large = frugal_case("incumbent-66", 66, 0.99, 0.999, &bracket()).unwrap();
        let cmp = compare(&small, &large);
        // ratio = 2.0 / 0.75 = 2.667 → candidate ~2.7× more coverage per euro.
        let r = cmp.coverage_per_euro_ratio.unwrap();
        assert!((r - 2.6667).abs() < 1e-3, "ratio was {r}");
        assert!(r > 1.0, "the small design is more frugal");
        assert_eq!(cmp.satellites_delta, 24 - 66);
        assert!(cmp.caveat.contains("not a procurement quote"));
    }

    #[test]
    fn comparison_handles_zero_coverage_gracefully() {
        let good = frugal_case("good", 24, 0.96, 0.99, &bracket()).unwrap();
        let dead = frugal_case("dead", 10, 0.0, 0.0, &bracket()).unwrap();
        assert!(compare(&good, &dead).coverage_per_euro_ratio.is_none());
    }

    #[test]
    fn serializes_with_full_bracket_not_a_point() {
        let c = frugal_case("Walker 24/3/1", 24, 0.96, 0.99, &bracket()).unwrap();
        let json = serde_json::to_string(&c).unwrap();
        // The whole low/nominal/high bracket + the source are on the artifact.
        assert!(json.contains("\"low\""));
        assert!(json.contains("\"nominal\""));
        assert!(json.contains("\"high\""));
        assert!(json.contains("source"));
    }
}
