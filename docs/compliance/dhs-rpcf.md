<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# US DHS Resilient PNT Conformance Framework: what Kshana supports evidence for

The framework describes resilience levels 0 to 4 built from eight numbered requirements, and an evaluation approach that combines static analysis with dynamic analysis in which test vectors stand in for threats. It has no requirement-identifier scheme of its own, so the references below are its level and requirement numbers and its section numbers. It is outcome-based and does not catalogue threats.

Every row says which Kshana outputs **support evidence for** the requirement and what is
left over. Nothing here says a framework is met, that a product conforms to it, or that
anything is certified. Run `kshana compliance-report` on your own result files to see which
rows your runs actually evidence; see [README.md](README.md).

## Source documents

- **Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework**: Version 2.0, 26 April 2022 (DHS Science and Technology Directorate, with CISA). <https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf>. Read 2026-10-09: document read in full; the publication landing page was not fetched.

## Mapping

<!-- mapping:start -->
| Reference | What it asks (paraphrased) | Kshana outputs that support evidence for it | Gap |
|---|---|---|---|
| Section 5.2 (Prevent, Respond, Recover) | Resilience is described as three functions: preventing harm, responding (detect, report, mitigate, contain) and recovering. Detection is probabilistic, so false alarms and missed detections both matter. | Receiver-log trust assessment; Spoofing and meaconing detection; Holdover and coasting | Prevention is a product-design property that no simulation output shows. Detection statistics from a synthetic or single-session run are not a measured false-alarm or miss rate for a fielded product. |
| Level 1, requirement 1 | Check that stored data arriving from external sources matches the formats and value ranges of the relevant standards. | none | A software-assurance and input-validation property of the product under test. Kshana does not inspect a product's input handling. |
| Level 1, requirement 2 | Allow full manual recovery by clearing or resetting memory, returning the system to defined performance once the threat is gone. | Receiver-log trust assessment | A receiver log shows when a fix became untrusted and when it recovered; it does not show that a manual reset clears every stored state. |
| Level 1, requirement 3 | Reload or update firmware securely. | none | Firmware update security is outside what any Kshana output observes. |
| Level 2, requirement 4 | Identify compromised PNT sources and stop them corrupting the solution. | Spoofing and meaconing detection; Receiver-log trust assessment; Integrity monitoring and protection levels | Kshana scores detectors and monitors it models or runs over a log; whether a product's own source exclusion works needs the product's internal state, not only its log. |
| Level 2, requirement 5 | Recover sources and the system automatically without interrupting output; a solution is still provided during the threat, with possibly unbounded degradation. | Holdover and coasting; Receiver-log trust assessment | Holdover runs bound modelled drift for a stated clock or inertial model, not the product's own recovery behaviour. |
| Level 3, requirement 6 | Corrupt data from one source must not contaminate another source. | Alternative and diverse PNT sources | Kshana runs sources side by side; source isolation inside a product needs design review or fault injection into the product. |
| Level 3, requirement 7 | Cross-verify the solutions of all sources, and keep degradation during a threat bounded. | Integrity monitoring and protection levels; Holdover and coasting; Alternative and diverse PNT sources | Bounded degradation is shown for the modelled sensors; the product's own cross-checking is not observed. |
| Level 4, requirement 8 | Use sources of different technologies against common-mode threats, with no degradation during the threat. | Alternative and diverse PNT sources; Jamming link-budget effects | A common-mode argument needs the real product's source set and a threat that spans them; a scenario states one, it does not prove the product has no shared weakness. |
| Section 5.5 (common mode) | Diverse mechanisms must not share a weakness: for example a jammer that covers two bands defeats band diversity. | Jamming link-budget effects; Resilience scoring over threat ensembles; Alternative and diverse PNT sources | Scoring uses a synthetic threat ensemble, stated as such; it is not field data. |
| Sections 8.1 to 8.3 (evaluation) | Evaluation combines static analysis with dynamic analysis, where test vectors stand in for threats; the test classes are source failure, interference and internal faults. Simulators are named as a test method. | Receiver-log trust assessment; Jamming link-budget effects; Spoofing and meaconing detection | Exported motion and events can drive a laboratory simulator (docs/TEST-BENCH.md). Kshana writes no signal, so the simulator and its authorised operator supply the threat. |
| Section 8.6 (test-plan elements) | A test plan states the level, requirement, inputs, references, data access needed, procedure with pass or fail criteria, results and notes. | Reproducible run provenance; Receiver-log trust assessment | Pass or fail criteria are chosen by the assessor; Kshana records the inputs, thresholds and hashes it ran with. |
<!-- mapping:end -->
