// SPDX-License-Identifier: AGPL-3.0-only
//! Recording-format breadth for lab recordings (`kshana::iq::io`): packed 4-bit, unsigned
//! 8-bit, 12-bit in 16, one 2-bit code per byte, sample-interleaved multi-stream files with
//! a header and a TOML sidecar, multi-channel SigMF, `.sdrx` recordings through
//! `open_recording`, and a GB-scale streaming read.
//!
//! References:
//!
//! * hand-built byte vectors decoded from the layouts documented in `iq::io::format`
//!   (each value worked out by hand in the comments) and their re-encoding;
//! * **sigmf-python 1.13.0** (third-party, run as a tool by
//!   `tests/fixtures/iq_formats_sigmf_oracle/gen_iq_formats_sigmf_oracle.py`): the
//!   multi-channel and `cu8` recordings it wrote, and the samples it reads back from them
//!   (`reference.json`), compared through the SHA-256 of the little-endian f64 I, Q stream;
//! * the crate's whole-buffer `.sdrx` decoder `realdata::ion_sdr::decode`, already checked
//!   against the LuGRE snapshots, as the one-shot reference for the streamed `.sdrx` source;
//! * for the interleaved files, the whole-buffer decoder `iq::io::decode_samples` on the
//!   interleaved stream, de-interleaved by index.
//!
//! The GB-scale test is `#[ignore]` (it writes a ≥ 1 GiB scratch file, generated on the fly
//! and deleted afterwards); run it with
//! `cargo test --release --test iq_formats -- --ignored --nocapture`, and set
//! `KSHANA_IQ_GB_TEST_BYTES` to change the size.

use kshana::iq::io::format::{BitOrder, Encoding, Endian, Justify, TwoBitCode};
use kshana::iq::io::inventory::{
    open_recording, open_recording_with, scan_dir, InventoryOptions, RecordingKind,
};
use kshana::iq::io::stream::open_raw;
use kshana::iq::io::{decode_samples, encode_samples, IqReader, SampleFormat};
use kshana::iq::{Cf64, IqSource, SampleSpec};
use kshana::realdata::ion_sdr;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::path::{Path, PathBuf};

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
    let d = std::env::temp_dir().join(format!(
        "kshana-iq-formats-{}-{uniq}-{name}",
        std::process::id()
    ));
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

fn c(re: f64, im: f64) -> Cf64 {
    Cf64::new(re, im)
}

fn sha_f64(samples: &[Cf64]) -> String {
    let mut h = Sha256::new();
    for s in samples {
        h.update(s.re.to_le_bytes());
        h.update(s.im.to_le_bytes());
    }
    hex::encode(h.finalize())
}

