// SPDX-License-Identifier: AGPL-3.0-only
//! Full **tesseral** spherical-harmonic geopotential — the EGM2008 field to degree/order 70,
//! the high-degree gravity model the numerical propagator's [`crate::forces`] zonal-only field
//! was missing.
//!
//! [`SphericalHarmonicField`] holds fully-normalized `C̄_nm, S̄_nm` coefficients and evaluates
//! the gravitational potential and acceleration in the **Earth-fixed (ECEF) frame** the
//! coefficients are defined in. The normalized associated Legendre functions are computed by the
//! stable Holmes–Featherstone (2002) forward-column recurrence — de-normalizing to the classical
//! `P_nm` would overflow at this degree, so the recurrence is carried out in the normalized
//! variables directly. The shipped coefficients are the NGA EGM2008 product (public domain, via
//! ICGEM), bundled in [`crate::egm2008_data`]; any ICGEM `.gfc` model (EGM2008 to its full
//! degree, EGM96, GGM03, …) loads through [`SphericalHarmonicField::from_gfc`].
//!
//! ## Validation
//!
//! Correctness is pinned against three independent oracles: (1) with only `C̄_00 = 1` the
//! acceleration is the exact point mass `−μr/|r|³`; (2) a *zonal-only* field built from the
//! `[J2..J6]` constants reproduces the independently-implemented [`crate::forces::zonal_accel`]
//! (plus two-body) to ~1e-9 — this validates the whole normalized recurrence against code that
//! never touches it; (3) the analytic acceleration equals the central-difference gradient of the
//! directly-summed [`SphericalHarmonicField::potential`] for the full EGM2008 field at a LEO
//! point, tying the two code paths together.
//!
//! ## Scope (honest)
//!
//! The acceleration uses the spherical-partials transform, which has a `1/cos φ` term that is
//! singular at the geographic poles (floored here); the singularity-free Pines/Cunningham
//! Cartesian recursion is the production follow-on. Evaluation is in the Earth-fixed frame — to
//! perturb the ECI/TEME integration the caller rotates `r` through the ECI↔ECEF reduction
//! ([`crate::cio`]) before calling and rotates the acceleration back.

use crate::egm2008_data::{EGM2008_COEFFS, EGM2008_GM, EGM2008_NMAX, EGM2008_RE};
use crate::portable_math::{Maths, Platform, Portable};
use std::io::BufRead;
use std::sync::OnceLock;

type Vec3 = [f64; 3];

/// A fully-normalized spherical-harmonic gravity field: `GM`, reference radius `Re`, and the
/// `C̄_nm, S̄_nm` coefficient triangles to [`nmax`](Self::nmax).
#[derive(Clone, Debug)]
pub struct SphericalHarmonicField {
    /// Gravitational parameter `GM` (m³/s²).
    pub gm: f64,
    /// Reference radius `Re` (m).
    pub re: f64,
    /// Maximum degree/order.
    pub nmax: usize,
    /// `c[n][m]` fully-normalized cosine coefficients.
    c: Vec<Vec<f64>>,
    /// `s[n][m]` fully-normalized sine coefficients.
    s: Vec<Vec<f64>>,
    /// The `tide_system` header of the `.gfc` the field was read from, when one was given.
    tide_system: Option<String>,
    /// Column-major recursion table for the high-degree evaluator, built on first use and
    /// discarded whenever a coefficient changes (see [`HdTable`]).
    hd: OnceLock<HdTable>,
}

impl SphericalHarmonicField {
    /// A zero field of the given degree (all `C̄ = S̄ = 0`). Set coefficients with [`set`](Self::set).
    pub fn zeros(gm: f64, re: f64, nmax: usize) -> Self {
        Self {
            gm,
            re,
            nmax,
            c: vec![vec![0.0; nmax + 1]; nmax + 1],
            s: vec![vec![0.0; nmax + 1]; nmax + 1],
            tide_system: None,
            hd: OnceLock::new(),
        }
    }

    /// Set the fully-normalized `(C̄_nm, S̄_nm)` for degree `n`, order `m` (no-op if out of range).
    pub fn set(&mut self, n: usize, m: usize, cnm: f64, snm: f64) {
        if n <= self.nmax && m <= n {
            self.c[n][m] = cnm;
            self.s[n][m] = snm;
            // The high-degree table holds a copy of the coefficients: drop it.
            self.hd = OnceLock::new();
        }
    }

    /// The fully-normalized cosine coefficient `C̄_nm`, or `None` if `(n, m)` is out of range.
    /// A read accessor for the otherwise-private coefficient triangles (validation / provenance).
    pub fn cbar(&self, n: usize, m: usize) -> Option<f64> {
        if n <= self.nmax && m <= n {
            Some(self.c[n][m])
        } else {
            None
        }
    }

    /// The fully-normalized sine coefficient `S̄_nm`, or `None` if `(n, m)` is out of range.
    pub fn sbar(&self, n: usize, m: usize) -> Option<f64> {
        if n <= self.nmax && m <= n {
            Some(self.s[n][m])
        } else {
            None
        }
    }

    /// The bundled EGM2008 field to its full shipped degree/order (70).
    pub fn egm2008() -> Self {
        Self::egm2008_truncated(EGM2008_NMAX)
    }

    /// The bundled EGM2008 field truncated to `nmax` (clamped to the shipped 70).
    pub fn egm2008_truncated(nmax: usize) -> Self {
        let nmax = nmax.min(EGM2008_NMAX);
        let mut f = Self::zeros(EGM2008_GM, EGM2008_RE, nmax);
        for &(n, m, cnm, snm) in EGM2008_COEFFS.iter() {
            f.set(n as usize, m as usize, cnm, snm);
        }
        f
    }

    /// Parse a fully-normalized ICGEM `.gfc` model. Reads the GM (`earth_gravity_constant` for
    /// Earth models, `gravity_constant` for celestial-body models such as the GRAIL lunar
    /// fields), `radius`, and the `gfc <n> <m> <C> <S>` lines (Fortran `d`/`D` exponents
    /// accepted), to `nmax`.
    pub fn from_gfc(text: &str, nmax: usize) -> Result<Self, String> {
        let ff = |t: &str| t.replace(['d', 'D'], "e").parse::<f64>();
        let mut gm = None;
        let mut re = None;
        let mut rows: Vec<(usize, usize, f64, f64)> = Vec::new();
        let mut max_n = 0usize;
        for line in text.lines() {
            let p: Vec<&str> = line.split_whitespace().collect();
            match p.first().copied() {
                // ICGEM uses `earth_gravity_constant` for Earth models and `gravity_constant`
                // for celestial-body models (the GRAIL lunar / planetary fields).
                Some("earth_gravity_constant" | "gravity_constant") if p.len() >= 2 => {
                    gm = ff(p[1]).ok();
                }
                Some("radius") if p.len() >= 2 => {
                    re = ff(p[1]).ok();
                }
                Some("gfc") if p.len() >= 5 => {
                    let n: usize = p[1].parse().map_err(|_| "bad degree")?;
                    let m: usize = p[2].parse().map_err(|_| "bad order")?;
                    if n > nmax {
                        continue;
                    }
                    let cnm = ff(p[3]).map_err(|_| "bad C")?;
                    let snm = ff(p[4]).map_err(|_| "bad S")?;
                    max_n = max_n.max(n);
                    rows.push((n, m, cnm, snm));
                }
                _ => {}
            }
        }
        let gm = gm.ok_or("missing earth_gravity_constant / gravity_constant")?;
        let re = re.ok_or("missing radius")?;
        // A value can parse yet be non-physical (NaN GM → NaN field; negative GM → repulsive
        // gravity; zero/negative/inf radius). Reject rather than silently fail open.
        if !(gm.is_finite() && gm > 0.0) {
            return Err("non-physical earth_gravity_constant (must be finite and positive)".into());
        }
        if !(re.is_finite() && re > 0.0) {
            return Err("non-physical radius (must be finite and positive)".into());
        }
        if rows.is_empty() {
            return Err("no gfc coefficient lines".into());
        }
        let mut f = Self::zeros(gm, re, max_n.min(nmax));
        for (n, m, cnm, snm) in rows {
            f.set(n, m, cnm, snm);
        }
        Ok(f)
    }

