// SPDX-License-Identifier: AGPL-3.0-only
//! **Weather-driven optical link availability** of one ground site: cloud and turbulence fades
//! against a link margin, the fade margin needed for a target availability, and the outage
//! duration statistics.
//!
//! ## Model
//!
//! * **Cloud** — a site's cloud climate is the ITU-R P.840 form: a probability of cloud
//!   `p_cloud` and, given cloud, a log-normal liquid-water column `L` with median `m` and
//!   log-standard deviation `σ`. (The *amount* of cloud follows P.840; the optical attenuation of
//!   that cloud is the geometric-optics extinction of [`crate::optical_atmosphere`], because
//!   P.840's attenuation law is a microwave Rayleigh-regime law.) The three numbers are **inputs**.
//! * **Turbulence** — the scintillation fade is the gamma-gamma distribution of
//!   [`crate::optical_atmosphere`] with the receive aperture and any technique reduction applied.
//! * **Availability** — the link is up when the total fade (cloud + turbulence) stays inside the
//!   fade budget `B = margin − clear-air loss`. With cloud and turbulence independent,
//!   `A = π · [ (1−p_c)(1−F(B)) + p_c ∫ f(L) (1−F(B−a(L))) dL ]`, `F(x)` the probability of a
//!   turbulence fade deeper than `x` dB, `a(L)` the slant cloud attenuation in dB and `π` the
//!   pointing/acquisition factor. Independence and the `F` table (0.5 dB steps, linear in `ln F`)
//!   are stated approximations; the cloud integral is Simpson over `ln L`.
//! * **Outages** — durations are log-normal with a stated mean and log-standard deviation (cloud
//!   dwell times are heavy-tailed); outage count follows from the unavailability and the mean.
//!
//! All weather inputs are **Modelled** unless a scenario states a dataset.

use crate::optical_atmosphere::{
    aperture_averaging_factor, clear_air_optical_depth, cloud_optical_depth, fade_probability_n,
    rytov_variance, scintillation, ClearAirParams, Direction, HvProfile, Scintillation, Wave,
};
use crate::portable_math::PortableFloat;
use crate::raim::{normal_cdf, normal_quantile};

/// Seconds in a Julian year.
pub const SECONDS_PER_YEAR: f64 = 31_557_600.0;
/// `10·log10(e)`: converts an optical depth to dB.
pub const DB_PER_NEPER_OD: f64 = 4.342_944_819_032_518;
const TABLE_STEP_DB: f64 = 0.5;
/// Largest fade budget (dB) the availability search and fade table cover.
pub const TABLE_MAX_DB: f64 = 60.0;
const CLOUD_INTERVALS: usize = 240;
const TABLE_INTERVALS: usize = 800;

/// A site's cloud climate (the P.840 log-normal liquid-water form).
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct CloudClimate {
    /// Probability that cloud is present on the line of sight (0..1).
    pub p_cloud: f64,
    /// Median liquid-water column given cloud (kg/m²).
    pub median_lwp_kg_m2: f64,
    /// Standard deviation of `ln L` given cloud.
    pub sigma_ln: f64,
}

/// The link and atmosphere seen by one site.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct SiteLink {
    /// Carrier wavelength (m).
    pub wavelength_m: f64,
    /// Zenith angle of the slant path (rad).
    pub zenith_rad: f64,
    /// Station height above sea level (m).
    pub station_height_m: f64,
    /// Top of the atmosphere profile (m).
    pub top_m: f64,
    /// Receive aperture (m) for aperture averaging.
    pub rx_aperture_m: f64,
    /// Effective turbulent path length for aperture averaging (m).
    pub path_eff_m: f64,
    /// Wavefront model.
    pub wave: Wave,
    /// Direction of propagation.
    pub direction: Direction,
    /// Turbulence profile.
    pub profile: HvProfile,
    /// Clear-air extinction parameters.
    pub clear: ClearAirParams,
    /// Effective cloud-droplet radius (m).
    pub r_eff_m: f64,
    /// Zenith gas-absorption optical loss (dB), a stated input.
    pub gas_db_zenith: f64,
    /// Link margin with **no atmosphere at all** (dB): received power over the requirement.
    pub margin_excl_atmosphere_db: f64,
    /// Fractional reduction of the scintillation index by a technique (0..1).
    pub scint_variance_reduction: f64,
    /// Extra margin a technique buys (dB).
    pub extra_margin_db: f64,
    /// Pointing / acquisition availability factor (0..1).
    pub pointing_availability: f64,
}

