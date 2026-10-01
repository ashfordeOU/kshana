// SPDX-License-Identifier: AGPL-3.0-only
//! Built-in **low-precision analytical ephemerides** for the third-body perturbing bodies, so
//! the numerical propagator's third-body force ([`crate::forces::third_body_accel`]) needs no
//! external DE/SPK kernel (JPL Development Ephemeris in the Spacecraft and Planet Kernel format;
//! JPL = Jet Propulsion Laboratory) for a low-fidelity run.
//!
//! Both models are the closed-form series of Montenbruck & Gill, *Satellite Orbits* (§3.3.2): the
//! Sun to ~0.005° in geocentric ecliptic longitude and ~few·10⁻⁴ AU (astronomical unit) in
//! distance, the Moon to ~0.3° / ~few·10² km over a few decades around J2000. That is ample for the
//! third-body *perturbation* on a near-Earth orbit (only ~5·10⁻⁷ m/s² for the Sun, ~1·10⁻⁶ m/s² for
//! the Moon), where the body direction matters far more than sub-arcsecond position. For
//! DE405/DE440-grade positions (a high-fidelity run) an external ephemeris kernel is the path (see
//! `ROADMAP.md`).
//!
//! Positions are returned in metres in the **geocentric mean-equator/equinox of date** frame, a
//! close approximation to the ECI (Earth-centred inertial) frame the propagator integrates in (the
//! precession/nutation difference is well below the model's own truncation error). The lunar
//! series' mean longitude carries the `−1.3972°·T` precession term, so its longitude is in fact
//! referred to the J2000 equinox; against JPL Horizons it lands within 0.05° of the J2000
//! geocentric Moon from 2000 to 2040 (see [`moon_icrf`]).
//!
//! ## The rest of the solar system
//!
//! The same module carries the planets and the major moons, again from published closed forms:
//!
//! * [`standish_state`]: every planet (and the Earth-Moon barycentre) from the JPL Keplerian
//!   elements of Standish & Williams, Table 1 (1800 AD to 2050 AD) and Tables 2a/2b (3000 BC to
//!   3000 AD), with TDB (Barycentric Dynamical Time) as the time argument, heliocentric in the
//!   J2000 ecliptic, with the page's nominal error per planet in
//!   [`standish_nominal_error`];
//! * [`satellite_state`]: Phobos, Deimos, Io, Europa, Ganymede, Callisto and Titan,
//!   planetocentric in the ICRF (International Celestial Reference Frame), from JPL mean elements
//!   and the IAU (International Astronomical Union) rotation model.
//!
//! [`crate::ephem_provider::AnalyticSolarSystem`] composes them into any body relative to any
//! other; `tests/solar_system_horizons_reference.rs` checks them against JPL Horizons.

type Vec3 = [f64; 3];

/// J2000.0 mean obliquity of the ecliptic (rad), `23.43929111°`.
const OBLIQUITY_J2000: f64 = 23.439_291_11 * std::f64::consts::PI / 180.0;
/// One astronomical unit (m), IAU 2012 definition — for reference/scale.
pub const AU_M: f64 = 1.495_978_707e11;

/// Geocentric Sun position (m, mean-equator/equinox of date) from the Montenbruck & Gill
/// low-precision series. `t_tt_jc` is the time in Julian centuries of Terrestrial Time since
/// J2000.0 (`(JD_TT − 2451545.0) / 36525`).
pub fn sun_position(t_tt_jc: f64) -> Vec3 {
    let deg = std::f64::consts::PI / 180.0;
    let t = t_tt_jc;
    // Solar mean anomaly (deg → rad).
    let m = (357.5256 + 35999.049 * t) * deg;
    // Geocentric ecliptic longitude (the 6892″ and 72″ terms are the equation of centre).
    let lambda = (282.94) * deg + m + (6892.0 * m.sin() + 72.0 * (2.0 * m).sin()) * (deg / 3600.0);
    // Geocentric distance (m): 1 AU modulated by the Earth's orbital eccentricity.
    let r = (149.619 - 2.499 * m.cos() - 0.021 * (2.0 * m).cos()) * 1e9;
    // Ecliptic → equatorial rotation about the x-axis by the obliquity.
    let (sl, cl) = lambda.sin_cos();
    let (se, ce) = OBLIQUITY_J2000.sin_cos();
    [r * cl, r * sl * ce, r * sl * se]
}

/// Geocentric Moon position (m, mean-equator/equinox of date) from the Montenbruck & Gill
/// low-precision lunar series (§3.3.2). `t_tt_jc` is the time in Julian centuries of
/// Terrestrial Time since J2000.0. The series carries the dominant evection, variation and
/// annual-equation terms, so the geocentric distance respects the real perigee/apogee envelope
/// (~356 500–406 700 km) and the ecliptic latitude the lunar-orbit inclination (≤ ~5.3°).
pub fn moon_position(t_tt_jc: f64) -> Vec3 {
    let deg = std::f64::consts::PI / 180.0;
    let asec = deg / 3600.0; // one arcsecond in radians
    let t = t_tt_jc;
    // Fundamental arguments (mean longitude L0, Moon's anomaly l, Sun's anomaly lp, argument of
    // latitude f, mean elongation d), all in radians.
    let l0 = (218.31617 + 481_267.880_88 * t - 1.3972 * t) * deg;
    let l = (134.96292 + 477_198.867_53 * t) * deg;
    let lp = (357.52543 + 35_999.049_44 * t) * deg;
    let f = (93.27283 + 483_202.018_73 * t) * deg;
    let d = (297.85027 + 445_267.111_35 * t) * deg;

    // Ecliptic longitude: mean longitude plus the periodic series (coefficients in arcseconds).
    let dlon = 22640.0 * l.sin() + 769.0 * (2.0 * l).sin() - 4586.0 * (l - 2.0 * d).sin()
        + 2370.0 * (2.0 * d).sin()
        - 668.0 * lp.sin()
        - 412.0 * (2.0 * f).sin()
        - 212.0 * (2.0 * l - 2.0 * d).sin()
        - 206.0 * (l + lp - 2.0 * d).sin()
        + 192.0 * (l + 2.0 * d).sin()
        - 165.0 * (lp - 2.0 * d).sin()
        + 148.0 * (l - lp).sin()
        - 125.0 * d.sin()
        - 110.0 * (l + lp).sin()
        - 55.0 * (2.0 * f - 2.0 * d).sin();
    let lambda = l0 + dlon * asec;

    // Ecliptic latitude (the leading 18520″ ≈ 5.14° term carries the lunar inclination).
    let beta = 18520.0
        * (f + (lambda - l0) + (412.0 * (2.0 * f).sin() + 541.0 * lp.sin()) * asec).sin()
        - 526.0 * (f - 2.0 * d).sin()
        + 44.0 * (l + f - 2.0 * d).sin()
        - 31.0 * (-l + f - 2.0 * d).sin()
        - 23.0 * (lp + f - 2.0 * d).sin()
        + 11.0 * (-2.0 * l + f - 2.0 * d).sin()
        - 25.0 * (-2.0 * l + f).sin()
        + 21.0 * (-l + f).sin();
    let beta = beta * asec;

    // Geocentric distance (km → m).
    let r = (385_000.0
        - 20905.0 * l.cos()
        - 3699.0 * (2.0 * d - l).cos()
        - 2956.0 * (2.0 * d).cos()
        - 570.0 * (2.0 * l).cos()
        + 246.0 * (2.0 * l - 2.0 * d).cos()
        - 205.0 * (lp - 2.0 * d).cos()
        - 171.0 * (l + 2.0 * d).cos()
        - 152.0 * (l + lp - 2.0 * d).cos())
        * 1e3;

    // Spherical ecliptic → Cartesian ecliptic → equatorial (rotate about x by the obliquity).
    let (sb, cb) = beta.sin_cos();
    let (sl, cl) = lambda.sin_cos();
    let (se, ce) = OBLIQUITY_J2000.sin_cos();
    let (xe, ye, ze) = (r * cb * cl, r * cb * sl, r * sb);
    [xe, ce * ye - se * ze, se * ye + ce * ze]
}

