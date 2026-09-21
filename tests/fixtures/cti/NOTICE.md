# CTI holdover-coverage fixture — provenance & honesty scope

**Oracle:** BIPM Circular-T `[UTC−UTC(USNO)]` 5-day series, MJD 56074–60429
(872 points), retrieved 2026-07-07 from the BIPM Time Department API:
`https://webtai.bipm.org/api/v1.0/get-data.html?scale=utc&lab=USNO&mjd1=56074&mjd2=60429&outfile=csv`
Columns: MJD, [UTC−UTC(USNO)] (ns), combined standard uncertainty (ns).
Data © BIPM; freely distributed via Circular-T. Used here as an external
verification oracle only.

**What this Validates:** *overbound coverage for the multi-year regime (τ ≥ 90 d)*
of the running-max holdover envelope `K(IR/2)·√(fit_var(τ)) + bias`, fit on the
disjoint early segment (MJD 56074–58000) and coverage-tested on the disjoint late
segment (MJD 58000–60429). At every tested lag τ ≥ 90 d, the envelope is never
pierced by the real series on the disjoint late segment (zero-piercing / true
overbound). Note: large-τ coverage is conservative by construction because the
√τ envelope over-grows a range-bounded steered series, so the *informative* test
is at short τ, which is the Modelled boundary described below.

**Short-τ Modelled boundary:** τ ≤ 30 d is a *disclosed Modelled* short-τ
model-validity boundary. The single-parameter white-FM fit under-covers the
steered series' short-lag control-action variance (daily/weekly steering cycles).
At τ = 30 d the empirical running-max (4.4 ns) pierces the white-FM envelope
(3.92 ns). Coverage is NOT asserted for τ < 90 d; the τ = 30 d row is retained
in the fixture for disclosure and transparency, not as a Validated claim.

**What this does NOT Validate (remains Modelled):** envelope *tightness*;
free-running-oscillator coast (this is a *steered operational realization*, not
a free-running clock); the deep-tail (1e-7) quantile; and it is a single
realization, not ensemble coverage. The composition of heterogeneous PNT sources
(composed_pl.rs) is also Modelled.

**NOT the paper's series.** arXiv:2508.13140 (Peil, Akin, Whalen; "100-ns-level
timing holdover after 12 years for rubidium atomic fountains") reports a
fountain-steered-timescale-vs-BIPM holdover of ±14 ns at 12 yr. That is a
DISTINCT quantity from this `[UTC−UTC(USNO)]` operational-offset series over the
same lab and window. This fixture is NOT that ±14 ns series and makes no claim
to be.

**Non-circularity.** A coverage test of a forward-predicted envelope is
independent of the ADEV/Van-Loan/allantools primitives Kshana already validates;
the disjoint fit/test split prevents leakage.
