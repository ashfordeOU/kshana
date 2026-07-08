//! Run a monitor against a fault menu and produce a scorecard.
//!
//! The monitor is a closure `pl_fn(epoch) -> pl` over each epoch's *observables*;
//! the harness holds the true error hidden and compares. For a
//! [`Detectability::Undetectable`] scenario (symmetric delay, replay-within-
//! freshness) the ONLY honest passing outcome is **absorption** — `pl ≥ offset`
//! at every epoch — scored as [`Verdict::AbsorbedUndetectable`]. There is no
//! "detected" verdict for such scenarios: the enum makes reporting an
//! undetectable fault as detected structurally impossible (Mizrahi RFC 7384).

use crate::benchmark::coverage::{score, Sample, ScenarioScore};
use crate::benchmark::faults::{Detectability, FaultScenario};

/// The per-scenario outcome. Detectable scenarios get a coverage verdict;
/// undetectable ones get an absorption verdict. No variant reports an
/// undetectable fault as "detected".
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Verdict {
    CoveragePass,
    CoverageFail,
    AbsorbedUndetectable,
    UnabsorbedUndetectable,
}

/// One scenario's report.
#[derive(Debug, Clone)]
pub struct ScenarioReport {
    pub scenario_name: String,
    pub score: ScenarioScore,
    pub verdict: Verdict,
}

/// The aggregate scorecard for a monitor across a menu.
#[derive(Debug, Clone)]
pub struct Scorecard {
    pub reports: Vec<ScenarioReport>,
    pub n_hmi_total: usize,
    pub all_undetectable_absorbed: bool,
}

/// Score `pl_fn` against every scenario in `menu`.
pub fn run_scorecard<F: Fn(usize) -> f64>(
    menu: &[FaultScenario],
    al: f64,
    stated_ir: f64,
    pl_fn: F,
) -> Scorecard {
    let mut reports = Vec::with_capacity(menu.len());
    let mut n_hmi_total = 0usize;
    let mut all_undetectable_absorbed = true;
    for sc in menu {
        let samples: Vec<Sample> = sc
            .true_errors
            .iter()
            .enumerate()
            .map(|(k, &true_error)| Sample {
                true_error,
                pl: pl_fn(k),
            })
            .collect();
        let s: ScenarioScore = score(&samples, al, stated_ir);
        n_hmi_total += s.n_hmi;
        let verdict = match sc.spec.detectability {
            Detectability::Undetectable => {
                let absorbed = samples.iter().all(|smp| smp.pl >= smp.true_error.abs());
                if absorbed {
                    Verdict::AbsorbedUndetectable
                } else {
                    all_undetectable_absorbed = false;
                    Verdict::UnabsorbedUndetectable
                }
            }
            Detectability::Detectable => {
                if s.coverage_ok {
                    Verdict::CoveragePass
                } else {
                    Verdict::CoverageFail
                }
            }
        };
        reports.push(ScenarioReport {
            scenario_name: sc.name.clone(),
            score: s,
            verdict,
        });
    }
    Scorecard {
        reports,
        n_hmi_total,
        all_undetectable_absorbed,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::benchmark::faults::{
        asymmetric_delay, static_delay, symmetric_delay, Detectability,
    };

    #[test]
    fn reference_pl_absorbs_undetectable() {
        // symmetric_delay offset 6; a PL of 100 absorbs it.
        let menu = vec![symmetric_delay(8, 6.0)];
        let card = run_scorecard(&menu, 1000.0, 1e-3, |_| 100.0);
        assert_eq!(card.reports[0].verdict, Verdict::AbsorbedUndetectable);
        assert!(card.all_undetectable_absorbed);
    }

    #[test]
    fn broken_pl_fails_to_absorb_but_never_detects() {
        // PL of 1 cannot absorb a 6 ns symmetric offset.
        let menu = vec![symmetric_delay(8, 6.0)];
        let card = run_scorecard(&menu, 1000.0, 1e-3, |_| 1.0);
        assert_eq!(card.reports[0].verdict, Verdict::UnabsorbedUndetectable);
        assert!(!card.all_undetectable_absorbed);
    }

    #[test]
    fn detectable_fault_uses_coverage_verdict() {
        // static_delay 5 with generous PL and AL → CoveragePass; tiny PL → CoverageFail.
        let menu = vec![static_delay(8, 5.0)];
        assert_eq!(
            run_scorecard(&menu, 1000.0, 1e-3, |_| 100.0).reports[0].verdict,
            Verdict::CoveragePass
        );
        assert_eq!(
            run_scorecard(&menu, 3.0, 1e-3, |_| 1.0).reports[0].verdict,
            Verdict::CoverageFail
        );
    }

    #[test]
    fn undetectable_never_yields_a_coverage_verdict() {
        // The honesty property: an Undetectable scenario is NEVER reported as a
        // (detection-flavoured) coverage pass/fail, for any PL.
        for pl in [0.0_f64, 1.0, 6.0, 1e6] {
            let menu = vec![symmetric_delay(8, 6.0), asymmetric_delay(8, 4.0)];
            let card = run_scorecard(&menu, 1000.0, 1e-3, move |_| pl);
            let undet = &card.reports[0]; // symmetric_delay
            assert_eq!(menu_detectability(&menu, 0), Detectability::Undetectable);
            assert!(matches!(
                undet.verdict,
                Verdict::AbsorbedUndetectable | Verdict::UnabsorbedUndetectable
            ));
        }
    }

    fn menu_detectability(
        menu: &[crate::benchmark::faults::FaultScenario],
        i: usize,
    ) -> Detectability {
        menu[i].spec.detectability
    }
}
