// SPDX-License-Identifier: AGPL-3.0-only
//! SGP4/SDP4 analytical orbit propagation.
//!
//! A dependency-free port of the standard simplified-perturbations propagator —
//! near-Earth SGP4 together with the deep-space SDP4 extension (lunar-solar
//! secular and periodic perturbations and 12 h / 24 h geopotential resonance).
//! This is the model two-line element sets are *defined* against, so propagating a
//! published TLE with it reproduces the operator's intended ephemeris, including
//! drag decay and the deep-space terms that the engine's two-body + J2-secular
//! [`Orbit`](crate::orbit::Orbit) model cannot represent (notably the ~12 h GNSS
//! constellations, which are deep-space and resonant).
//!
//! The implementation follows the public-domain reference:
//!
//! > Vallado, D. A., Crawford, P., Hujsak, R., Kelso, T. S.,
//! > *"Revisiting Spacetrack Report #3"*, AIAA 2006-6753, 2006,
//! > with the accompanying corrections (the "sgp4fix" lineage).
//!
//! It is validated to the reference's published verification vectors in
//! `tests/sgp4_verification.rs`. Output is a TEME position (km) and velocity
//! (km/s); for an availability/geometry study the TEME frame is used consistently
//! for the user and the satellites, which is internally consistent for line-of-sight
//! geometry without the full TEME→ECEF reduction (polar motion, nutation).

use std::f64::consts::PI;

const TWO_PI: f64 = 2.0 * PI;
const X2O3: f64 = 2.0 / 3.0;
/// Divisor guarding the divide-by-zero at inclination = 180 deg (sgp4fix).
const TEMP4: f64 = 1.5e-12;

/// Gravity-model constants for the propagator.
#[derive(Clone, Copy, Debug)]
pub struct GravConst {
    pub mu: f64,
    pub radiusearthkm: f64,
    pub xke: f64,
    pub j2: f64,
    pub j3: f64,
    pub j4: f64,
    pub j3oj2: f64,
}

/// The WGS-72 gravity model — the set the SGP4 verification vectors use and the
/// conventional choice for TLE propagation.
pub fn wgs72() -> GravConst {
    let mu = 398_600.8_f64;
    let radiusearthkm = 6378.135_f64;
    let xke = 60.0 / (radiusearthkm * radiusearthkm * radiusearthkm / mu).sqrt();
    let j2 = 0.001_082_616;
    let j3 = -0.000_002_538_81;
    let j4 = -0.000_001_655_97;
    GravConst {
        mu,
        radiusearthkm,
        xke,
        j2,
        j3,
        j4,
        j3oj2: j3 / j2,
    }
}

/// The WGS-84 gravity model. More accurate Earth constants than WGS-72, but note
/// the standard SGP4 verification vectors are defined against WGS-72, so WGS-72
/// remains the default for reproducing published TLE propagations.
pub fn wgs84() -> GravConst {
    let mu = 398_600.5_f64;
    let radiusearthkm = 6378.137_f64;
    let xke = 60.0 / (radiusearthkm * radiusearthkm * radiusearthkm / mu).sqrt();
    let j2 = 0.001_082_629_989_05;
    let j3 = -0.000_002_532_153_06;
    let j4 = -0.000_001_610_987_61;
    GravConst {
        mu,
        radiusearthkm,
        xke,
        j2,
        j3,
        j4,
        j3oj2: j3 / j2,
    }
}

/// A named SGP4 gravity model. Use [`GravModel::constants`] to obtain the
/// underlying [`GravConst`]. Defaults to WGS-72 (the verification-vector set).
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum GravModel {
    /// WGS-72 — the conventional, verification-vector gravity set (default).
    #[default]
    Wgs72,
    /// WGS-84 — more accurate Earth constants.
    Wgs84,
}

impl GravModel {
    /// The gravity constants for this model.
    pub fn constants(self) -> GravConst {
        match self {
            GravModel::Wgs72 => wgs72(),
            GravModel::Wgs84 => wgs84(),
        }
    }
}

/// Solve the SGP4 short-period Kepler equation `E = u + axnl·sin E − aynl·cos E`
/// by the reference damped Newton iteration (Vallado), capped at ten steps.
/// Returns `(sin E, cos E)`, or `None` when the iteration has not reached the
/// `1e-12` tolerance within the cap — a near-singular short-period geometry —
/// so a non-converged root is reported rather than silently returned. The
/// arithmetic is identical to the reference for every case that converges, which
/// preserves the verification-vector results exactly.
fn kepler_short_period(u: f64, axnl: f64, aynl: f64) -> Option<(f64, f64)> {
    let mut eo1 = u;
    let mut tem5: f64 = 9999.9;
    let mut ktr = 1;
    let mut sineo1 = 0.0;
    let mut coseo1 = 0.0;
    while tem5.abs() >= 1.0e-12 && ktr <= 10 {
        sineo1 = eo1.sin();
        coseo1 = eo1.cos();
        tem5 = 1.0 - coseo1 * axnl - sineo1 * aynl;
        tem5 = (u - aynl * coseo1 + axnl * sineo1 - eo1) / tem5;
        if tem5.abs() >= 0.95 {
            tem5 = if tem5 > 0.0 { 0.95 } else { -0.95 };
        }
        eo1 += tem5;
        ktr += 1;
    }
    // Reject both an unconverged root (tolerance not met within the cap) and a
    // degenerate one (a vanishing Newton denominator at e = 1 yields a non-finite
    // step). Either way the reference would return garbage silently; we do not.
    if !tem5.is_finite() || tem5.abs() >= 1.0e-12 {
        return None;
    }
    Some((sineo1, coseo1))
}

/// Reduce an angle to `[0, 2π)`, matching the reference's `x % twopi` for any sign.
fn fmod2pi(x: f64) -> f64 {
    if x >= 0.0 {
        x % TWO_PI
    } else {
        -((-x) % TWO_PI)
    }
}

/// Greenwich mean sidereal time (rad) from a UT1 Julian date (Vallado 2004, eq 3-45).
pub fn gstime(jdut1: f64) -> f64 {
    let tut1 = (jdut1 - 2_451_545.0) / 36_525.0;
    let mut temp = -6.2e-6 * tut1 * tut1 * tut1
        + 0.093_104 * tut1 * tut1
        + (876_600.0 * 3600.0 + 8_640_184.812_866) * tut1
        + 67_310.548_41;
    temp = (temp * (PI / 180.0) / 240.0) % TWO_PI;
    if temp < 0.0 {
        temp += TWO_PI;
    }
    temp
}

/// An initialised SGP4/SDP4 propagator for one satellite. Built from mean elements
/// by [`Sgp4::new`]; evaluated with [`Sgp4::propagate`].
#[derive(Clone, Debug)]
pub struct Sgp4 {
    grav: GravConst,
    afspc: bool,
    deep: bool,
    isimp: bool,

    // Mean elements (some adjusted at init).
    bstar: f64,
    ecco: f64,
    argpo: f64,
    inclo: f64,
    mo: f64,
    no_unkozai: f64,
    nodeo: f64,

    // Near-Earth secular / drag coefficients.
    aycof: f64,
    con41: f64,
    cc1: f64,
    cc4: f64,
    cc5: f64,
    d2: f64,
    d3: f64,
    d4: f64,
    delmo: f64,
    eta: f64,
    argpdot: f64,
    omgcof: f64,
    sinmao: f64,
    t2cof: f64,
    t3cof: f64,
    t4cof: f64,
    t5cof: f64,
    x1mth2: f64,
    x7thm1: f64,
    mdot: f64,
    nodedot: f64,
    xlcof: f64,
    xmcof: f64,
    nodecf: f64,

