// SPDX-License-Identifier: AGPL-3.0-only
//! **A GNSS-SDR configuration for a recording, so its output can be scored with Kshana.**
//!
//! [`generate`] writes the configuration file GNSS-SDR (gnss-sdr.org, GPL-3.0; a separate program,
//! nothing of it is linked or copied here) needs to process one recording that Kshana already
//! opens: the file source, the data-type adapter for the sample format, the channels, acquisition,
//! tracking and telemetry blocks for each requested signal, the observables and PVT blocks, and the
//! two monitor streams. The monitor streams go to `127.0.0.1` on the ports
//! `integrations/gnss-sdr/relay.py` listens on in its documented example (1234 for the per-channel
//! `Monitor`, 1235 for the PVT monitor), so the run can be read back with the `gnss-sdr` receiver-log
//! format (`kshana receiver-trust`, [`crate::receiver_trust::machines::gnss_sdr`]); GNSS-SDR's own
//! RINEX and NMEA output files are read with the `rinex` and `nmea` formats.
//!
//! Block and parameter names are the ones in the GNSS-SDR documentation pages for the Signal Source
//! (`File_Signal_Source`: `filename`, `item_type`, `sampling_frequency`), the Data Type Adapter
//! (`Ishort_To_Complex`, `Ibyte_To_Complex`, `Pass_Through`), Acquisition, Tracking and Telemetry
//! Decoder blocks (GPS L1 C/A `1C`, Galileo E1B `1B`, BeiDou B1I `B1`), the PVT block (`RTKLIB_PVT`,
//! `enable_monitor`, `monitor_client_addresses`, `monitor_udp_port`) and the Monitor block, read on
//! 20 November 2026. Only those three signals are generated: they are the ones whose three blocks
//! were checked against the documentation.
//!
//! The `narrowband` profile sets the GPS L1 C/A tracking loop to the narrow bandwidths after bit
//! synchronisation and a 20 ms coherent integration (`extend_correlation_symbols = 20`), the setting
//! users report trouble with: the generated file is the same benchmark configuration for everyone
//! and the run's monitor output can be scored against the default profile on the same recording.
//!
//! A generated file is a starting point, not a tuned receiver: the values are the documented
//! defaults except where this module says otherwise. Nothing here runs GNSS-SDR.

use super::io::format::SampleFormat;
use super::SampleSpec;

/// A signal GNSS-SDR processes, by its Kshana name.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SdrSignal {
    /// Kshana's signal name (`kshana iq` `--signal`).
    pub kshana: &'static str,
    /// GNSS-SDR's two-character signal code.
    pub code: &'static str,
    /// Carrier frequency, Hz.
    pub carrier_hz: f64,
    /// Acquisition implementation.
    pub acquisition: &'static str,
    /// Tracking implementation.
    pub tracking: &'static str,
    /// Telemetry decoder implementation.
    pub telemetry: &'static str,
    /// Coherent integration of one acquisition dwell, ms (one code period).
    pub acq_coherent_ms: u32,
}

/// The signals [`generate`] writes.
pub const SIGNALS: &[SdrSignal] = &[
    SdrSignal {
        kshana: "gps-l1ca",
        code: "1C",
        carrier_hz: 1_575_420_000.0,
        acquisition: "GPS_L1_CA_PCPS_Acquisition",
        tracking: "GPS_L1_CA_DLL_PLL_Tracking",
        telemetry: "GPS_L1_CA_Telemetry_Decoder",
        acq_coherent_ms: 1,
    },
    SdrSignal {
        kshana: "galileo-e1b",
        code: "1B",
        carrier_hz: 1_575_420_000.0,
        acquisition: "Galileo_E1_PCPS_Ambiguous_Acquisition",
        tracking: "Galileo_E1_DLL_PLL_VEML_Tracking",
        telemetry: "Galileo_E1B_Telemetry_Decoder",
        acq_coherent_ms: 4,
    },
    SdrSignal {
        kshana: "beidou-b1i",
        code: "B1",
        carrier_hz: 1_561_098_000.0,
        acquisition: "BEIDOU_B1I_PCPS_Acquisition",
        tracking: "BEIDOU_B1I_DLL_PLL_Tracking",
        telemetry: "BEIDOU_B1I_Telemetry_Decoder",
        acq_coherent_ms: 1,
    },
];

