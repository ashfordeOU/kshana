<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Regional RNSS signal designer

`kshana rnss-design` computes spectra, spectral separation and multi-band RTK settings for the
signals of a new regional radio-navigation satellite service (RNSS), from parameters you supply.
It extends the existing signal model of [`leo_signal`](LEO-SIGNAL.md) rather than adding a second
one: a signal here is the same description (carrier, transmit band, allocation, components with a
modulation, power share, code length, data rate, minimum received power). `src/rnss_design.rs`.

```
kshana rnss-design profiles
kshana rnss-design run <profile|profile.toml> [--band-mhz <B>] [--cn0 <dB-Hz>]
    [--discriminator non-coherent|coherent] [--with-gps l1,l2,l5|none] [--phase-sigma-m <m>]
    [--out <report.json>]
```

**MODELLED.** Spectra are closed forms behind an ideal brick-wall band, with no code line
structure and no cross-correlation. A profile's numbers are only as good as their source, which
the profile states.

## Modulations

`BPSK(n)`, sine-phased `BOC(m,n)` (also written `BOCs(m,n)`), cosine-phased `BOCc(m,n)` and
`MBOC(6,1,p)`, at `n × 1.023` Mchip/s with a subcarrier at `m × 1.023` MHz.

The cosine-phased BOC is new in `navsignal::Modulation::BocCos`. Its unit-area spectrum is Betz's
(NAVIGATION 48(4), 2001):

`G(f) = f_c [2 S(f) sin²(πf/4f_s) / (πf cos(πf/2f_s))]²`

`S(f)` is `sin(πf/f_c)` for an even number of subcarrier half-periods per chip and
`cos(πf/f_c)` for an odd number.

## Profiles: `kshana.rnss-profile/1` (TOML)

```toml
format = "kshana.rnss-profile/1"
[profile]
name = "..."            # identifier
title = "..."
status = "CANDIDATE"    # CANDIDATE, PUBLIC, REPRESENTATIVE or USER
citation = "..."        # where the numbers come from
url = "..."
licence = "..."         # of the source
disclaimer = "..."      # what the profile is not
notes = "..."

[[references]]          # signals to compare with (any number)
name = "..."
centre_mhz = 2492.028
modulation = "BPSK(1)"
source = "..."

[[signals]]             # the leo_signal signal description; source may also be CANDIDATE
name = "..."
source = "CANDIDATE"
centre_mhz = 2492.028
tx_bandwidth_mhz = 16.5
allocation = "rdss"     # rnss, rdss, mss, eess, non-rnss, other
[[signals.components]]
role = "data"           # acquisition, data or pilot
modulation = "BOCc(3,1)"
power_fraction = 1.0
```

Built-in profiles live in `data/rnss-profiles/`. Any file of this format can be given instead.

### `candidate-sband-sensors2022`

The candidate S-band signals evaluated by K. Han, S. Lee, M. You and J.-H. Won, *A Comprehensive
Evaluation of Possible RNSS Signals in the S-Band for the KPS*, Sensors 22(6):2180, 2022
(doi:10.3390/s22062180, CC BY 4.0).

**Status CANDIDATE.** This is not an official KPS specification. No public KPS ICD exists as of
November 2026.

What the profile contains:

* Twenty signals at 2492.028 MHz, from the paper's Table 3: BPSK at 1, 4, 5 and 8, eight sine and
  seven cosine BOCs, and MBOC.
* A 16.5 MHz transmit band (the study's front end, and the width of the 2483.5–2500 MHz RDSS band).
* NavIC SPS-S (BPSK(1)) and RS-S (BOCs(5,2)) as references, as the paper's Table 2 gives them.

What the paper does not give, so the profile does not set:

* code length;
* data/pilot split;
* data rate;
* received power.

Each candidate is one component. The paper's Table 3 prints 4.192 MHz for the (4,4) rows while
naming them (4,4) everywhere else, so (4,4), at 4.092 MHz, is used.

## The run: `kshana.rnss-design/1` (JSON)

Per signal, over the receiver band `B` (`--band-mhz`, default 16.5):

* chip rate;
* in-band power `η = ∫_B G df`, with `G` of unit area over all frequencies;
* Gabor bandwidth as `√(∫_B f²G df / η)` and as `√(∫_B f²G df)`;
* self SSC and SSC against each reference, `κ = ∫_B G_s(f) G_i(f − Δf) df` in dB/Hz;
* SSC into each GNSS signal of the crate whose band overlaps (`leo_signal::GNSS_VICTIM_NAMES`);
* DLL code jitter at `--cn0`;
* the PSD sampled across the band.

The default receiver is the study's (its Table 6): non-coherent early-minus-late power with its
squaring loss, 0.1-chip spacing, 0.1 Hz loop and 20 ms predetection.

**Multi-band RTK settings.** The profile's distinct carriers, plus the GPS carriers named by
`--with-gps` (default L1 and L5), become an input to `leo_verify::rtk_ar` (cascaded integer
ambiguity resolution). The cascade:

1. the closest pair of carriers first (the longest wide lane);
2. each next-longest wide lane that brings in a new carrier;
3. the highest-frequency carrier alone.

Code noise per carrier is the DLL jitter above. Phase noise is `--phase-sigma-m` (default 3 mm,
stated, not derived). The report holds both the input it built and `rtk_ar`'s success rates.

## Checks (`tests/rnss_design.rs`)

**Closed forms:**

* the BPSK PSD and its nulls;
* the cosine-BOC PSD against its defining expression;
* unit area of the BOC and MBOC spectra (within 1 % over ±400 MHz, the 1/f² tail holding the rest);
* self SSC of BPSK `2/(3R_c)`, and the offset-BPSK SSC against the crate's closed form;
* the RTK cascade order.

**Against the study's printed values** (two decimals; the candidate profile at 16.5 MHz with the
Table 6 receiver):

| Study table | Quantity | Agreement here |
|---|---|---|
| Table 4 | SSC against NavIC S-SPS, NavIC S-RS and self, all 20 rows | within 0.18 dB |
| Table 5 | spectral efficiency, read as the in-band power η | within 0.015 |
| Table 7 | DLL error at 40 dB-Hz, all rows but MBOC | within 0.009 m |
| Table 7 | DLL error at 20 dB-Hz, BPSK rows | within 3.5 % |
| Table 8 | Gabor bandwidth at 16.5 MHz, against the unnormalised form | within 5.3 % |

**Not reproduced, and documented rather than tuned:**

* **Gabor bandwidth.** The study's Table 8 lies between the two forms. It is nearer the
  unnormalised one, but up to 5.3 % away (higher-order cosine BOCs furthest). Its convention is to
  confirm.
* **DLL error of the BOC rows at 20 dB-Hz.** These come out 1 % to 18 % below the study
  (higher-order BOC furthest), a convention difference not resolved here.
* **MBOC DLL error.** The study's MBOC row equals its BOCs(1,1) row exactly, as if MBOC were
  tracked with a BOC(1,1) replica. Here the full MBOC spectrum is tracked.
