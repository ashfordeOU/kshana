// SPDX-License-Identifier: AGPL-3.0-only
//! **Receiver-antenna characterisation tools: ANTEX lint, unit spread across individual
//! calibrations, calibration comparison (for example robot against chamber), group-delay
//! timing budget and the installation J/S margin.**
//!
//! * [`lint`] checks an ANTEX 1.4 file (IGS, `antex14.txt`) record by record: the header
//!   records, block pairing (`START`/`END OF ANTENNA`, `START`/`END OF FREQUENCY`, the RMS
//!   blocks), the mandatory records of each antenna, the grid (`DAZI` dividing 360, the zenith
//!   range a whole number of `DZEN` steps), the declared number of frequencies, frequency codes,
//!   the number of values in every `NOAZI` and azimuth row, the azimuth sequence, the validity
//!   interval, duplicate entries, tabs, and plausibility of receiver offsets and variations. It
//!   reads the real `igs20.atx` excerpt in `tests/fixtures` without an error.
//! * [`spread`] takes several individual calibrations of one antenna type (one ANTEX file or
//!   several) and states, per frequency, the spread of the offsets (north, east, up) and of the
//!   azimuth-independent variation at each zenith angle across the units: the unit-to-unit
//!   scatter a type-mean calibration ignores.
//! * [`compare`] sets two calibrations of one antenna side by side through what a receiver
//!   uses: the phase-centre correction along the line of sight,
//!   `PCC(z, a) = −r·PCO + PCV(z, a)` with `r` the unit line-of-sight vector, on a grid of
//!   zenith and azimuth angles, per frequency and for the GPS L1/L2 ionosphere-free
//!   combination. A constant is removed (a receiver clock absorbs it), and the offsets and
//!   variations are not compared separately because only their sum is observable.
//! * [`group_delay`] states the timing bias an antenna's group delay puts on each signal and on
//!   ionosphere-free pairs, and its variation with elevation and temperature.
//! * [`js_margin`] states the jammer-to-signal ratio at the receiver input for an installation:
//!   free-space path loss, the antenna gain toward the jammer and toward the satellite, and a
//!   stated isolation, with the stand-off distance at which a stated receiver J/S tolerance is
//!   reached. It is a link budget for siting; it does not steer, null or control an antenna.
//!
//! Field calibration of offsets and variations from station data (the backlog item's hosted
//! part) is not here.
//!
//! **Labels.** The lint is a format check of an input file. The spread and comparison are
//! arithmetic on the calibrations given. The group-delay and J/S figures are MODELLED from the
//! stated inputs; the antenna gain presets of [`js_margin`] are illustrative shapes, not any
//! product's pattern.

use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};
use std::collections::{BTreeMap, BTreeSet};

/// Schema ids of the documents.
pub const LINT_SCHEMA: &str = "kshana.antex-lint/1";
pub const SPREAD_SCHEMA: &str = "kshana.antenna-spread/1";
pub const COMPARE_SCHEMA: &str = "kshana.antenna-compare/1";
pub const GROUP_DELAY_SCHEMA: &str = "kshana.antenna-group-delay/1";
pub const JS_SCHEMA: &str = "kshana.antenna-js-margin/1";

const C: f64 = 299_792_458.0;

/// Frequency codes ANTEX 1.4 defines (system letter and RINEX band number).
const FREQ_CODES: &[&str] = &[
    "G01", "G02", "G05", "R01", "R02", "R04", "R06", "E01", "E05", "E06", "E07", "E08", "C01",
    "C02", "C05", "C06", "C07", "C08", "J01", "J02", "J05", "J06", "S01", "S05", "I05", "I09",
];

/// Carrier frequency (Hz) of an ANTEX frequency code, where it is a single frequency.
pub fn freq_hz(code: &str) -> Option<f64> {
    Some(match code {
        "G01" | "E01" | "J01" | "S01" | "C01" => 1_575_420_000.0,
        "G02" | "J02" => 1_227_600_000.0,
        "G05" | "E05" | "J05" | "S05" | "C05" | "I05" => 1_176_450_000.0,
        "E06" | "J06" => 1_278_750_000.0,
        "E07" | "C07" => 1_207_140_000.0,
        "E08" | "C08" => 1_191_795_000.0,
        "C02" => 1_561_098_000.0,
        "C06" => 1_268_520_000.0,
        "I09" => 2_492_028_000.0,
        _ => return None,
    })
}

// ─────────────────────────────── ANTEX parsing ───────────────────────────────

/// One frequency of one antenna.
#[derive(Clone, Debug, Default, Serialize, PartialEq)]
pub struct Frequency {
    pub code: String,
    /// North, east, up offset (mm).
    pub pco_mm: [f64; 3],
    /// Azimuth-independent variation per zenith (mm).
    pub noazi_mm: Vec<f64>,
    /// Azimuth rows: (azimuth deg, values per zenith mm).
    pub azi_mm: Vec<(f64, Vec<f64>)>,
}

/// One antenna block.
#[derive(Clone, Debug, Default, Serialize, PartialEq)]
pub struct Antenna {
    /// Type and radome (20 characters, trailing blanks trimmed).
    pub type_radome: String,
    /// Serial number or satellite code.
    pub serial: String,
    pub method: String,
    pub agency: String,
    pub n_calibrated: Option<u32>,
    pub date: String,
    pub dazi: f64,
    pub zen: [f64; 3],
    pub n_freq_declared: Option<usize>,
    pub valid_from: Option<String>,
    pub valid_until: Option<String>,
    pub sinex_code: Option<String>,
    pub freqs: Vec<Frequency>,
    /// First line of the block (1-based).
    pub line: usize,
}

