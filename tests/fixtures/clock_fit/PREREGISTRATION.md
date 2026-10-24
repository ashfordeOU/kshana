<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: the clock kind's holdover driven by the user's own measured series (`[clock_fit]`)

Committed alone, before the generator, the code or any run of this comparison exists. It fixes what is
fitted, how, the data and the bars. A bar may be tightened after the run, never loosened. A miss is recorded
with its numbers, not tuned away. Companion to `tests/fixtures/clock_log_real/PREREGISTRATION.md` (the
readers) and to the clock-library pre-registration (the device-card fit, `src/clock_library/card.rs`,
unchanged here).

## The change

Today a `[clock_log]` table on a `clock` scenario adds a `measured` block (the log's ADEV, TDEV and MTIE) and
leaves the simulated holdover alone. New, opt-in, `[clock_fit]`:

```toml
[clock_log]            # the measured series, as today
format = "timelab"
path = "my-clock.txt"

[clock_fit]
replaces = "classical" # or "quantum": the simulated clock whose noise the measured series replaces
```

What is fitted and how, fixed now:

1. The log is read by `clock_log::read_input` (unchanged).
2. A device card is fitted to the normalised phase by `DeviceCard::fit_phase` (conditioning, quadratic removed,
   lag-1 noise identification, edf-weighted non-negative least squares in white PM, white FM, flicker FM and
   random-walk FM at the octave averaging factors with edf of at least 30), unchanged.
3. The replaced clock keeps its `y0` (the initial frequency offset is a property of the scenario, not of the
   log: a log carries the offset of a reference, not of the clock after discipline) and takes
   `q_wf = h_0 / 2` and `q_rw = 2 pi^2 h_-2`, the mapping `DeviceCard::clock_model_ext` already uses.
   Its `id` becomes `measured:<log phase SHA-256, first 12 hex>` and its provenance names the log, its
   SHA-256 and the procedure.
4. White phase noise, flicker FM and the linear drift are fitted and REPORTED but are not in the two-state
   holdover model (it has white FM and random-walk FM only), so the simulated holdover leaves them out. The
   report says so.
5. A fit with `q_wf = 0` and `q_rw = 0` is an error (no frequency noise to predict a holdover from).
6. A `fitted` block is added to the result (the card's coefficients and fit points, the `q` values used, what
   was left out, the log's identity), with its units, and an evidence label: MODELLED.
7. `runs > 1` is allowed with `[clock_fit]` (the ensemble then draws from the fitted clock); the `measured`
   block still needs `runs = 1`.
8. A scenario without `[clock_fit]` is unchanged, byte for byte.

## Data (fixed now)

Nine synthetic records written by a committed script, `scripts/gen_clock_fit_ref.py`, with known coefficients
(numpy `default_rng(seed)`, `N = 131 072` phase samples at `tau0 = 1 s`, phase `x[k] = tau0 * sum(y[0..k-1])`):

- C1, white FM only: `y ~ N(0, h_0 / (2 tau0))`, with `h_0 = 1.8e-19` (the SA.45s CSAC figure
  `sigma_y(1 s) = 3e-10` used by `scenarios/clock-holdover.toml`: `h_0 = 2 sigma_y^2`).
- C2, random-walk FM only: `y[k] = y[k-1] + w`, `w ~ N(0, 2 pi^2 h_-2 tau0)`, with `h_-2 = 1.52e-29`
  (`sigma_y(1e4 s) = 1e-12`, `h_-2 = 3 sigma_y^2 / (2 pi^2 tau)`).
- C3, both, independent, with those two values.
- Seeds 20261101, 20261102, 20261103 for each of C1, C2, C3.

Two measured records for the parity bar F2: D2 (the first 65 536 readings of the 5071A caesium clock against
a hydrogen maser) and D3 (the clock of IGS satellite G01 at 30 s), both as in the readers' comparison.

The generator is checked against theory before the comparison (allantools `oadev` of each synthetic record
within 20 % of `h_0 / (2 tau) + (2 pi^2 / 3) h_-2 tau` at `tau = 1, 8, 64` s for C1, C3 and `tau = 64, 512, 4096` s
for C2, C3); that check is recorded and is not a bar of the engine.

## Oracle (fixed now)

1. Known truth: the coefficients above. The theory for the Allan deviation of power-law noise is the
   closed form of `docs/QUANTUM-MODELS.md` and IEEE Std 1139 (`sigma_y^2 = h_0 / (2 tau)` for white FM;
   `(2 pi^2 / 3) h_-2 tau` for random-walk FM); the generator is built from it, not from the engine.
2. allantools 2024.6 `noise_id(x, af, dmin=0, dmax=2, data_type="phase")` (the lag-1 autocorrelation method)
   on the record with its least-squares quadratic removed (numpy `polyfit`, degree 2), at the octave
   averaging factors the engine fits at. No allantools code is copied.

## Bars (fixed now)

- F1 (recovery of known coefficients), for each of the nine synthetic records:
  (a) every coefficient present in the truth is fitted within a factor of 1.5 (`h_0` for C1 and C3, `h_-2`
  for C2 and C3), and so are the `q_wf` and `q_rw` the run uses;
  (b) the fitted card's Allan deviation is within a factor of 1.35 of the true closed-form deviation at every
  averaging time the card was fitted at.
- F2 (noise identification parity): at every averaging factor the engine fits at, the identified noise
  exponent equals allantools'; the fraction equal is at least 0.9 for every one of the eleven records.
- F3 (wiring): (a) the run with `[clock_fit]` has, for the replaced clock, the same `fom` as the run of the same
  scenario with that clock's `q_wf` and `q_rw` written literally as the values the `fitted` block reports
  (every number in `fom` equal, bit for bit); (b) a scenario without `[clock_fit]` is byte-identical to before
  (`tests/prediction_frozen.rs` and the goldens unchanged); (c) each refusal is an error that names its cause:
  `[clock_fit]` without `[clock_log]`; `replaces` neither `quantum` nor `classical`; a fit whose `q_wf` and
  `q_rw` are both zero; a log too short to fit.
- F4 (ensemble): with `runs = 20` the run succeeds, the `fitted` block is present and the `measured` block is
  absent; with `runs = 1` both are present.

## Expected, stated before the run

- Statistical scatter is large for random-walk FM (few degrees of freedom at the longest averaging times), so
  the generous factors; a miss on F1 for a C2 record would be recorded and the cause looked for (the mapping
  between `h_-2` and `q_rw`, the generator, or the fit), not hidden by widening.
- The author does not know yet whether the card's fit separates white FM from flicker FM on C1 and C3; the
  bars do not depend on it, but the `fitted` block reports the flicker coefficient and it is recorded.

## Verdict rule

The `fitted` block and the holdover driven by it are **MODELLED** whatever the result: the fit is the
device-card procedure, the synthetic oracle checks the mapping and the fit on noise built from the theory, and
no measured holdover has been compared with a holdover predicted from its own earlier data in this
comparison. All of F1 to F4 met: recorded as passing on this data; no VALIDATED row is added. A miss: recorded
with its numbers, the defect fixed in a separate commit and the comparison re-run unchanged.
