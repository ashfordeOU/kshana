<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# ICAO Doc 9849 Appendix F: monitor, assess and mitigate GNSS radio-frequency interference

ICAO's GNSS RFI Mitigation Plan is a three-step cycle: monitor threats, assess risks, deploy mitigation measures, with checklists of preventive and reactive measures. This pack follows the cycle: the monitoring tests need a receiver log or aggregated reports, the assessment tests escalate one jammer across three ranges, and the mitigation tests run on-board detection, alternative PNT and timing holdover.

Every row says which pack tests **support evidence for** it and what is left over. Nothing
here says a framework is met or that any product has been rated or approved by anyone, and
none of these files is a statement from an assessment body; Kshana is not one. A pack
measures **modelled** scenarios against bars stated before the run
(`standards/icao-doc9849-appf/PREREGISTRATION.md`, committed before any scored run and never changed
after one). Advisory: analysis output from a research and engineering tool, not
type-approved navigation equipment and not a safety-of-life service.

```sh
kshana standards-pack run icao-doc9849-appf --out icao-doc9849-appf      # writes icao-doc9849-appf.pack.json and icao-doc9849-appf.pack.md
kshana compliance-report icao-doc9849-appf.pack.json        # lists the pack's rows with their statuses
```

A test marked **NEEDS INPUT** is not run by the engine alone: it names the receiver log or
laboratory evidence the operator must supply, scored with `kshana receiver-trust` against
events stated before the run. A bar that is **NOT MET** is a result, kept on record and
pinned by `tests/standards_packs.rs`; it is never loosened.

## Source documents

- **ICAO GNSS RFI Mitigation Plan**: presentation to the ICG-11 Working Group S, 2016, which describes the three-step plan and quotes Doc 9849 sections 5.1.5, 7.11.3.1, 7.12.5, 7.13.1.1 and Appendix B. <https://www.unoosa.org/pdf/icg/2016/icg11/wgs/6.pdf>. Read 2026-10-18 in full. **Doc 9849 itself is a paid ICAO publication and was not read**: no Appendix F clause is cited by number, and the checklists of preventive and reactive measures that Appendix F contains are not reproduced or scored. A holder of the licensed text should extend the rows.

## Rows this pack adds to the compliance report

<!-- pack-rows:start -->
| Reference | What it asks (paraphrased) | Pack tests that support evidence for it | Gap |
|---|---|---|---|
| Doc 9849 Appendix F step 1 (monitor threats) and section 7.11.3.1, as described in ICAO's GNSS RFI Mitigation Plan presentation | Threats are monitored proactively and reactively; when anomaly reports suggest interference, air navigation service providers analyse them and, if interference is present, identify the affected area and issue a notice. | MON-1, REPORT-1 | The plan puts monitoring best at the aircraft receiver and relies on reports; a scored log shows one receiver's alarm times, not an air-traffic picture or the reporting process. |
| Doc 9849 Appendix F step 2 (assess risks) and section 7.13.1.1, as described in ICAO's GNSS RFI Mitigation Plan presentation | Providers assess residual likelihood of service outages and the impact of an outage on operations in specific airspace, varying and escalating scenarios and identifying existing barriers. | ASSESS-1, ASSESS-2, ASSESS-3 | Scenarios give the impact side for a stated geometry; likelihood and the airspace-specific assessment are the provider's. |
| Doc 9849 Appendix F step 3 (deploy mitigation measures) and section 5.1.5, as described in ICAO's GNSS RFI Mitigation Plan presentation | Mitigation barriers prevent transmission of interference, prevent a GNSS service outage (resilience, on-board integration) and limit the severity of impact (integration with other navigation sources, alternative PNT, detection and resolution). | MIT-1, MIT-2, MIT-3 | The pack models detection, alternative PNT and holdover; prevention of transmission is regulatory and outside simulation. Appendix F's own checklists were not read. |
<!-- pack-rows:end -->

## Tests and the bars stated before the run

<!-- pack-tests:start -->
| Test | Profile | Scenario | Bars stated before the run |
|---|---|---|---|
| MON-1 Detect the start and end of an interference event at the receiver | monitor | none | not scored: needs input (A receiver log (UBX, RINEX, Android or NMEA) from a flight or test that includes an interference interval, and the interval's stated start and end, scored with `kshana receiver-trust` against events stated before the run) |
| ASSESS-1 Scenario variation: a 10 W broadband jammer 1 km away denies GNSS | assess | assess-jammer-1km | `/fom/availability_under_jamming` le 0.05 |
| ASSESS-2 Scenario variation: the same jammer 10 km away still denies GNSS | assess | assess-jammer-10km | `/fom/availability_under_jamming` le 0.05 |
| ASSESS-3 Scenario variation: the same jammer 100 km away degrades but does not deny | assess | assess-jammer-100km | `/fom/availability_under_jamming` ge 0.95 |
| MIT-1 On-board detection: a spoofer pushing three satellites is flagged | mitigate | mitigate-spoof-detect | `/decision/fused/alert` eq true |
| MIT-2 Alternative PNT limits the severity of a GNSS outage | mitigate | mitigate-combined-altpnt | `/combined_m` le `/free_inertial_drift_m` |
| MIT-3 A timing holdover keeps the stated bound while GNSS is denied | mitigate | mitigate-clock-holdover | `/quantum/fom/timing_p95_ns` le `/threshold_ns` |
| REPORT-1 Reporting and closed-loop awareness of interference events | monitor | none | not scored: needs input (Aggregated reports for a region (flight reports, ADS-B based interference cells)) |
<!-- pack-tests:end -->

## Results at this release

Every run is MODELLED. At this release (`kshana standards-pack run icao-doc9849-appf`): ASSESS-1,
ASSESS-2, ASSESS-3, MIT-1, MIT-2 and MIT-3 are **MET**; MON-1 and REPORT-1 need input. The
escalation pair behaves as the scenario's own notes say: the same 10 W broadband jammer
denies GNSS at 1 km and at 10 km, and degrades without denying at 100 km.
