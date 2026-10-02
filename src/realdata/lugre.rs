// SPDX-License-Identifier: AGPL-3.0-only
//! LuGRE (Lunar GNSS Receiver Experiment) mission data: the Level 0 telemetry and sample
//! batch formats of the Qascom QN400-Space receiver flown on Firefly's Blue Ghost Mission 1
//! (January to March 2025), as published in Zenodo record 16411687 (CC BY 4.0, Parker et al.).
//!
//! The formats follow the receiver interface control document shipped with the data
//! (NIL-TN-QAS-024 issue 2.0) and the LuGRE product handbook (ESC-LUGRE-HDBK-0075):
//!
//! - **IQS** sample batches (`IQS_L1_*.bin`): one QN400 frame, a 10-byte frame header
//!   (preamble `q`, message type `IQS`, sender, payload length), a 52-byte payload header
//!   ([`IqsHeader`]: receiver time, number of complex samples, sample type, spectrum inversion,
//!   quantisation bits, sampling, carrier and intermediate frequencies, bandwidth), the IQ
//!   samples, and a 3-byte cyclic redundancy check. The `.sdrx` metadata beside each file
//!   ([`crate::realdata::ion_sdr`]) describes the same layout; [`IqsHeader::disagreements`]
//!   lists where the two disagree, because they do: for two of the published batches the
//!   metadata gives 4-bit samples at 8 Msps while the binary header (and the operations table)
//!   gives 8 bits for one and 4 Msps for the other.
//! - **RAW** (pseudorange, Doppler, carrier phase and C/N0 per satellite per second), **ACQ**
//!   (acquisition records: Doppler, code phase, correlator values, C/N0) and **NAV** (the
//!   onboard least-squares solution) as the ASCII text the handbook describes, one message per
//!   line of `key: value` fields.
//! - **CLK** and **EPH** comma-separated files.
//!
//! Times are receiver time in seconds of GPS time since the GPS epoch (1980-01-06). Signal
//! identifiers: 0 GPS L1 C/A, 1 GPS L5, 2 Galileo E1-B/C, 3 Galileo E5a, 4 Galileo E5b.

use super::ion_sdr::{SampleFormat, SdrLayout};

/// Signal identifier of GPS L1 C/A in the LuGRE telemetry.
pub const SIGNAL_GPS_L1CA: u8 = 0;

/// Bytes before the samples in an IQS file: frame header (10) plus payload header (52).
pub const IQS_HEADER_BYTES: usize = 62;
/// Bytes after the samples: the 24-bit cyclic redundancy check.
pub const IQS_FOOTER_BYTES: usize = 3;

/// The payload header of an IQS sample batch.
#[derive(Clone, Debug, PartialEq)]
pub struct IqsHeader {
    /// Receiver time of the first sample (s of GPS time since the GPS epoch).
    pub rx_time_s: f64,
    /// Number of complex samples.
    pub n_samples: u32,
    /// Sample type: 0 one real channel, 1 one complex channel, 2 two real, 3 two complex.
    pub samples_type: u8,
    /// Spectrum inversion flag.
    pub spectrum_inversion: u16,
    /// Quantisation bits per component.
    pub quant_bits: u8,
    /// Sampling frequency (Hz).
    pub sampling_freq_hz: f64,
    /// Carrier central frequency (Hz).
    pub central_freq_hz: f64,
    /// Intermediate frequency (Hz).
    pub intermediate_freq_hz: f64,
    /// Signal bandwidth (Hz).
    pub bandwidth_hz: f64,
    /// Payload length the frame header states (bytes).
    pub payload_bytes: u32,
}

fn f64_le(b: &[u8]) -> f64 {
    f64::from_le_bytes(b[..8].try_into().expect("8 bytes"))
}

impl IqsHeader {
    /// Parse the first [`IQS_HEADER_BYTES`] of an IQS file.
    pub fn parse(bytes: &[u8]) -> Result<Self, String> {
        if bytes.len() < IQS_HEADER_BYTES {
            return Err(format!(
                "{} bytes: shorter than the IQS header",
                bytes.len()
            ));
        }
        if bytes[0] != b'q' || &bytes[1..4] != b"IQS" {
            return Err(format!("not an IQS frame: {:?}", &bytes[..4]));
        }
        let payload_bytes = u32::from_le_bytes(bytes[6..10].try_into().expect("4 bytes"));
        let p = &bytes[10..];
        Ok(IqsHeader {
            rx_time_s: f64_le(&p[0..]),
            n_samples: u32::from_le_bytes(p[8..12].try_into().expect("4 bytes")),
            samples_type: p[16],
            spectrum_inversion: u16::from_le_bytes([p[17], p[18]]),
            quant_bits: p[19],
            sampling_freq_hz: f64_le(&p[20..]),
            central_freq_hz: f64_le(&p[28..]),
            intermediate_freq_hz: f64_le(&p[36..]),
            bandwidth_hz: f64_le(&p[44..]),
            payload_bytes,
        })
    }

