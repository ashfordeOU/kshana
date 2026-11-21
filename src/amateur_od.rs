// SPDX-License-Identifier: AGPL-3.0-only
//! Amateur-RF orbit determination and object characterisation for small satellites.
//!
//! Four pieces, each reusing the shipped orbit stack rather than adding a new one:
//!
//! * **Input formats.** [`parse_strf_doppler`] reads Doppler records in the plain-text layout of
//!   the STRF radio-frequency satellite tracking toolkit (C. Bassa, `github.com/cbassa/strf`,
//!   GPL-3.0; only the documented file layout is read here, no code is taken): one record per line,
//!   `MJD(UTC) frequency(Hz) flux site-id`. [`parse_strf_sites`] reads its `sites.txt` station
//!   list (`id code lat(deg) lon(deg) alt(m) name…`). [`site_from_satnogs_observation`] takes the
//!   station and transmitter fields of one SatNOGS Network observation record
//!   (`network.satnogs.org/api/observations/`; SatNOGS states its network data are CC BY-SA 4.0).
//!   [`parse_ecef_tow_csv`] reads on-board GPS fixes as `X,Y,Z (m, Earth-fixed),GPS time of week (s)`,
//!   the layout of the public Lucky-7 file (D. Estévez, `github.com/daniestevez/jupyter_notebooks`,
//!   data CC BY 4.0). The layout is documented in `docs/AMATEUR-RF-OD.md`.
//! * **Doppler orbit determination.** [`fit_doppler`] estimates the epoch inertial state and one
//!   carrier frequency per receiving site from one-way Doppler, with the full-force dynamics of
//!   [`crate::precise_od`] and its state-transition matrix ([`propagate_with_stm_samples`]) for an
//!   analytic Jacobian, solved by [`crate::batch_ls::gauss_newton_analytic`]. The model is
//!   `f = f_site · (1 − ρ̇ / c)` with `ρ̇` the range rate between the satellite and the Earth-fixed
//!   station, both in GCRS (station velocity `ω × r` rotated with the same CIO chain and IERS EOP).
//!   Light time, the second-order (relativistic) Doppler term and the troposphere and ionosphere
//!   are not modelled: at LEO the light-time term is below 0.1 Hz at 437 MHz.
//! * **GPS-fix orbit determination.** [`fixes_to_observations`] rotates Earth-fixed fixes into GCRS
//!   with real EOP for [`crate::precise_od::fit`].
//! * **Unknown-object identification and characterisation.** [`rank_tles`] ranks candidate
//!   two-line element sets by their RMS distance to a track of fixes (the method of the Lucky-7
//!   notebook above), and [`cd_area_over_mass_from_bstar`] turns an SGP4 drag term into the
//!   ballistic term `C_D·A/m` through the SGP4 reference density (Hoots & Roehrich, Spacetrack
//!   Report No. 3, 1980).
//!
//! Every output is MODELLED: it describes the given data under the stated models.

use crate::batch_ls::gauss_newton_analytic;
use crate::cio::{gcrs_to_itrs_matrix, itrs_to_gcrs};
use crate::eop::EopSeries;
use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::integrator::Tolerance;
use crate::jd2::Jd2;
use crate::portable_math::PortableFloat;
use crate::precise_od::{propagate_with_stm_samples, ForceModel, Observation};
use crate::sgp4::{teme_to_itrs_matrix_eop, wgs72, Eop, EARTH_ROTATION_ANGLE_RATE};
use crate::timescales::{gps_to_tt, SECONDS_PER_DAY};

type Vec3 = [f64; 3];

/// Speed of light in vacuum (m/s), exact by the SI definition.
pub const SPEED_OF_LIGHT: f64 = 299_792_458.0;

/// SGP4 reference air density `ρ0` in kg/(m²·Earth radius): `B* = ρ0·C_D·A/(2m)` (Hoots &
/// Roehrich, Spacetrack Report No. 3, 1980).
pub const SGP4_RHO0: f64 = 0.156_966_15;

/// Julian Date of the GPS time origin, 1980-01-06 00:00 GPS (IS-GPS-200).
pub const GPS_EPOCH_JD: f64 = 2_444_244.5;

