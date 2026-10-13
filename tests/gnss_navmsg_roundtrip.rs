// SPDX-License-Identifier: AGPL-3.0-only
//! GPS CNAV, Galileo I/NAV and Galileo F/NAV encoders (`kshana::gnss_navmsg`): internal
//! consistency. MODELLED.
//!
//! * Round trip: physical inputs -> bits -> fields recovers every field to half its LSB
//!   (exactly for integer fields), through the full channel coding (CRC, convolutional code,
//!   interleaver, sync) and back through a hard-decision Viterbi decoder, also with symbol
//!   errors injected.
//! * Layout: the start bit of each field equals the bit number of the interface
//!   specification (IS-GPS-200 Figures 30-1 to 30-3; Galileo OS SIS ICD word and page type
//!   tables). The numbers below were also read against the bit tables of an independent
//!   open-source receiver (GNSS-SDR `GPS_CNAV.h`, `Galileo_INAV.h`, `Galileo_FNAV.h`,
//!   `Galileo_E5a.h`; read, not built or run) and agree. That is a second transcription, not
//!   an oracle run.
//! * Known answers: CRC-24Q check value `0xCDE703` for ASCII `123456789` (the CRC RevEng
//!   catalogue entry with these parameters, CRC-24/LTE-A); the convolutional code's impulse
//!   response equals the generators `171` and `133` octal (the definition of the code); with
//!   `G2` inverted (Galileo) an all-zero input gives the alternating sequence `01`.
//! * No published bit-exact sample page is used: none was found in the public ICDs.
//!
//! PIN-SCOPE: field start bits and widths of CNAV types 10, 11, 30, I/NAV word types 1 to 5
//! and F/NAV page types 1 to 4; sync patterns; interleaver geometry.
//! PIN-EXCLUDES: any physical value; other message and word types.

use kshana::gnss_navmsg::fec::{bits_of, bits_of_bytes, conv_encode, crc24q, viterbi};
use kshana::gnss_navmsg::galileo::{GalEphemeris, GalIono, GalTimeConversion, Gst};
use kshana::gnss_navmsg::{gal_fnav, gal_inav, get, gps_cnav, layout_bits, start_bit, Decoded};
use kshana::gps_lnav::GPS_PI;

fn gal_eph() -> GalEphemeris {
    GalEphemeris {
        svid: 11,
        iodnav: 517,
        toe_s: 345_600.0,
        toc_s: 345_600.0,
        m0: -2.789_123,
        e: 3.1e-4,
        sqrt_a: 5_440.612_3,
        omega0: 1.234_567,
        i0: 0.977_6,
        omega: -0.654_3,
        idot: -3.2e-10,
        omega_dot: -5.6e-9,
        delta_n: 2.9e-9,
        cuc: -1.4e-6,
        cus: 7.8e-6,
        crc: 201.3,
        crs: -30.9,
        cic: 4.1e-8,
        cis: -2.2e-8,
        af0: -3.43e-4,
        af1: -8.8e-12,
        af2: 1.7e-18,
        sisa_e1e5b: 107,
        sisa_e1e5a: 107,
        bgd_e1e5a: 2.1e-9,
        bgd_e1e5b: 2.4e-9,
        hs_e1b_e5b_e5a: [0, 2, 1],
        dvs_e1b_e5b_e5a: [false, true, true],
    }
}

fn iono() -> GalIono {
    GalIono {
        ai0: 63.75,
        ai1: 0.2539,
        ai2: 0.0069,
        region: [true, false, false, true, false],
    }
}

fn tconv() -> GalTimeConversion {
    GalTimeConversion {
        a0: -9.3e-10,
        a1: -1.8e-15,
        dt_ls: 18,
        t0t: 345_600.0,
        wn0t: 0xC9,
        wn_lsf: 0x89,
        dn: 7,
        dt_lsf: 18,
        t0g: 345_600.0,
        a0g: 3.5e-9,
        a1g: -4.4e-15,
        wn0g: 0x09,
    }
}

