// SPDX-License-Identifier: AGPL-3.0-only
//! Ephemeris & ground-track scenario — the user-facing surface for satellite
//! VELOCITY, the full frame reductions, and the WGS-84 sub-satellite point.
//!
//! The propagators (SGP4 from a TLE, or the analytic Keplerian orbit) already
//! compute a velocity and the library already reduces TEME → GCRS (≈ J2000) and
//! TEME → ITRF/ECEF → geodetic; this pack runs a single satellite over a time
//! grid and emits, at every step:
//!
//! - the inertial **state** (position *and* velocity) in TEME and in GCRS,
//! - the Earth-fixed **ITRF/ECEF** position,
//! - the **sub-satellite point** (WGS-84 geodetic latitude / longitude / height) —
//!   the "where is the satellite right now" ground track, and
//! - for an optional ground **station**, the topocentric azimuth / elevation /
//!   range and the **range-rate** (the geometric Doppler the receiver sees).
//!
//! Time handling: the SGP4 epoch is the TLE's own epoch (UTC); the analytic orbit
//! takes an explicit `epoch`. UT1 drives Earth rotation (`dut1_s`, the UT1−UTC
//! offset; default 0 ⇒ the DUT1≈0 approximation — a few-arcsecond, i.e.
//! few-hundred-metre, longitude shift in the ground track), TT drives
//! precession/nutation, and `xp_arcsec`/`yp_arcsec` are the
//! IERS polar-motion pole coordinates (default 0). The frame chain is the one
//! validated to the millimetre against the published Vallado vectors
//! (`tests/frame_reference_vectors.rs`).
//!
//! Earth-orientation, two tiers: by default the ground track uses the nominal
//! scalars above (DUT1 ≈ 0, no pole), which is well inside SGP4's own model error.
//! For an agency-accurate reduction, set `eop_finals2000a` to the body of a real
//! IERS `finals2000A` file: the per-epoch UT1−UTC and pole are then interpolated
//! from it (the *same* [`crate::eop::EopSeries`] `precise_od` uses) and override the
//! scalars. The data is inlined in the scenario, so the run stays reproducible from
//! the scenario alone and needs no filesystem (it works in the WASM playground).

use crate::frames::{
    arcsec, ecef_to_geodetic, geodetic_to_ecef, itrf_to_teme, look_angles, teme_to_itrf, Geodetic,
};
use crate::orbit::{OrbitCfg, Propagator};
use crate::rinex::EpochUtc;
use crate::timescales::{julian_date, utc_to_tt, utc_to_ut1};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

type Vec3 = [f64; 3];

/// Speed of light (m/s), for the carrier Doppler shift.
const C_M_S: f64 = 299_792_458.0;
/// GPS L1 carrier (Hz) — the default the Doppler shift is reported at.
const GPS_L1_HZ: f64 = 1_575_420_000.0;
/// Earth rotation rate as the GMST advance rate (rad/s): one full TEME→ECEF
/// rotation `R3(GMST)` turns at this rate, so the inertial velocity of a fixed
/// ground station is `ω × r`. Matches the sidereal day, not the solar day.
const GMST_RATE_RAD_S: f64 = 7.292_115_855_3e-5;
/// JD of the SGP4 epoch origin (1950 Jan 0.0 UTC). `jd_utc = epoch_days_1950 + this`.
const JD_1950_ORIGIN: f64 = 2_433_281.5;

/// A geodetic ground station (degrees / metres).
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
pub struct StationCfg {
    pub lat_deg: f64,
    pub lon_deg: f64,
    #[serde(default)]
    pub alt_m: f64,
}

impl StationCfg {
    fn geodetic(&self) -> Geodetic {
        Geodetic {
            lat_rad: self.lat_deg.to_radians(),
            lon_rad: self.lon_deg.to_radians(),
            alt_m: self.alt_m,
        }
    }
}

fn default_step_s() -> f64 {
    60.0
}
fn default_duration_s() -> f64 {
    5_400.0
}
fn default_carrier_hz() -> f64 {
    GPS_L1_HZ
}

/// An ephemeris / ground-track scenario: one satellite (a TLE → SGP4, or an
/// analytic `orbit`), a time grid, and an optional ground station.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct EphemerisScenario {
    /// The scenario kind tag (`ephemeris`); ignored by the runner.
    #[serde(default)]
    pub kind: Option<String>,
    /// A two-line element set (`"line1\nline2"`, an optional name line is allowed).
    #[serde(default)]
    pub tle: Option<String>,
    /// An analytic Keplerian orbit, the alternative to `tle`. Requires `epoch`.
    #[serde(default)]
    pub orbit: Option<OrbitCfg>,
    /// The UTC instant labelling `t = 0`. Required for an analytic `orbit`; for a
    /// TLE it defaults to (and normally should be left as) the TLE's own epoch.
    #[serde(default)]
    pub epoch: Option<EpochUtc>,
    #[serde(default = "default_step_s")]
    pub step_s: f64,
    #[serde(default = "default_duration_s")]
    pub duration_s: f64,
    #[serde(default)]
    pub station: Option<StationCfg>,
    /// UT1−UTC (s); 0 ⇒ the DUT1≈0 approximation (≤ ~13″, i.e. a few-hundred-metre,
    /// longitude shift in the ground track).
    #[serde(default)]
    pub dut1_s: f64,
    /// IERS polar-motion pole coordinates (arcsec); default 0.
    #[serde(default)]
    pub xp_arcsec: f64,
    #[serde(default)]
    pub yp_arcsec: f64,
    /// Carrier frequency (Hz) the Doppler shift is reported at; default GPS L1.
    #[serde(default = "default_carrier_hz")]
    pub carrier_hz: f64,
    /// Optional real IERS Earth-orientation data: the body of a `finals2000A`
    /// (`finals.all.iau2000.txt`) file, inlined so the run stays reproducible from
    /// the scenario alone and works with no filesystem (WASM). When present it
    /// supplies the per-epoch UT1−UTC and polar motion `x_p`/`y_p`, overriding the
    /// nominal `dut1_s`/`xp_arcsec`/`yp_arcsec` scalars — the same series
    /// `precise_od` uses. Left empty, the ground track uses the nominal scalars.
    #[serde(default)]
    pub eop_finals2000a: Option<String>,
}

