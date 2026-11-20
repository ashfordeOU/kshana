// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana::orbit_data` and `kshana orbit-data`: CDM, OEM and OCM checks, OEM/OCM conversion, TLE
//! quality monitors and the covariance toolkit.
//!
//! Fixtures (tests/fixtures/orbit_data/README.md): the three CDM examples are transcribed from
//! CCSDS 508.0-B-1 (sections 3.6.2, 3.6.3 and 4.4); the OEM is Figure G-11 of CCSDS 502.0-B-3 as
//! the engine's earlier OEM work committed it; the OCMs are the engine's own messages checked
//! against Orekit in tests/odm_orekit_oracle.rs; the element sets are SELF-MADE
//! (gen_selfmade_tles.py), with placeholder catalogue numbers.

use kshana::orbit_data::{cdm, convert, ephem, gp_quality, Report, Severity};
use std::collections::BTreeMap;
use std::path::PathBuf;
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn fixture(p: &str) -> String {
    std::fs::read_to_string(root().join(p)).unwrap()
}

fn od(name: &str) -> String {
    fixture(&format!("tests/fixtures/orbit_data/{name}"))
}

fn codes(r: &Report, s: Severity) -> Vec<(&'static str, Option<usize>, Option<String>)> {
    r.findings
        .iter()
        .filter(|f| f.severity == s)
        .map(|f| (f.code, f.line, f.keyword.clone()))
        .collect()
}

fn no_alias() -> BTreeMap<String, String> {
    BTreeMap::new()
}

fn kshana(args: &[&str]) -> (i32, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .current_dir(root())
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string() + &String::from_utf8_lossy(&out.stderr),
    )
}

// ---------------------------------------------------------------------------------------------
// CDM

#[test]
fn the_obligatory_keyword_example_is_valid() {
    let (m, r) = cdm::validate(&od("cdm_508_b1_example_3_6_2.cdm"), &no_alias());
    assert!(r.valid, "{}", r.to_text());
    assert_eq!(m.objects.len(), 2);
    // Finding: Object1's covariance in the standard's example is not positive definite
    // (|corr(T, R_dot)| = 5.476 / sqrt(2533 * 0.005744) = 1.44 > 1).
    assert_eq!(
        codes(&r, Severity::Warning),
        vec![("covariance-not-pd", None, None)]
    );
    assert!(r.findings[0].message.contains("OBJECT1"));
}

#[test]
fn the_optional_keyword_example_breaks_two_rules_of_its_own_standard() {
    let (_, r) = cdm::validate(&od("cdm_508_b1_example_3_6_3.cdm"), &no_alias());
    assert!(!r.valid);
    let mut e = codes(&r, Severity::Error);
    e.sort();
    assert_eq!(
        e,
        vec![
            ("keyword-blank", Some(57), Some("TRACKS USED".into())),
            ("time-format", Some(16), Some("START_SCREEN_PERIOD".into())),
            ("time-format", Some(17), Some("STOP_SCREEN_PERIOD".into())),
        ],
        "{}",
        r.to_text()
    );
    // MISS_DISTANCE, RELATIVE_SPEED, the R components and RELATIVE_POSITION_N agree with the two
    // states; RELATIVE_POSITION_T and RELATIVE_VELOCITY_N do not (about 1.9 degrees about R).
    let w: Vec<_> = codes(&r, Severity::Warning)
        .into_iter()
        .map(|c| (c.0, c.2))
        .collect();
    assert_eq!(
        w,
        vec![
            ("covariance-not-pd", None),
            ("inconsistent", Some("RELATIVE_POSITION_T".into())),
            ("inconsistent", Some("RELATIVE_VELOCITY_N".into())),
        ]
    );
}

