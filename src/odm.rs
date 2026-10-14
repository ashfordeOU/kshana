// SPDX-License-Identifier: AGPL-3.0-only
//! CCSDS Orbit Data Messages (CCSDS 502.0-B-3, April 2023): the Orbit Parameter Message (OPM),
//! the Orbit Mean-Elements Message (OMM) and the Orbit Comprehensive Message (OCM), written and
//! read in KVN (keyword = value notation) and NDM/XML. The ephemeris message (OEM) lives in
//! [`crate::oem`].
//!
//! * OPM and OMM, versions 3.0 and 2.0: header, metadata, and every data block of the standard
//!   (state vector, osculating Keplerian elements, mean elements, spacecraft parameters,
//!   TLE-related parameters, covariance, maneuvers, user-defined parameters).
//! * OCM version 3.0: header, metadata, trajectory (`TRAJ`), physical-properties (`PHYS`),
//!   covariance (`COV`), maneuver (`MAN`) and user-defined (`USER`) blocks. Perturbations
//!   (`PERT`) and orbit-determination (`OD`) blocks are not read or written.
//!
//! The model mirrors the message: each block is a [`Section`] of comments and `KEYWORD = value`
//! items kept as the text written (units in square brackets dropped), in the message units
//! (km, km/s, deg, km³/s², kg, m², rev/day, km², km²/s, km²/s², m/s, s). Writers emit the
//! keywords of a block in the order of the standard and refuse keywords the block does not
//! define. OCM data lines (`trajLine`, `covLine`, `manLine`) are kept as their tokens, the epoch
//! (absolute, or seconds from `EPOCH_TZERO`) first.
//!
//! Checked against Orekit 13.1.8 in `tests/odm_orekit_oracle.rs`
//! (`xval/odm-orekit/PREREGISTRATION.md`).

use crate::adm::{
    comments, kv, kvn_lines, num, read_header_kvn, read_header_xml, unwrap_ndm, write_header_kvn,
    write_header_xml, KvnLine, Lines,
};
use crate::ndm_xml::{self, Element};

/// The header shared by every Navigation Data Message (comments, classification, creation date,
/// originator, message id, and the message version).
pub type OdmHeader = crate::adm::AdmHeader;

/// One block of a message: its comments and its `KEYWORD = value` items in order.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct Section {
    /// Comment lines at the start of the block.
    pub comments: Vec<String>,
    /// Keyword and value (text as written, without units) in order.
    pub items: Vec<(String, String)>,
}

impl Section {
    /// An empty block.
    pub fn new() -> Self {
        Self::default()
    }

    /// Set `key` to `value`, replacing an earlier value of the same key.
    pub fn set(&mut self, key: &str, value: impl Into<String>) -> &mut Self {
        let value = value.into();
        match self.items.iter_mut().find(|(k, _)| k == key) {
            Some(slot) => slot.1 = value,
            None => self.items.push((key.to_string(), value)),
        }
        self
    }

    /// Set `key` to a number written in shortest round-trip form.
    pub fn set_num(&mut self, key: &str, value: f64) -> &mut Self {
        self.set(key, num(value))
    }

    /// The value of `key`.
    pub fn get(&self, key: &str) -> Option<&str> {
        self.items
            .iter()
            .find(|(k, _)| k == key)
            .map(|(_, v)| v.as_str())
    }

    /// The value of `key` as a number.
    pub fn num(&self, key: &str) -> Result<Option<f64>, String> {
        self.get(key)
            .map(|v| v.parse::<f64>().map_err(|e| format!("{key} = {v:?}: {e}")))
            .transpose()
    }
}

// -------------------------------------------------------------------------------------------
// Block definitions

/// The kinds of block of the OPM and OMM.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
enum Block {
    Meta,
    State,
    Kepler,
    Mean,
    Spacecraft,
    Tle,
    Cov,
    Man,
    User,
}

const OPM_META: &[&str] = &[
    "OBJECT_NAME",
    "OBJECT_ID",
    "CENTER_NAME",
    "REF_FRAME",
    "REF_FRAME_EPOCH",
    "TIME_SYSTEM",
];
const OMM_META: &[&str] = &[
    "OBJECT_NAME",
    "OBJECT_ID",
    "CENTER_NAME",
    "REF_FRAME",
    "REF_FRAME_EPOCH",
    "TIME_SYSTEM",
    "MEAN_ELEMENT_THEORY",
];
const STATE: &[&str] = &["EPOCH", "X", "Y", "Z", "X_DOT", "Y_DOT", "Z_DOT"];
const KEPLER: &[&str] = &[
    "SEMI_MAJOR_AXIS",
    "ECCENTRICITY",
    "INCLINATION",
    "RA_OF_ASC_NODE",
    "ARG_OF_PERICENTER",
    "TRUE_ANOMALY",
    "MEAN_ANOMALY",
    "GM",
];
const MEAN: &[&str] = &[
    "EPOCH",
    "SEMI_MAJOR_AXIS",
    "MEAN_MOTION",
    "ECCENTRICITY",
    "INCLINATION",
    "RA_OF_ASC_NODE",
    "ARG_OF_PERICENTER",
    "MEAN_ANOMALY",
    "GM",
];
const SPACECRAFT: &[&str] = &[
    "MASS",
    "SOLAR_RAD_AREA",
    "SOLAR_RAD_COEFF",
    "DRAG_AREA",
    "DRAG_COEFF",
];
const TLE: &[&str] = &[
    "EPHEMERIS_TYPE",
    "CLASSIFICATION_TYPE",
    "NORAD_CAT_ID",
    "ELEMENT_SET_NO",
    "REV_AT_EPOCH",
    "BSTAR",
    "BTERM",
    "MEAN_MOTION_DOT",
    "MEAN_MOTION_DDOT",
    "AGOM",
];
/// The 21 terms of the lower triangle of the 6x6 position/velocity covariance, row by row.
pub const COV_TERMS: [&str; 21] = [
    "CX_X",
    "CY_X",
    "CY_Y",
    "CZ_X",
    "CZ_Y",
    "CZ_Z",
    "CX_DOT_X",
    "CX_DOT_Y",
    "CX_DOT_Z",
    "CX_DOT_X_DOT",
    "CY_DOT_X",
    "CY_DOT_Y",
    "CY_DOT_Z",
    "CY_DOT_X_DOT",
    "CY_DOT_Y_DOT",
    "CZ_DOT_X",
    "CZ_DOT_Y",
    "CZ_DOT_Z",
    "CZ_DOT_X_DOT",
    "CZ_DOT_Y_DOT",
    "CZ_DOT_Z_DOT",
];
const MAN: &[&str] = &[
    "MAN_EPOCH_IGNITION",
    "MAN_DURATION",
    "MAN_DELTA_MASS",
    "MAN_REF_FRAME",
    "MAN_DV_1",
    "MAN_DV_2",
    "MAN_DV_3",
];

