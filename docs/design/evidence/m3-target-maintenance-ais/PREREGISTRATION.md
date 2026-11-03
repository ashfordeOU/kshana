# M3: target information maintenance, validated on public AIS: pre-registration

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**
Numbers marked *proposed* are for the owner to fix at sign-off. After that, bars may be tightened
after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers, and its test
asserts the recorded miss. Public sources only.

## Why this row

Roadmap row M3. Between an RF fix and an optical look there is a delay (the RF-to-optical
reaction of row M2), and the vessel keeps moving: at 20 kn it covers 24 km in 39 min. Keeping the
vessel's predicted position good enough that the camera looks at the right place is "target
information maintenance". The question M3 answers, on real vessel motion, is: **from a few sparse
fixes, how far off is the predicted position 7, 15 and 39 min later, and does the filter know how
far off it is?** The three latencies are the reaction and refresh figures of the public statement
used in M2 (7 and 15 min reaction, 39 min refresh).

This is the only row of workstream M that can be VALIDATED: vessel tracks recorded by a national
AIS network are an external truth that nobody on this row controls.

**Exists:** the AIS CSV reader and its anomaly detectors (`src/interference_map/ais.rs`,
including `ais_position_is_valid` and `ais_speed_kn`), a linear filter with normally distributed errors (`src/kalman.rs`,
one-dimensional phase/frequency), the local east-north offset (`receiver_trust/maritime.rs`,
`en_offset_m`). **Missing**, built after this file is committed: two-dimensional vessel motion
models (constant velocity; coordinated turn), an interacting multiple-model filter over them,
prediction with covariance, capture probability against a footprint, and the required pointing.

## The data (fixed now)

**Source.** Danish Maritime Authority historical AIS, published free for download
(https://www.dma.dk/safety-at-sea/navigational-information/ais-data; files at
http://aisdata.ais.dk/, one zip per UTC day named `aisdk-YYYY-MM-DD.zip`, sometimes under a
`YYYY/` folder). The columns are those of the archive's own `!_README_information_CSV_files.txt`
(timestamp, type of mobile, MMSI, latitude, longitude, navigational status, ROT, SOG, COG,
heading, …). The files are fetched by a committed script that writes each file's SHA-256; they
are **never vendored**. The drafter listed the archive's file names to confirm the naming and
that 2024 and 2025 daily files exist; no file content has been downloaded by anyone on this row.

**Licence precondition.** The repository's data-source review
(`docs/data/INTERFERENCE-DATA-SOURCES.md`) lists this archive as "excluded pending
clarification": the download page states no licence. **No file is downloaded until the owner
records that the publisher's terms permit this use** (fetching, processing and publishing
aggregate error statistics). If that cannot be confirmed, M3 is "not run" and says so; no other
data source is substituted without a new pre-registration.

