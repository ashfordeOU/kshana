// SPDX-License-Identifier: AGPL-3.0-only
//! External-oracle validation of kshana's **GNSS-denied jamming resilience**
//! ([`kshana::jamming`] anti-jam / link-budget chain, [`kshana::navsignal`] PSD-derived
//! `Q`, and the [`kshana::realdata::jammertest`] reader on real field data).
//!
//! Three parts, each with an honestly-stated scope. The committed generator and its
//! provenance live in `tests/fixtures/gnss_denied_jamming_resilience/`.
//!
//! PART (a) -- link-budget re-derivation (InternalConsistency).
//!   The oracle is an independent python `math`/`numpy` re-derivation of the
//!   Kaplan & Hegarty (*Understanding GPS/GNSS*, 3rd ed., Sec. 9.4) anti-jam chain:
//!   free-space path loss, jammer-to-signal ratio `J/S`, and the despreading
//!   effective-`C/N0` equation `(C/N0)_eff = [1/(C/N0) + (J/S)/(Q*Rc)]^-1`. The
//!   first two rows reproduce the textbook worked anchors (1 km / 100 km, 10 W,
//!   broadband: `J/S` = 72.105 / 32.105 dB, eff `C/N0` = -12.0 / 27.9 dB-Hz). This
//!   confronts kshana's `free_space_path_loss_db` / `j_over_s_db` /
//!   `nominal_cn0_dbhz` / `effective_cn0_dbhz` with the re-derivation over a 14-case
//!   sweep (power, range, antenna gains, `Q`, chip rate, temperature) to < 1e-3 dB.
//!   **Honest scope:** the python re-derivation shares the closed-form equations, so
//!   this is an *internal-consistency* / arithmetic-assembly check across two
//!   independent implementations (Rust vs python), pinned to the published worked
//!   numbers -- NOT a measurement-independent physical oracle.
//!
//! PART (b) -- PSD-derived spectral-separation coefficient `Q` (closed-form anchor).
//!   The rigorous interference term is `(J/S)*kappa` with
//!   `kappa = integral G_s(f) G_i(f) df` (Betz 2001). For a BPSK-R(1) signal against
//!   the matched-BPSK reference, the self-SSC has the published closed form
//!   `kappa = integral G^2 df = 2/(3*Rc)`, giving the equivalent
//!   `Q = 1/(Rc*kappa) = 3/2 = 1.5` exactly. The oracle computes `kappa` by
//!   `scipy.integrate.quad` of the analytic BPSK PSD; this test confronts kshana's
//!   `spectral_separation_coeff` + `q_from_ssc` against both the quadrature value and
//!   the published `2/(3*Rc)` / `Q = 1.5` closed form, to within 1 %.
//!
//! PART (c) -- JammerTest 2024 measured C/N0 fall (REAL field data, characterisation).
//!   The oracle is the **JammerTest 2024** campaign (Zenodo `10.5281/zenodo.15910563`,
//!   GPL-3.0), scenario 1.6.4: a stationary rover under a power-ramping broadband
//!   jammer (0.2 uW -> 50 W). The fixture carries the per-30 s-bin median GPS-L1
//!   `C/N0` and tracked-SV count, parsed by kshana's own
//!   `jammertest::rinex_cn0_observations` from the committed `rinex.csv`. This asserts
//!   the ORDINAL real-data facts the resilience model predicts: a healthy clean
//!   baseline (~43 dB-Hz), a strictly monotone fall as the jammer ramps up, a trough
//!   that crosses the 25 dB-Hz C/A tracking threshold while the SV count collapses to
//!   <= 1, and a symmetric recovery as the ramp comes down. A measurement, not a
//!   re-derivation -- but ordinal, so this part keeps the capability MODELLED.

use kshana::jamming::{
    effective_cn0_dbhz, free_space_path_loss_db, j_over_s_db, nominal_cn0_dbhz,
};
use kshana::navsignal::{q_from_ssc, spectral_separation_coeff, Modulation, F0_HZ};
use kshana::realdata::jammertest::rinex_cn0_observations;

