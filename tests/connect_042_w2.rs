// SPDX-License-Identifier: AGPL-3.0-only
//! Roadmap 0.42 wave 2 connectors: I4 (gps-sdr-sim motion writer, SigMF), I5 (incident, chat, log
//! index, SNMP trap, STIX 2.1 / TAXII 2.1, OpenMetrics), I7 (Modbus TCP, DNP3, OPC UA read clients
//! against in-process fakes) and I8 (CCSDS packets with XTCE, COSMOS and Open MCT definitions).
//!
//! The fakes are written here from the public specifications, independently of the clients. Schema
//! checks run when the schemas are present (scripts/fetch_042_w2_schemas.sh puts them in
//! realdata-cache/); with `KSHANA_REQUIRE_REALDATA=1` a missing schema or tool fails the test.

use kshana::industrial::*;
use kshana::telemetry::ops;
use kshana::telemetry::sample::{parse_live_line, Band, TrustSample};
use serde_json::{json, Value};
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::path::PathBuf;
use std::process::{Command, Stdio};
use std::thread;
use std::time::Duration;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn require() -> bool {
    std::env::var("KSHANA_REQUIRE_REALDATA").is_ok_and(|v| v == "1")
}

fn sample(t: f64, band: &str, score: Option<f64>, pos: bool) -> TrustSample {
    let mut v =
        json!({ "t_s": t, "state": band, "score": score, "reasons": ["cn0_drop", "agc_step"] });
    if pos {
        v["position"] = json!({ "lat_deg": 59.43, "lon_deg": 24.75, "height_m": 40.0 });
    }
    parse_live_line(&v.to_string()).unwrap()
}

fn listener() -> (TcpListener, std::net::SocketAddr) {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let a = l.local_addr().unwrap();
    (l, a)
}

// ------------------------------------------------------------------------------------- I7

#[test]
fn modbus_reads_registers_from_a_fake_server_and_reports_an_exception() {
    let (l, a) = listener();
    thread::spawn(move || {
        for (i, s) in l.incoming().take(2).enumerate() {
            let mut s = s.unwrap();
            let mut q = [0u8; 12];
            s.read_exact(&mut q).unwrap();
            assert_eq!(&q[2..8], &[0, 0, 0, 6, 17, 3]);
            assert_eq!(&q[8..12], &[0, 40, 0, 3]);
            let reply: Vec<u8> = if i == 0 {
                vec![q[0], q[1], 0, 0, 0, 9, 17, 3, 6, 0, 1, 0x80, 0, 0xFF, 0xFF]
            } else {
                vec![q[0], q[1], 0, 0, 0, 3, 17, 0x83, 2]
            };
            s.write_all(&reply).unwrap();
        }
    });
    let t = Duration::from_secs(2);
    assert_eq!(
        modbus_read(a, 17, 3, 40, 3, t).unwrap(),
        vec![1, 0x8000, 0xFFFF]
    );
    let e = modbus_read(a, 17, 3, 40, 3, t).unwrap_err();
    assert!(e.contains("exception 2"), "{e}");
}

#[test]
fn modbus_builds_only_read_requests_and_unpacks_coils() {
    for fc in [5u8, 6, 15, 16, 23] {
        assert!(
            modbus_request(1, 1, fc, 0, 1).is_err(),
            "fc {fc} must be refused"
        );
    }
    assert_eq!(
        modbus_request(7, 1, 1, 19, 10).unwrap(),
        [0, 7, 0, 0, 0, 6, 1, 1, 0, 19, 0, 10]
    );
    // Modbus spec example (read coils 20-29): status bytes CD 01.
    let r = modbus_parse(&[0, 7, 0, 0, 0, 5, 1, 1, 2, 0xCD, 0x01], 7, 1, 1, 10).unwrap();
    assert_eq!(r, vec![1, 0, 1, 1, 0, 0, 1, 1, 1, 0]);
}

#[test]
fn dnp3_crc_matches_the_catalogue_check_value() {
    // CRC-16/DNP check value over "123456789" (reveng catalogue).
    assert_eq!(dnp3_crc(b"123456789"), 0xEA82);
    let f = dnp3_frame(0xC4, 10, 1, &[0xC0; 40]);
    let (used, ctrl, dest, src, user) = dnp3_unframe(&f).unwrap().unwrap();
    assert_eq!(
        (used, ctrl, dest, src, user),
        (f.len(), 0xC4, 10, 1, vec![0xC0; 40])
    );
    let mut bad = f.clone();
    bad[20] ^= 1;
    assert!(dnp3_unframe(&bad).is_err());
}

