# IAU body orientation and GM of the fourteen added bodies: results

Pre-registration: `PREREGISTRATION.md` (committed alone at `154bc54`). Fresh-epoch fixture:
`tests/fixtures/body_orientation_spice_oracle/fresh/`, committed after the pre-registration
(`990dee43`); its 41 epochs equal the pre-registered grid exactly, and it was regenerated
independently on 2026-10-13 (spiceypy 8.3.0, CSPICE N0067, `pck00011.tpc` and `gm_de440.tpc`
downloaded again from NAIF with the SHA-256 values the pre-registration names) and is
byte-identical to the committed files. Run: 2026-10-13,
`cargo test --release --test body_orientation_spice_oracle --test body_constants_naif_oracle -- --nocapture`.

## Against the bars

| Comparison | Bar | Result |
|---|---|---|
| 1. Orientation, existing 41 epochs | every one of 574 matrices within 1e-9 rad | **PASS**: 574/574, worst Phobos 1.433e-10 rad |
| 2. Orientation, fresh 41 epochs (never compared before) | every one of 574 matrices within 1e-9 rad | **PASS**: 574/574, worst Phobos 1.384e-10 rad |
| 3. GM and constants against `gm_de440.tpc` / `pck00011.tpc` | 0 disagreements among the fourteen added bodies; `only_the_conventional_constants_of_other_rows_differ` passes | **PASS**: 0 of 84 differ; the 7 differences are all Sun, Earth, Moon and Mars conventional constants owned by other rows |

Worst angle per body at the fresh epochs (rad): Mercury 5.0e-13, Venus 7.8e-14, Phobos 1.38e-10,
Deimos 2.7e-11, Jupiter 7.0e-11, Io 1.4e-11, Europa 8.2e-12, Ganymede 1.9e-12, Callisto 2.2e-12,
Saturn 4.1e-11, Titan 1.1e-12, Uranus 2.0e-11, Neptune 2.6e-11, Pluto 3.5e-12. Information only
(not in the verdict): Earth 5.7e-3, Moon 2.8e-2 and Mars 8.4e-4 rad, the conventional constants
the pre-registration leaves on their own rows.

Outcome (pre-registered rule): all three hold, so the split-out row "IAU body orientation and
gravitational parameter of the fourteen added solar-system bodies" is VALIDATED (Library check
of the orientation against SPICE `pxform`; GM is a transcription of DE440 verified against the
published file, not an independent determination). The rest of the original row stays MODELLED.

## Correction to the pre-registration's background

The pre-registration says commit `c2434204` (the original 1e-9 rad pre-registration) is not in
the history. It is: the clone the pre-registration was written in was shallow. After a full
fetch, `c2434204` (2026-10-02 02:25) precedes `7cfd66b4` (02:34), the commit that recorded the
first result. This does not change any bar or the outcome; the fresh-epoch comparison stands
on its own commit order either way.
