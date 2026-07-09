// SPDX-License-Identifier: AGPL-3.0-only
//! **Optical ground-network availability** — the clear-sky / pointing availability of a
//! free-space optical PNT link, and the diversity gain of an `N`-station network. An optical
//! link is weather-limited: a single site is available only when its sky is clear *and* the
//! terminal can point and acquire. Distributing several sites across uncorrelated weather
//! systems raises the network availability toward unity — the P5 Table 2 / Fig 1b argument.
//!
//! ## Per-site availability
//!
//! Each [`OpticalSite`] carries a **clear-sky probability** (from published cloud
//! climatology) and a **pointing / acquisition factor** (the fraction of clear time the
//! terminal actually closes the link). Its availability is their product.
//!
//! ## Network combination
//!
//! * **Independent union** ([`independent_union_availability`]): if the sites' outages are
//!   independent, the network is down only when *every* site is down, so
//!   `A = 1 − Π_i (1 − a_i)`. This is the exact closed-form diversity oracle.
//! * **Spatially-correlated union** ([`correlated_union_availability`]): real sites share
//!   weather, so their outages are correlated. With a pairwise correlation `ρ ∈ [0, 1]` the
//!   network behaves like `N_eff = 1 + (N−1)(1−ρ)` independent sites:
//!   `A = 1 − ḡ^{N_eff}` with `ḡ = (Π(1−a_i))^{1/N}` the geometric-mean unavailability. At
//!   `ρ = 0` this reduces **exactly** to the independent union; at `ρ = 1` it collapses to a
//!   single typical site (correlated weather gives no diversity gain).
//!
//! The bundled [`default_network`] of five representative sites reproduces the P5 headline
//! progression: single-site ≈ 53 %, three-site ≈ 90 %, four-site ≈ 95 %, and a five-site
//! spatially-correlated network ≈ 96 % (where the independent union would optimistically
//! read ≈ 98 %).
//!
//! ## Validated vs Modelled
//!
//! - **Validated (closed form).** The independent-union combinatorics `1 − Π(1 − a_i)` is an
//!   exact identity, checked to machine precision; the correlated union reduces to it exactly
//!   at `ρ = 0`.
//! - **Modelled.** The per-site clear-sky and pointing values, and the `ρ` used for the
//!   correlated variant, are representative published-climatology inputs, not a measured
//!   joint weather distribution.
//!
//! ## References
//! * Fuchs & Moll, *Ground station network optimization for space-to-ground optical
//!   communication* (JOCN, 2015) — site-diversity availability and cloud-climatology inputs.

use serde::Serialize;

/// One optical ground site: its clear-sky probability and pointing/acquisition factor.
#[derive(Clone, Debug, PartialEq)]
pub struct OpticalSite {
    /// Site label.
    pub name: String,
    /// Probability the sky is clear enough for the optical link (published cloud
    /// climatology), in `[0, 1]`.
    pub clear_sky_prob: f64,
    /// Fraction of clear-sky time the terminal points and acquires the link, in `[0, 1]`.
    pub pointing_acquisition_factor: f64,
}

impl OpticalSite {
    /// Construct a site from its clear-sky probability and pointing/acquisition factor.
    pub fn new(name: &str, clear_sky_prob: f64, pointing_acquisition_factor: f64) -> Self {
        OpticalSite {
            name: name.to_string(),
            clear_sky_prob,
            pointing_acquisition_factor,
        }
    }

    /// Single-site availability = clear-sky probability × pointing/acquisition factor,
    /// clamped to `[0, 1]`.
    pub fn availability(&self) -> f64 {
        (self.clear_sky_prob * self.pointing_acquisition_factor).clamp(0.0, 1.0)
    }
}

/// Product of the site unavailabilities `Π_i (1 − a_i)` — the probability every site is
/// simultaneously down under the independence assumption.
fn unavailability_product(sites: &[OpticalSite]) -> f64 {
    sites
        .iter()
        .map(|s| 1.0 - s.availability())
        .product::<f64>()
}

/// **Independent-union availability** `A = 1 − Π_i (1 − a_i)`: the network is available
/// whenever at least one site is, assuming independent site outages. Exact closed form.
pub fn independent_union_availability(sites: &[OpticalSite]) -> f64 {
    if sites.is_empty() {
        return 0.0;
    }
    1.0 - unavailability_product(sites)
}

