# Fixture: coverage and DOP maps against independent tools (full claim)

Used by `tests/coverage_dop_full_oracle.rs`. Generated 2026-10-02.

| File | Content | SHA-256 |
|---|---|---|
| `bodies.txt` | the engine's published body constants (gravitational parameter, radius, spin rate) for the Earth, Moon and Mars, written by the test on request; an input of the oracle | 8e00ccba4cfb1c41286f0410a6a29ded119a3bcf97cfe4b7ef4fd5db9515da81 |
| `designs.json` | the seven pre-registered designs (committed with the pre-registration) | b37d829dc1721295f6b4be217886cc1d19e6085334a6b71f0f5d6e02c3745130 |
| `elements_beidou.txt` | element sets built by the generator from the design (Walker definition, published preset values, explicit satellites) (`beidou`) | fac859588cdd368cf8c5d958f6d21d898eab72fa2cb85f8bb9b6cdabb49f03d1 |
| `elements_galileo.txt` | element sets built by the generator from the design (Walker definition, published preset values, explicit satellites) (`galileo`) | ed1f99a0eccebcf81f306b42ecb6292588696f359052e61651cd7d3198a24d3c |
| `elements_gnss-multi.txt` | element sets built by the generator from the design (Walker definition, published preset values, explicit satellites) (`gnss-multi`) | 67695a3a89fd2f39aeedb061ea7b7b527fb3f6a6397de8bc34b64836c7b59568 |
| `elements_gps-baseline.txt` | element sets built by the generator from the design (Walker definition, published preset values, explicit satellites) (`gps-baseline`) | f543b77bfa32d9cd439744980c50d63eec759debfa0d1c9f3cc44d5e3e9485ca |
| `elements_leo-scale.txt` | element sets built by the generator from the design (Walker definition, published preset values, explicit satellites) (`leo-scale`) | da2285264d0843b69145188f5259829427bc6f5a39b3bd95049f39fdeeebc8a4 |
| `elements_mars-two-systems.txt` | element sets built by the generator from the design (Walker definition, published preset values, explicit satellites) (`mars-two-systems`) | 606ea88f093d55d31bbbae6fd8342df3af1f4b08a247a1b8a87aed9e4640b1e4 |
| `elements_moon-multishell.txt` | element sets built by the generator from the design (Walker definition, published preset values, explicit satellites) (`moon-multishell`) | 9df934b3833f7dd007b4e498a46fd26fed58fc7aebed06f6ecad098214721c7a |
| `java/CoverageOracle.java` | Orekit driver: positions, ground tracks, elevation and azimuth stream | 8a67cc849bcd391f1afe856dc8c1f6ee383f22b3499c27016c0ac768ec735ff2 |
| `make_fixture.py` | generator: builds the elements, runs the Orekit driver, computes the maps (gnss_lib_py or numpy) | 8464bbed928c54586bdd5b3038ef1a212e063e0015ed6d9b0e43f33bf918c5ff |
| `maps_beidou.txt` | per-cell and global maps from Orekit angles and gnss_lib_py (common clock) or numpy (one clock per constellation) (`beidou`) | 8cb39e60334dcf408a01f21b336ae1f23992915bd7ed45a449c07564801fe916 |
| `maps_galileo.txt` | per-cell and global maps from Orekit angles and gnss_lib_py (common clock) or numpy (one clock per constellation) (`galileo`) | fc9a3db3d9b52da18675d9fa713b33231125c48372ad6b3fa27ced7187e53e2e |
| `maps_gnss-multi.txt` | per-cell and global maps from Orekit angles and gnss_lib_py (common clock) or numpy (one clock per constellation) (`gnss-multi`) | d5c9058a6b090232a9eb69df3112897b9cf427d248d589fde7910aea66cb6a17 |
| `maps_gps-baseline.txt` | per-cell and global maps from Orekit angles and gnss_lib_py (common clock) or numpy (one clock per constellation) (`gps-baseline`) | fd2a9c969c90db7f79c3b42939ff1655934da875e541aefb2705d509c89a273d |
| `maps_leo-scale.txt` | per-cell and global maps from Orekit angles and gnss_lib_py (common clock) or numpy (one clock per constellation) (`leo-scale`) | 37ba3ace834fe9e060f21149ffa06f3aa4d6cb96fe3f46de78e4213c8b264576 |
| `maps_mars-two-systems.txt` | per-cell and global maps from Orekit angles and gnss_lib_py (common clock) or numpy (one clock per constellation) (`mars-two-systems`) | 0f8b395e1cad31bbe636eda1904f38b9c48c8bb9e3d7fca3d6bcbba33a164957 |
| `maps_moon-multishell.txt` | per-cell and global maps from Orekit angles and gnss_lib_py (common clock) or numpy (one clock per constellation) (`moon-multishell`) | 116e8f1e843ed860b69c8d4dbe78a952b279a075fb8ca093700bbee9d3f86bb3 |
| `positions_beidou.txt` | Orekit 12.2 body-fixed positions at every epoch (`beidou`) | a6e61de01638977ef620a404b608426a63d1e04cdc9142c3ae5eb6097122e0bb |
| `positions_galileo.txt` | Orekit 12.2 body-fixed positions at every epoch (`galileo`) | fbb55ce5673478a4deed1ae3e632f6f9be4b6bda20d015234bb21edc159b37fe |
| `positions_gnss-multi.txt` | Orekit 12.2 body-fixed positions at every epoch (`gnss-multi`) | 49d75af3cfece08218945ae74d122c2e908bf7b7251dad91124da5ac50697e9d |
| `positions_gps-baseline.txt` | Orekit 12.2 body-fixed positions at every epoch (`gps-baseline`) | 23652fb9f42c88dd89a904bdab0c3893b1fbdf6a54d73f1c4ec057d444670e76 |
| `positions_leo-scale.txt` | Orekit 12.2 body-fixed positions at every epoch (`leo-scale`) | 91231d8cafc0aa3f2ae29fb2b0294359a660375771bc86cb533bdc9f491237d5 |
| `positions_mars-two-systems.txt` | Orekit 12.2 body-fixed positions at every epoch (`mars-two-systems`) | 2e5fbf3fde4948337dcebf71689a28616a81aabd50e3925e1e2ccc0cc44ef30d |
| `positions_moon-multishell.txt` | Orekit 12.2 body-fixed positions at every epoch (`moon-multishell`) | 81af151b06649f5918f8eccb42f604a260405c8188f9afeebbe35a327d0e8b30 |
| `tracks_beidou.txt` | Orekit 12.2 sub-satellite latitude and longitude of every emitted ground-track sample (`beidou`) | f22ad52e7cd6743c9cf149eef0eef26980deedf20992d2819433489954056138 |
| `tracks_galileo.txt` | Orekit 12.2 sub-satellite latitude and longitude of every emitted ground-track sample (`galileo`) | 836a78f1e4f8314b2a1f1f8b1b8ca5462a0ce0534b6f3e0739ebf7abd5080db9 |
| `tracks_gnss-multi.txt` | Orekit 12.2 sub-satellite latitude and longitude of every emitted ground-track sample (`gnss-multi`) | fee8f12c62354fdf6b3ba5265056714eed0abb5f9a9402a4d24e388e422a3b9a |
| `tracks_gps-baseline.txt` | Orekit 12.2 sub-satellite latitude and longitude of every emitted ground-track sample (`gps-baseline`) | fbdb2553c41a641ed34d43d681009eef22174b7f4fcd6eefbbe3f69e1d9e90ab |
| `tracks_leo-scale.txt` | Orekit 12.2 sub-satellite latitude and longitude of every emitted ground-track sample (`leo-scale`) | d264b28a383a5aab937121b1f528aa783f35a5df52861ec13b8124f75936afe8 |
| `tracks_mars-two-systems.txt` | Orekit 12.2 sub-satellite latitude and longitude of every emitted ground-track sample (`mars-two-systems`) | 15758260347cd236fa4bc1244edad1fc2ef414091e6a8e5aa18aadc0c9706eb2 |
| `tracks_moon-multishell.txt` | Orekit 12.2 sub-satellite latitude and longitude of every emitted ground-track sample (`moon-multishell`) | 34155a8cf79fc5623ccb6a96c44285fec550cd6797761504fa4e660b59a940df |

