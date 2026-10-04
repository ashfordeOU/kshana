// SPDX-License-Identifier: AGPL-3.0-only
//! Spreading codes of `kshana::iq::signals` checked against their interface control
//! documents. Every reference value below is quoted from the ICD named in the test name
//! or comment; nothing is regenerated from the code under test.

use kshana::iq::signals::tables::{
    B1C_DATA, B1C_PILOT, B1C_PILOT_SECONDARY, E5A_ROWS, L2C_STATES, L5_PHASES,
};
use kshana::iq::signals::{
    beidou, galileo, glonass, gps, hex_to_bits, pack_bits, periodic_autocorrelation,
    square_subcarrier, ComplexSpreadingCode, Modulation, SignalCode,
};
use kshana::iq::SpreadingCode;
use sha2::{Digest, Sha256};

fn bits_of(code: &SignalCode) -> Vec<u8> {
    code.primary_bits()
}

// --- GPS L1 C/A -------------------------------------------------------------------------

#[test]
fn gps_l1ca_first_10_chips_match_is_gps_200n_table_3_ia() {
    // IS-GPS-200N Table 3-Ia, "First 10 Chips Octal" for C/A.
    let want = [
        (1, 0o1440),
        (2, 0o1620),
        (3, 0o1710),
        (4, 0o1744),
        (5, 0o1133),
        (6, 0o1455),
        (7, 0o1131),
        (8, 0o1454),
        (9, 0o1626),
    ];
    for (prn, octal) in want {
        let c = gps::l1ca(prn).unwrap();
        assert_eq!(pack_bits(&bits_of(&c)[..10]), octal, "PRN {prn}");
        assert_eq!(c.len_chips(), 1023);
        assert_eq!(c.chip_rate_hz(), 1.023e6);
        assert_eq!(c.carrier_hz(), 1_575.42e6);
    }
}

// --- GPS L5 -----------------------------------------------------------------------------

#[test]
fn gps_l5_xb_advance_reaches_printed_initial_state_is_gps_705j() {
    // IS-GPS-705J Tables 3-Ia, 3-Ib, 6-I print both the XB advance and the XB state it
    // reaches; the two columns must agree for every PRN 1..=210, I5 and Q5.
    for (i, row) in L5_PHASES.iter().enumerate() {
        assert_eq!(
            gps::l5_xb_state_after(u32::from(row.advance_i5)),
            row.xb_i5,
            "I5 PRN {}",
            i + 1
        );
        assert_eq!(
            gps::l5_xb_state_after(u32::from(row.advance_q5)),
            row.xb_q5,
            "Q5 PRN {}",
            i + 1
        );
    }
}

#[test]
fn gps_l5_first_13_chips_are_complement_of_xb_state_is_gps_705j() {
    // IS-GPS-705J Table 3-Ia note **: the printed state is the first 13 XB chips with the
    // rightmost bit out first; XA starts all ones, so the code's first 13 chips are the
    // complement of the printed state.
    for (i, row) in L5_PHASES.iter().enumerate() {
        let prn = (i + 1) as u16;
        for (code, word) in [
            (gps::l5_i5(prn).unwrap(), row.xb_i5),
            (gps::l5_q5(prn).unwrap(), row.xb_q5),
        ] {
            let bits = bits_of(&code);
            for (k, &chip) in bits.iter().take(13).enumerate() {
                assert_eq!(
                    chip,
                    1 - ((word >> k) & 1) as u8,
                    "{} chip {k}",
                    code.name()
                );
            }
        }
    }
}

