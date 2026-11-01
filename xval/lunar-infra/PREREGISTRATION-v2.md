# Pre-registration v2 for the `lunar-infrastructure` bars not met (0.40 WS-D): signed off 24 October 2026

**Status: signed off by the owner on 24 October 2026, before any run.** The owner's answer, as relayed, verbatim: "Sign off, weak
parts exploratory (Recommended)". The option chosen reads: "Run them as drafted. Campaigns relying on illustrative priors, or on a
source not pinned before the run, are labelled EXPLORATORY and can't close the original bars. Any campaign whose source isn't pinned
simply doesn't run. The original misses stay NOT MET." Nothing had been run or computed when this was signed. No bar below changes after
this commit; a later change is a new pre-registration. A campaign that passes is reported as its own bar, never as an original one.

**What stays as it is.** `PREREGISTRATION.md`, `PREREGISTRATION-amendment-1.md`, `RESULTS.md` and the stored results
(`tests/fixtures/lunar_infra/phase_full_run.json` and the study results) are the record and are not edited. The three
misses below stay NOT MET, pinned by the tests that assert them. No bar is loosened. A bar below that is met does not turn
the old bar met; it is a new, separately named result. Everything is MODELLED, and an independent numerical program
(numpy, scipy) checks the implementation of stated formulas, not lunar physics, so nothing here moves a ledger row to
VALIDATED.

## The three bars not met

| Old bar | Statement | Recorded result |
|---|---|---|
| C3 | in the model-error example the fraction of trials with q above the 95 % point of chi-square(6) (12.592) is at least 0.5 | 0.0525 at an injected 3e-10 m/s2; the onboard (Earth-GNSS) orbit is known to about 351 m against 23 m for the ground solution, so about ten metres of displacement hides inside its covariance |
| Q3 | an independent numpy program recomputes the ambiguity covariance, the baseline covariance and the bootstrapped success rate of the exported float design to a relative 1e-9 | covariances MET; the bootstrapped rate differs by 1.7e-6, from the normal CDF used inside the success-rate routine (an approximation good to about 1e-7 per factor, over 69 factors) |
| G3 | adding each observable family never decreases the smallest eigenvalue of the information and never increases the CRLB trace (all 15 subsets) | the smallest eigenvalue never falls (28 of 28 additions); the trace of the pseudo-inverse was no larger in 16 of 28 and rose in 12, each time because the added family raised the rank of a rank-deficient information matrix |

Integer fixing not being achieved (study 2: 1 to 3 % at 25 dBi; not formable at 12 dBi) is a finding, not a missed bar,
and is outside this document.

## Public data and sources

