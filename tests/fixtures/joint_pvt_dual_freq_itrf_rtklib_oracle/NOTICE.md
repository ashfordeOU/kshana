# joint_pvt_dual_freq_itrf_rtklib_oracle fixture

Generated 2026-10-01 by `make_fixture.py` (its header gives the commands). Files:

| File | Content | SHA-256 |
|---|---|---|
| `abmf_2018133_300s_GE_dual.rnx` | IGS station ABMF (Les Abymes, Guadeloupe; DOMES 97103M001), 2018-05-13, epochs every 300 s; GPS `C1C` `C2W`, Galileo `C1C` `C5Q` `C7Q` | 1449fcb7cd828926562797b245cae6818342eb309f906d7b7f3b5c06d23b9e9f |
| `brdc_2018133_G_Efnav.rnx` | GPS records and Galileo F/NAV records (clock for E1/E5a) issued on the hour, 2018-05-12 20:00 to 2018-05-14 02:59, with the station's `GPSA`/`GPSB` header records | 70e76ea7477b341df353019a32e7552e623190b0052115a500977c3426200de1 |
| `rtklib_spp_if.conf` | the RTKLIB `rnx2rtkp` configuration (single, dual-frequency ionosphere-free) | ae776a3216846a90180ee41882f3e751e83afd306fc62aa8d7e001e195b97010 |
| `rtklib_spp_if.csv` | RTKLIB solutions and receiver clocks per epoch | df3489455bc1784a61d1a1691e2aeff0aa5c098a1df450727cb7dd1d7d2af0fb |

Sources (retrieved again 2026-10-01 from https://igs.bkg.bund.de/root_ftp/IGS/; byte-identical to
the files used for `../joint_pvt_itrf_rtklib_oracle`, checked by SHA-256 in `make_fixture.py`):
- `obs/2018/133/ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz`,
  caacbbcc892123e382f126c2279f3e5902dd0e7fd302eded8902c21e416c71b1
- `BRDC/2018/133/BRDC00WRD_R_20181330000_01D_MN.rnx.gz`,
  83374f15e83bca3b6b79e211bc2846ac5fdf8517467c50ec3f8d0f6033a336f3
- `obs/2018/133/ABMF00GLP_R_20181330000_01D_GN.rnx.gz` (header lines only),
  a20785937dc5539460000ba77bf6a9de7eb8181f13142c7bf9703ff69b46eb64

Oracle tool: RTKLIB (https://github.com/tomojitakasu/RTKLIB, tag v2.4.2-p13, commit 71db0ffa,
BSD-2-Clause, copyright T. Takasu), run as a separate program; none of it is in the crate.

The GNSS observations and broadcast ephemerides are open data of the International GNSS Service
(IGS), distributed by BKG Frankfurt; the station is operated by IGN (Réseau GNSS Permanent). Use
follows the IGS data policy (https://igs.org/data-access/), which asks for acknowledgement of the
IGS and the contributing agencies. The slices are included only for the test suite and are not
part of the published crate. The truth coordinate is ABMF solution 4 of ITRF2020 (see
`../joint_pvt_itrf_rtklib_oracle/NOTICE.md`).
