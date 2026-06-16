// SPDX-License-Identifier: Apache-2.0
//! Space-weather environment model: solar (F10.7) and geomagnetic (Kp/ap) activity
//! indices and their first-order effect on thermospheric neutral density — the
//! activity dependence the static US-Standard-Atmosphere-1976
//! ([`crate::forces::atmospheric_density`]) deliberately omits.
//!
//! Real thermospheric density at LEO altitudes (200–1000 km) swings by roughly an
//! order of magnitude over the 11-year solar cycle, driven by extreme-UV heating
//! (tracked by the 10.7 cm radio flux F10.7) and geomagnetic storms (tracked by
//! Kp/ap). The static model has no such dependence, so a drag or orbit-lifetime
//! estimate at one altitude is the same at solar minimum and maximum — physically
//! wrong by ~5–10×. This module supplies the missing driver.
//!
//! What is rigorous here:
//!   * the **Kp↔ap** quasi-logarithmic conversion is the definitional IAGA/GFZ
//!     28-step table (exact at every grid point);
//!   * the **exospheric temperature** is the Jacchia-1971 nighttime global
//!     minimum `T_c = 379 + 3.24·F̄ + 1.3·(F − F̄)` plus the geomagnetic increment
//!     `ΔT = 28·Kp + 0.03·e^Kp`, validated against the published solar-min/mean/max
//!     magnitudes.
//!
//! Honest scope (MODELLED, not a data-validated atmosphere): the density
//! correction [`density_activity_factor`] is a **first-order, phenomenological**
//! scale-height coupling — `exp[C·Δh·(1/T_ref − 1/T∞)]` — whose single coefficient
//! `C` is *calibrated* so the 400 km solar-cycle density ratio lands at the
//! middle of the observed 5–10× range. It captures the correct sign, monotonicity
//! and order of magnitude of the activity dependence; it is **not** NRLMSISE-00 /
//! Jacchia-Bowman absolute density and makes no per-altitude accuracy claim. The
//! static USSA76 profile is taken as the moderate-activity (`T∞ ≈ 1000 K`)
//! reference at which the factor is unity.

use serde::Deserialize;

/// The IAGA/GFZ planetary `Kp → ap` quasi-logarithmic conversion: the `ap`
/// equivalents (in units of 2 nT) of the 28 standard Kp steps
/// (`0o, 0+, 1−, 1o, …, 9−, 9o`), indexed by `Kp·3` (so entry `i` is `Kp = i/3`).
/// This is a definitional lookup, exact at every grid point.
const AP_TABLE: [f64; 28] = [
    0.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 9.0, 12.0, 15.0, 18.0, 22.0, 27.0, 32.0, 39.0, 48.0, 56.0,
    67.0, 80.0, 94.0, 111.0, 132.0, 154.0, 179.0, 207.0, 236.0, 300.0, 400.0,
];

/// Convert a planetary `Kp` index (0–9) to its `ap` equivalent via the
/// definitional table, snapping `Kp` to the nearest one-third step. Clamped to
/// `[0, 9]`.
pub fn ap_from_kp(kp: f64) -> f64 {
    let kp = kp.clamp(0.0, 9.0);
    let idx = (kp * 3.0).round() as usize;
    AP_TABLE[idx.min(AP_TABLE.len() - 1)]
}

/// Convert an `ap` value to the planetary `Kp` index whose table entry is closest,
/// the inverse of [`ap_from_kp`] (exact at the tabulated `ap` values).
pub fn kp_from_ap(ap: f64) -> f64 {
    let mut best_idx = 0usize;
    let mut best_d = (ap - AP_TABLE[0]).abs();
    for (i, &a) in AP_TABLE.iter().enumerate().skip(1) {
        let d = (ap - a).abs();
        if d < best_d {
            best_idx = i;
            best_d = d;
        }
    }
    best_idx as f64 / 3.0
}

