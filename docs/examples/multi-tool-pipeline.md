<!-- SPDX-License-Identifier: Apache-2.0 -->
# Worked example — Kshana as the multi-tool mission-analysis glue layer

This walks one trajectory through the standards-based interop and mission-analysis
scenario kinds end-to-end, showing how Kshana sits *between* the high-fidelity tools
a programme already uses (GMAT, Orekit, STK for trajectory design; Basilisk/42 for
AOCS) rather than competing with them. Every step is a runnable scenario kind and
every output is **MODELLED** with its scope stated on the artifact.

> Honesty note: this is a *geometry/analytic* pipeline at the pre-Phase-A / trade-study
> tier. It is not a flight-dynamics certification — see each kind's `label` field.

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

## 1. Ingest the trajectory a designer produced (`oem-interop`)

GMAT, Orekit and STK all *export* CCSDS Orbit Ephemeris Messages. Kshana imports
them — the other direction of the bridge — so a Kshana analysis can start from the
exact orbit the trajectory designer signed off, not a re-derived approximation:

```sh
kshana scenarios/oem-interop.toml          # round-trips a reference orbit (self-test)
# or, to ingest a real file, set oem_text in the scenario to the external OEM
```

It reports the segments/objects/frames/epoch span and a velocity-consistency check,
proving the ephemeris was ingested faithfully (round-trip fidelity ~1e-7 km).

## 2. When is it visible from a ground station? (`passes`)

```sh
kshana scenarios/passes.toml
```

Predicts the rise/set passes (AOS / TCA / LOS, maximum elevation, duration) over a
station above an elevation mask, plus total access time — the ground-segment planning
query. (Keplerian propagation + Earth rotation; use an SGP4 propagator for
operational fidelity.)

## 3. Does the contact close? (`link-budget`)

For a pass, feed the slant range and the terminal figures into the CCSDS 401 /
DSN 810-005 link equation:

```sh
kshana scenarios/link-budget.toml
```

Reports free-space path loss, C/N₀, Eb/N₀, margin and whether the link **closes**
against a required Eb/N₀ — the comms feasibility check that turns "it's visible" into
"we can actually downlink the data."

## 4. How fast does the environment decay it? (`space-weather`)

```sh
kshana scenarios/space-weather.toml
```

Drives thermospheric neutral density from the solar (F10.7) and geomagnetic (Kp)
activity via the Jacchia-71 exospheric temperature — the ~5–10× solar-cycle density
swing the static atmosphere omits — so an orbit-lifetime / drag estimate reflects the
space-weather regime, not a fixed atmosphere.

## Why this is the glue, not a competitor

Each step is a small, auditable, reproducible scenario with an explicit honesty
label. The high-fidelity tools own trajectory optimisation, 6-DoF AOCS and aerothermal
EDL; Kshana owns the **open, citable, runnable connective tissue** — ingest the
standard formats, answer the cross-cutting geometry/feasibility questions, and hand
the result on — at a tier any partner can run without a licence. See also the
companion mission-analysis kinds `launch-window`, `reentry`, `eo-coverage`,
`space-packet` and `attitude-budget`.
