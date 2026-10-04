// SPDX-License-Identifier: AGPL-3.0-only
//! **Statistical land-mobile satellite channel: three-state Markov chain with Loo
//! fading.** MODELLED.
//!
//! References: C. Loo, "A statistical model for a land mobile satellite link", *IEEE Trans.
//! Veh. Technol.* 34(3), 1985; F. P. Fontán, M. Vázquez-Castro, C. E. Cabado, J. P. García,
//! E. Kubista, "Statistical modeling of the LMS channel", *IEEE Trans. Veh. Technol.* 50(6),
//! 2001; Recommendation ITU-R P.681, which builds its multi-state land-mobile model on the
//! same structure.
//!
//! The channel moves between three states on a discrete-time Markov chain with one
//! transition every [`LandMobileParams::step_s`] seconds:
//!
//! * [`LmsState::LineOfSight`] and [`LmsState::Shadowed`] - Loo fading: the direct path's
//!   amplitude is log-normal (mean `α` dB, standard deviation `ψ` dB) and a diffuse
//!   multipath component with Rayleigh amplitude (mean power `MP` dB relative to the
//!   unobstructed direct signal) is added as a reflected path;
//! * [`LmsState::Blocked`] - the direct path is blocked (amplitude 0) and only the diffuse
//!   component arrives, so the snapshot is non-line-of-sight
//!   ([`ChannelSnapshot::is_nlos`]).
//!
//! The diffuse path is appended after the direct path with excess delay
//! [`LandMobileParams::diffuse_excess_delay_s`] and a uniformly random carrier phase. The
//! state and amplitudes are redrawn once per step and held in between; the chain's long-run
//! state occupancy is its stationary distribution ([`LandMobileParams::stationary`]).
//!
//! **Parameters.** [`LandMobileParams::default`] is an *illustrative* suburban-like set
//! (stated on the function), in the structure of the P.681 / Fontán three-state model; it is
//! not a table from the Recommendation and not fitted to measurements. Supply measured
//! parameters for a specific environment.
//!
//! Limits: the fast fading within a state is redrawn independently each step (no Doppler
//! spectrum shaping); state transitions are tied to time, not to distance travelled; one
//! diffuse path stands for the whole multipath cluster.
//!
//! Determinism: each satellite has its own SplitMix64 stream seeded from the model seed and the
//! satellite number.

use super::{sat_seed, ChannelEffect, LineOfSight};
use crate::iq::simrng::SimRng;
use crate::iq::{ChannelSnapshot, PathState};
use rand::Rng;
use rand_distr::StandardNormal;
use std::collections::BTreeMap;
use std::f64::consts::PI;

const STREAM: u64 = 0x1A4D_0000;

/// A state of the land-mobile channel.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord)]
pub enum LmsState {
    /// Clear line of sight (light Loo fading).
    LineOfSight = 0,
    /// Shadowed by foliage or light obstruction (heavier Loo fading).
    Shadowed = 1,
    /// Direct path blocked; diffuse multipath only.
    Blocked = 2,
}

impl LmsState {
    fn from_index(i: usize) -> Self {
        match i {
            0 => LmsState::LineOfSight,
            1 => LmsState::Shadowed,
            _ => LmsState::Blocked,
        }
    }
}

/// Loo distribution parameters for one state.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LooParams {
    /// Mean of the log-normal direct-path amplitude, `α` (dB).
    pub mean_db: f64,
    /// Standard deviation of the log-normal direct-path amplitude, `ψ` (dB).
    pub std_db: f64,
    /// Mean power of the Rayleigh diffuse component relative to the unobstructed direct
    /// signal, `MP` (dB).
    pub multipath_db: f64,
}

/// Parameters of the three-state land-mobile channel.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LandMobileParams {
    /// Row-stochastic transition matrix per step, indexed `[from][to]` in the order line of
    /// sight, shadowed, blocked.
    pub transition: [[f64; 3]; 3],
    /// Time between state transitions (s).
    pub step_s: f64,
    /// Loo parameters in the line-of-sight state.
    pub los: LooParams,
    /// Loo parameters in the shadowed state.
    pub shadowed: LooParams,
    /// Mean diffuse power in the blocked state relative to the unobstructed direct signal
    /// (dB).
    pub blocked_multipath_db: f64,
    /// Excess delay of the diffuse path over the direct path (s).
    pub diffuse_excess_delay_s: f64,
}

impl Default for LandMobileParams {
    /// An illustrative suburban-like set (not from a P.681 table, not fitted to data):
    /// step 0.1 s; transitions per step LOS → (0.98, 0.015, 0.005), shadowed →
    /// (0.03, 0.95, 0.02), blocked → (0.02, 0.03, 0.95); Loo LOS α = −0.5 dB, ψ = 0.5 dB,
    /// MP = −20 dB; shadowed α = −6 dB, ψ = 3 dB, MP = −15 dB; blocked MP = −18 dB;
    /// diffuse excess delay 50 ns.
    fn default() -> Self {
        Self {
            transition: [[0.98, 0.015, 0.005], [0.03, 0.95, 0.02], [0.02, 0.03, 0.95]],
            step_s: 0.1,
            los: LooParams {
                mean_db: -0.5,
                std_db: 0.5,
                multipath_db: -20.0,
            },
            shadowed: LooParams {
                mean_db: -6.0,
                std_db: 3.0,
                multipath_db: -15.0,
            },
            blocked_multipath_db: -18.0,
            diffuse_excess_delay_s: 50e-9,
        }
    }
}

