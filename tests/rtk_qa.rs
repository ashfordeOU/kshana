// SPDX-License-Identifier: AGPL-3.0-only
//! RTK, NTRIP and correction-service quality checks (`kshana rtk-qa`, docs/RTK-QA.md), on loopback
//! casters and self-made RTCM, solution and RINEX fixtures; no real caster is contacted.
//!
//! * Liveness: a stream that stops on a still-open connection raises a stale alarm within 5 s; MSM
//!   latency against the receiving clock; the source table sorted by distance.
//! * Base: a base shifted by 5 cm fails; a base broadcasting ETRF2020 where ITRF2020 is published,
//!   and an ITRF network for an ETRF project, are both named; marker/ARP confusion; tide systems.
//! * Fixes: an injected wrong fix (one L1 wavelength) is found, with and without a control point;
//!   float precision warnings; PPK no-fix causes from RINEX logs, one of them a real code-only log.
//! * NTRIP: the reference caster serves kshana's own NTRIP client (v2 with chunk extensions, v1)
//!   and curl as a third-party client; the probe meets every check against it; the caster's
//!   limits; credentials never reach kshana's output; log scanning; a failover policy test.

use kshana::receiver_trust::machines::rtcm3_obs::{self, encode_station, frame, StationArp};
use kshana::rtk_qa::{base_check, fix_check, liveness, ppk_diag, protocol, sourcetable};
use std::io::{BufRead, BufReader, Read, Write};
use std::net::{TcpListener, TcpStream};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::Arc;
use std::time::Duration;

/// The NTRIP test password, made at run time so that no credential is written into the source.
fn pw() -> &'static str {
    static PW: std::sync::OnceLock<String> = std::sync::OnceLock::new();
    PW.get_or_init(|| {
        let t = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .map(|d| d.subsec_nanos())
            .unwrap_or(0);
        format!("pw-{}-{t:x}", std::process::id())
    })
}

/// `user:password` as an HTTP Basic token.
fn basic_token() -> String {
    kshana::permalink::base64_encode(format!("rover:{}", pw()).as_bytes())
}

static SEQ: AtomicU64 = AtomicU64::new(0);

fn temp(name: &str) -> std::path::PathBuf {
    let seq = SEQ.fetch_add(1, Ordering::SeqCst);
    let dir = std::env::temp_dir().join(format!("kshana-rtkqa-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    dir.join(name)
}

fn bin() -> &'static str {
    env!("CARGO_BIN_EXE_kshana")
}

/// Tallinn-like station: ITRF2020 at 2015.0 with a Eurasian velocity.
const X0: [f64; 3] = [2_952_564.8, 1_361_338.5, 5_468_884.0];

fn station(id: u16, ecef: [f64; 3], height: Option<f64>) -> Vec<u8> {
    let s = StationArp {
        message: if height.is_some() { 1006 } else { 1005 },
        station_id: id,
        itrf_year: 0,
        gps: true,
        glonass: true,
        galileo: true,
        non_physical: false,
        ecef_m: ecef,
        antenna_height_m: height,
    };
    frame(&encode_station(&s)).unwrap()
}

fn msm_frame(epoch_ms: u32) -> Vec<u8> {
    let m = rtcm3_obs::MsmMessage {
        message: 1074,
        station_id: 7,
        epoch_ms,
        glonass_day: None,
        multiple: false,
        iods: 0,
        extended_info: vec![],
        cells: vec![rtcm3_obs::MsmCell {
            sat: "G05".into(),
            signal_id: 2,
            rinex_code: rtcm3_obs::rinex_code(1074, 2),
            pseudorange_m: Some(21_000_123.456),
            phaserange_m: Some(21_000_124.0),
            phaserange_rate_m_s: None,
            lock_indicator: 9,
            half_cycle: false,
            cnr_dbhz: Some(45.0),
            modulo_1ms: false,
        }],
    };
    frame(&rtcm3_obs::encode_msm(&m).unwrap()).unwrap()
}

fn read_head(s: &TcpStream) -> Vec<String> {
    let mut r = BufReader::new(s.try_clone().unwrap());
    let mut head = Vec::new();
    loop {
        let mut line = String::new();
        if r.read_line(&mut line).unwrap_or(0) == 0 || line == "\r\n" {
            break;
        }
        head.push(line.trim_end().to_string());
    }
    head
}

fn ntrip_cfg(addr: String, mount: &str, creds: Option<(&str, &str)>) -> kshana::ntrip::NtripConfig {
    kshana::ntrip::NtripConfig {
        addr,
        mountpoint: mount.into(),
        credentials: creds.map(|(u, p)| (u.into(), p.into())),
        gga: None,
    }
}

// ---------------------------------------------------------------- stream liveness

#[test]
fn a_stream_that_stops_on_an_open_connection_alarms_within_five_seconds() {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    std::thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        read_head(&s);
        s.write_all(b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n")
            .unwrap();
        let f = station(7, X0, None);
        for _ in 0..5 {
            let _ = write!(s, "{:x}\r\n", f.len());
            let _ = s.write_all(&f);
            let _ = s.write_all(b"\r\n");
            std::thread::sleep(Duration::from_millis(200));
        }
        // the connection stays open and silent
        std::thread::sleep(Duration::from_secs(8));
    });
    let st = kshana::ntrip::NtripStream::open(&ntrip_cfg(addr, "M", None)).unwrap();
    let mut seen = Vec::new();
    let card =
        kshana::rtk_qa::monitor_stream(st, liveness::MonitorConfig::default(), Some(6.0), |a| {
            seen.push(a.clone())
        });
    let stale: Vec<_> = seen.iter().filter(|a| a.kind == "stale").collect();
    assert_eq!(stale.len(), 1, "{seen:?}");
    let s = stale[0].silent_s.unwrap();
    assert!((3.0..=5.0).contains(&s), "alarm after {s} s of silence");
    assert!(!seen.iter().any(|a| a.kind == "closed"), "{seen:?}");
    assert_eq!(card.frames, 5);
    assert!(card.availability < 0.8 && card.stale_events == 1);
    assert!(card.station.is_some());
    assert_eq!(card.label, "MODELLED");
}

