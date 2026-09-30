// SPDX-License-Identifier: AGPL-3.0-only
//! Transcendental functions that return the same bits on every platform.
//!
//! ## Why this module exists
//!
//! Rust's `f64` addition, multiplication, division and square root are IEEE-754
//! operations, correctly rounded, and the compiler does not contract them into fused
//! multiply-adds: they give the same bits everywhere. The transcendentals do not.
//! `f64::sin`, `cos`, `acos`, `atan2`, `exp`, `ln`, `powf`, `hypot` and the rest call the
//! host's mathematics library, no standard requires those to be correctly rounded, and
//! each host rounds the last place its own way. Measured over 20 000 arguments in
//! `[-7, 7]`, the aarch64 macOS library and the library a WebAssembly (WASM) build links
//! disagree in the last bit for 781 sines, 858 cosines, 1 931 exponentials and 1 899
//! two-argument arctangents.
//!
//! For most of the engine that is harmless and documented (`docs/REPRODUCIBILITY.md`:
//! values agree across platforms to 1e-6). It stops being harmless where a result is
//! **discrete**. The low Earth orbit (LEO) navigation message is the case that forced
//! this module: its binary frame is the quantised output of a least-squares fit, the fit
//! starts from osculating elements that come out of an `acos` and an `atan2`, and a
//! difference of one unit in the last place there grew, through eighty
//! Levenberg–Marquardt iterations, into different transmitted integers. The same
//! scenario produced frame check value `0x110315` natively and `0x6A82D9` in the browser.
//! A frame that differs between two machines is not a frame.
//!
//! ## What it provides
//!
//! * [`PortableFloat`], an extension trait on `f64` whose methods (`psin`, `pcos`,
//!   `patan2`, …) mirror the inherent ones but are computed by the pure-Rust `libm`
//!   crate. That crate is compiled from the same source for every target, uses only
//!   IEEE-754 basic operations, and is pinned by `Cargo.lock`, so its results are a
//!   function of the argument alone. A module that must be bit-reproducible calls these
//!   and never the inherent methods.
//! * [`Maths`], with the two implementations [`Platform`] and [`Portable`], for code
//!   shared between a bit-reproducible caller and callers whose published numbers were
//!   computed with the host library. The shared function is written once, generic over
//!   [`Maths`]; the existing entry point instantiates it with [`Platform`] and is
//!   unchanged to the last bit, and a `_portable` entry point instantiates it with
//!   [`Portable`].
//!
//! Integer powers are included. `f64::powi` is documented as having unspecified
//! precision (the compiler may expand it differently from one call site to the next), so
//! [`powi`] spells the square-and-multiply sequence out.
//!
//! What is already portable and therefore not wrapped: `sqrt`, `abs`, `floor`, `ceil`,
//! `round`, `trunc`, `%`, `rem_euclid`, `min`, `max`, `clamp`, `mul_add`, `to_radians`
//! and `to_degrees` (exact or correctly rounded by definition), and the seeded normal
//! draws of `rand_distr`, which already route through `libm` on every target.
//!
//! ## Random indices
//!
//! One more platform dependence lives here because it has the same effect.
//! `Rng::gen_range` over `usize` draws 64 bits from the generator on a 64-bit target and
//! 32 bits on a 32-bit one (WebAssembly), so the same seed gives a different index and
//! leaves the stream at a different place. [`uniform_index`] always draws through `u64`,
//! which is exactly what a 64-bit host did before, so no native number moves.
//!
//! `src/leo_navmsg/tests.rs` pins a whole encoded frame, byte for byte, on every
//! platform, and scans the module's sources for an inherent transcendental call. If
//! `libm` ever changes a result, or someone writes `.sin()` there, that test says so.

/// The mathematics library a shared routine is evaluated with. See the module
/// documentation for when a routine needs to be generic over this.
pub(crate) trait Maths {
    /// Sine.
    fn sin(x: f64) -> f64;
    /// Cosine.
    fn cos(x: f64) -> f64;
    /// Sine and cosine of the same argument.
    fn sin_cos(x: f64) -> (f64, f64);
    /// Four-quadrant arctangent of `y / x`.
    fn atan2(y: f64, x: f64) -> f64;
    /// Natural exponential.
    fn exp(x: f64) -> f64;
    /// `x` raised to the integer power `n`.
    fn powi(x: f64, n: i32) -> f64;
}

/// The host's own mathematics library: what every routine in the crate used before this
/// module existed, kept so that their published numbers do not move.
pub(crate) struct Platform;

