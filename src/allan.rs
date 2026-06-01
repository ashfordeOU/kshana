use crate::types::Seconds;

/// Overlapping Allan deviation from phase samples `phase` (seconds), spaced
/// `tau0` seconds, at averaging factor `m` (so tau = m * tau0). Returns the
/// Allan deviation (dimensionless fractional frequency).
///
/// Riley, NIST SP 1065:
///   sigma_y^2(tau) = 1 / (2 (N-2m) tau^2) * sum_i (x_{i+2m} - 2 x_{i+m} + x_i)^2
pub fn overlapping_adev(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let n = phase.len();
    assert!(m >= 1, "m must be >= 1");
    assert!(n > 2 * m, "need more than 2m phase samples");
    let tau = m as f64 * tau0;
    let count = n - 2 * m;
    let mut sumsq = 0.0;
    for i in 0..count {
        let d = phase[i + 2 * m] - 2.0 * phase[i + m] + phase[i];
        sumsq += d * d;
    }
    (sumsq / (2.0 * count as f64 * tau * tau)).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn linear_phase_has_zero_adev() {
        // Constant frequency => second differences are zero => ADEV = 0.
        let phase = [0.0, 2.0, 4.0, 6.0, 8.0];
        assert_eq!(overlapping_adev(&phase, 1.0, 1), 0.0);
    }

    #[test]
    fn hand_derived_adev() {
        // phase = [0,1,3,6], tau0=1, m=1, N=4:
        // second diffs: (3-2+0)=1, (6-6+1)=1 -> sumsq=2
        // sigma^2 = 1/(2*(4-2)*1^2)*2 = 0.5 -> ADEV = sqrt(0.5) = 1/sqrt(2)
        let phase = [0.0, 1.0, 3.0, 6.0];
        let adev = overlapping_adev(&phase, 1.0, 1);
        assert!(
            (adev - std::f64::consts::FRAC_1_SQRT_2).abs() < 1e-12,
            "adev={adev}"
        );
    }
}
