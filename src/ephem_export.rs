// SPDX-License-Identifier: AGPL-3.0-only
//! Export of a tabulated trajectory to the files flight-dynamics tools read: a CCSDS Orbit
//! Ephemeris Message (OEM, KVN), a CCSDS Orbit Parameter Message (OPM, KVN) and a NAIF SPICE
//! SPK kernel of type 13 (Hermite interpolation, unequal steps) or type 9 (Lagrange).
//!
//! The input is a JPL Horizons vector table (`Output type: GEOMETRIC cartesian states`,
//! `Output format: 2`, `Output units: KM-S`, the CSV form between `$$SOE` and `$$EOE`), as used
//! by the mission thread (`tests/fixtures/capstone_horizons/`). The target, the centre and their
//! NAIF ids, the reference frame and the time scale (`TDB`) are read from the table's header.
//!
//! The states are written exactly as read: the OEM and OPM carry every value in shortest
//! round-trip decimal form, so a reader that parses them as IEEE doubles gets back the same bits
//! the table gave; the SPK stores the same doubles, so the records read back bit for bit. The
//! epochs are the table's calendar epochs on its own scale (TDB), copied as written, and in the
//! SPK the TDB seconds past J2000 of those labels ([`crate::spk_writer::et_from_label`]).
//!
//! Frames: Horizons' `ICRF` is written as `ICRF` in the OEM and OPM. In the SPK it is frame code 1
//! (`J2000`), the code SPICE kernels of ICRF-referred ephemerides use; no rotation is applied.
//!
//! Determinism: `CREATION_DATE` is the request time printed in the table's header (Horizons
//! writes it in its banner line), or a value the caller gives; never the wall clock.

use crate::spk_writer::{et_from_label, InterpolatedSpk, SpkFile, SpkSegment, SpkType};

/// A trajectory read from a state table: one object about one centre, on one time scale.
#[derive(Clone, Debug, PartialEq)]
pub struct StateTable {
    /// Object name (`CAPSTONE`).
    pub object_name: String,
    /// NAIF id of the object (`-1176`).
    pub object_naif: i32,
    /// Centre name in CCSDS spelling (`MOON`).
    pub center_name: String,
    /// NAIF id of the centre (`301`).
    pub center_naif: i32,
    /// Reference frame as the table names it (`ICRF`).
    pub ref_frame: String,
    /// Time scale of the epochs (`TDB`).
    pub time_system: String,
    /// Creation date for the message headers, `YYYY-MM-DDTHH:MM:SS`, if the table carries one.
    pub creation_date: Option<String>,
    /// Epochs as calendar labels `YYYY-MM-DDTHH:MM:SS[.f]` on [`StateTable::time_system`].
    pub epochs: Vec<String>,
    /// States at the epochs: x, y, z (km), vx, vy, vz (km/s).
    pub states: Vec<[f64; 6]>,
}

/// The output format of [`export`].
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ExportFormat {
    /// CCSDS OEM 2.0, KVN.
    Oem,
    /// CCSDS OPM 3.0, KVN: one state, chosen by index.
    Opm,
    /// NAIF SPK, type 13 or 9.
    Spk,
}

impl ExportFormat {
    /// Parse `oem`, `opm` or `spk`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "oem" => Ok(Self::Oem),
            "opm" => Ok(Self::Opm),
            "spk" | "bsp" => Ok(Self::Spk),
            o => Err(crate::terr!("e-ephem-export-unknown-format", o = o)),
        }
    }
}

/// Settings of [`export`].
#[derive(Clone, Debug, PartialEq)]
pub struct ExportOptions {
    /// Output format.
    pub format: ExportFormat,
    /// OPM: the index of the state to write (0 = the first).
    pub index: usize,
    /// SPK: the interpolation type (type 13 or type 9).
    pub spk_type: SpkType,
    /// SPK: the polynomial degree (odd for type 13).
    pub degree: usize,
    /// `CREATION_DATE` for the OEM and OPM, overriding the table's own.
    pub creation_date: Option<String>,
    /// `OBJECT_ID` for the OEM and OPM; the NAIF id when not given.
    pub object_id: Option<String>,
}

impl Default for ExportOptions {
    fn default() -> Self {
        Self {
            format: ExportFormat::Oem,
            index: 0,
            spk_type: SpkType::Hermite13,
            degree: 7,
            creation_date: None,
            object_id: None,
        }
    }
}

