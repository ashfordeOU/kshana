// SPDX-License-Identifier: AGPL-3.0-only
//! SSR correction messages as `kshana.obs/1` correction records (R1.1): each public sample stream
//! of `tests/fixtures/rtcm_ssr/` is converted (`obs convert --format rtcm-ssr`), written as JSON
//! Lines, read back through `obs check`, and every value of every correction record is compared
//! with the value the open decoder pyrtcm 1.2.0 records for that message (BSD 3-Clause; see the
//! fixture `NOTICE.md`): integers exactly, scaled values to within half a least-significant bit.

use kshana::obs::{check, from_log, to_jsonl, CorrectionRecord, Record, Station};
use kshana::rtcm_ssr::Kind;
use serde_json::{Map, Value};

const EXPECTED: &str = include_str!("fixtures/rtcm_ssr/expected_ssr.json");

const STREAMS: [(&str, &[u8]); 3] = [
    (
        "pygpsdata-RTCM3.log",
        include_bytes!("fixtures/rtcm_ssr/pygpsdata-RTCM3.log"),
    ),
    (
        "pygpsdata-1240-1264.log",
        include_bytes!("fixtures/rtcm_ssr/pygpsdata-1240-1264.log"),
    ),
    (
        "pygpsdata-NTRIP-4076.log",
        include_bytes!("fixtures/rtcm_ssr/pygpsdata-NTRIP-4076.log"),
    ),
];

fn num(f: &Map<String, Value>, k: &str) -> f64 {
    f.get(k)
        .and_then(Value::as_f64)
        .unwrap_or_else(|| panic!("missing {k}"))
}

fn close(got: f64, want: f64, lsb: f64, what: &str) {
    assert!(
        (got - want).abs() <= lsb / 2.0 + 1e-12,
        "{what}: got {got}, want {want}"
    );
}