fn dnp3_response() -> Vec<u8> {
    let mut a = vec![0xE0, 0x81, 0x00, 0x00];
    a.extend([1, 2, 0x00, 0, 1, 0x81, 0x01]); // binary inputs 0..1 with flags
    a.extend([30, 1, 0x01, 5, 0, 5, 0, 0x01]); // analog 5, 32-bit with flag
    a.extend((-1234i32).to_le_bytes());
    a.extend([30, 5, 0x00, 0, 0, 0x01]); // analog 0, float with flag
    a.extend(3.5f32.to_le_bytes());
    a.extend([20, 1, 0x17, 1, 3, 0x01]); // counter index 3, 32-bit with flag
    a.extend(99u32.to_le_bytes());
    a.extend([50, 1, 0x07, 1, 0, 0, 0, 0, 0, 0]); // time object: not decoded
    a
}

#[test]
fn dnp3_reads_class_0_through_two_transport_segments_and_confirms() {
    let (l, a) = listener();
    let h = thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        let mut buf = vec![0u8; 64];
        let n = s.read(&mut buf).unwrap();
        let (_, ctrl, dest, src, user) = dnp3_unframe(&buf[..n]).unwrap().unwrap();
        assert_eq!((ctrl, dest, src), (0xC4, 10, 1));
        assert_eq!(&user[1..], &[0xC0, 0x01, 60, 1, 0x06], "READ class 0 only");
        let app = dnp3_response();
        let mut seg1 = vec![0x40];
        seg1.extend_from_slice(&app[..20]);
        let mut seg2 = vec![0x81];
        seg2.extend_from_slice(&app[20..]);
        s.write_all(&dnp3_frame(0x44, 1, 10, &seg1)).unwrap();
        s.write_all(&dnp3_frame(0x44, 1, 10, &seg2)).unwrap();
        let n = s.read(&mut buf).unwrap();
        let (_, _, _, _, user) = dnp3_unframe(&buf[..n]).unwrap().unwrap();
        assert_eq!(&user[1..], &[0xC0, 0x00], "application confirm");
    });
    let r = dnp3_read(a, 1, 10, Duration::from_secs(3)).unwrap();
    h.join().unwrap();
    let got: Vec<(u8, u32, f64)> = r
        .points
        .iter()
        .map(|p| (p.group, p.index, p.value))
        .collect();
    assert_eq!(
        got,
        vec![
            (1, 0, 1.0),
            (1, 1, 0.0),
            (30, 5, -1234.0),
            (30, 0, 3.5),
            (20, 3, 99.0)
        ]
    );
    assert_eq!(r.stopped_at.as_deref(), Some("g50v1q07"));
    assert_eq!(r.points[0].flags, Some(0x81));
}

/// A little-endian writer for the fake OPC UA server.
#[derive(Default)]
struct W(Vec<u8>);
impl W {
    fn b(&mut self, v: &[u8]) -> &mut Self {
        self.0.extend_from_slice(v);
        self
    }
    fn u32(&mut self, v: u32) -> &mut Self {
        self.b(&v.to_le_bytes())
    }
    fn i32(&mut self, v: i32) -> &mut Self {
        self.b(&v.to_le_bytes())
    }
    fn s(&mut self, v: &str) -> &mut Self {
        self.i32(v.len() as i32).b(v.as_bytes())
    }
    fn node4(&mut self, ns: u8, id: u16) -> &mut Self {
        self.b(&[1, ns]).b(&id.to_le_bytes())
    }
    fn resp_header(&mut self) -> &mut Self {
        self.b(&[0; 8]).u32(1).u32(0).b(&[0]).i32(-1).b(&[0, 0, 0])
    }
}

fn ua_read(s: &mut TcpStream) -> (Vec<u8>, Vec<u8>) {
    let mut h = [0u8; 8];
    s.read_exact(&mut h).unwrap();
    let n = u32::from_le_bytes(h[4..8].try_into().unwrap()) as usize;
    let mut b = vec![0u8; n - 8];
    s.read_exact(&mut b).unwrap();
    (h[..4].to_vec(), b)
}

fn ua_send(s: &mut TcpStream, kind: &[u8; 4], body: &[u8]) {
    let mut m = kind.to_vec();
    m.extend(((body.len() + 8) as u32).to_le_bytes());
    m.extend_from_slice(body);
    s.write_all(&m).unwrap();
}

