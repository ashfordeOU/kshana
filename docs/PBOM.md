# PNT Bill of Materials (PBOM)

`kshana pbom` writes, checks and compares a **PNT Bill of Materials**: a machine-readable list of
what a system's positioning, navigation and timing depend on. A software bill of materials lists
the code a product contains; a PBOM lists the PNT supply chain a system relies on: the
constellations and signals it tracks, its receivers, antennas and their firmware, its oscillators
and time references, augmentation and correction feeds, network time distribution, alternative
(GNSS-independent) sources, and the fallbacks that take over when something is lost.

A PBOM is an ordinary [CycloneDX](https://cyclonedx.org/) JSON document (`specVersion` 1.4 to
1.6; `generate` writes 1.5), so BOM tooling that reads CycloneDX reads it. The PNT meaning is
carried by CycloneDX `properties` in the `kshana:pbom:` namespace: the profile **`kshana.pbom/1`**.
It is proposed as a CycloneDX property profile; it is not part of the CycloneDX standard.

Why: operators of essential services are asked to identify single points of failure and supply
dependencies (for example the NIS2 implementing rules, Regulation (EU) 2024/2690). For PNT, the
smallest artefact that answers those questions is a list of the dependencies and how they back
each other up. A PBOM is that list, in a format that can be exchanged, checked and compared.

## Commands

| command | what it does |
|---|---|
| `kshana pbom generate <config.toml> [--out <file>]` | writes a PBOM from a configuration (`kshana.pbom-config/1`, below) |
| `kshana pbom generate <scenario.toml> [--out <file>]` | writes a **draft** PBOM from a kshana scenario (mapping below) |
| `kshana pbom validate <pbom.json>` | checks a PBOM and analyses its declared structure; JSON report; exit 2 when not valid |
| `kshana pbom diff <old.json> <new.json>` | elements added, removed and changed, and how each function's analysis changed |
| `kshana pbom schema` | prints the profile's JSON schema ([`data/pbom/kshana-pbom-1.schema.json`](../data/pbom/kshana-pbom-1.schema.json)) |

```sh
kshana pbom generate examples/pbom/substation-timing.toml --out site.pbom.json
kshana pbom validate site.pbom.json
kshana pbom diff examples/pbom/substation-timing.pbom.json examples/pbom/substation-timing-v2.pbom.json
```

## The profile

Every component carries one `kshana:pbom:role`:

| role | what it is | default CycloneDX `type` |
|---|---|---|
| `constellation-signal` | a navigation signal of a constellation (needs `constellation`, `signal` and a `provides`) | `data` |
| `receiver` | a GNSS or other PNT receiver | `device` |
| `antenna` | an antenna | `device` |
| `firmware` | receiver or clock firmware | `firmware` |
| `oscillator` | a clock in holdover (OCXO, rubidium, caesium, ...) | `device` |
| `time-reference` | a source of a time scale (needs `time-scale` and provides `time` or `frequency`) | `device` |
| `augmentation` | SBAS, GBAS and similar | `data` |
| `correction-feed` | an RTK, PPP or SSR correction service | `data` |
| `network-time` | NTP or PTP distribution | `data` |
| `alternative-source` | a GNSS-independent source (eLoran, LEO-PNT, inertial, vision, ...) | `device` |
| `fallback` | any other fallback arrangement (needs a `fallback-for`) | `device` |

Properties (all values are strings, as CycloneDX requires):

| property | where | meaning |
|---|---|---|
| `kshana:pbom:profile` | `metadata.properties` | `kshana.pbom/1` (required) |
| `kshana:pbom:source` | `metadata.properties` | how the document was made (optional) |
| `kshana:pbom:role` | component | the role (required, once) |
| `kshana:pbom:provides` | component | a function the element itself supplies: `position`, `velocity`, `time`, `frequency` (repeatable) |
| `kshana:pbom:any-of` | component, `metadata.component` | a `dependsOn` reference that is one of several alternatives (repeatable) |
| `kshana:pbom:fallback-for` | component | a reference this element takes over from (repeatable) |
| `kshana:pbom:constellation` | component | GPS, Galileo, GLONASS, BeiDou, QZSS, NavIC, SBAS, GNSS, LEO, eLoran or other |
| `kshana:pbom:signal` | component | for example `L1 C/A`, `E1 OS`, `L5` |
| `kshana:pbom:time-scale` | component | for example `UTC`, `UTC(k)`, `GPST`, `TAI` |
| `kshana:pbom:holdover-s` | component | the stated holdover, seconds |
| `kshana:pbom:authenticated` | component | `true` when the source is cryptographically authenticated (for example Galileo OSNMA) |
| `kshana:pbom:gnss-independent` | component | `true` when the element works without any GNSS |
| `kshana:pbom:endpoint` | component | where a feed or a time service is reached |
| `kshana:pbom:jurisdiction` | component | the country or region whose operator controls the element |

