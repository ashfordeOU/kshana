// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison for `ephem_provider::KernelEphemeris` as a body-position provider at UTC
//! epochs: the Sun, Mercury, Venus, the Earth and the Moon, relative to one another, from the
//! Jet Propulsion Laboratory (JPL) Development Ephemeris DE440, against Skyfield.
//!
//! ## What this adds to the kernel reader row
//!
//! The reader row (`tests/naif_reader_spice_oracle.rs`) shows that the engine reads the kernel
//! records exactly, given ephemeris time. What it does not cover is what `KernelEphemeris` puts
//! on top: the mapping from body names to NAIF (Navigation and Ancillary Information Facility)
//! codes, the refusal to substitute a system barycentre for a planet, and the time chain from
//! UTC through the leap-second table, TT (terrestrial time) and the two-term TDB − TT series
//! to TDB (barycentric dynamical time). This row checks those, end to end, against an
//! implementation that shares none of them. Both sides read DE440, so it validates the provider,
//! not DE440's accuracy.
//!
//! ## Pre-registration (written and published before the fixture was generated or the oracle run)
//!
//! * **Quantity:** `KernelEphemeris::relative_position_utc(target, center, jd_utc)` (metres,
//!   J2000 axes, geometric), for target and center among `Sun`, `Mercury`, `Venus`, `Earth`,
//!   `Moon` named as `Body::name` names them.
//! * **Grid, drawn after publication:** seed = the first 16 hexadecimal digits of this file's
//!   pre-registration commit hash, given to Python's `random.Random`. It draws 200 UTC epochs as
//!   a whole day uniform on 1973-01-01 .. 2026-09-30 plus a whole second uniform on the day's
//!   first 86 399 seconds (so no epoch falls in a leap second), then one ordered pair of
//!   distinct bodies per epoch from the five. The Moon and the Sun relative to the Earth are
//!   added at every epoch: 600 positions.
//! * **Oracle (Library): Skyfield 1.54 (MIT licence), with its own reader of `de440s.bsp`
//!   (jplephem) and its own time scales.** Epochs given as `ts.utc(year, month, day, 0, 0,
//!   seconds)`; positions `(eph[target] - eph[center]).at(t).position.m` (geometric, ICRS, which
//!   is the axes of the J2000 label in JPL kernels). Skyfield's leap seconds and TDB − TT are
//!   its own. Run as a separate program; no Kshana code.
//! * **Engine input:** the kernel records the grid needs, copied bit for bit from NAIF's
//!   `de440s.bsp` into single-record segments (the reader row's fixture writer), checked with
//!   SPICE to evaluate identically; a data-gated test repeats the comparison on the full file.
//! * **Tolerance (fixed now), every component:** `|d| <= 5e-5 s x |v_rel| + 1e-13 R + 1e-5 m`.
//!   The time term is the engine's stated TDB − TT accuracy: its two-term series omits terms of
//!   the Fairhead and Bretagnon series that together stay below about 3e-5 s, and 5e-5 s covers
//!   that with margin; `|v_rel|` is the relative speed from Skyfield. The other two terms are
//!   the reader row's double-precision bar, `R` the larger distance of the two bodies from the
//!   solar-system barycentre (Skyfield). At most about 4 m for Mercury against the Earth, about
//!   5 cm for the Moon against the Earth.
//! * **Also asserted (engine only, no oracle):** a planet `de440s.bsp` holds only as a system
//!   barycentre (Mars to Neptune) and Pluto give `None`, never a barycentre position.
//! * **Outcome rule:** all 600 inside the bar: the row "Sun, Moon, Mercury and Venus positions
//!   from the DE440 kernel at UTC epochs (KernelEphemeris)" is proposed VALIDATED. Otherwise a
//!   finding, published with the gap.
//! * **Mutation check, planned now:** dropping the TDB − TT term (TT used as TDB, an error up to
//!   1.7 ms) must turn the strict test red; the edit is then reverted.

// Index loops over the three axes read more plainly than iterator chains here.
#![allow(clippy::needless_range_loop)]

