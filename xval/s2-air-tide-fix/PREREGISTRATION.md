# Pre-registration: the S2 air-tide coefficient fix (tides::atmospheric_tide)

Committed alone, before the change is made. It fixes what the change is, which outputs it may
move and by how much, and the external check the corrected conversion must pass. Expectations
are not changed after the run; a miss is recorded in `RESULTS.md` with its numbers.

## The two defects

`tides::atmospheric_tide` converts Ray (2001)'s S2 air-pressure harmonics
(`tools/s2air_ray2001.dat`: n ≤ 4, prograde and retrograde amplitude D in µbar, phase ψ in degrees)
to normalized Stokes coefficients with the IERS 2010 Eqs. 6.20–6.21 surface-load formula.

1. **Normalisation.** It uses Ray's amplitudes as if they were coefficients of the fully
   normalised P̄nm. They are coefficients of the unnormalised Pnm, so each must be divided by
   N_nm = √((2 − δ_m0)(2n + 1)(n − m)!/(n + m)!) (for (2,2), N = 0.6455; the amplitude rises 1.549×).
2. **Phase convention.** It uses Ray's phase ψ as the IERS phase ε of Eq. 6.20
   (C̄ = Ĉ sin ε, S̄ = Ĉ cos ε, i.e. Ĉ sin(θ + mλ + ε), a sine lead). Ray's ψ is the Greenwich
   phase lag of a cosine (D cos(θ ± mλ − ψ), the IERS Eq. 6.17 form), so ε = 90° − ψ.

**Evidence.** R. Biancale and A. Bode, *Mean annual and seasonal atmospheric tide models based on
3-hourly and 6-hourly ECMWF surface pressure data*, GFZ Scientific Technical Report STR06/01 (2006),
doi:10.2312/GFZ.b103-06011 (PDF read from https://webdoc.sub.gwdg.de/ebook/serien/tm-v/STR/0601.pdf,
SHA-256 890865aee3488bad52e7a3aed6cfd515279d8e72f20dc9e5930aec50e26f770b, not vendored). Its tables
are stated in fully normalised harmonics, as equivalent water height (ρw = 1025 kg/m³), with phases
as sine leads (its Eq. 6 and the text after it); model A2 of its Table 5 is Ray (2001). Converting
every one of Ray's 21 waves (12 prograde, 9 retrograde) as Ĉ = D·(0.1 Pa/µbar)/(ρw g)/N_nm and
ε = 90° − ψ reproduces the A2 amplitude and phase of that wave in Table 5 within the table's
printed rounding, 21 of 21 (for example (2,2) prograde: 0.5626 cm and 157.15°, printed 0.563 cm and
157.2°). The current reading (D used as normalised, ε = ψ) matches 0 of 21. IERS Conventions 2010
chapter 6 (https://iers-conventions.obspm.fr/content/chapter6/icc6.pdf, SHA-256
abb3c0b0b6d2079b19893d6872a9d8e7320516d9a4736acb5eecaa79c4543388), Eqs. 6.17–6.21, fixes the
convention the corrected code follows.

## The change

In `atmospheric_tide`: divide each pressure amplitude by N_nm, and take ε± = 90° − ψ± (so
C̄± ∝ D± cos ψ±, S̄± ∝ D± sin ψ±). Nothing else changes: the Doodson argument, the load Love numbers,
the Eq. 6.21 factor and the prograde/retrograde combination are kept. The opt-in S1 air tide is a
separate, new function and is not part of this change.

## External check (VALIDATED if met)

A new test transcribes Table 5 model A2 for Ray's 21 waves (n ≤ 4) and requires the normalised
amplitude and sine-lead phase the corrected code uses for each wave to agree with it within
**0.0006 cm** in amplitude and **0.1°** in phase (the printed rounding is 0.0005 cm and 0.05°).
21 of 21 must pass.

## Expected effect on outputs (fixed now)

Only outputs that evaluate `tides::atmospheric_tide` can move: `tides::tidal_acceleration`, and
through it `propagator::ForceModel` and `precise_od::PreciseForceModel` with tides enabled.

1. `atmospheric_tide`: every (n, m) term changes. The magnitude of each prograde-only (m = 0) term
   scales by exactly 1/N_n0 (1.247, 1.508, 1.732 for n = 2, 3, 4); the (2,2) term, which dominates,
   peaks about 1.55× higher (~6e-11 instead of ~4e-11) and keeps its 12 h period.
   `tests/tides_iers.rs::atmospheric_s2_tide_amplitude_is_physical` (band 1e-11 to 1e-10) still passes.
2. The agency precise-orbit fits that enable tides, re-run on their CI fixtures before and after:
   Galileo E11 Tier 1 (recorded 0.132 m, C_R 1.174) and Tier 2 (0.070 m); Swarm-A reduced-dynamic
   (0.098 m). Expected: each post-fit 3D RMS and RTN component moves by **less than 5 mm** and C_R by
   **less than 1e-3**; no pass/fail bar of those tests (the 5 m green bar and the tier checks)
   changes outcome. A larger move is a finding to investigate before landing. The full-arc dispatch
   runs are not re-run here and are recorded as not re-run.
3. **Everything else is byte-identical**: the solid-Earth and ocean tide terms, every output that
   does not enable tides, the registry and cross-platform goldens, `docs/predictions/`. Shown by
   running the golden and registry suites unchanged after the fix.
