// SPDX-License-Identifier: AGPL-3.0-only
//! Navigation-signal modulation measures against the numbers Betz (2001) and Hein et al. (2006)
//! print for named BPSK-R, BOC and MBOC cases.
//!
//! PRE-REGISTRATION (row M004, written 2026-10-01 before any Kshana value below was computed;
//! the engine functions it calls were committed in f3df5f5f with unit tests on other cases only).
//!
//! ORACLES (Reference, P1 of docs/VALIDATION.md: numbers the publications computed and printed;
//! the papers are reading copies outside the repository, numbers cited by page, table and figure):
//! - Betz, J. W., "Binary Offset Carrier Modulations for Radionavigation", NAVIGATION 48(4),
//!   Winter 2001-2002, pp. 227-246, doi 10.1002/j.2161-4296.2001.tb00247.x (paywalled; copy SHA-256
//!   12a2e6b6...82afe).
//! - Hein, G. W. et al., "MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS
//!   and GPS L1C", Inside GNSS, May/June 2006, pp. 57-65 (copy SHA-256 d67ac5ec...ba41768).
//!
//! TOLERANCE RULE (fixed here): half a unit of the last printed digit of each value (0.05 MHz,
//! 0.05 dB, 0.05 dB/Hz, 0.5 ns, 0.005 for a ratio printed to two decimals, 0.05 for a correlation
//! value printed to one decimal, 0.05 m for a bias printed to 0.1 m, 0.5 dB for "11 dB" and
//! "approximately 7 dB", 0.5 ns for "approximately 51 ns"); a pass is |Kshana - printed| <=
//! tolerance. Counts and "None" entries are exact.
//!
//! CONVENTIONS, read from the paper and fixed here (Kshana functions in `kshana::navsignal`):
//! - Unit-area densities `Modulation::psd` (Betz Eq. 7 and 8). Betz p. 231: signals "strictly
//!   bandlimited to 30 MHz bandwidth and normalized to unit power over that bandwidth"; the starred
//!   rows of Table 1 use a 24 MHz receive bandwidth. Unstarred rows therefore use 30 MHz.
//! - Table 1, p. 234 (columns 1.023 MHz PSK-R = BPSK(1), 10.23 MHz PSK-R = BPSK(10), BOC(5,2),
//!   BOC(8,4), BOC(10,5)):
//!   * main spectral peak offset (MHz): `psd_maximum(m, 30 MHz).0`; printed 0, 0, 4.9, 7.6, 9.5;
//!   * maximum PSD (dBW/Hz): `10 log10(psd_maximum(m, 30 MHz).1 / power_in_band(m, 30 MHz))`;
//!     printed -60.1, -69.8, -66.2, -68.9, -69.9;
//!   * 90 % power bandwidth (MHz): `fractional_power_bandwidth_hz(m, 0.9, 30 MHz)`; printed 1.6,
//!     12.1, 11.9, 18.9, 23.6;
//!   * out-of-band loss* (dB): `-10 log10(power_in_band(m, 24) / power_in_band(m, 30))`; printed
//!     0.0, 0.1, 0.1, 0.0, 0.4;
//!   * RMS bandwidth* (MHz, Eq. 13 on the normalised band-limited density): `rms_bandwidth_hz(m,
//!     24 MHz)`; printed 1.1, 3.5, 4.8, 7.5, 9.1;
//!   * equivalent rectangular bandwidth* (MHz, Eq. 18): `equivalent_rectangular_bandwidth_hz(m,
//!     24 MHz)`; printed 1.0, 9.3, 4.0, 7.8, 9.0;
//!   * spectral separation coefficients* (dB/Hz, Eq. 15 and 16: interferer normalised over the
//!     30 MHz transmit band, reference signal unit-area over all frequencies, 24 MHz receive band):
//!     `spectral_separation_coeff_band_limited(signal, interferer, 24 MHz, 30 MHz)`. Roles as the
//!     text on p. 234 states them: "with itself" signal = interferer = column; "with 1.023 MHz
//!     PSK-R" signal = BPSK(1) (the C/A receiver), interferer = column; "of BOC(10,5)" signal =
//!     column, interferer = BOC(10,5). Printed: itself -61.8, -71.5, -68.7, -71.4, -72.5; with
//!     1.023 MHz PSK-R -61.8, -69.9, -77.2, -85.2, -87.1; of BOC(10,5) -87.1, -80.2, -84.2, -73.5,
//!     -72.5;
//!   * first autocorrelation side lobe* (24 MHz): `first_acf_side_lobe(modulation_acf(m, 24 MHz,
//!     2.5 Tc, 0.05 ns), Tc)`, delay printed None, None, 101, 64, 54 ns and squared ratio None,
//!     None, 0.57, 0.54, 0.48 (Fig. 8, p. 234, confirms Table 1 reads the magnitude-squared
//!     correlation).
//! - Text p. 229, Fig. 2 "computed over 1 GHz bandwidth": BOC(5,1) has 19 peaks, the first peaks
//!   away from the main peak are separated from it by 97.8 ns and have the value -0.9, and the
//!   nearest zero crossing is "approximately 51 ns"; BOC(5,2) has 9 peaks, 97.8 ns, -0.8 and
//!   "approximately 54 ns". Kshana: `modulation_acf(m, 1 GHz, 1.05 Tc, 0.05 ns)`; the peaks are
//!   the extrema `acf_extrema(acf, Tc, 0.05)` on each side plus the main peak (19 = 2 x 9 + 1;
//!   0.05 is half the smallest ideal side peak 1/n of BOC(5,1)); the first peak is the first such
//!   extremum; the zero crossing is `acf_first_zero_s`.
//! - Fig. 17 text, p. 241: 24 MHz, code loop B_L = 0.1 Hz, NELP (non-coherent early-late power)
//!   with spacing 0.05 chip for BPSK(1), 0.5 chip for BPSK(10), 80 ns for BOC(5,2), 50 ns for
//!   BOC(8,4), 40 ns for BOC(10,5). Printed: BOC(5,2) gives "the same code-tracking accuracy as
//!   1.023 MHz PSK-R at 11 dB lower C/N0"; BOC(8,4) and BOC(10,5) "the same ... as 10.23 MHz PSK-R
//!   at approximately 7 dB lower C/N0". The figure does not state the integration time; T = 20 ms
//!   (the paper's 50 bps case, p. 238) is fixed here. Kshana: `dll_jitter_bandlimited_s(...,
//!   EarlyLate::NonCoherent)`; the C/N0 offset is the Delta solving sigma_BOC(40 dB-Hz - Delta) =
//!   sigma_PSK(40 dB-Hz), 40 dB-Hz being the top of the plotted range.
//! - Multipath, pp. 242-243, Figs. 18-21: one specular reflection 6 dB below the direct path
//!   (amplitude ratio 10^(-6/20)), NELP, the Fig. 17 spacings, ideal band limit. Printed worst-case
//!   bias (m): 24 MHz: BPSK(10) 5.4, BOC(10,5) 2.9, BPSK(1) 4.9, BOC(5,2) 5.6, BOC(8,4) 3.5;
//!   12 MHz: BPSK(1) 8.8, BOC(5,2) 6.0. Kshana: `nelp_worst_case_multipath_bias_s` on
//!   `modulation_acf(m, band, 2.5 Tc, 0.1 ns)`, delays 1 ns to 1.2 (Tc + spacing/2) in 1 ns steps,
//!   41 values of cos(phase) on [-1, 1], times c = 299 792 458 m/s.
//! - Hein et al. p. 64: "Compared to BOC(1,1), the MBOC(6,1,1/11) spectrum has 0.7 dB less
//!   self-interference, and 0.3 dB less interference to C/A code and SBAS receivers." The
//!   bandwidths are not printed; the Betz 2001 convention the article cites for its densities is
//!   fixed here (24 MHz receive, 30 MHz transmit normalisation). Kshana: 10 log10 of the ratios
//!   kappa(MBOC, MBOC)/kappa(BOC(1,1), BOC(1,1)) -> -0.7 and kappa(BPSK(1) signal, MBOC
//!   interferer)/kappa(BPSK(1) signal, BOC(1,1) interferer) -> -0.3.
//!
//! Each block is its own strict test so that one convention failing does not hide the others.