    // Deep-space resonance / lunar-solar terms.
    irez: i32,
    d2201: f64,
    d2211: f64,
    d3210: f64,
    d3222: f64,
    d4410: f64,
    d4422: f64,
    d5220: f64,
    d5232: f64,
    d5421: f64,
    d5433: f64,
    dedt: f64,
    del1: f64,
    del2: f64,
    del3: f64,
    didt: f64,
    dmdt: f64,
    dnodt: f64,
    domdt: f64,
    e3: f64,
    ee2: f64,
    peo: f64,
    pgho: f64,
    pho: f64,
    pinco: f64,
    plo: f64,
    se2: f64,
    se3: f64,
    sgh2: f64,
    sgh3: f64,
    sgh4: f64,
    sh2: f64,
    sh3: f64,
    si2: f64,
    si3: f64,
    sl2: f64,
    sl3: f64,
    sl4: f64,
    gsto: f64,
    xfact: f64,
    xgh2: f64,
    xgh3: f64,
    xgh4: f64,
    xh2: f64,
    xh3: f64,
    xi2: f64,
    xi3: f64,
    xl2: f64,
    xl3: f64,
    xl4: f64,
    xlamo: f64,
    zmol: f64,
    zmos: f64,
}

impl Sgp4 {
    /// Initialise from mean elements in SGP4 units: `epoch` in days since 1950
    /// Jan 0.0 UTC; `bstar` the drag term; `ecco` eccentricity; `argpo`, `inclo`,
    /// `mo`, `nodeo` in radians; `no_kozai` the Brouwer/Kozai mean motion in
    /// rad/min. `afspc` selects the legacy AFSPC sidereal-time mode (`false` =
    /// the modern improved mode, the default for current TLEs).
    #[allow(clippy::too_many_arguments)]
    pub fn new(
        grav: GravConst,
        afspc: bool,
        epoch: f64,
        bstar: f64,
        ecco: f64,
        argpo: f64,
        inclo: f64,
        mo: f64,
        no_kozai: f64,
        nodeo: f64,
    ) -> Self {
        let mut s = Sgp4 {
            grav,
            afspc,
            deep: false,
            isimp: false,
            bstar,
            ecco,
            argpo,
            inclo,
            mo,
            no_unkozai: no_kozai,
            nodeo,
            aycof: 0.0,
            con41: 0.0,
            cc1: 0.0,
            cc4: 0.0,
            cc5: 0.0,
            d2: 0.0,
            d3: 0.0,
            d4: 0.0,
            delmo: 0.0,
            eta: 0.0,
            argpdot: 0.0,
            omgcof: 0.0,
            sinmao: 0.0,
            t2cof: 0.0,
            t3cof: 0.0,
            t4cof: 0.0,
            t5cof: 0.0,
            x1mth2: 0.0,
            x7thm1: 0.0,
            mdot: 0.0,
            nodedot: 0.0,
            xlcof: 0.0,
            xmcof: 0.0,
            nodecf: 0.0,
            irez: 0,
            d2201: 0.0,
            d2211: 0.0,
            d3210: 0.0,
            d3222: 0.0,
            d4410: 0.0,
            d4422: 0.0,
            d5220: 0.0,
            d5232: 0.0,
            d5421: 0.0,
            d5433: 0.0,
            dedt: 0.0,
            del1: 0.0,
            del2: 0.0,
            del3: 0.0,
            didt: 0.0,
            dmdt: 0.0,
            dnodt: 0.0,
            domdt: 0.0,
            e3: 0.0,
            ee2: 0.0,
            peo: 0.0,
            pgho: 0.0,
            pho: 0.0,
            pinco: 0.0,
            plo: 0.0,
            se2: 0.0,
            se3: 0.0,
            sgh2: 0.0,
            sgh3: 0.0,
            sgh4: 0.0,
            sh2: 0.0,
            sh3: 0.0,
            si2: 0.0,
            si3: 0.0,
            sl2: 0.0,
            sl3: 0.0,
            sl4: 0.0,
            gsto: 0.0,
            xfact: 0.0,
            xgh2: 0.0,
            xgh3: 0.0,
            xgh4: 0.0,
            xh2: 0.0,
            xh3: 0.0,
            xi2: 0.0,
            xi3: 0.0,
            xl2: 0.0,
            xl3: 0.0,
            xl4: 0.0,
            xlamo: 0.0,
            zmol: 0.0,
            zmos: 0.0,
        };
        s.init(epoch);
        s
    }

