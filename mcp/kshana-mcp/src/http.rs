// SPDX-License-Identifier: AGPL-3.0-only
//! Streamable-HTTP transport for `kshana-mcp --http <addr>`.
//!
//! Kshana does not host an endpoint: this is for people who run the server themselves
//! (a laptop, a container, their own cloud project). The defaults are the safe ones.
//!
//! * **Loopback by default.** The address must be a loopback address unless
//!   `--allow-remote` is passed, which prints a warning, and a non-loopback bind also
//!   refuses to start without a bearer token in [`TOKEN_ENV`].
//! * **No filesystem.** The HTTP server is built with the IQ file tools switched off
//!   ([`IqConfig::disabled`]); every other tool takes its scenario inline and refuses a
//!   scenario that names a file, so no tool argument reads or writes a path.
//! * **Limits.** A request body cap ([`DEFAULT_MAX_BODY_BYTES`], `413` over it, declared or
//!   chunked), a time limit on the *reply* ([`DEFAULT_REQUEST_TIMEOUT_SECS`], `408`) and a cap on
//!   concurrent work ([`DEFAULT_MAX_CONCURRENT`]): requests beyond it are shed with `503`.
//!   The timeout bounds how long a caller waits; it cannot stop a run already under way. What
//!   bounds the *work* is the pool and the budget: every tool call runs on a blocking thread
//!   inside a pool of `max_concurrent` slots, and a slot is freed only when the run itself ends
//!   (so calls the caller abandoned cannot accumulate), and [`crate::budget`] refuses a scenario
//!   that asks for far more than the bundled examples (Monte Carlo runs, grid nodes, epochs).
//! * **No CORS.** No `Access-Control-*` header is ever sent, and a request that carries an
//!   `Origin` header is refused unless the origin was named with `--allow-origin`, so a
//!   web page cannot drive a local server.
//! * **Host check.** `Host` is validated (DNS-rebinding defence): loopback names only, or
//!   the bind address plus each `--allowed-host`.
//! * **Stateless.** Every POST is answered with a JSON body; there are no sessions and
//!   no server-sent-event streams to hold open.

use std::net::{IpAddr, SocketAddr};
use std::time::Duration;

use anyhow::{Context, Result, bail};
use axum::Router;
use axum::extract::Request;
use axum::http::{HeaderMap, StatusCode, header};
use axum::middleware::{self, Next};
use axum::response::IntoResponse;
use rmcp::transport::streamable_http_server::session::never::NeverSessionManager;
use rmcp::transport::streamable_http_server::{StreamableHttpServerConfig, StreamableHttpService};
use std::sync::Arc;
use subtle::ConstantTimeEq;
use tokio::sync::Semaphore;
use tower_http::timeout::TimeoutLayer;

use crate::iq::IqConfig;
use crate::server::KshanaServer;

/// Environment variable holding the bearer token.
pub const TOKEN_ENV: &str = "KSHANA_MCP_HTTP_TOKEN";
/// Default request body cap: a little above the 4 MiB scenario cap.
pub const DEFAULT_MAX_BODY_BYTES: usize = 5 * 1024 * 1024;
/// Default per-request time limit.
pub const DEFAULT_REQUEST_TIMEOUT_SECS: u64 = 120;
/// Default number of requests served at once.
pub const DEFAULT_MAX_CONCURRENT: usize = 8;
/// The path the MCP endpoint is served on.
pub const MCP_PATH: &str = "/mcp";

/// Everything `--http` accepts.
#[derive(Clone, Debug)]
pub struct HttpConfig {
    pub addr: SocketAddr,
    /// Permit a non-loopback `addr`.
    pub allow_remote: bool,
    /// Bearer token; required when `addr` is not loopback.
    pub token: Option<String>,
    /// Extra `Host` names accepted (`host` or `host:port`).
    pub allowed_hosts: Vec<String>,
    /// Browser origins accepted (`scheme://host[:port]`); none by default.
    pub allowed_origins: Vec<String>,
    pub max_body_bytes: usize,
    pub request_timeout: Duration,
    pub max_concurrent: usize,
}

