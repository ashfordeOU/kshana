//! Scenario pack registry — the dispatch seam.
//!
//! Historically `crate::api::run_toml` matched a resolved [`crate::api::ScenarioKind`]
//! against one big exhaustive table. This module introduces a thin, object-safe
//! registry over that table so out-of-tree packs can interpose without forking core,
//! while the built-ins keep running byte-for-byte the same code. The seam is
//! `no_std`/WASM-friendly: it uses [`std::collections::BTreeMap`] and
//! [`std::borrow::Cow`] and never reads the wall clock.

use std::borrow::Cow;
use std::collections::BTreeMap;

/// A stable, interned identifier for a scenario pack — the registry key. For the
/// built-ins this is exactly the kebab-case `kind` string from
/// [`crate::api::ScenarioKind::as_str`]; third-party packs choose their own.
#[derive(Clone, PartialEq, Eq, PartialOrd, Ord, Hash, Debug)]
pub struct ScenarioId(Cow<'static, str>);

impl ScenarioId {
    /// Construct an id from a `'static` string in `const` context (used by the
    /// [`ids`] table below). No allocation.
    pub const fn from_static(s: &'static str) -> Self {
        ScenarioId(Cow::Borrowed(s))
    }

    /// The id as a string slice.
    pub fn as_str(&self) -> &str {
        &self.0
    }
}

impl std::fmt::Display for ScenarioId {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.0)
    }
}

/// The single source of truth for which kinds are built in. Both [`ids::all`] and
/// [`PackRegistry::with_builtins`] are derived from this, so they cannot drift.
const BUILTIN_KINDS: &[crate::api::ScenarioKind] = {
    use crate::api::ScenarioKind::*;
    &[
        Clock,
        Inertial,
        Integrity,
        TimeTransfer,
        QuantumTimeTransfer,
        QuantumGnssFreeNav,
        QuantumAnomalyDetect,
        Hybrid,
        Fusion,
        HybridUkf,
        GnssIns,
        GnssSim,
        Jamming,
        Spoof,
        SpoofDetect,
        Sweep,
        SweepNd,
        Orbit,
        Ephemeris,
        LunarIntegrity,
        LunarTime,
        LunarVlbi,
        LunarCombination,
        LunarFrameRealise,
        LunarService,
        LunarDpnt,
        LunarInterop,
        GravityMap,
        Terrain,
        TerrainSlam,
        CombinedAltPnt,
        Pvt,
        MarsPnt,
        ImpairmentEval,
        QuantumTrade,
        SpaceWeather,
        OemInterop,
        LaunchWindow,
        Reentry,
        EoCoverage,
        SpacePacket,
        AttitudeBudget,
        Passes,
        LinkBudget,
        LunarTimeBudget,
        RealtimeFrameEop,
        HybridOpticalRf,
    ]
};

/// The canonical id constants — one per built-in [`crate::api::ScenarioKind`]. The
/// string values are the exact kebab strings returned by
/// [`crate::api::ScenarioKind::as_str`].
pub mod ids {
    use super::ScenarioId;