    /// Fully-normalized associated Legendre functions `P̄_nm(sin φ)` and their derivatives
    /// `dP̄_nm/dφ`, for `n, m = 0..=nmax`, by the Holmes–Featherstone forward-column recurrence.
    /// `t = sin φ`, `u = cos φ ≥ 0`. Returns `(p, dp)` as lower-triangular `[n][m]` matrices.
    // The recurrence indices (n, m) are used arithmetically in every step, so a range loop is the
    // natural form here despite `needless_range_loop`.
    #[allow(clippy::needless_range_loop)]
    fn legendre(&self, t: f64, u: f64) -> (Vec<Vec<f64>>, Vec<Vec<f64>>) {
        let n = self.nmax;
        let uu = u.max(1e-300); // floor for the 1/u in the derivative at the poles
        let mut p = vec![vec![0.0; n + 1]; n + 1];
        let mut dp = vec![vec![0.0; n + 1]; n + 1];
        p[0][0] = 1.0;
        // Sectoral P̄_mm and the first sub-diagonal P̄_{m+1,m}. The fully-normalized convention
        // carries a (2−δ_{0m}) factor, so the m=0→m=1 step gains an extra √2 (giving P̄₁₁=√3·u);
        // m≥2 steps have it on both sides and cancel.
        for m in 1..=n {
            let mf = m as f64;
            let delta = if m == 1 { 2.0_f64.sqrt() } else { 1.0 };
            // P̄_mm = u·(2−δ factor)·√((2m+1)/(2m))·P̄_{m-1,m-1}
            p[m][m] = uu * delta * ((2.0 * mf + 1.0) / (2.0 * mf)).sqrt() * p[m - 1][m - 1];
        }
        for m in 0..n {
            // P̄_{m+1,m} = t·√(2m+3)·P̄_mm
            let mf = m as f64;
            p[m + 1][m] = t * (2.0 * mf + 3.0).sqrt() * p[m][m];
        }
        // Column recurrence for n ≥ m+2.
        for m in 0..=n {
            for nn in (m + 2)..=n {
                let (nf, mf) = (nn as f64, m as f64);
                let alpha = ((2.0 * nf - 1.0) * (2.0 * nf + 1.0) / ((nf - mf) * (nf + mf))).sqrt();
                let beta = ((2.0 * nf + 1.0) * (nf - 1.0 - mf) * (nf - 1.0 + mf)
                    / ((2.0 * nf - 3.0) * (nf - mf) * (nf + mf)))
                    .sqrt();
                p[nn][m] = alpha * t * p[nn - 1][m] - beta * p[nn - 2][m];
            }
        }
        // Derivatives (Abramowitz & Stegun 8.5.4, normalized): dP̄_nm/dφ =
        // (γ_nm·P̄_{n-1,m} − n·t·P̄_nm) / u,  γ_nm = √[(2n+1)(n-m)(n+m)/(2n-1)].
        for nn in 0..=n {
            for m in 0..=nn {
                let (nf, mf) = (nn as f64, m as f64);
                let prev = if nn >= 1 && m < nn { p[nn - 1][m] } else { 0.0 };
                let gamma = if nn >= 1 {
                    ((2.0 * nf + 1.0) * (nf - mf) * (nf + mf) / (2.0 * nf - 1.0)).sqrt()
                } else {
                    0.0
                };
                dp[nn][m] = (gamma * prev - nf * t * p[nn][m]) / uu;
            }
        }
        (p, dp)
    }

    /// Gravitational potential `U(r)` (m²/s², positive) in the Earth-fixed frame, including the
    /// central `GM/r` term (so `U = GM/r` for a point mass). The acceleration is `∇U`.
    #[allow(clippy::needless_range_loop)]
    pub fn potential(&self, r: Vec3) -> f64 {
        let rn = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
        let t = r[2] / rn; // sin φ
        let u = ((r[0] * r[0] + r[1] * r[1]).sqrt() / rn).max(0.0); // cos φ
        let lambda = r[1].atan2(r[0]);
        let (p, _) = self.legendre(t, u);
        let ror = self.re / rn;
        let mut sum = 0.0;
        let mut rn_pow = 1.0; // (Re/r)^n
        for nn in 0..=self.nmax {
            let mut an = 0.0;
            for m in 0..=nn {
                let (cl, sl) = ((m as f64 * lambda).cos(), (m as f64 * lambda).sin());
                an += p[nn][m] * (self.c[nn][m] * cl + self.s[nn][m] * sl);
            }
            sum += rn_pow * an;
            rn_pow *= ror;
        }
        self.gm / rn * sum
    }

    /// Gravitational acceleration `∇U` (m/s², Earth-fixed) — the **total** field, central term
    /// included, so a point-mass field returns `−μr/|r|³`.
    pub fn acceleration(&self, r: Vec3) -> Vec3 {
        self.acceleration_with::<Platform>(r)
    }

    /// [`Self::acceleration`] evaluated with the platform-independent mathematics library
    /// ([`crate::portable_math`]): the same formula, the same operation order, and the same
    /// bits on every platform. For callers whose output is discrete, such as the low Earth
    /// orbit navigation message, whose truth orbit is integrated through this field.
    pub(crate) fn acceleration_portable(&self, r: Vec3) -> Vec3 {
        self.acceleration_with::<Portable>(r)
    }

