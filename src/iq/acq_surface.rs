// SPDX-License-Identifier: AGPL-3.0-only
//! **Acquisition-surface export** (`kshana.acq-surface/1`): the whole Doppler × code-phase
//! correlation-power surface one [`acquire`](super::acq::acquire) search computes, with the
//! peak and two fine-Doppler refinements, as CSV, JSON or a compact binary form.
//!
//! The surface is the normalised cell power `2·G/(L·σ²)` of the search itself: the cells
//! are the ones `acquire` compares with its threshold, bit for bit (both come from
//! `acq::power_rows`). Row `j` is Doppler bin `doppler_bins_hz[j]`; column `t` is lag `t`
//! samples, i.e. code phase `(−t · chips_per_sample) mod code_len_chips` at the first
//! sample searched ([`AcqResult::code_phase_chips`](super::acq::AcqResult)).
//!
//! The Doppler bin is coarse (`2 / (3·N·T_code)`, 167 Hz at 4 ms), so the peak bin can be
//! up to half a bin from the truth. Two refinements are reported next to it and never
//! replace it:
//!
//! * **parabolic**: a parabola through the *amplitudes* (√power) of the peak lag in the peak
//!   bin and its two neighbours; closed form, no extra correlation, biased for a sinc
//!   response and absent at the edge of the grid or when the three points are not concave;
//! * **fine search**: the same correlation re-run at Doppler offsets of `−1 … +1` bin in
//!   steps of 1/[`FINE_STEPS_PER_BIN`] bin, taking the largest power at the peak lag, so the
//!   quantisation is `bin / (2·FINE_STEPS_PER_BIN)` (about 5 Hz at 4 ms).
//!
//! Files: **CSV** (`#` comment lines with the header's scalars, then
//! `doppler_hz,delay_samples,code_phase_chips,power`, one row per cell), **JSON**
//! (`{"header": …, "rows": [[…]]}`) and **binary** (the header as one JSON line, then
//! `doppler bins × samples_per_period` little-endian `f64`, row-major).

use super::acq::{acquire, power_rows, AcqConfig};
use super::{Cf64, IqError, SampleSpec, SpreadingCode};
use serde::{Deserialize, Serialize};
use std::io::{BufRead, Write};

/// The schema identifier.
pub const SURFACE_SCHEMA: &str = "kshana.acq-surface/1";

/// Fine-search sub-steps per Doppler bin.
pub const FINE_STEPS_PER_BIN: usize = 16;

/// The most cells (Doppler bins × samples per period) one surface may hold.
pub const MAX_SURFACE_CELLS: usize = 20_000_000;

/// A refined Doppler estimate.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct FineDoppler {
    /// Doppler (Hz, relative to the intermediate frequency).
    pub doppler_hz: f64,
    /// `doppler_hz` minus the peak bin's Doppler (Hz).
    pub correction_hz: f64,
    /// Normalised power at the estimate (parabolic: the vertex of the amplitude parabola
    /// squared; fine search: the largest fine cell).
    pub power: f64,
}

/// The peak of the search.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SurfacePeak {
    /// Doppler of the peak bin (Hz).
    pub doppler_hz: f64,
    /// Index of the peak Doppler row.
    pub doppler_index: usize,
    /// Lag of the peak (samples).
    pub delay_samples: usize,
    /// Code phase at the first sample searched (chips).
    pub code_phase_chips: f64,
    /// Normalised peak power.
    pub statistic: f64,
    /// The detection threshold.
    pub threshold: f64,
    /// Whether the peak cleared the threshold.
    pub acquired: bool,
    /// Largest cell in the peak row more than a chip from the peak.
    pub second_peak: f64,
    /// `statistic / second_peak`.
    pub peak_ratio: f64,
}

/// The surface's description.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SurfaceHeader {
    /// [`SURFACE_SCHEMA`].
    pub schema: String,
    /// The code searched.
    pub code: String,
    /// Sample rate (Hz).
    pub sample_rate_hz: f64,
    /// Centre frequency of the stream (Hz).
    pub center_hz: f64,
    /// Intermediate frequency of the stream (Hz).
    pub if_hz: f64,
    /// Coherent periods `N`.
    pub coherent_periods: usize,
    /// Non-coherent blocks `M`.
    pub noncoherent: usize,
    /// Doppler search half-width (Hz).
    pub doppler_max_hz: f64,
    /// Doppler bin spacing (Hz).
    pub doppler_step_hz: f64,
    /// Whole-grid false-alarm probability.
    pub pfa: f64,
    /// Doppler of each row (Hz).
    pub doppler_bins_hz: Vec<f64>,
    /// Columns: samples per code period.
    pub samples_per_period: usize,
    /// Chips per sample (`chip_rate / fs`); code phase of lag `t` is
    /// `(−t · chips_per_sample) mod code_len_chips`.
    pub chips_per_sample: f64,
    /// Code length (chips).
    pub code_len_chips: f64,
    /// Mean sample power `σ²` the cells are normalised by.
    pub sample_power: f64,
    /// The peak.
    pub peak: SurfacePeak,
    /// Parabolic refinement, when the peak bin has both neighbours and the three amplitudes
    /// are concave.
    pub parabolic: Option<FineDoppler>,
    /// Fine-search refinement.
    pub fine_search: FineDoppler,
    /// Version of the engine that wrote the surface.
    pub engine_version: String,
}