/// Daily `Ap` from the eight three-hourly `ap` values: their arithmetic mean (the
/// definitional relationship).
pub fn daily_ap(ap_3hourly: &[f64; 8]) -> f64 {
    ap_3hourly.iter().sum::<f64>() / 8.0
}

/// Centred 81-day average of an F10.7 daily series at index `i` — the standard
/// `F10.7a` solar-flux smoothing (window clipped at the series ends).
pub fn f107a_centered(series: &[f64], i: usize) -> f64 {
    if series.is_empty() {
        return 0.0;
    }
    let half = 40usize;
    let lo = i.saturating_sub(half);
    let hi = (i + half + 1).min(series.len());
    let w = &series[lo..hi];
    w.iter().sum::<f64>() / w.len() as f64
}

/// Jacchia-1971 global exospheric temperature `T∞` (K) for daily solar flux
/// `f107` (sfu), 81-day average `f107a` (sfu) and planetary `kp` (0–9):
/// the nighttime global minimum `T_c = 379 + 3.24·F̄ + 1.3·(F − F̄)` plus the
/// geomagnetic increment `ΔT = 28·Kp + 0.03·e^Kp`.
pub fn exospheric_temperature(f107: f64, f107a: f64, kp: f64) -> f64 {
    let kp = kp.clamp(0.0, 9.0);
    let t_c = 379.0 + 3.24 * f107a + 1.3 * (f107 - f107a);
    let dt_geo = 28.0 * kp + 0.03 * kp.exp();
    t_c + dt_geo
}

/// Reference exospheric temperature (K) at which the density correction is unity —
/// the moderate-activity value implied by the static USSA76 thermosphere.
const REFERENCE_EXOSPHERIC_TEMP_K: f64 = 1000.0;
/// Base of the activity-sensitive thermosphere (km); below it density is treated
/// as activity-insensitive (factor = 1).
const THERMOSPHERE_BASE_KM: f64 = 120.0;
/// Empirical scale-height coupling (K·km⁻¹), calibrated so the 400 km density
/// ratio between solar-minimum (`T∞ ≈ 606 K`) and solar-maximum (`T∞ ≈ 1124 K`)
/// exospheric temperatures is ≈ 7× — the middle of the observed 5–10× solar-cycle
/// swing. This is a calibration constant, NOT a physical molecular mass.
const DENSITY_TEMP_COUPLING_K_PER_KM: f64 = 9.14;

/// First-order, MODELLED density multiplier on the static [`crate::forces::atmospheric_density`]
/// at geometric altitude `altitude_m` for exospheric temperature `t_inf_k`:
/// `exp[C·Δh·(1/T_ref − 1/T∞)]` above the thermosphere base, 1 below it. Unity at
/// the reference temperature; >1 for hotter (more active) thermospheres, <1 for
/// cooler. See the module honesty note — this is a calibrated scale-height
/// coupling, not an absolute NRLMSISE density.
pub fn density_activity_factor(altitude_m: f64, t_inf_k: f64) -> f64 {
    let h_km = altitude_m / 1000.0;
    if h_km <= THERMOSPHERE_BASE_KM || t_inf_k <= 0.0 {
        return 1.0;
    }
    let dh = h_km - THERMOSPHERE_BASE_KM;
    (DENSITY_TEMP_COUPLING_K_PER_KM * dh * (1.0 / REFERENCE_EXOSPHERIC_TEMP_K - 1.0 / t_inf_k))
        .exp()
}

/// Activity-corrected neutral density (kg/m³) at geometric altitude `altitude_m`:
/// the static USSA76 profile scaled by [`density_activity_factor`] for this
/// space-weather state. MODELLED first-order activity dependence.
pub fn space_weather_density(altitude_m: f64, sw: &SpaceWeather) -> f64 {
    crate::forces::atmospheric_density(altitude_m)
        * density_activity_factor(altitude_m, sw.exospheric_temperature())
}

