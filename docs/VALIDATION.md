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

## Pack 2 — inertial dead-reckoning (quantum-IMU)

| Term | Status | Evidence |
|------|--------|----------|
| Constant/residual bias -> position | `validated` | pos error = 0.5*b*T^2 family (Groves AESS Tutorial); hand-derived discrete test in `src/inertial.rs`. |
| Velocity random walk (white accel) | `validated` | `src/inertial.rs`: simulated position-error SD matches sigma_x(T)=sqrt(S_a*T^3/3) (Groves eq.54) to ~12% (seed-averaged). |
| Bias instability (slow drift), scale factor, gyro/ARW | `not modeled` | Residual bias is modeled as a constant at the published bias-stability level; finer bias-instability dynamics and rotation are future work. |

| Sensor | bias stability | noise root-PSD | Source |
|--------|----------------|----------------|--------|
| cold-atom-quat (quantum) | 5.88e-7 m/s^2 (60 ng, 24 h) | 22 ug/sqrtHz = 2.16e-4 (m/s^2)/sqrtHz | Templier et al. 2022, Science Advances (arXiv:2209.13209) |
| nav-grade-quartz (classical) | 1.57e-3 m/s^2 (~160 ug) | ~20 ug/sqrtHz = 1.96e-4 (m/s^2)/sqrtHz | Honeywell QA-2000 / Groves AESS Tutorial |

Honest framing: the cold-atom advantage is **long-term bias stability** (~2600x lower), which dominates a long GNSS outage via 0.5*b*T^2. Short-term noise is comparable (quantum ~22 vs classical ~20 ug/sqrtHz) — the quantum sensor wins the marathon, not the sprint. Maturity: cold-atom accelerometers are laboratory/early (JRC122785), navigation-grade quartz is deployed.

## Pack 3 — time transfer (optical vs RF, maps to ESA OpSTAR)

| Term | Status | Evidence |
|------|--------|----------|
| White timing jitter -> sync precision | `validated` | `src/timetransfer.rs`: simulated sync RMS reproduces the link jitter sigma_j; sample-mean averages as sigma/sqrt(N) to <20% (seed-averaged). |
| Timing -> one-way ranging | `validated` | range = c * dt, c=299792458 m/s; 1 ps = 0.299792458 mm (exact, hand-derived test). |
| Flicker/TDEV floor, two-way reciprocity residual | `not modeled` | Jitter is modeled as white; long-averaging floors and reciprocity residuals are future work. |

| Link | single-sample jitter | type | source |
|------|---------------------|------|--------|
| optical-isl-opstar | 1 ps (1e-12 s) | OpSTAR on-orbit TARGET | ESA FutureNAV OpSTAR (OHB/DLR); lab O-TWTFT ~1 fs (Giorgetta 2013 / Deschenes 2016) |
| twstft-rf | 0.5 ns (5e-10 s) | measured single-session | BIPM/PTB/NIST TWSTFT |

Honest framing: the optical figure is OpSTAR's stated picosecond on-orbit TARGET (not flown). The terrestrial optical lab floor is ~1 fs (far better); a well-engineered microwave link (ACES MWL, ~0.3 ps) can rival optical, so the "RF = 0.5 ns" baseline is specifically ordinary TWSTFT. Ranging conversion is one-way (range = c*dt); two-way/round-trip halves it (range = c*dt/2).