The CycloneDX `dependencies` graph says what each element needs. Every `dependsOn` entry is
required unless the element also names it with `kshana:pbom:any-of`; those entries are
alternatives, and one of them is enough (a receiver that tracks GPS L1 C/A and Galileo E1 needs
either). `kshana:pbom:fallback-for` says an element takes over when another is lost (an OCXO for a
GNSS receiver, a fibre time link for a grandmaster). The system itself is `metadata.component`.

The JSON schema checks the profile layer (property names and values, the profile marker, a role on
every component). The rules that need the whole document are checked by `validate`: references
resolve, each `bom-ref` is unique, `any-of` entries are in `dependsOn`, the role-specific fields
are present, and the dependency and fallback graph has no cycle. Generated documents also validate
against the CycloneDX 1.5 schema.

## What `validate` reports

`valid`, the `errors` and `warnings` (each with a path in the document) and, for a valid document,
an `analysis` of the declared structure:

- elements per role, constellations, receiver suppliers (and receivers with none stated),
  jurisdictions;
- per function that some element provides: whether the system reaches a working provider, the
  providers it reaches, the **single points of failure** (the elements whose loss alone cuts the
  function), whether the function **survives the loss of every GNSS signal and augmentation**
  (with the providers left and their stated holdover), and whether an authenticated provider is
  reached.

A fallback with a finite holdover counts as keeping a function: the report lists the providers
left after a GNSS loss with their stated `holdover-s`, so the time limit is in front of the reader.

**Evidence: MODELLED.** The analysis is of what the document declares, not of the system. It does
not test any element, it does not check that a stated holdover or authentication is real, and a
PBOM that leaves a dependency out gives an analysis that leaves it out too.

## Configuration (`kshana.pbom-config/1`)

A TOML file with the system's name and its elements; [`examples/pbom/substation-timing.toml`](../examples/pbom/substation-timing.toml)
is a complete one. Top-level keys: `pbom = "kshana.pbom-config/1"`, `system`, and optionally
`system_version`, `system_type`, `supplier`, `timestamp`, `depends_on`, `any_of`. Each
`[[element]]` has `id`, `role`, `name`, and optionally `type`, `version`, `supplier`,
`description`, `depends_on`, `any_of`, `fallback_for`, `provides`, `constellation`, `signal`,
`time_scale`, `holdover_s`, `authenticated`, `gnss_independent`, `endpoint`, `jurisdiction`.

The output is reproducible: no timestamp unless the configuration gives one, and the
`serialNumber` is a UUID (version 8) made from the SHA-256 of the content.

## Draft from a scenario

Given a kshana scenario instead of a configuration, `generate` maps the scenario's top-level
tables: `gnss` becomes a GNSS signal element (constellation `GNSS`, signal `unspecified`) and a
receiver; `clock*` and `holdover` become oscillators and `imu*`, `accel*` and `ins*` become
alternative sources, each a fallback for the receiver. Every other table is named in
`kshana:pbom:source` as not mapped. A scenario does not say which constellations, receivers or
suppliers a real system uses, so this is a starting point to complete by hand.

## Examples

- [`examples/pbom/substation-timing.toml`](../examples/pbom/substation-timing.toml) and its
  output [`substation-timing.pbom.json`](../examples/pbom/substation-timing.pbom.json): an
  illustrative substation time server (GPS and Galileo with OSNMA, OCXO holdover, PTP
  distribution). Time and frequency have two single points of failure: the PTP distribution and
  the grandmaster.
- [`examples/pbom/substation-timing-v2.toml`](../examples/pbom/substation-timing-v2.toml): the
  same system with a fibre time link added as a fallback for the grandmaster; `diff` reports the
  grandmaster as a resolved single point of failure.

The names in the examples are generic; they describe no real product or supplier.

Tests: `tests/pbom.rs`.