/// A space-weather state: the solar (F10.7 daily + 81-day average, sfu) and
/// geomagnetic (planetary Kp, 0–9) activity indices.
#[derive(Clone, Copy, Debug)]
pub struct SpaceWeather {
    pub f107: f64,
    pub f107a: f64,
    pub kp: f64,
}

impl SpaceWeather {
    /// The `ap` equivalent of this state's `Kp`.
    pub fn ap(&self) -> f64 {
        ap_from_kp(self.kp)
    }
    /// Jacchia-1971 exospheric temperature (K) for this state.
    pub fn exospheric_temperature(&self) -> f64 {
        exospheric_temperature(self.f107, self.f107a, self.kp)
    }
    /// Activity-corrected neutral density (kg/m³) at `altitude_m`.
    pub fn density(&self, altitude_m: f64) -> f64 {
        space_weather_density(altitude_m, self)
    }
}

fn sw_default_f107() -> f64 {
    150.0
}
fn sw_default_kp() -> f64 {
    3.0
}
fn sw_default_altitudes() -> Vec<f64> {
    vec![300.0, 400.0, 500.0, 800.0]
}

/// The `space-weather` scenario: report the activity indices, the Jacchia-1971
/// exospheric temperature, and the activity-corrected vs static neutral density at
/// a set of altitudes for a given solar/geomagnetic state.
#[derive(Deserialize)]
pub struct SpaceWeatherScenario {
    /// Daily F10.7 solar radio flux (sfu).
    #[serde(default = "sw_default_f107")]
    pub f107: f64,
    /// 81-day average F10.7 (sfu); defaults to `f107` when absent.
    #[serde(default)]
    pub f107a: Option<f64>,
    /// Planetary geomagnetic Kp index (0–9).
    #[serde(default = "sw_default_kp")]
    pub kp: f64,
    /// Altitudes (km) at which to report density.
    #[serde(default = "sw_default_altitudes")]
    pub altitudes_km: Vec<f64>,
}