/// One station-relative view: look angles and the geometric range-rate / Doppler.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct StationView {
    pub az_deg: f64,
    pub el_deg: f64,
    pub range_km: f64,
    /// Range-rate (m/s); positive = receding (range increasing).
    pub range_rate_m_s: f64,
    /// Carrier Doppler shift (Hz) = −range_rate / λ; positive as the satellite closes.
    pub doppler_hz: f64,
    /// True when the satellite is at or above the station's local horizon.
    pub visible: bool,
}

/// One time sample of the ephemeris.
#[derive(Clone, Debug, Serialize)]
pub struct EphemSample {
    pub t_s: f64,
    pub jd_utc: f64,
    pub teme_r_m: Vec3,
    pub teme_v_m_s: Vec3,
    pub gcrs_r_m: Vec3,
    pub gcrs_v_m_s: Vec3,
    pub ecef_r_m: Vec3,
    pub lat_deg: f64,
    pub lon_deg: f64,
    pub alt_km: f64,
    /// Inertial speed (m/s).
    pub speed_m_s: f64,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub station_view: Option<StationView>,
}

/// The result of an ephemeris run: summary extrema plus every sample.
#[derive(Clone, Debug, Serialize)]
pub struct EphemerisResult {
    pub scenario_hash: String,
    pub source: String,
    pub jd_utc0: f64,
    pub n_samples: usize,
    pub lat_min_deg: f64,
    pub lat_max_deg: f64,
    pub alt_min_km: f64,
    pub alt_max_km: f64,
    pub speed_min_m_s: f64,
    pub speed_max_m_s: f64,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub max_elevation_deg: Option<f64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub peak_doppler_hz: Option<f64>,
    pub samples: Vec<EphemSample>,
}

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Build the propagator and the absolute UTC Julian date at `t = 0`.
fn build(scn: &EphemerisScenario) -> Result<(Propagator, f64, String), String> {
    if let Some(tle) = &scn.tle {
        let lines: Vec<&str> = tle
            .lines()
            .map(str::trim)
            .filter(|l| !l.is_empty())
            .collect();
        let l1 = lines
            .iter()
            .find(|l| l.starts_with("1 "))
            .ok_or("TLE is missing line 1 (a line starting `1 `)")?;
        let l2 = lines
            .iter()
            .find(|l| l.starts_with("2 "))
            .ok_or("TLE is missing line 2 (a line starting `2 `)")?;
        let t = crate::tle::parse_tle(l1, l2)?;
        let jd0 = match &scn.epoch {
            Some(e) => julian_date(e.year, e.month, e.day, e.hour, e.minute, e.second),
            None => t.epoch_days_1950 + JD_1950_ORIGIN,
        };
        let prop = Propagator::Sgp4(Box::new(t.to_sgp4(crate::sgp4::wgs72(), false)));
        Ok((prop, jd0, "sgp4 (TLE)".to_string()))
    } else if let Some(o) = &scn.orbit {
        let e = scn
            .epoch
            .as_ref()
            .ok_or("an analytic `orbit` ephemeris requires an `epoch`")?;
        let jd0 = julian_date(e.year, e.month, e.day, e.hour, e.minute, e.second);
        Ok((Propagator::Kepler(o.to_orbit()), jd0, "kepler".to_string()))
    } else {
        Err("ephemeris scenario needs either a `tle` or an `orbit`".to_string())
    }
}

