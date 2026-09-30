# Spectrum model and waterfall

The `spectrum` scenario kind builds the Global Navigation Satellite System (GNSS) L band,
and any other band a designed signal occupies (ultra-high frequency (UHF), S band, C band),
as one power spectral density (PSD), lets it change over a scripted jammer timeline, and reduces it to what a tracking loop cares about: the jammer-to-signal ratio
(J/S) and the effective carrier-to-noise density ratio (C/N₀) of each band. It draws the
result as a waterfall (frequency across, time down, colour for power) beside per-band
C/N₀ bars, and it reads and writes Signal Metadata Format (SigMF) recordings so a real
capture can be estimated and plotted beside the model.

Write the bundled example to a file and run it:

```bash
kshana example l-band-waterfall-jamming > l-band-waterfall-jamming.toml
kshana l-band-waterfall-jamming.toml
# writes .result.json, .chart.svg, .report.html and .report.json next to the file
```

In a checkout, `kshana scenarios/l-band-waterfall-jamming.toml` runs the same file.

Code: `src/spectrum.rs` (the model, the kind, the Welch estimator), `src/sigmf.rs` (the
recording codec), `src/navsignal.rs` (the unit-area signal spectra and the spectral
separation coefficient) and `src/leo_signal.rs` (the signal-design presets a band can
name).

## What is modelled

| Band | Carrier | Modulation | Default received power | Default receiver bandwidth |
|---|---|---|---|---|
| `gps-l1ca` | 1575.42 MHz | binary phase-shift keying, BPSK(1) | −158.5 dBW (IS-GPS-200) | 2.046 MHz |
| `galileo-e1` | 1575.42 MHz | multiplexed binary offset carrier, MBOC(6,1,1/11), or binary offset carrier BOC(1,1) | −157.0 dBW (Galileo OS SIS ICD) | 14.322 MHz |
| `gps-l2c` | 1227.60 MHz | BPSK(1) (CM and CL codes time-multiplexed) | −160.0 dBW (IS-GPS-200) | 2.046 MHz |
| `gps-l5` | 1176.45 MHz | BPSK(10) | −157.9 dBW (IS-GPS-705) | 20.46 MHz |
| `galileo-e5a` | 1176.45 MHz | BPSK(10) | −155.0 dBW (Galileo OS SIS ICD) | 20.46 MHz |

GPS (Global Positioning System) L1 C/A is the coarse/acquisition code; L2C is the L2
civil signal; IS-GPS-200 and IS-GPS-705 are the GPS interface specifications; Galileo OS
SIS ICD is the Galileo Open Service Signal-in-Space Interface Control Document. The
received powers are the specification minimums; the bandwidths are modelling choices. Both
can be overridden per band. With no `[[bands]]` table the run uses these five. GLONASS
G1/G2, BeiDou B1/B2 and Galileo E6 are **not** among the named bands.

A `[[bands]]` entry takes one of three forms:

- a name from the table above, with optional `signal_power_dbw`, `rx_bandwidth_mhz` and,
  for `galileo-e1`, `modulation = "boc11"`;
- `signal = "<preset>"`: a low Earth orbit (LEO) or representative signal design from the
  preset library of the `leo-signal` kind ([LEO-SIGNAL.md](LEO-SIGNAL.md)), in any band, drawn with every component (acquisition,
  data, pilot, frequency-division sub-carriers) and band-limited to its transmit bandwidth;
  C/N₀ and J/S are referred to the tracked component, and `name` only labels it. The
  presets are `xona-x1`, `xona-x5`, `iridium-stl`, `starlink-ku-beacon`, `centispace-l1`,
  `centispace-l5`, `generic-c-band-leo`, `generic-uhf`, `generic-l`, `generic-s`,
  `generic-c` and `generic-c-wide`;
- a custom band: any `name` with `centre_mhz`, `modulation` (`BPSK(n)`, `BOC(m,n)` or
  `MBOC(6,1,p)`) and `signal_power_dbw`.

Jammers (`[[jammers]]`) take a `waveform`:

