// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana osnma verify <input>`: run the verifier over a file of I/NAV pages and print
//! the authentication status per satellite and epoch, as text or JSON.

use super::input;
use super::signature::PublicKey;
use super::tables::KeyType;
use super::verifier::{Config, Event, TagResult, TagStatus, Verifier};
use super::{OsnmaStatus, ADVISORY};
use serde::Serialize;
use std::collections::BTreeMap;

const USAGE: &str = "usage: kshana osnma verify <input> [options]

  <input>                    I/NAV pages: the plain format (see docs/OSNMA.md) or the
                             CSV layout of the published test vectors
  --format pages|vector-csv  input layout (default: by file content)
  --start-gst SECONDS        start time of a vector CSV in GST seconds
                             (default: read from a file name like 16_AUG_2023_GST_05_00_01.csv)
  --merkle-root HEX          trusted Merkle root (64 hex digits) for DSM-PKR checks
  --public-key ID:TYPE:HEX   trusted public key, TYPE p256 or p521, compressed point
  --reference-time SECONDS   present time in GST seconds from an independent source
  --max-time-error SECONDS   largest distance of a sub-frame from the reference time
  --epochs                   also print every tag result
  --json                     print JSON instead of text

Exit status: 0 done, 2 usage or input error, 3 a check on some satellite's data failed.";

struct Options {
    input: String,
    format: Option<String>,
    start_gst: Option<u32>,
    merkle_root: Option<[u8; 32]>,
    keys: Vec<PublicKey>,
    reference: Option<u32>,
    max_err: Option<u32>,
    epochs: bool,
    json: bool,
}

fn parse_args(args: &[String]) -> Result<Options, String> {
    let mut o = Options {
        input: String::new(),
        format: None,
        start_gst: None,
        merkle_root: None,
        keys: Vec::new(),
        reference: None,
        max_err: None,
        epochs: false,
        json: false,
    };
    let mut it = args.iter();
    while let Some(a) = it.next() {
        let mut val = |name: &str| it.next().cloned().ok_or(format!("{name} needs a value"));
        match a.as_str() {
            "--format" => o.format = Some(val("--format")?),
            "--start-gst" => o.start_gst = Some(num(&val("--start-gst")?)?),
            "--reference-time" => o.reference = Some(num(&val("--reference-time")?)?),
            "--max-time-error" => o.max_err = Some(num(&val("--max-time-error")?)?),
            "--merkle-root" => {
                let b = hex::decode(val("--merkle-root")?).map_err(|_| "bad Merkle root hex")?;
                o.merkle_root = Some(b.try_into().map_err(|_| "Merkle root must be 32 bytes")?);
            }
            "--public-key" => o.keys.push(parse_key(&val("--public-key")?)?),
            "--epochs" => o.epochs = true,
            "--json" => o.json = true,
            s if s.starts_with("--") => return Err(format!("unknown option {s}")),
            s if o.input.is_empty() => o.input = s.to_string(),
            s => return Err(format!("unexpected argument {s}")),
        }
    }
    if o.input.is_empty() {
        return Err("missing input file".into());
    }
    Ok(o)
}

fn num(s: &str) -> Result<u32, String> {
    s.parse().map_err(|_| format!("not a number: {s}"))
}

fn parse_key(s: &str) -> Result<PublicKey, String> {
    let p: Vec<&str> = s.split(':').collect();
    let [id, ty, hx] = p[..] else {
        return Err("public key must be ID:TYPE:HEX".into());
    };
    let key_type = match ty {
        "p256" => KeyType::P256,
        "p521" => KeyType::P521,
        _ => return Err("public key type must be p256 or p521".into()),
    };
    Ok(PublicKey {
        pkid: id.parse().map_err(|_| "bad public key id")?,
        key_type,
        bytes: hex::decode(hx).map_err(|_| "bad public key hex")?,
    })
}

