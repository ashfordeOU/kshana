# Pre-registered prediction: lunar reference-station coverage (frozen 2026-10-12)

> **A pre-registered prediction, not a validation. MODELLED, under the stated public
> assumptions.** It is not a statement about the performance of any real system. No agency has
> endorsed or reviewed it, and Kshana is not affiliated with any agency.
>
> **Read every figure below with this:** the four-satellite constellation's element set
> (eccentricity, inclination, argument of perilune, plane and phase spacing) is **not public**.
> The values used are ILLUSTRATIVE, and with four satellites they dominate the result. A user
> needs all four above the mask, and the epochs where that happens are near-singular geometry,
> so availability, accuracy and protection levels below are mostly a consequence of that
> unpublished choice, not of the public assumptions. When the elements are published, the
> scoring protocol re-runs with them (below).

## What is frozen

| Item | Value |
|---|---|
| Frozen commit (the inputs) | `c05dac1d167988c33daf7ffc0ff8567b1c193ad4` |
| Engine | Kshana 0.36.0 development line (the crate version string at freezing is 0.35.0; the result JSON carries no version) |
| Region run | [`lunar-reference-station.region.toml`](lunar-reference-station.region.toml), SHA-256 `c265df1701a441df43b497eba39c63dfbe18bfd53087052315f49c99f105ec13` |
| Its result | [`lunar-reference-station.region.result.json`](lunar-reference-station.region.result.json), SHA-256 `d108f77ecca57902774fdb3d9f62a8b8318c8435136864736d7e630cab0d4df3` |
| Points run | [`lunar-reference-station.points.toml`](lunar-reference-station.points.toml), SHA-256 `c3bc398cad21c718ead419cb5499eaad9c9aa6388865f8d8ff1fcbfa106ae97c` |
| Its result | [`lunar-reference-station.points.result.json`](lunar-reference-station.points.result.json), SHA-256 `574dbab8f78ee61792c2c3352edd8035e5843fcedd1e526611238d430ad03c93` |
| Seed | 42 |
| Frozen platform | linux x86_64, Rust 1.93.0 (byte-identical); other platforms reproduce shape and values to 1e-6 |
| Guard | `tests/prediction_frozen.rs` |

The inputs are `scenarios/lunar-station-coverage-public-sources.toml` at freezing: every input a
public source states, cited by source id (S1 to S4 in
[`docs/LUNAR-REFERENCE-STATION.md`](../LUNAR-REFERENCE-STATION.md)), every other input
ILLUSTRATIVE. Sourced: four satellites, the 24 h period, SISE 10 m at 95 % (read as a zero-mean
Gaussian 1-sigma of 10 / 1.96 m), receiver noise 0.30 m, a 1 s correction period, an example
south-polar station site (89.4765 S, 138.135 W), the 80 deg S region. ILLUSTRATIVE: the element
set, the 5 deg mask, the 50/50 orbit/clock split of the SISE, the 0.30 m station survey, 8-bit
quantization, the 10 m alert limit, the 5 m protection-level residual, a day at 600 s, 200
trials. The coverage threshold, 1 m at p95, was stated before the run.

## Predicted figures

Every figure: **MODELLED, under the stated public assumptions; dominated by the unpublished
element set.**

### Over the region (80 deg S to the pole; 346 points, 144 epochs, 200 trials)

| Figure | Predicted |
|---|---|
| Availability (area-weighted share of epochs with four satellites above the mask at the user, all seen by the station) | 8.2 % |
| Coverage (share of epochs whose p95 corrected 3-D error is at most 1 m) | 0.0 % |
| Corrected p95 3-D / horizontal / vertical error (area-weighted mean over points) | 280.5 m / 123.8 m / 250.9 m |
| Uncorrected p95 3-D error | 3768.7 m |
| Improvement factor (uncorrected / corrected) | 13.4 |
| HPL max / VPL max | 3.6e5 m / 8.0e5 m |
| Share of epochs with HPL below the 10 m alert limit | 0.0 % |
| Worst point | 81 deg S, 244.3 deg E: corrected p95 7846.5 m |
| Coverage radius (95 % coverage), every 30 deg sector | 0 km |

