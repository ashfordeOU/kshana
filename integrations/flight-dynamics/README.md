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
| ANISE 0.10.6 (the fourth, file-based tool: its own kernel reader, not SPICE) | [`anise_reader.py`](anise_reader.py) | [`anise.ipynb`](anise.ipynb) ([`.md`](anise.md)) | SPK, OEM | `flight-dynamics.yml`, job `tool (anise)` |
| GMAT R2026a (runs only in its CI job) | [`gmat_reader.py`](gmat_reader.py) | [`gmat.ipynb`](gmat.ipynb) ([`.md`](gmat.md)) | SPK, not carried: GMAT evaluates at the epochs it can represent, within 1.19 mm (a time-representation finding, [RESULTS](../../docs/design/evidence/c7-flight-dynamics-adapters/RESULTS.md#gmat)). The OEM is refused: R2026a reads an OEM of version 2.0 only in its TESTING mode | `flight-dynamics.yml`, job `gmat` (continue-on-error: red by design, see RESULTS) |

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

Some tools evaluate a kernel and do not hand back its stored records (ANISE's Python API). For
those, the states at the node epochs are compared with the written states, beside SPICE's own
evaluation of Kshana's SPK of the same states. The file is carried when every epoch is the written
one and no state is further from the written one than SPICE's evaluation is. The report marks these
rows "evaluated, not read". For a tool whose only readout is a fixed-precision text report (GMAT,
16 significant digits), SPICE's evaluation is printed at the same precision before the comparison,
so both pass through the same readout ([NAMING.md](../../docs/design/evidence/c7-flight-dynamics-adapters/NAMING.md),
the 8-9 November amendment).

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

ANISE, run locally:

| File | How ANISE reads it | Node states with the written bits | Worst at the nodes | SPICE on the same states |
|---|---|---|---|---|
| SPK, type 13 | its own SPK reader, at the nodes as ET | 25,828 of 25,926 values | 1.46e-11 km, 4.94e-15 km/s | 1.46e-11 km, 4.97e-15 km/s |
| OEM | converted to an SPK of type 9, at the nodes as TDB | 25,831 of 25,926 values | 1.46e-11 km, 1.11e-16 km/s | (as above) |

ANISE carries both files, no further from the written states than SPICE is. Time scales matter
here. ANISE reads an SPK's epochs as SPICE ephemeris time (ET), but reads an OEM's
`TIME_SYSTEM = TDB` labels with hifitime's TDB model. The same label falls 3.2 µs apart on the
two scales at the first node. Evaluating the SPK at the TDB reading of the labels moves the states
by up to 3.3e-6 km. The notebook shows this.

GMAT R2026a, in its CI job (Flight dynamics run 42560008632):

| File | How GMAT reads it | States | Worst at the nodes | Result |
|---|---|---|---|---|
| SPK, type 13 | its `SPK` propagator, read out at 16 digits in Luna-centred ICRF axes | 4,321 | 1.19 mm, 3.0e-10 km/s, all along the velocity | not carried |
| OEM | its `CCSDS-OEM` propagator | none | | refused: OEM 2.0 only in GMAT's TESTING mode |

GMAT returns the kernel's state at the epochs it can represent: an A.1 modified Julian date in a
double, 0.31 µs per ulp, which its 16-digit report cannot print exactly. The differences match
an epoch error of −1.91 to +0.72 µs per node, with at most 2.3e-10 km across the velocity. The rule
is unchanged, so the SPK is not carried; RESULTS records this as a GMAT time-representation finding.

## Run

```sh
pip install kshana -r integrations/flight-dynamics/requirements-orekit.txt   # Java 17 or later
python integrations/flight-dynamics/run_notebooks.py orekit
pip install -r integrations/flight-dynamics/requirements-basilisk.txt
python integrations/flight-dynamics/run_notebooks.py basilisk
pip install -r integrations/flight-dynamics/requirements-anise.txt
python integrations/flight-dynamics/run_notebooks.py anise
```

`OREKIT_DATA` names an orekit-data directory or zip. Without it, the adapter fetches orekit-data at
the pinned commit once, into `~/.cache/kshana-fd`. `KSHANA_FD_OUT` names the directory for the
written files and the report.