**Identifiers.** MMSIs are parsed in memory only, hashed with a per-run salt, never written or
logged (the repository's existing rule). Only aggregate statistics are published; no track, no
position and no identifier leaves the run.

**Days, chosen by rule before download.**
- **Development set (D):** the 1st of January, March, May, July, September and November 2024
  (6 days). Used only to choose the filter parameters (below).
- **Held-out set (H):** the 15th of every month of 2025 (12 days). Downloaded only after the
  parameters chosen on D are committed; read once.
- If a file is missing or unreadable, the next calendar day not already in either set replaces
  it, and the substitution is recorded.

**Area, fixed now.** 54.0° ≤ lat ≤ 56.5° N, 12.5° ≤ lon ≤ 16.0° E (the western Baltic: the
Arkona basin, the waters round Bornholm and the southern Øresund approach), excluding points
with lat > 55.65° N and lon < 13.0° E, and excluding any point closer than 2 km to Natural Earth
1:10m land (as in M2), which keeps port manoeuvres out. **Fallback:** if H yields fewer than
500 anchors, the area grows once to 54.0–57.0° N, 10.0–16.0° E with the same exclusions; the
fallback is recorded.

## Test instances (fixed now)

Rows kept: type of mobile "Class A"; a valid position (`ais_position_is_valid`); a nine-digit
MMSI whose first digit is 2 to 7 (ship stations); exact duplicates (same MMSI and timestamp)
dropped. Per vessel and day the rows are sorted by time.

**Truth at time t:** linear interpolation in latitude and longitude between the last report at
or before `t` and the first after it, if they are at most 120 s apart; otherwise there is no
truth at `t`.

**Anchors.** Candidate anchor times `t0` are every :00 and :30 UTC. A candidate is valid if:
- truth exists at `t0 − 40`, `t0 − 20`, `t0`, `t0 + 7`, `t0 + 15` and `t0 + 39` min;
- the reported SOG of the report nearest `t0` is ≥ 5 kn;
- all six truth points are inside the area;
- the implied speed between consecutive truth points is ≤ 50 kn (a data-error filter).

Per vessel, the first valid anchor of the day is taken, then the next valid one at least 2 h
later, and so on (to limit correlation). Anchors are ordered by day, anchor time, then the
in-memory identifier.

**Strata (reported, not separate bars unless named):** speed 16–22 kn (the public statement's
vessel speed); manoeuvring, defined from truth as a difference of more than 20° between the
bearing from `t0 − 20` to `t0` and the bearing from `t0` to `t0 + 39`.

## Inputs to the filter

Fixes at `t0 − 40`, `t0 − 20` and `t0` min (a revisit of 20 min, the 16-satellite revisit
figure; a 10 min variant is reported, not scored). Two configurations:
- **A (motion only):** the fixes are the truth points, no noise. Tests the motion model alone.
- **B (RF-quality fixes):** each fix is the truth plus independent normally distributed noise of
  `σ_fix = 1 km` (*proposed*) per east and north axis, generator seed 4300, drawn in anchor
  order. The filter is told `σ_fix`.

**Filters.**
- **F-CV:** constant velocity, white-noise acceleration with spectral density `q`.
- **F-MM:** interacting multiple models, constant velocity and coordinated turn (turn rate a
  state), switching probabilities `p_ss`.
- Baseline (reported only): straight-line extrapolation from the last two fixes.

**Parameter choice, on D only.** `q` and `p_ss` are chosen on a fixed grid (`q` in {1e-4, 3e-4,
1e-3, 3e-3, 1e-2, 3e-2} m²/s³; `p_ss` in {0.90, 0.95, 0.98, 0.99}) to minimise the mean negative
log-likelihood of the truth at `t0 + 15` min under configuration B. The chosen values are
committed before H is fetched and do not change.

## Metrics (formulas)

For an anchor and latency `L ∈ {7, 15, 39}` min, with predicted position `x̂_L`, predicted
horizontal covariance `P_L` and truth `x_L` (both in local east-north metres about `x̂_L`):
- **Error:** `e_L = ‖x_L − x̂_L‖` (great-circle distance, spherical Earth `R = 6 371 000 m`).
- **Median and 95th percentile** of `e_L` over the anchors of H, with a 95 % bootstrap interval
  (10 000 resamples, by vessel, seed 4301) reported next to each.
- **Calibration:** `d²_L = (x_L − x̂_L)ᵀ P_L⁻¹ (x_L − x̂_L)`; coverage is the fraction of anchors
  with `d²_L ≤ 5.991` (the 95 % point of the chi-square distribution with 2 degrees of freedom).
- **Capture probability (reported):** the fraction of anchors with `e_L ≤ r` for footprint
  radii `r ∈ {2.5, 5, 10}` km, and the filter's own predicted probability (the integral of the
  predicted normal distribution over the disc), side by side.
- **Required pointing (reported):** for the M2 optical layer geometry, the off-nadir and
  along-track pointing to the predicted point and the extra angle needed to cover its 95 %
  ellipse.

## Bars (all on H, all *proposed*)

