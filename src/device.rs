// SPDX-License-Identifier: AGPL-3.0-only
//! Sensor plug-in kit (roadmap L11): a binary device described by a file, not by code.
//!
//! A device file (`kshana.device/1`, TOML) states a sensor's framing (sync bytes, where the length
//! is and what it counts, a checksum) and its messages (an identifying byte or word, then named
//! fields with their offset, binary type, scale and unit). [`Decoder`] cuts a byte stream into
//! frames, checks each checksum, and gives one JSON object per known message: `{"message": name,
//! field: value, ...}`. As JSON Lines, that is the input of a `kshana.connect/1` mapping
//! (`docs/CONNECT.md`), which turns it into `kshana.obs/1`. So a partner adds a sensor with two
//! files and no change to Kshana.
//!
//! The file also carries its own test vectors (`[[test]]`: a frame in hex and the values it must
//! give); `kshana device check` runs them, which is the device's conformance test. Decoding is
//! pure: the same bytes give the same rows whether they arrive at once or a byte at a time.

use serde::Deserialize;
use std::collections::BTreeMap;

/// The device-file schema this engine reads.
pub const SCHEMA: &str = "kshana.device/1";

/// A device file.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Device {
    /// Must be [`SCHEMA`].
    pub schema: String,
    /// The device's name.
    pub name: String,
    /// How frames are cut from the stream.
    pub framing: Framing,
    /// The messages read; frames of other messages are counted and passed over.
    #[serde(rename = "message", default)]
    pub messages: Vec<Message>,
    /// Test vectors.
    #[serde(rename = "test", default)]
    pub tests: Vec<TestVector>,
}

/// Frame layout.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Framing {
    /// The sync bytes that start every frame, in hex (`"B5 62"`).
    pub sync: String,
    /// A fixed frame length in bytes, or
    #[serde(default)]
    pub fixed_length: Option<usize>,
    /// a length field: the frame's total length is its value plus `add`.
    #[serde(default)]
    pub length: Option<LengthField>,
    /// The checksum, at the end of the frame.
    #[serde(default)]
    pub checksum: Option<Checksum>,
    /// The longest frame the device sends (default 2048 bytes). A length field claiming more is a
    /// false sync, so a stray sync byte pair cannot make the decoder wait for data that never comes.
    #[serde(default)]
    pub max_length: Option<usize>,
}

/// Where the length is.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LengthField {
    /// Offset from the start of the frame.
    pub offset: usize,
    /// `u8`, `u16le` or `u16be`.
    #[serde(rename = "type")]
    pub ty: String,
    /// Bytes to add to the value to get the whole frame's length.
    #[serde(default)]
    pub add: i64,
}

/// The checksum: computed over `from..end-width`, stored in the last `width` bytes.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Checksum {
    /// `xor8`, `sum8`, `fletcher8` (two bytes, as UBX), `crc16-xmodem`, `crc16-ccitt-false` or `crc32`.
    #[serde(rename = "type")]
    pub ty: String,
    /// First covered byte, from the start of the frame.
    #[serde(default)]
    pub from: usize,
    /// Byte order of a multi-byte checksum: `le` (default) or `be`.
    #[serde(default)]
    pub endian: Option<String>,
}

/// One message.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Message {
    /// Its name in the output.
    pub name: String,
    /// Offset of the identifying value in the frame.
    pub id_offset: usize,
    /// Its type (as a field type).
    pub id_type: String,
    /// The value that identifies this message.
    pub id: u64,
    /// The fields.
    #[serde(rename = "field", default)]
    pub fields: Vec<FieldDef>,
}

/// One field: `value = raw * scale + add`, in `unit`.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FieldDef {
    /// Name in the output.
    pub name: String,
    /// Offset from the start of the frame.
    pub offset: usize,
    /// `u8`, `i8`, `u16le`, `u16be`, `i16le`, `i16be`, `u32le`, `u32be`, `i32le`, `i32be`, `u64le`,
    /// `i64le`, `f32le`, `f32be`, `f64le` or `f64be`.
    #[serde(rename = "type")]
    pub ty: String,
    /// Multiplier (default 1).
    #[serde(default)]
    pub scale: Option<f64>,
    /// Added after scaling (default 0).
    #[serde(default)]
    pub add: Option<f64>,
    /// The unit, for the reader of the file (not converted).
    #[serde(default)]
    pub unit: Option<String>,
    /// A raw value that means "not available": the field is then `null`.
    #[serde(default)]
    pub invalid: Option<i64>,
}

