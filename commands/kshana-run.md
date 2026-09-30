---
description: Run a Kshana positioning, navigation and timing (PNT) scenario via the kshana-mcp server and summarise the figures of merit
argument-hint: "[scenario kind or a plain-English question, e.g. 'clock-holdover, optical clock, 1h GNSS outage']"
---

# Run a Kshana PNT scenario

The user wants to run a positioning, navigation and timing (PNT) scenario on the **Kshana
engine** (exposed by the `kshana` Model Context Protocol (MCP) server), not to have the
numbers guessed. Most results state their evidence tier (VALIDATED against an
external oracle, or MODELLED) in a `figure_tiers` block or a `label`; where one does,
keep that tier when you report the figure.

Request: **$ARGUMENTS**

Do this:

1. If the request doesn't already map to a known scenario, call the **`list_scenario_kinds`**
   tool to see the built-in kinds and their required/optional fields, and pick the one that
   fits. There are 75 built-in kinds (orbit and Global Navigation Satellite System (GNSS)
   availability and dilution of precision (DOP), advanced receiver autonomous integrity
   monitoring (ARAIM), clock holdover, telecom timing with maximum time interval error
   (MTIE), GNSS and inertial navigation system (INS) fusion, quantum dead-reckoning,
   L-band spectrum and jamming, low Earth orbit (LEO) PNT signals, passes and end-to-end
   chains, constellation design, lunar and cislunar navigation, the solar system, and
   campaigns that chain other kinds, among others); always call `list_scenario_kinds`
   rather than guessing from the handful this sentence names.
2. Build a minimal, valid scenario in TOML (Tom's Obvious Minimal Language) for that
   kind. The quickest way is to start from a bundled example:
   **`list_example_scenarios`** (pass the `kind`) names them and
   **`get_example_scenario`** returns the TOML, which runs as it stands and can be edited.
   If unsure an edited scenario parses, call **`validate_scenario`** first (it detects the
   kind without running).
3. Call **`run_scenario`** with the TOML. Pass `include_chart: true` if a chart would help.
4. Report the **figures of merit** from the result JSON (JavaScript Object Notation),
   e.g. availability, 95th-percentile (p95) timing error, dead-reckoning error, DOP,
   protection levels, with their units, plus the
   `scenario + seed + engine version` provenance line so the run is reproducible. Do **not**
   invent numbers the tool didn't return.
5. For orbit scenarios, offer `export_sp3` (SP3, Standard Product 3, precise
   ephemeris), `export_omm` (a CCSDS, Consultative Committee for Space Data Systems,
   Orbit Mean-Elements Message catalogue) or `export_oem` (CCSDS Orbit Ephemeris
   Message 2.0 carrying velocity, for GMAT, the General Mission Analysis Tool, Orekit or
   STK, Systems Tool Kit) if the user wants the constellation exported. For the kinds
   that publish a reproducibility table (`realtime-frame-eop`, `lunar-time-budget`,
   `lunar-jamming`, `telecom-timing`, `leo-navmsg` for its `encode-decode` analysis, and
   `moonlight-service-volume` with an export site set), offer `export_table_csv` to return it as CSV (comma-separated
   values).
6. Offer the other views of the run when they help: **`report_scenario`** (the report, with
   every figure's unit and VALIDATED or MODELLED label and a reproducibility record),
   **`animate_scenario`** (the time series as an animated SVG, Scalable Vector Graphics,
   drawing or an HTML player page; a kind with no time axis is refused with the reason),
   and **`list_export_formats`** then **`export_interop`** (the geometry as CZML, the
   Cesium Language, for CesiumJS; KML, the Keyhole Markup Language, for Google Earth;
   GeoJSON; or an STK, Systems Tool Kit, ephemeris; a `spectrum` scenario's samples as
   SigMF, the Signal Metadata Format).

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and
point them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp`
Docker image), then `/plugin marketplace add ashfordeOU/kshana` and
`/plugin install kshana@ashforde`.