    /// Bytes the samples occupy: `N·M/4` for complex samples, `ceil(N·M/8)` otherwise.
    pub fn sample_bytes(&self) -> usize {
        let nm = self.n_samples as usize * self.quant_bits as usize;
        if self.samples_type % 2 == 1 {
            nm / 4
        } else {
            nm.div_ceil(8)
        }
    }

    /// Every way the `.sdrx` layout disagrees with this header (empty when they agree), for a
    /// file of `file_len` bytes.
    pub fn disagreements(&self, layout: &SdrLayout, file_len: usize) -> Vec<String> {
        let mut v = Vec::new();
        if layout.sample_rate_hz != self.sampling_freq_hz {
            v.push(format!(
                "sample rate: metadata {} Hz, header {} Hz",
                layout.sample_rate_hz, self.sampling_freq_hz
            ));
        }
        if layout.quantization != self.quant_bits as u32 {
            v.push(format!(
                "quantisation: metadata {} bits, header {} bits",
                layout.quantization, self.quant_bits
            ));
        }
        if layout.center_freq_hz != self.central_freq_hz {
            v.push(format!(
                "centre frequency: metadata {} Hz, header {} Hz",
                layout.center_freq_hz, self.central_freq_hz
            ));
        }
        if layout.translated_freq_hz != self.intermediate_freq_hz {
            v.push(format!(
                "intermediate frequency: metadata {} Hz, header {} Hz",
                layout.translated_freq_hz, self.intermediate_freq_hz
            ));
        }
        let complex = self.samples_type % 2 == 1;
        if complex == (layout.format == SampleFormat::If) {
            v.push("sample type: real against complex".into());
        }
        if layout.sample_count(file_len) != self.n_samples as usize {
            v.push(format!(
                "sample count: metadata layout gives {}, header {}",
                layout.sample_count(file_len),
                self.n_samples
            ));
        }
        if layout.header_bytes != IQS_HEADER_BYTES || layout.footer_bytes != IQS_FOOTER_BYTES {
            v.push(format!(
                "header/footer: metadata {}/{} bytes, format {IQS_HEADER_BYTES}/{IQS_FOOTER_BYTES}",
                layout.header_bytes, layout.footer_bytes
            ));
        }
        if file_len != IQS_HEADER_BYTES + self.sample_bytes() + IQS_FOOTER_BYTES {
            v.push(format!(
                "file length {file_len} is not header + {} sample bytes + footer",
                self.sample_bytes()
            ));
        }
        v
    }
}

/// The `key: value` fields of one telemetry text line, with any bracketed group
/// (`measures: [ … ]`, `acfCorr: [ … ]`) returned separately as its list of tokens.
/// `key: value` pairs and bracketed groups of one telemetry line.
type Fields = (Vec<(String, String)>, Vec<(String, Vec<String>)>);

fn fields(line: &str) -> Fields {
    let mut flat = Vec::new();
    let mut groups = Vec::new();
    let toks: Vec<&str> = line.split_whitespace().collect();
    let mut i = 0;
    while i < toks.len() {
        if let Some(key) = toks[i].strip_suffix(':') {
            if i + 1 < toks.len() && toks[i + 1] == "[" {
                let mut j = i + 2;
                let mut inner = Vec::new();
                while j < toks.len() && toks[j] != "]" {
                    inner.push(toks[j].to_string());
                    j += 1;
                }
                groups.push((key.to_string(), inner));
                i = j + 1;
                continue;
            }
            if i + 1 < toks.len() {
                flat.push((key.to_string(), toks[i + 1].to_string()));
                i += 2;
                continue;
            }
        }
        i += 1;
    }
    (flat, groups)
}

fn get<T: std::str::FromStr>(f: &[(String, String)], key: &str) -> Result<T, String> {
    f.iter()
        .find(|(k, _)| k == key)
        .ok_or(format!("field {key} missing"))?
        .1
        .parse()
        .map_err(|_| format!("field {key} unreadable"))
}

