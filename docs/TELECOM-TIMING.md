# Telecom timing: masks, sources and presets

This page lists every limit the `telecom-timing` scenario kind checks, where each one
comes from, and what was left out. The code is `src/telecom_timing.rs`. The reference
scenario is `scenarios/telecom-prtc-holdover-24h.toml`, and the ingestion example is
`scenarios/telecom-tie-ingest.toml`.

**Abbreviations.** ITU-T is the International Telecommunication Union Telecommunication
Standardization Sector. GNSS is Global Navigation Satellite System. TE is time error,
the difference between a clock's time and the reference time. max|TE| is the largest
absolute time error. MTIE is maximum time interval error: the largest peak-to-peak time
error inside any observation window of length τ (tau). TDEV is time deviation, a
root-mean-square measure of time wander at averaging time τ. cTE is constant time
error (the average offset). dTE is dynamic time error (the part that moves). TE_L and
dTE_L are the time error after a first-order low-pass filter with a 0.1 hertz (Hz)
bandwidth; dTE_H is the part above that filter. TE_HO is time error in holdover.
PRTC is primary reference time clock. ePRTC is enhanced PRTC. T-BC is telecom boundary
clock and T-TSC is telecom time slave clock. PTP is the Precision Time Protocol.
PPS is pulse per second. OCXO is oven-controlled crystal oscillator. CSAC is chip-scale
atomic clock. CSV is comma-separated values. ADEV is Allan deviation (σ_y), the
standard measure of frequency stability. ns is nanoseconds and µs is microseconds. ppb
is parts per billion (a fractional frequency of 1e-9), and MHz is megahertz.

**What this is.** The estimators (MTIE and TDEV) are checked against the third-party
`allantools` package and are VALIDATED for that. The mask tables are transcriptions of
the Recommendations below. A synthetic holdover is a model built from public datasheet
figures. The kind is MODELLED overall. It is not a conformance test, and a PASS here is
not a certificate.

## Sources read

All ITU-T texts were downloaded from itu.int on 2026-09-25. The newest edition that
could be read in full was used.

| Recommendation | Edition read | Status on itu.int |
|---|---|---|
| ITU-T G.8272/Y.1367, *Timing characteristics of primary reference time clocks* | 07/2025 | in force |
| ITU-T G.8272.1/Y.1367.1, *Timing characteristics of enhanced primary reference time clocks* | 2024 Amd. 1 (07/2025), a complete-text publication | in force |
| ITU-T G.8273.2/Y.1368.2, *Timing characteristics of telecom boundary clocks and telecom time synchronous clocks for use with full timing support from the network* | 2023 Amd. 2 (11/2025), complete text | in force |
| ITU-T G.8271.1/Y.1366.1, *Network limits for time synchronization in packet networks with full timing support from the network* | 2022 Amd. 3 (05/2025), complete text | in force |
| ITU-T G.8271/Y.1366, *Time and phase synchronization aspects of telecommunication networks* | 03/2020 and its Amd. 1 (08/2024) | in force |

Two newer amendments exist but could not be read: G.8272 (2025) Amd. 1 (08/2026) and
G.8272.1 (2024) Amd. 2 (08/2026). Both are prepublished and restricted to ITU members
(Telecommunication Information Exchange Service, TIES, accounts). If they change any figure below, this page and the code do not yet
reflect it.

**How the numbers were checked.** Text extraction from these Portable Document Format
(PDF) files drops the Greek
letter τ and the micro sign µ, so "0.275 × 10⁻³τ" comes out as "0.275 × 10⁻³". Every
row of G.8272 Tables 1 to 4, G.8272.1 Tables 1 to 5, G.8271 Table 1 and G.8271.1
Table 7-1 was therefore read again from the rendered page image. G.8273.2 Tables 7-1
to 7-5 and G.8271.1 Tables 7-2 and 7-3 were read from extracted text in which τ
survived. Where a table implies continuity at a breakpoint, a unit test checks it.

## Limits implemented

