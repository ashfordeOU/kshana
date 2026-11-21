# Arctic GNSS availability planner

`kshana arctic-plan` steps the `kshana sky` geometry ([SKYLINE.md](SKYLINE.md)) over a planning
horizon at a high-latitude site and reduces it to the figures a field team plans around: how many
satellites are in view, the dilution of precision, how high they climb, how empty the poleward sky
is, the windows in which a stated requirement holds, and whether the site sits inside the auroral
oval. Source: `src/arctic_plan.rs`. Output: JSON (`kshana.arctic-plan/1`).

```
kshana arctic-plan --place longyearbyen --compare --hours 24 --max-pdop 3 --task-min 60 --kp 5
kshana arctic-plan --site 82.5,-62.35 --systems gps-baseline,glonass --mask 15 --epochs
kshana arctic-plan --site 78.2,15.6 --tle gnss.tle --epoch 2026-12-01T00:00:00 --hours 12
kshana arctic-plan --places
```

## Why the Arctic is different

A constellation of inclination `i` on a circular orbit of radius `a` has its ground track up to
latitude `i`. From latitude `φ > i` every satellite stays at least `γ = φ − i` from the zenith, and
none rises above `el_max = atan((cos γ − R/a)/sin γ)`. For GPS (55 degrees) at the North Pole that
is about 45 degrees; GLONASS (64.8 degrees) climbs higher. The sky near the zenith stays empty,
the satellites sit at low and middle elevations (many seen across the pole), the vertical dilution
of precision grows, and a raised mask for terrain, ridges or ice costs more than at mid latitude.
The report gives `el_max` for each GNSS preset requested (`elevation_bounds`) and the share of
visible satellites in the poleward quarter of the sky, as measured rather than assumed: at
Longyearbyen it is close to an even quarter, because satellites are seen across the pole.

## What each epoch is

One `sky_geometry` request per epoch, with the same presets, skyline (`--skyline-preset`), mask
and clock model as `kshana sky`; the planner adds nothing to the geometry. The tests check that
each epoch's satellite count and PDOP equal a direct `kshana sky` request at Tromsø, Longyearbyen
and Alert. Preset constellations are a representative geometry, not the sky of a date at that
place; with `--tle` and `--epoch` the element sets give the sky of that date.

## The plan

* `availability_pct`: epochs with at least `--min-sats` (5) in view and PDOP at most `--max-pdop`
  (6);
* `windows`: the stretches where the requirement holds throughout; `task_windows` the ones at least
  `--task-min` long; `longest_gap_min` the longest stretch where it does not;
* PDOP median and 95th percentile, VDOP and HDOP medians, the highest elevation reached, mean
  satellites in view and the fewest;
* `--compare` repeats the plan for each system alone, so the gain of combining is in one report.

## Ionosphere

With `--kp` the site's dipole latitude is compared with the equatorward edge of the auroral oval
(the constants of `src/env_baseline.rs`: 67 degrees at Kp 0, 2 degrees lower per Kp unit). Inside
the oval the plan is run again with `--iono-mask` (20 degrees by default) in place of the mask, a
stated planning stand-in for losing the low-elevation rays that cross the most disturbed
ionosphere, and `availability_in_oval_pct` is reported beside the quiet figure. Scintillation is
not modelled; the flag and the raised mask are planning assumptions, not a measured loss.

## Places

`--places` lists the named sites (Tromsø, Murmansk, Utqiaġvik, Resolute, Longyearbyen,
Ny-Ålesund, Alert, the North Pole): approximate town or station coordinates, not a survey.

MODELLED throughout.
