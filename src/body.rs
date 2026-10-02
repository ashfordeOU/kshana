// SPDX-License-Identifier: AGPL-3.0-only
//! Central-body parameters — the gravitational and orientation constants that turn the
//! Earth-hard-coded dynamics core into a body-agnostic one.
//!
//! [`Body`] gathers everything a propagator's central-gravity path needs (the gravitational
//! parameter `μ`, the reference radius `Re`, the zonal field, an optional full tesseral
//! [`crate::gravity_sh::SphericalHarmonicField`]) together with the body's rotation and IAU
//! (International Astronomical Union) pole — the orientation data a body-fixed gravity field or a
//! deep-space ground track needs.
//!
//! ## The Earth path stays byte-identical
//!
//! [`Body::earth`] carries the **exact same literals** the legacy [`crate::forces`] / [`crate::orbit`]
//! constants do (`μ = MU_EARTH`, `Re = RE_EARTH`, `zonals = EARTH_ZONALS_J2_J6`), so the
//! body-parameterised force routines reduce to the original arithmetic — with the original constant
//! and the original operation order — when handed `Body::earth()`. That is what keeps every Earth
//! scenario and reproducibility golden bit-for-bit unchanged.
//!
//! ## Scope (honest)
//!
//! This is a parameter record, not a dynamics engine: it holds the constants the force model
//! consumes. The Mars/Moon/Sun entries carry the standard published constants (IAU/DE values, DE
//! being the JPL Development Ephemeris of the Jet Propulsion Laboratory; cited inline); the
//! non-Earth gravity fields here are the low-degree zonal sets, not full tesseral models (those
//! load through [`crate::gravity_sh::SphericalHarmonicField::from_gfc`] and can be attached via
//! [`Body::gravity`]).

use crate::gravity_sh::SphericalHarmonicField;

/// Degrees → radians, for the IAU pole/prime-meridian constants below (which are published in
/// degrees and degrees-per-day).
const DEG: f64 = std::f64::consts::PI / 180.0;
const TAU: f64 = std::f64::consts::TAU;

/// A central body's gravitational and orientation parameters — the constants a propagator's
/// central-gravity path needs to be body-agnostic instead of Earth-hard-coded.
#[derive(Clone, Debug)]
pub struct Body {
    /// Short body name, for provenance and reporting.
    pub name: &'static str,
    /// Gravitational parameter `μ = GM` (m³/s²).
    pub mu: f64,
    /// Reference radius `Re` (m) — the scale length of the zonal/tesseral expansion.
    pub re: f64,
    /// Unnormalised zonal harmonics `[J2, J3, …]` indexed from degree 2, or `&[]` when the body
    /// is treated as a point mass or its full field is supplied via [`gravity`](Self::gravity).
    pub zonals: &'static [f64],
    /// Optional full tesseral spherical-harmonic field (body-fixed). `None` selects the
    /// two-body + [`zonals`](Self::zonals) path; `Some` supplies a complete `C̄_nm, S̄_nm` model.
    pub gravity: Option<SphericalHarmonicField>,
    /// Body-fixed sidereal spin rate `ω` (rad/s) — the rotation a body-fixed gravity field or a
    /// co-rotating atmosphere turns at.
    pub rotation_rate: f64,
    /// IAU pole right ascension at epoch `α₀` (rad).
    pub pole_ra0: f64,
    /// IAU pole declination at epoch `δ₀` (rad).
    pub pole_dec0: f64,
    /// IAU prime-meridian angle at epoch `W₀` (rad).
    pub prime_w0: f64,
    /// IAU prime-meridian rotation rate `Ẇ` (rad/day).
    pub prime_w_dot: f64,
    /// The rest of the IAU rotation model beyond the four constants above: the pole's century
    /// rates, the quadratic prime-meridian term and the periodic (nutation-precession) terms,
    /// as the NAIF `pck00011.tpc` kernel carries them. `None` evaluates the four constants alone
    /// (the Sun, Earth, Moon and Mars carry their conventional mean constants this way).
    pub iau_terms: Option<IauRotationTerms>,
}

/// The time-dependent part of an IAU rotation model (IAU Working Group on Cartographic
/// Coordinates and Rotational Elements, 2015 report, in the form of the NAIF generic kernel
/// `pck00011.tpc`). With `T` Julian centuries and `d` days past J2000 TDB and the phase angles
/// `θᵢ = θᵢ₀ + θᵢ₁ T + θᵢ₂ T²`:
///
/// * pole right ascension `α = α₀ + α₁ T + Σ aᵢ sin θᵢ`;
/// * pole declination `δ = δ₀ + δ₁ T + Σ bᵢ cos θᵢ`;
/// * prime meridian `W = W₀ + Ẇ d + W₂ d² + Σ cᵢ sin θᵢ`.
///
/// `α₀, δ₀, W₀, Ẇ` are the [`Body`] fields; everything else is here, in degrees.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct IauRotationTerms {
    /// `α₁` (deg per Julian century).
    pub pole_ra_rate_deg_per_century: f64,
    /// `δ₁` (deg per Julian century).
    pub pole_dec_rate_deg_per_century: f64,
    /// `W₂` (deg per day²).
    pub prime_w_quad_deg_per_day2: f64,
    /// Phase angles `[θᵢ₀ (deg), θᵢ₁ (deg/century), θᵢ₂ (deg/century²)]` of the body's system.
    pub angles: &'static [[f64; 3]],
    /// `aᵢ` (deg), paired with `angles` by index.
    pub ra_sin_deg: &'static [f64],
    /// `bᵢ` (deg).
    pub dec_cos_deg: &'static [f64],
    /// `cᵢ` (deg).
    pub w_sin_deg: &'static [f64],
}

impl IauRotationTerms {
    /// The same terms with the prime-meridian part removed (no quadratic or periodic `W`
    /// terms), for a frame that keeps the pole but freezes the prime meridian.
    pub fn without_prime_meridian(self) -> Self {
        Self {
            prime_w_quad_deg_per_day2: 0.0,
            w_sin_deg: &[],
            ..self
        }
    }
}

