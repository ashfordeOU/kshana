# Provenance

* `kshana/`: written by Kshana (`src/odm.rs`) from the synthetic, deterministic cases built in
  `tests/odm_orekit_oracle.rs`.
* `legacy/M04.kvn`: the existing `OmmFile::to_omm_kvn` output of the M04 element set.
* `orekit/`: written by Orekit 13.1.8 (Apache-2.0) through `xval/odm-orekit/OdmOracle.java`,
  from the messages Orekit parsed out of `kshana/`.
* `outputs/orekit_reads_kshana.txt`, `outputs/orekit_reads_legacy.txt`: what Orekit 13.1.8
  parsed from `kshana/` and `legacy/`, dumped by the same driver.

Orekit is used only as a separately run oracle; none of its code is in Kshana. The NDM/XML
schemas used by the data-gated schema leg are fetched at test time by
`xval/ndm-xsd/validate.sh` (SHA-256 pinned there) and are not stored here.