fn fake_opcua(mut s: TcpStream) {
    let (k, _) = ua_read(&mut s);
    assert_eq!(&k, b"HELF");
    let mut w = W::default();
    w.u32(0).u32(65_536).u32(65_536).u32(0).u32(0);
    ua_send(&mut s, b"ACKF", &w.0);
    let (k, b) = ua_read(&mut s);
    assert_eq!(&k, b"OPNF");
    assert!(b.windows(4).any(|x| x == b"None"), "security policy None");
    let mut w = W::default();
    w.u32(7)
        .s("http://opcfoundation.org/UA/SecurityPolicy#None")
        .i32(-1)
        .i32(-1)
        .u32(1)
        .u32(1);
    w.node4(0, 449)
        .resp_header()
        .u32(0)
        .u32(7)
        .u32(9)
        .b(&[0; 8])
        .u32(600_000)
        .i32(0);
    ua_send(&mut s, b"OPNF", &w.0);
    loop {
        let (k, b) = ua_read(&mut s);
        if &k == b"CLOF" {
            return;
        }
        assert_eq!(&k, b"MSGF");
        assert_eq!(&b[..8], &[7, 0, 0, 0, 9, 0, 0, 0], "channel 7, token 9");
        let req = u32::from_le_bytes(b[12..16].try_into().unwrap());
        assert_eq!(b[16], 1);
        let ty = u16::from_le_bytes([b[18], b[19]]);
        let mut w = W::default();
        w.u32(7).u32(9).u32(req + 1).u32(req);
        match ty {
            461 => {
                w.node4(0, 464)
                    .resp_header()
                    .node4(1, 1)
                    .node4(1, 77)
                    .b(&[0; 8])
                    .i32(0)
                    .i32(-1);
                w.i32(1)
                    .s("opc.tcp://fake")
                    .s("urn:fake")
                    .s("urn:fake")
                    .b(&[2])
                    .s("fake")
                    .u32(0);
                w.i32(-1)
                    .i32(-1)
                    .i32(0)
                    .i32(-1)
                    .u32(1)
                    .s("http://opcfoundation.org/UA/SecurityPolicy#None");
                w.i32(2).s("user-pw").u32(1).i32(-1).i32(-1).i32(-1);
                w.s("anon-policy").u32(0).i32(-1).i32(-1).i32(-1);
                w.s("http://opcfoundation.org/UA-Profile/Transport/uatcp-uasc-uabinary")
                    .b(&[0]);
                w.i32(-1).i32(-1).i32(-1).u32(0);
            }
            467 => {
                assert!(
                    b.windows(11).any(|x| x == b"anon-policy"),
                    "anonymous policy id sent"
                );
                assert_eq!(
                    &b[20..24],
                    &[1, 1, 77, 0],
                    "authentication token in the header"
                );
                w.node4(0, 470).resp_header().i32(-1).i32(-1).i32(-1);
            }
            631 => {
                assert!(
                    b.windows(3).any(|x| x == [13, 0, 0]),
                    "attribute 13 (Value)"
                );
                w.node4(0, 634).resp_header().i32(3);
                let ticks = (1_555_526_400i64 + 11_644_473_600) * 10_000_000;
                w.b(&[0x0B, 11])
                    .b(&12.5f64.to_le_bytes())
                    .u32(0)
                    .b(&ticks.to_le_bytes());
                w.b(&[0x01, 0x86]).i32(3).i32(-1).i32(0).i32(7);
                w.b(&[0x03, 12]).s("locked").u32(0x8034_0000);
                w.i32(-1);
            }
            other => panic!("unexpected service {other}"),
        }
        ua_send(&mut s, b"MSGF", &w.0);
    }
}

#[test]
fn opcua_reads_values_from_a_fake_server_with_an_anonymous_session() {
    let (l, a) = listener();
    let h = thread::spawn(move || fake_opcua(l.accept().unwrap().0));
    let nodes: Vec<_> = ["ns=2;s=Clock.Offset", "ns=2;i=7", "i=2259"]
        .iter()
        .map(|n| kshana::opcua::NodeId::parse(n).unwrap())
        .collect();
    let v = kshana::opcua::read_values(
        &format!("opc.tcp://{a}/kshana"),
        &nodes,
        Duration::from_secs(3),
    )
    .unwrap();
    h.join().unwrap();
    assert_eq!(v[0]["value"], json!(12.5));
    assert!((v[0]["server_time"].as_f64().unwrap() - 1_555_526_400.0).abs() < 1.0);
    assert_eq!(v[1]["value"], json!([-1, 0, 7]));
    assert_eq!(v[2], json!({ "value": "locked", "status": 0x8034_0000u32 }));
}

#[test]
fn opcua_reports_a_server_error_message() {
    let (l, a) = listener();
    thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        ua_read(&mut s);
        let mut w = W::default();
        w.u32(0x807F_0000).s("Bad_ProtocolVersionUnsupported");
        ua_send(&mut s, b"ERRF", &w.0);
    });
    let e = kshana::opcua::read_values(
        &format!("opc.tcp://{a}"),
        &[kshana::opcua::NodeId::Numeric(0, 2258)],
        Duration::from_secs(2),
    )
    .unwrap_err();
    assert!(e.contains("0x807F0000"), "{e}");
}

// ------------------------------------------------------------------------------------- I5

