# Cross-Provider Inter-Ephemeris Fixtures — Provenance Notice

These fixtures capture the real, measurable disagreement between three **independent
authoritative lunar/planetary ephemerides** — the only genuine "multiple providers" of a
lunar reference frame + dynamics that exist today. They anchor the P2 cross-provider
interoperability error budget (`src/lunar_interop_budget.rs`).

## Providers (independent families)

| Provider  | Institution | Reference | Kernel file |
|-----------|-------------|-----------|-------------|
| DE440     | JPL (NASA)  | Park, R. S. et al. (2021), "The JPL Planetary and Lunar Ephemerides DE440 and DE441", *AJ* 161:105, doi:10.3847/1538-3881/abd414 | `de440s.bsp` |
| INPOP21a  | IMCCE (Observatoire de Paris) | Fienga, A. et al. (2021), INPOP21a release, IMCCE technical note | `inpop21a_TDB_m100_p100_littleendian.dat` |
| EPM2021   | IAA RAS (Russia) | Pitjeva, E. V. et al., EPM2021 (Ephemerides of Planets and the Moon) | `epm2021.bsp` |

## What is vendored (and what is not)

Only the **sampled derived positions** (`moon_geo.csv`, `planet_ssb.csv`) and the computed
**reference decomposition** (`reference.json`) are vendored. The ephemeris **kernels are NOT
vendored** (they are large and redistribution terms vary); this mirrors the
`tests/fixtures/llr_geometry/de440_moon_pa.csv` convention. Public kernel sources:

- DE440s:   https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp
- INPOP21a: https://ftp.imcce.fr/pub/ephem/planets/inpop21a/inpop21a_TDB_m100_p100_littleendian.dat
- EPM2021:  https://ftp.iaaras.ru/pub/epm/EPM2021/SPICE/epm2021.bsp

Regenerate with `scripts/gen_interop_ref.py` (reads the kernels via IMCCE `calceph`; set
`KERNELS=/dir/with/kernels`). All three positions are computed in the ICRF/J2000 frame,
TDB timescale, so they are directly comparable.

## Sampling

- **Window:** 2024-01-01 .. 2025-12-31 (TDB), 2-day cadence, 366 epochs.
- **`moon_geo.csv`:** geocentric Moon (NAIF 301 wrt 399), metres. Columns `day,provider,x_m,y_m,z_m`.
- **`planet_ssb.csv`:** Mercury/Venus/Mars/Earth-Moon-barycentre (NAIF 1,2,4,3 wrt SSB 0), metres.
  Columns `day,provider,body,x_m,y_m,z_m`. Used to estimate the common ICRF frame-tie rotation.

## Reference decomposition (`reference.json`)

Per provider pair, computed by the independent SciPy oracle in `scripts/gen_interop_ref.py`
and reproduced by `src/lunar_interop_budget.rs` in `tests/lunar_interop_budget_reference.rs`
(the Validated row): raw disagreement, rotation-fit residual, the Moon rotation `theta_moon`,
the common planet frame-tie `theta_frametie`, the Moon-specific excess `theta_excess`, and the
reducible (frame-tie) / irreducible (Moon-orbit dynamics) metre split. Headline (2024–25):

| pair               | raw    | after rotation | reducible (frame-tie) | irreducible (dynamics) |
|--------------------|--------|----------------|-----------------------|------------------------|
| DE440–INPOP21a     | 2.40 m | 0.14 m         | 0.88 m (2.30 nrad)    | 1.87 m (4.88 nrad)     |
| DE440–EPM2021      | 2.01 m | 0.28 m         | 0.43 m (1.12 nrad)    | 2.41 m (6.26 nrad)     |
| INPOP21a–EPM2021   | 0.72 m | 0.21 m         | 1.02 m (2.66 nrad)    | 0.59 m (1.53 nrad)     |

**Interpretation (see the P2 manuscript for the honest split caveat):** the cross-provider
disagreement is an *orientation* effect — a constant frame rotation explains **71–94 % of the
disagreement by amplitude** `(raw − rot_residual)/raw` (94 % DE440–INPOP21a, 86 % DE440–EPM2021,
71 % INPOP21a–EPM2021), i.e. **91–99.7 % of the variance** `1−(rot_residual/raw)²` — that
decomposes into a **reducible common ICRF frame-tie** (removed by adopting a common frame
realization) and a **Moon-specific excess rotation** (a real difference in the modelled lunar
orbit orientation, removable only by a common designated ephemeris). Attributing the
planet-common rotation to a frame-tie is a stated modelling interpretation; the
convention-free claim is the Moon-*excess* rotation, which no whole-frame choice can remove.

## License note

Published scientific ephemeris positions are factual constants and are not copyrightable;
the derived sample points here are cited per good scholarly practice with full attribution to
JPL, IMCCE, and IAA RAS above.
