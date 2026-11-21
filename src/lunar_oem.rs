// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar ephemeris exchange through CCSDS OEM: frame conversion of Moon-centred OEMs between the
//! inertial ICRF and the DE440 lunar body frames (`kshana lunar-oem`).
//!
//! The OEM reader and writer are [`crate::oem`]; [`crate::lunar_interop::export_lunar_oem`]
//! already writes lunar-frame OEMs from the crate's own lunar states. What this module adds is
//! the exchange direction: take a Moon-centred OEM from another tool, in ICRF or a lunar body
//! frame, and write the same trajectory in another frame, positions and velocities both.
//!
//! ## Frame names
//!
//! CCSDS 502.0-B-3 (Orbit Data Messages) takes `REF_FRAME` values from the SANA registry
//! "Celestial Body Reference Frames" (sanaregistry.org/r/celestial_body_reference_frames, read
//! 21 November 2026). It lists `ICRF` (latest ICRFn, inertial), `MOON_ME` (Moon mean-Earth
//! rotating frame, "defined as a constant rotation from the Principal Axes frame associated with
//! a particular instantiation of the JPL DE") and `MOON_PAxxx` (Moon principal-axis rotating
//! frame, which "depends on the source JPL DE file"). Written here:
//!
//! * `ICRF`.
//! * `MOON_PA440`: the DE440 principal-axis frame, from the embedded DE440 orientation series
//!   ([`crate::lunar_frame::try_icrf_to_moon_pa_de440`], 2014 to 2030). The registry gives the
//!   pattern `MOON_PAxxx`; that `xxx` is the DE number written without a separator is our
//!   reading, to confirm.
//! * `MOON_ME`: realised as NAIF's `MOON_ME_DE440_ME421`, DE440 PA with the constant offset of the
//!   NAIF kernel `moon_de440_220930.tf` ([`crate::lunar_frame::try_icrf_to_moon_me_de440`]). The
//!   segment's `COMMENT` lines say so, as the registry entry leaves the DE instance to the user.
//!
//! Read as well: `MOON_PA_DE440` and `MOON_ME_DE440_ME421` (the NAIF names), and `MOON_PA` with no
//! DE number, which is read as DE440 PA with a `COMMENT` saying so (the crate's own
//! [`crate::lunar_interop`] export writes that token). `EME2000` and `J2000` are refused: they
//! differ from ICRF by the frame bias (about 23 mas), which this module does not apply.
//!
//! ## Time
//!
//! The rotation needs TDB. `TIME_SYSTEM` `TDB`, `TT`, `TAI`, `GPS` and `UTC` (with the crate's
//! leap-second table) are read; others, including lunar time scales, which are not registered
//! in the SANA "Time Systems" registry, are refused.
//!
//! ## Velocity
//!
//! `v_to = R_to · v_icrf + dR_to/dt · r_icrf` and its inverse, with `dR/dt` by a central
//! difference over ±60 s (one-sided at the ends of the orientation series). The DE440 series
//! is interpolated at a constant rate within each day, so the difference is exact inside a day.
//!
//! MODELLED: a frame conversion with the cited models; the output is no more accurate than the
//! input and the orientation series (checked against SPICE to 1.7e-6 rad in
//! `crate::lunar_orientation`). Covariance blocks are not carried (the reader skips them), and
//! the output says so.

use crate::lunar_frame::{try_icrf_to_moon_me_de440, try_icrf_to_moon_pa_de440};
use crate::oem::{OemFile, OemStateLine};
use crate::precession::{mat_vec, transpose, Mat3};
use crate::rinex::EpochUtc;

/// A frame this module converts between.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Frame {
    /// The International Celestial Reference Frame (inertial).
    Icrf,
    /// The DE440 principal-axis frame.
    MoonPa440,
    /// The mean-Earth frame realised from DE440 (`MOON_ME_DE440_ME421`).
    MoonMe,
}

