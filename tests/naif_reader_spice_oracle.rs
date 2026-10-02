// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison for the engine's NAIF (Navigation and Ancillary Information Facility)
//! kernel reader, `naif_kernel`: the Double precision Array File (DAF) container, Spacecraft and
//! Planet Kernel (SPK) type 2 and binary Planetary Constants Kernel (PCK) type 2, read on the
//! Jet Propulsion Laboratory (JPL) Development Ephemeris DE440 kernels and checked against two
//! independent kernel readers on a random grid of epochs and bodies drawn after this
//! pre-registration was published.
//!
//! ## What the row claims, and what it does not
//!
//! The claim is "the engine reads JPL kernels correctly": given the same kernel records, it
//! returns the same states and rotations as the NAIF SPICE Toolkit and as ANISE. Both sides read
//! DE440, so agreement validates the reader, never the ephemeris: it says nothing about how
//! close DE440 is to the real solar system, and nothing about the engine's analytic Sun and
//! Moon series, which this test does not touch.
//!
//! ## Disclosure of the earlier, seen check
//!
//! `tests/naif_kernel_reader_check.rs` already compares the reader with SPICE on 25 hourly
//! epochs of 2024-01-01 (Moon and Earth only, worst position difference 4.6e-5 m against a
//! 1e-4 m assertion). That check was seen before this file was written, its epochs and bodies
//! were chosen by hand, and its bar was not derived in advance; it is an engineering regression
//! guard and is not the evidence for this row. This row uses a fresh grid that did not exist
//! when this file was committed.
//!
//! ## Pre-registration (written and published before the fixture was generated or any oracle run)
//!
//! * **Quantities.**
//!   (a) The geometric state (position, velocity) of a target body relative to an observer body
//!   in the J2000 frame, from `de440s.bsp`, through `SpkKernel::state(target, observer, hi, lo)`.
//!   (b) The rotation matrix from J2000 to the DE440 lunar principal-axis frame MOON_PA_DE440
//!   (NAIF frame 31008), from `moon_pa_de440_200625.bpc`, through
//!   `PckKernel::rotation_from_j2000(31008, hi, lo)`.
//! * **Grid, drawn after publication.** The random seed is the first 16 hexadecimal digits of
//!   the full SHA-1 hash of the git commit that adds this file, read as an unsigned integer and
//!   given to Python's `random.Random`. That hash cannot be known before the commit exists, so
//!   neither the epochs nor the bodies can have been chosen with the result in view. From it
//!   the generator draws, in this order:
//!   - 200 epochs, ephemeris time (ET, barycentric dynamical time seconds past J2000) uniform on
//!     the interval covered by every segment of both kernels, shrunk by one day at each end;
//!   - for each epoch, one ordered pair (target, observer) of distinct bodies, uniform over the
//!     15 bodies `de440s.bsp` carries: the solar-system barycentre 0, the barycentres 1 to 9,
//!     the Sun 10, Mercury 199, Venus 299, the Moon 301 and the Earth 399.
//!
//!   At every epoch two fixed pairs are added because they are the ones the engine's lunar paths
//!   consume: the Moon relative to the Earth (301, 399) and the Sun relative to the Earth
//!   (10, 399). That is 600 states and 200 rotations.
//! * **Epoch representation.** Each drawn ET is first passed through ANISE's own epoch type
//!   (`Epoch.init_from_et_seconds`, nanosecond resolution) and the value it gives back
//!   (`to_et_seconds`) is the epoch everyone uses: SPICE evaluates at that double, and the
//!   engine at `hi = round(et)`, `lo = et - hi` (both exact in double precision).
//! * **Oracle 1 (Library): NAIF SPICE Toolkit CSPICE N0067 through spiceypy 8.2.0 (MIT
//!   licence; the toolkit is NAIF's, freely distributed).** `spkezr(target, et, 'J2000',
//!   'NONE', observer)` for the states and `pxform('J2000', 'MOON_PA_DE440', et)` for the
//!   rotations, with `de440s.bsp`, `moon_pa_de440_200625.bpc`, `moon_de440_250416.tf` (which
//!   names the MOON_PA_DE440 frame) and `naif0012.tls` furnished. The full NAIF files are read,
//!   not the cut kernels below; their SHA-256 digests are pinned in this file.
//! * **Oracle 2 (Library): ANISE 0.10.6 (Nyx Space, Mozilla Public License 2.0), its Python
//!   distribution.** `Almanac.translate(Frame(target, J2000), Frame(observer, J2000), epoch,
//!   Aberration None)` for the states and `Almanac.rotate(Frame(301, J2000), Frame(301, 31008),
//!   epoch)` for the rotations, on the same full NAIF files. ANISE is a separate Rust
//!   reimplementation of SPICE's kernel reading and shares no code with SPICE or with Kshana.
//! * **Kernels given to the engine.** The generator copies, record for record and bit for bit,
//!   each type-2 Chebyshev record the grid needs from the full files into two small kernels in
//!   `tests/fixtures/naif_reader_spice_oracle/` (one single-record segment per record, so the
//!   engine must locate segments as well as records), and checks with SPICE that every
//!   comparison value is identical bit for bit between the full and the cut kernels before it
//!   writes anything. The data-gated test below repeats the comparison on the full NAIF files
//!   whenever they are present, so the cut is not load-bearing.
//! * **Tolerances, fixed now from double-precision Chebyshev evaluation.** A type-2 record holds
//!   at most 15 coefficients per component in these kernels; evaluating `n` terms in double
//!   precision (unit roundoff `u = 2^-53 = 1.1e-16`) by the three-term recurrence or by
//!   Clenshaw's algorithm has a forward error of order `n^2 u` times the sum of the coefficient
//!   magnitudes, at most `225 u = 2.5e-14` of the value's scale. Two independent evaluations,
//!   summed over at most two segment hops on each side, are bounded by 1e-13 of the scale.
//!   - Position, every component: `|d| <= 1e-13 R + 1e-5 m`, where `R` is the larger of
//!     `|r|` of the target and of the observer relative to their lowest common ancestor `C` in
//!     the kernel's centre tree (0 for barycentres 1 to 10; 1 for 199, 2 for 299, 3 for 301 and
//!     399), both taken from SPICE. The 1e-5 m floor covers the rounding of the normalised time
//!     argument, `|v| x radius x u` (at most 5e4 m/s x 1.4e6 s x 1.1e-16 = 7.7e-6 m).
//!   - Velocity, every component: `|d| <= 1e-13 V + 1e-10 m/s`, `V` the larger speed relative
//!     to `C`, from SPICE.
//!   - Rotation, every matrix element: `|d| <= 1e-13 W + 1e-15`, where `W` is the sum of the
//!     coefficient magnitudes of the three Euler-angle series in the covering MOON_PA_DE440
//!     record (radians), read by the generator through CSPICE's own DAF routines (`dafgda`).
//!     The third angle is stored unwrapped and reaches about 1e4 rad in this interval, so
//!     `W` is what sets the rounding of the matrix.
//!   - ANISE leg only: ANISE holds epochs to the nanosecond, so its bars add `2e-9 s` times the
//!     relative speed (from SPICE) to the position bar, `1e-12 m/s` to the velocity bar and
//!     `1e-14` to the rotation bar; nothing else differs.
//!
//!   PROMOTE only if all 600 states and 200 rotations hold against BOTH oracles. Any failure is
//!   published as a finding and the strict test stays ignored with the measured gap.
//! * **Mutation check, planned now.** After the comparison, a deliberate reader mutation
//!   (evaluating each record at `-s` instead of `s`) is applied and the strict test must turn
//!   red; the edit is then reverted.
//!
//! ## Result (run after the pre-registration commit abcd9133 was published)
//!
//! Seed 12379710599223412932 (commit abcd913310d988c4ccb0babae9144ea53af2b1a5). Disclosure:
//! the generator's first run aborted on its first SPICE call because it computed the grid
//! interval as the intersection of individual segments, which is empty for the lunar
//! orientation kernel (split in two at 2426); no oracle value was produced. The interval was
//! corrected to the intersection of each body's covered span, as the text above intends, and
//! the second run is the one recorded. The cut kernels hold 1051 SPK and 199 PCK records, each
//! verified by SPICE to evaluate bit for bit like the full files.
//!
//! All 600 states and 200 rotations are inside the bars against both oracles, on the cut
//! kernels and on the full NAIF files. Worst difference over its bar: position 6.0e-3 (SPICE)
//! and 6.0e-3 (ANISE), velocity 5.9e-3 and 5.9e-3, rotation 3.7e-3 and 3.5e-3. Worst absolute
//! position difference 1.95e-3 m (one unit in the last place of a barycentric outer-planet
//! position), worst rotation element 3.8e-12. Mutation: evaluating every record at `-s` turns
//! both strict tests red (3597 comparisons outside the bar); reverted.

