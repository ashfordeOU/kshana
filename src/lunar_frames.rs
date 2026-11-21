// SPDX-License-Identifier: AGPL-3.0-only
//! Named lunar body-fixed frames, ILuRF among them, and the transformations between them.
//!
//! | frame | axes | source |
//! |---|---|---|
//! | `ICRF` | ICRF axes, lunar-centred (orientation only) | — |
//! | `MOON_PA_DE440` | DE440 principal axes | the embedded daily series, [`crate::lunar_orientation`] (2014-2030) |
//! | `MOON_PA` | principal axes from the analytic IAU 2015 series and the DE421 ME→PA angles | [`crate::lunar_frame::icrf_to_moon_pa`] |
//! | `MOON_ME` | mean Earth / polar axis (IAU 2015 WGCCRE) | [`crate::lunar_frame::icrf_to_iau_moon`] |
//! | `ILURF` | the International Lunar Reference Frame: mean-Earth/polar-axis axes **(to confirm)** realised through a 7-parameter datum from `MOON_ME` | [`crate::lunar_datum::Datum7`] |
//!
//! **ILuRF.** No published ILuRF definition or realisation parameters were read for this module.
//! It is therefore carried as plumbing: a frame whose axes follow the mean-Earth/polar-axis
//! convention (to confirm) and whose realisation is a Helmert datum from `MOON_ME`
//! (`q = (1 + s)·R(θ)·p + t`, [`crate::lunar_datum::apply_datum7`]). The default realisation is the
//! zero datum, labelled as a placeholder; a realisation estimated from a station or reflector
//! network ([`crate::lunar_frame_realise`]) or a published one can be supplied in its place,
//! and every transformation names the realisation it used.
//!
//! The rotations act on lunar-centred vectors; a point's translation from the Moon's centre to
//! another origin is not part of this module.
//!
//! MODELLED: the frames are the repository's existing orientation models; ILuRF's parameters are
//! to confirm.

use crate::lunar_datum::{apply_datum7, Datum7};
use crate::precession::{mat_vec, transpose, Mat3};
use serde::Serialize;

type Vec3 = [f64; 3];

/// A frame.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum Frame {
    /// ICRF axes, lunar-centred.
    #[serde(rename = "ICRF")]
    Icrf,
    /// DE440 principal axes.
    #[serde(rename = "MOON_PA_DE440")]
    MoonPaDe440,
    /// Analytic principal axes.
    #[serde(rename = "MOON_PA")]
    MoonPa,
    /// Mean Earth / polar axis.
    #[serde(rename = "MOON_ME")]
    MoonMe,
    /// The International Lunar Reference Frame (realisation stated separately).
    #[serde(rename = "ILURF")]
    Ilurf,
}

/// Every frame, in the order of the table above.
pub const FRAMES: [Frame; 5] = [
    Frame::Icrf,
    Frame::MoonPaDe440,
    Frame::MoonPa,
    Frame::MoonMe,
    Frame::Ilurf,
];

impl Frame {
    /// Its name.
    pub fn name(self) -> &'static str {
        match self {
            Frame::Icrf => "ICRF",
            Frame::MoonPaDe440 => "MOON_PA_DE440",
            Frame::MoonPa => "MOON_PA",
            Frame::MoonMe => "MOON_ME",
            Frame::Ilurf => "ILURF",
        }
    }
    /// Parse a name (case-insensitive).
    pub fn parse(s: &str) -> Option<Frame> {
        let u = s.to_ascii_uppercase();
        FRAMES.into_iter().find(|f| f.name() == u)
    }
}

/// An ILuRF realisation: a datum from `MOON_ME`, named, with its source.
#[derive(Clone, Copy, Debug)]
pub struct Realisation {
    /// Name.
    pub name: &'static str,
    /// The datum `MOON_ME → ILURF`.
    pub datum: Datum7,
    /// Where the parameters come from.
    pub source: &'static str,
}

/// The placeholder realisation: the zero datum.
pub const PLACEHOLDER: Realisation = Realisation {
    name: "placeholder-zero-datum",
    datum: Datum7 {
        t_m: [0.0; 3],
        scale: 0.0,
        rot_rad: [0.0; 3],
    },
    source: "no published ILuRF realisation parameters read; zero datum from MOON_ME (to confirm)",
};

/// The `ICRF → frame` rotation at `jd_tdb` for the rotating frames (`None` for ICRF and ILuRF).
fn icrf_to(frame: Frame, jd_tdb: f64) -> Result<Option<Mat3>, String> {
    Ok(match frame {
        Frame::Icrf | Frame::Ilurf => None,
        Frame::MoonPaDe440 => Some(
            crate::lunar_frame::try_icrf_to_moon_pa_de440(jd_tdb)
                .map_err(|_| crate::terr!("e-lunar-ref-out-of-span"))?,
        ),
        Frame::MoonPa => Some(crate::lunar_frame::icrf_to_moon_pa(jd_tdb)),
        Frame::MoonMe => Some(crate::lunar_frame::icrf_to_iau_moon(jd_tdb)),
    })
}

fn inverse_datum(d: &Datum7, q: Vec3) -> Vec3 {
    let p = [
        (q[0] - d.t_m[0]) / (1.0 + d.scale),
        (q[1] - d.t_m[1]) / (1.0 + d.scale),
        (q[2] - d.t_m[2]) / (1.0 + d.scale),
    ];
    let back = Datum7 {
        t_m: [0.0; 3],
        scale: 0.0,
        rot_rad: [-d.rot_rad[0], -d.rot_rad[1], -d.rot_rad[2]],
    };
    apply_datum7(&back, p)
}

