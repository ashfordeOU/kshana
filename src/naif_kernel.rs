// SPDX-License-Identifier: AGPL-3.0-only
//! A pure-Rust reader for the binary kernels of the NAIF (Navigation and Ancillary Information
//! Facility, NASA Jet Propulsion Laboratory) SPICE system: the Double-precision Array File (DAF)
//! container, Spacecraft and Planet Kernel (SPK) segments of type 2 (Chebyshev position) and
//! binary Planetary Constants Kernel (PCK) segments of type 2 (Chebyshev Euler angles).
//!
//! Written from the public NAIF "DAF Required Reading", "SPK Required Reading" and "PCK
//! Required Reading" documents; no SPICE or third-party kernel-reader code is used. This is
//! what lets the engine evaluate the JPL Development Ephemeris DE440 (`de440s.bsp`), the DE440
//! lunar principal-axis orientation (`moon_pa_de440_200625.bpc`) and the high-precision Earth
//! orientation (`earth_latest_high_prec.bpc`, ITRF93 with polar motion, UT1 and nutation) without a
//! foreign dependency.
//!
//! ## Format, as implemented
//!
//! * The file record (the first 1024-byte record) holds the identification word (`DAF/SPK`,
//!   `DAF/PCK`), the summary sizes `ND` (doubles) and `NI` (integers), the first summary record
//!   and the binary format (`LTL-IEEE` or `BIG-IEEE`; both are read).
//! * Summary records form a doubly linked list; each starts with (next, previous, count) and
//!   holds `count` summaries of `ND + (NI + 1) / 2` doubles, the integers packed two per double.
//!   The record after each summary record holds the segment names.
//! * Addresses are 1-based indices of 8-byte words.
//! * An SPK summary is (start, end; target, centre, frame, type, first address, last address);
//!   a binary PCK summary is (start, end; body frame, reference frame, type, first, last).
//! * A type-2 segment ends with (INIT, INTLEN, RSIZE, N): N records of RSIZE doubles, each
//!   (MID, RADIUS, then three Chebyshev coefficient sets of `(RSIZE − 2) / 3` terms), record
//!   `i` covering `[INIT + i·INTLEN, INIT + (i + 1)·INTLEN]`. The value at `t` is
//!   `Σ cₖ Tₖ(s)` with `s = (t − MID) / RADIUS`; derivatives divide by RADIUS per order.
//! * SPK type 2 gives kilometres (velocity by differentiation); PCK type 2 gives the 3-1-3
//!   Euler angles `(φ, δ, w)` in radians, the rotation from the reference frame to the body
//!   frame being `R = R_z(w) · R_x(δ) · R_z(φ)`.
//!
//! Time arguments are TDB seconds past J2000 (SPICE "ET") given in two parts, `(hi, lo)`, so a
//! sub-microsecond offset from a whole-second epoch keeps its precision: `t − MID` is formed as
//! `(hi − MID) + lo`.
//!
//! [`naif_et_from_utc`] converts UTC to ET with the constants of the NAIF leapseconds kernel
//! (the convention under which SPICE users index these kernels, and with which the Earth
//! orientation kernel was produced; it differs from the full Fairhead-Bretagnon TDB by up to a
//! few tens of microseconds).

// Index loops read more plainly than iterator chains in the 3x3 matrix and record code here.
#![allow(clippy::needless_range_loop)]

use crate::precession::Vec3;

/// A 3x3 matrix, row-major.
pub type Mat3 = [[f64; 3]; 3];

/// Bytes per DAF record.
const RECORD_BYTES: usize = 1024;

/// One DAF segment summary.
#[derive(Clone, Debug)]
pub struct DafSummary {
    /// The `ND` double components.
    pub doubles: Vec<f64>,
    /// The `NI` integer components.
    pub ints: Vec<i32>,
    /// The segment name.
    pub name: String,
}

/// An opened DAF file held in memory.
#[derive(Clone, Debug)]
pub struct DafFile {
    bytes: Vec<u8>,
    little_endian: bool,
    /// The identification word, e.g. `DAF/SPK`.
    pub id_word: String,
    nd: usize,
    ni: usize,
    first_summary: usize,
}