#[test]
fn every_webhook_template_carries_the_fields_its_service_requires() {
    let s = sample(30.0, "untrusted", Some(12.0), true);
    let clear = sample(60.0, "nominal", Some(96.0), false);
    let t = 1_763_078_400.0;
    let p = |f: &str, s: &TrustSample, prev| {
        ops::payload(f, s, prev, "station-1", t, "R0UTING").unwrap()
    };
    let v: Value = serde_json::from_str(&p("pagerduty", &s, Some(Band::Nominal))).unwrap();
    assert_eq!(v["routing_key"], "R0UTING");
    assert_eq!(v["event_action"], "trigger");
    assert_eq!(v["payload"]["severity"], "critical");
    assert!(v["payload"]["summary"].as_str().unwrap().len() <= 1024);
    assert_eq!(v["payload"]["timestamp"], "2025-11-14T00:00:00.000Z");
    let r: Value = serde_json::from_str(&p("pagerduty", &clear, Some(Band::Untrusted))).unwrap();
    assert_eq!(
        (r["event_action"].as_str(), r["dedup_key"].as_str()),
        (Some("resolve"), v["dedup_key"].as_str())
    );
    let o: Value = serde_json::from_str(&p("opsgenie", &s, None)).unwrap();
    assert!(o["message"].as_str().unwrap().chars().count() <= 130);
    assert_eq!(o["priority"], "P1");
    let sn: Value = serde_json::from_str(&p("servicenow", &s, None)).unwrap();
    let rec = &sn["records"][0];
    for k in [
        "source",
        "node",
        "type",
        "resource",
        "metric_name",
        "severity",
        "description",
    ] {
        assert!(rec[k].is_string(), "servicenow {k}");
    }
    assert_eq!(rec["severity"], "1");
    assert_eq!(
        serde_json::from_str::<Value>(&p("servicenow", &clear, Some(Band::Degraded))).unwrap()
            ["records"][0]["severity"],
        "0"
    );
    let sl: Value = serde_json::from_str(&p("slack", &s, None)).unwrap();
    assert!(sl["text"].is_string() && sl["blocks"][0]["type"] == "section");
    let tm: Value = serde_json::from_str(&p("teams", &s, None)).unwrap();
    let card = &tm["attachments"][0];
    assert_eq!(
        card["contentType"],
        "application/vnd.microsoft.card.adaptive"
    );
    assert_eq!(
        (
            card["content"]["type"].as_str(),
            card["content"]["version"].as_str()
        ),
        (Some("AdaptiveCard"), Some("1.4"))
    );
    let hec: Value = serde_json::from_str(&p("splunk-hec", &s, None)).unwrap();
    assert_eq!(hec["time"], json!(t));
    assert_eq!(hec["event"]["band"], "untrusted");
    let bulk = p("elastic", &s, None);
    let lines: Vec<Value> = bulk
        .lines()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect();
    assert!(bulk.ends_with('\n') && lines.len() == 2);
    assert!(lines[0]["create"]["_index"].is_string());
    assert_eq!(lines[1]["@timestamp"], "2025-11-14T00:00:00.000Z");
    assert!(ops::payload("kafka", &s, None, "h", t, "").is_err());
}

fn no_null_or_empty(v: &Value, path: &str) {
    match v {
        Value::Null => panic!("null at {path}"),
        Value::Array(a) => {
            assert!(!a.is_empty(), "empty list at {path}");
            a.iter().for_each(|x| no_null_or_empty(x, path));
        }
        Value::Object(o) => o
            .iter()
            .for_each(|(k, x)| no_null_or_empty(x, &format!("{path}.{k}"))),
        _ => {}
    }
}

