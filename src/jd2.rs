// SPDX-License-Identifier: AGPL-3.0-only
//! Two-part (high-precision) Julian dates.
//!
//! A Julian date held in a single `f64` carries ~15–16 significant digits, so near JD
//! 2 451 545 (J2000) the least significant bit is ~50 µs — too coarse for sub-µs timing,
//! phase, and frequency-transfer work. Splitting the date into an integer **day** part and
//! a fractional **frac** part (the SOFA / hifitime two-part convention) keeps the full
//! precision of the fraction regardless of the size of the day count, so differences of
//! nearby epochs are exact to the `f64` floor.

/// Seconds in a day.
const SEC_PER_DAY: f64 = 86_400.0;

/// A Julian date as an integer day plus a fractional remainder in `[0, 1)`.
/// `JD = day + frac`, but arithmetic keeps `frac` precise independent of `day`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Jd2 {
    /// Integer Julian day (the bulk of the magnitude).
    pub day: f64,
    /// Fractional day in `[0, 1)`.
    pub frac: f64,
}

impl Jd2 {
    /// Split a single-`f64` Julian date into its two-part form.
    pub fn new(jd: f64) -> Self {
        let day = jd.floor();
        Self {
            day,
            frac: jd - day,
        }
    }

    /// Construct from explicit parts, renormalising so `frac ∈ [0, 1)`.
    pub fn from_parts(day: f64, frac: f64) -> Self {
        let mut j = Self { day, frac };
        j.normalize();
        j
    }

    fn normalize(&mut self) {
        let carry = self.frac.floor();
        self.day += carry;
        self.frac -= carry;
    }

    /// Advance by `seconds` (which may be negative), keeping full precision.
    pub fn add_seconds(self, seconds: f64) -> Self {
        Self::from_parts(self.day, self.frac + seconds / SEC_PER_DAY)
    }

    /// The full Julian date as a single `f64` (loses sub-`f64`-floor precision for large
    /// day counts — use [`Jd2::diff_seconds`] when precision matters).
    pub fn total(self) -> f64 {
        self.day + self.frac
    }

    /// Difference `self − other` in seconds, computed part-by-part so a small difference of
    /// two large dates does not lose precision (the integer days cancel exactly).
    pub fn diff_seconds(self, other: Jd2) -> f64 {
        ((self.day - other.day) + (self.frac - other.frac)) * SEC_PER_DAY
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn round_trips_a_single_f64_date() {
        let jd = 2_451_545.523_4;
        let j = Jd2::new(jd);
        assert_eq!(j.day, 2_451_545.0);
        // The fraction only carries the input's own f64 precision (~1e-9 at JD 2.45e6) —
        // which is exactly the coarseness this two-part form exists to escape.
        assert!((j.frac - 0.523_4).abs() < 1e-9);
        assert!((j.total() - jd).abs() < 1e-9);
    }

    #[test]
    fn from_parts_normalizes_the_fraction() {
        let j = Jd2::from_parts(2_451_545.0, 1.25); // 1.25 days of fraction
        assert_eq!(j.day, 2_451_546.0);
        assert!((j.frac - 0.25).abs() < 1e-15);
        let k = Jd2::from_parts(2_451_545.0, -0.25);
        assert_eq!(k.day, 2_451_544.0);
        assert!((k.frac - 0.75).abs() < 1e-15);
    }

    #[test]
    fn preserves_microsecond_precision_a_single_f64_loses() {
        // One microsecond at J2000.
        let t0 = Jd2::new(2_451_545.0);
        let t1 = t0.add_seconds(1.0e-6);
        // The two-part difference recovers the microsecond exactly…
        assert!(
            (t1.diff_seconds(t0) - 1.0e-6).abs() < 1e-15,
            "Δ = {}",
            t1.diff_seconds(t0)
        );
        // …whereas the naive single-f64 JD round-trip cannot resolve it near 2.45e6.
        let naive = (2_451_545.0_f64 + 1.0e-6 / SEC_PER_DAY) - 2_451_545.0;
        assert!(
            (naive * SEC_PER_DAY - 1.0e-6).abs() > 1.0e-7,
            "single-f64 unexpectedly kept the µs: {}",
            naive * SEC_PER_DAY
        );
    }

    #[test]
    fn add_seconds_is_additive_and_reversible() {
        let t = Jd2::new(2_460_000.0);
        let forward = t.add_seconds(3600.0).add_seconds(-3600.0);
        assert!(forward.diff_seconds(t).abs() < 1e-9);
        // A day of seconds advances the day count by one.
        let plus_day = t.add_seconds(SEC_PER_DAY);
        assert_eq!(plus_day.day, 2_460_001.0);
        assert!(plus_day.frac.abs() < 1e-9);
    }
}