fn cov_keys() -> Vec<&'static str> {
    let mut v = vec!["COV_REF_FRAME"];
    v.extend(COV_TERMS);
    v
}

impl Block {
    fn keys(self, omm: bool) -> Vec<&'static str> {
        match self {
            Block::Meta if omm => OMM_META.to_vec(),
            Block::Meta => OPM_META.to_vec(),
            Block::State => STATE.to_vec(),
            Block::Kepler => KEPLER.to_vec(),
            Block::Mean => MEAN.to_vec(),
            Block::Spacecraft => SPACECRAFT.to_vec(),
            Block::Tle => TLE.to_vec(),
            Block::Cov => cov_keys(),
            Block::Man => MAN.to_vec(),
            Block::User => vec![],
        }
    }

    fn xml_name(self) -> &'static str {
        match self {
            Block::Meta => "metadata",
            Block::State => "stateVector",
            Block::Kepler => "keplerianElements",
            Block::Mean => "meanElements",
            Block::Spacecraft => "spacecraftParameters",
            Block::Tle => "tleParameters",
            Block::Cov => "covarianceMatrix",
            Block::Man => "maneuverParameters",
            Block::User => "userDefinedParameters",
        }
    }

    /// Keywords that must be present.
    fn required(self, omm: bool) -> Vec<&'static str> {
        match self {
            Block::Meta => {
                let mut v = vec![
                    "OBJECT_NAME",
                    "OBJECT_ID",
                    "CENTER_NAME",
                    "REF_FRAME",
                    "TIME_SYSTEM",
                ];
                if omm {
                    v.push("MEAN_ELEMENT_THEORY");
                }
                v
            }
            Block::State => STATE.to_vec(),
            Block::Kepler => vec![
                "SEMI_MAJOR_AXIS",
                "ECCENTRICITY",
                "INCLINATION",
                "RA_OF_ASC_NODE",
                "ARG_OF_PERICENTER",
                "GM",
            ],
            Block::Mean => vec![
                "EPOCH",
                "ECCENTRICITY",
                "INCLINATION",
                "RA_OF_ASC_NODE",
                "ARG_OF_PERICENTER",
                "MEAN_ANOMALY",
            ],
            Block::Tle => vec!["MEAN_MOTION_DOT"],
            Block::Cov => COV_TERMS.to_vec(),
            Block::Man => MAN.to_vec(),
            Block::Spacecraft | Block::User => vec![],
        }
    }

    /// Exactly one of each group must be present.
    fn one_of(self) -> &'static [&'static [&'static str]] {
        match self {
            Block::Kepler => &[&["TRUE_ANOMALY", "MEAN_ANOMALY"]],
            Block::Mean => &[&["SEMI_MAJOR_AXIS", "MEAN_MOTION"]],
            Block::Tle => &[&["BSTAR", "BTERM"], &["MEAN_MOTION_DDOT", "AGOM"]],
            _ => &[],
        }
    }

    fn check(self, omm: bool, s: &Section) -> Result<(), String> {
        let name = self.xml_name();
        if self != Block::User {
            let keys = self.keys(omm);
            for (k, _) in &s.items {
                if !keys.contains(&k.as_str()) {
                    return Err(format!("{k} is not a keyword of {name}"));
                }
            }
        }
        for k in self.required(omm) {
            if s.get(k).is_none() {
                return Err(format!("{name} without {k}"));
            }
        }
        for group in self.one_of() {
            let n = group.iter().filter(|k| s.get(k).is_some()).count();
            if n != 1 {
                return Err(format!("{name} needs exactly one of {}", group.join(", ")));
            }
        }
        Ok(())
    }
}

/// Items of `s` in the order of `keys` (user blocks keep their own order).
fn ordered(block: Block, omm: bool, s: &Section) -> Vec<(&str, &str)> {
    if block == Block::User {
        return s
            .items
            .iter()
            .map(|(k, v)| (k.as_str(), v.as_str()))
            .collect();
    }
    block
        .keys(omm)
        .into_iter()
        .filter_map(|k| s.items.iter().find(|(kk, _)| kk == k))
        .map(|(k, v)| (k.as_str(), v.as_str()))
        .collect()
}

fn check_header(h: &OdmHeader) -> Result<(), String> {
    let v2 = h.version.trim().starts_with('2');
    if v2 && (h.classification.is_some() || h.message_id.is_some()) {
        return Err(format!(
            "CLASSIFICATION and MESSAGE_ID are version-3.0 header keywords (version {})",
            h.version
        ));
    }
    Ok(())
}

// -------------------------------------------------------------------------------------------
// OPM / OMM shared writer and reader

fn write_blocks_kvn(
    vers_key: &str,
    header: &OdmHeader,
    omm: bool,
    blocks: &[(Block, &Section)],
) -> Result<String, String> {
    check_header(header)?;
    let mut o = String::new();
    kv(&mut o, vers_key, &header.version);
    write_header_kvn(&mut o, header);
    for (b, s) in blocks {
        b.check(omm, s)?;
        comments(&mut o, &s.comments);
        for (k, v) in ordered(*b, omm, s) {
            if *b == Block::User {
                kv(&mut o, &format!("USER_DEFINED_{k}"), v);
            } else {
                kv(&mut o, k, v);
            }
        }
    }
    Ok(o)
}

fn write_blocks_xml(
    root: &str,
    vers_key: &str,
    header: &OdmHeader,
    omm: bool,
    blocks: &[(Block, &Section)],
) -> Result<String, String> {
    check_header(header)?;
    let mut w = ndm_xml::Writer::new();
    w.open(root, &[("id", vers_key), ("version", &header.version)]);
    write_header_xml(&mut w, header);
    w.open("body", &[]);
    w.open("segment", &[]);
    for (i, (b, s)) in blocks.iter().enumerate() {
        b.check(omm, s)?;
        if i == 1 {
            w.open("data", &[]);
        }
        w.open(b.xml_name(), &[]);
        for c in &s.comments {
            w.leaf("COMMENT", c);
        }
        for (k, v) in ordered(*b, omm, s) {
            if *b == Block::User {
                w.open_leaf("USER_DEFINED", &[("parameter", k)], v);
            } else {
                w.leaf(k, v);
            }
        }
        w.close(b.xml_name());
    }
    w.close("data");
    w.close("segment");
    w.close("body");
    w.close(root);
    Ok(w.finish())
}

