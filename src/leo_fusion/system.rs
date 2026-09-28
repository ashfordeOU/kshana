// SPDX-License-Identifier: AGPL-3.0-only
//! A navigation system as the fusion pack uses it: a constellation, one signal, and an error
//! model, built from a scenario's `[[system]]` table.
//!
//! A system's satellites come from a GNSS preset of [`crate::constellation`] (`preset`), a
//! LEO preset of [`super::presets`] (`leo_preset`), Walker shells and explicit element sets,
//! or any mix. Its signal is a carrier and, for ranging, a chip rate; its C/N0 runs from a low
//! value at the elevation mask to a high value at the zenith, linearly in the sine of the
//! elevation (a modelling choice: a real pass envelope depends on the transmit antenna
//! pattern). The pseudorange one-sigma is the delay-lock-loop thermal noise at that C/N0
//! ([`super::joint_pvt::code_sigma_dll_m`]) combined with the signal-in-space range error
//! (SISRE), unless the scenario gives a fixed `sigma_pr_m`; the range-rate one-sigma is the
//! wavelength times the Doppler one-sigma.
//!
//! Every value can be given inline; a preset only fills what the scenario leaves out.

use super::geom::{build_orbits, EarthOrbit, DEG};
use super::joint_pvt::{code_sigma_dll_m, SystemClock};
use crate::constellation::{ConstellationCfg, SatelliteCfg, ShellCfg, WalkerPattern};
use serde::{Deserialize, Serialize};

/// One `[[system]]` table.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SystemCfg {
    /// Name used in the report.
    pub name: String,
    /// `gnss` (medium Earth orbit navigation system) or `leo`. Default: `leo` when a
    /// `leo_preset` is given or every satellite is below 3000 km, else `gnss`.
    #[serde(default)]
    pub role: Option<String>,
    /// A GNSS constellation preset of the `constellation-design` kind (`gps-baseline`,
    /// `galileo`, `beidou-meo`, `glonass`, ...).
    #[serde(default)]
    pub preset: Option<String>,
    /// A LEO preset of this pack (`xona-pulsar`, `iridium-stl`, `starlink-sop`, ...).
    #[serde(default)]
    pub leo_preset: Option<String>,
    /// Signal of the LEO preset (default: its first).
    #[serde(default)]
    pub signal: Option<String>,
    /// An ephemeris-and-clock preset whose range error replaces the system's
    /// (`atomic-zero-clock`).
    #[serde(default)]
    pub ephemeris_preset: Option<String>,
    /// Walker shells, added to any preset satellites.
    #[serde(default)]
    pub shell: Vec<ShellCfg>,
    /// Explicit satellites, added to any preset satellites.
    #[serde(default)]
    pub satellite: Vec<SatelliteCfg>,
    /// Carrier frequency (Hz).
    #[serde(default)]
    pub carrier_hz: Option<f64>,
    /// Code chip rate (chip/s).
    #[serde(default)]
    pub chip_rate_hz: Option<f64>,
    /// C/N0 at the mask and at the zenith (dB-Hz).
    #[serde(default)]
    pub cn0_dbhz: Option<[f64; 2]>,
    /// A fixed pseudorange one-sigma (m) replacing the loop-noise-plus-SISRE model.
    #[serde(default)]
    pub sigma_pr_m: Option<f64>,
    /// Signal-in-space range error of orbit and clock, one sigma (m).
    #[serde(default)]
    pub sisre_m: Option<f64>,
    /// Doppler one-sigma (Hz).
    #[serde(default)]
    pub sigma_doppler_hz: Option<f64>,
    /// No usable code ranging: the system gives range rate only.
    #[serde(default)]
    pub doppler_only: Option<bool>,
    /// `estimated` (own receiver clock, the inter-system bias is solved for) or `known`
    /// (on the reference time scale, the offset broadcast and removed).
    #[serde(default)]
    pub clock: Option<String>,
    /// True inter-system bias of this system's time scale against the receiver's reference
    /// (ns) used to simulate measurements. Default 0.
    #[serde(default)]
    pub isb_ns: Option<f64>,
    /// Elevation mask (deg). Default 10 for LEO, 5 for GNSS.
    #[serde(default)]
    pub mask_deg: Option<f64>,
    /// Secular J2 drift of the orbits. Default true.
    #[serde(default)]
    pub j2: Option<bool>,
}

