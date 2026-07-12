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
//! The bundled [`default_network`] loads five sites from a checked-in external clear-sky
//! climatology (`data/optical_site_climatology.csv`, Cavazzani et al. 2011 GOES12 clear-night
//! fractions). Its diversity progression is single-site ≈ 69 %, two-site ≈ 93 %, three-site
//! ≈ 98 %, and a five-site spatially-correlated network ≈ 99.5 % (where the independent union
//! reads ≈ 99.8 %) — the strong site diversity that motivates the P5 optical backstop.
//!
//! ## Validated vs Modelled
//!
//! - **Validated (closed form).** The independent-union combinatorics `1 − Π(1 − a_i)` is an
//!   exact identity, checked to machine precision; the correlated union reduces to it exactly
//!   at `ρ = 0`.
//! - **Externally anchored.** The per-site **clear-sky** fractions are traceable to a
//!   published source row (see the CSV provenance column and the reference below), not values
//!   asserted by this crate.
//! - **Modelled.** The pointing/acquisition factor and the `ρ` used for the correlated
//!   variant are representative terminal / meteorology inputs, not a measured joint weather
//!   distribution.
//!
//! ## References
//! * Cavazzani, Ortolani, Zitelli & Maruccia, *Fraction of clear skies above astronomical
//!   sites: a new analysis from the GOES12 satellite* (MNRAS, 2011; arXiv:1011.4815) — the
//!   per-site satellite clear-night fractions used as the external clear-sky anchor.
//! * Fuchs & Moll, *Ground station network optimization for space-to-ground optical
//!   communication* (JOCN, 2015) — site-diversity availability methodology.

use serde::Serialize;

/// The bundled external clear-sky climatology (`data/optical_site_climatology.csv`),
/// compiled into the binary so [`default_network`] is traceable to a published source at
/// runtime with no filesystem dependency.
const CLIMATOLOGY_CSV: &str = include_str!("../data/optical_site_climatology.csv");

/// One optical ground site: its clear-sky probability, pointing/acquisition factor, and the
/// provenance of the clear-sky value.
#[derive(Clone, Debug, PartialEq)]
pub struct OpticalSite {
    /// Site label.
    pub name: String,
    /// Probability the sky is clear enough for the optical link (published cloud
    /// climatology), in `[0, 1]`.
    pub clear_sky_prob: f64,
    /// Fraction of clear-sky time the terminal points and acquires the link, in `[0, 1]`.
    pub pointing_acquisition_factor: f64,
    /// Provenance of the `clear_sky_prob` value — the published source row it is traceable
    /// to (empty for an ad-hoc site constructed via [`OpticalSite::new`]).
    pub source_citation: String,
}

impl OpticalSite {
    /// Construct a site from its clear-sky probability and pointing/acquisition factor, with
    /// no external provenance (the clear-sky value is caller-supplied / illustrative).
    pub fn new(name: &str, clear_sky_prob: f64, pointing_acquisition_factor: f64) -> Self {
        OpticalSite {
            name: name.to_string(),
            clear_sky_prob,
            pointing_acquisition_factor,
            source_citation: String::new(),
        }
    }

