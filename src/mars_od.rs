// SPDX-License-Identifier: AGPL-3.0-only
//! Mars orbit determination from real DSN tracking: ramped 2-way X-band Doppler from a TRK-2-18
//! Orbit Data File ([`crate::odf`]), fitted with a Mars-orbiter force model (CAP-30, stage 2).
//!
//! The pieces, each written for the precision a 2-way Doppler count needs (the predicted count
//! is a difference of phases of order 10¹¹ cycles, so a 10⁻¹¹ s error in a time difference is
//! already a few mHz):
//!
//! * **Time.** ODF time tags are UTC seconds since 1950 at the receiving station. They are held
//!   as (whole, fraction) and converted to TDB seconds past J2000 as a two-part [`Et`].
//! * **Station.** DSN coordinates (DSN 810-005 module 301, ITRF93, with plate velocities) are
//!   rotated to the GCRS with the IAU 2006/2000A CIO chain ([`crate::cio`]) and IERS EOP
//!   ([`crate::eop`]). The Earth rotation angle is formed here from the two-part UTC time, not
//!   from a one-part Julian date, whose 40 µs resolution would move a station by 2 cm.
//! * **Light time.** The round trip ending at a receive time, iterated in the barycentric
//!   frame, with the Sun's Shapiro delay and a tropospheric delay on each leg. The observer and
//!   spacecraft positions come from a JPL ephemeris ([`crate::naif_kernel`]) and a spacecraft
//!   [`Trajectory`] relative to the Mars barycentre.
//! * **Ramped Doppler.** The uplink frequency `f_T(t)` follows the station's ramp table. With the
//!   X-up/X-down turnaround ratio `M2 = 880/749`, the cycles received over a receive interval
//!   `[t3s, t3e]` of length `Tc` are `M2·∫_{t1s}^{t1e} f_T dt`, `t1 = t3 − τ` (Moyer 2000,
//!   ch. 13), and the ODF observable is the constant reference `M2·f_ref` (the record's
//!   reference frequency) minus the mean received frequency:
//!   `F = M2·f_ref − (M2/Tc)·[∫_{t3s}^{t3e} f_T dt − (∫_{t3e−τe}^{t3e} f_T dt − ∫_{t3s−τs}^{t3s} f_T dt)]`.
//!   That convention was settled on the development pass of the CAP-30 pre-registration: with
//!   the reference taken as the ramp at the receive time instead, the residual against the
//!   reconstruction is exactly `M2·(f_ref − f_T(t3))`, hundreds of kHz. Each integral is split
//!   as `f_c·τ + ∫(f_T − f_c)` about a constant `f_c` so the large term carries only the
//!   precision of `τ`.
//! * **Dynamics.** Mars-barycentred J2000 integration (fixed-step RK4 with cubic Hermite dense
//!   output) under a spherical-harmonic Mars field in the IAU Mars body-fixed frame
//!   ([`crate::mars_frame`]), Sun, Earth-Moon and Jupiter point masses, a Sun-line
//!   solar-pressure term with a cylindrical Mars shadow, and drag on the [`crate::mars_atmos`]
//!   density relative to the atmosphere co-rotating about the Mars pole.
//! * **Estimation.** Gauss-Newton batch least squares on the initial state, an SRP coefficient
//!   and a drag scale, with finite-difference partials and a median-absolute-deviation outlier
//!   rule.
//!
//! The antenna phase centre is placed a fixed distance along the Mars-to-spacecraft direction
//! from the trajectory point (MRO flies nadir-pointed with its high-gain antenna on the zenith
//! side; its offset produces an orbit-periodic Doppler signature).
//!
//! Not modelled: ionosphere, solar plasma, the rest of the antenna offset, momentum-desaturation
//! manoeuvres, Mars nutation, and the small BCRS/GCRS scale and Lorentz terms of the station
//! position. The Mars field is centred on the Mars barycentre (DE440s has no Mars-centre
//! segment; the two differ by decimetres).

// Index loops read more plainly than iterator chains for 3-vectors and small matrices.
#![allow(clippy::needless_range_loop)]

use crate::eop::EopSeries;
use crate::gravity_sh::SphericalHarmonicField;
use crate::naif_kernel::SpkKernel;
use crate::odf::{seconds_1950, Odf, OdfRamp};
use crate::precession::{matmul, rz, transpose, Mat3, Vec3};
use std::collections::BTreeMap;
use std::sync::Mutex;

/// Speed of light (m/s).
pub const C_LIGHT: f64 = 299_792_458.0;
/// X-band uplink to X-band downlink turnaround ratio.
pub const M2_X_X: f64 = 880.0 / 749.0;
/// DE440 GM of the Sun (m³/s²).
pub const GM_SUN: f64 = 1.327_124_400_412_794e20;
/// DE440 GM of the Earth-Moon barycentre (m³/s²).
pub const GM_EMB: f64 = 4.035_032_355_022_598e14;
/// DE440 GM of the Jupiter system (m³/s²).
pub const GM_JUPITER: f64 = 1.267_127_641e17;
/// Solar radiation pressure at 1 au (N/m²).
pub const SRP_P0_1AU: f64 = 4.56e-6;
/// The astronomical unit (m).
pub const AU_M: f64 = 1.495_978_707e11;
/// Mars mean equatorial radius used for the shadow test (m).
pub const MARS_SHADOW_RADIUS_M: f64 = 3_396_200.0;

/// Julian date of 1950-01-01T00:00 (the ODF time origin).
const JD_1950: f64 = 2_433_282.5;

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn mv(m: &Mat3, v: Vec3) -> Vec3 {
    crate::precession::mat_vec(m, v)
}

/// A UTC instant as seconds since 1950-01-01T00:00:00 UTC, split into a whole and a fractional
/// part so differences keep sub-picosecond precision.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Utc1950 {
    /// Whole seconds.
    pub whole: f64,
    /// Fraction of a second (may lie outside [0, 1) after arithmetic).
    pub frac: f64,
}

impl Utc1950 {
    /// From a one-part value (an ODF time tag: whole seconds plus milliseconds).
    pub fn from_f64(t: f64) -> Self {
        let whole = t.floor();
        Self {
            whole,
            frac: ((t - whole) * 1e3).round() / 1e3,
        }
    }

    /// Shifted by `ds` seconds.
    pub fn plus(self, ds: f64) -> Self {
        Self {
            whole: self.whole,
            frac: self.frac + ds,
        }
    }

    /// `self − other` in seconds.
    pub fn diff(self, other: Self) -> f64 {
        (self.whole - other.whole) + (self.frac - other.frac)
    }

    /// One-part value (resolution about 0.2 µs; for table look-ups only).
    pub fn to_f64(self) -> f64 {
        self.whole + self.frac
    }

    /// UTC Julian date (one part).
    pub fn jd(self) -> f64 {
        JD_1950 + self.to_f64() / 86_400.0
    }
}