#[test]
fn msm_latency_completeness_and_score() {
    let mut m = liveness::LivenessMonitor::new(liveness::MonitorConfig::default());
    let unix0 = 1_790_000_000.0;
    // ten 1 Hz epochs, the fourth missing, each arriving 0.8 s after its epoch
    for k in 0..10u32 {
        if k == 3 {
            continue;
        }
        let unix = unix0 + f64::from(k);
        let c = liveness::receive_clock(unix);
        let epoch_ms = (c.gps_tow_ms - 800.0).round() as u32;
        m.push(f64::from(k), &msm_frame(epoch_ms), Some(c));
        m.push(f64::from(k) + 0.1, &station(7, X0, None), Some(c));
    }
    let card = m.scorecard(10.0);
    let lat = card.latency.as_ref().unwrap();
    assert_eq!(lat.n, 9);
    assert!((lat.median_ms - 800.0).abs() < 1.5, "{lat:?}");
    assert!((card.completeness.unwrap() - 0.9).abs() < 1e-9);
    assert_eq!(card.availability, 1.0);
    // 40 + 20 + 0.9 × 20 + 10 + 10
    assert!((card.score - 98.0).abs() < 1e-9, "{}", card.score);
}

#[test]
fn the_source_table_command_sorts_by_distance() {
    let p = temp("table.txt");
    std::fs::write(
        &p,
        "STR;FAR;Far;RTCM 3.2;;2;GPS;N;EST;58.38;26.72;0;0;g;none;B;N;2400;\r\n\
         STR;NEAR;Near;RTCM 3.2;;2;GPS;N;EST;59.44;24.75;0;0;g;none;B;N;2400;\r\nENDSOURCETABLE\r\n",
    )
    .unwrap();
    let o = std::process::Command::new(bin())
        .args([
            "rtk-qa",
            "sources",
            p.to_str().unwrap(),
            "--near",
            "59.4,24.7",
        ])
        .output()
        .unwrap();
    assert!(o.status.success());
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["mountpoints"][0]["mountpoint"], "NEAR");
    assert_eq!(v["mountpoints"][1]["mountpoint"], "FAR");
    let t = sourcetable::parse(&std::fs::read_to_string(&p).unwrap());
    assert!(t.complete);
}

// ---------------------------------------------------------------- base coordinates

fn velocity() -> [f64; 3] {
    // the Eurasian plate at X0 in ITRF2020: ω × X with ω = -(ETRF2020 rotation rates)
    let mas = std::f64::consts::PI / (180.0 * 3600.0 * 1000.0);
    let w = [-0.086 * mas, -0.519 * mas, 0.753 * mas];
    [
        w[1] * X0[2] - w[2] * X0[1],
        w[2] * X0[0] - w[0] * X0[2],
        w[0] * X0[1] - w[1] * X0[0],
    ]
}

fn reference(project: &str) -> base_check::Reference {
    let v = velocity();
    let toml = format!(
        "{project}\n[[station]]\nid = 7\nname = \"TLL0\"\nframe = \"ITRF2020\"\nepoch = 2015.0\n\
         ecef_m = [{}, {}, {}]\nvelocity_m_per_yr = [{}, {}, {}]\n",
        X0[0], X0[1], X0[2], v[0], v[1], v[2]
    );
    toml::from_str(&toml).unwrap()
}

const EPOCH: f64 = 2026.9;

fn published_now() -> [f64; 3] {
    let v = velocity();
    let dt = EPOCH - 2015.0;
    [X0[0] + v[0] * dt, X0[1] + v[1] * dt, X0[2] + v[2] * dt]
}

