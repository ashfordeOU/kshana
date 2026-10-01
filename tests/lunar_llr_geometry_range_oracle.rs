// SPDX-License-Identifier: AGPL-3.0-only
//! Measured-data comparison for the lunar LLR datum geometry substrate (`lunar_llr_geometry`):
//! predicted Earth-station to reflector ranges against archived ILRS lunar normal points.
//!
//! ## Pre-registration (tolerance fixed 2026-09-30 in the validation plan; operational details
//! fixed 2026-10-01T03:28Z in the batch pre-registration, before this ran)
//!
//! * Oracle (Measured): ILRS CRD lunar normal points from the EUROLAS Data Center (DGFI-TUM),
//!   2024-04 to 2024-06, the five legacy targets, committed byte for byte under
//!   `tests/fixtures/lunar_llr_geometry_range_oracle/normal_points_2024/` (provenance and
//!   checksums in that directory's `NOTICE.md` and `SHA256SUMS`). The committed 2015 slice
//!   (`tests/fixtures/lunar_llr/normal_points`) lies outside the 2024-2025 span of the module's
//!   orientation series, which clamps outside it, so it is run only as a recorded finding.
//! * Claim narrowed in writing: the reflector PA catalogue (`reflectors()`), the station
//!   catalogue (`stations()`) and the DE440 PA body-to-inertial placement
//!   (`lunar_orientation::de440_moon_pa_body_to_inertial`). The Moon centre is JPL DE440 through
//!   NAIF SPICE (spiceypy 8.2.0), written into `reference.csv` by `generate_reference.py`; the
//!   module's analytic Moon series is not part of this claim.
//! * Points: every normal point from a station in `stations()` (Grasse 7845, APOLLO 7045,
//!   Wettzell 8834, Matera 7941).
//! * Model: two-way light path with the station at transmit t0 and receive t0 + TOF and the
//!   reflector at t0 + TOF/2; stations through `lunar_vlbi::station_inertial_position` with
//!   IERS UT1-UTC and no polar motion (the module's stated caveat); Earth and Moon Shapiro delay;
//!   Mendes-Pavlis (2004) zenith delay with the FCULa mapping function (IERS Conventions 2010,
//!   Sect. 9.2) from each normal point's own meteorological record. No tides, no station
//!   eccentricity, no relativistic time-scale transformation.
//! * Tolerance: RMS of (c TOF / 2 - predicted one-way range) over the 2024 points at most
//!   **10 m**. PROMOTE only if that holds.
//!
//! ## Result (recorded 2026-10-01, not tuned): DISAGREES, the row stays MODELLED
//!
//! * 2024, 192 normal points (Grasse 151, APOLLO 32, Matera 9; none skipped): residual RMS
//!   **96.2 m**, mean 31.0 m, against the 10 m tolerance. Per station RMS: Grasse 103.0 m,
//!   APOLLO 74.0 m, Matera 10.9 m.
//! * The residual is reflector-dependent and changes sign across each day: Apollo 11 and
//!   Apollo 14 (the arrays furthest from the PA X-Z plane) swing by about +/-120 m with opposite
//!   signs, Apollo 15 by about +/-20 m. That is the signature of a rotation error about the PA Z
//!   axis of order 1.7e-4 rad, varying within each one-day interval of the orientation series,
//!   which is what element-wise linear interpolation of a matrix rotating 13 degrees a day gives.
//! * DIAGNOSTIC, not a promotion basis: with the orientation taken straight from the kernel
//!   (SPICE `pxform`, columns in `reference.csv`) and everything else unchanged, the RMS falls to
//!   22.7 m (Grasse 14.0 m, APOLLO 46.3 m, Matera 9.2 m). What remains is mostly the station
//!   catalogue (APOLLO is rounded to 0.001 deg, about 100 m) and the dropped polar motion. Even
//!   then the substrate would not meet 10 m.
//! * 2015 slice, finding only: RMS 2.18e6 m. The orientation series clamps to its 2024-01-01 row
//!   for any earlier epoch, so 2015 reflectors are placed with a 2024 orientation; nothing warns.
//!
//! The assertions pin these numbers, so a change to the catalogue, the series or the placement
//! that moves them fails here and sends the record back for re-examination.

use kshana::cio::gcrs_to_itrs_matrix;
use kshana::frames::Geodetic;
use kshana::lunar_llr_geometry::{reflectors, stations};
use kshana::lunar_orientation::de440_moon_pa_body_to_inertial;
use kshana::lunar_vlbi::station_inertial_position;
use kshana::timescales::{utc_to_tt, utc_to_ut1};

