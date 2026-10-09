// SPDX-License-Identifier: AGPL-3.0-only
//! Large-dataset IQ handling (`kshana::iq::io`): formats, streaming, resampling, SigMF
//! multi-file streams, inventory, batch runner and the `kshana iq` command group.
//!
//! References: bit-exact round trips (the encoder must invert the decoder); hand-built 2-bit
//! bytes decoded from the mapping tables in `iq::io::format`; the closed-form response of a
//! sinusoid through a linear filter (a pass-band tone keeps its frequency and amplitude, a
//! stop-band tone or image is attenuated by the design's stop-band figure); SHA-256 from the
//! `sha2` crate over the whole file read at once; and the crate's raw-IF loader
//! (`realdata::iqif::load_iq`) as the one-shot decoder for `ci16_le`.

use kshana::iq::io::format::{BitOrder, Components, Encoding, Endian, Justify, TwoBitCode};
use kshana::iq::io::inventory::{scan_dir, InventoryOptions, RecordingKind};
use kshana::iq::io::report::{results_to_csv, results_to_json};
use kshana::iq::io::sigmf_stream::{meta_for, open_sigmf_collection, write_sigmf_collection};
use kshana::iq::io::stream::{create_raw, open_raw};
use kshana::iq::io::{
    decode_samples, encode_samples, IqReader, IqWriter, PolyphaseResampler, RealIfToBaseband,
    ResampledSource, SampleFormat,
};
use kshana::iq::{Cf64, IqSink, IqSource, SampleSpec, VecSink, VecSource};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use std::path::PathBuf;

fn spec(fs: f64) -> SampleSpec {
    SampleSpec {
        fs_hz: fs,
        center_hz: 1_575_420_000.0,
        if_hz: 0.0,
    }
}