impl Antenna {
    /// Whether the block is a satellite antenna (a satellite code in the serial field, e.g.
    /// `G01`, as ANTEX writes them).
    pub fn is_satellite(&self) -> bool {
        let s = self.serial.trim();
        s.len() == 3
            && s.chars().next().is_some_and(|c| "GRECJSI".contains(c))
            && s[1..].chars().all(|c| c.is_ascii_digit())
    }
    /// Zenith angles of the grid (deg).
    pub fn zeniths(&self) -> Vec<f64> {
        let [z1, z2, dz] = self.zen;
        if dz.is_nan() || dz <= 0.0 || z2 < z1 {
            return Vec::new();
        }
        let n = ((z2 - z1) / dz).round() as usize + 1;
        (0..n).map(|i| z1 + i as f64 * dz).collect()
    }
    pub fn freq(&self, code: &str) -> Option<&Frequency> {
        self.freqs.iter().find(|f| f.code == code)
    }
}

/// One lint finding.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Finding {
    /// `error` (the file breaks the format) or `warning` (it parses but a value is
    /// implausible or a convention is not followed).
    pub severity: &'static str,
    pub line: usize,
    pub code: &'static str,
    pub detail: String,
}

fn label(line: &str) -> &str {
    line.get(60..).map(str::trim_end).unwrap_or("")
}

fn f64_at(line: &str, a: usize, b: usize) -> Option<f64> {
    line.get(a..b.min(line.len()))
        .map(str::trim)
        .filter(|s| !s.is_empty())
        .and_then(|s| s.parse().ok())
}

fn values(s: &str, width: usize) -> Result<Vec<f64>, String> {
    let s = s.trim_end();
    let mut out = Vec::new();
    let mut i = 0;
    while i < s.len() {
        let cell = s
            .get(i..(i + width).min(s.len()))
            .ok_or_else(|| s.to_string())?;
        let t = cell.trim();
        if !t.is_empty() {
            out.push(t.parse::<f64>().map_err(|_| t.to_string())?);
        }
        i += width;
    }
    Ok(out)
}

