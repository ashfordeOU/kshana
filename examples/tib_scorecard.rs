//! End-to-end TIB demonstration — the P1 + P4 "citable pair".
//!
//! Scores the real P1 CTI composed protection level
//! ([`kshana::integrity::composed_pl`]) as the reference monitor, and a
//! deliberately under-bounded constant PL as a broken monitor, against a
//! representative ns-scale fault menu, at a realistic application alert limit.
//!
//! What the scorecard honestly reveals (a benchmark makes NO accuracy claim of
//! its own — it only measures):
//!   * the composed PL **absorbs** the small undetectable offsets (symmetric
//!     delay, replay-within-freshness ≤ its handover floor) — the only honest
//!     defense against a fault that cannot be detected (Mizrahi RFC 7384);
//!   * it **covers** the holdover-coast regime it is designed for, and
//!     correctly declares itself **unavailable** (a continuity event, not an
//!     integrity failure) once the coast exceeds the alert limit;
//!   * the benchmark **exposes its boundary**: adversarial delay / clock-slam
//!     faults outside the holdover model produce hazardously-misleading
//!     information (HMI) — motivating the adversarial extensions (P2/P3). A
//!     reference yardstick maps a method's coverage honestly; it does not
//!     flatter it.
//!
//! The broken monitor is flagged far more broadly and fails to absorb the
//! undetectable offsets. No undetectable scenario is ever reported as
//! "detected" — only absorbed or unabsorbed.
//!
//! Run: cargo run --example tib_scorecard

use kshana::benchmark::faults::{
    asymmetric_delay, clock_slam, domain_divergence, holdover_coast, incremental_delay,
    k_of_n_quorum, path_selective, replay_within_freshness, static_delay, symmetric_delay,
    Detectability, FaultScenario,
};
use kshana::benchmark::scorecard::{run_scorecard, Scorecard, Verdict};
use kshana::clock_state::ClockState3;
use kshana::integrity::composed_pl::{composed_pl, HoldoverEnvelope};
use kshana::integrity::tpl_scalar::{scalar_tpl, TimeSource};

const N: usize = 64;

/// A representative ns-scale menu spanning the holdover regime, undetectable
/// delays, and adversarial faults outside the holdover model.
fn demo_menu() -> Vec<FaultScenario> {
    vec![
        domain_divergence(N, 0.8),        // slow drift to ~50 ns
        holdover_coast(N, 0.02, 0.3),     // free-running coast the PL models
        static_delay(N, 200.0),           // constant 200 ns injected delay
        incremental_delay(N, 2.0),        // ramp to ~126 ns
        clock_slam(N, 150.0, 20),         // 150 ns step at epoch 20
        asymmetric_delay(N, 80.0),        // half-RTT: 40 ns (detectable)
        path_selective(N, 100.0, 0.5),    // 50 ns on half the paths
        k_of_n_quorum(N, 90.0, 1, 3),     // 30 ns fused (1 of 3 compromised)
        symmetric_delay(N, 20.0),         // UNDETECTABLE — 20 ns (Mizrahi)
        replay_within_freshness(N, 15.0), // UNDETECTABLE — 15 ns
    ]
}

fn print_card(title: &str, menu: &[FaultScenario], card: &Scorecard) {
    println!("\n{title}");
    // avail = Stanford availability (PL≤AL, continuity); nom = nominal rate
    // (|e|≤PL≤AL, tightness). MI epochs are available-but-loose: they raise
    // avail but not nom.
    println!(
        "  {:<24} {:<22} {:>6} {:>5} {:>4} {:>4}",
        "scenario", "verdict", "avail", "nom", "mi", "hmi"
    );
    for (report, scenario) in card.reports.iter().zip(menu.iter()) {
        let tag = match scenario.spec.detectability {
            Detectability::Undetectable => "  (undetectable)",
            Detectability::Detectable => "",
        };
        println!(
            "  {:<24} {:<22} {:>5.0}% {:>4.0}% {:>4} {:>4}{}",
            report.scenario_name,
            format!("{:?}", report.verdict),
            report.score.availability * 100.0,
            report.score.nominal_rate * 100.0,
            report.score.n_mi,
            report.score.n_hmi,
            tag,
        );
    }
    println!(
        "  → n_hmi_total={} all_undetectable_absorbed={}",
        card.n_hmi_total, card.all_undetectable_absorbed
    );
}

