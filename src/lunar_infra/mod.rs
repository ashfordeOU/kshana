// SPDX-License-Identifier: AGPL-3.0-only
//! The `lunar-infrastructure` scenario kind: the Moon's orbit and surface as navigation and
//! geodetic infrastructure (0.38 WS-H, H2). Five studies behind one kind, selected by `study`;
//! the pre-registered designs, inputs and bars are in `xval/lunar-infra/PREREGISTRATION.md` and
//! the documentation is `docs/LUNAR-INFRASTRUCTURE.md`.
//!
//! **MODELLED.** Every figure is computed from stated inputs on a restricted three-body model with
//! stated simplifications. Nothing here is a statement about the performance of any mission or
//! system, nothing is compared with a measurement of a lunar quantity, and the work is not
//! affiliated with or endorsed by any agency. Nothing is transmitted and no hardware is driven.

// Dense matrix kernels index several arrays by one loop variable, and the sigma checks reject NaN by
// negating `> 0.0`, as the crate's other matrix code does.
#![allow(clippy::needless_range_loop, clippy::neg_cmp_op_on_partial_ord)]

pub mod frame;
pub mod geodesy;
pub mod gnss;
pub mod la;
pub mod od;
pub mod orbit;
pub mod phase;
pub mod tie;
pub mod units;

use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

use frame::LlrSpec;
use geodesy::{ClockSpec, GravimeterSpec, Nominal, OrbiterSpec};
use gnss::GnssSpec;
use od::{GroundSpec, McSpec};
use orbit::OrbitSpec;
use phase::{PhaseMc, SurfaceSpec};
use tie::TechniqueSpec;

/// The label every report carries.
pub const LABEL: &str = "MODELLED — a restricted three-body model (Earth and Moon point masses, \
     no Sun, no lunar gravity harmonics) with stated simplifications and ILLUSTRATIVE inputs \
     labelled with their public sources. Numerics are checked against independent programs; \
     nothing is compared with a measurement of a lunar quantity, and nothing here is a \
     statement about any mission or system. Not affiliated with or endorsed by any agency. \
     Advisory software, not type-approved equipment.";

/// Seeded random station sets checked by `frame-coestimation` (bar F1).
pub const RANDOM_STATION_SETS: usize = 20;

/// The studies the kind runs.
pub const STUDIES: [&str; 5] = [
    "od-consistency",
    "carrier-phase",
    "frame-coestimation",
    "space-tie",
    "geodesy-sensitivity",
];

/// A `lunar-infrastructure` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct LunarInfrastructureScenario {
    /// Scenario kind tag.
    #[serde(default)]
    pub kind: Option<String>,
    /// One of [`STUDIES`].
    pub study: String,
    /// Seed of every stochastic draw (default 20261019).
    #[serde(default)]
    pub seed: Option<u64>,
    /// Reference orbit.
    #[serde(default)]
    pub orbit: Option<OrbitSpec>,
    /// Earth-GNSS reception.
    #[serde(default)]
    pub gnss: Option<GnssSpec>,
    /// Ground radiometric tracking.
    #[serde(default)]
    pub ground: Option<GroundSpec>,
    /// Monte Carlo settings of `od-consistency`; `carrier-phase` reads only `trials`.
    #[serde(default)]
    pub monte_carlo: Option<McSpec>,
    /// Lunar surface station(s).
    #[serde(default)]
    pub surface: Option<SurfaceSpec>,
    /// Laser ranging (`frame-coestimation`, `geodesy-sensitivity`).
    #[serde(default)]
    pub llr: Option<LlrSpec>,
    /// Techniques of the co-located spacecraft (`space-tie`).
    #[serde(default)]
    pub techniques: Option<TechniqueSpec>,
    /// Nominal Love numbers (`geodesy-sensitivity`).
    #[serde(default)]
    pub nominal: Option<Nominal>,
    /// Orbiter tracking (`geodesy-sensitivity`).
    #[serde(default)]
    pub orbiter: Option<OrbiterSpec>,
    /// Surface gravimeters (`geodesy-sensitivity`).
    #[serde(default)]
    pub gravimeter: Option<GravimeterSpec>,
    /// Surface clock (`geodesy-sensitivity`).
    #[serde(default)]
    pub clock: Option<ClockSpec>,
}

impl LunarInfrastructureScenario {
    /// Reproducible hash of the canonical inputs.
    pub fn scenario_hash(&self) -> String {
        let c = serde_json::to_string(self).unwrap_or_default();
        hex::encode(Sha256::digest(c.as_bytes()))
    }