impl Body {
    /// **Earth** — the byte-identical anchor. Carries the exact legacy literals
    /// ([`crate::forces::MU_EARTH`], [`crate::forces::RE_EARTH`],
    /// [`crate::forces::EARTH_ZONALS_J2_J6`], [`crate::forces::EARTH_ROTATION_RATE`]) so the
    /// body-parameterised force routines reproduce the original Earth arithmetic exactly. The IAU
    /// pole/prime-meridian are the WGS/IAU 2009 Earth values (α₀ = 0.00°, δ₀ = 90.00°, W₀ =
    /// 190.147°, Ẇ = 360.9856235°/day, the GMST rate).
    pub fn earth() -> Self {
        Self {
            name: "Earth",
            mu: crate::forces::MU_EARTH,
            re: crate::forces::RE_EARTH,
            zonals: &crate::forces::EARTH_ZONALS_J2_J6,
            gravity: None,
            rotation_rate: crate::forces::EARTH_ROTATION_RATE,
            pole_ra0: 0.0 * DEG,
            pole_dec0: 90.0 * DEG,
            prime_w0: 190.147 * DEG,
            prime_w_dot: 360.985_623_5 * DEG,
            iau_terms: None,
        }
    }

    /// **Mars** — IAU/DE constants. `μ = 4.282837e13 m³/s²` (Mars-system, MGS/DE), reference
    /// radius `Re = 3 396 200 m` (IAU mean equatorial), the low-degree zonals
    /// `J2 = 1.96045e-3`, `J3 = 3.145e-5`, `J4 = -1.538e-5` (Konopliv et al., MRO110 Mars
    /// gravity), sidereal spin `ω = 7.088218e-5 rad/s`, and the IAU 2009 Mars pole/prime
    /// meridian (α₀ = 317.681°, δ₀ = 52.886°, W₀ = 176.630°, Ẇ = 350.89198226°/day).
    pub fn mars() -> Self {
        Self {
            name: "Mars",
            mu: 4.282_837e13,
            re: 3_396_200.0,
            zonals: &MARS_ZONALS_J2_J4,
            gravity: None,
            rotation_rate: 7.088_218e-5,
            pole_ra0: 317.681 * DEG,
            pole_dec0: 52.886 * DEG,
            prime_w0: 176.630 * DEG,
            prime_w_dot: 350.891_982_26 * DEG,
            iau_terms: None,
        }
    }

    /// **Mars with a low-degree tesseral gravity field** — [`Body::mars`] carrying a
    /// fully-normalized [`SphericalHarmonicField`] (MRO110B2 / GMM-3-class) in its
    /// [`gravity`](Self::gravity) slot, so the propagator's central-gravity path evaluates the
    /// full `C̄_nm, S̄_nm` field (in the Mars body-fixed frame via [`crate::mars_frame`]) instead
    /// of the two-body + zonal path. See [`with_gmm3_gravity`](Self::with_gmm3_gravity) for the
    /// field construction and the coefficient source. `nmax` caps the degree/order (clamped to the
    /// shipped degree 3).
    pub fn mars_gmm3(nmax: usize) -> Self {
        Self::mars().with_gmm3_gravity(nmax)
    }

    /// Attach a fully-normalized **MRO110B2 / GMM-3-class** Mars gravity field to this body,
    /// returning it with [`gravity`](Self::gravity) populated to degree/order `nmax` (clamped to
    /// the shipped degree 3).
    ///
    /// The field is built in-source (no download) from published, fully-normalized coefficients:
    ///
    /// * the **zonals** `C̄20, C̄30, C̄40` are converted from this body's
    ///   [`zonals`](Self::zonals) (`MARS_ZONALS_J2_J4`, Konopliv MRO110) by the standard
    ///   normalization `C̄_{n,0} = −J_n / √(2n+1)` — so the shipped J2/J3/J4 and the SH C̄_{n,0}
    ///   are one and the same constant (a `J2 = −C̄20·√5` round-trip pins it);
    /// * the **tesserals** `C̄22, S̄22` and `C̄32, S̄32` are the fully-normalized MRO110B2
    ///   (Konopliv et al. 2011) values tabulated in Liu, Baoyin & Ma (2012),
    ///   *Periodic orbits around areostationary points in the Martian gravity field* (Astrophys.
    ///   Space Sci., Table 1; arXiv:1203.1775), in the same IAU North-Pole / Airy-0 prime-meridian
    ///   frame [`crate::mars_frame`] realizes. Mars' `C̄22`/`S̄22` are two orders of magnitude
    ///   larger than Earth's — the dominant tesseral signal.
    ///
    /// The field's reference radius is this body's `Re` (`3 396 200 m`, the IAU mean equatorial
    /// radius), whereas the published MRO110B2 product references `3 396 000 m`; the 200 m (≈6e-5
    /// relative) difference rescales the higher-degree `(Re/r)ⁿ` terms by a negligible amount,
    /// far below the field's own accuracy at this degree. Vendoring the full `.gfc` (which carries
    /// its own `radius`) via [`SphericalHarmonicField::from_gfc`] removes even that, for the
    /// production path.
    ///
    /// `C̄00 = 1` is set so the field carries its own central term (`SphericalHarmonicField`
    /// returns the *total* acceleration). `C̄21/S̄21` are omitted: in the principal-axis / IAU
    /// frame the Mars degree-2 order-1 terms are negligible (the pole is the figure axis), and no
    /// trustworthy non-zero value is invented here. Higher degree/order is available by loading a
    /// vendored ICGEM `.gfc` through [`SphericalHarmonicField::from_gfc`] and assigning it to
    /// [`gravity`](Self::gravity) (mirroring the LRO `GRGM660PRIM_to150.gfc` path), which requires
    /// no code change.
    pub fn with_gmm3_gravity(mut self, nmax: usize) -> Self {
        let nmax = nmax.min(MARS_GMM3_NMAX);
        let mut f = SphericalHarmonicField::zeros(self.mu, self.re, nmax);
        f.set(0, 0, 1.0, 0.0);
        // Zonals C̄_{n,0} = −J_n/√(2n+1), from MARS_ZONALS_J2_J4 = [J2, J3, J4].
        for (i, &jn) in self.zonals.iter().enumerate() {
            let n = i + 2;
            f.set(n, 0, -jn / ((2 * n + 1) as f64).sqrt(), 0.0);
        }
        // Tesserals (fully-normalized MRO110B2, Liu/Baoyin/Ma 2012 Table 1).
        f.set(2, 2, MARS_CBAR22, MARS_SBAR22);
        f.set(3, 2, MARS_CBAR32, MARS_SBAR32);
        self.gravity = Some(f);
        self
    }

