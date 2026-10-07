// SPDX-License-Identifier: AGPL-3.0-only
//! **C/N0 profiles: time-varying signal strength per satellite in a synthetic scene.**
//!
//! A [`Cn0Profile`] is a schedule of C/N0 *offsets* (dB, relative to the C/N0 the scene
//! states for each satellite) built from segments, each applying to every satellite or to a
//! listed set:
//!
//! * [`Cn0Shape::Step`] — `delta_db` from `at_s` on (0 before);
//! * [`Cn0Shape::Ramp`] — `from_db` until `start_s`, linear to `to_db` at `end_s`, held after;
//! * [`Cn0Shape::Points`] — piecewise linear through `(t_s, db)` points, held flat outside;
//! * [`Cn0Shape::Fade`] — seeded scintillation-like amplitude fading: the signal amplitude
//!   is `|μ + σ·z(t)|` with `z` a unit complex Gaussian process of correlation
//!   `e^{−|Δt|/τ}` (first-order Gauss–Markov, stepped on a grid of `τ/32`), and the Rice
//!   factor `K = μ²/σ²` (with `μ² + σ² = 1`, so the mean power is unchanged) chosen so the
//!   intensity's scintillation index is `s4`: `S4² = (1 + 2K)/(1 + K)²`, i.e.
//!   `K = (1 − S4² + √(1 − S4²))/S4²` (Rayleigh at `S4 = 1`).
//!
//! The segments' offsets add, in dB. A profile is the stimulus for loop and monitor
//! studies with a known truth: it changes the strength of the legitimate signals in the
//! scene and nothing else, so it is described strictly as a C/N0 profile.
//!
//! [`Cn0ProfileChannel`] applies a profile through the scene's channel hook
//! ([`crate::iq::scene::SceneChannel`]): it scales the amplitude of every path the inner
//! channel (if any) produces by `10^{offset/20}`, so it composes with the ionosphere,
//! troposphere, scintillation and multipath effects. The scene evaluates its channel once
//! per satellite per geometry knot and holds the amplitude between knots, so a profile is
//! resolved at the scene's update rate. [`ProfiledTruth`] adds the same offsets to the
//! `cn0_dbhz` column of the truth records, so the truth states the C/N0 that was generated.
//!
//! The profile file (TOML):
//!
//! ```toml
//! [[segment]]
//! kind = "step"          # step | ramp | points | fade
//! at_s = 4.0
//! delta_db = -6.0
//!
//! [[segment]]
//! prns = [3, 7]          # omit for every satellite
//! kind = "ramp"
//! start_s = 2.0
//! end_s = 6.0
//! from_db = 0.0
//! to_db = -10.0
//!
//! [[segment]]
//! kind = "points"
//! t_s = [0.0, 1.0, 3.0]
//! db = [0.0, -3.0, -3.0]
//!
//! [[segment]]
//! kind = "fade"
//! s4 = 0.5
//! tau_s = 0.4
//! seed = 7
//! ```
//!
//! Status: MODELLED. The deterministic shapes are exact by construction; the fade's mean
//! power, scintillation index and decorrelation are checked against the closed forms above
//! by seeded simulation, and a profiled scene's tracked C/N0 against the profile, in
//! `tests/iq_cn0_profile.rs`.

use super::sat_seed;
use crate::iq::scene::{SatView, SceneChannel, TruthRecord, TruthSink};
use crate::iq::{ChannelSnapshot, IqError};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// The shape of one profile segment (see the module docs).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(tag = "kind", rename_all = "snake_case")]
pub enum Cn0Shape {
    /// `delta_db` from `at_s` on.
    Step {
        /// Time of the step (s).
        at_s: f64,
        /// Offset after the step (dB).
        delta_db: f64,
    },
    /// Linear from `from_db` at `start_s` to `to_db` at `end_s`, held outside.
    Ramp {
        /// Ramp start (s).
        start_s: f64,
        /// Ramp end (s).
        end_s: f64,
        /// Offset up to the start (dB).
        from_db: f64,
        /// Offset from the end (dB).
        to_db: f64,
    },
    /// Piecewise linear through the points, held flat before the first and after the last.
    Points {
        /// Times, strictly increasing (s).
        t_s: Vec<f64>,
        /// Offsets at those times (dB).
        db: Vec<f64>,
    },
    /// Seeded Rice amplitude fading with intensity scintillation index `s4` and
    /// decorrelation time `tau_s`.
    Fade {
        /// Intensity scintillation index, in (0, 1].
        s4: f64,
        /// Decorrelation time of the underlying complex process (s).
        tau_s: f64,
        /// Seed (each satellite draws its own stream from it).
        #[serde(default)]
        seed: u64,
    },
}

