// SPDX-License-Identifier: AGPL-3.0-only
//! Clock-log formats: one parser layer that turns a measured clock log into a single
//! normalised phase series `(time_s, phase_s)` on a uniform grid, with the sample interval
//! `tau0` found or stated, every gap counted, and the units of the log named.
//!
//! Three formats are read. Each is a documented subset, stated here and in
//! `docs/CLOCK-LOG-FORMATS.md`; anything outside it is refused with an error naming what
//! was found rather than read approximately.
//!
//! * **`rinex-clk`** — RINEX clock files, versions 2, 3.00 to 3.04 (the 3.04 nine-character
//!   name field included). The header is read only for its `TIME SYSTEM ID` (or the
//!   satellite-system default; [`crate::realdata::clk::rinex_clock_time_system`]) and is
//!   skipped up to `END OF HEADER`. Of the data records, the `AS` (satellite) and `AR`
//!   (receiver or station) records of ONE clock, selected by name, are kept: their first
//!   value field, the clock bias in seconds, is the phase. Continuation lines and the other
//!   record types (`CR`, `DR`, `MS`) are skipped. Epochs are the record's calendar fields as
//!   seconds from 1980-01-06 00:00:00 in the file's own time system (no conversion). The
//!   record parser is the one the measured clock library already uses
//!   ([`crate::precise_products::parse_clock_rinex_records`]).
//! * **`timelab`** — TimeLab-style ASCII phase or frequency logs, the plain-text form
//!   TimeLab exports and its ASCII import and Stable32 read: one reading per line, either a
//!   single column of readings at a uniform `tau0`, or two columns `time value`. Columns
//!   may be separated by white space, commas or semicolons. Lines starting with `#`, `;` or
//!   `%` are comments; a comment of the form `key = value` (or `key: value`) sets `tau0`
//!   (seconds), `units` (`s`, `ms`, `us`, `ns` or `ps` for phase), `data` (`phase` or
//!   `frequency`) or `time_units` (`s` or `mjd`, for the first of two columns). One
//!   leading non-numeric line is taken as a column header. Frequency data (fractional
//!   frequency, dimensionless) is accepted as a single column only and integrated to
//!   phase, `x[i+1] = x[i] + y[i] tau0` (NIST SP 1065, 2008, §4.1). TimeLab's own binary
//!   and `.tim` project files are NOT read.
//! * **`ticc`** — logs of the TAPR TICC time-interval counter (TICC Operation Manual,
//!   revision of 23 November 2016, "measurement modes"): every data field is seconds with
//!   12 decimal places. Timestamp mode (`<seconds> chA` and `<seconds> chB` lines) and the
//!   TimeLab mode's pseudo-timestamp channel (`chC`) are read as event time stamps; the
//!   phase of the selected channel is its time stamp minus the nominal tick,
//!   `x[k] = t[k] - t[0] - n[k] tau0`, with `n[k]` the whole number of `tau0` since the
//!   first event, so a missed event is a gap. Interval mode lines (`<seconds> TI(A->B)`,
//!   any label starting `TI`) are read as phase directly, one reading per `tau0`, which the
//!   scenario must state because the line carries no time. Period and Debug mode output is
//!   refused (a channel whose readings do not increase is reported as Period mode). Lines
//!   starting with `#` and lines that are not `<number> <label>` (the start-up menu) are
//!   skipped and counted.
//!
//! ## `tau0` and gaps
//!
//! Where the log carries time stamps and no `tau0` is given, `tau0` is the median spacing
//! of consecutive time stamps rounded to four significant figures (a counter's spacing
//! differs from nominal by the reference's frequency offset, parts in 10^6 or less), and
//! the source is reported as `median-spacing`. A `tau0_s` in the scenario always wins
//! (`input`), then a `tau0` header comment (`header`).
//!
//! Samples are placed on the grid `t0 + i tau0`; a missing epoch is a gap. The gap policy
//! is `refuse` (default: a log with any gap is an error that counts the gaps), `longest`
//! (keep the longest gap-free run) or `linear` (fill interior gaps by linear
//! interpolation; the number filled is reported). The estimators downstream
//! ([`crate::allan`]) need a gap-free record, which is why gaps are resolved here.
//!
//! MODELLED: this is a parser. Its output feeds estimators that are validated elsewhere;
//! the tests here are on small hand-written logs.
use crate::clock_library::series::PhaseSeries;
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// The formats this layer reads.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum ClockLogFormat {
    /// RINEX clock (`AS` / `AR` records).
    #[serde(rename = "rinex-clk")]
    RinexClk,
    /// TimeLab-style ASCII phase or frequency log.
    #[serde(rename = "timelab")]
    TimeLab,
    /// TAPR TICC counter log.
    #[serde(rename = "ticc")]
    Ticc,
}

/// Format names accepted in a scenario.
pub const FORMAT_NAMES: [&str; 3] = ["rinex-clk", "timelab", "ticc"];

impl ClockLogFormat {
    /// Parse a format name from a scenario.
    pub fn from_name(s: &str) -> Result<Self, String> {
        match s {
            "rinex-clk" => Ok(Self::RinexClk),
            "timelab" => Ok(Self::TimeLab),
            "ticc" => Ok(Self::Ticc),
            other => Err(format!(
                "unknown clock-log format {other:?}; expected one of {}",
                FORMAT_NAMES.join(", ")
            )),
        }
    }

    /// The scenario name of the format.
    pub fn name(self) -> &'static str {
        match self {
            Self::RinexClk => "rinex-clk",
            Self::TimeLab => "timelab",
            Self::Ticc => "ticc",
        }
    }
}

/// What to do with missing epochs.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum GapPolicy {
    /// Any gap is an error (the default).
    Refuse,
    /// Keep the longest gap-free run.
    Longest,
    /// Fill interior gaps by linear interpolation.
    Linear,
}

impl GapPolicy {
    /// Parse a policy name (`refuse`, `longest`, `linear`).
    pub fn from_name(s: &str) -> Result<Self, String> {
        match s {
            "refuse" => Ok(Self::Refuse),
            "longest" => Ok(Self::Longest),
            "linear" => Ok(Self::Linear),
            other => Err(format!(
                "unknown gap policy {other:?}; expected refuse, longest or linear"
            )),
        }
    }