/// Read the blocks of an OPM or OMM in KVN after the header: each keyword belongs to exactly
/// one block kind of the message; a new block starts when the kind changes or a maneuver
/// restarts at `MAN_EPOCH_IGNITION`. Comments go to the block of the next keyword.
fn read_blocks_kvn(
    lines: &mut Lines,
    kinds: &[Block],
    omm: bool,
) -> Result<Vec<(Block, Section)>, String> {
    let mut out: Vec<(Block, Section)> = Vec::new();
    let mut pending: Vec<String> = Vec::new();
    for l in lines.by_ref() {
        match l {
            KvnLine::Comment(c) => pending.push(c),
            KvnLine::Bare(b) => return Err(format!("unexpected line {b:?}")),
            KvnLine::Kv(k, v) => {
                let (block, key) = if let Some(u) = k.strip_prefix("USER_DEFINED_") {
                    (Block::User, u.to_string())
                } else {
                    let b = kinds
                        .iter()
                        .copied()
                        .find(|b| b.keys(omm).contains(&k.as_str()))
                        .ok_or_else(|| format!("unknown keyword {k}"))?;
                    (b, k)
                };
                let restart = block == Block::Man && key == "MAN_EPOCH_IGNITION";
                let new = match out.last() {
                    Some((b, _)) => *b != block || restart,
                    None => true,
                };
                if new {
                    if out.iter().any(|(b, _)| *b == block) && block != Block::Man {
                        return Err(format!(
                            "{} block repeated or out of order at {key}",
                            block.xml_name()
                        ));
                    }
                    out.push((block, Section::new()));
                }
                let s = &mut out.last_mut().expect("pushed").1;
                s.comments.append(&mut pending);
                if s.get(&key).is_some() {
                    return Err(format!("{key} repeated"));
                }
                s.items.push((key, v));
            }
        }
    }
    if !pending.is_empty() {
        return Err("comments after the last keyword".into());
    }
    Ok(out)
}

fn read_section_xml(e: &Element, block: Block) -> Result<Section, String> {
    let mut s = Section::new();
    for c in &e.children {
        match c.name.as_str() {
            "COMMENT" => s.comments.push(c.text.clone()),
            "USER_DEFINED" if block == Block::User => {
                let p = c
                    .attr("parameter")
                    .ok_or("<USER_DEFINED> without parameter")?;
                s.items.push((p.to_string(), c.text.clone()));
            }
            k => s.items.push((k.to_string(), c.text.clone())),
        }
    }
    Ok(s)
}

/// Read `<root>` of an OPM or OMM: header, then the metadata and data blocks. Data-level
/// comments are joined to the first data block's.
fn read_blocks_xml(
    text: &str,
    root_name: &str,
    kinds: &[Block],
) -> Result<(OdmHeader, Vec<(Block, Section)>), String> {
    let doc = ndm_xml::parse(text)?;
    let root = unwrap_ndm(&doc, root_name)?;
    let header = read_header_xml(root)?;
    let seg = root
        .child("body")
        .and_then(|b| b.child("segment"))
        .ok_or("no <body><segment>")?;
    let meta = seg.child("metadata").ok_or("no <metadata>")?;
    let mut out = vec![(Block::Meta, read_section_xml(meta, Block::Meta)?)];
    let data = seg.child("data").ok_or("no <data>")?;
    let mut data_comments = Vec::new();
    for c in &data.children {
        if c.name == "COMMENT" {
            data_comments.push(c.text.clone());
            continue;
        }
        let b = kinds
            .iter()
            .copied()
            .find(|b| *b != Block::Meta && b.xml_name() == c.name)
            .ok_or_else(|| format!("unexpected <{}> in <data>", c.name))?;
        let mut s = read_section_xml(c, b)?;
        if out.len() == 1 {
            data_comments.append(&mut s.comments);
            s.comments = std::mem::take(&mut data_comments);
        }
        out.push((b, s));
    }
    Ok((header, out))
}

fn take_one(blocks: &mut Vec<(Block, Section)>, b: Block) -> Result<Option<Section>, String> {
    let mut found: Option<Section> = None;
    let mut i = 0;
    while i < blocks.len() {
        if blocks[i].0 == b {
            if found.is_some() {
                return Err(format!("{} given twice", b.xml_name()));
            }
            found = Some(blocks.remove(i).1);
        } else {
            i += 1;
        }
    }
    Ok(found)
}

// -------------------------------------------------------------------------------------------
// OPM

/// An Orbit Parameter Message.
#[derive(Clone, Debug, PartialEq)]
pub struct OpmMessage {
    /// Header (version `3.0` or `2.0`).
    pub header: OdmHeader,
    /// Metadata: `OBJECT_NAME`, `OBJECT_ID`, `CENTER_NAME`, `REF_FRAME`, `REF_FRAME_EPOCH`,
    /// `TIME_SYSTEM`.
    pub metadata: Section,
    /// State vector: `EPOCH`, `X`..`Z` (km), `X_DOT`..`Z_DOT` (km/s).
    pub state: Section,
    /// Osculating Keplerian elements (km, deg, km³/s²).
    pub keplerian: Option<Section>,
    /// Spacecraft parameters (kg, m²).
    pub spacecraft: Option<Section>,
    /// Position/velocity covariance (`COV_REF_FRAME` and the 21 terms of [`COV_TERMS`]).
    pub covariance: Option<Section>,
    /// Impulsive maneuvers, in order.
    pub maneuvers: Vec<Section>,
    /// User-defined parameters (keyword without the `USER_DEFINED_` prefix).
    pub user: Option<Section>,
}

const OPM_BLOCKS: &[Block] = &[
    Block::Meta,
    Block::State,
    Block::Kepler,
    Block::Spacecraft,
    Block::Cov,
    Block::Man,
    Block::User,
];

impl OpmMessage {
    fn blocks(&self) -> Vec<(Block, &Section)> {
        let mut v = vec![(Block::Meta, &self.metadata), (Block::State, &self.state)];
        if let Some(s) = &self.keplerian {
            v.push((Block::Kepler, s));
        }
        if let Some(s) = &self.spacecraft {
            v.push((Block::Spacecraft, s));
        }
        if let Some(s) = &self.covariance {
            v.push((Block::Cov, s));
        }
        for s in &self.maneuvers {
            v.push((Block::Man, s));
        }
        if let Some(s) = &self.user {
            v.push((Block::User, s));
        }
        v
    }

    /// Write in KVN.
    pub fn to_kvn(&self) -> Result<String, String> {
        write_blocks_kvn("CCSDS_OPM_VERS", &self.header, false, &self.blocks())
    }

    /// Write in NDM/XML.
    pub fn to_xml(&self) -> Result<String, String> {
        write_blocks_xml("opm", "CCSDS_OPM_VERS", &self.header, false, &self.blocks())
    }

