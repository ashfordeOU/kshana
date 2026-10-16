# Results: box-wing and ECOM2 SRP against Orekit 12.2

First comparison run 2026-10-13 after the pre-registration (e59df6bf); the driver was written and
run only after that commit, and the fixture is committed as produced. Test:
`tests/srp_boxwing_orekit_oracle.rs`.

| bar | cases | measured | pre-registered | outcome |
|---|---|---|---|---|
| A1 flat-plate sum, same attitude and flux (3 models) | 1056 (756 yaw + 300 random) | worst \|Δ\|/\|a\| 2.05e-15 | ≤ 1e-12 | **AGREES** |
| A2 end to end, full sun (3 models) | 747 | worst 2.39e-15 | ≤ 1e-11 | **AGREES** |
| A3 negative control, Orekit default pressure | 747 | smallest gap 4.43e-3 | > 1e-3 | **met** |
| B nominal yaw vs `GenericGNSS` | 252 (0 excluded) | worst element 1.89e-15 | ≤ 1e-12 | **AGREES** |
| C radiation-factor partial vs Orekit `Gradient` | 756 | worst 1.35e-15 | ≤ 1e-12 | **AGREES** |
| D per-panel ρ and δ partials vs Orekit central differences | 10 836 panels × 2 | worst \|Δ\|/\|a\| 4.12e-13 | ≤ 1e-9 | **AGREES** |
| E ECOM2 acceleration (10 parameter vectors) | 2520 | worst \|Δ\|/Σ\|p\| 1.73e-15 | ≤ 1e-12 | **AGREES** |
| E ECOM2 partials (9 unit vectors) | 2268 | worst 1.74e-15 | ≤ 1e-12 | **AGREES** |

Inputs: the test first checks that the driver's panel tables (area, normal or axis, α, ρ, δ,
kind) and masses equal kshana's `BoxWing::galileo_foc`, `galileo_iov` and `galileo_iov_eol`
exactly, and that Orekit's lighting ratio is exactly 1 at every geometry kshana's
`conical_shadow` puts in full sun (747 of 756 model-geometry pairs; 3 geometries are in the
Earth's shadow).

Status: the box-wing flat-plate evaluation, its radiation-factor and per-panel partials, the
nominal yaw-steering attitude and the ECOM2 evaluation and partials are VALIDATED against Orekit
12.2 as model evaluations. What that does not cover is unchanged from the pre-registration: the
adequacy of a box-wing (or of the GSC tables) for real Galileo orbits, thermal re-emission, the
modified low-β yaw law and eclipse turns. The Galileo SRP prediction itself stays MODELLED.
