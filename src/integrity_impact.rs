// SPDX-License-Identifier: AGPL-3.0-only
//! Detection-miss → integrity-impact mapping (context-aware alert limits).
//!
//! A resilience detector (spoof / jamming / RAIM) that *misses* a fault leaves an
//! undetected position bias `b` in the navigation solution. This module maps that
//! miss into the language the integrity/safety community uses: the bias inflates the
//! effective position error, and — held against a **context-specific alert limit**
//! (open-sky vs urban, horizontal HAL vs vertical VAL) — it lands in one of the
//! Stanford regions (available / unavailable / misleading / hazardous).
//!
//! It composes the shipped, externally-anchored RAIM core
//! ([`crate::raim::classify_stanford`] / [`crate::raim::StanfordRegion`]); it adds no
//! new integrity mathematics, only the detection-miss → protection-level → alert-limit
//! bridge.
//!
//! ### Honesty
//! The protection level here is the *nominal* (no-fault) PL from the ARAIM engine; a
//! missed detection means the true error can reach `nominal_error + undetected_bias`
//! while the reported PL stays at nominal — exactly the **Misleading-Information**
//! risk a monitor exists to bound. This is a modelled mapping of a modelled bias; it
//! is not a certified integrity allocation.

use serde::Serialize;

use crate::raim::{classify_stanford, StanfordRegion};

/// A named operational context with its horizontal/vertical alert limits (m). Tighter
/// limits (urban / precision approach) make the same undetected bias more dangerous.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IntegrityContext {
    pub name: String,
    /// Horizontal alert limit HAL (m).
    pub hal_m: f64,
    /// Vertical alert limit VAL (m).
    pub val_m: f64,
}

impl IntegrityContext {
    /// Open-sky en-route-style limits (loose). Illustrative, not a certified ALERT
    /// LIMIT allocation — the caller should supply the operation's real limits.
    pub fn open_sky() -> Self {
        IntegrityContext {
            name: "open-sky (en-route, illustrative)".into(),
            hal_m: 1852.0, // ~1 NM, RNP en-route order of magnitude
            val_m: 50.0,
        }
    }

    /// Urban / terminal-style limits (tight). Illustrative.
    pub fn urban() -> Self {
        IntegrityContext {
            name: "urban / terminal (illustrative)".into(),
            hal_m: 40.0,
            val_m: 20.0,
        }
    }
}

/// The integrity impact of one detection miss, on one axis (horizontal or vertical).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct AxisImpact {
    /// `"horizontal"` or `"vertical"`.
    pub axis: String,
    /// Nominal (no-fault) error on this axis (m).
    pub nominal_error_m: f64,
    /// Undetected bias added by the missed detection (m).
    pub undetected_bias_m: f64,
    /// Effective error = nominal + bias (m).
    pub effective_error_m: f64,
    /// The nominal protection level on this axis (m) — unchanged by an *undetected*
    /// fault (the monitor did not flag it), which is the whole danger.
    pub protection_level_m: f64,
    /// The alert limit for this axis in this context (m).
    pub alert_limit_m: f64,
    /// The Stanford region the effective error + nominal PL fall into.
    pub region: StanfordRegion,
    /// Signed margin to the alert limit (m): `alert_limit − effective_error`. Negative
    /// means the alert limit is exceeded.
    pub margin_to_al_m: f64,
}

/// The full context-aware integrity impact of a detection miss (both axes).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DetectionMissImpact {
    pub context: IntegrityContext,
    pub horizontal: AxisImpact,
    pub vertical: AxisImpact,
    /// True if either axis is hazardously misleading (HMI) — the unsafe outcome.
    pub any_hazardous: bool,
    /// True if either axis is misleading (MI or HMI) — an integrity event occurred.
    pub any_misleading: bool,
    pub caveat: String,
}

#[allow(clippy::too_many_arguments)]
fn axis_impact(
    axis: &str,
    nominal_error_m: f64,
    undetected_bias_m: f64,
    protection_level_m: f64,
    alert_limit_m: f64,
) -> AxisImpact {
    let effective = nominal_error_m + undetected_bias_m;
    let region = classify_stanford(effective, protection_level_m, alert_limit_m);
    AxisImpact {
        axis: axis.to_string(),
        nominal_error_m,
        undetected_bias_m,
        effective_error_m: effective,
        protection_level_m,
        alert_limit_m,
        region,
        margin_to_al_m: alert_limit_m - effective,
    }
}

