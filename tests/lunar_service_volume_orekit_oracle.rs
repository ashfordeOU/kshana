// SPDX-License-Identifier: AGPL-3.0-only
//! Library comparison for the lunar service volume on the LNCSS constellations of navi.613,
//! propagated in the Earth orbital-plane (OP) frame under a perturbed force model, against
//! Orekit computing the same scenario on identical ephemeris and grid. Also the re-run, with
//! the same engine path, of the round-1 comparison against the paper's published statistics.
//!
//! ## Pre-registration (written 2026-10-02, before the oracle was run and before Kshana's
//! statistics on this path were computed)
//!
//! Why a new oracle: round 1 compared Kshana with the statistics navi.613 prints (Tables 4 and
//! 5) and found 4 of 12 outside 2 percentage points; the paper's STK force model, the
//! orientation convention of its OP frame and its 334-point grid are not reproducible from the
//! text, so the paper cannot isolate an engine error from a scenario difference. Here both sides
//! compute one fully specified scenario. (Correction to the round-1 record: the paper does state
//! its epoch, 9 Nov 2025 00:00:00 UTC, Section 3.2.)
//!
//! * Scenario (both sides): epoch 2025-11-09T00:00:00 UTC, 15 days. Elements of LNCSS cases A
//!   (8), B (12) and C (16 satellites) from `tests/fixtures/lunar_ephemeris/lncss_case_*.csv`
//!   (navi.613 Table 1), interpreted in the OP frame frozen at the epoch: `z` along `r x v` of
//!   the Earth relative to the Moon (DE440, geometric), `x = p x z` with `p` the IAU lunar pole
//!   (pck00011 BODY301 model), `y = z x x`; Keplerian with the gm_de440 lunar GM. (Every case is
//!   symmetric under a 180 deg node shift, so the sign of `x` cannot change a result.)
//! * Force model (both sides): lunar GM 4.902800118457549e12 m^3/s^2; J2 = 2.0321e-4 and
//!   C22 = 2.2382e-5 (unnormalised, S22 = 0, reference radius 1737.4 km) in the IAU Moon-fixed
//!   frame; Earth (3.986004355070226e14) and Sun (1.3271244004127939e20) point masses at DE440
//!   positions, with the indirect term. Moon-centred integration with ICRF axes.
//! * Kshana: `lunar_perturbed::op_frame`, `elements_in_frame_to_state`, `propagate_tabulated`
//!   (fourth-order Runge-Kutta, fixed 10 s step, ephemeris from the engine's own reader on the
//!   cut kernel `tests/fixtures/lunar_service_volume_orekit_oracle/de440s_2025-11-09_15d.bsp`,
//!   epoch ET from `naif_kernel::naif_et_from_utc`), Moon-fixed frame
//!   `lunar_frame::icrf_to_iau_moon`, statistics `lunar_service::service_volume_figures`.
//! * Oracle (kind: Library): Orekit 12.2 with Hipparchus 3.1 (Apache-2.0), run as a separate
//!   program, `xval/orekit-lunar-service/LunarServiceVolumeOracle.java`: its own DE440
//!   (`lnxp1990.440`), IAU Moon body frame, KeplerianOrbit, NumericalPropagator with
//!   Dormand-Prince 8(5,3) at 1e-3 m, Holmes-Featherstone field, ThirdBodyAttraction, and its
//!   own visibility, DOP (Hipparchus LU inverse) and statistics. Output committed as
//!   `tests/fixtures/lunar_service_volume_orekit_oracle/orekit_lncss.csv`.
//! * Grid (both sides): 346 users on the 1737.4 km sphere, rings every 1 deg from 80 S to
//!   89 S with round(360 cos lat) longitudes from 0 E, plus the pole, in the IAU Moon-fixed
//!   frame. Visible: elevation above the local spherical horizontal at least the mask (5 and
//!   20 deg). Samples every 60 s, t = 0 .. 15 d - 60 s.
//! * Statistics per case and mask: availability (at least 4 visible) and single-failure
//!   tolerance (at least 5) at the worst grid point, the minimum over points and days of the
//!   daily share of samples; coverage, the share of all (point, sample) pairs with at least 4;
//!   the medians of PDOP and GDOP over the pairs with a defined DOP (mean of the middle two for
//!   an even count). 30 values.
//! * Tolerances: every satellite position (Moon-centred ICRF) at the 61 six-hourly epochs
//!   within **100 m** of Orekit's (an elevation change below 0.008 deg at the closest user
//!   range, about 720 km; Kshana's own 10 s step differs from a 2.5 s step by 0.16 m, measured
//!   before this was written); availability, failure tolerance and coverage within **2
//!   percentage points** (the plan's coverage bar, as in round 1); the PDOP and GDOP medians
//!   within **5 %** (the plan's PDOP bar). PROMOTE only if all 2 196 positions and all 30
//!   values pass.
//! * Re-run of round 1 (rule: an engine fix may be re-run against an existing pre-registered
//!   tolerance unchanged): the availability and failure-tolerance values of this path against
//!   the 12 navi.613 values, within the round-1 2 percentage points. Reported either way.
//! * Disclosed before running: the round-1 result; the engine's step convergence above; a
//!   timing run of the sweep on case-C elements with a test grid that printed only the sample
//!   count (no statistic was looked at).
//!
//! ## Oracle correction (2026-10-02, after the first oracle run; Kshana side and bars unchanged)
//!
//! The first run of the driver integrated in Orekit's Moon "inertially oriented" frame, which
//! follows the IAU lunar pole at date (its axes turned by 1.3e-4 rad over the first day), not in
//! the pre-registered Moon-centred frame with ICRF axes, so its propagation dropped the
//! fictitious forces of a turning frame. That run gave positions up to 17.6 km from Kshana's
//! (203 m after 6 h on case A satellite 0, from identical initial states and identical
//! Moon-fixed rotations, checked to 1e-10), while all 30 statistics were inside their bars. The
//! driver now integrates in a pure translation of GCRF to the Moon's centre, as pre-registered,
//! and the comparison is re-run with nothing else changed. Both runs are in the record.
//!
//! ## Result (2026-10-02, the corrected oracle run; nothing on the Kshana side tuned): AGREES
//!
//! * Positions: 2 196 of 2 196 within 100 m; worst 4.633 m.
//! * Statistics, Kshana / Orekit (availability %, failure tolerance %, coverage %, PDOP
//!   median, GDOP median): all 30 within their bars.
//!   - A 5 deg: 100 / 100, 90.9028 / 90.9028, 100 / 100, 3.619285 / 3.619282, 4.133311 / 4.133309
//!   - A 20 deg: 94.5139 / 94.5139, 35.5556 / 35.5556, 99.93588 / 99.93588, 5.780673 / 5.780657,
//!     6.755799 / 6.755775
//!   - B 5 deg: 100 / 100, 100 / 100, 100 / 100, 4.172000 / 4.171997, 4.848393 / 4.848389
//!   - B 20 deg: 100 / 100, 89.6528 / 89.6528, 100 / 100, 4.640340 / 4.640330, 5.433883 / 5.433866
//!   - C 5 deg: 100 / 100, 100 / 100, 100 / 100, 2.030921 / 2.030921, 2.303532 / 2.303532
//!   - C 20 deg: 100 / 100, 100 / 100, 100 / 100, 3.756245 / 3.756245, 4.378976 / 4.378976
//! * Mutation (red, then reverted by editing the file back): the Earth third body removed from
//!   `EphemerisForceModel::de440`: positions worst 1 462.7 km, and case A's 5 deg failure
//!   tolerance and 20 deg availability and failure tolerance move outside 2 pp.
//! * Round-1 re-run against navi.613 (same 2 pp): still DISAGREES on 4 of 12, now case A
//!   failure tolerance 5 deg -7.00 pp, availability 20 deg +17.00 pp, failure tolerance 20 deg
//!   -18.55 pp, and case B failure tolerance 20 deg -10.35 pp (round 1, on the MCI two-body
//!   reading: -4.01, +22.49, -3.55, -12.08). With the scenario now computed identically by an
//!   independent library, the remaining gap to the paper is in what the paper does not state
//!   (STK's force model, its OP-frame orientation convention, its 334-point grid), not in this
//!   engine. Pinned by `published_statistics_finding_is_unchanged`.
//!
//! Debug-build runtime about five minutes (36 propagations and 6 sweeps of 7.5 million
//! samples); `cargo test --release` about a minute.