impl SiteLink {
    fn sec(&self) -> f64 {
        1.0 / self.zenith_rad.pcos()
    }

    /// Clear-air plus gas slant loss (dB).
    pub fn clear_air_loss_db(&self) -> f64 {
        let tau = clear_air_optical_depth(
            self.wavelength_m,
            self.station_height_m,
            self.top_m,
            &self.clear,
        );
        (DB_PER_NEPER_OD * tau + self.gas_db_zenith) * self.sec()
    }

    /// Fade budget `B` (dB): margin left after the clear-air loss, plus technique margin. Negative
    /// means the link does not close even in clear sky.
    pub fn fade_budget_db(&self) -> f64 {
        self.margin_excl_atmosphere_db - self.clear_air_loss_db() + self.extra_margin_db
    }

    /// Rytov variance of the slant path.
    pub fn rytov(&self) -> f64 {
        rytov_variance(
            self.wavelength_m,
            self.zenith_rad,
            self.station_height_m,
            self.top_m,
            &self.profile,
            self.wave,
            self.direction,
        )
    }

    /// Aperture-averaged, technique-reduced scintillation.
    pub fn scintillation(&self) -> Scintillation {
        let base = scintillation(self.rytov(), self.wave);
        let a = aperture_averaging_factor(
            self.wavelength_m,
            self.rx_aperture_m,
            self.path_eff_m,
            self.wave,
        );
        base.with_index(base.scintillation_index * a * (1.0 - self.scint_variance_reduction))
    }

    /// Slant cloud attenuation (dB) of liquid column `lwp_kg_m2`.
    pub fn cloud_attenuation_db(&self, lwp_kg_m2: f64) -> f64 {
        DB_PER_NEPER_OD * cloud_optical_depth(lwp_kg_m2, self.r_eff_m) * self.sec()
    }
}

/// Probability of a turbulence fade deeper than `x` dB, tabulated once per site/link.
#[derive(Debug, Clone)]
pub struct FadeTable {
    ln_p: Vec<f64>,
}

impl FadeTable {
    /// Build the table for a scintillation state.
    pub fn new(s: &Scintillation) -> Self {
        let n = (TABLE_MAX_DB / TABLE_STEP_DB) as usize + 1;
        let ln_p = (0..n)
            .map(|i| {
                fade_probability_n(s.alpha, s.beta, i as f64 * TABLE_STEP_DB, TABLE_INTERVALS)
                    .max(1e-300)
                    .pln()
            })
            .collect();
        FadeTable { ln_p }
    }

    /// Exceedance probability at fade depth `x_db`; 1 for a negative budget (link closed).
    pub fn exceedance(&self, x_db: f64) -> f64 {
        if x_db < 0.0 {
            return 1.0;
        }
        let pos = (x_db / TABLE_STEP_DB).min((self.ln_p.len() - 1) as f64);
        let i = pos.floor() as usize;
        if i + 1 >= self.ln_p.len() {
            return self.ln_p[self.ln_p.len() - 1].pexp();
        }
        let f = pos - i as f64;
        (self.ln_p[i] * (1.0 - f) + self.ln_p[i + 1] * f).pexp()
    }
}

