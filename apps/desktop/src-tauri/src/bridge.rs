// SPDX-License-Identifier: AGPL-3.0-only
//! The native engine bridge: the Studio's engine functions that Kshana Desktop runs in
//! native code instead of WebAssembly. Each mirrors the function of the same name in
//! `src/wasm.rs` (same engine call, same return shape), so a page cannot tell the two
//! apart except by speed and by the size of what it can open.
//!
//! The receiver-trust scorers (`receiver_trust_replay`, `assess_vessel_log`) run here
//! too, so the trust page's live device panel scores natively. The other Studio
//! functions (the tool pages: telemetry, evidence and the rest) stay on the WebAssembly
//! engine in the same window; `NATIVE_FNS` is the list the page routes here.

use serde_json::{json, Value};

/// The functions the Desktop runs natively.
pub const NATIVE_FNS: &[&str] = &[
    "run",
    "run_all",
    "summary",
    "chart_svg",
    "table_csv",
    "run_human",
    "register_catalogue",
    "list_kinds",
    "kind_modules",
    "field_importance",
    "export_sp3",
    "export_omm",
    "export_oem",
    "list_examples",
    "get_example",
    "receiver_trust_replay",
    "assess_vessel_log",
    "version",
];

fn s(args: &[Value], i: usize) -> Result<&str, String> {
    args.get(i)
        .and_then(Value::as_str)
        .ok_or_else(|| format!("argument {} must be text", i + 1))
}

fn lang(args: &[Value], i: usize) -> String {
    args.get(i)
        .and_then(Value::as_str)
        .unwrap_or("en")
        .to_string()
}

/// Call engine function `name` with the page's `args`. The value is what the
/// WebAssembly function returns (a string, `null` or an object).
pub fn call(name: &str, args: &[Value]) -> Result<Value, String> {
    use kshana::api;
    match name {
        "run" => api::run_toml_lang(s(args, 0)?, &lang(args, 1)).map(|o| json!(o.json)),
        "chart_svg" => api::run_toml_lang(s(args, 0)?, &lang(args, 1)).map(|o| json!(o.svg)),
        "summary" => api::run_toml_lang(s(args, 0)?, &lang(args, 1)).map(|o| json!(o.summary)),
        "table_csv" => api::run_toml_lang(s(args, 0)?, &lang(args, 1)).map(|o| json!(o.csv)),
        "run_all" => api::run_toml_lang(s(args, 0)?, &lang(args, 1)).map(|o| {
            json!(
                json!({"json": o.json, "svg": o.svg, "summary": o.summary, "csv": o.csv})
                    .to_string()
            )
        }),
        "run_human" => api::run_toml_human(s(args, 0)?, &lang(args, 1))
            .map(|h| json!({"summary": h.summary, "svg": h.svg})),
        "register_catalogue" => {
            kshana::i18n::register_catalogue(s(args, 0)?, s(args, 1)?).map(|()| Value::Null)
        }
        "list_kinds" => match args.first().and_then(Value::as_str) {
            None => Ok(json!(api::list_scenario_kinds_json())),
            Some(l) => api::list_scenario_kinds_json_lang(l).map(|j| json!(j)),
        },
        "kind_modules" => Ok(json!(api::kind_modules_json())),
        "field_importance" => Ok(json!(api::field_importance_json())),
        "export_sp3" => api::export_sp3(s(args, 0)?).map(|x| json!(x)),
        "export_omm" => api::export_omm(s(args, 0)?).map(|x| json!(x)),
        "export_oem" => api::export_oem(s(args, 0)?).map(|x| json!(x)),
        "list_examples" => {
            let k = args
                .first()
                .and_then(Value::as_str)
                .filter(|k| !k.is_empty());
            kshana::surface::list_examples(k).map(|v| json!(v.to_string()))
        }
        "get_example" => kshana::surface::get_example(s(args, 0)?).map(|t| json!(t)),
        "receiver_trust_replay" => kshana::surface::assess_vessel_excerpt(
            s(args, 0)?,
            s(args, 1)?.as_bytes(),
            kshana::surface::MAX_INPUT_BYTES,
        )
        .and_then(|r| serde_json::to_string(&r).map_err(|e| e.to_string()))
        .map(|j| json!(j)),
        "assess_vessel_log" => kshana::surface::assess_vessel_log_json(
            s(args, 0)?,
            s(args, 1)?.as_bytes(),
            kshana::surface::MAX_INPUT_BYTES,
        )
        .map(|j| json!(j)),
        "version" => Ok(json!(env!("CARGO_PKG_VERSION"))),
        other => Err(format!(
            "{other} is not a native engine function of this build"
        )),
    }
}

