<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# IMO guidance on GNSS interference for ships: what Kshana supports evidence for

IMO's GNSS-interference text for ships is thin: MSC.1/Circ.1644 is addressed mainly to Member States, and the ship-side expectations sit in the radionavigation system resolution and the multi-system receiver performance standard. This file maps those three documents. No IMO circular on GNSS interference later than MSC.1/Circ.1644 was found; check the IMO document library for newer ones.

Every row says which Kshana outputs **support evidence for** the requirement and what is
left over. Nothing here says a framework is met, that a product conforms to it, or that
anything is certified. Run `kshana compliance-report` on your own result files to see which
rows your runs actually evidence; see [README.md](README.md).

## Source documents

- **Deliberate interference with the United States Global Positioning System and other global navigation satellite systems**: IMO MSC.1/Circ.1644, 18 October 2021. <https://rntfnd.org/wp-content/uploads/IMO-Circular-MSC.1-Circ.1644-Deliberate-Interference-With-The-United-States-Global-Positioning-System-Gps-And-Other...-Secretariat.pdf_safe.pdf>. Read 2026-10-09: text read in full from this third-party mirror of the circular, not from the IMO site; check the IMO document library for the authoritative copy.
- **Worldwide Radionavigation System**: IMO Assembly resolution A.1046(27), adopted 30 November 2011. <https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/AssemblyDocuments/A.1046(27).pdf>. Read 2026-10-09: document read in full.
- **Performance standards for multi-system shipborne radionavigation receivers**: IMO MSC.401(95), adopted 8 June 2015 (amended by MSC.432(98), 2017). <https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/MSCResolutions/MSC.401(95).pdf>. Read 2026-10-09: original resolution read in full; the 2017 amendment text was not read. No IMO circular on GNSS interference later than MSC.1/Circ.1644 was found; check the IMO document library for newer ones.

## Mapping

<!-- mapping:start -->
| Reference | What it asks (paraphrased) | Kshana outputs that support evidence for it | Gap |
|---|---|---|---|
| MSC.1/Circ.1644, paragraph 3 | Deliberate GNSS interference is a substantial risk to the safety of navigation, people, property and the environment. | Jamming link-budget effects; Spoofing and meaconing detection | A statement of risk; Kshana quantifies effects for a stated geometry, not the risk in a sea area. |
| MSC.1/Circ.1644, paragraph 5 | Member States are asked to limit interference from their territory, consider warnings to mariners, and consider measures against unauthorised transmissions. | none | Addressed to States and administrations; no simulation output speaks to it. |
| Resolution A.1046(27), harbour entrance, approach and coastal requirements | A system counts as available only while it delivers the stated integrity at the stated accuracy, updated at a stated rate, with an integrity warning within a stated time. | Integrity monitoring and protection levels | Kshana computes protection levels and availability against an alert limit for a modelled geometry; the resolution's accuracy, availability and warning-time values are not asserted here. |
| Resolution A.1046(27), ocean requirements | Ocean-phase accuracy, update rate, availability and integrity-warning requirements for the radionavigation system. | Integrity monitoring and protection levels | As above for the ocean phase. |
| MSC.401(95), 3.1 to 3.2 | The receiver uses civil signals from at least two independent systems and delivers a position, velocity and time solution with the resilience and integrity needed. | Alternative and diverse PNT sources; Integrity monitoring and protection levels | Multi-constellation integrity is modelled; the receiver's actual use of two systems is a product test. |
| MSC.401(95), 3.11 to 3.14 | The receiver assesses accuracy and integrity per navigation phase, cautions when it cannot, warns when no new solution arrives in time, and shows the last plausible value with an explicit state. | Receiver-log trust assessment; Integrity monitoring and protection levels; Holdover and coasting | Kshana reads timing and trust from a log; whether the displayed caution and warning intervals match the standard's needs the receiver's user interface, which a log does not show. |
| MSC.401(95), 3.15 to 3.16 | Show the status of augmentation, and the position, course, speed, time and the sources used. | none | Display requirements; no Kshana output speaks to them. |
| MSC.401(95), 4.2 | Operate in the presence of the normal interference level named in the referenced receiver standard. This is not an anti-jamming or anti-spoofing requirement. | Jamming link-budget effects; Receiver-log trust assessment | Normal-interference testing is a laboratory measurement on the receiver. |
<!-- mapping:end -->
