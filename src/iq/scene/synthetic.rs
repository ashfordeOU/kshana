// SPDX-License-Identifier: AGPL-3.0-only
//! The synthetic-profile scene builder: several satellites of one signal on stated range
//! profiles, each with its own Doppler. `kshana iq scene`, the Python `iq_scene` and the
//! short in-memory runs of [`crate::iq::short`] all build their scene here, so the same
//! request gives the same scene on every surface. It lives outside the native-only
//! `iq::cli` because the WebAssembly build uses it too.

use super::{
    NavData, NoiseConfig, RangeProfile, SatGeometry, Scene, SceneConfig, SceneSatellite, T0_K,
};
use crate::iq::signals::by_name::build_code;
use crate::iq::{SampleSpec, SpreadingCode};

/// Everything the scene generator needs, shared by the CLI, the Python binding and
/// the short in-memory runs of [`crate::iq::short`].
pub(crate) struct SceneParams {
    /// Complex sample rate (Hz).
    pub(crate) fs_hz: f64,
    /// Scene length (s).
    pub(crate) duration_s: f64,
    /// Signal name (see [`crate::iq::signals::by_name::SIGNAL_NAMES`]).
    pub(crate) signal: String,
    /// One identifier per satellite (PRN, or GLONASS frequency channel).
    pub(crate) ids: Vec<i64>,
    /// Doppler of each satellite (Hz); a single value applies to all, empty means 0.
    pub(crate) dopplers: Vec<f64>,
    /// Baseband centre frequency (Hz); `None` uses the signal's own carrier.
    pub(crate) center_hz: Option<f64>,
    /// Residual intermediate frequency (Hz).
    pub(crate) if_hz: f64,
    /// Stated C/N0 for every satellite (dB-Hz); `None` uses the elevation default.
    pub(crate) cn0_dbhz: Option<f64>,
    /// Receiver noise figure (dB) used for the thermal noise density.
    pub(crate) noise_figure_db: f64,
    /// Add thermal noise (false gives a noise-free scene).
    pub(crate) noise: bool,
    /// Noise seed.
    pub(crate) seed: u64,
    /// Modulate seeded pseudo-random data at the signal's own symbol timing (false leaves
    /// the code data-free). Refused on pilot components and on signals whose data the scene
    /// does not model.
    pub(crate) data: bool,
    /// Synthesis threads per chunk.
    pub(crate) threads: usize,
}

/// Build a [`Scene`] from `p`. The satellites are spread over distinct ranges (so their
/// code phases differ) at a fixed 45° elevation; each carries the Doppler given for it.
pub(crate) fn build_scene(p: &SceneParams) -> Result<Scene, String> {
    if p.ids.is_empty() {
        return Err("a scene needs at least one satellite (--prn)".into());
    }
    if !p.dopplers.is_empty() && p.dopplers.len() != 1 && p.dopplers.len() != p.ids.len() {
        return Err(format!(
            "--doppler lists {} value(s); give one per --prn ({}) or a single value",
            p.dopplers.len(),
            p.ids.len()
        ));
    }
    let codes = p
        .ids
        .iter()
        .map(|&id| build_code(&p.signal, id))
        .collect::<Result<Vec<_>, _>>()?;
    let center = p.center_hz.unwrap_or_else(|| codes[0].carrier_hz());
    let spec = SampleSpec {
        fs_hz: p.fs_hz,
        center_hz: center,
        if_hz: p.if_hz,
    };
    let mut cfg = SceneConfig::new(spec, p.duration_s);
    cfg.seed = p.seed;
    cfg.threads = p.threads.max(1);
    cfg.noise = if p.noise {
        NoiseConfig::from_noise_figure(p.noise_figure_db, T0_K)
    } else {
        NoiseConfig {
            enabled: false,
            ..NoiseConfig::from_noise_figure(p.noise_figure_db, T0_K)
        }
    };
    let mut scene = Scene::new(cfg).map_err(|e| e.to_string())?;
    for (i, (id, code)) in p.ids.iter().zip(codes).enumerate() {
        let doppler = match p.dopplers.len() {
            0 => 0.0,
            1 => p.dopplers[0],
            _ => p.dopplers[i],
        };
        let lambda = crate::iq::C_M_PER_S / code.carrier_hz();
        let profile = RangeProfile {
            range_m: 2.0e7 + i as f64 * 3.0e5,
            range_rate_mps: -doppler * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        };
        let nav = if p.data {
            NavData::Seeded {
                seed: *id as u64 + 1,
            }
        } else {
            NavData::None
        };
        nav.check_modulation(code.data_modulation())
            .map_err(|e| format!("--data: {} {e}", code.name()))?;
        scene.add_satellite(SceneSatellite {
            id: *id as u32,
            code: Box::new(code),
            geometry: SatGeometry::Profile(profile),
            cn0_dbhz: p.cn0_dbhz,
            nav,
        });
    }
    Ok(scene)
}
