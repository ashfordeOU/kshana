// SPDX-License-Identifier: AGPL-3.0-only
//! Software-in-the-loop observation generator: a deterministic RINEX 3.04 observation file from a
//! `gnss-sim` scenario, with an optional urban street-canyon model of line-of-sight blocking,
//! multipath and non-line-of-sight (NLOS) reception (`kshana sil-obsgen`, docs/SIL-OBSGEN.md).
//!
//! **Measurements.** The pseudorange, Doppler and C/N0 of every satellite above the mask come
//! from the measurement-domain simulator ([`crate::gnss_sim`]: Walker constellation by SGP4,
//! Klobuchar ionosphere, Saastamoinen/Niell troposphere, clocks, seeded noise). The carrier phase
//! is formed from the same terms with the ionosphere's sign reversed and a fixed integer ambiguity
//! per satellite: `λ·L = ρ − 2·I + λ·N`. Same scenario, same bytes: the generator is meant for
//! continuous-integration runs of a receiver or a positioning engine.
//!
//! **Urban canyon** (`[urban]`). The receiver stands in a straight street (azimuth, width, left
//! and right building heights, antenna height), the two façades vertical planes at `±w/2`. For a
//! satellite at azimuth `a` and elevation `θ`, with `Δ` the angle between `a` and the normal of
//! the façade on the far side:
//!
//! * **blocked** when the façade on the satellite's side rises above the line of sight;
//! * a **reflection** off the far façade exists when the reflection point, at horizontal distance
//!   `d/cos Δ` along the azimuth, lies below that façade's top; its excess path is
//!   `δ = 2·d·cos θ·cos Δ` (the image-source construction, computed in 3-D in [`excess_path_m`]);
//! * a blocked satellite with a reflection is received **NLOS**: the pseudorange and carrier gain
//!   `δ` and the C/N0 loses `reflection_loss_db` (6 dB by default, a stated assumption);
//! * a visible satellite with a reflection carries **multipath**: a code error
//!   `α·δ·cos φ / (1 + α·cos φ)` for `δ` under one chip (α the reflection's amplitude, φ its carrier
//!   phase `2πδ/λ`), zero beyond; the carrier error is `λ/2π·atan2(α sin φ, 1 + α cos φ)`;
//! * a blocked satellite with no reflection is not received.
//!
//! **Comparison with a published model.** For a reflector broadside to the satellite (`Δ = 0`) the
//! excess path is `d·sec θ·(1 + cos 2θ)`, the form of the NLOS delay model of L.-T. Hsu, *Analysis
//! and modeling GPS NLOS effect in highly urbanized area*, GPS Solutions 22, 7 (2018),
//! doi:10.1007/s10291-017-0667-9 (cited from its published form; the full text was not read here,
//! to confirm). The tests check the 3-D image construction against that closed form. This is a
//! geometric check of the delay model; the canyon's statistics have not been compared with field
//! measurements. MODELLED.

use crate::gnss_sim::{run_gnss_sim_sky, GnssSimScenario};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// The honesty label.
pub const LABEL: &str =
    "MODELLED: synthetic observations from the gnss-sim measurement model and a single-reflection \
street-canyon model (delay form of Hsu 2018); deterministic for a scenario; not a measurement.";

const C: f64 = 299_792_458.0;
const L1_HZ: f64 = 1_575.42e6;
const CHIP_M: f64 = C / 1.023e6;

/// The `[urban]` table.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Urban {
    /// Street azimuth, degrees clockwise from north.
    #[serde(default)]
    pub street_az_deg: f64,
    /// Façade to façade, m.
    pub width_m: f64,
    /// Left façade height (looking along the street azimuth), m.
    pub height_left_m: f64,
    /// Right façade height, m.
    pub height_right_m: f64,
    /// Antenna height above the street, m.
    #[serde(default = "one_and_half")]
    pub antenna_m: f64,
    /// Power lost in the reflection, dB.
    #[serde(default = "six")]
    pub reflection_loss_db: f64,
}

fn one_and_half() -> f64 {
    1.5
}
fn six() -> f64 {
    6.0
}

/// How a satellite is received.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Reception {
    /// Direct signal only.
    Los,
    /// Direct signal and a reflection.
    LosMultipath,
    /// Reflection only.
    Nlos,
    /// Nothing.
    Blocked,
}

