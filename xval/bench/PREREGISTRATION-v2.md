# Pre-registration: kshana-bench 2.0.0 (stratified split of task (a))

Committed alone, before any v2 code exists and before any score is computed under the new split. Version 1.0.0 is
unreleased; its pre-registration (`PREREGISTRATION.md`) and its recorded results (`RESULTS-v1.md`) stay in the
repository and are cited from v2. Bars may be tightened later, never loosened; a miss is recorded and pinned.

## Why v2 exists

Under 1.0.0 the hash split of task (a) put the 14 evaluable JammerTest 2024 folders into 11 dev, 2 test and 1
holdout folder, and the test split held one jamming folder and the holdout split no jamming epoch at all (the
holdout could not be scored). That is a property of the rule, found on the first run (`RESULTS-v1.md`). A split
rule change is a new major version, so this is 2.0.0. Nothing else changes: the tasks, the truth rules, the metrics
and the baselines are those of 1.0.0.

## What was seen before this was written (disclosed)

- Everything in `RESULTS-v1.md`, including the v1 split sizes (11/2/1 folders), the per-folder clean and jamming
  epoch counts of the dev and test folders and the v1 AUCs per split.
- Which folders are evaluable and which attack types they carry (from the v1 truth files). 7 evaluable folders
  have jamming epochs ("jamming folders") and 7 have none (spoofing and meaconing folders, clean epochs only).
- NOT seen: which folder lands in which split under the rule below. The rule was fixed from the counts of strata,
  not from any folder's hash, and the assignment has not been computed before this commit.

## The rule (fixed)

1. The folders are the evaluable ones, by the 1.0.0 rule (calibration window clear of the attack windows; a
   timeline that `run_monitors` accepts).
2. Two **strata**: *jamming folders* (the folder's attack type includes jamming and it has at least one jamming
   epoch) and *other folders* (every other evaluable folder).
3. Within a stratum of `n` folders, sort the folders by the lowercase hex SHA-256 of the folder path (a UTF-8
   string, as in 1.0.0), ascending. With `h = max(1, round(n / 4))` and `t = max(1, round(n / 4))` (rounding half
   up), the first `h` folders go to `holdout`, the next `t` to `test`, the rest to `dev`. For `n = 7` that is 2
   holdout, 2 test and 3 dev in each stratum.
4. The rule is folder-level and deterministic. A split's epochs are the scored epochs of its folders.

## Bars

- **V1 (split validity):** on the 14 evaluable folders, each of dev, test and holdout contains at least one
  jamming epoch and at least one clean epoch, and at least two jamming folders.
- **V2 (nothing else moved):** the task (c) and (d) result files under 2.0.0 have metrics equal to the 1.0.0 ones
  (`RESULTS-v1.md`) to 1e-12, and the pooled task (a) AUCs over all evaluable folders are unchanged (A1).
- **A1:** the pooled AUCs of `cn0_drop_db`, `agc_k_sigma` and `jam_ind_threshold` over all evaluable folders are
  within 0.0005 of the recorded 0.778, 0.933, 0.678 (unchanged from 1.0.0).
- **A2:** `agc_k_sigma` AUC >= 0.80 on the `test` split under the new rule.
- **S1 to S5, C1 to C3, D1, D2:** as registered in `PREREGISTRATION.md`, unchanged. D1 was NOT MET under 1.0.0 and
  is registered again unchanged; its miss stays pinned.

## Not claimed

No bar says a baseline is good. The holdout of task (a) is still public (anyone who downloads the data has its
folders); stratification makes it scoreable, not secret. One baseline run is made under v2 and recorded whatever
it shows.
