// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered bars A1-A3 (xval/optical-atmosphere/PREREGISTRATION.md): kshana's optical
//! atmosphere against the independent mpmath oracle (xval/optical-atmosphere/oracle.py).

use kshana::optical_atmosphere::*;

const REF: &str = include_str!("fixtures/optical_atmosphere/reference.txt");

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs().max(f64::MIN_POSITIVE)
}

#[test]
fn bars_a1_a2_a3_against_oracle() {
    let (mut n_ry, mut n_sc, mut n_cl, mut n_ca, mut n_ap, mut n_fd) = (0, 0, 0, 0, 0, 0);
    let (mut w_ap, mut w_fd) = (0f64, 0f64);
    let (mut w_ry, mut w_sc, mut w_cl, mut w_ca) = (0f64, 0f64, 0f64, 0f64);
    for line in REF.lines().filter(|l| !l.starts_with('#') && !l.is_empty()) {
        let t: Vec<&str> = line.split_whitespace().collect();
        let f = |i: usize| t[i].parse::<f64>().unwrap();
        match t[0] {
            "RYTOV" => {
                let prof = HvProfile {
                    ground_cn2: f(5),
                    wind_rms_ms: f(6),
                };
                let wave = if t[7] == "plane" {
                    Wave::Plane
                } else {
                    Wave::Spherical
                };
                let dir = if t[8] == "down" {
                    Direction::Downlink
                } else {
                    Direction::Uplink
                };
                let got =
                    rytov_variance(f(1) * 1e-9, f(2).to_radians(), f(3), f(4), &prof, wave, dir);
                w_ry = w_ry.max(rel(got, f(9)));
                n_ry += 1;
            }
            "SCINT" => {
                let wave = if t[1] == "plane" {
                    Wave::Plane
                } else {
                    Wave::Spherical
                };
                let s = scintillation(f(2), wave);
                for (g, i) in [
                    (s.sigma2_lnx, 3),
                    (s.sigma2_lny, 4),
                    (s.scintillation_index, 5),
                    (s.alpha, 6),
                    (s.beta, 7),
                ] {
                    w_sc = w_sc.max(rel(g, f(i)));
                }
                n_sc += 1;
            }
            "CLOUD" => {
                w_cl = w_cl.max(rel(cloud_optical_depth(f(1), f(2) * 1e-6), f(3)));
                n_cl += 1;
            }
            "CLEAR" => {
                let p = ClearAirParams {
                    visibility_km: f(2),
                    aerosol_scale_height_m: f(5),
                };
                w_ca = w_ca.max(rel(
                    clear_air_optical_depth(f(1) * 1e-9, f(3), f(4), &p),
                    f(6),
                ));
                n_ca += 1;
            }
            "APERTURE" => {
                let wave = if t[4] == "plane" {
                    Wave::Plane
                } else {
                    Wave::Spherical
                };
                let a = aperture_averaging_factor(f(1) * 1e-9, f(2), f(3), wave);
                w_ap = w_ap.max(rel(a, f(5)));
                n_ap += 1;
            }
            "FADE" => {
                let got = gamma_gamma_cdf(f(5), f(6), 10f64.powf(-f(4) / 10.0));
                w_fd = w_fd.max((got.log10() - f(7).log10()).abs());
                n_fd += 1;
            }
            _ => {}
        }
    }
    eprintln!("aperture n={n_ap} worst={w_ap:e}; fade n={n_fd} worst log10 {w_fd:e}");
    eprintln!("A1 rytov n={n_ry} worst={w_ry:e}; A2 scint n={n_sc} worst={w_sc:e}; A3 cloud n={n_cl} worst={w_cl:e}; clear n={n_ca} worst={w_ca:e}");
    assert!(n_ry >= 200 && n_sc >= 16 && n_cl == 12 && n_ca == 24);
    assert!(w_ry <= 1e-6, "A1 rytov worst {w_ry:e}");
    assert!(w_sc <= 1e-6, "A2 scintillation worst {w_sc:e}");
    assert!(n_ap == 36 && n_fd == 96);
    assert!(w_ap <= 1e-6, "A2 aperture worst {w_ap:e}");
    assert!(w_fd <= 1e-6, "A2 fade probability worst log10 {w_fd:e}");
    assert!(
        w_cl <= 1e-12 && w_ca <= 1e-12,
        "A3 cloud {w_cl:e} clear {w_ca:e}"
    );
}
