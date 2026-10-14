# Protocol: LRO longer arc, degree 150, lunar k2 tide and relativity (DS-LRO-04, 09, 11) — information only

Written 2026-10-13 and committed alone, before the longer-arc ephemeris is fetched and before
any of the runs below. Nothing here is a validation. No bar is set beyond the existing
`tests/agency_lro.rs` bars (25 m dynamic, 12 m reduced-dynamic). Every number is reported as
information on the LRO record, and no status changes.

1. **DS-LRO-11:** the 4 h arc fitted with the optional lunar solid tide (k2 = 0.02405, Konopliv
   et al. 2013) and the selenocentric Schwarzschild term on; reported against the default fit
   (12.049 m / 6.668 m).
2. **DS-LRO-04:** the DE-grade ANISE fit (`xval/anise-lunar-od`, `KSHANA_LRO_DEGREE=150`) at the
   fixture's full degree 150; reported against the d/o 100 run (11.959 m / 6.665 m).
3. **DS-LRO-09:** a 24 h arc (2022-01-01 00:00..2022-01-02 00:00 TDB, 1-minute step, 1 441
   epochs, about 12 revolutions), fetched from the JPL Horizons API with the same query as the
   4 h fixture (`COMMAND='-85'`, `CENTER='@301'`, ICRF, geometric vectors, km and km/s), committed
   byte for byte. It is fitted with the same configuration as the 4 h test (analytic default,
   d/o 100, dynamic and reduced-dynamic), and the 3-D RMS of each tier is reported. A longer arc
   tests whether the reduced-dynamic floor is an arc-length effect.
