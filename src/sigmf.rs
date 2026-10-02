// SPDX-License-Identifier: AGPL-3.0-only
//! **Signal Metadata Format (SigMF) recordings: read and write complex IQ.**
//!
//! SigMF is the open recording format used across the software-defined-radio community:
//! a recording is a pair of files, a JSON metadata file (`.sigmf-meta`) and a raw sample
//! file (`.sigmf-data`) holding interleaved in-phase and quadrature (IQ) samples in the
//! data type the metadata names. This module converts between that pair and the engine's
//! complex sample type ([`crate::sdr::Cf64`]), so a real recording can be brought in, its
//! power spectral density estimated ([`crate::spectrum::welch_psd`]) and compared with the
//! modelled spectrum, and a modelled signal can be written out for another tool.
//!
//! Everything here works on strings and byte buffers. Reading and writing the files
//! themselves is the caller's business, which keeps the module free of filesystem access
//! and usable from the WebAssembly build.
//!
//! ## What is supported
//!
//! * `core:datatype` `cf32_le` (32-bit float I and Q, little-endian), `ci16_le` (16-bit
//!   signed integer I and Q, little-endian) and `ci8` (8-bit signed integer I and Q). The
//!   integer decoders are the raw-IF loader [`crate::realdata::iqif::load_iq`], so the two
//!   ingest paths cannot drift. Other data types (real-valued, big-endian, unsigned,
//!   64-bit) are refused with a message naming the type rather than misread.
//! * The `global`, `captures` and `annotations` objects, with the `core:` fields listed on
//!   [`Global`], [`Capture`] and [`Annotation`]. Fields outside that list are ignored on
//!   read and not written, so a round trip keeps the fields this module knows.
//! * A single-channel recording. `core:num_channels` above one is refused.
//!
//! Writing stamps `core:version` as `1.0.0`, the SigMF release every field written here
//! belongs to. Reading accepts any version string.
//!
//! Reference: the SigMF specification, <https://github.com/sigmf/SigMF> (`sigmf-spec.md`).

use crate::sdr::Cf64;
use serde::{Deserialize, Serialize};

/// The SigMF specification version written into `core:version`.
pub const SIGMF_VERSION: &str = "1.0.0";

/// The complex sample encodings this module reads and writes.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DataType {
    /// 32-bit IEEE-754 float I then Q, little-endian (8 bytes per sample).
    Cf32Le,
    /// 16-bit signed integer I then Q, little-endian (4 bytes per sample).
    Ci16Le,
    /// 8-bit signed integer I then Q (2 bytes per sample).
    Ci8,
}

impl DataType {
    /// Parse a `core:datatype` string. Anything other than a complex type this module
    /// supports is an error that names the type.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s {
            "cf32_le" => Ok(DataType::Cf32Le),
            "ci16_le" => Ok(DataType::Ci16Le),
            "ci8" => Ok(DataType::Ci8),
            other => Err(format!(
                "unsupported SigMF core:datatype {other:?}: this reader handles the complex \
                 types cf32_le, ci16_le and ci8"
            )),
        }
    }

    /// The `core:datatype` string.
    pub fn as_str(self) -> &'static str {
        match self {
            DataType::Cf32Le => "cf32_le",
            DataType::Ci16Le => "ci16_le",
            DataType::Ci8 => "ci8",
        }
    }

    /// Bytes per complex sample.
    pub fn bytes_per_sample(self) -> usize {
        match self {
            DataType::Cf32Le => 8,
            DataType::Ci16Le => 4,
            DataType::Ci8 => 2,
        }
    }
}

/// The SigMF `global` object: the fields this module reads and writes.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Global {
    /// `core:datatype`, e.g. `cf32_le`.
    #[serde(rename = "core:datatype")]
    pub datatype: String,
    /// `core:sample_rate` in samples per second.
    #[serde(
        rename = "core:sample_rate",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub sample_rate: Option<f64>,
    /// `core:version`, the SigMF specification version.
    #[serde(rename = "core:version")]
    pub version: String,
    /// `core:num_channels`; only single-channel recordings are read.
    #[serde(
        rename = "core:num_channels",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub num_channels: Option<u32>,
    /// `core:description`.
    #[serde(
        rename = "core:description",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub description: Option<String>,
    /// `core:author`.
    #[serde(
        rename = "core:author",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub author: Option<String>,
    /// `core:recorder`, the software that wrote the recording.
    #[serde(
        rename = "core:recorder",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub recorder: Option<String>,
    /// `core:hw`, a description of the recording hardware.
    #[serde(rename = "core:hw", default, skip_serializing_if = "Option::is_none")]
    pub hw: Option<String>,
}

