// SPDX-License-Identifier: AGPL-3.0-only
//! A configurable signal model for a new regional radio-navigation satellite service (RNSS):
//! spectra, spectral separation and multi-band RTK settings for user-supplied signal parameters
//! (`kshana rnss-design`).
//!
//! A signal is the [`crate::leo_signal`] signal description (centre frequency, transmit band,
//! allocation, components with a modulation `BPSK(n)`, `BOC(m,n)` (sine-phased, also `BOCs`),
//! `BOCc(m,n)` (cosine-phased), `MBOC(6,1,p)`, power shares, code lengths, data rates, a minimum
//! received power), so nothing here duplicates that model. A **profile** groups signals with
//! the reference signals they are compared with and states where its numbers come from
//! (`kshana.rnss-profile/1`, TOML, under `data/rnss-profiles/` or a file of your own).
//!
//! For every signal of a profile the run reports, over a stated receiver band `B`:
//!
//! * the chip rate and the in-band power fraction `η = ∫_B G(f) df` (`G` unit area over all
//!   frequencies);
//! * the Gabor (RMS) bandwidth, both as `√(∫_B f² G df / η)` and as `√(∫_B f² G df)`, the form
//!   some publications tabulate;
//! * the self spectral separation coefficient and the SSC against every reference signal,
//!   `κ = ∫_B G_s(f) G_i(f − Δf) df` (1/Hz and dB/Hz; Betz 2001), and against each GNSS signal of
//!   [`crate::leo_signal::GNSS_VICTIM_NAMES`] whose band overlaps;
//! * the PSD (dB/Hz) sampled across the band;
//! * code-tracking jitter at a stated C/N₀ ([`crate::leo_signal::code_jitter_m`]; non-coherent
//!   early-minus-late power with its squaring loss by default, or coherent).
//!
//! **Multi-band RTK settings.** The profile's distinct carriers, optionally with GPS L1, L2 and L5,
//! become an input for [`crate::leo_verify::rtk_ar`] (cascaded integer ambiguity resolution): the
//! cascade fixes the combination of the closest carriers first (the longest wide lane), adds
//! carriers by the next-longest wide lane that joins a new one, and ends on the highest-frequency
//! carrier. Code noise per carrier is the DLL jitter above; carrier-phase noise is a stated value.
//! The run reports the input it built and the success rates `rtk_ar` gives.
//!
//! MODELLED: closed-form spectra with an ideal brick-wall band, no code line structure, no
//! cross-correlation; a profile's parameters are only as good as its source, which it states.

use crate::leo_signal::{self, SignalCfg, SignalDesign};
use crate::leo_verify::rtk_ar;
use crate::navsignal::{panels_for, simpson, EarlyLate, Modulation};
use serde::{Deserialize, Serialize};

/// Format tag of a profile file.
pub const PROFILE_FORMAT: &str = "kshana.rnss-profile/1";
/// Format tag of a run report.
pub const REPORT_FORMAT: &str = "kshana.rnss-design/1";

/// The compiled-in profiles: `(name, TOML text)`.
pub const PROFILES: &[(&str, &str)] = &[(
    "candidate-sband-sensors2022",
    include_str!("../data/rnss-profiles/candidate-sband-sensors2022.toml"),
)];

/// Where a profile's numbers come from.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ProfileMeta {
    /// Stable identifier.
    pub name: String,
    /// Title.
    pub title: String,
    /// `CANDIDATE`, `PUBLIC`, `REPRESENTATIVE` or `USER`.
    pub status: String,
    /// Citation.
    #[serde(default)]
    pub citation: Option<String>,
    /// URL.
    #[serde(default)]
    pub url: Option<String>,
    /// Licence of the source.
    #[serde(default)]
    pub licence: Option<String>,
    /// What the profile is not.
    #[serde(default)]
    pub disclaimer: Option<String>,
    /// Further notes.
    #[serde(default)]
    pub notes: Option<String>,
}

