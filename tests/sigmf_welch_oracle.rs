// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the matrix row "SigMF recording input and output, and Welch spectral
//! estimates of complex IQ" (`sigmf`, `spectrum::welch_psd`).
//!
//! Oracle kind: **Library**. Three independent third-party references, none written, run
//! or published by this project:
//!
//! * SciPy 1.18.1 `scipy.signal.welch` (BSD-3-Clause) computes the Welch power spectral
//!   density of the same samples with the same window (periodic Hann), segment length,
//!   overlap, density scaling, no detrending, two-sided output and mean averaging.
//! * sigmf-python 1.13.0 (LGPL-3.0, run as a tool by the fixture generator only, never
//!   linked or copied) writes the third-party recordings this test reads, and reads back
//!   the recordings this crate writes.
//! * The SigMF specification v1.2.6 metadata schema (`sigmf-schema.json`, CC BY-SA 4.0),
//!   applied with jsonschema 4.26.0 to the metadata this crate writes.
//!
//! Tolerances, fixed before the first comparison was run (2026-10-01) and not changed
//! afterwards:
//!
//! 1. Welch PSD: every bin `|kshana - scipy| <= 1e-12 * |scipy|`; bin frequencies within
//!    `1e-12 * fs`; segment counts equal. Cases: cf32_le, ci16_le and ci8 recordings,
//!    `nfft` in {64, 256, 512}, overlap in {0, 0.5, 0.75}.
//! 2. Reading third-party recordings: samples decoded by [`sigmf::read`] bit-identical to
//!    sigmf-python's `read_samples(autoscale=False)` (or `read_samples_in_capture(0)` when
//!    the first capture starts past sample 0), compared through the SHA-256 of the
//!    little-endian f64 I, Q stream; every `core:` field this crate models identical to
//!    what sigmf-python wrote.
//! 3. Writing: the recordings this crate writes today are byte-identical to the committed
//!    ones that sigmf-python read back; sigmf-python's decoded samples are bit-identical to
//!    the samples this crate encoded; the metadata fields are identical; the schema
//!    reported zero errors and sigmf-python's own `validate()` passed.
//!
//! The fixture, its generator and its provenance are in `tests/fixtures/sigmf_welch_oracle/`
//! (`gen_sigmf_welch_oracle.py`, `reference.json`, `NOTICE.md`). To regenerate: run this
//! test once with `KSHANA_REGEN_SIGMF_ORACLE=1` (it rewrites `kshana_written/`), then run
//! the generator under the oracle toolchain's Python.

use kshana::sdr::Cf64;
use kshana::sigmf::{self, Annotation, Capture, DataType, Meta, Recording};
use kshana::spectrum::welch_psd;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::path::{Path, PathBuf};

const PSD_REL_TOL: f64 = 1e-12;
const FREQ_TOL_FRACTION_OF_FS: f64 = 1e-12;

fn fixture_dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/sigmf_welch_oracle")
}

fn sha256_hex(bytes: &[u8]) -> String {
    hex::encode(Sha256::digest(bytes))
}

/// SHA-256 of the samples as the little-endian f64 stream I0, Q0, I1, Q1, ...
fn samples_sha256(samples: &[Cf64]) -> String {
    let mut h = Sha256::new();
    for s in samples {
        h.update(s.re.to_le_bytes());
        h.update(s.im.to_le_bytes());
    }
    hex::encode(h.finalize())
}

/// The recordings this crate writes for sigmf-python to read back. Integer cases carry
/// exact integer codes at full scale = the largest code, so encoding is lossless and the
/// expected decoded value of every component is the code itself; the float case carries
/// values exactly representable in single precision.
fn kshana_written_cases() -> Vec<(&'static str, DataType, f64, Vec<Cf64>)> {
    let cf32: Vec<Cf64> = (0..1024u64)
        .map(|k| {
            Cf64::new(
                ((k * 37) % 2001) as f64 / 1024.0 - 1000.0 / 1024.0,
                ((k * 53 + 11) % 1999) as f64 / 2048.0 - 999.0 / 2048.0,
            )
        })
        .collect();
    let ci16: Vec<Cf64> = (0..1024u64)
        .map(|k| {
            Cf64::new(
                ((k * 7919) % 65536) as f64 - 32768.0,
                ((k * 104_729 + 3) % 65536) as f64 - 32768.0,
            )
        })
        .collect();
    let ci8: Vec<Cf64> = (0..512u64)
        .map(|k| {
            Cf64::new(
                ((k * 31) % 256) as f64 - 128.0,
                ((k * 97 + 5) % 256) as f64 - 128.0,
            )
        })
        .collect();
    vec![
        ("ks_cf32", DataType::Cf32Le, 1.0, cf32),
        ("ks_ci16", DataType::Ci16Le, 32_767.0, ci16),
        ("ks_ci8", DataType::Ci8, 127.0, ci8),
    ]
}

