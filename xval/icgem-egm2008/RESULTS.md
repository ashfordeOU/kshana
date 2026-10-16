# Results: real gravity reference field (WP-10, RM-17)

Both parts were run once against `PREREGISTRATION.md` (committed alone in e10d281b, before
any ICGEM grid was fetched and before the real-field scenario was first run). Nothing in the
pre-registration was changed after the run.

## Part A: anomaly synthesis against ICGEM: MET

Grids were fetched on 2026-10-13 with `tools/fetch_icgem_grid.sh`. The GDF headers confirm
the request: `modelname egm2008`, `max_used_degree 70`, `tide_system tide_free`,
`functional gravity_anomaly_sa`, `zero_degree_term included`, `refsysname WGS84`,
`height_over_ell 0.0000 m`, `gridstep 0.25`. The values carry 12 decimals, far finer than
the bars. The SHA-256 of each body is pinned in `tests/icgem_gravity_anomaly_oracle.rs`:
Chad `aabd15b4...`, Death Valley `f4227534...`. The grids are not vendored because the
service output carries no explicit licence.

| region | nodes | RMS (Kshana - ICGEM) | max abs | worst node | bars | outcome |
|---|---|---|---|---|---|---|
| C, Chad 9..15 N, 19..25 E | 625 | 1.26e-8 mGal | 2.39e-8 mGal | 9 N, 20.75 E | 0.005 / 0.02 | MET |
| D, Death Valley 35..38 N, 242..245 E | 169 | 2.57e-8 mGal | 2.94e-8 mGal | 35 N, 245 E | 0.005 / 0.02 | MET |

For scale, ICGEM reports a signal weighted RMS of 8.77 mGal over region C (min -14.55,
max 21.20). Attribution: values computed with the ICGEM Calculation Service, GFZ Potsdam
(Ince et al., 2019, doi:10.5194/essd-11-647-2019), model EGM2008 (Pavlis et al., 2012).

## Part B: 60-minute benchmark on the real field: B1 NOT MET, B2 MET

`scenarios/gps-denied-gravity-nav-egm2008.toml`, first run:

| quantity | value |
|---|---|
| free-inertial drift | 70 607 m |
| matched error | 3 105.5 m |
| reference anomaly over the sampling box | mean 0.70 mGal, std 9.78 mGal |
| matching sigma | 2.000 mGal |

| bar | threshold | value | outcome |
|---|---|---|---|
| B1 matched error < 500 m | 500 m | 3 105.5 m | NOT MET |
| B2 matched error < drift / 10 | 7 060.7 m | 3 105.5 m | MET |

The outcome falls where the prediction put it. Degree 70 resolves nothing shorter than about
285 km, so the drift is only weakly observable. The tenfold cut holds, but the 500 m target
that the synthetic-mascon benchmark meets (144 m) does not. A high-degree model loaded
through `reference.model = "gfc"` is the route to the shorter wavelengths. That would be a
new pre-registration, not a re-run of this one.

`tests/gravity_map_real_field.rs` pins the recorded side of both bars. The B1 miss is
asserted, not ignored. Ledger status: Modelled. The field is real and checked externally,
but the navigation outcome has no external oracle.