/// Tracking-loop settings of the generated file.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Profile {
    /// GNSS-SDR's documented defaults.
    Default,
    /// GPS L1 C/A with the narrow loop after bit synchronisation: 20 ms coherent integration, PLL
    /// 2 Hz, DLL 0.25 Hz (other signals keep the defaults).
    Narrowband,
}

/// What [`generate`] needs.
#[derive(Clone, Debug, PartialEq)]
pub struct ConfRequest {
    /// The sample file GNSS-SDR reads (`SignalSource.filename`), as written into the file.
    pub data_path: String,
    /// Its sample format.
    pub format: SampleFormat,
    /// Bytes before the first sample.
    pub header_bytes: u64,
    /// Interleaved streams in the file.
    pub channels: usize,
    /// Sampling of the file.
    pub spec: SampleSpec,
    /// Signals, each with the number of receiver channels for it.
    pub signals: Vec<(String, usize)>,
    /// Tracking profile.
    pub profile: Profile,
    /// Largest Doppler searched, Hz (the receiver's oscillator offset included).
    pub doppler_max_hz: u32,
    /// PVT output rate, ms (a multiple of 20).
    pub output_rate_ms: u32,
    /// The UDP ports of the two monitor streams `(Monitor, PVT)`; `None` leaves both off.
    pub monitor_ports: Option<(u16, u16)>,
}

/// GNSS-SDR's `item_type` and the data-type adapter for a sample format, where its file source
/// reads the format.
pub fn item_type(f: SampleFormat) -> Option<(&'static str, &'static str)> {
    if f == SampleFormat::CI16_LE {
        Some(("ishort", "Ishort_To_Complex"))
    } else if f == SampleFormat::CI8 {
        Some(("ibyte", "Ibyte_To_Complex"))
    } else if f == SampleFormat::CF32_LE {
        Some(("gr_complex", "Pass_Through"))
    } else {
        None
    }
}

/// The largest distance of a signal's carrier from the recording's centre frequency that the
/// file is generated for, Hz: GNSS-SDR's default chain expects the signal at zero frequency.
pub const MAX_CENTRE_OFFSET_HZ: f64 = 1000.0;

