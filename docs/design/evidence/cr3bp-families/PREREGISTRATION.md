# Pre-registration: CR3BP family members against the NASA/JPL Three-Body Periodic Orbits API (RM-35, CAP-29b)

Written 2026-10-13 and committed alone, before any request to the API and before the
comparison is run. `src/cr3bp_family.rs` exists (unfinished WIP of 7a661a03, compiled since
13a16dbb); its six unit tests (internal checks) pass. It is not in any ledger row.

## Data (fixed now)

The NASA/JPL Solar System Dynamics Three-Body Periodic Orbits API,
`https://ssd-api.jpl.nasa.gov/periodic_orbits.api`, system `earth-moon`, for three families:

* `family=halo&libr=1&branch=N` (L1 northern halo);
* `family=halo&libr=2&branch=S` (L2 southern halo, which contains the NRHO segment);
* `family=dro` (planar distant retrograde orbits).

Each response is committed byte for byte, with the URL, the retrieval date and its SHA-256, and
with the API's own signature/version fields. It is a United States government work. The mass
ratio, length and time units used are those the response states; Kshana's own Earth-Moon
constants are not used in the comparison.

**Member selection (fixed now, by rule):** of each family's `n` members, sorted as the API
returns them, the indices `round(k (n - 1) / 19)`, k = 0..19 (20 members, or all if n < 20).
Members whose stated stability index exceeds 1e4 are kept and reported, but they are
excluded from the stability-index bar only (the eigenvalue problem is too ill-conditioned for
a relative bar there).

## Engine run

For each selected member: `cr3bp_family::correct_member` from the API's initial state as the
guess, at the API's mass ratio, `Hold::X0` for the halos (if it fails to converge, `Hold::Z0`
once, recorded) and `Hold::X0` with `planar = true` for the DROs, default
`CorrectorSettings`. The API state must already be at a perpendicular `x`-`z` plane crossing
(`y = vx = vz = 0`); a member that is not is reported and excluded from every bar.

## Bars (fixed now)

Per selected member, engine against API:

1. Converged, and closure `|x(T) - x(0)|` at most **1e-8** (nondimensional).
2. Initial state: every component within **1e-6** (nondimensional) of the API's.
3. Period within **1e-6** relative.
4. Jacobi constant within **1e-8** absolute.
5. Stability index within **1e-2** relative (members with API index <= 1e4).

## Outcome rule

All members of all three families meet 1 to 4 and every eligible member meets 5: a new row
"Earth-Moon CR3BP halo, NRHO and DRO family members" is VALIDATED as an External dataset
check of the corrector and the monodromy stability index on these families. The continuation
routines (`continue_pseudo_arclength`, `continue_natural`) are not validated by this; they stay
internal. Any failure: a finding with its numbers. The module is then marked
`#[doc(hidden)]` with its status stated, and no row claims it. No bar is moved.
