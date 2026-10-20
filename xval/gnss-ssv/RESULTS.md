# Results: `gnss-ssv` against the ICG Space Service Volume booklet

One scored run (run 1) on the pre-registered configuration, then two further computations disclosed in addenda 4 and 5 of
`PREREGISTRATION.md`. Public oracle: *The Interoperable GNSS Space Service Volume* (UN OOSA ST/SPACE/75, 2018), itself a
simulation, not a measurement. Nothing here is VALIDATED: the agreement it can show is that this implementation reproduces
the booklet's stated method; the ledger row stays **MODELLED**.

Commands (release build; about 12 minutes for the sweeps):

```
bash xval/gnss-ssv/fetch.sh ssv-src
python3 -I xval/gnss-ssv/extract_patterns.py ssv-src/iir.zip out/
cargo run --release --example ssv_booklet_check xval/gnss-ssv/results-run1.json
cargo run --release --example ssv_booklet_check results-variant.json --glonass-table-4-2
cargo run --release --example ssv_booklet_check results-s7.json --s7-only --patterns=out/l1-azavg.csv
```

## Run 1: the pre-registered reading (commit 1cea614b; the verdicts of record)

| bar | statement | cells within tolerance | verdict |
|---|---|---|---|
| S0 | inverse link budget reproduces table B6 within 0.1 dB | 13/13 | MET |
| S1 | upper SSV geometry (table B4) | 43/52 | NOT MET |
| S2 | lower SSV geometry (table 5.2) | 48/52 | NOT MET |
| S3 | upper SSV with RF thresholds 15/20/25 dB-Hz (table B9) | 122/155 | NOT MET |
| S4 | six GEO missions (tables 5.4 to 5.9), 20 dB-Hz, high-gain nadir antenna | 132/156 | NOT MET |
| S5 | HEO mission (table 5.11) | 18/26 | NOT MET |
| S6 | lunar mission (table 5.13) | 26/26 | MET |
| S7 | parametric pattern against measured GPS L1 panel patterns, RMS over 0 to 30 degrees, every pattern | 0/20 | NOT MET |

S7 detail: the 20 L1 panel patterns give RMS differences from 6.3 to 8.8 dB (median 6.5 dB) against the 3 dB bar. The stand-in's flat main lobe to the reference angle is not what the panel patterns do (they roll off from the boresight); the miss is pinned. The measured patterns are of the panel alone.

### Where run 1 missed

- **S1**: 9 cells; first ones: B4 l1 glonass >=1 % published 93.9, simulated 59.13; B4 l1 glonass >=4 % published 7.0, simulated 0.55; B4 l1 glonass MOD1 min published 48.0, simulated 133.00; B4 l1 combined >=4 % published 98.1, simulated 94.47
- **S2**: 4 cells; first ones: 5.2 l1 glonass >=1 % published 100.0, simulated 94.06; 5.2 l1 glonass >=4 % published 99.8, simulated 41.41; 5.2 l1 glonass MOD1 min published 0.0, simulated 60.00; 5.2 l1 glonass MOD4 min published 24.0, simulated 345.00
- **S3**: 33 cells; first ones: B9@15 l1 glonass >=1 % published 93.9, simulated 59.13; B9@15 l1 glonass >=4 % published 7.0, simulated 0.55; B9@15 l1 glonass MOD1 min published 48.0, simulated 133.00; B9@15 l1 combined >=4 % published 98.1, simulated 94.47
- **S4**: 24 cells; first ones: GEO 0E l1 glonass >=1 % published 84.84, simulated 44.87; GEO 0E l5 glonass >=4 % published 43.99, simulated 8.56; GEO 60E l1 glonass >=1 % published 90.7, simulated 48.48; GEO 60E l1 glonass >=4 % published 5.21, simulated 0.00
- **S5**: 8 cells; first ones: HEO l1 glonass >=1 % published 98.8, simulated 58.08; HEO l1 glonass >=4 % published 14.1, simulated 8.08; HEO l1 galileo >=1 % published 74.3, simulated 68.04; HEO l1 qzss >=1 % published 27.5, simulated 19.87

Every miss in S1 to S5 involves GLONASS or a combined row that includes it, except GPS L1 at 20 dB-Hz (S3) and BDS L5 (S3), and the HEO Galileo, QZSS and NavIC rows (S5).

## Variant: GLONASS reference angles from table 4.2 (26 and 34 degrees; diagnostic, addendum 4)

The booklet gives GLONASS 20 and 28 degrees in tables B2 and B6 and 26 and 34 degrees in table 4.2. Run 1 used the first. The variant changes only that.

| bar | statement | cells within tolerance | would be |
|---|---|---|---|
| S0 | inverse link budget reproduces table B6 within 0.1 dB | 13/13 | MET |
| S1 | upper SSV geometry (table B4) | 52/52 | MET |
| S2 | lower SSV geometry (table 5.2) | 52/52 | MET |
| S3 | upper SSV with RF thresholds 15/20/25 dB-Hz (table B9) | 153/155 | NOT MET |
| S4 | six GEO missions (tables 5.4 to 5.9), 20 dB-Hz, high-gain nadir antenna | 156/156 | MET |
| S5 | HEO mission (table 5.11) | 21/26 | NOT MET |
| S6 | lunar mission (table 5.13) | 23/26 | NOT MET |

Under table 4.2's angles every cell of S1 (upper SSV geometry), S2 (lower SSV) and S4 (the six GEO missions), including the maximum outage durations and the `*` entries, is within its tolerance. This is strong evidence that the booklet's simulation used 26 and 34 degrees for GLONASS and that tables B2 and B6 print a different figure. It is a finding about the booklet, reached after seeing run 1; it does not turn S1, S2 or S4 into MET.
Remaining misses in the variant: S3 two cells (GPS L1 at least one signal at 20 dB-Hz, simulated 88.05 against 90.5; BDS L5 at least four signals at 20 dB-Hz, 27.82 against 32.4), S5 five cells (HEO Galileo L1, QZSS L1 and L5, NavIC L5 at least one signal; GLONASS L5 at least four, 63.8 against 55.5) and S6 three cells (lunar GLONASS L1, L5 and the L5 combined row, where this implementation counts more signals than the booklet).

## What the numbers support

- Agreement with the booklet's method is demonstrated for the inverse link budget (S0, all 13 values within 0.1 dB) and, under the booklet's own table 4.2 GLONASS angles, for the upper and lower SSV geometry and the GEO missions.
- Under the pre-registered reading the geometry and RF-access core is **not** recorded as agreeing: S1 to S3 are NOT MET, so by the verdict rule the ledger status stays MODELLED.
- Known departures that explain part of the S5 and S6 differences: the HEO and lunar trajectories are two-body stand-ins and not the booklet's propagated ones; the booklet takes the antenna with the most tracked signals where this takes the higher gain per signal (which can only count more).
- S7: the representative sidelobe stand-in is not close to the measured Block IIR/IIR-M panel patterns. It is labelled as a stand-in everywhere it is used; the table-pattern route (`transmit.pattern_csv`) exists for measured patterns.

The cells of every comparison are in `results-run1.json`, `results-variant-glonass-table-4-2.json` and `results-s7.json`; the test `tests/ssv_booklet_results.rs` pins the verdicts above, the misses included.
