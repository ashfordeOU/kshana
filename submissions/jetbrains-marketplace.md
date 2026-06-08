# JetBrains Marketplace — publish + auto-update kit

How to publish the **Kshana** IDE plugin (`ide/jetbrains/`) and keep it updated on every
release. The CI is already wired (`.github/workflows/jetbrains-plugin.yml`, job `publish`);
the founder does the one-time listing + token, then it is automatic.

The first upload of a *new* plugin **must be manual** (JetBrains moderates it and you set
the license, repository URL, and category once). After that, `publishPlugin` from CI
handles every update.

## 0. Build the distributable

```sh
cd ide/jetbrains
./gradlew buildPlugin      # → build/distributions/kshana-jetbrains-<version>.zip
./gradlew verifyPlugin     # compatibility check across target IDEs (recommended pre-submit)
```

## 1. Create the Marketplace listing — first time, manual [FOUNDER]

1. Sign in at <https://plugins.jetbrains.com> with the founder JetBrains account.
2. **Upload plugin** → upload `build/distributions/kshana-jetbrains-0.1.0.zip`.
3. The plugin id `dev.kshana.ide`, name "Kshana - PNT simulator", vendor, description, and
   compatibility range come from `META-INF/plugin.xml` — no re-entry.
4. Pick a category (**Tools Integration** / **Scientific**), add `https://kshana.dev`, and
   submit for moderation (first upload is reviewed, typically ~1–2 business days).

## 2. Add the token so CI can auto-publish updates [FOUNDER]

1. <https://plugins.jetbrains.com> → profile → **My Tokens** → generate a **permanent
   token** (copy it once — it is shown only at creation).
2. Repo → Settings → Secrets and variables → Actions → **Secrets** → add
   `JETBRAINS_MARKETPLACE_TOKEN` = that token.

Done. On every `vX.Y.Z` tag the `publish` job stamps the plugin version from the tag and
runs `publishPlugin` (gated on that secret — inert until it exists; Marketplace rejects a
duplicate version, so a re-tag of the same version is a no-op-by-rejection). To publish a
specific version manually: Actions → **JetBrains plugin** → *Run workflow* → set `version`.

## 3. (Optional) Developer signing — removes the "unsigned" install warning [FOUNDER]

Signing is **not required** (Marketplace signs every plugin itself), but a developer
signature makes the IDE show the plugin as author-verified instead of warning. To enable:

```sh
# generate an encrypted key + self-signed chain (keep private.pem + chain.crt safe)
openssl genpkey -aes-256-cbc -algorithm RSA -out private_encrypted.pem -pkeyopt rsa_keygen_bits:4096
openssl rsa -in private_encrypted.pem -out private.pem
openssl req -key private.pem -new -x509 -days 3650 -out chain.crt
```

Add three repo **Secrets** (the PEM values are multi-line → **Base64-encode** each first;
the Gradle task auto-decodes Base64):

| Secret | Value |
|---|---|
| `JETBRAINS_CERTIFICATE_CHAIN`     | `base64 -i chain.crt` |
| `JETBRAINS_PRIVATE_KEY`           | `base64 -i private_encrypted.pem` |
| `JETBRAINS_PRIVATE_KEY_PASSWORD`  | the passphrase used above |

When `JETBRAINS_CERTIFICATE_CHAIN` is present the workflow runs `signPlugin` before
`publishPlugin`; when absent it publishes with `-x signPlugin` (Marketplace-signed only).
`build.gradle.kts` already reads `CERTIFICATE_CHAIN` / `PRIVATE_KEY` / `PRIVATE_KEY_PASSWORD`
/ `PUBLISH_TOKEN` from the environment.

## Listing copy (reuse)

**Tagline:** Run the validated Kshana PNT-resilience simulator from your IDE.

**Description:** Right-click any scenario `.toml` → **Run Kshana Scenario**; figures of
merit and result JSON stream into the Kshana tool window. Scenarios cover SGP4/SDP4
orbits, IAU reference frames (cross-validated vs SPICE), Allan deviations (NIST SP1065),
GNSS availability/DOP, ARAIM/DO-229E protection levels, GNSS/INS fusion, and
quantum-sensor models — each validated against published references. Install the engine
with `cargo install kshana`; set its path in Settings → Tools → Kshana. Works in every
JetBrains IDE (2024.3+). See https://kshana.dev.

## Note — the human path vs the AI path

This is the *human* point-and-click plugin. The separate *AI-agent* path inside JetBrains
is the `kshana-mcp` MCP server (see `submissions/mcp-registry.md`), which plugs into
JetBrains AI Assistant / Junie with no plugin needed.