    /// The acceleration, written once for both mathematics libraries. With `M = Platform`
    /// this is the historical arithmetic, unchanged to the last bit.
    #[allow(clippy::needless_range_loop)]
    fn acceleration_with<M: Maths>(&self, r: Vec3) -> Vec3 {
        let r2 = r[0] * r[0] + r[1] * r[1] + r[2] * r[2];
        let rn = r2.sqrt();
        let rxy = (r[0] * r[0] + r[1] * r[1]).sqrt();
        let rxy_f = rxy.max(1e-6 * self.re); // pole floor
        let t = r[2] / rn; // sin φ
        let u = (rxy / rn).max(0.0); // cos φ
        let lambda = M::atan2(r[1], r[0]);
        let (p, dp) = self.legendre(t, u);
        let ror = self.re / rn;

        // Accumulate the three spherical partials of U.
        let mut du_dr = 0.0;
        let mut du_dphi = 0.0;
        let mut du_dlam = 0.0;
        let mut rn_pow = 1.0; // (Re/r)^n
        for nn in 0..=self.nmax {
            let mut a_n = 0.0; // Σ_m P̄·(C cos + S sin)
            let mut aphi_n = 0.0; // Σ_m dP̄/dφ·(C cos + S sin)
            let mut alam_n = 0.0; // Σ_m P̄·m·(−C sin + S cos)
            for m in 0..=nn {
                let mf = m as f64;
                let (cl, sl) = (M::cos(mf * lambda), M::sin(mf * lambda));
                let cs = self.c[nn][m] * cl + self.s[nn][m] * sl;
                a_n += p[nn][m] * cs;
                aphi_n += dp[nn][m] * cs;
                alam_n += p[nn][m] * mf * (-self.c[nn][m] * sl + self.s[nn][m] * cl);
            }
            du_dr += (nn as f64 + 1.0) * rn_pow * a_n;
            du_dphi += rn_pow * aphi_n;
            du_dlam += rn_pow * alam_n;
            rn_pow *= ror;
        }
        du_dr *= -self.gm / r2;
        du_dphi *= self.gm / rn;
        du_dlam *= self.gm / rn;

        // Spherical → Cartesian (Vallado / Montenbruck–Gill): with φ = asin(z/r), λ = atan2(y,x).
        let dphi_fac = r[2] / (r2 * rxy_f); // −∂φ/∂x = x·z/(r²·rxy); shared scalar
        let ax =
            (du_dr / rn) * r[0] - dphi_fac * du_dphi * r[0] - (du_dlam / (rxy_f * rxy_f)) * r[1];
        let ay =
            (du_dr / rn) * r[1] - dphi_fac * du_dphi * r[1] + (du_dlam / (rxy_f * rxy_f)) * r[0];
        let az = (du_dr / rn) * r[2] + (rxy / r2) * du_dphi;
        [ax, ay, az]
    }

    // ── High-degree, singularity-free evaluation ─────────────────────────────────────────

    /// Read an ICGEM `.gfc` model from a file, streaming it line by line, to degree `nmax`
    /// (clamped to the highest degree present). This is the loader for the full EGM2008
    /// model (degree 2190, about 250 MB, not shipped with Kshana; `scripts/fetch_egm2008.sh`
    /// downloads it and checks its SHA-256). See [`Self::from_gfc_reader`] for the format rules.
    pub fn from_gfc_file(path: impl AsRef<std::path::Path>, nmax: usize) -> Result<Self, String> {
        let path = path.as_ref();
        let f = std::fs::File::open(path).map_err(|e| format!("{}: {e}", path.display()))?;
        Self::from_gfc_reader(std::io::BufReader::with_capacity(1 << 20, f), nmax)
    }

    /// Stream an ICGEM `.gfc` model (format 1.0 static models, e.g. EGM2008, EGM96, EIGEN-6C4)
    /// to degree `nmax`, without holding the text in memory.
    ///
    /// Header (before `end_of_head`): `earth_gravity_constant` or `gravity_constant`, `radius`,
    /// `norm` (must be `fully_normalized` when present; `unnormalized` models are rejected
    /// rather than misread), `tide_system` (recorded, see [`Self::tide_system`]), and
    /// `max_degree` (a file that declares one and holds coefficients above it is rejected).
    /// Other header lines (`product_type`, `modelname`, `errors`, free text) are ignored.
    /// Body: `gfc n m C S [sigma_C sigma_S]` lines; the error columns are ignored, Fortran
    /// `d`/`D` exponents are accepted, and lines above `nmax` are skipped after reading only
    /// their degree. Time-variable ICGEM 2.0 terms (`gfct`, `trnd`, `acos`, `asin`) are
    /// rejected with an error: a static field cannot represent them.
    pub fn from_gfc_reader<R: BufRead>(mut reader: R, nmax: usize) -> Result<Self, String> {
        let ff = |t: &str| t.replace(['d', 'D'], "e").parse::<f64>();
        let mut gm = None;
        let mut re = None;
        let mut tide = None;
        let mut declared_max: Option<usize> = None;
        let mut in_body = false;
        let mut rows: Vec<(usize, usize, f64, f64)> = Vec::new();
        let mut max_n = 0usize;
        let mut line = String::new();
        let mut lineno = 0usize;
        loop {
            line.clear();
            let k = reader
                .read_line(&mut line)
                .map_err(|e| format!("read error: {e}"))?;
            if k == 0 {
                break;
            }
            lineno += 1;
            let mut it = line.split_whitespace();
            let Some(key) = it.next() else { continue };
            if !in_body {
                match key {
                    "earth_gravity_constant" | "gravity_constant" => {
                        gm = it.next().and_then(|v| ff(v).ok());
                    }
                    "radius" => re = it.next().and_then(|v| ff(v).ok()),
                    "max_degree" => declared_max = it.next().and_then(|v| v.parse().ok()),
                    "tide_system" => tide = it.next().map(str::to_string),
                    "norm" => {
                        let v = it.next().unwrap_or("");
                        if v != "fully_normalized" {
                            return Err(format!(
                                "line {lineno}: norm {v:?} is not supported (fully_normalized only)"
                            ));
                        }
                    }
                    "end_of_head" => in_body = true,
                    _ => {}
                }
                continue;
            }
            match key {
                "gfc" => {
                    let bad = |what: &str| format!("line {lineno}: bad {what}");
                    let n: usize = it
                        .next()
                        .and_then(|v| v.parse().ok())
                        .ok_or_else(|| bad("degree"))?;
                    if let Some(dm) = declared_max {
                        if n > dm {
                            return Err(format!(
                                "line {lineno}: degree {n} above the declared max_degree {dm}"
                            ));
                        }
                    }
                    if n > nmax {
                        continue;
                    }
                    let m: usize = it
                        .next()
                        .and_then(|v| v.parse().ok())
                        .ok_or_else(|| bad("order"))?;
                    if m > n {
                        return Err(format!("line {lineno}: order {m} above degree {n}"));
                    }
                    let cnm = it.next().and_then(|v| ff(v).ok()).ok_or_else(|| bad("C"))?;
                    let snm = it.next().and_then(|v| ff(v).ok()).ok_or_else(|| bad("S"))?;
                    if !(cnm.is_finite() && snm.is_finite()) {
                        return Err(bad("coefficient (non-finite)"));
                    }
                    max_n = max_n.max(n);
                    rows.push((n, m, cnm, snm));
                }
                "gfct" | "trnd" | "dot" | "acos" | "asin" => {
                    return Err(format!(
                        "line {lineno}: time-variable term `{key}` is not supported (static models only)"
                    ));
                }
                _ => {}
            }
        }
        if !in_body {
            return Err("missing end_of_head".into());
        }
        let gm = gm.ok_or("missing earth_gravity_constant / gravity_constant")?;
        let re = re.ok_or("missing radius")?;
        if !(gm.is_finite() && gm > 0.0) {
            return Err("non-physical earth_gravity_constant (must be finite and positive)".into());
        }
        if !(re.is_finite() && re > 0.0) {
            return Err("non-physical radius (must be finite and positive)".into());
        }
        if rows.is_empty() {
            return Err("no gfc coefficient lines".into());
        }
        let mut f = Self::zeros(gm, re, max_n.min(nmax));
        for (n, m, cnm, snm) in rows {
            f.set(n, m, cnm, snm);
        }
        f.tide_system = tide;
        Ok(f)
    }

