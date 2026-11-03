// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana Connect mapping files: any tabular or JSON log into `kshana.obs/1`, with no code
//! (roadmap A2a).
//!
//! A mapping file (`kshana.connect/1`, TOML) says how to read a vendor's export: the container
//! (CSV, TSV, JSON, JSON Lines), which column holds the time and in which form and time scale,
//! and which columns hold the position, the per-satellite carrier-to-noise density, the gain
//! control, the receiver's own interference flags and the DOP, with their units. [`map`] applies
//! it and returns observation records ([`crate::obs::Record`]) that `kshana obs check` accepts.
//!
//! Rows whose time is the same (within `time.group_tolerance_s`) form one epoch, so a "long"
//! export with one row per satellite and a "wide" export with one column per satellite both
//! work. Times must not go backwards; a row that does is an error naming it, never a reorder.
//! Every error names the row (1-based, counting the header line of a CSV) and the column, and
//! nothing is guessed: an empty cell is a missing value, a cell that is not a number is an
//! error. See `docs/CONNECT.md`.

use std::collections::BTreeMap;

use serde::Deserialize;

use crate::obs::{Header, Record, Station, SCHEMA as OBS_SCHEMA};
use crate::receiver_trust::{LogEpoch, ReceiverSelfReport, ReportedDop, ReportedFix, SatCn0};

/// The mapping-file schema this engine reads.
pub const SCHEMA: &str = "kshana.connect/1";

/// A mapping file.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Mapping {
    /// Must be [`SCHEMA`].
    pub schema: String,
    /// How the input is laid out.
    pub source: Source,
    /// Which column holds the time, and how to read it.
    pub time: TimeMap,
    /// The receiver's position, if the export has one.
    #[serde(default)]
    pub fix: Option<FixMap>,
    /// Per-satellite carrier-to-noise density, if the export has it.
    #[serde(default)]
    pub signals: Option<SignalMap>,
    /// Receiver-level readings: gain control, interference indicator, own flags, DOP.
    #[serde(default)]
    pub receiver: ReceiverMap,
}

/// The container and the rows to keep.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Source {
    /// `csv`, `tsv`, `json` or `jsonl`.
    pub format: String,
    /// CSV field separator, one character (default `,`; `tsv` is always a tab).
    #[serde(default)]
    pub delimiter: Option<String>,
    /// Lines to skip before the header (CSV and TSV).
    #[serde(default)]
    pub skip_lines: usize,
    /// Lines starting with this text are ignored (CSV and TSV), for example `#`.
    #[serde(default)]
    pub comment: Option<String>,
    /// JSON only: a JSON pointer to the array of records (`/data/epochs`); default: the
    /// document itself is the array.
    #[serde(default)]
    pub records: Option<String>,
    /// Keep only rows whose `column` equals one of `equals` (a log with several record kinds).
    #[serde(default)]
    pub filter: Option<Filter>,
}

/// A row filter.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Filter {
    /// The column to compare.
    pub column: String,
    /// The values that keep a row.
    pub equals: Vec<String>,
}

/// How the time is stated.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TimeMap {
    /// The column with the time (for `gps-week-tow`, the time-of-week column).
    pub column: String,
    /// `rfc3339`, `unix-s`, `unix-ms`, `gps-s` (seconds since 1980-01-06T00:00:00 GPS),
    /// `gps-week-tow` (with `week_column`, time of week in seconds) or `pattern`.
    pub format: String,
    /// `gps-week-tow`: the column with the GPS week (full week number, not modulo 1024).
    #[serde(default)]
    pub week_column: Option<String>,
    /// `pattern`: a layout with `%Y %m %d %H %M %S` (seconds may have a fraction), for example
    /// `%d/%m/%Y %H:%M:%S`.
    #[serde(default)]
    pub pattern: Option<String>,
    /// The time scale of `rfc3339`, `unix-*` and `pattern` times: `utc` (default), `gps` or
    /// `tai`. `gps-s` and `gps-week-tow` are always GPS time.
    #[serde(default)]
    pub scale: Option<String>,
    /// Rows this close in time (seconds) are one epoch. Default 0.0005 s.
    #[serde(default)]
    pub group_tolerance_s: Option<f64>,
}

