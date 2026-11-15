// SPDX-License-Identifier: AGPL-3.0-only
//! A read-only OPC UA client over the binary protocol `opc.tcp` (roadmap 0.42 I7;
//! docs/INDUSTRIAL.md), following OPC 10000-6 (mappings: UA TCP, UA Secure Conversation, binary
//! encoding) and OPC 10000-4 (services).
//!
//! One exchange: Hello, OpenSecureChannel (security policy None), CreateSession,
//! ActivateSession with an anonymous identity, Read of the Value attribute of the nodes asked
//! for, CloseSecureChannel. Only Read is built; there is no Write, Call or subscription request in
//! this module. Policy None sends everything in clear: use it on a trusted network or through a
//! tunnel. Signed and encrypted policies are not implemented.

use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::Duration;

fn fail(why: impl std::fmt::Display) -> String {
    crate::terr!(
        "e-connect-ops-failed",
        proto = "opcua",
        why = why.to_string()
    )
}

/// A NodeId: namespace and a numeric or string identifier.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum NodeId {
    /// `ns=<n>;i=<id>`.
    Numeric(u16, u32),
    /// `ns=<n>;s=<id>`.
    Str(u16, String),
    /// Any other form (GUID, opaque), kept as read.
    Other(Vec<u8>),
}

impl NodeId {
    /// Parse `i=85`, `ns=2;i=7` or `ns=2;s=Clock.Offset`.
    pub fn parse(t: &str) -> Option<NodeId> {
        let (ns, id) = match t.strip_prefix("ns=") {
            Some(r) => {
                let (n, rest) = r.split_once(';')?;
                (n.parse().ok()?, rest)
            }
            None => (0, t),
        };
        if let Some(v) = id.strip_prefix("i=") {
            return Some(NodeId::Numeric(ns, v.parse().ok()?));
        }
        id.strip_prefix("s=")
            .map(|s| NodeId::Str(ns, s.to_string()))
    }
}

/// Binary encoder.
#[derive(Default)]
pub struct Enc(pub Vec<u8>);

impl Enc {
    fn u8(&mut self, v: u8) -> &mut Self {
        self.0.push(v);
        self
    }
    fn u16(&mut self, v: u16) -> &mut Self {
        self.0.extend(v.to_le_bytes());
        self
    }
    fn u32(&mut self, v: u32) -> &mut Self {
        self.0.extend(v.to_le_bytes());
        self
    }
    fn i32(&mut self, v: i32) -> &mut Self {
        self.0.extend(v.to_le_bytes());
        self
    }
    fn f64(&mut self, v: f64) -> &mut Self {
        self.0.extend(v.to_le_bytes());
        self
    }
    fn i64(&mut self, v: i64) -> &mut Self {
        self.0.extend(v.to_le_bytes());
        self
    }
    /// A String or ByteString; `None` is the null value (length -1).
    fn bytes(&mut self, v: Option<&[u8]>) -> &mut Self {
        match v {
            None => self.i32(-1),
            Some(b) => {
                self.i32(b.len() as i32);
                self.0.extend_from_slice(b);
                self
            }
        }
    }
    fn s(&mut self, v: &str) -> &mut Self {
        self.bytes(Some(v.as_bytes()))
    }
    fn node(&mut self, n: &NodeId) -> &mut Self {
        match n {
            NodeId::Numeric(0, i) if *i < 256 => self.u8(0).u8(*i as u8),
            NodeId::Numeric(ns, i) if *ns < 256 && *i < 65536 => {
                self.u8(1).u8(*ns as u8).u16(*i as u16)
            }
            NodeId::Numeric(ns, i) => self.u8(2).u16(*ns).u32(*i),
            NodeId::Str(ns, s) => self.u8(3).u16(*ns).s(s),
            NodeId::Other(raw) => {
                self.0.extend_from_slice(raw);
                self
            }
        }
    }
    fn header(&mut self, token: &NodeId, handle: u32) -> &mut Self {
        // RequestHeader: token, timestamp, handle, diagnostics, audit id, timeout hint, header.
        self.node(token)
            .i64(0)
            .u32(handle)
            .u32(0)
            .bytes(None)
            .u32(10_000)
            .u16(0)
            .u8(0)
    }
}

/// Binary decoder.
pub struct Dec<'a> {
    b: &'a [u8],
    i: usize,
}

