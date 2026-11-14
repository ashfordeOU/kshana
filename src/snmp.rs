// SPDX-License-Identifier: AGPL-3.0-only
//! A minimal read-only SNMPv2c client for timing equipment (roadmap 0.42 I2): BER encoding and
//! decoding of the messages it needs, GET and GETNEXT over UDP, a walk built on GETNEXT, and OID maps
//! that name what a grandmaster or time server reports.
//!
//! Read only by construction: the only PDUs this module encodes are GetRequest (0xA0) and
//! GetNextRequest (0xA1), plus the Response (0xA2) that the loopback test agent sends back. There is
//! no SetRequest. Traps are decoded ([`decode_message`] reads an SNMPv2-Trap PDU, 0xA7) but no
//! listener is opened here.
//!
//! Sources: RFC 3416 (protocol operations and PDU layout), RFC 3417 (UDP transport), RFC 2578 (SMI
//! application types), RFC 1906/3584 (community-based v2c message: version 1), X.690 (BER). The maps:
//! SNMPv2-MIB `system` (RFC 3418), NTPv4-MIB (RFC 5907, `mib-2 197`), PTPBASE-MIB (RFC 8173,
//! `mib-2 241`), and Meinberg's MBG-SNMP-LTNG-MIB (enterprise 5597, module `mbgLantimeNG` = 30;
//! revision 2022-12-08, as shipped on LANTIME devices and mirrored by LibreNMS). Vendor maps are
//! included only where the MIB is published; Microchip TimeProvider and Oscilloquartz MIBs are not
//! included (not obtained from a public source when this was written).

use serde::Serialize;
use std::net::{SocketAddr, UdpSocket};
use std::time::Duration;

/// An object identifier.
pub type Oid = Vec<u32>;

/// Parse a dotted OID (`1.3.6.1.2.1.1.1.0`, a leading dot allowed).
pub fn parse_oid(s: &str) -> Option<Oid> {
    let v: Option<Oid> = s
        .trim()
        .trim_start_matches('.')
        .split('.')
        .map(|p| p.parse().ok())
        .collect();
    v.filter(|o| o.len() >= 2)
}

/// A dotted OID.
pub fn oid_str(o: &[u32]) -> String {
    o.iter().map(u32::to_string).collect::<Vec<_>>().join(".")
}

/// A variable's value.
#[derive(Clone, Debug, PartialEq)]
pub enum Value {
    /// INTEGER.
    Integer(i64),
    /// OCTET STRING.
    OctetString(Vec<u8>),
    /// NULL (in requests).
    Null,
    /// OBJECT IDENTIFIER.
    ObjectId(Oid),
    /// IpAddress.
    IpAddress([u8; 4]),
    /// Counter32.
    Counter32(u32),
    /// Gauge32 / Unsigned32.
    Gauge32(u32),
    /// TimeTicks (hundredths of a second).
    TimeTicks(u32),
    /// Opaque.
    Opaque(Vec<u8>),
    /// Counter64.
    Counter64(u64),
    /// noSuchObject exception.
    NoSuchObject,
    /// noSuchInstance exception.
    NoSuchInstance,
    /// endOfMibView exception.
    EndOfMibView,
}