/// One satellite measurement of a RAW message.
#[derive(Clone, Debug, PartialEq)]
pub struct RawMeasure {
    /// Signal identifier (0 GPS L1 C/A, …).
    pub signal_id: u8,
    /// Satellite identifier (PRN).
    pub svid: u16,
    /// Raw pseudorange (m).
    pub pr_raw_m: f64,
    /// Carrier-to-noise density (dB-Hz).
    pub cn0_dbhz: f64,
    /// Tracking-loop Doppler (Hz).
    pub doppler_hz: f64,
    /// Doppler rate (Hz/s).
    pub doppler_rate_hz_s: f64,
    /// Accumulated Doppler, the carrier phase (m).
    pub carrier_phase_m: f64,
}

/// One RAW message: an epoch and its measurements.
#[derive(Clone, Debug, PartialEq)]
pub struct RawEpoch {
    /// Receiver time (s of GPS time since the GPS epoch).
    pub rx_time_s: f64,
    /// Measurements at the epoch (possibly none).
    pub measures: Vec<RawMeasure>,
}

/// Parse a `TLM_RAW_*.txt` file.
pub fn parse_raw(text: &str) -> Result<Vec<RawEpoch>, String> {
    let mut out = Vec::new();
    for (n, line) in text.lines().enumerate() {
        if line.trim().is_empty() {
            continue;
        }
        let ctx = |e: String| format!("RAW line {}: {e}", n + 1);
        let (flat, groups) = fields(line);
        if get::<String>(&flat, "messageType").map_err(ctx)? != "RAW" {
            return Err(ctx("not a RAW message".into()));
        }
        let rx_time_s = get(&flat, "rxTime").map_err(ctx)?;
        let mut measures = Vec::new();
        if let Some((_, toks)) = groups.iter().find(|(k, _)| k == "measures") {
            let (m, _) = fields(&toks.join(" "));
            // One measurement per `svid` key; the keys repeat in a fixed set per measurement.
            let starts: Vec<usize> = m
                .iter()
                .enumerate()
                .filter(|(_, (k, _))| k == "svid")
                .map(|(i, _)| i)
                .collect();
            for (s, &i0) in starts.iter().enumerate() {
                let i1 = starts.get(s + 1).copied().unwrap_or(m.len());
                let rec = &m[i0..i1];
                measures.push(RawMeasure {
                    svid: get(rec, "svid").map_err(ctx)?,
                    signal_id: get(rec, "signalId").map_err(ctx)?,
                    pr_raw_m: get(rec, "prRaw").map_err(ctx)?,
                    cn0_dbhz: get(rec, "cn0").map_err(ctx)?,
                    doppler_hz: get(rec, "fdRaw").map_err(ctx)?,
                    doppler_rate_hz_s: get(rec, "fdRateRaw").map_err(ctx)?,
                    carrier_phase_m: get(rec, "accDoppler").map_err(ctx)?,
                });
            }
        }
        out.push(RawEpoch {
            rx_time_s,
            measures,
        });
    }
    Ok(out)
}

/// One ACQ message: an acquisition record of the flight receiver.
#[derive(Clone, Debug, PartialEq)]
pub struct AcqRecord {
    /// Receiver time (s of GPS time since the GPS epoch).
    pub rx_time_s: f64,
    /// Signal identifier.
    pub signal_id: u8,
    /// Satellite identifier (PRN).
    pub svid: u16,
    /// Acquisition Doppler (Hz).
    pub doppler_hz: f64,
    /// Acquisition code phase (chips).
    pub code_phase_chips: f64,
    /// Correlator values around the peak.
    pub acf_corr: Vec<f64>,
    /// Averaged noise floor of the correlator window.
    pub noise_floor: Option<f64>,
    /// Estimated C/N0 (dB-Hz).
    pub cn0_dbhz: Option<f64>,
}

/// Parse a `TLM_ACQ_*.txt` file.
pub fn parse_acq(text: &str) -> Result<Vec<AcqRecord>, String> {
    let mut out = Vec::new();
    for (n, line) in text.lines().enumerate() {
        if line.trim().is_empty() {
            continue;
        }
        let ctx = |e: String| format!("ACQ line {}: {e}", n + 1);
        let (flat, groups) = fields(line);
        if get::<String>(&flat, "messageType").map_err(ctx)? != "ACQ" {
            return Err(ctx("not an ACQ message".into()));
        }
        let acf_corr = groups
            .iter()
            .find(|(k, _)| k == "acfCorr")
            .map(|(_, t)| t.iter().filter_map(|v| v.parse().ok()).collect())
            .unwrap_or_default();
        out.push(AcqRecord {
            rx_time_s: get(&flat, "rxTime").map_err(ctx)?,
            signal_id: get(&flat, "signalId").map_err(ctx)?,
            svid: get(&flat, "svid").map_err(ctx)?,
            doppler_hz: get(&flat, "doppler").map_err(ctx)?,
            code_phase_chips: get(&flat, "codePhase").map_err(ctx)?,
            acf_corr,
            noise_floor: get(&flat, "noiseFloor").ok(),
            cn0_dbhz: get(&flat, "cn0").ok(),
        });
    }
    Ok(out)
}