/// One entry of the SigMF `captures` array.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Capture {
    /// `core:sample_start`, the first sample this capture segment describes.
    #[serde(rename = "core:sample_start")]
    pub sample_start: u64,
    /// `core:frequency`, the centre frequency of the recording in hertz.
    #[serde(
        rename = "core:frequency",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub frequency: Option<f64>,
    /// `core:datetime`, an ISO-8601 timestamp of the first sample.
    #[serde(
        rename = "core:datetime",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub datetime: Option<String>,
}

/// One entry of the SigMF `annotations` array.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Annotation {
    /// `core:sample_start`.
    #[serde(rename = "core:sample_start")]
    pub sample_start: u64,
    /// `core:sample_count`.
    #[serde(
        rename = "core:sample_count",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub sample_count: Option<u64>,
    /// `core:freq_lower_edge` in hertz.
    #[serde(
        rename = "core:freq_lower_edge",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub freq_lower_edge: Option<f64>,
    /// `core:freq_upper_edge` in hertz.
    #[serde(
        rename = "core:freq_upper_edge",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub freq_upper_edge: Option<f64>,
    /// `core:label`.
    #[serde(
        rename = "core:label",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub label: Option<String>,
    /// `core:comment`.
    #[serde(
        rename = "core:comment",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub comment: Option<String>,
}

/// A SigMF metadata document.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Meta {
    /// The `global` object.
    pub global: Global,
    /// The `captures` array.
    #[serde(default)]
    pub captures: Vec<Capture>,
    /// The `annotations` array.
    #[serde(default)]
    pub annotations: Vec<Annotation>,
}

impl Meta {
    /// A minimal metadata document for a single-capture recording at `sample_rate_hz`
    /// centred on `centre_hz`.
    pub fn new(dt: DataType, sample_rate_hz: f64, centre_hz: f64, description: &str) -> Self {
        Meta {
            global: Global {
                datatype: dt.as_str().to_string(),
                sample_rate: Some(sample_rate_hz),
                version: SIGMF_VERSION.to_string(),
                num_channels: None,
                description: if description.is_empty() {
                    None
                } else {
                    Some(description.to_string())
                },
                author: None,
                recorder: Some(format!("kshana {}", env!("CARGO_PKG_VERSION"))),
                hw: None,
            },
            captures: vec![Capture {
                sample_start: 0,
                frequency: Some(centre_hz),
                datetime: None,
            }],
            annotations: Vec::new(),
        }
    }

    /// The recording's data type.
    pub fn datatype(&self) -> Result<DataType, String> {
        DataType::parse(&self.global.datatype)
    }

    /// The centre frequency of the first capture, if the recording states one.
    pub fn centre_hz(&self) -> Option<f64> {
        self.captures.first().and_then(|c| c.frequency)
    }
}

/// Parse a `.sigmf-meta` JSON document.
pub fn parse_meta(json: &str) -> Result<Meta, String> {
    let meta: Meta =
        serde_json::from_str(json).map_err(|e| format!("invalid SigMF metadata: {e}"))?;
    if let Some(ch) = meta.global.num_channels {
        if ch != 1 {
            return Err(format!(
                "SigMF core:num_channels = {ch}: only single-channel recordings are read"
            ));
        }
    }
    meta.datatype()?;
    Ok(meta)
}

/// Serialise a metadata document as pretty-printed `.sigmf-meta` JSON.
pub fn meta_to_json(meta: &Meta) -> Result<String, String> {
    serde_json::to_string_pretty(meta).map_err(|e| format!("cannot serialise SigMF metadata: {e}"))
}

