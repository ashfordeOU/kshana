# W57 handover: kshana-bench and the interference observatory (0.38, WS-F)

Branch `feat/bench-observatory-0.38` (from origin/main, v0.37.0). Pre-registration committed alone in 4e1a0ed.

## What is here

| Path | What |
|---|---|
| `bench/SPEC.md`, `bench/LICENCES.md` | the specification (1.0.0) and the per-dataset licence review |
| `bench/manifests/`, `bench/schema/`, `bench/holdout/`, `bench/results/`, `bench/site/` | split manifests, result schema, holdout commitment, baseline results, the static leaderboard page |
| `src/bench/` | `kshana bench ...` (scoring, tasks a to d, baselines, sealing, manifests, leaderboard) |
| `xval/bench/PREREGISTRATION.md`, `PREREGISTRATION-v2.md`, `RESULTS-v1.md`, `RESULTS-v2.md` | the bars (committed first) and the scored runs; v2 (spec 2.0.0) exists because the v1 split of task (a) left the holdout without a jamming epoch |
| `src/interference_map/observatory.rs` | `kshana interference-map daily` and `sensitivity` |
| `docs/observatory/METHOD.md`, `RESULTS.md` | the method note and the back-catalogue and sensitivity results |
| `scripts/fetch_jammertest2024.sh`, `fetch_adsblol_day.sh`, `observatory_backcatalogue.sh` | fetch scripts (pinned or recorded hashes) |
| `docs/BENCH.md` | how to use the benchmark |
| `surface::bench_score`, `bench_leaderboard`; Python, WASM, MCP `score_benchmark`, `render_leaderboard` | the text-in, text-out surfaces |

## Owner decisions pending

1. Licence of the spec text and the manifests ("CC-BY-4.0 / CC0 proposed" until confirmed).
2. OAKBAT and the SimulaMet 2025 DataPort set are out until their licences are read and cited.
3. Counsel: a leaderboard of scores over GPL-3.0+ JammerTest data is assumed not to be a derivative work.
4. The sealed holdout seed (task d) is with the coordinator for the owner; only its hash is committed.
5. Publication of any observatory product is the owner's call: the command enforces the delay and the vocabulary, not the decision to publish.

## Open items (not done, stated plainly)

- The almanac-HDOP scorer of the cited paper is not implemented (paper paywalled; METHOD.md says so).
- Task (a) event-level metrics wait for W54's Jammertest scorer (`feat/referee-0.38`); it is merged into this branch only once pushed.
- Task (b) baseline is carried from DETECTION-ROC.md, not re-run. TEXBAT has no pinned hash.
- Task (d) second OOD track (scale 0.25) is defined but not scored (D1 missed at 0.5; scoring it afterwards would be a post-hoc search).

## CHANGELOG text for the integrator

- **kshana-bench v1** (`kshana bench`, `bench/SPEC.md`, `docs/BENCH.md`): fixed tasks, splits and metrics for GNSS interference detection on receiver logs (JammerTest 2024) and IQ, timing holdover prediction (IGS clocks) and the out-of-distribution optimism gap; split manifests with pinned hashes and fetch scripts (no data vendored); a sealed holdout by commit and reveal; a result-file schema; a static leaderboard page. Baselines under bars pre-registered in `xval/bench/PREREGISTRATION.md`: scorer bars met, C1 to C3 met, D2 met, **D1 NOT MET** (pinned). Every score is MODELLED. Python `bench_score`, `bench_leaderboard`; WASM the same; MCP `score_benchmark`, `render_leaderboard`.
- **Interference observatory** (`kshana interference-map daily`, `sensitivity`, `docs/observatory/METHOD.md`): a reproducible daily GeoJSON, PNG and incident-report JSON with three states (degraded, not degraded, not observed), a 24 h minimum delay, cells of 0.5 degrees or coarser, no cause attributed and OpenSky data refused; a sensitivity study of the pre-registered parameters; a 30-day Baltic back-catalogue from adsb.lol.

## Gates

See the final report to the coordinator for the gate results at the final SHA.
