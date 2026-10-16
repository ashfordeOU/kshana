// SPDX-License-Identifier: AGPL-3.0-only
//! CCSDS Attitude Data Messages (CCSDS 504.0-B-2, January 2024): the Attitude Ephemeris
//! Message (AEM) and the Attitude Parameter Message (APM), written and read in KVN
//! (keyword = value notation) and NDM/XML.
//!
//! * AEM version 2.0 (KVN and XML) and version 1.0 (KVN only; the 504.0-B-1 keywords
//!   `ATTITUDE_DIR`, `QUATERNION_TYPE`, `RATE_FRAME`, numeric rotation sequences and the
//!   `QUATERNION/RATE` and `EULER_ANGLE/RATE` types).
//! * APM version 2.0 (KVN and XML) with every block of the standard: quaternion (with
//!   derivative), Euler angles (with rates), angular velocity, spin (with nutation or momentum),
//!   inertia and maneuvers, each repeatable.
//!
//! The model mirrors the message: epochs are kept as the strings written, values in the message
//! units (deg, deg/s, s, 1/s, kg m^2, N m, kg). AEM record values are held in the canonical
//! order of 504.0-B-2 table 4-4 (`Q1 Q2 Q3 QC`, scalar last) whatever the version; a version-1.0
//! `QUATERNION_TYPE = FIRST` line is reordered on reading and writing. [`quaternion_a_to_b`]
//! gives the rotation a record describes (Annex F: F2 quaternion, F3 Euler angles, F5.2 spin
//! attitude at epoch).
//!
//! Checked against Orekit 13.1.8 in `tests/adm_orekit_oracle.rs`
//! (`xval/adm-orekit/PREREGISTRATION.md`).

use crate::ndm_xml::{self, Element};
use crate::portable_math::PortableFloat;

/// The header of an ADM.
#[derive(Clone, Debug, PartialEq)]
pub struct AdmHeader {
    /// Message version (`1.0` or `2.0`).
    pub version: String,
    /// Header comments.
    pub comments: Vec<String>,
    /// `CLASSIFICATION`.
    pub classification: Option<String>,
    /// `CREATION_DATE`.
    pub creation_date: String,
    /// `ORIGINATOR`.
    pub originator: String,
    /// `MESSAGE_ID`.
    pub message_id: Option<String>,
}

/// An AEM attitude type.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum AttitudeType {
    /// `QUATERNION`.
    Quaternion,
    /// `QUATERNION/DERIVATIVE`.
    QuaternionDerivative,
    /// `QUATERNION/ANGVEL` (2.0).
    QuaternionAngVel,
    /// `QUATERNION/RATE` (1.0).
    QuaternionRate,
    /// `EULER_ANGLE`.
    EulerAngle,
    /// `EULER_ANGLE/DERIVATIVE` (2.0).
    EulerAngleDerivative,
    /// `EULER_ANGLE/ANGVEL` (2.0).
    EulerAngleAngVel,
    /// `EULER_ANGLE/RATE` (1.0).
    EulerAngleRate,
    /// `SPIN`.
    Spin,
    /// `SPIN/NUTATION`.
    SpinNutation,
    /// `SPIN/NUTATION_MOM` (2.0).
    SpinNutationMom,
}

/// (XML group element, keys) of each value group of a record.
type Groups = &'static [(Option<&'static str>, &'static [&'static str])];

const Q: &[&str] = &["Q1", "Q2", "Q3", "QC"];
const QDOT: &[&str] = &["Q1_DOT", "Q2_DOT", "Q3_DOT", "QC_DOT"];
const ANGVEL: &[&str] = &["ANGVEL_X", "ANGVEL_Y", "ANGVEL_Z"];
const ANGLES: &[&str] = &["ANGLE_1", "ANGLE_2", "ANGLE_3"];
const ANGLE_DOTS: &[&str] = &["ANGLE_1_DOT", "ANGLE_2_DOT", "ANGLE_3_DOT"];
const SPIN: &[&str] = &["SPIN_ALPHA", "SPIN_DELTA", "SPIN_ANGLE", "SPIN_ANGLE_VEL"];
const NUT: &[&str] = &["NUTATION", "NUTATION_PER", "NUTATION_PHASE"];
const MOM: &[&str] = &["MOMENTUM_ALPHA", "MOMENTUM_DELTA", "NUTATION_VEL"];

impl AttitudeType {
    const ALL: [AttitudeType; 11] = [
        AttitudeType::Quaternion,
        AttitudeType::QuaternionDerivative,
        AttitudeType::QuaternionAngVel,
        AttitudeType::QuaternionRate,
        AttitudeType::EulerAngle,
        AttitudeType::EulerAngleDerivative,
        AttitudeType::EulerAngleAngVel,
        AttitudeType::EulerAngleRate,
        AttitudeType::Spin,
        AttitudeType::SpinNutation,
        AttitudeType::SpinNutationMom,
    ];

    /// The `ATTITUDE_TYPE` keyword value.
    pub fn keyword(&self) -> &'static str {
        match self {
            AttitudeType::Quaternion => "QUATERNION",
            AttitudeType::QuaternionDerivative => "QUATERNION/DERIVATIVE",
            AttitudeType::QuaternionAngVel => "QUATERNION/ANGVEL",
            AttitudeType::QuaternionRate => "QUATERNION/RATE",
            AttitudeType::EulerAngle => "EULER_ANGLE",
            AttitudeType::EulerAngleDerivative => "EULER_ANGLE/DERIVATIVE",
            AttitudeType::EulerAngleAngVel => "EULER_ANGLE/ANGVEL",
            AttitudeType::EulerAngleRate => "EULER_ANGLE/RATE",
            AttitudeType::Spin => "SPIN",
            AttitudeType::SpinNutation => "SPIN/NUTATION",
            AttitudeType::SpinNutationMom => "SPIN/NUTATION_MOM",
        }
    }

    /// Parse an `ATTITUDE_TYPE` value (case-insensitive).
    pub fn from_keyword(s: &str) -> Result<Self, String> {
        let u = s.trim().to_ascii_uppercase();
        Self::ALL
            .iter()
            .copied()
            .find(|t| t.keyword() == u)
            .ok_or_else(|| format!("unknown ATTITUDE_TYPE {s:?}"))
    }

    /// The XML element of a version-2.0 record and its value groups.
    fn xml(&self) -> Option<(&'static str, Groups)> {
        Some(match self {
            AttitudeType::Quaternion => ("quaternionEphemeris", &[(Some("quaternion"), Q)]),
            AttitudeType::QuaternionDerivative => (
                "quaternionDerivative",
                &[(Some("quaternion"), Q), (Some("quaternionDot"), QDOT)],
            ),
            AttitudeType::QuaternionAngVel => (
                "quaternionAngVel",
                &[(Some("quaternion"), Q), (Some("angVel"), ANGVEL)],
            ),
            AttitudeType::EulerAngle => ("eulerAngle", &[(None, ANGLES)]),
            AttitudeType::EulerAngleDerivative => (
                "eulerAngleDerivative",
                &[(None, ANGLES), (None, ANGLE_DOTS)],
            ),
            AttitudeType::EulerAngleAngVel => {
                ("eulerAngleAngVel", &[(None, ANGLES), (None, ANGVEL)])
            }
            AttitudeType::Spin => ("spin", &[(None, SPIN)]),
            AttitudeType::SpinNutation => ("spinNutation", &[(None, SPIN), (None, NUT)]),
            AttitudeType::SpinNutationMom => ("spinNutationMom", &[(None, SPIN), (None, MOM)]),
            AttitudeType::QuaternionRate | AttitudeType::EulerAngleRate => return None,
        })
    }

    /// Number of values in a record (epoch excluded).
    pub fn value_count(&self) -> usize {
        match self {
            AttitudeType::Quaternion => 4,
            AttitudeType::QuaternionDerivative => 8,
            AttitudeType::QuaternionAngVel | AttitudeType::QuaternionRate => 7,
            AttitudeType::EulerAngle => 3,
            AttitudeType::EulerAngleDerivative
            | AttitudeType::EulerAngleAngVel
            | AttitudeType::EulerAngleRate => 6,
            AttitudeType::Spin => 4,
            AttitudeType::SpinNutation | AttitudeType::SpinNutationMom => 7,
        }
    }

    fn is_quaternion(&self) -> bool {
        matches!(
            self,
            AttitudeType::Quaternion
                | AttitudeType::QuaternionDerivative
                | AttitudeType::QuaternionAngVel
                | AttitudeType::QuaternionRate
        )
    }

    fn version_ok(&self, v1: bool) -> bool {
        match self {
            AttitudeType::QuaternionAngVel
            | AttitudeType::EulerAngleDerivative
            | AttitudeType::EulerAngleAngVel
            | AttitudeType::SpinNutationMom => !v1,
            AttitudeType::QuaternionRate | AttitudeType::EulerAngleRate => v1,
            _ => true,
        }
    }
}