    /// Read KVN or NDM/XML (detected from the first non-blank character).
    pub fn parse(text: &str) -> Result<Self, String> {
        let (header, mut blocks) = if text.trim_start().starts_with('<') {
            read_blocks_xml(text, "opm", OPM_BLOCKS)?
        } else {
            let mut lines = kvn_lines(text);
            let (_, h) = read_header_kvn(&mut lines, "CCSDS_OPM_VERS")?;
            (h, read_blocks_kvn(&mut lines, OPM_BLOCKS, false)?)
        };
        let metadata = take_one(&mut blocks, Block::Meta)?.ok_or("OPM without metadata")?;
        let state = take_one(&mut blocks, Block::State)?.ok_or("OPM without state vector")?;
        let m = OpmMessage {
            header,
            metadata,
            state,
            keplerian: take_one(&mut blocks, Block::Kepler)?,
            spacecraft: take_one(&mut blocks, Block::Spacecraft)?,
            covariance: take_one(&mut blocks, Block::Cov)?,
            maneuvers: blocks
                .iter()
                .filter(|(b, _)| *b == Block::Man)
                .map(|(_, s)| s.clone())
                .collect(),
            user: take_one(&mut blocks, Block::User)?,
        };
        for (b, s) in m.blocks() {
            b.check(false, s)?;
        }
        Ok(m)
    }
}

// -------------------------------------------------------------------------------------------
// OMM

/// An Orbit Mean-Elements Message.
#[derive(Clone, Debug, PartialEq)]
pub struct OmmMessage {
    /// Header (version `3.0` or `2.0`).
    pub header: OdmHeader,
    /// Metadata, including `MEAN_ELEMENT_THEORY`.
    pub metadata: Section,
    /// Mean elements: `EPOCH`, `SEMI_MAJOR_AXIS` (km) or `MEAN_MOTION` (rev/day),
    /// `ECCENTRICITY`, angles (deg), `GM` (km³/s²).
    pub mean_elements: Section,
    /// Spacecraft parameters (kg, m²).
    pub spacecraft: Option<Section>,
    /// TLE-related parameters (`BSTAR` 1/earth-radii, `BTERM` m²/kg, `MEAN_MOTION_DOT`
    /// rev/day², `MEAN_MOTION_DDOT` rev/day³, `AGOM` m²/kg).
    pub tle: Option<Section>,
    /// Position/velocity covariance.
    pub covariance: Option<Section>,
    /// User-defined parameters.
    pub user: Option<Section>,
}

const OMM_BLOCKS: &[Block] = &[
    Block::Meta,
    Block::Mean,
    Block::Spacecraft,
    Block::Tle,
    Block::Cov,
    Block::User,
];

impl OmmMessage {
    fn blocks(&self) -> Vec<(Block, &Section)> {
        let mut v = vec![
            (Block::Meta, &self.metadata),
            (Block::Mean, &self.mean_elements),
        ];
        for (b, s) in [
            (Block::Spacecraft, &self.spacecraft),
            (Block::Tle, &self.tle),
            (Block::Cov, &self.covariance),
            (Block::User, &self.user),
        ] {
            if let Some(s) = s {
                v.push((b, s));
            }
        }
        v
    }

    /// Write in KVN, every value as stored (full precision for values set with
    /// [`Section::set_num`]).
    pub fn to_kvn(&self) -> Result<String, String> {
        write_blocks_kvn("CCSDS_OMM_VERS", &self.header, true, &self.blocks())
    }

    /// Write in NDM/XML.
    pub fn to_xml(&self) -> Result<String, String> {
        write_blocks_xml("omm", "CCSDS_OMM_VERS", &self.header, true, &self.blocks())
    }

    /// Read KVN or NDM/XML.
    pub fn parse(text: &str) -> Result<Self, String> {
        let (header, mut blocks) = if text.trim_start().starts_with('<') {
            read_blocks_xml(text, "omm", OMM_BLOCKS)?
        } else {
            let mut lines = kvn_lines(text);
            let (_, h) = read_header_kvn(&mut lines, "CCSDS_OMM_VERS")?;
            (h, read_blocks_kvn(&mut lines, OMM_BLOCKS, true)?)
        };
        let metadata = take_one(&mut blocks, Block::Meta)?.ok_or("OMM without metadata")?;
        let mean_elements =
            take_one(&mut blocks, Block::Mean)?.ok_or("OMM without mean elements")?;
        let m = OmmMessage {
            header,
            metadata,
            mean_elements,
            spacecraft: take_one(&mut blocks, Block::Spacecraft)?,
            tle: take_one(&mut blocks, Block::Tle)?,
            covariance: take_one(&mut blocks, Block::Cov)?,
            user: take_one(&mut blocks, Block::User)?,
        };
        for (b, s) in m.blocks() {
            b.check(true, s)?;
        }
        Ok(m)
    }

    /// The message of an [`crate::omm::OmmFile`] at full precision (version of the file, its
    /// metadata, mean motion, angles, and the TLE parameters it carries; `MEAN_MOTION_DOT` and
    /// `MEAN_MOTION_DDOT` are not kept by `OmmFile` and are written as 0).
    pub fn from_omm_file(f: &crate::omm::OmmFile) -> Self {
        let mut meta = Section::new();
        meta.set("OBJECT_NAME", &f.object_name)
            .set("OBJECT_ID", &f.object_id)
            .set("CENTER_NAME", &f.center_name)
            .set("REF_FRAME", &f.ref_frame)
            .set("TIME_SYSTEM", &f.time_system)
            .set("MEAN_ELEMENT_THEORY", &f.mean_element_theory);
        let mut mean = Section::new();
        mean.set("EPOCH", &f.epoch)
            .set_num("MEAN_MOTION", f.mean_motion_rev_day)
            .set_num("ECCENTRICITY", f.eccentricity)
            .set_num("INCLINATION", f.inclination_deg)
            .set_num("RA_OF_ASC_NODE", f.ra_of_asc_node_deg)
            .set_num("ARG_OF_PERICENTER", f.arg_of_pericenter_deg)
            .set_num("MEAN_ANOMALY", f.mean_anomaly_deg);
        let mut tle = Section::new();
        tle.set("EPHEMERIS_TYPE", f.ephemeris_type.to_string())
            .set("CLASSIFICATION_TYPE", f.classification.to_string())
            .set("NORAD_CAT_ID", f.norad_cat_id.to_string())
            .set_num("BSTAR", f.bstar)
            .set_num("MEAN_MOTION_DOT", 0.0)
            .set_num("MEAN_MOTION_DDOT", 0.0);
        OmmMessage {
            header: OdmHeader {
                version: f.version.clone(),
                comments: vec![],
                classification: None,
                creation_date: f.creation_date.clone(),
                originator: f.originator.clone(),
                message_id: None,
            },
            metadata: meta,
            mean_elements: mean,
            spacecraft: None,
            tle: Some(tle),
            covariance: None,
            user: None,
        }
    }
}

