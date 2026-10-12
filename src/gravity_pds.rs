// SPDX-License-Identifier: AGPL-3.0-only
//! Planetary gravity fields from the **PDS SHADR** spherical-harmonic tables: the published
//! high-degree Mars (GMM-3, degree/order 120) and Moon (GRAIL GL0660B, degree/order 660) fields,
//! and any other body whose field the Planetary Data System (PDS) distributes in that format.
//!
//! The SHADR ("spherical harmonic ASCII data record") product is a comma-separated ASCII table:
//!
//! * one **header record**: reference radius (km), GM (km³/s²), the uncertainty of GM, the degree
//!   and order of the field, the normalization state (`1` = fully normalized), and the reference
//!   longitude and latitude of the expansion (both normally 0);
//! * one **coefficient record** per `(n, m)`: `n, m, C̄_nm, S̄_nm, σC̄_nm, σS̄_nm`.
//!
//! [`SphericalHarmonicField::from_shadr`] reads it into the crate's
//! [`SphericalHarmonicField`], converting km → m and km³/s² → m³/s², and sets `C̄00 = 1` when the
//! table carries no degree-0 record (PDS gravity tables start at degree 1; the central term is
//! the header's GM). Records are fixed-length with blank padding and CR/LF terminators; both
//! are tolerated, as are Fortran `D` exponents.
//!
//! [`Body::with_gravity_field`] attaches any such field to a [`Body`] (opt-in; the default bodies
//! are unchanged), so the propagator's central-gravity path evaluates it in the body-fixed frame.
//!
//! ## Validation
//!
//! The reader and the existing evaluator ([`SphericalHarmonicField::acceleration`]) are compared
//! with an independent implementation, pyshtools, which reads the same SHADR files itself, at
//! pre-registered points from low orbit to areostationary radius and up to 0.1° from the poles
//! (`xval/planetary-gravity-pyshtools/`). The committed degree-20 crops of GMM-3 and GL0660B are
//! checked in CI; the full-degree files are checked when `KSHANA_GMM3_SHA` / `KSHANA_GRAIL_SHA`
//! point at them. The parsed GM, radius, coefficient count and selected coefficients are checked
//! against the values printed in the PDS products.
//!
//! ## Scope (honest)
//!
//! * Only fully normalized tables (normalization state 1) with a zero reference longitude and
//!   latitude are accepted; anything else is an error, not a silent mis-read.
//! * The uncertainty columns are read past, not stored.
//! * **Frames.** A field is defined in its producer's body-fixed frame: GMM-3 in the Konopliv et
//!   al. (2006) Mars frame (the PDS label stresses it is *not* the IAU system), GL0660B in the
//!   DE421 lunar principal-axis frame. The crate's body-fixed rotation for a [`Body`] is its IAU
//!   pole and prime meridian ([`crate::mars_frame`]), so a field attached with
//!   [`Body::with_gravity_field`] is evaluated in the IAU frame; the frame offset is not
//!   modelled here.
//! * **Degree limit of the evaluator.** [`SphericalHarmonicField::acceleration`] uses an unscaled
//!   sectoral recurrence (`P̄_mm ∝ cos^m φ`), which underflows double precision when `cos^n φ`
//!   falls below ~1e-308: for degree 660 above about 70° latitude. Within |latitude| ≤ 60° the
//!   degree-660 GL0660B evaluation was compared with the oracle (see the results file); at
//!   degree 120 (GMM-3) the whole sphere was.

use crate::body::Body;
use crate::gravity_sh::SphericalHarmonicField;