/// AEM segment metadata.
#[derive(Clone, Debug, PartialEq)]
pub struct AemMetadata {
    /// Metadata comments.
    pub comments: Vec<String>,
    /// `OBJECT_NAME`.
    pub object_name: String,
    /// `OBJECT_ID`.
    pub object_id: String,
    /// `CENTER_NAME`.
    pub center_name: Option<String>,
    /// `REF_FRAME_A`.
    pub ref_frame_a: String,
    /// `REF_FRAME_B`.
    pub ref_frame_b: String,
    /// `ATTITUDE_DIR` (`A2B` or `B2A`; version 1.0 only).
    pub attitude_dir: Option<String>,
    /// `TIME_SYSTEM`.
    pub time_system: String,
    /// `START_TIME`.
    pub start_time: String,
    /// `USEABLE_START_TIME`.
    pub useable_start_time: Option<String>,
    /// `USEABLE_STOP_TIME`.
    pub useable_stop_time: Option<String>,
    /// `STOP_TIME`.
    pub stop_time: String,
    /// `ATTITUDE_TYPE`.
    pub attitude_type: AttitudeType,
    /// `QUATERNION_TYPE` (`FIRST` or `LAST`; version 1.0 only).
    pub quaternion_type: Option<String>,
    /// `EULER_ROT_SEQ` (letters in 2.0, digits in 1.0).
    pub euler_rot_seq: Option<String>,
    /// `ANGVEL_FRAME` (2.0) or `RATE_FRAME` (1.0).
    pub angvel_frame: Option<String>,
    /// `INTERPOLATION_METHOD`.
    pub interpolation_method: Option<String>,
    /// `INTERPOLATION_DEGREE`.
    pub interpolation_degree: Option<u32>,
}

/// One AEM data line: the epoch as written and the values in canonical order.
#[derive(Clone, Debug, PartialEq)]
pub struct AemRecord {
    /// Epoch.
    pub epoch: String,
    /// Values (canonical order, message units).
    pub values: Vec<f64>,
}

/// One AEM segment.
#[derive(Clone, Debug, PartialEq)]
pub struct AemSegment {
    /// Metadata.
    pub metadata: AemMetadata,
    /// Comments at the start of the data section.
    pub data_comments: Vec<String>,
    /// Data lines.
    pub records: Vec<AemRecord>,
}

/// An Attitude Ephemeris Message.
#[derive(Clone, Debug, PartialEq)]
pub struct AemMessage {
    /// Header.
    pub header: AdmHeader,
    /// Segments.
    pub segments: Vec<AemSegment>,
}

/// Format a number in shortest round-trip form.
pub(crate) fn num(x: f64) -> String {
    format!("{x:?}")
}

pub(crate) fn kv(out: &mut String, k: &str, v: &str) {
    out.push_str(&format!("{k:<20} = {v}\n"));
}

pub(crate) fn comments(out: &mut String, c: &[String]) {
    for l in c {
        out.push_str(&format!("COMMENT {l}\n"));
    }
}

fn is_v1(version: &str) -> bool {
    version.trim().starts_with('1')
}

fn first_order(meta: &AemMetadata) -> bool {
    meta.quaternion_type
        .as_deref()
        .is_some_and(|q| q.eq_ignore_ascii_case("FIRST"))
}

/// Canonical value order to the order written on a line (version 1.0 `FIRST`: scalar first).
fn to_line_order(meta: &AemMetadata, v: &[f64]) -> Vec<f64> {
    if !(first_order(meta) && meta.attitude_type.is_quaternion()) {
        return v.to_vec();
    }
    let mut out = vec![v[3], v[0], v[1], v[2]];
    if meta.attitude_type == AttitudeType::QuaternionDerivative {
        out.extend([v[7], v[4], v[5], v[6]]);
    } else {
        out.extend_from_slice(&v[4..]);
    }
    out
}

fn from_line_order(meta: &AemMetadata, v: &[f64]) -> Vec<f64> {
    if !(first_order(meta) && meta.attitude_type.is_quaternion()) {
        return v.to_vec();
    }
    let mut out = vec![v[1], v[2], v[3], v[0]];
    if meta.attitude_type == AttitudeType::QuaternionDerivative {
        out.extend([v[5], v[6], v[7], v[4]]);
    } else {
        out.extend_from_slice(&v[4..]);
    }
    out
}

impl AemMessage {
    fn check(&self) -> Result<(), String> {
        let v1 = is_v1(&self.header.version);
        if self.segments.is_empty() {
            return Err("an AEM needs at least one segment".into());
        }
        for (i, s) in self.segments.iter().enumerate() {
            let t = s.metadata.attitude_type;
            if !t.version_ok(v1) {
                return Err(format!(
                    "segment {i}: {} is not a version {} attitude type",
                    t.keyword(),
                    self.header.version
                ));
            }
            for r in &s.records {
                if r.values.len() != t.value_count() {
                    return Err(format!(
                        "segment {i}: {} values for {}",
                        r.values.len(),
                        t.keyword()
                    ));
                }
            }
        }
        Ok(())
    }

    /// The message in KVN.
    pub fn to_kvn(&self) -> Result<String, String> {
        self.check()?;
        let v1 = is_v1(&self.header.version);
        let mut o = String::new();
        kv(&mut o, "CCSDS_AEM_VERS", &self.header.version);
        write_header_kvn(&mut o, &self.header);
        for s in &self.segments {
            let m = &s.metadata;
            o.push('\n');
            o.push_str("META_START\n");
            comments(&mut o, &m.comments);
            kv(&mut o, "OBJECT_NAME", &m.object_name);
            kv(&mut o, "OBJECT_ID", &m.object_id);
            if let Some(c) = &m.center_name {
                kv(&mut o, "CENTER_NAME", c);
            }
            kv(&mut o, "REF_FRAME_A", &m.ref_frame_a);
            kv(&mut o, "REF_FRAME_B", &m.ref_frame_b);
            if v1 {
                kv(
                    &mut o,
                    "ATTITUDE_DIR",
                    m.attitude_dir.as_deref().unwrap_or("A2B"),
                );
            }
            kv(&mut o, "TIME_SYSTEM", &m.time_system);
            kv(&mut o, "START_TIME", &m.start_time);
            if let Some(t) = &m.useable_start_time {
                kv(&mut o, "USEABLE_START_TIME", t);
            }
            if let Some(t) = &m.useable_stop_time {
                kv(&mut o, "USEABLE_STOP_TIME", t);
            }
            kv(&mut o, "STOP_TIME", &m.stop_time);
            kv(&mut o, "ATTITUDE_TYPE", m.attitude_type.keyword());
            if v1 && m.attitude_type.is_quaternion() {
                kv(
                    &mut o,
                    "QUATERNION_TYPE",
                    m.quaternion_type.as_deref().unwrap_or("LAST"),
                );
            }
            if let Some(q) = &m.euler_rot_seq {
                kv(&mut o, "EULER_ROT_SEQ", q);
            }
            if let Some(f) = &m.angvel_frame {
                kv(&mut o, if v1 { "RATE_FRAME" } else { "ANGVEL_FRAME" }, f);
            }
            if let Some(f) = &m.interpolation_method {
                kv(&mut o, "INTERPOLATION_METHOD", f);
            }
            if let Some(d) = m.interpolation_degree {
                kv(&mut o, "INTERPOLATION_DEGREE", &d.to_string());
            }
            o.push_str("META_STOP\n\nDATA_START\n");
            comments(&mut o, &s.data_comments);
            for r in &s.records {
                let line: Vec<String> = to_line_order(m, &r.values).into_iter().map(num).collect();
                o.push_str(&format!("{} {}\n", r.epoch, line.join(" ")));
            }
            o.push_str("DATA_STOP\n");
        }
        Ok(o)
    }

