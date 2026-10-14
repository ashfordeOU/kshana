// SPDX-License-Identifier: AGPL-3.0-only
//! The Space Packet secondary header (CUC/CDS time codes), packet error control and
//! segmentation against ccsdspy 2.0.1, CPython `binascii.crc_hqx`, spacepackets-py 0.32.0 and
//! spacepackets-rs 0.18.0, as pre-registered in `xval/space-packet-ext/PREREGISTRATION.md`
//! (003ef3eb, committed before any comparison was run).
//!
//! Kshana writes the time-code octets and packet streams under
//! `tests/fixtures/space_packet_ext/kshana/` (regenerate with `KSHANA_XVAL_WRITE=1`; otherwise
//! this test asserts the committed files are byte-identical to what Kshana writes now). The
//! oracle drivers `xval/space-packet-ext/oracle.py` and `xval/space-packet-ext/oracle-rs`
//! read them and write `outputs/`; the bars below judge those outputs with zero tolerance.

use kshana::space_packet::*;
use serde_json::Value;
use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/space_packet_ext")
}

fn hex(b: &[u8]) -> String {
    b.iter().map(|x| format!("{x:02x}")).collect()
}

fn unhex(s: &str) -> Vec<u8> {
    (0..s.len())
        .step_by(2)
        .map(|i| u8::from_str_radix(&s[i..i + 2], 16).unwrap())
        .collect()
}

