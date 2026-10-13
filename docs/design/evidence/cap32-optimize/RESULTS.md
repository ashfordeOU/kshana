# CAP-32 campaign optimiser: results

Protocol: `PREREGISTRATION.md` in this directory. Test: `tests/campaign_optimize_reference.rs`,
and P1 in `src/campaign/optimize.rs`. Every row is **MODELLED**: the oracles are a closed form
and a brute-force grid, not an external tool.

## Round 1 (the protocol as pre-registered)

| Bar | Outcome | Numbers |
|---|---|---|
| P1 Rosenbrock | MET | f* = 1.68 × 10⁻²⁰ at (1.000 000 000 013, 1.000 000 000 013), 234 evaluations |
| P2 analytic 1-D target | **NOT MET** | r = 100 000 km (the upper bound), r* = 5.718 × 10⁷ km, relative error 0.998, 153 evals |
| P3a grid = brute force | MET | best score 41.165 674 861 403 26 dB, bit-equal, same node (50 000 km, 1 × 10⁸ bit/s), 1681 evals |
| P3b Nelder–Mead ≤ grid | MET | 41.165 674 861 403 26 dB in 161 evals, stop `tolerance` |
| P4 corner maximum | MET | 134.165 674 861 403 26 dB, equal to the grid maximum, 151 evals |
| P5 reproducibility | MET | byte-identical JSON, SVG and summary; trace = evals = runs_total |

**Why P2 missed.** This is a protocol error, not an optimiser defect. With the
`scenarios/link-budget.toml` inputs, the margin is 92.1 dB at 2000 km, so the 3 dB range is
5.7 × 10⁷ km. That lies outside the pre-registered box [100, 100 000] km. The optimiser
correctly ran to the bound nearest the target. The bar stays as written, and P2 is recorded
NOT MET.

**Why P3 is weaker than intended.** The same error affects P3. The 3 dB contour does not cross
the P3 box (the margin there is ≥ 44 dB), so P3 tested a corner optimum, not a contour. P3 is met
as written. It is not read as evidence of an interior solve.

The corrected protocol is pre-registered as Round 2 in `PREREGISTRATION-ROUND2.md`, committed
before it ran.

## Round 2 (`PREREGISTRATION-ROUND2.md`; the optimiser code is unchanged from Round 1)

| Bar | Outcome | Numbers |
|---|---|---|
| P2′ interior 1-D target | MET | r = 57 181 263.491 328 km, r* = 57 181 263.491 328 km, relative error 6.1 × 10⁻¹⁵, 96 evals |
| P3′a grid = brute force | MET | best score 0.104 925 051 876 335 83 dB, bit-equal, same node (2.113 × 10⁸ km, 74 989 bit/s) |
| P3′b Nelder–Mead ≤ grid and ≤ 1e−6 dB | MET | score 0 dB in 177 evals, stop `tolerance` |

Round 1's P2 remains NOT MET. The test `p2_round1_not_met_the_box_excludes_the_closed_form`
pins that recorded outcome: the optimiser stops at the 100 000 km bound. It does not move the
bar.

**Status: MODELLED.** The optimiser meets its pre-registered internal oracles. It makes no
external or global-optimum claim.
