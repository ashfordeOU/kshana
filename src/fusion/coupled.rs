// SPDX-License-Identifier: AGPL-3.0-only
//! Coupled clock + position Kalman filter (cross-block covariance).
//!
//! The legacy fusion pack runs two *independent* two-state filters — one for the
//! clock `[phase, frequency]`, one for the position `[position, velocity]` — with no
//! shared covariance. That is the optimal estimator only when the two are observed
//! *separately* (a direct position fix and a direct time fix), where the cross-block
//! covariance is exactly zero. Real GNSS does not work that way: it delivers
//! **pseudoranges**, each of which is a *single* measurement of `geometry·position +
//! c·clock_bias`. One pseudorange therefore constrains a linear combination of the
//! position and the clock together, and the optimal filter must carry the
//! **off-diagonal covariance** that couples them.
//!
//! This module is that coupled filter for the 1-DOF (along-track) platform the
//! fusion pack models: a single stacked state
//!
//! ```text
//!   x = [ position (m), velocity (m/s), clock phase (s), clock frequency (1/s) ]
//! ```
//!
//! with a **block-diagonal** process model (position and clock are dynamically
//! independent — they share no driving noise) but a **coupling measurement model**:
//! a pseudorange `ρ = g·position + c·phase + noise` whose observation row
//! `H = [g, 0, c, 0]` touches both blocks, so the posterior covariance develops the
//! non-zero `P[position, phase]` block the decoupled filters cannot represent.
//!
//! The covariance update is in Joseph stabilised form (as in [`crate::kalman`]).
//! The 3-D extension, [`CoupledPnt3d`] (a 6-state position block + clock: 8 states), uses the
//! same construction with a 3-vector line of sight; [`CoupledPntBiasFilter`] augments the 1-DOF
//! filter with a constant accelerometer bias; the `fusion` pack runs the bias variant on
//! pseudoranges when its scenario carries a `[coupled]` table.

/// Speed of light (m/s) — converts a clock phase error (s) to a range error (m).
pub const C_M_PER_S: f64 = 299_792_458.0;

/// A coupled 4-state PNT filter: stacked `[pos, vel, phase, freq]` with a full 4×4
/// covariance that carries the position↔clock cross terms a pseudorange induces.
#[derive(Clone, Debug)]
pub struct CoupledPntFilter {
    x: [f64; 4],
    p: [[f64; 4]; 4],
    /// Velocity-random-walk PSD driving the position block ((m/s)²/s).
    q_va: f64,
    /// White-FM and random-walk-FM PSDs driving the clock block.
    q_wf: f64,
    q_rw: f64,
}

impl CoupledPntFilter {
    /// New filter with the given process PSDs and an initial diagonal covariance
    /// `diag(pos_var, vel_var, phase_var, freq_var)`.
    pub fn new(
        q_va: f64,
        q_wf: f64,
        q_rw: f64,
        pos_var: f64,
        vel_var: f64,
        phase_var: f64,
        freq_var: f64,
    ) -> Self {
        let mut p = [[0.0; 4]; 4];
        p[0][0] = pos_var;
        p[1][1] = vel_var;
        p[2][2] = phase_var;
        p[3][3] = freq_var;
        Self {
            x: [0.0; 4],
            p,
            q_va,
            q_wf,
            q_rw,
        }
    }

    /// Time update over `dt`: propagate the stacked state and covariance and add the
    /// block-diagonal process noise (van-Loan exact for each two-state block).
    pub fn predict(&mut self, dt: f64) {
        if dt <= 0.0 {
            return;
        }
        // x = F x, F = blkdiag([[1,dt],[0,1]], [[1,dt],[0,1]]).
        self.x[0] += dt * self.x[1];
        self.x[2] += dt * self.x[3];

        // P = F P Fᵀ. F adds dt·(row of the rate state) to the integrated state, for
        // each block: rows/cols (0←1) and (2←3).
        let mut p = self.p;
        // Left-multiply by F: row0 += dt·row1, row2 += dt·row3.
        let (row1, row3) = (p[1], p[3]);
        for (a, b) in p[0].iter_mut().zip(row1.iter()) {
            *a += dt * b;
        }
        for (a, b) in p[2].iter_mut().zip(row3.iter()) {
            *a += dt * b;
        }
        // Right-multiply by Fᵀ: col0 += dt·col1, col2 += dt·col3.
        for row in p.iter_mut() {
            row[0] += dt * row[1];
            row[2] += dt * row[3];
        }

        // + Q (block-diagonal van Loan). Position block driven by q_va (velocity
        // random walk); clock block by q_wf (white FM) and q_rw (random-walk FM).
        let (dt2, dt3) = (dt * dt, dt * dt * dt);
        // Position block [pos, vel]:
        p[0][0] += self.q_va * dt3 / 3.0;
        p[0][1] += self.q_va * dt2 / 2.0;
        p[1][0] += self.q_va * dt2 / 2.0;
        p[1][1] += self.q_va * dt;
        // Clock block [phase, freq]:
        p[2][2] += self.q_wf * dt + self.q_rw * dt3 / 3.0;
        p[2][3] += self.q_rw * dt2 / 2.0;
        p[3][2] += self.q_rw * dt2 / 2.0;
        p[3][3] += self.q_rw * dt;
        self.p = p;
    }