τ is in seconds. An interval written "0.1 < τ ≤ 273" is open at 0.1 s and closed at
273 s, exactly as in the table, and the code keeps each end the same way.

### ITU-T G.8272 (07/2025): PRTC-A and PRTC-B, locked mode

| Quantity | PRTC-A | PRTC-B | Source |
|---|---|---|---|
| max|TE| | 100 ns | 40 ns | clause 6.1 |

MTIE (clause 6.2):

| Mask | Limit | Interval | Source |
|---|---|---|---|
| PRTC-A | 0.275 × 10⁻³ τ + 0.025 µs | 0.1 < τ ≤ 273 | Table 1 |
| PRTC-A | 0.10 µs | τ > 273 | Table 1 |
| PRTC-B | 0.275 × 10⁻³ τ + 0.025 µs | 0.1 < τ ≤ 54.5 | Table 2 |
| PRTC-B | 0.04 µs | τ > 54.5 | Table 2 |

TDEV (clause 6.2):

| Mask | Limit | Interval | Source |
|---|---|---|---|
| PRTC-A | 3 ns | 0.1 < τ ≤ 100 | Table 3 |
| PRTC-A | 0.03 τ ns | 100 < τ ≤ 1 000 | Table 3 |
| PRTC-A | 30 ns | 1 000 < τ < 10 000 | Table 3 |
| PRTC-B | 1 ns | 0.1 < τ ≤ 100 | Table 4 |
| PRTC-B | 0.01 τ ns | 100 < τ ≤ 500 | Table 4 |
| PRTC-B | 5 ns | 500 < τ < 100 000 | Table 4 |

Clause 6.2 also states that the minimum measurement period for TDEV is twelve times the
integration period (T = 12τ). The kind applies that rule to every TDEV it reports, so
TDEV is only given for τ up to one twelfth of the record. G.8272 states no holdover
requirement for a PRTC.

### ITU-T G.8272.1 (2024) Amd. 1 (07/2025): ePRTC

Locked mode:

| Quantity | Limit | Interval | Source |
|---|---|---|---|
| max|TE| | 30 ns | — | clause 6.1 |
| MTIE | 4 ns | 0.1 < τ ≤ 1 | Table 1 |
| MTIE | 0.11114 τ + 3.89 ns | 1 < τ ≤ 100 | Table 1 |
| MTIE | 0.0375 × 10⁻³ τ + 15 ns | 100 < τ ≤ 400 000 | Table 1 |
| MTIE | 30 ns | τ > 400 000 | Table 1 |
| TDEV | 1 ns | 0.1 < τ ≤ 30 000 | Table 2 |
| TDEV | 3.33333 × 10⁻⁵ τ ns | 30 000 < τ ≤ 300 000 | Table 2 |
| TDEV | 10 ns | 300 000 < τ < 1 000 000 | Table 2 |

ePRTC-A holdover, time error (clause 8.2.1, Table 3). L is the time the ePRTC was
locked before the loss, in days, and t is the time since the start of holdover, in
seconds. The limit rises linearly from 30 ns to 100 ns over the holdover period H.

| Locked duration L | Holdover period H | Limit on |Δx(t)| |
|---|---|---|
| L < 6 days | 0 < t ≤ 70 000 s (0.81 days) | 30 + 1.000 × 10⁻³ t ns |
| 6 days ≤ L ≤ 40 days | 0 < t ≤ L · 86 400 s | 30 + 70 t / (L · 86 400) ns |
| L > 40 days | 0 < t ≤ 3 456 000 s (40 days) | 30 + 2.025463 × 10⁻⁵ t ns |

ePRTC-A holdover, wander (clause 8.2.2):

| Quantity | Limit | Interval | Source |
|---|---|---|---|
| MTIE | 4 ns | 0.1 < τ ≤ 1 | Table 4 |
| MTIE | 0.11114 τ + 3.89 ns | 1 < τ ≤ 100 | Table 4 |
| MTIE | 0.0375 × 10⁻³ τ + 15 ns | 100 < τ ≤ 10 000 | Table 4 |
| TDEV | 1 ns | 0.1 < τ ≤ 10 000 | Table 5 |