/// Delay-lock-loop parameters shared by every system of a run.
#[derive(Clone, Copy, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct DllCfg {
    /// Code loop noise bandwidth (Hz). Default 0.5.
    #[serde(default = "d_bl")]
    pub loop_bw_hz: f64,
    /// Early-late correlator spacing (chips). Default 0.5.
    #[serde(default = "d_spacing")]
    pub spacing_chips: f64,
    /// Coherent integration time (s). Default 0.02.
    #[serde(default = "d_tcoh")]
    pub t_coh_s: f64,
}

fn d_bl() -> f64 {
    0.5
}
fn d_spacing() -> f64 {
    0.5
}
fn d_tcoh() -> f64 {
    0.02
}

impl Default for DllCfg {
    fn default() -> Self {
        Self {
            loop_bw_hz: d_bl(),
            spacing_chips: d_spacing(),
            t_coh_s: d_tcoh(),
        }
    }
}

/// A built system.
#[derive(Clone, Debug, Serialize)]
pub struct System {
    /// Name.
    pub name: String,
    /// `gnss` or `leo`.
    pub role: String,
    /// Preset ids used, if any.
    pub presets: Vec<String>,
    /// Satellites.
    #[serde(skip)]
    pub orbits: Vec<EarthOrbit>,
    /// Number of satellites.
    pub n_satellites: usize,
    /// Mean altitude (m).
    pub mean_altitude_m: f64,
    /// Carrier (Hz).
    pub carrier_hz: f64,
    /// Chip rate (chip/s), `None` for Doppler only.
    pub chip_rate_hz: Option<f64>,
    /// C/N0 at the mask and zenith (dB-Hz).
    pub cn0_dbhz: [f64; 2],
    /// Fixed pseudorange sigma, if given (m).
    pub sigma_pr_fixed_m: Option<f64>,
    /// SISRE (m).
    pub sisre_m: f64,
    /// Doppler sigma (Hz).
    pub sigma_doppler_hz: f64,
    /// Doppler only.
    pub doppler_only: bool,
    /// Clock model.
    pub clock: SystemClock,
    /// True inter-system bias used in simulation (m).
    pub isb_m: f64,
    /// Elevation mask (rad).
    pub mask_rad: f64,
}

impl System {
    /// Carrier wavelength (m).
    pub fn wavelength_m(&self) -> f64 {
        super::C_LIGHT / self.carrier_hz
    }

    /// C/N0 at elevation `el` (rad), linear in `sin(el)` from the mask to the zenith.
    pub fn cn0_at(&self, el: f64) -> f64 {
        let s0 = self.mask_rad.sin();
        let f = ((el.sin() - s0) / (1.0 - s0).max(1e-9)).clamp(0.0, 1.0);
        self.cn0_dbhz[0] + (self.cn0_dbhz[1] - self.cn0_dbhz[0]) * f
    }

    /// Pseudorange one-sigma at elevation `el` (m).
    pub fn sigma_pr_m(&self, el: f64, dll: &DllCfg) -> f64 {
        if let Some(s) = self.sigma_pr_fixed_m {
            return s;
        }
        let code = match self.chip_rate_hz {
            Some(rc) => code_sigma_dll_m(
                self.cn0_at(el),
                rc,
                dll.loop_bw_hz,
                dll.spacing_chips,
                dll.t_coh_s,
            ),
            None => f64::INFINITY,
        };
        (code * code + self.sisre_m * self.sisre_m).sqrt()
    }

    /// Range-rate one-sigma (m/s).
    pub fn sigma_rr_mps(&self) -> f64 {
        self.sigma_doppler_hz * self.wavelength_m()
    }
}

fn walker_from_preset(p: &super::presets::PresetShell) -> ShellCfg {
    ShellCfg {
        pattern: if p.pattern == "star" {
            WalkerPattern::Star
        } else {
            WalkerPattern::Delta
        },
        total: p.total,
        planes: p.planes,
        phasing: p.phasing,
        altitude_km: Some(p.altitude_km),
        semi_major_axis_km: None,
        eccentricity: 0.0,
        inclination_deg: p.inclination_deg,
        raan0_deg: 0.0,
        argp_deg: 0.0,
        mean_anomaly0_deg: 0.0,
    }
}

