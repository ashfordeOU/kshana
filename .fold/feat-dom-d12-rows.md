# D12 rows: proposed `verification.rs` text and records

Package D12, step 1 (extended-precision oracle). Step 2 (the square-root information solver,
`src/linalg_sr.rs`, and its row (b)) is out of scope for this session and is not started.

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
  | stations fixed 2026-03-18 (control) | 2.0e-14 | 1.0e-11 to 2.8e-7 | 4.1e-14 / 5.6e-7 | 0 / 9.4e-11 rad |
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

## 3. Row (b): estimator accuracy against extended precision (step 2)

Outcome: **BLOCKED / deferred** (out of scope this session; would also wait on D4 and D7).
Step 1's evidence for it: the engine's spectral-inverse Schur route is about a thousand times less
accurate than a Cholesky or QR route on the same inputs (9.7e-6 against 5e-9 to 9e-9), so the
condition in the roadmap — "only if step 1 shows the engine is the inaccurate side" — is met. The
`record_engine_accuracy_against_a_factorisation_route` test will fail when a square-root solver
closes the gap, prompting that row's record.
