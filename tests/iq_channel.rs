// SPDX-License-Identifier: AGPL-3.0-only
//! Integration test of the GNSS IQ propagation channel (`kshana::iq::channel`): a full
//! effect chain evaluated on two carriers stays consistent, and reflections added after the
//! atmosphere inherit it.

use kshana::gnss_sim::{KlobucharCoeffs, Meteo};
use kshana::iq::channel::iono::{IonoSource, Ionosphere};
use kshana::iq::channel::multipath::{excess_path_m, Ground, GroundReflector};
use kshana::iq::channel::scint::{ScintParams, Scintillation};
use kshana::iq::channel::tropo::Troposphere;
use kshana::iq::channel::{ChannelModel, Composite, LineOfSight};
use kshana::iq::C_M_PER_S;
use std::f64::consts::PI;

const L1: f64 = 1_575_420_000.0;
const L5: f64 = 1_176_450_000.0;

fn geom() -> LineOfSight {
    LineOfSight {
        el_rad: 25f64.to_radians(),
        az_rad: 2.0,
        range_m: 22_500_000.0,
        range_rate_mps: 150.0,
        lat_rad: 51f64.to_radians(),
        lon_rad: 0.1f64.to_radians(),
        height_m: 50.0,
    }
}

fn chain(f: f64) -> Composite {
    Composite::new(f)
        .with(Ionosphere::new(IonoSource::Klobuchar {
            coeffs: KlobucharCoeffs::default(),
            gps_sod_at_t0: 48_000.0,
        }))
        .with(Troposphere::new(Meteo::default(), 100.0))
        .with(GroundReflector::new(1.8, Ground::WET))
}

#[test]
fn dual_frequency_chain_is_consistent_with_a_first_order_ionosphere() {
    let g = geom();
    let s1 = chain(L1).snapshot(12, 10.0, &g);
    let s5 = chain(L5).snapshot(12, 10.0, &g);
    let code = |s: &kshana::iq::ChannelSnapshot| s.paths[0].group_delay_s * C_M_PER_S;
    let carrier = |s: &kshana::iq::ChannelSnapshot, f: f64| {
        -s.paths[0].carrier_phase_rad * C_M_PER_S / (2.0 * PI * f)
    };
    // Closed form: P_f = ρ + T + I1·(f1/f)², Φ_f = ρ + T − I1·(f1/f)².
    let i1 = (code(&s1) - carrier(&s1, L1)) / 2.0;
    let i5 = (code(&s5) - carrier(&s5, L5)) / 2.0;
    assert!(i1 > 0.0);
    assert!((i5 / i1 - (L1 / L5).powi(2)).abs() < 1e-6, "{}", i5 / i1);
    // The non-dispersive part (range + troposphere) is the same on both carriers.
    assert!(((code(&s1) - i1) - (code(&s5) - i5)).abs() < 1e-6);
}

#[test]
fn reflection_inherits_the_atmosphere_when_added_after_it() {
    let g = geom();
    let s = chain(L1).snapshot(3, 0.0, &g);
    assert_eq!(s.paths.len(), 2);
    let ex = (s.paths[1].group_delay_s - s.paths[0].group_delay_s) * C_M_PER_S;
    assert!((ex - excess_path_m(1.8, g.el_rad)).abs() < 1e-6);
}

#[test]
fn scintillated_chain_is_deterministic_per_seed() {
    let g = geom();
    let mk = |seed| chain(L1).with(Scintillation::new(ScintParams::new(0.5, 0.6), seed));
    let (mut a, mut b, mut c) = (mk(4), mk(4), mk(5));
    let mut differs = false;
    for k in 0..200 {
        let t = k as f64 * 0.02;
        let (sa, sb, sc) = (
            a.snapshot(1, t, &g),
            b.snapshot(1, t, &g),
            c.snapshot(1, t, &g),
        );
        assert_eq!(sa, sb);
        differs |= sa != sc;
    }
    assert!(differs);
}
