// SPDX-License-Identifier: AGPL-3.0-only
//! SatGrid dataset adapter: GNSS-SDR tracking-dump features -> impairment detectors.
//!
//! SatGrid (Virginia Tech, DOI `10.7294/SE62-7X13`, CC BY 3.0) ships per-channel
//! GNSS-SDR `Tracking_dump` files for a *genuine* baseline and *counterfeit* (spoofed)
//! recordings at six amplification levels (0,20,40,60,80,100; unitless, 0 = none,
//! 100 = max) -- a graded spoofer-power sweep. The HDF5/MATLAB-v7.3 dumps are first
//! flattened to a tidy CSV by `papers/satgrid_extract.py` (the published crate carries
//! no HDF5 dependency); this adapter parses that CSV and orients each tracking-channel
//! observable into the optimism-gap probe's [`Observation`] form.
//!
//! ## CSV schema (header row, name-mapped, order-independent)
//!
//! ```text
//! source,level,prn,cn0,abs_e,abs_l,lock,prompt_i,prompt_q
//! genuine,na,2,40.7,36959,39794,0.69,67365,40491
//! counterfeit,40,5,29.1,1203,-980,0.31,1500,820
//! ```
//!
//! ## Detector panel and orientation (fixed physics, never fitted to labels)
//!
//! | detector | source column(s) | orientation |
//! |----------|------------------|-------------|
//! | `cn0`    | `cn0` (C/N0 dB-Hz) | [`Orient::Negate`] (jamming/desense lowers it) |
//! | `sqm`    | `abs_e`,`abs_l` Early-minus-Late imbalance | [`Orient::Raw`] (distortion raises it) |
//! | `lock`   | `lock` (carrier-lock test) | [`Orient::Negate`] (loss of lock lowers it) |
//! | `qratio` | `prompt_i`,`prompt_q` quadrature fraction | [`Orient::Raw`] (phase distortion raises it) |

use super::{Observation, Orient};
use crate::spoof_monitors::SqmMonitor;

/// One parsed SatGrid tracking-channel epoch.
#[derive(Clone, Debug, PartialEq)]
pub struct SatGridRow {
    /// Recording scenario (e.g. `Arlington_Aug_23_Round_2`); empty if the CSV predates
    /// the multi-scenario schema.
    pub scenario: String,
    /// `genuine` (clean baseline) or `counterfeit` (spoofed).
    pub source: String,
    /// Spoofer amplification level (`0`..`100`), or `na` for genuine.
    pub level: String,
    /// Tracked PRN.
    pub prn: u32,
    /// C/N0 estimate (dB-Hz).
    pub cn0: f64,
    /// Early correlator value (signed; magnitude used for SQM).
    pub abs_e: f64,
    /// Late correlator value (signed; magnitude used for SQM).
    pub abs_l: f64,
    /// Carrier-lock test statistic (higher = better lock).
    pub lock: f64,
    /// Prompt in-phase correlator.
    pub prompt_i: f64,
    /// Prompt quadrature correlator.
    pub prompt_q: f64,
}

impl SatGridRow {
    /// Whether this row is a genuine (clean) observation - the AUC negative.
    pub fn is_genuine(&self) -> bool {
        self.source.eq_ignore_ascii_case("genuine")
    }

    /// The four oriented impairment observations derived from this tracking epoch.
    pub fn observations(&self) -> Vec<Observation> {
        let monitor = SqmMonitor::new();
        let sqm = monitor.el_metric(self.abs_e.abs(), self.abs_l.abs()).abs();
        let denom = self.prompt_i.abs() + self.prompt_q.abs();
        let qratio = if denom > 0.0 {
            self.prompt_q.abs() / denom
        } else {
            0.0
        };
        vec![
            Observation::new("cn0", self.cn0, Orient::Negate),
            Observation::new("sqm", sqm, Orient::Raw),
            Observation::new("lock", self.lock, Orient::Negate),
            Observation::new("qratio", qratio, Orient::Raw),
        ]
    }
}

