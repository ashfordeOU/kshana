# Optical-clock measured ADEV oracle — provenance

This directory holds a **real measured optical-clock Allan-deviation curve** used by
`tests/optical_clock_adev_reference.rs` to validate the Kshana power-law noise fit
(`quantum_trade::qparams_from_adev_curve`) against an **independent, peer-reviewed
optical-clock measurement** — the optical analogue of the caesium `cs5071a` oracle.

## Measurement
- **Device under test:** an ⁸⁸Sr (strontium) optical-clock transition interrogated in
  an optical-tweezer array (JILA / NIST, Ye & Kaufman groups).
- **Quantity:** fractional-frequency **Allan deviation** σ_y(τ) versus averaging time τ,
  with asymmetric 1-σ standard-error bands (the paper's Fig. 4 stability data).
- **Curve:** 8 averaging times from τ = 0.92 s to 117.76 s; short-τ scaling ≈ 4.7×10⁻¹⁶/√τ.

## Oracle file (committed here)
- `stability_dat.csv` — the verbatim `stability_dat.csv` from the publication-data
  deposit (Fig. 4). Columns: `averaging time (s)`, `fractional Allan deviation`,
  `standard error (lower)`, `standard error (upper)`; one column per τ point.
  - sha256 `e67e3aed968dcbf2302fcd6e32663dbf69ad42b8ce27c50c8f6b62fa04556b2e`.

Unlike the redistribution-restricted Cs5071A phase series, this curve is published under
**CC-BY-4.0**, so the small fixture is vendored directly (no fetch gate required).

## Source & licence
- M. A. Norcia, A. W. Young, W. J. Eckner, E. Oelker, J. Ye, A. M. Kaufman,
  *"Seconds-scale coherence on an optical clock transition in a tweezer array,"*
  **Science 366, 93–97 (2019)**, doi:10.1126/science.aay0644.
- Publication data: Zenodo record 3382347, doi:**10.5281/zenodo.3382347**,
  licence **CC-BY-4.0** (Creative Commons Attribution 4.0 International), open access.

Cited under CC-BY-4.0 with attribution; not endorsed. Kshana is not affiliated with the
authors or institutions above.
