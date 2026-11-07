<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Area trust: one state from several reference stations

`kshana area-trust` turns the per-second states of several reference stations into one state for the area
they cover, with an alert when it gets worse. It is row B5 of 0.41; the rule is fixed in
`docs/design/evidence/b5-area-trust/PREREGISTRATION.md` and its readings in `xval/area-trust/README.md`.

```
kshana area-trust stations.json > area.jsonl
```

## Input: `kshana.area-stations/1`

```json
{"stations": [
  {"id": "S00", "epochs": [[0.25, "nominal"], [1.25, "degraded"], [2.25, "untrusted"]]},
  {"id": "S01", "epochs": [[0.40, "nominal"], [1.40, "nominal"]]}
]}
```

Each epoch is `[t_s, state]`, in time order. A station's state comes from its own monitors
(`kshana::area_trust::station_state`): a position, clock or OSNMA alarm gives `untrusted`; a C/N0
template, AGC, jamming-indicator or loss-of-lock alarm alone gives `degraded`; otherwise `nominal`.

## The rule

- Epochs go on a 1 s grid (an epoch belongs to the second that contains it; the last in a second wins).
  A station with no epoch for 5 s is stale and left out of the counts.
- With `N` live stations, `n_D` degraded or worse, `n_U` untrusted and `k = max(2, ⌈N/3⌉)`: `UNKNOWN` if
  `N < 2`; `UNTRUSTED` if `n_U ≥ k`; `DEGRADED` if `n_D ≥ k` or `n_U ≥ 1`; else `TRUSTED`.
- A worse state is published at once and raises an alert. A better one is published only after the raw state
  has been better for 10 s, and then as the worst raw state of those 10 s; an improvement is not an alert.

## Output

One JSON line per grid second: `{"g":…,"state":…,"alert":…,"n":…,"n_d":…,"n_u":…,"stale":…}`. The same bytes
come from Python and WebAssembly (`area_trust_timeline(stations_json)`) and from the Rust API
(`kshana::area_trust::timeline_jsonl`).

## What it is and is not

The area state is an arithmetic rule over the stations' own alarms. It has been checked against an independent
oracle on synthetic replays (`docs/design/evidence/b5-area-trust/RESULTS.md`). It says nothing about the cause
of an alert, and its detection on real interference events is not measured here.
