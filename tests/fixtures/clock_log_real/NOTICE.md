# clock_log_real fixture

Cut on 2026-10-24 by `scripts/gen_clock_log_real_ref.py` (its docstring gives the command) for
`tests/clock_log_real_allantools.rs`; the comparison is pre-registered in `PREREGISTRATION.md`.

| File | Content | SHA-256 |
|---|---|---|
| `igs_clk_30s_2026214_G01_ABMF.clk` | the IGS final 30 s clock combination of 2026-08-02 (RINEX clock version 3.00 as published): the header verbatim, then the `AS G01` records (2880 at 30 s) and the `AR ABMF` records (288 at 300 s) in the file's order | 4db18396f4bc047eda6012445faff767dc8870fc634c2ca57eccbeb85d0b4e84 |
| `reference.json` | what the independent reader and allantools 2024.6 give for every case (the phase of the two vendored cases; for the others the SHA-256 of the reference phase and the curves) | generated |

Source (retrieved 2026-10-24 from the BKG mirror of the IGS archive; SHA-256 as downloaded):
- https://igs.bkg.bund.de/root_ftp/IGS/products/2430/IGS0OPSFIN_20262140000_01D_30S_CLK.CLK.gz 4bbf2002719d136dfb710f429dee3c050e2c42cdb97370edd32ab7279970b48f (text 93490a669466efd505218e1d25e8e571633bab99eb49e9e45fc2a381a265b998)

Terms: the product is that of the International GNSS Service (IGS), combined from its analysis centres'
solutions. The IGS Data and Product Disclaimer and Terms of Use (5 August 2020, see
`tests/fixtures/sp3_clock_igs_oracle/NOTICE.md` for its address and SHA-256) state that IGS data and
products are "openly available for use without restriction" and "offered free of cost or obligation", and
ask users to cite and attribute them to the IGS and its contributing organisations. That document names no
Creative Commons licence. Acknowledgement: International GNSS Service; Johnston, Riddell and Hausler,
"The International GNSS Service", Springer Handbook of Global Navigation Satellite Systems (2017), 967-982.
The cut is included only for the test suite and is not part of the published crate.

Not vendored, because no redistribution grant exists for them (see `docs/PROVENANCE.md` section 6): the
Stable32 `PHASE.DAT` series (D1) and the 5071A caesium series (D2) are fetched by `scripts/fetch_phasedat.sh`
and `scripts/fetch_cs5071a.sh`; the logs written from them are in the git-ignored `realdata-cache/`. The TICC
logs are measured clock data re-encoded into the counter's text layout by the generator; no real TICC
capture was found to use.