const CSV: &str = include_str!("fixtures/lunar_llr_geometry_range_oracle/reference.csv");

const RMS_TOL_M: f64 = 10.0;
const C: f64 = 299_792_458.0;
/// IERS Conventions 2010 Table 1.1 (TT-compatible) and the DE440 value; Shapiro inputs only.
const GM_EARTH: f64 = 3.986_004_418e14;
const GM_MOON: f64 = 4.902_800_1e12;

type V3 = [f64; 3];

fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn add(a: V3, b: V3) -> V3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn norm(a: V3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

struct Np {
    slice: String,
    station: u32,
    target: String,
    mjd: f64,
    sod: f64,
    tof: f64,
    wavelength_nm: f64,
    p_hpa: f64,
    t_k: f64,
    rh: f64,
    dut1: f64,
    moon: V3,
    /// Diagnostic only: MOON_PA_DE440 -> J2000 straight from the kernel (SPICE `pxform`).
    diag_rot: [[f64; 3]; 3],
}

fn normal_points() -> Vec<Np> {
    CSV.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 24, "bad row {l}");
            let p = |i: usize| f[i].parse::<f64>().unwrap_or_else(|e| panic!("{l}: {e}"));
            Np {
                slice: f[0].to_string(),
                station: f[1].parse().unwrap(),
                target: f[3].to_string(),
                mjd: p(4),
                sod: p(5),
                tof: p(6),
                wavelength_nm: p(7),
                p_hpa: p(8),
                t_k: p(9),
                rh: p(10),
                dut1: p(11),
                moon: [p(12), p(13), p(14)],
                diag_rot: [
                    [p(15), p(16), p(17)],
                    [p(18), p(19), p(20)],
                    [p(21), p(22), p(23)],
                ],
            }
        })
        .collect()
}

fn catalogue_station(id: u32) -> Option<Geodetic> {
    let name = match id {
        7845 => "Grasse",
        7045 => "APOLLO",
        8834 => "Wettzell",
        7941 => "Matera",
        _ => return None,
    };
    let s = stations().into_iter().find(|s| s.name == name)?;
    Some(Geodetic {
        lat_rad: s.lat_deg.to_radians(),
        lon_rad: s.lon_deg.to_radians(),
        alt_m: s.alt_m,
    })
}

fn catalogue_reflector(target: &str) -> V3 {
    let name = match target {
        "apollo11" => "Apollo11",
        "apollo14" => "Apollo14",
        "apollo15" => "Apollo15",
        "luna17" => "Lunokhod1",
        "luna21" => "Lunokhod2",
        other => panic!("unknown target {other}"),
    };
    reflectors()
        .into_iter()
        .find(|r| r.name == name)
        .expect("catalogued reflector")
        .pa_body_m
}

/// One-leg Shapiro delay (m): (2GM/c^2) ln((r1 + r2 + rho)/(r1 + r2 - rho)).
fn shapiro(gm: f64, r1: f64, r2: f64, rho: f64) -> f64 {
    2.0 * gm / (C * C) * ((r1 + r2 + rho) / (r1 + r2 - rho)).ln()
}

/// Mendes and Pavlis (2004) zenith delay (m), IERS Conventions 2010 eqs. 9.11-9.17.
fn mendes_pavlis_zenith(
    p_hpa: f64,
    t_k: f64,
    rh_pct: f64,
    lambda_um: f64,
    lat: f64,
    h_m: f64,
) -> f64 {
    let sigma2 = 1.0 / (lambda_um * lambda_um);
    let (k0, k1, k2, k3) = (238.0185, 19_990.975, 57.362, 579.551_74);
    let c_co2 = 1.0 + 0.534e-6 * (375.0 - 450.0);
    let f_h = 1e-2
        * (k1 * (k0 + sigma2) / ((k0 - sigma2) * (k0 - sigma2))
            + k3 * (k2 + sigma2) / ((k2 - sigma2) * (k2 - sigma2)))
        * c_co2;
    let (w0, w1, w2, w3) = (295.235, 2.6422, -0.032_380, 0.004_028);
    let f_nh = 0.003_101
        * (w0 + 3.0 * w1 * sigma2 + 5.0 * w2 * sigma2 * sigma2 + 7.0 * w3 * sigma2.powi(3));
    let f_s = 1.0 - 0.00266 * (2.0 * lat).cos() - 0.000_000_28 * h_m;
    // Water vapour pressure (hPa), Giacomo (1982) as in IERS Conventions 2010 Sect. 9.2.
    let tc = t_k - 273.15;
    let f_w = 1.00062 + 3.14e-6 * p_hpa + 5.6e-7 * tc * tc;
    let e_sat = 0.01
        * (1.237_884_7e-5 * t_k * t_k - 1.912_131_6e-2 * t_k + 33.937_110_47 - 6.343_164_5e3 / t_k)
            .exp();
    let e_s = rh_pct / 100.0 * f_w * e_sat;
    let d_h = 0.002_416_579 * f_h * p_hpa / f_s;
    let d_nh = 1e-4 * (5.316 * f_nh - 3.759 * f_h) * e_s / f_s;
    d_h + d_nh
}