/// A test vector: one frame, and field values it must give.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TestVector {
    /// The frame, in hex (spaces allowed).
    pub hex: String,
    /// The message it must decode as.
    pub message: String,
    /// Field values (compared to 1e-9 relative).
    #[serde(default)]
    pub expect: BTreeMap<String, f64>,
}

fn hex(s: &str) -> Result<Vec<u8>, String> {
    let t: String = s.chars().filter(|c| !c.is_whitespace()).collect();
    if !t.len().is_multiple_of(2) {
        return Err(crate::terr!("e-device-hex", text = s.to_string()));
    }
    (0..t.len())
        .step_by(2)
        .map(|i| {
            u8::from_str_radix(&t[i..i + 2], 16)
                .map_err(|_| crate::terr!("e-device-hex", text = s.to_string()))
        })
        .collect()
}

fn type_width(ty: &str) -> Option<usize> {
    Some(match ty {
        "u8" | "i8" => 1,
        "u16le" | "u16be" | "i16le" | "i16be" => 2,
        "u32le" | "u32be" | "i32le" | "i32be" | "f32le" | "f32be" => 4,
        "u64le" | "i64le" | "f64le" | "f64be" => 8,
        _ => return None,
    })
}

/// The raw value of `ty` at `at` (integers as i128 for the invalid check, and the number).
fn read(b: &[u8], at: usize, ty: &str) -> Option<(Option<i128>, f64)> {
    let w = type_width(ty)?;
    let s = b.get(at..at + w)?;
    let a2 = |s: &[u8]| [s[0], s[1]];
    let a4 = |s: &[u8]| [s[0], s[1], s[2], s[3]];
    let a8 = |s: &[u8]| [s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7]];
    let int = |v: i128| Some((Some(v), v as f64));
    match ty {
        "u8" => int(i128::from(s[0])),
        "i8" => int(i128::from(s[0] as i8)),
        "u16le" => int(i128::from(u16::from_le_bytes(a2(s)))),
        "u16be" => int(i128::from(u16::from_be_bytes(a2(s)))),
        "i16le" => int(i128::from(i16::from_le_bytes(a2(s)))),
        "i16be" => int(i128::from(i16::from_be_bytes(a2(s)))),
        "u32le" => int(i128::from(u32::from_le_bytes(a4(s)))),
        "u32be" => int(i128::from(u32::from_be_bytes(a4(s)))),
        "i32le" => int(i128::from(i32::from_le_bytes(a4(s)))),
        "i32be" => int(i128::from(i32::from_be_bytes(a4(s)))),
        "u64le" => int(i128::from(u64::from_le_bytes(a8(s)))),
        "i64le" => int(i128::from(i64::from_le_bytes(a8(s)))),
        "f32le" => Some((None, f64::from(f32::from_le_bytes(a4(s))))),
        "f32be" => Some((None, f64::from(f32::from_be_bytes(a4(s))))),
        "f64le" => Some((None, f64::from_le_bytes(a8(s)))),
        "f64be" => Some((None, f64::from_be_bytes(a8(s)))),
        _ => None,
    }
}

fn checksum_width(ty: &str) -> Option<usize> {
    Some(match ty {
        "xor8" | "sum8" => 1,
        "fletcher8" | "crc16-xmodem" | "crc16-ccitt-false" => 2,
        "crc32" => 4,
        _ => return None,
    })
}

fn crc16(data: &[u8], init: u16) -> u16 {
    let mut c = init;
    for &b in data {
        c ^= u16::from(b) << 8;
        for _ in 0..8 {
            c = if c & 0x8000 != 0 {
                (c << 1) ^ 0x1021
            } else {
                c << 1
            };
        }
    }
    c
}

fn crc32(data: &[u8]) -> u32 {
    let mut c = 0xFFFF_FFFFu32;
    for &b in data {
        c ^= u32::from(b);
        for _ in 0..8 {
            c = if c & 1 != 0 {
                (c >> 1) ^ 0xEDB8_8320
            } else {
                c >> 1
            };
        }
    }
    !c
}

