# D12 rows: proposed `verification.rs` text and records

Package D12. Step 1 (extended-precision oracle): sections 1 and 2. Step 2 (the square-root
information solver, `src/linalg_sr.rs`, and its row (b)): section 3, carried out on 2026-10-02
at the founder's instruction ("do everything"), which overrides the earlier scoping of step 2 out
of this session. Section 4 records the rank-decision check run in between.

## 1. New row, proposed VALIDATED (P2): stations-estimated datum against extended precision

Outcome: **PROMOTE** (new row), with the claim narrowed as decided on 2026-10-02: within the worst-case bound, not "as accurate as double precision allows"; weakest direction counted only on the control. Rule 5 applies: the extended-precision comparison is a new
method, so it gets its own row; the "Lunar frame datum from an observing campaign" row (M074)
is not changed here (section 2).

### Proposed `VerificationItem` (append to the table in `src/verification.rs`)

```rust
        VerificationItem {
            requirement: "Lunar frame datum covariance with the stations estimated, against 50-digit extended precision",
            capability: "The seven-parameter Helmert datum covariance of the lunar-frame-campaign scenario with the Earth stations estimated (station 1 anchored), as lunar_frame_campaign computes it in binary64: the joint station-and-beacon Fisher information accumulated from the delay Jacobian, the station block marginalised by a Schur complement through a Jacobi spectral inverse, H = AᵀSA formed with the Helmert design and inverted spectrally. The problem is ill-conditioned by construction (Helmert condition number 2.1e8 to 2.3e8, joint information condition number 1.6e12 to 3.0e13): a 1e-9 relative change in the Schur correction moves the datum sigmas by up to 28 %. Reported: the seven datum sigmas, the Helmert condition number and the weakest direction. CLAIM, NARROWED: the engine's datum sigmas and condition number lie within the a-priori worst-case error bound of a backward-stable double-precision pipeline on this problem; this does not claim they are as accurate as double precision allows (a factorisation route is about a thousand times more accurate on the same inputs), and the weakest direction is validated only where its bar is below a right angle (the stations-fixed control)",
            module: "lunar_frame_campaign, fim",
            tests: "tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: three scenarios — stations estimated on a new campaign date 2026-03-18 (binding), stations fixed on that date (control), stations estimated on 2024-01-01 (the scenario of the earlier double-precision miss); every datum sigma, the condition number and the weakest direction against a condition-scaled bar recomputed in the test from the oracle's exact sensitivities; engine_inputs_match_the_committed_fixture: the committed Jacobian, weights and Helmert design are what the engine builds now; record_engine_accuracy_against_a_factorisation_route: the engine's error band and the NumPy Cholesky diagnostic pinned)",
            oracle: "mpmath 1.3.0 (BSD-3-Clause) at 50 significant digits, self-checked at 80 (agreement 1.0e-38 or better), on the engine's committed Jacobian, weights and Helmert design: mpmath's own LU solve for the Schur complement, its inverse for H and its Jacobi eigen-decomposition (P2, an independent numerical library). Pre-registered 804662d5 before the fixture existed, with bars from a first-order backward-error formula: constant (3n+1)n + m times the unit roundoff (Higham, Accuracy and Stability of Numerical Algorithms, Theorem 10.4, the Tier B form), times each quantity's exact first-order sensitivity to the joint information, the Schur complement and H. Measured: datum sigmas within 4.8e-6 on 2026-03-18 (bars 9.6e-2 to 2.2e-1), 9.7e-6 on 2024-01-01 (bars 2.8e-2 to 6.9e-2) and 2.0e-14 with the stations fixed (bars 1.0e-11 to 2.8e-7); condition number within 4.6e-6, 1.3e-5 and 4.1e-14. On the stations-estimated scenarios the bars are worst-case and four orders of magnitude above the measured error, and the weakest-direction bar there exceeds a right angle, so that one check is not counted. Diagnostic: NumPy 2.3.5 Cholesky and QR routes reach 9e-9 and 5e-9 on the 2024-01-01 inputs, its inverse and eigen routes 2.9e-6 and 6.2e-6: the engine is within its bound but about a thousand times less accurate than a factorisation route. Validates the linear algebra on the committed inputs, not the Jacobian (the SPICE leg of the campaign row does that) and not the physical accuracy of the illustrative campaign",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

### Proposed `validated_oracle_basis()` entry

```rust
        OracleBasisEntry {
            requirement: "Lunar frame datum covariance with the stations estimated, against 50-digit extended precision",
            basis: P2NumericalLibrary,
            oracle_test: "tests/lunar_frame_campaign_mpmath_oracle.rs",
            source: "mpmath 1.3.0",
            flag: "",
        },
