<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B8 environmental baseline: steps and readings

The pre-registration is `docs/design/evidence/b8-environmental-baseline/PREREGISTRATION.md`, signed off on
3 November 2026. Its section 5 fixes the order. Each step is committed before the next one starts.

1. Owner sign-off (3 November 2026).
2. The baseline, `src/env_baseline.rs` (`EnvBaselineParams::v1`, each constant cited), was tested on synthetic
   inputs only. `roti.py` was tested on synthetic TEC (`python3 -I roti.py --self-test`). Commit `ef01a4537`.
3. The event days were drawn by rule from the index files: `draw_days.py`, output `days.json`.
4. The station list (to come).
5. The ROTI labels (to come, before the baseline is run on the data).
6. The one run and `RESULTS.md`.

## Readings

1. **Index file addresses (step 3).** The pre-registration names
   `https://kp.gfz.de/app/files/Q_D_days_since_1932.txt` for the international quiet and disturbed days.
   That address answered 404 on 7 November 2026. GFZ now publishes the same data, under the same DOI and
   licence (doi:10.5880/Kp.0001, CC BY 4.0), as one file per year:
   `https://datapub.gfz.de/download/10.5880.Kp.0001/Quiet_Disturbed_Days/QD_days<yyyy>.txt`. Those files
   are used.
   - The Kp, Ap and F10.7 file is at the address the pre-registration names.
   - `MANIFEST.tsv` holds the SHA-256 of every copy used. `fetch_indices.sh` fetches them again; the Kp file
     grows daily, so a later copy differs.
2. **The international quiet days** are Q1 to Q5 of each month in those files. Ap is the daily Ap, F10.7 the
   observed value, and the maximum Kp is the largest of the day's eight 3-hourly values.
3. **Ties** (same Ap) are broken by the earlier date.

## Event days drawn (step 3)

- **10 storm days**, daily maximum Kp of at least 8−. There were more than 10, so the 10 with the highest Ap
  were kept.
- **20 quiet days**, from the international quiet days of the storm days' months, by lowest Ap.
- **10 equinox days**, from the international quiet days of March and of September–October 2024, by lowest
  Ap.

The dates, with Kp, Ap and F10.7, are in `days.json`.