#[test]
fn gps_l5_lengths_rates_and_neuman_hofman_tiers() {
    let i5 = gps::l5_i5(1).unwrap();
    let q5 = gps::l5_q5(1).unwrap();
    assert_eq!(i5.primary_len(), 10_230);
    assert_eq!(i5.len_chips(), 102_300); // 10 ms with NH10
    assert_eq!(q5.len_chips(), 204_600); // 20 ms with NH20
    assert_eq!(i5.carrier_hz(), 1_176.45e6);
    assert!((i5.period_s() - 0.010).abs() < 1e-15);
    assert!((q5.period_s() - 0.020).abs() < 1e-15);
    // IS-GPS-705J: NH10 = 0000110101, NH20 = 00000100110101001110.
    assert_eq!(pack_bits(&gps::NH10), 0b0000110101);
    assert_eq!(pack_bits(&gps::NH20), 0b00000100110101001110);
    // The overlay flips whole primary periods: period 4 of I5 carries NH10[4] = 1.
    let k = 3;
    assert_eq!(
        i5.value_at((4 * 10_230 + k) as f64 + 0.5),
        -i5.value_at(k as f64 + 0.5)
    );
    assert_eq!(i5.primary_only().len_chips(), 10_230);
}

// --- GPS L2C ----------------------------------------------------------------------------

#[test]
fn gps_l2_cm_reaches_printed_end_state_is_gps_200n_table_3_ii() {
    // IS-GPS-200N Tables 3-IIa/3-IIb: end state after the 10230-chip short cycle. The
    // register that emits chip 10230 is the one 10229 clocks after the initial state.
    for (i, row) in L2C_STATES.iter().enumerate() {
        let (bits, end) = gps::l2c_run(row.cm_initial, 10_229);
        assert_eq!(end, row.cm_end, "CM PRN {}", i + 1);
        assert_eq!(bits.len(), 10_229);
    }
}

#[test]
fn gps_l2_cl_reaches_printed_end_state_is_gps_200n_table_3_ii() {
    for (i, row) in L2C_STATES.iter().enumerate() {
        let (_, end) = gps::l2c_run(row.cl_initial, 767_249);
        assert_eq!(end, row.cl_end, "CL PRN {}", i + 1);
    }
}

#[test]
fn gps_l2c_time_multiplex_alternates_cm_then_cl() {
    let cm = gps::l2c_cm(5).unwrap();
    let cl = gps::l2c_cl(5).unwrap();
    let mux = gps::l2c(5).unwrap();
    assert_eq!(cm.len_chips(), 10_230);
    assert_eq!(cl.len_chips(), 767_250);
    assert_eq!(mux.len_chips(), 1_534_500);
    assert_eq!(mux.chip_rate_hz(), 1.023e6);
    assert!((cm.period_s() - 0.020).abs() < 1e-12);
    assert!((cl.period_s() - 1.5).abs() < 1e-12);
    assert!((mux.period_s() - 1.5).abs() < 1e-12);
    for k in [0usize, 1, 10_229, 10_230, 500_001, 767_249] {
        assert_eq!(mux.chip(2 * k as i64), cm.chip(k as i64), "CM slot {k}");
        assert_eq!(mux.chip(2 * k as i64 + 1), cl.chip(k as i64), "CL slot {k}");
    }
}

// --- Galileo E1 -------------------------------------------------------------------------

fn sha256_hex_crlf_normalised(text: &str) -> String {
    let mut h = Sha256::new();
    h.update(text.replace('\r', "").as_bytes());
    hex::encode(h.finalize())
}

#[test]
fn galileo_e1_tables_are_the_committed_icd_annex_c_files() {
    // data/galileo-os-sis-icd/PROVENANCE.md: SHA-256 of the Annex C attachments with
    // carriage returns removed (robust to a CRLF-converting checkout).
    assert_eq!(
        sha256_hex_crlf_normalised(galileo::E1B_TABLE_TEXT),
        "31573a17c451e319a69c30fe6dcdfd949ebda8e3e77c96665981ff5b866ed247"
    );
    assert_eq!(
        sha256_hex_crlf_normalised(galileo::E1C_TABLE_TEXT),
        "37a0f71b49af0c03b8530e2376bcf244b0ef0e76027026f23aebf9611ca4a4a6"
    );
    for t in [galileo::e1b_table(), galileo::e1c_table()] {
        assert_eq!(t.numbers(), (1..=50).collect::<Vec<u16>>());
    }
}

