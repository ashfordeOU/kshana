// SPDX-License-Identifier: AGPL-3.0-only
//! Receiver-domain parity of Kshana's PPP and single-point solutions with gLAB and RTKLIB on the
//! same real WTZR inputs (RM-31). DATA-GATED: the oracle outputs are produced by
//! `xval/ppp-parity/run.sh` (gLAB and RTKLIB run as separate programs) into
//! `tests/fixtures/gnss_wettzell_2025055/oracle/` or the directory named by
//! `KSHANA_PPP_PARITY_DIR`. Both tools' outputs from the registered runs are committed there.
//!
//! PRE-REGISTRATION: `xval/ppp-parity/PREREGISTRATION.md` (1061480), committed on its own before
//! any oracle run. Per tool: R1 PPP 3-D difference ≤ 0.05 m at ≥ 95 % of the common epochs of
//! 04:00-05:59:30; R2 PPP last common epoch ≤ 0.03 m; R3 SPP median 3-D difference ≤ 0.50 m;
//! non-vacuity 200 PPP and 600 SPP common epochs.
//!
//! RESULT, RTKLIB leg, first registered run (2026-10-13; RTKLIB v2.4.2-p13 outputs committed in
//! 96dd27a after amendment 1, 71b7f63), recorded as a FINDING; bars unchanged. R1 does not hold:
//! 0 of 240 epochs of 04:00-05:59:30 within 0.05 m. R2 does not hold: 0.146 m at the last epoch.
//! R3 does not hold: SPP median difference 1.085 m over 719 epochs. Diagnosis after the run: the
//! RTKLIB PPP solution is itself 0.131 m (median, 04-06 h) from the ITRF2020 coordinate, with
//! +0.108 m up at the last epoch, against Kshana's 0.029 m up: the registered configuration
//! `rtklib_ppp.conf` never set `pos1-tidecorr`, so RTKLIB ran without the solid Earth tide that
//! Kshana applies (the up component of the tide at Wettzell is of that size). The SPP difference
//! is the two tools' independent metre-level code errors (RTKLIB single mode applies no satellite
//! antenna offset and weights differently): RTKLIB's own SPP is 1.62 m (median) from ITRF2020,
//! Kshana's 1.55 m (01-06 h, tests/hatch_wettzell_oracle.rs). A corrected configuration is a NEW registration (amendment 2) with this
//! result disclosed; this one stands as recorded. gLAB leg: not run.
//!
//! Amendment 2 (3d01186, tide on): R1 0 %, R2 0.232 m, a FINDING: RTKLIB then sat +0.19 to
//! +0.20 m up with the horizontal near zero, because the registered configuration put the
//! receiver antenna on RTKLIB's base slot (`ant2-*`); the tide diagnosis above was incomplete.
//! Amendment 3 (6e89494, the last registration: tide on, antenna on the rover slot): R1 240 of
//! 240 epochs within 0.05 m (100 %), R2 0.0097 m at the last epoch: Kshana's float PPP and
//! RTKLIB's agree to the registered bars once RTKLIB is configured as the registration intended.
//! Outcome by the registered rule: the RTKLIB leg is NOT met as a whole, because R3 (SPP,
//! 1.085 m against 0.50 m) failed and is not re-registered; PPP parity holds on amendment 3.
//!
//! RESULT, gLAB leg, first registered run (2026-10-13; gLAB 6.0.0 Linux, SHA-256 046ab9fd…21dd,
//! Apache-2.0 core, with the command line of amendment 4, 15a887a4, committed before the run).
//! R1 holds: 240 of 240 epochs of 04:00-05:59:30 within 0.05 m. R2 holds: 0.0050 m at the last
//! epoch. R3 does not hold: SPP median 1.187 m over 713 epochs against the 0.50 m bar, a
//! FINDING. Diagnosis after the run: the two reference tools' own SPP solutions differ from each
//! other by 0.852 m (median, 713 epochs). Epoch-by-epoch ionosphere-free code solutions are
//! noise-limited at that level (each oracle's SPP is 1.6 to 1.8 m, median, from its converged
//! PPP position), so the registered R3 bar was set tighter than tool-to-tool agreement allows.
//! The bar is not loosened. Outcome by the registered rule: the gLAB leg is NOT met as a whole,
//! because R3 failed; PPP parity with gLAB holds on the first run.

use kshana::gnss_sim::Meteo;
use kshana::ppp_real::{parse_antex_receiver, run_ppp, PppConfig};
use kshana::precise_products::{parse_antex_satellites, parse_clock_rinex, PreciseProducts};
use kshana::pvt::{assemble_epoch_precise, solve_spp};
use kshana::rinex_obs::{parse_obs, RinexObs};
use kshana::sp3::parse_sp3;
use std::collections::{BTreeMap, HashMap};
use std::path::PathBuf;

fn fixtures() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures")
}