/// A signal the profile's signals are compared with.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReferenceSignal {
    /// Identifier.
    pub name: String,
    /// Carrier (MHz).
    pub centre_mhz: f64,
    /// Modulation, as for a component.
    pub modulation: String,
    /// Where it comes from.
    #[serde(default)]
    pub source: Option<String>,
}

/// A profile file.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Profile {
    /// Must be [`PROFILE_FORMAT`].
    pub format: String,
    /// Header.
    pub profile: ProfileMeta,
    /// Reference signals.
    #[serde(default)]
    pub references: Vec<ReferenceSignal>,
    /// The signals.
    pub signals: Vec<SignalCfg>,
}

impl Profile {
    /// Parse and check a profile.
    pub fn from_toml(text: &str) -> Result<Profile, String> {
        let p: Profile = toml::from_str(text)
            .map_err(|e| crate::terr!("e-rnss-design-bad-profile", e = e.to_string()))?;
        if p.format != PROFILE_FORMAT {
            return Err(crate::terr!(
                "e-rnss-design-bad-profile",
                e = format!("format {:?}", p.format)
            ));
        }
        if p.signals.is_empty() || p.signals.len() > 200 {
            return Err(crate::terr!(
                "e-rnss-design-bad-profile",
                e = "signals: 1..=200".to_string()
            ));
        }
        for r in &p.references {
            crate::navsignal::parse_modulation(&r.modulation)
                .map_err(|e| crate::terr!("e-rnss-design-bad-profile", e = e))?;
        }
        for s in &p.signals {
            SignalDesign::from_cfg(s)
                .map_err(|e| crate::terr!("e-rnss-design-bad-profile", e = e))?;
        }
        Ok(p)
    }
}

/// A compiled-in profile by name.
pub fn profile(name: &str) -> Result<Profile, String> {
    let (_, text) = PROFILES.iter().find(|(n, _)| *n == name).ok_or_else(|| {
        crate::terr!(
            "e-rnss-design-unknown-profile",
            name = name.to_string(),
            names = PROFILES.iter().map(|p| p.0).collect::<Vec<_>>().join(", ")
        )
    })?;
    Profile::from_toml(text)
}

// ───────────────────────────── spectra ─────────────────────────────

/// The unit-area (over all frequencies) PSD of a whole signal at offset `f` from its carrier:
/// the power-share sum of its components, FDMA offsets included.
fn psd_total(sig: &SignalDesign, f: f64) -> f64 {
    sig.components.iter().map(|c| c.share * c.psd(f)).sum()
}

/// `∫_{−B/2}^{B/2} g(f) df` by composite Simpson with panels sized to `lobe_hz`.
fn integral(band_hz: f64, lobe_hz: f64, g: impl Fn(f64) -> f64) -> f64 {
    let half = band_hz / 2.0;
    simpson(-half, half, panels_for(band_hz, lobe_hz).max(2000), g)
}

/// Per-signal figures over the receiver band.
#[derive(Clone, Debug, Serialize)]
pub struct SignalFigures {
    /// Signal name.
    pub name: String,
    /// Modulation labels of the components.
    pub modulations: Vec<String>,
    /// Carrier (MHz).
    pub centre_mhz: f64,
    /// Chip rate of the tracked component (Mchip/s).
    pub chip_rate_mcps: Option<f64>,
    /// Receiver band used (MHz).
    pub band_mhz: f64,
    /// In-band power fraction η.
    pub in_band_fraction: f64,
    /// Gabor bandwidth, normalised by the in-band power (MHz).
    pub gabor_mhz: f64,
    /// Gabor bandwidth without that normalisation, `√∫_B f² G df` (MHz).
    pub gabor_unnormalised_mhz: f64,
    /// Self SSC (dB/Hz).
    pub self_ssc_db_hz: f64,
    /// SSC against each reference signal (dB/Hz; −inf when the bands do not overlap).
    pub ssc_references_db_hz: Vec<(String, f64)>,
    /// SSC of this signal into each overlapping GNSS signal of the crate (dB/Hz).
    pub ssc_into_gnss_db_hz: Vec<(String, f64)>,
    /// Code jitter of the tracked component at the stated C/N₀ (m, 1σ).
    pub code_jitter_m: Option<f64>,
    /// PSD samples across the band: `(offset MHz, dB/Hz)`.
    pub psd_db_hz: Vec<(f64, f64)>,
}

