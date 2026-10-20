// SPDX-License-Identifier: AGPL-3.0-only
//! Write the inputs of the independent scipy oracle of the lunar-infrastructure studies
//! (`scripts/gen_lunar_infra_oracle.py`): the corrected NRHO initial condition and period that
//! `kshana::lunar_infra::orbit::OrbitSpec` starts from.
//!
//! ```text
//! cargo run --example gen_lunar_infra_inputs > tests/fixtures/lunar_infra/nrho_ic.json
//! ```
use kshana::lunar_infra::orbit::OrbitSpec;

fn main() {
    let (x0, period_s) = OrbitSpec::default().initial().expect("the NRHO corrects");
    println!(
        "{{\"mu\": {:?}, \"ic\": {:?}, \"period_s\": {:?}, \"t_unit_s\": {:?}}}",
        kshana::cr3bp::EARTH_MOON_MU,
        x0,
        period_s.unwrap_or(0.0),
        kshana::lunar_infra::orbit::T_UNIT_S
    );
}
