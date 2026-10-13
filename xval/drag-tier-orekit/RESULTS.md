# Results: the NRLMSISE-00 drag tier against Orekit 12.2

First comparison run 2026-10-13 after the pre-registration (21647478), fixture committed unchanged
(54065ecc). Test: `tests/drag_tier_orekit_oracle.rs`.

| case | worst \|Δr\| (m) | worst \|Δv\| (m/s) | drag displacement over 24 h (m) | worst error / bar |
|---|---|---|---|---|
| L400 (low activity) | 0.0131 | 1.48e-5 | 3 329.5 | 0.003 |
| M400 (moderate) | 0.0046 | 4.98e-6 | 22 534.6 | 0.001 |
| H400 (high) | 0.0149 | 1.67e-5 | 64 305.9 | < 0.001 |
| M300 (moderate, 300 km) | 0.0303 | 3.36e-5 | 141 848.5 | < 0.001 |

**Bar 1: AGREES** on all 100 states (bar 0.5 m + 1e-3 of the drag displacement; velocity alike).
**Bar 2: met**: the M400 drag displacement at 24 h is 22.5 km, and the default exponential density
misses the Orekit state by 119.1 m (> 100 m).

Status: the opt-in NRLMSISE-00 drag tier is VALIDATED against Orekit's independent
NRLMSISE-00 drag at the orbit level, under the shared conventions stated in the
pre-registration (Earth rotation angle with UT1 = TT, local solar time UT + lon/15, constant
space weather). The model's accuracy against measured density is not covered. The GMAT leg was
not run.
