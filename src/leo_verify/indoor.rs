// SPDX-License-Identifier: AGPL-3.0-only
//! Indoor penetration: the building entry loss of ITU-R P.2109-2 ([`crate::leo_link::itu`], the
//! engine's implementation checked against the ITU workbook) applied to each stated signal, and the
//! C/N0 left indoors against the receiver's tracking threshold.
//!
//! A row is one signal, building class, probability and elevation: the loss not exceeded with that
//! probability, the indoor C/N0 (`outdoor C/N0 − loss`) and the margin to the threshold. Comparing a
//! high-power LEO signal with a GNSS signal at the same probability gives the indoor advantage a
//! LEO-PNT service can be expected to have under the model; the measurement protocol that checks it in
//! a real building is in `docs/LEO-VERIFY.md`. MODELLED: P.2109 is a statistical model of building
//! populations, not of one building.

use super::{list_len, within};
use crate::leo_link::itu::{p2109_building_entry_loss_db, BuildingClass};
use serde::{Deserialize, Serialize};

/// One signal.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct IndoorSignal {
    /// A short name.
    pub id: String,
    /// Carrier frequency (GHz), 0.08 to 100.
    pub f_ghz: f64,
    /// C/N0 outdoors at the same elevation (dB-Hz).
    pub outdoor_cn0_dbhz: f64,
    /// The receiver's tracking threshold (dB-Hz).
    pub threshold_dbhz: f64,
}

fn d_classes() -> Vec<String> {
    vec!["traditional".into(), "thermally-efficient".into()]
}
fn d_probs() -> Vec<f64> {
    vec![0.5, 0.9]
}
fn d_els() -> Vec<f64> {
    vec![10.0, 30.0, 60.0]
}

/// Input of `kshana leo-verify indoor`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct IndoorInput {
    /// The signals.
    pub signals: Vec<IndoorSignal>,
    /// Building classes (`traditional`, `thermally-efficient`).
    #[serde(default = "d_classes")]
    pub classes: Vec<String>,
    /// Probabilities that the loss is not exceeded (0 to 1, exclusive).
    #[serde(default = "d_probs")]
    pub probabilities: Vec<f64>,
    /// Elevations of the path at the façade (deg).
    #[serde(default = "d_els")]
    pub elevations_deg: Vec<f64>,
}

/// One row.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IndoorRow {
    /// Signal.
    pub signal: String,
    /// Building class.
    pub class: &'static str,
    /// Probability the loss is not exceeded.
    pub probability: f64,
    /// Elevation (deg).
    pub elevation_deg: f64,
    /// Building entry loss (dB).
    pub loss_db: f64,
    /// C/N0 indoors (dB-Hz).
    pub indoor_cn0_dbhz: f64,
    /// Indoor C/N0 minus the threshold (dB).
    pub margin_db: f64,
    /// Whether the margin is at or above zero.
    pub above_threshold: bool,
}

/// One signal's worst row.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IndoorSummary {
    /// Signal.
    pub signal: String,
    /// Smallest margin over all its rows (dB).
    pub worst_margin_db: f64,
    /// Rows above the threshold, out of all its rows.
    pub rows_above_threshold: usize,
    /// All its rows.
    pub rows: usize,
}

/// Report of `kshana leo-verify indoor`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IndoorReport {
    /// Every row.
    pub rows: Vec<IndoorRow>,
    /// Per signal.
    pub summary: Vec<IndoorSummary>,
}

/// Run the indoor model.
pub fn run(inp: &IndoorInput) -> Result<IndoorReport, String> {
    list_len("signals", inp.signals.len(), 50)?;
    list_len("classes", inp.classes.len(), 2)?;
    list_len("probabilities", inp.probabilities.len(), 50)?;
    list_len("elevations_deg", inp.elevations_deg.len(), 90)?;
    let classes = inp
        .classes
        .iter()
        .map(|c| {
            BuildingClass::parse(c).map_err(|_| {
                crate::terr!(
                    "e-leo-verify-unknown-id",
                    field = "classes",
                    id = c.as_str()
                )
            })
        })
        .collect::<Result<Vec<_>, _>>()?;
    for &p in &inp.probabilities {
        within("probabilities", p, 1e-6, 1.0 - 1e-6)?;
    }
    for &e in &inp.elevations_deg {
        within("elevations_deg", e, 0.0, 90.0)?;
    }
    let mut rows = Vec::new();
    let mut summary = Vec::new();
    for s in &inp.signals {
        within("signals.f_ghz", s.f_ghz, 0.08, 100.0)?;
        within("signals.outdoor_cn0_dbhz", s.outdoor_cn0_dbhz, -50.0, 150.0)?;
        within("signals.threshold_dbhz", s.threshold_dbhz, -50.0, 150.0)?;
        let start = rows.len();
        for &c in &classes {
            for &p in &inp.probabilities {
                for &el in &inp.elevations_deg {
                    let loss = p2109_building_entry_loss_db(s.f_ghz, p, c, el);
                    let cn0 = s.outdoor_cn0_dbhz - loss;
                    let margin = cn0 - s.threshold_dbhz;
                    rows.push(IndoorRow {
                        signal: s.id.clone(),
                        class: c.as_str(),
                        probability: p,
                        elevation_deg: el,
                        loss_db: loss,
                        indoor_cn0_dbhz: cn0,
                        margin_db: margin,
                        above_threshold: margin >= 0.0,
                    });
                }
            }
        }
        let mine = &rows[start..];
        summary.push(IndoorSummary {
            signal: s.id.clone(),
            worst_margin_db: mine
                .iter()
                .map(|r| r.margin_db)
                .fold(f64::INFINITY, f64::min),
            rows_above_threshold: mine.iter().filter(|r| r.above_threshold).count(),
            rows: mine.len(),
        });
    }
    Ok(IndoorReport { rows, summary })
}
