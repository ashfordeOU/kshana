<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a row 3 (`VM-f5e2ce4e`): the CA-CFAR reference set over the whole Doppler row: readings, study and oracle

The pre-registration is `docs/design/evidence/d8a-iq-tracking-cn0-rerun/PREREGISTRATION.md` (row 3), signed off on
3 November 2026, under the bars of `docs/design/evidence/acq-cfar/PREREGISTRATION.md` (C1 to C5). Everything here is
committed **before any engine code** for the change and before any scored run.

## Development study (disclosed)

`dev_study.py` (numpy; no engine code) models the registered search and detector on noise-free 2-bit GPS L1 C/A
signals. Its output is `dev_study_output.txt`.

- **Fidelity check, on the registered signal under the registered detector only:** it gives 32 of 2495 off-peak cells
  above the threshold for PRN 1, +1250 Hz, 300.25 chips, the engine's recorded count. No candidate was evaluated on
  PRN 1.
- **Development signals:** 8 signals of PRNs 2 to 6 (none of the registered PRN 1 or the fresh PRNs 7, 13, 22, 31),
  at Dopplers and code phases chosen for the study. Registered detector: 258 of 19 960 off-peak cells above (1.29 %),
  5 of 8 signals above 1 %. One candidate was evaluated, the whole row as reference (below): 4 of 19 960 (0.02 %), the
  worst signal 0.12 %. No other candidate was tried.

## Readings fixed before the engine change

1. **The change (one, to the reference-cell set).** A new reference set, `CfarReference::Row`: the reference cells of
   a cell at lag `ℓ` are every `stride_lags`-th lag round the whole period on both sides, `ℓ ± (guard_lags +
   k·stride_lags)` for every `k ≥ 1` with `guard_lags + k·stride_lags < period − (guard_lags + k·stride_lags)`, so no
   lag is used twice. `N` is the number of such cells (622 at 2.5 MS/s with the registered guard 2 and stride 4), and
   `α` comes from the registered closed form at that `N`. The registered set (`CfarReference::Window`, `N = 16`) stays
   the default of `CfarConfig::new`; the row set is opt-in. The guard and the stride are unchanged.
   Why: the off-peak exceedances of a noise-free signal are its code's correlation sidelobes against the mean of only
   16 other sidelobes; the mean over the whole row is a stable floor, and under noise alone the cells at the stride stay
   close to independent, so the closed form still applies.
2. **Control.** The registered set on the registered inputs must reproduce the recorded numbers: C2 0.977 % (M = 1) and
   0.969 % (M = 4); C3 1.006 % and 0.999 %; C4 32 of 2495; C5 0 of 52 500 changes.
3. **Inputs.** C4: the registered signal (PRN 1, +1250 Hz, 300.25 chips) and the four fresh signals fixed in the
   pre-registration (PRN 7, −2500 Hz, 17.5 chips; PRN 13, −750 Hz, 511.0 chips; PRN 22, +500 Hz, 800.75 chips; PRN 31,
   +3000 Hz, 1000.25 chips), noise-free, 2-bit, amplitude 2.0 per component as recorded, `M = 1`, design `Pfa` 1e-3.
   C2 and C3: the registered seeds and the same seeds plus 100 000. C5: the registered seed.
4. **Bars, as registered, with the row set.** C1 as registered (the closed form is not changed). C2 and C3: per-cell
   rate within ±20 % of 1e-2 for `M` = 1 and 4, on the seen and the fresh seeds. C4, on each of the five signals:
   detected; the peak in the Doppler bin nearest the truth (either bin when the truth is half-way, as recorded); within
   one sample of the true code phase; off-peak fraction (outside ±2 samples) above the threshold at most 1e-2. C5: no
   decision changes with the input × 7.
5. **Verdict.** The row is MET on re-run only if every bar holds on the seen and the fresh inputs. A miss is recorded
   with its numbers and pinned.
6. **Oracle.** `oracle.py` recomputes C4 on the five signals with the numpy model (the counts, the detection, the peak
   bin and the code-phase error).
7. **Order.** The oracle is run on the five scored signals only after the engine's scored run; its agreement is
   reported with the result. A count that differs by more than 2 cells on any signal is investigated before a verdict
   is recorded.