// Index loops over the three axes read more plainly than iterator chains here.
#![allow(clippy::needless_range_loop)]

use kshana::naif_kernel::{PckKernel, SpkKernel};

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/naif_reader_spice_oracle/"
);

/// SHA-256 of the full NAIF files the oracles read (retrieved 2026-10-02 from
/// `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/`).
const DE440S_SHA256: &str = "c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2";
const MOON_PA_SHA256: &str = "60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f";

/// One state comparison row of the fixture.
struct StateRow {
    et: f64,
    target: i32,
    observer: i32,
    r_scale: f64,
    v_scale: f64,
    rel_speed: f64,
    spice: [f64; 6],
    anise: [f64; 6],
}

/// One rotation comparison row of the fixture.
struct RotRow {
    et: f64,
    w_scale: f64,
    spice: [f64; 9],
    anise: [f64; 9],
}

fn rows(file: &str) -> Vec<Vec<f64>> {
    std::fs::read_to_string(format!("{DIR}{file}"))
        .unwrap_or_else(|e| panic!("{file}: {e}"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            l.split(',')
                .map(|x| x.trim().parse::<f64>().expect("number"))
                .collect()
        })
        .collect()
}

fn state_rows() -> Vec<StateRow> {
    rows("states.csv")
        .into_iter()
        .map(|r| {
            assert_eq!(r.len(), 19, "states.csv row width");
            StateRow {
                et: r[1],
                target: r[2] as i32,
                observer: r[3] as i32,
                r_scale: r[4],
                v_scale: r[5],
                rel_speed: r[6],
                spice: r[7..13].try_into().unwrap(),
                anise: r[13..19].try_into().unwrap(),
            }
        })
        .collect()
}

