// SPDX-License-Identifier: AGPL-3.0-only
//! The OpenAPI 3.1 description of the open HTTP endpoints (`docs/api/openapi.json`, roadmap 0.42
//! I11) stays in step with the code that serves them:
//!
//! * the paths and methods are exactly the routes the three servers match on: the Station status
//!   port (`src/station.rs`), the trust-telemetry endpoint (`src/telemetry/prometheus.rs`) and the
//!   MCP server's streamable HTTP (`mcp/kshana-mcp/src/http.rs`);
//! * the Station status schema lists exactly the keys `status_doc` writes, at the top level, per
//!   source and in the fleet block, and its `schema` constant is the code's;
//! * the document is structurally sound: OpenAPI 3.1.0, every `$ref` resolves, every operation has
//!   an `operationId` (unique), a summary and responses, and the version is the crate's.
//!
//! CI also lints the file with Redocly's OpenAPI linter (the `api-description` job).

use serde_json::Value;
use std::collections::BTreeSet;
use std::path::Path;

fn read(p: &str) -> String {
    std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join(p))
        .unwrap_or_else(|e| panic!("{p}: {e}"))
}

fn doc() -> Value {
    serde_json::from_str(&read("docs/api/openapi.json")).expect("docs/api/openapi.json is JSON")
}

/// Every `"…"` string literal in `s` that starts with `prefix`, prefix removed.
fn quoted_after(s: &str, prefix: &str) -> Vec<String> {
    s.match_indices(prefix)
        .filter_map(|(i, _)| {
            let rest = &s[i + prefix.len()..];
            Some(rest[..rest.find(['"', ' '])?].to_string())
        })
        .collect()
}

/// (METHOD, path) pairs the servers route.
fn served_routes() -> BTreeSet<(String, String)> {
    let mut out = BTreeSet::new();
    // Station: `line.starts_with("GET /health ")`.
    for p in quoted_after(&read("src/station.rs"), "line.starts_with(\"GET ") {
        out.insert(("get".to_string(), p));
    }
    // Telemetry: `("GET", "/metrics") =>`.
    for p in quoted_after(&read("src/telemetry/prometheus.rs"), "(\"GET\", \"") {
        out.insert(("get".to_string(), p));
    }
    // MCP: one stateless POST endpoint on MCP_PATH.
    let http = read("mcp/kshana-mcp/src/http.rs");
    let mcp = quoted_after(&http, "pub const MCP_PATH: &str = \"");
    assert_eq!(
        mcp.len(),
        1,
        "MCP_PATH not found in mcp/kshana-mcp/src/http.rs"
    );
    assert!(http.contains("nest_service(MCP_PATH"));
    out.insert(("post".to_string(), mcp[0].clone()));
    out
}

const METHODS: [&str; 8] = [
    "get", "put", "post", "delete", "options", "head", "patch", "trace",
];

#[test]
fn the_paths_are_exactly_the_routes_the_servers_match() {
    let d = doc();
    let mut described = BTreeSet::new();
    for (path, item) in d["paths"].as_object().unwrap() {
        for m in METHODS {
            if item.get(m).is_some() {
                described.insert((m.to_string(), path.clone()));
            }
        }
    }
    let served = served_routes();
    assert_eq!(
        served.len(),
        5,
        "the route scan found {served:?}; if a server gained or lost a route, update \
         docs/api/openapi.json and this count together"
    );
    assert_eq!(
        described, served,
        "docs/api/openapi.json describes different routes from those the code serves"
    );
}

/// The keys of the first `json!({ ... })` after `marker` in `s`, at its top level.
fn json_keys_after(s: &str, marker: &str) -> BTreeSet<String> {
    let start = s
        .find(marker)
        .unwrap_or_else(|| panic!("{marker} not found"))
        + marker.len();
    let body = &s[start..];
    let open = body.find("json!({").unwrap() + "json!({".len();
    let mut depth = 0i32;
    let mut keys = BTreeSet::new();
    let b = &body.as_bytes()[open..];
    let mut i = 0;
    while i < b.len() {
        match b[i] {
            b'{' | b'(' | b'[' => depth += 1,
            b'}' | b')' | b']' => {
                if depth == 0 {
                    break;
                }
                depth -= 1;
            }
            b'"' => {
                let end = i + 1 + body[open + i + 1..].find('"').unwrap();
                let after = body[open + end + 1..].trim_start();
                if depth == 0 && after.starts_with(':') {
                    keys.insert(body[open + i + 1..open + end].to_string());
                }
                i = end;
            }
            _ => {}
        }
        i += 1;
    }
    keys
}

