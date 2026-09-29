// SPDX-License-Identifier: AGPL-3.0-only
//! The `leo-pnt-chain` scenario kind: one LEO-PNT (low Earth orbit positioning, navigation
//! and timing) system followed end to end, from its signal design to the user's position.
//!
//! Each stage is the engine's own kind, run on its own scenario table, and the chain hands
//! values from one stage to the next in code, so a change upstream moves every figure
//! downstream:
//!
//! 1. **Signal** (`leo-signal`): the design named by `signal_design`, from the public
//!    presets under `data/leo-signals/` or written inline in `[signal]`. Its power shares,
//!    in-band fraction and tracked-component chip rate go to the pass.
//! 2. **Pass** (`leo-pass`): every band whose `signal` names the design takes the design's
//!    centre frequency, transmit bandwidth and chip rate, splits its EIRP across the
//!    design's components, and reports the tracked component's C/N0 (carrier-to-noise
//!    density) and its band-limited code-tracking jitter at every epoch. A straight line
//!    in the sine of the elevation is fitted to the tracked C/N0 of the chain satellite's
//!    visible epochs and evaluated at the positioning stage's elevation mask and at the
//!    zenith.
//! 3. **Navigation message** (`leo-navmsg`): the message configuration in `[navmsg]` is
//!    fitted to a truth orbit at the chain satellite's altitude and inclination (unless
//!    `[navmsg.orbit]` states them), and its broadcast signal-in-space range error (SISRE,
//!    orbit and clock, root mean square) is computed.
//! 4. **Positioning** (`leo-pvt`, `[fusion]`): every LEO system that leaves them unset
//!    takes the C/N0 at the mask and at the zenith from the pass, the SISRE from the
//!    message, and the carrier and chip rate from the design; the fused MEO + LEO fix is
//!    compared with GNSS alone. The delay-lock loop defaults to the pass's settings.
//! 5. **Precise point positioning** (`leo-ppp`, `[ppp]`, optional): every LEO system of
//!    every case that leaves `sisre_m` unset takes the message's SISRE as its
//!    orbit-and-clock error.
//!
//! Every hand-off is listed in the report with its value, unit and the two stages it joins.
//!
//! ## Label
//!
//! **MODELLED.** The chain adds no physics of its own; the stages keep their labels in the
//! verification matrix (several of their building blocks are VALIDATED). The C/N0 line in
//! the sine of the elevation is a fit to the pass, not the full elevation profile, and the
//! SISRE is the message's representation error only, with no orbit determination or
//! prediction error.

use crate::leo_fusion::ppp::PppScenario;
use crate::leo_fusion::pvt_kind::{LeoPvtReport, LeoPvtScenario};
use crate::leo_fusion::system::DllCfg;
use crate::leo_navmsg::LeoNavmsgScenario;
use crate::leo_pass::{LeoPassReport, LeoPassScenario};
use crate::leo_signal::{LeoSignalScenario, SignalDesign};
use serde::Deserialize;
use serde_json::{json, Value};

/// The run's verification label.
pub const LABEL: &str = "MODELLED — the chain hands each stage's output to the next; the stages keep their own labels (leo-signal, leo-pass, leo-navmsg, leo-pvt and leo-ppp rows of the verification matrix).";

/// Plain statements of what the chain does not do.
pub const LIMITATIONS: [&str; 5] = [
    "The positioning stage models C/N0 as a straight line in the sine of the elevation between the mask and the zenith; the chain fits that line to the pass's tracked C/N0, so a pass-specific shape (an isoflux plateau, a beam edge) is reduced to two numbers.",
    "The SISRE handed to the positioning stages is the navigation message's representation error against a Kshana-integrated truth orbit, plus the scenario's stated od_sisre_m in root-sum-square; the message stage itself models no orbit determination or prediction.",
    "The positioning stage computes its own delay-lock-loop jitter from the handed-on C/N0 with an unlimited-bandwidth formula; the pass reports the band-limited jitter of the actual design beside it.",
    "The precise point positioning stage takes the message's SISRE as the LEO orbit-and-clock error; its code and phase noise stay the stage's own inputs.",
    "One satellite, the first whose band carries the design, stands for the whole LEO system in the pass and message stages.",
];

