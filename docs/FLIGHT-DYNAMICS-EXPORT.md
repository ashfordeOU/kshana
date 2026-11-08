<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Flight-dynamics export: a trajectory as OEM, OPM and SPK

`kshana ephem-export` writes a tabulated trajectory as one of the files flight-dynamics tools load:

| Format | What is written | Read by, for example |
|---|---|---|
| `oem` | CCSDS Orbit Ephemeris Message 2.0, KVN: one segment with every state | Orekit, GMAT, STK |
| `opm` | CCSDS Orbit Parameter Message 3.0, KVN: one state (`--index`, default the first) | Orekit, GMAT |
| `spk` | NAIF SPICE SPK kernel, type 13 (Hermite, default) or type 9 (Lagrange), one segment | SPICE and the tools built on it (Basilisk, GMAT) |

This is step 1 of roadmap item C7 (adapters and notebooks for flight-dynamics tools;
[pre-registration](design/evidence/c7-flight-dynamics-adapters/PREREGISTRATION.md)). The adapters and
notebooks that load these files into the tools themselves are in
[`integrations/flight-dynamics/`](../integrations/flight-dynamics/README.md): Orekit, Basilisk and ANISE so far.

## Input

A JPL Horizons vector table as Horizons writes it: `Output type: GEOMETRIC cartesian states`,
`Output format: 2` (position and velocity), `Output units: KM-S`, a TDB time scale, and the CSV form
between `$$SOE` and `$$EOE` (Julian date, calendar date, X, Y, Z, VX, VY, VZ). The object, the centre
and their NAIF ids (`Target body name: CAPSTONE (spacecraft) (-1176)`, `Center body name: Moon (301)`),
the frame (`Reference frame : ICRF`) and the request time come from the table's header. A table in
other units or another time scale is refused, not converted.

The mission thread's CAPSTONE table is in the repository:
`tests/fixtures/capstone_horizons/capstone_2023-03_moon_icrf.txt` (4,321 states, 1 to 31 March 2023,
every 10 minutes, Moon-centred, ICRF).

## Use

```sh
kshana ephem-export capstone.txt --format oem --out capstone.oem
kshana ephem-export capstone.txt --format opm --index 0 --out capstone.opm
kshana ephem-export capstone.txt --format spk --spk-type 13 --degree 7 --out capstone.bsp
```

Options: `--out` (default: the input path with `.oem`, `.opm` or `.bsp`), `--index` (OPM),
`--spk-type 13|9` and `--degree` (SPK; odd for type 13), `--creation-date` and `--object-id` (OEM
and OPM headers). The command writes the file and prints a JSON report: the table's object, centre,
NAIF ids, frame, time scale, number of states and span, the file's size and SHA-256, and `read_back`.

The same function is `ephem_export` in Python, in WebAssembly and as an MCP tool, and
`kshana::ephem_export` in Rust. Python, WebAssembly and MCP return the file in the report (`content`,
with `encoding` `utf-8`, or `base64` for the SPK). Every surface writes the same bytes; the SHA-256 of
the three CAPSTONE files are pinned in `tests/fixtures/capstone_horizons/ephem_export.sha256` and
checked through the command line, Python and MCP.

## What is written

The values are copied, not computed.

- **OEM and OPM.** Each double is written in its shortest round-trip decimal form. A reader that
  parses the text as IEEE doubles gets back the bits the table gave. Epochs are the table's calendar
  epochs, copied as written (`2023-03-01T00:10:00.0000`), with `TIME_SYSTEM = TDB`. `REF_FRAME` is
  the table's frame (`ICRF`), `CENTER_NAME` its centre (`MOON`), `OBJECT_ID` the NAIF id unless
  `--object-id` gives one, and `CREATION_DATE` the request time in the table's header unless
  `--creation-date` gives one (never the wall clock, so the same table gives the same file).
- **SPK.** One segment: target and centre from the NAIF ids, the states as stored doubles, the
  epochs as TDB seconds past J2000 computed exactly from the calendar labels. ICRF is frame code 1
  (`J2000`), the code SPICE kernels of ICRF-referred ephemerides use; no rotation is applied. The
  kernel is laid out as the SPICE Toolkit's own writer lays it out
  ([`src/spk_writer.rs`](../src/spk_writer.rs)).

## The read-back

After writing, the engine reads the file back with its own readers and compares every state with the
one written (`read_back`): `identical` counts the states whose six values have the same bits, the
largest position and velocity differences, and the epochs that read back differently. For the SPK it
also evaluates the interpolated state at each node epoch.

On the CAPSTONE table: all 4,321 states read back identical from the OEM and the SPK, and the OPM's
one state too; no epoch differs. The SPK's interpolated state at the nodes is within 2.1e-11 km and
5.6e-15 km/s of the stored state (rounding in the Hermite arithmetic). Read with the SPICE Toolkit
(CSPICE N0067 through spiceypy), the SPK's stored records and epochs are the same bits, and `spkezr`
at the nodes is within 1.5e-11 km and 5.0e-15 km/s.

## Limits

- One object per file. One Horizons table in, one segment out.
- Horizons vector tables only, in km and km/s on TDB. Other state tables are not read yet.
- The OEM carries no covariance and no interpolation hint (`INTERPOLATION` is not written); the
  reading tool chooses its own interpolation.
- The frame is written as the table names it. ICRF is not rotated to EME2000 for tools that only
  accept EME2000; the C7 adapters state what each tool accepts.