    /// Run the study; return `(pretty JSON report, one-line summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let seed = self.seed.unwrap_or(20_261_019);
        let orbit = self.orbit.clone().unwrap_or_default();
        let (body, summary) = match self.study.as_str() {
            "od-consistency" => {
                let v = od::run(
                    &orbit,
                    &self.gnss.clone().unwrap_or_default(),
                    &self.ground.clone().unwrap_or_default(),
                    &self.monte_carlo.clone().unwrap_or_default(),
                    seed,
                )?;
                let s = crate::t!(
                    "lunar-infra-lunar-infrastructure-od-consistency-gnss",
                    v = crate::i18n::localise_decimal(format!(
                        "{:.1}",
                        v["gnss_estimate"]["position_sigma_m"]
                            .as_f64()
                            .unwrap_or(f64::NAN)
                    )),
                    v2 = crate::i18n::localise_decimal(format!(
                        "{:.1}",
                        v["ground_estimate"]["position_sigma_m"]
                            .as_f64()
                            .unwrap_or(f64::NAN)
                    )),
                    v3 = crate::i18n::localise_decimal(format!(
                        "{:.2}",
                        v["consistency"]["mean_q"].as_f64().unwrap_or(f64::NAN)
                    ))
                );
                (v, s)
            }
            "carrier-phase" => {
                let mc = PhaseMc {
                    trials: self.monte_carlo.as_ref().and_then(|m| m.trials),
                };
                let v = phase::run(
                    &orbit,
                    &self.gnss.clone().unwrap_or_default(),
                    &self.surface.clone().unwrap_or_default(),
                    &mc,
                    seed,
                )?;
                let last = v["arcs"]
                    .as_array()
                    .and_then(|a| a.last())
                    .cloned()
                    .unwrap_or(Value::Null);
                let s = crate::t!(
                    "lunar-infra-lunar-infrastructure-carrier-phase-ambiguities",
                    last = last["double_difference_ambiguities"],
                    last2 = crate::i18n::localise_decimal(format!(
                        "{:.3}",
                        last["monte_carlo_success_rate"]
                            .as_f64()
                            .unwrap_or(f64::NAN)
                    )),
                    last3 = crate::i18n::localise_decimal(format!(
                        "{:.3}",
                        last["bootstrapped_success_rate_decorrelated"]
                            .as_f64()
                            .unwrap_or(f64::NAN)
                    ))
                );
                (v, s)
            }
            "frame-coestimation" => {
                let v = frame::run(
                    &orbit,
                    &self.llr.clone().unwrap_or_default(),
                    &self.surface.clone().unwrap_or_default(),
                    RANDOM_STATION_SETS,
                    seed,
                )?;
                let s = crate::t!(
                    "lunar-infra-lunar-infrastructure-frame-coestimation-smallest",
                    v = crate::i18n::localise_decimal(format!(
                        "{:.2}",
                        v["lambda_min_ratio"].as_f64().unwrap_or(f64::NAN)
                    )),
                    v2 = crate::i18n::localise_decimal(format!(
                        "{:.3}",
                        v["crlb_trace_ratio"].as_f64().unwrap_or(f64::NAN)
                    ))
                );
                (v, s)
            }
            "space-tie" => {
                let v = tie::run(&orbit, &self.techniques.clone().unwrap_or_default())?;
                let last = v["arcs"]
                    .as_array()
                    .and_then(|a| a.last())
                    .cloned()
                    .unwrap_or(Value::Null);
                let s = crate::t!(
                    "lunar-infra-lunar-infrastructure-space-tie-sweep",
                    last = last["sweep"].as_array().map_or(0, |x| x.len()),
                    v = v["arcs"].as_array().map_or(0, |x| x.len()),
                    last2 = crate::i18n::localise_decimal(format!(
                        "{:.4}",
                        last["sweep"][0]["offsets"]["slr_minus_gnss"]["translation_sigma_m"][0]
                            .as_f64()
                            .unwrap_or(f64::NAN)
                    ))
                );
                (v, s)
            }
            "geodesy-sensitivity" => {
                let v = geodesy::run(
                    &orbit,
                    &self.nominal.clone().unwrap_or_default(),
                    &self.llr.clone().unwrap_or_default(),
                    &self.orbiter.clone().unwrap_or_default(),
                    &self.gravimeter.clone().unwrap_or_default(),
                    &self.clock.clone().unwrap_or_default(),
                )?;
                let s = crate::t!(
                    "lunar-infra-lunar-infrastructure-geodesy-sensitivity-crlb",
                    v = crate::i18n::localise_decimal(format!(
                        "{:.2e}",
                        v["crlb_sigma"][0].as_f64().unwrap_or(f64::NAN)
                    )),
                    v2 = crate::i18n::localise_decimal(format!(
                        "{:.2e}",
                        v["crlb_sigma"][1].as_f64().unwrap_or(f64::NAN)
                    )),
                    v3 = crate::i18n::localise_decimal(format!(
                        "{:.2e}",
                        v["crlb_sigma"][2].as_f64().unwrap_or(f64::NAN)
                    ))
                );
                (v, s)
            }
            other => {
                return Err(crate::terr!(
                    "e-lunar-infra-unknown-study-expected-one-of",
                    other = other,
                    studies = STUDIES.join(", ")
                ))
            }
        };
        let mut doc = json!({
            "kind": "lunar-infrastructure",
            "study": self.study,
            "label": LABEL,
            "scenario_hash": self.scenario_hash(),
        });
        if let (Value::Object(d), Value::Object(b)) = (&mut doc, body) {
            d.extend(b);
        }
        // The units block carries only the entries that describe a field this study emits.
        let all = crate::field_schema::units_block(units::UNITS);
        if let Value::Object(d) = &mut doc {
            d.insert("units".into(), all.clone());
        }
        let used: std::collections::BTreeSet<String> = crate::field_schema::audit_document(&doc)
            .covered
            .into_iter()
            .map(|f| f.matched_by)
            .collect();
        if let (Value::Object(d), Value::Object(all)) = (&mut doc, all) {
            d.insert(
                "units".into(),
                Value::Object(all.into_iter().filter(|(k, _)| used.contains(k)).collect()),
            );
        }
        let text = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        Ok((text, summary))
    }
}
