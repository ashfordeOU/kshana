# Results: the oblate-Earth SRP shadow against Orekit 12.2

First comparison run 2026-10-13 after the pre-registration (6d6d269c), fixture committed unchanged
(68f2d791). Test: `tests/srp_oblate_shadow_orekit_oracle.rs`.

| bar | measured | pre-registered | outcome |
|---|---|---|---|
| 1. Oblate (WGS-84) lit fraction, 2400 geometries | worst 7.41e-9 | ≤ 1e-6 | **AGREES** |
| 2. Spherical baseline (`forces::conical_shadow`) | worst 2.24e-9 | ≤ 1e-6 | **AGREES** |
| 3. Sensitivity: Orekit WGS-84 vs sphere | up to 0.980 | > 1e-2 | **met** |

884 of the 2400 geometries are in penumbra. Status: the oblate-Earth shadow is VALIDATED; the
limb-darkened variant has no external oracle and stays MODELLED.