    pub const CLOCK: ScenarioId = ScenarioId::from_static("clock");
    pub const INERTIAL: ScenarioId = ScenarioId::from_static("inertial");
    pub const INTEGRITY: ScenarioId = ScenarioId::from_static("integrity");
    pub const TIMETRANSFER: ScenarioId = ScenarioId::from_static("timetransfer");
    pub const QUANTUM_TIME_TRANSFER: ScenarioId = ScenarioId::from_static("quantum-time-transfer");
    pub const QUANTUM_GNSS_FREE_NAV: ScenarioId = ScenarioId::from_static("quantum-gnss-free-nav");
    pub const QUANTUM_ANOMALY_DETECT: ScenarioId =
        ScenarioId::from_static("quantum-anomaly-detect");
    pub const HYBRID: ScenarioId = ScenarioId::from_static("hybrid");
    pub const FUSION: ScenarioId = ScenarioId::from_static("fusion");
    pub const HYBRID_UKF: ScenarioId = ScenarioId::from_static("hybrid-ukf");
    pub const GNSS_INS: ScenarioId = ScenarioId::from_static("gnss-ins");
    pub const GNSS_SIM: ScenarioId = ScenarioId::from_static("gnss-sim");
    pub const JAMMING: ScenarioId = ScenarioId::from_static("jamming");
    pub const SPOOF: ScenarioId = ScenarioId::from_static("spoof");
    pub const SPOOF_DETECT: ScenarioId = ScenarioId::from_static("spoof-detect");
    pub const SWEEP: ScenarioId = ScenarioId::from_static("sweep");
    pub const SWEEP_ND: ScenarioId = ScenarioId::from_static("sweep-nd");
    pub const ORBIT: ScenarioId = ScenarioId::from_static("orbit");
    pub const EPHEMERIS: ScenarioId = ScenarioId::from_static("ephemeris");
    pub const LUNAR_INTEGRITY: ScenarioId = ScenarioId::from_static("lunar-integrity");
    pub const LUNAR_TIME_OFFSET: ScenarioId = ScenarioId::from_static("lunar-time-offset");
    pub const LUNAR_VLBI: ScenarioId = ScenarioId::from_static("lunar-vlbi");
    pub const LUNAR_JOINT_OD_CLOCK: ScenarioId = ScenarioId::from_static("lunar-joint-od-clock");
    pub const LUNAR_FRAME_REALISATION: ScenarioId =
        ScenarioId::from_static("lunar-frame-realisation");
    pub const MOONLIGHT_SERVICE_VOLUME: ScenarioId =
        ScenarioId::from_static("moonlight-service-volume");
    pub const LUNAR_DIFFERENTIAL_PNT: ScenarioId =
        ScenarioId::from_static("lunar-differential-pnt");
    pub const LUNAR_INTEROP_EXPORT: ScenarioId = ScenarioId::from_static("lunar-interop-export");
    pub const GRAVITY_MAP: ScenarioId = ScenarioId::from_static("gravity-map");
    pub const TERRAIN_NAV: ScenarioId = ScenarioId::from_static("terrain-nav");
    pub const TERRAIN_SLAM: ScenarioId = ScenarioId::from_static("terrain-slam");
    pub const COMBINED_ALTPNT: ScenarioId = ScenarioId::from_static("combined-altpnt");
    pub const PVT: ScenarioId = ScenarioId::from_static("pvt");
    pub const MARS_PNT: ScenarioId = ScenarioId::from_static("mars-pnt");
    pub const IMPAIRMENT_EVAL: ScenarioId = ScenarioId::from_static("impairment-eval");
    pub const QUANTUM_TRADE: ScenarioId = ScenarioId::from_static("quantum-trade");
    pub const SPACE_WEATHER: ScenarioId = ScenarioId::from_static("space-weather");
    pub const OEM_INTEROP: ScenarioId = ScenarioId::from_static("oem-interop");
    pub const LAUNCH_WINDOW: ScenarioId = ScenarioId::from_static("launch-window");
    pub const REENTRY: ScenarioId = ScenarioId::from_static("reentry");
    pub const EO_COVERAGE: ScenarioId = ScenarioId::from_static("eo-coverage");
    pub const SPACE_PACKET: ScenarioId = ScenarioId::from_static("space-packet");
    pub const ATTITUDE_BUDGET: ScenarioId = ScenarioId::from_static("attitude-budget");
    pub const PASSES: ScenarioId = ScenarioId::from_static("passes");
    pub const LINK_BUDGET: ScenarioId = ScenarioId::from_static("link-budget");
    pub const LUNAR_TIME_BUDGET: ScenarioId = ScenarioId::from_static("lunar-time-budget");
    pub const REALTIME_FRAME_EOP: ScenarioId = ScenarioId::from_static("realtime-frame-eop");
    pub const HYBRID_OPTICAL_RF: ScenarioId = ScenarioId::from_static("hybrid-optical-rf");

    /// Every built-in scenario id, in the engine's canonical order.
    pub fn all() -> Vec<ScenarioId> {
        super::BUILTIN_KINDS
            .iter()
            .map(|k| ScenarioId::from_static(k.as_str()))
            .collect()
    }
}

/// A factory that knows how to build one scenario pack from its TOML source. The
/// trait is object-safe so a [`PackRegistry`] can hold a heterogeneous set behind
/// `Box<dyn ScenarioFactory>`.
pub trait ScenarioFactory: Send + Sync {
    /// The id this factory answers to.
    fn id(&self) -> &ScenarioId;

    /// Parse `src` and return a ready-to-run [`crate::api::Scenario`].
    fn build(&self, src: &str) -> Result<Box<dyn crate::api::Scenario>, String>;

    /// Introspection metadata. The default is an empty placeholder; packs that want
    /// to surface richer metadata override this.
    fn metadata(&self) -> crate::api::ScenarioMeta {
        crate::api::ScenarioMeta {
            name: "",
            description: "",
            required_fields: &[],
            optional_fields: &[],
        }
    }
}

/// A registry mapping [`ScenarioId`] to the factory that builds it.
#[derive(Default)]
pub struct PackRegistry {
    scenarios: BTreeMap<ScenarioId, Box<dyn ScenarioFactory>>,
}