impl Value {
    /// The value as JSON: numbers as numbers, an octet string as text when it is printable UTF-8
    /// and as `0x...` hex otherwise, an exception as its name.
    pub fn to_json(&self) -> serde_json::Value {
        use serde_json::json;
        match self {
            Value::Integer(v) => json!(v),
            Value::Counter32(v) | Value::Gauge32(v) | Value::TimeTicks(v) => json!(v),
            Value::Counter64(v) => json!(v),
            Value::OctetString(b) | Value::Opaque(b) => match std::str::from_utf8(b) {
                Ok(t) if t.chars().all(|c| !c.is_control() || c == '\n' || c == '\t') => json!(t),
                _ => json!(format!(
                    "0x{}",
                    b.iter().map(|x| format!("{x:02x}")).collect::<String>()
                )),
            },
            Value::Null => serde_json::Value::Null,
            Value::ObjectId(o) => json!(oid_str(o)),
            Value::IpAddress(a) => json!(format!("{}.{}.{}.{}", a[0], a[1], a[2], a[3])),
            Value::NoSuchObject => json!("noSuchObject"),
            Value::NoSuchInstance => json!("noSuchInstance"),
            Value::EndOfMibView => json!("endOfMibView"),
        }
    }
    fn is_exception(&self) -> bool {
        matches!(
            self,
            Value::NoSuchObject | Value::NoSuchInstance | Value::EndOfMibView
        )
    }
}

/// PDU types this module reads or writes.
pub mod pdu {
    /// GetRequest.
    pub const GET: u8 = 0xA0;
    /// GetNextRequest.
    pub const GET_NEXT: u8 = 0xA1;
    /// Response.
    pub const RESPONSE: u8 = 0xA2;
    /// SNMPv2-Trap.
    pub const TRAP_V2: u8 = 0xA7;
}

/// A decoded SNMP message.
#[derive(Clone, Debug, PartialEq)]
pub struct Message {
    /// 0 for v1, 1 for v2c.
    pub version: i64,
    /// Community string.
    pub community: Vec<u8>,
    /// PDU type ([`pdu`]).
    pub pdu_type: u8,
    /// request-id.
    pub request_id: i64,
    /// error-status.
    pub error_status: i64,
    /// error-index.
    pub error_index: i64,
    /// Variable bindings.
    pub varbinds: Vec<(Oid, Value)>,
}

// ----------------------------------------------------------------------------- BER

fn put_len(out: &mut Vec<u8>, n: usize) {
    if n < 0x80 {
        out.push(n as u8);
    } else {
        let b = (n as u64).to_be_bytes();
        let skip = b.iter().take_while(|&&x| x == 0).count();
        out.push(0x80 | (8 - skip) as u8);
        out.extend_from_slice(&b[skip..]);
    }
}

fn tlv(tag: u8, body: &[u8]) -> Vec<u8> {
    let mut out = vec![tag];
    put_len(&mut out, body.len());
    out.extend_from_slice(body);
    out
}

fn int_body(v: i64) -> Vec<u8> {
    let b = v.to_be_bytes();
    let mut i = 0;
    while i < 7 && ((b[i] == 0 && b[i + 1] & 0x80 == 0) || (b[i] == 0xFF && b[i + 1] & 0x80 != 0)) {
        i += 1;
    }
    b[i..].to_vec()
}

fn uint_body(v: u64) -> Vec<u8> {
    let mut b = v.to_be_bytes().to_vec();
    while b.len() > 1 && b[0] == 0 && b[1] & 0x80 == 0 {
        b.remove(0);
    }
    if b[0] & 0x80 != 0 {
        b.insert(0, 0);
    }
    b
}

fn oid_body(o: &[u32]) -> Vec<u8> {
    let mut out = Vec::new();
    let first = o.first().copied().unwrap_or(0) * 40 + o.get(1).copied().unwrap_or(0);
    for &sub in std::iter::once(&first).chain(o.iter().skip(2)) {
        let mut tmp = vec![(sub & 0x7F) as u8];
        let mut v = sub >> 7;
        while v > 0 {
            tmp.push(0x80 | (v & 0x7F) as u8);
            v >>= 7;
        }
        tmp.reverse();
        out.extend(tmp);
    }
    out
}