fn rot_rows() -> Vec<RotRow> {
    rows("rotations.csv")
        .into_iter()
        .map(|r| {
            assert_eq!(r.len(), 21, "rotations.csv row width");
            RotRow {
                et: r[1],
                w_scale: r[2],
                spice: r[3..12].try_into().unwrap(),
                anise: r[12..21].try_into().unwrap(),
            }
        })
        .collect()
}

/// The two-part epoch the engine is given: `hi = round(et)`, `lo = et - hi`, both exact.
fn split(et: f64) -> (f64, f64) {
    let hi = et.round();
    (hi, et - hi)
}

/// Worst ratio of difference to bar over the comparison, per quantity and oracle; a ratio of at
/// most 1 everywhere is a pass.
#[derive(Default, Debug)]
struct Worst {
    pos_spice: f64,
    vel_spice: f64,
    rot_spice: f64,
    pos_anise: f64,
    vel_anise: f64,
    rot_anise: f64,
    pos_abs_spice: f64,
    rot_abs_spice: f64,
    /// Information only: worst absolute position difference from SPICE for the Moon relative to
    /// the Earth (m), the pair the lunar paths consume.
    moon_earth_abs_spice: f64,
    failures: usize,
}

fn compare(spk: &SpkKernel, pck: &PckKernel) -> Worst {
    let states = state_rows();
    let rots = rot_rows();
    assert_eq!(states.len(), 600, "pre-registered: 600 states");
    assert_eq!(rots.len(), 200, "pre-registered: 200 rotations");
    let mut w = Worst::default();
    for s in &states {
        let (hi, lo) = split(s.et);
        let st = spk
            .state(s.target, s.observer, hi, lo)
            .unwrap_or_else(|e| panic!("{} wrt {} at {}: {e}", s.target, s.observer, s.et));
        let bar_p = 1e-13 * s.r_scale + 1e-5;
        let bar_v = 1e-13 * s.v_scale + 1e-10;
        let bar_pa = bar_p + 2e-9 * s.rel_speed;
        let bar_va = bar_v + 1e-12;
        for k in 0..3 {
            let dp_s = (st[0][k] - s.spice[k] * 1e3).abs();
            let dv_s = (st[1][k] - s.spice[3 + k] * 1e3).abs();
            let dp_a = (st[0][k] - s.anise[k] * 1e3).abs();
            let dv_a = (st[1][k] - s.anise[3 + k] * 1e3).abs();
            w.pos_abs_spice = w.pos_abs_spice.max(dp_s);
            if (s.target, s.observer) == (301, 399) {
                w.moon_earth_abs_spice = w.moon_earth_abs_spice.max(dp_s);
            }
            w.pos_spice = w.pos_spice.max(dp_s / bar_p);
            w.vel_spice = w.vel_spice.max(dv_s / bar_v);
            w.pos_anise = w.pos_anise.max(dp_a / bar_pa);
            w.vel_anise = w.vel_anise.max(dv_a / bar_va);
            if dp_s > bar_p || dv_s > bar_v || dp_a > bar_pa || dv_a > bar_va {
                w.failures += 1;
                eprintln!(
                    "FAIL {} wrt {} at ET {}: axis {k} dpos SPICE {dp_s:.3e} / ANISE {dp_a:.3e} m \
                     (bar {bar_p:.3e}), dvel SPICE {dv_s:.3e} / ANISE {dv_a:.3e} m/s (bar {bar_v:.3e})",
                    s.target, s.observer, s.et
                );
            }
        }
    }
    for r in &rots {
        let (hi, lo) = split(r.et);
        let (m, _) = pck
            .rotation_from_j2000(31008, hi, lo)
            .unwrap_or_else(|e| panic!("MOON_PA_DE440 at {}: {e}", r.et));
        let bar = 1e-13 * r.w_scale + 1e-15;
        let bar_a = bar + 1e-14;
        for i in 0..3 {
            for j in 0..3 {
                let d_s = (m[i][j] - r.spice[3 * i + j]).abs();
                let d_a = (m[i][j] - r.anise[3 * i + j]).abs();
                w.rot_abs_spice = w.rot_abs_spice.max(d_s);
                w.rot_spice = w.rot_spice.max(d_s / bar);
                w.rot_anise = w.rot_anise.max(d_a / bar_a);
                if d_s > bar || d_a > bar_a {
                    w.failures += 1;
                    eprintln!(
                        "FAIL MOON_PA_DE440 at ET {}: element ({i},{j}) SPICE {d_s:.3e} / ANISE \
                         {d_a:.3e} (bar {bar:.3e})",
                        r.et
                    );
                }
            }
        }
    }
    eprintln!("worst difference over bar: {w:?}");
    w
}

