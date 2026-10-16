// SPDX-License-Identifier: AGPL-3.0-only
//! **Opt-in BOC tracking**: the DLL discriminator scaling for the sine BOC(1,1) main peak and
//! the bump-jump resolution of the BOC correlation ambiguity.
//!
//! A sine BOC(1,1) signal correlates as `R(τ) = 1 − 3|τ|` for `|τ| ≤ 0.5` chip and `|τ| − 1`
//! for `0.5 ≤ |τ| ≤ 1`: a main peak three times as steep as the BPSK triangle, crossing zero at
//! `±1/3` chip, with side peaks of magnitude 0.5 at `±0.5` chip. A code loop started (or
//! pushed by noise) onto a side peak holds it: with early-minus-late power and spacing `d`, the
//! false-lock point is `±(0.5 + d/4)` chip, a ranging error of about 80 m on BeiDou B1C.
//!
//! * **Scaling.** The discriminators of [`DllDiscriminator`] are normalised for the BPSK
//!   triangle. With [`BocTracking`] set, [`boc11_dll_scale`] rescales them so that they read the
//!   code error in chips with unit slope on the BOC(1,1) main peak. The spacing must keep the
//!   early and late taps on the positive part of the peak: `d < 2/3` chip.
//! * **Bump-jump** (the classic BOC ambiguity monitor). Very-early and very-late correlators
//!   sit one subcarrier half-period (0.5 chip for BOC(1,1)) either side of the prompt; they
//!   use the channel's extra-tap correlators. On the main peak `|VE|` and `|VL|` read about
//!   half of `|P|`; on a side peak one of them sits on the main peak and reads about twice
//!   `|P|`. [`BumpJump`] keeps an up/down counter per tap and, when one reaches the threshold,
//!   tells the channel to jump the code NCO by one half-period towards that tap.
//!
//! Label: MODELLED. Evidence: `docs/design/evidence/boc-bump-jump/` (pre-registered bars
//! B1 to B5, checked by `tests/iq_boc_bump_jump.rs` against the injected truth of an
//! `iq::scene` BeiDou B1C data signal and against the closed-form false-jump bound). No
//! external receiver's output is compared. Only sine BOC(1,1) is supported; the composite
//! MBOC/QMBOC pilots are tracked on their BOC(1,1) part.

use super::discrim::DllDiscriminator;
use crate::iq::Cf64;

/// The BOC modulation a [`BocTracking`] channel expects.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[non_exhaustive]
pub enum BocKind {
    /// Sine-phased BOC(1,1): BeiDou B1C data, the BOC(1,1) part of the B1C pilot, GPS L1C's
    /// BOC(1,1) part, Galileo E1 OS's BOC(1,1) part.
    SineBoc11,
}

impl BocKind {
    /// One subcarrier half-period (chips): the side-peak spacing and the jump size.
    pub fn half_period_chips(self) -> f64 {
        match self {
            BocKind::SineBoc11 => 0.5,
        }
    }

    /// The normalised autocorrelation `R(τ)` of the ideal (infinite-bandwidth) modulation.
    pub fn autocorrelation(self, tau_chips: f64) -> f64 {
        match self {
            BocKind::SineBoc11 => {
                let t = tau_chips.abs();
                if t <= 0.5 {
                    1.0 - 3.0 * t
                } else if t <= 1.0 {
                    t - 1.0
                } else {
                    0.0
                }
            }
        }
    }

    /// The largest early-late spacing (chips, exclusive) that keeps E and L on the positive
    /// part of the main peak.
    pub fn max_spacing_chips(self) -> f64 {
        match self {
            BocKind::SineBoc11 => 2.0 / 3.0,
        }
    }
}

/// Bump-jump settings.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct BumpJumpConfig {
    /// Counter value at which the code NCO jumps (`N`). Each loop update moves a counter up
    /// by one when its tap's magnitude exceeds the prompt's and down by one (not below zero)
    /// otherwise.
    pub threshold: u32,
}

impl Default for BumpJumpConfig {
    /// `N = 8`.
    fn default() -> Self {
        Self { threshold: 8 }
    }
}

/// Opt-in BOC tracking of a channel ([`super::LoopConfig::boc`]).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct BocTracking {
    /// The modulation; sets the DLL scaling and the very-early/very-late offsets.
    pub kind: BocKind,
    /// The bump-jump monitor (`None`: scaling only).
    pub bump_jump: Option<BumpJumpConfig>,
}

impl BocTracking {
    /// Sine BOC(1,1) with the DLL scaling and the default bump-jump (`N = 8`).
    pub fn boc11() -> Self {
        Self {
            kind: BocKind::SineBoc11,
            bump_jump: Some(BumpJumpConfig::default()),
        }
    }