fn encode_value(v: &Value) -> Vec<u8> {
    match v {
        Value::Integer(i) => tlv(0x02, &int_body(*i)),
        Value::OctetString(b) => tlv(0x04, b),
        Value::Null => vec![0x05, 0x00],
        Value::ObjectId(o) => tlv(0x06, &oid_body(o)),
        Value::IpAddress(a) => tlv(0x40, a),
        Value::Counter32(c) => tlv(0x41, &uint_body(u64::from(*c))),
        Value::Gauge32(c) => tlv(0x42, &uint_body(u64::from(*c))),
        Value::TimeTicks(c) => tlv(0x43, &uint_body(u64::from(*c))),
        Value::Opaque(b) => tlv(0x44, b),
        Value::Counter64(c) => tlv(0x46, &uint_body(*c)),
        Value::NoSuchObject => vec![0x80, 0x00],
        Value::NoSuchInstance => vec![0x81, 0x00],
        Value::EndOfMibView => vec![0x82, 0x00],
    }
}

/// Encode a message. Only GetRequest, GetNextRequest and Response PDUs are encoded; any other PDU
/// type (a SetRequest in particular) gives `None`.
pub fn encode_message(m: &Message) -> Option<Vec<u8>> {
    if !matches!(m.pdu_type, pdu::GET | pdu::GET_NEXT | pdu::RESPONSE) {
        return None;
    }
    let mut vbs = Vec::new();
    for (o, v) in &m.varbinds {
        let mut vb = tlv(0x06, &oid_body(o));
        vb.extend(encode_value(v));
        vbs.extend(tlv(0x30, &vb));
    }
    let mut p = tlv(0x02, &int_body(m.request_id));
    p.extend(tlv(0x02, &int_body(m.error_status)));
    p.extend(tlv(0x02, &int_body(m.error_index)));
    p.extend(tlv(0x30, &vbs));
    let mut body = tlv(0x02, &int_body(m.version));
    body.extend(tlv(0x04, &m.community));
    body.extend(tlv(m.pdu_type, &p));
    Some(tlv(0x30, &body))
}

struct Rd<'a> {
    b: &'a [u8],
    i: usize,
}

impl<'a> Rd<'a> {
    fn next(&mut self) -> Option<(u8, &'a [u8])> {
        let tag = *self.b.get(self.i)?;
        let l0 = *self.b.get(self.i + 1)?;
        let mut p = self.i + 2;
        let len = if l0 & 0x80 == 0 {
            usize::from(l0)
        } else {
            let k = usize::from(l0 & 0x7F);
            if k == 0 || k > 4 {
                return None;
            }
            let mut n = 0usize;
            for _ in 0..k {
                n = (n << 8) | usize::from(*self.b.get(p)?);
                p += 1;
            }
            n
        };
        let body = self.b.get(p..p.checked_add(len)?)?;
        self.i = p + len;
        Some((tag, body))
    }
}

fn int_of(b: &[u8]) -> Option<i64> {
    if b.is_empty() || b.len() > 8 {
        return None;
    }
    let mut v: i64 = if b[0] & 0x80 != 0 { -1 } else { 0 };
    for &x in b {
        v = (v << 8) | i64::from(x);
    }
    Some(v)
}

fn uint_of(b: &[u8]) -> Option<u64> {
    let b = if b.len() == 9 && b[0] == 0 {
        &b[1..]
    } else {
        b
    };
    if b.is_empty() || b.len() > 8 {
        return None;
    }
    Some(b.iter().fold(0u64, |v, &x| (v << 8) | u64::from(x)))
}

fn oid_of(b: &[u8]) -> Option<Oid> {
    let mut subs = Vec::new();
    let mut v: u64 = 0;
    for &x in b {
        v = (v << 7) | u64::from(x & 0x7F);
        if v > u64::from(u32::MAX) {
            return None;
        }
        if x & 0x80 == 0 {
            subs.push(v as u32);
            v = 0;
        }
    }
    let first = *subs.first()?;
    let (a, c) = if first < 80 {
        (first / 40, first % 40)
    } else {
        (2, first - 80)
    };
    let mut o = vec![a, c];
    o.extend(&subs[1..]);
    Some(o)
}

