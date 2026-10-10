# Interference map: synthetic sample outputs

One ADS-B day file and one AIS day file, produced by the CLI from made-up inputs, for
building and testing a map viewer against the v1 format
(`docs/INTERFERENCE-MAP.md`). **Nothing here is real data.** Positions are in the open
mid-Atlantic, identifiers are labels like `SYN-A-003`, the "island" is a rectangle, and the
files say so in their `data.attribution`. They show nothing about any real place.

| File | What it shows |
|---|---|
| `output/adsb-custom-2026-03-01.geojson` | 11 published cells: one `degraded`, several `not_degraded`, and `insufficient_sample` cells. One further cell (3 aircraft) is below the publication minimum and is absent: a "not observed" cell |
| `output/ais-custom-2026-03-01.geojson` | 7 published cells: `anomalous` by the circle detector, `anomalous` by the on-land detector, `not_anomalous` cells, and one cell where the implausible-speed count (2 vessels) is withheld (`null`). One further cell (3 vessels) is absent |

Output files are named `<source>-<dataset>-<YYYY-MM-DD>.geojson`: `<source>` is `adsb` or
`ais`, `<dataset>` is the `--dataset` key (here `custom`) and the date is the UTC day of the
reports. Counts below 5 are `null` (withheld), zero included.

Regenerate (from the repository root, with a built binary):

```
examples/interference-map/regenerate.sh [path/to/kshana]
```

`input/` holds the synthetic inputs (made by `generate_inputs.py`, which uses no random
numbers). `tests/interference_map_examples.rs` fails if `output/` differs from what the
command produces, apart from the `kshana_version` field.
