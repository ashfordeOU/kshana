# Validation status

| Noise term | Status | Evidence |
|------------|--------|----------|
| White FM (short-term) | `validated` | `tests/calibration.rs`: simulated overlapping ADEV reproduces published sigma_y(1 s) to ~2%, and the white-FM curve sigma_y(tau)=sigma_y(1s)/sqrt(tau) across tau = 1, 10, 100 s to <25% (matches CSAC datasheet 3e-10 / 1e-10 / 3e-11). |
| Random-walk FM (long-term) | `validated` | `tests/calibration.rs`: simulated ADEV matches sigma_y^2(tau)=q_rw*tau/3 (Riley NIST SP 1065) to ~20% (seed-averaged). |
| Aging / linear drift | `modeled` + calibrated-out | Deterministic; the holdover estimator removes offset and aging via a quadratic predictor, so the residual is the stochastic limit. Tested in `src/estimator.rs` / `src/models.rs`. |
| Flicker FM (floor) | `not modeled` | The remaining honest gap. CSAC is white-FM-dominated across its datasheet range (1-1000 s), so flicker is below the validated region; the optical-clock systematic floor (~5e-17) is represented by its accuracy figure, not a flicker process. |

| Clock | sigma_y(1 s) | Source |
|-------|--------------|--------|
| csac-sa45s (CSAC)        | 3.0e-10 | Microchip SA65 / SA.45s datasheet |
| optical-soc (Sr lattice) | 1.0e-15 | ESA SOC space goal, arXiv:1503.08457 |

**Status: white FM and random-walk FM validated; aging modeled and calibrated-out; flicker not modeled.**

Maturity: the optical-clock figures are the ESA SOC *space goal* on ground hardware --
no strontium optical clock has flown. Laboratory Sr clocks reach 4.8e-17 (Oelker et al.
2019, Nature Photonics). CSAC figures are from a deployed commercial part.

Relations: Riley, NIST SP 1065, Eq. 67 -- white FM sigma_y^2(tau)=h0/(2 tau);
random-walk FM sigma_y^2(tau)=(2 pi^2/3) h_-2 tau, equivalently q_rw*tau/3 for a
frequency Wiener process of diffusion q_rw.