    /// Pseudorange measurement update: `ρ = g·position + c·phase + noise`, with
    /// observation row `H = [g, 0, c, 0]` and measurement-noise variance `r` (m²).
    /// This is the step that couples the position and clock blocks.
    pub fn update_pseudorange(&mut self, rho: f64, g: f64, c: f64, r: f64) {
        let h = [g, 0.0, c, 0.0];
        self.update(rho, h, r);
    }

    /// General scalar Joseph update for observation row `h` and noise variance `r`.
    fn update(&mut self, z: f64, h: [f64; 4], r: f64) {
        // S = H P Hᵀ + r.
        let ph = mat_vec(&self.p, &h); // P Hᵀ
        let s = dot(&h, &ph) + r;
        if s <= 0.0 {
            return;
        }
        // K = P Hᵀ / S.
        let k = [ph[0] / s, ph[1] / s, ph[2] / s, ph[3] / s];
        // Innovation and state update.
        let innov = z - dot(&h, &self.x);
        for (xi, ki) in self.x.iter_mut().zip(k.iter()) {
            *xi += ki * innov;
        }
        // Joseph: P⁺ = (I − K H) P (I − K H)ᵀ + r K Kᵀ.
        let mut a = [[0.0; 4]; 4]; // A = I − K H
        for i in 0..4 {
            for j in 0..4 {
                a[i][j] = if i == j { 1.0 } else { 0.0 } - k[i] * h[j];
            }
        }
        let ap = mat_mul(&a, &self.p);
        let mut np = mat_mul_t(&ap, &a); // (A P) Aᵀ
        for i in 0..4 {
            for j in 0..4 {
                np[i][j] += r * k[i] * k[j];
            }
        }
        self.p = np;
    }

    /// Estimated position (m).
    pub fn pos_est(&self) -> f64 {
        self.x[0]
    }
    /// Estimated clock phase error (s).
    pub fn phase_est(&self) -> f64 {
        self.x[2]
    }
    /// The full 4×4 covariance.
    pub fn covariance(&self) -> [[f64; 4]; 4] {
        self.p
    }
    /// The position↔clock-phase cross-covariance `P[pos, phase]` — zero for the
    /// decoupled filters, non-zero once a shared pseudorange has been applied.
    pub fn pos_phase_cov(&self) -> f64 {
        self.p[0][2]
    }
    /// Position 1-σ uncertainty (m).
    pub fn pos_sigma(&self) -> f64 {
        self.p[0][0].max(0.0).sqrt()
    }
    /// Clock-phase 1-σ uncertainty (s).
    pub fn phase_sigma(&self) -> f64 {
        self.p[2][2].max(0.0).sqrt()
    }
}

// --- augmented constant-bias variant ----------------------------------------------

pub use super::dense::Innovation;
use super::dense::{self, Mat};

/// Process-noise intensities of [`CoupledPntBiasFilter`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CoupledBiasNoise {
    /// White-acceleration PSD driving velocity random walk ((m/s²)²/Hz = m²/s³).
    pub q_va: f64,
    /// Accelerometer-bias random-walk PSD ((m/s²)²/s). `0` makes the bias a pure
    /// random constant (the "constant bias" model).
    pub q_ba: f64,
    /// White-FM clock PSD (s²/s).
    pub q_wf: f64,
    /// Random-walk-FM clock PSD (1/s).
    pub q_rw: f64,
}

/// The coupled 1-DOF PNT filter **augmented with a constant accelerometer-bias state**.
///
/// State (5): `x = [position (m), velocity (m/s), clock phase (s), clock frequency (1/s),
/// accelerometer bias b_a (m/s²)]`.
///
/// Continuous model: `ṗ = v`, `v̇ = b_a + w_a` (`w_a` white, PSD `q_va`),
/// `ḃ_a = w_b` (PSD `q_ba`; `q_ba = 0` is the random-constant bias), and the clock
/// block `φ̇ = f + w_φ` (PSD `q_wf`), `ḟ = w_f` (PSD `q_rw`), as in
/// [`CoupledPntFilter`]. Discretised exactly over `dt`:
///
/// ```text
///   F_pos = [[1, dt, dt²/2], [0, 1, dt], [0, 0, 1]]           (rows/cols pos, vel, b_a)
///   Q_pos = q_va·[[dt³/3, dt²/2, 0], [dt²/2, dt, 0], [0, 0, 0]]
///         + q_ba·[[dt⁵/20, dt⁴/8, dt³/6], [dt⁴/8, dt³/3, dt²/2], [dt³/6, dt²/2, dt]]
///   F_clk = [[1, dt], [0, 1]],  Q_clk = [[q_wf·dt + q_rw·dt³/3, q_rw·dt²/2],
///                                       [q_rw·dt²/2,            q_rw·dt   ]]
/// ```
///
/// Measurements are the same pseudoranges `ρ = g·position + c·phase + noise`
/// (`H = [g, 0, c, 0, 0]`); the bias is observed only through the position history
/// it bends. A constant **pseudorange** bias common to every range is deliberately not
/// a state: its observation column would be identical to the clock-phase column
/// `c`, so it is unobservable from the clock and is absorbed by it.
///
/// This is a separate type: [`CoupledPntFilter`] is unchanged.
#[derive(Clone, Debug)]
pub struct CoupledPntBiasFilter {
    x: [f64; 5],
    p: Mat<5>,
    noise: CoupledBiasNoise,
}

