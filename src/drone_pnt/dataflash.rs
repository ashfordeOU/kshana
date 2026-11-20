// SPDX-License-Identifier: AGPL-3.0-only
//! ArduPilot DataFlash (`.bin`) logs, read only.
//!
//! Format (public ArduPilot developer documentation, "Logs" pages, and `AP_Logger/LogStructure.h`):
//! every message is `0xA3 0x95`, a one-octet message type, then the fields of that type, packed
//! little-endian with no padding. Type 128 is `FMT`, which defines a type: type (`u8`), total length
//! including the three header octets (`u8`), name (`char[4]`), format (`char[16]`) and the
//! comma-separated column labels (`char[64]`); `FMT` is 89 octets and defines itself. The format
//! characters read here:
//!
//! | char | type | scale |
//! |---|---|---|
//! | `b` `B` | int8, uint8 | 1 |
//! | `h` `H` | int16, uint16 | 1 |
//! | `i` `I` | int32, uint32 | 1 |
//! | `q` `Q` | int64, uint64 | 1 |
//! | `f` `d` | float, double | 1 |
//! | `c` `C` | int16, uint16 | 0.01 |
//! | `e` `E` | int32, uint32 | 0.01 |
//! | `L` | int32 latitude or longitude | 1e-7 degrees |
//! | `M` | uint8 flight mode | 1 |
//! | `n` `N` `Z` | char\[4\], char\[16\], char\[64\] | text, not read |
//! | `a` | int16\[32\] | not read |
//!
//! A message whose type has no `FMT` yet, or whose format holds an unknown character, is skipped by
//! re-synchronising on the next `0xA3 0x95` and counted as malformed. Only messages whose name is in
//! the caller's list are kept; their numeric columns become values by label (`GPS.Lat`, `GPA.HAcc`,
//! `UBX1.jamInd`, `ARM.ArmState`, `XKF1.PN` ...). Time is the `TimeUS` column (microseconds since
//! boot) when the type has one.

use std::collections::HashMap;

/// The two sync octets that start every DataFlash message.
pub const HEAD: [u8; 2] = [0xA3, 0x95];
const FMT_TYPE: u8 = 128;
const FMT_LEN: usize = 89;

/// One decoded DataFlash message.
#[derive(Clone, Debug, PartialEq)]
pub struct DfMsg {
    /// The message name (`GPS`, `GPA`, `UBX1`, ...).
    pub name: String,
    /// `TimeUS` in seconds since boot, when the type has it.
    pub boot_s: Option<f64>,
    /// Numeric columns by label, scaled as the format character says.
    pub values: HashMap<String, f64>,
}

impl DfMsg {
    /// A column's value.
    pub fn v(&self, k: &str) -> Option<f64> {
        self.values.get(k).copied()
    }
}

#[derive(Clone, Debug)]
struct Fmt {
    name: String,
    len: usize,
    cols: Vec<(char, String)>,
}

fn width(c: char) -> Option<usize> {
    Some(match c {
        'b' | 'B' | 'M' => 1,
        'h' | 'H' | 'c' | 'C' => 2,
        'i' | 'I' | 'e' | 'E' | 'L' | 'f' | 'n' => 4,
        'q' | 'Q' | 'd' => 8,
        'N' => 16,
        'Z' => 64,
        'a' => 64,
        _ => return None,
    })
}

fn cstr(b: &[u8]) -> String {
    let end = b.iter().position(|&x| x == 0).unwrap_or(b.len());
    String::from_utf8_lossy(&b[..end]).trim().to_string()
}

