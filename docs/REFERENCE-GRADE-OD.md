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

### Swarm-A LEO — **GREEN** (< 5 m bar)

- **Dataset:** ESA Swarm Level-2 reduced-dynamic precise science orbit
  `SW_OPER_SP3ACOM_2_` (`RDOD_AR`, GPS-derived, ITRF / IGb14, ~2 cm, TU Delft
  processing), satellite **Swarm-A** (SP3 id `L47`, ~430 km LEO), 2022-01-01.
- **Open source (no login):** ESA Swarm dissemination server
  `https://swarm-diss.eo.esa.int/` → `Level2daily/Latest_baselines/POD/RD/Sat_A/`
  (open under the ESA Data Policy). EOP: the same IERS `finals2000A` 2022-001 series.
- **Validation commit:** `ceea70a` (`tests/agency_swarm.rs`).
- **Fixture (SHA-256):** SP3 `6cd84b78…acb733e` (`tests/fixtures/agency/NOTICE.md`).

A LEO arc adds **atmospheric drag** to the force model. Because the density model is a
*static* piecewise-exponential, the orbit is fit in two tiers: a **dynamic** tier
(estimate the epoch state only; `C_R` held at 1, since at LEO drag dominates and SRP is
poorly separable over a short arc), and a **reduced-dynamic** tier that adds the empirical
cycle-per-revolution accelerations carrying the un-modelled drag — the operationally
meaningful LEO orbit.

| Run | Arc | d/o | n_obs | 3-D RMS | RTN (R, T, N) | Notes |
|-----|-----|-----|-------|---------|---------------|-------|
| CI fixture, dynamic (`C_R`=1)        | 3 h | 70 | 181 | **2.687 m** | 0.925, 2.522, 0.043 m | residual ≈ pure along-track (drag) |
| CI fixture, reduced-dynamic (+empirical) | 3 h | 70 | 181 | **0.098 m** | 0.026, 0.092, 0.024 m | empirical absorbs the drag |

The dynamic fit clears the 5 m bar with the residual almost entirely along-track — the
textbook drag signature at ~430 km. The empirical tier absorbs that along-track error
(2.52 → 0.09 m), giving a **~10 cm** reduced-dynamic fit against ESA's own ~2 cm orbit. The
full-day, full-degree run is the ignored `swarm_full_arc_dispatch` (the dissemination
server serves the product through its file-browser session, so the founder downloads the
day's SP3 and points `KSHANA_SWARM_SP3` at it). NRLMSISE-00 with space-weather drivers is
the noted upgrade that would tighten the *dynamic* tier further.

### LRO lunar — pending (P4 W4b)

The third dataset. Validated against the NAIF LRO reconstructed SPK ephemeris with a GRGM
lunar gravity field (Moon-centred dynamics, not native SP3) — a genuine engine extension
(lunar central body + body-fixed field + SPK reader), tracked as its own wave. Honest
numbers, field degree documented, when delivered.

## Honesty contract

- The < 5 m "green" bar is met for **Galileo MEO** (0.13 m dynamic) and **Swarm-A LEO**
  (2.69 m dynamic / 0.10 m reduced-dynamic). LRO will publish its real RMS as-is, even if
  above 5 m.
- For LEO, the **dynamic** (state-only, static density) and **reduced-dynamic** (with
  empirical accelerations) tiers are always reported **separately**, so the reader sees
  what the empirical terms absorb; the reduced-dynamic tier is the operational orbit. The
  same separation holds for the MEO empirical/pure-force tiers.
- Every residual carries its commit hash, dataset reference, and fixture checksum above.
- **Datasets validated: 2 of 3** (Galileo MEO ✓, Swarm-A LEO ✓, LRO lunar pending).
