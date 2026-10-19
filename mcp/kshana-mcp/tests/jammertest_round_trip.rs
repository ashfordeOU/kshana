// SPDX-License-Identifier: AGPL-3.0-only
//! MCP round trip for `jammertest_import` and `jammertest_score`, on a synthetic NMEA log and a
//! two-test plan written inline (no network, no file access by the server).

use kshana_mcp::server::KshanaServer;
use rmcp::ServiceExt;
use rmcp::model::CallToolRequestParams;
use serde_json::{Value, json};

type Client = rmcp::service::RunningService<rmcp::RoleClient, ()>;

async fn connect() -> Client {
    let (server_t, client_t) = tokio::io::duplex(64 * 1024);
    tokio::spawn(async move {
        let svc = KshanaServer::new()
            .serve(server_t)
            .await
            .expect("server serve");
        let _ = svc.waiting().await;
    });
    ().serve(client_t).await.expect("client connect")
}

async fn call(client: &Client, name: &'static str, args: Value) -> Result<Value, String> {
    let params = CallToolRequestParams::new(name).with_arguments(args.as_object().unwrap().clone());
    match client.call_tool(params).await {
        Err(e) => Err(e.to_string()),
        Ok(r) if r.is_error == Some(true) => Err(format!("{:?}", r.content)),
        Ok(r) => Ok(serde_json::from_str(
            &r.content
                .iter()
                .filter_map(|c| c.as_text().map(|t| t.text.clone()))
                .collect::<String>(),
        )
        .unwrap()),
    }
}

fn s(body: &str) -> String {
    format!("${body}*{:02X}\r\n", body.bytes().fold(0, |a, b| a ^ b))
}

fn log(secs: u32, jam: (u32, u32)) -> String {
    let mut o = String::new();
    for t in 0..secs {
        let tod = format!("{:02}{:02}{:02}.00", 12 + t / 3600, t / 60 % 60, t % 60);
        o += &s(&format!(
            "GPRMC,{tod},A,6900.0000,N,01600.0000,E,0.0,0.0,150925,,,A"
        ));
        o += &s(&format!(
            "GPGGA,{tod},6900.0000,N,01600.0000,E,1,08,1.0,10.0,M,0.0,M,,"
        ));
        for set in 0..2u32 {
            let mut body = format!("GPGSV,2,{},08", set + 1);
            for k in 0..4u32 {
                let sv = set * 4 + k + 1;
                let drop = if t >= jam.0 && t <= jam.1 { 20.0 } else { 0.0 };
                body += &format!(
                    ",{sv:02},{:02},{:03},{:02.0}",
                    30 + sv * 5,
                    sv * 40,
                    45.0 - f64::from(sv % 3) - drop
                );
            }
            o += &s(&body);
        }
    }
    o
}

const CATALOG: &str = r#"{"test_types":[{"type":"Jamming","type_id":1,"test_groups":[
  {"group_id":2,"group_name":"CW","tests":[{"test_id":5,"name":"CW jammer"}]}]}]}"#;
const PLAN: &str = r#"{"locations":[{"location_id":1,"location_name":"Test Area 1","tests":[
  {"start_time":"2025-09-15T14:05:00","end_time":"2025-09-15T14:06:00","test_id":"1.2.5","test_contact":"A Person (X)","power_w":0,"status":""}]}]}"#;

#[tokio::test]
async fn the_tools_are_listed_with_the_scheduled_truth_caveat() {
    let client = connect().await;
    let tools = client.list_all_tools().await.expect("list tools");
    for n in ["jammertest_import", "jammertest_score"] {
        let d = tools
            .iter()
            .find(|t| t.name == n)
            .unwrap_or_else(|| panic!("{n} not served"))
            .description
            .clone()
            .unwrap_or_default()
            .to_string();
        assert!(
            d.contains("MODELLED") && d.contains("not recorded on-air times")
                || d.contains("planned slots, not recorded"),
            "{n}: {d}"
        );
    }
    client.cancel().await.ok();
}

#[tokio::test]
async fn a_plan_is_imported_and_a_log_scored_in_memory() {
    let client = connect().await;
    let v = call(
        &client,
        "jammertest_import",
        json!({"catalog_json": CATALOG, "plans": [PLAN], "log_start_utc": "2025-09-15T12:00:00Z"}),
    )
    .await
    .expect("import");
    assert_eq!(v["events"][0]["test_id"], "1.2.5");
    assert_eq!(v["events"][0]["onset_s"], 300.0);
    assert!(
        v["events_toml"]
            .as_str()
            .unwrap()
            .contains("scheduled truth")
    );
    assert!(
        !v.to_string().contains("Person"),
        "no personal field is read"
    );

    let nmea = log(700, (300, 360));
    let v = call(
        &client,
        "jammertest_score",
        json!({"session_toml": "[log]\nformat = \"nmea\"\n", "log": nmea,
               "catalog_json": CATALOG, "plans": [PLAN], "local_offset_h": 2.0}),
    )
    .await
    .expect("score");
    assert_eq!(v["tests"][0]["outcome"], "detected");
    assert_eq!(v["summary"]["detected"], 1);
    assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));
    assert!(v["notice"].as_str().unwrap().contains("Advisory only"));

    // A `path` source in the session is refused, and a missing log is an error.
    let e = call(
        &client,
        "jammertest_score",
        json!({"session_toml": "[log]\nformat = \"nmea\"\npath = \"/etc/passwd\"\n", "log": nmea,
               "catalog_json": CATALOG, "plans": [PLAN]}),
    )
    .await
    .unwrap_err();
    assert!(e.contains("path"), "{e}");
    assert!(call(&client, "jammertest_score", json!({"session_toml": "[log]\nformat = \"nmea\"\n", "catalog_json": CATALOG, "plans": [PLAN]})).await.is_err());
    client.cancel().await.ok();
}
