# Pre-registration: the `gnss-ssv` kind against the ICG Space Service Volume booklet (0.38 WS-H H1)

Committed alone, before the `gnss-ssv` kind exists and before any number it produces has been compared with a
published one. The method, the interpretation choices, the bars and the verdict rule below are fixed now. Bars may
be tightened later, never loosened; a miss is recorded with its numbers and pinned by a test that asserts the miss.

## The public oracle

*The Interoperable Global Navigation Satellite Systems Space Service Volume* (United Nations Office for Outer Space
Affairs, ST/SPACE/75, first edition, 1 November 2018; prepared by the International Committee on GNSS, Working
Group B). Public. Fetched by `xval/gnss-ssv/fetch.sh`, never vendored; SHA-256
`3bdeb9edd5cfdb98323a3a6df83c2e7f0669785f428a8fe5bb2302aa6a62b4d6` (6,242,508 bytes).
The booklet is itself a simulation by the ICG: it is a published, independent computation, not a measurement. What
agreeing with it shows is that this implementation reproduces the stated method; it does not validate the GNSS
signals' real behaviour. Everything the booklet's method leaves out stays MODELLED.

Its method is specified in annex B and annex C (orbital elements of every constellation), so the comparison is a
reimplementation from a public specification:

- Keplerian two-body propagation from the elements of annex C at 2016-01-01 12:00:00 UTC, mu = 3.986004415e14 m^3/s^2,
  14 days at 1-minute steps; Earth radius 6378 km plus a 50 km atmosphere for blockage; Earth rotation rate
  2 pi (1.00273781191135448) rad/day and Earth rotation angle 2 pi (0.7790572732640) at the epoch (table B1).
- Transmit beam: access if the angle off the transmitter's boresight (nadir, except NavIC: towards 5 deg N, 83 deg E)
  is at most the reference off-boresight angle of table B2/B6; a constant minimum radiated transmit power over that cone.
- RF: MRTP = Pmin + Ls, Ls the free-space loss over the distance from the constellation's worst-case apogee (table B8)
  to a 36,000 km user along the Earth-limb line (annex B, figure B4); C/N0 = P_received + 228.6 - 10 log10(290) dB-Hz
  for a 0 dBi user antenna (table B7).
- User antenna: hemispherical towards nadir (upper SSV), omnidirectional (lower SSV).
- Availability = the share of (grid point, epoch) pairs with at least 1 / at least 4 signals; maximum outage duration
  (MOD) = the longest run of epochs without them at the worst grid point.

## Interpretation choices (fixed now; the booklet does not state them)

1. **The user grid.** Annex B gives 2,562 equal-area points "with roughly 4 degree spacing". 2,562 = 10 x 4^4 + 2 is the
   vertex count of an icosahedron subdivided four times. The grid is built that way: start from the regular icosahedron,
   split every triangle into four by its edge midpoints, push the new vertices to the sphere, repeat four times. The user
   sits at that direction times (6378 + altitude) km, fixed in the Earth-fixed frame (the booklet's "fixed ground track
   location"). The booklet's own grid may differ in detail; that is a known source of difference in the worst-case MOD.
2. **Epochs.** 20,161 samples (t = 0 to 20,160 min, inclusive). A MOD of 20,160 min is the whole run ("*" in the booklet:
   never available at the worst grid point).
3. **MOD counting.** The number of consecutive unavailable epochs times one minute, capped at 20,160 min.
4. **"Combined"** counts the signals of the constellations of that band together: L1/E1/B1 = GPS L1, GLONASS L1, Galileo E1,
   BDS B1, QZSS L1; L5/L3/E5a/B2 adds NavIC L5. The reference off-boresight angles and minimum powers are those of
   table 4.2 / B6 (BDS: MEO 25/28 deg, GEO and IGSO 19/22 deg).
5. **Mission user antennas** (GEO, HEO, lunar): table B10, read as gain against the angle from the antenna boresight
   (0 deg is the boresight); outside 0 to 90 deg there is no signal. The nadir antenna is the high-gain one, the zenith
   antenna the patch; with both, each satellite is received on the one that gives the higher gain. C/N0 uses the actual
   range and the table's gain; the transmit side is the MRTP of table B6.
6. **HEO and lunar run lengths.** HEO: 1.5 orbital periods at 1-minute steps. Lunar: a two-body ellipse from the departure
   perigee (185 km altitude, inclination 32.5 deg, RAAN 30 deg, argument of perigee 32 deg) with its apogee at 384,400 km
   from the Earth's centre, for the outbound half, at 1-minute steps. This is not the booklet's propagated trajectory (it
   is not given); the lunar bar is correspondingly loose.
7. Percentages are compared unrounded against the published values (which the booklet rounds down to 0.1 %).

## What was seen before this was written (disclosed)

- The booklet's text, tables 4.1 to 5.13 and annexes B and C (every published number this pre-registration compares
  with), read in full. The tolerances were chosen from the interpretation choices above (grid, rounding, trajectory),
  not by trying the simulation.
