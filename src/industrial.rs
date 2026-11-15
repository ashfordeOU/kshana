// SPDX-License-Identifier: AGPL-3.0-only
//! Read-only clients for industrial and grid control systems (roadmap 0.42 I7;
//! docs/INDUSTRIAL.md): Modbus TCP and DNP3 over TCP. OPC UA is in [`crate::opcua`].
//!
//! Nothing here writes to a device. Modbus requests are limited to the four read function codes
//! (1, 2, 3, 4): any other code is refused before a byte is sent. DNP3 sends READ of class 0 (all
//! static data) and, when the outstation asks for one, the application-layer confirm the
//! protocol requires; no control, write, freeze or restart request is ever built.
//!
//! Modbus follows the Modbus Application Protocol V1.1b3 and the Messaging on TCP/IP
//! Implementation Guide V1.0b (both published by the Modbus Organization). DNP3 follows IEEE
//! 1815-2012 for the link frame, CRC, transport header and the object variations decoded below
//! (binary input, double-bit input, binary output status, counter, analog input and analog
//! output status).

use std::io::{Read, Write};
use std::net::{SocketAddr, TcpStream};
use std::time::Duration;

fn fail(proto: &str, why: impl std::fmt::Display) -> String {
    crate::terr!("e-connect-ops-failed", proto = proto, why = why.to_string())
}

fn connect(addr: SocketAddr, timeout: Duration) -> Result<TcpStream, String> {
    let s = TcpStream::connect_timeout(&addr, timeout).map_err(|e| format!("{addr}: {e}"))?;
    s.set_read_timeout(Some(timeout))
        .map_err(|e| e.to_string())?;
    s.set_write_timeout(Some(timeout))
        .map_err(|e| e.to_string())?;
    Ok(s)
}

// ------------------------------------------------------------------------------- Modbus TCP

/// Encode a Modbus TCP read request (MBAP header and PDU). `func` must be 1, 2, 3 or 4.
pub fn modbus_request(
    tid: u16,
    unit: u8,
    func: u8,
    start: u16,
    count: u16,
) -> Result<[u8; 12], String> {
    let max = if func <= 2 { 2000 } else { 125 };
    if !(1..=4).contains(&func) || count == 0 || count > max {
        return Err(fail("modbus", format!("fc {func} count {count}")));
    }
    let [t0, t1] = tid.to_be_bytes();
    let [s0, s1] = start.to_be_bytes();
    let [c0, c1] = count.to_be_bytes();
    Ok([t0, t1, 0, 0, 0, 6, unit, func, s0, s1, c0, c1])
}

/// Parse a Modbus TCP response to [`modbus_request`]: registers for codes 3 and 4, one 0 or 1 per
/// coil or input for codes 1 and 2. An exception response is an error naming its code.
pub fn modbus_parse(
    b: &[u8],
    tid: u16,
    unit: u8,
    func: u8,
    count: u16,
) -> Result<Vec<u16>, String> {
    if b.len() < 9 || b[0..2] != tid.to_be_bytes() || b[2..4] != [0, 0] || b[6] != unit {
        return Err(fail("modbus", "header"));
    }
    if b[7] == func | 0x80 {
        return Err(fail("modbus", format!("exception {}", b[8])));
    }
    let n = b[8] as usize;
    if b[7] != func || b.len() < 9 + n || usize::from(u16::from_be_bytes([b[4], b[5]])) != 3 + n {
        return Err(fail("modbus", "length"));
    }
    let d = &b[9..9 + n];
    let c = usize::from(count);
    if func <= 2 {
        if n != c.div_ceil(8) {
            return Err(fail("modbus", "length"));
        }
        Ok((0..c).map(|i| u16::from(d[i / 8] >> (i % 8) & 1)).collect())
    } else {
        if n != 2 * c {
            return Err(fail("modbus", "length"));
        }
        Ok(d.chunks(2)
            .map(|w| u16::from_be_bytes([w[0], w[1]]))
            .collect())
    }
}

