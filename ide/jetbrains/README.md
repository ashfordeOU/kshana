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
- A bottom **Kshana** tool window hosting the run console.
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
  KshanaConfigurable.kt   Settings → Tools → Kshana
src/main/resources/META-INF/plugin.xml   plugin descriptor
src/test/kotlin/.../KshanaCliTest.kt      unit tests
```

## Isolation

Like `mcp/` and `xval/`, this is a standalone Gradle project, excluded from the published
`kshana` crate (`/ide` in the package `exclude`); its build output is gitignored.

License: Apache-2.0.
