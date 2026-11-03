<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration C3 (0.41): the CAPSTONE NRHO with a corrected force model

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are new and are for the owner to fix at sign-off; every other
number is an existing bar and is not changed. Advisory software, not certified navigation equipment. Public sources only.

This file covers only the CAPSTONE part of roadmap item C3. The Artemis I part is pre-registered and signed in
[`docs/mission-thread/PREREGISTRATION-C2.md`](../../../mission-thread/PREREGISTRATION-C2.md) and is not changed here.

## Why this row

Row A2 of [`xval/mission-thread-lunar/PREREGISTRATION.md`](../../../../xval/mission-thread-lunar/PREREGISTRATION.md)
(bars as set by its Amendment 1) propagated CAPSTONE's reconstructed state over one revolution of its near rectilinear
halo orbit (NRHO) and compared the end state with JPL Horizons. It is **NOT MET**
([`RESULTS.md`](../../../../xval/mission-thread-lunar/RESULTS.md)): 136.8 km end position against 25 km, and 28.4 km
osculating periapsis radius against 10 km. The causes were not isolated. The candidates named there were: radiation
pressure and albedo (omitted); sensitivity to the initial state; the accuracy of the analytic Earth and Sun series in
the Earth's tide, which dominates near apolune; and small manoeuvres below the 100 m per hour test.

C3 asks one question: **with the analytic Earth and Sun series replaced by DE440 positions, does the same propagation
meet A2's bars, on A2's own window and on windows nobody has propagated?** A second, separately named question asks
whether one estimated radiation-pressure parameter closes what is left.

## What stays as it is

- A2's bars, unchanged: **end position difference at most 25 km** and **osculating periapsis radius difference at most
  10 km**, both at +156 h (Amendments 1, 4 and 5).
- Everything else A2 fixed: GL0660B lunar field truncated to degree and order 150; DE440 lunar orientation as primary,
  analytic orientation as secondary with no bar (Amendment 3); the relativistic term; Dormand-Prince with relative
  tolerance 1e-12 and absolute tolerance 1e-9 (m, s); 156-hour windows of 157 consecutive hourly samples; osculating
  periapsis `p / (1 + e)` for any conic; reference states used as given, km converted to m.
- The A2 record and its pinning test. A2 stays NOT MET in its own file whatever happens here; the outcome of this file
  is recorded beside it.

## What changes (the model, fixed now)

**Model M1** = the A2 model with one change: the geocentric positions of the Sun, and the Moon-centred position of the
Earth, are read from the NAIF `de440s.bsp` kernel (the crate's opt-in ephemeris tier) instead of the analytic series.
Venus and the Jupiter system barycentre are added as point masses from the same kernel. Nothing else is changed. No
parameter of M1 is estimated from any CAPSTONE state.

**Model M2** = M1 plus cannonball solar radiation pressure with a conical shadow from the Earth and from the Moon,
`P0 = 1361 W/m^2 / c` at 1 au, with one parameter `k = Cr * A / m` (m^2/kg) estimated as in step 5 below. No public
area-to-mass value for the spacecraft is used or registered.

## Data (public)

| Item | Source | Use |
|---|---|---|
| A2 window W0 | the committed A2 fixture `tests/fixtures/mission_thread_lunar/a2_capstone_horizons.json` (JPL Horizons `-1176`, 2023-01-01 to 2023-03-31, hourly); W0 starts at sample 145, JD TDB 2459951.5417 | the direct re-run of A2. **Seen**: its A2 result is known |
| Fresh span F | JPL Horizons API, <https://ssd.jpl.nasa.gov/api/horizons.api>, `COMMAND='-1176'`, `CENTER='500@301'`, `REF_SYSTEM='ICRF'`, `VEC_TABLE='2'`, `OUT_UNITS='KM-S'`, TDB, step 1 hour, **2023-04-01 00:00 to 2023-06-29 00:00 UTC** (89 days, 2137 states) | estimation and held-out scoring. **Not fetched by anyone working on this row**; fetched only at step 4 |
| Planetary ephemeris | NAIF generic kernel `de440s.bsp`, <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp>, SHA-256 recorded on fetch | M1 and M2 |
| Lunar field | GRAIL GL0660B, <https://pds-geosciences.wustl.edu/grail/grail-l-lgrs-5-rdr-v1/grail_1001/shadr/jggrx_0660b_sha.tab> (as A2) | unchanged |

Each response is written with its URL, retrieval date and SHA-256 by a committed script and is not vendored beyond what
A2's fixtures already hold. If Horizons does not cover F in full, or returns anything other than parseable state vectors,
every F-based run is "not run"; F is not shortened and no other span is tried.

## Procedure (in this order)

1. This file is signed off and committed alone.
2. M1 and M2 are written and tested on synthetic data only: a consistency test that M1 with the kernel switched off
   equals the A2 model bit for bit, and a test of the radiation-pressure term against a closed form. Committed.
3. **Control:** the A2 model is re-run on W0 and must reproduce 136.8 km and 28.4 km to the printed digits. A mismatch
   stops the campaign.
4. F is fetched. The manoeuvre-hour test of A2's Amendment 2 (an hour is a manoeuvre hour if M1 carried across it misses
   the next sample by more than 100 m) is applied to F with M1. The maneuver-free runs of at least 157 samples are taken
   in time order, without overlap: **E** is the first, **H1** the second, **H2** the third. The window count and the
   manoeuvre hours are committed before any 156-hour propagation in F is run.
