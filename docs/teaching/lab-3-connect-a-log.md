<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Lab 3: map a receiver log and read it

**Goal.** Turn a receiver's own export (a semicolon-separated text file) into standard observation
records with Kshana Connect, then read time, units and signal quality from the records. **Time:**
about 45 minutes. **Data:** `examples/connect/timing-monitor.csv`, five rows of illustrative values
(synthetic, not a recording), its mapping `examples/connect/timing-monitor.connect.toml` and the
station `examples/obs/station.toml`.

Read the mapping file before you start: it says which column holds time, which hold C/N0 per
satellite, which unit the height is in, and where the gain control and the spoofing flag are.

## Exercises

**1. What came out.** Map the log. How many records are there, how many are epochs, and how many log
rows were skipped (`skipped_records` in the header)?

**2. Time.** The log gives GPS week 2443 and 43218 s of week. What `time_label` does the first epoch
carry, and why is it not 12:00:18?

**3. Units.** The log gives height as 98.4 (feet, `alt_ft`). What height in metres does the first
epoch carry? Compare it with the station's `height_m`.

**4. What changes.** Across the five epochs: when does satellite G25 stop appearing, how far does
G05's C/N0 fall, how does the gain control (`agc`) move, and what does the receiver's own spoofing
flag (`self_report.spoofing`) do? What can, and cannot, be concluded from this?

## Worked answers

1. **6 records**: one header and **5 epochs**, one per row; `skipped_records = 0`.
2. `2026-11-01T12:00:00Z`. GPS week 2443 starts on Sunday 1 November 2026, and 43218 s is 12:00:18
   in GPS time. GPS time runs 18 s ahead of UTC (the leap seconds since 1980), and the label is UTC.
3. **29.99 m** (98.4 × 0.3048), within a centimetre of the station's 30.0 m.
4. **G25 is missing from t = 3 s**; G05 falls by **13.9 dB-Hz** (44.1 to 30.2); the gain control
   falls from **2210 to 1275**; the receiver's flag goes from **spoofing 1 to 2**. All satellites
   losing C/N0 together while the gain control falls is commonly read as more power arriving in the
   band, as interference would cause. Five illustrative rows cannot tell interference from spoofing or
   from an antenna or cable fault, and the flag is the receiver's own claim, not evidence. Kshana's
   receiver-trust and interference tools ([`docs/RECEIVER-TRUST.md`](../RECEIVER-TRUST.md)) are the
   next step; their outputs are advisory, not type-approved equipment.

## Track notes

- **MATLAB:** [`solutions/lab3.m`](solutions/lab3.m). `kshana.connectMap` returns a cell array of
  structs; the `cn0` field of an epoch is a struct array with `sat`, `band` and `cn0_dbhz`.
- **LabVIEW:** `Kshana Connect Map.vi`, then split the lines and **Unflatten From JSON** each epoch
  into a cluster `{t_s: DBL, agc: DBL}`.
- **Python:** [`solutions/lab3.py`](solutions/lab3.py), which also checks every answer above against
  the engine.