    /// The message in NDM/XML (version 2.0 only).
    pub fn to_xml(&self) -> Result<String, String> {
        self.check()?;
        if is_v1(&self.header.version) {
            return Err("AEM version 1.0 has no NDM/XML form here; write KVN".into());
        }
        let mut w = ndm_xml::Writer::new();
        w.open(
            "aem",
            &[("id", "CCSDS_AEM_VERS"), ("version", &self.header.version)],
        );
        write_header_xml(&mut w, &self.header);
        w.open("body", &[]);
        for s in &self.segments {
            let m = &s.metadata;
            w.open("segment", &[]);
            w.open("metadata", &[]);
            for c in &m.comments {
                w.leaf("COMMENT", c);
            }
            w.leaf("OBJECT_NAME", &m.object_name);
            w.leaf("OBJECT_ID", &m.object_id);
            if let Some(c) = &m.center_name {
                w.leaf("CENTER_NAME", c);
            }
            w.leaf("REF_FRAME_A", &m.ref_frame_a);
            w.leaf("REF_FRAME_B", &m.ref_frame_b);
            w.leaf("TIME_SYSTEM", &m.time_system);
            w.leaf("START_TIME", &m.start_time);
            if let Some(t) = &m.useable_start_time {
                w.leaf("USEABLE_START_TIME", t);
            }
            if let Some(t) = &m.useable_stop_time {
                w.leaf("USEABLE_STOP_TIME", t);
            }
            w.leaf("STOP_TIME", &m.stop_time);
            w.leaf("ATTITUDE_TYPE", m.attitude_type.keyword());
            if let Some(q) = &m.euler_rot_seq {
                w.leaf("EULER_ROT_SEQ", q);
            }
            if let Some(f) = &m.angvel_frame {
                w.leaf("ANGVEL_FRAME", f);
            }
            if let Some(f) = &m.interpolation_method {
                w.leaf("INTERPOLATION_METHOD", f);
            }
            if let Some(d) = m.interpolation_degree {
                w.leaf("INTERPOLATION_DEGREE", &d.to_string());
            }
            w.close("metadata");
            w.open("data", &[]);
            for c in &s.data_comments {
                w.leaf("COMMENT", c);
            }
            let (tag, groups) = m
                .attitude_type
                .xml()
                .ok_or("this attitude type has no version 2.0 form")?;
            for r in &s.records {
                w.open("attitudeState", &[]);
                w.open(tag, &[]);
                w.leaf("EPOCH", &r.epoch);
                let mut k = 0;
                for (group, keys) in groups {
                    if let Some(g) = group {
                        w.open(g, &[]);
                    }
                    for key in *keys {
                        w.leaf(key, &num(r.values[k]));
                        k += 1;
                    }
                    if let Some(g) = group {
                        w.close(g);
                    }
                }
                w.close(tag);
                w.close("attitudeState");
            }
            w.close("data");
            w.close("segment");
        }
        w.close("body");
        w.close("aem");
        Ok(w.finish())
    }

    /// Parse an AEM in KVN or NDM/XML (detected from the first character).
    pub fn parse(text: &str) -> Result<Self, String> {
        if text.trim_start().starts_with('<') {
            Self::parse_xml(text)
        } else {
            Self::parse_kvn(text)
        }
    }

    fn parse_kvn(text: &str) -> Result<Self, String> {
        let mut lines = kvn_lines(text);
        let (version, header) = read_header_kvn(&mut lines, "CCSDS_AEM_VERS")?;
        let v1 = is_v1(&version);
        let header = AdmHeader { version, ..header };
        let mut segments = Vec::new();
        while let Some(l) = lines.next() {
            if l != KvnLine::Bare("META_START".into()) {
                return Err(format!("expected META_START, found {l:?}"));
            }
            let mut f = Fields::default();
            loop {
                match lines.next().ok_or("META_START without META_STOP")? {
                    KvnLine::Bare(b) if b == "META_STOP" => break,
                    KvnLine::Comment(c) => f.comments.push(c),
                    KvnLine::Kv(k, v) => f.set(&k, v),
                    other => return Err(format!("unexpected metadata line {other:?}")),
                }
            }
            let att = AttitudeType::from_keyword(&f.req("ATTITUDE_TYPE")?)?;
            if !att.version_ok(v1) {
                return Err(format!(
                    "{} in a version {} AEM",
                    att.keyword(),
                    header.version
                ));
            }
            let metadata = AemMetadata {
                comments: std::mem::take(&mut f.comments),
                object_name: f.req("OBJECT_NAME")?,
                object_id: f.req("OBJECT_ID")?,
                center_name: f.opt("CENTER_NAME"),
                ref_frame_a: f.req("REF_FRAME_A")?,
                ref_frame_b: f.req("REF_FRAME_B")?,
                attitude_dir: f.opt("ATTITUDE_DIR"),
                time_system: f.req("TIME_SYSTEM")?,
                start_time: f.req("START_TIME")?,
                useable_start_time: f.opt("USEABLE_START_TIME"),
                useable_stop_time: f.opt("USEABLE_STOP_TIME"),
                stop_time: f.req("STOP_TIME")?,
                attitude_type: att,
                quaternion_type: f.opt("QUATERNION_TYPE"),
                euler_rot_seq: f.opt("EULER_ROT_SEQ"),
                angvel_frame: f.opt("ANGVEL_FRAME").or_else(|| f.opt("RATE_FRAME")),
                interpolation_method: f.opt("INTERPOLATION_METHOD"),
                interpolation_degree: f
                    .opt("INTERPOLATION_DEGREE")
                    .map(|d| {
                        d.parse()
                            .map_err(|e| format!("INTERPOLATION_DEGREE {d}: {e}"))
                    })
                    .transpose()?,
            };
            f.done()?;
            if lines.next() != Some(KvnLine::Bare("DATA_START".into())) {
                return Err("expected DATA_START after META_STOP".into());
            }
            let mut data_comments = Vec::new();
            let mut records = Vec::new();
            loop {
                match lines.next().ok_or("DATA_START without DATA_STOP")? {
                    KvnLine::Bare(b) if b == "DATA_STOP" => break,
                    KvnLine::Comment(c) => data_comments.push(c),
                    KvnLine::Bare(b) => {
                        let mut it = b.split_whitespace();
                        let epoch = it.next().ok_or("empty data line")?.to_string();
                        let vals: Vec<f64> = it
                            .map(|x| x.parse::<f64>().map_err(|e| format!("{x:?}: {e}")))
                            .collect::<Result<_, _>>()?;
                        if vals.len() != att.value_count() {
                            return Err(format!(
                                "{} values on a {} line: {b}",
                                vals.len(),
                                att.keyword()
                            ));
                        }
                        records.push(AemRecord {
                            epoch,
                            values: from_line_order(&metadata, &vals),
                        });
                    }
                    other => return Err(format!("unexpected data line {other:?}")),
                }
            }
            segments.push(AemSegment {
                metadata,
                data_comments,
                records,
            });
        }
        let m = AemMessage { header, segments };
        m.check()?;
        Ok(m)
    }

    fn parse_xml(text: &str) -> Result<Self, String> {
        let root = ndm_xml::parse(text)?;
        let root = unwrap_ndm(&root, "aem")?;
        let header = read_header_xml(root)?;
        let body = root.child("body").ok_or("no <body>")?;
        let mut segments = Vec::new();
        for seg in body.children_named("segment") {
            let md = seg.child("metadata").ok_or("no <metadata>")?;
            let t = |k: &str| md.child_text(k).map(str::to_string);
            let req = |k: &str| t(k).ok_or_else(|| format!("no <{k}>"));
            let att = AttitudeType::from_keyword(&req("ATTITUDE_TYPE")?)?;
            let metadata = AemMetadata {
                comments: md
                    .children_named("COMMENT")
                    .map(|c| c.text.clone())
                    .collect(),
                object_name: req("OBJECT_NAME")?,
                object_id: req("OBJECT_ID")?,
                center_name: t("CENTER_NAME"),
                ref_frame_a: req("REF_FRAME_A")?,
                ref_frame_b: req("REF_FRAME_B")?,
                attitude_dir: None,
                time_system: req("TIME_SYSTEM")?,
                start_time: req("START_TIME")?,
                useable_start_time: t("USEABLE_START_TIME"),
                useable_stop_time: t("USEABLE_STOP_TIME"),
                stop_time: req("STOP_TIME")?,
                attitude_type: att,
                quaternion_type: None,
                euler_rot_seq: t("EULER_ROT_SEQ"),
                angvel_frame: t("ANGVEL_FRAME"),
                interpolation_method: t("INTERPOLATION_METHOD"),
                interpolation_degree: t("INTERPOLATION_DEGREE")
                    .map(|d| {
                        d.parse()
                            .map_err(|e| format!("INTERPOLATION_DEGREE {d}: {e}"))
                    })
                    .transpose()?,
            };
            let data = seg.child("data").ok_or("no <data>")?;
            let (tag, groups) = att.xml().ok_or("attitude type has no XML form")?;
            let mut records = Vec::new();
            for st in data.children_named("attitudeState") {
                let rec = st
                    .child(tag)
                    .ok_or_else(|| format!("<attitudeState> without <{tag}>"))?;
                let epoch = rec.child_text("EPOCH").ok_or("record without <EPOCH>")?;
                let mut values = Vec::new();
                for (group, keys) in groups {
                    let parent = match group {
                        Some(g) => rec.child(g).ok_or_else(|| format!("no <{g}>"))?,
                        None => rec,
                    };
                    for k in *keys {
                        values.push(xml_num(parent, k)?);
                    }
                }
                records.push(AemRecord {
                    epoch: epoch.to_string(),
                    values,
                });
            }
            segments.push(AemSegment {
                metadata,
                data_comments: data
                    .children_named("COMMENT")
                    .map(|c| c.text.clone())
                    .collect(),
                records,
            });
        }
        let m = AemMessage { header, segments };
        m.check()?;
        Ok(m)
    }
}

