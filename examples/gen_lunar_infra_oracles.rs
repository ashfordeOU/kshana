// SPDX-License-Identifier: AGPL-3.0-only
//! Write the inputs of the independent numpy oracles of studies 3 to 5
//! (`scripts/gen_lunar_infra_oracles.py`, bars F2, T3 and G2) into `tests/fixtures/lunar_infra/`.
//!
//! ```text
//! cargo run --release --example gen_lunar_infra_oracles
//! ```
use kshana::lunar_infra::{frame, geodesy, tie, LunarInfrastructureScenario};

fn load(name: &str) -> LunarInfrastructureScenario {
    let path = format!("scenarios/lunar-infrastructure-{name}.toml");
    toml::from_str(&std::fs::read_to_string(&path).expect("scenario file")).expect("scenario parses")
}

fn write(name: &str, v: &serde_json::Value) {
    std::fs::write(format!("tests/fixtures/lunar_infra/{name}"), v.to_string()).expect("write");
}

fn main() {
    write("frame_partials.json", &frame::export_partials(50, 20261019));
    let s = load("space-tie");
    let arc = s.orbit.clone().unwrap_or_default().arc_days.unwrap_or(6.56);
    write(
        "tie_geometry.json",
        &tie::export(&s.orbit.unwrap_or_default(), &s.techniques.unwrap_or_default(), arc).expect("tie"),
    );
    let s = load("geodesy-sensitivity");
    write(
        "geodesy_geometry.json",
        &geodesy::export(
            &s.orbit.unwrap_or_default(),
            &s.nominal.unwrap_or_default(),
            &s.llr.unwrap_or_default(),
            &s.orbiter.unwrap_or_default(),
            &s.gravimeter.unwrap_or_default(),
            &s.clock.unwrap_or_default(),
        )
        .expect("geodesy"),
    );
}