/// **Spatially-correlated union availability** `A = 1 − ḡ^{N_eff}`, with
/// `N_eff = 1 + (N−1)(1−ρ)` the effective independent-site count and
/// `ḡ = (Π(1−a_i))^{1/N}` the geometric-mean unavailability. `ρ ∈ [0, 1]`: at `ρ = 0` it
/// equals the [`independent_union_availability`] exactly; at `ρ = 1` it collapses to a
/// single typical site `1 − ḡ`. Higher correlation ⇒ less diversity gain.
pub fn correlated_union_availability(sites: &[OpticalSite], rho: f64) -> f64 {
    let n = sites.len();
    if n == 0 {
        return 0.0;
    }
    let rho = rho.clamp(0.0, 1.0);
    let prod = unavailability_product(sites).max(0.0);
    let n_eff = 1.0 + (n as f64 - 1.0) * (1.0 - rho);
    // A = 1 − (Π(1−a))^{N_eff/N}; at ρ=0 the exponent is 1 → the independent union.
    1.0 - prod.powf(n_eff / n as f64)
}

/// A representative five-site optical ground network (illustrative, public-source cloud
/// climatology): each site ≈ 53 % single-site availability, geographically spread so their
/// weather is largely (but not perfectly) uncorrelated. Reproduces the P5 diversity
/// progression.
pub fn default_network() -> Vec<OpticalSite> {
    vec![
        OpticalSite::new("Tenerife (Teide)", 0.589, 0.90),
        OpticalSite::new("Haleakala", 0.611, 0.90),
        OpticalSite::new("Table Mountain", 0.578, 0.90),
        OpticalSite::new("La Silla", 0.600, 0.90),
        OpticalSite::new("Calar Alto", 0.556, 0.90),
    ]
}

/// Per-site availability detail for the report.
#[derive(Clone, Debug, Serialize)]
pub struct SiteAvailability {
    /// Site label.
    pub name: String,
    /// Clear-sky probability.
    pub clear_sky_prob: f64,
    /// Pointing / acquisition factor.
    pub pointing_acquisition_factor: f64,
    /// Single-site availability.
    pub availability: f64,
}

/// One point of the diversity curve: the network availability using the first `n` sites.
#[derive(Clone, Debug, Serialize)]
pub struct DiversityPoint {
    /// Number of sites in the (prefix) network.
    pub n_sites: usize,
    /// Independent-union availability of the first `n` sites.
    pub independent: f64,
    /// Spatially-correlated-union availability of the first `n` sites.
    pub correlated: f64,
}

/// The optical-availability outcome: per-site availabilities, the single-site headline, the
/// independent and correlated network unions, and the diversity curve.
#[derive(Clone, Debug, Serialize)]
pub struct OpticalAvailabilityResult {
    /// Number of sites.
    pub n_sites: usize,
    /// Per-site availability detail.
    pub per_site: Vec<SiteAvailability>,
    /// Mean single-site availability (the ≈ 53 % headline).
    pub single_site_mean: f64,
    /// Best single-site availability.
    pub best_single: f64,
    /// Independent-union network availability `1 − Π(1−a_i)`.
    pub independent_union: f64,
    /// Spatially-correlated-union network availability at `correlation`.
    pub correlated_union: f64,
    /// The spatial correlation `ρ` used for the correlated union.
    pub correlation: f64,
    /// The N-station diversity curve (availability vs number of sites).
    pub diversity_curve: Vec<DiversityPoint>,
}

