// SPDX-License-Identifier: AGPL-3.0-only
//! **Paper-5 RF ranging/timing precision — validation of the underlying physics.**
//!
//! The Paper-5 Table-1 RF precision numbers (~1 m / ~0.1 m ranging, ~1 ns / ~0.3 ns
//! timing for S-/Ka-band) are NOT computed by the engine: in
//! `src/hybrid_integrity.rs` the RF solution enters as chosen parametric 1-sigma
//! inputs (`rf_pos_sigma_m = 1.0`, `rf_clock_sigma_s = 3.0e-9`), so the headline
//! RF sigma is honestly labelled **Modelled**. This test does NOT promote that
//! headline. Instead it validates the *underlying physical quantities* that a
//! forward RF-precision model would rest on — the deep-space C/N0 and the
//! Kaplan & Hegarty thermal-noise tracking-jitter closed forms — against an
//! INDEPENDENT hand-computed reference, and shows that such a forward model
//! reproduces the Table-1 *ranging* order of magnitude.
//!
//! ## Independent reference (non-circular)
//! The oracle is Kaplan & Hegarty, *Understanding GPS/GNSS: Principles and
//! Applications*, 3rd ed. (Artech House, 2017), Ch. 8:
//!
//! * DLL coherent early-late code-tracking jitter (eq. 8.90):
//!   `sigma_code = sqrt( (B_L*d/(2c)) * (1 + 2/((2-d)*T*c)) )` [chips]
//! * PLL carrier-phase thermal jitter (eq. 8.72):
//!   `sigma_phi = sqrt( B_L / c )` [rad]
//!
//! with `c` the LINEAR C/N0. These closed forms are recomputed in pure
//! Python/NumPy by the committed generator
//! `tests/fixtures/rf_ranging_precision/generate_rf_ranging_reference.py`
//! (a different language and code path; it imports NOTHING from kshana), with
//! the C/N0 built by hand from the CCSDS-401 / DSN-810-005 one-way link
//! equation. The Rust test loads that committed fixture and confronts it with
//! the engine's OWN [`kshana::linkbudget::link_budget`] (C/N0 from EIRP/G/T/
//! range) and OWN [`kshana::navsignal::dll_code_jitter_chips`] (the DLL bound).
//! If the engine's link equation or DLL jitter formula were wrong, the test
//! fails. The two implementations share only the physics (Friis loss, the
//! Kaplan & Hegarty tracking bounds), never code — so this is a genuine
//! independent cross-check, not a self-comparison.
//!
//! ## Hardcoded textbook worked value
//! At C/N0 = 45 dB-Hz, B_L = 1 Hz, d = 0.5 chip, T = 20 ms the DLL code jitter is
//! `sqrt(1*0.5/(2*10^4.5) * (1 + 2/(1.5*0.02*10^4.5))) = 2.814e-3` chip, i.e.
//! `2.814e-3 * c / 1.023e6 = 0.825 m` for a GPS-like 1.023 Mcps PN code — the
//! classic sub-metre GPS DLL figure (Kaplan & Hegarty, Ch. 8). This test
//! reproduces that worked value from the engine's own function, independent of
//! the CSV fixture.
//!
//! ## Honest scope
//! This validates the deep-space C/N0 and the DLL/PLL thermal tracking bounds,
//! and demonstrates the *ranging* order of magnitude (S ~1 m, Ka ~0.1 m). The
//! Table-1 *timing* headline (~1 ns / ~0.3 ns) is NOT uniquely reproduced by
//! either closed form: the code-derived timing is `ranging/c` (~3 ns / ~0.43 ns)
//! and the carrier-phase floor is sub-picosecond, so the chosen timing sigma sits
//! between the code-ranging bound and the on-board clock stability and REMAINS
//! Modelled. This test does not touch the `hybrid_integrity.rs` chosen RF sigmas.

use kshana::linkbudget::{link_budget, LinkParams};
use kshana::navsignal::dll_code_jitter_chips;
use kshana::radiometric::Band;

const C_M_PER_S: f64 = 299_792_458.0;

const REF: &str = include_str!("fixtures/rf_ranging_precision/rf_ranging_reference.csv");