// -------------------------------------------------------------------------------------------
// OCM

const OCM_META: &[&str] = &[
    "OBJECT_NAME",
    "INTERNATIONAL_DESIGNATOR",
    "CATALOG_NAME",
    "OBJECT_DESIGNATOR",
    "ALTERNATE_NAMES",
    "ORIGINATOR_POC",
    "ORIGINATOR_POSITION",
    "ORIGINATOR_PHONE",
    "ORIGINATOR_EMAIL",
    "ORIGINATOR_ADDRESS",
    "TECH_ORG",
    "TECH_POC",
    "TECH_POSITION",
    "TECH_PHONE",
    "TECH_EMAIL",
    "TECH_ADDRESS",
    "PREVIOUS_MESSAGE_ID",
    "NEXT_MESSAGE_ID",
    "ADM_MSG_LINK",
    "CDM_MSG_LINK",
    "PRM_MSG_LINK",
    "RDM_MSG_LINK",
    "TDM_MSG_LINK",
    "OPERATOR",
    "OWNER",
    "COUNTRY",
    "CONSTELLATION",
    "OBJECT_TYPE",
    "TIME_SYSTEM",
    "EPOCH_TZERO",
    "OPS_STATUS",
    "ORBIT_CATEGORY",
    "OCM_DATA_ELEMENTS",
    "SCLK_OFFSET_AT_EPOCH",
    "SCLK_SEC_PER_SI_SEC",
    "PREVIOUS_MESSAGE_EPOCH",
    "NEXT_MESSAGE_EPOCH",
    "START_TIME",
    "STOP_TIME",
    "TIME_SPAN",
    "TAIMUTC_AT_TZERO",
    "NEXT_LEAP_EPOCH",
    "NEXT_LEAP_TAIMUTC",
    "UT1MUTC_AT_TZERO",
    "EOP_SOURCE",
    "INTERP_METHOD_EOP",
    "CELESTIAL_SOURCE",
];
const OCM_TRAJ: &[&str] = &[
    "TRAJ_ID",
    "TRAJ_PREV_ID",
    "TRAJ_NEXT_ID",
    "TRAJ_BASIS",
    "TRAJ_BASIS_ID",
    "INTERPOLATION",
    "INTERPOLATION_DEGREE",
    "PROPAGATOR",
    "CENTER_NAME",
    "TRAJ_REF_FRAME",
    "TRAJ_FRAME_EPOCH",
    "USEABLE_START_TIME",
    "USEABLE_STOP_TIME",
    "ORB_REVNUM",
    "ORB_REVNUM_BASIS",
    "TRAJ_TYPE",
    "ORB_AVERAGING",
    "TRAJ_UNITS",
];
const OCM_PHYS: &[&str] = &[
    "MANUFACTURER",
    "BUS_MODEL",
    "DOCKED_WITH",
    "DRAG_CONST_AREA",
    "DRAG_COEFF_NOM",
    "DRAG_UNCERTAINTY",
    "INITIAL_WET_MASS",
    "WET_MASS",
    "DRY_MASS",
    "OEB_PARENT_FRAME",
    "OEB_PARENT_FRAME_EPOCH",
    "OEB_Q1",
    "OEB_Q2",
    "OEB_Q3",
    "OEB_QC",
    "OEB_MAX",
    "OEB_INT",
    "OEB_MIN",
    "AREA_ALONG_OEB_MAX",
    "AREA_ALONG_OEB_INT",
    "AREA_ALONG_OEB_MIN",
    "AREA_MIN_FOR_PC",
    "AREA_MAX_FOR_PC",
    "AREA_TYP_FOR_PC",
    "RCS",
    "RCS_MIN",
    "RCS_MAX",
    "SRP_CONST_AREA",
    "SOLAR_RAD_COEFF",
    "SOLAR_RAD_UNCERTAINTY",
    "VM_ABSOLUTE",
    "VM_APPARENT_MIN",
    "VM_APPARENT",
    "VM_APPARENT_MAX",
    "REFLECTANCE",
    "ATT_CONTROL_MODE",
    "ATT_ACTUATOR_TYPE",
    "ATT_KNOWLEDGE",
    "ATT_CONTROL",
    "ATT_POINTING",
    "AVG_MANEUVER_FREQ",
    "MAX_THRUST",
    "DV_BOL",
    "DV_REMAINING",
    "IXX",
    "IYY",
    "IZZ",
    "IXY",
    "IXZ",
    "IYZ",
];
const OCM_COV: &[&str] = &[
    "COV_ID",
    "COV_PREV_ID",
    "COV_NEXT_ID",
    "COV_BASIS",
    "COV_BASIS_ID",
    "COV_REF_FRAME",
    "COV_FRAME_EPOCH",
    "COV_SCALE_MIN",
    "COV_SCALE_MAX",
    "COV_CONFIDENCE",
    "COV_TYPE",
    "COV_ORDERING",
    "COV_UNITS",
];
const OCM_MAN: &[&str] = &[
    "MAN_ID",
    "MAN_PREV_ID",
    "MAN_NEXT_ID",
    "MAN_BASIS",
    "MAN_BASIS_ID",
    "MAN_DEVICE_ID",
    "MAN_PREV_EPOCH",
    "MAN_NEXT_EPOCH",
    "MAN_PURPOSE",
    "MAN_PRED_SOURCE",
    "MAN_REF_FRAME",
    "MAN_FRAME_EPOCH",
    "GRAV_ASSIST_NAME",
    "DC_TYPE",
    "DC_WIN_OPEN",
    "DC_WIN_CLOSE",
    "DC_MIN_CYCLES",
    "DC_MAX_CYCLES",
    "DC_EXEC_START",
    "DC_EXEC_STOP",
    "DC_REF_TIME",
    "DC_TIME_PULSE_DURATION",
    "DC_TIME_PULSE_PERIOD",
    "DC_REF_DIR",
    "DC_BODY_FRAME",
    "DC_BODY_TRIGGER",
    "DC_PA_START_ANGLE",
    "DC_PA_STOP_ANGLE",
    "MAN_COMPOSITION",
    "MAN_UNITS",
];

/// The OCM block kinds this module reads and writes.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum OcmBlockKind {
    /// `TRAJ`: trajectory state time history.
    Traj,
    /// `PHYS`: physical properties.
    Phys,
    /// `COV`: covariance time history.
    Cov,
    /// `MAN`: maneuver time history.
    Man,
    /// `USER`: user-defined parameters.
    User,
}

