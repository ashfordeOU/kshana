# Interference incidents: format, vocabulary and public case library

`kshana-interference-incidents/1` is an open format for GNSS interference incidents: what happened, how sure the
sources are, where (an area, never a point), when, who was affected (as a domain, never by name) and which public
sources say so. The same format carries the public case library in
[`data/interference-incidents/`](../data/interference-incidents/) and the observatory's daily detections
([`observatory/METHOD.md`](observatory/METHOD.md)). The JSON Schema is
[`kshana-interference-incidents-1.schema.json`](../data/interference-incidents/kshana-interference-incidents-1.schema.json);
`kshana interference-map incidents validate` applies it together with the cross-field rules below, which a JSON
Schema cannot express.

What the format is for: comparing reports that use different words for the same thing, keeping "confirmed" for
claims that have measurement behind them, and building labelled sets of public cases for testing detectors and
for loss and risk statistics. What it is not: a finding of cause. No field holds an actor, a purpose, an aircraft,
a vessel or a person, and the validator refuses unknown fields, so none can be added by accident.

## Commands

```text
kshana interference-map incidents validate data/interference-incidents/library.json --releases data/interference-incidents/RELEASES.json [--json]
kshana interference-map incidents release data/interference-incidents/library.json --out releases/
kshana interference-map incidents from-observatory products/observatory-adsb-adsb-lol-2026-09-15.incidents.json \
    --source-url https://example.org/observatory/2026-09-15 --out detections-2026-09-15.json
```

- `validate` prints `<file>: <n> records, valid` and exits 0, or lists each problem as `path: [rule] message` and
  exits 1. `--json` writes a `kshana-interference-incidents-check/1` report instead (machine file, English).
  `--releases` also checks the register of released versions (below).
- `release` writes `kshana-interference-incidents-<version>/` with `incidents.json` (keys sorted),
  `incidents.csv` (one row per record), the JSON Schema, `.zenodo.json` (Zenodo deposit metadata) and
  `MANIFEST.json` (bytes and SHA-256 of each file, and the content hash of the library). It refuses an invalid
  library and never overwrites a release directory. Uploading to Zenodo is a manual step; nothing here opens a
  network connection.
- `from-observatory` turns the observatory's `kshana-incident-report/1` file into `observatory_detection`
  records (below). `--source-url` is where the product is published, because every record cites an address.

Exit codes: 0 done, 1 the document has problems, 2 a usage or file error.

## Vocabulary (`kshana-interference-vocabulary/1`)

### Effect class: what the interference did, never who did it

| Class | Meaning |
|---|---|
| `jamming` | Radio energy in a GNSS band that drowns the signals: loss of fix, lower signal-to-noise, lower reported accuracy. |
| `spoofing` | Counterfeit GNSS signals that a receiver takes as genuine, so it reports a false position or time. |
| `meaconing` | Real GNSS signals recorded and rebroadcast with a delay; a form of false signal kept apart because receivers and authentication react to it differently. |
| `ais_manipulation` | A false position in AIS messages that does not come from the GNSS receiver (for example a transponder set to report somewhere else). Kept apart from spoofing, which acts on the receiver. |
| `interference_unspecified` | Interference is reported, but the sources do not separate jamming from false signals. Use this rather than picking one. |
| `degradation_unattributed` | Navigation accuracy was reported degraded; no interference class is asserted. Used by the observatory. Its confidence is always `undetermined`. |

**A class that differs from the source's own words needs a note.** `terms_in_source` keeps the source's words. If
the class is `jamming` and the words include "spoof…", or the class is `spoofing` and they include "jam…",
`class_note` must say why. Reports often call false signals "jamming"; the library's first record is such a case
and is coded `interference_unspecified` with the reason.

### Confidence: how strong the evidence is, not how sure the writer sounds

| Level | Needs `evidence_basis` to include | Meaning |
|---|---|---|
| `confirmed` | `rf_measurement` | A cited source reports a signal-level measurement: spectrum monitoring, received power or signal-to-noise at reference stations, recorded samples. |
| `probable` | `rf_measurement` or `position_report_analysis` | A cited analysis of position, accuracy or signal data (AIS, ADS-B, reference stations) shows the pattern, across several receivers. |
| `suspected` | anything | Reported by crews, operators, authorities or the press without a cited analysis. |
| `undetermined` | anything | Cited, but the class is not established. |

"Confirmed" in a headline is not `confirmed` here: an analyst's conclusion from AIS tracks is `probable`. This is
the distinction insurers and investigators ask for when they need to know what "confirmed interference" means.

Evidence bases: `rf_measurement`, `position_report_analysis`, `authority_statement`, `operator_statement`,
`crew_report`, `secondary_report` (a source reporting another source).

### Origin: technical categories only

`origin.category` is one of `unknown`, `authorised_test`, `equipment_fault`, `natural` (space weather),
`system_anomaly` (a constellation or augmentation fault). There is no category for a person, an organisation or a
purpose: attribution is outside this format, whatever the sources say. `origin.platform` (`ground`, `airborne`,
`maritime`, `space`, `unknown`) records where a source places the transmission when it says so, never a
position. Anything other than `unknown` needs an origin confidence above `undetermined`, with the same evidence
rule as the effect.

