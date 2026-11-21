# lunar_interop_oem_oracle: provenance

`two_reader_output.txt` is what two independent CCSDS OEM readers print for the Kshana-written files
in `../lunar_interoperability_export/` (input SHA-256 values are in its header):

- `oem` 0.4.5 (MIT), PyPI `oem==0.4.5`, https://pypi.org/project/oem/;
- Orekit 12.2 (Apache-2.0), https://www.orekit.org, Maven Central `org.orekit:orekit:12.2`, through
  `OrekitOemReader.java` (this directory), with the orekit-data `main` archive of
  `$KSHANA_ORACLES/orekit/` (the oracle toolchain directory).

Both are run as tools; neither is linked into the crate. Regenerate with
`generate_lunar_interop_oem_oracle.py` (header of that file). Generated 2026-10-01; regenerated
2026-11-21 for the export with SANA-registered names (`MOON_ME` / `MOON_PA440`, `TDB`, and one file
with the opt-in `LTC`), with `oem` 0.4.5 from PyPI, Orekit 12.2 and Hipparchus 3.1 from Maven Central
and the orekit-data `main` archive downloaded that day from gitlab.orekit.org. The Orekit driver now
prints epoch offsets measured in the file's own `TIME_SYSTEM` (to the nanosecond) rather than in TAI.