impl OcmBlockKind {
    fn tag(self) -> &'static str {
        match self {
            OcmBlockKind::Traj => "TRAJ",
            OcmBlockKind::Phys => "PHYS",
            OcmBlockKind::Cov => "COV",
            OcmBlockKind::Man => "MAN",
            OcmBlockKind::User => "USER",
        }
    }
    fn xml(self) -> &'static str {
        match self {
            OcmBlockKind::Traj => "traj",
            OcmBlockKind::Phys => "phys",
            OcmBlockKind::Cov => "cov",
            OcmBlockKind::Man => "man",
            OcmBlockKind::User => "user",
        }
    }
    fn line_tag(self) -> Option<&'static str> {
        match self {
            OcmBlockKind::Traj => Some("trajLine"),
            OcmBlockKind::Cov => Some("covLine"),
            OcmBlockKind::Man => Some("manLine"),
            _ => None,
        }
    }
    fn keys(self) -> &'static [&'static str] {
        match self {
            OcmBlockKind::Traj => OCM_TRAJ,
            OcmBlockKind::Phys => OCM_PHYS,
            OcmBlockKind::Cov => OCM_COV,
            OcmBlockKind::Man => OCM_MAN,
            OcmBlockKind::User => &[],
        }
    }
    fn required(self) -> &'static [&'static str] {
        match self {
            OcmBlockKind::Traj => &["CENTER_NAME", "TRAJ_REF_FRAME", "TRAJ_TYPE"],
            OcmBlockKind::Cov => &["COV_REF_FRAME", "COV_TYPE", "COV_ORDERING"],
            OcmBlockKind::Man => &[
                "MAN_ID",
                "MAN_DEVICE_ID",
                "MAN_REF_FRAME",
                "DC_TYPE",
                "MAN_COMPOSITION",
            ],
            _ => &[],
        }
    }
}

/// One OCM block: its keywords and, for `TRAJ`, `COV` and `MAN`, its data lines (tokens, the
/// epoch first).
#[derive(Clone, Debug, Default, PartialEq)]
pub struct OcmBlock {
    /// Comments and keywords.
    pub section: Section,
    /// Data lines as tokens.
    pub lines: Vec<Vec<String>>,
}

impl OcmBlock {
    /// Append a data line of `epoch` (absolute, or seconds from `EPOCH_TZERO`) and values.
    pub fn push_line(&mut self, epoch: &str, values: &[f64]) {
        let mut l = vec![epoch.to_string()];
        l.extend(values.iter().map(|v| num(*v)));
        self.lines.push(l);
    }

    /// Number of values after the epoch a data line must carry, when the block's type fixes it.
    fn line_width(&self, kind: OcmBlockKind) -> Option<usize> {
        let s = &self.section;
        match kind {
            OcmBlockKind::Traj => match s.get("TRAJ_TYPE")? {
                "CARTP" => Some(3),
                "CARTPV" => Some(6),
                "CARTPVA" => Some(9),
                _ => None,
            },
            OcmBlockKind::Cov => match (s.get("COV_TYPE")?, s.get("COV_ORDERING")?) {
                ("CARTP", "LTM") => Some(6),
                ("CARTPV", "LTM") => Some(21),
                _ => None,
            },
            OcmBlockKind::Man => Some(s.get("MAN_COMPOSITION")?.split(',').count() - 1),
            _ => None,
        }
    }

    fn check(&self, kind: OcmBlockKind) -> Result<(), String> {
        if kind != OcmBlockKind::User {
            for (k, _) in &self.section.items {
                if !kind.keys().contains(&k.as_str()) {
                    return Err(format!("{k} is not a keyword of the {} block", kind.tag()));
                }
            }
        }
        for k in kind.required() {
            if self.section.get(k).is_none() {
                return Err(format!("{} block without {k}", kind.tag()));
            }
        }
        if kind.line_tag().is_none() && !self.lines.is_empty() {
            return Err(format!("{} block with data lines", kind.tag()));
        }
        if let Some(n) = self.line_width(kind) {
            for l in &self.lines {
                if l.len() != n + 1 {
                    return Err(format!(
                        "{} line {:?} has {} values, expected {n}",
                        kind.tag(),
                        l.join(" "),
                        l.len().saturating_sub(1)
                    ));
                }
            }
        }
        Ok(())
    }

    fn ordered(&self, kind: OcmBlockKind) -> Vec<(&str, &str)> {
        if kind == OcmBlockKind::User {
            return self
                .section
                .items
                .iter()
                .map(|(k, v)| (k.as_str(), v.as_str()))
                .collect();
        }
        kind.keys()
            .iter()
            .filter_map(|k| self.section.items.iter().find(|(kk, _)| kk == k))
            .map(|(k, v)| (k.as_str(), v.as_str()))
            .collect()
    }
}

/// An Orbit Comprehensive Message (version 3.0).
#[derive(Clone, Debug, PartialEq)]
pub struct OcmMessage {
    /// Header.
    pub header: OdmHeader,
    /// Metadata (`TIME_SYSTEM` and `EPOCH_TZERO` required).
    pub metadata: Section,
    /// Trajectory blocks, in order.
    pub traj: Vec<OcmBlock>,
    /// Physical-properties block.
    pub phys: Option<OcmBlock>,
    /// Covariance blocks, in order.
    pub cov: Vec<OcmBlock>,
    /// Maneuver blocks, in order.
    pub man: Vec<OcmBlock>,
    /// User-defined parameters.
    pub user: Option<OcmBlock>,
}

impl OcmMessage {
    fn blocks(&self) -> Vec<(OcmBlockKind, &OcmBlock)> {
        let mut v: Vec<(OcmBlockKind, &OcmBlock)> =
            self.traj.iter().map(|b| (OcmBlockKind::Traj, b)).collect();
        v.extend(self.phys.iter().map(|b| (OcmBlockKind::Phys, b)));
        v.extend(self.cov.iter().map(|b| (OcmBlockKind::Cov, b)));
        v.extend(self.man.iter().map(|b| (OcmBlockKind::Man, b)));
        v.extend(self.user.iter().map(|b| (OcmBlockKind::User, b)));
        v
    }

    fn check(&self) -> Result<(), String> {
        check_header(&self.header)?;
        for (k, _) in &self.metadata.items {
            if !OCM_META.contains(&k.as_str()) {
                return Err(format!("{k} is not an OCM metadata keyword"));
            }
        }
        for k in ["TIME_SYSTEM", "EPOCH_TZERO"] {
            if self.metadata.get(k).is_none() {
                return Err(format!("OCM metadata without {k}"));
            }
        }
        for (k, b) in self.blocks() {
            b.check(k)?;
        }
        Ok(())
    }