/// The pyrtcm keys of one message family.
struct Keys {
    epoch: &'static str,
    interval: &'static str,
    multiple: &'static str,
    iod_ssr: &'static str,
    provider: &'static str,
    solution: &'static str,
    datum: &'static str,
    nsat: &'static str,
    sat: String,
    iod: Option<String>,
    orbit: [&'static str; 6],
    clock: [&'static str; 3],
    nbias: &'static str,
    signal: String,
    bias: &'static str,
}

fn keys(f: &Map<String, Value>) -> Keys {
    if f.contains_key("IDF001") {
        return Keys {
            epoch: "IDF003",
            interval: "IDF004",
            multiple: "IDF005",
            iod_ssr: "IDF007",
            provider: "IDF008",
            solution: "IDF009",
            datum: "IDF006",
            nsat: "IDF010",
            sat: "IDF011".into(),
            iod: Some("IDF012".into()),
            orbit: ["IDF013", "IDF014", "IDF015", "IDF016", "IDF017", "IDF018"],
            clock: ["IDF019", "IDF020", "IDF021"],
            nbias: "IDF023",
            signal: "IDF024".into(),
            bias: "IDF025",
        };
    }
    let first = |ks: &[&str], suffix: &str| {
        ks.iter()
            .find(|k| f.contains_key(&format!("{k}{suffix}")))
            .map(|k| k.to_string())
    };
    Keys {
        epoch: ["DF385", "DF386", "DF458", "DF460", "DF462", "DF465"]
            .into_iter()
            .find(|k| f.contains_key(*k))
            .unwrap(),
        interval: "DF391",
        multiple: "DF388",
        iod_ssr: "DF413",
        provider: "DF414",
        solution: "DF415",
        datum: "DF375",
        nsat: "DF387",
        sat: first(
            &["DF068", "DF384", "DF252", "DF429", "DF463", "DF488"],
            "_01",
        )
        .unwrap_or_default(),
        iod: first(
            &["DF071", "DF392", "DF459", "DF434", "DF469", "DF471"],
            "_01",
        ),
        orbit: ["DF365", "DF366", "DF367", "DF368", "DF369", "DF370"],
        clock: ["DF376", "DF377", "DF378"],
        nbias: "DF379",
        signal: first(
            &["DF380", "DF381", "DF382", "DF461", "DF464", "DF467"],
            "_01_01",
        )
        .unwrap_or_default(),
        bias: "DF383",
    }
}

/// Compare the records of one message with pyrtcm's fields for it.
fn compare(recs: &[&CorrectionRecord], f: &Map<String, Value>, what: &str) {
    let k = keys(f);
    let r0 = recs[0];
    assert_eq!(num(f, "DF002") as u16, r0.message, "{what}");
    if let Some(n) = r0.igs_message {
        assert_eq!(num(f, "IDF002") as u8, n, "{what}");
    }
    for r in recs {
        assert_eq!(num(f, k.epoch) as u32, r.epoch_s, "{what} epoch");
        assert_eq!(num(f, k.interval) as u8, r.update_interval, "{what}");
        assert_eq!(num(f, k.multiple) == 1.0, r.multiple, "{what}");
        assert_eq!(num(f, k.iod_ssr) as u8, r.iod_ssr, "{what}");
        assert_eq!(num(f, k.provider) as u16, r.provider, "{what}");
        assert_eq!(num(f, k.solution) as u8, r.solution, "{what}");
        if let Some(d) = r.regional_datum {
            assert_eq!(num(f, k.datum) == 1.0, d, "{what} datum");
        }
    }
    if r0.kind == Kind::Vtec {
        assert_eq!(recs.len(), 1, "{what}");
        let q = f.get("IDF041").or_else(|| f.get("DF478")).unwrap();
        close(
            r0.vtec_quality_tecu.unwrap(),
            q.as_f64().unwrap(),
            0.05,
            what,
        );
        // pyrtcm records the layers of the IGS message only (see the fixture NOTICE).
        for (i, l) in r0.vtec_layers.iter().enumerate() {
            let x = format!("_{:02}", i + 1);
            if !f.contains_key(&format!("IDF036{x}")) {
                continue;
            }
            close(l.height_m / 1e3, num(f, &format!("IDF036{x}")), 10.0, what);
            assert_eq!(num(f, &format!("IDF037{x}")) as u8 + 1, l.degree);
            assert_eq!(num(f, &format!("IDF038{x}")) as u8 + 1, l.order);
            for (key, cs) in [("IDF039", &l.c_tecu), ("IDF040", &l.s_tecu)] {
                for (j, v) in cs.iter().enumerate() {
                    let c = format!("{key}{x}_{:02}", j + 1);
                    close(*v, num(f, &c), 0.005, &c);
                }
            }
        }
        return;
    }
    assert_eq!(num(f, k.nsat) as usize, recs.len(), "{what} satellites");
    for (i, r) in recs.iter().enumerate() {
        let x = format!("_{:02}", i + 1);
        let sat = r.sat.as_deref().unwrap();
        let id: u8 = sat[1..].parse().unwrap();
        assert_eq!(num(f, &format!("{}{x}", k.sat)) as u8, id, "{what} sat {i}");
        if let (Some(iod), Some(key)) = (r.iod, &k.iod) {
            assert_eq!(num(f, &format!("{key}{x}")) as u32, iod, "{what} iod{x}");
        }
        if let Some(o) = r.orbit {
            let v = [
                o.radial_m,
                o.along_m,
                o.cross_m,
                o.dot_radial_m_s,
                o.dot_along_m_s,
                o.dot_cross_m_s,
            ];
            for ((key, v), lsb) in k
                .orbit
                .iter()
                .zip(v)
                .zip([0.1, 0.4, 0.4, 0.001, 0.004, 0.004])
            {
                close(
                    v * 1e3,
                    num(f, &format!("{key}{x}")),
                    lsb,
                    &format!("{what} {key}{x}"),
                );
            }
        }
        if let Some(c) = r.clock {
            let v = [c.c0_m, c.c1_m_s, c.c2_m_s2];
            for ((key, v), lsb) in k.clock.iter().zip(v).zip([0.1, 0.001, 0.00002]) {
                close(
                    v * 1e3,
                    num(f, &format!("{key}{x}")),
                    lsb,
                    &format!("{what} {key}{x}"),
                );
            }
        }
        if r.kind == Kind::CodeBias {
            assert_eq!(
                num(f, &format!("{}{x}", k.nbias)) as usize,
                r.code_biases.len()
            );
            for (j, b) in r.code_biases.iter().enumerate() {
                let y = format!("{x}_{:02}", j + 1);
                assert_eq!(
                    num(f, &format!("{}{y}", k.signal)) as u8,
                    b.signal,
                    "{what}"
                );
                close(
                    b.bias_m,
                    num(f, &format!("{}{y}", k.bias)),
                    0.01,
                    &format!("{what} bias{y}"),
                );
            }
        }
    }
}

#[test]
fn every_sample_stream_round_trips_to_the_open_decoders_values() {
    let expected: Value = serde_json::from_str(EXPECTED).unwrap();
    let mut compared = 0;
    for (file, bytes) in STREAMS {
        let station = Station {
            id: "SSR-SAMPLE".into(),
            ..Default::default()
        };
        let made = from_log("rtcm-ssr", bytes, &station).unwrap();
        let text = to_jsonl(&made).unwrap();
        let (back, report) = check(&text).unwrap();
        assert_eq!(back, made, "{file}: the JSON Lines read back unchanged");
        assert_eq!((report.epochs, report.alarms), (0, 0), "{file}");
        let recs: Vec<&CorrectionRecord> = back
            .iter()
            .filter_map(|r| match r {
                Record::Correction(c) => Some(&**c),
                _ => None,
            })
            .collect();
        assert_eq!(report.corrections, recs.len(), "{file}");
        // Group the records back into messages: a new message starts when the message number,
        // IGS number, epoch or kind changes, or a satellite repeats.
        let mut groups: Vec<Vec<&CorrectionRecord>> = Vec::new();
        for r in recs {
            let same = groups.last().is_some_and(|g| {
                let p = g[0];
                (p.message, p.igs_message, p.epoch_s, p.kind)
                    == (r.message, r.igs_message, r.epoch_s, r.kind)
                    && r.kind != Kind::Vtec
                    && !g.iter().any(|q| q.sat == r.sat)
            });
            if same {
                groups.last_mut().unwrap().push(r);
            } else {
                groups.push(vec![r]);
            }
        }
        let want = expected[file].as_array().unwrap();
        // Messages with no satellite give no record; pyrtcm's count of satellites is then 0.
        let want: Vec<&Value> = want
            .iter()
            .filter(|w| {
                let f = w["fields"].as_object().unwrap();
                ["DF387", "IDF010"]
                    .iter()
                    .all(|k| f.get(*k).and_then(Value::as_f64) != Some(0.0))
            })
            .collect();
        assert_eq!(groups.len(), want.len(), "{file}: messages");
        for (i, (g, w)) in groups.iter().zip(&want).enumerate() {
            compare(g, w["fields"].as_object().unwrap(), &format!("{file} #{i}"));
            compared += 1;
        }
        // Time: seconds since the first correction, which is at 0.
        let t: Vec<f64> = back
            .iter()
            .filter_map(|r| match r {
                Record::Correction(c) => Some(c.t_s),
                _ => None,
            })
            .collect();
        assert_eq!(t[0], 0.0, "{file}");
    }
    // PIN-SCOPE:    the SSR messages with at least one satellite (or an ionosphere) in the three
    //               committed pyrtcm sample streams.
    // PIN-EXCLUDES: anything computed here; the messages come from pyrtcm's recorded results.
    assert!(compared >= 26, "{compared}");
}

#[test]
fn a_correction_without_a_satellite_is_refused_unless_it_is_the_ionosphere() {
    let station = Station {
        id: "S".into(),
        ..Default::default()
    };
    let made = from_log("rtcm-ssr", STREAMS[2].1, &station).unwrap();
    let mut text = to_jsonl(&made).unwrap();
    assert!(check(&text).is_ok());
    let line = text.lines().nth(1).unwrap().to_string();
    let broken = line.replacen("\"sat\":\"G02\",", "", 1);
    assert_ne!(broken, line);
    text = text.replacen(&line, &broken, 1);
    let e = check(&text).unwrap_err();
    assert!(e.contains("line 2"), "{e}");
}

#[test]
fn the_command_writes_corrections_that_check_and_match_the_schema() {
    use std::process::Command;
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let root = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let dir = std::env::temp_dir().join(format!(
        "kshana-obs-ssr-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let station = dir.join("stream.toml");
    std::fs::write(&station, "id = \"SSRA00CNE1\"\n").unwrap();
    let out = dir.join("ssr.obs.jsonl");
    let run = |args: &[&str]| {
        let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .current_dir(&root)
            .output()
            .unwrap();
        (
            o.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&o.stdout).to_string(),
            String::from_utf8_lossy(&o.stderr).to_string(),
        )
    };
    let (code, _, err) = run(&[
        "obs",
        "convert",
        "tests/fixtures/rtcm_ssr/pygpsdata-NTRIP-4076.log",
        "--format",
        "rtcm-ssr",
        "--station",
        station.to_str().unwrap(),
        "--out",
        out.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{err}");
    let (code, json, err) = run(&["obs", "check", out.to_str().unwrap(), "--json"]);
    assert_eq!(code, 0, "{err}");
    let rep: Value = serde_json::from_str(&json).unwrap();
    assert_eq!(rep["station"], "SSRA00CNE1");
    assert_eq!(rep["epochs"], 0);
    let text = std::fs::read_to_string(&out).unwrap();
    // One record per satellite of each message, one per ionosphere message, and the header.
    let s = kshana::rtcm_ssr::read_stream(STREAMS[2].1);
    let want: usize = s
        .messages
        .iter()
        .map(|m| {
            if m.kind == Kind::Vtec {
                1
            } else {
                m.sats.len()
            }
        })
        .sum();
    assert_eq!(rep["corrections"].as_u64().unwrap() as usize, want);
    assert_eq!(text.lines().count(), want + 1);

    // Every key the engine writes is in the JSON Schema, and every required key is written.
    let schema: Value = serde_json::from_str(
        &std::fs::read_to_string(root.join("docs/spec/obs-1.schema.json")).unwrap(),
    )
    .unwrap();
    let mut kinds_seen = std::collections::BTreeSet::new();
    for line in text.lines() {
        let r: Value = serde_json::from_str(line).unwrap();
        let t = r["type"].as_str().unwrap();
        let def = &schema["$defs"][t];
        for k in def["required"].as_array().unwrap() {
            assert!(r.get(k.as_str().unwrap()).is_some(), "{t} lacks {k}");
        }
        for k in r.as_object().unwrap().keys() {
            assert!(def["properties"].get(k).is_some(), "schema {t} lacks {k}");
        }
        if t == "correction" {
            let kind = r["kind"].clone();
            assert!(def["properties"]["kind"]["enum"]
                .as_array()
                .unwrap()
                .contains(&kind));
            kinds_seen.insert(kind.as_str().unwrap().to_string());
            for (field, sub) in [("orbit", "orbit"), ("clock", "clock")] {
                if let Some(o) = r.get(field) {
                    for k in o.as_object().unwrap().keys() {
                        assert!(def["properties"][sub]["properties"].get(k).is_some());
                    }
                }
            }
        }
    }
    assert_eq!(kinds_seen.len(), 3, "{kinds_seen:?}");
    // A live stream of corrections is not offered: `obs live` names the format as unknown.
    let (code, _, err) = run(&[
        "obs",
        "live",
        "tests/fixtures/rtcm_ssr/pygpsdata-NTRIP-4076.log",
        "--format",
        "rtcm-ssr",
        "--station",
        station.to_str().unwrap(),
    ]);
    assert_ne!(code, 0);
    assert!(err.contains("rtcm-ssr"), "{err}");
    let _ = std::fs::remove_dir_all(&dir);
}