/// One search's full surface.
#[derive(Clone, Debug, PartialEq)]
pub struct Surface {
    /// The description.
    pub header: SurfaceHeader,
    /// Normalised cell power, `grid[doppler_index][lag]`.
    pub grid: Vec<Vec<f64>>,
}

/// The output format of a surface file.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SurfaceFormat {
    /// Long-form CSV.
    Csv,
    /// One JSON document.
    Json,
    /// Header line plus little-endian `f64`.
    Binary,
}

impl SurfaceFormat {
    /// Parse `csv`, `json` or `bin`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s {
            "csv" => Ok(Self::Csv),
            "json" => Ok(Self::Json),
            "bin" | "binary" => Ok(Self::Binary),
            _ => Err(format!(
                "unknown surface format {s:?}: expected csv, json or bin"
            )),
        }
    }

    /// The format a path's suffix names.
    pub fn from_path(p: &str) -> Option<Self> {
        let ext = std::path::Path::new(p).extension()?.to_str()?;
        Self::parse(&ext.to_ascii_lowercase()).ok()
    }
}

impl Surface {
    /// Search `samples` for `code` with `cfg` and keep the whole surface and the peak's
    /// refinements. `samples` must hold [`super::acq::samples_needed`] samples.
    pub fn compute(
        samples: &[Cf64],
        spec: &SampleSpec,
        code: &dyn SpreadingCode,
        cfg: &AcqConfig,
    ) -> Result<Self, String> {
        let spc_cells = super::acq::samples_per_period(spec, code)? * cfg.doppler_bins().len();
        if spc_cells > MAX_SURFACE_CELLS {
            return Err(format!(
                "the surface would hold {spc_cells} cells (limit {MAX_SURFACE_CELLS}): widen \
                 the Doppler step or narrow the Doppler range"
            ));
        }
        let found = acquire(samples, spec, code, cfg)?;
        let r = &found.result;
        let bins = cfg.doppler_bins();
        let grid = found.grid;
        let (jb, tb) = (r.doppler_index, r.delay_samples);

        let parabolic = if jb > 0 && jb + 1 < bins.len() {
            let (a, b, c) = (
                grid[jb - 1][tb].sqrt(),
                grid[jb][tb].sqrt(),
                grid[jb + 1][tb].sqrt(),
            );
            let den = a - 2.0 * b + c;
            (den < 0.0).then(|| {
                let delta = 0.5 * (a - c) / den;
                let vertex = b - 0.25 * (a - c) * delta;
                FineDoppler {
                    doppler_hz: bins[jb] + delta * cfg.doppler_step_hz,
                    correction_hz: delta * cfg.doppler_step_hz,
                    power: vertex * vertex,
                }
            })
        } else {
            None
        };

        let fine: Vec<f64> = (-(FINE_STEPS_PER_BIN as i64)..=FINE_STEPS_PER_BIN as i64)
            .map(|k| bins[jb] + k as f64 * cfg.doppler_step_hz / FINE_STEPS_PER_BIN as f64)
            .collect();
        let (rows, _) = power_rows(samples, spec, code, cfg, &fine)?;
        let (kb, pb) = rows
            .iter()
            .enumerate()
            .map(|(k, row)| (k, row[tb]))
            .fold((0, f64::NEG_INFINITY), |m, x| if x.1 > m.1 { x } else { m });
        let fine_search = FineDoppler {
            doppler_hz: fine[kb],
            correction_hz: fine[kb] - bins[jb],
            power: pb,
        };

        let chips_per_sample = code.chip_rate_hz() / spec.fs_hz;
        Ok(Self {
            header: SurfaceHeader {
                schema: SURFACE_SCHEMA.into(),
                code: r.code_name.clone(),
                sample_rate_hz: spec.fs_hz,
                center_hz: spec.center_hz,
                if_hz: spec.if_hz,
                coherent_periods: cfg.coherent_periods,
                noncoherent: cfg.noncoherent,
                doppler_max_hz: cfg.doppler_max_hz,
                doppler_step_hz: cfg.doppler_step_hz,
                pfa: cfg.pfa,
                doppler_bins_hz: bins,
                samples_per_period: r.samples_per_period,
                chips_per_sample,
                code_len_chips: code.len_chips() as f64,
                sample_power: r.sample_power,
                peak: SurfacePeak {
                    doppler_hz: r.doppler_hz,
                    doppler_index: r.doppler_index,
                    delay_samples: r.delay_samples,
                    code_phase_chips: r.code_phase_chips,
                    statistic: r.statistic,
                    threshold: r.threshold,
                    acquired: r.acquired,
                    second_peak: r.second_peak,
                    peak_ratio: r.peak_ratio,
                },
                parabolic,
                fine_search,
                engine_version: env!("CARGO_PKG_VERSION").into(),
            },
            grid,
        })
    }