/// Names of a serde value for text output.
fn name<T: Serialize>(t: &T) -> String {
    match serde_json::to_value(t) {
        Ok(serde_json::Value::String(s)) => s,
        Ok(serde_json::Value::Object(m)) => {
            let state = m.get("state").and_then(|v| v.as_str()).unwrap_or("?");
            match m.get("reason").and_then(|v| v.as_str()) {
                Some(r) => format!("{state} ({r})"),
                None => state.to_string(),
            }
        }
        _ => String::new(),
    }
}

fn status_word(s: OsnmaStatus) -> &'static str {
    match s {
        OsnmaStatus::Authenticated => "authenticated",
        OsnmaStatus::Failed => "failed",
        OsnmaStatus::Unavailable => "unavailable",
    }
}

fn event_json(e: &Event) -> serde_json::Value {
    use serde_json::json;
    match e {
        Event::PublicKeyVerified { pkid } => json!({"kind":"public_key_verified","pkid":pkid}),
        Event::PublicKeyRejected(r) => {
            json!({"kind":"public_key_rejected","reason":format!("{r:?}")})
        }
        Event::AlertMessage { verified } => json!({"kind":"alert_message","verified":verified}),
        Event::KrootVerified { cid, pkid } => {
            json!({"kind":"kroot_verified","cid":cid,"pkid":pkid})
        }
        Event::KrootRejected(r) => json!({"kind":"kroot_rejected","reason":format!("{r:?}")}),
        Event::KeyVerified { gst } => json!({"kind":"key_verified","gst":gst}),
        Event::KeyRejected { gst, reason } => {
            json!({"kind":"key_rejected","gst":gst,"reason":name(reason)})
        }
        Event::TimeRejected { gst_sf } => json!({"kind":"time_rejected","gst":gst_sf}),
        Event::Tag(_) => json!(null),
    }
}

/// Identical events collapsed with a count, in order of first appearance.
fn grouped_events(events: &[Event]) -> Vec<serde_json::Value> {
    let mut order: Vec<String> = Vec::new();
    let mut seen: BTreeMap<String, (serde_json::Value, u32)> = BTreeMap::new();
    for e in events {
        let j = event_json(e);
        let key = j.to_string();
        if !seen.contains_key(&key) {
            order.push(key.clone());
        }
        seen.entry(key).or_insert((j, 0)).1 += 1;
    }
    order
        .into_iter()
        .filter_map(|k| seen.remove(&k))
        .map(|(mut j, n)| {
            j["count"] = n.into();
            j
        })
        .collect()
}

#[derive(Default, Serialize)]
struct Counts {
    authenticated: u32,
    failed: u32,
    pending: u32,
    discarded: u32,
}