    /// **Moon** — `μ = MU_MOON` ([`crate::forces::MU_MOON`], the DE value `4.902800066e12`),
    /// reference radius `Re = 1 737 400 m` (IAU mean), the low-degree zonals
    /// `J2 = 2.0321e-4`, `J3 = 8.476e-6` (GRAIL GRGM/LP-derived), sidereal spin
    /// `ω = 2.6617e-6 rad/s`, and the IAU 2009 lunar pole/prime meridian (the mean elements;
    /// the full physical-libration series is the production follow-on).
    pub fn moon() -> Self {
        Self {
            name: "Moon",
            mu: crate::forces::MU_MOON,
            re: 1_737_400.0,
            zonals: &MOON_ZONALS_J2_J3,
            gravity: None,
            rotation_rate: 2.661_699_5e-6,
            pole_ra0: 269.9949 * DEG,
            pole_dec0: 66.5392 * DEG,
            prime_w0: 38.3213 * DEG,
            prime_w_dot: 13.176_358 * DEG,
            iau_terms: None,
        }
    }

    /// **Sun** — point mass. `μ = MU_SUN` ([`crate::forces::MU_SUN`], the IAU value
    /// `1.32712440018e20`), reference radius `Re = 6.957e8 m` (the nominal solar radius), no
    /// zonals (`&[]`), sidereal spin `ω = 2.865e-6 rad/s` (Carrington), and the IAU 2009 solar
    /// pole/prime meridian.
    pub fn sun() -> Self {
        Self {
            name: "Sun",
            mu: crate::forces::MU_SUN,
            re: 6.957e8,
            zonals: &[],
            gravity: None,
            rotation_rate: 2.865_329e-6,
            pole_ra0: 286.13 * DEG,
            pole_dec0: 63.87 * DEG,
            prime_w0: 84.176 * DEG,
            prime_w_dot: 14.1844 * DEG,
            iau_terms: None,
        }
    }

    // ------------------------------------------------------------------------
    // The rest of the solar system. Gravitational parameters: the JPL Horizons
    // body records (planets, DE440-series values) and the JPL Solar System
    // Dynamics planetary-satellite physical-parameter table (moons); Uranus,
    // Neptune, Pluto, Phobos and Deimos from NAIF gm_de440.tpc. Radii: the
    // JPL planetary physical-parameter table (IAU WGCCRE 2015, Archinal et al.
    // 2018). Orientation: the IAU WGCCRE 2015 rotation model as NAIF
    // pck00011.tpc carries it, the constant terms in the four fields and the
    // century rates, quadratic and periodic terms in `iau_terms` (constants at
    // the bottom of this file). A negative prime-meridian rate (and rotation
    // rate) marks retrograde rotation.
    // ------------------------------------------------------------------------

    /// **Mercury** — `μ = 2.203186855e13 m³/s²`, reference radius 2 440 000 m (the radius
    /// `J2 = 5.03e-5` is referenced to: Smith et al. 2012, MESSENGER; the equatorial radius,
    /// 2 440 530 m, is in [`BodyFacts`]),
    /// IAU pole (281.0103°, 61.4155°), `W = 329.5988° + 6.1385108°/day`.
    pub fn mercury() -> Self {
        Self::point(
            "Mercury",
            2.203_186_855e13,
            2_440_000.0,
            &MERCURY_ZONALS_J2,
            [281.0103, 61.4155, 329.5988, 6.138_510_8],
            Some(MERCURY_TERMS),
        )
    }

    /// **Venus** — `μ = 3.24858592e14 m³/s²`, radius 6 051 800 m, no zonal field
    /// carried, IAU pole (272.76°, 67.16°), `W = 160.20° − 1.4813688°/day`
    /// (retrograde).
    pub fn venus() -> Self {
        Self::point(
            "Venus",
            3.248_585_92e14,
            6_051_800.0,
            &[],
            [272.76, 67.16, 160.20, -1.481_368_8],
            None,
        )
    }

    /// **Jupiter** — `μ = 1.266865319e17 m³/s²` (the planet, without its moons),
    /// reference radius 71 492 km, `J2 = 1.46965063e-2` (Iess et al. 2018, Juno,
    /// same reference radius), IAU pole (268.056595°, 64.495303°), System III
    /// `W = 284.95° + 870.5360000°/day`.
    pub fn jupiter() -> Self {
        Self::point(
            "Jupiter",
            1.266_865_319e17,
            71_492_000.0,
            &JUPITER_ZONALS_J2,
            [268.056_595, 64.495_303, 284.95, 870.536_000_0],
            Some(JUPITER_TERMS),
        )
    }

    /// **Saturn** — `μ = 3.7931206234e16 m³/s²`, reference radius **60 330 km**
    /// (the radius Iess et al. 2019 reference their Cassini `J2 = 1.6290573e-2`
    /// to; the 1-bar equatorial radius, 60 268 km, is in [`BodyFacts`]), IAU pole
    /// (40.589°, 83.537°), `W = 38.90° + 810.7939024°/day`.
    pub fn saturn() -> Self {
        Self::point(
            "Saturn",
            3.793_120_623_4e16,
            60_330_000.0,
            &SATURN_ZONALS_J2,
            [40.589, 83.537, 38.90, 810.793_902_4],
            Some(SATURN_TERMS),
        )
    }

    /// **Uranus** — `μ = 5.793951256527211e15 m³/s²` (NAIF `gm_de440.tpc`, BODY799), reference
    /// radius 25 559 km,
    /// `J2 = 3.5107e-3` (Jacobson 2014, same reference radius), IAU pole
    /// (257.311°, −15.175°), `W = 203.81° − 501.1600928°/day` (retrograde).
    pub fn uranus() -> Self {
        Self::point(
            "Uranus",
            5.793_951_256_527_211e15,
            25_559_000.0,
            &URANUS_ZONALS_J2,
            [257.311, -15.175, 203.81, -501.160_092_8],
            None,
        )
    }

    /// **Neptune** — `μ = 6.835103145462294e15 m³/s²` (NAIF `gm_de440.tpc`, BODY899), reference
    /// radius **25 225 km**
    /// (the radius Jacobson 2009 references `J2 = 3.4084e-3` to; the 1-bar
    /// equatorial radius, 24 764 km, is in [`BodyFacts`]), IAU pole (299.36°,
    /// 43.46°, plus the Neptune-node term N), `W = 249.978° + 541.1397757°/day − 0.48° sin N`.
    pub fn neptune() -> Self {
        Self::point(
            "Neptune",
            6.835_103_145_462_294e15,
            25_225_000.0,
            &NEPTUNE_ZONALS_J2,
            [299.36, 43.46, 249.978, 541.139_775_7],
            Some(NEPTUNE_TERMS),
        )
    }

