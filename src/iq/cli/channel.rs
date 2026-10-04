// SPDX-License-Identifier: AGPL-3.0-only
//! Propagation-channel flags for `kshana iq scene`, shared by the CLI and the Python
//! binding.
//!
//! [`ChannelParams`] collects the channel knobs (ionosphere, troposphere, scintillation,
//! multipath, land-mobile, non-line-of-sight) as plain values; [`build_channel`] turns them
//! into a [`crate::iq::scene::SceneChannel`] through the channel-model bridge
//! ([`crate::iq::channel::SceneChannelAdapter`]). The scene applies the returned channel to
//! every satellite. The parsing mirrors the rest of the `iq` CLI: `--key value` options and
//! value-less switches.

use super::{Args, Fail};
use crate::gnss_sim::{KlobucharCoeffs, Meteo};
use crate::iq::channel::iono::{IonoSource, Ionosphere};
use crate::iq::channel::land_mobile::{LandMobile, LandMobileParams};
use crate::iq::channel::multipath::{Ground, GroundReflector};
use crate::iq::channel::scint::{ScintParams, Scintillation};
use crate::iq::channel::tropo::Troposphere;
use crate::iq::channel::SceneChannelAdapter;
use crate::iq::scene::SceneChannel;

/// The propagation channel a scene applies, collected from the CLI or Python surface.
#[derive(Clone, Debug)]
pub(crate) struct ChannelParams {
    /// Fixed slant TEC (TECU); drives a first-order ionosphere.
    pub(crate) iono_stec_tecu: Option<f64>,
    /// Vertical TEC (TECU) mapped to slant with a 350 km thin shell.
    pub(crate) iono_vtec_tecu: Option<f64>,
    /// Use the broadcast Klobuchar model with default coefficients.
    pub(crate) iono_klobuchar: bool,
    /// Apply the Saastamoinen/Niell troposphere.
    pub(crate) tropo: bool,
    /// Day of year for the troposphere's seasonal term.
    pub(crate) tropo_doy: f64,
    /// Amplitude scintillation index S4 (0..=1).
    pub(crate) s4: Option<f64>,
    /// Scintillation decorrelation time τ0 (s).
    pub(crate) scint_tau0_s: f64,
    /// Extra phase-scintillation standard deviation σφ (rad).
    pub(crate) sigma_phi_rad: f64,
    /// Antenna height above a specular ground reflector (m); enables multipath.
    pub(crate) multipath_height_m: Option<f64>,
    /// Ground type for the reflector: `dry`, `wet` or `sea`.
    pub(crate) multipath_ground: String,
    /// Apply the three-state land-mobile statistical channel.
    pub(crate) land_mobile: bool,
    /// Block the direct path (non-line-of-sight); only meaningful with multipath or
    /// land-mobile.
    pub(crate) nlos: bool,
}

impl Default for ChannelParams {
    fn default() -> Self {
        Self {
            iono_stec_tecu: None,
            iono_vtec_tecu: None,
            iono_klobuchar: false,
            tropo: false,
            tropo_doy: 180.0,
            s4: None,
            scint_tau0_s: 1.0,
            sigma_phi_rad: 0.0,
            multipath_height_m: None,
            multipath_ground: "dry".to_string(),
            land_mobile: false,
            nlos: false,
        }
    }
}

/// The switch names the channel flags add to `iq scene`.
pub(crate) const CHANNEL_SWITCHES: &[&str] = &["--iono-klobuchar", "--tropo", "--land-mobile", "--nlos"];

impl ChannelParams {
    /// Parse the channel flags out of already-parsed [`Args`].
    pub(crate) fn from_args(a: &Args) -> Result<Self, Fail> {
        let mut p = ChannelParams {
            iono_stec_tecu: a.num("--iono-stec").map_err(Fail::Usage)?,
            iono_vtec_tecu: a.num("--iono-vtec").map_err(Fail::Usage)?,
            iono_klobuchar: a.has("--iono-klobuchar"),
            tropo: a.has("--tropo"),
            s4: a.num("--s4").map_err(Fail::Usage)?,
            sigma_phi_rad: a.num("--sigma-phi").map_err(Fail::Usage)?.unwrap_or(0.0),
            multipath_height_m: a.num("--multipath-height").map_err(Fail::Usage)?,
            land_mobile: a.has("--land-mobile"),
            nlos: a.has("--nlos"),
            ..ChannelParams::default()
        };
        if let Some(d) = a.num("--tropo-doy").map_err(Fail::Usage)? {
            p.tropo_doy = d;
        }
        if let Some(t) = a.num("--scint-tau0").map_err(Fail::Usage)? {
            p.scint_tau0_s = t;
        }
        if let Some(g) = a.get("--multipath-ground") {
            p.multipath_ground = g.to_string();
        }
        Ok(p)
    }

