// SPDX-License-Identifier: AGPL-3.0-only
//! CCSDS Orbit Data Messages (OPM, OMM, OCM; 502.0-B-3) against Orekit 13.1.8, as pre-registered
//! in `xval/odm-orekit/PREREGISTRATION.md` (cc6841da, committed before any comparison).
//!
//! The cases are built here. Kshana writes every case (`kshana/`, KVN, and XML for version 3.0);
//! the driver `xval/odm-orekit/OdmOracle.java` parses each file with Orekit, dumps what it read
//! (`outputs/orekit_reads_kshana.txt`, format in `xval/odm-orekit/FORMAT.md`) and writes the
//! parsed message back out with Orekit's own writer (`orekit/`). L1 compares the dump with the
//! cases; L2 parses Orekit's files with Kshana and compares with the cases. Regenerate the Kshana
//! side with `KSHANA_XVAL_WRITE=1`; otherwise the committed files must equal what Kshana writes.
//!
//! The legacy `OmmFile::to_omm_kvn` output of the M04 element set is in `legacy/` and its Orekit
//! dump in `outputs/orekit_reads_legacy.txt` (recorded, outside the verdict).
//!
//! Result of the first run (2026-10-14): 27 of the 30 Kshana files parse in Orekit and every
//! value of those is inside its bar except the TDB relative epochs below (904 values, worst
//! 0.021 of a bar); Kshana parses all 25 Orekit-written files, inside every bar except the same
//! TDB epochs (858 values, worst 0.020 of a bar). Findings, pinned in `L1_FINDINGS` and
//! `L2_FINDINGS`:
//! * Orekit 13.1.8 refuses an OMM TLE block without `ELEMENT_SET_NO` (M04, version 2.0 from
//!   `OmmFile`, which does not carry it); 502.0-B-3 and the NDM/XML schema make it optional.
//! * Orekit's XML parser refuses `COMMENT` inside `<userDefinedParameters>` (M05.xml, O06.xml);
//!   the NDM/XML 4.0.0 schema allows it and both files validate. The KVN forms parse.
//! * Orekit's OMM writer refuses a TLE block that carries `BTERM` instead of `BSTAR` (M02,
//!   SGP4-XP, `EPHEMERIS_TYPE = 4`): "missing mandatory key BSTAR". Its parser reads M02.
//! * OCM relative epochs under `TIME_SYSTEM = TDB` (C05): Orekit adds the offset as elapsed SI
//!   seconds on its continuous time line, so the TDB calendar epoch it resolves differs from
//!   `EPOCH_TZERO` + offset read on the TDB calendar by about 1.9e-10 s/s (6e-9 to 1e-7 s
//!   here), outside the 1e-9 s epoch bar; the same holds for the offsets Orekit writes. With
//!   UTC, TAI and TT (C01 to C04) relative and absolute epochs agree within the bar. Kshana
//!   keeps epoch tokens as written and does not resolve them.
//! * Legacy writer: `OmmFile::to_omm_kvn` wraps the metadata in `META_START`/`META_STOP`,
//!   which the OMM KVN does not define; Orekit stops at it ("TIME_SYSTEM has not been
//!   initialized"). The new `OmmMessage::from_omm_file(..).to_kvn()` is the conformant path.
//! * Harness: Orekit's OCM parser builds ICRF as the default trajectory frame, which needs the
//!   solar system barycenter; the driver registers a stub barycenter and a stub Earth (no
//!   ephemeris; nothing compared uses either).

use kshana::odm::{OcmBlock, OcmMessage, OdmHeader, OmmMessage, OpmMessage, Section, COV_TERMS};
use std::path::{Path, PathBuf};

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/odm_orekit_oracle")
}

/// splitmix64, so the cases do not depend on any library's random generator.
struct Rng(u64);

