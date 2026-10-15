// SPDX-License-Identifier: AGPL-3.0-only
//! The `time-transfer-budget` scenario kind: a TWSTFT link's two-way equation and uncertainty
//! budget ([`crate::twstft_budget`]), its simulated stability with flicker phase noise and a
//! diurnal non-reciprocity, and, from files the user supplies, the stability of real time
//! offsets. Those offsets can come from BIPM Circular T Section 1 issues (one laboratory's
//! `UTC − UTC(k)`), a two-column `MJD,ns` CSV of the same, or the station-clock (`AR`)
//! records of an IGS RINEX clock file.
//!
//! MODELLED. The equation is solved from the stated delays. The budget combines stated
//! uncertainties with the simulated link's time deviation at the averaging time. The stability
//! of a supplied series is computed from that series. Kshana reports it and does not validate
//! the series.

use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::portable_math::PortableFloat;
use crate::twstft_budget::{
    combined_uncertainty, counter_readings, series_stability, solve_offset, tdev_curve,
    two_way_series, BudgetLine, LinkNoise, Relay, SeriesStability, Station,
};
use serde::Deserialize;

/// One station as the scenario states it.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct StationSpec {
    /// Label.
    pub name: String,
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// East longitude (deg).
    pub lon_deg: f64,
    /// Height (m).
    #[serde(default)]
    pub height_m: f64,
    /// Transmit equipment delay (ns).
    pub tx_delay_ns: f64,
    /// Receive equipment delay (ns).
    pub rx_delay_ns: f64,
    /// Slant TEC to the satellite (TECU).
    #[serde(default)]
    pub slant_tec_tecu: f64,
}

/// Stated standard uncertainties of the budget's type B terms (ns).
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct UncertaintySpec {
    /// Calibration of the station-delay difference (a travelling-station calibration).
    pub station_calibration_ns: f64,
    /// Transponder delay difference.
    pub transponder_ns: f64,
    /// Ionospheric term (from the TEC uncertainty).
    pub ionosphere_ns: f64,
    /// Sagnac term (from the position uncertainties).
    #[serde(default)]
    pub sagnac_ns: f64,
    /// Instability of the ground equipment delays between calibrations.
    #[serde(default)]
    pub equipment_instability_ns: f64,
}

/// A real offset series to analyse.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SeriesSpec {
    /// `"circular-t"` (one or more Section 1 texts), `"mjd-csv"` (rows `MJD,ns`) or
    /// `"rinex-clock"` (the `AR` records of one station).
    pub format: String,
    /// Files to read, in time order for Circular T issues.
    pub paths: Vec<String>,
    /// Laboratory acronym (Circular T) or station name (RINEX clock).
    #[serde(default)]
    pub code: String,
}

fn d_f_up() -> f64 {
    14.0
}
fn d_f_down() -> f64 {
    11.0
}
fn d_avg() -> f64 {
    86_400.0
}
fn d_step() -> f64 {
    300.0
}
fn d_days() -> f64 {
    30.0
}

