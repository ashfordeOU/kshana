// SPDX-License-Identifier: AGPL-3.0-only
//! Receiver-domain parity of Kshana's PPP and single-point solutions with gLAB and RTKLIB on the
//! same real WTZR inputs (RM-31). DATA-GATED: the oracle outputs are produced by
//! `xval/ppp-parity/run.sh` (gLAB and RTKLIB run as separate programs) into
//! `tests/fixtures/gnss_wettzell_2025055/oracle/` or the directory named by
//! `KSHANA_PPP_PARITY_DIR`. When they are absent the test says so and passes without claiming
//! parity.
//!
//! PRE-REGISTRATION: `xval/ppp-parity/PREREGISTRATION.md` (1061480), committed on its own before
//! any oracle run. Per tool: R1 PPP 3-D difference ≤ 0.05 m at ≥ 95 % of the common epochs of
//! 04:00-05:59:30; R2 PPP last common epoch ≤ 0.03 m; R3 SPP median 3-D difference ≤ 0.50 m;
//! non-vacuity 200 PPP and 600 SPP common epochs.

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
const NEAR: [f64; 3] = [4_075_580.8863, 931_853.5784, 4_801_567.9707];

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

#[test]
fn ppp_and_spp_parity_with_glab_and_rtklib_when_their_outputs_are_present() {
    let dir = std::env::var("KSHANA_PPP_PARITY_DIR")
        .map(PathBuf::from)
        .unwrap_or_else(|_| fixtures().join(DIR).join("oracle"));
    let mut ran = false;
    let mut ks: Option<(Track, Track)> = None;
    for tool in ["glab", "rtklib"] {
        let (Some(tp), Some(ts)) = (
            load(&dir, &format!("{tool}_ppp.csv")),
            load(&dir, &format!("{tool}_spp.csv")),
        ) else {
            eprintln!("{tool}: oracle output not present in {}; parity NOT run (run xval/ppp-parity/run.sh)", dir.display());
            continue;
        };
        let (kp, kspp) = ks.get_or_insert_with(|| {
            let obs = parse_obs(&read(DIR, "wtzr_2025055_0006_G.rnx")).unwrap();
            (kshana_ppp(&obs), kshana_spp(&obs))
        });
        let o = compare(kp, kspp, &tp, &ts);
        eprintln!(
            "{tool}: R1 {:.1} % of {} epochs within 0.05 m; R2 last {:.4} m; R3 median {:.3} m over {} epochs",
            100.0 * o.r1_frac,
            o.r1_n,
            o.r2,
            o.r3_median,
            o.r3_n
        );
        assert!(o.r1_n >= 200 && o.r3_n >= 600, "{tool}: non-vacuity");
        assert!(o.r1_frac >= 0.95, "{tool}: R1");
        assert!(o.r2 <= 0.03, "{tool}: R2");
        assert!(o.r3_median <= 0.50, "{tool}: R3");
        ran = true;
    }
    if !ran {
        eprintln!("RM-31 parity: no oracle output present; nothing compared, nothing claimed");
    }
}
