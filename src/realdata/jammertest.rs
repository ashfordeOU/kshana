// SPDX-License-Identifier: AGPL-3.0-only
//! JammerTest 2024 dataset adapter (per-scenario CSV → `agc`, `jamind`, `cn0`).
//!
//! The JammerTest 2024 field campaign (Zenodo `10.5281/zenodo.15910563`, GPL-3.0)
//! ships one folder per attack scenario, each with `mon_rf.csv` (u-blox UBX-MON-RF
//! decoded to CSV) and `rinex.csv` (per-satellite observations). This reader pulls the
//! measurement-domain channels:
//!
//! * `mon_rf.csv` → `agc` (every `agcCnt_*` block) and `jamind` (every `jamInd_*`).
//! * `rinex.csv` → `cn0` from `snr_L1` / `snr_L2`, grouped by constellation and band
//!   (`cn0_G_L1`, `cn0_E_L1`, …), bounded to a valid dB-Hz range to drop the source's
//!   occasional column-shift rows (where `snr` holds a pseudorange).
//!
//! Samples are timestamped so the caller can split clean vs attack by the scenario's
//! `attack_log` (see `examples/jammertest_probe.rs`). `mon_rf.csv` carries a `payload`
//! column whose byte-repr can contain commas, but every channel read here sits in the
//! columns *before* `payload`, so header-indexed splitting stays correct.

use super::{Observation, Orient};

/// Lowest valid C/N0 (dB-Hz) kept from `snr_*` columns.
const MIN_CN0_DBHZ: f64 = 10.0;
/// Highest valid C/N0 (dB-Hz); above this the source row is a column-shift artifact
/// (the `snr` field holding a pseudorange), so it is dropped.
const MAX_CN0_DBHZ: f64 = 64.0;

/// One timestamped observation from a JammerTest scenario file.
#[derive(Clone, Debug, PartialEq)]
pub struct TimedObs {
    /// Receiver record time, e.g. `"2024-09-11 07:00:00.600000"`.
    pub time: String,
    /// The physics-oriented observation (detector name, raw value, score).
    pub obs: Observation,
}

/// Header column index map for a CSV (first non-empty line).
fn header(csv: &str) -> Option<(Vec<&str>, std::str::Lines<'_>)> {
    let mut lines = csv.lines();
    let head = lines.find(|l| !l.trim().is_empty())?;
    Some((head.split(',').map(str::trim).collect(), lines))
}

/// Index of the first column whose name equals `name`.
fn col(cols: &[&str], name: &str) -> Option<usize> {
    cols.iter().position(|c| *c == name)
}

/// Extract `agc` (oriented by `agc_orient`) and `jamind` (raw) observations from a
/// `mon_rf.csv`. Every `agcCnt_*` and `jamInd_*` block column is emitted per row.
pub fn mon_rf_observations(csv: &str, agc_orient: Orient) -> Vec<TimedObs> {
    let Some((cols, rows)) = header(csv) else {
        return Vec::new();
    };
    let Some(t_i) = col(&cols, "real_time") else {
        return Vec::new();
    };
    let agc_cols: Vec<usize> = cols
        .iter()
        .enumerate()
        .filter(|(_, c)| c.starts_with("agcCnt"))
        .map(|(i, _)| i)
        .collect();
    let jam_cols: Vec<usize> = cols
        .iter()
        .enumerate()
        .filter(|(_, c)| c.starts_with("jamInd"))
        .map(|(i, _)| i)
        .collect();

    let mut out = Vec::new();
    for line in rows {
        let f: Vec<&str> = line.split(',').collect();
        let Some(time) = f.get(t_i) else { continue };
        let time = (*time).to_string();
        for &i in &agc_cols {
            if let Some(v) = f.get(i).and_then(|s| s.trim().parse::<f64>().ok()) {
                out.push(TimedObs {
                    time: time.clone(),
                    obs: Observation::new("agc", v, agc_orient),
                });
            }
        }
        for &i in &jam_cols {
            if let Some(v) = f.get(i).and_then(|s| s.trim().parse::<f64>().ok()) {
                out.push(TimedObs {
                    time: time.clone(),
                    obs: Observation::new("jamind", v, Orient::Raw),
                });
            }
        }
    }
    out
}

