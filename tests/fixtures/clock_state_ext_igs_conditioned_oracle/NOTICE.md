# NOTICE: M002 round 3 fixture (conditioned IGS clocks, 2026-04-01 to 14)

Used by `tests/clock_state_ext_igs_conditioned_oracle.rs`.

- Source: the IGS final combined 30 s clocks of `../clock_library_periodic_cards_oracle/`
  (IGS0OPSFIN_2026091..104, BKG mirror, IGS products open with attribution; source SHA-256 in
  that directory's `sources.sha256`), 11 GPS Block IIF PRNs, decimated to 300 s.
- `conditioned.txt`: written by the Rust pipeline step `write_conditioned_300s` (the frozen
  `clock_library::condition` detector on each satellite's whole record), increments in 1e-13 s.
  SHA-256 6b6b2b6f712d4adaaa7375317d22d7595d2e7403541e442c20b4cabd57d4e964.
- `clocks.txt`, `ml_fit.csv`: written by `tune.py` (round-2 likelihood, scipy 1.17.1,
  numpy 2.4.6, BSD-3-Clause) on the first half of `conditioned.txt`. Round 2 used scipy
  1.18.1 and numpy 2.3.5; the algorithm, start point and options are imported unchanged.
  clocks.txt SHA-256 26118a8d933c0b8e9cf9a39572e2f5a19220fe02392eda22a2ed07f0cff9093a.

Regenerate: run the periodic-card generator, then
`cargo test --release --test clock_state_ext_igs_conditioned_oracle write_conditioned_300s -- --ignored`,
then `python3 tune.py` here.
