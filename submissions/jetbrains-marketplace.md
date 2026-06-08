# JetBrains Marketplace — one-click publish kit

Pre-built submission to publish the **Kshana** IDE plugin (`ide/jetbrains/`) to the
JetBrains Marketplace. Founder-performed (needs a JetBrains account + Marketplace vendor).

## 0. Build the distributable

```sh
cd ide/jetbrains
./gradlew buildPlugin      # → build/distributions/kshana-jetbrains-0.1.0.zip
./gradlew verifyPlugin     # compatibility check across target IDEs (recommended pre-submit)
```

## 1. Create the Marketplace listing (first time)

1. Sign in at <https://plugins.jetbrains.com> with the founder JetBrains account.
2. **Upload plugin** → upload `build/distributions/kshana-jetbrains-0.1.0.zip`.
3. The plugin id `dev.kshana.ide`, name "Kshana — PNT simulator", vendor, description,
   and compatibility range are read from `META-INF/plugin.xml` — no re-entry needed.
4. Pick a category (e.g. **Tools Integration** / **Scientific**), add the kshana.dev URL,
   and submit for moderation (first upload is reviewed by JetBrains, ~1–2 business days).

## 2. Automated releases (optional, after the listing exists)

Get a Marketplace **permanent token** (Profile → My Tokens) and publish from CI/CLI:

```sh
cd ide/jetbrains
PUBLISH_TOKEN=<marketplace-token> ./gradlew publishPlugin
```

(The `publishPlugin` task is provided by the IntelliJ Platform Gradle Plugin; wire the
token via the `intellijPlatform.publishing` block / env var when automating.)

## Listing copy (reuse)

**Tagline:** Run the validated Kshana PNT-resilience simulator from your IDE.

**Description:** Right-click any scenario `.toml` → **Run Kshana Scenario**; figures of
merit and result JSON stream into the Kshana tool window. Scenarios cover SGP4/SDP4
orbits, IAU reference frames (cross-validated vs SPICE), Allan deviations (NIST SP1065),
GNSS availability/DOP, ARAIM/DO-229E protection levels, GNSS/INS fusion, and
quantum-sensor models — each validated against published references. Install the engine
with `cargo install kshana`; set its path in Settings → Tools → Kshana. Works in every
JetBrains IDE (2024.3+). See https://kshana.dev.

## Note

This is the *human* point-and-click path. For the *AI Assistant* path inside JetBrains,
the `kshana-mcp` MCP server (see `submissions/mcp-registry.md`) plugs into JetBrains AI
Assistant / Junie with no plugin needed.