#[test]
fn stix_objects_follow_the_stix_2_1_common_rules_and_the_oasis_schemas() {
    let s = sample(30.0, "degraded", Some(55.0), true);
    let objs = ops::stix_objects(&s, "station-1", 1_763_078_400.25);
    let ts = |v: &Value| {
        let t = v.as_str().unwrap();
        t.len() == 24 && t.ends_with('Z') && t.as_bytes()[19] == b'.'
    };
    let mut ids = Vec::new();
    for o in &objs {
        no_null_or_empty(o, "object");
        let ty = o["type"].as_str().unwrap();
        let (pre, uuid) = o["id"].as_str().unwrap().split_once("--").unwrap();
        assert_eq!(pre, ty);
        let u: Vec<&str> = uuid.split('-').collect();
        assert_eq!(
            u.iter().map(|x| x.len()).collect::<Vec<_>>(),
            vec![8, 4, 4, 4, 12]
        );
        assert!(
            u[2].starts_with('5') && "89ab".contains(&u[3][..1]),
            "{ty}: the id is not a UUID v5"
        );
        assert_eq!(o["spec_version"], "2.1");
        assert!(ts(&o["created"]) && ts(&o["modified"]), "{ty} timestamps");
        ids.push(o["id"].as_str().unwrap().to_string());
    }
    let obs = objs
        .iter()
        .find(|o| o["type"] == "gnss-interference")
        .unwrap();
    assert!(ids.contains(&obs["created_by_ref"].as_str().unwrap().to_string()));
    assert!(ids.contains(&obs["location_ref"].as_str().unwrap().to_string()));
    let ext = obs["extensions"]
        .as_object()
        .unwrap()
        .keys()
        .next()
        .unwrap()
        .clone();
    assert!(
        ids.contains(&ext),
        "the extension-definition is in the same set"
    );
    assert_eq!(
        objs,
        ops::stix_objects(&s, "station-1", 1_763_078_400.25),
        "deterministic"
    );

    // UUID v5 against Python's uuid module, when Python is present.
    if let Ok(o) = Command::new("python3")
        .args(["-c", "import uuid;print(uuid.uuid5(uuid.UUID('00abedb4-aa42-466c-9c01-fed23315a9b7'),'kshana'))"])
        .output()
    {
        assert_eq!(String::from_utf8_lossy(&o.stdout).trim(), ops::uuid5("kshana"));
    }

    let dir = root().join("realdata-cache/stix21/schemas");
    let have = dir.join("common/core.json").exists();
    if !have {
        assert!(
            !require(),
            "KSHANA_REQUIRE_REALDATA=1 but {} is missing",
            dir.display()
        );
        eprintln!("skip: STIX 2.1 schemas not present (scripts/fetch_042_w2_schemas.sh)");
        return;
    }
    let py = r#"
import json, sys, pathlib
import jsonschema
from referencing import Registry, Resource
d = pathlib.Path(sys.argv[1])
docs = {}
for f in d.rglob("*.json"):
    doc = json.loads(f.read_text())
    docs[f.resolve()] = doc
reg = Registry().with_resources((doc["$id"], Resource.from_contents(doc)) for doc in docs.values())
by = {"identity": "sdos/identity.json", "location": "sdos/location.json",
      "extension-definition": "common/extension-definition.json"}
for o in json.load(sys.stdin):
    schema = docs[(d / by.get(o["type"], "common/core.json")).resolve()]
    cls = jsonschema.validators.validator_for(schema)
    cls(schema, registry=reg, format_checker=cls.FORMAT_CHECKER).validate(o)
print("ok", flush=True)
"#;
    let mut c = match Command::new("python3")
        .args(["-W", "ignore", "-c", py, dir.to_str().unwrap()])
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
    {
        Ok(c) => c,
        Err(_) => {
            assert!(!require(), "python3 is needed for the STIX schema check");
            return;
        }
    };
    c.stdin
        .take()
        .unwrap()
        .write_all(Value::Array(objs).to_string().as_bytes())
        .unwrap();
    let out = c.wait_with_output().unwrap();
    let err = String::from_utf8_lossy(&out.stderr);
    if err.contains("No module named") {
        assert!(
            !require(),
            "python jsonschema is needed for the STIX schema check"
        );
        return;
    }
    assert!(out.status.success(), "STIX schema validation failed: {err}");
}

fn http_request(s: &mut TcpStream) -> (String, String) {
    let mut buf = Vec::new();
    let mut b = [0u8; 1];
    while !buf.ends_with(b"\r\n\r\n") {
        s.read_exact(&mut b).unwrap();
        buf.push(b[0]);
    }
    let head = String::from_utf8(buf).unwrap();
    let n: usize = head
        .lines()
        .find_map(|l| {
            l.to_ascii_lowercase()
                .strip_prefix("content-length:")
                .map(|v| v.trim().parse().unwrap())
        })
        .unwrap();
    let mut body = vec![0u8; n];
    s.read_exact(&mut body).unwrap();
    (head, String::from_utf8(body).unwrap())
}

#[test]
fn taxii_client_adds_objects_to_a_collection_on_a_fake_server() {
    let (l, a) = listener();
    let h = thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        let (head, body) = http_request(&mut s);
        assert!(
            head.starts_with("POST /api1/collections/c1/objects/ HTTP/1.1\r\n"),
            "{head}"
        );
        assert!(head.contains("Content-Type: application/taxii+json;version=2.1\r\n"));
        assert!(head.contains("Accept: application/taxii+json;version=2.1\r\n"));
        assert!(head.contains("Authorization: Basic dGVzdDp0ZXN0\r\n"));
        let v: Value = serde_json::from_str(&body).unwrap();
        let n = v["objects"].as_array().unwrap().len();
        let status = json!({ "id": "2d086da7-4bdc-4f91-900e-d77486753710", "status": "complete",
            "total_count": n, "success_count": n, "failure_count": 0, "pending_count": 0 })
        .to_string();
        let resp = format!("HTTP/1.1 202 Accepted\r\nContent-Type: application/taxii+json;version=2.1\r\nContent-Length: {}\r\n\r\n{status}", status.len());
        s.write_all(resp.as_bytes()).unwrap();
        n
    });
    let objs = ops::stix_objects(
        &sample(1.0, "untrusted", None, false),
        "st",
        1_763_078_400.0,
    );
    let (code, st) = ops::taxii_add(
        &format!("http://{a}/api1/"),
        "c1",
        &objs,
        Some("Basic dGVzdDp0ZXN0".into()),
    )
    .unwrap();
    assert_eq!(h.join().unwrap(), objs.len());
    assert_eq!((code, st["status"].as_str()), (202, Some("complete")));
    // A credential is never sent in clear to a host other than the loopback one.
    let e = ops::taxii_add(
        "http://192.0.2.1/api1",
        "c1",
        &objs,
        Some("Basic eA==".into()),
    )
    .unwrap_err();
    assert!(e.contains("loopback"), "{e}");
}