// ============================================================================
// Planets: JPL "Keplerian Elements for Approximate Positions of the Major
// Planets" (E. M. Standish and J. G. Williams, 1992; the tables as published at
// https://ssd.jpl.nasa.gov/planets/approx_pos.html).
//
// Heliocentric positions from six mean elements and their linear rates, with
// respect to the mean ecliptic and equinox of J2000. Two tables: Table 1, fitted
// for 1800 AD to 2050 AD, and Tables 2a/2b, fitted for 3000 BC to 3000 AD with
// the extra mean-anomaly terms b, c, s, f for Jupiter to Neptune. The page states
// a nominal error for every planet in heliocentric longitude, latitude and
// distance ([`standish_nominal_error`]); tests/solar_system_horizons_reference.rs
// checks both tables against JPL Horizons.
// ============================================================================

/// J2000 obliquity of the ecliptic the Standish page uses for its ecliptic to
/// equatorial (ICRF) rotation: `23.43928°`.
pub const STANDISH_OBLIQUITY_DEG: f64 = 23.439_28;

/// A planet of the Standish tables (plus Pluto, from the 1992 Table 1 that the
/// current page no longer lists).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Planet {
    /// Mercury.
    Mercury,
    /// Venus.
    Venus,
    /// The Earth-Moon barycentre: the Standish tables give its orbit, not the
    /// Earth's.
    EarthMoonBarycentre,
    /// Mars.
    Mars,
    /// Jupiter.
    Jupiter,
    /// Saturn.
    Saturn,
    /// Uranus.
    Uranus,
    /// Neptune.
    Neptune,
    /// Pluto, from the 1992 Table 1 row (1800 AD to 2050 AD only). The current
    /// JPL page removed it and states no error for it, so a Pluto position is
    /// always MODELLED.
    Pluto,
}

impl Planet {
    /// Every planet, in heliocentric order.
    pub const ALL: [Planet; 9] = [
        Planet::Mercury,
        Planet::Venus,
        Planet::EarthMoonBarycentre,
        Planet::Mars,
        Planet::Jupiter,
        Planet::Saturn,
        Planet::Uranus,
        Planet::Neptune,
        Planet::Pluto,
    ];

    /// Display name.
    pub fn name(self) -> &'static str {
        match self {
            Planet::Mercury => "Mercury",
            Planet::Venus => "Venus",
            Planet::EarthMoonBarycentre => "Earth-Moon barycentre",
            Planet::Mars => "Mars",
            Planet::Jupiter => "Jupiter",
            Planet::Saturn => "Saturn",
            Planet::Uranus => "Uranus",
            Planet::Neptune => "Neptune",
            Planet::Pluto => "Pluto",
        }
    }

    fn index(self) -> usize {
        match self {
            Planet::Mercury => 0,
            Planet::Venus => 1,
            Planet::EarthMoonBarycentre => 2,
            Planet::Mars => 3,
            Planet::Jupiter => 4,
            Planet::Saturn => 5,
            Planet::Uranus => 6,
            Planet::Neptune => 7,
            Planet::Pluto => 8,
        }
    }
}

/// Which Standish table an element set comes from.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum StandishTable {
    /// Table 1: fitted for 1800 AD to 2050 AD.
    Table1,
    /// Tables 2a and 2b: fitted for 3000 BC to 3000 AD.
    Table2,
}

impl StandishTable {
    /// Short label for reports.
    pub fn label(self) -> &'static str {
        match self {
            StandishTable::Table1 => "Standish Table 1 (1800 AD to 2050 AD)",
            StandishTable::Table2 => "Standish Tables 2a/2b (3000 BC to 3000 AD)",
        }
    }

    /// The table whose fit interval contains `t_tdb_jc` (Julian centuries of TDB
    /// since J2000): Table 1 inside 1800 AD to 2050 AD, where it is the more
    /// accurate, and Tables 2a/2b elsewhere. `None` outside 3000 BC to 3000 AD.
    pub fn for_epoch(t_tdb_jc: f64) -> Option<StandishTable> {
        if (TABLE1_T_MIN..=TABLE1_T_MAX).contains(&t_tdb_jc) {
            Some(StandishTable::Table1)
        } else if (TABLE2_T_MIN..=TABLE2_T_MAX).contains(&t_tdb_jc) {
            Some(StandishTable::Table2)
        } else {
            None
        }
    }
}

/// Table 1's interval, 1800-01-01 to 2050-01-01, in Julian centuries from J2000.
const TABLE1_T_MIN: f64 = -2.0;
const TABLE1_T_MAX: f64 = 0.5;
/// Tables 2a/2b's interval, 3000 BC to 3000 AD, in Julian centuries from J2000.
const TABLE2_T_MIN: f64 = -50.0;
const TABLE2_T_MAX: f64 = 10.0;

/// One planet's row: `[a, e, I, L, ϖ, Ω]` at J2000 then their rates per Julian
/// century, in au, radians (e), and degrees.
type StandishRow = [f64; 12];

/// Standish Table 1 (1800 AD to 2050 AD), transcribed from
/// https://ssd.jpl.nasa.gov/planets/approx_pos.html; the Pluto row is the 1992
/// Table 1 row the page has since removed.
const TABLE1: [StandishRow; 9] = [
    [
        0.387_099_27,
        0.205_635_93,
        7.004_979_02,
        252.250_323_50,
        77.457_796_28,
        48.330_765_93,
        0.000_000_37,
        0.000_019_06,
        -0.005_947_49,
        149_472.674_111_75,
        0.160_476_89,
        -0.125_340_81,
    ],
    [
        0.723_335_66,
        0.006_776_72,
        3.394_676_05,
        181.979_099_50,
        131.602_467_18,
        76.679_842_55,
        0.000_003_90,
        -0.000_041_07,
        -0.000_788_90,
        58_517.815_387_29,
        0.002_683_29,
        -0.277_694_18,
    ],
    [
        1.000_002_61,
        0.016_711_23,
        -0.000_015_31,
        100.464_571_66,
        102.937_681_93,
        0.0,
        0.000_005_62,
        -0.000_043_92,
        -0.012_946_68,
        35_999.372_449_81,
        0.323_273_640,
        0.0,
    ],
    [
        1.523_710_34,
        0.093_394_10,
        1.849_691_42,
        -4.553_432_05,
        -23.943_629_59,
        49.559_538_91,
        0.000_018_47,
        0.000_078_82,
        -0.008_131_31,
        19_140.302_684_99,
        0.444_410_88,
        -0.292_573_43,
    ],
    [
        5.202_887_00,
        0.048_386_24,
        1.304_396_95,
        34.396_440_51,
        14.728_479_83,
        100.473_909_09,
        -0.000_116_07,
        -0.000_132_53,
        -0.001_837_14,
        3_034.746_127_75,
        0.212_526_68,
        0.204_691_06,
    ],
    [
        9.536_675_94,
        0.053_861_79,
        2.485_991_87,
        49.954_244_23,
        92.598_878_31,
        113.662_424_48,
        -0.001_250_60,
        -0.000_509_91,
        0.001_936_09,
        1_222.493_622_01,
        -0.418_972_16,
        -0.288_677_94,
    ],
    [
        19.189_164_640,
        0.047_257_44,
        0.772_637_83,
        313.238_104_51,
        170.954_276_30,
        74.016_925_03,
        -0.001_961_76,
        -0.000_043_97,
        -0.002_429_39,
        428.482_027_85,
        0.408_052_81,
        0.042_405_89,
    ],
    [
        30.069_922_76,
        0.008_590_48,
        1.770_043_47,
        -55.120_029_69,
        44.964_762_27,
        131.784_225_74,
        0.000_262_91,
        0.000_051_05,
        0.000_353_72,
        218.459_453_25,
        -0.322_414_640,
        -0.005_086_640,
    ],
    [
        39.482_116_75,
        0.248_827_30,
        17.140_012_06,
        238.929_038_33,
        224.068_916_29,
        110.303_936_84,
        -0.000_315_96,
        0.000_051_70,
        0.000_048_18,
        145.207_805_15,
        -0.040_629_42,
        -0.011_834_82,
    ],
];