- `cw` — a continuous-wave (CW) tone at `centre_mhz`;
- `narrowband` — flat noise over `bandwidth_mhz`;
- `wideband` — flat noise over a wide `bandwidth_mhz` (a barrage jammer): the same
  density as `narrowband`, named apart because the `jamming` kind scores it as broadband;
- `chirp` — a linear sawtooth sweep of `bandwidth_mhz` every `sweep_period_us`;
- `matched` — broadband noise whose spectrum is the `matched_to` band's own modulation.

Each gives either `received_power_dbw`, or an effective isotropic radiated power
`eirp_dbw` with a `range_m` (and optionally `rx_gain_dbi`), which goes through the
`jamming` kind's free-space path loss. `on_s` and `off_s` script the timeline.

The receiver (`[receiver]`) sets the noise floor, `N₀ = k·T_sys` with
`T_sys = T_ant + 290 K × (F − 1)` for antenna temperature `T_ant` and noise figure `F`,
and the tracking threshold.

The main waterfall covers `[grid]` (default 1160 to 1590 MHz in 430 bins). Each
`[[panels]]` entry (`name`, `f_min_mhz`, `f_max_mhz`, `n_freq`, default 200 bins) adds
another waterfall over its own frequency range on the same timeline, for a spectrum that
spans several bands.

## The interference chain

For a signal of unit-area spectrum `G_s` and a jammer of unit-power spectrum `G_j`, the
spectral separation coefficient (SSC) over the receiver band `B` is
`κ = ∫_B G_s(f) G_j(f) df`, and the effective carrier-to-noise density with several
jammers is

    (C/N₀)_eff = [ 1/(C/N₀) + Σ_j (J/S)_j · κ_j ]⁻¹

(Betz 2001; Kaplan & Hegarty, *Understanding GPS/GNSS*, 3rd ed., §9.4). For one jammer
this is exactly the `jamming` kind's anti-jam equation with `Q = 1/(R_c κ)`; the report's
`jamming_kind_cross_check` block runs the `jamming` kind's own functions on the same link
inputs and prints the difference, which is zero to rounding.

The report also prints the C/N₀ the `jamming` kind gives with its representative Q table.
That table (broadband 1.0, CW 1.5) is not what the spectra give: a CW tone on the C/A
carrier has `κ = T_c`, so `Q = 1`, and noise matched to C/A has `κ = 2/(3R_c)`, so
`Q = 1.5`, the textbook values. In the bundled example the difference is 1.8 dB of C/N₀
for the tone (17.98 against 19.74 dB-Hz).

Each waterfall cell is the PSD averaged over its frequency bin and its row. A chirp is
averaged exactly over the row, whole sweeps plus the partial one; a jammer switching on
or off mid-row is weighted by its duty. The C/N₀ timeline uses the same averages, so the
picture and the numbers agree. Per band, the timeline reports the in-band J/S (jammer
power inside the receiver bandwidth over the signal power). Per jammer and band, the
report gives the SSC, `Q`, total J/S, in-band J/S and the steady C/N₀.

## The bundled example

`scenarios/l-band-waterfall-jamming.toml`: a 60 s timeline, one row per second, a 290 K
antenna and a 2 dB noise figure (floor −201.98 dBW/Hz).

- 10 s to 40 s: a 16 MHz chirp around L1, 9 µs sweeps, 50 mW at 100 m.
- From 30 s: a CW tone on the L1 carrier, 10 mW at 1 km.
- From 45 s: flat 2 MHz noise on L2 received at −135 dBW.

What the run computes:

| Band | Nominal C/N₀ | Minimum C/N₀ | First loss | Rows tracking |
|---|---|---|---|---|
| gps-l1ca | 43.48 dB-Hz | 3.23 dB-Hz | 10 s | 17 % |
| galileo-e1 | 44.98 dB-Hz | 4.69 dB-Hz | 10 s | 50 % |
| gps-l2c | 41.98 dB-Hz | 36.86 dB-Hz | never | 100 % |
| gps-l5 | 44.08 dB-Hz | 44.08 dB-Hz | never | 100 % |
| galileo-e5a | 46.98 dB-Hz | 46.98 dB-Hz | never | 100 % |