    /// Port of `sgp4init` + `initl`: derive the secular and (if deep-space) the
    /// resonance / lunar-solar coefficients from the mean elements.
    fn init(&mut self, epoch: f64) {
        let GravConst {
            radiusearthkm,
            xke,
            j2,
            j4,
            j3oj2,
            ..
        } = self.grav;

        let ss = 78.0 / radiusearthkm + 1.0;
        let qzms2ttemp = (120.0 - 78.0) / radiusearthkm;
        let qzms2t = qzms2ttemp * qzms2ttemp * qzms2ttemp * qzms2ttemp;

        // ---- initl ----
        let eccsq = self.ecco * self.ecco;
        let omeosq = 1.0 - eccsq;
        let rteosq = omeosq.sqrt();
        let cosio = self.inclo.cos();
        let cosio2 = cosio * cosio;

        // Un-Kozai the mean motion.
        let ak = (xke / self.no_unkozai).powf(X2O3);
        let d1 = 0.75 * j2 * (3.0 * cosio2 - 1.0) / (rteosq * omeosq);
        let mut del = d1 / (ak * ak);
        let adel = ak * (1.0 - del * del - del * (1.0 / 3.0 + 134.0 * del * del / 81.0));
        del = d1 / (adel * adel);
        self.no_unkozai /= 1.0 + del;

        let ao = (xke / self.no_unkozai).powf(X2O3);
        let sinio = self.inclo.sin();
        let po = ao * omeosq;
        let con42 = 1.0 - 5.0 * cosio2;
        self.con41 = -con42 - cosio2 - cosio2;
        let posq = po * po;
        let rp = ao * (1.0 - self.ecco);

        self.gsto = if self.afspc {
            // Legacy AFSPC sidereal time: integer days from 0 Jan 1970.
            let ts70 = epoch - 7305.0;
            let ds70 = (ts70 + 1.0e-8).floor();
            let tfrac = ts70 - ds70;
            let c1 = 1.720_279_169_407_036_2e-2;
            let thgr70 = 1.732_134_385_650_937_4;
            let fk5r = 5.075_514_194_322_695e-15;
            let c1p2p = c1 + TWO_PI;
            let mut g = (thgr70 + c1 * ds70 + c1p2p * tfrac + ts70 * ts70 * fk5r) % TWO_PI;
            if g < 0.0 {
                g += TWO_PI;
            }
            g
        } else {
            // `epoch` is the TLE epoch in days since 1950 Jan 0.0 **UTC**; gstime wants
            // a UT1 Julian date. We feed the UTC-derived JD directly — i.e. the
            // DUT1 = UT1 − UTC ≈ 0 approximation (|DUT1| ≤ 0.9 s by the leap-second
            // convention). This is standard in SGP4 and intended: the resulting GMST
            // error is |DUT1| · Earth-rate ≈ 0.9 s · 15.04″/s ≈ 13″ worst case (a few
            // arcsec typically) — well inside SGP4's own model error, and it keeps the
            // propagator self-consistent without an Earth-orientation table. For an
            // ITRF-precise reduction supply the real UT1 to the frame layer
            // (crate::timescales::utc_to_ut1 + crate::frames / crate::cio) instead.
            gstime(epoch + 2_433_281.5)
        };

        if omeosq >= 0.0 || self.no_unkozai >= 0.0 {
            self.isimp = rp < 220.0 / radiusearthkm + 1.0;
            let mut sfour = ss;
            let mut qzms24 = qzms2t;
            let perige = (rp - 1.0) * radiusearthkm;

            // Below 156 km, s and qoms2t are altered.
            if perige < 156.0 {
                sfour = perige - 78.0;
                if perige < 98.0 {
                    sfour = 20.0;
                }
                let qzms24temp = (120.0 - sfour) / radiusearthkm;
                qzms24 = qzms24temp * qzms24temp * qzms24temp * qzms24temp;
                sfour = sfour / radiusearthkm + 1.0;
            }
            let pinvsq = 1.0 / posq;

            let tsi = 1.0 / (ao - sfour);
            self.eta = ao * self.ecco * tsi;
            let etasq = self.eta * self.eta;
            let eeta = self.ecco * self.eta;
            let psisq = (1.0 - etasq).abs();
            let coef = qzms24 * tsi.powi(4);
            let coef1 = coef / psisq.powf(3.5);
            let cc2 = coef1
                * self.no_unkozai
                * (ao * (1.0 + 1.5 * etasq + eeta * (4.0 + etasq))
                    + 0.375 * j2 * tsi / psisq * self.con41 * (8.0 + 3.0 * etasq * (8.0 + etasq)));
            self.cc1 = self.bstar * cc2;
            let mut cc3 = 0.0;
            if self.ecco > 1.0e-4 {
                cc3 = -2.0 * coef * tsi * j3oj2 * self.no_unkozai * sinio / self.ecco;
            }
            self.x1mth2 = 1.0 - cosio2;
            self.cc4 = 2.0
                * self.no_unkozai
                * coef1
                * ao
                * omeosq
                * (self.eta * (2.0 + 0.5 * etasq) + self.ecco * (0.5 + 2.0 * etasq)
                    - j2 * tsi / (ao * psisq)
                        * (-3.0 * self.con41 * (1.0 - 2.0 * eeta + etasq * (1.5 - 0.5 * eeta))
                            + 0.75
                                * self.x1mth2
                                * (2.0 * etasq - eeta * (1.0 + etasq))
                                * (2.0 * self.argpo).cos()));
            self.cc5 = 2.0 * coef1 * ao * omeosq * (1.0 + 2.75 * (etasq + eeta) + eeta * etasq);
            let cosio4 = cosio2 * cosio2;
            let temp1 = 1.5 * j2 * pinvsq * self.no_unkozai;
            let temp2 = 0.5 * temp1 * j2 * pinvsq;
            let temp3 = -0.46875 * j4 * pinvsq * pinvsq * self.no_unkozai;
            self.mdot = self.no_unkozai
                + 0.5 * temp1 * rteosq * self.con41
                + 0.0625 * temp2 * rteosq * (13.0 - 78.0 * cosio2 + 137.0 * cosio4);
            self.argpdot = -0.5 * temp1 * con42
                + 0.0625 * temp2 * (7.0 - 114.0 * cosio2 + 395.0 * cosio4)
                + temp3 * (3.0 - 36.0 * cosio2 + 49.0 * cosio4);
            let xhdot1 = -temp1 * cosio;
            self.nodedot = xhdot1
                + (0.5 * temp2 * (4.0 - 19.0 * cosio2) + 2.0 * temp3 * (3.0 - 7.0 * cosio2))
                    * cosio;
            let xpidot = self.argpdot + self.nodedot;
            self.omgcof = self.bstar * cc3 * self.argpo.cos();
            self.xmcof = 0.0;
            if self.ecco > 1.0e-4 {
                self.xmcof = -X2O3 * coef * self.bstar / eeta;
            }
            self.nodecf = 3.5 * omeosq * xhdot1 * self.cc1;
            self.t2cof = 1.5 * self.cc1;
            if (cosio + 1.0).abs() > 1.5e-12 {
                self.xlcof = -0.25 * j3oj2 * sinio * (3.0 + 5.0 * cosio) / (1.0 + cosio);
            } else {
                self.xlcof = -0.25 * j3oj2 * sinio * (3.0 + 5.0 * cosio) / TEMP4;
            }
            self.aycof = -0.5 * j3oj2 * sinio;
            let delmotemp = 1.0 + self.eta * self.mo.cos();
            self.delmo = delmotemp * delmotemp * delmotemp;
            self.sinmao = self.mo.sin();
            self.x7thm1 = 7.0 * cosio2 - 1.0;

            // ---- deep-space initialisation ----
            if TWO_PI / self.no_unkozai >= 225.0 {
                self.deep = true;
                self.isimp = true;
                let tc = 0.0;
                let inclm = self.inclo;
                let ds = self.dscom(epoch, tc);
                // (init-time dpper with init='y' is a no-op on the elements; skipped.)
                self.dsinit(&ds, tc, xpidot, cosio, eccsq, inclm);
            }

            // ---- near-space coefficients (skip when deep/simplified) ----
            if !self.isimp {
                let cc1sq = self.cc1 * self.cc1;
                self.d2 = 4.0 * ao * tsi * cc1sq;
                let temp = self.d2 * tsi * self.cc1 / 3.0;
                self.d3 = (17.0 * ao + sfour) * temp;
                self.d4 = 0.5 * temp * ao * tsi * (221.0 * ao + 31.0 * sfour) * self.cc1;
                self.t3cof = self.d2 + 2.0 * cc1sq;
                self.t4cof = 0.25 * (3.0 * self.d3 + self.cc1 * (12.0 * self.d2 + 10.0 * cc1sq));
                self.t5cof = 0.2
                    * (3.0 * self.d4
                        + 12.0 * self.cc1 * self.d3
                        + 6.0 * self.d2 * self.d2
                        + 15.0 * cc1sq * (2.0 * self.d2 + cc1sq));
            }
        }
    }

    /// Nominal orbital period (s) from the un-Kozai'd mean motion.
    pub fn period_s(&self) -> f64 {
        TWO_PI / self.no_unkozai * 60.0
    }

