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
//! * After integration: the orientation provider's own oracle comparison (SPICE, off-node)
//!   replaced the element-wise interpolation with geodesic interpolation. With that fix the
//!   module's series gives 22.7 m (Grasse 14.2 m, APOLLO 46.2 m, Matera 9.3 m), the same as the
//!   kernel diagnostic, and the pinned figure below follows it. The verdict is unchanged: the
//!   pre-registered 10 m bar is still not met.
//! * 2015 slice, finding only: RMS 2.18e6 m. The orientation series clamps to its 2024-01-01 row
//!   for any earlier epoch, so 2015 reflectors are placed with a 2024 orientation; nothing warns.
//!
//! The assertions pin these numbers, so a change to the catalogue, the series or the placement
//! that moves them fails here and sends the record back for re-examination.
//!
//! ## Round 2 amendment (written 2026-10-01, before any station coordinate file is fetched, before
//! the generator is re-run and before the engine changes)
//!
//! Unchanged: the 192 normal points of the 2024 slice (files and SHA256SUMS untouched), the Moon
//! centre (DE440 through SPICE), UT1-UTC, the reflector catalogue, the two-way light path, the
//! Shapiro and Mendes-Pavlis/FCULa terms, and the bar: RMS at most **10 m** over the 192 points.
//! Changed, the engine fixes the first comparison pointed at:
//! 1. Stations: ITRF2020 Cartesian positions and velocities (IGN, `ITRF2020_SLR.SSC.txt`,
//!    epoch 2015.0, propagated linearly to each normal point) for Grasse 7845 and Matera 7941;
//!    APOLLO 7045 from the same file if present, otherwise from the ILRS SLRF2020 SINEX if it can
//!    be downloaded without a login. Promotion requires all three stations from one of those two
//!    sources; if APOLLO is unobtainable the result is reported but the row is BLOCKED.
//! 2. Polar motion: x_p, y_p from the same IERS `finals2000A.all` (Bulletin A columns, linear in
//!    time, as for UT1-UTC) enter the station's ITRS-to-GCRS transform
//!    (`cio::gcrs_to_itrs_matrix`); two new columns in `reference.csv`, every existing column must
//!    regenerate byte for byte.
//! 3. The DE440 PA orientation series is extended from the same binary PCK to 2014-01-01 ..
//!    2030-12-31 (daily nodes, the existing geodesic interpolation) and returns an error outside
//!    that span instead of clamping. The 2024-2025 nodes must be unchanged.
//!
//! The 2015 slice (349 points) is reported as a secondary figure, not a promotion criterion.
//! Disclosure: the first comparison's per-station residuals and the kernel-orientation diagnostic
//! (22.7 m) were seen before this amendment. The new strict test is
//! `reflector_ranges_round2_itrf2020_polar_motion`.
//!
//! ### Second amendment (2026-10-01, after fetching the two coordinate files, before any run)
//!
//! APOLLO 7045 is in neither `ITRF2020_SLR.SSC.txt` (IGN) nor the ILRS
//! `SLRF2020_POS+VEL_2025.02.05.snx`; the ILRS station page gives only an "approximate position"
//! (32.780361 N, 105.820417 W, 2788 m, no Cartesian values). Under the amendment above the row is
//! therefore BLOCKED. The run is still made exactly as amended, with APOLLO placed at that ILRS
//! approximate position (no velocity), and reported three ways: all 192 points (the
//! pre-registered figure; promotion impossible because of APOLLO), the 160 points of the two
//! ITRF2020 stations, and APOLLO alone. Grasse 7845 and Matera 7941 take their ITRF2020 values
//! (identical in SLRF2020 to the printed digits).
//!
//! ### Round 2 result (2026-10-01): DISAGREES, and BLOCKED for APOLLO; the row stays MODELLED
//!
//! * All 192 points: RMS **10.94 m**, mean 10.91 m, against 10 m (22.7 m before). Grasse 7845
//!   (151) 10.99 m, Matera 7941 (9) 10.49 m, APOLLO 7045 (32, approximate position) 10.84 m;
//!   the two ITRF2020 stations together (160) 10.96 m. 2015 slice (349, secondary, now inside the
//!   series span): RMS 11.25 m, mean 11.00 m (2.18e6 m before, the clamp).
//! * What remains is a near-constant offset: the scatter about the mean is 0.77 m over the 192
//!   points (0.59 m for APOLLO) and 2.4 m in 2015, with the same +10.5 to +11.0 m mean at every
//!   station and in both years. A common offset of that size is what the model's stated omissions
//!   (no relativistic time-scale transformation of the DE440 TDB-frame Moon vector to the
//!   geocentric TT frame, no solar term) are expected to leave; that is an inference, not tested
//!   here, and adding those terms would be a new comparison.
//! * Engine effect, shown by mutation: dropping polar motion (x_p = y_p = 0 inside
//!   `lunar_vlbi::station_inertial_position_itrs`) raises the RMS to 12.52 m (APOLLO 14.66 m).
//!
//! ### Third amendment (2026-10-01, round 2 continued; written before the fixture is regenerated,
//! before the engine or the harness changes and before any re-run)
//!
//! Unchanged: the 192 normal points of the 2024 slice, the reflector catalogue, the DE440 PA
//! orientation series, the ITRF2020 positions and velocities of Grasse 7845 and Matera 7941,
//! Bulletin A UT1-UTC and polar motion, Mendes-Pavlis/FCULa troposphere, and the bar: RMS of
//! (measured minus predicted one-way range) at most **10 m**.
//! Changed:
//! 1. Light-time model: the relativistic formulation the International Earth Rotation and
//!    Reference Systems Service (IERS) Conventions 2010 (Technical Note 36) Section 11.2 prescribes
//!    for lunar laser ranging, in the barycentric celestial reference system (BCRS) with
//!    Barycentric Dynamical Time (TDB): (a) Earth station and lunar reflector body-centred
//!    vectors transformed with Eq. 11.19, `r_TDB = r_TT (1 - U/c^2 - L_C) - (V . r_TT / 2c^2) V`,
//!    with `U` the potential at the body centre from every other DE440 body (Sun, Moon or Earth,
//!    and the planetary-system barycentres; GM from `gm_de440.tpc`), `V` that body's barycentric
//!    velocity and `L_C` from IERS Table 1.1; (b) station at transmit t0 and receive t2 on the
//!    barycentric Earth at those epochs, the reflector on the barycentric Moon at t0 + TOF/2;
//!    (c) Shapiro delay of Eq. 11.17 from the Sun, the Earth and the Moon; (d) the measured
//!    round-trip interval, a Terrestrial Time (TT) interval, converted to TDB with the SPICE time
//!    conversion. The barycentric states and potentials come from DE440 through SPICE in new
//!    `reference.csv` columns; every existing column must regenerate byte for byte.
//!    Reason: the first two comparisons computed the geometry from the DE440 geocentric Moon (a
//!    TDB-compatible barycentric difference) with geocentric TT-compatible stations and no solar
//!    Shapiro term, a mixture IERS Section 11.2 says not to use; the round 2 residual is a common
//!    +10.9 m offset of the size those omissions predict.
//! 2. APOLLO 7045 station source: the operator's published geocentric coordinates (Apache Point
//!    Observatory APOLLO normal-point page, https://newapo.apo.nmsu.edu/mainpage/apollo/normalpoints/,
//!    retrieved 2026-10-01, page SHA-256 a097fed4...7a49): radius 6374.69213 km, geocentric
//!    latitude 32.6054889 deg, longitude 254.1795778 deg, stated "approximately", no velocity.
//!    It replaces the ILRS approximate geodetic position (1.80 m away). No laser-ranging
//!    analysis centre solution for APOLLO was found without a login (ITRF2020, SLRF2020, the
//!    ILRS site log apol_20250116.log, the JPL DE421/DE430/DE440 reports and Pavlov et al. 2016
//!    were checked; the last fits it but prints no value).
//! 3. Promotion now requires BOTH (a) the RMS over all 192 points at most 10 m and (b) the RMS
//!    over the 160 points of the two ITRF2020 stations at most 10 m on their own, so the verdict
//!    never rests on APOLLO's operator-published position alone; this replaces the earlier
//!    "all three stations from ITRF2020 or SLRF2020" condition. APOLLO alone is reported.
//! The 2015 slice stays secondary. Disclosure: before writing this, the round 2 residuals were
//! known, and an order-of-magnitude estimate was made from the size of the terms (solar Shapiro
//! about 7.6 m one way; the BCRS motion term up to about 1.9 m); no run of the new model was made.
//! New strict test: `reflector_ranges_bcrs_iers2010_relativistic`.
//!
//! ### Third-amendment result (2026-10-01): AGREES, both promotion conditions hold
//!
//! * All 192 points: RMS **2.81 m** (mean 2.67 m) against 10 m. Grasse 7845 and Matera 7941
//!   (160, ITRF2020): RMS **2.96 m** (mean 2.85 m). APOLLO 7045 (32, operator coordinates):
//!   1.94 m. Grasse alone 2.96 m, Matera alone 2.86 m. 2015 slice (349, secondary): 3.82 m.
//! * The round 2 harness reproduces its recorded 10.94 m exactly (APOLLO pinned to the ILRS
//!   approximate position it used). A common +2.7 m remains, below the bar and not tuned away;
//!   it is within what the model's stated omissions (solid-Earth and ocean-loading tides,
//!   station eccentricity, reflector thermal and tidal terms) can leave; inferred, not tested.
//! * The model was first written in this harness and, after the run, moved verbatim into the
//!   engine as `lunar_llr_geometry::llr_bcrs_one_way_m` (identical figures to 1 mm).
//! * Mutation: zeroing the Sun's two Shapiro legs in `llr_bcrs_one_way_m` gives RMS 10.19 m
//!   (ITRF2020 stations 10.37 m) and fails the strict test; reverted by editing.