    /// The `tide_system` declared by the `.gfc` header the field was streamed from
    /// ([`Self::from_gfc_reader`] / [`Self::from_gfc_file`]), e.g. `tide_free` for EGM2008.
    /// `None` for fields built any other way. No tide-system conversion is applied.
    pub fn tide_system(&self) -> Option<&str> {
        self.tide_system.as_deref()
    }

    /// Build (if not yet built) the recursion table the high-degree evaluator streams through.
    /// Calling it is optional (the first [`Self::acceleration_hf`] / [`Self::potential_hf`]
    /// builds it) but moves the one-off cost (tens of ms and 77 MB at degree 2190) out of a
    /// timed loop. Changing a coefficient with [`Self::set`] discards the table.
    pub fn prepare_high_degree(&self) {
        self.hd_table();
    }

    fn hd_table(&self) -> &HdTable {
        self.hd.get_or_init(|| HdTable::build(self))
    }

    /// Gravitational potential `U(r)` (m²/s², central `GM/r` term included), evaluated by the
    /// singularity-free high-degree method of [`Self::acceleration_hf`]. Agrees with
    /// [`Self::potential`] where that one is valid; use this one above degree ~180 or at the
    /// poles.
    pub fn potential_hf(&self, r: Vec3) -> f64 {
        self.eval_hf(r, false).0
    }

    /// Gravitational acceleration `∇U` (m/s², Earth-fixed frame, central term included) by a
    /// method that holds to degree and order 2190 at every latitude, the geographic poles
    /// exactly included.
    ///
    /// **Legendre functions.** Holmes & Featherstone (2002, *J. Geodesy* 76:279–299), modified
    /// forward-column method: the standard column recursion in `n` is run on the scaled
    /// quantities `Q_nm = 2^-930 · P̄_nm(sin φ) / cos^m φ` (a polynomial in `sin φ`; the
    /// `2^-930 ≈ 1e-280` factor keeps the largest of them, about `1e455` unscaled at degree
    /// 2190 near a pole, finite), and the `cos^m φ` factor is put back by a Horner scheme over
    /// the order `m`. The plain recursion's sectoral `P̄_mm ∝ cos^m φ` becomes zero for high
    /// `m` (at degree 2190 it underflows poleward of about 44° latitude); this method never
    /// forms it. Terms whose contribution lies below about `1e-28·GM/r` (potential units) may
    /// still underflow to zero; with the `C̄₀₀ = 1` central term present they are far below the
    /// last bit of the result.
    ///
    /// **Gradient.** The spherical partials are formed without a `1/cos φ`: the `λ` partial
    /// divided by `cos φ` carries `m·cos^(m−1) φ`, and `∂P̄_nm/∂φ` is split as
    /// `−m sin φ cos^(m−1) φ · Q + cos^(m+1) φ · dQ/d(sin φ)`, both summed by Horner in
    /// `cos φ`, with `dQ/d(sin φ)` from the differentiated column recursion. They are combined
    /// with the local north/east unit vectors, which are finite at the pole (where the
    /// longitude is taken as 0 and only the order-1 terms survive: the exact limit).
    ///
    /// **Cost.** O(N²) time and O(N) working memory per call, after a one-off table
    /// ([`Self::prepare_high_degree`]). The measured budget is pinned in
    /// `tests/gravity_sh_high_degree.rs`.
    ///
    /// The historical [`Self::acceleration`] is unchanged (existing outputs depend on it bit
    /// for bit); this method agrees with it to ~1e-14 relative away from the poles at degree 70.
    pub fn acceleration_hf(&self, r: Vec3) -> Vec3 {
        self.eval_hf(r, true).1
    }

    /// Potential and (when `grad`) acceleration by the high-degree method; see
    /// [`Self::acceleration_hf`].
    fn eval_hf(&self, r: Vec3, grad: bool) -> (f64, Vec3) {
        let tab = self.hd_table();
        let nmax = self.nmax;
        let rho2 = r[0] * r[0] + r[1] * r[1];
        let r2 = rho2 + r[2] * r[2];
        let rn = r2.sqrt();
        let rho = rho2.sqrt();
        let t = r[2] / rn; // sin φ
        let u = rho / rn; // cos φ (≥ 0)
                          // Longitude direction cosines; at the pole (ρ = 0) λ is taken as 0.
        let (cl, sl) = if rho > 0.0 {
            (r[0] / rho, r[1] / rho)
        } else {
            (1.0, 0.0)
        };
        let lambda = sl.atan2(cl);
        let q = self.re / rn;
        let mut qpow = vec![1.0; nmax + 1]; // (Re/r)^n
        for n in 1..=nmax {
            qpow[n] = qpow[n - 1] * q;
        }

        // Horner accumulators over m (descending): potential, radial, φ parts 1 and 2, λ part.
        let (mut hv, mut hr, mut hp1, mut hp2, mut hl) = (0.0, 0.0, 0.0, 0.0, 0.0);
        for m in (0..=nmax).rev() {
            let col = &tab.cols[tab.start[m]..tab.start[m + 1]];
            // Column recursion on Q_nm = P̄_nm / u^m (scaled) and on dQ_nm/dt.
            let (mut q2, mut q1) = (0.0, tab.sect[m]); // Q_{n-2}, Q_{n-1}
            let (mut d2, mut d1) = (0.0, 0.0);
            // The n = m term.
            let w = qpow[m] * q1;
            let (mut ac, mut as_) = (w * col[0][2], w * col[0][3]);
            let wr = (m as f64 + 1.0) * w;
            let (mut rc, mut rs) = (wr * col[0][2], wr * col[0][3]);
            let (mut dc, mut ds) = (0.0, 0.0);
            for (k, e) in col.iter().enumerate().skip(1) {
                let n = m + k;
                let (alpha, beta) = (e[0], e[1]);
                let qn = alpha * t * q1 - beta * q2;
                q2 = q1;
                q1 = qn;
                let w = qpow[n] * qn;
                ac += w * e[2];
                as_ += w * e[3];
                if grad {
                    let dn = alpha * (q2 + t * d1) - beta * d2;
                    d2 = d1;
                    d1 = dn;
                    let wr = (n as f64 + 1.0) * w;
                    rc += wr * e[2];
                    rs += wr * e[3];
                    let wd = qpow[n] * dn;
                    dc += wd * e[2];
                    ds += wd * e[3];
                }
            }
            let mf = m as f64;
            let (sm, cm) = (mf * lambda).sin_cos();
            let a_m = ac * cm + as_ * sm;
            hv = hv * u + a_m;
            if grad {
                hr = hr * u + (rc * cm + rs * sm);
                hp2 = hp2 * u + (dc * cm + ds * sm);
                if m >= 1 {
                    hp1 = hp1 * u + mf * a_m;
                    hl = hl * u + mf * (as_ * cm - ac * sm);
                }
            }
        }
        let gmr = self.gm / rn;
        let pot = gmr * hv * HD_UNSCALE;
        if !grad {
            return (pot, [0.0; 3]);
        }
        let du_dr = -gmr / rn * hr * HD_UNSCALE;
        let du_dphi = gmr * (u * hp2 - t * hp1) * HD_UNSCALE; // ∂U/∂φ
        let du_dlam_u = gmr * hl * HD_UNSCALE; // (1/cos φ)·∂U/∂λ
                                               // a = ∂U/∂r·r̂ + (1/r)·∂U/∂φ·φ̂ + (1/(r cos φ))·∂U/∂λ·λ̂, with
                                               // r̂ = r/|r|, φ̂ = (−t·cl, −t·sl, u), λ̂ = (−sl, cl, 0).
        let gp = du_dphi / rn;
        let gl = du_dlam_u / rn;
        let a = [
            du_dr * r[0] / rn - gp * t * cl - gl * sl,
            du_dr * r[1] / rn - gp * t * sl + gl * cl,
            du_dr * r[2] / rn + gp * u,
        ];
        (pot, a)
    }