Clause 8.3.1 sets the default maximum holdover time error, max|TE_HO|, at 100 ns. The
kind uses it as a default time-to-exceed budget.

### ITU-T G.8273.2 (2023) Amd. 2 (11/2025): T-BC and T-TSC

| Quantity | Class A | Class B | Class C | Class D | Source |
|---|---|---|---|---|---|
| max|TE| (unfiltered) | 100 ns | 70 ns | 30 ns | for further study | Table 7-1 |
| max|TE_L| (0.1 Hz low-pass) | — | — | — | 5 ns | Table 7-2 |
| cTE range | ±50 ns | ±20 ns | ±10 ns | for further study | Table 7-3 |
| dTE_L MTIE, constant temperature | 40 ns | 40 ns | 10 ns | for further study | Table 7-4, m ≤ τ ≤ 1 000 |
| dTE_L TDEV, constant temperature | 4 ns | 4 ns | 2 ns | for further study | Table 7-5 |

In Table 7-5, classes A and B are written m < τ ≤ 1 000 and class C is written
m ≤ τ ≤ 1 000. m is 1/16 s for a 16 packet-per-second PTP stream and 1 s for a 1 PPS
output. The kind treats the input as a 1 PPS time interval error, so m = 1 s. Table 7-3
Note 1 says cTE is estimated by averaging the time error over 1 000 s. The kind reports
the worst absolute mean of consecutive 1 000 s blocks.

### ITU-T G.8271.1 (2022) Amd. 3 (05/2025): network limits at reference point C

All three are deployment case 1 and apply after a first-order 0.1 Hz low-pass filter.

| Clause | max|TE_L| | MTIE limit | Interval | Source |
|---|---|---|---|---|
| 7.3.1 (class 4 applications) | 1 100 ns | 100 + 75 τ ns | 1.3 < τ ≤ 2.4 | Table 7-1 |
| | | 277 + 1.1 τ ns | 2.4 < τ ≤ 275 | Table 7-1 |
| | | 580 ns | 275 < τ ≤ 10 000 | Table 7-1 |
| 7.3.2 (enhanced network) | 600 ns | 37.39 + 9.7 τ ns | 1.3 < τ ≤ 2.4 | Table 7-2 |
| | | 55.27 + 2.25 τ ns | 2.4 < τ ≤ 20.2 | Table 7-2 |
| | | 90.22 + 0.52 τ ns | 20.2 < τ ≤ 211.11 | Table 7-2 |
| | | 200 ns | 211.11 < τ ≤ 10 000 | Table 7-2 |
| 7.3.3 (PRTC in the access network) | 100 ns | 0.0475 τ + 25 ns | 1 < τ < 400 | Table 7-3 |
| | | 44 ns | 400 < τ ≤ 10 000 | Table 7-3 |

Table 7-3 leaves τ = 400 s itself without a limit (one row ends "< 400", the next starts
"400 <"). The kind reports no limit there rather than choosing one. Reference point A
(clause 7.1) takes its limits from G.8272, so the PRTC masks above cover it.

### Budgets (time to exceed)

| Budget | Value | Source |
|---|---|---|
| ePRTC default max|TE_HO| | 100 ns | G.8272.1 (2024) Amd. 1 (07/2025) clause 8.3.1 |
| Network holdover allocation, short GNSS interruption | 400 ns | G.8271.1 (2022) Amd. 3 (05/2025) Table V.1, failure scenario (b), "re-arrangements and holdover in the network". An example allocation, not a requirement. |
| Network limit at reference point C | 1 100 ns | G.8271.1 clause 7.3.1. This is a filtered quantity; as a budget it is compared unfiltered. |
| End application, accuracy class 4 | 1.5 µs | G.8271 (03/2020) Amd. 1 (08/2024) Table 1, class 4 |

