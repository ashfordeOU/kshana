<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B5 (0.41): area trust from several reference stations: results (T1, T2, T5)

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). The readings and the independent oracle
(`xval/area-trust/README.md`, `oracle.py`, Python standard library only) were committed in `af8eea050`, before
any engine code. The bars were not changed.

Reproduce with `cargo test --test area_trust -- --nocapture`.

## Summary

| Bar | Result |
|---|---|
| T1 rule exactness | **MET**: state agreement 1.0 with the oracle on 43 117 grid seconds of seven seeded replays (4, 5, 7, 10, 16, 25 and 50 stations; 520 events). Alert, live, degraded, untrusted and stale counts are equal too, and the engine's JSON Lines are the oracle's bytes. |
| T2 detection | **MET**: 267 events put at least `k` stations in alarm in one second (112 of them at least `k` untrusted); every one raised the expected area alert. None of the 253 events with fewer raised `UNTRUSTED`. |
| T3 end-to-end latency | **Open**: needs the real-background replay at 100 stations through ingest and both deliveries (webhook, MQTT). |
| T4 false alerts | **Open**: needs the clean IGS fortnight of 2025 (`xval/area-trust/fetch.sh`, not vendored). |
| T5 determinism | **MET for the files and surfaces built**: the same seed gives the same stations document, byte for byte, equal to the committed fixture the oracle read; the command line, Python and WebAssembly give the oracle's bytes (`tests/area_trust.rs`, `tests/python/test_bindings.py`, `web/smoke.mjs`). T4's real-data timelines will be added when T4 runs. |

B5 is MET only when T1 to T5 are all met; it is not yet.

## The replays

`kshana::area_trust::synth::replay(seed, stations, events)` draws per-station evidence at 1 Hz (horizontal error
around the surveyed point, the C/N0 template statistic and the existing monitors' outcomes), calibrates each
station's `H_s` on its first 120 s, and injects events in sequence with quiet gaps of 25 to 60 s: C/N0 drops of
3 to 20 dB, AGC, jamming-indicator and loss-of-lock alarms, position offsets of 10 to 500 m, clock steps and
OSNMA failures, on one or two stations or on many. Each station's state follows from section 1's rule, so the
truth of each event (the most stations in alarm, and untrusted, in one second) is exact. Stations also drop
out for 2 to 12 s in quiet time, so the stale rule is exercised; no replay reached `N < 2`, so that case is
covered by the two hand-built documents below.

The stations documents and the oracle's timelines are in `tests/fixtures/area_trust/`. Two hand-built documents
(`boundary_stale`, `boundary_hold`) cover a second with two epochs, a station going stale, `UNKNOWN`, and
hysteresis from `UNTRUSTED` through `DEGRADED` to `TRUSTED`; the engine equals the oracle on both.

## A correction to the oracle

On the first comparison of `boundary_stale`, the engine and the oracle agreed on every state but not on the counts
in a second with one live station: the oracle printed `n_d` and `n_u` as 0 whenever `N < 2`, while reading 4
defines both over the live stations whatever `N` is. The oracle was corrected to follow its reading (the state it
computes is unchanged). No synthetic replay has a second with `N < 2`, and their oracle timelines are identical
before and after the correction.

## What this means

The area rule computes what the pre-registration defines and alerts on every synthetic event that should alert.
This says nothing about detection on real interference, about thresholds at a particular site, or about latency;
those are T3, T4 and out of scope as the pre-registration states.
