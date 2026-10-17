// SPDX-License-Identifier: AGPL-3.0-only
//! The **`optical-atmosphere`** scenario kind: optical PNT through the atmosphere. One run takes
//! an optical link, a set of ground sites with stated cloud climates, optional enhancement
//! techniques and a clock list, and reports per site the clear-air loss, the turbulence statistics,
//! the availability against the link margin, the margin needed for target availabilities, the
//! outage-duration distribution and the timing / ranging error growth per outage; and for the
//! network the site-diversity availability.
//!
//! Everything weather- and technique-dependent is **Modelled**; the numerics are checked against an
//! independent oracle (`xval/optical-atmosphere/`, bars A1–A7). No external availability record
//! has been compared. Advisory analysis only, not a certified availability or navigation product.

use crate::clock_state::ClockClass;
use crate::field_schema::{FieldUnit, ProvenanceClass::*};
use crate::optical_atmosphere::{ClearAirParams, Direction, HvProfile, Wave};
use crate::optical_linkbudget::{optical_link_budget, OpticalLinkParams};
use crate::optical_outage_holdover::couple;
use crate::optical_sitediv::{correlation_matrix, independent_union, network_availability};
use crate::optical_techniques::{evaluate, Technique};
use crate::optical_weather::{
    availability_for_budget, margin_for_availability, site_availability, CloudClimate, FadeTable,
    OutageModel, SiteLink,
};
use serde::Deserialize;
use crate::portable_math::PortableFloat;
use serde_json::json;

fn d_wl() -> f64 {
    1550.0
}
fn d_el() -> f64 {
    30.0
}
fn d_targets() -> Vec<f64> {
    vec![90.0, 95.0, 99.0, 99.9]
}
fn one() -> f64 {
    1.0
}

/// Link terminal parameters (the clear-sky budget with no atmosphere).
#[derive(Clone, Debug, Deserialize)]
#[serde(default)]
pub struct LinkSpec {
    /// Transmit power (W).
    pub tx_power_w: f64,
    /// Transmit aperture (m).
    pub tx_aperture_m: f64,
    /// Receive aperture (m).
    pub rx_aperture_m: f64,
    /// One-way slant range (km).
    pub range_km: f64,
    /// Optics throughput (0..1).
    pub optics_efficiency: f64,
    /// Detector quantum efficiency (0..1).
    pub detector_efficiency: f64,
    /// Pointing loss (dB).
    pub pointing_loss_db: f64,
    /// Receiver sensitivity: the received power the link needs (dBm).
    pub receiver_sensitivity_dbm: f64,
}

impl Default for LinkSpec {
    fn default() -> Self {
        LinkSpec {
            tx_power_w: 0.5,
            tx_aperture_m: 0.1,
            rx_aperture_m: 0.4,
            range_km: 1000.0,
            optics_efficiency: 0.5,
            detector_efficiency: 0.7,
            pointing_loss_db: 3.0,
            receiver_sensitivity_dbm: -30.0,
        }
    }
}

/// Atmosphere and turbulence parameters.
#[derive(Clone, Debug, Deserialize)]
#[serde(default)]
pub struct AtmosphereSpec {
    /// Hufnagel–Valley ground-level `Cn²` term (m^{-2/3}); HV 5/7 is 1.7e-14.
    pub hv_ground_cn2: f64,
    /// Hufnagel–Valley RMS wind (m/s); HV 5/7 is 21.
    pub hv_wind_ms: f64,
    /// `plane` or `spherical` wavefront.
    pub wave: String,
    /// `downlink` or `uplink`.
    pub direction: String,
    /// Effective turbulent path for aperture averaging (km).
    pub path_eff_km: f64,
    /// Meteorological visibility (km).
    pub visibility_km: f64,
    /// Aerosol scale height (m).
    pub aerosol_scale_height_m: f64,
    /// Top of the atmosphere profile (km).
    pub top_km: f64,
    /// Effective cloud-droplet radius (µm).
    pub cloud_effective_radius_um: f64,
    /// Zenith gas-absorption loss (dB).
    pub gas_absorption_db_zenith: f64,
}

impl Default for AtmosphereSpec {
    fn default() -> Self {
        AtmosphereSpec {
            hv_ground_cn2: 1.7e-14,
            hv_wind_ms: 21.0,
            wave: "plane".into(),
            direction: "downlink".into(),
            path_eff_km: 10.0,
            visibility_km: 23.0,
            aerosol_scale_height_m: 1200.0,
            top_km: 30.0,
            cloud_effective_radius_um: 10.0,
            gas_absorption_db_zenith: 0.0,
        }
    }
}

