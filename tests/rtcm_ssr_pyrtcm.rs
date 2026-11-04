// SPDX-License-Identifier: AGPL-3.0-only
//! RTCM 3 SSR decoding against the values the open decoder pyrtcm 1.2.0 records for two public
//! sample streams (`tests/fixtures/rtcm_ssr/`, BSD 3-Clause; see `NOTICE`).
//!
//! Every SSR field that pyrtcm reports is compared: header fields exactly, and scaled values to
//! within half a least-significant bit. Message 1264: pyrtcm reads no layer from the sample
//! (it takes the 2-bit layer field as the count); only its header is compared, and Kshana's
//! reading of one layer must use every bit of the frame.

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
