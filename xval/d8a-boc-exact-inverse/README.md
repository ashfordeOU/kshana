<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a row 5 (`VM-35b27a4f`): the exact inverse of the BOC(1,1) DLL discriminators: readings

The pre-registration is `docs/design/evidence/d8a-iq-tracking-cn0-rerun/PREREGISTRATION.md` (row 5), signed off on
3 November 2026, under the bars of `docs/design/evidence/boc-bump-jump/PREREGISTRATION.md` (B1 to B5). Committed
**before any engine code** for the change and before any run.

## Readings

1. **The change.** `BocTracking` gains `exact_inverse` (default `false`). With it on, the DLL of a BOC(1,1) channel
   reads the code error through the exact inverse of each discriminator's response on the ideal `R(τ) = 1 − 3|τ|` peak,
   instead of multiplying by the linear `boc11_dll_scale`. With `h = d/2`, `c = 2 − 6h`, the raw (un-normalised)
   reading `r` (EMLP `(E² − L²)/(E² + L²)`, envelope `(|E| − |L|)/(|E| + |L|)`, dot product `Re[(E − L)P*]/|P|²`) and
   `a = |r|`, the error `ε = sign(r)·|ε|` with:
   * inside (`|ε| ≤ h`): EMLP `|ε| = c(1 − √(1 − a²))/(6a)`; envelope `|ε| = a·c/6`; dot product `|ε| = a/(6 + 3a)`;
   * outside (`h < |ε| < 1/3 − h`, which exists only for `d < 1/3`): EMLP `|ε| = (2 − u)/6` with
     `u = 6h(1 + √(1 − a²))/a`; envelope `|ε| = (2 − 6h/a)/6`; dot product `|ε| = (1 − 6h/a)/3`;
   * the branch is chosen by `a` against its value at `|ε| = h`; `|ε|` is clamped to `[0, 1/3 − h]`, the main peak's
     range with both taps on it (a reading beyond it returns the edge).
   Each formula is the algebraic inverse of the response; they agree at `|ε| = h`.
2. **Opt-in, not the default.** The pre-registration says the re-run happens "only if 0.41 replaces the linear scaling
   with the exact inverse". BOC tracking is itself opt-in (`LoopConfig::boc`, `None` by default). The exact inverse is
   added as an option of it, and the scored configuration uses it in place of the linear scaling; the linear scaling
   stays the default of `BocTracking`, so every existing output and golden is unchanged. This reading of "replaces"
   is stated here before the run.
3. **Control.** With `exact_inverse` off, `tests/iq_boc_bump_jump.rs` and the `boc.rs` unit tests pass unchanged (the
   recorded B1 to B5 and the 11 recorded B4 unit-grid misses).
4. **Bars, as registered, with `exact_inverse` on.**
   * **B4**, unit test on the ideal peak, the **registered grid unchanged**: all three discriminators within 10 % of `ε`
     for `d ∈ {0.1, 0.2, 0.5}`, `ε ∈ {−0.05, 0.02, 0.08}`, `|ε| + d/2 < 1/3`. B4 on the sampled noise-free signal: slope
     in [0.9, 1.1] with the inverse, BPSK-scaled slope above 3.0. (Closed-form and noise-free: no fresh input.)
   * **B1** (option off), **B2**, **B3** on the IQ chain and **B5** at correlator level, as registered, on the registered
     seeds (`SEED` 0xB0C1, the scene seed `SEED ^ C/N0`) and on fresh seeds (`SEED + 100 000` in both places).
5. **Verdict.** B4 met on re-run only if both B4 parts hold; the row is met only if B1 to B3 and B5 also hold on the
   registered and the fresh seeds.
6. **Expected outcome, stated before the run.** On the ideal peak the inverse is exact by construction, so the B4 unit
   grid is expected to read `ε` to rounding. That part tests the algebra, not the receiver; the sampled-signal part and
   the loop regressions are the informative ones.
