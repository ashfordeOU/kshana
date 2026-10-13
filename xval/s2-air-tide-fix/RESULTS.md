# Results: the S2 air-tide coefficient fix

Run 2026-10-13 after the pre-registration (5e31c37a), on the code of the fix commit.

## External check: GFZ STR06/01 Table 5, model A2 — AGREES

`tests/s2_air_tide_gfz_table5.rs`: all 21 of Ray's waves (12 prograde, 9 retrograde, n = 2 to 4)
agree with the transcribed Table 5 model A2 rows; worst 0.00050 cm in amplitude and 0.050° in phase,
against the pre-registered 0.0006 cm and 0.1° (the printed rounding is 0.0005 cm and 0.05°).

## Outputs that moved (all within the pre-registered bounds)

CI fixtures, before (rc code at 4af078df + merge) and after (this fix), printed precision:

| fit | before | after | bound |
|---|---|---|---|
| Galileo E11 Tier 1: 3D RMS, RTN, C_R | 0.132 m; 0.105, 0.067, 0.047 m; 1.1744 | 0.133 m; 0.105, 0.067, 0.047 m; 1.1743 | < 5 mm; < 1e-3 |
| Galileo E11 Tier 2: 3D RMS, RTN | 0.070 m; 0.048, 0.044, 0.027 m (4 iterations) | 0.070 m; 0.048, 0.044, 0.027 m (3 iterations) | < 5 mm |
| Swarm-A Tier 1 (dynamic, reported): 3D RMS, RTN | 2.687 m; 0.925, 2.522, 0.043 m | 2.687 m; 0.925, 2.522, 0.045 m | < 5 mm |
| Swarm-A Tier 2 (reduced-dynamic): 3D RMS, RTN | 0.098 m; 0.026, 0.092, 0.024 m | 0.098 m; 0.026, 0.092, 0.025 m | < 5 mm |

Every pass/fail bar of those tests keeps its outcome (the 5 m green bar, the tier checks).
`tests/tides_iers.rs` (7 tests, including the S2 amplitude band) passes unchanged. The full-arc
dispatch runs (`galileo_full_arc_dispatch`, `swarm_full_arc_dispatch`) were not re-run here.

## Byte-identity elsewhere

Unchanged after the fix: `tests/cross_platform_golden.rs`, `tests/golden.rs`,
`tests/registry_golden.rs`, `tests/published_figures_still_reproduce.rs`,
`tests/reproducibility_software_assurance_reference.rs`, `tests/precise_od_synth.rs` (17), and
`docs/predictions/` (no diff).

Status: the S2 conversion is VALIDATED against the published Table 5 (an independent
fully-normalised rendering of the same model). The geopotential effect of the air tide itself has
no external oracle and stays MODELLED.
