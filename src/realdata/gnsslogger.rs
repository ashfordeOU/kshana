// SPDX-License-Identifier: AGPL-3.0-only
//! Android **GnssLogger** CSV adapter: `cn0` and `agc` observations.
//!
//! Google's GnssLogger app writes a self-describing CSV: comment lines begin with `#`,
//! and the `# Raw,<col>,<col>,…` line names the columns of every `Raw,…` data row. This
//! adapter reads that header to locate `Cn0DbHz` and `AgcDb` by name (robust to the
//! column-order drift between Android versions) and emits one observation per `Raw` row
//! per available field.
//!
//! Source: Jammertest 2024 smartphone logs (arXiv:2505.06171) and any GnssLogger
//! capture. C/N0 falls under jamming so it is [`Orient::Negate`]. AGC polarity is
//! receiver-dependent, so the caller passes it; the smartphone-jamming literature
//! reports AGC *gain* dropping under jamming, hence [`Orient::Negate`] is the usual
//! choice.

use super::{Observation, Orient};

/// Extract `cn0` (negated) and `agc` (oriented by `agc_orient`) observations from
/// GnssLogger CSV text. Rows missing a field are skipped for that field only (the
/// ragged-schema tolerance: a capture without `AgcDb` still yields `cn0`).
pub fn observations(text: &str, agc_orient: Orient) -> Vec<Observation> {
    let Some(cols) = column_index(text) else {
        return Vec::new();
    };
    let cn0_i = cols.iter().position(|c| c == "Cn0DbHz");
    let agc_i = cols.iter().position(|c| c == "AgcDb");
    let mut out = Vec::new();
    for line in text.lines() {
        let line = line.trim();
        if !line.starts_with("Raw,") {
            continue;
        }
        let fields: Vec<&str> = line.split(',').collect();
        if let Some(i) = cn0_i {
            if let Some(v) = fields.get(i).and_then(|s| s.trim().parse::<f64>().ok()) {
                out.push(Observation::new("cn0", v, Orient::Negate));
            }
        }
        if let Some(i) = agc_i {
            if let Some(v) = fields.get(i).and_then(|s| s.trim().parse::<f64>().ok()) {
                out.push(Observation::new("agc", v, agc_orient));
            }
        }
    }
    out
}

/// The `Raw`-record column names, read from the `# Raw,…` header comment. The names
/// are positionally aligned with the `Raw,…` data rows (both start with the `Raw`
/// token), so a name's index is also its field index in a data row.
fn column_index(text: &str) -> Option<Vec<String>> {
    for line in text.lines() {
        let t = line.trim_start();
        if let Some(rest) = t.strip_prefix('#') {
            let rest = rest.trim_start();
            if rest.starts_with("Raw,") {
                return Some(rest.split(',').map(|s| s.trim().to_string()).collect());
            }
        }
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    // A GnssLogger excerpt: header naming the Raw columns, then two Raw rows. Cn0DbHz
    // is column 3, AgcDb is column 5 (note Cn0 and Agc are deliberately not adjacent,
    // to prove name-based lookup).
    const CSV: &str = "\
# Header Description:
# Raw,Svid,TimeNanos,Cn0DbHz,ConstellationType,AgcDb,CarrierFrequencyHz
Fix,GPS,1,2,3
Raw,5,123456789,42.5,1,18.0,1575420030
Raw,12,123456789,30.0,1,9.5,1575420030
";

    #[test]
    fn extracts_cn0_negated_and_agc_per_raw_row() {
        let obs = observations(CSV, Orient::Negate);
        // 2 Raw rows x (cn0 + agc) = 4 observations.
        assert_eq!(obs.len(), 4);
        // First row: cn0 42.5 -> score -42.5; agc 18.0 negated -> -18.0.
        assert_eq!(obs[0].detector, "cn0");
        assert_eq!(obs[0].raw, 42.5);
        assert_eq!(obs[0].score, -42.5);
        assert_eq!(obs[1].detector, "agc");
        assert_eq!(obs[1].raw, 18.0);
        assert_eq!(obs[1].score, -18.0);
    }

    #[test]
    fn jammed_row_outscores_clean_row_on_both_observables() {
        let obs = observations(CSV, Orient::Negate);
        // Row 2 (svid 12) is jammed: lower C/N0 (30 vs 42.5) and lower AGC (9.5 vs 18).
        let cn0_clean = obs[0].score; // -42.5
        let cn0_jammed = obs[2].score; // -30.0
        let agc_clean = obs[1].score; // -18.0
        let agc_jammed = obs[3].score; // -9.5
        assert!(cn0_jammed > cn0_clean);
        assert!(agc_jammed > agc_clean);
    }

    #[test]
    fn agc_orientation_is_a_parameter() {
        let raw = observations(CSV, Orient::Raw);
        assert_eq!(raw[1].detector, "agc");
        assert_eq!(raw[1].score, 18.0); // passed through, not negated
    }

    #[test]
    fn missing_agc_column_still_yields_cn0() {
        let csv = "\
# Raw,Svid,Cn0DbHz
Raw,5,42.5
";
        let obs = observations(csv, Orient::Negate);
        assert_eq!(obs.len(), 1);
        assert_eq!(obs[0].detector, "cn0");
    }

    #[test]
    fn no_raw_header_yields_nothing() {
        assert!(observations("# Fix,lat,lon\nFix,1,2\n", Orient::Negate).is_empty());
    }
}