/// Hand-built bytes for each new layout, decoded and (where every bit is meaningful)
/// re-encoded to the same bytes.
#[test]
fn new_integer_layouts_decode_hand_built_bytes() {
    let f = |name: &str| SampleFormat::parse(name).unwrap();
    // Packed 4-bit two's complement, 0x7F 0x80 0x1E: nibbles 7, F(−1), 8(−8), 0, 1, E(−2).
    let b4 = [0x7Fu8, 0x80, 0x1E];
    let cases: Vec<(SampleFormat, &[u8], Vec<Cf64>, bool)> = vec![
        (
            f("ci4_msb"),
            &b4,
            vec![c(7., -1.), c(-8., 0.), c(1., -2.)],
            true,
        ),
        // First element in the low nibble: (F, 7), (0, 8), (E, 1).
        (
            f("ci4_lsb"),
            &b4,
            vec![c(-1., 7.), c(0., -8.), c(-2., 1.)],
            true,
        ),
        // Offset-binary 4-bit, level 2c − 15: 7 → −1, F → 15, 8 → 1, 0 → −15, 1 → −13, E → 13.
        (
            f("cu4_msb"),
            &b4,
            vec![c(-1., 15.), c(1., -15.), c(-13., 13.)],
            true,
        ),
        // Unsigned 8-bit, level 2c − 255.
        (
            f("cu8"),
            &[0u8, 255, 128, 127],
            vec![c(-255., 255.), c(1., -1.)],
            true,
        ),
        (f("ru8"), &[0u8, 200], vec![c(-255., 0.), c(145., 0.)], true),
        // 12-bit right-justified little-endian: 0x07FF = 2047, 0xF800 = −2048 (sign
        // extended), 0xFFFF = −1, 0x0001 = 1.
        (
            f("ci12r_le"),
            &[0xFF, 0x07, 0x00, 0xF8, 0xFF, 0xFF, 0x01, 0x00],
            vec![c(2047., -2048.), c(-1., 1.)],
            true,
        ),
        // The upper nibble of a right-justified word is ignored: 0xAFFF still reads −1.
        (
            f("ci12r_le"),
            &[0xFF, 0xAF, 0x05, 0x50],
            vec![c(-1., 5.)],
            false,
        ),
        // 12-bit left-justified big-endian: 0x7FF0 = 2047, 0x8000 = −2048, 0x001F = 1 (low
        // nibble ignored), 0xFFF0 = −1.
        (
            f("ci12l_be"),
            &[0x7F, 0xF0, 0x80, 0x00, 0x00, 0x1F, 0xFF, 0xF0],
            vec![c(2047., -2048.), c(1., -1.)],
            false,
        ),
        // One 2-bit sign-magnitude code per byte (bits 1–0; 0xFE carries code 10 = −1).
        (
            f("c2sm_byte"),
            &[0x00, 0x01, 0xFE, 0x03],
            vec![c(1., 3.), c(-1., -3.)],
            false,
        ),
        (
            f("c2sm_byte"),
            &[0x00, 0x01, 0x02, 0x03],
            vec![c(1., 3.), c(-1., -3.)],
            true,
        ),
        // Q first: 0x1E as ci4_msb_qi is (I = E, Q = 1).
        (f("ci4_msb_qi"), &[0x1Eu8], vec![c(-2., 1.)], true),
    ];
    for (fmt, bytes, expect, exact) in cases {
        let got = drain(&mut IqReader::new(bytes, fmt, spec(1e6)), 2);
        assert_eq!(got, expect, "{fmt}");
        assert_eq!(decode_samples(fmt, bytes, 1.0), expect, "{fmt}");
        if exact {
            let (back, clipped) = encode_samples(fmt, &expect, 1.0);
            assert_eq!(clipped, 0, "{fmt}");
            assert_eq!(back, bytes, "{fmt}");
        }
    }
    // Saturation is counted for every new integer width.
    for (name, v, n_clip) in [
        ("ci4_msb", c(9., -9.), 2),
        ("cu4_lsb", c(17., -16.), 2),
        ("cu8", c(300., -256.), 2),
        ("ci12r_be", c(3000., 2047.), 1),
    ] {
        let (_, clipped) = encode_samples(f(name), &[v], 1.0);
        assert_eq!(clipped, n_clip, "{name}");
    }
    // An odd number of 4-bit elements pads the last byte with code 0 and says so.
    let mut w = kshana::iq::io::IqWriter::new(Vec::new(), f("ru4_msb"));
    kshana::iq::IqSink::write(&mut w, &[c(15., 0.)]).unwrap();
    kshana::iq::IqSink::finish(&mut w).unwrap();
    assert_eq!(w.padded_elements(), 1);
    assert_eq!(w.into_inner(), vec![0xF0]);
    // The names name every layout and parse back.
    assert_eq!(
        SampleFormat::iq(Encoding::I12 {
            endian: Endian::Big,
            justify: Justify::Left
        })
        .name(),
        "ci12l_be"
    );
    assert_eq!(
        SampleFormat::real(Encoding::TwoBitPerByte {
            code: TwoBitCode::OffsetBinary
        })
        .name(),
        "r2ob_byte"
    );
    assert_eq!(
        SampleFormat::iq(Encoding::U4 {
            order: BitOrder::LsbFirst
        })
        .name(),
        "cu4_lsb"
    );
}

