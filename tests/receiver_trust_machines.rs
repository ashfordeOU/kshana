// SPDX-License-Identifier: AGPL-3.0-only
//! Machine-side inputs to `receiver-trust`: an IMU log beside an NMEA log, and the RTKLIB
//! `.pos` format. Fixtures are written here, not taken from a third party.

use kshana::receiver_trust::monitors::Monitor;
use kshana::receiver_trust::scenario::{
    run_receiver_trust_bytes, run_receiver_trust_bytes_imu, ReceiverTrustScenario,
};

fn nmea_with_cog(n: usize, cog: f64) -> String {
    fn cs(b: &str) -> u8 {
        b.bytes().fold(0, |a, c| a ^ c)
    }
    let mut s = String::new();
    for i in 0..n {
        let t = format!("{:02}{:02}{:02}.00", 10 + i / 3600, i / 60 % 60, i % 60);
        let lon = 1000.0 + 0.001 * i as f64;
        let gga = format!("GPGGA,{t},5954.6900,N,{lon:09.4},E,1,10,0.9,10.0,M,40.0,M,,");
        let rmc = format!("GPRMC,{t},A,5954.6900,N,{lon:09.4},E,10.0,{cog:.1},010324,,,A");
        s.push_str(&format!(
            "${gga}*{:02X}\r\n${rmc}*{:02X}\r\n",
            cs(&gga),
            cs(&rmc)
        ));
    }
    s
}

fn imu_csv(rate_rad_s: f64, n: usize) -> String {
    let mut s = String::from("t_s,gx,gy,gz,ax,ay,az\n");
    for i in 0..n {
        s.push_str(&format!("{i},0,0,{rate_rad_s},0,0,9.81\n"));
    }
    s
}

fn scenario(imu: bool, fmt: &str) -> ReceiverTrustScenario {
    let imu_tbl = if imu {
        "[log.imu]\nformat = \"csv\"\ntext = \"x\"\nheading0_deg = 90.0\n"
    } else {
        ""
    };
    toml::from_str(&format!(
        "[platform]\nkind = \"vessel\"\nheading_sensor = {imu}\n[log]\nformat = \"{fmt}\"\ntext = \"x\"\n{imu_tbl}\n[monitors]\ncalibration_s = 10.0\n"
    ))
    .unwrap()
}

#[test]
fn imu_heading_agrees_then_disagrees_with_course() {
    let log = nmea_with_cog(60, 90.0);
    let scn = scenario(true, "nmea");
    // No yaw rate: gyro heading holds 90 deg, the course is 90 deg.
    let ok = run_receiver_trust_bytes_imu(
        &scn,
        log.as_bytes(),
        None,
        Some(imu_csv(0.0, 60).as_bytes()),
    )
    .unwrap();
    assert!(ok.log.observables.iter().any(|o| o == "imu_heading"));
    // 0.05 rad/s for 60 s turns the gyro heading ~170 deg away from the unchanged course.
    let bad = run_receiver_trust_bytes_imu(
        &scn,
        log.as_bytes(),
        None,
        Some(imu_csv(0.05, 60).as_bytes()),
    )
    .unwrap();
    let alarms = |r: &kshana::receiver_trust::scenario::ReceiverTrustResult| {
        r.epochs
            .iter()
            .filter(|e| e.alarms.contains(&Monitor::HeadingCourse))
            .count()
    };
    assert!(
        alarms(&bad) > alarms(&ok),
        "{} vs {}",
        alarms(&bad),
        alarms(&ok)
    );
    // A surface that cannot carry the IMU bytes refuses the scenario.
    assert!(run_receiver_trust_bytes(&scn, log.as_bytes(), None).is_err());
}

#[test]
fn rtklib_pos_runs_as_a_receiver_log() {
    let mut pos = String::from("% GPST latitude(deg) longitude(deg) height(m) Q ns\n");
    for i in 0..30 {
        pos.push_str(&format!(
            "2024/03/01 12:00:{i:02}.000 59.9115 10.7579 12.0 1 12 0.01\n"
        ));
    }
    let scn = scenario(false, "rtklib-pos");
    let r = run_receiver_trust_bytes(&scn, pos.as_bytes(), None).unwrap();
    assert_eq!(r.log.epochs, 30);
}

fn inline_toml(imu_source: &str) -> String {
    let log = nmea_with_cog(60, 90.0)
        .replace('\r', "")
        .replace('\n', "\\n");
    let imu = imu_csv(0.0, 60).replace('\n', "\\n");
    format!(
        "[platform]\nkind = \"vessel\"\nheading_sensor = true\n[log]\nformat = \"nmea\"\ntext = \"{log}\"\n\
         [log.imu]\nformat = \"csv\"\n{imu_source}heading0_deg = 90.0\n\
         [monitors]\ncalibration_s = 10.0\n"
    )
    .replace("IMU_TEXT", &imu)
}

#[test]
fn imu_travels_inline_and_a_path_is_refused_on_inline_surfaces() {
    let ok = inline_toml("text = \"IMU_TEXT\"\n");
    let out = kshana::surface::assess_receiver_log_inline(&ok, 1 << 20).unwrap();
    assert!(out.json.contains("imu_heading"));
    let bad = inline_toml("path = \"imu.csv\"\n");
    assert!(kshana::surface::assess_receiver_log_inline(&bad, 1 << 20).is_err());
}