#[test]
fn galileo_e1_first_chips_match_icd_annex_c_hex() {
    // Galileo OS SIS ICD Annex C.7 / C.8: leading hex symbols of the printed codes.
    let b = [
        (1u16, 0xF5D7_1013u32),
        (2, 0x96B8_56A6),
        (25, 0xBF89_03A3),
        (50, 0x9705_1FC6),
    ];
    let c = [
        (1u16, 0xB393_40CAu32),
        (2, 0xA64F_94BB),
        (25, 0x92D8_7BF3),
        (50, 0xADDC_EDB5),
    ];
    for (prn, word) in b {
        let code = galileo::e1b(prn).unwrap();
        assert_eq!(pack_bits(&bits_of(&code)[..32]), word, "E1-B PRN {prn}");
        assert_eq!(code.primary_len(), 4092);
        assert_eq!(code.len_chips(), 4092);
    }
    for (prn, word) in c {
        let code = galileo::e1c(prn).unwrap();
        assert_eq!(pack_bits(&bits_of(&code)[..32]), word, "E1-C PRN {prn}");
        assert_eq!(code.len_chips(), 4092 * 25);
        assert!((code.period_s() - 0.100).abs() < 1e-12);
    }
}

#[test]
fn galileo_cboc_power_split_is_10_11_to_1_11_from_the_waveform() {
    // Galileo OS SIS ICD Eq. 11: α = √(10/11), β = √(1/11). Project the generated
    // waveform onto the BOC(1,1) and BOC(6,1) subcarriers; with 120 samples per chip
    // (a multiple of 12) the projections are exact.
    const SPC: usize = 120;
    for (code, sign_b) in [
        (galileo::e1b(11).unwrap(), 1.0),
        (galileo::e1c(11).unwrap(), -1.0),
    ] {
        let chips = 400;
        let (mut pa, mut pb, mut pow) = (0.0, 0.0, 0.0);
        for k in 0..chips {
            for s in 0..SPC {
                let frac = (s as f64 + 0.5) / SPC as f64;
                let v = code.value_at(k as f64 + frac);
                let c = code.chip(k as i64);
                pa += v * c * square_subcarrier(1, frac);
                pb += v * c * square_subcarrier(6, frac);
                pow += v * v;
            }
        }
        let n = (chips * SPC) as f64;
        let (a, b, p) = (pa / n, pb / n, pow / n);
        assert!(
            (a * a - 10.0 / 11.0).abs() < 1e-12,
            "{}: α² = {}",
            code.name(),
            a * a
        );
        assert!(
            (b * b - 1.0 / 11.0).abs() < 1e-12,
            "{}: β² = {}",
            code.name(),
            b * b
        );
        assert!(
            (b.signum() - sign_b).abs() < 1e-12,
            "{}: CBOC phase",
            code.name()
        );
        assert!((p - 1.0).abs() < 1e-12, "{}: unit power", code.name());
    }
}

#[test]
fn galileo_e1c_secondary_cs25_flips_primary_periods() {
    // ICD Table 20: CS25_1 = 380AD90 -> chip 2 (0-based) is 1.
    let code = galileo::e1c(3).unwrap();
    let cs = hex_to_bits(galileo::CS25, 25).unwrap();
    assert_eq!(cs[..5], [0, 0, 1, 1, 1]);
    let k = 17i64;
    assert_eq!(code.chip(2 * 4092 + k), -code.chip(k));
    assert_eq!(code.chip(4092 + k), code.chip(k));
}

// --- Galileo E5a ------------------------------------------------------------------------

fn annex(text: &str) -> Vec<String> {
    text.lines()
        .filter(|l| !l.trim().is_empty())
        .map(|l| l.trim().split_once(';').unwrap().1.to_string())
        .collect()
}

