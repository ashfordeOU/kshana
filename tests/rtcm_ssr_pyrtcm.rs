// SPDX-License-Identifier: AGPL-3.0-only
//! RTCM 3 SSR decoding against the values the open decoder pyrtcm 1.2.0 records for two public
//! sample streams (`tests/fixtures/rtcm_ssr/`, BSD 3-Clause; see `NOTICE`).
//!
//! Every SSR field that pyrtcm reports is compared: header fields exactly, and scaled values to
//! within half a least-significant bit. Message 1264: pyrtcm reads no layer from the sample
//! (it takes the 2-bit layer field as the count); only its header is compared, and Kshana's
//! reading of one layer must use every bit of the frame.
//!
//! IGS SSR (4076): a third public stream (an IGS real-time caster, mountpoint SSRA00CNE1, as
//! recorded in pyrtcm's tests) holds combined orbit and clock for four systems, code biases and
//! the global ionosphere. Every field pyrtcm reports for it is compared the same way. The stream
//! holds no orbit-only, clock-only, high-rate clock, phase-bias or URA message.

use kshana::rtcm_ssr::{read_stream, Kind, Message};
use serde_json::Value;

const EXPECTED: &str = include_str!("fixtures/rtcm_ssr/expected_ssr.json");

fn num(f: &serde_json::Map<String, Value>, k: &str) -> f64 {
    f.get(k)
        .and_then(Value::as_f64)
        .unwrap_or_else(|| panic!("missing {k}"))
}

fn close(got: f64, want: f64, lsb: f64, what: &str) {
    assert!(
        (got - want).abs() <= lsb / 2.0 + 1e-12,
        "{what}: got {got}, want {want}"
    );
}

fn check(m: &Message, f: &serde_json::Map<String, Value>) {
    let n = m.number;
    assert_eq!(num(f, "DF002") as u16, n);
    let epoch_key = ["DF385", "DF386", "DF458", "DF460", "DF462", "DF465"]
        .into_iter()
        .find(|k| f.contains_key(*k))
        .unwrap();
    assert_eq!(num(f, epoch_key) as u32, m.epoch_s, "{n} epoch");
    assert_eq!(num(f, "DF391") as u8, m.update_interval);
    assert_eq!(num(f, "DF388") == 1.0, m.multiple);
    assert_eq!(num(f, "DF413") as u8, m.iod_ssr);
    assert_eq!(num(f, "DF414") as u16, m.provider);
    assert_eq!(num(f, "DF415") as u8, m.solution);
    if m.kind == Kind::Vtec {
        close(
            m.vtec_quality_tecu.unwrap(),
            num(f, "DF478"),
            0.05,
            "1264 quality",
        );
        return;
    }
    if let Some(d) = m.regional_datum {
        assert_eq!(num(f, "DF375") == 1.0, d);
    }
    assert_eq!(num(f, "DF387") as usize, m.sats.len(), "{n} nsat");
    let id_key = ["DF068", "DF384", "DF252", "DF429", "DF463", "DF488"]
        .into_iter()
        .find(|k| f.contains_key(&format!("{k}_01")))
        .unwrap();
    for (i, s) in m.sats.iter().enumerate() {
        let x = format!("_{:02}", i + 1);
        assert_eq!(num(f, &format!("{id_key}{x}")) as u8, s.id, "{n} sat {i}");
        if let Some(o) = s.orbit {
            for (k, v, lsb) in [
                ("DF365", o.radial_m, 0.1),
                ("DF366", o.along_m, 0.4),
                ("DF367", o.cross_m, 0.4),
                ("DF368", o.dot_radial_m_s, 0.001),
                ("DF369", o.dot_along_m_s, 0.004),
                ("DF370", o.dot_cross_m_s, 0.004),
            ] {
                close(
                    v * 1e3,
                    num(f, &format!("{k}{x}")),
                    lsb,
                    &format!("{n} {k}{x}"),
                );
            }
        }
        if let Some(c) = s.clock {
            for (k, v, lsb) in [
                ("DF376", c.c0_m, 0.1),
                ("DF377", c.c1_m_s, 0.001),
                ("DF378", c.c2_m_s2, 0.00002),
            ] {
                close(
                    v * 1e3,
                    num(f, &format!("{k}{x}")),
                    lsb,
                    &format!("{n} {k}{x}"),
                );
            }
        }
        if m.kind == Kind::CodeBias {
            assert_eq!(num(f, &format!("DF379{x}")) as usize, s.code_biases.len());
            if s.code_biases.is_empty() {
                continue;
            }
            let sig_key = ["DF380", "DF381", "DF382", "DF461", "DF464", "DF467"]
                .into_iter()
                .find(|k| f.contains_key(&format!("{k}{x}_01")))
                .unwrap();
            for (j, (sig, bias)) in s.code_biases.iter().enumerate() {
                let y = format!("{x}_{:02}", j + 1);
                assert_eq!(num(f, &format!("{sig_key}{y}")) as u8, *sig);
                close(
                    *bias,
                    num(f, &format!("DF383{y}")),
                    0.01,
                    &format!("{n} bias{y}"),
                );
            }
        }
        if let Some(iod) = s.iod {
            let iod_key = ["DF071", "DF392", "DF459", "DF434", "DF469", "DF471"]
                .into_iter()
                .find(|k| f.contains_key(&format!("{k}{x}")));
            if let Some(k) = iod_key {
                assert_eq!(num(f, &format!("{k}{x}")) as u32, iod, "{n} iod{x}");
            }
        }
    }
}

