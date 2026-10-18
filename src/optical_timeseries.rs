// SPDX-License-Identifier: AGPL-3.0-only
//! **One seeded realisation of an optical link through time**, drawn from the model the
//! `optical-atmosphere` kind already states for a site, so a page can show the link margin
//! "against time" without inventing a second model.
//!
//! ## Model (all of it the statistical model's own, sampled)
//!
//! * **Cloud episodes.** The line of sight alternates between clear spells and cloud outages. An
//!   outage lasts a log-normal time with the site's stated mean and log-standard deviation
//!   ([`crate::optical_weather::OutageModel`]); a clear spell lasts an exponential time whose mean,
//!   `mean_outage · (1 − p) / p`, makes the long-run share of time in cloud the stated
//!   `p_cloud`. The first episode is drawn whole (the run does not start part-way through one):
//!   a stated simplification, so short runs show the start-up of the process.
//! * **Cloud attenuation.** Each outage draws one liquid-water column from the stated log-normal
//!   climate and holds it for the episode; its slant attenuation is
//!   [`crate::optical_weather::SiteLink::cloud_attenuation_db`].
//! * **Scintillation.** Each step draws one gamma-gamma intensity sample, the product of two unit-mean
//!   gamma deviates with the link's `α` and `β`; its fade is `−10·log10(I)` dB (negative is an enhancement).
//!   Samples at different steps are independent, a stated simplification (scintillation decorrelates in
//!   milliseconds, the step is minutes).
//! * **Pointing.** Each step the terminal is on target with the site's pointing/acquisition availability.
//! * **Margin.** `margin = fade_budget − cloud − scintillation`; the link is up when the margin is not
//!   negative and the terminal is on target — the same condition the availability integral uses.
//!
//! One realisation is a draw, not the climate: its availability differs from the statistical one by the
//! sampling error of the draw. **Modelled**; no measured record has been compared. Every draw goes through
//! [`crate::portable_distr`] and [`crate::portable_math`], so native and wasm32 give the same bytes.

use crate::optical_atmosphere::Scintillation;
use crate::optical_weather::{CloudClimate, OutageModel, SiteLink};
use crate::portable_distr::{Distribution, Gamma, StandardNormal};
use crate::portable_math::PortableFloat;
use rand::distributions::Open01;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::{json, Value};

/// Most steps one site's series may have (keeps a result a sane size).
pub const MAX_STEPS: usize = 60_000;

/// What the scenario's `[timeseries]` table asks for.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SeriesSpec {
    /// Length of the realisation (s).
    pub duration_s: f64,
    /// Step (s).
    pub step_s: f64,
    /// Seed of the draw.
    pub seed: u64,
}

impl SeriesSpec {
    /// Number of steps: one per `step_s` over the duration, at least one.
    pub fn steps(&self) -> usize {
        ((self.duration_s / self.step_s).round() as usize).max(1)
    }
}

/// One site's realisation, step by step.
#[derive(Clone, Debug)]
pub struct Series {
    /// Cloud attenuation of the step (dB; 0 when clear).
    pub cloud_db: Vec<f64>,
    /// Scintillation fade of the step (dB; negative is an enhancement).
    pub scint_db: Vec<f64>,
    /// Link margin left (dB): fade budget minus the two fades.
    pub margin_db: Vec<f64>,
    /// Whether the step is inside a cloud episode.
    pub in_cloud: Vec<bool>,
    /// Whether the link is up.
    pub up: Vec<bool>,
}

fn unit(rng: &mut ChaCha8Rng) -> f64 {
    rng.sample::<f64, _>(Open01)
}

/// Everything the draw needs to know about one site: the statistical model's own pieces.
pub struct SiteModel<'a> {
    /// The link at the site.
    pub link: &'a SiteLink,
    /// The cloud climate.
    pub climate: &'a CloudClimate,
    /// The outage-duration model.
    pub outages: &'a OutageModel,
    /// The scintillation state (gamma-gamma `α`, `β`).
    pub sc: &'a Scintillation,
    /// Fade budget (dB): the margin left after the clear-air loss.
    pub budget_db: f64,
    /// Pointing / acquisition availability (0..1).
    pub pointing_availability: f64,
}

