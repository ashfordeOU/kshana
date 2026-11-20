// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq gnss-sdr-conf`: write a GNSS-SDR configuration for a recording
//! ([`crate::iq::gnss_sdr_conf`]).

use super::{open_input, Args, Fail};
use crate::iq::gnss_sdr_conf::{generate, ConfRequest, Profile};

/// Run `kshana iq gnss-sdr-conf <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, &["--no-monitor"]).map_err(Fail::Usage)?;
    a.need_pos(1, "gnss-sdr-conf")?;
    let mut signals = Vec::new();
    for s in a.get("--signal").unwrap_or("gps-l1ca").split(',') {
        let (name, n) = match s.split_once(':') {
            Some((name, n)) => (
                name.trim(),
                n.trim().parse::<usize>().map_err(|_| {
                    Fail::Usage(crate::terr!(
                        "e-iq-cli-cannot-parse-2",
                        k = "--signal",
                        p = format!("{s:?}")
                    ))
                })?,
            ),
            None => (s.trim(), 8),
        };
        signals.push((name.to_string(), n));
    }
    let profile = match a.get("--profile").unwrap_or("default") {
        "default" => Profile::Default,
        "narrowband" => Profile::Narrowband,
        other => {
            return Err(Fail::Usage(crate::terr!(
                "e-iq-gnss-sdr-conf-profile",
                profile = other
            )))
        }
    };
    let ports: Vec<u16> = a.list("--monitor-ports").map_err(Fail::Usage)?;
    let monitor_ports = if a.has("--no-monitor") {
        None
    } else {
        match ports.as_slice() {
            [] => Some((1234, 1235)),
            [ch, pvt] => Some((*ch, *pvt)),
            _ => {
                return Err(Fail::Usage(crate::terr!(
                    "e-iq-cli-cannot-parse-2",
                    k = "--monitor-ports",
                    p = format!("{:?}", a.get("--monitor-ports").unwrap_or_default())
                )))
            }
        }
    };
    let opened = open_input(&a, 0)?;
    let [(file, _)] = opened.data_files.as_slice() else {
        return Err(Fail::Run(crate::terr!("e-iq-gnss-sdr-conf-layout")));
    };
    let data_path = std::fs::canonicalize(file)
        .unwrap_or_else(|_| file.clone())
        .display()
        .to_string();
    // The header a raw file's flags or sidecar state (SigMF data files have none).
    let header_bytes = match super::raw_sidecar(&a)? {
        Some(s) => s.header_bytes,
        None => crate::iq::io::inventory::find_sidecar(std::path::Path::new(&a.pos[0]))
            .ok()
            .flatten()
            .and_then(|(_, s)| s.header_bytes),
    }
    .unwrap_or(0);
    let req = ConfRequest {
        data_path,
        format: opened.format,
        header_bytes,
        channels: opened.channels.0,
        spec: opened.source.spec(),
        signals,
        profile,
        doppler_max_hz: a.num("--doppler-max").map_err(Fail::Usage)?.unwrap_or(5000),
        output_rate_ms: a.num("--rate-ms").map_err(Fail::Usage)?.unwrap_or(100),
        monitor_ports,
    };
    let text = generate(&req).map_err(Fail::Run)?;
    match a.get("--out") {
        Some(p) => {
            std::fs::write(p, &text).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
            Ok(crate::t!("iq-gnss-sdr-conf-written", path = p))
        }
        None => Ok(text.trim_end().to_string()),
    }
}