/// Availability (0..1) for a fade budget `budget_db` given the cloud climate.
pub fn availability_for_budget(
    link: &SiteLink,
    climate: &CloudClimate,
    table: &FadeTable,
    budget_db: f64,
) -> f64 {
    if budget_db < 0.0 {
        return 0.0;
    }
    let clear = (1.0 - climate.p_cloud) * (1.0 - table.exceedance(budget_db));
    let mut cloudy = 0.0;
    if climate.p_cloud > 0.0 {
        let n = CLOUD_INTERVALS;
        // attenuation is linear in L, so the column that uses the whole budget is exact; the
        // integrand is cut there (it jumps from the fade survival at zero margin to outage)
        let l_cut = budget_db / link.cloud_attenuation_db(1.0);
        let z_cut = (l_cut / climate.median_lwp_kg_m2).pln() / climate.sigma_ln;
        let (lo, hi) = (-6.0, z_cut.min(6.0));
        let phi = |z: f64| (-0.5 * z * z).pexp() / (2.0 * std::f64::consts::PI).sqrt();
        let f = |z: f64| {
            let l = climate.median_lwp_kg_m2 * (climate.sigma_ln * z).pexp();
            let rem = budget_db - link.cloud_attenuation_db(l);
            phi(z) * (1.0 - table.exceedance(rem.max(0.0)))
        };
        let mut sum = 0.0;
        if hi > lo {
            let h = (hi - lo) / n as f64;
            sum = f(lo) + f(hi);
            for i in 1..n {
                let c = if i % 2 == 1 { 4.0 } else { 2.0 };
                sum += c * f(lo + h * i as f64);
            }
            sum *= h / 3.0;
        }
        cloudy = climate.p_cloud * sum;
    }
    (link.pointing_availability * (clear + cloudy)).clamp(0.0, 1.0)
}

/// Availability (0..1) of a site link.
pub fn site_availability(link: &SiteLink, climate: &CloudClimate) -> f64 {
    let table = FadeTable::new(&link.scintillation());
    availability_for_budget(link, climate, &table, link.fade_budget_db())
}

