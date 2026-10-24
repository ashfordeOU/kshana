// SPDX-License-Identifier: AGPL-3.0-only
//! The `mission-thread` scenario kind's shared interface (0.40 WS-H and WS-I): a chain of mission
//! phases that carries a navigation-and-timing error budget through every handover.
//!
//! This module is the contract. A phase kind implements [`MissionPhase`]: it takes the state the
//! previous phase exited with and returns its own exit state, its error budget, a time series and
//! its events. The thread owns what is shared: the epoch, the per-phase seed, frame and timescale
//! conversion, and the handover rules ([`handover::apply_handover`]). A phase never converts
//! frames or timescales itself and never resets a covariance.
//!
//! **MODELLED.** Phases carry an [`phase::EvidenceLabel`]; the thread's label is the weakest of
//! its phases. Public sources only; not affiliated with or endorsed by any agency. Nothing is
//! transmitted and no hardware is driven.
//!
//! Ownership: the Earth-side phase kinds are in `earth/`, the lunar ones in `lunar/`. A kind that
//! is registered but not written yet is a stub that fails loudly at run time, so a phase is never
//! silently skipped.

pub mod budget;
pub mod handover;
pub mod lunar;
pub mod phase;
pub mod sensors;

use phase::{EvidenceLabel, Frame, NavState, PhaseOutcome, Timescale};

/// The thread-level context every phase runs in.
#[derive(Clone, Debug, PartialEq)]
pub struct ThreadCtx {
    /// The thread's epoch, as a UTC ISO-8601 string; mission elapsed time is seconds since it.
    pub epoch_utc: String,
    /// The thread's seed. Each phase gets its own derived seed ([`ThreadCtx::phase_seed`]), so a
    /// phase run on its own returns the numbers it returns inside the thread.
    pub seed: u64,
}

impl ThreadCtx {
    /// A context for an epoch and a seed.
    pub fn new(epoch_utc: &str, seed: u64) -> Self {
        ThreadCtx {
            epoch_utc: epoch_utc.to_string(),
            seed,
        }
    }

    /// The seed of phase number `index` (zero-based): the thread seed mixed with the index by the
    /// splitmix64 finaliser, so neighbouring phases do not share a stream.
    pub fn phase_seed(&self, index: usize) -> u64 {
        let mut z = self
            .seed
            .wrapping_add((index as u64 + 1).wrapping_mul(0x9E37_79B9_7F4A_7C15));
        z = (z ^ (z >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
        z ^ (z >> 31)
    }

    /// Converts a state to another frame at a handover, returning the converted state and the
    /// budget lines the conversion adds. The identity conversion adds no line. Other pairs are
    /// not available yet and fail loudly.
    pub fn convert_frame(
        &self,
        state: &NavState,
        to: Frame,
    ) -> Result<(NavState, Vec<budget::BudgetRow>), String> {
        if state.frame == to {
            return Ok((state.clone(), Vec::new()));
        }
        Err(format!(
            "frame conversion {:?} -> {:?} is not implemented yet",
            state.frame, to
        ))
    }

    /// Converts a state's clock to another timescale at a handover, returning the converted state
    /// and the budget lines the conversion adds. The identity conversion adds no line. Other
    /// pairs are not available yet and fail loudly.
    pub fn convert_timescale(
        &self,
        state: &NavState,
        to: Timescale,
    ) -> Result<(NavState, Vec<budget::BudgetRow>), String> {
        if state.clock.timescale == to {
            return Ok((state.clone(), Vec::new()));
        }
        Err(format!(
            "timescale conversion {:?} -> {:?} is not implemented yet",
            state.clock.timescale, to
        ))
    }
}

/// A mission phase.
pub trait MissionPhase: Send + Sync {
    /// The registered kind name.
    fn kind(&self) -> &'static str;

    /// Runs the phase from the state the previous phase exited with.
    fn run(&self, entry: &NavState, ctx: &ThreadCtx) -> Result<PhaseOutcome, String>;
}

/// Builds a phase from the phase kind's own `[phase.model]` table.
pub type PhaseCtor = fn(&toml::Table) -> Result<Box<dyn MissionPhase>, String>;

/// A registered phase kind.
#[derive(Clone, Copy)]
pub struct PhaseKindInfo {
    /// The kind name used in documents.
    pub kind: &'static str,
    /// Who writes it: `earth` or `lunar`.
    pub segment: &'static str,
    /// The constructor.
    pub ctor: PhaseCtor,
    /// False while the kind is a stub that errors at run time.
    pub implemented: bool,
}

/// A phase kind that is registered but not written: it parses its table and fails when run.
struct Stub {
    kind: &'static str,
}

impl MissionPhase for Stub {
    fn kind(&self) -> &'static str {
        self.kind
    }

    fn run(&self, _entry: &NavState, _ctx: &ThreadCtx) -> Result<PhaseOutcome, String> {
        Err(format!(
            "phase kind `{}` is registered but not implemented in this build",
            self.kind
        ))
    }
}

macro_rules! stub_ctor {
    ($name:expr) => {
        |_t: &toml::Table| -> Result<Box<dyn MissionPhase>, String> {
            Ok(Box::new(Stub { kind: $name }))
        }
    };
}

/// Every registered phase kind. The Earth kinds are written by the Earth-segment owner and the
/// lunar kinds by the lunar-segment owner; each replaces its stub here.
pub static PHASE_KINDS: &[PhaseKindInfo] = &[
    PhaseKindInfo {
        kind: "launch-ascent",
        segment: "earth",
        ctor: stub_ctor!("launch-ascent"),
        implemented: false,
    },
    PhaseKindInfo {
        kind: "leo-rendezvous",
        segment: "earth",
        ctor: stub_ctor!("leo-rendezvous"),
        implemented: false,
    },
    PhaseKindInfo {
        kind: "tli-and-cruise",
        segment: "earth",
        ctor: stub_ctor!("tli-and-cruise"),
        implemented: false,
    },
    PhaseKindInfo {
        kind: "entry",
        segment: "earth",
        ctor: stub_ctor!("entry"),
        implemented: false,
    },
    PhaseKindInfo {
        kind: "lunar-orbit-rendezvous",
        segment: "lunar",
        ctor: lunar::orbit_rendezvous_ctor,
        implemented: true,
    },
    PhaseKindInfo {
        kind: "lunar-descent",
        segment: "lunar",
        ctor: lunar::descent_ctor,
        implemented: true,
    },
    PhaseKindInfo {
        kind: "lunar-surface",
        segment: "lunar",
        ctor: lunar::surface_ctor,
        implemented: true,
    },
    PhaseKindInfo {
        kind: "lunar-ascent",
        segment: "lunar",
        ctor: lunar::ascent_ctor,
        implemented: true,
    },
];

/// Looks a phase kind up by name; an unknown name lists the registered ones.
pub fn phase_kind(kind: &str) -> Result<&'static PhaseKindInfo, String> {
    PHASE_KINDS.iter().find(|k| k.kind == kind).ok_or_else(|| {
        let known: Vec<&str> = PHASE_KINDS.iter().map(|k| k.kind).collect();
        format!(
            "unknown phase kind `{kind}`; registered kinds are {}",
            known.join(", ")
        )
    })
}