/// One Doppler record: the received carrier frequency at one site and instant.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DopplerRecord {
    /// Modified Julian Date of the measurement, UTC.
    pub mjd_utc: f64,
    /// Received frequency (Hz).
    pub freq_hz: f64,
    /// Signal strength as written by the extractor (unitless; not used by the fit).
    pub flux: f64,
    /// Receiving site id (matches [`Site::id`]).
    pub site: u32,
}

/// One receiving station.
#[derive(Clone, Debug, PartialEq)]
pub struct Site {
    /// Site id.
    pub id: u32,
    /// Geodetic latitude (deg, WGS-84).
    pub lat_deg: f64,
    /// Geodetic longitude (deg, east positive).
    pub lon_deg: f64,
    /// Height above the WGS-84 ellipsoid (m).
    pub alt_m: f64,
}

impl Site {
    /// The station's Earth-fixed (ITRS) position (m).
    pub fn itrs(&self) -> Vec3 {
        geodetic_to_ecef(Geodetic {
            lat_rad: self.lat_deg.to_radians(),
            lon_rad: self.lon_deg.to_radians(),
            alt_m: self.alt_m,
        })
    }
}

fn bad_line(n: usize, what: &str) -> String {
    crate::t!("amateur-od-bad-record", line = n, what = what)
}

fn data_lines(text: &str) -> impl Iterator<Item = (usize, Vec<&str>)> {
    text.lines().enumerate().filter_map(|(i, l)| {
        let l = l.trim();
        if l.is_empty() || l.starts_with('#') {
            None
        } else {
            Some((i + 1, l.split_whitespace().collect()))
        }
    })
}

/// Parse STRF-layout Doppler records: `MJD frequency flux site` per line, whitespace separated;
/// blank lines and `#` comments are skipped.
pub fn parse_strf_doppler(text: &str) -> Result<Vec<DopplerRecord>, String> {
    let mut out = Vec::new();
    for (n, f) in data_lines(text) {
        if f.len() < 4 {
            return Err(bad_line(n, "doppler"));
        }
        let num = |k: usize| f[k].parse::<f64>().map_err(|_| bad_line(n, "doppler"));
        out.push(DopplerRecord {
            mjd_utc: num(0)?,
            freq_hz: num(1)?,
            flux: num(2)?,
            site: f[3].parse().map_err(|_| bad_line(n, "doppler"))?,
        });
    }
    Ok(out)
}

/// Parse an STRF `sites.txt` station list: `id code lat lon alt name…` per line (degrees, metres).
pub fn parse_strf_sites(text: &str) -> Result<Vec<Site>, String> {
    let mut out = Vec::new();
    for (n, f) in data_lines(text) {
        if f.len() < 5 {
            return Err(bad_line(n, "site"));
        }
        let num = |k: usize| f[k].parse::<f64>().map_err(|_| bad_line(n, "site"));
        out.push(Site {
            id: f[0].parse().map_err(|_| bad_line(n, "site"))?,
            lat_deg: num(2)?,
            lon_deg: num(3)?,
            alt_m: num(4)?,
        });
    }
    Ok(out)
}

/// The receiving site and the transmitter's nominal downlink frequency (Hz) of one SatNOGS Network
/// observation record (the JSON object of `network.satnogs.org/api/observations/<id>/`): fields
/// `ground_station`, `station_lat`, `station_lng`, `station_alt` (m) and
/// `transmitter_downlink_low` (Hz).
pub fn site_from_satnogs_observation(json: &str) -> Result<(Site, f64), String> {
    let v: serde_json::Value = serde_json::from_str(json).map_err(|e| e.to_string())?;
    let num = |k: &str| {
        v.get(k)
            .and_then(serde_json::Value::as_f64)
            .ok_or_else(|| crate::t!("amateur-od-bad-json", field = k))
    };
    let site = Site {
        id: num("ground_station")? as u32,
        lat_deg: num("station_lat")?,
        lon_deg: num("station_lng")?,
        alt_m: num("station_alt")?,
    };
    Ok((site, num("transmitter_downlink_low")?))
}

/// One on-board GPS fix: Earth-fixed position and GPS time of week.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct GpsFix {
    /// Earth-fixed (ITRS/WGS-84) position (m).
    pub pos_itrs: Vec3,
    /// GPS time of week (s).
    pub tow_s: f64,
}