/// One ground site.
#[derive(Clone, Debug, Deserialize)]
pub struct SiteSpec {
    /// Label.
    pub name: String,
    /// Latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg east).
    pub lon_deg: f64,
    /// Height above sea level (m).
    #[serde(default)]
    pub altitude_m: f64,
    /// Probability of cloud on the line of sight.
    pub p_cloud: f64,
    /// Median liquid-water column given cloud (kg/m²).
    pub median_lwp_kg_m2: f64,
    /// Standard deviation of `ln L` given cloud.
    pub sigma_ln: f64,
    /// Mean outage duration (hours).
    pub mean_outage_h: f64,
    /// Standard deviation of `ln D`.
    #[serde(default = "d_sigma_out")]
    pub outage_sigma_ln: f64,
    /// Pointing / acquisition availability factor (0..1).
    #[serde(default = "one")]
    pub pointing_availability: f64,
    /// Where the cloud numbers come from, echoed (free text).
    #[serde(default)]
    pub data_source: String,
}

fn d_sigma_out() -> f64 {
    1.0
}

/// Site-diversity parameters.
#[derive(Clone, Debug, Deserialize)]
#[serde(default)]
pub struct NetworkSpec {
    /// Weather decorrelation length (km): `ρ = exp(−d/d₀)`.
    pub correlation_length_km: f64,
}

impl Default for NetworkSpec {
    fn default() -> Self {
        NetworkSpec {
            correlation_length_km: 500.0,
        }
    }
}

/// A candidate technique, as written in the scenario.
#[derive(Clone, Debug, Deserialize)]
pub struct TechniqueSpec {
    /// Label.
    pub name: String,
    /// Replacement wavelength (nm).
    pub wavelength_nm: Option<f64>,
    /// Replacement receive aperture (m).
    pub rx_aperture_m: Option<f64>,
    /// Fractional scintillation-index reduction (0..1).
    pub scint_variance_reduction: Option<f64>,
    /// Extra link margin (dB).
    pub extra_margin_db: Option<f64>,
}

/// Clocks for the outage coupling.
#[derive(Clone, Debug, Deserialize)]
#[serde(default)]
pub struct ClockSpec {
    /// Clock ids (`ocxo`, `rafs`, `dsac`, … or a quantum class).
    pub classes: Vec<String>,
    /// Timing-error threshold (ns).
    pub threshold_ns: f64,
}

impl Default for ClockSpec {
    fn default() -> Self {
        ClockSpec {
            classes: vec!["ocxo".into(), "rafs".into(), "dsac".into()],
            threshold_ns: 100.0,
        }
    }
}

/// The `optical-atmosphere` scenario.
#[derive(Clone, Debug, Deserialize)]
pub struct OpticalAtmosphereScenario {
    /// Carrier wavelength (nm).
    #[serde(default = "d_wl")]
    pub wavelength_nm: f64,
    /// Elevation of the slant path (deg).
    #[serde(default = "d_el")]
    pub elevation_deg: f64,
    /// Availability targets for the margin table (percent).
    #[serde(default = "d_targets")]
    pub availability_targets_pct: Vec<f64>,
    /// Link terminal.
    #[serde(default)]
    pub link: LinkSpec,
    /// Atmosphere and turbulence.
    #[serde(default)]
    pub atmosphere: AtmosphereSpec,
    /// Ground sites.
    #[serde(default)]
    pub site: Vec<SiteSpec>,
    /// Site diversity.
    #[serde(default)]
    pub network: NetworkSpec,
    /// Candidate techniques.
    #[serde(default)]
    pub technique: Vec<TechniqueSpec>,
    /// Clock coupling.
    #[serde(default)]
    pub clock: ClockSpec,
}

fn default_sites() -> Vec<SiteSpec> {
    // ILLUSTRATIVE climates, not measured: a cloudier northern, a middling central and a clearer
    // southern site, so a bare `kind = "optical-atmosphere"` shows the diversity effect.
    let mk = |name: &str, lat: f64, lon: f64, alt: f64, pc: f64, m: f64, mo: f64| SiteSpec {
        name: name.into(),
        lat_deg: lat,
        lon_deg: lon,
        altitude_m: alt,
        p_cloud: pc,
        median_lwp_kg_m2: m,
        sigma_ln: 1.0,
        mean_outage_h: mo,
        outage_sigma_ln: 1.0,
        pointing_availability: 1.0,
        data_source: "ILLUSTRATIVE input, not a measurement".into(),
    };
    vec![
        mk("northern", 58.0, 10.0, 50.0, 0.65, 0.08, 9.0),
        mk("central", 48.0, 11.0, 600.0, 0.5, 0.06, 7.0),
        mk("southern", 37.0, 14.0, 1200.0, 0.3, 0.04, 5.0),
    ]
}

