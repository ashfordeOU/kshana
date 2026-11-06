// SPDX-License-Identifier: AGPL-3.0-only
//! NTRIP client (roadmap L4a): fetch RTCM 3 corrections or observations from a caster.
//!
//! The client sends one HTTP request for a mountpoint, with Basic authentication when a user is
//! given and, for casters that pick the stream by position, an `Ntrip-GGA` header (NTRIP 2) or a
//! GGA sentence after the request (NTRIP 1). It accepts both answers: `ICY 200 OK` (NTRIP 1, the
//! stream follows the head) and `HTTP/1.1 200 OK` (NTRIP 2, with or without chunked transfer
//! encoding). `GET /` gives the caster's source table instead. A refusal (401, 404, `SOURCETABLE` for
//! an unknown mountpoint) is reported, never retried silently.
//!
//! The bytes are passed on unchanged, and [`RtcmCounter`] counts the RTCM 3 frames whose CRC-24Q
//! checks, so a run can say how much arrived intact. Plain TCP only: for a caster on HTTPS, use a
//! local TLS relay. The request layout is the one NTRIP casters document publicly (RTCM 10410.1 is
//! not reproduced or consulted here).
use std::io::{BufRead, BufReader, Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::Duration;

/// How to reach a mountpoint.
#[derive(Clone, Debug)]
pub struct NtripConfig {
    /// `host:port` (2101 is the usual port).
    pub addr: String,
    /// Mountpoint name, or empty for the source table.
    pub mountpoint: String,
    /// User and password, when the caster asks for them.
    pub credentials: Option<(String, String)>,
    /// A GGA sentence (with `$` and checksum) for casters that choose the stream by position.
    pub gga: Option<String>,
}

/// What the caster answered.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Answer {
    /// `ICY 200 OK`: NTRIP 1, the stream follows.
    Ntrip1,
    /// `HTTP/1.1 200 OK`; `chunked` when the body uses chunked transfer encoding.
    Ntrip2 {
        /// Chunked transfer encoding.
        chunked: bool,
    },
    /// The source table (asked for, or given for an unknown mountpoint).
    SourceTable,
}

/// A GGA sentence for a position, to send with the request (time 00:00:00, fix quality 1, 12
/// satellites, HDOP 1.0: what casters read is the position).
pub fn gga(lat_deg: f64, lon_deg: f64, height_m: f64) -> String {
    let (la, ns) = (lat_deg.abs(), if lat_deg >= 0.0 { 'N' } else { 'S' });
    let (lo, ew) = (lon_deg.abs(), if lon_deg >= 0.0 { 'E' } else { 'W' });
    let lat = format!("{:02}{:07.4}", la.trunc() as u32, la.fract() * 60.0);
    let lon = format!("{:03}{:07.4}", lo.trunc() as u32, lo.fract() * 60.0);
    let body = format!("GPGGA,000000.00,{lat},{ns},{lon},{ew},1,12,1.0,{height_m:.1},M,0.0,M,,");
    let ck = body.bytes().fold(0u8, |a, b| a ^ b);
    format!("${body}*{ck:02X}")
}

/// RFC 4648 Base64 (for Basic authentication).
fn b64(bytes: &[u8]) -> String {
    crate::permalink::base64_encode(bytes)
}

/// The request bytes for `cfg`.
pub fn request(cfg: &NtripConfig) -> String {
    let mut r = format!(
        "GET /{} HTTP/1.1\r\nHost: {}\r\nNtrip-Version: Ntrip/2.0\r\nUser-Agent: NTRIP Kshana/{}\r\nConnection: close\r\n",
        cfg.mountpoint,
        cfg.addr,
        env!("CARGO_PKG_VERSION")
    );
    if let Some((u, p)) = &cfg.credentials {
        r.push_str(&format!(
            "Authorization: Basic {}\r\n",
            b64(format!("{u}:{p}").as_bytes())
        ));
    }
    if let Some(g) = &cfg.gga {
        r.push_str(&format!("Ntrip-GGA: {g}\r\n"));
    }
    r.push_str("\r\n");
    r
}

/// An open stream: read it with [`Read`] (chunked encoding is removed).
pub struct NtripStream {
    r: BufReader<TcpStream>,
    /// How the caster answered.
    pub answer: Answer,
    chunked_left: Option<usize>,
    done: bool,
}

