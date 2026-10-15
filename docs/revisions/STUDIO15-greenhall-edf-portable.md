<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# STUDIO-15 — Greenhall exact edf on portable maths, and the re-based Bar 5 guard (2026-10-15)

Part of [`STUDIO15-portable-math-rebaseline.md`](STUDIO15-portable-math-rebaseline.md). Concerns the
VALIDATED ledger row "Greenhall and Riley exact equivalent degrees of freedom of the Allan, modified Allan
and Hadamard variances" and its pre-registration
[`xval/greenhall-edf/PREREGISTRATION.md`](../../xval/greenhall-edf/PREREGISTRATION.md). No bar was changed,
re-registered or loosened; the allantools fixture `tests/fixtures/greenhall_edf/reference.json` is untouched.

## 1. What moved

With every transcendental routed through portable maths (the pure-Rust `libm` crate), Bar 1 (relative
1e-9 against allantools 2024.6 wherever allantools returns a finite edf) **missed** at 3 of the 4 876
points, all case 3.1 (unmodified, alpha = 1, non-overlapping, m = 10000, N = 100000). The first one the test
stops at: d = 2, kshana 4.482098076573492 against allantools 4.482098105676121, relative 6.49e-9.

**Cause.** `sx` and `sz` (Eqns 8 and 9 of the paper) are finite differences of `t^2 ln|t|` with step
`1/F` = 1e-4; the second difference cancels about nine decimal digits, so one unit in the last place of a
single logarithm becomes a relative 1e-8 in the edf. `libm::log` differs from a correctly rounded logarithm
in the last bit at some of the arguments; the host library the bar was first met with (and the numpy
logarithm allantools used) does not, at these arguments.

## 2. Method chosen, and why not a cancellation-free reformulation

The owner asked for a numerically stable rewrite that meets the unchanged Bar 1 under portable maths.
Before writing one, the exact value at every direct-sum point (3 653 points, the only ones with the
cancelling kernel) was computed with 60-digit decimal arithmetic. allantools itself carries the
cancellation, so its values differ from the exact edf by up to:

| point (alpha, d, m, N; unmodified, non-overlapping) | allantools | exact edf (60 digits) | relative |
|---|---|---|---|
| 1, 2, 10000, 100000 | 4.482098105676121 | 4.482098081739713 | 5.34e-9 |
| 1, 1, 10000, 100000 | 6.479857213078538 | 6.479857191594032 | 3.32e-9 |
| 1, 3, 10000, 100000 | 3.381460284870765 | 3.381460277779976 | 2.10e-9 |

(next largest 6.4e-10). A rewrite that removes the cancellation computes the exact value and therefore
misses Bar 1 against allantools by these amounts at the same three points: it cannot meet the bar.

What meets it is the published algorithm in its published operation order (unchanged) with an accurate
logarithm. Running allantools' own code with its `np.log` replaced by a correctly rounded logarithm
reproduces its fixture within 1.3e-15 at all 4 876 points. The kernel's logarithm is now
`allan::greenhall_ln`: `x = 2^k m`, `ln m = 2 atanh((m-1)/(m+1))` evaluated in double-double (Dekker
products and Knuth sums, basic IEEE-754 operations only, no fused multiply-add), plus `k ln 2` in
double-double, rounded once. It is the correctly rounded value apart from rare near-halfway cases, and the
same bits on every target. A unit test pins it against 60-digit values at 21 arguments. Everything else in
`greenhall_edf_core` is unchanged; the Table 3 `ln m` of case 3.2/3.3 stays on `pln`.

## 3. Results (bars unchanged)

| bar | 0.35.0 (host maths) | 0.36 portable, `libm::log` | 0.36 portable, `greenhall_ln` |
|---|---|---|---|
| 1 value (rel 1e-9) | met, worst 6.0e-13 | **missed** at 3 points (6.49e-9 at the first) | met, all 4 876, worst 5.997e-13 |
| 2 gaps | met (46) | met | met (46) |
| 3 coverage | met | met | met |
| 4 wrappers bit for bit | met | met | met |
| 5 no moved output | met against the base dump | n/a (see section 4) | n/a (see section 4) |

The VALIDATED verdict stands; the ledger row gains a 0.36 revision note naming this file.

## 4. Bar 5 guard re-based to "0.36 portable"

Bar 5 asked that `assurance::uncertainty::edf` be bit-identical before and after the 0.36 refactor; that was
met on host maths and stays the historical result. Under portable maths the function's own `ln`, `exp` and
the edf kernel move its outputs, so the guard `tests/greenhall_edf_no_moved_output.rs` now compares against
the 0.36 portable dump (test renamed `uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline`; the
base SHA-256 stays in the file as the historical record):

| | SHA-256 of the 274 280-value dump |
|---|---|
| base (host maths, c9e37402 / 36dc5ba9) | `5b2de183db76bf26920a51ae8b7dc55818471e930aee4a5e46597de6a6bb8ad9` |
| 0.36 portable (this change) | `ad1444373d2021e47ac4ecaaa8af9cf538d28f55eec770d97afb8e8693f9c166` |

Value by value (both dumps written by the test's own grid loop, host from 36dc5ba9, portable from this
change): 3 746 of 274 280 values differ, the largest by a relative 1.6e-12; no NaN appears or disappears.
`tests/uncertainty_edf_reference.rs` passes unchanged.