/// Units of every emitted field.
pub const UNITS: &[FieldUnit] = &[
    FieldUnit { path: "inputs.wavelength_nm", unit: "nm", provenance: Input, definition: "carrier wavelength" },
    FieldUnit { path: "inputs.elevation_deg", unit: "deg", provenance: Input, definition: "elevation of the slant path" },
    FieldUnit { path: "inputs.zenith_deg", unit: "deg", provenance: Computed, definition: "zenith angle, 90 degrees minus the elevation" },
    FieldUnit { path: "inputs.correlation_length_km", unit: "km", provenance: ModelledInput, definition: "weather decorrelation length of the site-diversity model" },
    FieldUnit { path: "link.footprint_m", unit: "m", provenance: ClosedForm, definition: "diffraction footprint (lambda/D) x range" },
    FieldUnit { path: "link.geometric_loss_db", unit: "dB", provenance: ClosedForm, definition: "far-field geometric capture loss" },
    FieldUnit { path: "link.received_power_no_atmosphere_dbm", unit: "dBm", provenance: Computed, definition: "received power with no atmospheric loss" },
    FieldUnit { path: "link.receiver_sensitivity_dbm", unit: "dBm", provenance: ModelledInput, definition: "received power the link requires" },
    FieldUnit { path: "link.margin_no_atmosphere_db", unit: "dB", provenance: Computed, definition: "received power over the requirement with no atmosphere" },
    FieldUnit { path: "sites[].lat_deg", unit: "deg", provenance: Input, definition: "station latitude" },
    FieldUnit { path: "sites[].lon_deg", unit: "deg", provenance: Input, definition: "station longitude, east positive" },
    FieldUnit { path: "sites[].altitude_m", unit: "m", provenance: Input, definition: "station height above sea level" },
    FieldUnit { path: "sites[].p_cloud", unit: "1", provenance: ModelledInput, definition: "probability of cloud on the line of sight" },
    FieldUnit { path: "sites[].median_lwp_kg_m2", unit: "kg/m^2", provenance: ModelledInput, definition: "median liquid-water column given cloud" },
    FieldUnit { path: "sites[].sigma_ln", unit: "1", provenance: ModelledInput, definition: "standard deviation of ln L given cloud" },
    FieldUnit { path: "sites[].clear_air_loss_db", unit: "dB", provenance: Modelled, definition: "aerosol + Rayleigh + gas slant loss" },
    FieldUnit { path: "sites[].fade_budget_db", unit: "dB", provenance: Computed, definition: "margin left after the clear-air loss" },
    FieldUnit { path: "sites[].availability_pct", unit: "%", provenance: Modelled, definition: "link availability against cloud and turbulence fades" },
    FieldUnit { path: "sites[].availability_ceiling_pct", unit: "%", provenance: Modelled, definition: "availability with a 60 dB fade budget: the cloud and pointing ceiling no margin can pass" },
    FieldUnit { path: "sites[].unavailability_pct", unit: "%", provenance: Modelled, definition: "100 minus the availability" },
    FieldUnit { path: "sites[].clear_sky_availability_pct", unit: "%", provenance: Modelled, definition: "availability with no cloud (turbulence fade only)" },
    FieldUnit { path: "sites[].turbulence.rytov_variance", unit: "1", provenance: Modelled, definition: "Rytov variance of the slant path" },
    FieldUnit { path: "sites[].turbulence.scintillation_index", unit: "1", provenance: Modelled, definition: "aperture-averaged scintillation index" },
    FieldUnit { path: "sites[].turbulence.alpha", unit: "1", provenance: Modelled, definition: "gamma-gamma large-scale parameter" },
    FieldUnit { path: "sites[].turbulence.beta", unit: "1", provenance: Modelled, definition: "gamma-gamma small-scale parameter" },
    FieldUnit { path: "sites[].turbulence.aperture_averaging_factor", unit: "1", provenance: Modelled, definition: "weak-turbulence aperture-averaging factor" },
    FieldUnit { path: "sites[].turbulence.fade_margin_db_at_1e-3", unit: "dB", provenance: Modelled, definition: "turbulence fade margin for a 1e-3 outage probability" },
    FieldUnit { path: "sites[].margin_for_availability[].target_pct", unit: "%", provenance: Input, definition: "target availability" },
    FieldUnit { path: "sites[].margin_for_availability[].required_margin_no_atmosphere_db", unit: "dB", provenance: Modelled, definition: "link margin with no atmosphere needed for the target" },
    FieldUnit { path: "sites[].margin_for_availability[].extra_margin_db", unit: "dB", provenance: Modelled, definition: "margin to add to the current link for the target" },
    FieldUnit { path: "sites[].outages.mean_h", unit: "h", provenance: ModelledInput, definition: "mean outage duration" },
    FieldUnit { path: "sites[].outages.sigma_ln", unit: "1", provenance: ModelledInput, definition: "standard deviation of ln D" },
    FieldUnit { path: "sites[].outages.per_year", unit: "count", provenance: Modelled, definition: "outages per year at the unavailability and mean duration" },
    FieldUnit { path: "sites[].outages.quantiles[].probability", unit: "1", provenance: Input, definition: "non-exceedance probability" },
    FieldUnit { path: "sites[].outages.quantiles[].duration_h", unit: "h", provenance: Modelled, definition: "outage duration not exceeded with that probability" },
    FieldUnit { path: "sites[].outages.exceedance[].duration_h", unit: "h", provenance: Input, definition: "outage duration" },
    FieldUnit { path: "sites[].outages.exceedance[].probability", unit: "1", provenance: Modelled, definition: "probability an outage lasts longer" },
    FieldUnit { path: "sites[].outages.exceedance[].time_fraction", unit: "1", provenance: Modelled, definition: "fraction of outage time spent in outages that long" },
    FieldUnit { path: "sites[].holdover[].threshold_ns", unit: "ns", provenance: Input, definition: "timing-error threshold" },
    FieldUnit { path: "sites[].holdover[].holdover_s", unit: "s", provenance: ClosedForm, definition: "coast time to the threshold" },
    FieldUnit { path: "sites[].holdover[].fraction_outages_within", unit: "1", provenance: Modelled, definition: "fraction of outages no longer than the holdover" },
    FieldUnit { path: "sites[].holdover[].fraction_outage_time_within", unit: "1", provenance: Modelled, definition: "fraction of outage time in outages no longer than the holdover" },
    FieldUnit { path: "sites[].holdover[].timing_availability_pct", unit: "%", provenance: Modelled, definition: "fraction of all time the timing error is within the threshold" },
    FieldUnit { path: "sites[].holdover[].errors[].duration_h", unit: "h", provenance: Modelled, definition: "outage duration" },
    FieldUnit { path: "sites[].holdover[].errors[].timing_sigma_ns", unit: "ns", provenance: ClosedForm, definition: "timing error 1-sigma after the outage" },
    FieldUnit { path: "sites[].holdover[].errors[].range_sigma_m", unit: "m", provenance: ClosedForm, definition: "ranging error 1-sigma after the outage" },
    FieldUnit { path: "sites[].techniques[].baseline_pct", unit: "%", provenance: Modelled, definition: "availability before the technique" },
    FieldUnit { path: "sites[].techniques[].with_technique_pct", unit: "%", provenance: Modelled, definition: "availability with the technique" },
    FieldUnit { path: "sites[].techniques[].gain_pct_points", unit: "%", provenance: Modelled, definition: "availability gain in percentage points" },
    FieldUnit { path: "sites[].techniques[].margin_delta_db", unit: "dB", provenance: Modelled, definition: "clear-sky budget change from a new wavelength or aperture" },
    FieldUnit { path: "network.sites_used", unit: "count", provenance: Computed, definition: "sites in the row, best first" },
    FieldUnit { path: "network.rows[].n", unit: "count", provenance: Computed, definition: "number of best sites combined" },
    FieldUnit { path: "network.rows[].independent_pct", unit: "%", provenance: ClosedForm, definition: "independent-union availability 1 - prod(1 - a)" },
    FieldUnit { path: "network.rows[].correlated_pct", unit: "%", provenance: Modelled, definition: "availability with distance-correlated weather" },
    FieldUnit { path: "network.pair_correlation[].rho", unit: "1", provenance: ModelledInput, definition: "exp(-distance / decorrelation length)" },
    FieldUnit { path: "network.pair_correlation[].distance_km", unit: "km", provenance: Computed, definition: "great-circle distance between the two sites" },
];