impl NtripStream {
    /// Connect, send the request, and read the answer's head.
    pub fn open(cfg: &NtripConfig) -> Result<Self, String> {
        let a = cfg
            .addr
            .to_socket_addrs()
            .map_err(|e| format!("{}: {e}", cfg.addr))?
            .next()
            .ok_or_else(|| cfg.addr.clone())?;
        let mut s = TcpStream::connect_timeout(&a, Duration::from_secs(5))
            .map_err(|e| format!("{}: {e}", cfg.addr))?;
        s.set_read_timeout(Some(Duration::from_secs(30)))
            .map_err(|e| e.to_string())?;
        s.write_all(request(cfg).as_bytes())
            .map_err(|e| e.to_string())?;
        let mut r = BufReader::new(s);
        let mut status = String::new();
        r.read_line(&mut status).map_err(|e| e.to_string())?;
        let status = status.trim_end().to_string();
        let mut headers = Vec::new();
        if !status.starts_with("ICY ") {
            loop {
                let mut l = String::new();
                if r.read_line(&mut l).map_err(|e| e.to_string())? == 0 {
                    break;
                }
                let l = l.trim_end().to_string();
                if l.is_empty() {
                    break;
                }
                headers.push(l);
            }
        }
        let header = |name: &str| {
            headers.iter().find_map(|h| {
                h.split_once(':')
                    .filter(|(k, _)| k.trim().eq_ignore_ascii_case(name))
                    .map(|(_, v)| v.trim().to_ascii_lowercase())
            })
        };
        let code = status.split_whitespace().nth(1).unwrap_or("");
        let answer = if status.starts_with("SOURCETABLE")
            || header("content-type").is_some_and(|t| t.contains("gnss/sourcetable"))
        {
            Answer::SourceTable
        } else if status.starts_with("ICY ") && code == "200" {
            Answer::Ntrip1
        } else if status.starts_with("HTTP/") && code == "200" {
            Answer::Ntrip2 {
                chunked: header("transfer-encoding").is_some_and(|t| t.contains("chunked")),
            }
        } else {
            return Err(crate::terr!("e-ntrip-refused", status = status.clone()));
        };
        if answer == Answer::Ntrip1 {
            if let Some(g) = &cfg.gga {
                // NTRIP 1 casters read the position as a sentence after the request.
                r.get_mut()
                    .write_all(format!("{g}\r\n").as_bytes())
                    .map_err(|e| e.to_string())?;
            }
        }
        if !cfg.mountpoint.is_empty() && answer == Answer::SourceTable {
            return Err(crate::terr!(
                "e-ntrip-no-mountpoint",
                mountpoint = cfg.mountpoint.clone()
            ));
        }
        let chunked = matches!(answer, Answer::Ntrip2 { chunked: true });
        Ok(Self {
            r,
            answer,
            chunked_left: if chunked { Some(0) } else { None },
            done: false,
        })
    }
}

impl Read for NtripStream {
    fn read(&mut self, buf: &mut [u8]) -> std::io::Result<usize> {
        if self.done || buf.is_empty() {
            return Ok(0);
        }
        let Some(left) = self.chunked_left else {
            return self.r.read(buf);
        };
        let mut left = left;
        if left == 0 {
            // A chunk-size line: hex size, optional extensions, CRLF.
            let mut line = String::new();
            if self.r.read_line(&mut line)? == 0 {
                self.done = true;
                return Ok(0);
            }
            let size = line.trim().split(';').next().unwrap_or("").trim();
            let size = usize::from_str_radix(size, 16).map_err(|_| {
                std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    crate::terr!("e-ntrip-chunk"),
                )
            })?;
            if size == 0 {
                self.done = true;
                return Ok(0);
            }
            left = size;
        }
        let n = buf.len().min(left);
        let got = self.r.read(&mut buf[..n])?;
        if got == 0 {
            self.done = true;
            return Ok(0);
        }
        left -= got;
        if left == 0 {
            let mut crlf = [0u8; 2];
            self.r.read_exact(&mut crlf)?;
        }
        self.chunked_left = Some(left);
        Ok(got)
    }
}

/// Counts RTCM 3 frames in a byte stream as it passes, whatever the chunk boundaries.
#[derive(Clone, Debug, Default)]
pub struct RtcmCounter {
    buf: Vec<u8>,
    /// Frames whose CRC-24Q checks.
    pub frames: u64,
    /// Frames whose CRC did not check.
    pub bad_crc: u64,
    /// Message numbers seen, with counts.
    pub messages: std::collections::BTreeMap<u16, u64>,
}

impl RtcmCounter {
    /// Take the next bytes.
    pub fn push(&mut self, bytes: &[u8]) {
        self.buf.extend_from_slice(bytes);
        let mut i = 0;
        while i + 3 <= self.buf.len() {
            if self.buf[i] != 0xD3 {
                i += 1;
                continue;
            }
            let len = (usize::from(self.buf[i + 1] & 0x03) << 8) | usize::from(self.buf[i + 2]);
            let end = i + 3 + len + 3;
            if end > self.buf.len() {
                break; // wait for the rest of this frame
            }
            let want = (u32::from(self.buf[end - 3]) << 16)
                | (u32::from(self.buf[end - 2]) << 8)
                | u32::from(self.buf[end - 1]);
            if crate::receiver_trust::machines::rtcm3::crc24q(&self.buf[i..end - 3]) == want {
                self.frames += 1;
                if len >= 2 {
                    let msg = (u16::from(self.buf[i + 3]) << 4) | (u16::from(self.buf[i + 4]) >> 4);
                    *self.messages.entry(msg).or_default() += 1;
                }
                i = end;
            } else {
                self.bad_crc += 1;
                i += 1;
            }
        }
        self.buf.drain(..i);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gga_sentences_carry_a_valid_checksum() {
        let g = gga(59.4375, 24.7536, 30.0);
        assert!(g.starts_with("$GPGGA,000000.00,5926.2500,N,02445.2160,E,1,12,1.0,30.0,M,"));
        let (body, ck) = g[1..].split_once('*').unwrap();
        assert_eq!(
            u8::from_str_radix(ck, 16).unwrap(),
            body.bytes().fold(0, |a, b| a ^ b)
        );
        assert!(gga(-33.9, -70.5, 0.0).contains(",S,") && gga(-33.9, -70.5, 0.0).contains(",W,"));
    }
}
