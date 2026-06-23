// SPDX-License-Identifier: AGPL-3.0-only
use kshana::fom_label::{tier_for, ValidationTier};
#[test]
fn every_fom_has_a_tier_and_holdover_is_modelled() {
    for name in [
        "timing_rms_ns",
        "timing_p95_ns",
        "holdover_s",
        "resilience_slope_ns_per_s",
        "availability",
        "integrity",
        "security",
    ] {
        assert!(tier_for(name).is_some(), "no tier for {name}");
    }
    assert_eq!(tier_for("holdover_s"), Some(ValidationTier::Modelled));
}