/// The checksum of `data` as `width` bytes in the stated order.
fn compute(ty: &str, data: &[u8], big: bool) -> Vec<u8> {
    let v: u64 = match ty {
        "xor8" => u64::from(data.iter().fold(0u8, |a, b| a ^ b)),
        "sum8" => u64::from(data.iter().fold(0u8, |a, b| a.wrapping_add(*b))),
        "fletcher8" => {
            let (mut a, mut b) = (0u8, 0u8);
            for &x in data {
                a = a.wrapping_add(x);
                b = b.wrapping_add(a);
            }
            // Stored as CK_A then CK_B.
            return vec![a, b];
        }
        "crc16-xmodem" => u64::from(crc16(data, 0)),
        "crc16-ccitt-false" => u64::from(crc16(data, 0xFFFF)),
        "crc32" => u64::from(crc32(data)),
        _ => 0,
    };
    let w = checksum_width(ty).unwrap_or(0);
    let le: Vec<u8> = v.to_le_bytes()[..w].to_vec();
    if big {
        le.into_iter().rev().collect()
    } else {
        le
    }
}

impl Device {
    /// Parse and check a device file.
    pub fn parse(text: &str) -> Result<Device, String> {
        let d: Device = toml::from_str(text).map_err(|e| crate::terr!("e-device-toml", e = e))?;
        if d.schema != SCHEMA {
            return Err(crate::terr!(
                "e-device-schema",
                found = d.schema.clone(),
                want = SCHEMA
            ));
        }
        let sync = hex(&d.framing.sync)?;
        if sync.is_empty() {
            return Err(crate::terr!("e-device-sync"));
        }
        if d.framing.fixed_length.is_some() == d.framing.length.is_some() {
            return Err(crate::terr!("e-device-length"));
        }
        if let Some(l) = &d.framing.length {
            if !matches!(l.ty.as_str(), "u8" | "u16le" | "u16be") {
                return Err(crate::terr!("e-device-type", ty = l.ty.clone()));
            }
        }
        if let Some(c) = &d.framing.checksum {
            if checksum_width(&c.ty).is_none() {
                return Err(crate::terr!("e-device-checksum", ty = c.ty.clone()));
            }
        }
        for m in &d.messages {
            for ty in std::iter::once(&m.id_type).chain(m.fields.iter().map(|f| &f.ty)) {
                if type_width(ty).is_none() {
                    return Err(crate::terr!("e-device-type", ty = ty.clone()));
                }
            }
        }
        Ok(d)
    }

    /// Decode one whole frame; `None` for a frame of a message the file does not list.
    pub fn decode_frame(&self, f: &[u8]) -> Option<serde_json::Value> {
        let m = self.messages.iter().find(|m| {
            read(f, m.id_offset, &m.id_type).and_then(|(i, _)| i) == Some(i128::from(m.id))
        })?;
        let mut o = serde_json::Map::new();
        o.insert("message".into(), serde_json::json!(m.name));
        for fd in &m.fields {
            let v = read(f, fd.offset, &fd.ty).and_then(|(raw, x)| {
                if fd.invalid.is_some() && raw == fd.invalid.map(i128::from) {
                    return None;
                }
                // An integer field read as it is stays an integer (a satellite number, a time in
                // milliseconds); a scaled one is a number.
                if let (Some(r), None, None) = (raw, fd.scale, fd.add) {
                    return i64::try_from(r)
                        .map(serde_json::Value::from)
                        .ok()
                        .or_else(|| u64::try_from(r).ok().map(serde_json::Value::from));
                }
                let y = x * fd.scale.unwrap_or(1.0) + fd.add.unwrap_or(0.0);
                y.is_finite().then(|| serde_json::json!(y))
            });
            o.insert(fd.name.clone(), v.unwrap_or(serde_json::Value::Null));
        }
        Some(serde_json::Value::Object(o))
    }