```

**Required companion edit:** `p2_rows_name_an_independent_numerical_library` accepts only
`["numpy", "scipy", "lapack", "rtklib"]`. Add `"mpmath"` (array length 5), or the entry above
fails that unit test. mpmath is an independent arbitrary-precision library (BSD-3-Clause) that
performs the LU solve, inverse and eigen-decomposition by its own algorithms, which is what P2
asks for.

### Record

- **Pre-registration commit:** `804662d52a6b2a974de3d1fda69aa2d1bddc0f4d`, pushed 2026-10-02
  15:45:10 UTC, before the fixture was generated or the oracle run. It states the
  quantities, inputs, oracle (mpmath 1.3.0, BSD-3-Clause, 50 digits, 80-digit self-check), the
  tolerance formula and its source, with both tests `#[ignore = "pre-registered; not yet run"]`.
- **Date choice, disclosed:** 2026-03-15 was chosen first; an engine-only feasibility probe
  (observation count, Helmert defect, `station_block_full_rank`; no sigma, condition or oracle
  value read) found it rank-deficient, so the pre-registration fixed the rule "first day from
  2026-03-15 with a full-rank station block and Helmert matrix", giving 2026-03-18 (48
  observations). This was settled before the pre-registration commit.
- **Oracle:** mpmath 1.3.0 (BSD-3-Clause), Python 3.11.15; NumPy 2.3.5 (BSD-3-Clause) for the
  diagnostic only. Fixture `tests/fixtures/lunar_frame_campaign_mpmath_oracle/` with
  `gen_reference.py` and `NOTICE.md` (SHA-256 of inputs, reference and script).
- **Tolerance (pre-registered formula, evaluated per quantity):** `u = 2^-53`, `c = (3n+1)n + m`;
  sigma `k`: `1e-12 + (c u / 2)(a_F ||Zt C e_k||^2 + a_S ||A C e_k||^2 + a_H ||C e_k||^2) / C_kk`;
  condition: `1e-12 + t(lambda_min) + t(lambda_max)`; weakest direction:
  `1e-12 + c u (a_F ||Zt||^2 + a_S ||A||^2 + a_H) / (lambda_2 - lambda_1)` rad. Source: Higham
  Theorem 10.4 constant (the Tier B form of `tests/gls_outside_omega_bound_numpy_oracle.rs`) with
  first-order perturbation, Weyl and Davis–Kahan bounds; derived from the formula, not from the
  seen 3e-6 spread.
- **Result (first run, not tuned):** all checks pass.

  | Scenario | Sigma error (max) | Sigma bars | Condition error / bar | Weakest dir. / bar |
  |---|---|---|---|---|
  | stations estimated 2026-03-18 (binding) | 4.8e-6 | 9.6e-2 to 2.2e-1 | 4.6e-6 / 0.47 | 5.9e-6 rad / 21 rad (vacuous) |
  | stations fixed 2026-03-18 (control) | 2.0e-14 | 1.0e-11 to 2.8e-7 | 4.1e-14 / 5.6e-7 | 6.6e-16 / 9.4e-11 rad |
  | stations estimated 2024-01-01 (seen) | 9.7e-6 | 2.8e-2 to 6.9e-2 | 1.3e-5 / 0.15 | 2.7e-5 rad / 1.5 rad (vacuous) |

- **Mutation evidence (each applied, run, reverted; none committed):**
  1. `fim::sym_eig` stops its Jacobi sweeps once off-diagonal mass < 1e-6 of the diagonal: **red**
     (control sigmas off by up to 2.9e-5 against bars down to 1e-11; weakest direction 6.2e-7 rad
     against 9.4e-11; 2024 stations-estimated rotation sigma 5.2e-2 against 2.8e-2).
  2. Station-block Schur correction scaled by `1 + 1e-9` in `lunar_frame_campaign::compute`:
     **red** (2026-03-18 sigmas off by up to 0.28 against 0.15; 2024 by 6.8e-2 against 6.6e-2).
     At `1 + 1e-7` the datum turns rank-deficient and the full-rank assertion fails.
  3. Station-block pseudo-inverse threshold 1e-9 → 1e-6: no effect (the station block is better
     conditioned); not counted.