fn value_of(tag: u8, b: &[u8]) -> Option<Value> {
    let u32_of = |b: &[u8]| uint_of(b).and_then(|v| u32::try_from(v).ok());
    Some(match tag {
        0x02 => Value::Integer(int_of(b)?),
        0x04 => Value::OctetString(b.to_vec()),
        0x05 => Value::Null,
        0x06 => Value::ObjectId(oid_of(b)?),
        0x40 => Value::IpAddress(b.try_into().ok()?),
        0x41 => Value::Counter32(u32_of(b)?),
        0x42 => Value::Gauge32(u32_of(b)?),
        0x43 => Value::TimeTicks(u32_of(b)?),
        0x44 => Value::Opaque(b.to_vec()),
        0x46 => Value::Counter64(uint_of(b)?),
        0x80 => Value::NoSuchObject,
        0x81 => Value::NoSuchInstance,
        0x82 => Value::EndOfMibView,
        _ => return None,
    })
}

/// Decode a v1 or v2c message (GetRequest, GetNextRequest, Response or SNMPv2-Trap PDU).
pub fn decode_message(bytes: &[u8]) -> Option<Message> {
    let (t, body) = Rd { b: bytes, i: 0 }.next()?;
    if t != 0x30 {
        return None;
    }
    let mut r = Rd { b: body, i: 0 };
    let (t, v) = r.next()?;
    let version = (t == 0x02).then(|| int_of(v))??;
    let (t, community) = r.next()?;
    if t != 0x04 {
        return None;
    }
    let (pdu_type, p) = r.next()?;
    if !matches!(
        pdu_type,
        pdu::GET | pdu::GET_NEXT | pdu::RESPONSE | pdu::TRAP_V2
    ) {
        return None;
    }
    let mut r = Rd { b: p, i: 0 };
    let mut ints = [0i64; 3];
    for x in ints.iter_mut() {
        let (t, v) = r.next()?;
        if t != 0x02 {
            return None;
        }
        *x = int_of(v)?;
    }
    let (t, vbl) = r.next()?;
    if t != 0x30 {
        return None;
    }
    let mut r = Rd { b: vbl, i: 0 };
    let mut varbinds = Vec::new();
    while r.i < vbl.len() {
        let (t, vb) = r.next()?;
        if t != 0x30 {
            return None;
        }
        let mut q = Rd { b: vb, i: 0 };
        let (t, o) = q.next()?;
        if t != 0x06 {
            return None;
        }
        let (vt, vv) = q.next()?;
        varbinds.push((oid_of(o)?, value_of(vt, vv)?));
    }
    Some(Message {
        version,
        community: community.to_vec(),
        pdu_type,
        request_id: ints[0],
        error_status: ints[1],
        error_index: ints[2],
        varbinds,
    })
}

// ----------------------------------------------------------------------------- client

/// A read-only SNMPv2c client over UDP.
pub struct Client {
    sock: UdpSocket,
    target: SocketAddr,
    community: Vec<u8>,
    retries: u32,
    next_id: i64,
}

fn err(why: &str) -> String {
    crate::terr!("e-snmp-failed", why = why)
}

impl Client {
    /// A client for `target` with a community string and a per-attempt timeout.
    pub fn new(
        target: SocketAddr,
        community: &str,
        timeout: Duration,
        retries: u32,
    ) -> Result<Self, String> {
        let bind = if target.is_ipv4() {
            "0.0.0.0:0"
        } else {
            "[::]:0"
        };
        let sock = UdpSocket::bind(bind).map_err(|e| e.to_string())?;
        sock.set_read_timeout(Some(timeout))
            .map_err(|e| e.to_string())?;
        Ok(Client {
            sock,
            target,
            community: community.as_bytes().to_vec(),
            retries,
            next_id: 1,
        })
    }