impl Maths for Platform {
    #[inline]
    fn sin(x: f64) -> f64 {
        x.sin()
    }
    #[inline]
    fn cos(x: f64) -> f64 {
        x.cos()
    }
    #[inline]
    fn sin_cos(x: f64) -> (f64, f64) {
        x.sin_cos()
    }
    #[inline]
    fn atan2(y: f64, x: f64) -> f64 {
        y.atan2(x)
    }
    #[inline]
    fn exp(x: f64) -> f64 {
        x.exp()
    }
    #[inline]
    fn powi(x: f64, n: i32) -> f64 {
        x.powi(n)
    }
}

/// The pure-Rust library: the same bits on every platform.
pub(crate) struct Portable;

impl Maths for Portable {
    #[inline]
    fn sin(x: f64) -> f64 {
        libm::sin(x)
    }
    #[inline]
    fn cos(x: f64) -> f64 {
        libm::cos(x)
    }
    #[inline]
    fn sin_cos(x: f64) -> (f64, f64) {
        (libm::sin(x), libm::cos(x))
    }
    #[inline]
    fn atan2(y: f64, x: f64) -> f64 {
        libm::atan2(y, x)
    }
    #[inline]
    fn exp(x: f64) -> f64 {
        libm::exp(x)
    }
    #[inline]
    fn powi(x: f64, n: i32) -> f64 {
        powi(x, n)
    }
}

/// `x` raised to the integer power `n` by square-and-multiply, the reciprocal taken last
/// for a negative `n`. Multiplications and one division only, in a fixed order.
pub(crate) fn powi(x: f64, n: i32) -> f64 {
    let mut base = x;
    let mut e = n.unsigned_abs();
    let mut acc = 1.0;
    loop {
        if e & 1 == 1 {
            acc *= base;
        }
        e >>= 1;
        if e == 0 {
            break;
        }
        base *= base;
    }
    if n < 0 {
        1.0 / acc
    } else {
        acc
    }
}

/// A uniform index in `0..n`, drawn the same way on every platform (see the module
/// documentation). `n` must be positive.
pub(crate) fn uniform_index<R: rand::Rng + ?Sized>(rng: &mut R, n: usize) -> usize {
    rng.gen_range(0..n as u64) as usize
}

/// Platform-independent counterparts of the inherent `f64` transcendentals. Each method
/// is the inherent one's name with a `p` in front.
pub(crate) trait PortableFloat: Sized {
    /// Sine.
    fn psin(self) -> f64;
    /// Cosine.
    fn pcos(self) -> f64;
    /// Sine and cosine.
    fn psin_cos(self) -> (f64, f64);
    /// Arcsine.
    fn pasin(self) -> f64;
    /// Arccosine.
    fn pacos(self) -> f64;
    /// Four-quadrant arctangent of `self / x`.
    fn patan2(self, x: f64) -> f64;
    /// Natural exponential.
    fn pexp(self) -> f64;
    /// Base-2 logarithm.
    fn plog2(self) -> f64;
    /// Base-10 logarithm.
    fn plog10(self) -> f64;
    /// `self` raised to the real power `y`.
    fn ppowf(self, y: f64) -> f64;
    /// `self` raised to the integer power `n`.
    fn ppowi(self, n: i32) -> f64;
    /// `sqrt(self² + y²)` without intermediate overflow.
    fn phypot(self, y: f64) -> f64;
}