/// Parse `X,Y,Z,TOW` rows (metres, seconds; comma separated). Rows whose position is all zero
/// (no fix) are dropped, as are blank lines.
pub fn parse_ecef_tow_csv(text: &str) -> Result<Vec<GpsFix>, String> {
    let mut out = Vec::new();
    for (i, l) in text.lines().enumerate() {
        let l = l.trim();
        if l.is_empty() || l.starts_with('#') {
            continue;
        }
        let f: Result<Vec<f64>, _> = l.split(',').map(|s| s.trim().parse::<f64>()).collect();
        let f = f.map_err(|_| bad_line(i + 1, "fix"))?;
        if f.len() < 4 {
            return Err(bad_line(i + 1, "fix"));
        }
        if f[0] == 0.0 && f[1] == 0.0 && f[2] == 0.0 {
            continue;
        }
        out.push(GpsFix {
            pos_itrs: [f[0], f[1], f[2]],
            tow_s: f[3],
        });
    }
    Ok(out)
}

/// TT Julian Date of a GPS week and time of week.
pub fn gps_week_tow_to_jd_tt(week: u32, tow_s: f64) -> f64 {
    gps_to_tt(GPS_EPOCH_JD + 7.0 * f64::from(week) + tow_s / SECONDS_PER_DAY)
}

/// Rotate Earth-fixed fixes into GCRS with the IERS EOP `eop` (CIO chain of [`crate::cio`]) and
/// return the TT epoch of the first fix and the [`Observation`]s relative to it, each with the
/// one-sigma `sigma` (m).
pub fn fixes_to_observations(
    fixes: &[GpsFix],
    week: u32,
    eop: &EopSeries,
    sigma: f64,
) -> Option<(f64, Vec<Observation>)> {
    let first = fixes.first()?;
    let jd0 = gps_week_tow_to_jd_tt(week, first.tow_s);
    let obs = fixes
        .iter()
        .map(|fx| {
            let jd_tt = gps_week_tow_to_jd_tt(week, fx.tow_s);
            let (ut1, xp, yp) = eop.frame_args_tt(jd_tt);
            Observation {
                t: (jd_tt - jd0) * SECONDS_PER_DAY,
                pos: itrs_to_gcrs(fx.pos_itrs, jd_tt, ut1, xp, yp),
                sigma,
            }
        })
        .collect();
    Some((jd0, obs))
}

/// A velocity seed from the first three observations (second-order forward difference over
/// their actual spacing, which must be equal for the formula to be exact).
pub fn seed_velocity(obs: &[Observation]) -> Option<Vec3> {
    if obs.len() < 3 {
        return None;
    }
    let dt = obs[1].t - obs[0].t;
    if dt <= 0.0 {
        return None;
    }
    let mut v = [0.0; 3];
    for (k, vk) in v.iter_mut().enumerate() {
        *vk = (-3.0 * obs[0].pos[k] + 4.0 * obs[1].pos[k] - obs[2].pos[k]) / (2.0 * dt);
    }
    Some(v)
}

/// The SGP4 drag term `B*` (1/Earth radii) as the ballistic term `C_D·A/m` (m²/kg):
/// `C_D·A/m = 2·B*/ρ0` with [`SGP4_RHO0`]. `B*` is a fitted SGP4 parameter that also absorbs other
/// mismodelling, so the result characterises the element set, not the object's true shape.
pub fn cd_area_over_mass_from_bstar(bstar: f64) -> f64 {
    2.0 * bstar / SGP4_RHO0
}

/// One candidate's agreement with a track of fixes.
#[derive(Clone, Debug, PartialEq)]
pub struct TleMatch {
    /// Catalogue number from line 1.
    pub norad: u32,
    /// Element epoch, UTC Julian Date.
    pub epoch_jd_utc: f64,
    /// SGP4 `B*` (1/Earth radii).
    pub bstar: f64,
    /// RMS 3-D distance between the SGP4 position and the fixes (km).
    pub rms_km: f64,
}

