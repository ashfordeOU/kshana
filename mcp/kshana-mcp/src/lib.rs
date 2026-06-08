// SPDX-License-Identifier: Apache-2.0
//! Model Context Protocol (MCP) server for the Kshana PNT-resilience simulator.
//!
//! Exposes the validated `kshana` engine to MCP clients — AI agents, Cursor, and
//! JetBrains AI Assistant / Junie, and any other MCP-compatible assistant — over stdio.
//! The library exposes [`server::KshanaServer`] so it can be driven directly in tests;
//! the `kshana-mcp` binary serves it over stdio.

pub mod server;