fn decode(bytes: &[u8]) -> Vec<StationArp> {
    rtcm3_obs::decode(bytes).stations
}

#[test]
fn the_plate_velocity_and_the_etrf_offset_have_the_published_size() {
    let v = velocity();
    let speed = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    assert!((0.020..0.030).contains(&speed), "{speed} m/yr");
    // ETRF2020 removes the plate motion since 1989.0: about 0.9-1.0 m by 2026.9
    let x = published_now();
    let e = base_check::transform(
        x,
        base_check::Frame::Itrf2020,
        base_check::Frame::Etrf2020,
        EPOCH,
    );
    let d = ((e[0] - x[0]).powi(2) + (e[1] - x[1]).powi(2) + (e[2] - x[2]).powi(2)).sqrt();
    assert!((speed * 37.9 - d).abs() < 0.002, "{d}");
    // round trip, and ITRF2014/2020 a few millimetres apart
    let back = base_check::transform(
        e,
        base_check::Frame::Etrf2020,
        base_check::Frame::Itrf2020,
        EPOCH,
    );
    assert!((back[0] - x[0]).abs() < 1e-4 && (back[2] - x[2]).abs() < 1e-4);
    let i14 = base_check::transform(
        x,
        base_check::Frame::Itrf2020,
        base_check::Frame::Itrf2014,
        EPOCH,
    );
    let d14 = ((i14[0] - x[0]).powi(2) + (i14[1] - x[1]).powi(2) + (i14[2] - x[2]).powi(2)).sqrt();
    assert!((0.001..0.01).contains(&d14), "{d14}");
}

#[test]
fn a_correct_base_passes_and_a_five_centimetre_shift_fails() {
    let ok = base_check::check(
        &decode(&station(7, published_now(), None)),
        &reference(""),
        EPOCH,
    )
    .unwrap();
    assert_eq!((ok.ok, ok.warn, ok.fail), (1, 0, 0), "{ok:?}");
    assert_eq!(
        ok.stations[0].best_match.as_ref().unwrap().kind,
        "published"
    );

    let mut x = published_now();
    x[0] += 0.03;
    x[1] += 0.04; // 5 cm
    let bad = base_check::check(&decode(&station(7, x, None)), &reference(""), EPOCH).unwrap();
    assert_eq!(bad.fail, 1, "{bad:?}");
    let f = &bad.stations[0].findings[0];
    assert_eq!(f.code, "unexplained-offset");
    assert!((f.value_m.unwrap() - 0.05).abs() < 1e-3);
}

#[test]
fn itrf_and_etrf_and_epoch_mismatches_are_named() {
    // the base broadcasts ETRF2020 where the station is published in ITRF2020
    let etrf = base_check::transform(
        published_now(),
        base_check::Frame::Itrf2020,
        base_check::Frame::Etrf2020,
        EPOCH,
    );
    let r = base_check::check(&decode(&station(7, etrf, None)), &reference(""), EPOCH).unwrap();
    let s = &r.stations[0];
    assert_eq!(s.verdict, "warn", "{s:?}");
    assert_eq!(s.findings[0].code, "frame-epoch-mismatch");
    assert!(s.findings[0]
        .realisation
        .as_deref()
        .unwrap()
        .starts_with("ETRF2020@2026.90"));

    // the base still broadcasts its 2015.0 coordinate (no velocity applied)
    let r = base_check::check(&decode(&station(7, X0, None)), &reference(""), EPOCH).unwrap();
    let m = r.stations[0].best_match.as_ref().unwrap();
    assert_eq!(
        (m.kind, m.realisation.as_str()),
        ("frame-epoch", "ITRF2020@2015.00")
    );

    // a correct ITRF2020 network used for an ETRF2020 project: every coordinate is offset
    let r = base_check::check(
        &decode(&station(7, published_now(), None)),
        &reference("[project]\nframe = \"ETRF2020\"\nepoch = 2026.9\n"),
        EPOCH,
    )
    .unwrap();
    let f = r.stations[0]
        .findings
        .iter()
        .find(|f| f.code == "project-frame-mismatch")
        .expect("project mismatch");
    assert!((0.8..1.1).contains(&f.value_m.unwrap()), "{f:?}");
    assert_eq!(r.warn, 1);
}