/// Read `count` items from `start` with function code `func` (1 coils, 2 discrete inputs,
/// 3 holding registers, 4 input registers).
pub fn modbus_read(
    addr: SocketAddr,
    unit: u8,
    func: u8,
    start: u16,
    count: u16,
    timeout: Duration,
) -> Result<Vec<u16>, String> {
    let req = modbus_request(1, unit, func, start, count)?;
    let mut s = connect(addr, timeout)?;
    s.write_all(&req).map_err(|e| fail("modbus", e))?;
    let mut head = [0u8; 7];
    s.read_exact(&mut head).map_err(|e| fail("modbus", e))?;
    let len = usize::from(u16::from_be_bytes([head[4], head[5]]));
    if !(2..=254).contains(&len) {
        return Err(fail("modbus", "length"));
    }
    let mut rest = vec![0u8; len - 1];
    s.read_exact(&mut rest).map_err(|e| fail("modbus", e))?;
    let mut all = head.to_vec();
    all.extend(rest);
    modbus_parse(&all, 1, unit, func, count)
}

// ------------------------------------------------------------------------------------ DNP3

/// The DNP3 CRC (IEEE 1815 clause 9.2.5: polynomial 0x3D65, reflected, complemented).
pub fn dnp3_crc(data: &[u8]) -> u16 {
    let mut crc = 0u16;
    for &b in data {
        crc ^= u16::from(b);
        for _ in 0..8 {
            crc = if crc & 1 != 0 {
                (crc >> 1) ^ 0xA6BC
            } else {
                crc >> 1
            };
        }
    }
    !crc
}

/// One link-layer frame: header with its CRC, then the user data in 16-byte blocks, each with
/// its CRC (CRCs little-endian).
pub fn dnp3_frame(ctrl: u8, dest: u16, src: u16, user: &[u8]) -> Vec<u8> {
    let [d0, d1] = dest.to_le_bytes();
    let [s0, s1] = src.to_le_bytes();
    let mut f = vec![0x05, 0x64, (5 + user.len()) as u8, ctrl, d0, d1, s0, s1];
    f.extend(dnp3_crc(&f).to_le_bytes());
    for blk in user.chunks(16) {
        f.extend_from_slice(blk);
        f.extend(dnp3_crc(blk).to_le_bytes());
    }
    f
}

/// One link frame: (bytes used, control, destination, source, user data).
pub type Dnp3Frame = (usize, u8, u16, u16, Vec<u8>);

/// Split one link frame off the front of `b`: (bytes used, control, destination, source, user
/// data), with every CRC checked. `None` when `b` holds less than a whole frame.
pub fn dnp3_unframe(b: &[u8]) -> Result<Option<Dnp3Frame>, String> {
    if b.len() < 10 {
        return Ok(None);
    }
    if b[0..2] != [0x05, 0x64] || b[2] < 5 {
        return Err(fail("dnp3", "start"));
    }
    if dnp3_crc(&b[..8]).to_le_bytes() != b[8..10] {
        return Err(fail("dnp3", "crc"));
    }
    let n = usize::from(b[2]) - 5;
    let total = 10 + n + 2 * n.div_ceil(16);
    if b.len() < total {
        return Ok(None);
    }
    let mut user = Vec::with_capacity(n);
    let mut i = 10;
    let mut left = n;
    while left > 0 {
        let k = left.min(16);
        let blk = &b[i..i + k];
        if dnp3_crc(blk).to_le_bytes() != b[i + k..i + k + 2] {
            return Err(fail("dnp3", "crc"));
        }
        user.extend_from_slice(blk);
        i += k + 2;
        left -= k;
    }
    let dest = u16::from_le_bytes([b[4], b[5]]);
    let src = u16::from_le_bytes([b[6], b[7]]);
    Ok(Some((total, b[3], dest, src, user)))
}