fn value(c: char, b: &[u8]) -> Option<f64> {
    let a = |n: usize| -> Option<&[u8]> { b.get(..n) };
    Some(match c {
        'b' => f64::from(i8::from_le_bytes([*b.first()?])),
        'B' | 'M' => f64::from(*b.first()?),
        'h' => f64::from(i16::from_le_bytes(a(2)?.try_into().ok()?)),
        'H' => f64::from(u16::from_le_bytes(a(2)?.try_into().ok()?)),
        'c' => f64::from(i16::from_le_bytes(a(2)?.try_into().ok()?)) * 0.01,
        'C' => f64::from(u16::from_le_bytes(a(2)?.try_into().ok()?)) * 0.01,
        'i' => f64::from(i32::from_le_bytes(a(4)?.try_into().ok()?)),
        'I' => f64::from(u32::from_le_bytes(a(4)?.try_into().ok()?)),
        'e' => f64::from(i32::from_le_bytes(a(4)?.try_into().ok()?)) * 0.01,
        'E' => f64::from(u32::from_le_bytes(a(4)?.try_into().ok()?)) * 0.01,
        'L' => f64::from(i32::from_le_bytes(a(4)?.try_into().ok()?)) * 1e-7,
        'f' => f64::from(f32::from_le_bytes(a(4)?.try_into().ok()?)),
        'd' => f64::from_le_bytes(a(8)?.try_into().ok()?),
        'q' => i64::from_le_bytes(a(8)?.try_into().ok()?) as f64,
        'Q' => u64::from_le_bytes(a(8)?.try_into().ok()?) as f64,
        _ => return None,
    })
}

fn parse_fmt(body: &[u8]) -> Option<(u8, Fmt)> {
    // body = everything after the three header octets.
    let ty = *body.first()?;
    let len = usize::from(*body.get(1)?);
    let name = cstr(body.get(2..6)?);
    let format = cstr(body.get(6..22)?);
    let labels = cstr(body.get(22..86)?);
    let labels: Vec<&str> = labels.split(',').collect();
    if labels.len() != format.chars().count() || len < 3 {
        return None;
    }
    let mut total = 3;
    let mut cols = Vec::new();
    for (c, l) in format.chars().zip(labels) {
        total += width(c)?;
        cols.push((c, l.to_string()));
    }
    (total == len).then_some((ty, Fmt { name, len, cols }))
}

fn next_head(b: &[u8], from: usize) -> usize {
    let mut i = from;
    while i + 1 < b.len() {
        if b[i] == HEAD[0] && b[i + 1] == HEAD[1] {
            return i;
        }
        i += 1;
    }
    b.len()
}

/// Every message of the named types in a DataFlash log, in file order, with the count of messages
/// skipped as malformed. An input that does not start with the sync octets is an error.
pub fn read(bytes: &[u8], names: &[&str]) -> Result<(Vec<DfMsg>, usize), String> {
    if bytes.len() < 3 || bytes[..2] != HEAD {
        return Err(crate::terr!("e-drone-dataflash-header"));
    }
    let mut fmts: HashMap<u8, Fmt> = HashMap::new();
    let mut out = Vec::new();
    let mut malformed = 0;
    let mut i = 0;
    while i + 3 <= bytes.len() {
        if bytes[i..i + 2] != HEAD {
            malformed += 1;
            i = next_head(bytes, i + 1);
            continue;
        }
        let ty = bytes[i + 2];
        if ty == FMT_TYPE {
            match bytes.get(i + 3..i + FMT_LEN).and_then(parse_fmt) {
                Some((t, f)) => {
                    fmts.insert(t, f);
                    i += FMT_LEN;
                }
                None => {
                    malformed += 1;
                    i = next_head(bytes, i + 2);
                }
            }
            continue;
        }
        let Some(f) = fmts.get(&ty) else {
            malformed += 1;
            i = next_head(bytes, i + 2);
            continue;
        };
        let Some(body) = bytes.get(i + 3..i + f.len) else {
            malformed += 1;
            break;
        };
        i += f.len;
        if !names.contains(&f.name.as_str()) {
            continue;
        }
        let mut values = HashMap::new();
        let mut at = 0;
        for (c, label) in &f.cols {
            let w = width(*c).unwrap_or(0);
            if let Some(v) = body.get(at..at + w).and_then(|s| value(*c, s)) {
                values.insert(label.clone(), v);
            }
            at += w;
        }
        out.push(DfMsg {
            name: f.name.clone(),
            boot_s: values.get("TimeUS").map(|t| t / 1e6),
            values,
        });
    }
    Ok((out, malformed))
}