fn kshana_meta(dt: DataType) -> Meta {
    let mut m = Meta::new(
        dt,
        2.048e6,
        1_575_420_000.0,
        "kshana-written oracle recording",
    );
    // The default recorder string carries the crate version; pin it so the committed
    // bytes do not change with every release.
    m.global.recorder = Some("kshana sigmf oracle fixture".to_string());
    m.global.author = Some("ashfordeOU".to_string());
    m.global.hw = Some("synthetic, no hardware".to_string());
    m.captures = vec![Capture {
        sample_start: 0,
        frequency: Some(1_575_420_000.0),
        datetime: Some("2026-10-01T00:00:00.000Z".to_string()),
    }];
    m.annotations = vec![Annotation {
        sample_start: 16,
        sample_count: Some(128),
        freq_lower_edge: Some(1_574_420_000.0),
        freq_upper_edge: Some(1_576_420_000.0),
        label: Some("L1".to_string()),
        comment: Some("annotation written by kshana".to_string()),
    }];
    m
}

fn opt_str(v: &Value) -> Option<String> {
    v.as_str().map(str::to_string)
}
fn opt_f64(v: &Value) -> Option<f64> {
    v.as_f64()
}
fn opt_u64(v: &Value) -> Option<u64> {
    v.as_u64()
}

/// How sigmf-python reported the metadata it read.
#[derive(Clone, Copy, PartialEq)]
enum Reader {
    /// The field set sigmf-python wrote itself: compared verbatim.
    Writer,
    /// sigmf-python reading a file this crate wrote. On read it reports its own
    /// specification version (the file's value is kept as `declared_version`) and inserts
    /// the specification's default `core:num_channels = 1` when the file omits it.
    ReadBack,
}

/// Compare every `core:` field the crate models with the field set sigmf-python reported.
fn assert_fields_identical(name: &str, meta: &Meta, fields: &Value, reader: Reader) {
    let g = &fields["global"];
    assert_eq!(
        Some(meta.global.datatype.clone()),
        opt_str(&g["core:datatype"]),
        "{name}: core:datatype"
    );
    assert_eq!(
        meta.global.sample_rate,
        opt_f64(&g["core:sample_rate"]),
        "{name}: core:sample_rate"
    );
    let version = match reader {
        Reader::Writer => &g["core:version"],
        Reader::ReadBack => &fields["declared_version"],
    };
    assert_eq!(
        Some(meta.global.version.clone()),
        opt_str(version),
        "{name}: core:version"
    );
    let channels = match (reader, meta.global.num_channels) {
        (Reader::ReadBack, None) => Some(1),
        (_, n) => n.map(u64::from),
    };
    assert_eq!(
        channels,
        opt_u64(&g["core:num_channels"]),
        "{name}: core:num_channels"
    );
    assert_eq!(
        meta.global.description,
        opt_str(&g["core:description"]),
        "{name}: core:description"
    );
    assert_eq!(
        meta.global.author,
        opt_str(&g["core:author"]),
        "{name}: core:author"
    );
    assert_eq!(
        meta.global.recorder,
        opt_str(&g["core:recorder"]),
        "{name}: core:recorder"
    );
    assert_eq!(meta.global.hw, opt_str(&g["core:hw"]), "{name}: core:hw");

    let caps = fields["captures"].as_array().expect("captures array");
    assert_eq!(meta.captures.len(), caps.len(), "{name}: capture count");
    for (i, (c, r)) in meta.captures.iter().zip(caps).enumerate() {
        assert_eq!(
            Some(c.sample_start),
            opt_u64(&r["core:sample_start"]),
            "{name}: capture {i} sample_start"
        );
        assert_eq!(
            c.frequency,
            opt_f64(&r["core:frequency"]),
            "{name}: capture {i} frequency"
        );
        assert_eq!(
            c.datetime,
            opt_str(&r["core:datetime"]),
            "{name}: capture {i} datetime"
        );
    }
    let anns = fields["annotations"].as_array().expect("annotations array");
    assert_eq!(
        meta.annotations.len(),
        anns.len(),
        "{name}: annotation count"
    );
    for (i, (a, r)) in meta.annotations.iter().zip(anns).enumerate() {
        assert_eq!(
            Some(a.sample_start),
            opt_u64(&r["core:sample_start"]),
            "{name}: annotation {i} sample_start"
        );
        assert_eq!(
            a.sample_count,
            opt_u64(&r["core:sample_count"]),
            "{name}: annotation {i} sample_count"
        );
        assert_eq!(
            a.freq_lower_edge,
            opt_f64(&r["core:freq_lower_edge"]),
            "{name}: annotation {i} freq_lower_edge"
        );
        assert_eq!(
            a.freq_upper_edge,
            opt_f64(&r["core:freq_upper_edge"]),
            "{name}: annotation {i} freq_upper_edge"
        );
        assert_eq!(
            a.label,
            opt_str(&r["core:label"]),
            "{name}: annotation {i} label"
        );
        assert_eq!(
            a.comment,
            opt_str(&r["core:comment"]),
            "{name}: annotation {i} comment"
        );
    }
}