/// Parse an ANTEX file, collecting lint findings. Returns the antennas that could be read.
pub fn parse(text: &str) -> (Vec<Antenna>, Vec<Finding>) {
    let mut ants = Vec::new();
    let mut f = Vec::new();
    let push =
        |f: &mut Vec<Finding>, sev: &'static str, line: usize, code: &'static str, d: String| {
            f.push(Finding {
                severity: sev,
                line,
                code,
                detail: d,
            })
        };
    let mut in_header = true;
    let (mut saw_version, mut saw_pcv_type) = (false, false);
    let mut cur: Option<Antenna> = None;
    let mut cur_freq: Option<Frequency> = None;
    let mut in_rms = false;
    let mut nzen = 0usize;
    for (i, raw) in text.lines().enumerate() {
        let ln = i + 1;
        let line = raw.trim_end_matches('\r');
        if line.contains('\t') {
            push(
                &mut f,
                "error",
                ln,
                "tab",
                "a tab character in a fixed-column record".into(),
            );
        }
        let lab = label(line);
        if in_header {
            match lab {
                "ANTEX VERSION / SYST" => {
                    saw_version = true;
                    match f64_at(line, 0, 8) {
                        Some(v) if (v - 1.4).abs() < 1e-9 => {}
                        Some(v) => push(&mut f, "warning", ln, "version", format!("{v}")),
                        None => push(&mut f, "error", ln, "version", line.into()),
                    }
                }
                "PCV TYPE / REFANT" => {
                    saw_pcv_type = true;
                    match line.get(0..1) {
                        Some("A") | Some("R") => {}
                        _ => push(&mut f, "error", ln, "pcv-type", line.into()),
                    }
                }
                "END OF HEADER" => {
                    in_header = false;
                    if !saw_version {
                        push(&mut f, "error", ln, "missing-version", String::new());
                    }
                    if !saw_pcv_type {
                        push(&mut f, "error", ln, "missing-pcv-type", String::new());
                    }
                }
                "COMMENT" => {}
                other => push(&mut f, "warning", ln, "unknown-header-label", other.into()),
            }
            continue;
        }
        // Inside a frequency block, the value rows carry no label: NOAZI and azimuth rows.
        if let Some(fr) = cur_freq.as_mut() {
            if lab == "END OF FREQUENCY" || lab == "END OF FREQ RMS" {
                let code = line.get(3..6).unwrap_or("").to_string();
                if code != fr.code {
                    push(
                        &mut f,
                        "error",
                        ln,
                        "frequency-mismatch",
                        format!("{} / {}", fr.code, code),
                    );
                }
                if (lab == "END OF FREQ RMS") != in_rms {
                    push(&mut f, "error", ln, "frequency-block-mismatch", lab.into());
                }
                if !in_rms {
                    let a = cur.as_mut().expect("frequency inside an antenna");
                    check_grid(a, fr, ln, nzen, &mut f);
                    a.freqs.push(std::mem::take(fr));
                }
                cur_freq = None;
                in_rms = false;
                continue;
            }
            if lab == "NORTH / EAST / UP" {
                match (
                    f64_at(line, 0, 10),
                    f64_at(line, 10, 20),
                    f64_at(line, 20, 30),
                ) {
                    (Some(n), Some(e), Some(u)) => {
                        if !in_rms {
                            fr.pco_mm = [n, e, u]
                        }
                    }
                    _ => push(&mut f, "error", ln, "bad-offset", line.into()),
                }
                continue;
            }
            if line.get(3..8) == Some("NOAZI") {
                match values(line.get(8..).unwrap_or(""), 8) {
                    Ok(v) => {
                        if v.len() != nzen {
                            push(
                                &mut f,
                                "error",
                                ln,
                                "noazi-count",
                                format!("{} values, grid has {nzen}", v.len()),
                            );
                        }
                        if !in_rms {
                            fr.noazi_mm = v;
                        }
                    }
                    Err(t) => push(&mut f, "error", ln, "bad-number", t),
                }
                continue;
            }
            // Value rows run past column 60, so columns 61-80 hold numbers there, not a label.
            if lab == "COMMENT" {
                continue;
            }
            // An azimuth row: F8.1 azimuth then the values; anything else is a bad row.
            match (f64_at(line, 0, 8), values(line.get(8..).unwrap_or(""), 8)) {
                (Some(az), Ok(v)) => {
                    if v.len() != nzen {
                        push(
                            &mut f,
                            "error",
                            ln,
                            "azimuth-row-count",
                            format!("azimuth {az}: {} values, grid has {nzen}", v.len()),
                        );
                    }
                    if !in_rms {
                        fr.azi_mm.push((az, v));
                    }
                }
                _ => push(
                    &mut f,
                    "error",
                    ln,
                    "bad-row",
                    line.chars().take(40).collect(),
                ),
            }
            continue;
        }
        match lab {
            "START OF ANTENNA" => {
                if cur.is_some() {
                    push(&mut f, "error", ln, "nested-antenna", String::new());
                }
                cur = Some(Antenna {
                    line: ln,
                    ..Default::default()
                });
            }
            "END OF ANTENNA" => match cur.take() {
                Some(a) => {
                    check_antenna(&a, ln, &mut f);
                    ants.push(a);
                }
                None => push(&mut f, "error", ln, "end-without-start", String::new()),
            },
            _ if cur.is_none() => {
                if !lab.is_empty() && lab != "COMMENT" {
                    push(&mut f, "error", ln, "record-outside-antenna", lab.into());
                } else if lab.is_empty() && !line.trim().is_empty() {
                    push(
                        &mut f,
                        "error",
                        ln,
                        "unlabelled-line",
                        line.chars().take(40).collect(),
                    );
                }
            }
            "TYPE / SERIAL NO" => {
                let a = cur.as_mut().expect("checked");
                a.type_radome = line.get(0..20).unwrap_or("").trim_end().to_string();
                a.serial = line.get(20..40).unwrap_or("").trim().to_string();
            }
            "METH / BY / # / DATE" => {
                let a = cur.as_mut().expect("checked");
                a.method = line.get(0..20).unwrap_or("").trim().to_string();
                a.agency = line.get(20..40).unwrap_or("").trim().to_string();
                a.n_calibrated = line.get(40..46).and_then(|s| s.trim().parse().ok());
                a.date = line.get(50..60).unwrap_or("").trim().to_string();
            }
            "DAZI" => match f64_at(line, 2, 8) {
                Some(v) => cur.as_mut().expect("checked").dazi = v,
                None => push(&mut f, "error", ln, "bad-dazi", line.into()),
            },
            "ZEN1 / ZEN2 / DZEN" => match (
                f64_at(line, 2, 8),
                f64_at(line, 8, 14),
                f64_at(line, 14, 20),
            ) {
                (Some(a), Some(b), Some(c)) => {
                    let an = cur.as_mut().expect("checked");
                    an.zen = [a, b, c];
                    nzen = an.zeniths().len();
                }
                _ => push(&mut f, "error", ln, "bad-zenith-grid", line.into()),
            },
            "# OF FREQUENCIES" => match line.get(0..6).and_then(|s| s.trim().parse().ok()) {
                Some(n) => cur.as_mut().expect("checked").n_freq_declared = Some(n),
                None => push(&mut f, "error", ln, "bad-frequency-count", line.into()),
            },
            "VALID FROM" | "VALID UNTIL" => {
                let v = line.get(0..43).unwrap_or("").trim().to_string();
                let ok = values_ws(&v).is_some_and(|x| x.len() == 6);
                if !ok {
                    push(&mut f, "error", ln, "bad-validity", v.clone());
                }
                let a = cur.as_mut().expect("checked");
                if lab == "VALID FROM" {
                    a.valid_from = Some(v)
                } else {
                    a.valid_until = Some(v)
                }
            }
            "SINEX CODE" => {
                cur.as_mut().expect("checked").sinex_code =
                    Some(line.get(0..10).unwrap_or("").trim().to_string())
            }
            "START OF FREQUENCY" | "START OF FREQ RMS" => {
                let code = line.get(3..6).unwrap_or("").to_string();
                if !FREQ_CODES.contains(&code.as_str()) {
                    push(&mut f, "error", ln, "unknown-frequency-code", code.clone());
                }
                in_rms = lab == "START OF FREQ RMS";
                cur_freq = Some(Frequency {
                    code,
                    ..Default::default()
                });
            }
            "COMMENT" => {}
            "" => {
                if !line.trim().is_empty() {
                    push(
                        &mut f,
                        "error",
                        ln,
                        "unlabelled-line",
                        line.chars().take(40).collect(),
                    )
                }
            }
            other => push(&mut f, "error", ln, "unknown-label", other.into()),
        }
    }
    if in_header {
        push(
            &mut f,
            "error",
            text.lines().count(),
            "missing-end-of-header",
            String::new(),
        );
    }
    if cur.is_some() || cur_freq.is_some() {
        push(
            &mut f,
            "error",
            text.lines().count(),
            "unterminated-block",
            String::new(),
        );
    }
    // Duplicates: same type, serial and validity start.
    let mut seen = BTreeMap::new();
    for a in &ants {
        let key = (
            a.type_radome.clone(),
            a.serial.clone(),
            a.valid_from.clone(),
        );
        if let Some(first) = seen.insert(key, a.line) {
            push(
                &mut f,
                "error",
                a.line,
                "duplicate-antenna",
                format!("{} {} (first at line {first})", a.type_radome, a.serial),
            );
        }
    }
    (ants, f)
}

fn values_ws(s: &str) -> Option<Vec<f64>> {
    s.split_whitespace().map(|t| t.parse().ok()).collect()
}

