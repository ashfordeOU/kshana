// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana antenna-cal`: the ANTEX lint reads real IGS files without an error and finds each
//! seeded defect; the comparison, spread, group-delay and J/S figures agree with independent
//! closed forms.
use kshana::antenna_cal::*;
use std::path::PathBuf;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}
fn fixture(p: &str) -> String {
    std::fs::read_to_string(root().join(p)).unwrap()
}
const IGS20: &str = "tests/fixtures/gnss_wettzell_2025055/igs20_2025055_G_LEIAR25.atx";
const IGS14: &str = "tests/fixtures/joint_pvt_precise_itrf_rtklib_oracle/igs14_2018133_GE_sat.atx";
const LEIAR25: &str = "LEIAR25.R3      LEIT";

/// A minimal ANTEX file holding the given antenna blocks.
fn file_with(blocks: &[String]) -> String {
    let mut s = String::new();
    s.push_str(&format!(
        "{:<60}{}\n",
        "     1.4            M", "ANTEX VERSION / SYST"
    ));
    s.push_str(&format!("{:<60}{}\n", "A", "PCV TYPE / REFANT"));
    s.push_str(&format!("{:<60}{}\n", "", "END OF HEADER"));
    for b in blocks {
        s.push_str(b);
    }
    s
}

/// The LEIAR25.R3 LEIT block of the IGS20 excerpt, with its serial field set to `serial`.
fn leiar_block(serial: &str) -> String {
    let text = fixture(IGS20);
    let lines: Vec<&str> = text.lines().collect();
    let t = lines.iter().position(|l| l.starts_with(LEIAR25)).unwrap();
    let start = (0..t)
        .rev()
        .find(|&i| lines[i].contains("START OF ANTENNA"))
        .unwrap();
    let end = (t..lines.len())
        .find(|&i| lines[i].contains("END OF ANTENNA"))
        .unwrap();
    let mut out = String::new();
    for (i, l) in lines[start..=end].iter().enumerate() {
        if start + i == t {
            out.push_str(&format!("{:<20}{:<20}{}\n", LEIAR25, serial, &l[40..]));
        } else {
            out.push_str(l);
            out.push('\n');
        }
    }
    out
}

fn codes(doc: &serde_json::Value) -> Vec<String> {
    doc["findings"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|f| f["severity"] == "error")
        .map(|f| f["code"].as_str().unwrap().to_string())
        .collect()
}

#[test]
fn real_igs_antex_files_lint_as_they_are() {
    // The igs20.atx slice is complete: no error.
    let d20 = lint(IGS20, &fixture(IGS20));
    assert_eq!(d20["errors"], 0, "{:?}", codes(&d20));
    assert_eq!(d20["antennas"], 33);
    assert!(d20["receiver_antennas"].as_u64().unwrap() >= 1);
    // The igs14.atx satellite slice had its NOAZI rows dropped when it was cut (its NOTICE says
    // so): the lint finds exactly that, one missing-noazi per frequency block and the missing
    // azimuth rows of the blocks that declare an azimuth step (the Galileo ones), and no other
    // error.
    let d14 = lint(IGS14, &fixture(IGS14));
    let (ants, _) = parse(&fixture(IGS14));
    let n_freq: usize = ants.iter().map(|a| a.freqs.len()).sum();
    let c = codes(&d14);
    assert_eq!(d14["receiver_antennas"], 0);
    assert!(ants.len() > 10);
    assert_eq!(c.iter().filter(|x| *x == "missing-noazi").count(), n_freq);
    let with_azimuth: usize = ants
        .iter()
        .filter(|a| a.dazi > 0.0)
        .map(|a| a.freqs.len())
        .sum();
    assert!(with_azimuth > 0);
    assert_eq!(
        c.iter().filter(|x| *x == "azimuth-rows").count(),
        with_azimuth
    );
    assert_eq!(c.len(), n_freq + with_azimuth, "{c:?}");
}

