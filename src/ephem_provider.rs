// SPDX-License-Identifier: AGPL-3.0-only
//! A pluggable **ephemeris provider** seam — the source of one body's position relative to another
//! in the inertial frame — abstracted so the *fidelity* of those positions can be swapped without
//! touching the deep-space light-time correction (D0.7) or the interplanetary orbit determination
//! (D2/D3) that will consume it.
//!
//! ## The split, and why it is shaped this way
//!
//! This module ships only the trait ([`EphemerisProvider`]) and the **kernel-free, low-precision**
//! built-in implementation ([`BuiltinEphemeris`]), which reuses Kshana's own analytic Montenbruck &
//! Gill Sun/Moon series ([`crate::ephem`]). The DE-grade implementation — JPL Development-Ephemeris
//! positions for the Sun, Moon **and the planets** (Mars in particular) read from NAIF/SPK kernels —
//! is intentionally **not** in this crate. It lives in a workspace-EXCLUDED `xval/anise-mars-od`
//! cross-validation crate (added in D0.8), exactly as the DE-grade lunar provider
//! [`crate::lunar_od::LunarEnvironment`] / `AnalyticLunarEnvironment` lives in core while its
//! ANISE-backed sibling `AniseLunarEnvironment` lives in `xval/anise-lunar-od`.
//!
//! The reason is a hard CI constraint, not a stylistic one. The DE-grade path depends on `anise`
//! (the pure-Rust NAIF/SPICE reimplementation) and `hifitime`, both licensed **MPL-2.0** and built
//! on **edition 2024 (Rust ≥ 1.85)**. Pulling either into the main `kshana` dependency graph — even
//! behind a cargo feature — would break two otherwise-green CI gates:
//!
//! 1. `cargo deny check licenses` — MPL-2.0 sits outside the crate's strict license allow-list; and
//! 2. the **MSRV 1.75** build — cargo 1.75 cannot even parse an edition-2024 manifest in the
//!    resolved dependency graph.
//!
//! Isolating the DE-grade provider in an excluded crate (its own `Cargo.lock`, invisible to root
//! `cargo` commands) keeps the published crate lean and every default gate byte-for-byte untouched.
//! The trait here is the seam that lets that out-of-crate provider plug in later with no change to
//! the consumers. See `xval/anise-lunar-od/Cargo.toml`'s header for the identical rationale applied
//! to the lunar environment.

use crate::body::Body;
use crate::ephem::{moon_position, sun_position};

type Vec3 = [f64; 3];

/// J2000.0 epoch as a Julian Date (TT), the zero of `t_tt_jc`.
const JD_J2000: f64 = 2_451_545.0;
/// Julian days per Julian century, the scale of `t_tt_jc`.
const DAYS_PER_JULIAN_CENTURY: f64 = 36_525.0;

/// A pluggable source of one body's position relative to another in the inertial frame.
///
/// Implementors return the position of `target` **relative to** `center` in the ICRF/EME2000
/// inertial frame (metres) at the requested epoch (Julian Date, **TDB**). A provider returns `None`
/// for any `(target, center)` pair it has no series or kernel for — letting a caller fall back to a
/// higher-fidelity provider (the DE-grade `xval/anise-mars-od` path of D0.8) for the bodies the
/// kernel-free [`BuiltinEphemeris`] cannot supply.
pub trait EphemerisProvider: std::fmt::Debug {
    /// Position of `target` relative to `center` in the ICRF/EME2000 inertial frame (metres) at the
    /// epoch `jd_tdb` (Julian Date, TDB). Returns `None` for a `(target, center)` pair this provider
    /// cannot supply.
    fn relative_position(&self, target: &Body, center: &Body, jd_tdb: f64) -> Option<Vec3>;
}

