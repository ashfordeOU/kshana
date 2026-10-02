# NOTICE: M125 services oracle fixture

Used by `tests/leo_navmsg_services_gnsstk_oracle.rs`. Generated 2026-10-02.

- `klobuchar.tsv`, `az.tsv`, `utc_drift.tsv`: values computed by GNSSTk (Applied Research
  Laboratories, University of Texas at Austin; https://github.com/SGL-UT/gnsstk, commit
  55ea33448ed76b3ec0dae3f28aea70e3574c26ca, library version 15.3.1, LGPL-3.0) through
  `gnsstk_services_harness.cpp` in this directory, built against a local GNSSTk install and run as
  a separate program. Only numbers GNSSTk printed are committed; no GNSSTk code is.
- Inputs taken from the IGS merged broadcast navigation file
  `BRDC00IGS_R_20242550000_01D_MN.rnx.gz` (BKG IGS data centre,
  https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2024/255/, SHA-256 of the compressed file
  03a03a0d3a5ada1c281b866501d7d4b69533a651236600206835e1990a61c9c3): header lines GPSA, GPSB, GAL,
  GPUT and LEAP SECONDS (public broadcast data).
- `utc_leap.tsv`: values computed by ERFA through pyerfa 2.0.1.5 (BSD-3-Clause) with
  `generate_utc_leap_erfa.py` in this directory.

SHA-256:

```
8fe38d8893afbdba801b5f2ad4f1dd8c4eaa4ada0e012db27ab80fc09116ea40  klobuchar.tsv
604c8da3fa200cf48353b487c1c882326984215b0d8ac5c9dc0e9165baff931f  az.tsv
f438cc950ad53506788a61e8803862720a267ca64b7944cdb3c872b1bafe0554  utc_drift.tsv
b4e75e9494b2073147e23ca4a7677891ea84d8e75c6f5f1874bd0cbcd7b0b884  utc_leap.tsv
```
