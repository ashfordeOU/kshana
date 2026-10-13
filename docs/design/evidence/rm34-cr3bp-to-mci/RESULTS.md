# CR3BP rotating states to MCI on the DE440 Earth-Moon line: results

Pre-registration: `PREREGISTRATION.md` (2313eb1b; amended before any run, d5ef79b3). Run
2026-10-13, `cargo test --release --test cr3bp_to_mci_spice_oracle -- --nocapture`.

| Bar | Result |
|---|---|
| position within 1 mm (72 cases) | **holds**: worst 1.81e-7 m |
| velocity within 1e-6 m/s | **holds**: worst 1.19e-9 m/s |
| inverse within 1e-12 (internal) | **holds**: worst 2.7e-15 |

Outcome: the new row "CR3BP rotating states mapped to Moon-centred ICRF on the DE440 Earth-Moon
line" is VALIDATED as a Library check of the transform against SPICE. It does not claim that a
CR3BP orbit matches a real trajectory.

Information: the in-plane-only map (no out-of-plane frame rate), which the original
registration had written, would be off by up to 8.0e-2 m/s in velocity on these cases. The
amendment made before the run was needed.