| Bar | Configuration, filter | 7 min | 15 min | 39 min |
|---|---|---|---|---|
| M3-B1 median `e_L` | A, F-MM | ≤ 0.5 km | ≤ 0.8 km | ≤ 2.0 km |
| M3-B2 95th pct `e_L` | A, F-MM | ≤ 2.0 km | ≤ 4.0 km | ≤ 10.0 km |
| M3-B3 median `e_L` | B, F-MM | ≤ 1.8 km | ≤ 2.2 km | ≤ 4.0 km |
| M3-B4 95th pct `e_L` | B, F-MM | ≤ 4.5 km | ≤ 6.0 km | ≤ 12.0 km |
| M3-B5 95 % coverage | B, F-MM and F-CV | in [0.90, 0.98] | in [0.90, 0.98] | in [0.90, 0.98] |

- **M3-B6 (the manoeuvring model earns its place):** on the manoeuvring stratum, configuration
  A, the F-MM median `e_39` is not larger than the F-CV median `e_39`.
- **M3-B7 (sample size):** at least 500 anchors in H (after the fallback, if used). Fewer is
  "insufficient data", not MET.

*Derivation of B3 and B4, worked now.* A straight-line least-squares fit to three fixes 20 min
apart with 1 km noise per axis has a per-axis prediction standard deviation at latency `L` of
`σ_fix · sqrt(1/3 + ((20 + L)/20)² / 2)`: 1.12, 1.37 and 2.16 km at 7, 15 and 39 min. For a
circular two-dimensional normal distribution the median radial error is 1.18σ and the 95th percentile
2.45σ: about 1.3 / 1.6 / 2.5 km and 2.7 / 3.4 / 5.3 km. The bars add room for real
manoeuvres, which B1 and B2 bound separately from motion alone. B1 and B2 are set from the
general scale of short-horizon vessel motion (straight legs in traffic lanes, turns at
waypoints), not from any data on this row.

M3 is **VALIDATED** (the roadmap's label) only if B1 to B7 all hold. Each bar is reported MET or
NOT MET on its own.

## What MET would and would not mean

MET would mean: on twelve held-out days of real vessel traffic in the western Baltic, the
shipped filter predicts where an AIS-carrying vessel will be 7, 15 and 39 min after the last of
three sparse fixes within the stated errors, and its stated uncertainty is honest. It would
support a planner's statement of how large an optical footprint must be, or how much pointing
margin is needed, for a given reaction time.

It would not mean: that RF fixes from orbit have 1 km noise (that is an input, tied to M1 and
not tested here); that vessels without AIS move like those with it; that other areas, seasons or
vessel classes behave the same; or that any operational chain meets these numbers.

NOT MET would be published with the numbers, per latency and configuration, and the shipped
filter would carry the measured errors as its stated performance.

## Scope limits

- AIS positions are themselves GNSS fixes (metres of error, negligible against these bars).
  On days of GNSS interference in the area, truth could be corrupted; the implied-speed filter
  removes gross cases only, and this is stated.
- Class A vessels only, SOG ≥ 5 kn, at least 2 km from land; harbour and anchorage behaviour is
  out.
- The fix noise is normally distributed and independent; real RF fixes may have biased, correlated errors.
- No data beyond the archive named above; no commercial or satellite AIS.
- Neutral wording: vessel, track, prediction, footprint.

## Owner decisions at sign-off

1. **Licence:** confirm the publisher's terms allow this use (see the precondition), or M3 is
   not run.
2. The day rule (D: six 2024 days; H: the 15th of each month of 2025) and the area.
3. `σ_fix` for configuration B (1 km proposed), or tie it to the M1 AIS-class result (which
   would need M1 to finish first).
4. The bars in the table and B6, B7.

## Process

1. Owner signs off and records the licence decision; this file is committed alone.
2. The fetch script, the instance builder and the filters are written and tested on synthetic
   tracks only, then committed.
3. D is fetched; the parameters are chosen by the grid rule and committed.
4. H is fetched; the run happens once; `RESULTS.md` and a test that asserts each verdict
   (misses included) are committed.

## Sign-off (3 November 2026)

Signed as proposed, with σ_fix = 1 km. M3 is **not run** until the archive publisher's terms allowing this use are recorded in this file; no data is downloaded before then.