    /// Run the file's test vectors; the failures, as messages.
    pub fn check(&self) -> Vec<String> {
        let mut fails = Vec::new();
        for (k, t) in self.tests.iter().enumerate() {
            let bytes = match hex(&t.hex) {
                Ok(b) => b,
                Err(e) => {
                    fails.push(format!("test {}: {e}", k + 1));
                    continue;
                }
            };
            let mut d = Decoder::new(self.clone());
            let mut rows = d.push(&bytes);
            rows.extend(d.finish());
            let Some(row) = rows.first() else {
                fails.push(crate::t!("device-test-no-frame", k = k + 1, bad = d.bad));
                continue;
            };
            if row["message"] != t.message.as_str() {
                fails.push(crate::t!(
                    "device-test-wrong-message",
                    k = k + 1,
                    got = row["message"].to_string(),
                    want = t.message.clone()
                ));
            }
            for (name, want) in &t.expect {
                let got = row[name].as_f64();
                let ok = got.is_some_and(|g| (g - want).abs() <= 1e-9 * want.abs().max(1.0));
                if !ok {
                    fails.push(crate::t!(
                        "device-test-wrong-value",
                        k = k + 1,
                        field = name.clone(),
                        got = row[name].to_string(),
                        want = *want
                    ));
                }
            }
        }
        fails
    }
}

/// Cuts a byte stream into frames and decodes them, whatever the size of the pieces it arrives in.
pub struct Decoder {
    dev: Device,
    sync: Vec<u8>,
    buf: Vec<u8>,
    /// Frames whose checksum did not check (each costs one byte of resynchronisation).
    pub bad: u64,
    /// Valid frames of messages the file does not list.
    pub unknown: u64,
}

impl Decoder {
    /// A decoder for `dev` (checked with [`Device::parse`]).
    pub fn new(dev: Device) -> Self {
        let sync = hex(&dev.framing.sync).unwrap_or_default();
        Self {
            dev,
            sync,
            buf: Vec::new(),
            bad: 0,
            unknown: 0,
        }
    }

    /// The total length of the frame at the start of the buffer: `Ok(None)` until enough bytes
    /// have arrived to know it, `Err(())` when the length cannot be a frame.
    fn frame_len(&self) -> Result<Option<usize>, ()> {
        let f = &self.dev.framing;
        let n = match (f.fixed_length, &f.length) {
            (Some(n), _) => n,
            (None, Some(l)) => {
                let Some((Some(v), _)) = read(&self.buf, l.offset, &l.ty) else {
                    return Ok(None);
                };
                let n = v + i128::from(l.add);
                let max = f.max_length.unwrap_or(2048) as i128;
                if n < 1 || n > max {
                    return Err(());
                }
                n as usize
            }
            (None, None) => return Err(()),
        };
        let ck = f
            .checksum
            .as_ref()
            .and_then(|c| checksum_width(&c.ty))
            .unwrap_or(0);
        if n < self.sync.len() + ck {
            return Err(());
        }
        Ok(Some(n))
    }

    fn checks(&self, frame: &[u8]) -> bool {
        let Some(c) = &self.dev.framing.checksum else {
            return true;
        };
        let w = checksum_width(&c.ty).unwrap_or(0);
        let end = frame.len() - w;
        if c.from > end {
            return false;
        }
        let big = c.endian.as_deref() == Some("be");
        compute(&c.ty, &frame[c.from..end], big) == frame[end..]
    }

    /// Take the next bytes; the rows of the frames they complete.
    pub fn push(&mut self, bytes: &[u8]) -> Vec<serde_json::Value> {
        self.buf.extend_from_slice(bytes);
        let mut out = Vec::new();
        loop {
            // Drop bytes before the next sync (keeping a partial sync at the end).
            match self
                .buf
                .windows(self.sync.len())
                .position(|w| w == self.sync.as_slice())
            {
                Some(p) => {
                    self.buf.drain(..p);
                }
                None => {
                    let keep = self.sync.len().saturating_sub(1).min(self.buf.len());
                    let cut = self.buf.len() - keep;
                    self.buf.drain(..cut);
                    return out;
                }
            }
            let n = match self.frame_len() {
                Ok(Some(n)) => n,
                Ok(None) => return out,
                Err(()) => {
                    self.bad += 1;
                    self.buf.drain(..1);
                    continue;
                }
            };
            if self.buf.len() < n {
                return out;
            }
            if !self.checks(&self.buf[..n]) {
                self.bad += 1;
                self.buf.drain(..1);
                continue;
            }
            let frame: Vec<u8> = self.buf.drain(..n).collect();
            match self.dev.decode_frame(&frame) {
                Some(row) => out.push(row),
                None => self.unknown += 1,
            }
        }
    }
}

