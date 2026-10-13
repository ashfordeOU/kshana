# gnss_wettzell_2025055 fixture

Cut on 2026-10-12 by `make_fixture.py` (its docstring gives the inputs and the command) for the
real-data PPP, carrier-smoothing and RTK tests of WP-07. Pre-registrations: `PREREGISTRATION_*.md`.

| File | Content | SHA-256 |
|---|---|---|
| `wtzr_2025055_0006_G.rnx` | IGS station WTZR (Wettzell), 2025-02-24 00:00-06:00, 30 s, GPS `C1C L1C C2W L2W` only; header otherwise kept | d3d9322f43dcf5726bc0d38b918d997ee5c2ff93b7c6345143ad28830f593662 |
| `wtzz_2025055_0003_G.rnx` | IGS station WTZZ (Wettzell, about 1.4 m from WTZR), 2025-02-24 00:00-03:00, same cut | 07869a3046523993f1e56cffe98b1cb03f8a22fc015296a1444141db0ef4c0cf |
| `igs_2025055_G_05m_0006.clk` | header and GPS satellite records 00:00-06:05 of the IGS final 5 min clocks | 153ec16bf017d83dd93dcdf28e9c8558c7689dc611555ac7c93b861c22059a3f |
| `igs20_2025055_G_LEIAR25.atx` | header, the GPS satellite antennas valid on the day, and the LEIAR25.R3 LEIT receiver antenna of `igs20.atx` | 38606d7e1efb8686f3195c168284f455875928336b155018def3f261a11c1cf5 |
| `brdc_2025055_G_0008.rnx` | header and GPS records 00:00-08:00 of the IGS daily merged broadcast file of 2025-02-24 (for RTKLIB's transmit-time computation, xval/ppp-parity Amendment 1) | 6f021bd319084c3beca7fdf290a00ce4d9fb2e6462e3af2103d6f0b64115479c |
| `itrf2020_wtzr_wtzz.ssc` | the WTZR and WTZZ rows of `ITRF2020_GNSS.SSC.txt` | b821c636f0e353a6a6f424dc457d801b9fc003f086c13da9679e91ec88aa89de |

Sources (retrieved 2026-10-12; SHA-256 as downloaded):
- https://igs.bkg.bund.de/root_ftp/IGS/obs/2025/055/WTZR00DEU_R_20250550000_01D_30S_MO.crx.gz,
  decompressed with hatanaka 2.8.1 (the pinned oracle toolchain): 7877415bd74b02ef2fbff91d347afcb72e30a412de8eb5880b5c981496b929aa (decompressed)
- https://igs.bkg.bund.de/root_ftp/IGS/obs/2025/055/WTZZ00DEU_R_20250550000_01D_30S_MO.crx.gz,
  decompressed likewise: d5ce52317f0b49595db0287b69633bccede70a88ab7831be530dbd60fb7dcdf4 (decompressed)
- https://igs.bkg.bund.de/root_ftp/IGS/products/2355/IGS0OPSFIN_20250550000_01D_05M_CLK.CLK.gz d19f3d45fb5a4f7a95e7131c1b9c363427d63fcb0f883e68311863cc7155993d
- https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2025/055/BRDC00IGS_R_20250550000_01D_MN.rnx.gz cc4dd3a22e71d085c0e2400f5e92812dbd7ec07b8e8fc4bec0c009c6116e896b
- https://files.igs.org/pub/station/general/igs20.atx 0cd58d0d9ee678d5586de6c01f576e5aceb86f4a0735a168f733dfd091c0a614
- https://itrf.ign.fr/ftp/pub/itrf/itrf2020/ITRF2020_GNSS.SSC.txt 16609ae9d6d5a9e2754f81ce3d617051bee218f04a9c682c96d61cba40354a88

The orbit file is shared with `../sp3_clock_igs_oracle/igs_2025055_G.sp3`.

Terms. Observations, clocks and `igs20.atx` are International GNSS Service (IGS) data and
products: per the IGS Data and Product Disclaimer and Terms of Use (5 August 2020; see
`../sp3_clock_igs_oracle/NOTICE.md` for its URL and SHA-256) they are "openly available for use
without restriction", with attribution to the IGS and its contributing organisations (here, the
station operator of WTZR and WTZZ and the IGS analysis centres). ITRF2020: please cite Altamimi,
Rebischung, Collilieux, Métivier and Chanard, "ITRF2020: an augmented reference frame refining the
modeling of nonlinear station motions", J. Geod. 97:47 (2023), and the ITRF2020 data set,
doi 10.18715/IPGP.2023.LDVIOBNL (IERS ITRS Center, IGN and IPGP), as the ITRF2020 page asks. The
EUREF products (EPN weekly SINEX, EUREF troposphere) are NOT included: a licence for them could
not be confirmed from a primary source on 2026-10-12, so the checks that use them are data-gated.
The cuts are included only for the test suite and are not part of the published crate.