/// The label a thread of no phases would carry; kept here so callers do not build one by hand.
pub fn empty_label() -> EvidenceLabel {
    EvidenceLabel::modelled()
}

#[cfg(test)]
mod tests {
    use super::*;
    use phase::{Frame, Timescale};

    fn entry() -> NavState {
        NavState::diagonal(
            0.0,
            Frame::Gcrf,
            [0.0; 6],
            1.0,
            0.01,
            Timescale::Utc,
            1e-6,
            1e-12,
        )
    }

    #[test]
    fn every_registered_kind_has_a_unique_name_and_a_segment() {
        let mut names: Vec<&str> = PHASE_KINDS.iter().map(|k| k.kind).collect();
        let n = names.len();
        names.sort_unstable();
        names.dedup();
        assert_eq!(names.len(), n);
        assert!(PHASE_KINDS
            .iter()
            .all(|k| k.segment == "earth" || k.segment == "lunar"));
        for lunar in [
            "lunar-orbit-rendezvous",
            "lunar-descent",
            "lunar-surface",
            "lunar-ascent",
        ] {
            assert_eq!(phase_kind(lunar).unwrap().segment, "lunar");
        }
    }

    #[test]
    fn a_stub_fails_loudly_when_run_and_an_unknown_kind_lists_the_known_ones() {
        let info = phase_kind("launch-ascent").unwrap();
        let p = (info.ctor)(&toml::Table::new()).unwrap();
        assert_eq!(p.kind(), "launch-ascent");
        let e = p
            .run(&entry(), &ThreadCtx::new("2028-01-01T00:00:00Z", 1))
            .unwrap_err();
        assert!(e.contains("not implemented"), "{e}");
        let e = phase_kind("warp-drive").err().unwrap();
        assert!(
            e.contains("launch-ascent") && e.contains("lunar-ascent"),
            "{e}"
        );
    }

    #[test]
    fn phase_seeds_are_reproducible_and_differ_between_phases() {
        let a = ThreadCtx::new("2028-01-01T00:00:00Z", 20261024);
        let b = ThreadCtx::new("2028-01-01T00:00:00Z", 20261024);
        assert_eq!(a.phase_seed(3), b.phase_seed(3));
        let seeds: Vec<u64> = (0..16).map(|i| a.phase_seed(i)).collect();
        let mut s = seeds.clone();
        s.sort_unstable();
        s.dedup();
        assert_eq!(s.len(), seeds.len());
        assert_ne!(
            a.phase_seed(0),
            ThreadCtx::new("2028-01-01T00:00:00Z", 1).phase_seed(0)
        );
    }

    #[test]
    fn identity_conversions_add_no_line_and_the_others_fail_loudly() {
        let ctx = ThreadCtx::new("2028-01-01T00:00:00Z", 1);
        let s = entry();
        let (same, rows) = ctx.convert_frame(&s, Frame::Gcrf).unwrap();
        assert_eq!(same, s);
        assert!(rows.is_empty());
        assert!(ctx.convert_frame(&s, Frame::Mci).is_err());
        let (same, rows) = ctx.convert_timescale(&s, Timescale::Utc).unwrap();
        assert_eq!(same, s);
        assert!(rows.is_empty());
        assert!(ctx.convert_timescale(&s, Timescale::Ltc).is_err());
    }

    #[test]
    fn the_empty_label_is_modelled() {
        assert_eq!(empty_label().tier, phase::LabelTier::Modelled);
    }
}