use std::sync::OnceLock;

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_perturbed::{
    elements_in_frame_to_state, op_frame, propagate_tabulated, EphemerisForceModel,
    TabulatedConstellation, GM_MOON_DE440,
};
use kshana::lunar_service::{service_volume_figures, ServiceVolumeFigures};
use kshana::naif_kernel::{naif_et_from_utc, SpkKernel};

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lunar_service_volume_orekit_oracle/"
);
const POS_TOL_M: f64 = 100.0;
const PP_TOL: f64 = 2.0;
const DOP_REL_TOL: f64 = 0.05;
const CASES: [&str; 3] = ["A", "B", "C"];
const MASKS_DEG: [f64; 2] = [5.0, 20.0];

fn elements(case: &str) -> Vec<[f64; 6]> {
    let p = format!(
        "{}/tests/fixtures/lunar_ephemeris/lncss_case_{}_navi613.csv",
        env!("CARGO_MANIFEST_DIR"),
        case.to_lowercase()
    );
    std::fs::read_to_string(&p)
        .unwrap_or_else(|e| panic!("read {p}: {e}"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("sat") && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<f64> = l.split(',').map(|x| x.trim().parse().unwrap()).collect();
            [f[1], f[2], f[3], f[4], f[5], f[6]]
        })
        .collect()
}

