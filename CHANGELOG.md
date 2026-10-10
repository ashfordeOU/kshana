# Changelog

All notable changes to Kshana are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While the project is pre-1.0, the public scenario/result schema may still change;
breaking changes are called out explicitly.

## [Unreleased]

## [0.35.0] - 2026-10-10

Trusted fix: software that scores the trust of a vessel's navigation fix from the receiver
output already installed, with the tooling around it: live and gate modes, Signal K and
OpenCPN integrations, crew-training NMEA, interference maps with route exposure, telemetry
exporters, signed evidence packs, a compliance mapping, a test-bench export, and the same
capabilities on the Python, WebAssembly, MCP, Claude Code plugin and JetBrains surfaces. Evidence
class: everything below is **MODELLED** or checked for internal consistency; none of it adds a
VALIDATED row, and the verification ledger gains seven MODELLED rows (258 rows: 124 Validated,
130 Modelled, 4 Partner). The scores are advisory: this is not type-approved equipment and the operator stays
responsible. Nothing here synthesises a jammer or spoofer radio waveform and nothing transmits;
generated NMEA text is for training. Galileo OSNMA verification is not in this release.

### Added (surfaces)

- **The 0.35 capabilities on every surface they suit.** Python: `receiver_trust_replay`,
  `assess_vessel_log`, `evidence_create`, `evidence_verify`, `interference_map`,
  `route_exposure`, `nmea_training`. WebAssembly: the same except `evidence_create` (a signing
  key does not belong in a page). MCP server: `assess_vessel_stream`, `assess_vessel_log`,
  `create_evidence_pack`, `verify_evidence_pack`, `generate_training_nmea`,
  `build_interference_map`, `route_exposure`, each with input caps and round-trip tests. Claude
  Code plugin: slash commands `/kshana-assess-receiver`, `/kshana-training-scenario`,
  `/kshana-interference-map`, `/kshana-evidence-pack` and the matching skills. JetBrains plugin:
  Assess Receiver Trust, Generate Training NMEA, Build Interference Map and Route Exposure
  actions. Notebooks: `vessel-trust-and-training`, `interference-map-route-exposure`. Docs:
  `docs/AGENTS.md` and `docs/SURFACES.md`, which states, for every cell, why a surface cannot
  carry a capability (a running process: `receiver-trust live`, its gate and listener, the
  telemetry exporters, streamed training NMEA; the land download). The in-memory entry points
  share `kshana::surface`, which adds only input size caps and JSON shaping to the feature
  modules' own functions.

### Added (evidence packs)

- **`kshana receiver-trust evidence` and `kshana evidence verify`: signed, verifiable
  evidence packs for a GNSS trust event.** A pack bundles the raw log slice and the full
  log's SHA-256, the configuration with every threshold, the per-epoch results and
  reasons, the engine version, a hash-chained manifest and a self-contained HTML summary,
  signed with Ed25519 (a key from `kshana evidence keygen` or your own file; keys are never
  stored in a pack and `*.evidence-key` is git-ignored). `verify` checks every hash, the
  chain and the signature and names exactly what fails; with `--pubkey` it pins the signer.
  An RFC 3161 token can be attached and is read and bound to the manifest (the authority's
  own signature is not checked by this build; `openssl ts -verify` covers it). The log slice is the
  window's exact bytes where the reader reports source spans (NMEA, UBX, RINEX 3, Android),
  otherwise the whole log, and the manifest says which.
  Creation and verification are pure public functions (`kshana::evidence`) that build for
  `wasm32`. The packs state that they are a technical record, not a legal opinion. The new dependencies are
  the `ed25519-dalek` tree (BSD-3-Clause and Apache-2.0/MIT, minimal features) and a direct
  `zeroize` (already in that tree) to wipe key material. See
  `docs/EVIDENCE-PACKS.md`.

### Added (trust telemetry)

- **`kshana trust-telemetry`: GNSS trust as a security-telemetry source.** Reads the
  per-epoch trust stream (JSON lines: score 0-100, band, reasons) or a batch
  `receiver-trust` result and feeds a Prometheus `/metrics` endpoint (localhost by
  default), syslog events in CEF or LEEF inside an RFC 5424 envelope (UDP or TCP), and,
  behind the off-by-default `otlp` feature, OTLP/HTTP JSON export. Delivery runs on worker
  threads with connect and write time limits, capped reconnect backoff and a
  `kshana_trust_syslog_send_failures_total` counter, so a dead or stalled collector cannot
  stall the live assessment or freeze `/metrics`; reason labels are capped at 64 series. No
  new dependencies.
  A sample Grafana dashboard is in `deploy/grafana/`. Metric names, labels and the
  CEF/LEEF field mapping are in `docs/TRUST-TELEMETRY.md`. The stream format is isolated
  in `src/telemetry/sample.rs`.

### Added

- **Maritime trust: a live 0-100 trust score for a moving vessel's fix, from the NMEA 0183
  the receiver already outputs, with an opt-in gate.** `kshana receiver-trust` takes a
  `[platform]` table (`kind = "static"` or `"vessel"`, the vessel's maximum speed, acceleration
  and turn rate, antenna height above the waterline and an optional heading sensor; every default
  documented with its reason). For a vessel the static position-jump monitor, which measures
  distance from the calibration mean and is wrong on a ship under way, is replaced by causal
  moving-platform monitors: kinematic consistency of the position against the reported speed and
  course and against the vessel limits, gyro heading against course over ground, speed log against
  speed over ground, antenna altitude against the stated height above the waterline, C/N0 spread
  collapsing and rising together against the calibration baseline, and time consistency (against
  this computer's clock too, in live mode). It also reads a reported authentication status, overall or per satellite
  (a reported status only: no OSNMA cryptography). Every threshold is stated in a `[maritime]` table before the run. Each epoch then
  gets a score from 0 to 100 by a deterministic, pre-registered mapping (no learning, nothing fitted
  to events; weights, band edges and the evidence hold in a `[score]` table), mapped onto the
  existing trust states, with the monitors that deducted and their points. Static scenarios are
  unchanged and hash as before. `kshana receiver-trust live <session.toml>` reads stdin, a file
  being appended, TCP or UDP and writes one JSON line per epoch and a proprietary `$PKSHT`
  sentence; with `--gate` it passes the stream through unchanged while the fix is trusted and
  marks the fix invalid (GGA quality 0, RMC and GLL status `V`, GNS and VTG mode `N`) while it is
  not. The gate is off unless asked for; `--listen tcp:<port>` serves the gated stream to any number of
  TCP clients (loopback by default, a slow client is dropped rather than blocking the others). This is advisory software, not type-approved navigation
  equipment (IEC 61108, IEC 61162); the operator remains responsible. `examples/maritime-trust/`
  is a synthetic Tallinn to Helsinki log, written as text only, with a position drag-off partway
  through during which the receiver keeps reporting a valid fix; its expected output is pinned by
  a test. Guide: `docs/MARITIME-TRUST.md`. The checks cannot see a spoofer whose fix is
  consistent with everything on the bus; the guide says so.

### Interference map

- **`kshana interference-map` and `kshana route-exposure`: a public picture of where
  aircraft and ships reported degraded navigation data, and how much of a route it touches.**
  Inputs are local CSV files made from openly licensed ADS-B (adsb.lol, ODbL 1.0) and AIS
  (NOAA MarineCadastre, Kystverket under NLOD 2.0) data; each output file is one source and
  one UTC day of GeoJSON carrying the method, its thresholds, the data licence, the
  attribution and the source's coverage bias. The ADS-B method aggregates NIC and NACp onto
  a fixed grid and calls a cell degraded from the share of distinct aircraft, with guards for
  equipment that never reports accuracy, low altitude, and wide-area causes. The AIS method
  runs five detectors: positions on land (against a user-supplied coastline), circular
  tracks, implausible jumps, implausible speeds, and many vessels at one position. Thresholds
  are pre-registered constants of a named method version. Aggregates only: identifiers are
  hashed in memory and never written, and cells with fewer than 5 distinct aircraft or
  vessels are not published. A degraded cell is not a finding of interference. The default
  commands use no network; an opt-in `fetch-land --allow-network` helper downloads Natural
  Earth land polygons from a commit-pinned address and keeps the file only if its SHA-256
  matches. ADS-B input is a CSV or the adsb.lol readsb history files directly (new
  dependency: `flate2` with its pure-Rust backend, for gzip). Both methods are version 2:
  a degraded or anomalous call needs at least 5 aircraft or vessels (the publication
  minimum), every per-cell count below 5 is withheld as `null`, and a day whose background
  cannot be estimated withholds its calls. Output files are named
  `<source>-<dataset>-<date>.geojson` and are never overwritten; input is streamed line by
  line; route exposure handles the antimeridian. Tests use synthetic data only. See `docs/INTERFERENCE-MAP.md` and the
  licence review in `docs/data/INTERFERENCE-DATA-SOURCES.md`.

### Added (training streams)

- **`kshana nmea-scenario`: synthetic bridge NMEA 0183 for crew training in GNSS jamming
  and spoofing recognition.** From a scenario TOML it writes a file, or streams over TCP
  or UDP (unicast or broadcast; real time, accelerated or as fast as possible), the full
  bridge set GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT and VBW for a vessel track with
  rate-of-turn, acceleration and current limits, with satellite geometry from the engine's
  own nominal constellations. Scripted events on a timeline: jamming, position drag-off
  (a valid fix that walks away), time spoof and a replay delay, each with onset and
  recovery ramps. An instructor log (JSON and text) records what was injected when with the
  true track against the reported one. A library in `scenarios/training/` (open-sea
  jamming, coastal drag-off, port-approach time spoof, combined) carries trainer notes.
  Output is checksum-valid and deterministic per seed; tests pin a golden excerpt per
  scenario and read every sentence with the `receiver-trust` NMEA reader. Text only: no
  RF, IQ or waveform output; streams are for training and testing and must never be fed
  to a vessel's live navigation systems. See `docs/NMEA-TRAINING.md`.

### Marine integrations (0.35.0, workstream B)

- **Signal K plugin** (`integrations/signalk/`, not published to npm): runs or connects to `kshana receiver-trust live`
  (the server's own NMEA input, custom input arguments, a JSON-lines TCP feed, or the `$PKSHT` sentences of a gate
  stream), publishes the trust score, band, reasons, alarms and gate state under `navigation.gnss.kshana.*` (including the receiver-reported position as context, never `navigation.position`), and raises
  a Signal K notification (`warn` on degraded, `alarm` on untrusted, with hold, clear and staleness thresholds, all in
  the config schema). No npm dependencies. Tested on recorded synthetic output.
- **OpenCPN**: gate-mode NMEA is served directly by `kshana receiver-trust live --gate --listen tcp:10110` (recommended); a
  dependency-free TCP relay (`integrations/opencpn/nmea-tcp-relay.mjs`) is the optional alternative. Either way OpenCPN
  sees an invalid fix when trust collapses and `$PKSHT` in its NMEA debug window; tests replay the synthetic gated stream
  through a real TCP socket and check what a consumer receives. A native score-panel plugin
  (`integrations/opencpn/plugin/`, plugin API 1.18, CMake) reads `$PKSHT` from OpenCPN's own NMEA stream and alerts
  on the untrusted band; it builds, its logic is unit-tested, and it was run inside OpenCPN 5.8.4 under a virtual display (evidence
  and a reproduction script in `integrations/opencpn/evidence/`); it is not packaged for the plugin manager.
- **Reference build** (`deploy/reference-build/`): generic parts list, OS setup, systemd units for the advisory monitor and
  the opt-in gate (checked with `systemd-analyze verify` by `check-units.sh`), a container option, Signal K wiring.
- The Signal K plugin accepts the live JSON schema 1.2 (a `position` then an `advisory` key appended; unknown appended keys are ignored), checked on real 1.2 output and against a real signalk-server.
- Review fixes: the systemd units restart always and run sandboxed (no shell, no network where none is needed), a logrotate
  snippet, `check-units.sh` fails on any finding; the container runs the gate from environment variables with a health check
  and digest-pinned base images; Signal K score metadata, the stale notification is replaced when data resumes, child-process
  errors are kept and kills escalate, unsafe `inputArgs` are refused, and the notification is at
  `notifications.navigation.gnss.kshana.trust`; the relay caps a held partial line; the `$PKSHT` parsers reject scores outside
  0 to 100; a documentation link check; a CI workflow (`marine-integrations.yml`) running all of it, including the real binary
  end to end.
- `docs/MARINE-INTEGRATIONS.md`. Advisory software, not type-approved equipment; the operator stays responsible. Software
  only: nothing transmits, and no detection or false-alarm figure is claimed.

### Added: compliance mapping and test-bench export

- **`docs/compliance/` and `kshana compliance-report`.** A mapping from Kshana outputs to
  five resilience frameworks and standards (the US DHS Resilient PNT Conformance Framework v2.0,
  IMO guidance for ships, EASA guidance for aviation, NIS2 Article 21, EN 16803, a paid standard
  cited by part and by the few clause numbers visible in catalogue text), one table per framework: the reference, what it asks in our
  paraphrase, the outputs that support evidence for it, and the gap. Source versions, URLs and
  what was and was not read are recorded. `kshana compliance-report <result.json>...` fills
  the mapping from the runs given and marks each row `evidenced`, `partly-evidenced`,
  `not-evidenced` or `out-of-scope`, as Markdown and JSON, with the gap kept on every row. The
  wording is "supports evidence for"; nothing is rated or approved. Tests use synthetic runs and fail
  when a committed table drifts from the code.
- **`kshana bench-export <scenario.toml>`.** Writes a `gnss-ins`, `jamming` or `gnss-sim`
  scenario's vehicle motion and events for a laboratory GNSS simulator: a user-motion CSV
  with documented frames and a metadata sidecar, NMEA 0183 `GGA`/`RMC`, waypoint text, and the
  events as CSV and as `receiver-trust` `[[events]]` blocks (`src/interop/testbench.rs`).
  Motion and events only: no signal is written. Every file is read back in
  `tests/interop_testbench.rs` and compared within its stated tolerance.
  [`docs/TEST-BENCH.md`](docs/TEST-BENCH.md) gives the method for replaying the export
  through a simulator and scoring the receiver's log with `kshana receiver-trust`.
- **What counts as evidence.** A result counts for a capability only when it carries the
  fields its kind writes; a kind label alone counts for nothing. Unknown kinds, a result
  that disagrees with its sibling scenario, non-hex hashes and malformed receiver-trust
  counts are listed as not used, with the reason. The report escapes Markdown cells and
  cannot panic on a non-ASCII hash. `compliance::run_from_text` and `assess_texts` take
  texts, not paths.
- **Test-bench export.** `--epoch` is range-checked (`UtcEpoch::parse_iso`); the waypoint
  file checks every interval and the command says why when it is left out; the docs state
  that `gnss-ins` heading is the body yaw and not the course, the `GGA` placeholder fields,
  and the scenario's own height change. `bench-export` and `compliance-report` are in the
  usage text.
- `fusion::pack::truth_trajectory` exposes the `gnss-ins` driving profile's true state
  history (the same stepping the kind's own truth uses), and `UtcEpoch` gains NMEA date and
  time fields.

### Interference map validation

- **The interference map's decoding semantics and geometry are checked against independent
  implementations on synthetic inputs.** NIC and NACp code meanings against pyModeS decoding of
  synthetic ADS-B frames, the AIS not-available values against pyais decoding of synthetic AIVDM
  sentences, grid cell assignment against shapely, route length per cell state against shapely and
  GeographicLib, and inland masking against shapely and pyproj, each to a tolerance fixed before the
  first comparison (`tests/fixtures/interference_map_ref/PREREGISTRATION.md`). This validates how
  codes and field values are read and the geometry, not that a flagged cell is interference. The
  land-polygon reader now closes a ring that does not repeat its first vertex, which it used to read
  without its last edge. The docs state the NACp and NIC low-accuracy thresholds as the bound each
  code stands for (NACp 6 is a 556 m EPU bound, NIC 5 a 1 NM containment bound).

### Changed

- **MCP: `assess_receiver_log` accepts the log as `text` or `base64`; tool input is capped at 4 MiB.**
- **The jamming chart takes its colours from the palette too.** `src/jamming.rs` was the one
  module the Observatory palette revision left on its own colours while the jammer-Q work
  landed; its `*.chart.svg` (the `jamming`, `maritime-strait-jamming` and other `jamming`
  kind scenarios) now reads `src/palette.rs`, and the allowlist in `tests/palette_sync.rs` is
  empty. Colours and font only: the `jamming-demo` and `maritime-strait-jamming` charts are
  equal to their previously recorded renders once colour, `font-family` and the version
  footer are normalised. No plotted value moved. The recorded Studio copies under
  `web/studio/recorded/` were re-recorded at the 0.33.0 and 0.34.0 re-ports (version stamp only):
  they still carry the jamming chart's old paint, and take the palette paint at the next re-port.

### Fixed

- **The clock-ensemble 3-sigma bound now covers the flicker floor, and the filter-health check sees it.**
  With a `flicker_floor` the truth clock carried flicker FM but the two-state filter that
  supplies the integrity bound did not, so the shipped `clock-ensemble` scenario's 3-sigma
  coverage was 0.41 (classical) and 0.33 (quantum), and the NIS/NEES check, which drew its own
  truth from the filter's model, reported identical values with and without the floor. The
  bound is now the two-state variance plus the exact variance of the flicker phase accumulated
  since the last sync, computed from the same bank the truth clock uses; the NIS/NEES check
  draws its truth from the extended model with that bank and runs the matched extended filter
  (and the two-state filter against flicker truth reports `consistent = false`). Output change,
  only for clocks with a nonzero `flicker_floor`: `integrity` on `clock-ensemble` goes from
  0.40866 / 0.33026 to 0.99970 / 1.0 (classical / quantum) and `filter_health` NIS/NEES now
  include the flicker; the timing error, `holdover_s` and `timing_p95_ns` are unchanged, and
  scenarios without a floor are byte-identical. `scenarios/orbit-gnss-challenged.toml` (orbit
  kind, seed 7, floors 1e-16 / 2e-11) also moves: `fom.integrity` classical 0.7734 to 1.0 and
  quantum 0.9796 to 1.0, and the `filter_health` NIS/NEES and their bands change. Its quantum
  `filter_health.consistent` flips from `true` to `false`: a sampling event of the 16-seed by
  60-step flicker ensemble (NIS 0.8815 against a band of [0.9125, 1.0914]), not a defect. The
  band is a 95 % band, so about 5 % of seeds flag a matched filter by construction (40 fresh
  seeds of this scenario: quantum 1 and classical 2 flagged); at 64 by 200 the same seed is
  inside the band for both clocks (NIS 0.990 and 1.001). Known follow-up: the fusion kind has the
  same gap (classical integrity 0.80 with a floor); the hybrid kind stays above 0.99.

## [0.34.1] - 2026-10-10

### Security

- **MCP server input hardened.** The MCP server's scenario tools now accept inline content only
  and refuse file-source fields; input size is capped.

## [0.34.0] - 2026-10-09

Lab replay: a tracking engine, detection monitors and a campaign runner for GNSS IQ
recordings, with the loop designs, C/N0 estimators and scores that go with them. Evidence
class: everything below is **MODELLED** or checked for internal consistency against closed
forms and seeded simulation; none of it adds a VALIDATED row, and the verification ledger is
unchanged (251 rows: 124 Validated, 123 Modelled, 4 Partner). It is a software analysis
layer: nothing here synthesises a jammer or spoofer waveform, and nothing transmits.

### Added

- **Lab replay: test conditions, campaign runner and scoring (0.34.0).** `kshana iq campaign
  <campaign.toml>` replays recordings × front-end chains × loop designs (`kshana.loop-design/1`)
  and scores every cell against a per-recording test-condition file (`kshana.test-conditions/1`,
  TOML or JSON). That file states what a lab knows about the recording: the expected satellites,
  and for each event its type label, onset and offset, affected satellites and stated J/S or
  jammer-power profile. It is metadata only. The scores per satellite, for the whole run and per
  event, are:
  - availability, time to loss of lock and the stated J/S at the loss;
  - re-acquisition time, from the event offset and from the loss;
  - measured C/N0 degradation per stated-J/S bin;
  - false-lock episodes per locked hour (the tracker's flag, or Doppler against a truth sidecar);
  - PLL and DLL discriminator jitter.

  Next to each measured degradation curve, an analytic spectral-separation reference
  (`jamming::effective_cn0_dbhz` with the type's `Q`) is drawn and labelled MODELLED wherever it
  appears.

  Cells run in parallel through the tracking session's lock state machine, and each is
  written atomically under a content-hash key. The key covers the recording's SHA-256, the
  condition, front-end, design, run and scoring hashes, the required `data_class`
  (`synthetic` | `client-confidential`) and the engine version. With `run.epochs` set, each
  cell's `kshana.track-epoch/1` stream and lock events are also kept, named by cell key and
  hashed into the cell. `cell_key` and `report::digest` are public, so a consumer can
  re-derive every key and the digest. A rerun therefore skips finished cells, and outputs never depend on the worker
  count. The run writes `scorecard.csv`/`.json`, a self-contained `report.html` and a `DIGEST`.
  Pass/fail bars (`[scoring.bars]`, overridable per recording) are applied when the report is
  built.

  - `[scoring] cn0_estimator = "m2m4" | "nwpr"` (default `"m2m4"`, part of the scoring hash) picks the
    C/N0 behind the reported C/N0 and the degradation curve. Both estimates are always scored and
    reported (whole-run and baseline medians, and per J/S bin), and the cell and scorecard record
    the estimator. NWPR reads low by about 8 dB × Bn·T under the loop's own jitter; M2M4 does not.

  Also new:
  - `kshana iq campaign report <dir>` rebuilds the scorecards, report and digest from the cells;
  - `kshana iq conditions <file>` checks a test-condition file against its schema;
  - `events_from_sigmf = true` imports a SigMF recording's `kshana:test_event` annotations as
    events;
  - Python gains `iq_test_conditions`, `iq_campaign` and `iq_campaign_report`;
  - `kshana-mcp` gains `iq_campaign`, which is incremental and resumable under the per-call
    sample budget with every file confined to the work directory, and `iq_campaign_status`.

  Tests: `tests/iq_campaign.rs` runs a synthetic campaign of 3 recordings × 2 front ends × 2
  designs. Its scenes carry stated C/N0 profiles, and it covers:
  - every metric checked against the injected truth;
  - resume after a partial single-worker run with a corrupt cell, byte-identical to an
    uninterrupted four-worker run;
  - per-cell epoch files;
  - a 20 s three-satellite re-acquisition regression: with `reacquire` on, every channel is
    back within 2 s of a 2 s gap; the `reacquire` off outcome is pinned;
  - bars re-judged without re-running;
  - the CLI;
  - ignored release-mode throughput and memory checks, including a 4 GB recording (5.45× real
    time, peak memory 2 MB above the starting RSS; one-machine measurements, not bars).

  Software only: nothing transmits, and no interference or spoofing waveform is synthesised.
  Design and as-built notes: `docs/design/LAB-CAMPAIGN.md`.

- **Tracking engine for lab replay (0.34.0: B3.1, B3.2, B3.3, B6.1).**
  - *Loop-design files*: `kshana.loop-design/1` TOML (`docs/design/LOOP-DESIGN-TOML.md`;
    parser `iq::track::design`). One or more named designs set every loop field:
    - carrier kind (PLL, FLL or FLL-assisted PLL), orders and bandwidths;
    - PLL/FLL/DLL discriminators and carrier aiding;
    - spacing and integration;
    - lock thresholds and C/N0 windows, and bit sync;
    - the lock state machine;
    - the hand-off acquisition (`"auto"` or explicit).

    Designs may `extends` one another. Unknown keys are refused. Each resolved design has a
    SHA-256 hash over a canonical JSON form (keys sorted at every level, fixed number
    formatting), so the hash does not depend on field order; every output records it.
    Surfaces:
    - `kshana iq track --design <file> [--design-name]`, where explicit flags override the
      design and are recorded;
    - `kshana iq sweep --design <file>`, which runs every design in the file;
    - Python `iq_track(design=, design_name=, reacquire=)`, `iq_loop_designs`;
    - MCP `iq_track` `design`/`design_name`.
  - *M2M4 C/N0* (`EpochOutput.cn0_m2m4_dbhz`, the track-epoch column `cn0_m2m4_dbhz` after
    `cn0_beaulieu_dbhz`; Python epoch dicts). The second-and-fourth-moment estimate over the same
    windows as NWPR, from prompt power only: NWPR reads low under the loop's own carrier jitter
    (about 8 dB × Bn_PLL·T) and M2M4 does not. On GPS L2C CM (20 ms, nominal 40 dB-Hz, PLL 1 to
    10 Hz) it reads 39.93 dB-Hz at every bandwidth while NWPR falls from 39.55 to 38.22; on L1 C/A
    at 45 dB-Hz it reads 45.34. NWPR and every other output are unchanged (a bit-for-bit pin).
    The binary record stays 184 bytes (the value takes the reserved float and flag bit 6).
  - *Extra correlator taps (multi-correlator / SQM).* `[design.integration]
    extra_taps_chips = [..]` (offsets in chips from the prompt, positive early; at most 16, each
    within ±2) correlates extra replicas alongside E/P/L and returns them as
    `EpochOutput.extra` (`(offset, value)` in design order). The loops never use them. The
    key is left out of the canonical JSON when empty, so the default design's hash and every
    tapless output are unchanged (`kshana.track-epoch/1` stays; the no-tap CSV/JSONL/binary
    are bit-identical). With taps: CSV/JSONL columns, and a binary record of
    `184 + 16 × taps` bytes whose header carries `extra_taps_chips`, so an old reader refuses
    the file rather than misparse it. `--extra-taps` (CLI), `extra_taps` (Python) and
    `extra_taps_chips` (MCP `iq_track`). The designs of one run must agree on taps.
  - *Parallel channels* (`iq track` / `iq sweep --threads <N|auto>`; Rust
    `TrackSession::with_threads`). Each chunk's channels run on up to N threads
    (`std::thread::scope`; `wasm32` stays serial). A channel's correlation and lock state machine
    touch only that channel; its epochs and events are buffered and written to the sinks in
    channel order, so the output (CSV, JSONL, binary, events, summary) is byte-identical to the
    serial run for any N. The default stays 1 thread. Measured on a 12-channel, 4 s, 4.092 MHz
    recording on 4 cores: 19.5 s serial, 11.5 s at 2 threads, 6.3 s at 4 (3.1×; the initial
    acquisition is serial).
  - *Acquisition-surface export* (`kshana.acq-surface/1`; `iq::acq_surface`,
    `docs/design/ACQ-SURFACE.md`). `iq acquire --surface <path>` (one PRN; CSV, JSON or binary),
    Python `iq_acq_surface` and MCP `iq_acquire` `surface_out` write the whole Doppler × code-phase
    correlation-power surface the search computes (its cells are `acquire`'s, bit for bit) with the
    peak and two fine-Doppler refinements: a parabolic estimate and a 1/16-bin fine search (≈5 Hz
    at 4 ms coherent, against 167 Hz bins). `acquire` itself and every default are unchanged.
  - *Streaming epoch output* (`kshana.track-epoch/1`; `iq::track::sink`). Every loop update
    carries:
    - the early/prompt/late correlators;
    - all three discriminator outputs;
    - the PLL/FLL/DLL NCO states and the carrier phase;
    - the PLI and lock flags;
    - both C/N0 estimates and the bits;
    - the lock state.

    It is written as it happens, as CSV, JSON Lines or a versioned binary form with readers
    in Rust (`BinaryEpochReader`) and Python (`iq_read_epochs`).
    - `iq track` gains `--epochs`, `--events` and `--summary` (`kshana.track-summary/1`),
      and `iq sweep` gains `--epochs` and `--events`. MCP `iq_track` gains `epochs_out`/`events_out` and builds
      its reply from the bounded-memory summary.
    - A run's heap no longer grows with the recording's length:
      `tests/iq_track_memory.rs` measures it with a counting allocator (6× the length,
      same peak within 64 KiB), with a control showing that the in-memory path does grow.
    - Streamed output is bit-identical to the in-memory replay.
  - *Lock state machine* (`iq::track::lock`, `TrackSession`): pull-in → locked → lost →
    re-acquisition → pull-in, or retired once a loss outlasts `reacq_window_s` (default
    30 s). Failed searches are retried every `reacq_interval_s` (0.1 s), evenly spaced, so
    the retry schedule adds at most 0.1 s to a measured re-acquisition time. An optional
    back-off (`reacq_max_interval_s` above `reacq_interval_s`) is off by default, and
    `max_reacq_attempts` is an optional cap (0, none, by default). A 2 s outage on three
    PRNs at 4.092 MS/s now ends with every channel re-acquired and locked. Under a
    3-attempt budget, every channel was retired within 0.2 s of the loss.
    - Thresholds (`loss_dwell_s`, `pull_in_max_s`, the re-acquisition Doppler window) come
      from the design. Every transition is an event with its reason.
    - The false-lock check searches the tracked Doppler against its ±1/(2T) FLL/PLL
      alias. It catches the false lock PR #38 measured (−2400 Hz tracked 500 Hz off).
      With re-acquisition on, the channel ends locked at the injected Doppler.
    - A 0.8 s signal gap is declared lost and re-acquired within 0.3 s of the signal's
      return.
    - `--summary` `final_state` (and the table's column) is the state after the last
      transition, so a channel retired after its last loop update reads `RETIRED`.
    - **FLL assistance only during pull-in** (`[design.carrier] fll_assist = "pull-in"`,
      the default; `"always"` keeps the earlier behaviour bit for bit). The FLL hands over
      to the PLL once the smoothed PLI has held at or above `fll_off_pli` (0.8) for
      `fll_gate_dwell_s` (0.1 s), and returns below `fll_on_pli` (0.6). Left on, the 10 Hz
      FLL path broke phase lock below about 38 dB-Hz on clean signals: at 35 dB-Hz the
      phase-lock fraction was 10–16 %, with a true phase error of 38–41°. Gated, the
      default holds 100 % at 35 dB-Hz with 4.5°, the same as a PLL alone. Pull-in from a
      100 Hz hand-off error is unchanged. Evidence with pre-registered bars:
      `docs/design/evidence/carrier-lock/`. **The default loops are therefore not bit for
      bit with earlier runs of the default design.** Use `fll_assist = "always"` to
      reproduce them. Known limit: at 35 dB-Hz the hand-over comes 1.9–2.6 s into the
      track, and at 33 dB-Hz the 10 Hz FLL keeps the PLI below the hand-over threshold, so
      pull-in never completes.
    - New loop-design keys and API, listed:
      - `[design.carrier]`: `fll_assist`, `fll_off_pli`, `fll_on_pli`, `fll_gate_dwell_s`;
      - `[design.lock]`: `reacq_window_s`, `reacq_interval_s`, `reacq_max_interval_s`, with
        `max_reacq_attempts` changed from a default of 3 to an optional cap (default 0);
      - Rust: `LoopConfig.fll_assist` (`FllAssist`, `FllGate`), `LoopCore::set_fll_enabled`,
        `EpochOutput.fll_active`, `ChannelSummary.final_state`.
    - The design hash is over a canonical JSON form, and the built-in default's hash is
      `33261cd171a53803a6c262686e878e01f37d902a93d5918c20a44297b8ef8e80` (pinned by a test).
    - Output compatibility notes:
      - the `iq track` table has a trailing `final_state` column;
      - the `iq sweep` CSV has a trailing `design_hash` column, and its JSON has
        `design_hash` and `warnings`;
      - the sweep's `mean_cn0_dbhz` is now the mean over every update that has an NWPR
        estimate (bounded-memory summary), no longer over the second half of the run.
    - Re-acquisition is **off in the built-in default**, where the state machine only
      observes and the loops run bit for bit as they do without it. (The default loops
      themselves changed, though: see FLL assistance above.) Turn it on per design
      (`[design.lock] reacquire = true`), with `--reacquire`, or with `reacquire=True`.
    - A **`commensurate_sampling` warning**: when fs is within 1e-6 of a multiple of half
      the chip rate (`iq::track::commensurate_samples_per_chip`), `iq track`/`iq sweep`
      (output, `--summary`, sweep JSON), the MCP `iq_track` reply and the Python
      `iq_track` result warn that code-loop jitter and bias are not representative. The
      root cause is documented with pre-registered bars in
      `docs/design/evidence/dll-jitter/`. At exactly 2 samples per chip with 0.5-chip
      spacing, the DLL S-curve is a single step and the loop dithers: ≈ 0.09 chip RMS code
      error (≈ 26 m) at 45 dB-Hz, against ≈ 0.004 chip at an incommensurate rate. The
      ~2 dB low NWPR C/N0 at that rate has the same cause. At exactly 0 Hz code Doppler and
      4 samples per chip the code never crosses the ±0.21-chip dead zone, so a code-phase bias
      of up to about 0.2 chip can persist without showing in the jitter (measured: 0.5-chip
      spacing gives 2.0× the control's code error with a +0.011 chip mean; 0.25-chip spacing
      gives +0.125 chip); the warning covers the rate.
    - **Known limit: the default design does not hand over FLL→PLL below about 35 dB-Hz**
      (a ~35 dB-Hz pull-in floor; see FLL assistance above and
      `docs/design/evidence/carrier-lock/`).
    - A false-lock or re-acquisition search that cannot run (a rate with no whole number of
      samples per code period) no longer stops tracking.
    - Tests: `tests/iq_track_engine.rs`, `tests/iq_cli.rs`, `iq::track::design::tests`,
      `tests/python`, and the MCP IQ round trip.
- **C/N0 profiles in synthetic scenes (0.34.0).** `iq::channel::cn0_profile` schedules
  time-varying C/N0 per satellite in Kshana's own scenes, as dB offsets relative to the
  scene's C/N0. Shapes: step, ramp, piecewise linear, and seeded scintillation-like Rice
  fades with a stated S4 and decorrelation time. They are applied through the existing scene
  channel hook (`Cn0ProfileChannel`, composing with the ionosphere, troposphere,
  scintillation and multipath effects), with no change to the scene core. The truth
  sidecar's `cn0_dbhz` follows the profile.
  - Surfaces: `kshana iq scene … --cn0-profile <toml>` and
    `kshana.iq_scene(…, cn0_profile="<toml>")`.
  - What it is for: loops, monitors and campaign scoring can be stress-tested against a
    known truth. It changes the strength of the legitimate signals only.
  - Checks (`tests/iq_cn0_profile.rs`). Bars: fade mean intensity within 5 % of 1, S4 within
    8 % of target (at S4 = 0.3, 0.7 and 1), intensity correlation above 0.9 at 0.05 τ and
    below 0.05 at 5 τ; truth exactly the stated C/N0 plus the profile; a tracked NWPR C/N0
    drop within 0.7 dB of a 6 dB step. Measured: S4 within 1.3 % of target, and a tracked
    drop of 6.26 dB.
- **IQ-path detection monitors (0.34.0 "Lab replay").** New `iq::monitor` module,
  `kshana iq monitor` command and `kshana.iq_monitor(path, ...)` binding. They observe a
  recording and report time series plus flagged events (start, alarm and end times, peak,
  threshold). They detect and measure only; nothing here generates a signal.
  - **Total power / AGC**: block power and the gain an ideal AGC would apply; flags rises
    and drops.
  - **Pre-correlation spectrum**: Welch PSD per block against a learned baseline. The excess
    threshold comes from a false-alarm target. Also complex kurtosis and a pulse detector.
    The pulse detector counts samples over a threshold in each block and raises an event when the exact binomial upper tail of that
    count is below `pulse_pfa` (default 1e-4 per block), not when a z-score passes a limit: at
    the small expected counts of short blocks a single sample is already several sigma.
  - **Per-channel C/N0**: two one-sided CUSUM change detectors (drop and rise), fed
    independent estimates (the stride is set from the loop's C/N0 window).
  - **SQM from the correlators**: delta `(I_E − I_L)/I_P` and ratio `(I_E + I_L)/(2 I_P)`,
    plus asymmetry tests from extra correlators when a channel supplies them.
  - **Lock-indicator series**: PLI and a frequency lock indicator from successive
    prompts, as raw signals. Lock and loss-of-lock decisions stay with the tracking
    engine's lock state machine.
  
  One streaming pass (`iq::monitor::run::run_monitors`) runs everything, with a TOML/JSON
  settings file (`MonitorConfig`); the campaign runner uses the same entry point.
  All MODELLED. Each statistic is checked against its closed form by seeded simulation
  (`tests/iq_monitor.rs`):
  - block-power exceedances against the Gamma tail;
  - kurtosis mean 2 and spread `2/√N`;
  - pulse fraction `e^{−t}`;
  - CUSUM run lengths against Siegmund's approximation (measured 330 and 8.46 samples
    against 338 and 8.34);
  - the phase lock indicator against the Rician-phase mean;
  - on a tracked C/A signal, SQM delta and ratio spreads about 6 % from the first-order
    closed forms (measured 5.97 %; test bar 12 %).
  
  The spectral-excess false-alarm formula is an approximation; the measured rate was 1.3×
  the formula. End to end, the monitors flag:
  - a 6 dB C/N0 step (change time within one estimate);
  - a reflected path appearing mid-recording (ratio test);
  - a signal outage (PLI falls from 0.999 to −0.3 and FLI from 0.93 to 0.03 during
    it);
  - a narrowband tone and sparse high-amplitude samples (spectral, pulse and kurtosis
    tests). These are generic DSP test inputs, not interference models.

### Changed

- **`iq track`/`iq sweep` stream through the new session (see Added).**
  - `--csv` keeps its 0.32 columns but is now streamed, so rows of several channels
    interleave in time order instead of being grouped by channel. `--json` keeps its 0.32
    shape and still holds every epoch in memory: use `--epochs` for long recordings.
  - `iq sweep` measures jitter over the updates in the second half of the run's duration
    (previously the second half of the update count), and its CSV/JSON gain a
    `design_hash` column.
  - The track table gains a `final_state` column.
  - The usage text no longer claims `iq track` takes the front-end flags; only
    `iq acquire` applies them.
  - Python `iq_track`'s `acq_noncoherent` and `doppler_max` now default to `None` (the
    design's values, 1 and 5000 Hz in the built-in design). Its epochs gain the
    early/late correlators, `carrier_phase_cycles`, `bit_edge`, `bit` and `state`, and
    the result gains `design` and `events`.

### Fixed

- **The default acquisition step no longer hands Galileo E1 tracking a residual the FLL
  cannot pull in.** The step `2 / (3 · N · T_code)` leaves up to `1 / (3 · N · T_code)` of
  Doppler error at hand-off, but the default two-quadrant FLL pulls in only `1 / (4 T_track)`.
  For every code of 4 ms or longer (`N = 1`), including Galileo E1-B and E1-C, the residual
  (83.3 Hz at 4 ms) was outside the 62.5 Hz pull-in and tracking false-locked at +125 Hz, with
  a phase-lock indicator of 0.97 that hid it. The default step is now also capped at
  `0.2 / T_track` (`kshana::iq::acq::default_step_hz`), 0.8 of the pull-in, so the hand-off
  stays inside it even when the neighbouring bin wins. (0.4 was tried first: it false-locked 1 run
  in 42 on E1-B, and a 1 ms coherent GPS L1 C/A search picked a bin 350 Hz off and locked at
  +500 Hz; 0.25 and 0.2 had none in the same runs.) Cost: Galileo E1-B/E1-C go from 166.7 Hz to
  50 Hz bins, 201 bins over ±5 kHz instead of 61; the 1 ms codes (166.7 Hz, `N = 4`) are
  unchanged. `"auto"` in a loop design means this; an explicit `doppler_step_hz` or
  `--doppler-step` is used as written, and `iq acquire` (no tracking hand-off) keeps the
  textbook step. The epoch header and `--summary` now record the resolved step and loop
  bandwidths for each channel (`resolved`). The default design hash is unchanged. Output change:
  detections on 4 ms-and-longer codes can land on different Doppler bins.

- **GPS L2C CM (20 ms loop update) holds lock with the default design.** The default 15 Hz PLL
  and 10 Hz FLL have `Bn · T` of 0.3 and 0.2 at T = 20 ms, and the loop lost lock even from a
  perfect start (PLI −0.08, M2M4 15.8 dB-Hz). New design key `carrier.bn_t_max` (default 0.1)
  clamps the PLL and FLL noise bandwidths to `bn_t_max / T` when the loop update time is
  longer than 4 ms (`Design::loop_config_for`): 5 Hz and 5 Hz at 20 ms, 10 Hz and 10 Hz at
  BeiDou B1C's 10 ms; the 1 ms and 4 ms codes keep 15 and 10 Hz. It applies to explicit
  bandwidths too; `bn_t_max = 0` turns it off. The key is omitted from the canonical form at its
  default, so the default hash is unchanged; a design that sets any other value has a different
  hash. At 45 dB-Hz L2C CM now gives PLI 0.996, Doppler error 0.00 Hz and M2M4 42.71 dB-Hz.
  Known open item: the NWPR C/N0 reads 1.76 dB low there (and 2.45 dB low on B1C at 10 ms),
  so the matrix's T5 for L2C stays an ignored finding.

- **`docs/assets/clock-ensemble-band.svg` regenerated: the committed figure was stale
  against its own scenario (a data change, not a repaint).** The chart was drawn on
  2026-06-02 from `scenarios/clock-ensemble.toml`; two days later 67fed19e set the flicker-FM
  floors in that scenario (quantum `flicker_floor = 1e-16`, CSAC `flicker_floor = 2e-11`)
  and the figure was never redrawn. It showed the pre-floor run: y axis 0 to 47 ns, CSAC
  per-run outage p95 of 10.5 to 47.6 ns (mean 25.2 ns), classical holdover 4050 s mean. The scenario as shipped (and as the tutorial and
  the CLI summary already state) gives y axis 0 to 407 ns, CSAC per-run p95 40.8 to 374.0 ns
  (mean 167.0 ns), classical holdover 844 s [220 to 2130 s]; the 20 ns spec line sits at the
  same 20 ns on a roughly nine-times taller axis. The engine is unchanged: today's engine
  on the June scenario file reproduces the old figure's axis exactly. The figure is not
  referenced from the README or the docs.

### Known limitations

- **The NWPR C/N0 reads low at high per-prompt C/N0·T, and BOC(1,1) at 5 MS/s loses about
  1 dB.** NWPR is unbiased on ideal prompts, but the loop's own PLL jitter costs about
  a fitted 8 dB × Bn·T (one scene, four points: −0.24/−0.44/−0.77/−1.58 dB at 1/2.5/5/10 Hz and 20 ms; about −1 dB at the
  default `bn_t_max = 0.1`); M2M4 is insensitive. BeiDou B1C data at 5 MS/s also loses about
  1 dB of prompt power to band-limiting (use 10 MS/s or more). Neither is an estimator defect;
  the signal-matrix T5 rows for GPS L2C and BeiDou B1C stay ignored findings with these causes.

## [0.33.1] - 2026-10-08

### Security

- **Chart text and Studio chart adoption hardened.** Text that a scenario carries into a generated chart is now escaped consistently by one shared routine, and the Studio adopts only drawing markup from a chart. The Studio's address parameters, kind-keyed lookups and scenario fetches are restricted to known values. Bundled charts, recorded results and published numbers are unchanged. Upgrading is recommended for anyone who opens scenario files from untrusted sources in the Studio or embeds generated charts in web pages.
  Advisory: [GHSA-h25h-cg9f-v2cg](https://github.com/ashfordeOU/kshana/security/advisories/GHSA-h25h-cg9f-v2cg).

## [0.33.0] - 2026-10-08

### Documentation

- **The interference and spoofing scope of the IQ layer, stated accurately.** The 0.31.0 and
  0.32.0 entries below say the IQ layer adds "no interference or spoofing waveform
  synthesis". That is true of the IQ layer itself (`iq::scene` generates legitimate GNSS
  signals only), but it read as a statement about the whole engine, and it is not one:
  since 0.29.0 the `spectrum` kind's `[iq]` section writes a SigMF snapshot of its analytic
  model with the configured jammers in it (noise-like jammers bin by bin, tones and chirps
  as waveforms), and `spoof_capture` sums an authentic and a spoofer replica signal in
  memory to test loop capture (the composite is never written out). The engine has also
  carried a software GNSS receiver since 0.20.0 (`sdr`: acquisition and tracking; since
  0.31.0 also `iq::acq` and `iq::track`). Nothing in Kshana transmits or drives radio
  hardware. The README status line, `docs/POSITIONING.md`, `docs/SPECTRUM.md` and the IQ
  design notes now say so; the released entries are left as they were published. No
  behaviour changes.
- **Known limitation: commensurate sampling.** At a sample rate that is an integer or
  half-integer multiple of the chip rate, the samples sit on the same chip phases in every
  chip, and the code discriminator becomes a staircase. On a synthetic GPS L1 C/A signal at
  45 dB-Hz with 0.5-chip spacing, 2.046 MHz (2 samples/chip) gives ≈ 0.09 chip (≈ 26 m)
  RMS code error and a −0.09 chip bias, against ≈ 0.003 chip at an incommensurate rate. The
  NWPR C/N0 reads ≈ 2.4 dB low there. At 4.092 MHz it depends on the spacing and the code
  Doppler. At 0.5 chip it is harmless at 1500 Hz Doppler but 2× with a 0.011 chip bias at
  0 Hz, and at 0.25 or 0.1 chip it is 8–10× the code error. Carrier tracking is unaffected.
  `docs/design/iq-notes/receiver.md` has the measurements.

### Added

- **GNSS IQ layer on the MCP server (Phase B.1).** `kshana-mcp` gains six tools that drive
  the `kshana iq` layer from an agent: `iq_signals` (the accepted signal names and the IQ
  set-up), `iq_info` (describe a recording), `iq_scene` (generate a stated-profile or
  broadcast-ephemeris scene, with the optional signal-level channel), `iq_acquire` (FFT
  acquisition, optionally behind front-end stages), `iq_track` (acquire, then the DLL/PLL/FLL
  bank) and `iq_frontend` (band-pass, notch, blanking, excision, AGC, quantiser). IQ samples
  never cross the protocol: every tool takes file paths inside one work directory set by
  `KSHANA_MCP_IQ_DIR` (unset leaves the IQ file tools off and every other tool unaffected),
  refuses paths that resolve outside it and outputs that already exist unless `overwrite`
  is set, enforces a per-call sample budget (`KSHANA_MCP_IQ_MAX_SAMPLES`, default 50 000 000)
  before any work, refuses unknown arguments, and replies with a compact JSON summary
  (detections, C/N0, lock state, and each file written with its byte count). Per-epoch output
  goes only to files the caller names. The tools run the same code path as the CLI through a
  new public seam, `kshana::iq::cli::execute`, which returns the CLI's message instead of
  printing it (stdout is the MCP JSON-RPC channel); `iq::cli::build_code` and
  `iq::cli::signal_names` are now public too. Software-only and additive: the IQ layer adds no
  interference or spoofer synthesis, nothing is ever transmitted, and there are no new
  dependencies. `server.json` declares the two environment variables. Round-trip tests in `mcp/kshana-mcp/tests/iq_round_trip.rs`
  generate a short two-satellite scene and check acquisition against the scene's own truth
  sidecar, tracking lock and C/N0, the front end, SigMF output, the budget, path confinement
  and the disabled state.

- **The GNSS IQ layer in the validation ledger.** A pre-registered cross-check against
  gps-sdr-sim (an independent GPS L1 C/A baseband generator, MIT, commit 28ca29a6) is now part
  of the always-on test suite (`tests/iq_gpssdrsim_cross_generator.rs`). Its committed
  reference output (`tests/fixtures/iq_gpssdrsim_cross_generator/`: 20 ms of gps-sdr-sim's own
  8-bit I/Q, its channel listing, and the channel state behind it from a harness linked
  against the same build) is regenerated by `scripts/gen_iq_gpssdrsim_ref.sh`. Nothing at test
  time needs network or the external tool. Two ledger rows are added (251 rows: 124 Validated,
  123 Modelled, 4 Partner):
  - *GNSS IQ scene signal geometry against an independent baseband generator*: **Validated**.
    The scene's truth (visible set, pseudorange, code phase, Doppler, look angles) for a
    broadcast-ephemeris scene matches gps-sdr-sim's channel state on all 11 channels: worst
    1.6 mm, 5.5e-6 chip, 7.4e-5 Hz, 4e-9 degree, against bars of 0.05 m, 2e-4 chip,
    0.02 Hz and 1e-4 degree fixed before the run.
  - *GNSS IQ acquisition on independently generated I/Q samples*: **Modelled, with a
    finding**. `iq::acq` finds every simulated satellite in gps-sdr-sim's samples within the
    registered bars (code phase within 0.195 chip, Doppler within 72 Hz). The registered
    "no other PRN detected" bar fails, though: on gps-sdr-sim's noise-free output the
    Gaussian-noise threshold is crossed by the other satellites' cross-correlation for all
    21 absent PRNs. The strict test is kept, ignored with the finding, and a pinned test
    records it.
  No engine code or public API changes. The sample I/Q is not compared sample for sample:
  gps-sdr-sim's integer sine table, gains, zero initial carrier phase and truncated LNAV
  fields are not quantities a receiver needs to agree on. The comparison is made at the
  observables a receiver measures.

### Changed

- **`iq track` hands off from a ≈4 ms acquisition by default (behaviour change).** The
  acquisition that initialises each tracking channel now integrates `ceil(4 ms / T_code)`
  code periods coherently instead of one, where `T_code` is the code's full period (primary
  times secondary length for a tiered code, the unit acquisition integrates over). The
  untiered 1 ms codes (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) now search 4 periods (4 ms), so
  the default Doppler step `2 / (3 · N · T_code)` is ~167 Hz instead of ~667 Hz. Every code
  whose full period is already 4 ms or longer keeps 1 period: Galileo E1-B (4 ms), BeiDou
  B1C (10 ms), and the tiered GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q and E1-C (10 to 100 ms with
  their overlay codes), and GPS L2C. Every signal therefore integrates at least ~4 ms. A
  one-period search could hand a channel off up to ~333 Hz off, outside the FLL's pull-in,
  and it then tracked a false lock ~500 Hz away while reporting a clean track. On a seeded
  sweep of 180 GPS L1 C/A channels (Doppler across ±5 kHz, 38 to 47 dB-Hz, half with
  navigation data; `docs/design/evidence/iq-track-acq-default/`, re-runnable) false locks
  fall from 27 of 180 to 1 of 180 and missed acquisitions from 102 to 11, for ~40 ms more
  search per PRN on GPS L1 (11 → 52 ms). The one residual false lock is at 38 dB-Hz, 36 Hz
  off. Every surface agrees: `kshana iq track` and `kshana iq sweep` (`--acq-coherent`),
  Python `kshana.iq_track` (`acq_coherent=None` is now auto; stub updated) and the MCP
  `iq_track` tool. Users who relied on the old default can pass `acq_coherent=1`
  (`--acq-coherent 1`). `kshana iq acquire`'s own `--coherent` default stays 1. New public
  `iq::acq::auto_coherent_periods` and `iq::acq::AUTO_COHERENT_S`; regression test
  `tests/iq_cli.rs::track_default_handoff_does_not_false_lock_where_one_period_did`.
- **Every generated graphic now follows the site's Observatory theme: every chart's bytes
  change.** This is a deliberate revision of the published figures, colours and fonts only;
  no plotted value, coordinate or label moved. Every scenario's `*.chart.svg` (and so the
  Studio's chart exports and the README demo charts), the run report HTML
  (`*.report.html`), the timeline animation (`--animate`), the scenario-result and study
  HTML pages, the validation summary and the docs figures and diagrams used the warm-dark
  July palette (`#0c0b08` ground, `#e0bd84` gold) and a warm-paper report theme. They now
  take every colour and font from one module, `src/palette.rs`, which mirrors
  `web/theme.css`: charts are drawn instrument-dark on the Observatory ground (`#060A14`)
  in the Geist type stack; the report, animation player and result pages follow the
  viewer's light/dark preference with the Observatory light and dark tokens. The six
  failure domains keep one colour each (interference coral, spoofing magenta, timing
  blue, orbits cyan, integrity lime, navigation amber), and the evidence tiers read
  validated lime, modelled amber, partner magenta. The waterfall ramps keep their
  perceptual (inferno) ordering, re-anchored at the new ground.
  - `tests/palette_sync.rs` holds the module to `web/theme.css` in both themes, checks
    that `docs/assets/palette.json` and `docs/diagrams/mermaid-config.json` (both
    generated from the module, for the Python figure tools and mermaid-cli) are current,
    and fails if a hex colour literal appears in `src/` outside the palette.
  - `tests/published_figures_still_reproduce.rs` gains a third diagnosis, "only colours
    and fonts moved", so a palette revision is told apart from a moved plotted value.
    Every re-rendered README chart was checked equal to its predecessor under that
    normaliser.
  - `tools/gen_validation_figures.py` reads the palette and now also generates the three
    README result figures that had no committed generator (`domain-coverage-map`,
    `scenario-fom`, `sgp4-regime-bars`), with real text elements, from
    `web/capabilities.json`, the `clock-holdover` result and
    `tests/fixtures/sgp4_comparison.md`. `tools/gen_readme_assets.py` reads the same
    palette, which corrects its light-theme drift from the site. The `sgp4-regime-bars`
    values are the `kshana↔ref` worst-case column of that fixture (7.31e-9, 8.05e-9,
    8.18e-9 and 4.12e-6 km), unchanged from the Matplotlib figure, and
    `tests/figures_doc_sync.rs` now fails if the committed figure and the fixture disagree.
- **`docs/assets/figures/domain-coverage-map` refreshed to current data (a data change, not
  a repaint).** The figure stated 28 capabilities across 8 domains (11 validated, 17
  modelled), stale against its own stated source; drawn now by its new generator from
  `web/capabilities.json`, it reads 46 capabilities across 8 domains (17 validated, 29
  modelled).

### Fixed

- **CW/narrowband jammer Q is now 1.0, not 1.5.** The textbook value for a tone on the
  carrier is 1 (a tone keeps the signal's spectral peak, `κ = T_c`, `Q = 1/(R_c κ)`); the
  old 1.5 made a tone less damaging than broadband noise at equal J/S. Output change:
  about −1.8 dB effective C/N0 under CW/narrowband jammers at high J/S in the `jamming`,
  `lunar-jamming` and interop kinds (the bundled `spectrum` example's tone: 17.98 dB-Hz
  from the table, was 19.74). Broadband Q stays 1.0 (conservative, about 3 dB below the
  textbook ~2) pending 0.34 review. Set `q_override` to keep the old 1.5.

- **`kshana iq scene` integer output uses the integer range.** With unit-power noise and
  a writer scale of 1, `ci8`/`ci16` scenes came out as about {-1, 0, 1} and 2-bit scenes
  had their thresholds at 2.8 sigma. Integer formats are now scaled so the expected
  per-component RMS is a quarter of full scale (31.75 LSB in ci8, 8191.75 in ci16) or 2 LSB
  in 2-bit. The scale and the clipped-element count are printed and written to the sidecar.
  Float output is unchanged.
- **Eight fixture pins in seven test files no longer fail on macOS from last-bit differences**
  (part of issue #36). The pins that check the engine still builds an oracle's
  committed inputs (Jacobians, a state table, launch azimuths) compared bit for bit and
  failed on macOS arm64 by 2 to a few thousand units in the last place. They now compare
  within 1e-12 of a scale taken from the fixture; integers, keys and lengths still compare
  exactly, and a mutation test shows a 1e-6 relative change still fails. The launch-azimuth
  pin compares `sin az` and the ascending/descending branch instead of the azimuth itself, because
  `asin` amplifies one ulp of its argument to about 3e-9 rad where an inclination equals a site's
  colatitude. No oracle tolerance
  or pre-registered bar changed. Two tests (lunar joint OD, lunar observability) are not
  covered: on macOS their pre-registered comparisons themselves move, and that is left to a
  follow-up.

- **`kshana iq track` and `kshana iq sweep` apply the front-end flags.** The usage text
  advertised `--bandpass`/`--notch`/`--blank`/`--excise`/`--agc`/`--bits` on `track`, but
  `track` and `sweep` never built the chain: the flags were silently ignored, and a
  value-less one such as `--notch` swallowed the flag after it. Both commands now parse
  them as `iq acquire` does and put a fresh front-end chain in front of the acquisition
  pass and the tracking pass. The output equals running the command on the file
  `iq frontend` writes for the same flags.

- **IQ scene data is placed per signal.** `kshana iq scene --data` (and `NavData::Seeded`)
  put 50 bit/s bits on every signal, pilots included, and at the GPS LNAV rate on
  Galileo and BeiDou. Data now follows each signal's own symbol timing, stated by the new
  `SpreadingCode::data_modulation()` (`DataModulation`, set by every constructor in
  `iq::signals`). That is 10 ms on L5-I5, 4 ms on E1-B, 2 ms on BeiDou B1I GEO (D2),
  and 20 ms bits with a 10 ms meander on GLONASS L1OF. Data is refused on pilots, on
  GPS L2C as one CM/CL stream, and `NavData::Lnav` on anything but L1 C/A. Custom codes
  keep the previous 20 ms timing by default. A programmatic `Scene` that asked for
  `NavData::Lnav` on a non-L1 C/A code, or `NavData::Seeded` on a pilot, used to generate
  silently and now returns an error on the first read.

- **GLONASS L1OF channels are acquired and tracked on their own FDMA carrier.**
  `iq::acq::acquire` and the tracking channels mixed every code down from `if_hz` alone.
  In a multi-channel GLONASS recording, a search for channel +3 therefore found channel
  0's signal (all channels share one ranging code) and never looked 1.6875 MHz higher.
  Both now use `SampleSpec::baseband_hz(carrier) = if_hz + (carrier − center_hz)`. The
  carrier term is zero for any recording centred on the signal's own carrier and is
  omitted when the centre is unknown, so CDMA processing is unchanged. If you worked
  around the old behaviour by folding `carrier − center` into the sidecar's `if_hz`,
  remove that term: the offset is now applied from the carrier and the centre, so
  leaving it in applies it twice.
  Known limitation, unchanged here: a GLONASS scene identifies each satellite by its
  frequency channel `k`, and the `u32` satellite id wraps a negative channel. The truth
  sidecar writes `k = -7` as `sat_id` 4294967289 (`k + 2^32`). Read it back as `k` with an
  `i32` cast.

## [0.32.0] - 2026-10-05

### Added

- **GNSS IQ layer on the CLI and Python (0.32.0 Phase A).** The existing `iq` module is now
  usable without writing Rust. Five new `kshana iq` commands join the data-handling group:
  `scene` generates a long multi-satellite IQ scene to a file with a truth sidecar;
  `acquire` runs FFT acquisition of one or more PRNs over a recording and reports each
  detection (PRN, Doppler, code phase, statistic, threshold); `track` acquires then runs the
  DLL/PLL/FLL bank over a recording and emits per-epoch tracking output (CSV/JSON) with
  configurable loop bandwidths, integration time and correlator spacing; `sweep` replays one
  recording across several loop designs and reports the resulting jitter and lock metrics per
  design; and `labfit` fits the tracking-loop loss-of-lock model to a receiver-trust timeline.
  The same core is exposed to Python (`kshana.iq_scene`, `iq_acquire`, `iq_track`,
  `iq_labfit`, `iq_signals`), returning NumPy-friendly lists and dicts. Software-only and
  additive: no new dependencies, no transmit, no interference or spoofing waveform synthesis;
  the engine, acquisition, tracking and loop designs are the crate's own, so a CLI or Python
  caller gets the same bits as the Rust tests. New module `iq::cli`; the scene's own truth
  sidecar is the independent oracle in `tests/iq_cli.rs` (acquisition recovers each injected
  code phase and Doppler, tracking converges to the injected Doppler). No published
  scenario-kind count or verification-matrix row changes.
- **Remaining GNSS IQ library capabilities on the `iq` CLI and Python (0.32.0 Phase A.2).**
  Builds on Phase A, surfacing the rest of the `iq` layer without writing Rust:
  - **Propagation channel on `iq scene`** (and the Python `iq_scene`): a first-order
    ionosphere (`--iono-stec`/`--iono-vtec` or `--iono-klobuchar`), the Saastamoinen/Niell
    troposphere (`--tropo`), the Cornell scintillation model (`--s4`, `--scint-tau0`,
    `--sigma-phi`), specular ground multipath (`--multipath-height`/`--multipath-ground`),
    the three-state land-mobile channel (`--land-mobile`) and a non-line-of-sight block
    (`--nlos`) apply to every satellite through a new crate-internal bridge
    (`iq::channel::SceneChannelAdapter`) that converts the channel models' absolute paths
    into the scene's excess-over-geometry form.
  - **SigMF output on `iq scene`** (`--format sigmf`): writes the samples as a
    `.sigmf-data`/`.sigmf-meta` pair with a capture and per-satellite annotations;
    `acquire`/`track` already read SigMF, so a scene round-trips.
  - **Front-end DSP**: a new `iq frontend <in> <out>` command and the same flags on
    `acquire`/`track` (`--bandpass`, `--notch`, `--blank`, `--excise`, `--agc`, `--bits`
    1/2/3/8/14) run the `iq::frontend` stages (band-pass FIR, adaptive notch, pulse blanking,
    frequency-domain excision, AGC, quantiser); mirrored in Python as `iq_frontend`.
  - **Broadcast-ephemeris scenes**: `iq scene --nav <rinex_nav> --rx-pos lat,lon,alt`
    (with `--start`/`--window`/`--prn`) places each healthy GPS satellite at its true
    broadcast geometry using the engine's RINEX reader, so the truth sidecar carries the real
    per-satellite range, Doppler and code phase; mirrored in Python as `iq_scene_broadcast`.
  Software-only and additive: no new dependencies, no transmit, no interference or spoofing
  waveform synthesis (channel propagation effects act on the legitimate signal only). Each
  numeric claim is tested against an independent reference (closed form or injected truth) in
  the channel/front-end unit tests and `tests/iq_cli.rs`.

## [0.31.0] - 2026-10-04

### Added

- **GNSS IQ layer: signal-level simulation and software-receiver processing.** A new `iq`
  module takes Kshana from a single-satellite, short-block L1 C/A front end to a full
  signal-level layer, reachable from the `kshana iq` command group. It generates long,
  multi-satellite raw IQ scenes with a per-epoch truth sidecar (`iq::scene`); applies
  propagation at the signal level — ionosphere with code-carrier divergence, troposphere,
  amplitude and phase scintillation (Cornell model), Fresnel multipath and a three-state
  land-mobile channel, with non-line-of-sight (`iq::channel`); acquires and tracks with FFT
  acquisition and a multi-channel DLL/PLL/FLL bank, replaying one recording through many loop
  designs (`iq::acq`, `iq::track`); models the front end — FIR/IIR filtering, 1-to-14-bit
  quantisation, AGC, notch, pulse blanking and frequency-domain excision (`iq::frontend`);
  streams large recorded datasets in bounded memory — int8/int16/float32/packed-2-bit and
  real-IF formats, multi-file SigMF, resampling, a dataset inventory with per-file SHA-256 and
  a batch runner (`iq::io`); adds spreading codes for GPS L5/L2C, Galileo E1 (CBOC, real ICD
  memory codes) and E5a, BeiDou B1C/B1I and GLONASS L1OF, each checked against its interface
  control document (`iq::signals`); and fits the tracking-loop loss-of-lock model to a real
  receiver's observed behaviour in lab runs, with leave-one-run-out hold-out error and
  extrapolation labelled as prediction (`iq::labfit`). Each numerical claim is tested against
  an independent reference (an ICD table, a closed form, or an independent receiver recovering
  the injected truth); the physical channel and loop models stay MODELLED. This is a software
  layer only: it writes IQ files for software receivers and does not synthesise interference
  or spoofing waveforms or drive radio hardware. No published scenario-kind count or
  verification-matrix row changes. Design: `docs/design/GNSS-IQ-PLAN.md`.
- **Receiver trust: assess a real GNSS receiver log.** `kshana receiver-trust <scenario.toml>`
  reads a u-blox UBX, RINEX 3 (with an optional broadcast navigation file), Android
  GnssLogger or NMEA 0183 log into one time-tagged timeline and runs trust monitors over it:
  carrier-to-noise density (C/N0) drop, loss of lock, automatic gain control (AGC), the
  u-blox jamming indicator, position jump and, with RINEX and navigation, the engine's own
  single-point fix with parity receiver autonomous integrity monitoring (RAIM) and the
  clock-aided monitor. Each epoch is nominal, degraded or untrusted, and the result says when
  and why. Events and predicted C/N0 drops stated in the scenario are scored against
  tolerances stated in the same file: detected, late or missed, and agree or disagree.
  Outputs are the result JSON, a per-epoch CSV and a chart; the result carries the log's
  SHA-256 and every threshold. Also reachable from Python (`kshana.receiver_trust`), the
  WebAssembly package (`receiver_trust`, logs inline) and the Model Context Protocol (MCP)
  server's new `assess_receiver_log` tool. Guide: `docs/RECEIVER-TRUST.md`; example:
  `examples/receiver-trust/`. On the JammerTest 2024 spoofing logs the engine path reproduces
  the pre-registered oracle pipeline's first alarm at every published onset
  (`tests/receiver_trust_jammertest.rs`). The monitors stay MODELLED; no verification-matrix
  row changes.

## [0.30.0] - 2026-10-03

A minor release. Validation rounds 2 and wave-1 packages take the verification matrix from
223 rows (93 VALIDATED) at 0.29.3 to 249 rows (123 VALIDATED, 122 MODELLED, 4 PARTNER); every
promotion was checked against an independent oracle at a tolerance fixed before the run, and
every disagreement is published as a finding. New: a native NAIF kernel reader and DE440 path,
one validated SGP4-to-ITRS propagation and time path, a measured clock library, a LunaNet AFS
reference generator, extended-precision and square-root information solvers, and real lunar IQ
processing on LuGRE data. Published numbers that moved are listed as revisions below.

Twenty-seven verification-matrix rows become VALIDATED after an independent oracle agreed
within a tolerance fixed before the first comparison (the promotion rule in
`docs/VALIDATION.md`): ten in a first validation round and seventeen in a second. Fifty-one
MODELLED rows were put to an external oracle in the first round and the remaining routable
rows in the second; every disagreement is recorded below as a finding rather than tuned
away. Three rows were split so that a validated part does not carry an unvalidated
remainder, which takes the matrix from 223 to 226 rows; the validation packages folded since
take it to 249. The counts are read from the generated `docs/VERIFICATION-MATRIX.md`.

| | 0.29.0 | after round 1 | Unreleased |
| --- | --- | --- | --- |
| Verification-matrix rows | 223 | 223 | 249 |
| of which VALIDATED against an external oracle | 83 | 93 | 123 |
| of which MODELLED | 136 | 126 | 122 |
| of which PARTNER | 4 | 4 | 4 |

<details>
<summary><b>Abbreviations used in this entry</b></summary>

| Abbreviation | Meaning |
| --- | --- |
| ADD, ARAIM, MAAST | Airborne Design Document (of ARAIM); advanced receiver autonomous integrity monitoring; the Matlab Algorithm Availability Simulation Tool of Stanford University |
| ADEV, VRW, ARW | Allan deviation; velocity random walk; angle random walk |
| ANISE, SPICE, NAIF, PCK | an open-source astrodynamics toolkit (Nyx Space); NASA's Spacecraft, Planet, Instrument, C-matrix, Events toolkit from its Navigation and Ancillary Information Facility; planetary constants kernel |
| BCRS, TDB, TT | Barycentric Celestial Reference System; Barycentric Dynamical Time; Terrestrial Time |
| BIPM, UTC(k) | International Bureau of Weights and Measures; a laboratory's realisation of Coordinated Universal Time |
| CCSDS, OEM, LTC, TCL | Consultative Committee for Space Data Systems; Orbit Ephemeris Message; lunar time systems written in the message's TIME_SYSTEM field |
| CRLB | Cramér–Rao lower bound |
| CW | Clohessy–Wiltshire relative motion |
| DE440 | Development Ephemeris 440 of the Jet Propulsion Laboratory |
| DOP, PDOP | dilution of precision; position dilution of precision |
| EKF, UKF, INS, GNSS, IMU | extended Kalman filter; unscented Kalman filter; inertial navigation system; global navigation satellite system; inertial measurement unit |
| EMT, VPL, HPL | effective monitor threshold; vertical and horizontal protection level |
| EOP, IERS, PCC, MAE | Earth orientation parameters; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; mean absolute error |
| ERFA, SOFA | Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy |
| GMAT | NASA's General Mission Analysis Tool |
| NTN, SSB | non-terrestrial network (3GPP); synchronisation signal block |
| IGS, ILRS, ITRF2020 | International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame 2020 |
| ILS, LAMBDA | integer least squares; Least-squares AMBiguity Decorrelation Adjustment |
| ISB | inter-system bias |
| LEO | low Earth orbit |
| MHSS, PL, TPL | multiple-hypothesis solution separation; protection level; timing protection level |
| PSD, IQ, SigMF | power spectral density; in-phase and quadrature samples; Signal Metadata Format |
| QPN | quantum projection noise |
| RAIM | receiver autonomous integrity monitoring |
| SBAS, WAAS, DFMC, GEO | satellite-based augmentation system; the US Wide Area Augmentation System; dual-frequency multi-constellation; a geostationary SBAS satellite |
| RMS, SISRE | root mean square; signal-in-space range error |
| RTKLIB | an open-source GNSS positioning library |
| TCXO | temperature-compensated crystal oscillator |
| VLBI | very-long-baseline interferometry |

</details>

### Validated

Each row below names its oracle kind (Library: an independent third-party library computing
a uniquely defined quantity; Measured: real measured data; P2: an independent numerical
library recomputing a linear-algebra quantity on committed inputs), the oracle, the tolerance
fixed before the run, and the result. Every promotion was re-run by a second reviewer, who
regenerated the fixture byte for byte and showed that a deliberate engine mutation turns the
test red.

- **GNSS/INS sensor fusion** (Library), scoped to the loosely coupled 15-state error-state
  EKF: NaveGo v1.4 (LGPL-3.0, run under GNU Octave) on its own real Ekinox IMU/GNSS drive.
  Kshana's horizontal, vertical and position-innovation RMS are 0.912, 0.940 and 0.861 of
  NaveGo's (bar 1.2) and its mean normalised innovation is 0.395 (bar 1.5). GNSS is present
  for the whole drive, so no outage is tested. The tightly coupled UKF and the coupled clock
  filter stay outside the claim.
- **3-DOF attitude and pointing error budget** (Library), narrowed to the gravity-gradient
  torque peak: Basilisk 2.9.1 GravityGradientEffector, 40 cases, within 1e-12 relative (worst
  2.1e-15). The RSS pointing budget is a sum of caller-supplied numbers and stays outside it.
- **Lunar joint communications-and-navigation geometry** (Library), narrowed to site
  placement, azimuth, elevation and range: ANISE 0.10.2, 768 samples, within 1e-6 deg and
  1 mm (worst 2.2e-12 deg and 5.6e-9 m). The ranging-accuracy parameter is a design input
  outside the claim.
- **Torque-free rigid-body attitude dynamics** (Library): the Basilisk 2.9.1 spacecraft hub,
  1e4 s on two general inertias, quaternion and rates within 1e-9 (worst 3.3e-11 and
  3.4e-12 rad/s).
- **GNSS carrier-phase integer ambiguity resolution (LAMBDA)** (Library), narrowed to the ILS
  solution and its two best norms: RTKLIB v2.4.2-p13 `lambda()`, 300 covariances, 0 integer
  mismatches, norms within 1e-9 relative (worst 5.6e-13). The bootstrapped success rate stays
  checked internally only.
- **Composed timing PL, scalar MHSS** (P2): numpy 2.3.5 and scipy 1.18.1 on 300 committed
  inputs, PL within 1e-9 relative (worst 1.2e-10), driving subset identical.
- **GLS common-mode whitening and the Mahalanobis identity** (P2): numpy 2.3.5 LAPACK on 201
  committed covariances, within 1e-12 relative (worst 7.9e-16); condition numbers up to 19.3.
- **DE440 lunar principal-axis orientation provider** (Library): SPICE `pxform` on the binary
  PCK at 2 000 off-node epochs, within 1.7e-5 rad (worst 1.7e-6 rad, about 3 m at the
  surface), after the fix listed under "Fixed".
- **SigMF recording input and output, and Welch spectra** (Library), narrowed to SigMF read and
  write and `welch_psd`: scipy 1.18.1 `signal.welch` within 1e-12 relative per bin (worst
  6.0e-14); sigmf-python 1.13.0 recordings decoded bit-identically; the crate's metadata valid
  against the SigMF v1.2.6 schema. IQ synthesis and its model comparisons stay outside it.
- **LEO broadcast-ephemeris fitter and SISRE against fit interval** (Measured), narrowed to the
  16-parameter Keplerian fit and its orbit-only SISRE: TU Graz ITSG precise orbits of four
  satellites against the statistics of Liu et al. 2025, components within 1.5x (0.804 to
  1.087) and SISRE within 1.5x (0.716 to 0.809).

### Findings

The oracle disagreed with these rows, so they stay MODELLED. Each finding is also written into
the row's oracle text (and so into `docs/MODELLED-RATIONALE.md`), with a test that pins it.

- **Onboard clock state estimation:** on held-out IGS clocks of 11 GPS Block IIF satellites
  the three-state filter is consistent one step ahead but over-confident at one hour on 9 of
  11 (periodic and flicker terms are not in the model).
- **Spoofing detection:** on JammerTest 2024 no observable-level monitor alarmed within 10 s
  of any of the 8 published onsets, and three pre-onset windows carried false alarms.
- **Timing protection level under spoofing:** the measured undetected time error exceeds the
  TPL at 3 of 8 detected onsets (1.9x to 5.3x); a 60 s clock calibration does not cover the
  receiver TCXO's wander.
- **Launch-window and ascent geometry:** against Orekit 12.2 the geometry agrees to rounding,
  but the Earth-rotation site speed misses 1e-6 relative at 62.9 deg latitude (1.12e-6, the
  polar motion the spherical model omits). Round 2: the true-pole speed with an epoch agrees,
  the default no-epoch speed still misses (see below).
- **Ballistic re-entry corridor (Allen–Eggers):** the predicted peak deceleration for the
  Stardust entry is 61.8 g against the reconstructed 32.89 g (+88 %, tolerance 15 %).
- **Joint UT1 and polar-motion error:** against the accuracy formula printed in 178 IERS
  Bulletin A issues, the pole agrees within 1.5x but UT1 does not (0.48 at 10 days, 1.59 at
  40 days). Superseded in round 2: the row is now VALIDATED (see below).
- **Offline default Earth-orientation input:** astropy confirms the row census, but the 12
  rows the crate calls Bulletin A predictions are flagged measured (I), not predicted (P).
  The operational-predictor row's agreement figures were therefore against measured rows.
  Superseded in round 2: the engine classifies rows by flag and the row is VALIDATED.
- **Operational-style Earth-orientation prediction error:** the predictor's UT1 error is 2.4x
  to 12.6x Bulletin A's at 1 to 10 days and 5.32 ms at 10 days, outside the 0.36 to 3.13 ms
  range of the 2nd EOP PCC.
- **Lunar geodetic VLBI:** against ANISE light times through DE440 no delay is within 1 ps;
  the largest gap is 24 µs, mostly the analytic Moon centre (about 200 km from DE440).
  Round 2: the kernel path is VALIDATED in a row of its own; this analytic path stays MODELLED.
- **Lunar interoperability export:** Orekit 12.2 refuses the LTC and TCL time systems, so
  interchange of the lunar OEM files with a second reader is not established.
- **Clohessy–Wiltshire relative motion:** against Orekit nonlinear motion at 100 m the gap is
  1.2 to 6.3 mm, above 1 mm; it scales as the omitted second-order term, so the
  pre-registered tolerance sat below the linearisation error. Superseded in round 2: the
  second-order correction is VALIDATED against the same bar.
- **INS/TRN coasting error growth:** against a NaveGo free-inertial Monte Carlo the growth laws
  hold within 5 % to 600 s and overstate beyond it (2.2x to 8x at one hour), because they
  omit the Schuler feedback. Superseded in round 2: the Schuler error model is VALIDATED.
- **Lunar service volume from real constellation geometry:** 4 of 12 published availability
  statistics differ by more than 2 percentage points (up to 22.5).
- **Heterogeneous UTC(k) traceability-bias overbound:** on 105 024 BIPM rows the overbound is
  exceeded by 50.8 % of rows; the published uncertainty bounds the BIPM's measurement of the
  offset, not the offset.
- **Lunar datum null-space classification:** on the published five-reflector geometry the
  correlation is -0.78 against -0.97, and the origin CRLB is 96 to 98 % below the paper's.
- **Lunar LLR datum geometry substrate:** against 192 ILRS lunar normal points of 2024 the
  one-way residual RMS was 96 m with the earlier orientation interpolation and is 22.7 m after
  the fix below, still above the 10 m bar (rounded station coordinates, no polar motion). The
  orientation series clamps silently outside 2024-2025. Round 2: the measured-range model is
  VALIDATED in a row of its own (2.81 m); the series now covers 2014-2030 and errors outside it.
- **Relativistic clock-rate to frame coupling:** the self-potential term is 3.18e-4 above the
  published value (tolerance 1e-4); the paper evaluates a different potential, so no
  published value of this closed form exists. Superseded in round 2: the degree-2
  equatorial potential is VALIDATED against the same paper.
- **Physical constants of every solar-system body:** 12 of 84 constants of the added bodies
  differ from NAIF pck00011 and gm_de440 (older Mars-satellite elements; other GM solutions
  for Uranus, Neptune and Pluto). Round 2: the constants now follow NAIF (a transcription,
  not counted), and the computed orientation agrees with SPICE; the row stays MODELLED.
- **Selectable LEO ephemeris models:** the 22-parameter fit leaves 1.71x and 1.86x the
  published along-track error on 20 min arcs, above 1.5x. Superseded in round 2: the
  22-parameter model and fit are VALIDATED in a row of their own.
- **Joint GNSS and LEO positioning:** the inter-system bias agrees with RTKLIB, but 93.2 % of
  epochs are within 3 m of ITRF2020 against 95 %; RTKLIB itself reaches 88.2 % on the data
  (93.6 % after the round-2 group-delay fix).
- **Common-mode integrity blindness** and **coverage and DOP maps:** both comparisons passed
  but were declined on review because a deliberately wrong engine also passes them (the
  first only checks an internal identity; the second's published floors cannot see a doubled
  PDOP). Round 2: common-mode integrity blindness is VALIDATED on parity-bearing inputs; the
  coverage maps stay a finding (see below).

### Validation round 2

The second round took every row the first round left routable, with fresh pre-registrations
committed before any fixture was fetched or oracle run, an adversarial second reviewer
who re-ran each comparison and a deliberate engine mutation that must turn each test red.
The owner accepted the corrected wording of the outside-Omega bound row on 2026-10-02 before
it was promoted (its old text contradicted the code).

**Promoted to VALIDATED (17).** Oracle kind in brackets; tolerance fixed before the run.

- **Relativistic clock-rate to frame coupling** (Reference): Ashby and Patla 2024 L_m within
  2.8e-6 (bar 1e-4) from the degree-2 equatorial potential of the two fields the paper cites;
  pyshtools degree-350 gravity for the radial entry (8.3e-5); DE441 lunar speed (2.5e-3).
- **Offline default Earth-orientation input** (Library): astropy 8.0.1 and IERS Bulletin A
  No. 039 confirm the 30 final, 54 rapid and 90 predicted rows of the re-cut extract.
- **Joint UT1 and polar-motion error** (Library): astropy and pyerfa full rotations reproduce
  the joint table (UT1 and pole within 6e-16, the combination within 1.9e-7); the IERS Annual
  Report 2019 realised errors give ratios 1.001 to 1.100.
- **EO payload footprint and coverage** (Library): Orekit 12.2 and GeographicLib 2.1 at every
  pre-registered bar, with the J2 nodal regression now in the node spacing.
- **Clohessy–Wiltshire relative motion** (Library): with a closed-form second-order correction,
  within 1.2e-7 m of Orekit nonlinear motion against 1e-3 m; the linear matrix alone stays
  characterised (1.2 to 6.3 mm).
- **B-plane targeting and patched-conic gravity assist** (Library): GMAT R2026a B-plane,
  asymptotes, C3 and heliocentric elements; sbpy 0.6.0 and Kasuga and Jewitt 2019 for the
  Tisserand parameter.
- **INS/TRN coasting error growth** (Library): a nine-state Schuler error model within 5 % of
  corrected NaveGo coast runs at all 48 points (worst 3.70 %).
- **Common-mode integrity blindness** (P2): numpy `lstsq` on 1464 parity-bearing inputs within
  1e-12 (worst 1.06e-14).
- **Lunar joint multi-technique OD and clock** (P2): numpy recomputes every Gauss-Newton step,
  sigma and station error on six networks (within 2.4e-11) after a QR solve fix.
- **Lunar-VLBI station-coordinate covariance** (Library): a SPICE-built Jacobian reproduces the
  schedule, spectrum, sigmas and null space within 1 % and 0.1 deg; numpy to 2e-13.
- **Residual-outside-Omega undetectable common-mode bound** (P2, wording corrected by owner
  decision): numpy LAPACK on 256 cases within 1e-12, six exact infinities.
- **Basis-invariant null-space classification** (P2): SciPy and NumPy subspace intersection on
  72 constructed matrices, integers exact, projector norm within 6.0e-15.
- **Single-frequency ionospheric and UTC services of a LEO navigation message** (Library):
  GNSSTk 15.3.1 for Klobuchar, Az and the UTC drift; ERFA for the three leap-second cases.
- **5G non-terrestrial-network positioning bound** (P1): Bachl, Lei and Nabeel 2026 single-SSB
  bounds within half a printed digit; numpy for the fix covariances.
- **LLR measured-range model** (Measured, new row split from the LLR datum substrate): 192 ILRS
  lunar normal points at 2.81 m RMS against a 10 m bar, with the IERS 2010 barycentric light
  time; the components below the bar are not resolved one by one, and the row says so.
- **Lunar geodetic VLBI, kernel path** (Library, new row split from the lunar VLBI row): SPICE
  converged light times within 1 ps and partials within 1e-6 at epochs near J2000; the
  analytic default path stays MODELLED.
- **Liu et al. 2025 22-parameter LEO ephemeris model and its fit** (Measured, new row split from
  the selectable-models row): real precise orbits within 1.5x of the published statistics on
  paper days and held-out days (0.683 to 1.186); the n_dot scale convention is transcribed and
  not validated by this comparison, and the stop rule is Kshana's parameter-convergence rule,
  not the paper's RMS-change rule. The ATOMIC polynomial and the five-altitude table stay MODELLED.

**Existing VALIDATED rows re-backed (no count change).**

- **Planet positions from the JPL Standish elements** and **light time between solar-system
  bodies**: the post-hoc twice-nominal bars are replaced by pre-registered comparisons with
  JPL Horizons DE441 (RMS at most the Explanatory Supplement Table 8.10.1 figure, worst 0.778,
  the Earth split and the ICRF rotation included; light times within 1e-6 s of Horizons on DE441
  positions, worst 6.7e-9 s). Their "limit set after the comparison" flags are removed.
- **Integrity (RAIM/ARAIM/SBAS)**: the row no longer rests on plausibility checks. It now says:
  the ARAIM multiple-hypothesis solution separation of ADD v4.2 agrees with Stanford MAAST for
  ARAIM 2 on 270 real cases (worst VPL difference 2.2e-3 m against 0.05 m); snapshot RAIM
  detection and exclusion agree with RTKLIB `raim_fde` on 2016 of 2016 decisions, with the slope
  protection level within 2.7e-12 m; the SBAS DO-229E L1 protection levels agree with Stanford
  MAAST on real WAAS broadcasts (2868 pairs within 1.6e-5 m). It states plainly that the
  uniform-sigma functions `raim::araim_raim` and `raim::araim_dual_raim` are NOT ADD-conformant
  (matched-input gaps 0.75/4.04 m and 0.39/1.93 m VPL/HPL, a finding), that the DFMC L5 SBAS
  comparison is a finding (308 pairs with no GEO in view are protected by Kshana and not by
  MAAST) and that `raim::solution_separation_raim` has no external comparison. Its self-flag is
  removed.
- **LEO broadcast-ephemeris fitter**: the integrated truth orbit is added to the validated
  part (Orekit 12.2 within 4.55 mm over 6 h, bar 2 cm); the correction polynomials, the clock
  fit and the update-period trade stay modelled.

**Findings and blocked rows (stay MODELLED).** Each row's oracle text carries the finding and
its pinned test.

- Nav-signal modulation (Betz 2001, Hein 2006): spectra and correlations agree; the 24 MHz side
  lobes and every multipath bias (11 to 15 % low) do not, cause unresolved.
- TDOA/FDOA geolocation: the bounds match Ho and Chan and Ho and Xu, and the authors' code to
  3e-12; the Ottawa factors printed from a Monte Carlo differ by 1.3 % and 4.4 %.
- Earth GNSS at lunar distance: GENESIS zenith means agree with Montenbruck et al. 2023 on 5 of
  6; nadir means are 1.0 to 2.4 satellites high.
- Coverage and DOP maps: Earth designs agree with Orekit, gnss_lib_py and numpy on every bar;
  Moon and Mars designs exceed 1e-9 only on near-singular cells.
- Joint GNSS positioning: dual-frequency 79.9 % and precise products 94.2 % within 3 m against
  95 % (RTKLIB 67.9 % and 94.1 %); the precise-product ISB gap is RTKLIB ignoring antenna offsets.
- Tracking loops (GNSS-SDR 0.0.19): agree at 35 to 45 dB-Hz; at 30 dB-Hz PLL +21 %, DLL -32 %,
  thresholds +1.5 dB; slip times 0.5 to 2 decades shorter.
- Lunar service volume (Orekit and Hipparchus): 155 of 160 values agree; the worst-sample
  requirement fails on near-singular LNCSS B geometry.
- Quantum inertial sensor: the QPN-only floor is 21 to 31 % below Gauguet 2009 measured noise
  (bar 30 %, missed by 0.5 points).
- Oscillator presets: measured units exceed the rubidium holdover, caesium short-term and CSAC
  worst-unit presets; the OCXO preset has no measured record.
- Space-weather density: Jacchia 1971 is within a factor 2 of accelerometer densities at solar
  maximum but about 1.7x too dense in the 2008 minimum.
- Geometry-free slant TEC: 33 of 36 arcs within 3 TECU of the CODE map (worst 6.84).
- Spoofing detection and TPL against the official JammerTest 2024 log: 4 of 10 onsets detected
  in time; the TPL is exceeded at 4 of 10.
- Clock filter on fresh IGS clocks: two of 11 satellites fail the innovation-sum criterion.
- Least-squares plus autoregressive EOP predictor: UT1 1.73 to 2.11x Bulletin A at 2 to 10 days.
- UTC(k) realised-offset overbound: pooled exceedance 0.0333 against 1e-2.
- Lunar frame datum from a campaign: the SPICE leg agrees; the stations-estimated P2 leg misses
  1e-9 on a condition-2.1e8 problem.
- Lunar frame datum from real LLR: 15 of 16 figures agree with SPICE; the z-translation sigma is
  1.03 % high against 1 %.
- Re-entry (Allen-Eggers): the point-mass solution agrees with agency reconstructions (a
  cross-check only); the accelerometer comparison is blocked on a readable Hayabusa2 source.
- ITU-T masks: the printed worked values agree; the G.8273.2 class limits have none (blocked).
- Launch-window geometry: the true-pole site speed with an epoch agrees with Orekit (4.9e-8);
  the default no-epoch speed still misses (1.12e-6). Not promoted; follow-up pending.
- Physical constants of every body: now 0 of 84 differ from NAIF (a transcription), and the
  computed orientation agrees with SPICE to 1.4e-10 rad. Not promoted; follow-up pending.
- Blocked on a scoping decision by the owner, each with its agreeing comparison committed:
  lunar absolute-station observability, surface-beacon DOP, the off-boresight export,
  cross-modality detection power, the common-mode consistency statistic and polar LEO coverage.
- Blocked on data: time-transfer error budgeting (needs a real-data reduction), JammerTest C/N0
  (antenna position and power split not documented).

**Revisions (published numbers that moved, old -> new).**

- `snapshot_raim` protection levels are now on the geodetic local level instead of the radial
  one: up to 0.31 m HPL and 0.14 m VPL at ABMF (16 deg N); no golden moved, but the
  `gnss-sim` tutorial's recorded summary moves from mean HPL 22.1 m / VPL 40.0 m to
  22.2 m / 39.9 m (`docs/tutorials/scenarios/gnss-sim.toml`).
- Lunar rate-frame coupling defaults: d_alpha/d_scale 3.139807e-11 -> 3.138801e-11;
  d_alpha/d_radial 1.807187e-17 -> 1.806185e-17 per metre.
- Offline default EOP run (`realtime-frame-eop`, cells listed in
  `docs/revisions/M035-default-eop-recut-cell-changes.md`): predicted_rows 12 -> 90; pole floor
  0.06776 -> 0.05550 mas; eop_term_m 14.01601 -> 14.01583; total_m 20.09759 -> 20.09746;
  total_time_ns 67.03834 -> 67.03790; the Table 2 rows of `tests/golden/realtime-frame-eop.csv`;
  operational-predictor agreement 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.
- `docs/LEO-NAVMSG.md` liu22 SISRE orbit/with clock: 60 s 0.011/0.046 -> 0.014/0.046 cm;
  300 s 0.068/0.139 -> 0.074/0.142 cm; 600 s 0.269/0.299 -> 0.258/0.290 cm.
- Liu altitude table, Kshana (ratio): GRACE-A 5.40 (0.61) -> 4.25 (0.48); GRACE-C 4.12 (0.66)
  -> 2.87 (0.46); Sentinel-2A 2.95 (1.03) -> 2.20 (0.77); HY-2A 2.38 (1.13) -> 1.25 (0.59);
  Sentinel-6A 0.70 (0.94) -> 0.51 (0.67).
- LEO navigation message `nDot` scale 2^-60 -> 2^-58 (not pre-registered, disclosed; outside
  the fit comparison); the liu22 sample frame CRC 0x62373A -> 0xDED99C.
- `docs/LEO-NAVMSG.md` verification table: the Liu and ATOMIC row split into a VALIDATED
  22-parameter row and a MODELLED ATOMIC and five-altitude row.
- DE440 lunar principal-axis orientation row text: span 2024-2025 / 731 rows -> 2014-2030 /
  6 209 rows; "clamps silently" -> errors outside its span.
- `eo-coverage` scenario: equatorial_ground_track_spacing_km 2756.37 -> 2752.17 km; new fields
  inclination_deg (98.19) and nodal_period_min (98.893).
- `constellation-multi-gnss-coverage` (TDOP/GDOP reference clock now the lowest-numbered
  constellation in view): global GDOP max 2.2236 -> 2.1205, mean 1.122 -> 1.131, median 1.115 ->
  1.125, p90 1.255 -> 1.265, p95 1.305 -> 1.315, p99 1.41 -> 1.42, and the per-cell GDOP map;
  mean_visible_by_constellation summed as integers (about 1e-12 relative, invisible at 4 decimals).
- Joint GNSS single-frequency fix after the broadcast group-delay fix: 93.2 % -> 93.6 % within
  3 m; ISB median -0.351 -> -0.114 ns.
- `tracking-loop` jitter_table log10_mean_time_to_cycle_slip_s (Costas loop SNR rho/4): at the
  25.47 dB-Hz threshold 11.58 -> 2.10; at 25 dB-Hz 9.55 -> 1.60; at 22 dB-Hz 2.24 -> -0.14.
- `ins-trn-coast`: every output moves with the Schuler error model; the shipped scenario's TRN
  peak 52.932679 -> 44.711834 m (`tests/conflict_resilience_architecture_guard.rs`).
- `lunar-vlbi` report: new key geometry_path ("analytic" on the default run, no numeric value
  changed); new optional fields planetary_kernel_path, earth_orientation_kernel_path and
  moon_orientation_kernel_path, with epoch_partials on the kernel path; the kind's description
  is rewritten. The verification row's kernel-path oracle is SPICE (0.06 ps); ANISE (0.12 ps)
  becomes a kernel-evaluation cross-check.
- Body constants: Phobos GM 7.087e5 -> 7.087546066894452e5; Deimos 9.62e4 ->
  9.615569648120313e4; Uranus 5.7939506103e15 -> 5.793951256527211e15; Neptune 6.83509997e15 ->
  6.835103145462294e15; Pluto 8.69326e11 -> 8.696138177608748e11 (m^3/s^2); Phobos equatorial
  radius 13.1 -> 13.0 km; Phobos and Deimos pole and prime meridian from pck00011; the
  solar-system prime_meridian_deg now includes the quadratic and periodic terms.
- `europa-surface-pnt` (`body-pnt` on Europa), from the full pck00011 Europa orientation
  (7cfd66b4; the orientation agrees with SPICE pxform to 1.4e-10 rad), which moves the lander in
  inertial space: availability relays only / with the Earth range 0.485 / 0.725 -> 0.480 / 0.719
  (83 -> 82 of 171 epochs relays only), median PDOP 5.266 -> 5.360, RMS fix error 129.516 /
  100.983 m -> 112.742 / 86.147 m, median formal sigma 5.266 / 4.272 m -> 5.360 / 4.239 m. The
  table in `docs/SOLAR-SYSTEM.md` and the pin in `mcp/kshana-mcp/tests/round_trip.rs` follow;
  `mars-orbit-pnt` is unchanged.
- `space-weather` (f107 180, f107a 165, kp 4), the calibrated factor replaced by Jacchia 1971:
  activity_density_kg_m3 at 300/400/500/600/800 km 2.602e-11 -> 3.608e-11, 4.176e-12 ->
  6.929e-12, 8.136e-13 -> 1.618e-12, 1.769e-13 -> 4.189e-13, 1.544e-14 -> 3.781e-14;
  activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232;
  reference_exospheric_temperature_k removed, mean_exospheric_temperature_k added (1186.7 K);
  `tests/space_weather_reference.rs`: the 800 km solar-cycle swing is now 10.4x (NRLMSISE-00
  13.6x) and the altitude assertion follows NRLMSISE's rise to 500 km and fall at 800 km.
- `ntn-5g-positioning` toa_median_sigma_3d_m: NR 5 MHz 2.0903959 -> 2.0903962 m; NB 200 kHz
  25.938613 -> 25.938839 m (summary text unchanged at 2.09 / 25.94 m).
- `lunar-joint-od-clock` (QR solve): with_vlbi.station_pos_err_m 3.541344 -> 3.541350 m;
  without_vlbi.station_pos_err_m 2183.119 -> 2183.558 m.
- `docs/field-units-schema.json` re-emitted for the new and removed fields above.

### Validation packages

**D12, extended precision and a square-root solver (two new VALIDATED rows: 226 -> 228 rows, 110 -> 112 validated).**

Part 1, extended-precision oracle:

- Lunar frame datum with the stations estimated: a 50-digit mpmath extended-precision oracle
  (pre-registered 804662d5, condition-scaled bars from an a-priori backward-error formula) agrees
  on a new campaign date (2026-03-18) and on the original 2024-01-01 scenario; new VALIDATED row
  under P2. It settles the earlier double-precision dispute: the engine's datum sigmas are off by
  up to 9.7e-6, NumPy's inverse and eigen routes by up to 6.2e-6, and its Cholesky and QR routes
  by about 1e-8. The engine is within its error bound but about a thousand times less accurate
  than a factorisation route.
- Oracle environment: mpmath 1.3.0 added.
- Revisions: none. No golden file or published figure changes; the "Lunar frame datum from an
  observing campaign" row stays MODELLED (founder decision 2026-10-02, option A: it does not
  borrow the separate row's status); its tests text cites the new test and its finding.

Part 2, square-root information datum solver:

- New opt-in square-root information solver (`linalg_sr`; `solver = "srif"` in the
  lunar-frame-campaign scenario): Householder QR, marginalisation through the triangular factor,
  a Jacobi SVD for the spectrum, and compensated products from correctly rounded operations
  only. Against the 50-digit oracle (pre-registered b41908c9) its datum sigmas agree to 3e-13 on
  a new date (2026-06-09); on the 2026-03-18 and 2024-01-01 inputs the default solver is off by
  up to 1e-5. New VALIDATED row under P2. The default solver and its output are unchanged. The
  pre-registered bars certify errors only above about 2e-7 relative: they reject the default
  solver but not a flipped Householder sign, an uncompensated dot product or a spectral final
  inverse, and the row says so.
- Opt-in square-root paths beside the unchanged defaults: `fim::crlb_srif`,
  `batch_ls::gauss_newton_srif`, `orbit_determination::determine_orbit_batch_srif`,
  `lunar_combination::formal_covariance_srif`, `precise_od::fit_srif` and
  `cislunar_srif::srif_cross_validation_sqrt`, on new `linalg_sr::weighted_lstsq` and
  `covariance_from_sqrt_information`. Each agrees with its default where both are accurate (an
  internal check, no row; no validation is claimed for them). `precise_od::fit` now delegates to
  a shared routine; its output and every scenario's default output are unchanged.
- Lunar frame campaign rank decisions: a pre-registered extended-precision check over 40 days
  confirms every decidable station-block and full-rank Helmert decision. The a-priori bound cannot
  certify the 20 rank-deficient Helmert days; in exact arithmetic their defect is geometric, with
  the 1e-9 threshold inside the campaign's natural range of eigenvalue ratios. No row.
- The extended-precision campaign row's claim is narrowed to "within the worst-case bound", and
  its stations-fixed weakest-direction check now measures a real angle (6.6e-16 rad; the
  comparator changed from acos to a chord, the bar did not).
- Revisions: none. No golden file or published figure changes; the "Lunar frame datum from an
  observing campaign" row is unchanged and stays MODELLED (founder decision 2026-10-02,
  option A).

**D4, JPL kernel ephemeris spine, phase 1 (four new VALIDATED rows: 228 -> 232 rows, 112 -> 116 validated).**

- **The NAIF kernel reader has its own row.** `naif_kernel` (DAF container, SPK type 2,
  binary PCK type 2) agrees with the SPICE Toolkit (CSPICE N0067 through spiceypy 8.2.0) and
  with ANISE 0.10.6 on all 600 DE440 states and 200 lunar-orientation rotations of a random grid
  drawn from the pre-registration commit's own hash (abcd9133), inside bars derived beforehand
  from double-precision Chebyshev evaluation (worst 0.6 % of the bar, 1.95e-3 m). The row claims
  that the engine reads JPL kernels correctly, not that DE440 or the analytic series is accurate
  (`tests/naif_reader_spice_oracle.rs`).
- **`ephem_provider::KernelEphemeris`**: DE440 (or any type-2 SPK) positions through the
  engine's own reader, with two-part TDB epochs and the kernel's SHA-256 kept for reports; it
  never substitutes a system barycentre for a planet. `LunisolarSource` lets a geometry path
  choose the analytic series (the default) or a kernel.
- **Opt-in kernel Moon for `lunar-llr-datum` and `lunar-vlbi-fim`**: a `planetary_kernel_path`
  key reads the geocentric Moon centre from the kernel; nothing else changes, and the report
  gains a `moon_ephemeris` block naming the kernel and its SHA-256. Without the key both
  reports are byte-identical to before.
- **Lunar-surface-point covariance on the kernel path** (new VALIDATED row): with every station
  fixed and the beacon on the DE440 Moon, the beacon covariance agrees with a SPICE light-time
  Jacobian (worst 1.7e-3 against a 1 % bar) and a NumPy inverse (4e-14 against 1e-9),
  pre-registered 4a51256 (`tests/lunar_vlbi_surface_point_spice_oracle.rs`). The analytic-path
  row stays MODELLED: on the analytic Moon its smallest beacon sigma is 3.9 % below the oracle.
- **Lunar frame datum from a real campaign, kernel Moon centre** (new VALIDATED row): on 447
  unseen 2019-Q2 normal points, pre-registered 830d945a before any was fetched, the datum
  covariance on the kernel path agrees with the unchanged SPICE and NumPy oracle within 7.6e-5
  against 1 % and 2 % bars (`tests/validate_llr_datum_kernel_moon_fresh.rs`). The founder
  decided that this row promotes only on fresh points; the seen-data diagnostic (c51f8b2) is a
  finding, not evidence. The bar does not discriminate Moon models: the analytic Moon also
  passes on the same slice (worst 3.8e-3), the planned mutation (the kernel Moon one hour late)
  was not detected, and at the fold a Moon centre about 4,650 km wrong (the Moon taken about the
  Earth-Moon barycentre) also passed. The row claims the covariance on that path, not the Moon
  centre, and says so.
- **Sun, Moon, Mercury and Venus positions from DE440 at UTC epochs** (new VALIDATED row):
  `KernelEphemeris::relative_position_utc` agrees with Skyfield 1.54 on 600 positions between
  1973 and 2026, worst 2.96 m, inside a pre-registered bar (0bfafe6d) set by the two-term
  TDB − TT series (`tests/kernel_ephemeris_skyfield_oracle.rs`). Planet positions get this new
  kernel row now; the Standish row and the planetary-moons row are unchanged, and the moons wait
  for a scenario that needs them (founder decision).
- Findings: the LLR datum comparison's one miss (z-translation sigma 1.025 % against 1 %) falls
  to 0.049 % when only the Moon centre is read from DE440, on seen data
  (`tests/validate_llr_datum_kernel_moon.rs`); on the fresh 2019 slice the analytic Moon passes
  too, so the 2015 miss was marginal to that quarter's geometry. The analytic rows "Lunar frame
  datum from a REAL observing campaign" and "Lunar-surface-point coordinate covariance … kept
  distinct from the Earth-station one" stay MODELLED; their oracle texts now point at the
  kernel-path rows.
- `lunar_ephemeris` no longer says the engine has no binary-kernel reader; it points at the
  reader row and explains why spacecraft kernels (types 13 and 21) still come through Horizons.
- Revisions: none. No golden file, published figure or existing test value changes; the
  analytic `lunar-llr-datum`, `lunar-vlbi-fim` and all-stations-fixed `lunar-vlbi-fim` reports
  are byte-identical to before (result SHA-256 prefixes 9927aac2, cf1d2671, 25c357e4).

**D9, measured clock library "Clock Atlas" (three new rows, one VALIDATED: 232 -> 235 rows, 116 -> 117 validated).**

- **Measured clock library (`clock_library`).** Device cards (white phase, white, flicker and
  random-walk frequency modulation, a linear frequency drift and, optionally, once- to
  four-per-revolution phase terms) fitted to a named measured clock record and scored on held-out
  data; gap-aware Allan and Hadamard variances; a conditioning detector that logs every gap, phase
  outlier, phase step, burst and frequency step and knows nothing of file or day boundaries;
  conversion of a card to the slot-timing noise model, the extended Kalman clock model and the
  spoofing monitor's noise levels. Readers for RINEX and IGS clock files, BIPM per-laboratory
  files and Circular T Section 1 (`realdata::clk`); a pooled, hierarchical ageing bound for
  UTC(k) (`utck_bound`, not yet scored).
- **Lag-1 autocorrelation noise identification** (`allan::lag1_noise_id`, Riley and Greenhall
  2004), new VALIDATED row (Library): agrees with allantools 2024.6 `autocorr_noise_id` on 140
  cases, integers identical, worst difference 9.6e-13 against a 1e-9 bar (pre-registered
  2ec76864; `tests/clock_library_lag1_noise_id_allantools.rs`).
- **Measured device cards with held-out prediction**, new MODELLED row (a finding): fit on one
  third, predict the Allan deviation of the other two thirds within a factor of 1.5
  (pre-registered 2ec76864). GPS Block IIF on a fresh IGS window (2026-03-01 to 14): 10 of 11;
  G27 is optimistic at the two-hour scale (worst factor 1.510). Caesium (within, 1.070), OCXO
  (outside, 2.348) and strontium (within) are reported, not blind. The JammerTest receiver card
  and the Galileo maser and Deep Space Atomic Clock cards are blocked. A ZED-F9P receiver TCXO
  model class on 12 static Wroclaw stations (Zenodo 6488497) fails: 1 of 11 blind stations in a
  disclosed corrected re-run (`tests/clock_library_device_cards_oracle.rs`,
  `tests/clock_library_f9p_cards_oracle.rs`).
- **GPS Block IIF cards with per-revolution terms**, new MODELLED row (a finding): on a second
  fresh window (2026-04-01 to 14) 9 of 11 within the bar; G03 (1.947) and G25 (1.581) are
  optimistic because their held-out records are noisier than their fit thirds; dropping the
  periodic terms fails all 11 (pre-registered fb475550;
  `tests/clock_library_periodic_cards_oracle.rs`).
- **M002, onboard clock state estimation, round 3** (a finding, stays MODELLED): after the frozen
  conditioning detector, the round-2 extended filter, tuning and criteria unchanged meet (a) and
  (c) on all 11 satellites for the first time; (b) fails on G09 (0.894) and G26 (0.876)
  (pre-registered fb475550; `tests/clock_state_ext_igs_conditioned_oracle.rs`).
- **M010, spoofing detection, rounds 3 to 4b** (stays MODELLED): round 3 blocked (167 training
  epochs from the JammerTest unit's other sessions against 3600); with a ZED-F9P model-class card
  (rounds 4 and 4b) the clock monitor raises zero pre-onset false alarms at all 10 logged onsets
  (round 2: 86) and 6 of 10 onsets are detected within 10 s (round 2: 4); the same four stay late
  (`tests/clock_library_tcxo_card_jammertest_oracle.rs`).
- **M083, UTC(k) overbound, round 3**: pre-registered prospectively (fb475550) on Circular T
  issues from 465, not yet run (`tests/utck_bound_prospective_oracle.rs`).
- Oracle environment: the Wroclaw ZED-F9P record is data-gated under
  `$KSHANA_ORACLES/data/wroclaw_f9p` (CC BY 4.0, about 1.5 GB); the IGS clock fixtures are
  vendored (IGS products, with attribution).
- Revisions: none. No golden file, published figure or existing test value changes; M001
  (holdover re-anchoring) is not acted on because no clock class promoted.

**D8, one validated propagation, frame and time path (three new VALIDATED rows and M131 promoted: 235 -> 238 rows, validated 117 -> 121).**

The Earth-orbit kinds that carried their own two-body, secular-J2 or sidereal-time-only models
now share one path: SGP4/SDP4 element sets with two-part Julian dates, carried to the GCRS and the
ITRS (International Terrestrial Reference System) through the IAU (International Astronomical
Union) 2006/2000A chain, with optional Earth orientation parameters.

- New `sgp4::MeanElementSet`, `sgp4::SgpOrbit`, `sgp4::Eop`, `sgp4::teme_to_itrs_matrix[_eop]`
  and `sgp4::gcrs_to_itrs_matrix[_eop]`; `Sgp4::new_at` and `Sgp4::propagate_at` take two-part
  epochs. New `jd2::Jd2::from_utc_calendar` (SOFA `dtf2d` convention for leap-second days),
  `jd2::utc_to_tai`, `tai_to_utc`, `utc_to_ut1` (through TAI, as SOFA `utcut1`), `tai_to_tt`
  and a two-part `jd2::earth_rotation_angle`.
- The `leo-pvt` polar mode propagates by SGP4 at 2026-01-01T00:00:00 UTC on the IAU chain
  (`leo_fusion::polar::latitude_sweep_at` takes any epoch); the SGP4 Walker generator rotates to
  the Earth-fixed frame through the IAU chain.
- The `passes` kind runs a new apparent pass predictor (`passes::predict_passes_apparent`,
  `apparent_look_angles`): SGP4 on the IAU chain, ITU-R P.834-9 refraction and the downlink light
  time (new `refraction` and `light_time` switches, on by default), Earth orientation parameters
  (`ut1_minus_utc_s`, `xp_arcsec`, `yp_arcsec`, default 0), crossings solved to 1e-7 s and the
  culmination by golden-section search. The geometric `passes::predict_passes` is unchanged.
- `tests/no_private_models.rs` keeps the package's geometry, time and propagation kernels from
  carrying a private Keplerian propagation, secular J2 rates or a sidereal-time-only rotation;
  named fast tiers and physics that is a row's subject are reasoned allowances.
- New VALIDATED row "Two-part Julian dates and leap seconds on the Earth-orbit time path":
  pyerfa 2.0.1.5 `dtf2d`/`utctai`/`taiutc` on 224 instants around all 27 leap seconds within
  1e-6 s (pre-registered e947e69d); worst 1.9e-11 s.
- New VALIDATED row "One Earth-orbit path": TEME positions of 232 element sets against
  python-sgp4 2.24 (Vallado's reference SGP4) within 6.1e-8 m (bar 1 cm), and the GCRS -> ITRS
  and TEME -> ITRS rotations against ERFA `c2t06a`, `pnm06a` and `ee06a` within 2.9e-6 mas and
  0.41 mas (bars 0.1 and 2 mas), with Earth orientation parameters (pre-registered 72ea9eb0).
  Disclosed: the first run failed at 2016-12-31T23:59:59.5 by one second of rotation; UT1 was
  taken from the UTC quasi Julian date on a leap-second day, the engine now goes through TAI,
  and the second run agrees at the unchanged bars.
- M131 "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS"
  becomes VALIDATED: Orekit 13.1.8 takes the engine's GCRS states, rotates them and computes
  visibility and DOP (NumPy for multi-clock groups); positions within 6.8e-5 m (bar 0.2 m),
  in-view counts identical on 4040/4040 samples, median DOP within 2.3e-11 relative.
- New VALIDATED row "Apparent ground-station pass prediction with refraction and light time":
  Orekit 13.1.8 propagating the same element sets in a TEME it builds to the stated definition,
  with ITU-R P.834 refraction and its light-time measurement model, over 60 cases at sea-level
  stations: 1210 passes, crossings within 3.4e-6 s (bar 5 ms), maximum elevation within
  5.5e-7 deg, apparent direction within 8.8e-7 deg (bar 1e-4 deg).
- Findings, kept pinned: the first full-claim comparisons against Orekit end to end missed their
  position and direction bars, not because of the engine but because Orekit 13.1.8's SDP4
  departs from the reference SGP4 for circular (e = 0) deep-space orbits (up to 67 m) and its
  default TEME is built on the IERS 1996 (IAU 1980) nutation, about 72 milliarcseconds from the
  IAU 2006/2000A chain (2.7 m at LEO). Orekit's ITU-R P.834 coefficient of h*theta0^2 is
  0.011380 where the Recommendation prints 0.01380; the comparison is at sea level, where the
  term vanishes, and the difference above it is pinned.
- "Ground-station pass prediction (ground segment)" stays VALIDATED with its claim narrowed to
  the geometric `passes::predict_passes`; the `passes` kind belongs to the new row.
- Oracle environment: Orekit 13.1.8 with Hipparchus 4.0.3, pyerfa 2.0.1.5, python-sgp4 2.24
  (`xval/d8-orekit13/setup.sh`).
- Revisions: bundled `scenarios/passes.toml` total access 1675 s -> 1659 s (five passes as
  before; best maximum elevation 73.25 deg -> 70.08 deg), and every `passes` output moves with
  the new path (the printed line in `docs/examples/multi-tool-pipeline.md` and the `passes`
  entry of `docs/CAPABILITY.md` now say so); bundled
  `polar-arctic-leo-coverage` GNSS VDOP at the equator 1.19669 -> 1.19710, at 89.9 deg
  1.50645 -> 1.50590, fused VDOP at 89.9 deg 1.14388 -> 1.14250 (the published two-decimal
  figures 1.20, 1.51 and 1.14 are unchanged). No golden file changes.
- Not routed yet: `leo_pass`, the doppler, joint and timing `leo-pvt` modes and the
  `leo_navmsg` truth orbit (their models live in `leo_link::geometry` and `leo_fusion::geom`),
  and Earth designs in `constellation-design` (a named two-body fast tier).

**D6, LunaNet AFS reference generator, LSIS V1.0 (four new rows, two VALIDATED: 238 -> 242 rows, validated 121 -> 123).**

- **LunaNet Augmented Forward Signal (AFS) reference generator** (`lunar_afs`), pinned to the
  LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 of 29 January 2025 and naming that
  version in every output: the 2492.028 MHz carrier; the AFS-I BPSK(1) data channel at 500
  symbols per second with its 2046-chip Gold code; the AFS-Q BPSK(5) pilot with its 10230-chip
  Weil primary, 4-chip secondary and 1500-chip tertiary codes; the frame identifier 0 frame
  (synchronisation pattern, BCH (51, 8) subframe 1, CRC-24, rate one-half LDPC subframes 2 to
  4, 60 by 98 block interleaver) with an exhaustive subframe-1 decoder and a min-sum LDPC
  decoder written from the parity-check matrix alone; and baseband IQ synthesis with truth
  labels written as a SigMF recording. Codes are generated from the standard's shift registers
  and Legendre/Weil constructions. Nothing copied from the standard is redistributed (it
  carries no reuse terms): the AFS-Q primary indices come from IS-GPS-800J, and what only the
  standard's attachments define (AFS-I G2 delays, tertiary codes, LDPC submatrices) is read at
  run time from a local cache that `xval/lunar-afs/fetch_lsis.sh` fills from the NASA-hosted
  PDF, every file checked against a pinned SHA-256 (`lunar_afs::lsis`). The model is a
  conformance reference, not a channel, propagation or link-budget model.
- `sigmf::meta_to_json_with_extensions` and `sigmf::annotation_extension_fields`: a recording
  can carry namespaced extension fields declared in `core:extensions`.
- New VALIDATED row "LunaNet AFS baseband rendering against an independent generator, given
  its channel state": against LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, S-band build), zero
  chip mismatches over the codes of PRNs 1 to 210, zero symbol mismatches over the three frames
  of the run, and a normalised complex correlation of 0.999990 over 23.9 s of its own samples
  (worst 2 ms block 0.999948), inside bars fixed before the comparison (pre-registered
  986ac280). It drives the renderer with the simulator's own channel state and does not cover
  the power split from the carrier-to-noise density or the SigMF and 8-bit writing.
- New VALIDATED row "LunaNet AFS frame channel coding, FID 0": the 6000-symbol frames equal
  LANS-AFS-SIM's symbol for symbol (pre-registered 986ac280); the subframe-1 code reproduces the
  LSIS Figure 8 worked example and the CRC-24 the CRC-24/LTE-A catalogue check value.
- Both promoted rows are data-gated on the LSIS cache: their oracle test skips with a notice
  until `xval/lunar-afs/fetch_lsis.sh` has been run.
- Finding (new MODELLED row), "LunaNet AFS spreading-code generation": of 2 937 232 generated
  chips and bits compared with the standard's tables and Annex 3 files, one differs, the "last
  24 chips" Table E-5 prints for tertiary PRN 147, which duplicates the PRN 151 cell while the
  standard's own Annex 3 file agrees with the generator. The zero-mismatch criterion is missed.
- Finding (new MODELLED row), "LunaNet AFS closed-loop decodability": three pre-registered runs
  against PocketSDR-AFS; the third met its tracking and decoding bars in full but not its guard
  that a print-only receiver build reproduces the pinned build's log, because two runs of the
  unmodified receiver already differ in their acquisition records.
- Fixed: the default carrier of `lunar_service` (`export_antenna.carrier_hz`), `lunar_jamming`
  and `attack_surface` was a rounded 2.4 GHz; it is now the LSIS-020 AFS carrier,
  2492.028 MHz. At the old default free-space loss was understated by 0.327 dB.
- Revisions: none. Every bundled scenario names its carrier, and the results of all 138
  scenario files are byte-identical to the previous main.

**D7, real lunar IQ and GPS LNAV (seven new rows, none VALIDATED: 242 -> 249 rows, validated 123 unchanged).**

- `portable_math::FftPlan`: a mixed-radix fast Fourier transform (FFT) whose output is the same
  bits on every platform; a SHA-256 pin of the 8000- and 24000-point transforms passes on
  x86_64 and on wasm32-wasip1 (runner in `xval/portable-fft-wasm/`).
- `acquisition`: parallel code-phase search on sampled IQ (`pcps_acquire`, `pcps_grid`) with
  coherent folding, non-coherent accumulation, a chi-square threshold for a search-wide
  false-alarm probability and a cell-averaging statistic for band-limited noise; `refine`,
  `prompt_series` with code Doppler, and the M2M4 and grid-peak carrier-to-noise density (C/N0)
  estimators.
- `gps_lnav`: an IS-GPS-200 legacy navigation message (LNAV) encoder for subframes 1 to 3, with
  the Table 20-XIV parity and a field decoder.
- `realdata::ion_sdr`: a reader for the ION GNSS SDR Metadata Standard (`.sdrx`) and its sample
  files, with `to_mid_rise` for two's-complement levels.
- `realdata::lugre`: the LuGRE (Lunar GNSS Receiver Experiment) IQS batch header, RAW, ACQ and
  NAV telemetry and CLK files, and a check that lists where `.sdrx` metadata contradicts the
  binary header.
- `antenna::GainPattern2D` and, in `earth_gnss_lunar`, the yaw-steering body frame, transmit
  azimuth and off-nadir angles, and `transmit_side_db` for relative C/N0 with measured patterns.

- GPS LNAV navigation-message encoding (new row, stays MODELLED after the integrator's
  post-verification): on the IGS broadcast file of 2 March 2025, parsed and decoded by RTKLIB
  v2.4.2-p13, all 960 words pass parity, all 96 subframes decode and all 608 broadcast integers
  equal Kshana's (`tests/gps_lnav_rtklib_integer_oracle.rs`), but the pre-registration
  (d4d9eb9d) reached the public branch two seconds after the commit holding the result, so the
  order "registered before the file was fetched" cannot be shown and the row is not promoted.

- `realdata::ion_sdr` fills words from the most significant bit (I in the high nibble of a LuGRE
  byte; the earlier reading produced the conjugate signal), keeps the old reading as
  `SdrLayout::fill_lsb_first`, and reads samples wider than a word.
- `acquisition::refine_doppler_coherent`: phase-coherent Doppler refinement (0.2 Hz RMS at
  30 dB-Hz over 200 ms in simulation).

- GPS L1 C/A against gps-sdr-sim: chips and parity bit-exact; 230 of 1152 LNAV fields differ by
  one unit because gps-sdr-sim truncates where the broadcast integer needs rounding.
- LNAV decoded by RTKLIB: all parity and subframes pass and every parameter is within half a
  quantum; 41 scaled values differ by a few units in the last place through RTKLIB's decimal
  2^-43 constant, above the registered bar.
- LuGRE acquisition against GNSS-SDR 0.0.19: 266 of 266 decisions agree, 250 located on the same
  cell; most positives are artefacts of a −0.5 mean in the bare 4-bit levels; the C/N0 leg had no
  contemporaneous flight data. Two batches (OP5, OP12) were excluded in error: their metadata
  agrees with their headers, but the reader could not then read a sample wider than a word.
- LuGRE acquisition against orbit-predicted Doppler: with the sample-power decision every search
  crosses on band-limited noise; with the cell-averaging decision the strongest pairs agree in magnitude with
  the sign reversed, showing the registered I/Q order to be the conjugate of the data.
- Blind acquisition on the lunar-surface batches: four batches each acquire one satellite
  (predicted visible, no false alarm at 1e-7), none two, so the Doppler-difference bar has no
  pair to score.
- Relative C/N0 at lunar distance (M039 restated): 15 Block IIR/IIR-M records and one pair, too
  few for the registered bar.

- Revisions: none; no published number, golden file or docs figure changed.
- The M039 row "Earth-GNSS at lunar distance" restates its claim at lunar distance as the
  relative C/N0 between satellites at one epoch plus visibility (absolute C/N0 is not claimed);
  it stays MODELLED. The top-level NOTICE carries the LuGRE CC BY 4.0 attribution.

### Fixed

- The DE440 lunar principal-axis orientation is now interpolated along the geodesic between
  daily nodes. The earlier element-wise interpolation was in error by up to 2.0e-4 rad
  (340 m at the lunar surface) near the quarter points of each day, not the "about 14 m" the
  row stated. Its users (lunar laser-ranging geometry, lunar datum, lunar fault observability)
  get the corrected orientation.
- Round 2 engine fixes, each re-run against its unchanged pre-registered tolerance: the IERS
  vintage of an EOP row is read from its I/P flags rather than from a blank Bulletin B block;
  `snapshot_raim` uses the geodetic local level; the lunar rate-frame coupling uses the
  equatorial radius, J2 and rotation; the liu22 fit starts at zero corrections without priors
  and uses the paper's mean-motion rate; the EO node spacing carries the J2 nodal regression;
  the Costas cycle-slip time uses rho/4; the joint fix applies the broadcast group delay of the
  pair; the lunar joint solve uses a QR step; the NTN bound is evaluated at the true position;
  the constellation-design clock reference is the lowest constellation in view; the DE440
  orientation series spans 2014-2030 and errors outside it instead of clamping.

### Added

- `leo_navmsg::truth::TruthOrbit::from_ecef_states`, a truth orbit built from tabulated
  Earth-fixed states, used by the real-orbit fitter comparison.
- The test files and fixtures of the comparisons above, each with its generator and a
  `NOTICE.md` giving source, licence, retrieval date and SHA-256.
- Round 2: `araim_reference::add_v42_protection_levels` and `_ecef` (ADD v4.2 fault detection,
  following Stanford MAAST for ARAIM 2, BSD-3 notice in the source); `raim::snapshot_raim_fde`;
  `cw_dynamics::second_order_correction` and `propagate_second_order`; the nine-state INS error
  model `inertial::coast::ErrorDynamics`; `lunar_vlbi::KernelGeometry` partials and the
  kernel-path `lunar-vlbi` inputs; `naif_kernel`, a reader for SPK type 2 and binary PCK
  kernels; `lunar_llr_geometry::llr_bcrs_one_way_m` with ITRF2020 stations; Jacchia 1971 density;
  `solar_system::link_on` over any ephemeris provider; `launch::site_rotation_speed_at`;
  `eo_payload::j2_nodal_period` and `ground_track_spacing_equator_j2`;
  `batch_ls::gauss_newton_qr`; `precise_products` (RINEX clock, ANTEX and DCB readers).

## [0.29.3] - 2026-10-01

A patch release on 0.29.2. Kshana Studio is rebuilt around two views: a Simple view
that answers first and explains in plain words, and an Advanced view with the full
dashboard. Two small fixes on kshana.dev come with it. The engine does not change:
every bundled scenario gives a byte-identical result to 0.29.2 apart from the version
stamp.

### Changed

- **Kshana Studio has a Simple view.** It is what the Studio opens on.
  - The answer comes first: a scenario opens on its result, stated in one plain
    sentence. Every bundled scenario has its own sentence, written for what that
    scenario measures.
  - At most five settings are on show, the ones that change the answer most. The rest
    are under "Advanced settings", folded away until you open them.
  - "How this is computed" explains the method in a few lines, and "For researchers"
    gives the engine's own figures, the scenario file and the evidence behind the
    result.
- **The full dashboard is the Advanced view.** Every panel, chart, export and report of
  the earlier Studio is there.
- **A switch moves between the two views and keeps your place.** The scenario, the
  view you were on and any settings you edited carry over. The Studio remembers which
  view you used last. Links from the site and the documentation open the Simple view;
  a link with `view=advanced` opens the Advanced view, and every earlier Studio link
  still opens the same scenario and view.
- **A faster first view on slow connections.** The recorded answer for a scenario is
  drawn before the rest of the Studio loads, so on a slow mobile connection the answer
  shows in about two seconds instead of about nine.
- **Better search.** A search now lists scenarios whose area or title matches the words
  first, ahead of scenarios that only mention them in the file name or text.

### Fixed

- **The home page globe no longer goes blank with reduced motion on.** With the system
  setting for reduced motion on, resizing the window could leave the hero globe empty
  until the page scrolled. The globe now redraws in the same frame as the resize.
- **The L-band console on the home page explains its empty band.** In "Watch a jammer
  take the band" the GPS L5 / Galileo E5a panel stayed dark for the whole minute, which
  read as broken. No jammer transmits in that band in this scenario, and the satellite
  signals sit below the noise floor, so nothing there rises above it. A quiet label now
  says so in any panel stretch with nothing above the floor (the L5 / E5a panel, and the
  L2C panel before its noise jammer starts), with each band's C/N0 and lock state from
  the same run. It is placed only where nothing is above the floor, so it never covers
  jammer energy.

## [0.29.2] - 2026-10-01

A patch release on 0.29.1. It removes duplicated code in the LEO navigation-message,
fusion and spectrum modules, adds a light theme to kshana.dev, moves Kshana Studio to
its own address, makes the site readable by search engines and AI assistants, fixes
several small things in the Studio, and lets npm releases publish without a stored
token. No engine output changes: every bundled scenario gives a byte-identical result
to 0.29.1 apart from the version stamp.

### Added

- **A light theme for kshana.dev.** Every page can be read light or dark. The site
  follows the reader's system setting and has a switch to change it.
- **Search engines and AI assistants can read the site.** Each page now has its own
  title, description, canonical address, social-card tags and schema.org structured
  data, and plain text for the sections a script draws. The site publishes
  `robots.txt`, a `sitemap.xml` with the date each page last changed, `llms.txt` and
  `llms-full.txt` (a short and a full plain-text guide for AI assistants), and an
  IndexNow key so a deploy can tell search engines what changed.
- **npm releases can publish without a stored token.** The npm job now runs Node 24 and
  npm 11.5.1 or later, which support npm trusted publishing: npm exchanges the release
  job's GitHub identity for a short-lived credential. The `NPM_TOKEN` secret still works
  and is used while it is set, so nothing changes until trusted publishing is turned on
  for the package on npmjs.com. `docs/RELEASING.md` lists the steps.

### Changed

- **The home page headline is readable over the globe.** A soft shade now sits behind
  the headline and its text, fading the orbit lines and satellite dots of the animated
  globe where they cross it.
- **Kshana Studio has its own address: <https://kshana.dev/studio/>.** Every link on the
  site and in the documentation points there. The old address, `/playground/`, still
  works and forwards to the new one with the scenario, view and other settings in the
  link kept.
- **Studio fixes.** The engine file is downloaded once instead of twice. While it
  downloads, the Studio shows the scenario's recorded result at once, labelled as
  recorded, instead of an empty screen. On a phone the header is one compact row. The
  key figures wrap two to a row, so none is hidden off the side of the screen. Field
  labels use the scenario's own words, with the field name beside them, and search
  finds fields by either.

- **Less duplicated code.** The LEO navigation-message units table wrote the same ten
  SISRE statistics rows for four fit summaries. A macro now writes them once. The two
  spectrum waterfall charts share one time axis, colour bar and C/N0 bar panel. The main
  grid's downsampling reuses `downsample_grid`, and the Simpson integral reuses
  `navsignal::simpson`. The LEO pass kind's two entry points share one setup step.
  `leo_link::geometry` imports the `leo_fusion::geom` vector helpers instead of copying
  them. The advanced report imports the API report's HTML escape instead of copying it.
  Every one of the 139 scenario files in `scenarios/` was run on 0.29.1 and on this
  code, and every output file is byte-identical.
- **The leo-navmsg and leo-pvt units tables have their own files.** They moved out of
  modules that also hold logic, into `src/leo_navmsg/units.rs` and
  `src/leo_fusion/pvt_units.rs`. `PVT_UNITS` keeps its public path. Only these two
  table files join the copy-paste-detection exemptions for declarative catalogs in
  `sonar-project.properties`, which `tests/sonar_cpd_exclusions_are_justified.rs` checks.

### Fixed

- **The README's CI badge shows the result of pushes to main.** The badge counted runs of
  every event on main, so it could read "failing" while every push run was green; it now
  asks for push runs only (`event=push`).

## [0.29.1] - 2026-10-01

A patch release on 0.29.0: the measured coverage figure, the project's name line on
kshana.dev, a faster coverage job, and a refreshed README. No engine output changes:
every scenario gives the same result as on 0.29.0.

### Revisions to published numbers

- **Line coverage: ~96 % → ~95 %.** The coverage job re-measured the released 0.29.0
  code (commit `db796dd`, CI run 36809850252, 2026-10-01): **95.35 %**, 55,970 of 58,697
  lines of `src/`. The published figure was 95.63 % (37,697 of 39,419 lines), measured on
  `b1d350d` before 0.28.0; it rounded to ~96 %. The new figure rounds to ~95 %, so every
  surface `tests/coverage_figure_doc_sync.rs` pins moves together: `docs/COVERAGE.md`, the
  README badge, Evidence line and CI table, the crates.io, PyPI and npm badges, the
  technical report and the kshana.dev coverage page. The 85 % floor is unchanged.

### Added

- **The name line on kshana.dev.** "Kshana · क्षण · the precise instant" now opens the Home
  hero and sits under the brand in every page's footer. kshana.dev still makes no request
  to another host: the Devanagari is a self-hosted Noto Sans Devanagari subset of the
  three letters of क्षण (1,692 bytes, `web/fonts/`, with its SIL Open Font License text and
  its SHA-256 in `web/fonts/FONTS.json`). `web/tools/fetch_third_party.py` learned to save
  a Google Fonts `text=` subset under a content-addressed file name.

### Changed

- **The site's links land where they point, at clean addresses.** A link to a section now
  puts that section just under the header, on a phone and on a desktop: a Missions sector
  link opens that sector with its panel at the top; Capabilities and Editions links hold
  their place while the charts above them draw; Editions no longer adds a second header
  offset; and a link into a folded part of a docs page opens it. Every page is linked by its
  clean address (`/evidence#research`, `/docs/changelog`, `/` for Home), and the canonical
  links, the sitemap and the old-address redirects name the same; the `.html` addresses
  still work. Research has its own link in the header, between Evidence and Developers, and
  in the footer. The docs no longer show the roadmap (`ROADMAP.md` stays in the repository):
  the Project group is Changelog, Licensing, Security, Contributing, Governance and Code of
  conduct, and the Glossary moved to Get started.
- **The coverage job is faster.** On 0.29.0 it took 143 minutes against a healthy 91 to
  94. The `tests/property.rs` fuzzer, the cause the last time, took 4 of them. The bundled
  corpus grew from 74 to 139 scenarios, and three test binaries walked all of it one file
  at a time (`determinism` twice, `advanced_report` and `animation` once): 37 minutes
  together under coverage instrumentation, against 3 on 0.27.2. They now share
  `tests/support/corpus.rs`, which runs the per-scenario work on every core and hands the
  results back in sorted order; every scenario and every assertion stays. On an arm64
  laptop, debug build: `determinism` takes 143 s on 14 cores
  against 612 s with `KSHANA_CORPUS_THREADS=1` (the old serial walk).
- **The README, refreshed.** It opens with the same name line as the site; the Studio
  screenshots are retaken from the 0.29.1 Studio, with a new one of the Studio on a phone
  and its bottom step bar; a new "The site" strip shows three pages of kshana.dev from the
  0.29.1 build (`tools/capture_site_shots.mjs`, composed by `tools/readme_shots.py` and
  recorded in `docs/assets/readme/site/SHOTS.json`); the coverage figure reads ~95 %; and
  the research figure's alt text, which repeated the architecture figure's, now describes
  the papers. The header badges are smaller and shorter (18 px high; "~95%", "83/223",
  "quality", "AGPL-3.0", "zenodo.20528627"), so the eleven fit on two lines; every link and
  alt text keeps its full meaning.
- **The container image job gets 90 minutes.** At v0.29.0 the `kshana-mcp` image's
  emulated linux/arm64 build hit the old 45-minute limit while compiling its last crate,
  so the image, the MCP registry entry and the channel check did not publish. The
  limit is now 90 minutes; the image is unchanged.
- **Eight float literals regrouped** in `src/ephem.rs` and `src/sgp4.rs` (`0.323_273_64` →
  `0.323_273_640`): SonarQube Cloud read a last group of `_64` or `_32` as a missing `f64` or
  `f32` suffix (rule S7454). The values are the same numbers, so every result is unchanged.

## [0.29.0] - 2026-10-01

Twelve new scenario kinds and three new ways to read a run. The engine now covers the
radio spectrum, the whole solar system, constellations around any body, campaigns that
chain scenarios into one mission, and positioning, navigation and timing (PNT) from low
Earth orbit (LEO) from the signal to the fix. Every run can also be written as an
animation, a full report and a set of interoperability files for other tools.

Around the engine: a redesigned kshana.dev (a multi-page site, and a new Kshana Studio
dashboard that runs every capability in the browser), a rewritten README, fourteen tools
on the Model Context Protocol (MCP) server, a browser build that gives the same numbers as
the native one, and a public page for Kshana Pro.

| | 0.28.0 | 0.29.0 |
| --- | --- | --- |
| Scenario kinds | 63 | 75 |
| Scenario files (plus one suite manifest) | 77 | 138, of which 132 are bundled for `kshana example` |
| Verification-matrix rows | 174 | 223 |
| of which VALIDATED against an external oracle | 66 | 83 |
| of which MODELLED (stated model, checked for internal consistency) | 104 | 136 |
| of which PARTNER (needs a partner's hardware or data) | 4 | 4 |

Where the growth comes from:

| Area | Kinds | Scenario files | Matrix rows (validated + modelled) |
| --- | --- | --- | --- |
| Spectrum | 1 | 1 | 3 (1 + 2) |
| Solar system and positioning around any body | 2 | 3 | 6 (2 + 4) |
| Constellation design | 1 | 3 | 3 (2 + 1) |
| Campaigns | 1 | 5 | 3 (0 + 3) |
| Maritime, road and rail scenarios | 0 | 5 | 0 |
| Animation, reports, interoperability exports | 0 | 0 | 0 |
| LEO signal designs and the multi-band spectrum | 1 | 4 | 4 (2 + 2) |
| LEO pass and link budget | 1 | 6 | 9 (6 + 3) |
| LEO navigation message | 1 | 5 | 9 (3 + 6) |
| LEO positioning, timing and fusion | 3 | 8 | 8 (1 + 7) |
| LEO end-to-end chain | 1 | 3 | 1 (0 + 1) |
| LEO resilience, focus-area and end-user scenarios | 0 | 18 | 3 (0 + 3) |
| **Total added** | **12** | **61** | **49 (17 + 32)** |

The LEO capability is system-agnostic: it runs on generic, stated parameters and needs no
named system. Named systems are optional presets, each in its own file with its public
source. One preset, Celeste IOD (in-orbit demonstration), uses figures presented at the ESA
NAVISP LEO-PNT workshop, 2026 (ESA is the European Space Agency; NAVISP is its Navigation
Innovation and Support Programme); it lives in one file, `src/celeste_iod.rs`, with its five
repository-only scenarios, so it can be withheld without a source edit, and none of its
workshop figures is repeated in this changelog.

**Read "Revisions to published numbers" before upgrading.** One engine output changes (the
`ephemeris` kind's inertial-frame columns, after a sign fix in the nutation matrix), and
the documentation audit corrected figures that earlier documents had printed.

<details>
<summary><b>Abbreviations used in this entry</b></summary>

Statuses: **VALIDATED** means checked against an independent external oracle (a published
table, another group's software, or measured data); **MODELLED** means a stated model
checked for internal consistency only; **PARTNER** means the check needs a partner's
hardware or data.

| Abbreviation | Meaning |
| --- | --- |
| 3GPP, 5G, NTN | 3rd Generation Partnership Project; fifth-generation mobile network; non-terrestrial network |
| AD, BC | calendar eras (anno Domini, before Christ) |
| AIAA | American Institute of Aeronautics and Astronautics |
| AltBOC, BOC, BPSK, MBOC | alternative binary offset carrier; binary offset carrier; binary phase-shift keying; multiplexed binary offset carrier (signal modulations) |
| ATOMIC | Autonomous Time and Orbit Determination for Microsatellite Constellations (a published LEO ephemeris model) |
| C/A, L1, L2, L2C, L5 | coarse/acquisition code and the carrier and civil-signal names of the Global Positioning System |
| C/N0 | carrier-to-noise density ratio |
| CIO | Celestial Intermediate Origin |
| CLI | command-line interface |
| CRC-24Q | 24-bit cyclic redundancy check (Qualcomm polynomial) |
| CSAC | chip-scale atomic clock |
| CSS, HTML, SVG, XML | Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language |
| CSV, JSON, PDF, TOML, URL | comma-separated values; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; uniform resource locator |
| CW | continuous wave |
| CZML, KML, GeoJSON | Cesium Language; Keyhole Markup Language; Geographic JSON (map and globe formats) |
| DE441 | Development Ephemeris 441 of the Jet Propulsion Laboratory |
| DOI | digital object identifier |
| DOP, GDOP, PDOP, HDOP, VDOP | dilution of precision: geometric, position, horizontal, vertical |
| E1, E5, E5a, E5b | Galileo signal names |
| E3F | a slot name in the Global Positioning System constellation table |
| ECEF | Earth-centred, Earth-fixed |
| EE | equation of the equinoxes |
| EGM2008 | Earth Gravitational Model 2008 |
| EIRP | equivalent isotropically radiated power |
| ERFA, SOFA | Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (reference astronomy libraries) |
| ESA, NAVISP | European Space Agency; its Navigation Innovation and Support Programme |
| FDMA | frequency-division multiple access |
| GCRF, GCRS | Geocentric Celestial Reference Frame; Geocentric Celestial Reference System |
| GLONASS | Russia's Global Navigation Satellite System |
| GNSS, GPS | global navigation satellite system; Global Positioning System |
| IAU | International Astronomical Union |
| ICD, OS SIS ICD, OS SDD | interface control document; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document |
| ICRF | International Celestial Reference Frame |
| IMO | International Maritime Organization |
| INS, MEMS | inertial navigation system; micro-electro-mechanical system |
| IOD | in-orbit demonstration |
| IQ | in-phase and quadrature |
| IS-GPS-200 | the interface specification of the Global Positioning System |
| ISS | International Space Station |
| ITRF, ITRS, PEF, TEME | International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-Earth-fixed; true equator, mean equinox (reference frames) |
| ITU, ITU-R | International Telecommunication Union; its Radiocommunication Sector |
| J/S | jammer-to-signal ratio |
| J2 to J6, J2000 | zonal harmonics of the gravity field; the epoch 2000-01-01 12:00 |
| JPL | Jet Propulsion Laboratory |
| LEO, MEO | low Earth orbit; medium Earth orbit |
| MBSE | model-based systems engineering |
| NEES | normalised estimation error squared |
| NeQuick-G | the Galileo ionosphere model |
| OEM, SP3, TLE | Orbit Ephemeris Message; Standard Product 3 (precise orbits); two-line element set |
| PNT, PPP | positioning, navigation and timing; precise point positioning |
| PSD, SSC | power spectral density; spectral separation coefficient |
| RAIM, SQM | receiver autonomous integrity monitoring; signal quality monitoring |
| RINEX, RTCM | Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services |
| RMS | root mean square |
| RTKLIB | an open-source GNSS positioning library, used here as an oracle |
| SGP4 | Simplified General Perturbations 4 (the orbit model of two-line element sets) |
| SHA-256 | Secure Hash Algorithm, 256-bit |
| SigMF | Signal Metadata Format |
| SISRE | signal-in-space range error |
| SPS PS | Standard Positioning Service Performance Standard |
| SRTM | Shuttle Radar Topography Mission |
| STK | Systems Tool Kit (its `.e` ephemeris file format) |
| STL | Satellite Time and Location |
| SVID | space vehicle identifier |
| T/P/F | a Walker constellation's total satellites, planes and phasing |
| TEC | total electron content |
| UHF | ultra high frequency |
| UTC | Coordinated Universal Time |
| WGS 84 | World Geodetic System 1984 |
| X1, X5 | signal names of the Xona Pulsar system |

</details>

### Revisions to published numbers

A changed published number is a revision and is recorded, never corrected silently. This
release carries one revision to engine output and several to figures printed in the
documentation.

#### Engine output

- **The TEME→GCRS reduction turned by 2·Δψ: the nutation matrix had the sign of Δψ
  reversed.** `nutation::numat` built `Rx(−(ε̄+Δε))·Rz(Δψ)·Rx(ε̄)` where SOFA's `iauNumat`
  builds `Rx(−(ε̄+Δε))·Rz(−Δψ)·Rx(ε̄)`, so `nutation_matrix`, `nutation_matrix_2000a`,
  `teme_to_gcrs` and `gcrs_to_teme` rotated by twice the nutation in longitude, about
  25 arcseconds. Every check on the chain was a property test (proper rotation, round
  trip, a non-zero nutation contribution) that a sign slip passes; the end-to-end
  Vallado test covered TEME→PEF, TEME→ITRF and GCRS→ITRS but not TEME→GCRS. On the
  Vallado example (AIAA 2006-6753, 2004-04-06) the chain missed the published GCRF by
  1 145 m; it now lands 0.11 m from it, and the matrix equals ERFA's `numat` to 1e-14.
  `tests/frame_reference_vectors.rs::teme_to_gcrs_matches_vallado_gcrf` and
  `nutation::tests::nutation_matrix_matches_erfa_numat` both fail on the old sign. The
  CIO (Celestial Intermediate Origin) consistency test in `src/cio.rs` had put the
  resulting ~130 m disagreement down to "≈ 2·EE"; the residual is now 5 cm and its bound
  is tightened from 250 m to 1 m.
  **This moves published numbers, recorded here as a revision:** the `ephemeris` kind's
  `gcrs_r_m` and `gcrs_v_m_s` columns (about 0.8–1.0 km for the bundled ISS (International
  Space Station) scenario; its TEME, Earth-fixed, ground-track, look-angle and Doppler
  columns do not change), and `Propagator::position_in_frame` / `state_gcrs` for the GCRS
  and ITRS frames. No bundled scenario's summary line, chart or golden hash reads these
  columns. The new interoperability exports use the corrected chain: the first
  `orbit-sgp4-gps` satellite's CZML position agrees with an ERFA reduction of the same TLE
  (propagated by the `sgp4` Python package) to 2.3 cm.
- **The `leo-navmsg` kind, natively and in the browser build.** The kind now computes
  every transcendental through one portable mathematics library, so its frame is the same
  bytes on every platform and in every build (under Fixed). Every `leo-navmsg` figure moves
  with it, and the `navmsg` stage of `leo-pnt-chain`. The kind is new in this release, so
  nothing from an earlier release moves, but figures printed before the fix do:
  `docs/LEO-NAVMSG.md`'s check value for the encode-and-decode scenario was `0x110315` and
  is `0x19105F`, and its decoded-message SISRE is 0.129 cm. On kshana.dev, the Missions card
  for `leo-navmsg-fit-interval-trade` showed a worst range error of 1.6 mm with a 60 s fit
  and 40.3 mm with a 900 s fit; the site is now built from this release's engine and shows
  1.8 mm and 46.6 mm.
- **The jamming footprint map on kshana.dev (Missions).** Each of its 875 cells is one run of
  `maritime-strait-jamming` with only the receiver's position changed. The cells are now
  computed from the same three-decimal coordinates that the cell's "open this run" link
  gives Kshana Studio, so a cell shows exactly what its link reproduces. 30 cells' mean
  jammer-to-signal ratio (J/S) moves by 0.1 dB, up or down; no cell's tracking availability
  changes. The engine gives identical results for every cell in 0.28.0 and 0.29.0.
- **Seeded resampling in the WebAssembly (WASM) package.** The browser build drew other
  bootstrap and shuffle indices than the native build from the same seed (under Fixed).
  The `quantum-anomaly-detect` interval of the area under the curve in the browser was
  `[0.9901265, 0.9938305]` and is now the native `[0.99035875, 0.993861]`. No native
  number moves.

#### Figures printed in the documentation

The documentation was audited word by word against runs of this release's engine. Where a
printed figure did not match the run, the document was corrected, and each correction is
listed here, old → new. In every case below the engine output did not change; the document
had misread, mis-rounded or outlived it.

- **Documentation audit of the spectrum, constellation, campaign, animation, report and
  interoperability pages, and a new `docs/SOLAR-SYSTEM.md`.** Every figure was re-run with
  this engine. Two published numbers move:
  `docs/CONSTELLATION-DESIGN.md` gave the 5 000-satellite coverage test as "about 0.13 s in
  a debug build"; that did not reproduce (1.24 s on a loaded laptop), so the page now gives
  the prefilter share the test prints (9.9 % of 19 440 000 pair tests) and the release
  binary's 0.14 s for the bundled `leo-pnt-mega-shell`. The same page gave E3F's crossing
  as "off by 0.050 deg"; no test prints that figure, so the page now states only the
  0.06 deg bar the test enforces and the 7.30 against 7.36 deg derivation behind it. No
  engine output changes.
- **LEO-PNT documents: revised published figures (re-run on this release's engine).**
  `docs/LEO-SIGNAL.md` band trade: the first-order ionospheric delay of `generic-s` is
  3.24 m (was printed 3.25 m) and of `generic-c-wide` 0.77 m (was 0.78 m).
  `docs/LEO-NAVMSG.md` encode and decode: the decoded message's SISRE was printed
  0.119 cm where the run gave 0.122 cm; the page now prints 0.129 cm, the figure after the
  platform-independence fix under Fixed below. `docs/LEO-PASS.md` LEO-versus-GNSS pass:
  32 dB less free-space loss at the pass peak (was "26 to 32 dB"). For the signal and pass
  figures the engine output did not change; the documents had misread or mis-rounded it.
- **Tutorials, the worked pipeline example and the `/kshana-run` command, audited
  against this release's engine.** Revisions to published figures, old → new: the kinds that
  write `<scenario>.table.csv` are six, not four (`leo-navmsg` and `telecom-timing`
  were missing; `docs/tutorials/README.md`, `commands/kshana-run.md`); the cold-atom
  ½bT² crossing in Tutorial 3 is 18,443 s, not 18,440 s; the `oem-interop` round-trip
  error in `docs/examples/multi-tool-pipeline.md` is the measured 4.88e-7 km, not
  "~1e-7 km"; the Tutorial 2 CSAC holdover band is the 2000–3200 s the test asserts,
  not "~2600–4400 s"; Tutorial 1 quotes the SP3 rows and geometry block at the
  precision the engine writes them. No engine output changed.
- **Validation, quantum, SGP4, animation, claims and integrity pages.**
  `docs/VALIDATION.md`: the enforced gate on the simulated one-second Allan deviation of a
  white-frequency-noise clock is 20 % (was printed 25 %; the 25 % gate is the one on the
  curve at 1, 10 and 100 s); the velocity-random-walk row now states its enforced 20 % gate
  beside the about 12 % observed; and the chip-scale atomic clock's availability in
  `orbit-gnss-challenged` is about 0.73 (was printed about 0.83).
  `docs/QUANTUM.md`: the vibration-limited per-shot noise in the page's worked cold-atom
  example is about 46 times its shot-noise floor (was "~45×"; 46.49 recomputed), and the range
  "1–50 µg/√Hz" for fielded devices, which contradicted a device the page itself cites,
  is replaced by the two cited devices' published figures.
  `docs/SGP4-VALIDATION.md`: the worst position difference is 4.12 mm (was "≈ 4 mm"), with
  the satellite named.
  `docs/ANIMATION.md`: the video-encoder example read the 24 frames-per-second frames at 12;
  it now uses 24, the rate the frame manifest states.
  `docs/CLAIMS-VS-REALITY.md`: the jamming model has 10 tests (was 8), and the coupled
  filter's "2.97 m against 48.8 m" is replaced by what its test asserts (the coupled
  position error below 0.6 times the decoupled one, winning at least 90 of 100 trials).
  `docs/INTEGRITY.md`: the "Today" stamp read v0.22.0; it now names this release, and two
  capabilities built since (the constellation-wide fault mode and the integrity support
  message) leave its gap list.

### Added

#### Spectrum

- **`spectrum` scenario kind: an L-band spectrum model and waterfall**
  (`src/spectrum.rs`, `src/sigmf.rs`, `docs/SPECTRUM.md`). The whole GNSS L band as one
  power spectral density (PSD): GPS L1 coarse/acquisition (C/A) and L2 civil (L2C)
  (BPSK(1)), Galileo E1 (multiplexed binary offset carrier, MBOC(6,1,1/11), or BOC(1,1)),
  GPS L5 and Galileo E5a (BPSK(10)), a kT noise floor with a receiver noise figure, and
  continuous-wave (CW), narrowband, chirp and matched-noise jammers on a scripted
  timeline. Each jammer is scored per band by its spectral separation coefficient (SSC),
  giving the jammer-to-signal ratio (J/S) and effective carrier-to-noise density (C/N0)
  per band per row. The chart is an SVG waterfall with C/N0 bars; result.json carries the
  grid block-averaged in power. Optional `[iq]` draws the model as IQ samples, writes and
  reads a Signal Metadata Format (SigMF) recording (`cf32_le`, `ci16_le`) and compares a
  Welch estimate with the model; optional `[recording]` estimates a real SigMF file.
  Bundled example `scenarios/l-band-waterfall-jamming.toml`: a chirp takes L1 C/A and E1
  at 10 s, a CW tone on the L1 carrier holds C/A at 17.98 dB-Hz after the chirp stops
  while E1, whose spectrum has a null there, recovers; L5 and E5a are untouched.
  - New VALIDATED row: the signal PSDs and SSCs, against the BPSK(n) main lobe of
    2n x 1.023 MHz, the BOC(1,1) lobes centred at +/-1.023 MHz, the Parseval closed forms
    behind the published -61.8 / -64.8 / -67.8 dB/Hz SSCs, and the textbook Q = 1 (CW)
    and 1.5 (matched). The BOC(1,1) PSD maximum is at +/-0.759 MHz, not at the lobe
    centre; the test pins both.
  - Two new MODELLED rows: the waterfall and C/N0 timeline, which reduce exactly to the
    `jamming` kind's chain (cross-checked in every report), and the SigMF codec and Welch
    estimator. No third-party recording is in the repository.
  - `navsignal`: an MBOC variant and `spectral_separation_coeff_offset`.
  - The report prints the C/N0 the `jamming` kind's representative Q table would give
    beside the spectrum-derived one; for a CW tone on the C/A carrier they differ by
    1.8 dB.
  Three new matrix rows: one validated (signal spectra and spectral separation
  coefficients) and two modelled.

#### Solar system

- **Solar-system ephemeris and positioning around any body.** Two new scenario kinds.
  - `solar-system`: the Sun, the eight planets, Pluto, the Moon, Phobos, Deimos, Io, Europa,
    Ganymede, Callisto and Titan at one epoch: heliocentric position and velocity in the
    International Celestial Reference Frame (ICRF), gravitational parameter, radii, J2 (the
    second zonal harmonic) where published, sidereal rotation, the International Astronomical Union (IAU) pole and prime
    meridian, an orbit track over one revolution, and the light time, one-way and two-way
    range, solar Shapiro delay and Sun separation from an observer body and for any extra
    link. Planets come from the Jet Propulsion Laboratory (JPL) Keplerian elements of Standish and Williams (Table 1,
    1800 AD to 2050 AD; Tables 2a/2b, 3000 BC to 3000 AD); the moons from JPL mean elements
    with the IAU synchronous rotation rate, and Titan from the IAU rotation model.
    Example: `scenarios/solar-system-tour.toml`.
  - `body-pnt`: an orbiter or a surface lander around any of those bodies, navigating with
    pseudoranges from a Walker constellation around the body and a clock-free two-way range
    from Earth; dilution of precision, formal uncertainty and seeded least-squares fixes with
    and without the Earth link. Examples: `scenarios/mars-orbit-pnt.toml`,
    `scenarios/europa-surface-pnt.toml`.
  - `Body` gains Mercury, Venus, Jupiter, Saturn, Uranus, Neptune, Pluto and the seven moons,
    a name lookup and a physical record; `AnalyticSolarSystem` gives any body relative to any
    other through the existing `EphemerisProvider` seam.
  - VALIDATED against JPL Horizons (Development Ephemeris DE441; fixtures and queries in
    `tests/fixtures/solar_system/`): Mercury to Saturn and the Earth from Table 1 within twice
    the stated nominal error (worst 1.87 times), all eight planets from Tables 2a/2b (worst
    1.71 times), and the Earth to Mars and Jupiter light time. MODELLED: Uranus and Neptune
    from Table 1, which exceed the stated error against DE441 (2.0 and 5.2 times), Pluto, the
    moons, the body constants and the `body-pnt` results.
  - Finding: the Montenbruck & Gill lunar series in `src/ephem.rs` is already referred to the
    J2000 equinox by its own precession term (0.05 degrees from Horizons), so it is used
    without a further precession rotation.
  Six new matrix rows: two validated (planet positions, light time) and four modelled.

#### Constellations around any body

- **Constellation design at scale (`constellation-design` kind, `src/constellation.rs`).**
  Walker delta and Walker star patterns (T/P/F), explicit element lists and multi-shell
  designs, several constellations per run, around the Earth, the Moon, Mars or any other planet, Pluto or major moon
  from the body constants the `solar-system` kind added. Presets from published nominal elements: the Global Positioning System
  (GPS) baseline and expandable 24-slot constellation (Standard Positioning Service
  Performance Standard, SPS PS, 2020), Galileo Walker 24/3/1 (Open Service Service
  Definition Document issue 1.1), BeiDou medium Earth orbit Walker 24/3/1 plus
  geostationary and inclined geosynchronous satellites (Open Service Performance Standard
  3.0) and GLONASS 24/3/1 (Interface Control Document 5.1). Coverage and dilution of
  precision (DOP) over a latitude/longitude grid: satellites in view, GDOP, PDOP, HDOP and
  VDOP (geometric, position, horizontal, vertical) and availability per cell, globally and
  at the worst site, with one receiver clock per constellation. A visibility prefilter
  (coverage half-angle plus a sub-satellite latitude band, exact on a spherical body) runs
  5 000 satellites on a 10 deg grid in about 0.13 s in a debug build.
  - VALIDATED: the Walker generator reproduces Galileo OS SDD Table 23 and the GLONASS ICD
    slot formula; the GPS preset reproduces the SPS PS equatorial-crossing column (35 of
    36 locations within 0.0108 deg; E3F within 0.06 deg, the table's own row being
    inconsistent); the GPS baseline global HDOP distribution matches SPS PS Appendix B
    (median 0.940 against 0.94, 95 % 1.255 against 1.25, mean 0.965 against 0.96; bar 0.03).
  - MODELLED: arbitrary designs, other bodies, the BeiDou phase and inclined-geosynchronous
    nodes, two-body orbits with optional J2, geometry only.
  - Scenarios: `constellation-multi-gnss-coverage` (102 satellites, availability 100 %,
    median PDOP 0.95, 31.0 in view above 10 deg), `leo-pnt-mega-shell` (5 000 satellites,
    availability 99.22 % at PDOP 3 or less above 20 deg, 0 % at the polar caps, prefilter
    keeps 11.5 % of the pair tests), `lunar-relay-constellation` (14 satellites around the
    Moon, availability 21.33 % overall and highest over the south polar region). All three
    are bundled for `kshana example`. Notes: `docs/CONSTELLATION-DESIGN.md`.
  Three new matrix rows: two validated (Walker generator and GNSS presets, GPS global
  DOP) and one modelled.
- **A campaign driven by the spectrum model, and constellations around any body.**
  `scenarios/campaign-spectrum-holdover-integrity.toml` chains the
  `spectrum` kind with a clock holdover and an integrity monitor (a chirp takes L1 C/A
  and E1; a CW tone then keeps C/A down while E1 recovers and the receiver falls back to
  a Galileo-only sky), pinned against the stand-alone waterfall example in
  `tests/campaign_composition_reference.rs`. `constellation-design` now resolves its
  central body through `Body::by_name`, so a constellation can be laid around any planet,
  Pluto or major moon with the constants the `solar-system` kind uses.

#### Campaigns

- **Campaigns: many scenarios composed into one run.** A new `campaign` kind
  (`src/campaign.rs`, documented in `docs/CAMPAIGNS.md`) runs members of existing kinds
  through the same dispatch as the command line and reads numbers back out of their
  results. Four sections, in any combination:
  - `[[phases]]`: a chained mission on one timeline. Per-kind presets read clock time
    error against its guard, the mean effective carrier-to-noise density ratio (C/N0)
    against the tracking floor, the vertical protection level against the alert limit,
    position error, satellites tracking and alarm flags, held onto a common grid with phase
    boundaries and events. State is handed on by `carry`, `handoff` and `end_at`.
  - `[sweep]`: one to three dotted keys of any kind, optionally with a seeded ensemble at
    every node.
  - `[monte_carlo]`: realisation k at base seed + k, with mean, spread, percentiles and a
    fixed-seed bootstrap 95% confidence interval.
  - `[compose]`: shared values bound into several members, with a combined best and worst
    summary.
  Every result carries a campaign hash and a digest over every member result. Four bundled
  scenarios: `campaign-jam-spoof-holdover-integrity` (nominal, jamming, spoofing ended at
  the clock monitor's 370 s detection, holdover carrying the 37.0 ns spoofed offset with
  an inertial unit coasting, an integrity alarm, recovery), `campaign-sweep-jammer-power`,
  `campaign-shared-jammer-sea-road` and `campaign-monte-carlo-clock-holdover`.
  `tests/campaign_composition_reference.rs` pins the composition identities: a one-phase
  campaign reproduces the stand-alone run bit for bit on three kinds, a fixed-seed
  ensemble is byte-stable, and on a white-frequency-noise clock the ensemble mean lies
  inside the reported interval with the spread inside the chi-square interval of
  sqrt(q_wf * tau) = 16.459 ns. Three new modelled matrix rows.

#### Animation

- **Animation export (`--animate svg|html|frames|all`, `src/animation.rs`,
  [`docs/ANIMATION.md`](docs/ANIMATION.md)).** Any run whose result carries a time series
  can now be written as an animated Scalable Vector Graphics (SVG) file (Cascading Style
  Sheets keyframes, no script: the traces draw in behind a moving time cursor), a single
  self-contained HyperText Markup Language (HTML) player (play and pause, scrub, speed,
  every panel on one synced cursor, event markers that seek on click; no external asset),
  or a numbered SVG frame sequence with a `manifest.json` stating frames per second,
  duration and frame times for a video encoder. A campaign plays as its phases with its
  alarms marked; a spectrum run animates its waterfall row by row. The player follows
  `prefers-color-scheme`, and under `prefers-reduced-motion` both the SVG and the player
  show the finished picture instead of moving. `--animate-fps` and `--animate-duration`
  set the playback; `kshana::api::animate_toml` and `kshana::animation::animate_result`
  are the library entry points, and `result.json` gains an `animation` block only when
  `--animate` runs. Output is a pure function of the result and the options, byte-identical
  on a re-run, with no timestamp. A kind with no sampled time axis is refused with
  "no time series to animate" and nothing is written. The exporter draws the run's own
  samples and adds no number, so it is MODELLED (internal consistency) and carries no
  verification-matrix row; no published number changes. Tests: `tests/animation.rs`
  (determinism, frame count, no external address, well-formed XML, the reduced-motion
  path, and every bundled scenario with a time series animating).

#### Reports

- **Advanced run reports (`src/advanced_report.rs`, [docs/REPORTS.md](docs/REPORTS.md)).**
  Every command-line interface (CLI) run now writes `<scenario>.report.html`, a printable
  HyperText Markup Language (HTML) report, and `<scenario>.report.json`, the same content
  as a machine-readable JavaScript Object Notation (JSON) document. Sections: an executive
  summary; every scenario input with its unit, read from the field-units schema (the
  result's `units` block), else the field-name suffix, else stated as not stated; the
  results with the run's chart, every scalar and a summary of every numeric column; for a
  campaign, the sweep node table, the Monte Carlo mean, standard deviation, 5th / 50th /
  95th percentiles and bootstrap confidence interval with a histogram per metric, the
  chain phase table, or the composition's members and combined summary (and the grid of a
  `sweep` or `sweep-nd` run); an events timeline; the VALIDATED / MODELLED / PARTNER label,
  oracle and test evidence of every verification-matrix row the run's kinds exercise, read
  from the matrix through a kind-to-row crosswalk (a row that grades one input path, such
  as the Simplified General Perturbations 4 (SGP4) path of `orbit` or the measured-record
  path of `slot-timing`, is listed only when the run took that path, and the Shuttle
  Radar Topography Mission (SRTM) reader row is listed for no kind, since no scenario
  field reads an SRTM tile); the not-modelled statements and
  assumptions, each quoted with its source; and a reproducibility record (engine version,
  the source commit when the build sets `KSHANA_GIT_COMMIT`, Secure Hash Algorithm 256-bit
  (SHA-256) digests of the scenario file and the result document, seed, platform and the
  exact command). The report reads no clock: same scenario, seed and engine build give a
  byte-identical report, and the only timestamp it can show is the one `--study-name`
  already writes. A print stylesheet fits A4 and US Letter, repeats table headers and keeps
  rows and figures whole across pages; a Portable Document Format (PDF) file is made with
  the browser's "Save as PDF". There is no `--report pdf` option, because rendering the
  charts into a PDF would need a new, heavy dependency. Tests: `tests/advanced_report.rs`
  reports every bundled scenario (no empty section, no placeholder text, labels equal to
  the matrix, the scenario digest equal to the file's, byte-identical on a re-run) and
  `tests/advanced_report_cli.rs` re-runs the recorded command in a fresh directory and
  requires a byte-identical `result.json`. No published number changes, and the kind,
  scenario-file and matrix-row counts are unchanged.
- **The report, the animation and the exports work together.** The advanced report gains an
  "Animation and exports" section: the run's animated drawing embedded as an inert image (or
  the reason there is none), links to the animation and export files written beside it,
  and every interoperability format with whether it applies, why not, and its
  specification; `report.json` carries the same `companions` block. The HTML animation
  player lists the export files written beside it. The command-line interface (CLI) now
  renders the exports before it writes the report, so both can name the files.

#### Interoperability exports

- **Interoperability exports and imports (`--export`, `src/interop/`, docs/INTEROP.md).**
  `kshana <scenario.toml> --export <format>` writes the scenario's geometry as CZML (the
  Cesium Language), KML (Keyhole Markup Language 2.2, an Open Geospatial Consortium
  standard, with `gx:Track` time-tagged tracks), GeoJSON (Internet Engineering Task Force
  Request for Comments 7946) and Ansys STK (Systems Tool Kit) `.e` ephemerides
  (`EphemerisTimePosVel`, metres, one file per moving object), and the `spectrum` kind's
  synthesised IQ (in-phase and quadrature) snapshot as a SigMF (Signal Metadata Format)
  pair through the existing `src/sigmf.rs`. `--export all` writes every format that
  applies and prints why the others do not; `--export list` reports without running.
  Moving objects are written in the Geocentric Celestial Reference System (CZML
  `INERTIAL`, STK `ICRF`) and Earth-fixed WGS 84 (World Geodetic System 1984) longitude,
  latitude and height (KML, GeoJSON); fixed sites in CZML are `FIXED`. The `jamming` kind
  adds two jammer footprints from its own link equations. `--import-route <file.geojson>`
  writes a GeoJSON `LineString` into the track inputs of `terrain-nav`, `terrain-slam`,
  `gravity-map` and `combined-altpnt`. Exports are byte-deterministic and carry no
  timestamp. `tests/interop_formats.rs` validates every export against its published
  specification, compares exported satellite states with the engine's own to 1 mm, and
  runs every bundled scenario through every format, each either exporting or stating why
  not (the table in docs/INTEROP.md). No published number changes: the `spectrum` kind's
  IQ synthesis moved into one shared function and its result document is byte-identical,
  and `PassesScenario` gains `propagator()` and `epoch_calendar()` used by its own run.
  Kind, scenario-file and verification-matrix counts are unchanged.
  An orbit or integrity scenario with no `epoch` is dated by its satellites' own data:
  `t = 0` is the earliest TLE (two-line element set), broadcast-ephemeris or SP3
  (Standard Product 3) epoch, and each such satellite is rotated into the GCRS and
  Earth-fixed frames at its own instant; 2000-01-01T00:00:00Z is used only when no
  satellite carries an epoch. The SP3 and OEM (Orbit Ephemeris Message) exports keep
  their 2000-01-01 label. To support this, `Sgp4::epoch_jd_utc`,
  `Sp3Interpolator::jd_ut1` and `Propagator::own_jd_utc` are added; nothing that existed
  reads them.

#### Low-Earth-orbit navigation: signal

- **LEO-PNT signal designs and a multi-band spectrum.** A new `leo-signal` kind and a
  `spectrum` kind that reaches beyond the L band: one kind, four scenario files (three
  bundled; the Celeste IOD file is repository-only) and four matrix rows (two VALIDATED,
  two MODELLED).
  - `leo-signal`: parameterised low Earth orbit (LEO) positioning, navigation and timing
    (PNT) signal designs for any system (band, transmit bandwidth, ITU allocation;
    acquisition, data and pilot components with BPSK(n), BOC(m,n), MBOC or flat spectra,
    power shares, FDMA sub-carriers, code lengths and data rates), from compiled-in public
    preset files under `data/leo-signals/` (Xona Pulsar X1/X5, Iridium STL, a Starlink
    signal of opportunity, CentiSpace, a representative C-band design and representative
    UHF/L/S/C/wide-C designs, each citing its source URL) or written inline. Per signal:
    the band-limited PSD and in-band power fractions, Gabor bandwidth, band-limited
    early-late code-tracking jitter against C/N0 and spacing (Betz & Kolodziejski 2009)
    and the ranging accuracy, the acquisition search space, detection probability and
    mean serial and code-parallel acquisition time, the SSC into and from GPS L1 C/A,
    Galileo E1, GPS L5, Galileo E5a, E5b and AltBOC with the C/N0 loss, CW, wideband and
    matched J/S tolerance from the spectrum kind's SSC code, a band trade (ionospheric
    delay, free-space loss, ranging at equal C/N0 and equal EIRP, jammer tolerance), and
    optional shape checks against a described measurement. Examples:
    `scenarios/leo-band-trade.toml`, `scenarios/xona-pulsar-signals.toml`,
    `scenarios/celeste-iod-classical-pilot-signals.toml` (the Celeste IOD bands and
    signal configuration presented at the ESA NAVISP LEO-PNT workshop, 2026; withheld with
    the Celeste IOD preset, see "LEO-PNT end to end" below). Notes in `docs/LEO-SIGNAL.md`.
  - `spectrum`: bands may now be a preset signal design (every component drawn,
    band-limited, C/N0 and J/S referred to the tracked component) or a custom carrier and
    modulation; `[[panels]]` add waterfalls over other frequency ranges on one timeline; a
    `wideband` (barrage) jammer joins the four waveforms. The report adds
    `bands[].tracked_power_dbw`, `bands[].design` and `panels`, and one `not_modelled`
    entry. Plain bands give the same numbers as before. Example:
    `scenarios/multi-band-jamming-waterfall.toml`.
  - `navsignal` gains the sine integral, the BPSK power-in-band and band-limited Gabor
    bandwidth closed forms, the band-limited early-late jitter for any spectrum and its
    Gabor bound, the offset BPSK SSC closed form, the Galileo E5 AltBOC(15,10) spectrum
    and a modulation-label parser; `Modulation::label` prints BPSK(1/3) as a fraction.
  - Four matrix rows: VALIDATED band-limited closed forms (90.3 % of BPSK power in the
    main lobe, the jitter reducing to Kaplan & Hegarty's coherent form, 0.0039564 chips at
    45 dB-Hz, B_L 1 Hz, d 1 chip, T 20 ms, and to its Gabor bound, and the BPSK self-SSC
    2/(3 R_c); the Gabor closed form and the offset SSC against its Parseval form are
    stated as internal cross-checks); VALIDATED maximum LEO Doppler (Xona X1 33.2 kHz
    inside the published 32 to 34 kHz, Iridium within 0.5 kHz of 36 kHz); MODELLED
    `leo-signal`; MODELLED multi-band spectrum.

#### Low-Earth-orbit navigation: link

- **LEO-PNT pass and per-band link budget: the `leo-pass` kind.** LEO-PNT is positioning,
  navigation and timing from satellites in low Earth orbit (LEO). A user (ground, maritime,
  air or indoor, static or moving) and one or more LEO satellites from a designed pass,
  explicit elements, a two-line element set (TLE) through SGP4, or a Walker constellation
  from the `constellation-design` code. Per satellite, band and epoch: look angles, range,
  closed-form range rate and range acceleration (checked every run against central
  differences), Doppler and Doppler rate, free-space loss, EIRP (equivalent isotropically
  radiated power) with an isoflux, Gaussian-beam or flat satellite pattern, a patch user
  antenna, ITU-R P.676 gaseous attenuation, ITU-R P.838/P.618 rain attenuation, P.618
  tropospheric scintillation, ITU-R P.2109 building entry loss for an indoor user,
  polarisation mismatch, system noise temperature and C/N0 (carrier-to-noise density); the
  first-order ionospheric delay per band from a Klobuchar or vertical-TEC (total electron
  content) slant TEC below the satellite, and ionosphere-free band pairs with their noise
  amplification. Galileo or GPS satellites are evaluated with the same receiver from their
  interface-document received powers, so the bell-shaped LEO pass and the flat MEO (medium
  Earth orbit) carriers share one plot. An `[iot]` section gives time to first fix, energy
  per fix and battery life against duty cycle (MODELLED).
  - System-agnostic: the engine needs no preset. Optional presets, each in its own file and
    marked PUBLIC (with URL), REPRESENTATIVE or WORKSHOP: generic multi-band (UHF, L, S, C),
    generic C band, Xona Pulsar X1/X5 (arXiv 2509.19551), Iridium STL, Starlink as a
    Doppler-only signal of opportunity, CentiSpace, and Celeste IOD (in-orbit
    demonstration), whose signal parameters were presented at the ESA NAVISP LEO-PNT
    workshop, 2026, and live in `src/celeste_iod.rs` so they can be withheld (see "LEO-PNT
    end to end" below).
  - Public building blocks in `src/leo_link/` (geometry, antenna, itu, iono, energy,
    presets) for other modules to call.
  - Scenarios: `leo-pass-vs-gnss-cn0`, `leo-indoor-uhf`, `leo-iot-energy`,
    `leo-pass-xona-pulsar`, `leo-pass-iridium`, `leo-pass-celeste-iod-multiband`.
  - Nine matrix rows. VALIDATED (6): ITU-R P.838-3 coefficients against its Table 5; P.618-14
    rain attenuation and scintillation against the ITU-R Study Group 3 validation examples;
    P.2109 building entry loss against the Study Group 3 workbook; first-order ionospheric
    scaling against the IS-GPS-200 group-delay ratio, with the free-space loss; the static-user
    maximum Doppler of a circular orbit against arXiv 2509.19551 Table 1. MODELLED (3): the
    pass and link budget, the presets, and the low-energy fix budget. One kind and six
    scenario files. Notes in `docs/LEO-PASS.md`.

#### Low-Earth-orbit navigation: navigation message

- **LEO navigation message (`leo-navmsg` kind, `src/leo_navmsg/`).** The broadcast
  ephemeris and clock message of a low Earth orbit (LEO) positioning, navigation and
  timing (PNT) satellite, for any orbit, carrier and model; named presets are optional
  data and every capability runs without them. One kind, five scenario files and
  nine matrix rows (three VALIDATED, six MODELLED). See `docs/LEO-NAVMSG.md`.
  - Message content: SVID, issue of data, band and signal health; week, time of week and
    a second-order clock polynomial; the ephemeris in one of four models — the Galileo
    OS SIS ICD 16-parameter Keplerian set, that set plus along-track, cross-track and
    radial correction polynomials, the Liu et al. 2025 22-parameter model
    (doi 10.3390/rs17162894), or the ATOMIC zero-clock ECEF polynomial — and a Klobuchar
    set, NeQuick-G coefficients with the effective ionisation level, and
    system-time-to-UTC parameters with the ICD leap-second cases.
  - Fitter: a truth orbit integrated with zonal J2–J6 or EGM2008 gravity and drag, a
    seeded free or steered clock, a Levenberg–Marquardt fit on non-singular elements, then
    linear least-squares correction polynomials and a clock fitted net of the user's
    relativistic term.
  - Four analyses and scenarios: `leo-navmsg-fit-interval-trade` (signal-in-space range
    error (SISRE) versus fit interval and update period), `leo-navmsg-model-comparison`
    (four models, bits, and Kshana's 22-parameter fit at the Liu et al. altitudes beside
    the published figures, MODELLED), `leo-navmsg-midpass-update` (continuity at each
    message switch in a pass) and `leo-navmsg-encode-decode` (Kshana's own documented
    binary frame with CRC-24Q and a quantisation budget, a RINEX-4-style block labelled a
    Kshana extension, and a CSV table).
  - VALIDATED: the global-average SISRE weights against the published medium-orbit and
    geostationary table of Montenbruck et al. 2018; the Galileo user algorithm against
    RTKLIB on four real Galileo broadcast ephemerides (`tests/leo_navmsg_reference.rs`);
    CRC-24Q against the catalogue check value and the RTCM 10403 1005 example frame.
  - Presets, one file each with sources: Xona Pulsar and Pulsar-0, Iridium, Starlink,
    CentiSpace, a representative C-band system, ATOMIC, and Celeste IOD (the only preset
    using material presented at the ESA NAVISP LEO-PNT workshop, 2026, kept in
    `src/celeste_iod.rs` with its scenarios so it can be withheld).

#### Low-Earth-orbit navigation: fusion

- **Fused MEO + LEO positioning, navigation and timing: `leo-pvt`, `leo-ppp` and
  `ntn-positioning`.** Three new scenario kinds in `src/leo_fusion/`, system-agnostic: every
  constellation is Walker shells, element sets or a GNSS preset, every signal a carrier, a
  chip rate and a carrier-to-noise density (C/N0) envelope, every error budget an explicit
  one-sigma, and named low-Earth-orbit (LEO) systems are optional presets, one file each with
  their sources marked public, workshop or derived (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), Starlink
  signals of opportunity, CentiSpace, a representative C-band system, the ATOMIC zero-clock
  ephemeris model, and one ESA Celeste in-orbit-demonstration preset whose workshop-derived
  parameters live in `src/celeste_iod.rs` so they can be withheld).
  - `leo-pvt` has four modes: Doppler positioning (batch least squares on range rate with
    clock-drift and velocity states, a Doppler-only signals-of-opportunity mode, the
    single-pass along-track and cross-track accuracy, and the Doppler, Doppler-rate and jerk
    envelope); joint GNSS + LEO weighted least squares with one clock per system (the
    inter-system bias) or a known offset, per-measurement sigmas as inputs, and the DOP
    against the number of LEO satellites; polar and Arctic coverage against latitude; and LEO
    time transfer to Coordinated Universal Time (UTC) against C/N0 and the receiver
    oscillator with the IS-GPS-200 system-time-to-UTC expression.
  - `leo-ppp`: a float precise point positioning (PPP) extended Kalman filter on
    ionosphere-free code and phase, GNSS only and with LEO augmentation, with its
    convergence time and a Monte Carlo NEES (normalised estimation error squared)
    consistency test. The bundled scenario gives 7.4 min with four MEO systems and 4.8, 3.2,
    2.7 and 2.3 min with 60, 96, 192 and 288 LEO satellites, beside the 9.6, 7.0, 3.2, 2.1 and
    1.3 min of Li et al. (J. Geod. 93:749, 2019) as a MODELLED comparison of the trend.
  - `ntn-positioning`: 5G non-terrestrial network (NTN) positioning in the 3GPP n256
    mobile-satellite S band from the Cramér-Rao bound on time of arrival and Doppler.
  - Scenarios: `leo-doppler-positioning`, `starlink-sop-doppler-positioning`,
    `meo-leo-fused-pvt`, `leo-ppp-convergence`, `ntn-5g-positioning`,
    `polar-arctic-leo-coverage`, `leo-timing-utc` (bundled) and `celeste-iod-fused-pvt`
    (repository-only, withheld with the Celeste IOD preset).
  - Eight matrix rows: the LEO Doppler envelope VALIDATED against the published Iridium
    (±36 kHz: 35.9 kHz, within 5%) and Xona Pulsar X1 (32 to 34 kHz: 33.6 kHz from the
    97 deg shell, with no widening) figures
    (`tests/leo_doppler_reference.rs`); Doppler positioning, joint pseudorange positioning,
    PPP convergence, NTN bounds, LEO timing, polar coverage and the presets MODELLED. Three
    kinds and eight scenario files. Documentation: `docs/LEO-PNT-FUSION.md`.
- **LEO-PNT end to end: the `leo-pnt-chain` kind, and the LEO stages wired together.**
  One low Earth orbit (LEO) positioning, navigation and timing (PNT) system followed from
  its signal design to the user's position, each stage the engine's own kind on its own
  scenario table, with values handed on in code
  ([`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain)):
  - `leo-pass` bands may name a `leo-signal` design (`signal = "xona-x5"`): the band takes
    the design's centre, transmit bandwidth and tracked-component chip rate, splits its
    EIRP (equivalent isotropically radiated power) across the design's components, and
    reports every epoch's tracked-component C/N0 (carrier-to-noise density) and
    band-limited code-tracking jitter (the ranging error; the `iono_free` pair noise uses
    it too). A band without a design gives the same output as before.
  - `leo-pnt-chain` runs signal -> pass -> navigation message -> fused `leo-pvt` joint fix
    -> optional `leo-ppp`. Every LEO system of the positioning stage that leaves them unset
    takes a C/N0 line in sin(elevation) fitted to the pass, the message's signal-in-space
    range error (SISRE: its representation error at the pass satellite's orbit, with a
    stated `od_sisre_m` orbit-determination term in root-sum-square), and the design's
    carrier and chip rate; the precise point positioning (PPP) cases take the SISRE. Every
    hand-off is listed with its value and unit, and `tests/leo_pnt_chain.rs` checks that
    each equals the upstream output and that upstream changes move the downstream figures.
    `LeoNavmsgScenario::broadcast_sisre` is the new message entry point.
  - Scenarios: `leo-pnt-end-to-end` (a generic 1080 km constellation and the representative
    `generic-l` signal), `xona-pulsar-end-to-end` (the public X5 signal), both bundled, and
    the optional, repository-only `celeste-iod-end-to-end`.
  - The Celeste IOD (in-orbit demonstration) presets of the pass, message and fused
    positioning areas now live in one file, `src/celeste_iod.rs`, which `build.rs` compiles
    in only when it exists (the `kshana_celeste` configuration flag). Its five scenarios
    (`scenarios/*celeste-iod*.toml`) are repository-only, so deleting that file and those
    scenarios withholds every number presented at the ESA NAVISP LEO-PNT workshop, 2026,
    with no source edit; `tests/workshop_preset_isolation.rs` checks which files may name
    the preset or carry its band-plan numbers.
  - Every LEO kind in the advanced report's crosswalk, with its path-specific rows listed
    only when the run took that path (a rain rate, a building, an analysis or mode that ran).
    `leo-pvt` Doppler windows gain `t_s` and `leo-ppp` cases gain `t_min`, so both animate;
    `leo-pass` and `leo-pnt-chain` export CZML, KML, GeoJSON and STK ephemerides, and the
    other LEO kinds state why a format does not apply.

#### Low-Earth-orbit navigation: resilience, focus areas and end-user scenarios

- **LEO-PNT resilience, one scenario per experiment focus area and one per end-user
  vertical, and `docs/LEO-PNT.md` as the overview of every LEO kind and scenario.** Every
  scenario runs without any Celeste data and is bundled.
  - `leo-pass` gains a `[spoofer]` section: a spoofer counterfeits, self-consistently in
    range and range rate, the signals of a claimed position that jumps and/or is pushed
    from the true one after an onset (per LEO band, and the MEO GNSS signal), with or
    without the ionosphere. Two monitors run at a stated false-alarm probability: Doppler
    and pass-geometry consistency (measured range rates against those predicted from the
    orbits and an independent prior position and velocity; a generalised least-squares
    chi-square over a window, on the GNSS, LEO and all channels, frequency-lock-loop noise
    from C/N0) and cross-band consistency (the step of each LEO band pair's
    model-corrected geometry-free combination). The result gives the statistics per epoch
    (so it animates), each pair, and when each monitor detects. Building blocks in
    `leo_link::spoof`. Absent section, unchanged output.
  - Every `leo-pass` band pair also reports the slant total electron content (TEC) its
    geometry-free combination recovers at the pass peak and that estimate's code-noise
    sigma (ionosphere sounding). This adds two fields to every multi-band `leo-pass`
    result; no existing number changes.
  - `leo-pvt` timing mode takes `trace = true`: every row then reports its time error and
    predicted sigma at every epoch, with the same draws, so the row statistics are
    unchanged and the run animates and chains in a campaign.
  - A campaign now exports each member scenario that has geometry (phase runs, the sweep
    and Monte Carlo base scenarios, composed members with their shared values bound) as
    its own file set, the member label in the file name; before, a campaign exported
    nothing. The interoperability table in `docs/INTEROP.md` changes accordingly.
  - A campaign sweep key may index an array of tables by position (`system.2.sisre_m`).
  - Resilience scenarios: `leo-resilience-multiband-diversity` (a 50 MHz L5-band barrage
    swept in power: every L-band signal falls, the UHF, S- and C-band LEO signals keep
    their C/N0), `leo-resilience-js-margin` (J/S margin from received power: GPS L5,
    Galileo E5a and Xona X5 lost at -105, -100 and -95 dBW, a -135 dBW generic LEO signal
    still tracking at -90 dBW), `leo-resilience-spoof-doppler` (a 30 m jump missed by the
    GNSS-only Doppler test and detected by the test on every channel 105 s after the
    onset), `leo-resilience-spoof-monitors` (four spoofers against both monitors) and
    `leo-resilience-gnss-jammed-leo-carries` (GNSS jammed, the S- and C-band LEO layer
    tracked, receiver autonomous integrity monitoring on the LEO layer alone alarming at 2
    of 30 epochs).
  - Focus-area scenarios: `leo-focus-ppp-altitude`, `leo-focus-ntn-bandwidth`,
    `leo-focus-iot-eirp`, `leo-focus-science-iono-sounding`, `leo-focus-data-services`,
    `leo-focus-indoor-uhf`, `leo-focus-fused-pnt-sisre` (resilience in L, S and C is
    `leo-resilience-multiband-diversity`).
  - Vertical campaigns, each animated and exporting its LEO passes:
    `leo-vertical-autonomous-vehicle`, `leo-vertical-rail-maritime` (the bundled maritime
    and rail scenarios plus LEO), `leo-vertical-critical-infrastructure-timing`,
    `leo-vertical-polar-arctic`, `leo-vertical-5g-network-timing`,
    `leo-vertical-asset-tracking-iot`. One-line results in `docs/LEO-PNT.md`.
  - Three MODELLED matrix rows: the Doppler and pass-geometry spoofing monitor, the
    cross-band spoofing monitor, and ionosphere sounding. `tests/leo_resilience_verticals.rs`
    checks the monitors (silent before the onset, the Doppler statistic quadratic in a
    jump, the ionospheric step of a ground spoofer and none from an ionosphere-aware one),
    the sounding identity, the timing trace against the row statistics, and that a
    campaign's export equals each member's own.
  - The `leo-pass` page moves to `docs/LEO-PASS.md`; `docs/LEO-PNT.md` is the overview.

#### Maritime, road and rail scenarios

- **Maritime, road and rail scenarios.** Five bundled examples on existing kinds, so
  ships, road vehicles and trains each have a worked case. Every figure is MODELLED; none
  is validated against measured data.
  - `scenarios/maritime-strait-jamming.toml` (`jamming`): a 50 W broadband jammer on a
    30 m mast, 30 km across open water from a ship. Mean jammer-to-signal ratio (J/S)
    about 48 dB, and availability falls from 1.00 to 0.00.
  - `scenarios/maritime-port-approach-coast.toml` (`ins-trn-coast`): a navigation-grade
    inertial navigation system (INS) at 12 knots with GNSS lost and no aiding. It crosses
    10 m after 281 s and 100 m after 833 s, the harbour-approach and ocean-waters figures
    of International Maritime Organization (IMO) Resolution A.1046(27), used here as
    budgets.
  - `scenarios/maritime-spoof-position-push.toml` (`spoof-detect`): a +2 dB,
    non-carrier-aligned spoofer pushing four satellites to drag a ship 500 m. The fused
    monitor detects it (score 0.70 against a 0.50 threshold) on receiver autonomous
    integrity monitoring (RAIM) and signal quality monitoring (SQM); power monitoring
    alone misses it.
  - `scenarios/automotive-urban-canyon.toml` (`gnss-ins`): a car through a 15 s
    underpass and a 60 s roadside-jammer outage, against a 1.5 m half-lane budget.
    Fused outage root-mean-square (RMS) error is 1.9 m for an automotive-class
    micro-electro-mechanical system (MEMS) unit and 0.7 m for a tactical-grade
    comparator; free-running, the MEMS unit drifts to 850.8 m.
  - `scenarios/rail-tunnel-coast.toml` (`ins-trn-coast`): a tactical-grade INS on a
    train at 160 km/h in a tunnel. It crosses 2 m (track discrimination) after 35.8 s,
    about 1.6 km in, and 20 m after 107.3 s. This is INS only: the engine has no
    odometer model, so it is the pessimistic bound.
  The README scenario-file count moves from 77 to 82. All five are bundled for
  `kshana example` and listed in the browser playground.

#### Model Context Protocol server

- **The Model Context Protocol (MCP) server reaches every kind and every view of a run:
  seven new tools, fourteen in all.** `run_scenario` already dispatched every kind; what an
  agent lacked was a way to a valid scenario of a kind, and the three outputs the command
  line writes beside a result. New tools:
  - `list_example_scenarios` and `get_example_scenario` serve the bundled reference
    scenarios (the `kshana example` table), each with its kind and the first sentence of its
    own header, byte for byte the file under `scenarios/`. A scenario that is in the
    repository but not bundled is refused with the reason. Every kind but `lunar-llr-datum`
    (whose data slice ships with the repository only) has at least one example.
  - `report_scenario` returns the run's report as JSON (JavaScript Object Notation) or as
    the printable HTML (HyperText Markup Language) page (`docs/REPORTS.md`).
  - `animate_scenario` returns the run's time series as an animated SVG (Scalable Vector
    Graphics) drawing, an HTML player or numbered frames, after a JSON summary of what was
    drawn (`docs/ANIMATION.md`). A reply carries at most 120 frames; the command line
    writes any length.
  - `list_export_formats`, `export_interop` and `import_route` serve the interoperability
    exports and the GeoJSON route import (`docs/INTEROP.md`): CZML (Cesium Language), KML
    (Keyhole Markup Language), GeoJSON, the STK (Systems Tool Kit) ephemeris `.e` and
    SigMF (Signal Metadata Format), with a JSON index of the files (suffix, size, and
    SHA-256, the 256-bit Secure Hash Algorithm digest) and the binary SigMF sample file as
    base64.

  The library gains an off-by-default `bundled-scenarios` feature that exposes the
  reference-scenario table as `kshana::bundled_scenarios`; only the MCP server turns it on,
  so the Python wheel and the WebAssembly module still do not carry the scenario text.
  Study suites (`--study`) stay command-line only, because a suite names files on disk and
  the server reads none. The round-trip tests run each new tool against bundled scenarios
  and check the engine's numbers: spectrum, the solar system, constellations around the
  Moon and Europa, a campaign sweep, and the low Earth orbit (LEO) signal, pass,
  navigation-message, fused positioning, precise point positioning,
  non-terrestrial-network and end-to-end kinds.
  Every surface that states the MCP tool count or lists the tools now says fourteen,
  except the playground page under `web/`, which is replaced with the site.

#### kshana.dev, Kshana Studio and the README

- **A redesigned kshana.dev.** The single playground page is replaced by a multi-page
  site: Home, Missions, Capabilities, Evidence, Developers, Editions and Docs, with Kshana
  Studio one click away. Every chart, map and number on it is a recorded run of this
  release's engine, with the scenario and a link that reopens the same run in the Studio;
  the site build refuses a recording made by another engine commit. The documentation
  pages are generated from the repository's `docs/`, and the install options from its
  channels. Fonts and script libraries are served from kshana.dev itself, so no page
  requests anything from a third-party host. Old addresses (`/#playground`, `/#ledger`,
  `/#s=<scenario>` share links, `/?embed=1&…` embed links and the rest) redirect to their
  new place, and an unknown address gets a 404 page.
- **Kshana Studio, a dashboard for every capability.** The Studio opens on a start screen
  with domain tiles and good first runs, then takes a run through five numbered steps:
  Choose a scenario, Set its parameters, Run the engine locally in the browser, Read the
  results (key figures first, each with a PASS or FAIL chip where the run states a
  threshold, then the panels) and Share or export. One search box finds scenarios, domains
  and the fields inside them and jumps to the control; runs can be pinned and compared;
  a breadcrumb says where you are; on a phone the steps become a step bar. Every scenario
  kind has its view, including the spectrum waterfall, the solar system, constellation
  coverage, campaigns, the animation, the run report, the interoperability exports and the
  low Earth orbit chain. A deep link (`?scenario=…&tab=…`) opens the same run on the named
  panel.
- **Research and citation.** The Evidence page lists the five Kshana papers on arXiv
  (2606.22054, 2606.24210, 2607.02566, 2607.05415 and 2607.06212), each with a summary,
  a figure computed by this engine, the command that reproduces it, a Studio link and
  BibTeX, beside how to cite the software. The README gains the same Research section.
- **A public page for Kshana Pro.** `docs/PRO.md` and the site's Editions page say what
  the proprietary Pro overlay adds over the same engine (design optimiser, uncertainty and
  sensitivity, mission dossier, campaign watch, spectrum coexistence, on-premises job
  service, requirements traceability), what each produces and what it does not do. Every
  Pro figure the site shows is stated in that public page. Pro adds no physical model, and
  the open engine stays whole and free.
- **A rewritten README.** Short sections, one image per section, the Kshana mark, two
  badge rows, generated architecture, scenario-flow, low-Earth-orbit-chain and
  verification images (`tools/gen_readme_assets.py`, which fails on a stale image), and
  Studio screenshots taken from the running Studio by `tools/capture_studio_shots.mjs`.
  The crates.io, PyPI, npm and MCP server READMEs follow the same design. Long reference
  material is folded or moved to `docs/`.

### Changed

- **`<scenario>.report.html` is now the advanced run report** described under Added, and
  the CLI's `wrote …` line names `<scenario>.report.json` as well. The one-page scorecard
  it replaced is unchanged as `RunOutput::html_report()`, which the Python and WebAssembly
  bindings still return. `OracleKind::modelled_reason()` exposes the sentence
  `docs/MODELLED-RATIONALE.md` prints for each MODELLED row; that document is unchanged.
- **The README says what Kshana Pro builds on.** The Editions section and the Kshana Pro
  line under "Support & professional services" now state what Pro's model-based
  systems-engineering (MBSE) and programme tooling does and which of the open engine's
  published outputs it reads (each run's `result.json` and `report.json`, the scenario
  file, the field-units schema and the verification matrix's labels), and what the clock
  digital twins, trade studies and evidence packs rest on in the open engine. Wording
  only: no engine output and no published number changes.
- **Compatibility.** The public enum `navsignal::Modulation` gains an `Mboc` variant,
  which is a breaking change for a caller that matches it exhaustively. The
  `ephemeris` kind's `gcrs_r_m` and `gcrs_v_m_s` columns change (see "Revisions to
  published numbers"). A run is still reproduced by the engine version that made it.

### Fixed

- **`export_table_csv` on the MCP server named four kinds as the only ones with a CSV
  (comma-separated values) table; six publish one.** The tool always returned the table for `telecom-timing` and for
  `leo-navmsg` (its `encode-decode` analysis on a `kepler16` or `kepler-rac` message model),
  but its description, its refusal message and the documents that list the kinds left both
  out, so an agent was told not to ask. They are named now, and a round-trip test fetches
  both tables.
- **The low Earth orbit (LEO) navigation-message frame was not the same bytes on every
  platform, nor in every build of one platform.** `scenarios/leo-navmsg-encode-decode.toml`
  encoded a frame with cyclic redundancy check `0x110315` in the release build on aarch64
  macOS, `0x898BD8` in a debug build of the same source on the same machine, and
  `0x6A82D9` in the WebAssembly (WASM) build; `leo-navmsg-celeste-iod.toml` gave
  `0x6EDB2D` natively against `0xC6E4F0` in the browser. Three causes, each traced to
  the first diverging value:
  - *Between platforms.* The truth orbit was bit-identical on both; the fit's starting
    point was not. `truth::state_to_elements` takes the osculating inclination from an
    `acos` and the argument of perigee from an `atan2`, and the two mathematics libraries
    round those differently in the last place (over 20 000 arguments they disagree for
    781 sines, 858 cosines, 1 931 exponentials and 1 899 two-argument arctangents).
  - *Between build profiles.* An optimised build on macOS merges a sine and a cosine of
    one argument into a single call to the system's combined routine, and its sine is
    not the lone `sin`'s for 379 of 200 000 arguments; an unoptimised build makes the
    two calls. The kind takes a sine and a cosine together in thirteen places.
  - *In the clock.* The normal sampler of `rand_distr` calls the host `exp` and `ln` in
    its two rare branches: of four million seeded draws, three differed in the last bit
    between the native and the WASM build.

  The Levenberg–Marquardt fit, which on this arc stops at its 80-iteration limit and not
  at a minimum, carries one unit in the last place into different quantised fields. The
  kind now computes every transcendental through the new `src/portable_math.rs`, which
  calls the pure-Rust `libm` crate (already in the dependency tree, now named in
  `Cargo.toml`), compiled from one source for every target and not a library call the
  optimiser rewrites: `leo_navmsg::{truth, fit, elements, codec, sisre, services}` and
  the scenario code. Integer powers on that path are spelt out as square-and-multiply,
  because `f64::powi` has unspecified precision, and the truth clock draws its normal
  deviates from `portable_math::standard_normal` (Marsaglia's polar method on the
  generator's raw output). The shared routines the truth orbit integrates through are
  written once, generic over the mathematics library, with a crate-internal `_portable`
  entry point beside the existing one: the spherical-harmonic acceleration, the zonal and
  drag accelerations, the J2 secular rates and the Klobuchar delay. The existing entry
  points are unchanged to the last bit, so no other kind's number moves.
  `leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform` pins the
  whole 171-byte frame and one check value per ephemeris model, in the ordinary
  (unoptimised) test profile, on every platform and with no baseline-host gate;
  `the_kind_never_calls_the_host_mathematics_library` reads the kind's sources from disk
  and fails on an inherent transcendental call, on a `rand_distr` sampler, or on a call
  into a module that has not been reviewed. After the change a debug build, a release
  build and the WASM build produce byte-identical result documents for all five
  `leo-navmsg` scenarios.
  **This moves numbers, recorded here as a revision.** The `leo-navmsg` kind is new in
  this release, so nothing published in an earlier release moves, but every `leo-navmsg`
  figure does, natively and in the WASM build, and the `navmsg` stage of `leo-pnt-chain`
  with it: the orbit figures because the fit now starts from the portable elements, the
  clock figures because the truth clock is a different realisation of the same process.
  `docs/LEO-NAVMSG.md` is regenerated from the new results; its published check value
  for the encode-and-decode scenario was `0x110315` and is `0x19105F` (position within
  1.126 mm of the exact message where it was 0.665 mm, clock within 0.185 mm where it
  was 0.451 mm).
  The size of the changes in the sub-millimetre figures is the fit's sensitivity, not an
  error in either set: the fit is unchanged and still stops at its iteration limit.
- **Seeded resampling drew different indices on a 32-bit target.** `Rng::gen_range` over
  `usize` takes 64 bits from the generator on a 64-bit host and 32 bits on a 32-bit one,
  so the same seed gave other indices, and left the stream elsewhere, in the WASM build.
  Three places drew that way: the percentile bootstraps in `eval_stats` (`bootstrap_ci`,
  `bootstrap_auc_ci`), the shuffle before each training pass in `impairment_ml`, and the
  permutation test in `impairment_study`. They now draw through
  `portable_math::uniform_index`, which always samples as `u64`: exactly what a 64-bit
  host did, so no native number moves.
  **This moves published numbers of the WASM package, recorded here as a revision:** the
  `quantum-anomaly-detect` bootstrap interval of the area under the curve
  (`quantum_auc_ci`, `trade.foms[0].ci95`) was `[0.9901265, 0.9938305]` in the browser
  and is now the native `[0.99035875, 0.993861]`.
- **STK ephemeris file names from mover ids.** A mover id holding a `/` or a space (a
  constellation shell and a satellite, `Pulsar inclined/S1-0163`) made the CLI panic on
  `--export stk`; each id now passes through a safe file part (letters, digits, `-`, `_`).
- **The TEME→GCRS nutation sign**, described under "Revisions to published numbers"
  above because it moves published output.

## [0.28.0] - 2026-09-26

### Added

- **`slot-timing` scenario kind** (`src/slot_timing.rs`): seconds until a free-running
  clock leaves the guard of a time-indexed routing or tasking slot, every contributing
  term at that moment with the dominant one named, the time left since the last fix, and
  the largest fix interval that keeps the clock inside, net of the fix latency. The clock
  comes from a class default, a telecom-timing datasheet preset, an inline datasheet
  (Allan-deviation maxima, ageing, temperature coefficient) or a measured phase record.
  A breach beyond the longest averaging time the source supports is flagged as
  extrapolated. Bundled example: `slot-timing-ocxo-leo`. See `docs/SLOT-TIMING.md`.
- **Measured red-noise floor.** A phase record's overlapping Allan deviation is fitted by
  weighted least squares in the white-phase and IEEE Std 1139 frequency-modulation basis
  (`slot_timing::fit_weighted`), each point weighted by its equivalent degrees of freedom,
  so a holdover answer can rest on the clock's own floor instead of the class
  assumption. An unweighted fit put a spurious flicker floor on a white-noise test record
  and shortened a 2 000 s breach by 30 %.
- **Held-out validation of the holdover inversion on a real clock**
  (`tests/slot_timing_cs5071a_holdout.rs`): fitted on the first third of the 5071A
  caesium-versus-hydrogen-maser record, the predicted one-sigma breaches at six
  thresholds from 0.5 to 2.5 ns land within 0.84 to 1.03 of the breaches measured on the
  other two thirds, against a bar of 1.5 fixed before the test first ran. A control (the
  one-second Allan deviation read as white noise) misses by a factor of about 1 000 and
  fails the bar. New VALIDATED ledger row; the `realdata-clock` workflow now runs it.
- **The same prediction on a real crystal oscillator** (`tests/slot_timing_ocxo_holdout.rs`,
  `scripts/fetch_ocxo.sh`): on a measured oven-controlled crystal oscillator the held-out
  prediction is conservative, at 0.59 to 0.70 of the measured breach and never later, and
  mostly outside the 1.5 bar, because that oscillator's noise floor halved during the
  5.5-hour record; fitted in sample it lands within 0.98 to 1.17. The crystal case is not
  validated and stays MODELLED. The run also exposed a missing term: a crystal's
  frequency wanders, so the model now carries the uncertainty of the frequency known at
  the fix (`fix_frequency_sigma`); without it the prediction was optimistic by up to 2.5×.
- **The same prediction on atomic clocks in orbit** (`tests/slot_timing_igs_holdout.rs`,
  `scripts/fetch_igs_clocks.sh`): 14 days of International GNSS Service final clocks for
  the GPS Block IIF satellites, with the protocol written down before the data was
  downloaded. Eight of ten satellites land within the 1.5 bar; G25 and G30 predict
  breaches up to about twice as late as measured. The protocol requires every satellite
  to pass, so the orbital case is not validated and stays MODELLED; the outcome is pinned.
- **Temperature-compensated crystal (TCXO), oven-controlled crystal (OCXO) and rubidium
  atomic frequency standard (RAFS) clock classes** (`ClockClass::Tcxo`, `Ocxo`, `Rafs`), the parts a
  commercial smallsat bus or a ground gateway flies, each citing one public datasheet
  (`ClockClass::source`). `ClockClass::ALL`, `id` and `from_id` added. `quantum-trade`'s
  `baseline_clock_class` accepts the three new ids. Adding variants to a public enum is a
  breaking change for a caller that matches it exhaustively.
- **Timing protection level for a receiver in orbit** (`src/orbital_timing.rs`, the
  `slot-timing` kind's optional `spoofing` section): how long a ground spoofer can reach
  a low-Earth-orbit satellite per pass, the pull a spoofer at a stated maximum ramp rate
  accumulates before the satellite leaves its reach or an independent check runs, and
  whether each ground-contact or crosslink check is independent of that spoofer. Reduces
  exactly to `tpl::timing_protection_level_ns` for a clock without flicker, white-phase or
  random-run noise. MODELLED.
- **Three notes**: `docs/SLOT-TIMING.md` (including which wander metric a slot should be
  accepted against: maximum absolute time error, not maximum time interval error or time
  deviation, and why),
  `docs/DECEIVED-TIME.md` (a signed command applied at a deceived time still misroutes)
  and `docs/DEPLOYMENT-TARGETS.md` (where Kshana runs; no `no_std` flight core is
  offered).

## [0.27.4] - 2026-09-26

The v0.27.3 release reached crates.io (`kshana` and `kshana-mcp`) and PyPI, then stopped
at npm, so npm, the ghcr.io MCP image, the MCP registry, the JetBrains Marketplace and
kshana.dev never received it. 0.27.4 carries the same engine, with the release fix below,
to every channel.

### Fixed

- **The npm publish step names the tarball by an explicit path.** npm reads a bare
  `npm-dist/kshana-0.27.3.tgz` as the GitHub shorthand `owner/repo`, so v0.27.3's npm job
  tried to clone `github.com/npm-dist/kshana-0.27.3.tgz` and failed with "Permission
  denied (publickey)". The tarball itself had been built and attested. The step now
  publishes `./npm-dist/*.tgz`. Everything after npm in the release order (the MCP image,
  the JetBrains plugin, the channel-parity check and the site) was skipped, as designed.

### Changed

- **The telecom-timing and `gnss-ins` units catalogs are exempt from copy-paste
  detection**, under the same policy and justification test as the other catalogs. The
  SonarCloud quality gate had gone red on new-code duplication (4.0% against 3%), and
  every duplicated block was a units row or an ITU-T mask entry.

## [0.27.3] - 2026-09-25

### Added

- **`scenarios/small-uas-jammed-nav.toml`: how long a small drone's navigation holds
  after GNSS is jammed.** It runs a flight-controller-class micro-electro-mechanical
  (MEMS) inertial unit, a Bosch BMI088, against a tactical-grade unit. The GNSS
  (Global Navigation Satellite System) signal is nominal for 100 s, then denied for
  60 s (`jamming-demo.toml` shows why a nearby jammer does that). The BMI088's biases
  are the residuals left after start-up calibration, taken from the temperature
  coefficients in its datasheet (BST-BMI088-DS000-19 rev 1.9): 0.015 °/s per K for the
  gyro and < 0.2 mg per K for the accelerometer. Two assumptions are flagged in the
  file: a 10 K warm-up after calibration, and continued warming of 1 K per minute in
  flight. The in-flight drift is the error the filter cannot learn before the jamming
  starts, and it is what ends the coast. Every figure is modelled; validating it needs
  flight logs from a jammed environment. `kshana example small-uas-jammed-nav` prints
  it.

- **Each `gnss-ins` sensor can set its own filter prior** (`[imu_quantum.filter_prior]`
  or `[imu_classical.filter_prior]`, with `sigma_accel_bias` and `sigma_gyro_bias`).
  The default is unchanged, so every existing scenario gives the same result. A
  consumer-grade unit's residual gyro bias sits about 26 sigma outside the
  tactical-grade default, where the filter would never learn it. A prior that is not
  finite and positive is rejected, and the result echoes the prior when one is set.

- **`kshana example [<name>]` hands a registry user a scenario to run.** A
  `cargo install kshana` user has the executable and no `scenarios/` directory, so the
  first command every quickstart gave them failed. The command-line interface (CLI) now
  carries the 75 reference scenarios that run on their own, byte for byte, compiled in
  from `scenarios/` (`src/bundled_scenarios.rs`; the table lives in the CLI binary, so
  the Python wheel and the WebAssembly module do not grow). `kshana example` lists them;
  `kshana example clock-holdover > clock-holdover.toml` writes one. The other two files
  are repository-only: `lunar-llr-datum` reads archived lunar laser-ranging data that
  ships with the repository only, and `quantum-pnt-demonstrator.suite` is a study
  manifest that runs three sibling files with `--study`. Asking for either says why and
  exits 2 instead of printing something that cannot run on its own. `tests/cli_first_run.rs` holds the table to the directory in both
  directions, so a new scenario file that is neither bundled nor named repo-only fails.

- **Every figure of merit in a clock, orbit, hybrid or fusion result now says whether
  it is VALIDATED or MODELLED, in the result itself.** The result document gains a
  `figure_tiers` block, always its last key. It lists each reported figure (for example
  `quantum.fom.timing_p95_ns`) with its tier — VALIDATED means checked against an
  independent external oracle, MODELLED means a first-principles model that is tested
  internally — and the verification-matrix row the tier is read from. The tier comes
  from `src/verification.rs` through `src/fom_label.rs`, so there is no second table to
  drift. Before this, the words "validated" and "modelled" appeared zero times in a
  clock-holdover result, and a reader of the raw JSON (JavaScript Object Notation) had
  no way to tell the two apart. The `hybrid` and `fusion` position figures have no
  owning matrix row, so they are listed under `untiered` instead of being given a tier.
  The block carries no numbers. It is proven additive, not assumed: removing it gives
  back the pre-change document byte for byte, for all five kinds (an engine test), and
  both golden harnesses (`tests/registry_golden.rs`, `tests/cross_platform_golden.rs`)
  now strip exactly this key, and only when it is the last one, then hash the rest
  against their **unchanged** frozen constants. A list in each harness pins which
  scenarios must carry the block, so the exclusion cannot quietly widen.

- **A `telecom-timing` kind answers in a timing engineer's units: time error, maximum
  time interval error (MTIE) and time deviation (TDEV), each with a PASS or FAIL and a
  margin against the masks of the International Telecommunication Union
  Telecommunication Standardization Sector (ITU-T).** The masks are transcribed from
  the editions in force: G.8272 (07/2025) for the primary reference time clock (PRTC)
  classes A and B, G.8272.1 (2024) Amd. 1 (07/2025) for the enhanced PRTC in locked mode
  and in holdover (including its time-error envelope, which rises from 30 ns to 100 ns
  over a holdover period set by how long the clock was locked), G.8273.2 (2023) Amd. 2
  (11/2025) for telecom boundary and time slave clocks, classes A to D, and G.8271.1
  (2022) Amd. 3 (05/2025) for the network limits at reference point C. Every entry those
  Recommendations leave "for further study" is absent, not estimated, and
  `docs/TELECOM-TIMING.md` lists each number with its table or clause and each item that
  was left out. The report also gives the time to exceed each time-error budget: by
  default the 100 ns ePRTC holdover default, a 400 ns network holdover allocation, the
  1 100 ns point-C limit and the 1.5 microsecond class 4 end-to-end requirement.

  The input is either a synthetic holdover or a series of your own. The synthetic one
  uses one of four oscillator presets (an oven-controlled crystal oscillator, a
  rubidium standard, a caesium standard and a chip-scale atomic clock), each carrying the
  stability, aging and temperature figures of a named Microchip datasheet. How those
  figures become white, flicker and random-walk frequency noise, aging and a temperature
  term is stated in every report and labelled MODELLED. A series of your own is
  `[time_s, time_error_ns]` pairs, inline (which is how it runs in the browser) or, on
  native builds, from a comma-separated values file. The MTIE/TDEV table, with every
  selected mask's limit beside it, is written as the run's CSV artifact.

  `scenarios/telecom-prtc-holdover-24h.toml` is a 24-hour rubidium holdover with aging,
  flicker and a daily temperature cycle: its largest time error is 603.2 ns, it crosses
  100 ns 8 206 s after the loss and stays inside 1.5 microseconds all day, and it fails
  the enhanced-PRTC holdover envelope, as a clock that is not caesium-class should.
  `scenarios/telecom-tie-ingest.toml` shows the inline input. The MTIE and TDEV the kind
  reports are checked against the allantools package on a committed 2 048-sample
  holdover series, exactly for MTIE and to 1.1e-15 for TDEV, so the matrix gains one
  VALIDATED row and two MODELLED ones (the mask transcription and the presets) and now
  stands at **171 rows — 65 VALIDATED, 102 MODELLED, 4 PARTNER**. Field-units coverage
  goes from 60 of 61 kinds to 61 of 62, and from 1,742 to 1,788 described fields. The
  kind is new and additive: no existing scenario, pin or published figure moves.

- **The playground runs the engine in a background Web Worker, so a slow scenario no
  longer freezes the page.** `web/engine-worker.mjs` hosts the WebAssembly engine and
  `web/engine.mjs` forwards every scenario execution to it — runs, parameter sweeps and
  the SP3 / OMM / OEM / CSV exports. A run that outlives 150 ms shows a busy state
  (Run disabled, "Running… N s") and a Cancel button that terminates and respawns
  the worker; a browser that cannot start a module worker falls back to the old
  main-thread path. `cislunar-arc-recovery`, left out of the catalogue because it
  froze the page, is back in it, labelled as slow: it takes about 13 s in Chrome
  (four engine calls of about 3 s each), during which the page stays responsive.

- **Every reported quantity of `cislunar-observability` now carries a unit, a
  provenance class and a definition — the last kind on the crate-wide exemption
  list but one.** All 41 numeric fields of the RELEASED document are described, so
  field-units coverage goes from 59 of 61 kinds to 60 of 61 and from 1,698 to 1,742
  described fields, with the definitionless backlog unchanged at 239.

  This was blocked by the pin that freezes the released document, which named
  `units` as a key the document must never gain. Adding one would have meant
  deleting that assertion and re-baselining three hashes in three files — a shape
  indistinguishable from covering up a regression. Instead the two pins that
  measure this document now *prove* the addition is additive: each strips the
  `units` block back off and re-hashes against the constant frozen before the block
  existed, and **both constants are unchanged**. A mutation confirms the guarantee
  is real — move a released value and re-baseline the whole-document hash the way a
  careless fix would, and the strip-and-rehash still fails. The third pin, in the
  generic registry-golden harness, is re-baselined in line with the six siblings
  that were re-baselined for exactly this reason, and its value-bearing
  `expect_summary` literal does not move.

- **`realtime-frame-eop` reports which truth each Earth-orientation row was scored
  against, and how often the fallback fired.** `table3_joint_eop[].{ut1,
  polar_motion,combined}` gain `truth_source` and `truth_fallback_rows`. The
  `final` floor is scored against the Bulletin B final and can only use epochs that
  publish one; every `dN` row is scored against `truth_pm()`/`truth_ut1()`, which
  fall back to the Bulletin A rapid value. On the bundled 2026 extract that is 12 of
  31 samples at one day, against 0 at the floor — so the floor row and the
  prediction rows beside it rest on measurably different truth, which the report
  now states instead of leaving to be inferred from a sample count that rises where
  nested horizons say it cannot.

- **`moonlight-service-volume` emits a size-matched Keplerian baseline.**
  `ephemeris_comparison.keplerian_matched` re-runs the illustrative constellation at
  the RETRIEVED set's own satellite count, present only when the counts differ. The
  count is part of that design's geometry — RAAN and mean anomaly are both spread as
  `360k/n` — so without it a five-satellite retrieved set was scored against an
  eight-satellite illustrative one and design was conflated with size. For the
  five-satellite LANS reference set, 8.68 of the 14.24-point coverage gap turns out
  to be the three missing satellites and only 5.56 points the design; for the four
  spacecraft really in lunar orbit, a purpose-built four-satellite set reaches
  4.86 % where they reach 0 %. A test pins that the matched row is a rebuilt
  constellation and not the configured one relabelled, which is how it was first
  written and what the run then reported.

- **Nine capability cards on the public site, covering 22 verification-matrix rows
  that shipped with no product-level card.** The engine had grown a family of
  capabilities — the ARAIM check against published Working Group C reference
  vectors, real retrieved lunar constellation geometry, the lunar denial contour
  with a measured C/N₀ band, the VLBI-schedule-to-station-covariance step, optical
  and RF handover with cross-modality fault injection, real-time Earth-orientation
  prediction against archived Bulletin A, navigation-versus-communications aperture
  sharing, INS/TRN coasting, and unit-and-provenance coverage — each with a matrix
  row and a bundled scenario, and none of them named on kshana.dev. Card-to-row
  coverage goes from 72 of 168 rows to 94.

- **Eight scenarios added to the playground catalogue.** A capability card's Run
  button only appears when `web/app.js` also carries the file; six cards named a
  scenario it did not, so they rendered with no way to run them — one of those, the
  real-laser-ranging datum, had been in that state since it shipped.
  `tests/scenario_examples_doc_sync.rs` now gates the invariant in both halves: a
  card's `run` target must be bundled under `scenarios/` *and* offered by the
  catalogue. Mutation-tested against both failure modes.

- **`moonlight-service-volume` emits its per-satellite geometry as
  `<scenario>.table.csv`** when an export site is configured (G11). It is the
  largest array the crate publishes — 2304 rows in the released joint
  communications-and-navigation table — and it reached consumers only inside JSON,
  the shape that truncated a sibling scenario's 57-point curve to 23 points under a
  column claiming all of them. One row per link, the row count on the header line,
  the antenna columns present only when an antenna was configured. A run with no
  export site is byte-unchanged and writes no file.

- **The SBOM now describes what ships: 60 components became 66.**
  `scripts/gen-sbom.sh` listed every package of the default-feature resolve,
  dev-dependencies included. That put `sgp4` and `chrono` — test-only crates
  compiled into no artifact — in the bill of materials, and left out the
  `--features python` chain the PyPI wheel links (`pyo3`, `pyo3-ffi`,
  `pyo3-macros`, `pyo3-macros-backend`, `pyo3-build-config`, `portable-atomic`,
  `target-lexicon`, `heck`), which is that wheel's foreign-function boundary. The
  script now walks the resolve graph from the kshana package through normal and
  build edges only, over the union of the default, `python` and `wasm` feature
  sets (the npm package carries this same SBOM), for every target platform. The
  pinned CycloneDX conformance verdict is re-baselined through its committed
  generator: 60 → 66 components, 53 → 60 compound licence expressions, and still
  zero schema errors once those are placed in the standard `expression` form.

- **The CSV reproducibility table reaches every front door, not only the CLI and
  the Python wheel.** The MCP server gains a seventh tool, `export_table_csv`, which
  runs a scenario and returns the byte-stable table the CLI writes as
  `<scenario>.table.csv` — or an error naming the kinds that publish one
  (`realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, and
  `moonlight-service-volume` only when `export_site_lat_deg` + `export_site_lon_deg`
  are set). The WebAssembly module gains `table_csv`, returning the same text or
  `undefined`. The MCP round-trip test and the Python binding tests now pin the
  returned CSV byte-for-byte against `tests/golden/realtime-frame-eop.csv`, and pin
  that `RunOutput.write_csv` returns bytes written, and 0 with no file created for a
  kind without a table. Every surface that states the MCP tool count or lists the
  tools now says seven.

- **`run_all` in the WebAssembly module: one engine run for every output.** `run`,
  `chart_svg`, `summary` and `table_csv` each execute the scenario from scratch, so the
  playground paid for four full runs per click — about 12 s instead of 3 s for
  `cislunar-arc-recovery` in a browser. `run_all` returns `{json, svg, summary, csv}` from
  one run, and the playground now uses it. It matches the four separate calls byte for
  byte.

### Fixed

- **REVISION: the GNSS/INS filter's gyro-bias coupling had the wrong sign, and the
  `gnss-ins` outage figures change.** The error-state extended Kalman filter (EKF)
  keeps both inertial biases as residuals (true minus the running estimate, fed back
  by adding). The accelerometer column drove the velocity error with `+C_b^n b_a`, but
  the gyro column drove the attitude error with `−C_b^n b_g`. A residual gyro bias
  actually rotates the computed attitude by `+C_b^n b_g`, so every gyro-bias estimate
  pushed the wrong way. The pack stayed stable only because its default gyro-bias prior
  (1e-4 rad/s, 1-sigma) was tight enough to hold those states still. With a wider
  prior the filter diverged even when the true gyro bias was zero: 93 m of fused
  outage error became 4.3 km. The published figures for `scenarios/gnss-ins.toml`
  change as follows:

  | `gnss-ins.toml` | before (≤ 0.27.2) | after |
  |---|---|---|
  | cold-atom IMU, fused outage RMS | 96.1 m | 1.9 m |
  | cold-atom IMU, in-spec coast (50 m) | 30 s | 60 s (the whole outage) |
  | tactical IMU, fused outage RMS | 62.5 m | 3.1 m |
  | tactical IMU, in-spec coast (50 m) | 37 s | 60 s (the whole outage) |

  The free-running figures (130.7 m and 314.3 m) do not change; they never used the
  filter. The pack's earlier reading, that the fused coast is limited by a hand-over
  attitude floor and so does not improve with a better sensor, was an artefact of this
  bug and is withdrawn. With constant, noise-free biases the filter now learns them
  while GNSS is up, so the fused coast is a best case. The external filterpy reference
  (`tests/gnss_ins_sensor_fusion_reference.rs`) checks only the measurement updates,
  which is why it never saw the propagation. Two tests now check the sign directly and
  both fail on the old one. The first, in `closed_loop.rs`, feeds a known residual gyro
  bias through the strapdown and requires the filter to predict the resulting attitude
  error to within 2 %. The second requires a wide prior to learn a 1e-3 rad/s gyro bias
  and stay inside 6 m. The `gnss-ins` cross-platform golden is re-pinned for this
  reason and no other.

- **Every registry quickstart now runs as written on a clean machine.** Measured before
  this change, the crates.io and PyPI (Python Package Index) examples read
  `scenarios/clock-holdover.toml`, which a registry install does not have, and the npm
  example crashed under Node.js with `TypeError: fetch failed`, because the package's
  `init()` fetches its WebAssembly binary and Node's `fetch` cannot read a local file.
  Now:
  - `README.crates.md` and `README.pypi.md` carry that scenario inline, as
    `README.npm.md` already did. The Rust fence is a whole program with its own `main`,
    since the rustdoc-hidden `# Ok::<…>` line it ended with is shown on crates.io and does
    not compile when pasted. `tests/readme_code_fences_doc_sync.rs` still compiles it
    byte for byte, and now also refuses a hidden line in the fence.
  - `README.npm.md` separates the browser from Node.js and gives a Node recipe that reads
    the binary from disk and passes it to `initSync`. The doc-sync test accepts
    `initSync` as the loader wasm-bindgen generates.
  - All three embed the scenario with its provenance strings unshortened, so the
    scenario hash is `5ba83a232b94` on every surface. The npm example used to shorten
    them, which gave it a different hash from the CLI.
  - Reproduced from local builds of this tree: a fresh `cargo new` project with a path
    dependency on the packaged crate built and ran the Rust example; a wheel built with
    maturin from the packaged sources, installed into a new virtual environment, ran the
    Python example; and the `wasm-pack --target web` package, packed and installed with
    npm, ran the Node recipe. All three printed the same summary line.
- **`cargo run -- <scenario.toml>` works from a clone.** `Cargo.toml` sets
  `default-run = "kshana"`. Without it cargo refused with "could not determine which
  binary to run", which every `cargo run --` line in the documentation hit.
- **The CLI's first-minute errors say what to do next.** A scenario path that does not
  exist now adds a hint pointing at `kshana example`, and a second positional argument
  prints the usage text as well as naming the argument. `--help`, `--version`, the
  unknown-option error (exit 2) and `--validate`'s one-line `ok:` on success were already
  on main. `tests/cli_first_run.rs` now covers all of them, since no test ran the binary
  for any of them before.
- **`list_kinds()` in Python is documented as returning one JSON string, not a list.**
  It returns the same metadata as `scenario_kinds()`, serialised, so iterating it walks
  characters. It keeps its string return so existing callers do not break. `kshana.pyi`,
  the binding's doc comment, `docs/PYTHON_API.md` and `README.pypi.md` now say so and
  point to `scenario_kinds()`.
- **The three registry READMEs spell out every abbreviation at first use.** PNT is now
  expanded in the tagline, where it first appears, and CLI, TOML, JSON, SVG, CSV, CSAC,
  HTML, URL and API are expanded in the files that use them. The oracle-table heading no
  longer says "CI-gated" before CI is defined.

- **Corrected a published figure: dual-constellation ARAIM availability on the
  vendored Celestrak GPS + Galileo TLEs.** `docs/CAPABILITY.md` stated that pooling
  Galileo lifts availability from 0.21 to 0.67 under a 12 m VAL and that the
  constellation-fault-robust mode is limited with only two constellations. That came
  from `tests/araim_dual_real_data.rs` propagating every satellite from its own TLE
  epoch (`parse_propagators` drops the epoch), and the epochs in those files span
  70.6 h (GPS) and 335.7 h (Galileo), so the satellites sat at mutually inconsistent
  times. The test now keeps each epoch (`parse_tle`) and evaluates every satellite at
  one common UTC instant, the latest TLE epoch in the set (2026-06-07T07:21:04). The
  measured availability over the same 24 h, 289-sample grid becomes GPS-only 0.993
  (was 0.208), pooled 1.000 (was 0.671) and constellation-fault-robust dual 0.990
  (was 0.031); at the APV-I limit the dual mode goes from 0.180 to 1.000. The
  conclusion inverts: on a consistent sky two constellations carry the
  constellation-fault hypothesis at a 12 m VAL. The same figures result with the
  earliest TLE epoch as the reference. A self-check in the test pins its availability
  loop sample for sample to `araim_dual_constellation_availability`, so the only
  difference is the time alignment. `docs/CAPABILITY.md` and
  `docs/REAL_TLE_GUIDE.md` §3 carry the new numbers; the 0.13.0 entry below is left
  as released.

- **The public surfaces no longer advertise RINEX 4 as validated.** The engine now
  refuses a RINEX 4 navigation file by name instead of mis-decoding it, but the
  standards grid still showed a "RINEX 3 / 4" card with a *validated* pill, bound to
  the navigation parser's RINEX-3 evidence. The card is now "RINEX 3", and README,
  `docs/CAPABILITY.md`, `docs/STANDARDS.md`, `ROADMAP.md` and the capability summary
  state what is true: RINEX 3.0x observation files parse, the 4.00 observation layout
  is expected to but no 4.00 file has been read through the code, and RINEX 4
  navigation files are refused.

- **`--validate` says when "ok" means there was nothing to check.** About two thirds
  of the catalogue publishes no required field — those packs run their reference
  configuration from an empty body — so the lint could only ever print "ok" for them,
  in the same words it used after checking six fields. The success line now states the
  number of required fields it found present, or that the kind requires none.

- **`scripts/gate.sh` refuses a non-numeric `REPEAT` or `TEST_THREADS`.** Under bash
  3.2, `REPEAT=no` made the numeric comparison error and evaluate false, so the gate
  announced "repeatability loop SKIPPED (REPEAT=0)" for a value that was not 0 and still
  wrote a receipt. Both knobs now exit 2 unless they are plain integers.

- **The MSRV is stated as 1.85 everywhere a person reads it.** `Cargo.toml` moved to
  1.85 last release; the README badge, the install and troubleshooting text,
  `codemeta.json` and the MCP crate's own rationale still said 1.75.

- **`RunOutput.__repr__` in the Python binding reports bytes, not "chars".** It
  printed `len()` of UTF-8 strings, which is a byte count: 710 "chars" for a
  708-character table.

- **The README no longer documents `--study --study-name` together.** `--study-name`
  is a single-scenario flag, ignored with `--study` (the binary warns). The two
  copy-paste examples in README.md and README.crates.md now show the study command
  alone.

- **The site's clock-stability evidence states both observed tolerances.** The 5071A
  caesium series is reproduced to ≤ 3e-5 and PHASE.DAT to ≤ 5e-5; the paragraph gave
  3e-5 for both.

- **Two engine-output files are no longer tracked.** `scenarios/quantum-pnt-demonstrator.study.{json,html}`
  were stamped by engine 0.20.0 with every figure of merit empty, and the README's own
  study command overwrote them, dirtying the tree and blocking the push gate.
  `*.study.json` / `*.study.html` are now ignored like the other four engine outputs.

- **A seed sweep in the playground no longer fails on every run.** The sweep stepped the
  integer `seed` knob linearly (1, 10.9, 20.8, …), and the engine, reading it as `u64`,
  rejected each fractional value. Integer knobs now sweep distinct whole numbers.

- **Every playground download says which engine and which input made it.** A few kinds
  (e.g. `realtime-frame-eop`) emit no `engine_version` or `scenario_hash`, so their
  downloads were named plain `kshana-csv.csv`. The name now falls back to the loaded
  engine's version and a 12-hex FNV-1a-64 fingerprint of the scenario text.

### Changed

- **The published crate is less than half its former size, and `cargo install kshana`
  builds the CLI alone.** The package used to include the papers, their submission
  packages, the paper-figure artifacts, the notebooks, `docs/`, the maintainer scripts
  and the example programs. None of them is compiled by the library or the CLI. It also
  included the three internal generators under `src/bin/` (`crossover_study`,
  `gen_validation_artifacts`, `validation_report`), so a registry install compiled and
  installed four executables, three of them useful only inside a checkout. Those trees
  and the three generator sources are now excluded. Cargo lists a package's binaries
  from the files it contains, so the published manifest names `kshana` only. In a clone
  the generators are still found automatically, so `cargo run --bin <name>` and the
  release job that runs `validation_report` are unchanged. Measured with
  `cargo package`: 763 files, 16.7 MiB, 6.8 MiB compressed before; 591 files, 10.5 MiB,
  3.0 MiB compressed after. Its verification build, which compiles only the packaged
  files, passes. `cargo install --path` on the packaged crate installed
  one executable, `kshana`.

- **Output a timing engineer can read: no more `p95 0.0ns`, no more `security 0.000`
  with no attack, and site counts that match the READMEs.** This is a display revision.
  No published number changes; the JSON values are identical, which the golden hashes
  above prove.
  - The one-line summary printed the optical clock's 95th-percentile (p95) timing error
    as `0.0ns` while the table beside it showed 1.20e-4 ns. A non-zero timing figure
    too small for one decimal place is now printed with three significant figures
    (`p95 1.20e-4ns`); an exact zero still prints as `0.0`. The HTML (HyperText Markup
    Language) report, the study comparison table and the playground's downloadable
    report use the same rule, so no non-zero figure prints as `0.000` either.
  - `security` is an analytic spoof-detectability bound that means something only
    against a configured attack. The `clock`, `orbit`, `hybrid` and `fusion` kinds
    configure none, so their summary now prints `security n/a (no attack)` instead of a
    number such as `0.000` that reads as a failed detection. The value stays in
    `fom.security`, marked `applicable: false` with the reason in `figure_tiers`, and
    the report tables show "not applicable". The `spoof` kind still scores detection.
  - Two summary pins in `tests/registry_golden.rs` moved for exactly these two reasons
    and no other: `golden_clock` (the quantum p95 and both `security` values) and
    `golden_orbit` (both `security` values; its p95 values are exactly zero). Their
    whole-document hashes did not move. The expected summaries in the README, the
    three tutorials and their teaching scenarios are updated to match, and
    `tests/tutorials.rs` checks the teaching copies against the engine.
  - The playground's guided tour no longer opens on first load. Its modal caught the
    first clicks and its spotlight scrolled the page away from where the visitor
    landed. It starts from the "Take the 60-second tour" button or the floating Tour
    button.
  - The page no longer scrolls sideways on a phone. At 390 px the brand row and the
    GitHub button came to about 410 px of content, a 4 px overflow; the header now fits
    from 320 px up, and the figures-of-merit table scrolls inside its own box instead
    of widening the page.
  - The capability explorer led with its own card count ("46 capability cards … 17
    backed by an external oracle") beside READMEs that say 64 of 168. It now leads with
    the verification matrix, read from the generated `web/data/verification-matrix.json`
    (the same matrix the README counts are pinned to), and names the cards afterwards
    as the summary layer they are. `web/counts.test.mjs`, a new step in the
    continuous-integration (CI) workflow, checks the
    arithmetic and cross-checks README.md and the page's descriptions;
    `tests/web_validation_counts_doc_sync.rs` pins the wiring from the Rust side.

- **The public description now leads with timing and holdover, the best-validated
  domain.** The README opening and `docs/POSITIONING.md` present Kshana as an open,
  reproducible, provenance-labelled PNT-resilience evidence engine: critical-infrastructure
  timing and holdover first (the Allan, modified Allan, time-deviation and maximum time
  interval error estimators and the holdover coast-variance inversion are the VALIDATED
  rows behind it), quantum as a neutral quantum-vs-classical trade method whose results
  are labelled MODELLED, and lunar / cislunar and deep-space navigation as maintained
  capabilities rather than the headline. Both pages now say what Kshana is not — not a
  radio-frequency signal simulator or hardware-in-the-loop rig, not a replacement for
  MATLAB/Simulink, STK or Orekit — and point to the new `telecom-timing` kind and
  `docs/TELECOM-TIMING.md`. The old line "there is no good open tool" is gone: a search
  that finds nothing is not evidence that nothing exists. `ROADMAP.md` gains an undated
  priority order (timing first, the quantum trade second, lunar maintained) and drops
  three stale items (Coriolis and light-shift systematics, the NRHO initial conditions
  and the lunar scenario, all shipped); the README's "Coriolis and light-shift remain
  roadmap" line is corrected the same way.

- **`docs/CAPABILITY.md` stopped underclaiming.** The Earth-fixed frames row said
  "none" while the matrix grades GCRS→ITRS VALIDATED; it is now "full", and the core
  frames row records the ANISE cross-check as delivered. Guided mode was listed as
  roadmap; the playground has shipped guided sliders and a guided tour. A sweep against
  `src/verification.rs` corrected five more rows that predated their validations: the
  Cowell force model and batch/sequential orbit determination against Orekit 12.2,
  ground-station passes against Orekit's elevation detector, the dilution-of-precision
  kernel against gnss_lib_py, and OEM import against the independent `oem` parser; the
  verification-and-validation row now names the guards that check every cited test
  exists.

- **The glossary explains what a result file says.** `docs/GLOSSARY.md` gains
  plain-language entries for the output terms (holdover, p95, integrity, the security
  score, PDOP, `sigma_y`, `q_wf`), the telecom timing terms (time error, max|TE|, cTE,
  dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) and the three evidence tiers
  (VALIDATED, MODELLED, PARTNER).

- **Abbreviations are spelled out at first use in every hand-written public doc.** The
  README and 24 files under `docs/` had several hundred abbreviations used before, or
  without, their expansion; each is now expanded where it first appears in that file.
  The three generated files (`docs/VERIFICATION-MATRIX.md`, `docs/MODELLED-RATIONALE.md`,
  `docs/SCENARIOS.md`) are left alone: they are written from `src/verification.rs` and
  `api::list_scenario_kinds()`, so their wording has to change at the source.

- **Line coverage has a measurement of record.** `docs/COVERAGE.md` records 95.63 %
  (37,697 of 39,419 lines) from the CI `coverage` job on `b1d350d`, and
  `tests/coverage_figure_doc_sync.rs` pins the five public "~96%" surfaces to it — the
  one headline number that was hand-maintained, and had already moved once unnoticed.

- **New doc-sync gates for surfaces nothing read.** `tests/readme_code_fences_doc_sync.rs`
  checks every `import { … } from "kshana"` in a JavaScript fence against the
  WebAssembly exports, and pins README.crates.md's Rust example byte-for-byte to a copy
  the test binary compiles. `tests/security_md_doc_sync.rs` fails if `src/lib.rs` loses
  `#![forbid(unsafe_code)]` or SECURITY.md stops stating it. `tests/no_overclaims.rs`
  now also scans `web/README.md` and the three registry READMEs, and every standard on
  the site must state its `proof` explicitly.

- **The two real-hardware clock checks run on a runner.** `realdata-clock.yml` (monthly
  and on dispatch) fetches the 5071A and PHASE.DAT series and runs both tests with
  `KSHANA_REQUIRE_REALDATA=1`, so a missing input fails instead of skipping. Both fetch
  scripts are pinned to one allantools commit and verify SHA-256.

- **The Python type stub is checked against the built wheel** (`mypy.stubtest` in the
  bindings job), which is how `csv`/`write_csv` shipped unstubbed.

- **The glossary defines URE, EOP, FoM, CTI and TIB**, which the README and ledger used
  bare.

- **Every kind's published field contract is now true, and a test holds it there.** Five
  of the 61 kinds changed. Kinds with a non-empty `required_fields` go from 21 to 22:
  `ephemeris` now requires `tle|orbit+epoch` (a bare `kind = "ephemeris"` used to pass
  `--validate` and then fail the run), and `quantum-trade` adds
  `candidate_adev_taus+candidate_adev_values|candidate_clock_class`, which its run
  already demanded. A required entry may use `|` (one of these) and `+` (all of these
  together); `--validate` understands both. `lunar-joint-od-clock`, `pvt` and
  `earth-gnss-lunar` publish 9 real optional fields they had left out.
  `docs/SCENARIOS.md` now says `kind` is required for every kind except `clock`.
  `tests/required_fields_are_true.rs` checks every kind against its shipped scenario:
  removing any required entry must make the run fail, and a document holding only the
  required fields must run.

- **The JetBrains Marketplace notes are gated.** `scripts/check-version-sync.sh` now fails
  unless the newest `<change-notes>` entry in `plugin.xml` names the version being
  shipped; seven published versions had served the 0.22.0 notes unchanged.

- **The technical report's coverage figure is the measured one.**
  `paper/kshana-technical-report.md` said "near 97 %"; it now says near 96 % (95.63 %
  measured, `docs/COVERAGE.md`) and is the sixth surface the coverage test pins.

- **The off-main-thread engine client is tested** (`web/engine.test.mjs`, in CI): dispatch
  allowlist, cancel and respawn, the three main-thread fallback routes, and crash
  recovery, against a fake worker.

- **Nothing is published until the tagged commit has passed its tests, and a release is
  not done until every registry serves it.** The order is now tag, verify, publish,
  parity, site, in one run of `release.yml` ([`docs/RELEASING.md`](docs/RELEASING.md)).
  - *Publish waits for the verdict.* `publish.yml`, `mcp-publish.yml` and
    `jetbrains-plugin.yml` no longer start on the tag push; `release.yml` calls them from
    jobs that `needs: verify`. Before, they raced it: on v0.27.2 crates.io, npm and the
    Python Package Index (PyPI) had all published within 4.5 minutes of the tag, and
    `verify` returned 84 minutes after it; on v0.27.0 npm and PyPI published while the
    crates.io job failed. A manual retry on a tag is held by the new
    `scripts/check-release-verdict.sh`, which requires a green `verify` for that exact
    commit from the Actions interface and fails closed on anything else.
  - *Everything is built before anything is uploaded*, and crates.io, whose packaging
    step is the one that failed mid-release, publishes first.
  - *A missing registry token fails the job* instead of skipping the upload and
    reporting success.
  - *A parity check after publishing.* `scripts/check_channel_parity.py` polls
    crates.io (`kshana` and `kshana-mcp`), npm, PyPI (the source distribution and all six
    platform wheels) and ghcr.io until each serves the version, or fails the run; docs.rs
    and the Model Context Protocol (MCP) registry are reported, not required. Run against
    past releases it finds 0.22.0 missing from npm and PyPI, 0.23.0 from PyPI and 0.27.0
    from crates.io.
  - *Prebuilt command-line binaries for macOS (Apple silicon and Intel) and Windows
    x86-64*, named by target (`kshana-aarch64-apple-darwin` and so on), beside the Linux
    `kshana`, whose name is unchanged. A `SHA256SUMS` file covers every asset, and
    `verify-release` checks it and runs the macOS and Windows binaries on their own
    systems.
  - *kshana.dev shows a release, not `main`.* It used to redeploy on every push to `main`
    while its pages named the last release. `pages.yml` now builds only a release tag:
    the release dispatches it once every channel serves the version, and a manual
    dispatch redeploys the latest release (or a named one).
  - *One source of wheels.* `publish.yml`'s hand-copied six-target matrix is gone; it
    calls `wheels.yml`, so the auditwheel tag gate and the byte-reproducibility check now
    grade the wheels PyPI receives, and a failure in either stops the release.
  - *Pinned build tools.* Every workflow requests Rust 1.93.0 (the msrv job its own
    version); `publish.yml` and `pages.yml` had requested `@stable`, and the v0.27.2 log
    shows rustup installing 1.98.1 and then compiling with 1.93.0 only because
    `rust-toolchain.toml` outranks it. wasm-pack is pinned to 0.13.1 (the version that
    built v0.27.2, which the unpinned installer script chose) with a checksum check, and
    mcp-publisher to 1.8.1 with its published SHA-256. `scripts/check-toolchain.sh` now
    fails if a workflow asks for another compiler or pipes a downloaded script into a
    shell. No verification job, golden pin or local gate script was removed or loosened.

### Security

- **Every third-party GitHub Action is pinned by commit SHA** — 93 references across
  15 workflows, 92 of them newly — with the tag kept as a trailing comment for
  Dependabot to update. The exception is `dtolnay/rust-toolchain`, whose tag is the
  toolchain selector.

- **The MCP server image's base layers are pinned by multi-arch digest**, and
  Dependabot now watches `mcp/kshana-mcp`'s Dockerfile, so the OS layers still receive
  security updates — through a reviewed PR.

- **The tag-versus-manifest check runs in the two publish workflows that ship the tag's
  version.** `mcp-publish.yml` (ghcr image, MCP registry) and `jetbrains-plugin.yml`
  (Marketplace) race `publish.yml` rather than wait for it, so a mis-cut tag was gated
  only in a sibling. Both now run `scripts/check-version-sync.sh` before building.

- **Four advisories Dependabot raised the day its alerts were switched on are fixed.**
  The MCP server moves from `rmcp` 1.7 to 2.2: three advisories against `rmcp` < 2.1 (a
  Streamable-HTTP session-table leak, missing OAuth protected-resource validation, custom
  headers following a cross-origin redirect) — none reachable here, since the server
  speaks stdio only, but a published crate should not pin a vulnerable SDK. `rmcp` 2's
  macros need Rust 1.88, so `kshana-mcp` alone now declares `rust-version = "1.88"`; the
  `kshana` library stays at 1.85. The one API change (`Content` → `ContentBlock`) is
  applied, and the round-trip tests pass. The SonarQube scan action moves from v5 to v6,
  which fixes an argument-injection advisory (≥ 4.0, < 6.0).

## [0.27.2] - 2026-09-22

### Added

- **Every Rust item a verification-matrix row cites is now resolved against the
  crate.** The existing guard checked the citations shaped like file paths; 63 of
  the 164 non-partner rows name their evidence as an in-crate item instead —
  `navsignal::code_tests`, `integrity::tpl_scalar::tests`,
  `api::tests::tracking_loop_kind_round_trips_through_the_dispatch` — and a token
  with no `.rs` suffix was invisible to a path scanner. Those rows could have
  named a renamed module, an emptied test module or a function that never
  existed, and every gate would have stayed green.

  `tests/verification_rows_name_a_test_that_exists.rs` resolves all 339 such
  citations through the module tree, requires every non-partner row to name at
  least one test that actually carries `#[test]`, and requires partner rows to
  name none. Four mutations were used to grade it: renaming a cited module,
  pointing a row's only test citation at a non-test function, renaming the real
  `mod tests`, and stripping the `#[test]` attributes from it — each goes red on
  the assertion that owns it.

  One row was already wrong: *Alternative / complementary PNT* cited `tests/*`, a
  glob, which is not a citation. It now names
  `tests/alternative_complementary_pnt_reference.rs` and the three in-crate test
  modules behind it.

- **The published figures are re-checked against the engine on every build**
  (`tests/published_figures_still_reproduce.rs`). The three README demo charts are
  the engine's own `chart.svg` output and nothing re-ran the scenario; the paper's
  two crossover studies were generated once and committed; and the README states
  four figures of merit in prose beside `scenario-fom.png`. All three are now
  pinned to live engine output.

  Reconciling them turned up the useful result: the demo charts had been drawn at
  engine 0.22.0 and the paper's crossover JSON at 0.20.0, and at 0.27.1 **every
  plotted value in all five artefacts is identical** — the three chart SVGs differ
  from a fresh run by exactly two characters each, the version stamp in the
  footer. The charts have been re-rendered so the footer is true. The paper's JSON
  is deliberately left stamped 0.20.0: it is the record of the run whose figure a
  published paper embeds, and restamping it would claim a provenance the PDF does
  not have. The guard asserts the stronger property instead — that the current
  engine still reproduces every published value.

### Fixed

- SonarCloud analyses were recorded as `VERSION=not provided`, so the
  `previous_version` new-code period never advanced: it was still anchored at the
  2026-07-02 analysis, grading eighty-two days of work as a single delta and
  measuring 7877 "new" duplicated lines against a 3 % threshold. The scan now
  passes the crate version. The underlying duplication is real and is not hidden
  by this: it is concentrated in the declarative `FieldUnit` registries repeated
  across `ensemble`, `hybrid`, `fusion`, `inertial` and `report`, and in the
  168-row verification table, and it is named here as work rather than excluded
  from measurement.

- **`scripts/gate.sh` had no single-writer lock, and every run wrote the same log.**
  That is not tidiness: the receipt's `integration_binaries`, `tests_passed` and
  `tests_ignored` are read back OUT of that log, and the pre-push hook trusts the
  receipt. A gate that was killed but whose test binary was still alive kept
  writing into the file the next run had just truncated — so one run's counts
  could have been certified as another run's, authorising a push on the strength
  of a suite that never ran on the tree being pushed. It is now one gate per
  checkout (refusing with exit 75 alongside a live one, clearing a stale lock
  whose pid is gone) and one log per run, with `target/gate-run.log` refreshed
  from the finishing run on the way out. Both directions are tested: a live pid
  refuses, a dead one is cleared.

- `src/verification.rs` claimed its tests "do **not** prove the named test/oracle
  strings resolve to live code". Two guards now do exactly that, so the module doc
  said the opposite of the truth; it now states what is machine-checked and what
  is left to human judgement. A stale reference to `verification::gen` — the
  module is `artifacts` — is corrected in the sibling guard's own documentation.

### Changed

- **`main` was rewritten on 2026-09-22 and force-pushed.** Ten commits became
  four. The rewrite folded each commit that left a gate red into the commit that
  cleared it, so every commit on `main` now has a tree that passes, and removed
  the cancelled runs that a branch-wide concurrency group had been leaving on
  every superseded commit.

  Nothing was discarded. The pre-rewrite commits remain reachable through the
  tags that point at them, and the final tree is byte-identical to the tree the
  rewrite started from — `git diff` between the old tip and the new one is empty
  apart from the three workflow files this release changes.

  The superseded SHAs, for anyone holding a reference to one:

  | old | subject |
  |---|---|
  | `9733177` | docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s |
  | `5d16ea8` | fix(docs): the engine-flow diagram said 6 figures of merit; the engine scores 7 |
  | `148d31d` | fix(test): two more cross-platform pins, and two wrong assumptions of my own |
  | `a3a2667` | feat(web): surface the lunar cluster on the site — seven capability cards |
  | `1e8bec6` | docs(lunar): document 42 public fields and ratchet the ceiling down to 985 |
  | `7bba514` | chore(release): v0.27.0 |
  | `3154548` | test(docs): guard the distribution diagram, the last unguarded one |
  | `7864142` | chore(release): v0.27.1 |

  **The v0.27.0 and v0.27.1 tags were deliberately NOT moved.** They still point
  at `7bba514` and `7864142`, the exact commits whose trees produced the
  artefacts now live on crates.io, npm, PyPI, ghcr.io and the MCP registry. A
  crate's `.cargo_vcs_info.json` records the sha1 it was packaged from, registries
  are immutable, and the SLSA build-provenance attestation on the v0.27.1 release
  assets is bound to that commit. Moving the tags would have left every one of
  those published artefacts pointing at a commit that no longer exists. Leaving
  them keeps the old commits reachable and every published provenance chain
  resolving, at the cost of two tags that are no longer ancestors of `main` —
  which is why this release exists: v0.27.2 gives `main` a tag of its own,
  packaged from a commit that is on it.

  This is the second disclosed rewrite of this history; the first, on
  2026-09-21, canonicalised authorship and is recorded in the 0.27.0 notes with
  its own two dangling crate sha1s. A rewrite is disclosed here every time,
  because a repository that sells verifiable provenance cannot quietly move the
  ground under a published artefact.

## [0.27.1] - 2026-09-22

### Fixed

- **The published crate did not compile.** `src/lunar_orientation.rs` holds a
  top-level `include_str!` of `tests/fixtures/llr_geometry/de440_moon_pa.csv`,
  and the manifest excludes `/tests/fixtures` from the package, so the tarball
  crates.io receives was missing a file the library itself embeds. The v0.27.0
  publish failed its verification build for that reason and no 0.27.0 reached
  crates.io; npm and PyPI, whose jobs do not depend on it, published normally.
  The exclusion now carries an exception for that one catalogue.

  Every other `include_str!` of a fixture in `src/` sits inside a `#[cfg(test)]`
  module and so never reaches the packaged library. Only a top-level one does.

- **Nothing in CI ran `cargo package`,** which is why a tarball that cannot
  compile was first discovered by the publish job, after two other registries had
  already shipped. A `package` job now builds and compiles the exact tarball on
  every push.

### Changed

- The lunar-frame-realisation emission pins no longer move on a version bump. The
  SVG footer carries the engine version, so every release re-baselined three
  hashes — twice in one day — and a pin re-taken by routine stops being read. The
  version string is normalised to a placeholder before hashing, and the emission
  is separately asserted to state the running version, so that fact is checked
  more precisely than the hash ever checked it.

## [0.27.0] - 2026-09-22

### Added

- **`lunar-llr-datum` — the lunar frame datum from a real observing campaign.**
  `lunar-frame-campaign` replaced an injected Helmert transform with a *simulated*
  campaign and said so: its station network, its schedule and its per-observation
  sigma are illustrative inputs. This scenario removes the simulation from the two
  places where a schedule and an error model enter the answer. The epochs are the
  transmit times of 337 archived ILRS lunar laser ranging normal points
  (2015-04-08 .. 2015-06-27, Grasse MeO 7845 and Matera MLRO 7941, all five
  retroreflector arrays), and every observation weight is that normal point's own
  archived precision, `bin_rms / sqrt(n_raw)` — a median of 5.13 mm of one-way
  range, out of the file rather than chosen here. Station coordinates come from
  IERS ITRF2020 and the reflector coordinates from JPL DE430 Table 7; each fixture
  records a URL, a retrieval date and a SHA-256 and regenerates from its source by
  a committed generator that verifies the source and aborts rather than emit a
  number. The report names which links are measured and which remain modelled, and
  the modelled ones are *measured*: the observed-minus-computed one-way range over
  the real data is 156 494 m RMS, which the same test set confirms against JPL
  Horizons over the same span (195 655 m RMS vector, worst epoch 0.054° — inside
  the ~0.3° the built-in analytic lunar series claims for itself). Additive: a new
  kind, a new reader (`realdata::llr_crd`) and a new module (`lunar_llr`); the
  existing lunar frame packs are pinned bit-for-bit.

- **`sigma_ure_m` as a scenario parameter** on `lunar-integrity` and
  `moonlight-service-volume`. The signal-in-space ranging accuracy was a
  compile-time constant (`LUNAR_SIGMA_URE_M`), so a service-volume sweep could
  only ever answer pass/fail at one fixed value. Protection levels are exactly
  linear in it, so exposing it turns the sweep into a ranging-accuracy
  **requirement** over the whole volume. The default reproduces prior behaviour
  bit-for-bit.
- **Per-satellite geometry export** on `moonlight-service-volume`:
  `export_site_lat_deg` + `export_site_lon_deg` add a `per_sat_geometry` array
  giving azimuth, elevation and slant range to every satellite at every epoch
  for one named selenographic site, plus the visibility flag. The aggregate
  coverage summary deliberately collapses per-satellite geometry, but slant
  range is exactly what a link budget consumes, so a joint
  communications-and-navigation analysis could not be done from the summary
  alone. Off unless both coordinates are given; purely additive.
- `lunar_service::topocentric`, the public look-angle helper behind the export.
- A verification-matrix row for the new geometry capability.
- **The real antenna pattern in the geometry export.** The engine has carried a
  uniformly-illuminated circular-aperture pattern since P1
  (`antenna::pattern_gain_dbi`, the Airy `[2·J₁(x)/x]²` form) and **nothing
  outside `antenna.rs` used it** — a boresight gain paired with a
  gain-to-beamwidth rule of thumb was doing the work instead. An optional
  `export_antenna` table on `moonlight-service-volume` (read only when the export
  site is set) now gives every exported row the **off-boresight angle at the
  satellite** and the **transmit gain toward the site from that pattern**, and
  adds an `antenna_pattern` block that reports the **in-beam count under the real
  pattern beside the in-beam count under the symmetric approximation**
  (`θ₃dB[deg] = √(31000/G_lin)`) with the difference as a named correction. Both
  numbers are emitted; neither replaces the other. Measured at the engine's own
  representative lunar aperture (1 m dish, 2.4 GHz, η = 0.60) over a south-polar
  site and the illustrative LCNS-class shell, the two **disagree by more than one
  satellite**: the real pattern puts 0 of 76 visible links inside the half-power
  beam, the approximation claims 28 — a correction of −2.33 satellites per epoch,
  worst single epoch 3. The approximation carries an aperture efficiency of its
  own (0.641 against the `70·λ/D` degrees rule it is normally quoted with, 0.920
  against a uniform circular aperture), so on a η = 0.60 dish it returns a beam
  1.238× too wide; the block emits both implied efficiencies rather than leaving
  them to be inferred. Purely additive: measured over the documented working
  point, 597 pre-existing leaves, **0 changed, 0 removed, 494 added**.
- `antenna::symmetric_beamwidth_rad`,
  `antenna::symmetric_relation_implied_efficiency`,
  `antenna::within_half_power_beam`, `antenna::HALF_POWER_DROP_DB`,
  `antenna::SYMMETRIC_GAIN_BEAMWIDTH_CONST_DEG2`,
  `antenna::UNIFORM_APERTURE_HPBW_COEFF` and
  `lunar_service::nadir_off_boresight_rad`, the public pieces behind it. The
  pattern is also now anchored against the published Airy constants rather than
  only against itself: the half-power crossing is located by bisection and
  compared with `x = 1.61634`, which makes the exact half-power width
  `1.02899·λ/D` and records honestly that the conventional `1.02` coefficient
  puts `pattern_gain_dbi` at **−2.955 dB**, not −3.010 dB.
- **A long-form reproducibility table for `lunar-time-budget`.** The scenario's
  array-valued outputs — the averaging-time grid, the seven per-term `x(τ)`
  curves and their root-sum-square total — reached consumers only as JSON
  arrays. One released table was truncated at 400 characters and published 23 of
  its 57 averaging times under a column that claimed all of them, and the
  manuscript rebuilt the per-term curves from closed forms because the engine
  never emitted them. A plain run now also writes `<scenario>.table.csv` with one
  row per (grid index, averaging time, term), which cannot be truncated into
  something that still looks whole. The grid index is an exact join key; `τ` is
  written to 13 significant figures and each `x` to 7, so the bytes do not fork
  between builds of the same source. Purely additive: the report JSON is
  byte-identical.
- **The `hybrid-optical-rf` report now describes itself.** A `link_configuration`
  block echoes the resolved link inputs — carrier wavelength, transmit and
  receive aperture, range, pulse width, integration time, efficiencies and
  losses — with defaults applied, so a paper states the configuration it ran at
  instead of quoting a default read out of the source. A `units` block gives the
  unit and provenance class of every quantity a paper is likely to quote. The
  handoff covariance traces are the reason it exists: they were emitted as a
  bare `variance` and a manuscript inferred square metres from an internal
  consistency check. The inference was right, which is exactly why it was a
  defect — nothing would have caught it being wrong. Purely additive: measured
  across four configurations, 456 pre-existing fields, **0 changed, 0 removed,
  196 added**.
- A verification-matrix row for the time-budget reproducibility table, honestly
  `InternalConsistency` / **MODELLED** — the total is checked against the
  root-sum-square of the terms in the same file, which shares the engine's own
  term definitions and is therefore not an independent oracle. Together these
  add three rows. The running total for this unreleased section is
  **168 rows — 64 VALIDATED, 100 MODELLED, 4 PARTNER**.

### Changed

- **Commit authorship across the whole history is now a single identity, and two
  published crates point at a commit that no longer exists.** On 2026-09-21 the git
  history was rewritten so that every human commit is authored and committed by
  `ashfordeOU <236818772+ashfordeOU@users.noreply.github.com>`. It previously carried
  three spellings of one person — 688 commits as `ashfordeOU <contact@ashforde.org>`,
  34 as `Chakshu Baweja <contact@ashforde.org>` and 94 already canonical. The one
  `dependabot[bot]` commit was deliberately left as its own author: relabelling a bot's
  dependency bump would claim authorship of work nobody here did.

  **No content changed.** The rewrite touched author and committer headers only, and
  that is checkable rather than asserted: the tree of every tag and every branch is
  bit-identical to what it was before. `v0.26.0` still resolves to tree
  `92284e9420605568f1bfabb78cd95d383b40f3e2`, exactly as it did.

  **What it cost.** A commit's name is a hash over its tree, its parents and its author
  headers, so changing an ancestor renames every descendant. The `v0.26.0` release
  commit was `dce2dbf7700788cf6de46260c14673c0e5347360` and is now
  `d4921f3025569e00e425e1747d0acfc261e96e18`. Two artifacts recorded the old name at
  publish time and cannot be corrected, because a published registry version is
  immutable by design:

  - `kshana` 0.26.0 on crates.io — `.cargo_vcs_info.json` records `dce2dbf…`
  - `kshana-mcp` 0.26.0 on crates.io — the same sha1, `path_in_vcs: mcp/kshana-mcp`

  Nothing else is affected. The npm package records no `gitHead`, and the PyPI
  distribution records no commit at all; both were checked rather than assumed.

  There is no repair that makes `dce2dbf…` name the rewritten commit: that string *is*
  the old ancestry, and the only way it resolves is to keep the pre-rewrite history
  published, which would restore the authorship the rewrite removed. Provenance for
  0.26.0 therefore runs through the tag rather than through the recorded sha1 — and the
  tag delivers the identical bytes the crate was built from. The next release records a
  valid commit with no action needed.

### Fixed

- **`realtime-frame-eop` defaulted to an EOP file with no prediction rows (G12).**
  The scenario embedded a five-row *final-only* `finals2000A` excerpt as its
  offline default, so a bare run reported `predicted_rows.n = 0` and the
  per-horizon table rested on 5, 4, 3 and 2 pairs. The engine could always read
  a prediction row — the input simply had none. The default is now the verbatim
  IERS 2026 extract (`tools/finals2000A_2026.txt`, MJD 61173–61204): 20 Bulletin B
  finals and **12 Bulletin A prediction-only rows**, so a bare run with no file
  argument and no network reports `predicted_rows.n = 12` and a per-horizon table
  at n = 20 / 31 / 30 / 29, and the operational-predictor comparison and the
  agreement against the product's own published predictions populate too. The
  long-span 45-row extract was measured as the alternative and rejected: it is
  also final-only, so it would have left `predicted_rows.n` at 0.
  **This moves published numbers**, under rule R4 and with founder authorisation:
  ten of the 22 cells of the released `p4_frame_eop.csv` and 24 of the 42
  populated cells of `tests/golden/realtime-frame-eop.csv`. The measured
  rapid-minus-final pole floor becomes 0.0678 mas (from 0.0769 mas), which is
  the value paper P4's own polar-motion table already publishes at n = 20 — the
  two now agree instead of differing by 13.5 %. Every other figure P4 prints from
  this table is unchanged at the precision printed. The full old → new
  enumeration, including the fields that did *not* move, is in
  [`docs/revisions/G12-default-eop-cell-changes.md`](docs/revisions/G12-default-eop-cell-changes.md).
  The final-only excerpt remains shipped, byte-pinned and exercised: a zero
  prediction-row count on it is the file's property, and a test still proves it.

- **A stale satellite clamp in `moonlight-service-volume`.** The scenario
  clamped `n_sats` to 12 although its own constellation builder supports 24 and
  a test asserts 24, so every requested count above 12 was silently reduced and
  a satellite-count sweep returned identical values above 12 — indistinguishable
  from genuine geometric saturation. Now clamped at the builder limit. This is a
  behaviour change for `n_sats > 12` only.
- **The same stale clamp in `lunar-differential-pnt`.** `lunar_dpnt` clamped
  `n_sats` to 12 with the same consequence, and this one reached a published
  table: `dpnt_nsats_sweep.csv` carries an `n = 16` row byte-identical to its
  `n = 12` row, because the engine returned a twelve-satellite answer under a
  sixteen-satellite label. Now clamped at the builder limit of 24, and a new
  test pins it — each larger constellation must both report its own count and
  strictly improve the protection level, so the clamp cannot return unnoticed.
  **This moves published numbers**: the `n = 16` protection level becomes
  16.92 m → 14.57 m. Swept to 24, the curve is strictly monotone (11.94 m at
  24 satellites, 29.5 % better than at 12), so there is no saturation at 12 —
  the apparent plateau was the clamp. Behaviour change for `n_sats > 12` only.

## [0.26.0] - 2026-09-18

A documentation, transparency and playground release. No engine behaviour
changes: the verification matrix stands at **102 rows — 56 VALIDATED, 42
MODELLED, 4 PARTNER**, unchanged from 0.25.0.

### Added

- **Crate-level rustdoc** (`//!` in `lib.rs`) covering entry points, the
  honesty/tier model and reproducibility, so docs.rs opens on a real landing
  page rather than a bare module wall.
- **`docs/SCENARIOS.md`** — a per-kind reference for all **50** scenario kinds,
  generated from `api::list_scenario_kinds()` (the single source of truth) by
  `gen_validation_artifacts` and guarded by
  `tests/scenarios_reference_doc_sync.rs`, so it cannot drift from the
  dispatcher.
- **Module docs** for the 11 previously-undocumented public modules (`allan`,
  `estimator`, `fom`, `hybrid`, `inertial`, `models`, `report`, `run`,
  `scenario`, `timetransfer`, `types`).
- **Literature sources** for five formula modules that stated an equation but
  named no reference: `batch_ls` (Tapley/Schutz/Born; Bjorck), `cr3bp`
  (Szebehely; Koon et al.), `detection` (Kay), `attitude_budget` (Wertz; Sidi),
  `reentry` (Allen-Eggers, NACA TR-1381).
- **A published `security.txt`** on kshana.dev for coordinated disclosure.
- **Per-run validation tier in the playground.** The single-run figure-of-merit
  table now carries a per-figure VALIDATED/MODELLED pill read from the same
  `fomTier()` lookup the downloadable report uses (mirroring `src/fom_label.rs`,
  itself derived from the verification matrix), so the tier shown beside a live
  number can never disagree with the ledger.
- **`lunar-attack-surface`** in the playground menu — all 50 dispatchable kinds
  are now one click away (was 49/50).
- **Five more runnable capability cards** (space-weather, RF-impairment eval,
  resilience, CCSDS OEM interop, KIF), lifting runnable cards from 11 to 16.
  API- and library-only cards keep an honest docs link rather than a fake run
  button.

### Changed

- **Documentation coverage is now ratcheted in CI.** `check-doc-coverage.sh`
  compiles the library with `missing_docs`, counts the warnings, and fails only
  if the count rises above a pinned ceiling (986). A hard `#![warn(missing_docs)]`
  under `-D warnings` would have turned ~1000 currently-undocumented public items
  into an overnight build break; this way new undocumented public items fail the
  build while the existing backlog is paid down deliberately.

### Fixed

- **The MCP `list_scenario_kinds` tool row advertised "~17 built-in scenario
  kinds"** while `api::list_scenario_kinds()` had exposed 50 for some time — an
  agent-facing doc understating real capability threefold. Pinned to the true
  count.
- Regenerated the CycloneDX SBOM conformance oracle for the updated dependency
  graph (60 components). The conformance verdict is unchanged: zero normalized
  schema errors and every atomic licence id still in the official SPDX
  enumeration.

## [0.25.0] - 2026-07-15

### Added

- **Five capabilities promoted to externally VALIDATED**, each now cross-checked
  against an independent third-party implementation of the same uniquely-defined
  quantity (non-circular, with regenerable-offline fixtures):
  - **IEEE-1139 power-law → Allan-deviation conversion** against `allantools` closed
    forms for all five noise types (`tests/powerlaw_oadev_reference.rs`);
  - **CRPA MVDR / minimum-norm null-steering beamformer weights** against numpy/scipy
    LAPACK (`tests/crpa_reference.rs`);
  - **Wahba / TRIAD / QUEST attitude determination** against SciPy's SVD
    `Rotation.align_vectors` on noiseless observations (`tests/wahba_reference.rs`);
  - **CCSDS 502.0 OEM covariance-block interchange** round-tripped through the
    independent `oem` library's parser (`tests/ccsds_oem_covariance_reference.rs`);
  - the **square-law acquisition detection-statistics kernel** (generalized
    Marcum-Q / P_d / P_fa / threshold) against SciPy `ncx2`/`chi2`
    (`tests/acquisition_reference.rs`).
  The machine-checked validation matrix moves to **56 VALIDATED · 42 MODELLED · 4
  PARTNER** across **102 rows** (was 51 · 47 · 4). Honest scope caveats are preserved
  — e.g. the acquisition promotion covers the detection-statistics kernel only;
  CFAR/straddling loss stays MODELLED.
- **Position-domain figures of merit** (`fom::positioning_performance`): exact CEP,
  SEP and 2DRMS from a navigation solution's 3-D ENU position covariance plus a
  horizontal protection level. CEP/SEP are the *exact* median radial errors (not the
  `0.589·(σ₁+σ₂)` linear rule), cross-checked against `scipy.stats` rayleigh/maxwell
  quantiles and an independent NumPy Monte-Carlo median
  (`tests/positioning_fom_reference.rs`). Replaces the previous honest
  not-implemented stub — **the function signature changed** from `()` returning an
  error to `(cov_enu, hpl_m)` returning a `PositioningFom`.
- **Confidence-interval equivalent-degrees-of-freedom (EDF) completed for all
  Allan-family estimators** (`assurance::uncertainty::edf`): the modified-Allan,
  Hadamard and total-variance EDF now use the Greenhall & Riley combined-EDF
  algorithm and the NIST SP 1065 Table-7 TOTVAR form (previously only the
  overlapping-Allan EDF was implemented; the others silently reused it), cross-checked
  against `allantools` `edf_greenhall`/`edf_totdev`
  (`tests/uncertainty_edf_reference.rs`).
- **Independent external cross-checks for the lunar-PNT geometry, DOP, EOP, DRO and
  RF-ranging capabilities** (`tests/validate_p*.rs`, with fixtures and oracle
  generators under
  `tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/`).
  Each check drives an already-shipped **modelled** capability against an oracle
  produced by a *different* implementation, so agreement is non-circular: the orbital
  transmit/capture footprint against `scipy.special.j1` (Cephes — a genuinely
  different Bessel J1); the surface-beacon geometry DOP against an independent NumPy
  `(HᵀH)⁻¹` solve; the UT1/EOP persistence prediction-error growth against a separate
  NumPy re-parse of the same verbatim IERS `finals2000A` rows; the planar
  distant-retrograde-orbit family against the NASA/JPL Three-Body Periodic Orbit
  Database; and the RF ranging-precision budget against a first-principles reference.
  These are additional regression evidence for existing modules; adding these
  cross-check tests does not itself relabel any capability (the five promotions above
  are separate, oracle-backed status changes in `src/verification.rs`).
- **`lunar-attack-surface` scenario** (`src/attack_surface.rs`, `kind =
  "lunar-attack-surface"`): a composed, binary-reachable (CLI / Python / MCP / wasm via
  `run_toml`) P1 lunar signal-security run that stitches together the link-budget power
  deficit and its 12–18 dB sensitivity band, the required jam/spoof transmit power vs
  standoff, the orbital capture footprint under a real antenna pattern, the
  tracking-loop spoof-capture pull-in outcome, the airless-body horizon reach, and the
  OSNMA/TESLA authentication budget. An empty body reproduces the P1 baseline.
- **Power-deficit sensitivity band** (`linkbudget::deficit_sensitivity_band`,
  `deficit_power_factor`): a genuine multi-axis sweep (reference × EIRP × slant range)
  built on `sweep::SweepAxis` and evaluated through `received_signal_power_dbw`,
  reproducing the P1 12–18 dB band and reconciling the 32× (rounded) / 36× (unrounded)
  linear-factor figures.
- **Three-dimensional spoof-capture cube** (`spoof_capture::capture_cube`): adds the
  carrier/Doppler-offset axis to the capture map (J/S × code-offset × carrier-offset,
  lock time per cell); the zero-carrier slice exactly reduces to the 2-D `capture_map`.

### Changed

- **Sparse-monitor-network detection** (`monitor_network`) now composes the physical
  `spoof_monitors` AGC statistic and the `lunar_service` selenographic visibility grid
  to derive each station's detection statistic and geometry, instead of free parameters
  and an ad-hoc great-circle overlap; the per-monitor and network detection
  probabilities remain the `detection` chi-square/Marcum-Q closed forms. **The
  `SurfaceMonitor` / `SpoofEvent` fields changed** to physical (lat/lon/alt/power)
  quantities.

### Fixed

- **OSNMA/TESLA authentication-overhead sizing** (`nma_budget`): the per-page OSNMA
  field portions (8-bit HKROOT + 32-bit MACK per 2 s page) were mislabeled as
  per-subframe totals, understating the overhead 15× (1.33 bit/s). Corrected to the
  published SIS-ICD per-30 s-subframe totals (HKROOT 120 + MACK 480 bits ⇒ **20 bit/s**).
  The consequence is now stated honestly: at a 50 bit/s AFS nav rate the authentication
  overhead is a **first-order ≈40 %** cost, not a negligible few percent; the
  `auth_latency` field is documented as the key-disclosure delay (a lower bound on the
  end-to-end time-to-first-authenticated-fix).

## [0.24.0] - 2026-07-09

A broad capability release. It lands two fully **externally-validated** analysis
suites — a complete **multi-criteria decision-analysis (MCDA)** family and the
**Allan wander / long-τ clock-stability** estimators — and opens a new runnable
**lunar time-budget, real-time frame/EOP, optical/RF-hybrid, cislunar-observability
and layered-PNT conflict-resilience** scenario layer on top of the substrate, plus a
**lunar surface-beacon** and **signal-security** capability substrate. The
machine-checked validation matrix grows to **51 VALIDATED · 47 MODELLED · 4 PARTNER**
across **102 rows** (was 40 · 47 · 4 across 91): all eleven new rows are
external-oracle validations of the decision-analysis and timing estimators, checked
against independent libraries (SciPy, pymcdm, pyDecision, allantools) to tight
tolerance, while the new PNT capability surface is surfaced honestly as MODELLED. As
ever, no numeric model claim is upgraded without an external dataset behind it.

### Added

**Runnable scenarios** — each a registered scenario `kind`, dispatched through the
engine and CI-proven end-to-end by `tests/determinism.rs` (which runs every bundled
`scenarios/*.toml` and hard-fails on any unrunnable fixture):

- **Layered-PNT conflict-resilience** (`conflict-resilience`, `src/conflict_resilience.rs`)
  — a seeded Monte-Carlo resilience engine for a multi-layer PNT architecture, with a
  §4.2 **per-vector graceful-degradation survival** model (four named threat vectors,
  the usable-PNT survival closed form each per-layer Monte-Carlo converges to, emitted
  in the result JSON) and documented, drift-guarded threat-parameter provenance
  (`src/conflict_threat_params.rs`). MODELLED architectures; the survival Monte-Carlo →
  closed-form convergence is the Validated core.
- **Cislunar observability** (`cislunar-observability`, `src/cislunar_observability.rs`)
  — an observability-Gramian eigen-spectrum over an arc, a differential-corrected
  distant-retrograde-orbit (DRO) seeder, and an independent square-root-information-filter
  cross-check whose posterior covariance turns finite exactly at full observable rank.
  MODELLED constellation; the rank/Gramian/STM/SRIF invariants are the Validated core.
- **Heterogeneous optical/RF hybrid continuity & integrity** (`hybrid-optical-rf`,
  `src/hybrid_integrity.rs`, `src/optical_availability.rs`, `src/optical_linkbudget.rs`,
  `src/cross_raim.rs`) — cross-domain availability and integrity when optical and RF PNT
  are combined. MODELLED.
- **Endogenous lunar time-budget** (`lunar-time-budget`, `src/lunar_time_budget.rs`) and
  **real-time frame / EOP budget** (`realtime-frame-eop`, `src/realtime_frame_eop.rs`,
  `src/frame_eop.rs`) — the P3/P4 lunar-time and Earth-orientation budgets derived
  endogenously from the timing chain rather than asserted. MODELLED.

**Externally-validated analysis suites** — library capabilities, each entering the
matrix as new VALIDATED rows (checked against an independent external oracle, not a
self-check):

- **Full multi-criteria decision-analysis (MCDA) suite** (`src/mcda/`) — the four
  method families: value aggregation (**WSM**, **WPM**, **WASPAS**), ratio system
  (**MOORA**) and proportional (**COPRAS**), distance-to-ideal (**TOPSIS**), compromise
  programming (**VIKOR**), and outranking (**PROMETHEE II** with six generalised-criterion
  shapes, **ELECTRE I** concordance/discordance) — plus **AHP** Perron-eigenvector
  priority weights with the Saaty Consistency-Ratio (CR < 0.10) gate, **MAUT** utility,
  Pareto-front extraction, and weight-**sensitivity** analysis. The nine aggregators
  reproduce **pymcdm** / **pyDecision** and the AHP eigenvector matches SciPy/LAPACK, all
  to < 1e-9 (`tests/mcda_*_reference.rs`). The sensitivity tornado is also surfaced inside
  the conflict-resilience scenario.
- **Allan wander & long-τ clock-stability estimators** (`src/allan.rs`) — **MTIE** (the
  ITU-T G.810/G.823/G.8261 peak-to-peak time-error wander statistic sync masks are written
  against), **MDEV** and **TDEV** time-domain wander, and **Theo1 / TOTVAR** extended-range
  estimators. VALIDATED against **allantools** on the NIST SP 1065 series; the bias-removed
  **ThéoH** hybrid built on TOTVAR stays honestly MODELLED.
- **Assurance / external-oracle harness** (`src/assurance/`) — an oracle harness wired
  directly to the CI honesty gate, a **W3C-PROV** provenance record with a deterministic
  Merkle root, and **Greenhall** equivalent-degrees-of-freedom + chi-square confidence
  intervals on stability estimates.
- **PackRegistry / ExternalPack extension seam** (`src/registry.rs`, `src/api.rs`) — a
  dispatch seam so capability packs route through one registry (built-in dispatch is on
  the CLI hot path; out-of-tree packs attach behind a defaulted `ExternalPack::register_into`),
  guarded by a golden byte-identity conformance suite and standalone / wasm32 CI gates.

**Modelled capability substrate** — new library modules feeding the scenarios above and
future ones (not yet a standalone scenario `kind`):

- **Lunar surface-beacon DOP** (`src/lunar_beacon.rs`) with realized-accuracy budget,
  N-satellite sweep and GDOP map, plus a perturbed lunar ephemeris (`src/lunar_perturbed.rs`)
  and airless-horizon geometry / spoof-power inverse / AFS deficit band
  (`src/jamming.rs`, `src/linkbudget.rs`). Reuses the gnss_lib_py-validated DOP kernel.
- **LOLA-format DEM ingest** + terrain line-of-sight (`src/realdata/lola_dem.rs`).
- **Signal-security three-layer defense** — spoof-capture, cross-sensor integrity and
  monitor-network sizing (`src/spoof_capture.rs`, `src/cross_sensor_integrity.rs`,
  `src/monitor_network.rs`) with an orbital-beam antenna footprint and an OSNMA
  authentication budget (`src/antenna.rs`, `src/nma_budget.rs`). MODELLED.

### Changed

- The validation matrix and every derived artifact were regenerated from the single
  source of truth (`src/verification.rs`): the on-site ledger, the module-map and
  validation-provenance diagrams, and the README / per-surface count strings now read
  **51 / 47 / 4 of 102** (was 40 / 47 / 4 of 91); the count-honesty guard now scans full
  git history, and the README figures are unified on the dark brand palette.
- One shared adaptive integration driver now backs both `integrate` and `integrate_dopri`
  (`src/integrator.rs`), removing the duplicated stepper.
- **SonarQube Cloud** static analysis added to CI (Rust + imported coverage), with
  security / maintainability / reliability rating badges on the README.
- Kshana is packaged as a **Claude Code plugin** (one-command marketplace install) that
  wires the MCP server and a `/kshana-run` command, alongside multi-host MCP integration
  docs (Claude Code, Claude Desktop, Codex, Cursor, VS Code, Windsurf, JetBrains).
- Release / packaging discipline: CI registers a deployment environment per
  package/registry publish, and the focused public-standalone job is scoped off the slow
  validation binaries.
- The no-attribution hygiene guard is scoped to authorship markers only, so naming an
  integration host or product no longer fails the build.
- Documentation: the README **Citing** section now lists the four published arXiv
  preprints, and the surface-beacon DOP capability is documented in the lunar row.

### Fixed

- Integer loop counters for float-driven loops (Sonar S2193).
- Accurate chi-square inverse at low degrees of freedom via Newton refinement in the
  assurance confidence-interval path.
- kshana.dev: the standards section now opens by default and the ledger count fallback is
  corrected; stale README / site strings around the observability layer synced.

## [0.23.0] - 2026-06-29

A capability release adding a general **Fisher-information / Cramér–Rao
observability and optimal-experiment-design layer**, and the release the lunar-PNT
observability paper rests on. The machine-checked validation matrix grows to
**40 VALIDATED · 47 MODELLED · 4 PARTNER** across **91 rows** (was 39 · 46 · 4
across 89): the new estimation engine is checked against an external oracle and is
VALIDATED; the lunar application of it is honestly MODELLED. As ever, no numeric
model claim is upgraded without an external dataset behind it.

### Added
- **`src/fim.rs` — Fisher information, Cramér–Rao bounds, and optimal experiment
  design.** A general, reusable estimation-theory engine: the Fisher information
  matrix `M = HᵀWH` from a measurement Jacobian and weights; a symmetric
  eigensolver (cyclic Jacobi); the Cramér–Rao lower bound via the inverse, or the
  Moore–Penrose pseudo-inverse plus a null-space basis when the information is
  rank-deficient (the free-network / datum-defect case); and D-, A-, E- and
  T-optimal experiment-design metrics with a `best_design` selector over candidate
  geometries. **VALIDATED** against NumPy (`eigh`/`inv`) and the published
  closed-form bounds of Kay (1993) to 1e-9 (`tests/fim_observability_reference.rs`),
  so it enters the matrix as an external-oracle row rather than a self-check.
- **Lunar joint-OD observability** (`lunar_observability` in
  `src/lunar_combination.rs`, surfaced on the lunar-combination report): applies the
  FIM/CRLB engine to the joint orbit-and-clock solve to expose the absolute-station
  datum defect, its rank restoration as Earth-baseline stations are added, the
  attained station-position CRLB, and the E-optimal conditioning. Honestly
  **MODELLED** — the estimation engine is externally validated, but the lunar
  network it is applied to is a representative simulation, and no current dataset
  can turn that geometry into a measurement.
- **Representative elliptical-lunar-frozen-orbit (ELFO) geometry** for the
  lunar-combination scenario (`orbit_ecc`, `orbit_inc_deg`, `orbit_argp_deg`,
  `orbit_planes`; circular placement stays the default) and a without-VLBI
  observability field on the report, so the datum-defect result can be shown to be
  geometry-general. The same 3→1→0 ladder and three-station threshold hold on a
  Moonlight/LCNS-family ELFO, and with three Earth VLBI baselines the absolute
  station position is observable at a sub-metre bound — locked by
  `elfo_geometry_confirms_the_observability_structure`. Still MODELLED.

### Changed
- The validation matrix and every generated evidence artifact were regenerated from
  the single source of truth (`src/verification.rs`): the ledger
  (`web/data/verification-matrix.json`), `docs/VERIFICATION-MATRIX.md`,
  `docs/MODELLED-RATIONALE.md`, the validation-breakdown and oracle-kind figures,
  and the README count strings across all distribution surfaces now read
  **40 / 47 / 4 of 91**.

## [0.22.1] - 2026-06-29

A packaging-only patch release. No engine, scenario, or result changes; the
validation matrix is unchanged at 39 VALIDATED · 46 MODELLED · 4 PARTNER across
89 rows.

### Fixed
- npm publish: the package `repository.url` derived from the crate manifest used
  the wrong-case GitHub owner (`AshfordeOU`), which failed npm's sigstore
  provenance verification (it matches the owner case-sensitively). The manifest
  `repository` is now the canonical lowercase `ashfordeOU`, so the generated
  `package.json` matches the provenance subject and the npm release publishes.

### Changed
- Wheel build pins `codegen-units = 1` so the manylinux wheel is byte-reproducible
  across rebuilds (the rebuild-and-diff reproducibility check).

## [0.22.0] - 2026-06-29

A consolidation release focused on **evidence, provenance, and distribution discipline**.
The machine-checked validation matrix grows to **39 VALIDATED · 46 MODELLED · 4 PARTNER**
across its **89 rows** (was 15 · 42 · 4 across 61), driven by cross-validating modelled
capabilities against independent external oracles. Every distributed artifact now carries
a cryptographic SLSA build-provenance attestation, ships a CycloneDX SBOM, and is published
in lockstep across all surfaces. No numeric model claim is upgraded without an external
dataset behind it; new capability remains honestly MODELLED.

### Added

- **Attitude dynamics** (`src/attitude_dynamics.rs`, MODELLED) — torque-free rigid-body
  Euler equations + quaternion kinematics (RK4), with conservation-law self-tests
  (quaternion norm, kinetic energy, |Iω|, symmetric-top precession).
- **Cross-validation of modelled capabilities** against independent external oracles,
  taking the validation matrix to 39 VALIDATED rows, each backed by an external dataset
  (the CI honesty gate forbids a VALIDATED status without one). The newest external-oracle
  validations: the **optical-clock measured stability curve** (`quantum_trade`'s ADEV-curve
  fit reproduces the published ⁸⁸Sr optical-lattice-clock σ_y(τ) of Norcia et al.,
  *Science* 366:93 (2019), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, vendored under
  `tests/fixtures/optical_clock_adev/`); **GPS L1 C/A spreading-code generation**
  (`src/sdr.rs`'s G1/G2 LFSR reproduces the IS-GPS-200 Table 3-Ia code-phase octals for
  PRN 1–9); and the **SRTM digital-elevation reader on real terrain** (`src/altpnt/terrain.rs`
  reads a vendored public-domain NASA/USGS SRTM v3 tile, N36W117 / Death Valley, placing
  Badwater Basin within its documented survey band).
- **New MODELLED capabilities**, each internally cross-checked against a closed form or a
  sibling code path: Clohessy–Wiltshire / Hill relative-motion dynamics, TDOA/FDOA passive
  emitter geolocation, Wahba/TRIAD/QUEST attitude determination, GNSS carrier-phase integer
  ambiguity resolution (LAMBDA), B-plane targeting & patched-conic gravity assist, CRPA
  anti-jam array beamforming, GNSS square-law acquisition statistics, quantum inertial-sensor
  fringe-ambiguity / dynamic range, IEEE-1139 power-law clock noise + flicker-FM floor, and
  CCSDS-OEM covariance-block interchange.
- **Single-source evidence ledger** with generated verification docs and a drift guard;
  a browsable validation ledger on kshana.dev with per-card evidence deep-links.
- **Machine-readable citation metadata** — `codemeta.json` (CodeMeta 2.0) and
  `.zenodo.json`, pinned to the Cargo manifest by `tests/citation_metadata_doc_sync.rs`.
- **Supply-chain provenance** — SLSA build-provenance attestation for the crate tarball,
  wheels, sdist and npm tarball; PyPI OIDC Trusted Publishing; CycloneDX SBOM shipped
  inside the wheel and npm package; reproducible-build diff and post-release verification.
- **Discoverability** — `robots.txt`, `sitemap.xml`, and Open Graph / JSON-LD metadata on
  kshana.dev; a generated `validation-breakdown` figure derived from the matrix.
- **Per-surface READMEs** for crates.io / PyPI / npm with a count honesty guard.

### Changed

- **Sagnac time-transfer** oracle upgraded to ExternalDataset — the equatorial-
  circumnavigation Sagnac correction is now checked against Ashby's published 207.4 ns
  (*Living Reviews in Relativity* 6:1, 2003, Eq. 1.29; reproduced to < 0.05 ns). The
  composite time-transfer capability remains honestly MODELLED.
- **Documentation, diagrams and figures refreshed** to the live matrix (39/46/4/89): the
  validation-provenance diagram, the `oracle-kind-stacked` figure (now generated from the
  matrix with a CI drift-guard), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS,
  the architecture and tutorial docs, and the kshana.dev ledger total.
- Reformatted the source tree with the pinned rustfmt (toolchain 1.93.0) — pure style,
  no behavioural change.
- **Lockstep versioning.** Every distribution surface (crate, PyPI, npm, MCP crate +
  OCI image, JetBrains plugin) now versions in lockstep with the engine, enforced by
  `scripts/check-version-sync.sh` in CI.
- **JetBrains plugin** relicensed to **AGPL-3.0-only** (the published 0.1.1 still
  advertised Apache-2.0) and now derives its Marketplace version from the release tag.
- **Robustness hardening** — non-test `unwrap`s removed or justified; `clippy::unwrap_used`
  gated on non-test code.
- **kshana.dev** proof-first overhaul: dominant hero, architecture diagrams and result
  figures, i18n, collapsible/responsive ledger and Standards sections.

### Fixed

- **SP3 precise ephemeris** — apply the IGS Earth-rotation node correction during
  interpolation.
- **Registry images** — PyPI/crates.io/npm READMEs use absolute image URLs; the main
  README's relative image paths rendered as broken images on the PyPI 0.21.0 page. A CI
  guard (`tests/surface_readme_image_urls_doc_sync.rs`) prevents the regression.
- **CI** — `fmt` + `clippy` green; stop compiling against git-ignored real data.

### Tests

- Kalman clock covariance stays PSD and symmetric (property test, `tests/property.rs`).
- Doc-sync guards: every public validation-count string, citation metadata, the generated
  figure, and surface-README image URLs are all pinned to their source of truth.

## [0.21.0] - 2026-06-26

This release adds two MODELLED application suites to the open engine — a
**Quantum-Enabled PNT demonstrator** (trusted quantum time transfer, GNSS-free
quantum navigation, quantum fault/anomaly detection) and a **lunar / cislunar PNT
suite** (lunar coordinate time, lunar VLBI, joint OD+clock, frame realisation,
service-volume, differential PNT, interoperability export) — each runnable from one
`kind`, each emitting an honest `TradeEvidence` record plus a representativeness /
gaps-to-flight ledger. It also lands **six new external-oracle validations**, taking
the machine-checked validation matrix to **15 VALIDATED · 42 MODELLED · 4 PARTNER**
across its 61 rows. The new application numbers are MODELLED from illustrative
public-source parameters — no TRL, flight heritage, certification, or agency
endorsement — and the validated kernels they reuse are labelled as such.

### Added

- **Quantum-Enabled PNT demonstrator suite** (`quantum-time-transfer`,
  `quantum-gnss-free-nav`, `quantum-anomaly-detect`). Three runnable MODELLED
  application areas behind the engine, each emitting `TradeEvidence` plus a
  representativeness / gaps-to-flight record:
  - **Trusted quantum time transfer** (`src/timetransfer_chain.rs`) — an
    optical-lattice-clock + photonic-link vs CSAC + RF two-way budget, reusing the
    timing protection level, with a delay/replay-attack security FoM (1 − P_md) and
    clock-anomaly detection + CUSUM latency.
  - **GNSS-free quantum navigation** (`src/quantum_nav_od.rs`) — a cold-atom-
    interferometer inertial coast vs a navigation-grade INS across a GNSS outage,
    honest that with no external fix the accelerometer bias stays unobservable so the
    error still grows.
  - **Quantum fault / anomaly detection** (`src/quantum_faults.rs`) — a labelled
    fault catalogue with a bootstrap-CI ROC AUC and a minimum-detectable-fault at a
    fixed false-alarm rate.
  - A shared quantum device error-model library (`src/quantum_devices.rs`) and a
    unified quantum-vs-classical trade harness (`src/qtrade.rs`) underpin all three.
- **Lunar / cislunar PNT suite.** Seven runnable MODELLED `kind`s layered on the
  CR3BP core: **Lunar Coordinate Time** (LTC/TCL − TT secular rate, `src/lunar_time.rs`),
  geodetic **lunar VLBI** delay observable (`src/lunar_vlbi.rs`), **joint
  multi-technique OD + clock** batch estimator (`src/lunar_combination.rs`),
  **reference-frame realisation** (7-parameter Helmert + IAU 2015 WGCCRE tie,
  `src/lunar_frame_realise.rs`), **Moonlight / LCNS-class service-volume** analysis
  (`src/lunar_service.rs`), **lunar differential PNT** (`src/lunar_dpnt.rs`), and a
  **LunaNet / IOAG-aligned interoperability export** (CCSDS-OEM + lunar time scale in
  the KIF envelope, `src/lunar_interop.rs`). All MODELLED from illustrative
  public-source parameters; not validated against real VLBI / Gateway tracking; no
  agency affiliation or endorsement.
- **Six new external-oracle validations** (the validation matrix now stands at 15
  validated):
  - **ADEV / HDEV on a real 5071A caesium clock** — validated against Stable32
    decade-point references (`tests/cs5071a_reference.rs`).
  - **OADEV / MDEV / TDEV on the Stable32 `PHASE.DAT` reference** — validated against
    Stable32's published tables (`tests/phasedat_reference.rs`).
  - **Anomaly-detection ROC AUC on real ESA OPS-SAT telemetry** — validated against
    scikit-learn (`tests/opssat_ad_reference.rs`).
  - **ICGEM gravity-functional synthesis** — validated against the GRS80
    normal-gravity standard (Somigliana γ to 3.5e-12; EGM2008 disturbance map,
    `tests/icgem_gravity_reference.rs`).
  - **Klobuchar broadcast ionosphere model** — validated against RTKLIB
    (`tests/klobuchar_reference.rs`).
  - **RAIM detection kernel** (171 cases, `tests/raim_reference.rs`) and the **SBAS
    DO-229E protection level** on real EGNOS data (RTKLIB SBAS-PL fork,
    `tests/sbas_reference.rs`) — both validated against their external oracles.
- **Representativeness & gaps-to-flight ledger** (`src/representativeness.rs`). A
  structured record every demonstrator emits — what is representative, what is
  simplified, and what stands between the model and flight — the honest companion to
  every MODELLED trade.
- **Study aggregation & CLI ergonomics.** A scenario-suite manifest with one-command
  study aggregation, hash-stable study metadata + `--study-name`, `--validate`
  scenario linting, and per-FoM validation-tier surfacing in study reports.

### Changed

- **kshana.dev redesigned around a shared domain spine** — capabilities and
  validation folded into one domain explorer with a common vocabulary, the new
  validated islands surfaced, a land-accurate animated Earth instrument and a
  request-a-study CTA, and the Ashforde OÜ branding/links.
- **README + ARCHITECTURE audited for completeness and honesty** — stale validated
  counts corrected (now 15 external oracles), the diagrams extended, and the
  Conditional Timing Protection Level (arXiv:2606.24210) and RF-impairment
  optimism-gap (arXiv:2606.22054) preprints cited.
- The `paper/` sources and the JOSS draft pipeline are kept in the public repo.

## [0.20.0] - 2026-06-22

This release adds four study capabilities to the open engine — a conditional Timing
Protection Level, framework-aligned PNT-resilience scoring, an RF-impairment
optimism-gap evaluation, and a software-defined-receiver / real-data front end — each
reproducible from one command and writing a byte-deterministic artifact. All studies
are MODELLED (synthetic or public-dataset calibration), carry their honest provenance
(engine version, seeds, config hash) and validation labels, and are not
certifications.

### Added

- **Conditional Timing Protection Level (`tpl`).** A holdover-limited bound on the
  undetected time error under GNSS spoofing, with a k-sigma monitor floor, a van Loan
  coast variance over the detection latency, and a CUSUM time-to-alarm. Calibrated on
  a real recorded attack (JammerTest 2024, scenario 2.1.1) via
  `cargo run --release --example tpl_jammertest`, which reproduces its reference table
  from scalars recovered from the public recording (the raw dataset is not
  redistributed).
- **Framework-aligned PNT-resilience scoring + decision-instability study
  (`resilience`).** Architecture model, RPCF-aligned scoring, Dirichlet weighting
  simplex, Kendall-tau and top-1 flip-rate instability, and common-mode diversity
  collapse (Hill-N2), with `cargo run --release --example resilience_report --
  paper-artifacts/resilience-study.json`. Crosswalk in
  [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md).
- **RF-impairment optimism-gap study (`impairment_study`, `impairment_ml`,
  `eval_stats`).** A 13-detector panel over a parameter-grounded synthetic corpus, an
  in- vs out-of-distribution optimism gap, scaling-law trends with a permutation
  null, and a leave-one-out degradation predictor, via
  `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json`.
- **Software-defined-receiver front end (`sdr`) and real-data adapters
  (`realdata/`).** Raw IQ/IF to correlator taps and SQM, plus ingest adapters
  (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) and probe examples.
  These read recordings the user supplies locally; no recordings are committed.
- **Committed study artifacts.** The byte-deterministic `optimism-study.json` and
  `resilience-study.json` are now tracked under `paper-artifacts/` so the study
  numbers can be checked without rebuilding; they remain regenerable from the
  generators above. Raw datasets stay out of the repo (`/realdata-cache/`).

### Changed

- Version bumped to 0.20.0 across `Cargo.toml`, `CITATION.cff`, and `README`; the
  crossover study artifacts are regenerated so their stamp matches the released
  version.

## [0.19.0] - 2026-06-18

### Changed

- **Relicensed from Apache-2.0 to the GNU AGPL-3.0-only, with a commercial licence
  available from Ashforde OÜ (dual-licensing).** The open engine stays fully open and
  publicly verifiable; the AGPL's network-copyleft (§13) means a closed or hosted
  derivative must come back to open source — or take a commercial licence. This
  defends the validated core against fork-and-close while keeping the credibility of
  a public, runnable, auditable engine. See [`LICENSE`](LICENSE) (AGPL) and the new
  [`LICENSING.md`](LICENSING.md) (what each licence covers and when it applies).
  - `LICENSE` now contains the AGPL-3.0 text; SPDX headers across all sources updated
    to `AGPL-3.0-only`; `NOTICE`, `README`, `GOVERNANCE`, `GLOSSARY`, the website, and
    crate/package metadata (`Cargo.toml`, `pyproject.toml`, `CITATION.cff`, the MCP
    crate + image) updated accordingly.
  - **Contributor terms** ([`CONTRIBUTING.md`](CONTRIBUTING.md)) now license inbound
    under the AGPL **and** grant Ashforde OÜ the right to include contributions in the
    commercially-licensed edition, so the dual-licence keeps working.
  - **Dependency policy unchanged but re-justified** ([`deny.toml`](deny.toml),
    `GOVERNANCE`): dependencies stay permissive (Apache/MIT/BSD/ISC). AGPL is allowed
    only for kshana's own crate — a copyleft *dependency* would taint the commercial
    edition and break dual-licensing.
  - **Note for downstream:** this is a copyleft relicence. Users who relied on
    Apache-2.0 permissive terms can continue using the last Apache-2.0 release
    (`v0.18.0` and earlier, as published); `v0.19.0` onward is AGPL-3.0 / commercial.

### Security

- **Bumped `pyo3` 0.24 → 0.29** to clear RUSTSEC-2026-0176 / RUSTSEC-2026-0177
  (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) from external OSV/dependency scans.
  Both are *function-level* advisories whose affected functions
  (`BoundList/TupleIterator::nth`/`nth_back`, `PyCFunction::new_closure`) Kshana
  never calls, and `pyo3` is an optional (`python`-feature) dependency — so the
  real exposure was nil — but the bump keeps a clean scan for downstream auditors.
  Migrated `src/python.rs` to the pyo3 0.29 API (Bound return type for
  `scenario_kinds`; explicit `skip_from_py_object` on the `RunOutput` pyclass).
  All 11 Python binding tests pass against the rebuilt extension.

## [0.18.0] - 2026-06-17

### Added

- **Eleven new runnable scenario kinds — two-tender demonstrators, a CCSDS interop
  bridge, and a first-order mission-analysis / environment suite (all MODELLED,
  additive; existing reproducibility goldens unchanged).** Each is CLI / Python /
  WASM / MCP dispatchable, ships a `scenarios/<kind>.toml`, and carries an explicit
  MODELLED label in its result JSON and one-line summary (a per-kind test in
  `tests/dominance_demonstrators.rs` asserts the label is present and that the output
  never contains the string `VALIDATED`):
  - `impairment-eval` (`src/impairment_eval.rs`) — AI/ML RF-impairment detection
    evaluation testbed: a labelled **synthetic** corpus + a detector-agnostic
    **ROC/AUC** harness + an in/out-of-distribution **optimism-gap** report (operating
    characteristics only — never field/IQ data).
  - `quantum-trade` (`src/quantum_trade.rs`) — quantum-vs-classical PNT trade with
    measured-ADEV ingestion and a GNSS-denied resilience envelope.
  - `space-weather` (`src/space_weather.rs`) — solar/geomagnetic indices (Kp↔ap IAGA
    table, daily Ap, centred 81-day F10.7a), **Jacchia-71** exospheric temperature, and
    an activity-driven thermospheric-density coupling over a static atmosphere (NOT an
    NRLMSISE absolute-density model).
  - `oem-interop` (`src/oem.rs`) — **CCSDS 502.0 OEM** import + round-trip bridge for
    GMAT / Orekit / STK ephemerides (the `parse_oem` reader, exact inverse of the writer).
  - `launch-window` (`src/launch.rs`) — two-body **launch azimuth** (`sin Az = cos i/cos lat`),
    plane-change Δv, site-rotation bonus, and daily-opportunity geometry.
  - `reentry` (`src/reentry.rs`) — **Allen-Eggers** ballistic re-entry corridor:
    peak deceleration, peak-g and peak-heating velocities, peak-g altitude.
  - `eo-coverage` (`src/eo_payload.rs`) — EO **swath / GSD / access / revisit** geometry
    (SMAD space-triangle).
  - `space-packet` (`src/space_packet.rs`) — **CCSDS 133.0-B Space Packet** primary-header
    encode/decode with bit-exact round-trip.
  - `attitude-budget` (`src/attitude_budget.rs`) — 3-DOF **gravity-gradient torque** +
    **RSS pointing-error budget** (scalar pre-hardware budget, not a control loop).
  - `passes` (`src/passes.rs`) — ground-station **rise/set pass prediction** (AOS/TCA/LOS,
    max elevation, access).
  - `link-budget` (`src/linkbudget.rs`) — one-way **CCSDS-401 / DSN-810-005** link equation
    (`C/N₀ = EIRP − FSPL − L_other + G/T − k`, FSPL / Eb·N₀ / margin / closure).

- **17-state hybrid quantum + classical tightly-coupled UKF — surfaced as a runnable
  scenario (MODELLED).** A new `hybrid-ukf` scenario kind (`src/fusion/hybrid_ukf.rs`,
  `scenarios/hybrid-ukf.toml`) that turns the previously API-only 17-state tightly-coupled
  GNSS/INS unscented filter (`src/fusion/tightly_coupled17.rs`) into a scenario the
  CLI/Python/WASM/MCP bindings can dispatch. The 17-state error vector is the **15 INS error
  states** (position, velocity, attitude misalignment, accel + gyro bias) augmented with the
  **CAI-derived accelerometer-bias correction** — the cold-atom interferometer
  (`src/inertial/quantum_imu.rs`) sets the velocity-random-walk floor `q_va`, so the long-term
  coast drift is the quantum-sensor-limited one — and a **2-state phase + frequency clock**
  whose process noise comes from the **q-parameter clock engine**
  (`clock_state::q_from_allan`, mapping a clock's Allan-deviation profile to the `q_wf`/`q_rw`
  PSDs, scaled to range units). The platform is GNSS-aided for a lead-in (the filter learns
  the biases, velocity and clock), then coasts through a GNSS outage on the CAI IMU + clock
  alone, so the run demonstrates **classical-IMU short-term + quantum long-term**
  hybridisation. The figure of merit is **filter self-consistency**: pooled **NEES**
  (Normalised Estimation Error Squared, over the estimable position/velocity/clock subset) and
  **innovation-whiteness NIS** (Normalised Innovation Squared) over a Monte-Carlo ensemble,
  checked against their 95% χ² bands (Bar-Shalom §5.4). The matched filter lands inside the
  bands; a deliberately mistuned filter (the `q_factor` / `r_factor` knobs) is flagged — an
  objectively checkable, discriminating gate, not a rubber stamp. **The NEES/innovation-
  whiteness check is the STATISTICAL ORACLE: a self-consistency statement (the filter's
  reported covariance honestly matches the spread of its own errors under the modelled noise),
  NOT a real-world accuracy guarantee.** Honest scope: everything is **modelled / simulation**
  — the CAI and clock inputs are bracketed, literature-representative values, not measured
  hardware; the CAI hardware and its Key-Person stay partner-owned; nothing here implies
  TRL > 3, flight heritage, or external validation (the result JSON and one-line summary carry
  these labels explicitly). The single constant-velocity, level trajectory leaves attitude and
  IMU-bias states only weakly observable, so NEES is assessed over the 8 estimable states; a
  manoeuvring trajectory for full-17 observability is roadmap. Also adds `Ukf::update_stats`
  (returns the per-update NIS) and `TightlyCoupled17::{update_gnss_nis, nees, nees_subset}`
  consistency instrumentation. All existing scenarios are unaffected (additive; reproducibility
  goldens unchanged).

- **Sequential (recursive) terrain-referenced navigation — SITAN as a running filter.**
  A new `terrain-slam` scenario kind (`src/altpnt/sequential.rs`,
  `scenarios/terrain-slam.toml`) that runs the existing altimeter-vs-DEM measurement
  model **epoch by epoch** through the `particle_filter` SIR engine, rather than the
  batch coarse-to-fine search `terrain-nav` uses to recover a single *constant* INS
  offset. At each waypoint the cloud is propagated by the INS-reported increment (itself
  corrupted by the per-step drift growth), reweighted by the terrain match, and
  resampled on degeneracy — so a **time-varying** INS drift is *tracked* along the
  track, which a constant-offset fit structurally cannot do. On the synthetic DEM the
  recursive estimate stays bounded and re-converges (final ≈ 70 m) while the unaided
  inertial solution diverges unbounded to ≈ 5 km; per-epoch error follows terrain
  distinctiveness (it coasts on the biased INS over flat saddles and re-locks over
  distinctive relief), and the effective-sample-size monitor confirms a healthy cloud.
  Honest scope: the map is **known and fixed** — recursive *localization* against a
  stored DEM (the localization half of terrain SLAM), not joint map estimation;
  non-circular by construction (the injected drift ramp is the independent truth). All
  existing scenarios are unaffected (additive; reproducibility goldens unchanged).

- **GNSS-denied resilience spine + FutureNAV demonstrator slices** (`src/holdover.rs`,
  and resilience-envelope foundations under `src/impairment_eval.rs`, `src/quantum_trade.rs`,
  `src/navsignal.rs`, `src/inertial/quantum_imu.rs`, with FutureNAV verification slices in
  `src/verification.rs`). Composes the alternative-PNT building blocks — clock holdover,
  signal tracking, inertial coast, terrain — into a single GNSS-outage resilience narrative.
  MODELLED; additive.

- **Kshana Interchange Format (KIF) — a versioned, self-describing artifact envelope**
  (`src/interchange.rs`). A schema-tagged wrapper around scenario results so a stored
  artifact carries its kind, schema version, and MODELLED/VALIDATED labels with it, and
  older envelopes stay forward-compatibly readable. Additive; existing result JSON unchanged.

- **Navigation-signal modulation / tracking + CR3BP halo/NRHO differential corrector**
  (`src/navsignal.rs`, `src/cr3bp.rs`). A first-order nav-signal modulation & tracking model,
  and a circular-restricted three-body differential corrector for halo / near-rectilinear
  halo orbits, surfaced on the existing deep-space capability axis. MODELLED.

- **Distribution-shift evaluation mode + corpus severity-scale knob for `impairment-eval`**
  (`src/impairment_eval.rs`). Adds an explicit in/out-of-distribution split and a tunable
  corpus severity scale to the ROC/AUC optimism-gap harness (operating characteristics only —
  never field/IQ data).

- **Cost-per-coverage ROI + detection-miss integrity-impact mapping** (`src/frugal.rs`,
  `src/integrity_impact.rs`). A frugal-engineering ROI lens (cost per unit coverage) and a
  mapping from detection-miss rate to integrity impact. MODELLED; additive.

- **Cited cold-atom-interferometer (CAI) error-model parameter sheet**
  (`src/inertial/quantum_imu.rs`). A literature-referenced, bracketed parameter sheet for the
  CAI inertial model — inputs are **cited, not measured hardware** (no TRL / flight claim); it
  feeds the `hybrid-ukf` velocity-random-walk floor.

- **Project governance.** `GOVERNANCE.md` documenting the decision model and the open/closed
  boundary; the capability map's community/governance row moves `none → partial` to reflect it.

### Fixed

- **ARAIM integrity protection level — nominal bias (`b_nom`) and σ_URA now applied.** The
  MHSS protection level now subtracts the one-sided nominal-bias projection
  `b_k = Σ_i |s_i|·b_nom` per fault mode, and uses the **integrity** sigma σ_URA (distinct
  from the **accuracy** sigma σ_URE) carried on the Integrity Support Message. This makes the
  protection level more conservative and standards-correct, and therefore **changes the PL
  values reported by existing integrity scenarios**. The ISM/scenario gains `#[serde(default)]`
  `sigma_ura_m` / `b_nom_m` fields, so inputs that leave them unset retain prior behaviour. See
  `docs/ARAIM_REFERENCE.md` for the restored `b_k` formula and the honest implementation note.

- **Spoof-monitor χ² consistency.** `parity_raim_test` now uses the shared
  `raim::chi2_quantile` inverse-χ² path, removing a second divergent χ² implementation so RAIM
  and the parity spoof monitor agree on their thresholds.

- **`gravity-map-nav` wired into the CLI dispatcher.** The scenario was previously reachable
  only through the API; it now dispatches as a `kind=` like every other scenario.

- **Documentation/count accuracy.** Scenario-kind counts in the README are now pinned to
  `api::list_scenario_kinds().len()` by a `scenario_count_doc_sync` test, so the documented
  count can no longer drift from the dispatcher.

## [0.17.0] - 2026-06-14

### Added

- **Deep-space & Mars PNT — open radiometric navigation engine + GSE simulation.**
  A new, fully additive capability axis on top of the Earth-validated core (every
  existing Earth scenario is **byte-identical** — the reproducibility goldens pass
  unchanged with no regeneration). Adds: a multi-body dynamics core (`Body{mu, re,
  zonals, gravity, rotation, IAU-pole}` with Mars GMM-3 tesseral gravity, an IAU
  body-fixed Mars frame, a pluggable `EphemerisProvider` seam, sub-microsecond
  two-part Julian dates and TT↔TDB); radiometric observables (iterative light-time +
  Shapiro delay, two-/one-/three-way Doppler & range via the Moyer two-leg solve,
  coherent transponder turnaround, regenerative/PN ranging per CCSDS 414, Δ-DOR per
  CCSDS 506, solar-plasma/tropo/iono media); CCSDS-TDM (503) parse + emit; a
  reduced-dynamic Square-Root Information Filter with RTN empirical accelerations, a
  three-state onboard clock, and a Mars-drag model; a joint one-way + two-way fusion
  estimator; the `mars-pnt` scenario surface (relay constellation + LMO/transfer/
  surface) across CLI, Python, WASM, MCP, and the playground; and an end-to-end GSE
  performance simulator (geometry → link budget → observables → SRIF → covariance).
  **Validation tier — simulation-validated:** synthetic closed-loop OD (Mars-LMO ≈
  0.2 m) and analytic self-consistency, with the Sun-central Mars dynamics
  independently cross-checked against JPL **DE440** (`xval/anise-mars-od`, kernel-gated:
  137 m @ 1-day arc, the honest unmodelled-n-body residual). Reported deep-space
  accuracies are **simulation / covariance figures of merit**, not real-mission
  results; real DSN/ESTRACK tracking-data validation remains on the roadmap. ANISE
  (MPL-2.0, edition-2024) is confined to a workspace-excluded cross-check crate, so
  the `cargo deny` license gate and the MSRV-1.75 job are untouched.
- **Agency-accurate ground tracks from real IERS Earth orientation.** The
  `ephemeris` scenario takes an optional `eop_finals2000a` field — the inlined body
  of a real IERS `finals2000A` file — and reduces the ground track through the
  per-epoch UT1−UTC and polar motion interpolated from it (the same `EopSeries`
  `precise_od` uses), overriding the nominal `dut1_s`/`xp_arcsec`/`yp_arcsec`
  scalars. The data travels in the scenario, so the run stays reproducible and
  needs no filesystem (it works in the WASM playground). A `kshana --eop
  <finals2000A>` flag folds a real file into the scenario from the CLI. Closes the
  asymmetry where only `precise_od` consumed real Earth-orientation data.

### Fixed

- **Range-rate frame consistency.** The ground station is now mapped into the
  inertial frame through the exact inverse of the satellite's reduction
  (`frames::itrf_to_teme`, undoing polar motion *and* the sidereal rotation)
  instead of a polar-motion-blind GMST rotation, so both endpoints share one
  frame. The effect on the reported Doppler is below the validation floor, but it
  removes a real frame mismatch and an "exact" overclaim in the source.
- **`carrier_hz` is validated.** A zero or non-finite carrier frequency now returns
  an error instead of silently producing zero Doppler (it had made λ = c/carrier
  infinite), matching the existing `step_s` guard.

## [0.16.0] - 2026-06-11

### Added

- **Force-model validation by ephemeris fitting, cross-validated against real
  agency products.** A new batch least-squares estimator (`src/precise_od.rs`)
  with a variational state-transition matrix and outlier editing, driven by a
  full force model (`PreciseForceModel`: EGM2008 geopotential, third bodies,
  solid + ocean + atmospheric tides, and empirical CPR/2-per-rev accelerations),
  fed by a real IERS `finals2000A` Earth-orientation parser. Validated against
  published reference orbits: **Galileo MEO to 13 cm post-fit**, ESA **Swarm-A
  LEO**, and **LRO lunar** (selenocentric, GRAIL gravity, IAU-2015 body frame —
  reduced-dynamic 6.6 m, honestly above the 5 m target on the open path; the
  DE-grade ANISE/DE440 path that reaches it is a workspace-excluded crate).
- **`spoof-detect` scenario** — an integrated multi-layer spoofing detector
  combining per-epoch RAIM parity, AGC and signal-quality (SQM) monitors and a
  fused decision, validated against the published **TEXBAT** scenario parameters
  (Humphreys et al., ION GNSS 2012), including the carrier-aligned hard case.
- **`ephemeris` scenario — state, frames, ground track and Doppler.** Propagate
  one satellite (TLE→SGP4 or an analytic orbit) and emit, per step, the inertial
  TEME and GCRS state (**position *and* velocity**), the Earth-fixed ITRF/ECEF
  position, the WGS-84 sub-satellite **ground track** (latitude / longitude /
  altitude), and the topocentric azimuth / elevation / range with range-rate and
  **Doppler** from a ground station. Reachable from the CLI, Python, WASM and the
  MCP server, and shipped as the **"Ground track" preset** in the web playground,
  where the track is drawn **over a real world map** (Natural Earth 1:110m
  coastlines, embedded — no network or external dependency).
- **CCSDS OEM export** (`--export-oem` / `export_oem = true`) — the
  velocity-carrying Orbit Ephemeris Message consumed by GMAT / Orekit / STK, at
  parity with the existing SP3 and OMM exporters.
- **Solid, ocean (FES2004) and atmospheric (Ray 2001 S2) Earth tides** on the
  geopotential (IERS Conventions Ch. 6), wired into the force model.
- **ARM64 wheels** — the PyPI build now also produces Linux aarch64
  (manylinux_2_28), macOS arm64 and Windows arm64 wheels.
- **Extended technical report (preprint)** linked from the README, and the JOSS
  paper made submittable (author ORCID, compiled to PDF in CI on every change).

### Changed

- **Frames validated to the millimetre against published Vallado vectors.** The
  TEME→PEF/ITRF reduction, the full CIO IAU 2006/2000A GCRS→ITRS chain and the
  ECEF→geodetic WGS-84 conversion are now pinned to the worked example in Vallado
  et al. (AIAA 2006-6753) with its IERS EOP, not just to internal self-consistency.
- **Independent time-scale cross-checks.** ERA and the UTC/TAI/TT scales agree
  with `hifitime` to < 1 µs, and the DE440 planetary ephemeris agrees with JPL
  Horizons (Moon/Sun geocentric positions), both as always-on CI gates.
- The web playground hides the figures-of-merit tab when a result carries no
  figure-of-merit rows, so chart-only packs (ephemeris, RAIM, spoof) open on
  their chart — for ephemeris, the ground track — instead of an empty table.
- The playground's guided sliders **and parameter sweep now work for the
  ephemeris / ground-track scenario**: its knobs (station latitude / longitude,
  time step, duration, UT1−UTC) are tunable, and a sweep can plot pass geometry
  (max elevation, peak Doppler, altitude, speed) against any of them — e.g. max
  elevation vs station latitude. The Sweep tab is now shown only when a scenario
  is actually sweepable, so no pack offers a control that plots nothing.
- Documented the SGP4 `DUT1 ≈ 0` approximation at the GMST call site (a ≤ ~13″
  rotation error, well inside SGP4's own model error) and refreshed `CAPABILITY.md`.

## [0.15.1] - 2026-06-09

### Added

- The **Kshana — PNT simulator** JetBrains plugin is now published and approved on the
  [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator).
  README, `kshana.dev`, and the distribution docs link to it directly.

### Fixed

- **MCP registry publish** now succeeds: the `server.json` `description` was over the
  registry's 100-character limit (HTTP 422). Shortened it, and aligned the server name
  (and the image's ownership label) to the canonical namespace
  `io.github.ashfordeOU/kshana-mcp`.
- **JetBrains Marketplace publish** now succeeds: the CI re-uploaded the same plugin
  version that was listed manually, which the Marketplace rejects. The plugin version is
  bumped to `0.1.1`, and the idempotency guard now also treats an "already contains
  version" response as a no-op success.
- **`kshana.dev` cache-busting**: the version-stamped `style.css`/`app.js` query strings
  track the release, so returning visitors always get the current build.

## [0.15.0] - 2026-06-08

### Added

- **`kshana-mcp` — Kshana as a Model Context Protocol (MCP) server** (`mcp/kshana-mcp/`).
  A standalone, workspace-excluded crate (the `rmcp` SDK is edition 2024) that exposes the
  validated engine to AI agents and assistants — Cursor, JetBrains AI Assistant / Junie,
  and any MCP client — over stdio. Tools: `run_scenario`, `list_scenario_kinds`,
  `validate_scenario`, `export_sp3`, `export_omm`, each a thin wrapper over `kshana::api`.
- **JetBrains IDE plugin** (`ide/jetbrains/`). Right-click a scenario `.toml` →
  **Run Kshana Scenario**; figures of merit and result JSON stream into a Kshana tool
  window. Pure-platform Kotlin plugin, compatible with every JetBrains IDE 2024.3+.
- **Public distribution + per-release auto-publish** for both:
  - `kshana-mcp` to **crates.io** (`cargo install kshana-mcp`) via `publish.yml`.
  - `kshana-mcp` as a multi-arch **OCI image** on `ghcr.io`
    (`docker run ghcr.io/ashfordeou/kshana-mcp`) via a new `mcp-publish.yml`.
  - `kshana-mcp` to the **official MCP registry** via GitHub OIDC (zero secrets); the
    registry entry (`server.json`) uses the OCI package type with a label-verified owner.
  - the IDE plugin to the **JetBrains Marketplace** via `publishPlugin` (token-gated,
    optional developer signing) on each release tag.

## [0.14.1] - 2026-06-08

### Added

- **Independent ANISE/SPICE reference-frame cross-validation** (`xval/anise-frames/`).
  A standalone, workspace-excluded crate cross-checks `kshana`'s IAU 2006/2000A CIO
  reduction (`kshana::cio::gcrs_to_itrs_matrix`, GCRS→ITRS) against **ANISE** (the
  pure-Rust NAIF/SPICE reimplementation) rotating GCRF→ITRF93 from JPL's
  `earth_latest_high_prec.bpc`, with the **same IERS `finals2000A` Earth-orientation
  parameters fed to both sides**, over eight quarterly epochs 2020–2023. The two
  independent frame realizations agree to a **maximum relative rotation of 0.028″ —
  ≤ 0.86 m on the ground, ≤ 0.93 m at LEO, ≤ 3.6 m at GNSS orbit**, meeting the
  long-standing ROADMAP "< 10 m" frame cross-check with large margin (it complements,
  and does not replace, the existing bit-for-bit SOFA/ERFA anchors). The crate is
  isolated because `anise` + `hifitime` are MPL-2.0 / edition-2024 and must never enter
  the published `kshana` dependency graph, its `Cargo.lock`, the `cargo deny` license
  gate, or the MSRV build; ANISE is pinned `default-features = false`. Includes a
  `frame-xval` binary (fetches the ~5 MB BPC, prints a table, writes `report.{json,md}`),
  a kernel/network-self-skipping test gate, and an optional `workflow_dispatch`-only CI
  job (never blocks `main`). Documented in `docs/VALIDATION.md` (CIO row) and `ROADMAP.md`.

### Fixed

- **Mobile-friendly playground.** Fixed horizontal overflow of the playground `.panel`
  on phones (a CSS-grid item defaulting to `min-width: auto` rendered ~100 px wider than
  the viewport) via `min-width: 0` and width-guarded controls; verified clean at 360 /
  390 / 414 / 768 px. Aligned the "Pin to compare" / "Download report" action buttons
  (equal margin boxes in the flex row). Enlarged run buttons, sliders, selects and nav
  links to the ~44 px WCAG 2.5.5 / Apple-HIG touch-target minimum on phones and touch
  devices, with desktop sizing unchanged.

## [0.14.0] - 2026-06-08

### Fixed
- **Robustness hardening from an adversarial battle-test pass.** (1) `sbas_protection_level` now
  rejects non-finite elevation/azimuth/variance and negative or non-finite covariance diagonals
  (a near-singular geometry scaled up by small σ could previously slip the absolute-pivot gate and
  return a NaN VPL / absurd HPL as a *valid* `Some` — a silent integrity failure). (2) The
  numerical propagator (`propagate`/`propagate_dopri`) fails closed on a non-finite initial state
  instead of spinning the adaptive controller forever. (3) The DEM cell helper no longer panics on
  a single-sample (1×N) grid. (4) `lunar_look_angle` azimuth is held strictly in `[0, 360)`.
  (5) `SphericalHarmonicField::from_gfc` rejects non-physical (NaN / non-positive) `GM`/radius.

### Added
- **`validation_report` binary + release artifact**: a dependency-free generator that emits a
  one-page, print-ready HTML validation summary indexing every CI-enforced validation (SGP4
  666/666, EGM2008, bit-for-bit frames, NIST Allan, IMU datasheets, ARAIM/SBAS, 3-OS
  reproducibility, coverage) to its test and external oracle. The release workflow generates
  `kshana-validation-summary.html` and attaches it (with SLSA provenance) to each tagged release.
- **numpy-interop pytest + wheel hardening**: `tests/python/test_numpy_interop.py` (run in CI)
  plus a pinned manylinux container and an `auditwheel show` verification step in the wheel build.
- **Tutorials & education**: `docs/tutorials/` (three worked tutorials, per-domain annotated
  scenarios, Tier-1/2/3 exercises) with `tests/tutorials.rs` pinning every quoted number to live
  engine output.
- **External submission artifacts** (`paper/`, `notebooks/`, `submissions/`): a JOSS paper
  draft, a quantum-vs-classical notebook, and ready-to-file kits for awesome-gnss / ESA Navipedia
  / NASA ASCL / ESA ESSR / ION/IAC, plus `FUNDING.yml` — staging the external steps for submission.
- **Terrain-referenced & combined alt-PNT navigation** (`altpnt` module): a TERCOM/SITAN
  terrain-matching navigator over a DEM (`.hgt` loader + synthetic-fixture generator) and a
  combined gravity + magnetic (IGRF) + terrain GPS-denied navigator, exposed as `terrain-nav` and
  `combined-altpnt` scenario kinds. Validated by terrain-match convergence (a known injected
  offset recovered) and a bounded combined-filter error over a GPS-denied window.
- **LunaNet LANS geometry** (`lunar`): named lunar surface sites (Apollo 11/15/16, Shackleton
  rim) with authoritative selenographic coordinates, surface look angles (az/el/range),
  visibility/coverage, and site DOP, validated against the Moon radius, the published site
  coordinates, and the radial-overhead 90° elevation identity.
- **Guided browser playground**: guided-mode sliders, a tabbed output panel, a first-run tour
  overlay, parameter-sweep and multi-run-overlay modes, a dependency-free canvas/SVG 3D orbit
  view (the orbit pack now emits an additive `eci_track`), an embed/iframe mode, and
  download-as-HTML-report — each with node unit tests in CI.
- **Datasheet-validated IMU error model** (`tests/imu_allan_spec.rs`): ADIS16465/16488/16460
  ARW/VRW/bias-instability recovered from the synthesised Allan deviation and checked against the
  manufacturer specs (NIST SP1065 / IEEE 952 identification).
- **NIST SP1065 Allan-estimator validation** (`tests/allan_nist_sp1065_1000point.rs`): the four
  estimators reproduce the published 1000-point reference deviations and Table-32 confidence
  bounds.
- **SBAS / DO-229E protection levels, L1/L5 ionosphere-free, and a DO-316 compliance map**
  (`sbas` module). `sbas_protection_level` forms the weighted geometry matrix from each
  satellite's elevation/azimuth and UDRE/GIVE/airborne/tropo error budget, inverts the normal
  matrix (shared `orbit::invert4`), and projects the variances into HPL/VPL via the DO-229E
  K-factors (PA 6.0/5.33, NPA 6.18). `iono_free_l1l5` adds the GPS L1/L5 ionosphere-free
  pseudorange (IS-GPS-705, `γ₁₅ = 1.79327`), validated to cancel the engine's independent
  first-order ionospheric delay. `do316_compliance_map` traces DO-316/DO-229E requirements to
  the implementing functions. Validated against closed-form K-factor definitions, the numpy
  `inv(GᵀG)` reference geometry, and the two-route covariance identity; the published-PL
  RTKLIB/gLAB conformance cross-check is documented as founder-gated in `docs/COMPLIANCE.md`.
- **Full tesseral spherical-harmonic gravity — the EGM2008 field to degree/order 70.**
  A new `gravity_sh::SphericalHarmonicField` evaluates the geopotential and its acceleration
  in the Earth-fixed frame from fully-normalized `C̄_nm, S̄_nm` coefficients, using the stable
  Holmes–Featherstone normalized Legendre recurrence (de-normalizing would overflow at this
  degree). The shipped coefficients are the NGA EGM2008 product (public domain, via ICGEM),
  bundled in `egm2008_data.rs` and reproduced bit-for-bit by `tools/gen_egm2008.py` from the
  committed `tools/egm2008_to70.gfc`; any ICGEM `.gfc` model loads via `from_gfc`. Validated
  against three independent oracles: point-mass collapse (`C̄00`-only = `−μr/|r|³`), a zonal-only
  field reproducing the existing `forces::zonal_accel` to ~1e-9, and the analytic acceleration
  matching the finite-difference gradient of the directly-summed potential to <1e-6.
- **General-relativistic Lense–Thirring (frame-dragging) acceleration**
  (`forces::lense_thirring_accel`, IERS 2010 Eq. 10.12), the gravitomagnetic term beyond the
  existing Schwarzschild correction, wired into the numerical propagator via a new
  `ForceModel::lense_thirring()` flag. Validated as linear in the Earth's angular momentum and
  1–2 orders of magnitude below the Schwarzschild term, the regime of the LAGEOS / Gravity
  Probe B measurements.
- **A `Propagator` trait unifying the analytic and numerical orbit propagators.** The
  numerical Cowell force-model propagator is now a first-class peer of SGP4: a new
  `NumericalPropagator` type (initial state + `ForceModel` + `Tolerance` + choice of
  step-doubling or Dormand–Prince `Integrator`) and `Sgp4` both implement
  `propagator::Propagator`, whose `state_at(t_seconds) -> StateVector` returns the inertial
  TEME state in SI units (m, m/s) so the two are interchangeable behind a
  `Box<dyn Propagator>`. The SGP4 impl is the exact km/min→SI conversion of the inherent
  method (verified by an equality test); the numerical impl clears the same sub-metre
  exact-Kepler gate through the trait, the two adaptive drivers agree, and a `PropagatorError`
  surfaces the underlying SGP4 code.

## [0.13.0] - 2026-06-08

This release closes the largest correctness gap in the engine: Earth-orientation
and reference-frame reduction are now done to reference-implementation grade
(validated **bit-for-bit against ERFA/SOFA**), the integrity stack gains
**dual-constellation ARAIM** on real GPS+Galileo TLEs, and the propagation,
quantum-sensor, lunar/cislunar, and geomagnetic layers all deepen — alongside a
typed Python API, a richer browser playground, and a three-OS reproducibility
matrix. Highlights:

- **Reference frames, bit-for-bit.** Full IAU 2000A and 2000B nutation, IAU 2006
  precession, the CIO-based (X, Y, s) IAU 2006/2000A GCRS↔ITRS reduction, IERS
  polar motion, and TEME→GCRS/ITRS output frames — each validated bit-for-bit
  against ERFA/SOFA reference routines.
- **Dual-constellation ARAIM** (GPS + Galileo) on real TLEs, with HPL/VPL,
  Stanford-diagram output, and an open `docs/ARAIM_REFERENCE.md`.
- **Cislunar PNT**: an Earth–Moon CR3BP propagator, MCI↔MCMF frames, selenographic
  coordinates, and a runnable LunaNet lunar-integrity scenario.
- **Quantum sensing**: Coriolis and AC-Stark systematics for the cold-atom
  interferometer, a drift sweep, and validation against the Freier (2016) budget.
- **IGRF-14** geomagnetic main-field model, self-contained and validated.
- **Typed Python API** (PyO3 `RunOutput`/`ScenarioMeta`, `.data()`, `scenario_kinds`,
  `validate_toml`, type stubs) with a CI wheel build, plus first-class GCRS/ITRS
  propagator output and CCSDS OMM export.
- **Credibility & reproducibility**: a head-to-head SGP4 accuracy comparison against
  the independent `sgp4` crate, a CI coverage gate (~97% line on `src/`), and a
  three-OS (`ubuntu`/`macos`/`windows`) reproducibility matrix.

### Changed
- **Every playground chart now matches the site theme.** All twelve SVG chart
  generators — the result/holdover chart (`src/report.rs` + `src/chart.rs`), the
  Allan-deviation chart (`web/app.js`), and every scenario chart (`src/hybrid.rs`,
  `jamming.rs`, `timetransfer.rs`, `spoof.rs`, `raim.rs` Stanford + availability,
  `lunar.rs`, `ensemble.rs`, `sweep.rs`, `gnss_sim.rs`, `fusion/pack.rs`,
  `inertial/mod.rs`) — used cool navy panels (`#0e131b`), cool-gray axes/text, and
  a clashing red/blue/purple series palette. They now use the warm graphite palette
  throughout: `--bg` panels, warm `--line` grid, `--fg` labels, with a consistent
  series assignment — quantum = honey-gold (`--accent-bright`), classical = warm
  amber (`--partial`), spec/limit = `--crit`. Safety-coded views keep their
  meaning: the RAIM Stanford diagram stays green (available) / amber (misleading) /
  red (hazardous) / muted steel (unavailable), and HPL/VPL read as gold/bronze.
- **Charts are now self-describing when saved/downloaded.** Both charts bake their
  title into the SVG (the Allan chart's title + "lower is better" subtitle were
  previously only HTML around the image, so a saved image had no caption), and both
  carry a provenance footer — `Kshana v<version> · <scenario-hash> · kshana.dev` —
  so a downloaded chart stands on its own and stays reproducible.
- **Every chart now carries the provenance footer.** The footer —
  `Kshana v<version> · scenario <hash> · kshana.dev` — is stamped centrally for all
  scenario kinds in `api::run_toml` (it was previously only on the holdover and Allan
  charts), so any saved or downloaded image — from the playground, the CLI's
  `.chart.svg` export, or the HTML scorecard — identifies its version, scenario
  fingerprint, and source. The hash is labelled `scenario` for clarity and comes from
  the result's `scenario_hash` where present, with a source-hash fallback for the
  integrity/lunar reports. What the fingerprint is and why it's there is documented in
  the README "Output" section and [`docs/PROVENANCE.md`](docs/PROVENANCE.md).

### Fixed
- **`raim::chi2_quantile` and the RAIM Stanford-noise sampler are now panic-free on
  out-of-range / non-finite inputs** (a `read_dir`-order-dependent fuzz finding from
  the new ARAIM scenarios). `chi2_quantile` now guards `p`/`k` like `normal_quantile`
  (returning a boundary value instead of `assert!`-panicking), and the availability
  Stanford-noise `Normal` clamps to a strictly-positive σ — so the integrity/ARAIM
  stack never panics on mutated or mis-configured scenarios.

### Added
- **Cross-platform reproducibility CI matrix.** A new `reproducibility-matrix`
  job runs the reproducibility tests on **ubuntu-latest, macos-latest, and
  windows-latest** on every push. Because full result JSON is not byte-identical
  across OSes (last-ULP libm divergence), it asserts the platform-invariant
  projection exactly — the input fingerprint plus output shape, pinned per
  scenario as SHA-256 goldens in `tests/golden/` by the new
  `tests/cross_platform_golden.rs` — alongside the numeric pins (`golden.rs`, to
  1e-6), the SGP4 states (`sgp4_verification.rs`, to 2e-5 km), and same-process
  determinism (`determinism.rs`). Together these prove cross-platform
  reproducibility on three OSes without the brittleness of exact full-output byte
  hashing. `docs/REPRODUCIBILITY.md` documents the split.
- **Code-coverage gate in CI.** A new `coverage` job runs `cargo-tarpaulin` with
  the LLVM source-based engine, publishes an lcov report as a build artifact, and
  enforces a line-coverage floor on `src/` (generated data tables, the CLI
  entrypoint, the tests, and web assets excluded). Measured line coverage is
  ~97% on `src/` (SGP4 and the clock modules ≥95%); the gate is set at 85% — above
  the ≥80% target and clear of the measured value, so it catches regressions
  without flaking. A coverage badge is published in the README.
- **SGP4/SDP4 head-to-head against the independent `sgp4` crate.** A new test
  (`tests/sgp4_crate_comparison.rs`) cross-validates Kshana's propagator against
  the most widely used Rust SGP4 library (neuromorphicsystems/sgp4, added as a
  test-only dev-dependency) over the same 666 AIAA 2006-6753 vectors. With both
  driven on the WGS72 gravity model the vectors use, the two independent
  implementations agree to **sub-micron** on near-earth and resonant orbits and
  **4.12 mm worst-case** across all regimes, both reproducing the reference
  `tcppver.out` table. The committed comparison table
  (`tests/fixtures/sgp4_comparison.md`, regenerated via `KSHANA_REGEN_FIXTURES=1`)
  breaks the result out per regime (LEO/MEO, deep-space, ½-day and 1-day
  resonance) and notes the four deliberately-pathological cases the crate rejects
  at construction. The live assertions hold both within 2e-5 km of the reference
  and agree to within 4e-5 km — a regression guard, not a one-off. This is
  competitive pedigree: correctness against an independent codebase, not just a
  static table. (The crate's default `from_elements` uses WGS84 and so differs
  from the WGS72 reference by ~km — surfaced honestly in the table prose.)
- **CCSDS OMM export is now reachable end-to-end.** The OMM writer
  (`src/omm.rs`) previously had no CLI/API path; an `orbit` scenario's mean
  elements can now be published as a CCSDS 502.0-B-2 OMM catalogue — one OMM KVN
  message per TLE-defined satellite — via `kshana <orbit.toml> --export-omm
  out.omm`, or `export_omm = true` in the scenario auto-writes `<scenario>.omm`
  (mirroring the existing `--export-sp3`). Each message carries the satellite's
  **real** NORAD catalogue number, COSPAR international designator (`YYYY-NNNP`),
  and epoch (CCSDS day-of-year form), parsed from the TLE line 1 by the new
  `tle::parse_tle_identity`; the name line becomes `OBJECT_NAME` (else `OBJECT
  <id>`). `CREATION_DATE` is the scenario epoch, not wall-clock, so the output is
  reproducible. New API: `api::export_omm` / `api::auto_export_omm`,
  `OmmFile::from_tle_block`, `OrbitClockScenario::to_omm_string`. A synthetic
  Walker or RINEX scenario (no TLE mean elements) errors rather than emitting an
  empty file. Validated against the bundled 30-satellite `gps-ops` snapshot
  (`tests/sp3_export_roundtrip.rs`).
- **Interactive hover read-outs on the playground charts.** Moving the cursor over
  a chart snaps a crosshair to the nearest sample and shows a value tooltip
  (`web/hover.mjs`, wired in `web/app.js`). On the Allan chart it reads τ and each
  clock's σ_y(τ); on the time-series scenario charts (clock holdover, dead-reckoning,
  time-transfer, hybrid PNT, GNSS/INS) it reads the time and each suite's value in
  the chart's own units (ns / m / ps / utilization), parsed from the result so the
  read-out matches the curve. Specialised diagrams (RAIM, spoof, sweep) get no
  overlay. The charts stay self-describing blob `<img>`s — the overlay is a
  transparent crosshair + tooltip on top, so download/compare/export are untouched.
  Coordinate math (nearest-sample, cursor→plot-fraction, polyline parsing) is
  unit-tested (`web/hover.test.mjs`, run in CI).
- **A/B compare mode in the playground.** Pin any run as a baseline A, run a
  second scenario, and the two are shown side by side with a figure-of-merit
  delta table (holdover, timing RMS/p95, availability) that colours the winner
  per metric (`web/compare.mjs`, wired in `web/app.js`; delta logic unit-tested
  in `web/compare.test.mjs`, run in CI). All values are inserted as text and all
  charts via blob `<img>`, so nothing from a scenario string is ever injected as
  markup.
- **Chart download buttons (SVG + PNG).** Each playground chart now has a
  theme-matched "Download SVG / PNG" toolbar (`web/chartdl.mjs`, wired in
  `web/app.js`). SVG hands back the faithful, scalable original; PNG rasterises
  that same self-describing image at 2x for slides and documents. Files are named
  with their provenance — `kshana-<chart>-v<version>-<scenario-hash>.<ext>` — and
  the filename/size logic is unit-tested (`web/chartdl.test.mjs`, run in CI).
- **IGRF-14 geomagnetic main-field model (`src/igrf.rs`).** The IAGA standard
  spherical-harmonic field (degree/order 13, 2025.0 epoch + 2025–2030 secular
  variation; coefficients machine-generated from the official `igrf14coeffs.txt`
  by `tools/gen_igrf.py` into `src/igrf_data.rs`, bit-for-bit reproducible). A
  Schmidt-normalised synthesis returns the field vector (north/east/down) and
  derived elements (declination, inclination, horizontal/total intensity) at any
  geodetic location/date, plus the geomagnetic pole and dipole strength — the
  magnetic counterpart to the gravity-map matcher for alternative-PNT navigation.
  Validated self-contained: the synthesis matches the exact closed-form tilted
  dipole, the full degree-13 analytic field matches a finite-difference of the
  scalar potential, the dipole axis reproduces the known geomagnetic pole
  (~80.7°N, −72.7°E) and ~29.7 µT strength, and the global field is physical.
- **Typed Python bindings (`src/python.rs`).** Beyond the string-in/string-out
  `run`/`run_full`, the module now exposes a typed `RunOutput` class (`.json`,
  `.svg`, `.summary`, and a `.data()` accessor that returns the result parsed into
  a native Python dict — no JSON re-parsing, NumPy-wrappable), plus `run_typed`,
  `scenario_kinds()` (parsed list of metadata dicts), and `validate_toml()` (a
  non-raising list of error messages). Ships a PEP 561 type stub (`kshana.pyi` +
  `py.typed`) for mypy/pyright/editors and a `docs/PYTHON_API.md` quickstart.
  The existing functions are unchanged.
- **First-class output frames for propagators (`src/orbit.rs` `Frame` enum +
  `position_in_frame` + `state_gcrs`).** Any `Propagator` (Kepler, SGP4, RINEX,
  GLONASS, SP3) can now emit its position in TEME, **GCRS** (≈ J2000), or **ITRS**
  (Earth-fixed) — TEME native, GCRS via the validated TEME→GCRS reduction, ITRS by
  chaining that into the IAU 2006/2000A CIO `gcrs_to_itrs` rotation — and its full
  GCRS state (position + velocity) via `state_gcrs`. The of-date inertial output is
  no longer TEME-only.
- **CIO-based IAU 2006/2000A celestial-to-terrestrial reduction (`src/cio.rs`).**
  The modern, equinox-free GCRS↔CIRS↔ITRS chain: CIP coordinates `X, Y` read off
  the IAU 2006/2000A bias-precession-nutation matrix (reusing the validated FW
  precession + 2000A nutation with the `eraNut06a` P03 adjustment), the 66-term
  CIO-locator `s` series (`eraS06`, machine-generated from the ERFA reference by
  `tools/gen_s06.py` into `src/cio_s06_data.rs`, bit-for-bit reproducible), the
  GCRS→CIRS matrix (`eraC2ixys`), the Earth rotation angle (`eraEra00`), and the
  full GCRS→ITRS rotation (`eraC2tcio`, composed with the existing IERS polar
  motion). Validated **bit-for-bit** against the published `eraXys06a`
  (X=0.5791308482835292617e-3, Y=0.4020580099454020310e-4,
  s=-0.1220032294164579896e-7 at JD_TT 2453736.5), `eraC2ixys`, and `eraEra00`
  test vectors. The CIO chain and the legacy equinox/GMST-1982 TEME reduction are
  shown to agree up to their documented ≈2·(equation of equinoxes) sidereal-time
  convention difference. This is the rigorous reduction the equinox/GMST path
  approximated.
- **Full IAU 2000A nutation series (`src/nutation.rs` `nutation_iau2000a`,
  `nutation_matrix_2000a`).** The complete MHB2000 model — 678 luni-solar + 687
  planetary terms — accurate to < 0.1 mas, alongside the existing 77-term 2000B
  truncation. The tables are machine-generated from the IAU SOFA / ERFA `nut00a`
  reference by `tools/gen_nut00a.py` into `src/nutation_iau2000a_data.rs` (the
  generator reproduces the committed file bit-for-bit), and the whole series —
  both the IERS-2003 and MHB2000 fundamental-argument sets and the planetary
  longitudes — is validated **bit-for-bit** against the published `eraNut00a`
  test vector (Δψ = −0.9630909107115518e-5, Δε = 0.4063239174001679e-4 at
  JD_TT 2453736.5, to 1e-13 rad). The default TEME→GCRS reduction keeps the 2000B
  series (~1 mas, below the chain's velocity-frame-rotation simplification);
  `nutation_matrix_2000a` exposes the < 0.1 mas of-date matrix for callers that
  need it.
- **Runnable lunar-integrity scenario (`kind = "lunar-integrity"`, `scenarios/lunanet-araim.toml`).**
  Wires the lunar south-pole protection-level pass (`src/lunar.rs` `LunarScenario` →
  `south_pole_hpl_pass`) into the scenario runner with a JSON `LunarReport` and an SVG
  HPL-vs-time chart, so the cislunar integrity case is reachable straight from the CLI.
  It honestly surfaces the gap: with the 30 m LANS σ_URE the south-pole HPL (≈ 260–450 m)
  exceeds a 50 m alert limit (0 % available) — lunar PNT integrity is not yet met.
- **Dual-constellation ARAIM availability on real GPS+Galileo TLEs, and scenario-runner
  wiring (`src/raim.rs`, `src/orbit.rs`, `scenarios/araim-gps-galileo.toml`).** Adds
  `araim_dual_constellation_availability` (the advanced ARAIM engine —
  single-satellite *and* constellation-wide faults — run over a time grid) and
  `visible_positions_labeled`, and wires it into the `IntegrityScenario` runner via an
  `araim_dual` flag so a multi-GNSS ARAIM study is reachable straight from TOML. A
  real-data test (`tests/araim_dual_real_data.rs`) on vendored 2026-06-07 Celestrak
  GPS+Galileo snapshots shows pooling Galileo lifts ARAIM availability from 0.21 to
  0.67 under a demanding 12 m VAL (10.5→21.8 satellites in view), while the
  constellation-fault-robust mode is fundamentally limited with only two constellations
  — the quantitative reason robust dual-constellation integrity drives toward a third
  constellation or SBAS. Honest residual: the numerically exact EU ARAIM TN Table A-3
  reproduction against a single version-locked epoch, and a Zenodo fixture record.
- **Circular restricted three-body problem (CR3BP) for the Earth–Moon system
  (`src/cr3bp.rs`).** A new cislunar-dynamics core the two-body/SGP4 propagators
  cannot provide: rotating-frame equations of motion (`cr3bp_accel`), an RK4
  propagator (`propagate_cr3bp`), the Jacobi-constant integral (`jacobi_constant`),
  and the five Lagrange points (`lagrange_points`). Validated against closed-form /
  published anchors: the Earth–Moon collinear points (L1 ≈ 0.83692, L2 ≈ 1.15568,
  L3 ≈ −1.00506), the exact equilateral L4/L5 = (½−μ, ±√3/2, 0), all five confirmed
  as field equilibria, Jacobi conserved to integrator precision under propagation,
  and the out-of-plane restoring force that makes halo/NRHO orbits possible. This is
  the foundation for representing a real NRHO. Honest residual: differential-corrected
  periodic 9:2 NRHO initial conditions, the eccentric/ephemeris (DE) model, and the
  de-normalised transform into the selenocentric frames of `src/lunar.rs`.
- **IERS polar motion and the TEME→ITRF reduction (`src/frames.rs`).** Adds
  `polar_motion_matrix` (SOFA `iauPom00`: `W = Rx(−y_p)·Ry(−x_p)·Rz(s′)` with the TIO
  locator `s′`), `pef_to_itrf` / `itrf_to_pef`, and `teme_to_itrf` — the GMST-based
  TEME→PEF rotation followed by polar motion — completing an ITRF-precise Earth-fixed
  position on top of the GMST-only `teme_to_ecef` (polar motion is a tens-of-metres
  effect at orbital radius). `x_p`/`y_p` are observed IERS quantities the caller
  supplies. Honest residual: a fully CIO-based (X, Y, s) chain and an ANISE/SPICE
  <10 m numerical cross-check remain follow-ons.
- **Cold-atom-interferometer systematics, drift sweep, and a published-device
  validation (`src/inertial/quantum_imu.rs`, `docs/QUANTUM.md`).** Extends the
  first-principles CAI accelerometer with the two leading deterministic systematics:
  the **Coriolis/rotation** phase `Φ_cor = 2·k_eff·v_⊥·Ω·T²` (`coriolis_phase`, with
  the equivalent acceleration bias `2·Ω×v` via `coriolis_accel_bias`) and the
  **AC-Stark light-shift** phase `Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff` (`ac_stark_phase`,
  which cancels by π/2–π–π/2 symmetry for a constant shift). Adds `cai_drift_sweep`
  (dead-reckoning position drift vs cycle time — the core of a quantum-vs-classical
  comparison) and a validation test against the Freier et al. 2016 mobile gravimeter
  (arXiv:1512.05660): the modelled quantum-projection-noise floor lies below, and
  within ~2 orders of, the published 96 nm/s²/√Hz short-term noise. `docs/QUANTUM.md`
  updated. Honest residual: wavefront/beam-pointing systematics, fringe-ambiguity
  resolution, the exact CARIOQA-PMP / Boeing-AOSense flight-test reproduction (needs
  published platform PSDs), and a JS playground preset.
- **Cislunar frame reduction and a lunar south-pole integrity pass (`src/lunar.rs`).**
  Extends the lunar ARAIM engine with the MCI↔MCMF (Moon-centered inertial ↔
  Moon-fixed) rotation (`mci_to_mcmf` / `mcmf_to_mci`, a simplified mean-rotation
  model at the lunar sidereal rate), selenographic latitude/longitude/altitude
  (`mcmf_to_selenographic` / `selenographic_to_mcmf`), and `south_pole_hpl_pass` —
  a landed Artemis-region receiver against a representative LunaNet relay set over a
  24 h pass, which honestly quantifies the integrity gap: with the nominal 30 m LANS
  σ_URE the protection level is finite but exceeds a 50 m surface-ops alert limit.
  Honest residual: the precise LANS NRHO ephemeris (a 3-body cislunar orbit), the
  physical libration / precessing lunar pole (DE421/SPICE), and a LunaNet TOML
  scenario remain follow-ons.
- **ARAIM integrity support message, Stanford-diagram SVG, and the open ARAIM
  reference (`src/raim.rs`, `docs/ARAIM_REFERENCE.md`).** Adds an explicit
  `IntegritySupportMessage` (σ_URA / σ_URE / b_nom / P_sat / P_const, with the WG-C
  GPS+Galileo reference values and `.fault_priors()` / `.dual_fault_priors()`
  converters into the single-fault `araim_raim` and constellation-wide
  `araim_dual_raim` engines), a standalone `stanford_svg` renderer of the Stanford
  integrity diagram (the four zones, the `PL = error` boundary, the alert-limit
  guides, one colour-coded marker per epoch), and `docs/ARAIM_REFERENCE.md`
  documenting the algorithm, the ISM, the fault hypotheses, the protection-level
  contract, and the dual-constellation benefit. Tests demonstrate the
  geometry/redundancy gain (pooling a second constellation tightens the single-fault
  HPL) and constellation-fault tolerance (the dual user survives losing a whole
  constellation; a single-constellation user cannot). Honest residual: numerically
  reproducing the EU ARAIM TN Table A-3 / the 15–25 % availability figure against a
  version-locked real TLE snapshot, a Zenodo fixture record, and wiring
  `araim_dual_raim` into the scenario-file runner.
- **IAU 2000B nutation and the full TEME→GCRS/J2000 inertial reduction
  (`src/nutation.rs`).** Adds the second and third pieces of a true inertial frame
  reduction on top of the shipped IAU 2006 precession: the 77-term luni-solar MHB2000
  nutation series (`nutation_iau2000b`, the standard IAU 2000B truncation accurate to
  ~1 mas) with the Delaunay fundamental arguments and the SOFA `iauNumat` nutation
  matrix, and the Vallado AIAA-2006-6980 chain TEME→TOD (equation of the equinoxes) →
  TOD→MOD (nutation) → MOD→GCRS (bias-precession) exposed as `teme_to_gcrs(r, v, jd_tt)`
  / `gcrs_to_teme`. The series, arguments and unit constants are transcribed from the
  IAU SOFA / ERFA `nut00b` reference and validated **bit-for-bit** against the published
  `eraNut00b` test vector (Δψ, Δε to 1e-13 rad). Honest residual: the full IAU 2000A
  678-term series (<0.1 mas), an ANISE/SPICE <10 m numerical cross-check, and polar
  motion remain follow-ons (see `ROADMAP.md`).

## [0.12.0] - 2026-06-06

This release lands Kshana's first **non-analytic orbit propagator** — a Cowell
integrator with a hierarchical six-perturbation force model (two-body + J2–J6 zonal +
epoch-driven Sun/Moon third body + solar-radiation pressure with a conical
umbra/penumbra shadow + atmospheric drag + the post-Newtonian Schwarzschild relativistic
correction) driven by a choice of two adaptive integrators (RK4 step-doubling and the
Dormand–Prince RK5(4) embedded pair) — alongside a maneuver / trajectory-design layer
(impulsive and finite burns, an Izzo Lambert solver, and a porkchop sweep), a
gravity-map-matching alt-PNT layer that recovers a 60-minute GPS-denied track to under
500 m, a batch + sequential orbit-determination pipeline, and a full 17-state
tightly-coupled GNSS/INS UKF with quantum-CAI dead-reckoning. Every numerical capability
is pinned against analytic truth or a hand-derived closed form; the off-by-default
perturbations leave the released goldens untouched.

### Added
- **Post-Newtonian (Schwarzschild) relativistic correction (`forces::relativistic_accel` +
  `propagator::ForceModel::relativity`).** Adds the dominant general-relativistic perturbation on a
  near-Earth orbit — the leading driver of the relativistic perigee advance — in the IERS /
  Montenbruck–Gill `β = γ = 1` form `a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}`. Like atmospheric
  drag it is **velocity-dependent**, so it rides the `(r, v)` integrator RHS via
  [`accel_rv`], opt-in and off by default. Validated self-contained: on a circular orbit it
  collapses to the closed form `3μ²/(c²r³)·r̂` (purely radial and **outward**, off-axis components
  exactly zero); its **ratio to two-body is the textbook `≈1.9·10⁻⁹` at LEO** (the `μ/(c²r)`
  signature); a radial-velocity case matches the hand-simplified `μ(4μ + 3v²r)/(c²r³)`; and in the
  propagator it **perturbs the orbit without dissipating it** — the semi-major axis is conserved to
  well under a metre/day, the structural opposite of drag's monotonic decay. Because it is off by
  default the two-body/J2/zonal goldens are untouched. PPN-parameter (`β`,`γ`) tuning and the
  Lense–Thirring frame-dragging term remain follow-ons.
- **Conical umbra+penumbra shadow model (`forces::conical_shadow`), now used by solar-radiation
  pressure.** Upgrades the binary umbral-cylinder eclipse to a smooth `ν ∈ [0,1]` factor: the Sun
  and Earth are modelled as disks of apparent angular radii `a = asin(R☉/d☉)`, `b = asin(Rₑ/|r|)`
  with apparent centre separation `c`, and `ν` is one minus the fraction of the Sun's disk occulted
  by the Earth's disk (the circle–circle lens-overlap area) — full sun for `c ≥ a+b`, total umbra
  for `c ≤ b−a`, annular for `c ≤ a−b`, and a continuous penumbra in between. `srp_accel` now uses
  it, so the SRP force tapers smoothly through eclipse instead of switching on/off. Adds the IAU
  nominal `forces::SOLAR_RADIUS`. Validated self-contained: `ν = 1` in full sun and `ν = 0` deep in
  the umbra (exact), a **smooth monotonic penumbra** (`ν` rises 0 → ~½ at `c = b` → 1 across the
  `[b−a, b+a]` band), and the conical penumbra **extends beyond the umbral cylinder** (a point the
  binary cylinder calls fully lit is `0 < ν < 1` for the cone). The simpler `cylindrical_shadow`
  remains available; solar limb darkening and the oblate-Earth shadow remain follow-ons.
- **Dormand–Prince RK5(4) embedded integrator (`integrator::dopri54_step` /
  `integrator::integrate_dopri` + `propagator::propagate_dopri`).** Adds the standard
  Dormand–Prince (1980) embedded Butcher-tableau pair alongside the existing RK4 step-doubling
  driver: seven FSAL stages yield a 5th-order solution and a 4th-order error estimate from one set
  of evaluations (7 vs 11 function calls per step), a cheaper local-error estimate. The adaptive
  driver reuses the same RMS-error norm and `0.9·(1/err)^(1/5)` step controller, so it is a drop-in
  alternative; `propagator::propagate_dopri` exposes it on the orbit force model. Validated
  self-contained: the embedded error estimate is **O(h⁵)** (halving the step cuts it ~32×); DP5(4)
  integrates `y' = y` to `e` and the harmonic oscillator over 50 periods conserving energy to
  <1e-6; it reaches the same endpoint at the same tolerance in **fewer function evaluations** than
  step doubling (without sacrificing accuracy); and `propagate_dopri` clears the same analytic-truth
  gate as the RK4 path — **sub-metre against the exact universal-variable Kepler solution over a
  24 h LEO orbit** — while the two drivers agree to <1 m on a J2..J6 orbit (no closed form). Higher
  embedded pairs (RKF7(8) / DOP853) remain a follow-on.
- **Atmospheric drag wired into the propagator as its first velocity-dependent force
  (`forces::atmospheric_density` + `forces::drag_accel` + `propagator::ForceModel::drag`).** Adds
  the **Vallado Table 8-4 piecewise-exponential** atmosphere `ρ = ρ0·exp(−(h−h0)/H)` (28 bands from
  sea level past 1000 km, clamped below the surface) and the quadratic drag
  `a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel` against the **co-rotating atmosphere**
  `v_rel = v − ωₑ ẑ × r` (`forces::EARTH_ROTATION_RATE = 7.2921151467e-5`). Because drag depends on
  velocity, `ForceModel` gains a new `accel_rv(t, r, v)` and the integrator RHS now passes velocity
  (`f(t,[r;v]) = [v; a(t,r,v)]`); the position-only `accel_at` is unchanged, so the conservative
  terms and goldens are untouched. Validated self-contained: the density **anchors at the
  1.225 kg/m³ sea-level value**, clamps below the surface, **decreases monotonically** through LEO,
  sits in the solar-mean ~1e-12 kg/m³ band at 400 km, and its **recovered local scale height
  (≈ 58 km at 400 km)** is physical; drag **opposes the co-rotating relative velocity** at the
  ~2e-6 m/s² LEO magnitude for `C_D·A/m = 0.02 m²/kg`; and — the key signature — drag is
  **dissipative**: a 300 km orbit loses specific energy **monotonically** and its semi-major axis
  **decays a bounded ~km/day**, where the vacuum baseline conserves energy to <1e-9. The
  NRLMSISE-00 thermospheric density (the < 5 % drag-density clause) remains a follow-on.
- **Solar-radiation pressure wired epoch-driven into the propagator force model
  (`forces::srp_accel` + `propagator::ForceModel::solar_radiation`).** Adds the **cannonball SRP
  model** `a = ν · P☉ · cᵣ · (A/m) · (AU/d)² · d̂` with a **cylindrical-shadow eclipse factor**
  (`forces::cylindrical_shadow`, ν ∈ {0,1}): the radiation pressure `P☉ = Φ☉/c` from the modern
  1361 W/m² total solar irradiance (≈ 4.5398·10⁻⁶ N/m²), the inverse-square `(AU/d)²` flux fall-off,
  and the radial push **away from the Sun**. It rides the **same epoch-driven RHS** as the third
  body, sampling the `ephem` Sun once at the advanced epoch `epoch_jd_tt + t/86400` shared between
  the Sun third body and SRP. Composable:
  `with_zonals_j2_j6().third_body(true, true, epoch).solar_radiation(1.5, 0.02)`. Validated
  self-contained against hand-derived signatures: the **1-AU radiation pressure pins to its textbook
  ≈ 4.5398·10⁻⁶ N/m²**; a fully-lit LEO sat's SRP is **bit-identical** to the cannonball formula,
  points **away from the Sun**, and sits in the **~1.36·10⁻⁷ m/s² band** for cᵣ = 1.5, A/m = 0.02
  m²/kg; **doubling the Sun distance quarters the magnitude** (inverse-square); the **cylindrical
  shadow eclipses only the umbral cylinder** (anti-sunward *and* within one Earth radius of the
  Earth–Sun line) and yields **exactly zero** SRP in eclipse; and in the propagator SRP **perturbs
  a LEO orbit by a small bounded amount that scales ~linearly with A/m** — while a model with no
  perturbations stays bit-for-bit time-independent, leaving the two-body/J2/zonal goldens untouched.
  The conical umbra/penumbra (smooth ν ∈ [0,1]), atmospheric drag, and external GMAT/Orekit
  cross-validation remain follow-ons.
- **Epoch-driven Sun/Moon third body wired into the time-varying propagator RHS
  (`propagator::ForceModel::third_body` / `accel_at`).** The third-body perturbation is no longer a
  standalone force term — it is now integrated by the Cowell propagator as a genuinely *time-varying*
  force: each RHS evaluation samples the `ephem` Sun/Moon positions at the **advanced epoch
  `epoch_jd_tt + t/86400`** (reusing `precession::julian_centuries_tt` for the day↔century
  conversion), so the perturbers move along their orbits during the integration rather than being
  frozen at the start. Composable with any gravity model
  (`ForceModel::with_zonals_j2_j6().third_body(true, true, epoch)`). Validated self-contained:
  the RHS Sun term is **bit-identical** to `third_body_accel` evaluated at the ephemeris position for
  that instant at both `t = 0` and `t = 1 day` (proving the 86400 s ↔ 1 day ↔ 1/36525 century
  wiring exactly), the perturber **advances ~2.6·10⁹ m/day** between samples (not frozen), the
  **instantaneous LEO tidal magnitudes** hit the textbook ~5·10⁻⁷ m/s² (Sun) and ~1.1·10⁻⁶ m/s²
  (Moon, ≈ 2× the Sun) bands, each body **measurably perturbs the day-long trajectory while staying
  bounded**, and the same initial state propagated at **epochs a quarter-year apart yields a
  different trajectory** (the tidal axis rotates 90°) — while a model with neither body enabled is
  bit-for-bit time-independent, leaving the two-body/J2/zonal goldens untouched. DE-grade ephemeris
  accuracy and external GMAT/Orekit cross-validation remain follow-ons.
- **Low-precision Moon ephemeris (`ephem::moon_position`), completing the Sun/Moon third-body pair.**
  Adds the Montenbruck & Gill low-precision lunar series (`§3.3.2`) alongside the Sun model, so the
  body-agnostic `forces::third_body_accel` can now be driven by either luminary with **no external
  DE/SPK kernel**. Validated self-contained against hand-derived lunar signatures: the geocentric
  distance stays inside the real **perigee/apogee envelope (~356 500–406 700 km)** over a month and its
  **monthly mean recovers the ~384 400 km semi-major axis**; the **ecliptic latitude never exceeds the
  ~5.3° lunar-orbit inclination** (checked by projecting onto the ecliptic pole in equatorial
  coordinates, validating the latitude series and the obliquity rotation together); the Moon's
  **direction returns to within 1° after one sidereal month (27.3217 d)** and its **daily motion stays
  in the physical 12–15°/day band**; and the lunar third-body perturbation on a LEO satellite has the
  **textbook ~1.1·10⁻⁶ m/s² magnitude** (≈ twice the Sun's). DE-grade position accuracy, atmospheric
  drag, and SRP remain follow-ons.
- **Third-body (Sun) gravity with a built-in low-precision ephemeris (`forces::third_body_accel`,
  `ephem::sun_position`).** Adds the third-body perturbation to the force model:
  `a = GM₃·((s−r)/|s−r|³ − s/|s|³)` (direct attraction minus the indirect term the geocentric
  frame must subtract), with the Sun position supplied by the new `ephem` module's
  Montenbruck & Gill low-precision analytical series — **no external DE/SPK kernel needed** for a
  low-fidelity run. Validated self-contained: the acceleration **matches the exact gradient of its
  own disturbing potential** (`third_body_potential`), the perturbation **vanishes at the geocentre**
  and has the **textbook ~5·10⁻⁷ m/s² magnitude on a LEO satellite**, and the Sun ephemeris hits
  hand-derived J2000 anchors — **perihelion distance ≈ 1.471·10¹¹ m**, **declination ≈ −23° near the
  December solstice**, an apparent motion of **≈ 1°/day** (≈ 90° per quarter-year), and a distance
  that stays inside the 0.983–1.017 AU Earth-orbit envelope across a full year. Delivers the
  third-body half of the numerical-propagator milestone's force-model step (the Moon is delivered in a
  companion entry above); DE-grade position accuracy, atmospheric drag, and SRP remain follow-ons.
- **J2–J6 zonal-harmonic force model (`forces::zonal_accel` / `zonal_potential`).** Extends the
  Cowell propagator's force model beyond J2 to the full Earth zonal field through degree 6 (the
  standard published EGM-96 unnormalised `J2..J6`), wired into the propagator as
  `ForceModel::with_zonals_j2_j6()`. The acceleration is the **exact analytic gradient** of the zonal
  disturbing potential `R(r) = −(μ/r)·Σ Jₙ(Re/r)ⁿPₙ(z/r)` (Legendre polynomials by upward recurrence),
  validated three independent ways: it **reduces to the 666-vector-validated `j2_accel` to machine
  precision** when restricted to `[J2]`; it **matches the numerical gradient of its own potential**
  through the full J2..J6 field (the conservative-field gold-standard check); and the odd `J3` vs even
  `J2`/`J4..J6` terms exhibit their **characteristic north–south (anti)symmetry** under `z → −z` — the
  pear-shape asymmetry. A propagated J2..J6 orbit conserves total energy (kinetic + central + zonal
  potential) to ~1e-8 over a day and perturbs the J2-only orbit by a small non-zero amount. This
  delivers step-2 ("J2–J6 zonal harmonics") of the numerical-propagator milestone; the high-degree EGM
  tesseral field, drag, SRP, third-body, and external GMAT/Orekit cross-validation remain follow-ons.
- **Numerical (Cowell) orbit propagator (`src/propagator.rs`).** Kshana's first **non-analytic**
  propagator (the rest of the orbit stack is analytic SGP4/SDP4): it wires the two-body + J2 force
  model (`src/forces.rs`) into the adaptive step-doubling RK4 driver (`src/integrator.rs`) as
  `f(t,[r;v]) = [v; a(r)]`, with a `ForceModel` toggle. Validated against **analytic truth that is
  stronger than a numerical cross-tool would be**: the unperturbed orbit reproduces the **exact
  universal-variable Kepler solution to sub-metre over a 24-hour LEO orbit** (a tighter gate than
  the "vs a numerical reference < 10 m" the milestone phrases), specific energy and angular momentum
  conserve to ~1e-9 relative, and the J2 nodal regression reproduces the closed-form `j2_secular_rates`
  to first-order theory (within 2 %, the O(J2²) residual). Also adds `solve_kepler_checked`, a Newton
  solver for Kepler's equation that **returns `Err` instead of a silently-wrong answer** when it fails
  to converge within a bounded iteration budget (the near-perigee `e = 0.999` case). Honest scope: the
  force model is two-body + J2 only — the high-degree EGM tesseral field (200×200 + loader), drag
  (NRLMSISE-00), SRP, third-body forces, and an external GMAT/Orekit cross-validation remain follow-ons.
- **60-minute GPS-denied gravity-map matching to < 500 m (`run_gps_denied_gravity_nav`).**
  Deepens the alt-PNT layer to the ESA NAVISP *Quantum Wayfarer* validation target: a vehicle
  flies a ~700 km track for a full one-hour GNSS outage — its inertial solution drifting to
  **≈ 70 km** — and a cold-atom gravimeter plus a **hierarchical coarse-to-fine** particle/grid
  matcher recovers the constant INS drift to **≈ 145 m** (< 500 m), a > 480× cut. The gravimeter's
  real white-noise floor is injected as a **deterministic seeded** sequence, so the matcher is
  never handed noise-free truth yet the run is exactly reproducible (verified bit-identical, and
  stable to a few metres across noise realisations). A regression-grade test shows the refinement
  is *necessary* — a single coarse grid stalls at ~2 km, only the three-stage refinement breaks
  the 500 m barrier. New committed scenario `scenarios/gps-denied-gravity-nav.toml`. The
  `docs/CAPABILITY.md` row stays honestly **partial** (still no bundled EGM2008 map) with its
  evidence updated to the 60-min < 500 m result. Honest scope unchanged: low-degree
  spherical-harmonic field + synthetic mascons; a Monte-Carlo over map-representation-error
  realisations is a follow-on.
- **Overclaim ledger + regression guard (`docs/CLAIMS-VS-REALITY.md`, `tests/no_overclaims.rs`).**
  Closes the honesty/de-claim track: the fourteen overclaims an earlier audit catalogued
  (`OC-0`…`OC-13`) are now all GREEN — the strong claims (`OC-0` coupled clock+position Kalman,
  `OC-2` jamming J/S→C/N₀→loss-of-lock, `OC-7` Mach–Zehnder CAI physics, `OC-8` ARAIM HPL/VPL)
  are **superseded by shipped, tested capabilities** rather than softened wording, and the
  remaining rows are de-claimed to match the code. A new CI test scans the live public surfaces
  (`README`, `CAPABILITY`, `GLOSSARY`, `web/`) and fails if any retired bare overclaim phrase
  reappears uncaveated, so a GREEN row cannot silently regress. The per-run "integrity" FoM stays
  honestly labelled *filter self-consistency* (not aviation integrity); the real ARAIM HPL/VPL is
  surfaced separately so the two are never conflated.
- **Gravity-map-matching navigation (GPS-denied alt-PNT).** New `src/gravimeter.rs` adds the
  alt-PNT capability layer ESA NAVISP's *Quantum Wayfarer* / QT-CCI gravity-map-matching studies
  call for: a cold-atom **gravimeter measurement model** whose white-noise floor is derived from
  the CAI accelerometer ASD (`σ = ASD/√τ`); a low-degree, fully-normalised **spherical-harmonic
  gravity-anomaly field** (validated against the closed-form Legendre functions `P̄₁₁=√3·cosφ`,
  `P̄₂₀=(√5/2)(3sin²φ−1)`, `P̄₂₂=(√15/2)cos²φ` and a hand-derived single-term anomaly of
  1.897 mGal) plus synthetic **mascons** for the high-degree local features; and a
  **gravity-map-matching particle filter** (composing `mapmatch` + `particle_filter`) that
  recovers a GPS-denied track from the anomaly sequence it flies through. A committed NAVISP
  benchmark (`scenarios/gravity-map-nav.toml`) cuts a ~73 km free-inertial drift to a few km.
  Honest scope: Kshana does **not** bundle the full EGM2008 2190° coefficient set — the field is
  low-degree + mascons, not a real high-resolution map; the EGM/EIGEN loader, magnetic map,
  terrain-aided SLAM, and scenario-engine `kind=` wiring with an SVG drift chart remain follow-ons.
  `docs/CAPABILITY.md` "Gravity-map / alt-PNT navigation" → **partial**.
- **Maneuver modeling and trajectory-design beachhead.** New `src/maneuver.rs` adds the first
  trajectory-design layer above SGP4: impulsive ΔV nodes that apply a velocity discontinuity and
  carry a 6×6 covariance forward (deterministic burn ⇒ identity state-transition; the
  execution-error covariance rotates from the burn frame — ECI or LVLH — into the velocity block),
  a finite-burn integration (constant thrust over a burn arc with mass as a state) whose achieved
  ΔV is checked against the closed-form **Tsiolkovsky** rocket equation to better than 0.01 %, an
  **Izzo-2015** single-revolution **Lambert** solver (`r1`, `r2`, time-of-flight ⇒ `v1`, `v2`),
  an exact universal-variable **Kepler propagator** (two-body truth), and a **porkchop** sweep that
  maps a launch-epoch × arrival-epoch grid to departure C3 and arrival V∞, emitted as a 2-D JSON
  array for browser contour rendering. Validation is self-contained and stronger than a tutorial
  read-out: every Lambert output is round-tripped through the Kepler propagator (it must land back
  on `r2`), and the porkchop minimum is checked against the analytic Hohmann-transfer C3 floor for
  two coplanar circular orbits. Kshana positions this as the performance-simulation layer above
  GMAT/Orekit, not a replacement (multi-revolution branches and a real planetary ephemeris remain
  out of scope). Ten tests.
- **Full 17-state tightly-coupled GNSS/INS UKF with quantum-CAI dead-reckoning.** New
  `src/fusion/tightly_coupled17.rs` carries the complete inertial-navigation state a
  tightly-coupled filter estimates — `[position, velocity, attitude-error, accelerometer
  bias, gyro bias, clock bias, clock drift]` (17 states) — propagated through the strapdown
  mechanization driven by the measured specific force and angular rate, with the small-angle
  `C ≈ I + [ψ×]` body→inertial rotation so attitude error couples into horizontal acceleration
  (the standard INS tilt coupling). During a GNSS outage it coasts on the IMU alone; the
  velocity-random-walk process noise is the cold-atom-interferometer accelerometer's derived
  `q_va` (`crate::inertial::quantum_imu`), so the dead-reckoning drift is the quantum-sensor
  limited one — a 120-second outage stays bounded to a few hundred metres versus the kilometres
  a navigation-grade free INS would reach. The pseudorange/range-rate update runs through the
  shared unscented filter (with α = 1 for well-conditioned weights at this state size). Five
  tests: measurement-model identity, perfect-IMU constant-velocity integration, GNSS aiding,
  accelerometer-bias estimation, and the CAI-limited 120-s outage benchmark.

## [0.11.0] - 2026-06-05

### Changed
- **Honest framing for the quantum positioning.** The headline descriptor is now a
  **"PNT-resilience simulator with quantum-sensor performance models"** consistently
  across the README tagline, citation line, `CITATION.cff` (title + abstract), and
  the banner artwork — replacing the looser "hybrid quantum/classical PNT simulator"
  marketing phrasing. The README's *What it is / is not* section gains an explicit
  **"It is not (yet)"** scope statement (not a first-principles atom-interferometry
  physics engine, not a GNSS receiver/PVT solver, not a mission-design tool), and a
  new top-level [`ROADMAP.md`](ROADMAP.md) makes the **Quantum physics layer a P2
  item** (Mach–Zehnder CAI phase, projection noise, vibration tensor) so readers know
  the first-principles physics is scoped-and-coming, not abandoned. No behaviour or
  API change.

### Added
- **Constellation-design trade study: Walker design sweep with a Pareto front, revisit-time
  JSON, and a sub-kilometre Walker-formula validation.** `src/walker.rs` gains
  `walker_design_sweep`, which runs a `planes × sats_per_plane` grid (e.g. a 3×3 trade) at a
  fixed inclination and tabulates, per design, the coverage fraction, worst-case PDOP, and the
  max/mean revisit gap; `pareto_front` flags the non-dominated designs (fewer satellites, more
  coverage, lower PDOP, shorter revisit), and `WalkerDesignReport::to_json` serialises the cells
  and Pareto front — revisit-time fields included — as JSON. New validation pins the generator to
  the Walker `i:T/P/F` formula: same-slot satellites in adjacent planes are shown to map onto one
  another by an exact `R_z(2π/P)` rotation to **under 1 km over a full 24 h** of SGP4 propagation
  (the J2 short-period breathing is common-mode and cancels), and the in-plane slots are confirmed
  spaced `2π/S` in the mean. Builds on the committed real Celestrak `gps-ops` 2021-07-28 snapshot
  (`scenarios/orbit-sgp4-gps.toml`, exercised by the scenario-coverage and SP3 round-trip tests).
- **Advanced time-and-frequency transfer: TWSTFT, GNSS common-view, PPP, optical, IEEE-1139
  power-law fit, and a clock ensemble.** New `src/timetransfer_adv.rs` builds the operational
  transfer methods on the shipped Sagnac/common-view closed forms and the Allan-stability tools.
  `twstft_sagnac` gives the Two-Way Satellite Time and Frequency Transfer Sagnac correction as the
  three-hop loop sum, equal to the BIPM closed form `Δt = 2·A·ω_E/c²` exactly (cross-checked by the
  independent `twstft_sagnac_bipm`); `run_twstft` emits a one-day `T_A − T_B` series and its TDEV.
  `gnss_common_view_series` single-differences two synthetic ground stations so the satellite clock
  cancels. `iono_free_combination` + `ppp_receiver_clock` are the PPP ionosphere-free combination and
  receiver-clock solve against an SP3-grade (synthetic) truth, cancelling the first-order ionosphere
  exactly. `rytov_variance`, `fried_parameter`, and the unit-mean `lognormal_fading` model a free-space
  optical link's turbulence-induced scintillation. `fit_power_law_psd` is a full IEEE-1139 five-coefficient
  `h_α` least-squares fit of the Allan-variance curve (all five canonical noise processes at once) with the
  dominant process reported per τ-decade. `ensemble_timescale` forms an inverse-variance-weighted paper
  timescale whose Allan deviation falls strictly below the best contributing clock. 31 unit tests;
  validation targets are closed forms and synthetic truth — a real BIPM Circular-T / IGS SP3 ingest remains.
- **IONEX ionosphere maps: file parser, time interpolation, and slant obliquity mapping.** `src/ionex.rs`
  gains `parse_ionex`, which reads the IONEX file format (header grid definition + `START/END OF TEC MAP`
  blocks) into a sequence of `IonexMap`s — normalising the file's north-to-south latitude ordering into a
  positive-step `TecGrid` and scaling values by `10^EXPONENT`. `interpolate_tec_in_time` blends two
  successive maps to a query epoch, and `obliquity_factor` / `slant_tec` map the vertical TEC onto a slant
  ray via the single-layer thin-shell factor `M(z) = 1/cos z′` (`sin z′ = (Rₑ/(Rₑ+H))·sin z`). Together
  with the shipped grid model these turn a measured IGS global ionosphere map into a usable slant delay.
- **Constellation design: streets-of-coverage sizing + multi-constellation comparison.** `src/walker.rs`
  gains `min_satellites_streets_of_coverage`, an idealised streets-of-coverage minimum-satellite solver —
  from the shipped coverage half-angle `λ` and street half-width `c` it sizes the near-polar constellation
  for continuous single global coverage as `p = ⌈π/(2c)⌉` planes (e.g. a GPS-altitude 4-satellite plane
  needs 2 planes, 8 satellites), and reports `None` when the satellites are too sparse to form a continuous
  street. `compare_constellations` is the multi-constellation comparison tool: it scores each named Walker
  design on the same station/window via `pdop_sweep` and returns their coverage / PDOP / size side by side.
  Honest scope: the seam-exact Rider correction at the counter-rotating plane boundary and a 3-D coverage
  globe are follow-ons.
- **Multi-layer spoof detection: RAIM-consistency parity detector + layer fusion.** `src/spoof_monitors.rs`
  gains the third and final detection layer and the fusion stage: `parity_raim_test` least-squares-fits
  the position/clock solution to a redundant pseudorange set and tests the leftover weighted residual
  sum-of-squares against its χ²`(m−4)` threshold — flagging a biased *subset* of satellites while
  correctly leaving a *common-mode* bias (absorbed by the receiver clock) RAIM-invisible, not papered
  over. `fuse_spoof_layers` combines the parity, AGC and SQM layers into one weighted decision that
  records which layers fired. A Monte-Carlo characterises the detector: empirical **P_fa ≈ 0.068**
  against a 0.05 design point, with **missed-detection falling from 0.885 at a 2σ spoof bias to 0.16 at
  8σ**. Honest scope: cross-validation against specific published (Spirent / ION GNSS+) spoofing test
  vectors needs those external datasets and remains a follow-on.
- **Coupled-vs-decoupled Kalman validation ensemble.** A 100-trial Monte-Carlo in
  `src/fusion/coupled.rs` quantifies the value of carrying the position↔clock cross-covariance: a
  faithful inline decoupled baseline (validated bit-for-bit against the shipped `CoupledPntFilter`)
  processes the same data with the cross blocks zeroed, and after near-degenerate pseudoranges plus a
  clock-only fix the coupled filter recovers position to **2.97 m RMS versus the decoupled filter's
  48.8 m, winning 97 of 100 trials** — the clock fix sharpens position only through the correlation
  the decoupled pack discards. This completes the Kalman-correctness validation suite (Joseph form,
  PSD safety, NEES/NIS consistency, and now the coupled-filter ensemble).
- **Orbit determination pipeline (batch + sequential).** A new `src/orbit_determination.rs` recovers
  a satellite's orbital state `[r, v]` from ground-station range tracking, composing three shipped
  pieces: the two-body + J2 force model (`src/forces.rs`) and RK4 integrator (`src/integrator.rs`)
  propagate a candidate state across the arc, a range measurement model predicts each station range,
  and the Gauss–Newton batch corrector (`src/batch_ls.rs`) drives the candidate onto the best-fit
  state (`determine_orbit_batch`). The same dynamics and range model also drive a **sequential**
  recursive determination on the shipped unscented filter (`determine_orbit_sequential`). Four tests
  validate it: range prediction across the arc; **batch recovery to sub-metre / mm·s⁻¹ from noiseless
  ranges**; batch recovery to **~2 m with a post-fit residual at the 5 m noise floor** (the signature
  of a consistent least-squares fit); and sequential recovery to within tens of metres. Honest scope:
  range-rate/Doppler and angle measurements, an analytic J2 state-transition matrix, and station
  visibility masking are follow-ons.
- **Tightly-coupled GNSS/INS UKF navigator.** A new `src/fusion/tightly_coupled.rs` wires the
  shipped unscented Kalman core (`src/fusion/ukf.rs`) into a working tightly-coupled navigator over
  the eight-state `[px,py,pz,vx,vy,vz,b,d]` (ECEF position/velocity plus receiver clock bias and
  drift in range units). It ingests the **raw satellite measurements** — `pseudorange`
  (`ρ = |p − sᵢ| + b`) and `range_rate`/Doppler (`ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d`) — rather
  than a pre-formed position fix, so `TightlyCoupled` (with `propagate`/`propagate_orbital`/
  `update_gnss`) keeps correcting **with fewer than four satellites** and coasts through GNSS
  outages on its propagated dynamics. Five tests validate it end-to-end, including the milestone
  acceptance scenarios: the pseudorange/Doppler geometry against hand values; noiseless convergence
  to **sub-metre** on five satellites; a **three-satellite** case converging from ~212 m to ~13 m
  where a snapshot PVT cannot even be formed; a constant-velocity **120-second outage** within 50 m;
  and — the headline acceptance — a **30-minute curving LEO pass** (real two-body + J2 orbit) with a
  **120-second GNSS outage**, held to **0.77 m pass RMS** and **2.9 m worst-case through the
  outage**. That orbital coast composes the shipped gravity force model (`src/forces.rs`) and RK4
  integrator (`src/integrator.rs`) into the UKF process model (`propagate_orbital`), so the filter
  follows the orbit's curvature — which a constant-velocity coast cannot (curvature alone is ~58 km
  over 120 s at LEO). Honest scope: the orbital coast uses the two-body + J2 force model rather than
  raw IMU specific-force (for an unpowered orbital platform these coincide); folding in a
  strapdown-IMU error state and in-loop iono/tropo corrections remain follow-ons.
- **Map-matching measurement model (terrain-/gravity-referenced navigation).** A new
  `src/mapmatch.rs` supplies the measurement model that turns the shipped
  sequential-importance-resampling particle filter (`src/particle_filter.rs`) into a working
  GPS-denied navigator: `field_likelihood` (a Gaussian field-match likelihood) and
  `map_match_likelihood`, which samples any georeferenced reference field — terrain elevation
  (TRN) or a gravity anomaly — at a particle's position and weights it by agreement with the
  vehicle's measured value. The field is any `Fn(lat, lon) -> value` sampler, so it composes
  with the bilinear grid in `src/ionex.rs` or a closure. Two tests anchor it — the likelihood
  peaks (=1) at a perfect match and falls to `e^(−½)` at one sigma, and a particle filter over
  a distinctive synthetic-terrain patch recovers the true position to within 0.1. Honest scope:
  the real reference maps (SRTM elevation, EGM/EIGEN gravity anomaly) and their loaders are
  follow-ons.
- **Cislunar PNT integrity (lunar ARAIM).** A new `src/lunar.rs` applies the Earth-side
  MHSS ARAIM engine to a LunaNet-style lunar navigation service with the lunar parameters
  (`σ_URE ≈ 30 m` vs GPS 0.6 m, `P_sat ≈ 1e-4`): lunar constants, a selenocentric
  East/North/Up basis and sky-geometry helper, and `lunar_araim` (HPL/VPL). Three tests
  anchor it — the orthonormal selenocentric basis, the slant-range geometry, and the exact
  linear protection-level scaling with `σ_URE` (lunar 30 m gives a 50× larger protection
  level than the same geometry at the GPS 0.6 m — the quantitative reason lunar PNT
  integrity is hard). Honest scope: the precise LANS NRHO ephemeris, the signal-in-space
  error budget, and the MCI↔MCMF frame reduction are follow-ons.
- **Two-part (high-precision) Julian dates.** A new `src/jd2.rs` adds `Jd2`, a Julian date
  split into an integer `day` and a fractional `frac` in `[0,1)` (the SOFA/hifitime
  convention), with `new`/`from_parts`/`add_seconds`/`diff_seconds`/`total`. Differences of
  nearby epochs stay exact to the `f64` floor where a single-`f64` JD loses ~50 µs near
  J2000. Four tests anchor it: the round-trip, fraction normalisation, exact microsecond
  recovery (with the single-`f64` failure demonstrated alongside), and additive/reversible
  second arithmetic.
- **CCSDS OMM (Orbit Mean-Elements Message) writer.** A new `src/omm.rs` complements the
  `oem` ephemeris writer with the mean-elements message: `OmmFile::from_tle` maps SGP4/TLE
  mean elements into the OMM units (mean motion in rev/day, angles in degrees, plus
  `BSTAR`), and `to_omm_kvn` serialises the standards-track CCSDS 502.0-B-2 KVN form — so a
  Kshana orbit can be consumed by any OMM-aware tool instead of as a bespoke TLE. Two tests
  anchor the TLE→OMM unit conversion (≈ 15.5 rev/day, 51.6° inclination, etc.) and the
  presence of the required KVN keywords. Honest scope: the KVN form and TLE mapping ship
  here; the XML (`ndm/omm`) rendering and a reference-parser round-trip are follow-ons.
- **Sequential-importance-resampling particle filter.** A new `src/particle_filter.rs`
  adds the nonlinear, non-Gaussian estimator behind map-aided, GPS-denied navigation
  (terrain-referenced or gravity-map matching): `predict` (propagate particles through the
  dynamics + Gaussian process noise), `update` (reweight by a per-particle measurement
  likelihood), systematic `resample`, the `effective_sample_size` degeneracy monitor, and
  the weighted-mean estimate. Six tests anchor the deterministic core exactly — ESS spanning
  1…N, systematic resampling picking indices in proportion to weight, the weighted-mean
  convex combination, a Gaussian likelihood pulling the estimate onto the measurement,
  resample-to-uniform behaviour, and seeded predict determinism. Honest scope: the engine
  ships here; the reference maps (SRTM elevation, EGM gravity anomaly) and the map
  measurement model are follow-ons (the `ionex` grid+bilinear sampler would serve a
  gravity/terrain map equally).
- **IONEX-style TEC ionosphere maps.** A new `src/ionex.rs` adds the measured-ionosphere
  alternative to the broadcast Klobuchar model: a `TecGrid` (a regular lat/lon grid of
  vertical TEC, an IGS global ionosphere map) with bilinear interpolation at a pierce point
  (`vtec_at`, clamped outside the grid) and the first-order delay `Δ = 40.3·TEC/f²`
  (`vtec_to_delay_m`, `delay_at`). Four tests anchor it: `1 TECU ≈ 0.162 m` at L1 with the
  `1/f²` scaling, node-exact interpolation, bilinear midpoints averaging the corners, and
  edge-clamped out-of-grid queries. Honest scope: the grid and interpolation ship here;
  parsing the IONEX file format, time interpolation between maps, and the slant mapping
  function are follow-ons.
- **Geometric time-transfer corrections (Sagnac + GNSS common-view).** A new
  `src/timegeo.rs` adds the two deterministic effects a real clock comparison must account
  for, complementing the stochastic two-way model in `timetransfer`: `sagnac_correction`
  (`Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)`, the rotating-Earth delay — tens of ns for continental
  baselines) and `common_view_offset`, the GNSS common-view single difference that cancels
  the satellite-clock error exactly and recovers the inter-station offset. Three tests
  anchor them on exact references: the ≈ 33 ns Sagnac of an equatorial quarter-turn,
  antisymmetry and the zero radial/polar cases, and the exact satellite-clock cancellation.
  Honest scope: a full TWSTFT transponder/hardware-delay budget and a PPP ionosphere-free
  time-transfer solution are follow-ons.
- **Orbital force model (two-body + J2).** A new `src/forces.rs` adds the acceleration
  model a numerical propagator integrates: `two_body_accel` (`−μ·r/|r|³`), the `j2_accel`
  oblateness perturbation (the ECI closed form), and `gravity_accel` summing them — pair
  it with `src/integrator.rs` as `f(t,[r;v]) = [v; a(r)]`. It also exposes the analytic J2
  **secular rates** (`j2_secular_rates`): the nodal regression `Ω̇`, apsidal rotation `ω̇`,
  and mean-anomaly drift `Ṁ`. Six tests anchor the physics on exact references: `μ/r²` for
  the two-body term, the J2 closed form at the equator (~10⁻³ of the two-body magnitude),
  the **critical inclination** (63.4349°) that freezes the perigee (`ω̇ = 0`), the ISS
  nodal regression (`Ω̇ ≈ −5°/day`), and the eastward drift of a retrograde sun-synchronous
  orbit. Honest scope: two-body + J2 only; J3–J6, drag, SRP, and third-body are follow-ons.
- **Shareable scenario permalinks.** A new `src/permalink.rs` adds a dependency-free
  RFC 4648 Base64 codec (standard `+/` alphabet with padding, and a URL-safe `-_`
  unpadded alphabet) and `encode_scenario` / `decode_scenario` wrappers, so a playground
  TOML can be encoded into a `?s=` query parameter and shared as a URL. Exposed to the
  browser as `encode_permalink` / `decode_permalink` wasm bindings. Four tests anchor it
  on the canonical RFC 4648 vectors (`"foobar"` → `"Zm9vYmFy"`, etc.), a URL-safe scenario
  round trip (no `+`/`/`/`=` to escape), invalid-symbol rejection, and an all-256-byte
  round trip. Honest scope: the codec and bindings ship here; the playground Share-button
  UI, the Plotly/D3 multi-series chart, and the A/B comparison mode are follow-ons.
- **Gauss–Newton batch least squares (the batch differential corrector).** A new
  `src/batch_ls.rs` adds the estimation core a batch *orbit determination* (or any
  parameter fit) rests on: `gauss_newton` linearises a user-supplied model `h(x)` with a
  central finite-difference Jacobian, forms and solves the weighted normal equations
  `(HᵀWH)·Δx = HᵀW·(z − h(x))` (reusing the tested matrix inverse), and iterates to
  convergence with per-measurement weights. Four tests anchor it: a linear line fit reaching
  the exact weighted-least-squares solution, a nonlinear `a·exp(b·t)` fit recovering the true
  parameters, a 3-D range-multilateration that recovers a known position from noise-free
  ranges (the orbit-determination flavour), and rejection of under-determined/mismatched
  inputs. Honest scope: this is the generic corrector engine; the orbit-specific
  range/range-rate/azimuth-elevation measurement model, the analytic J2 state-transition
  matrix, and the published-case validation are follow-ons.
- **RF-layer spoofing monitors (AGC power and SQM).** A new `src/spoof_monitors.rs` adds
  two independent receiver-front-end spoof detectors that complement the clock-aided
  time-spoof monitor in `spoof`: an **AGC power monitor** (`combine_power_dbm` incoherent
  power sum + `AgcMonitor`) that flags the excess received power a spoof transmitter adds
  beyond a configurable dB margin, and a **signal-quality monitor** (`bpsk_autocorr`
  triangular code autocorrelation + `SqmMonitor`) that flags the Early-minus-Late
  correlator imbalance multipath/meaconing/replay introduces. Four tests anchor the exact
  closed forms (3.01 dB for a doubling of power, the `10·log10(N)` aggregate, the
  triangular `R(τ)=1−|τ|`, and the 10 % Early/Late alert threshold). Honest scope: the
  full RAIM-consistency parity spoof detector, the multi-layer fusion of the monitor
  outputs, and validation against published Spirent/ION GNSS+ spoofing vectors are
  follow-ons.
- **Adaptive numerical ODE integrator.** A new `src/integrator.rs` adds the first piece
  of a *numerical* propagator (Kshana's orbit propagation is otherwise analytic SGP4/SDP4):
  a generic fourth-order Runge–Kutta step (`rk4_step`) over any first-order system
  `y' = f(t, y)`, and an adaptive driver (`integrate`) that controls local error by
  **step doubling** (Richardson extrapolation) with the standard `0.9·(tol/err)^(1/5)`
  step controller and accept/reject logic. Six tests anchor it on exact solutions: the
  `y' = y → e` exponential to `< 1e-9`, the ~16× error reduction per halved step that
  proves fourth-order convergence, energy/return conservation of the harmonic oscillator
  over a full period, and the adaptive driver meeting a tight tolerance with variable
  steps. Honest scope: this is the integrator core and its error control; the
  Dormand–Prince RK5(4)/RKF7(8) embedded tableaux and the hierarchical orbit force model
  (two-body + J2–J6 + drag + SRP + third-body) that make it a `NumericalPropagator` are
  follow-ons.
- **Unscented (sigma-point) Kalman filter.** A new `src/fusion/ukf.rs` adds the
  scaled unscented Kalman filter (Julier & Uhlmann; Wan & van der Merwe) as a general
  `n`-state estimator over user-supplied process and measurement functions — the
  sigma-point estimator a tightly-coupled GNSS/INS navigator uses when the
  pseudorange/Doppler model is strongly nonlinear and an EKF's Jacobian degrades. It
  includes the supporting dense linear algebra (Cholesky factor for the sigma-point
  spread, Gauss–Jordan inverse for the innovation covariance) and a Joseph-free
  `P⁺ = P⁻ − K S Kᵀ` update. Six tests pin it down, the key ones exploiting the exact
  property that for a *linear* model the unscented transform reproduces the Kalman
  filter to numerical precision (predict, update, and a full predict+update cycle all
  matched against a hand-run linear KF, plus a 1-D analytic Bayesian-posterior check
  and the Cholesky/inverse identities). Honest scope: this is the estimator engine; the
  17-state tightly-coupled GNSS/INS navigator, pseudorange/Doppler measurement model,
  and outage-validation scenario remain follow-ons.
- **Dual-constellation ARAIM protection levels.** A new `araim_dual_raim` extends the
  single-fault Advanced RAIM (`araim_raim`) with the **constellation-wide fault mode** of
  EU ARAIM / DO-316: alongside the fault-free and per-satellite hypotheses, each
  constellation (labelled per satellite) contributes one hypothesis that removes all of its
  satellites at once, with prior `P_const` (a new `DualFaultPriors { p_sat, p_const }`). Every
  hypothesis adds a term to the same MHSS integrity sum, so VPL/HPL are the smallest bounds
  whose total `P_HMI` meets the budget over fault-free + single-SV + per-constellation faults
  (the Bonferroni false-alert split is over all `N + C` hypotheses). With `P_const = 0` the
  result is bit-for-bit `araim_raim`; a single-constellation user returns `None` against its
  own constellation fault (it cannot be excluded) — which is exactly why dual-constellation
  coverage matters. Four tests cover the equivalence, the protection-level widening, the
  single-constellation unavailability, and input validation, reusing the existing
  solution-separation sub-solution machinery.
- **IAU 2006 precession (Fukushima–Williams angles and bias-precession matrix).** A new
  `src/precession.rs` implements the IAU 2006 (P03; Capitaine, Wallace & Chapront 2003)
  precession: the four Fukushima–Williams angles `(γ̄, φ̄, ψ̄, ε̄_A)` as polynomials in TT
  Julian centuries (`fw_angles`), and the GCRS→mean-of-date bias-precession rotation matrix
  built from them via the SOFA `iauFw2m` construction (`precession_matrix`, with
  `gcrs_to_mod` / `mod_to_gcrs` helpers). This is the first inertial-frame piece on top of
  the existing GMST-based `frames` reduction. Eight tests validate against closed-form
  anchors — the J2000 mean obliquity `ε̄ = 84381.406″ = 23.4392794°`, the published angle
  constant terms, the `ψ̄ ≈ 5039.998″` general-precession accumulation over a century,
  matrix orthonormality and `det = +1`, the near-identity (frame-bias-only) value at J2000,
  and the `≈ 1.40°`/century net rotation angle. Honest scope (`ROADMAP.md`): precession
  only — the IAU 2000A 678-term nutation, the full TEME→GCRS chain, and a SOFA/ANISE µas/<10 m
  numerical cross-check are follow-ons.
- **First-principles cold-atom-interferometer (CAI) accelerometer physics.**
  `src/inertial/quantum_imu.rs` models a three-pulse Mach–Zehnder atom interferometer
  from first principles instead of a datasheet: effective wavevector `k_eff = 4π/λ`,
  interferometer phase `Φ = k_eff·a·T²`, quantum projection (shot) noise `σ_Φ = 1/(C·√N)`,
  per-shot acceleration sensitivity, contrast decay `C(t) = C₀·e^(−t/τ)`, and — the
  point — `CaiAccelerometer::q_va()`, which **derives** the white-acceleration PSD the
  classical `AccelModel` already consumes from the atom number, interrogation time, and
  contrast. The model now also covers **vibration coupling** — the dominant real-device
  term: the interferometer acceleration→phase transfer function `|H(ω)| =
  (4/ω²)sin²(ωT/2)` (`accel_transfer_function`), the white-PSD phase variance
  `σ_Φ² = k_eff²·S_a·T³/3` (`vibration_phase_variance_white`, with a numeric band-integral
  cross-check `vibration_phase_variance_band`), the rank-1 along-beam `beam_axis_projection`,
  and `CaiAccelerometer::vibration_phase_noise` / `vibration_limited_accel` (the latter
  reducing to the `k_eff`-independent `√(S_a/(3T))` floor). Eleven tests hand-verify the
  physics (Rb-87 `k_eff ≈ 1.61×10⁷`, `Φ(1 g) ≈ 1.58×10⁴ rad`, `σ_a ≈ 0.13 µg`/shot shot-noise
  floor vs ≈ 5.9 µg vibration floor, the `1/T²`, `1/√N`, and `T³` scaling laws). Honest
  scope in `docs/QUANTUM.md`: this spans the projection-noise floor and the vibration-limited
  regime above it; laser-phase noise, Coriolis and light-shift systematics, and the
  PHARAO/CARIOQA validation scenarios remain follow-ons.
- **Quantum-CAI accelerometer wired into the inertial scenario.** An accelerometer in an
  inertial dead-reckoning scenario now resolves to a new `ImuKind` — `Classical` (the
  existing datasheet-coefficient sensor) or `QuantumCai` when it carries an optional `[cai]`
  block (`CaiCfg`: wavelength, pulse separation, atom number, contrast, cycle time, and an
  optional platform `vibration_psd`). A `quantum_cai` sensor's velocity-random-walk PSD
  `q_va` is **derived** from the interferometer physics — the shot-noise floor plus, when a
  vibration PSD is given, the vibration-limited contribution in quadrature — instead of a
  supplied coefficient, and the run's provenance records that the noise is physics-derived.
  The `cai` field is `skip_serializing_if = "Option::is_none"`, so existing scenarios omit it
  and serialize byte-identically (the scenario hash is unchanged). Five tests cover the
  derivation, the quadrature vibration sum, the `Classical`/`QuantumCai` selection, hash-stable
  serialization, and an end-to-end CAI-driven run.
- **Constellation-design optimiser and streets-of-coverage geometry.** `src/walker.rs`
  gains `optimize_walker_design`, a gradient-free grid optimiser that searches the
  `{planes × sats × inclination}` design space and returns the best Walker design under
  a chosen `DesignObjective` — `MinSatellitesForCoverage`, `MaxCoverage`, or
  `MinWorstPdop` — over the already-validated PDOP sweep (a test confirms it returns the
  brute-force winner). Plus the analytical **streets-of-coverage** closed forms
  `coverage_half_angle_rad` (`λ = arccos(Re/r·cos ε) − ε`) and `street_half_width_rad`
  (`cos c = cos λ / cos(π/s)`, Rider/Beste), hand-verified against textbook geometry and
  detecting the under-population gap. The full Rider minimum-satellite global-coverage
  solver, a 3-D playground globe, and an external-tool DOP cross-check remain follow-ons.
- **SP3 precise-ephemeris export from the CLI.** A propagated orbit/constellation
  scenario can now be written to an SP3-c file: `kshana <orbit.toml> --export-sp3
  out.sp3`, or `export_sp3 = true` in the scenario auto-writes `<scenario>.sp3`
  (`api::export_sp3` / `auto_export_sp3`, `OrbitClockScenario::to_sp3_string`, optional
  `epoch`). A round-trip test (`tests/sp3_export_roundtrip.rs`) propagates the real
  Celestrak `gps-ops` snapshot, exports it, re-parses it, and confirms the recovered
  ECEF positions match the SGP4 truth over 24 h to **< 0.5 m** (well inside the 10 m
  TLE-grade tolerance). README documents the interoperability role (RINEX → RTKLIB/gLAB,
  SP3 → Ginan/precise-orbit products).
- **Coupled clock+position Kalman filter (cross-block covariance).** `src/fusion/coupled.rs`
  `CoupledPntFilter` is a single stacked `[pos, vel, phase, freq]` filter (Joseph-form
  updates) whose **pseudorange** measurement `ρ = g·pos + c·phase + noise` genuinely
  couples the position and clock blocks — unlike the legacy fusion pack's two
  independent two-state filters, which keep the cross-block covariance exactly zero.
  Validated: a shared pseudorange drives `P[pos,phase]` non-zero; two distinct
  geometries jointly resolve injected position+clock offsets a single range cannot
  separate; a **clock-only fix sharpens the position** through the cross-covariance
  (the payoff decoupled filters cannot provide); and the Monte-Carlo NEES is
  **χ²(4)-consistent**. This is the 1-DOF realization (the fusion pack's
  dimensionality); the 3-D 8-state extension and wiring into the runnable pack are
  tracked as follow-ons.
- **Kalman filter-consistency health monitoring (NIS/NEES).** The two-state clock
  filter's covariance update is now in **Joseph stabilised form** `P⁺ = (I−KH)P(I−KH)ᵀ
  + KRKᵀ`, which stays positive-semidefinite under extreme Q/R ratios (Cholesky-checked
  in CI at `R=1e-26 / Q≈1e-30`). A new `src/filter_health.rs` runs a Monte-Carlo
  consistency assessment (Bar-Shalom §5.4): pooled **NIS** (normalised innovation²,
  target 1) and **NEES** (normalised estimation error², target 2) against 95% χ²
  bands, surfaced as a `filter_health { nis_mean, nis_chi2_lower_95, nis_chi2_upper_95,
  nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent }` block in the clock
  result JSON and as a green/amber card in the playground. A Q/R-mismatch sweep test
  proves the monitor flips to inconsistent when the process noise is mistuned by
  ×0.1–×10. Adds a general χ² quantile (`detection::chi2_inv_cdf`, Wilson–Hilferty,
  table-checked).
- **`docs/PROVENANCE.md` — one citable provenance table.** Consolidates every sensor
  parameter (clocks, inertial, time-transfer), physical/algorithmic model (orbit, time
  systems, frames, iono/tropo, integrity, detection, jamming, Allan), and validation
  dataset (AIAA 2006-6753, Celestrak `gps-ops`) with its published source — datasheet,
  paper, ICD, or standard — and an honest maturity label (flight-qualified /
  ground-lab / space-goal-on-ground-hardware). Linked from the README intro and
  Documentation table; complements the per-run `provenance` strings that already travel
  in the result JSON.
- **Typed scenario API.** Dispatch is now on a typed `ScenarioKind` enum instead
  of a raw `kind` string match (`ScenarioKind::classify` + exhaustive dispatch), so
  adding a pack is compile-checked. New typed surfaces alongside the unchanged
  string-returning `run_toml`: `run_scenario(src) -> Result<RunOutput, KshanaError>`
  with a structured error taxonomy (`InvalidInput` / `NonConvergence` /
  `Unsupported` / `IoError`, each with a stable `kind_tag()`); a `Scenario` trait
  and `ExternalPack` extension point (the `jamming` pack is wired through it as the
  worked example); and `list_scenario_kinds()` introspection (name, description,
  required/optional fields per kind). The Python and WebAssembly bindings gain
  `list_kinds()` and `error_kind()`. Documented in `docs/ARCHITECTURE.md`.
- **Real GPS constellation + operating-envelope coverage.**
  `scenarios/orbit-sgp4-gps.toml` now ships a **real Celestrak `gps-ops` snapshot**
  (2021-07-28, 30 satellites) instead of synthetic Walker TLEs, with
  `strict_checksum = true` so it only loads when every TLE checksum is valid;
  `scripts/fetch_tles.sh` documents reproducible refresh and the README credits
  the open-data source. New `tests/scenario_coverage.rs` exercises each pack across
  ≥5 envelope variants asserting finite/bounded output, confirms the **flicker-FM
  floor measurably degrades a clock's coast** when enabled (now set in three shipped
  scenarios), and confirms the **fusion filter converges with a realistic non-zero
  accelerometer bias** (within 3× the zeroed-bias case), closing the "fusion only
  works with zeroed biases" realism gap. `docs/VALIDATION.md` gains an Operating
  Envelope table.
- **Measurement-domain GNSS simulation (`gnss-sim` kind).** A pseudorange-level
  forward model: per visible satellite it synthesises `ρ = geometric range +
  c·δt_rx − c·δt_sv + I + T + noise + multipath` and the L1 Doppler, with the
  **Klobuchar** single-frequency ionosphere (IS-GPS-200 §20.3.3.5.2.5) and the
  **Saastamoinen** zenith troposphere projected by the **Niell (1996)** mapping
  function — exposed as `[iono]` and `[tropo]` TOML blocks. The residuals feed
  snapshot RAIM for per-epoch HPL/VPL, and a `gnss_measurements[]` JSON array
  carries each SV's pseudorange, Doppler, C/N₀, and iono/tropo corrections. A
  zero-noise run reproduces geometry + corrections to sub-millimetre (CI test).
  New `src/gnss_sim.rs` and `scenarios/gnss-sim-raim.toml`.
- **Stochastic time-spoof detector (`spoof` kind).** The spoof pack now runs a real
  detector instead of a deterministic ramp-vs-bound comparison: four injection
  shapes (`linear_ramp`, `step_jump`, `meaconing`, `replay`), a two-sided χ²₁
  energy / Neyman–Pearson test on the clock-aided monitor statistic with the
  threshold set from a target false-alarm budget `target_pfa`, and the
  missed-detection probability `P_md` reported both closed-form and by Monte-Carlo
  (`mc_runs` trials per hypothesis — the two agree to a few ×1/√N). The Security
  figure of merit is now `1 − P_md` at the operationally-harmful (spec) magnitude.
  New `src/detection.rs` (Gaussian tail functions, NP/energy test, Monte-Carlo
  P_fa/P_md) and `scenarios/spoof-meaconing.toml`. Backward compatible: a bare
  `[attack] rate_ns_per_s` is still accepted as a linear ramp.

### Changed
- **Security FoM definition (`spoof` kind):** from the analytic detectability
  bound `1 − min_detectable/threshold` to the stochastic detector's `1 − P_md`.
  The clock pack's `security` field remains the faster analytic proxy.

### Added (continued)
- **RF jamming model (`jamming` kind).** A link-budget interference model that
  turns a jammer's power and geometry into per-satellite loss of lock: the
  jammer-to-signal ratio from free-space path loss and the per-direction
  receive-antenna gain, the effective C/N₀ via the standard anti-jam equation
  (despreading processing gain × the spectral-separation factor `Q`; Kaplan &
  Hegarty §9.4), and a configurable tracking threshold, scored over a Walker
  constellation as an `availability_under_jamming` figure of merit. New
  `src/jamming.rs` and `scenarios/jamming-demo.toml`. Honest scope (no multipath,
  terrain shadowing, AGC, or adaptive nulling) is documented in
  `docs/CAPABILITY.md` / `docs/VALIDATION.md`.
- **Generic N-D parameter sweep over any scenario kind (`sweep-nd`).** The
  previous N-D sweep was clock-pack only. `sweep-nd` varies dotted TOML keys of a
  `[base]` scenario over the Cartesian product of its axes, re-dispatches each
  grid node through the normal run path, and reads one or more metrics out of the
  result by dotted JSON path — so it works for every pack (inertial, gnss-ins,
  integrity, spoof, …) without coupling to each pack's Rust type. Grid nodes are
  evaluated in parallel across OS threads on native targets (no added
  dependency); wasm falls back to sequential. Deterministic and row-major
  regardless of thread count. New `scenarios/sweep-nd-inertial.toml` example.
- **TOML-configurable deterministic IMU error model in the `gnss-ins` pack.** The
  three-axis strapdown error chain (scale-factor, misalignment, g-sensitivity,
  quantization, rate-ramp; IEEE Std 952-1997 §A.2, Groves 2013 §4.3) is now
  reachable per sensor from a scenario file via an optional `[imu_*.error_model]`
  block, layered on top of the constant turn-on biases. Omitting the block leaves
  each sensor a pure constant-bias source, so existing `gnss-ins` runs are
  unchanged. This wires the previously library-only error model into a runnable
  pack and figure of merit.

## [0.10.0] - 2026-06-04

### Changed
- **Real-data validation.** The multi-GNSS RINEX navigation parser, the GLONASS
  RK4 propagator, and the SP3 reader are now exercised against genuine IGS/DLR
  files (a real RINEX 3 mixed broadcast nav file and an IGS SP3-c orbit product),
  not only self-authored samples — asserting non-empty satellite sets and finite,
  physically-sized ECEF positions. The fixtures are test-only (excluded from the
  published crate); see `tests/fixtures/igs/NOTICE`.
- **RAIM on real reference-orbit geometry.** The snapshot, solution-separation
  (MHSS), and ARAIM protection-level cores are now validated against the real IGS
  precise-orbit (SP3) geometry, not synthetic constellations alone: the line-of-sight
  geometry is built from the first SP3 epoch at a real ground station, and the tests
  assert metre-level, APV-I-available protection levels, that a 60 m pseudorange bias
  trips the χ² monitor, that solution separation **identifies** the faulted satellite,
  and that ARAIM's levels meet the allocated `P_HMI`. Closes the
  validated-on-synthetic-geometry-only gap (receiver-domain gLAB parity over a full
  RINEX arc remains a roadmap item — it needs a pseudorange solution).

### Added
- **Per-node confidence intervals for the N-D parameter sweep** (`sweep::nd_sweep_ensemble`).
  Each grid node of the N-dimensional Cartesian-product sweep can now be evaluated as a
  Monte-Carlo ensemble of seeds, reporting the metric's mean, percentiles, and a
  percentile-bootstrap 95% CI per node (for both clocks) — a statistically honest sweep
  rather than one draw per node. Reuses the ensemble/bootstrap machinery (`metric_stat`);
  deterministic; `runs = 1` reduces exactly to the single-seed `nd_sweep`. (Generalising
  the sweep across all packs, entangled with the typed-Scenario refactor, and parallel
  execution remain.)
- **NaveGo cross-validation of the IMU-noise pipeline** (`tests/navego_imu_crossval.rs`).
  An external cross-check against NaveGo (R. Gonzalez's open-source INS/GNSS toolbox):
  reproduces the synthetic round-trip of `navego_example_allan.m` on its published
  Microstrain 3DM-GX3-35 reference profile, confirming our overlapping-ADEV estimator
  recovers NaveGo's velocity- and angle-random-walk coefficients (`ADEV(1 s) = σ·√dt`)
  to under 5% with the expected −1/2 white-noise slope. (The 40 MB recorded STIM300
  `.mat` log is not ingested — binary-format-gated.)
- **Tightly-coupled (pseudorange) GNSS/INS update.** `GnssInsEkf::update_tightly_coupled`
  (and the `ClosedLoopInsGnss::fuse_tightly_coupled` wrapper) implement the
  previously-stubbed range-domain measurement: the innovation is the predicted
  range from the INS position to each satellite versus the measured pseudorange,
  with a line-of-sight Jacobian on the position error. Because each satellite is a
  scalar measurement, the filter keeps correcting with **fewer than four
  satellites** — where a loosely-coupled PVT fix does not exist. Five tests cover
  four-satellite nulling, two-satellite correction (no PVT possible), single-
  satellite along-line-of-sight observability, and input validation. Pseudorange-
  only; carrier phase and an explicit receiver-clock state remain roadmap. The
  unused `tight_coupling` cargo feature (which gated the old error stub) is removed.
- **Loosely-coupled GNSS/INS scenario pack (`kind = "gnss-ins"`, `src/fusion/pack.rs`).**
  Wires the three-axis strapdown navigator and the 15-state error-state EKF
  (`closed_loop` / `gnss_ins_ekf`) into a runnable scenario with a figure of merit —
  the EKF disciplines the mechanization against noisy GNSS fixes while coverage is
  up, then coasts through the outage, replacing the legacy 1-DOF scalar pack's
  truth-snap reset with genuine fusion. The result reports the fused horizontal
  error series, the scored position FoM (availability / outage RMS / holdover), and
  the open-loop free-INS RMS for comparison; a quantum/classical IMU pair differs
  only in true bias. Dispatched from the CLI/Python/wasm entry point with a
  `scenarios/gnss-ins.toml` example. Honest framing: loosely-coupled only, one
  deterministic trajectory, and the fused outage error is floor-limited by the
  hand-over attitude error (so it is not claimed to scale with bias) — the robust
  findings are that fusion beats unaided dead-reckoning for a biased sensor and that
  a lower-bias sensor has the better unaided coast.
- **Constellation design on the validated SGP4 core (`src/walker.rs`).** A new
  `walker` module emits a designed Walker-delta pattern (`i: T/P/F`) as SGP4
  **mean elements**, so the synthetic constellation propagates through the same
  SGP4 path validated to 4.12 mm against the AIAA 2006-6753 vectors — not the
  analytic Keplerian generator. On top of it: `pdop_sweep` tabulates coverage and
  median/worst PDOP over a `{planes × sats × inclination}` design grid, and
  `coverage_revisit` reports the coverage fraction and revisit gaps (worst/mean)
  at a ground point. Validated by the physical monotonicities a trade must obey
  (more satellites ⇒ higher coverage, lower PDOP, shorter revisit). Separately, a
  genuine **Celestrak `gps-ops` TLE snapshot** (2021-07-28, 30 operational GPS
  satellites) is added as a test-only fixture and the real-TLE → SGP4 → ECEF
  geometry path validated against it (full MEO shell within 1%, nine-satellite
  all-in-view at PDOP 1.64), alongside the existing SP3 and RINEX real-data paths.
- **Noise-type-specific effective degrees of freedom for the Allan confidence
  intervals.** `allan::edf_overlapping_adev` implements the NIST SP 1065 Table 5
  closed forms (the Stable32 simple set) for all five canonical power-law noise
  types — white/flicker PM, white/flicker FM, random-walk FM — replacing the
  conservative non-overlapping count as the χ² degrees of freedom. A new
  `PowerLawNoise` enum and `classify_power_law` identify the dominant type from
  the record's **modified** Allan-deviation slope (MDEV separates white from
  flicker PM where ADEV cannot), and `overlapping_adev_curve` now attaches the
  identified noise type, its edf, and a 95% confidence band to every point of the
  exported ADEV curve (`AdevPoint` gains `noise`/`edf`/`ci_lo`/`ci_hi`, additive
  with serde defaults). Validated two ways: the five formulas match hand-evaluated
  values to 1e-12, and a 4 000-record Monte-Carlo white-FM ensemble confirms the
  formula predicts the estimator's actual chi-squared edf within 20% (and that it
  materially beats the conservative count). Eight new tests.
- **Two-way time-transfer stochastic model.** `timetransfer::TwoWayLink` replaces the
  white-only sampler with a physically-grounded model: the reciprocal (common-mode) path
  delay cancels in the `(m_AB - m_BA)/2` estimate (`two_way_offset_estimate`, so two
  independent one-way measurements average to `1/sqrt(2)`), and the residual is the
  **non-reciprocal** differential delay — modelled as a colored white-FM + random-walk-FM
  process (the validated `ClockModel`), giving the synchronization-error series a realistic
  Allan signature (`sigma_y^2(tau) = q_rw*tau/3`) instead of flat white noise. `LinkCfg`
  gains `q_wf_s`/`q_rw_s` (serde default 0 ⇒ the legacy white-only behaviour, bit-for-bit),
  the link FoM reports `adev_tau0` (the model's Allan deviation at the base step), and the
  `timetransfer` scenario/CLI surface it. Golden FoM re-pinned. Six hand-derived tests
  (common-mode cancellation, the sqrt(2) two-way gain, the RWFM `tau/3` law via the link's
  own `step()`, legacy-equivalence at `q=0`, determinism, and end-to-end FoM exposure).
- **Stable32 numeric parity for the Allan-family estimators (NBS14).** `tests/allan_reference.rs`
  validates the overlapping ADEV, modified ADEV, time deviation, and overlapping Hadamard
  estimators against the Stable32 reference deviations for the canonical **NBS14** dataset
  (W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST SP 1065, ~p.107) at
  tau = 1, 2 to a 1e-4 relative tolerance — actual agreement ~1e-6. This pins the
  estimator mathematics against the de-facto reference implementation, not just against
  the estimators' own analytic self-consistency. Only the public reference numbers are
  used; no third-party code.
- **Vertical Stanford integrity diagram exported by the `integrity` scenario.** The
  runnable `integrity` scenario kind now exports a vertical Stanford(-ESA) diagram
  alongside the HPL/VPL availability map: at each protected epoch a seeded, reproducible
  no-fault range-error draw is mapped through the geometry to an actual vertical position
  error and classified against the VPL and the vertical alert limit (Available /
  System-Unavailable / Misleading / Hazardously-Misleading). The diagram (per-epoch
  points + region counts) is carried in the result JSON and the integrity-event / HMI
  counts in the CLI summary, so the Stanford classifier — previously library-only — is
  reachable end-to-end. `IntegrityScenario` gains a `seed` field (default 0) controlling
  the error realization; the availability map itself remains geometry-only and seed
  independent.
- **ARAIM integrity-risk (P_HMI) budget for the protection levels.** `raim::araim_raim`
  derives the horizontal and vertical protection levels from an explicit integrity-risk
  budget rather than a fixed `K_md` multiplier: for the all-in-view solution and every
  single-satellite exclusion sub-solution it builds the per-mode `(prior, detection
  threshold, σ)` on each axis, then `araim_protection_level` solves the smallest PL whose
  summed probability of hazardously-misleading information (`araim_integrity_risk`,
  `P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)`, Blanch et al. *Baseline ARAIM*) meets the
  allocated `P_HMI`. The result reports the integrity risk the levels actually achieve, so
  a user can trade integrity against the alert limit explicitly. Six hand-derived tests
  (fault-free and thresholded single-mode closed forms, multi-mode summation/monotonicity,
  end-to-end fault-free protection with a 10⁵× tighter budget raising the PL, fault
  detection/identification, and the six-satellite redundancy floor). Single-fault MHSS is
  the ARAIM baseline; simultaneous multi-SV-subset faults, the constellation-wide fault
  mode, and gLAB reference-dataset validation are documented extensions.
- **Two-speed coning/sculling compensation for the strapdown mechanization.**
  `inertial::mechanization::coning_sculling_compensate` folds the high-rate coning
  (attitude) and rotation+sculling (velocity) terms out of a coarse update's
  ordered sub-interval IMU increments, so a moderate-rate `NavState::step_increments`
  reproduces vibration-rectified motion a coarse step over the raw sums misses. A
  validation test drives a 10 Hz coning+sculling environment for 60 s and compares
  fine-rate truth, naive coarse integration, and the folded coarse integration:
  the fold cuts the position error by ~18× (metres of naive drift → sub-decimetre),
  confirming the coning/sculling terms are load-bearing. A `ScalarErrorBudget`
  type alias names the legacy 1-DOF `AccelModel` for what it is, distinct from the
  three-axis `NavState` navigator.
- **RINEX observation-file parser.** New `rinex_obs` module reads the RINEX 3.0x /
  4.00 *observation* file — the receiver's actual measurements — completing the
  RINEX pair alongside the existing navigation-message parser. `parse_obs` decodes
  the header (version/type, the per-system `SYS / # / OBS TYPES` lists with
  continuation lines, approximate position, interval, time of first observation)
  and each epoch's per-satellite records: pseudorange, carrier phase, Doppler, and
  signal strength, keyed by their RINEX 3 observation code (`C1C`, `L1C`, …) with
  the loss-of-lock (LLI) and signal-strength (SSI) flags, a blank field preserved
  as absent rather than zero. Honest scope: this is the standards-format *ingest*
  (a real RTKLIB/gLAB/IGS-station observation log in, typed measurements out), not
  a positioning engine — no pseudorange solution, PPP, or RTK here.
- **CCSDS OEM (Orbit Ephemeris Message) writer.** New `oem` module exports a
  propagated constellation as a valid CCSDS 502.0-B OEM 2.0 message —
  the KVN ephemeris format GMAT, Orekit, STK, and most flight-dynamics tools
  ingest. `OemFile::from_propagators` samples each satellite's inertial
  (TEME) state — position **and** velocity, taken straight from the propagator
  with no Earth-fixed rotation, unlike the SP3 export — onto a time grid, and
  `OemFile::to_oem_string` serialises the `CCSDS_OEM_VERS`/`CREATION_DATE`/
  `ORIGINATOR` header plus one `META_START … META_STOP` segment per satellite
  (`OBJECT_NAME`/`OBJECT_ID`/`CENTER_NAME`/`REF_FRAME = TEME`/`TIME_SYSTEM = GPS`/
  `START_TIME`/`STOP_TIME`) followed by its `epoch X Y Z X_DOT Y_DOT Z_DOT`
  lines (km, km/s). The `CREATION_DATE` is caller-supplied, never wall-clock, so
  output is byte-identical across runs (the reproducibility contract). This is the
  spacecraft-ephemeris counterpart to the GNSS SP3 export: a Kshana orbit can now
  be handed to a flight-dynamics tool in a standard format.
- **SP3 precise ephemeris as a propagation source.** `Sp3File::interpolator`
  builds a per-satellite `Sp3Interpolator` that fills the position between the
  tabulated SP3 epochs with a 9th-order Lagrange polynomial (standard IGS
  practice) and rotates it into the shared TEME frame, exposed as
  `Propagator::Sp3Precise`. An IGS/analysis-centre precise-orbit file can now drive
  the same geometry/visibility/integrity pipeline as the broadcast and analytic
  propagators. Validated round-trip: a Kepler orbit written to SP3 and re-read
  through the interpolator matches the original to sub-metre at the nodes and
  < 100 m mid-interval. Clock interpolation is next.
- **GLONASS broadcast ephemeris (completes multi-GNSS RINEX nav).** New `glonass`
  module: GLONASS doesn't broadcast Keplerian elements but a PZ-90 Earth-fixed
  **state vector** (position, velocity, luni-solar acceleration). `parse_glonass_nav`
  reads the RINEX 3 `R` records, and the satellite position at any time is obtained
  by **4th-order Runge–Kutta integration** of the GLONASS ICD equations of motion
  (central gravity + `J2` + Earth-rotation Coriolis/centrifugal terms + the
  broadcast acceleration). Exposed as `Propagator::Glonass`, so GLONASS satellites
  flow through the constellation/visibility/integrity pipeline alongside the
  Keplerian systems; a single `rinex` constellation block can now mix GPS, Galileo,
  QZSS, BeiDou, and GLONASS.
- **Multi-GNSS RINEX navigation (GPS, Galileo, QZSS, BeiDou).** The RINEX 3
  navigation parser now decodes Galileo (`E`), QZSS (`J`), and BeiDou (`C`,
  MEO/IGSO) records alongside GPS (`G`) — they share the Keplerian layout and user
  algorithm — each evaluated with its own gravitational constant and Earth-rotation
  rate (Galileo/BeiDou μ, BeiDou Ω̇ₑ). A mixed-constellation file yields all of
  them, flowing through the constellation/visibility/integrity pipeline as
  `Propagator::Rinex`. BeiDou geostationary satellites use a different coordinate
  rotation and are skipped pending a reference fixture to validate against. The
  record walker uses per-system line counts, fixing a latent bug where four-line
  GLONASS/SBAS records were skipped as if eight lines long. GLONASS (a state-vector
  model) is next.
- **SP3-c/d precise-ephemeris reader and writer.** New `sp3` module parses
  IGS/analysis-centre SP3 precise orbit files (`parse_sp3`) — the post-processed
  ECEF position/clock product that PPP engines (Ginan, RTKLIB, gLAB) treat as
  reference — into a structured `Sp3File` (header, epoch grid, per-satellite
  position km→m, clock µs, and velocity dm/s→m/s for `V` products), preserving the
  SP3 bad-value sentinels. The reverse direction is also covered:
  `Sp3File::from_propagators` builds an SP3 from a propagated constellation
  (TEME→ECEF per epoch) and `to_sp3_string` serialises it, so Kshana orbits can be
  exported in the format external PPP tools ingest — the read↔write round trip.
  Epoch interpolation and an SP3 propagator source are next.
- **RINEX broadcast ephemeris as a runnable constellation source.** A
  constellation now accepts an inline `rinex` block (RINEX 3 GPS navigation
  text) alongside the existing `tle` option, so a real broadcast file drives a
  scenario end-to-end from the CLI, Python, or the in-browser playground — RINEX
  in, PNT geometry out. New `scenarios/orbit-rinex.toml` demonstrates GNSS
  availability and DOP from eight GPS satellites built straight from broadcast
  records. (GPS LNAV only; multi-GNSS and SP3 are next.)
- **RINEX broadcast ephemeris as a propagation source.** A parsed
  `RinexEphemeris` now converts to an `orbit::Propagator` (`Propagator::Rinex`):
  position is the IS-GPS-200 broadcast orbit rotated from ECEF into the shared
  TEME inertial frame (`sv_position_teme`, with leap-second-correct GPS→UT1 time),
  velocity by central finite difference, and the Keplerian orbital period. Real
  GPS broadcast data can now drive the same geometry, visibility, and integrity
  (RAIM) pipeline as the analytic SGP4/Keplerian propagators. (Not yet exposed as
  a RINEX-file scenario kind — that and multi-GNSS/SP3 are next.)

## [0.9.2] - 2026-06-03

### Added
- **Archival DOI.** Releases are now deposited to Zenodo and assigned a citable DOI.

## [0.9.1] - 2026-06-03

### Changed
- **Documentation.** Refreshed the README to institutional grade: a Capabilities
  overview of the full v0.9.0 stack, a Versioning & releases section, a clean
  header with the new mark, and a concise status line. No engine changes.

## [0.9.0] - 2026-06-03

This release adds three substantial capability areas on top of the 0.8.0 SGP4
substrate: a genuine three-axis strapdown INS, a loosely-coupled GNSS/INS
error-state EKF with closed-loop feedback, real snapshot and solution-separation
(ARAIM-style) RAIM with HPL/VPL and a runnable `integrity` scenario, and the first
step of GNSS-format interoperability (RINEX-3 GPS ephemeris ingestion).

### Added
- **RINEX 3 GPS navigation-message parser (`src/rinex.rs`).** First step toward
  GNSS-format interoperability: `parse_nav` reads a RINEX 3.x navigation file and
  decodes each GPS (`G`) broadcast-ephemeris record — the eight-line SV/epoch +
  `BROADCAST ORBIT` block — into a `RinexEphemeris` of Keplerian elements and
  clock corrections, with field names and units per IS-GPS-200. Handles the
  Fortran `D`-exponent float format (`parse_d`) and fixed-width column layout;
  records for non-GPS systems are skipped, not rejected, so a mixed file still
  yields its GPS ephemerides. Four tests: `D`-exponent parsing (including blanks
  and errors), a full record decoded against known field values with a GPS
  semi-major-axis sanity check (√A² ≈ 26 560 km), non-GPS skipping, and the
  empty-file case.
- **GPS broadcast-ephemeris → ECEF position (`src/rinex.rs`).**
  `RinexEphemeris::sv_position_ecef(t_tow)` evaluates the satellite's Earth-fixed
  position from the parsed ephemeris via the IS-GPS-200 §20.3.3.4.3.1 user
  algorithm: Newton solution of Kepler's equation for the eccentric anomaly, the
  second-harmonic argument-of-latitude / radius / inclination corrections, and the
  rotation into ECEF accounting for Earth rotation since the reference epoch (with
  the GPS `μ` and `Ω̇ₑ` mandated by the spec, and a week-rollover `tk` fold). Three
  tests: the geocentric radius stays in the GPS band (≈ 26 560 km), the Earth-fixed
  speed is ~3.9 km/s, and evaluating a full week away reproduces the same position.
- **GPS SV clock bias with the relativistic correction (`src/rinex.rs`).**
  `RinexEphemeris::sv_clock_bias_s(t_tow)` evaluates the broadcast clock
  polynomial `af0 + af1·Δt + af2·Δt²` about `Toc` plus the relativistic
  eccentricity term `F·e·√A·sin Ek` (IS-GPS-200 §20.3.3.3.3.1). A new
  `EpochUtc::gps_time_of_week` converts the record's calendar epoch to GPS
  time-of-week via Julian-day arithmetic from the GPS epoch (1980-01-06), and the
  Kepler solve is shared with the position evaluation. Tests: GPS time-of-week for
  a Sunday/Tuesday/Saturday (week boundaries), and the clock bias being
  af0-dominated with a present, bounded relativistic term. The L1 group-delay
  `TGD` is exposed but deliberately not folded in. Honest scope: a `Propagator`
  source, Galileo/BeiDou/GLONASS, and SP3 remain next steps. (`docs/CAPABILITY.md`
  updated to match.)
- **User-runnable `integrity` scenario kind (`scenarios/integrity-raim.toml`).**
  The RAIM availability capability is now reachable from the CLI/TOML like every
  other pack: `kind = "integrity"` parses an `IntegrityScenario` (user orbit, one
  or more GNSS constellations, elevation mask, and the `(sigma, P_fa, P_md, AL_H,
  AL_V)` integrity config), runs `constellation_raim_availability`, and emits the
  per-epoch HPL/VPL availability map as JSON plus a self-contained SVG —
  protection levels over time against the alert limits, with a green/red
  availability strip. `kshana scenarios/integrity-raim.toml` writes the JSON, the
  chart, and an HTML report. The bundled scenario (24-satellite Walker, 1 m
  dual-frequency ranging, APV-I limits) reports ~95 % availability; it documents
  that single-frequency RAIM does not meet the vertical APV-I limit on one
  constellation, which is why vertical guidance uses SBAS/dual-frequency/ARAIM.
  Tests cover the dispatch, the availability-map JSON, and the SVG.
- **Runnable RAIM availability over a constellation (`src/raim.rs`).** The
  integrity module had no caller — `constellation_raim_availability` makes it a
  genuine end-to-end entry point: at each epoch on a time grid it propagates the
  visible satellites (the same SGP4/Keplerian `Propagator`s the engine uses),
  computes the no-fault protection levels, and judges availability against the
  horizontal/vertical alert limits, returning a `serde`-serializable
  `RaimAvailabilityReport` (per-epoch `n_visible`/HPL/VPL/`available` plus the
  availability fraction). A `RaimConfig` bundles `(sigma, P_fa, P_md, AL_H, AL_V)`
  and the per-epoch `raim_availability_epoch` is exposed for callers that resolve
  their own geometry. Three tests: an epoch judged available under APV-I limits on
  a ten-satellite geometry, made unavailable by an impossibly tight limit, and
  `None` levels below five satellites; and an end-to-end run over a 24-satellite
  Walker constellation that yields a finite availability map and serializes. (Six
  satellites — the residual-RAIM redundancy floor — honestly do *not* meet APV-I
  even at 1 m ranging; APV-I availability needs the denser geometry the test uses.)
- **Stanford(-ESA) integrity diagram accumulator (`src/raim.rs`).** The standard
  way to summarise an integrity monitor over many epochs: it plots actual
  position error (x) against protection level (y) and classifies each epoch, by
  the diagonal `y = x` and the alert limit, into `Available` (PL bounds error,
  within AL), `SystemUnavailable` (PL bounds error but exceeds AL — safe,
  unusable), `MisleadingInformation` (PL < error ≤ AL), or
  `HazardouslyMisleadingInformation` (PL < error and error > AL — the unsafe
  failure). `classify_stanford` is the pure classifier; `StanfordDiagram`
  accumulates `(error, PL)` points against a fixed alert limit, exposing region
  counts, availability, integrity-event totals, and `serde`-serializable points
  for plotting/JSON export. Four tests: every region (including the `error == PL`
  bounded boundary), count/availability accumulation, and JSON round-trip. This
  is the reporting surface for the RAIM protection levels; wiring it into the
  constellation scenario and validating against a public dataset remain roadmap
  items.
- **Solution-separation (ARAIM-style) RAIM (`src/raim.rs`).** A
  multiple-hypothesis integrity monitor alongside the existing residual/parity
  chi-squared `snapshot_raim`. For the all-in-view least-squares solution and
  every single-satellite exclusion sub-solution, it forms the separation
  `Δ_k = x_k − x₀` — zero-mean Gaussian under no fault with covariance
  `Cov(x_k) − Cov(x₀)` (the nested-estimator identity, valid because the
  all-in-view solution is BLUE) — and so it both **detects** a fault and
  **identifies** the faulted satellite (the one whose exclusion gives the largest
  normalized separation). Horizontal/vertical protection levels follow the
  standard MHSS allocation `PL = max(K_md·σ₀, max_k[K_fa·σ_ss,k + K_md·σ_k])`,
  with `K_fa = Φ⁻¹(1−P_fa/2)`, `K_md = Φ⁻¹(1−P_md)`. New dependency-free
  `normal_cdf`/`normal_quantile` built from the module's existing regularized
  incomplete gamma (`erf(x) = P(½,x²)`). Four hand-derived tests: normal CDF /
  quantile against textbook values (Φ(1.95996)=0.975, the 1e-7 tail = 5.1993,
  symmetry); a fault-free geometry that does not alarm and yields finite, positive
  HPL/VPL; a 60-σ single-satellite bias that is detected *and* correctly
  identified (`excluded_sv == 2`); and the six-satellite redundancy floor. Closes
  the audit's "tautological integrity — no real RAIM/HPL/VPL" P0 gap on the
  algorithm side; gLAB-dataset validation and the Stanford-diagram accumulator
  remain roadmap items.
- **Closed-loop GNSS/INS integration (`src/fusion/closed_loop.rs`).**
  `ClosedLoopInsGnss` wires the error-state EKF kernel to the three-axis strapdown
  mechanization: each IMU sample is corrected by the running bias estimates,
  mechanized forward, and the EKF covariance time-propagated with the matching
  navigation context; each GNSS position/velocity fix forms the INS−GNSS
  innovation and feeds the estimated **position, velocity, attitude error (ψ, as a
  quaternion rotation) and accelerometer/gyro biases** back into the solution,
  resetting the error-state mean. Feeding the attitude back (not only the biases)
  is required for stability — the tilt and accelerometer bias are a coupled pair,
  so correcting one without the other diverges. INS and GNSS are compared in a
  local tangent-plane NED frame using the mechanization's own radii of curvature
  (new `mechanization::radii_of_curvature`; `NavState::omega_ie_n`/`omega_en_n`
  exposed). This is the honest replacement for the hybrid pack's *truth-snap
  reset*. Three tests: a closed loop nulling an injected 8 m / −5 m position error
  to <0.1 m; an aided solution staying metre-bounded (<6 m) on a driving
  trajectory while a free-running INS diverges past 100 m; and the milestone
  benchmark — the fused solution's **Monte-Carlo position RMS over a 60 s GNSS
  outage beats an unaided open-loop dead-reckoner by >2× (≈4× across seeds)**.
  Honest limitation documented in the module: in loosely-coupled mode the accel
  bias and tilt are only weakly separable (both couple through gravity), so the
  delivered value is the bounded, corrected state and a clean outage-entry — not a
  precise inertial calibration; richer dynamics and the tightly-coupled extension
  remain roadmap items.
- **Loosely-coupled GNSS/INS error-state EKF kernel (`src/fusion/gnss_ins_ekf.rs`).**
  A 15-state error-state extended Kalman filter — `δx = [δp, δv, ψ, b_a, b_g]` —
  with the strapdown error dynamics from Groves 2013 §14.2 (specific-force/tilt
  coupling, Coriolis, body→nav bias projection, Gauss–Markov bias models), a
  first-order discrete transition `Φ = I + F·dt`, and a loosely-coupled
  position+velocity measurement update (`H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]`) in Joseph
  form. Dependency-free dense linear algebra (Gauss–Jordan inverse, Joseph
  covariance update). A `tight_coupling` cargo feature gates a documented,
  not-yet-implemented pseudorange/Doppler update. 7 tests with hand-derived
  expectations: the skew/cross-product identity, a verified 3×3 inverse,
  covariance staying symmetric/PSD under prediction (and position uncertainty
  growing un-aided), a position fix shrinking the position covariance, exact
  recovery of a known position error at the analytic Kalman gain `P/(P+R)`, and
  smaller corrections under larger measurement noise. This is the kernel that
  will replace the hybrid pack's open-loop truth-snap reset with closed-loop
  feedback (pack wiring + NaveGo validation to follow).
- **Deterministic IMU error model for the 3-axis strapdown navigator (`src/inertial/imu_errors.rs`).**
  `ImuErrorModel` distorts a true body-frame `(ω, f)` pair into a measured one
  through five systematic categories (IEEE Std 952-1997 §A.2; Groves 2013 §4.3,
  Table 4.1): **scale-factor** (per-axis ppm gain error), **misalignment /
  cross-coupling** (off-diagonal triad non-orthogonality), **g-sensitivity** (a
  gyro rate bias proportional to specific force), **quantization** (rounding to
  the output LSB), and **rate-ramp** (a linear-in-time drift — the third Allan
  region), plus a constant turn-on bias. Every term defaults to zero, so
  `ImuErrorModel::ideal()` is a transparent pass-through and existing scenarios
  are unaffected. Each error source has an isolation test (scale linear to <0.01%,
  misalignment cross-axis above the VRW floor, g-sensitivity bias, LSB grid,
  linear ramp), and an end-to-end test drives a navigation error through the
  mechanization from a distorted IMU. Not modelled: vibration rectification error,
  temperature-gradient drift. (The shipped `inertial` scenario pack still runs the
  legacy 1-DOF scalar budget; this model feeds the 3-axis library.)
- **Coning and sculling compensation for the strapdown integrator.** The
  attitude path adds the two-sample `coning_increment` (`½ Δθ_prev × Δθ_cur`); a
  coarse-rate (30 Hz, 5-samples/cycle) integration of a 5 Hz coning environment
  is verified to track fine-rate truth ≥ 3× better with the correction than naive
  increment-summing. The velocity path adds `sculling_increment` (`½ Δθ × Δv`,
  Groves eq. 5.82) and resolves the body velocity increment through a new
  `NavState::step_increments` increment-based update using the body-relative
  rotation `Δθ_rel = Δθ_b − C_n^b ζ`, so an Earth-fixed platform incurs no
  spurious sculling while a genuine vibration triggers the full term.
- **Full three-axis strapdown mechanization in the NED frame (`src/inertial/mechanization.rs`).**
  `NavState { q, v_ned, p_llh }` is advanced by `step(gyro_b, accel_f_b, dt)` using
  the standard terrestrial-frame NED equations (Groves §5.4): body→NED attitude
  corrected for the inertial-to-nav rate `ω_in = ω_ie + ω_en` (Earth rotation +
  transport rate); specific force resolved body→NED through the DCM; velocity
  integrating `v̇ = f_n − (2 ω_ie + ω_en) × v + g_n` (Coriolis/transport + gravity);
  and geodetic position via the meridian/transverse radii of curvature. Gravity is
  the WGS-84 closed-form Somigliana **normal (plumb-bob) gravity** with a NIMA
  free-air altitude correction — never a hard-coded constant. This is the genuine
  three-axis navigator that supersedes the 1-DOF scalar error-budget path. Verified
  by physical invariants: a platform bolted to the rotating Earth at 45°N (sensing
  Earth rate + 1 g) stays within 1 mm over 60 s; a level north specific force gives
  `v_N ≈ a·t` and `½ a t²` displacement; normal gravity matches the known
  equator/pole/45° surface values and the free-air lapse rate.
- **Three-axis attitude representation for strapdown INS (`src/inertial/attitude.rs`).**
  A unit-quaternion `Quaternion` type (scalar-first, Hamilton convention) carrying
  body→nav rotation, with a DCM view (`to_dcm`/`from_dcm` via Shepperd's method),
  Hamilton product, axis-angle and rotation-vector (exact exp-map) constructors,
  and quaternion kinematics — both a first-order RK rate update (`q̇ = ½ q ⊗ ω`)
  and a coning-corrected rotation-vector update. The two-sample `coning_increment`
  (Savage / Bryan–Lewantowski, `½ Δθ_prev × Δθ_cur`) supplies the rotation-rate
  cross-coupling term that scalar dead-reckoning omits. This is the attitude
  foundation for the full 3-axis mechanization that replaces the legacy 1-DOF
  error-budget path. Verified against closed-form rotations: constant-rate
  propagation matches the axis-angle quaternion to 1e-6, DCMs are orthonormal with
  unit determinant, and coning vanishes for single-axis motion. (`src/inertial.rs`
  is now the `src/inertial/` module directory; the public path `crate::inertial`
  is unchanged.)
- **Geodetically-correct ground-station visibility (`src/frames.rs`).**
  `elevation`, `is_visible`, and `visible_count` compute a satellite's elevation
  above a ground station's horizon against the **WGS-84 ellipsoid normal** (the
  true local vertical), not the geocentric radial — the two differ by up to the
  ~0.19° geodetic deflection, enough to flip near-horizon satellites in or out of
  an elevation mask. Verified end-to-end (a Walker constellation propagated,
  rotated TEME→ECEF, and counted from a geodetic site) and against the
  geocentric approximation.

### Changed
- **CI reliability.** The `test-python-bindings` job now builds the wheel with
  `PyO3/maturin-action` (manylinux container) instead of a raw host `maturin
  build`, eliminating an intermittent `rustfmt-preview`/`cargo-fmt` rustup
  conflict on the runner image. The `deny` job installs `cargo-deny` as a
  prebuilt binary via `taiki-e/install-action` instead of the Docker-based
  `cargo-deny-action`, removing a Docker Hub registry-pull timeout. Neither
  change affects the checks performed.

## [0.8.0] - 2026-06-02

### Added
- **Inertial velocity is exposed downstream.** `Propagator::velocity_eci` and
  `Propagator::state_eci` (returning `StateEci { r_m, v_m_s }`) thread the analytic
  TEME velocity SGP4 already computes — previously discarded — through to callers in
  m/s; `Orbit::velocity_eci` gives the Keplerian path a consistent velocity. The
  AIAA 2006-6753 verification test now also checks velocity for every reference row
  (worst velocity error 1.85e-9 km/s across all 666 states) and pins the compared
  row count at exactly 666.
- **Stricter, panic-free TLE parsing.** Lines are required to be ASCII and are
  sliced safely (no more byte-index panics on multi-byte input); elements are
  range-checked (inclination, eccentricity, mean motion); the column-69 checksum
  can be enforced via `ParseOpts { strict_checksum }` / `parse_propagators_opts`
  and the new `strict_checksum` flag on `ConstellationCfg` (lenient by default).
- **Allan-deviation curve in the output.** Each clock run now reports an
  `adev_curve` (`[{tau_s, adev, n_samples}]`) and the browser playground renders a
  log-log "Clock stability (ADEV)" chart.
- **Time-grid input validation.** `TimeCfg::validate` rejects a non-finite, zero,
  negative, or oversized time grid (a step larger than the duration, or more than
  `MAX_TIME_STEPS` samples) before any allocation, so a malformed scenario returns
  an error instead of panicking or exhausting memory.
- **Monte Carlo ensembles for the inertial pack.** `runs = N` on an inertial
  scenario runs N seeds and reports each metric's mean, standard deviation,
  percentiles, and a percentile-bootstrap 95% confidence interval (`ensemble`).
  Every inertial run now carries a `monte_carlo` flag, so a single-realisation FoM
  is no longer mistaken for a distribution. (CEP/2DRMS are intentionally not
  reported — they require the 3-axis model on the roadmap.)
- **Guided playground mode.** The browser playground no longer drops you onto a
  raw TOML wall: a "Start here" strip of one-click scenario cards loads and runs a
  worked example, sliders expose the universal knobs (seed, timing threshold)
  without touching the TOML, a "How to read this" note explains the result, and the
  full TOML is one collapsible away. Every run is shareable — **Copy share link**
  encodes the whole scenario into the URL fragment (nothing is uploaded) so a link
  reproduces the exact run on load. The codec is unit-tested (`web/share.test.mjs`,
  run in CI).
- **N-dimensional parameter sweeps (`src/sweep.rs`).** `nd_sweep` evaluates a
  metric over the full Cartesian product of several `SweepAxis` ranges (the
  multi-parameter trade study), in row-major order, deterministically. Additive —
  the existing 1-D sweep API is unchanged. Per-node bootstrap confidence intervals
  and generalisation beyond the clock pack remain on the roadmap.
- **Real snapshot RAIM (`src/raim.rs`).** Genuine position-domain Receiver
  Autonomous Integrity Monitoring: it builds the line-of-sight geometry to the
  visible satellites, forms the least-squares solution and residuals, runs a χ²
  residual fault-detection test (exact threshold from a dependency-free
  incomplete-gamma χ²/non-central-χ²), and computes slope-based horizontal and
  vertical protection levels (HPL/VPL) with the missed-detection bias derived for
  the configured P_fa/P_md. This is distinct from — and is **not yet wired into** —
  the scenario pipeline's filter-self-consistency Integrity figure; fault
  exclusion, alert-limit/P_HMI budgeting, and ARAIM remain on the roadmap.
- **Frequency-stability suite: MDEV, TDEV, HDEV + confidence intervals**
  (`src/allan.rs`). Alongside the overlapping ADEV: the modified Allan deviation
  (separates white from flicker phase noise), the time deviation
  (`TDEV = tau/sqrt(3) * MDEV`), and the Hadamard deviation (rejects linear
  frequency drift exactly and converges for divergent red-noise types). χ²-based
  confidence intervals (`deviation_ci`) use a dependency-free normal/χ² quantile
  pair (Acklam + Wilson-Hilferty) with a conservative non-overlapping edf;
  noise-type-specific edf and Stable32 numeric parity remain on the roadmap.
- **Reference-frame reduction (`src/frames.rs`).** GMST-based TEME↔ECEF rotation
  (using the same IAU-1982 sidereal time as the propagator), exact WGS-84
  geodetic↔ECEF with a Bowring-seeded iterative inverse (machine-precision at all
  altitudes, including MEO/GEO), and a geodetic ground-station
  observer that returns azimuth / elevation / range in the local East-North-Up
  frame. Polar motion and sub-arcsecond nutation are not applied (GMST-only,
  sub-kilometre on the ground track); an ITRF-precise CIO chain is on the roadmap.
- **Time-scale foundation (`src/timescales.rs`).** A dependency-free Julian-date
  API (Gregorian civil ↔ JD, MJD), the full IERS integer leap-second history
  (UTC↔TAI, 10 s in 1972 to 37 s since 2017), the defined TAI→TT offset, the UT1
  correction via a supplied DUT1, and the IAU-2000 Earth Rotation Angle. This is
  the time substrate that Earth-fixed frame reduction (planned) sits on. Instants
  are single-`f64` Julian Dates (~50 µs resolution near the present epoch; a
  two-part JD is on the roadmap), and the pre-1972 rubber-second era is not
  modelled — both documented in the module.
- **Reproducibility & provenance.** A deterministic CycloneDX SBOM generator
  (`scripts/gen-sbom.sh`) and a SLSA build-provenance attestation on the release
  binary and SBOM; the release toolchain is pinned to match CI. Determinism
  guarantees, the cross-platform `libm` caveat, and the golden-pinning approach are
  documented in `docs/REPRODUCIBILITY.md`.

- **Property-based and fuzz tests** (`tests/property.rs`). Deterministic
  randomized tests (no new dependency) assert invariants over thousands of inputs:
  the TLE and scenario parsers never panic on garbage, non-ASCII, mutated, or
  truncated input; `TimeCfg::validate` never panics on NaN/inf/negative grids; the
  TLE checksum is consistent and column-69-only; geodetic↔ECEF round-trips and the
  TEME→ECEF rotation preserves norm across the globe and a wide altitude band.

### Changed
- Golden tests now **pin the figures of merit field-by-field** for the four
  reference scenarios (with a tolerance that absorbs cross-platform `libm` jitter),
  replacing the earlier inequality-only checks, so a silent numerical regression is
  caught immediately.
- `schema_version` in result artifacts bumped from `0.1` to `0.7` (it was frozen
  while the engine moved on).
- `cargo-deny` now **denies** (not warns on) yanked dependencies.
- New docs: `CAPABILITY.md` (honest scope map), `SCHEMA.md` (result-field
  reference), `INTEGRITY.md`, `QUANTUM-MODELS.md`, `REAL_TLE_GUIDE.md`. A CI guard
  fails if the README version badge drifts from `Cargo.toml`.

## [0.7.0] - 2026-06-02

### Added
- **SGP4/SDP4 orbit propagation.** A full, dependency-free implementation of the
  standard simplified-perturbations propagator — near-Earth SGP4 together with the
  deep-space SDP4 extension (lunar-solar secular and periodic perturbations and
  12 h / 24 h geopotential resonance). It is validated against the official AIAA
  2006-6753 ("Revisiting Spacetrack Report #3") verification vectors: all 666
  reference states across the near-Earth, deep-space, resonant, and error-code
  cases match to a worst-case position error of about 4 mm. This is the model
  two-line element sets are defined against, so it represents real constellations
  — notably the ~12 h GNSS orbits, which are deep-space and resonant and which the
  earlier two-body + J2-secular model cannot capture.
- A constellation given as **full two-line element sets** (line 1 + line 2) is now
  propagated with SGP4/SDP4; a constellation given as line-2-only elements keeps
  the analytic Keplerian two-body propagation, unchanged. The two forms can be
  mixed in one block. New `orbit-sgp4-gps.toml` reference scenario (a GPS-like MEO
  constellation in real two-line format, propagated with SGP4) — drop in a current
  Celestrak "gps-ops" set to study the live constellation.

## [0.6.0] - 2026-06-02

### Added
- **Active spoofing-attack demonstrator.** A new `spoof` scenario kind injects a
  ramping false-time spoof and runs each clock's clock-aided integrity monitor,
  reporting whether and when the spoof is detected and whether it reaches the
  operational spec undetected — turning the Security figure of merit into a concrete
  attack/defence demonstration. New `spoof-attack.toml` reference scenario.
- **Multi-constellation availability.** An orbit scenario can combine several
  constellations (a `[[constellations]]` list alongside the primary
  `[constellation]`) for multi-GNSS availability and dilution of precision — e.g.
  GPS plus Galileo. New `orbit-multignss.toml` reference scenario.

## [0.5.0] - 2026-06-02

### Added
- **HTML scorecard report.** Every run now also produces a self-contained, branded
  HTML scorecard — the one-line summary, the chart (embedded as an inert data-URI
  image), and the full JSON — written by the CLI alongside the JSON and SVG. A
  shareable single-file artifact for a study deliverable or annex.
- **Joint sensor-fusion estimator.** A new `fusion` scenario kind runs a single
  recursive Kalman filter as the navigation solution — fusing the clock state
  `[phase, frequency]` and the position state `[position, velocity]`, disciplined by
  GNSS (learning the frequency offset and velocity) and aided by optical time
  transfer during the outage — rather than composing independent predictors. It
  reports fused timing/position holdover and a joint-covariance integrity. New
  `fusion-pnt.toml` reference scenario.
- **Fuller IMU noise model.** The accelerometer now models the remaining
  Allan-variance terms beyond the constant bias and velocity random walk:
  **bias instability** (a 1/f flicker floor at the standard Allan bias-instability
  coefficient, reusing the clock's flicker synthesis) and **acceleration random
  walk**. New optional `bias_instability` and `q_aa` inertial scenario fields; a
  GNSS re-fix re-calibrates the residual bias drift.
- **Real constellation geometry from TLEs.** A constellation can be given as a block
  of two-line element sets (the standard NORAD/Celestrak format) via a `tle` field,
  so availability and dilution of precision use a real constellation's published
  geometry instead of a synthetic Walker pattern. The engine reads each TLE's mean
  Keplerian elements and propagates them two-body — not SGP4 — which is sound for a
  snapshot study from a common epoch. New `orbit-real-tle.toml` reference scenario.

## [0.4.0] - 2026-06-02

### Added
- **Trade-study parameter sweeps.** A new `sweep` scenario kind varies one
  parameter (`threshold_ns`, `duration_s`, `quantum_q_wf`, or `classical_q_wf`)
  across a linear or logarithmic range and records a chosen figure of merit at each
  point for both clocks, producing the "how does holdover scale with clock
  stability?" comparison chart a design trade needs. New `sweep-clock-stability.toml`
  reference scenario.
- **Monte Carlo confidence bands.** The clock-holdover scenario can run many
  realizations (new optional `runs` field): each figure of merit is then reported
  as a mean with a 5th–95th-percentile spread, and the chart shades the 5–95%
  error envelope around the median for each clock. A single run remains the default.
  New `clock-ensemble.toml` reference scenario.
- **Eccentric orbits and J2 drift.** The orbit type is now a full Keplerian orbit
  (semi-major axis, eccentricity, inclination, RAAN, argument of perigee, mean
  anomaly), propagated by solving Kepler's equation, with optional secular J2 nodal
  regression and apsidal precession. New optional `eccentricity`, `argp_deg`, and
  `j2` scenario fields, and an `orbit-molniya.toml` reference scenario (a 12 h
  highly-eccentric critically-inclined user). Circular orbits keep the original
  closed-form path bit-for-bit.
- The hybrid (combined-PNT) pack now reports **Integrity** and **Security**, so all
  four packs cover the full set of operational figures of merit. Integrity is the
  timing-channel protection-bound containment from a Kalman estimator disciplined to
  truth while GNSS is nominal and re-anchored (more loosely) at each optical re-sync;
  its bound includes the link's measurement-noise floor, so a clock far better than
  the link is scored against the delivered solution's actual noise. Security is the
  clock-aided spoof-detection score against the timing spec.

### Changed
- Release notes are now generated from the curated CHANGELOG section for the tag
  (`scripts/changelog-extract.sh`), so each GitHub release highlights what changed
  instead of listing raw commits.

## [0.3.0] - 2026-06-02

### Added
- **Security** figure of merit (previously unpopulated): a clock-aided
  spoof-detection score for the clock-holdover and orbit packs. It models an
  integrity monitor that cross-checks GNSS-derived time against the clock's own
  coasted prediction over a coherent window; the detection floor combines the
  averaged measurement noise with the clock's coast uncertainty, so a quieter
  clock detects smaller, slower time-spoofs. The score is reported in `[0, 1]`
  relative to the timing spec, completing the six operational figures of merit.
- Geometry-derived **position accuracy** for the orbit pack: from the
  line-of-sight geometry to the visible satellites it forms the design matrix
  and its covariance factor `Q = (HᵀH)⁻¹`, yielding the dilution-of-precision
  factors (GDOP/PDOP/HDOP/VDOP/TDOP). Position accuracy is the position DOP
  scaled by a configurable user-equivalent range error (new optional
  `sigma_uere_m` scenario field). An orbit result now carries a geometry summary
  (fraction of samples with a fix, best and median PDOP and position sigma).
- An in-browser **playground** (`web/`) that runs the engine client-side as
  WebAssembly: pick a reference scenario or edit the TOML, run it, and see the
  summary, chart, and full JSON, with nothing uploaded. A `pages` workflow
  builds and publishes it to GitHub Pages, and a new `summary` WebAssembly export
  backs the readout.
- Labelled y-axes on the SVG charts: gridlines, numeric tick labels, and a units
  axis title (via a shared `chart` helper), so magnitudes are readable.
- Package-publishing workflow (`publish`) for crates.io, PyPI, and npm, each
  gated on its registry token and triggered by a published release.

## [0.2.0] - 2026-06-02

### Added
- Flicker (1/f) FM floor for the clock error model, synthesised as a sum of
  log-spaced Ornstein-Uhlenbeck processes and calibrated so the flat
  Allan-deviation floor sits at a configurable level. Off by default; enabled
  per clock via the optional `flicker_floor` scenario field.
- Gyro channel for the inertial model: residual gyro bias and angular random
  walk drive an attitude (tilt) error that couples gravity into a horizontal
  specific-force error, the dominant strapdown error-growth mechanism. Off by
  default; enabled per sensor via the optional `gyro_bias` and `q_arw` fields.
- Two-state (phase, frequency) Kalman clock estimator with exact van Loan
  process-noise discretisation. Coasting from a known state reproduces the
  analytic holdover error growth (`q_wf*T + q_rw*T^3/3`) exactly, and the filter
  additionally yields an online 1-sigma uncertainty bound.
- The clock run now reports the **Integrity** figure of merit (previously
  unpopulated): the fraction of outage samples whose error stays inside the
  filter's 3-sigma protection bound, surfaced in the JSON result and CLI summary.
- Geometry-derived GNSS availability: circular-orbit propagation, a Walker-delta
  constellation generator, and line-of-sight visibility (Earth-occultation plus
  elevation mask) produce the availability timeline from real orbital geometry.
  New `orbit` scenario kind and the `orbit-gnss-challenged.toml` reference
  scenario (a spacecraft inside the GNSS shell with intermittent coverage).
- Optional Python extension (PyO3, abi3) exposing `run`, `run_full`, and
  `version`, packaged with maturin (`pyproject.toml`) and built for Linux, macOS,
  and Windows by a release-tag `wheels` workflow. The binding is a feature-gated,
  optional dependency: the default build, tests, and dependency-audit gate are
  unaffected.
- Optional WebAssembly module (wasm-bindgen) exposing `run`, `chart_svg`, and
  `version`, built with wasm-pack under the `wasm` feature; `getrandom` is
  target-gated to use the browser entropy source on `wasm32`.
- Shared `api::run_toml` dispatch used by the CLI and both bindings, so the
  command line and the bindings cannot drift.

### Changed
- Holdover scoring is now segment-aware: outage timelines are split into
  contiguous segments at GNSS re-acquisition, and the reported holdover is the
  worst-case (shortest) coast across them. Single-outage scenarios are
  unchanged. Applies to the clock, inertial, and hybrid scorers.
- The inertial model's reported `kind` is now `inertial` (was `accelerometer`),
  reflecting the combined accelerometer and gyro channels.

## [0.1.0] - 2026-06-01

Initial release.

### Added
- **Deterministic simulation engine** for hybrid quantum/classical PNT: a common
  error-model interface, declarative GNSS-availability scenarios, holdover /
  dead-reckoning estimators, and figure-of-merit scoring against the standard
  operational PNT criteria. Results are reproducible from `scenario + seed + engine
  version` (versioned, self-describing JSON with a scenario hash) and rendered as SVG
  charts. The CLI dispatches scenarios by `kind`.
- **Four sensor packs**, each calibrated to published data and validated against the
  standard relation:
  - **Clock holdover** — white FM, random-walk FM, and linear aging; validated by
    overlapping Allan deviation (Riley, NIST SP 1065). Chip-scale atomic clock vs
    strontium optical lattice clock.
  - **Inertial dead-reckoning** — residual bias + velocity random walk, double
    integrated to position error; validated against Groves' error-growth relations.
    Cold-atom vs navigation-grade accelerometer.
  - **Time transfer** — optical vs RF link timing jitter → synchronization precision →
    one-way ranging.
  - **Hybrid fusion (capstone)** — a combined PNT suite that must hold both timing and
    position, with optional optical inter-satellite time-transfer clock-aiding.
- **One cited reference scenario per pack** under `scenarios/`, every numeric
  parameter carrying a peer-reviewed `provenance`.
- **Reproducibility and repository-hygiene guards**; CI (format, clippy, tests,
  guards, MSRV) and a tag-gated release pipeline that re-runs all checks.
- **Documentation**: README with architecture diagrams, validation-status report,
  contributing guide, security policy, and code of conduct; Apache-2.0 license;
  issue/PR templates and Dependabot configuration.
- Vendor-neutral throughout; peer-reviewed scientific and metrology citations retained.
- Apache-2.0 license hygiene: SPDX headers on all sources, a `NOTICE` with trademark
  notice, Developer Certificate of Origin (DCO) sign-off for contributions, and
  `cargo-deny` enforcement of dependency licenses/advisories in CI.
- Open-core positioning (README): a free Apache-2.0 engine plus available commercial
  support, integration, and proprietary extensions from Ashforde OÜ — sustained by
  services, not license fees.
- `CITATION.cff` so the software can be cited.

[Unreleased]: https://github.com/AshfordeOU/kshana/compare/v0.30.0...HEAD
[0.30.0]: https://github.com/AshfordeOU/kshana/compare/v0.29.3...v0.30.0
[0.29.2]: https://github.com/AshfordeOU/kshana/compare/v0.29.1...v0.29.2
[0.29.1]: https://github.com/AshfordeOU/kshana/compare/v0.29.0...v0.29.1
[0.29.0]: https://github.com/AshfordeOU/kshana/compare/v0.28.0...v0.29.0
[0.28.0]: https://github.com/AshfordeOU/kshana/compare/v0.27.4...v0.28.0
[0.27.4]: https://github.com/AshfordeOU/kshana/compare/v0.27.3...v0.27.4
[0.27.3]: https://github.com/AshfordeOU/kshana/compare/v0.27.2...v0.27.3
[0.27.2]: https://github.com/AshfordeOU/kshana/compare/v0.27.1...v0.27.2
[0.27.1]: https://github.com/AshfordeOU/kshana/compare/v0.27.0...v0.27.1
[0.27.0]: https://github.com/AshfordeOU/kshana/compare/v0.26.0...v0.27.0
[0.26.0]: https://github.com/AshfordeOU/kshana/compare/v0.25.0...v0.26.0
[0.25.0]: https://github.com/AshfordeOU/kshana/compare/v0.24.0...v0.25.0
[0.24.0]: https://github.com/AshfordeOU/kshana/compare/v0.23.0...v0.24.0
[0.23.0]: https://github.com/AshfordeOU/kshana/compare/v0.22.1...v0.23.0
[0.22.1]: https://github.com/AshfordeOU/kshana/compare/v0.22.0...v0.22.1
[0.22.0]: https://github.com/AshfordeOU/kshana/compare/v0.21.0...v0.22.0
[0.21.0]: https://github.com/AshfordeOU/kshana/compare/v0.20.0...v0.21.0
[0.20.0]: https://github.com/AshfordeOU/kshana/compare/v0.19.0...v0.20.0
[0.19.0]: https://github.com/AshfordeOU/kshana/compare/v0.18.0...v0.19.0
[0.18.0]: https://github.com/AshfordeOU/kshana/compare/v0.17.0...v0.18.0
[0.17.0]: https://github.com/AshfordeOU/kshana/compare/v0.16.0...v0.17.0
[0.16.0]: https://github.com/AshfordeOU/kshana/compare/v0.15.1...v0.16.0
[0.15.1]: https://github.com/AshfordeOU/kshana/compare/v0.15.0...v0.15.1
[0.15.0]: https://github.com/AshfordeOU/kshana/compare/v0.14.1...v0.15.0
[0.14.1]: https://github.com/AshfordeOU/kshana/compare/v0.14.0...v0.14.1
[0.14.0]: https://github.com/AshfordeOU/kshana/compare/v0.13.0...v0.14.0
[0.13.0]: https://github.com/AshfordeOU/kshana/compare/v0.12.0...v0.13.0
[0.12.0]: https://github.com/AshfordeOU/kshana/compare/v0.11.0...v0.12.0
[0.11.0]: https://github.com/AshfordeOU/kshana/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/AshfordeOU/kshana/compare/v0.9.2...v0.10.0
[0.9.2]: https://github.com/AshfordeOU/kshana/compare/v0.9.1...v0.9.2
[0.9.1]: https://github.com/AshfordeOU/kshana/compare/v0.9.0...v0.9.1
[0.9.0]: https://github.com/AshfordeOU/kshana/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/AshfordeOU/kshana/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/AshfordeOU/kshana/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/AshfordeOU/kshana/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/AshfordeOU/kshana/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/AshfordeOU/kshana/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/AshfordeOU/kshana/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/AshfordeOU/kshana/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/AshfordeOU/kshana/releases/tag/v0.1.0