- The first rows of the NAVCEN GPS Block IIR/IIR-M panel pattern workbooks (table layout only; no gain value summarised).
- The engine's existing `earth-gnss-lunar` kind and its antenna module. No `gnss-ssv` result of any kind exists.

## Bars

| bar | statement |
|---|---|
| S0 constants | the MRTP the inverse link budget gives matches table B6 within 0.1 dB for all 13 signals (a formula check, run without the simulator) |
| S1 upper SSV, geometry | table B4 (= table 5.1's geometry): at least 1 and at least 4 signal availability for all 13 band/constellation rows (incl. combined), each within **2.0 percentage points**; MOD where the booklet gives a number within max(10 min, 25 %); "*" in the booklet matches a never-available worst-case grid point in the simulation, and a number does not |
| S2 lower SSV, geometry | table 5.2 (user at 8,000 km, omnidirectional), the same rows, availability within 2.0 pp, MOD as S1 |
| S3 upper SSV, RF | table B9 (thresholds 15, 20, 25 dB-Hz): availability within 2.0 pp for every row and threshold; "*" as S1 |
| S4 GEO missions | tables 5.4 to 5.9 (six GEO users, high-gain nadir antenna, 20 dB-Hz): availability of at least 1 and at least 4 signals, every row, within **3.0 pp** (MOD reported, no bar) |
| S5 HEO mission | table 5.11 (nadir high-gain + zenith patch, 20 dB-Hz): availability within **5.0 pp** (MOD reported, no bar) |
| S6 lunar mission | table 5.13: availability within **10.0 pp** (a stand-in trajectory; the loosest bar) |
| S7 transmit pattern | the labelled parametric shaped-beam + sidelobe model for GPS L1, compared with the NAVCEN measured Block IIR-M panel patterns (fetched, never vendored; azimuth-averaged, shape relative to the boresight value): RMS difference at most **3 dB** over 0 to 30 deg off-boresight. The measured patterns are of the panel alone, not the spacecraft |

A bar passes only if every value it lists is within its tolerance. Each bar is reported with every value, passing or not.

## Verdict rule

- If S0 to S3 all pass, the **geometry and RF-access core** is recorded as agreeing with the published ICG simulation
  ("external public oracle"; ledger status Validated for that sub-claim only).
- Any miss in S0 to S3 keeps the ledger row MODELLED, and the miss is published with its numbers.
- S4 to S7 failing never changes S0 to S3's verdict; each is reported on its own. S4 to S7 passing is "agrees with the
  published figure", still MODELLED as a whole (the ledger row is one row; its sub-claims are listed).
- Nothing in this pre-registration is changed after the first scored run; a later change is a new pre-registration.

## Rules for the result

One scored run, by the command recorded in `xval/gnss-ssv/RESULTS.md`, on the commit that precedes it. Pinned by a test
that asserts the recorded verdicts, a miss included. The booklet is cited, never vendored; no pattern data of any
constellation is committed.