/// TDB seconds past J2000 in two parts (`hi + lo`), as the SPK reader takes them.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Et {
    /// Large part.
    pub hi: f64,
    /// Small part.
    pub lo: f64,
}

impl Et {
    /// Shifted by `ds` seconds.
    pub fn plus(self, ds: f64) -> Self {
        Self {
            hi: self.hi,
            lo: self.lo + ds,
        }
    }
    /// One-part value.
    pub fn total(self) -> f64 {
        self.hi + self.lo
    }
}

/// TDB seconds past J2000 of a UTC instant (leap seconds from [`crate::timescales`], TDB−TT from
/// its two-term series).
pub fn et_of_utc(t: Utc1950) -> Et {
    let jd_utc = t.jd();
    let leap = crate::timescales::tai_minus_utc(jd_utc);
    let jd_tt = jd_utc + (leap + 32.184) / 86_400.0;
    let dtdb = crate::timescales::tdb_minus_tt(jd_tt);
    let s_j2000 = seconds_1950(2000, 1, 12, 0, 0.0);
    Et {
        hi: t.whole - s_j2000 + leap,
        lo: t.frac + 32.184 + dtdb,
    }
}

/// One DSN station: ITRF93 position at epoch 2003.0 and its plate velocity.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DsnStation {
    /// DSS number.
    pub id: u16,
    /// Position at 2003-01-01T00:00 (m).
    pub xyz_m: Vec3,
    /// Velocity (m/yr).
    pub vel_m_per_yr: Vec3,
}

impl DsnStation {
    /// ITRF position (m) at a UTC Julian date.
    pub fn itrf_at(&self, jd: f64) -> Vec3 {
        let years = (jd - 2_452_640.5) / 365.25;
        add(self.xyz_m, scale(self.vel_m_per_yr, years))
    }
}

/// Parse the DSN station block of a NAIF station-kernel comment file (`DSS-nn_XYZ` in km and
/// `DSS-nn_DXYZ` in m/yr, `DSS-nn_EPOCH` = 2003-JAN-01). Stations whose epoch is not
/// 2003-JAN-01 are rejected.
pub fn parse_dsn_stations(text: &str) -> Result<BTreeMap<u16, DsnStation>, String> {
    let mut xyz: BTreeMap<u16, Vec3> = BTreeMap::new();
    let mut dxyz: BTreeMap<u16, Vec3> = BTreeMap::new();
    for line in text.lines() {
        let l = line.trim();
        let Some(rest) = l.strip_prefix("DSS-") else {
            continue;
        };
        let Some((key, val)) = rest.split_once('=') else {
            continue;
        };
        let key = key.trim();
        let Some((num, field)) = key.split_once('_') else {
            continue;
        };
        let Ok(id) = num.parse::<u16>() else {
            continue;
        };
        let nums = || -> Result<Vec3, String> {
            let v: Vec<f64> = val
                .trim()
                .trim_start_matches('(')
                .trim_end_matches(')')
                .split_whitespace()
                .map(|x| {
                    x.parse::<f64>()
                        .map_err(|e| format!("DSS-{id} {field}: {e}"))
                })
                .collect::<Result<_, _>>()?;
            if v.len() != 3 {
                return Err(format!("DSS-{id} {field}: expected 3 values"));
            }
            Ok([v[0] * 1e3, v[1] * 1e3, v[2] * 1e3])
        };
        match field {
            "XYZ" => {
                xyz.insert(id, nums()?);
            }
            "DXYZ" => {
                // The plate-motion block is in m/yr (the kernel's "Velocity data" table).
                dxyz.insert(id, nums()?.map(|x| x * 1e-3));
            }
            "EPOCH" if !val.contains("2003-JAN-01/00:00") => {
                return Err(format!("DSS-{id} epoch is not 2003-JAN-01: {}", val.trim()));
            }
            _ => {}
        }
    }
    let mut out = BTreeMap::new();
    for (id, p) in xyz {
        let v = *dxyz
            .get(&id)
            .ok_or_else(|| format!("DSS-{id} has no DXYZ"))?;
        out.insert(
            id,
            DsnStation {
                id,
                xyz_m: p,
                vel_m_per_yr: v,
            },
        );
    }
    Ok(out)
}

/// The Earth's orientation: ITRS→GCRS for station positions.
pub struct EarthFrame {
    eop: EopSeries,
    /// CIP X, Y and CIO locator s at a 600 s grid (keyed by grid index), linearly interpolated.
    xys_cache: Mutex<BTreeMap<i64, (f64, f64, f64)>>,
}

const XYS_GRID_S: f64 = 600.0;

impl EarthFrame {
    /// From IERS EOP.
    pub fn new(eop: EopSeries) -> Self {
        Self {
            eop,
            xys_cache: Mutex::new(BTreeMap::new()),
        }
    }

    fn xys_node(&self, k: i64) -> (f64, f64, f64) {
        let mut c = self.xys_cache.lock().expect("xys cache");
        *c.entry(k).or_insert_with(|| {
            let t = Utc1950 {
                whole: k as f64 * XYS_GRID_S,
                frac: 0.0,
            };
            let jd_utc = t.jd();
            let jd_tt = jd_utc + (crate::timescales::tai_minus_utc(jd_utc) + 32.184) / 86_400.0;
            crate::cio::xys_2006a(jd_tt)
        })
    }

    /// GCRS→ITRS rotation at a UTC instant.
    pub fn gcrs_to_itrs(&self, t: Utc1950) -> Mat3 {
        let k = (t.to_f64() / XYS_GRID_S).floor() as i64;
        let u = (t.to_f64() - k as f64 * XYS_GRID_S) / XYS_GRID_S;
        let (x0, y0, s0) = self.xys_node(k);
        let (x1, y1, s1) = self.xys_node(k + 1);
        let c = crate::cio::celestial_to_intermediate(
            x0 + u * (x1 - x0),
            y0 + u * (y1 - y0),
            s0 + u * (s1 - s0),
        );
        let jd_utc = t.jd();
        let mjd_utc = jd_utc - 2_400_000.5;
        let (dut1, xp_as, yp_as) = self.eop.interp_utc_mjd(mjd_utc);
        let jd_tt = jd_utc + (crate::timescales::tai_minus_utc(jd_utc) + 32.184) / 86_400.0;
        let as2r = std::f64::consts::PI / (180.0 * 3600.0);
        let w = crate::frames::polar_motion_matrix(xp_as * as2r, yp_as * as2r, jd_tt);
        // Earth rotation angle from the two-part time: Tu = UT1 days past J2000.0.
        let s_j2000 = seconds_1950(2000, 1, 12, 0, 0.0);
        let secs = (t.whole - s_j2000) + (t.frac + dut1);
        let days = (secs / 86_400.0).floor();
        let f = (secs - days * 86_400.0) / 86_400.0;
        let turns = 0.779_057_273_264_0 + f + 0.002_737_811_911_354_48 * (days + f);
        let era = std::f64::consts::TAU * (turns - turns.floor());
        matmul(&w, &matmul(&rz(era), &c))
    }