/// Standish Table 2a (3000 BC to 3000 AD), same layout, Mercury to Neptune.
const TABLE2A: [StandishRow; 8] = [
    [
        0.387_098_43,
        0.205_636_61,
        7.005_594_320,
        252.251_667_24,
        77.457_718_95,
        48.339_618_19,
        0.000_000_00,
        0.000_021_23,
        -0.005_901_58,
        149_472.674_866_23,
        0.159_400_13,
        -0.122_141_82,
    ],
    [
        0.723_321_02,
        0.006_763_99,
        3.397_775_45,
        181.979_708_50,
        131.767_557_13,
        76.672_614_96,
        -0.000_000_26,
        -0.000_051_07,
        0.000_434_94,
        58_517.815_602_60,
        0.056_796_48,
        -0.272_741_74,
    ],
    [
        1.000_000_18,
        0.016_731_63,
        -0.000_543_46,
        100.466_915_72,
        102.930_058_85,
        -5.112_603_89,
        -0.000_000_03,
        -0.000_036_61,
        -0.013_371_78,
        35_999.373_063_29,
        0.317_952_60,
        -0.241_238_56,
    ],
    [
        1.523_712_43,
        0.093_365_11,
        1.851_818_69,
        -4.568_131_640,
        -23.917_447_84,
        49.713_209_84,
        0.000_000_97,
        0.000_091_49,
        -0.007_247_57,
        19_140.299_342_43,
        0.452_236_25,
        -0.268_524_31,
    ],
    [
        5.202_480_19,
        0.048_535_90,
        1.298_614_16,
        34.334_791_52,
        14.274_952_44,
        100.292_826_54,
        -0.000_028_640,
        0.000_180_26,
        -0.003_226_99,
        3_034.903_717_57,
        0.181_991_96,
        0.130_246_19,
    ],
    [
        9.541_498_83,
        0.055_508_25,
        2.494_241_02,
        50.075_713_29,
        92.861_360_63,
        113.639_987_02,
        -0.000_030_65,
        -0.000_320_44,
        0.004_519_69,
        1_222.114_947_24,
        0.541_794_78,
        -0.250_150_02,
    ],
    [
        19.187_979_48,
        0.046_857_40,
        0.772_981_27,
        314.202_766_25,
        172.434_044_41,
        73.962_502_15,
        -0.000_204_55,
        -0.000_015_50,
        -0.001_801_55,
        428.495_125_95,
        0.092_669_85,
        0.057_396_99,
    ],
    [
        30.069_527_52,
        0.008_954_39,
        1.770_055_20,
        304.222_892_87,
        46.681_587_24,
        131.786_358_53,
        0.000_064_47,
        0.000_008_18,
        0.000_224_00,
        218.465_153_14,
        0.010_099_38,
        -0.006_063_02,
    ],
];

/// Standish Table 2b: the extra mean-anomaly terms `[b, c, s, f]` (degrees, and
/// `f` in degrees per century) for Jupiter, Saturn, Uranus and Neptune.
const TABLE2B: [[f64; 4]; 4] = [
    [-0.000_124_52, 0.060_640_60, -0.356_354_38, 38.351_250_00],
    [0.000_258_99, -0.134_344_69, 0.873_201_47, 38.351_250_00],
    [0.000_583_31, -0.977_318_48, 0.176_892_45, 7.670_250_00],
    [-0.000_413_48, 0.683_463_18, -0.101_625_47, 7.670_250_00],
];

/// The nominal error the Standish page states for a planet and table, in
/// heliocentric ecliptic longitude (arcsec), latitude (arcsec) and distance (m).
/// `None` for Pluto, for which the current page states none.
pub fn standish_nominal_error(p: Planet, table: StandishTable) -> Option<[f64; 3]> {
    // Longitude arcsec, latitude arcsec, distance in thousands of km.
    const T1: [[f64; 3]; 8] = [
        [15.0, 1.0, 1.0],
        [20.0, 1.0, 4.0],
        [20.0, 8.0, 6.0],
        [40.0, 2.0, 25.0],
        [400.0, 10.0, 600.0],
        [600.0, 25.0, 1500.0],
        [50.0, 2.0, 1000.0],
        [10.0, 1.0, 200.0],
    ];
    const T2: [[f64; 3]; 8] = [
        [20.0, 15.0, 1.0],
        [40.0, 30.0, 8.0],
        [40.0, 15.0, 15.0],
        [100.0, 40.0, 30.0],
        [600.0, 100.0, 1000.0],
        [1000.0, 100.0, 4000.0],
        [2000.0, 30.0, 8000.0],
        [400.0, 15.0, 4000.0],
    ];
    if p == Planet::Pluto {
        return None;
    }
    let row = match table {
        StandishTable::Table1 => T1[p.index()],
        StandishTable::Table2 => T2[p.index()],
    };
    Some([row[0], row[1], row[2] * 1.0e6])
}

/// A heliocentric state from the Standish elements: position (m) and velocity
/// (m/s) in the mean ecliptic and equinox of J2000.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct EclipticState {
    /// Heliocentric position, J2000 mean ecliptic and equinox, x y z (m).
    pub pos_m: Vec3,
    /// Heliocentric velocity, J2000 mean ecliptic and equinox, x y z (m/s).
    pub vel_m_s: Vec3,
}

/// Seconds per Julian century, to turn the tables' per-century rates into SI.
const SECONDS_PER_JULIAN_CENTURY: f64 = 36_525.0 * 86_400.0;

/// Solve Kepler's equation `M = E − e·sin E` for `E` (radians) by Newton
/// iteration from the page's starting guess `E₀ = M + e·sin M`.
pub fn solve_kepler(m_rad: f64, e: f64) -> f64 {
    let mut ecc_anom = m_rad + e * m_rad.sin();
    for _ in 0..50 {
        let d = (m_rad - (ecc_anom - e * ecc_anom.sin())) / (1.0 - e * ecc_anom.cos());
        ecc_anom += d;
        if d.abs() < 1e-14 {
            break;
        }
    }
    ecc_anom
}