impl Decoder {
    /// The end of the stream: a frame still waiting for bytes will not get them. Each such start is
    /// counted as a failed frame and the bytes after it are read again, so valid frames behind a
    /// false sync near the end are not lost.
    pub fn finish(&mut self) -> Vec<serde_json::Value> {
        let mut out = self.push(&[]);
        while self.buf.len() > self.sync.len() {
            self.bad += 1;
            self.buf.drain(..1);
            out.extend(self.push(&[]));
        }
        self.buf.clear();
        out
    }
}

/// Usage text for `kshana device`.
pub fn usage() -> String {
    crate::t!("device-usage")
}

/// `kshana device check <device.toml>` or `kshana device decode <device.toml> --from <...>
/// [--follow] [--max-seconds <s>]`.
pub fn run(args: &[String]) -> Result<(), String> {
    let path = args.get(1).ok_or_else(usage)?;
    let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
    let dev = Device::parse(&text).map_err(|e| format!("{path}: {e}"))?;
    match args.first().map(String::as_str) {
        Some("check") if args.len() == 2 => {
            let fails = dev.check();
            if fails.is_empty() {
                println!(
                    "{}",
                    crate::t!(
                        "device-check-ok",
                        path = path.clone(),
                        name = dev.name.clone(),
                        n = dev.tests.len()
                    )
                );
                Ok(())
            } else {
                Err(fails.join("\n"))
            }
        }
        Some("decode") => {
            let rest = &args[2..];
            let flag = |k: &str| {
                rest.iter()
                    .position(|a| a == k)
                    .and_then(|i| rest.get(i + 1))
            };
            let from = flag("--from").ok_or_else(usage)?.clone();
            let max_s = match flag("--max-seconds") {
                Some(v) => Some(
                    v.parse::<f64>()
                        .ok()
                        .filter(|x| *x > 0.0)
                        .ok_or_else(usage)?,
                ),
                None => None,
            };
            let opts = crate::live_health::FollowOptions {
                follow: rest.iter().any(|a| a == "--follow"),
                max_s,
                reconnect: false,
            };
            decode_stream(dev, &from, &opts)
        }
        _ => Err(usage()),
    }
}

/// Decode `from` (`-`, `tcp:host:port` or a file) as raw bytes, writing JSON Lines as frames
/// complete.
fn decode_stream(
    dev: Device,
    from: &str,
    opts: &crate::live_health::FollowOptions,
) -> Result<(), String> {
    use std::io::{Read, Write};
    let io = |e: std::io::Error| format!("{from}: {e}");
    let mut r: Box<dyn Read> = if from == "-" {
        Box::new(std::io::stdin())
    } else if let Some(addr) = from.strip_prefix("tcp:") {
        Box::new(std::net::TcpStream::connect(addr).map_err(io)?)
    } else {
        Box::new(std::fs::File::open(from).map_err(io)?)
    };
    let mut d = Decoder::new(dev);
    let start = std::time::Instant::now();
    let mut buf = vec![0u8; 64 * 1024];
    while !opts
        .max_s
        .is_some_and(|m| start.elapsed().as_secs_f64() >= m)
    {
        let n = r.read(&mut buf).map_err(io)?;
        if n == 0 {
            if opts.follow {
                std::thread::sleep(std::time::Duration::from_millis(50));
                continue;
            }
            break;
        }
        let rows = d.push(&buf[..n]);
        let mut out = std::io::stdout().lock();
        for row in rows {
            writeln!(out, "{row}").map_err(|e| e.to_string())?;
        }
        out.flush().map_err(|e| e.to_string())?;
    }
    let rows = d.finish();
    {
        let mut out = std::io::stdout().lock();
        for row in rows {
            writeln!(out, "{row}").map_err(|e| e.to_string())?;
        }
        out.flush().map_err(|e| e.to_string())?;
    }
    eprintln!(
        "{}",
        crate::t!("device-decode-done", bad = d.bad, unknown = d.unknown)
    );
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn checksums_match_their_published_check_values() {
        // The CRC catalogue's check values for "123456789".
        assert_eq!(crc16(b"123456789", 0), 0x31C3);
        assert_eq!(crc16(b"123456789", 0xFFFF), 0x29B1);
        assert_eq!(crc32(b"123456789"), 0xCBF4_3926);
    }
}
