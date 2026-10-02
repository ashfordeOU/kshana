// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison for the lunar geodetic VLBI delay and its partials (`lunar_vlbi`, the
//! kernel path `KernelGeometry`, which the `lunar-vlbi` scenario runs when its three kernel
//! paths are set) against light times solved by the NAIF SPICE Toolkit itself.
//!
//! ## Why a new oracle (round 2 amendment 2, 2026-10-02)
//!
//! The ANISE comparison (`tests/lunar_vlbi_anise_oracle.rs`) used ANISE only to translate and
//! rotate; the light-time iteration that defines the delay was the generator's own fixed-point
//! loop, which the engine's `KernelGeometry::light_time` follows, and its partials were a
//! central difference of that same self-written delay. It therefore checked the kernel
//! evaluation, not the light-time solution the row claims. Here the light time is the oracle
//! library's own converged Newtonian solution.
//!
//! ## Pre-registration (written before the fixture was generated or the oracle run)
//!
//! * Quantity: the near-field VLBI delay `tau = LT(b) - LT(a)` of a beacon fixed on the Moon
//!   received at a common epoch by two Earth stations, each `LT` the converged Newtonian light
//!   time (station at reception, beacon at emission, solar-system barycentric frame, TDB/ET);
//!   the partial of `tau` with respect to the beacon's body-fixed position (DE440 lunar
//!   principal axes); and the partials of `tau` with respect to each station's Earth-fixed
//!   (ITRF93) position.
//! * Oracle (Library): NAIF SPICE Toolkit CSPICE N0067 through spiceypy 8.2.0 (MIT; the
//!   toolkit is NAIF's, freely distributed), run as a separate program by
//!   `tests/fixtures/lunar_vlbi_spice_oracle/generate_lunar_vlbi_spice_oracle.py`, which calls
//!   no Kshana code. Light times: `spkcpt(trgpos, 'MOON', 'MOON_PA_DE440', et, 'J2000',
//!   'OBSERVER', 'CN', obsrvr)` with `trgpos` = (1737.4, 0, 0) km (selenographic 0 N 0 E on the
//!   1737.4 km sphere) and `obsrvr` = DSS-14 (Goldstone), DSS-43 (Canberra), DSS-63 (Madrid)
//!   from NAIF's `earthstns_itrf93_260814.bsp`; the returned `lt` is the light time. Kernels:
//!   `de440s.bsp`, `moon_pa_de440_200625.bpc`, `moon_de440_250416.tf` (MOON_PA_DE440 frame
//!   definition), `earth_latest_high_prec.bpc` (the 2026-09-30 copy, SHA-256 df5510d1...),
//!   `earthstns_itrf93_260814.bsp`, `naif0012.tls`; hashes in the fixture header.
//! * Beacon partials: five-point central difference of the SPICE light times, offsets of
//!   +-h and +-2h applied to `trgpos` along each MOON_PA_DE440 axis, h = 500 km
//!   (`(f(-2h) - 8 f(-h) + 8 f(h) - f(2h)) / 12h`). Step chosen from the oracle's own
//!   precision before any value was seen: SPICE forms the light time from solar-system
//!   barycentric positions near 1.5e11 m, whose rounding is about 3e-5 m (1e-13 s), and the
//!   smallest delay partial on this geometry is about 1.2e-11 s/m, so a 500 km step keeps the
//!   rounding below 3e-8 relative while the stencil's truncation stays below 1e-9 relative.
//! * Station partials: the same stencil and step on the station position, through
//!   `spkcpo(target, et, 'J2000', 'OBSERVER', 'CN', obspos, 'EARTH', 'ITRF93')` with the
//!   beacon written by the generator as a constant-position SPK type 8 object relative to
//!   MOON in MOON_PA_DE440 (a scratch file, not committed) and `obspos` the station's ITRF93
//!   position plus the offset. The generator also checks that this `spkcpo` route reproduces
//!   the `spkcpt` light time at zero offset (aborting above 1e-12 s), so both routes are the
//!   same SPICE quantity.
//! * Inputs given to Kshana from the fixture: the epoch `et` SPICE obtained with
//!   `utc2et('2024-01-01T{hh}:00:00')` for 25 hourly epochs (00:00 on 2024-01-01 to 00:00 on
//!   2024-01-02), evaluated by Kshana at exactly that ET (`hi = round(et)`, `lo = et - hi`);
//!   each station's ITRF93 position, `spkpos(DSS-nn, et, 'ITRF93', 'NONE', 'EARTH')` in m.
//!   Kshana evaluates `KernelGeometry::{delay_s, delay_partials_beacon_body,
//!   delay_partials_stations}` with body vector (1 737 400, 0, 0) m on the cut kernels in
//!   `tests/fixtures/lunar_vlbi_anise_oracle/kernels/` (records bit-identical to the full
//!   files above).
//! * Baselines: Goldstone-Canberra, Goldstone-Madrid, Madrid-Canberra (`a`, `b` as in the
//!   ANISE fixture), 25 epochs: 75 delays, 75 beacon partials, 150 station partials.
//! * Tolerances (kept from the earlier pre-registration, not loosened): **1 ps** on every
//!   delay; **1e-6** relative (vector norm of the difference over the oracle's norm) on every
//!   beacon partial and on every station partial. PROMOTE only if all 300 hold.
//! * Information only (not a gate): the same comparison with Kshana's own epoch conversion
//!   `naif_et_from_utc` instead of SPICE's ET.
//! * Outside the claim, stated now: the analytic path (`station_inertial_position`,
//!   `beacon_inertial_position`, `geometric_delay_s`), whose ANISE finding stays pinned; the
//!   Shapiro, media and barycentric-to-geocentric scale terms, which SPICE does not model.