    fn meta_ordered(&self) -> Vec<(&str, &str)> {
        OCM_META
            .iter()
            .filter_map(|k| self.metadata.items.iter().find(|(kk, _)| kk == k))
            .map(|(k, v)| (k.as_str(), v.as_str()))
            .collect()
    }

    /// Write in KVN.
    pub fn to_kvn(&self) -> Result<String, String> {
        self.check()?;
        let mut o = String::new();
        kv(&mut o, "CCSDS_OCM_VERS", &self.header.version);
        write_header_kvn(&mut o, &self.header);
        o.push_str("META_START\n");
        comments(&mut o, &self.metadata.comments);
        for (k, v) in self.meta_ordered() {
            kv(&mut o, k, v);
        }
        o.push_str("META_STOP\n");
        for (kind, b) in self.blocks() {
            o.push_str(&format!("{}_START\n", kind.tag()));
            comments(&mut o, &b.section.comments);
            for (k, v) in b.ordered(kind) {
                if kind == OcmBlockKind::User {
                    kv(&mut o, &format!("USER_DEFINED_{k}"), v);
                } else {
                    kv(&mut o, k, v);
                }
            }
            for l in &b.lines {
                o.push_str(&l.join(" "));
                o.push('\n');
            }
            o.push_str(&format!("{}_STOP\n", kind.tag()));
        }
        Ok(o)
    }

    /// Write in NDM/XML.
    pub fn to_xml(&self) -> Result<String, String> {
        self.check()?;
        let mut w = ndm_xml::Writer::new();
        w.open(
            "ocm",
            &[("id", "CCSDS_OCM_VERS"), ("version", &self.header.version)],
        );
        write_header_xml(&mut w, &self.header);
        w.open("body", &[]);
        w.open("segment", &[]);
        w.open("metadata", &[]);
        for c in &self.metadata.comments {
            w.leaf("COMMENT", c);
        }
        for (k, v) in self.meta_ordered() {
            w.leaf(k, v);
        }
        w.close("metadata");
        w.open("data", &[]);
        for (kind, b) in self.blocks() {
            w.open(kind.xml(), &[]);
            for c in &b.section.comments {
                w.leaf("COMMENT", c);
            }
            for (k, v) in b.ordered(kind) {
                if kind == OcmBlockKind::User {
                    w.open_leaf("USER_DEFINED", &[("parameter", k)], v);
                } else {
                    w.leaf(k, v);
                }
            }
            if let Some(t) = kind.line_tag() {
                for l in &b.lines {
                    w.leaf(t, &l.join(" "));
                }
            }
            w.close(kind.xml());
        }
        w.close("data");
        w.close("segment");
        w.close("body");
        w.close("ocm");
        Ok(w.finish())
    }

    fn empty(header: OdmHeader) -> Self {
        OcmMessage {
            header,
            metadata: Section::new(),
            traj: vec![],
            phys: None,
            cov: vec![],
            man: vec![],
            user: None,
        }
    }

    fn add(&mut self, kind: OcmBlockKind, b: OcmBlock) -> Result<(), String> {
        match kind {
            OcmBlockKind::Traj => self.traj.push(b),
            OcmBlockKind::Cov => self.cov.push(b),
            OcmBlockKind::Man => self.man.push(b),
            OcmBlockKind::Phys if self.phys.is_none() => self.phys = Some(b),
            OcmBlockKind::User if self.user.is_none() => self.user = Some(b),
            _ => return Err(format!("{} block repeated", kind.tag())),
        }
        Ok(())
    }

    /// Read KVN or NDM/XML. `PERT` and `OD` blocks are refused (not supported).
    pub fn parse(text: &str) -> Result<Self, String> {
        let m = if text.trim_start().starts_with('<') {
            Self::parse_xml(text)?
        } else {
            Self::parse_kvn(text)?
        };
        m.check()?;
        Ok(m)
    }

    fn parse_kvn(text: &str) -> Result<Self, String> {
        let mut lines = kvn_lines(text);
        let (_, header) = read_header_kvn(&mut lines, "CCSDS_OCM_VERS")?;
        let mut m = Self::empty(header);
        let mut pending: Vec<String> = Vec::new();
        let mut current: Option<(Option<OcmBlockKind>, OcmBlock)> = None;
        for l in lines {
            match l {
                KvnLine::Comment(c) => match &mut current {
                    Some((_, b)) if b.section.items.is_empty() && b.lines.is_empty() => {
                        b.section.comments.push(c)
                    }
                    _ => pending.push(c),
                },
                KvnLine::Bare(t) => {
                    if t == "META_START" || t.ends_with("_START") {
                        if current.is_some() {
                            return Err(format!("{t} inside a block"));
                        }
                        let kind = if t == "META_START" {
                            None
                        } else {
                            let tag = &t[..t.len() - 6];
                            Some(
                                [
                                    OcmBlockKind::Traj,
                                    OcmBlockKind::Phys,
                                    OcmBlockKind::Cov,
                                    OcmBlockKind::Man,
                                    OcmBlockKind::User,
                                ]
                                .into_iter()
                                .find(|k| k.tag() == tag)
                                .ok_or_else(|| format!("unsupported OCM block {tag}"))?,
                            )
                        };
                        let mut b = OcmBlock::default();
                        b.section.comments.append(&mut pending);
                        current = Some((kind, b));
                    } else if t == "META_STOP" || t.ends_with("_STOP") {
                        let (kind, b) = current.take().ok_or(format!("{t} outside a block"))?;
                        let want = kind.map_or("META", |k| k.tag());
                        if t != format!("{want}_STOP") {
                            return Err(format!("{t} closes a {want} block"));
                        }
                        match kind {
                            None => m.metadata = b.section,
                            Some(k) => m.add(k, b)?,
                        }
                    } else {
                        match &mut current {
                            Some((Some(k), b)) if k.line_tag().is_some() => b
                                .lines
                                .push(t.split_whitespace().map(str::to_string).collect()),
                            _ => return Err(format!("unexpected line {t:?}")),
                        }
                    }
                }
                KvnLine::Kv(k, v) => {
                    let (kind, b) = current
                        .as_mut()
                        .ok_or_else(|| format!("{k} outside a block"))?;
                    let key = match (kind, k.strip_prefix("USER_DEFINED_")) {
                        (Some(OcmBlockKind::User), Some(u)) => u.to_string(),
                        _ => k,
                    };
                    b.section.items.push((key, v));
                }
            }
        }
        if current.is_some() {
            return Err("unterminated block".into());
        }
        Ok(m)
    }