impl DafFile {
    /// Parse a DAF from its bytes.
    pub fn from_bytes(bytes: Vec<u8>) -> Result<Self, String> {
        if bytes.len() < RECORD_BYTES {
            return Err("not a DAF: shorter than one record".into());
        }
        let id_word = String::from_utf8_lossy(&bytes[0..8]).trim().to_string();
        if !id_word.starts_with("DAF/") {
            return Err(format!("not a DAF: identification word {id_word:?}"));
        }
        let fmt = String::from_utf8_lossy(&bytes[88..96]).to_string();
        let little_endian = match fmt.as_str() {
            "LTL-IEEE" => true,
            "BIG-IEEE" => false,
            other => return Err(format!("unsupported DAF binary format {other:?}")),
        };
        let int_at = |off: usize| -> i32 {
            let b: [u8; 4] = bytes[off..off + 4].try_into().expect("4 bytes");
            if little_endian {
                i32::from_le_bytes(b)
            } else {
                i32::from_be_bytes(b)
            }
        };
        let nd = int_at(8);
        let ni = int_at(12);
        let fward = int_at(76);
        if !(0..=124).contains(&nd) || !(2..=250).contains(&ni) || fward < 2 {
            return Err(format!(
                "implausible DAF header: ND {nd}, NI {ni}, FWARD {fward}"
            ));
        }
        Ok(Self {
            bytes,
            little_endian,
            id_word,
            nd: nd as usize,
            ni: ni as usize,
            first_summary: fward as usize,
        })
    }

    /// Read a DAF from disk.
    pub fn open(path: &std::path::Path) -> Result<Self, String> {
        let bytes = std::fs::read(path).map_err(|e| format!("read {}: {e}", path.display()))?;
        Self::from_bytes(bytes)
    }

    /// The double at 1-based word address `addr`.
    fn word(&self, addr: usize) -> Result<f64, String> {
        let off = (addr - 1) * 8;
        let b: [u8; 8] = self
            .bytes
            .get(off..off + 8)
            .ok_or_else(|| format!("DAF address {addr} beyond the end of the file"))?
            .try_into()
            .expect("8 bytes");
        Ok(if self.little_endian {
            f64::from_le_bytes(b)
        } else {
            f64::from_be_bytes(b)
        })
    }

    /// The 4-byte integer at byte offset `off`.
    fn int_at_byte(&self, off: usize) -> i32 {
        let b: [u8; 4] = self.bytes[off..off + 4].try_into().expect("4 bytes");
        if self.little_endian {
            i32::from_le_bytes(b)
        } else {
            i32::from_be_bytes(b)
        }
    }

    /// Every segment summary, in file order.
    pub fn summaries(&self) -> Result<Vec<DafSummary>, String> {
        let ss = self.nd + self.ni.div_ceil(2);
        let mut out = Vec::new();
        let mut rec = self.first_summary;
        let mut guard = 0;
        while rec != 0 {
            guard += 1;
            if guard > 100_000 {
                return Err("DAF summary list does not terminate".into());
            }
            let base = (rec - 1) * 128; // word index (0-based) of the record's first double
            let next = self.word(base + 1)? as usize;
            let count = self.word(base + 3)? as usize;
            if 3 + count * ss > 128 {
                return Err(format!("DAF summary record {rec} claims {count} summaries"));
            }
            for k in 0..count {
                let w0 = base + 3 + k * ss; // 0-based word index of this summary
                let mut doubles = Vec::with_capacity(self.nd);
                for j in 0..self.nd {
                    doubles.push(self.word(w0 + j + 1)?);
                }
                let ibyte = (w0 + self.nd) * 8;
                let ints = (0..self.ni)
                    .map(|j| self.int_at_byte(ibyte + 4 * j))
                    .collect();
                let name_off = rec * RECORD_BYTES + k * ss * 8;
                let name = self
                    .bytes
                    .get(name_off..name_off + ss * 8)
                    .map(|b| String::from_utf8_lossy(b).trim().to_string())
                    .unwrap_or_default();
                out.push(DafSummary {
                    doubles,
                    ints,
                    name,
                });
            }
            rec = next;
        }
        Ok(out)
    }
}