fn xml_num(parent: &Element, key: &str) -> Result<f64, String> {
    let t = parent
        .child_text(key)
        .ok_or_else(|| format!("no <{key}> in <{}>", parent.name))?;
    t.parse::<f64>().map_err(|e| format!("<{key}> {t:?}: {e}"))
}

/// Accept `<ndm>` wrapping a single message of the given kind, or the message itself.
pub(crate) fn unwrap_ndm<'a>(root: &'a Element, kind: &str) -> Result<&'a Element, String> {
    if root.name == kind {
        Ok(root)
    } else if root.name == "ndm" {
        root.child(kind)
            .ok_or_else(|| format!("<ndm> holds no <{kind}>"))
    } else {
        Err(format!("root element <{}> is not <{kind}>", root.name))
    }
}

pub(crate) fn write_header_kvn(o: &mut String, h: &AdmHeader) {
    comments(o, &h.comments);
    if let Some(c) = &h.classification {
        kv(o, "CLASSIFICATION", c);
    }
    kv(o, "CREATION_DATE", &h.creation_date);
    kv(o, "ORIGINATOR", &h.originator);
    if let Some(m) = &h.message_id {
        kv(o, "MESSAGE_ID", m);
    }
}

pub(crate) fn write_header_xml(w: &mut ndm_xml::Writer, h: &AdmHeader) {
    w.open("header", &[]);
    for c in &h.comments {
        w.leaf("COMMENT", c);
    }
    if let Some(c) = &h.classification {
        w.leaf("CLASSIFICATION", c);
    }
    w.leaf("CREATION_DATE", &h.creation_date);
    w.leaf("ORIGINATOR", &h.originator);
    if let Some(m) = &h.message_id {
        w.leaf("MESSAGE_ID", m);
    }
    w.close("header");
}

pub(crate) fn read_header_xml(root: &Element) -> Result<AdmHeader, String> {
    let version = root
        .attr("version")
        .ok_or("message without a version attribute")?
        .to_string();
    let h = root.child("header").ok_or("no <header>")?;
    Ok(AdmHeader {
        version,
        comments: h
            .children_named("COMMENT")
            .map(|c| c.text.clone())
            .collect(),
        classification: h.child_text("CLASSIFICATION").map(str::to_string),
        creation_date: h
            .child_text("CREATION_DATE")
            .ok_or("no <CREATION_DATE>")?
            .to_string(),
        originator: h
            .child_text("ORIGINATOR")
            .ok_or("no <ORIGINATOR>")?
            .to_string(),
        message_id: h.child_text("MESSAGE_ID").map(str::to_string),
    })
}

/// One logical KVN line.
#[derive(Clone, Debug, PartialEq)]
pub(crate) enum KvnLine {
    Comment(String),
    Kv(String, String),
    Bare(String),
}

/// Split KVN text into logical lines: `COMMENT text`, `KEY = value` (units in square brackets
/// removed) and bare lines (block markers and data lines). Blank lines are dropped.
pub(crate) fn kvn_lines(text: &str) -> std::iter::Peekable<std::vec::IntoIter<KvnLine>> {
    let mut v = Vec::new();
    for raw in text.lines() {
        let l = raw.trim();
        if l.is_empty() {
            continue;
        }
        if let Some(c) = l.strip_prefix("COMMENT") {
            if c.is_empty() || c.starts_with(char::is_whitespace) {
                v.push(KvnLine::Comment(c.trim().to_string()));
                continue;
            }
        }
        match l.split_once('=') {
            Some((k, val)) if !k.trim().contains(char::is_whitespace) => {
                let mut val = val.trim();
                if val.ends_with(']') {
                    if let Some(i) = val.rfind('[') {
                        val = val[..i].trim_end();
                    }
                }
                v.push(KvnLine::Kv(k.trim().to_ascii_uppercase(), val.to_string()));
            }
            _ => v.push(KvnLine::Bare(l.to_string())),
        }
    }
    v.into_iter().peekable()
}

pub(crate) type Lines = std::iter::Peekable<std::vec::IntoIter<KvnLine>>;

/// Read `<VERS_KEY> = v`, then header comments and keys up to the first line that is not a
/// header key (left unread).
pub(crate) fn read_header_kvn(
    lines: &mut Lines,
    vers_key: &str,
) -> Result<(String, AdmHeader), String> {
    let version = match lines.next() {
        Some(KvnLine::Kv(k, v)) if k == vers_key => v,
        other => return Err(format!("expected {vers_key}, found {other:?}")),
    };
    let mut h = AdmHeader {
        version: version.clone(),
        comments: vec![],
        classification: None,
        creation_date: String::new(),
        originator: String::new(),
        message_id: None,
    };
    let mut seen_key = false;
    while let Some(l) = lines.peek() {
        match l {
            KvnLine::Comment(c) if !seen_key => h.comments.push(c.clone()),
            KvnLine::Kv(k, v) => match k.as_str() {
                "CLASSIFICATION" => h.classification = Some(v.clone()),
                "CREATION_DATE" => h.creation_date = v.clone(),
                "ORIGINATOR" => h.originator = v.clone(),
                "MESSAGE_ID" => h.message_id = Some(v.clone()),
                _ => break,
            },
            _ => break,
        }
        if matches!(l, KvnLine::Kv(..)) {
            seen_key = true;
        }
        lines.next();
    }
    if h.creation_date.is_empty() || h.originator.is_empty() {
        return Err("header without CREATION_DATE or ORIGINATOR".into());
    }
    Ok((version, h))
}

/// Keyword values collected for one section, consumed by name.
#[derive(Default)]
struct Fields {
    comments: Vec<String>,
    kv: Vec<(String, String)>,
}

impl Fields {
    fn set(&mut self, k: &str, v: String) {
        self.kv.push((k.to_string(), v));
    }
    fn opt(&mut self, k: &str) -> Option<String> {
        let i = self.kv.iter().position(|(kk, _)| kk == k)?;
        Some(self.kv.remove(i).1)
    }
    fn req(&mut self, k: &str) -> Result<String, String> {
        self.opt(k).ok_or_else(|| format!("missing {k}"))
    }
    fn num(&mut self, k: &str) -> Result<f64, String> {
        let v = self.req(k)?;
        v.parse::<f64>().map_err(|e| format!("{k} = {v:?}: {e}"))
    }
    fn opt_num(&mut self, k: &str) -> Result<Option<f64>, String> {
        self.opt(k)
            .map(|v| v.parse::<f64>().map_err(|e| format!("{k} = {v:?}: {e}")))
            .transpose()
    }
    fn done(&self) -> Result<(), String> {
        match self.kv.first() {
            Some((k, _)) => Err(format!("unexpected keyword {k}")),
            None => Ok(()),
        }
    }
}

// -------------------------------------------------------------------------------------------
// APM

/// APM metadata.
#[derive(Clone, Debug, PartialEq)]
pub struct ApmMetadata {
    /// Comments.
    pub comments: Vec<String>,
    /// `OBJECT_NAME`.
    pub object_name: String,
    /// `OBJECT_ID`.
    pub object_id: String,
    /// `CENTER_NAME`.
    pub center_name: Option<String>,
    /// `TIME_SYSTEM`.
    pub time_system: String,
}

/// APM quaternion block.
#[derive(Clone, Debug, PartialEq)]
pub struct ApmQuaternion {
    /// Comments.
    pub comments: Vec<String>,
    /// `REF_FRAME_A`.
    pub ref_frame_a: String,
    /// `REF_FRAME_B`.
    pub ref_frame_b: String,
    /// `Q1 Q2 Q3 QC`.
    pub q: [f64; 4],
    /// `Q1_DOT Q2_DOT Q3_DOT QC_DOT`, 1/s.
    pub q_dot: Option<[f64; 4]>,
}

/// APM Euler angle block.
#[derive(Clone, Debug, PartialEq)]
pub struct ApmEuler {
    /// Comments.
    pub comments: Vec<String>,
    /// `REF_FRAME_A`.
    pub ref_frame_a: String,
    /// `REF_FRAME_B`.
    pub ref_frame_b: String,
    /// `EULER_ROT_SEQ`.
    pub rot_seq: String,
    /// `ANGLE_1..3`, deg.
    pub angles: [f64; 3],
    /// `ANGLE_1_DOT..3`, deg/s.
    pub rates: Option<[f64; 3]>,
}

