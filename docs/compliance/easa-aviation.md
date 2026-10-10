<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# EASA guidance on GNSS interference for aviation: what Kshana supports evidence for

EASA's Safety Information Bulletin is informational, not mandatory, and addressed to authorities, air traffic providers, operators and manufacturers. It does not number its recommendations, so the references below are its section headings. Conflict Zone Information Bulletins were not opened and are not mapped.

Every row says which Kshana outputs **support evidence for** the requirement and what is
left over. Nothing here says a framework is met or that any product has been rated or
approved by anyone. Run `kshana compliance-report` on your own result files to see which
rows your runs actually evidence; see [README.md](README.md).

## Source documents

- **Global Navigation Satellite System Outage and Alterations Leading to Communication / Navigation / Surveillance Degradation**: EASA Safety Information Bulletin SIB 2022-02R4, issued 3 July 2026, corrected 22 July 2026 (informational, not mandatory). <https://ad.easa.europa.eu/ad/2022-02R4>. Read 2026-10-09: revision 4 read in full; sections are cited by heading because the bulletin does not number its recommendations. Re-checked 2026-10-10: the bulletin PDF, the EASA AD-tool page (which lists its supersedure as none) and the EASA GNSS page name no later revision and no bulletin numbered 2026-07; a banner naming Revision 2 of SIB 2026-07 was not found, so the question is open and should be checked on the live EASA page. Conflict Zone Information Bulletins were not opened.

## Mapping

<!-- mapping:start -->
| Reference | What it asks (paraphrased) | Kshana outputs that support evidence for it | Gap |
|---|---|---|---|
| SIB 2022-02R4, Description | Spoofing is harder to detect and more hazardous than jamming; there is no cockpit alert that tells the two apart; effects range from false terrain alerts to corrupted surveillance data and can persist after leaving the area. | Jamming link-budget effects; Spoofing and meaconing detection | Kshana models detector and link effects; cockpit alerting is an equipment property. |
| SIB 2022-02R4, Recommendation(s): aircraft and equipment manufacturers, should | Assess jamming and spoofing effects on the product, including cumulative effects, and give operators guidance on spotting suspected spoofing and on operating limits when GNSS is lost. | Receiver-log trust assessment; Jamming link-budget effects; Spoofing and meaconing detection; Holdover and coasting | The assessment of the product itself is the manufacturer's; Kshana supplies a repeatable scenario and a scored receiver log as evidence in it. |
| SIB 2022-02R4, Recommendation(s): air operators should (spoofing) | Compare GNSS position and time against non-GNSS sources and watch the position-uncertainty figure and navigation aids to notice spoofing. | Spoofing and meaconing detection; Receiver-log trust assessment; Alternative and diverse PNT sources | Operational procedure and training are outside simulation outputs. |
| SIB 2022-02R4, Recommendation(s): ATM/ANS providers should; organisations involved in the design or production of ATM/ANS equipment, should | Assess the effect of GNSS timing loss on communication, navigation and surveillance systems, keep ground navigation aids, and help detect interference. | Holdover and coasting; Jamming link-budget effects | Timing-holdover runs speak to the timing-loss assessment; ground-system design and procedures are not covered. |
| SIB 2022-02R4, Recommendation(s): closing reminders on reporting | Report events affecting safety under the occurrence-reporting regulation, and report suspected spoofing and higher-risk jamming to the manufacturer. | none | A reporting duty; no output speaks to it. |
<!-- mapping:end -->