/// Draw the realisation for one site. `site_index` decorrelates the sites of one run under one seed.
pub fn site_series(m: &SiteModel, spec: &SeriesSpec, site_index: u64) -> Series {
    let (link, climate, outages, sc, budget_db, pointing_availability) = (
        m.link,
        m.climate,
        m.outages,
        m.sc,
        m.budget_db,
        m.pointing_availability,
    );
    let n = spec.steps();
    let mut rng = ChaCha8Rng::seed_from_u64(
        spec.seed
            .wrapping_add(site_index.wrapping_mul(0x9E37_79B9_7F4A_7C15)),
    );
    let ga = Gamma::new(sc.alpha, 1.0 / sc.alpha).expect("alpha > 0");
    let gb = Gamma::new(sc.beta, 1.0 / sc.beta).expect("beta > 0");
    let p = climate.p_cloud;
    let sigma_out = outages.sigma_ln;
    let mu_out = outages.mean_s.pln() - 0.5 * sigma_out * sigma_out;
    let clear_mean_s = if p > 0.0 && p < 1.0 {
        outages.mean_s * (1.0 - p) / p
    } else {
        f64::INFINITY
    };
    let clear_gamma = if clear_mean_s.is_finite() {
        Some(Gamma::new(1.0, clear_mean_s).expect("clear mean > 0"))
    } else {
        None
    };

    // episodes: (end time in s, cloud attenuation dB or None for clear)
    let mut cloud_db = Vec::with_capacity(n);
    let mut in_cloud = Vec::with_capacity(n);
    let mut state_cloud = p >= 1.0 || (p > 0.0 && unit(&mut rng) < p);
    let mut ep_end = 0.0f64;
    let mut ep_att = 0.0f64;
    let mut started = false;
    for k in 0..n {
        let t = k as f64 * spec.step_s;
        while !started || t >= ep_end {
            if started {
                state_cloud = !state_cloud;
            }
            started = true;
            if p <= 0.0 {
                state_cloud = false;
            }
            if state_cloud {
                let z: f64 = StandardNormal.sample(&mut rng);
                let d = (mu_out + sigma_out * z).pexp();
                let zl: f64 = StandardNormal.sample(&mut rng);
                let lwp = climate.median_lwp_kg_m2 * (climate.sigma_ln * zl).pexp();
                ep_att = link.cloud_attenuation_db(lwp);
                ep_end += if p >= 1.0 { f64::INFINITY } else { d };
            } else {
                ep_att = 0.0;
                ep_end += match &clear_gamma {
                    Some(g) => g.sample(&mut rng),
                    None => f64::INFINITY,
                };
            }
        }
        in_cloud.push(state_cloud);
        cloud_db.push(if state_cloud { ep_att } else { 0.0 });
    }

    let mut scint_db = Vec::with_capacity(n);
    let mut margin_db = Vec::with_capacity(n);
    let mut up = Vec::with_capacity(n);
    for &cloud in &cloud_db {
        let x = ga.sample(&mut rng);
        let y = gb.sample(&mut rng);
        let fade = -10.0 * (x * y).plog10();
        let on_target = unit(&mut rng) < pointing_availability;
        let margin = budget_db - cloud - fade;
        scint_db.push(fade);
        margin_db.push(margin);
        up.push(margin >= 0.0 && on_target);
    }
    Series {
        cloud_db,
        scint_db,
        margin_db,
        in_cloud,
        up,
    }
}

fn r3(v: f64) -> f64 {
    (v * 1000.0).round() / 1000.0
}

impl Series {
    /// Share of steps with the link up, percent.
    pub fn availability_pct(&self) -> f64 {
        100.0 * self.up.iter().filter(|&&u| u).count() as f64 / self.up.len() as f64
    }
    /// Share of steps inside a cloud episode, percent.
    pub fn cloud_fraction_pct(&self) -> f64 {
        100.0 * self.in_cloud.iter().filter(|&&c| c).count() as f64 / self.in_cloud.len() as f64
    }
    /// Number of outages (runs of steps with the link down) and the longest, in steps.
    pub fn outages(&self) -> (usize, usize) {
        let (mut count, mut longest, mut run) = (0usize, 0usize, 0usize);
        for &u in &self.up {
            if u {
                run = 0;
            } else {
                if run == 0 {
                    count += 1;
                }
                run += 1;
                longest = longest.max(run);
            }
        }
        (count, longest)
    }

    /// The JSON the result carries for this site.
    pub fn to_json(&self, spec: &SeriesSpec) -> Value {
        let (count, longest) = self.outages();
        json!({
            "label": "MODELLED: one seeded realisation of the stated site model (cloud episodes, a liquid-water column per episode, one gamma-gamma scintillation sample per step), not the climate and not a measurement; its availability differs from the statistical one by the sampling error of the draw",
            "seed": spec.seed,
            "step_s": spec.step_s,
            "duration_h": spec.duration_s / 3600.0,
            "steps": self.up.len(),
            "realised": {
                "availability_pct": r3(self.availability_pct()),
                "cloud_fraction_pct": r3(self.cloud_fraction_pct()),
                "outages": count,
                "longest_outage_h": r3(longest as f64 * spec.step_s / 3600.0),
            },
            "margin_db": self.margin_db.iter().map(|&v| r3(v)).collect::<Vec<_>>(),
            "cloud_db": self.cloud_db.iter().map(|&v| r3(v)).collect::<Vec<_>>(),
            "scint_db": self.scint_db.iter().map(|&v| r3(v)).collect::<Vec<_>>(),
            "up": self.up.iter().map(|&u| u8::from(u)).collect::<Vec<_>>(),
        })
    }
}