#[test]
fn marker_arp_confusion_changes_and_tides_are_reported() {
    // broadcast at the marker: the ARP published, 1006 says 1.5 m of antenna height
    let x = published_now();
    let n = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
    let g = kshana::frames::ecef_to_geodetic(x);
    let up = [
        g.lat_rad.cos() * g.lon_rad.cos(),
        g.lat_rad.cos() * g.lon_rad.sin(),
        g.lat_rad.sin(),
    ];
    let marker = [x[0] - 1.5 * up[0], x[1] - 1.5 * up[1], x[2] - 1.5 * up[2]];
    assert!(n > 6.3e6);
    let r = base_check::check(
        &decode(&station(7, marker, Some(1.5))),
        &reference(""),
        EPOCH,
    )
    .unwrap();
    assert_eq!(
        r.stations[0].findings[0].code, "marker-arp-confusion",
        "{r:?}"
    );

    // a base whose coordinate changes during the stream
    let mut moved = x;
    moved[2] += 0.2;
    let mut bytes = station(7, x, None);
    bytes.extend(station(7, moved, None));
    let r = base_check::check(&decode(&bytes), &reference(""), EPOCH).unwrap();
    assert!(r.stations[0]
        .findings
        .iter()
        .any(|f| f.code == "coordinates-changed"));

    // GNSS heights tide-free, geoid mean-tide: at 59.4° N the heights differ by about 7 cm
    let r = base_check::check(
        &decode(&station(7, x, None)),
        &reference("[project]\ngeoid_tide = \"mean-tide\"\n"),
        EPOCH,
    )
    .unwrap();
    let f = r.stations[0]
        .findings
        .iter()
        .find(|f| f.code == "tide-system-mismatch")
        .unwrap();
    assert!((0.065..0.08).contains(&f.value_m.unwrap()), "{f:?}");
    let lat = 59.4f64.to_radians();
    assert!(
        (base_check::geoid_tide_offset_m(base_check::Tide::MeanTide, lat) + 0.156).abs() < 0.003
    );

    // an unknown frame is refused
    let e = base_check::check(
        &decode(&station(7, x, None)),
        &toml::from_str::<base_check::Reference>("[project]\nframe = \"NAD83\"\n").unwrap(),
        EPOCH,
    )
    .unwrap_err();
    assert!(e.contains("NAD83"));
}

#[test]
fn the_base_command_reads_a_stream_and_a_reference_file() {
    let stream = temp("base.rtcm3");
    let mut x = published_now();
    x[2] += 0.05;
    std::fs::write(&stream, station(7, x, None)).unwrap();
    let refp = temp("reference.json");
    let r = reference("");
    std::fs::write(&refp, serde_json::to_string(&r).unwrap()).unwrap();
    let o = std::process::Command::new(bin())
        .args([
            "rtk-qa",
            "base",
            stream.to_str().unwrap(),
            "--reference",
            refp.to_str().unwrap(),
            "--epoch",
            "2026.9",
        ])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(1));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["stations"][0]["verdict"], "fail");
    assert!(String::from_utf8_lossy(&o.stderr).contains("failures 1"));
    // unknown fields in the reference are refused
    std::fs::write(&refp, "{\"station\": [], \"stations\": []}").unwrap();
    let o = std::process::Command::new(bin())
        .args([
            "rtk-qa",
            "base",
            stream.to_str().unwrap(),
            "--reference",
            refp.to_str().unwrap(),
        ])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(1));
}

// ---------------------------------------------------------------- fixes and PPK

/// An RTKLIB-style .pos: a static point, float for 10 s, fixed for 30 s, float for 5 s, then a
/// second fixed run `wrong_up` metres higher (a wrong integer), then a move and a second point.
fn pos_file(wrong_up: f64) -> String {
    let mut s = String::from(
        "% program   : test\n%  GPST                  latitude(deg) longitude(deg)  height(m)   Q  ns   sdn(m)   sde(m)   sdu(m)  sdne(m)  sdeu(m)  sdun(m) age(s)  ratio\n",
    );
    let (lat0, lon0, h0) = (59.4370000, 24.7530000, 40.0);
    let mut line = |t: u32, dn: f64, h: f64, q: u8, sd: f64, ratio: f64| {
        let lat = lat0 + dn / 111_320.0;
        s.push_str(&format!(
            "2026/11/20 10:{:02}:{:02}.000 {lat:14.9} {lon0:14.9} {h:10.4} {q:3} {:3} {sd:8.4} {sd:8.4} {:8.4} {:8.4} {:8.4} {:8.4} {:6.2} {ratio:6.1}\n",
            t / 60,
            t % 60,
            12,
            sd * 2.0,
            0.0,
            0.0,
            0.0,
            1.0
        ));
    };
    let jitter = |k: u32| (f64::from(k % 5) - 2.0) * 0.002;
    for k in 0..10 {
        line(k, 0.15 - 0.01 * f64::from(k), h0 + 0.2, 2, 0.12, 0.0);
    }
    for k in 10..40 {
        line(k, jitter(k), h0 + jitter(k + 1), 1, 0.008, 8.0);
    }
    for k in 40..45 {
        line(k, 0.05, h0 + 0.1, 2, 0.10, 0.0);
    }
    for k in 45..60 {
        line(k, jitter(k), h0 + wrong_up + jitter(k + 2), 1, 0.008, 3.5);
    }
    // walk 30 m north
    for k in 60..70 {
        line(k, 3.0 * f64::from(k - 59), h0, 2, 0.1, 0.0);
    }
    // second point: float only, but reporting 1 cm
    for k in 70..90 {
        line(k, 30.0 + 0.3 + jitter(k) * 10.0, h0, 2, 0.01, 0.0);
    }
    s
}

