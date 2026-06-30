//! `ExternalPack::register_into` seam: an out-of-tree pack registers its own
//! factory into a fresh `PackRegistry` and is then buildable by id, without
//! touching core's built-in table.

use kshana::api::{ExternalPack, KshanaError, RunOutput, Scenario, ScenarioMeta};
use kshana::registry::{PackRegistry, ScenarioFactory, ScenarioId};

/// A minimal third-party scenario that lives entirely in this test.
struct DemoPack {
    src: String,
}

const DEMO_ID: &str = "demo-external-pack";

impl Scenario for DemoPack {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        Ok(RunOutput {
            json: format!("{{\"src_len\":{}}}", self.src.len()),
            svg: String::new(),
            summary: format!("demo pack ran on {} bytes", self.src.len()),
        })
    }
}

impl ExternalPack for DemoPack {
    fn kind_name(&self) -> &'static str {
        DEMO_ID
    }

    fn meta(&self) -> ScenarioMeta {
        ScenarioMeta {
            name: DEMO_ID,
            description: "in-test external pack exercising the register_into seam",
            required_fields: &[],
            optional_fields: &[],
        }
    }

    fn register_into(reg: &mut PackRegistry) {
        reg.register(Box::new(DemoFactory {
            id: ScenarioId::from_static(DEMO_ID),
        }));
    }
}

/// The factory the pack installs into a registry.
struct DemoFactory {
    id: ScenarioId,
}

impl ScenarioFactory for DemoFactory {
    fn id(&self) -> &ScenarioId {
        &self.id
    }

    fn build(&self, src: &str) -> Result<Box<dyn Scenario>, String> {
        Ok(Box::new(DemoPack {
            src: src.to_string(),
        }))
    }
}

#[test]
fn register_into_makes_pack_buildable() {
    let id = ScenarioId::from_static(DEMO_ID);

    // Fresh registry: the demo id is absent until the pack registers itself.
    let mut reg = PackRegistry::default();
    assert!(
        !reg.contains(&id),
        "demo id must be absent before register_into"
    );

    // Drive the seam exactly as an external integrator would.
    DemoPack::register_into(&mut reg);

    // Now the registry knows the id and can build a runnable scenario for it.
    assert!(
        reg.contains(&id),
        "register_into must install the demo factory"
    );
    let scenario = reg
        .build(&id, "payload = 42")
        .expect("registered factory must build");
    let out = scenario.run().expect("built scenario must run");
    assert_eq!(out.summary, "demo pack ran on 12 bytes");
}

#[test]
fn register_into_default_is_noop() {
    // A pack that does NOT override register_into (relying on the defaulted no-op)
    // must leave the registry untouched — proving the default keeps existing
    // implementors source-compatible.
    struct SilentPack;
    impl Scenario for SilentPack {
        fn run(&self) -> Result<RunOutput, KshanaError> {
            Ok(RunOutput {
                json: "{}".into(),
                svg: String::new(),
                summary: String::new(),
            })
        }
    }
    impl ExternalPack for SilentPack {
        fn kind_name(&self) -> &'static str {
            "silent"
        }
        fn meta(&self) -> ScenarioMeta {
            ScenarioMeta {
                name: "silent",
                description: "",
                required_fields: &[],
                optional_fields: &[],
            }
        }
        // no register_into override — uses the defaulted no-op
    }

    let mut reg = PackRegistry::default();
    SilentPack::register_into(&mut reg);
    assert_eq!(
        reg.ids().count(),
        0,
        "defaulted register_into must be a no-op"
    );
}