/// One value: a column, with an optional unit and linear correction (`value * scale + offset`,
/// applied after the unit).
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Field {
    /// The column (CSV header name, or JSON key; a JSON pointer starting with `/` reaches into
    /// nested objects).
    pub column: String,
    /// The unit the export uses; see each field for what is accepted.
    #[serde(default)]
    pub unit: Option<String>,
    /// Multiply by this after the unit conversion.
    #[serde(default)]
    pub scale: Option<f64>,
    /// Add this after the scale.
    #[serde(default)]
    pub offset: Option<f64>,
}

/// The receiver's position.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FixMap {
    /// Latitude (`deg` default, or `rad`).
    pub lat: Field,
    /// Longitude (`deg` default, or `rad`).
    pub lon: Field,
    /// Height (`m` default, `ft` or `km`); 0 when absent.
    #[serde(default)]
    pub height: Option<Field>,
    /// Satellites used.
    #[serde(default)]
    pub n_used: Option<Field>,
}

/// Per-satellite C/N0, in one of two layouts.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SignalMap {
    /// Long layout: one row per satellite. The satellite's identity.
    #[serde(default)]
    pub sat: Option<SatId>,
    /// Long layout: the C/N0 column (`dB-Hz`).
    #[serde(default)]
    pub cn0: Option<Field>,
    /// Long layout: the column naming the signal or band (`L1`, `S1C`, ...).
    #[serde(default)]
    pub band_column: Option<String>,
    /// The band label when the export has none (default `L1`).
    #[serde(default)]
    pub band: Option<String>,
    /// Wide layout: satellite (RINEX style, `G05`) to the column holding its C/N0.
    #[serde(default)]
    pub wide: BTreeMap<String, String>,
}

/// How to name a satellite in RINEX style (`G05`).
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SatId {
    /// A column that already holds `G05`-style names (`G5` and `G 5` are accepted).
    #[serde(default)]
    pub column: Option<String>,
    /// Or: the column holding the satellite number within its system.
    #[serde(default)]
    pub number_column: Option<String>,
    /// With `number_column`: one system letter for every row (`G`)...
    #[serde(default)]
    pub system: Option<String>,
    /// ...or a column holding the system, translated through `system_map` (for example an
    /// Android constellation code: `1 = "G"`, `3 = "R"`, `5 = "C"`, `6 = "E"`).
    #[serde(default)]
    pub system_column: Option<String>,
    /// The translation for `system_column`; a value without an entry skips the row's signal.
    #[serde(default)]
    pub system_map: BTreeMap<String, String>,
}

/// Receiver-level readings.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReceiverMap {
    /// Gain control, in the receiver's native units.
    #[serde(default)]
    pub agc: Option<Field>,
    /// Interference indicator, native units.
    #[serde(default)]
    pub jam_ind: Option<Field>,
    /// The receiver's own spoofing flag (0 unknown, 1 none, 2 indicated, 3 affirmed).
    #[serde(default)]
    pub spoofing: Option<Field>,
    /// The receiver's own jamming flag (same codes).
    #[serde(default)]
    pub jamming: Option<Field>,
    /// Reported PDOP.
    #[serde(default)]
    pub pdop: Option<Field>,
    /// Reported HDOP.
    #[serde(default)]
    pub hdop: Option<Field>,
    /// Reported VDOP.
    #[serde(default)]
    pub vdop: Option<Field>,
}

