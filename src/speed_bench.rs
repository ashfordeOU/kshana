// SPDX-License-Identifier: AGPL-3.0-only
//! Speed benchmarks and a station sizing table (roadmap L10c): `kshana bench-speed`.
//!
//! Each workload is one of the live paths a station runs, on synthetic input built here, so the
//! command needs no files: decoding a receiver log, the live decoder in small pieces, the receiver
//! trust assessment, the interference monitors over IQ samples, a device file and the clock-log
//! line reader. Each is run `repeats` times and the median time kept.
//!
//! Machines differ, and so do the machines of a CI service from run to run. So every workload is
//! also reported as a ratio to a fixed calibration workload (SHA-256 over a buffer) timed on the same
//! machine in the same run; the ratio, not the raw time, is what is compared between runs. The
//! sizing table divides each throughput by the rate a station needs (a receiver at 1 epoch per
//! second; an SDR channel at 4 MS/s), with half of each core left free.
//!
//! This measures speed only. Kshana's accuracy is benchmarked elsewhere (the kshana-bench suite),
//! and no result here changes any output: the same inputs give the same bytes however fast.

use serde::Serialize;
use std::time::Instant;

/// One measured workload.
#[derive(Clone, Debug, Serialize)]
pub struct Measured {
    /// Workload id.
    pub id: &'static str,
    /// What it does.
    pub what: &'static str,
    /// Items per run.
    pub items: u64,
    /// The unit of `items`.
    pub unit: &'static str,
    /// Median wall time of one run, s.
    pub median_s: f64,
    /// Items per second, from the median.
    pub per_s: f64,
    /// Median time over the calibration workload's median time.
    pub ratio_to_calibration: f64,
}

/// One row of the sizing table.
#[derive(Clone, Debug, Serialize)]
pub struct SizingRow {
    /// What is sized.
    pub what: &'static str,
    /// Per core, with half the core left free.
    pub per_core: f64,
}

/// A whole run.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// `kshana.bench-speed/1`.
    pub schema: &'static str,
    /// Engine version.
    pub engine: &'static str,
    /// Operating system and CPU architecture.
    pub platform: String,
    /// Logical CPUs.
    pub cpus: usize,
    /// Repeats per workload.
    pub repeats: usize,
    /// Calibration median, s.
    pub calibration_s: f64,
    /// The workloads.
    pub workloads: Vec<Measured>,
    /// The sizing table.
    pub sizing: Vec<SizingRow>,
}

fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

fn time(repeats: usize, mut f: impl FnMut()) -> f64 {
    f(); // warm up
    median(
        (0..repeats)
            .map(|_| {
                let t = Instant::now();
                f();
                t.elapsed().as_secs_f64()
            })
            .collect(),
    )
}

fn ubx(class: u8, id: u8, payload: &[u8]) -> Vec<u8> {
    let mut f = vec![0xB5, 0x62, class, id];
    f.extend((payload.len() as u16).to_le_bytes());
    f.extend(payload);
    let (mut a, mut b) = (0u8, 0u8);
    for &x in &f[2..] {
        a = a.wrapping_add(x);
        b = b.wrapping_add(a);
    }
    f.extend([a, b]);
    f
}

/// `n` one-second UBX epochs (NAV-PVT and NAV-SAT with 12 satellites).
fn ubx_log(n: u32) -> Vec<u8> {
    let mut v = Vec::new();
    for k in 0..n {
        let itow = 345_600_000 + k * 1000;
        let mut p = vec![0u8; 92];
        p[..4].copy_from_slice(&itow.to_le_bytes());
        p[4..6].copy_from_slice(&2026u16.to_le_bytes());
        p[6] = 11;
        p[7] = 7;
        p[8] = (k / 3600) as u8;
        p[9] = (k / 60 % 60) as u8;
        p[10] = (k % 60) as u8;
        p[11] = 0b11;
        p[20] = 3;
        p[23] = 12;
        p[24..28].copy_from_slice(&247_500_000i32.to_le_bytes());
        p[28..32].copy_from_slice(&594_400_000i32.to_le_bytes());
        v.extend(ubx(0x01, 0x07, &p));
        let mut s = vec![0u8; 8 + 12 * 12];
        s[..4].copy_from_slice(&itow.to_le_bytes());
        s[5] = 12;
        for sv in 0..12usize {
            let b = &mut s[8 + sv * 12..20 + sv * 12];
            b[1] = sv as u8 + 1;
            b[2] = 40 + (sv as u8 % 5);
            b[3] = 30;
        }
        v.extend(ubx(0x01, 0x35, &s));
    }
    v
}