/// Every format, three streams interleaved sample by sample: each stream read alone, with
/// awkward chunk and buffer sizes, equals the whole-buffer decode de-interleaved.
#[test]
fn interleaved_streams_read_one_stream_each_in_every_format() {
    let n_inst = 101;
    let all: Vec<Cf64> = (0..3 * n_inst)
        .map(|k| c((k % 7) as f64 - 3.0, 2.0 - (k % 5) as f64))
        .collect();
    for f in SampleFormat::all() {
        let (bytes, _) = encode_samples(f, &all, 1.0);
        let whole = decode_samples(f, &bytes, 1.0);
        for ch in 0..3 {
            let expect: Vec<Cf64> = whole.iter().skip(ch).step_by(3).copied().collect();
            for chunk in [1, 3, 7, 64] {
                let mut r = IqReader::with_chunk_bytes(&bytes[..], f, spec(1e6), chunk)
                    .with_channels(3, ch)
                    .unwrap();
                let got = drain(&mut r, 5);
                assert_eq!(got, expect, "{f} channel {ch} chunk {chunk}");
                assert_eq!(r.samples_read(), expect.len() as u64);
            }
        }
    }
    assert!(IqReader::new(&[][..], SampleFormat::CI8, spec(1e6))
        .with_channels(2, 2)
        .is_err());
    assert!(IqReader::new(&[][..], SampleFormat::CI8, spec(1e6))
        .with_channels(0, 0)
        .is_err());
}

/// A raw lab recording: a 64-byte header, then three ci16_le streams interleaved,
/// described by a TOML sidecar. Each stream opens through `open_recording`, seeks, and
/// converts through the `iq` CLI.
#[test]
fn interleaved_raw_file_with_header_and_toml_sidecar() {
    let dir = scratch("interleaved");
    let path = dir.join("capture.bin");
    let n_inst = 500usize;
    let value = |ch: usize, k: usize| c((1000 * ch + k) as f64, -((3 * k) as f64));
    let mut inter = Vec::new();
    for k in 0..n_inst {
        for ch in 0..3 {
            inter.push(value(ch, k));
        }
    }
    let (body, _) = encode_samples(SampleFormat::CI16_LE, &inter, 1.0);
    let mut file = vec![0x5Au8; 64];
    file.extend_from_slice(&body);
    std::fs::write(&path, &file).unwrap();
    std::fs::write(
        dir.join("capture.bin.toml"),
        "format = \"ci16_le\"\nsample_rate_hz = 4e6\ncenter_hz = 1575.42e6\n\
         header_bytes = 64\nchannels = 3\nchannel = 2\n",
    )
    .unwrap();

    // The sidecar's channel, then each channel by override.
    let mut o = open_recording(&path, None).unwrap();
    assert_eq!(o.channels, (3, 2));
    assert_eq!(o.n_samples, n_inst as u64);
    let got = drain(o.source.as_mut(), 77);
    assert_eq!(got, (0..n_inst).map(|k| value(2, k)).collect::<Vec<_>>());
    for ch in 0..3 {
        let mut o = open_recording_with(&path, None, Some(ch)).unwrap();
        let got = drain(o.source.as_mut(), 333);
        assert_eq!(got, (0..n_inst).map(|k| value(ch, k)).collect::<Vec<_>>());
    }
    assert!(open_recording_with(&path, None, Some(3)).is_err());

    // Seeking counts the selected stream's samples.
    let mut r = open_raw(&path, SampleFormat::CI16_LE, spec(4e6), 64)
        .unwrap()
        .with_channels(3, 1)
        .unwrap();
    r.seek_to_sample(321).unwrap();
    let mut b = [Cf64::default(); 2];
    assert_eq!(r.read(&mut b).unwrap(), 2);
    assert_eq!(b, [value(1, 321), value(1, 322)]);

    // The inventory lists it with its channel count.
    let rows = scan_dir(&dir, InventoryOptions::default()).unwrap();
    assert_eq!(rows.len(), 1);
    assert_eq!(rows[0].channels, 3);
    assert_eq!(rows[0].n_samples, Some(n_inst as u64));

    // `iq convert --channel 0` writes stream 0 alone.
    let args = |v: &[&str]| v.iter().map(|s| s.to_string()).collect::<Vec<_>>();
    let out = dir.join("ch0.bin");
    assert_eq!(
        kshana::iq::io::cli::run(&args(&[
            "convert",
            &path.display().to_string(),
            &out.display().to_string(),
            "--to",
            "cf32_le",
            "--channel",
            "0",
        ])),
        0
    );
    let back = decode_samples(SampleFormat::CF32_LE, &std::fs::read(&out).unwrap(), 1.0);
    assert_eq!(back, (0..n_inst).map(|k| value(0, k)).collect::<Vec<_>>());

    // The same file with flags instead of a sidecar.
    std::fs::remove_file(dir.join("capture.bin.toml")).unwrap();
    let out1 = dir.join("ch1.bin");
    assert_eq!(
        kshana::iq::io::cli::run(&args(&[
            "convert",
            &path.display().to_string(),
            &out1.display().to_string(),
            "--to",
            "ci16_le",
            "--format",
            "ci16_le",
            "--rate",
            "4e6",
            "--header",
            "64",
            "--channels",
            "3",
            "--channel",
            "1",
        ])),
        0
    );
    let back = decode_samples(SampleFormat::CI16_LE, &std::fs::read(&out1).unwrap(), 1.0);
    assert_eq!(back, (0..n_inst).map(|k| value(1, k)).collect::<Vec<_>>());
    let _ = std::fs::remove_dir_all(&dir);
}

