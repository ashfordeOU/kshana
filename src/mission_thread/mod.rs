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
//! Ownership: the Earth-side phase kinds are in `earth/`, the lunar ones in `lunar/`. Every registered
//! kind is written; a document that names an unknown kind is refused with the list of known ones, so a
//! phase is never silently skipped.

pub mod budget;
pub mod conversions;
pub mod earth;
pub mod handover;
pub mod lunar;
pub mod phase;
pub mod scenario;
pub mod sensors;

use phase::{EvidenceLabel, Frame, NavState, PhaseOutcome, Timescale};
use sha2::{Digest, Sha256};

/// The thread-level context every phase runs in.
#[derive(Clone)]
pub struct ThreadCtx {
    /// The thread's epoch, as a UTC ISO-8601 string; mission elapsed time is seconds since it.
    pub epoch_utc: String,
    /// The thread's seed. Each phase gets its own derived seed ([`ThreadCtx::phase_seed`]), so a
    /// phase run on its own returns the numbers it returns inside the thread.
    pub seed: u64,
    /// An optional JPL SPK kernel holding the Moon and the Earth. Where it covers an epoch the
    /// frame conversions take the Moon's state from it; elsewhere they fall back to the analytic
    /// series and say so in the budget line.
    pub moon_kernel: Option<std::sync::Arc<crate::ephem_provider::KernelEphemeris>>,
}

impl std::fmt::Debug for ThreadCtx {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("ThreadCtx")
            .field("epoch_utc", &self.epoch_utc)
            .field("seed", &self.seed)
            .field(
                "moon_kernel_sha256",
                &self
                    .moon_kernel
                    .as_ref()
                    .map(|k| k.kernel_sha256().to_string()),
            )
            .finish()
    }
}

impl PartialEq for ThreadCtx {
    fn eq(&self, other: &Self) -> bool {
        self.epoch_utc == other.epoch_utc
            && self.seed == other.seed
            && self
                .moon_kernel
                .as_ref()
                .map(|k| k.kernel_sha256().to_string())
                == other
                    .moon_kernel
                    .as_ref()
                    .map(|k| k.kernel_sha256().to_string())
    }
}

impl ThreadCtx {
    /// A context for an epoch and a seed.
    pub fn new(epoch_utc: &str, seed: u64) -> Self {
        ThreadCtx {
            epoch_utc: epoch_utc.to_string(),
            seed,
            moon_kernel: None,
        }
    }

    /// The same context with a JPL SPK kernel (it must hold the Moon, 301, and the Earth, 399,
    /// relative to the Earth-Moon barycentre) as the source of the Moon's state.
    pub fn with_moon_kernel(mut self, kernel: crate::ephem_provider::KernelEphemeris) -> Self {
        self.moon_kernel = Some(std::sync::Arc::new(kernel));
        self
    }

    /// [`ThreadCtx::with_moon_kernel`] reading the kernel from a file.
    pub fn with_moon_kernel_file(self, path: &std::path::Path) -> Result<Self, String> {
        Ok(self.with_moon_kernel(crate::ephem_provider::KernelEphemeris::open(path)?))
    }

    /// The seed of the phase with the given id: the first eight bytes of SHA-256 over the thread
    /// seed (little-endian) and the id. The id is unique within a thread and stable when phases
    /// are reordered, so a phase run on its own with the same id gets the numbers it gets in the
    /// thread, and two phases of the same kind (two rendezvous repeats) get different noise.
    pub fn phase_seed(&self, id: &str) -> u64 {
        let mut h = Sha256::new();
        h.update(self.seed.to_le_bytes());
        h.update(id.as_bytes());
        let d = h.finalize();
        u64::from_le_bytes([d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7]])
    }

    /// The per-phase context for the phase with this index, id and duration, with no navigation
    /// sources stated (the phase uses its own defaults) and a GNSS time source.
    pub fn phase_ctx(&self, index: usize, id: &str, duration_s: f64) -> PhaseCtx {
        PhaseCtx {
            index,
            id: id.to_string(),
            duration_s,
            seed: self.phase_seed(id),
            nav: Vec::new(),
            time: phase::TimeSource::Gnss,
            ground_duty: None,
        }
    }

    /// The per-phase context for a phase the document states: id, duration, navigation sources
    /// and time source from the spec.
    pub fn phase_ctx_for(&self, index: usize, spec: &phase::PhaseSpec) -> PhaseCtx {
        PhaseCtx {
            index,
            id: spec.id.clone(),
            duration_s: spec.duration_s,
            seed: self.phase_seed(&spec.id),
            nav: spec.nav.clone(),
            time: spec.time,
            ground_duty: None,
        }
    }

    /// Converts a state to another frame at a handover, returning the converted state and the
    /// budget lines the conversion adds ([`conversions`] says what each pair does). The identity
    /// conversion adds no line; pairs that are not available fail loudly.
    pub fn convert_frame(
        &self,
        state: &NavState,
        to: Frame,
    ) -> Result<(NavState, Vec<budget::BudgetRow>), String> {
        conversions::convert_frame(self, state, to)
    }

    /// Converts a state's clock to another timescale at a handover, returning the converted state
    /// and the budget lines the conversion adds, one per hop through TT. The identity conversion
    /// adds no line.
    pub fn convert_timescale(
        &self,
        state: &NavState,
        to: Timescale,
    ) -> Result<(NavState, Vec<budget::BudgetRow>), String> {
        conversions::convert_timescale(self, state, to)
    }
}

