// SPDX-License-Identifier: AGPL-3.0-only
//! Home Assistant and NTP-appliance friendly output of the trust stream: a small JSON state
//! document and the Home Assistant MQTT discovery messages that make it three entities (trust
//! score, trust band and an "untrusted" binary sensor), published over MQTT 3.1.1 at QoS 0.
//!
//! Publish only: the sink connects to a broker you name, sends CONNECT, PUBLISH and DISCONNECT,
//! and reads nothing but the CONNACK. It carries no credentials and no TLS, so point it at a
//! broker on the local network or a local relay; it never touches a device or a receiver.
//! Delivery runs on its own thread behind a bounded queue, like the syslog sink: a dead broker
//! drops messages (counted) and never stalls the trust stream.

use super::sample::{Band, TrustSample};
use serde_json::json;
use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::mpsc::{sync_channel, SyncSender};
use std::sync::Arc;
use std::time::Duration;

/// One MQTT message.
#[derive(Clone, Debug, PartialEq)]
pub struct Message {
    /// Topic.
    pub topic: String,
    /// Payload (UTF-8 JSON).
    pub payload: String,
    /// Retain flag.
    pub retain: bool,
}

/// Topic layout.
#[derive(Clone, Debug)]
pub struct Topics {
    /// State topic prefix: the state document is published to `<prefix>/state`.
    pub prefix: String,
    /// Home Assistant discovery prefix (`homeassistant` by default).
    pub discovery_prefix: String,
    /// Node id in discovery topics and unique ids.
    pub node_id: String,
}

impl Default for Topics {
    fn default() -> Self {
        Self {
            prefix: "kshana/trust".into(),
            discovery_prefix: "homeassistant".into(),
            node_id: "kshana".into(),
        }
    }
}

/// The JSON state document of one epoch: band, score (null while there is none), the epoch
/// offset, the reasons, and the advisory statement. Nothing about the position is included.
pub fn state_json(s: &TrustSample) -> String {
    json!({
        "state": s.band.label(),
        "score": s.score,
        "untrusted": s.band == Band::Untrusted,
        "t_s": s.t_s,
        "time": s.time_label,
        "reasons": s.reasons,
        "gate": s.gate,
        "advisory": "Advisory software, not type-approved navigation or timing equipment.",
    })
    .to_string()
}

/// Home Assistant MQTT discovery messages (retained): a score sensor, a band sensor and an
/// "untrusted" binary sensor, all reading the state topic.
pub fn discovery(t: &Topics) -> Vec<Message> {
    let state = format!("{}/state", t.prefix);
    let device = json!({
        "identifiers": [t.node_id],
        "name": "Kshana GNSS trust",
        "manufacturer": "Ashforde OÜ",
    });
    let mk = |kind: &str, obj: &str, name: &str, extra: serde_json::Value| {
        let mut c = json!({
            "name": name,
            "unique_id": format!("{}_{obj}", t.node_id),
            "state_topic": state,
            "device": device,
        });
        if let (Some(c), Some(e)) = (c.as_object_mut(), extra.as_object()) {
            for (k, v) in e {
                c.insert(k.clone(), v.clone());
            }
        }
        Message {
            topic: format!("{}/{kind}/{}/{obj}/config", t.discovery_prefix, t.node_id),
            payload: c.to_string(),
            retain: true,
        }
    };
    vec![
        mk(
            "sensor",
            "score",
            "GNSS trust score",
            json!({"value_template": "{{ value_json.score }}", "unit_of_measurement": "points",
                   "state_class": "measurement"}),
        ),
        mk(
            "sensor",
            "band",
            "GNSS trust band",
            json!({"value_template": "{{ value_json.state }}",
                   "json_attributes_topic": state,
                   "json_attributes_template": "{{ {'reasons': value_json.reasons} | tojson }}"}),
        ),
        mk(
            "binary_sensor",
            "untrusted",
            "GNSS untrusted",
            json!({"value_template": "{{ 'ON' if value_json.untrusted else 'OFF' }}",
                   "payload_on": "ON", "payload_off": "OFF", "device_class": "problem"}),
        ),
    ]
}

/// The state message for one epoch.
pub fn state_message(t: &Topics, s: &TrustSample) -> Message {
    Message {
        topic: format!("{}/state", t.prefix),
        payload: state_json(s),
        retain: true,
    }
}

fn put_str(out: &mut Vec<u8>, s: &str) {
    out.extend((s.len() as u16).to_be_bytes());
    out.extend(s.as_bytes());
}

fn put_len(out: &mut Vec<u8>, mut n: usize) {
    loop {
        let mut b = (n % 128) as u8;
        n /= 128;
        if n > 0 {
            b |= 0x80;
        }
        out.push(b);
        if n == 0 {
            break;
        }
    }
}

/// MQTT 3.1.1 CONNECT packet (clean session, 60 s keep-alive, no credentials).
pub fn connect_packet(client_id: &str) -> Vec<u8> {
    let mut body = Vec::new();
    put_str(&mut body, "MQTT");
    body.extend([4, 0x02, 0, 60]);
    put_str(&mut body, client_id);
    let mut p = vec![0x10];
    put_len(&mut p, body.len());
    p.extend(body);
    p
}

/// MQTT 3.1.1 PUBLISH packet at QoS 0.
pub fn publish_packet(m: &Message) -> Vec<u8> {
    let mut body = Vec::new();
    put_str(&mut body, &m.topic);
    body.extend(m.payload.as_bytes());
    let mut p = vec![0x30 | u8::from(m.retain)];
    put_len(&mut p, body.len());
    p.extend(body);
    p
}

