//! End-to-end R2+R3 demonstration (CTI P2).
//!
//! Builds a heterogeneous 5-source timing budget in which two sources trace to
//! the SAME UTC(k) realizer, and shows the two honest hazards P2 addresses:
//!   1. ignoring the correlated traceability bias UNDER-bounds the fused bias
//!      (naive independent allocation is optimistic -> unsafe);
//!   2. solution separation is blind to a common-mode shift, which the GLS
//!      common-mode consistency statistic catches -- but a shared-reference
//!      fault in a direction outside the modelled Omega stays an irreducible,
//!      published blind spot.
//!
//! P2 makes NO new accuracy claim: these are properties of the Proven algebra
//! over Cited metrology inputs. Run: cargo run --example hetero_gls_demo

use kshana::integrity::gls_commonmode::{common_mode_consistency, residual_outside_omega_bound};
use kshana::integrity::hetero_budget::{
    bias_cross_covariance, correlated_fused_bias, independent_fused_bias, integrity_bias_overbound,
    SourceBias, UtcRealizer,
};

fn main() {
    // Five heterogeneous sources; sources 0 and 1 both trace to UTC(USNO) (r=1).
    let biases = [
        SourceBias {
            expanded_uncertainty_s: 4e-9,
            coverage_factor: 2.0,
            ageing_inflation_s: 1e-9,
            realizer: UtcRealizer(1),
        }, // GNSS-PPP via UTC(USNO)
        SourceBias {
            expanded_uncertainty_s: 3e-9,
            coverage_factor: 2.0,
            ageing_inflation_s: 0.5e-9,
            realizer: UtcRealizer(1),
        }, // PTP via UTC(USNO)
        SourceBias {
            expanded_uncertainty_s: 6e-9,
            coverage_factor: 2.0,
            ageing_inflation_s: 0.0,
            realizer: UtcRealizer(2),
        }, // eLoran via UTC(other)
        SourceBias {
            expanded_uncertainty_s: 8e-9,
            coverage_factor: 2.0,
            ageing_inflation_s: 2e-9,
            realizer: UtcRealizer(3),
        }, // LEO-STL
        SourceBias {
            expanded_uncertainty_s: 5e-9,
            coverage_factor: 2.0,
            ageing_inflation_s: 1e-9,
            realizer: UtcRealizer(4),
        }, // local oscillator disciplined
    ];
    let tail = 2e-7;
    let ob: Vec<f64> = biases
        .iter()
        .map(|b| integrity_bias_overbound(b, tail))
        .collect();
    let sig_noise = [2e-9, 3e-9, 5e-9, 8e-9, 4e-9];
    let inv: f64 = sig_noise.iter().map(|s| 1.0 / (s * s)).sum();
    let w: Vec<f64> = sig_noise.iter().map(|s| (1.0 / (s * s)) / inv).collect();

    println!("Per-source UTC(k) bias overbounds @ tail {tail:.0e} (ns):");
    for (i, b) in ob.iter().enumerate() {
        println!(
            "  source {i} (realizer {}): {:.2}",
            biases[i].realizer.0,
            b * 1e9
        );
    }

    let rho = 0.7;
    let sigma = bias_cross_covariance(&biases, &ob, rho);
    let corr = correlated_fused_bias(&w, &sigma);
    let indep = independent_fused_bias(&w, &sigma);
    println!(
        "\nFused traceability bias:  correlated = {:.3} ns,  naive-independent = {:.3} ns",
        corr * 1e9,
        indep * 1e9
    );
    println!(
        "  -> ignoring the shared-UTC(USNO) correlation UNDER-bounds the bias by {:.3} ns (unsafe).",
        (corr - indep) * 1e9
    );

    // Common-mode: a shift common to all sources. Model Omega with shared coupling.
    let n = 5;
    let omega: Vec<Vec<f64>> = (0..n)
        .map(|i| {
            (0..n)
                .map(|j| {
                    if i == j {
                        (sig_noise[i] * 1e9).powi(2)
                    } else {
                        2.0
                    }
                })
                .collect()
        })
        .collect();
    let null = [0.3, -0.2, 0.1, -0.15, 0.05];
    let shift = [1.5, 1.5, 1.5, 1.5, 1.5];
    let s_null = common_mode_consistency(&omega, &null).unwrap().value;
    let s_shift = common_mode_consistency(&omega, &shift).unwrap().value;
    println!(
        "\nCommon-mode statistic:  null residual = {:.2},  common-mode shift = {:.2}",
        s_null, s_shift
    );
    println!("  -> solution separation (contrasts) is blind to the shift; the statistic is not.");

    let blind = residual_outside_omega_bound(&omega, &shift, 3.0, 3.841);
    println!(
        "\nResidual-outside-Omega undetectable ceiling for the modelled common axis: {blind:.3}"
    );
    println!(
        "  (a shared-reference fault outside the modelled Omega stays an irreducible blind spot.)"
    );
}