/// Link margin with **no atmosphere** (dB) needed to reach `target` availability, or `None` if
/// 60 dB of fade budget does not reach it (the site is cloud- or pointing-limited).
pub fn margin_for_availability(
    link: &SiteLink,
    climate: &CloudClimate,
    target: f64,
) -> Option<f64> {
    let table = FadeTable::new(&link.scintillation());
    let a = |b: f64| availability_for_budget(link, climate, &table, b);
    if a(TABLE_MAX_DB) < target {
        return None;
    }
    let (mut lo, mut hi) = (0.0, TABLE_MAX_DB);
    for _ in 0..50 {
        let mid = 0.5 * (lo + hi);
        if a(mid) < target {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    Some(hi + link.clear_air_loss_db() - link.extra_margin_db)
}

/// Log-normal outage-duration model with a stated mean and log-standard deviation.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct OutageModel {
    /// Mean outage duration (s).
    pub mean_s: f64,
    /// Standard deviation of `ln D`.
    pub sigma_ln: f64,
}

impl OutageModel {
    fn mu(&self) -> f64 {
        self.mean_s.pln() - 0.5 * self.sigma_ln * self.sigma_ln
    }

    /// `P(D > d)`.
    pub fn exceedance(&self, d_s: f64) -> f64 {
        if d_s <= 0.0 {
            return 1.0;
        }
        1.0 - normal_cdf((d_s.pln() - self.mu()) / self.sigma_ln)
    }

    /// Fraction of total outage *time* spent in outages longer than `d`.
    pub fn time_fraction_longer_than(&self, d_s: f64) -> f64 {
        if d_s <= 0.0 {
            return 1.0;
        }
        1.0 - normal_cdf((d_s.pln() - self.mu() - self.sigma_ln * self.sigma_ln) / self.sigma_ln)
    }

    /// Duration (s) not exceeded with probability `p`.
    pub fn quantile(&self, p: f64) -> f64 {
        (self.mu() + self.sigma_ln * normal_quantile(p)).pexp()
    }

    /// `E[min(D, T)]` (s): mean time spent inside an outage's first `T` seconds.
    pub fn mean_min(&self, t_s: f64) -> f64 {
        self.mean_s * (1.0 - self.time_fraction_longer_than(t_s)) + t_s * self.exceedance(t_s)
    }

    /// Outages per year at unavailability `u`.
    pub fn outages_per_year(&self, unavailability: f64) -> f64 {
        unavailability * SECONDS_PER_YEAR / self.mean_s
    }
}

#[cfg(test)]
pub(crate) mod tests_support {
    use super::*;
    pub(crate) fn demo_link() -> SiteLink {
        SiteLink {
            wavelength_m: 1.55e-6,
            zenith_rad: 30f64.to_radians(),
            station_height_m: 0.0,
            top_m: 30_000.0,
            rx_aperture_m: 0.4,
            path_eff_m: 10_000.0,
            wave: Wave::Plane,
            direction: Direction::Downlink,
            profile: HvProfile::hv57(),
            clear: ClearAirParams::default(),
            r_eff_m: 10e-6,
            gas_db_zenith: 0.0,
            margin_excl_atmosphere_db: 20.0,
            scint_variance_reduction: 0.0,
            extra_margin_db: 0.0,
            pointing_availability: 1.0,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::tests_support::demo_link;
    use super::*;

    #[test]
    fn no_cloud_availability_is_turbulence_only_and_monotone_in_margin() {
        let c = CloudClimate {
            p_cloud: 0.0,
            median_lwp_kg_m2: 0.1,
            sigma_ln: 1.0,
        };
        let mut l = demo_link();
        let a20 = site_availability(&l, &c);
        l.margin_excl_atmosphere_db = 30.0;
        let a30 = site_availability(&l, &c);
        assert!(a30 >= a20 && a30 > 0.999);
        l.margin_excl_atmosphere_db = 0.5;
        assert!(site_availability(&l, &c) < a20);
    }

    #[test]
    fn cloud_cap_and_pointing_factor() {
        let c = CloudClimate {
            p_cloud: 0.4,
            median_lwp_kg_m2: 0.1,
            sigma_ln: 1.0,
        };
        let mut l = demo_link();
        l.margin_excl_atmosphere_db = 40.0;
        let a = site_availability(&l, &c);
        // closed-form ceiling: clear sky plus the cloudy mass whose attenuation fits the budget
        let l_max = 0.1 * l.fade_budget_db() / l.cloud_attenuation_db(0.1);
        let ceiling = 0.6 + 0.4 * normal_cdf(l_max.pln() - 0.1f64.pln());
        assert!(
            a <= ceiling + 1e-9 && a > ceiling - 0.03,
            "{a} vs ceiling {ceiling}"
        );
        l.pointing_availability = 0.9;
        assert!((site_availability(&l, &c) / a - 0.9).abs() < 1e-12);
    }

    #[test]
    fn outage_model_identities() {
        let o = OutageModel {
            mean_s: 7200.0,
            sigma_ln: 1.2,
        };
        // E[min(D, T)] -> mean for large T and -> T for small T
        assert!((o.mean_min(1e12) - 7200.0).abs() < 1e-6);
        assert!((o.mean_min(1.0) - 1.0).abs() < 1e-3);
        let q = o.quantile(0.5);
        assert!((o.exceedance(q) - 0.5).abs() < 1e-8);
        assert!(o.time_fraction_longer_than(q) > 0.5);
    }

    #[test]
    fn margin_for_availability_inverts() {
        let c = CloudClimate {
            p_cloud: 0.1,
            median_lwp_kg_m2: 0.02,
            sigma_ln: 1.0,
        };
        let l = demo_link();
        let need = margin_for_availability(&l, &c, 0.95).unwrap();
        let mut l2 = l;
        l2.margin_excl_atmosphere_db = need;
        assert!((site_availability(&l2, &c) - 0.95).abs() < 2e-4);
    }
}