    /// **Pluto** — `μ = 8.696138177608748e11 m³/s²` (Pluto alone, NAIF `gm_de440.tpc`, BODY999),
    /// radius 1 188 300 m, IAU
    /// 2015 pole (132.993°, −6.163°), `W = 302.695° + 56.3625225°/day`.
    pub fn pluto() -> Self {
        Self::point(
            "Pluto",
            8.696_138_177_608_748e11,
            1_188_300.0,
            &[],
            [132.993, -6.163, 302.695, 56.362_522_5],
            None,
        )
    }

    /// **Phobos** — `μ = 7.087546066894452e5 m³/s²` (NAIF `gm_de440.tpc`, BODY401), mean radius
    /// 11 080 m, the IAU 2015 rotation model as corrected in NAIF `pck00011.tpc` (pole
    /// 317.67071657°, 52.88627266° with century rates, `W = 35.18774440° + 1128.84475928°/day`
    /// plus a quadratic term, and the Mars-system periodic terms in [`IauRotationTerms`]).
    pub fn phobos() -> Self {
        Self::point(
            "Phobos",
            7.087_546_066_894_452e5,
            11_080.0,
            &[],
            [
                317.670_716_57,
                52.886_272_66,
                35.187_744_40,
                1_128.844_759_28,
            ],
            Some(PHOBOS_TERMS),
        )
    }

    /// **Deimos** — `μ = 9.615569648120313e4 m³/s²` (NAIF `gm_de440.tpc`, BODY402), mean radius
    /// 6 200 m, the IAU 2015 rotation model of NAIF `pck00011.tpc` (pole 316.65705808°,
    /// 53.50992033° with century rates, `W = 79.39932954° + 285.16188899°/day`, and the
    /// Mars-system periodic terms in [`IauRotationTerms`]).
    pub fn deimos() -> Self {
        Self::point(
            "Deimos",
            9.615_569_648_120_313e4,
            6_200.0,
            &[],
            [316.657_058_08, 53.509_920_33, 79.399_329_54, 285.161_888_99],
            Some(DEIMOS_TERMS),
        )
    }

    /// **Io** — `μ = 5.95991547e12 m³/s²`, mean radius 1 821 490 m, IAU pole
    /// (268.05°, 64.50°), synchronous `W = 200.39° + 203.4889538°/day`.
    pub fn io() -> Self {
        Self::point(
            "Io",
            5.959_915_47e12,
            1_821_490.0,
            &[],
            [268.05, 64.50, 200.39, 203.488_953_8],
            Some(IO_TERMS),
        )
    }

    /// **Europa** — `μ = 3.2027121e12 m³/s²`, mean radius 1 560 800 m, IAU pole
    /// (268.08°, 64.51°), synchronous `W = 36.022° + 101.3747235°/day`.
    pub fn europa() -> Self {
        Self::point(
            "Europa",
            3.202_712_10e12,
            1_560_800.0,
            &[],
            [268.08, 64.51, 36.022, 101.374_723_5],
            Some(EUROPA_TERMS),
        )
    }

    /// **Ganymede** — `μ = 9.88783275e12 m³/s²`, mean radius 2 631 200 m, IAU
    /// pole (268.20°, 64.57°), synchronous `W = 44.064° + 50.3176081°/day`.
    pub fn ganymede() -> Self {
        Self::point(
            "Ganymede",
            9.887_832_75e12,
            2_631_200.0,
            &[],
            [268.20, 64.57, 44.064, 50.317_608_1],
            Some(GANYMEDE_TERMS),
        )
    }

    /// **Callisto** — `μ = 7.1792834e12 m³/s²`, mean radius 2 410 300 m, IAU
    /// pole (268.72°, 64.83°), synchronous `W = 259.51° + 21.5710715°/day`.
    pub fn callisto() -> Self {
        Self::point(
            "Callisto",
            7.179_283_40e12,
            2_410_300.0,
            &[],
            [268.72, 64.83, 259.51, 21.571_071_5],
            Some(CALLISTO_TERMS),
        )
    }

    /// **Titan** — `μ = 8.9781371e12 m³/s²`, mean radius 2 574 760 m, IAU pole
    /// (39.4827°, 83.4279°), synchronous `W = 186.5855° + 22.5769768°/day`.
    pub fn titan() -> Self {
        Self::point(
            "Titan",
            8.978_137_10e12,
            2_574_760.0,
            &[],
            [39.4827, 83.4279, 186.5855, 22.576_976_8],
            None,
        )
    }

    /// A body with no tesseral field, from its `μ`, reference radius, zonals and
    /// IAU `[α₀, δ₀, W₀, Ẇ]` (degrees and degrees per day). The spin rate is `Ẇ`
    /// in rad/s.
    fn point(
        name: &'static str,
        mu: f64,
        re: f64,
        zonals: &'static [f64],
        iau: [f64; 4],
        iau_terms: Option<IauRotationTerms>,
    ) -> Self {
        Self {
            name,
            mu,
            re,
            zonals,
            gravity: None,
            rotation_rate: iau[3] * DEG / 86_400.0,
            pole_ra0: iau[0] * DEG,
            pole_dec0: iau[1] * DEG,
            prime_w0: iau[2] * DEG,
            prime_w_dot: iau[3] * DEG,
            iau_terms,
        }
    }

    /// Look a body up by name (case-insensitive): every body in [`SOLAR_SYSTEM`].
    pub fn by_name(name: &str) -> Option<Self> {
        let n = name.trim().to_ascii_lowercase();
        let b = match n.as_str() {
            "sun" => Self::sun(),
            "mercury" => Self::mercury(),
            "venus" => Self::venus(),
            "earth" => Self::earth(),
            "moon" => Self::moon(),
            "mars" => Self::mars(),
            "phobos" => Self::phobos(),
            "deimos" => Self::deimos(),
            "jupiter" => Self::jupiter(),
            "io" => Self::io(),
            "europa" => Self::europa(),
            "ganymede" => Self::ganymede(),
            "callisto" => Self::callisto(),
            "saturn" => Self::saturn(),
            "titan" => Self::titan(),
            "uranus" => Self::uranus(),
            "neptune" => Self::neptune(),
            "pluto" => Self::pluto(),
            _ => return None,
        };
        Some(b)
    }