    /// The policy's name.
    pub fn name(self) -> &'static str {
        match self {
            Self::Refuse => "refuse",
            Self::Longest => "longest",
            Self::Linear => "linear",
        }
    }
}

/// A clock log named in a scenario: the format, the log (a file on native builds, or the
/// text inline), and the format's selectors. Every field but `format` is optional, and an
/// absent field is left out of the scenario hash.
#[derive(Clone, Debug, Default, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct ClockLogInput {
    /// `rinex-clk`, `timelab` or `ticc`.
    pub format: String,
    /// Path of the log file (native builds only).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub path: Option<String>,
    /// The log text inline (every build, including WebAssembly).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    /// RINEX clock: the clock's name (`G08`, `USN7`, ...). Needed when the file holds
    /// more than one clock.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub clock: Option<String>,
    /// TICC: the channel label (`chA`, `chB`, `chC` or the interval label). Needed when
    /// the log holds more than one.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<String>,
    /// Sample interval (s). Overrides a header and the detected spacing; required for a
    /// single-column TimeLab log without a `tau0` header and for TICC interval mode.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub tau0_s: Option<f64>,
    /// TimeLab: the units of the phase readings (`s`, `ms`, `us`, `ns`, `ps`); overrides a
    /// header. Default `s`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub units: Option<String>,
    /// TimeLab: `phase` (default) or `frequency`; overrides a header.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub data: Option<String>,
    /// Gap policy: `refuse` (default), `longest` or `linear`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub gaps: Option<String>,
}

/// A normalised phase series and what was done to obtain it. `time_s` and `phase_s` are
/// not serialised (a report carries curves, not the record); the rest is.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct NormalisedPhase {
    /// The format read.
    pub format: ClockLogFormat,
    /// The clock (RINEX) or channel (TICC) read; empty for TimeLab.
    pub clock: String,
    /// The log's own time of the first kept sample: seconds from 1980-01-06 00:00:00 in
    /// `time_system` for RINEX, the counter's time stamp for TICC, the first column for a
    /// two-column TimeLab log, 0 otherwise.
    pub t0_s: f64,
    /// Sample interval (s).
    pub tau0_s: f64,
    /// Where `tau0_s` came from: `input`, `header` or `median-spacing`.
    pub tau0_source: &'static str,
    /// What the log's values are: `phase` or `frequency`.
    pub data: &'static str,
    /// Units of the values in the log (`s`, `ns`, ... for phase; `1` for fractional
    /// frequency). The normalised phase is always seconds.
    pub unit_in: &'static str,
    /// RINEX: the time system of the epochs; `None` for other formats.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub time_system: Option<String>,
    /// Readings parsed for the selected clock or channel.
    pub n_parsed: usize,
    /// Grid epochs spanned by the readings (present or missing).
    pub n_grid: usize,
    /// Missing grid epochs.
    pub n_missing: usize,
    /// Runs of consecutive missing epochs.
    pub n_gaps: usize,
    /// Readings more than 1 % of `tau0` off the grid, dropped.
    pub n_off_grid: usize,
    /// Readings on an already occupied grid epoch, dropped (the first is kept).
    pub n_duplicates: usize,
    /// Lines skipped as neither data nor comment (TICC start-up text, other channels'
    /// readings are not counted here).
    pub n_skipped_lines: usize,
    /// The gap policy applied.
    pub gap_policy: &'static str,
    /// Missing epochs filled by `linear`.
    pub n_interpolated: usize,
    /// Samples in the normalised series.
    pub n_used: usize,
    /// Time of each sample from the first kept one (s).
    #[serde(skip)]
    pub time_s: Vec<f64>,
    /// Phase of each sample (s).
    #[serde(skip)]
    pub phase_s: Vec<f64>,
}

impl NormalisedPhase {
    /// SHA-256 of the phase samples as little-endian IEEE-754 bytes.
    pub fn phase_sha256(&self) -> String {
        use sha2::{Digest, Sha256};
        let mut h = Sha256::new();
        for x in &self.phase_s {
            h.update(x.to_le_bytes());
        }
        hex::encode(h.finalize())
    }
}

/// Read the log a [`ClockLogInput`] names (inline `text`, or `path` on native builds).
pub fn read_input(inp: &ClockLogInput) -> Result<NormalisedPhase, String> {
    let fmt = ClockLogFormat::from_name(&inp.format)?;
    let text = match (&inp.text, &inp.path) {
        (Some(_), Some(_)) => return Err("give either the log text or its path, not both".into()),
        (Some(t), None) => t.clone(),
        (None, Some(p)) => read_file(p)?,
        (None, None) => return Err("a clock log needs its text or a path".into()),
    };
    if let Some(t) = inp.tau0_s {
        if !(t.is_finite() && t > 0.0) {
            return Err(format!("tau0_s must be finite and > 0 (got {t})"));
        }
    }
    let gaps = GapPolicy::from_name(inp.gaps.as_deref().unwrap_or("refuse"))?;
    if fmt != ClockLogFormat::TimeLab && (inp.units.is_some() || inp.data.is_some()) {
        return Err("units and data apply to the timelab format only".into());
    }
    if fmt != ClockLogFormat::RinexClk && inp.clock.is_some() {
        return Err("clock applies to the rinex-clk format only (TICC uses channel)".into());
    }
    if fmt != ClockLogFormat::Ticc && inp.channel.is_some() {
        return Err("channel applies to the ticc format only".into());
    }
    parse(fmt, &text, inp, gaps)
}

#[cfg(not(target_arch = "wasm32"))]
fn read_file(path: &str) -> Result<String, String> {
    std::fs::read_to_string(path).map_err(|e| format!("cannot read clock log {path:?}: {e}"))
}

#[cfg(target_arch = "wasm32")]
fn read_file(_path: &str) -> Result<String, String> {
    Err("a clock-log path is not available in the WebAssembly build; give the log as text".into())
}

