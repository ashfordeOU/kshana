# LuGRE acquisition fixtures

Generated 2026-10-02, after the pre-registration commit 768cb62b was pushed.

- `gnss_sdr_records.json`: written by `xval/gnss-sdr-lugre/run_acq.py`. GNSS-SDR 0.0.19
  (GPL-3.0; Ubuntu 24.04 package 0.0.19-1build3) run as a separate program with the pinned
  `xval/gnss-sdr-lugre/acq_L1.conf.template`, once per PRN 1-32 on each snapshot, the first
  acquisition dump of each run. 288 records (9 snapshots x 32 PRNs), 266 declared positive.
  SHA-256 c345885fa89035075fb7feab944ca3244a871f1f25576cad6a2f6146e0a02f2d.
- `flight_cn0.csv`: written by `xval/gnss-sdr-lugre/extract_flight_cn0.py` from the LuGRE
  `TLM_RAW` text telemetry, every GPS L1 C/A C/N0 within 120 s of a non-surface L1 snapshot
  start. It is EMPTY: no non-surface snapshot has a RAW epoch that close (the nearest, in
  seconds from the snapshot start: OP2 +392, OP14 +2514, OP17 +399, OP18 +175000, OP21 +409,
  OP22 -141, OP23 -771, OP32 +276961, OP37 +3073; the snapshots were captured outside the
  receiver's real-time tracking windows).
- Data: LuGRE Mission Data, Zenodo record 16411687, `LuGRE.zip` (MD5
  cec32df1ca17cb95887762762c16629f, SHA-256
  f151dfba3321a56dd4f62a7fb5dc1f82abb389e10b6fcf9a88bf2a2cf8895a8d), retrieved 2026-10-02,
  CC BY 4.0. Attribution: J. Parker, F. Dovis et al., "Lunar GNSS Receiver Experiment (LuGRE)
  Mission Data", NASA and Agenzia Spaziale Italiana, doi 10.5281/zenodo.16411687. The sample
  files themselves are not committed (3 to 5 MB each); the test reads them from
  `KSHANA_LUGRE_DIR` and the converter's `.ibyte` files beside them.
- Snapshots: the nine non-surface L1 batches OP2, OP14, OP17, OP18, OP21, OP22, OP23, OP32 and
  OP37. EXCLUDED before any run: OP5 and OP12, whose `.sdrx` metadata contradicts the binary
  header defined by the receiver interface control document NIL-TN-QAS-024 (OP5: metadata 4-bit,
  header 8-bit with 1 601 536 samples; OP12: metadata 8 MHz, header 4 Msps), as the operations
  table also says. The surface batches (`_S_`) were never opened.