impl CoupledPntBiasFilter {
    /// Index of the accelerometer-bias state.
    pub const BIAS: usize = 4;

    /// New filter at the zero state with initial covariance
    /// `diag(pos_var, vel_var, phase_var, freq_var, bias_var)` (`p0_diag`).
    pub fn new(noise: CoupledBiasNoise, p0_diag: [f64; 5]) -> Self {
        let mut p = [[0.0; 5]; 5];
        for (i, v) in p0_diag.iter().enumerate() {
            p[i][i] = *v;
        }
        Self {
            x: [0.0; 5],
            p,
            noise,
        }
    }

    /// The state-transition matrix over `dt`, state order as [`Self::state`].
    pub fn transition(dt: f64) -> [[f64; 5]; 5] {
        let mut f = [[0.0; 5]; 5];
        for (i, row) in f.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        f[0][1] = dt;
        f[0][4] = dt * dt / 2.0;
        f[1][4] = dt;
        f[2][3] = dt;
        f
    }

    /// The discrete process-noise covariance over `dt` (the `Q` stated on the type).
    #[allow(clippy::needless_range_loop)]
    pub fn process_noise(&self, dt: f64) -> [[f64; 5]; 5] {
        let CoupledBiasNoise {
            q_va,
            q_ba,
            q_wf,
            q_rw,
        } = self.noise;
        let (dt2, dt3) = (dt * dt, dt * dt * dt);
        let (dt4, dt5) = (dt3 * dt, dt3 * dt2);
        let mut q = [[0.0; 5]; 5];
        q[0][0] = q_va * dt3 / 3.0 + q_ba * dt5 / 20.0;
        q[0][1] = q_va * dt2 / 2.0 + q_ba * dt4 / 8.0;
        q[1][1] = q_va * dt + q_ba * dt3 / 3.0;
        q[0][4] = q_ba * dt3 / 6.0;
        q[1][4] = q_ba * dt2 / 2.0;
        q[4][4] = q_ba * dt;
        q[2][2] = q_wf * dt + q_rw * dt3 / 3.0;
        q[2][3] = q_rw * dt2 / 2.0;
        q[3][3] = q_rw * dt;
        for i in 0..5 {
            for j in 0..i {
                q[i][j] = q[j][i];
            }
        }
        q
    }

    /// Time update over `dt` (no-op for `dt <= 0`).
    pub fn predict(&mut self, dt: f64) {
        if dt <= 0.0 {
            return;
        }
        let f = Self::transition(dt);
        let q = self.process_noise(dt);
        dense::propagate(&mut self.x, &mut self.p, &f, &q);
    }

    /// Pseudorange update `ρ = g·position + c·phase + noise` (`r` in m²). `g = 0` is a
    /// clock-only (time-transfer) fix. Returns the innovation for NIS monitoring.
    pub fn update_pseudorange(&mut self, rho: f64, g: f64, c: f64, r: f64) -> Option<Innovation> {
        dense::joseph_update(&mut self.x, &mut self.p, &[g, 0.0, c, 0.0, 0.0], rho, r)
    }

    /// The full state `[pos, vel, phase, freq, b_a]`.
    pub fn state(&self) -> [f64; 5] {
        self.x
    }
    /// The full 5×5 covariance.
    pub fn covariance(&self) -> [[f64; 5]; 5] {
        self.p
    }
    /// Estimated position (m).
    pub fn pos_est(&self) -> f64 {
        self.x[0]
    }
    /// Estimated clock phase error (s).
    pub fn phase_est(&self) -> f64 {
        self.x[2]
    }
    /// Estimated accelerometer bias (m/s²).
    pub fn accel_bias_est(&self) -> f64 {
        self.x[Self::BIAS]
    }
    /// Accelerometer-bias 1-σ (m/s²).
    pub fn accel_bias_sigma(&self) -> f64 {
        self.p[Self::BIAS][Self::BIAS].max(0.0).sqrt()
    }
    /// Position↔clock-phase cross-covariance `P[pos, phase]` (m·s).
    pub fn pos_phase_cov(&self) -> f64 {
        self.p[0][2]
    }
    /// Position 1-σ (m).
    pub fn pos_sigma(&self) -> f64 {
        self.p[0][0].max(0.0).sqrt()
    }
    /// Clock-phase 1-σ (s).
    pub fn phase_sigma(&self) -> f64 {
        self.p[2][2].max(0.0).sqrt()
    }
    /// NEES `eᵀP⁻¹e` of the estimate against a truth state (χ²(5) when consistent).
    pub fn nees(&self, truth: &[f64; 5]) -> Option<f64> {
        let mut e = [0.0; 5];
        for (ei, (t, x)) in e.iter_mut().zip(truth.iter().zip(self.x.iter())) {
            *ei = t - x;
        }
        dense::nees(&e, &self.p)
    }
}

