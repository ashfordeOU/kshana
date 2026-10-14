# CRPA antenna gains in the jamming kind: results

Item CAP-06 (a), run 2026-10-14 against the bars of [`PREREGISTRATION.md`](PREREGISTRATION.md)
(committed at 08d83b4d, before the code). No bar was changed.

| bar | verdict | numbers |
|---|---|---|
| A1 additivity | **MET** after a fix (first build missed) | see below |
| A2 one element is no array | **MET** | both weightings: every link's `js_db`, `cn0_nominal_dbhz` and `cn0_effective_dbhz` equal to the run without the section within 1e-12 dB, and every status equal |
| A3 independent recomputation | **NOT MET** (one quantity) | see below |
| A4 MVDR tends to the null | **MET** | JNR raised by 27.8 dB to 80 dB per element: worst MVDR − null-steering effective C/N0 difference 6.1e-8 dB over all links (bar 0.1 dB) |

## A1

Every one of the 150 scenarios under `scenarios/` (all `jamming` scenarios and every campaign
composing one) was run with the release binary of 08d83b4d (before) and of this change
(after), and the `result.json` files were compared byte for byte. `quantum-pnt-demonstrator.suite`
is a study suite, not a scenario, and fails the same way under both binaries.

- **First build: missed.** 7 results differed: `jamming-demo`, `jamming-harbour-approach-skyline`,
  `maritime-strait-jamming`, `leo-vertical-rail-maritime`, `campaign-jam-spoof-holdover-integrity`,
  `campaign-shared-jammer-sea-road` and `campaign-sweep-jammer-power`. In `jamming-demo` the only
  differences were in the embedded `units` table: two new entries for the `crpa` block, and an
  added clause in the `cn0_effective_dbhz` definition. No computed value moved.
- **The fix.** The `crpa` units moved to their own table (`jamming::CRPA_UNITS`), emitted only
  for a run with a `[crpa]` section. The `cn0_effective_dbhz` definition was restored, and the
  beam-output note moved into the `crpa` entries. `a1_crpa_units_only_with_the_section` pins this.
- **Rebuilt and re-run: met.** All 150 results were byte-identical to the before run. The jamming
  tests, `registry_golden` and `cross_platform_golden` pass unchanged.

## A3

The `jamming-demo` geometry has 456 satellite links (epoch × satellite). With the 4-element
0.095 m square array, `xval/crpa-jamming/oracle.py` (numpy 2.5.3) recomputed each link from
`xval/crpa-jamming/inputs.json`, giving `expected.json`. Differences from the engine:

| weighting | quantity | links over 1e-9 dB | worst difference |
|---|---|---|---|
| null-steering | array noise gain | 0 of 456 | 1.6e-14 dB |
| null-steering | effective C/N0 | 0 of 456 | 2.1e-14 dB |
| null-steering | jammer gain (graded as `< −200 dB` on both sides) | 0 of 456 | both below −200 dB on every link (numpy between −296 dB and exactly zero) |
| MVDR | array noise gain | 0 of 456 | 5.3e-15 dB |
| MVDR | effective C/N0 | 0 of 456 | 2.1e-14 dB |
| MVDR | jammer gain | **202 of 456** | **1.7e-6 dB** |

**Finding F1 (the miss).** The MVDR jammer gains lie between −188 and −101 dB (median −127 dB).
`|wᴴa_j|²` is then the residual of a sum of four unit-magnitude terms that cancel to between 1e-5 and
4e-10 in amplitude, so float64 rounding (about 1e-16 on each term) leaves a relative error of
1e-11 to 1e-7 in the residual, which is 1e-10 to 1e-6 dB. This is a limit of the arithmetic, not
of either implementation. numpy shows the same spread against itself: computing the same gain
with `inv(R)` and with `solve(R, a_sv)` disagrees by more than 1e-9 dB on 169 of the 456 links,
worst 7.9e-7 dB (`xval/crpa-jamming/conditioning.py`, written after the run and disclosed as
such). The bar of 1e-9 dB on this quantity was set without that analysis, and it stands as a
miss. The effective C/N0 that this gain feeds is unaffected: the jammer term is then below the
noise by 100 dB or more.

`tests/jamming_crpa.rs::a3_verdict_is_the_recorded_one` asserts this verdict (the count over the
bar for each weighting and quantity), so it fails if the numbers move.

## How to reproduce

```
cargo test --test jamming_crpa -- --ignored export_crpa_oracle_inputs   # writes inputs.json
python3 -I xval/crpa-jamming/oracle.py xval/crpa-jamming/inputs.json xval/crpa-jamming/expected.json
python3 -I xval/crpa-jamming/conditioning.py xval/crpa-jamming/inputs.json
cargo test --test jamming_crpa -- --nocapture
```

A1: build the release binary at 08d83b4d and at this commit, run every scenario under
`scenarios/` with each, and compare the `result.json` files byte for byte.
