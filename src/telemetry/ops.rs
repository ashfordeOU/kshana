// SPDX-License-Identifier: AGPL-3.0-only
//! Ops, IT and security outputs from the trust stream (roadmap 0.42 I5; docs/TRUST-TELEMETRY.md):
//! incident and chat webhook payloads (ServiceNow Event Management, PagerDuty Events API v2,
//! Opsgenie Alert API, Slack incoming webhooks, Microsoft Teams Adaptive Card), Splunk HTTP Event
//! Collector events, Elasticsearch bulk lines with Elastic Common Schema fields, SNMPv2c traps,
//! STIX 2.1 interference objects and a TAXII 2.1 client that adds them to a collection, and the
//! OpenMetrics form of the Prometheus exposition.
//!
//! A payload is built per band change (as for CAP). Every builder is pure; delivery is plain
//! HTTP/1.1 ([`http_post`]) to the service or, for HTTPS endpoints, to a local TLS relay. A
//! credential (routing key, token) comes from an environment variable, is placed only in the
//! header or field the service defines, and is never sent to a host other than the loopback one
//! over plain HTTP.

use super::sample::{Band, TrustSample};
use serde_json::{json, Value};
use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::Duration;

/// The payload forms [`payload`] builds.
pub const FORMS: [&str; 8] = [
    "servicenow",
    "pagerduty",
    "opsgenie",
    "slack",
    "teams",
    "splunk-hec",
    "elastic",
    "stix",
];

fn rfc3339(unix: f64) -> String {
    let ms = ((unix - unix.floor()) * 1000.0).floor() as u32;
    format!(
        "{}.{ms:03}Z",
        super::cap::iso(unix).trim_end_matches("+00:00")
    )
}

fn summary(s: &TrustSample, host: &str) -> String {
    let score = s
        .score
        .map(|v| format!(" score {v:.0}"))
        .unwrap_or_default();
    let why = if s.reasons.is_empty() {
        String::new()
    } else {
        format!(" ({})", s.reasons.join(", "))
    };
    format!("GNSS trust {} at {host}{score}{why}", s.band.label())
}

fn details(s: &TrustSample) -> Value {
    let mut d =
        json!({ "band": s.band.label(), "score": s.score, "reasons": s.reasons, "t_s": s.t_s });
    if let Some(p) = &s.position {
        d["position"] =
            json!({ "lat_deg": p.lat_deg, "lon_deg": p.lon_deg, "height_m": p.height_m });
    }
    d
}

/// A deterministic UUID (version 5, RFC 9562) from `name` in the STIX 2.1 namespace.
pub fn uuid5(name: &str) -> String {
    use sha1::{Digest, Sha1};
    let mut h = Sha1::new();
    // The STIX 2.1 namespace UUID 00abedb4-aa42-466c-9c01-fed23315a9b7 (section 2.9).
    h.update([
        0, 171, 237, 180, 170, 66, 70, 108, 156, 1, 254, 210, 51, 21, 169, 183,
    ]);
    h.update(name.as_bytes());
    let mut b: [u8; 16] = h.finalize()[..16].try_into().unwrap_or_default();
    b[6] = (b[6] & 0x0F) | 0x50;
    b[8] = (b[8] & 0x3F) | 0x80;
    let x = hex::encode(b);
    format!(
        "{}-{}-{}-{}-{}",
        &x[..8],
        &x[8..12],
        &x[12..16],
        &x[16..20],
        &x[20..]
    )
}

/// STIX 2.1 objects for one band change: the producing `identity`, a `location` when the sample
/// carries a position, and the observation as a new SDO `gnss-interference` declared by an
/// `extension-definition`. Ids are UUID v5 of their content, so the same input gives the same ids.
pub fn stix_objects(s: &TrustSample, host: &str, unix: f64) -> Vec<Value> {
    let t = rfc3339(unix);
    let created = "2026-11-14T00:00:00.000Z";
    let ident = format!("identity--{}", uuid5(&format!("kshana-identity|{host}")));
    let ext = format!(
        "extension-definition--{}",
        uuid5("kshana-gnss-interference-1")
    );
    let mut out = vec![
        json!({ "type": "identity", "spec_version": "2.1", "id": ident, "created": created,
                "modified": created, "name": format!("Kshana at {host}"), "identity_class": "system" }),
        json!({ "type": "extension-definition", "spec_version": "2.1", "id": ext,
                "created_by_ref": ident, "created": created, "modified": created,
                "name": "gnss-interference", "version": "1.0.0", "extension_types": ["new-sdo"],
                "schema": "https://github.com/ashfordeOU/kshana/blob/main/docs/TRUST-TELEMETRY.md" }),
    ];
    let key = format!("{host}|{unix}|{}", s.band.label());
    let mut obs = json!({
        "type": "gnss-interference", "spec_version": "2.1",
        "id": format!("gnss-interference--{}", uuid5(&key)), "created_by_ref": ident,
        "created": t, "modified": t, "first_observed": t, "band": s.band.label(),
        "extensions": { (ext.clone()): { "extension_type": "new-sdo" } }
    });
    // STIX forbids null and empty-list property values.
    if let Some(v) = s.score {
        obs["score"] = json!(v);
    }
    if !s.reasons.is_empty() {
        obs["reasons"] = json!(s.reasons);
    }
    if let Some(p) = &s.position {
        let loc = format!("location--{}", uuid5(&format!("{key}|loc")));
        out.push(
            json!({ "type": "location", "spec_version": "2.1", "id": loc, "created_by_ref": ident,
            "created": t, "modified": t, "latitude": p.lat_deg, "longitude": p.lon_deg }),
        );
        obs["location_ref"] = json!(loc);
    }
    out.push(obs);
    out
}

