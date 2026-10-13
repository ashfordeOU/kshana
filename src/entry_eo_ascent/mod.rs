// SPDX-License-Identifier: AGPL-3.0-only
//! Entry heating, electro-optical radiometry and launch-ascent losses: three
//! MODELLED trade-study tools that sit one step above the closed-form corridor,
//! coverage and launch-window kinds ([`crate::reentry`], [`crate::eo_payload`],
//! [`crate::launch`]) without changing any of their outputs.
//!
//! * [`entry_heating`] — the `entry-heating` scenario: a 3-DoF point-mass entry over
//!   a rotating spherical Earth or Mars (ballistic or lifting, constant bank), RK4,
//!   with the stagnation-point convective-heating relation of NASA TR R-376 (1971),
//!   the integrated heat load, peak deceleration and dynamic pressure, and the
//!   NACA Report 1381 (1958) ballistic closed form as an internal check.
//! * [`eo_radiometry`] — the `eo-radiometry` scenario: an imager signal-to-noise
//!   budget from a Lambertian scene, the system MTF at Nyquist (diffraction ×
//!   detector × smear × jitter), the relative edge response, `Q = λF#/p` and a
//!   NIIRS estimate from the General Image Quality Equation version 4.
//! * [`ascent`] — the `ascent-losses` scenario: a 2-D gravity-turn ascent of a
//!   multi-stage vehicle through the US Standard Atmosphere 1976, integrating the
//!   gravity, drag, steering and back-pressure losses and checking the
//!   ideal-Δv-minus-losses identity.
//!
//! See `docs/ENTRY-EO-ASCENT.md` for the equations, inputs, outputs and scope.

pub mod entry_heating;

/// Classical fourth-order Runge–Kutta step of `y' = f(y)` (autonomous) with step `h`.
pub(crate) fn rk4_step<const N: usize>(
    y: &[f64; N],
    h: f64,
    f: &dyn Fn(&[f64; N]) -> [f64; N],
) -> [f64; N] {
    let add = |a: &[f64; N], k: &[f64; N], s: f64| {
        let mut o = *a;
        for i in 0..N {
            o[i] += s * k[i];
        }
        o
    };
    let k1 = f(y);
    let k2 = f(&add(y, &k1, 0.5 * h));
    let k3 = f(&add(y, &k2, 0.5 * h));
    let k4 = f(&add(y, &k3, h));
    let mut o = *y;
    for i in 0..N {
        o[i] += h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]);
    }
    o
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rk4_integrates_exponential_decay_to_fourth_order() {
        // y' = -y from y = 1 to t = 1 with h = 0.1: error ~ 1e-6.
        let mut y = [1.0_f64];
        for _ in 0..10 {
            y = rk4_step(&y, 0.1, &|s: &[f64; 1]| [-s[0]]);
        }
        assert!((y[0] - (-1.0_f64).exp()).abs() < 5e-6);
    }
}
