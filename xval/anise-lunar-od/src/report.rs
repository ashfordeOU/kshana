// SPDX-License-Identifier: AGPL-3.0-only
//! The cross-validation report model: the honest dynamic and reduced-dynamic residuals, written to
//! `report.json` + `report.md` and printed as a table. No tuning, no target-chasing — the numbers
//! are whatever the DE-grade fit produces.

use serde::Serialize;

/// One fit tier's residual summary.
#[derive(Debug, Clone, Serialize)]
pub struct TierResult {
    /// "dynamic" (state only) or "reduced-dynamic" (+ 1+2-per-rev empirical).
    pub tier: String,
    /// 3-D position RMS against the Horizons truth (m).
    pub rms_3d: f64,
    /// Radial / along-track / cross-track RMS (m).
    pub rms_rtn: [f64; 3],
    pub iterations: usize,
    pub converged: bool,
    pub n_obs: usize,
    pub n_edited: usize,
}

/// The full DE-grade LRO cross-validation report.
#[derive(Debug, Clone, Serialize)]
pub struct Report {
    pub dataset: String,
    pub truth: String,
    pub orientation: String,
    pub ephemeris: String,
    pub gravity_field: String,
    pub fit_degree: usize,
    pub empirical_sigma: f64,
    pub n_obs: usize,
    pub raw_overlap_rms_m: f64,
    pub dynamic: TierResult,
    pub reduced_dynamic: TierResult,
    /// The < 5 m bar, evaluated honestly on the reduced-dynamic 3-D RMS.
    pub bar_m: f64,
    pub meets_bar: bool,
    /// SHA-256 of the two kernels, for citability.
    pub kernel_sha256: Vec<(String, String)>,
}

impl Report {
    /// Render the human-readable Markdown report.
    pub fn to_markdown(&self) -> String {
        let mut s = String::new();
        s.push_str("# DE-grade selenocentric OD cross-validation (LRO)\n\n");
        s.push_str(&format!("- **Dataset:** {}\n", self.dataset));
        s.push_str(&format!("- **Truth:** {}\n", self.truth));
        s.push_str(&format!("- **Orientation:** {}\n", self.orientation));
        s.push_str(&format!("- **Ephemeris:** {}\n", self.ephemeris));
        s.push_str(&format!(
            "- **Gravity field:** {} (fit d/o {})\n",
            self.gravity_field, self.fit_degree
        ));
        s.push_str(&format!(
            "- **n_obs:** {} | raw overlap {:.1} m | empirical 1σ {:.1e}\n\n",
            self.n_obs, self.raw_overlap_rms_m, self.empirical_sigma
        ));
        s.push_str("| Tier | 3-D RMS (m) | R (m) | T (m) | N (m) | iters | converged |\n");
        s.push_str("|------|------------:|------:|------:|------:|------:|:---------:|\n");
        for t in [&self.dynamic, &self.reduced_dynamic] {
            s.push_str(&format!(
                "| {} | {:.3} | {:.3} | {:.3} | {:.3} | {} | {} |\n",
                t.tier,
                t.rms_3d,
                t.rms_rtn[0],
                t.rms_rtn[1],
                t.rms_rtn[2],
                t.iterations,
                t.converged
            ));
        }
        s.push('\n');
        s.push_str(&format!(
            "**Reduced-dynamic 3-D RMS = {:.3} m** vs the {:.0} m bar → **{}**.\n\n",
            self.reduced_dynamic.rms_3d,
            self.bar_m,
            if self.meets_bar {
                "MEETS the bar"
            } else {
                "above the bar (reported honestly)"
            }
        ));
        s.push_str("Kernels (SHA-256):\n\n");
        for (name, sha) in &self.kernel_sha256 {
            s.push_str(&format!("- `{name}` — `{sha}`\n"));
        }
        s
    }
}
