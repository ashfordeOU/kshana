<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Flight-dynamics tools: Kshana's trajectories read back by the tools themselves

Roadmap item C7. Kshana writes a trajectory as a CCSDS OEM, a CCSDS OPM or a SPICE SPK kernel
(`kshana ephem-export`, [docs/FLIGHT-DYNAMICS-EXPORT.md](../../docs/FLIGHT-DYNAMICS-EXPORT.md)). For each tool,
an adapter here loads those files into the tool, and a notebook compares every state the tool reads
back with the state written. The test is
[pre-registered](../../docs/design/evidence/c7-flight-dynamics-adapters/PREREGISTRATION.md) with no
bar: the data either comes through or it does not.

| Tool | Adapter | Notebook | Reads | CI |
|---|---|---|---|---|
| Orekit 13.1.9 (orekit_jpype 13.1.9.0) | [`orekit_reader.py`](orekit_reader.py) | [`orekit.ipynb`](orekit.ipynb) ([`.md`](orekit.md)) | OEM, OPM | `flight-dynamics.yml`, job `tool (orekit)` |
| Basilisk 2.12.2 (`bsk`), through the SPICE Toolkit it ships (`pyswice`) | [`basilisk_reader.py`](basilisk_reader.py) | [`basilisk.ipynb`](basilisk.ipynb) ([`.md`](basilisk.md)) | SPK | `flight-dynamics.yml`, job `tool (basilisk)` |
| GMAT | to come | | OEM, SPK | |
| A fourth open tool, file-based | to come | | | |

[`kshana_fd.py`](kshana_fd.py) holds what every tool shares: writing the three files through the
Python binding (their SHA-256 must be the pinned ones, and the command line's bytes when
`KSHANA_FD_CLI_DIR` names its output), reading back what was written, and the difference report.

## The difference report

For every file a tool reads, value by value:

- **Values with the written bits.** For a tool that holds the file's units (km, km/s).
- **Values equal to the tool's own conversion.** A tool that holds other units must hold exactly its
  own conversion of the written double. Orekit holds metres, so each value must be the written
  kilometre value times 1000.0.
- **Epochs equal.** Each epoch the tool holds equals the written TDB label.
- **Worst error in half-units of the last digit written,** and in ulps from the correctly rounded
  value. Above 1 half-unit, the report names the tool as one that rounds further than the digits
  written.

A file is **carried** when every value is the written double, or the tool's own conversion of it,
and every epoch is the written one.

## Results

Orekit, run locally with orekit-data at commit `2d6edc91`:

| File | States | Values equal to Orekit's conversion | Epochs equal | Worst, half-units of the last digit written | Worst, ulps from the correctly rounded value |
|---|---|---|---|---|---|
| OEM | 4,321 | 25,926 of 25,926 | 4,321 of 4,321 | 2.83 | 1 |
| OPM | 1 | 6 of 6 | 1 of 1 | 1.56 | 1 |

Orekit carries both files. It rounds further than the digits written: it parses each kilometre
value to the written double, then multiplies by 1000 into metres, which is a second rounding of at
most one ulp. 6,727 of the 25,926 metre values are one ulp from the correctly rounded metre value
for that reason.

Basilisk, run locally:

| File | States | Values with the written bits | Epochs equal | Evaluated at the nodes (`spkezr_c`) |
|---|---|---|---|---|
| SPK, type 13 | 4,321 | 25,926 of 25,926 | 4,321 of 4,321 | within 1.5e-11 km and 5e-15 km/s of the stored state |

Basilisk's SPICE reads the segment as written: target -1176, centre 301, frame 1 (J2000), type 13.
Every stored record and epoch has the written bits.

## Run

```sh
pip install kshana -r integrations/flight-dynamics/requirements-orekit.txt   # Java 17 or later
python integrations/flight-dynamics/run_notebooks.py orekit
pip install -r integrations/flight-dynamics/requirements-basilisk.txt
python integrations/flight-dynamics/run_notebooks.py basilisk
```

`OREKIT_DATA` names an orekit-data directory or zip. Without it, the adapter fetches orekit-data at
the pinned commit once, into `~/.cache/kshana-fd`. `KSHANA_FD_OUT` names the directory for the
written files and the report.