#[test]
fn the_xml_example_reads_like_the_kvn_one() {
    let (x, rx) = cdm::validate(&od("cdm_508_b1_example_4_4.xml"), &no_alias());
    assert!(rx.valid, "{}", rx.to_text());
    let (k, _) = cdm::parse(&od("cdm_508_b1_example_3_6_3.cdm"), &no_alias());
    for (a, b) in x.objects.iter().zip(&k.objects) {
        assert_eq!(cdm::state(a), cdm::state(b));
        // The XML example gives the 6x6 only; the KVN one adds the DRG and SRP rows for Object1.
        let six = |m: Vec<Vec<f64>>| -> Vec<Vec<f64>> {
            m.iter().take(6).map(|r| r[..6].to_vec()).collect()
        };
        assert_eq!(cdm::covariance(a).map(six), cdm::covariance(b).map(six));
    }
    assert_eq!(x.relative.num("MISS_DISTANCE"), Some(715.0));
    let units: Vec<_> = x
        .relative
        .items
        .iter()
        .filter_map(|i| i.units.clone())
        .collect();
    assert!(units.contains(&"m/s".to_string()));
}

/// Apply `edit` to the obligatory-keyword example and return the error codes.
fn mutated(edit: impl Fn(&str) -> String) -> Vec<&'static str> {
    let text = edit(&od("cdm_508_b1_example_3_6_2.cdm"));
    let (_, r) = cdm::validate(&text, &no_alias());
    let mut c: Vec<_> = codes(&r, Severity::Error)
        .into_iter()
        .map(|c| c.0)
        .collect();
    c.extend(
        codes(&r, Severity::Warning)
            .into_iter()
            .map(|c| c.0)
            .filter(|c| *c != "covariance-not-pd"),
    );
    c.sort();
    c.dedup();
    c
}

#[test]
fn each_rule_fires_on_a_message_that_breaks_it() {
    let rep = |a: &'static str, b: &'static str| move |t: &str| t.replacen(a, b, 1);
    type Edit = Box<dyn Fn(&str) -> String>;
    let cases: Vec<(Edit, Vec<&str>)> = vec![
        (Box::new(rep("SATCAT", "satcat")), vec!["lower-case"]),
        (Box::new(rep("715   [m]", "715   [km]")), vec!["units"]),
        (Box::new(rep("715   [m]", "715")), vec!["units-missing"]),
        (
            Box::new(rep("715   [m]", "0.715   [m]")),
            vec!["inconsistent"],
        ),
        (
            Box::new(rep("MESSAGE_ID                      = 201113719185\n", "")),
            vec!["missing-keyword"],
        ),
        (
            Box::new(|t: &str| {
                t.replacen("ORIGINATOR                      = JSPOC\n", "", 1)
                    .replacen(
                        "CCSDS_CDM_VERS                  = 1.0\n",
                        "CCSDS_CDM_VERS = 1.0\nMESSAGE_ID = 9\nORIGINATOR = JSPOC\n",
                        1,
                    )
            }),
            vec!["duplicate-keyword", "keyword-order"],
        ),
        (
            Box::new(rep(
                "MISS_DISTANCE",
                "COLLISION_PROBABILITY = 1.5\nMISS_DISTANCE",
            )),
            vec!["keyword-order", "out-of-range"],
        ),
        (
            Box::new(rep("1997-030E", "1997-30E")),
            vec!["designator-format"],
        ),
        (
            Box::new(rep("= CALCULATED", "= GUESSED")),
            vec!["normative-value"],
        ),
        (
            Box::new(rep("2010-03-13T22:37:52.618", "2010-03-13 22:37:52.618")),
            vec!["time-format"],
        ),
        (
            Box::new(rep("4.142E+01", "41.42E+00")),
            vec!["number-format"],
        ),
        (
            Box::new(|t: &str| {
                let i = t.rfind("= EME2000").unwrap();
                format!("{}= GCRF{}", &t[..i], &t[i + 9..])
            }),
            vec!["frame-mismatch"],
        ),
        (
            Box::new(|t: &str| format!("{t}CSRP_R = 1.0 [m**3/kg]\n")),
            vec!["covariance-rows"],
        ),
        (
            Box::new(rep("= OBJECT2", "= OBJECT1")),
            vec!["object-order"],
        ),
        (
            Box::new(rep("TCA ", "TCA_X ")),
            vec!["missing-keyword", "unknown-keyword"],
        ),
        (
            Box::new(|t: &str| format!("{t}EXTRA LINE WITHOUT EQUALS\n")),
            vec!["not-key-value"],
        ),
        (
            Box::new(|t: &str| {
                format!(
                    "COMMENT x\n{}",
                    t.replacen("CCSDS_CDM_VERS                  = 1.0\n", "", 1)
                )
            }),
            vec!["first-line", "missing-keyword"],
        ),
        (
            Box::new(rep("SATELLITE A", "SATELLITE\tA")),
            vec!["non-printable"],
        ),
    ];
    for (i, (edit, want)) in cases.into_iter().enumerate() {
        assert_eq!(mutated(edit), want, "case {i}");
    }
}