/// The header record of a PDS SHADR table, in the units the table states (km, km³/s², degrees).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ShadrHeader {
    /// Reference radius of the expansion (km).
    pub reference_radius_km: f64,
    /// Gravitational parameter GM (km³/s²).
    pub gm_km3_s2: f64,
    /// Uncertainty of GM (km³/s²) as the table states it.
    pub gm_sigma_km3_s2: f64,
    /// Degree of the field.
    pub degree: usize,
    /// Order of the field.
    pub order: usize,
    /// Normalization state: 0 unnormalized, 1 fully normalized, 2 other.
    pub normalization: u32,
    /// Reference longitude of the expansion (degrees east); normally 0.
    pub reference_lon_deg: f64,
    /// Reference latitude of the expansion (degrees); normally 0.
    pub reference_lat_deg: f64,
}

/// Parse a SHADR real field (`E` or Fortran `D` exponent).
fn real(t: &str) -> Result<f64, String> {
    let t = t.trim();
    t.replace(['d', 'D'], "e")
        .parse::<f64>()
        .map_err(|_| format!("bad real '{t}'"))
}

/// Parse a SHADR integer field (tolerating a real written for an integer, such as `120.0`).
fn int(t: &str) -> Result<i64, String> {
    let t = t.trim();
    if let Ok(v) = t.parse::<i64>() {
        return Ok(v);
    }
    let v = real(t)?;
    if v.fract() == 0.0 && v.abs() < 1e9 {
        Ok(v as i64)
    } else {
        Err(format!("bad integer '{t}'"))
    }
}

/// The non-blank records of a SHADR table, with padding and CR stripped.
fn records(text: &str) -> impl Iterator<Item = &str> {
    text.lines()
        .map(|l| l.trim_end_matches(['\r', ' ', '\t']))
        .filter(|l| !l.trim().is_empty())
}

impl ShadrHeader {
    /// Parse the header (first non-blank) record of a SHADR table.
    pub fn parse(text: &str) -> Result<Self, String> {
        let line = records(text).next().ok_or("empty SHADR table")?;
        let f: Vec<&str> = line.split(',').collect();
        if f.len() < 6 {
            return Err(format!(
                "SHADR header has {} fields, expected at least 6",
                f.len()
            ));
        }
        let deg = int(f[3])?;
        let ord = int(f[4])?;
        let norm = int(f[5])?;
        if deg < 0 || ord < 0 || !(0..=2).contains(&norm) {
            return Err("SHADR header: negative degree/order or unknown normalization".into());
        }
        Ok(Self {
            reference_radius_km: real(f[0])?,
            gm_km3_s2: real(f[1])?,
            gm_sigma_km3_s2: real(f[2])?,
            degree: deg as usize,
            order: ord as usize,
            normalization: norm as u32,
            reference_lon_deg: f.get(6).map(|t| real(t)).transpose()?.unwrap_or(0.0),
            reference_lat_deg: f.get(7).map(|t| real(t)).transpose()?.unwrap_or(0.0),
        })
    }
}