/// A type-2 Chebyshev segment (SPK or binary PCK): three components and their derivatives.
#[derive(Clone, Debug)]
pub struct Chebyshev2 {
    start_et: f64,
    end_et: f64,
    first_addr: usize,
    init: f64,
    intlen: f64,
    rsize: usize,
    n: usize,
}

impl Chebyshev2 {
    fn new(
        file: &DafFile,
        start_et: f64,
        end_et: f64,
        first: usize,
        last: usize,
    ) -> Result<Self, String> {
        let init = file.word(last - 3)?;
        let intlen = file.word(last - 2)?;
        let rsize = file.word(last - 1)? as usize;
        let n = file.word(last)? as usize;
        if rsize < 5 || (rsize - 2) % 3 != 0 || intlen <= 0.0 || n == 0 {
            return Err(format!(
                "malformed type-2 segment: RSIZE {rsize}, INTLEN {intlen}, N {n}"
            ));
        }
        if first + n * rsize + 3 != last {
            return Err("type-2 segment size does not match its directory".into());
        }
        Ok(Self {
            start_et,
            end_et,
            first_addr: first,
            init,
            intlen,
            rsize,
            n,
        })
    }

    fn covers(&self, et: f64) -> bool {
        et >= self.start_et && et <= self.end_et
    }

    /// Value, first and second derivative (per second) of the three components at
    /// `et_hi + et_lo`.
    fn eval(&self, file: &DafFile, et_hi: f64, et_lo: f64) -> Result<[Vec3; 3], String> {
        let et = et_hi + et_lo;
        let mut i = ((et - self.init) / self.intlen).floor();
        if i < 0.0 {
            i = 0.0;
        }
        let i = (i as usize).min(self.n - 1);
        let rec = self.first_addr + i * self.rsize;
        let mid = file.word(rec)?;
        let radius = file.word(rec + 1)?;
        let s = ((et_hi - mid) + et_lo) / radius;
        if s.abs() > 1.0 + 1e-9 {
            return Err(format!(
                "epoch {et} outside the record [{}, {}]",
                mid - radius,
                mid + radius
            ));
        }
        let ncoef = (self.rsize - 2) / 3;
        let mut out = [[0.0; 3]; 3];
        for c in 0..3 {
            // Clenshaw-free direct recurrence for T_k, T_k' and T_k''.
            let (mut t0, mut t1) = (1.0, s);
            let (mut d0, mut d1) = (0.0, 1.0);
            let (mut a0, mut a1) = (0.0, 0.0);
            let base = rec + 2 + c * ncoef;
            let mut p = file.word(base)? * t0;
            let mut v = 0.0;
            let mut acc = 0.0;
            if ncoef > 1 {
                let ck = file.word(base + 1)?;
                p += ck * t1;
                v += ck * d1;
            }
            for k in 2..ncoef {
                let t2 = 2.0 * s * t1 - t0;
                let d2 = 2.0 * t1 + 2.0 * s * d1 - d0;
                let a2 = 4.0 * d1 + 2.0 * s * a1 - a0;
                let ck = file.word(base + k)?;
                p += ck * t2;
                v += ck * d2;
                acc += ck * a2;
                (t0, t1) = (t1, t2);
                (d0, d1) = (d1, d2);
                (a0, a1) = (a1, a2);
            }
            out[0][c] = p;
            out[1][c] = v / radius;
            out[2][c] = acc / (radius * radius);
        }
        Ok(out)
    }
}

/// An SPK kernel: its type-2 segments, keyed by (target, centre).
#[derive(Clone, Debug)]
pub struct SpkKernel {
    file: DafFile,
    segments: Vec<(i32, i32, i32, Chebyshev2)>,
}

/// Position (m), velocity (m/s) and acceleration (m/s²), J2000 axes.
pub type State3 = [Vec3; 3];