#[test]
fn snmp_trap_decodes_as_an_snmpv2_trap_with_the_required_varbinds() {
    let oid = kshana::snmp::parse_oid("1.3.6.1.4.1.99999.1").unwrap();
    let b = ops::snmp_trap(
        "public",
        5,
        3000,
        &oid,
        &sample(30.0, "degraded", Some(55.5), false),
    );
    let m = kshana::snmp::decode_message(&b).unwrap();
    assert_eq!((m.version, m.pdu_type, m.request_id), (1, 0xA7, 5));
    use kshana::snmp::Value as V;
    assert_eq!(
        m.varbinds[0],
        (vec![1, 3, 6, 1, 2, 1, 1, 3, 0], V::TimeTicks(3000))
    );
    assert_eq!(
        m.varbinds[1],
        (
            vec![1, 3, 6, 1, 6, 3, 1, 1, 4, 1, 0],
            V::ObjectId(oid.clone())
        )
    );
    assert_eq!(m.varbinds[2].1, V::Integer(2));
    assert_eq!(m.varbinds[3].1, V::Integer(5550));
    assert_eq!(
        m.varbinds[4].1,
        V::OctetString(b"cn0_drop,agc_step".to_vec())
    );
}

#[test]
fn openmetrics_form_renames_counter_families_and_ends_with_eof() {
    let mut reg = kshana::telemetry::prometheus::Registry::new("0.42.0");
    reg.observe(&sample(1.0, "degraded", Some(40.0), false), None);
    let text = reg.render();
    let om = ops::to_openmetrics(&text);
    assert!(om.ends_with("# EOF\n") && om.matches("# EOF").count() == 1);
    assert!(om.contains("# TYPE kshana_trust_epochs counter\n"));
    assert!(!om.contains("# TYPE kshana_trust_epochs_total"));
    assert!(om
        .lines()
        .any(|l| l.starts_with("kshana_trust_epochs_total{")));
    // Every family named in TYPE has its samples, under the family name (+ _total for counters).
    let mut family = String::new();
    for l in om.lines() {
        if let Some(r) = l.strip_prefix("# TYPE ") {
            family = r.split(' ').next().unwrap().to_string();
        } else if !l.starts_with('#') && !l.is_empty() {
            assert!(l.starts_with(&family), "{l} outside family {family}");
        }
    }
    let shared = std::sync::Arc::new(std::sync::Mutex::new(reg));
    let a = kshana::telemetry::prometheus::serve("127.0.0.1:0".parse().unwrap(), shared).unwrap();
    let mut s = TcpStream::connect(a).unwrap();
    s.write_all(
        b"GET /metrics HTTP/1.1\r\nAccept: application/openmetrics-text; version=1.0.0\r\n\r\n",
    )
    .unwrap();
    let mut r = String::new();
    s.read_to_string(&mut r).unwrap();
    assert!(r.contains("Content-Type: application/openmetrics-text; version=1.0.0"));
    assert!(r.ends_with("# EOF\n"));
}

// ------------------------------------------------------------------------------------- I8