fn cnav_eph() -> gps_cnav::CnavEphemeris {
    gps_cnav::CnavEphemeris {
        week: 2350,
        toe_s: 345_600.0,
        top_s: 334_800.0,
        ura_ed: -3,
        health: [false, false, true],
        a_m: 26_560_123.4,
        a_dot: 0.0123,
        delta_n0: 4.6e-9,
        delta_n0_dot: -1.1e-15,
        m0: 2.5,
        e: 0.011,
        omega: -1.9,
        omega0: -2.8,
        i0: 0.95,
        omega_dot: -8.0e-9,
        i0_dot: 3.1e-10,
        cis: 1.1e-7,
        cic: -6.0e-8,
        crs: -77.7,
        crc: 260.1,
        cus: 5.5e-6,
        cuc: -3.3e-6,
        integrity: true,
        l2c_phasing: false,
    }
}

fn close(name: &str, got: f64, want: f64, lsb: f64) {
    assert!(
        (got - want).abs() <= 0.5 * lsb * (1.0 + 1e-9),
        "{name}: {got:e} vs {want:e}, LSB {lsb:e}"
    );
}

fn check_fields(
    fields: &[Decoded],
    layout: &[kshana::gnss_navmsg::Field],
    want: impl Fn(&str) -> f64,
) {
    for f in layout {
        let d = get(fields, f.name).unwrap();
        close(f.name, d.value, want(f.name), f.lsb_si());
    }
}

#[test]
fn cnav_layout_start_bits_match_is_gps_200() {
    let t10 = [
        ("wn", 39),
        ("l1_health", 52),
        ("top", 55),
        ("ura_ed", 66),
        ("toe", 71),
        ("delta_a", 82),
        ("a_dot", 108),
        ("delta_n0", 133),
        ("delta_n0_dot", 150),
        ("m0", 173),
        ("e", 206),
        ("omega", 239),
        ("integrity", 272),
        ("l2c_phasing", 273),
        ("reserved", 274),
    ];
    for (n, b) in t10 {
        assert_eq!(start_bit(gps_cnav::TYPE10, n, 39), Some(b), "type 10 {n}");
    }
    let t11 = [
        ("toe", 39),
        ("omega0", 50),
        ("i0", 83),
        ("delta_omega_dot", 116),
        ("i0_dot", 133),
        ("cis", 148),
        ("cic", 164),
        ("crs", 180),
        ("crc", 204),
        ("cus", 228),
        ("cuc", 249),
        ("reserved", 270),
    ];
    for (n, b) in t11 {
        assert_eq!(start_bit(gps_cnav::TYPE11, n, 39), Some(b), "type 11 {n}");
    }
    let t30 = gps_cnav::type30_layout();
    let t30_bits = [
        ("top", 39),
        ("ura_ned0", 50),
        ("ura_ned1", 55),
        ("ura_ned2", 58),
        ("toc", 61),
        ("af0", 72),
        ("af1", 98),
        ("af2", 118),
        ("tgd", 128),
        ("isc_l1ca", 141),
        ("isc_l2c", 154),
        ("isc_l5i5", 167),
        ("isc_l5q5", 180),
        ("alpha0", 193),
        ("beta0", 225),
        ("beta3", 249),
        ("wnop", 257),
        ("reserved", 265),
    ];
    for (n, b) in t30_bits {
        assert_eq!(start_bit(&t30, n, 39), Some(b), "type 30 {n}");
    }
    assert_eq!(start_bit(gps_cnav::HEADER, "tow_count", 1), Some(21));
    assert_eq!(start_bit(gps_cnav::HEADER, "alert", 1), Some(38));
}

