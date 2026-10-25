# Pins and published charts that moved when run outputs gained an evidence label (0.40, workstream A)

Date: 2026-10-25. Bars, tolerances, scenarios and scored values: unchanged.

Every run output now carries an evidence label (`src/evidence_label.rs`): a top-level `evidence` key in the result JSON,
a `<metadata id="kshana-evidence">` element and a visible line in a strip under the chart SVG, and `# evidence:` comment
lines in front of a CSV table. The label is additive by construction: `evidence_label::strip_json`, `strip_svg` and
`strip_csv` restore the unlabelled bytes exactly (unit-tested byte for byte), and `api::without_evidence_labels` applies
them to a run output.

## 1. Pinned hashes: no pin was re-blessed

Every harness that hashes or compares run bytes against a value frozen before the label existed now hashes the run
through `api::without_evidence` / `without_evidence_labels` (or reads the CSV past its comment lines): `registry_golden`,
`cross_platform_golden`, `cislunar_arc_recovery_reference`, `dominance_demonstrators`, `lunar_llr_real_data`,
`lunar_station_time_lab`, `lunar_station_geodesy`, `figure_tiers_every_kind`, `fusion_coupled_pack`, `prediction_frozen`
(the frozen predictions' portable reruns), `skyline_scenarios` (the 0.36 portable baseline), `operational_eop_predictor_reference`
(the frozen persistence CSV), and the receiver-trust, telecom-timing and IQ-sweep tests that read CSV tables. Their
frozen constants are unchanged: the same values are reproduced, now of the unlabelled document. The label itself is
pinned apart, by `tests/evidence_labels_doc_sync.rs` and `tests/evidence_pack_label.rs`.

## 2. The three README demo charts were re-rendered

`docs/assets/clock-holdover.svg`, `inertial-deadreckoning.svg` (from `scenarios/imu-deadreckoning.toml`) and
`orbit-gnss-challenged.svg` are compared by `tests/published_figures_still_reproduce.rs` with what the engine emits
today, and the engine now emits the label. Each was re-rendered with `kshana <scenario>` and the emitted `.chart.svg`
copied over it. Each equals the previous committed chart with the label added, and nothing else differs: stripping the
label (`evidence_label::strip_svg`) from each new chart gives the previous committed file byte for byte (checked for all
three). The test now says "ONLY the evidence label differs" when that is the case.

No result number, scored value or tolerance moved.
