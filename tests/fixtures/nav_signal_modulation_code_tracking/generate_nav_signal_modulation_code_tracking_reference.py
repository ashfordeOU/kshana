#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for kshana's nav-signal modulation /
code-tracking analysis (`src/navsignal.rs`).

This generator builds a GENUINE external oracle from two independent sources:

PART (a) — GPS C/A Gold-code correlation (EMPIRICAL, strongly external)
----------------------------------------------------------------------
The oracle is the **IS-GPS-200 (NAVSTAR GPS Space Segment / Navigation User
Interfaces) C/A-code definition**: two 10-stage maximal-length LFSRs G1 and G2
with the polynomials and the G2 phase-selector tap table published in the
Interface Specification (IS-GPS-200, Table 3-Ia / 3-I "Code Phase Assignments").
We generate the *actual* 1023-chip C/A code sequences for PRN 1..8, then compute
the EXACT INTEGER periodic auto/cross-correlation of those real sequences (sum of
products of +-1 chips, which is an integer in [-1023, 1023]).

Gold's theorem (Gold 1967; Sarwate & Pursley, Proc. IEEE 1980) proves that for a
preferred pair of degree-n m-sequences the periodic cross-correlation and the
off-peak autocorrelation take only the three values {-1, -t(n), t(n)-2} where
t(n) = 1 + 2^floor((n+2)/2). For n = 10 that is t(10) = 65 and the three-valued
set is {-1, -65, 63}, so the maximum magnitude of any off-peak correlation is
exactly 65. kshana's `CodeFamily::Gold{n:10}` reports `max_crosscorr() = 65/1023`
and `max_autocorr_sidelobe() = 65/1023` from the t(n)/L closed form. Here we do
NOT trust that closed form: we generate the real codes from the IS-GPS-200 taps
and MEASURE the integer correlations, then confront kshana's bound with the
measured maxima. The IS-GPS-200 code construction is wholly independent of
kshana's code (kshana never generates a sequence; it only returns the bound), so
this is a true external check that the analytic bound matches reality.

We emit, per PRN and per PRN-pair:
  * the measured max |autocorrelation sidelobe| (off-peak), an integer,
  * the measured set of distinct off-peak autocorrelation values,
  * the measured max |cross-correlation| over all relative shifts, an integer,
  * the measured set of distinct cross-correlation values.
We also emit the first 10 chips and an octal first-10-chip word for PRN 1..8 so
the codes can be byte-checked against the IS-GPS-200 published "first 10 chips"
column (Table 3-Ia), pinning the generator to the spec.

PART (b) — Baseband PSD shape (scipy.signal.periodogram, PARTIAL/numerical)
--------------------------------------------------------------------------
The oracle is scipy 1.18 `scipy.signal.periodogram` (Virtanen et al., Nature
Methods 2020). We synthesise a long random-chip BPSK-R(1) and sine-BOC(1,1)
baseband waveform at a high sample rate, estimate its one-sided PSD with
Welch-free periodogram averaging over many code epochs, normalise it to unit
area, and sample the normalised empirical PSD on a grid of frequency offsets out
to +-12*Rc. kshana's `Modulation::psd` is the Betz-2001 closed form; the test
compares the two PSD shapes (RMS over the grid). This is PARTIAL: a periodogram of
a finite random waveform is itself a noisy estimate of the true PSD (its variance
does not vanish), so it validates the *shape* of the closed form to a few percent,
not to machine precision. We also emit the empirical BPSK self spectral-separation
coefficient kappa = integral G^2 df estimated from the same periodogram, to
confront kshana's analytic 2/(3 Rc).

Honest scope: PART (a) is a strong external dataset check (real IS-GPS-200 codes,
exact integers). PART (b) is a partial numerical cross-check of the PSD shape; the
DLL-jitter and multipath-envelope models in navsignal are NOT validated here (they
have their own internal directional tests) and the capability stays MODELLED.

Reproduce (offline, no kshana code involved):

    /tmp/kshana-oracles/.venv/bin/python \
        generate_nav_signal_modulation_code_tracking_reference.py \
        > nav_signal_modulation_code_tracking_reference.txt

