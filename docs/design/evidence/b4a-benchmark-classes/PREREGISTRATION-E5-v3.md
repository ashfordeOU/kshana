<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B4a E5 v3 (0.42): CUSUM on the power-and-distortion score, on a recording Kshana has not read

**Status: APPROVED by the owner, 16 Nov 2026 (data download approved).** Written on 16 November 2026, before any
code for it and before any byte of the recording below was fetched or read by anyone working on Kshana. The bar is
E5 v2's, unchanged. After approval, bars and rules may be tightened, never loosened. **Read section 5 before the
download:** as registered, the bar cannot be assessed on this data, and that is stated now, before any data exists.

## Why a v3

E5 v2 (`PREREGISTRATION-E5-v2.md`) and E5-PD (`PREREGISTRATION-E5-PD.md`) have been scored on all ten TEXBAT
recordings (`RESULTS-E5-v2.md`: NOT MET, AUC 0.6941; `RESULTS-E5-PD.md`: MET, AUC 0.7410), and their per-recording AUCs
are published. A new method scored on the same ten recordings would be designed after seeing which attacks each
statistic separates, so it would not be blind. E5 v3 is therefore scored only on a recording that no Kshana code has
read. Both TEXBAT results stay published as they are.

## 1. The method (written down on 15 November 2026, fixed now)

Per recording, the E5-PD window score is passed through a one-sided CUSUM with reference `k = 0.5` and decision
`h = 5`, in units of the score's median absolute deviation over windows 0 to 59 (E5-PD's baseline windows). The
window score is the CUSUM statistic. Units, onset exclusion, the minimum-data rule and the AUC bar are E5 v2's.

Fixed precisely:

1. **Input score.** `s_w` is the E5-PD window score of window `w` (E5-PD points 2 to 4): `max(ΔP / τ_ΔP, maxₚ S/τ_S,
   maxₚ P/τ_P)`, with `τ_ΔP = 1.0 dB`, `ΔP` against the median in-band power of the recording's own windows 0 to 59,
   and E5 v2's synthetic thresholds `τ_S` and `τ_P` as committed (`src/bench/texbat.rs`, `THRESHOLDS`), unchanged. A
   window with no tracked PRN has `s_w = +∞`.
2. **Baseline.** `m` is the median of `s_0 … s_59` and `d` the median of `|s_w − m|` over the same 60 windows (no
   1.4826 factor). A median of an even count is the mean of the two middle values.
3. **CUSUM.** `z_w = (s_w − m) / d`; `C_59 = 0`; `C_w = max(0, C_{w−1} + z_w − k)` for `w ≥ 60`, with `k = 0.5`.
   The score of window `w ≥ 60` is `C_w`. Windows 0 to 59 are not scored (as in E5-PD).
4. **`h = 5`** is the alarm level (`C_w > 5`). It does not enter the AUC, which uses only the ranking. The first
   alarm window of each recording is reported without a bar.
5. **Edge cases.** If `d = 0`, or any of `s_0 … s_59` is `+∞`, the recording cannot be normalised: all its windows
   are excluded and the reason is reported. If `s_w = +∞` for some `w ≥ 60`, then `C_w = +∞` for that window and
   every later window of the recording (a cumulative sum). `+∞` ranks above every finite score; ties count half.

## 2. Data

* **Tuni2025 Datasets for GNSS, GPS Spoofing, "Selected Scenarios"**, Syed Muneeb Ur Rahman, Tampere University,
  Zenodo, licence **CC BY 4.0**. The approved download is **record 17249727** (DOI 10.5281/zenodo.17249727; concept
  record 15572975), which holds one recording:
  - `SS-33 GPS Delayed Spoofer Injection (All PRNs Spoofed).bin`, stored locally as `SS-33.bin`;
  - **39 999 912 000 bytes, MD5 `2320ab15af06dd66bfe459094e24381e`** (Zenodo's published checksum, read from the
    Zenodo API on 16 November 2026).