fn csv(p: &Path) -> Vec<Vec<String>> {
    std::fs::read_to_string(p)
        .unwrap_or_else(|e| panic!("{}: {e}", p.display()))
        .lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

fn n(s: &str) -> u32 {
    s.parse().unwrap_or_else(|e| panic!("{s}: {e}"))
}

/// One pre-registered time-code case.
struct Case {
    id: u32,
    code: TimeCode,
    ccsds_epoch: bool,
}

fn cases() -> Vec<Case> {
    csv(&dir().join("inputs/time_codes.csv"))
        .iter()
        .map(|r| {
            let ccsds_epoch = r[2] == "1958";
            let code = if r[1] == "cuc" {
                let epoch = if ccsds_epoch {
                    CucEpoch::Ccsds1958
                } else {
                    CucEpoch::Agency
                };
                TimeCode {
                    format: TimeCodeFormat::Cuc(
                        CucFormat::new(epoch, n(&r[3]) as u8, n(&r[4]) as u8).unwrap(),
                    ),
                    value: TimeValue::Cuc(CucTime {
                        coarse: n(&r[5]),
                        fine: n(&r[6]),
                    }),
                }
            } else {
                TimeCode {
                    format: TimeCodeFormat::Cds(CdsFormat {
                        epoch: if ccsds_epoch {
                            CdsEpoch::Ccsds1958
                        } else {
                            CdsEpoch::Agency
                        },
                        days: if r[3] == "24" {
                            CdsDaySegment::Bits24
                        } else {
                            CdsDaySegment::Bits16
                        },
                        submillis: match r[4].as_str() {
                            "us" => CdsSubmillis::Microseconds,
                            "ps" => CdsSubmillis::Picoseconds,
                            _ => CdsSubmillis::None,
                        },
                    }),
                    value: TimeValue::Cds(CdsTime {
                        days: n(&r[5]),
                        ms_of_day: n(&r[6]),
                        submillis: n(&r[7]),
                    }),
                }
            };
            Case {
                id: n(&r[0]),
                code,
                ccsds_epoch,
            }
        })
        .collect()
}

fn cuc(epoch: CucEpoch, c: u8, f: u8) -> TimeCodeFormat {
    TimeCodeFormat::Cuc(CucFormat::new(epoch, c, f).unwrap())
}

fn pattern(seed: usize, len: usize) -> Vec<u8> {
    (0..len).map(|j| ((seed + 7 * j) & 0xFF) as u8).collect()
}

/// The 1000-octet user data unit of the segmented streams.
fn unit() -> Vec<u8> {
    (0..1000).map(|j| ((j * 31 + 7) & 0xFF) as u8).collect()
}

/// A packet stream as pre-registered: its name, format and packets.
struct Stream {
    name: &'static str,
    format: PacketFormat,
    packets: Vec<Vec<u8>>,
}

fn fmt_100() -> PacketFormat {
    PacketFormat {
        secondary_header: Some(SecondaryHeaderFormat {
            time_code: Some(TimeCodeLayout::ExplicitPField),
            ancillary_octets: 4,
        }),
        pec: true,
    }
}

fn cds_101() -> TimeCodeFormat {
    TimeCodeFormat::Cds(CdsFormat {
        epoch: CdsEpoch::Ccsds1958,
        days: CdsDaySegment::Bits16,
        submillis: CdsSubmillis::Microseconds,
    })
}

fn fmt_101() -> PacketFormat {
    PacketFormat {
        secondary_header: Some(SecondaryHeaderFormat {
            time_code: Some(TimeCodeLayout::ImplicitPField(cds_101())),
            ancillary_octets: 0,
        }),
        pec: true,
    }
}

fn fmt_102() -> PacketFormat {
    PacketFormat {
        secondary_header: Some(SecondaryHeaderFormat {
            time_code: None,
            ancillary_octets: 3,
        }),
        pec: false,
    }
}

fn fmt_seg() -> PacketFormat {
    PacketFormat {
        secondary_header: Some(SecondaryHeaderFormat {
            time_code: Some(TimeCodeLayout::ImplicitPField(cuc(
                CucEpoch::Ccsds1958,
                4,
                0,
            ))),
            ancillary_octets: 0,
        }),
        pec: true,
    }
}

fn segmented(apid: u16, first: u16) -> Vec<Vec<u8>> {
    let sh = SecondaryHeader {
        time_code: Some(TimeCode {
            format: cuc(CucEpoch::Ccsds1958, 4, 0),
            value: TimeValue::Cuc(CucTime {
                coarse: 1_234_567,
                fine: 0,
            }),
        }),
        ancillary: vec![],
    };
    Segmenter {
        format: fmt_seg(),
        is_telecommand: false,
        apid,
        max_user_octets: 128,
    }
    .segment(first, Some(&sh), &unit())
    .unwrap()
}

fn streams() -> Vec<Stream> {
    let mut out = Vec::new();
    let p100 = (0..8u16)
        .map(|i| {
            let sh = SecondaryHeader {
                time_code: Some(TimeCode {
                    format: cuc(CucEpoch::Ccsds1958, 4, 2),
                    value: TimeValue::Cuc(CucTime {
                        coarse: 2_000_000_000 + i as u32,
                        fine: 4096 * i as u32,
                    }),
                }),
                ancillary: pattern(0xA0 + i as usize, 4),
            };
            let user = pattern(0x100 + i as usize, 16);
            encode_packet_with(
                &fmt_100(),
                false,
                0x100,
                SequenceFlags::Unsegmented,
                i,
                Some(&sh),
                &user,
            )
            .unwrap()
        })
        .collect();
    out.push(Stream {
        name: "apid100",
        format: fmt_100(),
        packets: p100,
    });
    let p101 = (0..6u16)
        .map(|i| {
            let sh = SecondaryHeader {
                time_code: Some(TimeCode {
                    format: cds_101(),
                    value: TimeValue::Cds(CdsTime {
                        days: 23_000 + i as u32,
                        ms_of_day: 1000 * i as u32,
                        submillis: i as u32,
                    }),
                }),
                ancillary: vec![],
            };
            encode_packet_with(
                &fmt_101(),
                true,
                0x101,
                SequenceFlags::Unsegmented,
                100 + i,
                Some(&sh),
                &pattern(0x101 + i as usize, 10),
            )
            .unwrap()
        })
        .collect();
    out.push(Stream {
        name: "apid101",
        format: fmt_101(),
        packets: p101,
    });
    let p102 = (0..4u16)
        .map(|i| {
            let sh = SecondaryHeader {
                time_code: None,
                ancillary: pattern(0xB0 + i as usize, 3),
            };
            encode_packet_with(
                &fmt_102(),
                false,
                0x102,
                SequenceFlags::Unsegmented,
                i,
                Some(&sh),
                &pattern(0x102 + i as usize, 5),
            )
            .unwrap()
        })
        .collect();
    out.push(Stream {
        name: "apid102",
        format: fmt_102(),
        packets: p102,
    });
    out.push(Stream {
        name: "apid103",
        format: fmt_seg(),
        packets: segmented(0x103, 16380),
    });
    let p104 = segmented(0x104, 0);
    let mut a = p104.clone();
    a.remove(2);
    let mut b = p104.clone();
    b.swap(3, 4);
    let mut c = p104.clone();
    let last = c[1].len() - 1;
    c[1][last] ^= 0x01;
    out.push(Stream {
        name: "apid104",
        format: fmt_seg(),
        packets: p104,
    });
    out.push(Stream {
        name: "apid104_a",
        format: fmt_seg(),
        packets: a,
    });
    out.push(Stream {
        name: "apid104_b",
        format: fmt_seg(),
        packets: b,
    });
    out.push(Stream {
        name: "apid104_c",
        format: fmt_seg(),
        packets: c,
    });
    out
}

/// The PUS-C TM cases of bar 5: (service, subservice, days, ms, source octets).
const PUS: [(u8, u8, u32, u32, usize); 4] = [
    (17, 2, 0, 0, 0),
    (3, 25, 23_000, 43_200_123, 4),
    (1, 1, 65_535, 86_399_999, 9),
    (5, 1, 21_500, 1, 32),
];

fn pus_source(i: usize, len: usize) -> Vec<u8> {
    (0..len).map(|j| ((0x10 * i + j) & 0xFF) as u8).collect()
}

fn pus_format() -> PacketFormat {
    PacketFormat {
        secondary_header: Some(SecondaryHeaderFormat {
            time_code: None,
            ancillary_octets: 14,
        }),
        pec: true,
    }
}

/// Kshana's encoding of PUS case `i`: the 14 PUS-C TM secondary-header octets (version 2,
/// time reference status 0, service, subservice, message counter, destination id 0 and the
/// CDS-short stamp with its explicit P-field) as opaque ancillary data, then the source data.
fn pus_kshana(i: usize) -> Vec<u8> {
    let (svc, sub, days, ms, len) = PUS[i];
    let stamp = TimeCode {
        format: TimeCodeFormat::Cds(CdsFormat {
            epoch: CdsEpoch::Ccsds1958,
            days: CdsDaySegment::Bits16,
            submillis: CdsSubmillis::None,
        }),
        value: TimeValue::Cds(CdsTime {
            days,
            ms_of_day: ms,
            submillis: 0,
        }),
    }
    .encode(true)
    .unwrap();
    let mut anc = vec![0x20, svc, sub];
    anc.extend_from_slice(&(i as u16).to_be_bytes());
    anc.extend_from_slice(&0u16.to_be_bytes());
    anc.extend_from_slice(&stamp);
    let sh = SecondaryHeader {
        time_code: None,
        ancillary: anc,
    };
    encode_packet_with(
        &pus_format(),
        false,
        0x0EF,
        SequenceFlags::Unsegmented,
        i as u16,
        Some(&sh),
        &pus_source(i, len),
    )
    .unwrap()
}

/// Everything Kshana writes for the oracles, as (relative path, bytes).
fn kshana_files() -> Vec<(String, Vec<u8>)> {
    let mut files = Vec::new();
    let mut t = String::from("id,explicit_hex,implicit_hex\n");
    for c in cases() {
        t.push_str(&format!(
            "{},{},{}\n",
            c.id,
            hex(&c.code.encode(true).unwrap()),
            hex(&c.code.encode(false).unwrap())
        ));
    }
    files.push(("kshana/time_codes.csv".to_string(), t.into_bytes()));
    let mut k = String::from("id,crc\n");
    for r in csv(&dir().join("inputs/crc_messages.csv")) {
        let m = unhex(r.get(1).map(String::as_str).unwrap_or(""));
        k.push_str(&format!("{},{}\n", r[0], crc16_ccitt_false(&m)));
    }
    files.push(("kshana/crc.csv".to_string(), k.into_bytes()));
    for s in streams() {
        files.push((format!("kshana/{}.bin", s.name), s.packets.concat()));
    }
    let pus: Vec<Vec<u8>> = (0..PUS.len()).map(pus_kshana).collect();
    files.push(("kshana/pus_tm.bin".to_string(), pus.concat()));
    files
}

#[test]
fn kshana_side_files_are_reproducible() {
    let write = std::env::var("KSHANA_XVAL_WRITE").is_ok();
    for (rel, bytes) in kshana_files() {
        let p = dir().join(&rel);
        if write {
            std::fs::write(&p, &bytes).unwrap();
        } else {
            let committed = std::fs::read(&p).unwrap_or_else(|e| panic!("{rel}: {e}"));
            assert!(
                committed == bytes,
                "{rel} differs from what Kshana writes now"
            );
        }
    }
}

fn json(name: &str) -> Value {
    let p = dir().join("outputs").join(name);
    // The oracle outputs are committed: a missing file is a failure, never a skip.
    let s = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    serde_json::from_str(&s).unwrap()
}

fn u(v: &Value) -> u64 {
    v.as_u64()
        .unwrap_or_else(|| panic!("not an unsigned integer: {v}"))
}

#[test]
fn bar1_crc_matches_crc_hqx_and_spacepackets_rs() {
    assert_eq!(crc16_ccitt_false(b"123456789"), 0x29B1);
    let py = json("python.json");
    let rs: BTreeMap<String, u64> = csv(&dir().join("outputs/spacepackets_rs_crc.csv"))
        .into_iter()
        .map(|r| (r[0].clone(), r[1].parse().unwrap()))
        .collect();
    let msgs = csv(&dir().join("inputs/crc_messages.csv"));
    assert_eq!(msgs.len(), 8);
    for r in &msgs {
        let m = unhex(r.get(1).map(String::as_str).unwrap_or(""));
        let k = crc16_ccitt_false(&m) as u64;
        assert_eq!(k, u(&py["crc"][&r[0]]), "crc_hqx, message {}", r[0]);
        assert_eq!(k, rs[&r[0]], "spacepackets-rs, message {}", r[0]);
    }
    let mut checked = 0;
    for s in streams() {
        if !s.format.pec {
            continue;
        }
        let pec = py["pec"][s.name].as_array().unwrap();
        assert_eq!(pec.len(), s.packets.len(), "{}", s.name);
        for (i, (p, o)) in s.packets.iter().zip(pec).enumerate() {
            let stored = u(&o["stored"]);
            let hqx = u(&o["crc_hqx"]);
            let corrupt = s.name == "apid104_c" && i == 1;
            assert_eq!(stored != hqx, corrupt, "{} packet {i}", s.name);
            assert_eq!(pec_ok(p), !corrupt, "{} packet {i}", s.name);
            assert_eq!(
                stored,
                u16::from_be_bytes([p[p.len() - 2], p[p.len() - 1]]) as u64
            );
            checked += 1;
        }
    }
    let pus = py["pus_pec"].as_array().unwrap();
    for o in pus {
        assert_eq!(u(&o["stored"]), u(&o["crc_hqx"]));
    }
    assert!(checked >= 8 + 6 + 8 * 5 - 1);
}

#[test]
fn bar2_time_codes_match_spacepackets() {
    let rs: BTreeMap<u32, Vec<String>> = csv(&dir().join("outputs/spacepackets_rs_time.csv"))
        .into_iter()
        .map(|r| (n(&r[0]), r))
        .collect();
    let py = json("python.json");
    let mut judged = 0;
    let mut short = 0;
    for c in cases() {
        if !c.ccsds_epoch {
            continue;
        }
        let o = &rs[&c.id];
        let explicit = c.code.encode(true).unwrap();
        let implicit = c.code.encode(false).unwrap();
        assert_eq!(hex(&explicit), o[1], "case {}: octets", c.id);
        assert_eq!(&explicit[1..], &implicit[..], "case {}", c.id);
        match (c.code.format, c.code.value) {
            (TimeCodeFormat::Cuc(f), TimeValue::Cuc(t)) => {
                // width, counter, fraction resolution (octets), fraction counter
                assert_eq!(n(&o[2]), f.coarse_octets as u32, "case {}", c.id);
                assert_eq!(n(&o[3]), t.coarse, "case {}", c.id);
                assert_eq!(n(&o[4]), f.fine_octets as u32, "case {}", c.id);
                assert_eq!(n(&o[5]), t.fine, "case {}", c.id);
            }
            (TimeCodeFormat::Cds(f), TimeValue::Cds(t)) => {
                assert_eq!(n(&o[2]), t.days, "case {}", c.id);
                assert_eq!(n(&o[3]), t.ms_of_day, "case {}", c.id);
                let prec = match f.submillis {
                    CdsSubmillis::None => 0,
                    CdsSubmillis::Microseconds => 1,
                    CdsSubmillis::Picoseconds => 2,
                };
                assert_eq!(n(&o[4]), prec, "case {}", c.id);
                assert_eq!(n(&o[5]), t.submillis, "case {}", c.id);
                if f.days == CdsDaySegment::Bits16 && f.submillis == CdsSubmillis::None {
                    let s = &py["cds_short"][c.id.to_string()];
                    assert_eq!(s["pack"].as_str().unwrap(), hex(&explicit));
                    assert_eq!(u(&s["days"]), t.days as u64);
                    assert_eq!(u(&s["ms"]), t.ms_of_day as u64);
                    short += 1;
                }
            }
            _ => unreachable!(),
        }
        // Kshana's own decoder reads its octets back.
        let (back, used) = TimeCode::decode(&explicit, None).unwrap();
        assert_eq!((back, used), (c.code, explicit.len()));
        judged += 1;
    }
    assert_eq!((judged, short), (66, 3));
}

fn kshana_fields(s: &Stream, p: &[u8]) -> BTreeMap<String, Value> {
    let d = decode_packet_with(p, &s.format).unwrap();
    let mut m = BTreeMap::new();
    let h = &d.header;
    m.insert("CCSDS_VERSION_NUMBER".into(), h.version.into());
    m.insert(
        "CCSDS_PACKET_TYPE".into(),
        u8::from(h.is_telecommand).into(),
    );
    m.insert(
        "CCSDS_SECONDARY_FLAG".into(),
        u8::from(h.secondary_header).into(),
    );
    m.insert(
        "CCSDS_SEQUENCE_FLAG".into(),
        (h.sequence_flags as u8).into(),
    );
    m.insert("CCSDS_APID".into(), h.apid.into());
    m.insert("CCSDS_SEQUENCE_COUNT".into(), h.sequence_count.into());
    m.insert("CCSDS_PACKET_LENGTH".into(), (p.len() - 7).into());
    let sh = d.secondary_header.unwrap();
    if let Some(tc) = sh.time_code {
        if s.name == "apid100" {
            m.insert("PFIELD".into(), tc.format.p_field().into());
        }
        match tc.value {
            TimeValue::Cuc(t) => {
                m.insert("COARSE".into(), t.coarse.into());
                if s.name == "apid100" {
                    m.insert("FINE".into(), t.fine.into());
                }
            }
            TimeValue::Cds(t) => {
                m.insert("DAYS".into(), t.days.into());
                m.insert("MS_OF_DAY".into(), t.ms_of_day.into());
                m.insert("SUBMS".into(), t.submillis.into());
            }
        }
    }
    if !sh.ancillary.is_empty() {
        m.insert("ANCILLARY".into(), hex(&sh.ancillary).into());
    }
    m.insert("USER".into(), hex(&d.user_data).into());
    if let Some(pec) = d.pec {
        m.insert("PEC".into(), pec.into());
    }
    m
}

#[test]
fn bar3_streams_match_ccsdspy() {
    let py = json("python.json");
    let mut packets = 0;
    for s in streams() {
        if s.name.starts_with("apid104_") {
            continue;
        }
        let rows = py["streams"][s.name].as_array().unwrap();
        assert_eq!(rows.len(), s.packets.len(), "{}", s.name);
        for (i, (p, o)) in s.packets.iter().zip(rows).enumerate() {
            let k = kshana_fields(&s, p);
            let o = o.as_object().unwrap();
            assert_eq!(
                k.keys().collect::<Vec<_>>(),
                o.keys().collect::<Vec<_>>(),
                "{} packet {i}: field set",
                s.name
            );
            for (key, v) in &k {
                assert_eq!(v, &o[key], "{} packet {i}: {key}", s.name);
            }
            packets += 1;
        }
        if s.name == "apid103" || s.name == "apid104" {
            let user: String = rows
                .iter()
                .map(|r| r["USER"].as_str().unwrap().to_string())
                .collect();
            assert_eq!(user, hex(&unit()), "{}: reassembled by ccsdspy", s.name);
            assert_eq!(reassemble(&s.format, &s.packets).unwrap(), vec![unit()]);
        }
    }
    assert_eq!(packets, 8 + 6 + 4 + 8 + 8);
}

#[test]
fn bar4_gap_and_order_detection_agree_with_ccsdspy() {
    let py = json("python.json");
    let warns = |name: &str| -> Vec<String> {
        py["validate"][name]
            .as_array()
            .unwrap()
            .iter()
            .map(|w| w.as_str().unwrap().to_string())
            .collect()
    };
    let by_name: BTreeMap<&str, Stream> = streams().into_iter().map(|s| (s.name, s)).collect();
    let r = |name: &str| reassemble(&by_name[name].format, &by_name[name].packets);
    assert!(warns("apid104").is_empty(), "{:?}", warns("apid104"));
    assert_eq!(r("apid104").unwrap(), vec![unit()]);
    assert!(warns("apid104_a")
        .iter()
        .any(|w| w.contains("Missing packets")));
    assert!(r("apid104_a").unwrap_err().contains("gap"));
    assert!(warns("apid104_b")
        .iter()
        .any(|w| w.contains("out of order")));
    // Kshana judges packet by packet and stops at the first anomaly: count 4 after 2 is a gap
    // when it arrives (ccsdspy, seeing the whole file, calls the swap out of order). Both
    // reject the stream, which is what bar 4 judges.
    assert_eq!(
        r("apid104_b").unwrap_err(),
        "packet 3: sequence count gap: 4 after 2 (1 packet(s) missing)"
    );
    assert!(r("apid104_c").unwrap_err().contains("PEC"));
}

#[test]
fn bar5_pus_tm_matches_spacepackets_py() {
    let py = json("python.json");
    let oracle = std::fs::read(dir().join("outputs/pus_tm_spacepackets.bin")).unwrap();
    let mut at = 0;
    for (i, &(_, _, _, _, len)) in PUS.iter().enumerate() {
        let k = pus_kshana(i);
        let total = 7 + u16::from_be_bytes([oracle[at + 4], oracle[at + 5]]) as usize;
        let o = &oracle[at..at + total];
        assert_eq!(hex(&k), hex(o), "PUS case {i}");
        let d = decode_packet_with(o, &pus_format()).unwrap();
        assert_eq!(d.header.apid, 0x0EF);
        assert_eq!(d.header.sequence_count, i as u16);
        assert_eq!(d.user_data, pus_source(i, len));
        assert_eq!(
            hex(&d.secondary_header.unwrap().ancillary),
            py["pus"][i]["sec_header"].as_str().unwrap()
        );
        at += total;
    }
    assert_eq!(at, oracle.len());
}