#[test]
fn an_injected_wrong_fix_is_found() {
    let e = fix_check::parse_pos(&pos_file(0.1903)).unwrap();
    assert_eq!(e.len(), 90);
    let r = fix_check::check(&e, &[], &fix_check::FixConfig::default());
    assert_eq!(r.occupations.len(), 2, "{:?}", r.occupations);
    let o = &r.occupations[0];
    assert_eq!(o.verdict, "fail");
    assert_eq!((o.n_fix, o.runs.len()), (45, 2));
    let f = o
        .findings
        .iter()
        .find(|f| f.code == "inconsistent-fixes")
        .unwrap();
    assert_eq!(f.wavelength, Some("L1"));
    assert_eq!(
        f.at.as_deref(),
        Some("2026/11/20 10:00:45.000"),
        "the shorter run is the suspect"
    );
    assert_eq!(o.time_to_fix_s, Some(10.0));
    // the second point: a float solution claiming 1 cm
    let p2 = &r.occupations[1];
    assert_eq!(p2.verdict, "no-fix");
    assert!(p2
        .findings
        .iter()
        .any(|f| f.code == "float-precision-misleads"));

    // without the wrong fix the first point passes
    let e = fix_check::parse_pos(&pos_file(0.0)).unwrap();
    let r = fix_check::check(&e, &[], &fix_check::FixConfig::default());
    assert_eq!(
        r.occupations[0].verdict, "pass",
        "{:?}",
        r.occupations[0].findings
    );
}

#[test]
fn a_control_point_decides_which_fix_is_wrong() {
    // the longer run is the wrong one here: the control point is at the shorter run's height
    let e = fix_check::parse_pos(&pos_file(-0.1903)).unwrap();
    let ctl = fix_check::Control {
        name: "CP1".into(),
        llh: [59.437, 24.753, 40.0 - 0.1903],
    };
    let r = fix_check::check(&e, &[ctl], &fix_check::FixConfig::default());
    let o = &r.occupations[0];
    assert_eq!(o.control.as_deref(), Some("CP1"));
    let f = o
        .findings
        .iter()
        .find(|f| f.code == "inconsistent-fixes")
        .unwrap();
    assert_eq!(f.at.as_deref(), Some("2026/11/20 10:00:10.000"));
    let c = o.findings.iter().find(|f| f.code == "control-ok").unwrap();
    assert!(c.value.unwrap() < 0.01);
    // and a control point 0.2442 m off (one L2 wavelength) is a mismatch
    let ctl = fix_check::Control {
        name: "CP2".into(),
        llh: [59.437, 24.753, 40.0 + 0.2442],
    };
    let r = fix_check::check(
        &fix_check::parse_pos(&pos_file(0.0)).unwrap(),
        &[ctl],
        &fix_check::FixConfig::default(),
    );
    let f = r.occupations[0]
        .findings
        .iter()
        .find(|f| f.code == "control-mismatch")
        .unwrap();
    assert_eq!(f.wavelength, Some("L2"));
}

#[test]
fn gga_logs_and_the_fix_command() {
    let mut nmea = String::new();
    for k in 0..20u32 {
        let q = if k < 5 { 5 } else { 4 };
        let body = format!(
            "GNGGA,1000{:02}.00,5926.2200,N,02445.1800,E,{q},12,0.8,{:.3},M,18.0,M,1.0,0001",
            k, 22.0
        );
        let ck = body.bytes().fold(0u8, |a, b| a ^ b);
        nmea.push_str(&format!("${body}*{ck:02X}\n"));
    }
    let e = fix_check::parse_gga(&nmea).unwrap();
    assert_eq!((e.len(), e[0].q, e[10].q), (20, 2, 1));
    let p = temp("rover.nmea");
    std::fs::write(&p, &nmea).unwrap();
    let o = std::process::Command::new(bin())
        .args(["rtk-qa", "fix", p.to_str().unwrap()])
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["occupations"][0]["verdict"], "pass");
    let p = temp("bad.pos");
    std::fs::write(&p, pos_file(0.8619)).unwrap();
    let o = std::process::Command::new(bin())
        .args(["rtk-qa", "fix", p.to_str().unwrap()])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(1));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(
        v["occupations"][0]["findings"][0]["wavelength"],
        "wide-lane"
    );
}

