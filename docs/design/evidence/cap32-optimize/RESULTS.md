# CAP-32 campaign optimiser: results

Protocol: `PREREGISTRATION.md` in this directory. Test: `tests/campaign_optimize_reference.rs`,
and P1 in `src/campaign/optimize.rs`. Every row is **MODELLED**: the oracles are a closed form
and a brute-force grid, not an external tool.

## Round 1 (the protocol as pre-registered)

| Bar | Outcome | Numbers |
|---|---|---|
| P1 Rosenbrock | see the Round 1 P1 line below | |
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