const REF: &str =
    include_str!("fixtures/gnss_denied_jamming_resilience/gnss_denied_jamming_resilience_reference.txt");

/// Real JammerTest 2024 rinex (Zenodo 10.5281/zenodo.15910563, GPL-3.0), scenario
/// 1.6.4 -- consumed via kshana's own reader to cross-check the fixture's C/N0 series.
const JAMMERTEST_RINEX: &str = include_str!(concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/realdata-cache/jammertest2024/Jamming/stationary/Very High Power (≥10W)/Bands_L1_L2_L5/1.6.4/rinex.csv"
));

/// Link-budget agreement: a relative bound plus a small absolute floor (dB). Both
/// implementations evaluate the same closed forms, so the residual is pure float
/// reassociation -- far below the 1e-3 dB gate.
const LINK_REL_TOL: f64 = 1e-9;
const LINK_ABS_TOL: f64 = 1e-3; // dB
/// Q closed-form / quadrature agreement: 1 % (the task's stated tolerance).
const Q_REL_TOL: f64 = 0.01;
/// C/A code-tracking-loss threshold (dB-Hz) -- the 25 dB-Hz the trough must cross.
const TRACKING_THRESHOLD_DBHZ: f64 = 25.0;

fn f(s: &str) -> f64 {
    s.trim()
        .parse()
        .unwrap_or_else(|_| panic!("not a float: '{s}'"))
}

fn approx(got: f64, want: f64) -> bool {
    (got - want).abs() <= LINK_REL_TOL * want.abs() + LINK_ABS_TOL
}

// ─────────────────── PART (a): link-budget re-derivation ────────────────────

#[test]
fn link_budget_matches_independent_rederivation() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        let Some(rest) = line.strip_prefix("LINK ") else {
            continue;
        };
        // name | Pj | Gj | Grj | d | f | Ps | Grs | Q | Rc | tk | fspl | js | cn0_nom | cn0_eff
        let p: Vec<&str> = rest.split('|').collect();
        assert_eq!(p.len(), 15, "LINK row needs 15 |-fields: {line}");
        let name = p[0].trim();
        let (pj, gj, grj) = (f(p[1]), f(p[2]), f(p[3]));
        let (d, freq) = (f(p[4]), f(p[5]));
        let (ps, grs) = (f(p[6]), f(p[7]));
        let (q, rc, tk) = (f(p[8]), f(p[9]), f(p[10]));
        let (want_fspl, want_js) = (f(p[11]), f(p[12]));
        let (want_cn0_nom, want_cn0_eff) = (f(p[13]), f(p[14]));

        let got_fspl = free_space_path_loss_db(d, freq);
        let got_js = j_over_s_db(pj, gj, grj, d, freq, ps, grs);
        let got_cn0_nom = nominal_cn0_dbhz(ps, grs, tk);
        let got_cn0_eff = effective_cn0_dbhz(got_cn0_nom, got_js, q, rc);

        for (lbl, got, want) in [
            ("fspl", got_fspl, want_fspl),
            ("js", got_js, want_js),
            ("cn0_nom", got_cn0_nom, want_cn0_nom),
            ("cn0_eff", got_cn0_eff, want_cn0_eff),
        ] {
            let dlt = (got - want).abs();
            worst = worst.max(dlt);
            assert!(
                approx(got, want),
                "LINK {name}: {lbl} kshana {got:.9} dB vs re-derivation {want:.9} dB \
                 (|Δ|={dlt:.2e} > {:.2e})",
                LINK_REL_TOL * want.abs() + LINK_ABS_TOL
            );
        }
        n += 1;
    }
    assert!(n >= 12, "expected >=12 link-budget cases, got {n}");
    eprintln!(
        "gnss_denied_jamming_resilience PART(a): {n} link-budget cases vs independent \
         python re-derivation (Kaplan & Hegarty Sec. 9.4), worst |Δ| = {worst:.3e} dB"
    );
}