/// The payload of form `name` (one of [`FORMS`]) for a band change to `s` from `prev`, at UNIX
/// time `unix`. `secret` is the routing key (PagerDuty) where the form carries one in its body.
pub fn payload(
    name: &str,
    s: &TrustSample,
    prev: Option<Band>,
    host: &str,
    unix: f64,
    secret: &str,
) -> Result<String, String> {
    let clear = s.band == Band::Nominal;
    let msg = summary(s, host);
    let alias = format!("kshana-gnss-trust-{host}");
    let (sev_pd, sev_sn, prio) = match s.band {
        Band::Untrusted => ("critical", "1", "P1"),
        Band::Degraded => ("warning", "4", "P3"),
        _ if clear && prev.is_some_and(|p| p > Band::Nominal) => ("info", "0", "P5"),
        _ => ("info", "5", "P5"),
    };
    let v = match name {
        "servicenow" => json!({ "records": [{
            "source": "Kshana", "node": host, "type": "GNSS trust", "resource": "gnss",
            "metric_name": "trust_band", "message_key": alias, "severity": sev_sn,
            "description": msg, "time_of_event": super::cap::iso(unix)[..19].replace('T', " "),
            "additional_info": details(s).to_string() }] }),
        "pagerduty" => json!({
            "routing_key": secret, "event_action": if clear { "resolve" } else { "trigger" },
            "dedup_key": alias, "payload": { "summary": msg, "source": host, "severity": sev_pd,
            "timestamp": rfc3339(unix), "component": "gnss", "group": "kshana", "class": "gnss-trust",
            "custom_details": details(s) } }),
        "opsgenie" if clear => json!({ "source": "Kshana", "note": msg }),
        "opsgenie" => json!({ "message": msg.chars().take(130).collect::<String>(), "alias": alias,
            "description": msg, "tags": ["kshana", "gnss", s.band.label()], "details": details(s),
            "entity": host, "source": "Kshana", "priority": prio }),
        "slack" => json!({ "text": msg, "blocks": [{ "type": "section",
            "text": { "type": "mrkdwn", "text": format!("*{msg}*\n`{}`", details(s)) } }] }),
        "teams" => json!({ "type": "message", "attachments": [{
            "contentType": "application/vnd.microsoft.card.adaptive", "contentUrl": null,
            "content": { "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
              "type": "AdaptiveCard", "version": "1.4", "body": [
                { "type": "TextBlock", "text": msg, "weight": "Bolder", "wrap": true },
                { "type": "FactSet", "facts": [
                  { "title": "Band", "value": s.band.label() },
                  { "title": "Score", "value": s.score.map(|v| format!("{v:.0}")).unwrap_or_default() },
                  { "title": "Reasons", "value": s.reasons.join(", ") } ] } ] } }] }),
        "splunk-hec" => json!({ "time": unix, "host": host, "source": "kshana",
            "sourcetype": "kshana:gnss_trust", "event": details(s) }),
        "elastic" => {
            let doc = json!({ "@timestamp": rfc3339(unix), "message": msg,
                "event": { "kind": "alert", "module": "kshana", "dataset": "kshana.gnss_trust",
                           "severity": s.band.index() }, "observer": { "hostname": host, "vendor": "Kshana" },
                "kshana": details(s) });
            return Ok(format!(
                "{}\n{doc}\n",
                json!({ "create": { "_index": "logs-kshana.gnss_trust-default" } })
            ));
        }
        "stix" => {
            json!({ "type": "bundle", "id": format!("bundle--{}", uuid5(&format!("{host}|{unix}"))),
            "objects": stix_objects(s, host, unix) })
        }
        _ => {
            return Err(crate::terr!(
                "e-connect-ops-form",
                name = name,
                forms = FORMS.join(", ")
            ))
        }
    };
    Ok(v.to_string())
}