/// A small RINEX 3 observation file: GPS L1/L2 code and phase (with `lli` set on some phases),
/// 1 Hz from `start_s` past 10:00:00 for `n` epochs, with `sats` satellites.
fn rinex(start_s: u32, n: u32, sats: u32, lli_every: u32, xyz: [f64; 3]) -> String {
    let hdr = |text: &str, label: &str| format!("{text:<60}{label}\n");
    let mut s = String::new();
    s += &hdr(
        "     3.04           OBSERVATION DATA    G (GPS)",
        "RINEX VERSION / TYPE",
    );
    s += &hdr(
        &format!("{:14.4}{:14.4}{:14.4}", xyz[0], xyz[1], xyz[2]),
        "APPROX POSITION XYZ",
    );
    s += &hdr("G    6 C1C L1C S1C C2W L2W S2W", "SYS / # / OBS TYPES");
    s += &hdr("     1.000", "INTERVAL");
    s += &hdr("", "END OF HEADER");
    for k in 0..n {
        let t = start_s + k;
        s += &format!(
            "> 2026 11 20 10 {:02} {:10.7}  0 {:2}\n",
            t / 60,
            f64::from(t % 60),
            sats
        );
        for p in 1..=sats {
            let lli = if lli_every > 0 && (k + p) % lli_every == 0 {
                "1"
            } else {
                " "
            };
            let pr = 20_000_000.0 + f64::from(p) * 1000.0 + f64::from(k);
            s += &format!(
                "G{p:02}{pr:14.3}  {:14.3}{lli} {:14.3}  {pr:14.3}  {:14.3}  {:14.3}  \n",
                pr / 0.1903,
                42.0,
                pr / 0.2442,
                38.0
            );
        }
    }
    s
}

#[test]
fn ppk_no_fix_causes_are_listed() {
    let xyz = [2_952_564.8, 1_361_338.5, 5_468_884.0];
    let rover = kshana::rinex_obs::parse_obs(&rinex(0, 120, 8, 0, xyz)).unwrap();
    let base_late = kshana::rinex_obs::parse_obs(&rinex(600, 60, 8, 0, xyz)).unwrap();
    let d = ppk_diag::diagnose(&rover, Some(&base_late));
    assert_eq!(d.causes[0].code, "no-time-overlap", "{:?}", d.causes);

    let base =
        kshana::rinex_obs::parse_obs(&rinex(30, 60, 4, 0, [xyz[0] + 30_000.0, xyz[1], xyz[2]]))
            .unwrap();
    let d = ppk_diag::diagnose(&rover, Some(&base));
    let codes: Vec<&str> = d.causes.iter().map(|c| c.code).collect();
    assert_eq!(d.common_epochs, Some(60));
    assert_eq!(d.median_common_sats, Some(4.0));
    assert!(
        codes.contains(&"short-overlap") && codes.contains(&"long-baseline"),
        "{codes:?}"
    );
    assert_eq!(d.rover.median_dual_band_sats, 8.0);

    let slips = kshana::rinex_obs::parse_obs(&rinex(0, 120, 8, 3, xyz)).unwrap();
    let d = ppk_diag::diagnose(&slips, None);
    assert!(
        d.causes.iter().any(|c| c.code == "frequent-loss-of-lock"),
        "{:?}",
        d.causes
    );

    // a real receiver log with pseudoranges only (raw carrier phase not logged)
    let real = std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/clock_library_tcxo_card_jammertest_oracle/train_01.obs"
    ))
    .unwrap();
    let d = ppk_diag::diagnose(&kshana::rinex_obs::parse_obs(&real).unwrap(), None);
    assert_eq!(d.causes[0].code, "no-carrier-phase");
}

// ---------------------------------------------------------------- NTRIP behaviour

fn stream_bytes() -> Vec<u8> {
    let mut v = Vec::new();
    for k in 0..30u32 {
        v.extend(station(7, X0, None));
        v.extend(msm_frame(345_600_000 + k * 1000));
    }
    v
}

fn caster(
    creds: bool,
    ext: bool,
    clients: usize,
) -> (String, std::thread::JoinHandle<Vec<protocol::ClientReport>>) {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let mut cfg = protocol::CasterConfig::new("KSH0", stream_bytes());
    if creds {
        cfg.credentials = Some(("rover".into(), pw().into()));
    }
    cfg.chunk_extensions = ext;
    cfg.chunk_bytes = 61;
    let h = std::thread::spawn(move || {
        let mut out = Vec::new();
        protocol::serve(l, Arc::new(cfg), Some(clients), |r| out.push(r));
        out
    });
    (addr, h)
}

