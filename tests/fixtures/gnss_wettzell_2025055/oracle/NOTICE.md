# oracle/ — outputs of third-party GNSS tools run on this directory's inputs

Used by `tests/ppp_parity_glab_rtklib.rs`. The files are the tools' outputs on the IGS inputs
next door. No part of either tool is included, and both were run as separate programs by
`xval/ppp-parity/run.sh`. `RUN.md` records each run's input SHA-256 values.

| Tool | Version | Licence | Source | Files |
|---|---|---|---|---|
| RTKLIB `rnx2rtkp` | v2.4.2-p13, commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 | BSD-2-Clause | https://github.com/tomojitakasu/RTKLIB | `rtklib_*.pos`, `rtklib_*.csv` |
| gLAB `gLAB_linux` (processing core) | 6.0.0, Linux archive `gLAB_6.0.0_Linux.tgz`, SHA-256 046ab9fd269eda066bb774fe74d24ca2d38d8b7d8e6d372d887364a3403921dd (equal to the published https://server.gage.upc.edu/gLAB/src/checksums.txt entry) | Apache-2.0 (core; GUI LGPL-3, not used) | https://gage.upc.edu/en/learning-materials/software-tools/glab-tool-suite | `glab_*.out`, `glab_*.csv` |