impl SphericalHarmonicField {
    /// Parse a fully-normalized **PDS SHADR** gravity table (e.g. GMM-3 `gmm3_120_sha.tab`,
    /// GRAIL GL0660B `jggrx_0660b_sha.tab`) to degree/order `nmax`.
    ///
    /// GM and the reference radius come from the header record and are converted to SI
    /// (`× 1e9`, `× 1e3`). `C̄00` is set to 1 unless the table carries its own degree-0 record.
    /// The resulting field's degree is the highest degree read, capped at `nmax`. Errors: a
    /// header that is not normalization state 1, a non-zero reference longitude/latitude, a
    /// non-physical GM or radius, a malformed record, an order above its degree, or a missing
    /// coefficient for some `2 ≤ n ≤ degree`, `0 ≤ m ≤ n` (a truncated download).
    pub fn from_shadr(text: &str, nmax: usize) -> Result<Self, String> {
        let h = ShadrHeader::parse(text)?;
        if h.normalization != 1 {
            return Err(format!(
                "SHADR normalization state {} (only fully normalized, state 1, is supported)",
                h.normalization
            ));
        }
        if h.reference_lon_deg != 0.0 || h.reference_lat_deg != 0.0 {
            return Err("SHADR reference longitude/latitude must be 0".into());
        }
        let gm = h.gm_km3_s2 * 1.0e9;
        let re = h.reference_radius_km * 1.0e3;
        if !(gm.is_finite() && gm > 0.0) {
            return Err("non-physical GM (must be finite and positive)".into());
        }
        if !(re.is_finite() && re > 0.0) {
            return Err("non-physical reference radius (must be finite and positive)".into());
        }
        let cap = nmax.min(h.degree);
        let mut rows: Vec<(usize, usize, f64, f64)> = Vec::new();
        let mut max_n = 0usize;
        let mut have_c00 = false;
        for (k, line) in records(text).enumerate().skip(1) {
            let f: Vec<&str> = line.split(',').collect();
            if f.len() < 4 {
                return Err(format!("SHADR record {}: {} fields", k + 1, f.len()));
            }
            let n = int(f[0])?;
            let m = int(f[1])?;
            if n < 0 || m < 0 || m > n {
                return Err(format!("SHADR record {}: bad (n, m) = ({n}, {m})", k + 1));
            }
            let (n, m) = (n as usize, m as usize);
            if n > cap {
                continue;
            }
            let c = real(f[2])?;
            let s = real(f[3])?;
            if !(c.is_finite() && s.is_finite()) {
                return Err(format!("SHADR record {}: non-finite coefficient", k + 1));
            }
            if n == 0 {
                have_c00 = true;
            }
            max_n = max_n.max(n);
            rows.push((n, m, c, s));
        }
        if rows.is_empty() {
            return Err("no SHADR coefficient records".into());
        }
        // Completeness: every (n, m) with 2 ≤ n ≤ max_n must be present.
        let mut seen = vec![vec![false; max_n + 1]; max_n + 1];
        for &(n, m, _, _) in &rows {
            seen[n][m] = true;
        }
        for (n, row) in seen.iter().enumerate().skip(2) {
            if let Some(m) = row[..=n].iter().position(|&b| !b) {
                return Err(format!("SHADR table incomplete: missing (n, m) = ({n}, {m})"));
            }
        }
        let mut f = Self::zeros(gm, re, max_n);
        if !have_c00 {
            f.set(0, 0, 1.0, 0.0);
        }
        for (n, m, c, s) in rows {
            f.set(n, m, c, s);
        }
        Ok(f)
    }
}