/// Serialise `meta` with extension fields of one SigMF extension namespace (`ns`), the way
/// the SigMF specification lets a recording carry fields outside `core:`: the namespace is
/// declared in `global.core:extensions` (`name`, `version`, `optional: true`), `global` is
/// merged into the `global` object and `annotations[i]` into the `i`-th annotation. Every key
/// must start with `ns:`, and none may overwrite a field already written.
///
/// This is how the [`crate::lunar_afs`] generator writes its truth labels beside the samples;
/// [`annotation_extension_fields`] reads them back.
pub fn meta_to_json_with_extensions(
    meta: &Meta,
    ns: &str,
    version: &str,
    global: &serde_json::Map<String, serde_json::Value>,
    annotations: &[serde_json::Map<String, serde_json::Value>],
) -> Result<String, String> {
    use serde_json::{json, Value};
    if ns.is_empty() || ns == "core" || !ns.chars().all(|c| c.is_ascii_alphanumeric() || c == '_') {
        return Err(format!("invalid SigMF extension namespace {ns:?}"));
    }
    if annotations.len() > meta.annotations.len() {
        return Err(format!(
            "{} annotation extension maps for {} annotations",
            annotations.len(),
            meta.annotations.len()
        ));
    }
    let prefix = format!("{ns}:");
    let mut v =
        serde_json::to_value(meta).map_err(|e| format!("cannot serialise SigMF metadata: {e}"))?;
    let merge = |obj: &mut serde_json::Map<String, Value>, ext: &serde_json::Map<String, Value>| {
        for (k, val) in ext {
            if !k.starts_with(&prefix) {
                return Err(format!("extension key {k:?} is not in namespace {ns:?}"));
            }
            if obj.contains_key(k) {
                return Err(format!("extension key {k:?} is already present"));
            }
            obj.insert(k.clone(), val.clone());
        }
        Ok(())
    };
    let g = v["global"]
        .as_object_mut()
        .ok_or("global is not an object")?;
    let decl = json!({"name": ns, "version": version, "optional": true});
    match g.get_mut("core:extensions") {
        Some(Value::Array(a)) => a.push(decl),
        _ => {
            g.insert("core:extensions".into(), json!([decl]));
        }
    }
    merge(g, global)?;
    let anns = v["annotations"]
        .as_array_mut()
        .ok_or("annotations is not an array")?;
    for (a, ext) in anns.iter_mut().zip(annotations) {
        merge(a.as_object_mut().ok_or("annotation is not an object")?, ext)?;
    }
    serde_json::to_string_pretty(&v).map_err(|e| format!("cannot serialise SigMF metadata: {e}"))
}

/// The `ns:` extension fields of the `global` object and of every annotation of a SigMF
/// metadata document, in order (an annotation without such fields gives an empty map).
#[allow(clippy::type_complexity)]
pub fn annotation_extension_fields(
    json: &str,
    ns: &str,
) -> Result<
    (
        serde_json::Map<String, serde_json::Value>,
        Vec<serde_json::Map<String, serde_json::Value>>,
    ),
    String,
> {
    let v: serde_json::Value =
        serde_json::from_str(json).map_err(|e| format!("invalid SigMF metadata JSON: {e}"))?;
    let prefix = format!("{ns}:");
    let pick = |o: &serde_json::Value| -> serde_json::Map<String, serde_json::Value> {
        o.as_object()
            .map(|m| {
                m.iter()
                    .filter(|(k, _)| k.starts_with(&prefix))
                    .map(|(k, v)| (k.clone(), v.clone()))
                    .collect()
            })
            .unwrap_or_default()
    };
    let g = pick(&v["global"]);
    let anns = v["annotations"]
        .as_array()
        .map(|a| a.iter().map(pick).collect())
        .unwrap_or_default();
    Ok((g, anns))
}

/// Encode complex samples as a `.sigmf-data` byte buffer.
///
/// For the integer types `full_scale` is the sample magnitude mapped to the largest
/// code (32 767 for `ci16_le`, 127 for `ci8`); components beyond it saturate, and the
/// number of saturated components is returned with the bytes. It is ignored for
/// `cf32_le`, which stores the values as they are.
pub fn encode(samples: &[Cf64], dt: DataType, full_scale: f64) -> (Vec<u8>, usize) {
    let mut out = Vec::with_capacity(samples.len() * dt.bytes_per_sample());
    let mut clipped = 0usize;
    let fs = if full_scale.is_finite() && full_scale > 0.0 {
        full_scale
    } else {
        1.0
    };
    let mut quant = |v: f64, max: f64| -> f64 {
        let q = (v / fs * max).round();
        if q > max || q < -max - 1.0 {
            clipped += 1;
        }
        q.clamp(-max - 1.0, max)
    };
    for s in samples {
        match dt {
            DataType::Cf32Le => {
                out.extend_from_slice(&(s.re as f32).to_le_bytes());
                out.extend_from_slice(&(s.im as f32).to_le_bytes());
            }
            DataType::Ci16Le => {
                let i = quant(s.re, 32_767.0) as i16;
                let q = quant(s.im, 32_767.0) as i16;
                out.extend_from_slice(&i.to_le_bytes());
                out.extend_from_slice(&q.to_le_bytes());
            }
            DataType::Ci8 => {
                let i = quant(s.re, 127.0) as i8;
                let q = quant(s.im, 127.0) as i8;
                out.push(i as u8);
                out.push(q as u8);
            }
        }
    }
    (out, clipped)
}