### Along four bearings from the station, and at the region edge

| Distance from station (km) | Bearing (deg) | Availability | Corrected p95 3-D (m) | Uncorrected p95 3-D (m) | HPL median (m) | VPL max (m) |
|---|---|---|---|---|---|---|
| 0 (the station) | — | 12.5 % | 110.3 | 1535.8 | 306.4 | 14538.6 |
| 50 | 0 | 11.1 % | 141.8 | 1810.5 | 310.4 | 14526.2 |
| 100 | 0 | 10.4 % | 177.9 | 2069.9 | 310.6 | 14499.1 |
| 200 | 0 | 7.6 % | 283.5 | 3359.7 | 254.1 | 15207.5 |
| 50 | 90 | 11.1 % | 208.5 | 2276.5 | 324.8 | 27726.1 |
| 100 | 90 | 10.4 % | 1543.9 | 26651.6 | 335.0 | 300216.0 |
| 200 | 90 | 8.3 % | 181.4 | 2341.3 | 336.2 | 16000.0 |
| 50 | 180 | 10.4 % | 129.1 | 1678.4 | 357.3 | 14535.6 |
| 100 | 180 | 9.7 % | 140.2 | 1756.8 | 370.3 | 14516.7 |
| 200 | 180 | 8.3 % | 162.2 | 2158.2 | 357.6 | 14428.8 |
| 50 | 270 | 11.8 % | 111.1 | 1372.3 | 310.4 | 9847.2 |
| 100 | 270 | 9.7 % | 107.2 | 1393.6 | 337.8 | 7437.8 |
| 200 | 270 | 7.6 % | 124.9 | 1428.3 | 308.5 | 5454.2 |
| 287.4 (edge, 80 deg S) | 0 | 7.6 % | 1287.7 | 14859.3 | 217.5 | 120496.0 |
| 303.6 (edge) | 93.0 | 6.9 % | 97.5 | 1291.2 | 322.3 | 7599.1 |
| 319.1 (edge) | 180 | 6.2 % | 77.3 | 938.2 | 311.3 | 3407.8 |
| 303.6 (edge) | 267.0 | 6.9 % | 136.6 | 1628.6 | 280.7 | 6667.9 |

The non-monotone rows (100 km at bearing 90; the edge at bearing 0) are near-singular four-satellite
epochs inside the sample, reported as computed.

## Scoring protocol (fixed now)

1. **What is compared.** When flight or test results are published by any party, each figure above
   is compared with the published quantity that measures the same thing under the same definition:
   - corrected and uncorrected position error at a stated percentile, at the station and at stated
     distances from it, against published user positioning accuracy with and without the station's
     corrections;
   - availability and coverage against published availability or coverage of the corrected
     service over the south-polar region;
   - the coverage radius against any published statement of how far one station's corrections
     serve;
   - protection levels against published protection levels or integrity figures.
   A figure with no published counterpart is reported as not scored, with the reason.
2. **The bar.** Accuracies and protection levels: within a factor of 2 either way. Availability,
   coverage and the coverage radius: within 10 percentage points (the radius within 10 % of the
   region's 300 km). Each scored figure is a hit or a miss against its bar, and the totals are
   reported as "n of m within the bar".
3. **Different assumptions.** If the published results rest on different assumptions (the element
   set, above all, but also the SISE, the station site, the mask or the region), the published
   assumptions are put into a new scenario and run as a **new, dated prediction beside this one**,
   and both are reported. This prediction is never edited, re-run under new inputs in place, or
   withdrawn.
4. **Misses.** A miss is published as prominently as a hit, in the same place and the same form.
5. **Who scores.** Anyone can: the inputs, the engine version and the hashes above are enough to
   reproduce every figure, and `tests/prediction_frozen.rs` fails if any of it moves.

## What this is not

Not a claim about any real system, its performance or its design; not a validation of this model;
not endorsed or reviewed by any agency. Omitted from the model: terrain and horizon masking at the
pole, multipath, receiver hardware, and the growth of the ephemeris error over the correction
latency beyond the line-of-sight re-projection.