    fn parse_xml(text: &str) -> Result<Self, String> {
        let doc = ndm_xml::parse(text)?;
        let root = unwrap_ndm(&doc, "ocm")?;
        let mut m = Self::empty(read_header_xml(root)?);
        let seg = root
            .child("body")
            .and_then(|b| b.child("segment"))
            .ok_or("no <body><segment>")?;
        m.metadata = read_section_xml(seg.child("metadata").ok_or("no <metadata>")?, Block::Meta)?;
        let data = seg.child("data").ok_or("no <data>")?;
        for c in &data.children {
            let kind = [
                OcmBlockKind::Traj,
                OcmBlockKind::Phys,
                OcmBlockKind::Cov,
                OcmBlockKind::Man,
                OcmBlockKind::User,
            ]
            .into_iter()
            .find(|k| k.xml() == c.name)
            .ok_or_else(|| format!("unsupported <{}> in OCM <data>", c.name))?;
            let mut b = OcmBlock::default();
            for e in &c.children {
                match e.name.as_str() {
                    "COMMENT" => b.section.comments.push(e.text.clone()),
                    "USER_DEFINED" if kind == OcmBlockKind::User => {
                        let p = e
                            .attr("parameter")
                            .ok_or("<USER_DEFINED> without parameter")?;
                        b.section.items.push((p.to_string(), e.text.clone()));
                    }
                    n if Some(n) == kind.line_tag() => b
                        .lines
                        .push(e.text.split_whitespace().map(str::to_string).collect()),
                    n => b.section.items.push((n.to_string(), e.text.clone())),
                }
            }
            m.add(kind, b)?;
        }
        Ok(m)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn header(v: &str) -> OdmHeader {
        OdmHeader {
            version: v.into(),
            comments: vec!["unit test".into()],
            classification: None,
            creation_date: "2026-10-14T00:00:00".into(),
            originator: "KSHANA".into(),
            message_id: None,
        }
    }

    fn sample_opm() -> OpmMessage {
        let mut meta = Section::new();
        meta.set("OBJECT_NAME", "SAT")
            .set("OBJECT_ID", "2026-001A")
            .set("CENTER_NAME", "EARTH")
            .set("REF_FRAME", "EME2000")
            .set("TIME_SYSTEM", "UTC");
        let mut state = Section::new();
        state.comments.push("state".into());
        state.set("EPOCH", "2026-01-01T00:00:00");
        for (k, v) in ["X", "Y", "Z", "X_DOT", "Y_DOT", "Z_DOT"]
            .iter()
            .zip([7000.0, 1.5, -3.25, 0.001, 7.5, 1e-7])
        {
            state.set_num(k, v);
        }
        let mut cov = Section::new();
        for (i, k) in COV_TERMS.iter().enumerate() {
            cov.set_num(k, 1e-3 * (i as f64 + 1.0));
        }
        let mut man = Section::new();
        for (k, v) in [
            ("MAN_EPOCH_IGNITION", "2026-01-01T01:00:00"),
            ("MAN_DURATION", "10.0"),
            ("MAN_DELTA_MASS", "-0.5"),
            ("MAN_REF_FRAME", "RTN"),
            ("MAN_DV_1", "0.001"),
            ("MAN_DV_2", "0.0"),
            ("MAN_DV_3", "0.0"),
        ] {
            man.set(k, v);
        }
        let mut user = Section::new();
        user.set("FOO", "bar baz");
        OpmMessage {
            header: header("3.0"),
            metadata: meta,
            state,
            keplerian: None,
            spacecraft: None,
            covariance: Some(cov),
            maneuvers: vec![man.clone(), man],
            user: Some(user),
        }
    }

    #[test]
    fn opm_round_trips_in_kvn_and_xml() {
        let m = sample_opm();
        let kvn = m.to_kvn().unwrap();
        assert!(kvn.contains("USER_DEFINED_FOO"), "{kvn}");
        assert_eq!(OpmMessage::parse(&kvn).unwrap(), m);
        let xml = m.to_xml().unwrap();
        assert!(xml.contains("<USER_DEFINED parameter=\"FOO\">bar baz</USER_DEFINED>"));
        assert_eq!(OpmMessage::parse(&xml).unwrap(), m);
    }

    #[test]
    fn writers_refuse_foreign_or_missing_keywords() {
        let mut m = sample_opm();
        m.state.set("MEAN_MOTION", "1");
        assert!(m.to_kvn().is_err());
        let mut m = sample_opm();
        m.state.items.retain(|(k, _)| k != "Z");
        assert!(m.to_xml().is_err());
        let mut m = sample_opm();
        m.header.version = "2.0".into();
        m.header.message_id = Some("X".into());
        assert!(m.to_kvn().is_err());
    }

    #[test]
    fn omm_from_tle_round_trips_at_full_precision() {
        let block = "ISS (ZARYA)\n\
            1 25544U 98067A   24001.00000000  .00000000  00000-0  00000-0 0  9990\n\
            2 25544  51.6400 247.4627 0006703 130.5360 325.0288 15.72125391563537";
        let f = &crate::omm::OmmFile::from_tle_block(block, "KSHANA", "2024-01-01T00:00:00")
            .unwrap()[0];
        let m = OmmMessage::from_omm_file(f);
        let kvn = m.to_kvn().unwrap();
        let back = OmmMessage::parse(&kvn).unwrap();
        assert_eq!(back, m);
        let n: f64 = back.mean_elements.num("MEAN_MOTION").unwrap().unwrap();
        assert_eq!(n, f.mean_motion_rev_day);
        assert_eq!(OmmMessage::parse(&m.to_xml().unwrap()).unwrap(), m);
    }

    #[test]
    fn ocm_round_trips_and_checks_line_widths() {
        let mut meta = Section::new();
        meta.set("TIME_SYSTEM", "UTC")
            .set("EPOCH_TZERO", "2026-01-01T00:00:00");
        let mut traj = OcmBlock::default();
        traj.section
            .set("CENTER_NAME", "EARTH")
            .set("TRAJ_REF_FRAME", "EME2000")
            .set("TRAJ_TYPE", "CARTPV");
        traj.section.comments.push("t".into());
        traj.push_line("0.0", &[7000.0, 0.0, 0.0, 0.0, 7.5, 0.0]);
        traj.push_line("60.0", &[6999.0, 450.0, 0.0, -0.1, 7.5, 0.0]);
        let mut user = OcmBlock::default();
        user.section.set("K", "v");
        let m = OcmMessage {
            header: header("3.0"),
            metadata: meta,
            traj: vec![traj],
            phys: None,
            cov: vec![],
            man: vec![],
            user: Some(user),
        };
        assert_eq!(OcmMessage::parse(&m.to_kvn().unwrap()).unwrap(), m);
        assert_eq!(OcmMessage::parse(&m.to_xml().unwrap()).unwrap(), m);
        let mut bad = m.clone();
        bad.traj[0].lines[0].pop();
        assert!(bad.to_kvn().is_err());
    }
}