fn grid() -> Vec<[f64; 3]> {
    let mut pts = Vec::new();
    for lat in 80..90 {
        let lat_deg = -(lat as f64);
        let n = (360.0 * lat_deg.to_radians().cos()).round() as usize;
        for k in 0..n {
            pts.push(selenographic_to_mcmf(Selenographic {
                lat_rad: lat_deg.to_radians(),
                lon_rad: (360.0 * k as f64 / n as f64).to_radians(),
                alt_m: 0.0,
            }));
        }
    }
    pts.push(selenographic_to_mcmf(Selenographic {
        lat_rad: -std::f64::consts::FRAC_PI_2,
        lon_rad: 0.0,
        alt_m: 0.0,
    }));
    pts
}

/// Kshana's propagated constellations and figures, computed once for both tests.
struct Kshana {
    tabs: Vec<TabulatedConstellation>,
    figures: Vec<[ServiceVolumeFigures; 2]>,
}

fn kshana() -> &'static Kshana {
    static K: OnceLock<Kshana> = OnceLock::new();
    K.get_or_init(|| {
        let spk = SpkKernel::open(std::path::Path::new(&format!(
            "{DIR}de440s_2025-11-09_15d.bsp"
        )))
        .expect("cut kernel");
        let et0 = naif_et_from_utc(2_460_988.5, 0.0);
        let op = op_frame(&spk, et0.0, et0.1).expect("OP frame");
        let model = EphemerisForceModel::de440();
        let users = grid();
        // PIN-SCOPE:    the size of the committed user grid the Orekit oracle was run on, so the
        //               engine and the oracle compare the same points.
        // PIN-EXCLUDES: every service-volume figure; those are compared against the oracle values.
        assert_eq!(users.len(), 346);
        let mut tabs = Vec::new();
        let mut figures = Vec::new();
        for case in CASES {
            let states: Vec<_> = elements(case)
                .iter()
                .map(|e| {
                    elements_in_frame_to_state(
                        GM_MOON_DE440,
                        &op,
                        e[0] * 1e3,
                        e[1],
                        e[2],
                        e[3],
                        e[4],
                        e[5],
                    )
                })
                .collect();
            let tab = propagate_tabulated(&spk, &model, &states, et0, 15.0 * 86_400.0, 10.0, 60.0)
                .expect("propagation");
            let f =
                MASKS_DEG.map(|m| service_volume_figures(&tab, &users, 60.0, 15, m.to_radians()));
            tabs.push(tab);
            figures.push(f);
        }
        Kshana { tabs, figures }
    })
}

/// Orekit rows: figures (case, mask) -> 6 numbers, and positions (case, sat, hour) -> xyz.
#[allow(clippy::type_complexity)]
fn orekit() -> (
    Vec<(String, f64, [f64; 6])>,
    Vec<(String, usize, usize, [f64; 3])>,
) {
    let text = std::fs::read_to_string(format!("{DIR}orekit_lncss.csv")).expect("oracle CSV");
    let (mut fig, mut pos) = (Vec::new(), Vec::new());
    for l in text.lines().filter(|l| !l.starts_with('#')) {
        let f: Vec<&str> = l.split(',').collect();
        let n = |i: usize| f[i].parse::<f64>().unwrap();
        match f[0] {
            "figures" => fig.push((f[1].to_string(), n(2), [n(3), n(4), n(5), n(6), n(7), n(8)])),
            "position" => pos.push((
                f[1].to_string(),
                f[2].parse().unwrap(),
                f[3].parse().unwrap(),
                [n(4), n(5), n(6)],
            )),
            _ => {}
        }
    }
    (fig, pos)
}