impl SystemCfg {
    /// Build the system, filling unset values from the presets and then from defaults.
    pub fn build(&self) -> Result<System, String> {
        let mut presets = Vec::new();
        let leo = match &self.leo_preset {
            Some(id) => {
                let p = super::presets::by_id(id)?;
                presets.push(p.id.to_string());
                Some(p)
            }
            None => None,
        };
        let sig = match leo {
            Some(p) if !p.signals.is_empty() => Some(p.signal(self.signal.as_deref())?),
            Some(p) if self.signal.is_some() => {
                return Err(format!("preset {} carries no signal", p.id))
            }
            _ => None,
        };
        let mut shells: Vec<ShellCfg> = Vec::new();
        if self.shell.is_empty() && self.satellite.is_empty() {
            if let Some(p) = leo {
                shells.extend(p.shells.iter().map(walker_from_preset));
            }
        }
        shells.extend(self.shell.iter().cloned());
        let cfg = ConstellationCfg {
            name: self.name.clone(),
            preset: self.preset.clone(),
            expanded: None,
            shell: shells,
            satellite: self.satellite.clone(),
        };
        if let Some(p) = &self.preset {
            presets.push(p.clone());
        }
        let orbits = build_orbits(&cfg, self.j2.unwrap_or(true))?;
        let mean_alt = orbits
            .iter()
            .map(|o| o.a - super::geom::RE_EARTH)
            .sum::<f64>()
            / orbits.len() as f64;
        let role = match self.role.as_deref() {
            Some("gnss") => "gnss",
            Some("leo") => "leo",
            Some(r) => {
                return Err(format!(
                    "system {:?}: role must be gnss or leo, got {r:?}",
                    self.name
                ))
            }
            None if leo.is_some() || mean_alt < 3.0e6 => "leo",
            None => "gnss",
        }
        .to_string();
        let is_leo = role == "leo";
        let carrier_hz = self
            .carrier_hz
            .or(sig.map(|s| s.carrier_hz))
            .unwrap_or(1_575.42e6);
        let chip_rate_hz = match self.chip_rate_hz {
            Some(r) => Some(r),
            None => match sig {
                Some(s) => s.chip_rate_hz,
                None => Some(1.023e6),
            },
        };
        let t_sys = 290.0;
        let cn0 = match self.cn0_dbhz {
            Some(c) => c,
            None => match sig.and_then(|s| super::presets::cn0_range_dbhz(s, t_sys)) {
                Some((lo, hi)) => [lo, hi],
                None => [38.0, 48.0],
            },
        };
        let mut sisre = self.sisre_m.or(leo.map(|p| p.sisre_m)).unwrap_or(0.6);
        if let Some(e) = &self.ephemeris_preset {
            let p = super::presets::by_id(e)?;
            presets.push(p.id.to_string());
            if self.sisre_m.is_none() {
                sisre = p.sisre_m;
            }
        }
        let doppler_only = self
            .doppler_only
            .or(leo.map(|p| p.doppler_only))
            .unwrap_or(false);
        let sigma_doppler_hz = self
            .sigma_doppler_hz
            .or(leo.and_then(|p| p.sigma_doppler_hz))
            .unwrap_or(0.5);
        let clock = match self.clock.as_deref().unwrap_or("estimated") {
            "estimated" => SystemClock::Estimated,
            "known" => SystemClock::Known(0.0),
            c => {
                return Err(format!(
                    "system {:?}: clock must be estimated or known, got {c:?}",
                    self.name
                ))
            }
        };
        let mask = self.mask_deg.unwrap_or(if is_leo { 10.0 } else { 5.0 });
        for (what, v) in [
            ("carrier_hz", carrier_hz),
            ("sisre_m", sisre),
            ("sigma_doppler_hz", sigma_doppler_hz),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(format!("system {:?}: {what} must be positive", self.name));
            }
        }
        if !(0.0..90.0).contains(&mask) {
            return Err(format!(
                "system {:?}: mask_deg must be in [0, 90)",
                self.name
            ));
        }
        if let Some(s) = self.sigma_pr_m {
            if !(s.is_finite() && s > 0.0) {
                return Err(format!(
                    "system {:?}: sigma_pr_m must be positive",
                    self.name
                ));
            }
        }
        Ok(System {
            name: self.name.clone(),
            role,
            presets,
            n_satellites: orbits.len(),
            mean_altitude_m: mean_alt,
            orbits,
            carrier_hz,
            chip_rate_hz: if doppler_only { None } else { chip_rate_hz },
            cn0_dbhz: cn0,
            sigma_pr_fixed_m: self.sigma_pr_m,
            sisre_m: sisre,
            sigma_doppler_hz,
            doppler_only,
            clock,
            isb_m: self.isb_ns.unwrap_or(0.0) * 1e-9 * super::C_LIGHT,
            mask_rad: mask * DEG,
        })
    }
}