#[test]
fn trust_packets_round_trip_and_decode_through_the_cosmos_and_xtce_definitions() {
    use kshana::tm_bridge::*;
    let s = sample(12.5, "untrusted", Some(17.0), true);
    let p = packet(&s, 321, 9).unwrap();
    let (apid, v) = decode(&p).unwrap();
    assert_eq!(apid, 321);
    assert_eq!(v, vec![12.5, 17.0, 3.0, 2.0, 59.43, 24.75, 40.0]);

    // A reader of the COSMOS definition: ITEM <name> <bit offset> <bits> <type>.
    let bits = |off: usize, n: usize| {
        (off..off + n).fold(0u64, |a, i| a << 1 | u64::from(p[i / 8] >> (7 - i % 8) & 1))
    };
    let mut seen = 0;
    for l in cosmos("KSHANA", 321).lines() {
        let f: Vec<&str> = l.split_whitespace().collect();
        if !matches!(f.first(), Some(&"ITEM") | Some(&"ID_ITEM")) {
            continue;
        }
        let (name, off, n): (&str, usize, usize) =
            (f[1], f[2].parse().unwrap(), f[3].parse().unwrap());
        let raw = bits(off, n);
        let val = match (f[4], n) {
            ("FLOAT", 64) => f64::from_bits(raw),
            ("FLOAT", _) => f64::from(f32::from_bits(raw as u32)),
            _ => raw as f64,
        };
        match name {
            "CCSDS_APID" => assert_eq!(val, 321.0),
            "CCSDS_SEQ_COUNT" => assert_eq!(val, 9.0),
            "CCSDS_LENGTH" => assert_eq!(val as usize, p.len() - 7),
            _ => {
                if let Some(i) = PARAMS.iter().position(|q| q.0 == name) {
                    assert_eq!(val, v[i], "{name}");
                    seen += 1;
                }
            }
        }
    }
    assert_eq!(seen, PARAMS.len());

    // The XTCE entry order with each type's size gives the same offsets.
    let x = xtce("KSHANA", 321);
    let size_of = |ty: &str| {
        let at = x.find(&format!("name=\"{ty}\"")).unwrap();
        let rest = &x[at..];
        let k = rest.find("sizeInBits=\"").unwrap() + 12;
        rest[k..k + rest[k..].find('"').unwrap()]
            .parse::<usize>()
            .unwrap()
    };
    let mut off = 0;
    for l in x.lines().filter(|l| l.contains("ParameterRefEntry")) {
        let name = l.split('"').nth(1).unwrap();
        let n = size_of(&format!("{name}_T"));
        if let Some(i) = PARAMS.iter().position(|q| q.0 == name) {
            let raw = bits(off, n);
            let val = if n == 8 {
                raw as f64
            } else if n == 32 {
                f64::from(f32::from_bits(raw as u32))
            } else {
                f64::from_bits(raw)
            };
            assert_eq!(val, v[i], "XTCE {name}");
        } else if name == "CCSDS_APID" {
            assert_eq!(bits(off, n), 321);
        }
        off += n;
    }
    assert_eq!(off, 8 * p.len());
    assert!(x.contains("<xtce:Comparison parameterRef=\"CCSDS_APID\" value=\"321\"/>"));
}

