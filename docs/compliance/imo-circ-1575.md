<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# IMO MSC.1/Circ.1575 (shipborne PNT data processing): accuracy levels and integrity evaluation

The circular gives guidelines for shipborne PNT data processing: operational accuracy levels A to D at 95 % confidence, integrity evaluation graded none, low, medium and high, input checking and status reporting. This pack measures modelled protection-level availability against the Table C-1 limits for levels A and B, runs a multi-system and a harbour variant, checks a consistency detector, and lists the status and input-handling tests that need a receiver's output. The circular supplements MSC.401(95), whose rows are in [imo-ships.md](imo-ships.md).

Every row says which pack tests **support evidence for** it and what is left over. Nothing
here says a framework is met or that any product has been rated or approved by anyone, and
none of these files is a statement from an assessment body; Kshana is not one. A pack
measures **modelled** scenarios against bars stated before the run
(`standards/imo-circ-1575/PREREGISTRATION.md`, committed before any scored run and never changed
after one). Advisory: analysis output from a research and engineering tool, not
type-approved navigation equipment and not a safety-of-life service.

```sh
kshana standards-pack run imo-circ-1575 --out imo-circ-1575      # writes imo-circ-1575.pack.json and imo-circ-1575.pack.md
kshana compliance-report imo-circ-1575.pack.json        # lists the pack's rows with their statuses
```

A test marked **NEEDS INPUT** is not run by the engine alone: it names the receiver log or
laboratory evidence the operator must supply, scored with `kshana receiver-trust` against
events stated before the run. A bar that is **NOT MET** is a result, kept on record and
pinned by `tests/standards_packs.rs`; it is never loosened.

## Source documents

- **Guidelines for shipborne position, navigation and timing (PNT) data processing**: IMO MSC.1/Circ.1575, 16 June 2017. <https://wwwcdn.imo.org/localresources/en/OurWork/Safety/Documents/IMO%20Documents%20related%20to/MSC.1-Circ.1575.pdf>. Read 2026-10-18: document read in full from the IMO document server; paragraph numbers 44 to 47, 53 to 57, 84 to 88 and 92 to 93 and Table C-1 and appendix C section 2.2 are paraphrased.

## Rows this pack adds to the compliance report

<!-- pack-rows:start -->
| Reference | What it asks (paraphrased) | Pack tests that support evidence for it | Gap |
|---|---|---|---|
| MSC.1/Circ.1575, annex paragraphs 44 to 46 and appendix C, Table C-1 | Position and other PNT outputs are specified by operational accuracy levels A to D (horizontal 100 m, 10 m, 1 m, 0.1 m; vertical 10 m, 5 m, 1 m, 0.5 m), each at 95 % confidence; non-mandatory technical sub-levels refine them. | ACC-A, ACC-B, ACC-B-MULTI, ACC-B-HARBOUR | A protection-level availability against a stated limit for a representative sky and ranging error; a receiver's measured accuracy needs its own log. Levels C and D are not tested. |
| MSC.1/Circ.1575, annex paragraphs 47 and 84 to 88 and appendix C section 2.2 | Integrity evaluation is graded none, low (plausibility and consistency of single sources), medium (consistency across largely uncorrelated sources) and high (an estimate of the inaccuracy, such as a RAIM protection level). | ACC-B-MULTI, ACC-B-HARBOUR, INT-CONSIST | The circular assigns a level to a receiver's method, which a scenario does not show; the pack scores a modelled protection level and a modelled consistency detector. |
| MSC.1/Circ.1575, annex paragraphs 92 and 93 | Status data reports the usability of sensors and processing, including a seamless switch to a lower accuracy or integrity level and a raised status when redundancy is lost (for example RAIM fault exclusion replaced by no RAIM). | STATUS-1 | Output status is a property of the equipment's interface; no simulation output shows it, so the test needs the equipment's log or documentation. |
| MSC.1/Circ.1575, annex paragraphs 53 to 57 | Incoming data is checked for completeness, correctness, update rate, plausibility and consistency; invalid or intolerably inconsistent data is marked and excluded from processing. | INPUT-1 | Input handling belongs to the equipment; Kshana does not inspect it. |
<!-- pack-rows:end -->

## Tests and the bars stated before the run

<!-- pack-tests:start -->
| Test | Profile | Scenario | Bars stated before the run |
|---|---|---|---|
| ACC-A Level A horizontal and vertical limits held on open sea, 95 % of epochs | accuracy-level-a | accuracy-a-open-water | `/samples_available` / `/samples_total` ge 0.95 |
| ACC-B Level B limits held on open sea with one constellation, 95 % of epochs | accuracy-level-b | accuracy-b-open-water | `/samples_available` / `/samples_total` ge 0.95 |
| ACC-B-MULTI Level B limits held on open sea with GPS plus Galileo, 95 % of epochs | accuracy-level-b | accuracy-b-multi-system | `/samples_available` / `/samples_total` ge 0.95 |
| ACC-B-HARBOUR Level B limits held in a harbour approach with a representative skyline, 95 % of epochs | accuracy-level-b | accuracy-b-harbour | `/samples_available` / `/samples_total` ge 0.95 |
| INT-CONSIST Consistency checks across measurements flag a satellite-subset position push | integrity-evaluation | integrity-consistency-spoof | `/decision/raim/alert` eq true |
| STATUS-1 Status is raised when redundancy is lost (for example RAIM FDE replaced by no RAIM) | status-data | none | not scored: needs input (A receiver or PNT-DP output log, or its interface documentation, showing the status or integrity indication change when the number of usable satellites falls from the over-determined case to four) |
| INPUT-1 Implausible or inconsistent input is marked and excluded | status-data | none | not scored: needs input (A receiver log or PNT-DP input trace containing data that violates range, rate or consistency limits, with the exclusion visible in the output) |
<!-- pack-tests:end -->

## Results at this release

Every run is MODELLED. At this release (`kshana standards-pack run imo-circ-1575`):
INT-CONSIST is **MET**; STATUS-1 and INPUT-1 need a receiver's output; **the four accuracy
tests are NOT MET**.

| Test | Epochs inside the limits | Bar |
|---|---|---|
| ACC-A (horizontal 100 m, vertical 10 m, open sea) | about 27 % | 95 % |
| ACC-B (horizontal 10 m, vertical 5 m, open sea) | 0 % | 95 % |
| ACC-B-MULTI (GPS plus Galileo ARAIM) | 0 % | 95 % |
| ACC-B-HARBOUR (representative skyline) | 0 % | 95 % |

The protection levels come from a 1 m (1-sigma) ranging error, representative of a modern
dual-frequency, carrier-smoothed receiver. At that error the vertical protection level does
not stay inside 5 m or 10 m for most epochs. That says a code-based GNSS protection level
with that error budget does not hold the Table C-1 vertical limits at 95 %; it is not a
measurement of any receiver, and a receiver with better ranging, augmentation or carrier-phase
processing is outside what these scenarios model. The bars were stated before the run and are
not changed.