/// The master's READ of class 0 data (group 60 variation 1, all objects), framed as unconfirmed
/// user data with a single-segment transport header.
pub fn dnp3_read_class0(dest: u16, src: u16, seq: u8) -> Vec<u8> {
    let app = [0xC0 | (seq & 0x0F), 0x01, 60, 1, 0x06];
    let mut user = vec![0xC0 | (seq & 0x3F)];
    user.extend_from_slice(&app);
    dnp3_frame(0xC4, dest, src, &user)
}

/// One decoded DNP3 point.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct Dnp3Point {
    /// Object group (1 binary input, 3 double-bit input, 10 binary output, 20 counter, 30
    /// analog input, 40 analog output status).
    pub group: u8,
    /// Object variation.
    pub variation: u8,
    /// Point index.
    pub index: u32,
    /// The value: 0/1 for binary points, 0 to 3 for double-bit, the number otherwise.
    pub value: f64,
    /// The flag octet when the variation carries one (bit 0 ONLINE).
    pub flags: Option<u8>,
}

/// A decoded application-layer response.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct Dnp3Response {
    /// Function code (0x81 response, 0x82 unsolicited).
    pub function: u8,
    /// Internal indications (IIN1 in the high octet).
    pub iin: u16,
    /// Points decoded, in the order sent.
    pub points: Vec<Dnp3Point>,
    /// The first object header this reader does not decode, `g<group>v<variation>`; decoding
    /// stops there.
    pub stopped_at: Option<String>,
}

// (flag octet, value bytes, value kind): 0 none, 1 signed, 2 unsigned, 3 float.
fn layout(g: u8, v: u8) -> Option<(bool, usize, u8)> {
    Some(match (g, v) {
        (1, 2) | (3, 2) | (10, 2) => (true, 0, 0),
        (20, 1) => (true, 4, 2),
        (20, 2) => (true, 2, 2),
        (20, 5) => (false, 4, 2),
        (20, 6) => (false, 2, 2),
        (30, 1) | (40, 1) => (true, 4, 1),
        (30, 2) | (40, 2) => (true, 2, 1),
        (30, 3) => (false, 4, 1),
        (30, 4) => (false, 2, 1),
        (30, 5) | (40, 3) => (true, 4, 3),
        (30, 6) | (40, 4) => (true, 8, 3),
        _ => return None,
    })
}

fn le(b: &[u8]) -> u64 {
    b.iter().rev().fold(0, |a, &x| a << 8 | u64::from(x))
}

