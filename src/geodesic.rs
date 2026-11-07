// SPDX-License-Identifier: AGPL-3.0-only
//! The geodesic distance on the WGS 84 ellipsoid (the inverse problem), to round-off.
//!
//! A port of the inverse solution of C. F. F. Karney, "Algorithms for geodesics", J. Geodesy 87
//! (2013) 43-55, as GeographicLib implements it (series to sixth order in the third flattening;
//! Newton's method on the azimuth with a bisection fallback; the astroid start for nearly antipodal
//! points). GeographicLib is MIT-licensed (Copyright (c) Charles Karney (2012-2022)); its notice is in
//! `NOTICE`. Only the distance is computed here. The transcendentals are Kshana's portable ones, so
//! the distance has the same bits on every platform.
//!
//! Its accuracy is checked against GeographicLib itself (`tests/geodesic.rs`): within 1e-8 m over
//! random pairs, antipodal and near-antipodal pairs, meridians, the equator and the poles.

use crate::portable_math::PortableFloat;

const A: f64 = 6_378_137.0;
const F: f64 = 1.0 / 298.257_223_563;
const NA1: usize = 6;
const NC1: usize = 6;
const NA2: usize = 6;
const NC2: usize = 6;
const NA3: usize = 6;
const NC3: usize = 6;
const MAXIT1: u32 = 20;
const MAXIT2: u32 = MAXIT1 + f64::MANTISSA_DIGITS + 10;

fn tiny() -> f64 {
    f64::MIN_POSITIVE.sqrt()
}

fn sq(x: f64) -> f64 {
    x * x
}

fn polyval(n: isize, p: &[f64], s: usize, x: f64) -> f64 {
    if n < 0 {
        return 0.0;
    }
    let mut y = p[s];
    for i in 1..=n as usize {
        y = y * x + p[s + i];
    }
    y
}

fn norm(x: f64, y: f64) -> (f64, f64) {
    let r = x.phypot(y);
    (x / r, y / r)
}

fn ang_round(x: f64) -> f64 {
    let z = 1.0 / 16.0;
    let mut y = x.abs();
    if y < z {
        y = z - (z - y);
    }
    y.copysign(x)
}

/// Remainder of `x / 360` in `[-180, 180]`.
fn rem360(x: f64) -> f64 {
    let r = x % 360.0;
    if r > 180.0 {
        r - 360.0
    } else if r < -180.0 {
        r + 360.0
    } else {
        r
    }
}

/// An error-free sum: `(s, t)` with `s + t = u + v` exactly.
fn sum(u: f64, v: f64) -> (f64, f64) {
    let s = u + v;
    let up = s - v;
    let vpp = s - up;
    let (up, vpp) = (up - u, vpp - v);
    let t = if s == 0.0 { 0.0 } else { 0.0 - (up + vpp) };
    (s, t)
}

/// `y - x` reduced to `[-180, 180]`, with its rounding error.
fn ang_diff(x: f64, y: f64) -> (f64, f64) {
    let (d, t) = sum(rem360(-x), rem360(y));
    let (d, t) = sum(rem360(d), t);
    let d = if d == 0.0 || d.abs() == 180.0 {
        d.copysign(if t == 0.0 { y - x } else { -t })
    } else {
        d
    };
    (d, t)
}

fn quadrant(q: i64, s: f64, c: f64) -> (f64, f64) {
    match q.rem_euclid(4) {
        1 => (c, -s),
        2 => (-s, -c),
        3 => (-c, s),
        _ => (s, c),
    }
}

fn sincosd(x: f64) -> (f64, f64) {
    let r = x % 360.0;
    let q = (r / 90.0).round() as i64;
    let r = (r - 90.0 * q as f64).to_radians();
    let (s, c) = quadrant(q, r.psin(), r.pcos());
    let c = c + 0.0;
    let s = if s == 0.0 { s.copysign(x) } else { s };
    (s, c)
}

fn sincosde(x: f64, t: f64) -> (f64, f64) {
    let q = (x / 90.0).round() as i64;
    let r = ang_round(x - 90.0 * q as f64 + t).to_radians();
    let (s, c) = quadrant(q, r.psin(), r.pcos());
    let c = c + 0.0;
    let s = if s == 0.0 { s.copysign(x) } else { s };
    (s, c)
}

