# The porkchop on the DE440 ephemeris: results

Pre-registration: `PREREGISTRATION.md` (2d857fb1). Run 2026-10-13,
`cargo test --release --test porkchop_de440_oracle -- --nocapture`.

| Bar | Result |
|---|---|
| same finite cells | **holds**: 304 of 304 finite on both sides |
| C3 and V∞ within 1e-8 relative | **holds**: worst 2.46e-14 and 2.58e-14 |
| same minimum-C3 cell | **holds**: 9.1997 km²/s², departure 2026-10-31, arrival 2027-08-15 |

Outcome: the new row "Porkchop on the DE440 ephemeris" is VALIDATED as a Library check of the
sweep against SPICE + pykep.