/// Heliocentric position and velocity of `planet` from Standish `table`, at
/// `t_tdb_jc` Julian centuries of TDB since J2000, in the mean ecliptic and
/// equinox of J2000. `None` for Pluto from Tables 2a/2b, which have no Pluto row.
///
/// The position follows the page's algorithm step for step: elements at `T`,
/// `ω = ϖ − Ω`, `M = L − ϖ + bT² + c·cos(fT) + s·sin(fT)` wrapped to ±180°,
/// Kepler's equation, the orbital-plane coordinates and the rotation
/// `R_z(−Ω)·R_x(−I)·R_z(−ω)`. The velocity is the two-body derivative with the
/// mean motion `dM/dt` the same elements imply, plus the turning of the ellipse by the
/// `ω, I, Ω` rates (the `a` and `e` rates are left out: at most 3.5e-5 of the speed, Saturn).
pub fn standish_state(
    planet: Planet,
    t_tdb_jc: f64,
    table: StandishTable,
) -> Option<EclipticState> {
    let el = standish_elements(planet, t_tdb_jc, table)?;
    Some(el.state_at_mean_anomaly(el.mean_anomaly_rad))
}

/// A planet's osculating-style ellipse at one epoch from the Standish elements: semi-major
/// axis (m), eccentricity, inclination, argument of perihelion and node (rad), the mean
/// anomaly at the epoch (rad, wrapped to ±π) and the mean motion `dM/dt` (rad/s).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct StandishElements {
    /// Semi-major axis (m).
    pub a_m: f64,
    /// Eccentricity (dimensionless).
    pub e: f64,
    /// Inclination to the J2000 ecliptic (rad).
    pub inc_rad: f64,
    /// Argument of perihelion `ω = ϖ − Ω` (rad).
    pub omega_rad: f64,
    /// Longitude of the ascending node `Ω`, J2000 ecliptic and equinox (rad).
    pub node_rad: f64,
    /// Mean anomaly at the epoch (rad, wrapped to ±π).
    pub mean_anomaly_rad: f64,
    /// Mean motion `dM/dt` the elements imply (rad/s).
    pub mean_motion_rad_s: f64,
    /// Rates of the argument of perihelion, inclination and node (rad/s): the turning of the
    /// ellipse, which the velocity includes.
    pub omega_rate_rad_s: f64,
    /// Rate of the inclination (rad/s).
    pub inc_rate_rad_s: f64,
    /// Rate of the longitude of the ascending node (rad/s).
    pub node_rate_rad_s: f64,
}

impl StandishElements {
    /// The position and two-body velocity on this ellipse at mean anomaly `m_rad`, in the
    /// J2000 ecliptic.
    pub fn state_at_mean_anomaly(&self, m_rad: f64) -> EclipticState {
        let (a, e) = (self.a_m, self.e);
        let ecc_anom = solve_kepler(m_rad, e);
        let (se, ce) = ecc_anom.sin_cos();
        let root = (1.0 - e * e).sqrt();
        let edot = self.mean_motion_rad_s / (1.0 - e * ce);
        let rot = orbit_to_ecliptic(self.omega_rad, self.inc_rad, self.node_rad);
        let (xp, yp) = (a * (ce - e), a * root * se);
        let mut vel = apply_plane(&rot, -a * se * edot, a * root * ce * edot);
        // The turning ellipse, Ṙ·r′: the angles are linear in time, so a central difference of
        // the rotation over ±1 day is exact to O((rate·day)²), far below 1e-12.
        let h = 86_400.0;
        let at = |k: f64| {
            orbit_to_ecliptic(
                self.omega_rad + k * self.omega_rate_rad_s * h,
                self.inc_rad + k * self.inc_rate_rad_s * h,
                self.node_rad + k * self.node_rate_rad_s * h,
            )
        };
        let (fwd, back) = (
            apply_plane(&at(1.0), xp, yp),
            apply_plane(&at(-1.0), xp, yp),
        );
        for k in 0..3 {
            vel[k] += (fwd[k] - back[k]) / (2.0 * h);
        }
        EclipticState {
            pos_m: apply_plane(&rot, xp, yp),
            vel_m_s: vel,
        }
    }

    /// The anomalistic period `2π / (dM/dt)` (s).
    pub fn period_s(&self) -> f64 {
        2.0 * std::f64::consts::PI / self.mean_motion_rad_s
    }

    /// `n` points evenly spaced in mean anomaly around this ellipse, starting at the
    /// epoch's own position: the orbit a drawing of the solar system traces.
    pub fn track(&self, n: usize) -> Vec<Vec3> {
        (0..n)
            .map(|k| {
                let m =
                    self.mean_anomaly_rad + 2.0 * std::f64::consts::PI * (k as f64) / (n as f64);
                self.state_at_mean_anomaly(m).pos_m
            })
            .collect()
    }
}

/// The Standish elements of `planet` at `t_tdb_jc` from `table`, following the page's steps
/// (elements at `T`, `ω = ϖ − Ω`, `M = L − ϖ + bT² + c·cos(fT) + s·sin(fT)` wrapped to
/// ±180°). `None` for Pluto from Tables 2a/2b.
pub fn standish_elements(
    planet: Planet,
    t_tdb_jc: f64,
    table: StandishTable,
) -> Option<StandishElements> {
    let (row, extra) = match table {
        StandishTable::Table1 => (TABLE1[planet.index()], [0.0; 4]),
        StandishTable::Table2 => {
            if planet == Planet::Pluto {
                return None;
            }
            let i = planet.index();
            let extra = if i >= 4 { TABLE2B[i - 4] } else { [0.0; 4] };
            (TABLE2A[i], extra)
        }
    };
    let t = t_tdb_jc;
    let deg = std::f64::consts::PI / 180.0;
    let l = row[3] + row[9] * t;
    let varpi = row[4] + row[10] * t;
    let node = row[5] + row[11] * t;
    let [b, c, s, f] = extra;
    let m_deg = l - varpi + b * t * t + c * (f * t * deg).cos() + s * (f * t * deg).sin();
    let m_wrapped = (m_deg + 180.0).rem_euclid(360.0) - 180.0;
    // dM/dt in degrees per century: the L and ϖ rates plus the Table 2b terms' derivative.
    let m_dot_deg_cy = row[9] - row[10] + 2.0 * b * t - c * f * deg * (f * t * deg).sin()
        + s * f * deg * (f * t * deg).cos();
    Some(StandishElements {
        a_m: (row[0] + row[6] * t) * AU_M,
        e: row[1] + row[7] * t,
        inc_rad: (row[2] + row[8] * t) * deg,
        omega_rad: (varpi - node) * deg,
        node_rad: node * deg,
        mean_anomaly_rad: m_wrapped * deg,
        mean_motion_rad_s: m_dot_deg_cy * deg / SECONDS_PER_JULIAN_CENTURY,
        omega_rate_rad_s: (row[10] - row[11]) * deg / SECONDS_PER_JULIAN_CENTURY,
        inc_rate_rad_s: row[8] * deg / SECONDS_PER_JULIAN_CENTURY,
        node_rate_rad_s: row[11] * deg / SECONDS_PER_JULIAN_CENTURY,
    })
}

