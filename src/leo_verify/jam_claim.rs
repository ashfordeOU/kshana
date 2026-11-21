// SPDX-License-Identifier: AGPL-3.0-only
//! Jamming-resistance claims, quantified: what a stated received-power advantage of a LEO signal over
//! a GNSS signal means in jammer-to-signal ratio (J/S) tolerated and in the free-space radius inside
//! which a stated jammer stops tracking.
//!
//! Per signal, the nominal C/N0 is `S + G − 10 log10(k T)` and the J/S at which tracking reaches the
//! threshold is, from the anti-jam equation `(C/N0)_eff = [1/(C/N0) + (J/S)/(Q R_c)]⁻¹`
//! ([`crate::jamming::effective_cn0_dbhz`]), `(J/S)_max = Q R_c (1/(C/N0)_th − 1/(C/N0))`. The jammer
//! power at the antenna that reaches it is `S + G + (J/S)_max`, and the radius at which a jammer of
//! EIRP `P` delivers that power through a receive gain `G_j` toward it is where the free-space loss
//! ([`crate::jamming::free_space_path_loss_db`]) equals `P + G_j − (S + G + (J/S)_max)`. The radius
//! ratio of two signals is `10^(Δ/20)` for a difference `Δ` dB in jammer power tolerated, and the
//! area ratio its square.
//!
//! A stated J/S tolerance (a vendor figure) is set beside the model's: the row says whether the model
//! reaches it, nothing more. MODELLED: free space is the worst case for the victim (terrain, clutter
//! and the jammer's antenna pattern shrink the radius); the receiver's front end is ideal. The tool
//! computes the effect of interference on a receiver; it neither designs nor locates an emitter.

use super::{list_len, positive, within};
use crate::jamming::{effective_cn0_dbhz, free_space_path_loss_db, noise_density_dbw_per_hz};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// One signal.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct JamSignal {
    /// A short name.
    pub id: String,
    /// Carrier frequency (MHz).
    pub f_mhz: f64,
    /// Minimum received power, isotropic (dBW).
    pub received_power_dbw: f64,
    /// Chip rate of the tracked component (Mchip/s).
    pub chip_rate_mcps: f64,
    /// Tracking threshold (dB-Hz).
    pub threshold_dbhz: f64,
    /// Spectral-separation factor Q of the jammer on this signal (1 for a narrowband jammer, about
    /// 2 for a broadband one); default 1.
    #[serde(default)]
    pub q: Option<f64>,
    /// A stated J/S tolerance to set beside the model (dB).
    #[serde(default)]
    pub stated_js_tolerance_db: Option<f64>,
}

fn d_temp() -> f64 {
    290.0
}

/// Input of `kshana leo-verify jam-claim`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct JamInput {
    /// The signals; the first is the reference for the ratios.
    pub signals: Vec<JamSignal>,
    /// Receive antenna gain toward the satellites (dBi).
    #[serde(default)]
    pub antenna_gain_dbi: f64,
    /// Receive antenna gain toward the jammer (dBi).
    #[serde(default)]
    pub jammer_gain_dbi: f64,
    /// System noise temperature (K).
    #[serde(default = "d_temp")]
    pub noise_temp_k: f64,
    /// Jammer EIRPs to evaluate (dBW).
    pub jammer_eirp_dbw: Vec<f64>,
}

/// One jammer EIRP for one signal.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct RadiusRow {
    /// Jammer EIRP (dBW).
    pub eirp_dbw: f64,
    /// Free-space radius inside which tracking is lost (m); none when the signal is below its
    /// threshold without a jammer.
    pub radius_m: Option<f64>,
}

/// One signal's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct JamRow {
    /// Signal.
    pub signal: String,
    /// Nominal C/N0 (dB-Hz).
    pub cn0_dbhz: f64,
    /// Received power advantage over the reference signal (dB).
    pub power_advantage_db: f64,
    /// J/S at the tracking threshold (dB); none when already below it.
    pub js_tolerance_db: Option<f64>,
    /// Jammer power at the antenna output that reaches the threshold (dBW).
    pub jammer_power_tolerated_dbw: Option<f64>,
    /// Jammer power tolerated over the reference signal's (dB).
    pub tolerance_advantage_db: Option<f64>,
    /// Denial radius over the reference signal's (`10^(−Δ/20)`).
    pub radius_ratio: Option<f64>,
    /// Denial area over the reference signal's.
    pub area_ratio: Option<f64>,
    /// The stated tolerance, when given (dB).
    pub stated_js_tolerance_db: Option<f64>,
    /// Whether the model reaches the stated tolerance.
    pub model_reaches_stated: Option<bool>,
    /// Effective C/N0 at the stated tolerance (dB-Hz).
    pub cn0_at_stated_dbhz: Option<f64>,
    /// Per jammer EIRP.
    pub radii: Vec<RadiusRow>,
}

/// Report of `kshana leo-verify jam-claim`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct JamReport {
    /// Reference signal.
    pub reference: String,
    /// Per signal.
    pub signals: Vec<JamRow>,
}