/// Parse `text` in format `fmt` with the selectors of `inp` and the gap policy `gaps`.
pub fn parse(
    fmt: ClockLogFormat,
    text: &str,
    inp: &ClockLogInput,
    gaps: GapPolicy,
) -> Result<NormalisedPhase, String> {
    match fmt {
        ClockLogFormat::RinexClk => parse_rinex(text, inp, gaps),
        ClockLogFormat::TimeLab => parse_timelab(text, inp, gaps),
        ClockLogFormat::Ticc => parse_ticc(text, inp, gaps),
    }
}

/// The median spacing of consecutive increasing time stamps, rounded to four significant
/// figures. `None` with fewer than two distinct stamps.
pub fn detect_tau0(times: &[f64]) -> Option<f64> {
    let mut d: Vec<f64> = times
        .windows(2)
        .map(|w| w[1] - w[0])
        .filter(|d| d.is_finite() && *d > 0.0)
        .collect();
    if d.is_empty() {
        return None;
    }
    d.sort_by(f64::total_cmp);
    let med = d[d.len() / 2];
    let e = med.plog10().floor() - 3.0;
    let s = 10f64.ppowf(e);
    Some((med / s).round() * s)
}

/// The fields of [`NormalisedPhase`] a parser fills before the gap policy runs.
struct Gridded {
    format: ClockLogFormat,
    clock: String,
    series: PhaseSeries,
    tau0_source: &'static str,
    data: &'static str,
    unit_in: &'static str,
    time_system: Option<String>,
    n_parsed: usize,
    n_off_grid: usize,
    n_duplicates: usize,
    n_skipped_lines: usize,
}

/// Apply the gap policy and assemble the normalised series.
fn finish(g: Gridded, gaps: GapPolicy) -> Result<NormalisedPhase, String> {
    let s = &g.series;
    let n_grid = s.len();
    let n_missing = s.x.iter().filter(|v| !v.is_finite()).count();
    let n_gaps =
        s.x.iter()
            .enumerate()
            .filter(|(i, v)| !v.is_finite() && (*i == 0 || s.x[i - 1].is_finite()))
            .count();
    let (kept, n_interpolated) = match gaps {
        _ if n_missing == 0 => (s.clone(), 0),
        GapPolicy::Refuse => {
            return Err(format!(
                "the {} log has {n_missing} missing epoch(s) in {n_gaps} gap(s) on a {} s grid; \
                 set gaps = \"longest\" to keep the longest gap-free run or gaps = \"linear\" \
                 to interpolate",
                g.format.name(),
                s.tau0
            ))
        }
        GapPolicy::Longest => (s.longest_run(), 0),
        GapPolicy::Linear => {
            let mut x = s.x.clone();
            let mut last: Option<usize> = None;
            for i in 0..x.len() {
                if x[i].is_finite() {
                    if let Some(a) = last {
                        for (k, xk) in x.iter_mut().enumerate().take(i).skip(a + 1) {
                            let f = (k - a) as f64 / (i - a) as f64;
                            *xk = s.x[a] + f * (s.x[i] - s.x[a]);
                        }
                    }
                    last = Some(i);
                }
            }
            (
                PhaseSeries {
                    t0: s.t0,
                    tau0: s.tau0,
                    x,
                },
                n_missing,
            )
        }
    };
    if kept.x.len() < 3 {
        return Err(format!(
            "the {} log yields {} usable sample(s); at least 3 are needed",
            g.format.name(),
            kept.x.len()
        ));
    }
    let tau0 = kept.tau0;
    Ok(NormalisedPhase {
        format: g.format,
        clock: g.clock,
        t0_s: kept.t0,
        tau0_s: tau0,
        tau0_source: g.tau0_source,
        data: g.data,
        unit_in: g.unit_in,
        time_system: g.time_system,
        n_parsed: g.n_parsed,
        n_grid,
        n_missing,
        n_gaps,
        n_off_grid: g.n_off_grid,
        n_duplicates: g.n_duplicates,
        n_skipped_lines: g.n_skipped_lines,
        gap_policy: gaps.name(),
        n_interpolated,
        n_used: kept.x.len(),
        time_s: (0..kept.x.len()).map(|i| i as f64 * tau0).collect(),
        phase_s: kept.x,
    })
}

// ─────────────────────────────────────────────────────────────────────────────
// RINEX clock
// ─────────────────────────────────────────────────────────────────────────────

fn parse_rinex(
    text: &str,
    inp: &ClockLogInput,
    gaps: GapPolicy,
) -> Result<NormalisedPhase, String> {
    use crate::precise_products::parse_clock_rinex_records;
    if !text
        .lines()
        .any(|l| l.get(60..).map(str::trim_end) == Some("END OF HEADER"))
    {
        return Err("not a RINEX clock file: no END OF HEADER record".into());
    }
    let as_recs = parse_clock_rinex_records(text, "AS")?;
    let ar_recs = parse_clock_rinex_records(text, "AR")?;
    let id =
        match &inp.clock {
            Some(c) => c.clone(),
            None => {
                let mut names: Vec<&String> =
                    as_recs.sats.keys().chain(ar_recs.sats.keys()).collect();
                names.sort();
                names.dedup();
                match names.as_slice() {
                    [one] => (*one).clone(),
                    [] => return Err("the RINEX clock file has no AS or AR records".into()),
                    many => {
                        return Err(format!(
                        "the RINEX clock file holds {} clocks; name one with clock = \"...\" ({})",
                        many.len(),
                        many.iter().map(|s| s.as_str()).collect::<Vec<_>>().join(", ")
                    ))
                    }
                }
            }
        };
    let epochs: Vec<f64> = match as_recs.sats.get(&id).or_else(|| ar_recs.sats.get(&id)) {
        Some(v) => v.iter().map(|p| p.0).collect(),
        None => return Err(format!("no AS or AR records for clock {id:?}")),
    };
    let (tau0, src) = match inp.tau0_s {
        Some(t) => (t, "input"),
        None => (
            detect_tau0(&epochs).ok_or("the clock has a single epoch; tau0 cannot be found")?,
            "median-spacing",
        ),
    };
    let r = crate::realdata::clk::rinex_clock_series(&[text], &id, tau0)?;
    Gridded {
        format: ClockLogFormat::RinexClk,
        clock: id,
        series: r.series,
        tau0_source: src,
        data: "phase",
        unit_in: "s",
        time_system: Some(r.time_system),
        n_parsed: epochs.len(),
        n_off_grid: r.log.off_grid,
        n_duplicates: r.log.duplicates,
        n_skipped_lines: 0,
    }
    .finish_with(gaps)
}