    /// Station position in the GCRS (m) and the GCRS→ITRS matrix used.
    pub fn station_gcrs(&self, st: &DsnStation, t: Utc1950) -> (Vec3, Mat3) {
        let m = self.gcrs_to_itrs(t);
        (mv(&transpose(&m), st.itrf_at(t.jd())), m)
    }
}

/// Planetary ephemeris access (DE440s).
pub struct Ephemeris {
    de: SpkKernel,
}

impl Ephemeris {
    /// Wrap an opened DE kernel.
    pub fn new(de: SpkKernel) -> Self {
        Self { de }
    }

    /// Position and velocity (m, m/s, J2000) of `target` relative to `observer` at `et`.
    pub fn pos_vel(&self, target: i32, observer: i32, et: Et) -> Result<(Vec3, Vec3), String> {
        let s = self.de.state(target, observer, et.hi, et.lo)?;
        Ok((s[0], s[1]))
    }

    /// Position (m, J2000) of `target` relative to `observer` at `et`.
    pub fn pos(&self, target: i32, observer: i32, et: Et) -> Result<Vec3, String> {
        Ok(self.de.state(target, observer, et.hi, et.lo)?[0])
    }
}

/// A spacecraft trajectory relative to the Mars barycentre (m, J2000).
pub trait Trajectory {
    /// Position at `et`.
    fn pos(&self, et: Et) -> Result<Vec3, String>;
}

/// A trajectory read from an SPK.
pub struct SpkTrajectory<'a> {
    /// The kernel.
    pub kernel: &'a SpkKernel,
    /// NAIF id of the spacecraft (MRO: −74).
    pub id: i32,
}

impl Trajectory for SpkTrajectory<'_> {
    fn pos(&self, et: Et) -> Result<Vec3, String> {
        Ok(self.kernel.state(self.id, 4, et.hi, et.lo)?[0])
    }
}

/// A ramp table for one station, sorted by start time.
#[derive(Clone, Debug)]
pub struct RampTable {
    segs: Vec<OdfRamp>,
    /// Reference frequency subtracted inside the integrals (Hz).
    pub f_ref: f64,
}

impl RampTable {
    /// The ramps of `station` in `odf`.
    pub fn for_station(odf: &Odf, station: u16) -> Self {
        let mut segs: Vec<OdfRamp> = odf
            .ramps
            .iter()
            .filter(|r| r.station == station && r.end_s > r.start_s)
            .copied()
            .collect();
        segs.sort_by(|a, b| a.start_s.total_cmp(&b.start_s));
        let f_ref = segs.first().map_or(0.0, |r| r.start_frequency_hz.round());
        Self { segs, f_ref }
    }

    /// `∫ (f_T − f_ref) dt` over `[origin + a, origin + b]` (seconds relative to `origin`), or
    /// `None` when the interval is not covered by ramps.
    pub fn integral_minus_ref(&self, origin: Utc1950, a: f64, b: f64) -> Option<f64> {
        let o = origin.whole;
        let mut covered = 0.0;
        let mut sum = 0.0;
        for r in &self.segs {
            let s0 = (r.start_s - o) - origin.frac;
            let s1 = (r.end_s - o) - origin.frac;
            if s1 <= a || s0 >= b {
                continue;
            }
            let lo = a.max(s0);
            let hi = b.min(s1);
            let len = hi - lo;
            let mid = 0.5 * (lo + hi);
            sum += len * (r.start_frequency_hz - self.f_ref + r.rate_hz_s * (mid - s0));
            covered += len;
        }
        // The pieces must tile the interval (ramp tables are contiguous).
        if (covered - (b - a)).abs() > 1e-6 {
            return None;
        }
        Some(sum)
    }

    /// Uplink frequency at a time.
    pub fn freq_at(&self, t: Utc1950) -> Option<f64> {
        let x = t.to_f64();
        self.segs
            .iter()
            .find(|r| x >= r.start_s && x < r.end_s)
            .map(|r| r.start_frequency_hz + r.rate_hz_s * (x - r.start_s))
    }
}

/// A compressed 2-way Doppler point: consecutive 1-s counts averaged into one count.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DopplerPoint {
    /// DSS number (transmitter and receiver).
    pub station: u16,
    /// Start of the receive interval.
    pub t3s: Utc1950,
    /// Count time (s).
    pub tc: f64,
    /// Observed Doppler (Hz), the mean of the 1-s observables.
    pub observed_hz: f64,
    /// The records' reference frequency (Hz; equal across the block).
    pub reference_hz: f64,
}

/// Compress the valid 2-way X-up/X-down Doppler (data type 12, transmitter = receiver, 1-s
/// counts) received in `[from, to)` into points of `n` consecutive 1-s counts. Incomplete
/// blocks are dropped.
pub fn compress_two_way(odf: &Odf, from: Utc1950, to: Utc1950, n: usize) -> Vec<DopplerPoint> {
    let mut obs: Vec<_> = odf
        .observations
        .iter()
        .filter(|o| {
            o.data_type == 12
                && o.tx_station == o.rx_station
                && o.uplink_band == 2
                && o.downlink_band == 2
                && !o.invalid
                && (o.compression_time_s - 1.0).abs() < 1e-9
        })
        .filter(|o| {
            let t = Utc1950::from_f64(o.time_s);
            t.diff(from) >= 0.0 && t.diff(to) < 0.0
        })
        .collect();
    obs.sort_by(|a, b| a.time_s.total_cmp(&b.time_s));
    let mut out = Vec::new();
    let mut i = 0;
    while i + n <= obs.len() {
        let first = obs[i];
        let ok = (1..n).all(|k| {
            let o = obs[i + k];
            o.rx_station == first.rx_station
                && o.reference_frequency_hz == first.reference_frequency_hz
                && (o.time_s - first.time_s - k as f64).abs() < 1e-3
        });
        if !ok {
            i += 1;
            continue;
        }
        let mean = obs[i..i + n].iter().map(|o| o.observable).sum::<f64>() / n as f64;
        out.push(DopplerPoint {
            station: first.rx_station as u16,
            t3s: Utc1950::from_f64(first.time_s).plus(-0.5),
            tc: n as f64,
            observed_hz: mean,
            reference_hz: first.reference_frequency_hz,
        });
        i += n;
    }
    out
}

/// The measurement model: stations, Earth orientation, ephemeris and ramps.
pub struct DopplerModel {
    /// DSN stations.
    pub stations: BTreeMap<u16, DsnStation>,
    /// Earth orientation.
    pub earth: EarthFrame,
    /// Planetary ephemeris.
    pub eph: Ephemeris,
    /// Ramp tables by station.
    pub ramps: BTreeMap<u16, RampTable>,
    /// Apply the troposphere model.
    pub troposphere: bool,
    /// Radial offset of the antenna phase centre from the trajectory point (m, along the
    /// Mars-to-spacecraft direction).
    pub antenna_radial_offset_m: f64,
}

