# hetero_budget_utc_k_oracle

- Data: BIPM Time Department, per-laboratory [UTC-UTC(k)] files `utc-<lab>` with published
  uncertainties uA, uB, u (ns), https://webtai.bipm.org/ftp/pub/tai/other-products/utcr/,
  retrieved 2026-09-30 into `~/Code/kshana-oracles/data/bipm/utclab/` (listed in that
  directory's `MANIFEST.tsv`). BIPM data: free use with citation.
- Not vendored: 113 files, 2.5 MB of rows with uncertainties. `utclab.sha256` (written by
  `generate.py`) pins the bytes of every file the test reads; the test refuses a file whose
  hash differs and skips, with a message, when the directory is absent.