impl HttpConfig {
    pub fn new(addr: SocketAddr) -> Self {
        Self {
            addr,
            allow_remote: false,
            token: None,
            allowed_hosts: Vec::new(),
            allowed_origins: Vec::new(),
            max_body_bytes: DEFAULT_MAX_BODY_BYTES,
            request_timeout: Duration::from_secs(DEFAULT_REQUEST_TIMEOUT_SECS),
            max_concurrent: DEFAULT_MAX_CONCURRENT,
        }
    }

    /// Refuse an unsafe combination before anything is bound.
    pub fn validate(&self) -> Result<()> {
        let loopback = self.addr.ip().is_loopback();
        if !loopback && !self.allow_remote {
            bail!(
                "refusing to bind {}: it is not a loopback address. Use 127.0.0.1:<port>, or \
                 pass --allow-remote (and set {TOKEN_ENV}) to listen beyond this machine",
                self.addr
            );
        }
        if !loopback && self.token.as_deref().is_none_or(str::is_empty) {
            bail!(
                "refusing to bind {}: a non-loopback address needs a bearer token in the \
                 {TOKEN_ENV} environment variable",
                self.addr
            );
        }
        if self.token.as_deref().is_some_and(|t| t.len() < 16) {
            bail!("{TOKEN_ENV} is shorter than 16 characters; use a long random token");
        }
        if self.max_body_bytes == 0 || self.max_concurrent == 0 || self.request_timeout.is_zero() {
            bail!(
                "--max-body-bytes, --max-concurrent and --request-timeout-secs must be above zero"
            );
        }
        if self.allowed_origins.iter().any(|o| o.trim() == "*") {
            bail!("--allow-origin does not accept `*`; name each origin");
        }
        Ok(())
    }

    /// The `Host` values accepted: loopback names for a loopback bind, otherwise the bind
    /// address, plus every `--allowed-host`.
    fn hosts(&self) -> Vec<String> {
        let mut hosts: Vec<String> = if self.addr.ip().is_loopback() {
            ["localhost", "127.0.0.1", "::1", "[::1]"]
                .iter()
                .map(|s| s.to_string())
                .collect()
        } else {
            vec![self.addr.ip().to_string(), self.addr.to_string()]
        };
        hosts.extend(self.allowed_hosts.iter().cloned());
        hosts
    }
}

/// Parse a bind address, accepting `host:port` and a bare `:port` / `port` (loopback).
pub fn parse_addr(s: &str) -> Result<SocketAddr> {
    let s = s.trim();
    let s = s.strip_prefix(':').unwrap_or(s);
    if let Ok(port) = s.parse::<u16>() {
        return Ok(SocketAddr::new(IpAddr::from([127, 0, 0, 1]), port));
    }
    s.parse::<SocketAddr>()
        .with_context(|| format!("`{s}` is not an address like 127.0.0.1:8080"))
}

/// The server the HTTP transport serves: IQ file tools off, whatever the environment says.
pub fn http_server(max_concurrent: usize) -> KshanaServer {
    KshanaServer::with_iq_config(IqConfig::disabled(
        "the HTTP transport serves no tool that reads or writes a file path; run the stdio \
         server to use the IQ file tools",
    ))
    .with_work_pool(max_concurrent, true)
}

/// Compare the SHA-256 digests of two secrets in constant time. Hashing first makes both
/// sides the same length, so neither the content nor the length of the token leaks through
/// timing; `subtle` does the comparison without an early exit.
fn ct_eq(a: &[u8], b: &[u8]) -> bool {
    let da = kshana::advanced_report::sha256_hex(a);
    let db = kshana::advanced_report::sha256_hex(b);
    da.as_bytes().ct_eq(db.as_bytes()).into()
}