fn mode(s: &RunSettings) -> EarlyLate {
    if s.discriminator == "coherent" {
        EarlyLate::Coherent
    } else {
        EarlyLate::NonCoherent
    }
}

fn db(x: f64) -> f64 {
    if x > 0.0 {
        10.0 * x.log10()
    } else {
        f64::NEG_INFINITY
    }
}

/// Settings of a run.
#[derive(Clone, Debug, Serialize)]
pub struct RunSettings {
    /// Receiver band for the spectral figures (MHz).
    pub band_mhz: f64,
    /// C/N₀ for the code jitter (dB-Hz).
    pub cn0_dbhz: f64,
    /// Early-late spacing (chips).
    pub spacing_chips: f64,
    /// DLL loop bandwidth (Hz).
    pub loop_bw_hz: f64,
    /// Predetection integration (s).
    pub integ_s: f64,
    /// `non-coherent` (early-minus-late power, with its squaring loss) or `coherent`.
    pub discriminator: String,
    /// Carrier-phase noise for the RTK settings (m, 1σ, undifferenced).
    pub phase_sigma_m: f64,
    /// GPS carriers added to the RTK settings (`l1`, `l2`, `l5`).
    pub with_gps: Vec<String>,
    /// PSD samples.
    pub psd_points: usize,
}

impl Default for RunSettings {
    fn default() -> Self {
        RunSettings {
            band_mhz: 16.5,
            cn0_dbhz: 40.0,
            spacing_chips: 0.1,
            loop_bw_hz: 0.1,
            integ_s: 0.02,
            discriminator: "non-coherent".into(),
            phase_sigma_m: 0.003,
            with_gps: vec!["l1".into(), "l5".into()],
            psd_points: 201,
        }
    }
}

/// The figures of one signal.
pub fn figures(
    cfg: &SignalCfg,
    refs: &[ReferenceSignal],
    s: &RunSettings,
) -> Result<SignalFigures, String> {
    let sig = SignalDesign::from_cfg(cfg)?;
    let b = s.band_mhz * 1e6;
    let lobe = sig.lobe_hz();
    let g = |f: f64| psd_total(&sig, f);
    let eta = integral(b, lobe, g);
    let m2 = integral(b, lobe, |f| f * f * g(f));
    let self_ssc = integral(b, lobe, |f| g(f) * g(f));
    let mut ssc_refs = Vec::new();
    for r in refs {
        let m: Modulation = crate::navsignal::parse_modulation(&r.modulation)?;
        let off = (r.centre_mhz - cfg.centre_mhz) * 1e6;
        let lob = lobe.min(crate::leo_signal::Shape::Mod(m).lobe_hz());
        let k = integral(b, lob, |f| g(f) * m.psd(f - off));
        ssc_refs.push((r.name.clone(), db(k)));
    }
    let eta_tx = sig.in_band_fraction();
    let mut into_gnss = Vec::new();
    for v in leo_signal::GNSS_VICTIM_NAMES {
        if let Some(victim) = leo_signal::gnss_victim(v) {
            let k = leo_signal::ssc_leo_into_gnss(&sig, eta_tx, &victim);
            if k > 0.0 {
                into_gnss.push((v.to_string(), db(k)));
            }
        }
    }
    let jitter = sig.tracked_index().and_then(|i| {
        leo_signal::code_jitter_m(
            &sig,
            i,
            eta_tx,
            s.cn0_dbhz,
            s.spacing_chips,
            s.loop_bw_hz,
            s.integ_s,
            mode(s),
        )
    });
    let n = s.psd_points.max(3);
    let psd = (0..n)
        .map(|k| {
            let f = -b / 2.0 + b * k as f64 / (n - 1) as f64;
            (f / 1e6, db(g(f)))
        })
        .collect();
    Ok(SignalFigures {
        name: cfg.name.clone(),
        modulations: sig.components.iter().map(|c| c.shape.label()).collect(),
        centre_mhz: cfg.centre_mhz,
        chip_rate_mcps: sig
            .tracked_index()
            .and_then(|i| sig.components[i].shape.chip_rate_hz())
            .map(|r| r / 1e6),
        band_mhz: s.band_mhz,
        in_band_fraction: eta,
        gabor_mhz: (m2 / eta.max(1e-300)).sqrt() / 1e6,
        gabor_unnormalised_mhz: m2.sqrt() / 1e6,
        self_ssc_db_hz: db(self_ssc),
        ssc_references_db_hz: ssc_refs,
        ssc_into_gnss_db_hz: into_gnss,
        code_jitter_m: jitter,
        psd_db_hz: psd,
    })
}