/// One leg's geometry at the receive end.
#[derive(Clone, Copy, Debug)]
pub struct RoundTrip {
    /// Round-trip light time in station time, `t3 − t1` (UTC seconds).
    pub tau_s: f64,
    /// Elevation at reception (rad).
    pub elevation_rad: f64,
}

impl DopplerModel {
    fn elevation_and_tropo(
        &self,
        st: &DsnStation,
        m: &Mat3,
        los_gcrs: Vec3,
        doy: f64,
    ) -> (f64, f64) {
        let r = st.xyz_m;
        let g = crate::frames::ecef_to_geodetic(r);
        let up = [
            g.lat_rad.cos() * g.lon_rad.cos(),
            g.lat_rad.cos() * g.lon_rad.sin(),
            g.lat_rad.sin(),
        ];
        let l = mv(m, los_gcrs);
        let el = (dot(up, l) / norm(l)).clamp(-1.0, 1.0).asin();
        let tropo = if self.troposphere && el > 0.02 {
            crate::radiometric::tropo_delay(g.lat_rad, g.alt_m, el, doy)
        } else {
            0.0
        };
        (el, tropo)
    }

    /// The round-trip light time ending at receive time `t3` at station `st`.
    pub fn round_trip(
        &self,
        traj: &dyn Trajectory,
        st: &DsnStation,
        t3: Utc1950,
    ) -> Result<RoundTrip, String> {
        // TDB at the station: the geocentric TDB−TT series plus the topocentric term
        // v⊕·r_stn/c² (up to 2 µs, diurnal; its rate is worth tens of mHz of Doppler).
        let et3g = et_of_utc(t3);
        let doy = ((t3.to_f64() / 86_400.0) % 365.25).floor();
        let (earth3, vearth3) = self.eph.pos_vel(399, 0, et3g)?;
        let (stn3, m3) = self.earth.station_gcrs(st, t3);
        let topo3 = dot(vearth3, stn3) / (C_LIGHT * C_LIGHT);
        let et3 = et3g.plus(topo3);
        let r3 = add(earth3, stn3);
        let sun3 = self.eph.pos(10, 0, et3)?;
        // Downlink.
        let mut tau_d = 0.0;
        let mut r2 = [0.0; 3];
        let mut el3 = 0.0;
        for _ in 0..10 {
            let et2 = et3.plus(-tau_d);
            let p = traj.pos(et2)?;
            let p = add(p, scale(p, self.antenna_radial_offset_m / norm(p)));
            r2 = add(self.eph.pos(4, 0, et2)?, p);
            let los = sub(r2, r3);
            let (el, tropo) = self.elevation_and_tropo(st, &m3, los, doy);
            el3 = el;
            let sh = crate::radiometric::shapiro_delay(sub(r2, sun3), sub(r3, sun3), GM_SUN);
            let next = norm(los) / C_LIGHT + sh + tropo / C_LIGHT;
            let done = (next - tau_d).abs() < 1e-14;
            tau_d = next;
            if done {
                break;
            }
        }
        // Uplink.
        let et2 = et3.plus(-tau_d);
        let mut tau_u = tau_d;
        let mut topo1 = topo3;
        for _ in 0..10 {
            let t1 = t3.plus(-(tau_d + tau_u));
            let et1 = et2.plus(-tau_u);
            let (earth1, vearth1) = self.eph.pos_vel(399, 0, et1)?;
            let (stn1, m1) = self.earth.station_gcrs(st, t1);
            topo1 = dot(vearth1, stn1) / (C_LIGHT * C_LIGHT);
            let r1 = add(earth1, stn1);
            let (_, tropo) = self.elevation_and_tropo(st, &m1, sub(r2, r1), doy);
            let sun1 = self.eph.pos(10, 0, et1)?;
            let sh = crate::radiometric::shapiro_delay(sub(r2, sun1), sub(r1, sun1), GM_SUN);
            let next = norm(sub(r2, r1)) / C_LIGHT + sh + tropo / C_LIGHT;
            let done = (next - tau_u).abs() < 1e-14;
            tau_u = next;
            if done {
                break;
            }
        }
        // The round trip in station (UTC) seconds: the TDB interval less the change of
        // TDB−UTC across it (the leap-second count is constant here).
        let jd3 = t3.jd() + (crate::timescales::tai_minus_utc(t3.jd()) + 32.184) / 86_400.0;
        let jd1 = jd3 - (tau_d + tau_u) / 86_400.0;
        let d_geo = crate::timescales::tdb_minus_tt(jd3) - crate::timescales::tdb_minus_tt(jd1);
        Ok(RoundTrip {
            tau_s: tau_d + tau_u - d_geo - (topo3 - topo1),
            elevation_rad: el3,
        })
    }

    /// Predicted Doppler (Hz) for a point and the reception elevation at its midpoint (rad).
    pub fn predict(&self, traj: &dyn Trajectory, p: &DopplerPoint) -> Result<(f64, f64), String> {
        let st = self
            .stations
            .get(&p.station)
            .ok_or_else(|| format!("no coordinates for DSS {}", p.station))?;
        let ramps = self
            .ramps
            .get(&p.station)
            .ok_or_else(|| format!("no ramps for DSS {}", p.station))?;
        let t3e = p.t3s.plus(p.tc);
        let rs = self.round_trip(traj, st, p.t3s)?;
        let re = self.round_trip(traj, st, t3e)?;
        let js = ramps
            .integral_minus_ref(p.t3s, -rs.tau_s, 0.0)
            .ok_or("ramp table does not cover the interval")?;
        let je = ramps
            .integral_minus_ref(p.t3s, p.tc - re.tau_s, p.tc)
            .ok_or("ramp table does not cover the interval")?;
        let jw = ramps
            .integral_minus_ref(p.t3s, 0.0, p.tc)
            .ok_or("ramp table does not cover the interval")?;
        // Cycles transmitted between t1s and t1e, less f_c·Tc:
        // ∫_{t3s}^{t3e} f_T − (∫_{t3e−τe}^{t3e} f_T − ∫_{t3s−τs}^{t3s} f_T), each about f_c.
        let sent = jw - (ramps.f_ref * (re.tau_s - rs.tau_s) + (je - js));
        let f = M2_X_X * (p.reference_hz - ramps.f_ref) - M2_X_X * sent / p.tc;
        let el = 0.5 * (rs.elevation_rad + re.elevation_rad);
        Ok((f, el))
    }
}

/// The force model of the Mars orbiter.
pub struct MarsDynamics<'a> {
    /// Mars gravity field (body-fixed).
    pub field: SphericalHarmonicField,
    /// Mars orientation.
    pub mars: crate::body::Body,
    /// Planetary ephemeris.
    pub eph: &'a Ephemeris,
    /// Nominal `C_D·A/m` (m²/kg).
    pub cd_area_over_mass: f64,
}

