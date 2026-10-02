# joint_pvt_precise_itrf_rtklib_oracle fixture

Generated 2026-10-02 by `make_fixture.py` (its header gives the commands). Used by
`tests/joint_pvt_precise_itrf_rtklib_oracle.rs` together with the observation slice and the
broadcast slice of `../joint_pvt_dual_freq_itrf_rtklib_oracle/`.

| File | Content | SHA-256 |
|---|---|---|
| `com_2018133_GE.sp3` | GPS and Galileo orbit records (300 s) of the CODE MGEX final orbits `com20006`, `com20010`, `com20011`, 2018-05-12 21:00 to 2018-05-14 03:00 | acae14cfa90fc975b3da00e2af5ce3b458f4f5c08704a0bd66dc87eccba6765c |
| `com_2018133_GE.clk` | GPS and Galileo satellite clock records (`AS`) of the CODE MGEX final clocks at, and 30 s before, each 300 s epoch of 2018-05-13 | a0e079a6380d96f27d93a823f7321e4ea9592a02598d75f10cf5c97c6e45d05b |
| `igs14_2018133_GE_sat.atx` | the GPS and Galileo satellite antennas of `igs14.atx` valid on 2018-05-13 (offsets and labels; phase-centre variation rows dropped) | 5a0ff40db32a8bcc9d94212549af455f0440f7ad6a1ddcba0f239bd4740c1bdb |
| `P1C11805.DCB` | CODE monthly P1-C1 differential code biases, May 2018 (decompressed, unchanged) | e9096a504937bb577c28dc9f7f0c563afee6ccb242aef0234edc8c32741d77c8 |
| `rtklib_spp_precise.conf` | the RTKLIB `rnx2rtkp` configuration (single, dual-frequency, precise products) | 6f6f65b7700804600b5e5e9b4fb5e48a9cddf18d0effe43633abbda9dc21a0e1 |
| `rtklib_spp_precise.csv` | RTKLIB solutions and receiver clocks per epoch | cd4ac567a17a0d62e338571823a273c625cceb50bfd5931e8b1308cfdfb99be2 |

Sources (retrieved 2026-10-02; SHA-256 of the files as downloaded):
- https://igs.bkg.bund.de/root_ftp/IGS/products/mgex/2000/com20006.eph.Z d797a7f44d7a103dddc2e5a06bf991f8d163ecd80e46bd45ef7db8ea636f3693
- .../mgex/2000/com20006.clk.Z 7e053880d359cac60df803dec94839b364290770f89f49e1e8f92c26ed8ca847
- .../mgex/2001/com20010.eph.Z 2e92f400554484211c6007d315a108fa53fd853092604801bec5f0f80be91f9a
- .../mgex/2001/com20010.clk.Z e20a4fb5c13cd3b3c3c2e37dc69859d8937af3971830a7a56fdeaf2d72889b83
- .../mgex/2001/com20011.eph.Z db91b7021bc43afbbd6c82839bfdd5d1ebde63b4f7f7b70a19f0677ff5e5cc84
- .../mgex/2001/com20011.clk.Z 93c5bca34ef9034feb1eba7862ffd614f4718aa5b883ce534514d5340d5264db
- https://files.igs.org/pub/station/general/igs14.atx dace943a12ae87dc70c4e2a1811244bcc3054ce5f17504313309af923d023b5f
- https://www.aiub.unibe.ch/download/CODE/2018/P1C11805.DCB.Z 7e12b6d574fe0e1475fa644a0c070445469664458e9b6f2de8ff4777b7ae38af
  (the copy in the oracle data set, retrieved 2026-09-30)

The orbits, clocks and code biases are products of the Center for Orbit Determination in Europe
(CODE, Astronomical Institute of the University of Bern), distributed by the International GNSS
Service (IGS) Multi-GNSS Experiment through BKG Frankfurt; `igs14.atx` is the IGS antenna model.
Use follows the IGS data policy (https://igs.org/data-access/), which asks for acknowledgement of
the IGS and the contributing analysis centres; the CODE multi-GNSS solution is described in
Prange et al., "CODE's five-system orbit and clock solution: the challenges of multi-GNSS data
analysis", Journal of Geodesy 91, 345-360 (2017). The cuts are included only for the test suite and are not part of the
published crate.

Oracle tool: RTKLIB (https://github.com/tomojitakasu/RTKLIB, tag v2.4.2-p13, commit 71db0ffa,
BSD-2-Clause, copyright T. Takasu), run as a separate program; none of it is in the crate. In
single mode it reads `file-satantfile` but does not apply the satellite antenna offsets
(`postpos.c`: `setpcv` only when the mode is not single); see the test's header.
