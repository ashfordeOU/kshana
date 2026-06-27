// SPDX-License-Identifier: AGPL-3.0-only
//! External-oracle validation of kshana's nav-signal modulation & code-tracking
//! analysis ([`kshana::navsignal`]).
//!
//! Two independent oracles, generated offline (see the committed generator
//! `tests/fixtures/nav_signal_modulation_code_tracking/`):
//!
//! PART (a) — GPS C/A Gold-code correlation (STRONG external dataset).
//!   The oracle is the **IS-GPS-200 C/A-code definition**: the G1/G2 10-stage
//!   LFSRs with the published G2 phase-selector tap table (Table 3-Ia). The
//!   generator builds the *real* 1023-chip C/A sequences for PRN 1..8 (pinned to
//!   the spec by its published first-10-chip octal column) and computes the EXACT
//!   INTEGER periodic auto/cross-correlation of those real codes. Gold's theorem
//!   (Gold 1967; Sarwate & Pursley 1980) gives the three-valued set {-1,-65,63}
//!   for n=10 with max off-peak magnitude t(10)=65. kshana's `CodeFamily::Gold
//!   {n:10}` reports `max_crosscorr() = max_autocorr_sidelobe() = 65/1023` from
//!   the t(n)/L closed form; this test confronts that bound with the MEASURED
//!   integer maxima of the actually-generated codes over 8 PRNs and 28 pairs.
//!   Because the IS-GPS-200 code generation is wholly independent of kshana (which
//!   never generates a sequence, only returns the bound), this is a genuine
//!   external check — EXACT integer agreement, not a tolerance.
//!
//! PART (b) — baseband PSD shape (PARTIAL numerical cross-check).
//!   The oracle is `scipy.signal.periodogram`: the generator synthesises long
//!   random-chip BPSK-R(1) and sine-BOC(1,1) waveforms, estimates their unit-area
//!   PSD by averaging the periodogram over 2000 code epochs, and bin-averages it
//!   into 0.5*Rc bins over +-12*Rc. This test recomputes kshana's `Modulation::psd`
//!   closed form analytically on the SAME bins and asserts the shapes agree in RMS
//!   over the band, plus checks kshana's BPSK self-SSC (= integral G^2 df, computed
//!   by kshana) against the empirical periodogram's integral G^2 df. This validates
//!   the PSD *shape* to a few percent; a finite-waveform periodogram is itself a
//!   noisy estimate, so it is PARTIAL, not parity.
//!
//! Honest scope: PART (a) externally validates the Gold-code correlation bound
//! against real IS-GPS-200 codes (exact). PART (b) is a partial numerical check of
//! the PSD closed form. The DLL-jitter and multipath-envelope models are NOT
//! validated here (they have their own internal directional tests), so the
//! navsignal capability stays MODELLED.

use kshana::navsignal::{spectral_separation_coeff, CodeFamily, Modulation};

const REF: &str = include_str!(
    "fixtures/nav_signal_modulation_code_tracking/nav_signal_modulation_code_tracking_reference.txt"
);

const L: f64 = 1023.0;
const RC: f64 = 1_023_000.0; // GPS C/A chip rate

// ─────────────────────────── PART (a): Gold codes ───────────────────────────

/// kshana's Gold cross-correlation bound, expressed as an integer over L, must
/// equal the MEASURED integer max |cross-correlation| of the real IS-GPS-200
/// codes for every PRN pair in the fixture (>= 28 pairs). Exact match.
#[test]
fn gold_crosscorr_bound_matches_measured_isgps200_codes() {
    // kshana's bound for the n=10 Gold family, as an integer numerator over L.
    let bound = CodeFamily::Gold { n: 10 }
        .max_crosscorr()
        .expect("n=10 Gold has a cross-correlation bound");
    let bound_int = (bound * L).round() as i64;
    assert_eq!(
        bound_int, 65,
        "kshana Gold(10) cross bound should be 65/1023"
    );

    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("CROSS ") {
            continue;
        }
        // CROSS prnA prnB | maxcross | distinct_values(comma)
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "CROSS row needs 3 |-fields: {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        let (pa, pb) = (head[1], head[2]);
        let measured: i64 = parts[1].trim().parse().unwrap();
        assert_eq!(
            measured, bound_int,
            "PRN{pa}x{pb}: measured max|cross| {measured} != kshana bound {bound_int}"
        );
        // Every distinct cross value must lie in the n=10 Gold three-valued set.
        for v in parts[2].split(',') {
            let val: i64 = v.trim().parse().unwrap();
            assert!(
                val == -65 || val == -1 || val == 63,
                "PRN{pa}x{pb}: cross value {val} outside Gold set {{-65,-1,63}}"
            );
        }
        n += 1;
    }
    assert!(n >= 8, "expected >= 8 PRN cross-corr pairs, got {n}");
    eprintln!("navsignal Gold cross-corr: {n} IS-GPS-200 PRN pairs, all measured max = {bound_int} = kshana bound");
}