/// What the Desktop knows about a file without reading it all.
pub fn file_info(path: &str) -> Result<Value, String> {
    let m = std::fs::metadata(path).map_err(|e| format!("{path}: {e}"))?;
    if !m.is_file() {
        return Err(format!("{path} is not a file"));
    }
    Ok(json!({
        "path": path,
        "name": std::path::Path::new(path).file_name().map(|n| n.to_string_lossy().to_string()),
        "bytes": m.len(),
    }))
}

/// Read at most 16 MiB of a file from `offset`, as base64. A page reads a large
/// recording piece by piece instead of loading it whole.
pub fn read_range(path: &str, offset: u64, len: u64) -> Result<Value, String> {
    use base64::Engine as _;
    use std::io::{Read, Seek, SeekFrom};
    const MAX: u64 = 16 * 1024 * 1024;
    let mut f = std::fs::File::open(path).map_err(|e| format!("{path}: {e}"))?;
    let size = f.metadata().map_err(|e| e.to_string())?.len();
    let start = offset.min(size);
    let n = len.min(MAX).min(size - start);
    f.seek(SeekFrom::Start(start)).map_err(|e| e.to_string())?;
    let mut buf = vec![0u8; n as usize];
    f.read_exact(&mut buf).map_err(|e| e.to_string())?;
    Ok(json!({
        "offset": start,
        "bytes": n,
        "eof": start + n >= size,
        "base64": base64::engine::general_purpose::STANDARD.encode(&buf),
    }))
}

/// Bytes per complex sample of an IQ sample format.
fn bytes_per_sample(format: &str) -> Option<u64> {
    match format {
        "ci8" | "cu8" => Some(2),
        "ci16" | "ci16_le" => Some(4),
        "cf32" | "cf32_le" => Some(8),
        _ => None,
    }
}