#[test]
fn every_ssr_field_matches_the_open_decoder() {
    let expected: Value = serde_json::from_str(EXPECTED).unwrap();
    let mut compared = 0;
    for (file, bytes) in [
        (
            "pygpsdata-RTCM3.log",
            &include_bytes!("fixtures/rtcm_ssr/pygpsdata-RTCM3.log")[..],
        ),
        (
            "pygpsdata-1240-1264.log",
            &include_bytes!("fixtures/rtcm_ssr/pygpsdata-1240-1264.log")[..],
        ),
    ] {
        let s = read_stream(bytes);
        assert_eq!(s.truncated, 0, "{file}");
        let want = expected[file].as_array().unwrap();
        assert_eq!(s.messages.len(), want.len(), "{file} message count");
        for (m, w) in s.messages.iter().zip(want) {
            check(m, w["fields"].as_object().unwrap());
            compared += 1;
        }
    }
    // PIN-SCOPE:    the SSR messages in the two committed pyrtcm sample streams (2 + 13).
    // PIN-EXCLUDES: anything computed here; the count comes from pyrtcm's recorded results.
    assert_eq!(compared, 15);
}

#[test]
fn message_1264_reads_one_full_layer_using_every_bit() {
    let s = read_stream(include_bytes!("fixtures/rtcm_ssr/pygpsdata-1240-1264.log"));
    let m = s.messages.iter().find(|m| m.number == 1264).unwrap();
    assert_eq!(m.vtec_layers.len(), 1);
    let l = &m.vtec_layers[0];
    assert_eq!((l.degree, l.order), (12, 12));
    // 72 header bits + 16 layer bits + 16 per coefficient = the 2 792-bit payload.
    assert_eq!(72 + 16 + 16 * (l.c_tecu.len() + l.s_tecu.len()), 349 * 8);
}

fn check_igs(m: &Message, f: &serde_json::Map<String, Value>) {
    let n = m.igs_message.unwrap();
    assert_eq!(m.number, 4076);
    assert_eq!(num(f, "IDF001") as u8, m.igs_version.unwrap());
    assert_eq!(num(f, "IDF002") as u8, n);
    assert_eq!(num(f, "IDF003") as u32, m.epoch_s, "{n} epoch");
    assert_eq!(num(f, "IDF004") as u8, m.update_interval);
    assert_eq!(num(f, "IDF005") == 1.0, m.multiple);
    assert_eq!(num(f, "IDF007") as u8, m.iod_ssr);
    assert_eq!(num(f, "IDF008") as u16, m.provider);
    assert_eq!(num(f, "IDF009") as u8, m.solution);
    if m.kind == Kind::Vtec {
        close(
            m.vtec_quality_tecu.unwrap(),
            num(f, "IDF041"),
            0.05,
            "201 quality",
        );
        // pyrtcm sends the layer count minus one, as Kshana reads it.
        assert_eq!(num(f, "IDF035") as usize + 1, m.vtec_layers.len());
        for (i, l) in m.vtec_layers.iter().enumerate() {
            let x = format!("_{:02}", i + 1);
            // pyrtcm scales the height to km.
            close(
                l.height_m / 1e3,
                num(f, &format!("IDF036{x}")),
                10.0,
                "height",
            );
            assert_eq!(num(f, &format!("IDF037{x}")) as u8 + 1, l.degree);
            assert_eq!(num(f, &format!("IDF038{x}")) as u8 + 1, l.order);
            for (k, cs) in [("IDF039", &l.c_tecu), ("IDF040", &l.s_tecu)] {
                for (j, v) in cs.iter().enumerate() {
                    let key = format!("{k}{x}_{:02}", j + 1);
                    close(*v, num(f, &key), 0.005, &key);
                }
                // No coefficient beyond the ones read.
                assert!(!f.contains_key(&format!("{k}{x}_{:02}", cs.len() + 1)));
            }
        }
        return;
    }
    if let Some(d) = m.regional_datum {
        assert_eq!(num(f, "IDF006") == 1.0, d);
    }
    assert_eq!(num(f, "IDF010") as usize, m.sats.len(), "{n} nsat");
    for (i, s) in m.sats.iter().enumerate() {
        let x = format!("_{:02}", i + 1);
        assert_eq!(num(f, &format!("IDF011{x}")) as u8, s.id, "{n} sat {i}");
        if let Some(iod) = s.iod {
            assert_eq!(num(f, &format!("IDF012{x}")) as u32, iod, "{n} iod{x}");
        }
        if let Some(o) = s.orbit {
            for (k, v, lsb) in [
                ("IDF013", o.radial_m, 0.1),
                ("IDF014", o.along_m, 0.4),
                ("IDF015", o.cross_m, 0.4),
                ("IDF016", o.dot_radial_m_s, 0.001),
                ("IDF017", o.dot_along_m_s, 0.004),
                ("IDF018", o.dot_cross_m_s, 0.004),
            ] {
                close(
                    v * 1e3,
                    num(f, &format!("{k}{x}")),
                    lsb,
                    &format!("{n} {k}{x}"),
                );
            }
        }
        if let Some(c) = s.clock {
            for (k, v, lsb) in [
                ("IDF019", c.c0_m, 0.1),
                ("IDF020", c.c1_m_s, 0.001),
                ("IDF021", c.c2_m_s2, 0.00002),
            ] {
                close(
                    v * 1e3,
                    num(f, &format!("{k}{x}")),
                    lsb,
                    &format!("{n} {k}{x}"),
                );
            }
        }
        if m.kind == Kind::CodeBias {
            assert_eq!(num(f, &format!("IDF023{x}")) as usize, s.code_biases.len());
            for (j, (sig, bias)) in s.code_biases.iter().enumerate() {
                let y = format!("{x}_{:02}", j + 1);
                assert_eq!(num(f, &format!("IDF024{y}")) as u8, *sig);
                close(
                    *bias,
                    num(f, &format!("IDF025{y}")),
                    0.01,
                    &format!("{n} bias{y}"),
                );
            }
        }
    }
}

