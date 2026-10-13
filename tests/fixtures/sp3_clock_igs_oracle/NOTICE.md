# sp3_clock_igs_oracle fixture

Cut on 2026-10-12 by `make_fixture.py` (its docstring gives the command) for
`tests/sp3_clock_igs_oracle.rs`; the comparison is pre-registered in `PREREGISTRATION.md`.

| File | Content | SHA-256 |
|---|---|---|
| `igs_2025055_G.sp3` | the IGS final orbit and clock combination of 2025-02-24 at 15 min, unchanged (the product carries GPS only) | b03ed39be4c8aba3c3f54d7e2c16fd23c8d67a110d9f58129c97303446ad4457 |
| `igs_2025055_G_nodes_mid.clk` | the header and the GPS satellite (`AS`) records of the IGS final 30 s clock combination of the same day at offsets 0 s and 450 s of each 15 min interval | 08cb9417c8d5c3c14613f597bd375ef41e3ad022c3656160462263b330303ca5 |

Sources (retrieved 2026-10-12 from the BKG mirror of the IGS archive; SHA-256 as downloaded):
- https://igs.bkg.bund.de/root_ftp/IGS/products/2355/IGS0OPSFIN_20250550000_01D_15M_ORB.SP3.gz 1cf41029236fea8666acea984fe6a85bd1bccc8c0c532db3248c760afafd2027
- https://igs.bkg.bund.de/root_ftp/IGS/products/2355/IGS0OPSFIN_20250550000_01D_30S_CLK.CLK.gz 75c1f896122b71c1b121c64f7a8a32485c417f2faafdd83bbcd911c0cda2582f

Terms: the products are those of the International GNSS Service (IGS), combined from its analysis
centres' solutions. The IGS Data and Product Disclaimer and Terms of Use (5 August 2020,
https://igs.org/wp-content/uploads/2020/09/IGS-Data-and-Product-Disclaimer-and-Terms-of-Use-200805.pdf,
SHA-256 7b4e253c24073af930c38ac65b30ae5208850c4a5681a0e2c6bbf388e72f8226, read 2026-10-12) state
that IGS data and products are "openly available for use without restriction" and "offered free
of cost or obligation", and ask users to cite and attribute them to the IGS and its contributing
organisations. That document names no Creative Commons licence. Acknowledgement: International
GNSS Service; Johnston, Riddell and Hausler, "The International GNSS Service", Springer Handbook
of Global Navigation Satellite Systems (2017), 967-982. The cuts are included only for the test
suite and are not part of the published crate.