fn authorised(headers: &HeaderMap, token: &str) -> bool {
    headers
        .get(header::AUTHORIZATION)
        .and_then(|v| v.to_str().ok())
        .and_then(|v| v.strip_prefix("Bearer "))
        .is_some_and(|presented| ct_eq(presented.as_bytes(), token.as_bytes()))
}

/// Add the guards to `router`, outermost first: the reply time limit (it covers everything
/// below, so a request that has been admitted cannot wait forever), the concurrency gate (a
/// full server answers `503` at once instead of queueing), the `Origin` and bearer checks, and
/// the body cap. The body is read here, up to the cap, so a chunked body over it gets `413`
/// the same as one that declares its length.
pub fn harden(router: Router, cfg: &HttpConfig) -> Router {
    let token = cfg.token.clone();
    let origins = cfg.allowed_origins.clone();
    let max_body = cfg.max_body_bytes;
    let gate = Arc::new(Semaphore::new(cfg.max_concurrent));
    let guard = move |req: Request, next: Next| {
        let token = token.clone();
        let origins = origins.clone();
        let gate = gate.clone();
        async move {
            if let Some(origin) = req.headers().get(header::ORIGIN) {
                let ok = origin
                    .to_str()
                    .is_ok_and(|o| origins.iter().any(|a| a == o));
                if !ok {
                    return (StatusCode::FORBIDDEN, "origin not allowed").into_response();
                }
            }
            if let Some(token) = token.as_deref().filter(|t| !t.is_empty())
                && !authorised(req.headers(), token)
            {
                let mut r = (StatusCode::UNAUTHORIZED, "bearer token required").into_response();
                r.headers_mut().insert(
                    header::WWW_AUTHENTICATE,
                    header::HeaderValue::from_static("Bearer"),
                );
                return r;
            }
            // A body whose length is declared over the cap is refused before it can take a slot
            // of the concurrency gate. (A chunked body declares nothing; it is read, up to the
            // cap, below and gets the same 413.)
            let declared = req
                .headers()
                .get(header::CONTENT_LENGTH)
                .and_then(|v| v.to_str().ok())
                .and_then(|v| v.parse::<usize>().ok())
                .or_else(|| {
                    axum::body::HttpBody::size_hint(req.body())
                        .exact()
                        .map(|n| n as usize)
                });
            if declared.is_some_and(|n| n > max_body) {
                return (StatusCode::PAYLOAD_TOO_LARGE, "request body too large").into_response();
            }
            let Ok(_slot) = gate.try_acquire_owned() else {
                let mut r = (
                    StatusCode::SERVICE_UNAVAILABLE,
                    "server busy; retry shortly",
                )
                    .into_response();
                r.headers_mut()
                    .insert(header::RETRY_AFTER, header::HeaderValue::from_static("1"));
                return r;
            };
            let (parts, body) = req.into_parts();
            let Ok(bytes) = axum::body::to_bytes(body, max_body).await else {
                return (StatusCode::PAYLOAD_TOO_LARGE, "request body too large").into_response();
            };
            next.run(Request::from_parts(parts, axum::body::Body::from(bytes)))
                .await
        }
    };
    router
        .layer(middleware::from_fn(guard))
        .layer(TimeoutLayer::with_status_code(
            StatusCode::REQUEST_TIMEOUT,
            cfg.request_timeout,
        ))
}

/// The complete application: the MCP service on [`MCP_PATH`], hardened.
pub fn app(cfg: &HttpConfig) -> Router {
    let mut mcp = StreamableHttpServerConfig::default()
        .with_allowed_hosts(cfg.hosts())
        .with_allowed_origins(Vec::<String>::new());
    mcp.stateful_mode = false;
    mcp.json_response = true;
    mcp.sse_keep_alive = None;
    let service = StreamableHttpService::new(
        {
            // One server value, cloned per request: the clones share the one work pool, which
            // is what bounds the running work across requests (a fresh server per request
            // would each bring a fresh, empty pool).
            let shared = http_server(cfg.max_concurrent);
            move || Ok(shared.clone())
        },
        std::sync::Arc::new(NeverSessionManager::default()),
        mcp,
    );
    harden(Router::new().nest_service(MCP_PATH, service), cfg)
}

