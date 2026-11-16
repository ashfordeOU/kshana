<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# E5 v3 run pack for the owner's Mac (B4a, Tuni2025 SS-33)

This pack runs `PREREGISTRATION-E5-v3.md` once, on the owner's Mac. It was written on 16 November 2026, when the
owner approved the pre-registration and the download.
- **Data:** Tuni2025 Datasets for GNSS, GPS Spoofing (Syed Muneeb Ur Rahman, Tampere University), Zenodo record
  17249727, CC BY 4.0. One file, `SS-33 GPS Delayed Spoofer Injection (All PRNs Spoofed).bin`: 39 999 912 000 bytes,
  MD5 `2320ab15af06dd66bfe459094e24381e`, as published by Zenodo.
- **What stays on the Mac:** the recording, and anything derived from it sample by sample.
- **What leaves:** one archive, holding the window-score file and the score file, plus the tail of the run log.

All the steps are in one script, `scripts/e5v3_mac_run.sh`.

## Read first: the expected outcome

Section 5 of the pre-registration states, before any data exists, that **E5 v3 is NOT ASSESSABLE on this record**:
- it holds one spoofing recording and no clean one;
- E5 v2's minimum-data rule needs 2 recordings and 300 counted windows per class.

No other download from the same release changes this. Its four clean-sky versions are the same bytes, and its other
spoofing scenarios state no onset.

The run still produces a descriptive record, with no bar:
- the CUSUM trace;
- the first alarm;
- any alarm before the stated onset.

Step 0 below checks the facts behind this from Zenodo's metadata, without downloading anything. Running the
remaining steps is the owner's decision.

## Before you start: what must already be true (check by hand)

1. **The code is merged.** Neither existed on 16 November 2026; the script refuses to run until both do.
   - The engine commands `kshana bench e5v3-windows` and `kshana bench e5v3-score` are merged (section 6).
   - The oracle `xval/bench-e/tuni2025/oracle_e5v3.py` is committed. It must be committed before the first data
     file, per the process rule in `xval/bench-e/README.md`.
2. **`bench/manifests/b-iq.json` pins the size and MD5 above.**
3. **The branch to run is `main`,** after the pre-registration and the code are both merged. If the team names
   another branch, use it in place of `main` in step 1.

## Prerequisites

- macOS, with the Xcode command-line tools (`xcode-select --install`): `git`, `curl`, `python3`, `shasum`, `md5`, `tar`.
- **rustup** (https://rustup.rs). The repository's `rust-toolchain.toml` pins `1.93.0`, with `rustfmt` and `clippy`.
  The script installs that toolchain and refuses any other.
- **Disk: 50 GB free.** That covers:
  - the recording, 40 GB;
  - the repository, about 1.5 GB;
  - the release build, 4 to 8 GB.

  The data step refuses to start a download with less than 45 GB free.

## Time and disk estimate

| Step | Time (Apple silicon) | Disk |
|---|---|---|
| 0. Clone, metadata check | 2 to 5 min | about 1.5 GB |
| 1. Check | under 1 min (first toolchain install: 2 to 5 min) | about 1 GB toolchain |
| 2. Download 40 GB, then MD5 and SHA-256 | 15 min to 1.5 h for the download (network-bound: 1 Gbit/s about 6 min, 100 Mbit/s about 55 min), plus about 5 min hashing | 40 GB |
| 3. Build (`kshana`, release) | 5 to 15 min | 4 to 8 GB |
| 4. Score once | unverified: 20 to 90 min (one 40 GB pass, acquisition once, tracking every acquired PRN for 200 s) | a few MB |
| **Total** | **about 1 to 3.5 hours, mostly download and scoring** | **50 GB free** |

## Commands (copy and paste into Terminal; zsh or bash)

### 0. Clone, and check the facts behind section 5 (no download)

```bash
mkdir -p ~/kshana-e5v3
git clone https://github.com/ashfordeOU/kshana.git ~/kshana-e5v3/kshana
cd ~/kshana-e5v3/kshana && git fetch origin && git checkout --detach origin/main
bash scripts/e5v3_mac_run.sh metadata
```

Expected output:
- 13 versions;
- `same bytes in records [15572976, 15623692, 17249795, 17413258]` (the clean-sky recordings);
- `distinct recordings: 8`.

If the output differs, stop and tell the team.

### 1. Check the checkout

```bash
cd ~/kshana-e5v3/kshana && bash scripts/e5v3_mac_run.sh check
```

The check confirms that toolchain 1.93.0 is active. It stops, with a plain reason, if any of these hold:
- the code, the oracle or the manifest pin is missing;
- the pre-registration is not marked approved;
- E5 v3 has already been scored.

### 2. Download and verify the recording

```bash
cd ~/kshana-e5v3/kshana && bash scripts/e5v3_mac_run.sh data
```

- **What it does.** It compares Zenodo's live listing with the pinned name, size and MD5. It then downloads to
  `~/kshana-e5v3/data/SS-33.bin` and checks the size and MD5. A mismatched file is deleted.
- **What it records.** It computes the SHA-256 and writes `~/kshana-e5v3/data/SS-33.verified`.
- **If the download breaks,** run the same command again: it resumes.
- **If you already have the file,** put it at `~/kshana-e5v3/data/SS-33.bin` first. It is used only if its size and
  MD5 match.

### 3. Build

```bash
cd ~/kshana-e5v3/kshana && bash scripts/e5v3_mac_run.sh build
```

### 4. Score once

```bash
cd ~/kshana-e5v3/kshana && bash scripts/e5v3_mac_run.sh score
```

It runs `kshana bench e5v3-windows` and then `kshana bench e5v3-score`, and packs both outputs into
`~/kshana-e5v3/out/e5v3-results.tgz`.

**Format guard.** If the engine stops at the format guard (fewer than 4 PRNs acquired in the first millisecond), no
score exists yet. Send the log tail. The format is then fixed by a written amendment before anything is re-run.

A second run is refused: the score marker `~/kshana-e5v3/out/.scored` blocks it, and so does a committed
`E5v3-SCORE.json`.

### 5. What to send back

```bash
cd ~/kshana-e5v3/kshana && bash scripts/e5v3_mac_run.sh send
tail -n 60 ~/kshana-e5v3/out/e5v3_stdout.log
```

Send **only** these two things:
- `~/kshana-e5v3/out/e5v3-results.tgz`;
- that log tail. It ends with the run summary: the repository head, the toolchain, the recording's MD5 and SHA-256,
  and the archive's SHA-256.

Nothing under `~/kshana-e5v3/data/` leaves the Mac.

### Afterwards (optional)

`rm ~/kshana-e5v3/data/SS-33.bin` frees 40 GB. Keep `~/kshana-e5v3/out/`.

## What happens with the results

- **Checks.** The archive is checked against the SHA-256 in the log tail. The recording's SHA-256 is pinned in
  `bench/manifests/b-iq.json`.
- **Commit.** The two files are committed to `xval/bench-e/tuni2025/` without their contents being displayed in the
  working session.
- **Oracle.** The oracle recomputes the score.
- **Result.** `RESULTS-E5-v3.md` records it beside E5 v2's: MET, NOT MET or NOT ASSESSABLE.
- **TEXBAT and JammerTest data** play no part in this run and are never redistributed.