fn sin_cos_series(sinp: bool, sinx: f64, cosx: f64, c: &[f64]) -> f64 {
    let mut k = c.len();
    let mut n = k - usize::from(sinp);
    let ar = 2.0 * (cosx - sinx) * (cosx + sinx);
    let mut y1 = 0.0;
    let mut y0 = if n & 1 == 1 {
        k -= 1;
        c[k]
    } else {
        0.0
    };
    n /= 2;
    while n > 0 {
        n -= 1;
        k -= 1;
        y1 = ar * y0 - y1 + c[k];
        k -= 1;
        y0 = ar * y1 - y0 + c[k];
    }
    if sinp {
        2.0 * sinx * cosx * y0
    } else {
        cosx * (y0 - y1)
    }
}

fn a1m1f(eps: f64) -> f64 {
    let coeff = [1.0, 4.0, 64.0, 0.0, 256.0];
    let m = (NA1 / 2) as isize;
    let t = polyval(m, &coeff, 0, sq(eps)) / coeff[m as usize + 1];
    (t + eps) / (1.0 - eps)
}

fn c1f(eps: f64, c: &mut [f64]) {
    let coeff = [
        -1.0, 6.0, -16.0, 32.0, -9.0, 64.0, -128.0, 2048.0, 9.0, -16.0, 768.0, 3.0, -5.0, 512.0,
        -7.0, 1280.0, -7.0, 2048.0,
    ];
    let eps2 = sq(eps);
    let mut d = eps;
    let mut o = 0;
    for (l, cl) in c.iter_mut().enumerate().take(NC1 + 1).skip(1) {
        let m = (NC1 - l) / 2;
        *cl = d * polyval(m as isize, &coeff, o, eps2) / coeff[o + m + 1];
        o += m + 2;
        d *= eps;
    }
}

fn a2m1f(eps: f64) -> f64 {
    let coeff = [-11.0, -28.0, -192.0, 0.0, 256.0];
    let m = (NA2 / 2) as isize;
    let t = polyval(m, &coeff, 0, sq(eps)) / coeff[m as usize + 1];
    (t - eps) / (1.0 + eps)
}

fn c2f(eps: f64, c: &mut [f64]) {
    let coeff = [
        1.0, 2.0, 16.0, 32.0, 35.0, 64.0, 384.0, 2048.0, 15.0, 80.0, 768.0, 7.0, 35.0, 512.0, 63.0,
        1280.0, 77.0, 2048.0,
    ];
    let eps2 = sq(eps);
    let mut d = eps;
    let mut o = 0;
    for (l, cl) in c.iter_mut().enumerate().take(NC2 + 1).skip(1) {
        let m = (NC2 - l) / 2;
        *cl = d * polyval(m as isize, &coeff, o, eps2) / coeff[o + m + 1];
        o += m + 2;
        d *= eps;
    }
}

/// The ellipsoid's constants and series coefficients.
struct Ell {
    f1: f64,
    ep2: f64,
    n: f64,
    b: f64,
    etol2: f64,
    a3x: [f64; NA3],
    c3x: [f64; NC3 * (NC3 - 1) / 2],
}

impl Ell {
    fn wgs84() -> Self {
        let f1 = 1.0 - F;
        let e2 = F * (2.0 - F);
        let n = F / (2.0 - F);
        let tol2 = f64::EPSILON.sqrt();
        let mut e = Ell {
            f1,
            ep2: e2 / sq(f1),
            n,
            b: A * f1,
            etol2: 0.1 * tol2 / (F.abs().max(0.001) * (1.0 - F / 2.0).min(1.0) / 2.0).sqrt(),
            a3x: [0.0; NA3],
            c3x: [0.0; NC3 * (NC3 - 1) / 2],
        };
        let a3 = [
            -3.0, 128.0, -2.0, -3.0, 64.0, -1.0, -3.0, -1.0, 16.0, 3.0, -1.0, -2.0, 8.0, 1.0, -1.0,
            2.0, 1.0, 1.0,
        ];
        let (mut o, mut k) = (0, 0);
        for j in (0..NA3).rev() {
            let m = (NA3 - j - 1).min(j);
            e.a3x[k] = polyval(m as isize, &a3, o, n) / a3[o + m + 1];
            k += 1;
            o += m + 2;
        }
        let c3 = [
            3.0, 128.0, 2.0, 5.0, 128.0, -1.0, 3.0, 3.0, 64.0, -1.0, 0.0, 1.0, 8.0, -1.0, 1.0, 4.0,
            5.0, 256.0, 1.0, 3.0, 128.0, -3.0, -2.0, 3.0, 64.0, 1.0, -3.0, 2.0, 32.0, 7.0, 512.0,
            -10.0, 9.0, 384.0, 5.0, -9.0, 5.0, 192.0, 7.0, 512.0, -14.0, 7.0, 512.0, 21.0, 2560.0,
        ];
        let (mut o, mut k) = (0, 0);
        for l in 1..NC3 {
            for j in (l..NC3).rev() {
                let m = (NC3 - j - 1).min(j);
                e.c3x[k] = polyval(m as isize, &c3, o, n) / c3[o + m + 1];
                k += 1;
                o += m + 2;
            }
        }
        e
    }