/// Rank the two-line element sets in `tle_text` (consecutive `1 `/`2 ` line pairs; name lines
/// are skipped) by RMS 3-D distance to `fixes`, best first. Each set is propagated with SGP4
/// (WGS-72, improved mode) and rotated TEME → ITRS with the IERS EOP at each fix. Sets that fail
/// to parse or to propagate are left out.
pub fn rank_tles(tle_text: &str, fixes: &[GpsFix], week: u32, eop: &EopSeries) -> Vec<TleMatch> {
    let lines: Vec<&str> = tle_text.lines().map(str::trim_end).collect();
    let utc_of = |tow: f64| {
        let jd_tt = gps_week_tow_to_jd_tt(week, tow);
        let jd_utc = EopSeries::jd_tt_to_jd_utc(jd_tt);
        let (ut1, xp, yp) = eop.frame_args_tt(jd_tt);
        let e = Eop {
            ut1_minus_utc_s: (ut1 - jd_utc) * SECONDS_PER_DAY,
            xp_rad: xp,
            yp_rad: yp,
        };
        (Jd2::new(jd_utc), e)
    };
    let epochs: Vec<(Jd2, Eop)> = fixes.iter().map(|f| utc_of(f.tow_s)).collect();
    let mut out = Vec::new();
    for w in lines.windows(2) {
        if !(w[0].starts_with("1 ") && w[1].starts_with("2 ")) {
            continue;
        }
        let (Ok(tle), Ok(id)) = (
            crate::tle::parse_tle(w[0], w[1]),
            crate::tle::parse_tle_identity(w[0]),
        ) else {
            continue;
        };
        let sgp = tle.to_sgp4(wgs72(), false);
        let mut sum = 0.0;
        let mut ok = true;
        for (fx, (utc, e)) in fixes.iter().zip(&epochs) {
            let Ok((r_teme, _)) = sgp.propagate_at(*utc) else {
                ok = false;
                break;
            };
            let m = teme_to_itrs_matrix_eop(*utc, e);
            let r = crate::precession::mat_vec(&m, r_teme);
            sum += (0..3)
                .map(|k| (r[k] - fx.pos_itrs[k] * 1e-3).ppowi(2))
                .sum::<f64>();
        }
        if ok && !fixes.is_empty() {
            out.push(TleMatch {
                norad: id.norad_cat_id,
                epoch_jd_utc: sgp.epoch_jd_utc(),
                bstar: tle.bstar,
                rms_km: (sum / fixes.len() as f64).sqrt(),
            });
        }
    }
    out.sort_by(|a, b| a.rms_km.total_cmp(&b.rms_km));
    out
}

/// GCRS position and velocity (m, m/s) of an Earth-fixed station at TT Julian Date `jd_tt`.
pub fn station_gcrs(r_itrs: Vec3, jd_tt: f64, eop: &EopSeries) -> (Vec3, Vec3) {
    let (ut1, xp, yp) = eop.frame_args_tt(jd_tt);
    let m = gcrs_to_itrs_matrix(jd_tt, ut1, xp, yp);
    let w = EARTH_ROTATION_ANGLE_RATE;
    let v_itrs = [-w * r_itrs[1], w * r_itrs[0], 0.0];
    let mt = crate::precession::transpose(&m);
    (
        crate::precession::mat_vec(&mt, r_itrs),
        crate::precession::mat_vec(&mt, v_itrs),
    )
}

/// One Doppler measurement prepared for the fit: time past the epoch, frequency, and the
/// station's GCRS position and velocity at that time.
#[derive(Clone, Copy, Debug)]
pub struct DopplerObs {
    /// Seconds past the fit epoch (TT).
    pub t: f64,
    /// Received frequency (Hz).
    pub freq_hz: f64,
    /// Index of the site's carrier in the estimated parameter vector (0-based over sites).
    pub site_index: usize,
    /// Station GCRS position (m).
    pub st_pos: Vec3,
    /// Station GCRS velocity (m/s).
    pub st_vel: Vec3,
}

