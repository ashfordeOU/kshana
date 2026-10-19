# Interference observatory: method note

Version `kshana-observatory/adsb/v1`, built on `kshana-interference-map/adsb/v2`. Advisory only: this is a
description of what published position reports looked like on past days, not a measurement of any
receiver, a forecast, a confirmation of interference or an attribution of its cause.

## What the observatory publishes

One product per UTC day and region, from one open aircraft-position archive. Each cell of a fixed
0.5-degree latitude-longitude grid is in one of **three states**:

| State | Meaning |
|---|---|
| `degraded` | A high share of the aircraft sampled in the cell reported low navigation accuracy that day, clearly above that day's background. |
| `not_degraded` | Enough aircraft were sampled and the share did not meet the rule. |
| `not_observed` | The data did not allow a call. This is **not** "clear". Each such published cell carries a data reason: `insufficient_sample`, `no_day_background` or `day_wide_effect`. A cell with no entry at all was seen by fewer than 5 distinct aircraft and is withheld. |

Nothing else is published: no cause, no actor, no per-aircraft record. The reasons describe whether the day's
data was enough, never why accuracy was low.

Three files per day (`kshana interference-map daily`):

- `observatory-adsb-<dataset>-<day>.geojson`: the cells, with `schema` `kshana-observatory-day/1`, the method
  and its pre-registered parameters, the licence and attribution, the release rule and a notice.
- `observatory-adsb-<dataset>-<day>.png`: the same cells as a picture (degraded, not degraded, not observed
  hatched; empty cells were not observed). Text chunks in the file repeat the notice and the licence.
- `observatory-adsb-<dataset>-<day>.incidents.json`: `schema` `kshana-incident-report/1`. Touching degraded cells
  (diagonals included) form one incident with a bounding box and its cells. `cause` is the fixed text
  `not attributed`. The file is an input to a report, confirm and notify cycle (the aviation reporting cycle
  that ends in a NOTAM); it is not a confirmation and not a NOTAM.

and a `.manifest.json` with the byte count and SHA-256 of the three files, the method id, the input counters
(rows read and excluded) and the dataset block, so a product can be checked and reproduced.

## Release rules (enforced by the command)

1. **At least 24 h delay.** A day's product is released no earlier than the end of that UTC day plus
   `--delay-hours` (24 or more; a smaller value is refused). The command refuses a day that is not yet
   publishable and says the earliest time. There is no switch to shorten it.
2. **Coarse cells.** `--cell-deg` below 0.5 is refused.
3. **Suppression.** A cell seen by fewer than 5 distinct aircraft is not published; a count below 5 is `null`
   (zero included), as in the base method.
4. **No attribution.** The vocabulary of states and reasons has no cause; a test asserts it.
5. **Sources.** adsb.lol (ODbL 1.0) only, or a user dataset with its own licence. **OpenSky Network data is
   refused** (its licence does not allow commercial use or redistribution of derived maps). ADS-B and AIS are
   never combined.
6. **Licence of the product.** A per-cell ADS-B file made from adsb.lol is a Derived Database and carries ODbL
   1.0 and the adsb.lol attribution in the file. Kshana's code stays AGPL-3.0.

## The observable and the base method

An ADS-B aircraft reports how accurate it believes its own GNSS position is: **NACp** (Navigation Accuracy
Category for Position, a 95 % horizontal bound from 10 NM down to under 3 m) and **NIC** (Navigation Integrity
Category, a containment radius). The base method (`kshana-interference-map/adsb/v2`, `docs/INTERFERENCE-MAP.md`)
counts, per cell and day, the share of **distinct aircraft** whose in-cell reports were mostly low accuracy, with
guards: altitude above 5,000 ft only; an aircraft counts only if it reported good accuracy elsewhere the same day
(an equipment baseline); the cell share must exceed the day's median cell share by a margin; a day whose median
is itself high is marked confounded and no cell is declared degraded. The parameters were fixed from the
definitions of the fields and from the privacy rule before any data was examined, and are written into every
output file. The observatory adds the three-state vocabulary, the release rules and the files above, and does
not change a parameter.

**Regional runs.** With `--bbox`, only reports inside the box are read. The equipment baseline and the day's
background are then computed from the box's reports alone, and the file says so (`method.scope`). A regional
product is therefore a product of that region's data, not a crop of a global one.

## Relation to the NACp-versus-almanac-HDOP method

Pleninger, Topkova and Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and
GPS almanac data", The Aeronautical Journal 129 (1331), 206 to 223 (2025), doi 10.1017/aer.2024.67, compare the
position error implied by an aircraft's NACp with the HDOP (horizontal dilution of precision) of the GPS
constellation from almanac data, and flag an aircraft as affected when the two disagree; the paper evaluates the
method on deliberate GPS jamming experiments.

**What we used.** Only the published abstract and bibliographic record. The full text was not available to us
(paywalled), so we know neither its mapping from NACp to an error estimate, nor its HDOP computation, nor its
thresholds, and we do not claim to reproduce them.

**What the observatory does instead.** The question the almanac comparison answers is "could the constellation
geometry alone explain this low accuracy?". The base method answers a related question without an almanac: a low
share must stand out against the same day's background across the region and against the aircraft's own good
reports elsewhere. That is a different and weaker substitute: it cannot say that a quiet-geometry hour was
degraded where the day's background is also low. An almanac-HDOP scorer is **not implemented**. It is an open
item, to be built from the paper's full text and the public GPS almanac and pre-registered before it is run;
until then it is cited, not claimed.

## Reproducing a product

```text
scripts/fetch_adsblol_day.sh 2026-09-15 /path/to/cache      # fetch and extract one day, hashes recorded
kshana interference-map daily /path/to/cache/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

The pipeline is deterministic in everything it publishes (the per-run identifier salt only changes internal
hashes that are never written). The manifest's SHA-256 values let a second run be compared byte for byte.

## Sensitivity study

`kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json` replays one
day's reports under one-at-a-time changes of every pre-registered parameter (two values each, plus a 1.0 degree
grid) and reports, per variant, the number of degraded, not degraded and not observed cells, the Jaccard index of
the degraded set with the registered one, the cells whose state changed, and the degraded area. It changes
nothing about the registered rule: a variant is not a validated alternative, and a large change under a parameter
says how much the call depends on that parameter, not which value is right. The results for the back-catalogue
are in `docs/observatory/RESULTS.md`.

## Limits

- **Coverage.** adsb.lol follows volunteer receivers; open sea and thinly covered airspace are sparse, and
  `not_observed` is common there. A map shows the coverage of its source.
- **What low accuracy means.** NACp and NIC fall for reasons other than interference: satellite or augmentation
  outages, space weather, receiver or transponder faults, and geometry. No state implies a cause.
- **Aircraft that stay in an affected region all day** have no baseline outside it and are not counted, so the
  method understates a persistent regional effect. The sensitivity study shows the baseline guard's effect.
- **Day boundaries** are UTC; an event that crosses midnight is split between two days.
- **No ground truth.** The observatory has no external oracle: every figure is MODELLED, and no row of the
  verification matrix rests on it.
- **Sensitivity of the subject.** Maps of this kind are political. The observatory states a method, a delay and
  a vocabulary, and nothing else; it does not name states or actors, and it does not publish in real time.
