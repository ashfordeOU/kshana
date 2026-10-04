// SPDX-License-Identifier: AGPL-3.0-only
//! Carrier-phase, carrier-frequency and code-delay discriminators (Kaplan & Hegarty,
//! *Understanding GPS*, 2nd ed., Tables 5.2, 5.4 and 5.5).
//!
//! Sign conventions: a positive phase error means the signal's carrier phase leads the
//! replica's (raise the NCO frequency); a positive frequency error means the signal's
//! frequency is above the replica's; a positive code error means the signal's code phase
//! is ahead of the prompt replica's (raise the code rate). The early replica is evaluated
//! `d/2` chips ahead of the prompt and the late replica `d/2` behind, `d` the early-late
//! spacing.

use super::super::Cf64;
use crate::portable_math::PortableFloat;
use std::f64::consts::TAU;

/// Carrier-phase discriminator.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PllDiscriminator {
    /// Four-quadrant `atan2(Q, I)`: the pure PLL for data-free (pilot) signals; range ±π.
    /// A data-bit transition is a π phase step to it.
    Atan2,
    /// Costas two-quadrant `atan(Q / I)`: tolerant of 180° data-bit transitions; range
    /// ±π/2.
    CostasAtan,
    /// Costas decision-directed `Q·sign(I) / |P|` (≈ `sin φ`): tolerant of data-bit
    /// transitions.
    CostasDecisionDirected,
}

impl PllDiscriminator {
    /// Phase error (rad) from the prompt correlation `p`.
    pub fn discriminate(self, p: Cf64) -> f64 {
        match self {
            PllDiscriminator::Atan2 => p.im.patan2(p.re),
            PllDiscriminator::CostasAtan => {
                let s = if p.re < 0.0 { -1.0 } else { 1.0 };
                (p.im * s).patan2(p.re.abs())
            }
            PllDiscriminator::CostasDecisionDirected => {
                let m = p.abs();
                if m == 0.0 {
                    0.0
                } else {
                    p.im * p.re.signum() / m
                }
            }
        }
    }

    /// Whether a 180° data-bit transition leaves the output unchanged.
    pub fn tolerates_data(self) -> bool {
        !matches!(self, PllDiscriminator::Atan2)
    }
}

/// Carrier-frequency discriminator on two consecutive prompts `t` seconds apart.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum FllDiscriminator {
    /// Decision-directed cross product, `cross·sign(dot) / (|P1||P2|·2πt)`
    /// (≈ `sin(Δφ)/(2πt)` Hz); tolerant of data-bit transitions.
    CrossProduct,
    /// Two-quadrant `atan2(cross·sign(dot), |dot|) / (2πt)`: tolerant of data-bit
    /// transitions, pull-in range ±1/(4t) Hz.
    Atan2,
    /// Four-quadrant `atan2(cross, dot) / (2πt)` for data-free (pilot) signals, pull-in
    /// range ±1/(2t) Hz.
    Atan2Pilot,
}

impl FllDiscriminator {
    /// Frequency error (Hz) from the earlier prompt `p1` and the later prompt `p2`.
    pub fn discriminate(self, p1: Cf64, p2: Cf64, t: f64) -> f64 {
        let dot = p1.re * p2.re + p1.im * p2.im;
        let cross = p1.re * p2.im - p2.re * p1.im;
        let sgn = if dot < 0.0 { -1.0 } else { 1.0 };
        let dphi = match self {
            FllDiscriminator::CrossProduct => {
                let m = p1.abs() * p2.abs();
                if m == 0.0 {
                    0.0
                } else {
                    cross * sgn / m
                }
            }
            FllDiscriminator::Atan2 => (cross * sgn).patan2(dot.abs()),
            FllDiscriminator::Atan2Pilot => cross.patan2(dot),
        };
        dphi / (TAU * t)
    }
}

/// Code-delay discriminator. The chip-unit scaling assumes the ideal triangular
/// autocorrelation `R(τ) = 1 − |τ|` of an unfiltered BPSK code and an early-late spacing
/// `d ≤ 1` chip; on a band-limited or BOC signal the output is still a monotonic error
/// signal near zero but its slope differs.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DllDiscriminator {
    /// Normalised non-coherent early-minus-late power,
    /// `((2 − d)/4)·(|E|² − |L|²)/(|E|² + |L|²)` chips.
    EarlyMinusLatePower,
    /// Quasi-coherent dot product, `Re{(E − L)·conj(P)} / (2|P|²)` chips.
    DotProduct,
    /// Normalised early-minus-late envelope, `((2 − d)/2)·(|E| − |L|)/(|E| + |L|)` chips.
    EarlyMinusLateEnvelope,
}

