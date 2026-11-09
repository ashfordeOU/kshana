<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C7 (0.41): adapters and notebooks for flight-dynamics tools: results so far

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026, no bar). The tools and the
readings of criterion 3 are in `NAMING.md`. The adapters, notebooks and the difference report are in
`integrations/flight-dynamics/`; `.github/workflows/flight-dynamics.yml` runs them.

**Status: three of the four tools carry the files. GMAT R2026a runs the SPK end to end and does not
carry it: a GMAT time-representation finding (see GMAT). It refuses the OEM.**

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
| GMAT R2026a | SPK | its `SPK` propagator, evaluated at the nodes, read out at 16 digits in Luna-centred ICRF axes | **not carried** (evaluated, not read): within 1.19 mm and 3.0e-10 km/s of the written state, all of it along the velocity. GMAT evaluates the kernel at its own representable epochs (an A.1 modified Julian date in a double, 0.31 µs per ulp), which its report cannot print exactly. A GMAT time-representation finding; the rule is unchanged. |
| GMAT R2026a | OEM | its `CCSDS-OEM` propagator | **refused**: R2026a reads an OEM of version 2.0 only in its TESTING mode, which the adapter does not turn on. |

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
4. **GMAT returns the kernel's state at the epochs it can represent.** See GMAT, the sixth run.
5. **GMAT's MJ2000Eq axes are a constant 44.4 mas rotation from its ICRF axes** for these states,
   about twice the IAU 2006 frame bias (about 23 mas, which leaves 7.4 m). See GMAT, the fifth run.

## Criterion 4

- `kshana connect check` runs in the workflow's first job.
- No code change in either repository is needed to run the integration.
- The same export runs on every surface: the same bytes, as above.
- Each tool's notebook runs top to bottom in the workflow.

## GMAT

**The SPK is not carried: a GMAT time-representation finding** (the sixth run, at the end of this
section). The adapter (`integrations/flight-dynamics/gmat_reader.py`, `gmat.ipynb`) and its
workflow job `gmat` are in place. The job uses GMAT R2026a, from a 401,664,992-byte tarball pinned by
SHA-256 `fe124b4a606b2e3b704a6fbb1c37b87598d5df0d18cb661c304b5f60074a7754` and cached. GMAT reads the
SPK through its `SPK` propagator, steps through the file at the node spacing, and reports every
state; the report compares them as for an evaluating tool.

**The OEM: GMAT R2026a, as shipped, does not read an OEM of version 2.0.** In the job's first run
(Flight dynamics run 42501092081, at open commit 150df8d41), GMAT loaded its kernels and stopped the
mission at the first propagation of the OEM:

    Utility Exception: Error: Usage of CCSDS OEM v2 ephemeris data file is only allowed for running in TESTING mode.

Kshana writes `CCSDS_OEM_VERS = 2.0`. Turning on GMAT's TESTING mode would no longer test GMAT as
shipped, so the adapter does not. It now runs the OEM and the SPK as two GMAT scripts. The OEM leg
still gives GMAT the OEM as written, and the notebook accepts two outcomes for it: the OEM carried,
or exactly this refusal, which the report then states. Any other failure fails the notebook, and a
GMAT that reads the file is compared in full. Whether GMAT reads Kshana's states from an OEM of
version 1.0 is not tested: Kshana does not write one.

The adapter was written from GMAT's documentation and samples without running GMAT: the session
that wrote it was not allowed to execute GMAT's binaries. The job runs with continue-on-error and is
fixed from its logs. Six runs closed the loop; each is recorded below.

**The SPK: stepping by elapsed time runs past the kernel.** The job's second run (Flight dynamics run
42534549174, at open commit bec4ae298) loaded the kernel and stepped 4,320 times by 600 s, then
halted on the last step: the requested epoch, A.1 modified Julian 30034.49962788203, was 3.2e-9 day
(about 0.28 ms) past the kernel's coverage, which GMAT gave as ending at 30034.4996278788. GMAT counts
elapsed time in A.1 seconds; the kernel's nodes are TDB, and over 30 days the TDB−TT periodic term
moves them about 0.28 ms apart. The script now stops each step at the next node's TDB epoch
(`TDBModJulian` stop condition) instead of stepping by elapsed time. The comparison and its bar are
unchanged.