/// Estimated non-state parameters.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ForceParams {
    /// SRP coefficient `C_R·A/m` (m²/kg).
    pub srp_cr_a_over_m: f64,
    /// Drag scale factor.
    pub drag_scale: f64,
}

impl MarsDynamics<'_> {
    /// Acceleration (m/s², J2000) at TDB `et` for position `r` and velocity `v` relative to the
    /// Mars barycentre.
    pub fn accel(&self, et: f64, r: Vec3, v: Vec3, fp: &ForceParams) -> Result<Vec3, String> {
        let jd_tdb = 2_451_545.0 + et / 86_400.0;
        let rot = crate::mars_frame::iau_mars_rotation(&self.mars, jd_tdb);
        let a_bf = self.field.acceleration(mv(&rot, r));
        let mut a = mv(&transpose(&rot), a_bf);
        let e = Et { hi: et, lo: 0.0 };
        let mut sun = [0.0; 3];
        for (body, gm) in [(10, GM_SUN), (3, GM_EMB), (5, GM_JUPITER)] {
            let d = self.eph.pos(body, 4, e)?;
            if body == 10 {
                sun = d;
            }
            let rel = sub(d, r);
            let k1 = gm / norm(rel).powi(3);
            let k2 = gm / norm(d).powi(3);
            a = add(a, sub(scale(rel, k1), scale(d, k2)));
        }
        // Solar radiation pressure, Sun-line, with a cylindrical Mars shadow.
        let u = scale(sun, 1.0 / norm(sun));
        let along = dot(r, u);
        let lit = along > 0.0 || norm(sub(r, scale(u, along))) > MARS_SHADOW_RADIUS_M;
        if lit {
            let s = sub(r, sun); // Sun → spacecraft
            let d = norm(s);
            let p = SRP_P0_1AU * (AU_M / d).powi(2) * fp.srp_cr_a_over_m;
            a = add(a, scale(s, p / d));
        }
        // Drag relative to the atmosphere co-rotating about the Mars pole.
        let pole = [rot[2][0], rot[2][1], rot[2][2]];
        let v_rel = sub(v, scale(cross(pole, r), self.mars.rotation_rate));
        let rho = crate::mars_atmos::mars_density(norm(r) - crate::mars_atmos::MARS_RE);
        let k = -0.5 * rho * self.cd_area_over_mass * fp.drag_scale * norm(v_rel);
        Ok(add(a, scale(v_rel, k)))
    }
}

/// A numerically integrated trajectory with cubic Hermite dense output.
#[derive(Clone, Debug)]
pub struct DenseTrajectory {
    t0: f64,
    h: f64,
    states: Vec<[f64; 6]>,
}

impl DenseTrajectory {
    /// Integrate from state `y0` at TDB `t0` over `[t_begin, t_end]` (which must contain `t0`)
    /// with fixed-step RK4 of step `h`.
    pub fn integrate(
        dynamics: &MarsDynamics,
        fp: &ForceParams,
        y0: [f64; 6],
        t0: f64,
        t_begin: f64,
        t_end: f64,
        h: f64,
    ) -> Result<Self, String> {
        let f = |t: f64, y: &[f64; 6]| -> Result<[f64; 6], String> {
            let a = dynamics.accel(t, [y[0], y[1], y[2]], [y[3], y[4], y[5]], fp)?;
            Ok([y[3], y[4], y[5], a[0], a[1], a[2]])
        };
        let step = |t: f64, y: &[f64; 6], h: f64| -> Result<[f64; 6], String> {
            let k1 = f(t, y)?;
            let y2: [f64; 6] = std::array::from_fn(|i| y[i] + 0.5 * h * k1[i]);
            let k2 = f(t + 0.5 * h, &y2)?;
            let y3: [f64; 6] = std::array::from_fn(|i| y[i] + 0.5 * h * k2[i]);
            let k3 = f(t + 0.5 * h, &y3)?;
            let y4: [f64; 6] = std::array::from_fn(|i| y[i] + h * k3[i]);
            let k4 = f(t + h, &y4)?;
            Ok(std::array::from_fn(|i| {
                y[i] + h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i])
            }))
        };
        let nb = ((t0 - t_begin) / h).ceil().max(0.0) as usize;
        let nf = ((t_end - t0) / h).ceil().max(0.0) as usize;
        let mut back = Vec::with_capacity(nb);
        let mut y = y0;
        for k in 0..nb {
            y = step(t0 - k as f64 * h, &y, -h)?;
            back.push(y);
        }
        back.reverse();
        let mut states = back;
        states.push(y0);
        let mut y = y0;
        for k in 0..nf {
            y = step(t0 + k as f64 * h, &y, h)?;
            states.push(y);
        }
        Ok(Self {
            t0: t0 - nb as f64 * h,
            h,
            states,
        })
    }

    /// Position and velocity at TDB `et`.
    pub fn state(&self, et: f64) -> Result<[f64; 6], String> {
        let x = (et - self.t0) / self.h;
        let i = x.floor();
        if i < 0.0 || i as usize + 1 >= self.states.len() {
            return Err(format!("epoch {et} outside the integrated span"));
        }
        let i = i as usize;
        let s = x - i as f64;
        let (a, b) = (&self.states[i], &self.states[i + 1]);
        let h = self.h;
        let (h00, h10, h01, h11) = (
            2.0 * s.powi(3) - 3.0 * s * s + 1.0,
            s.powi(3) - 2.0 * s * s + s,
            -2.0 * s.powi(3) + 3.0 * s * s,
            s.powi(3) - s * s,
        );
        let (d00, d10, d01, d11) = (
            6.0 * s * s - 6.0 * s,
            3.0 * s * s - 4.0 * s + 1.0,
            -6.0 * s * s + 6.0 * s,
            3.0 * s * s - 2.0 * s,
        );
        let mut out = [0.0; 6];
        for k in 0..3 {
            out[k] = h00 * a[k] + h10 * h * a[k + 3] + h01 * b[k] + h11 * h * b[k + 3];
            out[k + 3] = (d00 * a[k] + d10 * h * a[k + 3] + d01 * b[k] + d11 * h * b[k + 3]) / h;
        }
        Ok(out)
    }
}

impl Trajectory for DenseTrajectory {
    fn pos(&self, et: Et) -> Result<Vec3, String> {
        let s = self.state(et.total())?;
        Ok([s[0], s[1], s[2]])
    }
}

/// Settings of a batch fit.
#[derive(Clone, Debug)]
pub struct FitSettings {
    /// Minimum reception elevation (rad).
    pub min_elevation_rad: f64,
    /// Outlier threshold in units of 1.4826 × MAD.
    pub outlier_k: f64,
    /// Integration step (s).
    pub step_s: f64,
    /// Maximum Gauss-Newton iterations.
    pub max_iter: usize,
}

