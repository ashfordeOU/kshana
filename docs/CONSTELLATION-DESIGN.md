# Constellation design

The `constellation-design` kind builds one or more satellite constellations around the
Earth, the Moon, Mars or any other body in the solar-system catalogue (`src/body.rs`: every
planet, Pluto and the major moons, with the same constants the `solar-system` and `body-pnt`
kinds use) and maps their coverage and dilution of precision (DOP) over a
latitude/longitude grid. Source: `src/constellation.rs`.

## What goes in

- **Walker shells** in the `T/P/F` convention: `T` satellites in `P` equally spaced planes
  with phasing `F`. A *delta* pattern spreads the ascending nodes over 360 deg, a *star*
  pattern over 180 deg. Plane `k` sits at node `raan0 + k·ΔΩ` and satellite `j` of it at
  mean anomaly `m0 + j·360·P/T + k·360·F/T`.
- **Explicit element sets**: semi-major axis or altitude, eccentricity, inclination, right
  ascension of the ascending node (RAAN), argument of periapsis and mean anomaly.
- **Presets** from published nominal elements (Earth only):

| Preset | Satellites | Source |
|---|---|---|
| `gps-baseline` | 24 | Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5th edition, April 2020, Tables 3.2-1 and 3.2-3 |
| `gps-expandable` | 24 to 30 | SPS PS Table 3.2-2: each of the six expandable slots (B1, D2, F2, A2, C4, E3) named in `expanded` is replaced by its fore and aft pair; all six by default |
| `galileo` | 24 | Galileo Open Service Service Definition Document, issue 1.1: Walker 24/3/1, semi-major axis 29 599.801 km, 56 deg (Table 1), slots of Table 23 |
| `beidou`, `beidou-meo` | 30, 24 | BeiDou Open Service Performance Standard 3.0 (2021), section 4.1: medium Earth orbit (MEO) Walker 24/3/1 at 21 528 km and 55 deg, plus three geostationary (GEO) satellites at 80, 110.5 and 140 deg E and three inclined geosynchronous (IGSO) satellites at 55 deg |
| `glonass` | 24 | GLONASS Interface Control Document (ICD), edition 5.1 (2008), section 5.2: slot formula, 19 100 km, 64.8 deg |

The GPS table's RAAN is inertial at its epoch; the preset converts it to an Earth-fixed node
longitude with the Greenwich hour angle the table states (100.765 deg). GLONASS states
absolute (Greenwich) node longitudes directly. The Galileo document states no hour angle, so
its RAAN is used as the node longitude. The BeiDou standard does not state the MEO phase or
the IGSO nodes; the preset starts the MEO pattern at node 0 and mean anomaly 0 and puts the
three IGSOs on one ground track crossing the equator at 118 deg E. Those two choices are
modelled.

Several constellations can share one run. With `clock = "per-constellation"` (the default)
the receiver estimates one clock per system in view, as a multi-GNSS (global navigation
satellite system) receiver does; `clock = "common"` shares one clock.

## What comes out

Per grid cell: mean, fewest and most satellites above the mask; the share of epochs with a
fix and with position DOP (PDOP) at or below `pdop_threshold`; mean geometric, position,
horizontal and vertical DOP (GDOP, PDOP, HDOP, VDOP); largest PDOP. Globally, weighted by
the cosine of latitude so each cell counts by its area: availability, worst-site
availability, and the mean, median, 90th, 95th and 99th percentile and maximum of each DOP.
Per satellite: a downsampled ground track (`track_points` samples, at most `max_tracks`
satellites). The chart is two maps, availability and mean PDOP.

## How it scales

A satellite at radius `r` is above an elevation mask `ε` exactly when its central angle from
the user is at most `λ = arccos((R/r)·cos ε) − ε`, so the visibility test is one dot product
against `cos λ`. Each epoch the satellites are also sorted by sub-satellite latitude, and a
grid row at latitude `φ` only tests the satellites within `λ_max` of `φ`. Both are exact on a
spherical body, and a unit test holds every map to a brute-force scan with the direct
elevation test. The `work` block reports the pair tests a brute-force scan would make and
the ones made. A 5 000-satellite design on a 10 deg grid (648 points, 6 epochs) runs in
about 0.13 s in a debug build on an Apple-silicon laptop; the prefilter keeps about 10 % of
the pair tests. The engine uses no threads, clock or filesystem, so it runs unchanged as
WebAssembly.

## What is checked, and against what

VALIDATED, against published documents:

- the Walker generator reproduces all 24 rows of Galileo OS SDD Table 23, and the GLONASS
  ICD slot formula is the same set of 24 slots as a Walker 24/3/1;
- the GPS preset reproduces the groundtrack equatorial crossing column of SPS PS Tables
  3.2-1 and 3.2-2: 35 of 36 locations within 0.0108 deg against a 0.015 deg rounding bar.
  E3F is off by 0.050 deg and is held to 0.06 deg, because the table's own E3F row is
  inconsistent with its RAAN and argument of latitude by that much;
- the GPS baseline under the SPS PS Appendix B conditions (one sidereal day, 287 steps of
  five minutes, a 4 deg grid, all in view, 5 deg mask) gives a global HDOP median of 0.940,
  90 % 1.165, 95 % 1.255, 98 % 1.370 and mean 0.965, against the published 0.94, 1.16,
  1.25, 1.37 and 0.96 (bar 0.03, fixed before the first run). PDOP median 1.795 is below the
  1.815 of Table B.3-1, which describes a degraded 20-24 satellite mix. PDOP of 6 or less
  holds 100 % of the time, against 98 % global and 88 % worst site in Table 3.8-1.

Checked against a hand derivation, not an external document: a single-epoch DOP matches the
closed form for a zenith satellite and three at 30 deg elevation (PDOP 8/3, GDOP 3.0732).

MODELLED: two-body orbits with an optional secular J2 drift; a spherical body; geometric
visibility only (no signal power, satellite health or terrain); no third-body perturbation,
which a real lunar frozen orbit depends on. The worst single time-space point depends on the
grid: HDOP 2.40 and VDOP 5.22 here against 2.49 and 5.43 published; these are reported, not
pinned. The four presets come from different reference epochs, so their relative phase in
one run is not a snapshot of any date.

## Bundled scenarios

- `scenarios/constellation-multi-gnss-coverage.toml`: GPS, Galileo, BeiDou and GLONASS
  (102 satellites) over one day above a 10 deg mask, one clock per system.
- `scenarios/leo-pnt-mega-shell.toml`: 5 000 satellites in four low-Earth-orbit shells for
  positioning, navigation and timing (PNT), with J2.
- `scenarios/lunar-relay-constellation.toml`: 8 satellites in elliptical lunar frozen orbits
  and a 6-satellite circular shell around the Moon.