/// kshana's Gold autocorrelation-sidelobe bound, as an integer over L, must equal
/// the MEASURED integer max |off-peak autocorrelation| of the real IS-GPS-200
/// codes for every PRN 1..8. Exact match.
#[test]
fn gold_autocorr_sidelobe_bound_matches_measured_isgps200_codes() {
    let bound = CodeFamily::Gold { n: 10 }
        .max_autocorr_sidelobe()
        .expect("n=10 Gold has an autocorr-sidelobe bound");
    let bound_int = (bound * L).round() as i64;
    assert_eq!(bound_int, 65, "kshana Gold(10) sidelobe should be 65/1023");

    let mut n = 0usize;
    for line in REF.lines() {
        if !line.starts_with("AUTO ") {
            continue;
        }
        // AUTO prn | maxsidelobe | distinct_offpeak_values(comma)
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "AUTO row needs 3 |-fields: {line}");
        let prn = parts[0].split_whitespace().nth(1).unwrap();
        let measured: i64 = parts[1].trim().parse().unwrap();
        assert_eq!(
            measured, bound_int,
            "PRN{prn}: measured max sidelobe {measured} != kshana bound {bound_int}"
        );
        for v in parts[2].split(',') {
            let val: i64 = v.trim().parse().unwrap();
            assert!(
                val == -65 || val == -1 || val == 63,
                "PRN{prn}: autocorr value {val} outside Gold set {{-65,-1,63}}"
            );
        }
        n += 1;
    }
    assert!(n >= 8, "expected >= 8 PRN autocorr cases, got {n}");
    eprintln!("navsignal Gold autocorr: {n} IS-GPS-200 PRNs, all measured sidelobe = {bound_int} = kshana bound");
}

/// The whole-family three-valued set observed across PRN 1..8 must be exactly the
/// n=10 Gold set {-65,-1,63} — the strongest single assertion that the codes are
/// a genuine Gold family and kshana's t(n) parameter is correct.
#[test]
fn observed_gold_set_is_exactly_minus65_minus1_63() {
    let mut found = false;
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("GOLDSET ") {
            let mut vals: Vec<i64> = rest
                .trim()
                .split(',')
                .map(|x| x.trim().parse().unwrap())
                .collect();
            vals.sort();
            assert_eq!(
                vals,
                vec![-65, -1, 63],
                "observed Gold value union must be exactly {{-65,-1,63}}"
            );
            // t(10) = 1 + 2^6 = 65 is the magnitude bound; kshana encodes it as
            // 65/1023, and 65 is the largest magnitude in the observed set.
            let bound_int =
                (CodeFamily::Gold { n: 10 }.max_crosscorr().unwrap() * L).round() as i64;
            let observed_max_mag = vals.iter().map(|v| v.abs()).max().unwrap();
            assert_eq!(
                bound_int, observed_max_mag,
                "kshana t(n) bound {bound_int} must equal the observed max magnitude {observed_max_mag}"
            );
            found = true;
        }
    }
    assert!(found, "GOLDSET row missing from fixture");
}

// ─────────────────────────── PART (b): PSD shape ────────────────────────────

/// Analytic bin-average of kshana's `Modulation::psd` over a 0.5*Rc bin centred at
/// `center_rc` (in units of Rc), normalised by Rc to the dimensionless G(f)*Rc the
/// fixture reports. We sample the closed form finely inside the bin and average —
/// the analytic counterpart of the generator's periodogram bin-average.
fn kshana_psd_bin(m: &Modulation, center_rc: f64) -> f64 {
    let lo = (center_rc - 0.25) * RC;
    let hi = (center_rc + 0.25) * RC;
    let steps = 400usize;
    let mut acc = 0.0;
    for i in 0..steps {
        let f = lo + (hi - lo) * (i as f64 + 0.5) / steps as f64;
        acc += m.psd(f);
    }
    (acc / steps as f64) * RC
}

