// SPDX-License-Identifier: AGPL-3.0-only
//! 0.42 I2 (timing systems) and I3 (receivers): the timing conformance vectors
//! (`conformance/timing`, byte-exact JSON; `KSHANA_BLESS=1` rewrites them for review) and a
//! round-trip test per format: encode with the crate's encoder, decode, and compare. The network
//! clients (SNMP, NTP mode 6) are checked against loopback servers on 127.0.0.1 only.

use kshana::receiver_trust::machines::{greis, rtcm3_obs, sbp, unicore};
use kshana::{connect_timing, ptp_mgmt, snmp, time_server};
use std::net::UdpSocket;
use std::path::Path;
use std::time::Duration;

#[test]
fn timing_vectors_give_their_expected_json() {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("conformance/timing");
    let vectors = kshana::connect::find_vectors(&dir);
    assert!(vectors.len() >= 9, "{vectors:?}");
    let bless = std::env::var_os("KSHANA_BLESS").is_some();
    for p in vectors {
        let (v, expected, produced) = connect_timing::run_timing_vector(&p).unwrap();
        if bless {
            std::fs::write(&expected, &produced).unwrap();
            continue;
        }
        let want = std::fs::read_to_string(&expected)
            .unwrap_or_else(|e| panic!("{}: {e}", expected.display()));
        assert_eq!(
            kshana::connect::first_difference(&want, &produced),
            None,
            "{}",
            v.name
        );
    }
}

// ----------------------------------------------------------------------------- I3 receivers

#[test]
fn sbp_round_trip() {
    let mut s = Vec::new();
    let mut pos = 100_000u32.to_le_bytes().to_vec();
    for v in [59.5f64, 24.75, 40.25] {
        pos.extend(v.to_le_bytes());
    }
    pos.extend([10, 0, 20, 0, 9, 4]); // accuracies, 9 satellites, fixed RTK
    let mut t = 2340u16.to_le_bytes().to_vec();
    t.extend(100_000u32.to_le_bytes());
    t.extend([0, 0, 0, 0, 1]);
    s.extend(sbp::frame(sbp::MSG_GPS_TIME, 1, &t).unwrap());
    s.extend(sbp::frame(sbp::MSG_POS_LLH, 1, &pos).unwrap());
    s.extend(sbp::frame(sbp::MSG_MEASUREMENT_STATE, 1, &[12, 0, 170, 36, 14, 160]).unwrap());
    let tl = sbp::read_sbp(&s).unwrap();
    assert_eq!(tl.epochs.len(), 1);
    let e = &tl.epochs[0];
    let f = e.fix.unwrap();
    assert_eq!(
        (f.lat_deg, f.lon_deg, f.height_m, f.n_used),
        (59.5, 24.75, 40.25, Some(9))
    );
    assert_eq!(e.time_label.as_deref(), Some("GPS week 2340 TOW 100.000 s"));
    let c: Vec<(&str, &str, f64)> = e
        .cn0
        .iter()
        .map(|x| (x.sat.as_str(), x.band.as_str(), x.cn0_dbhz))
        .collect();
    assert_eq!(c, vec![("G12", "L1", 42.5), ("E36", "E1", 40.0)]);
}

#[test]
fn greis_round_trip() {
    let mut s = greis::message(b"RD", &[0xEA, 0x07, 11, 14, 1]); // 2026-11-14, UTC
    s.extend(greis::message(b"~~", &3_600_000u32.to_le_bytes()));
    s.extend(greis::message(b"SX", &[1, 3, 6, 21]));
    s.extend(greis::message(b"CE", &[180, 150]));
    let mut pg = Vec::new();
    for v in [0.5f64, 0.25, 10.0] {
        pg.extend(v.to_le_bytes());
    }
    pg.extend(1.0f32.to_le_bytes());
    pg.push(4);
    s.extend(greis::message(b"PG", &pg));
    s.extend(greis::message(b"::", &3_600_000u32.to_le_bytes()));
    let tl = greis::read_greis(&s).unwrap();
    let e = &tl.epochs[0];
    assert_eq!(e.time_label.as_deref(), Some("2026-11-14T01:00:00.000Z"));
    assert!((e.fix.unwrap().lat_deg - 0.5f64.to_degrees()).abs() < 1e-12);
    assert_eq!(e.cn0[0].sat, "G03");
    assert_eq!(e.cn0[0].cn0_dbhz, 45.0);
    assert_eq!(
        (e.cn0[1].sat.as_str(), e.cn0[1].band.as_str()),
        ("C21", "B1")
    );
    // one flipped byte: the message fails its checksum and is counted
    let mut bad = s.clone();
    let k = bad.len() - 1;
    bad[k] ^= 0x55;
    assert_eq!(greis::read_greis(&bad).unwrap().skipped_records, 1);
}