/// The `leo-pnt-chain` scenario.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LeoPntChainScenario {
    /// Always `leo-pnt-chain`.
    #[serde(default)]
    pub kind: Option<String>,
    /// Optional name.
    #[serde(default)]
    pub name: Option<String>,
    /// Optional description.
    #[serde(default)]
    pub description: Option<String>,
    /// Seed handed to the stages that leave theirs unset. Default 1.
    #[serde(default)]
    pub seed: Option<u64>,
    /// The signal design carried end to end, by name.
    pub signal_design: String,
    /// A `leo-signal` scenario table (without `kind`). Default: the public presets.
    #[serde(default)]
    pub signal: Option<toml::Value>,
    /// A `leo-pass` scenario table; at least one band must name `signal_design`.
    pub pass: toml::Value,
    /// A `leo-navmsg` scenario table (message configuration). Default: the kind's defaults.
    #[serde(default)]
    pub navmsg: Option<toml::Value>,
    /// Orbit-determination and clock-prediction error (m, one sigma, as a range error)
    /// added in root-sum-square to the message's representation error before it is handed
    /// on. The message stage models no orbit determination, so without this term the
    /// handed-on SISRE is the representation error alone. Default 0.
    #[serde(default)]
    pub od_sisre_m: Option<f64>,
    /// A `leo-pvt` scenario table in `joint` mode.
    pub fusion: toml::Value,
    /// An optional `leo-ppp` scenario table.
    #[serde(default)]
    pub ppp: Option<toml::Value>,
}

/// One value handed from one stage to the next.
#[derive(Clone, Debug, serde::Serialize)]
pub struct Handoff {
    /// Stage the value comes from.
    pub from: String,
    /// Stage it goes to.
    pub to: String,
    /// What it is.
    pub quantity: String,
    /// Where it lands in the downstream stage.
    pub target: String,
    /// Value.
    pub value: f64,
    /// Unit.
    pub unit: String,
}

fn table<T: serde::de::DeserializeOwned>(v: &toml::Value, what: &str) -> Result<T, String> {
    v.clone()
        .try_into()
        .map_err(|e| format!("invalid [{what}] table: {e}"))
}

/// Least-squares line `cn0 = a + b sin(el)` through `(el_deg, cn0)` samples.
fn fit_sin_line(pts: &[(f64, f64)]) -> Option<(f64, f64)> {
    if pts.len() < 2 {
        return None;
    }
    let n = pts.len() as f64;
    let (mut sx, mut sy, mut sxx, mut sxy) = (0.0, 0.0, 0.0, 0.0);
    for &(el, c) in pts {
        let x = el.to_radians().sin();
        sx += x;
        sy += c;
        sxx += x * x;
        sxy += x * c;
    }
    let den = n * sxx - sx * sx;
    if den.abs() < 1e-12 {
        return None;
    }
    let b = (n * sxy - sx * sy) / den;
    let a = (sy - b * sx) / n;
    Some((a, b))
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.total_cmp(b));
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// What the chain reads from the pass: the chain satellite and band.
struct PassPick {
    sat: usize,
    band: usize,
}

fn pick(r: &LeoPassReport, design: &str) -> Option<PassPick> {
    r.satellites.iter().enumerate().find_map(|(si, s)| {
        s.bands
            .iter()
            .position(|b| b.signal_design.as_ref().is_some_and(|d| d.name == design))
            .map(|bi| PassPick { sat: si, band: bi })
    })
}

impl LeoPntChainScenario {
    fn designs(&self) -> Result<(LeoSignalScenario, Vec<SignalDesign>, SignalDesign), String> {
        let sig: LeoSignalScenario = match &self.signal {
            Some(v) => table(v, "signal")?,
            None => toml::from_str("").map_err(|e| e.to_string())?,
        };
        let mut designs = sig.resolve_signals()?.0;
        let chosen = designs
            .iter()
            .find(|d| d.name == self.signal_design)
            .cloned()
            .or_else(|| crate::leo_signal::public_signal(&self.signal_design))
            .ok_or_else(|| {
                format!(
                    "signal_design '{}' is neither in [signal] nor a public design ({})",
                    self.signal_design,
                    crate::leo_signal::public_signal_names().join(", ")
                )
            })?;
        if !designs.iter().any(|d| d.name == chosen.name) {
            designs.push(chosen.clone());
        }
        if chosen.tracked_index().is_none() {
            return Err(format!(
                "signal_design '{}' has no code-tracked component, so it gives no pseudorange",
                chosen.name
            ));
        }
        Ok((sig, designs, chosen))
    }