/// The first two columns of `R_z(−Ω)·R_x(−I)·R_z(−ω)` (the orbital-plane `x'` and
/// `y'` axes expressed in the reference frame).
fn orbit_to_ecliptic(omega: f64, inc: f64, node: f64) -> [[f64; 2]; 3] {
    let (sw, cw) = omega.sin_cos();
    let (so, co) = node.sin_cos();
    let (si, ci) = inc.sin_cos();
    [
        [cw * co - sw * so * ci, -sw * co - cw * so * ci],
        [cw * so + sw * co * ci, -sw * so + cw * co * ci],
        [sw * si, cw * si],
    ]
}

fn apply_plane(r: &[[f64; 2]; 3], x: f64, y: f64) -> Vec3 {
    [
        r[0][0] * x + r[0][1] * y,
        r[1][0] * x + r[1][1] * y,
        r[2][0] * x + r[2][1] * y,
    ]
}

/// Rotate a J2000 ecliptic vector into the equatorial ICRF (J2000) frame with the
/// Standish obliquity `ε = 23.43928°`.
pub fn ecliptic_to_icrf(v: Vec3) -> Vec3 {
    let (se, ce) = (STANDISH_OBLIQUITY_DEG * std::f64::consts::PI / 180.0).sin_cos();
    [v[0], ce * v[1] - se * v[2], se * v[1] + ce * v[2]]
}

/// Rotate an equatorial ICRF (J2000) vector into the J2000 ecliptic frame, the
/// inverse of [`ecliptic_to_icrf`].
pub fn icrf_to_ecliptic(v: Vec3) -> Vec3 {
    let (se, ce) = (STANDISH_OBLIQUITY_DEG * std::f64::consts::PI / 180.0).sin_cos();
    [v[0], ce * v[1] + se * v[2], -se * v[1] + ce * v[2]]
}

// ============================================================================
// Natural satellites: Phobos, Deimos, the Galilean moons and Titan.
//
// Mean orbital elements referred to each moon's local Laplace plane, from the
// JPL Solar System Dynamics "Planetary Satellite Mean Elements" table (epoch
// 2000-01-01.5 TDB; https://ssd.jpl.nasa.gov/sats/elem/). That table prints the
// period to four to seven significant figures, which loses the phase within a
// few years, so the mean-longitude rate is taken instead from the IAU Working
// Group on Cartographic Coordinates and Rotational Elements (WGCCRE) prime-
// meridian rate of each moon: all seven rotate synchronously, so that rate is
// the orbital mean motion to ten significant figures (Archinal et al. 2018).
//
// Titan's printed Laplace-plane row does not reproduce the JPL Horizons position
// even at its own epoch (a 109° difference, found by the reference test), so
// Titan is placed from the IAU rotation model directly: a synchronous moon keeps
// its prime meridian, longitude 0°, towards its planet, so the moon sits at the
// mean distance along minus the body-fixed x axis.
// ============================================================================

/// A natural satellite with a built-in position model.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Satellite {
    /// Phobos, inner moon of Mars.
    Phobos,
    /// Deimos, outer moon of Mars.
    Deimos,
    /// Io, Galilean moon of Jupiter.
    Io,
    /// Europa, Galilean moon of Jupiter.
    Europa,
    /// Ganymede, Galilean moon of Jupiter.
    Ganymede,
    /// Callisto, Galilean moon of Jupiter.
    Callisto,
    /// Titan, moon of Saturn (placed by the IAU synchronous rotation model).
    Titan,
}

/// How a satellite's position is modelled.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SatelliteMethod {
    /// JPL mean elements in the Laplace plane, with the mean-longitude rate from
    /// the IAU synchronous rotation rate.
    MeanElements,
    /// The IAU synchronous rotation model: the moon on minus the body-fixed x axis
    /// at the mean distance.
    SynchronousRotation,
}

/// One satellite's model constants.
struct SatRow {
    /// Semi-major axis (km).
    a_km: f64,
    e: f64,
    /// Argument of periapsis, mean anomaly, inclination and node at the epoch
    /// (degrees), in the Laplace plane.
    omega_deg: f64,
    m_deg: f64,
    i_deg: f64,
    node_deg: f64,
    /// Apsidal and nodal precession periods (years; 0 = none).
    p_apsis_yr: f64,
    p_node_yr: f64,
    /// Laplace-plane pole right ascension and declination (degrees, ICRF).
    lp_ra_deg: f64,
    lp_dec_deg: f64,
    /// IAU pole right ascension, declination and prime meridian at J2000, and the
    /// prime-meridian rate (degrees, degrees per day).
    pole_ra_deg: f64,
    pole_dec_deg: f64,
    w0_deg: f64,
    w_dot_deg_day: f64,
}

impl Satellite {
    /// Every satellite with a built-in model.
    pub const ALL: [Satellite; 7] = [
        Satellite::Phobos,
        Satellite::Deimos,
        Satellite::Io,
        Satellite::Europa,
        Satellite::Ganymede,
        Satellite::Callisto,
        Satellite::Titan,
    ];