#[test]
fn unicore_round_trip() {
    let mut d = vec![0u8; 72];
    d[8..16].copy_from_slice(&(-33.5f64).to_le_bytes());
    d[16..24].copy_from_slice(&151.25f64.to_le_bytes());
    d[24..32].copy_from_slice(&20.0f64.to_le_bytes());
    d[32..36].copy_from_slice(&22.5f32.to_le_bytes());
    d[65] = 17;
    let mut o = 1u32.to_le_bytes().to_vec();
    let mut one = vec![0u8; 40];
    one[2..4].copy_from_slice(&11u16.to_le_bytes());
    one[28..30].copy_from_slice(&4150u16.to_le_bytes());
    one[36..40].copy_from_slice(&((3u32 << 16) | (1 << 21)).to_le_bytes()); // Galileo E1B
    o.extend(one);
    let mut s = unicore::record(unicore::ID_BESTNAV, 2340, 5000, &d).unwrap();
    s.extend(unicore::record(unicore::ID_OBSVM, 2340, 5000, &o).unwrap());
    let tl = unicore::read_unicore(&s).unwrap();
    let e = &tl.epochs[0];
    let f = e.fix.unwrap();
    assert_eq!(
        (f.lat_deg, f.lon_deg, f.height_m, f.n_used),
        (-33.5, 151.25, 42.5, Some(17))
    );
    assert_eq!(
        (
            e.cn0[0].sat.as_str(),
            e.cn0[0].band.as_str(),
            e.cn0[0].cn0_dbhz
        ),
        ("E11", "E1", 41.5)
    );
}

#[test]
fn rtcm_station_and_msm_round_trip() {
    let st = rtcm3_obs::StationArp {
        message: 1006,
        station_id: 77,
        itrf_year: 0,
        gps: true,
        glonass: false,
        galileo: true,
        non_physical: false,
        ecef_m: [3_098_765.432_1, 1_345_678.901_2, -5_555_555.555_5],
        antenna_height_m: Some(1.2345),
    };
    let mut s = rtcm3_obs::frame(&rtcm3_obs::encode_station(&st)).unwrap();
    let cell = |sat: &str, sig: u8, pr: f64, cnr: f64| rtcm3_obs::MsmCell {
        sat: sat.into(),
        signal_id: sig,
        rinex_code: rtcm3_obs::rinex_code(1077, sig),
        pseudorange_m: Some(pr),
        phaserange_m: Some(pr + 1.25),
        phaserange_rate_m_s: Some(-321.0123),
        lock_indicator: 600,
        half_cycle: false,
        cnr_dbhz: Some(cnr),
    };
    for (msg, is7) in [(1077u16, true), (1074, false)] {
        let mut m = rtcm3_obs::MsmMessage {
            message: msg,
            station_id: 77,
            epoch_ms: 345_600_000,
            glonass_day: None,
            multiple: false,
            iods: 0,
            extended_info: if is7 {
                vec![("G05".into(), 0), ("G12".into(), 0)]
            } else {
                vec![]
            },
            cells: vec![
                cell("G05", 2, 21_000_123.456, 45.25),
                cell("G05", 15, 21_000_127.5, 40.0),
                cell("G12", 2, 23_456_789.012, 38.0),
            ],
        };
        if !is7 {
            for c in &mut m.cells {
                c.phaserange_rate_m_s = None;
                c.lock_indicator = 9;
                c.cnr_dbhz = c.cnr_dbhz.map(f64::round);
            }
        }
        s.extend(rtcm3_obs::frame(&rtcm3_obs::encode_msm(&m).unwrap()).unwrap());
    }
    let d = rtcm3_obs::decode(&s);
    assert_eq!(d.skipped, 0);
    let got = &d.stations[0];
    for k in 0..3 {
        assert!((got.ecef_m[k] - st.ecef_m[k]).abs() < 5e-5);
    }
    assert!((got.antenna_height_m.unwrap() - 1.2345).abs() < 5e-5);
    assert_eq!((got.station_id, got.gps, got.galileo), (77, true, true));
    assert_eq!(d.msm.len(), 2);
    for (m, (pr_tol, ph_tol)) in d.msm.iter().zip([(1e-3, 1e-4), (2e-2, 1e-3)]) {
        assert_eq!(m.cells.len(), 3);
        let c = &m.cells[0];
        assert_eq!((c.sat.as_str(), c.rinex_code), ("G05", Some("1C")));
        assert!(
            (c.pseudorange_m.unwrap() - 21_000_123.456).abs() < pr_tol,
            "{m:?}"
        );
        assert!((c.phaserange_m.unwrap() - 21_000_124.706).abs() < ph_tol);
        assert_eq!(m.cells[1].rinex_code, Some("2S"));
        assert!((m.cells[2].pseudorange_m.unwrap() - 23_456_789.012).abs() < pr_tol);
    }
    let m7 = &d.msm[0];
    assert!((m7.cells[0].phaserange_rate_m_s.unwrap() + 321.0123).abs() < 1e-4);
    assert_eq!(m7.cells[0].lock_indicator, 600);
    assert_eq!(m7.cells[0].cnr_dbhz, Some(45.25));
    // the same frames still give the C/N0 timeline of the existing reader
    let tl = kshana::receiver_trust::machines::rtcm3::read_rtcm3(&s).unwrap();
    assert!(tl.epochs[0].cn0.iter().any(|c| c.sat == "G12"));
}