/// A `time-transfer-budget` scenario.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TimeTransferBudgetScenario {
    /// Always `time-transfer-budget` when given.
    #[serde(default)]
    pub kind: Option<String>,
    /// Station A.
    pub station_a: StationSpec,
    /// Station B.
    pub station_b: StationSpec,
    /// Geostationary relay longitude (deg east).
    pub satellite_lon_deg: f64,
    /// Transponder delay A→B (ns).
    pub transponder_ab_ns: f64,
    /// Transponder delay B→A (ns).
    pub transponder_ba_ns: f64,
    /// Uplink (GHz).
    #[serde(default = "d_f_up")]
    pub uplink_ghz: f64,
    /// Downlink (GHz).
    #[serde(default = "d_f_down")]
    pub downlink_ghz: f64,
    /// The offset `T_A − T_B` the simulated link carries (ns).
    #[serde(default)]
    pub true_offset_ns: f64,
    /// White phase noise per measurement (ns).
    pub white_noise_ns: f64,
    /// Flicker phase-noise scale (ns).
    #[serde(default)]
    pub flicker_noise_ns: f64,
    /// Diurnal non-reciprocity amplitude (ns).
    #[serde(default)]
    pub diurnal_amplitude_ns: f64,
    /// Constant reciprocity residual (ns).
    #[serde(default)]
    pub reciprocity_bias_ns: f64,
    /// Measurement interval (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// Simulated span (days).
    #[serde(default = "d_days")]
    pub span_days: f64,
    /// Averaging time for the type A term (s).
    #[serde(default = "d_avg")]
    pub averaging_s: f64,
    /// Seed.
    #[serde(default)]
    pub seed: u64,
    /// Type B uncertainties.
    pub uncertainty: UncertaintySpec,
    /// Real series to analyse.
    #[serde(default)]
    pub series: Vec<SeriesSpec>,
}

/// Units of every emitted field.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "terms_ns.half_counter_difference", unit: "ns", provenance: Computed, definition: "half the difference of the two counter readings" },
        FieldUnit { path: "terms_ns.station_delays", unit: "ns", provenance: Computed, definition: "-1/2 of the (TX - RX) difference between the stations" },
        FieldUnit { path: "terms_ns.ionosphere", unit: "ns", provenance: ClosedForm, definition: "-1/2 of the up/down ionospheric asymmetry difference, 40.3 TEC (1/f_up^2 - 1/f_down^2)/c per station" },
        FieldUnit { path: "terms_ns.transponder", unit: "ns", provenance: Computed, definition: "-1/2 of the transponder delay difference" },
        FieldUnit { path: "terms_ns.sagnac", unit: "ns", provenance: ClosedForm, definition: "-1/2 of the Sagnac difference of the two paths" },
        FieldUnit { path: "terms_ns.offset", unit: "ns", provenance: Computed, definition: "T_A - T_B solved from the two-way equation" },
        FieldUnit { path: "inputs.true_offset_ns", unit: "ns", provenance: Input, definition: "the offset the forward model carries" },
        FieldUnit { path: "inputs.white_noise_ns", unit: "ns", provenance: ModelledInput, definition: "white phase noise per measurement" },
        FieldUnit { path: "inputs.flicker_noise_ns", unit: "ns", provenance: ModelledInput, definition: "flicker phase-noise scale" },
        FieldUnit { path: "inputs.diurnal_amplitude_ns", unit: "ns", provenance: ModelledInput, definition: "diurnal non-reciprocity amplitude" },
        FieldUnit { path: "inputs.reciprocity_bias_ns", unit: "ns", provenance: ModelledInput, definition: "constant reciprocity residual" },
        FieldUnit { path: "inputs.step_s", unit: "s", provenance: Input, definition: "measurement interval" },
        FieldUnit { path: "inputs.span_days", unit: "d", provenance: Input, definition: "simulated span" },
        FieldUnit { path: "inputs.averaging_s", unit: "s", provenance: Input, definition: "averaging time of the type A term" },
        FieldUnit { path: "budget[].u_ns", unit: "ns", provenance: Computed, definition: "standard uncertainty of the budget line" },
        FieldUnit { path: "combined_uncertainty_ns", unit: "ns", provenance: Computed, definition: "quadrature sum of the budget lines" },
        FieldUnit { path: "simulated.mean_offset_ns", unit: "ns", provenance: Computed, definition: "mean of the simulated two-way series" },
        FieldUnit { path: "simulated.tdev[].tau_s", unit: "s", provenance: Computed, definition: "averaging time" },
        FieldUnit { path: "simulated.tdev[].tdev_ns", unit: "ns", provenance: Computed, definition: "time deviation of the simulated series" },
        FieldUnit { path: "series[].n", unit: "count", provenance: Computed, definition: "samples in the supplied series" },
        FieldUnit { path: "series[].step_s", unit: "s", provenance: Computed, definition: "sample interval of the supplied series" },
        FieldUnit { path: "series[].rate_ns_per_day", unit: "ns/d", provenance: Computed, definition: "least-squares rate of the supplied offsets" },
        FieldUnit { path: "series[].residual_rms_ns", unit: "ns", provenance: Computed, definition: "RMS after removing mean and rate" },
        FieldUnit { path: "series[].tdev[].tau_s", unit: "s", provenance: Computed, definition: "averaging time" },
        FieldUnit { path: "series[].tdev[].tdev_ns", unit: "ns", provenance: Computed, definition: "time deviation of the residual" },
        FieldUnit { path: "series[].adev[].tau_s", unit: "s", provenance: Computed, definition: "averaging time" },
        FieldUnit { path: "series[].adev[].adev", unit: "1", provenance: Computed, definition: "overlapping Allan deviation of the residual" },
    ]
};