// --- 3-D 8-state variant -------------------------------------------------------------

/// The coupled PNT filter in three dimensions: the 8-state
/// `x = [p_x, p_y, p_z (m), v_x, v_y, v_z (m/s), clock phase (s), clock frequency (1/s)]`.
///
/// Each axis is a constant-velocity block driven by white acceleration of PSD `q_va`, and the
/// clock is the two-state model of [`CoupledPntFilter`]; the blocks share no process noise.
/// A pseudorange `ρ = uᵀp + c·phase + noise` along the unit line of sight `u` (from the
/// satellite to the user) has the row `H = [uᵀ, 0, 0, 0, c, 0]`, which couples the position and
/// clock blocks exactly as the 1-DOF filter's `[g, 0, c, 0]` does; with four or more
/// independent directions both blocks are observable from pseudoranges alone, and a clock-only
/// fix (`u = 0`) sharpens the position through the cross-covariance.
#[derive(Clone, Debug)]
pub struct CoupledPnt3d {
    x: [f64; 8],
    p: Mat<8>,
    q_va: f64,
    q_wf: f64,
    q_rw: f64,
}

impl CoupledPnt3d {
    /// New filter at the zero state, process PSDs `q_va` (per axis), `q_wf`, `q_rw`, and
    /// initial covariance `diag(pos_var ×3, vel_var ×3, phase_var, freq_var)`.
    pub fn new(
        q_va: f64,
        q_wf: f64,
        q_rw: f64,
        pos_var: f64,
        vel_var: f64,
        phase_var: f64,
        freq_var: f64,
    ) -> Self {
        let mut p = [[0.0; 8]; 8];
        for i in 0..3 {
            p[i][i] = pos_var;
            p[3 + i][3 + i] = vel_var;
        }
        p[6][6] = phase_var;
        p[7][7] = freq_var;
        Self {
            x: [0.0; 8],
            p,
            q_va,
            q_wf,
            q_rw,
        }
    }

    /// The state-transition matrix over `dt`.
    pub fn transition(dt: f64) -> [[f64; 8]; 8] {
        let mut f = [[0.0; 8]; 8];
        for (i, row) in f.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        for i in 0..3 {
            f[i][3 + i] = dt;
        }
        f[6][7] = dt;
        f
    }

    /// The discrete process noise over `dt` (exact for the constant-velocity and clock models).
    pub fn process_noise(&self, dt: f64) -> [[f64; 8]; 8] {
        let (dt2, dt3) = (dt * dt, dt * dt * dt);
        let mut q = [[0.0; 8]; 8];
        for i in 0..3 {
            q[i][i] = self.q_va * dt3 / 3.0;
            q[i][3 + i] = self.q_va * dt2 / 2.0;
            q[3 + i][i] = self.q_va * dt2 / 2.0;
            q[3 + i][3 + i] = self.q_va * dt;
        }
        q[6][6] = self.q_wf * dt + self.q_rw * dt3 / 3.0;
        q[6][7] = self.q_rw * dt2 / 2.0;
        q[7][6] = q[6][7];
        q[7][7] = self.q_rw * dt;
        q
    }

    /// Time update over `dt` (no-op for `dt <= 0`).
    pub fn predict(&mut self, dt: f64) {
        if dt <= 0.0 {
            return;
        }
        let f = Self::transition(dt);
        let q = self.process_noise(dt);
        dense::propagate(&mut self.x, &mut self.p, &f, &q);
    }

    /// Pseudorange update `ρ = uᵀp + c·phase + noise` (`r` in m²); `u = 0` is a clock-only
    /// fix. Returns the innovation for NIS monitoring.
    pub fn update_pseudorange(
        &mut self,
        rho: f64,
        u: [f64; 3],
        c: f64,
        r: f64,
    ) -> Option<Innovation> {
        let h = [u[0], u[1], u[2], 0.0, 0.0, 0.0, c, 0.0];
        dense::joseph_update(&mut self.x, &mut self.p, &h, rho, r)
    }

