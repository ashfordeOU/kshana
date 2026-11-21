<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Terrestrial signals of opportunity: receiver clock offset

`kshana soop-clock` estimates a receiver clock's offset and rate against a terrestrial transmitter's time
base from recorded LTE downlink signals, and an oscillator's frequency offset from any cyclic-prefix OFDM
broadcast (DVB-T, LTE). It is a **timing** library: the transmitter's and the receiver's positions are
inputs, so the signal travel time is known. Nothing here estimates a position, locates a transmitter or
transmits.

```
kshana soop-clock lte <capture.sigmf-meta> --start-gps-s <t> --rx <lat,lon,h> --tx <lat,lon,h>
    [--tx-offset-ns <ns>] [--prior-offset-s <s>] [--carrier-hz <f>] [--min-metric <m>] [--out <file.json>]
kshana soop-clock cp <capture.sigmf-meta> --nfft <n> --ncp <n> [--carrier-hz <f>] [--out <file.json>]
kshana soop-clock synth-lte --out <base> [--fs <hz>] [--duration-s <s>] [--nid2 <0|1|2>]
    [--delay-s <s>] [--cfo-hz <f>] [--snr-db <d>] [--seed <s>]
```

Captures are SigMF recordings (`cf32_le`, `ci16_le`, `ci8`). **MODELLED**: tested on synthetic captures
only; no real capture is bundled.

## LTE: the primary synchronisation signal

The PSS is a length-62 Zadoff–Chu sequence of root 25, 29 or 34 (`N_ID^(2)` = 0, 1, 2; 3GPP TS 36.211
§6.11.1.1) on the 62 subcarriers nearest the unused DC subcarrier (§6.11.1.2), in the last OFDM symbol of
slots 0 and 10 of a frequency-division-duplex frame: every 5 ms. With the normal cyclic prefix its useful
part starts 13 312 basic time units (`T_s = 1/30.72 MHz`), 433.33 µs, after the half-frame boundary.
`lte` synthesises the template at the capture's own sample rate, correlates the capture against the three
roots over the first 5 ms, then follows the strongest root every 5 ms, refining each peak by a parabola
through the correlation magnitude. On synthetic captures at 1.92 MHz and 20 dB SNR every detection is
within a tenth of a sample (52 ns) of the injected arrival (`tests/soop_clock.rs`).

## Clock offset

If the transmitter's half-frames start at multiples of 5 ms of GPS time plus a stated offset
(`--tx-offset-ns`), the k-th PSS is sent at `T_k = k·5 ms + 433.33 µs + offset_tx` and arrives at
`T_k + range/c`, with the range from the two stated positions. The receiver reads the arrival as
`t_capture + τ` (`--start-gps-s` is the receiver-clock time of the first sample), so the receiver clock
offset is `t_capture + τ − T_k − range/c`. It is known only modulo 5 ms: the value nearest
`--prior-offset-s` (default 0, so offsets within ±2.5 ms) is taken. A straight line through all
detections gives the offset at the capture start and the rate (s/s), each with a standard uncertainty
from the residuals. On synthetic captures (15 dB SNR, 300 Hz frequency offset) injected offsets of
1.5 µs, −7.25 µs and 1 ms are recovered within 30 ns.

Whether a transmitter's frames are aligned to GPS time, and with what offset, is the user's statement:
time-division LTE networks are synchronised, many frequency-division ones are not. The result is only as
good as that statement. Multipath delays the correlation peak and biases the offset late.

The carrier frequency offset is measured from the cyclic prefixes with the symbol boundaries placed by
the PSS detections (each prefix correlated with the end of its symbol, `Δf = −∠γ·15 kHz/2π`), for sample
rates that are whole multiples of 1.92 MHz; with `--carrier-hz` it is also stated as the receiver
oscillator's fractional frequency offset.

## Any cyclic-prefix OFDM: `cp`

The maximum-likelihood estimator of van de Beek, Sandell and Börjesson (IEEE Trans. Signal Processing
45(7), 1997), in its high-SNR form, over all symbols of the capture: the symbol start modulo the symbol
period, and the frequency offset as a fraction of the subcarrier spacing (unambiguous within half of it).
Every symbol must carry the same prefix length, as in DVB-T (2k or 8k mode with its guard interval; at the
64/7 MHz DVB-T rate the 2k mode is `--nfft 2048` and a 1/4 guard interval `--ncp 512`); LTE's longer
first prefix of each slot biases it, which is why `lte` uses the PSS-placed estimate. DVB-T gives no
absolute time without decoding its frame, so `cp` states the frequency offset and the symbol timing only.
On a synthetic DVB-T-like 2k signal the symbol start is exact and the offset within 0.001 of a subcarrier.

## The test signal: `synth-lte`

A synthetic capture with the PSS in its LTE positions and random QPSK on the 72 central subcarriers
elsewhere, normal cyclic prefix, delayed by a fractional delay, shifted by a frequency offset, in white
noise at a stated SNR over the occupied band. **A test signal, not a conformant LTE downlink**; its SigMF
description says so.

## Tests

`tests/soop_clock.rs`: PSS timing within a tenth of a sample for three roots and delays; injected
receiver clock offsets recovered within 30 ns and the 5 ms ambiguity resolved by the prior; LTE frequency
offsets within 20 Hz; DVB-T-like symbol timing and frequency offset; the command line. Unit tests: PSS
sequences (unit modulus, cross-correlation between roots), the 13 312 `T_s` PSS position, the line fit.