    /// Run the chain: the result document, the text summary and the SVG chart.
    pub fn compute(&self) -> Result<(Value, String, String), String> {
        if let Some(k) = &self.kind {
            if k != "leo-pnt-chain" {
                return Err(format!("kind must be leo-pnt-chain; got {k}"));
            }
        }
        let seed = self.seed.unwrap_or(1);
        let mut handoffs: Vec<Handoff> = Vec::new();
        let mut hand = |from: &str, to: &str, q: &str, target: &str, value: f64, unit: &str| {
            handoffs.push(Handoff {
                from: from.into(),
                to: to.into(),
                quantity: q.into(),
                target: target.into(),
                value,
                unit: unit.into(),
            });
        };

        // 1. Signal.
        let (_sig, designs, design) = self.designs()?;
        let ti = design.tracked_index().expect("checked in designs()");
        let eta = design.in_band_fraction();
        let chip = design.components[ti]
            .shape
            .chip_rate_hz()
            .ok_or("the tracked component has no chip rate")?;
        let offset = design.component_cn0_offset_db(ti, eta);
        hand(
            "leo-signal",
            "leo-pass",
            "tracked-component share of the transmitted power",
            "band EIRP split",
            design.components[ti].share,
            "1",
        );
        hand(
            "leo-signal",
            "leo-pass",
            "fraction of the power inside the transmit bandwidth",
            "tracked C/N0 offset",
            eta,
            "1",
        );
        hand(
            "leo-signal",
            "leo-pass",
            "tracked-component chip rate",
            "band chip rate and code jitter",
            chip,
            "chip/s",
        );

        // 2. Pass.
        let mut pass: LeoPassScenario = table(&self.pass, "pass")?;
        pass.signal_designs = designs.clone();
        let pr = pass.compute()?;
        let pk = pick(&pr, &design.name).ok_or_else(|| {
            format!(
                "no band of [pass] names signal = \"{}\"; the chain needs one to carry the design",
                design.name
            )
        })?;
        let sat = &pr.satellites[pk.sat];
        let band = &sat.bands[pk.band];
        let vis: Vec<&crate::leo_pass::SatEpoch> =
            sat.series.iter().filter(|e| e.visible).collect();
        let pts: Vec<(f64, f64)> = vis
            .iter()
            .filter_map(|e| {
                e.bands[pk.band]
                    .tracked_cn0_dbhz
                    .map(|c| (e.elevation_deg, c))
            })
            .collect();
        let (a, b) = fit_sin_line(&pts).ok_or(
            "the chain satellite is visible for fewer than two epochs, or at one elevation only; \
             widen the pass window",
        )?;
        let jit: Vec<f64> = vis
            .iter()
            .filter_map(|e| e.bands[pk.band].code_jitter_m)
            .collect();
        let jitter_median = median(jit.clone()).ok_or("the pass gives no code jitter")?;

        // 3. Navigation message.
        let mut nav: LeoNavmsgScenario = match &self.navmsg {
            Some(v) => table(v, "navmsg")?,
            None => LeoNavmsgScenario::default(),
        };
        let mut orbit = nav.orbit.clone().unwrap_or_default();
        if orbit.altitude_km.is_none() {
            orbit.altitude_km = Some(sat.altitude_m / 1e3);
            hand(
                "leo-pass",
                "leo-navmsg",
                "chain satellite altitude",
                "truth orbit altitude",
                sat.altitude_m / 1e3,
                "km",
            );
        }
        if orbit.inclination_deg.is_none() {
            orbit.inclination_deg = Some(sat.inclination_deg);
            hand(
                "leo-pass",
                "leo-navmsg",
                "chain satellite inclination",
                "truth orbit inclination",
                sat.inclination_deg,
                "deg",
            );
        }
        nav.orbit = Some(orbit);
        if nav.seed.is_none() {
            nav.seed = Some(seed);
        }
        let (stats, res) = nav.broadcast_sisre()?;
        let od = self.od_sisre_m.unwrap_or(0.0);
        if !(od.is_finite() && (0.0..=100.0).contains(&od)) {
            return Err(format!("od_sisre_m must be in [0, 100] m; got {od}"));
        }
        let sisre = (stats.sisre_rms_m.powi(2) + od * od).sqrt();

        // 4. Fused positioning.
        let mut fusion: LeoPvtScenario = table(&self.fusion, "fusion")?;
        let mode = fusion.mode.clone().unwrap_or_else(|| "joint".into());
        if mode != "joint" {
            return Err(format!("[fusion] must run mode = \"joint\"; got {mode}"));
        }
        if fusion.seed.is_none() {
            fusion.seed = Some(seed);
        }
        if fusion.dll.is_none() {
            fusion.dll = Some(DllCfg {
                loop_bw_hz: 1.0,
                spacing_chips: 0.5,
                t_coh_s: 0.02,
            });
        }
        let mut n_leo_systems = 0usize;
        let mut cn0_ends = [0.0f64; 2];
        let mut first_leo = true;
        for s in fusion.system.iter_mut() {
            if s.build()?.role != "leo" {
                continue;
            }
            n_leo_systems += 1;
            let mask = s.mask_deg.unwrap_or(10.0);
            let lo = a + b * mask.to_radians().sin();
            let hi = a + b;
            let sys_name = s.name.clone();
            let tag = |f: &str| format!("system '{sys_name}' {f}");
            if s.cn0_dbhz.is_none() {
                s.cn0_dbhz = Some([lo, hi]);
                if first_leo {
                    cn0_ends = [lo, hi];
                }
                hand(
                    "leo-pass",
                    "leo-pvt",
                    &format!("tracked C/N0 at the {mask:.0} deg mask (line fit in sin elevation)"),
                    &tag("cn0_dbhz[0]"),
                    lo,
                    "dB-Hz",
                );
                hand(
                    "leo-pass",
                    "leo-pvt",
                    "tracked C/N0 at the zenith (line fit in sin elevation)",
                    &tag("cn0_dbhz[1]"),
                    hi,
                    "dB-Hz",
                );
            }
            if s.sisre_m.is_none() && s.sigma_pr_m.is_none() {
                s.sisre_m = Some(sisre);
                hand("leo-navmsg", "leo-pvt", "SISRE: message representation error (RMS) with orbit determination in root-sum-square", &tag("sisre_m"), sisre, "m");
            }
            if s.carrier_hz.is_none() {
                s.carrier_hz = Some(design.centre_hz);
                hand(
                    "leo-signal",
                    "leo-pvt",
                    "carrier frequency",
                    &tag("carrier_hz"),
                    design.centre_hz,
                    "Hz",
                );
            }
            if s.chip_rate_hz.is_none() {
                s.chip_rate_hz = Some(chip);
                hand(
                    "leo-signal",
                    "leo-pvt",
                    "tracked-component chip rate",
                    &tag("chip_rate_hz"),
                    chip,
                    "chip/s",
                );
            }
            first_leo = false;
        }
        if n_leo_systems == 0 {
            return Err("[fusion] has no LEO system to receive the chain's values".into());
        }
        let fr: LeoPvtReport = fusion.compute()?;
        let joint = fr
            .joint
            .as_ref()
            .ok_or("[fusion] produced no joint block")?;

        // 5. PPP (optional).
        let ppp_out = match &self.ppp {
            None => None,
            Some(v) => {
                let mut ppp: PppScenario = table(v, "ppp")?;
                if ppp.seed.is_none() {
                    ppp.seed = Some(seed);
                }
                let mut handed = false;
                for c in ppp.case.iter_mut() {
                    for s in c.system.iter_mut() {
                        if s.sisre_m.is_none() {
                            s.sisre_m = Some(sisre);
                            handed = true;
                        }
                    }
                }
                if handed {
                    hand("leo-navmsg", "leo-ppp", "SISRE: message representation error (RMS) with orbit determination in root-sum-square", "every LEO case system's sisre_m", sisre, "m");
                }
                Some(ppp.compute()?)
            }
        };

        // Report.
        let fom = |f: &crate::leo_fusion::pvt_kind::FixFom| {
            json!({
                "availability": f.availability,
                "median_pdop": f.median_pdop,
                "rms_error_3d_m": f.rms_error_3d_m,
                "median_sigma_3d_m": f.median_sigma_3d_m,
            })
        };
        let series = json!({
            "t_s": vis.iter().map(|e| e.t_s).collect::<Vec<_>>(),
            "elevation_deg": vis.iter().map(|e| e.elevation_deg).collect::<Vec<_>>(),
            "cn0_dbhz": vis.iter().map(|e| e.bands[pk.band].cn0_dbhz).collect::<Vec<_>>(),
            "tracked_cn0_dbhz": vis.iter().map(|e| e.bands[pk.band].tracked_cn0_dbhz.unwrap_or(f64::NAN)).collect::<Vec<_>>(),
            "code_jitter_m": vis.iter().map(|e| e.bands[pk.band].code_jitter_m.unwrap_or(f64::NAN)).collect::<Vec<_>>(),
            "doppler_hz": vis.iter().map(|e| e.bands[pk.band].doppler_hz).collect::<Vec<_>>(),
        });
        let fused_epochs = json!({
            "t_s": joint.epochs.iter().map(|e| e.t_s).collect::<Vec<_>>(),
            "pdop_gnss": joint.epochs.iter().map(|e| e.pdop_gnss).collect::<Vec<_>>(),
            "pdop_fused": joint.epochs.iter().map(|e| e.pdop_fused).collect::<Vec<_>>(),
            "error_gnss_m": joint.epochs.iter().map(|e| e.error_gnss_m).collect::<Vec<_>>(),
            "error_fused_m": joint.epochs.iter().map(|e| e.error_fused_m).collect::<Vec<_>>(),
        });
        let ppp_json = ppp_out.as_ref().map(|p| {
            json!({
                "runs_per_case": p.runs_per_case,
                "criterion_horizontal_m": p.criterion_horizontal_m,
                "cases": p.cases.iter().map(|c| json!({
                    "name": c.name,
                    "n_leo": c.n_leo,
                    "median_convergence_min": c.median_convergence_min,
                    "fraction_converged": c.fraction_converged,
                    "nees_mean": c.nees_mean,
                })).collect::<Vec<_>>(),
            })
        });
        let name = self
            .name
            .clone()
            .unwrap_or_else(|| format!("LEO-PNT chain: {}", design.name));
        let mut doc = json!({
            "kind": "leo-pnt-chain",
            "label": LABEL,
            "name": name,
            "signal": {
                "design": design.name,
                "source": design.source_ref,
                "centre_hz": design.centre_hz,
                "tx_bandwidth_hz": design.tx_bandwidth_hz,
                "tracked_component": design.components[ti].role.as_str(),
                "tracked_share": design.components[ti].share,
                "in_band_fraction": eta,
                "tracked_cn0_offset_db": offset,
                "chip_rate_hz": chip,
            },
            "pass": {
                "satellite": sat.id,
                "band": band.name,
                "altitude_km": sat.altitude_m / 1e3,
                "inclination_deg": sat.inclination_deg,
                "max_elevation_deg": sat.pass.max_elevation_deg,
                "duration_above_mask_s": sat.pass.duration_above_mask_s,
                "eirp_dbw": band.eirp_dbw,
                "peak_cn0_dbhz": band.peak_cn0_dbhz,
                "peak_tracked_cn0_dbhz": band.peak_tracked_cn0_dbhz,
                "min_code_jitter_m": band.min_code_jitter_m,
                "median_code_jitter_m": jitter_median,
                "max_code_jitter_m": band.max_code_jitter_m,
                "cn0_fit_intercept_dbhz": a,
                "cn0_fit_slope_dbhz": b,
                "cn0_fit_points": pts.len(),
            },
            "navmsg": {
                "model": res.model.code(),
                "fit_interval_s": res.fit_interval_s,
                "update_period_s": res.update_period_s,
                "zero_clock": res.zero_clock,
                "altitude_km": res.orbit.altitude_m / 1e3,
                "representation_sisre_rms_m": stats.sisre_rms_m,
                "od_sisre_m": od,
                "sisre_rms_m": sisre,
                "sisre_orbit_rms_m": stats.sisre_orb_rms_m,
                "sisre_max_m": stats.sisre_max_m,
            },
            "fusion": {
                "leo_systems_fed": n_leo_systems,
                "leo_cn0_mask_dbhz": cn0_ends[0],
                "leo_cn0_zenith_dbhz": cn0_ends[1],
                "gnss": fom(&joint.gnss),
                "leo": fom(&joint.leo),
                "fused": fom(&joint.fused),
                "fraction_epochs_with_leo": joint.fraction_epochs_with_leo,
                "systems": fr.systems.iter().map(|s| json!({
                    "name": s.name,
                    "role": s.role,
                    "n_satellites": s.n_satellites,
                    "sisre_m": s.sisre_m,
                    "cn0_dbhz": s.cn0_dbhz,
                    "sigma_pr_30deg_m": s.sigma_pr_30deg_m,
                })).collect::<Vec<_>>(),
                "epochs": fused_epochs,
            },
            "ppp": ppp_json,
            "handoffs": handoffs,
            "series": series,
            "limitations": LIMITATIONS,
        });
        let units = crate::solar_system::units_block_from(UNITS);
        doc.as_object_mut()
            .expect("object")
            .insert("units".into(), units);

        let mut s = format!(
            "{name}\n  signal {} ({}), tracked {} at {:.3} Mchip/s, C/N0 offset {:+.2} dB\n",
            design.name,
            design
                .source_ref
                .clone()
                .unwrap_or_else(|| "scenario".into()),
            design.components[ti].role.as_str(),
            chip / 1e6,
            offset
        );
        s.push_str(&format!(
            "  pass {} {:.0} km: tracked C/N0 peak {:.1} dB-Hz, code jitter median {:.3} m; C/N0 line {:.1} + {:.1} sin(el) dB-Hz\n",
            sat.id,
            sat.altitude_m / 1e3,
            band.peak_tracked_cn0_dbhz.unwrap_or(f64::NAN),
            jitter_median,
            a,
            b
        ));
        s.push_str(&format!(
            "  message {} {:.0} s fit / {:.0} s update: representation SISRE {:.3} mm RMS (orbit {:.3} mm), with {:.3} m orbit determination: {:.3} m handed on\n",
            res.model.code(),
            res.fit_interval_s,
            res.update_period_s,
            stats.sisre_rms_m * 1e3,
            stats.sisre_orb_rms_m * 1e3,
            od,
            sisre
        ));
        let f3 = |f: &crate::leo_fusion::pvt_kind::FixFom| {
            format!(
                "PDOP {} RMS 3D {}",
                f.median_pdop.map_or("n/a".into(), |v| format!("{v:.2}")),
                f.rms_error_3d_m
                    .map_or("n/a".into(), |v| format!("{v:.2} m"))
            )
        };
        s.push_str(&format!(
            "  fused fix: GNSS only {} -> GNSS + LEO {}\n",
            f3(&joint.gnss),
            f3(&joint.fused)
        ));
        if let Some(p) = &ppp_out {
            let cells: Vec<String> = p
                .cases
                .iter()
                .map(|c| {
                    format!(
                        "{} {}",
                        c.name,
                        c.median_convergence_min
                            .map_or("n/a".into(), |v| format!("{v:.1} min"))
                    )
                })
                .collect();
            s.push_str(&format!("  PPP convergence: {}\n", cells.join(", ")));
        }
        s.push_str(&format!(
            "  {} values handed between stages. MODELLED.",
            doc["handoffs"].as_array().map_or(0, |v| v.len())
        ));
        let svg = to_svg(&doc, &name);
        Ok((doc, s, svg))
    }

