# DRAFT pre-registration C2 (0.41): the Artemis I cruise with the impulsive steps modelled as burns

**DRAFT. Owner sign-off required before it is committed as a pre-registration. Nothing described here has been run, and no data
beyond the C1 files has been fetched or inspected.** Advisory software, not certified navigation equipment. Public sources only.

This file proposes a method. It becomes a pre-registration only when the owner signs off and it is committed alone, before any
code that implements it and before any comparison it describes. Numbers marked *proposed* are for the owner to fix at sign-off;
none may change after a first run.

## Why this row

Row C1 ([`xval/mission-thread/`](../../xval/mission-thread/PREREGISTRATION.md)) was NOT MET: 45 km and 0.25 m/s over 72 h against
bars of 5 km and 0.05 m/s. Its diagnostic showed the force model reproducing 67 of 72 tabulated hours to a median of 0.38 m, and
five hours carrying impulsive velocity steps of 0.09 to 0.22 m/s that a burn-free propagation cannot follow. C2 asks the next
question: **if the steps are modelled as impulses, does the same propagation reproduce states it has not been shown?**

C2 is **not a re-score of C1.** C1's data and verdict stand. A pass in C2 would say the force model plus a stated impulse model
reproduces held-out states of a flown cislunar arc; it would not turn C1 into a pass and it would not say the impulses are
understood. If C2 misses, it is published as missed.

## What is fixed before any run (the method)

### 1. The reference

JPL Horizons target `-1023`, geocentric (`500@399`), ICRF, kilometres and seconds, TDB, geometric states; the same source and
request form as C1, fetched with a script that writes the response and its SHA-256, never vendored. Two products are fetched:

* **T (tabulated):** one-hour steps, used for detection and estimation.
* **H (held out):** the half-hour offsets (`:30` past each hour) over the same windows, fetched **after** the detector, the
  impulse estimates and the propagation code are committed, and not read before.

### 2. The windows

Two windows of 72 h, both chosen now by rule and not by result:

* **W1:** the C1 window, 2022-11-16 18:00 to 2022-11-19 18:00 TDB. It is *not* held out in the sense of unseen: its hourly
  residuals were seen in C1. It is included because its impulses are already known to exist, and it is scored on H, which has not
  been seen.
* **W2:** the first 72 h window that starts at least 24 h after the departure from the distant retrograde orbit has been
  completed and ends at least 24 h before the return powered flyby. **Rule:** the owner (or the code) names it from the *published
  burn times in the Horizons description and in NASA's public Artemis I mission documents*, not from the data. It has never been
  inspected by anyone working on this row. W2 is the unseen window: its detection and its scoring are both first looks.

If the published burn times do not leave a 72 h window by this rule, W2 is "not run" and C2 reports W1 only, saying so.

### 3. The detector (fixed algorithm, fixed thresholds)

For each pair of consecutive tabulated states in T, the shipped `tli-and-cruise` propagation (burn of zero, the thread's Moon
kernel cut for the window, the Sun from the analytic series) carries the first state one hour and the result is compared with the
second. An hour is an **event hour** when the 3-D velocity residual exceeds **0.01 m/s** (*proposed*; five times the largest
velocity residual of the quiet hours in C1's diagnostic, which was under 0.002 m/s). Adjacent event hours merge into one event.
This threshold uses C1's diagnostic, which has been seen; it is not tuned further.

### 4. The impulse estimate

For each event hour the impulse is the velocity residual vector, applied **at the midpoint of the hour** (the epoch is therefore
known to within half an hour and the sample cadence limits it; this is the dominant error and the bar below allows for it). No
impulse is estimated from any state in H.

### 5. The propagation

The same code path as C1 with a list of impulses between segments (a `[[phase.model.impulses]]` table of `t_s` and three Δv
components), added to the phase as 0.41 work and covered by its own tests before the pre-registration is committed. The start
state is the tabulated state at the window's start; the comparison states are the **H** states inside the window (71 of them per
window, 30 minutes after each hour but the last).

### 6. Bars (*proposed*, with the derivation)

* **C2a (position):** the largest 3-D position difference over the H states of each window is at most **2 km**.
* **C2b (velocity):** the velocity difference at the last H state of each window is at most **0.01 m/s**.

*Derivation, worked now and not checked against any data.* An impulse placed at the midpoint of its hour is wrong by up to 30
minutes. For a step of 0.2 m/s that is up to 0.2 x 1800 = 360 m of position at the end of the hour, and the error stays about that
size afterwards because the velocity is right from the next hour; it is not amplified in the near-linear region. Five events add to
at most about 1.8 km (they are not expected to align). The estimate of each step is the residual of one hour, whose quiet-hour
scatter is 0.2 mm/s; over a 72 h window that scatter is 0.2e-3 x 2.6e5 = 52 m per event. The velocity bar of 0.01 m/s is about
twice the sum of these residuals' effect in velocity (the impulse timing does not change the velocity after the step). Solar radiation
pressure, estimated in C1 at about 0.8 km and 6 mm/s over 72 h, is still unmodelled and is the reason the bars are not tighter.
The owner may widen either bar at sign-off with a stated reason; no bar is widened after any run.

### 7. Verdicts

MET for a window only if both bars are met on it. C2 is MET only if both windows are MET (or W1 alone when W2 is "not run", said
in the result). A pass does not validate any phase: it adds an external-comparison row recorded as met, and the matrix process
decides what that changes. A miss is recorded as a miss.

## What C2 does not claim

* That the five steps are manoeuvres: they could be thruster firings, attitude-control activity or steps in the reconstruction.
  Their cause is not tested, and the word "burn" in this file means "modelled as an impulse".
* Anything about the covariance, the filters, the updates, the ground-network overlay, the entry analysis or any other phase.
* Anything about the arcs near a lunar flyby, where a few kilometres of position error is a different sensitivity.

## Open choices for the owner

1. The detector threshold (0.01 m/s) and the midpoint convention.
2. The two bars (2 km, 0.01 m/s) and whether they should be written per window or pooled.
3. Whether W2 is wanted, and the rule that names it, or whether C2 is W1 only.
4. Whether a second, independent reference (a different orbit-determination product of the same flight, if a public one exists)
   should replace or add to the half-hour held-out states, since H shares its source with T.
5. Whether solar radiation pressure is added to the model for C2 (it is not in C1) and, if so, with what area-to-mass and
   coefficient, stated before any run.

## Process

1. Owner signs off this file (changing it as above) and it is committed alone as the pre-registration.
2. The impulse support, the detector and the propagation code are written and tested on synthetic data only, then committed.
3. T is fetched and the events and impulses are computed and committed **before** H is fetched.
4. H is fetched; the comparison runs once; results and a verdict are committed, pinned by a test that asserts the verdict, a miss
   included.
5. A diagnostic, if one is wanted after the verdict, is labelled as such and is not part of it.