    fn a3f(&self, eps: f64) -> f64 {
        polyval(NA3 as isize - 1, &self.a3x, 0, eps)
    }

    fn c3f(&self, eps: f64, c: &mut [f64]) {
        let mut mult = 1.0;
        let mut o = 0;
        for (l, cl) in c.iter_mut().enumerate().take(NC3).skip(1) {
            let m = NC3 - l - 1;
            mult *= eps;
            *cl = mult * polyval(m as isize, &self.c3x, o, eps);
            o += m + 1;
        }
    }

    /// The distance (in units of b) and the reduced length (also in units of b).
    #[allow(clippy::too_many_arguments)]
    fn lengths(
        &self,
        eps: f64,
        sig12: f64,
        (ssig1, csig1, dn1): (f64, f64, f64),
        (ssig2, csig2, dn2): (f64, f64, f64),
        want_m: bool,
        c1a: &mut [f64; NC1 + 1],
        c2a: &mut [f64; NC2 + 1],
    ) -> (f64, f64, f64) {
        let a1 = a1m1f(eps);
        c1f(eps, c1a);
        let (mut m0x, mut a2) = (0.0, 0.0);
        if want_m {
            a2 = a2m1f(eps);
            c2f(eps, c2a);
            m0x = a1 - a2;
            a2 += 1.0;
        }
        let a1 = 1.0 + a1;
        let b1 = sin_cos_series(true, ssig2, csig2, c1a) - sin_cos_series(true, ssig1, csig1, c1a);
        let s12b = a1 * (sig12 + b1);
        let mut m12b = f64::NAN;
        if want_m {
            let b2 =
                sin_cos_series(true, ssig2, csig2, c2a) - sin_cos_series(true, ssig1, csig1, c2a);
            let j12 = m0x * sig12 + (a1 * b1 - a2 * b2);
            m12b = dn2 * (csig1 * ssig2) - dn1 * (ssig1 * csig2) - csig1 * csig2 * j12;
        }
        (s12b, m12b, m0x)
    }

