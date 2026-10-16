# Pre-registration: SPK types 3 and 21 writer and reader against the NAIF SPICE Toolkit

Committed alone, before Kshana's type 3 or type 21 writer or reader exists or is compared with
the oracle on any case. It fixes the oracle, the quantities, the case set, the bars, the
decision rule and what counts as a finding. Bars may be tightened later, never loosened.

## What is claimed

1. Kshana writes SPK segments of type 3 (Chebyshev polynomials for position and velocity, fixed
   intervals) and type 21 (extended modified difference arrays, "difference lines") from given
   records, in the DAF container its type 9/13 writer already produces (`src/spk_writer.rs`), and
   SPICE reads them as written: same bodies, frames, types, coverage, descriptors and names, the
   same data words as the kernel SPICE writes itself from the same records (`spkw03`, `spkw21`).
2. Kshana's reader selects the record and evaluates it as SPICE does (`spkr03`/`spke03` with
   `chbval`; `spkr21` with `lstltd` and its epoch directory, `spke21`), on kernels written by
   Kshana and on kernels written by SPICE, in files that also hold type 9/13 segments.

Not claimed: fitting Chebyshev coefficients to states, producing difference lines (which come
from an integrator), or anything about the physical accuracy of a trajectory. The inputs are
synthetic records.

## Oracle

NAIF SPICE Toolkit CSPICE N0067 through spiceypy 8.3.0, run as a separate program by a committed
generator under `tests/fixtures/spk_3_21_spice_oracle/` with `python3 -I`: `spkopn`, `spkw03`,
`spkw21`, `spkw13`, `dafac`, `spkcls` (SPICE writes its own kernels); `furnsh`, `spkobj`,
`spkcov`, `dafopr`, `dafbfs`, `daffna`, `dafgs`, `dafus`, `dafgn` (inventory); `spkpvn` and
`spkgeo` (evaluation). The layouts and algorithms were implemented from the NAIF "SPK Required
Reading" and the CSPICE sources of `spkw03`, `spkr03`, `spke03`, `chbval`, `spkw21`, `spkr21`,
`spke21` and `lstltd`, read before this file was written; no type 3 or 21 kernel has been
written or opened by Kshana or compared before this commit. No SPICE code is linked or copied.

## Random draws after publication

The seed is the first 16 hexadecimal digits of the full SHA-1 of the git commit that adds this
file, read as an unsigned integer and given to Python's `random.Random`; the generator draws all
records and all random evaluation epochs from it in the order below.

## Inputs (synthetic, drawn from the seed)

Type 3 records: for each record and each component, Chebyshev coefficients `c_k` of degree `d`
drawn as `c_0 ~ U(-8000, 8000)` km (velocity `U(-8, 8)` km/s) and `c_k ~ U(-1, 1) * c_scale / 2^k`
for `k >= 1` (`c_scale` 4000 km, 4 km/s). Type 21 difference lines of size
`DLSIZE = 4 MAXDIM + 11`: reference epoch `TL` equal to the line's end epoch; step-size vector
`G_j = j h (1 + U(0, 0.1))` with `h ~ U(30, 120)` s for `j <= KQMAX1 - 2`, other entries
`U(30, 120)` s; reference position `U(-8000, 8000)` km and velocity `U(-8, 8)` km/s per axis;
difference table entries `U(-1, 1) * 1e-3 / 4^(j-1)` km/s²; `KQMAX1 ~ U{3, MAXDIM + 1}`, each
`KQ_i ~ U{1, KQMAX1 - 1}`. Line end epochs advance by `U(300, 900)` s from a drawn start in
`[-3e8, 9e8]` s.

| file | segment | target | centre | frame | type | records | detail |
|---|---|---|---|---|---|---|---|
| G1 | S1 | -2001 | 399 | J2000 | 3 | 40 | degree 12, interval 3600 s, descriptor = full coverage |
| G1 | S2 | -2002 | 301 | ECLIPJ2000 | 3 | 3 | degree 0 |
| G1 | S3 | -2003 | 399 | J2000 | 3 | 150 | degree 27, interval 1800 s, descriptor 100 s inside both ends |
| G2 | S1 | -2101 | 399 | J2000 | 21 | 50 | MAXDIM 15 (DLSIZE 71), descriptor = first line start to last epoch |
| G2 | S2 | -2102 | 399 | J2000 | 21 | 250 | MAXDIM 25 (DLSIZE 111), two directory entries |
| G2 | S3 | -2103 | -2101 | J2000 | 21 | 100 | MAXDIM 20, exactly one directory entry, inside S1's coverage |
| G2 | S4 | -2104 | 301 | ECLIPJ2000 | 21 | 1 | MAXDIM 15, descriptor start 600 s before the only epoch |
| G3 | | | | | | | G1 S1, G2 S2 and a type 13 segment (target -2201, centre 399, degree 7, 30 Kepler states, steps 60 s), in that order, with a two-line comment area |

A type 21 descriptor start is the drawn segment start; the first line covers from it to its end
epoch. The internal file name is fixed per file.

## Evaluation epochs

Type 3: every record boundary `INIT + k INTLEN` inside the descriptor and the two adjacent
doubles; every record midpoint; the descriptor bounds; 25 uniform draws. Type 21: every line end
epoch inside the descriptor and the two adjacent doubles; the midpoint of each line's interval;
the descriptor bounds; 25 uniform draws. Type 13 (G3): every node and every midpoint. At each:
`spkpvn` on that segment, and `spkgeo(target, et, frame, centre)`; for G2 S3 also
`spkgeo(-2103, et, J2000, 399)` through the chain.

## Bars

| leg | quantity | bar |
|---|---|---|
| W1 | `spkobj`, `spkcov`, every descriptor (`dafus`) and name (`dafgn`) of every Kshana-written file | exactly the declared values; Kshana's own reader returns the same |
| W2 | SPICE `spkpvn`/`spkgeo` on Kshana-written files vs Kshana's reader on the same files, all six components | `|d| <= 1e-12 max(|SPICE value|, F)`, `F` = 1 km for position, 1e-3 km/s for velocity (chain: the sum of the per-hop bars) |
| B1 | data words and summaries of the Kshana-written files vs the SPICE-written files from the same records | bit-identical |
| B2 | whole files | identical, except the unused tails (bytes 1000 to 1023) of character records |
| R1 | Kshana's reader on the SPICE-written files vs SPICE `spkpvn`/`spkgeo` on them | the W2 bar |

For scale: a wrong record changes a position by kilometres with these draws; the bar is about
1e-8 km.

## Decision rule

- **Met**: every bar of W1, W2, B1, B2 and R1 holds on every case; then a ledger row
  "SPICE SPK types 3 and 21 (Chebyshev, extended difference lines)" (VALIDATED, Library basis,
  CSPICE N0067) is added.
- **Finding**: any value outside its bar, any inventory or byte difference, any SPICE refusal of
  a Kshana-written file. Each is reported with case, epoch and both values, and kept as a test
  that asserts the recorded miss; the bars are not edited. A finding confined to one type
  narrows the claim to the other; no row is added for a type with a miss.
