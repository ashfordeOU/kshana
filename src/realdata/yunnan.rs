// SPDX-License-Identifier: AGPL-3.0-only
//! Yunnan University GNSS interference/spoofing dataset adapter (decoded-JSON C/N0).
//!
//! The Yunnan University dataset (Mendeley `10.17632/nxk9r22wd6`, the 2023-12-21
//! capture) ships u-blox observations decoded to JSON rather than binary UBX or RINEX,
//! so it needs its own thin reader. Each `observation<HH>.json` is a dict of per-second
//! column arrays sharing one `recordTime` axis. Carrier-to-noise lives in
//! `cn0_<sys><band>` keys, where `sys` is the constellation letter (`G` GPS, `E`
//! Galileo, `B` BeiDou, `Q` QZSS, `R` GLONASS) and `band` is 1 or 2; each value is a
//! per-second list of sparse satellite slots, with a non-positive slot meaning the
//! satellite was not tracked.
//!
//! This extracts a *timestamped* C/N0 series. Labelling each sample clean/spoofing/
//! jamming by `recordTime` (the attack windows are documented in the dataset's Data in
//! Brief article, not in the files) and grouping into per-constellation detectors are
//! left to the caller, because one file spans both clean and attacked periods. See
//! `examples/yunnan_probe.rs` for the windowing and the optimism-gap run.

use serde_json::Value;

/// The constellations whose `cn0_<sys><band>` columns this reader scans.
const SYSTEMS: [char; 5] = ['G', 'E', 'B', 'Q', 'R'];

/// One timestamped carrier-to-noise sample from a Yunnan observation file.
#[derive(Clone, Debug, PartialEq)]
pub struct TimedCn0 {
    /// Receiver record time, e.g. `"2023-12-21 12:32:30"` (the file's `recordTime`).
    pub time: String,
    /// Constellation letter (`G`, `E`, `B`, `Q`, `R`).
    pub system: char,
    /// Signal band (1 or 2).
    pub band: u8,
    /// Carrier-to-noise density in dB-Hz.
    pub cn0: f64,
}

impl TimedCn0 {
    /// The detector name grouping this sample by constellation and band, e.g.
    /// `"cn0_G1"`. Treating each constellation/band as its own detector gives the
    /// optimism-gap study a panel with genuinely different sensitivities (an L1-only
    /// spoofer hits `cn0_G1` hard but `cn0_E1` barely).
    pub fn detector(&self) -> String {
        format!("cn0_{}{}", self.system, self.band)
    }
}

/// Extract the timestamped per-satellite C/N0 series from a Yunnan processed
/// `observation<HH>.json`. Non-positive slots (untracked satellites) are skipped.
/// Returns a parse error if the text is not a JSON object or has no `recordTime`.
pub fn cn0_series(json_text: &str) -> Result<Vec<TimedCn0>, String> {
    let v: Value = serde_json::from_str(json_text).map_err(|e| format!("parse JSON: {e}"))?;
    let obj = v
        .as_object()
        .ok_or("expected a JSON object at the top level")?;
    let times = obj
        .get("recordTime")
        .and_then(Value::as_array)
        .ok_or("missing recordTime array")?;

    let mut out = Vec::new();
    for sys in SYSTEMS {
        for band in [1u8, 2] {
            let key = format!("cn0_{sys}{band}");
            let Some(arr) = obj.get(&key).and_then(Value::as_array) else {
                continue;
            };
            for (i, per_sec) in arr.iter().enumerate() {
                let (Some(slots), Some(time)) =
                    (per_sec.as_array(), times.get(i).and_then(Value::as_str))
                else {
                    continue;
                };
                for slot in slots {
                    if let Some(c) = slot.as_f64() {
                        if c > 0.0 {
                            out.push(TimedCn0 {
                                time: time.to_string(),
                                system: sys,
                                band,
                                cn0: c,
                            });
                        }
                    }
                }
            }
        }
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    // Two seconds; GPS L1 and Galileo L1 with sparse slots (0.0 = untracked).
    const OBS: &str = r#"{
        "recordTime": ["2023-12-21 12:00:00", "2023-12-21 12:00:01"],
        "VSG": [[0.0, 5.0, 0.0], [0.0, 5.0, 12.0]],
        "cn0_G1": [[0.0, 40.0, 0.0], [0.0, 38.0, 45.0]],
        "cn0_E1": [[47.0, 0.0], [0.0, 0.0]],
        "cn0_G2": [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0]]
    }"#;

    #[test]
    fn extracts_nonzero_cn0_with_time_system_and_band() {
        let s = cn0_series(OBS).unwrap();
        // cn0_G1: 40 at t0; 38,45 at t1. cn0_E1: 47 at t0. cn0_G2: all zero. => 4.
        assert_eq!(s.len(), 4);
        let g1: Vec<&TimedCn0> = s
            .iter()
            .filter(|x| x.system == 'G' && x.band == 1)
            .collect();
        assert_eq!(g1.len(), 3);
        assert_eq!(g1[0].time, "2023-12-21 12:00:00");
        assert_eq!(g1[0].cn0, 40.0);
        assert_eq!(g1[0].detector(), "cn0_G1");
        let e1: Vec<&TimedCn0> = s.iter().filter(|x| x.system == 'E').collect();
        assert_eq!(e1.len(), 1);
        assert_eq!(e1[0].cn0, 47.0);
        assert_eq!(e1[0].time, "2023-12-21 12:00:00");
    }

    #[test]
    fn skips_untracked_zero_slots() {
        let s = cn0_series(OBS).unwrap();
        assert!(s.iter().all(|x| x.cn0 > 0.0));
    }

    #[test]
    fn missing_recordtime_is_an_error() {
        assert!(cn0_series(r#"{"cn0_G1": [[40.0]]}"#).is_err());
    }

    #[test]
    fn non_object_json_is_an_error() {
        assert!(cn0_series("[1, 2, 3]").is_err());
    }

    #[test]
    fn a_file_with_no_cn0_columns_yields_empty() {
        let s = cn0_series(r#"{"recordTime": ["2023-12-21 12:00:00"]}"#).unwrap();
        assert!(s.is_empty());
    }
}
