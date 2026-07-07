# CTI holdover-coverage fixture — provenance & honesty scope

**Oracle:** BIPM Circular-T `[UTC−UTC(USNO)]` 5-day series, MJD 56074–60429
(872 points), retrieved 2026-07-07 from the BIPM Time Department API:
`https://webtai.bipm.org/api/v1.0/get-data.html?scale=utc&lab=USNO&mjd1=56074&mjd2=60429&outfile=csv`
Columns: MJD, [UTC−UTC(USNO)] (ns), combined standard uncertainty (ns).
Data © BIPM; freely distributed via Circular-T. Used here as an external
verification oracle only.

**What this Validates:** multi-year *overbound coverage* of the running-max
holdover envelope `K(IR/2)·√(fit_var(τ)) + bias`, fit on the disjoint early
segment (MJD 56074–58000) and coverage-tested on the disjoint late segment
(MJD 58000–60429). Coverage = the fraction of τ-windows whose empirical
running-max excursion exceeds the envelope is ≤ the target integrity risk.

**What this does NOT Validate (remains Modelled):** envelope *tightness*;
free-running-oscillator coast (this is a *steered operational realization*, not
a free-running clock); the deep-tail (1e-7) quantile; and it is a single
realization, not ensemble coverage.

**NOT the paper's series.** arXiv:2508.13140 (Peil, Akin, Whalen; "100-ns-level
timing holdover after 12 years for rubidium atomic fountains") reports a
fountain-steered-timescale-vs-BIPM holdover of ±14 ns at 12 yr. That is a
DISTINCT quantity from this `[UTC−UTC(USNO)]` operational-offset series over the
same lab and window. This fixture is NOT that ±14 ns series and makes no claim
to be.

**Non-circularity.** A coverage test of a forward-predicted envelope is
independent of the ADEV/Van-Loan/allantools primitives Kshana already validates;
the disjoint fit/test split prevents leakage.