/// Parse and check a mapping file.
pub fn parse_mapping(text: &str) -> Result<Mapping, String> {
    let m: Mapping = toml::from_str(text)
        .map_err(|e| crate::terr!("e-connect-bad-mapping", e = e.to_string()))?;
    if m.schema != SCHEMA {
        return Err(crate::terr!(
            "e-connect-schema",
            schema = m.schema.clone(),
            want = SCHEMA
        ));
    }
    if !matches!(m.source.format.as_str(), "csv" | "tsv" | "json" | "jsonl") {
        return Err(crate::terr!(
            "e-connect-unknown-format",
            format = m.source.format.clone()
        ));
    }
    if !matches!(
        m.time.format.as_str(),
        "rfc3339" | "unix-s" | "unix-ms" | "gps-s" | "gps-week-tow" | "pattern"
    ) {
        return Err(crate::terr!(
            "e-connect-unknown-time-format",
            format = m.time.format.clone()
        ));
    }
    if m.time.format == "gps-week-tow" && m.time.week_column.is_none() {
        return Err(crate::terr!("e-connect-time-needs", what = "week_column"));
    }
    if m.time.format == "pattern" && m.time.pattern.is_none() {
        return Err(crate::terr!("e-connect-time-needs", what = "pattern"));
    }
    if let Some(s) = &m.time.scale {
        if !matches!(s.as_str(), "utc" | "gps" | "tai") {
            return Err(crate::terr!("e-connect-unknown-scale", scale = s.clone()));
        }
    }
    if let Some(d) = &m.source.delimiter {
        if d.chars().count() != 1 {
            return Err(crate::terr!("e-connect-delimiter", delimiter = d.clone()));
        }
    }
    if let Some(f) = &m.fix {
        unit_factor(&f.lat, "fix.lat", ANGLE)?;
        unit_factor(&f.lon, "fix.lon", ANGLE)?;
        if let Some(h) = &f.height {
            unit_factor(h, "fix.height", LENGTH)?;
        }
    }
    if let Some(s) = &m.signals {
        if let Some(c) = &s.cn0 {
            unit_factor(c, "signals.cn0", CN0)?;
        }
        if s.sat.is_some() != s.cn0.is_some() {
            return Err(crate::terr!("e-connect-signals-layout"));
        }
        if s.sat.is_none() && s.wide.is_empty() {
            return Err(crate::terr!("e-connect-signals-layout"));
        }
        if let Some(id) = &s.sat {
            let ok = id.column.is_some()
                || (id.number_column.is_some()
                    && (id.system.is_some() || id.system_column.is_some()));
            if !ok {
                return Err(crate::terr!("e-connect-sat-id"));
            }
        }
        for sat in s.wide.keys() {
            if normalise_sat(sat).is_none() {
                return Err(crate::terr!("e-connect-bad-sat-name", sat = sat.clone()));
            }
        }
    }
    Ok(m)
}

/// Accepted units and their factor to the canonical unit.
type Units = &'static [(&'static str, f64)];
const ANGLE: Units = &[("deg", 1.0), ("rad", 57.295_779_513_082_32)];
const LENGTH: Units = &[("m", 1.0), ("ft", 0.3048), ("km", 1000.0)];
const CN0: Units = &[("dB-Hz", 1.0), ("dBHz", 1.0)];

fn unit_factor(f: &Field, name: &str, units: Units) -> Result<f64, String> {
    match &f.unit {
        None => Ok(1.0),
        Some(u) => units
            .iter()
            .find(|(n, _)| n == u)
            .map(|(_, k)| *k)
            .ok_or_else(|| {
                crate::terr!(
                    "e-connect-unknown-unit",
                    field = name,
                    unit = u.clone(),
                    accepted = units.iter().map(|(n, _)| *n).collect::<Vec<_>>().join(", ")
                )
            }),
    }
}

/// One input row: the line it came from (1-based) and its cells by column name.
struct Row {
    line: usize,
    cells: Cells,
}

enum Cells {
    Csv(BTreeMap<String, String>),
    Json(serde_json::Value),
}

impl Row {
    /// The cell's text, or `None` when the column is absent or the cell empty / null.
    fn text(&self, column: &str) -> Option<String> {
        match &self.cells {
            Cells::Csv(m) => m.get(column).map(|s| s.trim().to_string()),
            Cells::Json(v) => {
                let x = if column.starts_with('/') {
                    v.pointer(column)
                } else {
                    v.get(column)
                }?;
                match x {
                    serde_json::Value::Null => None,
                    serde_json::Value::String(s) => Some(s.trim().to_string()),
                    other => Some(other.to_string()),
                }
            }
        }
        .filter(|s| !s.is_empty())
    }

    fn has_column(&self, column: &str) -> bool {
        match &self.cells {
            Cells::Csv(m) => m.contains_key(column),
            Cells::Json(_) => true,
        }
    }

    fn number(&self, column: &str) -> Result<Option<f64>, String> {
        match self.text(column) {
            None => Ok(None),
            Some(t) => t
                .parse::<f64>()
                .ok()
                .filter(|v| v.is_finite())
                .map(Some)
                .ok_or_else(|| {
                    crate::terr!(
                        "e-connect-bad-number",
                        line = self.line.to_string(),
                        column = column.to_string(),
                        value = t
                    )
                }),
        }
    }

    fn field(&self, f: &Field, factor: f64) -> Result<Option<f64>, String> {
        Ok(self
            .number(&f.column)?
            .map(|v| v * factor * f.scale.unwrap_or(1.0) + f.offset.unwrap_or(0.0)))
    }
}

