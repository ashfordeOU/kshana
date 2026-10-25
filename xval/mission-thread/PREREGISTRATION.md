# Pre-registration: the cislunar arc of the mission thread against a public trajectory (0.40 workstream H)

Advisory software, not certified navigation equipment.

**Status: committed alone, before any code for it exists and before any number it would produce has been computed.**
Nothing here has been run. The reference trajectory has not been downloaded or inspected beyond the one-hour header probe
described under "What was looked at", which was made only to read the target's description and its stated coverage. A change
after this commit is a dated amendment below, made before any run; no bar is loosened, and a miss is published as a miss.

## What is registered

One external-oracle row, **C1**, for the mean-state model of the `tli-and-cruise` phase: the Cowell propagation with Earth
gravity and J2 and the Sun and Moon as third bodies, the Moon from a DE440 kernel cut and the Sun from the analytic series
(`src/mission_thread/earth/tli_cruise.rs`, `segment_model`). Everything else in the mission thread stays **MODELLED**: this
row tests the propagation of the mean state of one cislunar coast arc, not the covariance, the filters, the updates, the
burn error model, the ground-network overlay, the entry analysis or any other phase, and no sentence in any doc may say it
does. Passing the bar earns the row a place for the matrix process; it does not move any phase to VALIDATED by itself.

## The reference

* **Target:** Artemis I / Orion, JPL Horizons target `-1023`, as the geocentric (`500@399`) geometric state vector in the
  ICRF (`REF_SYSTEM='ICRF'`, `REF_PLANE='FRAME'`), kilometres and seconds, TDB, one-hour steps, over 2022-11-16 00:00 to
  2022-12-12 00:00 TDB. Horizons states its source as the NASA navigation as-flown post-TLI trajectory
  (`Post_TLI_Orion_AsFlown_20221213_EPH_OEM`, 2022-Nov-16 08:46 to 2022-Dec-11 17:20 TDB) with the central body from DE441.
* **Access:** fetched with `xval/mission-thread/fetch_data.sh`, which writes the response and its SHA-256 into a directory
  the caller names. The file is never vendored in the repository; the test pins the SHA-256 and the stored verdict, and
  recomputes only when the directory is supplied.
* **Moon for the model:** the DE440s cut `tests/fixtures/mission_thread/de440s_moon_2022-11-16_2022-12-12.bsp` (committed,
  hash-pinned by its own test), which holds the Moon and the Earth about the Earth-Moon barycentre.

## C1: the coast arc

| Item | Fixed now |
|---|---|
| Initial state | the Horizons state at **2022-11-16 18:00:00 TDB** |
| Window | 72 h, to **2022-11-19 18:00:00 TDB** |
| Why this window | it begins about three hours after the one outbound trajectory-correction burn the Horizons description lists (launch + 7 h 47 m 31 s, about 14:35 UTC) and ends two days before the outbound powered flyby of the Moon (about 2022-11-21 12:44 UTC), which is not in it. The description lists no other burn between. The window is fixed by this reasoning and is not changed after the result: if the data show a burn in it, the row records the miss and says so |
| Model | `ForceModel::with_j2()` with the Sun and Moon third bodies, the epoch set to the initial epoch, TDB used for TT (a difference below 2 ms, a few metres at this speed); the Moon from the kernel above through the same provider the phase uses (`KernelMoonAnalyticSun`), the Sun from the analytic series; Dormand-Prince 8(5,3) at relative tolerance 1e-12, absolute 1e-9 m |
| Compared | the propagated position and velocity against the Horizons state at **12, 24, 36, 48, 60 and 72 h** after the initial epoch (six epochs; Horizons is sampled at one-hour steps, so each is a tabulated point) |
| Bar C1a | the largest 3-D **position** difference over the six epochs is at most **5 km** |
| Bar C1b | the **velocity** difference at 72 h is at most **0.05 m/s** |
| Verdict | MET only if both bars are met; otherwise NOT MET, and the row stays MODELLED either way |
| Reported with no bar | the same comparison with the Moon from the analytic series instead of the kernel (the fallback the phase uses where no kernel covers an epoch), and the per-epoch differences |

### Why those bars (stated before the run)

The bar must be a few times larger than the effects the model leaves out by design, and small against what a wrong model
would give. The effects, as order-of-magnitude figures worked now and not yet checked against any data:

* **Solar radiation pressure** is not modelled. With a plausible 90 m^2 over 24 t (an area-to-mass of about 4e-3 m^2/kg) and a
  radiation-pressure coefficient of 1.5, the acceleration is about 2.5e-8 m/s^2; over 72 h that is about 0.8 km of position and
  about 6 mm/s of velocity.
* **Earth gravity beyond J2** is not modelled; at the radii of this window (tens of thousands of kilometres and more) the
  neglected terms are smaller than the radiation pressure above.
* **Small attitude manoeuvres and venting** are not modelled; their size is not published and is not estimated here.
* **The reference itself** is a navigation reconstruction with its own uncertainty, which Horizons does not state for this
  target and which is therefore not claimed to be negligible.

The position bar of 5 km is about six times the radiation-pressure estimate, and the velocity bar of 0.05 m/s about eight
times. A propagator with a wrong Moon (the analytic series' 196 km error) differs by an acceleration of about 2e-8 m/s^2 in the
tidal term, the same order as the effects above, which is why the analytic-Moon comparison is reported without a bar: it
cannot be distinguished from a correct Moon at this bar, and no claim is made that it can.

## What was looked at

One Horizons request for the target, a one-hour span at 2022-11-16 12:00 to 13:00 TDB, to read the target's description and
its stated trajectory name and coverage. Its two state rows were not compared with anything. The outbound-burn timing and the
absence of other burns in the window come from the description text, not from the state vectors.

## Rules

1. **Reachability.** If the source is not reachable from the run environment or does not carry the target, the row is "not
   run" and stays MODELLED. It is not replaced by another source after the fact.
2. **Reported regardless.** The state used, the fetch URL, the SHA-256 of the fetched file and the commit of the code are
   recorded in the result. A miss is published and the row stays MODELLED.
3. **No `#[ignore]`.** Results are written under `xval/mission-thread/` and pinned by tests that assert the verdict, a miss
   included.
4. Public sources only. The example documents are named "Artemis-class"; the word appears here only as the oracle's target name
   in Horizons.

## Amendments

None yet.