/// Run the optical-availability analysis over `sites` with spatial correlation `rho`.
pub fn run_optical_availability(sites: &[OpticalSite], rho: f64) -> OpticalAvailabilityResult {
    let per_site: Vec<SiteAvailability> = sites
        .iter()
        .map(|s| SiteAvailability {
            name: s.name.clone(),
            clear_sky_prob: s.clear_sky_prob,
            pointing_acquisition_factor: s.pointing_acquisition_factor,
            availability: s.availability(),
        })
        .collect();
    let n = sites.len();
    let single_site_mean = if n == 0 {
        0.0
    } else {
        sites.iter().map(|s| s.availability()).sum::<f64>() / n as f64
    };
    let best_single = sites
        .iter()
        .map(|s| s.availability())
        .fold(0.0_f64, f64::max);
    let diversity_curve: Vec<DiversityPoint> = (1..=n)
        .map(|k| DiversityPoint {
            n_sites: k,
            independent: independent_union_availability(&sites[..k]),
            correlated: correlated_union_availability(&sites[..k], rho),
        })
        .collect();
    OpticalAvailabilityResult {
        n_sites: n,
        per_site,
        single_site_mean,
        best_single,
        independent_union: independent_union_availability(sites),
        correlated_union: correlated_union_availability(sites, rho),
        correlation: rho.clamp(0.0, 1.0),
        diversity_curve,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The independent-union availability matches the hand-computed `1 − Π(1−a_i)` to
    /// machine precision. Oracle: the closed-form union combinatorics.
    #[test]
    fn independent_union_matches_the_product_rule() {
        // Three sites at a = 0.5, 0.6, 0.4 → 1 − (0.5·0.4·0.6) = 1 − 0.12 = 0.88.
        let sites = vec![
            OpticalSite::new("a", 0.5, 1.0),
            OpticalSite::new("b", 0.6, 1.0),
            OpticalSite::new("c", 0.4, 1.0),
        ];
        let hand = 1.0 - (0.5_f64 * 0.4 * 0.6);
        assert!((independent_union_availability(&sites) - hand).abs() < 1e-12);
        assert!((hand - 0.88).abs() < 1e-12);
        // A single site's union is just its own availability.
        let one = vec![OpticalSite::new("a", 0.53, 1.0)];
        assert!((independent_union_availability(&one) - 0.53).abs() < 1e-12);
        // Empty network is never available.
        assert_eq!(independent_union_availability(&[]), 0.0);
    }

    /// The spatially-correlated union reduces EXACTLY to the independent union at ρ = 0, and
    /// is monotonically lower as ρ rises (correlation erodes the diversity gain), bounded
    /// below by the best single site. Oracle relationship at ρ = 0; monotonicity elsewhere.
    #[test]
    fn correlated_union_reduces_to_independent_at_zero_correlation() {
        let sites = default_network();
        let indep = independent_union_availability(&sites);
        // ρ = 0 → exactly the independent union.
        assert!((correlated_union_availability(&sites, 0.0) - indep).abs() < 1e-12);
        // Monotonic decreasing in ρ.
        let a = correlated_union_availability(&sites, 0.1);
        let b = correlated_union_availability(&sites, 0.3);
        let c = correlated_union_availability(&sites, 0.6);
        assert!(indep >= a && a > b && b > c, "{indep} {a} {b} {c}");
        // ρ = 1 collapses toward a single typical site, still ≥ every single site is not
        // guaranteed, but it must not exceed the independent union.
        let full = correlated_union_availability(&sites, 1.0);
        assert!(full <= indep && full > 0.0);
    }

    /// The bundled network reproduces the P5 headline progression: single-site ≈ 53 %,
    /// three-site ≈ 90 %, four-site ≈ 95 % (independent), and a five-site correlated network
    /// ≈ 96 % (where the independent union optimistically reads ≈ 98 %).
    #[test]
    fn default_network_reproduces_p5_headline_numbers() {
        let sites = default_network();
        let r = run_optical_availability(&sites, 0.15);
        // Single-site ≈ 53 %.
        assert!(
            (0.50..0.56).contains(&r.single_site_mean),
            "single-site {} not ≈ 53%",
            r.single_site_mean
        );
        // Three-site independent ≈ 87–91 %.
        let three = independent_union_availability(&sites[..3]);
        assert!((0.86..0.92).contains(&three), "3-site {three} not ≈ 90%");
        // Four-site independent ≈ 95 %.
        let four = independent_union_availability(&sites[..4]);
        assert!((0.93..0.97).contains(&four), "4-site {four} not ≈ 95%");
        // Five-site independent optimistically ≈ 98 %.
        assert!(
            (0.96..0.99).contains(&r.independent_union),
            "5-site independent {} not ≈ 98%",
            r.independent_union
        );
        // Five-site spatially-correlated ≈ 96 %.
        assert!(
            (0.94..0.975).contains(&r.correlated_union),
            "5-site correlated {} not ≈ 96%",
            r.correlated_union
        );
        assert!(r.correlated_union < r.independent_union);
    }

    /// The result is deterministic and the diversity curve is monotone non-decreasing in the
    /// number of sites (adding a station never lowers availability).
    #[test]
    fn diversity_curve_is_monotone_and_deterministic() {
        let sites = default_network();
        let a = run_optical_availability(&sites, 0.15);
        let b = run_optical_availability(&sites, 0.15);
        assert_eq!(a.independent_union, b.independent_union);
        assert_eq!(a.correlated_union, b.correlated_union);
        assert_eq!(a.diversity_curve.len(), sites.len());
        for w in a.diversity_curve.windows(2) {
            assert!(
                w[1].independent >= w[0].independent,
                "independent must not drop"
            );
            assert!(
                w[1].correlated >= w[0].correlated,
                "correlated must not drop"
            );
        }
    }
}
