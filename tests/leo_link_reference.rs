// SPDX-License-Identifier: AGPL-3.0-only
//! External oracles for the LEO-PNT link physics of the `leo-pass` kind.
//!
//! Every test here reproduces a published setup and pins the published figure within a stated
//! tolerance:
//!
//! * ITU-R P.838-3 Table 5: the specific-attenuation coefficients at 115 frequencies.
//! * ITU-R P.618-14 § 2.2.1.1 rain attenuation and § 2.4.1 scintillation: the ITU-R Study
//!   Group 3 validation examples (CG-3M3J-13-ValEx-Rev8.3.0).
//! * ITU-R P.2109 building entry loss: the Study Group 3 "Clutter and BEL" workbook values.
//! * IS-GPS-200: the L1/L2 group-delay ratio `γ = (77/60)²` from first-order ionospheric scaling.
//! * Friis free-space loss in its kilometre–megahertz form, `32.45 + 20 log d + 20 log f`.
//! * Leclère, Marathe and Reid (arXiv 2509.19551) Table 1: orbital speed, maximum Earth-fixed
//!   speed, maximum relative speed to a static user and maximum L1/L5 carrier Doppler for
//!   Pulsar IOV (520 km, 97°), Pulsar FOC polar (1080 km, 97°), Pulsar FOC inclined
//!   (1080 km, 53°) and GPS (20180 km, 55°).
//!
//! The fixtures under `tests/fixtures/leo_link/` carry their source URLs and retrieval date.

use kshana::leo_link::geometry::max_static_user_range_rate;
use kshana::leo_link::iono::{group_delay_m, iono_free_noise_amplification, TECU};
use kshana::leo_link::itu::{
    p2109_building_entry_loss_db, p618_rain_attenuation_db, p618_scintillation_db,
    p838_coefficients, BuildingClass, RainPath, ScintillationPath,
};
use kshana::leo_link::{fspl_db, C_M_S};

fn rows(text: &str) -> Vec<Vec<String>> {
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .skip(1)
        .map(|l| l.split(',').map(|c| c.trim().to_string()).collect())
        .collect()
}

fn decimals(s: &str) -> i32 {
    s.split_once('.').map_or(0, |(_, d)| d.len() as i32)
}

#[test]
fn p838_coefficients_reproduce_table5_to_its_printed_digits() {
    // Table 5 rounds each entry to its printed digits; the equations reproduce every entry of
    // the 115 rows (1 GHz to 1000 GHz) within a tolerance of 0.6 of the last printed digit
    // (worst observed 0.51).
    let data = rows(include_str!("fixtures/leo_link/p838_3_table5.csv"));
    assert_eq!(data.len(), 115);
    let mut worst = 0.0_f64;
    for r in &data {
        let f: f64 = r[0].parse().unwrap();
        let c = p838_coefficients(f);
        for (i, v) in [c.k_h, c.alpha_h, c.k_v, c.alpha_v].into_iter().enumerate() {
            let s = &r[i + 1];
            let ulp = 10f64.powi(-decimals(s));
            let err = (v - s.parse::<f64>().unwrap()).abs() / ulp;
            worst = worst.max(err);
            assert!(
                err < 0.6,
                "{f} GHz column {i}: {v} vs {s} ({err} of the last digit)"
            );
        }
    }
    assert!(worst > 0.3, "the comparison must be live: worst {worst}");
}

#[test]
fn p618_rain_attenuation_matches_the_itu_validation_examples() {
    // 56 cases: 5 sites, 14.25 and 29 GHz, 0.001 % to 1 %. The procedure reproduces the
    // Study Group 3 values to 1e-4 dB (observed 5e-6 dB).
    let data = rows(include_str!(
        "fixtures/leo_link/p618_14_rain_attenuation.csv"
    ));
    assert_eq!(data.len(), 56);
    for r in &data {
        let v: Vec<f64> = r.iter().map(|c| c.parse().unwrap()).collect();
        let path = RainPath {
            lat_deg: v[0],
            hs_km: v[2],
            el_deg: v[3],
            f_ghz: v[4],
            tau_deg: v[5],
            r001_mm_h: v[7],
            rain_height_km: v[8],
        };
        let a = p618_rain_attenuation_db(&path, v[6]);
        assert!((a - v[9]).abs() < 1e-4, "{r:?}: {a}");
    }
}

#[test]
fn p618_scintillation_matches_the_itu_validation_examples() {
    // 42 cases: 7 sites, 14.25 and 20 GHz, 0.01 % to 1 %, a 1 m antenna of efficiency 0.65.
    let data = rows(include_str!("fixtures/leo_link/p618_14_scintillation.csv"));
    assert_eq!(data.len(), 42);
    for r in &data {
        let v: Vec<f64> = r.iter().map(|c| c.parse().unwrap()).collect();
        let (a, in_range) = p618_scintillation_db(
            &ScintillationPath {
                f_ghz: v[2],
                el_deg: v[3],
                n_wet: v[7],
                diameter_m: v[5],
                efficiency: v[6],
            },
            v[4],
        );
        assert!(in_range);
        assert!((a - v[8]).abs() < 1e-5, "{r:?}: {a}");
    }
}

