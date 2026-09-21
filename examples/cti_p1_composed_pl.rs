//! CTI P1 end-to-end: three heterogeneous time sources → scalar TPL at
//! handover → P0-seeded holdover ride-through PL(τ)=max(TPL_handover, HPL(τ)).

use kshana::clock_state::ClockState3;
use kshana::integrity::composed_pl::{composed_pl, HoldoverEnvelope};
use kshana::integrity::tpl_scalar::{scalar_tpl, TimeSource};

fn main() {
    // Heterogeneous sources (σ, bias in seconds).
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
    let ir = 1e-6;
    let tpl = scalar_tpl(&sources, ir, 1e-3).expect("sources present");
    println!(
        "TPL_handover = {:.3} ns (driving subset {:?})",
        tpl.pl_s * 1e9,
        tpl.driving_subset
    );

    // Seed the holdover from a disciplined-clock handover covariance.
    let mut clk = ClockState3::new(1e-24, 1e-30, 1e-38).with_initial_cov(4e-20, 1e-24, 1e-30);
    clk.predict(1.0);
    let p0 = clk.covariance()[0][0];
    let env = HoldoverEnvelope {
        q_wf: 1e-24,
        q_rw: 1e-30,
        q_drift: 1e-38,
        d_aging: 1e-18,
        flicker_floor: 1e-13,
        p0_phase_var_s2: p0,
    };

    println!("coast_s,PL_ns");
    for &t in &[0.0f64, 60.0, 600.0, 3600.0, 86_400.0, 604_800.0] {
        println!("{t:.0},{:.3}", composed_pl(tpl.pl_s, &env, ir, t) * 1e9);
    }
}
