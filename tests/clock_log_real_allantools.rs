// SPDX-License-Identifier: AGPL-3.0-only
//! The clock-log comparison on real public data, pre-registered in
//! tests/fixtures/clock_log_real/PREREGISTRATION.md (and its Addendum 1), committed before any
//! fixture existed or any comparison was run.
//!
//! Four measured series: D1 Stable32 PHASE.DAT, D2 the first 65 536 readings of a 5071A caesium
//! clock, D3 the IGS clock of satellite G01 and D4 the IGS clock of station ABMF (the last two
//! vendored as a cut of the IGS final 30 s clock of 2026-08-02, RINEX clock version 3.00). D1 and D2
//! are third-party data without a redistribution grant: their wrapped logs and reference phase are
//! written by `scripts/gen_clock_log_real_ref.py` into the git-ignored `realdata-cache/` (override
//! with `KSHANA_CLOCK_LOG_REAL_PATH`). When they are absent those cases print a skip notice and pass,
//! unless `KSHANA_REQUIRE_REALDATA=1`, which makes absence a failure; the vendored IGS cases always
//! run, as do the malformed-input cases (B3).
//!
//! B1: counts, `tau0` and its source agree with the independent reader, every phase sample within
//! 1e-14 s. B2: ADEV, TDEV and MTIE agree with allantools 2024.6 within a relative 1e-10 (1e-9 for
//! the frequency log) wherever allantools evaluates. B3: each malformed input is an error naming its
//! cause. B4: RINEX clock versions 2.00 and 3.00 to 3.04 are read and any other is refused.
use kshana::clock_log::{read_input, ClockLogInput, MeasuredPhaseReport};
use serde_json::Value;
use std::path::PathBuf;

const DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/clock_log_real");
const CUT: &str = "igs_clk_30s_2026214_G01_ABMF.clk";

fn reference() -> Value {
    serde_json::from_str(&std::fs::read_to_string(format!("{DIR}/reference.json")).unwrap())
        .unwrap()
}

fn cache() -> PathBuf {
    std::env::var_os("KSHANA_CLOCK_LOG_REAL_PATH")
        .map(PathBuf::from)
        .unwrap_or_else(|| {
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("realdata-cache/clock_log_real")
        })
}

/// One comparison case: the key in reference.json, how to read it, and where its phase lives.
struct Case {
    key: String,
    input: ClockLogInput,
    cached: bool,
    tol_rel: f64,
}

fn cases() -> Vec<Case> {
    let mut v = Vec::new();
    for tag in ["d1", "d2"] {
        let c = cache();
        let mk = |file: &str, format: &str| ClockLogInput {
            format: format.into(),
            path: Some(c.join(file).to_string_lossy().into_owned()),
            channel: (format == "ticc").then(|| "chA".to_string()),
            ..Default::default()
        };
        v.push(Case {
            key: format!("{tag}_TL-P.txt"),
            input: mk(&format!("{tag}_TL-P.txt"), "timelab"),
            cached: true,
            tol_rel: 1e-10,
        });
        v.push(Case {
            key: format!("{tag}_TL-F.txt"),
            input: mk(&format!("{tag}_TL-F.txt"), "timelab"),
            cached: true,
            tol_rel: 1e-9,
        });
        for t in ["TICC-0", "TICC-3"] {
            v.push(Case {
                key: format!("{tag}_{t}.txt"),
                input: mk(&format!("{tag}_{t}.txt"), "ticc"),
                cached: true,
                tol_rel: 1e-10,
            });
        }
    }
    let c = cache();
    v.push(Case {
        key: "d1_TICC-11.txt".into(),
        input: ClockLogInput {
            format: "ticc".into(),
            path: Some(c.join("d1_TICC-11.txt").to_string_lossy().into_owned()),
            channel: Some("chA".into()),
            ..Default::default()
        },
        cached: true,
        tol_rel: 1e-10,
    });
    for clock in ["G01", "ABMF"] {
        v.push(Case {
            key: format!("{CUT}:{clock}"),
            input: ClockLogInput {
                format: "rinex-clk".into(),
                path: Some(format!("{DIR}/{CUT}")),
                clock: Some(clock.into()),
                ..Default::default()
            },
            cached: false,
            tol_rel: 1e-10,
        });
    }
    v
}

