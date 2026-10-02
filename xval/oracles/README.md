# Kshana oracle toolchain

The independent tools and public datasets the Kshana verification matrix is checked against.
The scripts are kept here, in `xval/oracles/`; the tools and datasets they fetch are installed
outside the checkout, in `~/Code/kshana-oracles`. Nothing they download is vendored into the
repository; a row that needs data commits a small slice with its own `NOTICE.md`.

```sh
mkdir -p ~/Code/kshana-oracles && cp -r xval/oracles/. ~/Code/kshana-oracles/
bash ~/Code/kshana-oracles/setup.sh --kshana "$PWD"
```

## Recreate everything

```sh
~/Code/kshana-oracles/setup.sh                 # full: toolchain + datasets + xval builds
~/Code/kshana-oracles/setup.sh --no-data       # toolchain and xval builds only
~/Code/kshana-oracles/setup.sh --kshana <worktree>   # build xval/ from another checkout
source ~/Code/kshana-oracles/env.sh            # before running any fixture generator
```

`setup.sh` needs only the files beside it (`sources.tsv`, `requirements.in`, `requirements.lock`,
`tools/manifest.py`), `curl`, `git`, `uv` (or a `python3.12`), a JDK 17 or newer, a C compiler and
cargo. It is idempotent: a re-run fills gaps and never overwrites a complete download. It runs every
build and install under `nice -n 15` with `CARGO_BUILD_JOBS=3`. It exits non-zero if any step
failed and lists the failures; a per-run log goes to `logs/`. It was run end to end from an empty
directory on 2026-09-30 (see "Proof run" below).

## What it builds

| Component | Version | Licence | Used by | Where |
|---|---|---|---|---|
| Java runtime | checked, 17 or newer (found Temurin 21.0.5) | GPL-2.0 with Classpath Exception | Orekit drivers | system |
| Orekit | 12.2 (Maven Central, SHA-1 verified) | Apache-2.0 | OD, propagation, passes, launch, CW, OEM rows | `orekit/jars/` |
| Hipparchus core, geometry, ode, fitting, optim, filtering, stat | 3.1 (SHA-1 verified) | Apache-2.0 | Orekit | `orekit/jars/` |
| orekit-data | `main` branch archive (hashed in the log) | public data (IERS, JPL, etc.) | Orekit | `orekit/orekit-data-main/` |
| `orekit/cp.sh` | exports `OREKIT_CP`, `OREKIT_DATA` | | fixture drivers | |
| RTKLIB | v2.4.2-p13, commit 71db0ff; `rnx2rtkp` built | BSD-2-Clause | eph2pos, lambda, SPP rows | `RTKLIB/` |
| NaveGo | v1.4 (run under GNU Octave 11.1) | LGPL-3.0 | INS rows | `NaveGo/` |
| xval ANISE crates | anise 0.10, built from a copy of the worktree's `xval/` | MPL-2.0 | frames, lunar OD, Mars light time, service geometry | `build/xval-src/`, `build/xval-target/` |
| Python | 3.12.12, virtual environment | PSF | every Python generator | `.venv/` |