use kshana::cio::gcrs_to_itrs_matrix;
use kshana::frames::Geodetic;
use kshana::lunar_llr_geometry::{
    llr_bcrs_one_way_m, reflectors, stations, stations_itrf, BcrsEvent, ItrfStation,
    StationCoordinates,
};
use kshana::lunar_orientation::{
    de440_moon_pa_body_to_inertial, try_de440_moon_pa_body_to_inertial,
};
use kshana::lunar_vlbi::{station_inertial_position, station_inertial_position_itrs};
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
    /// Round 2: IERS Bulletin A polar motion (arcsec).
    xp_as: f64,
    yp_as: f64,
    /// Third amendment: BCRS inputs (DE440 through SPICE).
    tof_tdb: f64,
    earth0: [f64; 6],
    earth2: [f64; 6],
    moon_b: [f64; 6],
    sun_b: V3,
    u_earth: f64,
    u_moon: f64,
}

fn normal_points() -> Vec<Np> {
    CSV.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 50, "bad row {l}");
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
                xp_as: p(24),
                yp_as: p(25),
                tof_tdb: p(26),
                earth0: std::array::from_fn(|i| p(27 + i)),
                earth2: std::array::from_fn(|i| p(33 + i)),
                moon_b: std::array::from_fn(|i| p(39 + i)),
                sun_b: [p(45), p(46), p(47)],
                u_earth: p(48),
                u_moon: p(49),
            }
        })
        .collect()
}