/// Run the ephemeris / ground-track scenario.
pub fn run_ephemeris(scn: &EphemerisScenario) -> Result<EphemerisResult, String> {
    if !scn.step_s.is_finite() || scn.step_s <= 0.0 {
        return Err("step_s must be positive".to_string());
    }
    if scn.duration_s < 0.0 {
        return Err("duration_s must be non-negative".to_string());
    }
    if !scn.carrier_hz.is_finite() || scn.carrier_hz <= 0.0 {
        return Err("carrier_hz must be a positive, finite frequency".to_string());
    }
    let (prop, jd_utc0, source) = build(scn)?;
    let station = scn.station;
    let lambda_m = C_M_S / scn.carrier_hz;
    // Real IERS EOP if supplied (the `precise_od` series), else the nominal scalars.
    let eop = match &scn.eop_finals2000a {
        Some(body) => {
            let s = crate::eop::EopSeries::from_finals2000a(body);
            if s.is_empty() {
                return Err(
                    "eop_finals2000a contained no readable IERS finals2000A rows".to_string(),
                );
            }
            Some(s)
        }
        None => None,
    };
    let (xp_nom, yp_nom) = (arcsec(scn.xp_arcsec), arcsec(scn.yp_arcsec));

    let n = (scn.duration_s / scn.step_s).round() as usize;
    let mut samples = Vec::with_capacity(n + 1);
    let (mut lat_min, mut lat_max) = (f64::INFINITY, f64::NEG_INFINITY);
    let (mut alt_min, mut alt_max) = (f64::INFINITY, f64::NEG_INFINITY);
    let (mut spd_min, mut spd_max) = (f64::INFINITY, f64::NEG_INFINITY);
    let mut max_el: Option<f64> = None;
    let mut peak_dopp: Option<f64> = None;

    for i in 0..=n {
        let t = i as f64 * scn.step_s;
        let jd_utc = jd_utc0 + t / 86_400.0;
        let jd_tt = utc_to_tt(jd_utc);
        // UT1 and the pole come from the real EOP series when supplied, else from
        // the nominal scalars (dut1_s / xp_arcsec / yp_arcsec, default 0).
        let (jd_ut1, xp, yp) = match &eop {
            Some(s) => s.frame_args_tt(jd_tt),
            None => (utc_to_ut1(jd_utc, scn.dut1_s), xp_nom, yp_nom),
        };

        let st = prop.state_eci(t); // TEME (m, m/s)
        let gcrs = prop.state_gcrs(t, jd_tt); // GCRS (≈ J2000)
        let ecef = teme_to_itrf(st.r_m, jd_ut1, xp, yp, jd_tt);
        let geod = ecef_to_geodetic(ecef);
        let (lat_deg, lon_deg, alt_km) = (
            geod.lat_rad.to_degrees(),
            geod.lon_rad.to_degrees(),
            geod.alt_m / 1000.0,
        );
        let speed = norm(st.v_m_s);

        let station_view = station.map(|s| {
            let st_geod = s.geodetic();
            let look = look_angles(st_geod, ecef);
            // Range-rate in the inertial (TEME) frame. The station's fixed ITRF
            // position is mapped to TEME through the SAME reduction as the satellite
            // (`itrf_to_teme` undoes polar motion then the sidereal rotation), so both
            // endpoints share one frame. The station then rotates with the Earth
            // (v = ω × r about the TEME z-axis), the satellite carries its own inertial
            // velocity, and the range-rate is the relative velocity projected onto the
            // line of sight — the analytic d(range)/dt, free of any JD differencing.
            let s_teme = itrf_to_teme(geodetic_to_ecef(st_geod), jd_ut1, xp, yp, jd_tt);
            let v_station = [
                -GMST_RATE_RAD_S * s_teme[1],
                GMST_RATE_RAD_S * s_teme[0],
                0.0,
            ];
            let d = [
                st.r_m[0] - s_teme[0],
                st.r_m[1] - s_teme[1],
                st.r_m[2] - s_teme[2],
            ];
            let rng = norm(d);
            let v_rel = [
                st.v_m_s[0] - v_station[0],
                st.v_m_s[1] - v_station[1],
                st.v_m_s[2] - v_station[2],
            ];
            let range_rate = if rng > 0.0 {
                (v_rel[0] * d[0] + v_rel[1] * d[1] + v_rel[2] * d[2]) / rng
            } else {
                0.0
            };
            let doppler = -range_rate / lambda_m;
            let el_deg = look.el_rad.to_degrees();
            if el_deg >= 0.0 {
                max_el = Some(max_el.map_or(el_deg, |m: f64| m.max(el_deg)));
                let ad = doppler.abs();
                peak_dopp = Some(peak_dopp.map_or(ad, |m: f64| m.max(ad)));
            }
            StationView {
                az_deg: look.az_rad.to_degrees(),
                el_deg,
                range_km: look.range_m / 1000.0,
                range_rate_m_s: range_rate,
                doppler_hz: doppler,
                visible: el_deg >= 0.0,
            }
        });

        lat_min = lat_min.min(lat_deg);
        lat_max = lat_max.max(lat_deg);
        alt_min = alt_min.min(alt_km);
        alt_max = alt_max.max(alt_km);
        spd_min = spd_min.min(speed);
        spd_max = spd_max.max(speed);

        samples.push(EphemSample {
            t_s: t,
            jd_utc,
            teme_r_m: st.r_m,
            teme_v_m_s: st.v_m_s,
            gcrs_r_m: gcrs.r_m,
            gcrs_v_m_s: gcrs.v_m_s,
            ecef_r_m: ecef,
            lat_deg,
            lon_deg,
            alt_km,
            speed_m_s: speed,
            station_view,
        });
    }

    let mut hasher = Sha256::new();
    hasher.update(serde_json::to_string(scn).unwrap_or_default().as_bytes());
    let scenario_hash = format!("{:x}", hasher.finalize());

    Ok(EphemerisResult {
        scenario_hash,
        source,
        jd_utc0,
        n_samples: samples.len(),
        lat_min_deg: lat_min,
        lat_max_deg: lat_max,
        alt_min_km: alt_min,
        alt_max_km: alt_max,
        speed_min_m_s: spd_min,
        speed_max_m_s: spd_max,
        max_elevation_deg: max_el,
        peak_doppler_hz: peak_dopp,
        samples,
    })
}

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