/// Turn records into [`DopplerObs`] relative to the TT epoch `epoch_jd_tt`, sorted by time.
/// Returns the observations and the site ids in carrier-index order; a record whose site is not
/// in `sites` is an error.
pub fn prepare_doppler(
    records: &[DopplerRecord],
    sites: &[Site],
    epoch_jd_tt: f64,
    eop: &EopSeries,
) -> Result<(Vec<DopplerObs>, Vec<u32>), String> {
    let mut ids: Vec<u32> = Vec::new();
    let mut out = Vec::with_capacity(records.len());
    for r in records {
        let site = sites
            .iter()
            .find(|s| s.id == r.site)
            .ok_or_else(|| crate::t!("amateur-od-unknown-site", site = r.site))?;
        let idx = match ids.iter().position(|&i| i == r.site) {
            Some(i) => i,
            None => {
                ids.push(r.site);
                ids.len() - 1
            }
        };
        let jd_tt = crate::timescales::utc_to_tt(r.mjd_utc + crate::timescales::MJD_OFFSET);
        let (p, v) = station_gcrs(site.itrs(), jd_tt, eop);
        out.push(DopplerObs {
            t: (jd_tt - epoch_jd_tt) * SECONDS_PER_DAY,
            freq_hz: r.freq_hz,
            site_index: idx,
            st_pos: p,
            st_vel: v,
        });
    }
    out.sort_by(|a, b| a.t.total_cmp(&b.t));
    Ok((out, ids))
}

/// Range rate (m/s) and its partials with respect to the satellite position and velocity.
fn range_rate_partials(r: Vec3, v: Vec3, sp: Vec3, sv: Vec3) -> (f64, Vec3, Vec3) {
    let d = [r[0] - sp[0], r[1] - sp[1], r[2] - sp[2]];
    let dv = [v[0] - sv[0], v[1] - sv[1], v[2] - sv[2]];
    let rho = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
    let u = [d[0] / rho, d[1] / rho, d[2] / rho];
    let rr = u[0] * dv[0] + u[1] * dv[1] + u[2] * dv[2];
    let dr = [
        (dv[0] - rr * u[0]) / rho,
        (dv[1] - rr * u[1]) / rho,
        (dv[2] - rr * u[2]) / rho,
    ];
    (rr, dr, u)
}

/// Predicted frequencies and the analytic Jacobian for the parameter vector
/// `x = [r0, v0, f_site…]`. `None` on a degenerate geometry.
pub fn doppler_model<F: ForceModel>(
    fm: &F,
    obs: &[DopplerObs],
    x: &[f64],
    tol: &Tolerance,
) -> Option<(Vec<f64>, Vec<Vec<f64>>)> {
    let n = x.len();
    let times: Vec<f64> = obs.iter().map(|o| o.t).collect();
    if times.iter().any(|&t| t < 0.0) {
        return None;
    }
    let samples =
        propagate_with_stm_samples(fm, [x[0], x[1], x[2]], [x[3], x[4], x[5]], &times, tol);
    let mut h = Vec::with_capacity(obs.len());
    let mut jac = Vec::with_capacity(obs.len());
    for (o, (s, phi)) in obs.iter().zip(&samples) {
        let f0 = *x.get(6 + o.site_index)?;
        let (rr, dr, dv) =
            range_rate_partials([s[0], s[1], s[2]], [s[3], s[4], s[5]], o.st_pos, o.st_vel);
        if !rr.is_finite() {
            return None;
        }
        h.push(f0 * (1.0 - rr / SPEED_OF_LIGHT));
        let mut row = vec![0.0; n];
        let g = -f0 / SPEED_OF_LIGHT;
        for (j, rj) in row.iter_mut().enumerate().take(6) {
            let mut s = 0.0;
            for k in 0..3 {
                s += dr[k] * phi[k][j] + dv[k] * phi[k + 3][j];
            }
            *rj = g * s;
        }
        row[6 + o.site_index] = 1.0 - rr / SPEED_OF_LIGHT;
        jac.push(row);
    }
    Some((h, jac))
}

/// The result of a Doppler fit.
#[derive(Clone, Debug)]
pub struct DopplerFit {
    /// Epoch GCRS position (m).
    pub r0: Vec3,
    /// Epoch GCRS velocity (m/s).
    pub v0: Vec3,
    /// Estimated carrier frequency per site (Hz), in the site order of [`prepare_doppler`].
    pub carrier_hz: Vec<f64>,
    /// Post-fit frequency residual RMS (Hz).
    pub rms_hz: f64,
    /// Gauss–Newton iterations run.
    pub iterations: usize,
    /// Whether the step norm fell below tolerance.
    pub converged: bool,
}