    /// The full state.
    pub fn state(&self) -> [f64; 8] {
        self.x
    }
    /// The full 8×8 covariance.
    pub fn covariance(&self) -> [[f64; 8]; 8] {
        self.p
    }
    /// 3-D position 1-σ, `sqrt(tr P_pp)` (m).
    pub fn pos_sigma_3d(&self) -> f64 {
        (self.p[0][0] + self.p[1][1] + self.p[2][2]).max(0.0).sqrt()
    }
    /// Clock-phase 1-σ (s).
    pub fn phase_sigma(&self) -> f64 {
        self.p[6][6].max(0.0).sqrt()
    }
    /// NEES `eᵀP⁻¹e` against a truth state (χ²(8) when consistent).
    pub fn nees(&self, truth: &[f64; 8]) -> Option<f64> {
        let mut e = [0.0; 8];
        for (ei, (t, x)) in e.iter_mut().zip(truth.iter().zip(self.x.iter())) {
            *ei = t - x;
        }
        dense::nees(&e, &self.p)
    }
}

// --- small fixed-size linear algebra (4×4) --------------------------------------

fn dot(a: &[f64; 4], b: &[f64; 4]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3]
}

fn mat_vec(m: &[[f64; 4]; 4], v: &[f64; 4]) -> [f64; 4] {
    let mut o = [0.0; 4];
    for (i, oi) in o.iter_mut().enumerate() {
        *oi = dot(&m[i], v);
    }
    o
}

fn mat_mul(a: &[[f64; 4]; 4], b: &[[f64; 4]; 4]) -> [[f64; 4]; 4] {
    let mut o = [[0.0; 4]; 4];
    for (i, oi) in o.iter_mut().enumerate() {
        for (j, oij) in oi.iter_mut().enumerate() {
            let mut s = 0.0;
            for (k, aik) in a[i].iter().enumerate() {
                s += aik * b[k][j];
            }
            *oij = s;
        }
    }
    o
}

/// `A · Bᵀ`.
fn mat_mul_t(a: &[[f64; 4]; 4], b: &[[f64; 4]; 4]) -> [[f64; 4]; 4] {
    let mut o = [[0.0; 4]; 4];
    for (i, oi) in o.iter_mut().enumerate() {
        for (j, oij) in oi.iter_mut().enumerate() {
            oij_set(oij, &a[i], &b[j]);
        }
    }
    o
}

