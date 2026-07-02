---
description: Run a validated Kshana PNT scenario via the kshana-mcp server and summarise the figures of merit
argument-hint: "[scenario kind or a plain-English question, e.g. 'clock-holdover, optical clock, 1h GNSS outage']"
---

# Run a Kshana PNT scenario

The user wants to run a positioning/navigation/timing scenario on the **validated Kshana
engine** (exposed by the `kshana` MCP server), not to have the numbers guessed.

Request: **$ARGUMENTS**

Do this:

1. If the request doesn't already map to a known scenario, call the **`list_scenario_kinds`**
   tool to see the built-in kinds and their required/optional fields, and pick the one that
   fits. There are ~17 kinds (orbit, GNSS availability/DOP, ARAIM, clock-holdover,
   Allan/MTIE timing, GNSS-INS fusion, quantum dead-reckoning, and more).
2. Build a minimal, valid scenario TOML for that kind. If unsure it parses, call
   **`validate_scenario`** first (it detects the kind without running).
3. Call **`run_scenario`** with the TOML. Pass `include_chart: true` if a chart would help.
4. Report the **figures of merit** from the result JSON (e.g. availability, p95 timing
   error, dead-reckoning error, DOP, protection levels) with their units, plus the
   `scenario + seed + engine version` provenance line so the run is reproducible. Do **not**
   invent numbers the tool didn't return.
5. For orbit scenarios, offer `export_sp3` (precise ephemeris) or `export_omm` (CCSDS OMM
   catalogue) if the user wants the constellation exported.

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and
point them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp`
Docker image), then `/plugin install kshana@ashforde`.