/// Decode a `.sigmf-data` byte buffer. Integer samples are scaled so that the largest
/// code maps to `full_scale` (the inverse of [`encode`]); `cf32_le` values are returned
/// as stored. A trailing partial sample is ignored.
pub fn decode(bytes: &[u8], dt: DataType, full_scale: f64) -> Vec<Cf64> {
    use crate::realdata::iqif::{load_iq, IqFormat};
    let fs = if full_scale.is_finite() && full_scale > 0.0 {
        full_scale
    } else {
        1.0
    };
    match dt {
        DataType::Cf32Le => bytes
            .chunks_exact(8)
            .map(|c| {
                let i = f32::from_le_bytes([c[0], c[1], c[2], c[3]]) as f64;
                let q = f32::from_le_bytes([c[4], c[5], c[6], c[7]]) as f64;
                Cf64::new(i, q)
            })
            .collect(),
        DataType::Ci16Le => load_iq(bytes, IqFormat::Int16Le)
            .into_iter()
            .map(|s| s * (fs / 32_767.0))
            .collect(),
        DataType::Ci8 => load_iq(bytes, IqFormat::Int8)
            .into_iter()
            .map(|s| s * (fs / 127.0))
            .collect(),
    }
}

/// A recording held in memory: its metadata and its samples.
#[derive(Clone, Debug)]
pub struct Recording {
    /// The metadata document.
    pub meta: Meta,
    /// The complex samples, in the recording's own units (see [`decode`]).
    pub samples: Vec<Cf64>,
}

impl Recording {
    /// Sample rate in hertz, required for any spectral estimate.
    pub fn sample_rate_hz(&self) -> Result<f64, String> {
        match self.meta.global.sample_rate {
            Some(r) if r.is_finite() && r > 0.0 => Ok(r),
            _ => Err("the SigMF recording states no positive core:sample_rate".to_string()),
        }
    }
}

/// Read a recording from its metadata JSON and its data bytes. Honours the first
/// capture's `core:sample_start` as an offset into the data.
pub fn read(meta_json: &str, data: &[u8], full_scale: f64) -> Result<Recording, String> {
    let meta = parse_meta(meta_json)?;
    let dt = meta.datatype()?;
    let start = meta.captures.first().map(|c| c.sample_start).unwrap_or(0) as usize;
    let off = start.saturating_mul(dt.bytes_per_sample());
    if off > data.len() {
        return Err(format!(
            "SigMF capture starts at sample {start}, beyond the {} samples in the data",
            data.len() / dt.bytes_per_sample()
        ));
    }
    let samples = decode(&data[off..], dt, full_scale);
    Ok(Recording { meta, samples })
}