#[test]
fn galileo_e5a_lfsr_matches_icd_first_24_chips_tables_16_17() {
    for (i, row) in E5A_ROWS.iter().enumerate() {
        let prn = (i + 1) as u16;
        let ci = galileo::e5a_i(prn).unwrap();
        let cq = galileo::e5a_q(prn).unwrap();
        assert_eq!(pack_bits(&bits_of(&ci)[..24]), row.i_first24, "E5a-I {prn}");
        assert_eq!(pack_bits(&bits_of(&cq)[..24]), row.q_first24, "E5a-Q {prn}");
    }
}

#[test]
fn galileo_e5a_lfsr_matches_complete_icd_annex_c3_c4_codes() {
    // The complete hexadecimal codes of ICD Annex C.3 (E5a-I) and C.4 (E5a-Q), committed
    // as fixtures from the ICD's electronic attachments.
    let ai = annex(include_str!("fixtures/iq_signals/C3_E5aI.txt"));
    let aq = annex(include_str!("fixtures/iq_signals/C4_E5aQ.txt"));
    assert_eq!((ai.len(), aq.len()), (50, 50));
    for prn in 1..=50u16 {
        let want_i = hex_to_bits(&ai[prn as usize - 1], 10_230).unwrap();
        let want_q = hex_to_bits(&aq[prn as usize - 1], 10_230).unwrap();
        assert_eq!(
            bits_of(&galileo::e5a_i(prn).unwrap()),
            want_i,
            "E5a-I {prn}"
        );
        assert_eq!(
            bits_of(&galileo::e5a_q(prn).unwrap()),
            want_q,
            "E5a-Q {prn}"
        );
    }
}

#[test]
fn galileo_e5a_secondary_codes_and_periods() {
    let i = galileo::e5a_i(1).unwrap();
    let q = galileo::e5a_q(7).unwrap();
    assert_eq!(i.len_chips(), 10_230 * 20);
    assert_eq!(q.len_chips(), 10_230 * 100);
    assert!((i.period_s() - 0.020).abs() < 1e-12);
    assert!((q.period_s() - 0.100).abs() < 1e-12);
    // ICD Table 20: CS20_1 = 842E9, CS100_7 = 537785DE280927C6B58BA6776.
    let s: Vec<u8> = i.secondary().iter().map(|&c| u8::from(c < 0)).collect();
    assert_eq!(pack_bits(&s), 0x842E9);
    let s: Vec<u8> = q.secondary().iter().map(|&c| u8::from(c < 0)).collect();
    assert_eq!(pack_bits(&s[..28]), 0x537785D);
    assert_eq!(i.modulation(), Modulation::Bpsk);
}

// --- BeiDou B1C -------------------------------------------------------------------------

#[test]
fn beidou_b1c_weil_codes_match_first_and_last_24_chips_bds_sis_icd_b1c_tables_5_2_to_5_4() {
    for prn in 1..=63u16 {
        let i = prn as usize - 1;
        for (bits, row, what) in [
            (beidou::b1c_data_bits(prn).unwrap(), B1C_DATA[i], "data"),
            (beidou::b1c_pilot_bits(prn).unwrap(), B1C_PILOT[i], "pilot"),
            (
                beidou::b1c_pilot_secondary_bits(prn).unwrap(),
                B1C_PILOT_SECONDARY[i],
                "secondary",
            ),
        ] {
            assert_eq!(
                pack_bits(&bits[..24]),
                row.first24,
                "{what} PRN {prn} first 24"
            );
            assert_eq!(
                pack_bits(&bits[bits.len() - 24..]),
                row.last24,
                "{what} PRN {prn} last 24"
            );
        }
    }
    // The ICD's own worked example: data PRN 1 first 24 chips 101011111111011001001110.
    let b = beidou::b1c_data_bits(1).unwrap();
    assert_eq!(pack_bits(&b[..24]), 0b101011111111011001001110);
    assert_eq!(pack_bits(&b[..24]), 0o53773116);
}