/// Split one CSV line (RFC 4180 quoting: `"a,b"` and `""` inside quotes). `Err` on an
/// unterminated quote.
fn split_csv(line: &str, delim: char) -> Result<Vec<String>, ()> {
    let mut out = Vec::new();
    let mut cur = String::new();
    let mut quoted = false;
    let mut chars = line.chars().peekable();
    while let Some(c) = chars.next() {
        if quoted {
            if c == '"' {
                if chars.peek() == Some(&'"') {
                    cur.push('"');
                    chars.next();
                } else {
                    quoted = false;
                }
            } else {
                cur.push(c);
            }
        } else if c == '"' && cur.trim().is_empty() {
            cur.clear();
            quoted = true;
        } else if c == delim {
            out.push(std::mem::take(&mut cur));
        } else {
            cur.push(c);
        }
    }
    if quoted {
        return Err(());
    }
    out.push(cur);
    Ok(out)
}

fn read_rows(m: &Mapping, text: &str) -> Result<Vec<Row>, String> {
    let mut rows = match m.source.format.as_str() {
        "csv" | "tsv" => {
            let delim = if m.source.format == "tsv" {
                '\t'
            } else {
                m.source
                    .delimiter
                    .as_deref()
                    .and_then(|d| d.chars().next())
                    .unwrap_or(',')
            };
            let mut header: Option<Vec<String>> = None;
            let mut rows = Vec::new();
            for (i, raw) in text.lines().enumerate().skip(m.source.skip_lines) {
                let line = raw.trim_end_matches('\r');
                if line.trim().is_empty()
                    || m.source
                        .comment
                        .as_deref()
                        .is_some_and(|c| !c.is_empty() && line.starts_with(c))
                {
                    continue;
                }
                let cells = split_csv(line, delim).map_err(|()| {
                    crate::terr!("e-connect-csv-quote", line = (i + 1).to_string())
                })?;
                match &header {
                    None => {
                        header = Some(cells.into_iter().map(|c| c.trim().to_string()).collect())
                    }
                    Some(h) => {
                        let map = h.iter().cloned().zip(cells).collect::<BTreeMap<_, _>>();
                        rows.push(Row {
                            line: i + 1,
                            cells: Cells::Csv(map),
                        });
                    }
                }
            }
            rows
        }
        "jsonl" => {
            let mut rows = Vec::new();
            for (i, line) in text.lines().enumerate() {
                if line.trim().is_empty() {
                    continue;
                }
                let v: serde_json::Value = serde_json::from_str(line).map_err(|e| {
                    crate::terr!(
                        "e-connect-bad-json",
                        line = (i + 1).to_string(),
                        e = e.to_string()
                    )
                })?;
                rows.push(Row {
                    line: i + 1,
                    cells: Cells::Json(v),
                });
            }
            rows
        }
        _ => {
            let doc: serde_json::Value = serde_json::from_str(text).map_err(|e| {
                crate::terr!(
                    "e-connect-bad-json",
                    line = e.line().to_string(),
                    e = e.to_string()
                )
            })?;
            let arr = match &m.source.records {
                Some(p) => doc.pointer(p),
                None => Some(&doc),
            }
            .and_then(|v| v.as_array())
            .ok_or_else(|| {
                crate::terr!(
                    "e-connect-json-records",
                    path = m.source.records.clone().unwrap_or_else(|| "/".into())
                )
            })?;
            arr.iter()
                .enumerate()
                .map(|(i, v)| Row {
                    line: i + 1,
                    cells: Cells::Json(v.clone()),
                })
                .collect()
        }
    };
    if let Some(f) = &m.source.filter {
        rows.retain(|r| r.text(&f.column).is_some_and(|v| f.equals.contains(&v)));
    }
    if rows.is_empty() {
        return Err(crate::terr!("e-connect-no-rows"));
    }
    // A CSV whose header lacks a mapped column is a mapping error, not missing data.
    if let Cells::Csv(_) = rows[0].cells {
        for c in mapped_columns(m) {
            if !rows[0].has_column(&c) {
                return Err(crate::terr!("e-connect-missing-column", column = c));
            }
        }
    }
    Ok(rows)
}

