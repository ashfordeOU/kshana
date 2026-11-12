<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B4a E5-PD: power and distortion on TEXBAT: result

Pre-registration: `PREREGISTRATION-E5-PD.md` (signed 9 November 2026). Scored once, in the same run as E5 v2
(`RESULTS-E5-v2.md`: 11 November 2026, 22:16:13 UTC, main `96ccde9f2`, `xval/bench-e/texbat-v2/E5-SCORE.json`).

| Bar | Result |
|---|---|
| E5-PD: one-vs-rest AUC of `spoofing` on all ten TEXBAT recordings (windows 60 and later; spoofing windows from 110 s) ≥ 0.70 | **MET**: AUC 0.7410 (2 729 spoofing and 802 nominal 1 s windows; 8 and 2 recordings; the minimum-data rule holds) |

Reported without a bar:
- **Per spoofing recording against the two clean ones:** ds1 0.466, ds2 1.000, ds3 0.418, ds4 0.821, ds5 1.000,
  ds6 0.584, ds7 0.897, ds8 0.750.
- **Recording-level AUC:** 0.8125.
- **E5 v2's AUC on the same windows:** 0.6912.

The data, the disclosures, the way the score was run and the independent recomputation (which agrees with E5-PD to
1e-12) are E5 v2's (`RESULTS-E5-v2.md`).

## What it shows (descriptive, after the score)

- Adding the received-power step lifts the overpowered attacks to full separation (ds2 and ds5, 1.000) and takes the
  pooled AUC over the bar (0.741 against E5 v2's 0.691 on the same windows).
- It does not help the matched-power attacks (ds1, ds3, ds6), whose power steps stay within the 1 dB threshold.
- The clean dynamic recording's own power varies by up to about 1.5 dB as the receiver moves, which raises its scores
  and costs part of the separation.
- MET here is a statement about these ten public recordings under the registered rule. The detector stays MODELLED.
