// SPDX-License-Identifier: AGPL-3.0-only
//! CR3BP rotating states mapped to Moon-centred ICRF on the DE440 Earth-Moon line
//! (`cr3bp::to_moon_centred_icrf_de440`) against a SPICE two-vector dynamic frame.
//!
//! Pre-registration: `docs/design/evidence/rm34-cr3bp-to-mci/PREREGISTRATION.md` (2313eb1b,
//! amended before any run in d5ef79b3). Oracle: `tests/fixtures/cr3bp_to_mci_spice/` (SPICE
//! `sxform('EM_ROT', 'J2000')` of the frame kernel `em_rot.tf` on de440s; NOTICE.md). The engine
//! reads the Moon from the committed de440s cut in the same directory, which reproduces de440s
//! bit for bit over the window.
//!
//! Bars: position within 1 mm, velocity within 1e-6 m/s, at 12 epochs x 6 states; the inverse
//! returns the input within 1e-12 (internal).
//!
//! ## Result
//!
//! First run 2026-10-13: all 72 cases hold. Worst position 1.81e-7 m (bar 1 mm), velocity
//! 1.19e-9 m/s (bar 1e-6), inverse 2.7e-15 (bar 1e-12). Information: without the out-of-plane
//! frame rate (the amendment) the velocity would be up to 8.0e-2 m/s off.

use kshana::cr3bp::{
    from_moon_centred_icrf, to_moon_centred_icrf, to_moon_centred_icrf_de440, Cr3bpState,
};
use kshana::ephem_provider::{naif_code, KernelEphemeris};
use kshana::jd2::Jd2;

const MU: f64 = 1.215058560962404e-02;
const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/cr3bp_to_mci_spice"
);

#[test]
fn cr3bp_to_mci_matches_a_spice_two_vector_frame() {
    let kernel = KernelEphemeris::open(std::path::Path::new(&format!(
        "{DIR}/de440s_2024-12-31_2025-01-30.bsp"
    )))
    .expect("the cut opens");
    let text = std::fs::read_to_string(format!("{DIR}/reference.csv")).expect("reference");
    let (mut wr, mut wv, mut wi, mut n) = (0.0_f64, 0.0_f64, 0.0_f64, 0);
    for line in text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
    {
        let f: Vec<&str> = line.split(',').collect();
        let jd: f64 = f[0].parse().unwrap();
        let x: Vec<f64> = f[2..].iter().map(|v| v.parse().unwrap()).collect();
        let s = Cr3bpState {
            r: [x[0], x[1], x[2]],
            v: [x[3], x[4], x[5]],
        };
        let (r, v) = to_moon_centred_icrf_de440(&s, MU, &kernel, jd).expect("kernel covers");
        let dr = (0..3)
            .map(|k| (r[k] - x[6 + k]).powi(2))
            .sum::<f64>()
            .sqrt();
        let dv = (0..3)
            .map(|k| (v[k] - x[9 + k]).powi(2))
            .sum::<f64>()
            .sqrt();
        let moon = kernel
            .state(naif_code::MOON, naif_code::EARTH, Jd2::new(jd))
            .expect("state");
        let back = from_moon_centred_icrf(r, v, MU, &moon);
        let di = (0..3)
            .map(|k| (back.r[k] - s.r[k]).abs().max((back.v[k] - s.v[k]).abs()))
            .fold(0.0_f64, f64::max);
        // Information: the in-plane approximation (no out-of-plane frame rate).
        let flat = [moon[0], moon[1], [0.0; 3]];
        let (_, vf) = to_moon_centred_icrf(&s, MU, &flat);
        let dvf = (0..3)
            .map(|k| (vf[k] - x[9 + k]).powi(2))
            .sum::<f64>()
            .sqrt();
        println!(
            "{jd:.1} {:<13} position {dr:.3e} m velocity {dv:.3e} m/s inverse {di:.1e} \
             (in-plane approximation {dvf:.3e} m/s)",
            f[1]
        );
        wr = wr.max(dr);
        wv = wv.max(dv);
        wi = wi.max(di);
        n += 1;
    }
    println!("{n} cases: worst position {wr:.3e} m, velocity {wv:.3e} m/s, inverse {wi:.1e}");
    assert_eq!(n, 72);
    assert!(wr <= 1e-3, "position {wr:.3e} m > 1 mm");
    assert!(wv <= 1e-6, "velocity {wv:.3e} m/s > 1e-6 m/s");
    assert!(wi <= 1e-12, "inverse {wi:.1e} > 1e-12");
}