/// The canyon's verdict for one direction.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct CanyonPath {
    /// Reception.
    pub reception: Reception,
    /// Excess path of the reflection, m (0 without one).
    pub excess_m: f64,
}

/// Excess path (m) of a reflection off a vertical plane at perpendicular distance `d` from the
/// antenna, for a satellite at elevation `el` and at `delta` from the plane's normal, by the image
/// source: the reflected ray's length from the image antenna minus the direct one, for a distant
/// satellite (plane waves).
pub fn excess_path_m(d: f64, el_rad: f64, delta_rad: f64) -> f64 {
    // Unit vector toward the satellite in a frame whose x axis is the wall normal pointing from
    // the antenna away from the wall: the wall lies at x = -d, the satellite on the +x side.
    let (se, ce) = el_rad.psin_cos();
    let (sd, cd) = delta_rad.psin_cos();
    let u = [ce * cd, ce * sd, se];
    // The image of the antenna in the wall plane x = -d is at (-2d, 0, 0). For a plane wave the
    // path difference is the projection of (antenna - image) onto u.
    let rel = [2.0 * d, 0.0, 0.0];
    rel[0] * u[0] + rel[1] * u[1] + rel[2] * u[2]
}

/// Hsu (2018)'s NLOS delay form `d·sec θ·(1 + cos 2θ)`, for comparison.
pub fn hsu_2018_delay_m(d: f64, el_rad: f64) -> f64 {
    d / el_rad.pcos() * (1.0 + (2.0 * el_rad).pcos())
}

impl Urban {
    /// The canyon's verdict for a satellite at azimuth `az` and elevation `el` (radians).
    pub fn path(&self, az_rad: f64, el_rad: f64) -> CanyonPath {
        let d = self.width_m / 2.0;
        // Normal toward the right façade.
        let n_right = (self.street_az_deg + 90.0).to_radians();
        let c = (az_rad - n_right).pcos();
        // The façade on the satellite's side, and the one behind the antenna.
        let (h_near, h_far) = if c >= 0.0 {
            (self.height_right_m, self.height_left_m)
        } else {
            (self.height_left_m, self.height_right_m)
        };
        let cos_delta = c.abs();
        let tan_el = el_rad.ptan();
        // Line of sight: the near façade's top seen at horizontal distance d / cos Δ.
        let visible = cos_delta < 1e-9 || {
            let reach = d / cos_delta;
            self.antenna_m + reach * tan_el > h_near
        };
        // Reflection off the far façade: the reflected ray meets the far façade at a horizontal
        // distance d / cos Δ behind the antenna, so the reflection point is at height
        // antenna + (d / cos Δ)·tan θ and must lie below the far façade's top; the incoming ray to
        // it crosses the near façade a further 2d / cos Δ toward the satellite, at height
        // antenna + 3(d / cos Δ)·tan θ, and must clear it.
        let reflects = cos_delta > 1e-9 && {
            let reach = d / cos_delta;
            self.antenna_m + reach * tan_el < h_far
                && (self.antenna_m + 3.0 * reach * tan_el > h_near || visible)
        };
        let excess = if reflects {
            excess_path_m(d, el_rad, cos_delta.pacos())
        } else {
            0.0
        };
        let reception = match (visible, reflects) {
            (true, false) => Reception::Los,
            (true, true) => Reception::LosMultipath,
            (false, true) => Reception::Nlos,
            (false, false) => Reception::Blocked,
        };
        CanyonPath {
            reception,
            excess_m: excess,
        }
    }
}

/// The generator's scenario: a `gnss-sim` scenario with optional `[urban]` and `[rinex]` tables.
#[derive(Clone, Debug)]
pub struct SilScenario {
    /// The measurement simulation.
    pub sim: GnssSimScenario,
    /// The street canyon.
    pub urban: Option<Urban>,
    /// Marker name written in the header.
    pub marker: String,
}

