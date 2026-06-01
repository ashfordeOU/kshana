# Validation status

| Model | sigma_y(1 s) | Source | White-FM term | Flicker / RWFM / aging |
|-------|--------------|--------|---------------|------------------------|
| csac-sa45s (CSAC)        | 3.0e-10 | Microchip SA65 / SA.45s datasheet              | `validated` (ADEV test, ~2%) | `not modeled` |
| optical-soc (Sr lattice) | 1.0e-15 | ESA SOC space goal, arXiv:1503.08457           | `validated` (ADEV test, ~2%) | `not modeled` |

**Status: PARTIAL.** The white-FM term (which dominates short-term holdover) is
calibrated to the published `sigma_y(1 s)` via `q_wf = sigma_y(1 s)^2` and validated
empirically: `tests/calibration.rs` simulates each clock and confirms its overlapping
Allan deviation reproduces the published value to ~2%.

Not yet modeled: flicker floors, random-walk FM, and aging/drift. Treat long-term
(> ~1000 s) behavior as optimistic until those are added.

Maturity note: the optical-clock figures are the ESA SOC *space goal* on ground
hardware -- no strontium optical clock has flown. Laboratory Sr clocks reach
4.8e-17 (Oelker et al. 2019, Nature Photonics). The CSAC figures are from a
deployed commercial part.

Relations: Riley, NIST SP 1065, Eq. 67 -- white FM `sigma_y^2(tau) = h0 / (2 tau)`;
random-walk FM `sigma_y^2(tau) = (2 pi^2 / 3) h_-2 tau`.