    fn request(&mut self, pdu_type: u8, oids: &[Oid]) -> Result<Message, String> {
        let id = self.next_id;
        self.next_id += 1;
        let req = encode_message(&Message {
            version: 1,
            community: self.community.clone(),
            pdu_type,
            request_id: id,
            error_status: 0,
            error_index: 0,
            varbinds: oids.iter().map(|o| (o.clone(), Value::Null)).collect(),
        })
        .ok_or_else(|| err("encode"))?;
        let mut buf = vec![0u8; 65_535];
        for _ in 0..=self.retries {
            self.sock
                .send_to(&req, self.target)
                .map_err(|e| e.to_string())?;
            loop {
                match self.sock.recv_from(&mut buf) {
                    Ok((n, from)) => {
                        if from != self.target {
                            continue;
                        }
                        match decode_message(&buf[..n]) {
                            Some(m) if m.request_id == id && m.pdu_type == pdu::RESPONSE => {
                                return Ok(m)
                            }
                            _ => continue, // a late reply to an earlier attempt, or garbage
                        }
                    }
                    Err(e)
                        if matches!(
                            e.kind(),
                            std::io::ErrorKind::WouldBlock | std::io::ErrorKind::TimedOut
                        ) =>
                    {
                        break
                    }
                    Err(e) => return Err(e.to_string()),
                }
            }
        }
        Err(err("timeout"))
    }

    /// GET the given instances.
    pub fn get(&mut self, oids: &[Oid]) -> Result<Vec<(Oid, Value)>, String> {
        let m = self.request(pdu::GET, oids)?;
        if m.error_status != 0 {
            return Err(crate::terr!(
                "e-snmp-error-status",
                status = m.error_status,
                index = m.error_index
            ));
        }
        Ok(m.varbinds)
    }

    /// Walk the subtree under `root` with GETNEXT, at most `max` rows.
    pub fn walk(&mut self, root: &[u32], max: usize) -> Result<Vec<(Oid, Value)>, String> {
        let mut out = Vec::new();
        let mut cur = root.to_vec();
        while out.len() < max {
            let m = self.request(pdu::GET_NEXT, std::slice::from_ref(&cur))?;
            if m.error_status != 0 {
                break; // noSuchName (v1 agents) ends the walk
            }
            let Some((o, v)) = m.varbinds.into_iter().next() else {
                break;
            };
            if v.is_exception() || !o.starts_with(root) || o <= cur {
                break;
            }
            cur = o.clone();
            out.push((o, v));
        }
        Ok(out)
    }
}

// ----------------------------------------------------------------------------- maps

/// One object of an OID map.
#[derive(Clone, Debug, PartialEq, serde::Deserialize, Serialize)]
pub struct MapObject {
    /// The name the reading carries.
    pub name: String,
    /// The OID: a scalar's instance (`...0`) or, with `walk`, a table column.
    pub oid: String,
    /// Walk the column instead of a single GET.
    #[serde(default)]
    pub walk: bool,
    /// Labels for enumerated integer values (`"1" = "synchronized"`).
    #[serde(default)]
    pub labels: std::collections::BTreeMap<String, String>,
}

/// An OID map (`kshana.snmp-map/1`).
#[derive(Clone, Debug, PartialEq, serde::Deserialize, Serialize)]
pub struct OidMap {
    /// `kshana.snmp-map/1`.
    pub schema: String,
    /// The map's name.
    pub name: String,
    /// The MIBs it draws on, with their source.
    #[serde(default)]
    pub sources: Vec<String>,
    /// The objects.
    #[serde(rename = "object")]
    pub objects: Vec<MapObject>,
}

/// The built-in maps (`generic`, `meinberg-ltng`), as TOML.
pub fn builtin_map_text(name: &str) -> Option<&'static str> {
    match name {
        "generic" => Some(include_str!("snmp_maps/generic.toml")),
        "meinberg-ltng" => Some(include_str!("snmp_maps/meinberg-ltng.toml")),
        _ => None,
    }
}