fn main() {
    let menu = demo_menu();
    let al = 100.0; // ns — a demanding time-transfer alert limit
    let stated_ir = 1e-3; // the integrity risk the monitors claim

    // Reference monitor = the P1 composed protection level PL(τ)=max(TPL,HPL(τ)),
    // evaluated over a ~1-day coast (epoch k → τ = k·Δt seconds), in ns.
    let sources = [
        TimeSource {
            sigma_s: 2e-9,
            bias_s: 1e-9,
            p_fault: 1e-4,
        }, // GNSS-PPP
        TimeSource {
            sigma_s: 5e-9,
            bias_s: 2e-9,
            p_fault: 1e-4,
        }, // PTP / White-Rabbit
        TimeSource {
            sigma_s: 8e-9,
            bias_s: 3e-9,
            p_fault: 1e-4,
        }, // LEO-STL
    ];
    let ir_pl = 1e-6;
    let tpl = scalar_tpl(&sources, ir_pl, 1e-3).expect("sources present");
    let mut clk = ClockState3::new(1e-24, 1e-30, 1e-38).with_initial_cov(4e-20, 1e-24, 1e-30);
    clk.predict(1.0);
    let env = HoldoverEnvelope {
        q_wf: 1e-24,
        q_rw: 1e-30,
        q_drift: 1e-38,
        d_aging: 1e-18,
        flicker_floor: 1e-13,
        p0_phase_var_s2: clk.covariance()[0][0],
    };
    let dt = 86_400.0 / (N as f64 - 1.0); // one epoch grid → ~1 day coast
    let reference_pl = |k: usize| composed_pl(tpl.pl_s, &env, ir_pl, k as f64 * dt) * 1e9;

    println!(
        "Reference monitor = P1 composed PL: {:.1} ns at handover → {:.1} ns at {:.1} h coast",
        reference_pl(0),
        reference_pl(N - 1),
        (N as f64 - 1.0) * dt / 3600.0
    );

    let reference = run_scorecard(&menu, al, stated_ir, reference_pl);
    let broken = run_scorecard(&menu, al, stated_ir, |_k| 5.0); // under-bounded 5 ns

    print_card("REFERENCE (P1 composed PL)", &menu, &reference);
    print_card("BROKEN (under-bounded 5 ns)", &menu, &broken);

    // Honesty checks (a benchmark measures — these are properties of the scorer,
    // not accuracy claims):
    // 1. The composed PL absorbs the sub-floor undetectable offsets.
    assert!(
        reference.all_undetectable_absorbed,
        "the composed PL should absorb the sub-floor undetectable offsets"
    );
    // 2. The broken monitor cannot absorb them and is flagged more broadly.
    assert!(
        !broken.all_undetectable_absorbed,
        "broken monitor must fail to absorb"
    );
    assert!(
        broken.n_hmi_total >= reference.n_hmi_total && broken.n_hmi_total > 0,
        "broken monitor must be flagged at least as heavily as the reference"
    );
    // 3. The honesty property, live: NO undetectable scenario ever receives a
    //    coverage (detection-flavoured) verdict — only absorption verdicts.
    for card in [&reference, &broken] {
        for (report, scenario) in card.reports.iter().zip(menu.iter()) {
            if scenario.spec.detectability == Detectability::Undetectable {
                assert!(
                    matches!(
                        report.verdict,
                        Verdict::AbsorbedUndetectable | Verdict::UnabsorbedUndetectable
                    ),
                    "undetectable scenario must never get a coverage verdict"
                );
            }
        }
    }
}
