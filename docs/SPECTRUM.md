# L-band spectrum model and waterfall

The `spectrum` scenario kind builds the whole Global Navigation Satellite System (GNSS)
L band as one power spectral density (PSD), lets it change over a scripted jammer
timeline, and reduces it to what a tracking loop cares about: the jammer-to-signal ratio
(J/S) and the effective carrier-to-noise density ratio (C/N₀) of each band. It draws the
result as a waterfall (frequency across, time down, colour for power) beside per-band
C/N₀ bars, and it reads and writes Signal Metadata Format (SigMF) recordings so a real
capture can be estimated and plotted beside the model.

Run the bundled example with `kshana example l-band-waterfall-jamming`.

Code: `src/spectrum.rs` (the model, the kind, the Welch estimator), `src/sigmf.rs` (the
recording codec) and `src/navsignal.rs` (the unit-area signal spectra and the spectral
separation coefficient).

## What is modelled

| Band | Carrier | Modulation | Default received power | Default receiver bandwidth |
|---|---|---|---|---|
| `gps-l1ca` | 1575.42 MHz | binary phase-shift keying, BPSK(1) | −158.5 dBW (IS-GPS-200) | 2.046 MHz |
| `galileo-e1` | 1575.42 MHz | multiplexed binary offset carrier, MBOC(6,1,1/11), or BOC(1,1) | −157.0 dBW (Galileo OS SIS ICD) | 14.322 MHz |
| `gps-l2c` | 1227.60 MHz | BPSK(1) (CM and CL codes time-multiplexed) | −160.0 dBW (IS-GPS-200) | 2.046 MHz |
| `gps-l5` | 1176.45 MHz | BPSK(10) | −157.9 dBW (IS-GPS-705) | 20.46 MHz |
| `galileo-e5a` | 1176.45 MHz | BPSK(10) | −155.0 dBW (Galileo OS SIS ICD) | 20.46 MHz |

GPS L1 C/A is the coarse/acquisition code; L2C is the L2 civil signal; Galileo OS SIS
ICD is the Galileo Open Service Signal-in-Space Interface Control Document. The received
powers are the specification minimums; the bandwidths are modelling choices. Both can be
overridden per band. GLONASS G1/G2, BeiDou B1/B2 and Galileo E6 are **not** modelled.

Jammers (`[[jammers]]`) take a `waveform`:

- `cw` — a continuous-wave (CW) tone at `centre_mhz`;
- `narrowband` — flat noise over `bandwidth_mhz`;
- `chirp` — a linear sawtooth sweep of `bandwidth_mhz` every `sweep_period_us`;
- `matched` — broadband noise whose spectrum is the `matched_to` band's own modulation.

Each gives either `received_power_dbw`, or an effective isotropic radiated power
`eirp_dbw` with a `range_m` (and optionally `rx_gain_dbi`), which goes through the
`jamming` kind's free-space path loss. `on_s` and `off_s` script the timeline.

The receiver (`[receiver]`) sets the noise floor, `N₀ = k·T_sys` with
`T_sys = T_ant + 290 K × (F − 1)` for antenna temperature `T_ant` and noise figure `F`,
and the tracking threshold.

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

One correction to a common shorthand: the BOC(1,1) spectrum's lobes are *centred* at
±1.023 MHz (between the carrier null and the null at 2.046 MHz), but the maximum of the
PSD is at ±0.759 MHz, where `tan y = 2y` with `y = πf/(2R_c)`. The tests pin both.

## Not modelled

- Spreading-code line structure (the 1 kHz lines of C/A): a tone is scored against the
  smooth envelope, not the nearest code line.
- Automatic gain control, quantisation, pulse blanking and notch filtering.
- The receive-antenna pattern toward the jammer beyond one gain figure.
- Multiple-access interference between satellites of one band.
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
- SigMF specification, <https://github.com/sigmf/SigMF>.