/// Parse a map file.
pub fn parse_map(text: &str) -> Result<OidMap, String> {
    let m: OidMap =
        toml::from_str(text).map_err(|e| crate::terr!("e-snmp-map", e = e.to_string()))?;
    if m.schema != "kshana.snmp-map/1" {
        return Err(crate::terr!("e-snmp-map", e = m.schema));
    }
    for o in &m.objects {
        if parse_oid(&o.oid).is_none() {
            return Err(crate::terr!("e-snmp-map", e = o.oid.clone()));
        }
    }
    Ok(m)
}

/// One value read through a map.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Reading {
    /// The map object's name.
    pub name: String,
    /// The instance OID.
    pub oid: String,
    /// The value.
    pub value: serde_json::Value,
    /// The enumeration label, where the map gives one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub label: Option<String>,
}

/// What [`poll`] read.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PollResult {
    /// The map used.
    pub map: String,
    /// The readings, in map order (a walked column gives one per row).
    pub readings: Vec<Reading>,
    /// Map objects the agent does not have (an exception or an empty column).
    pub missing: Vec<String>,
}

fn reading(o: &MapObject, oid: &[u32], v: &Value) -> Reading {
    let value = v.to_json();
    let label = match v {
        Value::Integer(i) => o.labels.get(&i.to_string()).cloned(),
        _ => None,
    };
    Reading {
        name: o.name.clone(),
        oid: oid_str(oid),
        value,
        label,
    }
}

/// Read every object of a map: scalars with one GET each (so one missing object does not fail
/// the others), columns with a walk of at most `max_rows` rows.
pub fn poll(c: &mut Client, map: &OidMap, max_rows: usize) -> Result<PollResult, String> {
    let mut readings = Vec::new();
    let mut missing = Vec::new();
    for o in &map.objects {
        let Some(oid) = parse_oid(&o.oid) else {
            continue;
        };
        if o.walk {
            let rows = c.walk(&oid, max_rows)?;
            if rows.is_empty() {
                missing.push(o.name.clone());
            }
            readings.extend(rows.iter().map(|(i, v)| reading(o, i, v)));
        } else {
            match c.get(std::slice::from_ref(&oid)) {
                Ok(vbs) => match vbs.first() {
                    Some((i, v)) if !v.is_exception() => readings.push(reading(o, i, v)),
                    _ => missing.push(o.name.clone()),
                },
                Err(_) => missing.push(o.name.clone()), // v1-style noSuchName
            }
        }
    }
    Ok(PollResult {
        map: map.name.clone(),
        readings,
        missing,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn integers_and_oids_round_trip_through_ber() {
        for v in [
            0i64,
            1,
            127,
            128,
            255,
            256,
            -1,
            -128,
            -129,
            i64::from(i32::MAX),
        ] {
            assert_eq!(int_of(&int_body(v)), Some(v), "{v}");
        }
        let o = parse_oid("1.3.6.1.4.1.5597.30.0.2.4.0").unwrap();
        assert_eq!(oid_of(&oid_body(&o)), Some(o));
        // X.690 example: 2.999.3 -> 88 37 03
        assert_eq!(oid_body(&[2, 999, 3]), vec![0x88, 0x37, 0x03]);
    }

    #[test]
    fn a_set_request_is_never_encoded() {
        let m = Message {
            version: 1,
            community: b"public".to_vec(),
            pdu_type: 0xA3,
            request_id: 1,
            error_status: 0,
            error_index: 0,
            varbinds: vec![],
        };
        assert!(encode_message(&m).is_none());
    }

    #[test]
    fn the_builtin_maps_parse() {
        for n in ["generic", "meinberg-ltng"] {
            let m = parse_map(builtin_map_text(n).unwrap()).unwrap();
            assert!(!m.objects.is_empty(), "{n}");
        }
    }
}