impl SpkKernel {
    /// Read an SPK, keeping its type-2 segments (other types are ignored).
    pub fn open(path: &std::path::Path) -> Result<Self, String> {
        Self::from_daf(DafFile::open(path)?)
    }

    /// Wrap a parsed DAF.
    pub fn from_daf(file: DafFile) -> Result<Self, String> {
        if file.id_word != "DAF/SPK" {
            return Err(format!("not an SPK: {}", file.id_word));
        }
        let mut segments = Vec::new();
        for s in file.summaries()? {
            if s.doubles.len() != 2 || s.ints.len() != 6 {
                return Err("SPK summary is not ND=2, NI=6".into());
            }
            if s.ints[3] != 2 {
                continue;
            }
            let seg = Chebyshev2::new(
                &file,
                s.doubles[0],
                s.doubles[1],
                s.ints[4] as usize,
                s.ints[5] as usize,
            )?;
            segments.push((s.ints[0], s.ints[1], s.ints[2], seg));
        }
        Ok(Self { file, segments })
    }

    /// State of `target` relative to its own segment centre, and that centre (J2000 only).
    fn hop(&self, target: i32, et_hi: f64, et_lo: f64) -> Result<(i32, State3), String> {
        let et = et_hi + et_lo;
        // The last-loaded segment wins, as in SPICE.
        let (_, centre, frame, seg) = self
            .segments
            .iter()
            .rev()
            .find(|(t, _, _, s)| *t == target && s.covers(et))
            .ok_or_else(|| format!("no SPK type-2 data for body {target} at ET {et}"))?;
        if *frame != 1 {
            return Err(format!(
                "SPK segment for {target} is in frame {frame}, not J2000"
            ));
        }
        let km = seg.eval(&self.file, et_hi, et_lo)?;
        let m = |v: Vec3| [v[0] * 1e3, v[1] * 1e3, v[2] * 1e3];
        Ok((*centre, [m(km[0]), m(km[1]), m(km[2])]))
    }

    /// The chain from `body` up to the solar-system barycentre (0): (body, state relative to the
    /// next element) pairs.
    fn chain(&self, body: i32, et_hi: f64, et_lo: f64) -> Result<Vec<(i32, State3)>, String> {
        let mut out = Vec::new();
        let mut b = body;
        while b != 0 {
            let (c, st) = self.hop(b, et_hi, et_lo)?;
            out.push((b, st));
            if out.len() > 20 {
                return Err("SPK centre chain does not reach the barycentre".into());
            }
            b = c;
        }
        Ok(out)
    }

    /// State (m, m/s, m/s²; J2000) of `target` relative to `observer` at `et_hi + et_lo` TDB
    /// seconds past J2000, geometric. The two centre chains are summed only up to their lowest
    /// common ancestor, so the Moon relative to the Earth never passes through barycentric
    /// magnitudes.
    pub fn state(
        &self,
        target: i32,
        observer: i32,
        et_hi: f64,
        et_lo: f64,
    ) -> Result<State3, String> {
        let ct = self.chain(target, et_hi, et_lo)?;
        let co = self.chain(observer, et_hi, et_lo)?;
        let bodies_t: Vec<i32> = ct.iter().map(|x| x.0).chain([0]).collect();
        let bodies_o: Vec<i32> = co.iter().map(|x| x.0).chain([0]).collect();
        let common = *bodies_t
            .iter()
            .find(|b| bodies_o.contains(b))
            .expect("both chains end at the barycentre");
        let mut s = [[0.0; 3]; 3];
        for (b, st) in &ct {
            if *b == common {
                break;
            }
            for k in 0..3 {
                for j in 0..3 {
                    s[k][j] += st[k][j];
                }
            }
        }
        for (b, st) in &co {
            if *b == common {
                break;
            }
            for k in 0..3 {
                for j in 0..3 {
                    s[k][j] -= st[k][j];
                }
            }
        }
        Ok(s)
    }
}

/// A binary PCK kernel: its type-2 segments, keyed by body frame.
#[derive(Clone, Debug)]
pub struct PckKernel {
    file: DafFile,
    segments: Vec<(i32, i32, Chebyshev2)>,
}