    /// Whether any channel knob is set.
    pub(crate) fn any(&self) -> bool {
        self.iono_stec_tecu.is_some()
            || self.iono_vtec_tecu.is_some()
            || self.iono_klobuchar
            || self.tropo
            || self.s4.is_some()
            || self.sigma_phi_rad > 0.0
            || self.multipath_height_m.is_some()
            || self.land_mobile
            || self.nlos
    }

    /// A one-line human description of the applied channel (for the command summary and the
    /// SigMF annotation).
    pub(crate) fn describe(&self) -> String {
        let mut parts: Vec<String> = Vec::new();
        if let Some(t) = self.iono_stec_tecu {
            parts.push(format!("iono slant {t} TECU"));
        }
        if let Some(t) = self.iono_vtec_tecu {
            parts.push(format!("iono vertical {t} TECU"));
        }
        if self.iono_klobuchar {
            parts.push("iono Klobuchar".to_string());
        }
        if self.tropo {
            parts.push(format!("tropo doy {}", self.tropo_doy));
        }
        if self.s4.is_some() || self.sigma_phi_rad > 0.0 {
            parts.push(format!(
                "scint S4={} tau0={}s sigma_phi={}rad",
                self.s4.unwrap_or(0.0),
                self.scint_tau0_s,
                self.sigma_phi_rad
            ));
        }
        if let Some(h) = self.multipath_height_m {
            parts.push(format!("multipath {h}m {} ground", self.multipath_ground));
        }
        if self.land_mobile {
            parts.push("land-mobile".to_string());
        }
        if self.nlos {
            parts.push("NLOS".to_string());
        }
        if parts.is_empty() {
            "direct path".to_string()
        } else {
            parts.join(", ")
        }
    }
}

/// Parse a ground name into a [`Ground`] preset.
fn ground_of(name: &str) -> Result<Ground, String> {
    match name.to_ascii_lowercase().as_str() {
        "dry" => Ok(Ground::DRY),
        "wet" => Ok(Ground::WET),
        "sea" => Ok(Ground::SEA),
        other => Err(format!(
            "--multipath-ground must be dry, wet or sea (got {other:?})"
        )),
    }
}

/// Build the scene channel from `p`, for a signal on `carrier_hz`, seeded with `seed`, when
/// the scene's first sample is at GPS time of week `start_tow_s`. Returns `None` when no
/// channel knob is set (the scene keeps the direct path). Errors on an invalid combination.
pub(crate) fn build_channel(
    p: &ChannelParams,
    carrier_hz: f64,
    seed: u64,
    start_tow_s: f64,
) -> Result<Option<Box<dyn SceneChannel>>, String> {
    if !p.any() {
        return Ok(None);
    }
    let iono_sources = usize::from(p.iono_stec_tecu.is_some())
        + usize::from(p.iono_vtec_tecu.is_some())
        + usize::from(p.iono_klobuchar);
    if iono_sources > 1 {
        return Err(
            "give at most one of --iono-stec, --iono-vtec, --iono-klobuchar".to_string(),
        );
    }
    if p.nlos && p.multipath_height_m.is_none() && !p.land_mobile {
        return Err(
            "--nlos needs a reflected path: add --multipath-height or --land-mobile".to_string(),
        );
    }
    let mut adapter = SceneChannelAdapter::new(carrier_hz);
    if let Some(stec) = p.iono_stec_tecu {
        adapter = adapter.with_iono(Ionosphere::new(IonoSource::SlantTec { stec_tecu: stec }));
    } else if let Some(vtec) = p.iono_vtec_tecu {
        adapter = adapter.with_iono(Ionosphere::new(IonoSource::VerticalTec {
            vtec_tecu: vtec,
            shell_height_km: 350.0,
        }));
    } else if p.iono_klobuchar {
        adapter = adapter.with_iono(Ionosphere::new(IonoSource::Klobuchar {
            coeffs: KlobucharCoeffs::default(),
            gps_sod_at_t0: start_tow_s.rem_euclid(86_400.0),
        }));
    }
    if p.tropo {
        adapter = adapter.with_tropo(Troposphere::new(Meteo::default(), p.tropo_doy));
    }
    if p.s4.is_some() || p.sigma_phi_rad > 0.0 {
        let params = ScintParams {
            s4: p.s4.unwrap_or(0.0),
            tau0_s: p.scint_tau0_s,
            extra_phase_sigma_rad: p.sigma_phi_rad,
        };
        adapter = adapter.with_scint(Scintillation::new(params, seed));
    }
    if let Some(h) = p.multipath_height_m {
        let ground = ground_of(&p.multipath_ground)?;
        adapter = adapter.with_multipath(GroundReflector::new(h, ground));
    }
    if p.land_mobile {
        adapter = adapter.with_land_mobile(LandMobile::new(LandMobileParams::default(), seed));
    }
    adapter = adapter.with_nlos(p.nlos);
    Ok(Some(Box::new(adapter)))
}
