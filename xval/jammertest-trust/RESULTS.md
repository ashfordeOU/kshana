# Results: receiver-trust thresholds calibrated on the JammerTest 2024 dataset (CAP-13)

The pre-registration is `PREREGISTRATION.md` in this directory, committed alone in 0fa012b before the
harness ran. This is its first and only run, 2026-10-13, with the harness of
`src/receiver_trust/calibration.rs` as handed over (reviewed against the pre-registration before the
run, not changed after it):

```text
cargo run --release --example jammertest_trust_calibration -- <extracted-root> report.json --ubx
```

Data: `GNSS_DATASET_JAMMING_SPOOFING.tar.gz` fetched from Zenodo record 15911589 on 2026-10-13, MD5
`c7b00c63bb1ee5db80c7692a2b06e169` and SHA-256
`73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313`, both as registered; 24 scenario
folders; extracted outside the repository and not vendored. The recorded figures are pinned by
`tests/receiver_trust_jammertest_calibration.rs` (ignored, data-gated by `KSHANA_JAMMERTEST_DIR`).

## Folders

14 of 24 evaluable. Excluded by the registered rule (calibration window less than the 60 s guard before,
or inside, an attack window): 4 jamming folders (1.11.7, custom 1, custom 2, 1.11.8), 5 spoofing
folders and 1 meaconing folder. No folder failed in `run_monitors`.

| class | evaluable folders | clean epochs | jamming epochs | spoofing/meaconing epochs |
|---|---|---|---|---|
| jamming (incl. spoofing + jamming) | 7 | 1,976 | 9,560 | 0 |
| spoofing / meaconing | 7 | 1,526 | 0 | 8,168 |
| all | 14 | 3,502 | 9,560 | 8,168 |

Minimum data (at least 3 jamming folders, 1,000 clean epochs): **holds**.

## Per monitor (pooled over the 14 folders)

| monitor | 0.35 default | Pfa / Pd at default | AUC | selected (alpha 0.01) | Pfa / Pd at selected, in-sample | leave-one-folder-out held-out Pfa / Pd |
|---|---|---|---|---|---|---|
| `cn0_drop_db` | 6 dB | 0.0000 / 0.063 | 0.778 | **1.5 dB** | 0.00057 / 0.560 | **0.0231 (81/3502)** / 0.560 (5352/9560) |
| `agc_k_sigma` | 5 | 0.00029 / 0.781 | 0.933 | **3.5** | 0.00029 / 0.787 | **0.0003 (1/3502)** / 0.787 (7527/9560) |
| `jam_ind_threshold` | 80 | 0.0000 / 0.000 | 0.678 | **29** | 0.0100 / 0.155 | **0.0094 (33/3502)** / 0.154 (1468/9560) |
| union of the three | | 0.00029 / 0.782 | | | 0.0109 / 0.807 | **0.0328 (115/3502)** / **0.807 (7713/9560)** |

The C/N0 monitor's in-sample false-alarm rate at 1.5 dB is 2 of 3,502, but leaving one folder out
moves its selected threshold low enough in some folds that the held-out false alarms reach 81.

Per rover state, at the default / at the selected threshold (clean alarmed of clean, jamming alarmed of
jamming): `cn0_drop_db` dynamic 0/2233, 490/6617 / 2/2233, 3278/6617; stationary 0/1269, 117/2943 /
0/1269, 2074/2943. `agc_k_sigma` dynamic 1/2233, 4876/6617 / 1/2233, 4915/6617; stationary 0/1269,
2592/2943 / 0/1269, 2612/2943. `jam_ind_threshold` dynamic 0/2233, 0/6617 / 23/2233, 686/6617;
stationary 0/1269, 0/2943 / 12/1269, 798/2943.

Spoofing and meaconing epochs (reported only, not used for selection or bars), alarmed of 8,168: at the
defaults C/N0 5144, AGC 8026, jamming indicator 0, union 8027; at the selected thresholds C/N0 6990, AGC
8026, jamming indicator 1539, union 8089. These attacks were radiated at high power and are seen as
interference by the measurement-domain monitors; that says nothing about detecting a low-power spoofer.

## Bars

| bar | measured | verdict |
|---|---|---|
| B1 `cn0_drop_db`: held-out clean Pfa <= 0.02 | 0.0231 (81/3502) | **fail** |
| B1 `agc_k_sigma`: held-out clean Pfa <= 0.02 | 0.0003 (1/3502) | pass |
| B1 `jam_ind_threshold`: held-out clean Pfa <= 0.02 | 0.0094 (33/3502) | pass |
| B2 union: held-out clean Pfa <= 0.05 and jamming Pd >= 0.50 | Pfa 0.0328, Pd 0.807 | pass |

**Ledger decision, as registered: MODELLED** (B1 failed for `cn0_drop_db`). The profile still ships,
opt-in, as registered: `[monitors] profile = "jammertest-2024-calibrated"` sets `cn0_drop_db = 1.5`,
`agc_k_sigma = 3.5`, `jam_ind_threshold = 29`
(`kshana::receiver_trust::monitors::JAMMERTEST_2024_CALIBRATED`). The default rule, the 0.35 score and its
corpora are unchanged.

## Reader cross-check (descriptive, no bar)

The six evaluable folders that carry a `.ubx`, through `receiver_trust::ingest::read_ubx` instead of the
CSV files; union of the three monitors, clean-epoch Pfa / jamming-epoch Pd (clean epochs, jamming epochs):

| folder | CSV default | UBX default | CSV calibrated | UBX calibrated |
|---|---|---|---|---|
| Jamming dynamic 1.10.4 | 0.00 / 0.912 (8, 1827) | **0.56** / 0.944 (25, 1808) | 0.00 / 0.969 | **0.60** / 0.993 |
| Jamming dynamic 1.10.6 | 0.00 / 0.394 (214, 2598) | 0.00 / 0.397 (232, 2580) | 0.00 / 0.398 | 0.013 / 0.404 |
| Jamming stationary 1.6.4 | 0.00 / 0.515 (305, 721) | 0.00 / 0.574 (305, 720) | 0.00 / 0.685 | 0.00 / 0.775 |
| Jamming + spoofing dynamic 2.6.2 | 0.00 / 1.000 (245, 1111) | 0.00 / 1.000 (244, 1111) | 0.00 / 1.000 | 0.00 / 1.000 |
| Meaconing dynamic 3.1.3, 3.1.4 | 0.00 / – (653, 0) | 0.00 / – (655, 0) | 0.00 / – | **0.50** / – |
| Spoofing stationary 2.1.1 | 0.00 / – (44, 0) | 0.00 / – (57, 0) | 0.023 / – | 0.018 / – |

The two readers mostly agree on detection, but on two folders the UBX timeline raises false alarms the
CSV timeline does not (0.56 at the defaults on a folder with 25 clean UBX epochs; 0.50 at the calibrated
thresholds on a meaconing folder). The calibration was made on the CSV timeline; the profile's false-alarm
figures do not carry over to UBX logs without a check of this difference, which is left open.

## What the claim is

Narrow: these three thresholds on this receiver type (u-blox ZED-F9P), at this event, against the
scheduled attack slots at one-minute resolution (a lower bound on the true detection probability; a clean
epoch means "outside this dataset's logged windows"). Maritime trust-score bands are not calibrated here.