#[test]
fn legendre_sequence_has_two_level_autocorrelation_closed_form() {
    // For prime N ≡ 3 (mod 4) the Legendre sequence (with L(0) = 0) mapped to ±1 has
    // periodic autocorrelation -1 at every non-zero shift. Both B1C Weil lengths qualify.
    for n in [beidou::B1C_SECONDARY_WEIL_LEN, beidou::B1C_WEIL_LEN] {
        assert_eq!(n % 4, 3);
        let l = kshana::iq::signals::bipolar(&beidou::legendre(n));
        let lags: Vec<usize> = if n < 5000 {
            (1..n).collect()
        } else {
            vec![1, 2, 77, 5121, n - 1]
        };
        for lag in lags {
            assert_eq!(periodic_autocorrelation(&l, lag), -1, "N {n} lag {lag}");
        }
    }
}

#[test]
fn beidou_b1c_qmboc_power_split_is_29_to_4_from_the_waveform() {
    // BDS-SIS-ICD-B1C-1.0 Eq. 4-10 and Table 4-2: pilot power 29/33 in BOC(1,1) (here the
    // real part) and 4/33 in BOC(6,1) (the imaginary part).
    const SPC: usize = 120;
    let p = beidou::b1c_pilot(3).unwrap();
    let (mut re2, mut im2) = (0.0, 0.0);
    let chips = 300;
    for k in 0..chips {
        for s in 0..SPC {
            let v = p.complex_at(k as f64 + (s as f64 + 0.5) / SPC as f64);
            re2 += v.re * v.re;
            im2 += v.im * v.im;
        }
    }
    let n = (chips * SPC) as f64;
    assert!((re2 / n - 29.0 / 33.0).abs() < 1e-12);
    assert!((im2 / n - 4.0 / 33.0).abs() < 1e-12);
    // value_at selects one unit-amplitude part.
    let x = 10.0 + 1.0 / 24.0; // inside the first BOC(6,1) half-period of chip 10
    let boc61 = p.clone().with_part(beidou::QmbocPart::Boc61);
    assert_eq!(p.value_at(x), p.code().chip(10));
    assert_eq!(boc61.value_at(x + 1.0 / 12.0), -p.code().chip(10));
}

#[test]
fn beidou_b1c_lengths_boc_and_secondary_tier() {
    let d = beidou::b1c_data(19).unwrap();
    let p = beidou::b1c_pilot(19).unwrap();
    assert_eq!(d.len_chips(), 10_230);
    assert!((d.period_s() - 0.010).abs() < 1e-12);
    assert_eq!(p.len_chips(), 10_230 * 1800);
    assert!((p.period_s() - 18.0).abs() < 1e-9);
    assert_eq!(p.primary_only().len_chips(), 10_230);
    assert_eq!(d.modulation(), Modulation::SineBoc { n: 1 });
    // BOC(1,1): the sign flips at mid-chip.
    assert_eq!(d.value_at(5.25), -d.value_at(5.75));
    // Tiering: primary period m carries secondary chip m.
    let sec = beidou::b1c_pilot_secondary_bits(19).unwrap();
    let m = sec.iter().position(|&b| b == 1).unwrap() as i64;
    assert_eq!(p.code().chip(m * 10_230 + 4), -p.code().chip(4));
}

// --- BeiDou B1I -------------------------------------------------------------------------

#[test]
fn beidou_b1i_gold_code_structure_bds_sis_icd_b1i_3_0() {
    for prn in 1..=63u16 {
        let full = beidou::b1i_bits(prn, 2047).unwrap();
        // §4.3: a balanced Gold code of period 2047 truncated by its last chip.
        let ones = full.iter().filter(|&&b| b == 1).count();
        assert!(ones == 1023 || ones == 1024, "PRN {prn}: {ones} ones");
        let code = beidou::b1i(prn).unwrap();
        assert_eq!(code.primary_len(), 2046);
        assert_eq!(bits_of(&code)[..], full[..2046]);
        assert_eq!(code.chip_rate_hz(), 2.046e6);
        assert_eq!(code.carrier_hz(), 1_561.098e6);
        let want_tier = if beidou::b1i_is_geo(prn) { 1 } else { 20 };
        assert_eq!(code.secondary().len(), want_tier, "PRN {prn}");
    }
    // The Gold period is 2047: the full sequence repeats exactly after 2047 chips.
    let two = beidou::b1i_bits(6, 4094).unwrap();
    assert_eq!(two[..2047], two[2047..]);
    // Distinct PRNs give distinct codes.
    assert_ne!(
        beidou::b1i_bits(1, 2046).unwrap(),
        beidou::b1i_bits(2, 2046).unwrap()
    );
}

