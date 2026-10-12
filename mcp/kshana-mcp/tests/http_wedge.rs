// SPDX-License-Identifier: AGPL-3.0-only
//! The availability regression: abandoned heavy calls must not wedge the HTTP server.
//!
//! Before the work pool, a tool call ran on an async worker and kept running after the HTTP
//! timeout answered `408`, while its concurrency slot was released. A handful of heavy calls
//! with a short timeout therefore stacked CPU-bound work on every worker and the server
//! stopped answering anything. Now each call runs on a blocking thread inside a pool whose
//! slot is held until the run ends.

use axum::body::Body;
use axum::http::{Method, Request, StatusCode, header};
use kshana_mcp::http::{HttpConfig, MCP_PATH, app};
use std::time::{Duration, Instant};
use tower::ServiceExt;

fn rpc(body: String) -> Request<Body> {
    Request::builder()
        .method(Method::POST)
        .uri(MCP_PATH)
        .header(header::HOST, "127.0.0.1:8080")
        .header(header::CONTENT_TYPE, "application/json")
        .header(header::ACCEPT, "application/json, text/event-stream")
        .body(Body::from(body))
        .unwrap()
}

fn call(name: &str, args: serde_json::Value) -> String {
    serde_json::json!({"jsonrpc":"2.0","id":7,"method":"tools/call",
        "params":{"name":name,"arguments":args}})
    .to_string()
}

/// A scenario inside the work budget that still takes a good while: the bundled Monte Carlo
/// clock ensemble over a day, with the most realisations the budget allows.
fn heavy() -> String {
    let t = std::fs::read_to_string(
        std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("../../scenarios/campaign-monte-carlo-clock-holdover.toml"),
    )
    .unwrap();
    t.replace("runs = 200", "runs = 400")
        .replace("duration_s = 3600.0", "duration_s = 7200.0")
}

async fn text(resp: axum::http::Response<Body>) -> String {
    let b = axum::body::to_bytes(resp.into_body(), 1 << 24)
        .await
        .unwrap();
    String::from_utf8_lossy(&b).to_string()
}

#[tokio::test(flavor = "multi_thread", worker_threads = 2)]
async fn abandoned_heavy_calls_do_not_wedge_the_server() {
    let mut cfg = HttpConfig::new("127.0.0.1:8080".parse().unwrap());
    cfg.max_concurrent = 2;
    cfg.request_timeout = Duration::from_millis(300);
    let app = app(&cfg);

    // Four heavy calls at once. Two are admitted and abandoned by the timeout (408) with their
    // work still running; two are shed (503).
    let started = Instant::now();
    let heavy_calls: Vec<_> = (0..4)
        .map(|_| {
            let a = app.clone();
            let body = call("run_scenario", serde_json::json!({ "toml": heavy() }));
            tokio::spawn(async move { a.oneshot(rpc(body)).await.unwrap().status() })
        })
        .collect();
    let mut codes = Vec::new();
    for h in heavy_calls {
        codes.push(h.await.unwrap());
    }
    codes.sort();
    assert_eq!(
        codes,
        [
            StatusCode::REQUEST_TIMEOUT,
            StatusCode::REQUEST_TIMEOUT,
            StatusCode::SERVICE_UNAVAILABLE,
            StatusCode::SERVICE_UNAVAILABLE
        ],
        "{codes:?}"
    );
    assert!(
        started.elapsed() < Duration::from_secs(3),
        "the replies were not prompt"
    );

    // The server is still responsive with the abandoned work running: a cheap call comes back
    // at once (the work pool is full, so it is refused as busy rather than queued behind it).
    let t = Instant::now();
    let resp = app
        .clone()
        .oneshot(rpc(call("list_scenario_kinds", serde_json::json!({}))))
        .await
        .unwrap();
    assert!(
        t.elapsed() < Duration::from_secs(2),
        "answering took {:?}",
        t.elapsed()
    );
    assert_eq!(resp.status(), StatusCode::OK);
    let body = text(resp).await;
    assert!(
        body.contains("concurrent-work limit"),
        "a cheap call while the pool is full is shed as busy, not queued: {body}"
    );

    // Once the abandoned runs finish, their slots return and the server serves again.
    let deadline = Instant::now() + Duration::from_secs(240);
    loop {
        let r = app
            .clone()
            .oneshot(rpc(call("list_scenario_kinds", serde_json::json!({}))))
            .await
            .unwrap();
        let body = text(r).await;
        if !body.contains("concurrent-work limit") {
            assert!(body.contains("clock"), "{body}");
            break;
        }
        assert!(Instant::now() < deadline, "slots were never released");
        tokio::time::sleep(Duration::from_millis(500)).await;
    }
}

#[tokio::test]
async fn a_scenario_beyond_the_work_budget_is_refused_before_it_runs() {
    let mut cfg = HttpConfig::new("127.0.0.1:8080".parse().unwrap());
    cfg.max_concurrent = 2;
    let t = std::fs::read_to_string(
        std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("../../scenarios/campaign-monte-carlo-clock-holdover.toml"),
    )
    .unwrap()
    .replace("runs = 200", "runs = 20000");
    let started = Instant::now();
    let resp = app(&cfg)
        .oneshot(rpc(call("run_scenario", serde_json::json!({ "toml": t }))))
        .await
        .unwrap();
    let body = text(resp).await;
    assert!(body.contains("work budget exceeded"), "{body}");
    assert!(started.elapsed() < Duration::from_secs(2));
}