#[test]
fn galileo_layout_start_bits_match_the_icd() {
    let inav: &[(u32, &str, u32)] = &[
        (1, "toe", 17),
        (1, "m0", 31),
        (1, "e", 63),
        (1, "sqrt_a", 95),
        (2, "omega0", 17),
        (2, "i0", 49),
        (2, "omega", 81),
        (2, "idot", 113),
        (3, "omega_dot", 17),
        (3, "delta_n", 41),
        (3, "cuc", 57),
        (3, "cus", 73),
        (3, "crc", 89),
        (3, "crs", 105),
        (3, "sisa_e1e5b", 121),
        (4, "svid", 17),
        (4, "cic", 23),
        (4, "cis", 39),
        (4, "toc", 55),
        (4, "af0", 69),
        (4, "af1", 100),
        (4, "af2", 121),
        (4, "spare", 127),
        (5, "ai0", 7),
        (5, "ai1", 18),
        (5, "ai2", 29),
        (5, "region1", 43),
        (5, "bgd_e1e5a", 48),
        (5, "bgd_e1e5b", 58),
        (5, "e5b_hs", 68),
        (5, "e1b_hs", 70),
        (5, "e5b_dvs", 72),
        (5, "e1b_dvs", 73),
        (5, "wn", 74),
        (5, "tow", 86),
        (5, "spare", 106),
    ];
    for &(wt, n, b) in inav {
        assert_eq!(
            start_bit(gal_inav::layout(wt).unwrap(), n, 1),
            Some(b),
            "I/NAV word {wt} {n}"
        );
    }
    let fnav: &[(u32, &str, u32)] = &[
        (1, "svid", 7),
        (1, "iodnav", 13),
        (1, "toc", 23),
        (1, "af0", 37),
        (1, "af1", 68),
        (1, "af2", 89),
        (1, "sisa_e1e5a", 95),
        (1, "ai0", 103),
        (1, "ai1", 114),
        (1, "ai2", 125),
        (1, "region1", 139),
        (1, "bgd_e1e5a", 144),
        (1, "e5a_hs", 154),
        (1, "wn", 156),
        (1, "tow", 168),
        (1, "e5a_dvs", 188),
        (2, "m0", 17),
        (2, "omega_dot", 49),
        (2, "e", 73),
        (2, "sqrt_a", 105),
        (2, "omega0", 137),
        (2, "idot", 169),
        (2, "wn", 183),
        (2, "tow", 195),
        (3, "i0", 17),
        (3, "omega", 49),
        (3, "delta_n", 81),
        (3, "cuc", 97),
        (3, "cus", 113),
        (3, "crc", 129),
        (3, "crs", 145),
        (3, "toe", 161),
        (3, "wn", 175),
        (3, "tow", 187),
        (4, "cic", 17),
        (4, "cis", 33),
        (4, "a0", 49),
        (4, "a1", 81),
        (4, "dt_ls", 105),
        (4, "t0t", 113),
        (4, "wn0t", 121),
        (4, "wn_lsf", 129),
        (4, "dn", 137),
        (4, "dt_lsf", 140),
        (4, "t0g", 148),
        (4, "a0g", 156),
        (4, "a1g", 172),
        (4, "wn0g", 184),
        (4, "tow", 190),
    ];
    for &(pt, n, b) in fnav {
        assert_eq!(
            start_bit(gal_fnav::layout(pt).unwrap(), n, 1),
            Some(b),
            "F/NAV page {pt} {n}"
        );
    }
    assert_eq!(gal_inav::SYNC, "0101100000");
    assert_eq!(gal_fnav::SYNC, "101101110000");
    assert_eq!(
        (gal_inav::INTERLEAVER_COLS, gal_inav::INTERLEAVER_ROWS),
        (30, 8)
    );
    assert_eq!(
        (gal_fnav::INTERLEAVER_COLS, gal_fnav::INTERLEAVER_ROWS),
        (61, 8)
    );
}