fn schema_props(d: &Value, name: &str) -> (BTreeSet<String>, BTreeSet<String>) {
    let s = &d["components"]["schemas"][name];
    let props = s["properties"]
        .as_object()
        .unwrap_or_else(|| panic!("schema {name} has no properties"))
        .keys()
        .cloned()
        .collect();
    let req = s["required"]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_str().unwrap().to_string())
        .collect();
    (props, req)
}

#[test]
fn the_station_status_schema_matches_status_doc() {
    let src = read("src/station.rs");
    let d = doc();
    for (schema, marker) in [
        ("StationSource", "fn status_doc("),
        (
            "FleetLast",
            "*fl.lock().unwrap_or_else(|p| p.into_inner()) = Some(",
        ),
    ] {
        let code = json_keys_after(&src, marker);
        let (props, req) = schema_props(&d, schema);
        assert!(!code.is_empty(), "no keys found after {marker}");
        assert_eq!(
            props, code,
            "{schema} properties differ from src/station.rs"
        );
        assert_eq!(
            req, code,
            "{schema} must require every key the code always writes"
        );
    }
    // The top-level document: the second json! in status_doc.
    let at = src.find("fn status_doc(").unwrap();
    let rest = &src[at..];
    let second = rest
        .find("\"schema\": \"kshana.station-status/1\"")
        .unwrap();
    let top = json_keys_after(&rest[second - 40..], "");
    let (props, req) = schema_props(&d, "StationStatus");
    assert_eq!(
        props, top,
        "StationStatus properties differ from status_doc"
    );
    assert_eq!(req, top);
    assert_eq!(
        d["components"]["schemas"]["StationStatus"]["properties"]["schema"]["const"],
        "kshana.station-status/1"
    );
}

fn refs(v: &Value, out: &mut Vec<String>) {
    match v {
        Value::Object(m) => {
            for (k, x) in m {
                if k == "$ref" {
                    out.push(x.as_str().unwrap().to_string());
                } else {
                    refs(x, out);
                }
            }
        }
        Value::Array(a) => a.iter().for_each(|x| refs(x, out)),
        _ => {}
    }
}

#[test]
fn the_document_is_sound_openapi_3_1() {
    let d = doc();
    assert_eq!(d["openapi"], "3.1.0");
    assert_eq!(d["info"]["version"], env!("CARGO_PKG_VERSION"));
    assert_eq!(d["info"]["license"]["identifier"], "AGPL-3.0-only");
    let mut all = Vec::new();
    refs(&d, &mut all);
    assert!(!all.is_empty());
    for r in &all {
        let ptr = r
            .strip_prefix('#')
            .unwrap_or_else(|| panic!("external $ref {r}"));
        assert!(d.pointer(ptr).is_some(), "$ref {r} does not resolve");
    }
    let schemes: BTreeSet<&str> = d["components"]["securitySchemes"]
        .as_object()
        .unwrap()
        .keys()
        .map(String::as_str)
        .collect();
    let mut ids = BTreeSet::new();
    let ops = d["paths"]
        .as_object()
        .unwrap()
        .values()
        .chain(d["webhooks"].as_object().unwrap().values());
    for item in ops {
        for m in METHODS {
            let Some(op) = item.get(m) else { continue };
            let id = op["operationId"].as_str().expect("operationId");
            assert!(ids.insert(id.to_string()), "duplicate operationId {id}");
            assert!(op["summary"].is_string(), "{id}: summary");
            assert!(
                op["responses"].as_object().is_some_and(|r| !r.is_empty()),
                "{id}: responses"
            );
            for req in op["security"].as_array().into_iter().flatten() {
                for k in req.as_object().unwrap().keys() {
                    assert!(schemes.contains(k.as_str()), "{id}: unknown scheme {k}");
                }
            }
        }
    }
    // Words the documentation rules keep out of public text.
    let text = read("docs/api/openapi.json").to_lowercase();
    for w in ["compliant", "conform", "certified"] {
        assert!(!text.contains(w), "docs/api/openapi.json says {w:?}");
    }
}