fn check_grid(a: &Antenna, fr: &Frequency, ln: usize, nzen: usize, f: &mut Vec<Finding>) {
    let mut push = |sev, code, d: String| {
        f.push(Finding {
            severity: sev,
            line: ln,
            code,
            detail: format!("{} {}: {d}", a.type_radome, fr.code),
        })
    };
    if fr.noazi_mm.is_empty() {
        push("error", "missing-noazi", String::new());
    }
    if a.dazi > 0.0 {
        let n_az = (360.0 / a.dazi).round() as usize + 1;
        if fr.azi_mm.len() != n_az {
            push(
                "error",
                "azimuth-rows",
                format!("{} rows, DAZI {} needs {n_az}", fr.azi_mm.len(), a.dazi),
            );
        }
        for (k, (az, _)) in fr.azi_mm.iter().enumerate() {
            if (az - k as f64 * a.dazi).abs() > 1e-6 {
                push(
                    "error",
                    "azimuth-sequence",
                    format!("row {k} is azimuth {az}"),
                );
                break;
            }
        }
        // NOAZI is conventionally the azimuth mean of the rows (0 and 360 counted once).
        if fr.azi_mm.len() == n_az && fr.noazi_mm.len() == nzen && n_az > 1 {
            let mut worst: f64 = 0.0;
            for z in 0..nzen {
                let mean = fr.azi_mm[..n_az - 1]
                    .iter()
                    .map(|r| r.1.get(z).copied().unwrap_or(0.0))
                    .sum::<f64>()
                    / (n_az - 1) as f64;
                worst = worst.max((mean - fr.noazi_mm[z]).abs());
            }
            if worst > 1.0 {
                push(
                    "warning",
                    "noazi-not-azimuth-mean",
                    format!("largest difference {worst:.2} mm"),
                );
            }
        }
    } else if !fr.azi_mm.is_empty() {
        push(
            "error",
            "azimuth-rows-with-dazi-zero",
            format!("{} rows", fr.azi_mm.len()),
        );
    }
    if !a.is_satellite() {
        if fr.pco_mm[2].abs() > 300.0 || fr.pco_mm[0].abs() > 50.0 || fr.pco_mm[1].abs() > 50.0 {
            push(
                "warning",
                "receiver-offset-implausible",
                format!("{:?} mm", fr.pco_mm),
            );
        }
        let worst = fr
            .noazi_mm
            .iter()
            .chain(fr.azi_mm.iter().flat_map(|r| r.1.iter()))
            .fold(0.0f64, |m, v| m.max(v.abs()));
        if worst > 50.0 {
            push(
                "warning",
                "receiver-variation-implausible",
                format!("{worst:.2} mm"),
            );
        }
        if fr.noazi_mm.first().is_some_and(|v| v.abs() > 1e-9) && a.zen[0] == 0.0 {
            push(
                "warning",
                "variation-at-zenith-not-zero",
                format!("{:.2} mm", fr.noazi_mm[0]),
            );
        }
    }
}

fn check_antenna(a: &Antenna, ln: usize, f: &mut Vec<Finding>) {
    let mut push = |sev, code, d: String| {
        f.push(Finding {
            severity: sev,
            line: ln,
            code,
            detail: d,
        })
    };
    let name = format!("{} {}", a.type_radome, a.serial);
    if a.type_radome.is_empty() {
        push("error", "missing-type", name.clone());
    }
    if !a.is_satellite() && a.type_radome.len() < 17 {
        push("warning", "missing-radome", name.clone());
    }
    if a.zen[2] <= 0.0 {
        push("error", "missing-zenith-grid", name.clone());
    } else {
        let steps = (a.zen[1] - a.zen[0]) / a.zen[2];
        if (steps - steps.round()).abs() > 1e-6 || steps < 0.0 {
            push(
                "error",
                "zenith-grid-not-whole",
                format!("{name}: {:?}", a.zen),
            );
        }
    }
    if a.dazi < 0.0 || (a.dazi > 0.0 && ((360.0 / a.dazi) - (360.0 / a.dazi).round()).abs() > 1e-6)
    {
        push(
            "error",
            "dazi-not-dividing-360",
            format!("{name}: {}", a.dazi),
        );
    }
    match a.n_freq_declared {
        None => push("error", "missing-frequency-count", name.clone()),
        Some(n) if n != a.freqs.len() => push(
            "error",
            "frequency-count",
            format!("{name}: declared {n}, found {}", a.freqs.len()),
        ),
        _ => {}
    }
    let codes: BTreeSet<&str> = a.freqs.iter().map(|f| f.code.as_str()).collect();
    if codes.len() != a.freqs.len() {
        push("error", "repeated-frequency", name.clone());
    }
    if a.method.is_empty() {
        push("warning", "missing-method", name.clone());
    }
    if let (Some(from), Some(until)) = (&a.valid_from, &a.valid_until) {
        if let (Some(x), Some(y)) = (values_ws(from), values_ws(until)) {
            if y <= x {
                push("error", "validity-reversed", name.clone());
            }
        }
    }
    if a.sinex_code.as_ref().is_some_and(|s| s.len() > 10) {
        push("error", "sinex-code-length", name);
    }
}

/// The lint document of an ANTEX text.
pub fn lint(name: &str, text: &str) -> serde_json::Value {
    let (ants, findings) = parse(text);
    let errors = findings.iter().filter(|f| f.severity == "error").count();
    let warnings = findings.len() - errors;
    let sats = ants.iter().filter(|a| a.is_satellite()).count();
    serde_json::json!({
        "schema": LINT_SCHEMA,
        "file": name,
        "format": "ANTEX 1.4 (IGS antex14.txt)",
        "antennas": ants.len(),
        "satellite_antennas": sats,
        "receiver_antennas": ants.len() - sats,
        "errors": errors,
        "warnings": warnings,
        "findings": findings,
    })
}

// ─────────────────────────────── spread ───────────────────────────────

fn stats(v: &[f64]) -> serde_json::Value {
    let n = v.len() as f64;
    let mean = v.iter().sum::<f64>() / n;
    let sd = if v.len() > 1 {
        (v.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (n - 1.0)).sqrt()
    } else {
        0.0
    };
    let max_dev = v.iter().fold(0.0f64, |m, x| m.max((x - mean).abs()));
    serde_json::json!({"mean": mean, "sd": sd, "max_dev": max_dev, "n": v.len()})
}