/// The strict pre-registered comparison on the cut kernels committed with the fixture.
#[test]
fn reader_matches_spice_and_anise_on_the_post_registration_grid() {
    let spk = SpkKernel::open(std::path::Path::new(&format!("{DIR}grid_de440s.bsp"))).unwrap();
    let pck = PckKernel::open(std::path::Path::new(&format!(
        "{DIR}grid_moon_pa_de440.bpc"
    )))
    .unwrap();
    let w = compare(&spk, &pck);
    assert_eq!(w.failures, 0, "{} comparisons outside the bar", w.failures);
}

/// Where the full NAIF files the oracles read sit on this machine, if anywhere: the directory
/// named by `KSHANA_NAIF_DIR`, else `$KSHANA_ORACLES/data/naif`.
fn full_kernel_dir() -> Option<std::path::PathBuf> {
    let dir = std::env::var_os("KSHANA_NAIF_DIR")
        .map(std::path::PathBuf::from)
        .or_else(|| {
            std::env::var_os("KSHANA_ORACLES")
                .map(|r| std::path::PathBuf::from(r).join("data").join("naif"))
        })?;
    (dir.join("de440s.bsp").is_file() && dir.join("moon_pa_de440_200625.bpc").is_file())
        .then_some(dir)
}

fn sha256_hex(path: &std::path::Path) -> String {
    use sha2::{Digest, Sha256};
    let bytes = std::fs::read(path).expect("read kernel");
    Sha256::digest(&bytes)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect()
}

/// The same comparison and bars on the full NAIF files, when they are present (data-gated).
#[test]
fn reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present() {
    let Some(dir) = full_kernel_dir() else {
        eprintln!(
            "SKIP: full NAIF kernels not found (set KSHANA_NAIF_DIR to a directory holding \
             de440s.bsp and moon_pa_de440_200625.bpc); the cut-kernel test carries the row"
        );
        return;
    };
    let spk_path = dir.join("de440s.bsp");
    let pck_path = dir.join("moon_pa_de440_200625.bpc");
    assert_eq!(
        sha256_hex(&spk_path),
        DE440S_SHA256,
        "de440s.bsp is not NAIF's"
    );
    assert_eq!(
        sha256_hex(&pck_path),
        MOON_PA_SHA256,
        "moon_pa_de440_200625.bpc is not NAIF's"
    );
    let w = compare(
        &SpkKernel::open(&spk_path).unwrap(),
        &PckKernel::open(&pck_path).unwrap(),
    );
    assert_eq!(w.failures, 0, "{} comparisons outside the bar", w.failures);
}