/// One segment: a shape and the satellites it applies to.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Cn0Segment {
    /// Satellite identifiers (PRNs) it applies to; `None` for every satellite.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub prns: Option<Vec<u32>>,
    /// The shape.
    #[serde(flatten)]
    pub shape: Cn0Shape,
}

/// Per (segment, satellite) state of a fade.
#[derive(Clone, Debug)]
struct FadeState {
    rng: ChaCha8Rng,
    z: (f64, f64),
    /// Index of the grid point `z` holds.
    k: u64,
}

/// A C/N0 profile: segments whose offsets add (see the module docs).
#[derive(Clone, Debug, Default, Serialize, Deserialize)]
pub struct Cn0Profile {
    /// The segments.
    #[serde(default, rename = "segment")]
    pub segments: Vec<Cn0Segment>,
    #[serde(skip)]
    fades: HashMap<(usize, u32), FadeState>,
}

impl PartialEq for Cn0Profile {
    fn eq(&self, other: &Self) -> bool {
        self.segments == other.segments
    }
}

/// The Rice factor `K` whose intensity scintillation index is `s4` (0 < `s4` ≤ 1).
pub fn rice_k_for_s4(s4: f64) -> f64 {
    let s2 = s4 * s4;
    ((1.0 - s2) + (1.0 - s2).max(0.0).sqrt()) / s2
}

/// Grid steps per decorrelation time of a fade.
const FADE_STEPS_PER_TAU: f64 = 32.0;

impl Cn0Profile {
    /// A profile from segments (checked).
    pub fn new(segments: Vec<Cn0Segment>) -> Result<Self, IqError> {
        let p = Cn0Profile {
            segments,
            fades: HashMap::new(),
        };
        p.validate()?;
        Ok(p)
    }

    /// Parse a profile file (TOML with `[[segment]]` tables, or JSON `{"segment": [...]}`).
    pub fn parse(text: &str) -> Result<Self, IqError> {
        let t = text.trim_start();
        let p: Cn0Profile = if t.starts_with('{') {
            serde_json::from_str(t).map_err(|e| IqError::Format(format!("C/N0 profile: {e}")))?
        } else {
            toml::from_str(t).map_err(|e| IqError::Format(format!("C/N0 profile: {e}")))?
        };
        p.validate()?;
        Ok(p)
    }

    fn validate(&self) -> Result<(), IqError> {
        let bad = |m: String| Err(IqError::Format(format!("C/N0 profile: {m}")));
        if self.segments.is_empty() {
            return bad("no segments".into());
        }
        for (i, s) in self.segments.iter().enumerate() {
            match &s.shape {
                Cn0Shape::Step { at_s, delta_db } => {
                    if !(at_s.is_finite() && delta_db.is_finite()) {
                        return bad(format!("segment {i}: step values must be finite"));
                    }
                }
                Cn0Shape::Ramp {
                    start_s,
                    end_s,
                    from_db,
                    to_db,
                } => {
                    if !(start_s.is_finite() && from_db.is_finite() && to_db.is_finite())
                        || !(end_s > start_s)
                    {
                        return bad(format!("segment {i}: ramp needs end_s > start_s"));
                    }
                }
                Cn0Shape::Points { t_s, db } => {
                    if t_s.is_empty() || t_s.len() != db.len() {
                        return bad(format!(
                            "segment {i}: points need equal, non-empty t_s and db"
                        ));
                    }
                    if t_s.windows(2).any(|w| !(w[1] > w[0])) {
                        return bad(format!("segment {i}: t_s must increase strictly"));
                    }
                    if db.iter().chain(t_s).any(|v| !v.is_finite()) {
                        return bad(format!("segment {i}: points must be finite"));
                    }
                }
                Cn0Shape::Fade { s4, tau_s, .. } => {
                    if !(*s4 > 0.0 && *s4 <= 1.0) {
                        return bad(format!("segment {i}: fade s4 must be in (0, 1]"));
                    }
                    if !(*tau_s > 0.0 && tau_s.is_finite()) {
                        return bad(format!("segment {i}: fade tau_s must be positive"));
                    }
                }
            }
        }
        Ok(())
    }