// ───────────────────────────── multi-band RTK ─────────────────────────────

/// GPS carriers that can be added (IS-GPS-200, IS-GPS-705): `(id, MHz, modulation)`.
pub const GPS_CARRIERS: &[(&str, f64, &str)] = &[
    ("l1", 1575.42, "BPSK(1)"),
    ("l2", 1227.60, "BPSK(1)"),
    ("l5", 1176.45, "BPSK(10)"),
];

/// The cascade for a set of carriers `(id, MHz)`: the closest pair first, then by the next
/// longest wide lane that joins a carrier not yet in, then the highest-frequency carrier alone.
pub fn cascade(carriers: &[(String, f64)]) -> Vec<Vec<String>> {
    let n = carriers.len();
    if n == 0 {
        return Vec::new();
    }
    let mut pairs: Vec<(f64, usize, usize)> = Vec::new();
    for i in 0..n {
        for j in i + 1..n {
            pairs.push(((carriers[i].1 - carriers[j].1).abs(), i, j));
        }
    }
    pairs.sort_by(|a, b| a.0.total_cmp(&b.0));
    let mut joined = vec![false; n];
    let mut stages = Vec::new();
    while joined.iter().filter(|j| **j).count() < n && n > 1 {
        let next = pairs.iter().find(|(_, i, j)| {
            let any = joined.iter().any(|x| *x);
            (!any && !joined[*i] && !joined[*j]) || (any && (joined[*i] ^ joined[*j]))
        });
        let Some(&(_, i, j)) = next else { break };
        joined[i] = true;
        joined[j] = true;
        stages.push(vec![carriers[i].0.clone(), carriers[j].0.clone()]);
    }
    let top = carriers
        .iter()
        .max_by(|a, b| a.1.total_cmp(&b.1))
        .map(|c| c.0.clone())
        .unwrap_or_default();
    stages.push(vec![top]);
    stages
}