/// APM angular velocity block.
#[derive(Clone, Debug, PartialEq)]
pub struct ApmAngVel {
    /// Comments.
    pub comments: Vec<String>,
    /// `REF_FRAME_A`.
    pub ref_frame_a: String,
    /// `REF_FRAME_B`.
    pub ref_frame_b: String,
    /// `ANGVEL_FRAME`.
    pub angvel_frame: String,
    /// `ANGVEL_X Y Z`, deg/s.
    pub xyz: [f64; 3],
}

/// APM spin block.
#[derive(Clone, Debug, PartialEq)]
pub struct ApmSpin {
    /// Comments.
    pub comments: Vec<String>,
    /// `REF_FRAME_A`.
    pub ref_frame_a: String,
    /// `REF_FRAME_B`.
    pub ref_frame_b: String,
    /// `SPIN_ALPHA SPIN_DELTA SPIN_ANGLE` (deg) and `SPIN_ANGLE_VEL` (deg/s).
    pub values: [f64; 4],
    /// `NUTATION` (deg), `NUTATION_PER` (s), `NUTATION_PHASE` (deg).
    pub nutation: Option<[f64; 3]>,
    /// `MOMENTUM_ALPHA`, `MOMENTUM_DELTA` (deg), `NUTATION_VEL` (deg/s).
    pub momentum: Option<[f64; 3]>,
}

/// APM inertia block.
#[derive(Clone, Debug, PartialEq)]
pub struct ApmInertia {
    /// Comments.
    pub comments: Vec<String>,
    /// `INERTIA_REF_FRAME`.
    pub ref_frame: String,
    /// `IXX IYY IZZ IXY IXZ IYZ`, kg m^2.
    pub values: [f64; 6],
}

/// APM maneuver block.
#[derive(Clone, Debug, PartialEq)]
pub struct ApmManeuver {
    /// Comments.
    pub comments: Vec<String>,
    /// `MAN_EPOCH_START`.
    pub epoch_start: String,
    /// `MAN_DURATION`, s.
    pub duration: f64,
    /// `MAN_REF_FRAME`.
    pub ref_frame: String,
    /// `MAN_TOR_X Y Z`, N m.
    pub torque: [f64; 3],
    /// `MAN_DELTA_MASS`, kg (negative).
    pub delta_mass: Option<f64>,
}

/// An Attitude Parameter Message (version 2.0).
#[derive(Clone, Debug, PartialEq)]
pub struct ApmMessage {
    /// Header.
    pub header: AdmHeader,
    /// Metadata.
    pub metadata: ApmMetadata,
    /// Data comments (before `EPOCH`).
    pub data_comments: Vec<String>,
    /// `EPOCH`.
    pub epoch: String,
    /// Quaternion blocks.
    pub quaternions: Vec<ApmQuaternion>,
    /// Euler angle blocks.
    pub eulers: Vec<ApmEuler>,
    /// Angular velocity blocks.
    pub angvels: Vec<ApmAngVel>,
    /// Spin blocks.
    pub spins: Vec<ApmSpin>,
    /// Inertia blocks.
    pub inertias: Vec<ApmInertia>,
    /// Maneuver blocks.
    pub maneuvers: Vec<ApmManeuver>,
}

const MAN_TOR: &[&str] = &["MAN_TOR_X", "MAN_TOR_Y", "MAN_TOR_Z"];
const INERTIA: &[&str] = &["IXX", "IYY", "IZZ", "IXY", "IXZ", "IYZ"];

fn kv_nums(o: &mut String, keys: &[&str], v: &[f64]) {
    for (k, x) in keys.iter().zip(v) {
        kv(o, k, &num(*x));
    }
}

fn xml_nums(w: &mut ndm_xml::Writer, keys: &[&str], v: &[f64]) {
    for (k, x) in keys.iter().zip(v) {
        w.leaf(k, &num(*x));
    }
}

impl ApmMessage {
    /// The message in KVN.
    pub fn to_kvn(&self) -> Result<String, String> {
        let mut o = String::new();
        kv(&mut o, "CCSDS_APM_VERS", &self.header.version);
        write_header_kvn(&mut o, &self.header);
        o.push('\n');
        let m = &self.metadata;
        comments(&mut o, &m.comments);
        kv(&mut o, "OBJECT_NAME", &m.object_name);
        kv(&mut o, "OBJECT_ID", &m.object_id);
        if let Some(c) = &m.center_name {
            kv(&mut o, "CENTER_NAME", c);
        }
        kv(&mut o, "TIME_SYSTEM", &m.time_system);
        o.push('\n');
        comments(&mut o, &self.data_comments);
        kv(&mut o, "EPOCH", &self.epoch);
        for b in &self.quaternions {
            o.push_str("\nQUAT_START\n");
            comments(&mut o, &b.comments);
            kv(&mut o, "REF_FRAME_A", &b.ref_frame_a);
            kv(&mut o, "REF_FRAME_B", &b.ref_frame_b);
            kv_nums(&mut o, Q, &b.q);
            if let Some(d) = &b.q_dot {
                kv_nums(&mut o, QDOT, d);
            }
            o.push_str("QUAT_STOP\n");
        }
        for b in &self.eulers {
            o.push_str("\nEULER_START\n");
            comments(&mut o, &b.comments);
            kv(&mut o, "REF_FRAME_A", &b.ref_frame_a);
            kv(&mut o, "REF_FRAME_B", &b.ref_frame_b);
            kv(&mut o, "EULER_ROT_SEQ", &b.rot_seq);
            kv_nums(&mut o, ANGLES, &b.angles);
            if let Some(r) = &b.rates {
                kv_nums(&mut o, ANGLE_DOTS, r);
            }
            o.push_str("EULER_STOP\n");
        }
        for b in &self.angvels {
            o.push_str("\nANGVEL_START\n");
            comments(&mut o, &b.comments);
            kv(&mut o, "REF_FRAME_A", &b.ref_frame_a);
            kv(&mut o, "REF_FRAME_B", &b.ref_frame_b);
            kv(&mut o, "ANGVEL_FRAME", &b.angvel_frame);
            kv_nums(&mut o, ANGVEL, &b.xyz);
            o.push_str("ANGVEL_STOP\n");
        }
        for b in &self.spins {
            if b.nutation.is_some() && b.momentum.is_some() {
                return Err("a spin block holds nutation or momentum data, not both".into());
            }
            o.push_str("\nSPIN_START\n");
            comments(&mut o, &b.comments);
            kv(&mut o, "REF_FRAME_A", &b.ref_frame_a);
            kv(&mut o, "REF_FRAME_B", &b.ref_frame_b);
            kv_nums(&mut o, SPIN, &b.values);
            if let Some(n) = &b.nutation {
                kv_nums(&mut o, NUT, n);
            }
            if let Some(n) = &b.momentum {
                kv_nums(&mut o, MOM, n);
            }
            o.push_str("SPIN_STOP\n");
        }
        for b in &self.inertias {
            o.push_str("\nINERTIA_START\n");
            comments(&mut o, &b.comments);
            kv(&mut o, "INERTIA_REF_FRAME", &b.ref_frame);
            kv_nums(&mut o, INERTIA, &b.values);
            o.push_str("INERTIA_STOP\n");
        }
        for b in &self.maneuvers {
            o.push_str("\nMAN_START\n");
            comments(&mut o, &b.comments);
            kv(&mut o, "MAN_EPOCH_START", &b.epoch_start);
            kv(&mut o, "MAN_DURATION", &num(b.duration));
            kv(&mut o, "MAN_REF_FRAME", &b.ref_frame);
            kv_nums(&mut o, MAN_TOR, &b.torque);
            if let Some(d) = b.delta_mass {
                kv(&mut o, "MAN_DELTA_MASS", &num(d));
            }
            o.push_str("MAN_STOP\n");
        }
        Ok(o)
    }

