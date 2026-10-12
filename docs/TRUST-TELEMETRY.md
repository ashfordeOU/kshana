# GNSS trust as security telemetry

`kshana trust-telemetry` turns the per-epoch GNSS trust stream (score 0-100, band, reasons)
into signals an operations or security centre already ingests: Prometheus metrics, syslog
events in CEF or LEEF for a SIEM, and optionally OpenTelemetry. It reads the stream; it
never changes the trust assessment and transmits nothing but telemetry.

## Run it

```sh
# live stream on stdin -> /metrics on localhost:9464
kshana receiver-trust live <args> | kshana trust-telemetry

# replay a batch result (the score is the epoch's own for a vessel platform, absent otherwise)
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format leef

# SIEM over UDP, one event per band change
kshana trust-telemetry --input stream.jsonl --syslog-udp siem.example:514 --format cef --host ops-gw1
```

Input is the live JSON-lines schema v1.1 documented in `docs/MARITIME-TRUST.md`. Read:
`t_s`; `state` (`calibrating|nominal|degraded|untrusted`, the band); `score` (0-100 or
null); `time` (the epoch's time as stated); `gate` (`off|passed|withheld`); `position` (`lat_deg`, `lon_deg`, `height_m`, or null); reasons are the
monitors in `deductions`, then any further ones in `alarms`; from schema 1.3, `geometry`
(`status`, `hdop`, `pdop`, `n_used`) and each deduction's `class`. Other keys are ignored, since
the schema only grows by appended keys. A line that does not parse is counted in `kshana_trust_input_errors_total` and
skipped; scores outside 0-100 are rejected, not clamped, so a format change is noticed.
The only code that knows this format is `src/telemetry/sample.rs`.

`/metrics` is served without authentication and defaults to `127.0.0.1:9464`. Binding
elsewhere prints a warning; put it behind your own access control. The endpoint handles one
connection at a time with a 2 s read limit, so an idle client can delay a scrape by up to
that long; it is meant for one scraper, not for the open network.

## From Python, WebAssembly and MCP

The encoders are also available as text-in, text-out calls with no process, socket or clock:
Python `kshana.trust_telemetry(input, format, host="", input_kind="jsonl", expose_position=False,
syslog_all=False, unix_nano=0)`, the WebAssembly export `trust_telemetry(input, format, host,
input_kind, options_json)`, and the MCP tool `trust_telemetry` (plugin command
`/kshana-trust-telemetry`). `format` is `prometheus`, `cef`, `leef` or `otlp`; `input_kind` is
`jsonl` (the stream) or `result` (a batch result). They return the same text the command line
prints (`--print-metrics`, `--print-syslog`), with the same limits: syslog lines carry no
timestamp, `host` is at most 255 printable ASCII characters without spaces (refused otherwise,
here and on the command line), and a reply larger than the surface's limit (4 MiB on MCP) is
refused, because CEF and LEEF with `syslog_all` write one event per epoch. Nothing is sent,
served or written; the running exporters stay a process on the command line.

## Delivery never stalls the assessment

Syslog and OpenTelemetry delivery run on their own threads. The ingest loop only hands them
a message or a snapshot and never waits, so a dead, slow or non-reading collector cannot
back-pressure the live stream or freeze `/metrics`:

* every connect and write has a 2 s limit; a failed connection is dropped and reconnected
  lazily, with exponential backoff from 1 s up to 60 s;
* a message that cannot be delivered (collector down, write timed out, queue of 1024 full) is
  dropped and counted in `kshana_trust_syslog_send_failures_total`; alert on its rate;
* the OpenTelemetry exporter is handed a copy of the registry, so no lock is held during
  network I/O; if an export is still in flight the new snapshot is skipped (the next one
  carries the same cumulative totals).

At end of input the sender threads are given their remaining time limits to finish.

## Prometheus metrics

| Metric | Type | Labels | Meaning |
|---|---|---|---|
| `kshana_build_info` | gauge | `version` | constant 1 |
| `kshana_trust_score` | gauge | | latest score 0-100; absent if the source gives none |
| `kshana_trust_band` | gauge | `band` | 1 for the current band, 0 for the others |
| `kshana_trust_gate` | gauge | `gate` | `off`, `passed`, `withheld`, `unknown`: 1 for the current state, 0 for the others; absent without a gate |
| `kshana_trust_position_latitude_degrees`, `..._longitude_degrees`, `..._height_meters` | gauge | | receiver-reported position; **only with `--expose-position`** (the endpoint is unauthenticated and a position can identify a site or vessel) |
| `kshana_trust_reason_active` | gauge | `reason` | 1 if present at the latest epoch |
| `kshana_trust_epochs_total` | counter | `band` | epochs received |
| `kshana_trust_reason_epochs_total` | counter | `reason` | epochs in which the reason was present |
| `kshana_trust_input_errors_total` | counter | | unparsable input lines |
| `kshana_trust_reason_overflow_total` | counter | | reason occurrences folded into `reason="other"` (see below) |
| `kshana_trust_syslog_send_failures_total` | counter | | syslog events not delivered |
| `kshana_trust_epoch_offset_seconds` | gauge | | latest epoch's offset from stream start |
| `kshana_trust_last_sample_timestamp_seconds` | gauge | | wall-clock receipt time; alert on its age |
| `kshana_trust_geometry` | gauge | `status` | satellite geometry at the latest epoch, `good`, `degraded`, `unknown`: 1 for the current one *(schema 1.3 inputs)* |
| `kshana_trust_geometry_degraded` | gauge | | 1 degraded, 0 good; absent when the geometry is unknown *(1.3)* |
| `kshana_trust_geometry_signal_loss` | gauge | | 1 when satellites in view are not tracked while their geometry is good (the signal was lost, not the sky; `geometry_degraded` still reads 1), else 0; absent when the geometry is unknown or the input does not say *(1.3)* |
| `kshana_trust_geometry_hdop`, `..._pdop`, `..._used_satellites` | gauge | | HDOP, PDOP and satellites used at the latest epoch; each absent when none *(1.3)* |
| `kshana_trust_geometry_epochs_total` | counter | `status` | epochs by geometry status *(1.3)* |
| `kshana_trust_geometry_label` | gauge | `label` | geometry label at the latest epoch, `good`, `fair`, `poor`, `unknown`: 1 for the current one; never scored (the score deducts only for `poor`); from inputs that carry the label (0.36) |
| `kshana_trust_geometry_vdop` | gauge | | VDOP at the latest epoch; absent when none *(0.36)* |

From schema 1.3 inputs `kshana_trust_reason_active` also carries a `class` label (`geometry`,
`environment`, `inconsistency`) on each reason that came with one: the deduction's class at the
latest epoch. The geometry series come after all the others and only once an input epoch carries
`geometry` (live schema 1.3, a result from engine 0.36 or later), so a 0.35 stream or result renders
byte for byte as before. Label values are fixed sets (an unknown status reads `unknown`; an unknown
class is dropped). Alert on `kshana_trust_reason_active{class="inconsistency"}` rather than on the
band alone, so a poor sky does not page as an attack; a `geometry` class is a statement about the
sky, not a finding that no attack occurred (see `docs/RECEIVER-TRUST.md`).

The `class` label is part of a series' identity: when a reason's class changes between epochs
(`loss-of-lock` from `environment` to `geometry` when the satellites lost were low, or `geometry`
to `inconsistency` when the stated HDOP disagrees with the stated sky), the old series is no longer
exported and a new one starts. Query by `reason` with `max by (reason)` when the class does not
matter, and expect such a flip to look like one series ending and another beginning. The schema 1.3
series, the `class` label and the CEF/LEEF geometry fields are checked by the engine's own tests and
by the CEF oracles (pycef, Logstash); the external Prometheus and OTLP oracles have no 1.3 stream yet.

Reason names are cut to 128 characters, and at most 64 distinct reasons get their own series; later ones are counted under `reason="other"` and in `kshana_trust_reason_overflow_total`, so a hostile or buggy input cannot create unbounded label cardinality.

`band` is one of `calibrating`, `nominal`, `degraded`, `untrusted`, `unknown`. Reason
names are the monitor names of the stream (`kinematic`, `heading-course`, ...; for the batch
result, `cn0-drop`, `agc`, `raim`).

A sample dashboard is in `deploy/grafana/kshana-gnss-trust.json` (import it and pick your
Prometheus data source).

## Syslog: CEF and LEEF

Events are sent in an RFC 5424 envelope (facility local0, app `kshana`, message id
`GNSSTRUST`) over UDP (one datagram each; IPv4 or IPv6) or TCP, newline-terminated by
default or, with `--syslog-octet-counting`, framed `<length> <message>` as in RFC 6587. By default one event
is sent per band change; `--syslog-all` sends one per epoch. The vendor is written
`Ashforde OU` (ASCII) so no SIEM mis-decodes it.

| Concept | Syslog severity | CEF severity | LEEF `sev` |
|---|---|---|---|
| calibrating | 6 info | 0 | 1 |
| nominal | 6 info | 1 | 1 |
| degraded | 4 warning | 5 | 5 |
| untrusted | 2 critical | 9 | 9 |
| unknown | 5 notice | 3 | 3 |

Field mapping (event id is `gnss-trust.<band>`):

| Meaning | CEF | LEEF 2.0 (delimiter `^`) |
|---|---|---|
| category | `cat=gnss-trust` | `cat` |
| sending host | `dvchost` | `devHost` |
| band | `cs1` (label `band`) | `band` |
| reasons, comma-separated | `cs2` (`reasons`) | `reasons` |
| previous band | `cs3` (`previousBand`) | `previousBand` |
| score | `cfp1` (`trustScore`), omitted if none | `trustScore` |
| epoch offset, s | `cfp2` (`epochOffsetSeconds`) | `epochOffsetSeconds` |
| log time label | `cs4` (`logTime`) | `logTime` |
| gate state | `cs5` (`gate`) | `gate` |
| geometry status, then `;` and the classes of the epoch's deductions, comma-separated (for example `degraded;environment,geometry`) *(1.3 inputs)*; from inputs that carry the label (0.36) a third field, `;` and the label, the classes field then always present (for example `degraded;;poor`, `good;;fair`) | `cs6` (`geometry`) | `geoStatus` (status only), `geoClass` (classes) and `geoLabel` (label) |
| HDOP *(1.3)* | `cfp3` (`geometryHdop`) | `geoHdop` |
| PDOP *(1.3)* | `cfp4` (`geometryPdop`) | `geoPdop` *(0.36, with the label)* |
| VDOP *(0.36, with the label)* | not carried: the four floating-point custom fields are taken | `geoVdop` |
| satellites used *(0.36, with the label)* | `cn1` (`geometryUsedSatellites`), an integer | `geoUsed` |
| signal loss: satellites in view not tracked while their geometry is good *(1.3)* | not carried as a field (no CEF dictionary key is free for it): the status reads `degraded` and the geometry deduction's class `environment` in `cs6` | `geoSignalLoss=1`, only while it holds |

In CEF the geometry uses dictionary custom fields only (no invented keys); the label rides in
`cs6` rather than `flexString1` because the Logstash CEF codec does not map the `flexString`
fields. The 1.3 geometry events, the label cases included, are part of the VALIDATED CEF row:
both oracle parsers read them back as written (`tests/cef_reference.rs`, amendments 4 and 5,
each registered before either parser was run on its cases). The label, VDOP and satellite-count
fields are appended after every earlier field and series, and only for inputs that carry the
label, so an input without one renders exactly as before.

Empty fields are left out (no `cs2=` without reasons). The host name is cut to 255
characters. CEF header values escape `\` and `|`; extension values escape `\`, `=` and line breaks.
LEEF values have `^` and line breaks replaced by spaces.

## OpenTelemetry (off by default)

Build with `--features otlp` and pass `--otlp http://host:4318/v1/metrics`. The exporter
posts OTLP/HTTP JSON (`kshana.trust.score`, `kshana.trust.band`, `kshana.trust.epochs`,
`kshana.trust.reason.epochs`, and for schema 1.3 inputs `kshana.geometry.status`,
`kshana.geometry.degraded`, `kshana.geometry.signal_loss`, `kshana.geometry.hdop`, `kshana.geometry.pdop`,
`kshana.geometry.used_satellites` and, from inputs that carry the label (0.36),
`kshana.geometry.label` (attribute `label`) and `kshana.geometry.vdop`; the cumulative sums carry `startTimeUnixNano`) every `--otlp-every` epochs (default 10) and at end of
input. It adds no dependency and has no TLS: send to a collector on the same host or a
trusted segment, which forwards onwards over TLS. `https://` endpoints are refused.
