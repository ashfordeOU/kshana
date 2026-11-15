// SPDX-License-Identifier: AGPL-3.0-only
//! The MCP server reads every receiver format the engine reads (roadmap 0.42 I11: "MCP gains the new
//! readers"). `assess_receiver_log` deserialises the scenario's `format` into
//! [`kshana::receiver_trust::LogFormat`], so each reader added to that enum is served at once; this
//! test keeps the tool's description (what an assistant reads) and the server README naming every
//! one of them, so a new reader is never served but unannounced.

const ENUM_SRC: &str = include_str!("../src/receiver_trust/mod.rs");
const SERVER: &str = include_str!("../mcp/kshana-mcp/src/server.rs");
const MCP_README: &str = include_str!("../mcp/kshana-mcp/README.md");

/// The variants of `pub enum LogFormat`, in serde's kebab-case.
fn formats() -> Vec<String> {
    let body = ENUM_SRC
        .split("pub enum LogFormat {")
        .nth(1)
        .and_then(|s| s.split("\n}").next())
        .expect("pub enum LogFormat not found");
    body.lines()
        .map(str::trim)
        .filter(|l| !l.starts_with("//") && l.ends_with(','))
        .map(|l| {
            let name = l.trim_end_matches(',');
            let mut out = String::new();
            for (i, c) in name.chars().enumerate() {
                if c.is_ascii_uppercase() && i > 0 {
                    out.push('-');
                }
                out.push(c.to_ascii_lowercase());
            }
            out
        })
        .collect()
}

#[test]
fn the_receiver_log_tool_names_every_reader() {
    let f = formats();
    assert!(f.len() >= 12, "parsed only {f:?}");
    // The parse agrees with serde for every variant.
    for name in &f {
        let v: Result<kshana::receiver_trust::LogFormat, _> =
            serde_json::from_value(serde_json::Value::String(name.clone()));
        assert!(v.is_ok(), "{name} is not a LogFormat name");
    }
    let desc = SERVER
        .split("description = \"Assess a real GNSS receiver log for trust")
        .nth(1)
        .and_then(|s| s.split("\"\n").next())
        .expect("the assess_receiver_log description");
    let row = MCP_README
        .lines()
        .find(|l| l.starts_with("| `assess_receiver_log` |"))
        .expect("the assess_receiver_log row of mcp/kshana-mcp/README.md");
    for name in &f {
        let tick = format!("`{name}`");
        assert!(
            desc.contains(&tick),
            "the assess_receiver_log description does not name {tick}"
        );
        assert!(
            row.contains(&tick),
            "mcp/kshana-mcp/README.md does not name {tick}"
        );
    }
}