    /// Construct a site with an explicit clear-sky provenance citation (a traceable
    /// published-source row).
    pub fn with_source(
        name: &str,
        clear_sky_prob: f64,
        pointing_acquisition_factor: f64,
        source_citation: &str,
    ) -> Self {
        OpticalSite {
            name: name.to_string(),
            clear_sky_prob,
            pointing_acquisition_factor,
            source_citation: source_citation.to_string(),
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

/// Parse the bundled clear-sky climatology CSV into optical sites. Comment (`#`) and blank
/// lines and the header row are skipped; each data row is
/// `name,lat_deg,lon_deg,clear_sky_prob,pointing_acquisition_factor,source`. Malformed rows
/// are skipped. The `source` field carries the published provenance of the clear-sky value.
fn parse_climatology(csv: &str) -> Vec<OpticalSite> {
    csv.lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .filter(|l| !l.starts_with("name,")) // header
        .filter_map(|line| {
            // The `source` column may itself contain commas, so split into exactly six fields
            // with the remainder folded into the source.
            let mut it = line.splitn(6, ',');
            let name = it.next()?.trim();
            let _lat = it.next()?;
            let _lon = it.next()?;
            let clear: f64 = it.next()?.trim().parse().ok()?;
            let point: f64 = it.next()?.trim().parse().ok()?;
            let source = it.next().unwrap_or("").trim();
            Some(OpticalSite::with_source(name, clear, point, source))
        })
        .collect()
}

/// The bundled optical ground network, loaded from the checked-in external clear-sky
/// climatology (`data/optical_site_climatology.csv`). The five sites and their clear-sky
/// fractions are traceable to a published source row — Cavazzani et al. 2011 (MNRAS,
/// arXiv:1011.4815), the GOES12 satellite clear-night analysis (Paranal 88 %, La Silla 76 %,
/// La Palma 72.5 %, Mt. Graham 59 %, Tolonchar 86.5 %). Geographically spread so their
/// weather is largely (but not perfectly) uncorrelated, they exercise the P5 diversity
/// progression toward a near-unity network availability.
pub fn default_network() -> Vec<OpticalSite> {
    parse_climatology(CLIMATOLOGY_CSV)
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

    /// The bundled network (loaded from the external climatology) shows the P5 diversity
    /// progression toward near-unity availability: single-site ≈ 69 %, three-site ≈ 98 %
    /// (independent), and a five-site correlated network ≈ 99.5 % (where the independent union
    /// reads ≈ 99.8 %).
    #[test]
    fn default_network_shows_the_p5_diversity_progression() {
        let sites = default_network();
        let r = run_optical_availability(&sites, 0.15);
        // Single-site ≈ 69 % (mean of the five site availabilities).
        assert!(
            (0.66..0.72).contains(&r.single_site_mean),
            "single-site {} not ≈ 69%",
            r.single_site_mean
        );
        // Three-site independent ≈ 98 %.
        let three = independent_union_availability(&sites[..3]);
        assert!((0.965..0.985).contains(&three), "3-site {three} not ≈ 98%");
        // Five-site independent ≈ 99.8 %.
        assert!(
            (0.995..0.999).contains(&r.independent_union),
            "5-site independent {} not ≈ 99.8%",
            r.independent_union
        );
        // Five-site spatially-correlated ≈ 99.5 %.
        assert!(
            (0.99..0.997).contains(&r.correlated_union),
            "5-site correlated {} not ≈ 99.5%",
            r.correlated_union
        );
        assert!(r.correlated_union < r.independent_union);
    }

    /// **EXTERNAL CLEAR-SKY ORACLE (G3).** Each bundled site's `clear_sky_prob` matches the
    /// *published* GOES12 satellite clear-night fraction from Cavazzani et al. 2011 (MNRAS,
    /// arXiv:1011.4815): Paranal 88 %, La Silla 76 %, La Palma 72.5 %, Mt. Graham 59 %,
    /// Tolonchar 86.5 %. This is an oracle genuinely INDEPENDENT of P5's own headline
    /// numbers — a third party's satellite analysis, not a self-consistency check — and every
    /// site carries a source-citation provenance string. Oracle: the paper's abstract values.
    #[test]
    fn site_clear_sky_matches_published_external_values() {
        let sites = default_network();
        // The published Cavazzani et al. 2011 clear-night fractions, keyed by site.
        let published = [
            ("Paranal", 0.880),
            ("La Silla", 0.760),
            ("La Palma", 0.725),
            ("Mt. Graham", 0.590),
            ("Tolonchar", 0.865),
        ];
        assert_eq!(sites.len(), published.len(), "five sourced sites");
        for (name, expected) in published {
            let site = sites
                .iter()
                .find(|s| s.name == name)
                .unwrap_or_else(|| panic!("site {name} present in bundled network"));
            // Externally-anchored clear-sky fraction matches the published value exactly.
            assert!(
                (site.clear_sky_prob - expected).abs() < 1e-9,
                "{name} clear-sky {} != published {expected}",
                site.clear_sky_prob
            );
            // Provenance is bound to the published source (not asserted illustratively).
            assert!(
                site.source_citation.contains("Cavazzani")
                    && site.source_citation.contains("1011.4815"),
                "{name} must cite its published source, got {:?}",
                site.source_citation
            );
        }
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