/// Whether a cached case can run here; a missing one is a skip, or a failure when required.
fn available(case: &Case) -> bool {
    if !case.cached {
        return true;
    }
    let p = case.input.path.as_ref().unwrap();
    if std::path::Path::new(p).exists() {
        return true;
    }
    assert!(
        std::env::var("KSHANA_REQUIRE_REALDATA").as_deref() != Ok("1"),
        "{}: {p} is missing and KSHANA_REQUIRE_REALDATA=1 \
         (run scripts/fetch_phasedat.sh, scripts/fetch_cs5071a.sh and scripts/gen_clock_log_real_ref.py)",
        case.key
    );
    eprintln!(
        "SKIP {}: {p} not found (run scripts/gen_clock_log_real_ref.py)",
        case.key
    );
    false
}

fn reference_phase(case: &Case, want: &Value) -> Vec<f64> {
    if case.cached {
        let p = cache().join("ref_phase").join(format!("{}.f64", case.key));
        let bytes = std::fs::read(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
        let v: Vec<f64> = bytes
            .chunks_exact(8)
            .map(|c| f64::from_le_bytes(c.try_into().unwrap()))
            .collect();
        // The cache must be the one the committed reference was made from.
        use sha2::{Digest, Sha256};
        let mut h = Sha256::new();
        for x in &v {
            h.update(x.to_le_bytes());
        }
        assert_eq!(
            hex::encode(h.finalize()),
            want["phase_sha256"].as_str().unwrap(),
            "{}: cached reference phase is not the committed one",
            case.key
        );
        v
    } else {
        want["phase_s"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect()
    }
}

#[test]
fn b1_each_log_reads_to_the_reference_phase() {
    let r = reference();
    let mut run = 0;
    for case in cases() {
        if !available(&case) {
            continue;
        }
        let want = &r["cases"][&case.key];
        let got = read_input(&case.input).unwrap_or_else(|e| panic!("{}: {e}", case.key));
        let phase = reference_phase(&case, want);
        assert_eq!(got.n_used, phase.len(), "{} n_used", case.key);
        assert_eq!(
            got.n_grid as u64,
            want["n_grid"].as_u64().unwrap(),
            "{}",
            case.key
        );
        assert_eq!(
            got.n_missing as u64,
            want["n_missing"].as_u64().unwrap(),
            "{}",
            case.key
        );
        assert_eq!(
            got.n_gaps as u64,
            want["n_gaps"].as_u64().unwrap(),
            "{}",
            case.key
        );
        assert_eq!(
            got.n_interpolated as u64,
            want["n_interpolated"].as_u64().unwrap(),
            "{}",
            case.key
        );
        assert_eq!(
            got.tau0_s,
            want["tau0_s"].as_f64().unwrap(),
            "{} tau0",
            case.key
        );
        assert_eq!(
            got.tau0_source,
            want["tau0_source"].as_str().unwrap(),
            "{} tau0 source",
            case.key
        );
        let worst = got
            .phase_s
            .iter()
            .zip(&phase)
            .map(|(a, b)| (a - b).abs())
            .fold(0.0_f64, f64::max);
        eprintln!("{}: largest phase difference {worst:.3e} s", case.key);
        assert!(worst <= 1e-14, "{}: phase differs by {worst:e} s", case.key);
        run += 1;
    }
    assert!(run >= 2, "the vendored IGS cases always run");
}

/// The reference value at `tau`, if allantools reported one there.
fn at(curve: &Value, tau: f64) -> Option<f64> {
    curve.as_array().unwrap().iter().find_map(|p| {
        let t = p[0].as_f64().unwrap();
        ((t - tau).abs() <= 1e-9 * tau).then(|| p[1].as_f64().unwrap())
    })
}

#[test]
fn b2_adev_tdev_and_mtie_agree_with_allantools() {
    let r = reference();
    for case in cases() {
        if !available(&case) {
            continue;
        }
        let c = &r["cases"][&case.key]["curves"];
        let m = MeasuredPhaseReport::from_phase(read_input(&case.input).unwrap());
        let mut worst = 0.0_f64;
        let mut compared = 0usize;
        let mut unevaluated = Vec::new();
        let mut check = |name: &str, tau: f64, got: f64| {
            let Some(want) = at(&c[name], tau) else {
                unevaluated.push(format!("{name}@{tau}"));
                return;
            };
            let rel = ((got - want) / want).abs();
            worst = worst.max(rel);
            compared += 1;
            assert!(
                rel <= case.tol_rel,
                "{} {name} at {tau} s: {got:e} vs {want:e} ({rel:e})",
                case.key
            );
        };
        for p in &m.adev {
            check("adev", p.tau_s, p.adev);
        }
        for p in &m.tdev {
            check("tdev", p.tau_s, p.tdev_s);
        }
        for p in &m.mtie {
            check("mtie", p.tau_s, p.mtie_s);
        }
        let each = m.adev.len();
        let floor = if case.key.contains("ABMF") { 5 } else { 8 };
        assert!(each >= floor, "{}: only {each} averaging factors", case.key);
        eprintln!(
            "{}: {compared} comparisons, largest relative difference {worst:.3e}; not evaluated by allantools: {unevaluated:?}",
            case.key
        );
        // allantools 2024.6 does not evaluate MTIE over the whole record, which the engine
        // reports (see tests/fixtures/clock_log/RESULTS.md); nothing else may be unevaluated.
        let last = m.mtie.last().unwrap().tau_s;
        assert_eq!(unevaluated, vec![format!("mtie@{last}")], "{}", case.key);
    }
}

// ---- B3: malformed input is an error that names its cause ----------------------------------

fn text_input(format: &str, text: &str) -> ClockLogInput {
    ClockLogInput {
        format: format.into(),
        text: Some(text.into()),
        ..Default::default()
    }
}

fn expect_err(id: &str, inp: ClockLogInput, phrases: &[&str]) {
    let e = std::panic::catch_unwind(|| read_input(&inp))
        .unwrap_or_else(|_| panic!("{id}: panicked instead of returning an error"));
    let msg = match e {
        Ok(ok) => panic!("{id}: read {} samples instead of failing", ok.n_used),
        Err(m) => m,
    };
    for p in phrases {
        assert!(
            msg.contains(p),
            "{id}: error {msg:?} does not contain {p:?}"
        );
    }
}

fn rinex_head(version: &str) -> String {
    let h = |c: &str, l: &str| format!("{c:<60}{l}\n");
    h(
        &format!("{version:>9}           C                   G"),
        "RINEX VERSION / TYPE",
    ) + &h("GPS", "TIME SYSTEM ID")
        + &h("     1    AS", "# / TYPES OF DATA")
}

fn rinex_rec(name: &str, sec: u32, v: &str) -> String {
    format!(
        "AS {name:<4}      2026 08 02 00 {:02} {:9.6}  1   {v}\n",
        sec / 60,
        (sec % 60) as f64
    )
}

#[test]
fn b3_malformed_input_is_an_error_that_names_its_cause() {
    use std::fmt::Write;
    // E1 to E4: any format
    expect_err(
        "E1",
        text_input("bogus", "1\n"),
        &["bogus", "rinex-clk", "timelab", "ticc"],
    );
    expect_err(
        "E2",
        ClockLogInput {
            format: "timelab".into(),
            ..Default::default()
        },
        &["path", "text"],
    );
    expect_err(
        "E3",
        ClockLogInput {
            format: "timelab".into(),
            path: Some("/nonexistent/dir/no-such.log".into()),
            ..Default::default()
        },
        &["/nonexistent/dir/no-such.log"],
    );
    for t in [0.0, -1.0, f64::NAN] {
        let mut i = text_input("timelab", "1\n2\n3\n");
        i.tau0_s = Some(t);
        expect_err("E4", i, &["tau0"]);
    }
    // E5 to E11: TimeLab
    expect_err("E5", text_input("timelab", ""), &["no readings"]);
    expect_err(
        "E6",
        text_input("timelab", "# tau0 = 1\n1.0\nfoo bar baz\n"),
        &["line 3"],
    );
    let mut i = text_input("timelab", "# tau0 = 1\n1\n2\n3\n");
    i.units = Some("furlong".into());
    expect_err("E7", i, &["units", "furlong"]);
    expect_err("E8", text_input("timelab", "1\n2\n3\n4\n"), &["tau0"]);
    expect_err(
        "E9",
        text_input("timelab", "# tau0 = 1\n1\nnan\n3\n"),
        &["line 3"],
    );
    expect_err(
        "E10",
        text_input("timelab", "0 1\n1 2\n1 3\n2 4\n"),
        &["increas"],
    );
    expect_err(
        "E11",
        text_input("timelab", "# data = frequency\n0 1e-9\n1 2e-9\n2 3e-9\n"),
        &["frequency", "single column"],
    );
    // E12 to E18: RINEX clock
    let mut body = String::new();
    for k in 0..4 {
        write!(body, "{}", rinex_rec("G01", 30 * k, " 1.000000000000E-04")).unwrap();
    }
    let end = format!("{:<60}END OF HEADER\n", "");
    expect_err(
        "E12",
        text_input("rinex-clk", &(rinex_head("4.00") + &end + &body)),
        &["4.00"],
    );
    expect_err(
        "E13",
        text_input("rinex-clk", &(rinex_head("3.05") + &end + &body)),
        &["3.05"],
    );
    let mut i = text_input("rinex-clk", &(rinex_head("3.04") + &body));
    i.clock = Some("G01".into());
    expect_err("E14", i, &["END OF HEADER"]);
    let two = rinex_head("3.04") + &end + &body + &rinex_rec("G02", 0, " 2.000000000000E-04");
    expect_err(
        "E15",
        text_input("rinex-clk", &two),
        &["clock", "G01", "G02"],
    );
    let mut i = text_input("rinex-clk", &two);
    i.clock = Some("ZZZZ".into());
    expect_err("E16", i, &["ZZZZ"]);
    let bad = rinex_head("3.04")
        + &end
        + &rinex_rec("G01", 0, " 1.000000000000E-04")
        + &rinex_rec("G01", 30, " not-a-number")
        + &rinex_rec("G01", 60, " 1.000000000000E-04");
    let mut i = text_input("rinex-clk", &bad);
    i.clock = Some("G01".into());
    expect_err("E17", i, &["clock bias"]);
    let one = rinex_head("3.04") + &end + &rinex_rec("G01", 0, " 1.000000000000E-04");
    let mut i = text_input("rinex-clk", &one);
    i.clock = Some("G01".into());
    expect_err("E18", i, &["at least"]);
    // E19 to E24: TICC
    expect_err(
        "E19",
        text_input("ticc", "# menu\nTAPR TICC\nType any character\n"),
        &["no readings"],
    );
    let two_ch = "1.000000000000 chA\n1.500000000000 chB\n2.000000000000 chA\n2.500000000000 chB\n3.000000000000 chA\n";
    expect_err(
        "E20",
        text_input("ticc", two_ch),
        &["chA", "chB", "channel"],
    );
    let mut i = text_input("ticc", two_ch);
    i.channel = Some("chZ".into());
    expect_err("E21", i, &["chZ"]);
    let period = "0.000000000100 chA\n0.000000000050 chA\n0.000000000020 chA\n0.000000000010 chA\n";
    let mut i = text_input("ticc", period);
    i.channel = Some("chA".into());
    expect_err("E22", i, &["Period"]);
    let ti = "0.000000001000 TI(A->B)\n0.000000001010 TI(A->B)\n0.000000001020 TI(A->B)\n";
    expect_err("E23", text_input("ticc", ti), &["tau0_s"]);
}

#[test]
fn b3_a_binary_ticc_log_is_refused_not_misread() {
    // E24: binary timestamp mode is not UTF-8 text. The path reader reports it; there is no
    // text to give inline, so this goes through a file.
    let p = std::env::temp_dir().join(format!("kshana-ticc-bin-{}.log", std::process::id()));
    std::fs::write(
        &p,
        [
            0xAA_u8, 0x55, 0x00, 0xFF, 0xFE, 0x10, 0x20, 0x80, 0x81, 0x00, 0x00, 0x01,
        ],
    )
    .unwrap();
    let inp = ClockLogInput {
        format: "ticc".into(),
        path: Some(p.to_string_lossy().into_owned()),
        ..Default::default()
    };
    let msg = read_input(&inp).expect_err("E24: binary data was read as text");
    std::fs::remove_file(&p).ok();
    assert!(
        msg.contains("binary") || msg.contains("UTF-8"),
        "E24: error {msg:?} names neither"
    );
}

// ---- B4: RINEX clock versions --------------------------------------------------------------

#[test]
fn b4_rinex_clock_versions_2_and_3_00_to_3_04_are_read_and_others_refused() {
    let end = format!("{:<60}END OF HEADER\n", "");
    let mut body = String::new();
    for k in 0..4 {
        body += &rinex_rec("G01", 30 * k, " 1.000000000000E-04");
    }
    for v in ["2.00", "3.00", "3.01", "3.02", "3.03", "3.04"] {
        let mut i = text_input("rinex-clk", &(rinex_head(v) + &end + &body));
        i.clock = Some("G01".into());
        let r = read_input(&i);
        assert!(r.is_ok(), "version {v}: {:?}", r.err());
    }
    for v in ["1.00", "3.05", "4.00", "4.02", "5.00"] {
        let mut i = text_input("rinex-clk", &(rinex_head(v) + &end + &body));
        i.clock = Some("G01".into());
        let msg = read_input(&i).expect_err(&format!("version {v} was read"));
        assert!(msg.contains(v), "version {v}: {msg:?} does not name it");
        assert!(
            msg.contains("3.04"),
            "version {v}: {msg:?} does not name the versions read"
        );
    }
}
