// SPDX-License-Identifier: AGPL-3.0-only
//! **Enhancement-technique trade layer.** A candidate technique is a named set of stated
//! parameters applied to a baseline [`SiteLink`]; its predicted availability gain is
//! `A(with) − A(without)` at the same site, with every assumption printed.
//!
//! The levers are: a different wavelength (re-evaluates extinction, turbulence and aperture
//! averaging), a larger receive aperture (aperture averaging), a fractional reduction of the
//! scintillation index (adaptive optics or pre-compensation), and extra link margin (dB). The
//! gains are **inputs** — Kshana does not model an adaptive-optics loop — so every result is
//! **Modelled**, a what-if on the stated assumptions rather than a measured benefit.

use crate::optical_weather::{site_availability, CloudClimate, SiteLink};

/// A named candidate technique; every field but the name is optional.
#[derive(Debug, Clone, PartialEq)]
pub struct Technique {
    /// Label.
    pub name: String,
    /// Replacement wavelength (m).
    pub wavelength_m: Option<f64>,
    /// Replacement receive aperture (m).
    pub rx_aperture_m: Option<f64>,
    /// Fractional scintillation-index reduction (0..1).
    pub scint_variance_reduction: Option<f64>,
    /// Extra link margin (dB), including any terminal difference at a new wavelength.
    pub extra_margin_db: Option<f64>,
}

impl Technique {
    /// The baseline link with this technique applied.
    pub fn apply(&self, base: &SiteLink) -> SiteLink {
        let mut l = *base;
        if let Some(w) = self.wavelength_m {
            l.wavelength_m = w;
        }
        if let Some(d) = self.rx_aperture_m {
            l.rx_aperture_m = d;
        }
        if let Some(r) = self.scint_variance_reduction {
            l.scint_variance_reduction = r.clamp(0.0, 1.0);
        }
        if let Some(m) = self.extra_margin_db {
            l.extra_margin_db += m;
        }
        l
    }
}

/// Availability before and after a technique.
#[derive(Debug, Clone, PartialEq)]
pub struct TechniqueResult {
    /// Technique label.
    pub name: String,
    /// Baseline availability (0..1).
    pub baseline: f64,
    /// Availability with the technique (0..1).
    pub with_technique: f64,
    /// `with_technique − baseline`.
    pub gain: f64,
}

/// Evaluate `tech` against `base` at a site climate.
pub fn evaluate(base: &SiteLink, climate: &CloudClimate, tech: &Technique) -> TechniqueResult {
    let baseline = site_availability(base, climate);
    let with_technique = site_availability(&tech.apply(base), climate);
    TechniqueResult {
        name: tech.name.clone(),
        baseline,
        with_technique,
        gain: with_technique - baseline,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::optical_weather::tests_support::demo_link;

    #[test]
    fn noop_technique_has_zero_gain_and_margin_helps() {
        let c = CloudClimate {
            p_cloud: 0.2,
            median_lwp_kg_m2: 0.05,
            sigma_ln: 1.0,
        };
        let mut base = demo_link();
        base.margin_excl_atmosphere_db = 6.0;
        let none = Technique {
            name: "none".into(),
            wavelength_m: None,
            rx_aperture_m: None,
            scint_variance_reduction: None,
            extra_margin_db: None,
        };
        assert_eq!(evaluate(&base, &c, &none).gain, 0.0);
        let more = Technique {
            extra_margin_db: Some(6.0),
            ..none.clone()
        };
        assert!(evaluate(&base, &c, &more).gain > 0.0);
        let ao = Technique {
            scint_variance_reduction: Some(0.8),
            ..none
        };
        assert!(evaluate(&base, &c, &ao).gain >= 0.0);
    }
}