### Other lists

- `record_kind`: `event`, `period`, `statistic`, `study`, `observatory_detection`.
- `domains`: `aviation`, `maritime`, `land`, `timing`, `drone`, `space`, `satellite_terminal`, `reference_station`.
- `observed_effects`: `position_jump`, `loss_of_fix`, `accuracy_degraded`, `signal_to_noise_drop`,
  `implausible_motion`, `false_alert`, `station_detections`, `service_degraded`, `grounding`, `diversion`,
  `traffic_reduction`.
- Source `kind`: `official`, `primary_report`, `study`, `news`, `secondary`, `dataset`.
- Figure `qualifier`: `exact`, `about`, `at_least`, `at_most`; each figure names the source it comes from by index.

## Record fields and rules

```text
{ schema: "kshana-interference-incidents/1", library_version: "1.0.0", vocabulary: "kshana-interference-vocabulary/1",
  title, description, label: "REPORTED" | "MODELLED", licence, licence_url, attribution?, creators?,
  records: [ {
    id               KIC-NNNN (library) or KOBS-YYYY-MM-DD-NNN (observatory); unique, in id order
    record_kind, title, notes?
    time             { start, end, precision, basis? }   start/end: YYYY | YYYY-MM | YYYY-MM-DD | YYYY-MM-DDTHH:MMZ | null
    area             { description, bbox: {south, west, north, east} | null, bbox_basis? }
    domains[], observed_effects[], evidence_basis[]
    effect           { class, confidence, terms_in_source[], class_note? }
    origin           { category, platform, confidence, note? }
    figures[]        { quantity, value, qualifier, source }
    sources[]        { url (https), publisher, published, kind, retrieved? }   at least one
    label?           overrides the document's label
  } ] }
```

- **Time.** UTC. The start is written to the stated precision (a start to the minute also serves hour precision);
  `unknown` precision has no start; an end is not before its start.
- **Area, never a point.** A bounding box is optional; each side is at least 0.5 degrees. `bbox_basis` says who
  drew it: `editor_envelope` (the library's editors around a named area; not from the source), `source`, or
  `observatory_cells`. No coordinates of an emitter appear anywhere.
- **Neutral wording.** Titles, notes, area descriptions, time bases and figure names must not contain words that
  name or imply an actor, a military, an intent or a conflict (the list the emitter-region outputs are held to,
  whole words only). Source addresses are cited, not quoted.
- **Labels.** Library records are `REPORTED`: taken from the cited sources and graded by these rules; Kshana has
  not measured or verified them. Observatory records are `MODELLED`. A record from public sources cannot be
  `MODELLED` and an observatory record cannot be `REPORTED`.
- **Readers** of the format ignore fields they do not know, as for every Kshana format. The validator of this
  version refuses them, so a library cannot carry identifiers by accident.

## The public case library

[`data/interference-incidents/library.json`](../data/interference-incidents/library.json), version 1.0.0, 19
records (events, periods, statistics and studies from 2019 to November 2026), licensed CC BY 4.0. Each record cites
at least one https address; the addresses were opened on 2026-11-20 (`retrieved`), and the records state only what
those pages state. Many sources are secondary (a foundation's news digest quoting a press report); their records
say so in `kind: secondary` and are graded on the evidence the page describes.

The library includes the examples the vocabulary was made for: a grounding reported as "jamming" that describes
false signals (coded `interference_unspecified`), a source whose "confirms" is an AIS analysis (`probable`), a
national authority's statement that interference seen daily at cruising altitude is normal at ground level
(ground versus airborne separation), a multi-year count from one measuring station (`statistic`), a global AIS
study with its zone counts (`study`), and an event the study reproduced from public NOAA AIS data.

**Versions are immutable.** [`RELEASES.json`](../data/interference-incidents/RELEASES.json) lists each released
version with its content hash (SHA-256 of the canonical JSON: keys sorted, no whitespace).
`tests/interference_incidents.rs` fails if `library.json` differs from the registered content of its
`library_version`, so every change needs a new version and a new entry; old entries are never edited.

To add a case: give it the next `KIC-` id, cite at least one https address, grade it with the rules above, raise
`library_version`, add the release entry with the hash `validate --json` prints, and run `validate --releases`.

## Observatory detections

`from-observatory` makes one record per observatory incident (touching degraded cells of one UTC day): kind
`observatory_detection`, class `degradation_unattributed`, confidence `undetermined`, origin `unknown`, effect
`accuracy_degraded`, basis `position_report_analysis`, the incident's bounding box (`observatory_cells`, cells of
0.5 degrees or coarser), the cell count, and the report's data licence and attribution (ODbL 1.0 for adsb.lol).
The document is `MODELLED`. Nothing in it is more specific than the observatory product it comes from.

## Limits

- The library is a curated sample of public reports, not a census. Coverage follows what was reported in English
  and found by the editors; absence of a record says nothing about absence of interference.
- Grades are the editors' reading of the cited pages under the rules above. Pages can change after `retrieved`.
- Statistics from different sources use different definitions and are not comparable without their method.
- The format records effects and evidence. It cannot and does not establish cause.