use kshana::navsignal::{
    acf_extrema, acf_first_zero_s, dll_jitter_bandlimited_s, equivalent_rectangular_bandwidth_hz,
    first_acf_side_lobe, fractional_power_bandwidth_hz, modulation_acf,
    nelp_worst_case_multipath_bias_s, power_in_band, psd_maximum, rms_bandwidth_hz,
    spectral_separation_coeff_band_limited, EarlyLate, Modulation,
};

const MHZ: f64 = 1e6;
const RX: f64 = 24.0 * MHZ;
const TX: f64 = 30.0 * MHZ;
const C: f64 = 299_792_458.0;

fn db(x: f64) -> f64 {
    10.0 * x.log10()
}

fn bpsk(n: f64) -> Modulation {
    Modulation::BpskR { n }
}

fn boc(m: f64, n: f64) -> Modulation {
    Modulation::BocSin { m, n }
}

/// The five columns of Betz Table 1.
fn table1_columns() -> [(&'static str, Modulation); 5] {
    [
        ("1.023 MHz PSK-R", bpsk(1.0)),
        ("10.23 MHz PSK-R", bpsk(10.0)),
        ("BOC(5,2)", boc(5.0, 2.0)),
        ("BOC(8,4)", boc(8.0, 4.0)),
        ("BOC(10,5)", boc(10.0, 5.0)),
    ]
}

struct Check {
    failures: Vec<String>,
}

impl Check {
    fn new() -> Self {
        Self {
            failures: Vec::new(),
        }
    }
    fn near(&mut self, what: &str, got: f64, printed: f64, tol: f64) {
        let ok = (got - printed).abs() <= tol;
        println!(
            "{what:<58} printed {printed:>9.3}  kshana {got:>11.5}  {}",
            if ok { "ok" } else { "FAIL" }
        );
        if !ok {
            self.failures.push(format!("{what}: {got} vs {printed}"));
        }
    }
    fn truth(&mut self, what: &str, ok: bool, detail: String) {
        println!("{what:<58} {detail}  {}", if ok { "ok" } else { "FAIL" });
        if !ok {
            self.failures.push(format!("{what}: {detail}"));
        }
    }
    fn finish(self) {
        assert!(
            self.failures.is_empty(),
            "outside tolerance: {:#?}",
            self.failures
        );
    }
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn betz_table_1_spectral_measures() {
    let peak = [0.0, 0.0, 4.9, 7.6, 9.5];
    let max_psd = [-60.1, -69.8, -66.2, -68.9, -69.9];
    let bw90 = [1.6, 12.1, 11.9, 18.9, 23.6];
    let oob = [0.0, 0.1, 0.1, 0.0, 0.4];
    let rms = [1.1, 3.5, 4.8, 7.5, 9.1];
    let erb = [1.0, 9.3, 4.0, 7.8, 9.0];
    let ssc_self = [-61.8, -71.5, -68.7, -71.4, -72.5];
    let ssc_ca = [-61.8, -69.9, -77.2, -85.2, -87.1];
    let ssc_m = [-87.1, -80.2, -84.2, -73.5, -72.5];
    let lobe_ns: [Option<f64>; 5] = [None, None, Some(101.0), Some(64.0), Some(54.0)];
    let lobe_r2: [Option<f64>; 5] = [None, None, Some(0.57), Some(0.54), Some(0.48)];
    let ca = bpsk(1.0);
    let mcode = boc(10.0, 5.0);
    let mut ck = Check::new();
    for (i, (name, m)) in table1_columns().iter().enumerate() {
        let p30 = power_in_band(m, TX);
        let (f_max, g_max) = psd_maximum(m, TX);
        ck.near(
            &format!("{name}: peak offset (MHz)"),
            f_max / MHZ,
            peak[i],
            0.05,
        );
        ck.near(
            &format!("{name}: max PSD (dBW/Hz)"),
            db(g_max / p30),
            max_psd[i],
            0.05,
        );
        ck.near(
            &format!("{name}: 90% power bandwidth (MHz)"),
            fractional_power_bandwidth_hz(m, 0.9, TX) / MHZ,
            bw90[i],
            0.05,
        );
        ck.near(
            &format!("{name}: out-of-band loss (dB)"),
            -db(power_in_band(m, RX) / p30),
            oob[i],
            0.05,
        );
        ck.near(
            &format!("{name}: RMS bandwidth (MHz)"),
            rms_bandwidth_hz(m, RX) / MHZ,
            rms[i],
            0.05,
        );
        ck.near(
            &format!("{name}: equivalent rectangular bandwidth (MHz)"),
            equivalent_rectangular_bandwidth_hz(m, RX) / MHZ,
            erb[i],
            0.05,
        );
        ck.near(
            &format!("{name}: SSC with itself (dB/Hz)"),
            db(spectral_separation_coeff_band_limited(m, m, RX, TX)),
            ssc_self[i],
            0.05,
        );
        ck.near(
            &format!("{name}: SSC with 1.023 MHz PSK-R (dB/Hz)"),
            db(spectral_separation_coeff_band_limited(&ca, m, RX, TX)),
            ssc_ca[i],
            0.05,
        );
        ck.near(
            &format!("{name}: SSC of BOC(10,5) (dB/Hz)"),
            db(spectral_separation_coeff_band_limited(m, &mcode, RX, TX)),
            ssc_m[i],
            0.05,
        );
        let tc = 1.0 / m.chip_rate_hz();
        let acf = modulation_acf(m, RX, 2.5 * tc, 0.05e-9);
        let lobe = first_acf_side_lobe(&acf, tc);
        match (lobe, lobe_ns[i], lobe_r2[i]) {
            (None, None, None) => ck.truth(
                &format!("{name}: first side lobe"),
                true,
                "None, as printed".into(),
            ),
            (Some((tau, r2)), Some(ns), Some(ratio)) => {
                ck.near(
                    &format!("{name}: first side lobe delay (ns)"),
                    tau * 1e9,
                    ns,
                    0.5,
                );
                ck.near(
                    &format!("{name}: squared side lobe / squared peak"),
                    r2,
                    ratio,
                    0.005,
                );
            }
            (got, _, _) => ck.truth(
                &format!("{name}: first side lobe"),
                false,
                format!("kshana {got:?}, printed {:?}", lobe_ns[i]),
            ),
        }
    }
    ck.finish();
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn betz_text_correlation_values_over_1_ghz() {
    let mut ck = Check::new();
    // (modulation, printed peak count, printed first-peak value, printed zero crossing ns)
    for (name, m, peaks, first, zero_ns) in [
        ("BOC(5,1)", boc(5.0, 1.0), 19usize, -0.9, 51.0),
        ("BOC(5,2)", boc(5.0, 2.0), 9usize, -0.8, 54.0),
    ] {
        let tc = 1.0 / m.chip_rate_hz();
        let acf = modulation_acf(&m, 1000.0 * MHZ, 1.05 * tc, 0.05e-9);
        let ext = acf_extrema(&acf, tc, 0.05);
        ck.truth(
            &format!("{name}: number of peaks"),
            2 * ext.len() + 1 == peaks,
            format!("kshana {} printed {peaks}", 2 * ext.len() + 1),
        );
        let (tau1, r1) = ext.first().copied().unwrap_or((f64::NAN, f64::NAN));
        ck.near(
            &format!("{name}: first peak delay (ns)"),
            tau1 * 1e9,
            97.8,
            0.05,
        );
        ck.near(&format!("{name}: first peak value"), r1, first, 0.05);
        let z = acf_first_zero_s(&acf).unwrap_or(f64::NAN);
        ck.near(
            &format!("{name}: nearest zero crossing (ns)"),
            z * 1e9,
            zero_ns,
            0.5,
        );
    }
    ck.finish();
}

/// NELP jitter (s) at C/N0 for the Fig. 17 settings.
fn fig17_sigma(m: &Modulation, spacing_s: f64, cn0: f64) -> f64 {
    dll_jitter_bandlimited_s(
        |f| m.psd(f),
        RX,
        m.chip_rate_hz(),
        cn0,
        0.1,
        0.020,
        spacing_s,
        EarlyLate::NonCoherent,
    )
}

/// The C/N0 offset Delta with sigma_boc(40 - Delta) = sigma_ref(40).
fn equivalent_cn0_offset_db(reference: (&Modulation, f64), boc_m: (&Modulation, f64)) -> f64 {
    let target = fig17_sigma(reference.0, reference.1, 40.0);
    let (mut lo, mut hi) = (0.0, 40.0);
    for _ in 0..80 {
        let mid = 0.5 * (lo + hi);
        // sigma decreases with C/N0: below target means C/N0 can go lower.
        if fig17_sigma(boc_m.0, boc_m.1, mid) < target {
            hi = mid;
        } else {
            lo = mid;
        }
    }
    40.0 - 0.5 * (lo + hi)
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn betz_figure_17_equal_accuracy_c_n0_offsets() {
    let mut ck = Check::new();
    let tc1 = 1.0 / (1.023 * MHZ);
    let tc10 = tc1 / 10.0;
    let (b1, b10) = (bpsk(1.0), bpsk(10.0));
    let (b52, b84, b105) = (boc(5.0, 2.0), boc(8.0, 4.0), boc(10.0, 5.0));
    ck.near(
        "BOC(5,2) 80 ns vs 1.023 MHz PSK-R 0.05 chip (dB)",
        equivalent_cn0_offset_db((&b1, 0.05 * tc1), (&b52, 80e-9)),
        11.0,
        0.5,
    );
    ck.near(
        "BOC(8,4) 50 ns vs 10.23 MHz PSK-R 0.5 chip (dB)",
        equivalent_cn0_offset_db((&b10, 0.5 * tc10), (&b84, 50e-9)),
        7.0,
        0.5,
    );
    ck.near(
        "BOC(10,5) 40 ns vs 10.23 MHz PSK-R 0.5 chip (dB)",
        equivalent_cn0_offset_db((&b10, 0.5 * tc10), (&b105, 40e-9)),
        7.0,
        0.5,
    );
    ck.finish();
}

fn worst_case_bias_m(m: &Modulation, band_hz: f64, spacing_s: f64) -> f64 {
    let tc = 1.0 / m.chip_rate_hz();
    let acf = modulation_acf(m, band_hz, 2.5 * tc, 0.1e-9);
    let d_max = 1.2 * (tc + spacing_s / 2.0);
    let delays: Vec<f64> = (1..)
        .map(|k| k as f64 * 1e-9)
        .take_while(|&d| d <= d_max)
        .collect();
    let gamma = 10f64.powf(-6.0 / 20.0);
    nelp_worst_case_multipath_bias_s(&acf, spacing_s, gamma, &delays, 41) * C
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn betz_worst_case_multipath_bias() {
    let mut ck = Check::new();
    let tc1 = 1.0 / (1.023 * MHZ);
    let tc10 = tc1 / 10.0;
    for (what, m, band, spacing, printed) in [
        (
            "24 MHz 10.23 MHz PSK-R 0.5 chip (m)",
            bpsk(10.0),
            RX,
            0.5 * tc10,
            5.4,
        ),
        ("24 MHz BOC(10,5) 40 ns (m)", boc(10.0, 5.0), RX, 40e-9, 2.9),
        (
            "24 MHz 1.023 MHz PSK-R 0.05 chip (m)",
            bpsk(1.0),
            RX,
            0.05 * tc1,
            4.9,
        ),
        ("24 MHz BOC(5,2) 80 ns (m)", boc(5.0, 2.0), RX, 80e-9, 5.6),
        ("24 MHz BOC(8,4) 50 ns (m)", boc(8.0, 4.0), RX, 50e-9, 3.5),
        (
            "12 MHz 1.023 MHz PSK-R 0.05 chip (m)",
            bpsk(1.0),
            12.0 * MHZ,
            0.05 * tc1,
            8.8,
        ),
        (
            "12 MHz BOC(5,2) 80 ns (m)",
            boc(5.0, 2.0),
            12.0 * MHZ,
            80e-9,
            6.0,
        ),
    ] {
        ck.near(what, worst_case_bias_m(&m, band, spacing), printed, 0.05);
    }
    ck.finish();
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn hein_mboc_interference_improvements() {
    let mut ck = Check::new();
    let mboc = Modulation::Mboc { p: 1.0 / 11.0 };
    let b11 = boc(1.0, 1.0);
    let ca = bpsk(1.0);
    let k = |s: &Modulation, i: &Modulation| spectral_separation_coeff_band_limited(s, i, RX, TX);
    ck.near(
        "MBOC vs BOC(1,1) self-interference (dB)",
        db(k(&mboc, &mboc) / k(&b11, &b11)),
        -0.7,
        0.05,
    );
    ck.near(
        "MBOC vs BOC(1,1) interference to C/A (dB)",
        db(k(&ca, &mboc) / k(&ca, &b11)),
        -0.3,
        0.05,
    );
    ck.finish();
}
