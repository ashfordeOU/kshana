# Pre-registration: `src/ionex.rs` on a real CODE global ionosphere map (FUT-22 / CAP-26)

Written 2026-10-12, before the fixture slice in this directory was generated, before the
formula reference (`reference_interp.py`) was written or run, and before any comparison of
Kshana output against anything derived from the real file. This file is committed alone.
Bars may be tightened later, never loosened; a miss is recorded with its numbers as a finding.

## Data

`CODG1330.18I.Z`, the CODE (Center for Orbit Determination in Europe, AIUB, University of Bern)
final global ionosphere map for 2018-05-13 (day 133), IONEX 1.0, 25 hourly maps 00:00 to
24:00 UT, 71 x 73 grid (latitude 87.5 to -87.5 step -2.5, longitude -180 to 180 step 5),
height 450 km, EXPONENT -1, TEC maps followed by RMS maps. Same file (same SHA-256
6f2ef96d339ff0e6fa9ef42f337d9a7ab6ee5c3cc5c8cf94c21080c77ca235c1) as
`tests/fixtures/geometry_free_tec_gim_oracle/`.

Committed slice (`codg1330_crop.18i`): every header record verbatim except `LAT1 / LAT2 /
DLAT`, which becomes `30.0 5.0 -2.5`, plus `COMMENT` records stating the crop; every one of the
25 TEC maps and 25 RMS maps cut to the 11 latitude bands 30.0 to 5.0 (all 73 longitudes, the
band records and value records verbatim). It remains a valid IONEX 1.0 file.

## Oracles and their class

(a) Published data, structural. The file's own printed integers and header. MODELLED-level
evidence on real data (the file is the truth for what it prints; this checks the reader).
(b) Formula reference. An independent Python-stdlib re-implementation, written from the IONEX
1.0 format description (Schaer, Gurtner and Feltens, 1998, section on interpolation: the
4-point bilinear formula in space; equation 2, linear between consecutive maps; equation 3,
linear between consecutive maps each rotated by the Earth's rotation, lambda' = lambda +
360 deg (t - T_i) / 86400 s), with its own IONEX reader, without reading Kshana's source. This
is a separate implementation of a published formula, not a third-party library or published
values: proposed oracle kind ReferenceImpl / InternalConsistency, status MODELLED.
(c) RTKLIB `iontec` / `interptec` output (BSD-2-Clause), data-gated: this session may not
build or run RTKLIB, so the harness reads a CSV a third party produced and skips when absent.

## Query design (fixed now)

Times t (seconds since 2018-05-13 00:00:00 UT): 0, 1020, 2040, ..., 85680 (85 epochs, step
17 min) for the time-interpolated modes; the 25 map epochs for the spatial check.
Latitudes (deg): 5.0, 6.3, 10.0, 12.85, 16.2621, 21.7, 27.5, 29.99, 30.0.
Longitudes (deg): -180.0, -179.2, -61.5281, -3.7, 0.0, 47.31, 122.9, 177.5, 180.0.
Rotated longitudes are wrapped into [-180, 180) before the bilinear step.
Zenith angles for the slant check, cycled by sample index k: z = (0, 30, 60, 80)[k mod 4] deg,
shell height = header HGT1 (450 km), Earth radius 6371 km, obliquity 1/cos(asin(R/(R+H) sin z)),
L1 delay 40.3e16 STEC / f^2, f = 1575.42 MHz.

## Bars

B1 Structure: map count = header `# OF MAPS IN FILE` (25); map k epoch = `EPOCH OF FIRST MAP`
   + k x `INTERVAL` (3600 s), the last equal to `EPOCH OF LAST MAP` (2018-05-14 00:00:00,
   i.e. t = 86400 s); grid 11 x 73 from the header; each band record's latitude equals the
   header grid row.
B2 Node exactness: at every node of every TEC map, |parsed - printed integer x 10^EXPONENT|
   = 0 exactly (f64), and the printed integer is recovered by rounding parsed / 10^EXPONENT.
   Applies to the new reader and to the existing `parse_ionex` (whose node values must be
   identical to the new reader's for all 25 maps).
B3 Interpolated vertical TEC against the formula reference (b): |Delta| <= 1e-9 TECU at every
   sample, for (i) bilinear at the 25 map epochs (25 x 81 samples), (ii) equation 2 (85 x 81),
   (iii) equation 3 (85 x 81). For (ii) the existing `interpolate_tec_in_time` + `vtec_at`
   composition, given the true map epochs, is held to the same bar.
B4 Slant: slant TEC |Delta| <= 1e-9 TECU and L1 delay |Delta| <= 1e-10 m against (b), on the
   equation-3 samples.
B5 Discrimination (must hold, else the comparison is not discriminating): the equation-3
   reference differs from equation 2 by more than 0.1 TECU at some sample, and from a
   sign-flipped rotation by more than 0.1 TECU at some sample.
B6 RTKLIB, data-gated on `KSHANA_IONEX_RTKLIB_CSV` (header row; columns `time,lat,lon,vtec`,
   time in seconds since 2018-05-13 00:00:00 UT, degrees, TECU, at least 6 decimals): every
   row |Delta| <= 1e-5 TECU against the equation-3 mode (RTKLIB's earth-rotation option), or
   equation 2 when `KSHANA_IONEX_RTKLIB_MODE=consecutive`; at least one row. Skips with a
   message when the variable is unset.

Known before the run, not a bar: the existing `parse_ionex` stores epochs as seconds of day,
so the 25th map (2018-05-14 00:00:00) reads as 0 s; it is recorded, not fixed (that would
change an existing output).