impl Gridded {
    fn finish_with(self, gaps: GapPolicy) -> Result<NormalisedPhase, String> {
        if self.series.x.is_empty() {
            return Err(format!("the {} log has no readings", self.format.name()));
        }
        finish(self, gaps)
    }
}

// ─────────────────────────────────────────────────────────────────────────────
// TimeLab-style ASCII
// ─────────────────────────────────────────────────────────────────────────────

/// A phase unit and the number of that unit in one second (values are divided by it, so a
/// decimal reading converts exactly where it can).
fn phase_unit(s: &str) -> Result<(&'static str, f64), String> {
    match s.trim().to_ascii_lowercase().as_str() {
        "s" | "sec" | "seconds" => Ok(("s", 1.0)),
        "ms" => Ok(("ms", 1e3)),
        "us" | "µs" => Ok(("us", 1e6)),
        "ns" => Ok(("ns", 1e9)),
        "ps" => Ok(("ps", 1e12)),
        other => Err(format!(
            "unknown phase unit {other:?}; expected s, ms, us, ns or ps"
        )),
    }
}

fn split_fields(l: &str) -> Vec<&str> {
    l.split(|c: char| c.is_whitespace() || c == ',' || c == ';')
        .filter(|s| !s.is_empty())
        .collect()
}

fn parse_timelab(
    text: &str,
    inp: &ClockLogInput,
    gaps: GapPolicy,
) -> Result<NormalisedPhase, String> {
    let (mut h_tau0, mut h_units, mut h_data, mut h_time) = (None, None, None, None);
    let mut rows: Vec<Vec<f64>> = Vec::new();
    let mut header_seen = false;
    for (i, line) in text.lines().enumerate() {
        let l = line.trim();
        if l.is_empty() {
            continue;
        }
        if let Some(c) = l.strip_prefix(['#', ';', '%']) {
            if let Some((k, v)) = c.split_once('=').or_else(|| c.split_once(':')) {
                let v = v.trim().to_string();
                match k.trim().to_ascii_lowercase().as_str() {
                    "tau0" | "tau0_s" => h_tau0 = Some(v),
                    "units" | "unit" => h_units = Some(v),
                    "data" => h_data = Some(v),
                    "time_units" => h_time = Some(v),
                    _ => {}
                }
            }
            continue;
        }
        let f = split_fields(l);
        let nums: Result<Vec<f64>, _> = f
            .iter()
            .map(|s| s.replace(['D', 'd'], "E").parse::<f64>())
            .collect();
        match nums {
            Ok(v) if (1..=2).contains(&v.len()) => {
                if let Some(first) = rows.first() {
                    if first.len() != v.len() {
                        return Err(format!(
                            "TimeLab line {} has {} column(s), the first data line has {}",
                            i + 1,
                            v.len(),
                            first.len()
                        ));
                    }
                }
                rows.push(v);
            }
            Ok(v) => {
                return Err(format!(
                    "TimeLab line {} has {} columns; one (value) or two (time value) are read",
                    i + 1,
                    v.len()
                ))
            }
            Err(_) if rows.is_empty() && !header_seen => header_seen = true,
            Err(_) => return Err(format!("TimeLab line {} is not numeric: {l:?}", i + 1)),
        }
    }
    if rows.is_empty() {
        return Err("the timelab log has no readings".into());
    }
    let data = match inp
        .data
        .as_deref()
        .or(h_data.as_deref())
        .unwrap_or("phase")
        .trim()
    {
        "phase" => "phase",
        "frequency" => "frequency",
        other => {
            return Err(format!(
                "unknown data {other:?}; expected phase or frequency"
            ))
        }
    };
    let header_tau0 = match &h_tau0 {
        Some(v) => Some(
            v.split_whitespace()
                .next()
                .and_then(|s| s.parse::<f64>().ok())
                .filter(|t| t.is_finite() && *t > 0.0)
                .ok_or_else(|| format!("tau0 header {v:?} is not a positive number of seconds"))?,
        ),
        None => None,
    };
    let two = rows[0].len() == 2;
    let (unit_in, scale) = if data == "frequency" {
        if (inp.units.is_some() || h_units.is_some())
            && !matches!(
                inp.units.as_deref().or(h_units.as_deref()).map(str::trim),
                Some("1")
            )
        {
            return Err("frequency data is fractional frequency; its units can only be 1".into());
        }
        ("1", 1.0)
    } else {
        phase_unit(inp.units.as_deref().or(h_units.as_deref()).unwrap_or("s"))?
    };
    let samples: Vec<(f64, f64)>;
    let (tau0, src);
    if two {
        if data == "frequency" {
            return Err("two-column frequency logs are not read; give frequency as a single column with tau0".into());
        }
        let tscale = match h_time.as_deref().map(str::trim) {
            None | Some("s") => 1.0,
            Some("mjd") => 86_400.0,
            Some(o) => return Err(format!("unknown time_units {o:?}; expected s or mjd")),
        };
        samples = rows.iter().map(|r| (r[0] * tscale, r[1] / scale)).collect();
        let times: Vec<f64> = samples.iter().map(|s| s.0).collect();
        if times.windows(2).any(|w| w[1] <= w[0]) {
            return Err("the timelab log's time column must increase".into());
        }
        (tau0, src) = match (inp.tau0_s, header_tau0) {
            (Some(t), _) => (t, "input"),
            (None, Some(t)) => (t, "header"),
            (None, None) => (
                detect_tau0(&times).ok_or("a single reading; tau0 cannot be found")?,
                "median-spacing",
            ),
        };
    } else {
        (tau0, src) = match (inp.tau0_s, header_tau0) {
            (Some(t), _) => (t, "input"),
            (None, Some(t)) => (t, "header"),
            (None, None) => {
                return Err(
                    "a single-column timelab log needs tau0: a `# tau0 = <s>` header or tau0_s"
                        .into(),
                )
            }
        };
        let v: Vec<f64> = rows.iter().map(|r| r[0]).collect();
        let x: Vec<f64> = if data == "frequency" {
            // NIST SP 1065 §4.1: x[i+1] = x[i] + y[i] tau0, from x[0] = 0.
            let mut x = Vec::with_capacity(v.len() + 1);
            x.push(0.0);
            for y in &v {
                x.push(x.last().copied().unwrap_or(0.0) + y * tau0);
            }
            x
        } else {
            v.iter().map(|p| p / scale).collect()
        };
        samples = x
            .iter()
            .enumerate()
            .map(|(i, p)| (i as f64 * tau0, *p))
            .collect();
    }
    let (series, log) = PhaseSeries::from_samples(&samples, tau0);
    if log.non_finite > 0 {
        return Err(format!(
            "the timelab log has {} non-finite reading(s)",
            log.non_finite
        ));
    }
    Gridded {
        format: ClockLogFormat::TimeLab,
        clock: String::new(),
        series,
        tau0_source: src,
        data,
        unit_in,
        time_system: None,
        n_parsed: rows.len(),
        n_off_grid: log.off_grid,
        n_duplicates: log.duplicates,
        n_skipped_lines: 0,
    }
    .finish_with(gaps)
}

