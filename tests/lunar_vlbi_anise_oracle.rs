// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison for the lunar geodetic VLBI near-field delay (`lunar_vlbi`) against
//! ANISE 0.10 light times through JPL DE440.
//!
//! ## Pre-registration (tolerances fixed 2026-09-30 in the validation plan; operational
//! details fixed 2026-10-01T03:28Z in the batch pre-registration, before this ran)
//!
//! * Oracle (Library): ANISE 0.10.1 (MPL-2.0, https://github.com/nyx-space/anise), run as a tool
//!   from `xval/anise-lunar-od/src/bin/lunar_vlbi_oracle.rs`, never linked into this crate. Its
//!   output is committed as `tests/fixtures/lunar_vlbi_anise_oracle/anise_delays.csv` (kernel
//!   hashes in the header; provenance in `NOTICE.md`). The delay is the difference of two
//!   converged Newtonian light times from a beacon at selenographic (0, 0, 0) on the 1737.4 km
//!   sphere, placed in MOON_PA_DE440, to two WGS-84 stations at a common reception epoch, with
//!   DE440 Earth and Moon and the ITRF93 Earth orientation.
//! * Geometry: 25 hourly epochs from 2024-01-01T00:00 UTC; Goldstone, Canberra and Madrid; the
//!   baselines Goldstone-Canberra, Goldstone-Madrid and Madrid-Canberra (75 delays).
//! * Kshana: `geometric_delay_s(station_inertial_position(..), station_inertial_position(..),
//!   beacon_inertial_position(..))`, with UT1-UTC from IERS finals2000A (in the fixture).
//! * Tolerances: **1 ps** on every delay; the beacon partials (`delay_partials_beacon`, at
//!   Kshana's own positions) within **1e-6** relative (vector norm) of a central difference of the
//!   ANISE delay, at every pair. PROMOTE only if both hold everywhere.
//!
//! ## Result (recorded 2026-10-01, not tuned): DISAGREES, the row stays MODELLED
//!
//! * Delay: 0 of 75 within 1 ps. Largest gap 2.42e-5 s, RMS 1.17e-5 s.
//! * Beacon partials: 0 of 75 within 1e-6; largest relative error 2.95e-3.
//!
//! A diagnostic run of the generator crate (positions side by side, not committed) split the
//! largest delay gap into: the beacon position, 2.2e-5 s (Kshana's analytic Moon centre sits
//! 194 to 223 km from DE440 over the day, 27 to 37 km of it radial, and the mean-Earth body frame
//! puts the beacon 850 m from its principal-axis placement); light-time bookkeeping, 3.6e-6 s (the
//! module uses one instantaneous geometry, with no station or Earth motion during the 1.35 s
//! flight); the station positions, 3.4e-8 s (6.9 m, mostly the dropped polar motion). The
//! 1 ps bar is also below the 1e-8 relative BCRS-to-GCRS scale difference (about 0.2 ns on a
//! 20 ms delay), which neither side models.
//!
//! The assertions pin the finding: they fail if the gap closes (re-examine for promotion) or
//! moves (the record is stale). That finding stays true of the analytic path
//! (`station_inertial_position`, `beacon_inertial_position`, `geometric_delay_s`), which the
//! engine keeps.
//!
//! ## Round 2 amendment (2026-10-02, written before the kernel path was compared with the oracle)
//!
//! Engine fix: a pure-Rust NAIF kernel reader (`naif_kernel`: the DAF container, SPK type 2,
//! binary PCK type 2, written from the NAIF required-reading documents, no third-party reader)
//! and `lunar_vlbi::KernelGeometry`, which evaluates the delay from DE440 positions, the DE440
//! lunar principal axes and the ITRF93 Earth orientation (precession, nutation, UT1 and polar
//! motion) with each light time converged in the barycentric frame (station at reception, beacon
//! at emission, the Earth's motion during the flight) and the beacon partials carrying the
//! light-time factor `1/(c - u.V)`.
//!
//! * Oracle, fixture and tolerances unchanged: the committed `anise_delays.csv` (not
//!   regenerated), **1 ps** on every one of the 75 delays and **1e-6** relative on every
//!   beacon partial. PROMOTE only if both hold everywhere.
//! * Kshana side (the only change): `KernelGeometry::delay_s(ecef_a, ecef_b, body, et)` and
//!   `KernelGeometry::delay_partials_beacon(..)`, with the stations from
//!   `frames::geodetic_to_ecef` (WGS-84), the beacon body vector (1 737 400, 0, 0) m in
//!   MOON_PA_DE440, and the reception epoch `et = naif_kernel::naif_et_from_utc(2024-01-01, k h)`
//!   (the NAIF leapseconds-kernel conversion, the convention the SPICE kernels are indexed by).
//!   The UT1-UTC column is not used: UT1 and polar motion come from the Earth orientation kernel.
//! * Kernels: the cuts in `tests/fixtures/lunar_vlbi_anise_oracle/kernels/` of the same three
//!   files the oracle read (SHA-256 of the sources as in the CSV header), whose records SPICE
//!   evaluates bit for bit like the full kernels (checked by the cutting script).
//! * Disclosed: while building the reader it was checked against SPICE `spkgeo` and `pxform`
//!   values on the cut kernels (`tests/naif_kernel_reader_check.rs`); SPICE is not this row's
//!   oracle, and no ANISE delay was compared with the kernel path before this amendment. The
//!   NAIF time conversion differs from the full Fairhead-Bretagnon TDB by about 25 us on
//!   2024-01-01 (measured with ERFA `dtdb` while choosing the convention, before any delay was
//!   compared); the record states it.
//!
//! ## Round 2 result (2026-10-02, first run of the kernel path; nothing tuned): AGREES
//!
//! * Delay: 75 of 75 within 1 ps; largest gap 1.20e-13 s, RMS 4.98e-14 s.
//! * Beacon partials: 75 of 75 within 1e-6; largest relative error 2.86e-7.
//! * Mutations (each turned the strict test red, then reverted by editing the file back): the
//!   light-time factor removed from the partials (den = c): partials 0 of 75, worst 1.02e-4;
//!   the Earth's motion during the flight dropped (no `E(t) - E(t - LT)` step): delays 0 of 75,
//!   worst 3.48e-6 s.
//! * Scope, stated with the result: both sides evaluate the Newtonian light-time delay at a
//!   reception epoch in the SPICE ephemeris-time convention. Moving the epoch by the 25.3 us
//!   difference to the full TDB series moves the delays by up to 5.8e-11 s (measured after the
//!   result, with the engine), and neither side carries the Shapiro, media or
//!   barycentric-to-geocentric scale terms.
//!
//! ## Note after the round-2 verification (2026-10-02)
//!
//! In this comparison ANISE only evaluates the kernels; the light-time iteration that defines
//! the delay is the generator's own loop, which `KernelGeometry::light_time` follows. It is
//! therefore a kernel-evaluation cross-check, not this row's oracle. The light-time oracle is
//! SPICE's own converged solution, `tests/lunar_vlbi_spice_oracle.rs`.

