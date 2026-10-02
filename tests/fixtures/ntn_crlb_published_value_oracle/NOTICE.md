# Fixture for tests/ntn_crlb_published_value_oracle.rs

- `geometry.txt`: written by the test itself (`KSHANA_WRITE_NTN_FIXTURE=1 cargo test --test
  ntn_crlb_published_value_oracle write_geometry_fixture_on_request`) from
  `NtnScenario::geometry()` of the default `ntn-positioning` scenario; Kshana output, the
  oracle's input. The test checks the engine still produces it.
- `numpy_oracle.txt`: written by `make_fixture.py geometry.txt` with numpy 2.4.6 (BSD-3-Clause;
  `numpy.linalg.inv`, LAPACK), generated 2026-10-02.

Part A of the test needs no file: it cites the printed values of Bachl, Lei and Nabeel,
arXiv:2608.10270v1 (2026), whose PDF is not vendored (reading copy SHA-256
98fbdf38ceda54c5c2a5d0ec0cfa99a554d9c62f9e170aa9a223f276dae4870a, retrieved 2026-10-02 from
https://arxiv.org/pdf/2608.10270), and the SSB layout of 3GPP TS 38.211 section 7.4.3.1.