/// The RTK settings for a profile: one case with the profile's distinct carriers and the
/// requested GPS carriers.
pub fn rtk_settings(p: &Profile, s: &RunSettings) -> Result<rtk_ar::ArInput, String> {
    let mut carriers: Vec<rtk_ar::Carrier> = Vec::new();
    let mut seen: Vec<f64> = Vec::new();
    for cfg in &p.signals {
        if seen.iter().any(|f| (f - cfg.centre_mhz).abs() < 1e-6) {
            continue;
        }
        let sig = SignalDesign::from_cfg(cfg)?;
        let code = sig
            .tracked_index()
            .and_then(|i| {
                leo_signal::code_jitter_m(
                    &sig,
                    i,
                    sig.in_band_fraction(),
                    s.cn0_dbhz,
                    s.spacing_chips,
                    s.loop_bw_hz,
                    s.integ_s,
                    mode(s),
                )
            })
            .unwrap_or(1.0);
        seen.push(cfg.centre_mhz);
        carriers.push(rtk_ar::Carrier {
            id: cfg.name.clone(),
            f_mhz: cfg.centre_mhz,
            code_sigma_m: code,
            phase_sigma_m: s.phase_sigma_m,
        });
    }
    for g in &s.with_gps {
        let Some((id, f, m)) = GPS_CARRIERS.iter().find(|c| c.0 == g.as_str()) else {
            return Err(crate::terr!("e-rnss-design-unknown-gps", name = g.clone()));
        };
        let cfg: SignalCfg = toml::from_str(&format!(
            "name = \"gps-{id}\"\nsource = \"PUBLIC\"\ncentre_mhz = {f}\ntx_bandwidth_mhz = 24\nallocation = \"rnss\"\n[[components]]\nrole = \"data\"\nmodulation = \"{m}\"\n"
        ))
        .map_err(|e| e.to_string())?;
        let sig = SignalDesign::from_cfg(&cfg)?;
        let code = leo_signal::code_jitter_m(
            &sig,
            0,
            sig.in_band_fraction(),
            s.cn0_dbhz,
            s.spacing_chips,
            s.loop_bw_hz,
            s.integ_s,
            mode(s),
        )
        .unwrap_or(1.0);
        carriers.push(rtk_ar::Carrier {
            id: format!("gps-{id}"),
            f_mhz: *f,
            code_sigma_m: code,
            phase_sigma_m: s.phase_sigma_m,
        });
    }
    let ids: Vec<(String, f64)> = carriers.iter().map(|c| (c.id.clone(), c.f_mhz)).collect();
    Ok(rtk_ar::ArInput {
        cases: vec![rtk_ar::ArCase {
            id: p.profile.name.clone(),
            stages: cascade(&ids),
            carriers,
        }],
        double_difference: true,
        epochs: 1,
        satellites: 8,
        dd_iono_m: 0.0,
        iono_ref_mhz: 1575.42,
    })
}

// ───────────────────────────── the run ─────────────────────────────

/// A run report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// [`REPORT_FORMAT`].
    pub format: &'static str,
    /// Always `MODELLED`.
    pub evidence: &'static str,
    /// The profile's header (status, citation, disclaimer).
    pub profile: ProfileMeta,
    /// Settings.
    pub settings: RunSettings,
    /// Per-signal figures.
    pub signals: Vec<SignalFigures>,
    /// The `rtk_ar` input built from the carriers.
    pub rtk_settings: rtk_ar::ArInput,
    /// What `rtk_ar` gives for it.
    pub rtk_result: Option<rtk_ar::ArReport>,
}

/// Run a profile.
pub fn run(p: &Profile, s: &RunSettings) -> Result<Report, String> {
    if !(s.band_mhz.is_finite() && s.band_mhz > 0.0 && s.band_mhz <= 1000.0) {
        return Err(crate::terr!(
            "e-rnss-design-bad-number",
            option = "--band-mhz".to_string(),
            value = s.band_mhz.to_string()
        ));
    }
    let signals = p
        .signals
        .iter()
        .map(|c| figures(c, &p.references, s))
        .collect::<Result<Vec<_>, _>>()?;
    let rtk = rtk_settings(p, s)?;
    let result = if rtk.cases[0].carriers.len() >= 2 {
        Some(rtk_ar::run(&rtk)?)
    } else {
        None
    };
    Ok(Report {
        format: REPORT_FORMAT,
        evidence: "MODELLED",
        profile: p.profile.clone(),
        settings: s.clone(),
        signals,
        rtk_settings: rtk,
        rtk_result: result,
    })
}

// ───────────────────────────── command line ─────────────────────────────

fn usage() -> String {
    crate::t!("rnss-design-usage")
}