fn oracle_dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/iq_formats_sigmf_oracle")
}

/// Multi-channel SigMF written by sigmf-python: every channel read by this crate equals
/// what sigmf-python reads, captures and annotations land on the same time instants.
#[test]
fn multi_channel_sigmf_matches_sigmf_python() {
    let reference: Value = serde_json::from_str(
        &std::fs::read_to_string(oracle_dir().join("reference.json")).unwrap(),
    )
    .unwrap();
    let r = &reference["recordings"]["mc3_ci16"];
    let meta = oracle_dir().join("third_party/mc3_ci16.sigmf-meta");
    let n_ch = r["num_channels"].as_u64().unwrap() as usize;
    assert_eq!(n_ch, 3);
    for ch in 0..n_ch {
        let mut o = open_recording_with(&meta, None, Some(ch)).unwrap();
        assert_eq!(o.channels, (3, ch));
        assert_eq!(o.n_samples, r["samples_per_channel"].as_u64().unwrap());
        let caps: Vec<u64> = o.boundaries.iter().map(|b| b.sample).collect();
        let want: Vec<u64> = r["captures"]
            .as_array()
            .unwrap()
            .iter()
            .map(|c| c["sample_start"].as_u64().unwrap())
            .collect();
        assert_eq!(caps, want);
        assert_eq!(o.boundaries[1].frequency_hz, Some(1_176_450_000.0));
        assert_eq!(o.n_annotations, 1);
        let got = drain(o.source.as_mut(), 7);
        assert_eq!(
            sha_f64(&got),
            r["channels"][ch]["sha256_f64_iq"].as_str().unwrap(),
            "channel {ch}"
        );
    }
    // Default: channel 0; a channel past the count is refused.
    let o = open_recording(&meta, None).unwrap();
    assert_eq!(o.channels, (3, 0));
    assert!(open_recording_with(&meta, None, Some(3)).is_err());

    // cu8: this crate's level 2c − 255 maps back to sigmf-python's raw code c.
    let r = &reference["recordings"]["cu8"];
    let meta = oracle_dir().join("third_party/cu8.sigmf-meta");
    let mut o = open_recording(&meta, None).unwrap();
    assert_eq!(o.format.name(), "cu8");
    let got: Vec<Cf64> = drain(o.source.as_mut(), 9)
        .into_iter()
        .map(|s| c((s.re + 255.0) / 2.0, (s.im + 255.0) / 2.0))
        .collect();
    assert_eq!(got.len() as u64, r["samples_per_channel"].as_u64().unwrap());
    assert_eq!(
        sha_f64(&got),
        r["channels"][0]["sha256_f64_iq"].as_str().unwrap()
    );
}

