# Result: the jammer-type Q change, compared as pre-registered

Pre-registration: `xval/jammer-q/PREREGISTRATION.md` (commit 85eeea63), committed before the
changed engine ran on any scenario.

## Method as run

- **Binaries:** release builds of `release/0.36.0-rc` @ 617d4f51 ("before") and of the change
  ("after"). A spot check confirmed the "before" binary gives the swept jammer of
  `l-band-waterfall-jamming` a table Q of 1.
- **Runs:** all 144 runnable scenario files under `scenarios/`, each with both binaries. Exit
  codes were identical for every file.
- **Comparison:** the `*.result.json` files, leaf by leaf (`/tmp` harness; every number to the
  last digit, every string exactly).

## Verdict: every difference is one the pre-registration lists (no finding)

132 of 144 result documents are byte-identical. These include:
- every scenario with no jammer;
- every scenario with only CW or narrowband jammers;
- the `spectrum` kind's own spectra and SSC-derived figures.

All 12 that differ have a broadband or swept jammer with no `q_override`, or compose a run that
has one. Each difference is one of the pre-registered items:

| scenario | what moved | before → after | item |
|---|---|---|---|
| `jamming-demo` | effective C/N0, 456 values | each +3.010287 dB | 1 |
| `maritime-strait-jamming` | effective C/N0, 483 values | each +3.006788 dB | 1 |
| `jamming-harbour-approach-skyline` | effective C/N0 (2968, each +2.924578 dB); status (495 LOST → DEGRADED, 14 DEGRADED → LOCKED); tracking count (310 epochs up by 1 to 4); `fom.min_tracking` | 6 → 7 | 1, 4 |
| `lunar-jamming` | effective C/N0 (38, each +2.996204 dB); status (26 LOST → DEGRADED); `fom.n_lost`; `fom.availability_under_jamming`; loss-of-lock J/S and EIRP thresholds (17 values) and standoff radii (11 values, including the median) | `n_lost` 26 → 0; availability 0 → 0.1667; thresholds each +3.010300 dB; radii each ×0.707107, median 27.40 → 19.38 km; `jammer.q` 1 → 2 | 1, 2, 3, 4 |
| `tracking-loop` | `denial.q_factor`; loop-dynamics denial J/S and radius; derived delta and ratio | Q 1 → 2; J/S 34.581 → 37.591 dB (+3.010300); radius 75.19 → 53.17 km (×0.707107) | 2, 3 |
| `l-band-waterfall-jamming` | the cross-check's table Q and table C/N0 for the two chirp (swept) rows | Q 1 → 2; C/N0 +3.010275 dB | 6 |
| `multi-band-jamming-waterfall` | the cross-check's table Q and table C/N0 for the wideband row | Q 1 → 2; C/N0 +3.010275 dB | 6 |
| `campaign-jam-spoof-holdover-integrity` | the `cn0_dbhz` channel (337 values); member hashes and the run digest | +2.883842 to +3.010287 dB | 1 |
| `leo-vertical-rail-maritime` | the `cn0_dbhz` channel (180 values); a member hash and the run digest | each +3.006788 dB | 1 |
| `campaign-shared-jammer-sea-road` | `min_tracking` of both members and the combined statistics | road 4 → 7, strait 0 → 1, combined mean 2 → 4 | 4 |
| `campaign-sweep-jammer-power` | the 6th sweep node (the highest jammer power) | `min_tracking` 0 → 5, availability 0 → 1 | 4 |
| `campaign-spectrum-holdover-integrity` | two member result hashes and the run digest only (its spectrum member's cross-check, as above) | — | 6 |

All the figures are within the pre-registered bounds:
- every effective C/N0 rose, by between 2.88 and 3.0103 dB;
- every derived threshold rose by 3.010300 dB (within 1e-9);
- every free-space radius scaled by 0.707107 (within 1e-6);
- every status, tracking count and availability moved towards tracking.

The SVG charts and summaries of the changed scenarios move with their results, as does the
`lunar-jamming` CSV table. No other file changed.

## Tests and pins moved

- **`jamming::tests`:**
  - the old order-of-magnitude broadband check is replaced by
    `broadband_q_equals_the_spectral_separation_closed_form`: Q = 2 against `navsignal`'s
    closed form, and 2.215 without normalisation;
  - the CW/broadband ordering test is now strict (a tone is more damaging), with the
    3.0103 dB gap where the jammer dominates.
- **`lunar_jamming::tests`:**
  - three tests pinned at the 25 km mixed operating point chosen at Q = 1 now state
    `q_override = 1.0`, keeping that operating point and every pin exactly;
  - the narrowband-versus-broadband test now expects the tone to leave less C/N0 than
    broadband noise (by at most 3.0103 dB) and checks the broadband Q is 2.
- Other test files with pins on these outputs are listed in the commit that regenerates them.