/// Validate, bind and serve until Ctrl-C.
pub async fn serve(cfg: HttpConfig) -> Result<()> {
    cfg.validate()?;
    if !cfg.addr.ip().is_loopback() {
        eprintln!(
            "WARNING: kshana-mcp is listening on {} beyond this machine. Anyone who can reach \
             it and holds the bearer token can run simulations on your hardware. Put TLS in \
             front of it (a reverse proxy or your platform's HTTPS) and keep the token secret.",
            cfg.addr
        );
    }
    let listener = tokio::net::TcpListener::bind(cfg.addr)
        .await
        .with_context(|| format!("binding {}", cfg.addr))?;
    tracing::info!(
        "kshana-mcp serving streamable HTTP on http://{}{MCP_PATH} (IQ file tools disabled)",
        listener.local_addr()?
    );
    axum::serve(listener, app(&cfg))
        .with_graceful_shutdown(async {
            let _ = tokio::signal::ctrl_c().await;
        })
        .await?;
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    use axum::body::Body;
    use axum::http::Method;
    use tower::ServiceExt;

    fn cfg() -> HttpConfig {
        HttpConfig::new("127.0.0.1:8080".parse().unwrap())
    }

    fn rpc(body: &str) -> Request {
        Request::builder()
            .method(Method::POST)
            .uri(MCP_PATH)
            .header(header::HOST, "127.0.0.1:8080")
            .header(header::CONTENT_TYPE, "application/json")
            .header(header::ACCEPT, "application/json, text/event-stream")
            .body(Body::from(body.to_string()))
            .unwrap()
    }

    const INIT: &str = r#"{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"t","version":"0"}}}"#;

    #[test]
    fn default_bind_is_loopback_and_valid() {
        assert!(cfg().validate().is_ok());
        assert_eq!(parse_addr("8080").unwrap().to_string(), "127.0.0.1:8080");
        assert_eq!(parse_addr(":9").unwrap().to_string(), "127.0.0.1:9");
        assert!(parse_addr("nonsense").is_err());
    }

    #[test]
    fn non_loopback_needs_the_flag_and_a_token() {
        let mut c = HttpConfig::new("0.0.0.0:8080".parse().unwrap());
        assert!(
            c.validate()
                .unwrap_err()
                .to_string()
                .contains("--allow-remote")
        );
        c.allow_remote = true;
        assert!(c.validate().unwrap_err().to_string().contains(TOKEN_ENV));
        c.token = Some("short".into());
        assert!(
            c.validate()
                .unwrap_err()
                .to_string()
                .contains("16 characters")
        );
        c.token = Some("a-long-random-token-0123456789".into());
        assert!(c.validate().is_ok());
    }

    #[test]
    fn a_wildcard_origin_and_zero_limits_are_refused() {
        let mut c = cfg();
        c.allowed_origins = vec!["*".into()];
        assert!(c.validate().is_err());
        let mut c = cfg();
        c.max_body_bytes = 0;
        assert!(c.validate().is_err());
    }

    #[test]
    fn digest_compare_matches_equality_whatever_the_lengths() {
        assert!(ct_eq(b"abc", b"abc"));
        assert!(!ct_eq(b"abc", b"abd"));
        assert!(!ct_eq(b"abc", b"abcd"));
        assert!(!ct_eq(b"", b"a"));
        assert!(ct_eq(b"", b""));
    }

    #[tokio::test]
    async fn the_server_answers_initialize_over_http() {
        let resp = app(&cfg()).oneshot(rpc(INIT)).await.unwrap();
        assert_eq!(resp.status(), StatusCode::OK);
        let body = axum::body::to_bytes(resp.into_body(), 1 << 20)
            .await
            .unwrap();
        let text = String::from_utf8_lossy(&body);
        assert!(text.contains("kshana-mcp"), "{text}");
    }

    #[tokio::test]
    async fn the_http_server_has_the_iq_file_tools_off() {
        // iq_info names a file in the IQ work directory; over HTTP it must refuse and say why.
        let call = r#"{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"iq_info","arguments":{"recording":"anything.sigmf-meta"}}}"#;
        let resp = app(&cfg()).oneshot(rpc(call)).await.unwrap();
        assert_eq!(resp.status(), StatusCode::OK);
        let body = axum::body::to_bytes(resp.into_body(), 1 << 20)
            .await
            .unwrap();
        let v: serde_json::Value = serde_json::from_slice(&body).unwrap();
        let text = v.to_string();
        assert!(
            v.get("error").is_some() || v["result"]["isError"] == true,
            "iq_info must refuse over HTTP: {text}"
        );
        assert!(text.contains("HTTP transport"), "{text}");
        assert!(
            !text.contains("anything.sigmf-meta"),
            "no path echoed: {text}"
        );
        let dbg = format!("{:?}", http_server(2).iq_config_for_test());
        assert!(dbg.contains("HTTP transport"), "{dbg}");
    }

    #[tokio::test]
    async fn bearer_token_is_enforced() {
        let mut c = cfg();
        c.token = Some("a-long-random-token-0123456789".into());
        let r = app(&c).oneshot(rpc(INIT)).await.unwrap();
        assert_eq!(r.status(), StatusCode::UNAUTHORIZED);
        let mut bad = rpc(INIT);
        bad.headers_mut()
            .insert(header::AUTHORIZATION, "Bearer wrong".parse().unwrap());
        assert_eq!(
            app(&c).oneshot(bad).await.unwrap().status(),
            StatusCode::UNAUTHORIZED
        );
        let mut good = rpc(INIT);
        good.headers_mut().insert(
            header::AUTHORIZATION,
            "Bearer a-long-random-token-0123456789".parse().unwrap(),
        );
        assert_eq!(
            app(&c).oneshot(good).await.unwrap().status(),
            StatusCode::OK
        );
    }

    #[tokio::test]
    async fn an_oversize_body_is_refused() {
        let mut c = cfg();
        c.max_body_bytes = 256;
        let big = format!(r#"{{"pad":"{}"}}"#, "x".repeat(1024));
        let r = app(&c).oneshot(rpc(&big)).await.unwrap();
        assert_eq!(r.status(), StatusCode::PAYLOAD_TOO_LARGE);
    }

    #[tokio::test]
    async fn a_slow_request_times_out() {
        let mut c = cfg();
        c.request_timeout = Duration::from_millis(50);
        let slow = Router::new().route(
            "/slow",
            axum::routing::get(|| async {
                tokio::time::sleep(Duration::from_secs(5)).await;
                "late"
            }),
        );
        let r = harden(slow, &c)
            .oneshot(Request::get("/slow").body(Body::empty()).unwrap())
            .await
            .unwrap();
        assert_eq!(r.status(), StatusCode::REQUEST_TIMEOUT);
    }

    #[tokio::test]
    async fn a_foreign_origin_is_refused_and_no_cors_header_is_sent() {
        let mut req = rpc(INIT);
        req.headers_mut()
            .insert(header::ORIGIN, "https://evil.example".parse().unwrap());
        let r = app(&cfg()).oneshot(req).await.unwrap();
        assert_eq!(r.status(), StatusCode::FORBIDDEN);
        assert!(
            r.headers()
                .get(header::ACCESS_CONTROL_ALLOW_ORIGIN)
                .is_none()
        );

        let mut c = cfg();
        c.allowed_origins = vec!["https://ok.example".into()];
        let mut req = rpc(INIT);
        req.headers_mut()
            .insert(header::ORIGIN, "https://ok.example".parse().unwrap());
        let r = app(&c).oneshot(req).await.unwrap();
        assert_eq!(r.status(), StatusCode::OK);
        assert!(
            r.headers()
                .get(header::ACCESS_CONTROL_ALLOW_ORIGIN)
                .is_none()
        );

        let pre = Request::builder()
            .method(Method::OPTIONS)
            .uri(MCP_PATH)
            .header(header::HOST, "127.0.0.1:8080")
            .body(Body::empty())
            .unwrap();
        let r = app(&cfg()).oneshot(pre).await.unwrap();
        assert!(
            r.headers()
                .get(header::ACCESS_CONTROL_ALLOW_ORIGIN)
                .is_none()
        );
    }

    #[tokio::test]
    async fn an_unexpected_host_is_refused() {
        let mut req = rpc(INIT);
        req.headers_mut()
            .insert(header::HOST, "attacker.example".parse().unwrap());
        let r = app(&cfg()).oneshot(req).await.unwrap();
        assert_eq!(r.status(), StatusCode::FORBIDDEN);
    }

    #[tokio::test]
    async fn a_chunked_body_over_the_cap_is_413_too() {
        let mut c = cfg();
        c.max_body_bytes = 256;
        let chunks: Vec<Result<axum::body::Bytes, std::io::Error>> = (0..8)
            .map(|_| Ok(axum::body::Bytes::from(vec![b'x'; 128])))
            .collect();
        let req = Request::builder()
            .method(Method::POST)
            .uri(MCP_PATH)
            .header(header::HOST, "127.0.0.1:8080")
            .header(header::CONTENT_TYPE, "application/json")
            .header(header::ACCEPT, "application/json, text/event-stream")
            .body(Body::from_stream(futures_stream(chunks)))
            .unwrap();
        let r = app(&c).oneshot(req).await.unwrap();
        assert_eq!(r.status(), StatusCode::PAYLOAD_TOO_LARGE);
    }

    fn futures_stream(
        items: Vec<Result<axum::body::Bytes, std::io::Error>>,
    ) -> impl futures_util::Stream<Item = Result<axum::body::Bytes, std::io::Error>> {
        futures_util::stream::iter(items)
    }

    #[tokio::test]
    async fn a_full_server_sheds_load_with_503() {
        let mut c = cfg();
        c.max_concurrent = 1;
        let slow = Router::new().route(
            "/slow",
            axum::routing::get(|| async {
                tokio::time::sleep(Duration::from_millis(400)).await;
                "ok"
            }),
        );
        let app = harden(slow, &c);
        let get = || Request::get("/slow").body(Body::empty()).unwrap();
        let (a, b) = tokio::join!(app.clone().oneshot(get()), app.clone().oneshot(get()));
        let mut codes = [a.unwrap().status(), b.unwrap().status()];
        codes.sort();
        assert_eq!(codes, [StatusCode::OK, StatusCode::SERVICE_UNAVAILABLE]);
    }

    #[tokio::test]
    async fn a_declared_oversize_body_is_413_and_never_takes_a_gate_slot() {
        let mut c = cfg();
        c.max_concurrent = 1;
        c.max_body_bytes = 64;
        let slow = Router::new().route(
            "/slow",
            axum::routing::post(|| async {
                tokio::time::sleep(Duration::from_millis(400)).await;
                "ok"
            }),
        );
        let app = harden(slow, &c);
        let post = |len: usize| {
            Request::builder()
                .method(Method::POST)
                .uri("/slow")
                .header(header::CONTENT_LENGTH, len.to_string())
                .body(Body::from(vec![b'x'; len.min(8)]))
                .unwrap()
        };
        // One small request holds the only slot; meanwhile an oversize declared body must be
        // refused with 413 (not 503: it never asks for a slot).
        let holder = tokio::spawn({
            let a = app.clone();
            async move { a.oneshot(post(8)).await.unwrap().status() }
        });
        tokio::time::sleep(Duration::from_millis(100)).await;
        let big = app.clone().oneshot(post(1_000_000)).await.unwrap();
        assert_eq!(big.status(), StatusCode::PAYLOAD_TOO_LARGE);
        assert_eq!(holder.await.unwrap(), StatusCode::OK);
    }
}