    /// Display name.
    pub fn name(self) -> &'static str {
        match self {
            Satellite::Phobos => "Phobos",
            Satellite::Deimos => "Deimos",
            Satellite::Io => "Io",
            Satellite::Europa => "Europa",
            Satellite::Ganymede => "Ganymede",
            Satellite::Callisto => "Callisto",
            Satellite::Titan => "Titan",
        }
    }

    /// The planet the satellite orbits.
    pub fn parent(self) -> Planet {
        match self {
            Satellite::Phobos | Satellite::Deimos => Planet::Mars,
            Satellite::Io | Satellite::Europa | Satellite::Ganymede | Satellite::Callisto => {
                Planet::Jupiter
            }
            Satellite::Titan => Planet::Saturn,
        }
    }

    /// The position model this satellite uses.
    pub fn method(self) -> SatelliteMethod {
        match self {
            Satellite::Titan => SatelliteMethod::SynchronousRotation,
            _ => SatelliteMethod::MeanElements,
        }
    }

    /// Mean semi-major axis (m) from the JPL mean-element table.
    pub fn semi_major_axis_m(self) -> f64 {
        self.row().a_km * 1e3
    }

    /// Mean orbital period (s) implied by the IAU synchronous rotation rate.
    pub fn period_s(self) -> f64 {
        360.0 / self.row().w_dot_deg_day * 86_400.0
    }

    fn row(self) -> SatRow {
        // Mean elements: JPL SSD mean-element table, epoch 2000-01-01.5 TDB.
        // IAU pole, prime meridian and rate: WGCCRE 2015 (Archinal et al. 2018) for
        // the Galilean moons and Titan, WGCCRE 2009 (Archinal et al. 2011) for
        // Phobos and Deimos; periodic and T-rate terms are left out.
        match self {
            Satellite::Phobos => SatRow {
                a_km: 9375.0,
                e: 0.015,
                omega_deg: 216.3,
                m_deg: 189.7,
                i_deg: 1.1,
                node_deg: 169.2,
                p_apsis_yr: 1.1,
                p_node_yr: 2.3,
                lp_ra_deg: 317.7,
                lp_dec_deg: 52.9,
                pole_ra_deg: 317.68,
                pole_dec_deg: 52.90,
                w0_deg: 35.06,
                w_dot_deg_day: 1_128.844_585_0,
            },
            Satellite::Deimos => SatRow {
                a_km: 23_457.0,
                e: 0.0,
                omega_deg: 0.0,
                m_deg: 205.0,
                i_deg: 1.8,
                node_deg: 54.3,
                p_apsis_yr: 0.0,
                p_node_yr: 56.2,
                lp_ra_deg: 316.6,
                lp_dec_deg: 53.5,
                pole_ra_deg: 316.65,
                pole_dec_deg: 53.52,
                w0_deg: 79.41,
                w_dot_deg_day: 285.161_897_0,
            },
            Satellite::Io => SatRow {
                a_km: 421_800.0,
                e: 0.004,
                omega_deg: 49.1,
                m_deg: 330.9,
                i_deg: 0.0,
                node_deg: 0.0,
                p_apsis_yr: 1.333,
                p_node_yr: 0.0,
                lp_ra_deg: 268.1,
                lp_dec_deg: 64.5,
                pole_ra_deg: 268.05,
                pole_dec_deg: 64.50,
                w0_deg: 200.39,
                w_dot_deg_day: 203.488_953_8,
            },
            Satellite::Europa => SatRow {
                a_km: 671_100.0,
                e: 0.009,
                omega_deg: 45.0,
                m_deg: 345.4,
                i_deg: 0.5,
                node_deg: 184.0,
                p_apsis_yr: 1.394,
                p_node_yr: 30.202,
                lp_ra_deg: 268.1,
                lp_dec_deg: 64.5,
                pole_ra_deg: 268.08,
                pole_dec_deg: 64.51,
                w0_deg: 36.022,
                w_dot_deg_day: 101.374_723_5,
            },
            Satellite::Ganymede => SatRow {
                a_km: 1_070_400.0,
                e: 0.001,
                omega_deg: 198.3,
                m_deg: 324.8,
                i_deg: 0.2,
                node_deg: 58.5,
                p_apsis_yr: 68.301,
                p_node_yr: 137.812,
                lp_ra_deg: 268.2,
                lp_dec_deg: 64.6,
                pole_ra_deg: 268.20,
                pole_dec_deg: 64.57,
                w0_deg: 44.064,
                w_dot_deg_day: 50.317_608_1,
            },
            Satellite::Callisto => SatRow {
                a_km: 1_882_700.0,
                e: 0.007,
                omega_deg: 43.8,
                m_deg: 87.4,
                i_deg: 0.3,
                node_deg: 309.1,
                p_apsis_yr: 277.921,
                p_node_yr: 577.264,
                lp_ra_deg: 268.7,
                lp_dec_deg: 64.8,
                pole_ra_deg: 268.72,
                pole_dec_deg: 64.83,
                w0_deg: 259.51,
                w_dot_deg_day: 21.571_071_5,
            },
            Satellite::Titan => SatRow {
                a_km: 1_221_900.0,
                e: 0.029,
                omega_deg: 78.3,
                m_deg: 11.7,
                i_deg: 0.3,
                node_deg: 78.6,
                p_apsis_yr: 346.680,
                p_node_yr: 687.370,
                lp_ra_deg: 36.4,
                lp_dec_deg: 84.0,
                pole_ra_deg: 39.4827,
                pole_dec_deg: 83.4279,
                w0_deg: 186.5855,
                w_dot_deg_day: 22.576_976_8,
            },
        }
    }
}

/// A unit vector from right ascension and declination (radians).
fn unit_radec(ra: f64, dec: f64) -> Vec3 {
    let (sr, cr) = ra.sin_cos();
    let (sd, cd) = dec.sin_cos();
    [cd * cr, cd * sr, sd]
}

