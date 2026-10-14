# Pre-registration: SPK writer (types 9 and 13) and reader against the NAIF SPICE Toolkit

Committed alone, before the engine's SPK writer or its type 9/13 reader has been compared with
the oracle on any case. It fixes the oracle, the quantities, the case set, the bars, the
decision rule and what counts as a finding. Bars may be tightened later, never loosened.

## What is claimed

1. Kshana writes Spacecraft and Planet Kernel (SPK) files of type 9 (Lagrange interpolation,
   unequal time steps) and type 13 (Hermite interpolation, unequal time steps) in the Double
   precision Array File (DAF) container that the NAIF SPICE Toolkit reads as written: the same
   bodies, frames, types, coverage, segment descriptors and names, the same data words, and the
   same evaluated states as a kernel SPICE writes itself from the same inputs.
2. Kshana's reader evaluates type 9 and type 13 segments as SPICE does (window selection of
   `spkr09`/`spkr13`, Lagrange and Hermite interpolation of `spke09`/`spke13`), on kernels
   written by Kshana and on kernels written by SPICE.
3. The OEM-to-SPK export maps CCSDS OEM epochs (UTC, including a leap second, and TDB) to
   SPICE ephemeris time (TDB seconds past J2000) as SPICE does, and SPICE evaluates the exported
   kernel at the OEM epochs back to the OEM states.

Nothing is claimed about the physical accuracy of any trajectory: the inputs are synthetic.

## Oracle

NAIF SPICE Toolkit CSPICE N0067 through spiceypy 8.3.0 (MIT licence; the toolkit is NAIF's,
freely distributed), run as a separate program by the committed generator
`tests/fixtures/spk_writer_spice_oracle/generate.py` with `python3 -I`. The SPICE routines used:
`spkopn`, `spkw09`, `spkw13`, `dafac`, `spkcls` (SPICE writes its own kernels); `furnsh`,
`spkobj`, `spkcov`, `dafopr`, `dafbfs`, `daffna`, `dafgs`, `dafus`, `dafgn` (inventory and
descriptors); `spkpvn` (one segment, no priority rules) and `spkgeo` (body to body, with
segment priority and centre chains) (evaluation); `str2et` with the NAIF leapseconds kernel
`naif0012.tls` (OEM epochs). No SPICE code is linked into or copied into Kshana. The layouts were
implemented from the NAIF "DAF Required Reading" and "SPK Required Reading" and from the
algorithm descriptions in the CSPICE sources of `spkr09`, `spke09`, `spke13`, `lgrint`,
`hrmint`, `dafana` and `dafac`, read before this file was written; no kernel written by SPICE
has been opened or compared with Kshana output before this commit.

## Random draws after publication

The seed is the first 16 hexadecimal digits of the full SHA-1 of the git commit that adds this
file, read as an unsigned integer and given to Python's `random.Random`. The generator draws all
inputs and all random evaluation epochs from it, in the order below, so neither inputs nor
epochs can have been chosen with a result in view.

## Inputs (synthetic, drawn from the seed)

Each state series is a Kepler orbit (Earth `mu = 398600.4418`, Moon `mu = 4902.800066`
km^3/s^2) with elements drawn uniformly (semi-major axis 6800 to 7400 km about the Earth, 1800
to 2500 km about the Moon; eccentricity 0 to 0.02; angles 0 to 2 pi), plus independent Gaussian
noise of 1e-3 km on each position component and 1e-6 km/s on each velocity component (noise
makes the interpolants of different windows differ by metres between nodes, so a wrong window
cannot hide inside the bars). The epochs start at a drawn ET in [-3e8, 9e8] s and advance by
steps drawn uniformly from the stated range.

| file | segment | target | centre | frame | type | degree (window) | N | steps (s) | descriptor |
|---|---|---|---|---|---|---|---|---|---|
| F1 | S1 | -1001 | 399 | J2000 | 13 | 7 (4, even) | 257 | 30-90 | first to last epoch |
| F1 | S2 | -1001 | 399 | J2000 | 13 | 9 (5, odd) | 300 | 30-90 | starts 7.5 s after S1 node 200; descriptor strictly inside the epochs (first + 10 s to last - 10 s) |
| F1 | S3 | -1003 | -1001 | J2000 | 13 | 15 (8) | 101 | 30-90 | inside the S1 and S2 coverage |
| F2 | S1 | -1002 | 301 | J2000 | 9 | 8 (9, odd) | 250 | 60-240 | first to last |
| F2 | S2 | -1002 | 301 | J2000 | 9 | 5 (6, even) | 100 | 60-240 | after a gap of 1 day after S1 |
| F2 | S3 | -1004 | 301 | ECLIPJ2000 | 9 | 1 (2) | 2 | 60-240 | first to last |
| F3 | 27 segments | -1100 to -1126 | 399 | J2000 | 9 and 13 alternating | type 9: degrees 1, 3, ..., 27 cycled with 2, 4, ...; type 13: odd degrees 1 to 27 cycled | degree-dependent minimum to 20 | 30-90 | first to last |
| F4 | the first 25 segments of F3 | | | | | | | | |

F2 carries a comment area of three lines: a short ASCII line, a line of 1100 printable
characters cycling through ASCII 33 to 126 (so the comments span two records), and a line with
trailing blanks (which SPICE drops). F3 needs a second summary record; F4 fills the first one
exactly, which makes SPICE append an empty summary record. Segment names are short printable
strings (at most 40 characters); the internal file name is fixed per file. F3 segment `k` has
`N_k = max(n_min, 20 - (k mod 5))` states, `n_min` the SPICE minimum for its degree.