/// One NAV message: the onboard least-squares solution (Earth-fixed). Not truth: it is the
/// receiver's own estimate, usable only as a solver comparison.
#[derive(Clone, Debug, PartialEq)]
pub struct NavSolution {
    /// Receiver time (s of GPS time since the GPS epoch).
    pub rx_time_s: f64,
    /// Satellites used.
    pub n_sat: u32,
    /// Position, Earth-centred Earth-fixed (m).
    pub pos_m: [f64; 3],
    /// Velocity, Earth-centred Earth-fixed (m/s).
    pub vel_m_s: [f64; 3],
    /// Reported position accuracy (m).
    pub pos_std_m: f64,
    /// Receiver clock offset (m).
    pub clock_bias_m: f64,
    /// Receiver clock drift (m/s).
    pub clock_drift_m_s: f64,
    /// Geometric dilution of precision.
    pub gdop: f64,
}

/// Parse a `TLM_NAV_*.txt` file.
pub fn parse_nav(text: &str) -> Result<Vec<NavSolution>, String> {
    let mut out = Vec::new();
    for (n, line) in text.lines().enumerate() {
        if line.trim().is_empty() {
            continue;
        }
        let ctx = |e: String| format!("NAV line {}: {e}", n + 1);
        let (f, _) = fields(line);
        out.push(NavSolution {
            rx_time_s: get(&f, "rxTime").map_err(ctx)?,
            n_sat: get(&f, "nSat").map_err(ctx)?,
            pos_m: [
                get(&f, "posX").map_err(ctx)?,
                get(&f, "posY").map_err(ctx)?,
                get(&f, "posZ").map_err(ctx)?,
            ],
            vel_m_s: [
                get(&f, "velX").map_err(ctx)?,
                get(&f, "velY").map_err(ctx)?,
                get(&f, "velZ").map_err(ctx)?,
            ],
            pos_std_m: get(&f, "posStd").map_err(ctx)?,
            clock_bias_m: get(&f, "clockBias").map_err(ctx)?,
            clock_drift_m_s: get(&f, "clockDrift").map_err(ctx)?,
            gdop: get(&f, "GDOP").map_err(ctx)?,
        });
    }
    Ok(out)
}

/// Parse a `TLM_CLK_*.csv` file: `(receiver time s, clock bias m, clock drift m/s)` rows.
pub fn parse_clk(text: &str) -> Result<Vec<(f64, f64, f64)>, String> {
    text.lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .enumerate()
        .map(|(n, l)| {
            let v: Vec<f64> = l
                .split(',')
                .map(|x| x.trim().parse::<f64>())
                .collect::<Result<_, _>>()
                .map_err(|_| format!("CLK row {}: unreadable", n + 2))?;
            match v.as_slice() {
                [t, b, d] => Ok((*t, *b, *d)),
                _ => Err(format!(
                    "CLK row {}: {} columns, expected 3",
                    n + 2,
                    v.len()
                )),
            }
        })
        .collect()
}