/// One parsed reference row from the independent Python fixture.
struct Row {
    label: String,
    band: Band,
    freq_hz: f64,
    range_m: f64,
    eirp_dbw: f64,
    g_over_t_db: f64,
    other_db: f64,
    chip_rate_hz: f64,
    loop_bw_hz: f64,
    corr_spacing_chips: f64,
    integ_time_s: f64,
    fsl_db: f64,
    cn0_dbhz: f64,
    sigma_code_chips: f64,
    sigma_range_m: f64,
    sigma_code_time_ns: f64,
    #[allow(dead_code)]
    pll_phase_rad: f64,
    pll_time_ps: f64,
}

fn band_from_str(s: &str) -> Band {
    match s {
        "S" => Band::S,
        "X" => Band::X,
        "Ka" => Band::Ka,
        other => panic!("unknown band {other}"),
    }
}

fn parse_rows() -> Vec<Row> {
    let mut rows = Vec::new();
    for line in REF.lines() {
        if line.starts_with('#') || line.trim().is_empty() {
            continue;
        }
        let f: Vec<&str> = line.split(';').collect();
        assert_eq!(
            f.len(),
            18,
            "reference row must have 18 fields, got {}: {line}",
            f.len()
        );
        rows.push(Row {
            label: f[0].to_string(),
            band: band_from_str(f[1]),
            freq_hz: f[2].parse().unwrap(),
            range_m: f[3].parse().unwrap(),
            eirp_dbw: f[4].parse().unwrap(),
            g_over_t_db: f[5].parse().unwrap(),
            other_db: f[6].parse().unwrap(),
            chip_rate_hz: f[7].parse().unwrap(),
            loop_bw_hz: f[8].parse().unwrap(),
            corr_spacing_chips: f[9].parse().unwrap(),
            integ_time_s: f[10].parse().unwrap(),
            fsl_db: f[11].parse().unwrap(),
            cn0_dbhz: f[12].parse().unwrap(),
            sigma_code_chips: f[13].parse().unwrap(),
            sigma_range_m: f[14].parse().unwrap(),
            sigma_code_time_ns: f[15].parse().unwrap(),
            pll_phase_rad: f[16].parse().unwrap(),
            pll_time_ps: f[17].parse().unwrap(),
        });
    }
    assert!(rows.len() >= 2, "expected >= 2 reference cases");
    rows
}

/// The engine's link-budget C/N0 (from EIRP / G/T / range) must reproduce the
/// independently hand-computed CCSDS-401 link-equation C/N0 in the fixture.
/// This is the first half of the forward model: the deep-space carrier density.
#[test]
fn engine_link_budget_cn0_matches_independent_link_equation() {
    for r in parse_rows() {
        // The band-centre frequency the engine uses must match the fixture's.
        let engine_f = r.band.downlink_hz();
        assert!(
            (engine_f - r.freq_hz).abs() < 1.0,
            "{}: engine band freq {engine_f} != fixture {}",
            r.label,
            r.freq_hz
        );
        let params = LinkParams {
            band: r.band,
            eirp_dbw: r.eirp_dbw,
            g_over_t_db: r.g_over_t_db,
            range_m: r.range_m,
            // Data rate only affects Eb/N0, not C/N0; pick a benign value.
            data_rate_bps: 1.0e3,
            other_losses_db: r.other_db,
        };
        // required Eb/N0 is irrelevant to C/N0; pass 0.
        let res = link_budget(&params, 0.0);

        // FSPL agreement (the reference recomputes 20 log10(4 pi R f / c) by hand).
        assert!(
            (res.fsl_db - r.fsl_db).abs() < 0.01,
            "{}: engine FSL {} vs ref {} (>0.01 dB)",
            r.label,
            res.fsl_db,
            r.fsl_db
        );
        // C/N0 agreement. The only source of difference is the engine's rounded
        // Boltzmann k (-228.5991) vs the exact 10 log10(1.380649e-23); that is
        // ~6.7e-5 dB, so a 1e-3 dB tolerance is a genuine agreement bound.
        assert!(
            (res.cn0_dbhz - r.cn0_dbhz).abs() < 1.0e-3,
            "{}: engine C/N0 {} vs independent {} (>1e-3 dB)",
            r.label,
            res.cn0_dbhz,
            r.cn0_dbhz
        );
        eprintln!(
            "{:>22}: C/N0 engine={:.6} ref={:.6} dB-Hz (FSL {:.3} dB)",
            r.label, res.cn0_dbhz, r.cn0_dbhz, res.fsl_db
        );
    }
}