    /// Check the settings against the early-late spacing `d`.
    pub fn validate(&self, spacing_chips: f64) -> Result<(), String> {
        let max = self.kind.max_spacing_chips();
        if !(spacing_chips > 0.0 && spacing_chips < max) {
            return Err(format!(
                "BOC tracking needs an early-late spacing in (0, {max:.4}) chips so that E and L \
                 stay on the main peak (got {spacing_chips})"
            ));
        }
        if let Some(b) = self.bump_jump {
            if b.threshold == 0 {
                return Err("bump-jump threshold must be at least 1".into());
            }
        }
        Ok(())
    }
}

/// The factor that turns a [`DllDiscriminator`]'s BPSK-normalised output into chips of code
/// error on the sine BOC(1,1) main peak, for early-late spacing `d`.
///
/// On `R(τ) = 1 − 3|τ|` with `E = R(ε − d/2)`, `L = R(ε + d/2)`, `P = R(ε)`, to first order in
/// `ε`: `(|E|² − |L|²)/(|E|² + |L|²) = (|E| − |L|)/(|E| + |L|) = 6ε/(2 − 3d)` and
/// `Re{(E − L)P*}/(2|P|²) = 3ε`. The BPSK normalisations are `(2 − d)/4`, `(2 − d)/2` and `1`, so
/// the factors are `(2 − 3d)/(3(2 − d))` for both early-minus-late forms and `1/3` for the dot
/// product.
pub fn boc11_dll_scale(dll: DllDiscriminator, d: f64) -> f64 {
    match dll {
        DllDiscriminator::EarlyMinusLatePower | DllDiscriminator::EarlyMinusLateEnvelope => {
            (2.0 - 3.0 * d) / (3.0 * (2.0 - d))
        }
        DllDiscriminator::DotProduct => 1.0 / 3.0,
    }
}

/// One jump of the code NCO decided by [`BumpJump`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct BumpJumpEvent {
    /// The loop update after which the jump was applied.
    pub epoch: u64,
    /// The update's code epoch (s from stream start).
    pub code_epoch_s: f64,
    /// The jump (chips): `+half_period` towards the very-early tap (the replica was late),
    /// `−half_period` towards the very-late tap.
    pub jump_chips: f64,
}

/// The bump-jump up/down counters.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct BumpJump {
    cfg: BumpJumpConfig,
    ve: u32,
    vl: u32,
}

impl BumpJump {
    /// A monitor with both counters at zero.
    pub fn new(cfg: BumpJumpConfig) -> Self {
        Self { cfg, ve: 0, vl: 0 }
    }

    /// The counters `(very-early, very-late)`.
    pub fn counters(&self) -> (u32, u32) {
        (self.ve, self.vl)
    }

