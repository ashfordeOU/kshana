# Pre-registration: the masked-skyline addendum to the UERE x DOP Monte Carlo (FUT-01)

Committed alone, before the two geometries below have been built or run. The 0.36 geometry design
note (section 5.2, `docs/design/2026-10-12-geometry-and-skyline-design.md` on design/0.36-geometry)
states that `tests/uere_dop_monte_carlo.rs` runs the 8 geometries of `tests/dop_reference.rs` "plus
two masked-skyline geometries from item 1". The 8 ran under the pre-registration e50c88d2 (104
checks, all passed); this file fixes the two masked ones. The 8 and their recorded result are not
touched.

## The two geometries (fixed now, by rule)

Start from the `10sat-mixed` row of `tests/fixtures/dop/dop_reference.csv` (ten satellites, the
fixture's elevations and azimuths). Keep a satellite when its elevation is at or above the skyline's
own cut at its azimuth (`kshana::skyline::Skyline::cut_deg`; no receiver mask), under:

* M1: the `city-street` preset;
* M2: the `container-terminal` preset.

Same user as the 8 (geocentric latitude 45 deg, longitude 10 deg, radius 6371 km). Geometry index 8
for M1 and 9 for M2, so their seeds are `ChaCha8Rng::seed_from_u64(36 + 8)` and `(36 + 9)`, the next
in the existing derivation. N = 20,000 epochs, sigma = 1.5 m, solved by `pvt::solve_spp` from the true
position, exactly as the 8.

If a rule leaves fewer than four satellites, or a singular geometry, that geometry is recorded as
"not evaluable" and counts as not passing; no other sky is substituted.

## Bars (fixed now)

The five tolerances of `kshana::dop_error_mc::TOLERANCES`, unchanged, on each of M1 and M2: each
ENU and clock variance against sigma^2 Q_ii (relative 5 %); RMS against sigma x HDOP, VDOP and PDOP
(relative 2.5 %); east-north correlation (absolute 0.035); the mean error per axis (5 sigma_i /
sqrt(N)); the fraction inside the 95 % horizontal ellipse (0.95 +- 0.0077). A failed check is
recorded with its numbers, not tuned away. The row stays MODELLED (InternalConsistency) whatever the
outcome: it checks the estimator against the closed form of the same model on masked skies.