// ─────────────────────────────────────────────────────────────────────────────
// TAPR TICC
// ─────────────────────────────────────────────────────────────────────────────

fn parse_ticc(text: &str, inp: &ClockLogInput, gaps: GapPolicy) -> Result<NormalisedPhase, String> {
    let mut by_label: Vec<(String, Vec<f64>)> = Vec::new();
    let mut skipped = 0usize;
    for line in text.lines() {
        let l = line.trim();
        if l.is_empty() || l.starts_with('#') {
            continue;
        }
        let f: Vec<&str> = l.split_whitespace().collect();
        let parsed = match f.as_slice() {
            [v, label] => v
                .parse::<f64>()
                .ok()
                .filter(|x| x.is_finite())
                .map(|x| (x, *label)),
            _ => None,
        };
        let Some((v, label)) = parsed else {
            skipped += 1;
            continue;
        };
        let known = matches!(label, "chA" | "chB" | "chC") || label.starts_with("TI");
        if !known {
            skipped += 1;
            continue;
        }
        match by_label.iter_mut().find(|(k, _)| k == label) {
            Some((_, vals)) => vals.push(v),
            None => by_label.push((label.to_string(), vec![v])),
        }
    }
    let labels: Vec<&str> = by_label.iter().map(|(k, _)| k.as_str()).collect();
    let channel = match &inp.channel {
        Some(c) => c.clone(),
        None => match labels.as_slice() {
            [one] => one.to_string(),
            [] => {
                return Err("the TICC log has no `<seconds> chA|chB|chC|TI(...)` readings".into())
            }
            many => {
                return Err(format!(
                    "the TICC log holds channels {}; name one with channel = \"...\"",
                    many.join(", ")
                ))
            }
        },
    };
    let vals = by_label
        .iter()
        .find(|(k, _)| *k == channel)
        .map(|(_, v)| v.clone())
        .ok_or_else(|| {
            format!(
                "no readings on channel {channel:?} (found {})",
                labels.join(", ")
            )
        })?;
    let interval = channel.starts_with("TI");
    let (series, tau0_source) = if interval {
        let tau0 = inp
            .tau0_s
            .ok_or("TICC interval-mode lines carry no time; give tau0_s (the event period)")?;
        (
            PhaseSeries {
                t0: 0.0,
                tau0,
                x: vals.clone(),
            },
            "input",
        )
    } else {
        if vals.windows(2).any(|w| w[1] <= w[0]) {
            return Err(format!(
                "the {channel} readings do not increase, so they are not time stamps (TICC \
                 Period mode output is not read; use Timestamp mode)"
            ));
        }
        let (tau0, src) = match inp.tau0_s {
            Some(t) => (t, "input"),
            None => (
                detect_tau0(&vals).ok_or("a single time stamp; tau0 cannot be found")?,
                "median-spacing",
            ),
        };
        // Whole ticks since the previous event, accumulated, so a reference frequency offset
        // does not walk the index off the grid over a long log.
        let mut x = vec![0.0];
        let mut n = 0usize;
        for w in vals.windows(2) {
            let k = ((w[1] - w[0]) / tau0).round();
            if k < 1.0 {
                return Err(format!(
                    "two {channel} time stamps {} s apart, under half of tau0 = {tau0} s",
                    w[1] - w[0]
                ));
            }
            let k = k as usize;
            for _ in 1..k {
                x.push(f64::NAN);
            }
            n += k;
            x.push(w[1] - vals[0] - n as f64 * tau0);
        }
        (
            PhaseSeries {
                t0: vals[0],
                tau0,
                x,
            },
            src,
        )
    };
    Gridded {
        format: ClockLogFormat::Ticc,
        clock: channel,
        series,
        tau0_source,
        data: "phase",
        unit_in: "s",
        time_system: None,
        n_parsed: vals.len(),
        n_off_grid: 0,
        n_duplicates: 0,
        n_skipped_lines: skipped,
    }
    .finish_with(gaps)
}

// ─────────────────────────────────────────────────────────────────────────────
// Stability of a normalised series (the `measured` block of the clock kind)
// ─────────────────────────────────────────────────────────────────────────────

/// One TDEV point.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct TdevPoint {
    /// Averaging time `m tau0` (s).
    pub tau_s: f64,
    /// Time deviation (s).
    pub tdev_s: f64,
}

/// One MTIE point.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct MtiePointS {
    /// Observation interval `m tau0` (s).
    pub tau_s: f64,
    /// MTIE (s).
    pub mtie_s: f64,
}

