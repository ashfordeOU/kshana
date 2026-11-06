# Observations: `kshana.obs/1`

One schema for station and system observations. Every reader that brings data into Kshana writes it, and every consumer reads it: receiver logs today, and live feeds, partner data and monitoring-station networks as they arrive.

An observation file is [JSON Lines](https://jsonlines.org): one JSON record per line, each with a `type`.

| Record | When | Fields |
| --- | --- | --- |
| `header` | first line, exactly once | `schema` (`kshana.obs/1`), `station`, `source_format`, `start_label`, `observables`, `skipped_records` |
| `epoch` | one per observation instant | `station` (the header's id), `t_s` (seconds since the first epoch), `time_label`, and the observation: `cn0` per satellite, `agc`, `jam_ind`, `fix`, `sky`, `reported_dop`, `self_report` (the receiver's own spoofing and jamming flags, OSNMA), `marine`, `source_span`; optionally `iq_ref` |
| `alarm` | when a monitor or a station raises one | `station`, `t_s`, `kind` (`jamming`, `spoofing`, `osnma-fail`, ...), `severity` (`info`, `warning`, `alarm`), `note` |

The `station` object carries `id` (required), `lat_deg`, `lon_deg`, `height_m` (WGS 84), `antenna`, `receiver`, `firmware`, `operator`, and `partner_input`. When `partner_input` is true, results built on the file are labelled PARTNER.

An `iq_ref` points an epoch at the IQ recording that covers it: `path` (relative to the observation file), `sha256`, `sample_rate_hz`, `centre_hz`, `offset_samples`.

The epoch fields are the ones every receiver-log reader returns, so a field a source does not carry is `null` or absent, and `observables` in the header lists what the source does carry: a report never implies a monitor ran on data that was not there.

## Commands

```sh
kshana obs convert examples/receiver-trust/illustrative-jamming.nmea --format nmea \
  --station examples/obs/station.toml --out site.obs.jsonl
kshana obs check site.obs.jsonl          # or --json
```

`convert` reads `ubx`, `rinex`, `android`, `sbf`, `nmea`, `rtklib-pos`, `novatel`, `rtcm3`, `gnss-sdr` and `iec61162-450`. The last is a capture of maritime network datagrams (IEC 61162-450): it is unwrapped to NMEA 0183 and read as `nmea`, and each TAG block's checksum is checked (`src/iec61162_450.rs`). `check` accepts a file only if the header comes first with this schema, every record belongs to the header's station, epoch times are finite and never go backwards, and every IQ reference and alarm is complete. It reports the first problem with its line number.

The JSON Schema is [`spec/obs-1.schema.json`](spec/obs-1.schema.json). The version rule is in [STABILITY.md](STABILITY.md): fields are only added within `kshana.obs/1`; a change that removes or redefines one is `kshana.obs/2`.