impl ExportOptions {
    /// Options from plain values, as the CLI, Python, WebAssembly and MCP pass them: `format`
    /// `oem`, `opm` or `spk`; `spk_type` 13 or 9.
    pub fn from_parts(
        format: &str,
        index: usize,
        spk_type: u32,
        degree: usize,
        creation_date: Option<String>,
        object_id: Option<String>,
    ) -> Result<Self, String> {
        let spk_type = match spk_type {
            13 => SpkType::Hermite13,
            9 => SpkType::Lagrange9,
            _ => return Err(crate::terr!("e-ephem-export-spk-type")),
        };
        Ok(Self {
            format: ExportFormat::parse(format)?,
            index,
            spk_type,
            degree,
            creation_date: creation_date.filter(|s| !s.is_empty()),
            object_id: object_id.filter(|s| !s.is_empty()),
        })
    }

    /// The file suffix of the format (`oem`, `opm`, `bsp`).
    pub fn suffix(&self) -> &'static str {
        match self.format {
            ExportFormat::Oem => "oem",
            ExportFormat::Opm => "opm",
            ExportFormat::Spk => "bsp",
        }
    }
}

/// The CCSDS name of a Horizons body name, upper case (`Moon` -> `MOON`, `Earth-Moon Barycenter`
/// -> `EARTH-MOON BARYCENTER`).
fn ccsds_body(name: &str) -> String {
    name.trim().to_ascii_uppercase()
}

/// Split `Name (kind) (id)` into the name and the last parenthesised integer.
fn name_and_id(v: &str) -> Option<(String, i32)> {
    let v = v.split('{').next().unwrap_or(v).trim();
    let open = v.rfind('(')?;
    let close = v[open..].find(')')? + open;
    let id: i32 = v[open + 1..close].trim().parse().ok()?;
    let mut name = v[..open].trim().to_string();
    // Drop a kind such as "(spacecraft)" left before the id.
    if let Some(o) = name.rfind('(') {
        if name.ends_with(')') {
            name = name[..o].trim().to_string();
        }
    }
    Some((name, id))
}

const MONTHS: [&str; 12] = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
];

fn month_number(m: &str) -> Option<u32> {
    MONTHS.iter().position(|x| *x == m).map(|i| i as u32 + 1)
}

/// `A.D. 2023-Mar-01 00:10:00.0000` -> `2023-03-01T00:10:00.0000`.
fn horizons_calendar(s: &str) -> Option<String> {
    let s = s.trim();
    let s = s.strip_prefix("A.D.").unwrap_or(s).trim();
    let (date, time) = s.split_once(' ')?;
    let mut d = date.split('-');
    let (y, m, day) = (d.next()?, d.next()?, d.next()?);
    let year: i32 = y.parse().ok()?;
    let month = month_number(m)?;
    let day: u32 = day.parse().ok()?;
    let time = time.trim();
    if time.split(':').count() != 3 {
        return None;
    }
    Some(format!("{year:04}-{month:02}-{day:02}T{time}"))
}

/// The request time of the banner line `Ephemeris / API_USER Tue Oct 13 12:40:10 2026 Pasadena`.
fn banner_date(line: &str) -> Option<String> {
    let f: Vec<&str> = line.split_whitespace().collect();
    let i = f.iter().position(|w| month_number(w).is_some())?;
    let month = month_number(f[i])?;
    let day: u32 = f.get(i + 1)?.parse().ok()?;
    let time = *f.get(i + 2)?;
    let year: i32 = f.get(i + 3)?.parse().ok()?;
    if time.split(':').count() != 3 {
        return None;
    }
    Some(format!("{year:04}-{month:02}-{day:02}T{time}"))
}