The CW tone is why the two L1 signals part company at 40 s. It lands on the peak of the
C/A spectrum and holds C/A at 17.98 dB-Hz, below the 25 dB-Hz threshold. It lands in the
null of the MBOC spectrum, so Galileo E1 returns to its nominal C/N₀ when the chirp stops.

The signals themselves sit about 20 dB below the noise floor, so the waterfall shows the
floor and the jammers; the C/N₀ bars show what despreading recovers.

The same jammers drive a chained mission in
`scenarios/campaign-spectrum-holdover-integrity.toml` (see [CAMPAIGNS.md](CAMPAIGNS.md)):
the clock holds over while the chirp is on, and the receiver falls back to Galileo E1
under the CW tone.

## Beyond the L band

`scenarios/multi-band-jamming-waterfall.toml` puts LEO positioning, navigation and timing
(PNT) signals in four bands beside GPS L1 C/A and Galileo E5a, each
band with its own jammer, on a 60 s timeline. The `[grid]` waterfall is the L band; three
`[[panels]]` add UHF (455 to 475 MHz), S (2482 to 2502 MHz) and C (5005 to 5035 MHz).

- 10 s: a CW tone at the UHF carrier, −120 dBW received.
- 20 s: the chirp of the L-band example (16 MHz around L1, 9 µs sweeps, 50 mW at 100 m).
- 30 s: wideband noise, 40 MHz around 1185 MHz, −118 dBW.
- 40 s: narrowband noise, 2 MHz at the S carrier, −128 dBW.
- 50 s: noise matched to the C-band signal's own spectrum, −124 dBW.

What the run computes (the designed signals' C/N₀ is that of the tracked component, so the
nominal value sits below the total received power by the tracked share):

| Band | Signal | Carrier | Nominal C/N₀ | Minimum C/N₀ | Rows tracking |
|---|---|---|---|---|---|
| generic-uhf | representative, BPSK(5), −150 dBW | 465 MHz | 49.41 dB-Hz | 34.38 dB-Hz | 100 % |
| gps-l1ca | specification minimum | 1575.42 MHz | 43.48 dB-Hz | 3.38 dB-Hz | 33 % |
| galileo-e5a | specification minimum | 1176.45 MHz | 46.98 dB-Hz | 38.76 dB-Hz | 100 % |
| xona-x5 | published design, −144.9 dBW | 1190.51625 MHz | 54.51 dB-Hz | 46.29 dB-Hz | 100 % |
| generic-s | representative, BPSK(5), −150 dBW | 2492.028 MHz | 49.23 dB-Hz | 41.69 dB-Hz | 100 % |
| generic-c-band-leo | representative, BPSK(10), −152 dBW | 5020 MHz | 47.41 dB-Hz | 40.35 dB-Hz | 100 % |

Only the chirp takes a signal away (GPS L1 C/A, from 20 s). Each other jammer degrades only
the band its spectrum reaches: the C-band matched noise, for instance, has an SSC of
−71.87 dB/Hz with the C-band signal and below −133 dB/Hz with every other band.

