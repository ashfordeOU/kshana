# lunar_interop_oem_oracle: provenance

`two_reader_output.txt` is what two independent CCSDS OEM readers print for the Kshana-written files
in `../lunar_interoperability_export/` (input SHA-256 values are in its header):

- `oem` 0.4.5 (MIT), PyPI `oem==0.4.5`, https://pypi.org/project/oem/;
- Orekit 12.2 (Apache-2.0), https://www.orekit.org, Maven Central `org.orekit:orekit:12.2`, through
  `OrekitOemReader.java` (this directory), with the orekit-data `main` archive of
  `$KSHANA_ORACLES/orekit/` (the oracle toolchain directory).

Both are run as tools; neither is linked into the crate. Regenerate with
`generate_lunar_interop_oem_oracle.py` (header of that file). Generated 2026-10-01.
