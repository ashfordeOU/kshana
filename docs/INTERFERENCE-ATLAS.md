<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Interference atlas, station C/N0 layer and ground against airborne

`kshana interference-atlas` turns the daily products of `kshana interference-map`
([Interference map](INTERFERENCE-MAP.md)) into a versioned atlas of persistent interference areas, adds
a ground layer from station RINEX observations, and sets the two side by side.

**MODELLED.** The atlas summarises the map's own calls and adds no evidence beyond them; persistence is
not a cause, and a zone names none. The backlog's acceptance (reproducing the 31 zones of a published
study) needs those days of data, which are not in this repository; it has not been done.

```
kshana interference-atlas build <day.geojson>... [--previous <atlas.json>] [--out <atlas.json>]
kshana interference-atlas verify <atlas.json>
kshana interference-atlas cors <today.obs> --baseline <earlier.obs> [--adsb-day <day.geojson>] [--station <lat,lon>] [--out <layer.json>]
```

## The atlas (`build`, `verify`)

From daily products of one source and one grid: per cell, the days with a call (`degraded` or
`not_degraded`; `insufficient_sample` and withheld days are not calls), the days degraded, the
persistence (degraded over called days) with a Wilson 95 % interval, and the first and last degraded day.
Cells degraded on at least 3 days with a persistence of at least 0.5 (method
`kshana-interference-atlas/v1`) form **zones**: groups of such cells touching at an edge or a corner,
each with its cells, bounding box, the days any of its cells was degraded, and the first and last of
them.

The atlas lists every input file with its SHA-256 and carries a **version**: the SHA-256 of its own
canonical JSON without the version field. `verify` recomputes it and exits 1 when it does not match, so a
changed atlas is detected. `--previous` names the atlas this one supersedes (after verifying it) and
records its version, so versions form a chain and none is edited in place.

## The station C/N0 layer (`cors`)

Two RINEX observation files of the same station (an IGS, EPN or CORS station, or any receiver that
records C/N0): each GPS satellite's first band-1 C/N0 (`S1C`, `S1W`, ...) at an epoch is compared with
the same satellite one GPS ground-track repeat earlier (taken as 86 156 s, a sidereal day less about
eight seconds; the exact repeat differs slightly between satellites, Agnew and Larson, GPS Solutions
11, 2007, so a per-satellite repeat is a possible refinement), when the geometry and the multipath at the
station repeat. The match is the nearest epoch within half an observation interval. An
epoch is flagged when the median drop over at least four satellites is 6 dB or more; flagged epochs less
than 120 s apart are joined into intervals. Wideband interference lowers every satellite at once; one
satellite's drop is not counted. GPS only: other constellations do not repeat daily.

With `--adsb-day` the layer is set beside the day product's cell that contains the station (`--station`
or the observation header's approximate position): `both` (ground flagged and the cell degraded),
`ground_only`, `airborne_only`, `neither`, or `not_observed` (no call for the cell). A ground-only event
is what a low-power ground jammer gives; an airborne-only one is what reaches aircraft but not a station
shielded by terrain or distance. The comparison states which, and nothing more.

## Tests

`tests/interference_atlas.rs`: five synthetic days give one zone of three corner-connected cells with the
right days and persistence; the same inputs give the same version, a changed atlas fails `verify`, a
text round trip keeps it valid, and a chained version names its predecessor; mixed grids, non-products
and no input are refused; the bundled example day product reads; the station layer finds a 20-epoch
simultaneous 10 dB drop one repeat later and the comparison reads `both` and `not_observed`; the command
line builds, verifies and detects a change.