**The classic "1.5 µs end to end" figure.** It is G.8271 Table 1's class 4 time error
requirement, stated against a common reference at the end application. G.8271.1
Table V.1 shows how a network can allocate it in normal operation: 100 ns for the
PRTC/telecom grandmaster, 200 ns for the dynamic time error of the chain, a constant
time error for the clocks and links, 1 100 ns in total at reference point C, then
250 ns for rearrangements and short holdover in the end application and 150 ns for the
end application's own noise, 1 500 ns at reference point E. The same table's failure
scenario (c), "long holdover periods, e.g., 1 day", gives 3 350 ns at C and 3 500 ns
at E (its Note 5 says exceeding 1 500 ns may degrade service). So neither
Recommendation states a "1.5 µs over 24 hours of holdover" requirement, and the kind
does not implement one.

## Not confirmed or not implemented

Nothing below is implemented as a mask. None of it was filled in by estimate.

- **Marked "for further study" in the Recommendations:** G.8273.2 class D max|TE|, cTE,
  dTE_L MTIE and TDEV, dTE_H and holdover; ePRTC-B holdover (G.8272.1 clause 8.2.1);
  ePRTC-A holdover MTIE and TDEV beyond 10 000 s (Table 4 Note 1, Table 5 Note 2);
  ePRTC phase discontinuity (clause 7); T-BC/T-TSC phase/time holdover with both the
  PTP and the physical-layer inputs lost (G.8273.2 clause 7.4.2.1); the TDEV network
  limit at reference point C (G.8271.1 clauses 7.3.1 to 7.3.3); network limits for
  deployment case 2 at point C.
- **Transcribed but not implemented in this version:** G.8273.2 Table 7-6 (MTIE with
  variable temperature: 40 / 40 / 10 ns up to 10 000 s), Table 7-7 (dTE_H peak to peak:
  70 / 70 / 30 ns, which needs a 0.1 Hz high-pass filter), Table 7-10 (holdover MTIE
  with physical-layer frequency assistance), relative time error (Tables 7-8 and 7-9),
  and the dTE_H limits of G.8271.1 clauses 7.3.2 (50 ns) and 7.3.3 (70 ns).
- **Not applied:** the moving-average filter of at least 100 samples that G.8272 and
  G.8272.1 state for PTP interfaces. The input is treated as a 1 PPS time interval
  error, which those Recommendations measure without a filter.
- **Unreadable:** the two restricted 2026 amendments named under "Sources read".
- **Editorial oddity:** in G.8272.1 Amd. 1 the head of Table 3 carries an inserted
  "TDEV limit [ns] 1 / 0.1 < τ ≤ 10 000" row in amendment markup, above the time-error
  columns. It is not treated as part of the time-error envelope. The same 1 ns TDEV is
  Table 5 and is implemented there.

## The measurement filter

G.8273.2 and G.8271.1 define their filtered limits through a first-order low-pass
filter with a 0.1 Hz bandwidth. The kind applies the discrete smoother
y_k = y_{k−1} + α (x_k − y_{k−1}), α = 1 − exp(−2π · 0.1 · Δt), started at the first
sample. It is an approximation of test equipment, not a copy of any instrument. It is
applied only when the sample interval Δt is 1 s or less. A coarser record is reported
NOT-EVALUATED against a filtered mask instead of being filtered badly.

## Oscillator presets (MODELLED)

Every figure is the datasheet's own, read on 2026-09-25.

| Preset | Device and document | ADEV maxima used (τ: σ_y) | Aging | Temperature |
|---|---|---|---|---|
| `ocxo` | Microchip (Vectron) OX-208, 10 MHz; datasheet Rev 12-1-2021 | 1 s: 5e-12; 10 s: 8e-12; 100 s: 1e-11; 1 000 s: 5e-11 | ±0.15 ppb/day after 72 h (f ≤ 10 MHz) | ±0.4 ppb, 0 °C to +70 °C, referenced to +25 °C |
| `rubidium` | Microchip 8040C Rubidium Frequency Standard, standard performance; DS00003047A (2/20) | 1 s: 3.0e-11; 100 s: 3.0e-12 | <5e-11/month after 30 days | temperature coefficient <3E-10, 0 °C to 50 °C |
| `caesium` | Microchip 5071A, high-performance tube; DS00002980D (5/25) | 1 s: 5.0e-12; 10 s: 3.5e-12; 100 s: 8.5e-13; 1 000 s: 2.7e-13; 10⁴ s: 8.5e-14; 10⁵ s: 2.7e-14; 5 days: 1.0e-14; 30 days: 1.0e-14 | no rate published; lifetime change ≤5.0e-14 | ±8.0e-14 versus environment (0 °C to 50 °C, humidity, magnetic field, shock) |
| `csac` | Microchip SA.45s CSAC, options 001 and 003; DS00002985D (5/23) | 1 s: 3e-10; 10 s: 1e-10; 100 s: 3e-11; 1 000 s: 1e-11 | <9e-10/month after 30 days | ±5e-10, −10 °C to 70 °C |