impl Frame {
    /// The `REF_FRAME` token written for this frame.
    pub fn token(self) -> &'static str {
        match self {
            Frame::Icrf => "ICRF",
            Frame::MoonPa440 => "MOON_PA440",
            Frame::MoonMe => "MOON_ME",
        }
    }

    /// Read a `REF_FRAME` token. The second value is a note to carry in the output when the
    /// token left something to be assumed.
    pub fn parse(token: &str) -> Option<(Frame, Option<&'static str>)> {
        match token.trim().to_ascii_uppercase().as_str() {
            "ICRF" => Some((Frame::Icrf, None)),
            "MOON_PA440" | "MOON_PA_DE440" => Some((Frame::MoonPa440, None)),
            "MOON_PA" => Some((
                Frame::MoonPa440,
                Some("input REF_FRAME MOON_PA names no DE; read as DE440 PA"),
            )),
            "MOON_ME" | "MOON_ME_DE440_ME421" => Some((Frame::MoonMe, None)),
            _ => None,
        }
    }

    /// The rotation from ICRF to this frame at `jd_tdb`, `r_frame = R · r_icrf`.
    pub fn from_icrf(self, jd_tdb: f64) -> Result<Mat3, String> {
        match self {
            Frame::Icrf => Ok([[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]),
            Frame::MoonPa440 => try_icrf_to_moon_pa_de440(jd_tdb).map_err(|e| e.to_string()),
            Frame::MoonMe => try_icrf_to_moon_me_de440(jd_tdb).map_err(|e| e.to_string()),
        }
    }

    /// The rotation and its time derivative (per second) at `jd_tdb`.
    fn with_rate(self, jd_tdb: f64) -> Result<(Mat3, Mat3), String> {
        let r = self.from_icrf(jd_tdb)?;
        if self == Frame::Icrf {
            return Ok((r, [[0.0; 3]; 3]));
        }
        let h = 60.0;
        let d = h / 86_400.0;
        let (a, b, span) = match (self.from_icrf(jd_tdb - d), self.from_icrf(jd_tdb + d)) {
            (Ok(a), Ok(b)) => (a, b, 2.0 * h),
            (Err(_), Ok(b)) => (r, b, h),
            (Ok(a), Err(_)) => (a, r, h),
            (Err(e), Err(_)) => return Err(e),
        };
        let mut dr = [[0.0; 3]; 3];
        for i in 0..3 {
            for j in 0..3 {
                dr[i][j] = (b[i][j] - a[i][j]) / span;
            }
        }
        Ok((r, dr))
    }
}

/// Every frame written, as the `frames` subcommand lists them.
pub const FRAMES: [Frame; 3] = [Frame::Icrf, Frame::MoonPa440, Frame::MoonMe];