fn station(s: &StationSpec, up: f64, down: f64) -> Result<Station, String> {
    let ok = |v: f64, n: &str| {
        if v.is_finite() {
            Ok(())
        } else {
            Err(format!("{}: {n} must be finite", s.name))
        }
    };
    ok(s.lat_deg, "lat_deg")?;
    ok(s.lon_deg, "lon_deg")?;
    ok(s.height_m, "height_m")?;
    ok(s.tx_delay_ns, "tx_delay_ns")?;
    ok(s.rx_delay_ns, "rx_delay_ns")?;
    if !(s.slant_tec_tecu.is_finite() && s.slant_tec_tecu >= 0.0) {
        return Err(format!(
            "{}: slant_tec_tecu must be finite and non-negative",
            s.name
        ));
    }
    let r = geodetic_to_ecef(Geodetic {
        lat_rad: s.lat_deg.to_radians(),
        lon_rad: s.lon_deg.to_radians(),
        alt_m: s.height_m,
    });
    Ok(Station {
        r_m: r,
        tx_delay_s: s.tx_delay_ns * 1e-9,
        rx_delay_s: s.rx_delay_ns * 1e-9,
        uplink_hz: up,
        downlink_hz: down,
        slant_tec_tecu: s.slant_tec_tecu,
        tropo_s: 0.0,
    })
}

/// Read one real series as `(t_s, offset_s)`.
pub fn read_series(spec: &SeriesSpec) -> Result<Vec<(f64, f64)>, String> {
    let read = |p: &str| std::fs::read_to_string(p).map_err(|e| format!("{p}: {e}"));
    let mut out: Vec<(f64, f64)> = Vec::new();
    match spec.format.as_str() {
        "circular-t" => {
            for p in &spec.paths {
                let sec = crate::realdata::clk::parse_circular_t_section1(&read(p)?)?;
                for (mjd, ns) in sec.series(&spec.code) {
                    let t = mjd as f64 * 86_400.0;
                    if !out.iter().any(|q| q.0 == t) {
                        out.push((t, ns * 1e-9));
                    }
                }
            }
        }
        "mjd-csv" => {
            for p in &spec.paths {
                for (i, line) in read(p)?.lines().enumerate() {
                    let f: Vec<&str> = line.split(',').map(str::trim).collect();
                    if f.len() < 2 {
                        continue;
                    }
                    let (Ok(m), Ok(v)) = (f[0].parse::<f64>(), f[1].parse::<f64>()) else {
                        if i == 0 {
                            continue; // header
                        }
                        return Err(format!("{p}: line {}: not MJD,ns", i + 1));
                    };
                    out.push((m * 86_400.0, v * 1e-9));
                }
            }
        }
        "rinex-clock" => {
            for p in &spec.paths {
                let clk = crate::precise_products::parse_clock_rinex_records(&read(p)?, "AR")?;
                let s = clk
                    .sats
                    .get(&spec.code)
                    .ok_or_else(|| format!("{p}: no AR records for {}", spec.code))?;
                out.extend(s.iter().copied());
            }
        }
        f => {
            return Err(format!(
                "unknown series format {f:?} (circular-t, mjd-csv, rinex-clock)"
            ))
        }
    }
    out.sort_by(|a, b| a.0.total_cmp(&b.0));
    Ok(out)
}

