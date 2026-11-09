<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C3 v2: the CAPSTONE NRHO with a per-window radiation-pressure estimate: readings

The pre-registration is `docs/design/evidence/c3-capstone-nrho-force-model/PREREGISTRATION-v2.md`, signed off on 9
November 2026. Committed **before span G is fetched** and before any v2 propagation. v1's readings
(`xval/c3-capstone-nrho/README.md`) stand unless changed here. MODELLED; the Horizons reconstruction is the reference,
not truth.

## Readings

1. **Span G.** Fetched by `fetch_data_v2.sh`, which is v1's script with the span and file name changed:
   - JPL Horizons `-1176`, Moon-centred (`500@301`), ICRF, `VEC_TABLE=2`, km and km/s, hourly;
   - **2023-07-01 00:00 to 2023-09-28 00:00**, which must hold **2137** states;
   - otherwise every G-based run is "not run", and no other span is tried.
   The file is not vendored; its hash goes to `FETCHED_v2.txt`. Before the windows are committed nothing in G is read
   beyond the row count and the first and last epoch.
2. **Windows G1, G2, G3.** v1's reading 1 and 2 on G with M1: an hour is a manoeuvre hour if M1 misses the next sample
   by more than 100 m. G1, G2 and G3 are the first 157 samples of the first three manoeuvre-free runs of at least 157
   samples, in time order. They are committed (`windows_g.json`) before any 156-hour propagation in G.
3. **Model M3.** M1 plus v1's cannonball radiation pressure, with `k` estimated per window.
   - The estimate uses the window's **first 78 samples** (its first state and the 77 hourly samples after it): v1's
     golden-section search on [0, 0.1] m²/kg to 1e-5, minimising the sum of squared 3-D position differences at those
     77 samples, propagated from the window's first state.
   - The scored point is +156 h (sample 157), as in A2. The estimate never sees samples 79 to 157.
   - The `k` of every window are committed (`k_v2.json`) before any window is propagated to +156 h under M3.
4. **Scored:** M3 on G1, G2, G3 against A2's bars (end position ≤ 25 km, osculating periapsis radius ≤ 10 km at
   +156 h).
5. **Reported with no bar:**
   - M1 on G1 to G3;
   - M3 and M1 on F's windows E, H1, H2 and on A2's W0 (v1's sample 145), each with its own first-half `k`;
   - the maximum 3-D difference along each window.
6. **Sensitivity analysis (reported).**
   - On every window of F, G and W0, M1 and M3 (its window's `k`) are run 12 more times. Each run starts from the
     window's first state with one component changed: ±10 m in x, y or z, or ±1 cm/s in vx, vy or vz.
   - The largest end-position change at +156 h is reported per window and model.
   - A G window where it exceeds 12.5 km under M3 is marked low-information. Its verdict still counts.
7. **Verdict.** C3-S v2 is MET only if both bars hold on every G window that exists (fewer than three are scored as
   they exist, with the count stated). It does not change A2's, C3-H's or C3-S's records.