#[test]
fn crc_and_convolutional_code_known_answers() {
    assert_eq!(crc24q(&bits_of_bytes(b"123456789")), 0xCD_E703);
    let mut s = 0u8;
    let imp = conv_encode(&bits_of("1000000"), &mut s, false);
    let g1: Vec<u8> = imp.iter().step_by(2).copied().collect();
    let g2: Vec<u8> = imp.iter().skip(1).step_by(2).copied().collect();
    assert_eq!(g1, bits_of("1111001"));
    assert_eq!(g2, bits_of("1011011"));
    let mut s = 0u8;
    let z = conv_encode(&[0; 8], &mut s, true);
    assert_eq!(z, bits_of("0101010101010101"));
}

#[test]
fn cnav_messages_round_trip_through_fec() {
    let e = cnav_eph();
    let h = gps_cnav::CnavHeader {
        prn: 27,
        tow_count: 57_601,
        alert: true,
    };
    let clk = gps_cnav::CnavClock {
        top_s: 334_800.0,
        ura_ned0: -5,
        ura_ned1: 3,
        ura_ned2: 6,
        toc_s: 345_600.0,
        af0: -1.23e-4,
        af1: 4.5e-12,
        af2: -1.0e-17,
    };
    let gd = gps_cnav::CnavGroupDelays {
        tgd: Some(-1.12e-8),
        isc_l1ca: Some(2.3e-10),
        isc_l2c: None,
        isc_l5i5: Some(-3.1e-9),
        isc_l5q5: Some(-3.3e-9),
    };
    let k = gps_cnav::Klobuchar {
        alpha: [1.21e-8, 1.49e-8, -5.96e-8, -1.19e-7],
        beta: [96_256.0, 98_304.0, -65_536.0, -458_752.0],
    };
    let m10 = gps_cnav::encode_type10(&h, &e).unwrap();
    let m11 = gps_cnav::encode_type11(&h, &e).unwrap();
    let m30 = gps_cnav::encode_type30(&h, &clk, &gd, &k, 37).unwrap();
    for m in [&m10, &m11, &m30] {
        assert_eq!(m.len(), 300);
        assert_eq!(&m[..8], &bits_of("10001011")[..]);
    }
    // Continuous FEC across the three messages, then Viterbi with symbol errors.
    let stream: Vec<u8> = [m10.clone(), m11.clone(), m30.clone()].concat();
    let mut state = 0u8;
    let mut sym = gps_cnav::fec_encode(&stream, &mut state);
    for k in (17..sym.len()).step_by(97) {
        sym[k] ^= 1;
    }
    let (dec, _) = viterbi(&sym, 0, None, false);
    assert_eq!(dec, stream);
    let d10 = gps_cnav::decode_message(&dec[..300]).unwrap();
    let d11 = gps_cnav::decode_message(&dec[300..600]).unwrap();
    let d30 = gps_cnav::decode_message(&dec[600..]).unwrap();
    assert_eq!((d10.header, d10.msg_type), (h, 10));
    assert_eq!(d30.msg_type, 30);
    check_fields(&d10.fields, gps_cnav::TYPE10, |n| {
        gps_cnav::type10_value(&e, n).unwrap()
    });
    check_fields(&d11.fields, gps_cnav::TYPE11, |n| {
        gps_cnav::type11_value(&e, n).unwrap()
    });
    let t30 = gps_cnav::type30_layout();
    for f in &t30 {
        let d = get(&d30.fields, f.name).unwrap();
        let want = gps_cnav::type30_value(&clk, &gd, &k, 37, f.name).unwrap();
        if want.is_nan() {
            assert_eq!(d.raw, gps_cnav::GROUP_DELAY_NA, "{}", f.name);
        } else {
            close(f.name, d.value, want, f.lsb_si());
        }
    }
    // The ephemeris restored from its reference values.
    let back = gps_cnav::ephemeris_from_messages(&d10, &d11).unwrap();
    close("A", back.a_m, e.a_m, 2f64.powi(-9));
    close(
        "Omega_dot",
        back.omega_dot,
        e.omega_dot,
        2f64.powi(-44) * GPS_PI,
    );
    assert_eq!((back.week, back.ura_ed, back.health), (2350, -3, e.health));
    // A flipped bit fails the CRC.
    let mut bad = m10.clone();
    bad[150] ^= 1;
    assert!(gps_cnav::decode_message(&bad).is_err());
}