/// Extract `cn0` observations (negated) from a `rinex.csv`, grouped by constellation
/// (the satellite id's first letter) and band into detectors `cn0_<sys>_L1` /
/// `cn0_<sys>_L2`. Values outside `[MIN_CN0_DBHZ, MAX_CN0_DBHZ]` are dropped.
pub fn rinex_cn0_observations(csv: &str) -> Vec<TimedObs> {
    let Some((cols, rows)) = header(csv) else {
        return Vec::new();
    };
    let (Some(t_i), Some(sat_i)) = (col(&cols, "time"), col(&cols, "satellite")) else {
        return Vec::new();
    };
    let bands = [("snr_L1", 1u8), ("snr_L2", 2u8)];
    let band_cols: Vec<(usize, u8)> = bands
        .iter()
        .filter_map(|(name, b)| col(&cols, name).map(|i| (i, *b)))
        .collect();

    let mut out = Vec::new();
    for line in rows {
        let f: Vec<&str> = line.split(',').collect();
        let (Some(time), Some(sat)) = (f.get(t_i), f.get(sat_i)) else {
            continue;
        };
        let Some(sys) = sat.trim().chars().next() else {
            continue;
        };
        for &(i, band) in &band_cols {
            if let Some(v) = f.get(i).and_then(|s| s.trim().parse::<f64>().ok()) {
                if (MIN_CN0_DBHZ..=MAX_CN0_DBHZ).contains(&v) {
                    out.push(TimedObs {
                        time: (*time).to_string(),
                        obs: Observation::new(format!("cn0_{sys}_L{band}"), v, Orient::Negate),
                    });
                }
            }
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn mon_rf_extracts_agc_and_jamind_per_block_before_the_payload_column() {
        // payload (last col) carries a comma in its byte-repr; target columns precede it.
        let csv = "identity,real_time,agcCnt_01,agcCnt_02,jamInd_01,jamInd_02,payload\n\
                   MON-RF,2024-09-11 07:00:00,5616,4914,11,5,b'\\x00,\\x01'\n";
        let obs = mon_rf_observations(csv, Orient::Negate);
        let agc: Vec<_> = obs.iter().filter(|o| o.obs.detector == "agc").collect();
        let jam: Vec<_> = obs.iter().filter(|o| o.obs.detector == "jamind").collect();
        assert_eq!(agc.len(), 2);
        assert_eq!(agc[0].obs.raw, 5616.0);
        assert_eq!(agc[0].obs.score, -5616.0); // negated
        assert_eq!(agc[0].time, "2024-09-11 07:00:00");
        assert_eq!(jam.len(), 2);
        assert_eq!(jam[0].obs.raw, 11.0);
        assert_eq!(jam[0].obs.score, 11.0); // raw: higher = more jamming
    }

    #[test]
    fn rinex_extracts_cn0_per_constellation_and_band_negated() {
        let csv = "time,satellite,pseudorange_L1,carrier_phase_L1,doppler_L1,snr_L1,pseudorange_L2,carrier_phase_L2,doppler_L2,snr_L2\n\
                   2024-09-11 07:00:00,G17,123.0,456.0,-31.0,42.0,124.0,457.0,-30.0,46.0\n\
                   2024-09-11 07:00:00,E03,125.0,,,40.0,,,,\n";
        let obs = rinex_cn0_observations(csv);
        // G17: cn0_G_L1=42, cn0_G_L2=46 ; E03: cn0_E_L1=40 (L2 empty) => 3.
        assert_eq!(obs.len(), 3);
        let g1 = obs.iter().find(|o| o.obs.detector == "cn0_G_L1").unwrap();
        assert_eq!(g1.obs.raw, 42.0);
        assert_eq!(g1.obs.score, -42.0);
        assert!(obs
            .iter()
            .any(|o| o.obs.detector == "cn0_G_L2" && o.obs.raw == 46.0));
        assert!(obs
            .iter()
            .any(|o| o.obs.detector == "cn0_E_L1" && o.obs.raw == 40.0));
    }

    #[test]
    fn rinex_drops_column_shift_artifacts_above_the_valid_dbhz_range() {
        // snr_L1 holding a pseudorange (22272672) must be rejected.
        let csv = "time,satellite,pseudorange_L1,carrier_phase_L1,doppler_L1,snr_L1,pseudorange_L2,carrier_phase_L2,doppler_L2,snr_L2\n\
                   2024-09-11 07:00:01,G08,222.0,333.0,1.0,22272672.58,,,,\n";
        assert!(rinex_cn0_observations(csv).is_empty());
    }

    #[test]
    fn empty_or_headerless_input_yields_nothing() {
        assert!(mon_rf_observations("", Orient::Negate).is_empty());
        assert!(rinex_cn0_observations("").is_empty());
        // header present but missing required columns:
        assert!(mon_rf_observations("a,b,c\n1,2,3\n", Orient::Negate).is_empty());
    }
}