/// The model of the station and the Earth orientation used for a residual.
#[derive(Clone, Copy, PartialEq)]
enum Model {
    /// The first comparison: the geodetic catalogue `stations()`, no polar motion.
    Round1,
    /// Round 2: ITRF2020 with velocity, APOLLO at the ILRS approximate position (as run then),
    /// and polar motion.
    Round2,
    /// Third amendment: as round 2 but APOLLO from `stations_itrf()` (the operator's published
    /// geocentric coordinates) and the IERS Conventions 2010 Section 11.2 BCRS light time.
    Round3,
}

fn itrf_station(id: u32, model: Model) -> Option<ItrfStation> {
    let st = stations_itrf().into_iter().find(|s| s.cdp_id == id)?;
    if model == Model::Round2 && id == 7045 {
        // The round 2 run placed APOLLO at the ILRS station page's approximate position.
        return Some(ItrfStation {
            coordinates: StationCoordinates::IlrsApproximate {
                lat_deg: 32.780_361,
                lon_deg: -105.820_417,
                height_m: 2788.0,
            },
            ..st
        });
    }
    Some(st)
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
    residuals_with(Model::Round1)
}

fn residuals_with(model: Model) -> (Vec<Residual>, usize) {
    let mut out = Vec::new();
    let mut skipped = 0;
    for np in normal_points() {
        let Some(g) = catalogue_station(np.station) else {
            skipped += 1;
            continue;
        };
        let itrf = itrf_station(np.station, model);
        if model != Model::Round1 && itrf.is_none() {
            skipped += 1;
            continue;
        }
        let as_rad = std::f64::consts::PI / (180.0 * 3600.0);
        let (xp, yp) = match model {
            Model::Round1 => (0.0, 0.0),
            Model::Round2 | Model::Round3 => (np.xp_as * as_rad, np.yp_as * as_rad),
        };
        let place = |jd_tt: f64, jd_ut1: f64| -> V3 {
            match (model, itrf) {
                (Model::Round2 | Model::Round3, Some(st)) => {
                    station_inertial_position_itrs(st.itrs_position(jd_tt), jd_tt, jd_ut1, xp, yp)
                }
                _ => station_inertial_position(g, jd_tt, jd_ut1),
            }
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
        let r_sta0 = place(tt0, ut0);
        let r_sta2 = place(tt2, ut2);
        let tb_jc = (ttb - 2_451_545.0) / 36_525.0;
        let r_ref = match model {
            Model::Round1 => add(np.moon, de440_moon_pa_body_to_inertial(pa, tb_jc)),
            Model::Round2 | Model::Round3 => add(
                np.moon,
                try_de440_moon_pa_body_to_inertial(pa, tb_jc)
                    .unwrap_or_else(|e| panic!("normal point outside the orientation span: {e}")),
            ),
        };
        // Third amendment: the same events in the BCRS (TDB-compatible), IERS 2010 Eq. 11.19,
        // with the Shapiro delay of Eq. 11.17 from the Sun, the Earth and the Moon.
        let bcrs = if model == Model::Round3 {
            let ev = BcrsEvent {
                earth_t0: np.earth0,
                earth_t2: np.earth2,
                moon_tb: np.moon_b,
                sun_tb: np.sun_b,
                u_earth_c2: np.u_earth,
                u_moon_c2: np.u_moon,
            };
            let light = llr_bcrs_one_way_m(&ev, r_sta0, r_sta2, sub(r_ref, np.moon));
            Some((light, 0.5 * C * np.tof_tdb))
        } else {
            None
        };
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
        let m = gcrs_to_itrs_matrix(tt0, ut0, xp, yp);
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

        let (measured, predicted) = match bcrs {
            Some((light, measured_tdb)) => (measured_tdb, light + tropo),
            None => (0.5 * C * np.tof, geom + shap + tropo),
        };
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
            .filter(|r| r.slice == slice && station.is_none_or(|s| r.station == s))
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
    // The recorded finding. The first comparison measured 96.2 m with the element-wise
    // interpolation of the daily orientation series; once the orientation provider's own
    // oracle comparison replaced it with geodesic interpolation, the module's series gives
    // the same 22.7 m as the kernel-orientation diagnostic below. Still above 10 m: what
    // remains is the rounded APOLLO station coordinates and the absent polar motion.
    assert!(
        (20.0..25.0).contains(&rms24),
        "the 2024 RMS was 22.7 m after the geodesic orientation fix (96.2 m before it), now {rms24:.2} m"
    );
    let (_, _, rms_diag) = stats(&pick_with("2024", None, true));
    assert!(
        (20.0..25.0).contains(&rms_diag),
        "the kernel-orientation diagnostic RMS was 22.7 m, now {rms_diag:.2} m"
    );
    // The 2015 clamp finding (RMS 2.18e6 m) is gone: the series now spans 2014-2030 and
    // errors outside it, so the 2015 points are placed with their own orientation.
    assert!(
        n15 == 349 && (13.0..17.0).contains(&rms15),
        "the 2015 first-model RMS was 15.0 m once the clamp was removed, now {rms15:.2} m"
    );
}

/// Round 2 residual statistics: (all 192, the two ITRF2020 stations, APOLLO alone, 2015 slice).
fn round2_stats() -> [(usize, f64, f64); 4] {
    let (res, skipped) = residuals_with(Model::Round2);
    assert_eq!(
        skipped, 0,
        "every normal-point station is in stations_itrf()"
    );
    let pick = |slice: &str, f: &dyn Fn(u32) -> bool| -> Vec<f64> {
        res.iter()
            .filter(|r| r.slice == slice && f(r.station))
            .map(|r| r.res_m)
            .collect()
    };
    [
        stats(&pick("2024", &|_| true)),
        stats(&pick("2024", &|s| s != 7045)),
        stats(&pick("2024", &|s| s == 7045)),
        stats(&pick("2015", &|_| true)),
    ]
}

/// Pre-registered (round 2 amendment above): ITRF2020/SLRF2020 stations, polar motion and the
/// extended, non-clamping orientation series against the same 192 normal points at 10 m.
/// The round 2 finding, pinned in the gate: with ITRF2020 stations, polar motion and the
/// non-clamping series the 2024 RMS falls from 22.7 m to 10.94 m, still above the 10 m bar, and
/// what remains is a near-constant offset of about +10.9 m common to every station and to both
/// years (scatter 0.6 to 0.8 m in 2024, 2.4 m in 2015), the signature of a term the pre-registered model leaves out (it
/// states no relativistic time-scale transformation and Shapiro delay from the Earth and the Moon
/// only). The bounds below were set after the run: a characterisation, never a promotion basis.
#[test]
fn round2_finding_is_a_common_offset_of_about_eleven_metres() {
    let s = round2_stats();
    let scatter = |(_, mean, rms): (usize, f64, f64)| (rms * rms - mean * mean).max(0.0).sqrt();
    assert_eq!((s[0].0, s[1].0, s[2].0, s[3].0), (192, 160, 32, 349));
    assert!(
        s[0].2 > RMS_TOL_M,
        "the round 2 RMS is now within 10 m ({:.3} m): re-examine M091",
        s[0].2
    );
    for (i, v) in s.iter().enumerate() {
        assert!(
            (10.0..12.0).contains(&v.1),
            "set {i}: mean {:.3} m moved",
            v.1
        );
        assert!(
            scatter(*v) < 3.0,
            "set {i}: scatter {:.3} m moved",
            scatter(*v)
        );
    }
}

/// Pre-registered (third amendment above): the IERS Conventions 2010 Section 11.2 barycentric
/// light-time model at the unchanged 10 m bar, on all 192 points and on the two ITRF2020
/// stations alone.
#[test]
fn reflector_ranges_bcrs_iers2010_relativistic() {
    let (res, skipped) = residuals_with(Model::Round3);
    assert_eq!(
        skipped, 0,
        "every normal-point station is in stations_itrf()"
    );
    let pick = |slice: &str, f: &dyn Fn(u32) -> bool| -> Vec<f64> {
        res.iter()
            .filter(|r| r.slice == slice && f(r.station))
            .map(|r| r.res_m)
            .collect()
    };
    let sets = [
        ("2024 all", stats(&pick("2024", &|_| true))),
        (
            "2024 Grasse + Matera (ITRF2020)",
            stats(&pick("2024", &|s| s != 7045)),
        ),
        (
            "2024 APOLLO (operator coordinates)",
            stats(&pick("2024", &|s| s == 7045)),
        ),
        ("2024 Grasse", stats(&pick("2024", &|s| s == 7845))),
        ("2024 Matera", stats(&pick("2024", &|s| s == 7941))),
        ("2015 all (secondary)", stats(&pick("2015", &|_| true))),
    ];
    for (name, (n, mean, rms)) in &sets {
        eprintln!("M091 third amendment {name}: n = {n}, mean {mean:.3} m, RMS {rms:.3} m");
    }
    assert_eq!((sets[0].1 .0, sets[1].1 .0), (192, 160));
    assert!(
        sets[0].1 .2 <= RMS_TOL_M,
        "2024 RMS {:.3} m exceeds {RMS_TOL_M} m",
        sets[0].1 .2
    );
    assert!(
        sets[1].1 .2 <= RMS_TOL_M,
        "2024 ITRF2020-station RMS {:.3} m exceeds {RMS_TOL_M} m",
        sets[1].1 .2
    );
}

#[test]
#[ignore = "FINDING: 2024 RMS 10.94 m over 192 points exceeds the 10 m bar (Grasse + Matera 10.96 m, APOLLO 10.84 m); a common +10.9 m offset remains, and APOLLO has no ITRF2020/SLRF2020 coordinates, so the row was BLOCKED; superseded by the third amendment, reflector_ranges_bcrs_iers2010_relativistic (2.81 m)"]
fn reflector_ranges_round2_itrf2020_polar_motion() {
    let s = round2_stats();
    let names = [
        "2024 all",
        "2024 Grasse + Matera (ITRF2020)",
        "2024 APOLLO (approximate)",
        "2015 all (secondary)",
    ];
    for (name, (n, mean, rms)) in names.iter().zip(s.iter()) {
        eprintln!("M091 round 2 {name}: n = {n}, mean {mean:.3} m, RMS {rms:.3} m");
    }
    for st in [7845, 7941, 7045] {
        let (res, _) = residuals_with(Model::Round2);
        let v: Vec<f64> = res
            .iter()
            .filter(|r| r.slice == "2024" && r.station == st)
            .map(|r| r.res_m)
            .collect();
        let (n, mean, rms) = stats(&v);
        eprintln!("M091 round 2 2024 station {st}: n = {n}, mean {mean:.3} m, RMS {rms:.3} m");
    }
    assert_eq!(s[0].0, 192);
    assert!(
        s[0].2 <= RMS_TOL_M,
        "2024 RMS {:.3} m exceeds {RMS_TOL_M} m",
        s[0].2
    );
}