    /// The message in NDM/XML.
    pub fn to_xml(&self) -> Result<String, String> {
        let mut w = ndm_xml::Writer::new();
        w.open(
            "apm",
            &[("id", "CCSDS_APM_VERS"), ("version", &self.header.version)],
        );
        write_header_xml(&mut w, &self.header);
        w.open("body", &[]);
        w.open("segment", &[]);
        w.open("metadata", &[]);
        let m = &self.metadata;
        for c in &m.comments {
            w.leaf("COMMENT", c);
        }
        w.leaf("OBJECT_NAME", &m.object_name);
        w.leaf("OBJECT_ID", &m.object_id);
        if let Some(c) = &m.center_name {
            w.leaf("CENTER_NAME", c);
        }
        w.leaf("TIME_SYSTEM", &m.time_system);
        w.close("metadata");
        w.open("data", &[]);
        for c in &self.data_comments {
            w.leaf("COMMENT", c);
        }
        w.leaf("EPOCH", &self.epoch);
        let frames = |w: &mut ndm_xml::Writer, c: &[String], a: &str, b: &str| {
            for l in c {
                w.leaf("COMMENT", l);
            }
            w.leaf("REF_FRAME_A", a);
            w.leaf("REF_FRAME_B", b);
        };
        for b in &self.quaternions {
            w.open("quaternionState", &[]);
            frames(&mut w, &b.comments, &b.ref_frame_a, &b.ref_frame_b);
            w.open("quaternion", &[]);
            xml_nums(&mut w, Q, &b.q);
            w.close("quaternion");
            if let Some(d) = &b.q_dot {
                w.open("quaternionDot", &[]);
                xml_nums(&mut w, QDOT, d);
                w.close("quaternionDot");
            }
            w.close("quaternionState");
        }
        for b in &self.eulers {
            w.open("eulerAngleState", &[]);
            frames(&mut w, &b.comments, &b.ref_frame_a, &b.ref_frame_b);
            w.leaf("EULER_ROT_SEQ", &b.rot_seq);
            xml_nums(&mut w, ANGLES, &b.angles);
            if let Some(r) = &b.rates {
                xml_nums(&mut w, ANGLE_DOTS, r);
            }
            w.close("eulerAngleState");
        }
        for b in &self.angvels {
            w.open("angularVelocity", &[]);
            frames(&mut w, &b.comments, &b.ref_frame_a, &b.ref_frame_b);
            w.leaf("ANGVEL_FRAME", &b.angvel_frame);
            xml_nums(&mut w, ANGVEL, &b.xyz);
            w.close("angularVelocity");
        }
        for b in &self.spins {
            if b.nutation.is_some() && b.momentum.is_some() {
                return Err("a spin block holds nutation or momentum data, not both".into());
            }
            w.open("spin", &[]);
            frames(&mut w, &b.comments, &b.ref_frame_a, &b.ref_frame_b);
            xml_nums(&mut w, SPIN, &b.values);
            if let Some(n) = &b.nutation {
                xml_nums(&mut w, NUT, n);
            }
            if let Some(n) = &b.momentum {
                xml_nums(&mut w, MOM, n);
            }
            w.close("spin");
        }
        for b in &self.inertias {
            w.open("inertia", &[]);
            for l in &b.comments {
                w.leaf("COMMENT", l);
            }
            w.leaf("INERTIA_REF_FRAME", &b.ref_frame);
            xml_nums(&mut w, INERTIA, &b.values);
            w.close("inertia");
        }
        for b in &self.maneuvers {
            w.open("maneuverParameters", &[]);
            for l in &b.comments {
                w.leaf("COMMENT", l);
            }
            w.leaf("MAN_EPOCH_START", &b.epoch_start);
            w.leaf("MAN_DURATION", &num(b.duration));
            w.leaf("MAN_REF_FRAME", &b.ref_frame);
            xml_nums(&mut w, MAN_TOR, &b.torque);
            if let Some(d) = b.delta_mass {
                w.leaf("MAN_DELTA_MASS", &num(d));
            }
            w.close("maneuverParameters");
        }
        w.close("data");
        w.close("segment");
        w.close("body");
        w.close("apm");
        Ok(w.finish())
    }

    /// Parse an APM in KVN or NDM/XML.
    pub fn parse(text: &str) -> Result<Self, String> {
        if text.trim_start().starts_with('<') {
            Self::parse_xml(text)
        } else {
            Self::parse_kvn(text)
        }
    }

    fn empty(header: AdmHeader) -> Self {
        ApmMessage {
            header,
            metadata: ApmMetadata {
                comments: vec![],
                object_name: String::new(),
                object_id: String::new(),
                center_name: None,
                time_system: String::new(),
            },
            data_comments: vec![],
            epoch: String::new(),
            quaternions: vec![],
            eulers: vec![],
            angvels: vec![],
            spins: vec![],
            inertias: vec![],
            maneuvers: vec![],
        }
    }

    fn parse_kvn(text: &str) -> Result<Self, String> {
        let mut lines = kvn_lines(text);
        let (_, header) = read_header_kvn(&mut lines, "CCSDS_APM_VERS")?;
        let mut m = Self::empty(header);
        // Comments before OBJECT_NAME are metadata comments; after TIME_SYSTEM and before
        // EPOCH, data comments.
        let mut past_meta = false;
        while let Some(l) = lines.next() {
            match l {
                KvnLine::Comment(c) => {
                    if past_meta {
                        m.data_comments.push(c)
                    } else {
                        m.metadata.comments.push(c)
                    }
                }
                KvnLine::Kv(k, v) => match k.as_str() {
                    "OBJECT_NAME" => m.metadata.object_name = v,
                    "OBJECT_ID" => m.metadata.object_id = v,
                    "CENTER_NAME" => m.metadata.center_name = Some(v),
                    "TIME_SYSTEM" => {
                        m.metadata.time_system = v;
                        past_meta = true;
                    }
                    "EPOCH" => m.epoch = v,
                    other => return Err(format!("unexpected APM keyword {other}")),
                },
                KvnLine::Bare(b) => {
                    let name = b
                        .strip_suffix("_START")
                        .ok_or_else(|| format!("unexpected APM line {b:?}"))?
                        .to_string();
                    let stop = format!("{name}_STOP");
                    let mut f = Fields::default();
                    loop {
                        match lines.next().ok_or_else(|| format!("{b} without {stop}"))? {
                            KvnLine::Bare(s) if s == stop => break,
                            KvnLine::Comment(c) => f.comments.push(c),
                            KvnLine::Kv(k, v) => f.set(&k, v),
                            other => return Err(format!("unexpected line in {b}: {other:?}")),
                        }
                    }
                    m.add_block(&name, &mut f)?;
                    f.done().map_err(|e| format!("{b}: {e}"))?;
                }
            }
        }
        m.check()?;
        Ok(m)
    }

    fn add_block(&mut self, name: &str, f: &mut Fields) -> Result<(), String> {
        let comments = std::mem::take(&mut f.comments);
        let arr = |f: &mut Fields, keys: &[&str]| -> Result<Vec<f64>, String> {
            keys.iter().map(|k| f.num(k)).collect()
        };
        let opt_arr = |f: &mut Fields, keys: &[&str]| -> Result<Option<Vec<f64>>, String> {
            let v: Vec<Option<f64>> = keys
                .iter()
                .map(|k| f.opt_num(k))
                .collect::<Result<_, _>>()?;
            if v.iter().all(Option::is_none) {
                Ok(None)
            } else if v.iter().all(Option::is_some) {
                Ok(Some(v.into_iter().flatten().collect()))
            } else {
                Err(format!("incomplete group {keys:?}"))
            }
        };
        match name {
            "QUAT" => self.quaternions.push(ApmQuaternion {
                comments,
                ref_frame_a: f.req("REF_FRAME_A")?,
                ref_frame_b: f.req("REF_FRAME_B")?,
                q: arr(f, Q)?.try_into().expect("4"),
                q_dot: opt_arr(f, QDOT)?.map(|v| v.try_into().expect("4")),
            }),
            "EULER" => self.eulers.push(ApmEuler {
                comments,
                ref_frame_a: f.req("REF_FRAME_A")?,
                ref_frame_b: f.req("REF_FRAME_B")?,
                rot_seq: f.req("EULER_ROT_SEQ")?,
                angles: arr(f, ANGLES)?.try_into().expect("3"),
                rates: opt_arr(f, ANGLE_DOTS)?.map(|v| v.try_into().expect("3")),
            }),
            "ANGVEL" => self.angvels.push(ApmAngVel {
                comments,
                ref_frame_a: f.req("REF_FRAME_A")?,
                ref_frame_b: f.req("REF_FRAME_B")?,
                angvel_frame: f.req("ANGVEL_FRAME")?,
                xyz: arr(f, ANGVEL)?.try_into().expect("3"),
            }),
            "SPIN" => self.spins.push(ApmSpin {
                comments,
                ref_frame_a: f.req("REF_FRAME_A")?,
                ref_frame_b: f.req("REF_FRAME_B")?,
                values: arr(f, SPIN)?.try_into().expect("4"),
                nutation: opt_arr(f, NUT)?.map(|v| v.try_into().expect("3")),
                momentum: opt_arr(f, MOM)?.map(|v| v.try_into().expect("3")),
            }),
            "INERTIA" => self.inertias.push(ApmInertia {
                comments,
                ref_frame: f.req("INERTIA_REF_FRAME")?,
                values: arr(f, INERTIA)?.try_into().expect("6"),
            }),
            "MAN" => self.maneuvers.push(ApmManeuver {
                comments,
                epoch_start: f.req("MAN_EPOCH_START")?,
                duration: f.num("MAN_DURATION")?,
                ref_frame: f.req("MAN_REF_FRAME")?,
                torque: arr(f, MAN_TOR)?.try_into().expect("3"),
                delta_mass: f.opt_num("MAN_DELTA_MASS")?,
            }),
            other => return Err(format!("unknown APM block {other}_START")),
        }
        Ok(())
    }