fn mapped_columns(m: &Mapping) -> Vec<String> {
    let mut c = vec![m.time.column.clone()];
    c.extend(m.time.week_column.clone());
    if let Some(f) = &m.fix {
        c.push(f.lat.column.clone());
        c.push(f.lon.column.clone());
        c.extend(f.height.as_ref().map(|h| h.column.clone()));
        c.extend(f.n_used.as_ref().map(|h| h.column.clone()));
    }
    if let Some(s) = &m.signals {
        if let Some(id) = &s.sat {
            c.extend(id.column.clone());
            c.extend(id.number_column.clone());
            c.extend(id.system_column.clone());
        }
        c.extend(s.cn0.as_ref().map(|f| f.column.clone()));
        c.extend(s.band_column.clone());
        c.extend(s.wide.values().cloned());
    }
    let r = &m.receiver;
    for f in [
        &r.agc,
        &r.jam_ind,
        &r.spoofing,
        &r.jamming,
        &r.pdop,
        &r.hdop,
        &r.vdop,
    ]
    .into_iter()
    .flatten()
    {
        c.push(f.column.clone());
    }
    c
}

/// Seconds between 1970-01-01 (Unix) and 1980-01-06 (GPS epoch).
const GPS_EPOCH_UNIX: f64 = 315_964_800.0;

/// TAI − UTC at a UTC instant given as Unix seconds.
fn tai_utc(unix_utc: f64) -> f64 {
    crate::timescales::tai_minus_utc(unix_utc / 86_400.0 + 2_440_587.5)
}

/// A time in `scale` (Unix-style seconds counted in that scale) to Unix UTC seconds.
fn to_utc(t: f64, scale: &str) -> f64 {
    let off = match scale {
        "gps" => 19.0,
        "tai" => 0.0,
        _ => return t,
    };
    // t_scale = t_utc + (TAI−UTC) − off; solve by one refinement (leap steps are whole seconds).
    let guess = t - (tai_utc(t) - off);
    t - (tai_utc(guess) - off)
}

fn parse_pattern(text: &str, pattern: &str) -> Option<f64> {
    let (mut y, mut mo, mut d, mut h, mut mi, mut s) = (None, None, None, 0i64, 0i64, 0.0f64);
    let mut rest = text.trim();
    let mut pat = pattern.chars().peekable();
    while let Some(c) = pat.next() {
        if c == '%' {
            let spec = pat.next()?;
            let take = |rest: &mut &str, allow_frac: bool| -> Option<String> {
                let n = rest
                    .char_indices()
                    .take_while(|(_, ch)| ch.is_ascii_digit() || (allow_frac && *ch == '.'))
                    .map(|(i, ch)| i + ch.len_utf8())
                    .last()?;
                let (a, b) = rest.split_at(n);
                *rest = b;
                Some(a.to_string())
            };
            match spec {
                'Y' => y = take(&mut rest, false)?.parse::<i64>().ok(),
                'm' => mo = take(&mut rest, false)?.parse::<i64>().ok(),
                'd' => d = take(&mut rest, false)?.parse::<i64>().ok(),
                'H' => h = take(&mut rest, false)?.parse().ok()?,
                'M' => mi = take(&mut rest, false)?.parse().ok()?,
                'S' => s = take(&mut rest, true)?.parse().ok()?,
                '%' => rest = rest.strip_prefix('%')?,
                _ => return None,
            }
        } else {
            rest = rest.strip_prefix(c)?;
        }
    }
    if !rest.trim().is_empty() {
        return None;
    }
    let iso = format!(
        "{:04}-{:02}-{:02}T{h:02}:{mi:02}:{}",
        y?,
        mo?,
        d?,
        if s < 10.0 {
            format!("0{s}")
        } else {
            s.to_string()
        }
    );
    crate::telemetry::time::parse_rfc3339_utc(&iso)
}