/// Unit spread of the calibrations of `type_radome` among `ants` (all blocks of that type with
/// a non-empty serial, or all blocks when none has a serial). `None` with fewer than two units.
pub fn spread(ants: &[Antenna], type_radome: &str) -> Option<serde_json::Value> {
    let units: Vec<&Antenna> = ants
        .iter()
        .filter(|a| a.type_radome.trim() == type_radome.trim())
        .collect();
    if units.len() < 2 {
        return None;
    }
    let codes: BTreeSet<&str> = units
        .iter()
        .flat_map(|a| a.freqs.iter().map(|f| f.code.as_str()))
        .collect();
    let mut per = serde_json::Map::new();
    for code in codes {
        let fs: Vec<(&Antenna, &Frequency)> = units
            .iter()
            .filter_map(|a| a.freq(code).map(|f| (*a, f)))
            .collect();
        if fs.len() < 2 {
            continue;
        }
        let comp = |k: usize| stats(&fs.iter().map(|(_, f)| f.pco_mm[k]).collect::<Vec<_>>());
        // NOAZI spread per zenith, where the grids agree.
        let zen = fs[0].0.zeniths();
        let same_grid = fs
            .iter()
            .all(|(a, f)| a.zeniths() == zen && f.noazi_mm.len() == zen.len());
        let pcv: Vec<serde_json::Value> = if same_grid {
            zen.iter()
                .enumerate()
                .map(|(i, z)| {
                    let s = stats(&fs.iter().map(|(_, f)| f.noazi_mm[i]).collect::<Vec<_>>());
                    serde_json::json!({"zenith_deg": z, "sd_mm": s["sd"], "max_dev_mm": s["max_dev"]})
                })
                .collect()
        } else {
            Vec::new()
        };
        per.insert(
            code.to_string(),
            serde_json::json!({
                "units": fs.iter().map(|(a, _)| a.serial.clone()).collect::<Vec<_>>(),
                "north_mm": comp(0), "east_mm": comp(1), "up_mm": comp(2),
                "noazi_by_zenith": pcv,
                "noazi_grids_agree": same_grid,
            }),
        );
    }
    Some(serde_json::json!({
        "schema": SPREAD_SCHEMA,
        "type_radome": type_radome.trim(),
        "units": units.len(),
        "note": "sample standard deviation and largest deviation from the mean across the units, per frequency",
        "frequencies": per,
    }))
}

// ─────────────────────────────── compare ───────────────────────────────

/// Variation (mm) at zenith `z` and azimuth `az` (deg), bilinear on the grid; NOAZI when the
/// block has no azimuth rows.
pub fn pcv_at(a: &Antenna, f: &Frequency, z: f64, az: f64) -> Option<f64> {
    let zen = a.zeniths();
    if zen.is_empty() || z < zen[0] - 1e-9 || z > zen[zen.len() - 1] + 1e-9 {
        return None;
    }
    let dz = a.zen[2];
    let zi = (((z - zen[0]) / dz).floor() as usize).min(zen.len().saturating_sub(2));
    let wz = if zen.len() > 1 {
        ((z - zen[zi]) / dz).clamp(0.0, 1.0)
    } else {
        0.0
    };
    let along = |row: &[f64]| -> Option<f64> {
        let a0 = *row.get(zi)?;
        let a1 = row.get(zi + 1).copied().unwrap_or(a0);
        Some(a0 + wz * (a1 - a0))
    };
    if a.dazi > 0.0 && !f.azi_mm.is_empty() {
        let az = az.rem_euclid(360.0);
        let ai = ((az / a.dazi).floor() as usize).min(f.azi_mm.len().saturating_sub(2));
        let wa = ((az - ai as f64 * a.dazi) / a.dazi).clamp(0.0, 1.0);
        let v0 = along(&f.azi_mm.get(ai)?.1)?;
        let v1 = along(&f.azi_mm.get(ai + 1).unwrap_or(&f.azi_mm[ai]).1)?;
        Some(v0 + wa * (v1 - v0))
    } else {
        along(&f.noazi_mm)
    }
}

/// Phase-centre correction (mm) along the line of sight at zenith `z`, azimuth `az` (deg):
/// `−r·PCO + PCV`, `r = (cos az sin z, sin az sin z, cos z)` in north, east, up.
pub fn pcc_mm(a: &Antenna, f: &Frequency, z: f64, az: f64) -> Option<f64> {
    let (zr, ar) = (z.to_radians(), az.to_radians());
    let r = [ar.pcos() * zr.psin(), ar.psin() * zr.psin(), zr.pcos()];
    let proj = r[0] * f.pco_mm[0] + r[1] * f.pco_mm[1] + r[2] * f.pco_mm[2];
    Some(-proj + pcv_at(a, f, z, az)?)
}

fn diff_stats(d: &[f64]) -> serde_json::Value {
    let n = d.len() as f64;
    let mean = d.iter().sum::<f64>() / n;
    let rms = (d.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / n).sqrt();
    let max = d.iter().fold(0.0f64, |m, x| m.max((x - mean).abs()));
    serde_json::json!({"constant_removed_mm": mean, "rms_mm": rms, "max_abs_mm": max, "points": d.len()})
}

/// Compare two calibrations `a` and `b` on a 5° grid of zenith (up to `max_zenith_deg`, and
/// within both grids) and azimuth: per common frequency and for the GPS L1/L2
/// ionosphere-free combination, the line-of-sight correction difference `b − a` with its
/// mean removed.
pub fn compare(a: &Antenna, b: &Antenna, max_zenith_deg: f64) -> serde_json::Value {
    let zmax = max_zenith_deg.min(a.zen[1]).min(b.zen[1]);
    let mut grid = Vec::new();
    let mut z = 0.0;
    while z <= zmax + 1e-9 {
        let mut az = 0.0;
        while az < 360.0 - 1e-9 {
            grid.push((z, az));
            if z == 0.0 {
                break;
            }
            az += 5.0;
        }
        z += 5.0;
    }
    let mut per = serde_json::Map::new();
    let mut by_code: BTreeMap<String, Vec<f64>> = BTreeMap::new();
    for fa in &a.freqs {
        let Some(fb) = b.freq(&fa.code) else { continue };
        let d: Vec<f64> = grid
            .iter()
            .filter_map(|(z, az)| Some(pcc_mm(b, fb, *z, *az)? - pcc_mm(a, fa, *z, *az)?))
            .collect();
        if d.is_empty() {
            continue;
        }
        per.insert(fa.code.clone(), diff_stats(&d));
        by_code.insert(fa.code.clone(), d);
    }
    let iono_free = match (by_code.get("G01"), by_code.get("G02")) {
        (Some(d1), Some(d2)) if d1.len() == d2.len() => {
            let (f1, f2) = (1_575_420_000.0f64, 1_227_600_000.0f64);
            let (c1, c2) = (
                f1 * f1 / (f1 * f1 - f2 * f2),
                -f2 * f2 / (f1 * f1 - f2 * f2),
            );
            let d: Vec<f64> = d1.iter().zip(d2).map(|(x, y)| c1 * x + c2 * y).collect();
            diff_stats(&d)
        }
        _ => serde_json::Value::Null,
    };
    serde_json::json!({
        "schema": COMPARE_SCHEMA,
        "a": {"type_radome": a.type_radome, "serial": a.serial, "method": a.method, "agency": a.agency, "date": a.date},
        "b": {"type_radome": b.type_radome, "serial": b.serial, "method": b.method, "agency": b.agency, "date": b.date},
        "max_zenith_deg": zmax,
        "grid_step_deg": 5.0,
        "note": "difference b - a of the line-of-sight correction -r.PCO + PCV, mean removed (a receiver clock absorbs a constant); offsets and variations are not compared separately because only their sum is observable",
        "frequencies": per,
        "iono_free_g01_g02": iono_free,
    })
}