/// J/S (dB) at which a signal of nominal C/N0 `cn0_dbhz` reaches `threshold_dbhz`, with factor `q`
/// and chip rate `rc_hz`; `None` when the nominal C/N0 is not above the threshold.
pub fn js_at_threshold_db(cn0_dbhz: f64, threshold_dbhz: f64, q: f64, rc_hz: f64) -> Option<f64> {
    let c = 10f64.ppowf(cn0_dbhz / 10.0);
    let th = 10f64.ppowf(threshold_dbhz / 10.0);
    let m = 1.0 / th - 1.0 / c;
    (m > 0.0).then(|| 10.0 * (q * rc_hz * m).plog10())
}

/// Distance (m) at which the free-space loss at `f_hz` equals `loss_db`.
pub fn distance_for_loss_m(loss_db: f64, f_hz: f64) -> f64 {
    let at_1m = free_space_path_loss_db(1.0, f_hz);
    10f64.ppowf((loss_db - at_1m) / 20.0)
}

/// Run the comparison.
pub fn run(inp: &JamInput) -> Result<JamReport, String> {
    list_len("signals", inp.signals.len(), 20)?;
    list_len("jammer_eirp_dbw", inp.jammer_eirp_dbw.len(), 50)?;
    within("antenna_gain_dbi", inp.antenna_gain_dbi, -40.0, 40.0)?;
    within("jammer_gain_dbi", inp.jammer_gain_dbi, -60.0, 40.0)?;
    within("noise_temp_k", inp.noise_temp_k, 1.0, 10_000.0)?;
    for &p in &inp.jammer_eirp_dbw {
        within("jammer_eirp_dbw", p, -100.0, 100.0)?;
    }
    let n0 = noise_density_dbw_per_hz(inp.noise_temp_k);
    let mut rows: Vec<JamRow> = Vec::with_capacity(inp.signals.len());
    for s in &inp.signals {
        within("signals.f_mhz", s.f_mhz, 1.0, 100_000.0)?;
        within(
            "signals.received_power_dbw",
            s.received_power_dbw,
            -250.0,
            0.0,
        )?;
        positive("signals.chip_rate_mcps", s.chip_rate_mcps)?;
        within("signals.threshold_dbhz", s.threshold_dbhz, 0.0, 100.0)?;
        let q = positive("signals.q", s.q.unwrap_or(1.0))?;
        if let Some(t) = s.stated_js_tolerance_db {
            within("signals.stated_js_tolerance_db", t, -50.0, 150.0)?;
        }
        let f = s.f_mhz * 1e6;
        let rc = s.chip_rate_mcps * 1e6;
        let sig = s.received_power_dbw + inp.antenna_gain_dbi;
        let cn0 = sig - n0;
        let js = js_at_threshold_db(cn0, s.threshold_dbhz, q, rc);
        let jmax = js.map(|j| sig + j);
        let radii = inp
            .jammer_eirp_dbw
            .iter()
            .map(|&p| RadiusRow {
                eirp_dbw: p,
                radius_m: jmax.map(|j| distance_for_loss_m(p + inp.jammer_gain_dbi - j, f)),
            })
            .collect();
        rows.push(JamRow {
            signal: s.id.clone(),
            cn0_dbhz: cn0,
            power_advantage_db: 0.0,
            js_tolerance_db: js,
            jammer_power_tolerated_dbw: jmax,
            tolerance_advantage_db: None,
            radius_ratio: None,
            area_ratio: None,
            stated_js_tolerance_db: s.stated_js_tolerance_db,
            model_reaches_stated: s.stated_js_tolerance_db.map(|t| js.is_some_and(|j| j >= t)),
            cn0_at_stated_dbhz: s
                .stated_js_tolerance_db
                .map(|t| effective_cn0_dbhz(cn0, t, q, rc)),
            radii,
        });
    }
    let (ref_power, ref_j) = (rows[0].cn0_dbhz, rows[0].jammer_power_tolerated_dbw);
    for r in &mut rows {
        r.power_advantage_db = r.cn0_dbhz - ref_power;
        if let (Some(a), Some(b)) = (r.jammer_power_tolerated_dbw, ref_j) {
            let d = a - b;
            r.tolerance_advantage_db = Some(d);
            r.radius_ratio = Some(10f64.ppowf(-d / 20.0));
            r.area_ratio = Some(10f64.ppowf(-d / 10.0));
        }
    }
    Ok(JamReport {
        reference: inp.signals[0].id.clone(),
        signals: rows,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_threshold_js_inverts_the_anti_jam_equation() {
        let (cn0, th, q, rc) = (45.0, 28.0, 1.0, 1.023e6);
        let js = js_at_threshold_db(cn0, th, q, rc).unwrap();
        assert!((effective_cn0_dbhz(cn0, js, q, rc) - th).abs() < 1e-9);
        assert!(js_at_threshold_db(27.0, 28.0, q, rc).is_none());
    }

    #[test]
    fn the_distance_inverts_the_free_space_loss() {
        let f = 1575.42e6;
        let l = free_space_path_loss_db(12_345.0, f);
        assert!((distance_for_loss_m(l, f) - 12_345.0).abs() < 1e-6);
    }
}
