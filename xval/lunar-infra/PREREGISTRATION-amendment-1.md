# Amendment 1 to the lunar-infrastructure pre-registration (study 2 only)

Made before any study-2 ambiguity or success-rate result was computed.

**Change.** The study-2 default uses `rx_gain_dbi = 25.0` (was 12.0 in PREREGISTRATION.md, line 189 block).
Studies 1, 3, 4 and 5 are unchanged.

**Reason.** An availability probe (counts of tracked satellites only) showed that at 12 dBi the two receivers
share two or more satellites at 85 of 433 epochs and three or more at none, so the double-difference problem is
not formable. At 25 dBi every epoch has three or more common satellites. No ambiguity covariance, bootstrap rate
or ILS success rate had been computed when this was decided.

**Bars.** Q1 to Q4 are unchanged and apply to the 25 dBi configuration. No bar is loosened.
The 12 dBi result ("not formable") is reported in RESULTS.md as a finding.

## Amendment 2 (study 2 only, before scoring)

**Change.** Monte Carlo trials for the study-2 default are 400 (was 2000). Bars Q1 to Q4 are unchanged; the
binomial standard error in Q1 and Q2 is computed from the trials actually run.

**Reason.** A timing run (5 trials, no result read beyond the ambiguity counts and a printed summary line)
showed 135 double-difference ambiguities for a 1-day arc and 375 for 3 days, at about 0.7 s per LAMBDA trial on the
3-day arc, so 2000 trials over three arcs is impractically slow for a scenario that ships as an example. Seen
at that point: ambiguity counts and that the printed ILS success was 0.000 for 5 trials; no bar was evaluated.

**Also fixed before scoring.** The surface site longitude convention: 0 deg faces Earth (the first build placed lon 0
on the far side, giving no common satellites). The geometry code, not a bar, changed.