#[test]
fn aliases_map_a_providers_names_onto_the_standard() {
    let text = od("cdm_508_b1_example_3_6_2.cdm")
        .replace("MISS_DISTANCE ", "MISS_DIST ")
        .replace("OBJECT_DESIGNATOR ", "NORAD_ID ");
    let (_, r) = cdm::validate(&text, &no_alias());
    assert!(!r.valid);
    let aliases =
        cdm::parse_aliases(r#"{"miss_dist": "MISS_DISTANCE", "NORAD_ID": "OBJECT_DESIGNATOR"}"#)
            .unwrap();
    let (m, r) = cdm::validate(&text, &aliases);
    assert!(r.valid, "{}", r.to_text());
    // The standard KVN written from it reads back to the same message, valid, with the same
    // findings as the original example.
    let out = m.to_kvn();
    assert!(
        out.contains("MISS_DISTANCE                = 715 [m]"),
        "{out}"
    );
    let (m2, r2) = cdm::validate(&out, &no_alias());
    assert!(r2.valid, "{}", r2.to_text());
    assert_eq!(cdm::state(&m2.objects[1]), cdm::state(&m.objects[1]));
    assert_eq!(
        cdm::covariance(&m2.objects[0]),
        cdm::covariance(&m.objects[0])
    );
    assert!(cdm::parse_aliases(r#"{"X": "NOT_A_KEYWORD"}"#).is_err());
}

// ---------------------------------------------------------------------------------------------
// OEM and OCM

#[test]
fn the_oem_figure_is_valid_apart_from_its_elided_data() {
    // Figure G-11 elides most data lines ("..."); with four lines left per segment, degree-7
    // interpolation (§5.2.4.7) cannot be carried. Nothing else is wrong.
    let (doc, r) = ephem::check_oem(
        &fixture("tests/fixtures/ccsds/oem_502_b3_figG11.oem"),
        ephem::Profile::default(),
    );
    assert_eq!(doc.segments.len(), 2);
    let e = codes(&r, Severity::Error);
    assert_eq!(e.len(), 2);
    assert!(e.iter().all(|c| c.0 == "too-few-points"));
    assert!(codes(&r, Severity::Warning).is_empty(), "{}", r.to_text());
}

fn oem_codes(text: &str, p: ephem::Profile) -> Vec<&'static str> {
    let (_, r) = ephem::check_oem(text, p);
    let mut c: Vec<_> = r.findings.iter().map(|f| f.code).collect();
    c.sort();
    c.dedup();
    c
}

#[test]
fn oem_rules_fire() {
    let base = fixture("tests/fixtures/ccsds_cov/kshana_cov_leo.oem");
    let none = ephem::Profile::default();
    assert!(
        oem_codes(&base, none).is_empty(),
        "{:?}",
        oem_codes(&base, none)
    );
    // Epochs going back, a data line after STOP_TIME, a covariance that is not positive definite,
    // and a second segment in another time system.
    let swapped = base.replacen(
        "2024-01-01T00:05:00.000000 2892.878652",
        "2024-01-01T00:04:00.000000 2892.878652",
        1,
    );
    assert!(oem_codes(&swapped, none).is_empty());
    let back = base.replacen(
        "2024-01-01T00:10:00.000000 767.344019",
        "2024-01-01T00:04:00.000000 767.344019",
        1,
    );
    assert_eq!(oem_codes(&back, none), vec!["time-not-increasing"]);
    let outside = base.replacen(
        "STOP_TIME = 2024-01-01T00:25:00",
        "STOP_TIME = 2024-01-01T00:20:00",
        1,
    );
    assert_eq!(oem_codes(&outside, none), vec!["outside-span"]);
    let not_pd = base.replacen("\n1.440000000000000e-4\n", "\n-1.44e-4\n", 1);
    assert_eq!(oem_codes(&not_pd, none), vec!["covariance-not-pd"]);
    let seg = &base[base.find("META_START").unwrap()..];
    let two_systems = format!(
        "{base}{}",
        seg.replace("TIME_SYSTEM = UTC", "TIME_SYSTEM = TAI")
            .replace("2024-01-01T00:", "2024-01-01T01:")
    );
    assert_eq!(oem_codes(&two_systems, none), vec!["time-system-changed"]);
    let overlap = format!(
        "{base}{}",
        seg.replace("2024-01-01T00:2", "2024-01-01T00:3")
            .replace("2024-01-01T00:0", "2024-01-01T00:2")
    );
    assert!(
        oem_codes(&overlap, none).contains(&"useable-overlap"),
        "{:?}",
        oem_codes(&overlap, none)
    );
    // Profile: a 14-day span is asked for; the file covers 25 minutes. Largest gap 300 s.
    let p = ephem::Profile {
        min_span_days: Some(14.0),
        max_gap_s: Some(60.0),
    };
    assert_eq!(oem_codes(&base, p), vec!["profile-gap", "profile-span"]);
    let p = ephem::Profile {
        min_span_days: Some(0.01),
        max_gap_s: Some(300.0),
    };
    assert!(oem_codes(&base, p).is_empty());
}

#[test]
fn ocm_messages_and_their_rules() {
    for c in ["C01", "C03", "C04"] {
        for ext in ["kvn", "xml"] {
            let t = fixture(&format!(
                "tests/fixtures/odm_orekit_oracle/kshana/{c}.{ext}"
            ));
            let r = ephem::check_ocm(&t, ephem::Profile::default());
            assert!(
                r.valid && r.findings.is_empty(),
                "{c}.{ext}: {}",
                r.to_text()
            );
        }
    }
    let c5 = fixture("tests/fixtures/odm_orekit_oracle/kshana/C05.kvn");
    let r = ephem::check_ocm(&c5, ephem::Profile::default());
    assert!(r.valid);
    // Its second trajectory runs past STOP_TIME: five warnings, one per line.
    assert_eq!(codes(&r, Severity::Warning).len(), 5);
    // A covariance that is not positive definite is an error in the OCM (§6.2.7.10).
    let bad = c5.replacen(" 0.003379417700503743 ", " -0.003379417700503743 ", 1);
    let r = ephem::check_ocm(&bad, ephem::Profile::default());
    assert_eq!(
        codes(&r, Severity::Error)
            .iter()
            .map(|c| c.0)
            .collect::<Vec<_>>(),
        vec!["covariance-not-pd"]
    );
    // Relative and absolute time tags in one block (§6.2.2.5); a repeated tag (§6.2.2.4).
    let mixed = c5.replacen("360.25 ", "2026-03-01T00:06:00.25 ", 1);
    let r = ephem::check_ocm(&mixed, ephem::Profile::default());
    assert!(codes(&r, Severity::Error)
        .iter()
        .any(|c| c.0 == "mixed-time"));
    let dup = c5.replacen("360.25 ", "300.25 ", 1);
    let r = ephem::check_ocm(&dup, ephem::Profile::default());
    assert!(codes(&r, Severity::Error)
        .iter()
        .any(|c| c.0 == "duplicate-time"));
    // A PERT block is set aside and named, not failed.
    let pert = c5.replacen(
        "PHYS_START",
        "PERT_START\nATMOSPHERIC_MODEL = NRLMSIS00\nPERT_STOP\nPHYS_START",
        1,
    );
    let r = ephem::check_ocm(&pert, ephem::Profile::default());
    assert!(
        r.valid && r.not_checked == vec!["PERT".to_string()],
        "{}",
        r.to_text()
    );
}

// ---------------------------------------------------------------------------------------------
// Conversion and provenance

#[test]
fn oem_to_ocm_and_back_keeps_states_covariance_and_provenance() {
    for f in [
        "tests/fixtures/ccsds_cov/kshana_cov_leo.oem",
        "tests/fixtures/ccsds_oem_interop/kshana_meo_eme2000_multiseg.oem",
        "tests/fixtures/ccsds_oem_interop/kshana_leo_eme2000.oem",
    ] {
        let src = fixture(f);
        let ocm = convert::oem_to_ocm(&src).unwrap();
        let r = ephem::check_ocm(&ocm, ephem::Profile::default());
        assert!(r.valid && r.findings.is_empty(), "{f}: {}", r.to_text());
        let back = convert::ocm_to_oem(&ocm).unwrap();
        let (_, r) = ephem::check_oem(&back, ephem::Profile::default());
        assert!(r.valid, "{f}: {}", r.to_text());
        let mut rep = Report::new("OEM", "");
        let (a, b) = (
            ephem::read_oem(&src, &mut rep),
            ephem::read_oem(&back, &mut rep),
        );
        assert_eq!(a.segments.len(), b.segments.len());
        for (x, y) in a.segments.iter().zip(&b.segments) {
            assert_eq!(
                x.lines.iter().map(|l| &l.1).collect::<Vec<_>>(),
                y.lines.iter().map(|l| &l.1).collect::<Vec<_>>()
            );
            assert_eq!(
                x.covs
                    .iter()
                    .map(|c| (&c.epoch, &c.values))
                    .collect::<Vec<_>>(),
                y.covs
                    .iter()
                    .map(|c| (&c.epoch, &c.values))
                    .collect::<Vec<_>>()
            );
            for k in [
                "OBJECT_NAME",
                "OBJECT_ID",
                "CENTER_NAME",
                "REF_FRAME",
                "TIME_SYSTEM",
            ] {
                assert_eq!(x.get(k), y.get(k), "{f} {k}");
            }
        }
        // The originator and creation date survive, and each conversion left one provenance line.
        assert_eq!(a.get("ORIGINATOR"), b.get("ORIGINATOR"));
        assert_eq!(a.get("CREATION_DATE"), b.get("CREATION_DATE"));
        let prov: Vec<_> = b
            .header_comments
            .iter()
            .filter(|c| c.starts_with("PROVENANCE "))
            .collect();
        assert_eq!(prov.len(), 2, "{prov:?}");
        assert!(prov[0].contains("SOURCE=OEM") && prov[1].contains("SOURCE=OCM"));
        // The engine's own OEM reader reads the result to the same states.
        let p1 = kshana::oem::parse_oem(&src).unwrap();
        let p2 = kshana::oem::parse_oem(&back).unwrap();
        assert_eq!(
            p1.segments.iter().map(|s| &s.states).collect::<Vec<_>>(),
            p2.segments.iter().map(|s| &s.states).collect::<Vec<_>>()
        );
    }
    // An OEM with two objects has no single-object OCM form.
    let two = fixture("tests/fixtures/ccsds_cov/kshana_cov_leo.oem")
        + &fixture("tests/fixtures/ccsds_cov/kshana_cov_leo.oem")
            .split_once("META_START")
            .map(|(_, r)| format!("META_START{}", r.replace("KSHANA-COV-LEO-1", "OTHER")))
            .unwrap();
    assert!(convert::oem_to_ocm(&two).is_err());
}

#[test]
fn relative_ocm_time_tags_become_absolute() {
    // SELF-MADE OCM with relative time tags.
    let ocm = "CCSDS_OCM_VERS = 3.0\nCREATION_DATE = 2026-11-20T00:00:00\nORIGINATOR = SELFMADE\n\
META_START\nOBJECT_NAME = TEST\nTIME_SYSTEM = UTC\nEPOCH_TZERO = 2026-03-01T00:00:00\nMETA_STOP\n\
TRAJ_START\nCENTER_NAME = EARTH\nTRAJ_REF_FRAME = EME2000\nTRAJ_TYPE = CARTPV\n\
0.0 7000 0 0 0 7.5 0\n300.25 6800 2200 0 -2.3 7.1 0\nTRAJ_STOP\n";
    assert!(ephem::check_ocm(ocm, ephem::Profile::default()).valid);
    let oem = convert::ocm_to_oem(ocm).unwrap();
    assert!(
        oem.contains("\n2026-03-01T00:05:00.250000 6800 2200 0 -2.3 7.1 0\n"),
        "{oem}"
    );
    let (_, r) = ephem::check_oem(&oem, ephem::Profile::default());
    assert!(r.valid && r.findings.is_empty(), "{}", r.to_text());
    // A position-only trajectory has no OEM form.
    assert!(
        convert::ocm_to_oem(&fixture("tests/fixtures/odm_orekit_oracle/kshana/C05.kvn")).is_err()
    );
}

// ---------------------------------------------------------------------------------------------
// GP / TLE monitors (self-made sets)

#[test]
fn gp_compare_flags_the_object_whose_sources_disagree() {
    let a = gp_quality::read_sets(&od("gp_source_a.tle"));
    let b = gp_quality::read_sets(&od("gp_source_b.tle"));
    assert_eq!((a.len(), b.len()), (4, 4));
    let r = gp_quality::compare(&a, &b, gp_quality::CompareOpts::default());
    assert_eq!(r.only_in_a, vec![90004]);
    assert_eq!(r.only_in_b, vec![90005]);
    assert_eq!(r.flagged, 1);
    let by: BTreeMap<u32, &gp_quality::Comparison> =
        r.objects.iter().map(|c| (c.catalogue, c)).collect();
    assert_eq!(by[&90001].max_km, 0.0);
    // 0.5 degrees of mean anomaly at about 6,800 km: about 59 km, almost all along track.
    let c2 = by[&90002];
    assert!(
        c2.flagged && (55.0..65.0).contains(&c2.max_km),
        "{}",
        c2.max_km
    );
    assert!(c2.rtn_at_max_km[1].abs() > 0.99 * c2.max_km);
    // 0.01 degrees of RAAN: about 1 km.
    assert!(!by[&90003].flagged && by[&90003].max_km < 2.0);
    assert_eq!(r.evidence, "MODELLED");
}

#[test]
fn gp_audit_finds_each_planted_defect_and_nothing_else() {
    let sets = gp_quality::read_sets(&od("gp_audit.tle"));
    let o = gp_quality::AuditOpts {
        reference_days: Some(kshana::norad::epoch_days_1950("2026-320T12:00:00").unwrap()),
        ..Default::default()
    };
    let r = gp_quality::audit(&sets, o);
    let mut got: Vec<(Option<u32>, &str)> =
        r.findings.iter().map(|f| (f.catalogue, f.code)).collect();
    got.sort();
    assert_eq!(
        got,
        vec![
            (Some(90011), "consecutive-jump"),
            (Some(90011), "elset-number"),
            (Some(90012), "checksum"),
            (Some(90013), "perigee"),
            (Some(90013), "sgp4"),
            (Some(90014), "stale"),
        ]
    );
    // The two sets of 90010 were built with the SGP4 secular rates (gen_selfmade_tles.py, an
    // independent Python transcription of the SGP4 initialisation): the engine's SGP4 carries the
    // first onto the second to within 50 m (the 4-decimal angle fields alone allow about 25 m).
    let tight = gp_quality::audit(&sets, gp_quality::AuditOpts { jump_km: 0.05, ..o });
    assert!(!tight.findings.iter().any(|f| f.catalogue == Some(90010)));
}

// ---------------------------------------------------------------------------------------------
// Command line

#[test]
fn the_command_line_reports_and_exits_by_result() {
    let (c, t) = kshana(&[
        "orbit-data",
        "check",
        "tests/fixtures/orbit_data/cdm_508_b1_example_3_6_2.cdm",
    ]);
    assert_eq!(c, 0, "{t}");
    assert!(t.starts_with("valid against CCSDS 508.0-B-1"), "{t}");
    let (c, t) = kshana(&[
        "orbit-data",
        "check",
        "tests/fixtures/orbit_data/cdm_508_b1_example_3_6_3.cdm",
        "--json",
    ]);
    assert_eq!(c, 1, "{t}");
    let v: serde_json::Value = serde_json::from_str(&t).unwrap();
    assert_eq!(v["valid"], false);
    assert_eq!(v["message_type"], "CDM");
    let (c, t) = kshana(&["orbit-data", "check", "Cargo.toml"]);
    assert_eq!(c, 2, "{t}");
    let (c, t) = kshana(&[
        "orbit-data",
        "convert",
        "tests/fixtures/ccsds_cov/kshana_cov_leo.oem",
        "--to",
        "ocm",
    ]);
    assert_eq!(c, 0, "{t}");
    assert!(t.starts_with("CCSDS_OCM_VERS"));
    let (c, t) = kshana(&[
        "orbit-data",
        "gp-compare",
        "tests/fixtures/orbit_data/gp_source_a.tle",
        "tests/fixtures/orbit_data/gp_source_b.tle",
    ]);
    assert_eq!(c, 1, "{t}");
    assert!(t.contains("1 flagged above 25 km"), "{t}");
    let (c, t) = kshana(&[
        "orbit-data",
        "gp-audit",
        "tests/fixtures/orbit_data/gp_audit.tle",
        "--at",
        "2026-11-16T12:00:00",
        "--json",
    ]);
    assert_eq!(c, 1, "{t}");
    let v: serde_json::Value = serde_json::from_str(&t).unwrap();
    assert_eq!(v["findings"].as_array().unwrap().len(), 6);
    let (c, t) = kshana(&["orbit-data", "--help"]);
    assert_eq!(c, 0);
    for sub in ["check", "convert", "gp-compare", "gp-audit", "cov"] {
        assert!(t.contains(&format!("orbit-data {sub}")), "{t}");
    }
    let (c, _) = kshana(&["orbit-data", "nonsense"]);
    assert_eq!(c, 2);
}

#[test]
fn the_covariance_commands_round_trip_through_json() {
    let (c, t) = kshana(&[
        "orbit-data",
        "cov",
        "check",
        "tests/fixtures/orbit_data/cov_leo.json",
    ]);
    assert_eq!(c, 0, "{t}");
    let v: serde_json::Value = serde_json::from_str(&t).unwrap();
    assert_eq!(v["inertial"]["positive_definite"], true);
    let (c, t) = kshana(&[
        "orbit-data",
        "cov",
        "propagate",
        "tests/fixtures/orbit_data/cov_leo.json",
        "--dt-s",
        "5400",
    ]);
    assert_eq!(c, 0, "{t}");
    let v: serde_json::Value = serde_json::from_str(&t).unwrap();
    assert_eq!(v["evidence"], "MODELLED");
    // The along-track variance grows over an orbit.
    let t0 = 0.1f64; // input along-track sigma 0.1 km
    let tt = v["rtn_cov_km"][1][1].as_f64().unwrap().sqrt();
    assert!(tt > 2.0 * t0, "{tt}");
    let (c, t) = kshana(&[
        "orbit-data",
        "cov",
        "monte-carlo",
        "tests/fixtures/orbit_data/cov_leo.json",
        "--dt-s",
        "1800",
        "--samples",
        "200",
        "--seed",
        "4",
    ]);
    assert_eq!(c, 0, "{t}");
    let v: serde_json::Value = serde_json::from_str(&t).unwrap();
    let err = v["max_variance_ratio_error"].as_f64().unwrap();
    let sig = v["variance_sampling_sigma"].as_f64().unwrap();
    assert!(err < 4.0 * sig, "{err} vs {sig}");
    let (c, t) = kshana(&[
        "orbit-data",
        "cov",
        "synthetic",
        "tests/fixtures/orbit_data/cov_leo.json",
        "--sigma-rtn",
        "100,1000,50,0.5,0.1,0.05",
    ]);
    assert_eq!(c, 0, "{t}");
    let v: serde_json::Value = serde_json::from_str(&t).unwrap();
    assert_eq!(v["cov_km"].as_array().unwrap().len(), 6);
}