/// A self-contained ground-track SVG: an equirectangular world map (lon −180..180,
/// lat −90..90) with the actual continents (Natural Earth 1:110m land) drawn behind
/// a 30° graticule and the equator, and the sub-satellite track as a polyline broken
/// at the antimeridian. The station, if any, is a small marker. No provenance footer
/// — the central stamp in `api.rs` adds it.
pub fn to_svg(r: &EphemerisResult) -> String {
    let (w, h) = (720.0, 360.0);
    let proj = |lon: f64, lat: f64| -> (f64, f64) {
        ((lon + 180.0) / 360.0 * w, (90.0 - lat) / 180.0 * h)
    };
    let mut svg = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" viewBox=\"0 0 {w} {h}\">\
         <rect width=\"{w}\" height=\"{h}\" fill=\"#0c0b08\"/>"
    );
    // The actual landmasses (Natural Earth 1:110m, simplified) as the map base, each
    // ring filled and outlined in the same equirectangular projection as the track. A
    // jump over the antimeridian starts a fresh sub-path so no land smears across.
    for ring in crate::worldmap::LAND {
        let mut d = String::new();
        let mut prev_lon = f64::NAN;
        for &(rlon, rlat) in ring.iter() {
            let (rlon, rlat) = (rlon as f64, rlat as f64);
            let (x, y) = proj(rlon, rlat);
            let cmd = if !prev_lon.is_finite() || (rlon - prev_lon).abs() > 180.0 {
                'M'
            } else {
                'L'
            };
            d.push_str(&format!("{cmd}{x:.1} {y:.1}"));
            prev_lon = rlon;
        }
        d.push('Z');
        svg.push_str(&format!(
            "<path d=\"{d}\" fill=\"#201a11\" stroke=\"#39301f\" stroke-width=\"0.5\"/>"
        ));
    }
    // Graticule every 30°: 13 meridians (−180..=180) and 7 parallels (−90..=90).
    for i in 0..=12 {
        let lon = -180.0 + 30.0 * f64::from(i);
        let (x, _) = proj(lon, 0.0);
        svg.push_str(&format!(
            "<line x1=\"{x:.1}\" y1=\"0\" x2=\"{x:.1}\" y2=\"{h}\" stroke=\"#262019\" stroke-width=\"1\"/>"
        ));
    }
    for i in 0..=6 {
        let lat = -90.0 + 30.0 * f64::from(i);
        let (_, y) = proj(0.0, lat);
        let col = if lat == 0.0 { "#342c21" } else { "#262019" };
        svg.push_str(&format!(
            "<line x1=\"0\" y1=\"{y:.1}\" x2=\"{w}\" y2=\"{y:.1}\" stroke=\"{col}\" stroke-width=\"1\"/>"
        ));
    }
    // The ground track, split where the longitude wraps the antimeridian.
    let mut seg = String::new();
    let mut prev_lon = f64::NAN;
    let flush = |svg: &mut String, seg: &mut String| {
        if seg.split(' ').filter(|s| !s.is_empty()).count() >= 2 {
            svg.push_str(&format!(
                "<polyline points=\"{}\" fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"1.8\"/>",
                seg.trim()
            ));
        }
        seg.clear();
    };
    for s in &r.samples {
        if prev_lon.is_finite() && (s.lon_deg - prev_lon).abs() > 180.0 {
            flush(&mut svg, &mut seg);
        }
        let (x, y) = proj(s.lon_deg, s.lat_deg);
        seg.push_str(&format!("{x:.1},{y:.1} "));
        prev_lon = s.lon_deg;
    }
    flush(&mut svg, &mut seg);
    // Start marker.
    if let Some(s0) = r.samples.first() {
        let (x, y) = proj(s0.lon_deg, s0.lat_deg);
        svg.push_str(&format!(
            "<circle cx=\"{x:.1}\" cy=\"{y:.1}\" r=\"3.5\" fill=\"#f1ece2\" stroke=\"#0c0b08\" stroke-width=\"0.8\"/>"
        ));
    }
    let title = format!(
        "{} ground track · {} samples · alt {:.0}–{:.0} km · |lat| ≤ {:.1}°",
        r.source,
        r.n_samples,
        r.alt_min_km,
        r.alt_max_km,
        r.lat_max_deg.abs().max(r.lat_min_deg.abs()),
    );
    svg.push_str(&format!(
        "<text x=\"10\" y=\"20\" fill=\"#e6edf3\" font-family=\"sans-serif\" font-size=\"13\">{}</text>",
        esc(&title)
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    // A real published ISS (ZARYA) two-line element set. Inclination 51.64° is the
    // recognisable ISS value the ground-track latitude band must respect.
    const ISS_TLE: &str = "\
1 25544U 98067A   20045.18587073  .00000950  00000-0  25302-4 0  9990
2 25544  51.6443 242.0161 0004885 264.6060 207.3845 15.49165514212791";

    fn iss_scenario() -> EphemerisScenario {
        EphemerisScenario {
            kind: Some("ephemeris".into()),
            tle: Some(ISS_TLE.into()),
            orbit: None,
            epoch: None,
            step_s: 30.0,
            duration_s: 5_580.0, // ~one ISS revolution
            station: None,
            dut1_s: 0.0,
            xp_arcsec: 0.0,
            yp_arcsec: 0.0,
            carrier_hz: GPS_L1_HZ,
            eop_finals2000a: None,
        }
    }

    #[test]
    fn ground_track_latitude_stays_within_inclination_band() {
        // A satellite can never reach a sub-satellite latitude above its orbital
        // inclination (plus a fraction of a degree of geodetic-vs-geocentric slack).
        let r = run_ephemeris(&iss_scenario()).unwrap();
        let max_abs_lat = r.lat_max_deg.abs().max(r.lat_min_deg.abs());
        assert!(
            max_abs_lat <= 52.0,
            "max |lat| {max_abs_lat:.2}° exceeds the 51.64° ISS inclination band"
        );
        // ...and it actually reaches the high latitudes (not a degenerate equatorial run).
        assert!(
            max_abs_lat > 50.0,
            "ground track only reached |lat| {max_abs_lat:.2}°"
        );
    }

    #[test]
    fn altitude_and_speed_are_in_the_iss_leo_regime() {
        let r = run_ephemeris(&iss_scenario()).unwrap();
        // ISS altitude ~400–420 km; allow a generous LEO band.
        assert!(
            r.alt_min_km > 350.0 && r.alt_max_km < 470.0,
            "alt {:.0}–{:.0} km",
            r.alt_min_km,
            r.alt_max_km
        );
        // ISS orbital speed ~7.66 km/s.
        assert!(
            r.speed_min_m_s > 7_400.0 && r.speed_max_m_s < 7_900.0,
            "speed {:.0}–{:.0} m/s",
            r.speed_min_m_s,
            r.speed_max_m_s
        );
    }

    #[test]
    fn frames_preserve_magnitude_and_velocity_is_nonzero() {
        // GCRS and TEME are rotations of one another: |r| and |v| are invariant. The
        // ECEF position is also a rotation of TEME (Earth-fixed), so |r| matches too.
        let r = run_ephemeris(&iss_scenario()).unwrap();
        for s in &r.samples {
            let rt = norm(s.teme_r_m);
            assert!((norm(s.gcrs_r_m) - rt).abs() < 1.0, "|r| GCRS vs TEME");
            assert!((norm(s.ecef_r_m) - rt).abs() < 1.0, "|r| ECEF vs TEME");
            assert!(
                (norm(s.gcrs_v_m_s) - norm(s.teme_v_m_s)).abs() < 1e-3,
                "|v| GCRS vs TEME"
            );
            assert!(
                norm(s.teme_v_m_s) > 1_000.0,
                "velocity must be exposed and non-zero"
            );
        }
    }

    #[test]
    fn ground_track_longitude_regresses_westward_over_a_revolution() {
        // For a prograde LEO the track shifts west ~22.5° each revolution as the
        // Earth turns underneath: the longitudes must actually move (not be frozen).
        let r = run_ephemeris(&iss_scenario()).unwrap();
        let spread = r
            .samples
            .windows(2)
            .map(|w| (w[1].lon_deg - w[0].lon_deg).abs())
            .filter(|d| *d < 180.0) // ignore antimeridian wraps
            .fold(0.0_f64, f64::max);
        assert!(spread > 0.1, "ground track longitude is not advancing");
    }

    /// The worst |reported range-rate − Richardson-FD(range)| (m/s) over the interior
    /// of a run, with the station placed off-track for smooth geometry. The Richardson
    /// (O(h⁴)) finite difference of the geometric range is the exact d(range)/dt, so
    /// this isolates the implementation of `range_rate = (v_sat − v_station)·û`.
    fn worst_range_rate_vs_fd(scn: &EphemerisScenario) -> (f64, usize) {
        let r = run_ephemeris(scn).unwrap();
        let st = scn.station.unwrap().geodetic();
        let (prop, _, _) = build(scn).unwrap();
        // Resolve the frame inputs exactly as the production runner does, so the
        // reference is valid with nominal scalars OR a real EOP series.
        let eop = scn
            .eop_finals2000a
            .as_ref()
            .map(|b| crate::eop::EopSeries::from_finals2000a(b));
        let range_at = |t: f64| -> f64 {
            let jd_utc = r.jd_utc0 + t / 86_400.0;
            let jd_tt = utc_to_tt(jd_utc);
            let (jd_ut1, xp, yp) = match &eop {
                Some(s) => s.frame_args_tt(jd_tt),
                None => (
                    utc_to_ut1(jd_utc, scn.dut1_s),
                    arcsec(scn.xp_arcsec),
                    arcsec(scn.yp_arcsec),
                ),
            };
            let ecef = teme_to_itrf(prop.state_eci(t).r_m, jd_ut1, xp, yp, jd_tt);
            look_angles(st, ecef).range_m
        };
        let h = 0.25_f64;
        let deriv = |t: f64| -> f64 {
            let d1 = (range_at(t + h) - range_at(t - h)) / (2.0 * h);
            let d2 = (range_at(t + 2.0 * h) - range_at(t - 2.0 * h)) / (4.0 * h);
            (4.0 * d1 - d2) / 3.0
        };
        let (mut worst, mut checked) = (0.0_f64, 0usize);
        for s in &r.samples {
            if s.t_s < 2.0 * h || s.t_s > scn.duration_s - 2.0 * h {
                continue;
            }
            worst = worst.max((deriv(s.t_s) - s.station_view.unwrap().range_rate_m_s).abs());
            checked += 1;
        }
        (worst, checked)
    }

    #[test]
    fn exposed_velocity_is_the_true_position_derivative_kepler() {
        // TIGHT, Julian-Date-noise-free battle test of the exposed velocity. The
        // radial range-rate to the geocentre is d|r|/dt = v·r̂ — it has NO sidereal-
        // time term, so unlike a station range-rate it is not limited by the single-
        // f64 JD resolution (~47 µs near J2000+). Computed from the exposed (r, v) it
        // must equal the Richardson FD of |r(t)| to << 1 mm/s, proving the velocity is
        // exposed as the genuine derivative of the position and the projection is
        // correct. (The Keplerian velocity is a ½-s central difference of position,
        // whose ~0.4 mm/s truncation is the only residual — hence the 2 mm/s bound.)
        let scn = EphemerisScenario {
            kind: Some("ephemeris".into()),
            tle: None,
            orbit: Some(OrbitCfg {
                altitude_km: 550.0,
                inclination_deg: 53.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: false,
            }),
            epoch: Some(EpochUtc {
                year: 2024,
                month: 1,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0.0,
            }),
            step_s: 30.0,
            duration_s: 3_000.0,
            station: None,
            dut1_s: 0.0,
            xp_arcsec: 0.0,
            yp_arcsec: 0.0,
            carrier_hz: GPS_L1_HZ,
            eop_finals2000a: None,
        };
        let r = run_ephemeris(&scn).unwrap();
        let (prop, _, _) = build(&scn).unwrap();
        let rad_at = |t: f64| norm(prop.state_eci(t).r_m);
        let h = 0.25_f64;
        let deriv = |t: f64| -> f64 {
            let d1 = (rad_at(t + h) - rad_at(t - h)) / (2.0 * h);
            let d2 = (rad_at(t + 2.0 * h) - rad_at(t - 2.0 * h)) / (4.0 * h);
            (4.0 * d1 - d2) / 3.0
        };
        let (mut worst, mut checked) = (0.0_f64, 0usize);
        for s in &r.samples {
            if s.t_s < 2.0 * h || s.t_s > scn.duration_s - 2.0 * h {
                continue;
            }
            let rmag = norm(s.teme_r_m);
            let pred = (s.teme_v_m_s[0] * s.teme_r_m[0]
                + s.teme_v_m_s[1] * s.teme_r_m[1]
                + s.teme_v_m_s[2] * s.teme_r_m[2])
                / rmag; // v·r̂
            worst = worst.max((pred - deriv(s.t_s)).abs());
            checked += 1;
        }
        assert!(checked > 50, "not enough interior samples ({checked})");
        eprintln!("kepler worst |v·r̂ − d|r|/dt| = {worst:.2e} m/s over {checked} samples");
        assert!(
            worst < 2e-3,
            "exposed velocity ≠ position derivative: {worst:.3e} m/s (> 2 mm/s)"
        );
    }

    #[test]
    fn station_range_rate_matches_range_derivative_within_jd_resolution() {
        // The full Earth-rotating-station range-rate (hence Doppler) matches a
        // Richardson FD of the geometric range to ~0.03 m/s for both the analytic
        // orbit and SGP4. The residual is dominated by the single-f64 Julian-Date
        // resolution (~47 µs) in the FD reference's sidereal-time term — a property of
        // the finite-difference REFERENCE, NOT of the production range-rate, which is
        // fully analytic (the station inertial velocity is ω × r, no JD differencing).
        // The exposed velocity itself is validated JD-free to < 1 mm/s above (Kepler)
        // and to 1 mm/s against the official tcppver vectors (SGP4).
        let kepler = EphemerisScenario {
            kind: Some("ephemeris".into()),
            tle: None,
            orbit: Some(OrbitCfg {
                altitude_km: 550.0,
                inclination_deg: 53.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: false,
            }),
            epoch: Some(EpochUtc {
                year: 2024,
                month: 1,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0.0,
            }),
            step_s: 30.0,
            duration_s: 3_000.0,
            station: Some(StationCfg {
                lat_deg: 20.0,
                lon_deg: 10.0,
                alt_m: 100.0,
            }),
            dut1_s: 0.0,
            xp_arcsec: 0.0,
            yp_arcsec: 0.0,
            carrier_hz: GPS_L1_HZ,
            eop_finals2000a: None,
        };
        let (wk, ck) = worst_range_rate_vs_fd(&kepler);
        eprintln!("kepler station worst |range_rate − FD| = {wk:.2e} m/s over {ck} samples");
        assert!(
            ck > 50 && wk < 0.06,
            "kepler station range-rate vs FD: {wk:.3e} m/s"
        );

        let mut sgp4 = iss_scenario();
        let probe = run_ephemeris(&sgp4).unwrap();
        let mid = &probe.samples[probe.samples.len() / 2];
        let st_lat = (mid.lat_deg + 25.0).clamp(-80.0, 80.0);
        sgp4.station = Some(StationCfg {
            lat_deg: st_lat,
            lon_deg: mid.lon_deg,
            alt_m: 100.0,
        });
        sgp4.step_s = 30.0;
        sgp4.duration_s = 3_000.0;
        let (ws, cs) = worst_range_rate_vs_fd(&sgp4);
        eprintln!("sgp4 station worst |range_rate − FD| = {ws:.2e} m/s over {cs} samples");
        assert!(
            cs > 50 && ws < 0.06,
            "sgp4 station range-rate vs FD: {ws:.3e} m/s"
        );
    }

    #[test]
    fn station_range_rate_is_consistent_under_polar_motion() {
        // Regime coverage: the range-rate path runs correctly with a realistic pole
        // AND a non-zero DUT1 — the case the FD reference could not exercise before,
        // because its oracle hardcoded zero polar motion. Both the station (via
        // `itrf_to_teme`) and the satellite (via `teme_to_itrf`) are now reduced
        // through the same pole, so the residual stays at the same JD-resolution-
        // limited floor (~0.03 m/s) as the no-pole case.
        //
        // This does NOT isolate the station-frame fix itself: the polar-motion error
        // in the OLD blind mapping perturbs the range-rate by < the FD floor (measured
        // ~0.030 vs ~0.025 m/s), so it is invisible here. The fix is isolated tightly
        // by `frames::tests::itrf_to_teme_is_the_exact_inverse_of_teme_to_itrf`, where
        // the blind mapping's ~tens-of-metres station-position error is a clean signal.
        let mut kepler = EphemerisScenario {
            kind: Some("ephemeris".into()),
            tle: None,
            orbit: Some(OrbitCfg {
                altitude_km: 550.0,
                inclination_deg: 53.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: false,
            }),
            epoch: Some(EpochUtc {
                year: 2024,
                month: 1,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0.0,
            }),
            step_s: 30.0,
            duration_s: 3_000.0,
            station: Some(StationCfg {
                lat_deg: 20.0,
                lon_deg: 10.0,
                alt_m: 100.0,
            }),
            // A realistic IERS pole and a non-zero DUT1 — the regime where the station
            // frame reduction has to be exact.
            dut1_s: -0.2,
            xp_arcsec: 0.21,
            yp_arcsec: 0.31,
            carrier_hz: GPS_L1_HZ,
            eop_finals2000a: None,
        };
        let (wk, ck) = worst_range_rate_vs_fd(&kepler);
        eprintln!("kepler+pole station worst |range_rate − FD| = {wk:.2e} m/s over {ck} samples");
        assert!(
            ck > 50 && wk < 0.06,
            "kepler+pole station range-rate vs FD: {wk:.3e} m/s"
        );

        // SGP4 path with the same pole.
        kepler.tle = Some(iss_scenario().tle.unwrap());
        kepler.orbit = None;
        kepler.epoch = None;
        let probe = run_ephemeris(&kepler).unwrap();
        let mid = &probe.samples[probe.samples.len() / 2];
        kepler.station = Some(StationCfg {
            lat_deg: (mid.lat_deg + 25.0).clamp(-80.0, 80.0),
            lon_deg: mid.lon_deg,
            alt_m: 100.0,
        });
        let (ws, cs) = worst_range_rate_vs_fd(&kepler);
        eprintln!("sgp4+pole station worst |range_rate − FD| = {ws:.2e} m/s over {cs} samples");
        assert!(
            cs > 50 && ws < 0.06,
            "sgp4+pole station range-rate vs FD: {ws:.3e} m/s"
        );
    }

    #[test]
    fn doppler_sign_and_magnitude_are_physical() {
        // L1 Doppler for a LEO pass is a few tens of kHz peak; positive (closing)
        // before TCA and negative (receding) after. Place the station at a computed
        // sub-satellite point so a near-overhead pass is guaranteed, then check the
        // peak magnitude band and the sign change across closest approach.
        let mut scn = iss_scenario();
        let probe = run_ephemeris(&scn).unwrap();
        let mid = &probe.samples[probe.samples.len() / 2];
        scn.station = Some(StationCfg {
            lat_deg: mid.lat_deg,
            lon_deg: mid.lon_deg,
            alt_m: 0.0,
        });
        scn.step_s = 5.0;
        let r = run_ephemeris(&scn).unwrap();
        let dopps: Vec<f64> = r
            .samples
            .iter()
            .filter_map(|s| s.station_view)
            .filter(|v| v.visible)
            .map(|v| v.doppler_hz)
            .collect();
        assert!(!dopps.is_empty(), "no visible pass found");
        let peak = dopps.iter().fold(0.0_f64, |m, d| m.max(d.abs()));
        assert!(
            (8_000.0..70_000.0).contains(&peak),
            "peak Doppler {peak:.0} Hz out of LEO L1 band"
        );
        assert!(
            dopps.iter().any(|d| *d > 0.0) && dopps.iter().any(|d| *d < 0.0),
            "Doppler should change sign across TCA"
        );
    }

    #[test]
    fn analytic_orbit_path_runs_with_an_explicit_epoch() {
        let scn = EphemerisScenario {
            kind: Some("ephemeris".into()),
            tle: None,
            orbit: Some(OrbitCfg {
                altitude_km: 550.0,
                inclination_deg: 53.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: true,
            }),
            epoch: Some(EpochUtc {
                year: 2024,
                month: 1,
                day: 1,
                hour: 0,
                minute: 0,
                second: 0.0,
            }),
            step_s: 60.0,
            duration_s: 5_700.0,
            station: None,
            dut1_s: 0.0,
            xp_arcsec: 0.0,
            yp_arcsec: 0.0,
            carrier_hz: GPS_L1_HZ,
            eop_finals2000a: None,
        };
        let r = run_ephemeris(&scn).unwrap();
        assert_eq!(r.source, "kepler");
        // A 53° inclination orbit reaches ~53° latitude.
        assert!(r.lat_max_deg.abs().max(r.lat_min_deg.abs()) > 50.0);
        // Velocity is exposed for the analytic orbit too.
        assert!(r.speed_min_m_s > 7_000.0);
    }

    #[test]
    fn analytic_orbit_without_epoch_is_an_error() {
        let mut scn = iss_scenario();
        scn.tle = None;
        scn.orbit = Some(OrbitCfg {
            altitude_km: 500.0,
            inclination_deg: 45.0,
            raan_deg: 0.0,
            u0_deg: 0.0,
            eccentricity: 0.0,
            argp_deg: 0.0,
            j2: false,
        });
        scn.epoch = None;
        assert!(run_ephemeris(&scn).is_err());
    }

    #[test]
    fn non_positive_carrier_is_an_error() {
        // `carrier_hz` is a user-supplied JSON field with a clear physical
        // constraint (> 0). A zero carrier would make λ = c/0 = +∞ and silently
        // zero every Doppler value rather than fail — so it must be rejected, the
        // same way `step_s` is.
        for bad in [0.0, -1.0, f64::NAN, f64::INFINITY] {
            let mut scn = iss_scenario();
            scn.carrier_hz = bad;
            assert!(
                run_ephemeris(&scn).is_err(),
                "carrier_hz = {bad} must be rejected"
            );
        }
        // The valid default still runs.
        assert!(run_ephemeris(&iss_scenario()).is_ok());
    }

    // Real IERS finals2000A rows (Bulletin A final, flag `I`), MJD 59579 & 59580 —
    // the same verified rows the eop module parses. DUT1 ≈ −0.110 s, pole ≈ 0.056″ /
    // 0.277″.
    const EOP_ROW_59579: &str = "211231 59579.00 I  0.056257 0.000030  0.275943 0.000035  I-0.1104179 0.0000019  0.1927 0.0016  I     0.073    0.060    -0.273    0.299  0.056304  0.275973 -0.1104355     0.040    -0.287  ";
    const EOP_ROW_59580: &str = "22 1 1 59580.00 I  0.054644 0.000026  0.276986 0.000032  I-0.1104988 0.0000023 -0.0267 0.0022  I     0.095    0.060    -0.250    0.299  0.054574  0.276983 -0.1105197     0.059    -0.259  ";

    #[test]
    fn real_eop_overrides_the_nominal_frame_reduction() {
        // An analytic orbit at MJD 59579.5 (inside the two-row span, so the series
        // interpolates rather than clamps). With a real finals2000A body the runner
        // must reduce TEME→ITRF through the interpolated (UT1−UTC, x_p, y_p) — i.e.
        // exactly `EopSeries::frame_args_tt` — not the nominal DUT1 = 0 / no-pole.
        let body = format!("{EOP_ROW_59579}\n{EOP_ROW_59580}\n");
        let base = EphemerisScenario {
            kind: Some("ephemeris".into()),
            tle: None,
            orbit: Some(OrbitCfg {
                altitude_km: 550.0,
                inclination_deg: 53.0,
                raan_deg: 0.0,
                u0_deg: 0.0,
                eccentricity: 0.0,
                argp_deg: 0.0,
                j2: false,
            }),
            epoch: Some(EpochUtc {
                year: 2021,
                month: 12,
                day: 31,
                hour: 12,
                minute: 0,
                second: 0.0,
            }),
            step_s: 60.0,
            duration_s: 120.0,
            station: None,
            dut1_s: 0.0,
            xp_arcsec: 0.0,
            yp_arcsec: 0.0,
            carrier_hz: GPS_L1_HZ,
            eop_finals2000a: None,
        };
        let mut with_eop = base.clone();
        with_eop.eop_finals2000a = Some(body.clone());

        let r = run_ephemeris(&with_eop).unwrap();
        let rn = run_ephemeris(&base).unwrap();

        // Independent expectation from the series at the t = 0 epoch.
        let series = crate::eop::EopSeries::from_finals2000a(&body);
        assert_eq!(series.len(), 2, "both real IERS rows must parse");
        let (prop, _, _) = build(&with_eop).unwrap();
        let teme0 = prop.state_eci(0.0).r_m;
        let jd_tt0 = utc_to_tt(r.jd_utc0);
        let (jd_ut1, xp, yp) = series.frame_args_tt(jd_tt0);
        let expected = teme_to_itrf(teme0, jd_ut1, xp, yp, jd_tt0);
        let got = r.samples[0].ecef_r_m;
        for k in 0..3 {
            assert!(
                (got[k] - expected[k]).abs() < 1e-3,
                "EOP-reduced ECEF component {k}: {} vs {}",
                got[k],
                expected[k]
            );
        }
        // DUT1 ≈ −0.11 s (≈ 8e-6 rad of Earth rotation ≈ tens of metres at orbital
        // radius) plus the ~0.06″/0.28″ pole genuinely move the Earth-fixed point
        // away from the nominal (DUT1 = 0, no pole) reduction.
        let d = norm([
            got[0] - rn.samples[0].ecef_r_m[0],
            got[1] - rn.samples[0].ecef_r_m[1],
            got[2] - rn.samples[0].ecef_r_m[2],
        ]);
        assert!(
            (10.0..500.0).contains(&d),
            "real EOP must shift the ECEF tens of metres vs nominal (Δ = {d} m)"
        );
    }

    #[test]
    fn unparseable_eop_body_is_an_error() {
        // A non-finals2000A body parses to zero rows; rather than silently fall back
        // to nominal, the runner rejects it so a typo'd EOP file can't masquerade.
        let mut scn = iss_scenario();
        scn.eop_finals2000a = Some("not a finals2000A file\n# header\n".to_string());
        assert!(run_ephemeris(&scn).is_err());
    }

    #[test]
    fn svg_renders_and_hash_is_stable() {
        let r = run_ephemeris(&iss_scenario()).unwrap();
        let svg = to_svg(&r);
        assert!(svg.starts_with("<svg") && svg.trim_end().ends_with("</svg>"));
        assert!(svg.contains("polyline"), "ground track polyline present");
        // The actual world map is drawn behind the track: one filled <path> per
        // landmass ring, so the track reads over real continents — not a bare grid.
        let land_paths = svg.matches("<path").count();
        assert!(
            land_paths >= 50,
            "expected the world landmasses to be drawn, found only {land_paths} <path> elements"
        );
        assert_eq!(
            land_paths,
            crate::worldmap::LAND.len(),
            "one path per land ring"
        );
        // No own provenance footer — the central stamp owns that.
        assert!(!svg.contains("kshana.dev"));
        assert_eq!(
            r.scenario_hash,
            run_ephemeris(&iss_scenario()).unwrap().scenario_hash
        );
    }
}