/// Parse the SatGrid tidy-CSV text into rows. The header names the columns (order
/// independent); rows missing a required field or with an unparseable number are
/// skipped. Returns empty if there is no header or the required columns are absent.
pub fn parse(text: &str) -> Vec<SatGridRow> {
    let mut lines = text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'));
    let Some(header) = lines.next() else {
        return Vec::new();
    };
    let cols: Vec<&str> = header.split(',').map(str::trim).collect();
    let idx = |name: &str| cols.iter().position(|c| *c == name);
    let i_scn = idx("scenario"); // optional (multi-scenario schema)
    let (
        Some(i_src),
        Some(i_lvl),
        Some(i_prn),
        Some(i_cn0),
        Some(i_e),
        Some(i_l),
        Some(i_lock),
        Some(i_pi),
        Some(i_pq),
    ) = (
        idx("source"),
        idx("level"),
        idx("prn"),
        idx("cn0"),
        idx("abs_e"),
        idx("abs_l"),
        idx("lock"),
        idx("prompt_i"),
        idx("prompt_q"),
    )
    else {
        return Vec::new();
    };

    let mut out = Vec::new();
    for line in lines {
        let f: Vec<&str> = line.split(',').map(str::trim).collect();
        let get = |i: usize| f.get(i).copied();
        let num = |i: usize| f.get(i).and_then(|s| s.parse::<f64>().ok());
        let (Some(source), Some(level)) = (get(i_src), get(i_lvl)) else {
            continue;
        };
        let prn = f
            .get(i_prn)
            .and_then(|s| s.parse::<u32>().ok())
            .unwrap_or(0);
        let (Some(cn0), Some(abs_e), Some(abs_l), Some(lock), Some(prompt_i), Some(prompt_q)) = (
            num(i_cn0),
            num(i_e),
            num(i_l),
            num(i_lock),
            num(i_pi),
            num(i_pq),
        ) else {
            continue;
        };
        let scenario = i_scn
            .and_then(|i| f.get(i))
            .map(|s| s.to_string())
            .unwrap_or_default();
        out.push(SatGridRow {
            scenario,
            source: source.to_string(),
            level: level.to_string(),
            prn,
            cn0,
            abs_e,
            abs_l,
            lock,
            prompt_i,
            prompt_q,
        });
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    const SAMPLE: &str = "\
source,level,prn,cn0,abs_e,abs_l,lock,prompt_i,prompt_q
genuine,na,2,45.0,1000,1000,0.95,1200,5
counterfeit,40,5,29.0,1000,500,0.30,800,800
";

    #[test]
    fn parses_rows_and_flags_genuine() {
        let rows = parse(SAMPLE);
        assert_eq!(rows.len(), 2);
        assert!(rows[0].is_genuine());
        assert!(!rows[1].is_genuine());
        assert_eq!(rows[1].level, "40");
        assert_eq!(rows[1].prn, 5);
    }

    #[test]
    fn emits_four_oriented_detectors() {
        let rows = parse(SAMPLE);
        let gen = rows[0].observations();
        let cf = rows[1].observations();
        assert_eq!(gen.len(), 4);
        let det = |obs: &[Observation], name: &str| {
            obs.iter().find(|o| o.detector == name).unwrap().score
        };
        // cn0 negated: genuine 45 dB-Hz scores LOWER (less impaired) than counterfeit 29.
        assert_eq!(det(&gen, "cn0"), -45.0);
        assert!(det(&cf, "cn0") > det(&gen, "cn0"));
        // sqm: genuine symmetric E=L -> 0; counterfeit E!=L -> >0.
        assert!((det(&gen, "sqm") - 0.0).abs() < 1e-12);
        assert!((det(&cf, "sqm") - (500.0 / 1500.0)).abs() < 1e-9);
        // lock negated: better lock (0.95) scores lower than poor lock (0.30).
        assert!(det(&cf, "lock") > det(&gen, "lock"));
        // qratio: genuine tiny Q (5/1205) << counterfeit (800/1600 = 0.5).
        assert!(det(&cf, "qratio") > det(&gen, "qratio"));
        assert!((det(&cf, "qratio") - 0.5).abs() < 1e-9);
    }

    #[test]
    fn sqm_uses_correlator_magnitude_so_sign_does_not_matter() {
        // Signed early/late values must give the same imbalance as their magnitudes.
        let signed = "source,level,prn,cn0,abs_e,abs_l,lock,prompt_i,prompt_q\n\
                      counterfeit,20,5,30,-1000,500,0.4,-100,50\n";
        let r = &parse(signed)[0];
        let sqm = r
            .observations()
            .iter()
            .find(|o| o.detector == "sqm")
            .unwrap()
            .score;
        assert!((sqm - (500.0 / 1500.0)).abs() < 1e-9);
    }

    #[test]
    fn scenario_column_is_optional_and_parsed_when_present() {
        // Absent -> empty (backward compatible with the single-scenario schema).
        assert_eq!(parse(SAMPLE)[0].scenario, "");
        // Present -> parsed.
        let with = "scenario,source,level,prn,cn0,abs_e,abs_l,lock,prompt_i,prompt_q\n\
                    Arlington_Nov_8_Round_2,counterfeit,35,5,29,1000,500,0.3,800,800\n";
        let r = &parse(with)[0];
        assert_eq!(r.scenario, "Arlington_Nov_8_Round_2");
        assert_eq!(r.level, "35");
    }

    #[test]
    fn missing_columns_or_header_yields_nothing() {
        assert!(parse("").is_empty());
        assert!(parse("source,level,prn\ngenuine,na,2\n").is_empty());
    }
}