/// Build every system of a run; at least one is required.
pub fn build_all(cfgs: &[SystemCfg]) -> Result<Vec<System>, String> {
    if cfgs.is_empty() {
        return Err("give at least one [[system]]".into());
    }
    cfgs.iter().map(|c| c.build()).collect()
}

/// A satellite in view.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct InView {
    /// Index of the system.
    pub system: usize,
    /// Index of the satellite within the system.
    pub sat: usize,
    /// ECEF position (m).
    pub pos: [f64; 3],
    /// ECEF velocity (m/s).
    pub vel: [f64; 3],
    /// Elevation (rad).
    pub el: f64,
}

/// Satellites of every system above that system's mask, seen from `user` (ECEF) with local
/// up `up` at time `t`.
pub fn in_view(systems: &[System], user: [f64; 3], up: [f64; 3], t: f64) -> Vec<InView> {
    let mut out = Vec::new();
    for (k, s) in systems.iter().enumerate() {
        for (j, o) in s.orbits.iter().enumerate() {
            let (pos, vel) = o.state(t);
            let el = super::geom::elevation(user, up, pos);
            if el >= s.mask_rad {
                out.push(InView {
                    system: k,
                    sat: j,
                    pos,
                    vel,
                    el,
                });
            }
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_preset_fills_what_the_scenario_leaves_out() {
        let cfg: SystemCfg = toml::from_str(
            "name = \"X\"\nleo_preset = \"xona-pulsar\"\nsignal = \"X5\"\nsisre_m = 0.1\n",
        )
        .unwrap();
        let s = cfg.build().unwrap();
        assert_eq!(s.role, "leo");
        assert_eq!(s.n_satellites, 258);
        assert!((s.carrier_hz - 1_190.516_25e6).abs() < 1.0);
        assert_eq!(s.chip_rate_hz, Some(10.23e6));
        assert!((s.sisre_m - 0.1).abs() < 1e-12);
        // C/N0 from -144.9 dBW over kT at 290 K.
        assert!((s.cn0_dbhz[0] - 59.075).abs() < 0.01, "{:?}", s.cn0_dbhz);
    }

    #[test]
    fn a_system_needs_no_preset() {
        let cfg: SystemCfg = toml::from_str(
            "name = \"Any\"\ncarrier_hz = 2.0e9\nchip_rate_hz = 5.115e6\n\
             [[shell]]\ntotal = 40\nplanes = 5\nphasing = 1\naltitude_km = 700.0\ninclination_deg = 70.0\n",
        )
        .unwrap();
        let s = cfg.build().unwrap();
        assert_eq!(s.role, "leo");
        assert_eq!(s.n_satellites, 40);
        assert!(s.presets.is_empty());
        let g: SystemCfg = toml::from_str("name = \"GPS\"\npreset = \"gps-baseline\"\n").unwrap();
        assert_eq!(g.build().unwrap().role, "gnss");
    }

    #[test]
    fn pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre() {
        let cfg: SystemCfg =
            toml::from_str("name = \"X\"\nleo_preset = \"xona-pulsar\"\n").unwrap();
        let s = cfg.build().unwrap();
        let dll = DllCfg::default();
        let lo = s.sigma_pr_m(10.0 * DEG, &dll);
        let hi = s.sigma_pr_m(90.0 * DEG, &dll);
        assert!(lo > hi && hi >= s.sisre_m);
    }
}