use kshana::body::Body;
use kshana::ephem_provider::KernelEphemeris;
use kshana::jd2::Jd2;

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/kernel_ephemeris_skyfield_oracle/"
);

/// One row: UTC day start (JD), seconds of day, target, center, R (m), relative speed (m/s),
/// Skyfield position (m).
struct Row {
    jd_day: f64,
    sec: f64,
    target: String,
    center: String,
    r_scale: f64,
    rel_speed: f64,
    want: [f64; 3],
}

fn rows() -> Vec<Row> {
    std::fs::read_to_string(format!("{DIR}positions.csv"))
        .expect("positions.csv")
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 10, "row width");
            let n = |i: usize| f[i].trim().parse::<f64>().expect("number");
            Row {
                jd_day: n(1),
                sec: n(2),
                target: f[3].trim().to_string(),
                center: f[4].trim().to_string(),
                r_scale: n(5),
                rel_speed: n(6),
                want: [n(7), n(8), n(9)],
            }
        })
        .collect()
}

fn compare(k: &KernelEphemeris) -> usize {
    let rows = rows();
    assert_eq!(rows.len(), 600, "pre-registered: 600 positions");
    let (mut worst, mut worst_abs, mut fails) = (0.0f64, 0.0f64, 0usize);
    for r in &rows {
        let t = Body::by_name(&r.target).expect("body");
        let c = Body::by_name(&r.center).expect("body");
        let jd = Jd2::from_parts(r.jd_day, r.sec / 86_400.0);
        let got = k.relative_position_utc(&t, &c, jd).unwrap_or_else(|| {
            panic!(
                "{} wrt {} at {} + {} s",
                r.target, r.center, r.jd_day, r.sec
            )
        });
        let bar = 5e-5 * r.rel_speed + 1e-13 * r.r_scale + 1e-5;
        for i in 0..3 {
            let d = (got[i] - r.want[i]).abs();
            worst = worst.max(d / bar);
            worst_abs = worst_abs.max(d);
            if d > bar {
                fails += 1;
                eprintln!(
                    "FAIL {} wrt {} at JD {} + {} s axis {i}: {d:.3e} m > {bar:.3e} m",
                    r.target, r.center, r.jd_day, r.sec
                );
            }
        }
    }
    eprintln!("worst difference over bar {worst:.3e}; worst absolute {worst_abs:.3e} m");
    fails
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn kernel_ephemeris_matches_skyfield_at_utc_epochs() {
    let k = KernelEphemeris::open(std::path::Path::new(&format!("{DIR}grid_de440s.bsp")))
        .expect("cut kernel");
    assert_eq!(compare(&k), 0);
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present() {
    let dir = std::env::var_os("KSHANA_NAIF_DIR")
        .map(std::path::PathBuf::from)
        .or_else(|| {
            std::env::var_os("KSHANA_ORACLES")
                .map(|r| std::path::PathBuf::from(r).join("data").join("naif"))
        });
    let Some(p) = dir.map(|d| d.join("de440s.bsp")).filter(|p| p.is_file()) else {
        eprintln!(
            "SKIP: de440s.bsp not found (set KSHANA_NAIF_DIR); the cut-kernel test carries the row"
        );
        return;
    };
    let k = KernelEphemeris::open(&p).expect("full kernel");
    assert_eq!(
        k.kernel_sha256(),
        "c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2"
    );
    assert_eq!(compare(&k), 0);
}

/// A body `de440s.bsp` holds only as a system barycentre is refused, never substituted.
#[test]
fn barycentre_only_bodies_are_refused_not_substituted() {
    let k = KernelEphemeris::open(std::path::Path::new(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/lunar_vlbi_anise_oracle/kernels/de440s_2024-01-01.bsp"
    )))
    .expect("cut kernel");
    let jd = Jd2::from_parts(2_460_311.0, 0.0);
    for name in ["Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto"] {
        let b = Body::by_name(name).expect(name);
        assert!(
            k.relative_position_utc(&b, &Body::earth(), jd).is_none(),
            "{name} must be refused"
        );
    }
}