    /// The physical record of this body, when it is one of [`SOLAR_SYSTEM`].
    pub fn facts(&self) -> Option<&'static BodyFacts> {
        SOLAR_SYSTEM.iter().find(|f| f.name == self.name)
    }

    /// IAU prime-meridian angle `W` (radians, wrapped to `[0, 2π)`) at `jd_tdb`, with every
    /// quadratic and periodic term in [`iau_terms`](Self::iau_terms).
    pub fn prime_meridian(&self, jd_tdb: f64) -> f64 {
        self.iau_angles_et((jd_tdb - 2_451_545.0) * 86_400.0)
            .2
            .rem_euclid(2.0 * std::f64::consts::PI)
    }

    /// The IAU pole right ascension `α`, declination `δ` and prime meridian `W` (radians; `W`
    /// not wrapped) at `et_tdb_s` seconds past J2000 TDB: the four constant fields plus, when
    /// the body carries [`iau_terms`](Self::iau_terms), the century rates, the quadratic
    /// prime-meridian term and the periodic terms.
    pub fn iau_angles_et(&self, et_tdb_s: f64) -> (f64, f64, f64) {
        let d = et_tdb_s / 86_400.0;
        let mut ra = self.pole_ra0;
        let mut dec = self.pole_dec0;
        let mut w = self.prime_w0 + self.prime_w_dot * d;
        if let Some(t) = &self.iau_terms {
            let tc = d / 36_525.0;
            ra += t.pole_ra_rate_deg_per_century * tc * DEG;
            dec += t.pole_dec_rate_deg_per_century * tc * DEG;
            w += t.prime_w_quad_deg_per_day2 * d * d * DEG;
            for (i, a) in t.angles.iter().enumerate() {
                let theta = ((a[0] + a[1] * tc + a[2] * tc * tc) * DEG).rem_euclid(TAU);
                let (s, c) = theta.sin_cos();
                ra += t.ra_sin_deg.get(i).copied().unwrap_or(0.0) * s * DEG;
                dec += t.dec_cos_deg.get(i).copied().unwrap_or(0.0) * c * DEG;
                w += t.w_sin_deg.get(i).copied().unwrap_or(0.0) * s * DEG;
            }
        }
        (ra, dec, w)
    }

    /// The rotation from the J2000 frame (ICRF axes) to this body's IAU body-fixed frame at
    /// `et_tdb_s` seconds past J2000 TDB: `R_z(W) R_x(90° − δ) R_z(90° + α)` with `α, δ, W` from
    /// [`iau_angles_et`](Self::iau_angles_et), so `r_bodyfixed = R · r_j2000`. The rows of `R` are
    /// the body-fixed axes expressed in J2000.
    pub fn iau_rotation_et(&self, et_tdb_s: f64) -> [[f64; 3]; 3] {
        let (ra, dec, w) = self.iau_angles_et(et_tdb_s);
        let w = w.rem_euclid(TAU);
        euler_313(
            w,
            std::f64::consts::FRAC_PI_2 - dec,
            std::f64::consts::FRAC_PI_2 + ra,
        )
    }
}

/// `R_z(a) · R_x(b) · R_z(c)` (frame rotations).
fn euler_313(a: f64, b: f64, c: f64) -> [[f64; 3]; 3] {
    let (sa, ca) = a.sin_cos();
    let (sb, cb) = b.sin_cos();
    let (sc, cc) = c.sin_cos();
    [
        [ca * cc - sa * cb * sc, ca * sc + sa * cb * cc, sa * sb],
        [-sa * cc - ca * cb * sc, -sa * sc + ca * cb * cc, ca * sb],
        [sb * sc, -sb * cc, cb],
    ]
}

impl Default for Body {
    /// Earth — so types that hold a [`Body`] and derive `Default` (e.g. the propagator's
    /// `ForceModel`) keep their historical Earth default and stay byte-identical.
    fn default() -> Self {
        Self::earth()
    }
}

/// Mars low-degree unnormalised zonals `[J2, J3, J4]` (Konopliv et al., MRO110B2 Mars gravity
/// field). `J2` is the dominant oblateness term; `J3`/`J4` are the leading odd/even corrections.
pub const MARS_ZONALS_J2_J4: [f64; 3] = [1.960_45e-3, 3.145e-5, -1.538e-5];

/// Maximum degree/order of the in-source GMM-3 Mars tesseral field
/// ([`Body::with_gmm3_gravity`]). The field reaches degree 4 in the zonals (`C̄20/C̄30/C̄40`) and
/// degree 3 in the tesserals (`C̄22/S̄22`, `C̄32/S̄32`); a field whose zonal degree exceeds its
/// tesseral degree is well-formed (the absent C̄4m simply stay zero). Higher degree/order loads
/// from a vendored `.gfc` via [`crate::gravity_sh::SphericalHarmonicField::from_gfc`].
const MARS_GMM3_NMAX: usize = 4;

/// Fully-normalized Mars sectoral `C̄22` (MRO110B2, Konopliv et al. 2011; tabulated in Liu,
/// Baoyin & Ma 2012, *Periodic orbits around areostationary points in the Martian gravity field*,
/// Table 1). The dominant tesseral term — two orders of magnitude larger than Earth's.
const MARS_CBAR22: f64 = -0.846_359_145_472_2e-4;
/// Fully-normalized Mars sectoral `S̄22` (same source). Note the sign opposite to `C̄22` (unlike
/// Earth).
const MARS_SBAR22: f64 = 0.489_344_896_683_1e-4;
/// Fully-normalized Mars `C̄32` (same source).
const MARS_CBAR32: f64 = -0.159_479_193_754_6e-4;
/// Fully-normalized Mars `S̄32` (same source).
const MARS_SBAR32: f64 = 0.836_142_557_919_300_3e-5;

/// Moon low-degree unnormalised zonals `[J2, J3]` (GRAIL/LP-derived). The lunar field is far
/// less oblate than Earth's; `J2` ≈ 2e-4.
pub const MOON_ZONALS_J2_J3: [f64; 2] = [2.0321e-4, 8.476e-6];

/// Mercury unnormalised `J2` (Smith et al. 2012, *Gravity field and internal structure of
/// Mercury from MESSENGER*, Science 336:214; reference radius 2 440 km).
pub const MERCURY_ZONALS_J2: [f64; 1] = [5.03e-5];
/// Jupiter unnormalised `J2` (Iess et al. 2018, *Measurement of Jupiter's asymmetric gravity
/// field*, Nature 555:220; reference radius 71 492 km).
pub const JUPITER_ZONALS_J2: [f64; 1] = [14_696.506_3e-6];
/// Saturn unnormalised `J2` (Iess et al. 2019, *Measurement and implications of Saturn's
/// gravity field and ring mass*, Science 364:eaat2965; reference radius 60 330 km).
pub const SATURN_ZONALS_J2: [f64; 1] = [16_290.573e-6];
/// Uranus unnormalised `J2` (Jacobson 2014, AJ 148:76; reference radius 25 559 km).
pub const URANUS_ZONALS_J2: [f64; 1] = [3_510.7e-6];
/// Neptune unnormalised `J2` (Jacobson 2009, AJ 137:4322; reference radius 25 225 km).
pub const NEPTUNE_ZONALS_J2: [f64; 1] = [3_408.4e-6];