/// The row's instant as Unix UTC seconds.
fn row_time(m: &Mapping, r: &Row) -> Result<f64, String> {
    let bad = |value: String| {
        crate::terr!(
            "e-connect-bad-time",
            line = r.line.to_string(),
            value = value,
            format = m.time.format.clone()
        )
    };
    let raw = r.text(&m.time.column).ok_or_else(|| bad(String::new()))?;
    let scale = m.time.scale.as_deref().unwrap_or("utc");
    let num = || raw.parse::<f64>().ok().filter(|v| v.is_finite());
    let t = match m.time.format.as_str() {
        "rfc3339" => {
            let s = raw.strip_suffix("+00:00").unwrap_or(&raw).replace(' ', "T");
            to_utc(
                crate::telemetry::time::parse_rfc3339_utc(&s).ok_or_else(|| bad(raw.clone()))?,
                scale,
            )
        }
        "unix-s" => to_utc(num().ok_or_else(|| bad(raw.clone()))?, scale),
        "unix-ms" => to_utc(num().ok_or_else(|| bad(raw.clone()))? / 1000.0, scale),
        "gps-s" => to_utc(
            GPS_EPOCH_UNIX + num().ok_or_else(|| bad(raw.clone()))?,
            "gps",
        ),
        "gps-week-tow" => {
            let wc = m.time.week_column.as_deref().unwrap_or_default();
            let week = r.number(wc)?.ok_or_else(|| bad(raw.clone()))?;
            let tow = num().ok_or_else(|| bad(raw.clone()))?;
            to_utc(GPS_EPOCH_UNIX + week * 604_800.0 + tow, "gps")
        }
        _ => to_utc(
            parse_pattern(&raw, m.time.pattern.as_deref().unwrap_or_default())
                .ok_or_else(|| bad(raw.clone()))?,
            scale,
        ),
    };
    Ok(t)
}

/// `G05` from `G05`, `G5`, `G 5`, `g05`; `None` when it is not one letter and 1 to 3 digits.
fn normalise_sat(s: &str) -> Option<String> {
    let s: String = s.chars().filter(|c| !c.is_whitespace()).collect();
    let mut cs = s.chars();
    let sys = cs.next()?.to_ascii_uppercase();
    let num: String = cs.collect();
    if !"GRECJSI".contains(sys) || num.is_empty() || num.len() > 3 {
        return None;
    }
    let n: u32 = num.parse().ok()?;
    Some(format!("{sys}{n:02}"))
}

fn row_sat(id: &SatId, r: &Row) -> Result<Option<String>, String> {
    let bad = |v: String| crate::terr!("e-connect-bad-sat", line = r.line.to_string(), value = v);
    if let Some(c) = &id.column {
        let Some(v) = r.text(c) else { return Ok(None) };
        return normalise_sat(&v).map(Some).ok_or_else(|| bad(v));
    }
    let Some(num) = id.number_column.as_deref().and_then(|c| r.text(c)) else {
        return Ok(None);
    };
    let sys = match (&id.system, &id.system_column) {
        (Some(s), _) => s.clone(),
        (None, Some(c)) => match r.text(c).and_then(|v| id.system_map.get(&v).cloned()) {
            Some(s) => s,
            None => return Ok(None),
        },
        (None, None) => return Ok(None),
    };
    normalise_sat(&format!("{sys}{num}"))
        .map(Some)
        .ok_or_else(|| bad(format!("{sys}{num}")))
}

fn label_of(unix_utc: f64) -> String {
    let whole = unix_utc.floor();
    let ms = ((unix_utc - whole) * 1000.0).round() as i64;
    let (whole, ms) = if ms == 1000 {
        (whole + 1.0, 0)
    } else {
        (whole, ms)
    };
    let base = crate::telemetry::time::rfc3339_utc(whole as i64);
    if ms == 0 {
        base
    } else {
        format!("{}.{ms:03}Z", base.trim_end_matches('Z'))
    }
}

