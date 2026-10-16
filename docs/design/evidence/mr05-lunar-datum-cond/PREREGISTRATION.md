# Pre-registration: lunar frame datum from an observing campaign, condition-scaled NumPy bar

Written 2026-10-12 and committed alone, before the comparison below is run, before its fresh
scenarios' inputs exist and before their date is chosen.

## Row and what is already known (disclosed)

Row "Lunar frame datum from an observing campaign" (`lunar-frame-campaign`), MODELLED.
`tests/lunar_vlbi_campaign_spice_oracle.rs` (pre-registration commit cited as `50863551`, which
is not in this repository's history; its bars are in the test header) found on 2026-10-01:

* SPICE leg (binding; the delay Jacobian rebuilt by finite differences of SPICE light times):
  agrees on all six scenarios at its bars (1 % sigmas, eigenvalues and condition; 0.2 deg
  weakest direction and null space; 0.05 deg libration sweep; 1e-4 correlation).
* P2 leg (NumPy on the engine's committed Jacobian): within 3e-14 on the five stations-fixed
  scenarios; on `stations_estimated` datum sigmas off by up to 6.8e-6, condition by 9.1e-6,
  weakest direction by 1.1e-3 deg, against 1e-9, 1e-6 and 5.7e-5 deg bars whose stated premise
  (largest condition number 4e5) was wrong (Helmert condition 2.1e8, joint information
  eigenvalues down to 6.4e-13 of the largest). The strict test stays ignored; that record is not
  altered by this file.
* `tests/lunar_frame_campaign_mpmath_oracle.rs` (separate row) showed against 50 digits that the
  engine is the less accurate side of that gap (9.7e-6 vs 2.9e-6 for NumPy `inv`), inside a
  rigorous first-order backward-error bound (2.8e-2 to 2.2e-1 there).

This is a fresh pre-registration with a bar derived from the conditioning, replacing a bar whose
premise was wrong. For the six existing scenarios the P2 gaps are known; the record therefore
also rests on two fresh scenarios that no oracle has seen.

## Step 0: the 1e-9 pseudo-inverse fallback (instrumentation, not an oracle comparison)

`tests/lunar_frame_campaign_pinv_fallback.rs` rebuilds the engine's pipeline from its public
pieces, shows its datum sigmas equal the engine's emitted ones to 1e-15, and records for every
matrix the engine inverts (station block, Schur complement, Helmert matrix,
independence-discarded covariance) whether `fim::crlb`'s `rel_tol` threshold drops an eigenvalue.
Required: on every full-rank scenario (the six existing and the two fresh ones) no matrix falls
back to the pseudo-inverse, with at least a factor 2 margin above `rel_tol`; on
`collinear_beacons` only the Helmert matrix (its stated design defect 2). If the fallback
triggers anywhere else, that is a finding; any engine change it leads to is pre-registered
separately before it is made.

## Scenarios

* The six of `tests/fixtures/lunar_vlbi_campaign_spice_oracle/inputs.json` (unchanged):
  `default`, `arc_16h`, `arc_48h`, `stations_estimated`, `delay_sigma_3x`, `collinear_beacons`.
* Fresh: `stations_estimated_fresh` and `stations_fixed_fresh`, the default network on a date D
  chosen by this rule after this commit: the first day on or after 2026-12-01 for which an
  engine-only probe (reading only the observation count, the Helmert defect and
  `station_block_full_rank`) reports a full-rank Helmert matrix and a full-rank station block
  with the stations estimated. D is recorded with the result. Their engine inputs (Jacobian,
  weights, station-column count, Helmert design, `rel_tol`) are written by a test from the
  engine, committed, and pinned (within 1e-12 of each row's scale).

## Oracle (P2, unchanged code)

`campaign_summary` and `analyse` of
`tests/fixtures/lunar_vlbi_campaign_spice_oracle/gen_reference.py`, imported unmodified (NumPy
`eigh`, `inv`, `pinv`; SciPy `null_space`), run by a wrapper on the engine's committed Jacobians
for all eight scenarios. The wrapper also computes, with `numpy.linalg.eigvalsh`, the condition
ingredient below. NumPy and SciPy versions are recorded in the output. No SPICE leg is run for
the fresh scenarios (their Jacobian is the engine's; the SPICE leg on the six existing scenarios
is re-run unchanged by `lunar_frame_campaign_finding_stations_estimated_p2_precision`).

## Bar (fixed now)

`u = 2^-53`, safety factor `S = 10`. For a symmetric matrix `X`, `kappa(X)` is its largest
eigenvalue over its smallest eigenvalue above `rel_tol` times the largest. For each scenario,

    kappa = max( kappa(F), kappa(T^T F T) ),   t = max(1e-12, S * kappa * u),

with `F = J^T W J` the joint information matrix (stations and beacons; the beacon block alone
when the stations are fixed) and `T = diag(I_s, A)` (`A` the Helmert design), so that the
Helmert block of `(T^T F T)^-1` is the datum covariance `C = H^-1`.

Basis: every matrix the pipeline inverts is a principal block or Schur complement of `F` (whose
condition numbers are bounded by `kappa(F)`) or the Helmert reduction of `T^T F T`; a backward-
stable inversion of a matrix of condition `kappa` carries a relative error of order `kappa u`.
`S = 10` covers the dimension-dependent constant and the two independent routes (engine and
NumPy each err). This is a stated heuristic, not a rigorous bound (the rigorous one is the
50-digit row's).

Checks (engine against NumPy, every scenario):

* Helmert rank and defect **equal**;
* full rank: each of the seven datum sigmas and the translation sigma norm within **t**
  relative; the Helmert condition number within **t** relative; each Helmert eigenvalue within
  **t lambda_max(H)** absolute; the weakest direction within **t lambda_max(H) /
  (lambda_2 - lambda_1)** rad (eigenvalues of `H` from the oracle);
* defective (`collinear_beacons`): null-space principal angle within
  **t lambda_max(H) / lambda_(d+1)** rad (`lambda_(d+1)` the smallest kept eigenvalue);
* stations estimated: the largest inter-beacon correlation within **t** absolute and the
  independence-discarded translation norm within **t** relative;
* stations fixed: off-block fraction exactly 0 on both sides.

## Outcome rule

All of step 0, the unchanged SPICE leg on the six scenarios, and every P2 check above on all
eight scenarios hold: the row is promoted to VALIDATED as a **Library check of the computation
only** (the delay Jacobian against SPICE geometry, the datum linear algebra against NumPy at a
condition-scaled bar), on the stated illustrative inputs. It does not claim any real campaign's
accuracy: no published lunar-VLBI campaign with a datum covariance exists to compare against,
and clocks, troposphere and Earth orientation are held fixed. Any check fails: a finding with
its numbers; the row stays MODELLED; the bar is not moved.
