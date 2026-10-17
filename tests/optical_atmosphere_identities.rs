// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered bars A4, A6 and the source half of A7
//! (xval/optical-atmosphere/PREREGISTRATION.md): closed-form identities of the site-diversity
//! model, bit-exact coupling to the holdover module, and a portable-maths source guard.

use kshana::holdover::{coast_phase_sigma, phase_to_range_m};
use kshana::optical_outage_holdover::{clock_psds, couple};
use kshana::optical_sitediv::{independent_union, network_availability, uniform_correlation};
use kshana::optical_weather::OutageModel;

const AVAIL_GRID: &[&[f64]] = &[
    &[0.3, 0.5],
    &[0.62, 0.62, 0.62],
    &[0.6, 0.7, 0.5, 0.65],
    &[0.05, 0.9, 0.4],
    &[0.99, 0.2, 0.2, 0.2, 0.2],
    &[0.1, 0.1, 0.1, 0.1, 0.1, 0.1],
];
const RHO_GRID: &[f64] = &[0.0, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99];

#[test]
fn bar_a4_diversity_limits() {
    let mut worst_rho0 = 0f64;
    let mut worst_rho1 = 0f64;
    let (mut mono_n_violations, mut mono_rho_violations) = (0, 0);
    for a in AVAIL_GRID {
        let n = a.len();
        // rho = 0 -> independent union
        let v0 = network_availability(a, &uniform_correlation(n, 0.0));
        worst_rho0 = worst_rho0.max((v0 - independent_union(a)).abs());
        // rho = 1 -> the best single site; identical sites -> the single-site availability
        let v1 = network_availability(a, &uniform_correlation(n, 1.0));
        let best = a.iter().cloned().fold(0.0, f64::max);
        worst_rho1 = worst_rho1.max((v1 - best).abs());
        if a.iter().all(|x| *x == a[0]) {
            worst_rho1 = worst_rho1.max((v1 - a[0]).abs());
        }
        // non-increasing in rho
        let mut prev = f64::INFINITY;
        for &r in RHO_GRID {
            let v = network_availability(a, &uniform_correlation(n, r));
            if v > prev + 1e-12 {
                mono_rho_violations += 1;
            }
            prev = v;
        }
        // non-decreasing in N
        for &r in RHO_GRID {
            let mut prev = 0.0;
            for k in 1..=n {
                let v = network_availability(&a[..k], &uniform_correlation(k, r));
                if v < prev - 1e-12 {
                    mono_n_violations += 1;
                }
                prev = v;
            }
        }
    }
    eprintln!("A4 rho0 worst {worst_rho0:e}; rho1 worst {worst_rho1:e}; violations N {mono_n_violations} rho {mono_rho_violations}");
    assert!(worst_rho0 <= 1e-12 && worst_rho1 <= 1e-12);
    assert_eq!((mono_n_violations, mono_rho_violations), (0, 0));
}

#[test]
fn bar_a6_holdover_coupling_is_bit_exact() {
    let mut n = 0;
    for clock in ["tcxo", "ocxo", "rafs", "uso", "dsac", "csac", "optical-lattice", "trapped-ion", "mercury-ion"] {
        let (q1, q2, q3) = clock_psds(clock).unwrap();
        for mean_h in [1.0, 6.0, 48.0] {
            for sigma in [0.5, 1.0, 1.5] {
                let o = OutageModel { mean_s: mean_h * 3600.0, sigma_ln: sigma };
                let c = couple(clock, 0.7, &o, 1e-7).unwrap();
                for e in &c.errors {
                    let sx = coast_phase_sigma(q1, q2, q3, e.duration_s);
                    assert_eq!(e.timing_sigma_s.to_bits(), sx.to_bits());
                    assert_eq!(e.range_sigma_m.to_bits(), phase_to_range_m(sx).to_bits());
                    n += 1;
                }
            }
        }
    }
    assert_eq!(n, 9 * 3 * 3 * 4);
}

/// Source half of A7: the new modules' shipped code calls no non-portable transcendental
/// (everything goes through `PortableFloat`), so native and wasm builds take the same route.
#[test]
fn bar_a7_source_uses_portable_maths_only() {
    const FILES: &[&str] = &[
        "src/optical_atmosphere.rs",
        "src/optical_weather.rs",
        "src/optical_sitediv.rs",
        "src/optical_techniques.rs",
        "src/optical_outage_holdover.rs",
        "src/optical_atmosphere_scenario.rs",
    ];
    const FORBIDDEN: &[&str] = &[
        ".sin(", ".cos(", ".tan(", ".exp(", ".ln(", ".log10(", ".log2(", ".powf(", ".powi(",
        ".asin(", ".acos(", ".atan(", ".atan2(", ".sinh(", ".cosh(", ".cbrt(", ".exp_m1(",
        ".ln_1p(", ".hypot(",
    ];
    for f in FILES {
        let src = std::fs::read_to_string(f).unwrap();
        let shipped = src.split("#[cfg(test)]").next().unwrap();
        for (i, line) in shipped.lines().enumerate() {
            let code = line.split("//").next().unwrap();
            for bad in FORBIDDEN {
                assert!(!code.contains(bad), "{f}:{}: non-portable call {bad}", i + 1);
            }
        }
    }
}
