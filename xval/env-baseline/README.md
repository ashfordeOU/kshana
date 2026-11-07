<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B8 environmental baseline: steps and readings

The pre-registration is `docs/design/evidence/b8-environmental-baseline/PREREGISTRATION.md`, signed off on
3 November 2026. Its section 5 fixes the order. Each step is committed before the next one starts.

1. Owner sign-off (3 November 2026).
2. The baseline, `src/env_baseline.rs` (`EnvBaselineParams::v1`, each constant cited), was tested on synthetic
   inputs only. `roti.py` was tested on synthetic TEC (`python3 -I roti.py --self-test`). Commit `7e7f8e1ad`.
3. The event days were drawn by rule from the index files: `draw_days.py`, output `days.json`.
4. The station list was drawn from the BKG listings and the file headers only: `stations.json` (readings 4 to 7).
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

4. **2015 days (step 4).** No station has a RINEX 3 daily 30 s observation file at BKG on any 2015 day;
   the listings show navigation files only. That covers 5 of the 40 event days: the storm of 2015-03-17 and
   four quiet days of March 2015. With them, no station could reach the 90 % rule. They are therefore
   dropped, not replaced, because RINEX 3 files do not exist for them. The rule applies to the 33 distinct
   remaining days: at least 30.
   - Dropping them turns on file availability alone, decided before any observation was opened.
   - It leaves 9 storm days, 16 quiet days and 10 equinox days.
5. **Bands (step 4).** The bands use `|Φ|` from the station's position in the `SITE/ID` block of the IGS
   station SINEX (`https://files.igs.org/pub/station/general/igs.snx.gz`). The dipole is IGRF-13 at
   2020.0 (g₁₀ = −29404.8, g₁₁ = −1450.9, h₁₁ = 4652.5 nT), which puts the pole at 80.59° N, 72.68° W. The
   bands are 60° and above, 35° to 55°, and 15° and below.
6. **"Carrying L1, L2 and S1C".** The GPS observation types in the file header include an L1 carrier phase
   (any `L1` code), an L2 carrier phase (any `L2` code) and `S1C`. Stations are taken in ascending SHA-256
   of the 9-character name until 4 qualify in each band. A header that could not be fetched is retried
   until it is read; only a header that lacks the codes counts against a station.
7. **Outcome.** The stations, in hash order:
   - `|Φ|` ≥ 60°: EUR200CAN, REYK00ISL, TRO100NOR, YEL200CAN;
   - 35° to 55°: CZTG00ATF, MATE00ITA, EBRE00ESP, M0SE00ITA;
   - ≤ 15°: CMUM00THA, ASCG00SHN, CHPG00BRA, KIRI00KIR.

   Passed over:
   - NYA200NOR, RIO200ARG and POTS00DEU: their 2017 files carry no `S1C`.

8. **Navigation file (step 5).** The pre-registration says only "broadcast navigation files". The first
   labelling pass used BKG's `BRDC00WRD_R` merged file. On 2024-03-11, 16 and 17 that file holds only about
   50 GPS records (about 440 on other days), so most station-hours of those days could not be masked at 30°
   and were excluded.
   - Rule: each day takes whichever of BKG's two merged daily files (`BRDC00IGS_R`, `BRDC00WRD_R`) has more
     GPS records.
   - The rule is decided on the navigation files' own content, before any label is committed and before the
     baseline has run.
   - All labels were recomputed with it.
9. **Epoch records (step 5).** Event records in an observation file (epoch flag 2 to 6, which may leave the
   date blank) and the lines that follow them are skipped. One file with such a record stopped the first pass.

## Event days drawn (step 3)

- **10 storm days**, daily maximum Kp of at least 8−. There were more than 10, so the 10 with the highest Ap
  were kept.
- **20 quiet days**, from the international quiet days of the storm days' months, by lowest Ap.
- **10 equinox days**, from the international quiet days of March and of September–October 2024, by lowest
  Ap.

The dates, with Kp, Ap and F10.7, are in `days.json`.
