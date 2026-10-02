# Predicted Doppler at the LuGRE L1 snapshots

`predicted.csv` was written 2026-10-02 by `xval/lugre-predicted-doppler/predict.py` (Python 3.12,
numpy, spiceypy), after the pre-registration commit 0d1839d2 was pushed. Independent of Kshana.

Inputs, all retrieved 2026-10-02:

- LuGRE Mission Data, Zenodo record 16411687 (`LuGRE.zip`, SHA-256
  f151dfba3321a56dd4f62a7fb5dc1f82abb389e10b6fcf9a88bf2a2cf8895a8d), CC BY 4.0; only the IQS
  header receiver times of the nine non-surface L1 batches are used. Attribution: J. Parker,
  F. Dovis et al., "Lunar GNSS Receiver Experiment (LuGRE) Mission Data", NASA and Agenzia
  Spaziale Italiana, doi 10.5281/zenodo.16411687.
- NAIF CLPS SPICE archive: `clps_to19d_bgm1_cru_rec_250115_250302_v01.bsp` (Firefly
  Aerospace reconstructed Blue Ghost cruise trajectory, SHA-256 0f12c2f0709f...), with
  `de440s.bsp`, `earth_latest_high_prec.bpc`, `naif0012.tls` (NASA, public).
- ESA/ESOC final multi-GNSS orbits `ESA0MGNFIN_2025DDD0000_01D_05M_ORB.SP3.gz`
  (navigation-office.esa.int, open use with attribution), the days of the snapshots.

278 predictions (PRN present in the orbit file, per snapshot); `visible` is 1 when the straight
path clears a 6 378 137 m sphere.

SHA-256:

```
5dcb63dc3c648d7b3eb047c85886b84ddb08e54ce26f278b4348088ae81b8edf  predicted.csv
7d912e841dbe898ba3b193646bff33f1646481cf37ecfdf380f0f7630965f8e8  ESA0MGNFIN_20250160000_01D_05M_ORB.SP3.gz
11f8931d74d27e158e2c2fba7d2680a39cad33bbe3e0589f5658b206e7029220  ESA0MGNFIN_20250300000_01D_05M_ORB.SP3.gz
30e5a698c023bcfdec692197cef4458535009c50f9c3c51f6a7a8f5ef37ade28  ESA0MGNFIN_20250340000_01D_05M_ORB.SP3.gz
dbb186a304a54a47043ba26eb9b282535cf2637468cd9afd1e7466400f7c23ca  ESA0MGNFIN_20250360000_01D_05M_ORB.SP3.gz
c46bf3bba21a2c8ce1e5408aa4f9809a72c5f60e786b09db8824f6df6f51110e  ESA0MGNFIN_20250380000_01D_05M_ORB.SP3.gz
b8c89108dc2eca2e09c86d5a3ba7d38bd4b590d0bb66615f3497df079f418664  ESA0MGNFIN_20250430000_01D_05M_ORB.SP3.gz
35ea8cddcab8516544ff79e78c9faaafe99c371b7bcb7da1c61fcf14c417db21  ESA0MGNFIN_20250450000_01D_05M_ORB.SP3.gz
948e173035d26f37f3947a4db4968571ff92e79f385f29730fb944e441c140c9  ESA0MGNFIN_20250550000_01D_05M_ORB.SP3.gz
31d39910d631745fb99c356eef5df39cc00a5007fb692dbff730314095b81a20  ESA0MGNFIN_20250580000_01D_05M_ORB.SP3.gz
```

Attribution (CC BY 4.0): Contains data from the Lunar GNSS Receiver Experiment (LuGRE) Mission
Data, J. Parker, F. Dovis et al., NASA and Agenzia Spaziale Italiana, Zenodo, doi
10.5281/zenodo.16411687, licensed under CC BY 4.0. Kshana's fixtures are derived extracts; no
sample file is redistributed.
