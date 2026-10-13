# Results: 24 h EGM2008 200×200 Cowell orbit against Orekit 12.2 (FUT-07)

First comparison run 2026-10-12, after the pre-registration (0aa312a6), with the full ICGEM
`EGM2008.gfc` (SHA-256 ab5b524da073e63b5bdceb7ca47a0de07a26dd44a1c5798f39fc98dc80af70fd) and the
Orekit fixture unchanged. Test: `tests/cowell_tesseral_200_orekit_oracle.rs` (data-gated).

| quantity | measured | pre-registered bar | outcome |
|---|---|---|---|
| Holmes–Featherstone evaluator, worst over 145 states | \|Δr\| 0.1317 m, \|Δv\| 1.453e-4 m/s | 0.5 m, 5e-4 m/s | **AGREES** |
| Classic evaluator (reported, no bar) | \|Δr\| 0.1318 m, \|Δv\| 1.453e-4 m/s | — | — |
| Degree-70 truncation vs the 24 h Orekit state (sensitivity control) | 0.726 m | must exceed 1 m | **MISS** |

**What the miss means.** Over this 24 h, 400 km, 51.6° orbit, degrees 71–200 move the satellite by
only about 0.7 m, while the two stacks agree to 0.13 m. The comparison therefore resolves the
degree content above 70 only about five to one, below the pre-registered requirement. It is
recorded as a miss and not re-run with a different orbit or bar. The orbit agreement is
characterised (MODELLED for the degree 71–200 content). The high-degree evaluator's own claim
rests on point accelerations (`xval/high-degree-gravity/`: Orekit to 7.3e-17 m/s² through degree
2190; MODELLED there because of a pre-registered pyshtools near-pole miss).

The test asserts bar 1, and pins the control miss (fails if the degree-70 control reaches 1 m),
so a change in either outcome forces this file to be updated.