fn nmea(body: &str) -> String {
    format!("${body}*{:02X}\r\n", body.bytes().fold(0u8, |a, b| a ^ b))
}

/// `n` one-second NMEA epochs (RMC, GGA and three GSV sentences).
fn nmea_log(n: u32) -> String {
    let mut s = String::new();
    for k in 0..n {
        let (h, m, sec) = (k / 3600 % 24, k / 60 % 60, k % 60);
        let t = format!("{h:02}{m:02}{sec:02}.00");
        s += &nmea(&format!(
            "GPRMC,{t},A,5926.2500,N,02445.2160,E,0.0,0.0,071126,,,A"
        ));
        s += &nmea(&format!(
            "GPGGA,{t},5926.2500,N,02445.2160,E,1,12,0.9,30.0,M,18.0,M,,"
        ));
        for part in 1..=3 {
            let mut b = format!("GPGSV,3,{part},12");
            for j in 0..4 {
                let prn = (part - 1) * 4 + j + 1;
                b += &format!(",{prn:02},{},{},{}", 20 + prn * 3, prn * 25, 38 + prn % 7);
            }
            s += &nmea(&b);
        }
    }
    s
}

/// Run every workload `repeats` times.
pub fn run(repeats: usize, quick: bool) -> Result<Report, String> {
    let repeats = repeats.max(1);
    let scale = if quick { 1 } else { 5 };
    let station = crate::obs::Station {
        id: "bench".into(),
        ..Default::default()
    };

    let calib_buf = vec![0x5Au8; 8 << 20];
    let calibration_s = time(repeats, || {
        use sha2::{Digest, Sha256};
        std::hint::black_box(Sha256::digest(&calib_buf));
    });
    let mut out = Vec::new();
    let mut add = |id, what, items: u64, unit, t: f64| {
        out.push(Measured {
            id,
            what,
            items,
            unit,
            median_s: t,
            per_s: items as f64 / t,
            ratio_to_calibration: t / calibration_s,
        })
    };

    let n = 2_000 * scale;
    let log = ubx_log(n);
    let t = time(repeats, || {
        std::hint::black_box(crate::obs::from_log("ubx", &log, &station).ok());
    });
    add(
        "obs-decode-ubx",
        "decode a UBX log to kshana.obs/1",
        u64::from(n),
        "epochs",
        t,
    );

    let n_live = 300 * scale;
    let live_log = ubx_log(n_live);
    let t = time(repeats, || {
        let mut l = crate::obs_live::LiveObs::new("ubx", &station).expect("ubx is known");
        for c in live_log.chunks(512) {
            std::hint::black_box(l.push(c).ok());
        }
        std::hint::black_box(l.flush().ok());
    });
    add(
        "obs-live-ubx",
        "the live decoder fed in 512-byte pieces",
        u64::from(n_live),
        "epochs",
        t,
    );

    let n_nmea = 1_000 * scale;
    let text = nmea_log(n_nmea);
    let scn: crate::receiver_trust::scenario::ReceiverTrustScenario =
        toml::from_str("[log]\nformat = \"nmea\"\ntext = \"\"\n").map_err(|e| e.to_string())?;
    let t = time(repeats, || {
        std::hint::black_box(
            crate::receiver_trust::scenario::run_receiver_trust_bytes(&scn, text.as_bytes(), None)
                .ok(),
        );
    });
    add(
        "receiver-trust-nmea",
        "the receiver trust assessment of an NMEA log",
        u64::from(n_nmea),
        "epochs",
        t,
    );

    let fs = 4.0e6;
    let n_iq = 400_000 * scale as usize;
    let mut s: u64 = 0x9E37_79B9_7F4A_7C15;
    let mut u = || {
        s ^= s << 13;
        s ^= s >> 7;
        s ^= s << 17;
        (s >> 11) as f64 / (1u64 << 53) as f64 - 0.5
    };
    let samples: Vec<crate::iq::Cf64> = (0..n_iq).map(|_| crate::iq::Cf64::new(u(), u())).collect();
    let spec = crate::iq::SampleSpec {
        fs_hz: fs,
        center_hz: 1_575.42e6,
        if_hz: 0.0,
    };
    let cfg = crate::iq::monitor::run::MonitorConfig::default();
    let design = crate::iq::track::LoopConfig::default();
    let t = time(repeats, || {
        let mut src = crate::iq::VecSource::new(spec, samples.clone());
        std::hint::black_box(
            crate::iq::monitor::run::run_monitors(&mut src, &[], &design, &cfg, None).ok(),
        );
    });
    add(
        "iq-monitor",
        "the power and spectral interference monitors over complex samples",
        n_iq as u64,
        "samples",
        t,
    );

    let lines: String = (0..20_000 * scale)
        .map(|k| {
            format!(
                "ptp4l[{}.000]: master offset {} s2 freq +0 path delay 500\n",
                1000 + k,
                k % 41
            )
        })
        .collect();
    let t = time(repeats, || {
        let mut c =
            crate::clock_live::ClockLive::new(crate::clock_log::ClockLogFormat::Ptp4l, None)
                .expect("ptp4l is read live");
        for l in lines.lines() {
            std::hint::black_box(c.push(l));
        }
    });
    add(
        "clock-live-ptp4l",
        "the live clock-log reader",
        20_000 * u64::from(scale),
        "lines",
        t,
    );

    let cpus = std::thread::available_parallelism().map_or(1, |n| n.get());
    let per = |id: &str| out.iter().find(|m| m.id == id).map_or(0.0, |m| m.per_s);
    let sizing = vec![
        SizingRow {
            what: "receivers at 1 Hz, live decode (UBX)",
            per_core: per("obs-live-ubx") * 0.5,
        },
        SizingRow {
            what: "receivers at 1 Hz, trust assessment (NMEA)",
            per_core: per("receiver-trust-nmea") * 0.5,
        },
        SizingRow {
            what: "SDR channels at 4 MS/s, power and spectral monitors",
            per_core: per("iq-monitor") * 0.5 / fs,
        },
        SizingRow {
            what: "clock servo logs at 1 line/s",
            per_core: per("clock-live-ptp4l") * 0.5,
        },
    ];
    Ok(Report {
        schema: "kshana.bench-speed/1",
        engine: env!("CARGO_PKG_VERSION"),
        platform: format!("{}-{}", std::env::consts::OS, std::env::consts::ARCH),
        cpus,
        repeats,
        calibration_s,
        workloads: out,
        sizing,
    })
}

