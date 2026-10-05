<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Worked example — Kshana as the multi-tool mission-analysis glue layer

This walks one trajectory through the standards-based interop and mission-analysis
scenario kinds end to end, showing how Kshana sits *between* the high-fidelity tools
a programme already uses rather than competing with them: GMAT (the General Mission
Analysis Tool), Orekit and STK (Systems Tool Kit) for trajectory design, and
Basilisk or 42 for attitude and orbit control system (AOCS) simulation. Every step is
a runnable scenario kind, and every result carries a `label` stating its scope and
evidence tier.

> Honesty note: this is a *geometry/analytic* pipeline at the pre-Phase-A /
> trade-study tier (before a mission’s first formal design phase). It is not a
> flight-dynamics certification; see each kind’s `label` field.

Other abbreviations used below: FDS (flight-dynamics system), CCSDS (Consultative
Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified
General Perturbations 4, the two-line-element propagator), TOML (the scenario file
format) and CLI (command-line interface).

## The pipeline

```
external FDS (GMAT/Orekit/STK)            Kshana open core
        │  CCSDS OEM ephemeris                 │
        ▼                                      ▼
  [oem-interop]  ──ingest──▶  [passes]  ──▶  [link-budget]   (when does the
   import the orbit the        when is it      does the         contact close?)
   designer produced           visible?        downlink close?
                                  │
                                  ▼
                            [space-weather]   (how fast does drag
                             activity-driven    decay the orbit?)
                             density
```

The steps are separate runs: each takes its inputs from its own scenario file, so you
carry a number from one to the next (a slant range from `passes` into `link-budget`,
for example) by editing the next file. The `campaign` kind can hold several kinds in
one run under shared conditions; see [CAMPAIGNS.md](../CAMPAIGNS.md).

Each command below is run from the repository root, and the summary under it is the
first line kshana 0.31.0 prints for the shipped scenario.

## 1. Ingest the trajectory a designer produced (`oem-interop`)

GMAT, Orekit and STK all *export* CCSDS Orbit Ephemeris Messages. Kshana imports
them (the other direction of the bridge), so a Kshana analysis can start from the
exact orbit the trajectory designer signed off, not a re-derived approximation:

```sh
kshana scenarios/oem-interop.toml          # round-trips a reference orbit (self-test)
# or, to ingest a real file, set oem_text in the scenario to the external OEM
```

```
oem-interop: round-tripped 2 segment(s), 12 states; max round-trip error 4.88e-7 km / 4.61e-10 km/s (MODELLED interop)
```

It reports the segments, objects, frames and epoch span and a velocity-consistency
check, showing the ephemeris was ingested faithfully (round-trip error below
1×10⁻⁶ km). Given an external file in `oem_text` instead, it reports what it parsed:
fed the OEM that `kshana scenarios/orbit-sgp4-gps.toml --export-oem gps.oem` writes,
it prints `oem-interop: ingested 30 segment(s), 10830 states from external OEM
(originator KSHANA) (MODELLED interop)`. The `label` is explicit that this is a
structural and physical ingest check, not an orbit-accuracy validation of the source.

## 2. When is it visible from a ground station? (`passes`)

```sh
kshana scenarios/passes.toml
```

```
passes: 5 pass(es) of a 550 km / 97.6° orbit over (52.2°, 4.4°) > 10° in 24 h; 1659 s total access (MODELLED)
```

Predicts the rise/set passes over a station above an elevation mask: acquisition of
signal (AOS), time of closest approach (TCA), loss of signal (LOS), maximum elevation
and duration, plus total access time. That is the ground-segment planning query.
The orbit is an SGP4 element set carried to the Earth-fixed frame on the IAU 2006/2000A
chain, and the elevations are apparent: ITU-R P.834-9 refraction and the downlink light
time, each switchable (`refraction`, `light_time`).

## 3. Does the contact close? (`link-budget`)

For a pass, put the slant range and the terminal figures into the CCSDS 401 /
DSN 810-005 (NASA Deep Space Network) link equation:

```sh
kshana scenarios/link-budget.toml
```

```
link-budget: x-band, 2000 km, 1000000 bit/s -> FSPL 177.0 dB, Eb/N0 96.6 dB, margin 92.1 dB (closes)
```

Reports free-space path loss (FSPL), carrier-to-noise density (C/N₀), energy per bit
over noise density (Eb/N₀), margin and whether the link **closes** against a required
Eb/N₀: the comms feasibility check that turns “it’s visible” into “we can actually
downlink the data.” The numbers follow directly from the inputs in the file (here a
55 dBW EIRP, effective isotropic radiated power, into a 53 dB/K receive G/T,
gain-to-noise-temperature ratio); put your own terminal’s figures in before reading
the margin. It is a deterministic calculation, not a calibrated terminal datasheet.

## 4. How fast does the environment decay it? (`space-weather`)

```sh
kshana scenarios/space-weather.toml
```

```
space-weather: F10.7=180 F10.7a=165 Kp=4.0 (ap=27) -> T_inf=1047 K; density x1.49 at 300 km (MODELLED)
```

Drives thermospheric neutral density from the solar (F10.7, the 10.7 cm radio flux,
and its 81-day mean F10.7a) and geomagnetic (Kp and ap indices) activity via the
Jacchia-71 exospheric temperature. That captures the ~5–10× solar-cycle density swing
a static atmosphere omits, so an orbit-lifetime or drag estimate reflects the
space-weather regime rather than a fixed atmosphere. Since 0.30 the density is the
Jacchia 1971 thermospheric density, characterised against NRLMSISE-00 (Naval Research
Laboratory mass-spectrometer and incoherent-scatter) but not a data-validated
NRLMSISE-00 atmosphere.

## 5. Hand the result back (exports)

The same CLI writes standard files for the next tool. On an `orbit` scenario,
`--export-oem <file>` writes a CCSDS OEM 2.0 ephemeris with velocity (the file GMAT,
Orekit and STK read), `--export-sp3 <file>` an SP3 (Standard Product 3) precise
ephemeris and `--export-omm <file>` a CCSDS Orbit Mean-Elements Message catalogue.
`--export <czml|kml|geojson|stk|sigmf|all|list>` covers the viewers: CZML (Cesium
Language), KML (Keyhole Markup Language, for Google Earth), GeoJSON, STK ephemeris
files (`.e`, one per satellite plus the user), and SigMF (Signal Metadata Format)
recordings from the `spectrum` kind. `--export list` says which apply to a scenario.
For the Moon, the `lunar-interop-export` kind emits the lunar frame, time scale and
ephemeris as a CCSDS OEM with a conformance check. See [INTEROP.md](../INTEROP.md).

## Why this is the glue, not a competitor

Each step is a small, auditable, reproducible scenario with an explicit scope label.
The high-fidelity tools own trajectory optimisation, six-degree-of-freedom (6-DoF)
AOCS and aerothermal entry, descent and landing (EDL); Kshana owns the **open,
citable, runnable connective tissue**: ingest the standard formats, answer the
cross-cutting geometry and feasibility questions, and hand the result on, at a tier
any partner can run without a licence. See also the companion mission-analysis kinds
`launch-window`, `reentry`, `eo-coverage`, `space-packet` and `attitude-budget`.
