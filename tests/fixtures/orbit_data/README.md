# Fixtures for `tests/orbit_data.rs`

| File | Source |
|---|---|
| `cdm_508_b1_example_3_6_2.cdm` | CCSDS 508.0-B-1 (June 2013, Cor. 2 October 2021), section 3.6.2: the CDM in KVN with only obligatory keywords. Transcribed from the public PDF (<https://public.ccsds.org/Pubs/508x0b1e2c2.pdf>); U+2212 minus signs written as ASCII `-`; units spacing normalised to `value   [units]`. |
| `cdm_508_b1_example_3_6_3.cdm` | The same standard, section 3.6.3: the CDM in KVN with optional keywords, as printed, including its `TRACKS USED` keyword and `hh:mm:ss:fff` screening times. |
| `cdm_508_b1_example_4_4.xml` | The same standard, section 4.4: the CDM in XML, as printed (page headers removed). |
| `gen_selfmade_tles.py` | Writes the three `.tle` files below. |
| `gp_source_a.tle`, `gp_source_b.tle` | SELF-MADE two-line element sets: two "sources" for placeholder objects 90001 to 90005, with planted differences (none, 0.5 degrees of mean anomaly, 0.01 degrees of RAAN) and one object in each source only. No real object or catalogue data. |
| `gp_audit.tle` | SELF-MADE: placeholder objects 90010 to 90014 with planted defects (a manoeuvre-sized jump with a falling element set number, a bad checksum, a perigee below the surface, a stale epoch) and one consistent pair built with the SGP4 secular rates. |
| `cov_leo.json` | SELF-MADE: a low-Earth-orbit state and an uncorrelated covariance for the `cov` commands. |

The OEM and OCM fixtures the tests also use are older: `tests/fixtures/ccsds/oem_502_b3_figG11.oem` (CCSDS 502.0-B-3
Figure G-11), `tests/fixtures/ccsds_cov/kshana_cov_leo.oem`, `tests/fixtures/ccsds_oem_interop/*.oem` and
`tests/fixtures/odm_orekit_oracle/kshana/C0*.{kvn,xml}` (see their own notes).