Generated with numpy + scipy.signal.periodogram. The Gold-code part uses only the
IS-GPS-200 G2 tap table (transcribed below); no third-party GNSS library.
"""

import numpy as np
from scipy.signal import periodogram

F0 = 1_023_000.0  # Hz, the GPS/Galileo chip-rate base unit f0 = 1.023 MHz
L = 1023          # C/A code length = 2^10 - 1 chips
N = 10            # LFSR register length

# ---------------------------------------------------------------------------
# IS-GPS-200 C/A code generation.
#
# G1 generator polynomial: 1 + x^3 + x^10  (taps at stages 3 and 10)
# G2 generator polynomial: 1 + x^2 + x^3 + x^6 + x^8 + x^9 + x^10
# Both registers initialised all-ones. The C/A code is G1 XOR (delayed G2),
# where the G2 delay is realised by XOR-ing two G2 register stages selected by
# the PRN-specific "code phase selection" taps from IS-GPS-200 Table 3-Ia.
#
# PRN -> (G2 tap stage a, G2 tap stage b), stages numbered 1..10.
# (IS-GPS-200, Table 3-Ia "Code Phase Assignments"; the canonical first 8.)
# ---------------------------------------------------------------------------
G2_TAPS = {
    1: (2, 6),
    2: (3, 7),
    3: (4, 8),
    4: (5, 9),
    5: (1, 9),
    6: (2, 10),
    7: (1, 8),
    8: (2, 9),
}

# IS-GPS-200 Table 3-Ia "First 10 Chips (Octal)" column for PRN 1..8, the spec's
# own pin for a correct generator. (Octal of the first 10 chips, MSB = chip 1.)
SPEC_FIRST10_OCTAL = {
    1: 1440,
    2: 1620,
    3: 1710,
    4: 1744,
    5: 1133,
    6: 1455,
    7: 1131,
    8: 1454,
}


def ca_code(prn: int) -> np.ndarray:
    """Generate the 1023-chip GPS C/A code for `prn` as a +1/-1 numpy array.

    Implements the IS-GPS-200 G1/G2 LFSRs exactly. Returns the bipolar code
    (logical 1 -> -1, logical 0 -> +1 per the usual NRZ mapping; the absolute
    polarity is irrelevant to |correlation|, but we keep the IS-GPS-200 mapping
    so the octal first-10-chip pin matches the spec's published values).
    """
    a, b = G2_TAPS[prn]
    g1 = [1] * N  # stages g1[0]=stage1 .. g1[9]=stage10, all-ones init
    g2 = [1] * N
    code = np.empty(L, dtype=np.int8)
    for i in range(L):
        # Output chip: G1 output (stage 10) XOR selected G2 phase.
        g2_phase = g2[a - 1] ^ g2[b - 1]
        chip = g1[N - 1] ^ g2_phase
        code[i] = chip
        # G1 feedback: taps at stages 3 and 10 (poly 1 + x^3 + x^10).
        fb1 = g1[2] ^ g1[9]
        # G2 feedback: taps 2,3,6,8,9,10 (poly 1 + x^2+x^3+x^6+x^8+x^9+x^10).
        fb2 = g2[1] ^ g2[2] ^ g2[5] ^ g2[7] ^ g2[8] ^ g2[9]
        # Shift right (stage10 <- stage9 <- ... <- stage1 <- feedback).
        g1 = [fb1] + g1[:-1]
        g2 = [fb2] + g2[:-1]
    # Map logical {0,1} -> NRZ {+1,-1}.
    return np.where(code == 0, 1, -1).astype(np.int64)


def first10_octal(code_logical_bits) -> int:
    """Octal of the first 10 logical chips, MSB first (for the spec pin)."""
    val = 0
    for bit in code_logical_bits[:10]:
        val = (val << 1) | int(bit)
    return int(oct(val)[2:])


def periodic_corr(x: np.ndarray, y: np.ndarray) -> np.ndarray:
    """Exact integer periodic cross-correlation of two +-1 codes over all L
    cyclic shifts: c[k] = sum_i x[i] * y[(i+k) mod L]. Returns int64 array."""
    n = len(x)
    # FFT would be float; we want EXACT integers, so do it via cyclic shifts on
    # int64. L=1023 makes the O(L^2) loop cheap and exact.
    c = np.empty(n, dtype=np.int64)
    for k in range(n):
        c[k] = int(np.dot(x, np.roll(y, -k)))
    return c


# ===========================================================================
# PART (a): real IS-GPS-200 codes -> exact integer correlations.
# ===========================================================================
print("# Nav-signal modulation & code-tracking reference.")
print("# PART (a) oracle: IS-GPS-200 GPS C/A Gold codes (G1/G2 LFSRs + Table 3-Ia")
print("#   G2 phase taps), EXACT integer periodic auto/cross-correlation of the")
print("#   real generated PRN 1..8 sequences. Gold 1967 three-valued set for n=10")
print("#   is {-1,-65,63}; max|off-peak corr| = t(10) = 65. kshana CodeFamily::Gold")
print("#   {n:10} reports 65/1023 from the t(n)/L closed form -- confronted here")
print("#   with the MEASURED maxima of the actually-generated codes.")
print("# PART (b) oracle: scipy.signal.periodogram unit-area baseband PSD of")
print("#   BPSK-R(1) and sine-BOC(1,1) vs kshana Modulation::psd closed form.")
print("# Consumed by tests/nav_signal_modulation_code_tracking_reference.rs.")
print(f"# L={L} N={N} t(10)=65 f0={F0!r}")

# Generate codes and verify against the IS-GPS-200 published first-10-chip octals.
codes = {}
logical_bits = {}
for prn in range(1, 9):
    a, b = G2_TAPS[prn]
    g1 = [1] * N
    g2 = [1] * N
    bits = []
    for i in range(L):
        chip = g1[N - 1] ^ (g2[a - 1] ^ g2[b - 1])
        bits.append(chip)
        fb1 = g1[2] ^ g1[9]
        fb2 = g2[1] ^ g2[2] ^ g2[5] ^ g2[7] ^ g2[8] ^ g2[9]
        g1 = [fb1] + g1[:-1]
        g2 = [fb2] + g2[:-1]
    logical_bits[prn] = bits
    codes[prn] = np.where(np.array(bits) == 0, 1, -1).astype(np.int64)
    oct_got = first10_octal(bits)
    oct_want = SPEC_FIRST10_OCTAL[prn]
    assert oct_got == oct_want, (
        f"PRN{prn} first-10-chip octal {oct_got} != IS-GPS-200 {oct_want}"
    )

# Emit per-PRN measured autocorrelation sidelobe (exact integer) + value set.
print("# AUTO prn | maxsidelobe | distinct_offpeak_values(comma)")
for prn in range(1, 9):
    ac = periodic_corr(codes[prn], codes[prn])
    # Peak at shift 0 is +1023; off-peak = all other shifts.
    peak = ac[0]
    assert peak == L, f"PRN{prn} autocorr peak {peak} != {L}"
    offpeak = ac[1:]
    max_sidelobe = int(np.max(np.abs(offpeak)))
    distinct = sorted(set(int(v) for v in offpeak))
    print(f"AUTO {prn} | {max_sidelobe} | {','.join(str(v) for v in distinct)}")

# Emit per-pair measured cross-correlation (exact integer) + value set.
print("# CROSS prnA prnB | maxcross | distinct_values(comma)")
pairs = []
for ia in range(1, 9):
    for ib in range(ia + 1, 9):
        pairs.append((ia, ib))
all_cross_vals = set()
for ia, ib in pairs:
    cc = periodic_corr(codes[ia], codes[ib])
    max_cross = int(np.max(np.abs(cc)))
    distinct = sorted(set(int(v) for v in cc))
    all_cross_vals.update(distinct)
    print(f"CROSS {ia} {ib} | {max_cross} | {','.join(str(v) for v in distinct)}")

# The whole-family three-valued check: across PRN1..8 the union of all off-peak
# auto + all cross values must be a subset of {-65,-1,63} (the n=10 Gold set).
union_vals = set()
for prn in range(1, 9):
    ac = periodic_corr(codes[prn], codes[prn])
    union_vals.update(int(v) for v in ac[1:])
union_vals.update(all_cross_vals)
gold_set = {-65, -1, 63}
assert union_vals.issubset(gold_set), f"non-Gold value present: {union_vals - gold_set}"
print(f"# GOLDSET observed_union={sorted(union_vals)} expected_subset_of={sorted(gold_set)}")
print(f"GOLDSET {','.join(str(v) for v in sorted(union_vals))}")

# First-10-chip octal pin (lets the Rust side cite the spec column too).
print("# FIRST10 prn | octal")
for prn in range(1, 9):
    print(f"FIRST10 {prn} | {SPEC_FIRST10_OCTAL[prn]}")


# ===========================================================================
# PART (b): scipy.signal.periodogram PSD shape of BPSK-R(1) and sine-BOC(1,1).
# ===========================================================================
def kshana_bpsk_psd(f, rc):
    tc = 1.0 / rc
    x = np.pi * f * tc
    s = np.where(np.abs(x) < 1e-12, 1.0, np.sin(x) / np.where(x == 0, 1.0, x))
    return tc * s ** 2


def synth_psd(kind, rc, fs, n_chips, n_epochs, seed):
    """Periodogram-estimate the unit-area baseband PSD of a random-chip waveform.

    kind: 'bpsk' rectangular chips at rate rc; 'boc11' sine-BOC(1,1) (square-wave
    subcarrier at rc, code at rc) -> each chip carries 2 subcarrier half-periods.
    fs: sample rate (Hz). Averages |X(f)|^2 over n_epochs independent random
    code blocks for variance reduction. Returns (freqs, psd_normalised_unit_area).
    """
    rng = np.random.default_rng(seed)
    samples_per_chip = int(round(fs / rc))
    psd_acc = None
    freqs = None
    for _ in range(n_epochs):
        chips = rng.integers(0, 2, size=n_chips) * 2 - 1  # +-1
        if kind == "bpsk":
            wf = np.repeat(chips, samples_per_chip).astype(float)
        elif kind == "boc11":
            # sine-BOC(1,1): multiply each chip by sign(sin(2 pi rc t)) over the
            # chip, i.e. 2 half-periods per chip -> [+1,-1] split of the chip.
            half = samples_per_chip // 2
            sub = np.concatenate([np.ones(half), -np.ones(samples_per_chip - half)])
            wf = (chips[:, None] * sub[None, :]).reshape(-1).astype(float)
        else:
            raise ValueError(kind)
        f, pxx = periodogram(wf, fs=fs, return_onesided=False, scaling="density")
        # density scaling: pxx has units power/Hz; total power ~ var(wf) = 1.
        order = np.argsort(f)
        f = f[order]
        pxx = pxx[order]
        if psd_acc is None:
            psd_acc = pxx
            freqs = f
        else:
            psd_acc = psd_acc + pxx
    psd = psd_acc / n_epochs
    # Normalise to unit area over the full sampled band (matches Betz unit-power).
    area = np.trapezoid(psd, freqs)
    psd = psd / area
    return freqs, psd


# BPSK-R(1): rc = f0. Use fs = 40*rc so the periodogram resolves +-12*Rc well.
RC = F0
FS = 40.0 * RC
N_EPOCHS = 2000
freqs_b, psd_b = synth_psd("bpsk", RC, FS, n_chips=1023, n_epochs=N_EPOCHS, seed=12345)
freqs_o, psd_o = synth_psd("boc11", RC, FS, n_chips=1023, n_epochs=N_EPOCHS, seed=54321)


def bin_psd(freqs, psd, edges):
    """Bin-average a (noisy) periodogram into wide frequency bins. Comparing a
    band-binned periodogram to a band-binned model PSD is the standard way to
    confront a finite-waveform spectral estimate with a closed form: it averages
    out the periodogram's irreducible per-bin variance and avoids the singular
    relative error at the sinc^2 nulls (model = 0, estimate = small but nonzero).
    """
    idx = np.digitize(freqs, edges) - 1
    out = np.full(len(edges) - 1, np.nan)
    for b in range(len(edges) - 1):
        sel = idx == b
        if sel.any():
            out[b] = psd[sel].mean()
    return out


# 48 bins of width 0.5*Rc spanning +-12*Rc.
edges_rc = np.linspace(-12.0, 12.0, 49)
edges_hz = edges_rc * RC
centers_rc = 0.5 * (edges_rc[:-1] + edges_rc[1:])

# Bin both the empirical periodogram and kshana's closed form on the SAME bins.
# The closed form is normalised to unit area over the sampled band so the two
# normalisations match exactly (the empirical PSD was unit-area normalised too).
clf_bpsk_full = kshana_bpsk_psd(freqs_b, RC)
clf_bpsk_full = clf_bpsk_full / np.trapezoid(clf_bpsk_full, freqs_b)
emp_bpsk_b = bin_psd(freqs_b, psd_b, edges_hz) * RC          # dimensionless G(f)*Rc
clf_bpsk_b = bin_psd(freqs_b, clf_bpsk_full, edges_hz) * RC

emp_boc_b = bin_psd(freqs_o, psd_o, edges_hz) * RC

print("# PART (b) PSD: 0.5*Rc bin-averaged, unit-area normalised. The Rust side")
print("#   recomputes kshana Modulation::psd analytically on the SAME bins and")
print("#   compares to the empirical periodogram column (RMS over the band).")
print("# Columns: PSD binCenter/Rc | empirical_bpsk*Rc | empirical_boc11*Rc")
print(f"# PSDMETA Rc={RC!r} fs={FS!r} n_chips=1023 n_epochs={N_EPOCHS} bin_width_rc=0.5")
for x, gb, go in zip(centers_rc, emp_bpsk_b, emp_boc_b):
    print(f"PSD {x:.4f} | {float(gb)!r} | {float(go)!r}")

# Sanity: the generator's own binned BPSK closed-form-vs-empirical RMS (a
# self-check on the oracle; the Rust test repeats the analytic side independently).
peak = float(np.nanmax(clf_bpsk_b))
rms = float(np.sqrt(np.nanmean((emp_bpsk_b - clf_bpsk_b) ** 2)) / peak)
print(f"# PSD BPSK oracle-internal binned RMS/peak = {rms:.4f} (informational)")

# Empirical BPSK self spectral-separation coefficient kappa = integral G^2 df,
# over the full sampled band, to confront kshana's analytic 2/(3 Rc).
kappa_bpsk = float(np.trapezoid(psd_b ** 2, freqs_b))
closed = 2.0 / (3.0 * RC)
print(f"# SSC empirical BPSK self-kappa (integral G^2 df) vs analytic 2/(3Rc)")
print(f"SSC {kappa_bpsk!r} | {closed!r}")