    /// Run and render: JSON, summary, SVG.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let (doc, s, svg) = self.compute()?;
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        Ok((json, s, svg))
    }
}

fn nums(v: &Value) -> Vec<f64> {
    v.as_array()
        .map(|a| a.iter().map(|x| x.as_f64().unwrap_or(f64::NAN)).collect())
        .unwrap_or_default()
}

fn to_svg(doc: &Value, name: &str) -> String {
    let (w, h) = (900.0, 520.0);
    let esc = |t: &str| {
        t.replace('&', "&amp;")
            .replace('<', "&lt;")
            .replace('>', "&gt;")
    };
    let mut s = crate::chart::frame_open(
        w,
        h,
        &esc(name),
        "signal design -> pass C/N0 and code jitter -> message SISRE -> fused fix · MODELLED",
    );
    let (ml, pw) = (70.0, 800.0);
    let t = nums(&doc["series"]["t_s"]);
    let cn0 = nums(&doc["series"]["tracked_cn0_dbhz"]);
    let jit = nums(&doc["series"]["code_jitter_m"]);
    let (t0, t1) = (
        t.first().copied().unwrap_or(0.0),
        t.last().copied().unwrap_or(1.0),
    );
    let x = |v: f64| ml + pw * (v - t0) / (t1 - t0).max(1.0);
    // Panel 1: tracked C/N0.
    let (top1, ph1) = (70.0, 170.0);
    let (lo, hi) = (20.0, 80.0);
    let y1 = |v: f64| top1 + ph1 - ph1 * ((v - lo) / (hi - lo)).clamp(0.0, 1.0);
    s.push_str(&crate::chart::panel_axes(
        ml,
        top1,
        pw,
        top1 + ph1,
        "Tracked-component C/N0 over the pass (dB-Hz, 20 to 80)",
    ));
    let pts: Vec<String> = t
        .iter()
        .zip(&cn0)
        .filter(|(_, c)| c.is_finite())
        .map(|(a, c)| format!("{:.1},{:.1}", x(*a), y1(*c)))
        .collect();
    if pts.len() > 1 {
        s.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"#c79e63\" stroke-width=\"2\" points=\"{}\"/>",
            pts.join(" ")
        ));
    }
    // Panel 2: code jitter.
    let (top2, ph2) = (280.0, 120.0);
    let jmax = jit
        .iter()
        .copied()
        .filter(|v| v.is_finite())
        .fold(1e-3_f64, f64::max);
    let y2 = |v: f64| top2 + ph2 - ph2 * (v / jmax).clamp(0.0, 1.0);
    s.push_str(&crate::chart::panel_axes(
        ml,
        top2,
        pw,
        top2 + ph2,
        &format!("Code-tracking jitter, the ranging error (m, 0 to {jmax:.3})"),
    ));
    let pts: Vec<String> = t
        .iter()
        .zip(&jit)
        .filter(|(_, c)| c.is_finite())
        .map(|(a, c)| format!("{:.1},{:.1}", x(*a), y2(*c)))
        .collect();
    if pts.len() > 1 {
        s.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"#7fb2d6\" stroke-width=\"2\" points=\"{}\"/>",
            pts.join(" ")
        ));
    }
    // Footer: the downstream figures.
    let f = |p: &str| doc.pointer(p).and_then(Value::as_f64);
    let line = format!(
        "SISRE {} · GNSS only RMS 3D {} · GNSS + LEO RMS 3D {}",
        f("/navmsg/sisre_rms_m").map_or("n/a".into(), |v| format!("{v:.3} m")),
        f("/fusion/gnss/rms_error_3d_m").map_or("n/a".into(), |v| format!("{v:.2} m")),
        f("/fusion/fused/rms_error_3d_m").map_or("n/a".into(), |v| format!("{v:.2} m")),
    );
    s.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"450\" font-size=\"13\">{}</text>",
        esc(&line)
    ));
    s.push_str("</svg>");
    s
}

