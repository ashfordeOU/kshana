<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: Greenhall exact edf against allantools `edf_greenhall`

Committed alone, before any oracle number for this grid is generated or compared. It fixes
what is compared, on which grid, and the bars. The bars may be tightened after the run, never
loosened. A miss is recorded with its numbers, not tuned away.

## The change

A public Greenhall and Riley exact equivalent-degrees-of-freedom routine in `src/allan.rs`
(`allan::edf_greenhall(alpha, d, m, n, overlapping, modified)`, with ADEV, MDEV and HDEV
wrappers): the BasicSum of Greenhall and Riley, "Uncertainty of stability variances based on
finite differences", Proc. 35th PTTI (2003), Eqns 7 to 13 and Tables 1 to 3 (the large-J
asymptotic branches), as summarised in NIST SP 1065 (2008) §5.3. It covers overlapping and
non-overlapping estimators, the modified and unmodified filters, difference orders d = 1, 2, 3
and noise exponents alpha = +2 to -4 wherever `alpha + 2d > 1`.

The existing private port in `src/assurance/uncertainty.rs` (direct-sum cases only, overlapping
only) is moved into the shared routine. `uncertainty::edf` keeps its exact historical outputs,
including the NaN it returns in the large-J regime it never implemented.

## Oracle

allantools 2024.6 (`pip install allantools==2024.6`, the version pinned in
`xval/oracles/requirements.frozen.txt`), `allantools.ci.edf_greenhall(alpha, d, m, N,
overlapping, modified)`, run as a separate program by a committed generator script that writes
a JSON fixture under `tests/fixtures/greenhall_edf/`. No allantools code is copied.

## Grid (fixed now)

- `alpha` in {+2, +1, 0, -1, -2, -3, -4}, `d` in {1, 2, 3}, keeping only `alpha + 2d > 1`;
- `overlapping` in {true, false}, `modified` in {true, false};
- `N` in {16, 64, 257, 1000, 4096, 100000};
- `m` in {1, 2, 3, 4, 5, 8, 10, 16, 32, 33, 34, 50, 64, 100, 128, 256, 500, 1000, 2048, 5000,
  10000}, keeping only points where the filter fits the record (`L = m/F + m·d <= N`, so the
  estimator count `M = 1 + floor(S(N - L)/m) >= 1`).

Every point is emitted with the case label allantools prints in verbose mode (1.1, 1.2, 1.3,
2.1a, 2.1b, 2.2, 2.3, 3.1, 3.2, 3.3, 4.2), or `not_implemented` where allantools raises
`NotImplementedError` (case 4, unmodified white PM with `ceil(M/S) <= d`).

## Bars

1. **Value.** For every grid point where allantools returns a finite edf, kshana's
   `allan::edf_greenhall` returns a finite edf with relative error `|k - a| / |a| <= 1e-9`.
2. **Gaps.** Where allantools raises `NotImplementedError`, kshana returns NaN (it does not
   invent a value).
3. **Coverage.** Every allantools case label above appears at least once in the grid. A label
   that does not occur is reported as a coverage gap, not as a pass.
4. **Wrappers.** `edf_greenhall_adev`, `edf_greenhall_mdev` and `edf_greenhall_hdev` equal the
   core routine at the corresponding `(d, modified)` bit for bit.
5. **No moved output.** `assurance::uncertainty::edf` is bit-identical before and after the
   refactor over the grid `N` in {4 to 64 every 1, 100, 257, 1000, 4096, 100000}, every `m`
   with `2m < N` up to 10000, every noise type and every `VarType` (compared with `f64::to_bits`
   against a dump taken from the base commit c9e3740 before the change). Its existing test
   `tests/uncertainty_edf_reference.rs` passes unchanged.

## Ledger consequence (decided now)

If bars 1 to 4 hold, a ledger row for the Greenhall exact edf is added as VALIDATED with an
external oracle (allantools is a third-party implementation of the published algorithm). If bar
1 misses anywhere, the row is MODELLED and the miss is recorded with its numbers. Stable32 is not
run here; no Stable32 agreement is claimed beyond what allantools itself documents.

## Results

(Filled in after the run, in a later commit.)