// ----------------------------------------------------------------------------- I2 timing

#[test]
fn ptp_binary_to_pmc_text_and_back() {
    let sets = [
        ptp_mgmt::DataSet::CurrentDataSet {
            steps_removed: 2,
            offset_from_master_ns: -12.5,
            mean_path_delay_ns: 431.0,
        },
        ptp_mgmt::DataSet::TimePropertiesDataSet {
            current_utc_offset: 37,
            flags: 0b0011_1100,
            time_source: 0x20,
        },
        ptp_mgmt::DataSet::PortDataSet {
            port: ptp_mgmt::PortIdentity {
                clock: [1, 2, 3, 0xff, 0xfe, 4, 5, 6],
                port: 1,
            },
            port_state: 9,
            log_min_delay_req_interval: 0,
            peer_mean_path_delay_ns: 0,
            log_announce_interval: 1,
            announce_receipt_timeout: 3,
            log_sync_interval: -3,
            delay_mechanism: 1,
            log_min_pdelay_req_interval: 0,
            version: 2,
        },
        ptp_mgmt::DataSet::TimeStatusNp {
            master_offset_ns: -7,
            // PIN-SCOPE:    the ingress timestamp field of this one TIME_STATUS_NP round-trip vector
            // PIN-EXCLUDES: every other data set and field; it is an input value, not a hash
            ingress_time_ns: 1_763_121_603_071_000_000,
            cumulative_scaled_rate_offset: 0,
            scaled_last_gm_phase_change: 0,
            gm_time_base_indicator: 0,
            last_gm_phase_change: (0, 0, 0),
            gm_present: true,
            gm_identity: [0, 0x11, 0x22, 0xff, 0xfe, 0x33, 0x44, 0x55],
        },
        ptp_mgmt::DataSet::DefaultDataSet {
            two_step: true,
            slave_only: false,
            number_ports: 1,
            priority1: 128,
            quality: ptp_mgmt::ClockQuality {
                clock_class: 248,
                clock_accuracy: 0xfe,
                offset_scaled_log_variance: 0xffff,
            },
            priority2: 128,
            clock_identity: [1, 2, 3, 0xff, 0xfe, 4, 5, 6],
            domain: 24,
        },
    ];
    let ids = [
        ptp_mgmt::MID_CURRENT_DATA_SET,
        ptp_mgmt::MID_TIME_PROPERTIES_DATA_SET,
        ptp_mgmt::MID_PORT_DATA_SET,
        ptp_mgmt::MID_TIME_STATUS_NP,
        ptp_mgmt::MID_DEFAULT_DATA_SET,
    ];
    let mut text = String::new();
    for (k, (ds, id)) in sets.iter().zip(ids).enumerate() {
        let m = ptp_mgmt::MgmtMessage {
            domain: 24,
            source: ptp_mgmt::PortIdentity {
                clock: [1, 2, 3, 0xff, 0xfe, 4, 5, 6],
                port: 1,
            },
            sequence_id: k as u16,
            target: ptp_mgmt::PortIdentity::default(),
            starting_boundary_hops: 0,
            boundary_hops: 0,
            action: 2,
            management_id: id,
            data: Some(ds.clone()),
        };
        let bytes = ptp_mgmt::encode(&m).unwrap();
        let back = ptp_mgmt::decode(&bytes).unwrap();
        assert_eq!(back, m);
        text.push_str(&format!(
            "sending: GET {}\n",
            ptp_mgmt::mid_name(id).unwrap()
        ));
        text.push_str(&ptp_mgmt::render_pmc(&back).unwrap());
        text.push('\n');
    }
    let blocks = ptp_mgmt::parse_pmc(&text);
    assert_eq!(blocks.len(), 5);
    let st = ptp_mgmt::status(&blocks);
    assert_eq!(st.offset_from_master_ns, Some(-12.5));
    assert_eq!(st.steps_removed, Some(2));
    assert_eq!(st.port_state.as_deref(), Some("SLAVE"));
    assert_eq!(st.master_offset_ns, Some(-7));
    assert_eq!(st.gm_identity.as_deref(), Some("001122.fffe.334455"));
    assert_eq!(st.current_utc_offset, Some(37));
    assert_eq!(
        (
            st.ptp_timescale,
            st.time_traceable,
            st.leap61,
            st.time_source
        ),
        (Some(true), Some(true), Some(false), Some(0x20))
    );
    assert_eq!(st.clock_class, Some(248));
}