/// Fit the epoch state and per-site carriers to Doppler `obs` from the a-priori `x0 = [r0, v0,
/// f_site…]` with measurement one-sigma `sigma_hz`. `None` when the solve fails.
pub fn fit_doppler<F: ForceModel>(
    fm: &F,
    obs: &[DopplerObs],
    x0: &[f64],
    sigma_hz: f64,
    max_iter: usize,
    tol: &Tolerance,
) -> Option<DopplerFit> {
    let z: Vec<f64> = obs.iter().map(|o| o.freq_hz).collect();
    let w = vec![1.0 / (sigma_hz * sigma_hz); z.len()];
    let (res, _cov) = gauss_newton_analytic(
        |x| doppler_model(fm, obs, x, tol),
        &z,
        &w,
        x0,
        max_iter,
        1e-4,
    )?;
    let x = res.x;
    let (h, _) = doppler_model(fm, obs, &x, tol)?;
    let rms =
        (z.iter().zip(&h).map(|(a, b)| (a - b).ppowi(2)).sum::<f64>() / z.len() as f64).sqrt();
    Some(DopplerFit {
        r0: [x[0], x[1], x[2]],
        v0: [x[3], x[4], x[5]],
        carrier_hz: x[6..].to_vec(),
        rms_hz: rms,
        iterations: res.iterations,
        converged: res.converged,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn strf_records_and_sites_parse() {
        let d = "# comment\n59000.5 437000123.5 12.0 7\n\n59000.5001 437000100.0 11.0 7\n";
        let r = parse_strf_doppler(d).unwrap();
        assert_eq!(r.len(), 2);
        assert_eq!(r[0].site, 7);
        assert_eq!(r[1].freq_hz, 437_000_100.0);
        assert!(parse_strf_doppler("59000.5 x 1 2").is_err());
        let s = parse_strf_sites("7 AB 52.0 6.0 10 Some Observer\n").unwrap();
        assert_eq!(s[0].id, 7);
        assert_eq!(s[0].alt_m, 10.0);
    }

    #[test]
    fn satnogs_record_fields() {
        let j = r#"{"ground_station": 1378, "station_lat": 40.5, "station_lng": -3.7,
                    "station_alt": 700, "transmitter_downlink_low": 435400000}"#;
        let (s, f) = site_from_satnogs_observation(j).unwrap();
        assert_eq!(s.id, 1378);
        assert_eq!(f, 435_400_000.0);
        assert!(site_from_satnogs_observation(r#"{"station_lat": 1}"#).is_err());
    }

    #[test]
    fn gps_csv_drops_no_fix_rows() {
        let c = "0,0,0,0\n0,0,0,137107.61\n2944845,-128132,6249649,137167.64\n";
        let f = parse_ecef_tow_csv(c).unwrap();
        assert_eq!(f.len(), 1);
        assert_eq!(f[0].tow_s, 137_167.64);
    }

    #[test]
    fn gps_week_2063_starts_2019_07_21() {
        // 2019-07-21 00:00 GPS = JD 2458685.5 (GPS); TT = GPS + 51.184 s.
        let jd = gps_week_tow_to_jd_tt(2063, 0.0);
        assert!((jd - (2_458_685.5 + 51.184 / 86_400.0)).abs() < 1e-9);
    }

    #[test]
    fn bstar_to_ballistic_term() {
        // B* = rho0 * (Cd A/m) / 2  =>  Cd A/m = 2 B* / rho0. B* = rho0 / 2 gives exactly 1 m²/kg.
        assert!((cd_area_over_mass_from_bstar(SGP4_RHO0 / 2.0) - 1.0).abs() < 1e-15);
    }

    #[test]
    fn range_rate_partials_match_finite_difference() {
        let (r, v) = ([7.0e6, 1.0e5, 2.0e5], [10.0, 7.5e3, 100.0]);
        let (sp, sv) = ([6.37e6, 0.0, 0.0], [0.0, 465.0, 0.0]);
        let (rr, dr, dv) = range_rate_partials(r, v, sp, sv);
        for k in 0..3 {
            let mut r2 = r;
            r2[k] += 1.0;
            let mut v2 = v;
            v2[k] += 1e-3;
            let (a, _, _) = range_rate_partials(r2, v, sp, sv);
            let (b, _, _) = range_rate_partials(r, v2, sp, sv);
            assert!(((a - rr) - dr[k]).abs() < 1e-6);
            assert!(((b - rr) / 1e-3 - dv[k]).abs() < 1e-9);
        }
    }
}
