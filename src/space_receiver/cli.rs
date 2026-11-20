// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana space-receiver <clock|timestamps|dynamics|bench|mms|od-vs-tle>`: JSON to standard output or to
//! `--out`. Exit 0 on success, 2 on a usage or input error. See `docs/SPACE-RECEIVER.md`.

use super::{bench, clock, dynamics, mms, od_vs_tle, timestamps};
use crate::ssv::constellations::{Band, Constellation};
use crate::ssv::sweep::UserOrbit;

/// Run the command; returns the exit code.
pub fn run(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

struct Opts {
    positional: Vec<String>,
    pairs: Vec<(String, String)>,
}

impl Opts {
    fn get(&self, k: &str) -> Option<&str> {
        self.pairs
            .iter()
            .rev()
            .find(|(a, _)| a == k)
            .map(|(_, v)| v.as_str())
    }
    fn all(&self, k: &str) -> Vec<String> {
        self.pairs
            .iter()
            .filter(|(a, _)| a == k)
            .map(|(_, v)| v.clone())
            .collect()
    }
    fn num(&self, k: &str) -> Result<Option<f64>, String> {
        match self.get(k) {
            None => Ok(None),
            Some(v) => num(k, v).map(Some),
        }
    }
}

fn num(option: &str, v: &str) -> Result<f64, String> {
    v.parse::<f64>()
        .ok()
        .filter(|x| x.is_finite())
        .ok_or_else(|| crate::terr!("e-space-receiver-bad-number", option = option, value = v))
}

fn parse(args: &[String], known: &[&str]) -> Result<Opts, String> {
    let mut o = Opts {
        positional: Vec::new(),
        pairs: Vec::new(),
    };
    let mut it = args.iter();
    while let Some(a) = it.next() {
        if a.starts_with("--") {
            if !known.contains(&a.as_str()) {
                return Err(crate::terr!("e-space-receiver-unknown-option", option = a));
            }
            if a == "--list" || a == "--sidelobes" {
                o.pairs.push((a.clone(), String::new()));
                continue;
            }
            let v = it
                .next()
                .ok_or_else(|| crate::terr!("e-space-receiver-missing-value", option = a))?;
            o.pairs.push((a.clone(), v.clone()));
        } else {
            o.positional.push(a.clone());
        }
    }
    Ok(o)
}

fn unknown(name: &str, known: &[&str]) -> String {
    crate::terr!(
        "e-space-receiver-unknown-name",
        name = name,
        known = known.join(", ")
    )
}

fn orbit(spec: Option<&str>) -> Result<UserOrbit, String> {
    let spec = spec.unwrap_or("geo");
    if let Some(o) = dynamics::preset(spec) {
        return Ok(o);
    }
    let parts: Vec<&str> = spec.split(',').collect();
    if parts.len() == 3 {
        let a_km = num("--orbit", parts[0])?;
        let e = num("--orbit", parts[1])?;
        let i_deg = num("--orbit", parts[2])?;
        if a_km > 6378.0 && (0.0..1.0).contains(&e) {
            return Ok(UserOrbit {
                a_km,
                e,
                i_deg,
                raan_deg: 0.0,
                argp_deg: 0.0,
                true_anomaly_deg: 0.0,
            });
        }
        return Err(crate::terr!(
            "e-space-receiver-bad-number",
            option = "--orbit",
            value = spec
        ));
    }
    Err(unknown(spec, dynamics::PRESETS))
}

fn oscillator(name: Option<&str>) -> Result<clock::Oscillator, String> {
    let n = name.unwrap_or("ocxo");
    clock::oscillator(n).ok_or_else(|| unknown(n, clock::OSCILLATORS))
}

fn emit<T: serde::Serialize>(doc: &T, out: Option<&str>) -> Result<(), String> {
    let text = serde_json::to_string_pretty(doc).map_err(|e| e.to_string())?;
    match out {
        Some(p) => std::fs::write(p, text + "\n")
            .map_err(|e| crate::terr!("e-space-receiver-cannot-write", path = p, e = e)),
        None => {
            println!("{text}");
            Ok(())
        }
    }
}

fn run_inner(args: &[String]) -> Result<(), String> {
    let Some(sub) = args.first() else {
        return Err(crate::t!("space-receiver-usage"));
    };
    if args.iter().any(|a| a == "--help" || a == "-h") || sub == "help" {
        println!("{}", crate::t!("space-receiver-usage"));
        return Ok(());
    }
    let rest = &args[1..];
    match sub.as_str() {
        "clock" => {
            let o = parse(
                rest,
                &[
                    "--orbit",
                    "--oscillator",
                    "--temp-swing",
                    "--outage-min",
                    "--out",
                ],
            )?;
            let mut extra = Vec::new();
            for v in o.all("--outage-min") {
                extra.push(num("--outage-min", &v)? * 60.0);
            }
            let rep = clock::clock_report(
                orbit(o.get("--orbit"))?,
                oscillator(o.get("--oscillator"))?,
                o.num("--temp-swing")?.unwrap_or(0.0),
                &extra,
            );
            emit(&rep, o.get("--out"))
        }
        "timestamps" => {
            let o = parse(
                rest,
                &[
                    "--oscillator",
                    "--step-floor",
                    "--gap-factor",
                    "--window",
                    "--out",
                ],
            )?;
            let [path] = o.positional.as_slice() else {
                return Err(crate::t!("space-receiver-usage"));
            };
            let text = std::fs::read_to_string(path)
                .map_err(|e| crate::terr!("e-space-receiver-cannot-read", path = path, e = e))?;
            let rows = timestamps::parse_csv(&text)?;
            let mut p = timestamps::Params::default();
            if let Some(v) = o.num("--step-floor")? {
                p.step_floor_s = v;
            }
            if let Some(v) = o.num("--gap-factor")? {
                p.gap_factor = v;
            }
            if let Some(v) = o.num("--window")? {
                if v < 4.0 {
                    return Err(crate::terr!(
                        "e-space-receiver-bad-number",
                        option = "--window",
                        value = v
                    ));
                }
                p.window = v as usize;
            }
            let rep = timestamps::detect(&rows, &oscillator(o.get("--oscillator"))?, &p);
            emit(&rep, o.get("--out"))
        }
        "dynamics" => {
            let o = parse(
                rest,
                &[
                    "--orbit",
                    "--duration-min",
                    "--step-s",
                    "--band",
                    "--max-off-boresight",
                    "--max-doppler",
                    "--max-doppler-rate",
                    "--out",
                ],
            )?;
            let orb = orbit(o.get("--orbit"))?;
            let band = match o.get("--band").unwrap_or("l1") {
                "l1" => Band::L1,
                "l5" => Band::L5,
                b => return Err(unknown(b, &["l1", "l5"])),
            };
            let duration_s = match o.num("--duration-min")? {
                Some(m) => m * 60.0,
                None => (orb.period_min() * 60.0).min(4.0 * clock::DAY_S),
            };
            let rep = dynamics::run(&dynamics::Config {
                orbit: orb,
                duration_s,
                step_s: o.num("--step-s")?.unwrap_or(60.0),
                constellations: Constellation::ALL.to_vec(),
                band,
                max_off_boresight_deg: o.num("--max-off-boresight")?.unwrap_or(90.0),
                limits: dynamics::Limits {
                    max_doppler_hz: o.num("--max-doppler")?,
                    max_doppler_rate_hz_s: o.num("--max-doppler-rate")?,
                },
            })?;
            emit(&rep, o.get("--out"))
        }
        "bench" => {
            let o = parse(
                rest,
                &[
                    "--case",
                    "--cn0",
                    "--oscillator",
                    "--max-doppler",
                    "--max-doppler-rate",
                    "--time-budget",
                    "--list",
                    "--sidelobes",
                    "--out",
                ],
            )?;
            if o.get("--list").is_some() {
                return emit(
                    &serde_json::json!({ "version": bench::VERSION, "cases": bench::CASES }),
                    o.get("--out"),
                );
            }
            let ids: Vec<&str> = bench::CASES.iter().map(|c| c.id).collect();
            let only = o.all("--case");
            for c in &only {
                if !ids.contains(&c.as_str()) {
                    return Err(unknown(c, &ids));
                }
            }
            let mut prof = bench::Profile::new(oscillator(o.get("--oscillator"))?);
            if let Some(v) = o.num("--cn0")? {
                prof.cn0_min_dbhz = v;
            }
            prof.limits = dynamics::Limits {
                max_doppler_hz: o.num("--max-doppler")?,
                max_doppler_rate_hz_s: o.num("--max-doppler-rate")?,
            };
            prof.time_budget_s = o.num("--time-budget")?;
            prof.sidelobes = o.get("--sidelobes").is_some();
            let rep = bench::run(prof, &only)?;
            emit(&rep, o.get("--out"))
        }
        "mms" => {
            let o = parse(rest, &["--cn0", "--orbits", "--step-min", "--out"])?;
            let rep = mms::run(
                o.num("--cn0")?.unwrap_or(20.0),
                o.num("--orbits")?.unwrap_or(3.0),
                o.num("--step-min")?.unwrap_or(5.0),
            )?;
            emit(&rep, o.get("--out"))
        }
        "od-vs-tle" => {
            let o = parse(rest, &["--tle", "--out"])?;
            let ([oem], Some(tle)) = (o.positional.as_slice(), o.get("--tle")) else {
                return Err(crate::t!("space-receiver-usage"));
            };
            let read = |p: &str| {
                std::fs::read_to_string(p)
                    .map_err(|e| crate::terr!("e-space-receiver-cannot-read", path = p, e = e))
            };
            let rep = od_vs_tle::compare(&read(oem)?, &read(tle)?)?;
            emit(&rep, o.get("--out"))
        }
        _ => Err(crate::t!("space-receiver-usage")),
    }
}
