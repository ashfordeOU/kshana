# reentry_point_mass_reconstruction_oracle fixture

Used only by `tests/reentry_point_mass_reconstruction_oracle.rs`; not shipped in any published package.

## What is here

- `reconstructed_entries.txt`: for each included entry, the printed entry-interface state, the
  printed mass, diameter and hypersonic-continuum drag coefficient that fix the ballistic
  coefficient by the pre-registered rule, and the printed best-estimated-trajectory maximum
  deceleration. Facts cited with attribution; no paper is copied. Generator: none (the numbers
  are typed from the sources below; each line names its source).

## Sources (all NASA Technical Reports Server, distribution public, retrieved 2026-10-02)

| NTRS id | Reference | PDF SHA-256 |
|---|---|---|
| 20080008567 | Desai and Qualls, "Stardust Entry Reconstruction", AIAA 2008-1198 | f4e0741ec7b44ee84a34c8fb82f4de6ffe6b589a7d97e51f81464de2dd8e6c3e |
| 20040105538 | Mitcheltree, Wilmoth, Cheatwood, Brauckmann and Greene, "Aerodynamics of Stardust Sample Return Capsule", AIAA 97-2304 | f58e78ca6c37c7e883829003669cbccb04f37f87d120683050628755d5034eee |
| 20080019649 | Desai, Qualls and Schoenenberger, "Reconstruction of the Genesis Entry" (AIAA journal version) | 05ffe3a74600d86eedbd9d3a393dbcabe7cec8ff0a77cd2a99a0e73f79ebcee0 |
| 20080010667 | the same authors, "Reconstruction of the Genesis Entry", GT-SSEC.C.1 | a4bb0768a0c95326074af7fe34197c3dc4e1598977d481a5fa3531199daa7f35 |
| 20050217463 | the same authors, "Trajectory Reconstruction for the Genesis Entry", IPPW-3 | 13a1080111662de560778b9b4912222405b8279006ce665304ed5e49238b1194 |
| 20050060761 | Desai, "Entry, Descent, and Landing Operations Analysis for the Genesis Re-Entry Capsule", AAS 05-121 | 3814e54006f063596e1d5077fbc9446350b5771ff9e65417bf23f9331c0e21d9 |
| 20050050931 | Desai and Cheatwood, "Entry Dispersion Analysis for the Genesis Sample Return Capsule", AAS 99-469 | 83f9c068399eeac8eca2b4b848c0a7b5bc716c369420019b38dfe755e86241ca |

Hayabusa candidates read and not used (no reconstructed peak deceleration printed): NTRS
20110015027, 20110013225, 20160000307.

## Caveat

Neither capsule carried an accelerometer that survived into these reconstructions; each best
estimated trajectory is the project's entry simulation with a small drag multiplier fitted to the
navigation state at entry and to radar tracking near drogue deployment (Stardust +0.83 %;
Genesis -8.1 %).