| Item | Source | Status |
|---|---|---|
| The float design of the carrier-phase study | `tests/fixtures/lunar_infra/phase_design.json`, SHA-256 `401d9e5b199acf4a028a751305894a7cf0d8eaac058137ade91aeffaf487442e`; its numpy oracle `phase_oracle.json`, SHA-256 `59b2432d360bf68772a6421ecbce263ad746e21f4e90f08186a15bd7cf6b8394` | committed with the study; both pinned here |
| The geodesy geometry and oracle | `geodesy_geometry.json`, SHA-256 `f2344f98d4c027b6a306703e2023e61e77c002d6542f67ee7374adb1fa205b2f`; `geodesy_oracle.json`, SHA-256 `0f78bdbad4732d10b3ced96a8d8ff4ed0d7233325b3a7c5264179dc37035d746` | committed with the study; both pinned here |
| Chi-square and noncentral chi-square distributions | standard definitions, evaluated by scipy (`scipy.stats.chi2`, `ncx2`, `norm`) in the independent oracle | public library; the version used is recorded in the result |
| The lunar tidal Love number k2 and its uncertainty (prior for G3') | the GRAIL gravity-field result already cited in `PREREGISTRATION.md` (k2 = 0.024116 with a stated uncertainty of 0.000108) | cited there; not re-read for this draft |
| Prior widths for h2, l2 and the libration angles (G3') | **none is public and verified.** The widths are fixed in this document as ILLUSTRATIVE values (below) and labelled so everywhere they appear | stated inputs, not measurements |

## Rules

1. The original configuration is the control in every campaign and is re-run alongside it; it must reproduce the recorded
   numbers (C3: 0.0525 at the stated seed and trial count; Q3: the 1.7e-6 difference; G3: 28 of 28 and 16 of 28). A mismatch
   stops the campaign.
2. One change per campaign, declared here; the seed (20261019) and the trial counts are as recorded.
3. No bar is tuned. Every number is published whether or not it helps, in new result files, and pinned by tests that assert
   the verdict including a miss. No `#[ignore]`.
4. Nothing is run before sign-off, and code for the changes below is written, with a test first, only after it.

## Campaign C: what the orbit-consistency statistic can detect (replaces the question C3 asked, keeps C3 as recorded)

C3 asked for detection of a fixed 3e-10 m/s2 acceleration. The recorded result shows the statistic cannot see it with this
geometry, so the question that can be answered is: what is the smallest unmodelled acceleration it can see, and does the
statistic behave as theory says at every size?

- **Method.** The statistic is q = (x_G - x_D)^T S^-1 (x_G - x_D), the six-vector difference of the onboard and ground
  estimates over its formal covariance S. An unmodelled constant acceleration a along the stated axis shifts the mean of
  the difference by a vector d(a) = a g, where g is the linear response of the difference to a unit acceleration, computed
  from the study's own state-transition and design matrices, with no Monte Carlo. Then q is noncentral chi-square with
  six degrees of freedom and noncentrality lambda(a) = a^2 g^T S^-1 g, so the analytic power at the 95 % point is
  P(ncx2(6, lambda(a)) > 12.592). Monte Carlo trials as in the recorded example: N = 400 per grid value.
- **Grid (fixed now).** a = 3e-10 (the recorded value), 1e-9, 3e-9, 1e-8, 3e-8, 1e-7 m/s2.
- **Bar C3a (calibration).** At every grid value the Monte Carlo fraction of trials above 12.592 is within three
  binomial standard errors (computed from N and the analytic power) of the analytic power.
- **Bar C3b (a detection limit exists).** Let a_detect be the smallest grid value whose analytic power is at least 0.5. The
  Monte Carlo fraction at a_detect is at least 0.5 minus three binomial standard errors, and the fraction at 1e-7 m/s2 is
  at least 0.9. If no grid value has analytic power 0.5, a_detect is reported as "above 1e-7 m/s2" and C3b is not met.
- **Reported, not a bar.** a_detect, the analytic power at every grid value, the displacement the acceleration produces
  over the arc, and the ratio of the displacement to the onboard solution's position sigma.
- **Not claimed.** That any real orbit-determination system has this detection limit.

## Campaign Q: the success-rate oracle with an accurate normal CDF (re-test of Q3 after a stated fix)

- **Change.** The normal CDF inside the bootstrapped success-rate routine is replaced by an implementation of the
  complementary error function accurate to better than 1e-14 relative error in double precision, by a published
  algorithm (public, not a copy of any library): the Taylor series of erf for |x| up to 3 and the continued fraction of erfc beyond (a
  choice of algorithm made at sign-off in place of a rational approximation, before any run; Q3a checks its accuracy independently). Nothing else in the study changes.
- **Bar Q3a (the CDF alone).** On 10,000 arguments drawn from [-8, 8] with the stated seed, the new CDF equals
  `scipy.special.ndtr` to a relative 1e-12 (absolute 1e-300 for results below 1e-300).
- **Bar Q3b (the original bar, the same data).** On the float design `phase_design.json` (SHA-256 above), the Rust ambiguity
  covariance, baseline covariance and bootstrapped success rate equal `phase_oracle.json`'s numpy values to a relative
  **1e-9** (the original tolerance, unchanged). The covariances already meet it; the point is the success rate.
- **Reported, not a bar.** The new relative difference of the success rate, and the change in the study's own bootstrapped
  success rates (Q1 and Q2 are re-evaluated on the same Monte Carlo draws; their verdicts must not change, and if one does the
  campaign reports it as a finding).

## Campaign G: information adds, with the rank problem made explicit (re-test of G3 in two forms)

The pseudo-inverse trace of a rank-deficient information matrix can rise when a family adds rank (the added direction
now contributes variance that was previously dropped). So the statement of G3 about the trace is not a property of the
estimator but of the pseudo-inverse. Two honest forms follow.

- **Bar G3' (with priors: the trace statement is a theorem, so this tests the implementation). EXPLORATORY: the h2, l2 and libration prior widths are illustrative, so a pass here cannot close G3, and the bar is labelled EXPLORATORY in the result.** Add a prior information
  matrix P = diag(1 / sigma_p^2) over the five parameters (h2, k2, l2, two libration angles), with prior sigmas fixed now:
  k2 0.000108 (the cited GRAIL uncertainty); h2 and l2 each 20 % of their nominal values; each libration angle 1 arcsecond.
  **The h2, l2 and libration widths are ILLUSTRATIVE, not measurements, and are labelled so.** With P included every subset's
  information is positive definite, so the ordinary inverse exists. For all 15 subsets of the four families (laser
  ranging, orbiter tracking, surface gravimeter, surface clock) and every single-family addition to a smaller subset, the
  smallest eigenvalue never decreases and the trace of the inverse never increases, each within a relative 1e-12 of
  floating-point rounding. Mathematically both must hold (the added information is positive semidefinite), so a miss is an
  implementation fault.
- **Bar G3'' (rank-aware, no priors).** For every addition that does not raise the rank, the pseudo-inverse trace never
  increases (relative 1e-12). For every addition that raises the rank, the study reports the number and the gain in rank
  and is not scored on the trace.
- **Reported, not a bar.** The counts of additions in each case (rank-raising and not), the sensitivity of G3' to the
  prior widths (each prior width halved and doubled once, all results published, none used to choose the widths), and
  the original G3 statistic unchanged, so the recorded 16 of 28 stays visible beside the new ones.
- **Not claimed.** That the priors describe what is known about the Moon's response.

## Verdict rule

- Each campaign reports on its own, and a met bar says what its statement says and no more.
- The three recorded misses stay NOT MET, and their pinning tests stay as they are.
- The ledger rows stay MODELLED. Any wording change to a ledger row after these campaigns is the owner's decision, recorded
  in the commit that makes it.

## Sign-off

| | |
|---|---|
| Owner sign-off | **given, 24 October 2026**, quote and option above |
| EXPLORATORY | G3' (illustrative prior widths) and its prior-width sensitivity |
| Not exploratory | C3a and C3b (analytic, from the study's own matrices); Q3a and Q3b (against scipy and the pinned design); G3'' (rank-aware, no priors) |
| Sources | the pinned fixtures and the cited GRAIL k2 result already named above; no source is needed beyond them |
| Date of sign-off | 24 October 2026 |

The scored runs are made on the commit that follows this one. Results go to `RESULTS-v2.md`; the recorded results and their tests are untouched.
