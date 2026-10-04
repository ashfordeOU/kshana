// SPDX-License-Identifier: AGPL-3.0-only
//! The truth sidecar: what the scene put into the samples, per satellite per epoch, so a
//! software receiver's output can be scored against it.

use crate::iq::IqError;
use serde::{Deserialize, Serialize};
use std::io::Write;

/// The injected state of one satellite's direct (geometric) signal at one epoch.
///
/// All values are of the signal **as generated** (the generator's interpolated geometry),
/// so a perfect receiver measures exactly these. Paths a channel hook adds are not
/// described here; a channel's extra delay, phase and Doppler are the channel's own truth.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct TruthRecord {
    /// Epoch, receiver time (s from scene start, the time of sample `t * fs`).
    pub t_s: f64,
    /// Satellite identifier (the PRN for GPS).
    pub sat_id: u32,
    /// Whether the satellite is above the elevation mask (no signal is generated if not).
    pub visible: bool,
    /// Elevation (degrees).
    pub elevation_deg: f64,
    /// Azimuth (degrees clockwise from north).
    pub azimuth_deg: f64,
    /// C/N0 of the direct path (dB-Hz).
    pub cn0_dbhz: f64,
    /// Pseudorange (m): geometric range plus `c` times receiver clock offset less
    /// satellite clock offset.
    pub pseudorange_m: f64,
    /// Code phase (chips, in `[0, code length)`) of the code arriving at this epoch, the
    /// quantity [`crate::sdr::acquire`] reports.
    pub code_phase_chips: f64,
    /// Carrier Doppler (Hz): `-f_carrier * (dP/dt) / c`, i.e. `-range_rate / λ` with the
    /// pseudorange rate.
    pub doppler_hz: f64,
    /// Accumulated carrier phase of the baseband signal excluding the intermediate
    /// frequency (cycles): `-f_carrier * P / c`. Its time derivative is `doppler_hz`.
    pub carrier_phase_cycles: f64,
}

impl TruthRecord {
    /// The CSV header line (no trailing newline) matching [`Self::csv_row`].
    pub const CSV_HEADER: &'static str = "t_s,sat_id,visible,elevation_deg,azimuth_deg,cn0_dbhz,pseudorange_m,code_phase_chips,doppler_hz,carrier_phase_cycles";

    /// One CSV row (no trailing newline). Floats print with Rust's shortest round-trip
    /// formatting, so parsing a row gives back the exact values.
    pub fn csv_row(&self) -> String {
        format!(
            "{},{},{},{},{},{},{},{},{},{}",
            self.t_s,
            self.sat_id,
            self.visible as u8,
            self.elevation_deg,
            self.azimuth_deg,
            self.cn0_dbhz,
            self.pseudorange_m,
            self.code_phase_chips,
            self.doppler_hz,
            self.carrier_phase_cycles
        )
    }

    /// Parse a row written by [`Self::csv_row`].
    pub fn from_csv_row(line: &str) -> Result<Self, IqError> {
        let f: Vec<&str> = line.trim().split(',').collect();
        if f.len() != 10 {
            return Err(IqError::Format(format!(
                "truth row has {} fields, expected 10",
                f.len()
            )));
        }
        let num = |i: usize| -> Result<f64, IqError> {
            f[i].parse::<f64>()
                .map_err(|e| IqError::Format(format!("truth field {i}: {e}")))
        };
        Ok(Self {
            t_s: num(0)?,
            sat_id: f[1]
                .parse()
                .map_err(|e| IqError::Format(format!("truth sat_id: {e}")))?,
            visible: f[2] == "1",
            elevation_deg: num(3)?,
            azimuth_deg: num(4)?,
            cn0_dbhz: num(5)?,
            pseudorange_m: num(6)?,
            code_phase_chips: num(7)?,
            doppler_hz: num(8)?,
            carrier_phase_cycles: num(9)?,
        })
    }
}