/// The engine's DLL code-tracking jitter (Kaplan & Hegarty eq. 8.90), fed the
/// engine's OWN link-budget C/N0, must reproduce the independently hand-computed
/// DLL jitter in the fixture — in chips, in metres (ranging sigma), and in the
/// code-derived timing sigma (ranging/c). This is the second half of the forward
/// model. Agreement to a tight relative tolerance proves the engine's DLL bound
/// equals the textbook closed form.
#[test]
fn engine_dll_jitter_matches_independent_kaplan_hegarty_bound() {
    for r in parse_rows() {
        // Use the engine's OWN C/N0, not the fixture's, so the whole chain
        // (link budget -> DLL bound) is the engine's, confronted with the
        // independent Python value.
        let params = LinkParams {
            band: r.band,
            eirp_dbw: r.eirp_dbw,
            g_over_t_db: r.g_over_t_db,
            range_m: r.range_m,
            data_rate_bps: 1.0e3,
            other_losses_db: r.other_db,
        };
        let cn0 = link_budget(&params, 0.0).cn0_dbhz;

        let sigma_chips =
            dll_code_jitter_chips(cn0, r.loop_bw_hz, r.corr_spacing_chips, r.integ_time_s);
        let sigma_m = sigma_chips * C_M_PER_S / r.chip_rate_hz;
        let sigma_time_ns = (sigma_m / C_M_PER_S) * 1.0e9;

        // Relative agreement with the independent closed form. 1e-3 relative
        // easily absorbs the k-rounding C/N0 shift (< 1e-5 on sigma).
        let rel_chips = (sigma_chips - r.sigma_code_chips).abs() / r.sigma_code_chips;
        let rel_m = (sigma_m - r.sigma_range_m).abs() / r.sigma_range_m;
        let rel_t = (sigma_time_ns - r.sigma_code_time_ns).abs() / r.sigma_code_time_ns;
        assert!(
            rel_chips < 1.0e-3,
            "{}: DLL chips engine={} ref={} (rel {:.2e})",
            r.label,
            sigma_chips,
            r.sigma_code_chips,
            rel_chips
        );
        assert!(
            rel_m < 1.0e-3,
            "{}: ranging sigma engine={} m ref={} m (rel {:.2e})",
            r.label,
            sigma_m,
            r.sigma_range_m,
            rel_m
        );
        assert!(
            rel_t < 1.0e-3,
            "{}: code timing sigma engine={} ns ref={} ns (rel {:.2e})",
            r.label,
            sigma_time_ns,
            r.sigma_code_time_ns,
            rel_t
        );
        eprintln!(
            "{:>22}: sigma_R engine={:.6} m ref={:.6} m | timing {:.4} ns (code-derived)",
            r.label, sigma_m, r.sigma_range_m, sigma_time_ns
        );
    }
}

/// The engine's DLL bound reproduces the hardcoded Kaplan & Hegarty *textbook
/// worked value* (0.825 m at C/N0 = 45 dB-Hz, B_L = 1, d = 0.5, T = 20 ms,
/// R_c = 1.023 Mcps) — a hand value independent of the CSV fixture and of the
/// link budget. This is the canonical sub-metre GPS DLL figure.
#[test]
fn engine_dll_reproduces_hardcoded_kaplan_hegarty_worked_value() {
    // Kaplan & Hegarty, Ch.8: at 45 dB-Hz, 1 Hz loop, half-chip correlator, 20 ms.
    let sigma_chips = dll_code_jitter_chips(45.0, 1.0, 0.5, 0.02);
    // Hand value: c = 10^4.5 = 31622.777; lead = 0.5/(2c) = 7.9057e-6;
    // squaring = 1 + 2/(1.5*0.02*c) = 1.0021078; sigma = sqrt(...) = 2.8140e-3 chip.
    let hand_chips = 2.8140e-3;
    assert!(
        (sigma_chips - hand_chips).abs() / hand_chips < 5.0e-4,
        "DLL chips engine={sigma_chips} vs hand {hand_chips}"
    );
    let sigma_m = sigma_chips * C_M_PER_S / 1.023e6;
    let hand_m = 0.825;
    // 1% tolerance on the metres figure (hand value quoted to 3 sig figs).
    assert!(
        (sigma_m - hand_m).abs() / hand_m < 1.0e-2,
        "DLL ranging engine={sigma_m} m vs hand {hand_m} m"
    );
    eprintln!(
        "Kaplan&Hegarty worked value: engine sigma = {:.4e} chip = {:.4} m (hand 2.814e-3 chip / 0.825 m)",
        sigma_chips, sigma_m
    );
}

