# Pre-registration: SP3 satellite-clock interpolation against the published 30 s IGS clocks

Committed on its own on 2026-10-12, after the products below were downloaded and before the
fixture is cut and before `Sp3File::clock_s` is run on them. The bars are not loosened after the
run; a miss is recorded with its numbers.

## Quantity

`Sp3File::clock_s` (src/sp3.rs): the satellite clock offset at an arbitrary time by linear
interpolation between the two bracketing valid SP3 clock nodes (the scheme of RTKLIB `pephclk`),
and `ClockRinex::from_sp3`, which feeds the same nodes to `PreciseProducts`.

## Oracle (published data, ExternalDataset)

The International GNSS Service (IGS) final combined products for 2025-02-24 (GPS week 2355,
day 1), from the BKG mirror of the IGS archive (`https://igs.bkg.bund.de/root_ftp/IGS/products/2355/`):

- `IGS0OPSFIN_20250550000_01D_15M_ORB.SP3.gz`: orbits and clocks at 15 min (the input);
- `IGS0OPSFIN_20250550000_01D_30S_CLK.CLK.gz`: the IGS combined satellite clocks at 30 s
  (the oracle: the published clock values at the query instants, estimated from the tracking
  data, not interpolated from the SP3).

Fixture cut (fixed now): GPS satellites only; the SP3 epochs of the whole day; the CLK `AS`
records of every satellite at the 15 min nodes (offset 0 s in each interval) and at the interval
mid-points (offset 450 s), over the whole day.

## Criteria (fixed now)

Over all GPS satellites and all records where the SP3 brackets the query with two valid clock
nodes 900 s apart and the CLK record exists:

- **N (nodes)**: at the 15 min nodes, the median of |SP3 clock − CLK clock| is at most 1e-12 s
  (the SP3 prints the clock in µs with 6 decimals, so 0.5e-12 s is its rounding).
- **I1 (mid-points)**: at the mid-points, the root-mean-square of (interpolated − CLK) is at most
  0.15 ns.
- **I2**: the 95th percentile of |interpolated − CLK| at the mid-points is at most 0.30 ns.
- **D (discrimination)**: holding the earlier node's value instead of interpolating gives a
  root-mean-square at the mid-points at least twice that of I1, so the comparison can tell an
  interpolator from none.
- **Non-vacuity**: at least 25 satellites and at least 2000 mid-point records.

Basis of the bars: a 15 min linear interpolation of rubidium GPS clocks is commonly put at about
0.1 ns root-mean-square, with caesium clocks worse; the 95th-percentile bar allows twice that.
No physical tolerance enters N beyond the SP3 print resolution.

Outcome rule: if N, I1, I2, D and non-vacuity hold, the SP3 clock interpolation row is VALIDATED
against the published IGS 30 s clocks. Any miss is recorded as a finding and the row stays
MODELLED.
