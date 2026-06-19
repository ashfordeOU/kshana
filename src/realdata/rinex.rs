// SPDX-License-Identifier: AGPL-3.0-only
//! RINEX-3 observation adapter: carrier-to-noise (`cn0`) observations.
//!
//! Reuses [`crate::rinex_obs::parse_obs`] and emits one `cn0` observation per
//! satellite-per-epoch signal-strength (`S`) code. C/N0 in dB-Hz falls under jamming,
//! spoofing, and meaconing, so it is oriented [`Orient::Negate`](super::Orient::Negate).
//! This is the common-denominator observable of the Phase-A open sets (Yunnan
//! University, Jammertest 2024 RINEX).
//!
//! Pseudorange-based RAIM lives in [`super::raim`] (it needs the broadcast nav file
//! and a position solve); this module covers what an observation file alone supports.

use super::{Observation, Orient};
use crate::rinex_obs::parse_obs;

/// Lowest plausible C/N0 (dB-Hz) for a tracked signal. RINEX 2 receivers sometimes
/// stored the 1–9 RINEX SSI scale in an `S` field instead of dB-Hz; such values are
/// rejected so the scale stays consistent (dB-Hz only).
const MIN_CN0_DBHZ: f64 = 10.0;
/// Highest plausible C/N0 (dB-Hz); guards against malformed fields.
const MAX_CN0_DBHZ: f64 = 70.0;

/// Extract `cn0` observations (dB-Hz, negated) from RINEX-3 observation text.
///
/// Every `S??` signal-strength code on every satellite at every OK epoch (flag 0)
/// becomes one observation. Values outside `[MIN_CN0_DBHZ, MAX_CN0_DBHZ]` are dropped
/// (a non-dB-Hz SSI scale or a parse artefact). Returns the parser error if the header
/// or records are malformed.
pub fn cn0_observations(text: &str) -> Result<Vec<Observation>, String> {
    let rinex = parse_obs(text)?;
    let mut out = Vec::new();
    for epoch in &rinex.epochs {
        if epoch.flag != 0 {
            continue; // skip special-event / cycle-slip marker records
        }
        for sat in &epoch.sats {
            let Some(system) = sat.sat.chars().next() else {
                continue;
            };
            let Some(codes) = rinex.header.codes_for(system) else {
                continue;
            };
            for (k, code) in codes.iter().enumerate() {
                if !code.starts_with('S') {
                    continue;
                }
                if let Some(Some(o)) = sat.obs.get(k) {
                    if o.value >= MIN_CN0_DBHZ && o.value <= MAX_CN0_DBHZ {
                        out.push(Observation::new("cn0", o.value, Orient::Negate));
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

    /// Place `(column, text)` fields at exact 0-indexed columns (the only robust way to
    /// build a fixed-column RINEX line).
    fn place(fields: &[(usize, &str)]) -> String {
        let mut s = String::new();
        for (col, val) in fields {
            if s.len() < *col {
                s.push_str(&" ".repeat(col - s.len()));
            }
            s.push_str(val);
        }
        s
    }

    /// A 60-column-padded header line carrying `label` in columns 60+.
    fn hdr(fields: &[(usize, &str)], label: &str) -> String {
        let mut s = place(fields);
        if s.len() < 60 {
            s.push_str(&" ".repeat(60 - s.len()));
        }
        s.push_str(label);
        s
    }

    /// One satellite record: the 3-char id then each value in a 16-column slot (F14.3
    /// value at `3 + k*16`, LLI/SSI left blank).
    fn rec(sat: &str, vals: &[f64]) -> String {
        let mut fields = vec![(0usize, sat.to_string())];
        for (k, v) in vals.iter().enumerate() {
            fields.push((3 + k * 16, format!("{v:14.3}")));
        }
        let refs: Vec<(usize, &str)> = fields.iter().map(|(c, s)| (*c, s.as_str())).collect();
        place(&refs)
    }

    /// GPS file with codes C1C L1C S1C, two epochs of two satellites; G01 C/N0 drops
    /// 45.0 -> 31.0 dB-Hz (a jamming signature) between epochs.
    fn rinex() -> String {
        [
            hdr(
                &[(0, "     3.04"), (20, "OBSERVATION DATA"), (40, "M")],
                "RINEX VERSION / TYPE",
            ),
            hdr(
                &[(0, "G"), (3, "  3"), (7, "C1C"), (11, "L1C"), (15, "S1C")],
                "SYS / # / OBS TYPES",
            ),
            hdr(&[], "END OF HEADER"),
            "> 2024 01 01 00 00  0.0000000  0  2".to_string(),
            rec("G01", &[23_456_789.123, 123_456.789, 45.000]),
            rec("G02", &[23_987_654.321, 234_567.890, 38.500]),
            "> 2024 01 01 00 00 30.0000000  0  2".to_string(),
            rec("G01", &[23_456_999.123, 123_466.789, 31.000]),
            rec("G02", &[23_987_111.321, 234_577.890, 37.000]),
        ]
        .join("\n")
    }

    #[test]
    fn extracts_one_cn0_per_sat_per_epoch_negated() {
        let obs = cn0_observations(&rinex()).unwrap();
        // 2 epochs x 2 sats = 4 cn0 observations.
        assert_eq!(obs.len(), 4);
        assert!(obs.iter().all(|o| o.detector == "cn0"));
        // First record: G01 S1C = 45.000 dB-Hz -> raw 45, score -45.
        assert_eq!(obs[0].raw, 45.0);
        assert_eq!(obs[0].score, -45.0);
    }

    #[test]
    fn jammed_epoch_cn0_scores_above_clean_epoch() {
        let obs = cn0_observations(&rinex()).unwrap();
        // G01 drops 45.0 -> 31.0 dB-Hz between epoch 1 and 2: the later (jammed) score
        // must be higher (less negative).
        let g01_clean = obs[0].score; // -45.0
        let g01_jammed = obs[2].score; // -31.0
        assert!(g01_jammed > g01_clean);
    }

    #[test]
    fn rejects_out_of_range_non_dbhz_values() {
        // An SSI 1-9 scale value (7.000) in the S field must be dropped.
        let bad = [
            hdr(
                &[(0, "     3.04"), (20, "OBSERVATION DATA"), (40, "M")],
                "RINEX VERSION / TYPE",
            ),
            hdr(&[(0, "G"), (3, "  1"), (7, "S1C")], "SYS / # / OBS TYPES"),
            hdr(&[], "END OF HEADER"),
            "> 2024 01 01 00 00  0.0000000  0  1".to_string(),
            rec("G01", &[7.000]),
        ]
        .join("\n");
        let obs = cn0_observations(&bad).unwrap();
        assert!(obs.is_empty(), "7.0 is an SSI scale value, not dB-Hz");
    }

    #[test]
    fn malformed_input_is_a_clean_error_not_a_panic() {
        // parse_obs rejects text with no END OF HEADER; the adapter propagates that as
        // a Result rather than panicking.
        assert!(cn0_observations("not a rinex file").is_err());
    }
}