    #[allow(clippy::too_many_arguments)]
    fn inverse_start(
        &self,
        (sbet1, cbet1, dn1): (f64, f64, f64),
        (sbet2, cbet2, dn2): (f64, f64, f64),
        lam12: f64,
        slam12: f64,
        clam12: f64,
        c1a: &mut [f64; NC1 + 1],
        c2a: &mut [f64; NC2 + 1],
    ) -> (f64, f64, f64, f64) {
        let _ = (dn1, dn2, c1a, c2a);
        let mut sig12 = -1.0;
        let mut dnm = f64::NAN;
        let sbet12 = sbet2 * cbet1 - cbet2 * sbet1;
        let cbet12 = cbet2 * cbet1 + sbet2 * sbet1;
        let sbet12a = sbet2 * cbet1 + cbet2 * sbet1;
        let shortline = cbet12 >= 0.0 && sbet12 < 0.5 && cbet2 * lam12 < 0.5;
        let (mut somg12, mut comg12) = (slam12, clam12);
        if shortline {
            let mut sbetm2 = sq(sbet1 + sbet2);
            sbetm2 /= sbetm2 + sq(cbet1 + cbet2);
            dnm = (1.0 + self.ep2 * sbetm2).sqrt();
            let omg12 = lam12 / (self.f1 * dnm);
            somg12 = omg12.psin();
            comg12 = omg12.pcos();
        }
        let mut salp1 = cbet2 * somg12;
        let mut calp1 = if comg12 >= 0.0 {
            sbet12 + cbet2 * sbet1 * sq(somg12) / (1.0 + comg12)
        } else {
            sbet12a - cbet2 * sbet1 * sq(somg12) / (1.0 - comg12)
        };
        let ssig12 = salp1.phypot(calp1);
        let csig12 = sbet1 * sbet2 + cbet1 * cbet2 * comg12;
        if shortline && ssig12 < self.etol2 {
            sig12 = ssig12.patan2(csig12);
        } else if self.n.abs() >= 0.1
            || csig12 >= 0.0
            || ssig12 >= 6.0 * self.n.abs() * std::f64::consts::PI * sq(cbet1)
        {
            // The short-line or spherical start is good enough.
        } else {
            let lam12x = (-slam12).patan2(-clam12);
            let k2 = sq(sbet1) * self.ep2;
            let eps = k2 / (2.0 * (1.0 + (1.0 + k2).sqrt()) + k2);
            let lamscale = F * cbet1 * self.a3f(eps) * std::f64::consts::PI;
            let betscale = lamscale * cbet1;
            let x = lam12x / lamscale;
            let y = sbet12a / betscale;
            let tol1 = 200.0 * f64::EPSILON;
            let xthresh = 1000.0 * f64::EPSILON.sqrt();
            if y > -tol1 && x > -1.0 - xthresh {
                salp1 = (-x).min(1.0);
                calp1 = -(1.0 - sq(salp1)).sqrt();
            } else {
                let k = astroid(x, y);
                let omg12a = lamscale * (-x * k / (1.0 + k));
                somg12 = omg12a.psin();
                comg12 = -omg12a.pcos();
                salp1 = cbet2 * somg12;
                calp1 = sbet12a - cbet2 * sbet1 * sq(somg12) / (1.0 - comg12);
            }
        }
        if salp1 > 0.0 {
            let (s, c) = norm(salp1, calp1);
            salp1 = s;
            calp1 = c;
        } else {
            salp1 = 1.0;
            calp1 = 0.0;
        }
        (sig12, salp1, calp1, dnm)
    }
}

fn astroid(x: f64, y: f64) -> f64 {
    let p = sq(x);
    let q = sq(y);
    let r = (p + q - 1.0) / 6.0;
    if q == 0.0 && r <= 0.0 {
        return 0.0;
    }
    let s = p * q / 4.0;
    let r2 = sq(r);
    let r3 = r * r2;
    let disc = s * (s + 2.0 * r3);
    let mut u = r;
    if disc >= 0.0 {
        let mut t3 = s + r3;
        t3 += if t3 < 0.0 { -disc.sqrt() } else { disc.sqrt() };
        let t = t3.pcbrt();
        u += t + if t != 0.0 { r2 / t } else { 0.0 };
    } else {
        let ang = (-disc).sqrt().patan2(-(s + r3));
        u += 2.0 * r * (ang / 3.0).pcos();
    }
    let v = (sq(u) + q).sqrt();
    let uv = if u < 0.0 { q / (v - u) } else { u + v };
    let w = (uv - q) / (2.0 * v);
    uv / ((uv + sq(w)).sqrt() + w)
}

