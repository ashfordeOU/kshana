// SPDX-License-Identifier: AGPL-3.0-only
//! Live ingest from a WebSocket (roadmap A3a): connect to a `ws://` endpoint that streams rows and turn
//! them into `kshana.obs/1` records with a Kshana Connect mapping.
//!
//! The client speaks RFC 6455 over TCP: the HTTP/1.1 upgrade with a random key, checked against the
//! server's `Sec-WebSocket-Accept`; then text and binary messages in (fragments are joined), a ping is
//! answered with a pong, and a close ends the stream. Frames the client sends are masked, as the
//! standard requires. Each message is one or more rows of the mapping's format and goes through the
//! same continuous-log feed as an MQTT subscription ([`crate::connect_mqtt::Feed`]).
//!
//! TLS (`wss://`) is not built in: the default build adds no crate. Run a local TLS relay and connect to
//! it with `ws://`. The frame layout and the accept-key rule are from RFC 6455, a public document.
use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::Duration;

const GUID: &str = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";

/// `Sec-WebSocket-Accept` for a client key (RFC 6455 section 4.2.2).
pub fn accept_key(key: &str) -> String {
    use sha1::{Digest, Sha1};
    let mut h = Sha1::new();
    h.update(key.as_bytes());
    h.update(GUID.as_bytes());
    crate::permalink::base64_encode(&h.finalize())
}

/// Host, port and path of a `ws://` URL.
pub fn parse_url(url: &str) -> Result<(String, u16, String), String> {
    let bad = || crate::terr!("e-connect-ws-url", url = url.to_string());
    let rest = url.strip_prefix("ws://").ok_or_else(bad)?;
    let (auth, path) = match rest.find('/') {
        Some(i) => (&rest[..i], &rest[i..]),
        None => (rest, "/"),
    };
    let (host, port) = match auth.rsplit_once(':') {
        Some((h, p)) if !h.ends_with(']') || h.starts_with('[') => {
            (h, p.parse::<u16>().map_err(|_| bad())?)
        }
        _ => (auth, 80),
    };
    if host.is_empty() {
        return Err(bad());
    }
    Ok((host.to_string(), port, path.to_string()))
}

/// A frame the client sends: FIN set, masked with `mask`.
pub fn client_frame(opcode: u8, payload: &[u8], mask: [u8; 4]) -> Vec<u8> {
    let mut f = vec![0x80 | opcode];
    let n = payload.len();
    if n < 126 {
        f.push(0x80 | n as u8);
    } else if n <= 0xFFFF {
        f.push(0x80 | 126);
        f.extend((n as u16).to_be_bytes());
    } else {
        f.push(0x80 | 127);
        f.extend((n as u64).to_be_bytes());
    }
    f.extend(mask);
    f.extend(payload.iter().enumerate().map(|(i, b)| b ^ mask[i % 4]));
    f
}

/// An open WebSocket.
pub struct WsClient {
    s: TcpStream,
    /// Largest message accepted, bytes.
    pub max_message: usize,
}

fn io(e: std::io::Error) -> String {
    e.to_string()
}

impl WsClient {
    /// Connect and complete the upgrade.
    pub fn connect(url: &str) -> Result<Self, String> {
        let (host, port, path) = parse_url(url)?;
        let a = (host.as_str(), port)
            .to_socket_addrs()
            .map_err(|e| format!("{url}: {e}"))?
            .next()
            .ok_or_else(|| url.to_string())?;
        let mut s = TcpStream::connect_timeout(&a, Duration::from_secs(5))
            .map_err(|e| format!("{url}: {e}"))?;
        s.set_read_timeout(Some(Duration::from_secs(10)))
            .map_err(io)?;
        s.set_nodelay(true).map_err(io)?;
        let key = crate::permalink::base64_encode(&rand::random::<[u8; 16]>());
        let req = format!(
            "GET {path} HTTP/1.1\r\nHost: {host}:{port}\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: {key}\r\nSec-WebSocket-Version: 13\r\n\r\n"
        );
        s.write_all(req.as_bytes()).map_err(io)?;
        let mut head = Vec::new();
        let mut b = [0u8; 1];
        while !head.ends_with(b"\r\n\r\n") {
            if head.len() > 16_384 {
                return Err(crate::terr!("e-connect-ws-handshake"));
            }
            s.read_exact(&mut b).map_err(io)?;
            head.push(b[0]);
        }
        let head = String::from_utf8_lossy(&head);
        let mut lines = head.lines();
        let status_ok = lines
            .next()
            .is_some_and(|l| l.split_whitespace().nth(1) == Some("101"));
        let want = accept_key(&key);
        let accept_ok = lines.any(|l| {
            l.split_once(':').is_some_and(|(k, v)| {
                k.trim().eq_ignore_ascii_case("sec-websocket-accept") && v.trim() == want
            })
        });
        if !(status_ok && accept_ok) {
            return Err(crate::terr!("e-connect-ws-handshake"));
        }
        s.set_read_timeout(None).map_err(io)?;
        Ok(Self {
            s,
            max_message: 16 << 20,
        })
    }

    fn send(&mut self, opcode: u8, payload: &[u8]) -> Result<(), String> {
        let f = client_frame(opcode, payload, rand::random());
        self.s.write_all(&f).map_err(io)
    }

    /// The next text or binary message; `Ok(None)` when the server closed the stream.
    pub fn next_message(&mut self) -> Result<Option<Vec<u8>>, String> {
        let mut msg: Vec<u8> = Vec::new();
        let mut in_message = false;
        loop {
            let mut h = [0u8; 2];
            match self.s.read_exact(&mut h) {
                Ok(()) => {}
                Err(e) if e.kind() == std::io::ErrorKind::UnexpectedEof => return Ok(None),
                Err(e) => return Err(e.to_string()),
            }
            let fin = h[0] & 0x80 != 0;
            let opcode = h[0] & 0x0F;
            let masked = h[1] & 0x80 != 0;
            let mut n = u64::from(h[1] & 0x7F);
            if n == 126 {
                let mut x = [0u8; 2];
                self.s.read_exact(&mut x).map_err(io)?;
                n = u64::from(u16::from_be_bytes(x));
            } else if n == 127 {
                let mut x = [0u8; 8];
                self.s.read_exact(&mut x).map_err(io)?;
                n = u64::from_be_bytes(x);
            }
            let mut mask = [0u8; 4];
            if masked {
                self.s.read_exact(&mut mask).map_err(io)?;
            }
            if n > self.max_message as u64 || msg.len() as u64 + n > self.max_message as u64 {
                return Err(crate::terr!("e-connect-ws-too-large"));
            }
            let mut p = vec![0u8; n as usize];
            self.s.read_exact(&mut p).map_err(io)?;
            if masked {
                for (i, b) in p.iter_mut().enumerate() {
                    *b ^= mask[i % 4];
                }
            }
            match opcode {
                0x8 => {
                    let _ = self.send(0x8, p.get(..2).unwrap_or_default());
                    return Ok(None);
                }
                0x9 => self.send(0xA, &p)?,
                0xA => {}
                0x1 | 0x2 if !in_message => {
                    msg = p;
                    in_message = true;
                    if fin {
                        return Ok(Some(msg));
                    }
                }
                0x0 if in_message => {
                    msg.extend(p);
                    if fin {
                        return Ok(Some(msg));
                    }
                }
                _ => return Err(crate::terr!("e-connect-ws-protocol")),
            }
        }
    }

    /// Send a close frame (normal closure).
    pub fn close(mut self) {
        let _ = self.send(0x8, &1000u16.to_be_bytes());
    }
}
