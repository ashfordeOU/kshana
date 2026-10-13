# Pre-registration: CR3BP rotating states to Moon-centred ICRF (MCI) on the DE440 Earth-Moon line (RM-34, FUT-06, CAP-29a)

Written 2026-10-13 and committed alone, before the code exists and before the comparison runs.

## What is built

`cr3bp::to_moon_centred_icrf(s, mu, moon_geo)` and its inverse
`cr3bp::from_moon_centred_icrf(r, v, mu, moon_geo)`. `s` is a nondimensional rotating-frame
state (barycentre origin, Moon at `(1 - mu, 0, 0)`). `moon_geo` is the geocentric Moon state
`(r_m, v_m)` (m, m/s, ICRF) at the epoch. The map is the instantaneous ("pulsating") one:

* axes `x = r_m / |r_m|`, `z = (r_m x v_m) / |r_m x v_m|`, `y = z x x` (rotation matrix `C`,
  rotating to ICRF);
* length `l = |r_m|`, rate `w = |r_m x v_m| / l^2`, `ldot = r_m . v_m / l`;
* `rho = (x - (1 - mu), y, z)` (Moon-centred, nondimensional), and
  `r = l C rho`, `v = C (ldot rho + l w (v_nd + e_z x rho))`.

Also `cr3bp::to_moon_centred_icrf_de440(s, mu, kernel, jd_tdb)`, which reads `moon_geo` from a DE440
SPK through `KernelEphemeris`. The MCMF position follows from the existing
`lunar::try_mci_to_mcmf_de440`. Nothing existing changes.

## Oracle

The NAIF SPICE Toolkit (CSPICE N0067 through spiceypy 8.3.0) with a two-vector dynamic frame
`EM_ROT` defined in a frame kernel written for this test: primary axis +X along the Moon's
position wrt the Earth, secondary axis +Y along the Moon's velocity wrt the Earth (both from
`de440s.bsp`, `J2000`, no aberration correction). This realises exactly the axes above, and
`sxform('EM_ROT', 'J2000', et)` gives the 6x6 state transform including the frame's angular
velocity. For each case the generator
(1) builds the dimensional rotating state `(l rho, ldot rho + l w v_nd)` from SPICE's own
`spkezr('MOON', et, 'J2000', 'NONE', 'EARTH')`; and
(2) applies `sxform`, writing the resulting MCI state.
It calls no Kshana code.

Cases (fixed now): 12 epochs, 2025-01-01 00:00 TDB plus k x 2.5 days (k = 0..11), times six
states each: the L1 and L2 points (velocity zero), and the API initial states of members 0 and
10 of the L2 southern halo and member 0 of the DRO family in
`tests/fixtures/cr3bp_families_jpl/` (already committed), plus `(1 - mu + 0.1, 0.05, 0.02, 0.01,
-0.02, 0.03)`. `mu` = 1.215058560962404e-02 (the API's).

## Bars

At every case, engine (`to_moon_centred_icrf_de440` on the same `de440s.bsp`) against SPICE:

1. position within **1 mm**;
2. velocity within **1e-6 m/s**;
3. the inverse returns the input nondimensional state within **1e-12** (internal; also checked).

## Outcome rule

1 and 2 hold: a new row "CR3BP rotating states mapped to Moon-centred ICRF on the DE440
Earth-Moon line" is VALIDATED as a Library check of the transform against SPICE. It is not a
claim that a CR3BP orbit matches a real trajectory; that is CAP-29d, a separate measurement.
Either fails: a finding with its numbers, and no row. No bar is moved.
