// SPDX-License-Identifier: AGPL-3.0-only
//! Live sensors (roadmap L4d): `kshana sensor-live` reads a sensor's log as it is written and
//! prints one JSON line per sample.
//!
//! * `--kind imu` (`--format csv|euroc|ros2-csv`): the gyro and accelerometer layouts of
//!   [`crate::receiver_trust::machines::imu`], read by the same line reader as a replay, so the
//!   live samples are the replay's samples. Each line carries the gyro heading integrated from
//!   `--heading0` (default 0) the way the `heading-course` monitor integrates it, sample by sample
//!   with the same sums.
//!
//! * `--kind n2k`: NMEA 2000 frames from a SocketCAN `candump -l` log, printed as NMEA 0183
//!   sentences ([`crate::n2k`]), ready for `kshana receiver-trust live`.
//!
//! The input is standard input, `tcp:host:port` or a file (with `--follow`, waiting for more
//! lines). A serial IMU is read through the tool that turns it into CSV lines. Read only.

use crate::receiver_trust::machines::imu::{HeadingIntegrator, ImuFormat, ImuReader};
use serde::Serialize;

/// One IMU line of `kshana sensor-live` output.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ImuLine {
    /// Seconds on the log clock.
    pub t_s: f64,
    /// Angular rate, rad/s (x, y, z).
    pub gyro: [f64; 3],
    /// Specific force, m/s^2 (x, y, z).
    pub accel: [f64; 3],
    /// The integrated gyro heading, degrees `[0, 360)`.
    pub heading_deg: f64,
}

/// A live IMU reader: lines in, samples with their heading out.
pub struct ImuLive {
    reader: ImuReader,
    heading: HeadingIntegrator,
}

impl ImuLive {
    /// A reader for `format`, the heading starting at `heading0_deg` (`yaw_axis_down` as in
    /// [`crate::receiver_trust::machines::imu::gyro_heading`]).
    pub fn new(format: ImuFormat, heading0_deg: f64, yaw_axis_down: bool) -> Self {
        Self {
            reader: ImuReader::new(format),
            heading: HeadingIntegrator::new(heading0_deg, yaw_axis_down),
        }
    }

    /// Take one line; a sample gives one output line.
    pub fn push(&mut self, line: &str) -> Result<Option<ImuLine>, String> {
        let Some(s) = self.reader.push_line(line.trim_end_matches(['\r', '\n']))? else {
            return Ok(None);
        };
        Ok(Some(ImuLine {
            t_s: s.t_s,
            gyro: s.gyro,
            accel: s.accel,
            heading_deg: self.heading.push(&s),
        }))
    }
}

/// Usage text for `kshana sensor-live`.
pub fn usage() -> String {
    crate::t!("sensor-live-usage")
}