fn read(dir: &str, name: &str) -> String {
    let p = fixtures().join(dir).join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

const DIR: &str = "gnss_wettzell_2025055";
/// The WTZR header position, used only to reject a mis-converted oracle file.
const NEAR: [f64; 3] = [4_075_580.886_3, 931_853.578_4, 4_801_567.970_7];

fn products() -> PreciseProducts {
    let sp3 = parse_sp3(&read("sp3_clock_igs_oracle", "igs_2025055_G.sp3")).unwrap();
    let clk = parse_clock_rinex(&read(DIR, "igs_2025055_G_05m_0006.clk")).unwrap();
    let atx = parse_antex_satellites(&read(DIR, "igs20_2025055_G_LEIAR25.atx")).unwrap();
    PreciseProducts::new(&sp3, clk, atx, HashMap::new(), 600.0)
}

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// Second of day (rounded to the millisecond, as an integer key) to position.
type Track = BTreeMap<i64, [f64; 3]>;

fn key(sod: f64) -> i64 {
    (sod * 1000.0).round() as i64
}

fn load(dir: &std::path::Path, name: &str) -> Option<Track> {
    let text = std::fs::read_to_string(dir.join(name)).ok()?;
    let mut t = Track::new();
    for l in text.lines().filter(|l| !l.trim().is_empty()) {
        let v: Vec<f64> = l.split(',').map(|s| s.trim().parse().unwrap()).collect();
        let p = [v[1], v[2], v[3]];
        assert!(
            dist(p, NEAR) < 100.0,
            "{name}: {l} is not near WTZR (column mismatch?)"
        );
        t.insert(key(v[0]), p);
    }
    Some(t)
}

fn kshana_ppp(obs: &RinexObs) -> Track {
    let cfg = PppConfig {
        antenna: parse_antex_receiver(
            &read(DIR, "igs20_2025055_G_LEIAR25.atx"),
            "LEIAR25.R3      LEIT",
        ),
        arp_une_m: [0.0710, 0.0, 0.0],
        ..PppConfig::default()
    };
    run_ppp(obs, &products(), &cfg)
        .epochs
        .iter()
        .map(|e| (key(e.t_gps_s.rem_euclid(86_400.0)), e.pos_ecef_m))
        .collect()
}

fn kshana_spp(obs: &RinexObs) -> Track {
    let prod = products();
    let meteo = Meteo::default();
    let mut ap = obs.header.approx_xyz.unwrap();
    let mut t = Track::new();
    for k in 0..obs.epochs.len() {
        let e = &obs.epochs[k].time;
        let sod = e.hour as f64 * 3600.0 + e.minute as f64 * 60.0 + e.second;
        for _ in 0..if k == 0 { 3 } else { 1 } {
            let m: Vec<_> = assemble_epoch_precise(obs, k, &prod, ap, &meteo, 10.0)
                .into_iter()
                .map(|(_, m)| m)
                .collect();
            if let Some(f) = solve_spp(&m, ap) {
                ap = f.ecef;
                t.insert(key(sod), f.ecef);
            }
        }
    }
    t
}

struct Outcome {
    r1_frac: f64,
    r1_n: usize,
    r2: f64,
    r3_median: f64,
    r3_n: usize,
}

fn compare(ks_ppp: &Track, ks_spp: &Track, tool_ppp: &Track, tool_spp: &Track) -> Outcome {
    let win: Vec<f64> = ks_ppp
        .iter()
        .filter(|(k, _)| (14_400_000..21_600_000).contains(*k))
        .filter_map(|(k, p)| tool_ppp.get(k).map(|q| dist(*p, *q)))
        .collect();
    let last = ks_ppp
        .iter()
        .rev()
        .find_map(|(k, p)| tool_ppp.get(k).map(|q| dist(*p, *q)))
        .unwrap_or(f64::INFINITY);
    let mut spp: Vec<f64> = ks_spp
        .iter()
        .filter_map(|(k, p)| tool_spp.get(k).map(|q| dist(*p, *q)))
        .collect();
    spp.sort_by(f64::total_cmp);
    Outcome {
        r1_frac: win.iter().filter(|&&d| d <= 0.05).count() as f64 / win.len().max(1) as f64,
        r1_n: win.len(),
        r2: last,
        r3_median: spp.get(spp.len() / 2).copied().unwrap_or(f64::INFINITY),
        r3_n: spp.len(),
    }
}

fn oracle_dir() -> PathBuf {
    std::env::var("KSHANA_PPP_PARITY_DIR")
        .map(PathBuf::from)
        .unwrap_or_else(|_| fixtures().join(DIR).join("oracle"))
}

/// The comparison against `tool`'s outputs (`{tool}_ppp.csv`, `{tool}_spp.csv` in `dir`), or
/// `None` when they are absent.
fn compare_tool(dir: &std::path::Path, tool: &str, ppp_file: &str) -> Option<Outcome> {
    let tp = load(dir, ppp_file)?;
    let ts = load(dir, &format!("{tool}_spp.csv"))?;
    let obs = parse_obs(&read(DIR, "wtzr_2025055_0006_G.rnx")).unwrap();
    let o = compare(&kshana_ppp(&obs), &kshana_spp(&obs), &tp, &ts);
    eprintln!(
        "{tool} ({ppp_file}): R1 {:.1} % of {} epochs within 0.05 m; R2 last {:.4} m; R3 median {:.3} m over {} epochs",
        100.0 * o.r1_frac,
        o.r1_n,
        o.r2,
        o.r3_median,
        o.r3_n
    );
    Some(o)
}

fn assert_bars(tool: &str, o: &Outcome) {
    assert!(o.r1_n >= 200 && o.r3_n >= 600, "{tool}: non-vacuity");
    assert!(o.r1_frac >= 0.95, "{tool}: R1");
    assert!(o.r2 <= 0.03, "{tool}: R2");
    assert!(o.r3_median <= 0.50, "{tool}: R3");
}

/// The gLAB leg as registered (1061480, command line of amendment 4, 15a887a4): R1 and R2 held
/// on its first run, R3 missed.
#[test]
#[ignore = "FINDING: gLAB leg R3 SPP median 1.187 m against 0.50 m (R1 100 %, R2 0.0050 m held); see the module header"]
fn glab_parity_as_registered() {
    let o = compare_tool(&oracle_dir(), "glab", "glab_ppp.csv").expect("committed gLAB outputs");
    assert_bars("glab", &o);
}

/// The gLAB PPP bars R1 and R2, which held on the first registered run.
#[test]
fn glab_ppp_r1_r2_hold() {
    let o = compare_tool(&oracle_dir(), "glab", "glab_ppp.csv").expect("committed gLAB outputs");
    assert!(o.r1_n >= 200, "non-vacuity");
    assert!(o.r1_frac >= 0.95, "R1");
    assert!(o.r2 <= 0.03, "R2");
}

// PIN-SCOPE:    the recorded gLAB R3 finding and the epoch counts of the first registered run, on
//               the committed gLAB outputs.
// PIN-EXCLUDES: the registered bars (kept in the ignored test) and the RTKLIB leg.
#[test]
fn glab_finding_is_pinned() {
    let o = compare_tool(&oracle_dir(), "glab", "glab_ppp.csv").expect("committed gLAB outputs");
    assert_eq!((o.r1_n, o.r3_n), (240, 713));
    assert!((o.r2 - 0.0050).abs() < 5e-4, "{}", o.r2);
    assert!((o.r3_median - 1.187).abs() < 5e-4, "{}", o.r3_median);
}

/// The RTKLIB leg as registered (1061480, amendment 1 71b7f63): missed on its first run.
#[test]
#[ignore = "FINDING: RTKLIB leg R1 0 %, R2 0.146 m, R3 1.085 m against the registered bars; see the module header"]
fn rtklib_parity_as_registered() {
    let o =
        compare_tool(&oracle_dir(), "rtklib", "rtklib_ppp.csv").expect("committed RTKLIB outputs");
    assert_bars("rtklib", &o);
}

// PIN-SCOPE:    the recorded RTKLIB finding: the R1 fraction, the R2 last-epoch difference and the
//               R3 SPP median of the first registered run, on the committed RTKLIB outputs.
// PIN-EXCLUDES: the registered bars (kept in the ignored test) and the gLAB leg.
#[test]
fn rtklib_finding_is_pinned() {
    let o =
        compare_tool(&oracle_dir(), "rtklib", "rtklib_ppp.csv").expect("committed RTKLIB outputs");
    assert_eq!((o.r1_n, o.r3_n), (240, 719));
    assert_eq!(o.r1_frac, 0.0);
    assert!((o.r2 - 0.1462).abs() < 5e-4, "{}", o.r2);
    assert!((o.r3_median - 1.085).abs() < 5e-4, "{}", o.r3_median);
}

/// Amendment 2 (3d01186): RTKLIB PPP with the solid tide on, against the unchanged R1 and R2.
/// Missed on its run (R1 0 %, R2 0.232 m): RTKLIB then sits +0.19 to +0.20 m up from ITRF2020
/// with the horizontal near zero, because the registered configuration put the receiver antenna
/// options on the base slot (`ant2-*`), so RTKLIB applied neither WTZR's antenna height nor the
/// receiver phase-centre offsets. Recorded; see amendment 3.
#[test]
#[ignore = "FINDING: amendment 2 R1 0 %, R2 0.232 m; the RTKLIB config set the receiver antenna on the base slot"]
fn rtklib_ppp_with_the_solid_tide_amendment_2() {
    let o = compare_tool(&oracle_dir(), "rtklib", "rtklib_ppp_tide.csv")
        .expect("committed RTKLIB outputs");
    assert!(o.r1_n >= 200, "non-vacuity");
    assert!(o.r1_frac >= 0.95, "R1");
    assert!(o.r2 <= 0.03, "R2");
}

/// Amendment 3 (6e89494), the final RTKLIB PPP registration: tide on, rover antenna on slot 1.
#[test]
fn rtklib_ppp_amendment_3() {
    let o = compare_tool(&oracle_dir(), "rtklib", "rtklib_ppp_tide_ant.csv")
        .expect("committed RTKLIB outputs");
    assert!(o.r1_n >= 200, "non-vacuity");
    assert!(o.r1_frac >= 0.95, "R1");
    assert!(o.r2 <= 0.03, "R2");
}