    /// Total **gravity** magnitude `|∇V + centrifugal|` (m/s²) at an Earth-fixed point `r`, for a
    /// body rotating about the z-axis at `omega` (rad/s) — what a gravimeter on the surface
    /// measures (gravitational attraction plus the centrifugal effect of rotation). With
    /// `omega = 0` this reduces to the gravitational magnitude `|∇V|`.
    pub fn gravity_magnitude(&self, r: Vec3, omega: f64) -> f64 {
        let a = self.acceleration(r);
        let w2 = omega * omega;
        let g = [a[0] + w2 * r[0], a[1] + w2 * r[1], a[2]];
        (g[0] * g[0] + g[1] * g[1] + g[2] * g[2]).sqrt()
    }

    /// Gravity disturbance `δg = |g_model| − γ_GRS80` at a geodetic surface point (height 0), in
    /// **mGal** (1 mGal = 1e-5 m/s²) — the local gravity-map signal a gravity-aided navigator
    /// matches against. `omega` is the body rotation rate (use [`GRS80_OMEGA`] for Earth).
    pub fn gravity_disturbance_mgal(&self, geodetic_lat: f64, lon: f64, omega: f64) -> f64 {
        let p = grs80_surface_point(geodetic_lat, lon);
        let g = self.gravity_magnitude(p, omega);
        (g - grs80_normal_gravity(geodetic_lat)) * 1.0e5
    }
}

/// `2^-930 ≈ 1e-280`: the scale the high-degree recursion runs at (Holmes & Featherstone 2002).
const HD_SCALE: f64 = f64::from_bits((1023 - 930) << 52);
/// `2^930`, undoing [`HD_SCALE`] on the summed result (exact: a power of two).
const HD_UNSCALE: f64 = f64::from_bits((1023 + 930) << 52);

/// The high-degree evaluator's table, column-major in the order `m` so that one evaluation
/// streams through it once: for each `m`, entries `n = m..=nmax` of
/// `[α_nm, β_nm, C̄_nm, S̄_nm]` for the column recursion
/// `Q_nm = α_nm·t·Q_{n−1,m} − β_nm·Q_{n−2,m}` (the `α, β` of the historical Legendre routine),
/// and the scaled sectoral start values `Q_mm = 2^-930·P̄_mm / cos^m φ`.
#[derive(Clone, Debug)]
struct HdTable {
    sect: Vec<f64>,
    start: Vec<usize>,
    cols: Vec<[f64; 4]>,
}

impl HdTable {
    fn build(f: &SphericalHarmonicField) -> Self {
        let nmax = f.nmax;
        let mut sect = vec![0.0; nmax + 1];
        sect[0] = HD_SCALE;
        for m in 1..=nmax {
            let mf = m as f64;
            // The (2−δ_0m) normalization adds a √2 on the m = 0 → 1 step (P̄₁₁ = √3·u).
            let delta = if m == 1 { 2.0_f64.sqrt() } else { 1.0 };
            sect[m] = delta * ((2.0 * mf + 1.0) / (2.0 * mf)).sqrt() * sect[m - 1];
        }
        let mut start = Vec::with_capacity(nmax + 2);
        let mut cols = Vec::with_capacity((nmax + 1) * (nmax + 2) / 2);
        for m in 0..=nmax {
            start.push(cols.len());
            for n in m..=nmax {
                let (nf, mf) = (n as f64, m as f64);
                let (alpha, beta) = if n == m {
                    (0.0, 0.0)
                } else {
                    (
                        ((2.0 * nf - 1.0) * (2.0 * nf + 1.0) / ((nf - mf) * (nf + mf))).sqrt(),
                        ((2.0 * nf + 1.0) * (nf - 1.0 - mf) * (nf - 1.0 + mf)
                            / ((2.0 * nf - 3.0) * (nf - mf) * (nf + mf)))
                            .sqrt(),
                    )
                };
                cols.push([alpha, beta, f.c[n][m], f.s[n][m]]);
            }
        }
        start.push(cols.len());
        Self { sect, start, cols }
    }
}

// ── GRS80 reference ellipsoid & normal gravity (Moritz 1980, IAG-adopted) ─────────
// The Geodetic Reference System 1980 is an exact international standard; its defining
// constants and the closed-form Somigliana normal gravity are the *external reference*
// against which the spherical-harmonic gravity-functional synthesis is validated.

/// GRS80 semi-major axis (m).
pub const GRS80_A: f64 = 6_378_137.0;
/// GRS80 geocentric gravitational constant GM (m³/s²).
pub const GRS80_GM: f64 = 3.986_005e14;
/// GRS80 angular velocity (rad/s).
pub const GRS80_OMEGA: f64 = 7.292_115e-5;
/// GRS80 flattening.
pub const GRS80_F: f64 = 1.0 / 298.257_222_101;
/// GRS80 normal gravity at the equator (m/s²).
pub const GRS80_GAMMA_E: f64 = 9.780_326_771_5;
/// GRS80 normal gravity at the pole (m/s²).
pub const GRS80_GAMMA_P: f64 = 9.832_186_368_5;

/// Closed-form **Somigliana** normal gravity on the GRS80 ellipsoid at geodetic latitude `phi`
/// (rad). The published external reference for [`SphericalHarmonicField::gravity_magnitude`].
pub fn grs80_normal_gravity(phi: f64) -> f64 {
    let (s, c) = phi.sin_cos();
    let b = GRS80_A * (1.0 - GRS80_F);
    let num = GRS80_A * GRS80_GAMMA_E * c * c + b * GRS80_GAMMA_P * s * s;
    let den = (GRS80_A * GRS80_A * c * c + b * b * s * s).sqrt();
    num / den
}

/// Earth-fixed Cartesian coordinates (m) of the point on the GRS80 ellipsoid (height 0) at
/// geodetic latitude `phi` and longitude `lon` (rad).
pub fn grs80_surface_point(phi: f64, lon: f64) -> Vec3 {
    let e2 = GRS80_F * (2.0 - GRS80_F);
    let (s, c) = phi.sin_cos();
    let n = GRS80_A / (1.0 - e2 * s * s).sqrt();
    let (sl, cl) = lon.sin_cos();
    [n * c * cl, n * c * sl, n * (1.0 - e2) * s]
}