/// The default, kernel-free **low-precision** ephemeris provider: Kshana's own analytic Montenbruck
/// & Gill Sun/Moon series ([`crate::ephem`]).
///
/// It knows the **geocentric** Sun and Moon directions only — the closed-form series give the Sun to
/// ~0.005° and the Moon to ~0.3° about J2000 (Montenbruck & Gill, *Satellite Orbits* §3.3.2) — so it
/// can supply the Earth/Sun/Moon mutual positions and nothing else. For **Mars or any other planet**
/// it has no series and returns `None`; the DE-grade ANISE-backed provider (`xval/anise-mars-od`,
/// D0.8) is the path for those, exactly as [`crate::lunar_od::AnalyticLunarEnvironment`] gives way to
/// the out-of-crate `AniseLunarEnvironment` for DE-grade lunar inputs.
///
/// The analytic series are parameterised by `t_tt_jc`, Julian centuries of **TT** since J2000. This
/// provider takes the epoch as TDB and uses TDB ≈ TT directly: the TDB−TT difference is a periodic
/// term bounded by ~1.7 ms, which moves the Sun/Moon directions by far less than the series' own
/// ~0.005°/~0.3° truncation error, so it is dropped here (the DE-grade provider carries the exact
/// TDB timescale).
///
/// Positions are returned in the geocentric mean-equator/equinox of date — a close approximation to
/// the ICRF/EME2000 frame whose precession/nutation difference is well below this model's own
/// truncation error (the same approximation [`crate::ephem`] documents).
#[derive(Debug, Clone, Copy, Default)]
pub struct BuiltinEphemeris;

impl BuiltinEphemeris {
    /// Convert a Julian Date (TDB) to `t_tt_jc`, Julian centuries of TT since J2000 — the argument
    /// of the analytic [`crate::ephem`] series. TDB ≈ TT is used (see the type-level note).
    fn t_tt_jc(jd_tdb: f64) -> f64 {
        (jd_tdb - JD_J2000) / DAYS_PER_JULIAN_CENTURY
    }
}

impl EphemerisProvider for BuiltinEphemeris {
    /// Supply the geocentric Earth/Sun/Moon mutual positions the built-in analytic series know:
    ///
    /// * any body relative to **itself** → `[0, 0, 0]` (matched on [`Body::name`]);
    /// * **Sun** relative to **Earth** → [`crate::ephem::sun_position`];
    /// * **Moon** relative to **Earth** → [`crate::ephem::moon_position`];
    /// * the reverse pairs (Earth relative to the Sun / Moon) → the negated forward vector.
    ///
    /// Anything involving **Mars** or another planet, and any pair the geocentric series cannot
    /// compose (e.g. Sun relative to Moon), returns `None`. Dispatch is on [`Body::name`].
    fn relative_position(&self, target: &Body, center: &Body, jd_tdb: f64) -> Option<Vec3> {
        // A body relative to itself is the origin, for any body the series knows or not.
        if target.name == center.name {
            return Some([0.0, 0.0, 0.0]);
        }
        let t = Self::t_tt_jc(jd_tdb);
        match (target.name, center.name) {
            ("Sun", "Earth") => Some(sun_position(t)),
            ("Moon", "Earth") => Some(moon_position(t)),
            ("Earth", "Sun") => Some(neg(sun_position(t))),
            ("Earth", "Moon") => Some(neg(moon_position(t))),
            // Mars and every other planet have no built-in series; geocentric Sun↔Moon pairs
            // are not composed here. The DE-grade out-of-crate provider (D0.8) is the path.
            _ => None,
        }
    }
}