/// Write the configuration file for `r`, or say why GNSS-SDR's default chain cannot read it.
pub fn generate(r: &ConfRequest) -> Result<String, String> {
    let Some((item, adapter)) = item_type(r.format) else {
        return Err(crate::terr!(
            "e-iq-gnss-sdr-conf-format",
            format = r.format.name()
        ));
    };
    if r.header_bytes > 0 || r.channels > 1 {
        return Err(crate::terr!("e-iq-gnss-sdr-conf-layout"));
    }
    if r.spec.if_hz != 0.0 {
        return Err(crate::terr!("e-iq-gnss-sdr-conf-if"));
    }
    if r.signals.is_empty() {
        return Err(crate::terr!("e-iq-gnss-sdr-conf-no-signal"));
    }
    if r.output_rate_ms < 20 || !r.output_rate_ms.is_multiple_of(20) {
        return Err(crate::terr!(
            "e-iq-gnss-sdr-conf-rate",
            rate = r.output_rate_ms
        ));
    }
    let fs = r.spec.fs_hz.round() as u64;
    let mut sigs = Vec::new();
    for (name, n) in &r.signals {
        let Some(s) = SIGNALS.iter().find(|s| s.kshana == name) else {
            return Err(crate::terr!(
                "e-iq-gnss-sdr-conf-signal",
                signal = name.clone(),
                known = SIGNALS
                    .iter()
                    .map(|s| s.kshana)
                    .collect::<Vec<_>>()
                    .join(", ")
            ));
        };
        if r.spec.center_hz > 0.0 && (s.carrier_hz - r.spec.center_hz).abs() > MAX_CENTRE_OFFSET_HZ
        {
            return Err(crate::terr!(
                "e-iq-gnss-sdr-conf-centre",
                signal = name.clone(),
                offset_hz = format!("{:.0}", s.carrier_hz - r.spec.center_hz)
            ));
        }
        sigs.push((*s, (*n).max(1)));
    }
    let mut o = String::new();
    let mut line = |k: &str, v: &dyn std::fmt::Display| o.push_str(&format!("{k}={v}\n"));
    // GNSS-SDR reads `;` lines as comments.
    let mut head = String::from("[GNSS-SDR]\n");
    head.push_str(&format!(
        "; written by kshana iq gnss-sdr-conf {}: a starting point, not a tuned receiver\n",
        env!("CARGO_PKG_VERSION")
    ));
    if r.spec.center_hz == 0.0 {
        head.push_str(
            "; the recording states no centre frequency: it is assumed on the signal carrier\n",
        );
    }
    line("GNSS-SDR.internal_fs_sps", &fs);
    line("SignalSource.implementation", &"File_Signal_Source");
    line("SignalSource.filename", &r.data_path);
    line("SignalSource.item_type", &item);
    line("SignalSource.sampling_frequency", &fs);
    line("SignalSource.samples", &0);
    line("SignalSource.repeat", &false);
    line("SignalSource.enable_throttle_control", &false);
    line("SignalConditioner.implementation", &"Signal_Conditioner");
    line("DataTypeAdapter.implementation", &adapter);
    line("InputFilter.implementation", &"Pass_Through");
    line("InputFilter.item_type", &"gr_complex");
    line("Resampler.implementation", &"Pass_Through");
    line("Resampler.item_type", &"gr_complex");
    for (s, n) in &sigs {
        line(&format!("Channels_{}.count", s.code), n);
    }
    line("Channels.in_acquisition", &1);
    for (s, _) in &sigs {
        let c = s.code;
        line(&format!("Acquisition_{c}.implementation"), &s.acquisition);
        line(&format!("Acquisition_{c}.item_type"), &"gr_complex");
        line(
            &format!("Acquisition_{c}.coherent_integration_time_ms"),
            &s.acq_coherent_ms,
        );
        line(&format!("Acquisition_{c}.pfa"), &0.01);
        line(&format!("Acquisition_{c}.doppler_max"), &r.doppler_max_hz);
        line(&format!("Acquisition_{c}.doppler_step"), &250);
        line(&format!("Acquisition_{c}.max_dwells"), &1);
        line(&format!("Tracking_{c}.implementation"), &s.tracking);
        line(&format!("Tracking_{c}.item_type"), &"gr_complex");
        line(&format!("Tracking_{c}.pll_bw_hz"), &35.0);
        line(&format!("Tracking_{c}.dll_bw_hz"), &2.0);
        if r.profile == Profile::Narrowband && c == "1C" {
            line(&format!("Tracking_{c}.pll_bw_narrow_hz"), &2.0);
            line(&format!("Tracking_{c}.dll_bw_narrow_hz"), &0.25);
            line(&format!("Tracking_{c}.extend_correlation_symbols"), &20);
        }
        line(
            &format!("TelemetryDecoder_{c}.implementation"),
            &s.telemetry,
        );
    }
    line("Observables.implementation", &"Hybrid_Observables");
    line("PVT.implementation", &"RTKLIB_PVT");
    line("PVT.positioning_mode", &"Single");
    line("PVT.output_rate_ms", &r.output_rate_ms);
    line(
        "PVT.display_rate_ms",
        &(r.output_rate_ms.max(500) / r.output_rate_ms * r.output_rate_ms),
    );
    line("PVT.iono_model", &"Broadcast");
    line("PVT.trop_model", &"Saastamoinen");
    match r.monitor_ports {
        Some((ch, pvt)) => {
            line("PVT.enable_monitor", &true);
            line("PVT.monitor_client_addresses", &"127.0.0.1");
            line("PVT.monitor_udp_port", &pvt);
            line("Monitor.enable_monitor", &true);
            line("Monitor.decimation_factor", &1);
            line("Monitor.client_addresses", &"127.0.0.1");
            line("Monitor.udp_port", &ch);
        }
        None => line("Monitor.enable_monitor", &false),
    }
    Ok(head + &o)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn req() -> ConfRequest {
        ConfRequest {
            data_path: "/data/capture.bin".into(),
            format: SampleFormat::CI16_LE,
            header_bytes: 0,
            channels: 1,
            spec: SampleSpec {
                fs_hz: 4.0e6,
                center_hz: 1_575_420_000.0,
                if_hz: 0.0,
            },
            signals: vec![("gps-l1ca".into(), 8), ("galileo-e1b".into(), 4)],
            profile: Profile::Default,
            doppler_max_hz: 5000,
            output_rate_ms: 100,
            monitor_ports: Some((1234, 1235)),
        }
    }

    fn get<'a>(text: &'a str, key: &str) -> Option<&'a str> {
        text.lines()
            .find_map(|l| l.strip_prefix(key)?.strip_prefix('='))
    }

    #[test]
    fn a_ci16_recording_gets_the_short_adapter_and_both_signals() {
        let t = generate(&req()).unwrap();
        assert!(t.starts_with("[GNSS-SDR]\n"));
        assert_eq!(get(&t, "SignalSource.item_type"), Some("ishort"));
        assert_eq!(
            get(&t, "DataTypeAdapter.implementation"),
            Some("Ishort_To_Complex")
        );
        assert_eq!(get(&t, "SignalSource.sampling_frequency"), Some("4000000"));
        assert_eq!(get(&t, "Channels_1C.count"), Some("8"));
        assert_eq!(get(&t, "Channels_1B.count"), Some("4"));
        assert_eq!(
            get(&t, "TelemetryDecoder_1B.implementation"),
            Some("Galileo_E1B_Telemetry_Decoder")
        );
        assert_eq!(get(&t, "Monitor.udp_port"), Some("1234"));
        assert_eq!(get(&t, "PVT.monitor_udp_port"), Some("1235"));
        assert_eq!(get(&t, "PVT.display_rate_ms"), Some("500"));
        assert!(get(&t, "Tracking_1C.extend_correlation_symbols").is_none());
        // every line is a comment, the section header or key=value
        for l in t.lines() {
            assert!(
                l.starts_with(';') || l == "[GNSS-SDR]" || l.contains('='),
                "{l}"
            );
        }
    }

    #[test]
    fn the_narrowband_profile_extends_gps_l1ca_only() {
        let mut r = req();
        r.profile = Profile::Narrowband;
        let t = generate(&r).unwrap();
        assert_eq!(
            get(&t, "Tracking_1C.extend_correlation_symbols"),
            Some("20")
        );
        assert_eq!(get(&t, "Tracking_1C.pll_bw_narrow_hz"), Some("2"));
        assert!(get(&t, "Tracking_1B.extend_correlation_symbols").is_none());
    }

    #[test]
    fn what_the_default_chain_cannot_read_is_refused() {
        let mut r = req();
        r.format = SampleFormat::parse("cu8").unwrap();
        assert!(generate(&r).is_err());
        let mut r = req();
        r.header_bytes = 512;
        assert!(generate(&r).is_err());
        let mut r = req();
        r.signals = vec![("beidou-b1i".into(), 4)]; // 14 MHz from the centre
        assert!(generate(&r).is_err());
        let mut r = req();
        r.output_rate_ms = 30;
        assert!(generate(&r).is_err());
        let mut r = req();
        r.signals = vec![("gps-l5i".into(), 4)];
        assert!(generate(&r).is_err());
    }
}