#[test]
fn the_lint_finds_each_seeded_defect() {
    let good = file_with(&[leiar_block("")]);
    assert!(
        codes(&lint("good", &good)).is_empty(),
        "{:?}",
        codes(&lint("good", &good))
    );
    let cases: Vec<(&str, String)> = vec![
        (
            "frequency-count",
            good.replacen(
                "    25                                                      # OF FREQUENCIES",
                "    24                                                      # OF FREQUENCIES",
                1,
            ),
        ),
        ("noazi-count", {
            let i = good.find("   NOAZI").unwrap();
            let j = good[i..].find('\n').unwrap() + i;
            format!("{}{}", &good[..j - 8], &good[j..])
        }),
        (
            "dazi-not-dividing-360",
            good.replacen(
                "     5.0                                                    DAZI",
                "     7.0                                                    DAZI",
                1,
            ),
        ),
        (
            "duplicate-antenna",
            file_with(&[leiar_block(""), leiar_block("")]),
        ),
        (
            "unterminated-block",
            good.replacen(
                "                                                            END OF ANTENNA",
                "",
                1,
            ),
        ),
        (
            "tab",
            good.replacen("     0.0  90.0   5.0", "\t0.0  90.0   5.0", 1),
        ),
        (
            "unknown-frequency-code",
            good.replacen(
                "   G01                                                      START OF FREQUENCY",
                "   G09                                                      START OF FREQUENCY",
                1,
            ),
        ),
        (
            "missing-end-of-header",
            good.replacen("END OF HEADER", "COMMENT", 1),
        ),
    ];
    for (want, text) in cases {
        let c = codes(&lint(want, &text));
        assert!(c.iter().any(|x| x == want), "{want}: {c:?}");
    }
}

#[test]
fn compare_sees_only_what_the_receiver_sees() {
    let (ants, _) = parse(&fixture(IGS20));
    let a = ants
        .iter()
        .find(|a| a.type_radome == LEIAR25)
        .unwrap()
        .clone();
    // Identical calibrations: zero.
    let same = compare(&a, &a, 80.0);
    assert!(same["frequencies"]["G01"]["rms_mm"].as_f64().unwrap() < 1e-12);
    // An up offset of +5 mm compensated by +5·cos(z) in every variation: the same corrections.
    let mut b = a.clone();
    let zen = b.zeniths();
    for f in &mut b.freqs {
        f.pco_mm[2] += 5.0;
        for (k, z) in zen.iter().enumerate() {
            let d = 5.0 * z.to_radians().cos();
            f.noazi_mm[k] += d;
            for row in &mut f.azi_mm {
                row.1[k] += d;
            }
        }
    }
    let comp = compare(&a, &b, 80.0);
    assert!(
        comp["frequencies"]["G01"]["rms_mm"].as_f64().unwrap() < 0.05,
        "{}",
        comp["frequencies"]["G01"]
    );
    // The same offset without compensation: the difference is −5·cos(z) about its mean.
    let mut c = a.clone();
    for f in &mut c.freqs {
        f.pco_mm[2] += 5.0;
    }
    let d = compare(&a, &c, 80.0);
    let got = d["frequencies"]["G01"]["rms_mm"].as_f64().unwrap();
    let mut v = vec![-5.0];
    let mut z = 5.0;
    while z <= 80.0 + 1e-9 {
        for _ in 0..72 {
            v.push(-5.0 * f64::cos(z * std::f64::consts::PI / 180.0));
        }
        z += 5.0;
    }
    let m = v.iter().sum::<f64>() / v.len() as f64;
    let rms = (v.iter().map(|x| (x - m) * (x - m)).sum::<f64>() / v.len() as f64).sqrt();
    assert!((got - rms).abs() < 1e-6, "{got} vs {rms}");
    // The ionosphere-free combination of an equal shift on both frequencies is the shift.
    let ifc = d["iono_free_g01_g02"]["rms_mm"].as_f64().unwrap();
    assert!((ifc - rms).abs() < 1e-6);
}

