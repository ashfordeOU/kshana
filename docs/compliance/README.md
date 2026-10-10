<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Compliance mapping

Buyers and receiver makers answer to public resilience frameworks. This folder maps what
Kshana computes and records to those frameworks, row by row, and `kshana compliance-report`
fills the mapping from the runs you actually have.

**Wording.** Kshana outputs *support evidence for* a requirement. They are not a rating
or approval of any product, and none of these files is a statement from an assessment
body; Kshana is not one. Requirement text is paraphrased, never reproduced.

| Framework | File |
|---|---|
| US DHS Resilient PNT Conformance Framework, v2.0 | [dhs-rpcf.md](dhs-rpcf.md) |
| IMO guidance on GNSS interference for ships | [imo-ships.md](imo-ships.md) |
| EASA guidance on GNSS interference for aviation | [easa-aviation.md](easa-aviation.md) |
| EU NIS2 Directive, Article 21 | [nis2-art21.md](nis2-art21.md) |
| EN 16803 (paid standard; by part and catalogue-visible clause numbers only) | [en-16803.md](en-16803.md) |

Each file lists its source documents with version, URL, date read and what was and was not
checked. Sources were read on 2026-10-09 (the EASA bulletin and the EN 16803 catalogue pages were checked again on 2026-10-10). Where a source could only be read through a
mirror or a catalogue page, the file says so.

## The report

```sh
kshana compliance-report spoof-detect.result.json integrity-raim.result.json session.result.json
```

writes `compliance-report.compliance.md` and `compliance-report.compliance.json` (`--out
<base>` changes the name). The inputs are result files from earlier runs: a scenario run
writes `<name>.result.json` beside `<name>.toml`, and `kshana receiver-trust` writes its
own. The kind of each run is read from the scenario file beside the result, from the content
of a receiver-trust result, or from a top-level `kind`, and must be a kind the engine knows.
A result is listed as not used, with the reason, and counts for nothing when its kind cannot
be found, is not a known kind, or the sibling scenario and the result's own `kind` disagree.
(The result's `scenario_hash` and a hash of the scenario file are not compared: the engine
computes the first over its parsed scenario and a file hash is over the text, so they are
different quantities.)

**A kind label alone is not evidence.** A run counts for a capability only when its result
also carries the fields that kind writes (for example a `jamming` result needs its figures of
merit and per-epoch rows; an `integrity` result needs its sample counts). The fields are
listed in `src/compliance/mapping.rs` (`KIND_FIELDS`) and a result missing one is not counted.
A hash that is not hexadecimal is not reported as a hash. A receiver-trust result whose counts
are not whole numbers, or whose detected or agreeing count exceeds its evaluable count, is
excluded and listed as not used.

For each row the report gives one of:

| Status | Meaning |
|---|---|
| `evidenced` | every capability the row names has at least one run in the set |
| `partly-evidenced` | some do |
| `not-evidenced` | none do |
| `out-of-scope` | no Kshana output speaks to the row |

The gap column is printed for every row, including evidenced ones: a run that supports
evidence for a capability still leaves most of a requirement to other evidence. The report
repeats the wording rule at its head. `--mapping` prints the static tables and `--sources`
the source list.

Receiver-trust runs also contribute the counts they state (events detected of those
evaluable, predictions agreeing of those evaluable). Those describe that log, scored against
events and tolerances stated before the run, and are reported as the run states them.

## Capabilities

| Capability | Output | Run kinds |
|---|---|---|
| Receiver-log trust assessment | per-epoch trust state of a real receiver's own log, alarm times, and agreement with events stated before the run | receiver-trust |
| Jamming link-budget effects | carrier-to-noise density and lock state per satellite under a stated jammer geometry | jamming, lunar-jamming, conflict-resilience |
| Spoofing and meaconing detection | detector decisions and detector discrimination under a stated spoofing attack | spoof, spoof-detect, impairment-eval |
| Integrity monitoring and protection levels | protection levels, availability against alert limits, and fault-detection results | integrity, araim-reference-check, lunar-integrity |
| Holdover and coasting | position or time error growth while GNSS is denied, against a stated threshold | clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer |
| Alternative and diverse PNT sources | navigation or timing performance from sources independent of the primary GNSS band | combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion |
| Resilience scoring over threat ensembles | survival and resilience ratios per threat vector over a stated ensemble, with the assumptions stated | conflict-resilience, campaign |
| Reproducible run provenance | scenario hash, engine version and seed carried in each result so a run can be repeated | any run whose result carries a `scenario_hash` |