/// Parse the scenario TOML.
pub fn parse(text: &str) -> Result<SilScenario, String> {
    let mut v: toml::Table =
        toml::from_str(text).map_err(|e| crate::terr!("e-sil-obsgen-bad-scenario", e = e))?;
    v.remove("kind");
    let urban = v
        .remove("urban")
        .map(|u| u.try_into::<Urban>())
        .transpose()
        .map_err(|e| crate::terr!("e-sil-obsgen-bad-scenario", e = e))?;
    let marker = v
        .remove("rinex")
        .and_then(|r| r.get("marker").and_then(|m| m.as_str()).map(str::to_string))
        .unwrap_or_else(|| "SYNTHETIC".into());
    let sim: GnssSimScenario = toml::Value::Table(v)
        .try_into()
        .map_err(|e| crate::terr!("e-sil-obsgen-bad-scenario", e = e))?;
    if let Some(u) = &urban {
        if u.width_m <= 0.0 || u.width_m.is_nan() || u.height_left_m < 0.0 || u.height_right_m < 0.0
        {
            return Err(crate::terr!("e-sil-obsgen-bad-scenario", e = "urban"));
        }
    }
    Ok(SilScenario { sim, urban, marker })
}

/// One satellite at one epoch, as generated.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TruthRow {
    /// Seconds from the first epoch.
    pub t_s: f64,
    /// Satellite (`G01` ...).
    pub sat: String,
    /// Azimuth and elevation, degrees.
    pub az_deg: f64,
    /// Elevation, degrees.
    pub el_deg: f64,
    /// Reception class.
    pub reception: Reception,
    /// Code error added by the canyon, m.
    pub code_error_m: f64,
    /// Carrier error added by the canyon, m.
    pub carrier_error_m: f64,
}

/// The generated file and its truth.
#[derive(Clone, Debug, Serialize)]
pub struct Generated {
    /// RINEX text.
    #[serde(skip)]
    pub rinex: String,
    /// Truth rows.
    pub truth: Vec<TruthRow>,
    /// Counts per reception class.
    pub counts: std::collections::BTreeMap<String, usize>,
    /// Label.
    pub label: &'static str,
}

fn f14(v: f64) -> String {
    format!("{v:14.3}")
}

fn header_line(body: &str, label: &str) -> String {
    format!("{body:<60}{label:<20}\n")
}