#[test]
fn every_igs_ssr_field_matches_the_open_decoder() {
    let expected: Value = serde_json::from_str(EXPECTED).unwrap();
    let s = read_stream(include_bytes!("fixtures/rtcm_ssr/pygpsdata-NTRIP-4076.log"));
    assert_eq!((s.truncated, s.bad_crc), (0, 0));
    let want = expected["pygpsdata-NTRIP-4076.log"].as_array().unwrap();
    assert_eq!(s.messages.len(), want.len(), "message count");
    let mut kinds = Vec::new();
    for (m, w) in s.messages.iter().zip(want) {
        assert_eq!(m.igs_message, w["igs_message"].as_u64().map(|v| v as u8));
        check_igs(m, w["fields"].as_object().unwrap());
        kinds.push(m.kind);
    }
    // PIN-SCOPE:    the 4076 messages pyrtcm records for its IGS sample stream.
    // PIN-EXCLUDES: anything computed here; the count comes from pyrtcm's recorded results.
    assert_eq!(s.messages.len(), 11);
    for k in [Kind::Combined, Kind::CodeBias, Kind::Vtec] {
        assert!(kinds.contains(&k), "{k:?} compared");
    }
}

#[test]
fn igs_ionosphere_message_uses_every_bit() {
    let bytes = include_bytes!("fixtures/rtcm_ssr/pygpsdata-NTRIP-4076.log");
    let s = read_stream(bytes);
    let m = s
        .messages
        .iter()
        .find(|m| m.igs_message == Some(201))
        .unwrap();
    let l = &m.vtec_layers[0];
    assert_eq!((m.vtec_layers.len(), l.degree, l.order), (1, 12, 12));
    // 12 + 3 + 8 + 20 + 4 + 1 + 4 + 16 + 4 = 72 header bits, 9 + 2 for quality and layer
    // count, 16 for the layer header, 16 per coefficient.
    let used = 72 + 11 + 16 + 16 * (l.c_tecu.len() + l.s_tecu.len());
    // The payload length of the 201 frame, read from its RTCM header.
    let payload_bits = (0..bytes.len() - 5)
        .find(|&i| {
            bytes[i] == 0xD3
                && bytes[i + 3] == 0xFE
                && bytes[i + 4] >> 4 == 0xC
                && ((u16::from(bytes[i + 4]) << 8 | u16::from(bytes[i + 5])) >> 1) & 0xFF == 201
        })
        .map(|i| ((usize::from(bytes[i + 1] & 3) << 8) | usize::from(bytes[i + 2])) * 8)
        .unwrap();
    // Every bit is read; what is left is the padding to the next byte.
    assert!(
        used <= payload_bits && payload_bits - used < 8,
        "{used} of {payload_bits}"
    );
}
