# Draft verification row: interference map decoding semantics and geometry

For the coordinator and W1b to apply to `src/verification.rs`. Not edited here.

```
VerificationItem {
    requirement: "Interference map: accuracy-code meanings, AIS not-available values, grid cell assignment, route length per cell state, and inland masking",
    capability: "The reading of the ADS-B navigation accuracy and integrity codes the map uses (the EPU bound a NACp code stands for, the containment-radius bound a NIC code stands for, and the low and good classes the method derives from them); the AIS position and speed not-available values the AIS reader discards; the fixed latitude/longitude grid cell a position falls in; the route length, and its split by cell state (degraded, not degraded, unassessed, not observed), that route exposure reports; and whether a position lies inland of a land polygon by more than a buffer. A cell flagged degraded or anomalous is a statement about reported accuracy fields or implausible positions, not a finding of interference, and nothing here checks that.",
    module: "interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)",
    tests: "tests/interference_map_reference.rs::{adsb_accuracy_and_integrity_codes_agree_with_pymodes (12 NACp codes, 59 NIC rows), ais_field_rules_agree_with_pyais_decoding (94 frames), grid_cell_assignment_agrees_with_shapely (1770 points, four cell sizes), route_exposure_geometry_agrees_with_shapely_and_geographiclib (8 routes, 420 pieces, 11634 km), land_masking_agrees_with_shapely_and_pyproj (996 points)}; interference_map unit tests",
    oracle: "WHAT IS EXTERNALLY CHECKED, stated narrowly: five independent implementations read the same synthetic inputs. (1) pyModeS 2.21 decodes synthetic DF17 operational-status and airborne-position frames; Kshana's NACp EPU bounds agree to 0.5 m (largest difference 0.4 m), its NIC containment bounds for codes 5 to 11 agree to 1 m, and its low and good classes put all 12 NACp codes and every NIC code the oracle produces (0 to 11) on the same side of the thresholds the oracle's bounds imply (0 disagreements). (2) pyais 3.3.0 decodes AIVDM type 1 sentences whose payload bits the script packs from the raw ITU-R M.1371 field values; Kshana refuses exactly the decoded not-available positions (latitude 91, longitude 181) and speed (102.3 kn), and keeps 0 to 102.2 kn as decoded (0 disagreements over 94 frames). (3) shapely 2.2.0 covers() on cell polygons agrees with Grid::cell_of for 1770 points over cell sizes 0.5, 0.25, 1 and 0.07 degrees, including near-edge points, both poles and the antimeridian (0 disagreements). (4) shapely 2.2.0 route/cell intersection with GeographicLib 2.1 WGS84 geodesic lengths agrees with route exposure on 8 synthetic routes, including two that cross the antimeridian: total length to 0.6% (largest difference 0.49%, the sphere against the ellipsoid) and each cell state's length to 0.6% plus 125 m per piece (largest 21% of that tolerance). (5) shapely 2.2.0 contains() with pyproj azimuthal-equidistant distance to the coastline agrees with the 2000 m inland mask on 992 lattice-centre points around four synthetic islands, one with a lake (0 disagreements; 4 points within 20 m of the buffer were excluded and counted). The tolerances were fixed in tests/fixtures/interference_map_ref/PREREGISTRATION.md before any comparison, and not changed after; two defects in the synthetic inputs found by the first run are recorded there. WHAT IS NOT: Kshana does not decode raw Mode S frames or AIVDM sentences, so this validates its reading of already-decoded values, not a decoder. The oracle's NIC containment radii for codes 1, 2 and 4 differ from DO-260B (20, 8 and 2 NM), so only codes 5 to 11 are compared numerically. The (0, 0) position rule, the altitude floor, the source-type filter, the identifier hashing, the thresholds and statistics of the method, and the cell size choice are Kshana's own and are not checked against anything. The route comparison uses the same straight-in-latitude-and-longitude path definition on both sides, so it checks lengths and cell assignment, not that this path is the right one for a vessel or aircraft. Nothing here shows that a flagged cell is interference. Inputs are synthetic; the oracle fixtures are written by scripts/gen_interference_map_ref.py (pyModeS is GPL-3.0 and is used in that offline script only; CI needs no Python).",
    oracle_kind: ExternalDataset,
    status: Validated,
},
```

Oracle basis declaration:

```
OracleBasisEntry {
    requirement: "Interference map: accuracy-code meanings, AIS not-available values, grid cell assignment, route length per cell state, and inland masking",
    basis: Library,
    oracle_test: "tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib",
    source: "pyModeS, pyais, shapely, GeographicLib, pyproj",
    flag: "",
},
```