    fn parse_xml(text: &str) -> Result<Self, String> {
        let root = ndm_xml::parse(text)?;
        let root = unwrap_ndm(&root, "apm")?;
        let mut m = Self::empty(read_header_xml(root)?);
        let seg = root
            .child("body")
            .and_then(|b| b.child("segment"))
            .ok_or("no <body><segment>")?;
        let md = seg.child("metadata").ok_or("no <metadata>")?;
        let req = |e: &Element, k: &str| -> Result<String, String> {
            e.child_text(k)
                .map(str::to_string)
                .ok_or_else(|| format!("no <{k}> in <{}>", e.name))
        };
        let coms = |e: &Element| -> Vec<String> {
            e.children_named("COMMENT")
                .map(|c| c.text.clone())
                .collect()
        };
        m.metadata = ApmMetadata {
            comments: coms(md),
            object_name: req(md, "OBJECT_NAME")?,
            object_id: req(md, "OBJECT_ID")?,
            center_name: md.child_text("CENTER_NAME").map(str::to_string),
            time_system: req(md, "TIME_SYSTEM")?,
        };
        let data = seg.child("data").ok_or("no <data>")?;
        m.data_comments = coms(data);
        m.epoch = req(data, "EPOCH")?;
        let nums = |e: &Element, keys: &[&str]| -> Result<Vec<f64>, String> {
            keys.iter().map(|k| xml_num(e, k)).collect()
        };
        let opt_nums = |e: &Element, keys: &[&str]| -> Result<Option<Vec<f64>>, String> {
            if e.child(keys[0]).is_some() {
                nums(e, keys).map(Some)
            } else {
                Ok(None)
            }
        };
        for b in data.children_named("quaternionState") {
            let q = b.child("quaternion").ok_or("no <quaternion>")?;
            m.quaternions.push(ApmQuaternion {
                comments: coms(b),
                ref_frame_a: req(b, "REF_FRAME_A")?,
                ref_frame_b: req(b, "REF_FRAME_B")?,
                q: nums(q, Q)?.try_into().expect("4"),
                q_dot: b
                    .child("quaternionDot")
                    .map(|d| nums(d, QDOT).map(|v| v.try_into().expect("4")))
                    .transpose()?,
            });
        }
        for b in data.children_named("eulerAngleState") {
            m.eulers.push(ApmEuler {
                comments: coms(b),
                ref_frame_a: req(b, "REF_FRAME_A")?,
                ref_frame_b: req(b, "REF_FRAME_B")?,
                rot_seq: req(b, "EULER_ROT_SEQ")?,
                angles: nums(b, ANGLES)?.try_into().expect("3"),
                rates: opt_nums(b, ANGLE_DOTS)?.map(|v| v.try_into().expect("3")),
            });
        }
        for b in data.children_named("angularVelocity") {
            m.angvels.push(ApmAngVel {
                comments: coms(b),
                ref_frame_a: req(b, "REF_FRAME_A")?,
                ref_frame_b: req(b, "REF_FRAME_B")?,
                angvel_frame: req(b, "ANGVEL_FRAME")?,
                xyz: nums(b, ANGVEL)?.try_into().expect("3"),
            });
        }
        for b in data.children_named("spin") {
            m.spins.push(ApmSpin {
                comments: coms(b),
                ref_frame_a: req(b, "REF_FRAME_A")?,
                ref_frame_b: req(b, "REF_FRAME_B")?,
                values: nums(b, SPIN)?.try_into().expect("4"),
                nutation: opt_nums(b, NUT)?.map(|v| v.try_into().expect("3")),
                momentum: opt_nums(b, MOM)?.map(|v| v.try_into().expect("3")),
            });
        }
        for b in data.children_named("inertia") {
            m.inertias.push(ApmInertia {
                comments: coms(b),
                ref_frame: req(b, "INERTIA_REF_FRAME")?,
                values: nums(b, INERTIA)?.try_into().expect("6"),
            });
        }
        for b in data.children_named("maneuverParameters") {
            m.maneuvers.push(ApmManeuver {
                comments: coms(b),
                epoch_start: req(b, "MAN_EPOCH_START")?,
                duration: xml_num(b, "MAN_DURATION")?,
                ref_frame: req(b, "MAN_REF_FRAME")?,
                torque: nums(b, MAN_TOR)?.try_into().expect("3"),
                delta_mass: b
                    .child("MAN_DELTA_MASS")
                    .map(|_| xml_num(b, "MAN_DELTA_MASS"))
                    .transpose()?,
            });
        }
        m.check()?;
        Ok(m)
    }

    fn check(&self) -> Result<(), String> {
        if self.metadata.object_name.is_empty()
            || self.metadata.object_id.is_empty()
            || self.metadata.time_system.is_empty()
        {
            return Err("APM metadata needs OBJECT_NAME, OBJECT_ID and TIME_SYSTEM".into());
        }
        if self.epoch.is_empty() {
            return Err("APM without EPOCH".into());
        }
        for s in &self.spins {
            if s.nutation.is_some() && s.momentum.is_some() {
                return Err("a spin block holds nutation or momentum data, not both".into());
            }
        }
        Ok(())
    }
}

// -------------------------------------------------------------------------------------------
// Conventions (504.0-B-2 Annex F)

/// Quaternion product, scalar last.
fn qmul(a: [f64; 4], b: [f64; 4]) -> [f64; 4] {
    [
        a[3] * b[0] + a[0] * b[3] + a[1] * b[2] - a[2] * b[1],
        a[3] * b[1] - a[0] * b[2] + a[1] * b[3] + a[2] * b[0],
        a[3] * b[2] + a[0] * b[1] - a[1] * b[0] + a[2] * b[3],
        a[3] * b[3] - a[0] * b[0] - a[1] * b[1] - a[2] * b[2],
    ]
}

/// The quaternion (scalar last) of a rotation by `deg` about axis `X`, `Y` or `Z`.
fn axis_quaternion(axis: char, deg: f64) -> Result<[f64; 4], String> {
    let h = deg.to_radians() / 2.0;
    let (s, c) = h.psin_cos();
    Ok(match axis {
        'X' | '1' => [s, 0.0, 0.0, c],
        'Y' | '2' => [0.0, s, 0.0, c],
        'Z' | '3' => [0.0, 0.0, s, c],
        o => return Err(format!("rotation axis {o:?}")),
    })
}

/// The quaternion (scalar last, `Q1 Q2 Q3 QC`) "from frame A to frame B" (504.0-B-2 F2: the
/// rotation that takes the basis vectors of A onto those of B, so `X_B = M_BA X_A` with `M_BA`
/// its transpose) described by one AEM record of quaternion, Euler-angle or spin type:
/// * quaternion: the record's quaternion;
/// * Euler angles (F3): `q(a1, t1) q(a2, t2) q(a3, t3)`, the three intrinsic rotations;
/// * spin (F5.2): `q(Z, alpha + 90) q(X, 90 - delta) q(Z, spin angle)`.
///
/// A version-1.0 record with `ATTITUDE_DIR = B2A` describes the rotation from B to A, so its
/// conjugate is returned.
pub fn quaternion_a_to_b(meta: &AemMetadata, values: &[f64]) -> Result<[f64; 4], String> {
    let t = meta.attitude_type;
    if values.len() != t.value_count() {
        return Err(format!("{} values for {}", values.len(), t.keyword()));
    }
    let q = if t.is_quaternion() {
        [values[0], values[1], values[2], values[3]]
    } else if matches!(
        t,
        AttitudeType::Spin | AttitudeType::SpinNutation | AttitudeType::SpinNutationMom
    ) {
        let a = axis_quaternion('Z', values[0] + 90.0)?;
        let b = axis_quaternion('X', 90.0 - values[1])?;
        let c = axis_quaternion('Z', values[2])?;
        qmul(qmul(a, b), c)
    } else {
        let seq: Vec<char> = meta
            .euler_rot_seq
            .as_deref()
            .ok_or("Euler record without EULER_ROT_SEQ")?
            .chars()
            .collect();
        if seq.len() != 3 {
            return Err(format!("rotation sequence {seq:?}"));
        }
        let a = axis_quaternion(seq[0], values[0])?;
        let b = axis_quaternion(seq[1], values[1])?;
        let c = axis_quaternion(seq[2], values[2])?;
        qmul(qmul(a, b), c)
    };
    let b2a = meta
        .attitude_dir
        .as_deref()
        .is_some_and(|d| d.eq_ignore_ascii_case("B2A"));
    Ok(if b2a { [-q[0], -q[1], -q[2], q[3]] } else { q })
}