/// What kind of body a [`BodyFacts`] record describes.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum BodyClass {
    /// The Sun.
    Star,
    /// One of the eight planets.
    Planet,
    /// A dwarf planet (Pluto).
    DwarfPlanet,
    /// A natural satellite of a planet.
    Moon,
}

/// The physical record of one solar-system body: what a report or a drawing of the
/// solar system needs beyond the dynamics constants in [`Body`].
#[derive(Clone, Copy, Debug)]
pub struct BodyFacts {
    /// Name, matching [`Body::name`].
    pub name: &'static str,
    /// NAIF (Navigation and Ancillary Information Facility) integer code.
    pub naif_id: i32,
    /// Star, planet, dwarf planet or moon.
    pub class: BodyClass,
    /// The body it orbits (`None` for the Sun).
    pub parent: Option<&'static str>,
    /// Equatorial radius (m); for the giant planets the 1-bar level.
    pub radius_equatorial_m: f64,
    /// Volumetric mean radius (m).
    pub radius_mean_m: f64,
    /// Unnormalised `J2` where one is carried, and the radius it is referenced to (m).
    pub j2: Option<(f64, f64)>,
}

impl BodyFacts {
    /// The [`Body`] this record describes.
    pub fn body(&self) -> Body {
        Body::by_name(self.name).expect("every SOLAR_SYSTEM record names a Body::by_name body")
    }
}

/// Every body [`Body::by_name`] knows, Sun first, each planet followed by its moons. Radii:
/// JPL planetary and satellite physical-parameter tables (IAU WGCCRE 2015).
pub const SOLAR_SYSTEM: [BodyFacts; 18] = [
    facts("Sun", 10, BodyClass::Star, None, 695_700.0, 695_700.0, None),
    facts(
        "Mercury",
        199,
        BodyClass::Planet,
        Some("Sun"),
        2_440.53,
        2_439.4,
        Some((5.03e-5, 2_440.0)),
    ),
    facts(
        "Venus",
        299,
        BodyClass::Planet,
        Some("Sun"),
        6_051.8,
        6_051.8,
        None,
    ),
    facts(
        "Earth",
        399,
        BodyClass::Planet,
        Some("Sun"),
        6_378.137,
        6_371.008_4,
        Some((1.082_626_68e-3, 6_378.137)),
    ),
    facts(
        "Moon",
        301,
        BodyClass::Moon,
        Some("Earth"),
        1_737.4,
        1_737.4,
        Some((2.0321e-4, 1_737.4)),
    ),
    facts(
        "Mars",
        499,
        BodyClass::Planet,
        Some("Sun"),
        3_396.19,
        3_389.50,
        Some((1.960_45e-3, 3_396.2)),
    ),
    facts(
        "Phobos",
        401,
        BodyClass::Moon,
        Some("Mars"),
        13.0,
        11.08,
        None,
    ),
    facts("Deimos", 402, BodyClass::Moon, Some("Mars"), 7.8, 6.2, None),
    facts(
        "Jupiter",
        599,
        BodyClass::Planet,
        Some("Sun"),
        71_492.0,
        69_911.0,
        Some((14_696.506_3e-6, 71_492.0)),
    ),
    facts(
        "Io",
        501,
        BodyClass::Moon,
        Some("Jupiter"),
        1_829.4,
        1_821.49,
        None,
    ),
    facts(
        "Europa",
        502,
        BodyClass::Moon,
        Some("Jupiter"),
        1_562.6,
        1_560.8,
        None,
    ),
    facts(
        "Ganymede",
        503,
        BodyClass::Moon,
        Some("Jupiter"),
        2_631.2,
        2_631.2,
        None,
    ),
    facts(
        "Callisto",
        504,
        BodyClass::Moon,
        Some("Jupiter"),
        2_410.3,
        2_410.3,
        None,
    ),
    facts(
        "Saturn",
        699,
        BodyClass::Planet,
        Some("Sun"),
        60_268.0,
        58_232.0,
        Some((16_290.573e-6, 60_330.0)),
    ),
    facts(
        "Titan",
        606,
        BodyClass::Moon,
        Some("Saturn"),
        2_575.15,
        2_574.76,
        None,
    ),
    facts(
        "Uranus",
        799,
        BodyClass::Planet,
        Some("Sun"),
        25_559.0,
        25_362.0,
        Some((3_510.7e-6, 25_559.0)),
    ),
    facts(
        "Neptune",
        899,
        BodyClass::Planet,
        Some("Sun"),
        24_764.0,
        24_622.0,
        Some((3_408.4e-6, 25_225.0)),
    ),
    facts(
        "Pluto",
        999,
        BodyClass::DwarfPlanet,
        Some("Sun"),
        1_188.3,
        1_188.3,
        None,
    ),
];

/// A [`BodyFacts`] record from radii in km (and a `J2` reference radius in km).
const fn facts(
    name: &'static str,
    naif_id: i32,
    class: BodyClass,
    parent: Option<&'static str>,
    radius_equatorial_km: f64,
    radius_mean_km: f64,
    j2_km: Option<(f64, f64)>,
) -> BodyFacts {
    let j2 = match j2_km {
        Some((j, r)) => Some((j, r * 1e3)),
        None => None,
    };
    BodyFacts {
        name,
        naif_id,
        class,
        parent,
        radius_equatorial_m: radius_equatorial_km * 1e3,
        radius_mean_m: radius_mean_km * 1e3,
        j2,
    }
}

// ------------------------------------------------------------------------
// IAU rotation-model terms beyond the four constants, transcribed from the
// NAIF generic kernel pck00011.tpc (IAU WGCCRE 2015 report with the NAIF
// corrections that kernel documents; Phobos from the corrected 2015 model).
// Phase angles are the kernel's BODYn_NUT_PREC_ANGLES of each system, grouped
// [constant, rate per Julian century, rate per century squared]; coefficient
// arrays are paired with the angles by index and stop at the last non-zero
// term. Venus, Uranus, Pluto and Titan carry no non-zero rate or periodic term.
// ------------------------------------------------------------------------