The same machinery drives the LEO-PNT resilience scenarios ([LEO-PNT.md](LEO-PNT.md#resilience)):

- `scenarios/leo-resilience-js-margin.toml` steps one 40 MHz barrage jammer at 1185 MHz by
  5 dB every 10 s from −125 dBW. GPS L5 is lost at the −105 dBW step, Galileo E5a at
  −100 dBW and Xona X5 at −95 dBW, while a representative LEO L-band signal received at
  −135 dBW still tracks at −90 dBW: received power buys J/S margin dB for dB.
- `scenarios/leo-resilience-multiband-diversity.toml` is a campaign sweep of a `spectrum`
  run over the power of an L5-band barrage ([CAMPAIGNS.md](CAMPAIGNS.md)).
- `scenarios/leo-resilience-gnss-jammed-leo-carries.toml` is a chained campaign whose
  phases read the GNSS and LEO C/N₀ from `spectrum` runs, with S- and C-band panels.

## IQ, SigMF and Welch

`[iq]` draws the model at one instant as complex in-phase and quadrature (IQ) samples,
writes them as a SigMF recording (`cf32_le` or `ci16_le`), reads the recording back and
estimates its PSD by Welch's method (Hann window, 50 % overlap, averaged periodograms,
density-scaled). Thermal noise, signals and noise-like jammers are drawn bin by bin from
the model's own density; a tone and a chirp are drawn as real waveforms. With only
noise-like jammers the Welch estimate sits within 0.1 dB of the model (median). A
periodic chirp is a line spectrum at its sweep rate, with ripple and tails past its band
edges that the smooth model omits: in the bundled example total power agrees within 0.02 %
and the median bin differs by 0.5 dB.

`[recording]` (native builds only) reads a real SigMF recording from `meta_path` (the
data file defaults to the same stem with `.sigmf-data`), estimates its PSD and prints it
beside the model at the recording's frequencies. A SigMF file has no absolute power
calibration, so the report gives the median offset and the shape, not a level.

In the WebAssembly build the file reads are unavailable; `kshana::sigmf::read` and
`kshana::spectrum::welch_psd` work on bytes the page supplies.

## Evidence

| Claim | Label | Oracle |
|---|---|---|
| Signal PSDs and SSCs | VALIDATED | BPSK(n) main lobe 2n × 1.023 MHz null to null; BOC(1,1) lobes centred at ±1.023 MHz (Betz 2001); SSCs −61.86 / −64.87 / −67.88 dB/Hz for C/A×C/A, BOC(1,1)×BOC(1,1), C/A×BOC(1,1) from their Parseval closed forms, the values behind the published −61.8 / −64.8 / −67.8 dB/Hz; Q = 1 (CW) and 1.5 (matched) (Kaplan & Hegarty §9.4) |
| Waterfall, J/S and C/N₀ timeline | MODELLED | Reduces exactly to the `jamming` kind's chain; the jammer powers, timeline and bandwidths are inputs |
| SigMF codec and Welch estimate | MODELLED | Round trips, a direct discrete Fourier transform, white-noise and Parseval identities; no third-party recording is in the repository |
| Multi-band waterfall with designed signals and per-band jammers | MODELLED | Reduces to the L-band chain (a single-component band gives the same numbers as before the extension) and to the validated signal spectra; the designed signals, jammers and bandwidths are inputs |

One correction to a common shorthand: the BOC(1,1) spectrum's lobes are *centred* at
±1.023 MHz (between the carrier null and the null at 2.046 MHz), but the maximum of the
PSD is at ±0.759 MHz, where `tan y = 2y` with `y = πf/(2R_c)`. The tests pin both.

## Not modelled

- Spreading-code line structure (the 1 kHz lines of C/A): a tone is scored against the
  smooth envelope, not the nearest code line.
- Automatic gain control, quantisation, pulse blanking and notch filtering.
- The receive-antenna pattern toward the jammer beyond one gain figure.
- Multiple-access interference between satellites of one band.
- A designed signal's emissions outside its transmit bandwidth: its spectrum is truncated
  there, so no out-of-band emission reaches a neighbouring band.
- A chirp's effect on the loop at sweep rates comparable with the loop bandwidth: its
  C/N₀ uses the row-averaged spectrum.

## References

- J. W. Betz, "Binary Offset Carrier Modulations for Radionavigation," *NAVIGATION*
  48(4), 2001.
- E. D. Kaplan and C. J. Hegarty (eds.), *Understanding GPS/GNSS: Principles and
  Applications*, 3rd ed., Artech House, 2017, §9.4.
- G. W. Hein et al., "MBOC: The New Optimized Spreading Modulation Recommended for
  Galileo L1 OS and GPS L1C," *Inside GNSS*, May/June 2006.
- P. D. Welch, "The Use of Fast Fourier Transform for the Estimation of Power Spectra,"
  *IEEE Transactions on Audio and Electroacoustics* 15(2), 1967.
- IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.
- SigMF specification, <https://sigmf.org/> (source: <https://github.com/sigmf/SigMF>).
