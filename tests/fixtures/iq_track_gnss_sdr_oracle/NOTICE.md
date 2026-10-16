# Notice: iq::track vs GNSS-SDR 0.0.19 fixture

Committed here: `results.csv`, `calibration.csv` and `engine_epochs.sha256`, numbers derived by
`make_fixture.py` from GNSS-SDR's and the engine's tracking of recordings generated in numpy
(`../tracking_loop_gnss_sdr_oracle/ifgen.py`, seeds 201 to 205). Also the GNSS-SDR configuration
`gnss_sdr_template.conf`, the driver, the pre-registration and its amendment.

Not committed: the recordings (regenerated bit for bit from the seeds), GNSS-SDR's dumps, and
any GNSS-SDR source or binary. GNSS-SDR (GPL-3.0-or-later, Centre Tecnològic de
Telecomunicacions de Catalunya) was run as a separate program from the Ubuntu 24.04 package
`gnss-sdr 0.0.19-1build3`.