use kshana::frames::Geodetic;
use kshana::lunar::Selenographic;
use kshana::lunar_vlbi::KernelGeometry;
use kshana::lunar_vlbi::{
    beacon_inertial_position, delay_partials_beacon, geometric_delay_s, station_inertial_position,
};
use kshana::naif_kernel::naif_et_from_utc;
use kshana::timescales::{utc_to_tt, utc_to_ut1};

const CSV: &str = include_str!("fixtures/lunar_vlbi_anise_oracle/anise_delays.csv");

const DELAY_TOL_S: f64 = 1.0e-12;
const PARTIAL_REL_TOL: f64 = 1.0e-6;

/// The generator's stations, (latitude deg, longitude deg, height m), WGS-84.
const STATIONS: [(f64, f64, f64); 3] = [
    (40.4256, -116.8893, 1000.0),
    (-35.4014, 148.9819, 688.0),
    (40.4314, -4.2481, 830.0),
];

struct Row {
    jd_utc: f64,
    dut1: f64,
    a: usize,
    b: usize,
    tau: f64,
    grad: [f64; 3],
}

fn rows() -> Vec<Row> {
    CSV.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 11, "bad row: {l}");
            let p = |i: usize| f[i].parse::<f64>().expect("number");
            Row {
                jd_utc: p(1),
                dut1: p(2),
                a: f[3].parse().unwrap(),
                b: f[4].parse().unwrap(),
                tau: p(7),
                grad: [p(8), p(9), p(10)],
            }
        })
        .collect()
}

fn geod(i: usize) -> Geodetic {
    let (la, lo, h) = STATIONS[i];
    Geodetic {
        lat_rad: la.to_radians(),
        lon_rad: lo.to_radians(),
        alt_m: h,
    }
}

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