/// Probe an IQ recording of any size: its length in samples, and the mean power and
/// peak magnitude of its first `probe` samples (at most 4 Mi samples), read in blocks.
/// The file is never read whole.
pub fn iq_probe(path: &str, format: &str, probe: u64) -> Result<Value, String> {
    use std::io::Read;
    let bps = bytes_per_sample(format)
        .ok_or_else(|| format!("unknown sample format {format:?} (ci8, cu8, ci16, cf32)"))?;
    let mut f = std::fs::File::open(path).map_err(|e| format!("{path}: {e}"))?;
    let size = f.metadata().map_err(|e| e.to_string())?.len();
    let total = size / bps;
    let want = probe.clamp(1, 4 * 1024 * 1024).min(total);
    let mut left = want * bps;
    let mut buf = vec![0u8; (1 << 20) as usize];
    let (mut n, mut power, mut peak) = (0u64, 0.0f64, 0.0f64);
    while left > 0 {
        let k = (left.min(buf.len() as u64) / bps * bps) as usize;
        if k == 0 {
            break;
        }
        f.read_exact(&mut buf[..k]).map_err(|e| e.to_string())?;
        for c in buf[..k].chunks_exact(bps as usize) {
            let (i, q) = match format {
                "ci8" => (c[0] as i8 as f64 / 128.0, c[1] as i8 as f64 / 128.0),
                "cu8" => ((c[0] as f64 - 127.5) / 128.0, (c[1] as f64 - 127.5) / 128.0),
                "ci16" | "ci16_le" => (
                    i16::from_le_bytes([c[0], c[1]]) as f64 / 32768.0,
                    i16::from_le_bytes([c[2], c[3]]) as f64 / 32768.0,
                ),
                _ => (
                    f32::from_le_bytes([c[0], c[1], c[2], c[3]]) as f64,
                    f32::from_le_bytes([c[4], c[5], c[6], c[7]]) as f64,
                ),
            };
            let p = i * i + q * q;
            power += p;
            peak = peak.max(p.sqrt());
            n += 1;
        }
        left -= k as u64;
    }
    Ok(json!({
        "path": path,
        "format": format,
        "bytes": size,
        "samples": total,
        "probed_samples": n,
        "mean_power_dbfs": if n > 0 && power > 0.0 { Some(10.0 * (power / n as f64).log10()) } else { None },
        "peak_magnitude": peak,
    }))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_run_matches_the_engine_and_every_listed_function_answers() {
        let ex = call("get_example", &[json!("ephemeris")]).unwrap();
        let toml = ex.as_str().unwrap();
        let run = call("run", &[json!(toml)]).unwrap();
        let direct = kshana::api::run_toml_lang(toml, "en").unwrap();
        assert_eq!(run.as_str().unwrap(), direct.json);
        let all: Value =
            serde_json::from_str(call("run_all", &[json!(toml)]).unwrap().as_str().unwrap())
                .unwrap();
        assert_eq!(all["json"].as_str().unwrap(), direct.json);
        assert_eq!(all["summary"].as_str().unwrap(), direct.summary);
        let h = call("run_human", &[json!(toml), json!("en")]).unwrap();
        assert_eq!(h["summary"].as_str().unwrap(), direct.summary);
        assert_eq!(
            call("version", &[]).unwrap(),
            json!(env!("CARGO_PKG_VERSION"))
        );
        for f in [
            "list_kinds",
            "kind_modules",
            "field_importance",
            "list_examples",
        ] {
            assert!(call(f, &[]).is_ok(), "{f}");
        }
        assert!(call("receiver_trust", &[]).is_err());
        assert!(call("receiver_trust_replay", &[json!("")]).is_err());
        assert!(call("run", &[json!("kind = \"no-such-kind\"")]).is_err());
        assert!(call("run", &[]).is_err());
    }

    #[test]
    fn the_trust_page_demo_log_is_scored_natively_as_by_the_webassembly_engine() {
        let session = include_str!("../../../../web/studio/trust/demo/session.toml");
        let nmea = include_str!("../../../../web/studio/trust/demo/tallinn-helsinki.nmea");
        let v = call("receiver_trust_replay", &[json!(session), json!(nmea)]).unwrap();
        let rep: Value = serde_json::from_str(v.as_str().unwrap()).unwrap();
        let direct = kshana::surface::assess_vessel_excerpt(
            session,
            nmea.as_bytes(),
            kshana::surface::MAX_INPUT_BYTES,
        )
        .unwrap();
        assert_eq!(rep, serde_json::to_value(&direct).unwrap());
        assert!(rep["epochs"].as_array().unwrap().len() > 300);
        assert!(NATIVE_FNS.contains(&"receiver_trust_replay"));
    }

    #[test]
    fn a_large_recording_is_probed_without_reading_it_whole() {
        // A sparse 1 GiB file of ci16 zeros, then a known block at the start.
        let p = std::env::temp_dir().join(format!("kshana-desktop-iq-{}.ci16", std::process::id()));
        let f = std::fs::File::create(&p).unwrap();
        f.set_len(1 << 30).unwrap();
        drop(f);
        {
            use std::io::Write;
            let mut f = std::fs::OpenOptions::new().write(true).open(&p).unwrap();
            // 1000 samples of I = 0.5 FS, Q = 0: power 0.25 (-6.02 dBFS).
            for _ in 0..1000 {
                f.write_all(&16384i16.to_le_bytes()).unwrap();
                f.write_all(&0i16.to_le_bytes()).unwrap();
            }
        }
        let path = p.to_str().unwrap();
        let v = iq_probe(path, "ci16", 1000).unwrap();
        assert_eq!(v["samples"], (1u64 << 30) / 4);
        assert_eq!(v["probed_samples"], 1000);
        assert!((v["mean_power_dbfs"].as_f64().unwrap() + 6.0206).abs() < 1e-3);
        assert_eq!(file_info(path).unwrap()["bytes"], 1u64 << 30);
        let r = read_range(path, (1 << 30) - 10, 100).unwrap();
        assert_eq!(r["bytes"], 10);
        assert_eq!(r["eof"], true);
        assert!(iq_probe(path, "xyz", 10).is_err());
        std::fs::remove_file(&p).unwrap();
    }
}
