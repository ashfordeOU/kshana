// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana sil-obs`: the SIL observation generator round-trips through the engine's own
//! single-point solver on a real broadcast navigation file, the street canyon produces the
//! NLOS and multipath it states (and the truth file says so), the output is deterministic,
//! and `compare` measures what it says.
use kshana::frames::{ecef_to_geodetic, Vec3};
use kshana::pvt::{assemble_epoch, klobuchar_from_nav_header, solve_spp, AtmosModel};
use kshana::rinex::parse_nav;
use kshana::rinex_obs::parse_obs;
use kshana::sil_obs::{compare_doc, generate, obs_stats, Canyon, SilScenario};
use std::path::{Path, PathBuf};
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn nav_text() -> String {
    std::fs::read_to_string(root().join("tests/fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx"))
        .unwrap()
}

/// The IGS station ABMF's published a-priori position (the fixture's header).
const ABMF: Vec3 = [2_919_786.448, -5_383_745.178, 1_774_604.734];

fn scenario(extra: &str) -> SilScenario {
    let g = ecef_to_geodetic(ABMF);
    let text = format!(
        "[sil]\nstart = \"2018-05-13T01:00:00\"\nduration_s = 300\nstep_s = 30\nseed = 7\n\
         {extra_sil}\n[receiver]\nlat_deg = {}\nlon_deg = {}\nheight_m = {}\nclock_bias_m = 1234.5\n\
         {extra}",
        g.lat_rad.to_degrees(),
        g.lon_rad.to_degrees(),
        g.alt_m,
        extra_sil = if extra.contains("dual") { "dual_frequency = true" } else { "" },
        extra = extra.replace("dual", ""),
    );
    toml::from_str(&text).unwrap_or_else(|e| panic!("{e}\n{text}"))
}

fn no_noise() -> &'static str {
    "[signal]\nnoise = false\n"
}

/// Solve every epoch with the engine's own SPP and return the position errors (m) and
/// clock biases (m).
fn solve_all(obs_text: &str, nav: &str, dual: bool, mask: f64) -> Vec<(f64, f64, usize)> {
    let obs = parse_obs(obs_text).unwrap();
    let ephs = parse_nav(nav).unwrap();
    let atmos = AtmosModel {
        iono: klobuchar_from_nav_header(nav).unwrap_or_default(),
        ..Default::default()
    };
    (0..obs.epochs.len())
        .filter_map(|i| {
            let meas: Vec<_> = assemble_epoch(&obs, i, &ephs, ABMF, &atmos, mask, dual)
                .into_iter()
                .map(|(_, m)| m)
                .collect();
            let apriori = [ABMF[0] + 300.0, ABMF[1] - 200.0, ABMF[2] + 100.0];
            let fix = solve_spp(&meas, apriori)?;
            let d = ((fix.ecef[0] - ABMF[0]).powi(2)
                + (fix.ecef[1] - ABMF[1]).powi(2)
                + (fix.ecef[2] - ABMF[2]).powi(2))
            .sqrt();
            Some((d, fix.clock_bias_m, fix.n_used))
        })
        .collect()
}

#[test]
fn noise_free_open_sky_round_trips_through_the_engine_spp_on_a_real_nav_file() {
    let nav = nav_text();
    let ephs = parse_nav(&nav).unwrap();
    let scn = scenario(no_noise());
    let out = generate(&scn, &ephs, klobuchar_from_nav_header(&nav)).unwrap();
    assert_eq!(out.n_epochs, 11);
    let fixes = solve_all(&out.rinex, &nav, false, 5.0);
    assert_eq!(fixes.len(), 11);
    for (d, clk, n) in &fixes {
        assert!(*n >= 6, "{n} satellites");
        // The models the solver removes are the models the generator applied; what remains
        // is the solver's approximations (Sagnac from the a-priori, transmit-time guess).
        assert!(*d < 0.05, "position error {d} m");
        assert!((clk - 1234.5).abs() < 0.05, "clock {clk}");
    }
}