#[test]
fn near_field_delay_disagrees_with_the_anise_light_time_difference() {
    let rows = rows();
    assert_eq!(rows.len(), 75, "25 epochs x 3 baselines");
    let beacon = Selenographic {
        lat_rad: 0.0,
        lon_rad: 0.0,
        alt_m: 0.0,
    };

    let mut max_dtau: f64 = 0.0;
    let mut sum2 = 0.0;
    let mut max_rel_partial: f64 = 0.0;
    let mut n_delay_pass = 0;
    let mut n_partial_pass = 0;
    for r in &rows {
        let jd_tt = utc_to_tt(r.jd_utc);
        let jd_ut1 = utc_to_ut1(r.jd_utc, r.dut1);
        let ra = station_inertial_position(geod(r.a), jd_tt, jd_ut1);
        let rb = station_inertial_position(geod(r.b), jd_tt, jd_ut1);
        let rbeacon = beacon_inertial_position(beacon, jd_tt);
        // geometric_delay_s(r1, r2, beacon) = (|r2 - rB| - |r1 - rB|)/c: station 1 = a.
        let tau_k = geometric_delay_s(ra, rb, rbeacon);
        let d = (tau_k - r.tau).abs();
        max_dtau = max_dtau.max(d);
        sum2 += d * d;
        if d <= DELAY_TOL_S {
            n_delay_pass += 1;
        }

        let gk = delay_partials_beacon(ra, rb, rbeacon);
        let diff = [gk[0] - r.grad[0], gk[1] - r.grad[1], gk[2] - r.grad[2]];
        let rel = norm(diff) / norm(r.grad);
        max_rel_partial = max_rel_partial.max(rel);
        if rel <= PARTIAL_REL_TOL {
            n_partial_pass += 1;
        }
    }
    let rms = (sum2 / rows.len() as f64).sqrt();
    eprintln!(
        "M038: delay |kshana - ANISE| max {max_dtau:.4e} s, rms {rms:.4e} s, within 1 ps: \
         {n_delay_pass}/75; beacon partials max relative error {max_rel_partial:.4e}, within \
         1e-6: {n_partial_pass}/75"
    );

    // The pre-registered comparison does not pass anywhere.
    assert_eq!(
        n_delay_pass, 0,
        "some delays now within 1 ps: re-examine M038"
    );
    assert_eq!(
        n_partial_pass, 0,
        "some partials now within 1e-6: re-examine M038"
    );
    // The recorded finding.
    assert!(
        (1.0e-5..5.0e-5).contains(&max_dtau),
        "the largest delay gap was 2.42e-5 s, now {max_dtau:.3e} s"
    );
    assert!(
        (1.0e-3..1.0e-2).contains(&max_rel_partial),
        "the largest partial error was 2.95e-3, now {max_rel_partial:.3e}"
    );
}

fn kernel_geometry() -> KernelGeometry {
    let dir = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/lunar_vlbi_anise_oracle/kernels/"
    );
    let p = |f: &str| std::path::PathBuf::from(format!("{dir}{f}"));
    KernelGeometry::open(
        &p("de440s_2024-01-01.bsp"),
        &p("earth_itrf93_2024-01-01.bpc"),
        &p("moon_pa_de440_2024-01-01.bpc"),
    )
    .expect("cut kernels")
}

/// The pre-registered comparison on the kernel path: every delay within 1 ps and every beacon
/// partial within 1e-6 relative of the ANISE oracle.
#[test]
fn kernel_delay_matches_the_anise_light_time_difference() {
    let geom = kernel_geometry();
    let rows = rows();
    assert_eq!(rows.len(), 75, "25 epochs x 3 baselines");
    let body = [1_737_400.0, 0.0, 0.0];
    let ecef: Vec<[f64; 3]> = (0..3)
        .map(|i| kshana::frames::geodetic_to_ecef(geod(i)))
        .collect();
    let (mut max_dtau, mut sum2, mut max_rel): (f64, f64, f64) = (0.0, 0.0, 0.0);
    let (mut n_delay, mut n_partial) = (0, 0);
    for r in &rows {
        let secs = ((r.jd_utc - 2_460_310.5) * 24.0).round() * 3_600.0;
        let (hi, lo) = naif_et_from_utc(2_460_310.5, secs);
        let tau = geom
            .delay_s(ecef[r.a], ecef[r.b], body, hi, lo)
            .expect("delay");
        let d = (tau - r.tau).abs();
        max_dtau = max_dtau.max(d);
        sum2 += d * d;
        n_delay += usize::from(d <= DELAY_TOL_S);
        let g = geom
            .delay_partials_beacon(ecef[r.a], ecef[r.b], body, hi, lo)
            .expect("partials");
        let diff = [g[0] - r.grad[0], g[1] - r.grad[1], g[2] - r.grad[2]];
        let rel = norm(diff) / norm(r.grad);
        max_rel = max_rel.max(rel);
        n_partial += usize::from(rel <= PARTIAL_REL_TOL);
    }
    let rms = (sum2 / rows.len() as f64).sqrt();
    eprintln!(
        "M038 kernel path: delay |kshana - ANISE| max {max_dtau:.4e} s, rms {rms:.4e} s, within \
         1 ps: {n_delay}/75; beacon partials max relative error {max_rel:.4e}, within 1e-6: \
         {n_partial}/75"
    );
    assert_eq!(n_delay, 75, "delays outside 1 ps (max {max_dtau:.3e} s)");
    assert_eq!(n_partial, 75, "partials outside 1e-6 (max {max_rel:.3e})");
}
