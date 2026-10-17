// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered bar A5 (xval/optical-atmosphere/PREREGISTRATION.md): the optical link budget
//! and the existing site-availability model are bit-identical to the base commit 5eac3b61 when
//! no atmosphere is supplied. The expected digest was produced by running this same grid at
//! 5eac3b61, before any of the 0.37 optical-atmosphere code existed.

use kshana::optical_availability::{
    correlated_union_availability, default_network, independent_union_availability,
};
use kshana::optical_linkbudget::{optical_link_budget, OpticalLinkParams};

fn fnv(h: &mut u64, v: f64) {
    for b in v.to_bits().to_le_bytes() {
        *h ^= b as u64;
        *h = h.wrapping_mul(0x100000001b3);
    }
}

/// FNV-1a digest of every output over 1,000 deterministic parameter sets plus the default network.
fn digest() -> u64 {
    let mut h = 0xcbf29ce484222325u64;
    let mut n = 0;
    for wl in [0.85e-6, 1.55e-6] {
        for range in [4.0e5, 1.0e6, 3.6e7, 3.84e8, 1.0e9] {
            for rx in [0.1, 0.4, 0.85, 2.0, 4.0] {
                for atm in [0.0, 0.5, 3.0, 12.0, 30.0] {
                    for point in [0.0, 3.0] {
                        for eff in [0.3, 0.9] {
                            let p = OpticalLinkParams {
                                wavelength_m: wl,
                                tx_power_w: 1.0e-3 + 0.37 * n as f64 * 1.0e-3,
                                tx_aperture_m: 0.1 + 0.002 * n as f64,
                                rx_aperture_m: rx,
                                range_m: range,
                                optics_efficiency: eff,
                                detector_efficiency: 0.7,
                                atmospheric_loss_db: atm,
                                pointing_loss_db: point,
                            };
                            let r = optical_link_budget(&p);
                            for v in [
                                r.divergence_rad,
                                r.footprint_m,
                                r.geometric_loss_db,
                                r.total_loss_db,
                                r.received_power_w,
                                r.photon_energy_j,
                                r.photon_rate_hz,
                            ] {
                                fnv(&mut h, v);
                            }
                            n += 1;
                        }
                    }
                }
            }
        }
    }
    assert_eq!(n, 1000);
    let net = default_network();
    fnv(&mut h, independent_union_availability(&net));
    for rho in [0.0, 0.25, 0.5, 0.75, 1.0] {
        fnv(&mut h, correlated_union_availability(&net, rho));
    }
    h
}

#[test]
fn bar_a5_no_moved_output() {
    let d = digest();
    eprintln!("A5 digest {d:016x}");
    assert_eq!(d, EXPECTED, "optical link budget / availability output moved: {d:016x}");
}

const EXPECTED: u64 = 0xfb00c966de4299bc;
