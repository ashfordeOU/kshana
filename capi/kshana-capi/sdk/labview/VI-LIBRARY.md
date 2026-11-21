# Kshana.lvlib: a VI library described in text

This page describes, step by step, six VIs that wrap the Kshana C interface for LabVIEW. Build them
from the node settings in [`README.md`](README.md). The repository does not ship the `.vi` files
(they are binary, and no LabVIEW is available to build or test them here).

**Not run on the target tool.** These VIs have not been built or run in LabVIEW. The C calls they make
are replayed with Python `ctypes` in CI ([`../python/wrapper_patterns.py`](../python/wrapper_patterns.py)).

Conventions for every VI: *error in* and *error out* clusters at the bottom corners of the connector
pane; when *error in* holds an error, the VI does nothing and passes it on (a Case Structure on the
error wire). The library path is a constant **path** control, `Kshana Library Path` (type def), so one
place changes it for all VIs; or tick *Specify path on diagram* on every node and wire the path.

## 1. `Kshana Version.vi`

- Outputs: `version` (string).
- Diagram: one Call Library Function Node, `kshana_version`, return *String, C String Pointer*, no
  parameters. Wire the return to `version`. Nothing is freed (the string is static).

## 2. `Kshana Take String.vi` (subVI, used by 3 to 5)

- Inputs: `address` (U64; pointer-sized integer).
- Outputs: `text` (string), `was null` (Boolean).
- Diagram:
  1. If `address` = 0: `text` = empty, `was null` = TRUE; stop.
  2. Call `LabVIEW` › `StrLen` with `address` → `n` (I32).
  3. **Initialize Array** (U8, `n` elements, value 0) → `buffer`.
  4. Call `LabVIEW` › `MoveBlock` (`src` = `address`, `dst` = `buffer` as Array Data Pointer,
     `size` = `n`). Take the array from the node's `dst` output terminal.
  5. **Byte Array To String** → `text`.
  6. Call `kshana_string_free` with `address` (Pointer-sized Integer, Value). Exactly once.

## 3. `Kshana Run Scenario.vi`

- Inputs: `scenario TOML` (string).
- Outputs: `result JSON` (string), `return code` (I32).
- Diagram:
  1. Call `kshana_run_scenario`: `scenario_toml` = the input; `out_json` and `out_err` = two U64
     constants 0 wired to the *Pointer to Value* inputs. Read the updated values from the right-hand
     terminals → `json address`, `err address`.
  2. `Kshana Take String.vi` on `json address` → `result JSON`, `json was null`.
  3. `Kshana Take String.vi` on `err address` → `reason`. Always call both, so neither string leaks.
  4. If `return code` ≠ 0 or `json was null`: build an error with **Error Cluster From Error Code**,
     code = 5001 + `return code`, source = "kshana_run_scenario: " + `reason`; merge it into
     *error out*.

## 4. `Kshana Validate Scenario.vi`

- Same as 3 with `kshana_validate_scenario`. Output: `problems JSON` (a JSON array of strings; `[]`
  when the scenario is valid). **Unflatten From JSON** with a 1-D string array type gives the list.
  Validation is structural (the kind, required fields); a value the model refuses (a negative range)
  shows up only when the scenario is run (return code 1).

## 5. `Kshana Connect Map.vi`

- Inputs: `mapping TOML`, `station TOML`, `log text` (strings).
- Outputs: `records JSON lines` (string), `return code` (I32).
- Diagram: as 3, with `kshana_connect_map` and three string inputs before the two out-parameters.
  Split the output on line feeds (**Spreadsheet String To Array** with delimiter `\n` and a 1-D
  string array type) to get one JSON object per element: the first is the header, the rest are
  epochs.

## 6. `Kshana Run File.vi` (example top-level VI)

- Front panel: a path control `scenario file`, a string indicator `result JSON`, a numeric
  indicator `margin (dB)`.
- Diagram: **Read from Text File** (whole file) → `Kshana Run Scenario.vi` → **Unflatten From JSON**
  with a cluster `{margin_db: DBL, closes: Boolean}` (set *strict validation?* to FALSE so the many other top-level
  fields of the result are ignored) → indicators.
- With `scenarios/link-budget.toml` it should show `margin (dB)` ≈ 92.12 and `closes` TRUE (the
  value the Python and MATLAB tracks of [lab 1](../../../../docs/teaching/lab-1-first-calls.md) give).

## Checking your build

Run `Kshana Run File.vi` on the three files in [`../conformance/cases.txt`](../conformance/cases.txt),
write each `result JSON` to `run-1.json` … `run-3.json` with **Write to Text File** (no end-of-line
conversion), map the timing-monitor log with `Kshana Connect Map.vi` into `map.jsonl`, and check the
folder with `sha256sum -c expected.sha256`. Equal digests mean the VIs pass the bytes through
unchanged.