impl PackRegistry {
    /// Register a factory, returning `self` for chaining. In debug builds, asserts
    /// that no id is registered twice.
    pub fn register(&mut self, factory: Box<dyn ScenarioFactory>) -> &mut Self {
        let id = factory.id().clone();
        debug_assert!(
            !self.scenarios.contains_key(&id),
            "duplicate scenario id registered: {id}"
        );
        self.scenarios.insert(id, factory);
        self
    }

    /// Build a scenario for `id` from `src`. Returns `Err` if the id is unknown.
    pub fn build(
        &self,
        id: &ScenarioId,
        src: &str,
    ) -> Result<Box<dyn crate::api::Scenario>, String> {
        match self.scenarios.get(id) {
            Some(factory) => factory.build(src),
            None => Err(format!("unknown scenario id: {id}")),
        }
    }

    /// Whether an id is registered.
    pub fn contains(&self, id: &ScenarioId) -> bool {
        self.scenarios.contains_key(id)
    }

    /// Iterate the registered ids in sorted order.
    pub fn ids(&self) -> impl Iterator<Item = &ScenarioId> {
        self.scenarios.keys()
    }

    /// A registry pre-populated with every built-in pack.
    pub fn with_builtins() -> Self {
        let mut reg = PackRegistry::default();
        for &kind in BUILTIN_KINDS {
            reg.register(Box::new(BuiltinFactory {
                id: ScenarioId::from_static(kind.as_str()),
                kind,
            }));
        }
        reg
    }
}

/// The built scenario for a built-in kind: it carries the resolved kind and the raw
/// source, and runs by routing back into the engine's exhaustive dispatch table.
struct BuiltinScenario {
    kind: crate::api::ScenarioKind,
    src: String,
}

impl crate::api::Scenario for BuiltinScenario {
    fn run(&self) -> Result<crate::api::RunOutput, crate::api::KshanaError> {
        crate::api::run_builtin_kind(self.kind, &self.src)
            .map_err(crate::api::KshanaError::InvalidInput)
    }
}

/// The factory for a built-in pack — a thin adapter over the engine's dispatch.
struct BuiltinFactory {
    id: ScenarioId,
    kind: crate::api::ScenarioKind,
}

impl ScenarioFactory for BuiltinFactory {
    fn id(&self) -> &ScenarioId {
        &self.id
    }

    fn build(&self, src: &str) -> Result<Box<dyn crate::api::Scenario>, String> {
        Ok(Box::new(BuiltinScenario {
            kind: self.kind,
            src: src.to_string(),
        }))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn ids_all_matches_as_str_table() {
        let all = ids::all();
        assert_eq!(all.len(), BUILTIN_KINDS.len());
        for (id, kind) in all.iter().zip(BUILTIN_KINDS.iter()) {
            assert_eq!(id.as_str(), kind.as_str());
        }
    }

    #[test]
    fn id_const_round_trips() {
        assert_eq!(ids::CLOCK.as_str(), "clock");
        assert_eq!(ids::LUNAR_TIME_OFFSET.as_str(), "lunar-time-offset");
        assert_eq!(ids::JAMMING.as_str(), "jamming");
    }

    #[test]
    fn with_builtins_registers_every_kind() {
        let reg = PackRegistry::with_builtins();
        assert_eq!(reg.ids().count(), BUILTIN_KINDS.len());
        for kind in BUILTIN_KINDS {
            assert!(reg.contains(&ScenarioId::from_static(kind.as_str())));
        }
    }

    #[test]
    fn ids_are_sorted_and_unique() {
        let reg = PackRegistry::with_builtins();
        let ids: Vec<&ScenarioId> = reg.ids().collect();
        for w in ids.windows(2) {
            assert!(
                w[0] < w[1],
                "ids must be strictly increasing: {} !< {}",
                w[0],
                w[1]
            );
        }
    }

    #[test]
    fn build_unknown_id_errors() {
        let reg = PackRegistry::with_builtins();
        let err = match reg.build(&ScenarioId::from_static("does-not-exist"), "") {
            Ok(_) => panic!("expected unknown-id error"),
            Err(e) => e,
        };
        assert_eq!(err, "unknown scenario id: does-not-exist");
    }

    #[test]
    fn default_is_empty() {
        let reg = PackRegistry::default();
        assert_eq!(reg.ids().count(), 0);
        assert!(!reg.contains(&ids::CLOCK));
    }

    #[test]
    fn build_is_lazy_parse_deferred_to_run() {
        // Building never parses — it only wraps (kind, src). Even gibberish builds;
        // the parse/validation error (if any) surfaces from run(), preserving the
        // engine's existing error strings.
        let reg = PackRegistry::with_builtins();
        assert!(reg.build(&ids::CLOCK, "not = valid = toml").is_ok());
    }
}