fn add(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

/// Convert one state (km, km/s) from frame `from` to frame `to` at `jd_tdb`.
pub fn convert_state(
    from: Frame,
    to: Frame,
    jd_tdb: f64,
    r_km: [f64; 3],
    v_km_s: [f64; 3],
) -> Result<([f64; 3], [f64; 3]), String> {
    let (rf, drf) = from.with_rate(jd_tdb)?;
    let (rt, drt) = to.with_rate(jd_tdb)?;
    // r_from = Rf r_i, v_from = Rf v_i + dRf r_i  =>  r_i = Rfᵀ r_from, v_i = Rfᵀ (v_from − dRf r_i)
    let ri = mat_vec(&transpose(&rf), r_km);
    let corr = mat_vec(&drf, ri);
    let vi = mat_vec(
        &transpose(&rf),
        [
            v_km_s[0] - corr[0],
            v_km_s[1] - corr[1],
            v_km_s[2] - corr[2],
        ],
    );
    Ok((mat_vec(&rt, ri), add(mat_vec(&rt, vi), mat_vec(&drt, ri))))
}

/// The Julian Date (TDB) of an OEM epoch in the given `TIME_SYSTEM`.
pub fn jd_tdb(e: &EpochUtc, time_system: &str) -> Result<f64, String> {
    use crate::timescales as ts;
    let jd = ts::julian_date(e.year, e.month, e.day, e.hour, e.minute, e.second);
    let tt = match time_system.trim().to_ascii_uppercase().as_str() {
        "TDB" => return Ok(jd),
        "TT" => jd,
        "TAI" => ts::tai_to_tt(jd),
        "GPS" => ts::gps_to_tt(jd),
        "UTC" => ts::utc_to_tt(jd),
        other => {
            return Err(crate::terr!(
                "e-lunar-oem-time-system",
                time_system = other.to_string()
            ))
        }
    };
    Ok(ts::tt_to_tdb(tt))
}

/// The result of a conversion: the converted file and the `COMMENT` text for each segment.
pub struct Converted {
    /// The converted OEM.
    pub oem: OemFile,
    /// Per segment, the comment lines to write after `META_START`.
    pub comments: Vec<Vec<String>>,
}

/// Convert every segment of `oem` to frame `to`.
pub fn convert(oem: &OemFile, to: Frame) -> Result<Converted, String> {
    let mut out = oem.clone();
    out.originator = "KSHANA".to_string();
    let mut comments = Vec::new();
    for seg in &mut out.segments {
        if !seg.meta.center_name.trim().eq_ignore_ascii_case("MOON") {
            return Err(crate::terr!(
                "e-lunar-oem-not-moon-centred",
                center = seg.meta.center_name.clone()
            ));
        }
        let Some((from, note)) = Frame::parse(&seg.meta.ref_frame) else {
            return Err(crate::terr!(
                "e-lunar-oem-unknown-frame",
                frame = seg.meta.ref_frame.clone()
            ));
        };
        let mut c = vec![format!(
            "kshana lunar-oem: MODELLED conversion from {} to {}",
            seg.meta.ref_frame.trim(),
            to.token()
        )];
        if let Some(n) = note {
            c.push(n.to_string());
        }
        if matches!(from, Frame::MoonPa440 | Frame::MoonMe)
            || matches!(to, Frame::MoonPa440 | Frame::MoonMe)
        {
            c.push(
                "DE440 lunar orientation (MOON_PA_DE440); MOON_ME realised as NAIF \
                 MOON_ME_DE440_ME421 (moon_de440_220930.tf)"
                    .to_string(),
            );
        }
        c.push("covariance, if the input had any, is not carried".to_string());
        let ts = seg.meta.time_system.clone();
        let states: Result<Vec<OemStateLine>, String> = seg
            .states
            .iter()
            .map(|s| {
                let jd = jd_tdb(&s.epoch, &ts)?;
                let (r, v) = convert_state(from, to, jd, s.pos_km, s.vel_km_s)?;
                Ok(OemStateLine {
                    epoch: s.epoch,
                    pos_km: r,
                    vel_km_s: v,
                })
            })
            .collect();
        seg.states = states?;
        seg.meta.ref_frame = to.token().to_string();
        comments.push(c);
    }
    Ok(Converted { oem: out, comments })
}

impl Converted {
    /// The OEM text, with each segment's comments at the start of its metadata section.
    pub fn to_oem_string(&self) -> String {
        let text = self.oem.to_oem_string();
        let mut out = String::with_capacity(text.len() + 512);
        let mut seg = 0usize;
        for line in text.split_inclusive('\n') {
            out.push_str(line);
            if line.trim_end() == "META_START" {
                for c in self.comments.get(seg).into_iter().flatten() {
                    out.push_str("COMMENT ");
                    out.push_str(c);
                    out.push('\n');
                }
                seg += 1;
            }
        }
        out
    }
}

fn usage() -> String {
    crate::t!("lunar-oem-usage")
}

/// `kshana lunar-oem convert <in.oem> --to <frame> [--out <file>]` and `kshana lunar-oem frames`.
pub fn run_cli(args: &[String]) -> i32 {
    match args.first().map(String::as_str) {
        Some("frames") => {
            for f in FRAMES {
                println!("{}", f.token());
            }
            0
        }
        Some("convert") => convert_cli(&args[1..]),
        Some("--help" | "-h") => {
            println!("{}", usage());
            0
        }
        _ => {
            eprintln!("{}", usage());
            2
        }
    }
}

fn convert_cli(args: &[String]) -> i32 {
    let (mut input, mut to, mut out) = (None, None, None);
    let mut i = 0;
    while i < args.len() {
        let a = args[i].as_str();
        let mut val = || {
            i += 1;
            args.get(i)
                .cloned()
                .ok_or_else(|| crate::terr!("e-lunar-oem-missing-value", option = a.to_string()))
        };
        let r = match a {
            "--to" => val().map(|v| to = Some(v)),
            "--out" => val().map(|v| out = Some(v)),
            s if !s.starts_with('-') && input.is_none() => {
                input = Some(s.to_string());
                Ok(())
            }
            _ => Err(crate::terr!(
                "e-lunar-oem-unknown-option",
                option = a.to_string()
            )),
        };
        if let Err(e) = r {
            eprintln!("{e}\n\n{}", usage());
            return 2;
        }
        i += 1;
    }
    let (Some(input), Some(to)) = (input, to) else {
        eprintln!("{}", usage());
        return 2;
    };
    let target = match Frame::parse(&to) {
        Some((f, None)) => f,
        _ => {
            eprintln!("{}", crate::terr!("e-lunar-oem-unknown-frame", frame = to));
            return 2;
        }
    };
    let text = match std::fs::read_to_string(&input) {
        Ok(t) => t,
        Err(e) => {
            eprintln!(
                "{}",
                crate::terr!("e-lunar-oem-cannot-read", path = input, e = e)
            );
            return 2;
        }
    };
    let result = crate::oem::parse_oem(&text).and_then(|o| convert(&o, target));
    let converted = match result {
        Ok(c) => c,
        Err(e) => {
            eprintln!("{e}");
            return 2;
        }
    };
    let body = converted.to_oem_string();
    match out {
        Some(p) => {
            if let Err(e) = std::fs::write(&p, body) {
                eprintln!(
                    "{}",
                    crate::terr!("e-lunar-oem-cannot-write", path = p, e = e)
                );
                return 2;
            }
        }
        None => print!("{body}"),
    }
    0
}
