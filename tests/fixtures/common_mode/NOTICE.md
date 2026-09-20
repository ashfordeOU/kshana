# Common-Mode Integrity Anchor — Provenance Notice

This fixture is the evidence behind the **Modelled** verification-matrix row for the P3
common-mode integrity module (`src/lunar_common_mode.rs`), reproduced by
`tests/lunar_common_mode_integrity_reference.rs`.

## What is and is not claimed (read carefully)

The check here is that the engine's parity-projection / least-squares linear algebra
(`kshana::lunar_common_mode::common_mode_split`, built on `geometry_from_los`) reproduces
an **independent numpy computation** of the same common-mode split, to relative error
< 1e-3 **and** absolute error < 1e-3 (metres / dimensionless), on inputs derived from
**real** inter-ephemeris data.

**This row is `Modelled`, not `Validated`, and the distinction is deliberate.** An earlier
draft of this notice called it the single Validated row. That would have been an
overclaim under this repository's honesty firewall
(`verification::tests::validated_rows_require_an_external_oracle`, which requires
`Validated` to rest on an `ExternalDataset` oracle). The real DE440 / INPOP21a / EPM2021
disagreement is an **input both sides receive**, not an independent check of the answer:
numpy evaluates the same formula on the same numbers, so it corroborates the
*implementation* and not the *model*. The oracle kind is therefore `ReferenceImpl`, and
the status is `Modelled`. The constellation geometry below is a Modelled construction on
top of that.

The lunar **constellation geometry is Modelled**, not an external oracle:

- **User:** a fixed point on the mean lunar surface, `[1737400.0, 0, 0]` m in a
  Moon-centred frame (Up = +x, East = +y, North = +z at the user).
- **Satellites:** 8 LCNS-like nodes at a 5000 km slant range from the user,
  spread across the visible hemisphere at these (azimuth°, elevation°) in the user's
  local ENU frame: [(0.0, 80.0), (60.0, 45.0), (120.0, 30.0), (180.0, 55.0), (240.0, 25.0), (300.0, 50.0), (30.0, 15.0), (210.0, 70.0)].
- Eight well-spread lines of sight give a full-rank RAIM geometry (dof = 8 − 4 = 4).
  The exact positions are cosmetic: a common-mode translation projects into range(G) for
  **any** full-rank geometry, so `blind_fraction ≈ 1` regardless of these values — that is
  precisely the invariance being demonstrated.

## Real data reused (the only external ingredient)

`Delta_s(t) = pos_A(t) − pos_B(t)` is the **real** geocentric-Moon disagreement between two
independent authoritative ephemerides, read directly from the sampled Moon states in
`../inter_ephemeris/moon_geo.csv`. See that directory's **`NOTICE.md`** for full provenance
(DE440 / JPL, INPOP21a / IMCCE, EPM2021 / IAA RAS; 2024–2025, 2-day cadence, 366
epochs). This fixture cites and reuses those states; it vendors no new ephemeris data.

Pairs used: `DE440-INPOP21a` and `DE440-EPM2021` (A − B, A = DE440).

## The measurement model

A user mixing the two providers sees a common-mode measurement error on satellite *i*
    `dy_i = e_i · Delta_s(t)`,   `e_i = unit(sat_i − user)`  (`kshana::orbit::los_unit`).
With RAIM rows `g_i = [−e_i, 1]`, a common shift satisfies `dy = G · [−Delta_s ; 0]`
exactly, so it lies in `range(G)`: the parity residual is ~zero and the user absorbs
≈`Delta_s` as a position error.

## Honest headline

The real, ~metre-level inter-ephemeris Moon-position disagreement is absorbed almost
entirely as **user position error** (median blind position error per pair below) with a
**near-zero parity residual** — i.e. it is **invisible to snapshot RAIM/ARAIM**. This is
the correct, known blindness of all snapshot RAIM to `range(G)` errors; the contribution
here is quantifying it on a real inter-ephemeris floor.

| pair | median blind_fraction | median blind position error | median detectable (parity) norm |
|------|----------------------:|----------------------------:|--------------------------------:|
| DE440-INPOP21a | 1.000000 | 2.3955 m | 2.692e-15 m |
| DE440-EPM2021 | 1.000000 | 2.0050 m | 2.334e-15 m |

## Byte-consistency

Every position (user, satellites, and each `Delta_s`) is rounded to 6 decimals (1 µm)
**before** being both written to `reference.json` and fed to the numpy oracle; the derived
per-satellite `delta_y` is stored and consumed verbatim by both sides. The Rust test reads
the identical `user`, `sats`, and `delta_y` from `reference.json`, so the only difference
between engine and oracle is the 4×4 linear solver, which agrees far inside 1e-3.

## Regenerate

`.venv/bin/python scripts/gen_common_mode_ref.py` (needs only numpy; reuses the vendored
`../inter_ephemeris/moon_geo.csv`, no kernels or network).

## License note

Published scientific ephemeris positions are factual constants and are not copyrightable;
the reused Moon states are attributed to JPL, IMCCE, and IAA RAS via the inter_ephemeris
NOTICE.md. The Modelled constellation is an original deterministic construction.
