# Lunar time scales, frames, terminology and model provenance

`kshana lunar-ref` gathers the lunar reference conventions kshana uses: the time scales with TCL,
the lunar body-fixed frames with ILuRF, a terminology registry and a provenance manifest of the
geodetic models. Source: `src/lunar_timescale.rs`, `src/lunar_frames.rs`, `src/lunar_ref.rs`,
`data/lunar/terminology.json`, `data/lunar/geodetic-models.json`. MODELLED throughout.

```
kshana lunar-ref tcb-tcl --jd 2460676.5
kshana lunar-ref approx --window 2456658.5,2462867.5 --grid-days 1
kshana lunar-ref convert --from tcl --to tt --jd 2460676.5
kshana lunar-ref transform --from MOON_ME --to MOON_PA_DE440 --xyz 1737400,0,0 --jd 2460676.5
kshana lunar-ref terms
kshana lunar-ref models --check
```

## TCB − TCL

At first post-Newtonian order, `d(TCB − TCL)/dTCB = (U_ext + v²/2)/c²` at the Moon's centre:
`U_ext` the potential of the Sun, the planets and the Earth, `v` the Moon's barycentric velocity.
kshana evaluates it from the Standish approximate elements (1800-2050, every planet and the
Earth-Moon barycentre, the Sun's barycentric motion from the IAU 2009 mass ratios) and the analytic
lunar series, and integrates it from `T0` (1977-01-01T00:00:32.184 TT).

**Check.** The same integrand at the geocentre gives `L_C`; over 2000-2030 it agrees with the IERS
Conventions (2010) value 1.48082686741e−8 within 2e−12, the bound every lunar rate here carries.
The lunar mean rate exceeds it by about 1.47 µs/day, the published TCG−TCL rate the repository
already cites (`src/lunar_time.rs`). TCB−TCL at J2000 is about 10.76 s.

**Origin.** TCL is taken to read TCB at `T0` at the Moon's centre; the IAU 2024 resolution's own
origin convention is to confirm. A different origin shifts TCB−TCL by a constant.

**Analytical approximation.** `approx` fits `c + L·Δt` and twelve periodic terms (the anomalistic
year and its second and third harmonics, the synodic month and its half, the anomalistic month,
the evection, the 411.8-day beat, and the synodic periods of Jupiter, Venus, Mars and Saturn) by
least squares to the integral, and reports the largest and RMS error on the fit grid. Over
2014-2030 on a one-day grid the largest error is about 13 µs (RMS about 5 µs); the tests check that
the bound also holds, within 50 %, on a quarter-day grid offset by an eighth of a day that the fit
never saw.

## Swappable time scale

`convert` carries an epoch between TT, TDB, TCB, TCG, TCL and LTC (the lunar-surface time model of
`src/lunar_time.rs`, origin J2000) through TT and TCB, with the IAU defining constants (`L_G`,
`L_B`, `TDB0`). TT to TDB uses the two-term series of `src/timescales.rs` (a few tens of
microseconds). Epochs are a whole Julian day plus seconds, so seconds keep their resolution.
Regression evidence: every pair of scales round-trips within 2 µs at a 2025 epoch, TCG−TT is
0.5058 s and TCB−TDB 11.2537 s at J2000.

## Frames and ILuRF

| frame | axes |
|---|---|
| `ICRF` | ICRF axes, lunar-centred |
| `MOON_PA_DE440` | DE440 principal axes (embedded series, 2014-2030) |
| `MOON_PA` | analytic principal axes (IAU 2015 series and DE421 ME→PA angles) |
| `MOON_ME` | mean Earth / polar axis (IAU 2015 WGCCRE) |
| `ILURF` | International Lunar Reference Frame: ME axes (to confirm) through a 7-parameter datum |

No published ILuRF definition or realisation parameters were read. ILuRF is carried as frame
plumbing whose default realisation is a zero datum from `MOON_ME`, labelled a placeholder in every
output; an estimated realisation (`src/lunar_frame_realise.rs`) or a published one replaces it.

## Terminology and provenance

`terms` lists each term the lunar modules use, with its status (adopted, recommended standard,
proposed, in development, modelled) and source. `models` lists every lunar geodetic model and
constant with its source and the modules using it; `--check` verifies the SHA-256 of the files the
manifest names (exit 1 on a mismatch).

## Not built

A LUNEX (Lunar Unified Navigation EXchange) parser: the IGS RINEX Committee proposed the format at
the February 2026 Cislunar PNT Workshop, but no format content has been published.