/// The WGS 84 geodesic distance between two points (degrees), in metres.
pub fn distance_m(lat1: f64, lon1: f64, lat2: f64, lon2: f64) -> f64 {
    let e = Ell::wgs84();
    let tiny = tiny();
    let tol0 = f64::EPSILON;
    let tolb = tol0 * tol0.sqrt();
    let (lon12, lon12s) = ang_diff(lon1, lon2);
    let lonsign = 1.0f64.copysign(lon12);
    let lon12 = lonsign * lon12;
    let lon12s = lonsign * lon12s;
    let lam12 = lon12.to_radians();
    let (slam12, clam12) = sincosde(lon12, lon12s);
    let lon12s = (180.0 - lon12) - lon12s;
    let (mut lat1, mut lat2) = (ang_round(lat1), ang_round(lat2));
    if lat1.abs() < lat2.abs() || lat2.is_nan() {
        std::mem::swap(&mut lat1, &mut lat2);
    }
    let latsign = 1.0f64.copysign(-lat1);
    lat1 *= latsign;
    lat2 *= latsign;
    let (s1, c1) = sincosd(lat1);
    let (mut sbet1, mut cbet1) = norm(s1 * e.f1, c1);
    cbet1 = cbet1.max(tiny);
    let (s2, c2) = sincosd(lat2);
    let (mut sbet2, mut cbet2) = norm(s2 * e.f1, c2);
    cbet2 = cbet2.max(tiny);
    if cbet1 < -sbet1 {
        if cbet2 == cbet1 {
            sbet2 = sbet1.copysign(sbet2);
        }
    } else if sbet2.abs() == -sbet1 {
        cbet2 = cbet1;
    }
    let _ = &mut sbet1;
    let dn1 = (1.0 + e.ep2 * sq(sbet1)).sqrt();
    let dn2 = (1.0 + e.ep2 * sq(sbet2)).sqrt();
    let mut c1a = [0.0; NC1 + 1];
    let mut c2a = [0.0; NC2 + 1];
    let mut c3a = [0.0; NC3];

    let mut meridian = lat1 == -90.0 || slam12 == 0.0;
    let mut s12x = 0.0;
    if meridian {
        let (calp1, salp1) = (clam12, slam12);
        let (calp2, _salp2) = (1.0, 0.0);
        let _ = salp1;
        let (ssig1, csig1) = (sbet1, calp1 * cbet1);
        let (ssig2, csig2) = (sbet2, calp2 * cbet2);
        let mut sig12 =
            ((csig1 * ssig2 - ssig1 * csig2).max(0.0) + 0.0).patan2(csig1 * csig2 + ssig1 * ssig2);
        let (mut s, mut m, _) = e.lengths(
            e.n,
            sig12,
            (ssig1, csig1, dn1),
            (ssig2, csig2, dn2),
            true,
            &mut c1a,
            &mut c2a,
        );
        if sig12 < 1.0 || m >= 0.0 {
            if sig12 < 3.0 * tiny || (sig12 < tol0 && (s < 0.0 || m < 0.0)) {
                sig12 = 0.0;
                m = 0.0;
                s = 0.0;
            }
            let _ = (sig12, m);
            s12x = s * e.b;
        } else {
            meridian = false;
        }
    }
    if !meridian && sbet1 == 0.0 && (F <= 0.0 || lon12s >= F * 180.0) {
        s12x = A * lam12;
    } else if !meridian {
        let (sig12, mut salp1, mut calp1, dnm) = e.inverse_start(
            (sbet1, cbet1, dn1),
            (sbet2, cbet2, dn2),
            lam12,
            slam12,
            clam12,
            &mut c1a,
            &mut c2a,
        );
        if sig12 >= 0.0 {
            s12x = sig12 * e.b * dnm;
        } else {
            let mut numit = 0;
            let (mut tripn, mut tripb) = (false, false);
            let (mut salp1a, mut calp1a) = (tiny, 1.0);
            let (mut salp1b, mut calp1b) = (tiny, -1.0);
            let mut last = None;
            while numit < MAXIT2 {
                let r = lambda12(
                    &e,
                    (sbet1, cbet1, dn1),
                    (sbet2, cbet2, dn2),
                    salp1,
                    calp1,
                    slam12,
                    clam12,
                    numit < MAXIT1,
                    &mut c1a,
                    &mut c2a,
                    &mut c3a,
                );
                let (v, dv) = (r.0, r.6);
                last = Some(r);
                if tripb || v.abs() < (if tripn { 8.0 } else { 1.0 }) * tol0 {
                    break;
                }
                if v > 0.0 && (numit > MAXIT1 || calp1 / salp1 > calp1b / salp1b) {
                    salp1b = salp1;
                    calp1b = calp1;
                } else if v < 0.0 && (numit > MAXIT1 || calp1 / salp1 < calp1a / salp1a) {
                    salp1a = salp1;
                    calp1a = calp1;
                }
                numit += 1;
                if numit < MAXIT1 && dv > 0.0 {
                    let dalp1 = -v / dv;
                    let (sdalp1, cdalp1) = (dalp1.psin(), dalp1.pcos());
                    let nsalp1 = salp1 * cdalp1 + calp1 * sdalp1;
                    if nsalp1 > 0.0 && dalp1.abs() < std::f64::consts::PI {
                        calp1 = calp1 * cdalp1 - salp1 * sdalp1;
                        salp1 = nsalp1;
                        let (s, c) = norm(salp1, calp1);
                        salp1 = s;
                        calp1 = c;
                        tripn = v.abs() <= 16.0 * tol0;
                        continue;
                    }
                }
                salp1 = (salp1a + salp1b) / 2.0;
                calp1 = (calp1a + calp1b) / 2.0;
                let (s, c) = norm(salp1, calp1);
                salp1 = s;
                calp1 = c;
                tripn = false;
                tripb = (salp1a - salp1).abs() + (calp1a - calp1) < tolb
                    || (salp1 - salp1b).abs() + (calp1 - calp1b) < tolb;
            }
            let (_, sig12, ssig1, csig1, ssig2, csig2, _, eps) =
                last.expect("the loop runs at least once");
            let (s, _, _) = e.lengths(
                eps,
                sig12,
                (ssig1, csig1, dn1),
                (ssig2, csig2, dn2),
                false,
                &mut c1a,
                &mut c2a,
            );
            s12x = s * e.b;
        }
    }
    0.0 + s12x
}