fn cross3(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// Planetocentric position (m) and velocity (m/s) of `sat` in the ICRF at
/// `jd_tdb`.
pub fn satellite_state(sat: Satellite, jd_tdb: f64) -> EclipticState {
    let deg = std::f64::consts::PI / 180.0;
    let r = sat.row();
    let dt_day = jd_tdb - 2_451_545.0;
    match sat.method() {
        SatelliteMethod::SynchronousRotation => {
            let p = unit_radec(r.pole_ra_deg * deg, r.pole_dec_deg * deg);
            // The node of the body equator on the ICRF equator, at RA α₀ + 90°.
            let nvec = [
                -(r.pole_ra_deg * deg).sin(),
                (r.pole_ra_deg * deg).cos(),
                0.0,
            ];
            let q = cross3(p, nvec);
            let w = (r.w0_deg + r.w_dot_deg_day * dt_day) * deg;
            let (sw, cw) = w.sin_cos();
            let a = r.a_km * 1e3;
            let wdot = r.w_dot_deg_day * deg / 86_400.0;
            let mut pos = [0.0; 3];
            let mut vel = [0.0; 3];
            for k in 0..3 {
                pos[k] = -a * (cw * nvec[k] + sw * q[k]);
                vel[k] = -a * wdot * (-sw * nvec[k] + cw * q[k]);
            }
            EclipticState {
                pos_m: pos,
                vel_m_s: vel,
            }
        }
        SatelliteMethod::MeanElements => {
            let yr_day = 365.25;
            let varpi_rate = if r.p_apsis_yr > 0.0 {
                360.0 / (r.p_apsis_yr * yr_day)
            } else {
                0.0
            };
            let node_rate = if r.p_node_yr > 0.0 {
                -360.0 / (r.p_node_yr * yr_day)
            } else {
                0.0
            };
            let varpi = r.omega_deg + r.node_deg + varpi_rate * dt_day;
            let node = r.node_deg + node_rate * dt_day;
            let lambda = r.m_deg + r.omega_deg + r.node_deg + r.w_dot_deg_day * dt_day;
            let m = ((lambda - varpi) * deg).rem_euclid(2.0 * std::f64::consts::PI);
            let n = (r.w_dot_deg_day - varpi_rate) * deg / 86_400.0;
            let e = r.e;
            let ecc_anom = solve_kepler(m, e);
            let (se, ce) = ecc_anom.sin_cos();
            let root = (1.0 - e * e).sqrt();
            let a = r.a_km * 1e3;
            let edot = n / (1.0 - e * ce);
            let rot = orbit_to_ecliptic((varpi - node) * deg, r.i_deg * deg, node * deg);
            let pos_l = apply_plane(&rot, a * (ce - e), a * root * se);
            let vel_l = apply_plane(&rot, -a * se * edot, a * root * ce * edot);
            // Laplace frame → ICRF: x along the Laplace plane's ascending node on the
            // ICRF equator (RA + 90°), z along the Laplace pole.
            let z = unit_radec(r.lp_ra_deg * deg, r.lp_dec_deg * deg);
            let x = [-(r.lp_ra_deg * deg).sin(), (r.lp_ra_deg * deg).cos(), 0.0];
            let y = cross3(z, x);
            let to_icrf = |v: Vec3| -> Vec3 {
                [
                    x[0] * v[0] + y[0] * v[1] + z[0] * v[2],
                    x[1] * v[0] + y[1] * v[1] + z[1] * v[2],
                    x[2] * v[0] + y[2] * v[1] + z[2] * v[2],
                ]
            };
            EclipticState {
                pos_m: to_icrf(pos_l),
                vel_m_s: to_icrf(vel_l),
            }
        }
    }
}

/// Geocentric position (m) of the Moon in the ICRF at `jd_tdb`: the Montenbruck & Gill
/// series ([`moon_position`]) as it stands. Its mean longitude carries the `−1.3972°·T`
/// general-precession term, which refers the longitude to the equinox of J2000, so the series
/// is already a J2000 position and no precession is applied (applying the IAU 2006 precession
/// on top moved it ten times further from JPL Horizons: 0.57° instead of 0.05°). TDB is used
/// for TT, a difference below 2 ms.
pub fn moon_icrf(jd_tdb: f64) -> Vec3 {
    let t = (jd_tdb - 2_451_545.0) / 36_525.0;
    moon_position(t)
}

/// Geocentric velocity (m/s) of the Moon in the ICRF, the central difference of
/// [`moon_icrf`] over ±60 s.
pub fn moon_icrf_velocity(jd_tdb: f64) -> Vec3 {
    let h = 60.0 / 86_400.0;
    let a = moon_icrf(jd_tdb + h);
    let b = moon_icrf(jd_tdb - h);
    [
        (a[0] - b[0]) / 120.0,
        (a[1] - b[1]) / 120.0,
        (a[2] - b[2]) / 120.0,
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    #[test]
    fn sun_is_at_perihelion_distance_near_j2000() {
        // J2000.0 (2000-01-01.5 TT) is ~2 days before the Earth's perihelion (~Jan 3), so the
        // Sun's geocentric distance is near the perihelion value ≈ 1.471·10¹¹ m (0.983 AU).
        let r = norm(sun_position(0.0));
        assert!(
            (1.469e11..1.473e11).contains(&r),
            "Sun distance at J2000 = {r} m (expected ~1.471e11, perihelion)"
        );
    }

    #[test]
    fn sun_declination_at_j2000_is_near_the_winter_solstice() {
        // J2000.0 is ~11 days after the December solstice, so the Sun is deep in the southern
        // sky: declination δ ≈ −23.0° (sin δ = z/r ≈ −0.39), just off the −23.44° extreme.
        let s = sun_position(0.0);
        let sin_dec = s[2] / norm(s);
        assert!(
            (-0.41..-0.37).contains(&sin_dec),
            "sin(Sun declination) at J2000 = {sin_dec} (expected ≈ −0.39)"
        );
    }

    #[test]
    fn sun_apparent_motion_is_about_one_degree_per_day() {
        // The Sun sweeps ~360°/365.25 d ≈ 0.986°/day along the ecliptic; near perihelion the
        // true (anomalistic) rate is a touch faster. The great-circle angle between successive
        // daily unit vectors measures it directly (the Sun's ecliptic latitude is ~0).
        let day = 1.0 / 36525.0; // one day in Julian centuries
        let u0 = sun_position(0.0);
        let u1 = sun_position(day);
        let dot = (u0[0] * u1[0] + u0[1] * u1[1] + u0[2] * u1[2]) / (norm(u0) * norm(u1));
        let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
        assert!(
            (0.90..1.10).contains(&ang),
            "Sun daily motion = {ang}°/day (expected ≈ 0.99–1.02 near perihelion)"
        );
    }

    #[test]
    fn sun_sweeps_a_quarter_circle_in_a_quarter_year() {
        // Over a quarter year (~91.3 days) the Sun advances ~90° — validates the series over a
        // longer arc, not just the local rate.
        let quarter = 91.31 / 36525.0;
        let u0 = sun_position(0.0);
        let uq = sun_position(quarter);
        let dot = (u0[0] * uq[0] + u0[1] * uq[1] + u0[2] * uq[2]) / (norm(u0) * norm(uq));
        let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
        assert!(
            (85.0..95.0).contains(&ang),
            "Sun moved {ang}° in a quarter year (expected ≈ 90°)"
        );
    }

    #[test]
    fn sun_distance_stays_within_the_earth_orbit_bounds_over_a_year() {
        // Across a full year the geocentric distance must stay inside the perihelion/aphelion
        // envelope (0.983–1.017 AU ≈ 1.470e11–1.521e11 m) — a guard against a runaway series.
        for k in 0..366 {
            let t = (k as f64) / 36525.0;
            let r = norm(sun_position(t));
            assert!(
                (1.468e11..1.523e11).contains(&r),
                "Sun distance {r} m at day {k} outside Earth-orbit bounds"
            );
        }
    }

    // ---- Moon ---------------------------------------------------------------------------

    #[test]
    fn moon_distance_stays_within_the_perigee_apogee_envelope_over_a_month() {
        // The geocentric Moon distance oscillates between perigee ≈ 356 500 km and apogee
        // ≈ 406 700 km. Over a full synodic-ish month every sample must land inside a band that
        // brackets those physical extremes — a guard against a mis-summed distance series.
        for k in 0..30 {
            let t = (k as f64) / 36525.0;
            let r = norm(moon_position(t));
            assert!(
                (3.50e8..4.10e8).contains(&r),
                "Moon distance {r} m at day {k} outside the perigee/apogee envelope"
            );
        }
    }

    #[test]
    fn moon_mean_distance_over_a_month_is_the_textbook_semi_major_axis() {
        // Averaged over a month the periodic terms cancel and the mean geocentric distance must
        // recover the textbook ~384 400 km lunar semi-major axis.
        let mut sum = 0.0;
        let n = 240; // ~ every 3 h over 30 days
        for k in 0..n {
            let t = (k as f64) * (30.0 / n as f64) / 36525.0;
            sum += norm(moon_position(t));
        }
        let mean = sum / n as f64;
        assert!(
            (3.80e8..3.89e8).contains(&mean),
            "Moon mean distance {mean} m (expected ≈ 3.844e8, the lunar semi-major axis)"
        );
    }

    #[test]
    fn moon_never_strays_beyond_the_lunar_orbit_inclination_from_the_ecliptic() {
        // The Moon's ecliptic latitude is bounded by the orbital inclination (~5.14°) plus the
        // periodic terms (≤ ~0.2°), so |β| ≤ ~5.35°. Project each position onto the ecliptic-pole
        // direction n = (0, −sinε, cosε) in equatorial coordinates and check the latitude bound —
        // this validates the latitude series *and* the ecliptic→equatorial rotation together.
        let (se, ce) = OBLIQUITY_J2000.sin_cos();
        let n = [0.0, -se, ce];
        for k in 0..60 {
            let t = (k as f64) * 0.5 / 36525.0; // every 12 h for a month
            let p = moon_position(t);
            let r = norm(p);
            let sin_lat = (p[0] * n[0] + p[1] * n[1] + p[2] * n[2]) / r;
            let lat = sin_lat.clamp(-1.0, 1.0).asin().to_degrees();
            assert!(
                lat.abs() <= 5.4,
                "Moon ecliptic latitude {lat}° at day {} exceeds the lunar-orbit inclination",
                k / 2
            );
        }
    }

    #[test]
    fn moon_returns_to_the_same_direction_after_one_sidereal_month() {
        // After one sidereal month (27.3217 d) the Moon's *direction* returns to within a degree:
        // the mean longitude advances exactly 360° (its rate is 481267.88°/cy = 13.176°/d), and
        // the periodic terms nearly repeat. This validates the sidereal period embedded in the
        // mean-longitude rate, not just the local motion.
        let sidereal = 27.321_7 / 36525.0;
        let u0 = moon_position(0.0);
        let u1 = moon_position(sidereal);
        let dot = (u0[0] * u1[0] + u0[1] * u1[1] + u0[2] * u1[2]) / (norm(u0) * norm(u1));
        let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
        assert!(
            ang < 2.0,
            "Moon direction moved {ang}° over one sidereal month (expected ≈ 0, a return)"
        );
    }

    #[test]
    fn moon_daily_motion_stays_in_the_physical_lunar_band() {
        // The Moon sweeps ~360°/27.32 d ≈ 13.18°/day on average, varying ~12–15°/day with the
        // anomalistic distance. Every daily great-circle step must fall in that physical band —
        // distinguishing genuine lunar motion from a solar-rate or runaway series.
        let day = 1.0 / 36525.0;
        for k in 0..27 {
            let t0 = (k as f64) * day;
            let p0 = moon_position(t0);
            let p1 = moon_position(t0 + day);
            let dot = (p0[0] * p1[0] + p0[1] * p1[1] + p0[2] * p1[2]) / (norm(p0) * norm(p1));
            let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
            assert!(
                (11.0..16.0).contains(&ang),
                "Moon daily motion {ang}°/day at day {k} outside the physical 12–15°/day band"
            );
        }
    }

    #[test]
    fn lunar_third_body_perturbation_on_leo_has_the_textbook_magnitude() {
        // The Moon's tidal perturbation on a LEO satellite is ~2·GM_moon·r/d³
        // = 2·4.903e12·6.6e6/(3.84e8)³ ≈ 1.1·10⁻⁶ m/s² — roughly twice the Sun's. Drive the
        // body-agnostic third-body accel with the new lunar ephemeris and check that band.
        use crate::forces::{third_body_accel, MU_MOON};
        let r = [6.6e6, 0.0, 0.0];
        let a = norm(third_body_accel(r, moon_position(0.0), MU_MOON));
        assert!(
            (4.0e-7..2.5e-6).contains(&a),
            "Lunar perturbation on LEO = {a} m/s² (expected ≈ 1.1e-6)"
        );
    }

    // ---- Standish planets and the major moons ----------------------------------------

    #[test]
    fn solve_kepler_inverts_keplers_equation() {
        for &e in &[0.0, 0.0167, 0.2056, 0.2488, 0.7] {
            for k in 0..24 {
                let m = -std::f64::consts::PI + k as f64 * 0.27;
                let big_e = solve_kepler(m, e);
                assert!((big_e - e * big_e.sin() - m).abs() < 1e-12, "e {e}, M {m}");
            }
        }
    }

    #[test]
    fn standish_periods_obey_keplers_third_law() {
        // The anomalistic period from the tables' mean motion against 2π√(a³/GM☉): the two
        // come from independent columns of the table (L-rate against a), so agreement to
        // 0.5 % catches a transcription error in either. The planet's own mass and the
        // perihelion drift account for the residual.
        for p in Planet::ALL {
            let el = standish_elements(p, 0.0, StandishTable::Table1).unwrap();
            let kepler =
                2.0 * std::f64::consts::PI * (el.a_m.powi(3) / crate::forces::MU_SUN).sqrt();
            let rel = el.period_s() / kepler - 1.0;
            assert!(rel.abs() < 5e-3, "{p:?}: period off Kepler by {rel:e}");
        }
        for p in &Planet::ALL[..8] {
            let el = standish_elements(*p, 0.0, StandishTable::Table2).unwrap();
            let kepler =
                2.0 * std::f64::consts::PI * (el.a_m.powi(3) / crate::forces::MU_SUN).sqrt();
            assert!((el.period_s() / kepler - 1.0).abs() < 5e-3, "{p:?} table 2");
        }
    }

    #[test]
    fn pluto_has_no_table2_row_and_no_stated_error() {
        assert!(standish_state(Planet::Pluto, 0.0, StandishTable::Table2).is_none());
        assert!(standish_nominal_error(Planet::Pluto, StandishTable::Table1).is_none());
        assert!(standish_state(Planet::Pluto, 0.0, StandishTable::Table1).is_some());
    }

    #[test]
    fn the_table_follows_the_fit_intervals() {
        assert_eq!(StandishTable::for_epoch(0.0), Some(StandishTable::Table1));
        assert_eq!(StandishTable::for_epoch(0.6), Some(StandishTable::Table2));
        assert_eq!(StandishTable::for_epoch(-30.0), Some(StandishTable::Table2));
        assert_eq!(StandishTable::for_epoch(-60.0), None);
    }

    #[test]
    fn ecliptic_and_icrf_rotations_are_inverse() {
        let v = [1.2e11, -3.4e10, 5.6e9];
        let back = icrf_to_ecliptic(ecliptic_to_icrf(v));
        for k in 0..3 {
            assert!((back[k] - v[k]).abs() < 1e-3);
        }
        // The ecliptic pole maps to (0, −sin ε, cos ε) in the ICRF.
        let pole = ecliptic_to_icrf([0.0, 0.0, 1.0]);
        let eps = STANDISH_OBLIQUITY_DEG.to_radians();
        assert!((pole[1] + eps.sin()).abs() < 1e-15 && (pole[2] - eps.cos()).abs() < 1e-15);
    }

    #[test]
    fn a_planet_track_is_one_closed_ellipse() {
        let el = standish_elements(Planet::Mercury, 0.26, StandishTable::Table1).unwrap();
        let track = el.track(360);
        let rmin = track.iter().map(|p| norm(*p)).fold(f64::MAX, f64::min);
        let rmax = track.iter().map(|p| norm(*p)).fold(0.0, f64::max);
        assert!((rmin / (el.a_m * (1.0 - el.e)) - 1.0).abs() < 1e-4);
        assert!((rmax / (el.a_m * (1.0 + el.e)) - 1.0).abs() < 1e-4);
    }

    #[test]
    fn standish_velocity_is_the_derivative_of_the_position() {
        // Central difference of the position over ±1 h against the analytic velocity.
        let h_cy = 3600.0 / (36_525.0 * 86_400.0);
        for p in Planet::ALL {
            let t = 0.2;
            let v = standish_state(p, t, StandishTable::Table1).unwrap().vel_m_s;
            let a = standish_state(p, t + h_cy, StandishTable::Table1)
                .unwrap()
                .pos_m;
            let b = standish_state(p, t - h_cy, StandishTable::Table1)
                .unwrap()
                .pos_m;
            let fd = [
                (a[0] - b[0]) / 7200.0,
                (a[1] - b[1]) / 7200.0,
                (a[2] - b[2]) / 7200.0,
            ];
            let d = [v[0] - fd[0], v[1] - fd[1], v[2] - fd[2]];
            // Only the a and e rates are left out of the analytic velocity.
            assert!(norm(d) / norm(v) < 5e-5, "{p:?}: {}", norm(d) / norm(v));
        }
    }

    #[test]
    fn moons_sit_at_their_mean_distance_and_move_at_their_mean_speed() {
        for sat in Satellite::ALL {
            let s = satellite_state(sat, 2_461_311.5);
            let a = sat.semi_major_axis_m();
            let r = norm(s.pos_m);
            assert!((r / a - 1.0).abs() < 0.035, "{sat:?}: r/a = {}", r / a);
            let v_mean = 2.0 * std::f64::consts::PI * a / sat.period_s();
            assert!((norm(s.vel_m_s) / v_mean - 1.0).abs() < 0.035, "{sat:?}");
        }
    }
}
