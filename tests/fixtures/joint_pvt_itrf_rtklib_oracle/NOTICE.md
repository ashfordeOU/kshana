# joint_pvt_itrf_rtklib_oracle fixture

Generated 2026-10-01 by `make_fixture.py` (its header gives the commands). Files:

- `abmf_2018133_300s_GE_C1C.rnx`: a slice of the IGS station ABMF (Les Abymes, Guadeloupe; DOMES
  97103M001) observation file for 2018-05-13: epochs every 300 s, GPS and Galileo satellites, the
  `C1C` observable only. Source: `ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz`,
  https://igs.bkg.bund.de/root_ftp/IGS/obs/2018/133/, retrieved 2026-10-01, SHA-256
  caacbbcc892123e382f126c2279f3e5902dd0e7fd302eded8902c21e416c71b1.
- `brdc_2018133_G_Einav.rnx`: the GPS records and the Galileo I/NAV records issued on the hour,
  2018-05-12 20:00 to 2018-05-14 02:59, of the IGS/BKG combined broadcast navigation file
  `BRDC00WRD_R_20181330000_01D_MN.rnx.gz`, https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2018/133/,
  retrieved 2026-10-01, SHA-256 83374f15e83bca3b6b79e211bc2846ac5fdf8517467c50ec3f8d0f6033a336f3.
  The `GPSA`/`GPSB` ionospheric header records are copied from the station's own GPS navigation
  file `ABMF00GLP_R_20181330000_01D_GN.rnx.gz` (same directory as the observations), SHA-256
  a20785937dc5539460000ba77bf6a9de7eb8181f13142c7bf9703ff69b46eb64, because the combined file
  carries none.
- `rtklib_spp.conf`, `rtklib_spp.csv`: the RTKLIB v2.4.2-p13 `rnx2rtkp` configuration and its
  single-point solutions and receiver clocks on the two slices above. RTKLIB
  (https://github.com/tomojitakasu/RTKLIB, tag v2.4.2-p13, commit 71db0ffa, BSD-2-Clause,
  copyright T. Takasu) was run as a separate tool; none of it is in the crate.

The truth coordinate in the test is ABMF solution 4 of ITRF2020 (`ITRF2020_GNSS.SSC.txt`, IGN,
https://itrf.ign.fr/ftp/pub/itrf/itrf2020/ITRF2020_GNSS.SSC.txt, SHA-256
16609ae9d6d5a9e2754f81ce3d617051bee218f04a9c682c96d61cba40354a88; free use with citation:
Altamimi, Rebischung, Collilieux, Métivier and Chanard, ITRF2020, J. Geod. 97:47, 2023).

The GNSS observations and broadcast ephemerides are open data of the International GNSS Service
(IGS), distributed by BKG Frankfurt; the station is operated by IGN (Réseau GNSS Permanent). Use
follows the IGS data policy (https://igs.org/data-access/), which asks for acknowledgement of the
IGS and the contributing agencies. The slices are included only for the test suite and are not
part of the published crate.