/// FCULa mapping function (Mendes et al. 2002), IERS Conventions 2010 Table 9.x coefficients.
fn fcula(elev: f64, t_k: f64, lat: f64, h_m: f64) -> f64 {
    let tc = t_k - 273.15;
    let cl = lat.cos();
    let a1 = 12_100.8e-7 + 1_729.5e-9 * tc + 319.1e-7 * cl - 1_847.8e-11 * h_m;
    let a2 = 30_496.5e-7 + 234.6e-9 * tc - 103.5e-6 * cl - 185.6e-10 * h_m;
    let a3 = 6_877.7e-5 + 197.2e-7 * tc - 345.8e-5 * cl + 106.0e-9 * h_m;
    let s = elev.sin();
    (1.0 + a1 / (1.0 + a2 / (1.0 + a3))) / (s + a1 / (s + a2 / (s + a3)))
}

struct Residual {
    slice: String,
    station: u32,
    elev_deg: f64,
    res_m: f64,
    /// The same residual with the kernel's own orientation in place of the module's series.
    diag_res_m: f64,
}

fn residuals() -> (Vec<Residual>, usize) {
    let mut out = Vec::new();
    let mut skipped = 0;
    for np in normal_points() {
        let Some(g) = catalogue_station(np.station) else {
            skipped += 1;
            continue;
        };
        let pa = catalogue_reflector(&np.target);
        let jd0 = 2_400_000.5 + np.mjd + np.sod / 86_400.0;
        let at = |dt_s: f64| {
            let jd_utc = jd0 + dt_s / 86_400.0;
            (utc_to_tt(jd_utc), utc_to_ut1(jd_utc, np.dut1))
        };
        let (tt0, ut0) = at(0.0);
        let (tt2, ut2) = at(np.tof);
        let (ttb, _) = at(0.5 * np.tof);
        let r_sta0 = station_inertial_position(g, tt0, ut0);
        let r_sta2 = station_inertial_position(g, tt2, ut2);
        let tb_jc = (ttb - 2_451_545.0) / 36_525.0;
        let r_ref = add(np.moon, de440_moon_pa_body_to_inertial(pa, tb_jc));
        let k = np.diag_rot;
        let r_ref_diag = add(
            np.moon,
            [
                k[0][0] * pa[0] + k[0][1] * pa[1] + k[0][2] * pa[2],
                k[1][0] * pa[0] + k[1][1] * pa[1] + k[1][2] * pa[2],
                k[2][0] * pa[0] + k[2][1] * pa[1] + k[2][2] * pa[2],
            ],
        );
        let geom_diag = 0.5 * (norm(sub(r_ref_diag, r_sta0)) + norm(sub(r_sta2, r_ref_diag)));

        let up = sub(r_ref, r_sta0);
        let dn = sub(r_sta2, r_ref);
        let rho_up = norm(up);
        let rho_dn = norm(dn);
        let geom = 0.5 * (rho_up + rho_dn);

        let r_moon_ref = norm(sub(r_ref, np.moon));
        let shap = 0.5
            * (shapiro(GM_EARTH, norm(r_sta0), norm(r_ref), rho_up)
                + shapiro(GM_EARTH, norm(r_ref), norm(r_sta2), rho_dn)
                + shapiro(GM_MOON, norm(sub(r_sta0, np.moon)), r_moon_ref, rho_up)
                + shapiro(GM_MOON, r_moon_ref, norm(sub(r_sta2, np.moon)), rho_dn));

        // Elevation of the up-leg line of sight in the station's geodetic frame.
        let m = gcrs_to_itrs_matrix(tt0, ut0, 0.0, 0.0);
        let los = [
            m[0][0] * up[0] + m[0][1] * up[1] + m[0][2] * up[2],
            m[1][0] * up[0] + m[1][1] * up[1] + m[1][2] * up[2],
            m[2][0] * up[0] + m[2][1] * up[1] + m[2][2] * up[2],
        ];
        let normal = [
            g.lat_rad.cos() * g.lon_rad.cos(),
            g.lat_rad.cos() * g.lon_rad.sin(),
            g.lat_rad.sin(),
        ];
        let sin_el = (los[0] * normal[0] + los[1] * normal[1] + los[2] * normal[2]) / norm(los);
        let elev = sin_el.asin();
        let tropo = mendes_pavlis_zenith(
            np.p_hpa,
            np.t_k,
            np.rh,
            np.wavelength_nm * 1e-3,
            g.lat_rad,
            g.alt_m,
        ) * fcula(elev, np.t_k, g.lat_rad, g.alt_m);

        let measured = 0.5 * C * np.tof;
        let predicted = geom + shap + tropo;
        out.push(Residual {
            slice: np.slice,
            station: np.station,
            elev_deg: elev.to_degrees(),
            res_m: measured - predicted,
            diag_res_m: measured - (geom_diag + shap + tropo),
        });
    }
    (out, skipped)
}

