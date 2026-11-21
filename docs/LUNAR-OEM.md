<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Lunar ephemeris exchange: OEM frame conversion

`kshana lunar-oem` converts a Moon-centred CCSDS Orbit Ephemeris Message (OEM) between the inertial
ICRF and the DE440 lunar body frames, positions and velocities both. It is the exchange direction of
the lunar OEM support: `lunar_interop` (the `lunar-interop` scenario kind, [INTEROP](INTEROP.md)) writes lunar-frame OEMs from Kshana's own
states. This command takes an OEM from another tool and writes the same trajectory in the frame the
receiving tool expects.

```
kshana lunar-oem convert <in.oem> --to ICRF|MOON_PA440|MOON_ME [--out <file>]
kshana lunar-oem frames
```

The command writes the converted OEM to `--out`, or to standard output. Exit status 2 means a usage or
input error.

**MODELLED.** The output is no more accurate than the input and the orientation series. The DE440
series embedded in Kshana was checked against SPICE to 1.7e-6 rad (`src/lunar_orientation.rs`).

## Frame names

CCSDS 502.0-B-3 (Orbit Data Messages) takes `REF_FRAME` values from the SANA registry "Celestial
Body Reference Frames" (sanaregistry.org/r/celestial_body_reference_frames, read 21 November 2026).
The registry lists:

* `ICRF`: the latest ICRFn, inertial;
* `MOON_ME`: the Moon mean-Earth rotating frame, "defined as a constant rotation from the Principal
  Axes frame associated with a particular instantiation of the JPL DE";
* `MOON_PAxxx`: the Moon principal-axis rotating frame, which "depends on the source JPL DE file".

| Written | Meaning here |
|---|---|
| `ICRF` | inertial |
| `MOON_PA440` | DE440 principal axes, from the embedded DE440 orientation series (2014 to 2030). The registry gives the pattern `MOON_PAxxx`. Reading `xxx` as the DE number without a separator is our interpretation, **to confirm** |
| `MOON_ME` | realised as NAIF's `MOON_ME_DE440_ME421`: DE440 PA with the constant offset of the NAIF frame kernel `moon_de440_220930.tf` (`TKFRAME_31009`: 67.8526″, 78.6944″, 0.2785″ about axes 3, 2, 1). The registry leaves the DE instance open, so each segment's `COMMENT` lines state it |

Also read on input:

* `MOON_PA_DE440` and `MOON_ME_DE440_ME421`, the NAIF names.
* `MOON_PA` with no DE number. It is read as DE440 PA, and a `COMMENT` says so. Kshana's own
  `lunar_interop` export wrote this token before 21 November 2026; it now writes `MOON_PA440`, `TDB`
  by default, and the unregistered `LTC` / `TCL` only on explicit request with a `COMMENT` (see
  below).

Refused:

* `EME2000` and `J2000`. They differ from ICRF by the frame bias (about 23 mas, about 0.2 m at
  low lunar orbit radius), which is not applied here.
* Any `CENTER_NAME` other than `MOON`.

## Time

The lunar orientation needs TDB. Accepted `TIME_SYSTEM` values are `TDB`, `TT`, `TAI`, `GPS` and `UTC`;
UTC is converted with Kshana's leap-second table. Other values are refused, including lunar time
scales: the SANA "Time Systems" registry lists none. Epochs keep their original labels.

## Velocity

`v_to = R_to · v_icrf + dR_to/dt · r_icrf`, with `dR/dt` taken by a central difference over ±60 s
(one-sided at the ends of the orientation series). The DE440 series is interpolated at a constant rate
within each day, so the difference matches that interpolation exactly within a day. A point fixed on
the lunar surface, written in ICRF, comes out at rest in `MOON_PA440` to better than 1 mm/s
(`tests/lunar_oem.rs`).

## The lunar interop export

`lunar_interop` (the `lunar-interop-export` scenario kind) writes the same registered names:

* `REF_FRAME` is `MOON_ME` or `MOON_PA440`, and a `COMMENT` states the realisation.
* `TIME_SYSTEM` is `TDB` by default, or `UTC`.
* `LTC` and `TCL` are written only with `allow_unregistered_time_system = true`, and a `COMMENT`
  says the value is not SANA-registered.

Its sample states are rotated from Moon-centred inertial axes into the named body frame with the
orientation used here. A test converts the written file back to ICRF through this module and gets
the inertial states back.

Two independent readers decode the default export: `oem` 0.4.5 and Orekit 12.2
(`tests/lunar_interop_oem_oracle.rs`). Orekit still refuses `LTC`.

## Not carried

* Covariance blocks. The OEM reader skips them, and the output says so.
* `USEABLE_*` and `INTERPOLATION*` keywords and input comments. The reader does not keep them.

## Tests

`tests/lunar_oem.rs` checks:

* round trips through each frame;
* a surface point at rest in the body frame, with the lunar spin speed (4.62 m/s at the equator) in
  ICRF;
* the ME–PA angle equal to the NAIF offset (103.9″);
* DE440 PA within 15″ of the analytic PA;
* the time-system offsets;
* a whole file through text and back to ICRF within the OEM's printed precision;
* refusals (Earth-centred input, EME2000, a lunar time scale, epochs outside the series);
* reading `MOON_PA` with its note;
* the command line.
