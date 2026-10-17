<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Results: optical atmosphere (0.37), pre-registered bars A1 to A7

Bars are those of `PREREGISTRATION.md`, committed in fe5d5f35 before any implementation. None was
changed after a run. Oracle: `oracle.py` (mpmath 1.4.1, 30 digits), fixture
`tests/fixtures/optical_atmosphere/reference.txt`.

| Bar | Statement | Result | Verdict |
|---|---|---|---|
| A1 | Rytov variance, relative error <= 1e-6 | worst 3.4e-7 over 216 points (HV 5/7 and two variants, 850/1064/1550 nm, zenith 0/30/60/75 deg, two station heights, plane up/down and spherical) | MET |
| A2 | Scintillation, aperture factor, gamma-gamma fade probability | worst 4.5e-16 (16 points), 5.7e-16 (36 points), 1.3e-12 in log10 (96 points) | MET |
| A3 | Cloud and clear-air optical depth, relative error <= 1e-12 | worst 3.6e-16 (12 points), 6.6e-16 (24 points) | MET |
| A4 | Diversity limits and monotonicity | rho = 0 and rho = 1 worst 0; zero monotonicity violations | MET (see note 1) |
| A5 | Link budget and default network bit-identical to 5eac3b61 | digest fb00c966de4299bc at the base commit and now | MET |
| A6 | Holdover coupling bit for bit | 324 comparisons identical | MET |
| A7 | Native and wasm byte-identical | source half only: no non-portable libm call in the new modules (test passes); `cargo check` for wasm32 is a push gate. The native-versus-wasm byte comparison has not been run here | PARTIAL: execution half NOT RUN |

Scope notes:

- A2's fade-probability points are the A1 subset with station height 0, HV 5/7, downlink, at the
  three wavelengths and four zenith angles, plane and spherical (24 cases, four fade depths each).
  A4's "single-site availability" at rho = 1 is checked on identical sites; for unequal sites the
  limit is the best single site, also checked.
- The A1 statement lists "the ground-level/wind parameter sweep"; the grid uses (A, v) of
  (1.7e-14, 21), (5e-14, 21) and (1.7e-14, 30) m/s.

Findings:

1. **A4, first run: not met, then met after fixing an implementation defect.** The first run of A4
   found 2 violations of monotonicity in the number of sites and 1 in the correlation, each of
   order 3e-9, for a network containing a 0.99-availability site. Cause: the normal CDF used,
   `detection::normal_cdf`, is the Abramowitz and Stegun 7.1.26 form with a 1.5e-7 absolute error.
   The model was changed to the incomplete-gamma CDF and bisection quantile of `raim.rs`; the bar
   was not touched. This also removed the same 1.5e-7 error from the log-normal outage statistics.
2. **A scintillation formula in a widely read survey differs from Andrews and Phillips**: the
   survey prints the second term's exponent as 7/6; the implementation uses 5/6. The oracle
   evaluates the same 5/6 form, so A2 does not test that choice. It is recorded in the ledger row.

Nothing in these results is an external-oracle comparison of the atmosphere. No row is VALIDATED.
