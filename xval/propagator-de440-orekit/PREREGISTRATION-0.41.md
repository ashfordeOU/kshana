<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D11 (0.41): the DE440 Sun and Moon bar, re-run after the time and frame chain is fixed

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are new; every other number is a bar of
[`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory and is not changed.

## Why this row

The DE440 ephemeris tier of the propagator agreed with Orekit 12.2 at orbit level (worst 0.017 m and 1.8e-5 m/s, bar
0.5 m and 5e-4 m/s), but **bar 1 missed** ([`RESULTS.md`](RESULTS.md)): Sun 6.393 m and Moon 0.2445 m against 3 m and
0.2 m. A post-hoc diagnostic (`spice_diagnostic.py`) read the same kernel with SPICE at SPICE's exact TT to TDB and found
almost the same gap to Orekit (6.255 m, 0.2399 m), while kshana and SPICE agree to 0.14 m and 5 mm. The gap therefore
lies between the NAIF kernel path and Orekit's DE440 reader on its own file, in the time scale, the frame or the reader.
Both sizes match about 0.2 ms of motion. The cause was not isolated. Roadmap item D11 is to re-run after the chain is
fixed.

## What stays

- Bars 1 to 3 exactly as registered: |dSun| at most **3 m** and |dMoon| at most **0.2 m** at every output epoch; orbits
  |dr| at most **0.5 m** and |dv| at most **5e-4 m/s** on every state of every case; the analytic-series control must miss
  the 24 h Orekit state by more than **1 m**.
- The cases (D1 LEO, GEO, HEO; D2 LEO, GEO), epoch 2024-03-19 00:00 TT, 24 h, 25 hourly states, the cut kernel
  `de440s_2024-03-18_2024-03-23.bsp` (SHA-256 `c1c7feea...49f2`), Orekit 12.2 with Hipparchus 3.1 and orekit-data's
  `lnxp1990.440`.

## What changes, and the order

1. **Diagnosis first, committed before any fix.** A diagnostic, labelled as such, that compares, at the 25 epochs,
   (i) the TT to TDB offset each side uses, (ii) the frame each side's Sun and Moon are expressed in, and (iii) Orekit's
   positions read from `lnxp1990.440` against SPICE positions read from the same `lnxp1990.440` converted to SPK by
   NAIF's public tools, if that conversion is available. Its output names the step where the 0.2 ms (or the frame
   rotation) enters. The diagnostic changes no bar.
2. **The fix**, in one commit, on the side the diagnosis names:
   - **kshana side**: the change is made in kshana and must keep kshana's agreement with SPICE (bar K below).
   - **Oracle side** (the Orekit driver's configuration, for example the time scale it is given): allowed only if the
     diagnosis shows the driver was not computing the quantity bar 1 names, and the change is justified from Orekit's
     public documentation, quoted in the commit. The driver change is applied to every case, not only bar 1. **Owner
     decision 1** confirms whether an oracle-side fix is admissible.
3. **The re-run**, once: the full original comparison (bars 1 to 3) on the original fixture, regenerated with the fixed
   chain. The result is committed and pinned; the original miss stays in `RESULTS.md`.

## New bar (guard against fixing in the wrong place)

| Id | Statement | Bar (*proposed*) | Basis |
|---|---|---|---|
| K | kshana's Sun and Moon against SPICE on the same cut kernel at SPICE's exact TT to TDB, every epoch | |dSun| at most **1 m**, |dMoon| at most **0.03 m** | the original file's own error budget for kshana's two-term TDB series (about 1 m on the Sun, 3 cm on the Moon); the recorded agreement is 0.14 m and 5 mm |

K stops a fix that makes kshana agree with Orekit by moving it away from SPICE.

## Verdict

Bar 1 is recorded as met on re-run only if bars 1, 2, 3 and K all hold. If bar 1 still misses, the result is published
with the diagnosis and the row stays MODELLED with both misses recorded.

## What a result would and would not mean

MET would say the tier's Sun and Moon agree with an independent DE440 reader within the registered bars once both sides
are on the same time scale and frame, and that the 2024 miss came from that chain. It would not validate DE440 itself
(both sides read the same JPL integration), kernels outside the cut window, or any Earth-orientation path.

## Owner decisions at sign-off

1. Whether a fix on the oracle side (the Orekit driver) is admissible, under the rule in step 2.
2. The guard bar K.
