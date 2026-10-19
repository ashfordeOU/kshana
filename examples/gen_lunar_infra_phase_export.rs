// SPDX-License-Identifier: AGPL-3.0-only
//! Write the raw carrier-phase design of a half-day arc and kshana's float solution of it, as the
//! input of the independent numpy oracle (`scripts/gen_lunar_infra_phase_oracle.py`, bar Q3).
//!
//! ```text
//! cargo run --example gen_lunar_infra_phase_export > tests/fixtures/lunar_infra/phase_design.json
//! ```
use kshana::lunar_infra::LunarInfrastructureScenario;

fn main() {
    let toml = include_str!("../scenarios/lunar-infrastructure-carrier-phase.toml");
    let s: LunarInfrastructureScenario = toml::from_str(toml).expect("scenario parses");
    let v = kshana::lunar_infra::phase::export_design(
        &s.orbit.unwrap_or_default(),
        &s.gnss.unwrap_or_default(),
        &s.surface.unwrap_or_default(),
        0.5,
    )
    .expect("design builds");
    println!("{v}");
}