    /// Code phase (chips) of lag `t`.
    pub fn code_phase_chips(&self, t: usize) -> f64 {
        (-(t as f64) * self.header.chips_per_sample).rem_euclid(self.header.code_len_chips)
    }

    /// Write the surface in `fmt`.
    pub fn write(&self, w: &mut dyn Write, fmt: SurfaceFormat) -> Result<(), IqError> {
        let io = |e: std::io::Error| IqError::Io(e.to_string());
        let js = |e: serde_json::Error| IqError::Format(e.to_string());
        match fmt {
            SurfaceFormat::Csv => {
                let h = &self.header;
                writeln!(w, "# {}", h.schema).map_err(io)?;
                writeln!(w, "# code={}", h.code).map_err(io)?;
                writeln!(
                    w,
                    "# sample_rate_hz={} coherent_periods={} noncoherent={} doppler_step_hz={}",
                    h.sample_rate_hz, h.coherent_periods, h.noncoherent, h.doppler_step_hz
                )
                .map_err(io)?;
                writeln!(
                    w,
                    "# peak doppler_hz={} delay_samples={} code_phase_chips={} statistic={} \
                     threshold={} acquired={}",
                    h.peak.doppler_hz,
                    h.peak.delay_samples,
                    h.peak.code_phase_chips,
                    h.peak.statistic,
                    h.peak.threshold,
                    h.peak.acquired
                )
                .map_err(io)?;
                if let Some(p) = &h.parabolic {
                    writeln!(
                        w,
                        "# parabolic doppler_hz={} power={}",
                        p.doppler_hz, p.power
                    )
                    .map_err(io)?;
                }
                writeln!(
                    w,
                    "# fine_search doppler_hz={} power={}",
                    h.fine_search.doppler_hz, h.fine_search.power
                )
                .map_err(io)?;
                writeln!(w, "doppler_hz,delay_samples,code_phase_chips,power").map_err(io)?;
                for (j, row) in self.grid.iter().enumerate() {
                    for (t, v) in row.iter().enumerate() {
                        writeln!(
                            w,
                            "{},{},{},{}",
                            h.doppler_bins_hz[j],
                            t,
                            self.code_phase_chips(t),
                            v
                        )
                        .map_err(io)?;
                    }
                }
            }
            SurfaceFormat::Json => {
                let v = serde_json::json!({ "header": self.header, "rows": self.grid });
                serde_json::to_writer(&mut *w, &v).map_err(js)?;
                writeln!(w).map_err(io)?;
            }
            SurfaceFormat::Binary => {
                let line = serde_json::to_string(&self.header).map_err(js)?;
                writeln!(w, "{line}").map_err(io)?;
                for row in &self.grid {
                    for v in row {
                        w.write_all(&v.to_le_bytes()).map_err(io)?;
                    }
                }
            }
        }
        w.flush().map_err(io)
    }

    /// Read a surface written in the binary form.
    pub fn read_binary<R: BufRead>(mut r: R) -> Result<Self, IqError> {
        let io = |e: std::io::Error| IqError::Io(e.to_string());
        let mut line = Vec::new();
        r.read_until(b'\n', &mut line).map_err(io)?;
        let header: SurfaceHeader = serde_json::from_slice(&line)
            .map_err(|e| IqError::Format(format!("surface header: {e}")))?;
        if header.schema != SURFACE_SCHEMA {
            return Err(IqError::Format(format!(
                "surface schema {:?}; expected {SURFACE_SCHEMA:?}",
                header.schema
            )));
        }
        let (rows, cols) = (header.doppler_bins_hz.len(), header.samples_per_period);
        if rows.saturating_mul(cols) > MAX_SURFACE_CELLS {
            return Err(IqError::Format(
                "surface header names too many cells".into(),
            ));
        }
        let mut grid = Vec::with_capacity(rows);
        let mut buf = vec![0u8; 8 * cols];
        for _ in 0..rows {
            r.read_exact(&mut buf)
                .map_err(|e| IqError::Format(format!("surface body: {e}")))?;
            grid.push(
                buf.chunks_exact(8)
                    .map(|c| f64::from_le_bytes(c.try_into().unwrap_or([0; 8])))
                    .collect(),
            );
        }
        Ok(Self { header, grid })
    }
}