/// Seconds of an epoch `YYYY-MM-DDThh:mm:ss[.f]` or `YYYY-DDDThh:mm:ss[.f]` from
/// 2000-01-01T00:00:00 on the epoch's own time scale (no leap-second handling: for comparing
/// epochs written in one scale).
pub fn epoch_seconds(s: &str) -> Result<f64, String> {
    let s = s.trim().trim_end_matches('Z');
    let (date, time) = s
        .split_once('T')
        .ok_or_else(|| format!("epoch {s:?} has no 'T'"))?;
    let p: Vec<&str> = date.split('-').collect();
    let parse = |x: &str| x.parse::<i64>().map_err(|e| format!("{s}: {e}"));
    let days = |y: i64, m: i64, d: i64| -> i64 {
        let y = if m <= 2 { y - 1 } else { y };
        let era = y.div_euclid(400);
        let yoe = y - era * 400;
        let doy = (153 * ((m + 9) % 12) + 2) / 5 + d - 1;
        era * 146_097 + yoe * 365 + yoe / 4 - yoe / 100 + doy - 719_468
    };
    let day = match p.len() {
        3 => days(parse(p[0])?, parse(p[1])?, parse(p[2])?),
        2 => days(parse(p[0])?, 1, 1) + parse(p[1])? - 1,
        _ => return Err(format!("epoch date {date:?}")),
    } - days(2000, 1, 1);
    let t: Vec<&str> = time.split(':').collect();
    if t.len() != 3 {
        return Err(format!("epoch time {time:?}"));
    }
    let sec: f64 = t[2].parse().map_err(|e| format!("{s}: {e}"))?;
    Ok((day * 86_400 + parse(t[0])? * 3600 + parse(t[1])? * 60) as f64 + sec)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn header(v: &str) -> AdmHeader {
        AdmHeader {
            version: v.into(),
            comments: vec!["c".into()],
            classification: None,
            creation_date: "2026-01-01T00:00:00".into(),
            originator: "TEST".into(),
            message_id: Some("ID1".into()),
        }
    }

    fn meta(t: AttitudeType) -> AemMetadata {
        AemMetadata {
            comments: vec!["m".into()],
            object_name: "SAT".into(),
            object_id: "2026-001A".into(),
            center_name: Some("EARTH".into()),
            ref_frame_a: "EME2000".into(),
            ref_frame_b: "SC_BODY_1".into(),
            attitude_dir: None,
            time_system: "UTC".into(),
            start_time: "2026-01-01T00:00:00".into(),
            useable_start_time: None,
            useable_stop_time: None,
            stop_time: "2026-01-01T00:00:10".into(),
            attitude_type: t,
            quaternion_type: None,
            euler_rot_seq: Some("ZYX".into()),
            angvel_frame: None,
            interpolation_method: None,
            interpolation_degree: None,
        }
    }

    #[test]
    fn aem_round_trips_in_kvn_and_xml_for_every_v2_type() {
        for t in AttitudeType::ALL {
            if !t.version_ok(false) {
                continue;
            }
            let rec = |e: &str| AemRecord {
                epoch: e.into(),
                values: (0..t.value_count())
                    .map(|k| 0.1 + k as f64 * 1e-7)
                    .collect(),
            };
            let m = AemMessage {
                header: header("2.0"),
                segments: vec![AemSegment {
                    metadata: meta(t),
                    data_comments: vec!["d".into()],
                    records: vec![rec("2026-01-01T00:00:00"), rec("2026-01-01T00:00:10.5")],
                }],
            };
            assert_eq!(AemMessage::parse(&m.to_kvn().unwrap()).unwrap(), m, "{t:?}");
            assert_eq!(AemMessage::parse(&m.to_xml().unwrap()).unwrap(), m, "{t:?}");
        }
    }

    #[test]
    fn v1_first_quaternions_are_reordered_and_b2a_conjugated() {
        let mut md = meta(AttitudeType::Quaternion);
        md.quaternion_type = Some("FIRST".into());
        md.attitude_dir = Some("B2A".into());
        md.euler_rot_seq = None;
        let m = AemMessage {
            header: header("1.0"),
            segments: vec![AemSegment {
                metadata: md.clone(),
                data_comments: vec![],
                records: vec![AemRecord {
                    epoch: "2026-01-01T00:00:00".into(),
                    values: vec![0.1, 0.2, 0.3, 0.9],
                }],
            }],
        };
        let kvn = m.to_kvn().unwrap();
        assert!(kvn.contains("2026-01-01T00:00:00 0.9 0.1 0.2 0.3"));
        assert_eq!(AemMessage::parse(&kvn).unwrap(), m);
        assert!(m.to_xml().is_err());
        assert_eq!(
            quaternion_a_to_b(&md, &[0.1, 0.2, 0.3, 0.9]).unwrap(),
            [-0.1, -0.2, -0.3, 0.9]
        );
    }

    #[test]
    fn annex_f_examples() {
        // F2.2: B is A rotated +90 deg about Z: Q3 = QC = 0.7071.
        let mut md = meta(AttitudeType::EulerAngle);
        md.euler_rot_seq = Some("ZXZ".into());
        let q = quaternion_a_to_b(&md, &[90.0, 0.0, 0.0]).unwrap();
        let h = std::f64::consts::FRAC_1_SQRT_2;
        assert!((q[2] - h).abs() < 1e-15 && (q[3] - h).abs() < 1e-15);
        // F5.2: the spin axis (body Z) has coordinates (cos d cos a, cos d sin a, sin d) in A.
        let (a, d) = (30f64, 20f64);
        let q = quaternion_a_to_b(&meta(AttitudeType::Spin), &[a, d, 57.0, 1.0]).unwrap();
        // Image of A's Z axis by the rotation: R(q) e_z.
        let (x, y, z, w) = (q[0], q[1], q[2], q[3]);
        let img = [
            2.0 * (x * z + w * y),
            2.0 * (y * z - w * x),
            w * w - x * x - y * y + z * z,
        ];
        let (ar, dr) = (a.to_radians(), d.to_radians());
        let want = [dr.pcos() * ar.pcos(), dr.pcos() * ar.psin(), dr.psin()];
        for k in 0..3 {
            assert!((img[k] - want[k]).abs() < 1e-14);
        }
    }

    #[test]
    fn apm_round_trips_with_every_block() {
        let m = ApmMessage {
            header: header("2.0"),
            metadata: ApmMetadata {
                comments: vec!["meta".into()],
                object_name: "SAT".into(),
                object_id: "2026-001A".into(),
                center_name: Some("EARTH".into()),
                time_system: "UTC".into(),
            },
            data_comments: vec!["data".into()],
            epoch: "2026-01-01T00:00:00.25".into(),
            quaternions: vec![ApmQuaternion {
                comments: vec!["q".into()],
                ref_frame_a: "EME2000".into(),
                ref_frame_b: "SC_BODY_1".into(),
                q: [0.1, 0.2, 0.3, 0.9],
                q_dot: Some([1e-6, 2e-6, 3e-6, -4e-6]),
            }],
            eulers: vec![ApmEuler {
                comments: vec![],
                ref_frame_a: "EME2000".into(),
                ref_frame_b: "SC_BODY_1".into(),
                rot_seq: "ZXZ".into(),
                angles: [10.0, 20.0, 30.0],
                rates: None,
            }],
            angvels: vec![ApmAngVel {
                comments: vec![],
                ref_frame_a: "EME2000".into(),
                ref_frame_b: "SC_BODY_1".into(),
                angvel_frame: "SC_BODY_1".into(),
                xyz: [0.1, -0.2, 0.3],
            }],
            spins: vec![ApmSpin {
                comments: vec![],
                ref_frame_a: "EME2000".into(),
                ref_frame_b: "SC_BODY_1".into(),
                values: [1.0, 2.0, 3.0, 4.0],
                nutation: None,
                momentum: Some([5.0, 6.0, 0.7]),
            }],
            inertias: vec![ApmInertia {
                comments: vec![],
                ref_frame: "SC_BODY_1".into(),
                values: [1000.0, 800.0, 600.0, 1.0, 2.0, 3.0],
            }],
            maneuvers: vec![ApmManeuver {
                comments: vec!["man".into()],
                epoch_start: "2026-01-01T00:10:00".into(),
                duration: 30.0,
                ref_frame: "SC_BODY_1".into(),
                torque: [0.01, 0.02, -0.03],
                delta_mass: Some(-0.1),
            }],
        };
        assert_eq!(ApmMessage::parse(&m.to_kvn().unwrap()).unwrap(), m);
        assert_eq!(ApmMessage::parse(&m.to_xml().unwrap()).unwrap(), m);
    }

    #[test]
    fn epochs_parse_in_both_calendar_forms() {
        assert_eq!(epoch_seconds("2000-01-01T00:00:01.5").unwrap(), 1.5);
        assert_eq!(
            epoch_seconds("2000-032T00:00:00").unwrap(),
            epoch_seconds("2000-02-01T00:00:00").unwrap()
        );
    }
}
