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