impl OpticalAtmosphereScenario {
    fn check(&self) -> Result<(), String> {
        let pos = |v: f64, n: &str| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("{n} must be finite and positive"))
            }
        };
        let frac = |v: f64, n: &str| {
            if v.is_finite() && (0.0..=1.0).contains(&v) {
                Ok(())
            } else {
                Err(format!("{n} must be in [0, 1]"))
            }
        };
        pos(self.wavelength_nm, "wavelength_nm")?;
        if !(5.0..=90.0).contains(&self.elevation_deg) {
            return Err("elevation_deg must be in [5, 90]".into());
        }
        pos(self.link.tx_power_w, "link.tx_power_w")?;
        pos(self.link.tx_aperture_m, "link.tx_aperture_m")?;
        pos(self.link.rx_aperture_m, "link.rx_aperture_m")?;
        pos(self.link.range_km, "link.range_km")?;
        frac(self.link.optics_efficiency, "link.optics_efficiency")?;
        frac(self.link.detector_efficiency, "link.detector_efficiency")?;
        pos(self.atmosphere.path_eff_km, "atmosphere.path_eff_km")?;
        pos(self.atmosphere.visibility_km, "atmosphere.visibility_km")?;
        pos(self.atmosphere.aerosol_scale_height_m, "atmosphere.aerosol_scale_height_m")?;
        pos(self.atmosphere.top_km, "atmosphere.top_km")?;
        pos(self.atmosphere.cloud_effective_radius_um, "atmosphere.cloud_effective_radius_um")?;
        pos(self.network.correlation_length_km, "network.correlation_length_km")?;
        pos(self.clock.threshold_ns, "clock.threshold_ns")?;
        if !matches!(self.atmosphere.wave.as_str(), "plane" | "spherical") {
            return Err("atmosphere.wave must be \"plane\" or \"spherical\"".into());
        }
        if !matches!(self.atmosphere.direction.as_str(), "downlink" | "uplink") {
            return Err("atmosphere.direction must be \"downlink\" or \"uplink\"".into());
        }
        for t in &self.availability_targets_pct {
            if !(*t > 0.0 && *t < 100.0) {
                return Err("availability_targets_pct entries must be in (0, 100)".into());
            }
        }
        for c in &self.clock.classes {
            if crate::optical_outage_holdover::clock_psds(c).is_none() {
                return Err(format!("unknown clock class \"{c}\""));
            }
        }
        for s in &self.site {
            if s.name.trim().is_empty() {
                return Err("every site needs a name".into());
            }
            if !(-90.0..=90.0).contains(&s.lat_deg) || !(-180.0..=180.0).contains(&s.lon_deg) {
                return Err(format!("site {}: latitude/longitude out of range", s.name));
            }
            frac(s.p_cloud, "site.p_cloud")?;
            frac(s.pointing_availability, "site.pointing_availability")?;
            pos(s.median_lwp_kg_m2, "site.median_lwp_kg_m2")?;
            pos(s.sigma_ln, "site.sigma_ln")?;
            pos(s.mean_outage_h, "site.mean_outage_h")?;
            pos(s.outage_sigma_ln, "site.outage_sigma_ln")?;
            if !(s.altitude_m.is_finite() && s.altitude_m >= 0.0 && s.altitude_m < self.atmosphere.top_km * 1000.0) {
                return Err(format!("site {}: altitude_m must be in [0, top)", s.name));
            }
        }
        Ok(())
    }

    /// The clear-sky link margin with no atmosphere (dB) at `wavelength_m` and `rx_aperture_m`.
    fn budget(&self, wavelength_m: f64, rx_aperture_m: f64) -> (crate::optical_linkbudget::OpticalLinkResult, f64) {
        let p = OpticalLinkParams {
            wavelength_m,
            tx_power_w: self.link.tx_power_w,
            tx_aperture_m: self.link.tx_aperture_m,
            rx_aperture_m,
            range_m: self.link.range_km * 1000.0,
            optics_efficiency: self.link.optics_efficiency,
            detector_efficiency: self.link.detector_efficiency,
            atmospheric_loss_db: 0.0,
            pointing_loss_db: self.link.pointing_loss_db,
        };
        let r = optical_link_budget(&p);
        let dbm = 10.0 * (r.received_power_w * 1000.0).plog10();
        (r, dbm - self.link.receiver_sensitivity_dbm)
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let mut scn = self.clone();
        if scn.site.is_empty() {
            scn.site = default_sites();
        }
        scn.check()?;
        let scn = &scn;
        let wl = scn.wavelength_nm * 1e-9;
        let zenith = (90.0 - scn.elevation_deg).to_radians();
        let (budget, margin0) = scn.budget(wl, scn.link.rx_aperture_m);
        let wave = if scn.atmosphere.wave == "plane" { Wave::Plane } else { Wave::Spherical };
        let dir = if scn.atmosphere.direction == "downlink" { Direction::Downlink } else { Direction::Uplink };
        let link_for = |s: &SiteSpec| SiteLink {
            wavelength_m: wl,
            zenith_rad: zenith,
            station_height_m: s.altitude_m,
            top_m: scn.atmosphere.top_km * 1000.0,
            rx_aperture_m: scn.link.rx_aperture_m,
            path_eff_m: scn.atmosphere.path_eff_km * 1000.0,
            wave,
            direction: dir,
            profile: HvProfile { ground_cn2: scn.atmosphere.hv_ground_cn2, wind_rms_ms: scn.atmosphere.hv_wind_ms },
            clear: ClearAirParams { visibility_km: scn.atmosphere.visibility_km, aerosol_scale_height_m: scn.atmosphere.aerosol_scale_height_m },
            r_eff_m: scn.atmosphere.cloud_effective_radius_um * 1e-6,
            gas_db_zenith: scn.atmosphere.gas_absorption_db_zenith,
            margin_excl_atmosphere_db: margin0,
            scint_variance_reduction: 0.0,
            extra_margin_db: 0.0,
            pointing_availability: s.pointing_availability,
        };

        let mut sites_json = Vec::new();
        let mut avail = Vec::new();
        for s in &scn.site {
            let link = link_for(s);
            let climate = CloudClimate { p_cloud: s.p_cloud, median_lwp_kg_m2: s.median_lwp_kg_m2, sigma_ln: s.sigma_ln };
            let sc = link.scintillation();
            let table = FadeTable::new(&sc);
            let budget_db = link.fade_budget_db();
            let a = availability_for_budget(&link, &climate, &table, budget_db);
            debug_assert!((a - site_availability(&link, &climate)).abs() < 1e-12);
            let clear_only = if budget_db < 0.0 { 0.0 } else { link.pointing_availability * (1.0 - table.exceedance(budget_db)) };
            avail.push(a);
            let outages = OutageModel { mean_s: s.mean_outage_h * 3600.0, sigma_ln: s.outage_sigma_ln };
            let u = 1.0 - a;
            let targets: Vec<_> = scn
                .availability_targets_pct
                .iter()
                .map(|&t| {
                    let m = margin_for_availability(&link, &climate, t / 100.0);
                    json!({
                        "target_pct": t,
                        "required_margin_no_atmosphere_db": m,
                        "extra_margin_db": m.map(|v| v - margin0),
                    })
                })
                .collect();
            let hours = |sec: f64| sec / 3600.0;
            let quantiles: Vec<_> = [0.5, 0.9, 0.99]
                .iter()
                .map(|&p| json!({"probability": p, "duration_h": hours(outages.quantile(p))}))
                .collect();
            let exceed: Vec<_> = [1.0, 6.0, 24.0, 72.0]
                .iter()
                .map(|&d| {
                    json!({
                        "duration_h": d,
                        "probability": outages.exceedance(d * 3600.0),
                        "time_fraction": outages.time_fraction_longer_than(d * 3600.0),
                    })
                })
                .collect();
            let holdover: Vec<_> = scn
                .clock
                .classes
                .iter()
                .filter_map(|c| couple(c, a, &outages, scn.clock.threshold_ns * 1e-9))
                .map(|h| {
                    json!({
                        "clock": h.clock,
                        "threshold_ns": h.threshold_s * 1e9,
                        "holdover_s": h.holdover_s,
                        "fraction_outages_within": h.fraction_outages_within,
                        "fraction_outage_time_within": h.fraction_outage_time_within,
                        "timing_availability_pct": 100.0 * h.timing_availability,
                        "errors": h.errors.iter().map(|e| json!({
                            "label": e.label,
                            "duration_h": hours(e.duration_s),
                            "timing_sigma_ns": e.timing_sigma_s * 1e9,
                            "range_sigma_m": e.range_sigma_m,
                        })).collect::<Vec<_>>(),
                    })
                })
                .collect();
            let techniques: Vec<_> = scn
                .technique
                .iter()
                .map(|t| {
                    let new_wl = t.wavelength_nm.map(|n| n * 1e-9).unwrap_or(wl);
                    let new_ap = t.rx_aperture_m.unwrap_or(scn.link.rx_aperture_m);
                    let (_, m_new) = scn.budget(new_wl, new_ap);
                    let delta = m_new - margin0;
                    let tech = Technique {
                        name: t.name.clone(),
                        wavelength_m: t.wavelength_nm.map(|n| n * 1e-9),
                        rx_aperture_m: t.rx_aperture_m,
                        scint_variance_reduction: t.scint_variance_reduction,
                        extra_margin_db: Some(t.extra_margin_db.unwrap_or(0.0) + delta),
                    };
                    let r = evaluate(&link, &climate, &tech);
                    json!({
                        "name": r.name,
                        "baseline_pct": 100.0 * r.baseline,
                        "with_technique_pct": 100.0 * r.with_technique,
                        "gain_pct_points": 100.0 * r.gain,
                        "margin_delta_db": delta,
                        "wavelength_nm": new_wl * 1e9,
                        "rx_aperture_m": new_ap,
                        "scint_variance_reduction": t.scint_variance_reduction,
                        "extra_margin_db": t.extra_margin_db,
                    })
                })
                .collect();
            sites_json.push(json!({
                "name": s.name,
                "lat_deg": s.lat_deg,
                "lon_deg": s.lon_deg,
                "altitude_m": s.altitude_m,
                "data_source": s.data_source,
                "p_cloud": s.p_cloud,
                "median_lwp_kg_m2": s.median_lwp_kg_m2,
                "sigma_ln": s.sigma_ln,
                "clear_air_loss_db": link.clear_air_loss_db(),
                "fade_budget_db": budget_db,
                "availability_pct": 100.0 * a,
                "availability_ceiling_pct": 100.0 * availability_for_budget(&link, &climate, &table, crate::optical_weather::TABLE_MAX_DB),
                "unavailability_pct": 100.0 * u,
                "clear_sky_availability_pct": 100.0 * clear_only,
                "turbulence": {
                    "rytov_variance": link.rytov(),
                    "scintillation_index": sc.scintillation_index,
                    "alpha": sc.alpha,
                    "beta": sc.beta,
                    "aperture_averaging_factor": crate::optical_atmosphere::aperture_averaging_factor(wl, scn.link.rx_aperture_m, scn.atmosphere.path_eff_km * 1000.0, wave),
                    "fade_margin_db_at_1e-3": crate::optical_atmosphere::fade_margin_db(sc.alpha, sc.beta, 1e-3),
                },
                "margin_for_availability": targets,
                "outages": {
                    "mean_h": s.mean_outage_h,
                    "sigma_ln": s.outage_sigma_ln,
                    "per_year": outages.outages_per_year(u),
                    "quantiles": quantiles,
                    "exceedance": exceed,
                },
                "holdover": holdover,
                "techniques": techniques,
            }));
        }

        // network: best sites first
        let mut order: Vec<usize> = (0..scn.site.len()).collect();
        order.sort_by(|&i, &j| avail[j].partial_cmp(&avail[i]).unwrap_or(std::cmp::Ordering::Equal));
        let coords: Vec<(f64, f64)> = order.iter().map(|&i| (scn.site[i].lat_deg, scn.site[i].lon_deg)).collect();
        let full_rho = correlation_matrix(&coords, scn.network.correlation_length_km);
        let mut rows = Vec::new();
        for n in 1..=order.len() {
            let a: Vec<f64> = order[..n].iter().map(|&i| avail[i]).collect();
            let rho: Vec<Vec<f64>> = (0..n).map(|i| full_rho[i][..n].to_vec()).collect();
            rows.push(json!({
                "n": n,
                "sites": order[..n].iter().map(|&i| scn.site[i].name.clone()).collect::<Vec<_>>(),
                "independent_pct": 100.0 * independent_union(&a),
                "correlated_pct": 100.0 * network_availability(&a, &rho),
            }));
        }
        let mut pairs = Vec::new();
        for i in 0..order.len() {
            for j in (i + 1)..order.len() {
                pairs.push(json!({
                    "a": scn.site[order[i]].name,
                    "b": scn.site[order[j]].name,
                    "distance_km": crate::optical_sitediv::great_circle_km(coords[i].0, coords[i].1, coords[j].0, coords[j].1),
                    "rho": full_rho[i][j],
                }));
            }
        }
        let best = order[0];
        let last = rows.last().cloned().unwrap_or(json!({}));
        let summary = format!(
            "optical-atmosphere: {} nm at {:.0} deg elevation, margin {:.1} dB before the atmosphere; best site {} {:.2} %; {}-site network {:.2} % independent / {:.2} % correlated weather (MODELLED, advisory)",
            scn.wavelength_nm,
            scn.elevation_deg,
            margin0,
            scn.site[best].name,
            100.0 * avail[best],
            order.len(),
            last["independent_pct"].as_f64().unwrap_or(f64::NAN),
            last["correlated_pct"].as_f64().unwrap_or(f64::NAN),
        );
        let json = json!({
            "kind": "optical-atmosphere",
            "label": "MODELLED — optical PNT through the atmosphere: clear-air extinction (Kim visibility law + Rayleigh), cloud optical depth from a stated liquid-water climate (P.840 amount, geometric-optics extinction), Hufnagel-Valley turbulence with gamma-gamma fades and aperture averaging, availability against the link margin, outage durations coupled to clock holdover, and distance-correlated site diversity. The numerics are checked against an independent oracle; no measured availability record has been compared, and the weather, technique and clock inputs are assumptions.",
            "advisory": "Advisory analysis only: not a certified availability, integrity or navigation product, and not a prediction for any real site unless its climate inputs come from a stated dataset.",
            "units": crate::field_schema::units_block(UNITS),
            "inputs": {
                "wavelength_nm": scn.wavelength_nm,
                "elevation_deg": scn.elevation_deg,
                "zenith_deg": 90.0 - scn.elevation_deg,
                "correlation_length_km": scn.network.correlation_length_km,
                "wave": scn.atmosphere.wave,
                "direction": scn.atmosphere.direction,
            },
            "link": {
                "footprint_m": budget.footprint_m,
                "geometric_loss_db": budget.geometric_loss_db,
                "received_power_no_atmosphere_dbm": 10.0 * (budget.received_power_w * 1000.0).plog10(),
                "receiver_sensitivity_dbm": scn.link.receiver_sensitivity_dbm,
                "margin_no_atmosphere_db": margin0,
            },
            "sites": sites_json,
            "network": {
                "sites_used": order.len(),
                "rows": rows,
                "pair_correlation": pairs,
            },
        });
        Ok((serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?, summary))
    }
}