#[test]
fn dual_frequency_ionosphere_free_round_trip() {
    let nav = nav_text();
    let ephs = parse_nav(&nav).unwrap();
    let scn = scenario(&format!("dual\n{}", no_noise()));
    let out = generate(&scn, &ephs, klobuchar_from_nav_header(&nav)).unwrap();
    assert!(out.rinex.contains("C2L L2L D2L S2L"));
    for (d, _, _) in solve_all(&out.rinex, &nav, true, 5.0) {
        assert!(d < 0.05, "iono-free position error {d} m");
    }
}

#[test]
fn noise_follows_cn0_and_the_seed() {
    let nav = nav_text();
    let ephs = parse_nav(&nav).unwrap();
    let a = generate(&scenario(""), &ephs, None).unwrap();
    let b = generate(&scenario(""), &ephs, None).unwrap();
    assert_eq!(a.rinex, b.rinex, "same seed, same bytes");
    assert_eq!(a.truth, b.truth);
    let errs: Vec<f64> = solve_all(&a.rinex, &nav, false, 5.0)
        .iter()
        .map(|f| f.0)
        .collect();
    // With noise, the SPP error is metres, not centimetres, and not tens of metres.
    let worst = errs.iter().cloned().fold(0.0, f64::max);
    assert!(worst > 0.05 && worst < 15.0, "{errs:?}");
}

fn canyon_scenario() -> SilScenario {
    let mut s = scenario(no_noise());
    s.canyon = Some(Canyon {
        axis_az_deg: 20.0,
        width_m: 18.0,
        height_left_m: 35.0,
        height_right_m: 25.0,
        offset_m: 2.0,
        antenna_height_m: 1.5,
        reflection_loss_db: 6.0,
    });
    s.sil.duration_s = 1800.0;
    s
}

#[test]
fn the_canyon_produces_nlos_and_multipath_and_the_truth_file_labels_them() {
    let nav = nav_text();
    let ephs = parse_nav(&nav).unwrap();
    let open = generate(
        &scenario(no_noise()),
        &ephs,
        klobuchar_from_nav_header(&nav),
    )
    .unwrap();
    let urban = generate(&canyon_scenario(), &ephs, klobuchar_from_nav_header(&nav)).unwrap();
    assert!(
        urban.states.get("nlos").copied().unwrap_or(0) > 0,
        "{:?}",
        urban.states
    );
    assert!(
        urban.states.get("blocked").copied().unwrap_or(0) > 0,
        "{:?}",
        urban.states
    );
    assert!(urban.n_obs < open.n_obs * 7, "fewer signals in the canyon");
    let mut lines = urban.truth.lines();
    let head: serde_json::Value = serde_json::from_str(lines.next().unwrap()).unwrap();
    assert_eq!(head["schema"], "kshana.sil-obs-truth/1");
    assert_eq!(head["label"], "MODELLED");
    let rows: Vec<serde_json::Value> = lines.map(|l| serde_json::from_str(l).unwrap()).collect();
    let mut nlos_tracked = 0;
    for r in &rows {
        let state = r["state"].as_str().unwrap();
        let excess = r["excess_path_m"].as_f64().unwrap();
        match state {
            "nlos" => {
                assert!(excess > 0.0);
                // NLOS: the code carries the whole excess path.
                assert_eq!(r["code_multipath_m"].as_f64().unwrap(), excess);
                if r["tracked"].as_bool().unwrap() {
                    nlos_tracked += 1;
                }
            }
            "los" => assert_eq!(excess, 0.0),
            "los_multipath" => {
                // A multipath code error is bounded by the excess path and by the plateau.
                let mp = r["code_multipath_m"].as_f64().unwrap().abs();
                assert!(mp <= excess + 1e-9, "{r}");
            }
            "blocked" => assert!(!r["tracked"].as_bool().unwrap()),
            other => panic!("state {other}"),
        }
    }
    assert!(nlos_tracked > 0);
    // NLOS satellites bias the SPP: with them, the solution is worse than in open sky.
    let urban_err: f64 = solve_all(&urban.rinex, &nav, false, 5.0)
        .iter()
        .map(|f| f.0)
        .fold(0.0, f64::max);
    assert!(
        urban_err > 1.0,
        "NLOS bias reaches the solution: {urban_err}"
    );
}