#[test]
fn spread_across_units() {
    let mut blocks = Vec::new();
    for (serial, du) in [("1001", 0.0), ("1002", 2.0), ("1003", -2.0)] {
        let b = leiar_block(serial);
        // Shift the G01 up offset by du.
        let i = b
            .find("   G01                                                      START OF FREQUENCY")
            .unwrap();
        let j = b[i..].find("NORTH / EAST / UP").unwrap() + i;
        let line_start = b[..j].rfind('\n').unwrap() + 1;
        let up: f64 = b[line_start + 20..line_start + 30].trim().parse().unwrap();
        let new = format!("{:>10.2}", up + du);
        blocks.push(format!(
            "{}{}{}",
            &b[..line_start + 20],
            new,
            &b[line_start + 30..]
        ));
    }
    let text = file_with(&blocks);
    assert_eq!(lint("units", &text)["errors"], 0);
    let (ants, _) = parse(&text);
    let s = spread(&ants, LEIAR25).unwrap();
    let up = &s["frequencies"]["G01"]["up_mm"];
    assert!((up["sd"].as_f64().unwrap() - 2.0).abs() < 1e-9, "{up}");
    assert!((up["max_dev"].as_f64().unwrap() - 2.0).abs() < 1e-9);
    assert_eq!(s["frequencies"]["G02"]["up_mm"]["sd"], 0.0);
    assert!(spread(&ants[..1], LEIAR25).is_none());
}

#[test]
fn js_margin_standoff_is_where_js_meets_the_tolerance() {
    let mut spec: JsSpec = toml::from_str(&fixture("examples/antenna-cal/js-margin.toml")).unwrap();
    let d = js_margin(&spec).unwrap();
    let r = d["standoff_range_m"].as_f64().unwrap();
    spec.ranges_m = vec![r];
    let at = js_margin(&spec).unwrap();
    assert!(at["ranges"][0]["margin_db"].as_f64().unwrap().abs() < 1e-9);
    // Ten times the range is 20 dB less J/S.
    spec.ranges_m = vec![100.0, 1000.0];
    let two = js_margin(&spec).unwrap();
    let (a, b) = (
        two["ranges"][0]["js_db"].as_f64().unwrap(),
        two["ranges"][1]["js_db"].as_f64().unwrap(),
    );
    assert!((a - b - 20.0).abs() < 1e-9);
    spec.pattern = "dish".into();
    assert!(js_margin(&spec).is_err());
}

#[test]
fn the_command_line() {
    let run = |args: &[&str]| {
        let o = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .output()
            .unwrap();
        (
            o.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&o.stdout).to_string(),
            String::from_utf8_lossy(&o.stderr).to_string(),
        )
    };
    let ig = root().join(IGS20).display().to_string();
    let (code, out, err) = run(&["antenna-cal", "lint", &ig]);
    assert_eq!(code, 0, "{err}");
    assert!(out.contains("kshana.antex-lint/1"));
    let (code, out, err) = run(&["antenna-cal", "compare", &ig, "--type", LEIAR25]);
    assert_eq!(code, 0, "{err}");
    assert!(out.contains("kshana.antenna-compare/1"));
    let gd = root()
        .join("examples/antenna-cal/group-delay.toml")
        .display()
        .to_string();
    let (code, out, _) = run(&["antenna-cal", "group-delay", &gd]);
    assert_eq!(code, 0);
    let doc: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(doc["label"], "MODELLED");
    assert_eq!(doc["iono_free_pairs"].as_array().unwrap().len(), 2);
    let js = root()
        .join("examples/antenna-cal/js-margin.toml")
        .display()
        .to_string();
    assert_eq!(run(&["antenna-cal", "js-margin", &js]).0, 0);
    assert_eq!(
        run(&["antenna-cal", "compare", &ig, "--type", "NOSUCH"]).0,
        2
    );
    assert_eq!(run(&["antenna-cal", "spread", &ig, "--type", LEIAR25]).0, 2);
    assert_eq!(run(&["antenna-cal"]).0, 2);
    assert_eq!(run(&["antenna-cal", "lint", &ig, "--bogus"]).0, 2);
}