/// The forward model built from the validated closed forms reproduces the
/// Paper-5 Table-1 *ranging* order of magnitude to the assessment's 30% budget:
/// S-band ~1 m, Ka-band ~0.1 m. This is the "computed lands near the assumed
/// magnitude" demonstration — the ranging column becomes a computed-and-checked
/// quantity even though the Table-1 *timing* headline stays Modelled.
#[test]
fn forward_model_reproduces_table1_ranging_order_of_magnitude() {
    let mut seen_s = false;
    let mut seen_ka = false;
    for r in parse_rows() {
        let params = LinkParams {
            band: r.band,
            eirp_dbw: r.eirp_dbw,
            g_over_t_db: r.g_over_t_db,
            range_m: r.range_m,
            data_rate_bps: 1.0e3,
            other_losses_db: r.other_db,
        };
        let cn0 = link_budget(&params, 0.0).cn0_dbhz;
        let sigma_chips =
            dll_code_jitter_chips(cn0, r.loop_bw_hz, r.corr_spacing_chips, r.integ_time_s);
        let sigma_m = sigma_chips * C_M_PER_S / r.chip_rate_hz;

        let target = match r.band {
            Band::S => 1.0,  // Table-1 S-band ~1 m ranging
            Band::Ka => 0.1, // Table-1 Ka-band ~0.1 m ranging
            Band::X => continue,
        };
        // 30% engineering budget (order-of-magnitude), per the assessment.
        let rel = (sigma_m - target).abs() / target;
        assert!(
            rel <= 0.30,
            "{}: forward-model ranging {:.4} m is {:.0}% off Table-1 target {} m (>30%)",
            r.label,
            sigma_m,
            rel * 100.0,
            target
        );
        if r.band == Band::S {
            seen_s = true;
        }
        if r.band == Band::Ka {
            seen_ka = true;
        }
        eprintln!(
            "{:>22}: forward ranging {:.4} m vs Table-1 target {} m ({:.1}% off)",
            r.label,
            sigma_m,
            target,
            rel * 100.0
        );
    }
    assert!(seen_s && seen_ka, "need both S-band and Ka-band cases");
}

/// Sanity/honesty guard on the timing side: the carrier-phase (PLL) timing floor
/// in the fixture is SUB-PICOSECOND (< 1 ps) for both bands — far below the
/// Paper-5 Table-1 ~1 ns / ~0.3 ns headline — while the code-derived timing
/// (ranging/c) is at the few-ns / sub-ns level. This is the concrete evidence
/// that the Table-1 timing sigma is neither closed form alone and therefore
/// stays Modelled (it is a chosen representative bounded below by the
/// carrier-phase floor and above by the code-ranging bound / clock stability).
#[test]
fn timing_headline_is_bracketed_not_reproduced_stays_modelled() {
    for r in parse_rows() {
        // PLL carrier-phase floor: sub-picosecond.
        assert!(
            r.pll_time_ps < 1.0,
            "{}: PLL timing floor {} ps unexpectedly >= 1 ps",
            r.label,
            r.pll_time_ps
        );
        // Code-derived timing (ranging/c) is orders of magnitude larger than the
        // carrier-phase floor: the two closed forms bracket, they do not coincide
        // on, the ns-level Table-1 headline.
        let code_time_ps = r.sigma_code_time_ns * 1.0e3;
        assert!(
            code_time_ps > 100.0 * r.pll_time_ps,
            "{}: code timing {} ps not >> PLL floor {} ps",
            r.label,
            code_time_ps,
            r.pll_time_ps
        );
        eprintln!(
            "{:>22}: timing brackets -> PLL floor {:.4} ps  ..  code-derived {:.4} ns (Table-1 ~1 ns / 0.3 ns is chosen between -> stays Modelled)",
            r.label, r.pll_time_ps, r.sigma_code_time_ns
        );
    }
}