/// A fresh scratch folder for one test.
fn scratch(name: &str) -> PathBuf {
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
    let d = std::env::temp_dir().join(format!("kshana-iq-io-{}-{uniq}-{name}", std::process::id()));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn drain(src: &mut dyn IqSource, buf_len: usize) -> Vec<Cf64> {
    let mut buf = vec![Cf64::default(); buf_len];
    let mut out = Vec::new();
    loop {
        let n = src.read(&mut buf).unwrap();
        if n == 0 {
            return out;
        }
        out.extend_from_slice(&buf[..n]);
    }
}

/// Random bytes that are valid for `f` (finite floats for the float encodings).
fn random_bytes(f: SampleFormat, n_samples: usize, rng: &mut ChaCha8Rng) -> Vec<u8> {
    let n_bytes = n_samples * f.bits_per_sample() / 8;
    match f.encoding {
        Encoding::F32Le | Encoding::F32Be => {
            let mut v = Vec::with_capacity(n_bytes);
            while v.len() < n_bytes {
                let x: f32 = rng.gen_range(-1.0e6..1.0e6);
                v.extend_from_slice(&if f.encoding == Encoding::F32Le {
                    x.to_le_bytes()
                } else {
                    x.to_be_bytes()
                });
            }
            v
        }
        // 12-bit values written the way the encoder writes them (sign extension above a
        // right-justified value, zeros below a left-justified one), so re-encoding is exact.
        Encoding::I12 { endian, justify } => {
            let mut v = Vec::with_capacity(n_bytes);
            while v.len() < n_bytes {
                let x: i16 = rng.gen_range(-2048..2048);
                let w = match justify {
                    Justify::Left => (x << 4) as u16,
                    Justify::Right => x as u16,
                };
                v.extend_from_slice(&match endian {
                    Endian::Little => w.to_le_bytes(),
                    Endian::Big => w.to_be_bytes(),
                });
            }
            v
        }
        // Unsigned 12-bit: unused bits written as zero, as the encoder writes them.
        Encoding::U12 { endian, justify } => {
            let mut v = Vec::with_capacity(n_bytes);
            while v.len() < n_bytes {
                let x: u16 = rng.gen_range(0..4096);
                let w = if justify == Justify::Left { x << 4 } else { x };
                v.extend_from_slice(&match endian {
                    Endian::Little => w.to_le_bytes(),
                    Endian::Big => w.to_be_bytes(),
                });
            }
            v
        }
        Encoding::TwoBitPerByte { .. } => (0..n_bytes).map(|_| rng.gen_range(0..4u8)).collect(),
        _ => (0..n_bytes).map(|_| rng.gen()).collect(),
    }
}

/// Every format: bytes -> streaming reader -> streaming writer gives the same bytes, and
/// the decoded samples equal the one-shot decoder's.
#[test]
fn every_format_round_trips_bit_exact() {
    let mut rng = ChaCha8Rng::seed_from_u64(7);
    for f in SampleFormat::all() {
        let bytes = random_bytes(f, 1000, &mut rng);
        let mut r = IqReader::with_chunk_bytes(&bytes[..], f, spec(1e6), 100);
        let samples = drain(&mut r, 333);
        // PIN-SCOPE:    the sample count this fixture encodes, recovered by chunked reading.
        // PIN-EXCLUDES: the sample values — compared on the next line.
        assert_eq!(samples.len(), 1000, "{f}");
        assert_eq!(samples, decode_samples(f, &bytes, 1.0), "{f}");
        let mut w = IqWriter::with_chunk_bytes(Vec::new(), f, 64);
        w.write(&samples[..517]).unwrap();
        w.write(&samples[517..]).unwrap();
        w.finish().unwrap();
        assert_eq!(w.clipped(), 0, "{f}");
        assert_eq!(w.padded_elements(), 0, "{f}");
        assert_eq!(w.into_inner(), bytes, "{f}");
    }
}

/// Integer-valued samples written and read back are the same samples, with saturation
/// counted where they do not fit.
#[test]
fn integer_samples_round_trip_and_saturation_is_counted() {
    let s: Vec<Cf64> = (-100..100)
        .map(|k| Cf64::new(k as f64, -(k as f64) * 3.0))
        .collect();
    for f in [
        SampleFormat::CI16_LE,
        SampleFormat::CI16_BE,
        SampleFormat::CF32_LE,
        SampleFormat::CF32_BE,
    ] {
        let (b, clipped) = encode_samples(f, &s, 1.0);
        assert_eq!(clipped, 0);
        assert_eq!(decode_samples(f, &b, 1.0), s, "{f}");
    }
    let (_, clipped) = encode_samples(SampleFormat::CI8, &s, 1.0);
    // I = k always fits in int8; Q = -3k leaves [-128, 127] for k <= -43 (58 values) and
    // k >= 43 (57 values).
    assert_eq!(clipped, 115);
}

/// Hand-built 2-bit bytes against the mapping tables: 0x1B = 00 01 10 11, 0xE4 = 11 10 01 00.
#[test]
fn two_bit_packing_matches_hand_built_vectors() {
    let bytes = [0x1Bu8, 0xE4];
    let c = |re: f64, im: f64| Cf64::new(re, im);
    let tb = |code, order| Encoding::TwoBit { code, order };
    let cases: Vec<(SampleFormat, Vec<Cf64>)> = vec![
        (
            SampleFormat::iq(tb(TwoBitCode::TwosComplement, BitOrder::MsbFirst)),
            vec![c(1., 3.), c(-3., -1.), c(-1., -3.), c(3., 1.)],
        ),
        (
            SampleFormat::iq(tb(TwoBitCode::TwosComplement, BitOrder::LsbFirst)),
            vec![c(-1., -3.), c(3., 1.), c(1., 3.), c(-3., -1.)],
        ),
        (
            SampleFormat::iq(tb(TwoBitCode::SignMagnitude, BitOrder::MsbFirst)),
            vec![c(1., 3.), c(-1., -3.), c(-3., -1.), c(3., 1.)],
        ),
        (
            SampleFormat::iq(tb(TwoBitCode::OffsetBinary, BitOrder::MsbFirst)),
            vec![c(-3., -1.), c(1., 3.), c(3., 1.), c(-1., -3.)],
        ),
        (
            SampleFormat {
                encoding: tb(TwoBitCode::TwosComplement, BitOrder::MsbFirst),
                components: Components::Qi,
            },
            vec![c(3., 1.), c(-1., -3.), c(-3., -1.), c(1., 3.)],
        ),
        (
            SampleFormat::real(tb(TwoBitCode::SignMagnitude, BitOrder::LsbFirst)),
            [-3., -1., 3., 1., 1., 3., -1., -3.]
                .iter()
                .map(|&v| c(v, 0.))
                .collect(),
        ),
    ];
    for (f, expect) in cases {
        let got = drain(&mut IqReader::new(&bytes[..], f, spec(1e6)), 3);
        assert_eq!(got, expect, "{f}");
        let (back, _) = encode_samples(f, &expect, 1.0);
        assert_eq!(back, bytes, "{f}");
    }
    // An odd element count pads the last byte with code 00 and says so.
    let f = SampleFormat::iq(tb(TwoBitCode::OffsetBinary, BitOrder::MsbFirst));
    let mut w = IqWriter::new(Vec::new(), f);
    w.write(&[c(3., 3.)]).unwrap();
    w.finish().unwrap();
    assert_eq!(w.padded_elements(), 2);
    assert_eq!(w.into_inner(), vec![0b1111_0000]);
}

/// Single-bin DFT of `x` at `f_hz` (sample rate `fs`), normalised by the length: a complex
/// tone `A·exp(j2πft)` gives magnitude `A`.
fn tone_amplitude(x: &[Cf64], f_hz: f64, fs: f64) -> f64 {
    let (mut re, mut im) = (0.0, 0.0);
    for (k, s) in x.iter().enumerate() {
        let (sn, cs) = (-2.0 * std::f64::consts::PI * f_hz * k as f64 / fs).sin_cos();
        re += s.re * cs - s.im * sn;
        im += s.re * sn + s.im * cs;
    }
    (re * re + im * im).sqrt() / x.len() as f64
}

/// Real IF to complex baseband (closed form: `cos(2π(f_IF+δ)t)` mixed by `exp(−j2πf_IF t)`
/// is `½·exp(j2πδt)` plus an image at `−2f_IF−δ` that the low-pass removes).
#[test]
fn real_if_to_complex_recovers_a_tone_at_the_right_baseband_frequency() {
    let fs = 4.0e6;
    let f_if = 1.0e6;
    let delta = 100.0e3;
    let n = 120_000;
    let real: Vec<Cf64> = (0..n)
        .map(|k| {
            let t = k as f64 / fs;
            Cf64::new(
                (2.0 * std::f64::consts::PI * (f_if + delta) * t + 0.3).cos(),
                0.0,
            )
        })
        .collect();
    let f = SampleFormat::real(Encoding::F32Le);
    let (bytes, _) = encode_samples(f, &real, 1.0);
    let in_spec = SampleSpec {
        fs_hz: fs,
        center_hz: 1_575_420_000.0 - f_if,
        if_hz: f_if,
    };
    for invert in [false, true] {
        let reader = IqReader::new(&bytes[..], f, in_spec);
        let mut conv = RealIfToBaseband::new(reader, f_if, 2, 4096)
            .unwrap()
            .inverted(invert);
        let out_spec = conv.spec();
        assert_eq!(out_spec.fs_hz, 2.0e6);
        let rf = if invert {
            1_575_420_000.0 - 2.0 * f_if
        } else {
            1_575_420_000.0
        };
        assert_eq!(out_spec.center_hz, rf);
        let caps = conv.buffer_capacities();
        let y = drain(&mut conv, 1000);
        assert_eq!(conv.buffer_capacities(), caps);
        assert_eq!(y.len(), n / 2);
        let seg = &y[2000..22_000];
        let sign = if invert { -1.0 } else { 1.0 };
        let want = tone_amplitude(seg, sign * delta, 2.0e6);
        let image = tone_amplitude(seg, -sign * delta, 2.0e6);
        assert!((want - 0.5).abs() < 1e-3, "tone amplitude {want}");
        assert!(
            20.0 * (image / want).log10() < -70.0,
            "image only {:.1} dB down",
            20.0 * (image / want).log10()
        );
    }
}

fn complex_tone(f_hz: f64, fs: f64, n: usize) -> Vec<Cf64> {
    (0..n)
        .map(|k| {
            let p = 2.0 * std::f64::consts::PI * f_hz * k as f64 / fs;
            Cf64::new(p.cos(), p.sin())
        })
        .collect()
}

fn resample_all(rs: &mut PolyphaseResampler, x: &[Cf64]) -> Vec<Cf64> {
    let mut out = Vec::new();
    rs.process(x, &mut out);
    out
}

/// Resampler response: pass-band tones keep frequency and unit amplitude; the
/// interpolation image and an out-of-band tone that would alias are attenuated by more than
/// 75 dB (the design asks for 80 dB).
#[test]
fn resampler_response_passes_the_band_and_rejects_images_and_aliases() {
    // Up 3 / down 2: 1 MHz -> 1.5 MHz. Tone at 300 kHz; its image sits at 700 kHz.
    let mut rs = PolyphaseResampler::new(3, 2).unwrap();
    let y = resample_all(&mut rs, &complex_tone(300e3, 1e6, 40_000));
    // PIN-SCOPE:    the 3/2 resampler output count for the forty-thousand-sample tone.
    // PIN-EXCLUDES: the resampled spectrum — asserted below.
    assert_eq!(y.len(), 60_000);
    let seg = &y[3000..48_000];
    let pass = tone_amplitude(seg, 300e3, 1.5e6);
    // Images of the complex tone at the 3 MHz upsampled rate: 1.3 MHz and 2.3 MHz, which
    // land at -200 kHz and -700 kHz after the decimation by 2.
    assert!((pass - 1.0).abs() < 1e-3, "pass-band gain {pass}");
    for f in [-200e3, -700e3] {
        let image = tone_amplitude(seg, f, 1.5e6);
        assert!(
            20.0 * image.log10() < -75.0,
            "image at {f} Hz: {:.1} dB",
            20.0 * image.log10()
        );
    }

    // Decimate by 4: 4 MHz -> 1 MHz. 300 kHz passes; 1.2 MHz would alias to 200 kHz.
    let mut d = PolyphaseResampler::decimator(4).unwrap();
    let x: Vec<Cf64> = complex_tone(300e3, 4e6, 200_000)
        .iter()
        .zip(complex_tone(1.2e6, 4e6, 200_000))
        .map(|(a, b)| *a + b)
        .collect();
    let y = resample_all(&mut d, &x);
    // PIN-SCOPE:    the decimate-by-four output count for the two-hundred-thousand-sample input.
    // PIN-EXCLUDES: the decimated values — asserted below.
    assert_eq!(y.len(), 50_000);
    let seg = &y[1000..41_000];
    let pass = tone_amplitude(seg, 300e3, 1e6);
    let alias = tone_amplitude(seg, 200e3, 1e6);
    assert!((pass - 1.0).abs() < 1e-3, "pass-band gain {pass}");
    assert!(
        20.0 * alias.log10() < -75.0,
        "alias {:.1} dB",
        20.0 * alias.log10()
    );

    // DC gain is exactly the prototype's unit gain once the transient has passed.
    let mut r = PolyphaseResampler::new(5, 7).unwrap();
    let y = resample_all(&mut r, &vec![Cf64::new(1.0, -1.0); 20_000]);
    let settled = &y[1000..];
    assert!(settled
        .iter()
        .all(|s| (s.re - 1.0).abs() < 1e-3 && (s.im + 1.0).abs() < 1e-3));
}

/// Processing a stream in chunks of any size gives bit-identical output to one call.
#[test]
fn resampler_is_bit_identical_across_chunkings() {
    let mut rng = ChaCha8Rng::seed_from_u64(3);
    let x: Vec<Cf64> = (0..10_000)
        .map(|_| Cf64::new(rng.gen_range(-1.0..1.0), rng.gen_range(-1.0..1.0)))
        .collect();
    for (l, m) in [(1, 4), (3, 2), (2, 5), (7, 3)] {
        let whole = resample_all(&mut PolyphaseResampler::new(l, m).unwrap(), &x);
        let mut rs = PolyphaseResampler::new(l, m).unwrap();
        let mut out = Vec::new();
        let mut i = 0;
        while i < x.len() {
            let k = rng.gen_range(1..300).min(x.len() - i);
            rs.process(&x[i..i + k], &mut out);
            i += k;
        }
        assert_eq!(out, whole, "{l}/{m}");
        // The source adapter agrees too.
        let mut a = ResampledSource::new(
            VecSource::new(spec(1e6), x.clone()),
            PolyphaseResampler::new(l, m).unwrap(),
            777,
        );
        assert_eq!(drain(&mut a, 101), whole, "{l}/{m} adapter");
    }
}

/// A 4 MiB file read in 4 KiB chunks equals the one-shot decode (the crate's raw-IF
/// loader), and no buffer grows past its chunk size.
#[test]
fn chunked_read_of_a_multi_megabyte_file_equals_one_shot_in_bounded_memory() {
    let dir = scratch("chunked");
    let path = dir.join("big.bin");
    let mut rng = ChaCha8Rng::seed_from_u64(11);
    let n = 1 << 20; // 1 Mi samples x 4 bytes = 4 MiB
    let f = SampleFormat::CI16_LE;
    let mut w = IqWriter::with_chunk_bytes(std::fs::File::create(&path).unwrap(), f, 8192);
    let mut block = vec![Cf64::default(); 3000];
    let mut written = 0;
    while written < n {
        let k = block.len().min(n - written);
        for s in &mut block[..k] {
            *s = Cf64::new(
                rng.gen_range(-32768i32..32768) as f64,
                rng.gen_range(-32768i32..32768) as f64,
            );
        }
        w.write(&block[..k]).unwrap();
        written += k;
    }
    w.finish().unwrap();
    assert_eq!(w.staging_capacity(), 8192);
    assert_eq!(w.samples_written(), n as u64);
    assert_eq!(std::fs::metadata(&path).unwrap().len(), 4 * n as u64);

    let one_shot = decode_samples(f, &std::fs::read(&path).unwrap(), 1.0);
    let mut r = IqReader::with_chunk_bytes(std::fs::File::open(&path).unwrap(), f, spec(5e6), 4096);
    assert_eq!(r.staging_capacity(), 4096);
    let mut buf = vec![Cf64::default(); 1000];
    let mut k = 0;
    loop {
        let got = r.read(&mut buf).unwrap();
        if got == 0 {
            break;
        }
        assert_eq!(&buf[..got], &one_shot[k..k + got]);
        k += got;
    }
    assert_eq!(k, n);
    assert_eq!(r.staging_capacity(), 4096);

    // Decimating the file streams with fixed buffers too.
    let reader = open_raw(&path, f, spec(5e6), 0).unwrap();
    let mut dec = ResampledSource::new(reader, PolyphaseResampler::decimator(5).unwrap(), 2048);
    let caps = dec.buffer_capacities();
    let mut sink = VecSink::default();
    let mut b = vec![Cf64::default(); 500];
    loop {
        let got = dec.read(&mut b).unwrap();
        if got == 0 {
            break;
        }
        sink.write(&b[..got]).unwrap();
    }
    assert_eq!(dec.buffer_capacities(), caps);
    assert_eq!(caps.0, 2048);
    assert!(caps.1 <= 2048 / 5 + 2);
    assert_eq!(sink.samples.len(), n.div_ceil(5));
    let _ = std::fs::remove_dir_all(&dir);
}

fn write_sigmf(
    base: &std::path::Path,
    f: SampleFormat,
    fs: f64,
    s: &[Cf64],
    meta: kshana::sigmf::Meta,
) {
    let (bytes, _) = encode_samples(f, s, 1.0);
    std::fs::write(format!("{}.sigmf-data", base.display()), bytes).unwrap();
    std::fs::write(
        format!("{}.sigmf-meta", base.display()),
        kshana::sigmf::meta_to_json(&meta).unwrap(),
    )
    .unwrap();
    assert_eq!(meta.global.sample_rate, Some(fs));
}

/// Two recordings joined through a SigMF collection: one continuous stream, every capture
/// reported at its stream index, no read crossing a boundary, hashes checked.
#[test]
fn sigmf_collection_reads_as_one_stream_with_capture_boundaries() {
    let dir = scratch("collection");
    let f = SampleFormat::CI16_BE;
    let fs = 2.0e6;
    let a: Vec<Cf64> = (0..1000).map(|k| Cf64::new(k as f64, 1.0)).collect();
    let b: Vec<Cf64> = (0..800).map(|k| Cf64::new(-(k as f64), 2.0)).collect();
    let mut ma = meta_for(
        f,
        fs,
        &[
            (0, Some(1575.42e6), Some("2026-10-04T00:00:00Z".into())),
            (300, Some(1575.43e6), None),
        ],
        "a",
    )
    .unwrap();
    ma.annotations.push(kshana::sigmf::Annotation {
        sample_start: 500,
        sample_count: Some(20),
        freq_lower_edge: None,
        freq_upper_edge: None,
        label: Some("event".into()),
        comment: None,
    });
    let mb = meta_for(f, fs, &[(10, Some(1176.45e6), None), (50, None, None)], "b").unwrap();
    write_sigmf(&dir.join("rec-a"), f, fs, &a, ma);
    write_sigmf(&dir.join("rec-b"), f, fs, &b, mb);
    let coll = dir.join("both.sigmf-collection");
    write_sigmf_collection(&coll, &["rec-a", "rec-b"], Some("two halves")).unwrap();

    let mut s = open_sigmf_collection(&coll, 1024).unwrap();
    assert_eq!(s.total_samples(), 1000 + 790);
    let starts: Vec<u64> = s.boundaries().iter().map(|b| b.sample).collect();
    assert_eq!(starts, vec![0, 300, 1000, 1040]);
    assert_eq!(s.boundaries()[2].file_index, 1);
    assert_eq!(s.boundaries()[2].frequency_hz, Some(1176.45e6));
    assert_eq!(s.annotations()[0].sample, 500);
    assert_eq!(s.capture_at(1039).unwrap().sample, 1000);
    assert_eq!(s.spec().center_hz, 1575.42e6);

    let mut got = Vec::new();
    let mut buf = vec![Cf64::default(); 256];
    loop {
        let p0 = s.position();
        let n = s.read(&mut buf).unwrap();
        if n == 0 {
            break;
        }
        for &bd in &starts {
            assert!(
                !(p0 < bd && bd < p0 + n as u64),
                "read {p0}+{n} crosses {bd}"
            );
        }
        got.extend_from_slice(&buf[..n]);
    }
    let mut want = a.clone();
    want.extend_from_slice(&b[10..]);
    assert_eq!(got, want);

    // A changed meta file no longer matches the collection's SHA-512.
    let mp = dir.join("rec-b.sigmf-meta");
    let text = std::fs::read_to_string(&mp).unwrap();
    std::fs::write(&mp, text.replace("\"b\"", "\"B\"")).unwrap();
    let err = open_sigmf_collection(&coll, 1024)
        .err()
        .unwrap()
        .to_string();
    assert!(err.contains("SHA-512"), "{err}");
    let _ = std::fs::remove_dir_all(&dir);
}

/// Inventory: per-file SHA-256 equals sha2 over the whole file; formats, rates, durations
/// and captures come from the metadata; a raw file without a sidecar is reported, not fatal.
#[test]
fn inventory_reports_each_recording_and_its_sha256() {
    use sha2::{Digest, Sha256};
    let dir = scratch("inventory");
    let raw = dir.join("front-end.bin");
    let f2 = SampleFormat::parse("c2sm_msb").unwrap();
    let mut rng = ChaCha8Rng::seed_from_u64(5);
    let raw_bytes: Vec<u8> = (0..300_000).map(|_| rng.gen()).collect();
    std::fs::write(&raw, &raw_bytes).unwrap();
    std::fs::write(
        dir.join("front-end.toml"),
        "format = \"c2sm_msb\"\nsample_rate_hz = 16368000.0\ncenter_hz = 1575420000.0\n",
    )
    .unwrap();
    let sig: Vec<Cf64> = (0..5000)
        .map(|k| Cf64::new(k as f64 % 100.0, 0.0))
        .collect();
    let m = meta_for(
        SampleFormat::CI8,
        4e6,
        &[(0, Some(1.2e9), None), (2500, Some(1.3e9), None)],
        "",
    )
    .unwrap();
    write_sigmf(&dir.join("cap"), SampleFormat::CI8, 4e6, &sig, m);
    std::fs::write(dir.join("orphan.dat"), [1u8, 2, 3]).unwrap();
    std::fs::write(dir.join("notes.txt"), "not a recording").unwrap();

    let rows = scan_dir(
        &dir,
        InventoryOptions {
            recursive: false,
            hash: true,
            workers: 2,
        },
    )
    .unwrap();
    assert_eq!(rows.len(), 3);
    let by = |s: &str| rows.iter().find(|r| r.path.ends_with(s)).unwrap();
    let sha = |p: PathBuf| hex::encode(Sha256::digest(std::fs::read(p).unwrap()));

    let r = by("front-end.bin");
    assert_eq!(r.kind, RecordingKind::Raw);
    assert_eq!(r.format.as_deref(), Some("c2sm_msb"));
    assert_eq!(r.n_samples, Some(f2.samples_in_bytes(300_000)));
    assert_eq!(r.n_samples, Some(600_000));
    assert!((r.duration_s.unwrap() - 600_000.0 / 16.368e6).abs() < 1e-12);
    assert_eq!(r.sha256, vec![sha(raw.clone())]);
    assert_eq!(r.size_bytes, 300_000);

    let c = by("cap.sigmf-meta");
    assert_eq!(c.kind, RecordingKind::Sigmf);
    assert_eq!(c.format.as_deref(), Some("ci8"));
    assert_eq!(c.n_samples, Some(5000));
    assert_eq!(c.captures.len(), 2);
    assert_eq!(c.captures[1].sample, 2500);
    assert_eq!(c.sha256, vec![sha(dir.join("cap.sigmf-data"))]);

    let o = by("orphan.dat");
    assert!(o.error.as_deref().unwrap().contains("no sidecar"));
    assert_eq!(o.sha256, vec![sha(dir.join("orphan.dat"))]);

    // The rows serialise to CSV and JSON.
    let csv = kshana::iq::io::report::rows_to_csv(&rows).unwrap();
    assert_eq!(csv.lines().count(), 4);
    let _ = std::fs::remove_dir_all(&dir);
}

/// The batch runner returns results in input order, whatever order the workers finish in,
/// and the same results on every run.
#[test]
fn batch_runner_orders_results_deterministically() {
    use kshana::iq::io::batch::run_batch;
    let paths: Vec<PathBuf> = (0..40)
        .map(|i| PathBuf::from(format!("in-{i:02}")))
        .collect();
    let job = |p: &std::path::Path| {
        let i: u64 = p.to_string_lossy()[3..].parse().unwrap();
        std::thread::sleep(std::time::Duration::from_millis((40 - i) % 7));
        if i == 13 {
            Err("unlucky".to_string())
        } else {
            Ok(serde_json::json!({ "square": i * i, "name": p.display().to_string() }))
        }
    };
    let a = run_batch(&paths, 4, job);
    let b = run_batch(&paths, 7, job);
    assert_eq!(a, b);
    for (i, r) in a.iter().enumerate() {
        assert_eq!(r.index, i);
        assert_eq!(r.input, paths[i].display().to_string());
    }
    assert_eq!(a[13].outcome, Err("unlucky".into()));
    assert_eq!(a[5].outcome.as_ref().unwrap()["square"], 25);
    assert_eq!(results_to_csv(&a).unwrap(), results_to_csv(&b).unwrap());
    assert_eq!(results_to_json(&a).unwrap(), results_to_json(&b).unwrap());
    assert!(results_to_csv(&a)
        .unwrap()
        .starts_with("index,input,ok,error,result.name,result.square\n"));
}

/// The `kshana iq` commands: convert raw -> SigMF cf32 -> raw ci16 reproduces the original
/// bytes; extract cuts the stated window; decimate divides the length.
#[test]
fn iq_cli_converts_extracts_and_decimates() {
    use kshana::iq::io::cli::run;
    let dir = scratch("cli");
    let p = |s: &str| dir.join(s).display().to_string();
    let args = |v: &[&str]| v.iter().map(|s| s.to_string()).collect::<Vec<_>>();
    let src: Vec<Cf64> = (0..20_000)
        .map(|k| Cf64::new((k % 2000) as f64 - 1000.0, (k % 77) as f64))
        .collect();
    let (bytes, _) = encode_samples(SampleFormat::CI16_LE, &src, 1.0);
    std::fs::write(p("in.dat"), &bytes).unwrap();

    // No sidecar: refused unless the format is given.
    assert_eq!(
        run(&args(&[
            "convert",
            &p("in.dat"),
            &p("x.bin"),
            "--to",
            "cf32_le"
        ])),
        1
    );
    let fmt = [
        "--format",
        "ci16_le",
        "--rate",
        "2000000",
        "--center",
        "1575420000",
    ];
    let mut a = args(&[
        "convert",
        &p("in.dat"),
        &p("mid.sigmf-data"),
        "--to",
        "cf32_le",
    ]);
    a.extend(args(&fmt));
    assert_eq!(run(&a), 0);
    assert_eq!(run(&args(&["info", &p("mid.sigmf-meta")])), 0);
    assert_eq!(
        run(&args(&[
            "convert",
            &p("mid.sigmf-meta"),
            &p("back.bin"),
            "--to",
            "ci16_le"
        ])),
        0
    );
    assert_eq!(std::fs::read(p("back.bin")).unwrap(), bytes);
    let sc: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(p("back.bin.json")).unwrap()).unwrap();
    assert_eq!(sc["format"], "ci16_le");
    assert_eq!(sc["sample_rate_hz"], 2.0e6);

    // 1 ms from 2.5 ms at 2 MHz = samples 5000..7000; the sidecar written above is used.
    assert_eq!(
        run(&args(&[
            "extract",
            &p("back.bin"),
            &p("cut.bin"),
            "--start",
            "0.0025",
            "--duration",
            "0.001"
        ])),
        0
    );
    let cut = decode_samples(
        SampleFormat::CI16_LE,
        &std::fs::read(p("cut.bin")).unwrap(),
        1.0,
    );
    assert_eq!(cut, src[5000..7000].to_vec());

    assert_eq!(
        run(&args(&[
            "decimate",
            &p("back.bin"),
            &p("dec.sigmf"),
            "--factor",
            "4"
        ])),
        0
    );
    let meta: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(p("dec.sigmf-meta")).unwrap()).unwrap();
    assert_eq!(meta["global"]["core:sample_rate"], 5.0e5);
    assert_eq!(
        std::fs::metadata(p("dec.sigmf-data")).unwrap().len(),
        5000 * 4
    );

    assert_eq!(
        run(&args(&[
            "inventory",
            dir.to_str().unwrap(),
            "--json",
            &p("inv.json")
        ])),
        0
    );
    let inv: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(p("inv.json")).unwrap()).unwrap();
    assert!(inv.as_array().unwrap().len() >= 4);
    assert_eq!(run(&args(&["frobnicate"])), 2);
    let _ = std::fs::remove_dir_all(&dir);
}

/// File conveniences: a header is skipped and seeking lands on the right sample.
#[test]
fn raw_files_skip_headers_and_seek() {
    let dir = scratch("seek");
    let path = dir.join("h.bin");
    let s: Vec<Cf64> = (0..1000).map(|k| Cf64::new(k as f64, 0.5)).collect();
    let mut w = create_raw(&path, SampleFormat::CF32_LE).unwrap();
    w.finish().unwrap();
    let (body, _) = encode_samples(SampleFormat::CF32_LE, &s, 1.0);
    let mut file = vec![0xAAu8; 16];
    file.extend_from_slice(&body);
    std::fs::write(&path, file).unwrap();
    let mut r = open_raw(&path, SampleFormat::CF32_LE, spec(1e3), 16).unwrap();
    let mut b = [Cf64::default(); 1];
    r.read(&mut b).unwrap();
    assert_eq!(b[0], s[0]);
    r.seek_to_sample(777).unwrap();
    r.read(&mut b).unwrap();
    assert_eq!(b[0], s[777]);
    let _ = std::fs::remove_dir_all(&dir);
}
