//! Registry conformance suite — the public-surface reachability contract.
//!
//! This guards the invariant that the *registry* (`PackRegistry::with_builtins`)
//! and the *public id table* (`registry::ids::all`) can never silently drift apart.
//! Concretely: every id the crate advertises as public MUST resolve to a registered,
//! reachable factory. If someone adds a `ScenarioKind` / id constant but forgets to
//! wire it into `with_builtins` (or vice-versa), this test fails loudly instead of
//! shipping a public id that dead-ends in an "unknown scenario id" error at runtime.
//!
//! Two independent layers of assurance:
//!   1. *Registration* — for EVERY id in `ids::all()`, the registry `contains` it,
//!      and `build` never rejects it as an unknown id.
//!   2. *Reachability* — for a representative handful of kinds, a minimal valid
//!      source is actually `build`-ed and `run`, proving the id routes into real
//!      pack code and surfaces (at worst) a parse/validation error — never an
//!      unknown-id error.

use kshana::api::KshanaError;
use kshana::registry::{self, PackRegistry, ScenarioId};

/// A minimal, syntactically valid TOML source naming `id` as its kind. For most
/// built-in packs every field has a serde default, so this is enough to run; for the
/// rest it still parses and the pack's own validation decides the outcome. Either way
/// it must never be rejected as an *unknown* id, because `id` is public.
fn minimal_src(id: &ScenarioId) -> String {
    format!("kind = \"{}\"\n", id.as_str())
}

/// The core conformance assertion, parameterised over a registry so the same contract
/// can later be re-run against a superset registry (e.g. a pro attachment) without
/// duplicating logic.
pub fn assert_registry_conforms(reg: &PackRegistry) {
    let all = registry::ids::all();
    assert!(
        !all.is_empty(),
        "registry::ids::all() is empty — the public id table vanished"
    );

    // Layer 1: every public id is registered and not treated as unknown by `build`.
    for id in &all {
        assert!(
            reg.contains(id),
            "public id `{id}` is advertised by registry::ids::all() but is NOT \
             registered in the registry — it would dead-end in an unknown-id error"
        );

        // `build` is lazy (it defers parsing to `run`), so for a registered id it
        // returns Ok. The contract we pin here is the negative one: a public id must
        // NEVER fail with an "unknown scenario id" error. If `build` ever grows eager
        // validation, a parse/validation Err is still acceptable — an unknown-id Err
        // is not.
        if let Err(e) = reg.build(id, &minimal_src(id)) {
            assert!(
                !e.contains("unknown scenario id"),
                "build(`{id}`) failed with an unknown-id error, but `{id}` is a \
                 public id and must be reachable: {e}"
            );
        }
    }

    // Layer 2: representative end-to-end reachability. Each id is built from a minimal
    // valid source and run. The outcome must be either Ok or a *structured*
    // validation error (`KshanaError`) — proving dispatch reaches real pack code.
    // `run` cannot, by construction, produce an unknown-id error, so reaching it at
    // all is the proof of reachability.
    let representative = [
        registry::ids::CLOCK,
        registry::ids::PVT,
        registry::ids::JAMMING,
        registry::ids::LUNAR_TIME_OFFSET,
        registry::ids::LINK_BUDGET,
        registry::ids::ATTITUDE_BUDGET,
        registry::ids::MOONLIGHT_SERVICE_VOLUME,
    ];
    for id in &representative {
        assert!(
            reg.contains(id),
            "representative id `{id}` is not registered"
        );
        let scenario = reg
            .build(id, &minimal_src(id))
            .unwrap_or_else(|e| panic!("build(`{id}`) on minimal valid TOML failed: {e}"));
        match scenario.run() {
            Ok(_) => {}
            Err(KshanaError::InvalidInput(_))
            | Err(KshanaError::NonConvergence(_))
            | Err(KshanaError::Unsupported(_))
            | Err(KshanaError::IoError(_)) => {
                // A structured error is fine: the id reached real pack code and the
                // pack decided the minimal input was insufficient. That still proves
                // the id is registered & reachable, which is what conformance asserts.
            }
        }
    }
}

#[test]
fn builtins_registry_conforms() {
    assert_registry_conforms(&PackRegistry::with_builtins());
}

#[test]
fn every_public_id_is_reachable_not_unknown() {
    // A focused restatement of layer 1, independent of layer 2, so a failure here
    // points straight at a registration gap.
    let reg = PackRegistry::with_builtins();
    for id in registry::ids::all() {
        assert!(
            reg.contains(&id),
            "public id `{id}` is not registered in with_builtins()"
        );
        let built = reg.build(&id, &minimal_src(&id));
        if let Err(e) = built {
            assert!(
                !e.contains("unknown scenario id"),
                "public id `{id}` produced an unknown-id error from build(): {e}"
            );
        }
    }
}
