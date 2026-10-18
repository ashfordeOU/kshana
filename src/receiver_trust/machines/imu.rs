// SPDX-License-Identifier: AGPL-3.0-only
//! IMU log ingest: a gyro and accelerometer series read from CSV, used as an independent
//! sensor beside a receiver log.
//!
//! Two layouts are read:
//!
//! * `csv`: a header row naming the columns, then one sample per row. Required columns:
//!   `t_s` (seconds on the receiver log's clock, see `time_offset_s`), `gx`, `gy`, `gz`
//!   (angular rate, rad/s) and `ax`, `ay`, `az` (specific force, m/s^2). Column order is free.
//! * `euroc`: the EuRoC MAV `imu0/data.csv` layout (an open dataset format): a `#timestamp
//!   [ns]` column in nanoseconds, then `w_RS_S_x/y/z [rad s^-1]` and `a_RS_S_x/y/z
//!   [m s^-2]`; the first sample is `t_s = 0`.
//!
//! The yaw rate, integrated from a stated initial heading, becomes the gyro heading the
//! `heading-course` trust monitor compares with the receiver's course over ground. A gyro
//! drifts: the heading is only as good as the integration window, and the monitor's own
//! tolerance is what decides. The accelerometer columns are carried for the hybrid scenarios
//! that take a measured specific-force series.

use serde::{Deserialize, Serialize};

/// IMU file layouts.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum ImuFormat {
    /// Documented named-column CSV.
    Csv,
    /// EuRoC MAV `imu0/data.csv`.
    Euroc,
}

/// One IMU sample.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ImuSample {
    /// Seconds on the log clock.
    pub t_s: f64,
    /// Angular rate about the body x, y, z axes, rad/s.
    pub gyro: [f64; 3],
    /// Specific force along the body x, y, z axes, m/s^2.
    pub accel: [f64; 3],
}

/// Most samples held, so a hostile file cannot grow memory without bound.
const MAX_SAMPLES: usize = 20_000_000;

fn col(header: &[String], names: &[&str]) -> Option<usize> {
    header
        .iter()
        .position(|h| names.iter().any(|n| h.eq_ignore_ascii_case(n)))
}

/// Read an IMU CSV. Rows that do not parse are skipped; time must increase, a row that does
/// not is skipped. Errors when the header lacks a required column or no sample reads.
pub fn read_imu(format: ImuFormat, text: &str) -> Result<Vec<ImuSample>, String> {
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let head = lines.next().ok_or("the IMU file is empty")?;
    let header: Vec<String> = head
        .trim_start_matches('#')
        .split(',')
        .map(|s| s.trim().to_string())
        .collect();
    let idx: [usize; 7] = match format {
        ImuFormat::Csv => {
            let c = |n: &str| col(&header, &[n]).ok_or_else(|| format!("IMU csv: no `{n}` column"));
            [
                c("t_s")?,
                c("gx")?,
                c("gy")?,
                c("gz")?,
                c("ax")?,
                c("ay")?,
                c("az")?,
            ]
        }
        ImuFormat::Euroc => {
            let c = |n: &str| {
                header
                    .iter()
                    .position(|h| h.starts_with(n))
                    .ok_or_else(|| format!("IMU euroc: no `{n}` column"))
            };
            [
                c("timestamp")?,
                c("w_RS_S_x")?,
                c("w_RS_S_y")?,
                c("w_RS_S_z")?,
                c("a_RS_S_x")?,
                c("a_RS_S_y")?,
                c("a_RS_S_z")?,
            ]
        }
    };
    let mut out: Vec<ImuSample> = Vec::new();
    let mut t0_ns: Option<f64> = None;
    for l in lines {
        if out.len() >= MAX_SAMPLES {
            break;
        }
        let f: Vec<&str> = l.split(',').map(str::trim).collect();
        let v: Option<Vec<f64>> = idx
            .iter()
            .map(|&i| {
                f.get(i)
                    .and_then(|s| s.parse::<f64>().ok())
                    .filter(|x| x.is_finite())
            })
            .collect();
        let Some(v) = v else { continue };
        let t = match format {
            ImuFormat::Csv => v[0],
            ImuFormat::Euroc => (v[0] - *t0_ns.get_or_insert(v[0])) / 1e9,
        };
        if out.last().is_some_and(|p| t <= p.t_s) {
            continue;
        }
        out.push(ImuSample {
            t_s: t,
            gyro: [v[1], v[2], v[3]],
            accel: [v[4], v[5], v[6]],
        });
    }
    if out.is_empty() {
        return Err("the IMU file holds no readable sample".to_string());
    }
    Ok(out)
}