/// The result of a batch fit.
#[derive(Clone, Debug)]
pub struct FitResult {
    /// Estimated state at the epoch (m, m/s).
    pub state: [f64; 6],
    /// Estimated force parameters.
    pub params: ForceParams,
    /// Post-fit residuals (observed − computed, Hz) of the points kept.
    pub residuals_hz: Vec<f64>,
    /// Points after the elevation cut.
    pub n_after_elevation: usize,
    /// Points removed by the outlier rule.
    pub n_outliers: usize,
    /// Iterations run.
    pub iterations: usize,
    /// The final trajectory.
    pub trajectory: DenseTrajectory,
    /// Per-iteration record (filled by [`fit_damped`] only).
    pub log: Vec<FitIteration>,
}

/// One Jacobian evaluation of [`fit_damped`].
#[derive(Clone, Debug)]
pub struct FitIteration {
    /// Points kept by the outlier rule at the start of the iteration.
    pub n_kept: usize,
    /// RMS of the kept residuals at the start of the iteration (Hz).
    pub rms_hz: f64,
    /// Smallest and largest eigenvalue of the column-scaled normal matrix.
    pub scaled_eig: (f64, f64),
    /// Damping of the accepted step.
    pub lambda: f64,
    /// Trial steps rejected before the accepted one.
    pub rejected: usize,
    /// Norm of the accepted position update (m).
    pub dpos_m: f64,
}

/// RMS of a slice.
pub fn rms(x: &[f64]) -> f64 {
    if x.is_empty() {
        return f64::NAN;
    }
    (x.iter().map(|v| v * v).sum::<f64>() / x.len() as f64).sqrt()
}

/// Median of a slice.
pub fn median(x: &[f64]) -> f64 {
    let mut v = x.to_vec();
    v.sort_by(f64::total_cmp);
    let n = v.len();
    if n == 0 {
        return f64::NAN;
    }
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

/// The outlier mask: iterate `|r| ≤ k·1.4826·MAD(r)` to a fixed point (at most 10 times).
/// `true` keeps the point.
pub fn mad_mask(res: &[f64], k: f64) -> Vec<bool> {
    let mut keep = vec![true; res.len()];
    for _ in 0..10 {
        let kept: Vec<f64> = res
            .iter()
            .zip(&keep)
            .filter(|(_, &k)| k)
            .map(|(r, _)| *r)
            .collect();
        let med = median(&kept);
        let dev: Vec<f64> = kept.iter().map(|r| (r - med).abs()).collect();
        let bound = k * 1.4826 * median(&dev);
        let next: Vec<bool> = res.iter().map(|r| (r - med).abs() <= bound).collect();
        if next == keep {
            break;
        }
        keep = next;
    }
    keep
}

/// Residuals (observed − predicted) and elevations of `points` for a trajectory.
pub fn residuals(
    model: &DopplerModel,
    traj: &dyn Trajectory,
    points: &[DopplerPoint],
) -> Result<Vec<(f64, f64)>, String> {
    points
        .iter()
        .map(|p| {
            model
                .predict(traj, p)
                .map(|(f, el)| (p.observed_hz - f, el))
        })
        .collect()
}

/// Eigenvalues (ascending) of a small symmetric matrix by cyclic Jacobi rotations.
pub fn sym_eigenvalues(a: &[Vec<f64>]) -> Vec<f64> {
    let n = a.len();
    let mut m = a.to_vec();
    for _ in 0..100 {
        let off: f64 = (0..n)
            .flat_map(|i| (0..n).filter(move |&j| j != i).map(move |j| (i, j)))
            .map(|(i, j)| m[i][j] * m[i][j])
            .sum();
        if off < 1e-30 {
            break;
        }
        for p in 0..n {
            for q in p + 1..n {
                if m[p][q] == 0.0 {
                    continue;
                }
                let theta = (m[q][q] - m[p][p]) / (2.0 * m[p][q]);
                let t = if theta == 0.0 {
                    1.0
                } else {
                    theta.signum() / (theta.abs() + (theta * theta + 1.0).sqrt())
                };
                let c = 1.0 / (t * t + 1.0).sqrt();
                let s = t * c;
                for row in m.iter_mut() {
                    let (kp, kq) = (row[p], row[q]);
                    row[p] = c * kp - s * kq;
                    row[q] = s * kp + c * kq;
                }
                for k in 0..n {
                    let (pk, qk) = (m[p][k], m[q][k]);
                    m[p][k] = c * pk - s * qk;
                    m[q][k] = s * pk + c * qk;
                }
            }
        }
    }
    let mut ev: Vec<f64> = (0..n).map(|i| m[i][i]).collect();
    ev.sort_by(f64::total_cmp);
    ev
}

/// Solve the symmetric positive-definite system `a·x = b` by Cholesky.
fn cholesky_solve(a: &[Vec<f64>], b: &[f64]) -> Result<Vec<f64>, String> {
    let n = b.len();
    let mut l = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..=i {
            let mut s = a[i][j];
            for k in 0..j {
                s -= l[i][k] * l[j][k];
            }
            if i == j {
                if s <= 0.0 {
                    return Err("normal matrix is not positive definite".into());
                }
                l[i][i] = s.sqrt();
            } else {
                l[i][j] = s / l[j][j];
            }
        }
    }
    let mut y = vec![0.0; n];
    for i in 0..n {
        let mut s = b[i];
        for k in 0..i {
            s -= l[i][k] * y[k];
        }
        y[i] = s / l[i][i];
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let mut s = y[i];
        for k in i + 1..n {
            s -= l[k][i] * x[k];
        }
        x[i] = s / l[i][i];
    }
    Ok(x)
}

