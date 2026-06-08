// SPDX-License-Identifier: Apache-2.0
//! The Kshana MCP server: a thin, faithful bridge from `kshana::api` to MCP tools.
//!
//! Every tool wraps an existing public `kshana::api` function — no new simulation logic
//! lives here, so the validated engine is exactly what an agent runs. Tools:
//!
//! - `run_scenario`        — run a scenario TOML, return the summary + full result JSON.
//! - `list_scenario_kinds` — discover the built-in scenario kinds and their fields.
//! - `validate_scenario`   — classify a scenario TOML (kind detection) without running it.
//! - `export_sp3`          — export an `orbit` scenario's constellation as SP3-c.
//! - `export_omm`          — export an `orbit` scenario's elements as CCSDS OMM.

use rmcp::handler::server::router::tool::ToolRouter;
use rmcp::handler::server::wrapper::Parameters;
use rmcp::model::{
    CallToolResult, Content, Implementation, ProtocolVersion, ServerCapabilities, ServerInfo,
};
use rmcp::{ErrorData as McpError, ServerHandler, schemars, tool, tool_handler, tool_router};

/// Parameters for [`KshanaServer::run_scenario`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct RunScenarioRequest {
    /// The scenario definition as a Kshana TOML document. Use `list_scenario_kinds`
    /// to discover the available `kind`s and their required/optional fields.
    pub toml: String,
    /// When true, also return the result chart as an SVG text block. Default false.
    #[serde(default)]
    pub include_chart: bool,
}

/// Parameters for tools that take only a scenario TOML.
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct TomlRequest {
    /// The scenario definition as a Kshana TOML document.
    pub toml: String,
}

/// The Kshana MCP server handle.
#[derive(Clone)]
pub struct KshanaServer {
    // Consumed by the `#[tool_handler]`-generated `ServerHandler` impl; rustc's dead-code
    // pass flags fields only read through a derived trait (here `Clone`), hence the allow.
    #[allow(dead_code)]
    tool_router: ToolRouter<KshanaServer>,
}

impl Default for KshanaServer {
    fn default() -> Self {
        Self::new()
    }
}

#[tool_router]
impl KshanaServer {
    /// Construct the server with its generated tool router.
    pub fn new() -> Self {
        Self {
            tool_router: Self::tool_router(),
        }
    }

    #[tool(
        description = "Run a Kshana PNT-resilience scenario from a TOML definition and return its figures of merit. Returns the human-readable summary followed by the full result JSON (FoMs, curves). Kshana validates SGP4/SDP4, IAU reference frames, Allan deviations, GNSS availability/DOP, ARAIM protection levels, GNSS/INS fusion, and quantum-sensor models against published references. Call list_scenario_kinds first to discover scenario types and their fields."
    )]
    fn run_scenario(
        &self,
        Parameters(RunScenarioRequest {
            toml,
            include_chart,
        }): Parameters<RunScenarioRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::api::run_toml(&toml) {
            Ok(out) => {
                let mut contents = vec![Content::text(out.summary), Content::text(out.json)];
                if include_chart {
                    contents.push(Content::text(out.svg));
                }
                Ok(CallToolResult::success(contents))
            }
            Err(e) => Err(McpError::invalid_params(
                format!("scenario run failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "List every built-in Kshana scenario kind with its description and required/optional TOML fields, as a JSON array. Use this to discover what scenarios can be run and how to construct a valid scenario TOML for run_scenario."
    )]
    fn list_scenario_kinds(&self) -> Result<CallToolResult, McpError> {
        Ok(CallToolResult::success(vec![Content::text(
            kshana::api::list_scenario_kinds_json(),
        )]))
    }

    #[tool(
        description = "Pre-flight check of a Kshana scenario TOML: verify it parses as TOML and detect its scenario kind, without running it. Returns the detected kind, or a descriptive error for malformed TOML. (run_scenario performs the full validation by executing the scenario.)"
    )]
    fn validate_scenario(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        // `classify` is permissive by design (unknown/unparseable input falls back to the
        // clock pack), so do a strict TOML parse here to actually catch malformed input.
        if let Err(e) = toml::from_str::<toml::Value>(&toml) {
            return Err(McpError::invalid_params(format!("invalid TOML: {e}"), None));
        }
        let kind = kshana::api::ScenarioKind::classify(&toml)
            .map(|k| k.as_str())
            .unwrap_or("clock");
        Ok(CallToolResult::success(vec![Content::text(format!(
            "valid: detected scenario kind `{kind}`"
        ))]))
    }

    #[tool(
        description = "Export an `orbit` scenario's propagated constellation as SP3-c precise-ephemeris text (the standard GNSS post-processing format). Errors if the scenario is not an orbit kind."
    )]
    fn export_sp3(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::api::export_sp3(&toml) {
            Ok(sp3) => Ok(CallToolResult::success(vec![Content::text(sp3)])),
            Err(e) => Err(McpError::invalid_params(
                format!("SP3 export failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "Export an `orbit` scenario's mean elements as a CCSDS 502.0-B-2 OMM (Orbit Mean-Elements Message) catalogue — one OMM per satellite. Errors if the scenario is not an orbit kind."
    )]
    fn export_omm(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::api::export_omm(&toml) {
            Ok(omm) => Ok(CallToolResult::success(vec![Content::text(omm)])),
            Err(e) => Err(McpError::invalid_params(
                format!("OMM export failed: {e}"),
                None,
            )),
        }
    }
}

#[tool_handler]
impl ServerHandler for KshanaServer {
    fn get_info(&self) -> ServerInfo {
        // Set the identity explicitly: rmcp's `Implementation::from_build_env()` reports
        // `env!("CARGO_CRATE_NAME")` from *within rmcp* (i.e. "rmcp"), not this crate.
        // `Implementation` is #[non_exhaustive], so mutate a default instance.
        let mut info = Implementation::default();
        info.name = "kshana-mcp".to_string();
        info.version = env!("CARGO_PKG_VERSION").to_string();
        info.title = Some("Kshana PNT-resilience simulator".to_string());
        info.description = Some(
            "MCP access to the validated Kshana positioning/navigation/timing simulator."
                .to_string(),
        );
        info.website_url = Some("https://kshana.dev".to_string());
        ServerInfo::new(ServerCapabilities::builder().enable_tools().build())
            .with_server_info(info)
            .with_protocol_version(ProtocolVersion::V_2024_11_05)
            .with_instructions(
                "Kshana is an open, reproducible PNT (positioning/navigation/timing) resilience \
                 simulator. Each tool wraps the validated engine: run_scenario executes a \
                 scenario TOML and returns figures of merit; list_scenario_kinds enumerates the \
                 scenario types and their fields; validate_scenario checks a TOML; export_sp3 / \
                 export_omm emit standard GNSS/CCSDS products from an orbit scenario. Construct \
                 scenarios from list_scenario_kinds metadata; do not invent fields."
                    .to_string(),
            )
    }
}
