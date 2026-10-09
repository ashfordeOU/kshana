# GNSS trust as security telemetry

`kshana trust-telemetry` turns the per-epoch GNSS trust stream (score 0-100, band, reasons)
into signals an operations or security centre already ingests: Prometheus metrics, syslog
events in CEF or LEEF for a SIEM, and optionally OpenTelemetry. It reads the stream; it
never changes the trust assessment and transmits nothing but telemetry.

## Run it

```sh
# live stream on stdin -> /metrics on localhost:9464
kshana receiver-trust live <args> | kshana trust-telemetry

# replay a batch result (no score: the batch result has a state, not a number)
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format leef

# SIEM over UDP, one event per band change
kshana trust-telemetry --input stream.jsonl --syslog-udp siem.example:514 --format cef --host ops-gw1
```

Input is the live JSON-lines schema v1 documented in `docs/MARITIME-TRUST.md`. Read:
`t_s`; `state` (`calibrating|nominal|degraded|untrusted`, the band); `score` (0-100 or
null); `time` (the epoch's time as stated); `gate` (`off|passed|withheld`); reasons are the
monitors in `deductions`, then any further ones in `alarms`. Other keys are ignored, since
the schema only grows by appended keys. A line that does not parse is counted in `kshana_trust_input_errors_total` and
skipped; scores outside 0-100 are rejected, not clamped, so a format change is noticed.
The only code that knows this format is `src/telemetry/sample.rs`.

`/metrics` is served without authentication and defaults to `127.0.0.1:9464`. Binding
elsewhere prints a warning; put it behind your own access control.

## Prometheus metrics

| Metric | Type | Labels | Meaning |
|---|---|---|---|
| `kshana_build_info` | gauge | `version` | constant 1 |
| `kshana_trust_score` | gauge | | latest score 0-100; absent if the source gives none |
| `kshana_trust_band` | gauge | `band` | 1 for the current band, 0 for the others |
| `kshana_trust_gate` | gauge | `gate` | 1 for the live stream's current gate state; absent without a gate |
| `kshana_trust_reason_active` | gauge | `reason` | 1 if present at the latest epoch |
| `kshana_trust_epochs_total` | counter | `band` | epochs received |
| `kshana_trust_reason_epochs_total` | counter | `reason` | epochs in which the reason was present |
| `kshana_trust_input_errors_total` | counter | | unparsable input lines |
| `kshana_trust_epoch_offset_seconds` | gauge | | latest epoch's offset from stream start |
| `kshana_trust_last_sample_timestamp_seconds` | gauge | | wall-clock receipt time; alert on its age |

`band` is one of `calibrating`, `nominal`, `degraded`, `untrusted`, `unknown`. Reason
names are the monitor names of the stream (`kinematic`, `heading-course`, ...; for the batch
result, `cn0-drop`, `agc`, `raim`).

A sample dashboard is in `deploy/grafana/kshana-gnss-trust.json` (import it and pick your
Prometheus data source).

## Syslog: CEF and LEEF

Events are sent in an RFC 5424 envelope (facility local0, app `kshana`, message id
`GNSSTRUST`) over UDP (one datagram each) or TCP (newline-terminated). By default one event
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
| score | `cn1` (`trustScore`), omitted if none | `trustScore` |
| epoch offset, s | `cn2` (`epochOffsetSeconds`) | `epochOffsetSeconds` |
| log time label | `cs4` (`logTime`) | `logTime` |
| gate state | `cs5` (`gate`) | `gate` |

CEF header values escape `\` and `|`; extension values escape `\`, `=` and line breaks.
LEEF values have `^` and line breaks replaced by spaces.

## OpenTelemetry (off by default)

Build with `--features otlp` and pass `--otlp http://host:4318/v1/metrics`. The exporter
posts OTLP/HTTP JSON (`kshana.trust.score`, `kshana.trust.band`, `kshana.trust.epochs`,
`kshana.trust.reason.epochs`) every `--otlp-every` epochs (default 10) and at end of
input. It adds no dependency and has no TLS: send to a collector on the same host or a
trusted segment, which forwards onwards over TLS. `https://` endpoints are refused.