/// Generate.
pub fn generate(s: &SilScenario) -> Result<Generated, String> {
    let res = run_gnss_sim_sky(&s.sim, None);
    let lambda = C / L1_HZ;
    let t0 = crate::walker::walker_epoch_jd();
    // Epoch labels in seconds of day from the start (7 decimals, as RINEX writes them), not
    // through a Julian Date, whose ~40 µs floor puts a clean grid at 14:59.9999866.
    let start_civil = crate::timescales::civil_from_jd(t0);
    let cal = |t: f64| crate::timescales::civil_after(start_civil, t, 7);
    let st = &s.sim.receiver;
    let ecef = crate::frames::geodetic_to_ecef(crate::frames::Geodetic {
        lat_rad: st.lat_deg.to_radians(),
        lon_rad: st.lon_deg.to_radians(),
        alt_m: st.alt_m,
    });
    let first = cal(0.0);
    let mut out = String::new();
    out += &header_line(
        "     3.04           OBSERVATION DATA    G (GPS)",
        "RINEX VERSION / TYPE",
    );
    out += &header_line(
        "kshana sil-obsgen   kshana              synthetic",
        "PGM / RUN BY / DATE",
    );
    out += &header_line(
        "synthetic observations (MODELLED), not a measurement",
        "COMMENT",
    );
    out += &header_line(&s.marker, "MARKER NAME");
    out += &header_line("SYNTHETIC           kshana", "OBSERVER / AGENCY");
    out += &header_line(
        "0                   kshana-sim          0",
        "REC # / TYPE / VERS",
    );
    out += &header_line("0                   NONE", "ANT # / TYPE");
    out += &header_line(
        &format!("{:14.4}{:14.4}{:14.4}", ecef[0], ecef[1], ecef[2]),
        "APPROX POSITION XYZ",
    );
    out += &header_line(
        &format!("{:14.4}{:14.4}{:14.4}", 0.0, 0.0, 0.0),
        "ANTENNA: DELTA H/E/N",
    );
    out += &header_line("G    4 C1C L1C D1C S1C", "SYS / # / OBS TYPES");
    out += &header_line(&format!("{:10.3}", s.sim.time.step_s), "INTERVAL");
    out += &header_line(
        &format!(
            "  {:4}    {:2}    {:2}    {:2}    {:2}   {:10.7}     GPS",
            first.year, first.month, first.day, first.hour, first.minute, first.second
        ),
        "TIME OF FIRST OBS",
    );
    out += &header_line("", "END OF HEADER");
    let mut truth = Vec::new();
    let mut counts = std::collections::BTreeMap::new();
    for e in &res.gnss_measurements {
        let mut lines = Vec::new();
        for m in &e.measurements {
            let (az, el) = (m.az_deg.to_radians(), m.el_deg.to_radians());
            let path = s
                .urban
                .as_ref()
                .map(|u| u.path(az, el))
                .unwrap_or(CanyonPath {
                    reception: Reception::Los,
                    excess_m: 0.0,
                });
            let alpha = s
                .urban
                .as_ref()
                .map(|u| 10f64.powf(-u.reflection_loss_db / 20.0))
                .unwrap_or(0.0);
            let loss = s
                .urban
                .as_ref()
                .map(|u| u.reflection_loss_db)
                .unwrap_or(0.0);
            let (code_err, carr_err, cn0) = match path.reception {
                Reception::Blocked => {
                    *counts.entry("blocked".to_string()).or_insert(0) += 1;
                    continue;
                }
                Reception::Los => (0.0, 0.0, m.cn0_dbhz),
                Reception::Nlos => (path.excess_m, path.excess_m, m.cn0_dbhz - loss),
                Reception::LosMultipath => {
                    let phi = 2.0 * std::f64::consts::PI * path.excess_m / lambda;
                    let (sp, cp) = phi.psin_cos();
                    let code = if path.excess_m < CHIP_M {
                        alpha * path.excess_m * cp / (1.0 + alpha * cp)
                    } else {
                        0.0
                    };
                    let carr = lambda / (2.0 * std::f64::consts::PI)
                        * (alpha * sp).patan2(1.0 + alpha * cp);
                    (code, carr, m.cn0_dbhz)
                }
            };
            let key = match path.reception {
                Reception::Los => "los",
                Reception::LosMultipath => "los-multipath",
                Reception::Nlos => "nlos",
                Reception::Blocked => "blocked",
            };
            *counts.entry(key.to_string()).or_insert(0) += 1;
            let sat = format!("G{:02}", m.prn + 1);
            let pr = m.pseudorange_m + code_err;
            let n_amb = 1_000_000.0 + 1_000.0 * m.prn as f64;
            let l_cyc = (m.pseudorange_m - 2.0 * m.iono_correction_m + carr_err) / lambda + n_amb;
            lines.push(format!(
                "{sat}{}  {}  {}  {}  \n",
                f14(pr),
                f14(l_cyc),
                f14(m.doppler_hz),
                f14(cn0)
            ));
            truth.push(TruthRow {
                t_s: e.t,
                sat,
                az_deg: m.az_deg,
                el_deg: m.el_deg,
                reception: path.reception,
                code_error_m: code_err,
                carrier_error_m: carr_err,
            });
        }
        let c = cal(e.t);
        out += &format!(
            "> {:4} {:02} {:02} {:02} {:02} {:10.7}  0{:3}\n",
            c.year,
            c.month,
            c.day,
            c.hour,
            c.minute,
            c.second,
            lines.len()
        );
        for l in lines {
            out += &l;
        }
    }
    Ok(Generated {
        rinex: out,
        truth,
        counts,
        label: LABEL,
    })
}

