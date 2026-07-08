//! End-to-end TIB demonstration: score the P1 CTI composed protection level and
//! a deliberately under-bounded monitor against the fault menu. Shows the broken
//! monitor flagged (HMI / coverage-fail) and both undetectable scenarios handled
//! by absorption, never "detection".
//!
//! Run: cargo run --example tib_scorecard

use kshana::benchmark::faults::full_menu;
use kshana::benchmark::scorecard::{run_scorecard, Verdict};

fn main() {
    let menu = full_menu();
    let al = 10.0; // ns application alert limit
    let ir = 1e-3;

    // Reference monitor: a generous constant PL that absorbs the menu offsets
    // (a stand-in for the P1 composed PL evaluated over the coast — see
    // crate::integrity::composed_pl for the real ride-through envelope).
    let reference = run_scorecard(&menu, al, ir, |_k| 500.0);
    // Broken monitor: an under-bounded PL that cannot absorb the offsets.
    let broken = run_scorecard(&menu, al, ir, |_k| 1.0);

    println!("scenario                    reference            broken");
    for (r, b) in reference.reports.iter().zip(broken.reports.iter()) {
        println!("{:<26} {:<20?} {:?}", r.scenario_name, r.verdict, b.verdict);
    }
    println!(
        "\nreference: hmi_total={} all_undetectable_absorbed={}",
        reference.n_hmi_total, reference.all_undetectable_absorbed
    );
    println!(
        "broken:    hmi_total={} all_undetectable_absorbed={}",
        broken.n_hmi_total, broken.all_undetectable_absorbed
    );

    assert!(
        reference.all_undetectable_absorbed,
        "reference PL must absorb undetectable offsets"
    );
    assert!(broken.n_hmi_total > 0, "broken monitor must be flagged");
    // The honesty property, live: no undetectable scenario is ever a coverage verdict.
    for card in [&reference, &broken] {
        for (report, scenario) in card.reports.iter().zip(menu.iter()) {
            if matches!(
                scenario.spec.detectability,
                kshana::benchmark::faults::Detectability::Undetectable
            ) {
                assert!(matches!(
                    report.verdict,
                    Verdict::AbsorbedUndetectable | Verdict::UnabsorbedUndetectable
                ));
            }
        }
    }
}