/// Test and fixture encoder: a DataFlash log from message definitions and rows. Each definition is
/// (type, name, format, labels); each row is (type, values in column order). Text columns are
/// written as zeros. Used by the tests and by `kshana drone` fixtures; it never reads a file.
pub fn encode(defs: &[(u8, &str, &str, &str)], rows: &[(u8, Vec<f64>)]) -> Vec<u8> {
    let mut b = Vec::new();
    let pad = |s: &str, n: usize| {
        let mut v = s.as_bytes().to_vec();
        v.resize(n, 0);
        v
    };
    let mut formats = HashMap::new();
    for &(ty, name, format, labels) in defs {
        let len = 3 + format.chars().filter_map(width).sum::<usize>();
        formats.insert(ty, format.to_string());
        b.extend_from_slice(&HEAD);
        b.push(FMT_TYPE);
        b.push(ty);
        b.push(len as u8);
        b.extend(pad(name, 4));
        b.extend(pad(format, 16));
        b.extend(pad(labels, 64));
    }
    for (ty, vals) in rows {
        let Some(format) = formats.get(ty) else {
            continue;
        };
        b.extend_from_slice(&HEAD);
        b.push(*ty);
        let mut vi = vals.iter();
        for c in format.chars() {
            let v = if matches!(c, 'n' | 'N' | 'Z' | 'a') {
                0.0
            } else {
                *vi.next().unwrap_or(&0.0)
            };
            match c {
                'b' => b.push((v as i8) as u8),
                'B' | 'M' => b.push(v as u8),
                'h' => b.extend((v as i16).to_le_bytes()),
                'H' => b.extend((v as u16).to_le_bytes()),
                'c' => b.extend(((v * 100.0).round() as i16).to_le_bytes()),
                'C' => b.extend(((v * 100.0).round() as u16).to_le_bytes()),
                'i' => b.extend((v as i32).to_le_bytes()),
                'I' => b.extend((v as u32).to_le_bytes()),
                'e' => b.extend(((v * 100.0).round() as i32).to_le_bytes()),
                'E' => b.extend(((v * 100.0).round() as u32).to_le_bytes()),
                'L' => b.extend(((v * 1e7).round() as i32).to_le_bytes()),
                'f' => b.extend((v as f32).to_le_bytes()),
                'd' => b.extend(v.to_le_bytes()),
                'q' => b.extend((v as i64).to_le_bytes()),
                'Q' => b.extend((v as u64).to_le_bytes()),
                other => b.extend(std::iter::repeat_n(0u8, width(other).unwrap_or(0))),
            }
        }
    }
    b
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn round_trips_gps_and_scaled_columns() {
        let b = encode(
            &[(
                130,
                "GPS",
                "QBIHBcLLeffffB",
                "TimeUS,I,Status,GMS,GWk,NSats,HDop,Lat,Lng,Alt,Spd,GCrs,VZ,Yaw,U",
            )],
            &[],
        );
        // Format and labels disagree in count: the definition is refused, so nothing decodes.
        let (m, bad) = read(&b, &["GPS"]).unwrap();
        assert!(m.is_empty());
        assert_eq!(bad, 1);

        let b = encode(
            &[(
                130,
                "GPS",
                "QBBIHBcLLeffffB",
                "TimeUS,I,Status,GMS,GWk,NSats,HDop,Lat,Lng,Alt,Spd,GCrs,VZ,Yaw,U",
            )],
            &[(
                130,
                vec![
                    12_500_000.0,
                    0.0,
                    3.0,
                    1000.0,
                    2300.0,
                    14.0,
                    0.78,
                    47.397_741_9,
                    8.545_593_8,
                    488.12,
                    0.05,
                    0.0,
                    0.0,
                    0.0,
                    1.0,
                ],
            )],
        );
        let (m, bad) = read(&b, &["GPS"]).unwrap();
        assert_eq!(bad, 0);
        assert_eq!(m.len(), 1);
        assert_eq!(m[0].boot_s, Some(12.5));
        assert!((m[0].v("Lat").unwrap() - 47.397_741_9).abs() < 1e-9);
        assert!((m[0].v("HDop").unwrap() - 0.78).abs() < 1e-9);
        assert!((m[0].v("Alt").unwrap() - 488.12).abs() < 1e-9);
        assert_eq!(m[0].v("NSats"), Some(14.0));
        assert!(read(b"not a log", &["GPS"]).is_err());
        // Garbage between messages is skipped and counted.
        let mut g = b.clone();
        g.splice(89..89, [1u8, 2, 3]);
        let (m, bad) = read(&g, &["GPS"]).unwrap();
        assert_eq!(m.len(), 1);
        assert_eq!(bad, 1);
    }
}