/// `kshana sil-obsgen <scenario.toml> --out <obs.rnx> [--truth <truth.json>]`.
pub fn run_cli(args: &[String]) -> i32 {
    match cli(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn cli(args: &[String]) -> Result<(), String> {
    if args.is_empty() {
        return Err(crate::t!("sil-obsgen-usage"));
    }
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", crate::t!("sil-obsgen-usage"));
        return Ok(());
    }
    let (mut input, mut out, mut truth) = (None, None, None);
    let mut it = args.iter();
    while let Some(a) = it.next() {
        match a.as_str() {
            "--out" | "--truth" => {
                let v = it
                    .next()
                    .ok_or_else(|| crate::terr!("e-sil-obsgen-missing-value", option = a))?;
                if a == "--out" {
                    out = Some(v.clone());
                } else {
                    truth = Some(v.clone());
                }
            }
            s if s.starts_with("--") => {
                return Err(crate::terr!("e-sil-obsgen-unknown-option", option = s))
            }
            s => input = Some(s.to_string()),
        }
    }
    let (Some(input), Some(out)) = (input, out) else {
        return Err(crate::t!("sil-obsgen-usage"));
    };
    let text = std::fs::read_to_string(&input)
        .map_err(|e| crate::terr!("e-sil-obsgen-cannot-read", path = input, e = e))?;
    let g = generate(&parse(&text)?)?;
    let write = |p: &str, t: &str| {
        std::fs::write(p, t).map_err(|e| crate::terr!("e-sil-obsgen-cannot-write", path = p, e = e))
    };
    write(&out, &g.rinex)?;
    if let Some(t) = truth {
        write(
            &t,
            &(serde_json::to_string_pretty(&g).map_err(|e| e.to_string())? + "\n"),
        )?;
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_image_construction_matches_hsu_2018_broadside() {
        for d in [5.0, 12.5, 40.0] {
            for el in [5.0f64, 15.0, 30.0, 45.0, 60.0, 80.0] {
                let e = el.to_radians();
                let a = excess_path_m(d, e, 0.0);
                let b = hsu_2018_delay_m(d, e);
                assert!((a - b).abs() < 1e-9 * b.max(1.0), "{d} {el}: {a} {b}");
            }
        }
        // Off broadside the path shortens with cos Δ.
        let e = 30f64.to_radians();
        let full = excess_path_m(10.0, e, 0.0);
        assert!((excess_path_m(10.0, e, 60f64.to_radians()) - full * 0.5).abs() < 1e-9);
    }

    #[test]
    fn canyon_classes() {
        let u = Urban {
            street_az_deg: 0.0,
            width_m: 20.0,
            height_left_m: 30.0,
            height_right_m: 30.0,
            antenna_m: 1.5,
            reflection_loss_db: 6.0,
        };
        let r = |az: f64, el: f64| u.path(az.to_radians(), el.to_radians()).reception;
        // Along the street, nothing is in the way.
        assert_eq!(r(0.0, 10.0), Reception::Los);
        // Across the street, low: the near façade blocks the direct ray and the ray to the far one.
        assert_eq!(r(90.0, 20.0), Reception::Blocked);
        // Across, at 60 degrees: the direct ray is blocked, the far façade's reflection arrives.
        assert_eq!(r(90.0, 60.0), Reception::Nlos);
        let p = u.path(90f64.to_radians(), 60f64.to_radians());
        assert!((p.excess_m - 2.0 * 10.0 * 60f64.to_radians().cos()).abs() < 1e-9);
        // Across, high: visible, and the reflection point is above the 30 m façade: no reflection.
        assert_eq!(r(90.0, 75.0), Reception::Los);
        // A low near façade and a tall far one: visible and reflected.
        let v = Urban {
            height_right_m: 20.0,
            height_left_m: 60.0,
            ..u.clone()
        };
        assert_eq!(
            v.path(90f64.to_radians(), 70f64.to_radians()).reception,
            Reception::LosMultipath
        );
    }

    const SCN: &str = r#"kind = "gnss-sim"
seed = 3
mask_deg = 5.0
noise_sigma_m = 0.5
[time]
step_s = 30.0
duration_s = 300.0
[receiver]
lat_deg = 59.43
lon_deg = 24.75
alt_m = 30.0
[constellation]
altitude_km = 20200.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0
[urban]
street_az_deg = 20.0
width_m = 18.0
height_left_m = 25.0
height_right_m = 15.0
"#;

    #[test]
    fn deterministic_and_parsed_back_by_the_rinex_reader() {
        let s = parse(SCN).unwrap();
        let a = generate(&s).unwrap();
        let b = generate(&s).unwrap();
        assert_eq!(a.rinex, b.rinex);
        let obs = crate::rinex_obs::parse_obs(&a.rinex).unwrap();
        assert_eq!(obs.epochs.len(), 11);
        let n_rows = a.truth.len();
        let n_obs: usize = obs.epochs.iter().map(|e| e.sats.len()).sum();
        assert_eq!(n_rows, n_obs);
        assert!(
            a.counts.get("nlos").copied().unwrap_or(0) > 0,
            "{:?}",
            a.counts
        );
        // An NLOS row's code error is its excess path, positive.
        assert!(a
            .truth
            .iter()
            .filter(|t| t.reception == Reception::Nlos)
            .all(|t| t.code_error_m > 0.0));
        // Without the canyon every satellite above the mask is received line of sight.
        let mut open = s.clone();
        open.urban = None;
        let g = generate(&open).unwrap();
        assert!(g.truth.iter().all(|t| t.reception == Reception::Los));
        assert!(g.truth.len() > a.truth.len());
    }
}