    /// The offset (dB) of satellite `sat` at time `t_s`. A fade keeps per-satellite state:
    /// query each satellite at non-decreasing times (an earlier time returns the fade's
    /// value at the latest grid point reached).
    pub fn offset_db(&mut self, sat: u32, t_s: f64) -> f64 {
        let mut total = 0.0;
        for i in 0..self.segments.len() {
            let applies = self.segments[i]
                .prns
                .as_ref()
                .is_none_or(|p| p.contains(&sat));
            if !applies {
                continue;
            }
            total += match &self.segments[i].shape {
                Cn0Shape::Step { at_s, delta_db } => {
                    if t_s >= *at_s {
                        *delta_db
                    } else {
                        0.0
                    }
                }
                Cn0Shape::Ramp {
                    start_s,
                    end_s,
                    from_db,
                    to_db,
                } => {
                    let u = ((t_s - start_s) / (end_s - start_s)).clamp(0.0, 1.0);
                    from_db + u * (to_db - from_db)
                }
                Cn0Shape::Points { t_s: ts, db } => interp(ts, db, t_s),
                Cn0Shape::Fade { s4, tau_s, seed } => {
                    let (s4, tau, seed) = (*s4, *tau_s, *seed);
                    fade_db(&mut self.fades, i, sat, t_s, s4, tau, seed)
                }
            };
        }
        total
    }

    /// The amplitude factor `10^{offset/20}` of satellite `sat` at `t_s`.
    pub fn amplitude(&mut self, sat: u32, t_s: f64) -> f64 {
        10f64.powf(self.offset_db(sat, t_s) / 20.0)
    }
}

/// Piecewise-linear interpolation through `(ts, ys)`, held flat outside.
fn interp(ts: &[f64], ys: &[f64], t: f64) -> f64 {
    if t <= ts[0] {
        return ys[0];
    }
    if t >= ts[ts.len() - 1] {
        return ys[ys.len() - 1];
    }
    let j = ts.partition_point(|&x| x <= t);
    let (t0, t1, y0, y1) = (ts[j - 1], ts[j], ys[j - 1], ys[j]);
    y0 + (t - t0) / (t1 - t0) * (y1 - y0)
}

/// The fade offset (dB) of segment `seg` for satellite `sat` at `t`: the Rice intensity at
/// the latest grid point at or before `t`.
fn fade_db(
    fades: &mut HashMap<(usize, u32), FadeState>,
    seg: usize,
    sat: u32,
    t: f64,
    s4: f64,
    tau: f64,
    seed: u64,
) -> f64 {
    let dt = tau / FADE_STEPS_PER_TAU;
    let rho = (-dt / tau).exp();
    let innov = (1.0 - rho * rho).sqrt();
    let half = std::f64::consts::FRAC_1_SQRT_2;
    let st = fades.entry((seg, sat)).or_insert_with(|| {
        let mut rng = ChaCha8Rng::seed_from_u64(sat_seed(seed, sat, 0xC40 + seg as u64));
        let a: f64 = StandardNormal.sample(&mut rng);
        let b: f64 = StandardNormal.sample(&mut rng);
        FadeState {
            rng,
            z: (half * a, half * b),
            k: 0,
        }
    });
    let target = if t > 0.0 { (t / dt).floor() as u64 } else { 0 };
    while st.k < target {
        let a: f64 = StandardNormal.sample(&mut st.rng);
        let b: f64 = StandardNormal.sample(&mut st.rng);
        st.z = (
            rho * st.z.0 + innov * half * a,
            rho * st.z.1 + innov * half * b,
        );
        st.k += 1;
    }
    let k = rice_k_for_s4(s4);
    let mu = (k / (1.0 + k)).sqrt();
    let sigma = (1.0 / (1.0 + k)).sqrt();
    let re = mu + sigma * st.z.0;
    let im = sigma * st.z.1;
    10.0 * (re * re + im * im).max(1e-30).log10()
}

/// A scene channel applying a [`Cn0Profile`] on top of an optional inner channel: every
/// path the inner channel produces (or the unperturbed direct path) has its amplitude
/// scaled by the profile's factor for that satellite and time.
pub struct Cn0ProfileChannel {
    profile: Cn0Profile,
    inner: Option<Box<dyn SceneChannel>>,
}

impl Cn0ProfileChannel {
    /// Apply `profile` over `inner` (`None` = the direct path alone).
    pub fn new(profile: Cn0Profile, inner: Option<Box<dyn SceneChannel>>) -> Self {
        Cn0ProfileChannel { profile, inner }
    }
}

impl SceneChannel for Cn0ProfileChannel {
    fn snapshot(&mut self, sat_id: u32, t_s: f64, view: &SatView) -> ChannelSnapshot {
        let mut snap = match self.inner.as_mut() {
            Some(c) => c.snapshot(sat_id, t_s, view),
            None => ChannelSnapshot {
                t_s,
                paths: vec![crate::iq::scene::direct_path()],
            },
        };
        let g = self.profile.amplitude(sat_id, t_s);
        for p in &mut snap.paths {
            p.amplitude *= g;
        }
        snap
    }
}