impl<'a> Dec<'a> {
    /// Decode from the start of `b`.
    pub fn new(b: &'a [u8]) -> Self {
        Dec { b, i: 0 }
    }
    fn take(&mut self, n: usize) -> Result<&'a [u8], String> {
        let s = self
            .b
            .get(self.i..self.i + n)
            .ok_or_else(|| fail("short"))?;
        self.i += n;
        Ok(s)
    }
    fn u8(&mut self) -> Result<u8, String> {
        Ok(self.take(1)?[0])
    }
    fn u16(&mut self) -> Result<u16, String> {
        Ok(u16::from_le_bytes(
            self.take(2)?.try_into().unwrap_or_default(),
        ))
    }
    fn u32(&mut self) -> Result<u32, String> {
        Ok(u32::from_le_bytes(
            self.take(4)?.try_into().unwrap_or_default(),
        ))
    }
    fn u64(&mut self) -> Result<u64, String> {
        Ok(u64::from_le_bytes(
            self.take(8)?.try_into().unwrap_or_default(),
        ))
    }
    fn bytes(&mut self) -> Result<Option<&'a [u8]>, String> {
        let n = self.u32()? as i32;
        if n < 0 {
            return Ok(None);
        }
        self.take(n as usize).map(Some)
    }
    fn s(&mut self) -> Result<String, String> {
        Ok(String::from_utf8_lossy(self.bytes()?.unwrap_or_default()).into_owned())
    }
    /// A NodeId (or the NodeId part of an ExpandedNodeId when `expanded`).
    fn node(&mut self) -> Result<NodeId, String> {
        let start = self.i;
        let m = self.u8()?;
        let n = match m & 0x3F {
            0 => NodeId::Numeric(0, u32::from(self.u8()?)),
            1 => NodeId::Numeric(u16::from(self.u8()?), u32::from(self.u16()?)),
            2 => NodeId::Numeric(self.u16()?, self.u32()?),
            3 => NodeId::Str(self.u16()?, self.s()?),
            4 => {
                self.take(18)?;
                NodeId::Other(self.b[start..self.i].to_vec())
            }
            5 => {
                self.u16()?;
                self.bytes()?;
                NodeId::Other(self.b[start..self.i].to_vec())
            }
            _ => return Err(fail("nodeid")),
        };
        if m & 0x80 != 0 {
            self.s()?;
        }
        if m & 0x40 != 0 {
            self.u32()?;
        }
        Ok(n)
    }
    fn diag(&mut self) -> Result<(), String> {
        let m = self.u8()?;
        for bit in [1u8, 2, 4, 8] {
            if m & bit != 0 {
                self.u32()?;
            }
        }
        if m & 0x10 != 0 {
            self.s()?;
        }
        if m & 0x20 != 0 {
            self.u32()?;
        }
        if m & 0x40 != 0 {
            self.diag()?;
        }
        Ok(())
    }
    fn text(&mut self) -> Result<String, String> {
        let m = self.u8()?;
        if m & 1 != 0 {
            self.s()?;
        }
        if m & 2 != 0 {
            return self.s();
        }
        Ok(String::new())
    }
    fn ext(&mut self) -> Result<(), String> {
        self.node()?;
        if self.u8()? != 0 {
            self.bytes()?;
        }
        Ok(())
    }
    fn array<T>(
        &mut self,
        mut f: impl FnMut(&mut Self) -> Result<T, String>,
    ) -> Result<Vec<T>, String> {
        let n = self.u32()? as i32;
        (0..n.max(0)).map(|_| f(self)).collect()
    }
    /// ResponseHeader; returns the service result.
    fn header(&mut self) -> Result<u32, String> {
        self.u64()?;
        self.u32()?;
        let result = self.u32()?;
        self.diag()?;
        self.array(|d| d.s())?;
        self.ext()?;
        Ok(result)
    }
    fn app_description(&mut self) -> Result<(), String> {
        self.s()?;
        self.s()?;
        self.text()?;
        self.u32()?;
        self.s()?;
        self.s()?;
        self.array(|d| d.s())?;
        Ok(())
    }
    fn scalar(&mut self, t: u8) -> Result<serde_json::Value, String> {
        use serde_json::json;
        Ok(match t {
            1 => json!(self.u8()? != 0),
            2 => json!(self.u8()? as i8),
            3 => json!(self.u8()?),
            4 => json!(self.u16()? as i16),
            5 => json!(self.u16()?),
            6 => json!(self.u32()? as i32),
            7 | 19 => json!(self.u32()?),
            8 => json!(self.u64()? as i64),
            9 => json!(self.u64()?),
            10 => json!(f32::from_bits(self.u32()?)),
            11 => json!(f64::from_bits(self.u64()?)),
            12 => json!(self.s()?),
            13 => json!(filetime_to_unix(self.u64()? as i64)),
            15 => json!(hex::encode(self.bytes()?.unwrap_or_default())),
            21 => json!(self.text()?),
            _ => return Err(fail(format!("variant type {t}"))),
        })
    }
    /// A Variant: scalars and one-dimensional arrays of the built-in types decoded by `scalar`.
    pub fn variant(&mut self) -> Result<serde_json::Value, String> {
        let m = self.u8()?;
        let t = m & 0x3F;
        if t == 0 {
            return Ok(serde_json::Value::Null);
        }
        let v = if m & 0x80 != 0 {
            serde_json::Value::Array(self.array(|d| d.scalar(t))?)
        } else {
            self.scalar(t)?
        };
        if m & 0x40 != 0 {
            self.array(|d| d.u32())?;
        }
        Ok(v)
    }
    /// A DataValue as JSON: value, status code and timestamps (UNIX seconds) when present.
    pub fn data_value(&mut self) -> Result<serde_json::Value, String> {
        let m = self.u8()?;
        let mut o = serde_json::Map::new();
        if m & 1 != 0 {
            o.insert("value".into(), self.variant()?);
        }
        o.insert(
            "status".into(),
            (if m & 2 != 0 { self.u32()? } else { 0 }).into(),
        );
        for (bit, key, pico) in [(4u8, "source_time", 0x10u8), (8, "server_time", 0x20)] {
            if m & bit != 0 {
                o.insert(key.into(), filetime_to_unix(self.u64()? as i64).into());
            }
            if m & pico != 0 {
                self.u16()?;
            }
        }
        Ok(o.into())
    }
}

