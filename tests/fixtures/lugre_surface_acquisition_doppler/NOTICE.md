# Predicted Doppler at the LuGRE surface-phase L1 batches

`predicted.csv` was written 2026-10-02 by `xval/lugre-predicted-doppler/predict_surface.py`
(Python 3.12, numpy, spiceypy), after the pre-registration 2108e6ff was pushed. Independent of
Kshana. 256 satellite-batch predictions over eight batches (OP40 excluded: its metadata names a
data file the dataset does not contain), 254 predicted visible.

Inputs, retrieved 2026-10-02:

- LuGRE Mission Data, Zenodo record 16411687 (`LuGRE.zip`, SHA-256
  f151dfba3321a56dd4f62a7fb5dc1f82abb389e10b6fcf9a88bf2a2cf8895a8d); only the IQS header receiver
  times are used here.
- NAIF CLPS SPICE archive: `clps_to19d_bgm1_ls_250302_v01.bsp` (Firefly Aerospace landing site,
  NAIF body -2711900), `clps_to19d_bgm1_v01.tf`, `moon_assoc_me.tf`; NAIF generic
  `moon_pa_de440_200625.bpc`, `moon_de440_220930.tf`, `moon_de440_250416.tf`, `de440s.bsp`,
  `earth_latest_high_prec.bpc`, `naif0012.tls` (NASA, public).
- ESA/ESOC final multi-GNSS orbits `ESA0MGNFIN_2025DDD0000_01D_05M_ORB.SP3.gz`
  (navigation-office.esa.int, open use with attribution).

SHA-256:

```
ececb858f849fa0cbda07763ab04705c33454fdc43c11b4d3fe0954c8f6c3af3  predicted.csv
36308426e78c3f5fe0287161972ee542b321bc89bcae072bd9b59df446a8917a  clps_to19d_bgm1_ls_250302_v01.bsp
1234050c8ccb19d3a6384251df1ae101e4d1d0ec918eb46d0e3760883a3aa44f  clps_to19d_bgm1_v01.tf
52c622043ce0447d575e59ee01642f1894921e68c10f934ceff065f362da6c1c  moon_assoc_me.tf
60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f  moon_pa_de440_200625.bpc
73eb6b216c06a27c3419c4cfeaded7ffce46a714e3d4f9f5142dda51c0710f76  moon_de440_220930.tf
a47c71e9c9f33796bdafb2c9d69a7ee447b6016ecad80f71cd6f3e479f9cf768  moon_de440_250416.tf
56f13e47158978e4e7507711d066f76d2bb25c71259dd2e3c516ca6548f92d01  ESA0MGNFIN_20250620000_01D_05M_ORB.SP3.gz
8e03acf91fb325d174415b34dbe412744388346e02abc7b27abdc26851d10170  ESA0MGNFIN_20250730000_01D_05M_ORB.SP3.gz
3d29075ab2ffdc8abd572a725bf3d9eec3e3694e951660abb91ed4cd5bca56d9  ESA0MGNFIN_20250740000_01D_05M_ORB.SP3.gz
72130270d8329546515b805e93c473e18e533344a528d2ce657a065776f86c57  ESA0MGNFIN_20250750000_01D_05M_ORB.SP3.gz
```

Attribution (CC BY 4.0): Contains data from the Lunar GNSS Receiver Experiment (LuGRE) Mission
Data, J. Parker, F. Dovis et al., NASA and Agenzia Spaziale Italiana, Zenodo, doi
10.5281/zenodo.16411687, licensed under CC BY 4.0. Kshana's fixtures are derived extracts; no
sample file is redistributed.