/// The obliquity of the ecliptic at J2000 that defines the SPICE `ECLIPJ2000` frame (IAU 1976
/// value, 84 381.448 arcsec), in radians.
pub const ECLIPJ2000_OBLIQUITY_RAD: f64 = 84_381.448 / 3_600.0 * std::f64::consts::PI / 180.0;

/// NAIF frame code of J2000.
pub const FRAME_J2000: i32 = 1;
/// NAIF frame code of ECLIPJ2000.
pub const FRAME_ECLIPJ2000: i32 = 17;

impl PckKernel {
    /// Read a binary PCK, keeping its type-2 segments.
    pub fn open(path: &std::path::Path) -> Result<Self, String> {
        Self::from_daf(DafFile::open(path)?)
    }

    /// Wrap a parsed DAF.
    pub fn from_daf(file: DafFile) -> Result<Self, String> {
        if file.id_word != "DAF/PCK" {
            return Err(format!("not a binary PCK: {}", file.id_word));
        }
        let mut segments = Vec::new();
        for s in file.summaries()? {
            if s.doubles.len() != 2 || s.ints.len() != 5 {
                return Err("PCK summary is not ND=2, NI=5".into());
            }
            if s.ints[2] != 2 {
                continue;
            }
            let seg = Chebyshev2::new(
                &file,
                s.doubles[0],
                s.doubles[1],
                s.ints[3] as usize,
                s.ints[4] as usize,
            )?;
            segments.push((s.ints[0], s.ints[1], seg));
        }
        Ok(Self { file, segments })
    }

    /// The Euler angles `(φ, δ, w)` (rad) and their rates (rad/s) of `body_frame` and the
    /// reference frame they are given against.
    pub fn euler(
        &self,
        body_frame: i32,
        et_hi: f64,
        et_lo: f64,
    ) -> Result<(i32, Vec3, Vec3), String> {
        let et = et_hi + et_lo;
        let (_, reference, seg) = self
            .segments
            .iter()
            .rev()
            .find(|(b, _, s)| *b == body_frame && s.covers(et))
            .ok_or_else(|| format!("no PCK type-2 data for frame {body_frame} at ET {et}"))?;
        let e = seg.eval(&self.file, et_hi, et_lo)?;
        Ok((*reference, e[0], e[1]))
    }

    /// The rotation from J2000 to `body_frame` (`r_body = R · r_j2000`) and its time derivative
    /// (per second), for a body frame given against J2000 or ECLIPJ2000.
    pub fn rotation_from_j2000(
        &self,
        body_frame: i32,
        et_hi: f64,
        et_lo: f64,
    ) -> Result<(Mat3, Mat3), String> {
        let (reference, ang, rate) = self.euler(body_frame, et_hi, et_lo)?;
        let (r, dr) = euler_313_with_rate(ang, rate);
        match reference {
            FRAME_J2000 => Ok((r, dr)),
            FRAME_ECLIPJ2000 => {
                let e = rot_x(ECLIPJ2000_OBLIQUITY_RAD);
                Ok((mat_mul(&r, &e), mat_mul(&dr, &e)))
            }
            other => Err(format!(
                "PCK frame {body_frame} is given against frame {other}, which is not J2000 or ECLIPJ2000"
            )),
        }
    }
}

/// Frame rotation about x: `[[1,0,0],[0,c,s],[0,−s,c]]`.
pub fn rot_x(a: f64) -> Mat3 {
    let (s, c) = a.sin_cos();
    [[1.0, 0.0, 0.0], [0.0, c, s], [0.0, -s, c]]
}

/// Product `a · b`.
pub fn mat_mul(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut m = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            m[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j];
        }
    }
    m
}

/// Transpose.
pub fn mat_t(a: &Mat3) -> Mat3 {
    let mut m = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            m[i][j] = a[j][i];
        }
    }
    m
}

/// `a · v`.
pub fn mat_vec(a: &Mat3, v: Vec3) -> Vec3 {
    [
        a[0][0] * v[0] + a[0][1] * v[1] + a[0][2] * v[2],
        a[1][0] * v[0] + a[1][1] * v[1] + a[1][2] * v[2],
        a[2][0] * v[0] + a[2][1] * v[1] + a[2][2] * v[2],
    ]
}

