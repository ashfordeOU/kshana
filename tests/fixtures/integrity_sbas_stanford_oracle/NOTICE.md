# integrity_sbas_stanford_oracle fixture

Generated 2026-10-01 by `xval/sbas-maast/run_maast_sbas.m`, which runs Stanford MAAST
(https://github.com/stanford-gps-lab/maast, commit 7d32b049c62d55f90478248de04bec956fdeeeb4;
its files carry the notice "This script file may be distributed and used freely, provided this
copyright notice is always kept with it", copyright the Board of Trustees of the Leland Stanford
Junior University) as a separate tool under GNU Octave 8.4.0 with the statistics package 1.6.3:

    octave --no-gui --eval "addpath('xval/sbas-maast'); run_maast_sbas('<maast clone>', 'tests/fixtures/integrity_sbas_stanford_oracle', 'L1')"
    octave --no-gui --eval "addpath('xval/sbas-maast'); run_maast_sbas('<maast clone>', 'tests/fixtures/integrity_sbas_stanford_oracle', 'L5')"

Each run takes about ten minutes. A re-run of the L5 case with the final driver was
byte-identical. No MAAST code is vendored; only derived numbers are committed.

Inputs (from the MAAST clone; real recorded SBAS broadcasts, primary source GEO PRN 131, WAAS):

    6f0cfc31dababb2bfd0422041655bdf4dc44bad42d7856678123a44db3e021c4  sbas_messages_2020_001.mat   (case L1)
    6c467aeeeda576f4d828a52d2f4cbff86a44e293ee43da6f61261b39ce5e3e0e  maast_messages_2019_365.mat  (case L5)
    ee8d389fe8ec4146cdf198db8990f7e8b57442861422ea8399e6f1d91ac21c7e  alm01jan2020.txt

Driver stand-ins (disclosed in the test's amendments 1 to 5): `shim/usr_vhpl.m` records the
inputs MAAST hands to its own unmodified `usr_vhpl` and calls it; `auth_stub/MT51.m` and the
in-driver type-50 receiver and key state machine stand in for MAAST's TESLA authentication
classes, which Octave cannot parse, with authentication off; `TRUTH_FLAG` is set to 1 for the L1
case only (amendment 5).

Files (SHA-256 as committed):

    5903bbf0b801cb0ca117ae45498764db58e98b62afdb46ddd1e76c60cbcd3355  maast_sbas_L1_levels.csv
    777290b6624845b9268921b98c534dcca0686f535deb3d0aebb1cb8e75f4796b  maast_sbas_L1_sats.csv
    a6ff4a2aa567e5ef2daf72d0ac74174f27bb857200641080814cbb49bd4b34ca  maast_sbas_L5_levels.csv
    92a0bebca526db3a784e83f489eca35a84c058bb0b5f71e0d71c60dad61e6503  maast_sbas_L5_sats.csv

- `maast_sbas_<case>_levels.csv`: per (GPS time, user) MAAST's VPL and HPL (a value that is not
  positive is MAAST's "not monitored") and the user's latitude and longitude.
- `maast_sbas_<case>_sats.csv`: per (GPS time, user, PRN) the East-North-Up line of sight MAAST
  passed to `usr_vhpl` and the four variance components it summed (fast and long-term
  including degradation, user ionospheric, tropospheric, airborne).
