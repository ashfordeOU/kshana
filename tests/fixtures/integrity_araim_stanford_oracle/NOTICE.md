# integrity_araim_stanford_oracle fixture

Generated 2026-10-01 for `tests/integrity_araim_stanford_oracle.rs`. Files:

- `geometry.csv`: satellite and user Earth-fixed positions, one row per satellite above the
  horizon per case (270 cases: 8 instants x 30 users from the Celestrak GPS and Galileo element
  sets `tests/fixtures/celestrak/gps-ops_2026-06-07.txt` and `galileo_2026-06-07.txt`, SGP4
  propagated; 30 users at the one populated epoch of `tests/fixtures/igs/igs_sample.sp3`; its
  second epoch header carries no records). Generator: the ignored test
  `generate_geometry_fixture` in the test file
  (`KSHANA_WRITE_FIXTURE=1 cargo test --test integrity_araim_stanford_oracle -- --ignored generate_geometry_fixture`).
  Both tools read this file.
- `maast_araim_levels.csv`, `maast_araim_subsets.csv`: the protection levels, Effective Monitor
  Threshold, sigma_acc and monitored subsets computed by Stanford "MAAST for ARAIM 2"
  (https://github.com/stanford-gps-lab/maast_for_araim_2, commit
  ab70e2a3e9735deb859028fb4ad23f816cfa1998, BSD-3-Clause, copyright 2024 Stanford University),
  function `mhss_raim_baseline_v5.m`, with the MAAST repository
  (https://github.com/stanford-gps-lab/maast, commit 7d32b049c62d55f90478248de04bec956fdeeeb4)
  on the path for `llh2xyz`, `findxyz2enu`, `find_los_xyzb`, `find_los_enub`. Run as separate
  tools under GNU Octave 8.4.0 with the statistics package 1.6.3 by
  `xval/araim-maast/run_maast_araim.m`:

      octave --no-gui --eval "addpath('xval/araim-maast'); run_maast_araim('<maast clone>', '<maast_for_araim_2 clone>', 'tests/fixtures/integrity_araim_stanford_oracle')"

  Only derived numbers are committed; no MAAST code is vendored.

  Octave compatibility shim (disclosed): GNU Octave 8.4's `unique(A, 'rows', 'stable')` returns
  an empty third output, which MAAST's `find_unique_subsets.m` uses to sum the priors of
  identical subsets. `xval/araim-maast/octave_compat/unique.m` implements MATLAB's documented
  semantics for that one call form (C = A(IA,:) in order of first occurrence, A = C(IC,:)) and
  defers every other call to Octave's own `unique`. It changes no MAAST algorithm.

SHA-256 (as committed):

    f992650b142861f879bf7757813b5da66655d2f39aa86a9be8b4fdf95422c493  geometry.csv
    a1f27502a011faf048d8772e0c4fe329acb0aba72dd4a8e3ad1706218ab5ee8f  maast_araim_levels.csv
    18c637b7af25d31714876842ec77024224c703be4a9421fd000d0a8748a96110  maast_araim_subsets.csv

Inputs: Celestrak element sets (public, CelesTrak usage terms, see `tests/fixtures/celestrak/`)
and the IGS precise orbit sample (IGS open data policy, see `tests/fixtures/igs/NOTICE`).