#[test]
fn kshana_ntrip_reads_the_reference_caster_in_both_versions() {
    let (addr, h) = caster(true, true, 1);
    let mut st =
        kshana::ntrip::NtripStream::open(&ntrip_cfg(addr, "KSH0", Some(("rover", pw())))).unwrap();
    assert_eq!(st.answer, kshana::ntrip::Answer::Ntrip2 { chunked: true });
    let mut got = Vec::new();
    st.read_to_end(&mut got).unwrap();
    assert_eq!(got, stream_bytes(), "chunk extensions are skipped");
    let reps = h.join().unwrap();
    let r = &reps[0];
    assert_eq!((r.protocol, r.answer), ("ntrip2", "200"));
    let (met, total) = r.tally();
    assert_eq!(met, total, "{r:?}");

    // an NTRIP 1 request (no Ntrip-Version header), written by hand
    let (addr, h) = caster(false, false, 1);
    let mut s = TcpStream::connect(&addr).unwrap();
    s.write_all(b"GET /KSH0 HTTP/1.0\r\nUser-Agent: NTRIP test\r\n\r\n")
        .unwrap();
    let mut got = Vec::new();
    s.read_to_end(&mut got).unwrap();
    assert!(got.starts_with(b"ICY 200 OK\r\n\r\n"));
    assert_eq!(&got[14..], &stream_bytes()[..]);
    let r = &h.join().unwrap()[0];
    assert_eq!(r.protocol, "ntrip1");
    assert!(r
        .checks
        .iter()
        .any(|c| c.id == "ntrip-version-header" && c.met == Some(false)));
}

#[test]
fn curl_as_a_third_party_client() {
    if std::process::Command::new("curl")
        .arg("--version")
        .output()
        .is_err()
    {
        eprintln!("curl not installed: skipped");
        return;
    }
    let (addr, h) = caster(true, true, 1);
    let out = temp("curl.rtcm3");
    let st = std::process::Command::new("curl")
        .args([
            "-s",
            "--noproxy",
            "*",
            "-u",
            &*format!("rover:{}", pw()),
            "-H",
            "Ntrip-Version: Ntrip/2.0",
            "-o",
        ])
        .arg(&out)
        .arg(format!("http://{addr}/KSH0"))
        .status()
        .unwrap();
    assert!(st.success());
    assert_eq!(std::fs::read(&out).unwrap(), stream_bytes());
    let r = &h.join().unwrap()[0];
    assert_eq!(r.answer, "200");
    let check = |id: &str| r.checks.iter().find(|c| c.id == id).unwrap().met;
    assert_eq!(check("basic-auth"), Some(true));
    assert_eq!(check("ntrip-version-header"), Some(true));
    assert_eq!(
        check("user-agent-ntrip"),
        Some(false),
        "curl does not name itself NTRIP"
    );
    assert_eq!(check("stream-delivered"), Some(true));
}

#[test]
fn the_probe_meets_every_check_against_the_reference_caster() {
    let (addr, h) = caster(true, true, 7);
    let rep = protocol::probe(&protocol::ProbeConfig {
        addr,
        mount: "KSH0".into(),
        credentials: Some(("rover".into(), pw().into())),
        gga: Some(kshana::ntrip::gga(59.44, 24.75, 30.0)),
        seconds: 1.0,
    });
    assert_eq!(rep.met, rep.applicable, "{:#?}", rep.checks);
    assert!(rep.applicable >= 11, "{}", rep.applicable);
    let reps = h.join().unwrap();
    assert_eq!(reps.len(), 7);
    let answers: Vec<&str> = reps.iter().map(|r| r.answer).collect();
    assert_eq!(
        answers.iter().filter(|a| **a == "401").count(),
        2,
        "{answers:?}"
    );
    // nothing the caster or the probe reports carries the password
    let all = serde_json::to_string(&(rep, reps)).unwrap();
    assert!(!all.contains(pw()) && !all.contains(&basic_token()));
}

#[test]
fn the_caster_limits_slow_and_surplus_clients() {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let mut cfg = protocol::CasterConfig::new("KSH0", stream_bytes());
    cfg.max_clients = 1;
    cfg.head_timeout = Duration::from_millis(500);
    cfg.max_head_bytes = 512;
    let h = std::thread::spawn(move || {
        let mut out = Vec::new();
        protocol::serve(l, Arc::new(cfg), Some(3), |r| out.push(r));
        out
    });
    // a client that never finishes its request holds the only slot until the deadline
    let slow = TcpStream::connect(&addr).unwrap();
    std::thread::sleep(Duration::from_millis(100));
    let mut busy = TcpStream::connect(&addr).unwrap();
    busy.write_all(b"GET /KSH0 HTTP/1.1\r\nNtrip-Version: Ntrip/2.0\r\n\r\n")
        .unwrap();
    let mut a = String::new();
    busy.read_to_string(&mut a).unwrap();
    assert!(a.starts_with("HTTP/1.1 503"), "{a}");
    std::thread::sleep(Duration::from_millis(600));
    let mut big = TcpStream::connect(&addr).unwrap();
    let _ = big
        .write_all(format!("GET /KSH0 HTTP/1.1\r\nX-Pad: {}\r\n\r\n", "a".repeat(2000)).as_bytes());
    let mut a = String::new();
    let _ = big.read_to_string(&mut a);
    assert!(a.starts_with("HTTP/1.1 431"), "{a}");
    drop(slow);
    let mut answers: Vec<&str> = h.join().unwrap().iter().map(|r| r.answer).collect();
    answers.sort_unstable();
    assert_eq!(answers, ["431", "503", "timeout"]);
}