/// The pre-registered comparison against Orekit.
#[test]
fn service_volume_matches_orekit_on_identical_ephemeris_and_grid() {
    let k = kshana();
    let (fig, pos) = orekit();
    assert_eq!(
        pos.len(),
        36 * 61,
        "every satellite at 61 six-hourly epochs"
    );
    assert_eq!(fig.len(), 6, "3 cases x 2 masks");
    let mut worst_pos: f64 = 0.0;
    for (case, sat, hour, p) in &pos {
        let c = CASES.iter().position(|x| x == case).unwrap();
        let q = k.tabs[c].positions_icrf(hour * 60)[*sat];
        let d = ((q[0] - p[0]).powi(2) + (q[1] - p[1]).powi(2) + (q[2] - p[2]).powi(2)).sqrt();
        worst_pos = worst_pos.max(d);
    }
    eprintln!("M076 positions: worst |Kshana - Orekit| {worst_pos:.3} m over 2196");
    let mut failures = Vec::new();
    if worst_pos > POS_TOL_M {
        failures.push(format!("position {worst_pos:.3} m"));
    }
    let names = [
        "availability %",
        "failure tolerance %",
        "coverage %",
        "PDOP median",
        "GDOP median",
    ];
    for (case, mask, o) in &fig {
        let c = CASES.iter().position(|x| x == case).unwrap();
        let m = MASKS_DEG.iter().position(|x| x == mask).unwrap();
        let f = &k.figures[c][m];
        let ks = [
            f.availability_worst_min_day_pct,
            f.failure_tolerance_worst_min_day_pct,
            f.coverage_pct,
            f.pdop_median.unwrap_or(f64::NAN),
            f.gdop_median.unwrap_or(f64::NAN),
        ];
        for i in 0..5 {
            let (kv, ov) = (ks[i], o[i]);
            let ok = if i < 3 {
                (kv - ov).abs() <= PP_TOL
            } else {
                ((kv - ov) / ov).abs() <= DOP_REL_TOL
            };
            eprintln!(
                "  case {case} mask {mask:4.1} {:<20} Kshana {kv:12.6} Orekit {ov:12.6} {}",
                names[i],
                if ok { "ok" } else { "OUTSIDE" }
            );
            if !ok {
                failures.push(format!("case {case} mask {mask} {}", names[i]));
            }
        }
        eprintln!(
            "  case {case} mask {mask:4.1} DOP samples Kshana {} Orekit {}",
            f.n_dop, o[5]
        );
    }
    assert!(
        failures.is_empty(),
        "outside the pre-registered bars: {failures:?}"
    );
}

/// navi.613 Tables 4 and 5: [availability 5 deg, tolerance 5 deg, availability 20 deg,
/// tolerance 20 deg] per case.
const PUBLISHED: [[f64; 4]; 3] = [
    [100.0, 97.9, 77.51, 54.11],
    [100.0, 100.0, 100.0, 100.0],
    [100.0, 100.0, 100.0, 100.0],
];

/// The round-1 comparison with the paper, re-run unchanged on the OP-frame perturbed path.
#[test]
#[ignore = "disagrees with navi.613 on 4 of 12 (A: -7.00, +17.00, -18.55 pp; B: -10.35 pp); finding M076"]
fn published_availability_rerun_on_the_op_frame_perturbed_path() {
    let k = kshana();
    let mut failures = Vec::new();
    for (c, case) in CASES.iter().enumerate() {
        let got = [
            k.figures[c][0].availability_worst_min_day_pct,
            k.figures[c][0].failure_tolerance_worst_min_day_pct,
            k.figures[c][1].availability_worst_min_day_pct,
            k.figures[c][1].failure_tolerance_worst_min_day_pct,
        ];
        for i in 0..4 {
            let d = got[i] - PUBLISHED[c][i];
            eprintln!(
                "  round-1 re-run case {case} value {i}: Kshana {:7.2} published {:7.2} diff {d:+7.2} pp",
                got[i], PUBLISHED[c][i]
            );
            if d.abs() > PP_TOL {
                failures.push(format!("case {case} value {i}: {d:+.2} pp"));
            }
        }
    }
    assert!(
        failures.is_empty(),
        "outside the round-1 2 pp: {failures:?}"
    );
}

/// The finding against the paper stays exactly what was measured: the four disagreeing values
/// and the eight that agree, on the OP-frame perturbed path.
#[test]
fn published_statistics_finding_is_unchanged() {
    let k = kshana();
    let got: Vec<[f64; 4]> = (0..3)
        .map(|c| {
            [
                k.figures[c][0].availability_worst_min_day_pct,
                k.figures[c][0].failure_tolerance_worst_min_day_pct,
                k.figures[c][1].availability_worst_min_day_pct,
                k.figures[c][1].failure_tolerance_worst_min_day_pct,
            ]
        })
        .collect();
    let recorded = [
        [100.0, 90.902_777_8, 94.513_888_9, 35.555_555_6],
        [100.0, 100.0, 100.0, 89.652_777_8],
        [100.0, 100.0, 100.0, 100.0],
    ];
    for c in 0..3 {
        for i in 0..4 {
            assert!(
                (got[c][i] - recorded[c][i]).abs() < 1e-6,
                "case {} value {i}: {} moved from the recorded {}",
                CASES[c],
                got[c][i],
                recorded[c][i]
            );
        }
    }
}