use kshana::lunar_vlbi::KernelGeometry;

const DELAY_TOL_S: f64 = 1.0e-12;
const PARTIAL_REL_TOL: f64 = 1.0e-6;
const FIXTURE: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lunar_vlbi_spice_oracle/spice_light_times.csv"
);
const BASELINES: [(usize, usize); 3] = [(0, 1), (0, 2), (2, 1)];

/// One (epoch, station) row of the SPICE fixture.
#[derive(Clone, Copy)]
struct Row {
    hour: usize,
    et: f64,
    station: usize,
    itrf_m: [f64; 3],
    lt_s: f64,
    dlt_dbeacon: [f64; 3],
    dlt_dstation: [f64; 3],
}

fn rows() -> Vec<Row> {
    let text = std::fs::read_to_string(FIXTURE).expect("SPICE fixture");
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty() && !l.starts_with("hour"))
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 13, "bad row: {l}");
            let p = |i: usize| f[i].parse::<f64>().expect("number");
            Row {
                hour: f[0].parse().unwrap(),
                et: p(1),
                station: f[2].parse().unwrap(),
                itrf_m: [p(3), p(4), p(5)],
                lt_s: p(6),
                dlt_dbeacon: [p(7), p(8), p(9)],
                dlt_dstation: [p(10), p(11), p(12)],
            }
        })
        .collect()
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

fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn neg(a: [f64; 3]) -> [f64; 3] {
    [-a[0], -a[1], -a[2]]
}
fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}
fn rel(k: [f64; 3], s: [f64; 3]) -> f64 {
    norm(sub(k, s)) / norm(s)
}

/// Worst delay gap, worst beacon-partial and station-partial relative errors, and pass counts
/// `(delays, beacon partials, station partials)`, with each epoch given to Kshana by `et_of`.
fn compare(et_of: &dyn Fn(&Row) -> (f64, f64)) -> (f64, f64, f64, [usize; 3], usize) {
    let geom = kernel_geometry();
    let rows = rows();
    assert_eq!(rows.len(), 75, "25 epochs x 3 stations");
    let body = [1_737_400.0, 0.0, 0.0];
    let (mut dmax, mut bmax, mut smax): (f64, f64, f64) = (0.0, 0.0, 0.0);
    let mut pass = [0usize; 3];
    let mut n = 0;
    for hour in 0..25 {
        let at = |s: usize| {
            *rows
                .iter()
                .find(|r| r.hour == hour && r.station == s)
                .expect("row")
        };
        for &(a, b) in &BASELINES {
            let (ra, rb) = (at(a), at(b));
            assert_eq!(ra.et, rb.et, "common reception epoch");
            let (hi, lo) = et_of(&ra);
            let tau_k = geom
                .delay_s(ra.itrf_m, rb.itrf_m, body, hi, lo)
                .expect("delay");
            let tau_s = rb.lt_s - ra.lt_s;
            let d = (tau_k - tau_s).abs();
            dmax = dmax.max(d);
            pass[0] += usize::from(d <= DELAY_TOL_S);

            let gk = geom
                .delay_partials_beacon_body(ra.itrf_m, rb.itrf_m, body, hi, lo)
                .expect("beacon partials");
            let gs = sub(rb.dlt_dbeacon, ra.dlt_dbeacon);
            let e = rel(gk, gs);
            bmax = bmax.max(e);
            pass[1] += usize::from(e <= PARTIAL_REL_TOL);

            let (pa, pb) = geom
                .delay_partials_stations(ra.itrf_m, rb.itrf_m, body, hi, lo)
                .expect("station partials");
            for (k, s) in [(pa, neg(ra.dlt_dstation)), (pb, rb.dlt_dstation)] {
                let e = rel(k, s);
                smax = smax.max(e);
                pass[2] += usize::from(e <= PARTIAL_REL_TOL);
            }
            n += 1;
        }
    }
    (dmax, bmax, smax, pass, n)
}

/// The pre-registered comparison at SPICE's own ET.
#[test]
#[ignore = "pre-registered; not yet run"]
fn kernel_delay_and_partials_match_spice_converged_light_times() {
    let (dmax, bmax, smax, pass, n) = compare(&|r: &Row| (r.et.round(), r.et - r.et.round()));
    eprintln!(
        "M038 vs SPICE CN: delay max {dmax:.4e} s, within 1 ps {}/{n}; beacon partials max \
         {bmax:.4e}, within 1e-6 {}/{n}; station partials max {smax:.4e}, within 1e-6 {}/{}",
        pass[0],
        pass[1],
        pass[2],
        2 * n
    );
    assert_eq!(n, 75);
    assert_eq!(pass[0], 75, "delays outside 1 ps (max {dmax:.3e} s)");
    assert_eq!(pass[1], 75, "beacon partials outside 1e-6 (max {bmax:.3e})");
    assert_eq!(
        pass[2], 150,
        "station partials outside 1e-6 (max {smax:.3e})"
    );
}

/// Information only: the same comparison with Kshana's own UTC-to-ET conversion.
#[test]
#[ignore = "pre-registered; not yet run"]
fn information_only_with_the_engine_epoch_conversion() {
    let (dmax, bmax, smax, pass, n) = compare(&|r: &Row| {
        kshana::naif_kernel::naif_et_from_utc(2_460_310.5, r.hour as f64 * 3_600.0)
    });
    eprintln!(
        "M038 vs SPICE CN, engine ET (information): delay max {dmax:.4e} s ({}/{n}); beacon \
         partials max {bmax:.4e} ({}/{n}); station partials max {smax:.4e} ({}/{})",
        pass[0],
        pass[1],
        pass[2],
        2 * n
    );
}