// ─────────────────── PART (b): PSD-derived Q closed-form ────────────────────

#[test]
fn psd_derived_q_matches_two_thirds_rc_closed_form() {
    let line = REF
        .lines()
        .find(|l| l.starts_with("QANCHOR "))
        .expect("QANCHOR row present");
    // rc | band | kappa_quad | kappa_closed | q_quad | q_closed
    let p: Vec<&str> = line.strip_prefix("QANCHOR ").unwrap().split('|').collect();
    assert_eq!(p.len(), 6, "QANCHOR row needs 6 |-fields: {line}");
    let rc = f(p[0]);
    let band = f(p[1]);
    let kappa_quad = f(p[2]);
    let kappa_closed = f(p[3]); // 2/(3*Rc)
    let q_quad = f(p[4]);
    let q_closed = f(p[5]); // 1.5

    // Anchor sanity: kshana's chip-rate base unit is the C/A rate.
    assert!((rc - F0_HZ).abs() < 1e-6, "rc {rc} should be F0_HZ {F0_HZ}");
    assert!(
        (q_closed - 1.5).abs() < 1e-9,
        "matched-BPSK closed-form Q must be 3/2"
    );

    // kshana's spectral_separation_coeff for BPSK-R(1) vs matched BPSK-R(1) = kappa.
    let bpsk = Modulation::BpskR { n: 1.0 };
    let kappa_kshana = spectral_separation_coeff(&bpsk, &bpsk, band);
    let q_kshana = q_from_ssc(kappa_kshana, rc);

    // kshana's kappa vs the scipy quadrature value.
    let rel_kappa_quad = (kappa_kshana - kappa_quad).abs() / kappa_quad.abs();
    // kshana's kappa vs the published closed form 2/(3*Rc).
    let rel_kappa_closed = (kappa_kshana - kappa_closed).abs() / kappa_closed.abs();
    // kshana's Q vs the published Q = 1.5.
    let rel_q_closed = (q_kshana - q_closed).abs() / q_closed.abs();
    let rel_q_quad = (q_kshana - q_quad).abs() / q_quad.abs();

    assert!(
        rel_kappa_quad < Q_REL_TOL,
        "kappa kshana {kappa_kshana:.6e} vs scipy.quad {kappa_quad:.6e} (rel {rel_kappa_quad:.3e} > {Q_REL_TOL})"
    );
    assert!(
        rel_kappa_closed < Q_REL_TOL,
        "kappa kshana {kappa_kshana:.6e} vs 2/(3*Rc) {kappa_closed:.6e} (rel {rel_kappa_closed:.3e} > {Q_REL_TOL})"
    );
    assert!(
        rel_q_closed < Q_REL_TOL,
        "Q kshana {q_kshana:.6} vs closed-form 1.5 (rel {rel_q_closed:.3e} > {Q_REL_TOL})"
    );
    assert!(
        rel_q_quad < Q_REL_TOL,
        "Q kshana {q_kshana:.6} vs scipy-quad {q_quad:.6} (rel {rel_q_quad:.3e} > {Q_REL_TOL})"
    );

    eprintln!(
        "gnss_denied_jamming_resilience PART(b): kshana BPSK self-SSC κ={kappa_kshana:.4e} \
         (scipy.quad {kappa_quad:.4e}, closed 2/(3Rc) {kappa_closed:.4e}); Q={q_kshana:.4} \
         vs closed 1.5 (rel {rel_q_closed:.2e})"
    );
}

// ─────────────── PART (c): JammerTest 2024 real C/N0 ordinal facts ──────────

/// One per-bin row of the JammerTest fixture: (sod, median_cn0, n_obs, n_sv, attack).
struct JtBin {
    sod: i64,
    median_cn0: f64,
    n_obs: usize,
    n_sv: usize,
    attack: bool,
}