// --- GLONASS L1OF -----------------------------------------------------------------------

#[test]
fn glonass_l1of_code_starts_with_icd_group_111111100() {
    // GLONASS ICD Edition 5.1 §3.3.2.1: "The first character of the PR ranging code is the
    // first character in the group 111111100".
    let bits = glonass::ranging_code_bits();
    assert_eq!(bits.len(), 511);
    assert_eq!(bits[..9], [1, 1, 1, 1, 1, 1, 1, 0, 0]);
    // m-sequence closed forms: 256 ones, and periodic autocorrelation 511 / -1.
    assert_eq!(bits.iter().filter(|&&b| b == 1).count(), 256);
    let c = kshana::iq::signals::bipolar(&bits);
    assert_eq!(periodic_autocorrelation(&c, 0), 511);
    for lag in 1..511 {
        assert_eq!(periodic_autocorrelation(&c, lag), -1, "lag {lag}");
    }
}

#[test]
fn glonass_l1of_fdma_carriers_match_icd_table_3_1() {
    // GLONASS ICD Edition 5.1 Table 3.1 (L1, MHz).
    for (k, mhz) in [
        (-7i8, 1598.0625),
        (-1, 1601.4375),
        (0, 1602.0),
        (1, 1602.5625),
        (6, 1605.375),
    ] {
        let s = glonass::l1of(k).unwrap();
        assert!((s.carrier_hz() - mhz * 1e6).abs() < 1e-3, "k {k}");
        assert_eq!(s.len_chips(), 511);
        assert!((s.period_s() - 0.001).abs() < 1e-15);
    }
    assert!(glonass::l1of(7).is_err());
    assert!(glonass::l1of(-8).is_err());
}

// --- Common -----------------------------------------------------------------------------

#[test]
fn value_at_wraps_and_handles_fractional_phase_for_every_signal() {
    let codes: Vec<SignalCode> = vec![
        gps::l1ca(3).unwrap(),
        gps::l5_q5(3).unwrap(),
        gps::l2c_cm(3).unwrap(),
        galileo::e1b(3).unwrap(),
        galileo::e5a_i(3).unwrap(),
        beidou::b1c_data(3).unwrap(),
        beidou::b1i(3).unwrap(),
        glonass::l1of(-3).unwrap(),
    ];
    for c in &codes {
        let len = c.len_chips() as f64;
        for x in [0.1, 7.3, 101.9, len - 0.2] {
            let v = c.value_at(x);
            assert_eq!(v, c.value_at(x + len), "{} at {x}", c.name());
            assert_eq!(v, c.value_at(x - 3.0 * len), "{} at {x}", c.name());
            let frac = x.fract();
            let want = c.chip(x.floor() as i64) * c.modulation().subcarrier(frac);
            assert_eq!(v, want, "{} at {x}", c.name());
        }
    }
}

#[test]
fn generation_is_deterministic() {
    assert_eq!(gps::l5_i5(30).unwrap(), gps::l5_i5(30).unwrap());
    assert_eq!(galileo::e1c(30).unwrap(), galileo::e1c(30).unwrap());
    assert_eq!(
        beidou::b1c_pilot(30).unwrap(),
        beidou::b1c_pilot(30).unwrap()
    );
    assert_eq!(gps::l2c_cl(30).unwrap(), gps::l2c_cl(30).unwrap());
}