/// `R = R_z(w) · R_x(δ) · R_z(φ)` for angles `(φ, δ, w)`, and `dR/dt` from the angle rates.
pub fn euler_313_with_rate(ang: Vec3, rate: Vec3) -> (Mat3, Mat3) {
    let (phi, delta, w) = (ang[0], ang[1], ang[2]);
    let (sp, cp) = phi.sin_cos();
    let (sd, cd) = delta.sin_cos();
    let (sw, cw) = w.sin_cos();
    let rz = |s: f64, c: f64| [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]];
    let drz = |s: f64, c: f64| [[-s, c, 0.0], [-c, -s, 0.0], [0.0, 0.0, 0.0]];
    let rx = [[1.0, 0.0, 0.0], [0.0, cd, sd], [0.0, -sd, cd]];
    let drx = [[0.0, 0.0, 0.0], [0.0, -sd, cd], [0.0, -cd, -sd]];
    let (a, b, c) = (rz(sw, cw), rx, rz(sp, cp));
    let r = mat_mul(&mat_mul(&a, &b), &c);
    let t1 = mat_mul(&mat_mul(&drz(sw, cw), &b), &c);
    let t2 = mat_mul(&mat_mul(&a, &drx), &c);
    let t3 = mat_mul(&mat_mul(&a, &b), &drz(sp, cp));
    let mut dr = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            dr[i][j] = rate[2] * t1[i][j] + rate[1] * t2[i][j] + rate[0] * t3[i][j];
        }
    }
    (r, dr)
}

/// NAIF leapseconds-kernel constants for `ET − TAI` (`DELTET/DELTA_T_A`, `K`, `EB`, `M`).
const DELTA_T_A: f64 = 32.184;
const DELTET_K: f64 = 1.657e-3;
const DELTET_EB: f64 = 1.671e-2;
const DELTET_M0: f64 = 6.239_996;
const DELTET_M1: f64 = 1.990_968_71e-7;