**The last node: GMAT cannot be asked for the kernel's end epoch itself.** The third run (Flight
dynamics run 42545057567, at open commit f07e4ba53) stepped by TDB epoch through every interior node
and halted on the last: GMAT's conversion of the stop epoch, the kernel's coverage end, landed past
the coverage ("Insufficient ephemeris data has been loaded to compute the state of -1176 relative to
399 (EARTH) at the ephemeris epoch 2023 MAR 31 00:00:00.000"). The first node, reported at the start
epoch before any step, was inside the coverage. The script now asks for the last node 2 µs before
the coverage end (read with SPICE), through a propagator whose one step is 1 µs short of 600 s, so
that GMAT does not step past the kernel whether or not it shortens a step to land on an epoch stop.
That node's epoch is then about 2 µs from the written one, and the report states the offset. Under
the rule (every epoch the written one, no state further than SPICE's), that node is not carried; this
is recorded as a GMAT time-representation finding, and the rule is not loosened.

**The fourth run: every state reported, two adapter faults found.** The fourth run (Flight dynamics
run 42549642686, at open commit b099de4ea) ran the SPK leg end to end: 4,321 of 4,321 states, 4,290
epochs equal within the printed unit, the last node −1.73e-6 s, the others within 1.15e-6 s. Two
faults in the adapter showed in the states:

- The first row was GMAT's default spacecraft state, not the kernel's: the first report ran before
  any propagation, and GMAT loads an ephemeris propagator's state only when it propagates. That row
  alone made the worst difference 3.97e5 km and 7.24 km/s. The spacecraft now takes one 1e-12 s
  step before the first report.
- From the second row on, GMAT's positions were tens of metres from the written ones (node 1: +29.5,
  +4.9, −13.7 m; node 2000: −50.3, −8.8, +24.3 m), with velocities within about 1e-8 km/s. GMAT reads
  the spacecraft relative to the Earth, through the Moon of the planetary SPK it loads
  (DE405AllPlanets.bsp), and subtracts the Moon of its own solar-system source (its DE405 reader);
  the frame bias between ICRF and J2000 does not match the offsets. GMAT's solar system now reads
  NAIF's de440s.bsp (SHA-256 `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`,
  fetched and cached by the workflow) through SPICE, so that both Moons come from one ephemeris. If
  the offsets remain, they are recorded as a GMAT finding with the per-node table, and the rule is
  not changed.

The notebook writes the per-node differences (epoch offset in seconds, GMAT minus written in km and
km/s) to `gmat/spk_differences.csv` in the job's artifact.

**The fifth run: a constant rotation of the readout axes.** The fifth run (Flight dynamics run
42555506824, at open commit fec594dd1) reported the kernel's state at the first node, and with one
Moon the worst position difference fell from 85 m to 14.5 m, velocities within 0.32 mm/s. What was
left is a constant rotation: a least-squares fit of d = ω × r over all 4,321 nodes gives
ω = (−7.85, +43.72, −0.62) mas, |ω| = 44.4 mas, stable over 5-day chunks; with it removed the
position residual is at most 0.31 m (RMS 0.15 m), the radial differences at most 0.7 mm. The IAU
2006 frame bias (about 23 mas) removes only part of it. The states had been read out in GMAT's
MJ2000Eq axes, while Kshana's states are ICRF (the kernel's frame code is J2000, which SPICE treats
as ICRF). The SPK is now reported in a Luna-centred frame with GMAT's ICRF axes, the like-for-like
readout, and still also in MJ2000Eq (`gmat_spk_mj2000eq.txt`, `spk_mj2000eq_differences.csv`, not
compared). If a rotation remains in the ICRF readout, it is recorded as a GMAT frame finding with
this fit, and the rule is not changed.

**The comparison through GMAT's report.** GMAT's states reach the notebook only through a text report
of at most 16 significant digits, and a double needs 17. A stand-in that returns SPICE's own states,
equal to SPICE in every value at 16 digits, fails the evaluating-tool rule as first written
(2.18e-11 km against SPICE's 1.46e-11 km). By the 8-9 November amendment in NAMING.md, written before
any real GMAT SPK comparison was seen, GMAT's states are compared with SPICE's evaluation printed at
the same 16 digits; the bar is unchanged, and Orekit, Basilisk and ANISE keep the full-double
comparison. Future work: read GMAT's states at full precision instead, for example from an ephemeris
file GMAT writes (an SPK read back by SPICE at the nodes), which would need no amendment but puts
GMAT's own writer in the path.

**The sixth run: the finding.** The sixth run (Flight dynamics run 42560008632, at open commit
8941ea41e) read the SPK out in GMAT's ICRF axes. The rotation is gone: a rotation fitted to the
per-node differences is 0.000 mas. The worst node is 1.19 mm and 3.0e-10 km/s from the written state
(median 0.05 mm), the first node 6.9e-11 km. What is left lies along the velocity: solving d = v·dt
node by node gives dt from −1.91 to +0.72 µs, with at most 2.3e-10 km (median 5.7e-11 km) across
it. The implied dt is within 0.44 µs of the epoch offset the report states, about one ulp of an A.1
modified Julian date near 30,000 days (0.31 µs), and the 418 nodes reported at offset 0 still carry
up to 0.57 mm along the velocity. GMAT returns the kernel's state at its own representable epoch,
which its 16-digit report cannot print exactly. The MJ2000Eq readout of the same run repeats the
fifth: ω = (−7.850, +43.722, −0.619) mas, worst 14.49 m, 0.31 m after the rotation.

The rule is not amended for this (decision by the seat, after seeing this run). Judging GMAT at its
representable epochs would need those epochs to better than one ulp, which the report cannot give;
with dt fitted per node, the 2.3e-10 km across the velocity is still above SPICE's own evaluation of
the kernel; and an amendment made after this result would be a loosened bar. The GMAT SPK row stays
not carried. Future work: a full-precision GMAT readout, such as an epoch printed in two parts, or
GMAT's API.