/// A loopback SNMP agent over a fixed table, answering GET and GETNEXT, for `requests` requests.
fn snmp_agent(table: Vec<(snmp::Oid, snmp::Value)>, requests: usize) -> std::net::SocketAddr {
    let sock = UdpSocket::bind("127.0.0.1:0").unwrap();
    let addr = sock.local_addr().unwrap();
    std::thread::spawn(move || {
        let mut buf = [0u8; 2048];
        for _ in 0..requests {
            let Ok((n, from)) = sock.recv_from(&mut buf) else {
                return;
            };
            let req = snmp::decode_message(&buf[..n]).unwrap();
            let varbinds = req
                .varbinds
                .iter()
                .map(|(o, _)| {
                    if req.pdu_type == snmp::pdu::GET {
                        table
                            .iter()
                            .find(|(k, _)| k == o)
                            .cloned()
                            .unwrap_or((o.clone(), snmp::Value::NoSuchObject))
                    } else {
                        table
                            .iter()
                            .find(|(k, _)| k > o)
                            .cloned()
                            .unwrap_or((o.clone(), snmp::Value::EndOfMibView))
                    }
                })
                .collect();
            let resp = snmp::Message {
                pdu_type: snmp::pdu::RESPONSE,
                varbinds,
                ..req
            };
            sock.send_to(&snmp::encode_message(&resp).unwrap(), from)
                .unwrap();
        }
    });
    addr
}