impl PortableFloat for f64 {
    #[inline]
    fn psin(self) -> f64 {
        libm::sin(self)
    }
    #[inline]
    fn pcos(self) -> f64 {
        libm::cos(self)
    }
    #[inline]
    fn psin_cos(self) -> (f64, f64) {
        (libm::sin(self), libm::cos(self))
    }
    #[inline]
    fn pasin(self) -> f64 {
        libm::asin(self)
    }
    #[inline]
    fn pacos(self) -> f64 {
        libm::acos(self)
    }
    #[inline]
    fn patan2(self, x: f64) -> f64 {
        libm::atan2(self, x)
    }
    #[inline]
    fn pexp(self) -> f64 {
        libm::exp(self)
    }
    #[inline]
    fn plog2(self) -> f64 {
        libm::log2(self)
    }
    #[inline]
    fn plog10(self) -> f64 {
        libm::log10(self)
    }
    #[inline]
    fn ppowf(self, y: f64) -> f64 {
        libm::pow(self, y)
    }
    #[inline]
    fn ppowi(self, n: i32) -> f64 {
        powi(self, n)
    }
    #[inline]
    fn phypot(self, y: f64) -> f64 {
        libm::hypot(self, y)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const UNIFORM_INDEX_PIN: [usize; 12] =
        [157, 704, 726, 601, 359, 83, 849, 364, 989, 200, 384, 521];

    /// The values are the library's, pinned as bit patterns: this is the statement that
    /// they do not depend on the host. A host whose own library happens to agree proves
    /// nothing; the pins are what a different host is held to.
    #[test]
    fn the_portable_functions_return_the_pinned_bits_on_every_platform() {
        let cases: [(&str, f64, u64); 10] = [
            ("sin", 1.7034438_f64.psin(), 0x3fefb808f91de1e0),
            ("cos", 1.7034438_f64.pcos(), 0xbfc0eddb62a69656),
            ("exp", (-1.7034438_f64).pexp(), 0x3fc74d980f93c69e),
            ("atan2", 1.7034438_f64.patan2(0.7), 0x3ff2e4f8b8f74a7a),
            ("sin", 123.456_f64.psin(), 0xbfe9b9dadc41aeb6),
            ("cos", 123.456_f64.pcos(), 0xbfe307e5980a1558),
            ("exp", (-123.456_f64).pexp(), 0x34cda9fb9e4ee720),
            ("atan2", 123.456_f64.patan2(0.7), 0x3ff90ac1edccde0d),
            ("sin", 6.0_f64.psin(), 0xbfd1e1f18ab0a2c0),
            ("exp", (-6.0_f64).pexp(), 0x3f644e51f113d4d6),
        ];
        for (name, got, want) in cases {
            assert_eq!(got.to_bits(), want, "{name}: {got:e}");
        }
    }

    /// The indices a 64-bit host always drew for this seed. A 32-bit target that drew
    /// through `usize` would give other values; through `u64` it gives these.
    #[test]
    fn uniform_index_is_the_sixty_four_bit_draw_on_every_platform() {
        use rand::{Rng, SeedableRng};
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(7);
        let got: Vec<usize> = (0..12).map(|_| uniform_index(&mut rng, 1000)).collect();
        assert_eq!(got, UNIFORM_INDEX_PIN);
        // And it is the same draw as the explicit 64-bit range.
        let mut a = rand_chacha::ChaCha8Rng::seed_from_u64(99);
        let mut b = rand_chacha::ChaCha8Rng::seed_from_u64(99);
        for n in 1..500usize {
            assert_eq!(uniform_index(&mut a, n), b.gen_range(0..n as u64) as usize);
        }
    }

    #[test]
    fn sin_cos_is_the_pair_of_the_separate_functions() {
        for k in 0..2000 {
            let x = -40.0 + 0.04 * k as f64 + 1e-3;
            let (s, c) = x.psin_cos();
            assert_eq!(s.to_bits(), x.psin().to_bits());
            assert_eq!(c.to_bits(), x.pcos().to_bits());
            let (s, c) = Portable::sin_cos(x);
            assert_eq!(s.to_bits(), x.psin().to_bits());
            assert_eq!(c.to_bits(), x.pcos().to_bits());
        }
    }

    #[test]
    fn integer_powers_are_exact_products() {
        assert_eq!(powi(3.0, 0), 1.0);
        assert_eq!(powi(3.0, 1), 3.0);
        assert_eq!(powi(3.0, 5), 243.0);
        assert_eq!(powi(2.0, -3), 0.125);
        assert_eq!(powi(2.0, 40), 1_099_511_627_776.0);
        assert_eq!(powi(-2.0, 3), -8.0);
        assert_eq!(powi(0.0, 0), 1.0);
        // The stated sequence for an odd power: x · x² · x⁴.
        let x = 1.000_000_123_f64;
        let x2 = x * x;
        assert_eq!(powi(x, 7).to_bits(), (x * x2 * (x2 * x2)).to_bits());
        assert_eq!(powi(x, i32::MIN), 1.0 / powi(x * x, 1 << 30));
    }

    #[test]
    fn the_portable_library_agrees_with_the_host_to_the_last_place_or_two() {
        // Not a portability claim: a guard against wiring a method to the wrong function.
        for k in 1..400 {
            let x = 0.0173 * k as f64;
            let close = |a: f64, b: f64| (a - b).abs() <= 4.0 * f64::EPSILON * a.abs().max(1.0);
            assert!(close(x.psin(), x.sin()));
            assert!(close(x.pcos(), x.cos()));
            assert!(close((x / 8.0).pasin(), (x / 8.0).asin()));
            assert!(close((x / 8.0).pacos(), (x / 8.0).acos()));
            assert!(close(x.patan2(0.3), x.atan2(0.3)));
            assert!(close((-x).pexp(), (-x).exp()));
            assert!(close(x.plog2(), x.log2()));
            assert!(close(x.plog10(), x.log10()));
            assert!(close(x.ppowf(1.7), x.powf(1.7)));
            assert!(close(x.ppowi(5), x.powi(5)));
            assert!(close(x.phypot(2.5), x.hypot(2.5)));
            assert!(close(Portable::atan2(x, 0.3), Platform::atan2(x, 0.3)));
            assert!(close(Portable::exp(-x), Platform::exp(-x)));
            assert!(close(Portable::powi(x, -4), Platform::powi(x, -4)));
            assert!(close(Portable::sin(x), Platform::sin(x)));
            assert!(close(Portable::cos(x), Platform::cos(x)));
        }
    }
}