/// What the thread tells one phase about its place in the thread.
#[derive(Clone, Debug, PartialEq)]
pub struct PhaseCtx {
    /// Zero-based position in the thread (0 when run standalone).
    pub index: usize,
    /// The phase id from the document; unique within the thread.
    pub id: String,
    /// The phase length the thread passes, seconds.
    pub duration_s: f64,
    /// The phase's seed, derived from the thread seed and the phase id.
    pub seed: u64,
    /// The navigation sources the document lists for the phase. Empty means "not stated" (a
    /// standalone run): the phase then uses its own default list.
    pub nav: Vec<phase::NavSource>,
    /// The time source the document gives the phase.
    pub time: phase::TimeSource,
    /// The fraction of the phase a ground station can track the vehicle, from the ground-network
    /// overlay; `None` when the document has no overlay (a phase then uses its own stated value).
    pub ground_duty: Option<f64>,
}

impl PhaseCtx {
    /// Whether the phase may use a navigation source: true when the document lists it, and true
    /// for every source when the document lists none (a standalone run).
    pub fn uses(&self, source: phase::NavSource) -> bool {
        self.nav.is_empty() || self.nav.contains(&source)
    }

    /// Checks a phase kind's own length key (`arc_s`, `descent_s`, `stay_days` converted to
    /// seconds, `ascent_s`) against the length the thread passes. They must agree; the phase
    /// refuses a mismatch rather than silently using one of the two.
    pub fn require_duration(&self, key: &str, own_s: f64) -> Result<(), String> {
        let tol = 1e-9 * self.duration_s.abs().max(own_s.abs()).max(1.0);
        if (own_s - self.duration_s).abs() <= tol {
            Ok(())
        } else {
            Err(crate::terr!(
                "e-mission-thread-phase-its-model-is-but",
                id = self.id,
                key = key,
                own_s = crate::i18n::num_plain(own_s),
                duration_s = crate::i18n::num_plain(self.duration_s)
            ))
        }
    }
}

/// A mission phase.
pub trait MissionPhase: Send + Sync {
    /// The registered kind name.
    fn kind(&self) -> &'static str;

    /// Runs the phase from the state the previous phase exited with. Call it through
    /// [`run_phase`], which sets the budget's phase id to the document's id.
    fn run(
        &self,
        entry: &NavState,
        ctx: &ThreadCtx,
        phase: &PhaseCtx,
    ) -> Result<PhaseOutcome, String>;
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
    /// False while a kind is registered but not written: it then errors when run.
    pub implemented: bool,
}