    /// Propagate to `tsince` minutes past epoch. Returns `(r, v)` in TEME km and
    /// km/s, or an SGP4 error code (1 eccentricity, 2 mean motion, 3 perturbed
    /// eccentricity, 4 semi-latus rectum, 6 decayed) on a non-physical state.
    pub fn propagate(&self, tsince: f64) -> Result<([f64; 3], [f64; 3]), i32> {
        let vkmpersec = self.grav.radiusearthkm * self.grav.xke / 60.0;
        let j2 = self.grav.j2;
        let xke = self.grav.xke;

        // ---- secular gravity and atmospheric drag ----
        let xmdf = self.mo + self.mdot * tsince;
        let argpdf = self.argpo + self.argpdot * tsince;
        let nodedf = self.nodeo + self.nodedot * tsince;
        let mut argpm = argpdf;
        let mut mm = xmdf;
        let t2 = tsince * tsince;
        let mut nodem = nodedf + self.nodecf * t2;
        let mut tempa = 1.0 - self.cc1 * tsince;
        let mut tempe = self.bstar * self.cc4 * tsince;
        let mut templ = self.t2cof * t2;

        if !self.isimp {
            let delomg = self.omgcof * tsince;
            let delmtemp = 1.0 + self.eta * xmdf.cos();
            let delm = self.xmcof * (delmtemp * delmtemp * delmtemp - self.delmo);
            let temp = delomg + delm;
            mm = xmdf + temp;
            argpm = argpdf - temp;
            let t3 = t2 * tsince;
            let t4 = t3 * tsince;
            tempa = tempa - self.d2 * t2 - self.d3 * t3 - self.d4 * t4;
            tempe += self.bstar * self.cc5 * (mm.sin() - self.sinmao);
            templ += self.t3cof * t3 + t4 * (self.t4cof + tsince * self.t5cof);
        }

        let mut nm = self.no_unkozai;
        let mut em = self.ecco;
        let mut inclm = self.inclo;

        if self.deep {
            let (nem, nargpm, ninclm, nmm, nnm, nnodem) =
                self.dspace(tsince, em, argpm, inclm, mm, nm, nodem);
            em = nem;
            argpm = nargpm;
            inclm = ninclm;
            mm = nmm;
            nm = nnm;
            nodem = nnodem;
        }

        if nm <= 0.0 {
            return Err(2);
        }
        let am = (xke / nm).powf(X2O3) * tempa * tempa;
        nm = xke / am.powf(1.5);
        em -= tempe;

        if !(-0.001..1.0).contains(&em) {
            return Err(1);
        }
        if em < 1.0e-6 {
            em = 1.0e-6;
        }
        mm += self.no_unkozai * templ;
        let xlm = mm + argpm + nodem;
        nodem = fmod2pi(nodem);
        argpm %= TWO_PI;
        let xlm = xlm % TWO_PI;
        mm = fmod2pi(xlm - argpm - nodem);

        let sinim = inclm.sin();
        let cosim = inclm.cos();

        // ---- add lunar-solar periodics ----
        let mut ep = em;
        let mut xincp = inclm;
        let mut argpp = argpm;
        let mut nodep = nodem;
        let mut mp = mm;
        let mut sinip = sinim;
        let mut cosip = cosim;

        // Working copies of the inclination-dependent coefficients (overwritten in
        // the deep-space short-period section, left as the init values otherwise).
        let mut con41 = self.con41;
        let mut x1mth2 = self.x1mth2;
        let mut x7thm1 = self.x7thm1;
        let mut aycof = self.aycof;
        let mut xlcof = self.xlcof;

        if self.deep {
            let (nep, nincp, nnodep, nargpp, nmp) =
                self.dpper(tsince, false, ep, xincp, nodep, argpp, mp);
            ep = nep;
            xincp = nincp;
            nodep = nnodep;
            argpp = nargpp;
            mp = nmp;
            if xincp < 0.0 {
                xincp = -xincp;
                nodep += PI;
                argpp -= PI;
            }
            if !(0.0..=1.0).contains(&ep) {
                return Err(3);
            }
        }

        if self.deep {
            sinip = xincp.sin();
            cosip = xincp.cos();
            aycof = -0.5 * self.grav.j3oj2 * sinip;
            if (cosip + 1.0).abs() > 1.5e-12 {
                xlcof = -0.25 * self.grav.j3oj2 * sinip * (3.0 + 5.0 * cosip) / (1.0 + cosip);
            } else {
                xlcof = -0.25 * self.grav.j3oj2 * sinip * (3.0 + 5.0 * cosip) / TEMP4;
            }
        }

        let axnl = ep * argpp.cos();
        let mut temp = 1.0 / (am * (1.0 - ep * ep));
        let aynl = ep * argpp.sin() + temp * aycof;
        let xl = mp + argpp + nodep + temp * xlcof * axnl;

        // ---- solve Kepler's equation ----
        let u = fmod2pi(xl - nodep);
        // Error code 7: the damped Newton iteration did not converge within the
        // reference ten-step cap (a near-singular short-period geometry). The
        // bare reference returns the unconverged root silently; we surface it.
        let (sineo1, coseo1) = match kepler_short_period(u, axnl, aynl) {
            Some(v) => v,
            None => return Err(7),
        };

        // ---- short-period preliminary quantities ----
        let ecose = axnl * coseo1 + aynl * sineo1;
        let esine = axnl * sineo1 - aynl * coseo1;
        let el2 = axnl * axnl + aynl * aynl;
        let pl = am * (1.0 - el2);
        if pl < 0.0 {
            return Err(4);
        }
        let rl = am * (1.0 - ecose);
        let rdotl = am.sqrt() * esine / rl;
        let rvdotl = pl.sqrt() / rl;
        let betal = (1.0 - el2).sqrt();
        temp = esine / (1.0 + betal);
        let sinu = am / rl * (sineo1 - aynl - axnl * temp);
        let cosu = am / rl * (coseo1 - axnl + aynl * temp);
        let su = sinu.atan2(cosu);
        let sin2u = (cosu + cosu) * sinu;
        let cos2u = 1.0 - 2.0 * sinu * sinu;
        temp = 1.0 / pl;
        let temp1 = 0.5 * j2 * temp;
        let temp2 = temp1 * temp;

        if self.deep {
            let cosisq = cosip * cosip;
            con41 = 3.0 * cosisq - 1.0;
            x1mth2 = 1.0 - cosisq;
            x7thm1 = 7.0 * cosisq - 1.0;
        }

        let mrt = rl * (1.0 - 1.5 * temp2 * betal * con41) + 0.5 * temp1 * x1mth2 * cos2u;
        let su = su - 0.25 * temp2 * x7thm1 * sin2u;
        let xnode = nodep + 1.5 * temp2 * cosip * sin2u;
        let xinc = xincp + 1.5 * temp2 * cosip * sinip * cos2u;
        let mvt = rdotl - nm * temp1 * x1mth2 * sin2u / xke;
        let rvdot = rvdotl + nm * temp1 * (x1mth2 * cos2u + 1.5 * con41) / xke;

        // ---- orientation vectors ----
        let (sinsu, cossu) = su.sin_cos();
        let (snod, cnod) = xnode.sin_cos();
        let (sini, cosi) = xinc.sin_cos();
        let xmx = -snod * cosi;
        let xmy = cnod * cosi;
        let ux = xmx * sinsu + cnod * cossu;
        let uy = xmy * sinsu + snod * cossu;
        let uz = sini * sinsu;
        let vx = xmx * cossu - cnod * sinsu;
        let vy = xmy * cossu - snod * sinsu;
        let vz = sini * cossu;

        let mr = mrt * self.grav.radiusearthkm;
        let r = [mr * ux, mr * uy, mr * uz];
        let v = [
            (mvt * ux + rvdot * vx) * vkmpersec,
            (mvt * uy + rvdot * vy) * vkmpersec,
            (mvt * uz + rvdot * vz) * vkmpersec,
        ];

        if mrt < 1.0 {
            return Err(6);
        }
        Ok((r, v))
    }