/// RMS of (empirical periodogram bin − kshana closed-form bin) over +-12*Rc,
/// normalised by the peak of the closed form, must be <= 5% for BOTH BPSK-R(1)
/// and sine-BOC(1,1). The empirical column comes from scipy.signal.periodogram.
#[test]
fn psd_shape_matches_scipy_periodogram_within_5pct_rms() {
    let bpsk = Modulation::BpskR { n: 1.0 };
    let boc = Modulation::BocSin { m: 1.0, n: 1.0 };

    let mut centers = Vec::new();
    let mut emp_bpsk = Vec::new();
    let mut emp_boc = Vec::new();
    for line in REF.lines() {
        if !line.starts_with("PSD ") {
            continue;
        }
        // PSD binCenter/Rc | empirical_bpsk*Rc | empirical_boc11*Rc
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "PSD row needs 3 |-fields: {line}");
        let c: f64 = parts[0].split_whitespace().nth(1).unwrap().parse().unwrap();
        centers.push(c);
        emp_bpsk.push(parts[1].trim().parse::<f64>().unwrap());
        emp_boc.push(parts[2].trim().parse::<f64>().unwrap());
    }
    assert!(
        centers.len() >= 40,
        "expected >= 40 PSD bins, got {}",
        centers.len()
    );

    // Closed-form binned PSD on the identical bins.
    let clf_bpsk: Vec<f64> = centers.iter().map(|&c| kshana_psd_bin(&bpsk, c)).collect();
    let clf_boc: Vec<f64> = centers.iter().map(|&c| kshana_psd_bin(&boc, c)).collect();

    let rms_norm = |emp: &[f64], clf: &[f64]| -> f64 {
        let peak = clf.iter().cloned().fold(0.0_f64, f64::max);
        let ms: f64 = emp
            .iter()
            .zip(clf)
            .map(|(e, c)| (e - c) * (e - c))
            .sum::<f64>()
            / emp.len() as f64;
        ms.sqrt() / peak
    };

    let rms_bpsk = rms_norm(&emp_bpsk, &clf_bpsk);
    let rms_boc = rms_norm(&emp_boc, &clf_boc);
    eprintln!(
        "navsignal PSD vs scipy periodogram: BPSK RMS/peak {rms_bpsk:.4}, BOC RMS/peak {rms_boc:.4} (gate 0.05)"
    );
    assert!(
        rms_bpsk <= 0.05,
        "BPSK PSD shape RMS/peak {rms_bpsk:.4} > 0.05 vs scipy periodogram"
    );
    assert!(
        rms_boc <= 0.05,
        "BOC(1,1) PSD shape RMS/peak {rms_boc:.4} > 0.05 vs scipy periodogram"
    );

    // Directional sanity preserved by the empirical data itself: BPSK peaks at the
    // carrier bin while sine-BOC nulls there and splits to +-Rc.
    let i_center = centers
        .iter()
        .enumerate()
        .min_by(|a, b| a.1.abs().partial_cmp(&b.1.abs()).unwrap())
        .unwrap()
        .0;
    assert!(
        emp_bpsk[i_center] > emp_boc[i_center],
        "empirical: BPSK should dominate BOC at the carrier ({} vs {})",
        emp_bpsk[i_center],
        emp_boc[i_center]
    );
}

/// kshana's BPSK self spectral-separation coefficient (kappa = integral G^2 df,
/// computed by `spectral_separation_coeff`) must match the empirical periodogram's
/// integral G^2 df to within 3%, AND the analytic 2/(3*Rc) to within 3% — the
/// closed-form anchor the navsignal module is built on, now confronted with a real
/// spectral estimate rather than only with itself.
#[test]
fn bpsk_self_ssc_matches_periodogram_and_closed_form() {
    let mut emp_kappa = f64::NAN;
    let mut closed_form = f64::NAN;
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("SSC ") {
            let parts: Vec<&str> = rest.splitn(2, '|').collect();
            assert_eq!(parts.len(), 2, "SSC row needs 2 |-fields: {line}");
            emp_kappa = parts[0].trim().parse().unwrap();
            closed_form = parts[1].trim().parse().unwrap();
        }
    }
    assert!(emp_kappa.is_finite(), "SSC row missing from fixture");

    // kshana's own SSC integral over a wide band.
    let bpsk = Modulation::BpskR { n: 1.0 };
    let kshana_kappa = spectral_separation_coeff(&bpsk, &bpsk, 24.0 * RC);

    let rel_emp = (kshana_kappa - emp_kappa).abs() / emp_kappa;
    let rel_closed = (kshana_kappa - closed_form).abs() / closed_form;
    let analytic = 2.0 / (3.0 * RC);
    let rel_analytic_check = (closed_form - analytic).abs() / analytic;
    eprintln!(
        "navsignal BPSK self-SSC: kshana {kshana_kappa:.4e} | scipy {emp_kappa:.4e} (rel {rel_emp:.4}) | 2/(3Rc) {closed_form:.4e} (rel {rel_closed:.4})"
    );
    assert!(
        rel_analytic_check < 1e-9,
        "fixture closed form should be 2/(3Rc)"
    );
    assert!(
        rel_emp < 0.03,
        "kshana BPSK self-SSC vs scipy periodogram integral G^2 df: rel {rel_emp:.4} > 0.03"
    );
    assert!(
        rel_closed < 0.03,
        "kshana BPSK self-SSC vs 2/(3Rc): rel {rel_closed:.4} > 0.03"
    );
}