OEM input (`oem_input.oem`, written by the generator, noise-free Kepler states printed with 6
decimals in km and 9 in km/s): segment A, centre EARTH, EME2000, TIME_SYSTEM UTC, 41 lines
from 2016-12-31T23:40:00 with steps 30 to 90 s carrying millisecond fractions, one line forced
at 2016-12-31T23:59:60.500 (inside the leap second); segment B, centre MOON, EME2000, TDB, 31
lines. Kshana exports A as target -1201 (type 13, degree 7) and B as -1202 (type 9, degree 7).

## Evaluation epochs

For every segment: every node inside the descriptor interval; the midpoint `(t_i + t_{i+1})/2`
of every pair of consecutive nodes inside it; the two descriptor bounds; for each directory
index `k`, the node `t_{100k}` and its two adjacent doubles when inside; and 25 uniform draws
over the descriptor interval. At each: (a) `spkpvn` on that segment (raw frame), and (b)
`spkgeo(target, et, frame of the segment, centre)`. For F1 also, at the S3 epochs, the chain
pairs (-1003 wrt 399), (399 wrt -1003) and (-1001 wrt -1003) in J2000.

## Quantities and bars

Let `u = 2^-53`. For an evaluation at `x` on a segment whose window holds `m` states, let `W(x)`
be every run of `m` consecutive nodes of the segment whose time span contains `x` (the SPICE
window is one of them; the bar does not depend on which). For one window, with `l_i` its
Lagrange basis and `h_i, k_i` its Hermite basis (value and slope functions):

- type 9, each component (position from positions, velocity from velocities):
  `B = sum_i |l_i(x)| |y_i|`, `S = max_i |y_i|`, `K = m`;
- type 13 position: `B = sum_i |h_i(x)| |p_i| + |k_i(x)| |v_i|`, `S = max_i (|p_i|, |v_i| D)`,
  `D` the window span, `K = 2m`;
- type 13 velocity: `B = sum_i |h_i'(x)| |p_i| + |k_i'(x)| |v_i|`,
  `S = max_i (|p_i| / delta, |v_i|)`, `delta` the smallest node spacing in the window, `K = 2m`.

**State bar** for one component: `16 K u max_{W(x)} (B + S)`. Derivation: Neville's table
(Lagrange, `lgrint`) and its confluent Hermite form (`hrmint`) build each entry as
`(c1 a + c2 b) / d` (plus a difference term for slopes), at most four roundings of relative size
`u` per entry over `K - 1` levels, so a first-order forward error of at most about `4 K u B`;
`S` covers the rounding of the data and of the position differences divided by node spacings
where `B` vanishes (at nodes); two independent correct implementations differ by at most twice
one bound; a further factor 2 is margin. Epoch differences `x - t_i` are exact (Sterbenz) for
the epoch magnitudes used, so the time argument adds nothing. Body-level states through a
centre chain add the per-hop bars plus `4 u` times the sum of the hop magnitudes. The bars are
computed by the tests from the committed inputs only, never from library code.

For a scale: a 7000 km position over a 4-state Hermite window gives about 2e-10 km; the noise
makes wrong-window errors about 1e-3 km.

| leg | quantity | bar |
|---|---|---|
| W1 | `spkobj` ids, `spkcov` intervals, every descriptor (`dafus` doubles and integers) and segment name (`dafgn`) of every Kshana-written file | exactly the declared values; Kshana's own reader returns the same |
| W2 | SPICE `spkpvn` and `spkgeo` on the Kshana-written files vs Kshana's reader on the same files, every evaluation epoch, all six components | state bar |
| W3 | SPICE `spkpvn` at every node on the Kshana-written files vs the input state | state bar (B = |y|) |
| R1 | SPICE on SPICE-written files (`spkw09`, `spkw13`, `dafac`) vs Kshana's reader on those files, same epochs | state bar |
| B1 | Kshana-written vs SPICE-written file, F1 to F4: data words of every segment (first to last address) and every summary record | bit-identical |
| B2 | the same, whole file | identical expected; a difference only in bytes 1001 to 1024 of a character record (name or comment records, which SPICE writes as 1000 characters) is a finding recorded but not a failure; any other difference fails |
| T1 | OEM epoch to ET: Kshana vs `str2et('<epoch> UTC' or ' TDB')` | `|d| <= 1e-6 s` (8 units in the last place of an ET below 2^30 s) |
| T2 | SPICE `spkgeo` on the Kshana OEM export at the SPICE ET of each OEM line vs the OEM line state | state bar at a node, plus `1e-6 s` times the speed (position) and `1e-6 s x 0.01 km/s^2` (velocity) |
| T3 | W1 for the OEM export | exact |

The Kshana-written kernels SPICE reads are regenerated in CI from the committed inputs and must
hash (SHA-256) to the digests recorded when SPICE read them, so the committed SPICE values apply
to exactly those bytes.

## Decision rule

VALIDATED (Library oracle) only if every comparison of W1 to W3, R1, B1, T1 to T3 is inside its
bar and B2 holds (or differs only as allowed). Anything else is a finding: recorded with its
numbers in the test as a pinned finding and in the handoff, never tuned away; the row then stays
MODELLED for the leg that missed.

## Mutation checks (planned now)

After the comparison: (1) the odd-window tie rule (`<` against `<=`), (2) the bracketing index
off by one, (3) the type 13 Hermite slope term dropped, (4) the writer's epoch directory omitted.
Each must turn the strict test red; each edit is then reverted.