5. `k` for M2 is estimated on E only: the value in [0, 0.1] m^2/kg that minimises the sum of squared 3-D position
   differences at E's 156 hourly samples, propagating from E's first state (golden-section search to 1e-5 m^2/kg).
   `k` is committed before H1 or H2 is propagated.
6. The scored propagations run once: M1 on W0, E, H1, H2; M2 on H1 and H2. Results and verdicts are committed and
   pinned by a test that asserts them, a miss included.

## Bars

| Id | Run | Bar | Status |
|---|---|---|---|
| C3-R | M1 on W0 (the re-run of A2) | A2's bars: end position at most 25 km, periapsis radius at most 10 km | existing bar |
| C3-H | M1 on E, H1, H2, each window separately | A2's bars, per window | existing bar, new windows |
| C3-S | M2 on H1 and H2, each window separately | A2's bars, per window | new question; bars equal to A2's (*proposed*) |

Reported with no bar: the analytic-orientation runs; the A2 model on E, H1 and H2 beside M1 (how much the ephemeris
change moves the result on unseen windows); the estimated `k` and the position residual over E; the maximum 3-D
difference along each window.

## Verdicts

- **A2 is recorded as met on re-run** only if C3-R is met **and** C3-H is met on every window that exists (*proposed*:
  the owner may instead decide that C3-R alone settles the re-run, with C3-H reported). If F gives fewer than three
  windows, C3-H is scored on those that exist and the result says how many.
- **C3-S** is MET only if both bars hold on H1 and on H2. It is its own row and never turns A2 met.
- A miss on any bar is published as a miss with its numbers.

## What a result would and would not mean

- MET (C3-R and C3-H): the shared lunar propagator, with DE440 third bodies and no fitted parameter, reproduces CAPSTONE's
  reconstructed ephemeris to within 25 km and 10 km over one revolution, on the original window and on unseen ones. It
  would suggest the analytic series was the main cause of the A2 miss. It would not prove it, and it says nothing about
  orbit determination, navigation filters, station keeping or any other phase. The ledger label stays MODELLED; the
  external-comparison row records the outcome.
- MET on C3-S only: one radiation-pressure parameter fitted on an earlier window carries over to later ones at this
  accuracy. It does not identify the spacecraft's real area-to-mass ratio.
- NOT MET: the force-model change does not close the gap on its own. Remaining candidates (initial-state sensitivity,
  small manoeuvres below the test, the reconstruction itself) stay untested and are named in the result, not chosen
  after it.
- The Horizons reconstruction is the reference, not truth; its own accuracy is not assessed.

## Owner decisions at sign-off

1. Accept M1 as the single change (DE440 Sun, Earth, Venus, Jupiter barycentre), or name a different single change.
2. Whether A2 counts as met on re-run on C3-R alone or on C3-R plus C3-H (proposed: both).
3. Whether to run C3-S at all, and its estimation interval for `k`.
4. Confirm the fresh span F and that no one on this row has fetched it.
