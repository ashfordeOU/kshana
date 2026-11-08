<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C3: the CAPSTONE NRHO with a corrected force model: readings and record

The pre-registration is `docs/design/evidence/c3-capstone-nrho-force-model/PREREGISTRATION.md`, signed off on
3 November 2026. MODELLED. The Horizons reconstruction is the reference, not truth.

## Steps so far

| Step | What | Record |
|---|---|---|
| 2 | M1 and M2 (`src/c3_force.rs`), tested on synthetic data only: with the kernel off the model is A2 bit for bit (accelerations and a 6 h propagation); the radiation term matches its closed form and is zero in the Earth's and the Moon's umbra | `tests/c3_force.rs`, commit `50040cbca` |
| 3 | **Control.** The A2 model, built as `C3Model::a2`, re-run on W0 (sample 145 of the committed A2 fixture): end position 136 822.881 m, periapsis radius 28 371.817 m. The recorded A2 numbers are 136 822.881 m and 28 371.817 m. **Reproduced**; the campaign goes on | `control_the_a2_model_reproduces_its_recorded_miss_on_w0` (gated, `KSHANA_C3_CONTROL=1`) |
| 4a | F and `de440s.bsp` fetched by `fetch_data.sh` on 8 November 2026. F has 2 137 states, 2023-04-01 00:00 to 2023-06-29 00:00 TDB-stamped, the whole span requested. The kernel matches the SHA-256 already recorded in `tests/fixtures/porkchop_de440/NOTICE.md`. Neither file is vendored; `FETCHED.txt` holds the URLs, the retrieval time and the hashes. Nothing in F was read beyond the row count and the first and last epoch | `fetch_data.sh`, `FETCHED.txt` |

## Readings, fixed before the manoeuvre test is run on F

1. **The manoeuvre test** is A2's Amendment 2 rule with M1 as the model: hour `i` (from sample `i` to `i + 1`) is a
   manoeuvre hour if M1, started from sample `i` with its epoch, misses sample `i + 1` by more than 100 m. M1 uses
   GL0660B to degree and order 150, DE440 orientation, the relativistic term, the tolerances of A2, and the DE440
   Sun, Earth, Venus and Jupiter system barycentre from `de440s.bsp`.
2. **Windows.** A run is a maximal sequence of consecutive samples with no manoeuvre hour between any two of them.
   Each run of at least 157 samples gives **one** window: its first 157 samples (A2's rule took the start of the
   first such run). The windows are taken in time order: E is the first, H1 the second, H2 the third. A run is not
   cut into several windows. Fewer than three such runs means fewer windows, scored as the pre-registration says.
3. **Committed before any 156-hour propagation in F:** the list of manoeuvre hours, the run lengths and the window
   start indices, in `windows.json`.
4. **Estimation of `k` (step 5)** is on E only, as written: golden-section search on [0, 0.1] m²/kg to 1e-5,
   minimising the sum of squared 3-D position differences at E's 156 hourly samples after the first, M2 propagated
   from E's first state. `k` is committed before H1 or H2 is propagated.