/// `kshana rnss-design profiles` and `kshana rnss-design run <profile|file.toml> [options]`.
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
    match args.first().map(String::as_str) {
        Some("profiles") => {
            for (n, _) in PROFILES {
                println!("{n}");
            }
            Ok(())
        }
        Some("run") => {
            let mut s = RunSettings::default();
            let (mut target, mut out) = (None, None);
            let mut i = 1;
            let num = |args: &[String], i: &mut usize| -> Result<f64, String> {
                *i += 1;
                let opt = args[*i - 1].clone();
                let v = args.get(*i).ok_or_else(|| {
                    crate::terr!("e-rnss-design-missing-value", option = opt.clone())
                })?;
                v.parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite())
                    .ok_or_else(|| {
                        crate::terr!("e-rnss-design-bad-number", option = opt, value = v.clone())
                    })
            };
            while i < args.len() {
                match args[i].as_str() {
                    "--band-mhz" => s.band_mhz = num(args, &mut i)?,
                    "--cn0" => s.cn0_dbhz = num(args, &mut i)?,
                    "--phase-sigma-m" => s.phase_sigma_m = num(args, &mut i)?,
                    "--discriminator" => {
                        i += 1;
                        let v = args.get(i).cloned().ok_or_else(|| {
                            crate::terr!(
                                "e-rnss-design-missing-value",
                                option = "--discriminator".to_string()
                            )
                        })?;
                        if v != "coherent" && v != "non-coherent" {
                            return Err(crate::terr!(
                                "e-rnss-design-bad-number",
                                option = "--discriminator".to_string(),
                                value = v
                            ));
                        }
                        s.discriminator = v;
                    }
                    "--with-gps" => {
                        i += 1;
                        let v = args.get(i).ok_or_else(|| {
                            crate::terr!(
                                "e-rnss-design-missing-value",
                                option = "--with-gps".to_string()
                            )
                        })?;
                        s.with_gps = if v == "none" {
                            Vec::new()
                        } else {
                            v.split(',')
                                .map(|x| x.trim().to_ascii_lowercase())
                                .collect()
                        };
                    }
                    "--out" => {
                        i += 1;
                        out = Some(args.get(i).cloned().ok_or_else(|| {
                            crate::terr!(
                                "e-rnss-design-missing-value",
                                option = "--out".to_string()
                            )
                        })?);
                    }
                    a if !a.starts_with('-') && target.is_none() => target = Some(a.to_string()),
                    a => {
                        return Err(format!(
                            "{}\n\n{}",
                            crate::terr!("e-rnss-design-unknown-option", option = a.to_string()),
                            usage()
                        ))
                    }
                }
                i += 1;
            }
            let Some(target) = target else {
                return Err(usage());
            };
            let p = if PROFILES.iter().any(|(n, _)| *n == target) {
                profile(&target)?
            } else {
                let text = std::fs::read_to_string(&target).map_err(|e| {
                    crate::terr!("e-rnss-design-cannot-read", path = target.clone(), e = e)
                })?;
                Profile::from_toml(&text)?
            };
            let rep = run(&p, &s)?;
            let json = serde_json::to_string_pretty(&rep).map_err(|e| e.to_string())?;
            match out {
                Some(path) => std::fs::write(&path, json + "\n")
                    .map_err(|e| crate::terr!("e-rnss-design-cannot-write", path = path, e = e)),
                None => {
                    println!("{json}");
                    Ok(())
                }
            }
        }
        Some("--help" | "-h") => {
            println!("{}", usage());
            Ok(())
        }
        _ => Err(usage()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn cascade_takes_the_closest_pair_first_and_ends_on_the_highest_carrier() {
        let c = vec![
            ("l1".to_string(), 1575.42),
            ("l2".to_string(), 1227.60),
            ("l5".to_string(), 1176.45),
        ];
        assert_eq!(
            cascade(&c),
            vec![
                vec!["l2".to_string(), "l5".to_string()],
                vec!["l1".to_string(), "l2".to_string()],
                vec!["l1".to_string()]
            ]
        );
        assert_eq!(cascade(&c[..1]), vec![vec!["l1".to_string()]]);
    }
}