/// Resolve a clock id for the docs and validation, re-exported for callers.
pub fn known_clock_classes() -> Vec<&'static str> {
    let mut v: Vec<&'static str> = ClockClass::ALL.iter().map(|c| c.id()).collect();
    v.extend(["optical-lattice", "trapped-ion", "mercury-ion"]);
    v
}

#[cfg(test)]
mod tests {
    use super::*;

    fn run(src: &str) -> serde_json::Value {
        let scn: OpticalAtmosphereScenario = toml::from_str(src).unwrap();
        serde_json::from_str(&scn.run_json().unwrap().0).unwrap()
    }

    #[test]
    fn bare_kind_runs_and_diversity_helps() {
        let v = run("kind = \"optical-atmosphere\"\n");
        let rows = v["network"]["rows"].as_array().unwrap();
        assert_eq!(rows.len(), 3);
        let ind: Vec<f64> = rows.iter().map(|r| r["independent_pct"].as_f64().unwrap()).collect();
        let cor: Vec<f64> = rows.iter().map(|r| r["correlated_pct"].as_f64().unwrap()).collect();
        assert!(ind[0] < ind[1] && ind[1] < ind[2]);
        assert!(cor[2] <= ind[2] + 1e-9 && cor[2] > cor[0]);
        assert!((cor[0] - ind[0]).abs() < 1e-12);
    }

    #[test]
    fn rejects_bad_inputs() {
        for bad in [
            "elevation_deg = 2.0",
            "[atmosphere]\nwave = \"cone\"",
            "[clock]\nclasses = [\"nope\"]",
            "availability_targets_pct = [100.0]",
        ] {
            let scn: OpticalAtmosphereScenario = toml::from_str(&format!("kind = \"x\"\n{bad}\n")).unwrap();
            assert!(scn.run_json().is_err(), "{bad}");
        }
    }
}