/// The stability of a measured phase log: the clock kind's optional `measured` block.
#[derive(Clone, Debug, Serialize)]
pub struct MeasuredPhaseReport {
    /// Evidence label of the block.
    pub label: &'static str,
    /// How the log was read.
    pub log: NormalisedPhase,
    /// SHA-256 of the normalised phase samples (little-endian IEEE-754).
    pub phase_sha256: String,
    /// SHA-256 of the scenario's `[clock_log]` table as parsed (its canonical JSON), set
    /// when the block comes from a scenario: the run's `scenario_hash` does not cover the
    /// table, so this and `phase_sha256` identify the log.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub input_sha256: Option<String>,
    /// Overlapping Allan deviation at octave averaging factors ([`crate::allan::overlapping_adev_curve`]).
    pub adev: Vec<crate::allan::AdevPoint>,
    /// Time deviation at octave averaging factors while `n > 3m` ([`crate::allan::time_deviation`]).
    pub tdev: Vec<TdevPoint>,
    /// MTIE at octave observation intervals while a window fits
    /// ([`crate::telecom_timing::mtie_sliding`], equal to [`crate::allan::mtie`]).
    pub mtie: Vec<MtiePointS>,
}

/// Evidence label of the `measured` block.
pub const MEASURED_LABEL: &str = "MODELLED — a measured phase log parsed by the clock-log \
    format layer (a parser, tested on hand-written logs) and passed to the engine's \
    Allan-family estimators, which are validated against allantools elsewhere. Describes the \
    log as given; not a calibration of the clock or of the counter.";

impl MeasuredPhaseReport {
    /// The ADEV, TDEV and MTIE of a normalised series.
    pub fn from_phase(log: NormalisedPhase) -> MeasuredPhaseReport {
        let x = &log.phase_s;
        let tau0 = log.tau0_s;
        let n = x.len();
        let adev = crate::allan::overlapping_adev_curve(x, tau0);
        let mut tdev = Vec::new();
        let mut m = 1usize;
        while n > 3 * m {
            tdev.push(TdevPoint {
                tau_s: m as f64 * tau0,
                tdev_s: crate::allan::time_deviation(x, tau0, m),
            });
            m *= 2;
        }
        let mut mtie = Vec::new();
        let mut m = 1usize;
        while m < n {
            mtie.push(MtiePointS {
                tau_s: m as f64 * tau0,
                mtie_s: crate::telecom_timing::mtie_sliding(x, m),
            });
            m *= 2;
        }
        MeasuredPhaseReport {
            label: MEASURED_LABEL,
            phase_sha256: log.phase_sha256(),
            input_sha256: None,
            log,
            adev,
            tdev,
            mtie,
        }
    }
}

impl MeasuredPhaseReport {
    /// Read the log a scenario's `[clock_log]` table names and report its stability, with
    /// the table's own hash.
    pub fn from_input(inp: &ClockLogInput) -> Result<MeasuredPhaseReport, String> {
        use sha2::{Digest, Sha256};
        let canonical = serde_json::to_string(inp).map_err(|e| e.to_string())?;
        let mut r = MeasuredPhaseReport::from_phase(read_input(inp)?);
        r.input_sha256 = Some(hex::encode(Sha256::digest(canonical.as_bytes())));
        Ok(r)
    }
}

/// Units and provenance of every numeric field the `measured` block adds, relative to the
/// document root of a clock run.
pub const MEASURED_UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "measured.log.t0_s", unit: "s", provenance: Input, definition: "time of the first kept sample on the log's own time axis (RINEX: seconds from 1980-01-06 in the file's time system; TICC: the counter time stamp)" },
        FieldUnit { path: "measured.log.tau0_s", unit: "s", provenance: Computed, definition: "sample interval of the normalised series: input, header or median spacing of the time stamps rounded to four significant figures" },
        FieldUnit { path: "measured.log.n_parsed", unit: "1", provenance: Computed, definition: "readings parsed for the selected clock or channel" },
        FieldUnit { path: "measured.log.n_grid", unit: "1", provenance: Computed, definition: "grid epochs spanned by the readings, present or missing" },
        FieldUnit { path: "measured.log.n_missing", unit: "1", provenance: Computed, definition: "missing grid epochs" },
        FieldUnit { path: "measured.log.n_gaps", unit: "1", provenance: Computed, definition: "runs of consecutive missing epochs" },
        FieldUnit { path: "measured.log.n_off_grid", unit: "1", provenance: Computed, definition: "readings more than 1 % of tau0 off the grid, dropped" },
        FieldUnit { path: "measured.log.n_duplicates", unit: "1", provenance: Computed, definition: "readings on an already occupied grid epoch, dropped" },
        FieldUnit { path: "measured.log.n_skipped_lines", unit: "1", provenance: Computed, definition: "lines neither data nor comment, skipped (TICC start-up text)" },
        FieldUnit { path: "measured.log.n_interpolated", unit: "1", provenance: Computed, definition: "missing epochs filled by the linear gap policy" },
        FieldUnit { path: "measured.log.n_used", unit: "1", provenance: Computed, definition: "samples in the normalised phase series the curves are computed from" },
        FieldUnit { path: "measured.adev[].tau_s", unit: "s", provenance: Computed, definition: "averaging time m tau0 of the measured log's overlapping Allan deviation" },
        FieldUnit { path: "measured.adev[].adev", unit: "1", provenance: Computed, definition: "overlapping Allan deviation of the measured phase (fractional frequency)" },
        FieldUnit { path: "measured.adev[].n_samples", unit: "1", provenance: Computed, definition: "overlapping second differences averaged at this tau" },
        FieldUnit { path: "measured.adev[].edf", unit: "1", provenance: Computed, definition: "equivalent degrees of freedom for the identified noise type" },
        FieldUnit { path: "measured.adev[].ci_lo", unit: "1", provenance: Computed, definition: "lower end of the 95 % chi-squared interval on adev" },
        FieldUnit { path: "measured.adev[].ci_hi", unit: "1", provenance: Computed, definition: "upper end of the 95 % chi-squared interval on adev" },
        FieldUnit { path: "measured.tdev[].tau_s", unit: "s", provenance: Computed, definition: "averaging time m tau0 of the time deviation" },
        FieldUnit { path: "measured.tdev[].tdev_s", unit: "s", provenance: Computed, definition: "time deviation of the measured phase" },
        FieldUnit { path: "measured.mtie[].tau_s", unit: "s", provenance: Computed, definition: "observation interval m tau0 of the MTIE" },
        FieldUnit { path: "measured.mtie[].mtie_s", unit: "s", provenance: Computed, definition: "maximum time interval error of the measured phase over windows of m+1 samples" },
    ]
};