#[test]
fn inav_words_round_trip_through_pages_and_symbols() {
    let (e, io) = (gal_eph(), iono());
    let gst = Gst {
        wn: 1326,
        tow: 345_611,
    };
    let x = gal_inav::OddPageExtras {
        reserved1: 0x12_3456_789A,
        sar: 0x2A_AAAA,
        spare: 1,
        reserved2: 0x5C,
    };
    let mut words = Vec::new();
    for wt in 1..=5u32 {
        let sym = gal_inav::encode_page_symbols(wt, &e, &io, &gst, &x).unwrap();
        assert_eq!(sym.len(), 500);
        assert_eq!(&sym[..10], &bits_of(gal_inav::SYNC)[..]);
        assert_eq!(&sym[250..260], &bits_of(gal_inav::SYNC)[..]);
        let mut rx = sym.clone();
        for k in [30usize, 101, 222, 290, 377, 460] {
            rx[k] ^= 1;
        }
        let (even, de) = gal_inav::decode_part_symbols(&rx[..250]).unwrap();
        let (odd, dodd) = gal_inav::decode_part_symbols(&rx[250..]).unwrap();
        assert_eq!(de + dodd, 6, "every injected error corrected");
        let (word, xx) = gal_inav::read_page(&even, &odd).unwrap();
        assert_eq!(xx, x);
        assert_eq!(word, gal_inav::encode_word(wt, &e, &io, &gst).unwrap());
        let (t, fields) = gal_inav::decode_word(&word).unwrap();
        assert_eq!(t, wt);
        check_fields(&fields, gal_inav::layout(wt).unwrap(), |n| {
            gal_inav::word_value(wt, &e, &io, &gst, n).unwrap()
        });
        // CRC detects a flipped covered bit.
        let mut bad = odd.clone();
        bad[40] ^= 1;
        assert!(gal_inav::read_page(&even, &bad).is_err());
        words.push((t, fields));
    }
    let (be, bi, bg) = gal_inav::ephemeris_from_words(&words).unwrap();
    assert_eq!(bg, gst);
    assert_eq!((be.svid, be.iodnav, be.sisa_e1e5b), (11, 517, 107));
    assert_eq!(be.hs_e1b_e5b_e5a[..2], [0, 2]);
    assert_eq!(bi.region, io.region);
    close("sqrt_a", be.sqrt_a, e.sqrt_a, 2f64.powi(-19));
    close("af0", be.af0, e.af0, 2f64.powi(-34));
}

#[test]
fn fnav_pages_round_trip_through_symbols() {
    let (e, io, tc) = (gal_eph(), iono(), tconv());
    let gst = Gst {
        wn: 1326,
        tow: 345_620,
    };
    let mut pages = Vec::new();
    for pt in 1..=4u32 {
        let data = gal_fnav::encode_data(pt, &e, &io, &gst, &tc).unwrap();
        assert_eq!(data.len(), 214);
        let page = gal_fnav::page(&data).unwrap();
        let sym = gal_fnav::encode_page_symbols(&page).unwrap();
        assert_eq!(sym.len(), 500);
        assert_eq!(&sym[..12], &bits_of(gal_fnav::SYNC)[..]);
        let mut rx = sym.clone();
        for k in (20..500).step_by(67) {
            rx[k] ^= 1;
        }
        let (back, _) = gal_fnav::decode_page_symbols(&rx).unwrap();
        assert_eq!(back, page);
        let d = gal_fnav::read_page(&back).unwrap();
        let (t, fields) = gal_fnav::decode_data(&d).unwrap();
        assert_eq!(t, pt);
        check_fields(&fields, gal_fnav::layout(pt).unwrap(), |n| {
            gal_fnav::page_value(pt, &e, &io, &gst, &tc, n).unwrap()
        });
        let mut bad = page.clone();
        bad[100] ^= 1;
        assert!(gal_fnav::read_page(&bad).is_err());
        pages.push((t, fields));
    }
    let (be, _) = gal_fnav::ephemeris_from_pages(&pages).unwrap();
    assert_eq!((be.svid, be.iodnav, be.sisa_e1e5a), (11, 517, 107));
    assert_eq!(be.hs_e1b_e5b_e5a[2], 1);
    close("i0", be.i0, e.i0, 2f64.powi(-31) * GPS_PI);
    close("toe", be.toe_s, e.toe_s, 60.0);
}