/// One evaluation of the longitude difference for a trial azimuth: (error, sig12, ssig1, csig1,
/// ssig2, csig2, its derivative, eps).
#[allow(clippy::too_many_arguments)]
fn lambda12(
    e: &Ell,
    (sbet1, cbet1, dn1): (f64, f64, f64),
    (sbet2, cbet2, dn2): (f64, f64, f64),
    salp1: f64,
    calp1: f64,
    slam120: f64,
    clam120: f64,
    diffp: bool,
    c1a: &mut [f64; NC1 + 1],
    c2a: &mut [f64; NC2 + 1],
    c3a: &mut [f64; NC3],
) -> (f64, f64, f64, f64, f64, f64, f64, f64) {
    let calp1 = if sbet1 == 0.0 && calp1 == 0.0 {
        -tiny()
    } else {
        calp1
    };
    let salp0 = salp1 * cbet1;
    let calp0 = calp1.phypot(salp1 * sbet1);
    let somg1 = salp0 * sbet1;
    let comg1 = calp1 * cbet1;
    let (ssig1, csig1) = norm(sbet1, comg1);
    let salp2 = if cbet2 != cbet1 { salp0 / cbet2 } else { salp1 };
    let _ = salp2;
    let calp2 = if cbet2 != cbet1 || sbet2.abs() != -sbet1 {
        (sq(calp1 * cbet1)
            + if cbet1 < -sbet1 {
                (cbet2 - cbet1) * (cbet1 + cbet2)
            } else {
                (sbet1 - sbet2) * (sbet1 + sbet2)
            })
        .sqrt()
            / cbet2
    } else {
        calp1.abs()
    };
    let somg2 = salp0 * sbet2;
    let comg2 = calp2 * cbet2;
    let (ssig2, csig2) = norm(sbet2, comg2);
    let sig12 =
        ((csig1 * ssig2 - ssig1 * csig2).max(0.0) + 0.0).patan2(csig1 * csig2 + ssig1 * ssig2);
    let somg12 = (comg1 * somg2 - somg1 * comg2).max(0.0) + 0.0;
    let comg12 = comg1 * comg2 + somg1 * somg2;
    let eta = (somg12 * clam120 - comg12 * slam120).patan2(comg12 * clam120 + somg12 * slam120);
    let k2 = sq(calp0) * e.ep2;
    let eps = k2 / (2.0 * (1.0 + (1.0 + k2).sqrt()) + k2);
    e.c3f(eps, c3a);
    let b312 = sin_cos_series(true, ssig2, csig2, c3a) - sin_cos_series(true, ssig1, csig1, c3a);
    let domg12 = -F * e.a3f(eps) * salp0 * (sig12 + b312);
    let lam12 = eta + domg12;
    let dlam12 = if diffp {
        if calp2 == 0.0 {
            -2.0 * e.f1 * dn1 / sbet1
        } else {
            let (_, m, _) = e.lengths(
                eps,
                sig12,
                (ssig1, csig1, dn1),
                (ssig2, csig2, dn2),
                true,
                c1a,
                c2a,
            );
            m * e.f1 / (calp2 * cbet2)
        }
    } else {
        f64::NAN
    };
    (lam12, sig12, ssig1, csig1, ssig2, csig2, dlam12, eps)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_equator_and_a_meridian_quadrant() {
        // On the equator the geodesic is the arc while it is shorter than the antipodal limit.
        let d = distance_m(0.0, 0.0, 0.0, 0.01);
        assert!((d - 1113.194_907_932_735_7).abs() < 1e-9, "{d}");
        // The meridian quadrant of WGS 84, as GeographicLib gives it.
        let q = distance_m(0.0, 0.0, 90.0, 0.0);
        assert!((q - 10_001_965.729_312_724).abs() < 1e-7, "{q}");
        assert_eq!(distance_m(12.0, 34.0, 12.0, 34.0), 0.0);
    }
}