/// Delivery thread handle.
pub struct MqttSink {
    tx: Option<SyncSender<Message>>,
    handle: Option<std::thread::JoinHandle<()>>,
    /// Messages dropped (queue full or broker unreachable).
    pub failures: Arc<AtomicU64>,
}

impl MqttSink {
    /// Start delivering to `addr` (`host:port`).
    pub fn start(addr: &str, client_id: String) -> Self {
        let (tx, rx) = sync_channel::<Message>(1024);
        let failures = Arc::new(AtomicU64::new(0));
        let (addr, f) = (addr.to_string(), Arc::clone(&failures));
        let handle = std::thread::spawn(move || {
            let mut conn: Option<TcpStream> = None;
            for m in rx {
                let sent = (|| -> Option<()> {
                    if conn.is_none() {
                        let a = addr.to_socket_addrs().ok()?.next()?;
                        let mut s = TcpStream::connect_timeout(&a, Duration::from_secs(2)).ok()?;
                        s.set_write_timeout(Some(Duration::from_secs(2))).ok()?;
                        s.set_read_timeout(Some(Duration::from_secs(2))).ok()?;
                        s.write_all(&connect_packet(&client_id)).ok()?;
                        let mut ack = [0u8; 4];
                        s.read_exact(&mut ack).ok()?;
                        if ack[0] != 0x20 || ack[3] != 0 {
                            return None;
                        }
                        conn = Some(s);
                    }
                    conn.as_mut()?.write_all(&publish_packet(&m)).ok()
                })();
                if sent.is_none() {
                    conn = None;
                    f.fetch_add(1, Ordering::Relaxed);
                }
            }
            if let Some(mut s) = conn {
                let _ = s.write_all(&[0xE0, 0]);
            }
        });
        Self {
            tx: Some(tx),
            handle: Some(handle),
            failures,
        }
    }

    /// Queue a message; a full queue drops it and counts the failure.
    pub fn send(&self, m: Message) {
        if let Some(tx) = &self.tx {
            if tx.try_send(m).is_err() {
                self.failures.fetch_add(1, Ordering::Relaxed);
            }
        }
    }

    /// Close the queue and wait for the thread to deliver what is queued.
    pub fn finish(mut self) {
        self.tx = None;
        if let Some(h) = self.handle.take() {
            let _ = h.join();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::net::TcpListener;

    fn sample(band: Band, score: Option<f64>) -> TrustSample {
        TrustSample {
            t_s: 12.0,
            time_label: None,
            score,
            band,
            reasons: vec!["cn0-drop".into()],
            gate: None,
            position: None,
            geometry: None,
            reason_class: Default::default(),
        }
    }

    #[test]
    fn state_and_discovery_documents() {
        let v: serde_json::Value =
            serde_json::from_str(&state_json(&sample(Band::Untrusted, Some(31.0)))).unwrap();
        assert_eq!(v["state"], "untrusted");
        assert_eq!(v["untrusted"], true);
        assert_eq!(v["score"], 31.0);
        assert!(v.get("position").is_none());
        let d = discovery(&Topics::default());
        assert_eq!(d.len(), 3);
        assert_eq!(d[0].topic, "homeassistant/sensor/kshana/score/config");
        assert!(d.iter().all(|m| m.retain));
        for m in &d {
            let c: serde_json::Value = serde_json::from_str(&m.payload).unwrap();
            assert_eq!(c["state_topic"], "kshana/trust/state");
            assert!(c["unique_id"].as_str().unwrap().starts_with("kshana_"));
        }
        let none: serde_json::Value =
            serde_json::from_str(&state_json(&sample(Band::Calibrating, None))).unwrap();
        assert!(none["score"].is_null());
    }

    #[test]
    fn packets_are_mqtt_3_1_1() {
        let c = connect_packet("k");
        assert_eq!(&c[..2], &[0x10, 13]);
        assert_eq!(&c[2..8], &[0, 4, b'M', b'Q', b'T', b'T']);
        assert_eq!(&c[8..10], &[4, 0x02]);
        let p = publish_packet(&Message {
            topic: "a/b".into(),
            payload: "x".repeat(200),
            retain: true,
        });
        // flags: PUBLISH, QoS 0, retain; remaining length 2+3+200 = 205 -> two bytes
        assert_eq!(&p[..3], &[0x31, 0xCD, 0x01]);
        assert_eq!(&p[3..8], &[0, 3, b'a', b'/', b'b']);
    }

    #[test]
    fn loopback_broker_receives_publishes_and_a_dead_broker_is_counted() {
        let l = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap().to_string();
        let t = std::thread::spawn(move || {
            let (mut s, _) = l.accept().unwrap();
            let mut first = [0u8; 25];
            s.read_exact(&mut first).unwrap();
            s.write_all(&[0x20, 2, 0, 0]).unwrap();
            let mut rest = Vec::new();
            s.read_to_end(&mut rest).unwrap();
            (first.to_vec(), rest)
        });
        let sink = MqttSink::start(&addr, "kshana-test".into());
        let m = Message {
            topic: "t".into(),
            payload: "hello".into(),
            retain: false,
        };
        sink.send(m.clone());
        sink.send(m.clone());
        let failures = Arc::clone(&sink.failures);
        sink.finish();
        let (first, rest) = t.join().unwrap();
        assert_eq!(first[0], 0x10);
        let one = publish_packet(&m);
        assert_eq!(&rest[..one.len() * 2], &[one.clone(), one].concat()[..]);
        assert_eq!(&rest[rest.len() - 2..], &[0xE0, 0]);
        assert_eq!(failures.load(Ordering::Relaxed), 0);

        let dead = MqttSink::start("127.0.0.1:1", "x".into());
        dead.send(m);
        let f = Arc::clone(&dead.failures);
        dead.finish();
        assert_eq!(f.load(Ordering::Relaxed), 1);
    }
}