fn jammertest_bins() -> Vec<JtBin> {
    REF.lines()
        .filter_map(|l| {
            let rest = l.strip_prefix("JTBIN ")?;
            let p: Vec<&str> = rest.split('|').collect();
            assert_eq!(p.len(), 5, "JTBIN row needs 5 |-fields: {l}");
            Some(JtBin {
                sod: p[0].trim().parse().unwrap(),
                median_cn0: f(p[1]),
                n_obs: p[2].trim().parse().unwrap(),
                n_sv: p[3].trim().parse().unwrap(),
                attack: p[4].trim() == "1",
            })
        })
        .collect()
}

#[test]
fn jammertest_measured_cn0_falls_through_tracking_threshold() {
    let bins = jammertest_bins();
    assert!(
        bins.len() >= 20,
        "expected >=20 JammerTest C/N0 bins, got {}",
        bins.len()
    );

    // "Robust" bins carry enough observations for a trustworthy median.
    let robust: Vec<&JtBin> = bins.iter().filter(|b| b.n_obs >= 5).collect();

    // (1) Healthy clean baseline: pre-attack robust median ~43 dB-Hz, comfortably
    //     above the 25 dB-Hz tracking threshold.
    let clean: Vec<f64> = robust
        .iter()
        .filter(|b| !b.attack)
        .map(|b| b.median_cn0)
        .collect();
    assert!(!clean.is_empty(), "no clean robust bins");
    let clean_lo = clean.iter().cloned().fold(f64::INFINITY, f64::min);
    assert!(
        clean_lo >= 40.0,
        "clean baseline median should stay healthy (>=40 dB-Hz), min was {clean_lo}"
    );

    // (2) Strictly monotone fall as the jammer ramps up. The robust ramp-up segment
    //     is the run of attack bins from the last clean-level bin to the robust
    //     trough; assert each step is a strict decrease over >= 4 steps.
    let ramp: Vec<&&JtBin> = robust
        .iter()
        .filter(|b| b.attack && (52050..=52200).contains(&b.sod))
        .collect();
    assert!(
        ramp.len() >= 5,
        "expected >=5 robust ramp-up bins, got {}",
        ramp.len()
    );
    for w in ramp.windows(2) {
        assert!(
            w[1].median_cn0 < w[0].median_cn0,
            "ramp-up C/N0 must fall monotonically: bin@{} {} !< bin@{} {}",
            w[1].sod,
            w[1].median_cn0,
            w[0].sod,
            w[0].median_cn0
        );
    }
    let ramp_drop = ramp.first().unwrap().median_cn0 - ramp.last().unwrap().median_cn0;
    assert!(
        ramp_drop >= 10.0,
        "ramp should drop C/N0 by >=10 dB-Hz, dropped {ramp_drop:.1}"
    );

    // (3) The trough crosses the 25 dB-Hz C/A tracking threshold. Among ALL attack
    //     bins (including the sparse deepest ones) the minimum median is below 25,
    //     and the deepest robust bin sits in the degraded band near it.
    let attack_min_median = bins
        .iter()
        .filter(|b| b.attack)
        .map(|b| b.median_cn0)
        .fold(f64::INFINITY, f64::min);
    assert!(
        attack_min_median < TRACKING_THRESHOLD_DBHZ,
        "measured C/N0 must cross below the {TRACKING_THRESHOLD_DBHZ} dB-Hz threshold; \
         min attack median was {attack_min_median}"
    );

    // (4) The tracked-SV count collapses under the jammer: from the clean ~10 GPS SVs
    //     down to <= 1 at the ramp peak.
    let clean_sv_max = robust
        .iter()
        .filter(|b| !b.attack)
        .map(|b| b.n_sv)
        .max()
        .unwrap();
    let attack_sv_min = bins.iter().filter(|b| b.attack).map(|b| b.n_sv).min().unwrap();
    assert!(
        clean_sv_max >= 8,
        "clean baseline should track >=8 GPS SVs, had {clean_sv_max}"
    );
    assert!(
        attack_sv_min <= 1,
        "SV count should collapse to <=1 under the 50 W peak, min was {attack_sv_min}"
    );

    // (5) Symmetric recovery: the last attack bins return to a healthy median once
    //     the ramp comes back down.
    let recovered = robust
        .iter()
        .filter(|b| b.attack && b.sod >= 52650)
        .map(|b| b.median_cn0)
        .fold(f64::NEG_INFINITY, f64::max);
    assert!(
        recovered >= 40.0,
        "C/N0 should recover to >=40 dB-Hz as the ramp ends, max-late was {recovered}"
    );

    // (6) Cross-check the fixture against kshana's OWN JammerTest reader: re-parse the
    //     committed rinex.csv with rinex_cn0_observations and confirm the clean-baseline
    //     vs deepest-attack GPS-L1 medians reproduce the same fall direction and that
    //     the deepest attack window contains sub-25 dB-Hz GPS-L1 samples.
    let obs = rinex_cn0_observations(JAMMERTEST_RINEX);
    let mut clean_g1: Vec<f64> = Vec::new();
    let mut deep_g1: Vec<f64> = Vec::new();
    for o in &obs {
        if o.obs.detector != "cn0_G_L1" {
            continue;
        }
        let Some(secs) = secs_of_day(&o.time) else {
            continue;
        };
        if (51570..51900).contains(&secs) {
            clean_g1.push(o.obs.raw);
        } else if (52140..52470).contains(&secs) {
            deep_g1.push(o.obs.raw);
        }
    }
    assert!(
        clean_g1.len() > 100 && deep_g1.len() > 10,
        "reader cross-check needs samples: clean {} deep {}",
        clean_g1.len(),
        deep_g1.len()
    );
    let clean_med = median(&mut clean_g1);
    let deep_med = median(&mut deep_g1);
    assert!(
        deep_med < clean_med - 10.0,
        "reader cross-check: deep-attack median {deep_med} should fall >=10 dB-Hz below \
         clean median {clean_med}"
    );
    let n_below = deep_g1
        .iter()
        .filter(|&&v| v < TRACKING_THRESHOLD_DBHZ)
        .count();
    assert!(
        n_below > 0,
        "reader cross-check: deep-attack window must hold sub-{TRACKING_THRESHOLD_DBHZ} dB-Hz \
         GPS-L1 samples, found {n_below}"
    );

    eprintln!(
        "gnss_denied_jamming_resilience PART(c): JammerTest 2024 scn 1.6.4 -- clean {clean_lo:.0} dB-Hz \
         -> ramp drop {ramp_drop:.0} dB -> attack-min median {attack_min_median:.0} dB-Hz (< {TRACKING_THRESHOLD_DBHZ}); \
         SV {clean_sv_max} -> {attack_sv_min}; reader cross-check clean {clean_med:.0} -> deep {deep_med:.0} dB-Hz, \
         {n_below} sub-threshold samples"
    );
}

/// Seconds-of-day from a `"YYYY-MM-DD HH:MM:SS[.fff]"` rinex timestamp.
fn secs_of_day(ts: &str) -> Option<i64> {
    let tail = ts.split(' ').nth(1)?;
    let mut it = tail.split(':');
    let h: i64 = it.next()?.trim().parse().ok()?;
    let m: i64 = it.next()?.trim().parse().ok()?;
    let s: i64 = it.next()?.split('.').next()?.trim().parse().ok()?;
    Some(h * 3600 + m * 60 + s)
}

fn median(xs: &mut [f64]) -> f64 {
    xs.sort_by(|a, b| a.partial_cmp(b).unwrap());
    let n = xs.len();
    if n == 0 {
        return f64::NAN;
    }
    if n % 2 == 1 {
        xs[n / 2]
    } else {
        0.5 * (xs[n / 2 - 1] + xs[n / 2])
    }
}
