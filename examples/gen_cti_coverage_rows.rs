//! Print the CTI holdover-coverage reference rows (6 dp) for cross-checking the
//! Rust envelope against tests/fixtures/cti/reference.json.

use kshana::integrity::composed_pl::{hpl, HoldoverEnvelope};

fn main() {
    // q_wf is read from the committed reference.json in CI; here we demonstrate
    // the envelope for a representative white-FM diffusion.
    let q_wf = 1e-24;
    let env = HoldoverEnvelope {
        q_wf,
        q_rw: 0.0,
        q_drift: 0.0,
        d_aging: 0.0,
        flicker_floor_s: 0.0,
        p0_phase_var_s2: 0.0,
    };
    println!("tau_days,envelope_ns");
    for tau_days in [30.0f64, 90.0, 180.0, 365.0, 730.0] {
        let tau_s = tau_days * 86400.0;
        println!("{tau_days:.6},{:.6}", hpl(&env, 1e-2, tau_s) * 1e9);
    }
}