/// `kshana sensor-live --kind imu --format <csv|euroc> --from <-|tcp:host:port|file> [--follow]
/// [--heading0 <deg>] [--z-up] [--max-seconds <s>]`.
pub fn run(args: &[String]) -> Result<(), String> {
    let (hcfg, reconnect, args) = crate::live_health::split_args(args, "sensor")?;
    let args = &args[..];
    let (mut kind, mut format, mut from) = (None, None, None);
    let (mut follow, mut z_up, mut heading0, mut max_s) = (false, false, 0.0, None);
    let mut i = 0;
    while i < args.len() {
        let v = args.get(i + 1).cloned();
        match args[i].as_str() {
            "--follow" => follow = true,
            "--z-up" => z_up = true,
            k => {
                let v = v.ok_or_else(usage)?;
                match k {
                    "--kind" => kind = Some(v),
                    "--format" => format = Some(v),
                    "--from" => from = Some(v),
                    "--heading0" => {
                        heading0 = v
                            .parse::<f64>()
                            .ok()
                            .filter(|x| x.is_finite())
                            .ok_or_else(usage)?
                    }
                    "--max-seconds" => {
                        max_s = Some(
                            v.parse::<f64>()
                                .ok()
                                .filter(|x| x.is_finite() && *x > 0.0)
                                .ok_or_else(usage)?,
                        )
                    }
                    _ => return Err(usage()),
                }
                i += 1;
            }
        }
        i += 1;
    }
    let (Some(kind), Some(from)) = (kind, from) else {
        return Err(usage());
    };
    let format = format.unwrap_or_default();
    let opts = crate::live_health::FollowOptions {
        follow,
        max_s,
        reconnect,
    };
    let health = std::cell::RefCell::new(crate::live_health::Health::new(hcfg));
    let idle = |now| crate::live_health::print_events(&health.borrow_mut().on_idle(now));
    let gap = |a, b| crate::live_health::print_events(&[health.borrow().gap(a, b)]);
    if kind == "n2k" {
        // NMEA 2000 frames in, NMEA 0183 sentences out (src/n2k.rs). The output is NMEA for the
        // next reader, so health events go to standard error.
        let mut c = crate::n2k::N2kToNmea::default();
        return crate::live_health::follow(
            &from,
            &opts,
            |line, arrival| {
                use std::io::Write;
                let sentences = c.push(line);
                let ev = health.borrow_mut().on_reading(arrival, None);
                for e in &ev {
                    eprintln!("{}", serde_json::to_string(e).map_err(|e| e.to_string())?);
                }
                let mut out = std::io::stdout().lock();
                for s in sentences {
                    out.write_all(s.as_bytes()).map_err(|e| e.to_string())?;
                }
                out.flush().map_err(|e| e.to_string())
            },
            |now| {
                for e in health.borrow_mut().on_idle(now) {
                    eprintln!("{}", serde_json::to_string(&e).map_err(|e| e.to_string())?);
                }
                Ok(())
            },
            |a, b| {
                eprintln!(
                    "{}",
                    serde_json::to_string(&health.borrow().gap(a, b)).map_err(|e| e.to_string())?
                );
                Ok(())
            },
        );
    }
    if kind != "imu" {
        return Err(crate::terr!("e-sensor-live-kind", kind = kind));
    }
    let fmt = match format.as_str() {
        "csv" => ImuFormat::Csv,
        "euroc" => ImuFormat::Euroc,
        "ros2-csv" => ImuFormat::Ros2Csv,
        _ => return Err(usage()),
    };
    let mut live = ImuLive::new(fmt, heading0, !z_up);
    crate::live_health::follow(
        &from,
        &opts,
        |line, arrival| {
            let Some(o) = live.push(line)? else {
                return Ok(());
            };
            let mut h = health.borrow_mut();
            // The watched value is the magnitude of the specific force (about 9.8 m/s^2 at rest).
            let g = o.accel.iter().map(|a| a * a).sum::<f64>().sqrt();
            let events = h.on_reading(arrival, Some(g));
            crate::live_health::print_line(&o, Some(h.stamp(arrival)))?;
            crate::live_health::print_events(&events)
        },
        idle,
        gap,
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::receiver_trust::machines::imu::{gyro_heading, read_imu};

    #[test]
    fn a_ros2_imu_echo_reads_live_and_replayed() {
        let line = |sec: i64, ns: u32, gz: f64| {
            let mut f = vec![sec.to_string(), ns.to_string(), "imu_link".to_string()];
            f.extend(["0", "0", "0", "1"].map(String::from));
            f.extend(std::iter::repeat_n("0".to_string(), 9));
            f.extend(["0.01", "0.02"].map(String::from));
            f.push(gz.to_string());
            f.extend(std::iter::repeat_n("0".to_string(), 9));
            f.extend(["0.1", "0.2", "9.81"].map(String::from));
            f.extend(std::iter::repeat_n("0".to_string(), 9));
            f.join(",")
        };
        let text: String = (0..50)
            .map(|k| line(1_780_000_000, k * 10_000_000, f64::from(k) * 0.01) + "\n")
            .collect();
        let replay = read_imu(ImuFormat::Ros2Csv, &text).unwrap();
        assert_eq!(replay.len(), 50);
        assert_eq!(replay[3].gyro, [0.01, 0.02, 0.03]);
        assert_eq!(replay[3].t_s, 1_780_000_000.0 + 0.03);
        let mut live = ImuLive::new(ImuFormat::Ros2Csv, 0.0, true);
        let n = text.lines().filter_map(|l| live.push(l).unwrap()).count();
        assert_eq!(n, 50);
        assert!(live.push("1,2,short").unwrap().is_none());
    }

    #[test]
    fn live_samples_and_heading_equal_the_replay() {
        let mut text = String::from("t_s,gx,gy,gz,ax,ay,az\n");
        for k in 0..200 {
            let t = f64::from(k) * 0.01;
            text += &format!("{t},0.001,0.002,{},0.1,0.2,9.81\n", (t * 3.0).sin() * 0.2);
            if k == 50 {
                text += "garbage,row\n";
            }
        }
        let replay = read_imu(ImuFormat::Csv, &text).unwrap();
        let heading = gyro_heading(&replay, 30.0, true);
        let mut live = ImuLive::new(ImuFormat::Csv, 30.0, true);
        let got: Vec<ImuLine> = text.lines().filter_map(|l| live.push(l).unwrap()).collect();
        assert_eq!(got.len(), replay.len());
        for ((g, r), h) in got.iter().zip(&replay).zip(&heading) {
            assert_eq!((g.t_s, g.gyro, g.accel), (r.t_s, r.gyro, r.accel));
            assert_eq!(g.heading_deg.to_bits(), h.1.to_bits());
        }
    }
}
