# Reference-grade precise orbit determination — methodology & validated residuals

Kshana's full-force precise-orbit-determination (POD) engine (`src/precise_od.rs`) fit to
**real agency precise-orbit products**, with honest, citable, commit-hash-stamped
residuals. This is the validation record for roadmap milestone P4 ("Reference-grade
astrodynamics: high-order gravity, SRP, validation vs agency datasets").

## What "reference-grade" means here

A residual is reported only when all of the following hold (design
`docs/design/2026-06-09-reference-grade-od-design.md`):

1. **Force model** includes every perturbation that matters at the target accuracy:
   EGM2008 high-degree geopotential, solid + ocean + atmospheric **tides**
   (`src/tides.rs`, IERS Conventions 2010 Ch. 6), Sun/Moon third body, cannonball SRP
   with conical shadow + estimated `C_R`, drag (LEO only), Schwarzschild + Lense–Thirring
   GR (`src/forces.rs`).
2. **Estimator** is a real Gauss–Newton batch least squares with a variational
   **state-transition matrix** (cross-checked against whole-arc finite difference to
   < 1e-6), `1/σ²` observation weighting, and n-sigma outlier editing.
3. **Frames/time** use **real IERS finals2000A EOP** (UT1−UTC, polar motion;
   `src/eop.rs`) through the validated IAU 2006/2000A CIO chain (`src/cio.rs`). SP3 GPS
   time → TT via the fixed 51.184 s offset (`timescales::gps_to_tt`).
4. **Residuals** are reported in **RTN** (radial/along/cross-track) and 3-D, **with and
   without** empirical accelerations, alongside the raw (no-fit) overlap.
5. Every number is **reproducible** (open-data CI gate) and **citable** (commit hash +
   dataset reference + fixture SHA-256).

## Method, per dataset

1. Parse the SP3 precise orbit; for the chosen satellite, take each ITRF position fix.
2. Convert the SP3 GPS epoch → TT; resolve `(UT1, xₚ, yₚ)` from finals2000A at that epoch.
3. Rotate each ITRF fix into GCRS through the CIO chain with those EOP — the inertial
   position observations. The dynamics use the *same* EOP for the geopotential's
   Earth-fixed rotation, so observations and forces share one frame.
4. Seed the epoch state (position = first fix; velocity = 2nd-order finite difference) and
   batch-fit `[r, v, C_R]` (Tier 1), then additionally the 9 RTN cycle-per-revolution
   empirical accelerations (Tier 2, a-priori constrained).
5. Report post-fit RTN + 3-D RMS for both tiers and the raw overlap.

## Results

### Galileo MEO — **GREEN** (< 5 m bar)

- **Dataset:** ESA/ESOC final multi-GNSS orbit `ESA0MGNFIN`, ITRF, 5-min sampling,
  satellite **E11** (GSAT0101, Galileo IOV, nominal MEO), 2022-01-01.
- **Open source (no login):** ESA Navigation Office mirror,
  `navigation-office.esa.int/products/gnss-products/2190/`. EOP: IERS
  `datacenter.iers.org/data/9/finals2000A.all`.
- **Validation commit:** `66da3ff` (`tests/agency_galileo.rs`).
- **Fixtures (SHA-256):** SP3 `e7297f4c…d3a24a3`; EOP `6b781d36…cb2ed00f`
  (`tests/fixtures/agency/NOTICE.md`).

| Run | Arc | d/o | n_obs | 3-D RMS | RTN (R, T, N) | `C_R` | Notes |
|-----|-----|-----|-------|---------|---------------|-------|-------|
| CI fixture, Tier 1 (force + `C_R`) | 8 h | 12 | 97 | **0.132 m** | 0.105, 0.067, 0.047 m | 1.174 | raw overlap 78.7 km |
| CI fixture, Tier 2 (+ empirical CPR) | 8 h | 12 | 97 | **0.070 m** | 0.048, 0.044, 0.027 m | — | halves the residual |
| Full-arc dispatch, Tier 1 | 24 h | 12 | 289 | **0.611 m** | 0.276, 0.381, 0.390 m | 1.244 | `workflow_dispatch` |

The MEO field is gravity-converged by degree 8 (the 8 h Tier-1 result is identical at d/o
8, 10, and 12 to the millimetre), so the CI fixture's d/o-12 truncation is negligible; the
dispatch job runs the full d/o-70. The 8 h fit reaches **13 cm** pure-force and **7 cm**
with the empirical tier; the full 24 h arc (more SRP/eclipse stress, longer dynamic span)
is **61 cm** — all far inside the 5 m bar.

### Swarm-A LEO — pending (P4 W4)

LEO is drag-dominated; with a static exponential density model the honest RMS may exceed
5 m. It will be reported as-is, with NRLMSISE-00 noted as the upgrade path.

### LRO lunar — pending (P4 W4)

Validated against the NAIF LRO SPK ephemeris with a GRGM lunar gravity field (not native
SP3). Honest numbers, field degree documented.

## Honesty contract

- < 5 m "green" applies **only** to Galileo MEO (the achievable cleanest case). Swarm and
  LRO publish their real RMS even if above 5 m.
- Empirical-acceleration-assisted (Tier 2) and pure-force (Tier 1) results are always
  reported **separately**.
- Every residual carries its commit hash, dataset reference, and fixture checksum above.