/// Units and provenance of the `clock_log` block a telecom-timing run adds when its series
/// is read through this layer.
pub const TELECOM_LOG_UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "clock_log.t0_s", unit: "s", provenance: Input, definition: "time of the first kept sample on the log's own time axis; the record's time_s counts from it" },
        FieldUnit { path: "clock_log.tau0_s", unit: "s", provenance: Computed, definition: "sample interval of the normalised series" },
        FieldUnit { path: "clock_log.n_parsed", unit: "1", provenance: Computed, definition: "readings parsed for the selected clock or channel" },
        FieldUnit { path: "clock_log.n_grid", unit: "1", provenance: Computed, definition: "grid epochs spanned by the readings" },
        FieldUnit { path: "clock_log.n_missing", unit: "1", provenance: Computed, definition: "missing grid epochs" },
        FieldUnit { path: "clock_log.n_gaps", unit: "1", provenance: Computed, definition: "runs of consecutive missing epochs" },
        FieldUnit { path: "clock_log.n_off_grid", unit: "1", provenance: Computed, definition: "readings off the grid, dropped" },
        FieldUnit { path: "clock_log.n_duplicates", unit: "1", provenance: Computed, definition: "duplicate readings, dropped" },
        FieldUnit { path: "clock_log.n_skipped_lines", unit: "1", provenance: Computed, definition: "lines neither data nor comment, skipped" },
        FieldUnit { path: "clock_log.n_interpolated", unit: "1", provenance: Computed, definition: "missing epochs filled by the linear gap policy" },
        FieldUnit { path: "clock_log.n_used", unit: "1", provenance: Computed, definition: "samples in the normalised series" },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;

    fn inp(format: &str) -> ClockLogInput {
        ClockLogInput {
            format: format.into(),
            ..Default::default()
        }
    }

    fn run(i: &ClockLogInput, text: &str) -> Result<NormalisedPhase, String> {
        let mut i = i.clone();
        i.text = Some(text.into());
        read_input(&i)
    }

    /// A RINEX 3.04 clock header: each record's label in columns 61-80.
    pub(crate) fn rinex_header() -> String {
        let h = |c: &str, l: &str| format!("{c:<60}{l}\n");
        [
            h(
                "     3.04           C                   G",
                "RINEX VERSION / TYPE",
            ),
            h(
                "kshana test                             20261012 000000 UTC",
                "PGM / RUN BY / DATE",
            ),
            h("GPS", "TIME SYSTEM ID"),
            h("     2    AR    AS", "# / TYPES OF DATA"),
            h("", "END OF HEADER"),
        ]
        .concat()
    }

    /// A two-clock RINEX 3.04 clock file, 30 s epochs, one AR clock (with a continuation
    /// line and a missing epoch) and one AS clock, hand-written to the format's layout.
    fn rinex() -> String {
        rinex_header()
            + "\
AR TST1      2026 10 12 00 00  0.000000  2    1.000000000000E-09  1.0E-12
AS G08       2026 10 12 00 00  0.000000  1    5.000000000000E-04
AR TST1      2026 10 12 00 00 30.000000  4    2.000000000000E-09  1.0E-12
    1.0D-14  0.0D+00
AS G08       2026 10 12 00 00 30.000000  1    5.000000100000E-04
AR TST1      2026 10 12 00 01  0.000000  2    4.000000000000E-09  1.0E-12
AS G08       2026 10 12 00 01  0.000000  1    5.000000200000E-04
AR TST1      2026 10 12 00 01 30.000000  2    7.000000000000E-09  1.0E-12
AR TST1      2026 10 12 00 02 30.000000  2    9.000000000000E-09  1.0E-12
AS G08       2026 10 12 00 01 30.000000  1    5.000000300000E-04
"
    }

    #[test]
    fn rinex_selects_a_clock_and_finds_tau0_and_gaps() {
        let rinex = rinex();
        let rinex = rinex.as_str();
        let mut i = inp("rinex-clk");
        assert!(run(&i, rinex).unwrap_err().contains("G08, TST1"));
        i.clock = Some("G08".into());
        let p = run(&i, rinex).unwrap();
        assert_eq!(p.tau0_s, 30.0);
        assert_eq!(p.tau0_source, "median-spacing");
        assert_eq!(p.time_system.as_deref(), Some("GPS"));
        assert_eq!(p.n_used, 4);
        assert!((p.phase_s[1] - 5.000000100000E-04).abs() < 1e-18);
        assert_eq!(p.time_s, vec![0.0, 30.0, 60.0, 90.0]);
        // TST1 misses 00:02:00: refused by default, counted.
        i.clock = Some("TST1".into());
        let e = run(&i, rinex).unwrap_err();
        assert!(e.contains("1 missing epoch(s) in 1 gap(s)"), "{e}");
        i.gaps = Some("linear".into());
        let p = run(&i, rinex).unwrap();
        assert_eq!(
            (p.n_grid, p.n_missing, p.n_interpolated, p.n_used),
            (6, 1, 1, 6)
        );
        assert!((p.phase_s[4] - 8e-9).abs() < 1e-21);
        assert!(
            (p.phase_s[1] - 2e-9).abs() < 1e-21,
            "continuation line skipped"
        );
        i.gaps = Some("longest".into());
        assert_eq!(run(&i, rinex).unwrap().n_used, 4);
    }

    #[test]
    fn rinex_needs_a_header() {
        assert!(run(&inp("rinex-clk"), "AR X 2026 1 1 0 0 0 1 1e-9\n").is_err());
    }

    #[test]
    fn timelab_single_column_with_header_tau0_and_units() {
        let t = "# TimeLab ASCII export\n# tau0 = 0.5\n# units = ns\n1.0\n2.0\n4.0\n7.0\n";
        let p = run(&inp("timelab"), t).unwrap();
        assert_eq!((p.tau0_s, p.tau0_source, p.unit_in), (0.5, "header", "ns"));
        assert_eq!(p.phase_s, vec![1e-9, 2e-9, 4e-9, 7e-9]);
        // tau0_s in the scenario wins over the header.
        let mut i = inp("timelab");
        i.tau0_s = Some(2.0);
        assert_eq!(run(&i, t).unwrap().tau0_s, 2.0);
        // No tau0 anywhere: refused.
        assert!(run(&inp("timelab"), "1\n2\n3\n")
            .unwrap_err()
            .contains("needs tau0"));
    }

    #[test]
    fn timelab_two_columns_detect_tau0_and_find_gaps() {
        let t = "time_s,phase_s\n0,0\n10,1e-9\n20,3e-9\n40,4e-9\n50,6e-9\n";
        let mut i = inp("timelab");
        assert!(run(&i, t).unwrap_err().contains("1 missing epoch"));
        i.gaps = Some("longest".into());
        let p = run(&i, t).unwrap();
        assert_eq!((p.tau0_s, p.n_used, p.t0_s), (10.0, 3, 0.0));
        // MJD time column.
        let m = "# time_units = mjd\n60000.0 1e-9\n60000.5 2e-9\n60001.0 3e-9\n";
        assert_eq!(run(&inp("timelab"), m).unwrap().tau0_s, 43_200.0);
    }

    #[test]
    fn timelab_frequency_integrates_to_phase() {
        let t = "; data = frequency\n; tau0 = 2\n1e-9\n-1e-9\n3e-9\n";
        let p = run(&inp("timelab"), t).unwrap();
        assert_eq!(p.data, "frequency");
        assert_eq!(p.unit_in, "1");
        let want = [0.0, 2e-9, 0.0, 6e-9];
        for (a, b) in p.phase_s.iter().zip(want) {
            assert!((a - b).abs() < 1e-24);
        }
        assert!(run(&inp("timelab"), "0 1e-9\n1 2e-9\n# data = frequency\n").is_err());
    }

    #[test]
    fn ticc_timestamp_mode_phase_gaps_and_channels() {
        // A 1 PPS on chA with a +100 ns/s offset and one missed pulse; chB interleaved;
        // start-up text and comments.
        let t = "\
TICC startup menu text
# timestamp mode
1.000000000100 chA
1.500000000000 chB
2.000000000200 chA
2.500000000000 chB
3.000000000300 chA
5.000000000500 chA
6.000000000600 chA
";
        let mut i = inp("ticc");
        assert!(run(&i, t).unwrap_err().contains("chA, chB"));
        i.channel = Some("chA".into());
        let e = run(&i, t).unwrap_err();
        assert!(e.contains("1 missing epoch(s)"), "{e}");
        i.gaps = Some("linear".into());
        let p = run(&i, t).unwrap();
        assert_eq!((p.tau0_s, p.n_skipped_lines, p.n_used), (1.0, 1, 6));
        for (k, x) in p.phase_s.iter().enumerate() {
            assert!((x - k as f64 * 1e-10).abs() < 1e-15, "{k} {x}");
        }
        // Period mode (non-increasing readings) is refused.
        let per = "1.000000000100 chA\n1.000000000200 chA\n0.999999999900 chA\n";
        assert!(run(&inp("ticc"), per).unwrap_err().contains("Period mode"));
    }

    #[test]
    fn ticc_interval_mode_needs_tau0() {
        let t = "0.000000001000 TI(A->B)\n0.000000001100 TI(A->B)\n0.000000001050 TI(A->B)\n";
        assert!(run(&inp("ticc"), t).unwrap_err().contains("tau0_s"));
        let mut i = inp("ticc");
        i.tau0_s = Some(1.0);
        let p = run(&i, t).unwrap();
        assert_eq!(p.clock, "TI(A->B)");
        assert_eq!(p.phase_s[1], 1.1e-9);
    }

    #[test]
    fn detect_tau0_rounds_a_counter_spacing() {
        assert_eq!(detect_tau0(&[0.0, 1.000000012, 2.000000025]), Some(1.0));
        assert_eq!(detect_tau0(&[0.0, 30.0, 90.0, 120.0]), Some(30.0));
        assert_eq!(detect_tau0(&[5.0]), None);
    }

    #[test]
    fn selectors_are_checked_against_the_format() {
        let mut i = inp("timelab");
        i.clock = Some("G08".into());
        assert!(run(&i, "1\n").is_err());
        assert!(run(&inp("csv"), "1\n")
            .unwrap_err()
            .contains("unknown clock-log format"));
        let mut i = inp("timelab");
        i.text = Some("1".into());
        i.path = Some("x".into());
        assert!(read_input(&i).unwrap_err().contains("not both"));
    }

    #[test]
    fn measured_report_curves_have_units() {
        let x: Vec<String> = (0..64)
            .map(|i| format!("{}", ((i * 37) % 11) as f64 * 1e-9))
            .collect();
        let t = format!("# tau0 = 1\n{}\n", x.join("\n"));
        let r = MeasuredPhaseReport::from_phase(run(&inp("timelab"), &t).unwrap());
        assert!(!r.adev.is_empty() && !r.tdev.is_empty() && !r.mtie.is_empty());
        assert_eq!(r.mtie[0].mtie_s, crate::allan::mtie(&r.log.phase_s, 1));
        let doc = serde_json::json!({ "measured": r });
        for p in crate::field_schema::numeric_leaf_paths(&doc) {
            assert!(
                MEASURED_UNITS.iter().any(|u| u.path == p),
                "no unit for {p}"
            );
        }
    }
}