/// Negate a 3-vector (the reverse relative-position direction).
fn neg(v: Vec3) -> Vec3 {
    [-v[0], -v[1], -v[2]]
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ephem::{moon_position, sun_position};

    /// A fixed probe epoch (Julian Date, TDB) inside the analytic series' good span: 2022-001.5.
    const PROBE_JD: f64 = 2_459_580.5;

    fn t_at(jd: f64) -> f64 {
        (jd - 2_451_545.0) / 36_525.0
    }

    /// Sun relative to Earth must be exactly the built-in geocentric `sun_position` at the same
    /// epoch — the seam adds no transform of its own beyond the documented TDB ≈ TT identity.
    #[test]
    fn sun_relative_to_earth_is_the_builtin_sun_series() {
        let p = BuiltinEphemeris;
        let got = p
            .relative_position(&Body::sun(), &Body::earth(), PROBE_JD)
            .expect("builtin must supply Sun relative to Earth");
        let want = sun_position(t_at(PROBE_JD));
        for k in 0..3 {
            assert!(
                (got[k] - want[k]).abs() < 1e-9,
                "Sun/Earth component {k}: got {} want {}",
                got[k],
                want[k]
            );
        }
    }

    /// Moon relative to Earth must be exactly the built-in geocentric `moon_position`.
    #[test]
    fn moon_relative_to_earth_is_the_builtin_moon_series() {
        let p = BuiltinEphemeris;
        let got = p
            .relative_position(&Body::moon(), &Body::earth(), PROBE_JD)
            .expect("builtin must supply Moon relative to Earth");
        let want = moon_position(t_at(PROBE_JD));
        for k in 0..3 {
            assert!(
                (got[k] - want[k]).abs() < 1e-9,
                "Moon/Earth component {k}: got {} want {}",
                got[k],
                want[k]
            );
        }
    }

    /// A body relative to itself is the origin.
    #[test]
    fn body_relative_to_itself_is_the_origin() {
        let p = BuiltinEphemeris;
        for b in [Body::earth(), Body::sun(), Body::moon(), Body::mars()] {
            let got = p
                .relative_position(&b, &b, PROBE_JD)
                .expect("a body relative to itself is always defined");
            assert_eq!(got, [0.0, 0.0, 0.0], "{} relative to itself", b.name);
        }
    }

    /// The reverse pair: Earth relative to the Sun is the negated Sun-relative-to-Earth vector.
    #[test]
    fn earth_relative_to_sun_is_the_negated_sun_vector() {
        let p = BuiltinEphemeris;
        let earth_sun = p
            .relative_position(&Body::earth(), &Body::sun(), PROBE_JD)
            .expect("builtin must supply Earth relative to Sun");
        let sun_earth = sun_position(t_at(PROBE_JD));
        for k in 0..3 {
            assert!(
                (earth_sun[k] + sun_earth[k]).abs() < 1e-9,
                "Earth/Sun component {k} must be the negated Sun/Earth: {} vs {}",
                earth_sun[k],
                -sun_earth[k]
            );
        }
    }

    /// The reverse pair for the Moon: Earth relative to the Moon is the negated Moon vector.
    #[test]
    fn earth_relative_to_moon_is_the_negated_moon_vector() {
        let p = BuiltinEphemeris;
        let earth_moon = p
            .relative_position(&Body::earth(), &Body::moon(), PROBE_JD)
            .expect("builtin must supply Earth relative to Moon");
        let moon_earth = moon_position(t_at(PROBE_JD));
        for k in 0..3 {
            assert!(
                (earth_moon[k] + moon_earth[k]).abs() < 1e-9,
                "Earth/Moon component {k} must be the negated Moon/Earth",
            );
        }
    }

    /// The built-in knows no Mars (or any planet) series, so any Mars pair returns `None` — the
    /// signal a caller uses to reach for the DE-grade out-of-crate provider (D0.8).
    #[test]
    fn mars_relative_to_earth_is_unsupported() {
        let p = BuiltinEphemeris;
        assert!(
            p.relative_position(&Body::mars(), &Body::earth(), PROBE_JD)
                .is_none(),
            "the kernel-free builtin must not invent a Mars position"
        );
        assert!(
            p.relative_position(&Body::earth(), &Body::mars(), PROBE_JD)
                .is_none(),
            "the reverse Mars pair is equally unsupported"
        );
        assert!(
            p.relative_position(&Body::sun(), &Body::mars(), PROBE_JD)
                .is_none(),
            "Sun relative to Mars is unsupported by the geocentric builtin"
        );
    }

    /// A geocentric series cannot compose Sun-relative-to-Moon, so that pair is `None` (it is not
    /// a self-pair, and the builtin only anchors on Earth).
    #[test]
    fn uncomposable_sun_relative_to_moon_is_none() {
        let p = BuiltinEphemeris;
        assert!(
            p.relative_position(&Body::sun(), &Body::moon(), PROBE_JD)
                .is_none(),
            "the builtin does not compose Sun relative to Moon"
        );
    }

    /// `BuiltinEphemeris` is usable behind the trait object the consumers (D0.7/D2/D3) will hold.
    #[test]
    fn usable_as_a_trait_object() {
        let p: &dyn EphemerisProvider = &BuiltinEphemeris;
        assert!(p
            .relative_position(&Body::sun(), &Body::earth(), PROBE_JD)
            .is_some());
    }
}