fn stability_json(spec: &SeriesSpec, st: &SeriesStability) -> serde_json::Value {
    serde_json::json!({
        "format": spec.format,
        "code": spec.code,
        "n": st.n,
        "step_s": st.step_s,
        "rate_ns_per_day": st.rate * 86_400.0 * 1e9,
        "residual_rms_ns": st.residual_rms_s * 1e9,
        "tdev": st.tdev.iter().map(|(t, d)| serde_json::json!({"tau_s": t, "tdev_ns": d * 1e9})).collect::<Vec<_>>(),
        "adev": st.adev.iter().map(|(t, a)| serde_json::json!({"tau_s": t, "adev": a})).collect::<Vec<_>>(),
    })
}

impl TimeTransferBudgetScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let pos = |v: f64, n: &str| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("{n} must be finite and positive"))
            }
        };
        let nonneg = |v: f64, n: &str| {
            if v.is_finite() && v >= 0.0 {
                Ok(())
            } else {
                Err(format!("{n} must be finite and non-negative"))
            }
        };
        pos(self.uplink_ghz, "uplink_ghz")?;
        pos(self.downlink_ghz, "downlink_ghz")?;
        pos(self.step_s, "step_s")?;
        pos(self.span_days, "span_days")?;
        pos(self.averaging_s, "averaging_s")?;
        nonneg(self.white_noise_ns, "white_noise_ns")?;
        nonneg(self.flicker_noise_ns, "flicker_noise_ns")?;
        nonneg(self.diurnal_amplitude_ns, "diurnal_amplitude_ns")?;
        for (v, n) in [
            (
                self.uncertainty.station_calibration_ns,
                "uncertainty.station_calibration_ns",
            ),
            (
                self.uncertainty.transponder_ns,
                "uncertainty.transponder_ns",
            ),
            (self.uncertainty.ionosphere_ns, "uncertainty.ionosphere_ns"),
            (self.uncertainty.sagnac_ns, "uncertainty.sagnac_ns"),
            (
                self.uncertainty.equipment_instability_ns,
                "uncertainty.equipment_instability_ns",
            ),
        ] {
            nonneg(v, n)?;
        }
        for (v, n) in [
            (self.satellite_lon_deg, "satellite_lon_deg"),
            (self.transponder_ab_ns, "transponder_ab_ns"),
            (self.transponder_ba_ns, "transponder_ba_ns"),
            (self.true_offset_ns, "true_offset_ns"),
            (self.reciprocity_bias_ns, "reciprocity_bias_ns"),
        ] {
            if !v.is_finite() {
                return Err(format!("{n} must be finite"));
            }
        }
        let n = (self.span_days * 86_400.0 / self.step_s).round() as usize;
        if !(16..=20_000).contains(&n) {
            return Err("span_days / step_s must give 16 to 20000 measurements".into());
        }
        let (up, down) = (self.uplink_ghz * 1e9, self.downlink_ghz * 1e9);
        let a = station(&self.station_a, up, down)?;
        let b = station(&self.station_b, up, down)?;
        let lon = self.satellite_lon_deg.to_radians();
        let r_geo = 42_164_172.0;
        let sat = Relay {
            r_m: [r_geo * lon.pcos(), r_geo * lon.psin(), 0.0],
            delay_ab_s: self.transponder_ab_ns * 1e-9,
            delay_ba_s: self.transponder_ba_ns * 1e-9,
        };
        let (ti_a, ti_b) = counter_readings(&a, &b, &sat, self.true_offset_ns * 1e-9);
        let terms = solve_offset(&a, &b, &sat, ti_a, ti_b);

        let noise = LinkNoise {
            white_s: self.white_noise_ns * 1e-9,
            flicker_s: self.flicker_noise_ns * 1e-9,
            diurnal_amp_s: self.diurnal_amplitude_ns * 1e-9,
            reciprocity_bias_s: self.reciprocity_bias_ns * 1e-9,
        };
        let x = two_way_series(terms.offset(), &noise, self.step_s, n, self.seed);
        let mean = x.iter().sum::<f64>() / x.len() as f64;
        let td = tdev_curve(&x, self.step_s);
        let type_a = td
            .iter()
            .min_by(|p, q| {
                (p.0 - self.averaging_s)
                    .abs()
                    .total_cmp(&(q.0 - self.averaging_s).abs())
            })
            .map(|p| p.1)
            .unwrap_or(f64::NAN);
        let u = &self.uncertainty;
        let budget = vec![
            BudgetLine {
                name: "link statistics (TDEV at the averaging time)".into(),
                u_s: type_a,
                kind: "A",
            },
            BudgetLine {
                name: "station-delay calibration".into(),
                u_s: u.station_calibration_ns * 1e-9,
                kind: "B",
            },
            BudgetLine {
                name: "ground-equipment instability".into(),
                u_s: u.equipment_instability_ns * 1e-9,
                kind: "B",
            },
            BudgetLine {
                name: "transponder delay difference".into(),
                u_s: u.transponder_ns * 1e-9,
                kind: "B",
            },
            BudgetLine {
                name: "ionosphere".into(),
                u_s: u.ionosphere_ns * 1e-9,
                kind: "B",
            },
            BudgetLine {
                name: "Sagnac (positions)".into(),
                u_s: u.sagnac_ns * 1e-9,
                kind: "B",
            },
            BudgetLine {
                name: "reciprocity residual (stated bias)".into(),
                u_s: self.reciprocity_bias_ns.abs() * 1e-9,
                kind: "B",
            },
        ];
        let uc = combined_uncertainty(&budget);

        let mut series_json = Vec::new();
        for s in &self.series {
            let data = read_series(s)?;
            let st = series_stability(&data)?;
            series_json.push(stability_json(s, &st));
        }
        let ns = |v: f64| v * 1e9;
        let json = serde_json::json!({
            "kind": "time-transfer-budget",
            "label": "MODELLED — TWSTFT two-way equation (station delays, Ku-band ionosphere, transponder, Sagnac) solved from stated delays, a quadrature uncertainty budget with the simulated link's TDEV as the type A term, a simulated link with flicker phase noise and diurnal non-reciprocity, and the stability of any real UTC-UTC(k) or station-clock series supplied; not compared with a real TWSTFT link",
            "units": crate::field_schema::units_block(UNITS),
            "inputs": {
                "true_offset_ns": self.true_offset_ns,
                "white_noise_ns": self.white_noise_ns,
                "flicker_noise_ns": self.flicker_noise_ns,
                "diurnal_amplitude_ns": self.diurnal_amplitude_ns,
                "reciprocity_bias_ns": self.reciprocity_bias_ns,
                "step_s": self.step_s,
                "span_days": self.span_days,
                "averaging_s": self.averaging_s,
            },
            "terms_ns": {
                "half_counter_difference": ns(terms.half_counter_difference),
                "station_delays": ns(terms.station_delays),
                "ionosphere": ns(terms.ionosphere),
                "transponder": ns(terms.transponder),
                "sagnac": ns(terms.sagnac),
                "offset": ns(terms.offset()),
            },
            "budget": budget.iter().map(|l| serde_json::json!({"term": l.name, "type": l.kind, "u_ns": ns(l.u_s)})).collect::<Vec<_>>(),
            "combined_uncertainty_ns": ns(uc),
            "simulated": {
                "mean_offset_ns": ns(mean),
                "tdev": td.iter().map(|(t, d)| serde_json::json!({"tau_s": t, "tdev_ns": ns(*d)})).collect::<Vec<_>>(),
            },
            "series": series_json,
        });
        let summary = format!(
            "time-transfer-budget: {} - {} offset {:.3} ns (Sagnac {:.3} ns, ionosphere {:.4} ns); combined u {:.3} ns (type A {:.3} ns at {:.0} s); {} real series (MODELLED)",
            self.station_a.name,
            self.station_b.name,
            ns(terms.offset()),
            ns(terms.sagnac),
            ns(terms.ionosphere),
            ns(uc),
            ns(type_a),
            self.averaging_s,
            self.series.len()
        );
        let text = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((text, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const SRC: &str = r#"
kind = "time-transfer-budget"
satellite_lon_deg = -10.0
transponder_ab_ns = 812.0
transponder_ba_ns = 809.5
true_offset_ns = 12.5
white_noise_ns = 0.3
flicker_noise_ns = 0.05
diurnal_amplitude_ns = 0.2
step_s = 300.0
span_days = 10.0
seed = 1
[station_a]
name = "A"
lat_deg = 50.0
lon_deg = 10.0
tx_delay_ns = 412.3
rx_delay_ns = 398.7
slant_tec_tecu = 30.0
[station_b]
name = "B"
lat_deg = 39.0
lon_deg = -77.0
tx_delay_ns = 501.9
rx_delay_ns = 455.2
slant_tec_tecu = 20.0
[uncertainty]
station_calibration_ns = 1.0
transponder_ns = 0.3
ionosphere_ns = 0.02
"#;

    #[test]
    fn the_scenario_recovers_its_offset_and_combines_the_budget() {
        let scn: TimeTransferBudgetScenario = toml::from_str(SRC).unwrap();
        let (j, s) = scn.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&j).unwrap();
        assert!((v["terms_ns"]["offset"].as_f64().unwrap() - 12.5).abs() < 1e-6);
        let uc = v["combined_uncertainty_ns"].as_f64().unwrap();
        assert!((1.0..1.5).contains(&uc), "{uc}");
        assert!(s.contains("MODELLED"));
        let (j2, _) = scn.run_json().unwrap();
        assert_eq!(j, j2);
    }

    #[test]
    fn real_series_are_read_from_circular_t_and_csv() {
        static N: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
        let dir = std::env::temp_dir().join(format!(
            "kshana-ttb-{}-{}",
            std::process::id(),
            N.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
        ));
        std::fs::create_dir_all(&dir).unwrap();
        let csv = dir.join("utck.csv");
        let rows: String = (0..20)
            .map(|i| format!("{},{}\n", 60000 + 5 * i, 3.0 + 0.1 * i as f64))
            .collect();
        std::fs::write(&csv, format!("MJD,ns\n{rows}")).unwrap();
        let spec = SeriesSpec {
            format: "mjd-csv".into(),
            paths: vec![csv.display().to_string()],
            code: String::new(),
        };
        let s = read_series(&spec).unwrap();
        assert_eq!(s.len(), 20);
        let st = series_stability(&s).unwrap();
        // A pure ramp: 0.1 ns per 5 days, nothing left after the rate.
        assert!((st.rate * 86_400.0 * 1e9 - 0.02).abs() < 1e-9);
        assert!(st.residual_rms_s < 1e-15);
        let bad = SeriesSpec {
            format: "nope".into(),
            ..spec
        };
        assert!(read_series(&bad).is_err());
        std::fs::remove_dir_all(&dir).ok();
    }

    #[test]
    fn bad_inputs_are_refused() {
        let scn: TimeTransferBudgetScenario =
            toml::from_str(&SRC.replace("step_s = 300.0", "step_s = -1.0")).unwrap();
        assert!(scn.run_json().is_err());
    }
}