#[test]
fn credentials_stay_out_of_kshana_output_and_logs_are_scanned() {
    let (addr, h) = caster(true, false, 1);
    let out = temp("ntrip.rtcm3");
    let o = std::process::Command::new(bin())
        .args([
            "ntrip",
            &addr,
            "--mount",
            "KSH0",
            "--user",
            "rover",
            "--password-env",
            "KSHANA_TEST_NTRIP_PW",
            "--out",
        ])
        .arg(&out)
        .env("KSHANA_TEST_NTRIP_PW", pw())
        .output()
        .unwrap();
    assert!(o.status.success());
    h.join().unwrap();
    let mut log = String::from_utf8_lossy(&o.stdout).to_string();
    log.push_str(&String::from_utf8_lossy(&o.stderr));
    assert!(protocol::scan_log(&log, "rover", pw()).is_empty(), "{log}");

    // a careless client log
    let bad = format!(
        "connecting to ntrip://rover:{}@caster.example:2101/KSH0\n\
         > Authorization: Basic {}\nok\n",
        pw(),
        basic_token()
    );
    let bad = bad.as_str();
    let leaks = protocol::scan_log(bad, "rover", pw());
    let kinds: Vec<(usize, &str)> = leaks.iter().map(|l| (l.line, l.kind)).collect();
    assert_eq!(
        kinds,
        [
            (1, "password"),
            (1, "url-userinfo"),
            (2, "basic-token"),
            (2, "authorization-header")
        ]
    );
    let clean = protocol::redact(bad);
    assert!(
        protocol::scan_log(&clean, "rover", pw()).is_empty(),
        "{clean}"
    );
    let p = temp("client.log");
    std::fs::write(&p, bad).unwrap();
    let o = std::process::Command::new(bin())
        .args([
            "rtk-qa",
            "log-check",
            p.to_str().unwrap(),
            "--user",
            "rover",
            "--password-env",
            "KSHANA_TEST_NTRIP_PW",
        ])
        .env("KSHANA_TEST_NTRIP_PW", pw())
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(1));
    assert!(!String::from_utf8_lossy(&o.stdout).contains(pw()));
}

#[test]
fn a_failover_policy_is_tested_on_an_outage_timeline() {
    let spec: protocol::FailoverSpec = serde_json::from_str(
        r#"{"duration_s": 900, "max_age_s": 8,
            "policy": {"order": ["radio", "ntrip", "lband"], "switch_after_s": 5, "switch_back_hold_s": 60},
            "sources": [
              {"name": "radio", "latency_s": 0.5, "outages": [[100, 200]]},
              {"name": "ntrip", "latency_s": 1.5, "outages": [[150, 400]]},
              {"name": "lband", "latency_s": 6.0, "interval_s": 5}
            ]}"#,
    )
    .unwrap();
    let r = protocol::failover(&spec).unwrap();
    let path: Vec<(f64, &str)> = r.switches.iter().map(|s| (s.t_s, s.to.as_str())).collect();
    // radio -> ntrip 5 s after radio falls silent; ntrip -> lband when ntrip fails too;
    // back to radio 60 s after it recovers
    assert_eq!(path[0], (1.0, "radio"));
    assert_eq!(path[1].1, "ntrip");
    assert!((105.0..=107.0).contains(&path[1].0), "{path:?}");
    assert_eq!(path[2].1, "lband");
    assert_eq!(path[3], (261.0, "radio"));
    assert!(r.findings.contains(&"age-over-limit"), "{r:?}");
    assert!(r.max_age_s > 8.0 && r.time_over_max_age_s > 0.0);
    // the command
    let p = temp("failover.json");
    std::fs::write(&p, serde_json::to_string(&spec).unwrap()).unwrap();
    let o = std::process::Command::new(bin())
        .args(["rtk-qa", "failover", p.to_str().unwrap()])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(1));
    assert!(String::from_utf8_lossy(&o.stderr).contains("switches 4"));
    // an unknown source in the policy is refused
    let mut bad = spec.clone();
    bad.policy.order.push("lora".into());
    assert!(protocol::failover(&bad).unwrap_err().contains("lora"));
}

#[test]
fn the_command_prints_its_usage() {
    let o = std::process::Command::new(bin())
        .args(["rtk-qa", "--help"])
        .output()
        .unwrap();
    assert!(o.status.success());
    let t = String::from_utf8_lossy(&o.stdout);
    for sub in [
        "monitor",
        "sources",
        "base",
        "fix",
        "ppk",
        "probe",
        "caster",
        "log-check",
        "failover",
    ] {
        assert!(t.contains(&format!("kshana rtk-qa {sub}")), "{sub}");
    }
    let o = std::process::Command::new(bin())
        .args(["rtk-qa", "nonsense"])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
}
