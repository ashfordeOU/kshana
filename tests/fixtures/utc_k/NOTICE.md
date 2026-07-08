# UTC−UTC(USNO) — CITED INPUT, NOT a P2 Validated oracle

`utc_utc_usno.csv` is the BIPM Circular-T `[UTC−UTC(USNO)]` 5-day series
(MJD 56074–60429, webtai API), columns: MJD, UTC−UTC(USNO) (ns), uncertainty (ns).

**Circularity guard (honesty rule d):** this is the SAME external series already
used as the **Validated ExternalDataset oracle for the R4 holdover-envelope
coverage** row in `src/verification.rs`. In P2 it is a **Cited INPUT ONLY** — a
representative magnitude for a per-source UTC(k) traceability bias. It is **NOT**
re-validated here: reusing one Validated oracle for a second claim would be
circular, and (per the design spine) reproducing Circular-T values is trivial
bookkeeping that earns no `Validated` tag. Every P2 row is `Modelled`.