/// Gyro heading in degrees `[0, 360)` at each sample: `heading0_deg` plus the trapezoidal
/// integral of the yaw rate. `yaw_axis_down` is true when body z points down (NED / FRD, a
/// positive rate turns clockwise, as heading counts); false when z points up (ENU / FLU, a
/// positive rate turns counter-clockwise).
pub fn gyro_heading(
    samples: &[ImuSample],
    heading0_deg: f64,
    yaw_axis_down: bool,
) -> Vec<(f64, f64)> {
    let sign = if yaw_axis_down { 1.0 } else { -1.0 };
    let mut h = heading0_deg;
    let mut out = Vec::with_capacity(samples.len());
    for (i, s) in samples.iter().enumerate() {
        if i > 0 {
            let p = &samples[i - 1];
            h += sign * 0.5 * (s.gyro[2] + p.gyro[2]) * (s.t_s - p.t_s) * 180.0
                / std::f64::consts::PI;
        }
        out.push((s.t_s, h.rem_euclid(360.0)));
    }
    out
}

/// Heading at `t_s` by interpolation along the shortest arc, `None` outside the series.
pub fn heading_at(series: &[(f64, f64)], t_s: f64) -> Option<f64> {
    let (first, last) = (series.first()?, series.last()?);
    if t_s < first.0 || t_s > last.0 {
        return None;
    }
    let i = series.partition_point(|p| p.0 <= t_s);
    if i == 0 || i >= series.len() {
        return Some(series[i.min(series.len() - 1)].1);
    }
    let (a, b) = (series[i - 1], series[i]);
    let d = (b.1 - a.1 + 540.0).rem_euclid(360.0) - 180.0;
    let w = (t_s - a.0) / (b.0 - a.0);
    Some((a.1 + w * d).rem_euclid(360.0))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn csv_and_integrated_heading() {
        // A constant 0.1 rad/s yaw rate for 10 s about a down axis: 57.2958 deg.
        let mut t = String::from("t_s,gx,gy,gz,ax,ay,az\n");
        for i in 0..=10 {
            t.push_str(&format!("{i},0,0,0.1,0,0,9.81\n"));
        }
        let s = read_imu(ImuFormat::Csv, &t).unwrap();
        assert_eq!(s.len(), 11);
        let h = gyro_heading(&s, 90.0, true);
        assert!((h[10].1 - (90.0 + 5.729_577_951_308_232 * 10.0)).abs() < 1e-9);
        let up = gyro_heading(&s, 90.0, false);
        assert!((up[10].1 - (90.0 - 57.295_779_513_082_32)).abs() < 1e-9);
        assert!((heading_at(&h, 5.0).unwrap() - h[5].1).abs() < 1e-12);
        assert_eq!(heading_at(&h, 11.0), None);
    }

    #[test]
    fn euroc_layout_and_bad_rows() {
        let t = "#timestamp [ns],w_RS_S_x [rad s^-1],w_RS_S_y [rad s^-1],w_RS_S_z [rad s^-1],a_RS_S_x [m s^-2],a_RS_S_y [m s^-2],a_RS_S_z [m s^-2]\n\
1403636579758555392,0,0,0.5,0,0,9.8\n\
1403636579763555584,0,0,0.5,0,0,9.8\n\
bad,row\n\
1403636579763555584,0,0,0.5,0,0,9.8\n";
        let s = read_imu(ImuFormat::Euroc, t).unwrap();
        assert_eq!(s.len(), 2);
        assert!((s[1].t_s - 0.005).abs() < 1e-6);
    }

    #[test]
    fn heading_wraps_across_north() {
        let s = [(0.0, 359.0), (1.0, 1.0)];
        let h = heading_at(&s, 0.5).unwrap();
        assert!(h > 359.9 || h < 0.1, "{h}");
    }

    #[test]
    fn missing_columns_and_empty_are_errors() {
        assert!(read_imu(ImuFormat::Csv, "t_s,gx\n1,2\n").is_err());
        assert!(read_imu(ImuFormat::Csv, "").is_err());
        assert!(read_imu(ImuFormat::Csv, "t_s,gx,gy,gz,ax,ay,az\n").is_err());
    }
}
