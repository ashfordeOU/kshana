// SPDX-License-Identifier: AGPL-3.0-only
//! CAP 1.2 alerts from the trust stream: one message per band change, linked by `references`, and
//! (when `xmllint` and the OASIS schema from `scripts/fetch_cap_xsd.sh` are present) valid against the
//! CAP 1.2 schema. With `KSHANA_REQUIRE_REALDATA=1` a missing schema or `xmllint` fails the test.

use kshana::telemetry::cap::{alerts, CapConfig};
use kshana::telemetry::sample::parse_live_line;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn stream() -> Vec<kshana::telemetry::sample::TrustSample> {
    [
        r#"{"t_s":0,"state":"calibrating","score":null}"#,
        r#"{"t_s":10,"state":"nominal","score":97}"#,
        r#"{"t_s":11,"state":"nominal","score":96}"#,
        r#"{"t_s":20,"state":"degraded","score":61,"reasons":["agc_drop","cn0_drop"]}"#,
        r#"{"t_s":21,"state":"degraded","score":58,"reasons":["agc_drop"]}"#,
        r#"{"t_s":30,"state":"untrusted","score":12,"reasons":["position_jump"]}"#,
        r#"{"t_s":50,"state":"nominal","score":95}"#,
    ]
    .iter()
    .map(|l| parse_live_line(l).unwrap())
    .collect()
}

fn cfg() -> CapConfig {
    CapConfig {
        sender: "kshana@station.example".into(),
        status: "Exercise".into(),
        scope: "Restricted".into(),
        area_desc: "Example port & approaches".into(),
        station: Some((59.44, 24.75)),
        radius_km: 25.0,
        t0_unix_s: 1_735_689_600,
    }
}

#[test]
fn one_message_per_band_change_linked_by_references() {
    let a = alerts(&stream(), &cfg()).unwrap();
    assert_eq!(a.len(), 3);
    assert!(
        a[0].contains("<msgType>Alert</msgType>") && a[0].contains("<urgency>Expected</urgency>")
    );
    assert!(!a[0].contains("<references>"));
    assert!(a[0].contains("<sent>2025-01-01T00:00:20+00:00</sent>"));
    assert!(a[0].contains("agc_drop, cn0_drop"));
    assert!(a[0].contains("Example port &amp; approaches"));
    assert!(a[0].contains("<circle>59.440000,24.750000 25.000</circle>"));
    assert!(
        a[1].contains("<msgType>Update</msgType>") && a[1].contains("<severity>Severe</severity>")
    );
    assert!(a[1].contains("<references>kshana@station.example,kshana-1735689620-1,2025-01-01T00:00:20+00:00</references>"));
    assert!(a[2].contains("<urgency>Past</urgency>") && a[2].contains("<value>nominal</value>"));
    for m in &a {
        assert!(m.contains("<status>Exercise</status>") && m.contains("Advisory software"));
    }
}

#[test]
fn invalid_settings_are_refused() {
    let mut c = cfg();
    c.status = "Real".into();
    assert!(alerts(&stream(), &c).is_err());
    let mut c = cfg();
    c.station = None;
    assert!(alerts(&stream(), &c).is_err());
    let mut c = cfg();
    c.sender = "two words".into();
    assert!(alerts(&stream(), &c).is_err());
}

#[test]
fn every_message_is_valid_against_the_oasis_cap_1_2_schema() {
    let xsd = std::env::var("KSHANA_CAP_XSD")
        .unwrap_or_else(|_| "realdata-cache/cap/CAP-v1.2.xsd".into());
    let have_xmllint = std::process::Command::new("xmllint")
        .arg("--version")
        .output()
        .is_ok();
    if !std::path::Path::new(&xsd).exists() || !have_xmllint {
        if std::env::var("KSHANA_REQUIRE_REALDATA").as_deref() == Ok("1") {
            panic!("KSHANA_REQUIRE_REALDATA=1 but {xsd} or xmllint is missing (scripts/fetch_cap_xsd.sh)");
        }
        eprintln!("skip: {xsd} or xmllint not present");
        return;
    }
    for (k, m) in alerts(&stream(), &cfg()).unwrap().iter().enumerate() {
        let p = std::env::temp_dir().join(format!(
            "kshana-cap-{}-{}-{k}.xml",
            std::process::id(),
            SEQ.fetch_add(1, Ordering::Relaxed)
        ));
        std::fs::write(&p, m).unwrap();
        let o = std::process::Command::new("xmllint")
            .args(["--noout", "--schema", &xsd])
            .arg(&p)
            .output()
            .unwrap();
        let _ = std::fs::remove_file(&p);
        assert!(
            o.status.success(),
            "message {k}: {}",
            String::from_utf8_lossy(&o.stderr)
        );
    }
}
