<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Lab 1: first calls into the engine

**Goal.** Load the Kshana library from your tool, check a scenario, run it, read four figures, check
one of them by hand, and handle an input the engine refuses. **Time:** about 45 minutes.
**Data:** the shipped `scenarios/link-budget.toml` only (a deterministic calculation; MODELLED).

Set up your track first ([README](README.md#set-up)). Every track calls the same C library, so every
track gets the same numbers.

## Exercises

**1. Check before you run.**
(a) Validate `scenarios/link-budget.toml`. How many problems are reported?
(b) Change `kind = "link-budget"` to `kind = "link-budgt"` in a copy of the text (not the file) and
validate again. What does the engine suggest?

**2. Run it.** Run the shipped scenario and read `free_space_loss_db`, `eb_n0_db`, `margin_db` and
`required_g_over_t_db`. Does the link close (`closes`)?

**3. Check one figure by hand.** The free-space loss is 20 log10(4π d f / c), with d the range in
metres, f the carrier frequency (`link_constants.carrier_frequency_hz`) and c = 299 792 458 m/s.
Compute it yourself and compare.

**4. An input the engine refuses.** Set `range_km = -5.0` in a copy of the text. Validate it, then run
it. Which call reports the problem, and how does your tool show it?

## Worked answers

1. (a) **0 problems** (an empty JSON array, `[]`; `{}` in MATLAB).
   (b) One problem:

   ```text
   could not classify scenario kind: unknown scenario kind "link-budgt" — did you mean "link-budget"? …
   ```

   The check is structural: it knows the kinds and their required fields.
2. Free-space loss **176.97 dB**; Eb/N0 **96.62 dB**; margin **92.12 dB**, so `closes` is true; the
   G/T at which the margin would be zero is **-39.12 dB/K**, that is 53 dB/K (the input) minus the
   margin. The margin is large because the scenario's G/T of 53 dB/K is that of a large ground
   antenna and the range is only 2,000 km.
3. 20 log10(4π × 2.0e6 m × 8.42e9 Hz / 299 792 458 m/s) = **176.97 dB**, the engine's figure.
4. Validation returns `[]`: a negative range is well formed, so the structural check passes. The run
   fails with return code 1 (`KSHANA_ERROR`) and the reason `range_km must be finite and positive`.
   MATLAB raises `kshana:error`; LabVIEW's VI puts code 5002 in *error out*; Python raises
   `RuntimeError`. Lesson: validate for structure, then handle errors from the run as well.

## Track notes

- **MATLAB:** [`solutions/lab1.m`](solutions/lab1.m). Edit text with `strrep` and `regexprep`.
- **LabVIEW:** `Kshana Validate Scenario.vi`, `Kshana Run Scenario.vi`
  ([VI library](../../capi/kshana-capi/sdk/labview/VI-LIBRARY.md)); **Search and Replace String** for
  the edits; **Unflatten From JSON** with a cluster of the four DBL fields.
- **Python:** [`solutions/lab1.py`](solutions/lab1.py), which also checks every answer above against
  the engine.