/// Units and provenance for every numeric leaf.
const UNITS: &[(&str, &str, &str, &str)] = &[
    ("signal.centre_hz", "Hz", "input", "centre frequency of the chain's signal design"),
    ("signal.tx_bandwidth_hz", "Hz", "input", "transmit bandwidth of the design"),
    ("signal.tracked_share", "1", "input", "share of the transmitted power in the tracked component"),
    ("signal.in_band_fraction", "1", "computed", "fraction of the transmitted power inside the transmit bandwidth"),
    ("signal.tracked_cn0_offset_db", "dB", "computed", "offset from the total C/N0 to the tracked component's, 10 log10(share / in-band fraction)"),
    ("signal.chip_rate_hz", "chip/s", "input", "chip rate of the tracked component"),
    ("pass.altitude_km", "km", "computed", "altitude of the chain satellite"),
    ("pass.inclination_deg", "deg", "computed", "inclination of the chain satellite"),
    ("pass.max_elevation_deg", "deg", "computed", "maximum elevation of the chain satellite's pass"),
    ("pass.duration_above_mask_s", "s", "computed", "time the chain satellite is above the pass mask"),
    ("pass.eirp_dbw", "dBW", "input", "EIRP of the band carrying the design"),
    ("pass.peak_cn0_dbhz", "dB-Hz", "computed", "total C/N0 at the pass peak"),
    ("pass.peak_tracked_cn0_dbhz", "dB-Hz", "computed", "tracked-component C/N0 at the pass peak"),
    ("pass.min_code_jitter_m", "m", "modelled", "smallest code-tracking jitter over the pass"),
    ("pass.median_code_jitter_m", "m", "modelled", "median code-tracking jitter over the pass"),
    ("pass.max_code_jitter_m", "m", "modelled", "largest code-tracking jitter over the pass"),
    ("pass.cn0_fit_intercept_dbhz", "dB-Hz", "computed", "intercept a of the least-squares line C/N0 = a + b sin(elevation)"),
    ("pass.cn0_fit_slope_dbhz", "dB-Hz", "computed", "slope b of the least-squares line C/N0 = a + b sin(elevation)"),
    ("pass.cn0_fit_points", "count", "computed", "visible epochs in the C/N0 line fit"),
    ("navmsg.fit_interval_s", "s", "input", "fit interval of the navigation message"),
    ("navmsg.update_period_s", "s", "input", "update period of the navigation message"),
    ("navmsg.altitude_km", "km", "computed", "altitude of the message's truth orbit"),
    ("navmsg.representation_sisre_rms_m", "m", "modelled", "the message's representation error against its truth orbit and clock, root mean square"),
    ("navmsg.od_sisre_m", "m", "input", "orbit-determination and clock-prediction range error added in root-sum-square"),
    ("navmsg.sisre_rms_m", "m", "modelled", "signal-in-space range error handed to the positioning stages: representation and orbit determination in root-sum-square"),
    ("navmsg.sisre_orbit_rms_m", "m", "modelled", "orbit-only signal-in-space range error, root mean square"),
    ("navmsg.sisre_max_m", "m", "modelled", "largest signal-in-space range error, orbit and clock"),
    ("fusion.leo_systems_fed", "count", "computed", "LEO systems of the positioning stage that took the chain's values"),
    ("fusion.leo_cn0_mask_dbhz", "dB-Hz", "computed", "tracked C/N0 handed on for the elevation mask"),
    ("fusion.leo_cn0_zenith_dbhz", "dB-Hz", "computed", "tracked C/N0 handed on for the zenith"),
    ("fusion.gnss.availability", "1", "computed", "fraction of epochs with a GNSS-only fix"),
    ("fusion.gnss.median_pdop", "1", "computed", "median position dilution of precision, GNSS only"),
    ("fusion.gnss.rms_error_3d_m", "m", "modelled", "root-mean-square 3D error, GNSS only"),
    ("fusion.gnss.median_sigma_3d_m", "m", "modelled", "median formal 3D one-sigma, GNSS only"),
    ("fusion.leo.availability", "1", "computed", "fraction of epochs with a LEO-only fix"),
    ("fusion.leo.median_pdop", "1", "computed", "median position dilution of precision, LEO only"),
    ("fusion.leo.rms_error_3d_m", "m", "modelled", "root-mean-square 3D error, LEO only"),
    ("fusion.leo.median_sigma_3d_m", "m", "modelled", "median formal 3D one-sigma, LEO only"),
    ("fusion.fused.availability", "1", "computed", "fraction of epochs with a fused fix"),
    ("fusion.fused.median_pdop", "1", "computed", "median position dilution of precision, GNSS + LEO"),
    ("fusion.fused.rms_error_3d_m", "m", "modelled", "root-mean-square 3D error, GNSS + LEO"),
    ("fusion.fused.median_sigma_3d_m", "m", "modelled", "median formal 3D one-sigma, GNSS + LEO"),
    ("fusion.fraction_epochs_with_leo", "1", "computed", "fraction of epochs with at least one LEO satellite"),
    ("fusion.systems[].n_satellites", "count", "computed", "satellites of the system"),
    ("fusion.systems[].sisre_m", "m", "input", "signal-in-space range error the system uses"),
    ("fusion.systems[].cn0_dbhz[]", "dB-Hz", "input", "C/N0 at the mask and at the zenith the system uses"),
    ("fusion.systems[].sigma_pr_30deg_m", "m", "modelled", "pseudorange one-sigma at 30 deg elevation"),
    ("fusion.epochs.t_s[]", "s", "computed", "epoch times of the fused run"),
    ("fusion.epochs.pdop_gnss[]", "1", "computed", "position dilution of precision, GNSS only"),
    ("fusion.epochs.pdop_fused[]", "1", "computed", "position dilution of precision, GNSS + LEO"),
    ("fusion.epochs.error_gnss_m[]", "m", "modelled", "3D error of the GNSS-only fix"),
    ("fusion.epochs.error_fused_m[]", "m", "modelled", "3D error of the fused fix"),
    ("ppp.runs_per_case", "count", "input", "seeded runs per precise point positioning case"),
    ("ppp.criterion_horizontal_m", "m", "input", "horizontal convergence threshold"),
    ("ppp.cases[].n_leo", "count", "computed", "LEO satellites added in the case"),
    ("ppp.cases[].median_convergence_min", "min", "modelled", "median convergence time over converged runs"),
    ("ppp.cases[].fraction_converged", "1", "computed", "fraction of runs that converged"),
    ("ppp.cases[].nees_mean", "1", "computed", "mean normalised estimation error squared (3 for a consistent filter)"),
    ("handoffs[].value", "varies", "computed", "the handed-on value, in the unit its row states"),
    ("series.t_s[]", "s", "computed", "epoch times of the chain satellite's visible pass"),
    ("series.elevation_deg[]", "deg", "computed", "elevation of the chain satellite"),
    ("series.cn0_dbhz[]", "dB-Hz", "computed", "total C/N0 of the band carrying the design"),
    ("series.tracked_cn0_dbhz[]", "dB-Hz", "computed", "tracked-component C/N0"),
    ("series.code_jitter_m[]", "m", "modelled", "band-limited code-tracking jitter of the tracked component"),
    ("series.doppler_hz[]", "Hz", "computed", "carrier Doppler of the band carrying the design"),
];

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_sine_line_fit_recovers_its_line() {
        let pts: Vec<(f64, f64)> = [10.0, 30.0, 50.0, 70.0, 90.0]
            .iter()
            .map(|&e: &f64| (e, 40.0 + 15.0 * e.to_radians().sin()))
            .collect();
        let (a, b) = fit_sin_line(&pts).expect("fit");
        assert!(
            (a - 40.0).abs() < 1e-9 && (b - 15.0).abs() < 1e-9,
            "{a} {b}"
        );
        assert!(fit_sin_line(&pts[..1]).is_none());
    }
}
