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
        }
    }

    // ------------------------------------------------------------------------
    // The rest of the solar system. Gravitational parameters: the JPL Horizons
    // body records (planets, DE440-series values) and the JPL Solar System
    // Dynamics planetary-satellite physical-parameter table (moons). Radii: the
    // JPL planetary physical-parameter table (IAU WGCCRE 2015, Archinal et al.
    // 2018). Pole, prime meridian and rate: IAU WGCCRE 2015 mean values (2009
    // for Phobos and Deimos), without the T-rate and periodic terms. A negative
    // prime-meridian rate (and rotation rate) marks retrograde rotation.
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
        )
    }

    /// **Uranus** — `μ = 5.7939506103e15 m³/s²`, reference radius 25 559 km,
    /// `J2 = 3.5107e-3` (Jacobson 2014, same reference radius), IAU pole
    /// (257.311°, −15.175°), `W = 203.81° − 501.1600928°/day` (retrograde).
    pub fn uranus() -> Self {
        Self::point(
            "Uranus",
            5.793_950_610_3e15,
            25_559_000.0,
            &URANUS_ZONALS_J2,
            [257.311, -15.175, 203.81, -501.160_092_8],
        )
    }

    /// **Neptune** — `μ = 6.83509997e15 m³/s²`, reference radius **25 225 km**
    /// (the radius Jacobson 2009 references `J2 = 3.4084e-3` to; the 1-bar
    /// equatorial radius, 24 764 km, is in [`BodyFacts`]), IAU pole (299.36°,
    /// 43.46°, without the Neptune-node terms), `W = 249.978° + 541.1397757°/day`.
    pub fn neptune() -> Self {
        Self::point(
            "Neptune",
            6.835_099_97e15,
            25_225_000.0,
            &NEPTUNE_ZONALS_J2,
            [299.36, 43.46, 249.978, 541.139_775_7],
        )
    }

    /// **Pluto** — `μ = 8.69326e11 m³/s²` (Pluto alone), radius 1 188 300 m, IAU
    /// 2015 pole (132.993°, −6.163°), `W = 302.695° + 56.3625225°/day`.
    pub fn pluto() -> Self {
        Self::point(
            "Pluto",
            8.693_26e11,
            1_188_300.0,
            &[],
            [132.993, -6.163, 302.695, 56.362_522_5],
        )
    }

    /// **Phobos** — `μ = 7.087e5 m³/s²`, mean radius 11 080 m, IAU 2009 pole
    /// (317.68°, 52.90°), synchronous `W = 35.06° + 1128.8445850°/day`.
    pub fn phobos() -> Self {
        Self::point(
            "Phobos",
            7.087e5,
            11_080.0,
            &[],
            [317.68, 52.90, 35.06, 1_128.844_585_0],
        )
    }

    /// **Deimos** — `μ = 9.62e4 m³/s²`, mean radius 6 200 m, IAU 2009 pole
    /// (316.65°, 53.52°), synchronous `W = 79.41° + 285.1618970°/day`.
    pub fn deimos() -> Self {
        Self::point(
            "Deimos",
            9.62e4,
            6_200.0,
            &[],
            [316.65, 53.52, 79.41, 285.161_897_0],
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
        )
    }

    /// A body with no tesseral field, from its `μ`, reference radius, zonals and
    /// IAU `[α₀, δ₀, W₀, Ẇ]` (degrees and degrees per day). The spin rate is `Ẇ`
    /// in rad/s.
    fn point(name: &'static str, mu: f64, re: f64, zonals: &'static [f64], iau: [f64; 4]) -> Self {
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

    /// IAU prime-meridian angle `W` (radians, wrapped to `[0, 2π)`) at `jd_tdb`.
    pub fn prime_meridian(&self, jd_tdb: f64) -> f64 {
        (self.prime_w0 + self.prime_w_dot * (jd_tdb - 2_451_545.0))
            .rem_euclid(2.0 * std::f64::consts::PI)
    }
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
        13.1,
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
