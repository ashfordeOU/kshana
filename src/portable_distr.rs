// SPDX-License-Identifier: AGPL-3.0-only
//! `rand_distr`'s normal, gamma and exponential samplers with the host mathematics library
//! taken out. They are `rand_distr` 0.4.3's algorithms line for line (the same ziggurat
//! tables, the same draws from the generator, the same accept and reject tests), so a seed
//! gives the same stream of deviates as before; the only change is that the `exp` and `ln`
//! of the rare wedge, tail and rejection branches go through `libm`, so those deviates are the
//! same bits on native and `wasm32` instead of differing in the last place.
//!
//! Only the `f64` forms the crate uses are provided: [`StandardNormal`], [`Normal`] and
//! [`Gamma`].

use crate::portable_distr_tables as tab;
use crate::portable_math::PortableFloat;
use rand::distributions::Open01;
use rand::Rng;
pub(crate) use rand::distributions::Distribution;
use std::fmt;

/// The error of a constructor given a parameter the distribution does not accept.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Error {
    /// The standard deviation is not finite.
    BadVariance,
    /// The shape is not strictly positive.
    ShapeTooSmall,
    /// The scale is not strictly positive.
    ScaleTooSmall,
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(match self {
            Error::BadVariance => "variance is non-finite in normal distribution",
            Error::ShapeTooSmall => "shape is not positive in gamma distribution",
            Error::ScaleTooSmall => "scale is not positive in gamma distribution",
        })
    }
}

impl std::error::Error for Error {}

#[inline]
fn into_float_with_exponent(bits: u64, exponent: i32) -> f64 {
    f64::from_bits(bits | (((1023 + exponent) as u64) << 52))
}

#[inline(always)]
fn ziggurat<R: Rng + ?Sized, P, Z>(
    rng: &mut R,
    symmetric: bool,
    x_tab: tab::ZigTable,
    f_tab: tab::ZigTable,
    mut pdf: P,
    mut zero_case: Z,
) -> f64
where
    P: FnMut(f64) -> f64,
    Z: FnMut(&mut R, f64) -> f64,
{
    loop {
        let bits = rng.next_u64();
        let i = bits as usize & 0xff;
        let u = if symmetric {
            into_float_with_exponent(bits >> 12, 1) - 3.0
        } else {
            into_float_with_exponent(bits >> 12, 0) - (1.0 - f64::EPSILON / 2.0)
        };
        let x = u * x_tab[i];
        let test_x = if symmetric { x.abs() } else { x };
        if test_x < x_tab[i + 1] {
            return x;
        }
        if i == 0 {
            return zero_case(rng, u);
        }
        if f_tab[i + 1] + (f_tab[i] - f_tab[i + 1]) * rng.gen::<f64>() < pdf(x) {
            return x;
        }
    }
}

/// The standard normal distribution.
#[derive(Clone, Copy, Debug)]
pub(crate) struct StandardNormal;

impl Distribution<f64> for StandardNormal {
    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> f64 {
        #[inline]
        fn pdf(x: f64) -> f64 {
            (-x * x / 2.0).pexp()
        }
        #[inline]
        fn zero_case<R: Rng + ?Sized>(rng: &mut R, u: f64) -> f64 {
            let mut x = 1.0f64;
            let mut y = 0.0f64;
            while -2.0 * y < x * x {
                let x_: f64 = rng.sample(Open01);
                let y_: f64 = rng.sample(Open01);
                x = x_.pln() / tab::ZIG_NORM_R;
                y = y_.pln();
            }
            if u < 0.0 {
                x - tab::ZIG_NORM_R
            } else {
                tab::ZIG_NORM_R - x
            }
        }
        ziggurat(rng, true, &tab::ZIG_NORM_X, &tab::ZIG_NORM_F, pdf, zero_case)
    }
}

/// The normal distribution `N(mean, std_dev²)`.
#[derive(Clone, Copy, Debug)]
pub(crate) struct Normal<F = f64> {
    mean: f64,
    std_dev: f64,
    _float: std::marker::PhantomData<F>,
}

impl Normal<f64> {
    /// `N(mean, std_dev²)`; fails only for a non-finite `std_dev`, as `rand_distr` does.
    pub(crate) fn new(mean: f64, std_dev: f64) -> Result<Normal<f64>, Error> {
        if !std_dev.is_finite() {
            return Err(Error::BadVariance);
        }
        Ok(Normal {
            mean,
            std_dev,
            _float: std::marker::PhantomData,
        })
    }
}

impl Distribution<f64> for Normal<f64> {
    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> f64 {
        self.mean + self.std_dev * rng.sample(StandardNormal)
    }
}

/// The standard exponential distribution, `rand_distr`'s `Exp1`.
struct Exp1;