* **Pinning.** Size and MD5 are pinned now. The SHA-256 is computed on the owner's computer at the first fetch and
  written into `bench/manifests/b-iq.json` with the window-score file. The command refuses a file whose size or MD5
  differs, and writes nothing.
* **Handling.** The recording is processed only on the owner's computer. It is never committed or redistributed,
  and no IQ sample leaves that computer. Only per-window scores and the score file (section 6) are committed, with
  attribution to the dataset's author under CC BY 4.0.

## 3. Readings for this recording (fixed now, from the published documentation only)

E5v3-1. **Class.** `SS-33.bin` is a `spoofing` recording. The record holds no `nominal` recording.

E5v3-2. **Onset and end (truth).** The recording's README (shipped in the record) states that the spoofers are
switched on about 70 s after the start of the recording, stay on for about 80 s, and are removed after about 150 s.
Both times are approximate, so a 10 s guard is applied on each side:
- counted `spoofing` windows: **`80 ≤ w ≤ 139`**;
- windows 60 to 79 and windows 140 and later are excluded, neither class. Pre-onset exclusion is E5 v2's rule.
  Post-removal exclusion is new: TEXBAT's spoofers were never removed, so E5 v2 needed no such rule.

E5v3-3. **Sample format.** The README states interleaved I/Q, "32-bit", 50 MSps. This is read as **4 bytes per
complex sample: int16 little-endian I, then int16 little-endian Q** (the USRP's 16-bit complex format), complex
baseband centred on GPS L1 (IF 0 Hz).
- **Why.** At 4 bytes per sample the file lasts 199.9996 s. At 8 bytes (float32 I and Q) it would last 99.9998 s,
  which contradicts the README's removal time of about 150 s. The FGI-GSRx parameter file published with the
  clean-sky record (17413258) also gives `sampleSize 32` as the size of I+Q together. That file is set up for a
  TEXBAT recording, so it is weak support only.
- **Format guard.** Before any window is scored, the command decodes the first millisecond in this format and runs
  E5 v2's acquisition (PRNs 1 to 32). Fewer than 4 acquired PRNs means the format or the centre frequency is wrong.
  The command then stops and writes nothing except the acquired-PRN count. The format is fixed by a written
  amendment, committed before any window score exists.

E5v3-4. **Rate.** Consecutive pairs of complex samples are averaged: `y[n] = (x[2n] + x[2n+1]) / 2`. This gives
25 MSps, and E5 v2's front end then runs unchanged:
- `iqif::FeatureStageConfig::texbat_like()`;
- acquisition once, on the first millisecond of the recording, then continuous tracking (E5v2-4 as amended);
- E5 v2's statistics `S` and `P` (E5v2-5) and its thresholds.

`ΔP` is computed on the averaged samples.

E5v3-5. **Windows.** Window `w` covers input samples `[w·50 000 000, (w + 1)·50 000 000)` (1 s), starting at the
file's first sample. A trailing partial window is dropped. At 4 bytes per sample the file holds windows 0 to 198.

## 4. Bar (unchanged)

| Id | Bar |
|---|---|
| E5 v3 | One-vs-rest AUC of `spoofing` over all counted windows (Mann-Whitney, ties half, `+∞` above every finite score) **≥ 0.70** |

**Minimum data (E5v2-9, unchanged).** Each class needs at least 2 recordings and 300 counted windows. A bar below the
minimum is recorded as **NOT ASSESSABLE (below the minimum by design)**, as E5 v1 was. That is not a pass, and nothing
is claimed. Also reported, without a bar:
- the recording-level AUC, where it is defined;
- the first CUSUM alarm window per recording;
- any alarm in windows 60 to 69, which is before the stated onset.

## 5. Assessability, stated before any data exists

The numbers below come from Zenodo's published file list and the README files alone.

* **Record 17249727 alone** gives 0 `nominal` recordings and 1 `spoofing` recording with at most 60 counted windows.
  Both classes fall below the minimum, and with no `nominal` window the AUC is not even defined. **E5 v3 on this
  record is NOT ASSESSABLE (below the minimum by design).**
* **No further download from this release changes that.** The release has 13 Zenodo versions of 9 scenarios:
  - **Clean.** The clean-sky recordings C-5 and C-7 (records 15572976, 15623692, 17249795 and 17413258) all have the
    same size (29 999 832 000 bytes) and the same MD5 (`a03dedd79ac4208f6d60b4c916484dba`). That is one distinct
    clean recording, with 89 counted windows (60 to 148).
  - **Spoofed.** SS-17, SS-18, SS-20, SS-27, SS-28 and SS-29 state no spoofing onset; their spoofers run from the
    start. Under E5 v2 they are excluded entirely ("if a recording's onset is not stated, it is excluded entirely"),
    and their windows 0 to 59 would carry the attack anyway.

  The most any download gives is therefore 1 `nominal` recording (89 windows) and 1 `spoofing` recording (60
  windows).
* **Consequence.** E5 v3 stays **NOT SCORED** against the bar until a public spoofing set exists with:
  - at least 2 clean and 2 spoofed recordings, each spoofed one with a stated onset;
  - at least 300 counted windows per class;
  - nothing in it read by Kshana code.

  Running the command on SS-33 still gives a descriptive record: the CUSUM trace, the first alarm, and any alarm
  before the onset. That record carries no bar. Whether that is worth a 40 GB download is the owner's call; the run
  pack is `MAC-RUN.md`.

## 6. The owner's command and the scorer (code to be written; committed before the first data file)

* `kshana bench e5v3-windows <file> --out <file>.e5v3.json`:
  1. streams the file once and checks its size and MD5 against the manifest, refusing a mismatch;
  2. applies the format guard (E5v3-3);
  3. writes, per window: the start second, `ΔP`, `S`, `P`, the tracked-PRN count, `s_w` and `C_w`;
  4. also writes the file's MD5 and SHA-256, and no IQ sample.
* `kshana bench e5v3-score <dir> --out <dir>/E5v3-SCORE.json` applies sections 3 and 4 to the window files and
  writes the counts, the AUC (or `null` where undefined) and the verdict: `MET`, `NOT MET` or `NOT ASSESSABLE`. It has
  no parameter.
* **The oracle.** `xval/bench-e/tuni2025/oracle_e5v3.py` uses the Python standard library only and shares no code
  with the engine. It recomputes `m`, `d`, `C_w`, the counts and the AUC from the window files, exactly, with
  fractions. Both the scorer and the oracle are committed before the first data file, and are tested on synthetic
  window files (`xval/bench-e/README.md`, process rule of 11 November 2026).
* **Hand-over.** The owner's window file and score file come back as one archive. The archive is checked against
  its SHA-256 and committed to `xval/bench-e/tuni2025/` without its contents being displayed in the working session.
* **Scored once.** The result goes in `RESULTS-E5-v3.md`, beside E5 v2's result.

## 7. What was seen first (disclosure)

On 16 November 2026, from a cloud container, the following were read:
- Zenodo's metadata for the whole release (all 13 versions: file names, sizes, MD5s, licences);
- three README files (records 17249727, 17413258 and 15623217);
- the FGI-GSRx parameter file of record 17413258.

No `.bin` byte was fetched or read. The README files carry a "confidential" page header although the record
publishes them under CC BY 4.0, so only facts are transcribed here. No code in this repository names the data set.
The 0.41 search for public spoofing data (`r5-1-spoofing-public-datasets/PREREGISTRATION.md`) lists Tampere
University's 2025 recordings as a candidate only; they were not fetched.

## 8. What it does not claim

It claims nothing about:
- a real receiver in the field;
- attacks outside the scored recording;
- any method of Kshana's that is not open.

A NOT ASSESSABLE or NOT MET is published as the result. The detector stays MODELLED.