- **Disclosures:**
  - Weakest-direction measurement fixed after the run: the comparator was `acos` of the cosine,
    which cannot resolve angles below about 1.5e-8 rad and read 0 on the control against a
    9.4e-11 bar. It now uses the chord between sign-aligned unit vectors (6.6e-16 on the
    control). The bar is unchanged; only the measurement became accurate.
  - The oracle script had one start-up defect in its own self-check, fixed before it wrote any
    output (NOTICE.md). No re-run after a seen comparison failure; the engine comparison ran once.
  - The 2024-01-01 scenario's engine-against-NumPy gap had been seen; its 50-digit answer had
    not. Its inputs are bit-identical to the earlier M074 fixture's.
  - The bars are loose on the stations-estimated scenarios (four orders above the measured
    error); they are the a-priori worst case for this pipeline on an extremely sensitive problem,
    and they are tight on the control. The weakest-direction bar on the stations-estimated
    scenarios exceeds 90 degrees and is not offered as evidence.
  - `xval/oracles/requirements.lock`: only the resolver's `mpmath==1.3.0` entry was taken; a full
    `uv pip compile` re-resolve also downgraded pillow 12.3.0 → 12.0.0 and dropped `appnope`,
    which were not taken.

## 2. M074, "Lunar frame datum from an observing campaign": founder decision (proposal only)

Outcome: **no change made; FOUNDER DECISION.** The row stays ReferenceImpl / MODELLED and its
strict test `lunar_frame_campaign_matches_spice_geometry_and_numpy` stays ignored: its
pre-registered 1e-9 P2 bar failed and is not loosened.

What step 1 establishes for that row: its SPICE leg already agreed on all six scenarios; its P2
leg's only miss (stations estimated, 2024-01-01) is now resolved by extended precision — the engine
is within the a-priori backward-error bound, and the 1e-9 bar was unattainable for any
double-precision route on that problem (the best, a QR projection, is 5.5e-9 off).

Decision recorded 2026-10-02: **option (A)**. Options as proposed:
- **(A, chosen)** Keep M074 MODELLED; add the new row of section 1; append to M074's oracle
  text one sentence: "The stations-estimated P2 miss is resolved by extended precision in the row
  'Lunar frame datum covariance with the stations estimated, against 50-digit extended
  precision': the engine is within its a-priori backward-error bound and the 1e-9 bar was below
  what any double-precision route reaches." This satisfies rule 5 (a new method gets a new row).
- **(B)** Promote M074 on its SPICE leg plus the new extended-precision P2 leg, replacing the
  failed 1e-9 P2 leg. This swaps a leg's method under an existing row, which rule 5 forbids
  without an explicit founder ruling; if chosen, the record must say the P2 leg was replaced
  after a seen failure, and the old strict test stays ignored as the record of that failure.

## 3. Row (b), proposed VALIDATED (P2): square-root information datum solver against extended precision

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

(Needs the same `"mpmath"` addition to `NUMERICAL` as section 1.)

### Record

- **Pre-registration commit:** `b41908c900cf75ad9bbf2c7c9e474e5045a2de14`, pushed 2026-10-02
  16:19:00 UTC, before `src/linalg_sr.rs` existed, before the fixture and before the oracle run.
  It specifies the algorithm, the scenarios, the oracle and the bar formula; tests ignored.
- **Date rule, disclosed:** first day from 2026-06-01 whose stations-estimated campaign the
  engine reports full rank in both blocks; an engine-only probe of 2026-06-01 to 06-10 (count,
  defect, station flag only) gave 2026-06-09 (56 observations).
- **Oracle:** mpmath 1.3.0; fixture `tests/fixtures/lunar_frame_campaign_srif_mpmath_oracle/`
  with `gen_reference.py` (imports the section 1 helpers unchanged) and `NOTICE.md`.
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
  - Scope: only `lunar_frame_campaign` gains the opt-in. The roadmap also lists `batch_ls`,
    `orbit_determination`, `cislunar_srif`, `fim`, `lunar_datum`, `lunar_combination` and
    `precise_od`; those paths are not done. `lunar_datum` and `lunar_combination` should wait for
    D4 to fold. D4 touches `src/lunar_vlbi_fim.rs` only, so this branch has no textual conflict
    with it. The Dekker helpers live in `src/linalg_sr.rs` rather than `src/portable_math.rs` to
    avoid a conflict with the unfolded D7; they can move after D7 folds.
  - Cross-platform bit-identity is argued from the operations used (no host mathematics library
    call, no fused multiply-add in the production path) and tested only as rerun identity here.
  - `record_engine_accuracy_against_a_factorisation_route` (section 1) still passes: it tests the
    default spectral solver, which this work leaves unchanged by design. Making `srif` the
    default would trip it, and would change published figures, so that is a separate decision.

## 4. Rank-decision check (pre-registered; supports sections 1 and 3, no row of its own)

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
