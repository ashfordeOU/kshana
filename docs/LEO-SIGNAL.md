# LEO-PNT signal designs and the multi-band spectrum

The `leo-signal` scenario kind analyses low Earth orbit (LEO) positioning, navigation and
timing (PNT) signals. It is not tied to one system. A signal is a parameterised design
(data, not code), so the same kind analyses a published commercial signal, a
representative design for a band nobody has published, or any design a scenario writes
inline. The `spectrum` kind now draws those designs too, in any band from ultra high frequency (UHF) to C, each
band with its own jammers.

Run the bundled examples:

- `kshana example leo-band-trade`: a UHF-to-wide-C band trade on representative designs;
- `kshana example xona-pulsar-signals`: the published Xona Pulsar X1 and X5 signals;
- `kshana example multi-band-jamming-waterfall`: UHF, L, S and C panels under per-band
  jammers (a `spectrum` scenario);
- `kshana scenarios/celeste-iod-classical-pilot-signals.toml`, from a checkout of the
  repository (not bundled): the Celeste In-Orbit Demonstration (IOD) bands and signal
  configuration presented at the European Space Agency (ESA) Navigation Innovation and
  Support Programme (NAVISP) LEO-PNT workshop, 2026 (see
  [Workshop parameters](#workshop-parameters) below).

Code: `src/leo_signal.rs` (signal designs, the kind), `src/navsignal.rs` (the closed forms),
`src/spectrum.rs` (the multi-band waterfall), preset files under `data/leo-signals/`.

## A signal design

| Part | What it holds |
|---|---|
| Band | centre frequency, transmit bandwidth (the spectrum is zero outside it), and the International Telecommunication Union (ITU) allocation: Radio Navigation Satellite Service (RNSS), Radio Determination Satellite Service (RDSS), Mobile Satellite Service (MSS), Earth Exploration-Satellite Service (EESS), a non-RNSS band, or other |
| Components | any subset of an **acquisition** component (short and low rate, easy to find), a **data** component (the navigation message) and a **pilot** component (data-free, for ranging) |
| Per component | modulation: binary phase-shift keying BPSK(n) at n × 1.023 Mchip/s (n may be a fraction, BPSK(1/3) is 341 kchip/s), binary offset carrier BOC(m,n), multiplexed BOC, or `FLAT(<MHz>)` for an orthogonal frequency-division multiplexing (OFDM) beacon; share of the power; frequency-division multiple access (FDMA) sub-carrier offsets; code length; data rate |
| Optional | reference and maximum received power, orbit altitude, `ranging = false` for a Doppler-only signal, notes on what is published and what is assumed |

A scenario takes signals from `presets = [...]` and from inline `[[signals]]` tables.
Without either it analyses the `generic-bands` preset.

## Presets

One file each under `data/leo-signals/`, compiled in, each citing its source URL. A value
the source does not publish is labelled REPRESENTATIVE in the file and in the report.

| Preset | Signals | Source | Stated approximations |
|---|---|---|---|
| `xona-pulsar` | `xona-x1` (1593.3225 MHz, 1.023 Mchip/s), `xona-x5` (1190.51625 MHz, 10.23 Mchip/s); minimum and maximum received power; 1080 km | PUBLIC, [arXiv 2509.19551](https://arxiv.org/abs/2509.19551) | enhanced Feher quadrature phase-shift keying (EFQPSK) drawn with the rectangular-chip BPSK envelope; code shift keying and overlay codes not modelled; transmit bandwidth = main lobe (not published) |
| `iridium-stl` | `iridium-stl` Satellite Time and Location (STL) bursts, quadrature phase-shift keying (QPSK) at 25 ksymbol/s, 780 km, Doppler and timing only | PUBLIC, [Resilient Navigation and Timing Foundation (RNTF) report](https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf) | carrier at the middle of 1616 to 1626 MHz; received power derived from the published 300 to 2400 times the Global Positioning System (GPS) |
| `starlink-soo` | `starlink-ku-beacon`, a 240 MHz OFDM beacon, Doppler only | PUBLIC, [NAVIGATION 72(1)](https://navi.ion.org/content/72/1/navi.685) | flat spectrum; channel centre and shell altitude REPRESENTATIVE; the published carrier-to-noise-density ratio (C/N₀) of about 57 dB-Hz is set through the receiver |
| `centispace` | `centispace-l1`, `centispace-l5`, BPSK at 2.046 Mchip/s | PUBLIC, [PubMed Central PMC10301026](https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/) | carriers placed at the GPS L1 and L5 carriers ("near" in the source); code length REPRESENTATIVE |
| `generic-c-band` | `generic-c-band-leo`, 5020 MHz, BPSK(10) in 20 MHz | REPRESENTATIVE, for C-band systems whose parameters are not public (such as TrustPoint) | the whole design |
| `generic-bands` | `generic-uhf`, `generic-l`, `generic-s`, `generic-c`, `generic-c-wide` | REPRESENTATIVE, allocations from the [ITU Radio Regulations](https://www.itu.int/pub/R-REG-RR) | the whole design |

The ATOMIC "zero-clock" polynomial ephemeris is a navigation-message model, not a signal
design, and lives with the navigation-message work, not here.

## What is computed per signal

- **Band-limited power spectral density (PSD)** and, per component, the fraction of its
  power the transmit band passes. For a BPSK component at the centre the closed form
  `η = (2/π)[Si(πBT_c) − sin²(πBT_c/2)/(πBT_c/2)]` sits beside the numeric value (90.3 %
  for the main lobe).
- **RMS (Gabor) bandwidth** of the tracked component inside the band, with the BPSK closed
  form `β² = [B/2 − sin(πBT_c)/(2πT_c)] / (π² T_c η)`.
- **Code-tracking thermal-noise jitter** of a delay lock loop (DLL) against C/N₀ and
  early-late correlator spacing, from the band-limited early-late formula of Betz and
  Kolodziejski (2009):
  `σ² = B_L(1 − ½B_L T) ∫ G sin²(πfΔ) df / [(2π)² (C/N₀) (∫ f G sin(πfΔ) df)²]`,
  coherent by default, with the non-coherent squaring loss on request. The report adds the
  unlimited-band textbook form (Kaplan and Hegarty) and the vanishing-spacing bound set by
  the Gabor bandwidth. The **ranging accuracy** is that jitter in metres at the reference
  C/N₀ and spacing.
- **Acquisition**: the largest satellite Doppler on an overhead pass at the elevation mask
  (`f v R_E cos(el) / ((R_E + h) c)`, circular orbit, no Earth rotation) plus the
  oscillator and user terms; Doppler bins of `2/(3T)`; code bins over one period; the
  detection probability of a square-law detector (generalised Marcum Q) at a per-cell
  false-alarm probability, centred and at the worst-case straddle; and the mean
  acquisition time of a serial and a code-parallel single-dwell search (Holmes).
- **Compatibility**: the spectral separation coefficient (SSC) of the band-limited signal
  into GPS L1 coarse/acquisition (C/A), Galileo E1, GPS L5, Galileo E5a, E5b and the E5
  alternative BOC (AltBOC) signal over each global navigation satellite system (GNSS)
  receiver band, the C/N₀ loss it causes at its received power, and the SSC and C/N₀
  loss of each GNSS signal into the LEO tracked component.
- **Jammer tolerance**: the jammer-to-signal power ratio (J/S) of a continuous-wave (CW) tone at the carrier, flat noise
  over the transmit band and noise matched to the tracked component that brings the
  tracked component to the tracking threshold, from the `spectrum` kind's own SSC code
  (`spectrum::Jammer::ssc`).

C/N₀ convention: the sweep and the reference are the **total in-band** C/N₀. A component's
share enters the tracking and jammer formulas as `10 log₁₀(s/η)` (its share of the
unfiltered power over the in-band fraction), the same convention the `spectrum` kind uses
for a plain band, whose modulation's power outside the receiver band is lost the same way.

## The band trade

`[trade]` puts every signal beside a reference signal: first-order ionospheric group delay
`40.3·TEC/f²` for a slant total electron content (TEC) you give (1 TECU = 10¹⁶
electrons/m²), free-space loss at a slant range, ranging accuracy at **equal C/N₀** and at
**equal effective isotropic radiated power (EIRP)** (C/N₀ minus the free-space-loss
difference, isotropic antennas at both ends), and the jammer tolerance at the equal-EIRP
C/N₀.

`scenarios/leo-band-trade.toml` (50 TECU, 1000 km, 45 dB-Hz, 0.5-chip coherent spacing,
1 Hz loop, 20 ms):

| Signal | Band | Iono delay | ΔFSPL vs L | Ranging, equal C/N₀ | C/N₀, equal EIRP | Ranging, equal EIRP | CW J/S tolerance |
|---|---|---|---|---|---|---|---|
| generic-uhf | 465 MHz, BPSK(5) | 93.19 m (×6.57) | −8.17 dB | 0.221 m | 53.17 dB-Hz | 0.086 m | 42.1 dB |
| generic-l | 1191.795 MHz, BPSK(10) | 14.19 m | 0 | 0.111 m | 45.00 dB-Hz | 0.111 m | 45.0 dB |
| generic-s | 2492.028 MHz, BPSK(5) | 3.25 m (×0.229) | +6.41 dB | 0.185 m | 38.59 dB-Hz | 0.388 m | 41.7 dB |
| generic-c | 5020 MHz, BPSK(10) | 0.80 m (×0.056) | +12.49 dB | 0.111 m | 32.51 dB-Hz | 0.465 m | 43.4 dB |
| generic-c-wide | 5100 MHz, BPSK(50) | 0.78 m (×0.055) | +12.63 dB | 0.022 m | 32.37 dB-Hz | 0.093 m | 50.3 dB |

The trade reads both ways. At equal C/N₀, ranging accuracy is set by the chip rate and the
band (wide C ranges five times finer than L). At equal radiated power the free-space loss
charges the higher bands in full: C band loses 12.5 dB of C/N₀ and ranges four times worse
than L, UHF gains 8.2 dB, while carrying 6.6 times the ionospheric delay. Wide C buys its
accuracy back with bandwidth. These rest on the representative designs and on isotropic
antennas; a directional user antenna at C band changes the equal-EIRP columns.

## Xona Pulsar

`scenarios/xona-pulsar-signals.toml` at the published minimum received powers against a
290 K antenna and a 2 dB noise figure (floor −201.98 dBW/Hz):

| | X1 | X5 |
|---|---|---|
| Reference C/N₀ | 53.78 dB-Hz | 57.08 dB-Hz |
| Ranging accuracy (0.5 chip, coherent, 1 Hz) | 0.402 m | 0.028 m |
| Maximum satellite Doppler, 1080 km | 33.2 kHz | 24.8 kHz |
| Doppler × code bins (1 ms, 0.5 chip) | 104 × 2046 | 78 × 20 460 |
| Mean code-parallel acquisition time | 0.15 s | 0.37 s |

X5 sits at 1190.51625 MHz, inside the Galileo E5 band: its SSC is −91.2 dB/Hz into Galileo
E5a and GPS L5, −103.2 dB/Hz into E5b and −86.2 dB/Hz into the AltBOC signal, and one X5
satellite at its minimum power raises a GNSS receiver's noise density by 0.0001 to 0.005 dB.
The X1 Doppler, 33.2 kHz, is inside the 32 to 34 kHz the paper reports (the VALIDATED
Doppler row below).

## The multi-band spectrum

The `spectrum` kind's `[[bands]]` now take, besides the five named GNSS bands:

- `signal = "<preset signal>"`: a preset design, drawn with every component, band-limited
  to its transmit bandwidth, received at the preset's reference power or
  `signal_power_dbw`. C/N₀ and J/S refer to the tracked component (`tracked_power_dbw` in
  the report);
- `centre_mhz` with `modulation` and `signal_power_dbw`: any custom band.

`[[panels]]` add waterfalls over other frequency ranges on the same timeline and colour
scale, and a `wideband` (barrage) jammer joins CW, narrowband, chirp and matched noise.
A plain band behaves exactly as before: the bundled L-band example still gives 43.48 and
3.23 dB-Hz for L1 C/A (pinned in `tests/leo_signal_reference.rs`).

`scenarios/multi-band-jamming-waterfall.toml` (60 s, one row per second):

| Band | Nominal C/N₀ | After its own jammer | Jammer |
|---|---|---|---|
| generic-uhf (465 MHz) | 49.41 dB-Hz | 34.38 dB-Hz from 10 s | CW at the carrier, −120 dBW |
| gps-l1ca | 43.48 dB-Hz | 3.38 dB-Hz from 20 s (lost) | 16 MHz chirp, 50 mW at 100 m |
| galileo-e5a | 46.98 dB-Hz | 38.76 dB-Hz from 30 s | 40 MHz barrage at 1185 MHz, −118 dBW |
| xona-x5 | 54.51 dB-Hz | 46.29 dB-Hz from 30 s | the same barrage |
| generic-s (2492.028 MHz) | 49.23 dB-Hz | 41.69 dB-Hz from 40 s | 2 MHz noise, −128 dBW |
| generic-c-band-leo (5020 MHz) | 47.41 dB-Hz | 40.35 dB-Hz from 50 s | matched noise, −124 dBW |

Each jammer takes only its own band; the test holds every other band at its nominal C/N₀
until its own jammer starts.

## Workshop parameters

`scenarios/celeste-iod-classical-pilot-signals.toml` holds the Celeste IOD frequency bands
and the "Classical Pilot" signal configuration #1 as presented at the ESA NAVISP LEO-PNT
workshop, 2026, with a shape check of one design against the measured spectrum shown
there. It is one of the Celeste IOD preset's files (the others are `src/celeste_iod.rs` and
the other `scenarios/*celeste-iod*.toml`); no Celeste signal specification is public. Its components carry their assumptions (power splits, code
lengths, FDMA offsets, and a representative modulation for the bands whose modulation was
not presented). The shape check is MODELLED consistency: it compares shapes, not
calibrated levels.

It is withheld with the rest of the preset: delete `src/celeste_iod.rs` and the
`scenarios/*celeste-iod*.toml` files. Nothing compiles the scenario in: the command-line
interface lists it as a repository-only scenario (`kshana example` names it and explains,
rather than printing it), and a test refuses any `include_str!` of it. Every other
scenario, test and oracle runs without it; the test that reads it passes with a note when
it is absent, and the README's scenario-file count still counts it.

## Evidence

| Claim | Label | Oracle |
|---|---|---|
| BPSK power in band (90.3 % in the main lobe); band-limited early-late jitter reducing to the textbook coherent and non-coherent forms and to its Gabor bound; BPSK self-SSC 2/(3 R_c) | VALIDATED | Kaplan & Hegarty, Betz & Kolodziejski 2009, Betz 2001, Abramowitz & Stegun Table 5.1 |
| Band-limited Gabor bandwidth closed form; offset BPSK SSC at non-zero offset; AltBOC unit area (all within the row above, as cross-checks) | internal consistency | derived here, checked against quadrature |
| Maximum LEO Doppler | VALIDATED | Xona Pulsar X1 32 to 34 kHz (arXiv 2509.19551); Iridium ±36 kHz (RNTF) |
| `leo-signal` designs, acquisition, compatibility, jammer tolerance, trade, shape checks | MODELLED | the validated closed forms, the detector identity P_d(0) = P_fa, Holmes's mean time, the spectrum kind's own SSC chain |
| Multi-band spectrum | MODELLED | reduction to the unchanged spectrum and jamming chains |

## Not modelled

- The exact spectra of EFQPSK, code shift keying and OFDM.
- Spreading-code line structure and multiple-access cross-correlation.
- Transmit and receive filters beyond an ideal brick wall: no out-of-band emission.
- Multipath, quantisation and automatic gain control.
- Earth rotation in the Doppler bound (up to about 0.46 km/s of range rate).
- Ionospheric delay beyond first order, and the split of electron content above and below
  a LEO satellite: the slant TEC is an input.
- Atmospheric, rain and polarisation losses.
- Multi-dwell acquisition logic.
- Aggregate interference beyond a per-satellite count.

## References

- J. W. Betz and K. R. Kolodziejski, "Generalized Theory of Code Tracking with an
  Early-Late Discriminator, Part I," *IEEE Transactions on Aerospace and Electronic
  Systems* 45(4), 2009.
- J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," *NAVIGATION* 48(4),
  2001.
- E. D. Kaplan and C. J. Hegarty (eds.), *Understanding GPS/GNSS*, 3rd ed., Artech House,
  2017.
- J. K. Holmes, *Coherent Spread Spectrum Systems*, Wiley, 1982.
- M. Abramowitz and I. A. Stegun, *Handbook of Mathematical Functions*, 1964, §5.2 and
  Table 5.1.
- Galileo Open Service Signal-in-Space Interface Control Document; IS-GPS-200; IS-GPS-705.
- Leclère, Marathe and Reid, ION GNSS+ 2025, <https://arxiv.org/abs/2509.19551>.
- Resilient Navigation and Timing Foundation, *Recent PNT Improvements and Test Results
  Based on Low Earth Orbit Satellites*,
  <https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf>.
- Kozhaya, Saroufim and Kassas, *NAVIGATION* 72(1), 2025,
  <https://navi.ion.org/content/72/1/navi.685>.
- CentiSpace: <https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/>.
- ESA Celeste IOD facts:
  <https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures>.
- ITU Radio Regulations: <https://www.itu.int/pub/R-REG-RR>.
