# Interference map: synthetic sample outputs

One ADS-B day file and one AIS day file, produced by the CLI from made-up inputs, for
building and testing a map viewer against the v1 format
(`docs/INTERFERENCE-MAP.md`). **Nothing here is real data.** Positions are in the open
mid-Atlantic, identifiers are labels like `SYN-A-003`, the "island" is a rectangle, and the
files say so in their `data.attribution`. They show nothing about any real place.

| File | What it shows |
|---|---|
| `output/adsb-2026-03-01.geojson` | 11 published cells: one `degraded`, several `not_degraded`, and `insufficient_sample` cells. One further cell (3 aircraft) is below the publication minimum and is absent: a "not observed" cell |
| `output/ais-2026-03-01.geojson` | 7 published cells: `anomalous` by the circle detector, `anomalous` by the on-land detector, `not_anomalous` cells, and one cell where the implausible-speed count is withheld (`null`). One further cell (3 vessels) is absent |

Output files are named `<source>-<YYYY-MM-DD>.geojson`, where `<source>` is `adsb` or
`ais` and the date is the UTC day of the reports.

Regenerate (from the repository root, with a built binary):

```
examples/interference-map/regenerate.sh [path/to/kshana]
```

`input/` holds the synthetic inputs (made by `generate_inputs.py`, which uses no random
numbers). `tests/interference_map_examples.rs` fails if `output/` differs from what the
command produces, apart from the `kshana_version` field.