/// The GPS L1 C/A C/N0 of every RAW measurement, as `(receiver time s, PRN, dB-Hz)`.
pub fn gps_l1ca_cn0(epochs: &[RawEpoch]) -> Vec<(f64, u8, f64)> {
    epochs
        .iter()
        .flat_map(|e| {
            e.measures
                .iter()
                .filter(|m| m.signal_id == SIGNAL_GPS_L1CA)
                .map(move |m| (e.rx_time_s, m.svid as u8, m.cn0_dbhz))
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    const RAW: &str = "senderId: 0 messageType: RAW rxTime: 1421026677.65449 measures: [ ]\n\
senderId: 0 messageType: RAW rxTime: 1421026678.65449 measures: [ svid: 36 prRaw: 195768279.822843 cn0: 38.3626704668493 signalId: 2 fdRaw: -12371.703595763 accDoppler: 195769659.688294 fdRateRaw: 12.9436107589995 svid: 7 prRaw: 1.5e8 cn0: 31.5 signalId: 0 fdRaw: 100.5 accDoppler: 2.0 fdRateRaw: 0.1 ]\n";

    #[test]
    fn raw_messages_split_per_satellite() {
        let e = parse_raw(RAW).unwrap();
        assert_eq!(e.len(), 2);
        assert!(e[0].measures.is_empty());
        assert_eq!(e[1].measures.len(), 2);
        assert_eq!(e[1].measures[0].svid, 36);
        assert_eq!(e[1].measures[0].signal_id, 2);
        assert_eq!(e[1].measures[1].cn0_dbhz, 31.5);
        assert_eq!(gps_l1ca_cn0(&e), vec![(1421026678.65449, 7, 31.5)]);
    }

    #[test]
    fn acq_and_nav_and_clk_parse() {
        let acq = "senderId: 0 messageType: ACQ rxTime: 1421026640.01748 signalId: 0 svid: 18 doppler: -12448.04296875 codePhase: 725.307 acfCorr: [ 1 2 3 ] noiseFloor: 4.5 acqMode: 1 cn0: 33.25\n";
        let a = parse_acq(acq).unwrap();
        assert_eq!(a[0].svid, 18);
        assert_eq!(a[0].acf_corr, vec![1.0, 2.0, 3.0]);
        assert_eq!(a[0].cn0_dbhz, Some(33.25));
        let nav = "senderId: 0 messageType: NAV rxTime: 1.5 appName: NAV wn: 2349 tow: 316417 decimals: 0.43 nSat: 5 posX: 1 posY: 2 posZ: 3 velX: 4 velY: 5 velZ: 6 posStd: 7 velStd: 8 timStd: 9 clockBias: 10 clockDrift: 11 ggto: 0 GDOP: 12 PDOP: 1 HDOP: 1 VDOP: 1 TDOP: 1\n";
        let n = parse_nav(nav).unwrap();
        assert_eq!(
            (n[0].pos_m, n[0].gdop, n[0].n_sat),
            ([1.0, 2.0, 3.0], 12.0, 5)
        );
        let c =
            parse_clk("Receiver Time [s],Clock Bias [m],ClockDrift [m/s]\n1.5,2.5,3.5\n").unwrap();
        assert_eq!(c, vec![(1.5, 2.5, 3.5)]);
    }

    #[test]
    fn iqs_header_round_trip_and_disagreements() {
        let mut b = vec![0u8; IQS_HEADER_BYTES];
        b[0] = b'q';
        b[1..4].copy_from_slice(b"IQS");
        b[6..10].copy_from_slice(&(52u32 + 8).to_le_bytes());
        let p = &mut b[10..];
        p[0..8].copy_from_slice(&1.5e9f64.to_le_bytes());
        p[8..12].copy_from_slice(&8u32.to_le_bytes());
        p[16] = 1;
        p[19] = 8;
        p[20..28].copy_from_slice(&4.0e6f64.to_le_bytes());
        p[28..36].copy_from_slice(&1575.42e6f64.to_le_bytes());
        let h = IqsHeader::parse(&b).unwrap();
        assert_eq!(
            (h.n_samples, h.quant_bits, h.sampling_freq_hz),
            (8, 8, 4.0e6)
        );
        assert_eq!(h.sample_bytes(), 16);
        // A metadata layout claiming 4-bit samples at 8 Msps disagrees on both.
        let layout = SdrLayout {
            url: String::new(),
            sample_rate_hz: 8e6,
            center_freq_hz: 1575.42e6,
            translated_freq_hz: 0.0,
            quantization: 4,
            packed_bits: 8,
            align_left: false,
            format: SampleFormat::Iq,
            encoding: super::super::ion_sdr::Encoding::TwosComplement,
            word_bytes: 1,
            words_per_chunk: 1,
            little_endian: true,
            fill_lsb_first: false,
            pad_head: false,
            samples_per_lump: 1,
            header_bytes: IQS_HEADER_BYTES,
            footer_bytes: IQS_FOOTER_BYTES,
        };
        let d = h.disagreements(&layout, IQS_HEADER_BYTES + 16 + IQS_FOOTER_BYTES);
        assert!(d.iter().any(|s| s.starts_with("sample rate")), "{d:?}");
        assert!(d.iter().any(|s| s.starts_with("quantisation")), "{d:?}");
        assert!(d.iter().any(|s| s.starts_with("sample count")), "{d:?}");
        assert!(IqsHeader::parse(b"xIQS").is_err());
    }
}