Oracles, each run as a separate program; no oracle code is vendored, only printed numbers:
- Orekit 12.2 (CS GROUP, Apache License 2.0, https://www.orekit.org) with Hipparchus 3.1
  (Apache License 2.0) on OpenJDK 21: `KeplerianPropagator`, `TopocentricFrame`,
  `OneAxisEllipsoid` (flattening 0).
- gnss_lib_py 1.0.4 (Stanford Navigation and Autonomous Vehicles Laboratory, MIT licence,
  https://github.com/Stanford-NavLab/gnss_lib_py), `gnss_lib_py.utils.dop.get_dop`.
- numpy 2.3.5 (BSD-3-Clause), `linalg.inv` and `linalg.matrix_rank` for one clock per
  constellation.
The GPS slot table (SPS Performance Standard 5th ed., 2020, Table 3.2-1) and the Galileo and
BeiDou preset values are inputs taken as the engine documents them, not re-derived.

Regenerate:
1. `KSHANA_WRITE_COVERAGE_INPUTS=1 cargo test --test coverage_dop_full_oracle write_body`
2. `source ~/Code/kshana-oracles/env.sh && $ORACLE_PY tests/fixtures/coverage_dop_full_oracle/make_fixture.py`
   (about 50 minutes on one core; a design name limits it to that design).