impl LandMobileParams {
    /// The stationary distribution `π` of the transition matrix (`π·P = π`, `Σπ = 1`),
    /// solved by Gaussian elimination. Order: line of sight, shadowed, blocked.
    pub fn stationary(&self) -> [f64; 3] {
        let p = self.transition;
        // Rows: (Pᵀ − I) for the first two equations, then the normalisation.
        let mut a = [[0.0f64; 4]; 3];
        for (i, row) in a.iter_mut().take(2).enumerate() {
            for (j, v) in row.iter_mut().take(3).enumerate() {
                *v = p[j][i] - if i == j { 1.0 } else { 0.0 };
            }
        }
        a[2] = [1.0, 1.0, 1.0, 1.0];
        for col in 0..3 {
            let piv = (col..3)
                .max_by(|&x, &y| a[x][col].abs().total_cmp(&a[y][col].abs()))
                .unwrap_or(col);
            a.swap(col, piv);
            for r in 0..3 {
                if r != col && a[col][col] != 0.0 {
                    let f = a[r][col] / a[col][col];
                    let pivot_row = a[col];
                    for (x, pv) in a[r].iter_mut().zip(pivot_row).skip(col) {
                        *x -= f * pv;
                    }
                }
            }
        }
        [a[0][3] / a[0][0], a[1][3] / a[1][1], a[2][3] / a[2][2]]
    }
}

#[derive(Clone, Debug)]
struct SatState {
    rng: SimRng,
    state: LmsState,
    step: i64,
    direct_amp: f64,
    diffuse_amp: f64,
    diffuse_phase: f64,
}

/// The three-state land-mobile channel effect, with independent per-satellite chains.
#[derive(Clone, Debug)]
pub struct LandMobile {
    /// Model parameters (shared by every satellite).
    pub params: LandMobileParams,
    seed: u64,
    sats: BTreeMap<u32, SatState>,
}

fn draw_amplitudes(p: &LandMobileParams, st: &mut SatState) {
    let (direct, mp_db) = match st.state {
        LmsState::LineOfSight | LmsState::Shadowed => {
            let loo = if st.state == LmsState::LineOfSight {
                p.los
            } else {
                p.shadowed
            };
            let g: f64 = st.rng.sample(StandardNormal);
            (
                10f64.powf((loo.mean_db + loo.std_db * g) / 20.0),
                loo.multipath_db,
            )
        }
        LmsState::Blocked => (0.0, p.blocked_multipath_db),
    };
    let s = (10f64.powf(mp_db / 10.0) / 2.0).sqrt();
    let x: f64 = st.rng.sample(StandardNormal);
    let y: f64 = st.rng.sample(StandardNormal);
    st.direct_amp = direct;
    st.diffuse_amp = s * x.hypot(y);
    st.diffuse_phase = st.rng.gen_range(-PI..PI);
}

impl LandMobile {
    /// A land-mobile channel with `params`, seeded with `seed`.
    pub fn new(params: LandMobileParams, seed: u64) -> Self {
        Self {
            params,
            seed,
            sats: BTreeMap::new(),
        }
    }

    fn advance(&mut self, sat: u32, t_s: f64) -> &SatState {
        let p = self.params;
        let seed = self.seed;
        let step = (t_s / p.step_s).floor() as i64;
        let st = self.sats.entry(sat).or_insert_with(|| {
            let mut rng = SimRng::seed(sat_seed(seed, sat, STREAM));
            let pi = p.stationary();
            let u: f64 = rng.gen();
            let state = if u < pi[0] {
                LmsState::LineOfSight
            } else if u < pi[0] + pi[1] {
                LmsState::Shadowed
            } else {
                LmsState::Blocked
            };
            let mut st = SatState {
                rng,
                state,
                step,
                direct_amp: 1.0,
                diffuse_amp: 0.0,
                diffuse_phase: 0.0,
            };
            draw_amplitudes(&p, &mut st);
            st
        });
        while st.step < step {
            let row = p.transition[st.state as usize];
            let u: f64 = st.rng.gen();
            let next = if u < row[0] {
                0
            } else if u < row[0] + row[1] {
                1
            } else {
                2
            };
            st.state = LmsState::from_index(next);
            st.step += 1;
            draw_amplitudes(&p, st);
        }
        st
    }

    /// The channel state of satellite `sat` at time `t_s`, advancing its chain as needed.
    pub fn state_at(&mut self, sat: u32, t_s: f64) -> LmsState {
        self.advance(sat, t_s).state
    }
}