fn oij_set(oij: &mut f64, ai: &[f64; 4], bj: &[f64; 4]) {
    *oij = dot(ai, bj);
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::detection::chi2_inv_cdf;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    // A representative 1-DOF tuning: a slowly-walking platform and a CSAC-class clock.
    const Q_VA: f64 = 1e-4; // (m/s)²/s velocity random walk
    const Q_WF: f64 = 9e-20; // white FM (σ_y(1s)≈3e-10)
    const Q_RW: f64 = 1e-28; // random-walk FM
    const C: f64 = C_M_PER_S;

    fn fresh() -> CoupledPntFilter {
        CoupledPntFilter::new(Q_VA, Q_WF, Q_RW, 1e4, 1.0, 1e-12, 1e-18)
    }

    #[test]
    fn shared_pseudorange_creates_cross_covariance() {
        // The decoupled filters keep P[pos, phase] = 0 forever. A single shared
        // pseudorange (H touches both blocks) must make it non-zero.
        let mut kf = fresh();
        assert_eq!(kf.pos_phase_cov(), 0.0, "starts decoupled");
        kf.predict(1.0);
        kf.update_pseudorange(0.0, 1.0, C, 4.0); // 2 m, 1-σ range noise
        assert!(
            kf.pos_phase_cov().abs() > 0.0,
            "pseudorange did not couple the blocks: {}",
            kf.pos_phase_cov()
        );
        // The coupling is negative: a positive range residual is shared as +pos and
        // +c·phase, so the estimators move together and their errors anti-correlate
        // after conditioning (the classic GDOP pos/clock trade-off).
        assert!(kf.pos_phase_cov() < 0.0, "cov sign: {}", kf.pos_phase_cov());
    }

    #[test]
    fn two_geometries_jointly_resolve_position_and_clock() {
        // A single pseudorange cannot separate position from clock (one equation, two
        // unknowns). Two satellites with distinct geometry can: with g = +1 and −1,
        // ρ₁ = pos + c·phase and ρ₂ = −pos + c·phase, so pos = (ρ₁−ρ₂)/2 and
        // c·phase = (ρ₁+ρ₂)/2. Inject a known position and clock offset and check the
        // filter recovers both from the two ranges.
        let mut kf = fresh();
        let (true_pos, true_phase) = (120.0, 3e-7); // 120 m, 90 m of clock range
        let r = 1e-4; // tiny range noise so the resolution is exact-ish
        for _ in 0..40 {
            kf.predict(1.0);
            kf.update_pseudorange(true_pos + C * true_phase, 1.0, C, r);
            kf.update_pseudorange(-true_pos + C * true_phase, -1.0, C, r);
        }
        assert!(
            (kf.pos_est() - true_pos).abs() < 0.5,
            "pos {} vs {true_pos}",
            kf.pos_est()
        );
        assert!(
            (kf.phase_est() - true_phase).abs() < 0.5 / C,
            "phase {} vs {true_phase}",
            kf.phase_est()
        );
    }

    #[test]
    fn ignoring_the_clock_biases_position() {
        // The honest "coupling is necessary" demonstration. With a single overhead
        // geometry (g=1), a position-only estimate of the pseudorange attributes the
        // whole clock range c·phase to position. The coupled filter, given a second
        // geometry, does not. Quantify the avoided bias.
        let true_phase = 1e-6; // 300 m of clock range
        let clock_range = C * true_phase;
        // Position-only (clock-ignoring) read of an overhead pseudorange at true_pos=0:
        let naive_pos = 0.0 + clock_range; // attributes all clock range to position
        assert!(naive_pos > 250.0, "naive bias should be large: {naive_pos}");
        // Coupled filter with two geometries recovers ~0 position.
        let mut kf = fresh();
        let r = 1e-2;
        for _ in 0..60 {
            kf.predict(1.0);
            kf.update_pseudorange(0.0 + clock_range, 1.0, C, r);
            kf.update_pseudorange(0.0 + clock_range, -1.0, C, r);
        }
        assert!(
            kf.pos_est().abs() < 1.0,
            "coupled pos should be ~0, got {}",
            kf.pos_est()
        );
    }

    #[test]
    fn clock_aiding_improves_position_through_coupling() {
        // The payoff of cross-block covariance: once position and clock are
        // correlated (P[pos,phase] ≠ 0), a *clock-only* measurement (an optical-ISL
        // time fix, geometry g = 0) also sharpens the *position* estimate — something
        // two decoupled filters can never do. Build the correlation with two
        // pseudoranges, then apply a clock-only update and check the position σ drops.
        // Poorly-separated (same-side) geometry leaves a strong residual position↔
        // clock correlation — symmetric g = ±1 would orthogonalise them and the cross
        // term would cancel, defeating the demonstration.
        let mut kf = fresh();
        for _ in 0..10 {
            kf.predict(1.0);
            kf.update_pseudorange(0.0, 1.0, C, 4.0);
            kf.update_pseudorange(0.0, 0.9, C, 4.0);
        }
        assert!(
            kf.pos_phase_cov().abs() > 0.0,
            "no coupling built: {}",
            kf.pos_phase_cov()
        );
        let pos_sigma_before = kf.pos_sigma();
        // A precise clock-only measurement (H = [0, 0, c, 0]).
        kf.update_pseudorange(0.0, 0.0, C, 1e-6);
        assert!(
            kf.pos_sigma() < pos_sigma_before,
            "clock-only fix did not improve position via coupling: {} -> {}",
            pos_sigma_before,
            kf.pos_sigma()
        );
    }

    #[test]
    fn coupled_filter_is_nees_consistent() {
        // Monte-Carlo NEES (χ²(4)) over an ensemble: simulate the stacked truth with
        // its process noise, feed two-geometry pseudoranges, and check the pooled
        // NEES mean lands in the run-based 95% χ² band (Bar-Shalom §5.4, as in
        // src/filter_health.rs). E[NEES] = n_x = 4 for the matched filter.
        let (seeds, steps, dt, r) = (80usize, 150usize, 1.0_f64, 4.0_f64);
        // Truth process-noise Cholesky factors (block-diagonal van Loan).
        let (dt2, dt3) = (dt * dt, dt * dt * dt);
        let qp = [
            [Q_VA * dt3 / 3.0, Q_VA * dt2 / 2.0],
            [Q_VA * dt2 / 2.0, Q_VA * dt],
        ];
        let qc = [
            [Q_WF * dt + Q_RW * dt3 / 3.0, Q_RW * dt2 / 2.0],
            [Q_RW * dt2 / 2.0, Q_RW * dt],
        ];
        let chol = |m: [[f64; 2]; 2]| {
            let l00 = m[0][0].sqrt();
            let l10 = m[1][0] / l00;
            let l11 = (m[1][1] - l10 * l10).max(0.0).sqrt();
            [[l00, 0.0], [l10, l11]]
        };
        let (lp, lc) = (chol(qp), chol(qc));
        let (pv, vv, phv, fv): (f64, f64, f64, f64) = (1e4, 1.0, 1e-12, 1e-18);
        let n01 = Normal::new(0.0, 1.0).unwrap();
        let mn = Normal::new(0.0, r.sqrt()).unwrap();

        let mut nees_sum = 0.0;
        let mut nees_n = 0u64;
        for s in 0..seeds {
            let mut rng = ChaCha8Rng::seed_from_u64(0xC0FFEE ^ (s as u64).wrapping_mul(0x9E3779B9));
            // Truth drawn from the same prior the filter starts at.
            let mut xt = [
                pv.sqrt() * n01.sample(&mut rng),
                vv.sqrt() * n01.sample(&mut rng),
                phv.sqrt() * n01.sample(&mut rng),
                fv.sqrt() * n01.sample(&mut rng),
            ];
            let mut kf = CoupledPntFilter::new(Q_VA, Q_WF, Q_RW, pv, vv, phv, fv);
            for _ in 0..steps {
                // Propagate truth with process noise.
                let (wp0, wp1) = (n01.sample(&mut rng), n01.sample(&mut rng));
                let (wc0, wc1) = (n01.sample(&mut rng), n01.sample(&mut rng));
                xt[0] += dt * xt[1] + lp[0][0] * wp0;
                xt[1] += lp[1][0] * wp0 + lp[1][1] * wp1;
                xt[2] += dt * xt[3] + lc[0][0] * wc0;
                xt[3] += lc[1][0] * wc0 + lc[1][1] * wc1;
                kf.predict(dt);
                for &g in &[1.0_f64, -1.0] {
                    let rho = g * xt[0] + C * xt[2] + mn.sample(&mut rng);
                    kf.update_pseudorange(rho, g, C, r);
                }
                // NEES = eᵀ P⁻¹ e over the 4-state error.
                let e = [
                    xt[0] - kf.x[0],
                    xt[1] - kf.x[1],
                    xt[2] - kf.x[2],
                    xt[3] - kf.x[3],
                ];
                if let Some(v) = nees_4(e, kf.p) {
                    nees_sum += v;
                    nees_n += 1;
                }
            }
        }
        let mean = nees_sum / nees_n as f64;
        // Run-based band (errors are temporally correlated → dof = n_x·seeds).
        let dof = 4.0 * seeds as f64;
        let lo = chi2_inv_cdf(0.025, dof) / seeds as f64;
        let hi = chi2_inv_cdf(0.975, dof) / seeds as f64;
        assert!(
            mean > lo && mean < hi,
            "NEES mean {mean} outside [{lo}, {hi}] (target 4.0)"
        );
    }

    fn nees_4(e: [f64; 4], p: [[f64; 4]; 4]) -> Option<f64> {
        let pi = invert_4x4(p)?;
        let pe = mat_vec(&pi, &e);
        Some(dot(&e, &pe))
    }

    // Gauss–Jordan 4×4 inverse with partial pivoting; None if singular.
    fn invert_4x4(m: [[f64; 4]; 4]) -> Option<[[f64; 4]; 4]> {
        let mut a = m;
        let mut inv = [[0.0; 4]; 4];
        for (i, row) in inv.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        for col in 0..4 {
            // Pivot.
            let mut piv = col;
            for r in (col + 1)..4 {
                if a[r][col].abs() > a[piv][col].abs() {
                    piv = r;
                }
            }
            if a[piv][col].abs() < 1e-300 {
                return None;
            }
            a.swap(col, piv);
            inv.swap(col, piv);
            let d = a[col][col];
            for c in 0..4 {
                a[col][c] /= d;
                inv[col][c] /= d;
            }
            for r in 0..4 {
                if r == col {
                    continue;
                }
                let f = a[r][col];
                for c in 0..4 {
                    a[r][c] -= f * a[col][c];
                    inv[r][c] -= f * inv[col][c];
                }
            }
        }
        Some(inv)
    }

    // A faithful inline 4-state Kalman filter — the same stacked `[pos, vel, phase, freq]` state and
    // the same scalar Joseph pseudorange update as `CoupledPntFilter`, but with a `couple` switch:
    // when `false`, the position↔clock cross-covariance blocks are zeroed after every update, exactly
    // modelling the *decoupled* "two independent filters" baseline. This lets the ensemble compare
    // the coupled and decoupled estimators on identical data, the only difference being whether the
    // cross-covariance is kept. It is validated bit-for-bit against the shipped filter below.
    #[derive(Clone)]
    struct Kf4 {
        x: [f64; 4],
        p: [[f64; 4]; 4],
    }

    impl Kf4 {
        fn new(pos_var: f64, vel_var: f64, phase_var: f64, freq_var: f64) -> Self {
            let mut p = [[0.0; 4]; 4];
            p[0][0] = pos_var;
            p[1][1] = vel_var;
            p[2][2] = phase_var;
            p[3][3] = freq_var;
            Self { x: [0.0; 4], p }
        }

        fn update(&mut self, z: f64, h: [f64; 4], r: f64, couple: bool) {
            // S = H P Hᵀ + r, K = P Hᵀ / S.
            let ph: [f64; 4] = std::array::from_fn(|i| (0..4).map(|j| self.p[i][j] * h[j]).sum());
            let s = (0..4).map(|i| h[i] * ph[i]).sum::<f64>() + r;
            if s <= 0.0 {
                return;
            }
            let k: [f64; 4] = std::array::from_fn(|i| ph[i] / s);
            let innov = z - (0..4).map(|i| h[i] * self.x[i]).sum::<f64>();
            for (xi, &ki) in self.x.iter_mut().zip(k.iter()) {
                *xi += ki * innov;
            }
            // Joseph: P⁺ = (I − K H) P (I − K H)ᵀ + r K Kᵀ.
            let a: [[f64; 4]; 4] = std::array::from_fn(|i| {
                std::array::from_fn(|j| if i == j { 1.0 } else { 0.0 } - k[i] * h[j])
            });
            let ap: [[f64; 4]; 4] = std::array::from_fn(|i| {
                std::array::from_fn(|j| (0..4).map(|l| a[i][l] * self.p[l][j]).sum())
            });
            let mut np: [[f64; 4]; 4] = std::array::from_fn(|i| {
                std::array::from_fn(|j| (0..4).map(|l| ap[i][l] * a[j][l]).sum())
            });
            for (i, npi) in np.iter_mut().enumerate() {
                for (j, npij) in npi.iter_mut().enumerate() {
                    *npij += r * k[i] * k[j];
                }
            }
            // The decoupled baseline discards the position↔clock cross-information.
            if !couple {
                for &i in &[0usize, 1] {
                    for &j in &[2usize, 3] {
                        np[i][j] = 0.0;
                        np[j][i] = 0.0;
                    }
                }
            }
            self.p = np;
        }

        fn pos(&self) -> f64 {
            self.x[0]
        }
    }

    #[test]
    fn inline_kf_matches_the_shipped_coupled_filter() {
        // The inline Kf4 (couple = true) must reproduce CoupledPntFilter bit-for-bit on a
        // measurement-only sequence, so the ensemble's decoupled arm is a fair like-for-like.
        let mut shipped = CoupledPntFilter::new(Q_VA, Q_WF, Q_RW, 1e4, 1.0, 1e-12, 1e-18);
        let mut inline = Kf4::new(1e4, 1.0, 1e-12, 1e-18);
        for (rho, g) in [(12.0, 1.0), (-4.0, 0.7), (3.0, 0.0)] {
            shipped.update_pseudorange(rho, g, C, 25.0);
            inline.update(rho, [g, 0.0, C, 0.0], 25.0, true);
        }
        assert!((shipped.pos_est() - inline.pos()).abs() < 1e-9);
        assert!((shipped.pos_phase_cov() - inline.p[0][2]).abs() < 1e-6);
    }

    #[test]
    fn coupling_beats_decoupling_over_an_ensemble() {
        // The textbook payoff: degenerate pseudoranges (g ≈ 1) build a position↔clock correlation,
        // then a clock-only fix (g = 0) sharpens position *through that correlation* — which the
        // decoupled filter, having thrown the correlation away, cannot do. Over 100 random trials
        // the coupled position RMS must beat the decoupled one.
        let mut rng = ChaCha8Rng::seed_from_u64(0xC0_DE_C0_DE);
        let pos_d = Normal::new(0.0, 50.0).unwrap(); // truth position, m
        let phase_d = Normal::new(0.0, 1.0e-7).unwrap(); // truth clock phase, s (~30 m of range)
        let n_pr = Normal::new(0.0, 5.0).unwrap(); // pseudorange noise, m
        let n_clk = Normal::new(0.0, 2.0).unwrap(); // clock-fix noise, m

        let n = 100;
        let mut sc = 0.0;
        let mut sd = 0.0;
        let mut coupled_wins = 0;
        for _ in 0..n {
            let pos = pos_d.sample(&mut rng);
            let phase = phase_d.sample(&mut rng);
            let mut coupled = Kf4::new(1e4, 1.0, 1e-12, 1e-18);
            let mut decoupled = coupled.clone();
            // Four near-degenerate pseudoranges: ρ = pos + C·phase + noise (g ≈ 1).
            for _ in 0..4 {
                let rho = pos + C * phase + n_pr.sample(&mut rng);
                coupled.update(rho, [1.0, 0.0, C, 0.0], 25.0, true);
                decoupled.update(rho, [1.0, 0.0, C, 0.0], 25.0, false);
            }
            // A clock-only fix (g = 0): ρ = C·phase + noise.
            let rho_clk = C * phase + n_clk.sample(&mut rng);
            coupled.update(rho_clk, [0.0, 0.0, C, 0.0], 4.0, true);
            decoupled.update(rho_clk, [0.0, 0.0, C, 0.0], 4.0, false);
            let ec = (coupled.pos() - pos).abs();
            let ed = (decoupled.pos() - pos).abs();
            sc += ec * ec;
            sd += ed * ed;
            if ec < ed {
                coupled_wins += 1;
            }
        }
        let rms_c = (sc / n as f64).sqrt();
        let rms_d = (sd / n as f64).sqrt();
        // The coupled filter's position RMS is decisively smaller, and it wins almost every trial —
        // the quantified value of carrying the cross-covariance the decoupled pack cannot.
        assert!(
            rms_c < 0.6 * rms_d,
            "coupled RMS {rms_c} m vs decoupled {rms_d} m"
        );
        assert!(coupled_wins >= 90, "coupled won {coupled_wins}/100 trials");
    }
}