impl Distribution<f64> for Exp1 {
    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> f64 {
        #[inline]
        fn pdf(x: f64) -> f64 {
            (-x).pexp()
        }
        #[inline]
        fn zero_case<R: Rng + ?Sized>(rng: &mut R, _u: f64) -> f64 {
            tab::ZIG_EXP_R - rng.sample::<f64, _>(Open01).pln()
        }
        ziggurat(rng, false, &tab::ZIG_EXP_X, &tab::ZIG_EXP_F, pdf, zero_case)
    }
}

enum Repr {
    One(f64),
    Small { inv_shape: f64, large: Large },
    Large(Large),
}

#[derive(Clone, Copy)]
struct Large {
    scale: f64,
    c: f64,
    d: f64,
}

impl Large {
    fn new_raw(shape: f64, scale: f64) -> Large {
        let d = shape - 1.0 / 3.0;
        Large {
            scale,
            c: 1.0 / (9.0 * d).sqrt(),
            d,
        }
    }

    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> f64 {
        // Marsaglia and Tsang, 2000.
        loop {
            let x: f64 = rng.sample(StandardNormal);
            let v_cbrt = 1.0 + self.c * x;
            if v_cbrt <= 0.0 {
                continue;
            }
            let v = v_cbrt * v_cbrt * v_cbrt;
            let u: f64 = rng.sample(Open01);
            let x_sqr = x * x;
            if u < 1.0 - 0.0331 * x_sqr * x_sqr
                || u.pln() < 0.5 * x_sqr + self.d * (1.0 - v + v.pln())
            {
                return self.d * v * self.scale;
            }
        }
    }
}

/// The gamma distribution `Gamma(shape, scale)`.
pub(crate) struct Gamma {
    repr: Repr,
}

impl Gamma {
    /// `Gamma(shape, scale)`; fails for a non-positive shape or scale, as `rand_distr` does.
    pub(crate) fn new(shape: f64, scale: f64) -> Result<Gamma, Error> {
        if shape.is_nan() || shape <= 0.0 {
            return Err(Error::ShapeTooSmall);
        }
        if scale.is_nan() || scale <= 0.0 {
            return Err(Error::ScaleTooSmall);
        }
        let repr = if shape == 1.0 {
            // `rand_distr` builds `Exp::new(1 / scale)`, whose sample multiplies by `1 / lambda`.
            let lambda = 1.0 / scale;
            Repr::One(1.0 / lambda)
        } else if shape < 1.0 {
            Repr::Small {
                inv_shape: 1.0 / shape,
                large: Large::new_raw(shape + 1.0, scale),
            }
        } else {
            Repr::Large(Large::new_raw(shape, scale))
        };
        Ok(Gamma { repr })
    }
}

impl Distribution<f64> for Gamma {
    fn sample<R: Rng + ?Sized>(&self, rng: &mut R) -> f64 {
        match &self.repr {
            Repr::One(lambda_inverse) => Exp1.sample(rng) * lambda_inverse,
            Repr::Small { inv_shape, large } => {
                let u: f64 = rng.sample(Open01);
                large.sample(rng) * u.ppowf(*inv_shape)
            }
            Repr::Large(large) => large.sample(rng),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;

    /// The same generator state gives the same stream as `rand_distr`, to the last place or
    /// two (the host's `exp` and `ln` differ from `libm`'s only in the rare branches).
    #[test]
    fn the_samplers_follow_rand_distr_stream_for_stream() {
        let mut a = ChaCha8Rng::seed_from_u64(11);
        let mut b = ChaCha8Rng::seed_from_u64(11);
        let (mut max_rel, mut differ) = (0.0f64, 0usize);
        for _ in 0..400_000 {
            let x: f64 = a.sample(StandardNormal);
            let y: f64 = b.sample(rand_distr::StandardNormal);
            if x != y {
                differ += 1;
            }
            max_rel = max_rel.max(((x - y) / y).abs());
        }
        assert!(max_rel < 1e-13, "{max_rel}");
        assert!(differ < 400, "{differ}");
        for shape in [0.4, 1.0, 2.5, 30.0] {
            let g = Gamma::new(shape, 1.0).unwrap();
            let h = rand_distr::Gamma::new(shape, 1.0).unwrap();
            for _ in 0..20_000 {
                let x = g.sample(&mut a);
                let y = h.sample(&mut b);
                assert!(((x - y) / y).abs() < 1e-12, "{shape}: {x} {y}");
            }
        }
        assert!(Gamma::new(0.0, 1.0).is_err() && Gamma::new(1.0, f64::NAN).is_err());
        assert!(Normal::new(0.0, f64::INFINITY).is_err());
    }
}
