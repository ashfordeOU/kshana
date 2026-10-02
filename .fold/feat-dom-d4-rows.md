# D4 phase 1: proposed matrix rows and their records

Branch `feat/dom-d4`, base `main` at d127e3c. Nothing below has been applied to
`src/verification.rs`; the integrator pastes it. Every row's comparison was pre-registered by a
commit pushed before its fixture or oracle existed (the integrator's commit-and-push rule in place
of D2 tags). Kernel data throughout is United States government work (NASA Jet Propulsion
Laboratory, distributed by NAIF, the Navigation and Ancillary Information Facility).

Abbreviations: DAF, Double precision Array File; SPK, Spacecraft and Planet Kernel; PCK,
Planetary Constants Kernel; LLR, lunar laser ranging; VLBI, very long baseline interferometry;
TDB, barycentric dynamical time; ET, ephemeris time (SPICE's name for TDB seconds past J2000).

---

## Row 1 (new). NAIF kernel reader — outcome: PROMOTE

### Proposed `VerificationItem` (insert after "Lunar geodetic VLBI, kernel path")

```rust
        VerificationItem {
            requirement: "NAIF kernel reader: DAF container, SPK type 2 and binary PCK type 2",
            capability: "The engine's own pure-Rust reader of NAIF binary kernels (naif_kernel): the DAF container (both byte orders, linked summary records), SPK type-2 Chebyshev position segments chained through their centres to a lowest common ancestor, and binary PCK type-2 Euler-angle segments turned into a J2000-to-body rotation, with epochs taken as two-part ET so a sub-microsecond offset keeps its precision. It is what KernelEphemeris (ephem_provider) and the kernel paths of lunar_vlbi, lunar_llr and lunar_vlbi_fim read DE440 through. The claim is that it reads JPL kernels correctly; it is not a claim that DE440, or the engine's analytic Sun and Moon series, is accurate",
            module: "naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)",
            tests: "tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid (600 de440s.bsp states and 200 MOON_PA_DE440 rotations at 200 epochs 1849-2150 and random body pairs drawn from the pre-registration commit's own hash, against SPICE and ANISE on cut kernels bit-identical to NAIF's: worst difference 0.6 % of its bar, 1.95e-3 m absolute); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (the same on the full NAIF files, SHA-256 checked; data-gated); tests/naif_kernel_reader_check.rs (engineering guard, not evidence); naif_kernel::tests; ephem_provider::tests",
            oracle: "Two independent kernel readers on the same NAIF files: NAIF SPICE Toolkit N0067 (CSPICE through spiceypy 8.2.0, MIT; spkezr and pxform) and ANISE 0.10.6 (Nyx Space, MPL-2.0; Almanac.translate and Almanac.rotate), both run as separate programs on de440s.bsp and moon_pa_de440_200625.bpc. Pre-registered (abcd9133) before any fixture or oracle value existed: the grid seed is the first 16 hex digits of that commit's hash, so neither the 200 epochs nor the body pairs could be chosen with the result in view; each epoch also carries the Moon and the Sun relative to the Earth. Bars fixed in advance from double-precision Chebyshev evaluation (at most 15 coefficients, n^2 u = 2.5e-14 per evaluation, two evaluations and up to two hops per side): position 1e-13 R + 1e-5 m, velocity 1e-13 V + 1e-10 m/s, R and V the larger magnitude relative to the lowest common ancestor; rotation element 1e-13 W + 1e-15, W the coefficient sum of the covering record; ANISE adds 2 ns of relative motion for its nanosecond epochs. Result: every one of 600 states and 200 rotations inside its bar against both oracles, on the cut and on the full kernels; worst 6.0e-3 of the bar (position), 5.9e-3 (velocity), 3.7e-3 (rotation). Mutation: evaluating each record at -s fails 3597 comparisons. Disclosed: an earlier 25-epoch check against SPICE (4.6e-5 m, tests/naif_kernel_reader_check.rs) was seen before this row and is not its evidence; the fixture generator's first run aborted on an empty grid interval before producing any value and was corrected. Both sides read DE440, so agreement validates the reader, not the ephemeris",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

### Proposed `OracleBasisEntry`

```rust
        OracleBasisEntry {
            requirement: "NAIF kernel reader: DAF container, SPK type 2 and binary PCK type 2",
            basis: Library,
            oracle_test: "tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid",
            source: "NAIF SPICE Toolkit N0067",
            flag: "",
        },
```

### Record

| Item | Value |
|---|---|
| Pre-registration commit | `abcd913310d988c4ccb0babae9144ea53af2b1a5`, pushed 2026-10-02T15:40:37Z |
| Fixture/result commit | `2675a8d` |
| Oracles | CSPICE N0067 via spiceypy 8.2.0 (MIT); ANISE 0.10.6 Python (MPL-2.0) |
| Kernels | `de440s.bsp` c1c7feea…a49f2; `moon_pa_de440_200625.bpc` 60cd55aa…f768; `moon_de440_250416.tf` a47c71e9…f768; `naif0012.tls` 678e32bd…039b |
| Tolerance and source | position `1e-13 R + 1e-5 m`, velocity `1e-13 V + 1e-10 m/s`, rotation `1e-13 W + 1e-15`, ANISE `+2e-9 s x speed`, `+1e-12 m/s`, `+1e-14`; derived in the test header from double-precision Chebyshev evaluation |
| Result | 600/600 states, 200/200 rotations, both oracles, cut and full kernels. Worst ratio to bar 6.0e-3; worst absolute 1.95e-3 m (one ulp of an outer-planet barycentric position), 3.8e-12 rotation |
| Mutation | record evaluated at `-s` in `Chebyshev2::eval`: 3597 failures, both tests red; reverted |
| Disclosures | the seen 4.6e-5 m check; the generator's aborted first run (empty interval from the two-segment lunar kernel, no value produced); the toolchain was a minimal subset of `setup.sh` (spiceypy, ANISE, NumPy, SciPy, the NAIF files), later rebuilt on Python 3.12, and the fixture regenerated byte-identically |

---

## Row 2 (new). Surface-point covariance, kernel path (M070) — outcome: PROMOTE

The existing row 131 ("Lunar-surface-point coordinate covariance from a VLBI delay schedule,
kept distinct from the Earth-station one") runs on the analytic Moon and is NOT promoted (rule
5: a new method gets a new row). This is the kernel-path row beside it, as "Lunar geodetic VLBI,
kernel path" stands beside "Lunar geodetic VLBI".

### Proposed `VerificationItem` (insert after row 131)

```rust
        VerificationItem {
            requirement: "Lunar-surface-point coordinate covariance from a VLBI delay schedule, kernel path",
            capability: "The all-stations-fixed beacon covariance of the lunar-vlbi-fim scenario (every Earth station held, the beacon's Moon-body-fixed coordinates estimated alone) with the beacon placed on the JPL DE440 Moon read by the engine's own kernel reader (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Only the Moon centre differs from the analytic path; the IAU 2015 body rotation, stations, Earth rotation and linear algebra are the same. The validated outputs are the observation set, the 3 x 3 information spectrum, rank and condition number, the three body-fixed beacon sigmas and their RMS, the lever arm and the computed-over-equipartition ratio, on the default schedule. Runnable as the `lunar-vlbi-fim` scenario with datum = \"all-stations-fixed\", estimate_beacon = true and planetary_kernel_path set",
            module: "lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel",
            tests: "tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy (16 observations identical; rank 3/3; eigenvalues within 5.9e-5; condition 5.9e-5; beacon sigmas within 1.7e-3 against 1e-2; RMS 2.9e-5; lever arm 1.4e-8; P2 sigmas 3.9e-14 against 1e-9); lunar_vlbi_fim::tests",
            oracle: "Binding Library leg: NAIF SPICE Toolkit N0067 (spiceypy 8.2.0, MIT) on de440s, earth_latest_high_prec (ITRF93 with UT1 and polar motion) and the DE440 lunar frames, the beacon fixed in MOON_ME; every Jacobian row is a 3 km central difference of the converged Newtonian light-time difference (the M069 oracle's own light-time code, imported), never a Kshana partial; visibility rebuilt from WGS-84 elevations; NumPy 2.3.5 / SciPy 1.18.1 (BSD-3-Clause, LAPACK) eigh and inv. P2 leg: NumPy on the engine's committed Jacobian. Pre-registered (4a51256) before the fixture or oracle existed, with bars of 1 % on eigenvalues, condition, sigmas, RMS and ratio, 1e-4 on the lever arm, exact observation set and rank; P2 1e-9. Disclosed: the engine-only comparison of analytic and kernel Moon (3.9 % on the y sigma) was run before the pre-registration, to choose the kernel path, and is stated there. Result: both legs agree, worst 1.7e-3 (beacon y sigma 0.081211 m against 0.081351 m). Mutation: transposing the beacon partial's body rotation fails both legs. Both sides read DE440, so agreement validates the geometry and linear algebra on DE440, not DE440. Outside the claim: a real campaign's surface-point accuracy (clocks, troposphere and Earth orientation held fixed; illustrative stations and beacon site), and the analytic default path (row above, which stays MODELLED: on the analytic Moon the y sigma is 3.9 % below this oracle)",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
```

### Proposed `OracleBasisEntry`

```rust
        OracleBasisEntry {
            requirement: "Lunar-surface-point coordinate covariance from a VLBI delay schedule, kernel path",
            basis: Library,
            oracle_test: "tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy",
            source: "NAIF SPICE Toolkit N0067",
            flag: "",
        },
```

### Record

| Item | Value |
|---|---|
| Pre-registration commit | `4a51256ba7923fe0dbaf8d468c578e980516a02b`, pushed 2026-10-02T16:05:18Z |
| Engine commit | `a11d660` (before the pre-registration; engine-side only, no oracle) |
| Fixture/result commit | `43a2fcf` |
| Oracle | CSPICE N0067 via spiceypy 8.2.0 (MIT) + NumPy 2.3.5 / SciPy 1.18.1 (BSD-3-Clause), Python 3.12.3 |
| Tolerance and source | SPICE leg 1 % (M069's bars, above the estimated orientation, light-time and Earth-orientation differences, each below 0.1 %); lever arm 1e-4; P2 1e-9 (condition 1.3e5, `kappa epsilon` 3e-11) |
| Result | SPICE: eigenvalues 6.1799e-3 / 145.526 / 805.724 within 5.9e-5; sigmas 12.6929 / 0.081211 / 0.84104 m against 12.6932 / 0.081351 / 0.84159, worst 1.7e-3; P2 within 4e-14 |
| Mutation | `mat_vec(&transpose(&geom.icrf_to_moon), …)` in `jacobian_row`: guard red; with the guard removed for the experiment, SPICE leg y sigma 1.868 m against 0.0814 m; reverted |
| Disclosures | engine-side analytic-versus-kernel scan before the pre-registration; the Earth orientation kernel was the 2026-10-02 copy (54cdfdd1…, it changes upstream); the emitter's kernel path was made repository-relative after the pre-registration commit (an output field, not a comparison) |

### Proposed amendment to row 131 (old -> new, `oracle` text, appended sentence only)

Old ending: `…so this is a Cramér-Rao bound for a reduced parameter set and optimistic in its own right"`

New ending: `…so this is a Cramér-Rao bound for a reduced parameter set and optimistic in its own right. The same quantity on the kernel path (beacon on the DE440 Moon) is validated on its own row, \"…, kernel path\"; on this analytic path the smallest beacon sigma is 3.9 % below that row's SPICE oracle, which is why this row stays MODELLED"`

---

## Row 3. M078, LLR datum with the kernel Moon — outcome: diagnostic PASS; promotion is a founder decision

### What was done

`tests/validate_llr_datum_kernel_moon.rs`, pre-registered in `c51f8b2924488c78f5dc9d03123bc90200e31024`
(pushed 2026-10-02T15:50:38Z), before the 2015 kernel cut existed and before the engine's kernel
path for this scenario ran. Same quantities, same committed oracle (`reference.txt` of 6b27964a,
SPICE + NumPy), same 337 normal points, same bars (1 % sigmas and norms, 2 % condition and
ratios, exact bookkeeping, ranks and coupling). Only the Moon centre changes.

| Quantity | Analytic (seen, 6b27964a) | Kernel Moon | Bar |
|---|---|---|---|
| sigma tz | 1.025e-2 (OUTSIDE) | 4.87e-4 | 1e-2 |
| worst other sigma / norm | < 1e-2 | 4.52e-4 | 1e-2 |
| condition number | inside | 9.57e-4 | 2e-2 |
| worst across/along ratio | inside | 1.12e-3 (Luna 17) | 2e-2 |
| residual RMS (information) | 156,494 m | 95.1 m | none |

Mutation: making the kernel branch return the analytic Moon reproduced the original miss exactly
(tz 1.025e-2, OUTSIDE); reverted. The cut kernel (`bf1efa31…`) is bit-identical to `de440s.bsp`
over 4078 epochs, and `de440s.bsp` and the oracle's `de440.bsp` give identical Moon states (0 m).

Disclosures: the oracle values and normal points were already seen; the fix (kernel Moon) was
chosen after the miss, as the record had named it; the bar is unchanged. While making the
mutation, an uncommitted copy of the engine threading was reverted by mistake and re-applied
from the same patch before commit; the re-run gave the identical numbers.

### Founder decision needed (D1), with a proposal for each answer

* **If a diagnostic re-run on seen data may promote:** add a new row (rule 5; the default path
  stays analytic and keeps its MODELLED row):

```rust
        VerificationItem {
            requirement: "Lunar frame datum from a REAL observing campaign, kernel Moon centre",
            capability: "The lunar-llr-datum seven-parameter Helmert datum covariance on the same 337 archived ILRS normal points and measured weights, with the geocentric Moon centre read from JPL DE440 by the engine's own kernel reader (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Only the Moon centre differs from the analytic row; the IAU 2015 orientation, the absent polar motion and UT1, the catalogues, weights and linear algebra are the same",
            module: "lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel",
            tests: "tests/validate_llr_datum_kernel_moon.rs::llr_datum_with_kernel_moon_matches_spice_and_numpy_at_the_unchanged_bars; tests/validate_llr_datum_kernel_moon.rs::kernel_run_records_its_kernel_and_pins_its_headline",
            oracle: "The unchanged pre-registered SPICE + NumPy comparison of the analytic row (6b27964a: NAIF SPICE Toolkit N0067 two-way light times on DE440, ITRF93 and the DE440 lunar orientation with finite-difference partials; numpy 2.3.5 information matrix and inverse), re-run on the kernel path at the unchanged bars (1 % sigmas and norms, 2 % condition and ratios, exact bookkeeping, ranks and coupling), pre-registered as a diagnostic in c51f8b2. Every quantity holds: tz sigma 4.9e-4 (the analytic row's 1.025 % miss), worst 1.1e-3 (a 2 % ratio); residual RMS 95 m against the analytic 156,494 m. DISCLOSED: the oracle values and the 337 points were seen before this re-run, and the kernel Moon was chosen because the analytic run missed; promoted under the founder's rule of <date> that a named-cause re-run at an unchanged bar may promote. Both sides read DE440: this validates the covariance on DE440, not DE440",
            oracle_kind: ExternalDataset,
            status: Validated,
        },
        // OracleBasisEntry: basis Library, oracle_test
        // "tests/validate_llr_datum_kernel_moon.rs::llr_datum_with_kernel_moon_matches_spice_and_numpy_at_the_unchanged_bars",
        // source "NAIF SPICE Toolkit N0067".
```

* **If fresh normal points are required (D3):** add no row now. Re-run
  `tests/validate_llr_datum_kernel_moon.rs` unchanged on a fresh, pre-registered normal-point
  slice and its own SPICE reference; promote the row above only on that.

* **Either way, amend the analytic M078 row (old -> new), `oracle` text, last sentence:**
  - Old: `…The z-translation sigma is 1.03 % high against the pre-registered 1 % bar, most likely from the analytic Moon-centre series"`
  - New: `…The z-translation sigma is 1.03 % high against the pre-registered 1 % bar. A diagnostic re-run with only the Moon centre read from DE440 (pre-registered c51f8b2, seen data, unchanged bars) brings it to 0.049 % with every other quantity inside its bar, and the residual from 156,494 m to 95 m: the analytic Moon-centre series is the cause. This row, on the analytic default, stays MODELLED"`
  - and add `tests/validate_llr_datum_kernel_moon.rs` to its `tests` text.

---

## Rows not changed, and why

* **M107** ("Planet positions across the solar system from the JPL Standish Keplerian elements")
  and **M108** ("Positions of the Moon and seven major moons…"): not touched. `KernelEphemeris`
  can supply DE440 Sun, Mercury, Venus, Earth and Moon (and barycentres 1 to 9 by NAIF code), but
  a kernel-based planet row is a new method and therefore a new row; the Standish exceedance
  stays a published finding on M107. Proposal for the founder: a new row "Planet and Moon
  positions from the JPL DE440 kernel through KernelEphemeris", pre-registered against Horizons
  or SPICE; the moons (M108) need the satellite kernels (mar099, jup365, sat441) and SPK types 3,
  13 or 21, which this branch does not add.
* **M072/M075** (ephemeris dynamics) and **M089**: no action; founder's call, as the package says.
* **"Built-in analytic lunar ephemeris — its STATED ACCURACY BOUND checked against real data"**:
  unchanged; it validates the analytic series' own bound and remains true.
* **"Lunar geodetic VLBI, kernel path"**: unchanged (it already reads kernels through
  `naif_kernel`); its tests text may add the reader row's test as supporting evidence.

## Revisions to published numbers

None. No golden file, docs figure or existing test value changed. The analytic default reports of
`lunar-llr-datum` and `lunar-vlbi-fim` were compared byte for byte with `main` (see the changelog
entry). Kernel runs carry their own pins (`kernel_run_records_its_kernel_and_pins_its_headline`)
and record the kernel SHA-256 in a `moon_ephemeris` block that analytic runs do not emit.

## Remaining direct callers of the analytic series (phase 2 threading list)

`ephem::moon_position` / `sun_position` are still called directly from: lunar_datum,
lunar_ephemeris, lunar_frame, lunar_identifiability, lunar_llr_geometry, lunar_od,
lunar_orientation, lunar_perturbed, lunar_techniques, lunar_time, lunar_vlbi (analytic path;
its kernel path already reads DE440), precise_od, precise_products, propagator, space_weather,
tides. In phase 2, each VALIDATED row whose numbers touch these must be re-run at its unchanged
bar when the default switches.