Document links:
[OX-208](https://ww1.microchip.com/downloads/aemDocuments/documents/VOP/ProductDocuments/DataSheets/OX-208.pdf),
[8040C](https://ww1.microchip.com/downloads/en/DeviceDoc/00003047A.pdf),
[5071A](https://ww1.microchip.com/downloads/aemDocuments/documents/FTD/ProductDocuments/Brochures/5071A-Sell-Sheet-00002980.pdf),
[SA.45s](https://ww1.microchip.com/downloads/aemDocuments/documents/FTD/ProductDocuments/Brochures/SA.45s-CSAC-Options-001-and-003-00002985.pdf).

Left out on purpose: the 8040C's 10 s row, which the datasheet prints as
"<1.0 x 10^11" (a misprinted exponent), and the 5071A's rows below 1 s. The OX-049 was
considered for the OCXO and not used, because its aging row cannot be read unambiguously
from its misaligned table.

**How the figures become a model.** These are this engine's choices, and each one is
reported in the run output:

1. **Noise fit.** The white, flicker and random-walk frequency-noise levels are a
   non-negative least-squares fit to the ADEV maxima, then scaled up until the model is
   at or above every point. The datasheet figures are maxima, so the model envelopes
   them.
2. **Flicker floor.** The floor is never below the ADEV at the longest listed τ. A
   datasheet stops listing where its maker stops promising improvement, so the model
   does not let the clock improve beyond it. This can only make a holdover worse.
3. **Aging.** A monthly figure is converted at 30 days per month and applied as a
   linear frequency drift from the moment of loss. The caesium preset has no aging.
4. **Temperature.** The stated bound is read linearly over half the operating span
   (for example ±5e-10 over −10 °C to 70 °C gives 1.25e-11 per kelvin), then driven by
   a sinusoidal temperature profile whose amplitude and period are scenario inputs.
   Nothing on a datasheet says the dependence is linear; this is a worst-case reading.
5. **Before the loss** the clock is disciplined and its time error is white phase noise
   with a stated 1-sigma value.

**What the reference scenario shows.** At the committed inputs (rubidium, ±2 K daily
temperature swing, 24 h holdover after 1 h locked) the record reaches a largest
absolute time error of 603.2 ns. It crosses the 100 ns ePRTC budget 8 206 s after the
loss and the 400 ns allocation after 25 713 s, and stays inside 1 100 ns and 1.5 µs for
the whole day. It fails the ePRTC-A holdover envelope 3 627 s after the loss, which is
expected: that requirement assumes a caesium-class reference. The temperature term
alone can reach 660 ns, so at these inputs it matters more than aging (72 ns at the end
of the day).

## Validation

`tests/telecom_timing_reference.rs` checks the kind's MTIE and TDEV against
`allantools` 2024.06 on `tests/fixtures/telecom_timing/holdover_te_series.csv`, a
2 048-sample CSAC holdover series with aging, flicker and temperature. On 17 MTIE and
12 TDEV averaging factors, MTIE agrees exactly and TDEV agrees to 1.1e-15 relative. The
same curves are read back out of a full run that ingests the CSV. This validates the
estimators on that record. It does not validate the synthetic holdover, the masks or
the presets, which are MODELLED rows in `docs/VERIFICATION-MATRIX.md`.
