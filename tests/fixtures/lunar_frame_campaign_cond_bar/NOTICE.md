# Provenance: lunar-frame-campaign P2 leg at the condition-scaled bar (MR-05)

Fixture of `tests/lunar_frame_campaign_cond_bar_oracle.rs`; pre-registration
`docs/design/evidence/mr05-lunar-datum-cond/PREREGISTRATION.md` (commit b887eb05).

- `fresh_inputs.json`: Kshana's own inputs for the two fresh scenarios on the date D =
  2026-12-01, chosen after the pre-registration by `examples/mr05_fresh_date_probe.rs` (the
  first day on or after 2026-12-01 it accepted: 45 observations, Helmert defect 0, station block
  full rank), written on 2026-10-13 by
  `cargo run --release --example gen_lunar_frame_campaign_fresh_inputs -- 2026-12-01`. SHA-256
  `a633015040b592bcdfc6d71f9fdd2c415f6de706450dbf6930557f393df118c9`. The test asserts the
  engine still builds these Jacobians (within 1e-12 of each row's scale).
- `run_p2.py`: imports `campaign_summary` of
  `../lunar_vlbi_campaign_spice_oracle/gen_reference.py` unmodified and runs it on the engine's
  committed Jacobians of all eight scenarios, with the condition ingredient of the bar from
  `numpy.linalg.eigvalsh`. No SPICE call. Calls no Kshana code.
- `reference.json`: the output of `run_p2.py`, run once on 2026-10-13 (NumPy 2.5.4, SciPy
  1.18.1, spiceypy 8.3.0 only imported), SHA-256 `b0a7eec6c54d36926dea27a7cfe6281b91333a58e85eb5d09eb747ba602a53f3`. The unchanged oracle raised
  `LinAlgError` on `stations_estimated_fresh`; the wrapper records that as an `error` entry and
  substitutes nothing.
- Tools: NumPy and SciPy (BSD-3-Clause), spiceypy only imported by the unmodified module
  (MIT), run as separate programs; nothing is linked into kshana.
