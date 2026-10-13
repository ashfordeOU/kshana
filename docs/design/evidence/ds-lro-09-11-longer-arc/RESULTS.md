# LRO longer arc, degree 150, lunar k2 tide and relativity: results (information only)

Protocol: `PROTOCOL.md` (8fcb15ca). **Disclosure:** runs 1 and 2 were started about ten
minutes before the protocol commit. Their results were not seen until after it, and the
protocol sets no bar beyond the existing ones. Run 3 started after the protocol commit.

| Run | Dynamic 3-D RMS | Reduced-dynamic 3-D RMS | Compared with |
|---|---|---|---|
| 1. 4 h arc, analytic default, + lunar k2 tide (0.02405) + Schwarzschild (DS-LRO-11) | 12.287 m | 6.660 m | default 12.049 / 6.668 m |
| 2. 4 h arc, ANISE DE-grade, d/o 150 (DS-LRO-04) | 12.065 m | 6.759 m | d/o 100: 11.959 / 6.665 m |
| 3. 24 h arc, analytic default, d/o 100 (DS-LRO-09) | not completed | not completed | — |

Reading: neither the tide and relativity terms nor the full degree 150 move the
reduced-dynamic floor. The tide makes the dynamic tier 0.24 m worse, and degree 150 is 0.1 m
worse on both tiers than degree 100. Both are consistent with the floor being unmodelled LRO
non-gravitational dynamics (DS-LRO-10), not missing gravitational terms or field truncation.
Run 3 did not finish within the 7 000 s limit in this container (the 1 441-epoch batch with
its variational equations). It is wired as `tests/agency_lro.rs::lro_fit_over_a_longer_arc`
(ignored) and runs in the manual `lro-de440-opt-in` CI job (180 min). Its number is still to
be recorded.