    /// Port of `dpper`: lunar-solar periodic contributions. `init = true` is the
    /// element-time call (computes coefficients only); `init = false` applies the
    /// periodics to the orbital elements at time `t` (minutes).
    #[allow(clippy::too_many_arguments)]
    fn dpper(
        &self,
        t: f64,
        init: bool,
        mut ep: f64,
        mut inclp: f64,
        mut nodep: f64,
        mut argpp: f64,
        mut mp: f64,
    ) -> (f64, f64, f64, f64, f64) {
        let zns = 1.194_59e-5;
        let zes = 0.016_75;
        let znl = 1.583_521_8e-4;
        let zel = 0.054_90;

        let mut zm = self.zmos + zns * t;
        if init {
            zm = self.zmos;
        }
        let mut zf = zm + 2.0 * zes * zm.sin();
        let mut sinzf = zf.sin();
        let mut f2 = 0.5 * sinzf * sinzf - 0.25;
        let mut f3 = -0.5 * sinzf * zf.cos();
        let ses = self.se2 * f2 + self.se3 * f3;
        let sis = self.si2 * f2 + self.si3 * f3;
        let sls = self.sl2 * f2 + self.sl3 * f3 + self.sl4 * sinzf;
        let sghs = self.sgh2 * f2 + self.sgh3 * f3 + self.sgh4 * sinzf;
        let shs = self.sh2 * f2 + self.sh3 * f3;
        zm = self.zmol + znl * t;
        if init {
            zm = self.zmol;
        }
        zf = zm + 2.0 * zel * zm.sin();
        sinzf = zf.sin();
        f2 = 0.5 * sinzf * sinzf - 0.25;
        f3 = -0.5 * sinzf * zf.cos();
        let sel = self.ee2 * f2 + self.e3 * f3;
        let sil = self.xi2 * f2 + self.xi3 * f3;
        let sll = self.xl2 * f2 + self.xl3 * f3 + self.xl4 * sinzf;
        let sghl = self.xgh2 * f2 + self.xgh3 * f3 + self.xgh4 * sinzf;
        let shll = self.xh2 * f2 + self.xh3 * f3;
        let mut pe = ses + sel;
        let mut pinc = sis + sil;
        let mut pl = sls + sll;
        let mut pgh = sghs + sghl;
        let mut ph = shs + shll;

        if !init {
            pe -= self.peo;
            pinc -= self.pinco;
            pl -= self.plo;
            pgh -= self.pgho;
            ph -= self.pho;
            inclp += pinc;
            ep += pe;
            let sinip = inclp.sin();
            let cosip = inclp.cos();

            if inclp >= 0.2 {
                ph /= sinip;
                pgh -= cosip * ph;
                argpp += pgh;
                nodep += ph;
                mp += pl;
            } else {
                // Lyddane modification near zero inclination.
                let sinop = nodep.sin();
                let cosop = nodep.cos();
                let mut alfdp = sinip * sinop;
                let mut betdp = sinip * cosop;
                let dalf = ph * cosop + pinc * cosip * sinop;
                let dbet = -ph * sinop + pinc * cosip * cosop;
                alfdp += dalf;
                betdp += dbet;
                nodep = fmod2pi(nodep);
                if nodep < 0.0 && self.afspc {
                    nodep += TWO_PI;
                }
                let xls = mp + argpp + pl + pgh + (cosip - pinc * sinip) * nodep;
                let xnoh = nodep;
                nodep = alfdp.atan2(betdp);
                if nodep < 0.0 && self.afspc {
                    nodep += TWO_PI;
                }
                if (xnoh - nodep).abs() > PI {
                    if nodep < xnoh {
                        nodep += TWO_PI;
                    } else {
                        nodep -= TWO_PI;
                    }
                }
                mp += pl;
                argpp = xls - mp - cosip * nodep;
            }
        }
        (ep, inclp, nodep, argpp, mp)
    }

    /// Port of `dspace`: deep-space secular and resonance contributions at time
    /// `t` (minutes). The Euler-Maclaurin resonance integrator is run fresh from
    /// epoch on each call (deterministic in `t`), so the propagator stays `&self`.
    #[allow(clippy::too_many_arguments)]
    fn dspace(
        &self,
        t: f64,
        mut em: f64,
        mut argpm: f64,
        mut inclm: f64,
        mut mm: f64,
        nm: f64,
        mut nodem: f64,
    ) -> (f64, f64, f64, f64, f64, f64) {
        let fasx2 = 0.131_309_08;
        let fasx4 = 2.884_319_8;
        let fasx6 = 0.374_480_87;
        let g22 = 5.768_639_6;
        let g32 = 0.952_408_98;
        let g44 = 1.801_499_8;
        let g52 = 1.050_833_0;
        let g54 = 4.410_889_8;
        let rptim = 4.375_269_088_011_3e-3;
        let stepp = 720.0;
        let stepn = -720.0;
        let step2 = 259_200.0;

        let theta = (self.gsto + t * rptim) % TWO_PI;
        em += self.dedt * t;
        inclm += self.didt * t;
        argpm += self.domdt * t;
        nodem += self.dnodt * t;
        mm += self.dmdt * t;

        let mut nm_out = nm;
        if self.irez != 0 {
            // Fresh integrator state each call.
            let mut atime;
            let mut xni = self.no_unkozai;
            let mut xli = self.xlamo;

            let delt = if t > 0.0 { stepp } else { stepn };
            atime = 0.0;
            let mut ft = 0.0;
            let mut xndt = 0.0;
            let mut xnddt = 0.0;
            let mut xldot = 0.0;

            let mut iterating = true;
            while iterating {
                if self.irez != 2 {
                    // Near-synchronous (one-day) resonance.
                    xndt = self.del1 * (xli - fasx2).sin()
                        + self.del2 * (2.0 * (xli - fasx4)).sin()
                        + self.del3 * (3.0 * (xli - fasx6)).sin();
                    xldot = xni + self.xfact;
                    xnddt = self.del1 * (xli - fasx2).cos()
                        + 2.0 * self.del2 * (2.0 * (xli - fasx4)).cos()
                        + 3.0 * self.del3 * (3.0 * (xli - fasx6)).cos();
                    xnddt *= xldot;
                } else {
                    // Near-half-day resonance.
                    let xomi = self.argpo + self.argpdot * atime;
                    let x2omi = xomi + xomi;
                    let x2li = xli + xli;
                    xndt = self.d2201 * (x2omi + xli - g22).sin()
                        + self.d2211 * (xli - g22).sin()
                        + self.d3210 * (xomi + xli - g32).sin()
                        + self.d3222 * (-xomi + xli - g32).sin()
                        + self.d4410 * (x2omi + x2li - g44).sin()
                        + self.d4422 * (x2li - g44).sin()
                        + self.d5220 * (xomi + xli - g52).sin()
                        + self.d5232 * (-xomi + xli - g52).sin()
                        + self.d5421 * (xomi + x2li - g54).sin()
                        + self.d5433 * (-xomi + x2li - g54).sin();
                    xldot = xni + self.xfact;
                    xnddt = self.d2201 * (x2omi + xli - g22).cos()
                        + self.d2211 * (xli - g22).cos()
                        + self.d3210 * (xomi + xli - g32).cos()
                        + self.d3222 * (-xomi + xli - g32).cos()
                        + self.d5220 * (xomi + xli - g52).cos()
                        + self.d5232 * (-xomi + xli - g52).cos()
                        + 2.0
                            * (self.d4410 * (x2omi + x2li - g44).cos()
                                + self.d4422 * (x2li - g44).cos()
                                + self.d5421 * (xomi + x2li - g54).cos()
                                + self.d5433 * (-xomi + x2li - g54).cos());
                    xnddt *= xldot;
                }

                if (t - atime).abs() >= stepp {
                    xli += xldot * delt + xndt * step2;
                    xni += xndt * delt + xnddt * step2;
                    atime += delt;
                } else {
                    ft = t - atime;
                    iterating = false;
                }
            }

            // nm = no + (nm - no) is an identity, so the reference's dndt round-trip
            // is omitted; nm_out is the integrated mean motion directly.
            nm_out = xni + xndt * ft + xnddt * ft * ft * 0.5;
            let xl = xli + xldot * ft + xndt * ft * ft * 0.5;
            if self.irez != 1 {
                mm = xl - 2.0 * nodem + 2.0 * theta;
            } else {
                mm = xl - nodem - argpm + theta;
            }
        }

        (em, argpm, inclm, mm, nm_out, nodem)
    }
}

