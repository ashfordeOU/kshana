// SPDX-License-Identifier: AGPL-3.0-only
//! Engineering check of the engine's NAIF kernel reader (`naif_kernel`) against the SPICE
//! Toolkit on the same kernel records. This is a regression guard for the reader, not a
//! validation claim of its own: the lunar VLBI row's oracle is ANISE
//! (`tests/lunar_vlbi_anise_oracle.rs`).
//!
//! Kernels: the 2023-12-31..2024-01-02 cuts of `de440s.bsp`, `earth_latest_high_prec.bpc` and
//! `moon_pa_de440_200625.bpc` in `tests/fixtures/lunar_vlbi_anise_oracle/kernels/`, whose
//! records the generator checked to evaluate bit for bit like the full kernels in SPICE. SPICE
//! values (CSPICE N0067 via spiceypy 8.2.0, `spkgeo` and `pxform`) at the 25 hourly epochs are in
//! `spice_reader_check.csv` beside them.

use kshana::naif_kernel::{naif_et_from_utc, PckKernel, SpkKernel};

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lunar_vlbi_anise_oracle/kernels/"
);

fn kernels() -> (SpkKernel, PckKernel, PckKernel) {
    let p = |f: &str| std::path::PathBuf::from(format!("{DIR}{f}"));
    (
        SpkKernel::open(&p("de440s_2024-01-01.bsp")).expect("spk"),
        PckKernel::open(&p("earth_itrf93_2024-01-01.bpc")).expect("earth pck"),
        PckKernel::open(&p("moon_pa_de440_2024-01-01.bpc")).expect("moon pck"),
    )
}

fn spice_rows() -> Vec<Vec<f64>> {
    std::fs::read_to_string(format!("{DIR}spice_reader_check.csv"))
        .expect("spice_reader_check.csv")
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(',').map(|x| x.parse().expect("number")).collect())
        .collect()
}

#[test]
fn reader_matches_spice_on_the_cut_kernels() {
    let (spk, earth, moon) = kernels();
    let rows = spice_rows();
    assert_eq!(rows.len(), 25);
    let (mut d_pos, mut d_vel, mut d_rot, mut d_et) = (0.0f64, 0.0f64, 0.0f64, 0.0f64);
    for r in &rows {
        let hour = r[0];
        let (hi, lo) = naif_et_from_utc(2_460_310.5, hour * 3_600.0);
        d_et = d_et.max(((hi - r[1]) + lo).abs());
        // Evaluate at SPICE's own ET so the reader, not the time conversion, is checked.
        let (eh, el) = (r[1].round(), r[1] - r[1].round());
        let m = spk.state(301, 399, eh, el).unwrap();
        let e = spk.state(399, 0, eh, el).unwrap();
        for k in 0..3 {
            d_pos = d_pos.max((m[0][k] - r[2 + k] * 1e3).abs());
            d_vel = d_vel.max((m[1][k] - r[5 + k] * 1e3).abs());
            d_pos = d_pos.max((e[0][k] - r[8 + k] * 1e3).abs());
            d_vel = d_vel.max((e[1][k] - r[11 + k] * 1e3).abs());
        }
        let (ri, _) = earth.rotation_from_j2000(3000, eh, el).unwrap();
        let (rp, _) = moon.rotation_from_j2000(31008, eh, el).unwrap();
        for i in 0..3 {
            for j in 0..3 {
                d_rot = d_rot.max((ri[i][j] - r[14 + 3 * i + j]).abs());
                d_rot = d_rot.max((rp[i][j] - r[23 + 3 * i + j]).abs());
            }
        }
    }
    eprintln!(
        "reader vs SPICE: position {d_pos:.3e} m, velocity {d_vel:.3e} m/s, rotation element \
         {d_rot:.3e}, ET {d_et:.3e} s"
    );
    // Earth barycentric positions are 1.5e11 m: 1e-4 m is a few units in the last place.
    assert!(d_pos < 1e-4, "position {d_pos}");
    assert!(d_vel < 1e-9, "velocity {d_vel}");
    // The lunar kernel stores its third Euler angle unwrapped (about 4.6e3 rad, one unit in the
    // last place 9e-13 rad), so two evaluations differ at the 1e-12 level.
    assert!(d_rot < 1e-11, "rotation {d_rot}");
    assert!(d_et < 1e-7, "ET {d_et}");
}
