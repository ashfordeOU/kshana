# Pre-registration C2 v2 (0.41.x): the Artemis I cruise scored between the reconstruction's steps

**Status: Signed off by the owner on 9 November 2026, as drafted (proposed 8 November 2026). No code or data for v2 before this sign-off. Bars may be tightened after a run, never loosened.** Advisory software, not navigation equipment. Public sources only.

## Why a v2

C2 v1 (`PREREGISTRATION-C2.md`, signed 3 November 2026) is NOT MET (`xval/mission-thread-c2/RESULTS.md`): 17.3 km
against 2 km, and 0.0177 m/s against 0.01 m/s, on W1; W2 was not run (the published burn times leave 42.8 h). The
diagnostic after the verdict shows why. At four of the five event hours (1, 23, 34 and 57) the reconstruction's
one-hour position residual (598 m, 3.6 km, 6.9 km, 13.1 km) is larger than any velocity step inside the hour could make
(|Δv| × 3600 s: 327, 575, 340, 541 m). Those are position steps in the reconstruction, which no impulse can follow.
Between them the force model reproduces the hours to a median of 0.38 m. v1 and C1 stand as recorded; no bar is
loosened. v2 changes what is propagated across a step, re-derives the bars and scores on a window no one has seen.

## What changes

1. **The detector gains a position test.**
   - An hour is an event hour when the one-hour **velocity** residual exceeds 0.01 m/s (v1), **or** the one-hour
     **position** residual exceeds 100 m. The 100 m threshold is A2's manoeuvre-hour test, already used in this
     thread. C1's quiet hours have a median of 0.38 m.
   - The detector runs on the tabulated hourly states T only.
2. **Restart at each step.** The propagation restarts from the tabulated state T at the end of each event hour (the next
   hour mark), instead of carrying an impulse across it. The window is thereby cut into **arcs** between event hours,
   each started from a tabulated state.
   - No impulse is estimated or applied.
   - An arc shorter than 6 h is not scored and is reported.
   - The held-out half-hour states H that fall inside an event hour are not scored and are reported.
   - This is the restart option. The other candidate the v1 result named, scoring only the arcs between steps without
     restarting, is not proposed: a position step at the start of an arc would then propagate into every later arc, as
     in v1.
3. **The bars, re-derived per arc (*proposed*).** For an arc of length `T` (s) from a tabulated start:
   - **C2a v2 (position):** the largest 3-D position difference over the scored H states of the arc is at most
     `B_r(T) = 2 × (½ · a_srp · T² + σ_v · T) + 200 m`.
   - **C2b v2 (velocity):** the velocity difference at the arc's last scored H state is at most
     `B_v(T) = 2 × (a_srp · T + σ_v) + 1 mm/s`.
   - **Inputs to the bars.** `a_srp = 2.5e-8 m/s²` is the unmodelled solar radiation pressure acceleration implied by
     C1's estimate (about 0.8 km and 6 mm/s over 72 h, rounded up). `σ_v = 0.2 mm/s` is the quiet-hour residual scatter
     of the tabulated velocity (v1 §6).
   - **Why these terms.** The factor 2 is the margin for using C1's estimates. The 200 m and 1 mm/s cover the tabulated
     start state's own error and the half-hour offset of H.
   - **Scale.** For a 24 h arc, `B_r` is about 0.42 km and `B_v` about 5.7 mm/s; for 72 h, about 1.98 km and 14.4 mm/s.
     These values come from C1 and v1's derivation, both seen. They are not checked against any data here.
   - **Per window.** A window is MET only if every scored arc meets both bars.
4. **A fresh window W3, named by rule from published burn times before any data of it is fetched.** W1's T and H are
   both seen; W1 is re-run under v2 and **reported with no verdict**.
   - **The rule.** W3 is the first 72 h interval of the Artemis I mission, in time order after W1's end
     (2022-11-19 18:00 TDB), that starts at least 24 h after the end of a published burn and ends at least 24 h before
     the start of the next one.
   - **Which burns count.** Every engine firing in NASA's public Artemis I mission timeline, blogs and press kit counts:
     trajectory corrections, lunar flybys, DRO insertion and departure. So does any lunar flyby closest approach.
   - **Recording.** The window is named in a readings file, with each burn's source, before any Horizons state of it is
     fetched.
   - **If no window exists.** If no such window exists before entry interface, v2 is "not run" and says so.
5. **Data and order.** v1's: JPL Horizons `-1023`, geocentric, ICRF, TDB, km and s, hourly T and half-hour H, written
   with the request and its SHA-256. In order:
   1. W3 is named and committed.
   2. The detector and restart code are written and tested on synthetic data, then committed.
   3. W3's T is fetched, and its event hours and arcs are computed and committed.
   4. H is fetched.
   5. The comparison runs once.

## Bars and verdict

C2 v2 is MET only if every scored arc of W3 meets C2a v2 and C2b v2. W1 under v2 is reported with no verdict. A miss is
published with its numbers.

## Disclosures

- The diagnostic that motivates the position test and the restart was made after v1's verdict, on v1's seen data. The
  100 m position threshold and the restart rule are chosen knowing it. That is why the scored window is new.
- A restart from the tabulated state tests the force model between steps, not the reconstruction's steps: v2 says
  nothing about what causes them.
- If W3 contains many short arcs, few H states may be scored. The count is reported, and v2 is recorded as
  uninformative if fewer than 24 H states are scored.

## What a MET and a NOT MET mean

MET says the propagation with no impulses reproduces held-out reconstructed states of a fresh Artemis I arc between the
reconstruction's steps, within bars derived from C1's radiation-pressure estimate. It does not undo C1's or C2 v1's
NOT MET; all are published.

## Outcome (9 November 2026)

**Not run.** The rule of reading 4 leaves no 72 h window after W1 (the longest gap between published Artemis I burns is
105.9 h, against the 120 h needed): `xval/mission-thread-c2-v2/README.md`. No v2 code was written and no v2 data was
fetched.
