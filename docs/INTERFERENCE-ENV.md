# Interference environments

`kshana interference-env` describes an interference environment at an RNSS receiver and evaluates
it against published numbers: the continuous-interference thresholds of Recommendation ITU-R
M.1903-1 and the pulsed-interference method of Recommendation ITU-R M.2030-0. It is a model library:
nothing here radiates, and every result is MODELLED.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| A-RNSS | assisted radionavigation-satellite service receiver |
| CW | continuous wave |
| DME | distance measuring equipment |
| GBAS | ground-based augmentation system |
| ITU-R | the Radiocommunication Sector of the International Telecommunication Union |
| JSON | JavaScript Object Notation |
| PDC | pulse duty cycle |
| PRF | pulse repetition frequency |
| RNSS | radionavigation-satellite service |
| SBAS | satellite-based augmentation system |
| TACAN | tactical air navigation |
| TOML | Tom's Obvious Minimal Language |

## Commands

```bash
kshana interference-env thresholds [--receiver sbas-cat1-type1]
kshana interference-env evaluate examples/interference-env/l1-mixed.toml
kshana interference-env degradation --baseline l2-sbas-ground-reference --pulse-width 44e-6 --prf 500
```

Every command writes JSON.

## What is reproduced, and from where

| Published item | Here | Check |
|---|---|---|
| M.1903-1 (09/2019) Table 1: relative continuous interference threshold against interference bandwidth, L1 C/A receivers | `relative_threshold_db` | every breakpoint exactly (`tests/interference_env.rs`) |
| M.1903-1 Table 2: aggregate narrow-band (dBW) and wideband (dB(W/MHz)) thresholds, tracking and acquisition, saturation level, overload recovery time | columns 1 (SBAS Category I Type 1), 3 (GBAS Category I/II/III Type 1) and 7 (A-RNSS) | Table 1 at 700 Hz and at 1 MHz gives Table 2's narrow-band and wideband values for columns 1 and 3 |
| M.2030-0 (12/2012) equations (1) to (8): effective noise density with a pulse blanker or a saturating receiver, aggregate duty cycle, degradation ratio of an added pulsed source group | `n0_eff_blanking`, `n0_eff_saturating`, `aggregate_pdc`, `degradation_ratio` | the two worked examples of Annex 2: 1.04657 (0.198 dB) and 1.09963 (0.413 dB as printed; 0.4125 dB from the same ratio) |
| M.2030-0 Tables 1 and 2: baseline PDC, R_I, I0,WB/N0 and allowable degradation ratios (1 164–1 215 MHz, 1 215–1 300 MHz) | `BASELINES` | values as printed |

Between the breakpoints of M.1903-1 Table 1, which says "linearly increasing", the level is
interpolated in dB against the logarithm of the bandwidth. That is the reading consistent with the
table's note (1): above 1 MHz a constant density gives 10·log10(B/1 MHz), and the 0 to 13 dB segment
from 1 to 20 MHz is that line within 0.011 dB. The scale of the Recommendation's Figure 1 is to
confirm against the printed figure. The other columns of Table 2 are not encoded: their values are
in a table whose extracted layout does not tie each number to its column beyond doubt.

Not reproduced: the RTCA DO-235C and DO-292 interference masks and DME/TACAN "hot spot" pulse
environments are not public. A pulse is described by its received peak power, width and rate, not
its shape.

## The environment file

```toml
receiver = "sbas-cat1-type1"       # or gbas-cat1-3-type1, a-rnss
mode = "tracking"                  # or acquisition
noise_temperature_k = 513.0        # for pulsed sources
precorrelation_bw_hz = 20.46e6     # for pulsed sources
n_lim = 0.0                        # 0: pulse blanking; 1, 2, ...: saturating (M.2030 N_LIM)
# blanker_threshold_dbw = -135.0   # default: the receiver's saturation level

[[source]]
kind = "cw"                        # power_dbw
[[source]]
kind = "wideband"                  # density_dbw_mhz, bandwidth_hz
[[source]]
kind = "pulsed"                    # peak_dbw, pulse_width_s, prf_hz
```

Every level is the received level at the passive antenna output (antenna gain toward the source
already applied). Each continuous source is compared with the threshold for its bandwidth (a CW tone
uses the narrow-band threshold); `aggregate_fraction_db` sums the sources' fractions of their
thresholds (0 dB: at threshold). Pulsed sources at or above the blanker threshold count in the
blanked duty cycle with the receiver's overload recovery time (M.2030 equation 3a); weaker ones count
in R_I with their own duty cycle (equations 2 and 4a). Wideband sources give I0,WB. The result is
N0,EFF/N0 by equation (1) or (5).

`degradation` adds a pulsed source group (width, rate, and optionally its below-threshold ratio
R_Y) to a baseline of M.2030 Table 1 or 2 and reports N0,EFF+Y/N0,EFF against the allowable ratio.
Baselines: `l5-air-nav-1-cdma`, `l5-air-nav-2-fdma`, `l5-high-precision-cdma`, `l5-high-precision-fdma`,
`l2-sbas-ground-reference`, `l2-high-precision-semicodeless`, `l2-air-nav-fdma-1us`, `l2-air-nav-fdma-30us`.

## Limits

- The thresholds apply as M.1903-1 states them; the 6 dB aeronautical safety margin of its Annex 1
  is not applied by these commands.
- M.2030-0 has no baseline table for 1 559–1 610 MHz; for L1 the pulsed result is N0,EFF/N0 from the
  given sources, with no allowable ratio.
- The example environment is invented for illustration, not a measured site.