/// Map a detection miss to its context-aware integrity impact. `h_bias_m` / `v_bias_m`
/// are the undetected biases the missed detection leaves on each axis (m);
/// `hpl_m` / `vpl_m` are the nominal protection levels; nominal errors default the
/// no-fault truth on each axis.
#[allow(clippy::too_many_arguments)]
pub fn detection_miss_impact(
    context: IntegrityContext,
    h_nominal_error_m: f64,
    v_nominal_error_m: f64,
    h_bias_m: f64,
    v_bias_m: f64,
    hpl_m: f64,
    vpl_m: f64,
) -> Result<DetectionMissImpact, String> {
    for (n, v) in [
        ("h_nominal_error", h_nominal_error_m),
        ("v_nominal_error", v_nominal_error_m),
        ("h_bias", h_bias_m),
        ("v_bias", v_bias_m),
        ("hpl", hpl_m),
        ("vpl", vpl_m),
    ] {
        if !v.is_finite() || v < 0.0 {
            return Err(format!("{n} must be finite and non-negative"));
        }
    }
    let horizontal = axis_impact(
        "horizontal",
        h_nominal_error_m,
        h_bias_m,
        hpl_m,
        context.hal_m,
    );
    let vertical = axis_impact(
        "vertical",
        v_nominal_error_m,
        v_bias_m,
        vpl_m,
        context.val_m,
    );
    let hazardous =
        |r: &StanfordRegion| matches!(r, StanfordRegion::HazardouslyMisleadingInformation);
    let misleading = |r: &StanfordRegion| {
        matches!(
            r,
            StanfordRegion::MisleadingInformation
                | StanfordRegion::HazardouslyMisleadingInformation
        )
    };
    Ok(DetectionMissImpact {
        any_hazardous: hazardous(&horizontal.region) || hazardous(&vertical.region),
        any_misleading: misleading(&horizontal.region) || misleading(&vertical.region),
        context,
        horizontal,
        vertical,
        caveat: "MODELLED detection-miss → integrity mapping over the externally-anchored RAIM \
                 Stanford classification; alert limits are caller/context inputs (illustrative \
                 defaults provided), not a certified integrity allocation."
            .into(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn small_bias_open_sky_is_available() {
        // 5 m nominal error, a 10 m undetected bias (15 m effective), PL 30 m,
        // open-sky HAL ~1852 m → PL bounds the inflated error and PL < AL → Available.
        let r = detection_miss_impact(
            IntegrityContext::open_sky(),
            5.0,
            3.0,
            10.0,
            4.0,
            30.0,
            25.0,
        )
        .unwrap();
        assert_eq!(r.horizontal.region, StanfordRegion::Available);
        assert!(!r.any_hazardous);
        assert!(!r.any_misleading);
        // effective horizontal error = 5 + 10 = 15.
        assert!((r.horizontal.effective_error_m - 15.0).abs() < 1e-9);
        assert!(r.horizontal.margin_to_al_m > 0.0);
    }

    #[test]
    fn same_miss_in_urban_context_becomes_misleading_or_hazardous() {
        // The SAME 30 m effective horizontal error, but urban HAL = 40 m and a PL that
        // does NOT bound it (PL 20 < 30 effective): PL<error and error<AL → MI;
        // push the bias higher and it crosses AL → HMI. Context changes the verdict.
        let mi = detection_miss_impact(
            IntegrityContext::urban(),
            5.0,
            2.0,
            25.0, // effective h = 30
            3.0,
            20.0, // hpl < 30
            18.0,
        )
        .unwrap();
        assert_eq!(mi.horizontal.region, StanfordRegion::MisleadingInformation);
        assert!(mi.any_misleading && !mi.any_hazardous);

        let hmi = detection_miss_impact(
            IntegrityContext::urban(),
            5.0,
            2.0,
            50.0, // effective h = 55 > HAL 40
            3.0,
            20.0,
            18.0,
        )
        .unwrap();
        assert_eq!(
            hmi.horizontal.region,
            StanfordRegion::HazardouslyMisleadingInformation
        );
        assert!(hmi.any_hazardous && hmi.any_misleading);
        assert!(
            hmi.horizontal.margin_to_al_m < 0.0,
            "AL exceeded → negative margin"
        );
    }

    #[test]
    fn conservative_pl_with_large_bias_is_unavailable_not_hazardous() {
        // PL is large (300 m) and bounds the 55 m effective error, but PL > urban HAL
        // 40 → SystemUnavailable (safe, just not usable) — the conservative outcome.
        let r = detection_miss_impact(IntegrityContext::urban(), 5.0, 2.0, 50.0, 3.0, 300.0, 300.0)
            .unwrap();
        assert_eq!(r.horizontal.region, StanfordRegion::SystemUnavailable);
        assert!(!r.any_hazardous);
    }

    #[test]
    fn vertical_axis_is_classified_independently() {
        // Horizontal safe, vertical hazardous (tight VAL): any_hazardous must catch it.
        let r = detection_miss_impact(
            IntegrityContext::urban(),
            1.0,
            5.0,
            2.0,  // h effective 3, well under HAL 40, PL bounds
            40.0, // v effective 45 > VAL 20
            10.0,
            15.0, // vpl 15 < 45 → PL fails to bound
        )
        .unwrap();
        assert_eq!(r.horizontal.region, StanfordRegion::Available);
        assert_eq!(
            r.vertical.region,
            StanfordRegion::HazardouslyMisleadingInformation
        );
        assert!(r.any_hazardous);
    }

    #[test]
    fn rejects_negative_or_nonfinite_inputs() {
        assert!(
            detection_miss_impact(IntegrityContext::urban(), -1.0, 0.0, 0.0, 0.0, 10.0, 10.0)
                .is_err()
        );
        assert!(detection_miss_impact(
            IntegrityContext::urban(),
            0.0,
            0.0,
            f64::NAN,
            0.0,
            10.0,
            10.0
        )
        .is_err());
    }

    #[test]
    fn serializes_with_regions_and_caveat() {
        let r = detection_miss_impact(
            IntegrityContext::open_sky(),
            5.0,
            3.0,
            10.0,
            4.0,
            30.0,
            25.0,
        )
        .unwrap();
        let json = serde_json::to_string(&r).unwrap();
        assert!(json.contains("region"));
        assert!(json.contains("MODELLED"));
        assert!(json.contains("alert_limit_m"));
    }
}
