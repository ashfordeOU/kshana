# Pre-registration: the GLONASS broadcast clock and orbit against RTKLIB

Committed alone, before the engine function exists, before the oracle harness has been built or
run, and before any comparison. The bars below are not loosened after a run; a miss is recorded
with its numbers.

## The change (additive)

`GlonassEphemeris::sv_clock_bias_s(t_sv_s)`: the satellite clock bias of the GLONASS broadcast
message, `−τn + γn·(t − tb)` (GLONASS Interface Control Document, edition 5.1, 2008), where `t_sv_s` is the time read
on the satellite clock as an offset from the reference epoch `tb`, and the offset is corrected for
the clock bias itself by two fixed-point iterations (the same convention as RTKLIB `geph2clk`).
Until now `minus_tau_n` and `gamma_n` were parsed and stored but used nowhere. No existing
function or output changes; nothing calls the new function in a scenario yet.

PZ-90.11: since 2014 the broadcast frame is PZ-90.11, which agrees with ITRF2008 at the
centimetre level, and RTKLIB applies no transformation. This change adds none either and says so
in the module documentation; that is a statement of scope, not a compared quantity.

## Quantities compared

For every GLONASS (`R`) ephemeris record in the committed real broadcast file
`tests/fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx` (2013-01-01, IGS MGEX merged
navigation, already in the tree; 4 GLONASS records), and every offset `dt` of this grid (fixed
now): −900 to +900 s in 30 s steps (61 values), plus ±0.5, ±7.25, ±59.9, ±60.1, ±451.3,
±899.99 s (12 values) — 73 offsets, 292 cases:

- **C (clock).** Kshana `sv_clock_bias_s(dt)` against RTKLIB `geph2clk(toe + dt, geph)`.
- **P (position).** Kshana `position_ecef(dt)` (existing, unchanged) against RTKLIB
  `geph2pos(toe + dt, geph)`, the 3-D distance.

RTKLIB reads the file with its own RINEX reader (`readrnx`), so the parse of the record is
compared too. Records are matched by slot number and reference epoch (UTC).

## Oracle

RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ffa, `src/ephemeris.c`, compiled from C
source in a separate harness (`xval/rtklib-glonass/glonass_harness.c`, `build.sh`,
`generate.sh`), run as a separate program; output committed as
`tests/fixtures/glonass_broadcast_rtklib_oracle/rtklib.csv` with 17 significant digits.

## Bars (fixed now)

- **C:** every case `|Δclock| ≤ 1e-14 s` (3 µm of range). Both sides evaluate the same closed
  form, so this checks the parse, the sign convention of `−τn`, the units and the iteration, not
  the formula.
- **P:** every case `|Δr| ≤ 0.01 m`. Disclosed before the run: the two integrators differ
  (RTKLIB steps 60 s and then the remainder; Kshana splits the interval into equal steps of at
  most 60 s), and the constants differ (RTKLIB `μ = 3.9860044e14 m³/s²`, `J2 = 1.0826257e-3`;
  Kshana the PZ-90.11 `μ = 3.986004418e14`, `C20 = −1.08262575e-3`). The predicted effect of the
  `μ` difference is about 1 mm at 900 s; the bar leaves margin for the step partition.

## Outcome rule

Both bars pass → the GLONASS broadcast clock and orbit rows may be labelled VALIDATED against
RTKLIB for this scope (broadcast clock and broadcast-orbit propagation within ±15 min). Either
fails → recorded as a finding with the worst case, and the row stays MODELLED.