/// Compare `now` with a `baseline` report of the same schema: the workloads whose ratio to the
/// calibration grew by more than `tolerance` (0.10 for 10 %), as (id, baseline ratio, new ratio).
pub fn regressions(
    now: &Report,
    baseline: &serde_json::Value,
    tolerance: f64,
) -> Vec<(String, f64, f64)> {
    let mut out = Vec::new();
    for m in &now.workloads {
        let base = baseline["workloads"]
            .as_array()
            .and_then(|a| a.iter().find(|w| w["id"] == m.id))
            .and_then(|w| w["ratio_to_calibration"].as_f64());
        if let Some(b) = base {
            if m.ratio_to_calibration > b * (1.0 + tolerance) {
                out.push((m.id.to_string(), b, m.ratio_to_calibration));
            }
        }
    }
    out
}

/// Usage text for `kshana bench-speed`.
pub fn usage() -> String {
    crate::t!("bench-speed-usage")
}

/// `kshana bench-speed [--repeats <n>] [--quick] [--json <out.json>] [--baseline <old.json>
/// [--tolerance <fraction>]]`.
pub fn run_cli(args: &[String]) -> Result<(), String> {
    let flag = |k: &str| {
        args.iter()
            .position(|a| a == k)
            .and_then(|i| args.get(i + 1))
    };
    for (i, a) in args.iter().enumerate() {
        let valued = ["--repeats", "--json", "--baseline", "--tolerance"];
        let after_value = i > 0 && valued.contains(&args[i - 1].as_str());
        if !after_value && !valued.contains(&a.as_str()) && a != "--quick" {
            return Err(usage());
        }
    }
    let repeats = match flag("--repeats") {
        Some(v) => v
            .parse::<usize>()
            .ok()
            .filter(|n| *n >= 1)
            .ok_or_else(usage)?,
        None => 5,
    };
    let tolerance = match flag("--tolerance") {
        Some(v) => v
            .parse::<f64>()
            .ok()
            .filter(|x| *x > 0.0)
            .ok_or_else(usage)?,
        None => 0.10,
    };
    let r = run(repeats, args.iter().any(|a| a == "--quick"))?;
    let json = serde_json::to_string_pretty(&r).map_err(|e| e.to_string())?;
    if let Some(p) = flag("--json") {
        std::fs::write(p, format!("{json}\n")).map_err(|e| format!("{p}: {e}"))?;
    }
    println!(
        "{}",
        crate::t!(
            "bench-speed-head",
            platform = r.platform.clone(),
            cpus = r.cpus,
            calib = format!("{:.4}", r.calibration_s)
        )
    );
    for m in &r.workloads {
        println!(
            "{}",
            crate::t!(
                "bench-speed-row",
                id = format!("{:<22}", m.id),
                rate = format!("{:>14.0}", m.per_s),
                unit = m.unit,
                ratio = format!("{:.3}", m.ratio_to_calibration)
            )
        );
    }
    println!("{}", crate::t!("bench-speed-sizing"));
    for s in &r.sizing {
        println!("  {:>12.0}  {}", s.per_core, s.what);
    }
    if let Some(p) = flag("--baseline") {
        let base: serde_json::Value =
            serde_json::from_str(&std::fs::read_to_string(p).map_err(|e| format!("{p}: {e}"))?)
                .map_err(|e| format!("{p}: {e}"))?;
        let reg = regressions(&r, &base, tolerance);
        if !reg.is_empty() {
            let lines: Vec<String> = reg
                .iter()
                .map(|(id, b, n)| format!("{id}: x{b:.3} -> x{n:.3}"))
                .collect();
            return Err(crate::terr!(
                "e-bench-speed-regression",
                tolerance = format!("{:.0}", tolerance * 100.0),
                list = lines.join("; ")
            ));
        }
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_quick_run_measures_every_workload_and_flags_a_regression() {
        let r = run(1, true).unwrap();
        assert_eq!(r.workloads.len(), 5);
        assert!(r
            .workloads
            .iter()
            .all(|m| m.per_s > 0.0 && m.ratio_to_calibration > 0.0));
        assert_eq!(r.sizing.len(), 4);
        let mut base = serde_json::to_value(&r).unwrap();
        assert!(regressions(&r, &base, 0.10).is_empty());
        // A baseline twice as fast: every workload has regressed.
        for w in base["workloads"].as_array_mut().unwrap() {
            let x = w["ratio_to_calibration"].as_f64().unwrap();
            w["ratio_to_calibration"] = serde_json::json!(x / 2.0);
        }
        assert_eq!(regressions(&r, &base, 0.10).len(), 5);
    }

    #[test]
    fn the_synthetic_logs_decode() {
        let station = crate::obs::Station {
            id: "bench".into(),
            ..Default::default()
        };
        let n = |r: Vec<crate::obs::Record>| {
            r.iter()
                .filter(|x| matches!(x, crate::obs::Record::Epoch(_)))
                .count()
        };
        assert_eq!(
            n(crate::obs::from_log("ubx", &ubx_log(10), &station).unwrap()),
            10
        );
        assert_eq!(
            n(crate::obs::from_log("nmea", nmea_log(10).as_bytes(), &station).unwrap()),
            10
        );
    }
}