// ─────────────────────────────── group delay ───────────────────────────────

/// Group-delay inputs (TOML).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct GroupDelaySpec {
    pub signal: Vec<GdSignal>,
    /// Temperature range (°C) the antenna sees.
    pub temperature_c: [f64; 2],
    /// Temperature at which the group delay was calibrated (°C).
    #[serde(default = "default_ref_t")]
    pub reference_temperature_c: f64,
    /// Ionosphere-free pairs, by signal name.
    #[serde(default)]
    pub pairs: Vec<[String; 2]>,
}

fn default_ref_t() -> f64 {
    25.0
}

/// One signal's group delay.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct GdSignal {
    pub name: String,
    pub freq_hz: f64,
    /// Group delay at zenith and the reference temperature (ns).
    pub group_delay_ns: f64,
    /// Temperature coefficient (ns/°C).
    #[serde(default)]
    pub ns_per_degc: f64,
    /// Group-delay change against elevation: `[elevation deg, ns]` points.
    #[serde(default)]
    pub elevation_ns: Vec<[f64; 2]>,
}

/// Errors of the spec-driven tools.
#[derive(Clone, Debug, PartialEq)]
pub enum SpecError {
    UnknownSignal(String),
    /// Group delay: no signal, an unordered or non-finite temperature range, a non-positive
    /// frequency or a non-finite delay.
    GroupDelay,
    /// A pair of one frequency with itself.
    SamePair,
    /// J/S: an unknown pattern name.
    Pattern,
    /// J/S: a gain table of fewer than two finite points.
    GainTable,
    /// J/S: a non-positive frequency or range, or a non-finite EIRP.
    Link,
}

/// The group-delay timing budget of `s` (see the module documentation).
pub fn group_delay(s: &GroupDelaySpec) -> Result<serde_json::Value, SpecError> {
    if s.signal.is_empty()
        || s.temperature_c[1] < s.temperature_c[0]
        || !s.temperature_c.iter().all(|t| t.is_finite())
    {
        return Err(SpecError::GroupDelay);
    }
    let mut sig = serde_json::Map::new();
    let mut eval: BTreeMap<&str, (f64, f64, f64, f64)> = BTreeMap::new();
    for g in &s.signal {
        if !(g.freq_hz > 0.0 && g.group_delay_ns.is_finite() && g.ns_per_degc.is_finite()) {
            return Err(SpecError::GroupDelay);
        }
        let dt = [
            s.temperature_c[0] - s.reference_temperature_c,
            s.temperature_c[1] - s.reference_temperature_c,
        ];
        let tv = [g.ns_per_degc * dt[0], g.ns_per_degc * dt[1]];
        let (t_lo, t_hi) = (tv[0].min(tv[1]), tv[0].max(tv[1]));
        let (e_lo, e_hi) = g
            .elevation_ns
            .iter()
            .fold((0.0f64, 0.0f64), |(lo, hi), p| (lo.min(p[1]), hi.max(p[1])));
        eval.insert(
            g.name.as_str(),
            (g.group_delay_ns, t_lo + e_lo, t_hi + e_hi, g.freq_hz),
        );
        sig.insert(
            g.name.clone(),
            serde_json::json!({
                "freq_hz": g.freq_hz,
                "bias_ns": g.group_delay_ns,
                "bias_m": g.group_delay_ns * 1e-9 * C,
                "temperature_variation_ns": [t_lo, t_hi],
                "elevation_variation_ns": [e_lo, e_hi],
                "uncalibrated_variation_pp_ns": (t_hi + e_hi) - (t_lo + e_lo),
            }),
        );
    }
    let mut pairs = Vec::new();
    for [p, q] in &s.pairs {
        let a = *eval
            .get(p.as_str())
            .ok_or_else(|| SpecError::UnknownSignal(p.clone()))?;
        let b = *eval
            .get(q.as_str())
            .ok_or_else(|| SpecError::UnknownSignal(q.clone()))?;
        let (f1, f2) = (a.3, b.3);
        if (f1 - f2).abs() < 1.0 {
            return Err(SpecError::SamePair);
        }
        let (c1, c2) = (
            f1 * f1 / (f1 * f1 - f2 * f2),
            -f2 * f2 / (f1 * f1 - f2 * f2),
        );
        let bias = c1 * a.0 + c2 * b.0;
        // Worst-case corners of the two variation intervals.
        let corners = [
            c1 * a.1 + c2 * b.1,
            c1 * a.1 + c2 * b.2,
            c1 * a.2 + c2 * b.1,
            c1 * a.2 + c2 * b.2,
        ];
        let lo = corners.iter().cloned().fold(f64::INFINITY, f64::min);
        let hi = corners.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
        pairs.push(serde_json::json!({
            "pair": [p, q], "coefficients": [c1, c2], "bias_ns": bias,
            "variation_ns": [lo, hi], "variation_pp_ns": hi - lo,
        }));
    }
    Ok(serde_json::json!({
        "schema": GROUP_DELAY_SCHEMA,
        "label": "MODELLED",
        "note": "a group delay common to all satellites enters the receiver clock: for positioning it is absorbed, for time transfer it is a bias that calibration must remove; the variation with temperature and elevation remains after a calibration at the reference temperature",
        "reference_temperature_c": s.reference_temperature_c,
        "temperature_c": s.temperature_c,
        "signals": sig,
        "iono_free_pairs": pairs,
    }))
}