fn read_fixture(rel: &str) -> Vec<u8> {
    let p = fixture_dir().join(rel);
    std::fs::read(&p).unwrap_or_else(|e| panic!("cannot read fixture {}: {e}", p.display()))
}

#[test]
fn welch_and_sigmf_io_match_scipy_and_sigmf_python() {
    // Regeneration mode: write the crate's recordings for the generator to read back.
    if std::env::var_os("KSHANA_REGEN_SIGMF_ORACLE").is_some() {
        let dir = fixture_dir().join("kshana_written");
        std::fs::create_dir_all(&dir).unwrap();
        for (name, dt, full_scale, samples) in kshana_written_cases() {
            let rec = Recording {
                meta: kshana_meta(dt),
                samples,
            };
            let (json, bytes, clipped) = sigmf::write(&rec, full_scale).unwrap();
            assert_eq!(clipped, 0, "{name}: the fixture codes must not saturate");
            std::fs::write(dir.join(format!("{name}.sigmf-meta")), json).unwrap();
            std::fs::write(dir.join(format!("{name}.sigmf-data")), bytes).unwrap();
        }
        eprintln!(
            "KSHANA_REGEN_SIGMF_ORACLE: rewrote {}; now run the generator",
            dir.display()
        );
        return;
    }

    let reference: Value =
        serde_json::from_slice(&read_fixture("reference.json")).expect("reference.json parses");

    // 1 and 2: third-party recordings written by sigmf-python.
    let third = reference["third_party"]
        .as_array()
        .expect("third_party array");
    assert!(
        third.len() >= 5,
        "expected at least five third-party recordings"
    );
    let mut psd_cases = 0usize;
    let mut worst_rel = 0.0f64;
    for rec_ref in third {
        let name = rec_ref["name"].as_str().unwrap();
        let meta_json = String::from_utf8(read_fixture(rec_ref["meta"].as_str().unwrap())).unwrap();
        let data = read_fixture(rec_ref["data"].as_str().unwrap());
        assert_eq!(
            sha256_hex(&data),
            rec_ref["data_sha256"].as_str().unwrap(),
            "{name}: data file is the one the generator wrote"
        );
        let full_scale = rec_ref["full_scale"].as_f64().unwrap();
        let rec = sigmf::read(&meta_json, &data, full_scale)
            .unwrap_or_else(|e| panic!("{name}: kshana refused a sigmf-python recording: {e}"));

        assert_eq!(
            rec.samples.len() as u64,
            rec_ref["n_samples"].as_u64().unwrap(),
            "{name}: sample count"
        );
        assert_eq!(
            samples_sha256(&rec.samples),
            rec_ref["decoded_sha256"].as_str().unwrap(),
            "{name}: decoded samples are not bit-identical to sigmf-python's"
        );
        assert_fields_identical(name, &rec.meta, &rec_ref["fields"], Reader::Writer);

        let fs = rec.sample_rate_hz().unwrap();
        for w in rec_ref["welch"].as_array().unwrap() {
            let nfft = w["nfft"].as_u64().unwrap() as usize;
            let overlap = w["overlap"].as_f64().unwrap();
            let est = welch_psd(&rec.samples, fs, nfft, overlap).unwrap();
            assert_eq!(
                est.segments as u64,
                w["segments"].as_u64().unwrap(),
                "{name} nfft {nfft} overlap {overlap}: segment count"
            );
            let f_ref: Vec<f64> = w["freq_hz"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| v.as_f64().unwrap())
                .collect();
            let p_ref: Vec<f64> = w["psd"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| v.as_f64().unwrap())
                .collect();
            assert_eq!(est.psd.len(), p_ref.len(), "{name}: bin count");
            for (i, (&f, &fr)) in est.freq_hz.iter().zip(&f_ref).enumerate() {
                assert!(
                    (f - fr).abs() <= FREQ_TOL_FRACTION_OF_FS * fs,
                    "{name} nfft {nfft} bin {i}: frequency {f} vs scipy {fr}"
                );
            }
            for (i, (&p, &pr)) in est.psd.iter().zip(&p_ref).enumerate() {
                let rel = (p - pr).abs() / pr.abs();
                worst_rel = worst_rel.max(rel);
                assert!(
                    rel <= PSD_REL_TOL,
                    "{name} nfft {nfft} overlap {overlap} bin {i}: kshana {p:e} vs scipy {pr:e}, relative {rel:e}"
                );
            }
            psd_cases += 1;
        }
    }
    assert_eq!(
        psd_cases, 27,
        "every pre-registered Welch case was compared"
    );
    eprintln!("Welch vs scipy: {psd_cases} cases, worst per-bin relative difference {worst_rel:e}");

    // 3: recordings this crate writes, read back by sigmf-python and checked against the
    // SigMF v1.2.6 schema by the generator.
    let written = reference["kshana_written"]
        .as_array()
        .expect("kshana_written array");
    let cases = kshana_written_cases();
    assert_eq!(written.len(), cases.len());
    for ((name, dt, full_scale, samples), w) in cases.into_iter().zip(written) {
        assert_eq!(w["name"].as_str().unwrap(), name);
        let rec = Recording {
            meta: kshana_meta(dt),
            samples: samples.clone(),
        };
        let (json, bytes, clipped) = sigmf::write(&rec, full_scale).unwrap();
        assert_eq!(clipped, 0);
        assert_eq!(
            json.as_bytes(),
            read_fixture(&format!("kshana_written/{name}.sigmf-meta")).as_slice(),
            "{name}: today's metadata differs from the recording sigmf-python validated"
        );
        assert_eq!(
            bytes,
            read_fixture(&format!("kshana_written/{name}.sigmf-data")),
            "{name}: today's data differs from the recording sigmf-python read"
        );
        assert_eq!(
            sha256_hex(&bytes),
            w["data_sha256"].as_str().unwrap(),
            "{name}: data hash"
        );
        assert_eq!(
            w["schema_errors"].as_u64(),
            Some(0),
            "{name}: SigMF v1.2.6 schema errors"
        );
        assert_eq!(
            w["sigmf_python_validate"].as_bool(),
            Some(true),
            "{name}: sigmf-python validate()"
        );
        assert_eq!(
            w["n_samples"].as_u64(),
            Some(samples.len() as u64),
            "{name}: sample count"
        );
        assert_eq!(
            w["decoded_sha256"].as_str().unwrap(),
            samples_sha256(&samples),
            "{name}: sigmf-python decoded samples are not bit-identical to the encoded ones"
        );
        assert_fields_identical(name, &rec.meta, &w["fields"], Reader::ReadBack);
    }
}
