// SPDX-License-Identifier: AGPL-3.0-only
//! The lock state the scorer reads, derived from a channel's lock indicators.
//!
//! This follows the lock state machine of `docs/design/LOOP-DESIGN-TOML.md` §3 and is
//! driven by a design's [`LockConfig`]. A channel is **LOCKED** once its locks have held for
//! `cn0_windows` consecutive updates. A **LOCKED** channel is **LOST** after its locks have
//! been down continuously for `loss_dwell_s`. A channel that never locks is LOST after
//! `pull_in_max_s`. Its loops keep running after a loss, so it is LOCKED again if the locks
//! hold once more for `cn0_windows` updates. The "locks" are phase and code lock for a
//! design with a phase loop, and code lock alone for an FLL-only design.
//!
//! This module derives lock state from the indicators every tracker emits. Once the
//! tracker reports its own state and false-lock detections, the campaign feeds those
//! through instead, and nothing downstream changes.

use super::score::ScoreEpoch;
use crate::iq::track::design::LockConfig;
use crate::iq::track::EpochOutput;

/// The derived lock state of one channel.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum LockState {
    /// Not yet locked.
    PullIn,
    /// Locked.
    Locked,
    /// Lost after a lock, or never locked within the pull-in time.
    Lost,
}

/// Turns one channel's [`EpochOutput`]s into [`ScoreEpoch`]s with a lock state.
#[derive(Clone, Debug)]
pub struct LockTracker {
    cfg: LockConfig,
    has_pll: bool,
    hold_updates: usize,
    state: LockState,
    good_run: usize,
    down_since: Option<f64>,
    start_t: Option<f64>,
}

impl LockTracker {
    /// A tracker for a channel running a design with `has_pll` (a phase loop), lock settings
    /// `cfg` and `cn0_windows` updates of hold before lock is declared.
    pub fn new(cfg: &LockConfig, has_pll: bool, cn0_windows: usize) -> Self {
        Self {
            cfg: cfg.clone(),
            has_pll,
            hold_updates: cn0_windows.max(1),
            state: LockState::PullIn,
            good_run: 0,
            down_since: None,
            start_t: None,
        }
    }

    /// The current state.
    pub fn state(&self) -> LockState {
        self.state
    }

    /// Advance on one loop update and return it as the scorer sees it.
    pub fn update(&mut self, e: &EpochOutput) -> ScoreEpoch {
        let t = e.code_epoch_s;
        let start = *self.start_t.get_or_insert(t);
        let up = if self.has_pll {
            e.phase_lock && e.code_lock
        } else {
            e.code_lock
        };
        let down = if self.has_pll {
            !e.phase_lock && !e.code_lock
        } else {
            !e.code_lock
        };
        self.good_run = if up { self.good_run + 1 } else { 0 };
        match self.state {
            LockState::PullIn | LockState::Lost => {
                if self.good_run >= self.hold_updates {
                    self.state = LockState::Locked;
                    self.down_since = None;
                } else if self.state == LockState::PullIn && t - start > self.cfg.pull_in_max_s {
                    self.state = LockState::Lost;
                }
            }
            LockState::Locked => {
                if down {
                    let since = *self.down_since.get_or_insert(t);
                    if t - since >= self.cfg.loss_dwell_s {
                        self.state = LockState::Lost;
                        self.good_run = 0;
                    }
                } else {
                    self.down_since = None;
                }
            }
        }
        ScoreEpoch {
            t_s: t,
            t_coh_s: e.t_coh_s,
            locked: self.state == LockState::Locked,
            phase_lock: e.phase_lock,
            code_lock: e.code_lock,
            cn0_dbhz: e.cn0_nwpr_dbhz,
            pll_rad: e.disc.pll_rad,
            dll_chips: e.disc.dll_chips,
            doppler_hz: e.doppler_hz,
            false_lock_flag: false,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn out(t: f64, lock: bool) -> EpochOutput {
        EpochOutput {
            epoch: 0,
            sample_index: 0,
            code_epoch_s: t,
            t_coh_s: 1e-3,
            periods: 1,
            early: Default::default(),
            prompt: Default::default(),
            late: Default::default(),
            disc: Default::default(),
            doppler_hz: 0.0,
            carrier_phase_cycles: 0.0,
            code_rate_hz: 0.0,
            code_phase_chips: 0.0,
            pli: 0.0,
            phase_lock: lock,
            code_lock: lock,
            cn0_nwpr_dbhz: None,
            cn0_beaulieu_dbhz: None,
            bit_edge: None,
            bit: None,
        }
    }

    #[test]
    fn lock_needs_a_hold_and_loss_needs_a_dwell() {
        let mut lt = LockTracker::new(&LockConfig::default(), true, 50);
        let mut states = Vec::new();
        for i in 0..2000 {
            let t = i as f64 * 1e-3;
            // Locks up from the start, down 0.5-0.6 s (short of the 0.2 s dwell? no: 0.1 s)
            // and 1.0-1.5 s (longer than the dwell).
            let lock = !((0.5..0.6).contains(&t) || (1.0..1.5).contains(&t));
            states.push(lt.update(&out(t, lock)).locked);
        }
        assert!(!states[48] && states[49]);
        assert!(states[550], "a 0.1 s dip is shorter than the dwell");
        assert!(
            states[1150] && !states[1250],
            "lost 0.2 s into the 0.5 s dip"
        );
        assert!(
            !states[1548] && states[1549],
            "relocked after 50 good updates"
        );
    }

    #[test]
    fn a_channel_that_never_locks_is_lost_after_pull_in() {
        let mut lt = LockTracker::new(&LockConfig::default(), true, 50);
        for i in 0..2500 {
            lt.update(&out(i as f64 * 1e-3, false));
        }
        assert_eq!(lt.state(), LockState::Lost);
    }
}