#[test]
fn p2109_building_entry_loss_matches_the_itu_workbook() {
    // 568 values: 28 GHz at horizontal incidence and 2 GHz at 45 deg, both building classes,
    // probabilities from 1e-7 to 0.998. The workbook prints three decimals; the model
    // reproduces every value to 0.001 dB.
    let data = rows(include_str!("fixtures/leo_link/p2109_bel.csv"));
    assert_eq!(data.len(), 568);
    for r in &data {
        let f: f64 = r[0].parse().unwrap();
        let el: f64 = r[1].parse().unwrap();
        let class = match r[2].as_str() {
            "1" => BuildingClass::Traditional,
            _ => BuildingClass::ThermallyEfficient,
        };
        let p: f64 = r[3].parse::<f64>().unwrap() / 100.0;
        let want: f64 = r[4].parse().unwrap();
        let got = p2109_building_entry_loss_db(f, p, class, el);
        assert!((got - want).abs() < 1e-3, "{r:?}: {got}");
    }
}

#[test]
fn first_order_iono_reproduces_the_is_gps_200_group_delay_ratio() {
    // IS-GPS-200 20.3.3.3.3.2: the L2 group delay is gamma = (77/60)^2 times the L1 delay.
    let (l1, l2) = (1_575.42e6, 1_227.60e6);
    let stec = 37.0 * TECU;
    let gamma = group_delay_m(stec, l2) / group_delay_m(stec, l1);
    assert!((gamma - (77.0f64 / 60.0).powi(2)).abs() < 1e-12);
    // The ionosphere-free combination's equal-noise amplification follows from the same
    // ratio: 2.978 for L1/L2 and 2.588 for L1/L5.
    let a12 = iono_free_noise_amplification(l1, l2, 1.0, 1.0);
    let a15 = iono_free_noise_amplification(l1, 1_176.45e6, 1.0, 1.0);
    assert!((a12 - 2.978).abs() < 5e-4, "{a12}");
    assert!((a15 - 2.588).abs() < 5e-4, "{a15}");
}

#[test]
fn free_space_loss_is_the_friis_kilometre_megahertz_form() {
    for (d_km, f_mhz) in [
        (1.0, 1.0),
        (510.0, 1191.795),
        (2913.6, 1593.3225),
        (20_200.0, 1575.42),
    ] {
        let want = 32.4478 + 20.0 * f64::log10(d_km) + 20.0 * f64::log10(f_mhz);
        let got = fspl_db(d_km * 1e3, f_mhz * 1e6);
        assert!(
            (got - want).abs() < 1e-4,
            "{d_km} km {f_mhz} MHz: {got} vs {want}"
        );
    }
}

#[test]
fn doppler_envelope_reproduces_the_pulsar_paper_table_1() {
    // arXiv 2509.19551 Table 1 (static receiver, spherical Earth of 6371 km, Earth rotation the
    // only other effect). Tolerance 0.05 % on every speed and Doppler.
    let x1 = 1_593.322_5e6;
    let x5 = 1_190.516_25e6;
    let l1 = 1_575.42e6;
    let l5 = 1_176.45e6;
    let re = 6_371_000.0;
    let cases = [
        // (altitude m, inclination deg, orbital speed, max ECEF speed, max relative speed,
        //  L1-band carrier, max L1 Doppler, L5-band carrier, max L5 Doppler)
        (
            520e3, 97.0, 7605.5, 7682.9, 7103.2, x1, 37_751.7, x5, 28_207.7,
        ),
        (
            1080e3, 97.0, 7314.1, 7400.0, 6327.4, x1, 33_628.5, x5, 25_126.9,
        ),
        (
            1080e3, 53.0, 7314.1, 7000.6, 5985.9, x1, 31_813.4, x5, 23_770.7,
        ),
        (
            20_180e3, 55.0, 3874.6, 3186.8, 764.7, l1, 4_018.4, l5, 3_000.8,
        ),
    ];
    let close = |got: f64, want: f64| (got - want).abs() <= 5e-4 * want;
    for (alt, inc, v_orb, v_ecef, v_rel, f1, d1, f5, d5) in cases {
        let e = max_static_user_range_rate(alt, f64::to_radians(inc), re);
        assert!(close(e.orbital_speed_m_s, v_orb), "{alt} {inc}: {e:?}");
        assert!(close(e.max_ecef_speed_m_s, v_ecef), "{alt} {inc}: {e:?}");
        assert!(close(e.max_range_rate_m_s, v_rel), "{alt} {inc}: {e:?}");
        assert!(
            close(e.max_range_rate_m_s * f1 / C_M_S, d1),
            "{alt} {inc} L1"
        );
        assert!(
            close(e.max_range_rate_m_s * f5 / C_M_S, d5),
            "{alt} {inc} L5"
        );
    }
}
