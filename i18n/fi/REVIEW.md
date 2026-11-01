# Review list for fi: engine catalogue (i18n/fi/engine.ftl)

The translation is machine-drafted and has not been reviewed by a native speaker; English is the reference. Items are ranked most important first.

## 1. Legal texts: native review required (17 messages, each marked `# legal: native review`)
Every negation and every "not" scope must match the English exactly.

- `engine-legal-compliance-statement`
- `engine-legal-bench-surface-notice`
- `engine-legal-iq-campaign-roc-statement`
- `engine-legal-lunanet-afs-advisory`
- `engine-legal-iqfit-statement`
- `engine-legal-iqfit-advisory`
- `engine-legal-lunar-time-lab-source-statement`
- `engine-legal-standards-pack-notice`
- `engine-legal-standards-pack-advisory`
- `engine-legal-geometry-statement`
- `engine-legal-resilience-disclaimer`
- `engine-legal-observatory-notice`
- `engine-legal-receiver-trust-advisory`
- `engine-legal-evidence-roundtrip-notice`
- `engine-legal-evidence-bundle-disclaimer`
- `engine-legal-bench-notice`
- `engine-legal-osnma-advisory`

## 2. Wording close to a claim about Kshana (check the meaning is still "not ...")

- `engine-mars-pnt-mars-pnt-user-clock-relays`: English "not a certified PL" is rendered "ei virallisesti hyväksytty PL", chosen to avoid the forbidden "certified" rendering.
- `engine-api-builtins-lunar-interop-export-ref-frame`: "conformance" is rendered "vastaavuus", a neutral word that is not a conformance claim.

## 3. Tier, verdict and status words

- Kept in English capitals everywhere: VALIDATED, MODELLED, PARTNER, MET, NOT MET, EXPLORATORY, PREDICTION, CORROBORATED, NOT CORROBORATED, REFUSED, DEGRADED, DEFICIENT, OBSERVED, LOST, MISMATCH, and the all-caps phrases VERIFIED, INTACT BUT THE SIGNER IS NOT PINNED, SPOOF DETECTED, CONSISTENT, INCONSISTENT.
- Capitalised or lowercase "Validated"/"Modelled"/"validated"/"degraded" in running prose are rendered as plain words, not as tier words: engine-cislunar-observability-cislunar-observability-refs-arc-epochs, engine-cislunar-observability-validated-each-constellation-initial-condition, engine-hybrid-integrity-hybrid-optical-rf-optical-footprint, engine-realtime-frame-eop-realtime-frame-eop-table-post, engine-verification-the-complete-machine-checked-evidence, engine-representativeness-modelled-simulation-only-claim-cannot, engine-advanced-report-not-modelled-note, engine-interference-map-cli-caveats-degraded-cell-does-not. The native reviewer should confirm each reads as ordinary prose and not as a status.
- Observatory banners keep "NOT OBSERVED" in English inside otherwise translated all-caps text: engine-interference-map-observatory-deg-cells-utc-day-not, engine-interference-map-observatory-degraded-not-degraded-not-observed.

## 4. Terms chosen without a glossary entry or that read awkwardly

- "siemenluku (seed)" (long), "holdout" kept as a loan, "reuna" for limb, "releet" for relays, "perturboitu", "moottori" for engine, "rakenne"/"suunnitelma" for design, "haku" for acquire
- engine-evidence-cli-timestamp-authority-signature-not-verified: "Kshana ei ole vahvistanut" avoids inflecting Kshana
- engine-advanced-report-th-used-by: "Käyttäjä" may read as a person; "estokorrelaatio" for denial correlation
- engine-geometry-chart-north/east/south/west left in English letters

## 5. Messages with variables of unknown form, layout and plural forms

- engine-evidence-verify-timestamp-token-states-its-imprint (and -2): `{ $v2 }` and `{ $v3 }` are verb-like values of unknown form; the grammar around them is a guess.
- engine-cislunar-arc-recovery-not-corroborated-as-recoverability-boundary: `{ $v1 }` is a pre-formatted comparison word of unknown form.
- engine-space-packet-space-packet-framed-ccsds-133, engine-geometry-element-sets-propagated-by-the (and -2): opaque variables.
- engine-leo-navmsg-tests-is-the-host-library and engine-e-interference-map-cli-dataset-custom-needs: the English is a truncated fragment, so the translation guesses the meaning.
- engine-osnma-cli-satellite-status-authenticated-failed-pending, engine-osnma-cli-epoch-tag-sub-frame-tx: table headers translated; column alignment with the data rows is approximate.
- Count messages (engine-counts.txt) with a plural selector: the variants and the selector categories need a native check; ids whose count variable is really a name or value carry identical variants or no selector.
- `engine-telemetry-syslog-cef-gnss-trust` is intentionally not translated (machine output).