fn stats(v: &[f64]) -> (usize, f64, f64) {
    let n = v.len();
    let mean = v.iter().sum::<f64>() / n as f64;
    let rms = (v.iter().map(|x| x * x).sum::<f64>() / n as f64).sqrt();
    (n, mean, rms)
}

#[test]
fn reflector_ranges_against_ilrs_normal_points() {
    let (res, skipped) = residuals();
    let pick_with = |slice: &str, station: Option<u32>, diag: bool| -> Vec<f64> {
        res.iter()
            .filter(|r| r.slice == slice && station.map_or(true, |s| r.station == s))
            .map(|r| if diag { r.diag_res_m } else { r.res_m })
            .collect()
    };
    let pick = |slice: &str, station: Option<u32>| pick_with(slice, station, false);
    let (n24, mean24, rms24) = stats(&pick("2024", None));
    eprintln!("M091 2024: n = {n24}, mean {mean24:.3} m, RMS {rms24:.3} m (tolerance {RMS_TOL_M} m); skipped (not catalogued) {skipped}");
    for st in [7845, 7045, 7941] {
        let v = pick("2024", Some(st));
        if !v.is_empty() {
            let (n, mean, rms) = stats(&v);
            eprintln!("M091 2024 station {st}: n = {n}, mean {mean:.3} m, RMS {rms:.3} m");
        }
    }
    let min_el = res
        .iter()
        .filter(|r| r.slice == "2024")
        .map(|r| r.elev_deg)
        .fold(f64::INFINITY, f64::min);
    eprintln!("M091 2024 lowest elevation {min_el:.2} deg");
    for st in [None, Some(7845), Some(7045), Some(7941)] {
        let (n, mean, rms) = stats(&pick_with("2024", st, true));
        eprintln!(
            "M091 2024 DIAGNOSTIC (kernel orientation instead of the module's series), station \
             {st:?}: n = {n}, mean {mean:.3} m, RMS {rms:.3} m"
        );
    }
    let (n15, mean15, rms15) = stats(&pick("2015", None));
    eprintln!("M091 2015 (outside the orientation span; finding only): n = {n15}, mean {mean15:.1} m, RMS {rms15:.1} m");

    // The pre-registered comparison: 192 points, RMS against 10 m. It does not pass.
    assert_eq!(n24, 192, "the committed 2024 slice holds 192 normal points");
    assert_eq!(skipped, 0, "every 2024 station is in the catalogue");
    assert!(
        rms24 > RMS_TOL_M,
        "the 2024 RMS is now within 10 m ({rms24:.2} m): re-examine M091 for promotion"
    );
    // The recorded finding.
    assert!(
        (90.0..100.0).contains(&rms24),
        "the 2024 RMS was 96.2 m, now {rms24:.2} m"
    );
    let (_, _, rms_diag) = stats(&pick_with("2024", None, true));
    assert!(
        (20.0..25.0).contains(&rms_diag),
        "the kernel-orientation diagnostic RMS was 22.7 m, now {rms_diag:.2} m"
    );
    assert!(n15 == 349 && rms15 > 1.0e6, "the 2015 clamp finding moved");
}