/// A truth sink that adds a [`Cn0Profile`]'s offsets to each record's `cn0_dbhz` before
/// passing it on, so the truth states the C/N0 the profiled scene generated. Give it a
/// clone of the profile the channel uses (a fade's draws depend only on the seed,
/// satellite and time, so both copies agree).
pub struct ProfiledTruth<'a> {
    profile: Cn0Profile,
    inner: &'a mut dyn TruthSink,
}

impl<'a> ProfiledTruth<'a> {
    /// Wrap `inner`.
    pub fn new(profile: Cn0Profile, inner: &'a mut dyn TruthSink) -> Self {
        ProfiledTruth { profile, inner }
    }
}

impl TruthSink for ProfiledTruth<'_> {
    fn record(&mut self, r: &TruthRecord) -> Result<(), IqError> {
        let mut r = *r;
        r.cn0_dbhz += self.profile.offset_db(r.sat_id, r.t_s);
        self.inner.record(&r)
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.inner.finish()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn deterministic_shapes_are_exact() {
        let mut p = Cn0Profile::parse(
            r#"
[[segment]]
kind = "step"
at_s = 1.0
delta_db = -6.0

[[segment]]
prns = [3]
kind = "ramp"
start_s = 2.0
end_s = 4.0
from_db = 0.0
to_db = -10.0

[[segment]]
prns = [5]
kind = "points"
t_s = [0.0, 1.0, 3.0]
db = [0.0, -3.0, 1.0]
"#,
        )
        .unwrap();
        assert_eq!(p.offset_db(1, 0.5), 0.0);
        assert_eq!(p.offset_db(1, 1.0), -6.0);
        assert_eq!(p.offset_db(3, 0.5), 0.0);
        assert!((p.offset_db(3, 3.0) - (-6.0 - 5.0)).abs() < 1e-12);
        assert!((p.offset_db(3, 9.0) - (-16.0)).abs() < 1e-12);
        assert!((p.offset_db(5, 0.5) - (-1.5)).abs() < 1e-12);
        assert!((p.offset_db(5, 2.0) - (-6.0 - 1.0)).abs() < 1e-12);
        assert!((p.offset_db(5, 7.0) - (-6.0 + 1.0)).abs() < 1e-12);
        assert!((p.amplitude(1, 2.0) - 10f64.powf(-6.0 / 20.0)).abs() < 1e-15);
    }

    #[test]
    fn bad_profiles_are_refused() {
        for text in [
            "",
            "[[segment]]\nkind = \"ramp\"\nstart_s = 2.0\nend_s = 1.0\nfrom_db = 0.0\nto_db = 1.0\n",
            "[[segment]]\nkind = \"points\"\nt_s = [0.0, 0.0]\ndb = [0.0, 1.0]\n",
            "[[segment]]\nkind = \"fade\"\ns4 = 1.5\ntau_s = 1.0\n",
            "[[segment]]\nkind = \"fade\"\ns4 = 0.5\ntau_s = 0.0\n",
            "[[segment]]\nkind = \"wobble\"\n",
        ] {
            assert!(Cn0Profile::parse(text).is_err(), "{text}");
        }
    }

    #[test]
    fn rice_factor_inverts_the_scintillation_index() {
        for s4 in [0.1, 0.3, 0.6, 0.9, 1.0] {
            let k = rice_k_for_s4(s4);
            let back = ((1.0 + 2.0 * k) / ((1.0 + k) * (1.0 + k))).sqrt();
            assert!((back - s4).abs() < 1e-12, "{s4}: {back}");
        }
        assert_eq!(rice_k_for_s4(1.0), 0.0);
    }

    #[test]
    fn fades_are_reproducible_and_independent_per_satellite() {
        let text = "[[segment]]\nkind = \"fade\"\ns4 = 0.7\ntau_s = 0.2\nseed = 3\n";
        let mut a = Cn0Profile::parse(text).unwrap();
        let mut b = a.clone();
        let va: Vec<f64> = (0..50).map(|k| a.offset_db(4, k as f64 * 0.05)).collect();
        // Querying another satellite in between does not change satellite 4's draws.
        let vb: Vec<f64> = (0..50)
            .map(|k| {
                b.offset_db(9, k as f64 * 0.05);
                b.offset_db(4, k as f64 * 0.05)
            })
            .collect();
        assert_eq!(va, vb);
        let mut c = Cn0Profile::parse(text).unwrap();
        let vc: Vec<f64> = (0..50).map(|k| c.offset_db(9, k as f64 * 0.05)).collect();
        assert_ne!(va, vc);
    }
}