/// Apply `mapping` to `text` and return the observation records for `station`.
pub fn map(mapping: &Mapping, text: &str, station: &Station) -> Result<Vec<Record>, String> {
    let rows = read_rows(mapping, text)?;
    let tol = mapping.time.group_tolerance_s.unwrap_or(0.0005).max(0.0);
    let mut epochs: Vec<(f64, LogEpoch)> = Vec::new();
    let mut observables: Vec<&'static str> = Vec::new();
    let mut note = |o: &'static str| {
        if !observables.contains(&o) {
            observables.push(o);
        }
    };
    let (lat_k, lon_k, h_k) = match &mapping.fix {
        Some(f) => (
            unit_factor(&f.lat, "fix.lat", ANGLE)?,
            unit_factor(&f.lon, "fix.lon", ANGLE)?,
            f.height
                .as_ref()
                .map(|h| unit_factor(h, "fix.height", LENGTH))
                .transpose()?
                .unwrap_or(1.0),
        ),
        None => (1.0, 1.0, 1.0),
    };
    for r in &rows {
        let t = row_time(mapping, r)?;
        let new_epoch = match epochs.last() {
            Some((t_prev, _)) if t < t_prev - tol => {
                return Err(crate::terr!(
                    "e-connect-time-order",
                    line = r.line.to_string()
                ))
            }
            Some((t_prev, _)) => t - t_prev > tol,
            None => true,
        };
        if new_epoch {
            epochs.push((
                t,
                LogEpoch {
                    time_label: Some(label_of(t)),
                    ..LogEpoch::default()
                },
            ));
        }
        let e = &mut epochs
            .last_mut()
            .expect("an epoch was just pushed or exists")
            .1;

        if let Some(f) = &mapping.fix {
            if let (Some(lat), Some(lon)) = (r.field(&f.lat, lat_k)?, r.field(&f.lon, lon_k)?) {
                let height_m = match &f.height {
                    Some(h) => r.field(h, h_k)?.unwrap_or(0.0),
                    None => 0.0,
                };
                let n_used = match &f.n_used {
                    Some(n) => r.field(n, 1.0)?.map(|v| v.round().max(0.0) as u32),
                    None => None,
                };
                e.fix = Some(ReportedFix {
                    lat_deg: lat,
                    lon_deg: lon,
                    height_m,
                    n_used,
                });
                note("fix");
            }
        }
        if let Some(s) = &mapping.signals {
            let band = |r: &Row| {
                s.band_column
                    .as_deref()
                    .and_then(|c| r.text(c))
                    .or_else(|| s.band.clone())
                    .unwrap_or_else(|| "L1".to_string())
            };
            if let (Some(id), Some(cf)) = (&s.sat, &s.cn0) {
                if let (Some(sat), Some(cn0)) = (row_sat(id, r)?, r.field(cf, 1.0)?) {
                    e.cn0.push(SatCn0 {
                        sat,
                        band: band(r),
                        cn0_dbhz: cn0,
                    });
                    note("cn0");
                }
            }
            for (sat, col) in &s.wide {
                if let Some(cn0) = r.number(col)? {
                    e.cn0.push(SatCn0 {
                        sat: normalise_sat(sat).unwrap_or_else(|| sat.clone()),
                        band: band(r),
                        cn0_dbhz: cn0,
                    });
                    note("cn0");
                }
            }
        }
        let rm = &mapping.receiver;
        if let Some(f) = &rm.agc {
            if let Some(v) = r.field(f, 1.0)? {
                e.agc = Some(v);
                note("agc");
            }
        }
        if let Some(f) = &rm.jam_ind {
            if let Some(v) = r.field(f, 1.0)? {
                e.jam_ind = Some(v);
                note("jam_ind");
            }
        }
        let flag = |f: &Option<Field>| -> Result<Option<u8>, String> {
            match f {
                Some(f) => Ok(r.field(f, 1.0)?.map(|v| v.round().clamp(0.0, 3.0) as u8)),
                None => Ok(None),
            }
        };
        let (sp, jm) = (flag(&rm.spoofing)?, flag(&rm.jamming)?);
        if sp.is_some() || jm.is_some() {
            let s = e
                .self_report
                .get_or_insert_with(ReceiverSelfReport::default);
            if sp.is_some() {
                s.spoofing = sp;
            }
            if jm.is_some() {
                s.jamming = jm;
            }
            note("self_report");
        }
        let dop = |f: &Option<Field>| -> Result<Option<f64>, String> {
            match f {
                Some(f) => r.field(f, 1.0),
                None => Ok(None),
            }
        };
        let (p, h, v) = (dop(&rm.pdop)?, dop(&rm.hdop)?, dop(&rm.vdop)?);
        if p.is_some() || h.is_some() || v.is_some() {
            let d = e.reported_dop.get_or_insert(ReportedDop {
                pdop: None,
                hdop: None,
                vdop: None,
                n_used: 0,
            });
            d.pdop = p.or(d.pdop);
            d.hdop = h.or(d.hdop);
            d.vdop = v.or(d.vdop);
            note("dop");
        }
    }
    let t0 = epochs.first().map_or(0.0, |(t, _)| *t);
    let start_label = epochs.first().and_then(|(_, e)| e.time_label.clone());
    let mut out = Vec::with_capacity(epochs.len() + 1);
    out.push(Record::Header(Header {
        schema: OBS_SCHEMA.to_string(),
        station: station.clone(),
        source_format: Some(format!("connect:{}", mapping.source.format)),
        start_label,
        observables: observables.iter().map(|s| s.to_string()).collect(),
        skipped_records: 0,
    }));
    for (t, mut e) in epochs {
        e.t_s = t - t0;
        out.push(Record::Epoch(Box::new(crate::obs::EpochRecord {
            station: station.id.clone(),
            epoch: e,
            iq_ref: None,
        })));
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn station() -> Station {
        toml::from_str("id = \"T1\"").unwrap()
    }

    #[test]
    fn csv_quotes() {
        assert_eq!(
            split_csv(r#"a,"b,c","d""e",,f"#, ',').unwrap(),
            vec!["a", "b,c", "d\"e", "", "f"]
        );
        assert!(split_csv(r#"a,"b"#, ',').is_err());
    }

    #[test]
    fn satellite_names() {
        assert_eq!(normalise_sat("G5").as_deref(), Some("G05"));
        assert_eq!(normalise_sat("e 11").as_deref(), Some("E11"));
        assert_eq!(normalise_sat("C123").as_deref(), Some("C123"));
        assert_eq!(normalise_sat("X05"), None);
        assert_eq!(normalise_sat("G"), None);
    }

    #[test]
    fn gps_time_goes_to_utc_with_the_leap_seconds() {
        // 2026: GPS − UTC = 18 s.
        let utc = 1_767_225_600.0; // 2026-01-01T00:00:00Z
        assert_eq!(to_utc(utc + 18.0, "gps"), utc);
        assert_eq!(to_utc(utc + 37.0, "tai"), utc);
        assert_eq!(label_of(utc + 0.25), "2026-01-01T00:00:00.250Z");
    }

    #[test]
    fn patterns() {
        assert_eq!(
            parse_pattern("01/01/2026 00:00:01.5", "%d/%m/%Y %H:%M:%S"),
            Some(1_767_225_601.5)
        );
        assert_eq!(
            parse_pattern("2026-13-01 00:00:00", "%Y-%m-%d %H:%M:%S"),
            None
        );
    }

    #[test]
    fn long_csv_groups_rows_into_epochs() {
        let m = parse_mapping(
            r#"schema = "kshana.connect/1"
[source]
format = "csv"
[time]
column = "t"
format = "unix-s"
[signals]
sat = { column = "sv" }
cn0 = { column = "cn0", unit = "dB-Hz" }
[fix]
lat = { column = "lat" }
lon = { column = "lon" }
height = { column = "alt", unit = "ft" }
"#,
        )
        .unwrap();
        let csv = "t,sv,cn0,lat,lon,alt\n100,G1,40,52,4,100\n100,E11,38,,,\n101,G1,39,52,4,100\n";
        let recs = map(&m, csv, &station()).unwrap();
        assert_eq!(recs.len(), 3);
        let Record::Epoch(e) = &recs[1] else { panic!() };
        assert_eq!(e.epoch.cn0.len(), 2);
        assert_eq!(e.epoch.cn0[1].sat, "E11");
        assert!((e.epoch.fix.as_ref().unwrap().height_m - 30.48).abs() < 1e-12);
        let Record::Epoch(e2) = &recs[2] else {
            panic!()
        };
        assert_eq!(e2.epoch.t_s, 1.0);
        // The output is a valid observation file.
        crate::obs::check(&crate::obs::to_jsonl(&recs).unwrap()).unwrap();
    }

    #[test]
    fn errors_name_the_row_and_column() {
        let m = parse_mapping(
            "schema = \"kshana.connect/1\"\n[source]\nformat = \"csv\"\n[time]\ncolumn = \"t\"\nformat = \"unix-s\"\n[receiver]\nagc = { column = \"agc\" }\n",
        )
        .unwrap();
        let e = map(&m, "t,agc\n1,5\n2,lots\n", &station()).unwrap_err();
        assert!(
            e.contains('3') && e.contains("agc") && e.contains("lots"),
            "{e}"
        );
        let e = map(&m, "t,agc\n2,5\n1,5\n", &station()).unwrap_err();
        assert!(e.contains('3'), "{e}");
        let e = map(&m, "time,agc\n2,5\n", &station()).unwrap_err();
        assert!(e.contains("`t`") || e.contains('t'), "{e}");
        assert!(parse_mapping("schema = \"kshana.connect/9\"\n[source]\nformat = \"csv\"\n[time]\ncolumn = \"t\"\nformat = \"unix-s\"\n").is_err());
    }
}