#[test]
fn xtce_document_is_valid_against_the_omg_xtce_1_2_schema() {
    let xsd = root().join("realdata-cache/xtce/SpaceSystem.local.xsd");
    let have_xmllint = Command::new("xmllint").arg("--version").output().is_ok();
    if !xsd.exists() || !have_xmllint {
        assert!(
            !require(),
            "KSHANA_REQUIRE_REALDATA=1 but {} or xmllint is missing",
            xsd.display()
        );
        eprintln!("skip: XTCE schema or xmllint not present (scripts/fetch_042_w2_schemas.sh)");
        return;
    }
    let mut c = Command::new("xmllint")
        .args(["--noout", "--schema", xsd.to_str().unwrap(), "-"])
        .stdin(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    c.stdin
        .take()
        .unwrap()
        .write_all(kshana::tm_bridge::xtce("KSHANA", 100).as_bytes())
        .unwrap();
    let out = c.wait_with_output().unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
}

#[test]
fn openmct_dictionary_and_datums_have_the_tutorial_shape() {
    use kshana::tm_bridge::*;
    let d = openmct_dictionary("Kshana");
    let ms = d["measurements"].as_array().unwrap();
    assert_eq!(ms.len(), PARAMS.len());
    for m in ms {
        let vals = m["values"].as_array().unwrap();
        assert!(vals.iter().any(|v| v["hints"]["range"] == 1));
        assert!(vals
            .iter()
            .any(|v| v["source"] == "timestamp" && v["hints"]["domain"] == 1));
    }
    let datums = openmct_datums(&sample(2.0, "degraded", None, false), 1_763_078_400.0);
    // Score and position absent: T_S, BAND and N_REASONS only.
    let ids: Vec<&str> = datums.iter().map(|d| d["id"].as_str().unwrap()).collect();
    assert_eq!(ids, vec!["kshana.t_s", "kshana.band", "kshana.n_reasons"]);
    assert_eq!(datums[0]["timestamp"], json!(1_763_078_400_000i64));
}

// ------------------------------------------------------------------------------------- I4

#[test]
fn gps_sdr_sim_motion_is_written_at_10_hz_and_reads_back() {
    use kshana::interop::testbench::*;
    let src = std::fs::read_to_string(root().join("scenarios/gnss-ins.toml")).unwrap();
    let t = trajectory_of(&src, None).unwrap();
    for layout in [SimMotionLayout::Ecef, SimMotionLayout::Llh] {
        let (text, cut) = write_sim_motion(&t, layout);
        let back = read_sim_motion(&text, layout).unwrap();
        assert!(back.len() <= 3000);
        assert_eq!(
            cut,
            t.samples.last().unwrap().t_s - t.samples[0].t_s > 299.9
        );
        for (k, b) in back.iter().enumerate() {
            assert!((b.t_s - k as f64 * 0.1).abs() < 1e-9);
        }
        // Where the trajectory has a sample at the same time, the position matches it.
        let mut matched = 0;
        for s in &t.samples {
            let k = ((s.t_s - t.samples[0].t_s) * 10.0).round() as usize;
            if k < back.len() && ((s.t_s - t.samples[0].t_s) * 10.0 - k as f64).abs() < 1e-6 {
                let d = (0..3)
                    .map(|i| (back[k].ecef_m[i] - s.ecef_m[i]).powi(2))
                    .sum::<f64>()
                    .sqrt();
                assert!(d < 1e-3, "{layout:?} at {}: {d} m", s.t_s);
                matched += 1;
            }
        }
        assert!(matched > 10, "{layout:?}");
    }
}

#[test]
fn sigmf_ci16_capture_layout_round_trips() {
    use kshana::sigmf::*;
    let meta = Meta::new(DataType::Ci16Le, 2.048e6, 1_575.42e6, "SoapySDR capture");
    let iq: Vec<i16> = vec![1, -1, 32767, -32768, 0, 5];
    let data: Vec<u8> = iq.iter().flat_map(|v| v.to_le_bytes()).collect();
    let rec = read(&meta_to_json(&meta).unwrap(), &data, 32768.0).unwrap();
    let (_, back, _) = write(&rec, 32768.0).unwrap();
    assert_eq!(back, data);
    assert_eq!(
        parse_meta(&meta_to_json(&meta).unwrap())
            .unwrap()
            .centre_hz(),
        Some(1_575.42e6)
    );
}

// ------------------------------------------------------------------------------------- CLI

fn kshana(args: &[&str], stdin: &str) -> (bool, String, String) {
    let (ok, out, err) = kshana_bytes(args, stdin);
    (ok, String::from_utf8_lossy(&out).into(), err)
}

fn kshana_bytes(args: &[&str], stdin: &str) -> (bool, Vec<u8>, String) {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    c.stdin.take().unwrap().write_all(stdin.as_bytes()).unwrap();
    let o = c.wait_with_output().unwrap();
    (
        o.status.success(),
        o.stdout,
        String::from_utf8_lossy(&o.stderr).into(),
    )
}

#[test]
fn cli_routes_wave_2_subcommands_without_taking_existing_ones() {
    let stream = [
        json!({ "t_s": 0, "state": "calibrating" }),
        json!({ "t_s": 1, "state": "nominal", "score": 98 }),
        json!({ "t_s": 2, "state": "nominal", "score": 97 }),
        json!({ "t_s": 3, "state": "untrusted", "score": 10, "reasons": ["spoof"] }),
        json!({ "t_s": 4, "state": "nominal", "score": 95 }),
    ]
    .iter()
    .map(|v| v.to_string() + "\n")
    .collect::<String>();
    let (ok, out, err) = kshana(
        &[
            "connect",
            "alert",
            "-",
            "--form",
            "pagerduty",
            "--epoch-unix",
            "1763078400",
        ],
        &stream,
    );
    assert!(ok, "{err}");
    let actions: Vec<String> = out
        .lines()
        .map(|l| {
            serde_json::from_str::<Value>(l).unwrap()["event_action"]
                .as_str()
                .unwrap()
                .to_string()
        })
        .collect();
    assert_eq!(
        actions,
        vec!["resolve", "trigger", "resolve"],
        "band changes after calibration only"
    );
    let (ok, out, _) = kshana(&["connect", "tm", "xtce", "--apid", "42"], "");
    assert!(ok && out == kshana::tm_bridge::xtce("KSHANA", 42));
    let one = kshana::tm_bridge::packet(&sample(0.0, "nominal", None, false), 1, 0)
        .unwrap()
        .len();
    let (ok, out, err) = kshana_bytes(&["connect", "tm-stream", "-", "--to", "packets"], &stream);
    assert!(ok, "{err}");
    let (ok, n, _) = kshana(&["connect", "tm-stream", "-", "--to", "openmct"], &stream);
    assert!(ok && n.lines().count() > 5);
    assert_eq!(out.len(), 5 * one, "one packet per sample");
    let (ok, _, err) = kshana(&["connect", "modbus", "127.0.0.1:1", "--fc", "6"], "");
    assert!(!ok && err.contains("modbus"), "{err}");
    if !cfg!(feature = "soapy") {
        let (ok, _, err) = kshana(&["connect", "sdr-capture", "--args", "driver=x"], "");
        assert!(!ok && err.contains("soapysdr"), "{err}");
    }
    // Existing subcommands are still routed to their owners.
    let (ok, _, err) = kshana(&["connect", "decode", "rtcm3", "-"], "");
    assert!(ok, "{err}");
}
