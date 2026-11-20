# Radio time signals and legacy GPSDOs: a migration guide

Long-wave and shortwave time signals are closing or under review, and many GPS-disciplined
oscillators (GPSDOs) in service are older than the firmware they need. This page helps a user
who depends on one of them choose what to move to, and swap a legacy GPSDO without losing time.
It is guidance written from public sources, not an engineering assessment of any site; check
every status line against the operator's own notice before acting on it.

## The four services (status as of 20 November 2026)

| Service | Operator | Carrier | Status | Source |
|---|---|---|---|---|
| CHU (Ottawa, Canada) | National Research Council Canada | shortwave, 3,330, 7,850 and 14,670 kHz | Reported ended on 22 June 2026. | [RNTF, 22 May 2026](https://rntfnd.org/2026/05/22/canada-ending-radio-time-signals-accuracy/) |
| MSF (Anthorn, UK) | for the National Physical Laboratory | long wave, 60 kHz | In service. The UK government's call for evidence on the use of the MSF signal (26 October 2026) closes on **22 December 2026**; users who depend on it should answer it. | [GOV.UK call for evidence](https://www.gov.uk/government/calls-for-evidence/use-of-the-msf-radio-time-and-frequency-signal-call-for-evidence); [RNTF, 27 Oct 2026](https://rntfnd.org/2026/10/27/uk-is-asking-users-about-60khz-time-signal/) |
| DCF77 (Mainflingen, Germany) | Physikalisch-Technische Bundesanstalt (PTB) disseminates German legal time | long wave, 77.5 kHz | In service. Reported: the operating contract was extended in 2021 for ten years (to verify with PTB). | [PTB, DCF77](https://www.ptb.de/cms/en/ptb/fachabteilungen/abt4/fb-44/ag-442/dissemination-of-legal-time/dcf77.html) |
| WWVB (Fort Collins, USA) | National Institute of Standards and Technology (NIST) | long wave, 60 kHz | In service; no end announced in the sources read for this page. | NIST time and frequency services |

A long-wave receiver delivers time late by the ground-wave delay from the transmitter, about
3.3 µs per kilometre (1.6 ms from Mainflingen to Paris), plus its own receiver delay; most
consumer receivers do not correct either. Reception changes between day and night and with the
building.

## Which source for which need

Typical figures are orders of magnitude for planning, not specifications.

| Your requirement | Long wave (DCF77, MSF, WWVB, JJY, BPC) | GNSS receiver or GPSDO | NTP or NTS over the internet | PTP or fibre from a time laboratory or operator | eLoran, where a service exists |
|---|---|---|---|---|---|
| Typical time accuracy | milliseconds (after the delay correction) | tens of nanoseconds | milliseconds | sub-microsecond to nanoseconds | sub-microsecond (operator-stated) |
| Works indoors | often (long wave penetrates) | no (needs a sky view) | yes | yes | often (low frequency) |
| Shares GNSS's failure modes (jamming, spoofing, rollover) | no | yes | depends on the servers' own sources | depends on the laboratory's sources | no |
| Traceable to a national time scale | yes (the broadcaster's) | through the GNSS system time | only from a laboratory's servers | yes, with calibration records | through the operator |
| Cost to the user | a receiver | a receiver, antenna and cable | none | a contract and a link | a receiver, where offered |

Rules of thumb:

1. **Better than 1 µs** (telecom, power, trading): long wave and NTP cannot carry it. Use GNSS
   with a second source that does not share its failure modes (PTP or fibre from a laboratory,
   eLoran where offered), and keep a holdover oscillator sized for the outage you must ride
   through.
2. **About a millisecond** (logging, building systems, broadcast, consumer clocks): long wave
   where it is received, or NTS from two independent operators. A GNSS receiver alone gives the
   accuracy but not the independence.
3. **A legal or traceable time stamp**: take time from the national laboratory's own services
   (its NTP servers, NTS or a fibre service where offered) and keep the evidence.

Migration by service:

* **CHU users** (shortwave time code, voice announcements): for a computer clock, NTS or NTP from
  the national laboratory's servers; for equipment that decoded the CHU time code, a GNSS
  receiver with a time-of-day output, plus NTP as the check. WWVB is received in parts of Canada,
  mainly at night; test at the site before relying on it.
* **MSF users**: answer the call for evidence before 22 December 2026 with what depends on the
  signal. Plan for a second source now: GNSS with NTS as its check, or DCF77 where it is received
  in the south and east of the UK (correct the longer ground-wave delay).
* **DCF77 and WWVB users**: no change is announced. Add a second, independent source anyway: a
  long-wave signal alone has no check, and a receiver that loses it keeps running on its own clock
  without saying so.

## Swapping a legacy GPSDO

Before the swap:

* **Week-number rollover.** A GPS receiver that resolves the 10-bit week against its firmware
  date falls back 1,024 weeks (19.6 years) after that date. Run the time-scale vectors on what
  reads the GPSDO's output (`kshana time-vectors`, [TIME-VECTORS.md](TIME-VECTORS.md)) and find
  the firmware's pivot date from the vendor.
* **Outputs.** Match each consumer: 10 MHz level and waveform, 1 PPS polarity, pulse width, level
  and load (often TTL into 50 Ω), the time-of-day message (NMEA ZDA or RMC, or a vendor format)
  and whether it gives UTC or GPS time.
* **Antenna and cable.** The new receiver's bands, the LNA supply voltage and the antenna gain;
  set the cable delay (length over the velocity factor times the speed of light, about 5 ns per
  metre for a velocity factor of 0.66). A delay left unset is a constant time error.
* **Holdover.** Compare the oscillator class (OCXO, rubidium) and the stated holdover with the
  outage you need to ride through; model it with the `clock-holdover` scenario
  (`kshana example clock-holdover`).
* **Leap seconds.** How the unit announces and applies a leap second on each output.

During the swap:

* Run the new unit beside the old one for at least a week; log both (chrony, linuxptp or `ts2phc`
  logs, or a time-interval counter) and compare them with the clock-log readers
  ([CLOCK-LOG-FORMATS.md](CLOCK-LOG-FORMATS.md), `kshana clock-live`).
* Read the new unit's status the way monitoring will read it in service
  ([TIMING-SYSTEMS.md](TIMING-SYSTEMS.md): PTP management, SNMP, NTP mode 6).
* Check the vendor's security advisories for the new unit's firmware, and verify every upgrade
  image against the vendor's published digest or signature before installing it.

After the swap, keep the comparison logs and the configured cable delay with the unit's records.
