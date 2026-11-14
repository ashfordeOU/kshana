# Sample inputs of the track readers: provenance

Every file here is synthetic or a published worked example. None is a recording from operational
equipment, none comes from a commercial feed, from OpenSky Network or from TEXBAT. `make_inputs.py`
writes the binary and NMEA files; the JSON and CSV files are written by hand. The encoders share no
code with `src/interconnect/`.

| File | Written by | Checked by | Content |
|---|---|---|---|
| `ais.nmea` | `make_inputs.py`, payloads encoded by pyais 3.3.1 (MIT); TAG blocks, one damaged checksum and one `!AIVDO` line added by the script | pyais decodes every message it encoded | types 1, 5 (two sentences), 18, 19, 24 A and B; invented MMSIs, names and positions off Rotterdam |
| `adsb.avr`, `adsb.beast` | `make_inputs.py`: DF 17 messages built from the bit layouts of *The 1090 Megahertz Riddle* (J. Sun, TU Delft, 2nd ed.), CRC-24 computed by the script; the identification message `8D4840D6202CC371C32CE0576098` is the book's worked example | pyModeS 3.7.0 (GPL-3.0) decodes the operational status (version 2, NACp 9, NIC-A 0) and the positions; its output is kept in `adsb.oracle.json` | an invented aircraft 4CA7B4 near Dublin: operational status, four airborne positions (type codes 11 and 16), one damaged message |
| `asterix.bin` | `make_inputs.py`, an encoder written from the EUROCONTROL CAT010 1.1, CAT048 1.21 and CAT062 1.18 specifications | the CroatiaControl ASTERIX decoder 0.7.11 (GPL) reads every record with the same addresses and positions | three CAT048 plots, two CAT010 reports, two CAT062 tracks, one CAT034 block (stepped over) |
| `flight.tlog` | `make_inputs.py`, frames written by pymavlink (LGPL-3.0) from the MAVLink `common.xml` definitions | pymavlink reads the log back | four rounds of `HEARTBEAT`, `GPS_STATUS`, `GPS_RAW_INT` (the last a 2D fix), `GPS2_RAW`; positions near Zurich |
| `flight.ulg` | `make_inputs.py`, written from the PX4 ULog format description | pyulog (BSD-3-Clause) reads the `sensor_gps` topic with the same values | five `sensor_gps` messages: rising jamming indicator and states, a 2D fix, then no fix |
| `n2k-canboat.jsonl` | by hand, in the layout of canboat `analyzer -json` output (field names from the canboat PGN descriptions) | none | PGN 129540, 129539, 129029 (Safe, Caution, no GNSS), 129038, 129025 off Tallinn |
| `opensky-states.json`, `opensky-states.csv` | by hand, in the layout of OpenSky's REST state vectors and historical CSV exports | none | invented aircraft and values |

To regenerate (the encoders' versions are pinned above):

```sh
python3 -m venv /tmp/v && /tmp/v/bin/pip install pyais==3.3.1 pyModeS==3.7.0 pymavlink pyulog asterix_decoder
/tmp/v/bin/python -I examples/tracks/make_inputs.py examples/tracks
kshana connect check conformance/connect --bless   # then review the diff
```

Limit: an encoder and a reader written from the same public description can share a misreading. The
independent decoders reduce that risk for the files they check; the hand-written JSON and CSV files
have no independent check.
