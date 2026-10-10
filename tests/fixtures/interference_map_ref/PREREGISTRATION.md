# Interference map: external validation, pre-registered tolerances

Written and committed BEFORE the oracle script was run and before any comparison of Kshana
output with an oracle. The tolerances below are copied into `tests/interference_map_reference.rs`
and `scripts/gen_interference_map_ref.py`; they are not loosened after a result is seen. If a
check fails the numbers are reported, not tuned.

Scope, stated narrowly. These checks validate **decoding semantics and geometry**: how Kshana
reads the accuracy and integrity codes, how it treats AIS field values, where it puts a position
on its grid, how long a route is and how much of it lies in each cell state, and whether a
position is inland of a coastline. They do **not** validate that a cell flagged degraded or
anomalous is interference. Inputs are synthetic; no real tracks are used.

Kshana does not decode raw Mode S frames or AIVDM sentences: its readers take already-decoded
fields. The oracles decode synthetic raw frames; Kshana's interpretation of the decoded values
is what is compared.

| # | Target | Oracle (pinned) | Comparison | Pre-registered tolerance |
|---|---|---|---|---|
| a1 | NACp code to EPU bound (codes 0 to 11) | pyModeS 2.21, `adsb.nac_p` on synthetic DF17 operational-status frames | `nacp_epu_bound_m(code)` vs oracle EPU; `None` equals oracle "not available" | 0.5 m absolute (the oracle rounds to whole metres) |
| a2 | NACp low / good classification | same | `classify(None, Some(code))`: low iff oracle EPU is unavailable or at least 555 m; good iff oracle EPU is available and at most 93.5 m | 0 disagreements |
| a3 | NIC code to containment radius, codes 5 to 11 | pyModeS 2.21, `adsb.nic_v1` and `adsb.nic_v2` on synthetic DF17 airborne-position frames, every typecode and every supplement-bit combination the oracle accepts | oracle Rc lies within `nic_rc_bound_range_m(nic)` | 1.0 m absolute on each end of the range |
| a4 | NIC low / good classification, codes 0 to 11 | same | `classify(Some(nic), None)`: low iff oracle Rc is unavailable or at least 1851 m; good iff oracle Rc is available and at most 371 m | 0 disagreements |
| b1 | AIS position not-available values | pyais 3.3.0 decoding synthetic AIVDM type 1 sentences whose payload bits are packed by the script from the raw field values of ITU-R M.1371 (not through pyais's encoder) | `ais_position_is_valid(lat, lon)` on the decoded values: false for decoded latitude 91 or longitude 181, true for decoded in-range values, excluding exactly (0, 0) | 0 disagreements |
| b2 | AIS speed not-available value and range | same | `ais_speed_kn(decoded)`: `None` for decoded 102.3, `Some` equal to the decoded value for 0 to 102.2 | 0 disagreements; value equality to 1e-9 |
| c | Grid cell assignment | shapely 2.2.0 `covers` on cell polygons (boxes), for grids of 0.5, 0.25, 1.0 and 0.07 degrees | `Grid::cell_of(lat, lon)` is the cell whose polygon covers the point: exactly equal for points at least 1e-9 degrees from every cell edge; a member of the covering set for points on an edge, the pole, or the antimeridian | 0 disagreements |
| d1 | Route length | GeographicLib 2.1 WGS84 geodesic, summed over shapely-cut pieces | `route_km` | 0.6% of the oracle length (the largest difference between a sphere of radius 6371.0088 km and the WGS84 ellipsoid is 0.57%) |
| d2 | Route length per cell state (degraded, not degraded, unassessed, not observed) | shapely 2.2.0 intersection of the route with cell polygons, lengths by GeographicLib | per-state length from `share_* x route_km` | 0.6% of the oracle total length plus 125 m per oracle piece (a piece is a route leg inside one cell; Kshana assigns 250 m pieces by midpoint, so each cell boundary can misassign at most 125 m) |
| e | Land masking with a 2000 m inland buffer | shapely 2.2.0 `contains`; pyproj 3.8.0 azimuthal-equidistant distance from the query point to the polygon boundary (densified at 1 km) | `LandMask::is_inland` at 0.005-degree lattice centres equals `contains and distance >= 2000 m` | 0 disagreements over points whose oracle distance to the 2000 m threshold is at least 20 m (1% of the buffer); points inside that band are excluded, and their number is recorded in the fixture |

Oracle versions: pyModeS 2.21 (GPL-3.0, used in an offline script only; nothing of it is
distributed), pyais 3.3.0, shapely 2.2.0, GeographicLib 2.1, pyproj 3.8.0, numpy 2.5.3.

Known limits of the oracle, recorded before comparison: pyModeS 2.21's containment radius for
NIC 1, 2 and 4 (37000, 14008 and 3702 m) differs from the DO-260B values (20 NM, 8 NM and 2 NM:
37040, 14816 and 3704 m), so the numeric NIC comparison (a3) covers codes 5 to 11 only; codes 1 to
4 are covered by the classification check (a4), which only needs them to be above 1 NM.

What is not validated: the (0, 0) rule, which is Kshana's own and is excluded from b1; the
altitude floor and source-type filter, which act on readsb fields no oracle here decodes;
the hash, the thresholds and the statistics of the method; and anything about whether a
flagged cell is interference.

## Clarification recorded before the first comparison run

Written after the oracle fixtures were generated but before any Kshana output was compared with
them. Checks a3 and a4 read "oracle Rc unavailable" as the oracle's statement that NIC 0 has no
containment bound. The oracle also returns an unavailable Rc for a NIC above 0 when the supplement
bits given have no row in its table (for example NIC 9 with supplement 0); such an entry is not a
statement about containment, carries no bound, and is excluded. The fixture records how many were
excluded (`nic_combinations_without_a_table_row`). No tolerance changes.

## Fixture defects found by the first comparison run (tolerances unchanged)

The first run of `tests/interference_map_reference.rs` failed two checks. Both were defects in
the synthetic inputs written by the script, not differences between Kshana and an oracle, and
both were fixed in the script; no tolerance was changed.

1. Route exposure, case "high latitude zonal": the route lay exactly on a cell edge (60.0 N), so
   shapely assigned each piece to both neighbouring cells and the oracle length came out doubled
   (2232 km for 1112 km of route). A route along an edge has no defined cell. The route now runs
   along 60.25 N, inside a row.
2. Land masking: the script wrote polygon rings to GeoJSON without repeating the first vertex
   (shapely closes a ring itself, a GeoJSON file must). Kshana read the open ring as written and
   missed the closing edge, so 7 of 996 points that a ray crossed that edge were misclassified.
   The script now writes closed rings. Separately, Kshana's land reader now closes an open ring
   itself, so a file with that fault is read as shapely reads it.