The committed `xval/*/Cargo.lock` files pin kshana 0.22.0, so a `--locked` build fails and an
unlocked build would rewrite files in the worktree. `setup.sh` therefore builds a copy under
`build/xval-src/xval/<crate>` (with `tests/` symlinked so the crates' `include_str!` paths resolve)
and leaves the worktree untouched. Refreshing those lock files is a small repository fix for later.

Run-only tools added for 0.30 (founder decision 5, 2026-10-01; never part of a release gate):

| Tool | Version | Licence | Oracle for |
|---|---|---|---|
| GMAT (General Mission Analysis Tool), `tools/gmat/GMAT/R2026a/bin/GmatConsole` | R2026a | Apache-2.0 | B-plane targeting and gravity assist (M060) |
| GNSS-SDR (`gnss-sdr`, system package) | 0.0.19 | GPL-3.0 (tool only) | software-receiver acquisition and tracking (M068) |

Python packages (exact pins in `requirements.lock`; the full resolved set in
`requirements.frozen.txt`):

| Package | Version | Licence | Oracle for |
|---|---|---|---|
| numpy | 2.3.5 | BSD-3-Clause | P2 linear algebra |
| scipy | 1.18.1 | BSD-3-Clause | statistics, Welch PSD, expm, P2 |
| allantools | 2024.6 | LGPL-3.0 (tool only) | frequency stability |
| gnss_lib_py | 1.0.4 | MIT | DOP (needs Python below 3.13) |
| skyfield | 1.54 | MIT | EO footprint |
| sgp4 | 2.26 | MIT | EO footprint |
| spiceypy | 8.2.0 | MIT | NAIF kernels (lunar PA, body constants) |
| pymsis | 0.12.0 | MIT | thermosphere |
| sigmf (sigmf-python) | 1.13.0 | LGPL-3.0 (tool only) | SigMF input and output |
| filterpy | 1.4.5 | MIT | clock and INS filters |
| scikit-learn | 1.9.1 | BSD-3-Clause | ROC/AUC |
| lamberthub | 1.0.0 | Apache-2.0 (wheel metadata; the matrix row says MIT, worth correcting) | Lambert |
| pymcdm | 1.4.0 | MIT | MCDA |
| oem | 0.4.5 | MIT | CCSDS OEM |
| ppigrf | 2.1.0 | MIT | IGRF-14 |
| astropy | 8.0.1 | BSD-3-Clause | IERS finals reader |
| pyerfa | 2.0.1.5 | BSD-3-Clause | frames |
| jplephem | 2.24 | MIT | SPK reading |
| h5py | 3.16.0 | BSD-3-Clause | MagNav flight files |
| pandas | 2.3.3 | BSD-3-Clause | tables |
| openpyxl | 3.1.5 | MIT | NAVCEN pattern workbooks |
| georinex | 1.16.1 | MIT (upstream; not in the wheel metadata) | RINEX reading |
| jsonschema | 4.26.0 | MIT | SigMF schema validation |
| spacepackets | 0.32.0 | Apache-2.0 | CCSDS space packets |
| bsk (Basilisk) | 2.9.1 | ISC | attitude rows (resolving it pins numpy to 2.3.5) |

Not installed, on purpose (see `~/Code/kshana-site-next/research/VALIDATION-0.30-PLAN.md`,
"Known blockers"): GMAT (heavy headless build), GNSS-SDR (builds from source; install when no
release gate is running), NeQuick G JRC (needs a GSC registration), gLAB (CC BY-NC-ND 4.0, a
licence decision first), gnsstk, TEXBAT (tens of GB).

## Datasets

`data/MANIFEST.md` is the grouped summary and `data/MANIFEST.tsv` has one row per file with URL,
licence, SHA-256, size, retrieval date and the plan rows it serves. Sources are listed in
`sources.tsv` (fixed URLs) and generated by `setup.sh` for the dated series (IERS Bulletin A weekly
issues 2023-2026, BIPM Circular T 405 onward, BIPM per-laboratory UTC-UTC(k) files). Files whose
upstream copy changes in place (`finals2000A.all`, the C04 series, the Earth high-precision PCK,
the UTC(k) files) are marked `mutable_upstream=1`: the first copy fetched is kept, dated, and never
overwritten, so a fixture slice cut from it stays reproducible.

`data/realdata/` holds the records the repository's own `scripts/fetch_*.sh` produce (5071A caesium
phase, OCXO, PHASE.DAT, 14 days of IGS final clocks). BKG keeps only recent IGS weeks, so an
existing `~/Code/kshana/realdata-cache` is copied rather than re-fetched.

`kernels/` holds symlinks to the NAIF files under the names `scripts/gen_de440_moon_pa.py` expects.
`env.sh` exports `KSHANA_ANISE_*` for the xval crates, `RTKLIB`, `NAVEGO`, `ORACLE_PY` and the
Orekit variables. The committed fixture generators still name `/tmp/kshana-oracles`; `setup.sh`
recreates `/tmp/kshana-oracles` as a symlink to this directory on every run, so they work
unchanged (nothing is stored in `/tmp`).

## Proof run

On 2026-09-30 the four source files and `tools/manifest.py` were copied into an empty directory
(`~/Code/kshana-oracles-proof`) and `setup.sh` was run once with no arguments. It finished with
`setup complete, no failures` (exit 0): Java checked, Orekit and Hipparchus fetched and SHA-1
verified, the Orekit smoke program ran, the Python environment resolved and every import passed,
RTKLIB and `rnx2rtkp` built, NaveGo checked out, 417 dataset files fetched (1.1 GB, none missing),
and all four xval ANISE crates built with their tests compiled. Every one of the 417 files had the
same SHA-256 as the copy in this directory. The proof directory was then deleted.

Sizes on disk after setup: `.venv` 1.4 GB, `NaveGo` 1.8 GB (its repository carries example
datasets), `data` 1.1 GB, `build` 0.6 GB, `RTKLIB` 135 MB, `orekit` 67 MB.

Known gaps, recorded rather than hidden: the TU Delft thermosphere archive
(thermosphere.tudelft.nl) did not answer on 2026-09-30; GRACE-FO and Sentinel orbits need an
account; several papers and standards need a browser download. The plan lists each with the row
it holds.