impl ChannelEffect for LandMobile {
    fn apply(
        &mut self,
        sat: u32,
        t_s: f64,
        _geom: &LineOfSight,
        _carrier_hz: f64,
        snap: &mut ChannelSnapshot,
    ) {
        let excess = self.params.diffuse_excess_delay_s;
        let st = self.advance(sat, t_s).clone();
        let Some(direct) = snap.paths.first_mut() else {
            return;
        };
        let base = *direct;
        direct.amplitude *= st.direct_amp;
        snap.paths.push(PathState {
            group_delay_s: base.group_delay_s + excess,
            carrier_phase_rad: base.carrier_phase_rad + st.diffuse_phase,
            amplitude: base.amplitude * st.diffuse_amp,
            extra_doppler_hz: base.extra_doppler_hz,
        });
    }
}

#[cfg(test)]
mod tests {
    use super::super::{test_geom, ChannelModel, Composite};
    use super::*;
    use crate::gnss_sim::L1_HZ;

    #[test]
    fn stationary_distribution_solves_pi_p_equals_pi() {
        let p = LandMobileParams::default();
        let pi = p.stationary();
        assert!((pi.iter().sum::<f64>() - 1.0).abs() < 1e-12);
        // Independent check: rows of P^k converge to π (power iteration).
        let mut v = [1.0, 0.0, 0.0];
        for _ in 0..5000 {
            let mut w = [0.0; 3];
            for (i, vi) in v.iter().enumerate() {
                for (wj, pij) in w.iter_mut().zip(p.transition[i]) {
                    *wj += vi * pij;
                }
            }
            v = w;
        }
        for k in 0..3 {
            assert!((v[k] - pi[k]).abs() < 1e-12, "{v:?} vs {pi:?}");
        }
    }

    /// Occupancy of 1 000 000 steps matches π within 0.015 absolute per state; the
    /// chain's mixing time is tens of steps, so this is several standard errors.
    #[test]
    fn state_occupancy_converges_to_the_stationary_distribution() {
        let p = LandMobileParams::default();
        let pi = p.stationary();
        let mut lm = LandMobile::new(p, 77);
        let n = 1_000_000usize;
        let mut count = [0usize; 3];
        for k in 0..n {
            count[lm.state_at(3, k as f64 * p.step_s) as usize] += 1;
        }
        for s in 0..3 {
            let occ = count[s] as f64 / n as f64;
            assert!((occ - pi[s]).abs() < 0.015, "state {s}: {occ} vs {}", pi[s]);
        }
    }

    #[test]
    fn blocked_state_yields_nlos_snapshots() {
        let p = LandMobileParams::default();
        let mut probe = LandMobile::new(p, 5);
        let mut ch = Composite::new(L1_HZ).with(LandMobile::new(p, 5));
        let g = test_geom(40.0);
        let (mut blocked, mut seen) = (0, 0);
        for k in 0..20_000 {
            let t = k as f64 * p.step_s;
            let state = probe.state_at(2, t);
            let s = ch.snapshot(2, t, &g);
            assert_eq!(s.paths.len(), 2);
            assert_eq!(s.is_nlos(), state == LmsState::Blocked, "step {k}");
            if state == LmsState::Blocked {
                blocked += 1;
                assert_eq!(s.paths[0].amplitude, 0.0);
            } else {
                seen += 1;
            }
        }
        assert!(blocked > 100 && seen > 100);
    }

    #[test]
    fn loo_direct_amplitude_and_diffuse_power_match_their_parameters() {
        // Stay in the LOS state: an identity transition matrix.
        let p = LandMobileParams {
            transition: [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]],
            ..LandMobileParams::default()
        };
        let mut lm = LandMobile::new(p, 9);
        // Force the LOS start by scanning satellites until one starts there.
        let sat = (0..100u32)
            .find(|&s| lm.state_at(s, 0.0) == LmsState::LineOfSight)
            .unwrap();
        let n = 100_000;
        let (mut s1, mut s2, mut mp) = (0.0, 0.0, 0.0);
        for k in 0..n {
            let st = lm.advance(sat, k as f64 * p.step_s).clone();
            let db = 20.0 * st.direct_amp.log10();
            s1 += db;
            s2 += db * db;
            mp += st.diffuse_amp * st.diffuse_amp;
        }
        let nf = n as f64;
        let mean = s1 / nf;
        let sd = (s2 / nf - mean * mean).sqrt();
        assert!((mean - p.los.mean_db).abs() < 0.01, "{mean}");
        assert!((sd - p.los.std_db).abs() < 0.01, "{sd}");
        let mp_db = 10.0 * (mp / nf).log10();
        assert!((mp_db - p.los.multipath_db).abs() < 0.1, "{mp_db}");
    }

    #[test]
    fn same_seed_is_bit_identical() {
        let p = LandMobileParams::default();
        let g = test_geom(30.0);
        let mut a = Composite::new(L1_HZ).with(LandMobile::new(p, 1));
        let mut b = Composite::new(L1_HZ).with(LandMobile::new(p, 1));
        for k in 0..2000 {
            let t = k as f64 * 0.05;
            assert_eq!(a.snapshot(6, t, &g), b.snapshot(6, t, &g));
        }
    }
}