/// Read a JPL Horizons vector table (CSV form, position and velocity, km and km/s).
pub fn parse_horizons_vectors(text: &str) -> Result<StateTable, String> {
    let mut object: Option<(String, i32)> = None;
    let mut centre: Option<(String, i32)> = None;
    let mut frame: Option<String> = None;
    let mut units: Option<String> = None;
    let mut creation_date = None;
    let mut time_system: Option<String> = None;
    let mut epochs = Vec::new();
    let mut states = Vec::new();
    let mut in_data = false;
    let mut ended = false;
    for (n, raw) in text.lines().enumerate() {
        let line = raw.trim();
        if line == "$$SOE" {
            in_data = true;
            continue;
        }
        if line == "$$EOE" {
            ended = true;
            break;
        }
        if !in_data {
            if let Some((k, v)) = line.split_once(':') {
                let v = v.trim();
                match k.trim() {
                    "Target body name" => object = name_and_id(v),
                    "Center body name" => centre = name_and_id(v),
                    "Reference frame" => frame = Some(v.to_string()),
                    "Output units" => units = Some(v.to_string()),
                    "Start time" => {
                        time_system = v.split_whitespace().last().map(str::to_string);
                    }
                    _ => {}
                }
            }
            if line.starts_with("Ephemeris /") && creation_date.is_none() {
                creation_date = banner_date(line);
            }
            continue;
        }
        if line.is_empty() {
            continue;
        }
        let f: Vec<&str> = line
            .split(',')
            .map(str::trim)
            .filter(|s| !s.is_empty())
            .collect();
        if f.len() < 8 {
            return Err(crate::terr!(
                "e-ephem-export-horizons-row-fields",
                line = n + 1,
                f = f.len()
            ));
        }
        let epoch = horizons_calendar(f[1])
            .ok_or_else(|| crate::terr!("e-ephem-export-horizons-bad-date", line = n + 1))?;
        let mut st = [0.0f64; 6];
        for (x, v) in st.iter_mut().zip(&f[2..8]) {
            *x = v
                .parse::<f64>()
                .ok()
                .filter(|x| x.is_finite())
                .ok_or_else(|| {
                    crate::terr!("e-ephem-export-horizons-bad-number", line = n + 1, v = v)
                })?;
        }
        epochs.push(epoch);
        states.push(st);
    }
    if !in_data || !ended {
        return Err(crate::terr!("e-ephem-export-horizons-no-table"));
    }
    if states.is_empty() {
        return Err(crate::terr!("e-ephem-export-horizons-empty"));
    }
    if units.as_deref() != Some("KM-S") {
        return Err(crate::terr!(
            "e-ephem-export-horizons-units",
            u = units.unwrap_or_default()
        ));
    }
    let time_system = time_system.unwrap_or_default();
    if time_system != "TDB" {
        return Err(crate::terr!(
            "e-ephem-export-horizons-time-scale",
            t = time_system
        ));
    }
    let (object_name, object_naif) = object
        .ok_or_else(|| crate::terr!("e-ephem-export-horizons-header", k = "Target body name"))?;
    let (centre_name, center_naif) = centre
        .ok_or_else(|| crate::terr!("e-ephem-export-horizons-header", k = "Center body name"))?;
    let ref_frame = frame
        .ok_or_else(|| crate::terr!("e-ephem-export-horizons-header", k = "Reference frame"))?;
    Ok(StateTable {
        object_name: ccsds_body(&object_name),
        object_naif,
        center_name: ccsds_body(&centre_name),
        center_naif,
        ref_frame: ref_frame.to_ascii_uppercase(),
        time_system,
        creation_date,
        epochs,
        states,
    })
}

/// Shortest round-trip decimal of a double.
fn num(x: f64) -> String {
    format!("{x:?}")
}

fn header_fields(t: &StateTable, o: &ExportOptions) -> Result<(String, String), String> {
    let created = o
        .creation_date
        .clone()
        .or_else(|| t.creation_date.clone())
        .ok_or_else(|| crate::terr!("e-ephem-export-no-creation-date"))?;
    let id = o
        .object_id
        .clone()
        .unwrap_or_else(|| t.object_naif.to_string());
    Ok((created, id))
}

/// The table as a CCSDS OEM 2.0 message (KVN): one segment, every state, shortest round-trip
/// values.
pub fn to_oem(t: &StateTable, o: &ExportOptions) -> Result<String, String> {
    let (created, id) = header_fields(t, o)?;
    let (first, last) = (&t.epochs[0], &t.epochs[t.epochs.len() - 1]);
    let mut out = String::new();
    for (k, v) in [
        ("CCSDS_OEM_VERS", "2.0"),
        ("CREATION_DATE", created.as_str()),
        ("ORIGINATOR", "KSHANA"),
    ] {
        out.push_str(&format!("{k} = {v}\n"));
    }
    out.push_str("\nMETA_START\n");
    for (k, v) in [
        ("OBJECT_NAME", t.object_name.as_str()),
        ("OBJECT_ID", id.as_str()),
        ("CENTER_NAME", t.center_name.as_str()),
        ("REF_FRAME", t.ref_frame.as_str()),
        ("TIME_SYSTEM", t.time_system.as_str()),
        ("START_TIME", first.as_str()),
        ("STOP_TIME", last.as_str()),
    ] {
        out.push_str(&format!("{k} = {v}\n"));
    }
    out.push_str("META_STOP\n\n");
    for (e, s) in t.epochs.iter().zip(&t.states) {
        out.push_str(e);
        for v in s {
            out.push(' ');
            out.push_str(&num(*v));
        }
        out.push('\n');
    }
    Ok(out)
}

