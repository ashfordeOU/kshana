# Opt-in in-crate DE440 lunar environment against ANISE: results

Pre-registration: `PREREGISTRATION.md` (committed alone at `ea537710`). Code: `1b092c0d`
(`lunar_frame::try_icrf_to_moon_pa_de440`, `lunar::try_mci_to_mcmf_de440` and its inverse,
`lunar_od::De440LunarEnvironment`). Harness: `xval/anise-lunar-od/src/bin/in_crate_parity.rs`.
Run 2026-10-13 on `de440s.bsp` (SHA-256 `c1c7feea...`) and `moon_pa_de440_200625.bpc`
(`60cd55aa...`), after the ME->PA offset fix (`8a7667e8`), which does not touch either
environment.

## Against the bars (241 LRO epochs)

| Comparison | Result | Bar | Verdict |
|---|---|---|---|
| 1. Orientation, in-crate vs ANISE `MOON_PA_DE440` | worst 3.510e-7 rad | 2.0e-6 rad | holds |
| 2. Geocentric Moon | worst 1.111 m | 0.1 m | **NOT MET** |
| 2. Geocentric Sun | worst 30.72 m | 2 m | **NOT MET** |
| 3. LRO raw overlap | 41.483 vs 41.483 m (0.0008 m) | 0.10 m | holds |
| 3. LRO dynamic | 11.959 vs 11.959 m (< 1e-4 m) | 0.10 m | holds |
| 3. LRO reduced-dynamic | 6.665 vs 6.665 m (< 1e-4 m) | 0.10 m | holds |

All four fits converged.

**Outcome (pre-registered rule): 2 fails, so no new row is added.** The environment stays
opt-in and labelled, and its doc comment states these numbers. 3 holds: the in-crate DE-grade
path reproduces the ANISE fits to the millimetre.

## Post-hoc diagnostic (information, not part of the verdict)

The Sun and Moon gaps have the ratio of their geocentric speeds (30.72 m / ~29.8 km/s and
1.111 m / ~1.07 km/s both give about 1.04 ms), so the two sides read the kernel about 1 ms
apart. Afterwards, the crate's `KernelEphemeris` was compared with SPICE `spkgeo` on the same
`de440s.bsp` at three epochs of 2022-01-01, at ET = (JD - 2451545) x 86400 s. They agree within
2 mm. The offset is therefore on the ANISE side of the harness (`Epoch::from_jde_tdb` in
`AniseLunarEnvironment`), not in the crate's reader. A future check of this environment should
pre-register SPICE, not ANISE, as the ephemeris oracle. The bar is not moved here.

## Information only

`tests/agency_lro.rs::lro_fit_with_the_opt_in_de440_environment` (ignored by default, about
200 s) runs the opt-in environment on a committed de440s cut
(`tests/fixtures/lunar_od_de440/`, 5 120 bytes, bit-for-bit with the full file): dynamic
11.959 m and reduced-dynamic 6.665 m, the same as with the full kernel. The analytic default
after the ME->PA fix gives 12.049 and 6.668 m.