// ─────────────────────────────── J/S margin ───────────────────────────────

/// Installation J/S inputs (TOML).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct JsSpec {
    pub frequency_hz: f64,
    /// Jammer EIRP toward the installation (dBW).
    pub jammer_eirp_dbw: f64,
    /// Elevation of the jammer seen from the antenna (deg; negative below its horizon).
    #[serde(default)]
    pub jammer_elevation_deg: f64,
    /// Elevation of the satellite whose signal is assessed (deg).
    #[serde(default = "default_sat_el")]
    pub satellite_elevation_deg: f64,
    /// Received signal power for an isotropic antenna (dBW).
    #[serde(default = "default_signal")]
    pub signal_power_dbw: f64,
    /// Receiver J/S tolerance at its input (dB), as stated for the receiver.
    pub receiver_js_tolerance_db: f64,
    /// Extra isolation toward the jammer from the installation (dB): mounting, ground plane,
    /// shielding.
    #[serde(default)]
    pub isolation_db: f64,
    /// Ranges to evaluate (m).
    #[serde(default)]
    pub ranges_m: Vec<f64>,
    /// `patch`, `choke-ring` (illustrative shapes) or `table` with `gain_table`.
    #[serde(default = "default_pattern")]
    pub pattern: String,
    /// `[elevation deg, gain dBi]` points for `pattern = "table"`.
    #[serde(default)]
    pub gain_table: Vec<[f64; 2]>,
}

fn default_sat_el() -> f64 {
    10.0
}
fn default_signal() -> f64 {
    -158.5
}
fn default_pattern() -> String {
    "patch".into()
}

/// Illustrative gain shapes (dBi against elevation); not any product's pattern.
fn preset(name: &str) -> Option<Vec<[f64; 2]>> {
    Some(match name {
        "patch" => vec![
            [-90.0, -20.0],
            [-10.0, -10.0],
            [0.0, -5.0],
            [10.0, -3.0],
            [30.0, 0.0],
            [90.0, 3.0],
        ],
        "choke-ring" => vec![
            [-90.0, -30.0],
            [-10.0, -20.0],
            [0.0, -10.0],
            [10.0, -4.0],
            [30.0, 1.0],
            [90.0, 5.0],
        ],
        _ => return None,
    })
}

fn interp(table: &[[f64; 2]], x: f64) -> f64 {
    if x <= table[0][0] {
        return table[0][1];
    }
    for w in table.windows(2) {
        if x <= w[1][0] {
            let t = (x - w[0][0]) / (w[1][0] - w[0][0]);
            return w[0][1] + t * (w[1][1] - w[0][1]);
        }
    }
    table[table.len() - 1][1]
}

/// Free-space path loss (dB) at range `r` m and frequency `f` Hz.
pub fn fspl_db(r: f64, f: f64) -> f64 {
    20.0 * (4.0 * std::f64::consts::PI * r * f / C).plog10()
}

/// The installation J/S budget of `s`.
pub fn js_margin(s: &JsSpec) -> Result<serde_json::Value, SpecError> {
    let table = if s.pattern == "table" {
        let mut t = s.gain_table.clone();
        if t.len() < 2 || t.iter().any(|p| !p[0].is_finite() || !p[1].is_finite()) {
            return Err(SpecError::GainTable);
        }
        t.sort_by(|a, b| a[0].total_cmp(&b[0]));
        t
    } else {
        preset(&s.pattern).ok_or(SpecError::Pattern)?
    };
    let positive = |x: f64| x > 0.0 && x.is_finite();
    if !positive(s.frequency_hz)
        || !s.jammer_eirp_dbw.is_finite()
        || !s.ranges_m.iter().all(|r| positive(*r))
    {
        return Err(SpecError::Link);
    }
    let g_j = interp(&table, s.jammer_elevation_deg);
    let g_s = interp(&table, s.satellite_elevation_deg);
    let signal = s.signal_power_dbw + g_s;
    let js_at =
        |r: f64| s.jammer_eirp_dbw - fspl_db(r, s.frequency_hz) + g_j - s.isolation_db - signal;
    // Range where J/S equals the tolerance: FSPL = EIRP + Gj − iso − S − tol.
    let fspl_needed =
        s.jammer_eirp_dbw + g_j - s.isolation_db - signal - s.receiver_js_tolerance_db;
    let r_min = C / (4.0 * std::f64::consts::PI * s.frequency_hz) * 10f64.ppowf(fspl_needed / 20.0);
    let rows: Vec<serde_json::Value> = s
        .ranges_m
        .iter()
        .map(|r| {
            let js = js_at(*r);
            serde_json::json!({"range_m": r, "fspl_db": fspl_db(*r, s.frequency_hz), "js_db": js, "margin_db": s.receiver_js_tolerance_db - js})
        })
        .collect();
    Ok(serde_json::json!({
        "schema": JS_SCHEMA,
        "label": "MODELLED",
        "note": "free-space link budget for siting; antenna presets are illustrative shapes, supply a measured gain table for a real antenna; nothing here steers, nulls or controls an antenna",
        "pattern": s.pattern,
        "gain_toward_jammer_dbi": g_j,
        "gain_toward_satellite_dbi": g_s,
        "signal_at_receiver_dbw": signal,
        "standoff_range_m": r_min,
        "ranges": rows,
    }))
}

// ─────────────────────────────── CLI ───────────────────────────────

