# GNSS-SDR to receiver-trust

Reads a GNSS-SDR receiver's own outputs into the `receiver-trust` kind. Read-only: nothing here
writes to GNSS-SDR or to any device.

> **Advisory software.** Not type-approved navigation equipment. The operator stays responsible
> for the safe navigation of the vessel.

Three routes, each with a documented GNSS-SDR output:

| GNSS-SDR output | `[log] format` | What the monitors get |
|---|---|---|
| PVT NMEA file (`PVT.nmea_dump_filename`) | `nmea` | time, fix, per-satellite SNR, DOP |
| PVT RINEX observation file | `rinex` | C/N0, and the engine's own fix with a navigation file |
| Monitor + PVT monitor UDP streams | `gnss-sdr` | per-channel C/N0 (the tracking loop's own estimate), fix, satellites used, azimuth and elevation, HDOP |

The UDP streams are Protocol Buffers. `relay.py` (receive only, needs `pip install protobuf` and
the `.proto` files from your own GNSS-SDR install, compiled with `protoc`) writes them as JSON
lines using the proto field names; `format = "gnss-sdr"` reads those lines.

```toml
kind = "receiver-trust"
[log]
format = "gnss-sdr"
path = "run.jsonl"
```

Line format (`example.jsonl` is a self-written sample): `{"msg":"synchro", System, Signal, PRN,
CN0_dB_hz, RX_time, Flag_valid_pseudorange}` and `{"msg":"pvt", rx_time, week, latitude,
longitude, height, valid_sats, hdop, utc_time, tracked_satellites:[{prn, system, signal,
azimuth_deg, elevation_deg, used}]}`. Observations are binned to one second of `RX_time`.

Status: the reader is covered by unit tests on self-written lines. `relay.py` has not been run
against a live GNSS-SDR in this repository; the field names come from the GNSS-SDR
documentation (Monitor and PVT blocks). The result is MODELLED, not validated against an external
oracle.