/// The GRS80 **normal** gravity field as a spherical-harmonic field: GM, reference radius `a`, and
/// the published even zonal harmonics `J₂…J₈` (Moritz 1980). Synthesising its `gravity_magnitude`
/// on the ellipsoid reproduces the Somigliana reference — the validation oracle for the kernel.
pub fn grs80_normal_field() -> SphericalHarmonicField {
    // Published GRS80 normal-field zonal harmonics J_2n (unnormalized).
    const J: [(usize, f64); 4] = [
        (2, 1.082_63e-3),
        (4, -2.370_912_22e-6),
        (6, 6.083_47e-9),
        (8, -1.427e-11),
    ];
    let mut f = SphericalHarmonicField::zeros(GRS80_GM, GRS80_A, 8);
    f.set(0, 0, 1.0, 0.0); // monopole: C̄_{0,0} = 1 (the central GM/r term)
    for (n, jn) in J {
        // Fully-normalized C̄_{n,0} = −J_n / √(2n+1).
        f.set(n, 0, -jn / ((2 * n + 1) as f64).sqrt(), 0.0);
    }
    f
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::egm2008_data::{EGM2008_GM, EGM2008_RE};
    use crate::forces::{two_body_accel, zonal_accel, J2, J3, J4, J5, J6, MU_EARTH, RE_EARTH};

    fn norm(a: Vec3) -> f64 {
        (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
    }

    /// A LEO point well away from the poles and the z-axis.
    fn leo_point() -> Vec3 {
        [7.0e6, 1.2e6, 0.9e6]
    }

    #[test]
    fn point_mass_field_is_exact_two_body() {
        // Only C̄00 = 1 → the acceleration must be the exact point mass −μr/|r|³.
        let mut f = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 4);
        f.set(0, 0, 1.0, 0.0);
        let r = leo_point();
        let a = f.acceleration(r);
        let tb = two_body_accel(r);
        let err = norm([a[0] - tb[0], a[1] - tb[1], a[2] - tb[2]]);
        assert!(err < 1e-6, "point-mass SH residual {err} m/s² vs −μr/r³");
        // And the potential is GM/r.
        let rn = norm(r);
        assert!((f.potential(r) - MU_EARTH / rn).abs() / (MU_EARTH / rn) < 1e-12);
    }

    #[test]
    fn p_bar_low_degree_matches_closed_forms() {
        // Spot-check the normalized Legendre values against their closed forms at a known φ.
        let phi = 0.5_f64;
        let (t, u) = (phi.sin(), phi.cos());
        let f = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 4);
        let (p, _) = f.legendre(t, u);
        assert!((p[0][0] - 1.0).abs() < 1e-14);
        assert!((p[1][0] - 3.0_f64.sqrt() * t).abs() < 1e-13, "P̄10");
        assert!((p[1][1] - 3.0_f64.sqrt() * u).abs() < 1e-13, "P̄11");
        // P̄20 = √5·(3t²−1)/2 ; P̄22 = (√15/2)·u²
        assert!(
            (p[2][0] - 5.0_f64.sqrt() * (3.0 * t * t - 1.0) / 2.0).abs() < 1e-13,
            "P̄20"
        );
        assert!(
            (p[2][2] - 15.0_f64.sqrt() / 2.0 * u * u).abs() < 1e-13,
            "P̄22"
        );
    }

    #[test]
    fn zonal_only_field_matches_the_independent_zonal_accel() {
        // Build a zonal-only SH field from the [J2..J6] constants (C̄_n0 = −J_n/√(2n+1)) and
        // require it to reproduce two_body + the independently-coded zonal_accel — validating the
        // whole normalized recurrence against code that never uses it.
        let jn = [J2, J3, J4, J5, J6];
        let mut f = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 6);
        f.set(0, 0, 1.0, 0.0);
        for (i, &j) in jn.iter().enumerate() {
            let n = i + 2;
            f.set(n, 0, -j / ((2 * n + 1) as f64).sqrt(), 0.0);
        }
        let r = leo_point();
        let a = f.acceleration(r);
        let tb = two_body_accel(r);
        let zo = zonal_accel(r, &jn);
        let expect = [tb[0] + zo[0], tb[1] + zo[1], tb[2] + zo[2]];
        let err = norm([a[0] - expect[0], a[1] - expect[1], a[2] - expect[2]]);
        let rel = err / norm(expect);
        assert!(rel < 1e-9, "zonal SH vs zonal_accel rel {rel} (abs {err})");
    }

    #[test]
    fn acceleration_equals_the_finite_difference_of_the_potential() {
        // The analytic gradient must equal the central-difference of the directly-summed
        // potential for the FULL EGM2008 field — tying the two code paths and catching any
        // Legendre / assembly error the zonal test can't see (it has no tesserals).
        let f = SphericalHarmonicField::egm2008_truncated(20);
        let r = leo_point();
        let a = f.acceleration(r);
        let h = 1.0; // metres
        let mut fd = [0.0; 3];
        for k in 0..3 {
            let mut rp = r;
            let mut rm = r;
            rp[k] += h;
            rm[k] -= h;
            fd[k] = (f.potential(rp) - f.potential(rm)) / (2.0 * h);
        }
        let err = norm([a[0] - fd[0], a[1] - fd[1], a[2] - fd[2]]);
        let rel = err / norm(a);
        assert!(rel < 1e-6, "analytic vs FD gradient rel {rel} (abs {err})");
    }

    #[test]
    fn full_egm2008_is_a_small_correction_to_two_body_at_leo() {
        // The full d/o-70 field at LEO must be dominated by the central term (J2 the largest
        // perturbation, ~1e-3 relative) and stay finite — a physical sanity gate.
        let f = SphericalHarmonicField::egm2008();
        assert_eq!(f.nmax, 70);
        let r = leo_point();
        let a = f.acceleration(r);
        let tb = two_body_accel(r);
        let pert = norm([a[0] - tb[0], a[1] - tb[1], a[2] - tb[2]]);
        let rel = pert / norm(tb);
        assert!(a.iter().all(|x| x.is_finite()));
        assert!(
            rel > 1e-4 && rel < 5e-3,
            "EGM2008 LEO perturbation rel {rel}"
        );
    }

    #[test]
    fn from_gfc_round_trips_the_committed_subset() {
        // Parsing the committed .gfc must recover the same coefficients as the generated table.
        let text = include_str!("../tools/egm2008_to70.gfc");
        let f = SphericalHarmonicField::from_gfc(text, 70).expect("parse gfc");
        assert_eq!(f.nmax, 70);
        let direct = SphericalHarmonicField::egm2008();
        // Compare the acceleration at a LEO point: identical inputs → identical output.
        let r = leo_point();
        let a1 = f.acceleration(r);
        let a2 = direct.acceleration(r);
        let err = norm([a1[0] - a2[0], a1[1] - a2[1], a1[2] - a2[2]]);
        assert!(err < 1e-12, "gfc-loaded vs generated accel differ by {err}");
    }

    #[test]
    fn from_gfc_accepts_icgem_gravity_constant_keyword() {
        // ICGEM celestial-body models (the GRAIL lunar fields, planetary models) carry the
        // GM under the `gravity_constant` keyword, not the Earth-centric
        // `earth_gravity_constant`. A minimal Moon-like field (GM, Re, C̄00=1) must load and
        // evaluate to the point-mass acceleration −μr/|r|³, proving the keyword path.
        let txt = "\
modelname test_moon
gravity_constant              0.4902799806931690D+13
radius                        0.1738000D+07
end_of_head
gfc    0     0  1.0000000000000000E+00  0.0000000000000000E+00
";
        let f = SphericalHarmonicField::from_gfc(txt, 10).expect("gravity_constant keyword loads");
        assert!(
            (f.gm - 4.902_799_806_931_69e12).abs() / f.gm < 1e-12,
            "GM {}",
            f.gm
        );
        assert!((f.re - 1_738_000.0).abs() < 1e-3, "Re {}", f.re);
        let r = [2.0e6, 0.0, 0.0];
        let a = f.acceleration(r);
        let want = -f.gm / (2.0e6f64).powi(2);
        assert!(
            (a[0] - want).abs() / want.abs() < 1e-12,
            "point mass a_x {} vs {want}",
            a[0]
        );
        assert!(
            a[1].abs() < 1e-6 && a[2].abs() < 1e-6,
            "off-axis leak {a:?}"
        );
    }

    // ── High-degree evaluator and streaming loader (MODELLED: internal consistency) ──────

    /// A deterministic synthetic field to degree `nmax` with Kaula-rule magnitudes
    /// (`~1e-5/n²`) and pseudo-random signs and phases, plus the central term when `central`.
    fn kaula_field(nmax: usize, central: bool) -> SphericalHarmonicField {
        let mut f = SphericalHarmonicField::zeros(EGM2008_GM, EGM2008_RE, nmax);
        if central {
            f.set(0, 0, 1.0, 0.0);
        }
        let mut state: u64 = 0x9E37_79B9_7F4A_7C15;
        let mut rnd = || {
            state = state
                .wrapping_mul(6_364_136_223_846_793_005)
                .wrapping_add(1_442_695_040_888_963_407);
            ((state >> 11) as f64 / (1u64 << 53) as f64) * 2.0 - 1.0
        };
        for n in 2..=nmax {
            let k = 1e-5 / (n * n) as f64;
            for m in 0..=n {
                let c = k * rnd();
                let s = if m == 0 { 0.0 } else { k * rnd() };
                f.set(n, m, c, s);
            }
        }
        f
    }

    fn sph(r: f64, lat_deg: f64, lon_deg: f64) -> Vec3 {
        let (sp, cp) = lat_deg.to_radians().sin_cos();
        let (sl, cl) = lon_deg.to_radians().sin_cos();
        [r * cp * cl, r * cp * sl, r * sp]
    }

    fn diff(a: Vec3, b: Vec3) -> f64 {
        norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]])
    }

    #[test]
    fn hf_matches_the_historical_evaluator_at_degree_70_away_from_the_poles() {
        // The new method and the historical one share the coefficients and the (α, β)
        // recursion constants but differ in scaling, summation order and gradient form;
        // away from the poles both are valid and must agree to rounding.
        let f = SphericalHarmonicField::egm2008();
        let mut worst_a = 0f64;
        let mut worst_u = 0f64;
        for &(r, lat, lon) in &[
            (6_778_136.3, 37.5, 23.1),
            (6_778_136.3, 0.0, -71.3),
            (6_378_136.3, -33.9, 151.2),
            (6_378_136.3, 80.0, -40.0),
            (7_200_000.0, -60.0, 200.0),
            (42_164_000.0, 0.05, 75.0),
        ] {
            let p = sph(r, lat, lon);
            let (a0, a1) = (f.acceleration(p), f.acceleration_hf(p));
            let (u0, u1) = (f.potential(p), f.potential_hf(p));
            worst_a = worst_a.max(diff(a0, a1) / norm(a0));
            worst_u = worst_u.max(((u0 - u1) / u0).abs());
        }
        assert!(worst_a < 1e-13, "accel rel diff {worst_a:e}");
        assert!(worst_u < 1e-14, "potential rel diff {worst_u:e}");
    }

    #[test]
    fn hf_point_mass_and_zonal_oracles() {
        // The two exact cases of the historical tests, now through the high-degree path,
        // including exactly on the polar axis.
        let mut f = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 4);
        f.set(0, 0, 1.0, 0.0);
        for r in [leo_point(), [0.0, 0.0, 7.0e6], [0.0, 0.0, -6.5e6]] {
            let (a, tb) = (f.acceleration_hf(r), two_body_accel(r));
            assert!(diff(a, tb) / norm(tb) < 1e-15, "point mass at {r:?}");
        }
        let jn = [J2, J3, J4, J5, J6];
        let mut z = SphericalHarmonicField::zeros(MU_EARTH, RE_EARTH, 6);
        z.set(0, 0, 1.0, 0.0);
        for (i, &j) in jn.iter().enumerate() {
            let n = i + 2;
            z.set(n, 0, -j / ((2 * n + 1) as f64).sqrt(), 0.0);
        }
        for r in [
            leo_point(),
            [0.0, 0.0, 7.0e6],
            [1e-3, 0.0, -7.0e6],
            [7.0e6, 0.0, 0.0],
        ] {
            let a = z.acceleration_hf(r);
            let tb = two_body_accel(r);
            let zo = zonal_accel(r, &jn);
            let want = [tb[0] + zo[0], tb[1] + zo[1], tb[2] + zo[2]];
            assert!(
                diff(a, want) / norm(want) < 1e-9,
                "zonal at {r:?}: {a:?} vs {want:?}"
            );
        }
    }

    #[test]
    fn hf_gradient_equals_the_finite_difference_of_hf_potential_at_degree_2190() {
        // A synthetic d/o-2190 field (no central term, so the potential carries no 6e7
        // offset to cancel), at the reference sphere where the high degrees matter most:
        // mid latitude, the underflow band of the plain recursion (68.2°), near and at a pole.
        let f = kaula_field(2190, false);
        let h = 0.5; // m, ≪ the ~9 km half-wavelength at degree 2190
        for p in [
            sph(EGM2008_RE, 37.5, 23.1),
            sph(EGM2008_RE, 68.2, -40.0),
            sph(EGM2008_RE, -89.9, 10.0),
            [0.0, 0.0, EGM2008_RE],
        ] {
            let a = f.acceleration_hf(p);
            let mut fd = [0.0; 3];
            for k in 0..3 {
                let (mut rp, mut rm) = (p, p);
                rp[k] += h;
                rm[k] -= h;
                fd[k] = (f.potential_hf(rp) - f.potential_hf(rm)) / (2.0 * h);
            }
            let rel = diff(a, fd) / norm(a);
            assert!(a.iter().all(|x| x.is_finite()), "non-finite at {p:?}");
            assert!(
                rel < 1e-5,
                "FD vs analytic at {p:?}: rel {rel:e} ({a:?} vs {fd:?})"
            );
        }
    }

    #[test]
    fn hf_is_continuous_at_the_poles() {
        // Exactly at either pole the result must equal the limit along every meridian.
        let f = kaula_field(360, true);
        for (r, sgn) in [(6_778_136.3, 1.0), (EGM2008_RE, -1.0)] {
            let pole = [0.0, 0.0, sgn * r];
            let ap = f.acceleration_hf(pole);
            assert!(ap.iter().all(|x| x.is_finite()));
            for lon in [0.0, 37.0, 90.0, 181.0, 300.0] {
                let near = sph(r, sgn * (90.0 - 1e-10), lon); // ~12 µm from the axis
                let an = f.acceleration_hf(near);
                let rel = diff(ap, an) / norm(ap);
                assert!(rel < 1e-10, "pole {sgn} lon {lon}: rel {rel:e}");
            }
            let (up, un) = (
                f.potential_hf(pole),
                f.potential_hf(sph(r, sgn * 89.999_999, 5.0)),
            );
            assert!(((up - un) / up).abs() < 1e-12);
        }
    }

    /// `P̄_nm(sin φ)` by the plain column recursion carried in extended-exponent arithmetic
    /// (mantissa + separate power-of-two exponent, renormalised as it grows): an evaluation
    /// independent of the Horner/fixed-scale scheme. Returns `log2 |P̄_nm|` and the sign.
    fn pbar_xnumber(n: usize, m: usize, t: f64, u: f64) -> (f64, f64) {
        // log2 P̄_mm = m·log2 u + Σ log2 of the sectoral factors.
        let mut lg = 0.0;
        for k in 1..=m {
            let kf = k as f64;
            let d = if k == 1 { 2.0 } else { 1.0 };
            lg += 0.5 * (d * (2.0 * kf + 1.0) / (2.0 * kf)).log2();
        }
        lg += m as f64 * u.log2();
        let (mut x2, mut x1) = (0.0, 1.0);
        for nn in (m + 1)..=n {
            let (nf, mf) = (nn as f64, m as f64);
            let alpha = ((2.0 * nf - 1.0) * (2.0 * nf + 1.0) / ((nf - mf) * (nf + mf))).sqrt();
            let beta = ((2.0 * nf + 1.0) * (nf - 1.0 - mf) * (nf - 1.0 + mf)
                / ((2.0 * nf - 3.0) * (nf - mf) * (nf + mf)))
                .sqrt();
            let x = alpha * t * x1 - beta * x2;
            x2 = x1;
            x1 = x;
            if x1.abs() > 1e100 {
                x1 *= 1e-100;
                x2 *= 1e-100;
                lg += 100.0 * 10f64.log2();
            }
        }
        (lg + x1.abs().log2(), x1.signum())
    }

    #[test]
    fn hf_has_no_sectoral_underflow_at_degree_2190() {
        // At 68.2° latitude, P̄_{806,806} ∝ cos^806 φ ≈ 1e-345 underflows in the plain
        // recursion, yet P̄_{2190,806} is of order one there (the band `u > m/N`). A field
        // with only C̄_{2190,806} = 1 must give U = GM/r·(Re/r)^2190·P̄_{2190,806}·cos(806λ).
        let (n, m) = (2190, 806);
        let mut f = SphericalHarmonicField::zeros(EGM2008_GM, EGM2008_RE, n);
        f.set(n, m, 1.0, 0.0);
        let lon: f64 = 0.0;
        let p = sph(EGM2008_RE, 68.2, lon);
        let rn = norm(p);
        let (t, u) = (p[2] / rn, (p[0] * p[0] + p[1] * p[1]).sqrt() / rn);
        let (lg, sg) = pbar_xnumber(n, m, t, u);
        assert!(lg > -10.0, "test premise: P̄ is not small here (log2 {lg})");
        assert!(
            m as f64 * u.log10() < -308.0,
            "test premise: cos^m φ underflows"
        );
        let want = f.gm / rn * (f.re / rn).powi(n as i32) * sg * lg.exp2();
        let got = f.potential_hf(p);
        assert!(
            ((got - want) / want).abs() < 1e-9,
            "U {got:e} vs extended-exponent {want:e}"
        );
        // The historical evaluator loses this term entirely (its P̄_mm is zero).
        let (pl, _) = f.legendre(t, u);
        assert_eq!(pl[n][m], 0.0);
    }

    #[test]
    fn hf_table_is_rebuilt_after_set() {
        let mut f = SphericalHarmonicField::egm2008_truncated(8);
        let r = leo_point();
        let a0 = f.acceleration_hf(r);
        f.set(8, 8, 1e-3, 0.0);
        let a1 = f.acceleration_hf(r);
        assert!(
            diff(a0, a1) > 1e-6,
            "a coefficient change must reach the HD path"
        );
        assert!(diff(a1, f.acceleration(r)) / norm(a1) < 1e-13);
    }

    #[test]
    fn from_gfc_reader_matches_from_gfc_and_checks_the_header() {
        let text = include_str!("../tools/egm2008_to70.gfc");
        let a = SphericalHarmonicField::from_gfc(text, 70).unwrap();
        let b = SphericalHarmonicField::from_gfc_reader(text.as_bytes(), 70).unwrap();
        assert_eq!(b.tide_system(), Some("tide_free"));
        assert_eq!((a.gm, a.re, a.nmax), (b.gm, b.re, b.nmax));
        for n in 0..=70 {
            for m in 0..=n {
                assert_eq!(a.cbar(n, m), b.cbar(n, m));
                assert_eq!(a.sbar(n, m), b.sbar(n, m));
            }
        }
        let c = SphericalHarmonicField::from_gfc_reader(text.as_bytes(), 12).unwrap();
        assert_eq!(c.nmax, 12);

        let head = "earth_gravity_constant 3.986004415e14\nradius 6378136.3\n";
        let bad = [
            (
                format!("{head}norm unnormalized\nend_of_head\ngfc 0 0 1 0\n"),
                "norm",
            ),
            (
                format!("{head}end_of_head\ngfc 0 0 1 0\ngfct 2 0 1 0 0 0 20000101\n"),
                "time-variable",
            ),
            (
                format!("{head}max_degree 2\nend_of_head\ngfc 3 0 1 0\n"),
                "max_degree",
            ),
            (format!("{head}end_of_head\ngfc 2 3 1 0\n"), "order"),
            (format!("{head}gfc 0 0 1 0\n"), "end_of_head"),
        ];
        for (txt, want) in bad {
            let e = SphericalHarmonicField::from_gfc_reader(txt.as_bytes(), 10).unwrap_err();
            assert!(e.contains(want), "{e:?} should mention {want}");
        }
        // Error columns and Fortran exponents.
        let ok = format!("{head}errors calibrated\nend_of_head\ngfc 0 0 1.0d0 0.0D0 0.0 0.0\n");
        let f = SphericalHarmonicField::from_gfc_reader(ok.as_bytes(), 10).unwrap();
        assert_eq!(f.cbar(0, 0), Some(1.0));
        assert!(SphericalHarmonicField::from_gfc_file("/nonexistent/egm.gfc", 2).is_err());
    }
}