/// Gauss-Newton batch fit of the state at TDB `epoch` (6), the SRP coefficient and the drag
/// scale to the 2-way Doppler `points`. Points below the elevation cut (evaluated on the
/// initial guess) are dropped once; the outlier rule is re-applied on each iteration's
/// residuals. Partials are forward differences of the full trajectory.
pub fn fit(
    model: &DopplerModel,
    dynamics: &MarsDynamics,
    points: &[DopplerPoint],
    epoch: f64,
    guess: [f64; 6],
    guess_params: ForceParams,
    settings: &FitSettings,
) -> Result<FitResult, String> {
    // The integration span: one round-trip before the first point to after the last.
    let et_first = et_of_utc(points.first().ok_or("no points")?.t3s).total() - 2_000.0;
    let et_last = et_of_utc(points.last().ok_or("no points")?.t3s).total() + 600.0;
    let (t_begin, t_end) = (et_first.min(epoch), et_last.max(epoch));
    let integ = |x: &[f64; 8]| -> Result<DenseTrajectory, String> {
        let fp = ForceParams {
            srp_cr_a_over_m: x[6],
            drag_scale: x[7],
        };
        DenseTrajectory::integrate(
            dynamics,
            &fp,
            [x[0], x[1], x[2], x[3], x[4], x[5]],
            epoch,
            t_begin,
            t_end,
            settings.step_s,
        )
    };
    let mut x = [
        guess[0],
        guess[1],
        guess[2],
        guess[3],
        guess[4],
        guess[5],
        guess_params.srp_cr_a_over_m,
        guess_params.drag_scale,
    ];
    let steps = [10.0, 10.0, 10.0, 0.01, 0.01, 0.01, 0.005, 0.05];
    // Elevation cut on the initial guess.
    let traj0 = integ(&x)?;
    let r0 = residuals(model, &traj0, points)?;
    let pts: Vec<DopplerPoint> = points
        .iter()
        .zip(&r0)
        .filter(|(_, (_, el))| *el >= settings.min_elevation_rad)
        .map(|(p, _)| *p)
        .collect();
    let n_after_elevation = pts.len();
    let mut iterations = 0;
    let mut traj = traj0;
    let mut keep = vec![true; pts.len()];
    for it in 0..settings.max_iter {
        iterations = it + 1;
        let res: Vec<f64> = residuals(model, &traj, &pts)?.iter().map(|r| r.0).collect();
        keep = mad_mask(&res, settings.outlier_k);
        let mut cols: Vec<Vec<f64>> = Vec::with_capacity(8);
        for j in 0..8 {
            let mut xp = x;
            xp[j] += steps[j];
            let tp = integ(&xp)?;
            let rp: Vec<f64> = residuals(model, &tp, &pts)?.iter().map(|r| r.0).collect();
            // d(predicted)/dx = −d(residual)/dx.
            cols.push(
                res.iter()
                    .zip(&rp)
                    .map(|(a, b)| (a - b) / steps[j])
                    .collect(),
            );
        }
        let mut n = vec![vec![0.0; 8]; 8];
        let mut b = vec![0.0; 8];
        for (i, r) in res.iter().enumerate() {
            if !keep[i] {
                continue;
            }
            for p in 0..8 {
                b[p] += cols[p][i] * r;
                for q in 0..8 {
                    n[p][q] += cols[p][i] * cols[q][i];
                }
            }
        }
        let dx = cholesky_solve(&n, &b)?;
        for j in 0..8 {
            x[j] += dx[j];
        }
        traj = integ(&x)?;
        let dpos = (dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt();
        if dpos < 1.0 {
            break;
        }
    }
    let res: Vec<f64> = residuals(model, &traj, &pts)?.iter().map(|r| r.0).collect();
    keep = mad_mask(&res, settings.outlier_k);
    let kept: Vec<f64> = res
        .iter()
        .zip(&keep)
        .filter(|(_, &k)| k)
        .map(|(r, _)| *r)
        .collect();
    Ok(FitResult {
        state: [x[0], x[1], x[2], x[3], x[4], x[5]],
        params: ForceParams {
            srp_cr_a_over_m: x[6],
            drag_scale: x[7],
        },
        n_outliers: keep.iter().filter(|k| !**k).count(),
        residuals_hz: kept,
        n_after_elevation,
        iterations,
        trajectory: traj,
        log: Vec::new(),
    })
}

/// Levenberg-Marquardt batch fit (CAP-30 run 2): the parameters, partials, elevation cut and
/// outlier rule of [`fit`], with two numerical changes. The normal matrix is scaled by its
/// diagonal before it is solved (the raw diagonal spans about eight orders of magnitude), and a
/// damping `λ` is added to the scaled diagonal. A trial step is accepted only when it lowers the
/// sum of squared residuals over the points the outlier rule kept at the start of the
/// iteration; then `λ` is divided by 10, otherwise it is multiplied by 10 and the step retried
/// (at most 10 times). `max_iter` bounds the Jacobian evaluations. The fit stops when an
/// accepted position update is below 1 m, or when no trial step lowers the cost.
pub fn fit_damped(
    model: &DopplerModel,
    dynamics: &MarsDynamics,
    points: &[DopplerPoint],
    epoch: f64,
    guess: [f64; 6],
    guess_params: ForceParams,
    settings: &FitSettings,
) -> Result<FitResult, String> {
    let et_first = et_of_utc(points.first().ok_or("no points")?.t3s).total() - 2_000.0;
    let et_last = et_of_utc(points.last().ok_or("no points")?.t3s).total() + 600.0;
    let (t_begin, t_end) = (et_first.min(epoch), et_last.max(epoch));
    let integ = |x: &[f64; 8]| -> Result<DenseTrajectory, String> {
        let fp = ForceParams {
            srp_cr_a_over_m: x[6],
            drag_scale: x[7],
        };
        DenseTrajectory::integrate(
            dynamics,
            &fp,
            [x[0], x[1], x[2], x[3], x[4], x[5]],
            epoch,
            t_begin,
            t_end,
            settings.step_s,
        )
    };
    let mut x = [
        guess[0],
        guess[1],
        guess[2],
        guess[3],
        guess[4],
        guess[5],
        guess_params.srp_cr_a_over_m,
        guess_params.drag_scale,
    ];
    let steps = [10.0, 10.0, 10.0, 0.01, 0.01, 0.01, 0.005, 0.05];
    let traj0 = integ(&x)?;
    let r0 = residuals(model, &traj0, points)?;
    let pts: Vec<DopplerPoint> = points
        .iter()
        .zip(&r0)
        .filter(|(_, (_, el))| *el >= settings.min_elevation_rad)
        .map(|(p, _)| *p)
        .collect();
    let n_after_elevation = pts.len();
    let cost = |res: &[f64], keep: &[bool]| -> f64 {
        res.iter()
            .zip(keep)
            .filter(|(_, k)| **k)
            .map(|(r, _)| r * r)
            .sum()
    };
    let mut iterations = 0;
    let mut traj = traj0;
    let mut res: Vec<f64> = residuals(model, &traj, &pts)?.iter().map(|r| r.0).collect();
    let mut lambda = 1e-3;
    let mut log = Vec::new();
    for it in 0..settings.max_iter {
        iterations = it + 1;
        let keep = mad_mask(&res, settings.outlier_k);
        let c0 = cost(&res, &keep);
        let mut cols: Vec<Vec<f64>> = Vec::with_capacity(8);
        for j in 0..8 {
            let mut xp = x;
            xp[j] += steps[j];
            let tp = integ(&xp)?;
            let rp: Vec<f64> = residuals(model, &tp, &pts)?.iter().map(|r| r.0).collect();
            cols.push(
                res.iter()
                    .zip(&rp)
                    .map(|(a, b)| (a - b) / steps[j])
                    .collect(),
            );
        }
        let mut n = vec![vec![0.0; 8]; 8];
        let mut b = vec![0.0; 8];
        for (i, r) in res.iter().enumerate() {
            if !keep[i] {
                continue;
            }
            for p in 0..8 {
                b[p] += cols[p][i] * r;
                for q in 0..8 {
                    n[p][q] += cols[p][i] * cols[q][i];
                }
            }
        }
        let d: Vec<f64> = (0..8).map(|p| n[p][p].sqrt()).collect();
        if d.iter().any(|v| !(*v > 0.0)) {
            return Err("a parameter has no partial on the kept points".into());
        }
        let ns: Vec<Vec<f64>> = (0..8)
            .map(|p| (0..8).map(|q| n[p][q] / (d[p] * d[q])).collect())
            .collect();
        let bs: Vec<f64> = (0..8).map(|p| b[p] / d[p]).collect();
        let ev = sym_eigenvalues(&ns);
        let kept_rms = (c0 / keep.iter().filter(|k| **k).count() as f64).sqrt();
        let mut accepted = None;
        let mut rejected = 0;
        for _ in 0..10 {
            let mut a = ns.clone();
            for (p, row) in a.iter_mut().enumerate() {
                row[p] += lambda;
            }
            let trial = cholesky_solve(&a, &bs).ok().and_then(|y| {
                let mut xt = x;
                for j in 0..8 {
                    xt[j] += y[j] / d[j];
                }
                let tt = integ(&xt).ok()?;
                let rt: Vec<f64> = residuals(model, &tt, &pts)
                    .ok()?
                    .iter()
                    .map(|r| r.0)
                    .collect();
                (cost(&rt, &keep) < c0).then_some((xt, tt, rt))
            });
            match trial {
                Some(t) => {
                    accepted = Some(t);
                    break;
                }
                None => {
                    rejected += 1;
                    lambda *= 10.0;
                }
            }
        }
        let Some((xt, tt, rt)) = accepted else {
            log.push(FitIteration {
                n_kept: keep.iter().filter(|k| **k).count(),
                rms_hz: kept_rms,
                scaled_eig: (ev[0], ev[7]),
                lambda,
                rejected,
                dpos_m: 0.0,
            });
            break;
        };
        let dpos =
            ((xt[0] - x[0]).powi(2) + (xt[1] - x[1]).powi(2) + (xt[2] - x[2]).powi(2)).sqrt();
        log.push(FitIteration {
            n_kept: keep.iter().filter(|k| **k).count(),
            rms_hz: kept_rms,
            scaled_eig: (ev[0], ev[7]),
            lambda,
            rejected,
            dpos_m: dpos,
        });
        lambda = (lambda / 10.0).max(1e-12);
        x = xt;
        traj = tt;
        res = rt;
        if dpos < 1.0 {
            break;
        }
    }
    let keep = mad_mask(&res, settings.outlier_k);
    let kept: Vec<f64> = res
        .iter()
        .zip(&keep)
        .filter(|(_, &k)| k)
        .map(|(r, _)| *r)
        .collect();
    Ok(FitResult {
        state: [x[0], x[1], x[2], x[3], x[4], x[5]],
        params: ForceParams {
            srp_cr_a_over_m: x[6],
            drag_scale: x[7],
        },
        n_outliers: keep.iter().filter(|k| !**k).count(),
        residuals_hz: kept,
        n_after_elevation,
        iterations,
        trajectory: traj,
        log,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn station_block_parses_and_moves_with_the_plate() {
        let text = "   DSS-14_EPOCH      =       @2003-JAN-01/00:00\n   DSS-14_XYZ        =    ( -2353.621420    -4641.341472    +3677.052318 )\n   DSS-14_DXYZ       =    (    -0.0180          0.0065         -0.0038   )\n";
        let s = parse_dsn_stations(text).unwrap();
        let st = s[&14];
        assert_eq!(st.xyz_m, [-2_353_621.42, -4_641_341.472, 3_677_052.318]);
        let later = st.itrf_at(2_452_640.5 + 365.25 * 4.0);
        assert!((later[0] - (st.xyz_m[0] - 0.072)).abs() < 1e-6);
        for (v, want) in st.vel_m_per_yr.iter().zip([-0.018, 0.0065, -0.0038]) {
            assert!((v - want).abs() < 1e-15);
        }
        let bad = text.replace("2003-JAN-01", "2010-JAN-01");
        assert!(parse_dsn_stations(&bad).is_err());
    }

    #[test]
    fn ramp_integral_is_exact_for_a_linear_ramp_across_segments() {
        let r = |s: f64, e: f64, f0: f64, rate: f64| OdfRamp {
            station: 14,
            start_s: s,
            end_s: e,
            rate_hz_s: rate,
            start_frequency_hz: f0,
        };
        // One linear ramp f = 7e9 + 10 t split into two contiguous segments at t = 100.
        let odf = Odf {
            ramps: vec![
                r(100.0, 200.0, 7e9 + 1000.0, 10.0),
                r(0.0, 100.0, 7e9, 10.0),
            ],
            ..Default::default()
        };
        let t = RampTable::for_station(&odf, 14);
        let origin = Utc1950 {
            whole: 50.0,
            frac: 0.25,
        };
        // ∫_{50.25+(-20)}^{50.25+90} (10 t) dt = 5 (b² − a²) with a = 30.25, b = 140.25.
        let got = t.integral_minus_ref(origin, -20.0, 90.0).unwrap();
        let want = 5.0 * (140.25f64.powi(2) - 30.25f64.powi(2));
        assert!((got - want).abs() < 1e-6, "{got} vs {want}");
        assert!(t.integral_minus_ref(origin, 0.0, 300.0).is_none());
    }

    #[test]
    fn utc_to_et_matches_the_leap_second_and_tt_offsets() {
        // 2007-11-01T00:00:00 UTC: TAI−UTC = 33 s, TT−TAI = 32.184 s.
        let t = Utc1950 {
            whole: seconds_1950(2007, 305, 0, 0, 0.0),
            frac: 0.0,
        };
        let et = et_of_utc(t);
        let days = (2_454_405.5 - 2_451_545.0) * 86_400.0;
        assert!((et.total() - (days + 33.0 + 32.184)).abs() < 2e-3);
    }

    #[test]
    fn sym_eigenvalues_of_a_known_matrix() {
        let a = vec![
            vec![2.0, 1.0, 0.0],
            vec![1.0, 2.0, 0.0],
            vec![0.0, 0.0, 5.0],
        ];
        let e = sym_eigenvalues(&a);
        for (got, want) in e.iter().zip([1.0, 3.0, 5.0]) {
            assert!((got - want).abs() < 1e-12, "{e:?}");
        }
    }

    #[test]
    fn mad_mask_drops_a_gross_outlier_only() {
        let mut r: Vec<f64> = (0..100)
            .map(|i| ((i * 37) % 11) as f64 * 0.01 - 0.05)
            .collect();
        r[17] = 5.0;
        let keep = mad_mask(&r, 5.0);
        assert!(!keep[17]);
        assert_eq!(keep.iter().filter(|k| !**k).count(), 1);
    }
}