    /// One comparison on the very-early, prompt and very-late correlations of a loop update.
    /// Returns `+1` to jump the replica one half-period early (later code phase: the signal is
    /// ahead), `−1` to jump it late, `0` for no jump. Both counters reset after a jump.
    pub fn update(&mut self, ve: Cf64, p: Cf64, vl: Cf64) -> i8 {
        let (a_ve, a_p, a_vl) = (ve.abs(), p.abs(), vl.abs());
        let step = |c: &mut u32, up: bool| {
            if up {
                *c += 1;
            } else {
                *c = c.saturating_sub(1);
            }
        };
        step(&mut self.ve, a_ve > a_p);
        step(&mut self.vl, a_vl > a_p);
        let n = self.cfg.threshold;
        let dir = match (self.ve >= n, self.vl >= n) {
            (false, false) => 0,
            (true, false) => 1,
            (false, true) => -1,
            (true, true) => {
                if a_ve >= a_vl {
                    1
                } else {
                    -1
                }
            }
        };
        if dir != 0 {
            self.ve = 0;
            self.vl = 0;
        }
        dir
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scaled(dll: DllDiscriminator, d: f64, eps: f64) -> f64 {
        let k = BocKind::SineBoc11;
        let rot = Cf64::new(0.6, -0.8);
        let e = rot * k.autocorrelation(eps - d / 2.0);
        let p = rot * k.autocorrelation(eps);
        let l = rot * k.autocorrelation(eps + d / 2.0);
        dll.discriminate(e, p, l, d) * boc11_dll_scale(dll, d)
    }

    const ALL: [DllDiscriminator; 3] = [
        DllDiscriminator::EarlyMinusLatePower,
        DllDiscriminator::DotProduct,
        DllDiscriminator::EarlyMinusLateEnvelope,
    ];

    #[test]
    fn boc11_scaled_discriminators_have_unit_slope_at_zero_error() {
        // The first-order claim of `boc11_dll_scale`: the slope at ε → 0 is one.
        for d in [0.1, 0.2, 0.5] {
            for eps in [-1e-4_f64, 1e-4] {
                for dll in ALL {
                    let got = scaled(dll, d, eps);
                    assert!(
                        (got / eps - 1.0).abs() < 1e-2,
                        "{dll:?} d={d} eps={eps} got={got}"
                    );
                }
            }
        }
    }

    /// Pre-registered bar B4, unit-test part: all three scaled discriminators within 10 % of `ε`
    /// on the ideal peak for `d ∈ {0.1, 0.2, 0.5}`, `ε ∈ {−0.05, 0.02, 0.08}`, `|ε| + d/2 < 1/3`.
    /// It is NOT MET (finding F1): the grid includes points outside the discriminators' linear
    /// range (`|ε| ≥ d/2`, and the dot product's `1/|P|²` normalisation with `P = 1 − 3|ε|`).
    /// This test keeps the bar as registered and asserts the recorded relative errors (to
    /// 2e-3), and so exactly the recorded misses, so it fails if the result moves. Recorded in
    /// `docs/design/evidence/boc-bump-jump/RESULTS.md`.
    #[test]
    fn b4_unit_grid_misses_are_the_recorded_ones() {
        // (d, ε, relative error of [EMLP, dot product, envelope]) as recorded.
        const RECORDED: [(f64, f64, [f64; 3]); 9] = [
            (0.1, -0.05, [-0.0302, 0.1765, 0.0]),
            (0.1, 0.02, [-0.0050, 0.0638, 0.0]),
            (0.1, 0.08, [-0.3272, -0.1776, -0.30099]),
            (0.2, -0.05, [-0.0439, 0.1765, 0.0]),
            (0.2, 0.02, [-0.0073, 0.0638, 0.0]),
            (0.2, 0.08, [-0.1052, 0.3158, 0.0]),
            (0.5, -0.05, [-0.2647, 0.1765, 0.0]),
            (0.5, 0.02, [-0.0545, 0.0638, 0.0]),
            (0.5, 0.08, [-0.4796, 0.3158, 0.0]),
        ];
        let mut misses = 0;
        for (d, eps, want) in RECORDED {
            assert!(
                eps.abs() + d / 2.0 < 1.0 / 3.0,
                "grid point inside the registered range"
            );
            for (dll, w) in ALL.into_iter().zip(want) {
                let rel = scaled(dll, d, eps) / eps - 1.0;
                assert!(
                    (rel - w).abs() < 2e-3,
                    "{dll:?} d={d} eps={eps}: {rel:.4} vs {w}"
                );
                // The registered bar, unchanged: within 10 % of ε.
                if rel.abs() > 0.1 {
                    misses += 1;
                }
            }
        }
        // 11 of the 27 discriminator-grid points miss the 10 % bar, as recorded.
        assert_eq!(
            misses, 11,
            "the B4 unit-test bar is recorded NOT MET with 11 misses"
        );
    }

    #[test]
    fn autocorrelation_has_the_boc11_shape() {
        let k = BocKind::SineBoc11;
        assert_eq!(k.autocorrelation(0.0), 1.0);
        assert!((k.autocorrelation(1.0 / 3.0)).abs() < 1e-15);
        assert_eq!(k.autocorrelation(-0.5), -0.5);
        assert_eq!(k.autocorrelation(1.0), 0.0);
        assert_eq!(k.autocorrelation(1.5), 0.0);
    }

    #[test]
    fn counters_jump_towards_the_stronger_tap_and_reset() {
        let mut b = BumpJump::new(BumpJumpConfig { threshold: 3 });
        let one = Cf64::new(1.0, 0.0);
        // On a side peak with the main peak at the very-early tap.
        assert_eq!(b.update(one * 2.0, one, one * 0.1), 0);
        assert_eq!(b.update(one * 2.0, one, one * 0.1), 0);
        assert_eq!(b.counters(), (2, 0));
        assert_eq!(b.update(one * 2.0, one, one * 0.1), 1);
        assert_eq!(b.counters(), (0, 0));
        // Down-counting does not go below zero; late side.
        assert_eq!(b.update(one * 0.5, one, one * 0.5), 0);
        assert_eq!(b.counters(), (0, 0));
        for _ in 0..2 {
            assert_eq!(b.update(one * 0.1, one, one * 3.0), 0);
        }
        assert_eq!(b.update(one * 0.1, one, one * 3.0), -1);
    }

    #[test]
    fn validation_rejects_wide_spacing_and_zero_threshold() {
        let b = BocTracking::boc11();
        assert!(b.validate(0.2).is_ok());
        assert!(b.validate(0.7).is_err());
        assert!(b.validate(0.0).is_err());
        let z = BocTracking {
            bump_jump: Some(BumpJumpConfig { threshold: 0 }),
            ..b
        };
        assert!(z.validate(0.2).is_err());
    }
}