/// pck00011 `BODY1_NUT_PREC_ANGLES` (5 angles): `[θ₀ (deg), θ₁ (deg/century), θ₂ (deg/century²)]`.
const MERCURY_ANGLES: [[f64; 3]; 5] = [
    [174.7910857, 149472.535875, 0.0],
    [349.5821714, 298945.07175, 0.0],
    [164.3732571, 448417.607625, 0.0],
    [339.1643429, 597890.1435, 0.0],
    [153.9554286, 747362.679375, 0.0],
];
/// pck00011 `BODY4_NUT_PREC_ANGLES` (26 angles): `[θ₀ (deg), θ₁ (deg/century), θ₂ (deg/century²)]`.
const MARS_SYSTEM_ANGLES: [[f64; 3]; 26] = [
    [190.72646643, 15917.10818695, 0.0],
    [21.4689247, 31834.27934054, 0.0],
    [332.86082793, 19139.89694742, 0.0],
    [394.93256437, 38280.79631835, 0.0],
    [189.6327156, 41215158.1842005, 12.711923222],
    [121.46893664, 660.22803474, 0.0],
    [231.05028581, 660.9912354, 0.0],
    [251.37314025, 1320.50145245, 0.0],
    [217.98635955, 38279.9612555, 0.0],
    [196.19729402, 19139.83628608, 0.0],
    [198.991226, 19139.4819985, 0.0],
    [226.292679, 38280.8511281, 0.0],
    [249.663391, 57420.7251593, 0.0],
    [266.18351, 76560.636795, 0.0],
    [79.398797, 0.5042615, 0.0],
    [122.433576, 19139.9407476, 0.0],
    [43.058401, 38280.8753272, 0.0],
    [57.663379, 57420.7517205, 0.0],
    [79.476401, 76560.6495004, 0.0],
    [166.325722, 0.5042615, 0.0],
    [129.071773, 19140.0328244, 0.0],
    [36.352167, 38281.0473591, 0.0],
    [56.668646, 57420.929536, 0.0],
    [67.364003, 76560.2552215, 0.0],
    [104.79268, 95700.4387578, 0.0],
    [95.391654, 0.5042615, 0.0],
];
/// pck00011 `BODY5_NUT_PREC_ANGLES` (15 angles): `[θ₀ (deg), θ₁ (deg/century), θ₂ (deg/century²)]`.
const JUPITER_SYSTEM_ANGLES: [[f64; 3]; 15] = [
    [73.32, 91472.9, 0.0],
    [24.62, 45137.2, 0.0],
    [283.9, 4850.7, 0.0],
    [355.8, 1191.3, 0.0],
    [119.9, 262.1, 0.0],
    [229.8, 64.3, 0.0],
    [352.25, 2382.6, 0.0],
    [113.35, 6070.0, 0.0],
    [146.64, 182945.8, 0.0],
    [49.24, 90274.4, 0.0],
    [99.360714, 4850.4046, 0.0],
    [175.895369, 1191.9605, 0.0],
    [300.323162, 262.5475, 0.0],
    [114.012305, 6070.2476, 0.0],
    [49.511251, 64.3, 0.0],
];
/// pck00011 `BODY8_NUT_PREC_ANGLES` (17 angles): `[θ₀ (deg), θ₁ (deg/century), θ₂ (deg/century²)]`.
const NEPTUNE_SYSTEM_ANGLES: [[f64; 3]; 17] = [
    [357.85, 52.316, 0.0],
    [323.92, 62606.6, 0.0],
    [220.51, 55064.2, 0.0],
    [354.27, 46564.5, 0.0],
    [75.31, 26109.4, 0.0],
    [35.36, 14325.4, 0.0],
    [142.61, 2824.6, 0.0],
    [177.85, 52.316, 0.0],
    [647.84, 125213.2, 0.0],
    [355.7, 104.632, 0.0],
    [533.55, 156.948, 0.0],
    [711.4, 209.264, 0.0],
    [889.25, 261.58, 0.0],
    [1067.1, 313.896, 0.0],
    [1244.95, 366.212, 0.0],
    [1422.8, 418.528, 0.0],
    [1600.65, 470.844, 0.0],
];
/// pck00011 BODY199: century rates, quadratic prime-meridian term and periodic terms.
const MERCURY_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.0328,
    pole_dec_rate_deg_per_century: -0.0049,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &MERCURY_ANGLES,
    ra_sin_deg: &[],
    dec_cos_deg: &[],
    w_sin_deg: &[0.01067257, -0.00112309, -0.0001104, -2.539e-05, -5.71e-06],
};
/// pck00011 BODY599: century rates, quadratic prime-meridian term and periodic terms.
const JUPITER_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.006499,
    pole_dec_rate_deg_per_century: 0.002413,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &JUPITER_SYSTEM_ANGLES,
    ra_sin_deg: &[
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.000117, 0.000938, 0.001432, 3e-05,
        0.00215,
    ],
    dec_cos_deg: &[
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5e-05, 0.000404, 0.000617, -1.3e-05,
        0.000926,
    ],
    w_sin_deg: &[],
};
/// pck00011 BODY699: century rates, quadratic prime-meridian term and periodic terms.
const SATURN_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.036,
    pole_dec_rate_deg_per_century: -0.004,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &[],
    ra_sin_deg: &[],
    dec_cos_deg: &[],
    w_sin_deg: &[],
};
/// pck00011 BODY899: century rates, quadratic prime-meridian term and periodic terms.
const NEPTUNE_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: 0.0,
    pole_dec_rate_deg_per_century: 0.0,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &NEPTUNE_SYSTEM_ANGLES,
    ra_sin_deg: &[0.7],
    dec_cos_deg: &[-0.51],
    w_sin_deg: &[-0.48],
};
/// pck00011 BODY401: century rates, quadratic prime-meridian term and periodic terms.
const PHOBOS_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.10844326,
    pole_dec_rate_deg_per_century: -0.06134706,
    prime_w_quad_deg_per_day2: 9.53613703121215e-09,
    angles: &MARS_SYSTEM_ANGLES,
    ra_sin_deg: &[-1.78428399, 0.02212824, -0.01028251, -0.00475595],
    dec_cos_deg: &[-1.07516537, 0.00668626, -0.0064874, 0.00281576],
    w_sin_deg: &[1.42421769, -0.02273783, 0.00410711, 0.00631964, -1.143],
};
/// pck00011 BODY402: century rates, quadratic prime-meridian term and periodic terms.
const DEIMOS_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.10518014,
    pole_dec_rate_deg_per_century: -0.05979094,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &MARS_SYSTEM_ANGLES,
    ra_sin_deg: &[
        0.0, 0.0, 0.0, 0.0, 0.0, 3.09217726, 0.22980637, 0.06418655, 0.02533537, 0.00778695,
    ],
    dec_cos_deg: &[
        0.0, 0.0, 0.0, 0.0, 0.0, 1.83936004, 0.1432532, 0.01911409, -0.0148259, 0.0019243,
    ],
    w_sin_deg: &[
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        -2.73954829,
        -0.39968606,
        -0.06563259,
        -0.0291294,
        0.0169916,
    ],
};
/// pck00011 BODY501: century rates, quadratic prime-meridian term and periodic terms.
const IO_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.009,
    pole_dec_rate_deg_per_century: 0.003,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &JUPITER_SYSTEM_ANGLES,
    ra_sin_deg: &[0.0, 0.0, 0.094, 0.024],
    dec_cos_deg: &[0.0, 0.0, 0.04, 0.011],
    w_sin_deg: &[0.0, 0.0, -0.085, -0.022],
};
/// pck00011 BODY502: century rates, quadratic prime-meridian term and periodic terms.
const EUROPA_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.009,
    pole_dec_rate_deg_per_century: 0.003,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &JUPITER_SYSTEM_ANGLES,
    ra_sin_deg: &[0.0, 0.0, 0.0, 1.086, 0.06, 0.015, 0.009],
    dec_cos_deg: &[0.0, 0.0, 0.0, 0.468, 0.026, 0.007, 0.002],
    w_sin_deg: &[0.0, 0.0, 0.0, -0.98, -0.054, -0.014, -0.008],
};
/// pck00011 BODY503: century rates, quadratic prime-meridian term and periodic terms.
const GANYMEDE_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.009,
    pole_dec_rate_deg_per_century: 0.003,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &JUPITER_SYSTEM_ANGLES,
    ra_sin_deg: &[0.0, 0.0, 0.0, -0.037, 0.431, 0.091],
    dec_cos_deg: &[0.0, 0.0, 0.0, -0.016, 0.186, 0.039],
    w_sin_deg: &[0.0, 0.0, 0.0, 0.033, -0.389, -0.082],
};
/// pck00011 BODY504: century rates, quadratic prime-meridian term and periodic terms.
const CALLISTO_TERMS: IauRotationTerms = IauRotationTerms {
    pole_ra_rate_deg_per_century: -0.009,
    pole_dec_rate_deg_per_century: 0.003,
    prime_w_quad_deg_per_day2: 0.0,
    angles: &JUPITER_SYSTEM_ANGLES,
    ra_sin_deg: &[0.0, 0.0, 0.0, 0.0, -0.068, 0.59, 0.0, 0.01],
    dec_cos_deg: &[0.0, 0.0, 0.0, 0.0, -0.029, 0.254, 0.0, -0.004],
    w_sin_deg: &[0.0, 0.0, 0.0, 0.0, 0.061, -0.533, 0.0, -0.009],
};

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces;

    /// The Earth body is the byte-identical anchor: its `μ`, reference radius and zonal field must
    /// be the *exact* legacy constants the force routines have always used, so the
    /// body-parameterised path reduces to the original Earth arithmetic.
    #[test]
    fn body_earth_matches_legacy_constants() {
        let e = Body::earth();
        assert_eq!(
            e.mu,
            forces::MU_EARTH,
            "Earth μ must be the legacy MU_EARTH"
        );
        assert_eq!(
            e.re,
            forces::RE_EARTH,
            "Earth Re must be the legacy RE_EARTH"
        );
        assert_eq!(
            e.zonals,
            forces::EARTH_ZONALS_J2_J6,
            "Earth zonals must be the legacy EARTH_ZONALS_J2_J6"
        );
        assert_eq!(
            e.rotation_rate,
            forces::EARTH_ROTATION_RATE,
            "Earth spin must be the legacy EARTH_ROTATION_RATE"
        );
        assert!(
            e.gravity.is_none(),
            "Earth uses the zonal path, not an SH field"
        );
        assert_eq!(e.name, "Earth");
    }

    /// The non-Earth bodies carry the cited constants and the right gravity-path selection.
    #[test]
    fn other_bodies_carry_their_constants() {
        let mars = Body::mars();
        assert_eq!(mars.mu, 4.282_837e13);
        assert_eq!(mars.re, 3_396_200.0);
        assert_eq!(mars.zonals[0], 1.960_45e-3);

        let moon = Body::moon();
        assert_eq!(moon.mu, forces::MU_MOON);
        assert_eq!(moon.re, 1_737_400.0);

        let sun = Body::sun();
        assert_eq!(sun.mu, forces::MU_SUN);
        assert!(sun.zonals.is_empty(), "the Sun is a point mass here");
    }

    #[test]
    fn every_catalogue_body_resolves_by_name_and_carries_its_record() {
        assert_eq!(SOLAR_SYSTEM.len(), 18);
        for f in SOLAR_SYSTEM.iter() {
            let b = Body::by_name(f.name).expect(f.name);
            assert_eq!(b.name, f.name);
            assert_eq!(b.facts().map(|x| x.naif_id), Some(f.naif_id));
            assert!(
                b.mu > 0.0 && f.radius_mean_m > 0.0 && f.radius_equatorial_m >= f.radius_mean_m
            );
            if let Some(p) = f.parent {
                assert!(Body::by_name(p).is_some(), "{} parent {p}", f.name);
            }
            // Case-insensitive lookup.
            assert!(Body::by_name(&f.name.to_ascii_uppercase()).is_some());
        }
        assert!(Body::by_name("Vulcan").is_none());
    }

    #[test]
    fn a_zonal_field_is_referenced_to_its_sources_radius() {
        // Where a body carries J2, its Body::re is the radius that J2 is referenced to, and
        // the record states the same J2 and radius.
        for f in SOLAR_SYSTEM.iter() {
            let b = f.body();
            if let (Some((j2, r)), Some(z)) = (f.j2, b.zonals.first()) {
                assert_eq!(*z, j2, "{}", f.name);
                assert!((b.re - r).abs() < 1.0, "{}: re {} vs {r}", f.name, b.re);
            }
        }
        assert_eq!(Body::saturn().re, 60_330_000.0);
        assert_eq!(Body::neptune().re, 25_225_000.0);
    }

    #[test]
    fn retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate() {
        for n in ["Venus", "Uranus"] {
            assert!(Body::by_name(n).unwrap().rotation_rate < 0.0, "{n}");
        }
        // Jupiter System III: 870.536 deg/day is a 9 h 55 m 29.7 s sidereal day.
        let j = Body::jupiter();
        let period_s = 2.0 * std::f64::consts::PI / j.rotation_rate;
        assert!((period_s - 35_729.7).abs() < 0.5, "{period_s}");
        let w = j.prime_meridian(2_451_545.0).to_degrees();
        assert!((w - 284.95).abs() < 1e-9);
    }
}