/// SPICE ephemeris time (TDB seconds past J2000) of a UTC instant, as two parts `(hi, lo)`:
/// `ET = TAI + 32.184 s + K sin(E)`, `E = M + EB sin M`, `M = M0 + M1·ET` (NAIF leapseconds
/// kernel constants), solved by fixed-point iteration. `jd_utc_day` is the Julian date of the UTC
/// day's start (a `.5` value) and `utc_seconds_of_day` the seconds into that day, so whole-hour
/// epochs stay exact. Leap seconds from [`crate::timescales::tai_minus_utc`].
pub fn naif_et_from_utc(jd_utc_day: f64, utc_seconds_of_day: f64) -> (f64, f64) {
    let tai_minus_utc =
        crate::timescales::tai_minus_utc(jd_utc_day + utc_seconds_of_day / 86_400.0);
    // Whole UTC seconds plus the integral leap-second count in `hi` (exact for whole-second
    // epochs); the 32.184 s offset and the periodic term in `lo`.
    let days = jd_utc_day - crate::timescales::JD_J2000; // exact: both are x.0 or x.5
    let hi = days * 86_400.0 + utc_seconds_of_day + tai_minus_utc;
    let mut lo = DELTA_T_A;
    for _ in 0..8 {
        let m = DELTET_M0 + DELTET_M1 * (hi + lo);
        let e = m + DELTET_EB * m.sin();
        lo = DELTA_T_A + DELTET_K * e.sin();
    }
    (hi, lo)
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A hand-built little-endian SPK with one type-2 segment of two records evaluates its
    /// Chebyshev series, derivative and second derivative exactly.
    fn tiny_spk() -> Vec<u8> {
        let mut words: Vec<f64> = vec![0.0; 128 * 3];
        let mut b = vec![0u8; 1024 * 3];
        b[0..8].copy_from_slice(b"DAF/SPK ");
        b[8..12].copy_from_slice(&2i32.to_le_bytes());
        b[12..16].copy_from_slice(&6i32.to_le_bytes());
        b[76..80].copy_from_slice(&2i32.to_le_bytes());
        b[88..96].copy_from_slice(b"LTL-IEEE");
        // Data from word 385 (record 4): two records of degree 2 (RSIZE 11).
        let data: Vec<f64> = vec![
            50.0, 50.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, // record 0: [0, 100]
            150.0, 50.0, -1.0, 0.5, 0.25, 0.0, 1.0, 0.0, 2.0, 0.0,
            -2.0, // record 1: [100, 200]
            0.0, 100.0, 11.0, 2.0,
        ];
        let first = 385usize;
        let last = first + data.len() - 1;
        // Summary record 2: next 0, prev 0, count 1, then (start, end, ints packed).
        words[128] = 0.0;
        words[129] = 0.0;
        words[130] = 1.0;
        words[131] = 0.0;
        words[132] = 200.0;
        for (i, w) in words.iter().enumerate().skip(128) {
            b[i * 8..i * 8 + 8].copy_from_slice(&w.to_le_bytes());
        }
        // Ints of the summary at word index 133 (0-based) -> byte 133*8.
        let ints = [399i32, 3, 1, 2, first as i32, last as i32];
        for (j, v) in ints.iter().enumerate() {
            let off = 133 * 8 + 4 * j;
            b[off..off + 4].copy_from_slice(&v.to_le_bytes());
        }
        for w in &data {
            b.extend_from_slice(&w.to_le_bytes());
        }
        b
    }

    #[test]
    fn a_type2_segment_evaluates_its_series_and_derivatives() {
        let spk = SpkKernel::from_daf(DafFile::from_bytes(tiny_spk()).unwrap()).unwrap();
        // Record 0 at t = 75: s = 0.5. x = 1 + 2 s + 3 (2s² − 1) = 1 + 1 − 1.5 = 0.5 km.
        let (c, st) = spk.hop(399, 75.0, 0.0).unwrap();
        assert_eq!(c, 3);
        assert!((st[0][0] - 500.0).abs() < 1e-9);
        // dx/ds = 2 + 12 s = 8 -> /50 s -> 0.16 km/s.
        assert!((st[1][0] - 160.0).abs() < 1e-9);
        // d²x/ds² = 12 -> /2500 -> 4.8e-3 km/s².
        assert!((st[2][0] - 4.8).abs() < 1e-9);
        // Record 1 at t = 125 + 25 (the low part): s = 0, z = 2 − 2·T2(0) = 4 km.
        let (_, st) = spk.hop(399, 125.0, 25.0).unwrap();
        assert!((st[0][2] - 4_000.0).abs() < 1e-9);
        assert!(spk.hop(399, 250.0, 0.0).is_err());
    }

    #[test]
    fn the_euler_rate_matrix_is_the_derivative_of_the_rotation() {
        let ang = [0.3, 0.4, 1.1];
        let rate = [1e-3, -2e-3, 7e-2];
        let (_, dr) = euler_313_with_rate(ang, rate);
        let h = 1e-3;
        let at = |t: f64| {
            euler_313_with_rate(
                [
                    ang[0] + rate[0] * t,
                    ang[1] + rate[1] * t,
                    ang[2] + rate[2] * t,
                ],
                rate,
            )
            .0
        };
        let (p, m) = (at(h), at(-h));
        for i in 0..3 {
            for j in 0..3 {
                assert!(((p[i][j] - m[i][j]) / (2.0 * h) - dr[i][j]).abs() < 1e-8);
            }
        }
    }

    #[test]
    fn naif_et_of_j2000_noon_utc_is_about_64_seconds() {
        // 2000-01-01T12:00:00 UTC: TAI − UTC = 32 s, so ET ≈ 64.184 s (the NAIF leapseconds
        // kernel's documented value is 64.183927 s).
        let (hi, lo) = naif_et_from_utc(2_451_544.5, 43_200.0);
        assert!((hi + lo - 64.183_927_284_7).abs() < 1e-6, "{}", hi + lo);
    }
}
