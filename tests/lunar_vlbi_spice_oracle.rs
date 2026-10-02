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
//!
//! ## Result of that run (2026-10-02, first run, nothing tuned): FAILS, a finding about the oracle
//!
//! * Delay: 17 of 75 within 1 ps; largest gap 1.03e-11 s. Beacon partials: 74 of 75 within
//!   1e-6; largest 1.12e-6. Station partials: 150 of 150; largest 4.85e-9.
//! * Diagnosis (after the result, SPICE-side only, disclosed): SPICE carries ET as one double.
//!   Near 2024 (ET about 7.6e8 s) its spacing is 1.19e-7 s, so the emission epoch `et - lt`
//!   SPICE evaluates the beacon at is rounded by up to 6e-8 s; at the beacon's barycentric
//!   speed (about 30 km/s) that moves each light time by up to about 6e-12 s. The per-station
//!   light-time differences (Kshana minus SPICE) correlate with the error this rounding
//!   predicts at 0.99999, with a residual RMS of 1.1e-14 s against an RMS of 2.9e-12 s. A
//!   check that SPICE's `CN` is converged (re-iterating its geometry ten more times) moved no
//!   light time by more than 2.2e-16 s. The pre-registered precision argument above counted
//!   only position rounding and missed this term: at 2024 epochs the oracle cannot resolve
//!   1 ps, and the five-point partial inherits the same noise divided by the step.
//!   The strict test below stays ignored with these numbers; `spice_2024_epochs_finding_is_unchanged`
//!   pins them.
//!
//! ## Amendment 3 (pre-registration, written after that result and before the fixture below
//! was generated or any value at these epochs seen)
//!
//! * The same oracle, generator, stations, beacon, stencil, step and tolerances (**1 ps**,
//!   **1e-6**, all 300 comparisons), at reception epochs where SPICE's double ET resolves the
//!   emission epoch: 25 hourly epochs from 2000-01-01T06:00 to 2000-01-02T06:00 UTC
//!   (|ET| < 65 000 s, spacing at most 1.5e-11 s, so the rounding moves a light time by less
//!   than 1e-15 s). The fixture is `spice_light_times_j2000.csv` from the same generator with
//!   `--epochs j2000`.
//! * Kshana reads cut kernels of the same three files for 2000-01-01 to 2000-01-02
//!   (`tests/fixtures/lunar_vlbi_spice_oracle/kernels/`, cut and checked bit for bit by
//!   `make_kernel_subsets_2000.py`; the Earth-orientation kernel starts at
//!   2000-01-01T00:00, hence the 06:00 start).
//! * Information only: the same with `naif_et_from_utc`.
//! * Why the old configuration measured a different quantity: at 2024 epochs the oracle's
//!   light time is that of an emission epoch rounded to 1.19e-7 s, not the converged light
//!   time itself; the engine carries ET as two doubles and does not round it.

use kshana::lunar_vlbi::KernelGeometry;

