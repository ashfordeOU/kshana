# D12 rows: what is still unfolded after main `b4cd2b3b`

Main `b4cd2b3b` folded this branch up to `31f5bf93`: the row "Lunar frame datum covariance with
the stations estimated, against 50-digit extended precision" is VALIDATED there, and "Lunar
frame datum from an observing campaign" (M074) stays MODELLED with a pointer. This file covers
only the commits after that fold, merged with main in the commit that adds this text:

| Commit | What |
|---|---|
| `f61fe58a` | wording change to the folded row and the M074 decision; now proposals A1 and A2 below |
| `b84ce19b` | pre-registration of the rank-decision check (section C) |
| `263e7709` | rank-decision check run and recorded (section C) |
| `b41908c9` | pre-registration of the square-root information solver (section B) |
| `87b27701` | `src/linalg_sr.rs` and the opt-in `solver = "srif"` in `lunar_frame_campaign` (section B) |
| `3bb28f95` | srif oracle run and recorded; chord comparator in both strict tests (sections A3 and B) |
| `85c89af4` | fold files (superseded by this rewrite) |
| (this commit and the one before it) | opt-in square-root paths in six more modules (section D) |

Step 2 (the solver) was carried out at the founder's instruction of 2026-10-02 ("do
everything"), which overrides the earlier scoping of step 2 out of this session.

## A. Proposed text edits to rows already on main (the integrator applies row text)

### A1. Narrow the claim of "Lunar frame datum covariance with the stations estimated, against 50-digit extended precision"