impl Rng {
    fn next(&mut self) -> u64 {
        self.0 = self.0.wrapping_add(0x9E37_79B9_7F4A_7C15);
        let mut z = self.0;
        z = (z ^ (z >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
        z ^ (z >> 31)
    }
    fn u(&mut self, lo: f64, hi: f64) -> f64 {
        lo + (hi - lo) * ((self.next() >> 11) as f64 / (1u64 << 53) as f64)
    }
    fn signed(&mut self, mag_lo: f64, mag_hi: f64) -> f64 {
        let m = self.u(mag_lo, mag_hi);
        if self.next() & 1 == 0 {
            m
        } else {
            -m
        }
    }
}

// -------------------------------------------------------------------------------------------
// cases

enum Msg {
    Opm(OpmMessage),
    Omm(OmmMessage),
    Ocm(OcmMessage),
}

struct Case {
    id: &'static str,
    msg: Msg,
}

impl Case {
    fn version(&self) -> &str {
        match &self.msg {
            Msg::Opm(m) => &m.header.version,
            Msg::Omm(m) => &m.header.version,
            Msg::Ocm(m) => &m.header.version,
        }
    }
    fn files(&self) -> Vec<(String, String)> {
        let (kvn, xml) = match &self.msg {
            Msg::Opm(m) => (m.to_kvn(), m.to_xml()),
            Msg::Omm(m) => (m.to_kvn(), m.to_xml()),
            Msg::Ocm(m) => (m.to_kvn(), m.to_xml()),
        };
        let mut v = vec![(format!("{}.kvn", self.id), kvn.unwrap())];
        if self.version().starts_with('3') {
            v.push((format!("{}.xml", self.id), xml.unwrap()));
        }
        v
    }
}

fn header(id: &str, version: &str, comments: usize, v3_extras: bool) -> OdmHeader {
    OdmHeader {
        version: version.into(),
        comments: (0..comments)
            .map(|i| {
                format!(
                    "Kshana ODM cross-validation case {id} header comment {}",
                    i + 1
                )
            })
            .collect(),
        classification: v3_extras.then(|| "unclassified test data".to_string()),
        creation_date: "2026-10-14T00:00:00".into(),
        originator: "KSHANA XVAL".into(),
        message_id: v3_extras.then(|| format!("{id}-0001")),
    }
}

fn meta(name: &str, frame: &str, ts: &str, theory: Option<&str>, comment: bool) -> Section {
    let mut s = Section::new();
    if comment {
        s.comments.push("metadata comment".into());
    }
    s.set("OBJECT_NAME", name)
        .set("OBJECT_ID", "2026-999A")
        .set("CENTER_NAME", "EARTH")
        .set("REF_FRAME", frame)
        .set("TIME_SYSTEM", ts);
    if let Some(t) = theory {
        s.set("MEAN_ELEMENT_THEORY", t);
    }
    s
}

fn with_comment(mut s: Section, c: Option<&str>) -> Section {
    if let Some(c) = c {
        s.comments.push(c.into());
    }
    s
}

fn state(r: &mut Rng, epoch: &str, c: Option<&str>) -> Section {
    let mut s = Section::new();
    s.set("EPOCH", epoch);
    for k in ["X", "Y", "Z"] {
        s.set_num(k, r.signed(100.0, 8000.0));
    }
    for k in ["X_DOT", "Y_DOT", "Z_DOT"] {
        s.set_num(k, r.signed(0.01, 7.9));
    }
    with_comment(s, c)
}

fn kepler(r: &mut Rng, anomaly: &str, c: Option<&str>) -> Section {
    let mut s = Section::new();
    s.set_num("SEMI_MAJOR_AXIS", r.u(6600.0, 42200.0))
        .set_num("ECCENTRICITY", r.u(0.0, 0.3))
        .set_num("INCLINATION", r.u(0.1, 179.9))
        .set_num("RA_OF_ASC_NODE", r.u(0.0, 360.0))
        .set_num("ARG_OF_PERICENTER", r.u(0.0, 360.0))
        .set_num(anomaly, r.u(0.0, 360.0))
        .set_num("GM", 398600.4415);
    with_comment(s, c)
}

fn spacecraft(r: &mut Rng, c: Option<&str>) -> Section {
    let mut s = Section::new();
    s.set_num("MASS", r.u(100.0, 5000.0))
        .set_num("SOLAR_RAD_AREA", r.u(1.0, 40.0))
        .set_num("SOLAR_RAD_COEFF", r.u(1.0, 2.0))
        .set_num("DRAG_AREA", r.u(1.0, 40.0))
        .set_num("DRAG_COEFF", r.u(2.0, 2.5));
    with_comment(s, c)
}

/// One covariance term of the lower triangle at row `i`, column `j` (0..6): position terms in
/// km², mixed in km²/s, velocity in km²/s²; diagonals positive.
fn cov_term(r: &mut Rng, i: usize, j: usize) -> f64 {
    let scale = match (i < 3, j < 3) {
        (true, true) => 1e-3,
        (false, false) => 1e-9,
        _ => 1e-6,
    };
    if i == j {
        scale * r.u(0.5, 5.0)
    } else {
        scale * r.signed(0.01, 0.4)
    }
}

fn covariance(r: &mut Rng, frame: Option<&str>, c: Option<&str>) -> Section {
    let mut s = Section::new();
    if let Some(f) = frame {
        s.set("COV_REF_FRAME", f);
    }
    let mut k = 0;
    for i in 0..6 {
        for j in 0..=i {
            s.set_num(COV_TERMS[k], cov_term(r, i, j));
            k += 1;
        }
    }
    with_comment(s, c)
}

fn maneuver(r: &mut Rng, epoch: &str, frame: &str, c: Option<&str>) -> Section {
    let mut s = Section::new();
    s.set("MAN_EPOCH_IGNITION", epoch)
        .set_num("MAN_DURATION", r.u(1.0, 300.0))
        .set_num("MAN_DELTA_MASS", -r.u(0.01, 10.0))
        .set("MAN_REF_FRAME", frame)
        .set_num("MAN_DV_1", r.signed(1e-5, 0.01))
        .set_num("MAN_DV_2", r.signed(1e-5, 0.01))
        .set_num("MAN_DV_3", r.signed(1e-5, 0.01));
    with_comment(s, c)
}

fn user(pairs: &[(&str, &str)], c: Option<&str>) -> Section {
    let mut s = Section::new();
    for (k, v) in pairs {
        s.set(k, *v);
    }
    with_comment(s, c)
}

fn opm_cases() -> Vec<Case> {
    let mut r = Rng(0x0D3_0001);
    let ep = "2026-03-01T12:00:00.250";
    let o01 = OpmMessage {
        header: header("O01", "3.0", 2, true),
        metadata: meta("XVAL SAT", "EME2000", "UTC", None, false),
        state: state(&mut r, ep, Some("state vector only")),
        keplerian: None,
        spacecraft: None,
        covariance: None,
        maneuvers: vec![],
        user: None,
    };
    let o02 = OpmMessage {
        header: header("O02", "3.0", 0, false),
        metadata: meta("XVAL SAT", "GCRF", "TAI", None, false),
        state: state(&mut r, "2026-03-02T00:00:00", None),
        keplerian: Some(kepler(&mut r, "TRUE_ANOMALY", None)),
        spacecraft: Some(spacecraft(&mut r, None)),
        covariance: None,
        maneuvers: vec![],
        user: None,
    };
    let o03 = OpmMessage {
        header: header("O03", "3.0", 0, false),
        metadata: meta("XVAL SAT", "EME2000", "TDB", None, false),
        state: state(&mut r, "2026-03-03T06:30:15.123456", None),
        keplerian: Some(kepler(&mut r, "MEAN_ANOMALY", None)),
        spacecraft: None,
        covariance: Some(covariance(&mut r, Some("RTN"), None)),
        maneuvers: vec![],
        user: None,
    };
    let o04 = OpmMessage {
        header: header("O04", "3.0", 0, true),
        metadata: meta("XVAL SAT", "EME2000", "GPS", None, false),
        state: state(&mut r, "2026-03-04T00:00:00", None),
        keplerian: None,
        spacecraft: None,
        covariance: None,
        maneuvers: vec![
            maneuver(&mut r, "2026-03-04T01:00:00", "RTN", None),
            maneuver(&mut r, "2026-03-04T02:30:00.5", "EME2000", None),
        ],
        user: Some(user(
            &[("EARTH_MODEL", "WGS-84"), ("OPERATOR_NOTE", "two burns")],
            None,
        )),
    };
    let o05 = OpmMessage {
        header: header("O05", "2.0", 1, false),
        metadata: meta("XVAL SAT", "EME2000", "TT", None, false),
        state: state(&mut r, "2026-03-05T00:00:00", None),
        keplerian: None,
        spacecraft: None,
        covariance: Some(covariance(&mut r, None, None)),
        maneuvers: vec![],
        user: None,
    };
    let o06 = OpmMessage {
        header: header("O06", "3.0", 2, true),
        metadata: meta("XVAL SAT", "EME2000", "UTC", None, true),
        state: state(&mut r, "2026-03-06T00:00:00", Some("state comment")),
        keplerian: Some(kepler(&mut r, "TRUE_ANOMALY", Some("kepler comment"))),
        spacecraft: Some(spacecraft(&mut r, Some("spacecraft comment"))),
        covariance: Some(covariance(&mut r, Some("TNW"), Some("covariance comment"))),
        maneuvers: vec![
            maneuver(&mut r, "2026-03-06T01:00:00", "RTN", Some("first burn")),
            maneuver(&mut r, "2026-03-06T02:00:00", "TNW", Some("second burn")),
            maneuver(&mut r, "2026-03-06T03:00:00", "EME2000", Some("third burn")),
        ],
        user: Some(user(&[("MISSION_PHASE", "LEOP")], Some("user comment"))),
    };
    [o01, o02, o03, o04, o05, o06]
        .into_iter()
        .zip(["O01", "O02", "O03", "O04", "O05", "O06"])
        .map(|(m, id)| Case {
            id,
            msg: Msg::Opm(m),
        })
        .collect()
}

fn mean_elements(r: &mut Rng, epoch: &str, sma: bool, c: Option<&str>) -> Section {
    let mut s = Section::new();
    s.set("EPOCH", epoch);
    if sma {
        s.set_num("SEMI_MAJOR_AXIS", r.u(6800.0, 26600.0));
    } else {
        s.set_num("MEAN_MOTION", r.u(1.0, 16.0));
    }
    s.set_num("ECCENTRICITY", r.u(0.0, 0.2))
        .set_num("INCLINATION", r.u(0.1, 179.9))
        .set_num("RA_OF_ASC_NODE", r.u(0.0, 360.0))
        .set_num("ARG_OF_PERICENTER", r.u(0.0, 360.0))
        .set_num("MEAN_ANOMALY", r.u(0.0, 360.0));
    if sma {
        s.set_num("GM", 398600.4415);
    }
    with_comment(s, c)
}

fn tle(r: &mut Rng, ephemeris_type: u32, xp: bool, c: Option<&str>) -> Section {
    let mut s = Section::new();
    s.set("EPHEMERIS_TYPE", ephemeris_type.to_string())
        .set("CLASSIFICATION_TYPE", "U")
        .set("NORAD_CAT_ID", "99001")
        .set("ELEMENT_SET_NO", "999")
        .set("REV_AT_EPOCH", "12345");
    if xp {
        s.set_num("BTERM", r.u(0.001, 0.05))
            .set_num("MEAN_MOTION_DOT", r.signed(1e-8, 1e-4))
            .set_num("AGOM", r.u(0.001, 0.05));
    } else {
        s.set_num("BSTAR", r.signed(1e-6, 1e-3))
            .set_num("MEAN_MOTION_DOT", r.signed(1e-8, 1e-4))
            .set_num("MEAN_MOTION_DDOT", r.signed(1e-13, 1e-9));
    }
    with_comment(s, c)
}

/// The ISS line pair of the `src/omm.rs` unit tests.
const ISS: &str = "ISS (ZARYA)\n\
    1 25544U 98067A   24001.00000000  .00000000  00000-0  00000-0 0  9990\n\
    2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537";

fn iss() -> kshana::omm::OmmFile {
    kshana::omm::OmmFile::from_tle_block(ISS, "KSHANA XVAL", "2026-10-14T00:00:00")
        .unwrap()
        .remove(0)
}

fn omm_cases() -> Vec<Case> {
    let mut r = Rng(0x0D3_0002);
    let m01 = OmmMessage {
        header: header("M01", "3.0", 0, false),
        metadata: meta("XVAL SAT", "TEME", "UTC", Some("SGP4"), false),
        mean_elements: mean_elements(&mut r, "2026-03-01T12:00:00.250", false, None),
        spacecraft: None,
        tle: Some(tle(&mut r, 0, false, None)),
        covariance: None,
        user: None,
    };
    let m02 = OmmMessage {
        header: header("M02", "3.0", 0, false),
        metadata: meta("XVAL SAT", "TEME", "UTC", Some("SGP4-XP"), false),
        mean_elements: mean_elements(&mut r, "2026-03-02T00:00:00", false, None),
        spacecraft: None,
        tle: Some(tle(&mut r, 4, true, None)),
        covariance: None,
        user: None,
    };
    let m03 = OmmMessage {
        header: header("M03", "3.0", 0, false),
        metadata: meta("XVAL SAT", "EME2000", "TAI", Some("DSST"), false),
        mean_elements: mean_elements(&mut r, "2026-03-03T00:00:00", true, None),
        spacecraft: Some(spacecraft(&mut r, None)),
        tle: None,
        covariance: Some(covariance(&mut r, Some("RTN"), None)),
        user: None,
    };
    let m04 = OmmMessage::from_omm_file(&iss());
    let m05 = OmmMessage {
        header: header("M05", "3.0", 2, true),
        metadata: meta("XVAL SAT", "TEME", "UTC", Some("SGP4"), true),
        mean_elements: mean_elements(
            &mut r,
            "2026-03-05T00:00:00",
            false,
            Some("mean elements comment"),
        ),
        spacecraft: None,
        tle: Some(tle(&mut r, 0, false, Some("tle comment"))),
        covariance: None,
        user: Some(user(
            &[("SOURCE", "synthetic"), ("FIT_SPAN", "3 days")],
            Some("user comment"),
        )),
    };
    [m01, m02, m03, m04, m05]
        .into_iter()
        .zip(["M01", "M02", "M03", "M04", "M05"])
        .map(|(m, id)| Case {
            id,
            msg: Msg::Omm(m),
        })
        .collect()
}

const TZERO: &str = "2026-03-01T00:00:00";

fn ocm_meta(ts: &str, ident: bool, c: Option<&str>) -> Section {
    let mut s = Section::new();
    if ident {
        s.set("OBJECT_NAME", "XVAL SAT")
            .set("INTERNATIONAL_DESIGNATOR", "2026-999A")
            .set("CATALOG_NAME", "SATCAT")
            .set("OBJECT_DESIGNATOR", "99001")
            .set("ORIGINATOR_POC", "Flight Dynamics Desk")
            .set("OPERATOR", "XVAL OPERATIONS");
    }
    s.set("TIME_SYSTEM", ts).set("EPOCH_TZERO", TZERO);
    if ident {
        s.set_num("SCLK_OFFSET_AT_EPOCH", 28800.0)
            .set_num("SCLK_SEC_PER_SI_SEC", 2.5)
            .set("START_TIME", "2026-03-01T00:00:00")
            .set("STOP_TIME", "2026-03-01T00:04:00");
    }
    with_comment(s, c)
}

/// Absolute epoch `secs` seconds after `TZERO` (secs < 86400).
fn abs_epoch(secs: f64) -> String {
    let h = (secs / 3600.0).floor();
    let m = ((secs - 3600.0 * h) / 60.0).floor();
    let s = secs - 3600.0 * h - 60.0 * m;
    format!("2026-03-01T{:02}:{:02}:{:09.6}", h as u32, m as u32, s)
}

fn traj(
    r: &mut Rng,
    kind: &str,
    frame: &str,
    relative: bool,
    t0: f64,
    ids: (Option<&str>, Option<&str>),
    c: Option<&str>,
) -> OcmBlock {
    let mut b = OcmBlock::default();
    if let Some(i) = ids.0 {
        b.section.set("TRAJ_ID", i);
    }
    if let Some(p) = ids.1 {
        b.section.set("TRAJ_PREV_ID", p);
    }
    b.section
        .set("CENTER_NAME", "EARTH")
        .set("TRAJ_REF_FRAME", frame)
        .set("TRAJ_TYPE", kind);
    if let Some(c) = c {
        b.section.comments.push(c.into());
    }
    let n = match kind {
        "CARTP" => 3,
        "CARTPV" => 6,
        _ => 9,
    };
    for i in 0..5 {
        let t = t0 + 60.0 * i as f64 + if relative { 0.25 } else { 0.0 };
        let mut v = Vec::new();
        for k in 0..n {
            v.push(match k {
                0..=2 => r.signed(100.0, 8000.0),
                3..=5 => r.signed(0.01, 7.9),
                _ => r.signed(1e-6, 1e-2),
            });
        }
        let ep = if relative {
            format!("{t:?}")
        } else {
            abs_epoch(t)
        };
        b.push_line(&ep, &v);
    }
    b
}

fn phys(r: &mut Rng, c: Option<&str>) -> OcmBlock {
    let mut b = OcmBlock::default();
    b.section
        .set_num("DRAG_CONST_AREA", r.u(1.0, 40.0))
        .set_num("DRAG_COEFF_NOM", r.u(2.0, 2.5))
        .set_num("INITIAL_WET_MASS", r.u(1000.0, 2000.0))
        .set_num("WET_MASS", r.u(500.0, 1000.0))
        .set_num("DRY_MASS", r.u(100.0, 500.0))
        .set_num("SRP_CONST_AREA", r.u(1.0, 40.0))
        .set_num("SOLAR_RAD_COEFF", r.u(1.0, 2.0));
    if let Some(c) = c {
        b.section.comments.push(c.into());
    }
    b
}

fn ocm_cov(r: &mut Rng, id: &str, kind: &str, frame: &str, n: usize, c: Option<&str>) -> OcmBlock {
    let mut b = OcmBlock::default();
    b.section
        .set("COV_ID", id)
        .set("COV_REF_FRAME", frame)
        .set("COV_TYPE", kind)
        .set("COV_ORDERING", "LTM");
    if let Some(c) = c {
        b.section.comments.push(c.into());
    }
    let dim = if kind == "CARTP" { 3 } else { 6 };
    for l in 0..n {
        let mut v = Vec::new();
        for i in 0..dim {
            for j in 0..=i {
                v.push(cov_term(r, i, j));
            }
        }
        b.push_line(&abs_epoch(120.0 * l as f64), &v);
    }
    b
}

fn ocm_man(r: &mut Rng, id: &str, absolute: bool, c: Option<&str>) -> OcmBlock {
    let mut b = OcmBlock::default();
    b.section
        .set("MAN_ID", id)
        .set("MAN_DEVICE_ID", if absolute { "THR1" } else { "THR2" })
        .set("MAN_REF_FRAME", if absolute { "RTN" } else { "EME2000" })
        .set("DC_TYPE", "CONTINUOUS")
        .set(
            "MAN_COMPOSITION",
            if absolute {
                "TIME_ABSOLUTE,MAN_DURA,DELTA_MASS,DV_X,DV_Y,DV_Z"
            } else {
                "TIME_RELATIVE,ACC_X,ACC_Y,ACC_Z"
            },
        );
    if let Some(c) = c {
        b.section.comments.push(c.into());
    }
    for i in 0..3 {
        let t = 30.0 + 50.0 * i as f64;
        if absolute {
            let v = [
                r.u(1.0, 30.0),
                -r.u(0.01, 2.0),
                r.signed(1e-5, 0.01),
                r.signed(1e-5, 0.01),
                r.signed(1e-5, 0.01),
            ];
            b.push_line(&abs_epoch(t), &v);
        } else {
            let v = [
                r.signed(1e-8, 1e-5),
                r.signed(1e-8, 1e-5),
                r.signed(1e-8, 1e-5),
            ];
            b.push_line(&format!("{:?}", t + 0.5), &v);
        }
    }
    b
}

fn ocm_cases() -> Vec<Case> {
    let mut r = Rng(0x0D3_0003);
    let c01 = OcmMessage {
        header: header("C01", "3.0", 0, false),
        metadata: ocm_meta("UTC", false, None),
        traj: vec![traj(
            &mut r,
            "CARTPV",
            "EME2000",
            false,
            0.0,
            (None, None),
            None,
        )],
        phys: None,
        cov: vec![],
        man: vec![],
        user: None,
    };
    let c02 = OcmMessage {
        header: header("C02", "3.0", 0, true),
        metadata: ocm_meta("TAI", true, None),
        traj: vec![traj(
            &mut r,
            "CARTPVA",
            "GCRF",
            true,
            0.0,
            (None, None),
            None,
        )],
        phys: None,
        cov: vec![],
        man: vec![],
        user: None,
    };
    let c03 = OcmMessage {
        header: header("C03", "3.0", 0, false),
        metadata: ocm_meta("UTC", false, None),
        traj: vec![
            traj(
                &mut r,
                "CARTP",
                "EME2000",
                false,
                0.0,
                (Some("T1"), None),
                None,
            ),
            traj(
                &mut r,
                "CARTPV",
                "EME2000",
                false,
                300.0,
                (Some("T2"), Some("T1")),
                None,
            ),
        ],
        phys: Some(phys(&mut r, None)),
        cov: vec![
            ocm_cov(&mut r, "C1", "CARTPV", "EME2000", 3, None),
            ocm_cov(&mut r, "C2", "CARTP", "RTN", 2, None),
        ],
        man: vec![],
        user: None,
    };
    let c04 = OcmMessage {
        header: header("C04", "3.0", 0, false),
        metadata: ocm_meta("TT", false, None),
        traj: vec![traj(
            &mut r,
            "CARTPV",
            "EME2000",
            false,
            0.0,
            (None, None),
            None,
        )],
        phys: None,
        cov: vec![],
        man: vec![
            ocm_man(&mut r, "M1", true, None),
            ocm_man(&mut r, "M2", false, None),
        ],
        user: None,
    };
    let mut user_block = OcmBlock::default();
    user_block.section.comments.push("user comment".into());
    user_block
        .section
        .set("MISSION_PHASE", "ROUTINE")
        .set("SOURCE", "synthetic");
    let c05 = OcmMessage {
        header: header("C05", "3.0", 2, true),
        metadata: ocm_meta("TDB", true, Some("metadata comment")),
        traj: vec![
            traj(
                &mut r,
                "CARTP",
                "EME2000",
                false,
                0.0,
                (Some("T1"), None),
                Some("first trajectory"),
            ),
            traj(
                &mut r,
                "CARTPVA",
                "GCRF",
                true,
                300.0,
                (Some("T2"), Some("T1")),
                Some("second trajectory"),
            ),
        ],
        phys: Some(phys(&mut r, Some("physical properties"))),
        cov: vec![
            ocm_cov(
                &mut r,
                "C1",
                "CARTPV",
                "EME2000",
                2,
                Some("first covariance"),
            ),
            ocm_cov(&mut r, "C2", "CARTP", "RTN", 2, Some("second covariance")),
        ],
        man: vec![
            ocm_man(&mut r, "M1", true, Some("first maneuver block")),
            ocm_man(&mut r, "M2", false, Some("second maneuver block")),
        ],
        user: Some(user_block),
    };
    [c01, c02, c03, c04, c05]
        .into_iter()
        .zip(["C01", "C02", "C03", "C04", "C05"])
        .map(|(m, id)| Case {
            id,
            msg: Msg::Ocm(m),
        })
        .collect()
}

fn cases() -> Vec<Case> {
    let mut v = opm_cases();
    v.extend(omm_cases());
    v.extend(ocm_cases());
    v
}

#[test]
fn kshana_messages_are_reproducible() {
    let write = std::env::var("KSHANA_XVAL_WRITE").is_ok();
    let d = dir().join("kshana");
    let mut files: Vec<(PathBuf, String)> = cases()
        .iter()
        .flat_map(|c| c.files())
        .map(|(n, t)| (d.join(n), t))
        .collect();
    files.push((dir().join("legacy/M04.kvn"), iss().to_omm_kvn()));
    for (p, text) in files {
        if write {
            std::fs::create_dir_all(p.parent().unwrap()).unwrap();
            std::fs::write(&p, &text).unwrap();
        } else {
            let committed =
                std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
            assert_eq!(
                committed,
                text,
                "{} differs from what Kshana writes",
                p.display()
            );
        }
    }
}

// -------------------------------------------------------------------------------------------
// canonical block form, shared by the cases, the Orekit dump and Kshana's reading of Orekit

#[derive(Clone, Debug, Default)]
struct Blk {
    name: String,
    comments: Vec<String>,
    items: Vec<(String, String)>,
    lines: Vec<Vec<String>>,
}

#[derive(Clone, Debug, Default)]
struct Canon {
    version: String,
    blocks: Vec<Blk>,
}

fn blk(name: &str, s: &Section) -> Blk {
    Blk {
        name: name.into(),
        comments: s.comments.clone(),
        items: s.items.clone(),
        lines: vec![],
    }
}

fn ocm_blk(name: &str, b: &OcmBlock) -> Blk {
    Blk {
        lines: b.lines.clone(),
        ..blk(name, &b.section)
    }
}

fn header_blk(h: &OdmHeader) -> Blk {
    let mut s = Section::new();
    s.comments = h.comments.clone();
    if let Some(c) = &h.classification {
        s.set("CLASSIFICATION", c.as_str());
    }
    s.set("CREATION_DATE", h.creation_date.as_str())
        .set("ORIGINATOR", h.originator.as_str());
    if let Some(m) = &h.message_id {
        s.set("MESSAGE_ID", m.as_str());
    }
    blk("header", &s)
}

fn canon(m: &Msg) -> Canon {
    match m {
        Msg::Opm(m) => {
            let mut b = vec![
                header_blk(&m.header),
                blk("meta", &m.metadata),
                blk("state", &m.state),
            ];
            b.extend(m.keplerian.iter().map(|s| blk("kepler", s)));
            b.extend(m.spacecraft.iter().map(|s| blk("spacecraft", s)));
            b.extend(m.covariance.iter().map(|s| blk("cov", s)));
            b.extend(m.maneuvers.iter().map(|s| blk("man", s)));
            b.extend(m.user.iter().map(|s| blk("user", s)));
            Canon {
                version: m.header.version.clone(),
                blocks: b,
            }
        }
        Msg::Omm(m) => {
            let mut b = vec![
                header_blk(&m.header),
                blk("meta", &m.metadata),
                blk("mean", &m.mean_elements),
            ];
            b.extend(m.spacecraft.iter().map(|s| blk("spacecraft", s)));
            b.extend(m.tle.iter().map(|s| blk("tle", s)));
            b.extend(m.covariance.iter().map(|s| blk("cov", s)));
            b.extend(m.user.iter().map(|s| blk("user", s)));
            Canon {
                version: m.header.version.clone(),
                blocks: b,
            }
        }
        Msg::Ocm(m) => {
            let mut b = vec![header_blk(&m.header), blk("meta", &m.metadata)];
            b.extend(m.traj.iter().map(|x| ocm_blk("traj", x)));
            b.extend(m.phys.iter().map(|x| ocm_blk("phys", x)));
            b.extend(m.cov.iter().map(|x| ocm_blk("cov", x)));
            b.extend(m.man.iter().map(|x| ocm_blk("man", x)));
            b.extend(m.user.iter().map(|x| ocm_blk("user", x)));
            Canon {
                version: m.header.version.clone(),
                blocks: b,
            }
        }
    }
}

/// One file's entry of an Orekit dump.
struct Dumped {
    id: String,
    format: String,
    parse_error: Option<String>,
    write_error: Option<String>,
    canon: Canon,
}

fn read_dump(p: &Path) -> Vec<Dumped> {
    let text = std::fs::read_to_string(p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    let mut out = Vec::new();
    let mut cur: Option<Dumped> = None;
    for line in text.lines() {
        if line.is_empty() {
            continue;
        }
        let (k, v) = line.split_once('=').unwrap_or((line, ""));
        if k == "end" {
            out.push(cur.take().expect("end without case"));
            continue;
        }
        let d = cur.get_or_insert_with(|| Dumped {
            id: String::new(),
            format: String::new(),
            parse_error: None,
            write_error: None,
            canon: Canon::default(),
        });
        match k {
            "case" => d.id = v.into(),
            "kind" => {}
            "format" => d.format = v.into(),
            "version" => d.canon.version = v.into(),
            "parse_error" => d.parse_error = Some(v.into()),
            "write_error" => d.write_error = Some(v.into()),
            "block" => d.canon.blocks.push(Blk {
                name: v.into(),
                ..Blk::default()
            }),
            "comment" => d.canon.blocks.last_mut().unwrap().comments.push(v.into()),
            "line" => d
                .canon
                .blocks
                .last_mut()
                .unwrap()
                .lines
                .push(v.split_whitespace().map(str::to_string).collect()),
            _ => d
                .canon
                .blocks
                .last_mut()
                .unwrap()
                .items
                .push((k.into(), v.into())),
        }
    }
    out
}

// -------------------------------------------------------------------------------------------
// comparison

const EPOCH_KEYS: &[&str] = &[
    "CREATION_DATE",
    "EPOCH",
    "REF_FRAME_EPOCH",
    "MAN_EPOCH_IGNITION",
    "EPOCH_TZERO",
    "START_TIME",
    "STOP_TIME",
    "USEABLE_START_TIME",
    "USEABLE_STOP_TIME",
];

fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let mp = (m + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// `YYYY-MM-DDThh:mm:ss[.f]` or `YYYY-DDDThh:mm:ss[.f]` as (whole seconds, fraction).
fn epoch(s: &str) -> (i64, f64) {
    let (date, time) = s
        .trim()
        .split_once('T')
        .unwrap_or_else(|| panic!("epoch {s:?}"));
    let p: Vec<&str> = date.split('-').collect();
    let day = match p.as_slice() {
        [y, m, d] => days_from_civil(y.parse().unwrap(), m.parse().unwrap(), d.parse().unwrap()),
        [y, doy] => days_from_civil(y.parse().unwrap(), 1, 1) + doy.parse::<i64>().unwrap() - 1,
        _ => panic!("epoch {s:?}"),
    };
    let t: Vec<&str> = time.trim_end_matches('Z').split(':').collect();
    let (h, mi): (i64, i64) = (t[0].parse().unwrap(), t[1].parse().unwrap());
    let (sw, sf) = t[2].split_once('.').unwrap_or((t[2], "0"));
    let frac: f64 = format!("0.{sf}").parse().unwrap();
    (
        day * 86_400 + h * 3600 + mi * 60 + sw.parse::<i64>().unwrap(),
        frac,
    )
}

fn epoch_diff(a: (i64, f64), b: (i64, f64)) -> f64 {
    (a.0 - b.0) as f64 + (a.1 - b.1)
}

/// An epoch token of an OCM data line: absolute, or seconds from `EPOCH_TZERO`.
fn line_epoch(tok: &str, tzero: (i64, f64)) -> (i64, f64) {
    match tok.parse::<f64>() {
        Ok(rel) => {
            let w = rel.floor();
            (tzero.0 + w as i64, tzero.1 + (rel - w))
        }
        Err(_) => epoch(tok),
    }
}

/// Worst fraction of a bar used, and failures.
#[derive(Default)]
struct Tally {
    tzero: Option<(i64, f64)>,
    worst: f64,
    n: usize,
    fails: Vec<String>,
}

impl Tally {
    fn value(&mut self, what: &str, key: &str, want: &str, got: &str) {
        self.n += 1;
        if EPOCH_KEYS.contains(&key) {
            // the NDM epoch type also admits seconds relative to EPOCH_TZERO (OCM)
            let tz = self.tzero.unwrap_or((0, 0.0));
            let d = epoch_diff(line_epoch(got, tz), line_epoch(want, tz)).abs();
            if d > 1e-9 {
                self.fails
                    .push(format!("{what} {key}: {got} vs {want} ({d:e} s)"));
            } else {
                self.worst = self.worst.max(d / 1e-9);
            }
            return;
        }
        match (want.parse::<f64>(), got.parse::<f64>()) {
            (Ok(w), Ok(g)) => self.real(what, key, w, g),
            _ => {
                if want != got {
                    self.fails
                        .push(format!("{what} {key}: {got:?} vs {want:?}"));
                }
            }
        }
    }
    fn real(&mut self, what: &str, key: &str, want: f64, got: f64) {
        let bar = 1e-14 * want.abs().max(got.abs());
        let d = (got - want).abs();
        if d > bar {
            self.fails
                .push(format!("{what} {key}: {got:e} vs {want:e} (diff {d:e})"));
        } else if bar > 0.0 {
            self.worst = self.worst.max(d / bar);
        }
    }
}

fn compare(want: &Canon, got: &Canon, what: &str, t: &mut Tally) {
    let vnum = |s: &str| s.parse::<f64>().unwrap_or(f64::NAN);
    if vnum(&want.version) != vnum(&got.version) {
        t.fails.push(format!(
            "{what}: version {} vs {}",
            got.version, want.version
        ));
    }
    let tzero = want
        .blocks
        .iter()
        .find(|b| b.name == "meta")
        .and_then(|b| b.items.iter().find(|(k, _)| k == "EPOCH_TZERO"))
        .map(|(_, v)| epoch(v));
    t.tzero = tzero;
    let mut seen: Vec<&str> = Vec::new();
    for wb in &want.blocks {
        let idx = seen.iter().filter(|n| **n == wb.name).count();
        seen.push(&wb.name);
        let w = format!("{what} {}[{idx}]", wb.name);
        let Some(gb) = got.blocks.iter().filter(|b| b.name == wb.name).nth(idx) else {
            t.fails.push(format!("{w}: block missing"));
            continue;
        };
        if wb.comments != gb.comments {
            t.fails.push(format!(
                "{w}: comments {:?} vs {:?}",
                gb.comments, wb.comments
            ));
        }
        for (k, v) in &wb.items {
            match gb.items.iter().find(|(gk, _)| gk == k) {
                Some((_, gv)) => t.value(&w, k, v, gv),
                None => t.fails.push(format!("{w}: {k} missing")),
            }
        }
        if wb.lines.len() != gb.lines.len() {
            t.fails.push(format!(
                "{w}: {} data lines vs {}",
                gb.lines.len(),
                wb.lines.len()
            ));
            continue;
        }
        for (i, (wl, gl)) in wb.lines.iter().zip(&gb.lines).enumerate() {
            let lw = format!("{w} line {i}");
            if wl.len() != gl.len() {
                t.fails
                    .push(format!("{lw}: {} tokens vs {}", gl.len(), wl.len()));
                continue;
            }
            let tz = tzero.unwrap_or((0, 0.0));
            t.n += 1;
            let d = epoch_diff(line_epoch(&gl[0], tz), line_epoch(&wl[0], tz)).abs();
            if d > 1e-9 {
                t.fails
                    .push(format!("{lw} epoch: {} vs {} ({d:e} s)", gl[0], wl[0]));
            } else {
                t.worst = t.worst.max(d / 1e-9);
            }
            for (j, (a, b)) in wl[1..].iter().zip(&gl[1..]).enumerate() {
                t.real(
                    &lw,
                    &format!("value {}", j + 1),
                    a.parse().unwrap(),
                    b.parse().unwrap(),
                );
            }
        }
    }
}

/// Findings of the first run (2026-10-14), pinned as (file, text of the failure); each must
/// recur, and no other failure is accepted. See the module documentation.
const L1_FINDINGS: &[(&str, &str)] = &[
    // Orekit requires ELEMENT_SET_NO in the TLE block (optional in 502.0-B-3 and the schema)
    ("M04.kvn", "ELEMENT_SET_NO has not been initialized"),
    // Orekit's XML parser refuses COMMENT in <userDefinedParameters> (the schema allows it)
    ("M05.xml", "unexpected keyword"),
    ("O06.xml", "unexpected keyword"),
    // TDB: Orekit adds relative OCM epochs as elapsed SI seconds, not TDB-calendar seconds
    ("C05.kvn", "epoch:"),
    ("C05.xml", "epoch:"),
];
const L2_FINDINGS: &[(&str, &str)] = &[
    // no Orekit-written file where Orekit could not parse Kshana's (L1 findings above)
    ("M04.kvn", "no Orekit-written file"),
    ("M05.xml", "no Orekit-written file"),
    ("O06.xml", "no Orekit-written file"),
    // Orekit's OMM writer requires BSTAR even when the TLE block carries BTERM (SGP4-XP)
    ("M02.kvn", "missing mandatory key BSTAR"),
    ("M02.xml", "missing mandatory key BSTAR"),
    // the same TDB relative-epoch convention, now in what Orekit writes
    ("C05.kvn", "epoch:"),
    ("C05.xml", "epoch:"),
    ("C05.kvn", "STOP_TIME:"),
    ("C05.xml", "STOP_TIME:"),
];

fn kshana_parse(case: &Case, text: &str) -> Result<Canon, String> {
    Ok(match case.msg {
        Msg::Opm(_) => canon(&Msg::Opm(OpmMessage::parse(text)?)),
        Msg::Omm(_) => canon(&Msg::Omm(OmmMessage::parse(text)?)),
        Msg::Ocm(_) => canon(&Msg::Ocm(OcmMessage::parse(text)?)),
    })
}

fn check_findings(fails: &[String], pinned: &[(&str, &str)], leg: &str) {
    let unexpected: Vec<&String> = fails
        .iter()
        .filter(|f| {
            !pinned
                .iter()
                .any(|(id, what)| f.contains(id) && f.contains(what))
        })
        .collect();
    assert!(unexpected.is_empty(), "{leg}: {unexpected:#?}");
    for (id, what) in pinned {
        assert!(
            fails.iter().any(|f| f.contains(id) && f.contains(what)),
            "{leg}: pinned finding {id} {what} no longer recurs"
        );
    }
}

#[test]
fn l1_orekit_reads_every_kshana_message() {
    let dump = read_dump(&dir().join("outputs/orekit_reads_kshana.txt"));
    let mut t = Tally::default();
    let mut files = 0;
    for c in cases() {
        let want = canon(&c.msg);
        for (name, _) in c.files() {
            let fmt = if name.ends_with(".xml") { "XML" } else { "KVN" };
            let Some(d) = dump.iter().find(|d| d.id == c.id && d.format == fmt) else {
                t.fails.push(format!("{name}: not in the Orekit dump"));
                continue;
            };
            files += 1;
            if let Some(e) = &d.parse_error {
                t.fails.push(format!("{name}: Orekit parse error: {e}"));
                continue;
            }
            compare(&want, &d.canon, &name, &mut t);
        }
    }
    eprintln!(
        "L1: {files} Kshana files read by Orekit, {} values, worst {:.3} of a bar",
        t.n, t.worst
    );
    check_findings(&t.fails, L1_FINDINGS, "L1");
    assert_eq!(files, 30);
}

#[test]
fn l2_kshana_reads_every_orekit_message() {
    let dump = read_dump(&dir().join("outputs/orekit_reads_kshana.txt"));
    let mut t = Tally::default();
    let mut files = 0;
    for c in cases() {
        let want = canon(&c.msg);
        for (name, _) in c.files() {
            let fmt = if name.ends_with(".xml") { "XML" } else { "KVN" };
            if let Some(e) = dump
                .iter()
                .find(|d| d.id == c.id && d.format == fmt)
                .and_then(|d| d.write_error.as_ref())
            {
                t.fails.push(format!("{name}: Orekit write error: {e}"));
                continue;
            }
            let p = dir().join("orekit").join(&name);
            let Ok(text) = std::fs::read_to_string(&p) else {
                t.fails.push(format!("{name}: no Orekit-written file"));
                continue;
            };
            files += 1;
            match kshana_parse(&c, &text) {
                Ok(got) => compare(&want, &got, &name, &mut t),
                Err(e) => t.fails.push(format!("{name}: Kshana parse error: {e}")),
            }
        }
    }
    eprintln!(
        "L2: {files} Orekit files read by Kshana, {} values, worst {:.3} of a bar",
        t.n, t.worst
    );
    check_findings(&t.fails, L2_FINDINGS, "L2");
}

/// Recorded, outside the verdict: Orekit's reading of the legacy `OmmFile::to_omm_kvn` output.
/// That writer puts `META_START`/`META_STOP` around the metadata, which the OMM KVN of
/// 502.0-B-2/B-3 does not define; Orekit stops at it. Pinned so a change is noticed.
#[test]
fn legacy_omm_kvn_is_refused_by_orekit() {
    let dump = read_dump(&dir().join("outputs/orekit_reads_legacy.txt"));
    assert_eq!(dump.len(), 1);
    let e = dump[0].parse_error.as_deref().unwrap_or("");
    assert!(e.contains("TIME_SYSTEM has not been initialized"), "{e}");
    assert!(iss().to_omm_kvn().contains("META_START\n"));
}