/// Where truth records go as a scene is generated.
pub trait TruthSink {
    /// Accept one record (records arrive in epoch order, satellites in scene order).
    fn record(&mut self, r: &TruthRecord) -> Result<(), IqError>;
    /// Flush and finish.
    fn finish(&mut self) -> Result<(), IqError> {
        Ok(())
    }
}

/// Keeps every record in memory (short scenes and tests).
impl TruthSink for Vec<TruthRecord> {
    fn record(&mut self, r: &TruthRecord) -> Result<(), IqError> {
        self.push(*r);
        Ok(())
    }
}

/// Discards every record.
#[derive(Clone, Copy, Debug, Default)]
pub struct NullTruth;

impl TruthSink for NullTruth {
    fn record(&mut self, _r: &TruthRecord) -> Result<(), IqError> {
        Ok(())
    }
}

/// Streams records as CSV ([`TruthRecord::CSV_HEADER`] then one row per record), in
/// bounded memory.
pub struct CsvTruthWriter<W: Write> {
    out: W,
    header_written: bool,
}

impl<W: Write> CsvTruthWriter<W> {
    /// A writer onto `out` (wrap a file in a `BufWriter`).
    pub fn new(out: W) -> Self {
        Self {
            out,
            header_written: false,
        }
    }
    /// The underlying writer.
    pub fn into_inner(self) -> W {
        self.out
    }
    fn header(&mut self) -> Result<(), IqError> {
        if !self.header_written {
            writeln!(self.out, "{}", TruthRecord::CSV_HEADER).map_err(io)?;
            self.header_written = true;
        }
        Ok(())
    }
}

impl<W: Write> TruthSink for CsvTruthWriter<W> {
    fn record(&mut self, r: &TruthRecord) -> Result<(), IqError> {
        self.header()?;
        writeln!(self.out, "{}", r.csv_row()).map_err(io)
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.header()?;
        self.out.flush().map_err(io)
    }
}

/// Streams records as JSON Lines (one JSON object per line), in bounded memory.
pub struct JsonLinesTruthWriter<W: Write> {
    out: W,
}

impl<W: Write> JsonLinesTruthWriter<W> {
    /// A writer onto `out`.
    pub fn new(out: W) -> Self {
        Self { out }
    }
    /// The underlying writer.
    pub fn into_inner(self) -> W {
        self.out
    }
}

impl<W: Write> TruthSink for JsonLinesTruthWriter<W> {
    fn record(&mut self, r: &TruthRecord) -> Result<(), IqError> {
        let s = serde_json::to_string(r).map_err(|e| IqError::Format(e.to_string()))?;
        writeln!(self.out, "{s}").map_err(io)
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.out.flush().map_err(io)
    }
}

/// A whole truth table as CSV text.
pub fn truth_to_csv(records: &[TruthRecord]) -> String {
    let mut s = String::from(TruthRecord::CSV_HEADER);
    s.push('\n');
    for r in records {
        s.push_str(&r.csv_row());
        s.push('\n');
    }
    s
}

/// Parse CSV text written by [`truth_to_csv`] or [`CsvTruthWriter`].
pub fn truth_from_csv(text: &str) -> Result<Vec<TruthRecord>, IqError> {
    let mut lines = text.lines();
    match lines.next() {
        Some(h) if h.trim() == TruthRecord::CSV_HEADER => {}
        _ => return Err(IqError::Format("missing truth CSV header".into())),
    }
    lines
        .filter(|l| !l.trim().is_empty())
        .map(TruthRecord::from_csv_row)
        .collect()
}

/// A whole truth table as a JSON array.
pub fn truth_to_json(records: &[TruthRecord]) -> Result<String, IqError> {
    serde_json::to_string(records).map_err(|e| IqError::Format(e.to_string()))
}

/// Parse a JSON array written by [`truth_to_json`].
pub fn truth_from_json(text: &str) -> Result<Vec<TruthRecord>, IqError> {
    serde_json::from_str(text).map_err(|e| IqError::Format(e.to_string()))
}

fn io(e: std::io::Error) -> IqError {
    IqError::Io(e.to_string())
}
