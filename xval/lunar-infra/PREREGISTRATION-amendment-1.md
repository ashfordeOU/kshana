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
