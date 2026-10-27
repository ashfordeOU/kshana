# Results of the v2 campaigns for the `lunar-infrastructure` bars not met

Bars are those of `PREREGISTRATION-v2.md`, signed off by the owner on 24 October 2026 in commit `e9c6fb1a` before any run;
no bar changed afterwards. Everything is **MODELLED**. The scipy program checks the implementation of stated formulas,
not lunar physics, so nothing here moves a ledger row to VALIDATED. This is evidence-support information, not
operational or safety-of-life advice. Seed 20261019, 400 trials, as recorded in the original study.

**The original bars stay as recorded: C3 NOT MET, Q3 NOT MET, G3 NOT MET.** The bars below are new, separately named, and
a pass on one of them says what its own statement says and no more. The recorded results and their tests are untouched.

| Bar | Verdict | Value |
|---|---|---|
| C3 (original) | NOT MET (unchanged) | 0.0525 at 3e-10 m/s2 against at least 0.5; the control run reproduces it exactly |
| C3a calibration | MET | the Monte Carlo fraction is within three binomial standard errors of the analytic noncentral chi-square power at all six grid values |
| C3b a detection limit exists | MET | a_detect = 3e-9 m/s2 (analytic power 0.736, Monte Carlo 0.725); fraction at 1e-7 m/s2 is 1.0 (at least 0.9) |
| Q3 (original) | NOT MET (unchanged) | bootstrapped rate differs by 1.72e-6 with the original CDF routine, which is untouched and still reproduces the miss |
| Q3a accurate CDF vs `scipy.special.ndtr` | MET | worst relative error 1.4e-13 over 10,000 arguments in [-8, 8] (bar 1e-12) |
| Q3b the original bar with the accurate CDF | MET | relative difference 9.8e-12 on the pinned float design (bar 1e-9, unchanged) |
| G3 (original) | NOT MET (unchanged) | smallest eigenvalue never fell (28 of 28); trace no larger in 16 of 28 |
| G3' information adds, with priors (**EXPLORATORY**) | MET, exploratory | 28 of 28 for both statements; worst relative violation 0 (bar 1e-12) |
| G3'' rank-aware, no priors | MET | in the 12 additions that do not raise the rank the pseudo-inverse trace never rose; 16 additions raise the rank and are not scored on the trace |

## C: what the orbit-consistency statistic can detect

The difference of the onboard (Earth-GNSS) and ground estimates under an unmodelled constant acceleration has a shifted
mean; its noncentrality is computed from the study's own matrices (no Monte Carlo): lambda = d^T S^-1 d, with d the systematic
difference from the very run. The power is P(ncx2(6, lambda) > 12.592) (scipy 1.18.1).

| a, m/s2 | lambda | analytic power | Monte Carlo fraction | displacement, m | displacement / onboard sigma |
|---|---|---|---|---|---|
| 3e-10 | 0.119 | 0.0547 | 0.0525 | 13.3 | 0.038 |
| 1e-9 | 1.33 | 0.110 | 0.0975 | 44.5 | 0.127 |
| 3e-9 | 11.9 | 0.736 | 0.725 | 133 | 0.380 |
| 1e-8 | 133 | 1.000 | 1.000 | 445 | 1.27 |
| 3e-8 | 1195 | 1.000 | 1.000 | 1334 | 3.80 |
| 1e-7 | 13276 | 1.000 | 1.000 | 4448 | 12.7 |

The statistic behaves as theory says at every size, and it can see an unmodelled acceleration from about 3e-9 m/s2, ten
times the 3e-10 the original bar asked for. That is the result of C3a/C3b; the original C3 is not met. Using the exact 95 % point
(12.5916) instead of the registered 12.592 changes the powers in the fifth decimal and neither verdict. **Not claimed:**
that any real orbit-determination system has this detection limit.

## Q: the success-rate oracle with an accurate normal CDF

The complementary error function is the Taylor series of erf below 2 and the continued fraction of erfc from 2 (as fixed
at sign-off). The original `bootstrap_success_rate` is untouched; the new `bootstrap_success_rate_accurate` is separate.
On the pinned float design, the original routine's bootstrapped rate differs from the numpy value by 1.72e-6 (the recorded
miss); with the accurate CDF the difference is 9.8e-12. Q1 and Q2 re-evaluated on the same Monte Carlo draws (the stored
rates; the bootstrapped rate changes by a relative 5e-6 to 1.4e-5 per arc): their verdicts do not change. **The original Q3 stays
NOT MET**: Q3b passing says the fix removed the cause the original result named, not that the original bar was met.

## G: information adds, with the rank problem explicit

G3' adds a prior information matrix over (h2, k2, l2, two libration angles). The k2 width is the GRAIL uncertainty already
cited (0.000108); **the h2 (20 %), l2 (20 %) and libration (1 arcsecond) widths are illustrative, not measurements**, so G3'
is **EXPLORATORY** and cannot close G3. Mathematically it must hold (added information is positive semidefinite), so a pass tests the
implementation; every prior width halved and doubled once (ten variants, none used to choose the widths) also passes
(28 of 28 each time). G3'' needs no priors: of the 28 additions, 12 do not raise the rank and the pseudo-inverse trace does
not rise in any of them; 16 raise the rank, and those are where the original trace statistic missed. **Not claimed:** that
the priors describe what is known about the Moon's response.

## Reproduce

`cargo run --release --example lunar_infra_v2 rust.json && python3 xval/lunar-infra/oracle_v2.py rust.json xval/lunar-infra/results-v2.json`
(under a second plus the build). The verdicts are pinned by `tests/lunar_infra_v2.rs`.
