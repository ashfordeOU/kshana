// SPDX-License-Identifier: AGPL-3.0-only
//! Cited acceleration-sensitivity figures, for entering a candidate's `g_sensitivity_per_g`.
//!
//! Each row is a figure as its document states it, with the document; maker names appear only as the
//! document's publisher. A row is a reference point for that document's part or example, not a class
//! value and not a comparison: for a part being chosen, use its own datasheet.

use serde::Serialize;

/// One cited figure.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GsensRef {
    /// Short key.
    pub key: &'static str,
    /// What the figure describes.
    pub describes: &'static str,
    /// Acceleration sensitivity, fractional frequency per g.
    pub g_sensitivity_per_g: f64,
    /// The document and where in it.
    pub document: &'static str,
}

/// The cited figures.
pub const GSENS_REFS: &[GsensRef] = &[
    GsensRef {
        key: "filler-1988-table1",
        describes: "the worked example of a 5 MHz quartz crystal oscillator",
        g_sensitivity_per_g: 2e-9,
        document: "R. L. Filler, The acceleration sensitivity of quartz crystal oscillators: a \
                   review, IEEE Trans. UFFC 35(3), 1988, pp. 297-305, Tables I and II",
    },
    GsensRef {
        key: "filler-1988-10mhz",
        describes: "the 10 MHz quartz oscillator example in the text",
        g_sensitivity_per_g: 1e-9,
        document: "R. L. Filler, IEEE Trans. UFFC 35(3), 1988, text (the 10 MHz, 1e-9/g \
                   oscillator example)",
    },
    GsensRef {
        key: "sitime-super-tcxo-brief",
        describes: "the MEMS Super-TCXO rows of the brief (its SiT5348 panel states +-0.009 ppb/g)",
        g_sensitivity_per_g: 9e-12,
        document: "SiTime, Precision Timing Solutions: Military UAVs and Drones (application \
                   brief), Endura table and SiT5348 panel, 0.009 ppb/g",
    },
];

/// Report of `kshana oscillator refs`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RefsReport {
    /// Evidence label: the figures are as published, not checked here.
    pub label: &'static str,
    /// The figures.
    pub g_sensitivity: &'static [GsensRef],
}

/// The report.
pub fn report() -> RefsReport {
    RefsReport {
        label: "CITED",
        g_sensitivity: GSENS_REFS,
    }
}