/// OPC UA DateTime (100 ns ticks since 1601-01-01) to UNIX seconds.
pub fn filetime_to_unix(t: i64) -> f64 {
    // 11 644 473 600 s from 1601-01-01 to 1970-01-01.
    (t - 11_644_473_600 * 10_000_000) as f64 * 1e-7
}

const POLICY_NONE: &str = "http://opcfoundation.org/UA/SecurityPolicy#None";

/// One UA TCP message: type, chunk `F`, size, then the body.
pub fn message(kind: &[u8; 3], body: &[u8]) -> Vec<u8> {
    let mut m = kind.to_vec();
    m.push(b'F');
    m.extend(((body.len() + 8) as u32).to_le_bytes());
    m.extend_from_slice(body);
    m
}

struct Conn {
    s: TcpStream,
    channel: u32,
    token: u32,
    seq: u32,
    req: u32,
}

impl Conn {
    /// Read one whole message (chunks `C` joined until `F`): (type, body after the size field).
    fn recv(&mut self) -> Result<([u8; 3], Vec<u8>), String> {
        let mut out = Vec::new();
        loop {
            let mut h = [0u8; 8];
            self.s.read_exact(&mut h).map_err(fail)?;
            let n = u32::from_le_bytes([h[4], h[5], h[6], h[7]]) as usize;
            if !(8..=1 << 24).contains(&n) {
                return Err(fail("size"));
            }
            let mut b = vec![0u8; n - 8];
            self.s.read_exact(&mut b).map_err(fail)?;
            let kind = [h[0], h[1], h[2]];
            if &kind == b"ERR" {
                let mut d = Dec::new(&b);
                let code = d.u32()?;
                return Err(fail(format!("0x{code:08X} {}", d.s().unwrap_or_default())));
            }
            // MSG/CLO: channel id, token id, sequence header; OPN carries its own header.
            if &kind == b"MSG" {
                b.drain(..16.min(b.len()));
            }
            out.extend(b);
            match h[3] {
                b'F' => return Ok((kind, out)),
                b'C' => continue,
                _ => return Err(fail("abort")),
            }
        }
    }
    /// Send one service request (type id, body) and return the response body after its type id.
    fn call(&mut self, type_id: u32, body: &[u8], expect: u32) -> Result<Vec<u8>, String> {
        self.seq += 1;
        self.req += 1;
        let mut e = Enc::default();
        e.u32(self.channel)
            .u32(self.token)
            .u32(self.seq)
            .u32(self.req);
        e.node(&NodeId::Numeric(0, type_id));
        e.0.extend_from_slice(body);
        self.s.write_all(&message(b"MSG", &e.0)).map_err(fail)?;
        let (kind, b) = self.recv()?;
        let mut d = Dec::new(&b);
        let got = d.node()?;
        if &kind != b"MSG" || got != NodeId::Numeric(0, expect) {
            return Err(fail(format!("response {got:?}")));
        }
        Ok(b[d.i..].to_vec())
    }
}