const DELAY_TOL_S: f64 = 1.0e-12;
const PARTIAL_REL_TOL: f64 = 1.0e-6;
/// A comparison set: the SPICE fixture, the directory and names of the cut kernels, and the
/// UTC day (Julian date at 0 h) and hour of the first epoch.
struct Set {
    fixture: &'static str,
    kernels: [&'static str; 3],
    jd_day: f64,
    hour0: f64,
}

const SET_2024: Set = Set {
    fixture: "lunar_vlbi_spice_oracle/spice_light_times.csv",
    kernels: [
        "lunar_vlbi_anise_oracle/kernels/de440s_2024-01-01.bsp",
        "lunar_vlbi_anise_oracle/kernels/earth_itrf93_2024-01-01.bpc",
        "lunar_vlbi_anise_oracle/kernels/moon_pa_de440_2024-01-01.bpc",
    ],
    jd_day: 2_460_310.5,
    hour0: 0.0,
};

const SET_J2000: Set = Set {
    fixture: "lunar_vlbi_spice_oracle/spice_light_times_j2000.csv",
    kernels: [
        "lunar_vlbi_spice_oracle/kernels/de440s_2000-01-01.bsp",
        "lunar_vlbi_spice_oracle/kernels/earth_itrf93_2000-01-01.bpc",
        "lunar_vlbi_spice_oracle/kernels/moon_pa_de440_2000-01-01.bpc",
    ],
    jd_day: 2_451_544.5,
    hour0: 6.0,
};

fn fixture(rel: &str) -> std::path::PathBuf {
    std::path::PathBuf::from(format!(
        "{}/tests/fixtures/{rel}",
        env!("CARGO_MANIFEST_DIR")
    ))
}

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

fn rows(set: &Set) -> Vec<Row> {
    let text = std::fs::read_to_string(fixture(set.fixture)).expect("SPICE fixture");
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

fn kernel_geometry(set: &Set) -> KernelGeometry {
    KernelGeometry::open(
        &fixture(set.kernels[0]),
        &fixture(set.kernels[1]),
        &fixture(set.kernels[2]),
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
fn compare(set: &Set, et_of: &dyn Fn(&Row) -> (f64, f64)) -> (f64, f64, f64, [usize; 3], usize) {
    let geom = kernel_geometry(set);
    let rows = rows(set);
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

fn spice_et(r: &Row) -> (f64, f64) {
    (r.et.round(), r.et - r.et.round())
}

fn report(label: &str, (dmax, bmax, smax, pass, n): (f64, f64, f64, [usize; 3], usize)) {
    eprintln!(
        "M038 vs SPICE CN, {label}: delay max {dmax:.4e} s, within 1 ps {}/{n}; beacon \
         partials max {bmax:.4e}, within 1e-6 {}/{n}; station partials max {smax:.4e}, within \
         1e-6 {}/{}",
        pass[0],
        pass[1],
        pass[2],
        2 * n
    );
}

/// The first pre-registered comparison, at 2024 epochs. Measured: delays 17/75 within 1 ps
/// (worst 1.03e-11 s), beacon partials 74/75 (worst 1.12e-6), station partials 150/150; the
/// gap is SPICE's rounding of the emission epoch to its double ET (see the header).
#[test]
#[ignore = "fails: delays 17/75 within 1 ps (worst 1.03e-11 s), beacon partials 74/75 (worst 1.12e-6); SPICE's double ET rounds the emission epoch by up to 6e-8 s at 2024"]
fn kernel_delay_and_partials_match_spice_converged_light_times() {
    let r = compare(&SET_2024, &spice_et);
    report("2024 epochs", r);
    let (dmax, bmax, smax, pass, n) = r;
    assert_eq!(n, 75);
    assert_eq!(pass[0], 75, "delays outside 1 ps (max {dmax:.3e} s)");
    assert_eq!(pass[1], 75, "beacon partials outside 1e-6 (max {bmax:.3e})");
    assert_eq!(
        pass[2], 150,
        "station partials outside 1e-6 (max {smax:.3e})"
    );
}

/// Pins the 2024-epoch finding: it fails if the gap closes or moves.
#[test]
fn spice_2024_epochs_finding_is_unchanged() {
    let r = compare(&SET_2024, &spice_et);
    report("2024 epochs (pinned finding)", r);
    let (dmax, bmax, smax, pass, _) = r;
    assert_eq!(pass, [17, 74, 150], "the recorded pass counts moved");
    assert!(
        (9e-12..1.2e-11).contains(&dmax),
        "worst delay gap was 1.03e-11 s, now {dmax:.3e}"
    );
    assert!(
        (1.0e-6..1.3e-6).contains(&bmax),
        "worst beacon partial was 1.12e-6, now {bmax:.3e}"
    );
    assert!(
        smax < 1e-8,
        "worst station partial was 4.85e-9, now {smax:.3e}"
    );
}

/// Amendment 3: the pre-registered comparison at epochs near J2000, where SPICE's ET resolves
/// the emission epoch.
#[test]
#[ignore = "pre-registered; not yet run"]
fn kernel_delay_and_partials_match_spice_light_times_near_j2000() {
    let r = compare(&SET_J2000, &spice_et);
    report("epochs near J2000", r);
    let (dmax, bmax, smax, pass, n) = r;
    assert_eq!(n, 75);
    assert_eq!(pass[0], 75, "delays outside 1 ps (max {dmax:.3e} s)");
    assert_eq!(pass[1], 75, "beacon partials outside 1e-6 (max {bmax:.3e})");
    assert_eq!(
        pass[2], 150,
        "station partials outside 1e-6 (max {smax:.3e})"
    );
}

/// Information only: both sets with Kshana's own UTC-to-ET conversion.
#[test]
#[ignore = "information only"]
fn information_only_with_the_engine_epoch_conversion() {
    for (label, set) in [
        ("2024, engine ET", &SET_2024),
        ("J2000, engine ET", &SET_J2000),
    ] {
        let r = compare(set, &|r: &Row| {
            kshana::naif_kernel::naif_et_from_utc(set.jd_day, (set.hour0 + r.hour as f64) * 3_600.0)
        });
        report(label, r);
    }
}