/// An SNMPv2c trap for one sample: `sysUpTime.0`, `snmpTrapOID.0` = `trap_oid`, then
/// `trap_oid.1` band index (0 calibrating to 4 unknown), `.2` score x 100 (-1 when absent) and
/// `.3` the reasons. The trap OID is the operator's (an enterprise arc they control).
pub fn snmp_trap(
    community: &str,
    request_id: i64,
    uptime_cs: u32,
    trap_oid: &[u32],
    s: &TrustSample,
) -> Vec<u8> {
    use crate::snmp::{encode_message, pdu, Message, Value as V};
    let sub = |k: u32| [trap_oid, &[k]].concat();
    let m = Message {
        version: 1,
        community: community.as_bytes().to_vec(),
        pdu_type: pdu::TRAP_V2,
        request_id,
        error_status: 0,
        error_index: 0,
        varbinds: vec![
            (vec![1, 3, 6, 1, 2, 1, 1, 3, 0], V::TimeTicks(uptime_cs)),
            (
                vec![1, 3, 6, 1, 6, 3, 1, 1, 4, 1, 0],
                V::ObjectId(trap_oid.to_vec()),
            ),
            (sub(1), V::Integer(s.band.index() as i64)),
            (
                sub(2),
                V::Integer(s.score.map_or(-1, |v| (v * 100.0).round() as i64)),
            ),
            (sub(3), V::OctetString(s.reasons.join(",").into_bytes())),
        ],
    };
    encode_message(&m).unwrap_or_default()
}

/// The OpenMetrics 1.0 text form of a Prometheus 0.0.4 exposition: counter families named
/// without their `_total` suffix in `# HELP` / `# TYPE`, and the closing `# EOF`.
pub fn to_openmetrics(text: &str) -> String {
    let counters: Vec<&str> = text
        .lines()
        .filter_map(|l| l.strip_prefix("# TYPE ")?.strip_suffix(" counter"))
        .collect();
    let mut o = String::with_capacity(text.len() + 8);
    for l in text.lines() {
        let fixed = counters.iter().find_map(|c| {
            let base = c.strip_suffix("_total")?;
            ["# HELP ", "# TYPE "].iter().find_map(|p| {
                l.strip_prefix(&format!("{p}{c} "))
                    .map(|r| format!("{p}{base} {r}"))
            })
        });
        o.push_str(fixed.as_deref().unwrap_or(l));
        o.push('\n');
    }
    o.push_str("# EOF\n");
    o
}

/// POST `body` over plain HTTP/1.1 to `http://host[:port]/path` with the extra `headers`; returns
/// the status code and the response body. Refuses to send headers (credentials) to a host that is
/// not the loopback one: use a local TLS relay for a remote service.
pub fn http_post(
    url: &str,
    headers: &[(&str, String)],
    body: &[u8],
) -> Result<(u16, String), String> {
    let bad = || crate::terr!("e-telemetry-webhook-url", url = url.to_string());
    let rest = url.strip_prefix("http://").ok_or_else(bad)?;
    let (auth, path) = rest
        .find('/')
        .map_or((rest, "/"), |i| (&rest[..i], &rest[i..]));
    let hp = if auth.contains(':') {
        auth.to_string()
    } else {
        format!("{auth}:80")
    };
    let a = hp
        .to_socket_addrs()
        .map_err(|e| format!("{hp}: {e}"))?
        .next()
        .ok_or_else(bad)?;
    if headers
        .iter()
        .any(|(k, _)| k.eq_ignore_ascii_case("authorization"))
        && !a.ip().is_loopback()
    {
        return Err(crate::terr!(
            "e-connect-ops-failed",
            proto = "http",
            why = "loopback"
        ));
    }
    let mut s =
        TcpStream::connect_timeout(&a, Duration::from_secs(5)).map_err(|e| format!("{a}: {e}"))?;
    s.set_read_timeout(Some(Duration::from_secs(10)))
        .map_err(|e| e.to_string())?;
    let mut head = format!(
        "POST {path} HTTP/1.1\r\nHost: {auth}\r\nContent-Length: {}\r\nConnection: close\r\n",
        body.len()
    );
    for (k, v) in headers {
        head.push_str(&format!("{k}: {v}\r\n"));
    }
    head.push_str("\r\n");
    s.write_all(head.as_bytes())
        .and_then(|_| s.write_all(body))
        .map_err(|e| e.to_string())?;
    let mut resp = Vec::new();
    let _ = s.take(1 << 20).read_to_end(&mut resp);
    let text = String::from_utf8_lossy(&resp);
    let code = text.split_whitespace().nth(1).and_then(|c| c.parse().ok());
    let body = text
        .split_once("\r\n\r\n")
        .map(|x| x.1.to_string())
        .unwrap_or_default();
    code.map(|c| (c, body))
        .ok_or_else(|| crate::terr!("e-telemetry-webhook-answer"))
}

/// TAXII 2.1 "Add Objects": POST the STIX `objects` as an envelope to
/// `<api_root>/collections/<collection>/objects/`. Returns the status code and the status
/// resource the server answers with.
pub fn taxii_add(
    api_root: &str,
    collection: &str,
    objects: &[Value],
    auth: Option<String>,
) -> Result<(u16, Value), String> {
    let media = "application/taxii+json;version=2.1".to_string();
    let mut h = vec![("Content-Type", media.clone()), ("Accept", media)];
    if let Some(a) = auth {
        h.push(("Authorization", a));
    }
    let url = format!(
        "{}/collections/{collection}/objects/",
        api_root.trim_end_matches('/')
    );
    let body = json!({ "objects": objects }).to_string();
    let (code, text) = http_post(&url, &h, body.as_bytes())?;
    Ok((code, serde_json::from_str(&text).unwrap_or(Value::Null)))
}