/// Read the Value attribute of `nodes` from the server at `url` (`opc.tcp://host:port/path`).
/// Returns one DataValue per node, in order, as JSON.
pub fn read_values(
    url: &str,
    nodes: &[NodeId],
    timeout: Duration,
) -> Result<Vec<serde_json::Value>, String> {
    let hostport = url
        .strip_prefix("opc.tcp://")
        .map(|r| r.split('/').next().unwrap_or(r))
        .ok_or_else(|| fail("url"))?;
    let addr = hostport
        .to_socket_addrs()
        .map_err(|e| format!("{hostport}: {e}"))?
        .next()
        .ok_or_else(|| fail("url"))?;
    let s = TcpStream::connect_timeout(&addr, timeout).map_err(|e| format!("{addr}: {e}"))?;
    s.set_read_timeout(Some(timeout)).map_err(fail)?;
    s.set_write_timeout(Some(timeout)).map_err(fail)?;
    let mut c = Conn {
        s,
        channel: 0,
        token: 0,
        seq: 0,
        req: 0,
    };

    let mut e = Enc::default();
    e.u32(0).u32(65_536).u32(65_536).u32(0).u32(0).s(url);
    c.s.write_all(&message(b"HEL", &e.0)).map_err(fail)?;
    if &c.recv()?.0 != b"ACK" {
        return Err(fail("hello"));
    }

    let null = NodeId::Numeric(0, 0);
    let mut e = Enc::default();
    e.u32(0)
        .s(POLICY_NONE)
        .bytes(None)
        .bytes(None)
        .u32(1)
        .u32(1);
    e.node(&NodeId::Numeric(0, 446)).header(&null, 1);
    e.u32(0).u32(0).u32(1).bytes(Some(&[])).u32(600_000);
    c.s.write_all(&message(b"OPN", &e.0)).map_err(fail)?;
    let (_, b) = c.recv()?;
    let mut d = Dec::new(&b);
    c.channel = d.u32()?;
    d.s()?;
    d.bytes()?;
    d.bytes()?;
    d.u32()?;
    d.u32()?;
    if d.node()? != NodeId::Numeric(0, 449) || d.header()? != 0 {
        return Err(fail("open"));
    }
    d.u32()?;
    d.u32()?;
    c.token = d.u32()?;
    c.seq = 1;
    c.req = 1;

    let mut e = Enc::default();
    e.header(&null, 2);
    e.s("urn:kshana:client")
        .s("urn:kshana")
        .u8(2)
        .s("kshana")
        .u32(1)
        .bytes(None)
        .bytes(None)
        .i32(-1);
    e.bytes(None)
        .s(url)
        .s("kshana")
        .bytes(Some(&[0x6B; 32]))
        .bytes(None)
        .f64(60_000.0)
        .u32(0);
    let b = c.call(461, &e.0, 464)?;
    let mut d = Dec::new(&b);
    if d.header()? != 0 {
        return Err(fail("session"));
    }
    d.node()?;
    let auth = d.node()?;
    d.u64()?;
    d.bytes()?;
    d.bytes()?;
    // The anonymous token policy of an endpoint with security mode None.
    let mut policy = None;
    let endpoints = d.array(|d| {
        d.s()?;
        d.app_description()?;
        d.bytes()?;
        let mode = d.u32()?;
        d.s()?;
        let tokens = d.array(|d| {
            let id = d.s()?;
            let kind = d.u32()?;
            d.s()?;
            d.s()?;
            d.s()?;
            Ok((id, kind))
        })?;
        d.s()?;
        d.u8()?;
        Ok((mode, tokens))
    })?;
    for (mode, tokens) in endpoints {
        if let Some((id, _)) = tokens.into_iter().find(|t| t.1 == 0) {
            if mode == 1 || policy.is_none() {
                policy = Some(id);
            }
        }
    }
    let policy = policy.ok_or_else(|| fail("anonymous"))?;

    let mut tok = Enc::default();
    tok.s(&policy);
    let mut e = Enc::default();
    e.header(&auth, 3).bytes(None).bytes(None).i32(-1).i32(-1);
    e.node(&NodeId::Numeric(0, 321)).u8(1).bytes(Some(&tok.0));
    e.bytes(None).bytes(None);
    let b = c.call(467, &e.0, 470)?;
    if Dec::new(&b).header()? != 0 {
        return Err(fail("activate"));
    }

    let mut e = Enc::default();
    e.header(&auth, 4).f64(0.0).u32(2).i32(nodes.len() as i32);
    for n in nodes {
        e.node(n).u32(13).bytes(None).u16(0).bytes(None);
    }
    let b = c.call(631, &e.0, 634)?;
    let mut d = Dec::new(&b);
    let r = d.header()?;
    if r != 0 {
        return Err(fail(format!("read 0x{r:08X}")));
    }
    let values = d.array(|d| d.data_value())?;

    let mut e = Enc::default();
    e.u32(c.channel).u32(c.token).u32(c.seq + 1).u32(c.req + 1);
    e.node(&NodeId::Numeric(0, 452)).header(&auth, 5);
    let _ = c.s.write_all(&message(b"CLO", &e.0));
    Ok(values)
}