/// Every registered phase kind: the four Earth kinds and the four lunar kinds.
pub static PHASE_KINDS: &[PhaseKindInfo] = &[
    PhaseKindInfo {
        kind: "launch-ascent",
        segment: "earth",
        ctor: earth::launch::ctor,
        implemented: true,
    },
    PhaseKindInfo {
        kind: "leo-rendezvous",
        segment: "earth",
        ctor: earth::rendezvous::ctor,
        implemented: true,
    },
    PhaseKindInfo {
        kind: "tli-and-cruise",
        segment: "earth",
        ctor: earth::tli_cruise::ctor,
        implemented: true,
    },
    PhaseKindInfo {
        kind: "entry",
        segment: "earth",
        ctor: earth::entry::ctor,
        implemented: true,
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

/// Runs a phase and stamps the document's phase id on its budget, whatever id the phase put
/// there. The thread calls phases only through this.
pub fn run_phase(
    phase: &dyn MissionPhase,
    entry: &NavState,
    ctx: &ThreadCtx,
    pctx: &PhaseCtx,
) -> Result<PhaseOutcome, String> {
    let mut out = phase.run(entry, ctx, pctx)?;
    out.budget.phase_id = pctx.id.clone();
    Ok(out)
}

/// Looks a phase kind up by name; an unknown name lists the registered ones.
pub fn phase_kind(kind: &str) -> Result<&'static PhaseKindInfo, String> {
    PHASE_KINDS.iter().find(|k| k.kind == kind).ok_or_else(|| {
        let known: Vec<&str> = PHASE_KINDS.iter().map(|k| k.kind).collect();
        crate::terr!(
            "e-mission-thread-unknown-phase-kind",
            kind = kind,
            known = known.join(", ")
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
    fn every_kind_is_implemented_and_an_unknown_kind_lists_the_known_ones() {
        assert!(PHASE_KINDS.iter().all(|k| k.implemented));
        // A kind whose table lacks what it needs is refused when built, naming the key.
        let info = phase_kind("entry").unwrap();
        let e = (info.ctor)(&toml::Table::new()).err().unwrap();
        assert!(e.contains("needs"), "{e}");
        let e = phase_kind("warp-drive").err().unwrap();
        assert!(
            e.contains("launch-ascent") && e.contains("lunar-ascent"),
            "{e}"
        );
    }

    #[test]
    fn phase_seeds_come_from_the_id_not_the_index_or_the_kind() {
        let a = ThreadCtx::new("2028-01-01T00:00:00Z", 20261024);
        let b = ThreadCtx::new("2028-01-01T00:00:00Z", 20261024);
        // Reproducible, and a standalone context for the same id gives the in-thread seed.
        assert_eq!(a.phase_seed("rdv-2"), b.phase_seed("rdv-2"));
        assert_eq!(
            a.phase_ctx(5, "rdv-2", 3600.0).seed,
            b.phase_ctx(0, "rdv-2", 3600.0).seed
        );
        // Two repeats of one kind get different noise; changing the thread seed changes it.
        assert_ne!(a.phase_seed("rdv-1"), a.phase_seed("rdv-2"));
        assert_ne!(
            a.phase_seed("rdv-1"),
            ThreadCtx::new("2028-01-01T00:00:00Z", 1).phase_seed("rdv-1")
        );
        // Moving a phase to another index does not move its seed.
        assert_eq!(
            a.phase_ctx(0, "rdv-1", 1.0).seed,
            a.phase_ctx(7, "rdv-1", 1.0).seed
        );
        let seeds: Vec<u64> = (0..16).map(|i| a.phase_seed(&format!("p{i}"))).collect();
        let mut sorted = seeds.clone();
        sorted.sort_unstable();
        sorted.dedup();
        assert_eq!(sorted.len(), seeds.len());
    }

    #[test]
    fn a_model_length_that_disagrees_with_the_thread_duration_is_refused() {
        let ctx = ThreadCtx::new("2028-01-01T00:00:00Z", 1);
        let pctx = ctx.phase_ctx(2, "descent", 900.0);
        assert!(pctx.require_duration("descent_s", 900.0).is_ok());
        let e = pctx.require_duration("descent_s", 600.0).unwrap_err();
        assert!(
            e.contains("descent_s") && e.contains("900") && e.contains("descent"),
            "{e}"
        );
    }

    struct IdEcho;
    impl MissionPhase for IdEcho {
        fn kind(&self) -> &'static str {
            "echo"
        }
        fn run(
            &self,
            entry: &NavState,
            _ctx: &ThreadCtx,
            _phase: &PhaseCtx,
        ) -> Result<PhaseOutcome, String> {
            Ok(PhaseOutcome {
                exit: entry.clone(),
                budget: budget::PhaseBudget {
                    phase_id: "whatever the phase wrote".into(),
                    kind: "echo".into(),
                    entry_sigma_pos_m: 0.0,
                    entry_sigma_vel_mps: 0.0,
                    entry_sigma_time_s: 0.0,
                    exit_sigma_pos_m: 0.0,
                    exit_sigma_vel_mps: 0.0,
                    exit_sigma_time_s: 0.0,
                    peak_sigma_pos_m: 0.0,
                    peak_sigma_vel_mps: 0.0,
                    peak_sigma_time_s: 0.0,
                    nav_sources: vec![],
                    time_source: phase::TimeSource::Gnss,
                    limiting_source: None,
                    rows: vec![],
                    label: EvidenceLabel::modelled(),
                },
                series: vec![],
                events: vec![],
                label: EvidenceLabel::modelled(),
            })
        }
    }

    #[test]
    fn the_thread_stamps_the_document_id_on_the_budget() {
        let ctx = ThreadCtx::new("2028-01-01T00:00:00Z", 1);
        let pctx = ctx.phase_ctx(1, "docking-a", 10.0);
        let out = run_phase(&IdEcho, &entry(), &ctx, &pctx).unwrap();
        assert_eq!(out.budget.phase_id, "docking-a");
    }

    #[test]
    fn identity_conversions_add_no_line_and_unavailable_pairs_fail_loudly() {
        let ctx = ThreadCtx::new("2028-01-01T00:00:00Z", 1);
        let s = entry();
        let (same, rows) = ctx.convert_frame(&s, Frame::Gcrf).unwrap();
        assert_eq!(same, s);
        assert!(rows.is_empty());
        assert!(ctx.convert_frame(&s, Frame::Itrf).is_err());
        let (same, rows) = ctx.convert_timescale(&s, Timescale::Utc).unwrap();
        assert_eq!(same, s);
        assert!(rows.is_empty());
    }

    #[test]
    fn the_empty_label_is_modelled() {
        assert_eq!(empty_label().tier, phase::LabelTier::Modelled);
    }
}