#[test]
fn snmp_poll_of_a_loopback_agent_with_the_meinberg_map() {
    let o = |s: &str| snmp::parse_oid(s).unwrap();
    let mut table = vec![
        (
            o("1.3.6.1.2.1.1.1.0"),
            snmp::Value::OctetString(b"LANTIME".to_vec()),
        ),
        (
            o("1.3.6.1.2.1.1.5.0"),
            snmp::Value::OctetString(b"gm1".to_vec()),
        ),
        (o("1.3.6.1.4.1.5597.30.0.1.1.0"), snmp::Value::Gauge32(1)),
        (
            o("1.3.6.1.4.1.5597.30.0.1.2.1.4.1"),
            snmp::Value::Integer(1),
        ),
        (
            o("1.3.6.1.4.1.5597.30.0.1.2.1.5.1"),
            snmp::Value::Integer(1),
        ),
        (o("1.3.6.1.4.1.5597.30.0.2.1.0"), snmp::Value::Integer(2)),
        (o("1.3.6.1.4.1.5597.30.0.2.2.0"), snmp::Value::Integer(1)),
        (
            o("1.3.6.1.4.1.5597.30.0.2.4.0"),
            snmp::Value::OctetString(b"0.000123".to_vec()),
        ),
    ];
    table.sort_by(|a, b| a.0.cmp(&b.0));
    let addr = snmp_agent(table, 200);
    let mut c = snmp::Client::new(addr, "public", Duration::from_secs(2), 0).unwrap();
    let map = snmp::parse_map(snmp::builtin_map_text("meinberg-ltng").unwrap()).unwrap();
    let r = snmp::poll(&mut c, &map, 64).unwrap();
    let get = |n: &str| r.readings.iter().find(|x| x.name == n).unwrap();
    assert_eq!(get("sysName").value, "gm1");
    assert_eq!(
        get("mbgLtNgNtpCurrentState").label.as_deref(),
        Some("synchronized")
    );
    assert_eq!(
        get("mbgLtNgRefclockSubstate").label.as_deref(),
        Some("gpsSync")
    );
    assert_eq!(
        get("mbgLtNgRefclockState").oid,
        "1.3.6.1.4.1.5597.30.0.1.2.1.4.1"
    );
    assert!(r.missing.contains(&"mbgLtNgRefclockType".to_string()));
    assert!(r.missing.contains(&"mbgLtNgNtpRefclockName".to_string()));
}

#[test]
fn ntp_mode6_query_reassembles_fragments_from_a_loopback_server() {
    let sock = UdpSocket::bind("127.0.0.1:0").unwrap();
    let addr = sock.local_addr().unwrap();
    std::thread::spawn(move || {
        let mut buf = [0u8; 512];
        let (n, from) = sock.recv_from(&mut buf).unwrap();
        let req = time_server::decode_control(&buf[..n]).unwrap();
        let data =
            b"leap=00, stratum=2, refid=192.0.2.1, offset=-0.034, rootdelay=0.5, rootdisp=1.5"
                .to_vec();
        let (a, b) = data.split_at(30);
        // the second fragment first: the client must order by offset
        for (off, part, more) in [(30u16, b, false), (0, a, true)] {
            let c = time_server::Control {
                version: 2,
                response: true,
                error: false,
                more,
                opcode: req.opcode,
                sequence: req.sequence,
                status: 0x0615,
                association: 0,
                offset: off,
                data: part.to_vec(),
            };
            sock.send_to(&time_server::encode_control(&c).unwrap(), from)
                .unwrap();
        }
    });
    let r = time_server::query_readvars(addr, 0, Duration::from_secs(2)).unwrap();
    assert_eq!(r.variables["stratum"], "2");
    assert_eq!(r.variables["rootdisp"], "1.5");
    assert_eq!(r.system_status.source, 6);
    let h = time_server::health_ntpd(&r.variables, None);
    assert_eq!(h.synchronised, Some(true));
    assert!((h.offset_s.unwrap() + 34e-6).abs() < 1e-12);
}

#[test]
fn chrony_and_ntpq_text_round_trips_through_the_parsers() {
    let t = time_server::parse_chrony_tracking(
        "Reference ID    : 47505300 (GPS)\nStratum         : 1\nSystem time     : 0.000000120 seconds fast of NTP time\nFrequency       : 1.5 ppm fast\nLeap status     : Not synchronised\n",
    )
    .unwrap();
    assert_eq!(t.system_offset_s, Some(1.2e-7));
    assert_eq!(t.frequency_ppm, Some(1.5));
    let h = time_server::health_chrony(&t, None);
    assert_eq!(h.synchronised, Some(false));
    assert_eq!(h.reference.as_deref(), Some("GPS"));
    assert!(time_server::parse_chrony_tracking("Stratum : x\n").is_err());
    assert!(time_server::parse_ntpq_peers("==========\n*a b c\n").is_err());
}
