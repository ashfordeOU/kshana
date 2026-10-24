# Mission-thread lunar oracle fixtures

Public data only. Used by `tests/mission_thread_lunar_oracles.rs` and recorded in
`xval/mission-thread-lunar/RESULTS.md`. Advisory software, not certified navigation equipment.

## `a1_lro_horizons.json`, `a2_capstone_horizons.json`

- **Source:** NASA/JPL Horizons system API, `https://ssd.jpl.nasa.gov/api/horizons.api`, queried 2026-10-24 by
  `xval/mission-thread-lunar/fetch_data.sh` with the requests fixed in Amendment 2 of
  `xval/mission-thread-lunar/PREREGISTRATION.md`: spacecraft LRO (`-85`, 2009-031A) and CAPSTONE (`-1176`,
  2022-070A), centre `500@301` (Moon), ICRF, kilometres and seconds, state vectors, TDB; LRO from 2025-01-01
  00:00 to 2025-01-02 00:00 UTC at 10 minutes (145 states), CAPSTONE from 2023-01-01 00:00 to 2023-03-31 00:00
  UTC at one hour (2137 states; Amendment 6 corrects the count Amendment 2 gave).
- **Stored as returned**, the JSON response of the API, unaltered.
- **SHA-256:** `a1_lro_horizons.json` `c52d682fd17eaff5b25d4bf392f910daebbfe90784be1c7ed3ca3db6dd97919e`;
  `a2_capstone_horizons.json` `b62bd475d593505a936749526a96cadec14077e66c02d2fc58f3c9d0b418edde`.
- **Terms:** JPL Horizons output is a U.S. Government work product made available for public use; the JPL data
  citation is NASA/JPL Solar System Dynamics, Horizons On-Line Ephemeris System.

## `jggrx_0660b_sha_to150.tab`

- **Product:** GL0660B, the JPL GRAIL primary-mission lunar gravity field to degree/order 660 (Konopliv et al.,
  JGR Planets 118, 2013), PDS data set `GRAIL-L-LGRS-5-RDR-V1.0`, product `JGGRX_0660B_SHA.TAB`.
- **Source:** NASA PDS Geosciences Node,
  `https://pds-geosciences.wustl.edu/grail/grail-l-lgrs-5-rdr-v1/grail_1001/shadr/jggrx_0660b_sha.tab`.
- **SHA-256 of the original file (26 692 624 bytes):**
  `500e47e0ae2fa32d30615ea4af9ed6cca3a60e05c332d918692596a425708534` (the value recorded in
  `xval/planetary-gravity-pyshtools/fetch_data.sh`, checked by `fetch_data.sh` before the run).
- **SHA-256 of this crop:** `5fd5fffa91288f33fb1c917eaddca9fa28bcb05d0e096998dd7c3a577130cb5b`.
- **Crop transform:** `tests/fixtures/planetary_gravity/crop_shadr.py <in> 150 <out>`, the transform of
  `tests/fixtures/planetary_gravity/NOTICE.md`: the header record kept except its degree and order columns,
  every coefficient record of degree n <= 150 kept verbatim, higher degrees dropped, no value altered.
- **Terms:** as `tests/fixtures/planetary_gravity/NOTICE.md` (PDS data are public; JPL data-use policy for PDS).