/// Decode an application-layer response fragment (after transport reassembly).
pub fn dnp3_parse_response(a: &[u8]) -> Result<Dnp3Response, String> {
    let short = || fail("dnp3", "short");
    if a.len() < 4 || !matches!(a[1], 0x81 | 0x82) {
        return Err(fail("dnp3", "function"));
    }
    let mut r = Dnp3Response {
        function: a[1],
        iin: u16::from_be_bytes([a[2], a[3]]),
        points: Vec::new(),
        stopped_at: None,
    };
    let mut i = 4;
    while i + 3 <= a.len() {
        let (g, v, q) = (a[i], a[i + 1], a[i + 2]);
        i += 3;
        // Ranges (qualifier 0x00, 0x01) give consecutive indices; counts with an index prefix
        // (0x17, 0x28) give an index before each object.
        let (first, n, prefix) = match q {
            0x00 => {
                let h = a.get(i..i + 2).ok_or_else(short)?;
                i += 2;
                (u32::from(h[0]), i64::from(h[1]) - i64::from(h[0]) + 1, 0)
            }
            0x01 => {
                let h = a.get(i..i + 4).ok_or_else(short)?;
                i += 4;
                let (s, e) = (le(&h[..2]), le(&h[2..]));
                (s as u32, e as i64 - s as i64 + 1, 0)
            }
            0x17 => {
                let h = *a.get(i).ok_or_else(short)?;
                i += 1;
                (0, i64::from(h), 1)
            }
            0x28 => {
                let h = a.get(i..i + 2).ok_or_else(short)?;
                i += 2;
                (0, le(h) as i64, 2)
            }
            _ => {
                r.stopped_at = Some(format!("g{g}v{v}q{q:02x}"));
                return Ok(r);
            }
        };
        if !(0..=65536).contains(&n) {
            return Err(fail("dnp3", "range"));
        }
        if (g, v) == (1, 1) && prefix == 0 {
            let bytes = a.get(i..i + (n as usize).div_ceil(8)).ok_or_else(short)?;
            for k in 0..n as usize {
                let value = f64::from(bytes[k / 8] >> (k % 8) & 1);
                let index = first + k as u32;
                r.points.push(Dnp3Point {
                    group: 1,
                    variation: 1,
                    index,
                    value,
                    flags: None,
                });
            }
            i += bytes.len();
            continue;
        }
        let Some((flag, size, kind)) = layout(g, v) else {
            r.stopped_at = Some(format!("g{g}v{v}"));
            return Ok(r);
        };
        for k in 0..n as u32 {
            let index = if prefix == 0 {
                first + k
            } else {
                let p = a.get(i..i + prefix).ok_or_else(short)?;
                i += prefix;
                le(p) as u32
            };
            let flags = if flag {
                i += 1;
                Some(*a.get(i - 1).ok_or_else(short)?)
            } else {
                None
            };
            let raw = a.get(i..i + size).ok_or_else(short)?;
            i += size;
            let value = match (kind, size) {
                (0, _) if g == 3 => f64::from(flags.unwrap_or(0) >> 6),
                (0, _) => f64::from(flags.unwrap_or(0) >> 7),
                (1, 2) => f64::from(le(raw) as u16 as i16),
                (1, _) => f64::from(le(raw) as u32 as i32),
                (3, 4) => f64::from(f32::from_bits(le(raw) as u32)),
                (3, _) => f64::from_bits(le(raw)),
                _ => le(raw) as f64,
            };
            r.points.push(Dnp3Point {
                group: g,
                variation: v,
                index,
                value,
                flags,
            });
        }
    }
    Ok(r)
}

/// READ class 0 from an outstation over TCP: link frames are reassembled through the transport
/// header, and an application confirm is sent when the response asks for one.
pub fn dnp3_read(
    addr: SocketAddr,
    master: u16,
    outstation: u16,
    timeout: Duration,
) -> Result<Dnp3Response, String> {
    let mut s = connect(addr, timeout)?;
    s.write_all(&dnp3_read_class0(outstation, master, 0))
        .map_err(|e| fail("dnp3", e))?;
    let (mut buf, mut app) = (Vec::new(), Vec::new());
    let mut chunk = [0u8; 2048];
    loop {
        while let Some((used, _ctrl, dest, src, user)) = dnp3_unframe(&buf)? {
            buf.drain(..used);
            if dest != master || src != outstation || user.is_empty() {
                continue;
            }
            if user[0] & 0x40 != 0 {
                app.clear();
            }
            app.extend_from_slice(&user[1..]);
            if user[0] & 0x80 != 0 {
                let r = dnp3_parse_response(&app)?;
                if app[0] & 0x20 != 0 {
                    let confirm = [0xC0, app[0] & 0x0F | 0xC0, 0x00];
                    let _ = s.write_all(&dnp3_frame(0xC4, outstation, master, &confirm));
                }
                if r.function == 0x81 {
                    return Ok(r);
                }
                app.clear();
            }
        }
        let k = s.read(&mut chunk).map_err(|e| fail("dnp3", e))?;
        if k == 0 {
            return Err(fail("dnp3", "closed"));
        }
        buf.extend_from_slice(&chunk[..k]);
    }
}
