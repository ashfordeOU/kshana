# Guide: scoring an interference classifier on kshana-bench task (e)

For: someone with a method that says *which kind* of GNSS interference a receiver is seeing (nominal, jamming,
spoofing or meaconing), who wants a score on a fixed public task that others can reproduce. By the end you have:

1. the task's truth file for a split, made from the public JammerTest 2024 dataset on your own machine;
2. a predictions file in the format the scorer reads;
3. a `kshana-bench-result/1` file with the confusion matrix and every metric, checked by `kshana bench validate`.

> **Advisory software.** A score describes a method on a log, never a product. Kshana is not type-approved
> navigation equipment.

The task is defined in `bench/SPEC.md` (task (e), spec `kshana-bench/2.1.0`) and pre-registered in
`docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION.md`. Step 1 and the scoring steps 3 and 4 are run as
written by `tests/guide_benchmark_classes.rs` on every change. That run uses the small synthetic files of the
scorer's exactness check, because the 375 MB dataset is not fetched in CI. Step 2 is the same command on the real
data.

## 1. What the task is

<!-- guide-run -->
```sh
kshana bench spec
```

The `e` line is the task. Each **unit** is one second of one evaluable folder of the dataset, with id
`<folder>#<n>`. Its **truth** is one of `nominal`, `jamming`, `spoofing`, `meaconing`:
- Inside a scheduled attack window, the class comes from the folder's `attack_type`. Folders that mix spoofing and
  jamming are labelled `spoofing`, and the truth file counts them.
- Outside every window, the unit is `nominal`.
- Epochs within 60 s of a window edge are not units.

## 2. Make the truth file (on your machine)

Fetch the dataset from Zenodo record 15911589 (GPL-3.0-or-later). Check its SHA-256 and extract it outside any
repository:

```sh
curl -L -o jt.tar.gz https://zenodo.org/api/records/15911589/files/GNSS_DATASET_JAMMING_SPOOFING.tar.gz/content
sha256sum jt.tar.gz   # 73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313
mkdir jt && tar xzf jt.tar.gz -C jt
kshana bench truth --task e --split dev --data jt --out e-dev.truth.json
```

- **Splits.** Use `dev` to develop. `test` is the split results are reported on, and `holdout` is used once per
  method.
- **Same bytes everywhere.** The truth files are byte-identical on Linux, macOS and Windows. Their SHA-256 values
  are in `xval/bench-e/truth.sha256`, so you can check yours.
- **The holdout is not secret.** Anyone with the dataset has its folders, as `bench/SPEC.md` §4 says. Say whether
  your method ever saw them.

## 3. Write your predictions

A predictions file gives, for every unit id in the truth file:
- a label;
- four class scores, of which only the ranking within each class is used.

```json
{
  "schema": "kshana-bench-predictions/1",
  "task": "e",
  "split": "test",
  "system": {"name": "my-classifier", "version": "1.0"},
  "labels": {"<folder>#0": "nominal", "...": "..."},
  "class_scores": {"<folder>#0": {"nominal": 0.9, "jamming": 0.05, "spoofing": 0.03, "meaconing": 0.02}}
}
```

Here the synthetic example files stand in for a real truth file and your method's output:

<!-- guide-run -->
```sh
mkdir -p scored
gzip -dc bench_e/e1_truth.json.gz > scored/truth.json
gzip -dc bench_e/e1_predictions.json.gz > scored/predictions.json
```

## 4. Score and check

<!-- guide-run -->
```sh
kshana bench score --truth scored/truth.json --predictions scored/predictions.json --out scored/result.result.json
kshana bench validate scored/result.result.json
```

The result's `metrics` hold:
- **`confusion`:** rows are the true class, columns your label, in the order nominal, jamming, spoofing, meaconing.
- **Per class:** `recall` and `precision`, and one-vs-rest `auc`.
- **`balanced_accuracy` and `macro_f1`:** taken only over the classes in `entered`.
- **The `_descriptive` versions:** over every class present.
- **The interference-type confusion shares.**
- **`event_confusion`:** the majority label of each attack window.

On the example files, `entered` is `nominal`, `spoofing` and `meaconing`:
- jamming has a single folder, below the two-folder minimum;
- meaconing enters only because the example truth states 25 events, at or above the 20-event minimum.

## 5. Reading a score honestly

- **Minimum data.** A class counts in balanced accuracy and macro-F1 only with at least 2 folders, 300 units and,
  for meaconing, 20 events in the split.
  - On the real `test` split only `nominal` and `spoofing` meet it. Each split has one jamming folder, and the
    dataset has 7 meaconing windows in all.
  - Say so next to any number.
- **What the truth is.** It is scheduled one-minute slots, so labels near a slot edge can be wrong.
- **The baseline to beat.** The open-core baseline is the receiver-trust monitors mapped to classes by a fixed rule
  (`docs/design/evidence/b4a-benchmark-classes/RESULTS.md`).
  - On `test` it labels every spoofing epoch as jamming, because the AGC alarms on those strong transmissions.
  - Its balanced accuracy is 0.259.
  - A method that separates power-like spoofing from jamming improves on that; one that does not, does not.
- **What a score does not show.** It is the behaviour of one receiver type at one event. It is not evidence about a
  low-power spoofer or another site.