#[test]
fn out_of_range_values_are_refused_not_wrapped() {
    let mut e = gal_eph();
    e.sqrt_a = -1.0;
    assert!(gal_inav::encode_word(1, &e, &iono(), &Gst::default()).is_err());
    let mut c = cnav_eph();
    c.a_m = 1.0e8; // delta A far outside 26 bits at 2^-9 m
    assert!(gps_cnav::encode_type10(&gps_cnav::CnavHeader::default(), &c).is_err());
    assert_eq!(layout_bits(gps_cnav::TYPE10), 238);
}

/// Data-gated oracle harness: a JSON file of messages decoded by an external decoder (for
/// example RTKLIB 2.4.3's `decode_gal_inav` / `decode_gal_fnav` on pages this crate wrote),
/// at `KSHANA_NAVMSG_ORACLE_JSON`. Format: `{"messages": [{"kind": "inav_word" |
/// "fnav_data" | "cnav_message", "bits": "<0/1 string>", "fields": {"<kshana field name>":
/// <physical value in SI units, radians for angles>}}]}`. Each listed field must agree with
/// Kshana's decoding to half an LSB. Skips, saying so, when the variable is unset. No such
/// run has been made; the status stays MODELLED.
#[test]
fn external_decoder_oracle_when_provided() {
    let Ok(path) = std::env::var("KSHANA_NAVMSG_ORACLE_JSON") else {
        eprintln!("KSHANA_NAVMSG_ORACLE_JSON not set: external navigation-message oracle skipped");
        return;
    };
    let v: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&path).expect("oracle file")).expect("JSON");
    let msgs = v["messages"].as_array().expect("messages");
    assert!(!msgs.is_empty(), "oracle file lists no messages");
    for (i, m) in msgs.iter().enumerate() {
        let bits = bits_of(m["bits"].as_str().expect("bits"));
        let (fields, layout): (Vec<Decoded>, Vec<kshana::gnss_navmsg::Field>) =
            match m["kind"].as_str().expect("kind") {
                "inav_word" => {
                    let (t, f) = gal_inav::decode_word(&bits).unwrap();
                    (f, gal_inav::layout(t).unwrap().to_vec())
                }
                "fnav_data" => {
                    let (t, f) = gal_fnav::decode_data(&bits).unwrap();
                    (f, gal_fnav::layout(t).unwrap().to_vec())
                }
                "cnav_message" => {
                    let d = gps_cnav::decode_message(&bits).unwrap();
                    let l = match d.msg_type {
                        10 => gps_cnav::TYPE10.to_vec(),
                        11 => gps_cnav::TYPE11.to_vec(),
                        _ => gps_cnav::type30_layout(),
                    };
                    (d.fields, l)
                }
                k => panic!("message {i}: unknown kind {k}"),
            };
        for (name, want) in m["fields"].as_object().expect("fields") {
            let f = layout
                .iter()
                .find(|f| f.name == name)
                .unwrap_or_else(|| panic!("message {i}: no field {name}"));
            let got = get(&fields, name).unwrap().value;
            close(name, got, want.as_f64().expect("number"), f.lsb_si());
        }
    }
}