/// Run the subcommand; returns the process exit code.
pub fn run(args: &[String]) -> i32 {
    if args.first().map(String::as_str) != Some("verify") {
        eprintln!("{USAGE}");
        return 2;
    }
    let o = match parse_args(&args[1..]) {
        Ok(o) => o,
        Err(e) => {
            eprintln!("error: {e}\n\n{USAGE}");
            return 2;
        }
    };
    let text = match std::fs::read_to_string(&o.input) {
        Ok(t) => t,
        Err(e) => {
            eprintln!("error: cannot read {}: {e}", o.input);
            return 2;
        }
    };
    let csv = match o.format.as_deref() {
        Some("vector-csv") => true,
        Some("pages") => false,
        Some(f) => {
            eprintln!("error: unknown format {f}");
            return 2;
        }
        None => text.trim_start().starts_with("SVID"),
    };
    let pages = if csv {
        let Some(start) = o.start_gst.or_else(|| input::start_from_filename(&o.input)) else {
            eprintln!("error: a vector CSV needs --start-gst or a dated file name");
            return 2;
        };
        input::parse_vector_csv(&text, start)
    } else {
        input::parse_pages(&text)
    };
    let pages = match pages {
        Ok(p) => p,
        Err(e) => {
            eprintln!("error: {e}");
            return 2;
        }
    };
    let mut v = Verifier::new(Config {
        merkle_root: o.merkle_root,
        public_keys: o.keys.clone(),
        max_time_error_s: o.max_err,
        ..Config::default()
    });
    if let Some(r) = o.reference {
        v.set_reference_time(r);
    }
    let mut events = Vec::new();
    let mut tags: Vec<TagResult> = Vec::new();
    for p in &pages {
        for e in v.push_page(p) {
            match e {
                Event::Tag(t) => tags.push(t),
                other => events.push(other),
            }
        }
    }
    let sats = v.sat_status();
    let mut counts: BTreeMap<u8, Counts> = BTreeMap::new();
    let mut last_ok: BTreeMap<u8, u32> = BTreeMap::new();
    for t in &tags {
        let c = counts.entry(t.prnd).or_default();
        match t.status {
            TagStatus::Authenticated => {
                c.authenticated += 1;
                let e = last_ok.entry(t.prnd).or_insert(0);
                *e = (*e).max(t.tag_gst);
            }
            TagStatus::Failed(_) => c.failed += 1,
            TagStatus::Pending(_) => c.pending += 1,
            TagStatus::Discarded(_) => c.discarded += 1,
        }
    }
    let overall = v.overall();
    if o.json {
        let sat_json: Vec<_> = sats
            .iter()
            .map(|(s, st)| {
                let prn: u8 = s[1..].parse().unwrap_or(0);
                serde_json::json!({
                    "sat": s,
                    "status": status_word(*st),
                    "tags": counts.get(&prn),
                    "last_authenticated_tag_gst": last_ok.get(&prn),
                })
            })
            .collect();
        let out = serde_json::json!({
            "advisory": ADVISORY,
            "input": {"path": o.input, "pages": pages.len()},
            "overall": status_word(overall),
            "nma_status": v.nma_status(),
            "alert": v.alert(),
            "satellites": sat_json,
            "events": grouped_events(&events),
            "tags": tags,
            "pksos": super::pksos_sentence(overall, &sats),
        });
        match serde_json::to_string_pretty(&out) {
            Ok(s) => println!("{s}"),
            Err(e) => {
                eprintln!("error: {e}");
                return 2;
            }
        }
    } else {
        println!("Galileo OSNMA verification\n{ADVISORY}\n");
        println!("input: {} ({} pages)", o.input, pages.len());
        println!(
            "overall: {}   NMA status: {}",
            status_word(overall),
            v.nma_status()
        );
        let mut kinds: BTreeMap<String, u32> = BTreeMap::new();
        for e in &events {
            let j = event_json(e);
            *kinds
                .entry(j["kind"].as_str().unwrap_or("?").to_string())
                .or_default() += 1;
        }
        for (k, n) in &kinds {
            println!("  {k}: {n}");
        }
        println!("\nsatellite  status          authenticated  failed  pending  discarded  last authenticated");
        for (s, st) in &sats {
            let prn: u8 = s[1..].parse().unwrap_or(0);
            let c = counts.get(&prn);
            let last = last_ok
                .get(&prn)
                .map(|g| input::label(*g))
                .unwrap_or_else(|| "-".into());
            println!(
                "{s:<10} {:<15} {:>13}  {:>6}  {:>7}  {:>9}  {last}",
                status_word(*st),
                c.map_or(0, |c| c.authenticated),
                c.map_or(0, |c| c.failed),
                c.map_or(0, |c| c.pending),
                c.map_or(0, |c| c.discarded),
            );
        }
        if o.epochs {
            println!("\nepoch (tag sub-frame)      tx   data  adkd  ctr  result");
            for t in &tags {
                println!(
                    "{:<26} E{:02}  E{:02}  {:>4}  {:>3}  {}",
                    input::label(t.tag_gst),
                    t.prna,
                    t.prnd,
                    t.adkd,
                    t.ctr,
                    name(&t.status)
                );
            }
        }
        println!("\n{}", super::pksos_sentence(overall, &sats));
    }
    if sats.iter().any(|(_, s)| *s == OsnmaStatus::Failed) {
        3
    } else {
        0
    }
}