impl Body {
    /// This body with a full spherical-harmonic gravity field attached in its
    /// [`gravity`](Body::gravity) slot (opt-in; replaces any field already there). The
    /// propagator's central-gravity path then evaluates the field in the body-fixed frame
    /// ([`crate::mars_frame`], the body's IAU pole and prime meridian) using the field's own GM
    /// and reference radius; the body's `mu`, `re` and `zonals` are left as they are for every
    /// other use. Typical use: `Body::mars().with_gravity_field(SphericalHarmonicField::from_shadr(
    /// &gmm3_text, 120)?)`. See the module notes on the frame each published field is defined in.
    pub fn with_gravity_field(mut self, field: SphericalHarmonicField) -> Self {
        self.gravity = Some(field);
        self
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const HDR: &str = " 0.1738000000000000E+04, 0.4902800305555400E+04, 0.1096570000000000E-04,    2,    2,    1, 0.0000000000000000E+00, 0.0000000000000000E+00      \r\n";

    fn table(rows: &str) -> String {
        format!("{HDR}{rows}")
    }

    const ROWS2: &str = "    1,    0, 0.0E+00, 0.0E+00, 0.0E+00, 0.0E+00\r\n    1,    1, 0.0E+00, 0.0E+00, 0.0E+00, 0.0E+00\r\n    2,    0,-0.9088083466222001E-04, 0.0E+00, 0.1E-10, 0.0E+00\r\n    2,    1, 0.1D-09, 0.2D-08, 0.0E+00, 0.0E+00\r\n    2,    2, 0.3467379822995000E-04,-0.2489004351630000E-09, 0.0E+00, 0.0E+00   \r\n";

    #[test]
    fn header_and_units() {
        let h = ShadrHeader::parse(HDR).unwrap();
        assert_eq!(h.degree, 2);
        assert_eq!(h.normalization, 1);
        let f = SphericalHarmonicField::from_shadr(&table(ROWS2), 10).unwrap();
        assert_eq!(f.gm, 4.902_800_305_555_4e3 * 1e9);
        assert_eq!(f.re, 1_738_000.0);
        assert_eq!(f.nmax, 2);
        assert_eq!(f.cbar(0, 0), Some(1.0), "C00 defaults to 1");
        assert_eq!(f.cbar(2, 0), Some(-0.908_808_346_622_200_1e-4));
        assert_eq!(f.sbar(2, 1), Some(0.2e-8), "Fortran D exponent");
        assert_eq!(f.sbar(2, 2), Some(-0.248_900_435_163e-9));
    }

    #[test]
    fn truncation_and_explicit_c00() {
        let f = SphericalHarmonicField::from_shadr(&table(ROWS2), 1).unwrap();
        assert_eq!(f.nmax, 1);
        let t = table(&format!("    0,    0, 0.5E+00, 0.0E+00\n{ROWS2}"));
        let f = SphericalHarmonicField::from_shadr(&t, 2).unwrap();
        assert_eq!(f.cbar(0, 0), Some(0.5), "an explicit C00 record is kept");
    }

    #[test]
    fn point_mass_table_is_exact_two_body() {
        let t = table("    1,    0, 0.0, 0.0\n    1,    1, 0.0, 0.0\n");
        let f = SphericalHarmonicField::from_shadr(&t, 2).unwrap();
        let r = [2.0e6, 0.0, 0.0];
        let a = f.acceleration(r);
        let want = -f.gm / 4.0e12;
        assert!((a[0] - want).abs() <= 1e-15 * want.abs());
    }

    #[test]
    fn rejects_malformed_tables() {
        let bad_norm = HDR.replacen(",    1, 0.0", ",    0, 0.0", 1);
        assert!(SphericalHarmonicField::from_shadr(&format!("{bad_norm}{ROWS2}"), 2).is_err());
        let bad_ref = HDR.replacen("0.0000000000000000E+00      ", "1.0E+00", 1);
        assert!(SphericalHarmonicField::from_shadr(&format!("{bad_ref}{ROWS2}"), 2).is_err());
        let neg_gm = HDR.replacen(" 0.4902800305555400E+04", "-0.4902800305555400E+04", 1);
        assert!(SphericalHarmonicField::from_shadr(&format!("{neg_gm}{ROWS2}"), 2).is_err());
        // Missing (2, 1): a truncated table is an error, not zeros.
        let missing = ROWS2.replace("    2,    1, 0.1D-09, 0.2D-08, 0.0E+00, 0.0E+00\r\n", "");
        let e = SphericalHarmonicField::from_shadr(&table(&missing), 2).unwrap_err();
        assert!(e.contains("(2, 1)"), "{e}");
        assert!(SphericalHarmonicField::from_shadr(&table("    2,    3, 0.0, 0.0\n"), 2).is_err());
        assert!(SphericalHarmonicField::from_shadr(&table("    2,    0, x, 0.0\n"), 2).is_err());
        assert!(SphericalHarmonicField::from_shadr(HDR, 2).is_err(), "no records");
        assert!(SphericalHarmonicField::from_shadr("", 2).is_err());
    }

    #[test]
    fn with_gravity_field_is_opt_in() {
        let f = SphericalHarmonicField::from_shadr(&table(ROWS2), 2).unwrap();
        assert!(Body::moon().gravity.is_none(), "default Moon unchanged");
        let b = Body::moon().with_gravity_field(f);
        assert_eq!(b.gravity.as_ref().map(|g| g.nmax), Some(2));
        assert_eq!(b.mu, Body::moon().mu, "body constants untouched");
    }
}