/// `kshana antenna-cal <lint|spread|compare|group-delay|js-margin> ...`; returns the exit
/// code (1 when `lint` finds an error).
pub fn run_cli(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(code) => code,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn read(path: &str) -> Result<String, String> {
    std::fs::read_to_string(path)
        .map_err(|e| crate::terr!("e-antenna-cal-cannot-read", path = path, e = e))
}

fn spec_err(e: SpecError) -> String {
    match e {
        SpecError::UnknownSignal(s) => crate::terr!("e-antenna-cal-unknown-signal", value = s),
        SpecError::GroupDelay => crate::terr!("e-antenna-cal-bad-group-delay"),
        SpecError::SamePair => crate::terr!("e-antenna-cal-same-pair"),
        SpecError::Pattern => crate::terr!("e-antenna-cal-bad-pattern"),
        SpecError::GainTable => crate::terr!("e-antenna-cal-bad-gain-table"),
        SpecError::Link => crate::terr!("e-antenna-cal-bad-link"),
    }
}

fn run_inner(args: &[String]) -> Result<i32, String> {
    let usage = || crate::t!("antenna-cal-usage");
    let Some(sub) = args.first() else {
        return Err(usage());
    };
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", usage());
        return Ok(0);
    }
    let (mut ty, mut serial_a, mut serial_b, mut out, mut max_z) = (None, None, None, None, 80.0);
    let mut pos = Vec::new();
    let mut i = 1;
    while i < args.len() {
        let a = args[i].as_str();
        let mut val = || {
            i += 1;
            args.get(i)
                .cloned()
                .ok_or_else(|| crate::terr!("e-antenna-cal-missing-value", option = a))
        };
        match a {
            "--type" => ty = Some(val()?),
            "--serial-a" => serial_a = Some(val()?),
            "--serial-b" => serial_b = Some(val()?),
            "--out" => out = Some(val()?),
            "--max-zenith" => {
                let v = val()?;
                max_z = v
                    .parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite() && *x >= 0.0)
                    .ok_or_else(|| {
                        crate::terr!(
                            "e-antenna-cal-bad-number",
                            option = "--max-zenith",
                            value = v
                        )
                    })?;
            }
            s if s.starts_with('-') => {
                return Err(crate::terr!("e-antenna-cal-unknown-option", option = s))
            }
            s => pos.push(s.to_string()),
        }
        i += 1;
    }
    let emit = |doc: &serde_json::Value| -> Result<(), String> {
        let s = serde_json::to_string_pretty(doc).unwrap_or_default();
        match &out {
            Some(p) => std::fs::write(p, s + "\n")
                .map_err(|e| crate::terr!("e-antenna-cal-cannot-write", path = p, e = e)),
            None => {
                println!("{s}");
                Ok(())
            }
        }
    };
    let pick = |ants: &[Antenna],
                ty: &str,
                serial: Option<&String>,
                path: &str|
     -> Result<Antenna, String> {
        ants.iter()
            .find(|a| a.type_radome.trim() == ty.trim() && serial.is_none_or(|s| a.serial == *s))
            .cloned()
            .ok_or_else(|| crate::terr!("e-antenna-cal-no-antenna", name = ty, path = path))
    };
    match sub.as_str() {
        "lint" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let doc = lint(p, &read(p)?);
            emit(&doc)?;
            Ok(if doc["errors"].as_u64().unwrap_or(0) > 0 {
                1
            } else {
                0
            })
        }
        "spread" => {
            let Some(ty) = ty else { return Err(usage()) };
            if pos.is_empty() {
                return Err(usage());
            }
            let mut ants = Vec::new();
            for p in &pos {
                ants.extend(parse(&read(p)?).0);
            }
            let doc = spread(&ants, &ty)
                .ok_or_else(|| crate::terr!("e-antenna-cal-too-few-units", name = ty.as_str()))?;
            emit(&doc)?;
            Ok(0)
        }
        "compare" => {
            let Some(ty) = ty else { return Err(usage()) };
            let (pa, pb) = match pos.as_slice() {
                [a] => (a.clone(), a.clone()),
                [a, b] => (a.clone(), b.clone()),
                _ => return Err(usage()),
            };
            let aa = parse(&read(&pa)?).0;
            let bb = parse(&read(&pb)?).0;
            let a = pick(&aa, &ty, serial_a.as_ref(), &pa)?;
            let b = pick(&bb, &ty, serial_b.as_ref(), &pb)?;
            emit(&compare(&a, &b, max_z))?;
            Ok(0)
        }
        "group-delay" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let spec: GroupDelaySpec = toml::from_str(&read(p)?)
                .map_err(|e| crate::terr!("e-antenna-cal-bad-spec", path = p.as_str(), e = e))?;
            emit(&group_delay(&spec).map_err(spec_err)?)?;
            Ok(0)
        }
        "js-margin" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let spec: JsSpec = toml::from_str(&read(p)?)
                .map_err(|e| crate::terr!("e-antenna-cal-bad-spec", path = p.as_str(), e = e))?;
            emit(&js_margin(&spec).map_err(spec_err)?)?;
            Ok(0)
        }
        _ => Err(usage()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fspl_matches_the_textbook_value() {
        // 1 km at L1: 20·log10(4π·1000·1575.42e6/c) = 96.39 dB.
        assert!((fspl_db(1000.0, 1_575_420_000.0) - 96.39).abs() < 0.01);
    }

    #[test]
    fn iono_free_group_delay_coefficients() {
        let spec: GroupDelaySpec = toml::from_str(
            "temperature_c = [-20.0, 60.0]\npairs = [[\"L1\", \"L2\"]]\n\
             [[signal]]\nname = \"L1\"\nfreq_hz = 1575.42e6\ngroup_delay_ns = 10.0\n\
             [[signal]]\nname = \"L2\"\nfreq_hz = 1227.6e6\ngroup_delay_ns = 10.0\n",
        )
        .unwrap();
        let d = group_delay(&spec).unwrap();
        // A delay common to both frequencies passes through the combination unchanged.
        assert!((d["iono_free_pairs"][0]["bias_ns"].as_f64().unwrap() - 10.0).abs() < 1e-9);
        let c = d["iono_free_pairs"][0]["coefficients"].as_array().unwrap();
        assert!((c[0].as_f64().unwrap() - 2.5457).abs() < 1e-3);
    }
}