/// Locals produced by [`Sgp4::dscom`] that [`Sgp4::dsinit`] consumes.
struct Dscom {
    sinim: f64,
    em: f64,
    emsq: f64,
    nm: f64,
    s1: f64,
    s2: f64,
    s3: f64,
    s4: f64,
    s5: f64,
    ss1: f64,
    ss2: f64,
    ss3: f64,
    ss4: f64,
    ss5: f64,
    sz1: f64,
    sz3: f64,
    sz11: f64,
    sz13: f64,
    sz21: f64,
    sz23: f64,
    sz31: f64,
    sz33: f64,
    z1: f64,
    z3: f64,
    z11: f64,
    z13: f64,
    z21: f64,
    z23: f64,
    z31: f64,
    z33: f64,
}

impl Sgp4 {
    /// Port of `dscom`: deep-space common quantities (lunar-solar geometry) shared
    /// by the secular and periodic routines. Stores the periodic coefficients onto
    /// `self` and returns the locals `dsinit` needs.
    fn dscom(&mut self, epoch: f64, tc: f64) -> Dscom {
        let zes = 0.016_75;
        let zel = 0.054_90;
        let c1ss = 2.986_479_7e-6;
        let c1l = 4.796_806_5e-7;
        let zsinis = 0.397_854_16;
        let zcosis = 0.917_448_67;
        let zcosgs = 0.194_590_5;
        let zsings = -0.980_884_58;

        let nm = self.no_unkozai;
        let em = self.ecco;
        let snodm = self.nodeo.sin();
        let cnodm = self.nodeo.cos();
        let sinomm = self.argpo.sin();
        let cosomm = self.argpo.cos();
        let sinim = self.inclo.sin();
        let cosim = self.inclo.cos();
        let emsq = em * em;
        let betasq = 1.0 - emsq;
        let rtemsq = betasq.sqrt();

        self.peo = 0.0;
        self.pinco = 0.0;
        self.plo = 0.0;
        self.pgho = 0.0;
        self.pho = 0.0;
        let day = epoch + 18_261.5 + tc / 1440.0;
        let xnodce = (4.523_602_0 - 9.242_202_9e-4 * day) % TWO_PI;
        let stem = xnodce.sin();
        let ctem = xnodce.cos();
        let zcosil = 0.913_751_64 - 0.035_680_96 * ctem;
        let zsinil = (1.0 - zcosil * zcosil).sqrt();
        let zsinhl = 0.089_683_511 * stem / zsinil;
        let zcoshl = (1.0 - zsinhl * zsinhl).sqrt();
        let gam = 5.835_151_4 + 0.001_944_368_0 * day;
        let mut zx = 0.397_854_16 * stem / zsinil;
        let zy = zcoshl * ctem + 0.917_448_67 * zsinhl * stem;
        zx = zx.atan2(zy);
        zx = gam + zx - xnodce;
        let zcosgl = zx.cos();
        let zsingl = zx.sin();

        let mut zcosg = zcosgs;
        let mut zsing = zsings;
        let mut zcosi = zcosis;
        let mut zsini = zsinis;
        let mut zcosh = cnodm;
        let mut zsinh = snodm;
        let mut cc = c1ss;
        let xnoi = 1.0 / nm;

        let mut s1 = 0.0;
        let mut s2 = 0.0;
        let mut s3 = 0.0;
        let mut s4 = 0.0;
        let mut s5 = 0.0;
        let mut s6 = 0.0;
        let mut s7 = 0.0;
        let (mut ss1, mut ss2, mut ss3, mut ss4, mut ss5, mut ss6, mut ss7) =
            (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
        let (mut sz1, mut sz2, mut sz3) = (0.0, 0.0, 0.0);
        let (mut sz11, mut sz12, mut sz13) = (0.0, 0.0, 0.0);
        let (mut sz21, mut sz22, mut sz23) = (0.0, 0.0, 0.0);
        let (mut sz31, mut sz32, mut sz33) = (0.0, 0.0, 0.0);
        let mut z1 = 0.0;
        let mut z2 = 0.0;
        let mut z3 = 0.0;
        let (mut z11, mut z12, mut z13) = (0.0, 0.0, 0.0);
        let (mut z21, mut z22, mut z23) = (0.0, 0.0, 0.0);
        let (mut z31, mut z32, mut z33) = (0.0, 0.0, 0.0);

        for lsflg in 1..=2 {
            let a1 = zcosg * zcosh + zsing * zcosi * zsinh;
            let a3 = -zsing * zcosh + zcosg * zcosi * zsinh;
            let a7 = -zcosg * zsinh + zsing * zcosi * zcosh;
            let a8 = zsing * zsini;
            let a9 = zsing * zsinh + zcosg * zcosi * zcosh;
            let a10 = zcosg * zsini;
            let a2 = cosim * a7 + sinim * a8;
            let a4 = cosim * a9 + sinim * a10;
            let a5 = -sinim * a7 + cosim * a8;
            let a6 = -sinim * a9 + cosim * a10;

            let x1 = a1 * cosomm + a2 * sinomm;
            let x2 = a3 * cosomm + a4 * sinomm;
            let x3 = -a1 * sinomm + a2 * cosomm;
            let x4 = -a3 * sinomm + a4 * cosomm;
            let x5 = a5 * sinomm;
            let x6 = a6 * sinomm;
            let x7 = a5 * cosomm;
            let x8 = a6 * cosomm;

            z31 = 12.0 * x1 * x1 - 3.0 * x3 * x3;
            z32 = 24.0 * x1 * x2 - 6.0 * x3 * x4;
            z33 = 12.0 * x2 * x2 - 3.0 * x4 * x4;
            z1 = 3.0 * (a1 * a1 + a2 * a2) + z31 * emsq;
            z2 = 6.0 * (a1 * a3 + a2 * a4) + z32 * emsq;
            z3 = 3.0 * (a3 * a3 + a4 * a4) + z33 * emsq;
            z11 = -6.0 * a1 * a5 + emsq * (-24.0 * x1 * x7 - 6.0 * x3 * x5);
            z12 = -6.0 * (a1 * a6 + a3 * a5)
                + emsq * (-24.0 * (x2 * x7 + x1 * x8) - 6.0 * (x3 * x6 + x4 * x5));
            z13 = -6.0 * a3 * a6 + emsq * (-24.0 * x2 * x8 - 6.0 * x4 * x6);
            z21 = 6.0 * a2 * a5 + emsq * (24.0 * x1 * x5 - 6.0 * x3 * x7);
            z22 = 6.0 * (a4 * a5 + a2 * a6)
                + emsq * (24.0 * (x2 * x5 + x1 * x6) - 6.0 * (x4 * x7 + x3 * x8));
            z23 = 6.0 * a4 * a6 + emsq * (24.0 * x2 * x6 - 6.0 * x4 * x8);
            z1 = z1 + z1 + betasq * z31;
            z2 = z2 + z2 + betasq * z32;
            z3 = z3 + z3 + betasq * z33;
            s3 = cc * xnoi;
            s2 = -0.5 * s3 / rtemsq;
            s4 = s3 * rtemsq;
            s1 = -15.0 * em * s4;
            s5 = x1 * x3 + x2 * x4;
            s6 = x2 * x3 + x1 * x4;
            s7 = x2 * x4 - x1 * x3;

            if lsflg == 1 {
                ss1 = s1;
                ss2 = s2;
                ss3 = s3;
                ss4 = s4;
                ss5 = s5;
                ss6 = s6;
                ss7 = s7;
                sz1 = z1;
                sz2 = z2;
                sz3 = z3;
                sz11 = z11;
                sz12 = z12;
                sz13 = z13;
                sz21 = z21;
                sz22 = z22;
                sz23 = z23;
                sz31 = z31;
                sz32 = z32;
                sz33 = z33;
                zcosg = zcosgl;
                zsing = zsingl;
                zcosi = zcosil;
                zsini = zsinil;
                zcosh = zcoshl * cnodm + zsinhl * snodm;
                zsinh = snodm * zcoshl - cnodm * zsinhl;
                cc = c1l;
            }
        }

        self.zmol = fmod2pi(4.719_967_2 + 0.229_971_50 * day - gam);
        self.zmos = fmod2pi(6.256_583_7 + 0.017_201_977 * day);

        // Solar terms.
        self.se2 = 2.0 * ss1 * ss6;
        self.se3 = 2.0 * ss1 * ss7;
        self.si2 = 2.0 * ss2 * sz12;
        self.si3 = 2.0 * ss2 * (sz13 - sz11);
        self.sl2 = -2.0 * ss3 * sz2;
        self.sl3 = -2.0 * ss3 * (sz3 - sz1);
        self.sl4 = -2.0 * ss3 * (-21.0 - 9.0 * emsq) * zes;
        self.sgh2 = 2.0 * ss4 * sz32;
        self.sgh3 = 2.0 * ss4 * (sz33 - sz31);
        self.sgh4 = -18.0 * ss4 * zes;
        self.sh2 = -2.0 * ss2 * sz22;
        self.sh3 = -2.0 * ss2 * (sz23 - sz21);

        // Lunar terms.
        self.ee2 = 2.0 * s1 * s6;
        self.e3 = 2.0 * s1 * s7;
        self.xi2 = 2.0 * s2 * z12;
        self.xi3 = 2.0 * s2 * (z13 - z11);
        self.xl2 = -2.0 * s3 * z2;
        self.xl3 = -2.0 * s3 * (z3 - z1);
        self.xl4 = -2.0 * s3 * (-21.0 - 9.0 * emsq) * zel;
        self.xgh2 = 2.0 * s4 * z32;
        self.xgh3 = 2.0 * s4 * (z33 - z31);
        self.xgh4 = -18.0 * s4 * zel;
        self.xh2 = -2.0 * s2 * z22;
        self.xh3 = -2.0 * s2 * (z23 - z21);

        Dscom {
            sinim,
            em,
            emsq,
            nm,
            s1,
            s2,
            s3,
            s4,
            s5,
            ss1,
            ss2,
            ss3,
            ss4,
            ss5,
            sz1,
            sz3,
            sz11,
            sz13,
            sz21,
            sz23,
            sz31,
            sz33,
            z1,
            z3,
            z11,
            z13,
            z21,
            z23,
            z31,
            z33,
        }
    }

    /// Port of `dsinit`: deep-space secular (lunar-solar) rates and, for 12 h / 24 h
    /// resonant orbits, the geopotential resonance coefficients and the integrator's
    /// initial conditions. Stores everything `dspace` needs onto `self`.
    #[allow(clippy::too_many_arguments)]
    fn dsinit(&mut self, ds: &Dscom, tc: f64, xpidot: f64, cosim: f64, eccsq: f64, inclm: f64) {
        let q22 = 1.789_167_9e-6;
        let q31 = 2.146_074_8e-6;
        let q33 = 2.212_301_5e-7;
        let root22 = 1.789_167_9e-6;
        let root44 = 7.363_695_3e-9;
        let root54 = 2.176_580_3e-9;
        let rptim = 4.375_269_088_011_3e-3;
        let root32 = 3.739_379_2e-7;
        let root52 = 1.142_863_9e-7;
        let znl = 1.583_521_8e-4;
        let zns = 1.194_59e-5;

        let sinim = ds.sinim;
        let emsq = ds.emsq;
        let em = ds.em;
        let nm = ds.nm;

        self.irez = 0;
        if (0.003_490_658_5..0.005_235_987_7).contains(&nm) {
            self.irez = 1;
        }
        if (8.26e-3..=9.24e-3).contains(&nm) && em >= 0.5 {
            self.irez = 2;
        }

        // Solar terms.
        let ses = ds.ss1 * zns * ds.ss5;
        let sis = ds.ss2 * zns * (ds.sz11 + ds.sz13);
        let sls = -zns * ds.ss3 * (ds.sz1 + ds.sz3 - 14.0 - 6.0 * emsq);
        let sghs = ds.ss4 * zns * (ds.sz31 + ds.sz33 - 6.0);
        let mut shs = -zns * ds.ss2 * (ds.sz21 + ds.sz23);
        if !(5.235_987_7e-2..=PI - 5.235_987_7e-2).contains(&inclm) {
            shs = 0.0;
        }
        if sinim != 0.0 {
            shs /= sinim;
        }
        let sgs = sghs - cosim * shs;

        // Lunar terms.
        self.dedt = ses + ds.s1 * znl * ds.s5;
        self.didt = sis + ds.s2 * znl * (ds.z11 + ds.z13);
        self.dmdt = sls - znl * ds.s3 * (ds.z1 + ds.z3 - 14.0 - 6.0 * emsq);
        let sghl = ds.s4 * znl * (ds.z31 + ds.z33 - 6.0);
        let mut shll = -znl * ds.s2 * (ds.z21 + ds.z23);
        if !(5.235_987_7e-2..=PI - 5.235_987_7e-2).contains(&inclm) {
            shll = 0.0;
        }
        self.domdt = sgs + sghl;
        self.dnodt = shs;
        if sinim != 0.0 {
            self.domdt -= cosim / sinim * shll;
            self.dnodt += shll / sinim;
        }

        let theta = (self.gsto + tc * rptim) % TWO_PI;

        if self.irez != 0 {
            let aonv = (nm / self.grav.xke).powf(X2O3);

            if self.irez == 2 {
                // 12 h geopotential resonance. The g-coefficients use the
                // osculating eccentricity (ecco/eccsq), not the lunar-solar em.
                let cosisq = cosim * cosim;
                let em = self.ecco;
                let emsq = eccsq;
                let eoc = em * emsq;
                let g201 = -0.306 - (em - 0.64) * 0.440;

                let (g211, g310, g322, g410, g422, g520);
                if em <= 0.65 {
                    g211 = 3.616 - 13.2470 * em + 16.2900 * emsq;
                    g310 = -19.302 + 117.3900 * em - 228.4190 * emsq + 156.5910 * eoc;
                    g322 = -18.9068 + 109.7927 * em - 214.6334 * emsq + 146.5816 * eoc;
                    g410 = -41.122 + 242.6940 * em - 471.0940 * emsq + 313.9530 * eoc;
                    g422 = -146.407 + 841.8800 * em - 1629.014 * emsq + 1083.4350 * eoc;
                    g520 = -532.114 + 3017.977 * em - 5740.032 * emsq + 3708.2760 * eoc;
                } else {
                    g211 = -72.099 + 331.819 * em - 508.738 * emsq + 266.724 * eoc;
                    g310 = -346.844 + 1582.851 * em - 2415.925 * emsq + 1246.113 * eoc;
                    g322 = -342.585 + 1554.908 * em - 2366.899 * emsq + 1215.972 * eoc;
                    g410 = -1052.797 + 4758.686 * em - 7193.992 * emsq + 3651.957 * eoc;
                    g422 = -3581.690 + 16178.110 * em - 24462.770 * emsq + 12422.520 * eoc;
                    if em > 0.715 {
                        g520 = -5149.66 + 29936.92 * em - 54087.36 * emsq + 31324.56 * eoc;
                    } else {
                        g520 = 1464.74 - 4664.75 * em + 3763.64 * emsq;
                    }
                }
                let (g533, g521, g532);
                if em < 0.7 {
                    g533 = -919.22770 + 4988.6100 * em - 9064.7700 * emsq + 5542.21 * eoc;
                    g521 = -822.71072 + 4568.6173 * em - 8491.4146 * emsq + 5337.524 * eoc;
                    g532 = -853.66600 + 4690.2500 * em - 8624.7700 * emsq + 5341.4 * eoc;
                } else {
                    g533 = -37995.780 + 161616.52 * em - 229838.20 * emsq + 109377.94 * eoc;
                    g521 = -51752.104 + 218913.95 * em - 309468.16 * emsq + 146349.42 * eoc;
                    g532 = -40023.880 + 170470.89 * em - 242699.48 * emsq + 115605.82 * eoc;
                }

                let sini2 = sinim * sinim;
                let f220 = 0.75 * (1.0 + 2.0 * cosim + cosisq);
                let f221 = 1.5 * sini2;
                let f321 = 1.875 * sinim * (1.0 - 2.0 * cosim - 3.0 * cosisq);
                let f322 = -1.875 * sinim * (1.0 + 2.0 * cosim - 3.0 * cosisq);
                let f441 = 35.0 * sini2 * f220;
                let f442 = 39.375_0 * sini2 * sini2;
                let f522 = 9.843_75
                    * sinim
                    * (sini2 * (1.0 - 2.0 * cosim - 5.0 * cosisq)
                        + 0.333_333_33 * (-2.0 + 4.0 * cosim + 6.0 * cosisq));
                let f523 = sinim
                    * (4.921_875_12 * sini2 * (-2.0 - 4.0 * cosim + 10.0 * cosisq)
                        + 6.562_500_12 * (1.0 + 2.0 * cosim - 3.0 * cosisq));
                let f542 = 29.531_25
                    * sinim
                    * (2.0 - 8.0 * cosim + cosisq * (-12.0 + 8.0 * cosim + 10.0 * cosisq));
                let f543 = 29.531_25
                    * sinim
                    * (-2.0 - 8.0 * cosim + cosisq * (12.0 + 8.0 * cosim - 10.0 * cosisq));
                let xno2 = nm * nm;
                let ainv2 = aonv * aonv;
                let mut temp1 = 3.0 * xno2 * ainv2;
                let mut temp = temp1 * root22;
                self.d2201 = temp * f220 * g201;
                self.d2211 = temp * f221 * g211;
                temp1 *= aonv;
                temp = temp1 * root32;
                self.d3210 = temp * f321 * g310;
                self.d3222 = temp * f322 * g322;
                temp1 *= aonv;
                temp = 2.0 * temp1 * root44;
                self.d4410 = temp * f441 * g410;
                self.d4422 = temp * f442 * g422;
                temp1 *= aonv;
                temp = temp1 * root52;
                self.d5220 = temp * f522 * g520;
                self.d5232 = temp * f523 * g532;
                temp = 2.0 * temp1 * root54;
                self.d5421 = temp * f542 * g521;
                self.d5433 = temp * f543 * g533;
                self.xlamo = fmod2pi(self.mo + self.nodeo + self.nodeo - theta - theta);
                self.xfact = self.mdot + self.dmdt + 2.0 * (self.nodedot + self.dnodt - rptim)
                    - self.no_unkozai;
            }

            if self.irez == 1 {
                // Synchronous (24 h) resonance.
                let g200 = 1.0 + emsq * (-2.5 + 0.812_5 * emsq);
                let g310 = 1.0 + 2.0 * emsq;
                let g300 = 1.0 + emsq * (-6.0 + 6.609_37 * emsq);
                let f220 = 0.75 * (1.0 + cosim) * (1.0 + cosim);
                let f311 = 0.937_5 * sinim * sinim * (1.0 + 3.0 * cosim) - 0.75 * (1.0 + cosim);
                let mut f330 = 1.0 + cosim;
                f330 = 1.875 * f330 * f330 * f330;
                self.del1 = 3.0 * nm * nm * aonv * aonv;
                self.del2 = 2.0 * self.del1 * f220 * g200 * q22;
                self.del3 = 3.0 * self.del1 * f330 * g300 * q33 * aonv;
                self.del1 = self.del1 * f311 * g310 * q31 * aonv;
                self.xlamo = fmod2pi(self.mo + self.nodeo + self.argpo - theta);
                self.xfact = self.mdot + xpidot - rptim + self.dmdt + self.domdt + self.dnodt
                    - self.no_unkozai;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // The WGS-84 gravity set is available alongside WGS-72, with the standard
    // constants and a consistently derived `xke` and `j3oj2`.
    #[test]
    fn wgs84_gravity_constants() {
        let g = wgs84();
        assert!((g.mu - 398_600.5).abs() < 1e-6, "mu = {}", g.mu);
        assert!((g.radiusearthkm - 6378.137).abs() < 1e-9);
        assert!((g.j2 - 0.001_082_629_989_05).abs() < 1e-15);
        assert!((g.j3 - -0.000_002_532_153_06).abs() < 1e-18);
        assert!((g.j4 - -0.000_001_610_987_61).abs() < 1e-18);
        let xke = 60.0 / (6378.137_f64.powi(3) / 398_600.5).sqrt();
        assert!((g.xke - xke).abs() < 1e-12);
        assert!((g.j3oj2 - g.j3 / g.j2).abs() < 1e-15);
        // The two models are genuinely distinct (different equatorial radius).
        assert!((g.radiusearthkm - wgs72().radiusearthkm).abs() > 1e-3);
    }

    // `GravModel` maps each named model to its constants and defaults to WGS-72,
    // the set the verification vectors use.
    #[test]
    fn grav_model_selects_constants_and_defaults_to_wgs72() {
        assert!((GravModel::Wgs72.constants().mu - wgs72().mu).abs() < 1e-9);
        assert!((GravModel::Wgs84.constants().mu - wgs84().mu).abs() < 1e-9);
        assert!((GravModel::default().constants().mu - wgs72().mu).abs() < 1e-9);
    }

    // A benign, well-conditioned short-period Kepler solve converges and returns
    // the sine/cosine of the eccentric-anomaly-like root.
    #[test]
    fn kepler_short_period_converges_for_benign_elements() {
        // Low eccentricity (|axnl,aynl| small): the damped Newton iteration
        // settles well within the ten-step reference cap.
        let (sineo1, coseo1) = kepler_short_period(0.5, 0.01, 0.005)
            .expect("benign low-eccentricity solve must converge");
        // Returned values are a genuine sine/cosine pair.
        assert!((sineo1 * sineo1 + coseo1 * coseo1 - 1.0).abs() < 1e-12);
    }

    // A degenerate parabolic geometry (eccentricity component exactly 1) makes
    // the Newton denominator `1 − axnl·cos E − aynl·sin E` vanish at the start,
    // producing a non-finite step. The solver reports this as non-convergence
    // instead of silently returning a NaN root. (Real propagation never reaches
    // here: the perturbed eccentricity is range-checked to `< 1` upstream.)
    #[test]
    fn kepler_short_period_flags_degenerate_geometry() {
        assert!(
            kepler_short_period(0.0, 1.0, 0.0).is_none(),
            "a vanishing Newton denominator (e = 1) must be reported, not returned as NaN"
        );
    }
}