/// One state of the table as a CCSDS OPM 3.0 message (KVN).
pub fn to_opm(t: &StateTable, o: &ExportOptions) -> Result<String, String> {
    use crate::odm::{OdmHeader, OpmMessage, Section};
    let (created, id) = header_fields(t, o)?;
    let s = t.states.get(o.index).ok_or_else(|| {
        crate::terr!(
            "e-ephem-export-opm-index",
            i = o.index,
            total = t.states.len()
        )
    })?;
    let mut metadata = Section::new();
    metadata
        .set("OBJECT_NAME", t.object_name.clone())
        .set("OBJECT_ID", id)
        .set("CENTER_NAME", t.center_name.clone())
        .set("REF_FRAME", t.ref_frame.clone())
        .set("TIME_SYSTEM", t.time_system.clone());
    let mut state = Section::new();
    state.set("EPOCH", t.epochs[o.index].clone());
    for (k, v) in ["X", "Y", "Z", "X_DOT", "Y_DOT", "Z_DOT"].iter().zip(s) {
        state.set_num(k, *v);
    }
    OpmMessage {
        header: OdmHeader {
            version: "3.0".to_string(),
            comments: vec![],
            classification: None,
            creation_date: created,
            originator: "KSHANA".to_string(),
            message_id: None,
        },
        metadata,
        state,
        keplerian: None,
        spacecraft: None,
        covariance: None,
        maneuvers: vec![],
        user: None,
    }
    .to_kvn()
}

/// The NAIF frame code of a table's frame (ICRF and J2000 are both code 1).
fn spk_frame(name: &str) -> Result<i32, String> {
    match name.trim().to_ascii_uppercase().as_str() {
        "ICRF" => Ok(1),
        other => crate::spk_writer::frame_code(other),
    }
}

/// The table as an SPK segment.
pub fn to_spk_segment(t: &StateTable, o: &ExportOptions) -> Result<SpkSegment, String> {
    let epochs = t
        .epochs
        .iter()
        .map(|e| et_from_label(e, &t.time_system))
        .collect::<Result<Vec<f64>, String>>()?;
    let seg = SpkSegment {
        target: t.object_naif,
        centre: t.center_naif,
        frame: spk_frame(&t.ref_frame)?,
        kind: o.spk_type,
        degree: o.degree,
        start: epochs[0],
        end: epochs[epochs.len() - 1],
        name: t.object_name.chars().take(40).collect(),
        epochs,
        states: t.states.clone(),
        records: vec![],
        init: 0.0,
        intlen: 0.0,
    };
    seg.validate()?;
    Ok(seg)
}

/// The table as an SPK kernel (bytes).
pub fn to_spk(t: &StateTable, o: &ExportOptions) -> Result<Vec<u8>, String> {
    if !matches!(o.spk_type, SpkType::Hermite13 | SpkType::Lagrange9) {
        return Err(crate::terr!("e-ephem-export-spk-type"));
    }
    SpkFile {
        ifname: format!("KSHANA {}", t.object_name),
        ncomch: 0,
        comments: vec![],
        segments: vec![to_spk_segment(t, o)?],
    }
    .to_bytes()
}

/// Write the table in the chosen format.
pub fn export(t: &StateTable, o: &ExportOptions) -> Result<Vec<u8>, String> {
    match o.format {
        ExportFormat::Oem => to_oem(t, o).map(String::into_bytes),
        ExportFormat::Opm => to_opm(t, o).map(String::into_bytes),
        ExportFormat::Spk => to_spk(t, o),
    }
}

/// The comparison of a written file, read back by Kshana's own readers, with the states written.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct ReadBack {
    /// States compared.
    pub states: usize,
    /// States whose six values read back with the same bits as written.
    pub identical: usize,
    /// Largest position difference, km.
    pub max_position_km: f64,
    /// Largest velocity difference, km/s.
    pub max_velocity_km_s: f64,
    /// Epochs that read back differently (as seconds past J2000 on the table's scale).
    pub epoch_mismatches: usize,
    /// SPK only: largest position difference of the interpolated state at the node epochs, km.
    pub interpolated_max_position_km: Option<f64>,
    /// SPK only: largest velocity difference of the interpolated state at the node epochs, km/s.
    pub interpolated_max_velocity_km_s: Option<f64>,
}

