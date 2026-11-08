<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C7 (0.41): adapters and notebooks for flight-dynamics tools: results so far

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026, no bar). The tools and the
readings of criterion 3 are in `NAMING.md`. The adapters, notebooks and the difference report are in
`integrations/flight-dynamics/`; `.github/workflows/flight-dynamics.yml` runs them.

**Status: three of the four tools pass; GMAT is not done.**

## The trajectory

The CAPSTONE states of the mission thread: JPL Horizons, Moon-centred, ICRF, TDB, 4,321 states every
10 minutes from 1 to 31 March 2023 (`tests/fixtures/capstone_horizons/`). Kshana writes them with
`kshana ephem-export` as an OEM 2.0, an OPM 3.0 (the first state) and an SPK of type 13, degree 7
(criterion 1). The three files' SHA-256 are pinned in
`tests/fixtures/capstone_horizons/ephem_export.sha256`. The command line, Python, WebAssembly and MCP
write those bytes; `tests/ephem_export_capstone.rs`, `tests/python/test_bindings.py`,
`web/smoke.mjs` and the MCP round trip check it. The workflow compares the command line's files with
the Python binding's.

## Criteria 2 and 3: each tool reads the files back

| Tool | File | How it reads | Result |
|---|---|---|---|
| Orekit 13.1.9 | OEM | `OemParser` | **carried**: 25,926 of 25,926 values are Orekit's own km-to-m conversion of the written double; 4,321 of 4,321 epochs equal. Named as rounding further: the conversion is a second rounding of at most one ulp (worst 2.83 half-units of the last digit written). |
| Orekit 13.1.9 | OPM | `OpmParser` | **carried**: 6 of 6 values, the epoch equal; rounds further, as above. |
| Basilisk 2.12.2 | SPK | the SPICE Toolkit it ships (`pyswice`): stored records and epochs | **carried, to the digits written**: 25,926 of 25,926 values and 4,321 of 4,321 epochs with the written bits. `spkezr_c` at the nodes within 1.5e-11 km and 5e-15 km/s of the stored state. |
| ANISE 0.10.6 | SPK | its own reader, evaluated at the nodes (ET) | **carried** (evaluated, not read): within 1.46e-11 km and 4.94e-15 km/s of the written state; SPICE on the same kernel 1.46e-11 km and 4.97e-15 km/s. |
| ANISE 0.10.6 | OEM | converted by ANISE to a type 9 kernel, evaluated at the nodes (TDB) | **carried** (evaluated, not read): within 1.46e-11 km and 1.11e-16 km/s. |
| GMAT | OEM, SPK | | **not done**: see below |

These numbers are from local runs on 8 November 2026. The workflow runs the same notebooks; each
run uploads its difference report.

## Findings

1. **Kshana's SPK is the kernel SPICE writes.** The SPICE Toolkit's own writer (`spkw13`, CSPICE
   N0067 through spiceypy) was given the same states, epochs, degree, segment name and internal file
   name. Its kernel is byte for byte the one `kshana ephem-export` writes (245,760 bytes). Checked
   once, outside the repository; `src/spk_writer.rs` states the same claim for its own oracle test.
2. **ANISE reads two time scales.** ANISE reads an SPK's epochs as SPICE ephemeris time (ET), and
   an OEM's `TIME_SYSTEM = TDB` labels with hifitime's TDB model. The same label is 3.219 µs apart
   on the two scales at the first node. Evaluating the SPK at the TDB reading of the labels moves
   the states by up to 3.3e-6 km. The first attempt at the adapter did this, and it looked like a
   3.5e-6 km ANISE error. `anise.ipynb` shows the effect.
3. **Orekit rounds further than the digits written.** Orekit parses each value to the written
   double and holds metres, so its kilometre-to-metre multiplication rounds a second time. 6,727 of
   the 25,926 metre values are one ulp from the correctly rounded metre value.

## Criterion 4

- `kshana connect check` runs in the workflow's first job.
- No code change in either repository is needed to run the integration.
- The same export runs on every surface: the same bytes, as above.
- Each tool's notebook runs top to bottom in the workflow.

## GMAT

**Not done.** The adapter (`integrations/flight-dynamics/gmat_reader.py`, `gmat.ipynb`) and its
workflow job `gmat` are in place. The job uses GMAT R2026a, from a 401,664,992-byte tarball pinned by
SHA-256 `fe124b4a606b2e3b704a6fbb1c37b87598d5df0d18cb661c304b5f60074a7754` and cached. GMAT loads the
OEM through its `CCSDS-OEM` propagator and the SPK through its `SPK` propagator, steps through each
file at the node spacing, and reports every state; the report compares them as for an evaluating
tool.

The adapter was written from GMAT's documentation and samples without running GMAT: the session
that wrote it was not allowed to execute GMAT's binaries. The job runs with continue-on-error and is
fixed from its logs. GMAT counts as done only when that job is green.