Decided 2026-10-02. In its `capability`, after the final sentence ("Reported: the seven datum
sigmas, the Helmert condition number and the weakest direction"), append:

> . CLAIM, NARROWED: the engine's datum sigmas and condition number lie within the a-priori worst-case error bound of a backward-stable double-precision pipeline on this problem; this does not claim they are as accurate as double precision allows (a factorisation route is about a thousand times more accurate on the same inputs, and the opt-in square-root solver about ten million times), and the weakest direction is validated only where its bar is below a right angle (the stations-fixed control)

### A2. Record option A on "Lunar frame datum from an observing campaign" (M074)

In its `tests` field, replace

> (finding, promotion of this row pending a founder decision:

with

> (finding; founder decision 2026-10-02, option A: this row stays MODELLED and does not borrow the separate row's status;

The row's status stays `Modelled`.

### A3. Measurement fix in the folded row's test (commit `3bb28f95`)

`tests/lunar_frame_campaign_mpmath_oracle.rs` now measures the weakest direction by the chord
between sign-aligned unit vectors instead of `acos` of the cosine, which cannot resolve angles
below about 1.5e-8 rad and read 0 on the stations-fixed control against a 9.4e-11 bar. The bars
are unchanged. Measured: 5.9e-6 and 2.7e-5 rad (stations estimated, as before) and 6.6e-16 rad
on the control, now a real pass. Proposed addition to the folded row's `oracle`, after "so that
one check is not counted":

> ; on the stations-fixed control the weakest direction agrees to 6.6e-16 rad against a 9.4e-11 bar, measured by the chord between unit vectors (an earlier acos comparator could not resolve angles below 1.5e-8 rad; the bar is unchanged)

## B. New row, proposed VALIDATED (P2): square-root information datum solver against extended precision

Outcome: **PROMOTE** (new row).

### Proposed `VerificationItem`

```rust
        VerificationItem {
            requirement: "Square-root information datum solver against 50-digit extended precision",
            capability: "An opt-in square-root information solver (lunar-frame-campaign solver = \"srif\"; default unchanged) that never forms or inverts an information matrix for the datum: Householder QR (orthogonal-triangular decomposition) of the whitened delay Jacobian as a square-root information filter measurement update, the Earth stations marginalised through the trailing triangular block (whose Gram product is the Schur complement), a second QR of R_bb A for the seven-parameter Helmert datum, sigmas as the row norms of the triangular inverse, and the spectrum (condition number, weakest direction) from a one-sided Jacobi singular value decomposition. Inner products are compensated with a Dekker-split error-free product, so every operation is a correctly rounded IEEE-754 basic operation or square root and the result is the same on every platform",
            module: "linalg_sr, lunar_frame_campaign",
            tests: "tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: four scenarios — stations estimated on a new campaign date 2026-06-09 (binding), stations fixed on that date (control), and the 2026-03-18 and 2024-01-01 stations-estimated inputs; every datum sigma, the condition number and the weakest direction against a square-root-form bar recomputed in the test from the oracle's exact ingredients; engine_inputs_match_the_committed_fixture); linalg_sr::tests (9 lib tests: the Dekker product equal to the fused multiply-add residual on 20 000 pairs, compensated summation of a cancelling sum, R^T R equal to A^T A, sequential filter updates equal to one batch update, the trailing block equal to the square root of the Schur complement, the triangular inverse, the Jacobi SVD, agreement with the spectral datum on a well-conditioned case, bit-identical reruns); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected and the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so",
            oracle: "mpmath 1.3.0 (BSD-3-Clause) at 50 significant digits, self-checked at 80 (agreement 1.4e-43 or better), on the engine's committed Jacobian, weights and Helmert design (P2, an independent numerical library: mpmath's own LU solve, inverse, Cholesky and Jacobi eigen-decomposition). Pre-registered b41908c9 before the solver was written, with bars from a first-order backward-error bound in square-root form: Householder QR constant mn plus (3n+1)n times the unit roundoff (Higham, Accuracy and Stability of Numerical Algorithms, Theorem 19.4 and Chapter 8) times exact sensitivities. Measured: datum sigmas within 3.0e-13 on 2026-06-09 (bars 4.1e-7 to 5.3e-7), 1.9e-15 with the stations fixed (bars down to 4.8e-12), 3.8e-13 on 2026-03-18 and 2.3e-13 on 2024-01-01, where the default spectral solver is off by 4.8e-6 and 9.7e-6; condition number within 4.9e-13; weakest direction within 1.4e-13 rad (control 1.7e-16 against 5.1e-10). The check detects datum errors above about 2e-7 relative; a flipped Householder sign and an uncompensated dot product do not degrade these inputs measurably and are not detected. Validates the opt-in solver's linear algebra on committed inputs, not the Jacobian and not the default solver; bit-reproducibility across platforms is argued from the operations used and tested only as rerun identity on one platform",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

### Proposed `validated_oracle_basis()` entry

```rust
        OracleBasisEntry {
            requirement: "Square-root information datum solver against 50-digit extended precision",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_frame_campaign_srif_mpmath_oracle.rs",
            source: "mpmath 1.3.0",
            flag: "",
        },
```

(`"mpmath"` is already in `NUMERICAL` on main.)

### Record

- **Pre-registration commit:** `b41908c900cf75ad9bbf2c7c9e474e5045a2de14`, pushed 2026-10-02
  16:19:00 UTC, before `src/linalg_sr.rs` existed, before the fixture and before the oracle run.
  It specifies the algorithm, the scenarios, the oracle and the bar formula; tests ignored.
- **Date rule, disclosed:** first day from 2026-06-01 whose stations-estimated campaign the
  engine reports full rank in both blocks; an engine-only probe of 2026-06-01 to 06-10 (count,
  defect, station flag only) gave 2026-06-09 (56 observations).
- **Oracle:** mpmath 1.3.0; fixture `tests/fixtures/lunar_frame_campaign_srif_mpmath_oracle/`
  with `gen_reference.py` (imports the folded oracle's helpers unchanged) and `NOTICE.md`.
- **Tolerance:** `c = (3n+1)n + mn`, `e_J = c u sqrt(trace F)`, `e_B = c u sqrt(trace H)`;
  sigma `k`: `1e-12 + (e_J ||Zt C e_k|| + e_B ||C e_k||)/sqrt(C_kk) + c u ||row k of |X||R_H||X| ||/||row k of X||`;
  eigenvalue `t(l) = 2(e_J ||Zt v|| + e_B + c u sqrt(l_max))/sqrt(l)`, condition
  `1e-12 + t(l_min) + t(l_max)`; weakest direction
  `1e-12 + 2 sqrt(l_max)(e_J ||Zt||_2 + e_B + c u sqrt(l_max))/(l_2 - l_1)` rad.
- **Result:** all checks pass.

  | Scenario | Sigma error (max) | Sigma bars | Spectral solver, same inputs | Condition err / bar | Weakest dir. / bar |
  |---|---|---|---|---|---|
  | stations estimated 2026-06-09 (binding) | 3.0e-13 | 4.1e-7 to 5.3e-7 | not run | 1.1e-13 / 1.1e-6 | 2.6e-14 / 3.5e-2 rad |
  | stations fixed 2026-06-09 (control) | 1.9e-15 | 4.8e-12 to 4.2e-10 | not run | 2.1e-15 / 1.2e-9 | 1.7e-16 / 5.1e-10 rad |
  | stations estimated 2026-03-18 | 3.8e-13 | 3.3e-7 to 5.1e-7 | 4.8e-6 | 1.2e-13 / 1.0e-6 | 1.4e-13 / 0.10 rad |
  | stations estimated 2024-01-01 | 2.3e-13 | 1.9e-7 to 3.0e-7 | 9.7e-6 | 4.9e-13 / 6.3e-7 | 2.2e-14 / 4.6e-2 rad |

- **Mutation evidence (each on the restored solver, run, reverted):** one-sweep Jacobi SVD: red
  (8 failures; weakest direction 0.76 rad against 3.5e-2). Whitening scaled by `1 + 1e-6`: red (28
  failures; sigmas 1.0e-6 against bars down to 1.9e-7). Flipped Householder sign: green (3.8e-13,
  unchanged). Plain dot product: green (1.1e-12). The last two are recorded as the limit of the
  check.
- **Disclosures:**
  - Before the record was written, `src/linalg_sr.rs` was found carrying three unreviewed edits
    that contradicted the pre-registered algorithm (plain dot product, flipped Householder sign,
    sigmas from a spectral inverse), consistent with mutation experiments of an interrupted
    session that were not reverted. They were removed; the re-run reproduced the earlier run's
    figures bit for bit. The four mutations above were redone on the restored code.
  - The weakest-direction comparator was changed from `acos` to the chord measure after the run
    (bars unchanged), as in section 1.
  - Scope: this row's evidence covers the `lunar_frame_campaign` path only. The other modules the
    roadmap lists gained opt-in square-root paths afterwards (section D); they are not covered by
    this row and claim no external validation. D4 touches `src/lunar_vlbi_fim.rs` only, so this
    branch has no textual conflict with it. The Dekker helpers live in `src/linalg_sr.rs` rather
    than `src/portable_math.rs` to avoid a conflict with the unfolded D7; they can move after D7
    folds.
  - Cross-platform bit-identity is argued from the operations used (no host mathematics library
    call, no fused multiply-add in the production path) and tested only as rerun identity here.
  - `record_engine_accuracy_against_a_factorisation_route` (folded row) still passes: it tests the
    default spectral solver, which this work leaves unchanged by design. Making `srif` the
    default would trip it, and would change published figures, so that is a separate decision.

## C. Rank-decision check (pre-registered; no row of its own)

Outcome: **criterion passes; question only partly answered.**

- **Pre-registration commit:** `b84ce19ba7efafdce9154fe7e6e7fbbf060d29ed`, pushed 2026-10-02
  16:12:23 UTC. Test `tests/lunar_frame_campaign_rank_mpmath_oracle.rs`; mpmath 1.3.0 on the 40
  days 2026-03-15 to 2026-04-23, stations estimated. An exact eigenvalue is decided only when it
  clears the 1e-9 threshold by more than the engine's a-priori error bound.
- **Result:** all 40 station-block decisions are decided and match the engine; 9 days have an
  exactly singular station block (a station with no observation). Of 31 Helmert matrices, the 11
  full-rank ones are decided and match. The 20 defect-1 days are all **undecided**: the bound is
  too wide to certify a decision that close to the threshold.
- **Diagnostic (not pre-registered, not counted as validation):** in exact arithmetic the
  ratio `lambda_min / lambda_max` is below 1e-9 on all 20 defect-1 days (3.7e-11 to 9.6e-10) and
  above it on all 11 full-rank days (1.1e-9 to 5.1e-8). The engine's point decisions equal the
  exact ones on all 31 days, and `record_point_decisions_equal_the_exact_ones` pins that. The
  flips are geometric: the 1e-9 threshold sits inside this campaign's natural range of ratios.
  Closest days: 2026-03-22 (4 % below) and 2026-04-16 (14 % above).
- **Mutations:** default `rel_tol` 1e-9 → 3e-9: red (2026-04-22). Jacobi early stop at 1e-6:
  green, because no decided item lies near the threshold; recorded as a limit.
- **Real-world note for the founder:** a fixed relative rank threshold of 1e-9 is fragile on this
  problem class; small schedule changes flip the published defect. The rank decision of
  the srif route uses the same threshold on squared singular values. A margin-aware decision
  (report "near threshold" when the ratio is within a stated factor) would be a design change for
  a later package.

## D. Opt-in square-root paths in the other roadmap modules (no row; no validation claimed)

Added after the second fold note, at the founder's instruction to finish the package. Each is a
new function beside the unchanged default, built on two new `linalg_sr` primitives:
`weighted_lstsq` (Householder QR of `[W^1/2 J | W^1/2 b]`, back substitution, residual norm) and
`covariance_from_sqrt_information` (`R^-1 R^-T`).

| Module | Opt-in function | Replaces (default kept) | Test |
|---|---|---|---|
| `fim` | `crlb_srif(jac, weights, rel_tol)` | `crlb(&information_matrix(..))`: rank, spectrum, null space, covariance from `R` | `fim::tests::crlb_srif_agrees_with_crlb_on_full_rank_and_rank_deficient_designs` (1e-12) |
| `batch_ls` | `gauss_newton_srif` (returns the formal covariance too) | `gauss_newton`'s inverted normal matrix | `batch_ls::tests::the_srif_corrector_matches_the_normal_equation_corrector_and_returns_its_covariance` |
| `orbit_determination` | `determine_orbit_batch_srif` | `determine_orbit_batch` | `orbit_determination::tests::the_srif_batch_matches_the_default_batch_and_returns_a_covariance` |
| `lunar_combination` | `formal_covariance_srif` | `formal_covariance`'s `inverse(HᵀWH)` | `lunar_combination::tests::the_srif_formal_covariance_matches_the_normal_equation_one` (1e-6 of sqrt(C_ii C_jj)) |
| `precise_od` | `fit_srif` (empirical a-priori carried as pseudo-measurement rows) | `fit`'s inverted normal matrix | `tests/precise_od_srif.rs` (2 tests: noisy arc; empirical tier at a loose and a tight prior) |
| `cislunar_srif` | `srif_cross_validation_sqrt` | Gramian singular values from eigenvalues of `OᵀO` | `cislunar_srif::tests::the_square_root_gramian_read_matches_the_default_read` (same rank transition, condition within 1e-6) |
| `lunar_datum` | none | — | The module only builds measurement rows (`*_row_datum7`, partials); it has no solve to replace. Its rows reach a solver through the modules above. |

Also `linalg_sr::tests`: `weighted_lstsq` recovers an exact solution and its covariance, and keeps
accuracy on a Läuchli matrix (e = 1e-9) whose plainly accumulated normal matrix rounds to
singular.

**What these do and do not claim.** Each opt-in agrees with its default where both are accurate
(the default is not an oracle for it, nor the reverse): an internal-consistency check, the
ReferenceImpl class at most. No row is proposed for them and none should be promoted on this
evidence; a row would need its own pre-registered external comparison (the pattern of section B).
`orbit_determination`: on the noisy-range case both correctors stall at the finite-difference
noise floor below a 1e-6 step tolerance, at points 0.2 % of a formal sigma apart; the test uses the
module's own 1e-3 tolerance and requires agreement within 1 % of a sigma (disclosed: first written
at 1e-4 m absolute, failed at 1.4e-3 m, then reformulated relative to the sigma). No default
output, golden file or published figure changes.
