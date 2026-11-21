<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Receiver-antenna characterisation tools

`kshana antenna-cal` checks antenna calibration files and turns calibrations and antenna figures into the
numbers an installation or a timing chain needs.

```
kshana antenna-cal lint <file.atx>
kshana antenna-cal spread <file.atx>... --type <type-radome>
kshana antenna-cal compare <a.atx> [<b.atx>] --type <type-radome> [--serial-a <s>] [--serial-b <s>] [--max-zenith <deg>]
kshana antenna-cal group-delay <spec.toml>
kshana antenna-cal js-margin <spec.toml>
```

Every subcommand prints a JSON document, or writes it with `--out <file.json>`. `lint` exits 1 when it
finds an error and 0 otherwise; any subcommand exits 2 on a usage or input error.

**Labels.** `lint` is a format check of an input file. `spread` and `compare` are arithmetic on the
calibrations given: they say nothing about which calibration is right. `group-delay` and `js-margin` are
MODELLED from the stated inputs; the antenna gain presets are illustrative shapes, not any product's
pattern. Field calibration of offsets and variations from station data is not part of this command.

## `lint`: ANTEX 1.4

Checks a file against the IGS ANTEX 1.4 format (`antex14.txt`), record by record. Errors (the file
breaks the format):

- header: a version record, a `PCV TYPE / REFANT` record of `A` or `R`, `END OF HEADER`;
- blocks: `START`/`END OF ANTENNA` and `START`/`END OF FREQUENCY` (and `FREQ RMS`) pairing, the same
  frequency code at both ends, no block left open, no record outside an antenna, no unknown label, no tab
  character in a fixed-column record;
- each antenna: a type, a zenith grid whose range is a whole number of `DZEN` steps, a `DAZI` of zero or
  dividing 360, the declared `# OF FREQUENCIES` equal to the frequency blocks, no repeated frequency, a
  known frequency code, a `VALID FROM`/`VALID UNTIL` of six numbers in order, a `SINEX CODE` of at most
  ten characters, no second entry with the same type, serial and validity start;
- each frequency: an offset record of three numbers, a `NOAZI` row with one value per zenith angle, and
  with `DAZI > 0` one azimuth row per step from 0 to 360 in order, each with one value per zenith angle.

Warnings (the file parses, but a convention is not followed or a value is implausible): a version other
than 1.4, a receiver type without a radome, a missing method, a `NOAZI` row more than 1 mm from the mean
of the azimuth rows, a receiver offset beyond 50 mm horizontally or 300 mm vertically, a receiver
variation beyond 50 mm, a receiver variation not zero at the zenith.

The `igs20.atx` slice in the test fixtures (33 receiver and satellite antennas) lints without an error.
The `igs14.atx` satellite slice there had its variation rows dropped when it was cut (its NOTICE says so);
the lint reports exactly those missing rows (one `missing-noazi` error per frequency block, and
`azimuth-rows` for the blocks that declare an azimuth step) and no other error.

## `spread`: unit-to-unit scatter

Given individual calibrations of one antenna type (several serials, in one or more ANTEX files), states
per frequency the mean, sample standard deviation and largest deviation of the north, east and up
offsets across the units, and of the `NOAZI` variation at each zenith angle where the grids agree. This
is the scatter a type-mean calibration (as in `igs20.atx`) does not describe.

## `compare`: two calibrations through the line of sight

Offsets and variations are not separately observable: a vertical offset `δ` and a variation `δ·cos z`
give the same phase. `compare` therefore compares what a receiver uses, the phase-centre correction
along the line of sight

`PCC(z, a) = −r·PCO + PCV(z, a)`, `r = (cos a · sin z, sin a · sin z, cos z)` (north, east, up),

on a 5° grid of zenith (to `--max-zenith`, default 80°, and within both grids) and azimuth, with
bilinear interpolation of the variations. The difference `b − a` has its mean removed (a receiver clock
absorbs a constant) and is summarised as RMS and largest absolute value per common frequency and for the
GPS L1/L2 ionosphere-free combination (`2.546·L1 − 1.546·L2`). Typical use: a robot calibration against
a chamber calibration of the same unit, an individual calibration against the type mean, or two
generations of a type mean. With one file, both calibrations are read from it (by serial with
`--serial-a`/`--serial-b`).

## `group-delay`: timing bias from the antenna

Per signal: the stated group delay (ns and m), its range over the stated temperature span from a linear
coefficient about the calibration temperature, its range over elevation from stated points, and the
peak-to-peak variation that remains after a calibration at the reference temperature. Per
ionosphere-free pair `(f1, f2)`: the bias `(f1²·d1 − f2²·d2)/(f1² − f2²)` and the worst-case variation
over the corners of the two variation intervals. A delay common to every satellite enters the receiver
clock: positioning absorbs it, time transfer does not, so for a timing receiver it is a bias that must
be calibrated. `examples/antenna-cal/group-delay.toml` uses illustrative values.

## `js-margin`: installation J/S

`J/S = EIRP − FSPL(R) + G(el_j) − isolation − (S + G(el_s))` with the free-space path loss
`20·log10(4πRf/c)`, the antenna gain toward the jammer `G(el_j)` and toward the satellite `G(el_s)`, a
stated isolation (mounting, ground plane, shielding) and the received isotropic signal power `S`
(default −158.5 dBW, the GPS L1 C/A minimum). It states J/S and the margin to a stated receiver J/S
tolerance at each given range, and the stand-off range at which J/S equals the tolerance. Gains come
from a measured `gain_table` (elevation, dBi) or an illustrative `patch` or `choke-ring` shape. This is a
siting budget: nothing here steers, nulls or controls an antenna.

## Tests

`tests/antenna_cal.rs`: the `igs20.atx` excerpt lints without an error and the trimmed `igs14.atx` excerpt with exactly its missing variation rows; eight seeded defects are each found;
`compare` gives zero for identical calibrations, near zero for an up offset compensated by `δ·cos z` in
the variations, and the closed-form RMS of `−δ·cos z` for an uncompensated offset (also through the
ionosphere-free combination); `spread` gives the standard deviation of three seeded units;
`js-margin`'s stand-off range is where the margin is zero and ten times the range is 20 dB less J/S; the
command line runs each subcommand and rejects bad input. Unit tests: the free-space loss at 1 km at L1
and the ionosphere-free group-delay coefficients.