fn compare(written: &[[f64; 6]], read: &[[f64; 6]], rb: &mut ReadBack) -> Result<(), String> {
    if written.len() != read.len() {
        return Err(crate::terr!(
            "e-ephem-export-read-back-count",
            w = written.len(),
            r = read.len()
        ));
    }
    for (w, r) in written.iter().zip(read) {
        rb.states += 1;
        if w.iter().zip(r).all(|(a, b)| a.to_bits() == b.to_bits()) {
            rb.identical += 1;
        }
        let dp = ((w[0] - r[0]).powi(2) + (w[1] - r[1]).powi(2) + (w[2] - r[2]).powi(2)).sqrt();
        let dv = ((w[3] - r[3]).powi(2) + (w[4] - r[4]).powi(2) + (w[5] - r[5]).powi(2)).sqrt();
        rb.max_position_km = rb.max_position_km.max(dp);
        rb.max_velocity_km_s = rb.max_velocity_km_s.max(dv);
    }
    Ok(())
}

fn data_line_state(f: &[&str]) -> Result<[f64; 6], String> {
    let mut s = [0.0f64; 6];
    for (k, x) in s.iter_mut().enumerate() {
        *x = f
            .get(k + 1)
            .and_then(|v| v.parse().ok())
            .ok_or_else(|| crate::terr!("e-ephem-export-read-back-value"))?;
    }
    Ok(s)
}

/// Read a file written by [`export`] back with Kshana's own readers and compare it with the
/// table: the OEM's data lines, the OPM's state vector, or the SPK's stored records and its
/// interpolated state at each node epoch.
pub fn read_back(t: &StateTable, o: &ExportOptions, bytes: &[u8]) -> Result<ReadBack, String> {
    let mut rb = ReadBack {
        states: 0,
        identical: 0,
        max_position_km: 0.0,
        max_velocity_km_s: 0.0,
        epoch_mismatches: 0,
        interpolated_max_position_km: None,
        interpolated_max_velocity_km_s: None,
    };
    let et = |e: &str| et_from_label(e, &t.time_system);
    match o.format {
        ExportFormat::Oem => {
            let text = std::str::from_utf8(bytes).map_err(|e| e.to_string())?;
            // The ephemeris lines of the single segment: every line after META_STOP.
            let mut after = false;
            let mut read = Vec::new();
            for line in text.lines().map(str::trim) {
                if line == "META_STOP" {
                    after = true;
                    continue;
                }
                if !after || line.is_empty() {
                    continue;
                }
                let f: Vec<&str> = line.split_whitespace().collect();
                let i = read.len();
                if t.epochs.get(i).map(|e| et(e)).transpose()? != Some(et(f[0])?) {
                    rb.epoch_mismatches += 1;
                }
                read.push(data_line_state(&f)?);
            }
            // The standard reader must accept the message too.
            crate::oem::parse_oem(text)?;
            compare(&t.states, &read, &mut rb)?;
        }
        ExportFormat::Opm => {
            let text = std::str::from_utf8(bytes).map_err(|e| e.to_string())?;
            let m = crate::odm::OpmMessage::parse(text)?;
            let mut s = [0.0; 6];
            for (k, key) in ["X", "Y", "Z", "X_DOT", "Y_DOT", "Z_DOT"]
                .iter()
                .enumerate()
            {
                s[k] = m
                    .state
                    .num(key)?
                    .ok_or_else(|| crate::terr!("e-ephem-export-read-back-value"))?;
            }
            let epoch = m.state.get("EPOCH").unwrap_or_default();
            if et(epoch)? != et(&t.epochs[o.index])? {
                rb.epoch_mismatches += 1;
            }
            compare(&t.states[o.index..=o.index], &[s], &mut rb)?;
        }
        ExportFormat::Spk => {
            let spk = InterpolatedSpk::from_bytes(bytes.to_vec())?;
            let seg = spk
                .segments
                .first()
                .ok_or_else(|| crate::terr!("e-ephem-export-read-back-value"))?;
            let (epochs, states) = seg.nodes();
            for (e, w) in t.epochs.iter().zip(epochs) {
                if et(e)?.to_bits() != w.to_bits() {
                    rb.epoch_mismatches += 1;
                }
            }
            compare(&t.states, states, &mut rb)?;
            let (mut dp, mut dv) = (0.0f64, 0.0f64);
            for (e, w) in epochs.iter().zip(&t.states) {
                let r = seg.eval(*e)?;
                dp = dp.max(
                    ((w[0] - r[0]).powi(2) + (w[1] - r[1]).powi(2) + (w[2] - r[2]).powi(2)).sqrt(),
                );
                dv = dv.max(
                    ((w[3] - r[3]).powi(2) + (w[4] - r[4]).powi(2) + (w[5] - r[5]).powi(2)).sqrt(),
                );
            }
            rb.interpolated_max_position_km = Some(dp);
            rb.interpolated_max_velocity_km_s = Some(dv);
        }
    }
    Ok(rb)
}