fn white_imu_csv(n: usize) -> String {
    // A deterministic pseudo-noise stationary log: 100 Hz, small gyro and accelerometer noise.
    let mut x: u64 = 0x2545_F491_4F6C_DD1D;
    let mut next = || {
        x ^= x << 13;
        x ^= x >> 7;
        x ^= x << 17;
        (x as f64 / u64::MAX as f64) - 0.5
    };
    let mut s = String::from("t_s,gx,gy,gz,ax,ay,az\n");
    for i in 0..n {
        s.push_str(&format!(
            "{:.2},0,0,{:e},{:e},0,9.80665\n",
            i as f64 * 0.01,
            1e-3 * next(),
            1e-2 * next()
        ));
    }
    s
}

#[test]
fn imu_fit_gives_a_toml_table_the_hybrid_kind_can_read() {
    let out = kshana::surface::imu_fit(&white_imu_csv(6000), "csv", "x", 0.0, "bench-imu", 1 << 26)
        .unwrap();
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["evidence"], "MODELLED");
    assert_eq!(v["sha256"].as_str().unwrap().len(), 64);
    let t: toml::Value = toml::from_str(v["toml"].as_str().unwrap()).unwrap();
    assert_eq!(t["accel_classical"]["id"].as_str(), Some("bench-imu"));
    assert!(t["accel_classical"]["q_va"].as_float().unwrap() > 0.0);
    assert!(kshana::surface::imu_fit("x", "csv", "w", 0.0, "a", 1 << 20).is_err());
    assert!(kshana::surface::imu_fit("x", "csv", "x", 0.0, "a b", 1 << 20).is_err());
}

#[test]
fn trust_telemetry_mqtt_text_has_discovery_then_state() {
    use kshana::surface::{trust_telemetry, TelemetryFormat, TelemetryInput, TelemetryOptions};
    let stream = "{\"t_s\":0,\"state\":\"nominal\",\"score\":97}\n\
                  {\"t_s\":1,\"state\":\"untrusted\",\"score\":20,\"alarms\":[\"cn0-drop\"]}\n";
    let out = trust_telemetry(
        stream,
        TelemetryFormat::parse("mqtt").unwrap(),
        "",
        TelemetryInput::Jsonl,
        TelemetryOptions::default(),
        1 << 20,
    )
    .unwrap();
    let lines: Vec<&str> = out.lines().collect();
    assert_eq!(lines.len(), 5, "3 discovery + 2 band changes");
    assert!(lines[0].starts_with("homeassistant/sensor/kshana/score/config\t"));
    assert!(lines[4].starts_with("kshana/trust/state\t") && lines[4].contains("untrusted"));
}

fn nov(line: &str) -> String {
    format!(
        "#{line}*{:08x}\r\n",
        kshana::receiver_trust::machines::novatel::novatel_crc32(line.as_bytes())
    )
}

#[test]
fn novatel_jammer_flag_reaches_the_receiver_self_report() {
    let mut log = String::new();
    for i in 0..80 {
        let t = 100.0 + i as f64;
        // GPS L1 channels with a steady C/No on PRN 3 and 7
        log.push_str(&nov(&format!(
            "RANGEA,COM1,0,50.0,FINESTEERING,2300,{t:.3},02000000,0000,1;2,\
             3,0,2.4e7,0.2,-1.2e8,0.01,100.0,44.0,500.0,00000004,\
             7,0,2.2e7,0.2,-1.2e8,0.01,100.0,42.0,500.0,00000004"
        )));
        // from i = 50 the receiver reports a jammer (receiver status bit 15)
        let rx = if i >= 50 { "00008000" } else { "00000000" };
        log.push_str(&nov(&format!(
            "RXSTATUSA,COM1,0,50.0,FINESTEERING,2300,{t:.3},02000000,0000,1;00000000,2,\
             {rx},0,0,0,00000000,0,0,0"
        )));
    }
    let scn: ReceiverTrustScenario = toml::from_str(
        "[log]\nformat = \"novatel\"\ntext = \"x\"\n[monitors]\ncalibration_s = 20.0\n",
    )
    .unwrap();
    let r = run_receiver_trust_bytes(&scn, log.as_bytes(), None).unwrap();
    let flagged: Vec<_> = r
        .epochs
        .iter()
        .filter_map(|e| e.self_report.as_ref())
        .filter(|s| s.receiver_flag)
        .collect();
    assert_eq!(flagged.len(), 30);
    assert!(flagged
        .iter()
        .all(|s| s.jamming_state == Some(2) && s.spoofing_state.is_none()));
    let sum = r
        .receiver_self_report
        .expect("a summary when the log carries flags");
    assert!(sum.note.contains("NovAtel RXSTATUS") && sum.note.contains("no spoofing flag"));
    assert!(!sum.note.contains("UBX"));
    assert_eq!(sum.jamming_flag_epochs, 30);
    assert_eq!(sum.spoofing_flag_epochs, 0);
    // Kshana's monitors saw a steady C/No: the receiver flagged alone
    assert_eq!(sum.receiver_only, 30);
}
