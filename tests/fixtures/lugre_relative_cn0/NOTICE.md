# LuGRE relative C/N0 fixtures

Generated 2026-10-02 by `xval/lugre-relative-cn0/generate.py` (Python 3.12, numpy, spiceypy,
openpyxl), independent of Kshana. Every source was retrieved on 2026-10-02.

| File | Source | Licence |
|---|---|---|
| tracked.csv | LuGRE Mission Data, Zenodo record 16411687, `LuGRE.zip` (SHA-256 f151dfba3321a56dd4f62a7fb5dc1f82abb389e10b6fcf9a88bf2a2cf8895a8d), `L0/TLM/TLM_RAW_*_[TL]_OP*.txt`, GPS L1 C/A (signalId 0) C/N0 | CC BY 4.0. Attribution: J. Parker, F. Dovis et al., "Lunar GNSS Receiver Experiment (LuGRE) Mission Data", NASA and Agenzia Spaziale Italiana, doi 10.5281/zenodo.16411687 |
| epochs.csv (receiver) | NAIF CLPS SPICE archive, `clps_to19d_bgm1_cru_rec_250115_250302_v01.bsp` (SHA-256 0f12c2f0709fcbb53f8c5bcfbdf6bd45bf0007b30b8ce5707b2927c91d361abe), "reconstructed Blue Ghost lander (BGM-1) cruise trajectory, created by Firefly Aerospace", NAIF body -2711, evaluated relative to the Earth in ITRF93 | NASA PDS, public |
| epochs.csv (Sun), frames | NAIF `de440s.bsp` (c1c7feeab882...), `earth_latest_high_prec.bpc` (54cdfdd1db54...), `naif0012.tls` (678e32bdb5a7...) | NASA, public |
| sats.csv (positions) | ESA/ESOC final multi-GNSS orbits `ESA0MGNFIN_2025DDD0000_01D_05M_ORB.SP3.gz`, navigation-office.esa.int, days 015, 016, 019, 025, 030, 034, 038, 039, 043, 045, 050 (SHA-256 below) | ESA, open use with attribution |
| sats.csv (SVN, block) | IGS `igs_satellite_metadata.snx` (SHA-256 5ae97c6f65d5c9f238f79565cdd478af9e0da1cc0f0f589bf6c5aad0de5234c2) | IGS, open use with attribution |
| patterns/G0NN_L1.csv | US Coast Guard Navigation Center release `GPS_IIR_IIR-M_LM.zip` (SHA-256 045329747a8b4b1cb44f2c430e5feaa6d5e9a3c2dda867b7dbb764c2f65b1c4e), Appendix B (Marquis, Lockheed Martin, Feb 2014) L1 RHCP directivity per SVN minus the L1 gain correction factor of the Aug 2015 presentation, re-gridded to Kshana's yaw-steering azimuth (see the generator header) | US Government / Lockheed Martin public release for world-wide use |

SHA-256 of the generated tables:

```
b95472f038b59fd0d2a89c095ad2a785ce58a81f62a55de08a3bc80c382a1263  epochs.csv
f5e744f586cb0e2447f4a351e8bba1b09a88e434be4717e980b25c5bb3382508  sats.csv
6393139660a4168b7043b40766e2d28c8f4ba20244514534b9ad8c65c0b96957  tracked.csv
```

Disclosure: a first generator run admitted commissioning-phase epochs (33 epochs, 18 IIR/IIR-M
records) against the pre-registration, which names the transit and lunar-orbit phases only;
it was replaced by this run (26 epochs, 15 records). The first run's result (18 records,
one pair, non-vacuity not met) had been seen; this re-run is disclosed as a re-run after a
seen result, and it changes no tolerance or engine parameter.

Orbit and metadata inputs (SHA-256):

```
ff2ce3e6c332d3051dce7ec59ff2e42f33662238b0a690aa65c78ab2d1f2b710  ESA0MGNFIN_20250150000_01D_05M_ORB.SP3.gz
7d912e841dbe898ba3b193646bff33f1646481cf37ecfdf380f0f7630965f8e8  ESA0MGNFIN_20250160000_01D_05M_ORB.SP3.gz
13a08f516173b4a6287457364dcd1faa04a010ec17f9bc80a25aa524f93fbb7e  ESA0MGNFIN_20250190000_01D_05M_ORB.SP3.gz
7a022e01fea135061f82233725b51072d68b3290c02a58d4d0c4b3bcfcc94690  ESA0MGNFIN_20250250000_01D_05M_ORB.SP3.gz
11f8931d74d27e158e2c2fba7d2680a39cad33bbe3e0589f5658b206e7029220  ESA0MGNFIN_20250300000_01D_05M_ORB.SP3.gz
30e5a698c023bcfdec692197cef4458535009c50f9c3c51f6a7a8f5ef37ade28  ESA0MGNFIN_20250340000_01D_05M_ORB.SP3.gz
c46bf3bba21a2c8ce1e5408aa4f9809a72c5f60e786b09db8824f6df6f51110e  ESA0MGNFIN_20250380000_01D_05M_ORB.SP3.gz
c4c61523de404ced7a1820ed29104a310a9b056906f7599dbbd74f4322b94ff8  ESA0MGNFIN_20250390000_01D_05M_ORB.SP3.gz
b8c89108dc2eca2e09c86d5a3ba7d38bd4b590d0bb66615f3497df079f418664  ESA0MGNFIN_20250430000_01D_05M_ORB.SP3.gz
35ea8cddcab8516544ff79e78c9faaafe99c371b7bcb7da1c61fcf14c417db21  ESA0MGNFIN_20250450000_01D_05M_ORB.SP3.gz
060b1d44b3175962535840107a1e83b6b597d76963e459dd686e90e498582e22  ESA0MGNFIN_20250500000_01D_05M_ORB.SP3.gz
5ae97c6f65d5c9f238f79565cdd478af9e0da1cc0f0f589bf6c5aad0de5234c2  igs_satellite_metadata.snx
```

The first run also fetched days 015 and 016 for its commissioning epochs; the replacing run
uses the transit and lunar-orbit days only.

Attribution (CC BY 4.0): Contains data from the Lunar GNSS Receiver Experiment (LuGRE) Mission
Data, J. Parker, F. Dovis et al., NASA and Agenzia Spaziale Italiana, Zenodo, doi
10.5281/zenodo.16411687, licensed under CC BY 4.0. Kshana's fixtures are derived extracts; no
sample file is redistributed.