impl SpaceWeatherScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let f107a = self.f107a.unwrap_or(self.f107);
        if !self.f107.is_finite() || self.f107 <= 0.0 {
            return Err("f107 must be finite and positive".to_string());
        }
        if !f107a.is_finite() || f107a <= 0.0 {
            return Err("f107a must be finite and positive".to_string());
        }
        if !self.kp.is_finite() || !(0.0..=9.0).contains(&self.kp) {
            return Err("kp must be in [0, 9]".to_string());
        }
        if self.altitudes_km.is_empty() {
            return Err("altitudes_km must be non-empty".to_string());
        }
        for &h in &self.altitudes_km {
            if !h.is_finite() || h <= 0.0 {
                return Err(format!("altitude {h} km must be finite and positive"));
            }
        }
        let sw = SpaceWeather {
            f107: self.f107,
            f107a,
            kp: self.kp,
        };
        let t_inf = sw.exospheric_temperature();
        let rows: Vec<serde_json::Value> = self
            .altitudes_km
            .iter()
            .map(|&h| {
                let alt_m = h * 1000.0;
                let stat = crate::forces::atmospheric_density(alt_m);
                let factor = density_activity_factor(alt_m, t_inf);
                serde_json::json!({
                    "altitude_km": h,
                    "static_density_kg_m3": stat,
                    "activity_density_kg_m3": stat * factor,
                    "activity_factor": factor,
                })
            })
            .collect();
        let json = serde_json::json!({
            "kind": "space-weather",
            "label": "MODELLED — solar/geomagnetic indices + Jacchia-71 exospheric \
                      temperature; density is a calibrated first-order activity \
                      correction, NOT a data-validated (NRLMSISE) atmosphere",
            "f107": self.f107,
            "f107a": f107a,
            "kp": self.kp,
            "ap": sw.ap(),
            "exospheric_temperature_k": t_inf,
            "reference_exospheric_temperature_k": REFERENCE_EXOSPHERIC_TEMP_K,
            "altitudes": rows,
        });
        let summary = format!(
            "space-weather: F10.7={:.0} F10.7a={:.0} Kp={:.1} (ap={:.0}) -> T_inf={:.0} K; \
             density x{:.2} at {:.0} km (MODELLED)",
            self.f107,
            f107a,
            self.kp,
            sw.ap(),
            t_inf,
            density_activity_factor(self.altitudes_km[0] * 1000.0, t_inf),
            self.altitudes_km[0],
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn kp_to_ap_matches_the_definitional_table_at_grid_points() {
        // Exact at the standard grid: 0o→0, 1o→4, 3o→15, 4o→27, 5o→48, 9o→400.
        assert_eq!(ap_from_kp(0.0), 0.0);
        assert_eq!(ap_from_kp(1.0), 4.0);
        assert_eq!(ap_from_kp(3.0), 15.0);
        assert_eq!(ap_from_kp(4.0), 27.0);
        assert_eq!(ap_from_kp(5.0), 48.0);
        assert_eq!(ap_from_kp(9.0), 400.0);
        // Thirds: 2+ (8/3) → 12, 5- (14/3) → 39.
        assert_eq!(ap_from_kp(8.0 / 3.0), 12.0);
        assert_eq!(ap_from_kp(14.0 / 3.0), 39.0);
    }

    #[test]
    fn kp_ap_round_trips_and_clamps() {
        for (i, &ap) in AP_TABLE.iter().enumerate() {
            let kp = i as f64 / 3.0;
            assert_eq!(ap_from_kp(kp), ap);
            assert!((kp_from_ap(ap) - kp).abs() < 1e-9, "ap {ap} -> kp");
        }
        // Out-of-range Kp clamps into the table rather than panicking.
        assert_eq!(ap_from_kp(-1.0), 0.0);
        assert_eq!(ap_from_kp(20.0), 400.0);
    }

    #[test]
    fn ap_is_monotonic_in_kp() {
        let mut prev = -1.0;
        for i in 0..=27 {
            let ap = ap_from_kp(i as f64 / 3.0);
            assert!(ap > prev, "ap not strictly increasing at step {i}");
            prev = ap;
        }
    }

    #[test]
    fn daily_ap_is_the_mean_of_eight() {
        assert_eq!(daily_ap(&[4.0; 8]), 4.0);
        assert_eq!(
            daily_ap(&[0.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 9.0]),
            36.0 / 8.0
        );
    }

    #[test]
    fn f107a_is_a_centred_average() {
        let flat = vec![120.0; 200];
        assert!((f107a_centered(&flat, 100) - 120.0).abs() < 1e-9);
        // A step series: the centred mean at the step sits between the two levels.
        let mut s = vec![70.0; 100];
        s.extend(vec![230.0; 100]);
        let m = f107a_centered(&s, 100);
        assert!(
            (70.0..230.0).contains(&m),
            "centred mean {m} not between levels"
        );
    }

    #[test]
    fn exospheric_temperature_matches_published_solar_anchors() {
        // Jacchia-71 nighttime global minimum, quiet (Kp=0):
        //   solar min  F10.7=70  -> 379 + 3.24*70  = 605.8 K
        //   solar mean F10.7=150 -> 379 + 3.24*150 = 865.0 K
        //   solar max  F10.7=230 -> 379 + 3.24*230 = 1124.2 K
        let tmin = exospheric_temperature(70.0, 70.0, 0.0);
        let tmean = exospheric_temperature(150.0, 150.0, 0.0);
        let tmax = exospheric_temperature(230.0, 230.0, 0.0);
        assert!((tmin - 605.8).abs() < 1.0, "solar-min T_inf {tmin}");
        assert!((tmean - 865.0).abs() < 1.0, "solar-mean T_inf {tmean}");
        assert!((tmax - 1124.2).abs() < 1.0, "solar-max T_inf {tmax}");
        assert!(tmin < tmean && tmean < tmax, "T_inf must rise with F10.7");
    }

    #[test]
    fn geomagnetic_storm_raises_exospheric_temperature() {
        let quiet = exospheric_temperature(150.0, 150.0, 0.0);
        let storm = exospheric_temperature(150.0, 150.0, 6.0);
        let dt = storm - quiet;
        // ΔT = 28*6 + 0.03*e^6 = 168 + 12.1 ≈ 180 K.
        assert!((dt - 180.1).abs() < 1.0, "storm increment {dt}");
        assert!(storm > quiet);
    }

    #[test]
    fn density_factor_is_unity_at_reference_and_below_the_thermosphere() {
        // At the reference exospheric temperature the factor is exactly 1.
        assert!(
            (density_activity_factor(400_000.0, REFERENCE_EXOSPHERIC_TEMP_K) - 1.0).abs() < 1e-12
        );
        // Below the thermosphere base, activity does not move density.
        assert_eq!(density_activity_factor(100_000.0, 1500.0), 1.0);
        assert_eq!(density_activity_factor(100_000.0, 600.0), 1.0);
    }

    #[test]
    fn density_factor_increases_with_activity_at_altitude() {
        let cold = density_activity_factor(400_000.0, 606.0); // solar min
        let hot = density_activity_factor(400_000.0, 1124.0); // solar max
        assert!(
            cold < 1.0,
            "solar-min density should fall below USSA76: {cold}"
        );
        assert!(
            hot > 1.0,
            "solar-max density should rise above USSA76: {hot}"
        );
        assert!(hot > cold);
    }

    #[test]
    fn solar_cycle_density_swing_at_400km_is_in_the_observed_band() {
        // The headline calibration: 400 km density at solar max vs solar min must
        // land in the empirically observed ~5–10× range.
        let swing =
            density_activity_factor(400_000.0, 1124.0) / density_activity_factor(400_000.0, 606.0);
        assert!(
            (5.0..=10.0).contains(&swing),
            "400 km solar-cycle swing {swing}x"
        );
    }

    #[test]
    fn space_weather_density_brackets_the_static_model() {
        // The activity correction multiplies the static USSA76 density and stays
        // physically bounded (never zero/negative, never absurdly large).
        let alt = 500_000.0;
        let stat = crate::forces::atmospheric_density(alt);
        let active = SpaceWeather {
            f107: 230.0,
            f107a: 230.0,
            kp: 4.0,
        }
        .density(alt);
        let quiet = SpaceWeather {
            f107: 70.0,
            f107a: 70.0,
            kp: 0.0,
        }
        .density(alt);
        assert!(
            active > stat && stat > quiet,
            "active {active} stat {stat} quiet {quiet}"
        );
        assert!(active.is_finite() && quiet > 0.0);
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = SpaceWeatherScenario {
            f107: 200.0,
            f107a: Some(180.0),
            kp: 5.0,
            altitudes_km: vec![300.0, 400.0, 600.0],
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2, "scenario must be reproducible");
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "space-weather");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(
            !j1.contains("VALIDATED"),
            "a MODELLED model must not claim VALIDATED"
        );
        // ap is the table value for Kp=5 (48), T_inf is finite and warm.
        assert_eq!(v["ap"], 48.0);
        assert!(v["exospheric_temperature_k"].as_f64().unwrap() > 800.0);
        assert_eq!(v["altitudes"].as_array().unwrap().len(), 3);
    }

    #[test]
    fn scenario_rejects_out_of_range_inputs() {
        let bad_kp = SpaceWeatherScenario {
            f107: 150.0,
            f107a: None,
            kp: 12.0,
            altitudes_km: vec![400.0],
        };
        assert!(bad_kp.run_json().is_err());
        let bad_alt = SpaceWeatherScenario {
            f107: 150.0,
            f107a: None,
            kp: 3.0,
            altitudes_km: vec![-10.0],
        };
        assert!(bad_alt.run_json().is_err());
        let bad_flux = SpaceWeatherScenario {
            f107: 0.0,
            f107a: None,
            kp: 3.0,
            altitudes_km: vec![400.0],
        };
        assert!(bad_flux.run_json().is_err());
    }
}