#[cfg(test)]
mod tests {
    use super::*;

    const MINI: &str = "\
*******************************************************************************
Ephemeris / API_USER Tue Oct 13 12:40:10 2026 Pasadena, USA      / Horizons
*******************************************************************************
Target body name: CAPSTONE (spacecraft) (-1176)   {source: CAPSTONE_merged}
Center body name: Moon (301)                      {source: DE441}
Start time      : A.D. 2023-Mar-01 00:00:00.0000 TDB
Output units    : KM-S
Reference frame : ICRF
$$SOE
2460004.500000000, A.D. 2023-Mar-01 00:00:00.0000, -1.402011259977861E+04,  4.024696708925668E+04, -4.996668907537949E+04,  5.201177298757925E-02,  7.385192463128488E-02, -1.177596557968113E-01,
2460004.506944444, A.D. 2023-Mar-01 00:10:00.0000, -1.398884709586641E+04,  4.029116013845026E+04, -5.003711588458747E+04,  5.220637688183555E-02,  7.345842555313939E-02, -1.169964925191028E-01,
2460004.513888889, A.D. 2023-Mar-01 00:20:00.0000, -1.395746518279873E+04,  4.033511742223808E+04, -5.010708500682608E+04,  5.239980438227978E-02,  7.306603806604131E-02, -1.162340313623057E-01,
2460004.520833333, A.D. 2023-Mar-01 00:30:00.0000, -1.392596756484404E+04,  4.037883960419606E+04, -5.017659686120268E+04,  5.259206071479885E-02,  7.267475093671012E-02, -1.154722651456734E-01,
$$EOE
";

    #[test]
    fn reads_the_header_and_the_rows() {
        let t = parse_horizons_vectors(MINI).unwrap();
        assert_eq!(t.object_name, "CAPSTONE");
        assert_eq!(t.object_naif, -1176);
        assert_eq!(t.center_name, "MOON");
        assert_eq!(t.center_naif, 301);
        assert_eq!(t.ref_frame, "ICRF");
        assert_eq!(t.time_system, "TDB");
        assert_eq!(t.creation_date.as_deref(), Some("2026-10-13T12:40:10"));
        assert_eq!(t.epochs[1], "2023-03-01T00:10:00.0000");
        assert_eq!(t.states[0][0], -1.402011259977861E+04);
        assert_eq!(t.states.len(), 4);
    }

    #[test]
    fn every_format_reads_back_bit_for_bit() {
        let t = parse_horizons_vectors(MINI).unwrap();
        for format in [ExportFormat::Oem, ExportFormat::Opm, ExportFormat::Spk] {
            let o = ExportOptions {
                format,
                degree: 3,
                index: 2,
                ..ExportOptions::default()
            };
            let bytes = export(&t, &o).unwrap();
            let rb = read_back(&t, &o, &bytes).unwrap();
            assert_eq!(rb.identical, rb.states, "{format:?}: {rb:?}");
            assert_eq!(rb.epoch_mismatches, 0, "{format:?}");
            assert_eq!(rb.max_position_km, 0.0);
        }
    }

    #[test]
    fn refuses_what_it_cannot_carry() {
        assert!(parse_horizons_vectors("no table").is_err());
        assert!(parse_horizons_vectors(&MINI.replace("KM-S", "AU-D")).is_err());
        assert!(parse_horizons_vectors(&MINI.replace(" TDB\n", " UT\n")).is_err());
        assert!(ExportFormat::parse("sp3").is_err());
        let t = parse_horizons_vectors(MINI).unwrap();
        let o = ExportOptions {
            format: ExportFormat::Opm,
            index: 9,
            ..ExportOptions::default()
        };
        assert!(export(&t, &o).is_err());
        let o = ExportOptions {
            format: ExportFormat::Spk,
            degree: 4,
            ..ExportOptions::default()
        };
        assert!(export(&t, &o).is_err(), "type 13 needs an odd degree");
    }
}