/// A lunar-centred vector in `frame` expressed in ICRF axes.
pub fn to_icrf(frame: Frame, p: Vec3, jd_tdb: f64, ilurf: &Realisation) -> Result<Vec3, String> {
    if frame == Frame::Ilurf {
        let me = inverse_datum(&ilurf.datum, p);
        return to_icrf(Frame::MoonMe, me, jd_tdb, ilurf);
    }
    Ok(match icrf_to(frame, jd_tdb)? {
        Some(r) => mat_vec(&transpose(&r), p),
        None => p,
    })
}

/// A lunar-centred vector in ICRF axes expressed in `frame`.
pub fn from_icrf(frame: Frame, p: Vec3, jd_tdb: f64, ilurf: &Realisation) -> Result<Vec3, String> {
    if frame == Frame::Ilurf {
        let me = from_icrf(Frame::MoonMe, p, jd_tdb, ilurf)?;
        return Ok(apply_datum7(&ilurf.datum, me));
    }
    Ok(match icrf_to(frame, jd_tdb)? {
        Some(r) => mat_vec(&r, p),
        None => p,
    })
}

/// A transformation's result.
#[derive(Clone, Debug, Serialize)]
pub struct Transformed {
    /// Source frame.
    pub from: Frame,
    /// Target frame.
    pub to: Frame,
    /// Epoch, JD TDB.
    pub jd_tdb: f64,
    /// Input vector, m.
    pub input_m: Vec3,
    /// Output vector, m.
    pub output_m: Vec3,
    /// The ILuRF realisation used.
    pub ilurf_realisation: &'static str,
    /// Its source.
    pub ilurf_source: &'static str,
}

/// Transform a lunar-centred vector between two frames.
pub fn transform(
    from: Frame,
    to: Frame,
    p: Vec3,
    jd_tdb: f64,
    ilurf: &Realisation,
) -> Result<Transformed, String> {
    let i = to_icrf(from, p, jd_tdb, ilurf)?;
    Ok(Transformed {
        from,
        to,
        jd_tdb,
        input_m: p,
        output_m: from_icrf(to, i, jd_tdb, ilurf)?,
        ilurf_realisation: ilurf.name,
        ilurf_source: ilurf.source,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    const JD: f64 = 2_460_676.5; // 2025-01-01
                                 // A surface point near the Apollo 15 site, metres, roughly.
    const P: Vec3 = [1_554_000.0, 98_000.0, 765_000.0];

    fn d(a: Vec3, b: Vec3) -> f64 {
        ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
    }

    #[test]
    fn every_pair_round_trips() {
        for a in FRAMES {
            for b in FRAMES {
                let t = transform(a, b, P, JD, &PLACEHOLDER).unwrap();
                let back = transform(b, a, t.output_m, JD, &PLACEHOLDER).unwrap();
                assert!(d(back.output_m, P) < 1e-6, "{a:?} -> {b:?}");
            }
        }
    }

    #[test]
    fn me_and_pa_differ_by_hundreds_of_metres_and_the_placeholder_is_me() {
        let pa = transform(Frame::MoonMe, Frame::MoonPa, P, JD, &PLACEHOLDER).unwrap();
        let sep = d(pa.output_m, P);
        // About 0.24 degrees of rotation at 1,737 km: several hundred metres.
        assert!(sep > 500.0 && sep < 1200.0, "{sep}");
        let il = transform(Frame::MoonMe, Frame::Ilurf, P, JD, &PLACEHOLDER).unwrap();
        assert!(d(il.output_m, P) < 1e-9);
        assert!(il.ilurf_source.contains("to confirm"));
    }

    #[test]
    fn analytic_and_de440_principal_axes_agree_to_tens_of_metres() {
        let a = transform(Frame::MoonPa, Frame::MoonPaDe440, P, JD, &PLACEHOLDER).unwrap();
        let sep = d(a.output_m, P);
        // 6 to 8 arcseconds over 2014-2028 (lunar_frame), at 1,737 km about 50 to 70 m.
        assert!(sep < 120.0, "{sep}");
    }

    #[test]
    fn a_stated_realisation_is_applied_and_inverted() {
        let r = Realisation {
            name: "test",
            datum: Datum7 {
                t_m: [10.0, -5.0, 2.0],
                scale: 1e-7,
                rot_rad: [1e-6, -2e-6, 3e-6],
            },
            source: "test",
        };
        let fwd = transform(Frame::MoonMe, Frame::Ilurf, P, JD, &r).unwrap();
        assert!(d(fwd.output_m, P) > 5.0);
        let back = transform(Frame::Ilurf, Frame::MoonMe, fwd.output_m, JD, &r).unwrap();
        assert!(d(back.output_m, P) < 1e-6);
    }

    #[test]
    fn de440_outside_its_span_is_an_error_and_names_parse() {
        assert!(transform(
            Frame::Icrf,
            Frame::MoonPaDe440,
            P,
            2_470_000.0,
            &PLACEHOLDER
        )
        .is_err());
        assert_eq!(Frame::parse("ilurf"), Some(Frame::Ilurf));
        assert!(Frame::parse("moon_xyz").is_none());
    }
}
