# Observations: `kshana.obs/1`

One schema for station and system observations. Every reader that brings data into Kshana writes it, and every consumer reads it: receiver logs today, and live feeds, partner data and monitoring-station networks as they arrive.

An observation file is [JSON Lines](https://jsonlines.org): one JSON record per line, each with a `type`.

| Record | When | Fields |
| --- | --- | --- |
| `header` | first line, exactly once | `schema` (`kshana.obs/1`), `station`, `source_format`, `start_label`, `observables`, `skipped_records` |
| `epoch` | one per observation instant | `station` (the header's id), `t_s` (seconds since the first epoch), `time_label`, and the observation: `cn0` per satellite, `agc`, `jam_ind`, `fix`, `sky`, `reported_dop`, `self_report` (the receiver's own spoofing and jamming flags, OSNMA), `marine`, `source_span`; optionally `iq_ref` |
| `alarm` | when a monitor or a station raises one | `station`, `t_s`, `kind` (`jamming`, `spoofing`, `osnma-fail`, ...), `severity` (`info`, `warning`, `alarm`), `note` |
| `correction` | one per satellite of each decoded SSR correction message, one per ionosphere message | `station`, `t_s` (seconds since the first correction, on GPS time), `source` (`rtcm-ssr` or `igs-ssr`), `message`, `igs_message`, `kind` (`orbit`, `clock`, `combined`, `code-bias`, `phase-bias`, `ura`, `high-rate-clock`, `vtec`), `system`, `sat` (e.g. `G01`; absent for `vtec`), `epoch_s` (as sent), `update_interval`, `multiple`, `iod_ssr`, `provider`, `solution`, and what the message carries: `regional_datum`, `iod`, `toe_modulo_raw`, `orbit` (radial, along, cross, m, and their rates), `clock` (`c0_m`, `c1_m_s`, `c2_m_s2`), `high_rate_clock_m`, `code_biases` and `phase_biases` (per signal, m), `phase_consistency`, `yaw_semicircles`, `yaw_rate_semicircles_s`, `ura_raw`, `vtec_quality_tecu`, `vtec_layers` |

The `station` object carries `id` (required), `lat_deg`, `lon_deg`, `height_m` (WGS 84), `antenna`, `receiver`, `firmware`, `operator`, and `partner_input`. When `partner_input` is true, results built on the file are labelled PARTNER.

An `iq_ref` points an epoch at the IQ recording that covers it: `path` (relative to the observation file), `sha256`, `sample_rate_hz`, `centre_hz`, `offset_samples`.

The epoch fields are the ones every receiver-log reader returns, so a field a source does not carry is `null` or absent, and `observables` in the header lists what the source does carry: a report never implies a monitor ran on data that was not there.

## Commands

```sh
kshana obs convert examples/receiver-trust/illustrative-jamming.nmea --format nmea \
  --station examples/obs/station.toml --out site.obs.jsonl
kshana obs check site.obs.jsonl          # or --json
kshana obs live tcp:192.168.1.20:5000 --format ubx --station station.toml --out live.obs.jsonl
```

`convert` reads `ubx`, `rinex`, `android`, `sbf`, `nmea`, `rtklib-pos`, `novatel`, `rtcm3`, `gnss-sdr` and `iec61162-450`. The last is a capture of maritime network datagrams (IEC 61162-450): it is unwrapped to NMEA 0183 and read as `nmea`, and each TAG block's checksum is checked (`src/iec61162_450.rs`). `check` accepts a file only if the header comes first with this schema, every record belongs to the header's station, epoch times are finite and never go backwards, every IQ reference and alarm is complete, and every correction has a finite time and a satellite (unless it is an ionosphere message); correction times may go backwards, since a stream interleaves systems. It reports the first problem with its line number.

`convert --format rtcm-ssr` reads the SSR correction messages of an RTCM 3 stream (RTCM 1057–1068 and 1240–1264, and IGS SSR, message 4076) into correction records instead of epochs (`kshana::rtcm_ssr`); the station file names the correction stream, for example its mountpoint. A BeiDou RTCM epoch is moved 14 s to GPS time and a GLONASS RTCM epoch (GLONASS time of day) with GPS − UTC = 18 s; the header's `skipped_records` counts bad and truncated frames and frames of other messages. The decoding is MODELLED: every value of the three public sample streams equals what the open decoder pyrtcm records for them, and the limits are in [`design/evidence/r1-1-rtcm-ssr/RESULTS.md`](design/evidence/r1-1-rtcm-ssr/RESULTS.md). `live` does not take `rtcm-ssr`.

`live` reads a stream as it arrives: `-` (standard input), `tcp:host:port` (a receiver's TCP output), or a file or device (a serial port is read as a file; set its speed with `stty` first). Each epoch is written, and flushed, once the next one has begun; the last is written when the stream ends. The epochs are the ones `convert` gives for the same bytes, field for field, whatever the size of the pieces the bytes arrive in (`tests/obs_live.rs` checks this for UBX, SBF, NovAtel, RTCM 3, NMEA and RINEX, in pieces from 1 byte to 5000). Memory stays bounded: the bytes are cut into whole frames by each format's framing, and only the first epoch (the time origin) and the frames from the epoch before the latest one are kept. The header comes with the first epoch; its `skipped_records` counts what had been skipped by then. The library surface is `kshana::obs_live`.

The JSON Schema is [`spec/obs-1.schema.json`](spec/obs-1.schema.json). The version rule is in [STABILITY.md](STABILITY.md): fields are only added within `kshana.obs/1`; a change that removes or redefines one is `kshana.obs/2`.