#[test]
fn compare_measures_the_canyon_against_open_sky() {
    let nav = nav_text();
    let ephs = parse_nav(&nav).unwrap();
    let mut o = scenario("");
    o.sil.duration_s = 1800.0;
    let mut u = canyon_scenario();
    u.signal.noise = true;
    let open = parse_obs(&generate(&o, &ephs, None).unwrap().rinex).unwrap();
    let urban = parse_obs(&generate(&u, &ephs, None).unwrap().rinex).unwrap();
    let (sa, sb) = (obs_stats(&open), obs_stats(&urban));
    assert!(
        sa.cmc_samples > 100 && sb.cmc_samples > 50,
        "{} {}",
        sa.cmc_samples,
        sb.cmc_samples
    );
    assert!(sb.sats_per_epoch_mean < sa.sats_per_epoch_mean);
    assert!(sb.cn0_p50_dbhz < sa.cn0_p50_dbhz + 1e-9);
    let doc = compare_doc("open", &sa, "urban", &sb);
    assert_eq!(doc["schema"], "kshana.sil-obs-compare/1");
    let ks = doc["ks_cn0"].as_f64().unwrap();
    assert!(ks > 0.0 && ks <= 1.0);
    let same = compare_doc("open", &sa, "open", &sa);
    assert_eq!(same["ks_cn0"].as_f64().unwrap(), 0.0);
    assert_eq!(same["ks_cmc_abs"].as_f64().unwrap(), 0.0);
    // Open-sky detrended CMC is the code noise: decimetres to a metre or two at 30 s.
    assert!(
        sa.cmc_rms_m > 0.05 && sa.cmc_rms_m < 3.0,
        "{}",
        sa.cmc_rms_m
    );
    // A real IGS observation file reads too.
    let real = parse_obs(
        &std::fs::read_to_string(
            root().join("tests/fixtures/igs/ABMF00GLP_R_20181330000_01D_30S_MO.rnx"),
        )
        .unwrap(),
    )
    .unwrap();
    let sr = obs_stats(&real);
    assert!(sr.sats_per_epoch_mean > 5.0 && sr.cn0_samples > 0, "{sr:?}");
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-sil-obs-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

fn kshana(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string(),
        String::from_utf8_lossy(&out.stderr).to_string(),
    )
}

fn s(p: &Path) -> String {
    p.display().to_string()
}

#[test]
fn the_command_line_generates_and_compares() {
    let dir = unique_dir("cli");
    let scn = dir.join("scn.toml");
    std::fs::write(
        &scn,
        std::fs::read_to_string(root().join("examples/sil-obs/urban-canyon.toml")).unwrap(),
    )
    .unwrap();
    let nav = s(&root().join("tests/fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx"));
    let (obs, truth) = (dir.join("sim.obs"), dir.join("truth.jsonl"));
    let (code, _, err) = kshana(&[
        "sil-obs",
        "generate",
        &s(&scn),
        "--nav",
        &nav,
        "--out",
        &s(&obs),
        "--truth",
        &s(&truth),
    ]);
    assert_eq!(code, 0, "{err}");
    assert!(err.contains("MODELLED"), "{err}");
    let text = std::fs::read_to_string(&obs).unwrap();
    assert!(text.starts_with("     3.04           OBSERVATION DATA"));
    assert!(text.contains("MODELLED synthetic observations"));
    let (code, out, err) = kshana(&["sil-obs", "compare", &s(&obs), &s(&obs), "--json"]);
    assert_eq!(code, 0, "{err}");
    let doc: serde_json::Value = serde_json::from_str(out.trim()).unwrap();
    assert_eq!(doc["ks_cn0"].as_f64(), Some(0.0));
    // Usage and option errors exit 2.
    assert_eq!(kshana(&["sil-obs"]).0, 2);
    assert_eq!(kshana(&["sil-obs", "generate", &s(&scn), "--bogus"]).0, 2);
    assert_eq!(
        kshana(&["sil-obs", "generate", &s(&scn), "--nav", &nav]).0,
        2
    );
    let (code, out, _) = kshana(&["sil-obs", "--help"]);
    assert_eq!(code, 0);
    assert!(out.contains("sil-obs generate"));
    let _ = std::fs::remove_dir_all(&dir);
}