impl DllDiscriminator {
    /// Code-phase error (chips) from the early, prompt and late correlations with
    /// early-late spacing `d` chips.
    pub fn discriminate(self, e: Cf64, p: Cf64, l: Cf64, d: f64) -> f64 {
        match self {
            DllDiscriminator::EarlyMinusLatePower => {
                let pe = e.re * e.re + e.im * e.im;
                let pl = l.re * l.re + l.im * l.im;
                if pe + pl == 0.0 {
                    0.0
                } else {
                    0.25 * (2.0 - d) * (pe - pl) / (pe + pl)
                }
            }
            DllDiscriminator::DotProduct => {
                let pp = p.re * p.re + p.im * p.im;
                if pp == 0.0 {
                    0.0
                } else {
                    ((e.re - l.re) * p.re + (e.im - l.im) * p.im) / (2.0 * pp)
                }
            }
            DllDiscriminator::EarlyMinusLateEnvelope => {
                let (ae, al) = (e.abs(), l.abs());
                if ae + al == 0.0 {
                    0.0
                } else {
                    0.5 * (2.0 - d) * (ae - al) / (ae + al)
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn tri(x: f64) -> f64 {
        (1.0 - x.abs()).max(0.0)
    }

    #[test]
    fn dll_discriminators_are_unit_slope_on_the_ideal_triangle() {
        for d in [0.2, 0.5, 1.0] {
            for eps in [-0.05, 0.02, 0.08] {
                let rot = Cf64::new(0.6, 0.8);
                let e = rot * tri(eps - d / 2.0);
                let p = rot * tri(eps);
                let l = rot * tri(eps + d / 2.0);
                for k in [
                    DllDiscriminator::EarlyMinusLatePower,
                    DllDiscriminator::DotProduct,
                    DllDiscriminator::EarlyMinusLateEnvelope,
                ] {
                    let got = k.discriminate(e, p, l, d);
                    // Inside ±d/2 the envelope form is exact, the dot product reads
                    // ε/(1 − |ε|) (P drops to 1 − |ε|) and the power form
                    // ε·(1 − d/2)²/((1 − d/2)² + ε²): all within 10% of ε here.
                    let tol = 0.1 * eps.abs() + 1e-12;
                    assert!((got - eps).abs() <= tol, "{k:?} d={d} eps={eps} got={got}");
                }
            }
        }
    }

    #[test]
    fn costas_ignores_a_bit_flip_and_atan2_does_not() {
        let p = Cf64::new(0.2_f64.cos(), 0.2_f64.sin()) * 5.0;
        let flipped = p * -1.0;
        for k in [
            PllDiscriminator::CostasAtan,
            PllDiscriminator::CostasDecisionDirected,
        ] {
            assert!((k.discriminate(p) - k.discriminate(flipped)).abs() < 1e-12);
        }
        let a = PllDiscriminator::Atan2;
        assert!((a.discriminate(p) - a.discriminate(flipped)).abs() > 3.0);
    }

    #[test]
    fn fll_reads_a_known_rotation() {
        let t = 1e-3;
        let f = 37.0;
        let p1 = Cf64::new(1.0, 0.0);
        let ang = TAU * f * t;
        let p2 = Cf64::new(ang.cos(), ang.sin());
        let a = FllDiscriminator::Atan2.discriminate(p1, p2, t);
        assert!((a - f).abs() < 1e-9);
        let a = FllDiscriminator::Atan2.discriminate(p1, p2 * -1.0, t);
        assert!((a - f).abs() < 1e-9, "data-tolerant across a flip");
        let c = FllDiscriminator::CrossProduct.discriminate(p1, p2, t);
        assert!((c - ang.sin() / (TAU * t)).abs() < 1e-9);
        let pl = FllDiscriminator::Atan2Pilot.discriminate(p1, p2, t);
        assert!((pl - f).abs() < 1e-9);
    }
}
