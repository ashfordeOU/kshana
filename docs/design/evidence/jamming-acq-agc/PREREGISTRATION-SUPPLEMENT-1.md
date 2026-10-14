# Supplement 1 to the CAP-06 (c) pre-registration: an informative run set for H2 to H4

Written and committed **before** any run of the configuration below. `PREREGISTRATION.md`
(70c72fcc) is not edited, and its verdicts stand as recorded in `RESULTS.md`, including H3 as
NOT MET (uninformative).

## Why

The registered runs used `jamming-demo` at jammer powers of 10, 20, 25 and 30 dBW. On that
geometry the effective C/N0 of every link was between −30 and −7 dB-Hz, so every link was lost in
all four runs. Every flag agreed with the oracle, but no link showed the hysteresis, so H3 was
NOT MET under its own informativeness condition. H2 and H4 held, but only trivially.

The powers were chosen upward from the demo's own 10 dBW without looking at its operating
point. The powers below were chosen **after** seeing that range. The only aim is to put the
links' effective C/N0 across the 25 and 32 dB-Hz thresholds; none of the bars can be steered by
the choice. The bars are equalities and an inequality of a state machine, not tolerances.

## The supplementary runs

`jamming-demo` at jammer powers of **−40, −35, −30 and −25 dBW**. Everything else is as
registered:
- H3: acquisition threshold 32 dB-Hz, delay 60 s;
- H4: thresholds 25, 28, 32, 36 and 40 dB-Hz;
- the same `hysteresis.py`, unchanged since the registered run.

## Bars (new, in addition to the registered ones)

- **H2-S.** H2 on the four supplementary runs.
- **H3-S.** H3 on the four supplementary runs, with the same informativeness condition: if no
  link in the four has `acquired` different from `status != "lost"`, H3-S is NOT MET
  (uninformative).
- **H4-S.** H4 on the four supplementary runs.
