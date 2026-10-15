# CR3BP family members against the JPL Three-Body Periodic Orbits API: results

Pre-registration: `PREREGISTRATION.md` (committed alone at `a9074f65`, before any request).
Fixtures: `tests/fixtures/cr3bp_families_jpl/` (retrieved 2026-10-13 after it; NOTICE.md). Run
2026-10-13, `cargo test --release --test cr3bp_families_jpl_oracle -- --include-ignored --nocapture`.

**Outcome: NOT MET. A finding: no ledger row, and the module is `#[doc(hidden)]` with its
status stated.**

60 members were selected (20 per family by the rule). L2 southern #1050 and #1534 are not at a
perpendicular x-z crossing in the API data, so they were excluded. 58 were checked, all with
`Hold::X0` (no fallback was needed), and all converged.

| Family | Checked | Worst state | Worst period (rel) | Worst Jacobi | Misses |
|---|---|---|---|---|---|
| L1 northern halo | 20 | 9.8e-11 | 1.7e-13 | 1.5e-12 | #4222 stability index 2.0846 vs 2.3046 (9.5e-2; bar 1e-2) |
| L2 southern halo (incl. NRHO) | 18 | 8.8e-11 | 1.7e-12 | 7.5e-13 | none |
| DRO | 20 | 7.4e-11 | 8.4e-13 | 4.0e-14 | closure #0 3.3e-8, #579 2.3e-8, #1158 1.5e-8 (bar 1e-8) |

Stability indices elsewhere agree to at most 5.9e-4 (L1 #3921; most 1e-6 or better).

Reading (not part of the verdict): L1 #4222 has a low index (about 2), where two monodromy
eigenvalue pairs are close in magnitude, so the maximum over pairs is sensitive. The three DRO
misses are the smallest, fastest orbits near the Moon, and the adaptive flow's default
tolerances limit closure there. Neither is fixed here. Any change to the corrector or its
tolerances needs its own pre-registration.

Pinned: `finding_four_members_miss_a_bar` asserts exactly these four misses at their recorded
values (within 2 %), with the bars unchanged in the code.

## 0.36 portable maths (2026-10-15)

Re-run on the portable-maths engine (STUDIO-15, batch 4), bars and selection unchanged: the same 58
members are checked and the same four miss. L1 northern halo #4222 stability index 2.0846 against 2.3046
(9.5e-2) is unchanged; the DRO closures are #0 3.4e-8 (3.447788e-8), #579 2.2e-8 (2.218222e-8) and #1158
1.5e-8 (1.533071e-8), bar 1e-8. Worst agreement elsewhere: state 9.8e-11 / 8.8e-11 / 7.4e-11, period
1.8e-13 / 2.0e-12 / 8.3e-13, Jacobi 1.5e-12 / 8.0e-13 / 1.9e-14 (L1 / L2 / DRO). The verdict stays NOT MET
and `finding_four_members_miss_a_bar` asserts the new values. Record:
[`docs/revisions/STUDIO15-batch4-rebaseline.md`](../../../revisions/STUDIO15-batch4-rebaseline.md).