/// The shape of a LuGRE `.sdrx` file (as in `realdata::ion_sdr`'s own tests) with a
/// configurable chunk, so the streamed source can be checked on more than one layout.
fn sdrx_meta(sizeword: usize, countwords: usize, q: u32, packed: u32, endian: &str) -> String {
    format!(
        r#"<?xml version="1.0" encoding="utf-8"?>
<metadata xmlns="http://www.ion.org/standards/sdrwg/schema/metadata.xsd">
   <lane id="Lane">
      <system id="System"/>
      <block id="Block00">
         <chunk id="Chunk00">
            <sizeword>{sizeword}</sizeword>
            <countwords>{countwords}</countwords>
            <endian>{endian}</endian>
            <padding>None</padding>
            <lump id="Lump00">
               <stream id="Stream00">
                  <ratefactor>1</ratefactor>
                  <quantization>{q}</quantization>
                  <packedbits>{packed}</packedbits>
                  <alignment>Undefined</alignment>
                  <format>IQ</format>
                  <encoding>TC</encoding>
                  <band id="L1"/>
               </stream>
            </lump>
         </chunk>
         <cycles>0</cycles>
         <sizeheader>2</sizeheader>
         <sizefooter>1</sizefooter>
      </block>
   </lane>
   <system id="System"><freqbase format="MHz">8</freqbase></system>
   <band id="L1"><centerfreq format="MHz">1575.420</centerfreq>
      <translatedfreq format="MHz">0</translatedfreq></band>
   <file id="File"><url>snap.bin</url><lane id="Lane"/></file>
</metadata>"#
    )
}

/// `.sdrx` recordings open through `open_recording` and stream in bounded chunks; every
/// sample equals the whole-file decoder's, and the inventory lists the `.sdrx`, not its
/// data file.
#[test]
fn sdrx_recordings_stream_through_open_recording() {
    let mut rng = ChaCha8Rng::seed_from_u64(5);
    for (sizeword, countwords, q, packed, endian) in [
        (1, 1, 4, 8, "Little"),
        (4, 1, 2, 4, "Little"),
        (2, 2, 8, 16, "Big"),
    ] {
        let dir = scratch("sdrx");
        let text = sdrx_meta(sizeword, countwords, q, packed, endian);
        let sdrx = dir.join("snap.sdrx");
        std::fs::write(&sdrx, &text).unwrap();
        let data: Vec<u8> = (0..2 + 4096 + 1).map(|_| rng.gen()).collect();
        std::fs::write(dir.join("snap.bin"), &data).unwrap();

        let layout = ion_sdr::parse_sdrx(&text).unwrap();
        let n = layout.sample_count(data.len());
        let expect = ion_sdr::decode(&layout, &data, 0, n).unwrap();

        let mut o = open_recording(&sdrx, None).unwrap();
        assert_eq!(o.n_samples, n as u64);
        assert_eq!(o.source.spec().fs_hz, 8e6);
        assert_eq!(o.source.spec().center_hz, 1_575_420_000.0);
        assert!(o.format_label.starts_with("sdrx "), "{}", o.format_label);
        let got = drain(o.source.as_mut(), 37);
        assert_eq!(got, expect, "{sizeword}x{countwords} q{q}");
        assert!(open_recording_with(&sdrx, None, Some(1)).is_err());

        let rows = scan_dir(&dir, InventoryOptions::default()).unwrap();
        assert_eq!(rows.len(), 1, "{rows:?}");
        assert_eq!(rows[0].kind, RecordingKind::Sdrx);
        assert_eq!(rows[0].n_samples, Some(n as u64));
        assert!(rows[0].error.is_none(), "{:?}", rows[0].error);
        let _ = std::fs::remove_dir_all(&dir);
    }
}

