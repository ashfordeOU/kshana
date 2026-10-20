# H2 handover (lunar-infrastructure, branch feat/lunar-infra-0.38)

State: all five studies implemented, scored, wired and documented. See `xval/lunar-infra/RESULTS.md` for verdicts and
`docs/LUNAR-INFRASTRUCTURE.md` for the studies.

Code: `src/lunar_infra/{orbit,gnss,od,phase,frame,tie,geodesy,la,units,mod}.rs`; one kind, `study` selects.
Oracles: `scripts/gen_lunar_infra_oracle.py` (scipy STM), `..._phase_oracle.py`, `..._oracles.py` (numpy); inputs from
`examples/gen_lunar_infra_*.rs`; fixtures in `tests/fixtures/lunar_infra/`.
Tests: `tests/lunar_infra_{od_consistency,carrier_phase,studies_3_5}.rs`.

Scored carrier-phase configuration (about eight minutes): `xval/lunar-infra/scenarios/carrier-phase-scored.toml`; its
stored result is `phase_full_run.json`. The shipped example is a quick run.

Open at integration: regenerate the count surfaces (README badge test `verification::tests::readme_headline_counts_match_the_matrix`
fails until the matrix count 384 is propagated; kind-count sites; Studio/web copies), per the common rules.
Not done: a Studio view (no Studio entry), a study SVG (the svg is empty), a post-hoc sweep for C3.