/// Write a recording: the metadata JSON and the data bytes, plus the number of
/// saturated integer components (always zero for `cf32_le`).
pub fn write(rec: &Recording, full_scale: f64) -> Result<(String, Vec<u8>, usize), String> {
    let dt = rec.meta.datatype()?;
    let json = meta_to_json(&rec.meta)?;
    let (bytes, clipped) = encode(&rec.samples, dt, full_scale);
    Ok((json, bytes, clipped))
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Extension fields are declared, merged under their namespace, refused outside it, and
    /// read back; the core fields still parse.
    #[test]
    fn extension_fields_round_trip_and_stay_namespaced() {
        let mut m = Meta::new(DataType::Ci8, 12e6, 2.492028e9, "x");
        m.annotations.push(Annotation {
            sample_start: 5,
            sample_count: Some(10),
            freq_lower_edge: None,
            freq_upper_edge: None,
            label: Some("a".into()),
            comment: None,
        });
        let mut g = serde_json::Map::new();
        g.insert("ext1:standard".into(), serde_json::json!("LSIS V1.0"));
        let mut a = serde_json::Map::new();
        a.insert("ext1:toi".into(), serde_json::json!(17));
        let js = meta_to_json_with_extensions(&m, "ext1", "0.1.0", &g, &[a.clone()]).unwrap();
        assert_eq!(parse_meta(&js).unwrap(), m);
        let (g2, anns) = annotation_extension_fields(&js, "ext1").unwrap();
        assert_eq!(g2, g);
        assert_eq!(anns, vec![a]);
        assert!(js.contains("\"core:extensions\""));
        let mut bad = serde_json::Map::new();
        bad.insert("core:label".into(), serde_json::json!("x"));
        assert!(meta_to_json_with_extensions(&m, "ext1", "0.1.0", &bad, &[]).is_err());
        assert!(meta_to_json_with_extensions(&m, "core", "0.1.0", &g, &[]).is_err());
    }

    fn ramp(n: usize) -> Vec<Cf64> {
        (0..n)
            .map(|k| {
                let x = k as f64 / n as f64;
                Cf64::new((7.0 * x).sin() * 0.9, (3.0 * x).cos() * 0.8)
            })
            .collect()
    }

    #[test]
    fn cf32_round_trip_is_exact_to_single_precision() {
        let s = ramp(1000);
        let rec = Recording {
            meta: Meta::new(DataType::Cf32Le, 2.048e6, 1_575.42e6, "ramp"),
            samples: s.clone(),
        };
        let (json, bytes, clipped) = write(&rec, 1.0).unwrap();
        assert_eq!(clipped, 0);
        assert_eq!(bytes.len(), 8 * s.len());
        let back = read(&json, &bytes, 1.0).unwrap();
        assert_eq!(back.meta, rec.meta);
        for (a, b) in s.iter().zip(&back.samples) {
            assert!((a.re - b.re).abs() < 1e-7 && (a.im - b.im).abs() < 1e-7);
        }
    }

    #[test]
    fn ci16_round_trip_is_within_half_a_code() {
        let s = ramp(1000);
        let (bytes, clipped) = encode(&s, DataType::Ci16Le, 1.0);
        assert_eq!(clipped, 0);
        let back = decode(&bytes, DataType::Ci16Le, 1.0);
        let half_code = 0.5 / 32_767.0 + 1e-12;
        for (a, b) in s.iter().zip(&back) {
            assert!((a.re - b.re).abs() <= half_code && (a.im - b.im).abs() <= half_code);
        }
    }

    #[test]
    fn integer_encoding_counts_saturation() {
        let s = vec![Cf64::new(2.0, -0.5), Cf64::new(0.1, -3.0)];
        let (_, clipped) = encode(&s, DataType::Ci16Le, 1.0);
        assert_eq!(clipped, 2);
    }

    #[test]
    fn ci16_is_little_endian_i_then_q() {
        let (bytes, _) = encode(&[Cf64::new(1.0, -1.0)], DataType::Ci16Le, 1.0);
        assert_eq!(bytes, vec![0xFF, 0x7F, 0x01, 0x80]);
    }

    #[test]
    fn metadata_uses_the_core_namespace() {
        let m = Meta::new(DataType::Ci16Le, 4e6, 1.2276e9, "");
        let json = meta_to_json(&m).unwrap();
        for key in [
            "\"core:datatype\": \"ci16_le\"",
            "\"core:sample_rate\": 4000000.0",
            "\"core:version\": \"1.0.0\"",
            "\"core:sample_start\": 0",
            "\"core:frequency\": 1227600000.0",
        ] {
            assert!(json.contains(key), "missing {key} in {json}");
        }
    }

    #[test]
    fn unsupported_types_and_channels_are_refused() {
        let real = r#"{"global":{"core:datatype":"rf32_le","core:version":"1.0.0"}}"#;
        assert!(parse_meta(real).unwrap_err().contains("rf32_le"));
        let multi = r#"{"global":{"core:datatype":"cf32_le","core:version":"1.0.0","core:num_channels":2}}"#;
        assert!(parse_meta(multi).unwrap_err().contains("num_channels"));
    }

    #[test]
    fn sample_start_offsets_into_the_data() {
        let s = ramp(10);
        let mut meta = Meta::new(DataType::Cf32Le, 1e6, 0.0, "");
        meta.captures[0].sample_start = 4;
        let (bytes, _) = encode(&s, DataType::Cf32Le, 1.0);
        let rec = read(&meta_to_json(&meta).unwrap(), &bytes, 1.0).unwrap();
        assert_eq!(rec.samples.len(), 6);
        assert!((rec.samples[0].re - s[4].re).abs() < 1e-7);
    }
}