/// Peak resident set (VmHWM) of this process in kB, where /proc is available.
fn vm_hwm_kb() -> Option<u64> {
    let s = std::fs::read_to_string("/proc/self/status").ok()?;
    s.lines()
        .find(|l| l.starts_with("VmHWM:"))?
        .split_whitespace()
        .nth(1)?
        .parse()
        .ok()
}

/// A GB-scale recording (default 1 GiB of ci8, two interleaved streams, a header),
/// generated on the fly into a scratch file and read back through `open_recording` with
/// its sidecar: every sample's value is checked against the generator, and the process's
/// peak memory does not grow with the file.
#[test]
#[ignore = "writes a >= 1 GiB scratch file; run with --ignored (see the module docs)"]
fn gb_scale_recording_streams_in_bounded_memory() {
    use std::io::Write;
    let bytes: u64 = std::env::var("KSHANA_IQ_GB_TEST_BYTES")
        .ok()
        .and_then(|v| v.parse().ok())
        .unwrap_or(1 << 30);
    let dir = scratch("gb");
    let path = dir.join("big.dat");
    let header = 4096u64;
    // Byte j of the body holds (j·37 + 11) mod 256: stream 0 is the even samples' I and Q,
    // stream 1 the odd ones'.
    let gen = |j: u64| ((j.wrapping_mul(37) + 11) & 0xFF) as u8;
    let t0 = std::time::Instant::now();
    {
        let mut f =
            std::io::BufWriter::with_capacity(1 << 20, std::fs::File::create(&path).unwrap());
        f.write_all(&vec![0u8; header as usize]).unwrap();
        let mut block = vec![0u8; 1 << 20];
        let mut j = 0u64;
        while j < bytes {
            let k = ((bytes - j) as usize).min(block.len());
            for (i, b) in block[..k].iter_mut().enumerate() {
                *b = gen(j + i as u64);
            }
            f.write_all(&block[..k]).unwrap();
            j += k as u64;
        }
    }
    let t_write = t0.elapsed().as_secs_f64();
    std::fs::write(
        dir.join("big.dat.toml"),
        format!("format = \"ci8\"\nsample_rate_hz = 20e6\nheader_bytes = {header}\nchannels = 2\nchannel = 1\n"),
    )
    .unwrap();

    let hwm0 = vm_hwm_kb();
    let t1 = std::time::Instant::now();
    let mut o = open_recording(Path::new(&path), None).unwrap();
    let n_expect = bytes / 4; // 2 bytes per sample, 2 streams
    assert_eq!(o.n_samples, n_expect);
    let mut buf = vec![Cf64::default(); 1 << 16];
    let mut k = 0u64;
    loop {
        let got = o.source.read(&mut buf).unwrap();
        if got == 0 {
            break;
        }
        for (i, s) in buf[..got].iter().enumerate() {
            // Sample k of stream 1 is body bytes 4k + 2 (I) and 4k + 3 (Q).
            let base = 4 * (k + i as u64) + 2;
            assert_eq!(s.re, gen(base) as i8 as f64);
            assert_eq!(s.im, gen(base + 1) as i8 as f64);
        }
        k += got as u64;
    }
    let t_read = t1.elapsed().as_secs_f64();
    assert_eq!(k, n_expect);
    let hwm1 = vm_hwm_kb();
    println!(
        "GB-scale read: {bytes} bytes; write {t_write:.1} s, read+check {t_read:.1} s \
         ({:.0} MB/s); VmHWM {hwm0:?} -> {hwm1:?} kB",
        bytes as f64 / t_read / 1e6
    );
    if let (Some(a), Some(b)) = (hwm0, hwm1) {
        // The reader's staging buffer is 64 KiB and the sample buffer 1 MiB; allow 64 MiB.
        assert!(b - a < 64 * 1024, "peak memory grew by {} kB", b - a);
    }
    let _ = std::fs::remove_dir_all(&dir);
}
