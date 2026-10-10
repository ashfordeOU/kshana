# Kshana for JetBrains IDEs

> **Install:** [**Kshana — PNT simulator** on the JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator)
> — or, in any JetBrains IDE, *Settings → Plugins → Marketplace → search "Kshana"*.

A native plugin that runs the **Kshana** PNT-resilience simulator from inside any
JetBrains IDE (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Right-click a scenario
`.toml` → **Run Kshana Scenario**; the figures of merit and result JSON stream into the
**Kshana** tool window.

Complements the [MCP server](../../mcp/kshana-mcp/) (which gives JetBrains *AI Assistant*
access to Kshana): this plugin is the *human*, point-and-click path.

## What it does

- **Run Kshana Scenario** action on any `.toml` (editor + project-view context menus) —
  runs `kshana <file>` and shows the output in the Kshana tool window.
- **Assess Receiver Trust** on a `receiver-trust` scenario `.toml` (`kshana receiver-trust`):
  the trust timeline, with a 0-100 score and reasons for a vessel. Advisory only.
- **Generate Training NMEA** on a `nmea-scenario` `.toml` (`kshana nmea-scenario`): synthetic
  bridge NMEA and an instructor log, written next to the scenario. Text only; for training,
  never for a vessel's live navigation systems.
- **Build Interference Map** on an ADS-B or AIS `.csv` (project view; asks which approved
  dataset it is) and **Route Exposure** on a route file (asks for the folder of maps).
  A degraded cell does not identify interference as the cause; not a forecast.
- **Export Test-Bench Files** on a scenario `.toml` (`kshana bench-export`): vehicle motion, NMEA
  and labelled events for a laboratory GNSS simulator, written next to the scenario. It writes
  no signal; run a simulator only where authorised.
- **Build Compliance Report** on a run result `.json` (`kshana compliance-report`) and
  **Tools → Show Compliance Mapping** (`kshana compliance-report --mapping`): the public-framework
  mapping, shown with the engine's own statement word for word.
- **Verify Evidence Pack** on an evidence-pack folder (project view; `kshana evidence verify`):
  asks for the signer's public key (64 hex digits or a `.pub` file; always pinned, the plugin never
  accepts an unpinned signer) and optionally the full session log. Only a verified result reads as
  verified; an intact pack with an unpinned signer reads "NOT VERIFIED".
- **Insert Example Scenario** (project view folder or Tools menu; `kshana example`): pick a bundled
  scenario and it is written as a new `.toml` (never over a file). **Export Scenario** on a `.toml`
  (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; simulated output only), **Animate Scenario** (HTML
  or SVG, opened in the browser) and **Import Route** on a route `.geojson` (asks which scenario).
- **Create Evidence Pack** on a receiver-trust session `.toml` (`kshana receiver-trust evidence`): asks
  the window, a signing key file you already have, and the output folder. The plugin never makes,
  reads or stores a key (`kshana evidence keygen` stays on the command line). **Attach Timestamp** on a
  pack folder (`kshana evidence attach-timestamp`): Kshana does not check the timestamp authority's
  signature; run `openssl ts -verify` yourself.
- Still on the command line only: the IQ commands, `evidence keygen` and `receiver-trust live`.
- A bottom **Kshana** tool window hosting the run console.
- Not in the plugin: `kshana receiver-trust live` (a long-running stream process with a gate
  and an optional TCP listener) stays on the command line, because an IDE action runs a
  command to completion and shows its output; see `docs/MARITIME-TRUST.md`.
- **Settings → Tools → Kshana** to point at the `kshana` binary (blank → resolved from
  `PATH`; install with `cargo install kshana`).

The plugin is pure-platform (no language-specific dependencies), so it loads in every
JetBrains IDE on build 243 (2024.3) and newer.

## Build & run

Requires JDK 17+ (the build pins JDK 21) and the bundled Gradle wrapper.

```sh
cd ide/jetbrains
./gradlew test          # unit tests (pure CLI helpers)
./gradlew buildPlugin    # assembles build/distributions/kshana-jetbrains-<version>.zip
./gradlew runIde         # launches a sandbox IDE with the plugin loaded
./gradlew verifyPlugin   # JetBrains plugin-verifier compatibility check (downloads IDEs)
```

Install the built zip via **Settings → Plugins → ⚙ → Install Plugin from Disk…**.

## Layout

```
build.gradle.kts / settings.gradle.kts / gradle.properties   build config (IntelliJ Platform Gradle Plugin 2.x)
src/main/kotlin/dev/kshana/ide/
  KshanaCli.kt            pure binary-resolution + command helpers (unit-tested)
  KshanaSettings.kt       persisted binary-path setting (app service)
  KshanaConsole.kt        per-project output console (project service)
  KshanaToolWindowFactory.kt   the "Kshana" tool window
  RunScenarioAction.kt    the Run-scenario action
  KshanaRunner.kt         runs one command in the background into the tool window
  MarineActions.kt        receiver trust, training NMEA, interference map, route exposure
  KshanaConfigurable.kt   Settings → Tools → Kshana
src/main/resources/META-INF/plugin.xml   plugin descriptor
src/test/kotlin/.../KshanaCliTest.kt      unit tests
```

## Isolation

Like `mcp/` and `xval/`, this is a standalone Gradle project, excluded from the published
`kshana` crate (`/ide` in the package `exclude`); its build output is gitignored.

License: AGPL-3.0-only (or a commercial licence from Ashforde OÜ — see the
repository's `LICENSING.md`).
